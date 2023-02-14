Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E0E695FF3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 10:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495094.765353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRs37-0007C7-6f; Tue, 14 Feb 2023 09:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495094.765353; Tue, 14 Feb 2023 09:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRs37-00078m-3h; Tue, 14 Feb 2023 09:56:33 +0000
Received: by outflank-mailman (input) for mailman id 495094;
 Tue, 14 Feb 2023 09:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6sm=6K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pRs35-00078g-Vu
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 09:56:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9a33e77-ac4d-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 10:56:28 +0100 (CET)
Received: from DBBPR09CA0018.eurprd09.prod.outlook.com (2603:10a6:10:c0::30)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Tue, 14 Feb
 2023 09:56:26 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::d) by DBBPR09CA0018.outlook.office365.com
 (2603:10a6:10:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 09:56:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.10 via Frontend Transport; Tue, 14 Feb 2023 09:56:25 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Tue, 14 Feb 2023 09:56:25 +0000
Received: from 8b9d2537ff73.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E004746-E40F-4A9F-A38D-F1DB895687B3.1; 
 Tue, 14 Feb 2023 09:56:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b9d2537ff73.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Feb 2023 09:56:20 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by GV2PR08MB8271.eurprd08.prod.outlook.com (2603:10a6:150:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 09:56:18 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 09:56:17 +0000
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
X-Inumbo-ID: d9a33e77-ac4d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fQzjteEiTkhn2+cpSoHtQZJc5/cBvUUJ7nMFm4Hvf0=;
 b=VL7eJechbxU2dMvPARYMnDWsXYDniVHyuO9/oLr9jprp4oR0DU1Ba73jXUjv/+hpdQxPAX1J2RgNyyUCd+DWfNBDsgJ6+3rtNVlkwIhirosq3SWBbeI+q++7ZkhBvoS8A1JKarmQ2WCGVZnBLUcHLiiLK1aMxdlkaqw6vELjQx0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJ6/jNHpqZLplG3SE13qjVGMnatLO7g7724IKO7gD8fKAaxJM7YH9+PEPMnjcZ6okKckrYCzA85cCPY64v6wITiDgDVbiSm1JHWjoXqZ0UAIhLuZnqpHkVNnFdteHaeQy5nJRYUeIqdbdjcDDW+gEAHkk31aCBO/s6Tlv5g3+fgb7hIGElILUWFAOl/SQTLMt+Lq4gc5mp7UJI7mSUnG9ZKdQfM+91nc1cn8y2oDg2dZhfsE1T8WGv2h8wFxKhFWuYUlZkqZyWl7BV7Ud1FKXiGST11dY0UdvWo3jpNlkTHyninEypwNtMh/m26Vv9Wo2PZ8+Kw4S6J/aotdTpYd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fQzjteEiTkhn2+cpSoHtQZJc5/cBvUUJ7nMFm4Hvf0=;
 b=LegI9zDYdQdikr+68Nu4c3Cfz2l9WkD1J5IdVuEDg+8zwK+3rrOgbSkzoPsoD3suucz0lu+iOnUjNF0towBf7kL0XFlIjcW4WR369TwSZvtO1KooXsesBqlSAgqs+EOmT1YmbFo9/PHXYyalrno5wEgllLHQPfGhIl6vqor4IRa9SBk1SIEg/Ss0Fd195s5vEvtLSIfKEffZNkeyTsK1vxePnFpj1h9/Ixyk7FmXrMou0fJ8GP+WhSENol0/yCSl3MTNyhOlo6KoPZSLVl0CghIXYpc7wJEFIO236tkkzvvV7Gq9P8UQRXTNYaaUIr5/sSJCMkDgUQjwAtbcwnOwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fQzjteEiTkhn2+cpSoHtQZJc5/cBvUUJ7nMFm4Hvf0=;
 b=VL7eJechbxU2dMvPARYMnDWsXYDniVHyuO9/oLr9jprp4oR0DU1Ba73jXUjv/+hpdQxPAX1J2RgNyyUCd+DWfNBDsgJ6+3rtNVlkwIhirosq3SWBbeI+q++7ZkhBvoS8A1JKarmQ2WCGVZnBLUcHLiiLK1aMxdlkaqw6vELjQx0=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
 region
Thread-Topic: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
 region
Thread-Index: AQHY+J1fJT59o0hz5k65YJBzZn+QX67Ee7KAgAo99uA=
Date: Tue, 14 Feb 2023 09:56:17 +0000
Message-ID:
 <AM0PR08MB453065914FD7E70FEF28782CF7A29@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-2-Penny.Zheng@arm.com>
 <b14af71d-bc74-a18e-18ae-42e7a0a2efd9@amd.com>
In-Reply-To: <b14af71d-bc74-a18e-18ae-42e7a0a2efd9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8E856BD5C73E5649A4E5967F4DF198BC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|GV2PR08MB8271:EE_|DBAEUR03FT057:EE_|PR3PR08MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f9d3f4-afa2-4534-0c0b-08db0e71bc78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m9Zz62BpoZwlmmZOTa2+hKwElLHjRIFtY5uS0L7lbBfHDSepiKYdzervEggsqNLjlwSZrxOYd7s9UeJV60nVuy/A4Kt3CSQ7a1p7bbW8cFbnzFwV1qG1DjuLGzHmaLlOUYmSZzyZ2yinkMXubH2t4TCdiUTRLIcfyoOSn2DrGVb/u1cAJpUQ2XZfsYvoVrpJVwYrCIw3Z2ng5InT66HM3CCOQPipHSeUbzranVHunNiXLzz6xPuvfOBtjDPm8Tog8UjY/GXhTM+OuCTvSHfWlB63y/o/z0FMRanU6IZWFvJFiuoW+QqT7LfijXjPMh3RNH9xXZ1uSg9Wa9Md1N1jNGF0dARooobeaT4MA+qKeLwya8ZcJvEM+yb9UGkdJDnu1jftu8l7760d6TyrABxvcF1RTzEXVEmL2oYj2y4d0hnG7GSTeUPNyxmZy255Eh1E3m4MEUGko32e+1TqXoAAk5xCusPsCl7HHPdauAjiYhVRkCi23V9dwUiATWu2QXozkIbQXi7sd/diJX+8LYznfyvt4joQHAhqyAcsBaYNnRB0GOv4C4uWHAJ9CWRVLfqYHkDAIZV+KU9QO5Cg2bNgZue0EdP0vIZ9jHKT6eFdyF6qbaIXPJ+/BnSugsiYRddgjcRUUgEp35dim9EyB7aOiZ/gG1aDMr6a8pNaWV7NPwjPc4EMtYhhfwp9Ns0Nuu+b
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199018)(83380400001)(54906003)(110136005)(76116006)(316002)(5660300002)(8936002)(52536014)(8676002)(66446008)(66946007)(41300700001)(4326008)(66476007)(64756008)(66556008)(6506007)(53546011)(9686003)(186003)(26005)(966005)(71200400001)(478600001)(38070700005)(55016003)(86362001)(33656002)(2906002)(122000001)(38100700002)(66899018)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8271
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55f2ea14-af83-4c18-2ca9-08db0e71b769
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jFi9VyblO6vCJWx8NtEw2HXyZ68pa0rud8QWnRPXT/Jo26qwZZF5uZ+4OvzOrNxDgF0AWqEwPBwmUKWK82UkXhL10Kgenm+Uuc67d0Jm0cilYwlMMY+FP6BS2SeAc3M02SR4mOLeN5gmpirUHpCaFFnY0fAo9ucraNQarjSoizBDLvdh8Z+h5N2BLAMqiVA71kxXQk5jXqqZgPPS+U/OY5bOflI+wefpJb6yJs9SuC6q0ZVul9dO9yhl+NKo/VxUdE+X0qAn0F5g/xrzgILjiy4vnR67z2mdtZKHsQho2FDZAZLJhNQC+N0beytJw3KAhdp55A7y958AQKZCF9VQtCo6Y2VJp/xCT3NRlangEOS1cglWiaIQgsqtJmQxTwul63qSlghw6rfErtMRH5vyYLg/zXGZtQBZBgECYC9OiYZUE5jPF9+qnRi03wOU1gAZMtCzWK9/pUI95Lm/N0iUSMHd8RZ0O3NlrVfC/NMH5C5sd32bSuHFnCtQAjdyihdxWCW4h3NaW0ieSCSXako6aSrBHrOEhUrCyqz4jxfVyEMAu2kRjFcUHQZ6HGX8pdcyT/WzMoJoU7Y3Xc4ISLt31zlXnvD7qQvwmjHmotB5owa21Tg3Ys36uV0UNPFjudL/h5iMgj/ETO4F5BI2VtDK3fPOVYfPS0eyzFOCk63YlkoonA8ez9ddQpZjMYQSqi+8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199018)(36840700001)(40470700004)(46966006)(7696005)(33656002)(36860700001)(9686003)(966005)(2906002)(186003)(478600001)(53546011)(55016003)(26005)(6506007)(336012)(47076005)(40460700003)(83380400001)(107886003)(40480700001)(41300700001)(52536014)(316002)(70206006)(86362001)(8676002)(8936002)(70586007)(4326008)(81166007)(110136005)(82740400003)(66899018)(356005)(54906003)(5660300002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 09:56:25.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f9d3f4-afa2-4534-0c0b-08db0e71bc78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV3YXJ0IEhpbGRlYnJhbmQg
PHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5
IDgsIDIwMjMgNDo1NSBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hl
bkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJl
cnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwMS8xM10geGVuL2Fy
bTogcmUtYXJyYW5nZSB0aGUgc3RhdGljIHNoYXJlZCBtZW1vcnkNCj4gcmVnaW9uDQo+IA0KPiBI
aSBQZW5ueSwNCj4NCg0KSGksIFN0ZXdhcnQNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNl
LCBnb3Qgc2lkZXRyYWNrZWQgYnkgYSBmZXcgaW50ZXJuYWwgcHJvamVjdHMNCiAgDQo+IE9uIDEx
LzE0LzIyIDIxOjUyLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAuLi4NCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmgNCj4gPiBiL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4gaW5kZXggZmRiZjY4YWFkYy4uMmQ0YWUwZjAwYSAxMDA2
NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaA0KPiA+ICsrKyBi
L3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4gQEAgLTUwLDEwICs1MCw2IEBA
IHN0cnVjdCBtZW1iYW5rIHsNCj4gPiAgICAgIHBhZGRyX3Qgc3RhcnQ7DQo+ID4gICAgICBwYWRk
cl90IHNpemU7DQo+ID4gICAgICBlbnVtIG1lbWJhbmtfdHlwZSB0eXBlOw0KPiA+IC0jaWZkZWYg
Q09ORklHX1NUQVRJQ19TSE0NCj4gPiAtICAgIGNoYXIgc2htX2lkW01BWF9TSE1fSURfTEVOR1RI
XTsNCj4gPiAtICAgIHVuc2lnbmVkIGludCBucl9zaG1fYm9ycm93ZXJzOw0KPiA+IC0jZW5kaWYN
Cj4gPiAgfTsNCj4gPg0KPiA+ICBzdHJ1Y3QgbWVtaW5mbyB7DQo+ID4gQEAgLTYxLDYgKzU3LDE3
IEBAIHN0cnVjdCBtZW1pbmZvIHsNCj4gPiAgICAgIHN0cnVjdCBtZW1iYW5rIGJhbmtbTlJfTUVN
X0JBTktTXTsgIH07DQo+ID4NCj4gPiArc3RydWN0IHNobV9tZW1iYW5rIHsNCj4gPiArICAgIGNo
YXIgc2htX2lkW01BWF9TSE1fSURfTEVOR1RIXTsNCj4gPiArICAgIHVuc2lnbmVkIGludCBucl9z
aG1fYm9ycm93ZXJzOw0KPiA+ICsgICAgc3RydWN0IG1lbWJhbmsgKm1lbWJhbms7DQo+ID4gK307
DQo+ID4gKw0KPiA+ICtzdHJ1Y3Qgc2htX21lbWluZm8gew0KPiA+ICsgICAgdW5zaWduZWQgaW50
IG5yX2JhbmtzOw0KPiA+ICsgICAgc3RydWN0IHNobV9tZW1iYW5rIGJhbmtbTlJfTUVNX0JBTktT
XTsgfTsNCj4gPiArDQo+ID4gIC8qDQo+ID4gICAqIFRoZSBkb21VIGZsYWcgaXMgc2V0IGZvciBr
ZXJuZWxzIGFuZCByYW1kaXNrcyBvZiAieGVuLGRvbWFpbiIgbm9kZXMuDQo+ID4gICAqIFRoZSBw
dXJwb3NlIG9mIHRoZSBkb21VIGZsYWcgaXMgdG8gYXZvaWQgZ2V0dGluZyBjb25mdXNlZCBpbiBA
QA0KPiA+IC0xMDUsNiArMTEyLDcgQEAgc3RydWN0IGJvb3RpbmZvIHsNCj4gPiAgICAgIHN0cnVj
dCBtZW1pbmZvIGFjcGk7DQo+ID4gICNlbmRpZg0KPiA+ICAgICAgYm9vbCBzdGF0aWNfaGVhcDsN
Cj4gPiArICAgIHN0cnVjdCBzaG1fbWVtaW5mbyBzaG1fbWVtOw0KPiA+ICB9Ow0KPiA+DQo+ID4g
IHN0cnVjdCBtYXBfcmFuZ2VfZGF0YQ0KPiANCj4gVGhlIHJlZHVjdGlvbiBpbiB0aGUgc2l6ZW9m
IHN0cnVjdCBtZW1iYW5rIGlzIGEgd2VsY29tZSBpbXByb3ZlbWVudCwgaW4NCj4gbXkgb3Bpbmlv
biwgYmVjYXVzZSBpdCBpcyBtdWx0aXBsaWVkIGJ5IE5SX01FTV9CQU5LUywgYW5kIElJUkMgd2Ug
b25seQ0KPiBoYXZlIDMyayBvZiBib290IHN0YWNrIHRvIHBsYXkgd2l0aC4NCj4gDQo+IEJlZm9y
ZSB0aGlzIHBhdGNoOg0KPiBzaXplb2Yoc3RydWN0IGtlcm5lbF9pbmZvKTogMjA2NDgNCj4gc2l6
ZW9mKHN0cnVjdCBtZW1pbmZvKTogMTAyNDgNCj4gc2l6ZW9mKHN0cnVjdCBzaG1fbWVtaW5mbyk6
IDEwMjQ4DQo+IA0KPiBXaGVuIGJ1aWxkaW5nIHdpdGggRVhUUkFfQ0ZMQUdTX1hFTl9DT1JFPSJX
c3RhY2stdXNhZ2U9NDA5NiAtV25vLQ0KPiBlcnJvcj1zdGFjay11c2FnZT0iOg0KDQpMZWFybnQh
IFRoeCENCg0KPiBhcmNoL2FybS9kb21haW5fYnVpbGQuYzogSW4gZnVuY3Rpb24g4oCYY29uc3Ry
dWN0X2RvbVXigJk6DQo+IGFyY2gvYXJtL2RvbWFpbl9idWlsZC5jOjM3NDc6MTk6IHdhcm5pbmc6
IHN0YWNrIHVzYWdlIGlzIDIwNzIwIGJ5dGVzIFstDQo+IFdzdGFjay11c2FnZT1dDQo+ICAzNzQ3
IHwgc3RhdGljIGludCBfX2luaXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fg0KPiBhcmNoL2FybS9kb21h
aW5fYnVpbGQuYzogSW4gZnVuY3Rpb24g4oCYY29uc3RydWN0X2RvbTDigJk6DQo+IGFyY2gvYXJt
L2RvbWFpbl9idWlsZC5jOjM5Nzk6MTk6IHdhcm5pbmc6IHN0YWNrIHVzYWdlIGlzIDIwNjg4IGJ5
dGVzIFstDQo+IFdzdGFjay11c2FnZT1dDQo+ICAzOTc5IHwgc3RhdGljIGludCBfX2luaXQgY29u
c3RydWN0X2RvbTAoc3RydWN0IGRvbWFpbiAqZCkNCj4gICAgICAgfCAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fg0KPiANCj4gDQo+IA0KPiBBZnRlciB0aGlzIHBhdGNoOg0KPiBzaXpl
b2Yoc3RydWN0IGtlcm5lbF9pbmZvKTogMTQ1MDQNCj4gc2l6ZW9mKHN0cnVjdCBtZW1pbmZvKTog
NjE1Mg0KPiBzaXplb2Yoc3RydWN0IHNobV9tZW1pbmZvKTogODIwMA0KPiANCj4gYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmM6IEluIGZ1bmN0aW9uIOKAmGNvbnN0cnVjdF9kb21V4oCZOg0KPiBhcmNo
L2FybS9kb21haW5fYnVpbGQuYzozNzU0OjE5OiB3YXJuaW5nOiBzdGFjayB1c2FnZSBpcyAxNDU3
NiBieXRlcyBbLQ0KPiBXc3RhY2stdXNhZ2U9XQ0KPiAgMzc1NCB8IHN0YXRpYyBpbnQgX19pbml0
IGNvbnN0cnVjdF9kb21VKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn4NCj4gYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM6IEluIGZ1bmN0
aW9uIOKAmGNvbnN0cnVjdF9kb20w4oCZOg0KPiBhcmNoL2FybS9kb21haW5fYnVpbGQuYzozOTg2
OjE5OiB3YXJuaW5nOiBzdGFjayB1c2FnZSBpcyAxNDU0NCBieXRlcyBbLQ0KPiBXc3RhY2stdXNh
Z2U9XQ0KPiAgMzk4NiB8IHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb20wKHN0cnVjdCBk
b21haW4gKmQpDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4NCj4g
DQo+IEEgbGF0ZXIgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgd2lsbCBpbmNyZWFzZSBpdCBhZ2FpbiBz
bGlnaHRseS4gTm90ZSB0aGF0IEknbSBub3QNCj4gZXhwZWN0aW5nIHRoaXMgc2VyaWVzIHRvIGFk
ZHJlc3MgdGhlc2UgcGFydGljdWxhciB3YXJuaW5ncywgSSdtIG1lcmVseQ0KPiBwb2ludGluZyBv
dXQgdGhlIChwb3NpdGl2ZSkgaW1wYWN0IG9mIHRoZSBjaGFuZ2UuDQoNCkkgYWdyZWVkIHRoYXQg
TlJfTUVNX0JBTktTIGNvdWxkIGJlIGEgbGFyZ2UgbXVsdGlwbGllciwgYW5kIGlmIHdlIG1ha2UN
CiJzdHJ1Y3Qgc2htX21lbWluZm8iIGxpa2UgInN0cnVjdCBtZW1pbmZvIiwgdG8gaGF2ZSBhIGFy
cmF5IG9mIE5SX01FTV9CQU5LUw0KaXRlbXMsIGl0IHdpbGwgbWFrZSBYZW4gYmluYXJ5IGV4Y2Vl
ZCAyME1CLi4uIFdlIGhhdmUgZGlzY3Vzc2VkIGl0IGhlcmVbMV0uDQoNCkhvd2V2ZXIsIEknbSBh
ZnJhaWQgdGhhdCBkeW5hbWljIGFsbG9jYXRpb24gaXMgYWxzbyBub3QgYSBwcmVmZXJyZWQgb3B0
aW9uIGhlcmUsDQp3aGVyZSB0byBmcmVlIHRoZSBkYXRhIGNvdWxkIGJlIGEgcHJvYmxlbS4NClNv
IGluIG5leHQgc2VyaWUsIHdoaWNoIHdpbGwgY29tZSB2ZXJ5IHNvb24sIEknbGwgaW50cm9kdWNl
Og0KYGBgDQojZGVmaW5lIE5SX1NITV9CQU5LUyAxNg0KDQovKg0KICogQSBzdGF0aWMgc2hhcmVk
IG1lbW9yeSBub2RlIGNvdWxkIGJlIGJhbmtlZCB3aXRoIGEgc3RhdGljYWxseQ0KICogY29uZmln
dXJlZCBob3N0IG1lbW9yeSBiYW5rLCBvciBhIHNldCBvZiBhcmJpdHJhcnkgaG9zdCBtZW1vcnkN
CiAqIGJhbmtzIGFsbG9jYXRlZCBmcm9tIGhlYXAuDQogKi8NCnN0cnVjdCBzaG1fbWVtaW5mbyB7
DQogICAgdW5zaWduZWQgaW50IG5yX2JhbmtzOw0KICAgIHN0cnVjdCBtZW1iYW5rIGJhbmtbTlJf
U0hNX0JBTktTXTsNCiAgICBwYWRkcl90IHRvdF9zaXplOw0KfTsNCmBgYA0KVGFraW5nIHlvdXIg
cHJldmlvdXMgaW5zdHJ1Y3Rpb25zLCBjb21waWxpbmcgd2l0aCAiRVhUUkFfQ0ZMQUdTX1hFTl9D
T1JFPSItV3N0YWNrLXVzYWdlPTQwOTYgLVduby1lcnJvcj1zdGFjay11c2FnZT0iLA0KYm9vdCBz
dGFjayB1c2FnZSBmb3IgImNvbnN0cnVjdF9kb21VIiBhbmQgIiBjb25zdHJ1Y3RfZG9tMCIgd2ls
bCBiZSBsaWtlOg0KIg0KYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM6IEluIGZ1bmN0aW9uIOKAmGNv
bnN0cnVjdF9kb21V4oCZOg0KYXJjaC9hcm0vZG9tYWluX2J1aWxkLmM6NDEyNzoxOTogd2Fybmlu
Zzogc3RhY2sgdXNhZ2UgaXMgMTY4MDAgYnl0ZXMgWy1Xc3RhY2stdXNhZ2U9XQ0KIDQxMjcgfCBz
dGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tVShzdHJ1Y3QgZG9tYWluICpkLA0KICAgICAg
fCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fg0KYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmM6IEluIGZ1bmN0aW9uIOKAmGNvbnN0cnVjdF9kb20w4oCZOg0KYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmM6NDM1OToxOTogd2FybmluZzogc3RhY2sgdXNhZ2UgaXMgMTY2NDAgYnl0ZXMgWy1Xc3Rh
Y2stdXNhZ2U9XQ0KIDQzNTkgfCBzdGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tMChzdHJ1
Y3QgZG9tYWluICpkKQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fg0K
Ig0KWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAyMy0wMS9tc2cwMDQ0OS5odG1sDQoNCkNoZWVycywNCg0KLS0tDQpQZW5ueSBaaGVuZw0K

