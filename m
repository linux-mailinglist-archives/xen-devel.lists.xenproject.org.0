Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FB628E86
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 01:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443627.698287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouk01-0003ja-0Q; Tue, 15 Nov 2022 00:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443627.698287; Tue, 15 Nov 2022 00:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouk00-0003h8-TE; Tue, 15 Nov 2022 00:40:24 +0000
Received: by outflank-mailman (input) for mailman id 443627;
 Tue, 15 Nov 2022 00:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zGhI=3P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oujzz-0003h2-Du
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 00:40:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 160302f6-647e-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 01:40:21 +0100 (CET)
Received: from AS9PR06CA0362.eurprd06.prod.outlook.com (2603:10a6:20b:460::9)
 by DU0PR08MB7616.eurprd08.prod.outlook.com (2603:10a6:10:320::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Tue, 15 Nov
 2022 00:40:19 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::63) by AS9PR06CA0362.outlook.office365.com
 (2603:10a6:20b:460::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 00:40:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Tue, 15 Nov 2022 00:40:18 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Tue, 15 Nov 2022 00:40:18 +0000
Received: from 79486938ea55.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 409E8DED-83F9-491A-A0DD-4AFFBD6174C3.1; 
 Tue, 15 Nov 2022 00:40:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79486938ea55.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Nov 2022 00:40:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8746.eurprd08.prod.outlook.com (2603:10a6:20b:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Tue, 15 Nov
 2022 00:40:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Tue, 15 Nov 2022
 00:40:01 +0000
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
X-Inumbo-ID: 160302f6-647e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRUI563PByKNgVZQ6hhawLkv/phd1ZRgk6nY6/LP/XY=;
 b=4MzdNHnLNnliw2zJVqgiY5bAS9It8vXCMF0aLiOdpCmFcHpjbDbfAysUeXJ+uTmI5A0K+pfYwxPe9LFaf4Shb3uepvv2EDuizh4t1U2Jt9UfYN/QvrpH5a5paAAbv5RGfnj0cUtQW6D9xWIykvHHcpG018UmHD0bsSKqv6xmJCo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQMVOka6xAOF71D/ZProgiNNgK2OzYLA9ZUpN2AlOGPEt3Th2Zimk7wPkmIgl36vLWXjBSAnTKOzsc1S7WuOHnHbi3amWDpBDNaaL4O1jRc/C9oNlKgaai7PWBUekm9tuC4GlSi5t0cMDEb4WFRmT51mnmQzFWfjQfGP5Ora10OoISTYzxd2UbjrJEKf/HTavaVqYNrA6oGBqU6PQLXu0ruZ4Eq92jTMHjfV3vkX+IXF7PG8l82gpKvfuJtfIS99CnslyMl/yIgnerv1h3msv1fmh0fpqB7cAcmaff6tieCam+vddEOMlNL3dswX9R07x6bUxo/P5CthSdJHruWYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRUI563PByKNgVZQ6hhawLkv/phd1ZRgk6nY6/LP/XY=;
 b=Udk69qm1y9MRmTPT438SVKaubUpHJJwK+Wr//cVUO9S+SPhdc0y0Cr36FmcuvAoWxc0KUw7oZ9+nH6/EHbgJrcGfR0uHfhvmRyfvM5qgeIoUalfDiGq/hKd7epZkIUANGvuQxTlRrqTldElVmRNCxlrYA/EXawpdQMUUIOQENIAW7oc0GpwKJhfMFnlZWTRjQquqvEhXx/99K7BSTy0dLpMwbKgJ2IW4lvgFYkIEUag/oUfSnlCb8Ch7SyWokf7EEOO7+b2ahHxLjdUvhQjseEwqQf3bt3KU4zplTFdq5etRpBvMP0wOGziZ8O+kqlT5j7dY8JdbY2DNaHjSa4U0MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRUI563PByKNgVZQ6hhawLkv/phd1ZRgk6nY6/LP/XY=;
 b=4MzdNHnLNnliw2zJVqgiY5bAS9It8vXCMF0aLiOdpCmFcHpjbDbfAysUeXJ+uTmI5A0K+pfYwxPe9LFaf4Shb3uepvv2EDuizh4t1U2Jt9UfYN/QvrpH5a5paAAbv5RGfnj0cUtQW6D9xWIykvHHcpG018UmHD0bsSKqv6xmJCo=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
Subject: RE: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Topic: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Index: AQHY9cAA3X9w+pjMxES5dLMt0fkbDa45tnoAgAABRRCAAAr5gIAAALlwgAVmWrA=
Date: Tue, 15 Nov 2022 00:40:01 +0000
Message-ID:
 <AS8PR08MB7991115A4DF0914A8417BAD692049@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-3-Henry.Wang@arm.com>
 <4482952f-86a9-d232-6cf5-afa6523012dc@suse.com>
 <AS8PR08MB799165ABD2B1FA2BFD7B48D592009@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c7309294-40c4-bc3f-0d19-a896a0f71594@suse.com>
 <AS8PR08MB799114791187C208080415E092009@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB799114791187C208080415E092009@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2A35FD2AD4EA734CAFD60567F69444E4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8746:EE_|AM7EUR03FT063:EE_|DU0PR08MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: ac035ea4-d95c-4648-fdb6-08dac6a1f86b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2j7s6ukhH8r5WJhMSRst2lTrXQ97yqVQW3+PWgY2g0tfjUscSPa41bXtCElwXJENbsDL7VM9c6N6rZZfK4+A62iyEwJt75WDMfcC+qX+7UqcB5Pvp8yyf73SSiOyRdsJ103/t9jJeqkuIp6BN76KDanpOelVLA7+rXjwl5s5cnbCgvgANAedBxAdC1tl6t5nkb0x3n6pM2BwX/NBJxeykPK3iRuKS/TYRrCKsRDH0hfQMZ9Ny31WMMZerTByuah0VtgwViyfVQikqHVyADuSAuUZkDup0DvWbBIue4PXW7NCel0AAeZLzKDwOsHcACTwbu+6xTxPtVhyjiv/85MD40tn0A6odyGTT5EuzJn1uktjddw9YZThY3SGVhM2hpC4HAM4qPhYdTk+NL8cbY11Vn9bNeLKjO0PAypohKoXuxcgjPvwUuvun3jfbmwud5DuYwL2A6O7iqkA7XLMM/jhS24hfueMRQe/13n4ybqXf59spoqYP7isZJQKJWUyCeRLxsnv2Gnqu1J2g5gtme8bQJPEaQcDY9Q/DuWzO1dSsygQ9BsfGbPIAqbZ2w0OW0g4vhuMv5QrFUOhlrHWtiVdaWUZSNlSiNXB8f6k3WHCwLfhjnuoCz+ArkSnnr5Wxx4Q5qucjor4skNuMZ18MzO7pN3mM5nHcUGeOiIwaQxb6sTI5KtXl1K6A+Ek0H5M3XRTLX98CotSxXYqMiYrtnFJvtMbJaOum9oYinfqrJJ5GtzrikF4Ws7QiZtBH+BTCt8p4ZlPzGwgRMjca+NjDtydiIw/CWYQBc/HhNos37TGDFChyaJGNKMS0QR7dCEd/lSmoewhWAPH/7WkMU+MUrWvaA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(2906002)(66946007)(33656002)(76116006)(66556008)(316002)(66476007)(52536014)(5660300002)(86362001)(83380400001)(54906003)(8936002)(41300700001)(66446008)(64756008)(8676002)(4326008)(53546011)(6506007)(7696005)(26005)(9686003)(38070700005)(55016003)(186003)(122000001)(71200400001)(38100700002)(478600001)(6916009)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8746
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8449e9e-036e-4a3f-c1b6-08dac6a1ee5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RZesr63/p0QvjpyJBz3frK6P1TFglogjrb/NU//OonelY9tjpyTCpIBQXLRBCvxfaa904JwBZGeuE23mS6KhnbwC8uPDhXj2C70z70CdAqgdfZ14+yx9th+iSMr6Q7C18Kfp0h0xS+C2jh78ZO04274jxH13rxwuy4b482pPBwR2BbVhCT31WFlPgQSWNGIYYxam7QAKjlzrEv4ElO7Zivv8Wr73oU2/0xUJexoV6WidZV9iA2wyev752QllMgn6nvGnhywEgAalgDP32S3SVSUG6czdHj4ED9Qt8sykxxkuvFF7ha2qHtu0yNlSqdLJLtocoIiYq8DQ6kx73SZfU12GK8mzXVZtV0j1rA7kVyeW54rXCQtdjeJ0MMxJR3o5KHUm3TblwlBvh7Ty9qaeG3a6qKb0DGoXNm+de8hsOuybC6P0L9a3QDwgzsn+UFuwmKLV+iY3IfRvRWgvCK6yDo6pJpUXUFty1fSYUIALrutNTfF38FSE0Da+HiVxK+rF8jUNZKptUT9MBbArrEqFW+azX93+htjQc5CnQY0L/ZV68r4C77KgcMx0CGuQhvzvSixJqe+FtHfGxmRWBZ1hweAual9n48LP0ofA3SIRkcqdLivE4IbhUU3iIL/rz+t3kf9GK6Grsbc1E9TQj8AJq1YtPhTYBMieTD4FJ5pNoN0cvsUuJgYan7V1IuKVgdGnNTJNwX+nipj3SFLas8O4YZhG/0igmonBCXMRomNi0xWpTLZFcVkt2Xv8eDlIUQd2r7+8m9dMoTtXsxA4HE+mEqh81F+ZuhuodVnpDhgR4D1ZNvFhQN+SQud8u/0Xw0t314YAKg/1NdgWeYNikl2S6pSKx3IWKwjPClrDVHS4BU0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(6862004)(2906002)(8936002)(52536014)(5660300002)(8676002)(4326008)(70206006)(41300700001)(107886003)(53546011)(26005)(40460700003)(7696005)(9686003)(186003)(6506007)(478600001)(336012)(316002)(54906003)(33656002)(70586007)(36860700001)(82310400005)(82740400003)(40480700001)(356005)(83380400001)(47076005)(55016003)(81166007)(86362001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 00:40:18.5582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac035ea4-d95c-4648-fdb6-08dac6a1f86b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7616

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gU3ViamVjdDogUkU6
IFtQQVRDSCAyLzNdIENIQU5HRUxPRzogQWRkIG1pc3NpbmcgZW50cmllcyBmb3Igd29yayBkdXJp
bmcNCj4gdGhlIDQuMTcgcmVsZWFzZQ0KPiANCj4gSGkgSmFuLA0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IE9uIDExLjExLjIwMjIgMTQ6NTgsIEhlbnJ5IFdhbmcgd3Jv
dGU6DQo+ID4gPiBBbm90aGVyIHF1ZXN0aW9uIGZvciBhZGRpbmcgYW5vdGhlciBlbnRyeSBmb3Ig
eDg2IHRoYXQgd29ydGggdG8NCj4gPiA+IGJyYWcgYWJvdXQgYSBsaXR0bGUgYml0OiBJIGRpZCBh
bm90aGVyIGRpZyBpbnRvIHBhdGNod29yayBhbmQgZm91bmQgdGhhdA0KPiA+ID4gdGhpcyBbMV0g
bWlnaHQgYmUgYSBnb29kIGNhbmRpZGF0ZS4gSUlVQyBfX3JvX2FmdGVyX2luaXQgaXMgYSBnb29k
DQo+ID4gPiBmZWF0dXJlIHRoYXQgYm90aCB4ODYgYW5kIEFybSBoYXZlIGxldmVyYWdlZCBpbiBk
aWZmZXJlbnQgbGV2ZWwgdG9kYXksDQo+ID4gPiBzbyBwcm9iYWJseSB0aGUgX19yb19hZnRlcl9p
bml0IG1pZ2h0IHdvcnRoIGFuIGVudHJ5IGluIENIQU5HRUxPRy4NCj4gPiA+DQo+ID4gPiBIb3dl
dmVyIEkgc2F3IHlvdXIgY29tbWVudHMgaW4gWzFdIHNvIEkgYW0gbm90IHJlYWxseSBzdXJlIGlm
IHlvdSBhcmUNCj4gPiA+IGhhcHB5IHdpdGggdGhhdCwgbWF5YmUgd2UgbmVlZCB0byBjaGFuZ2Ug
dGhlIHdvcmRpbmcgYSBsaXR0bGUgYml0IHRvDQo+ID4gPiByZW1vdmUgeW91ciBjb25jZXJuPyBX
b3VsZCB5b3UgbWluZCBzaGFyaW5nIHNvbWUgdGhvdWdodHM/DQo+ID4NCj4gPiBNeSB2aWV3IGhh
c24ndCBjaGFuZ2VkLCBidXQgaWYgQW5kcmV3IGFuZCBSb2dlciB0aGluayB0aGlzIHNob3VsZCBi
ZQ0KPiA+IG1lbnRpb25lZCwNCj4gPiB0aGVuIEknbSBub3QgZ29pbmcgdG8gc3RhbmQgaW4gdGhl
IHdheS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbi4gSSB3aWxsIHdhaXQgZm9y
IFJvZ2VyJ3MgYmFjayBvbiBuZXh0IE1vbmRheQ0KPiB0aGVuLg0KDQpTb3JyeSBJIGZvcmdvdCB0
byBhZGQgeW91IHRvIHRoZSB0aHJlYWQgaW4gbGFzdCBlbWFpbCwgY291bGQgeW91IHBsZWFzZSBz
aGFyZQ0KWW91ciBvcGluaW9uIGFib3V0IHRoaXMgb25lPyBUaGFua3MuDQoNCktpbmQgcmVnYXJk
cywNCkhlbnJ5DQo=

