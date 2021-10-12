Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBE542A750
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207310.363093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIru-0003ry-So; Tue, 12 Oct 2021 14:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207310.363093; Tue, 12 Oct 2021 14:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIru-0003pJ-Pd; Tue, 12 Oct 2021 14:35:02 +0000
Received: by outflank-mailman (input) for mailman id 207310;
 Tue, 12 Oct 2021 14:35:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maIrt-0003pD-2f
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:35:01 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::60f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 882ebdf1-973d-4667-8e3e-5a633381bdb5;
 Tue, 12 Oct 2021 14:34:58 +0000 (UTC)
Received: from AM6P192CA0100.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::41)
 by AM6PR08MB3992.eurprd08.prod.outlook.com (2603:10a6:20b:a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 14:34:55 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::9e) by AM6P192CA0100.outlook.office365.com
 (2603:10a6:209:8d::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Tue, 12 Oct 2021 14:34:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 14:34:55 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Tue, 12 Oct 2021 14:34:54 +0000
Received: from 9580579dfab0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2843FE71-1F80-45F3-8040-64B28F9BD6A0.1; 
 Tue, 12 Oct 2021 14:34:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9580579dfab0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 14:34:47 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB1750.eurprd08.prod.outlook.com (2603:10a6:4:39::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 14:34:45 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 14:34:45 +0000
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
X-Inumbo-ID: 882ebdf1-973d-4667-8e3e-5a633381bdb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/OPZo2EJLtwgu0qtytCBTTOfvDfWlVEMa5hLZsP31E=;
 b=IcWGTByWojCiZMl8u6/nDiBBvqiz4ON+387ONdQC7kj96ykPjr5Y/Tx4N/kDrvOjLOUZIr6sqXi3hzAXhdik1Z+E54bDbxylqzJ63SRMNeS06FMz9I0Hmp9HAbkXNkGd7sB4u/jEikOygunCLjKU95mzFtwH1tDI/q/O4tf05RM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e64bac94060bb996
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmDLVRMmgKzX0CbWBuPn9c04w6p6SuI8GpOTHS3hBJU93fL5z733LFKPh8E65XOhXmxbrxjMxUf/OB+ISzODKekAd/h4eLSa8vU7QrT5vxogTyd05KGxDwhjVM4GKoOU5Dy6uMhNzftvl1k4hNm9vR30B/JD/a1WEnu8mzO2bucg4eTKFtvNZfZN/CArQPuxMk4c3vRPziv7VCwWqt6hIqm43K2NyaPBZwny3HcbNrnRYALwMeKQiELy48B2/vd71xEDVAsGIjHhdazzD6gZCn+immTBMcb6JzXi+GC2ImCjb0visKydUDzE59l6u80E+5CSGrSWSh+f7CxNRn7AwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/OPZo2EJLtwgu0qtytCBTTOfvDfWlVEMa5hLZsP31E=;
 b=NS50L8N/3g7ecMHaUwotxBFalXgl/5t4qSWCcHc2JeJ0xICVhyBTTubAbR4LCwpM1mR0V1R4yBahuDWVT7w7qe9ckND3mQC3oOtDXD4easS9JUFAMEXqz82yACC2rMkS1O8UzC7qa+cMj8UNTM7JjP/fuzaY/2k2beVjCx+8ttQ9xExgxazayNCjsifYVlB3kUzviJgqZoWIry4xiWXEbsdLelFhS3rFAbXa6f3T2RGb1FxAYLzbRout7RAmSyxHP2+wSa41rH3PfgzK6UC6SBJ1XC9ToiZLyMbjcHiOLgFtQQuSIOGIDm2+FO16nl3i5TXrxHaO/tN/ZRXPI+BPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/OPZo2EJLtwgu0qtytCBTTOfvDfWlVEMa5hLZsP31E=;
 b=IcWGTByWojCiZMl8u6/nDiBBvqiz4ON+387ONdQC7kj96ykPjr5Y/Tx4N/kDrvOjLOUZIr6sqXi3hzAXhdik1Z+E54bDbxylqzJ63SRMNeS06FMz9I0Hmp9HAbkXNkGd7sB4u/jEikOygunCLjKU95mzFtwH1tDI/q/O4tf05RM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavPdjAAgAAAt4A=
Date: Tue, 12 Oct 2021 14:34:45 +0000
Message-ID: <FD746284-1A8C-4964-982B-6B2A4E127077@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <82a77cd7-4562-48ac-805e-69ec46e45ef7@xen.org>
In-Reply-To: <82a77cd7-4562-48ac-805e-69ec46e45ef7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 774df500-559e-4ddd-281d-08d98d8d75a2
x-ms-traffictypediagnostic: DB6PR0801MB1750:|AM6PR08MB3992:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3992B605A09A9472A50B9D299DB69@AM6PR08MB3992.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:883;OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B7lreuX8a+yPM8ncFYYzlekNuRkpiuYJH1uHhrfhK3hYZLN48RL2CjJ7St/Goue5HMkpm22bwKm4CT5GA6fCfw1AEUIcp3J7nYREj0wUGhLewnDNFfgOKjrjkKai1fcTvbsm/epYzRz5cYXEWeAaCy6m+/ZaT3/yB2OofJWs/tuH/fUvi0wyPJm0xbILcLqeyTFbKPv9/C6/vyLOaTJj2qYaXiZQY6sFTWYhBR7DqQP/Igc2qiRkqWtTQ8UCOhN5VQttBjH07nmj2LLnpWIrhrnjXr2chpzF4w/XrMkT3xwoQhRpaJT/FMamKPGASf7P5Pqyb+0AWui+L+Sh8EavNkh2nbAWzUanGWhvpMvh7R3umvgB94VveDdmXC50iAcSvwCZwThqDK0GLdcT61zhlJu58h0aVi+Ar3tMzA86c2/8xZAw4hMR0SkFe4APAcmDFYdf26ORmLVGWZ9yVREaTgb4sIjliEeixYttEeYzs9v0K7Id2GrrPYE1J/GFCXdjc45r+xVDP2qrbbu7KIPL8+v28NQxLI0aZqgctHUrwtPogV/nCdtQ9ulBopv2fNadxIGra/U188djZOp0PWAa0jlCKlh+v0Z7ZCWRxXkt2BXAOvrhRz21U4yIQhMyMcBToNn1pkLcRNDsRA5hN478X3u+PKbgePleI751GqtVFXLmyEIzxcyw3evOOkGQJCZdQgUNOl5C9y1d1vjf+bqoIsKhs3aFgxWHDrIA+cfHtOgQUlvAXaKV+I80PuIE++9D
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(8676002)(66476007)(66556008)(7416002)(2616005)(76116006)(64756008)(8936002)(6486002)(186003)(66446008)(66946007)(316002)(91956017)(4326008)(86362001)(33656002)(38070700005)(26005)(54906003)(36756003)(38100700002)(53546011)(6512007)(122000001)(5660300002)(6916009)(6506007)(508600001)(2906002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D160864B5CE8A8459B0E838DEB8D37BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1750
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6bafb5c-84c3-4874-fe66-08d98d8d6fc6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oDrQHkW2VPzPEmi03XS23uVBBhOWT8UtOaBmyyNQz1Nb6oIAt96omXP6asqUhqg8tuQ9oLmKVbQAQU5WnwIFcFrjcIc+HVGMI981Fj4w4PLfmh726CrHrB+RCE7qARCZgZ0xH8oI4IAwzbXC5Czs5es8EXAZQ5/ro86VP+uW85yQoEIimP5GHx6NJRGDSTVpbc5JPZ76pSEXF77EE2+bDXdvV8OBhP+cmYomABToDgsMjRscpP87MduHNoykVFim7wT7JjM7gOT8tAoBAPWYJA2bvHzBGPcmsu/8UfDfAhUf2YgDesK/+YYDk6pIPwpaxSNFqJ0jo37nJwsRbULoUEI9pPbt0HI5h7X23K8sPHPQQWCwMA/kersvukgEXeFXlSfG8If97EeDDbGGH6kFNA4MZ75eQJwWbS1L+DpHwk/wdbHvbPVIcaHMfd9Ub2gg7F4wOmo6ANKs30WnnWmrrHDh4kyWwQHWHWex0sQBMTK1zRXZr7VZAcLusBhOc6lNjHFzsdBt//sRkGLPiWMt5xn5vAE+jubKOj/ofs85A0+S52aXO9em5XtBwObycgfWnnt+muXqMiADEVtCt7eU/z8CDLHCEc6tGDDoJEXE91YiVMXveX1ZolATQw1ybm2vXr/wQBfZuy51QEJ7e9iuS9cwPK8aTShN4j6SymaIowezTj7VKK145z6NhQ/7dxdXXORY1cQFR0HPzh4qcDherg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(70206006)(83380400001)(356005)(70586007)(47076005)(2616005)(81166007)(8676002)(316002)(336012)(6512007)(36860700001)(508600001)(6506007)(36756003)(82310400003)(86362001)(54906003)(8936002)(6486002)(186003)(26005)(2906002)(33656002)(6862004)(5660300002)(107886003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 14:34:55.1633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774df500-559e-4ddd-281d-08d98d8d75a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3992

SGkgSnVsaWVuLA0KDQo+IE9uIDEyIE9jdCAyMDIxLCBhdCAxNTozMiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+IE9uIDA2LzEwLzIw
MjEgMTg6NDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oDQo+PiBpbmRl
eCBjOTI3N2I1YzZkLi45MWQ2MTRiMzdlIDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9kb21haW4uaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaA0KPj4g
QEAgLTIsNiArMiw3IEBADQo+PiAgI2RlZmluZSBfX0FTTV9ET01BSU5fSF9fDQo+PiAgICAjaW5j
bHVkZSA8eGVuL2NhY2hlLmg+DQo+PiArI2luY2x1ZGUgPHhlbi9ub3NwZWMuaD4NCj4+ICAjaW5j
bHVkZSA8eGVuL3RpbWVyLmg+DQo+PiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+DQo+PiAgI2luY2x1
ZGUgPGFzbS9wMm0uaD4NCj4+IEBAIC0yNjIsNyArMjYzLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBhcmNoX3ZjcHVfYmxvY2soc3RydWN0IHZjcHUgKnYpIHt9DQo+PiAgICAjZGVmaW5lIGFyY2hf
dm1fYXNzaXN0X3ZhbGlkX21hc2soZCkgKDFVTCA8PCBWTUFTU1RfVFlQRV9ydW5zdGF0ZV91cGRh
dGVfZmxhZykNCj4+ICAtI2RlZmluZSBoYXNfdnBjaShkKSAgICAoeyAodm9pZCkoZCk7IGZhbHNl
OyB9KQ0KPj4gKy8qDQo+PiArICogRm9yIFg4NiBWUENJIGlzIGVuYWJsZWQgYW5kIHRlc3RlZCBm
b3IgUFZIIERPTTAgb25seSBidXQNCj4+ICsgKiBmb3IgQVJNIHdlIGVuYWJsZSBzdXBwb3J0IFZQ
Q0kgZm9yIGd1ZXN0IGRvbWFpbiBhbHNvLg0KPj4gKyAqLw0KPiANCj4gVGhpcyBpcyB0aGUgc29y
dCBvZiBjb21tZW50IHRoYXQgd2lsbCBlYXNpbHkgZ2V0IHJvdCBpZiB3ZSBjaGFuZ2UgdGhlIGJl
aGF2aW9yIG9uIHg4Ni4gQnV0IEkgZmluZCBhIGJpdCBvZGQgdG8ganVzdGlmeSB0aGUgaW1wbGVt
ZW50YXRpb24gYmFzZWQgb24geDg2LiBDYW4gd2Ugc2ltcGx5IGF2b2lkIHRvIG1lbnRpb24geDg2
Pw0KDQpZZXMgSSB3aWxsIHJlbW92ZSB0aGUgeDg2IHBhcnQgb2YgaXQuDQoNCkNoZWVycw0KQmVy
dHJhbmQNCg0KPiANCj4+ICsjZGVmaW5lIGhhc192cGNpKGQpIGV2YWx1YXRlX25vc3BlYygoZCkt
Pm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl92cGNpKQ0KPj4gICAgI2VuZGlmIC8qIF9fQVNNX0RP
TUFJTl9IX18gKi8NCj4+ICBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wY2kuaCBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvcGNpLmgNCj4+IGluZGV4IGUwNzY5NTEwMzIuLmM0YTRmZGNi
YzIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3BjaS5oDQo+PiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L3BjaS5oDQo+PiBAQCAtNiw4ICs2LDYgQEANCj4+ICAjZGVmaW5l
IENGOF9BRERSX0hJKGNmOCkgKCAgKChjZjgpICYgMHgwZjAwMDAwMCkgPj4gMTYpDQo+PiAgI2Rl
ZmluZSBDRjhfRU5BQkxFRChjZjgpICghISgoY2Y4KSAmIDB4ODAwMDAwMDApKQ0KPj4gIC0jZGVm
aW5lIE1NQ0ZHX0JERihhZGRyKSAgKCAoKGFkZHIpICYgMHgwZmZmZjAwMCkgPj4gMTIpDQo+PiAt
DQo+PiAgI2RlZmluZSBJU19TTkJfR0ZYKGlkKSAoaWQgPT0gMHgwMTA2ODA4NiB8fCBpZCA9PSAw
eDAxMTY4MDg2IFwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB8fCBpZCA9PSAweDAxMjY4
MDg2IHx8IGlkID09IDB4MDEwMjgwODYgXA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHx8
IGlkID09IDB4MDExMjgwODYgfHwgaWQgPT0gMHgwMTIyODA4NiBcDQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1h
cm0uaA0KPj4gaW5kZXggZDQ2YzYxZmNhOS4uNDRiZTMzN2RlYyAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaA0KPj4gQEAgLTQxOCw2ICs0MTgsMTMgQEAgdHlwZWRlZiB1aW50NjRfdCB4ZW5f
Y2FsbGJhY2tfdDsNCj4+ICAjZGVmaW5lIEdVRVNUX0dJQ1YzX0dJQ1IwX0JBU0UgICAgIHhlbl9t
a191bGxvbmcoMHgwMzAyMDAwMCkgLyogdkNQVTAuLjEyNyAqLw0KPj4gICNkZWZpbmUgR1VFU1Rf
R0lDVjNfR0lDUjBfU0laRSAgICAgeGVuX21rX3VsbG9uZygweDAxMDAwMDAwKQ0KPj4gICsvKg0K
Pj4gKyAqIDI1NiBNQiBpcyByZXNlcnZlZCBmb3IgVlBDSSBjb25maWd1cmF0aW9uIHNwYWNlIGJh
c2VkIG9uIGNhbGN1bGF0aW9uDQo+PiArICogMjU2IGJ1c2VzIMOXIDMyIGRldmljZXMgw5cgOCBm
dW5jdGlvbnMgw5cgNCBLQiA9IDI1NiBNQg0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgR1VFU1RfVlBD
SV9FQ0FNX0JBU0UgICAgeGVuX21rX3VsbG9uZygweDEwMDAwMDAwKQ0KPj4gKyNkZWZpbmUgR1VF
U1RfVlBDSV9FQ0FNX1NJWkUgICAgeGVuX21rX3VsbG9uZygweDEwMDAwMDAwKQ0KPj4gKw0KPj4g
IC8qIEFDUEkgdGFibGVzIHBoeXNpY2FsIGFkZHJlc3MgKi8NCj4+ICAjZGVmaW5lIEdVRVNUX0FD
UElfQkFTRSB4ZW5fbWtfdWxsb25nKDB4MjAwMDAwMDApDQo+PiAgI2RlZmluZSBHVUVTVF9BQ1BJ
X1NJWkUgeGVuX21rX3VsbG9uZygweDAyMDAwMDAwKQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4gaW5kZXggNzBhYzI1MzQ1
Yy4uNDNiOGEwODE3MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+PiBAQCAtNDAsNiArNDAsOCBAQA0KPj4gICNk
ZWZpbmUgUENJX1NCREYzKHMsYixkZikgXA0KPj4gICAgICAoKHBjaV9zYmRmX3QpeyAuc2JkZiA9
ICgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGMihiLCBkZikgfSkNCj4+ICArI2RlZmlu
ZSBNTUNGR19CREYoYWRkcikgICgoKGFkZHIpICYgMHgwZmZmZjAwMCkgPj4gMTIpDQo+PiArDQo+
PiAgdHlwZWRlZiB1bmlvbiB7DQo+PiAgICAgIHVpbnQzMl90IHNiZGY7DQo+PiAgICAgIHN0cnVj
dCB7DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

