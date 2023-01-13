Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8446695BB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 12:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477229.739842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIMT-0000nb-S1; Fri, 13 Jan 2023 11:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477229.739842; Fri, 13 Jan 2023 11:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGIMT-0000kl-P8; Fri, 13 Jan 2023 11:36:41 +0000
Received: by outflank-mailman (input) for mailman id 477229;
 Fri, 13 Jan 2023 11:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=irsc=5K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGIMT-0000kf-3o
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 11:36:41 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2059.outbound.protection.outlook.com [40.107.241.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab7eb46-9336-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 12:36:38 +0100 (CET)
Received: from FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::19)
 by GVXPR08MB7751.eurprd08.prod.outlook.com (2603:10a6:150:7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 11:36:35 +0000
Received: from VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::d5) by FR3P281CA0135.outlook.office365.com
 (2603:10a6:d10:94::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 11:36:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT063.mail.protection.outlook.com (100.127.144.155) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Fri, 13 Jan 2023 11:36:34 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Fri, 13 Jan 2023 11:36:34 +0000
Received: from 753a91522c15.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0F19391D-4363-44C9-8AF5-AFE72EE338FD.1; 
 Fri, 13 Jan 2023 11:36:27 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 753a91522c15.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 11:36:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5967.eurprd08.prod.outlook.com (2603:10a6:102:e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 11:36:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 11:36:26 +0000
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
X-Inumbo-ID: 8ab7eb46-9336-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwvPxYqJhARnyusAQLA8bWR4iDsYbq8TXKcUsQPOS0A=;
 b=RVb98TLAd3sY0+9C/TygRA855EweOBYA8xp5rxonnvMjZe8zXEw1MrAycp1vZYBuBgvr+Zq7VFSwsfGa/BAwKmXGCGt5CDqMqvdY6h6d8rQ+jSpCOZM9yksI2JqQYwFw8QEgVXAfD/A1HXOfudUWLO/akhEVUvhi6w4TymAGqTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hawn/fzl3gqQ9w85h9x1MqJDJk9eEVUrStnjih6XTUU8WUK3e5JzkGx9IouyIXxxRfojI6T3uTCobHnKVPZXVPoYNshpcVsSPxE4NzjeCvqqFSPlcdfpvPaT2kvpwCfjNOr6mMqz/dfIwGrbM2zPdcZdcirlliLxMj2vkiv549o2LzSiEeXxOk/h4k7vZ8VlOmiSVbLXVmMcQ32FGQZE7UjRg1lxq8x4F2N39n//jxUGsgK0klbghuHL5XJsbBgCoHcb87Prc0NJ40l9NZjYCoqoWmuVwHD59c4Zm9s+Tf0L2kVcF2e0Uzfl+ZiKQVCTVFhSF12Ku7wvn0juxlyEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwvPxYqJhARnyusAQLA8bWR4iDsYbq8TXKcUsQPOS0A=;
 b=mTdbmYCiHxQqFOUU87j6Aln6fGexFiG0zbAWnX3P3B09Xn8Lgy3/l03yNrPpCNSo/KlBzODnXegE5JNQ9c6I6xk9H8z8xO+zsg6UtZXNMzRaOjakT5oRoaNj87qonX9asauBl8C76B+JOYdviJps1Z4hVjpCgMo3HXPhgYb+a6g2FEtvRRVAWOeSNbfMEzKvLrSvxOR7y13cUGU/kdq5I8Uuiuw9oWVgXBzw2BU6oGFxI3Gj8+p9EN2DqPKAUJn444JKpx1Nk9dx+sXasywO35x9qHB0g3TdFYA9iWhD7reeqH+HVmV9hOPPg+vnsdW6ATbL5unSFUDpcutwcfyxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwvPxYqJhARnyusAQLA8bWR4iDsYbq8TXKcUsQPOS0A=;
 b=RVb98TLAd3sY0+9C/TygRA855EweOBYA8xp5rxonnvMjZe8zXEw1MrAycp1vZYBuBgvr+Zq7VFSwsfGa/BAwKmXGCGt5CDqMqvdY6h6d8rQ+jSpCOZM9yksI2JqQYwFw8QEgVXAfD/A1HXOfudUWLO/akhEVUvhi6w4TymAGqTU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH v4 01/14] xen/arm64: flushtlb: Reduce scope of barrier for
 local TLB flush
Thread-Topic: [PATCH v4 01/14] xen/arm64: flushtlb: Reduce scope of barrier
 for local TLB flush
Thread-Index: AQHZJzd9qGEAItqZ/Emo59lWSJotia6cNK4A
Date: Fri, 13 Jan 2023 11:36:26 +0000
Message-ID:
 <AS8PR08MB7991E178E1AAADEE8BB9974B92C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-2-julien@xen.org>
In-Reply-To: <20230113101136.479-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 93B66E3C6812794FB170ACB640DA9580.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB5967:EE_|VI1EUR03FT063:EE_|GVXPR08MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe77d1c-62b7-4f66-4824-08daf55a6cc7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RyLgOYvIgrTmob3R+V07JQqqsClueZBPotMZBun1ON4fU+Y6RuLJ91CLW4sEJDyXOmCEjLwZfKfxmkoiB3KTUj+H2wxaHDsDrUBKTXizOYwEajBv0muSJqYiK7g0jA/9wMSirg5EIAk3qJ/5hCEodMoLzKeDqH+O3qdcYGA5WoDw33OavLS+ISlCt+paNzSIf8sFDtJdVxR7+0zcyCJPSkaUrpv8wedYS6NGharIDwB6J4qzWmeXUgSyzOWBqjB9Ex/sUE7Ur8OYsmig45JZahzhF+YMKzhp6MIOWGQWw48TWGvyfSP6RkeVtNFAanrHbqYHi70BC96sYhojWL8uRwPeh0DxbSq3yZVQ3/xHz/dGWVCyFvVVXazvQUyzCLAoQg02lPB1YUtrWNuUjWMOi39/gfvDheG6lLUKEupz1q8G0O0s9brWGUJsvCjx1rznZObeBLzrH4r1fD0BHbElhMT+NqxrIJH0cM+SvJZcfbxrNeU8B421pzQfwY+j+xJ89TQuYrrxURcNqbDlulHtdWr9V5kkI8eufwRK0bmHxgZFR7IVue/dkUTpjPNfIk4fY+B/d3l+Caql3YaeyNV6cnsYfvyNlpH6wJAwXLK+QsCoQ7bIytJfXuxO//B9U+9pM/RysMNERWWeg/SKLJ46utxa1D18bZnOXE9FqwvPI1WbcpDMWR6+yAvEUH3vsuiwrYtRFmXATQoc5q+0cRXeJw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199015)(8936002)(76116006)(66556008)(41300700001)(66476007)(8676002)(66946007)(52536014)(4326008)(66446008)(64756008)(38070700005)(54906003)(6506007)(2906002)(316002)(4744005)(5660300002)(33656002)(7696005)(55016003)(71200400001)(86362001)(478600001)(186003)(26005)(83380400001)(9686003)(110136005)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5967
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2cbc640c-77a6-4d83-3bb6-08daf55a67f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1oCIPuNBEWzxm9eG09ea3Ad+WC7Wo473wN8/NVOSUeIIVmpUQEz0LXuCp7HqxMgAqgLidvIS9bDp3d7mkB2vH2TiBrHc9K254NnY60EA2iJI3r7CSGaw7dBLtC3IzIy18+/4v3lFLSbZKHJM/SLMcQ4vJV958t2C+tbJmvdyHddhvJgL88s4UgQZ8bMI8+8GLTU9sDNIMnp+qoQo7P3OCiYkZRJD04OaFr9zImXwz1x8P+u1v6vS8o/PvoqAvazJkAgs9RmLHBQpKqoz6Ytd/21O+Q5aSfLtL591AIQ9pFcI7lfPp30ZNfXDuXI5CJJHO0m5RYReyaxaOl9aAq+9QZWIjkXVh2uuRE44Z+BzDKk/ezIttpgUAqJBPc8jcsjX3ppTHIaCtZ8FluiVUDSxxQ4P2JhyxT2vgfQ0Ue7VJ3rskj8R1Vw9z5is6ZxzBwMUUV5mLPMjC7tuNr5iI5z4EaIb0fSL/Qw9t7rh6fFQp/WnVK0eEOlUrUI1jE3OZWgNPeJtTgaYBlEBf1xcRzct6HMEheNM9R5tG8MfTiNZs/xSbsvRFuQC34D4NbtgbUI9urxqcOmoevYfAMk1pn34H9MVUxUh8hFLkqOXXU0jCNvrMBSLlqihVYxrtAbBJfvKa4Azr39WKarUfznk0lTOoZNuYlrTPUsmGU0G1+ec43d3WHYmUaIhvYY2kFu/cqFqjgzf2LPYGRg8qCmIMfLx+Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(9686003)(478600001)(7696005)(33656002)(6506007)(54906003)(336012)(70586007)(110136005)(70206006)(4326008)(8676002)(26005)(186003)(316002)(41300700001)(47076005)(52536014)(83380400001)(8936002)(5660300002)(2906002)(55016003)(86362001)(36860700001)(40460700003)(40480700001)(82310400005)(81166007)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 11:36:34.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe77d1c-62b7-4f66-4824-08daf55a6cc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7751

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQ
QVRDSCB2NCAwMS8xNF0geGVuL2FybTY0OiBmbHVzaHRsYjogUmVkdWNlIHNjb3BlIG9mIGJhcnJp
ZXIgZm9yDQo+IGxvY2FsIFRMQiBmbHVzaA0KPiANCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3Jh
bGxAYW1hem9uLmNvbT4NCj4gDQo+IFBlciBENS00OTI5IGluIEFSTSBEREkgMDQ4N0guYToNCj4g
IkEgRFNCIE5TSCBpcyBzdWZmaWNpZW50IHRvIGVuc3VyZSBjb21wbGV0aW9uIG9mIFRMQiBtYWlu
dGVuYW5jZQ0KPiAgaW5zdHJ1Y3Rpb25zIHRoYXQgYXBwbHkgdG8gYSBzaW5nbGUgUEUuIEEgRFNC
IElTSCBpcyBzdWZmaWNpZW50IHRvDQo+ICBlbnN1cmUgY29tcGxldGlvbiBvZiBUTEIgbWFpbnRl
bmFuY2UgaW5zdHJ1Y3Rpb25zIHRoYXQgYXBwbHkgdG8gUEVzDQo+ICBpbiB0aGUgc2FtZSBJbm5l
ciBTaGFyZWFibGUgZG9tYWluLg0KPiAiDQo+IA0KPiBUaGlzIG1lYW5zIGJhcnJpZXIgYWZ0ZXIg
bG9jYWwgVExCIGZsdXNoZXMgY291bGQgYmUgcmVkdWNlZCB0bw0KPiBub24tc2hhcmVhYmxlLg0K
PiANCj4gTm90ZSB0aGF0IHRoZSBzY29wZSBvZiB0aGUgYmFycmllciBpbiB0aGUgd29ya2Fyb3Vu
ZCBoYXMgbm90IGJlZW4NCj4gY2hhbmdlZCBiZWNhdXNlIExpbnV4IHY2LjEtcmM4IGlzIGFsc28g
dXNpbmcgJ2lzaCcgYW5kIEkgY291bGRuJ3QNCj4gZmluZCBhbnl0aGluZyBpbiB0aGUgTmVvdmVy
c2UgTjEgc3VnZ2VzdGluZyB0aGF0IGEgJ25zaCcgd291bGQNCj4gYmUgc3VmZmljaWVudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IFJl
dmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpJJ3ZlIHRl
c3RlZCB0aGlzIHBhdGNoIG9uIEZWUC4gVGhlIGRvbTAgYm9vdHMgZmluZSwgbGludXggJiB6ZXBo
eXINCmd1ZXN0cyBjYW4gYmUgc3RhcnRlZCBhbmQgZGVzdHJveWVkIHdpdGhvdXQgaXNzdWUsIHNv
Og0KDQpUZXN0ZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0K

