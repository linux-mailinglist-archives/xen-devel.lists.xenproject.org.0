Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A684FF1D8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 10:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303970.518451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neYKT-0006t0-45; Wed, 13 Apr 2022 08:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303970.518451; Wed, 13 Apr 2022 08:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neYKT-0006r9-0a; Wed, 13 Apr 2022 08:26:21 +0000
Received: by outflank-mailman (input) for mailman id 303970;
 Wed, 13 Apr 2022 08:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMZD=UX=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1neYKQ-0006r3-RB
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 08:26:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 622a1624-bb03-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 10:26:15 +0200 (CEST)
Received: from AM6PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:20b:92::44)
 by VI1PR08MB5453.eurprd08.prod.outlook.com (2603:10a6:803:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 08:26:02 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::21) by AM6PR04CA0031.outlook.office365.com
 (2603:10a6:20b:92::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 13 Apr 2022 08:26:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 08:26:01 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Wed, 13 Apr 2022 08:26:01 +0000
Received: from 839c66ce5aae.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B9EC368-7F73-4BC7-A4BC-6CF18C9F691A.1; 
 Wed, 13 Apr 2022 08:25:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 839c66ce5aae.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Apr 2022 08:25:50 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by DB7PR08MB3564.eurprd08.prod.outlook.com
 (2603:10a6:10:4f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 08:25:48 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0%11]) with mapi id 15.20.5164.020; Wed, 13 Apr
 2022 08:25:48 +0000
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
X-Inumbo-ID: 622a1624-bb03-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7nhm16zvpEznUQS8UGJAuenc1laUi2B+9iJ9ATqBwY=;
 b=LRiGF4O5ZuwG+4Wx0yCPfYvYO6UxhWxDnyi7CjB8/UeDn7pfNTYasfVcbg/PP+YZy5m4K2nAEjADenlGJCIM63zmd92lWrtp5Bj3Lxok2iEPmPs58WcvELH6P7aC9yYh0Cups2GFCGC8yEFeyHp1JDKhiVuQEX7zjT+bMrAetUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5659e721c9ca2d37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9Xb2OAuOo1s2m/hDccjAQ2epOgLSm2fb29csUbrqmXa8Mg4n6jn5zXYReGIghrKzQrtvybLiV018ZoI/Kb05gQztogixeLnWYy6M9tSp3myMOp+jZTmE+zq8QI9H6f4e6xG5DeC4pPJ9bopKtWALP+P4OmoOlB9MqDEK8aP+RgXDl5sgdJO9+tltE5D7NOcDPF5sWNilpDi6TFqW5mohSkz4i/810c9pVYQ3rhBt/OduQWEfsx+e6VBQBGARcfgZ45X6FCWkHHmG/HNNDQ/Iu0+PSjJVe3OxRZt+qwDXxTYkLV8jCH0vahiEXrk+rVy/h4trzulqSvhs+bkccwxtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7nhm16zvpEznUQS8UGJAuenc1laUi2B+9iJ9ATqBwY=;
 b=H7C6pN83GC66H1fxKnGLyTsIygVd8vsZ2pEGJVAqnNnUNAkybeU6SEhHSBFOigvUEDTPkf2x++kWNpB5LcFnq/z7MJrTjgv19p+khLyD+HDXlHgQjHJpp2412JDVS+DEYsaW5NdvvnoMuvflN0rPxIx6dx9ni9l8X5TtK8Tbb1CRPDxqUa6B3Bu/X5ZoYw4r/fBnb3jGvPR8Jr4/k7M9R8MKzXJjCFqo22nLFM2fsakyqZvaco43M0OZNLUm1gKoA83Rs2zwV3PojW08jeLCw8MYYXK3dbol7iREiqOWPa9H7xrFwonK5LMtN9GGL0RPl8E93/CRnirdSZG6W9CmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7nhm16zvpEznUQS8UGJAuenc1laUi2B+9iJ9ATqBwY=;
 b=LRiGF4O5ZuwG+4Wx0yCPfYvYO6UxhWxDnyi7CjB8/UeDn7pfNTYasfVcbg/PP+YZy5m4K2nAEjADenlGJCIM63zmd92lWrtp5Bj3Lxok2iEPmPs58WcvELH6P7aC9yYh0Cups2GFCGC8yEFeyHp1JDKhiVuQEX7zjT+bMrAetUg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Thread-Topic: [PATCH] xen/evtchn: Add design for static event channel
 signaling for domUs..
Thread-Index: AQHYPsy9MfyfmFhecEGJuSNYyusIgKzrHq6AgAKD34A=
Date: Wed, 13 Apr 2022 08:25:48 +0000
Message-ID: <3622A5B1-D64C-43D9-9AA3-2E781C2310B9@arm.com>
References:
 <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <0ecf69d2-c496-d18e-1309-f896ec6bbf4c@xen.org>
In-Reply-To: <0ecf69d2-c496-d18e-1309-f896ec6bbf4c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6c84e02e-14e1-42f4-8279-08da1d273eaf
x-ms-traffictypediagnostic:
	DB7PR08MB3564:EE_|VE1EUR03FT060:EE_|VI1PR08MB5453:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5453B88E300DF0CE18ADCAF8FCEC9@VI1PR08MB5453.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KMxaHbVELO7gADIWJhMXuVIsiQb/3TL7kqUlFkKaP7SpHIIPIA1cGkWzd7jxIt1XE0my5x3Wqz6Pf9O2x/MgycBh6XKfp185HkIFZEjuMoLtSE/JkH+om+GvnmDRfreFKIftr6i8bDhMQpAmdMartWW97KhZPQseObjWcm8H0aKagd6eEd2YioLex48RI/rHnprHWlPPP+7mK/jzLpvzYUR6s0sS0wmx4p0xX6Fr35scb2fCp4ltHq6sgPrBwkyWQb4Sk3aTn/lEOQ9v1e16ikXHMUO9QmXJ/5GKGgbsZvmpsPoBNFE1k1AkWQ64JQ44QTOux12Tm/436FHdn0nTqoTD7xKjVbVBkoEY/dVgMS9Ygvigkpf6aOUKjkoHHZqPEPZA3HvV+vqZApf3F7XCKsnrO1rRz62UdNbKqUZUeTbCdf4bofGHg/W7ZkCkXjy4sGt4pcxHmjMglvbCO30+N8aAK3stY+UDDIbodq05qQXqqZ1rUqWaLAUJfGKSFkXPGEFRBCJcovdAGVtnzGE+ycxmzYeXoidTPBpef6OwEnXc/Uzr12BIFms701gHMgVAN9ngROlcPhrZaRFymfjiU9TrdJhJAlapcXu29Sq5mpX1SB2hkAAyNUa1THlHlQ1on0qfCQ/4o+zCf4qDNkMX27DdQSysVag/DvTn9tyMnp7Xfll6Xtb1B7/2JIfkZmOm4R6B+ZgVQ9FQvsrxWYDBhtOLx6TvcBhUoELskl7UZN/XhU2MEi1xSPwmIlz96W52
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(38100700002)(122000001)(6512007)(316002)(64756008)(8676002)(66446008)(4326008)(66476007)(66556008)(86362001)(8936002)(508600001)(6486002)(66946007)(53546011)(5660300002)(91956017)(2906002)(76116006)(33656002)(38070700005)(71200400001)(6506007)(2616005)(26005)(54906003)(186003)(6916009)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4547F090560C104AAF075CD3850C5942@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3564
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	38866b00-7c4a-409e-42fb-08da1d273680
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UHnPozUeWg+wNPBvAV1KDv5Qo/S6M3ZCadnLJPWIIfXoOeG232r0w6qJXgrvh7Dy6/NIqZt95R7Sj2niFlEQhACNNypR5fde+ntObh5P+057d/pYocZLqb+WggvW7Sc/WqrVUWVmc8RXqPX5mQhcfiJaHfvRBMkho5vOiobnJGSnIaC8OIxPus2fBMhlMUJpWWpV5n1XHkO4pPgnbdRcDI6hL9LFgwJ34XGEnSk4Cf93yq/Ev1THu9YCJkuvNx4vMM+qbKyrh1krCO/DZsJNv8ksXGlFY2gonnuqTj8Ec3u4FGSL5Fdtg4pGCpivp+zoISz63fc6zac8vBL9Euyj5EzueEn3lGl8CwfEQNNTSKoGAHCf3vFzxHoGRJQpvHNBsQ/9J2oXlwE15uqoa2RpwzPfX98hQc+MftX3Nkl55gPng/G6GOy/Qwk6wYmT0Q7Is+FEiDtfIYQz1YaLX9taGk4z3h0xZE/t+8Onmgy2V6ramtOvIh8DSH+iO3ADlta49oW2AKlOjLJYFPitUpfXXt4D2fNa9CsqMWeNLBpveJk61UuIoVV3nfOmEW+mXErIl41xwjrIadtjFuPu1IsUbRewIVXUuLosGZfISXynenf/SC3gezHdpcJdCevtzC9j8qlGT7LAhzWubpROR6RggzW7n7Yq7vO83ljjxVgAN/ABY2mH6zpSJoWxefe4lEIq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2616005)(8676002)(6862004)(6486002)(36860700001)(316002)(2906002)(86362001)(47076005)(6506007)(336012)(82310400005)(33656002)(8936002)(81166007)(356005)(54906003)(4326008)(70206006)(70586007)(40460700003)(53546011)(508600001)(6512007)(186003)(26005)(83380400001)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 08:26:01.7559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c84e02e-14e1-42f4-8279-08da1d273eaf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5453

SGVsbG8gSnVsaWVuLA0KDQpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgZGVzaWduLg0KDQo+IE9u
IDExIEFwciAyMDIyLCBhdCA3OjAxIHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3
cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gVGl0bGU6IHMvLi4vLi4uLw0KPiANCj4gT24g
MjMvMDMvMjAyMiAxNTo0MywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBpbiBkb20wbGVzcyBzeXN0
ZW0uIFRoaXMgcGF0Y2ggaW50cm9kdWNlIHRoZSBuZXcgZmVhdHVyZSB0byBzdXBwb3J0IHRoZQ0K
PiANCj4gcy9pbnRyb2R1Y2UvaW50cm9kdWNlcy8NCj4gcy90aGUgbmV3L2EvDQoNCkFjay4gDQo+
IA0KPj4gc2lnbmFsaW5nIGJldHdlZW4gdHdvIGRvbVVzIGluIGRvbTBsZXNzIHN5c3RlbS4NCj4g
RGlkIHlvdSBpbnRlbmQgdG8gYWRkIGEgbmV3bGluZSBiZWZvcmUgdGhlIHNlY29uZCBzZW50ZW5j
ZT8NCg0KTm8uIEkgd2lsbCBmaXggdGhpcy4NCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVs
IFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4gLS0tDQo+PiBkb2NzL2Rlc2lnbnMvZG9t
MGxlc3MtZXZ0Y2huLm1kIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
PiAxIGZpbGUgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKQ0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0
IGRvY3MvZGVzaWducy9kb20wbGVzcy1ldnRjaG4ubWQNCj4+IGRpZmYgLS1naXQgYS9kb2NzL2Rl
c2lnbnMvZG9tMGxlc3MtZXZ0Y2huLm1kIGIvZG9jcy9kZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5t
ZA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLjZhMWI3ZThj
MjINCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2RvY3MvZGVzaWducy9kb20wbGVzcy1ldnRj
aG4ubWQNCj4+IEBAIC0wLDAgKzEsOTYgQEANCj4+ICsjIFNpZ25hbGluZyBzdXBwb3J0IGJldHdl
ZW4gdHdvIGRvbVVzIG9uIGRvbTBsZXNzIHN5c3RlbQ0KPj4gKw0KPj4gKyMjIEN1cnJlbnQgc3Rh
dGU64oCvRHJhZnQgdmVyc2lvbg0KPj4gKw0KPj4gKyMjIFByb3Bvc2VyKHMpOiBSYWh1bCBTaW5n
aCwgQmVydHJhbmQgTWFycXVpcw0KPj4gKw0KPj4gKyMjIFByb2JsZW0gU3RhdGVtZW50Og0KPj4g
Kw0KPj4gK1RoZSBnb2FsIG9mIHRoaXMgd29yayBpcyB0byBkZWZpbmUgYSBzaW1wbGUgc2lnbmFs
aW5nIHN5c3RlbSBiZXR3ZWVuIFhlbiBndWVzdHMNCj4+ICtpbiBkb20wbGVzcyBzeXN0ZW1zLg0K
Pj4gKw0KPj4gK0luIGRvbTBsZXNzIHN5c3RlbSwgd2UgY2Fubm90IG1ha2UgdXNlIG9mIHhlbmJ1
cyBhbmQgeGVuc3RvcmUgdGhhdCBhcmUgdXNlZCBpbg0KPj4gK25vcm1hbCBzeXN0ZW1zIHdpdGgg
ZHluYW1pYyBWTXMgdG8gY29tbXVuaWNhdGUgYmV0d2VlbiBkb21haW5zIGJ5IHByb3ZpZGluZyBh
DQo+PiArYnVzIGFic3RyYWN0aW9uIGZvciBwYXJhdmlydHVhbGl6ZWQgZHJpdmVycy4NCj4+ICsN
Cj4+ICtPbmUgcG9zc2libGUgc29sdXRpb24gdG8gaW1wbGVtZW50IHRoZSBzaWduYWxpbmcgc3lz
dGVtIGJldHdlZW4gZG9tVXMgaXMgYmFzZWQNCj4+ICtvbiBldmVudCBjaGFubmVscy4NCj4+ICsN
Cj4+ICsjIyBQcm9wb3NhbDoNCj4+ICsNCj4+ICtFdmVudCBjaGFubmVscyBhcmUgdGhlIGJhc2lj
IHByaW1pdGl2ZSBwcm92aWRlZCBieSBYZW4gZm9yIGV2ZW50IG5vdGlmaWNhdGlvbnMuDQo+PiAr
QW4gZXZlbnQgY2hhbm5lbCBpcyBhIGxvZ2ljYWwgY29ubmVjdGlvbiBiZXR3ZWVuIDIgZG9tYWlu
cyAobW9yZSBzcGVjaWZpY2FsbHkNCj4+ICtiZXR3ZWVuIGRvbTEscG9ydDEgYW5kIGRvbTIscG9y
dDIpLiBUaGV5IGVzc2VudGlhbGx5IHN0b3JlIG9uZSBiaXQgb2YNCj4+ICtpbmZvcm1hdGlvbiwg
dGhlIGV2ZW50IG9mIGludGVyZXN0IGlzIHNpZ25hbGxlZCBieSB0cmFuc2l0aW9uaW5nIHRoaXMg
Yml0IGZyb20NCj4+ICswIHRvIDEuIEFuIGV2ZW50IGlzIGFuIGVxdWl2YWxlbnQgb2YgYSBoYXJk
d2FyZSBpbnRlcnJ1cHQuDQo+PiArDQo+PiArTm90aWZpY2F0aW9ucyBhcmUgcmVjZWl2ZWQgYnkg
YSBndWVzdCB2aWEgYW4gaW50ZXJydXB0IGZyb20gWGVuIHRvIHRoZSBndWVzdCwNCj4+ICtpbmRp
Y2F0aW5nIHdoZW4gYW4gZXZlbnQgYXJyaXZlcyAoc2V0dGluZyB0aGUgYml0KS4gDQo+IA0KPiBJ
IGFtIGEgYml0IGNvbmZ1c2VkIHdpdGggdGhlIGRlc2NyaXB0aW9uLiBBcmUgeW91IHRyeWluZyB0
byBleHBsYWluIHRoZSBldmVudCBjaGFubmVsIGluIGxheW1hbiB0ZXJtPyBJZiBub3QsIHRoZW4g
ZXZlbnQgY2hhbm5lbCBwcm90b2NvbCBpcyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhhdCAoaW4g
cGFydGljdWxhciBmb3IgZmlmbykuDQoNClllcyBJIGFtIHRyeWluZyB0byBleHBsYWluIHRoZSBl
dmVudC1jaGFubmVsIGluIHNpbXBsZSB0ZXJtLiANCj4gDQo+PiBGdXJ0aGVyIG5vdGlmaWNhdGlv
bnMgYXJlDQo+PiArbWFza2VkIHVudGlsIHRoZSBiaXQgaXMgY2xlYXJlZCBhZ2Fpbi4NCj4gDQo+
IEkgdGhpbmsgIm1hc2tlZCIgaXMgY29uZnVzaW5nIGhlcmUuDQo+IA0KPiBUaGUgZXZlbnQgY2hh
bm5lbCBkaWZmZXJlbnRpYXRlICJtYXNrIiB2cyAicGVuZGluZyIuIFdoZW4gc2VuZGluZyBhbiBl
dmVudCwgdGhlIHBlbmRpbmcgYml0IHdpbGwgYmUgc2V0IHRvIDEuIElmIGl0IHdhc24ndCBhbHJl
YWR5IHBlbmRpbmcgYW5kIHRoZSBtYXNrIGJpdCBpcyBjbGVhciwgdGhlbiB3ZSB3aWxsIG5vdGlm
eSB0aGUgZ3Vlc3QuDQo+IA0KPiBJZiB0aGUgcGVuZGluZyBiaXQgaXMgYWxyZWFkeSBzZXQsIHRo
ZW4gd2Ugd2lsbCBpZ25vcmUuDQo+IA0KPiBJbiBmYWN0LCB0aGUgZXZlbnQgY2hhbm5lbCBpcyBh
Y3Rpbmcgc2ltaWxhcmx5IHRvIGFuIGVkZ2UgaW50ZXJydXB0LiBJIHdyb3RlIHNpbWlsYXJseSwg
YmVjYXVzZSBJSVJDIHRoZXkgYXJlIGJlaGF2aW5nIHNsaWdodGx5IGRpZmZlcmVudGx5IChzZWUg
WzFdIGZvciBtb3JlIGRldGFpbHMpLg0KDQpPay4gTGV0IG1lIG1vZGlmeSB0aGUgc2VudGVuY2Ug
aW4gbmV4dCB2ZXJzaW9uLg0KPiANCj4+IFdoZW4gYSBkb21haW4gd2FudHMgdG8gd2FpdCBmb3Ig
ZGF0YSBpdA0KPj4gK3dpbGwgYmxvY2sgdW50aWwgYW4gZXZlbnQgYXJyaXZlcywgYW5kIHRoZW4g
c2VuZCBhbiBldmVudCB0byBzaWduYWwgdGhhdCBkYXRhDQo+PiAraGFzIGJlZW4gY29uc3VtZWQu
DQo+PiBFdmVudHMgYXJlIGRlbGl2ZXJlZCBhc3luY2hyb25vdXNseSB0byBndWVzdHMgYW5kIGFy
ZQ0KPj4gK2VucXVldWVkIHdoZW4gdGhlIGd1ZXN0IGlzIG5vdCBydW5uaW5nLg0KPiANCj4gcy9n
dWVzdC9kb21haW4vIHRvIHN0YXkgY29uc2lzdGVudCBhbmQgYWxzbyBpbmNsdWRlIGRvbTAvaGFy
ZHdhcmUgZG9tYWluLg0KQWNrLg0KPiANCj4+ICsNCj4+ICtFdmVudCBjaGFubmVsIGNvbW11bmlj
YXRpb24gd2lsbCBiZSBlc3RhYmxpc2hlZCBzdGF0aWNhbGx5IGJldHdlZW4gdHdvIGRvbVUNCj4+
ICtndWVzdHMgYmVmb3JlIHVucGF1c2luZyB0aGUgZG9tYWlucyBhZnRlciBkb21haW4gY3JlYXRp
b24uIEV2ZW50IGNoYW5uZWwNCj4+ICtjb25uZWN0aW9uIGluZm9ybWF0aW9uIGJldHdlZW4gZG9t
VXMgd2lsbCBiZSBwYXNzZWQgdG8gWEVOIHZpYSBkZXZpY2UgdHJlZQ0KPj4gK25vZGUuDQo+IA0K
PiBXaHkgYXJlIHdlIGxpbWl0aW5nIG91cnNlbGYgdG8gZG9tVXM/DQoNCkFzIHRoaXMgZGVzaWdu
IGlzIGZvciBhIGRvbTBsZXNzIHN5c3RlbSBJIG1lYW4gaGVyZSB0byBhbGwgdGhlIGRvbWFpbnMg
b24gdGhlIGRvbTBsZXNzIHN5c3RlbS4NCldoYXQgSSB1bmRlcnN0YW5kIGlzIHRoYXQgYWxsIGRv
bWFpbnMgaW4gdGhlIGRvbTBsZXNzIHN5c3RlbSBhcmUgY2FsbGVkIGFzIGRvbVVzLg0KUGxlYXNl
IGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4NCg0KPiANCj4+ICsNCj4+ICtVbmRlciB0aGUgL2No
b3NlbiBub2RlLCB0aGVyZSBuZWVkcyB0byBiZSBzdWIgbm9kZXMgd2l0aCBjb21wYXRpYmxlDQo+
PiArInhlbixldnRjaG4iIHRoYXQgZGVzY2liZXMgdGhlIGV2ZW50IGNoYW5uZWwgY29ubmVjdGlv
biBiZXR3ZWVuIHR3byBkb21Vcy4NCj4gDQo+IHMvZGVzY2liZXMvZGVzY3JpYmVzLw0KDQpBY2su
IA0KDQo+IA0KPj4gKw0KPj4gK1RoZSBldmVudCBjaGFubmVsIHN1Yi1ub2RlIGhhcyB0aGUgZm9s
bG93aW5nIHByb3BlcnRpZXM6DQo+PiArDQo+PiArLSBjb21wYXRpYmxlDQo+PiArDQo+PiArICJ4
ZW4sZXZ0Y2huIg0KPj4gKw0KPj4gKy0geGVuLGV2dGNobg0KPj4gKw0KPj4gKyBUaGUgcHJvcGVy
dHkgaXMgZm91ciBudW1iZXJzIG9mIHR1cGxlcyBvZg0KPj4gKyAobG9jYWwtcG9ydC1kb21VMSxk
b21VMS1waGFuZGxlLGxvY2FsLXBvcnQtZG9tVTIsZG9tVTItcGhhbmRsZSkgd2hlcmU6DQoNCj4g
VGhpcyBpcyBxdWl0ZSBkaWZmaWN1bHQgdG8gcmVhZC4gQ2FuIHdlIGFkZCBzb21lIHNwYWNlIGJl
Zm9yZS9hZnRlciBlYWNoIGNvbW1hPw0KDQpBY2suIA0KPiANCj4+ICsNCj4+ICsgbG9jYWwtcG9y
dC1kb21VMSBpcyBhbiBpbnRlZ2VyIHZhbHVlIHRoYXQgd2lsbCBiZSB1c2VkIHRvIGFsbG9jdGUg
bG9jYWwNCj4gDQo+IHMvYWxsb2N0ZS9hbGxvY2F0ZS8NCg0KQWNrLiANCj4gDQo+PiArIHBvcnQg
Zm9yIGRvbVUxIHRvIHNlbmQgYW4gZXZlbnQgbm90aWZpY2F0aW9uIHRvIHRoZSByZW1vdGUgZG9t
YWluLg0KPiANCj4gVGhlIHBvcnQgd2lsbCBiZSB1c2VkIGZvciBzZW5kaW5nIGJ1dCBhbHNvIHJl
Y2VpdmluZyBldmVudCBub3RpZmljYXRpb24uDQoNClllcy4gSSB3aWxsIG1vZGlmeS4NCj4gDQo+
IEFsc28sIEkgd291bGQgc3VnZ2VzdCB0byByZXBsYWNlICJyZW1vdGUgZG9tYWluIiB3aXRoICJk
b21VMiIuIFNvIGl0IGlzIG1vcmUgZXhwbGljaXQuDQoNCkFjay4gDQo+IA0KPj4gKw0KPj4gKyBk
b21VMS1waGFuZGxlIGlzIGEgc2luZ2xlIHBoYW5kbGUgdG8gYW4gZG9tYWluIHRvIHdoaWNoIGxv
Y2FsLXBvcnQtZG9tVTENCj4gDQo+IHMvYW4gZG9tYWluL2EgZG9tYWluLyBJIHRoaW5rLg0KDQpB
Y2suIA0KPiANCj4+ICsgd2lsbCBiZSBhbGxvY2F0ZWQuDQo+PiArDQo+PiArIGxvY2FsLXBvcnQt
ZG9tVTIgaXMgYW4gaW50ZWdlciB2YWx1ZSB0aGF0IHdpbGwgYmUgdXNlZCB0byBhbGxvY3RlIGxv
Y2FsDQo+IA0KPiBzL2FsbG9jdGUvYWxsb2NhdGUvDQoNCkFjay4gDQo+IA0KPj4gKyBwb3J0IGZv
ciBkb21VMiB0byBzZW5kIGFuIGV2ZW50IG5vdGlmaWNhdGlvbiB0byB0aGUgcmVtb3RlIGRvbWFp
bi4NCj4gDQo+IFNhbWUgYXMgYWJvdmUgZm9yICJyZW1vdGUgZG9tYWluIi4NCg0KQWNrLiAgDQoN
ClJlZ2FyZHMsDQpSYWh1bA0KDQo=

