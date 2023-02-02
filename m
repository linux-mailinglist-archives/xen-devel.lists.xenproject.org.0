Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0C687AE8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 11:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488642.756805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXES-0007uF-N0; Thu, 02 Feb 2023 10:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488642.756805; Thu, 02 Feb 2023 10:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXES-0007qx-JS; Thu, 02 Feb 2023 10:54:20 +0000
Received: by outflank-mailman (input) for mailman id 488642;
 Thu, 02 Feb 2023 10:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GbMY=56=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pNXEQ-0007qr-Ew
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 10:54:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef206388-a2e7-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 11:54:15 +0100 (CET)
Received: from DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) by DBBPR08MB6234.eurprd08.prod.outlook.com
 (2603:10a6:10:202::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 10:54:13 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::fd) by DUZPR01CA0008.outlook.office365.com
 (2603:10a6:10:3c3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 10:54:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 10:54:12 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Thu, 02 Feb 2023 10:54:11 +0000
Received: from 4efdd1b395a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 102F4761-BE47-4965-90CC-2416857026DF.1; 
 Thu, 02 Feb 2023 10:54:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4efdd1b395a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Feb 2023 10:54:03 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by VI1PR08MB5438.eurprd08.prod.outlook.com (2603:10a6:803:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 10:53:49 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 10:53:49 +0000
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
X-Inumbo-ID: ef206388-a2e7-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8zDiyK6YJsVCYrPJUju7DlAZqnio3eZKfnYF6EoOTc=;
 b=pXzDC9WJ2xrmBKcJOEEbjiNbQv03mWI6VJEXDHzJTPrYP6/9yyRorV2OcMd6hg8VW5pVlPkUK+o1eVRT3XxQRPzWPtMvaQ66fX/Yc/r/v9+yVYOxeSgXMp20iEhGajcEdtRrp/kxOv19Dvahk4Q+kpE1sH2eg+eIwGVMHNqa4f8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLPr/p2BB3AFeGv2cirohC7JVK8xJ6RvfK/hHT21BcutC+z04KoJhGWgNMnCD4LegXeb9TQhgYWCfrkktaTYirE98iE3aUqs2qK2SCy+LjJF1xSZCWJ/+Me6/PamXODo8TPbEe+rq3rftNTb+xpOnjGRxm0jOdAbRylKDAJqcaInfAAemszRtPPDgukNjQ0kj0ZadjqjduLTUnpLYjwIWR2dob1/fT/Cac888381WFFA6JZKzRFhrihiXs7/Jlkyt0c5LyQPQ1b5Ho6Rib7i4vu30yWkzM7ujwYveaHWrnsZxkjCDihv9/FOmxtHRZy/KdlB0kPJeR99/ed/feQ9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8zDiyK6YJsVCYrPJUju7DlAZqnio3eZKfnYF6EoOTc=;
 b=OYlAOqdUWTdG2rOyzXPDEIH3rtWdlOVEbwc6Y3BlEPlBATUlV+J5GmGeqRBbKnwgCv9bHDxjX8P5rEBGbMo7aVCL0yriLDVysoYoPsFpc8KZ9PkUoFVK4c4xfGH7t0mbW+h60YOwP8GaPznoNqJb4GamzTEZRAcGMc/9q7HwKRdvhlm8EcSUn/Sce2ncgDEUUJSfymNvhg4LJ0Vmj6jIHjM9Bn1BZsC+XwKmmosAoomUJIRIllnDq9kDRZXask0lX16Pjde7khUWnr7bQ7km1Qx77SiDLYkTR4gHKluCN2plpKW982nOGR0jTMUU9QX0gRJSBhuQkAx/agxJuNUyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8zDiyK6YJsVCYrPJUju7DlAZqnio3eZKfnYF6EoOTc=;
 b=pXzDC9WJ2xrmBKcJOEEbjiNbQv03mWI6VJEXDHzJTPrYP6/9yyRorV2OcMd6hg8VW5pVlPkUK+o1eVRT3XxQRPzWPtMvaQ66fX/Yc/r/v9+yVYOxeSgXMp20iEhGajcEdtRrp/kxOv19Dvahk4Q+kpE1sH2eg+eIwGVMHNqa4f8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "ayan.kumar.halder@xilinx.com"
	<ayan.kumar.halder@xilinx.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Topic: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Index:
 AQHZJxAhTWb1zeTHm029bSgcZo/2Yq6l4H6AgA7nVJCAAFMfgIAAHOxggAGXmACAARsywIAAc7oAgAFRxNCAAN+ggIABBK2A
Date: Thu, 2 Feb 2023 10:53:49 +0000
Message-ID:
 <AM0PR08MB4530C5B6E0A8ADCDED65D7C4F7D69@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
 <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
 <AM0PR08MB45309F6DCB1B1E0975A741B7F7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <509eafac-bbe7-ed18-ce11-3fede7ca691d@xen.org>
 <AM0PR08MB4530DD5EE9DD4339594F3FE9F7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <1f360356-b143-e732-5a4a-197ed56b2cd1@xen.org>
In-Reply-To: <1f360356-b143-e732-5a4a-197ed56b2cd1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 61C03A09695A79439F36ED5FFCBF44FC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|VI1PR08MB5438:EE_|DBAEUR03FT055:EE_|DBBPR08MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ad2b6c-02e9-4cc0-c4a6-08db050bd18c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YKe/3zNOWLqizCX4tZQWJSkW85Rcsnl2wNijfE2aAS3zw1L7QNBPsp1RMdXdnRTTjRBpZscnMQY6hIghuYEALCAx7bd3VCCjpzdAA0wlZnhV6uH/oI7d7eb57lzR5ygVXplzMH+p0tzuZ7Z6MWGilbcwecSvYtNjShEAQWGYzSX3e9qR0Pee5lmyVz35AY3qo9JCN8Q4wRWDArf5ysdx+ABC+wtjaMIk69/JMW027Gn9+xWBuiaLx/4ncnwpAtSSUVKDMAy54JqsflSvaIt9cSyPRlnIGBuIotqRHZXbiBi0FegMrdgUA91U1bNCqwUbb3zOh9KKAu1OPQ9kYBsmTZv7U4vSeE9ax/3GeV9/HCLtJxUMUCl6uc95XL57CxBn84Eo8i/TkTN8Hq38jDSrysn8dU+Vy6wW33ocJl5LKDBmE0EaehsrmpakjKxbarJxis8IPC1GiH/Vx56PE90k/KKpxlXpX95H5GbALz2LsxCDC3cRSgB3YZTD2tk9c8HNMYwsY86SwfYnpkAID2EMrvyCmyBVAhbMgQApLlQ7k9mEG+bs81wN9aJ7sW86SGIVPJ5z75JUCsX1+v2Kt++oAsIVnunxnwTbga367R8+C6pxucpRiQ7wurrUI5GakJImga0GRyMT+Fk2pbGzdJ6b3axOydxZLMvS7pFlq8Lrw5m+GJypbfhWg94ZbQCXcTMGxK37bmS+oNvTTenpzJk0pg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(478600001)(66946007)(66556008)(76116006)(38100700002)(4326008)(66476007)(66446008)(64756008)(83380400001)(8676002)(122000001)(110136005)(316002)(6506007)(53546011)(26005)(186003)(33656002)(9686003)(5660300002)(86362001)(41300700001)(38070700005)(7696005)(55016003)(71200400001)(8936002)(52536014)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	641b4adc-e7c0-412f-1b8c-08db050bc3d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0UzaUnc8hkodRH8y8+1snGB/+9j4ZoLjtwuHQePRRGNslyB8GAjLnpu356gijmqZwfHXDneKLziTrBMPSquPbW4sgDkM/wgJMGS1rYkrE3fd7N97GPodnZwj1F6GT+xFHdI7yyChMjEpTbDQesv8qObOqceeoDlGBAc5v5n7Ga2gELSiMC/i317ncTubu16MbPk3aZF8RHHoK4TgJkylTTotEd7S4cKbQqaCH7s2btp9U2BhNYn8p0AATyv2hLamuORnahR7SOKcocyLiSNMb/1aEzllRGU678gDs3NHDmVh8dotBaTFSzSbgG0US6ItddnOV3MaPAORK4j4oiddCh5Y8Di6megKZmD/hJlj8JH6vOagD7JwI+6f4uLI8YBfcPgMv1HtbTV+sllNrtYzMa0JLwPeMWtaChWiNpZ+954j+95FbJEUfAfDszApmz1jzuUyJ39mc03tDIwE7hsI20B1oj1lPFs1zIgQobnlWEQIBVdVvaScsjthZQcP44jT73KhlQmXccrIeTV4jzMZmNsDyP9/dOIGP0CQtYFCR+4fIqbF2RQ4/DSvb7Fi15Ta4OGHTqVIXDfbGic0BYweHdkVqtXYU/xzzs0ViTHmeZdm+aB0QyVHKtNJCQcVpxj+yx4G07CmVw3BYwg1SoM9GjJlHUjhErvhEdiD2S5OiFrToh4sIKziQqLOt1l2fGhMgQvnDcruGkVI99OsCRACtw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(40470700004)(46966006)(36840700001)(81166007)(478600001)(107886003)(52536014)(8936002)(5660300002)(40460700003)(70206006)(70586007)(83380400001)(33656002)(4326008)(8676002)(26005)(9686003)(36860700001)(186003)(82310400005)(316002)(86362001)(47076005)(356005)(110136005)(55016003)(40480700001)(6506007)(7696005)(82740400003)(336012)(2906002)(53546011)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 10:54:12.1187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ad2b6c-02e9-4cc0-c4a6-08db050bd18c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6234

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyLCAy
MDIzIDI6NTcgQU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IGF5YW4ua3VtYXIuaGFs
ZGVyQHhpbGlueC5jb20NCj4gQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxMS80MF0geGVuL21wdTogYnVp
bGQgdXAgc3RhcnQtb2YtZGF5IFhlbiBNUFUNCj4gbWVtb3J5IHJlZ2lvbiBtYXANCj4gDQo+IEhp
IFBlbm55LA0KPiANCj4gT24gMDEvMDIvMjAyMyAwNTozOSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+
ID4+PiBJZiB3ZSBhcmUgYWRkaW5nIE1QVSByZWdpb25zIGluIHNlcXVlbmNlIGFzIHlvdSBzdWdn
ZXN0ZWQsIHdoaWxlDQo+ID4+PiB1c2luZyBiaXRtYXAgYXQgdGhlIHNhbWUgdGltZSB0byByZWNv
cmQgdXNlZCBlbnRyeS4NCj4gPj4+IFRCSCwgdGhpcyBpcyBob3cgSSBkZXNpZ25lZCBhdCB0aGUg
dmVyeSBiZWdpbm5pbmcgaW50ZXJuYWxseS4gV2UNCj4gPj4+IGZvdW5kIHRoYXQgaWYgd2UgZG9u
J3QgZG8gcmVvcmcgbGF0ZS1ib290IHRvIGtlZXAgZml4ZWQgaW4gZnJvbnQgYW5kDQo+ID4+PiBz
d2l0Y2hpbmcgb25lcyBhZnRlciwgZWFjaCB0aW1lIHdoZW4gd2UgZG8gdmNwdSBjb250ZXh0IHN3
aXRjaCwgbm90DQo+ID4+PiBvbmx5IHdlIG5lZWQgdG8gaHVudCBkb3duIHN3aXRjaGluZyBvbmVz
IHRvIGRpc2FibGUsIHdoaWxlIHdlIGFkZA0KPiA+Pj4gbmV3IHN3aXRjaC1pbiByZWdpb25zLCB1
c2luZyBiaXRtYXAgdG8gZmluZCBmcmVlIGVudHJ5IGlzIHNheWluZw0KPiA+Pj4gdGhhdCB0aGUN
Cj4gPj4gcHJvY2VzcyBpcyB1bnByZWRpY3RhYmxlLiBVbmNlcnRhaW50eSBpcyB3aGF0IHdlIHdh
bnQgdG8gYXZvaWQgaW4NCj4gPj4gQXJtdjgtUiBhcmNoaXRlY3R1cmUuDQo+ID4+DQo+ID4+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgaXQgd291bGQgYmUgdW5wcmVkaWN0YWJsZS4gRm9yIGEgZ2l2
ZW4NCj4gPj4gY29tYmluYXRpb24gb2YgcGxhdGZvcm0vZGV2aWNlLXRyZWUsIHRoZSBiaXRtYXAg
d2lsbCBhbHdheXMgbG9vayB0aGUNCj4gPj4gc2FtZS4gU28gdGhlIG51bWJlciBvZiBjeWNsZXMv
aW5zdHJ1Y3Rpb25zIHdpbGwgYWx3YXlzIGJlIHRoZSBzYW1lLg0KPiA+Pg0KPiA+DQo+ID4gSW4g
Ym9vdC10aW1lLCBpdCB3aWxsIGJlIGFsd2F5cyB0aGUgc2FtZS4gQnV0IGlmIHdlIHN0aWxsIHVz
ZSBiaXRtYXANCj4gPiB0byBmaW5kIGZyZWUgZW50cnkoZm9yIHN3aXRjaGluZyBNUFUgcmVnaW9u
cykgb24gcnVudGltZSwgaG1tbSwgSQ0KPiA+IHRob3VnaHQgdGhpcyBwYXJ0IHdpbGwgYmUgdW5w
cmVkaWN0YWJsZS4NCj4gDQo+IEkga25vdyB0aGlzIHBvaW50IGlzIG5vdyBtb290IGFzIHdlIGFn
cmVlZCBvbiBub3QgdXNpbmcgYSBiaXRtYXAgYnV0IEkNCj4gd2FudGVkIHRvIGFuc3dlciBvbiB0
aGUgdW5wcmVkaWN0YWJpbGl0eSBwYXJ0Lg0KPiANCj4gSXQgZGVwZW5kcyBvbiB3aGV0aGVyIHlv
dSBkZWNpZGUgdG8gYWxsb2NhdGUgbW9yZSBlbnRyeSBhdCBydW50aW1lLiBNeQ0KPiBhc3N1bXB0
aW9uIGlzIHlvdSB3b24ndCBhbmQgdGhlcmVmb3JlIHRoZSB0aGUgdGltZSB0byB3YWxrIHRoZSBi
aXRtYXAgd2lsbA0KPiBhbHdheXMgYmUgY29uc2lzdGVudC4NCj4gDQoNCkluIE1QVSwgd2UgZG9u
J3QgaGF2ZSBzb21ldGhpbmcgbGlrZSB2dHRicl9lbDIgaW4gTU1VLCB0byBzdG9yZSBzdGFnZSAy
DQpFTDEvRUwwIHRyYW5zbGF0aW9uIHRhYmxlLiBYZW4gc3RhZ2UgMSBFTDIgbWFwcGluZyBhbmQg
c3RhZ2UgMiBFTDEvRUwwDQptYXBwaW5nIGFyZSBib3RoIHNoYXJpbmcgb25lIHRhYmxlLg0KU28g
d2hlbiBjb250ZXh0IHN3aXRjaGluZyBpbnRvIGRpZmZlcmVudCBndWVzdCwgdGhlIGN1cnJlbnQg
ZGVzaWduIGlzIHRvIGRpc2FibGUNCkRPTTEncyBndWVzdCBSQU0gbWFwcGluZyBmaXJzdGx5LCB0
aGVuIGVuYWJsZSBET00yJ3MgZ3Vlc3QgUkFNIG1hcHBpbmcsDQp0byBlbnN1cmUgaXNvbGF0aW9u
IGFuZCBzYWZldHkuDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

