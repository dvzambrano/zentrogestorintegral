/**
 * Codigo fuente generado por el SGArqBase: Plataforma de construcción de Sistemas.
 *
 * @package SGArqBase
 * @subpackage product
 * @author MSc. Donel Vázquez Zambrano
 * @version 1.0.0
 */

ProductApp = function() {
    return {
        init : function(ProductApp) {
            
            this.store = new Ext.data.GroupingStore({
                url: config.app_host + '/product/request/method/load',
                baseParams:{
                    component: 'grid',
                    entityid: config.app_entityid,
                    start: 0,
                    limit: config.app_elementsongrid
                },
                groupField: 'um',
                reader: new Ext.data.JsonReader(),
                listeners: {
                    load: function(store, records) { 
                        alertNoRecords(records);
                        if(config.app_showmessageonstoreloadsuccessful)
                            loadStoreSuccessful(store, records);
                    },
                    loadexception: config.app_showmessageonstoreloadfailed ? loadStoreFailed : Ext.emptyFn
                }
            });

            this.comboStore = new Ext.data.GroupingStore({
                url: config.app_host + '/product/request/method/load',
                baseParams:{
                    entityid: config.app_entityid,
                    component: 'combo'
                },
                reader: new Ext.data.JsonReader(),
                listeners: {
                    load: function(store, records) { 
                        window['UmApp'].comboStore.load({
                            callback: function(umrecords){
                                for (var i=0; i<records.length; i++){
                                    var obj = window['ProductApp'].decodeDetails(records[i], umrecords);
                                    records[i].set('details', obj.details);
                                    records[i].set('amounts', obj);
                                }
                        
                                alertNoRecords(records);
                                if(config.app_showmessageonstoreloadsuccessful)
                                    loadStoreSuccessful(store, records);
                            }
                        });
                    },
                    loadexception: config.app_showmessageonstoreloadfailed ? loadStoreFailed : Ext.emptyFn
                }
            });

            this.selectedTaxesComboStore = new Ext.data.Store({
                url: config.app_host + '/product/request/method/load',
                reader: new Ext.data.JsonReader()
            });
            
            this.filters = new Ext.ux.grid.GridFilters({
                encode: true,
                local: false,
                menuFilterText: bundle.getMsg('app.languaje.find.label'),
                filters: [{
                    type: 'string',
                    dataIndex: 'name'
                },{
                    type: 'string',
                    dataIndex: 'comment'
                },{
                    type: 'string',
                    dataIndex: 'um'
                },{
                    type: 'string',
                    dataIndex: 'Currency'
                },{
                    type: 'numeric',
                    dataIndex: 'amount',
                    menuItemCfgs : {
                        emptyText: ' ',
                        selectOnFocus: true,
                        width: 125
                    }
                }]
            });

            this.infoTextItem = new Ext.Toolbar.TextItem('');
            
            this.gridPanel = new Ext.grid.GridPanel({
                id: 'gridPanelProduct',
                region:'center',
                layout: 'fit', 
                iconCls: Ext.ux.Icon('tag_orange'),
                title: config.app_showgridtitle ? bundle.getMsg("product.grid.title") : '',
                autoExpandColumn: 'productmaincolumn',
                store: this.store,
                loadMask: true,
                tools: [{
                    id:'print',
                    qtip: bundle.getMsg('app.languaje.report.printview'),
                    handler: function() {
                        App.printView(window['ProductApp'].gridPanel);
                    }
                },{
                    id:'help',
                    qtip: bundle.getMsg('app.layout.help'),
                    handler: function(button, eventObject) {
                        window.open('../uploads/docs/usermanual.pdf#page=24&zoom=auto,26,310');
                    }
                }],
                keys: [panelKeysMap],

                listeners: {
                    activate: function(gridpanel){
                        gridpanel.getStore().baseParams.entityid = config.app_entityid;
                        gridpanel.getStore().load();
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
                        var text = App.getFiltersText(window['ProductApp'].gridPanel);
                        if(text && text!=''){
                            Ext.fly(window['ProductApp'].infoTextItem.getEl()).update(String.format(bundle.getMsg('app.form.filteringby'), text));
                            window['ProductApp'].infoTextItem.getEl().highlight('#FFFF66', {
                                block:true
                            });
                        }
                        else
                            Ext.fly(window['ProductApp'].infoTextItem.getEl()).update('');
                    }
                },
                
                columns: [new Ext.grid.RowNumberer(),{
                    header: bundle.getMsg('product.field.name'), 
                    width: 160, 
                    sortable: true, 
                    dataIndex: 'name'
                },{
                    id:'productmaincolumn', 
                    header: bundle.getMsg('product.field.comment'), 
                    width: 160, 
                    sortable: true, 
                    dataIndex: 'comment'
                },{
                    header: bundle.getMsg('app.form.price'), 
                    width: 40, 
                    sortable: true, 
                    dataIndex: 'amount'
                },{
                    header: bundle.getMsg('currency.field.label'), 
                    width: 40, 
                    sortable: true, 
                    dataIndex: 'Currency',
                    renderer: function(value) {
                        if(value)
                            return value.code;
                        return '';
                    }
                },{
                    header: bundle.getMsg('um.field.label'), 
                    width: 40, 
                    sortable: true, 
                    hidden: true, 
                    dataIndex: 'um'
                }],
                
                view: new Ext.grid.GroupingView({
                    markDirty: false,
                    forceFit:true,
                    groupTextTpl: '{text} ({[values.rs.length]} {[values.rs.length > 1 ? bundle.getMsg("app.form.elements") : bundle.getMsg("app.form.element")]})'
                }),
                
                plugins: [this.filters],
                
                stripeRows: true,			
                tbar: [{
                    text: bundle.getMsg('app.form.add'),
                    iconCls: Ext.ux.Icon('add'),
                    ref: '../addBtn',
                    listeners: {
                        click: function(button, eventObject, hideApply, callback) {
                            window['ProductApp'].gridPanel.getSelectionModel().clearSelections();
                            window['ProductApp'].gridPanel.updateBtn.fireEvent('click', button, eventObject, hideApply, callback);
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
                                var record = window['ProductApp'].gridPanel.getSelectionModel().getSelected();
                                if (record){
                                    var taxes = record.get('ProductTaxRelation');
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
                                            
                                            index = window['ProductApp'].formPanel.tabPanel.generalPanel.currencyCombo.store.find('id', taxes[i].currencyid);
                                            if (index > -1)
                                                currentrecord.set('currency',  window['ProductApp'].formPanel.tabPanel.generalPanel.currencyCombo.store.getAt(index).get('code'));
                                            
                                            window['ProductApp'].selectedTaxesComboStore.add(currentrecord);
                                        }
                                    }
                                    
                                    record.set('umid', record.get('Element').Um.id);
                                    window['ProductApp'].formPanel.getForm().loadRecord(record);
                                }
                                else
                                    window['ProductApp'].formPanel.getForm().reset();
                                
                                App.mask.hide();
                                window['ProductApp'].showWindow(button.getEl());
                            };
                            syncLoad([
                                window['TaxApp'].comboStore,
                                window['ProductApp'].formPanel.tabPanel.generalPanel.umCombo.store,
                                window['ProductApp'].formPanel.tabPanel.generalPanel.currencyCombo.store
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
                                            var records = window['ProductApp'].gridPanel.getSelectionModel().getSelections();
                                            
                                            var array = new Array();
                                            for (var i=0; i<records.length; i++)
                                                array.push(records[i].get('id'));
                                                
                                            new Ext.data.Connection().request({
                                                url: config.app_host + '/product/request/method/delete',
                                                params: {
                                                    ids: Ext.encode(array)
                                                },
                                                failure: requestFailed,
                                                success: requestSuccessful,
                                                callback : function(options, success, response) {
                                                    var object = Ext.decode(response.responseText);
                                                    if(object.success){
                                                        window['ProductApp'].store.load({
                                                            params:{
                                                                start: window['ProductApp'].gridPanel.getBottomToolbar().cursor
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
                }],
                
                bbar: new Ext.PagingToolbar({
                    pageSize: parseInt(config.app_elementsongrid),
                    store: this.store,
                    plugins: [new Ext.ux.ProgressBarPager(), this.filters],
                    items: [{
                        tooltip: bundle.getMsg('app.form.clearfilters'),
                        iconCls: Ext.ux.Icon('table_lightning'),
                        handler: function () {
                            window['ProductApp'].gridPanel.filters.clearFilters();
                            Ext.fly(window['ProductApp'].infoTextItem.getEl()).update('');
                            window['ProductApp'].gridPanel.getSelectionModel().clearSelections();
                        } 
                    },'-', this.infoTextItem],
                    displayInfo: true,
                    displayMsg: bundle.getMsg('app.form.bbar.displaymsg'),
                    emptyMsg: String.format(bundle.getMsg('app.form.bbar.emptymsg'), bundle.getMsg('app.form.elements').toLowerCase())
                }),
                
                sm: new Ext.grid.RowSelectionModel({
                    singleSelect:false, 
                    listeners: {
                        selectionchange: App.selectionChange
                    }
                })
            });
            
            this.gridPanel.getView().getRowClass = function(record, index, rowParams, store) {
                if (!record.get('deleteable')) 
                    return 'row-italic';
            };
            
            this.formPanel = new Ext.FormPanel({
                labelWidth: 75,
                labelAlign: 'top',
                url: config.app_host + '/product/request/method/save',
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
                    items:[{
                        ref: 'generalPanel',
                        title: bundle.getMsg('app.form.generaldata'),
                        iconCls: Ext.ux.Icon('application_view_list'),
                        frame:true,	
                        border:false,	
                        layout:'form',
                        bodyStyle:'padding:5px',
                        listeners: {
                            activate: function() { 
                                if(permissions.indexOf('manageum') == -1 && permissions.indexOf('manageumadd') == -1)
                                    window['UmApp'].formPanel.tabPanel.generalPanel.umCombo.getTrigger(1).hide();
                            }
                        },
                        items: [{
                            xtype:'textfield',
                            name: 'name',
                            fieldLabel: bundle.getMsg('product.field.name')+'<span style="color:red;"><sup>*</sup></span>', 
                            anchor:'-20',
                            allowBlank: false
                        }, {
                            layout:'column',
                            items:[{
                                columnWidth:.4,
                                layout: 'form',
                                items: [new Ext.form.ClearableCombo({
                                    name: 'umid',
                                    ref: '../../umCombo',
                                    fieldLabel: bundle.getMsg('um.field.label')+'<span style="color:red;"><sup>*</sup></span>',
                                    anchor: '-20',
                                    store: window['UmApp'].comboStore,
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
                                        obj.params = [window['ProductApp'].formPanel.tabPanel.generalPanel.umCombo];
                                        obj.fn = function(params){
                                            var cmp = params[0];
                                            var obj = params[1];
                                            var mask = new Ext.LoadMask(window['UmApp'].window.getEl(), {
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
                                        window['UmApp'].showWindow(window['UmApp'].window.getEl(), true, obj);
                                    }
                                })]
                            },{
                                columnWidth:.3,
                                layout: 'form',
                                items: [new Ext.ux.form.SpinnerField({
                                    fieldLabel: bundle.getMsg('app.form.price')+'<span style="color:red;"><sup>*</sup></span>',
                                    allowBlank: false,
                                    name: 'amount',
                                    anchor: '-20',
                                    minValue: 0,
                                    allowDecimals: true,
                                    decimalPrecision: 1,
                                    incrementValue: 0.5,
                                    accelerate: true
                                })]
                            },{
                                columnWidth:.3,
                                layout: 'form',
                                items: [new Ext.form.ClearableCombo({
                                    name: 'currencyid',
                                    ref: '../../currencyCombo',
                                    fieldLabel: bundle.getMsg('currency.field.label')+'<span style="color:red;"><sup>*</sup></span>',
                                    anchor: '-20',
                                    store: window['CurrencyApp'].comboStore,
                                    valueField: 'id', 
                                    displayField: 'code',
                                    tpl: '<tpl for="."><div ext:qtip="{code}:{name}" class="x-combo-list-item">{code}</div></tpl>',
                                    typeAhead: true,
                                    forceSelection: true,
                                    mode: 'local',
                                    triggerAction: 'all',
                                    selectOnFocus:true,
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
                                        obj.params = [window['ProductApp'].formPanel.tabPanel.generalPanel.currencyCombo];
                                        obj.fn = function(params){
                                            var cmp = params[0];
                                            var obj = params[1];
                                            var mask = new Ext.LoadMask(window['CurrencyApp'].window.getEl(), {
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
                                        window['CurrencyApp'].showWindow(window['CurrencyApp'].window.getEl(), true, obj);
                                    }
                                })]
                            }]
                        },{
                            xtype:'textarea',
                            name: 'comment',
                            fieldLabel: bundle.getMsg('product.field.comment'), 
                            anchor:'-20'
                        }]
                    }, new Ext.grid.GridPanel({
                        ref: 'taxPanel',
                        title: bundle.getMsg('tax.tab.label'),
                        iconCls: Ext.ux.Icon('coins'),
                        stripeRows: true,
                        autoExpandColumn: 'producttaxemaincolumn',
                        store: this.selectedTaxesComboStore,
                        sm: new Ext.grid.RowSelectionModel({
                            listeners: {
                                selectionchange: function(selectionModel) {
                                    Ext.getCmp('btnRemoveTax').setDisabled(selectionModel.getCount() < 1);
                                }
                            }
                        }),	
                
                        columns: [{
                            id:'producttaxemaincolumn', 
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
                                obj.params = [window['ProductApp'].formPanel.tabPanel.taxPanel.taxCombo];
                                obj.fn = function(params){
                                    var cmp = params[0];
                                    var obj = params[1];
                                    var mask = new Ext.LoadMask(window['ProductApp'].window.getEl(), {
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
                                    window['ProductApp'].formPanel.tabPanel.taxPanel.fixedTextItem.setText(bundle.getMsg('tax.field.fixed.off')+':');
                                    window['ProductApp'].formPanel.tabPanel.taxPanel.currencyCombo.clearInvalid();
                                    window['ProductApp'].formPanel.tabPanel.taxPanel.currencyCombo.setDisabled(!checked);
                                    if(!checked){
                                        window['ProductApp'].formPanel.tabPanel.taxPanel.fixedTextItem.setText(bundle.getMsg('tax.field.fixed.on')+':');
                                        window['ProductApp'].formPanel.tabPanel.taxPanel.currencyCombo.reset();
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
                            minValue: 0,
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
                                obj.params = [window['ProductApp'].formPanel.tabPanel.generalPanel.currencyCombo];
                                obj.fn = function(params){
                                    var cmp = params[0];
                                    var obj = params[1];
                                    var mask = new Ext.LoadMask(window['ProductApp'].window.getEl(), {
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
                                    if(window['ProductApp'].formPanel.tabPanel.taxPanel.taxCombo.isValid() && window['ProductApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.isValid() && window['ProductApp'].formPanel.tabPanel.taxPanel.currencyCombo.isValid()){
                                        var record = window['ProductApp'].formPanel.tabPanel.taxPanel.taxCombo.getStore().getAt(window['ProductApp'].formPanel.tabPanel.taxPanel.taxCombo.getStore().find('id', window['ProductApp'].formPanel.tabPanel.taxPanel.taxCombo.getValue(), 0, true, true));
                                        
                                        var index = window['ProductApp'].selectedTaxesComboStore.find('id', window['ProductApp'].formPanel.tabPanel.taxPanel.taxCombo.getValue());
                                        if (index > -1){
                                            record = window['ProductApp'].selectedTaxesComboStore.getAt(index);
                                            window['ProductApp'].selectedTaxesComboStore.removeAt(index);
                                        }
                                        else
                                            index = window['ProductApp'].selectedTaxesComboStore.getCount();
                                        
                                        record.set('fixed', window['ProductApp'].formPanel.tabPanel.taxPanel.fixedCheckBox.getValue());
                                        record.set('amount', window['ProductApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.getValue());
                                        var percent = '%';
                                        if(window['ProductApp'].formPanel.tabPanel.taxPanel.fixedCheckBox.getValue())
                                            percent = '';
                                        record.set('amounttext', window['ProductApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.getValue()+percent);
                                        record.set('currency', window['ProductApp'].formPanel.tabPanel.taxPanel.currencyCombo.getRawValue());
                                        record.set('currencyid', window['ProductApp'].formPanel.tabPanel.taxPanel.currencyCombo.getValue());
                                        
                                        window['ProductApp'].selectedTaxesComboStore.insert(index, record);  
                                            
                                        window['ProductApp'].formPanel.tabPanel.taxPanel.taxCombo.reset();
                                        window['ProductApp'].formPanel.tabPanel.taxPanel.fixedCheckBox.reset();
                                        window['ProductApp'].formPanel.tabPanel.taxPanel.amountSpinnerField.reset();
                                        window['ProductApp'].formPanel.tabPanel.taxPanel.currencyCombo.reset();
                                    }
                                }
                            }
                        },{
                            tooltip: bundle.getMsg('app.form.deleterow'),
                            id: 'btnRemoveTax',
                            disabled: true,
                            iconCls: Ext.ux.Icon('table_row_delete'),
                            listeners: {
                                click: function(button, eventObject) {
                                    var records = window['ProductApp'].formPanel.tabPanel.taxPanel.getSelectionModel().getSelections();
                                    window['ProductApp'].selectedTaxesComboStore.remove(records);
                                }
                            }
                        }]
                    })]
                })]
            });

        },

        showWindow : function(animateTarget, hideApply, callback){
            var cancelFn = function(){
                window['ProductApp'].formPanel.getForm().reset();
                window['ProductApp'].selectedTaxesComboStore.removeAll();
            };
                
            window['ProductApp'].window = App.showWindow(bundle.getMsg('product.window.title'), 500, 320, window['ProductApp'].formPanel, 
                function(button){
                    if(!button){
                        button = new Object;
                        button.id = window['ProductApp'].window.submitBtn.id;
                    }
                    
                    var record = window['ProductApp'].gridPanel.getSelectionModel().getSelected();
                    
                    var taxes = new Array();
                    window['ProductApp'].selectedTaxesComboStore.each(function(record){
                        taxes.push(record.data);
                    });
                            
                    window['ProductApp'].formPanel.getForm().submit({
                        waitTitle : bundle.getMsg('app.msg.wait.title'), 
                        waitMsg: bundle.getMsg('app.msg.wait.text'), 
                        clientValidation: true,
                        params: {
                            id: record ? record.get('id') : '',
                            um_id: window['ProductApp'].formPanel.tabPanel.generalPanel.umCombo.getValue(),
                            currency_id: window['ProductApp'].formPanel.tabPanel.generalPanel.currencyCombo.getValue(),
                            taxes: Ext.encode(taxes),
                            entityid: config.multientityapp ? config.app_entityid : ''
                        },
                        success: function(form, action) {
                            checkSesionExpired(form, action);
                            window['ProductApp'].store.load({
                                params:{
                                    start: window['ProductApp'].gridPanel.getBottomToolbar().cursor
                                }
                            });
                            
                            submitFormSuccessful('ProductApp', form, action, button, !record, cancelFn, callback);
                        },
                        failure: loadFormFailed
                    });

                }, 
                function(){
                    cancelFn();
                    window['ProductApp'].window.hide();
                }, 
                animateTarget,
                false,
                false,
                false,
                hideApply ? hideApply : false);
        },
        
        decodeDetails : function(product, records){ 
            var obj = new Object;
            obj.ids = new Array();
            obj.names = new Array();
            obj.values = new Array();
            
            if (!product || !product.get('Accounts') || product.get('Accounts').length < 1){
                obj.details = '<tr>\
                <td tabindex="0" style="width: 100%;" class="x-grid3-col x-grid3-cell x-grid3-td-1 ">\
                    <div unselectable="on" class="x-grid3-cell-inner x-grid3-col-1">' + String.format(bundle.getMsg('app.form.bbar.emptymsg'), bundle.getMsg('app.form.elements')) + '</div>\
                </td>\
            </tr>';
                return obj;
            }
            
            obj.details = '<tr>\
                <td tabindex="0" style="width: 50%;" class="x-grid3-col x-grid3-cell x-grid3-td-1 ">\
                    <div unselectable="on" class="x-grid3-cell-inner x-grid3-col-1">' + bundle.getMsg('um.field.label') + '<hr/></div>\
                </td>\
                                <td tabindex="0" style="width: 50%;" class="x-grid3-col x-grid3-cell x-grid3-td-1 ">\
                    <div unselectable="on" class="x-grid3-cell-inner x-grid3-col-1">' + bundle.getMsg('app.form.amount') + '<hr/></div>\
                </td>\
            </tr>';
            
            if(records && records.length)
                for (var i = 0; i < records.length; i++)
                    for (var j = 0; j < product.get('Accounts').length; j++)
                        for (var k = 0; k < product.get('Accounts')[j].Transactions.length; k++){
                            var transaction = product.get('Accounts')[j].Transactions[k];
                            if(transaction.umid == records[i].id){
                                var v = parseFloat(transaction.amount);
                                if(transaction.credit && parseFloat(transaction.credit) > 0)
                                    v = v* (-1);
                                
                                if(obj.ids.indexOf(records[i].get('id'))>-1)
                                    obj.values[obj.ids.indexOf(records[i].get('id'))] += v;
                                else{
                                    obj.ids.push(records[i].get('id'));
                                    obj.names.push(records[i].get('name'));
                                    obj.values.push(v);
                                }
                                
                                if (v < 0) {
                                    v = parseFloat(-1*v).toFixed(2);
                                    v = '<b><span style="color:red;">' + v + '</span></b>';
                                }
                                else{   
                                    v = parseFloat(v).toFixed(2);
                                    v = '<b><span style="color:green;">' + v + '</span></b>';
                                } 
                            }
                        }
                        
                        
            for (i = 0; i < obj.names.length; i++)     
                obj.details += '<tr>\
                                    <td tabindex="0" style="width: 50%;" class="x-grid3-col x-grid3-cell x-grid3-td-1 ">\
                                            <div unselectable="on" class="x-grid3-cell-inner x-grid3-col-1">' + obj.names[i] + '</div>\
                                    </td>\
                                    <td tabindex="0" style="width: 50%;" class="x-grid3-col x-grid3-cell x-grid3-td-1 ">\
                                            <div unselectable="on" class="x-grid3-cell-inner x-grid3-col-1">' + obj.values[i] + '</div>\
                                    </td>\
                                </tr>'; 
            
            return obj;
        },
        
        applySecurity : function(groups, permissions){
            window['ProductApp'].gridPanel.addBtn.setVisible(permissions.indexOf('manageelement') != -1 || permissions.indexOf('manageelementadd') != -1);
            window['ProductApp'].gridPanel.updateBtn.setVisible(permissions.indexOf('manageelement') != -1 || permissions.indexOf('manageelementedit') != -1);
            window['ProductApp'].gridPanel.removeBtn.setVisible(permissions.indexOf('manageelement') != -1 || permissions.indexOf('manageelementdelete') != -1);
        }
    }
}();

