Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839DF632015
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 12:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446535.702149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4lJ-00016x-1L; Mon, 21 Nov 2022 11:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446535.702149; Mon, 21 Nov 2022 11:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4lI-00013x-Uj; Mon, 21 Nov 2022 11:14:52 +0000
Received: by outflank-mailman (input) for mailman id 446535;
 Mon, 21 Nov 2022 11:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQtr=3V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ox4lH-00013r-VF
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 11:14:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b67345da-698d-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 12:14:49 +0100 (CET)
Received: from AS8PR04CA0193.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::18)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 11:14:41 +0000
Received: from VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::14) by AS8PR04CA0193.outlook.office365.com
 (2603:10a6:20b:2f3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Mon, 21 Nov 2022 11:14:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT060.mail.protection.outlook.com (100.127.144.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Mon, 21 Nov 2022 11:14:40 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Mon, 21 Nov 2022 11:14:40 +0000
Received: from ee2e8895edc2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8DDF3B3-A6B3-4D73-8FCA-56768C95823F.1; 
 Mon, 21 Nov 2022 11:14:34 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee2e8895edc2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Nov 2022 11:14:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9586.eurprd08.prod.outlook.com (2603:10a6:10:454::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 11:14:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Mon, 21 Nov 2022
 11:14:32 +0000
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
X-Inumbo-ID: b67345da-698d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr8Jxdu00rHfsJfBUD0rCF1ad1sc/8lJ/F5h0Q/2xlc=;
 b=KSyzB8+rbZUACHWdSi8RaxYe6cNln+kogIHj5tRik5PMHxwzyHa/XQats+JBY+4NMQGbumpJLn4f4UrL7VM/Lug/qAOYsWFgtxHTMZlm3fN/NsJNBMfmj0RDlxXMEj5sU9OPaQmig5mGaWHzeUFEUXM+GhpV/ojVdAJk+Cek1Lk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaNmNM+jDSCrluv0Cl8aveTtGwI/V3d6wVJ8KWkgg0KRuhvMBfSuor+hKtPYwdB3e6X23tlhtizODnDmag3iSY2bh2i1GtzN5RI9gwZAkknAtfxs5NGiP/Lt11Wr32u61A4hdkRVG7APdkhNTVuYZGhCGBxXZ2WlkieeuZ60TOWEcwBezSu5J1v6RITAI4IoIa4Xr+QYTwcQLbg3tsMxc19KHk3cPXs15C5fcrAkFOhwnFXiI5G+g/5P0gcWtfghyUJIMGoO6E94Dx8GR1TUZ4o7+HIjXlwq9eAMr6+M5oRzCt8knOcL4uFGye7iAMbnTdtuhOcjBzVEwT/ESrJkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr8Jxdu00rHfsJfBUD0rCF1ad1sc/8lJ/F5h0Q/2xlc=;
 b=mxyu3mFbxSCFEINXby86CntXI0uxYGxz+joWJnKPBPkxTVAT/uHZtcCdzj+nZqXThLVzelnAYAuESwLZvkCwCOV2wyoDMvf5UhP1D8gS6Pt+fAmM4sXyJFMi647h9/2t+rxcd31vKp9ZzxhsZTvwVAYpVdaoWWfwlvdh2s8iuUVi71f5t31uhHyBUUpVXmEeneeyBoLICbIVxTxFkfPwTMS/NOR6CV5Ru85uvTnCOR1Bc7RZxNKTG/M1+JHntp60j2PR4NIjtWt+boxB7ywJIipWW9xU54qUBKQ1b3v2dmsSOo793I6mtf9JAYQeWom20iiFCPsvYThMQEgBt9cymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr8Jxdu00rHfsJfBUD0rCF1ad1sc/8lJ/F5h0Q/2xlc=;
 b=KSyzB8+rbZUACHWdSi8RaxYe6cNln+kogIHj5tRik5PMHxwzyHa/XQats+JBY+4NMQGbumpJLn4f4UrL7VM/Lug/qAOYsWFgtxHTMZlm3fN/NsJNBMfmj0RDlxXMEj5sU9OPaQmig5mGaWHzeUFEUXM+GhpV/ojVdAJk+Cek1Lk=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] efifb: ignore frame buffer with invalid configuration
Thread-Topic: [PATCH v2] efifb: ignore frame buffer with invalid configuration
Thread-Index: AQHY+1fO1GnKKHbNPku6hX+/5ZUkBa5JDEEAgAAxRhA=
Date: Mon, 21 Nov 2022 11:14:32 +0000
Message-ID:
 <AS8PR08MB799147DE1D2C5655A00A8819920A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221118141132.26242-1-roger.pau@citrix.com>
 <f14d9d4c-6761-dc4d-8f7a-e51b816d29fb@suse.com>
In-Reply-To: <f14d9d4c-6761-dc4d-8f7a-e51b816d29fb@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D5B19C168787A34F9D9EA693F73114D3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9586:EE_|VI1EUR03FT060:EE_|DB9PR08MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: d67a91c0-4896-468b-f1a1-08dacbb195c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EcLU1Vmvyj0wFfgbhlHim1m295poZzfNFoQVkOiTmvi/QRGq1T/2OVDwPJEYMy7qW8vvRpC4Devvfw3EMWdJFFPb0lk+trIOCLKV5/4fr5bF95G+vq1H93n94JtQv5n17PkxhanUUR+R+9w6LTkyYO+ih9ZMJtJhd6b0xtSA/ReRV/8sPCCKUNMmWDeyLCeD+TBQS+rXCqAqGO5paFN1+pKqEpgaZ0sAgWkIfKRrQjjp1M+YKsYQouMspzU0V5hlL9ZGd2gGBGW7BzpZiH32RYR97/hpiTrkimTsvNqYZhG7dcSdLqaC3F1gXcjISaxr5S1ZjCqXMJGEYw3fXEEKzkgejwq43Pcjle4jz/ItHA/kUcm75IvXScDJRLXN+sqQUW+MCgEs05n27kbw0oZzGnGHZ3FE5yTwsVLdMvjNn7d4xAN6j/J0f3Ah9RbR0J2Hr+RSWT9l87hUZITAbt4ZEjvz58una6QWth8P4bQ+nuspp43mepQl3Dq18FJrraUfFP0Xg1giU1HRjp2uf2nF122IE+Syj9CV8AA2lS2SnNq7vaoyxzC1zvuhs2qVitLEvO2Oyixd8GyTUFzEpA4d/XHv6UZ1bUjdcLwAquw+ihuqarlcvOB1NNB/k2GjsuTFUaFZPWpJw4lMoCzgH6pvCO+Bc9O9lOirRGrJldFfWr+guhrfTu5v2tNYgMfo5hLnzTTkkXF6oNnTt+J4VyJb1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(86362001)(122000001)(83380400001)(38100700002)(38070700005)(41300700001)(2906002)(52536014)(8936002)(5660300002)(478600001)(55016003)(53546011)(7696005)(6506007)(26005)(8676002)(4326008)(66556008)(66446008)(66476007)(76116006)(66946007)(316002)(9686003)(110136005)(54906003)(186003)(64756008)(71200400001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9586
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19d92849-88c4-4e7f-bc79-08dacbb190f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPLM3m9Fly9z84/NR6iouUiIiyl2gdifRvkfs3lbZsWXS/+/0vOa6pye9ebaplp2HwXb44XIvsmI7HVhZWw0DfUpmKVgEiOZA6Ah0d9RFdweqwf8fJoOTnSfpcJaPfbgWjALKKUwz5zgPJA1BjIqQQk/qKYzQbjHn7E7hsgNIxdNJSLd87XHGwk3vZ6DnSKZjk7CKjsvkCh6b4ZDEY9KIAF/KM/Ih6zE4h0ASf2eN5euzGYYmzvBXEf/pZYoWQo2q6uZqfwVtyfD5re2m3vH/WQBRAv4YyDJONWUyMGneT7s+ADJL1ijkcE3j7csEeW8ColGVASal/sjABE4rVJk+rUTybHBn+l6aqAW92l9aiDEZpzWocTBiSd3RTsQW+T2bZD+s5O7IAL+AezbYY/MMRv/D68Tm7IfpAjYvpzIminnDjOu+bBKeam2sf0UKvamZtQB+ijRZaNuFEsyUDTUq1pvUOYI1xUHYKoKQEK6RwHTe82Zi0dlZgshN4ZIam5QirLPCfylcOuYIpKSeJZ1GG6EyILfk0o/+41O4Eb9HHWGe9jogJqbzHzkDC6VGcPH53k9g1xas6L7LL+EVQmmSxF68IZepeII/XZd73sqa78c/rqE/JriA+mTXqZIMgskQtzJ0d7EMZXDp2fvPl5im+3a5jRDuiypkRk6XXKrsFLLjt2gwI8Tp9faNDMll2jxHmC+H4CxP9Nc9wpAL1Mo4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(40480700001)(8936002)(52536014)(316002)(54906003)(70586007)(5660300002)(4326008)(8676002)(70206006)(478600001)(82740400003)(55016003)(86362001)(6506007)(83380400001)(26005)(110136005)(81166007)(356005)(2906002)(33656002)(9686003)(7696005)(186003)(336012)(47076005)(82310400005)(40460700003)(53546011)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 11:14:40.7614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67a91c0-4896-468b-f1a1-08dacbb195c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425

SGkgUm9nZXIgYW5kIEphbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyXSBlZmlmYjogaWdub3JlIGZyYW1lIGJ1ZmZlciB3aXRoIGludmFs
aWQgY29uZmlndXJhdGlvbg0KPiANCj4gT24gMTguMTEuMjAyMiAxNToxMSwgUm9nZXIgUGF1IE1v
bm5lIHdyb3RlOg0KPiA+IE9uIG9uZSBvZiBteSBib3hlcyB3aGVuIHRoZSBIRE1JIGNhYmxlIGlz
IG5vdCBwbHVnZ2VkIGluIHRoZQ0KPiA+IEZyYW1lQnVmZmVyQmFzZSBvZiB0aGUgRUZJX0dSQVBI
SUNTX09VVFBVVF9QUk9UT0NPTF9NT0RFDQo+IHN0cnVjdHVyZSBpcw0KPiA+IHNldCB0byAwIGJ5
IHRoZSBmaXJtd2FyZSAod2hpbGUgc29tZSBvZiB0aGUgb3RoZXIgZmllbGRzIGxvb2tpbmcNCj4g
PiBwbGF1c2libGUpLg0KPiA+DQo+ID4gU3VjaCAoYm9ndXMgYWRkcmVzcykgZW5kcyB1cCBtYXBw
ZWQgaW4gdmVzYV9pbml0KCksIGFuZCBzaW5jZSBpdA0KPiA+IG92ZXJsYXBzIHdpdGggYSBSQU0g
cmVnaW9uIHRoZSB3aG9sZSBzeXN0ZW0gZ29lcyBkb3duIHByZXR0eSBiYWRseSwNCj4gPiBzZWU6
DQo+ID4NCj4gPiAoWEVOKSB2ZXNhZmI6IGZyYW1lYnVmZmVyIGF0IDB4MDAwMDAwMDAwMDAwMDAw
MCwgbWFwcGVkIHRvDQo+IDB4ZmZmZjgyYzAwMDIwMTAwMCwgdXNpbmcgMzUyMDlrLCB0b3RhbCAz
NTIwOWsNCj4gPiAoWEVOKSB2ZXNhZmI6IG1vZGUgaXMgMHgzNzU1N3gzMiwgbGluZWxlbmd0aD05
NjAsIGZvbnQgOHgxNg0KPiA+IChYRU4pIHZlc2FmYjogVHJ1ZWNvbG9yOiBzaXplPTg6ODo4Ojgs
IHNoaWZ0PTI0OjA6ODoxNg0KPiA+IChYRU4pIChYRU4pIChYRU4pIChYRU4pIChYRU4pIChYRU4p
IChYRU4pIChYRU4pIO+/vUVSUk9SOiBDbGFzczowOw0KPiBTdWJjbGFzczowOyBPcGVyYXRpb246
IDANCj4gPiBFUlJPUjogTm8gQ29uT3V0DQo+ID4gRVJST1I6IE5vIENvbkluDQo+ID4NCj4gPiBE
byBsaWtlIExpbnV4IGFuZCBwcmV2ZW50IHVzaW5nIHRoZSBFRkkgRnJhbWUgQnVmZmVyIGlmIHRo
ZSBiYXNlDQo+ID4gYWRkcmVzcyBpcyAwLiAgVGhpcyBpcyBpbmxpbmUgd2l0aCB0aGUgbG9naWMg
aW4gTGludXhlcw0KPiA+IGZiX2Jhc2VfaXNfdmFsaWQoKSBmdW5jdGlvbiBhdCBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2VmaWZiLmMgdjYuMC45Lg0KPiA+DQo+ID4gU2VlIGFsc28gTGludXggY29tbWl0
IDEzM2JiMDcwZTk0YWI0MWQ3NTBjNmYyMTYwYzg4NDNlNDZmMTFiNzggZm9yDQo+ID4gZnVydGhl
ciByZWZlcmVuY2UuDQo+ID4NCj4gPiBBbHNvIHByZXZlbnQgdXNpbmcgRnJhbWUgQnVmZmVycyB0
aGF0IGhhdmUgYSAwIGhlaWdodCBvciB3aWR0aCwgYXMNCj4gPiB0aG9zZSBhcmUgYWxzbyBpbnZh
bGlkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpJIHNhdyB0aGUgSVJDL01hdHJpeCBtZXNzYWdlIGZyb20gYm90aCBvZiB5b3Uu
IFNpbmNlIEphbiBtZW50aW9uZWQNCnRoYXQgdGhpcyBwYXRjaCB3aWxsIGJlIGJhY2twb3J0ZWQg
YW55d2F5IGFuZCB0aGlzIGlzIGEgYnVnZml4IHBhdGNoDQpmb3Igc2FmZXR5IG9mIHRoZSBjb2Rl
LiBJIGFtIGdpdmluZyBteSByZWxlYXNlLWFjayB0byByZWR1Y2UgdGhlDQptYWludGVuYW5jZS9i
YWNrcG9ydCBidXJkZW4gZm9yIGNvbW1pdHRlcnMuDQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5
IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg==

