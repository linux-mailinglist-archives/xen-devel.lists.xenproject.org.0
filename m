Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C1B42916D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206104.361596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw6i-0003Uj-W7; Mon, 11 Oct 2021 14:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206104.361596; Mon, 11 Oct 2021 14:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw6i-0003Rh-Rm; Mon, 11 Oct 2021 14:16:48 +0000
Received: by outflank-mailman (input) for mailman id 206104;
 Mon, 11 Oct 2021 14:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZw6h-0003KN-KU
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:16:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22020e75-334f-4db3-98c1-721986b38b13;
 Mon, 11 Oct 2021 14:16:38 +0000 (UTC)
Received: from AS8PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:312::18)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 14:16:35 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::fd) by AS8PR04CA0043.outlook.office365.com
 (2603:10a6:20b:312::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 14:16:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 14:16:34 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Mon, 11 Oct 2021 14:16:33 +0000
Received: from 8481dac253b9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A978484-6AE3-49C1-A55A-AAAED631FC15.1; 
 Mon, 11 Oct 2021 14:16:22 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8481dac253b9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 14:16:22 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB5260.eurprd08.prod.outlook.com (2603:10a6:10:e6::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 14:16:19 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:16:19 +0000
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
X-Inumbo-ID: 22020e75-334f-4db3-98c1-721986b38b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VQ4oygj+f3p8TVhdwV7xQavFN/nXxhoMVYKuNGrM5U=;
 b=RK+85oSBDDcaYQWUMjyUB4Op3+yvD/IW3oAYrpEsu+ammDzZiPxM3a/MR6xtmUW6GQfe5h06rOs2rOBMToubTLvyEmivHorq8pkymH0JLltF2wwmpubHSm66QXuV6899SU27VnqJT3DsUbnlD8iiaw5we2N02mQuCzxPoaOtgA0=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95836e4587cb99bb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9s3nJSOoKth+Z0qcQeebXAihY3S7nW24Mwq0p/bHFeGdvaW5YmFbm+XCiOorB+ymTRZO+0GU/rVBZJO3syl0PG69Oa8i8e+q3AiCaw6oLA4CvnpW51UbSgt1+ViNizLJa0o4iuB47izyILAuuRpWNIb/WA7nU3TEPcsAxE0nIPow4RgG2TRAS2kPbs9MMI73HCaLS0KkLRn6BTNL9bwFR5w1sfTQCsXnj66D8ykHNRnUyrGkzzwHSAQyMJSLRKiM95MsOZpJVwQvOklNGE9HOvmxXkpk1Ik3OWMwvIk0JtmcvEhQTiyYaQ3GKlrFtZ+TzfxxhcI1ThsN308UfJ0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VQ4oygj+f3p8TVhdwV7xQavFN/nXxhoMVYKuNGrM5U=;
 b=QJxUSfvdz4s7K8XjVqZW/wl92Sw36/enwMdPokFR+aPoEnCCRwr8P7sYGZPjIVRurSbBa6vZKYa3qnHvr0DPPICh25tK5fjrplI3yiZlngc8aIAkuau3IBGBoGUE6olS2RhaccsmkU/bAK01e8Qi/yBxDykpa2zDVcUExoRp5ZwKsEv8dKI4RsfWf9Rl2BNPjNvYm0mTWXtJ3xOi6yVorNMIbD5xCDdZnF9ZSJWnA4NpkKQalNT3el2DuH5ryg5RXkhcMN4zGJ852mppaKH4gmvt+EK1PjqSwJZnRIxyvZp1HCiw7trzPivfruVTp8rtwGxPIxGdLLqAkjl/s+Q51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VQ4oygj+f3p8TVhdwV7xQavFN/nXxhoMVYKuNGrM5U=;
 b=RK+85oSBDDcaYQWUMjyUB4Op3+yvD/IW3oAYrpEsu+ammDzZiPxM3a/MR6xtmUW6GQfe5h06rOs2rOBMToubTLvyEmivHorq8pkymH0JLltF2wwmpubHSm66QXuV6899SU27VnqJT3DsUbnlD8iiaw5we2N02mQuCzxPoaOtgA0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index:
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAA==
Date: Mon, 11 Oct 2021 14:16:19 +0000
Message-ID: <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
In-Reply-To: <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d79f43d4-31f0-4ca2-7612-08d98cc1baef
x-ms-traffictypediagnostic: DB8PR08MB5260:|PA4PR08MB5968:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB5968FF2D19DBAE9642D128A29DB59@PA4PR08MB5968.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 evu0MpMVlvA7E+sDDI07kyIkgsxyfTCVGtdAghcMa2LxOWrgZPDX8H8IWIfz7gbAkELja/+FHBg2/ic3gR9ftV9rGpXkrKXal0j7+iwgaLbYcIjdmIm0B6aJDISZjDjJ3U1lQ4fkYhqILI4MThhsXSYTZ1Eh0cr4olSGqK+VB/5LM3nn5Fk5GrWbsKw5bCVZLo422nZC1zrEOBHQt18mX96uQ8EyCCB3PVUj1C8N2T1mSmLY+/O43VXxANX6bf9A/pkJi9L3ak/wF551n7NiGxV6h+1GlMjgkqCx0jcI6G8Zp5TRJq8BE/vpWGSJokxyjzhP3FeKz73/u5VbR5jLLnVCeNGs+t2iXTvfJUrk8OboA5Lybg9hmXqkqjCiM0mHBU/6EiFB3WWvBtnj7bOFpHbn14y5bGsvg7tyAinZvLyaLdf7anY/6KOxOA6Zb2IeMOv3g+kU3sBk8PwXaEM32g7mzPZPubrqnssiyguZY5OfxDtLlmFMj7uaIZAa1pyyowFy+HPtH0l2ue5C72dfUGdZ0nt357/L5RIz9uhQMkqPK8FFNOsQRJs9WwZkvN922UlEvXPmX42XPT3qOzNPNCwuQVnpOXGAd1kYBQ0cP7Uy1iXAu2ReQovGtQMWjEAH8hXPLfN6cJImE8679gqlQSscE7BXkZH98IjgcsHZ4uzud0LjaPAuVljXameJc/ckwbjL0rzabAd9bsHFV1xysb/viJs7HA2m5+krCerMh2yiT5A0rS5JedGx2Wgpc4fU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(84040400005)(122000001)(26005)(38100700002)(186003)(4326008)(6916009)(53546011)(6506007)(8936002)(38070700005)(6486002)(54906003)(6512007)(2616005)(316002)(71200400001)(2906002)(508600001)(8676002)(36756003)(33656002)(5660300002)(83380400001)(76116006)(91956017)(66446008)(66946007)(64756008)(86362001)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB3644808C119642B2ED8C83AF35EF3C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5260
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15fc7ee1-c117-4639-a564-08d98cc1b25d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9uGb8VbH2OLg1MIgn7S59G+lWcTQyPTqxGHxqvPKbiHV8ikwXLy8SoWl598v9sSe6oAw/aai+T3Ihzj1PVk0sVxhedXi/3pwD45qeEtaCquYJ2NK4QRt8L+N6Xi4oTB5IuPe6opg6uKykCB4XVDDly160TJUL0zqav6n1dD4MJqxM0PLK5MnRlP80r9ngRnAu50E+EvODEdgQ1Qb9fAhhB/wY5tVTRWAB77/yQQITY2rmQ436y1JNtv/2k5IS+w0K08Jn6KpOkzbmo3ED14p7gdNMBDyVAjvBM7ewARPtNwZDBHCCGAuXsiFkiRI7AHKx8QLTeahREdEzparHS+OnVW2tJG7XLLO1B/MPUamc5zqgp+ZFwL8pTB5taERXfvMvgAcfLu+LgzY1I+dDlzctSs5fqc8tTS0HapGrC/07jPffaGdctIdQH68bvY7s+3l9F5M52SbwSvN9o7T1SfgUYIhq6gLYrEP5I6shmam5pC60t21o28+n+rkjzdxIVpqujP7yJWBPflUnJLUASILCtMzX8IFEMP1tjHTcbpFSwsngH0JIe/hY+dOALgJV//+Loq8UNY1C/qefrhTDfJ7H2CP7CMeh9oAcuephZgdY53toTerhPB/2k9/DuTHHLZjdqMmbPsWBqH0ZJZJ/v+rJbPhBRVc7nvSfLnVYIY49MYBwvlOXbg87/KEN7N8E1VpBYuCR/nU2em7FkEtMWf5vO+cPVhq54zIqurwFZLtGoM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(84040400005)(46966006)(36840700001)(70206006)(4326008)(36756003)(47076005)(107886003)(8936002)(82310400003)(26005)(54906003)(33656002)(6486002)(5660300002)(186003)(6512007)(36860700001)(336012)(316002)(63370400001)(70586007)(8676002)(2616005)(6862004)(81166007)(356005)(2906002)(83380400001)(53546011)(86362001)(6506007)(508600001)(63350400001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:16:34.1844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d79f43d4-31f0-4ca2-7612-08d98cc1baef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968

SGkgUm9nZXIsDQoNCj4gT24gMTEgT2N0IDIwMjEsIGF0IDE0OjU3LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIE9jdCAxMSwgMjAy
MSBhdCAwMTo0MDozMFBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgUm9n
ZXIsDQo+PiANCj4+ICsgT2xla3NhbmRyIHRvIGhhdmUgYSBiZXR0ZXIgUENJIGV4cGVydCB0aGVu
IG1lLg0KPj4gDQo+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDE0OjIwLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gTW9uLCBPY3QgMTEs
IDIwMjEgYXQgMTI6MTE6MDRQTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4g
SGkgUm9nZXIsDQo+Pj4+IA0KPj4+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDEyOjQ3LCBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IE9u
IFdlZCwgT2N0IDA2LCAyMDIxIGF0IDA2OjQwOjI3UE0gKzAxMDAsIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+Pj4+IEFSTSBhcmNoaXRlY3R1cmUgZG9lcyBub3QgaW1wbGVtZW50IEkvTyBwb3J0cy4g
SWdub3JlIHRoaXMgY2FsbCBvbiBBUk0NCj4+Pj4+PiB0byBhdm9pZCB0aGUgb3ZlcmhlYWQgb2Yg
bWFraW5nIGEgaHlwZXJjYWxsIGp1c3QgZm9yIFhlbiB0byByZXR1cm4NCj4+Pj4+PiAtRU5PU1lT
Lg0KPj4+Pj4gDQo+Pj4+PiBXaGF0IGlzIHRoZSBjYWwgdHJhY2Ugb2YgdGhpcyBmdW5jdGlvbiBh
Y3R1YWxseSBvbiBBcm0/DQo+Pj4+PiANCj4+Pj4+IEFGQUlDVCBsaWJ4bCB3aWxsIG9ubHkgY2Fs
bCB4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24gaWYgdGhlcmUgYXJlDQo+Pj4+PiBJTyBwb3J0
cyBleHBsaWNpdGx5IGRlZmluZWQgaW4gdGhlIGd1ZXN0IGNvbmZpZ3VyYXRpb24sIG9yIGlmIGFu
eSBvZg0KPj4+Pj4gdGhlIEJBUnMgb2YgdGhlIFBDSSBkZXZpY2UgaXMgaW4gdGhlIElPIHNwYWNl
LCB3aGljaCBpcyBub3QgcG9zc2libGUNCj4+Pj4+IG9uIEFybS4NCj4+Pj4gDQo+Pj4+IFBDSSBk
ZXZpY2VzIEJBUnMgY2FuIGJlIGluIHRoZSBJTyBzcGFjZSBhcyB0aGUgUENJIGRldmljZXMgYXJl
IG5vdA0KPj4+PiBBcm0gc3BlY2lmaWMuIFRoZXJlIGlzIG5vdCBpb3BvcnRzIG9uIGFybSBzbyB0
byBiZSB1c2VkIHRob3NlIGNhbiBiZQ0KPj4+PiBpbiBzb21lIGNhc2VzIHJlbWFwcGVkIGFuZCBh
Y2Nlc3NlZCBhcyBNTUlPcyBvciBhcmUgbm90IHBvc3NpYmxlDQo+Pj4+IHRvIHVzZSBhdCBhbGwu
DQo+Pj4+IA0KPj4+PiBCdXQgdGhlIElPIHNwYWNlIGRvZXMgYXBwZWFyIHdoZW4gQkFScyBhcmUg
bGlzdGVkIGV2ZW4gb24gQXJtLg0KPj4+IA0KPj4+IFVyZywgSSB3b25kZXIgd2hldGhlciB0aG9z
ZSBkZXZpY2VzIHdpdGggSU8gQkFScyB3aWxsIHdvcmsgY29ycmVjdGx5DQo+Pj4gdW5kZXIgQXJt
IHRoZW4uDQo+Pj4gDQo+Pj4gSG93IGRvIHlvdSBrbm93IHdoZXRoZXIgdGhlIEJBUiBoYXMgYmVl
biByZW1hcHBlZCBmcm9tIElPIHNwYWNlIGludG8NCj4+PiBNTUlPPw0KPj4gDQo+PiBXZSBjYW5u
b3QsIEkgdGhpbmsgdGhlIHBsYXRmb3JtIHdpbGwgZGVmaW5lIGlmIHRoaXMgaXMgdGhlIGNhc2Ug
YW5kIHdoZXJlLg0KPj4gQG9sZWtzYW5kcjogSSByZW1lbWJlciB0aGF0IHRoaXMgd2FzIGRpc2N1
c3NlZCBkdXJpbmcgc29tZSBvZiBvdXINCj4+IG1lZXRpbmdzIGJ1dCBJIGhhdmUgbm8gaWRlYSBv
ZiB0aGUgZGV0YWlscyBoZXJlLCBjYW4geW91IGhlbHAgPw0KPj4gDQo+Pj4gDQo+Pj4gSU1PIGlu
c3RlYWQgb2YgZmFraW5nIGEgc3VjY2Vzc2Z1bCByZXR1cm4gdmFsdWUgZnJvbQ0KPj4+IHhjX2Rv
bWFpbl9pb3BvcnRfcGVybWlzc2lvbiB3ZSBzaG91bGQgYXZvaWQgdGhlIGNhbGwgY29tcGxldGVs
eSBpbiB0aGUNCj4+PiBmaXJzdCBwbGFjZSwgc3BlY2lhbGx5IGlmIHdlIG5lZWQgdG8gaW5zdGVh
ZCBpc3N1ZSBhIGNhbGwgdG8NCj4+PiB4Y19kb21haW5faW9tZW1fcGVybWlzc2lvbi4NCj4+IA0K
Pj4gQXQgdGhlIGVuZCB3ZSB3aWxsIG5ldmVyIGhhdmUgdG8gaXNzdWUgdGhpcyBiZWNhdXNlIHRo
aXMgd2lsbCBuZXZlciBiZSBhIG1hdHRlcg0KPj4gb2Yg4oCcaW9tZW3igJ0gcGVybWlzc2lvbiBh
cyB0aGVyZSB3b3VsZCBub3QgYmUgYW55IHdheSB0byBjdXQgb24gc29tZXRoaW5nIHVuZGVyDQo+
PiB0aGUgcGFnZS4gSWYgdGhpcyBpcyB0byBiZSBzdXBwb3J0ZWQgb25lIGRheSwgaXQgd2lsbCBw
cm9iYWJseSBoYXZlIHRvIGJlIGZ1bGx5IGVtdWxhdGVkDQo+PiB0byBrZWVwIHRoZSBpc29sYXRp
b24uDQo+IA0KPiBTbyB5b3UgaGF2ZSBhIHNldCBvZiBtZW1vcnkgcGFnZXMgdGhhdCBtYXAgYWNj
ZXNzZXMgZnJvbQ0KPiBNTUlPIGludG8gSU8gc3BhY2UgYnV0IGl0J3Mgbm90IHBvc3NpYmxlIHRv
IGlzb2xhdGUgc3BlY2lmaWMgSU8gcG9ydA0KPiByZWdpb25zIGFzIHRoZXkgYXJlIGFsbCBjb250
aWd1b3VzIGluIHRoZSBzYW1lIHBhZ2UocykuDQoNCkV4YWN0Lg0KDQo+IA0KPj4gUmlnaHQgbm93
IG9uIGFybSB5b3UgY2FuIGp1c3QgbWFrZSB0aGUgbW9yZSBzaW1wbGUgYXNzdW1wdGlvbiB0aGF0
IGlvcG9ydHMgYXJlDQo+PiBqdXN0IG5vdCBzdXBwb3J0ZWQuDQo+IA0KPiBXb3VsZCBpdCBtYWtl
IHNlbnNlIGluIHRoZSBmdXR1cmUgdG8gcHJvdmlkZSBhIG1lbW9yeSByZWdpb24gdG8gZ3Vlc3Rz
DQo+IGluIG9yZGVyIHRvIHVzZSBmb3IgSU8gcG9ydCBhY2Nlc3NlcywgYW5kIGNhbGwNCj4geGNf
ZG9tYWluX2lvcG9ydF9wZXJtaXNzaW9uIHRvIHNldCB3aGljaCBwb3J0cyB3b3VsZCBiZSBhbGxv
d2VkPw0KDQpSaWdodCBub3cgd2UgZG8gbm90IHBsYW4gdG8gc3VwcG9ydCB0aGlzIGF0IGFsbCBh
bmQgd2Ugd2lsbCBoYXZlIHRvDQpmaWd1cmUgdGhpcyBvdXQgaWYgd2UgZG8gdGhpcyBvbmUgZGF5
Lg0KDQo+IA0KPiBJIHRoaW5rIHRoZSBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBhdCBsZWFzdCBi
ZSBleHBhbmRlZCBpbiBvcmRlciB0bw0KPiBjb250YWluIHRoZSBpbmZvcm1hdGlvbiBwcm92aWRl
ZCBoZXJlLiBJdCBtaWdodCBhbHNvIGJlIGhlbHBmdWwgdG8NCj4gZmlndXJlIG91dCB3aGV0aGVy
IHdlIHdvdWxkIGhhdmUgdG8gaGFuZGxlIElPIHBvcnQgYWNjZXNzZXMgaW4gdGhlDQo+IGZ1dHVy
ZSBvbiBBcm0sIG9yIGlmIGl0J3MgZmluZSB0byBqdXN0IGlnbm9yZSB0aGVtLg0KDQpBbGwgb3Vy
IGludmVzdGlnYXRpb25zIGFuZCB0ZXN0cyBoYXZlIGJlZW4gZG9uZSB3aXRob3V0IHN1cHBvcnRp
bmcgaXQNCndpdGhvdXQgYW55IGlzc3VlcyBzbyB0aGlzIGlzIG5vdCBhIGNyaXRpY2FsIGZlYXR1
cmUgKG1vc3QgZGV2aWNlcyBjYW4NCmJlIG9wZXJhdGVkIHdpdGhvdXQgdXNpbmcgdGhlIEkvTyBw
b3J0cykuDQoNCkkgY2FuIGFkZCB0aGUgZm9sbG93aW5nIHRvIHRoZSBjb21taXQgbWVzc2FnZToN
CkkvTyBwb3J0cyBhY2Nlc3NpYmxlIHRocm91Z2ggTU1JTyBhcmUgY3VycmVudGx5IG5vdCBzdXBw
b3J0ZWQgYnkgWGVuLg0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2Vy
Lg0KDQo=

