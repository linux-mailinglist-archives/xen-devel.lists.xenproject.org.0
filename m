Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61E68C022
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490495.759221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2XS-00025P-54; Mon, 06 Feb 2023 14:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490495.759221; Mon, 06 Feb 2023 14:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2XS-00023g-16; Mon, 06 Feb 2023 14:32:10 +0000
Received: by outflank-mailman (input) for mailman id 490495;
 Mon, 06 Feb 2023 14:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzyl=6C=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pP2XQ-00023Y-7k
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:32:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07824958-a62b-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 15:32:06 +0100 (CET)
Received: from AS9PR06CA0400.eurprd06.prod.outlook.com (2603:10a6:20b:461::29)
 by AS8PR08MB10290.eurprd08.prod.outlook.com (2603:10a6:20b:63c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Mon, 6 Feb
 2023 14:32:04 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::60) by AS9PR06CA0400.outlook.office365.com
 (2603:10a6:20b:461::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 14:32:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34 via Frontend Transport; Mon, 6 Feb 2023 14:32:03 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Mon, 06 Feb 2023 14:32:03 +0000
Received: from 38f8b18c9510.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34053E15-F53A-4C00-9E7C-EEF7AD2D1E40.1; 
 Mon, 06 Feb 2023 14:31:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38f8b18c9510.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Feb 2023 14:31:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Mon, 6 Feb
 2023 14:31:54 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 14:31:52 +0000
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
X-Inumbo-ID: 07824958-a62b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/em00BzmsS3BsNMGKBOF/yt97Yr3Tg2BWkGaSQ0a6nQ=;
 b=v2vdT+z7o1+b6phot42u8vo3rg7tfL4/oRtUBNCiUCIFG/+a359dHMViaUt/LPVGPJhBxHajMb0VZ2GL/ONETyfOE5p3cfvidX4i26jLiaf1h9bOCqzkzG02oki6PrrvMI9A00Cr2tmzahT5MPl/aC2PvyAZ/33xhEsGJXPv6VY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbd6ceffe8b8383d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gV76ICcu+2SU1yuTLiWA2zcSwTcRYbmFCTO3KGANtI82wj9T/Lup0vGQeSOfs3QVNJkObV/SbaWTVXZAhFV8powPormLjqyikGWYoDLWjosrorjPjhmxDjihaA+mHJ4GX/pSLmoftqZlERFB3llS48qci/+jbv+/qpShdpZBaNvTa5WLyNkSKnsfaofbonERXWm4PeGaFmMuWU0xERtXEHnST/AFiBmhUai19LdDGTXTAU0SvcmLSP0UU5k/k972c1aGA2HlHpx0kDy300R5/J0QvFehsCaFm+YOSLoOPyT4w47LZn2Uq40GJaEmeoGQaIEwddyBcOvc+ETk955yDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/em00BzmsS3BsNMGKBOF/yt97Yr3Tg2BWkGaSQ0a6nQ=;
 b=dk/ZQrNk69P+z4eWJ26SkiAtzXAL3TOzIqQ2QrNwt1ExpupoSCcZa9kAYp3Imt5YiWG0stDQlt33pFHwQDm/Q3G3ZoiCDVkTGyvCXlVj5MinCwVstqkuDjGhM/7IKoUHAlkT1YxFu9odIUSKmc8AUBTl3RxNMWLuswmSKKdbZGDAAezJH5FbC/vB0jXiusNZPxlugfaoPv7TAVTqnVesVXYJKpNgHfv5H/jXbF01iTCknhXtrlIWilMIIJnbktIPoodO5xykeuHgA4wBL574RAPXaAmih3lAmjdlxfsCTK+e3dhPOMCWLoTojvF3jwWjkc4N3xslg1Iv7L54kX2mng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/em00BzmsS3BsNMGKBOF/yt97Yr3Tg2BWkGaSQ0a6nQ=;
 b=v2vdT+z7o1+b6phot42u8vo3rg7tfL4/oRtUBNCiUCIFG/+a359dHMViaUt/LPVGPJhBxHajMb0VZ2GL/ONETyfOE5p3cfvidX4i26jLiaf1h9bOCqzkzG02oki6PrrvMI9A00Cr2tmzahT5MPl/aC2PvyAZ/33xhEsGJXPv6VY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Thread-Topic: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Thread-Index: AQHZOAMhFrHFBGWgpEqoPT1xaNlgs67B/28A
Date: Mon, 6 Feb 2023 14:31:52 +0000
Message-ID: <4388B281-EAEB-456D-8759-6DE055755735@arm.com>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
In-Reply-To: <20230203190908.211541-2-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB7873:EE_|AM7EUR03FT018:EE_|AS8PR08MB10290:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b98c8e-acc3-48b7-e3cf-08db084eea63
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uFyY+2LbBEkDr1xHDQz64aCyBCqsHg2F9VvTg8fkSKZwFNl1oIJ3EHvDQTTXeiYzgOSJJ/e9t5eJmBYRf7jYswQge7kya4hHeYXuqOLMovipGx+n4q93Aq2beHanBw9qt2pmoD+fu7HEYQWhDCrIBkJAHwK5YorZiVF/HLcykblCHfHG7yew7TS3+kw2WJ2YOL93sHHySqucNnu19ll3hTLtAsS0POE6mh8rwEdneNczbX/194cYx/e/wMsxAk0YwlNswRmrzwwIlg80bJbx9ydOjkS4eDhrjEeeiThRg4+wwfXOxBG4KmpyQCrfWBhfZy+FSy0Rnv8eLDdrIbTl24I/8hzTq2sSMnpNDPR4L7moFVgcJWLnjkpNIloyHv9kxQF5xfvA+ZWMEClPOjBdiWR3yFOk5NmR8zyqcuZyx2ctJ/CTuCkSk5rjpdShtd+BP44DC0s0TA8sPKu/5fo0pQBbUTZeR9t9Ay8+EdTYg7wa8nlJKTUyZoKzsyAagRiQmQkxRvUlHOHKm2V1WGkUaVwV+mdKGOWW8wxZ1SNCj1UGK9OwPdh/Y0itA9I4bQxhk1CB7lgJ8XHfsviHT1h0iWIXmPyV8ILSGSCYwryfddABldDgR/Z2KGv8NkSO27vSJq1PZ+ethMvnC8wk5G5eOWxoqvjoPV3pV0tvSAsTEe6PHOUkEekiHDKzKGUnCqtBSe50LylldeHzRq8no5f50j2qbhgKl5FLNzAWX+1hGZ7HHr8ppFal1mSkDlou+73L
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199018)(41300700001)(38070700005)(33656002)(6916009)(316002)(6486002)(478600001)(966005)(4326008)(83380400001)(66556008)(66476007)(91956017)(54906003)(66946007)(86362001)(8676002)(76116006)(64756008)(66446008)(2616005)(36756003)(5660300002)(122000001)(186003)(6512007)(26005)(71200400001)(2906002)(38100700002)(6506007)(8936002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <568DCE6E47EFA2428A8F6DFDBDE4C06D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cb0bcc6-6b72-4e3d-126f-08db084ee3e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w9dEB+ZUHHp3TeGBgvBP0mrnzSopGU5k46SDquFb5OTTRmybPeM73b/COZynx27SkXgzeuUr1fq3nh1NFBFfEqmX2myHlNo9I8m/anCgR3QM8D/jxCW4rNXMBFYnXaOhjvOJwp1CcuMAc7Jfh1OMFDD47i7xIOhCiX5wpLiZ4h8mJZAYES051foH57Pob04RenwXBa0uPNSHYuYxTRP+58hsgK3oXdR6ph/ROR5lSzZUqgGd1q3ux3qYuESLlhiHxSXcTJxhCQ38ZLnmI99r9ka64efLdxvILwvZiPgeO1GoD1pn5TPeuPnT+r17cRRHPKBhiCvilURScK69wWfhNEqH0/GuQKGzj5Mzfsjr3Xy3zdWIPoeuXdGRhoL80ekQ+2SF/TXk/K3wKQWt913BLWGku29avphxuaWVLo3rzc9ma2IaxqikCdIyJs7F5ZAF5PlzPpJWzLLruIkPajhrqOTQEvusqZsANN0LirTGd0q29p31TnMAoXmcUwpTyGatsvE+GOSK7va3DMEuh4R7hKl0ByXQFSixYPZKRLeQ6SP0C+55AlnPlwnGkNSL0NID5HxJiFHRAeHDWUwJvP4OQTdhlp5EG3/vtjkXuemBcOpQme2UbqV9OX1o3DPuHAd77/kQsVw8lrA9YAuy9U+ZbbfH5ZNwUaUeX8LZABFm8/pDT0lk36T8CnDQxBqFtvLCMX/nJ1x7Ff8Y/LiDj6QvsU27unTqOhIyzuYXpid3E+E=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199018)(46966006)(36840700001)(40470700004)(54906003)(316002)(70206006)(70586007)(4326008)(36860700001)(41300700001)(8936002)(5660300002)(6862004)(8676002)(2906002)(2616005)(47076005)(81166007)(478600001)(82740400003)(6486002)(86362001)(356005)(966005)(33656002)(336012)(40460700003)(6512007)(83380400001)(186003)(26005)(82310400005)(53546011)(36756003)(6506007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:32:03.5005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b98c8e-acc3-48b7-e3cf-08db084eea63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10290

SGkgWGVuaWEsDQoNCj4gT24gMyBGZWIgMjAyMywgYXQgMTk6MDksIFhlbmlhIFJhZ2lhZGFrb3Ug
PGJ1cnphbG9kb3dhQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBYZW5p
YSBSYWdpYWRha291IDxidXJ6YWxvZG93YUBnbWFpbC5jb20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdl
cyBpbiB2MzoNCj4gIC0gdGhlIGZpeGVzIGFyZSBiYXNlZCBzb2xlbHkgdG8gRWNsYWlyIGZpbmRp
bmdzICh0aGUgdG9vbCBoYXMgYmVlbg0KPiAgICBhZGp1c3RlZCB0byByZXBvcnQgb25seSB0aG9z
ZSB2aW9sYXRpb25zIHRoYXQgY2FuIHJlc3VsdCB0byBhIGJ1ZykNCj4gIC0gcmVmbGVjdCB0aGlz
IGluIHRoZSBjb21taXQgdGl0bGUNCj4gDQo+IHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5o
IHwgMTQgKysrKysrKy0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZGV2aWNl
X3RyZWUuaCBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oDQo+IGluZGV4IGEyODkzN2Qx
MmFlOC4uNzgzOWExOTllMzExIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZGV2aWNl
X3RyZWUuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaA0KPiBAQCAtMzcs
MTEgKzM3LDExIEBAIHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggew0KPiAgICAgY29uc3Qgdm9pZCAq
ZGF0YTsNCj4gfTsNCj4gDQo+IC0jZGVmaW5lIF9fRFRfTUFUQ0hfUEFUSChwKSAgICAgICAgICAg
ICAgLnBhdGggPSBwDQo+IC0jZGVmaW5lIF9fRFRfTUFUQ0hfVFlQRSh0eXApICAgICAgICAgICAg
LnR5cGUgPSB0eXANCj4gLSNkZWZpbmUgX19EVF9NQVRDSF9DT01QQVRJQkxFKGNvbXBhdCkgICAu
Y29tcGF0aWJsZSA9IGNvbXBhdA0KPiArI2RlZmluZSBfX0RUX01BVENIX1BBVEgocCkgICAgICAg
ICAgICAgIC5wYXRoID0gKHApDQo+ICsjZGVmaW5lIF9fRFRfTUFUQ0hfVFlQRSh0eXApICAgICAg
ICAgICAgLnR5cGUgPSAodHlwKQ0KPiArI2RlZmluZSBfX0RUX01BVENIX0NPTVBBVElCTEUoY29t
cGF0KSAgIC5jb21wYXRpYmxlID0gKGNvbXBhdCkNCj4gI2RlZmluZSBfX0RUX01BVENIX05PVF9B
VkFJTEFCTEUoKSAgICAgIC5ub3RfYXZhaWxhYmxlID0gMQ0KPiAtI2RlZmluZSBfX0RUX01BVENI
X1BST1AocCkgICAgICAgICAgICAgIC5wcm9wID0gcA0KPiArI2RlZmluZSBfX0RUX01BVENIX1BS
T1AocCkgICAgICAgICAgICAgIC5wcm9wID0gKHApDQo+IA0KPiAjZGVmaW5lIERUX01BVENIX1BB
VEgocCkgICAgICAgICAgICAgICAgeyBfX0RUX01BVENIX1BBVEgocCkgfQ0KPiAjZGVmaW5lIERU
X01BVENIX1RZUEUodHlwKSAgICAgICAgICAgICAgeyBfX0RUX01BVENIX1RZUEUodHlwKSB9DQo+
IEBAIC0yMjYsMTMgKzIyNiwxMyBAQCBkdF9maW5kX2ludGVycnVwdF9jb250cm9sbGVyKGNvbnN0
IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggKm1hdGNoZXMpOw0KPiAjZGVmaW5lIERUX1JPT1RfTk9E
RV9TSVpFX0NFTExTX0RFRkFVTFQgMQ0KPiANCj4gI2RlZmluZSBkdF9mb3JfZWFjaF9wcm9wZXJ0
eV9ub2RlKGRuLCBwcCkgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgIGZvciAoIHBwID0gZG4t
PnByb3BlcnRpZXM7IHBwICE9IE5VTEw7IHBwID0gcHAtPm5leHQgKQ0KPiArICAgIGZvciAoIHBw
ID0gKGRuKS0+cHJvcGVydGllczsgKHBwKSAhPSBOVUxMOyBwcCA9IChwcCktPm5leHQgKQ0KPiAN
Cj4gI2RlZmluZSBkdF9mb3JfZWFjaF9kZXZpY2Vfbm9kZShkdCwgZG4pICAgICAgICAgICAgICAg
ICAgICAgXA0KPiAtICAgIGZvciAoIGRuID0gZHQ7IGRuICE9IE5VTEw7IGRuID0gZG4tPmFsbG5l
eHQgKQ0KPiArICAgIGZvciAoIGRuID0gZHQ7IChkbikgIT0gTlVMTDsgZG4gPSAoZG4pLT5hbGxu
ZXh0ICkNCj4gDQo+ICNkZWZpbmUgZHRfZm9yX2VhY2hfY2hpbGRfbm9kZShkdCwgZG4pICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4gLSAgICBmb3IgKCBkbiA9IGR0LT5jaGlsZDsgZG4gIT0gTlVM
TDsgZG4gPSBkbi0+c2libGluZyApDQo+ICsgICAgZm9yICggZG4gPSAoZHQpLT5jaGlsZDsgKGRu
KSAhPSBOVUxMOyBkbiA9IChkbiktPnNpYmxpbmcgKQ0KPiANCj4gLyogSGVscGVyIHRvIHJlYWQg
YSBiaWcgbnVtYmVyOyBzaXplIGlzIGluIGNlbGxzIChub3QgYnl0ZXMpICovDQo+IHN0YXRpYyBp
bmxpbmUgdTY0IGR0X3JlYWRfbnVtYmVyKGNvbnN0IF9fYmUzMiAqY2VsbCwgaW50IHNpemUpDQo+
IC0tIA0KPiAyLjM3LjINCj4gDQo+IA0KDQpXaGlsZSB0aGUgY2hhbmdlcyBsb29rcyBzZW5zaWJs
ZSB0byBtZSwgSeKAmXZlIGhhZCBhIGxvb2sgaW4gZWNsYWlyIGJ1dCBJIHdhcyB1bmFibGUgdG8g
ZmluZCB0aGUgZmluZGluZ3MsDQpoZXJlIHdoYXQgZmluZGluZ3MgSSBoYXZlIGluIHRoZSBsYXRl
c3QgcmVwb3J0OiANCmh0dHBzOi8vZWNsYWlyaXQuY29tOjg0NDMvam9iL1hFTi9UYXJnZXQ9QVJN
NjQsYWdlbnQ9ZG9ja2VyMS9sYXN0QnVpbGQvZWNsYWlyL3BhY2thZ2VOYW1lLjgzMjIwNDYyMC9m
aWxlTmFtZS4xODExNjc1ODA2Lw==

