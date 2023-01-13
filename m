Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96795669C90
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 16:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477429.740155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGM88-0006VW-3k; Fri, 13 Jan 2023 15:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477429.740155; Fri, 13 Jan 2023 15:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGM88-0006Sl-0r; Fri, 13 Jan 2023 15:38:08 +0000
Received: by outflank-mailman (input) for mailman id 477429;
 Fri, 13 Jan 2023 15:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGM86-0006Gn-QZ
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 15:38:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2074.outbound.protection.outlook.com [40.107.247.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 446e8b4f-9358-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 16:38:03 +0100 (CET)
Received: from FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::8) by
 DBBPR08MB6220.eurprd08.prod.outlook.com (2603:10a6:10:205::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Fri, 13 Jan 2023 15:37:56 +0000
Received: from VI1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::55) by FR0P281CA0098.outlook.office365.com
 (2603:10a6:d10:a9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 15:37:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT011.mail.protection.outlook.com (100.127.144.181) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 15:37:55 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Fri, 13 Jan 2023 15:37:54 +0000
Received: from 8a3998fc363e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1395C56A-9C20-4941-A1BE-010D949EB51C.1; 
 Fri, 13 Jan 2023 15:37:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a3998fc363e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 15:37:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 15:37:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 15:37:41 +0000
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
X-Inumbo-ID: 446e8b4f-9358-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShCHXF58vn4RgDMtCTcfwMPk5Oqhr6eypMGbteKbhvs=;
 b=N4vochqwh0u+EJ/AgKA9HNInlySN5USaOoPhhyG5sr1ywmJnH/9XEsHmPUoi2v+NEBHuTpSByikIZ4Lx6JCy5av7+AN/92ffi4ylNDvTvCfakFIe64v9OxovlySqcgChfO7cjYwEG+vj3YXmqF3yvRM6wjxyZqVLM/jPNov/w6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43b8b73a28a68a60
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhnqlZp9v9qGrMq7I2tgdcIwVGvMrgKYCyTU+e467GBp+r8ilNGG05DLu8TvE92o4M2M4mR38MXMcUzh65brIiWCVtqhctnt1Lv6ZkKuzm1uDvEGyRCuFJNkbQYvh7i2ekFNDkRDZrEz1oTy6LP+ekCplnTnkarKz/92CDYM/vt7NOKAaD4F2VAZjP7Gvq/kIl9DlFcSM6J38tvaHS0qTbYrTZRKbj62Dzo2B6RRXP2LsJoZwy0W1G7pqGEueewUS4vf5tgO6KPeeQMHasgU+Xf+Jdv1ujO+3abbJ7BPTmL833MRLO7PmzIs71XP0OD7dgQ2ULdRdIuhEIx1450fAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShCHXF58vn4RgDMtCTcfwMPk5Oqhr6eypMGbteKbhvs=;
 b=oJa7ue/cUW7kMpNA/vnwwmpJYcI/kqkoii4508KGknF4/gqR0CDA/8A4ChiWKXS3z/Sp2j7sExi3X7IMDtGz9EAkSEYq5BfbuDO+PeLXahjh0OhZb/qy4nluZudGkuc7tQLbC0hwM2Tgty5fuYogZ3X34Yt482tV8n5n9DgS+Hwip4/7K5JyJKwmtcTmiKMQ7MjShfsfEIWAL0kgpr5QNICLFb5AVnmwcZxLlyDrHZYJxt9V42pPgddp0e3ddf291I5kG42Cnb69ovcTwLHrPkeE1gsW4e40BTNf3u76UDUU1Kpalb65zvUfgAtsGYk8/+HbXK6s6arH8emceslXfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShCHXF58vn4RgDMtCTcfwMPk5Oqhr6eypMGbteKbhvs=;
 b=N4vochqwh0u+EJ/AgKA9HNInlySN5USaOoPhhyG5sr1ywmJnH/9XEsHmPUoi2v+NEBHuTpSByikIZ4Lx6JCy5av7+AN/92ffi4ylNDvTvCfakFIe64v9OxovlySqcgChfO7cjYwEG+vj3YXmqF3yvRM6wjxyZqVLM/jPNov/w6M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 10/14] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH v4 10/14] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZJzoSeyoTqT1kWEmelvocRfmip66ce3AA
Date: Fri, 13 Jan 2023 15:37:41 +0000
Message-ID: <01DE3414-4523-4029-AB8D-A1F6DEF145B3@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-11-julien@xen.org>
In-Reply-To: <20230113101136.479-11-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB6432:EE_|VI1EUR03FT011:EE_|DBBPR08MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 073d67c2-77ec-4ed5-5efe-08daf57c23e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YIsuJGnz3v0yxJcu6DRQvT/ngFHMUzcV6yvnOe5qp0w01E7qi64xZOtPIxY8cQZRpL3d+8yy6oSPmIMw8yXUvZN4Z/KA6t01VmSP7Qp8YheJG6rG4LFRp/u/K6HOmcOpOaxRofT/uw3VLbLgI6AqQaIcXZ54HFfy30HnzAf0xSW894FNDY/xgcrkAT/wxwMZJteL0Anvig4sOnr0UKs9GD0p36ubSgFyahY0MaTWGQTNOKh1NvhCHSvSE4N9G80AwO1vVjKV6L6j7zhhw0NJaKLO2sLHPRwVy2jMD2Pq9amiPAa65wOZTrhpq7VNG0XVF2JEb9+dyUMW9usToZ3acuMra46/k6UGQ++TR8yZJuH8MZbWI2ExnDpU+UpAXlkFOVR76YudStZGC07xkGEig/iDVetiEWE8X8nNBl13tSKvJ5r8nRAGV6CjQEIvw180VPTCXq36UScBjoqDf1xTLvIHD2uZxVLh57AWv7iTows5oSFG4icOW747tLKP2a53qckVrWIruB6eGJ8ndr5WWnbLF5DdQi9mWMHK78O0072SN1txir9JiXIXis4xtLzudNKiumfSKF3aHFaIkP83DzSLsIrmpOVx4gzxzPP4eaNvR7ZaIYHag0ZeOmlDDOKtvShogQ0et9R5K8amP2tc7EZE2MsOS/KdWmP60/a6qHEJcBvZY8cscNwlBLu+CKuMmqUMkAq/o34WDe0jlXN99ffWur2XWSRmAdyXB+CahxcFt9/mRsTHL9GcAXxT2ajiWwGgMzXq8kj2rspMATYyGXflMl8kJCj4QFE8nzM7eoA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199015)(36756003)(6506007)(6512007)(186003)(53546011)(33656002)(4744005)(6486002)(71200400001)(38070700005)(26005)(122000001)(38100700002)(86362001)(83380400001)(2616005)(478600001)(2906002)(8936002)(5660300002)(76116006)(316002)(66946007)(91956017)(6916009)(54906003)(66556008)(66476007)(66446008)(41300700001)(8676002)(4326008)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B990AE93D746CC47B74BD4202A9EE9C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6432
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	628b87d6-0b62-41ff-c6be-08daf57c1b8c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NagYE5yHPeaD8AqH8ovi/PAGUZs0uRQKsM7IjLw8NkbM3pfIAbOwcasWIr1YL6viXZV5JQUA7H3CwRGb/jZoKdfQ+7Nd6pbm+np4XHVLG0yAUn8D0hpRSzUKX+pgQo/vSDJ7O205muRAp+7jd+d08vHmzM0D8VZBlaNPiKv2pR+GwweG41YQ8Ctg74sjIn1fXiSfLmSxaNBCLnXJ9EgerfqWEtYA9z5BA52mH8nnMIoNPNpzOqZzVQZ3v33uCEGkAgZgbbYGtd0Cn76cTpzTSYQXdWIrRtjLAwr2Eb3Ro7qbuk1BRIfqEOVK7DKmiB9ikZsT4UfQwmQHYLRdnPsQkEs4PGenFuKVSH+FKXCqJkN1UH/am1r8XQ6m3/nM4mZYOJEif8ghnCf6AuoEMghryi2dD2wMSosk+52fdyBLpVz7LlpNSlVSyduThhxZbroLD/WKyzSG8+K83LLmjFKf3LHB3IQ/NHpllbEYedEebLUBF9h0xDJRyKqj50XN96e8lPMAgPTDSv/mABK8D9BU+aKAgGJPsN2NIlce6n/GPpwzvfsQdtT5qeEkF080brlKpllH4YyysZU5eCxv3yaU2erK8KXb2ArEtLXU+P/jv0n4rk3jSDgJPe4lBhxTi5SYl8yOsSzj3BSU3H2b/Gskf777s4gKUugnUl8NjHFD+GSSV1SbE1CsrthBvBOyx6+iiKSp7QjzDDTHLXoH4e+JFQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(70206006)(70586007)(54906003)(8676002)(4326008)(6862004)(8936002)(316002)(478600001)(4744005)(5660300002)(6506007)(2906002)(6512007)(26005)(186003)(2616005)(53546011)(336012)(47076005)(107886003)(83380400001)(33656002)(40480700001)(36860700001)(40460700003)(81166007)(82310400005)(356005)(86362001)(6486002)(41300700001)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 15:37:55.2131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 073d67c2-77ec-4ed5-5efe-08daf57c23e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6220

DQoNCj4gT24gMTMgSmFuIDIwMjMsIGF0IDEwOjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBBdCB0aGUgbW9tZW50LCB0aGUgdGVtcG9yYXJ5IG1hcHBpbmcgaXMgb25seSB1c2Vk
IHdoZW4gdGhlIHZpcnR1YWwNCj4gcnVudGltZSByZWdpb24gb2YgWGVuIGlzIGNsYXNoaW5nIHdp
dGggdGhlIHBoeXNpY2FsIHJlZ2lvbi4NCj4gDQo+IEluIGZvbGxvdy11cCBwYXRjaGVzLCB3ZSB3
aWxsIHJld29yayBob3cgc2Vjb25kYXJ5IENQVSBicmluZy11cCB3b3Jrcw0KPiBhbmQgaXQgd2ls
bCBiZSBjb252ZW5pZW50IHRvIHVzZSB0aGUgZml4bWFwIGFyZWEgZm9yIGFjY2Vzc2luZw0KPiB0
aGUgcm9vdCBwYWdlLXRhYmxlIChpdCBpcyBwZXItY3B1KS4NCj4gDQo+IFJld29yayB0aGUgY29k
ZSB0byB1c2UgdGVtcG9yYXJ5IG1hcHBpbmcgd2hlbiB0aGUgWGVuIHBoeXNpY2FsIGFkZHJlc3MN
Cj4gaXMgbm90IG92ZXJsYXBwaW5nIHdpdGggdGhlIHRlbXBvcmFyeSBtYXBwaW5nLg0KPiANCj4g
VGhpcyBhbHNvIGhhcyB0aGUgYWR2YW50YWdlIHRvIHNpbXBsaWZ5IHRoZSBsb2dpYyB0byBpZGVu
dGl0eSBtYXANCj4gWGVuLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3Jh
bGxAYW1hem9uLmNvbT4NCj4gDQo+IC0tLS0NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUg
PGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KSeKAmXZlIGFsc28gYnVpbHQgZm9yIGFybTMyIGFu
ZCB0ZXN0IHRoaXMgcGF0Y2ggb24gZnZwIGFhcmNoMzIgbW9kZSwNCmJvb3RpbmcgRG9tMCBhbmQg
Y3JlYXRpbmcvcnVubmluZy9kZXN0cm95aW5nIHNvbWUgZ3Vlc3RzDQoNClRlc3RlZC1ieTogTHVj
YSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg==

