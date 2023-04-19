Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597F6E73B0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523178.812986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1yr-000313-04; Wed, 19 Apr 2023 07:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523178.812986; Wed, 19 Apr 2023 07:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1yq-0002yN-TT; Wed, 19 Apr 2023 07:11:52 +0000
Received: by outflank-mailman (input) for mailman id 523178;
 Wed, 19 Apr 2023 07:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+8i=AK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pp1yp-0002yH-4z
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:11:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c0bfc5-de81-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 09:11:49 +0200 (CEST)
Received: from DU2PR04CA0345.eurprd04.prod.outlook.com (2603:10a6:10:2b4::16)
 by AM8PR08MB6532.eurprd08.prod.outlook.com (2603:10a6:20b:316::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 07:11:45 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::9f) by DU2PR04CA0345.outlook.office365.com
 (2603:10a6:10:2b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Wed, 19 Apr 2023 07:11:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Wed, 19 Apr 2023 07:11:44 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 19 Apr 2023 07:11:44 +0000
Received: from 305ad627bad9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5014C673-458E-4AE2-B3B4-CABB0EF1B6A7.1; 
 Wed, 19 Apr 2023 07:11:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 305ad627bad9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:11:33 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6232.eurprd08.prod.outlook.com (2603:10a6:20b:296::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 07:11:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 07:11:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 73c0bfc5-de81-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMrIzwUcoDqf/Kh2TV1PHFWdZFOzdZ1c1nR199FGlZg=;
 b=LbsdVQqpnMn2EtvPPHRMVDWznGQ12lLCchn8vSMZ2qNoz9ohNgHeUwVI+WUE6c2cekVMgGyH9dRS61shemBu3uwzVhYyECoJTyxPMmVFVaaVYNxgMJ13dP/vRHCuAXGHhBYbR1M2l+8F2h2o/NabHb/OHmCh7y9/x+FF9yUGyD4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0aeb721de568a90
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/uokU0HYyVXttR13m1mzImEN420OEW7pW/1W+m2P8IbhSLdHqqteTr/koRbMDI8jKuZzx2o7X+umqEb6mU5E7qUiF6+vE0PfejRQJFf4XoK0YbU/VmMnhaLvPZhGliEG8l7MWQRzwDTm6C6wRcvUmmqvUmrB5QfSEP+/yCDA6h/yf/lX6zylukpaD2K0H9DjwGq2Uj9uJ1kXlyyTdNbznukPUNCyt+nMhlGNEa6LnRCrVjOHu8qOmWDtHteym/guM3UlOtqNzaCtzP6gmhvCUfSmY441V624/X4wM9874F974NAtouOMZBRbxD5C/jrgpUWx7ehTJQbt/AcFHQO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMrIzwUcoDqf/Kh2TV1PHFWdZFOzdZ1c1nR199FGlZg=;
 b=Pe+AzWM1uC5f0qXvHXPaS1eA/2GVPS0FA9xVeK71J1Y8eaXvXhR6fX/DTTjbRx5KxqWBsk0Fu3D40hYaG4NorUFPvImw64V8Ve9/Lf1tjhnXYBcjcEYSMnUJ4geSx+hS/u7ZzOePhd0NX84IBmXdtg7eMg0kiXGmot/CZWyz5wtmgmxUIzSIABqGZfiAG0WF3LwFw5ThosdZCXwc3cY/fiJxRwFmW3ont9TodeHgfMrrDNfrxIeitJbDBDshA+pMqKQQGoo3HCsP3WbemFPZ5NpliIE5YAxQ+o+CA6m9tVbsF2rVMuGZbaYDpkn4059NMcAGFm7rEwWbN4e2IlJOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMrIzwUcoDqf/Kh2TV1PHFWdZFOzdZ1c1nR199FGlZg=;
 b=LbsdVQqpnMn2EtvPPHRMVDWznGQ12lLCchn8vSMZ2qNoz9ohNgHeUwVI+WUE6c2cekVMgGyH9dRS61shemBu3uwzVhYyECoJTyxPMmVFVaaVYNxgMJ13dP/vRHCuAXGHhBYbR1M2l+8F2h2o/NabHb/OHmCh7y9/x+FF9yUGyD4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to the
 changelog for Arm
Thread-Topic: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to
 the changelog for Arm
Thread-Index: AQHZbSQ7MYMS4SfeGk2TvWO0qogYra8xEDcAgAExxYA=
Date: Wed, 19 Apr 2023 07:11:28 +0000
Message-ID: <DEE57E48-1ADB-447B-90FB-0AC559B936F7@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-13-luca.fancellu@arm.com>
 <20BBA7B1-AF5B-49D0-BA79-17B90893C3CC@arm.com>
In-Reply-To: <20BBA7B1-AF5B-49D0-BA79-17B90893C3CC@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6232:EE_|DBAEUR03FT063:EE_|AM8PR08MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ea2526-9f42-4cfc-d965-08db40a5555f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 R5gANSXd4o2pI69OHGmSws9Ws2vImYkb1QlsW2hVkNsj7O/TsPpF7sC4JmOXmRnJlN0tmp+2uRjh4k8eDGoECLTMVQHR/E6u23w3y3higtUS6TJUBf8wrVLifGQfAvnmeAZ6NLiKHMC/+NO1p6lPvWeWpLgIqoItKcxxlPmsihSDfb43upKgIfJnkdrCGh8/mWHkTJYugbynM4wf8OVDY5kM+yTel5jsFzRHY27BaY+DM8OVa+Bb5QqJC23dQBhhgplUMcuw0P1fvIkpj6e6xv5vS9o1dmmsU9Qn1uTsnbyr/H7+PN+OmJmFQDmxPo4f4u0dUrvY4VjLVqqSvyPfmAXVE+6+UkxlBHndQ3oLwuYZhe1bzsfW84pKoNHLn7LY+bfkttYxok1+N/Qj/3v9ukzwr+flYtIdEgVZE4R7PO7sOJQCGdaVTq77/9u55f4OUzDFFASJYCNQOhfGgjWZMGpttNI1PQ5yjfI2yCdmZeS0poUCKJ22cjSDIYwiJLn+PPsWIbIQX3r6KpBor980ux2o3j4b8mmugWr2/DM5gOrh+gEYbr1oySo5nRdDFbioaW3uQXcjYORm6pyXXLC6okso6xf+ObPLhOabe75tn8dYN6yimqnDG1uQ32Bm1CCBeHcfn2Fbmy4VqLRQdGkAoRRrrLkZUqibJFEkuI/h5UgJpYlcHDcEyRxpVOnfmRuK2XoeO1dVdv2qp1eUp9tcLtkmOjpl7iZeGmv78zfgLcw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(186003)(71200400001)(6512007)(6506007)(53546011)(83380400001)(26005)(2616005)(38070700005)(6486002)(86362001)(4001150100001)(2906002)(33656002)(316002)(5660300002)(76116006)(4326008)(6636002)(91956017)(6862004)(41300700001)(8676002)(64756008)(66556008)(8936002)(66476007)(66446008)(38100700002)(66946007)(478600001)(54906003)(122000001)(37006003)(36756003)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <752BA23F0DB10F4A9E26AC0FCD0F9313@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6232
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f2fc8c2-c8d3-4f81-cb60-08db40a54bac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	353yw2gVI+obJzwEf7kA6huWVp5RFJW8Mm+zzrmTKv9ctaikSeNt533FtqeZeo5ap9B5hV07/5EmZ0+oBoy+GdxUl0of8iGVbh9TyrpKct9cO56gg0R7mazR2Grwqtx/XX6bTbwCOWCgQ6PMujD/SAB/wUm2uDSNM/Lr7fR/oQso4MC/qumbGS31rQyvYH4Ho4NjtUjK5hJvd20+66YcxKCytAMogWz8THsJFbBpFLQQSWOOyXQtCY+B4+BZcxeD/tDW5Hr52T5fDi2VtNWRUhrPSmoR2nCuJ5deiIExHPv8p1jByfRbtTnDlxbew2hCrbH7y6ahmJH43Zvj5/L0SwD3J7rs9r3HO7RCrasU3NCVi1Odyk096tKeXcaTCIQPRL4px3Ii5SH0izysMFQ3AYPlhleG23Lg0E29OqQQZASSJMRA+1uOT1nxHDgEP17yaGmNFZYXxV/1AJsdyy0w5FljEY70NMlMzHNFCsP2YPkL53maBpdjIZdMF18vvpXcw13nI6xB4ZtCf5C4gVBOcZyS6+gYsWwIvNKxq/tl18ihU5fi3DqSxWqfy+iPR3FAvQUt3KSZFf4YRlFDXzdWeUI7SP/Mci9uJawxq2APrb/pB80GeSEkZjhPBemN6GpQR6Tf9X7Lj+zkWQ7hFvJ42VQeaFQep58IUzkQhmUL0WICRn911G+l8otm3P2fyyl+Funpqg1w74cD1jZG99M6G3UHeodABpQUJUTlf9lxnisQEH8MVAQCtHn3+UxR/C6jn1fUl519uyo01lrH3gpWGiekGRGtE3iP2QTTceLNjas=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(6486002)(86362001)(40480700001)(33656002)(40460700003)(36756003)(83380400001)(81166007)(82740400003)(356005)(47076005)(36860700001)(2616005)(82310400005)(336012)(53546011)(6506007)(6512007)(26005)(186003)(478600001)(54906003)(6636002)(37006003)(316002)(8676002)(8936002)(4326008)(70206006)(41300700001)(70586007)(5660300002)(4001150100001)(6862004)(2906002)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:11:44.9183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ea2526-9f42-4cfc-d965-08db40a5555f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6532

DQoNCj4gT24gMTggQXByIDIwMjMsIGF0IDEzOjU2LCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+PiBPbiAxMiBB
cHIgMjAyMywgYXQgMTE6NDksIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2VsbHVAYXJtLmNvbT4g
d3JvdGU6DQo+PiANCj4+IEFybSBub3cgY2FuIHVzZSB0aGUgImRvbTA9IiBYZW4gY29tbWFuZCBs
aW5lIG9wdGlvbiBhbmQgdGhlIHN1cHBvcnQNCj4+IGZvciBndWVzdHMgcnVubmluZyBTVkUgaW5z
dHJ1Y3Rpb25zIGlzIGFkZGVkLCBwdXQgZW50cmllcyBpbiB0aGUNCj4+IGNoYW5nZWxvZy4NCj4+
IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGZyb20gdjQ6DQo+PiAtIE5vIGNoYW5nZXMNCj4+IENoYW5n
ZSBmcm9tIHYzOg0KPj4gLSBuZXcgcGF0Y2gNCj4+IC0tLQ0KPj4gQ0hBTkdFTE9HLm1kIHwgNSAr
KysrKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0t
Z2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdFTE9HLm1kDQo+PiBpbmRleCBjOTc4Y2ZkOWI2OGYu
LmEyNDk1MTYwMzM1OSAxMDA2NDQNCj4+IC0tLSBhL0NIQU5HRUxPRy5tZA0KPj4gKysrIGIvQ0hB
TkdFTE9HLm1kDQo+PiBAQCAtNiw2ICs2LDEwIEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tl
ZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+
IA0KPj4gIyMgW3Vuc3RhYmxlIFVOUkVMRUFTRURdKGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD14ZW4uZ2l0O2E9c2hvcnRsb2c7aD1zdGFnaW5nKSAtIFRCRA0KPj4gDQo+PiArIyMj
IENoYW5nZWQNCj4+ICstIFRoZSAiZG9tMCIgb3B0aW9uIGlzIG5vdyBzdXBwb3J0ZWQgb24gQXJt
IGFuZCAic3ZlPSIgc3ViLW9wdGlvbiBjYW4gYmUgdXNlZA0KPj4gKyAgdG8gZW5hYmxlIGRvbTAg
Z3Vlc3QgdG8gdXNlIFNWRS9TVkUyIGluc3RydWN0aW9ucy4NCj4+ICsNCj4+ICMjIyBBZGRlZA0K
Pj4gLSBPbiB4ODYsIHN1cHBvcnQgZm9yIGZlYXR1cmVzIG5ldyBpbiBJbnRlbCBTYXBwaGlyZSBS
YXBpZHMgQ1BVczoNCj4+ICAgLSBQS1MgKFByb3RlY3Rpb24gS2V5IFN1cGVydmlzb3IpIGF2YWls
YWJsZSB0byBIVk0vUFZIIGd1ZXN0cy4NCj4+IEBAIC0xNCw2ICsxOCw3IEBAIFRoZSBmb3JtYXQg
aXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29t
L2VuLzEuMC4wLykNCj4+ICAgLSBCdXMtbG9jayBkZXRlY3Rpb24sIHVzZWQgYnkgWGVuIHRvIG1p
dGlnYXRlIChieSByYXRlLWxpbWl0aW5nKSB0aGUgc3lzdGVtDQo+PiAgICAgd2lkZSBpbXBhY3Qg
b2YgYSBndWVzdCBtaXN1c2luZyBhdG9taWMgaW5zdHJ1Y3Rpb25zLg0KPj4gLSB4bC9saWJ4bCBj
YW4gY3VzdG9taXplIFNNQklPUyBzdHJpbmdzIGZvciBIVk0gZ3Vlc3RzLg0KPj4gKyAtIE9uIEFy
bSwgWGVuIHN1cHBvcnRzIGd1ZXN0cyBydW5uaW5nIFNWRS9TVkUyIGluc3RydWN0aW9ucy4NCj4g
DQo+IE1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIG1lbnRpb24gdGhhdCB0aGlzIGlzIGEgdGVjaCBw
cmV2aWV3ID8NCg0KU3VyZSBJ4oCZbGwgbWVudGlvbiB0aGF0LCBpcyB0aGVyZSBzb21ldGhpbmcg
aW4gcGFydGljdWxhciB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgb3IgaXMgaXQgZW5vdWdoIHRvIHNh
eSB0aGF0IGhlcmU/DQoNCj4gDQo+IENoZWVycw0KPiBCZXJ0cmFuZA0KPiANCj4+IA0KPj4gIyMg
WzQuMTcuMF0oaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9y
dGxvZztoPVJFTEVBU0UtNC4xNy4wKSAtIDIwMjItMTItMTINCj4+IA0KPj4gLS0NCj4+IDIuMzQu
MQ0KDQoNCg==

