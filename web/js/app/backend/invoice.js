/**
 * Codigo fuente generado por el SGArqBase: Plataforma de construcción de Sistemas.
 *
 * @package    SGArqBase
 * @subpackage invoice
 * @author     MSc. Donel Vázquez Zambrano
 * @version    1.0.0
 */

InvoiceApp = function() {
    return {
        init : function(InvoiceApp) {
            
            this.store = new Ext.data.GroupingStore({
                url: config.app_host + '/invoice/request/method/load',
                baseParams:{
                    component: 'grid',
                    entityid: config.app_entityid,
                    start: 0,
                    limit: config.app_elementsongrid
                },
                reader: new Ext.data.JsonReader(),
                listeners: {
                    load: config.app_showmessageonstoreloadsuccessful ? loadStoreSuccessful : function(store, records) {           
                        alertNoRecords(records, bundle.getMsg('invoice.tab.label').toLowerCase());
                    },
                    loadexception: config.app_showmessageonstoreloadfailed ? loadStoreFailed : Ext.emptyFn
                }
            });
            
            this.comboStore = new Ext.data.Store({
                url: config.app_host + '/invoice/request/method/load',
                baseParams:{
                    entityid: config.app_entityid,
                    component: 'combo'
                },
                reader: new Ext.data.JsonReader(),
                listeners: {
                    load: config.app_showmessageonstoreloadsuccessful ? loadStoreSuccessful : function(store, records) {           
                        alertNoRecords(records, bundle.getMsg('invoice.tab.label').toLowerCase());
                    },
                    loadexception: config.app_showmessageonstoreloadfailed ? loadStoreFailed : Ext.emptyFn
                }
            });

            this.selectedTaxesComboStore = new Ext.data.Store({
                url: config.app_host + '/invoice/request/method/load',
                reader: new Ext.data.JsonReader()
            });
            
            this.filters = new Ext.ux.grid.GridFilters({
                encode: true,
                local: false,
                menuFilterText: bundle.getMsg('app.languaje.find.label'),
                filters: [{
                    type: 'string',
                    dataIndex: 'code'
                },{
                    type: 'string',
                    dataIndex: 'name'
                },{
                    type: 'string',
                    dataIndex: 'comment'
                }]
            });
            
            this.expander = new Ext.ux.grid.RowExpander({
                enableCaching : false,
                tpl : new Ext.Template('\
                    <div style="width:100%;" class="x-grid3-row x-grid3-row-alt x-grid3-row-collapsed x-grid3-row-last">\
                       <table border="0" cellspacing="0" cellpadding="0" style="width:100%;" class="x-grid3-row-table">\
                          <tbody>\
                             {details}\
                          </tbody>\
                       </table>\
                    </div>')
            });
            
            this.infoTextItem = new Ext.Toolbar.TextItem('');
            
            this.gridPanel = new Ext.grid.GridPanel({
                id: 'gridPanelInvoice',
                region:'center',
                layout: 'fit', 
                iconCls: Ext.ux.Icon('tag_orange'),
                title: config.app_showgridtitle ? bundle.getMsg("invoice.grid.title") : '',
                autoExpandColumn: 'invoicecolname',
                store: this.store,
                loadMask: true,
                tools: [{
                    id:'print',
                    qtip: bundle.getMsg('app.languaje.report.printview'),
                    handler: function() {
                        App.printView(window['InvoiceApp'].gridPanel);
                    }
                },{
                    id:'help',
                    qtip: bundle.getMsg('app.layout.help'),
                    handler: function(button, eventObject) {
                        //window.open(config.app_host + '/uploads/tutorial/page.html');
                    }
                }],
                keys: [panelKeysMap],
            
                listeners: {
                    activate: function(gridpanel){
                        gridpanel.getStore().load({
                            entityid: config.app_entityid
                        });
                    },
                    rowclick : function(grid, rowIndex, eventObject) {
                        var selectionModel = grid.getSelectionModel();
                        App.selectionChange(selectionModel);
                    },
                    rowdblclick : function(grid, rowIndex, eventObject) {
                        if(grid.updateBtn && !grid.updateBtn.disabled && !grid.updateBtn.hidden)
                            grid.updateBtn.fireEvent('click', grid.updateBtn);
                    },
                    filterupdate: function(){
                        var text = App.getFiltersText(window['InvoiceApp'].gridPanel);
                        if(text && text!=''){
                            Ext.fly(window['InvoiceApp'].infoTextItem.getEl()).update(String.format(bundle.getMsg('app.form.filteringby'), text));
                            window['InvoiceApp'].infoTextItem.getEl().highlight('#FFFF66', {
                                block:true
                            });
                        }
                        else
                            Ext.fly(window['InvoiceApp'].infoTextItem.getEl()).update('');
                    }
                },
                
                columns: [this.expander, {
                    header: bundle.getMsg('comprobant.field.creationdate'), 
                    width: 30, 
                    sortable: true, 
                    dataIndex: 'Comprobant',
                    renderer: function(value) {
                        if(value)
                            return value.creationdate;
                        return '';
                    }
                },{
                    header: bundle.getMsg('contract.field.name'),
                    width: 25, 
                    sortable: true, 
                    dataIndex: 'Comprobant',
                    renderer: function(value) {
                        if(value)
                            return value.name;
                        return '';
                    }
                },{
                    header: bundle.getMsg('contract.field.label'),
                    width: 25, 
                    sortable: true, 
                    dataIndex: 'Contract',
                    renderer: function(value) {
                        if(value)
                            return value.Event.name;
                        return '';
                    }
                },{
                    id:'invoicecolname', 
                    header: bundle.getMsg('comprobant.field.comment'), 
                    width: 160, 
                    sortable: true, 
                    dataIndex: 'Comprobant',
                    renderer: function(value) {
                        if(value)
                            return value.comment;
                        return '';
                    }
                }],
                
                view: new Ext.grid.GroupingView({
                    markDirty: false,
                    forceFit:true,
                    groupTextTpl: '{text} ({[values.rs.length]} {[values.rs.length > 1 ? bundle.getMsg("app.form.elements") : bundle.getMsg("app.form.element")]})'
                }),
                
                plugins: [this.expander, this.filters],
                
                stripeRows: true,			
                tbar: [{
                    text: bundle.getMsg('app.form.add'),
                    iconCls: Ext.ux.Icon('add'),
                    ref: '../addBtn',
                    listeners: {
                        click: function(button, eventObject, hideApply, callback) {
                            window['InvoiceApp'].gridPanel.getSelectionModel().clearSelections();
                            window['InvoiceApp'].gridPanel.updateBtn.fireEvent('click', button, eventObject, hideApply, callback);
                        }
                    }
                },{
                    ref: '../updateBtn',
                    text: bundle.getMsg('app.form.info'),
                    disabled: true,
                    iconCls: Ext.ux.Icon('information'),
                    listeners: {
                        click: function(button, eventObject, hideApply, callback) {
                            App.mask.show();
                            
                            var finalFn = function(){
                                window['InvoiceApp'].formPanel.tabPanel.getBottomToolbar().hide();
                                
                                var record = window['InvoiceApp'].gridPanel.getSelectionModel().getSelected();
                                if (record){
                                    window['ContractApp'].comboStore.load({
                                        params:{
                                            filter: '[{"type":"string","value":"'+record.get('Contract').Event.name+'","field":"name"}]'
                                        },
                                        callback: function(records, options, success ){
                                            var taxes = record.get('InvoiceTaxRelation');
                                            for (var i = 0; taxes && i < taxes.length; i++){
                                                var index = window['TaxApp'].comboStore.find('id', taxes[i].taxid);
                                                if (index > -1){   
                                                    var currentrecord = window['TaxApp'].comboStore.getAt(index);
                                                    
                                                    currentrecord.set('amount', taxes[i].amount);
                                                    var percent = '%';
                                                    if(taxes[i].fixed)
                                                        percent = '';
                                                    currentrecord.set('amounttext', taxes[i].amount+percent);
                                                    currentrecord.set('fixed', taxes[i].fixed);
                                                    currentrecord.set('currencyid', taxes[i].currencyid);
                                                    
                                                    index = window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.store.find('id', taxes[i].currencyid);
                                                    if (index > -1)
                                                        currentrecord.set('currency',  window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.store.getAt(index).get('code'));
                                                    
                                                    window['InvoiceApp'].selectedTaxesComboStore.add(currentrecord);
                                                }
                                            }
                                    
                                            record.set('name', record.get('Comprobant').name);
                                            record.set('comment', record.get('Comprobant').comment);
                                            
                                            window['InvoiceApp'].contractRecord = records[0];
                                            window['InvoiceApp'].formPanel.getForm().loadRecord(record);
                                            
                                            
                                            
                                            
                                            window['InvoiceApp'].formPanel.tabPanel.generalPanel.contractCombo.setRawValue(record.get('Contract').Event.name);
                                            window['InvoiceApp'].showContractInfo(window['InvoiceApp'].contractRecord);
                                            
                                            // this cant be before window['InvoiceApp'].showContractInfo
                                            window['InvoiceApp'].formPanel.tabPanel.productsPanel.store.removeAll();
                                            var products = Ext.decode(record.get('products'));
                                            console.log('products', products);
                                            for(var j = 0; products && j < products.length; j++){
                                                
                                                var r = window['ProductApp'].comboStore.getAt(window['ProductApp'].comboStore.find('id', products[j].id, 0, true, true));	
                                                window['InvoiceApp'].formPanel.tabPanel.productsPanel.store.add(new Ext.data.Record(products[j]));
                                            }
                                            window['InvoiceApp'].formPanel.tabPanel.productsPanel.reconfigure(window['InvoiceApp'].formPanel.tabPanel.productsPanel.getStore(), window['InvoiceApp'].formPanel.tabPanel.productsPanel.getColumnModel());
                                            
                                            
                                            App.mask.hide();
                                        }
                                    }); 
                                }
                                else{
                                    window['InvoiceApp'].formPanel.getForm().reset();
                                    App.mask.hide();
                                }
                                window['InvoiceApp'].showWindow(button.getEl(), hideApply, callback);
                            };
                            syncLoad([
                                window['TaxApp'].comboStore,
                                window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.store
                            ], finalFn);
                        }
                    }
                },{
                    ref: '../removeBtn',
                    text: bundle.getMsg('app.form.delete'),
                    disabled: true,
                    iconCls: Ext.ux.Icon('delete'),
                    listeners: {
                        click: function(button, eventObject, callback) {
                            Ext.defer(function(){
                                Ext.Msg.show({
                                    title: bundle.getMsg('app.msg.warning.title'),
                                    msg: bundle.getMsg('app.msg.warning.deleteselected.text'),
                                    buttons: Ext.Msg.YESNO,
                                    fn: function(btn, text){
                                        if (btn == 'yes'){											
                                            var records = window['InvoiceApp'].gridPanel.getSelectionModel().getSelections();
                                            
                                            var array = new Array();                                
                                            for (var i=0; i<records.length; i++)
                                                array.push(records[i].get('id'));
                                                
                                            new Ext.data.Connection().request({
                                                url: config.app_host + '/invoice/request/method/delete',
                                                params: {
                                                    ids: Ext.encode(array)
                                                },
                                                failure: requestFailed,
                                                success: requestSuccessful,
                                                callback : function(options, success, response) {
                                                    var object = Ext.decode(response.responseText);
                                                    if(object.success){
                                                        window['InvoiceApp'].store.load({
                                                            params:{
                                                                start: window['InvoiceApp'].gridPanel.getBottomToolbar().cursor
                                                            }
                                                        });                                                    
                                                        if(callback){
                                                            if(callback.fn)
                                                                callback.fn(callback.params);
                                                            else
                                                                callback();
                                                        }
                                                    }
                                                    else
                                                        requestFailed(response, false);
                                                    
                                                }
                                            });
                                        }
                                    },
                                    animEl: 'elId',
                                    icon: Ext.MessageBox.QUESTION
                                });
                            }, 100, this);
                        }
                    }
                },'->', {
                    ref: '../printBtn',
                    text: bundle.getMsg('contract.action.generatedocument'),
                    disabled: true,
                    iconCls: Ext.ux.Icon('page_white_text'),
                    listeners: {
                        click: function(button, eventObject) {
                            var record = window['InvoiceApp'].gridPanel.getSelectionModel().getSelected();
                            
                            showValueForm('InvoiceApp', new Ext.form.ClearableCombo({
                                store: new Ext.data.Store({
                                    url: config.app_host + '/currency/request/method/load',
                                    baseParams:{
                                        component: 'combo'
                                    },
                                    reader: new Ext.data.JsonReader(),
                                    listeners: {
                                        load: config.app_showmessageonstoreloadsuccessful ? loadStoreSuccessful : function(store, records) {           
                                            alertNoRecords(records, bundle.getMsg('currency.tab.label').toLowerCase());
                                        },
                                        loadexception: config.app_showmessageonstoreloadfailed ? loadStoreFailed : Ext.emptyFn
                                    }
                                }),
                                valueField: 'id', 
                                displayField: 'code',
                                typeAhead: true,
                                forceSelection: true,
                                mode: 'local',
                                triggerAction: 'all',
                                selectOnFocus:true,
                                fieldLabel: bundle.getMsg('currency.field.label')+'<span style="color:red;"><sup>*</sup></span>', 
                                emptyText: bundle.getMsg('app.form.select'),
                                allowBlank: false,
                                triggerConfig: {
                                    tag:'span', 
                                    cls:'x-form-twin-triggers', 
                                    style:'padding-right:2px',
                                    cn:[{
                                        tag: "img", 
                                        src: Ext.BLANK_IMAGE_URL, 
                                        cls: "x-form-trigger"
                                    }]
                                },
                                anchor:'-20',
                                listeners: {
                                    focus: function(combo) {
                                        if(!combo.readOnly && !combo.disabled){
                                            combo.getStore().load();
                                        }
                                    }
                                }
                            }), function(form){
                                var value = form.items.items[0].getValue();
                                App.mask = new Ext.LoadMask(Ext.getBody(), {
                                    msg: bundle.getMsg('app.layout.loading')+'...'
                                });
                                console.log('value', value);
                                App.mask.hide();
                                                                
                                var url = '/invoice/report/id/'+record.get('id')+'/entityid/'+config.app_entityid+'/currencyid/'+value;
                                App.printView(url, ' ', ' ');
                                
                            },  Ext.getBody());
                                    
                        }
                    }
                }],
                
                bbar: new Ext.PagingToolbar({
                    pageSize: parseInt(config.app_elementsongrid),
                    store: this.store,
                    plugins: [new Ext.ux.ProgressBarPager(), this.filters],
                    items: [{
                        tooltip: bundle.getMsg('app.form.clearfilters'),
                        iconCls: Ext.ux.Icon('table_lightning'),
                        handler: function () {
                            window['InvoiceApp'].gridPanel.filters.clearFilters();
                            Ext.fly(window['InvoiceApp'].infoTextItem.getEl()).update('');
                            window['InvoiceApp'].gridPanel.getSelectionModel().clearSelections();
                        } 
                    },'-', this.infoTextItem],
                    displayInfo: true,
                    displayMsg: bundle.getMsg('app.form.bbar.displaymsg'),
                    emptyMsg: String.format(bundle.getMsg('app.form.bbar.emptymsg'), bundle.getMsg('app.form.elements').toLowerCase())
                }),
                
                sm: new Ext.grid.RowSelectionModel({
                    singleSelect:false, 
                    listeners: {
                        selectionchange: function(selectionModel) {
                            App.selectionChange(selectionModel);
                            window['InvoiceApp'].gridPanel.printBtn.setDisabled(selectionModel.getCount() != 1);
                        }
                    }
                })
            });
            
            this.gridPanel.getView().getRowClass = function(record, index, rowParams, store) {
                if (!record.get('deleteable')) 
                    return 'row-italic';
            };
            
            this.columns = new Array();
            this.taxes = new Array();
            
            this.getProductCollumns = function(callbackFn) {
                window['InvoiceApp'].columns = new Array();
                
                window['InvoiceApp'].columns.push({
                    id:'invoiceproductmaincolumn', 
                    header: bundle.getMsg('product.field.label'),
                    width: 130, 
                    sortable: true, 
                    dataIndex: 'name'
                });
                window['InvoiceApp'].columns.push({
                    header: bundle.getMsg('app.form.amount'), 
                    width: 40, 
                    sortable: true, 
                    dataIndex: 'amount',
                    editor: new Ext.ux.form.SpinnerField({
                        minValue: 0,
                        allowDecimals: true,
                        allowBlank: false,
                        decimalPrecision: 2,
                        incrementValue: 0.5,
                        accelerate: true
                    })
                });
                window['InvoiceApp'].columns.push({
                    header: bundle.getMsg('um.field.label'), 
                    width: 80, 
                    sortable: true, 
                    dataIndex: 'Um',
                    renderer: function(value) {
                        if(value)
                            return value.name;
                        return '';
                    }
                });
                window['InvoiceApp'].columns.push({
                    header: bundle.getMsg('app.form.price'), 
                    width: 40, 
                    sortable: true, 
                    dataIndex: 'price'
                });
                window['InvoiceApp'].columns.push({
                    header: bundle.getMsg('currency.field.label'), 
                    width: 40, 
                    sortable: true, 
                    dataIndex: 'Currency',
                    renderer: function(value) {
                        if(value)
                            return value.code;
                        return '';
                    }
                });
                
                for (var i = 0; window['InvoiceApp'].taxes && i < window['InvoiceApp'].taxes.length; i++){
                    window['InvoiceApp'].columns.push({
                        header: window['InvoiceApp'].taxes[i].Tax.name, 
                        width: 40, 
                        sortable: true, 
                        dataIndex: window['InvoiceApp'].taxes[i].Tax.code,
                        editor: new Ext.ux.form.SpinnerField({
                            allowDecimals: true,
                            allowBlank: false,
                            decimalPrecision: 2,
                            incrementValue: 0.5,
                            accelerate: true
                        })
                    });
                    if(window['InvoiceApp'].taxes[i].fixed)
                        window['InvoiceApp'].columns.push({
                            header: bundle.getMsg('currency.field.label'), 
                            width: 40, 
                            sortable: true, 
                            dataIndex: window['InvoiceApp'].taxes[i].Tax.code+'.currencycode'
                        });
                }
                
                if(callbackFn)
                    callbackFn()
            };
            this.createColModel = function() {
                return new Ext.ux.grid.LockingColumnModel({
                    columns: window['InvoiceApp'].columns.slice(0, window['InvoiceApp'].columns.length),
                    defaults: {
                        sortable: true
                    }
                });
            };
            
            this.formPanel = new Ext.FormPanel({
                labelWidth: 75,
                labelAlign: 'top',
                url: config.app_host + '/invoice/request/method/save',
                layout:'fit',
                border:false,					        
                keys: [formKeyMaping],
                items: [new Ext.TabPanel({
                    ref: 'tabPanel',
                    deferredRender: false,
                    defaults:{
                        autoHeight:false, 
                        border:false
                    }, 			
                    activeTab: 0,
                    border:false,
                    bbar: ['->',{
                        ref: '../contractDisplayField',
                        xtype: 'displayfield', 
                        value: ' '
                    }],
                    items:[{
                        ref: 'generalPanel',
                        title: bundle.getMsg('app.form.generaldata'),
                        iconCls: Ext.ux.Icon('application_view_list'),
                        border:false,	
                        layout:'form',
                        bodyStyle:'padding:5px',
                        items: [new Ext.form.ClearableCombo({
                            ref: 'contractCombo',
                            fieldLabel: bundle.getMsg('contract.field.label')+'<span style="color:red;"><sup>*</sup></span>',
                            anchor: '-20',
                            store: window['ContractApp'].comboStore,
                            emptyText: bundle.getMsg('app.form.typehere'),
                            minChars: 1, //para q busque a partir de 1 caracter...
                            displayField: 'name',
                            typeAhead: false,
                            //boxMaxWidth: 3000,   
                            allowBlank: false,    
                            loadingText: bundle.getMsg('app.msg.wait.searching'),
                            pageSize: config.app_elementsongrid/2,
                            tpl: new Ext.XTemplate(
                                '<tpl for="."><div class="search-item">',
                                '<h3>{name}: {counterpart}</h3>',
                                '{comment}',
                                '</div></tpl>'
                                ),
                            itemSelector: 'div.search-item',
                            listeners: {
                                beforequery: function(queryEvent) {
                                    window['InvoiceApp'].formPanel.tabPanel.generalPanel.contractCombo.getStore().baseParams.filter = '';
                                    this.setValue(queryEvent.query);
                                },
                                blur: function(combo){
                                    if(combo.getRawValue() == '')
                                        window['InvoiceApp'].contractRecord = false;
                                    
                                    window['InvoiceApp'].showContractInfo(window['InvoiceApp'].contractRecord);
                                },
                                select: function(combo, record, index ){
                                    window['InvoiceApp'].contractRecord = record;
                                    this.collapse();
                                                                        
                                    if(combo.getRawValue() == '')
                                        window['InvoiceApp'].contractRecord = false;
                                    else {
                                        if(record && record.get('name') == combo.getRawValue())
                                            window['InvoiceApp'].contractRecord = record;
                                        else {
                                            window['InvoiceApp'].contractRecord = false;
                                            combo.markInvalid(bundle.getMsg('app.error.fieldinvalid'));
                                        }
                                    }
                                    
                                    window['InvoiceApp'].showContractInfo(window['InvoiceApp'].contractRecord);
                                }
                            },
                            triggerConfig: {
                                tag:'span', 
                                cls:'x-form-twin-triggers', 
                                style:'padding-right:2px',
                                cn:[{
                                    tag: "img", 
                                    src: Ext.BLANK_IMAGE_URL, 
                                    cls: "x-form-trigger x-form-search-trigger"
                                }]
                            }
                        }),{
                            xtype:'textarea',
                            name: 'comment',
                            fieldLabel: bundle.getMsg('invoice.field.comment'), 
                            anchor:'-20'
                        }, {
                            layout:'column',
                            border:false,
                            defaults:{
                                border:false
                            }, 
                            items:[{
                                columnWidth:.25,
                                layout: 'form',
                                items: [{
                                    fieldLabel: bundle.getMsg('app.form.date')+'<span style="color:red;"><sup>*</sup></span>', 
                                    xtype:'datefield',
                                    ref: '../../dateField',
                                    name:'creationdate',
                                    value: new Date(),
                                    //maxValue: nowdate,
                                    allowBlank: false,
                                    anchor:'-20',
                                    listeners: {
                                        blur: function() {
                                            window['ComprobantApp'].checkClosure(window['InvoiceApp'].formPanel.tabPanel.generalPanel.dateField);
                                        }
                                    }
                                }]
                            },{
                                columnWidth:.75,
                                layout: 'form',
                                items: [{
                                    xtype:'textfield',
                                    ref: '../../invoicenameField',
                                    name: 'name',
                                    fieldLabel: bundle.getMsg('contract.field.name'), 
                                    anchor:'-20'
                                }]
                            }]
                        }]
                    }, new Ext.grid.EditorGridPanel({
                        layout: 'fit', 
                        clicksToEdit: 1,
                
                        ref: 'productsPanel',
                        stripeRows: true,
                        disabled: true,
                        autoExpandColumn: 'invoiceproductmaincolumn',
                        title: bundle.getMsg('invoice.tab.product'),
                        iconCls: Ext.ux.Icon('paste_plain'),
                        store: new Ext.data.Store({
                            reader: new Ext.data.JsonReader()
                        }),
                        sm: new Ext.grid.RowSelectionModel({
                            singleSelect:true, 
                            listeners: {
                                selectionchange: function(selectionModel) {
                                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.removeBtn.setDisabled(selectionModel.getCount() < 1);
                                }
                            }
                        }),	
                        view: new Ext.grid.GridView({
                            markDirty: false,
                            forceFit:true
                        }),
                        colModel: this.createColModel(),
                        tbar: [new Ext.Toolbar.TextItem(bundle.getMsg('product.field.label')+'<span style="color:red;"><sup>*</sup></span>: '), new Ext.form.ComboBox({
                            ref: 'productCombo',
                            fieldLabel: bundle.getMsg('product.field.label')+'<span style="color:red;"><sup>*</sup></span>',
                            width: 270,
                            store: window['ProductApp'].comboStore,
                            valueField: 'id', 
                            displayField: 'name',
                            tpl: '<tpl for="."><div ext:qtip="{name}:{comment}" class="x-combo-list-item">{name}</div></tpl>',
                            typeAhead: true,
                            forceSelection: true,
                            mode: 'local',
                            triggerAction: 'all',
                            selectOnFocus:true,
                            emptyText: bundle.getMsg('app.form.select'),
                            allowBlank: false,
                            listeners: {
                                select: function(combo, record, index ){
                                    window['InvoiceApp'].productRecord = record;
                                    this.collapse();
                                },
                                blur: function(field) {		
                                    if(field.getRawValue() == '')
                                        window['InvoiceApp'].productRecord = false;
                                    else {
                                        var record = field.getStore().getAt(field.getStore().find('name',field.getRawValue(), 0, true, true));								 
                                        if(record && record.get('name') == field.getRawValue())
                                            window['InvoiceApp'].productRecord = record;
                                        else {
                                            window['InvoiceApp'].productRecord = false;
                                            field.markInvalid(bundle.getMsg('app.error.fieldinvalid'));
                                        }
                                    }
                                }
                            }
                        }), '->',{
                            tooltip: bundle.getMsg('app.form.addrow'),
                            iconCls: Ext.ux.Icon('table_row_insert'),
                            listeners: {
                                click: function(button, eventObject) { 
                                    if(window['InvoiceApp'].formPanel.tabPanel.productsPanel.topToolbar.productCombo.isValid()){
                                        window['InvoiceApp'].formPanel.tabPanel.productsPanel.store.insert(window['InvoiceApp'].formPanel.tabPanel.productsPanel.store.getCount(), window['InvoiceApp'].productRecord);
                                        window['InvoiceApp'].formPanel.tabPanel.productsPanel.reconfigure(window['InvoiceApp'].formPanel.tabPanel.productsPanel.getStore(), window['InvoiceApp'].formPanel.tabPanel.productsPanel.getColumnModel());
                                          
                                        window['InvoiceApp'].formPanel.tabPanel.productsPanel.topToolbar.productCombo.reset(); 
                                        window['InvoiceApp'].productRecord = false;
                                          
                                    }
                                }
                            }
                        },{
                            ref: '../removeBtn',
                            tooltip: bundle.getMsg('app.form.deleterow'),
                            disabled: true,
                            iconCls: Ext.ux.Icon('table_row_delete'),
                            listeners: {
                                click: function(button, eventObject) {
                                    var records = window['InvoiceApp'].formPanel.tabPanel.productsPanel.getSelectionModel().getSelections();
                                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.store.remove(records);
                                }
                            }
                        }],
                        listeners: {
                            activate: function() {
                                if(permissions.indexOf('manageelement') == -1 && permissions.indexOf('manageelementadd') == -1)
                                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.topToolbar.productCombo.getTrigger(1).hide();
                            },
                            afteredit: function(e){
                                window['InvoiceApp'].formPanel.tabPanel.productsPanel.reconfigure(
                                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.getStore(), 
                                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.getColumnModel()
                                );
                            }
                        }
                    }), new Ext.grid.GridPanel({
                        ref: 'taxPanel',
                        title: bundle.getMsg('tax.tab.label'),
                        iconCls: Ext.ux.Icon('coins'),
                        stripeRows: true,
                        autoExpandColumn: 'invoicetaxemaincolumn',
                        store: this.selectedTaxesComboStore,
                        sm: new Ext.grid.RowSelectionModel({
                            listeners: {
                                selectionchange: function(selectionModel) {
                                    window['InvoiceApp'].formPanel.tabPanel.taxPanel.deleterowButton.setDisabled(selectionModel.getCount() < 1);
                                }
                            }
                        }),	
                
                        columns: [{
                            id:'invoicetaxemaincolumn', 
                            header: bundle.getMsg('tax.field.label'), 
                            width: 120, 
                            sortable: true, 
                            dataIndex: 'name'
                        },{
                            header: bundle.getMsg('app.form.amount'), 
                            width: 40, 
                            sortable: true, 
                            dataIndex: 'amounttext'
                        },{
                            header: bundle.getMsg('currency.field.label'), 
                            width: 40, 
                            sortable: true, 
                            dataIndex: 'currency'
                        }],	
                
                        view: new Ext.grid.GridView({
                            markDirty: false,
                            forceFit:true
                        }),
                
                        tbar: [new Ext.Toolbar.TextItem({
                            text: bundle.getMsg('tax.field.label')+'<span style="color:red;"><sup>*</sup></span>:&nbsp;'
                        }), new Ext.form.ClearableCombo({
                            ref: '../taxCombo',
                            allowBlank: false,
                            width: 120, 
                            fieldLabel: bundle.getMsg('tax.field.label'),
                            store: window['TaxApp'].comboStore,
                            valueField: 'id', 
                            displayField: 'name',
                            tpl: '<tpl for="."><div ext:qtip="{name}:{comment}" class="x-combo-list-item">{name}</div></tpl>',
                            typeAhead: true,
                            forceSelection: true,
                            mode: 'local',
                            triggerAction: 'all',
                            selectOnFocus:true,
                            emptyText: bundle.getMsg('app.form.select'),
                            triggerConfig: {
                                tag:'span', 
                                cls:'x-form-twin-triggers', 
                                style:'padding-right:2px',
                                cn:[{
                                    tag: "img", 
                                    src: Ext.BLANK_IMAGE_URL, 
                                    cls: "x-form-trigger"
                                },{
                                    tag: "img", 
                                    src: Ext.BLANK_IMAGE_URL, 
                                    cls: "x-form-trigger x-form-plus-trigger"
                                }]
                            },
                            listeners: {
                                focus: function(combo) {
                                    if(!combo.readOnly && !combo.disabled)
                                        combo.getStore().load();
                                }
                            },
                            onTrigger2Click: function(){ 
                                var obj = new Object;
                                obj.params = [window['InvoiceApp'].formPanel.tabPanel.taxPanel.taxCombo];
                                obj.fn = function(params){
                                    var cmp = params[0];
                                    var obj = params[1];
                                    var mask = new Ext.LoadMask(window['InvoiceApp'].window.getEl(), {
                                        msg: bundle.getMsg('app.layout.loading')+'...'
                                    });
                                    mask.show();
                                    cmp.store.load({
                                        callback: function(records, options, success){
                                            var record = cmp.getStore().getAt(cmp.getStore().find('id',obj.data.id, 0, true, true));								 
                                            if(record)
                                                cmp.setValue(obj.data.id);
                                            mask.hide();
                                        }
                                    });
                                };
                                window['TaxApp'].gridPanel.getSelectionModel().clearSelections();
                                window['TaxApp'].showWindow(window['TaxApp'].window.getEl(), true, obj);
                            }
                        }),new Ext.Toolbar.TextItem({
                            text: '&nbsp;'
                        }), {
                            ref: '../fixedCheckBox',
                            xtype:'checkbox',
                            name: 'manualcode',
                            width: 14,
                            height: 20,
                            fieldLabel: '',
                            labelSeparator: '',
                            listeners: {
                                check : function(checkbox, checked) {
                                    window['InvoiceApp'].formPanel.tabPanel.taxPanel.fixedTextItem.setText(bundle.getMsg('tax.field.fixed.off')+':');
                                    window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.clearInvalid();
                                    window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.setDisabled(!checked);
                                    if(!checked){
                                        window['InvoiceApp'].formPanel.tabPanel.taxPanel.fixedTextItem.setText(bundle.getMsg('tax.field.fixed.on')+':');
                                        window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.reset();
                                    }
                                }
                            }
                        }, new Ext.Toolbar.TextItem({
                            ref: '../fixedTextItem',
                            width: 65,
                            text: bundle.getMsg('tax.field.fixed.on')+':'
                        }), new Ext.ux.form.SpinnerField({
                            ref: '../amountSpinnerField',
                            fieldLabel: bundle.getMsg('app.form.amount'),
                            allowBlank: false,
                            width: 90,
                            allowDecimals: true,
                            decimalPrecision: 1,
                            incrementValue: 0.5,
                            accelerate: true
                        }),new Ext.form.ClearableCombo({
                            ref: '../currencyCombo',
                            width: 80,
                            store: window['CurrencyApp'].comboStore,
                            valueField: 'id', 
                            displayField: 'code',
                            tpl: '<tpl for="."><div ext:qtip="{code}:{name}" class="x-combo-list-item">{code}</div></tpl>',
                            disabled: true,
                            typeAhead: true,
                            forceSelection: true,
                            mode: 'local',
                            triggerAction: 'all',
                            selectOnFocus:true,
                            //                                            emptyText: bundle.getMsg('app.form.select'),
                            allowBlank: false,
                            triggerConfig: {
                                tag:'span', 
                                cls:'x-form-twin-triggers', 
                                style:'padding-right:2px',
                                cn:[{
                                    tag: "img", 
                                    src: Ext.BLANK_IMAGE_URL, 
                                    cls: "x-form-trigger"
                                },{
                                    tag: "img", 
                                    src: Ext.BLANK_IMAGE_URL, 
                                    cls: "x-form-trigger x-form-plus-trigger"
                                }]
                            },
                            listeners: {
                                focus: function(combo) {
                                    if(!combo.readOnly && !combo.disabled)
                                        combo.getStore().load();
                                }
                            },
                            onTrigger2Click: function(){ 
                                var obj = new Object;
                                obj.params = [window['InvoiceApp'].formPanel.tabPanel.generalPanel.currencyCombo];
                                obj.fn = function(params){
                                    var cmp = params[0];
                                    var obj = params[1];
                                    var mask = new Ext.LoadMask(window['InvoiceApp'].window.getEl(), {
                                        msg: bundle.getMsg('app.layout.loading')+'...'
                                    });
                                    mask.show();
                                    cmp.store.load({
                                        callback: function(records, options, success){
                                            var record = cmp.getStore().getAt(cmp.getStore().find('id',obj.data.id, 0, true, true));								 
                                            if(record)
                                                cmp.setValue(obj.data.id);
                                            mask.hide();
                                        }
                                    });
                                };
                                window['CurrencyApp'].gridPanel.getSelectionModel().clearSelections();
                                window['CurrencyApp'].showWindow(window['CurrencyApp'].window.getEl(), true, obj);
                            }
                        }),'->',{
                            tooltip: bundle.getMsg('app.form.addrow'),
                            iconCls: Ext.ux.Icon('table_row_insert'),
                            listeners: {
                                click: function(button, eventObject) {
                                    if(window['InvoiceApp'].formPanel.tabPanel.taxPanel.taxCombo.isValid() && window['InvoiceApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.isValid() && window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.isValid()){
                                        var record = window['InvoiceApp'].formPanel.tabPanel.taxPanel.taxCombo.getStore().getAt(window['InvoiceApp'].formPanel.tabPanel.taxPanel.taxCombo.getStore().find('id', window['InvoiceApp'].formPanel.tabPanel.taxPanel.taxCombo.getValue(), 0, true, true));
                                        
                                        var index = window['InvoiceApp'].selectedTaxesComboStore.find('id', window['InvoiceApp'].formPanel.tabPanel.taxPanel.taxCombo.getValue());
                                        if (index > -1){
                                            record = window['InvoiceApp'].selectedTaxesComboStore.getAt(index);
                                            window['InvoiceApp'].selectedTaxesComboStore.removeAt(index);
                                        }
                                        else
                                            index = window['InvoiceApp'].selectedTaxesComboStore.getCount();
                                        
                                        record.set('fixed', window['InvoiceApp'].formPanel.tabPanel.taxPanel.fixedCheckBox.getValue());
                                        record.set('amount', window['InvoiceApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.getValue());
                                        var percent = '%';
                                        if(window['InvoiceApp'].formPanel.tabPanel.taxPanel.fixedCheckBox.getValue())
                                            percent = '';
                                        record.set('amounttext', window['InvoiceApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.getValue()+percent);
                                        record.set('currency', window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.getRawValue());
                                        record.set('currencyid', window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.getValue());
                                        
                                        window['InvoiceApp'].selectedTaxesComboStore.insert(index, record);  
                                            
                                        window['InvoiceApp'].formPanel.tabPanel.taxPanel.taxCombo.reset();
                                        window['InvoiceApp'].formPanel.tabPanel.taxPanel.fixedCheckBox.reset();
                                        window['InvoiceApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.reset();
                                        window['InvoiceApp'].formPanel.tabPanel.taxPanel.currencyCombo.reset();
                                    }
                                }
                            }
                        },{
                            tooltip: bundle.getMsg('app.form.deleterow'),
                            ref: '../deleterowButton',
                            disabled: true,
                            iconCls: Ext.ux.Icon('table_row_delete'),
                            listeners: {
                                click: function(button, eventObject) {
                                    var records = window['InvoiceApp'].formPanel.tabPanel.taxPanel.getSelectionModel().getSelections();
                                    window['InvoiceApp'].selectedTaxesComboStore.remove(records);
                                }
                            }
                        }]
                    })]
                })]
            });
            
        },
        
        indexOfInArray : function(tax){
            for (var i = 0; i < window['InvoiceApp'].taxes.length; i++)
                if(window['InvoiceApp'].taxes[i].Tax.id == tax.Tax.id)
                    return i;
            return -1;
        },
        
        showContractInfo : function(record){			
            window['InvoiceApp'].formPanel.tabPanel.productsPanel.setDisabled(true);
            window['ProductApp'].comboStore.removeAll();
            window['InvoiceApp'].formPanel.tabPanel.productsPanel.getStore().removeAll();
            
            if(record){
                // populating products asociated to this selected contract
                window['InvoiceApp'].taxes = new Array();
                var products = record.get('ContractProductRelation');
                window['InvoiceApp'].formPanel.tabPanel.productsPanel.setDisabled(false);
                if(products && products.length == 0){
                    Ext.Base.msg('', bundle.getMsg('invoice.action.load.product.norecords')); 
                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.setDisabled(true);
                }
                for (var i = 0; products && i < products.length; i++){
                    var obj = {
                        id: products[i].productid,
                        name: products[i].Product.Element.name,
                        comment: products[i].Product.Element.comment,
                        amount: 1,
                        price: products[i].Product.amount,
                        Currency: products[i].Product.Currency,
                        Um: products[i].Product.Element.Um
                    };
                    
                    for (var j = 0; products[i].Product.ProductTaxRelation && j < products[i].Product.ProductTaxRelation.length; j++){
                        if(window['InvoiceApp'].indexOfInArray(products[i].Product.ProductTaxRelation[j]) == -1)
                            window['InvoiceApp'].taxes.push(products[i].Product.ProductTaxRelation[j]);
                        
                        obj[products[i].Product.ProductTaxRelation[j].Tax.code] = products[i].Product.ProductTaxRelation[j].amount;
                        if(products[i].Product.ProductTaxRelation[j].fixed){
                            obj[products[i].Product.ProductTaxRelation[j].Tax.code+'.currencyid'] = products[i].Product.ProductTaxRelation[j].Currency.id;
                            obj[products[i].Product.ProductTaxRelation[j].Tax.code+'.currencycode'] = products[i].Product.ProductTaxRelation[j].Currency.code;
                            obj[products[i].Product.ProductTaxRelation[j].Tax.code+'.currencyrate'] = products[i].Product.ProductTaxRelation[j].Currency.rate;
                        }
                        
                    }
                    
                    window['ProductApp'].comboStore.add(new Ext.data.Record(obj));  
                }
                
                window['InvoiceApp'].getProductCollumns(function() {
                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.reconfigure(window['InvoiceApp'].formPanel.tabPanel.productsPanel.getStore(), window['InvoiceApp'].createColModel());
                });
                
                
                window['InvoiceApp'].formPanel.tabPanel.getBottomToolbar().show();
                var info = bundle.getMsg('contract.field.label')+': <b>'+record.get('name')+'</b>';
                /*
                if(record.get('Event') && record.get('Event').start && record.get('Event').start != '0000-00-00 00:00:00')	
                    info += ' ' + record.get('Event').start;
                */
                info += ' ' + record.get('counterpart');
                
                window['InvoiceApp'].formPanel.tabPanel.contractDisplayField.setValue(info);
            }
            else
                window['InvoiceApp'].formPanel.tabPanel.getBottomToolbar().hide();
        },
        
        renderInvoice : function(data, callback){
            data.generaldata = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+bundle.getMsg('piece.action.nodatatodisplay');
            if(data.comment && data.comment!='')
                data.generaldata = data.comment;
            if(callback){
                callback(data.generaldata);
            }
                
            return data;
        },
        
        showWindow : function(animateTarget, hideApply, callback){
            var cancelFn = function(){
                window['InvoiceApp'].formPanel.getForm().reset();
                window['InvoiceApp'].selectedTaxesComboStore.removeAll();window['InvoiceApp'].formPanel.tabPanel.productsPanel.setDisabled(true);
                window['InvoiceApp'].formPanel.tabPanel.productsPanel.store.removeAll();
            };
            window['InvoiceApp'].window = App.showWindow(bundle.getMsg('invoice.window.title'), 700, 310, window['InvoiceApp'].formPanel, 
                function(button){
                    if(!button){
                        button = new Object;
                        button.id = window['InvoiceApp'].window.submitBtn.id;
                    }
                
                    var record = window['InvoiceApp'].gridPanel.getSelectionModel().getSelected();
                    
                    var products = new Array();
                    window['InvoiceApp'].formPanel.tabPanel.productsPanel.getStore().each(function(record){
                        products.push(record.data);
                    });
                    
                    var taxes = new Array();
                    window['InvoiceApp'].selectedTaxesComboStore.each(function(record){
                        taxes.push(record.data);
                    });
                            
                    window['InvoiceApp'].formPanel.getForm().submit({
                        waitTitle : bundle.getMsg('app.msg.wait.title'), 
                        waitMsg: bundle.getMsg('app.msg.wait.text'), 
                        clientValidation: true,
                        params: {
                            id: record ? record.get('id') : '',
                            contractid: window['InvoiceApp'].contractRecord ? window['InvoiceApp'].contractRecord.get('id') : '',
                            taxes: Ext.encode(taxes),
                            products: Ext.encode(products),
                            entityid: config.multientityapp ? config.app_entityid : ''
                        },
                        success: function(form, action) {
                            checkSesionExpired(form, action);
                            window['InvoiceApp'].store.load({
                                params:{
                                    start: window['InvoiceApp'].gridPanel.getBottomToolbar().cursor
                                }
                            });
                            
                            submitFormSuccessful('InvoiceApp', form, action, button, !record, cancelFn, callback);
                        },
                        failure: loadFormFailed
                    });
                
                }, 
                function(){
                    cancelFn();
                    window['InvoiceApp'].window.hide();
                }, 
                animateTarget,
                false,
                false,
                false,
                hideApply ? hideApply : false);
        },
        
        applySecurity : function(groups, permissions){
            window['InvoiceApp'].gridPanel.addBtn.setVisible(permissions.indexOf('manageinvoice') != -1 || permissions.indexOf('manageinvoiceadd') != -1);
            window['InvoiceApp'].gridPanel.updateBtn.setVisible(permissions.indexOf('manageinvoice') != -1 || permissions.indexOf('manageinvoiceedit') != -1);
            window['InvoiceApp'].gridPanel.removeBtn.setVisible(permissions.indexOf('manageinvoice') != -1 || permissions.indexOf('manageinvoicedelete') != -1);            
        }
    }
}();

