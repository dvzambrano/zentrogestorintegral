<html>
    <head>
        <style>
            @page {
              size: auto;
              odd-header-name: html_MyHeader1;
              odd-footer-name: html_MyFooter1;
            }

            @page chapter2 {
                odd-header-name: html_MyHeader2;
                odd-footer-name: html_MyFooter2;
            }

            @page noheader {
                odd-header-name: _blank;
                odd-footer-name: _blank;
            }

            div.chapter2 {
                page-break-before: always;
                page: chapter2;
            }

            div.noheader {
                page-break-before: always;
                page: noheader;
            }
            table.change_order_items { 
                width: 100%;
                border-collapse: collapse;
                margin-top: 2em;
                margin-bottom: 2em;
            }

            table.change_order_items>tbody { 
                border: 1px solid black;
            }

            table.change_order_items>tbody>tr>th { 
                border-bottom: 1px solid black;
            }

            table.change_order_items>tbody>tr>td { 
                border-right: 1px solid black;
                padding: 0.5em;
            }
            table.change_order_items>thead { 
                border: 1px solid black;
            }

            table.change_order_items>thead>tr>th { 
                border-bottom: 1px solid black;
            }

            table.change_order_items>thead>tr>td { 
                border-right: 1px solid black;
                padding: 0.5em;
            }


            td.change_order_total_col { 
                padding-right: 4pt;
                text-align: right;
            }

            td.change_order_unit_col { 
                padding-left: 2pt;
                text-align: left;
            }

            .even_row td {
                /*  background-color: #F8EEE4;
                  border-top: 3px solid #FFFFff;*/
                background-color: #f6f6f6;
                border-bottom: 0.9px solid #ddd;
            }

            .written_field { 
                border-bottom: 0.1pt solid black;
            }

        </style>
    </head>
    <body>
        <htmlpageheader name="MyHeader1">
            <div style="text-align: right; <!--border-bottom: 1px solid #000000;--> font-weight: bold; font-size: 10pt;"></div>
        </htmlpageheader>

        <table style="width: 100%; font-size: 14px;">
            <tr>
                <td colspan="2" style="text-align:center; font-size:24px;"><b><?php echo strtoupper(Util::getBundle('invoice.field.label')) ?></b></td>
            </tr>
            <tr>
                <td rowspan="4" style="width: 60%;"><img src="<?php echo $invoice->getContract()->getProvider()->getLogo() ?>" alt="<?php echo $invoice->getContract()->getProvider()->getName() ?>" height="90px"></td>
                <td style="width: 40%;"><b><?php echo Util::getBundle('app.form.date') ?></b>: <?php echo $invoice->getComprobant()->getCreationdate() ?></td>
            </tr>
            <tr>
                <td><b><?php echo Util::getBundle('invoice.field.number') ?></b>: <?php echo $invoice->getComprobant()->getName() ?></td>
            </tr>
            <tr>
                <td><b><?php echo Util::getBundle('invoice.field.saler') ?></b>: <?php echo $saler["first_name"]. ' '. $saler["last_name"] ?></td>
            </tr>
            <tr>
                <td><b><?php echo Util::getBundle('contract.field.label') ?></b>: <?php echo $invoice->getContract()->getEvent()->getName() ?></td>
            </tr>
        </table>
        <table style="width: 100%; border-top: 1px solid black; border-bottom: 1px solid black; font-size: 14px;">
            <tr>
                <td><b><?php echo $invoice->getContract()->getProvider()->getName() ?></b></td>
            </tr>
            <tr>
                <td><?php echo $invoice->getContract()->getProvider()->getAddress() ?></td>
            </tr>
            <tr>
                <td><?php echo $invoice->getContract()->getProvider()->getLocation()->getName() ?></td>
            </tr>
            <?php foreach ($profile["contacts"] as $item): ?>
                <tr>
                    <td><b><?php echo $item["name"] ?></b>: <?php echo $item["value"] ?></td>
                </tr>
            <?php endforeach ?>
        </table>
        <table class="change_order_items" style="width: 100%; font-size: 14px;">
            <tr><td colspan="7" style="font-size:18px;"><b><?php echo Util::getBundle('invoice.field.to') ?>:</b></td></tr>
            <tr><td colspan="7"><?php echo $invoice->getContract()->getClient()->getName() ?></td></tr>
            <tbody>
                <tr>
                    <th><?php echo Util::getBundle('invoice.field.no') ?></th>
                    <th><?php echo Util::getBundle('app.form.comment') ?></th>
                    <th><?php echo Util::getBundle('app.form.amount') ?></th>
                    <th colspan="2"><?php echo Util::getBundle('app.form.price') ?></th>
                    <th colspan="2"><?php echo Util::getBundle('app.form.total') ?></th>
                </tr>
                <?php $evenrow = false; ?>
                <?php foreach ($items as $item): ?>
                    <tr class="<?php if (!$evenrow): ?>even_row<?php endif ?><?php if ($evenrow): ?>odd_row<?php endif ?>">
                        <td style="text-align: center"><?php echo $item->index ?></td>
                        <td><?php echo $item->name ?></td>
                        <td style="text-align: center"><?php echo $item->amount ?></td>
                        <td style="text-align: right; border-right-style: none;">$<?php echo $item->unitprice ?></td>
                        <td class="change_order_unit_col" style="border-left-style: none;"><?php echo $item->currency ?></td>
                        <td style="text-align: right; border-right-style: none;">$<?php echo $item->subtotal ?></td>
                        <td class="change_order_unit_col" style="border-left-style: none;"><?php echo $item->currency ?></td>
                    </tr>
                    <?php $evenrow = !$evenrow; ?>
                <?php endforeach ?>
            </tbody>
        </table>

        <htmlpagefooter name="MyFooter1">
            <table style="width: 100%;border: 1px solid black;text-align: right; font-size: 14px;">
                <tr>
                    <td style="width: 80%;"><b>Total:</b> </td>
                    <td style="width: 20%;text-align: right;">$<?php echo $total ?> <?php echo $currency ?></td>
                </tr>
                <?php foreach ($taxes as $tax): ?>
                    <tr>
                        <td><b><?php echo $tax->name ?> (<?php echo $tax->amount.' '.$tax->currency ?>):</td>
                        <td></b> $<?php echo $tax->value ?> <?php echo $currency ?></td>
                    </tr>
                <?php endforeach ?>
                <tr>
                    <td><b><?php echo Util::getBundle('invoice.field.amounttopay') ?>:</b></td>
                    <td>$<?php echo $grantotal ?> <?php echo $currency ?></td>
                </tr>
            </table>
            <table class="sa_signature_box" style="font-size: 14px;">
                <tr>
                    <td colspan="4" style="text-align: right"><b><?php echo ucfirst($letters) ?></b>.<br/><br/><br/></td>
                </tr>
                <tr>    
                    <td style="padding-left: 1em"><?php echo Util::getBundle('invoice.field.receivedby') ?>:</td><td class="written_field" style="padding-left: 2.5in; text-align: right;">X</td>
                    <td style="padding-left: 1em"><?php echo Util::getBundle('invoice.field.createdby') ?>:</td><td class="written_field" style="padding-left: 2.5in; text-align: right;">X</td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top: 0em">&nbsp;</td>
                    <td style="text-align: center; padding-top: 0em;"><?php echo $user->getFirstName().' '.$user->getLastName() ?></td>
                </tr>
                <tr>    
                    <td style="padding-left: 1em"><?php echo Util::getBundle('app.form.date') ?>:</td>
                </tr>
            </table>
            <br/><br/><br/>
            <div style="font-size: 8px;"><?php echo Util::getBundle('app.languaje.report.author', 'es-ES', array($user->getFirstName().' '.$user->getLastName(), Util::getMetadataValue('app_name'))) ?></div>
            <!--
            <table width="100%" style="vertical-align: bottom; font-family: serif; font-size: 8pt; color: #000000; font-weight: bold; font-style: italic;">
                <tr>
                    <td width="33%"><span style="font-weight: bold; font-style: italic;">{DATE j-m-Y}</span></td>
                    <td width="33%" align="center" style="font-weight: bold; font-style: italic;">{PAGENO}/{nbpg}</td>
                    <td width="33%" style="text-align: right; ">My document</td>
                </tr>
            </table>
            -->
        </htmlpagefooter>
    </body>
</html>