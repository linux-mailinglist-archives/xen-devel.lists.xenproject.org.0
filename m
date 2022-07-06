Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E6567FDC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361847.591615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUr-0006QM-AX; Wed, 06 Jul 2022 07:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361847.591615; Wed, 06 Jul 2022 07:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUr-0006LP-0p; Wed, 06 Jul 2022 07:30:53 +0000
Received: by outflank-mailman (input) for mailman id 361847;
 Wed, 06 Jul 2022 07:30:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zUp-0004kS-3F
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:30:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f19f297-fcfd-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:30:50 +0200 (CEST)
Received: from DU2PR04CA0289.eurprd04.prod.outlook.com (2603:10a6:10:28c::24)
 by DB6PR0802MB2165.eurprd08.prod.outlook.com (2603:10a6:4:86::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Wed, 6 Jul
 2022 07:30:43 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::1e) by DU2PR04CA0289.outlook.office365.com
 (2603:10a6:10:28c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Wed, 6 Jul 2022 07:30:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:30:43 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Wed, 06 Jul 2022 07:30:43 +0000
Received: from b4611fb5d6bc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 150C2E10-C607-4A79-81D4-0FB1C1C109E4.1; 
 Wed, 06 Jul 2022 07:30:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4611fb5d6bc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR2PR08MB4731.eurprd08.prod.outlook.com (2603:10a6:101:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:30:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:34 +0000
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
X-Inumbo-ID: 8f19f297-fcfd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d6xYBZDtNx9YGubQz9chj+MfyNuI4U5jZplSaEpQVxJCuWlQ8cxB34DQoUYAjI0O9IYkgaiNEGosrHX4Cu9no3uyqRNZS9szlJrtM2dzBWupnnuKVVFRC2mAFwgi5/Pt7BTy2+BssG7xxjruLgDSkAGb7GIA4lBW0tqfGtH+NPmMn7B/VWNSYfUqf/AT5kO5HMi8ItxDApogu3JzCzIzwG4SOVXo42nQ9nLQESKjqYXVhycPrq9q6h2EavUIu8ciqTgjvmI40AyZrHroMDxPNX09t+yT30AFGTFHEDGr7iB6VdUaz9guTD8g/Z14FrfVipfgrK7Pnt97tzZU2u2NHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDSJvr1aCT51I79vsIGcfJxrL07Fyi9UKI54RhWZPI8=;
 b=F5PHR9vrSaOnAMuzHe8e+fy+AwX79NJuk+kDMgoKlHUQTl50zeZQxlXfj7WbrAmsS78WmSbYIPvWMExEQ5O6U1isHrKJYNZ7KV0ZVm58NOedAyNUj0i2baxOzpCjEBY0OLoMwZpOZrkxRuerKwvDKtmgOoTw8jWrIgw8jqWv2RHCFJ3/0+Xo2AhjHK0C/zpc661GiWjSoBc9aUY//AkVPnkkQ64f7phUikb3jEHMUCQnuOCra290HfiqTDSTSArDBpjCC3bh7W/pr6vmQUVt/NRO2nmmQVH1lLutOt5CujisB5wYV+PmzHRazrV3W6+TskrqXDhrQcjOTvF1xquenQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDSJvr1aCT51I79vsIGcfJxrL07Fyi9UKI54RhWZPI8=;
 b=hvIU/ZnKoFuHmam8Lz5ebbeSrrrVD5ZioEnXrc7FOJ05I55zI+omAHzlkNhMp+K6fF9yEqBBMhpY1dAFupVzyv4s2AZK4RT87VhOmqlBp4QvwEu8yj9mlPz/Lp0Qihld9s2i+wlvyXi+G8d/Is7wx7elVTF86Nn7EGL4fNEq444=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PW5vRR9XQebdPwmulEXg5trJI/hjLh482uy48uA832QASX010PDP46ynxB7WAXn04ENTqhppm6aVuyfWU3xmnZ8+50pT5Ddj7GAwq8vB3ksqsm1wGSzR/3ZKEo97hr2jq0w+Rrf4AjZgQ38mOJUCfC1FKiv//ssNdAVqyV4BMmt0yQuPeFJyxDwerG1CLzWFYztdneVY4v0ux3igcTSimoPGL/aROve/kDa7rNwGYZQmiJvmLwTPXNoZyDI88K4Ebyr2XFyUn/rMuHFKZWhlJzFg6Kpa/oyPizFuX4VC0i5gPok/XNFo9Ka1Qop3IXLViEFlHvm3VtqLHb8Zvr3NVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDSJvr1aCT51I79vsIGcfJxrL07Fyi9UKI54RhWZPI8=;
 b=igp47OEjqtT9fgbyrhjFu4hM5DhsxDKyDZ5BJ1q2t84cBFtXtZ4DG5Hl1h/GVU4uhc3usLrdtTIslxS157mvEBJBX8C6SXe4gBcrzRTT8E8QW/LthiHgeVjwkELEt8Q4N09K3u8S8iWiT6M8euv2A1hdMGu0KnmZgtB4ws299HTVUpqdXvEXXDE+H7gkoi7Ep/iu+eGgyQo8F16f4pn52dYNSiC4fTg2U7eltcKeNn4mgGe2txowbhbHEOhHTnH2xcGLfDQatr6RZ9XYDQ5Kt/J4mI8K/C+RAGSYgdX0GshvQQg/gsBqXUY1x2pecfPKdYtEUcpRD/HeQRwQvnEjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDSJvr1aCT51I79vsIGcfJxrL07Fyi9UKI54RhWZPI8=;
 b=hvIU/ZnKoFuHmam8Lz5ebbeSrrrVD5ZioEnXrc7FOJ05I55zI+omAHzlkNhMp+K6fF9yEqBBMhpY1dAFupVzyv4s2AZK4RT87VhOmqlBp4QvwEu8yj9mlPz/Lp0Qihld9s2i+wlvyXi+G8d/Is7wx7elVTF86Nn7EGL4fNEq444=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [RFC PATCH 0/4] Introducing a common representation of boot info
Thread-Topic: [RFC PATCH 0/4] Introducing a common representation of boot info
Thread-Index: AQHYdHf6JvWZG2GXVE2XLLkq14FnwK1xI0fQ
Date: Wed, 6 Jul 2022 07:30:34 +0000
Message-ID:
 <AS8PR08MB79910EC13ABF2C848AF9850092809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220531024127.23669-1-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DF92FB237FF0DE43B361E50E8459391D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2e97b436-4e69-4ff1-e0cb-08da5f216f47
x-ms-traffictypediagnostic:
	PR2PR08MB4731:EE_|DBAEUR03FT060:EE_|DB6PR0802MB2165:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kDdbplB+KhxxdmeNGa1RD+/NEqUx6rJAdCWl9AyZQXl86WoAx8xlNtERQXxWjtxlQWetkjy8+58QOd9dFw6R06EXqVAW1fe9bVTIV9qsPSlC0UJ76EJBpUfCMysmAVwlF5EPWFimxcbvoMEQY5HjReT7KL2Ob+xTul59EYTj7zo9MfkRGRcnG2ULBk3QYcuJuduaHQpKESndV3EOYc4EpjAR4mNO16wTjFE17wz2kqXQcrXYHdRooevIkqX3Wah2TC5Ezvs/Ub2Ogu/peDRlHpCvVoiCf+Dij46FsCRXHoBi7z/OwLEKY9IrbVINJID7SYzC/y9ROWCSFEGLJArSB+93zCzIIKe1QMXf/k2qX0VGVtucW4L/MZX9Tvc3eZa8BXQu+aFES6+Oiq3VMO3AsPf2JSrCXRoLCwNCaXozBY8h/CLmIKkQ9Lan+H22j0nUlQGCmJ3PRzAhpx1g9E+HmU/eIFZ87VX5L3vpHQEigk01ST/7dGXn6YCbJ95xHNsGRu7Wp/5tXkenVRg8jj5vuo0hrTg4hFP8PhVKJUS4YFzNDXxO7UFRusp9u2tqnZ0brPpoBWyRFINxqbIxGqEqQ7PdxfhtrxrMDCPAuREdMZ8ochDe2Ctx7SsxMlm/nRvD600Zlo01QdPprt3gxPofXArf4XhsyQJpH73qLu8C0TwCKqptCs1fA25YgqBusZd2cRjz3btsMeEGWuXcj3+tabvUkRnlk7eRhGHPOpr8Wo7rq8T9EPIxdaxMgL8IdaJPE0rFkXJzE/HELabZOoe+Y8xQatSguwROsKv8mNH0FZqfpagkDyCXaYrIoa9cpWnm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(41300700001)(52536014)(186003)(8936002)(6506007)(7696005)(86362001)(5660300002)(2906002)(38070700005)(66556008)(478600001)(55016003)(8676002)(33656002)(38100700002)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(9686003)(26005)(316002)(71200400001)(54906003)(110136005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e545182c-b358-42fe-c6bc-08da5f216a26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2BhfsXWgwib7Esg/NZ0A2uRjhzyY6aSorP0qVVnzjX8TyJiCglgQssjt87buKK44uhfhPqf/NBhseny87XvoNM0JmhT17USBeRdWa+DkXMRSXqpOn6sLA3HcPSmwqhs9LCFxetx4vdAXQBz0OEEJ28EkY5/GiKqmNVre9PzmT2oVNFCN2taDYlVCgISadbpYT3PuG1XJio1MPyW/j0raun3bHaCjASicb5pBimuHzVIg9LVbpFKUVfi3Fbvx5qUGFnqeRk5WENKu/bXTLgxh3fDyawPCET/T6Fck1zQcMO7fELrg+KGxVE6I0JSiKsz/QqniZGioqQkgS1UCLG4WuoanszzMr/Uit1QmY/Xcu5BBTCPq1IFNvBPwSPVPVlSxpqIHthPWuJMcjd2vZfK9WGQqf4ydRUoS6aTRub1eiiC8cwI5rHZ4akyv6tkPng6Ci3O8w+v3hgWaq2cx1xYoyhWQw5eIrowJx9UiZLCmTqj3OM3d3+kz36lxL44ntDSgn8sxqcSYOSc2isDHLZL68gIUB52MMKBbXS1uB2CakJ/QeymtnCaLB8MWfFQFUlIUOX5LGmypiHp6zVUkkH8Dwjqpe3XEmbtgJBR6ZXggTWkUk5U6xFO58UF9KjDzuoNic65jC4F+pMCyLfCQGVmRy4SGBBnMQGQWFgmMp4TiDjMMbqL6SpQG2b/R1oEJuC+Ztiy53+5UyVCNk/VP1UDE/PsNLCHpAG2zVznsUhVrxXs5GUcOhAi6o63qGnrXtN5gtdO90/YDVtXg9rBKLJ2P65K1NpWdJsoSkskJU5p6nPjDPkIkGveZv6bt8w4GJGO6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(9686003)(110136005)(47076005)(336012)(40460700003)(26005)(54906003)(82310400005)(186003)(316002)(52536014)(107886003)(83380400001)(86362001)(5660300002)(70586007)(2906002)(81166007)(40480700001)(55016003)(36860700001)(478600001)(6506007)(7696005)(8936002)(4326008)(8676002)(41300700001)(70206006)(33656002)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:30:43.1731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e97b436-4e69-4ff1-e0cb-08da5f216f47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2165

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaGFzIGJlZW4gc3RhbGUgZm9yIG1vcmUg
dGhhbiBhIG1vbnRoLCB3aXRoOg0KDQpQYXRjaCAjMSBoYXMgc29tZSBkaXNjdXNzaW9ucyBpbiB0
aHJlYWQuDQpQYXRjaCAjMiAjMyAjNCBuZWVkIHNvbWUgZmVlZGJhY2sgZnJvbSBtYWludGFpbmVy
cy4NCg0KU28gc2VuZGluZyB0aGlzIGVtYWlsIGFzIGEgZ2VudGxlIHJlbWluZGVyLiBUaGFua3Mh
DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gU3ViamVjdDogW1JGQyBQQVRDSCAwLzRdIEludHJvZHVjaW5nIGEgY29tbW9uIHJlcHJlc2Vu
dGF0aW9uIG9mIGJvb3QgaW5mbw0KPiANCj4gVGhpcyBzZXJpZXMgc2VydmVzIGFzIGEgcHJvcG9z
YWwgdG8gYXJyaXZlIGF0IGEgY29tbW9uLCBjcm9zcy1hcmNoaXRlY3R1cmUNCj4gd2F5DQo+IGZv
ciBib290IGluZm9ybWF0aW9uIHRvIGJlIHJlcHJlc2VudGVkIGR1cmluZyBzdGFydHVwLiBUaGlz
IHByb3Bvc2FsIGlzDQo+IGRlcml2ZWQNCj4gZnJvbSB0aGUgc3RydWN0dXJlcyBkZXZpc2VkIHRv
IHJlcHJlc2VudCBoeXBlcmxhdW5jaCBib290IGluZm9ybWF0aW9uLiBUaGUNCj4gaHlwZXJsYXVu
Y2ggYm9vdCBpbmZvcm1hdGlvbiBzdHJ1Y3R1cmVzIHRoZW1zZWx2ZXMgd2VyZSBiYXNlZCBvbiB0
aGUgYm9vdA0KPiBpbmZvDQo+IHN0cnVjdHVyZXMgdXNlZCBieSBBcm0gYW5kIGRvbTBsZXNzLiBB
IHNpZ25pZmljYW50IGVmZm9ydCB3ZW50IGludG8gZW5zdXJpbmcNCj4gdGhlIHN0cnVjdHVyZXMg
YXJlIGFibGUgdG8gc3VwcG9ydCBkb20wbGVzcyBhcyB3ZWxsIGFzIGh5cGVybGF1bmNoLg0KPiAN
Cj4gQXJtIGFuZCB4ODYgYm90aCBoYXZlIGFyY2ggc3BlY2lmaWMgaW5mb3JtYXRpb24gdGhhdCBt
dXN0IGJlIHJlcHJlc2VudGVkLg0KPiBUaGUNCj4gYXBwcm9hY2ggaGVyZSBzb3VnaHQgdG8gc3Vw
cG9ydCB0aGlzIHRocm91Z2ggYXJjaCBzdHJ1Y3R1cmVzIHdoaWxlDQo+IGF0dGVtcHRpbmcNCj4g
dG8gbWF4aW1pemUgd2hhdCB3YXMgcmV0YWluZWQgaW4gdGhlIGNvbW1vbiBzdHJ1Y3R1cmVzLiBG
b3IgdGhpcyBzZXJpZXMsIHRoZQ0KPiBmb2N1cyB3YXMgb24gY29udmVydGluZyB4ODYgb3ZlciB0
byB0aGUgbmV3IGJvb3QgaW5mbyBzdHJ1Y3R1cmVzLg0KPiANCj4gVGhlIG1vdGl2YXRpb24gZm9y
IHRoaXMgc2VyaWVzIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IHRoZSBtdWx0aWJvb3QgdjENCj4g
c3RydWN0dXJlcyB1c2VkIGJ5IHg4NiBhcmUgbm90IHN1ZmZpY2llbnQgZm9yIGh5cGVybGF1bmNo
LiBJbiB0aGUgcHJldmlvdXNseQ0KPiBzdWJtaXRlZCBoeXBlcmxhdW5jaCBSRkMsIHRoaXMgd2Fz
IG1hbmFnZWQgYnkgd3JhcHBpbmcgdGhlIG1iIHN0cnVjdHVyZXMNCj4gaW5zaWRl4o6EIHRoZSBo
eXBlcmxhdW5jaCBzdHJ1Y3R1cmVzLiBUaGlzIGF0IGJlc3Qgd2FzIGNvdWxkIGJlIGNvbnNpZGVy
ZWQNCj4gY3J1ZGUsIGJ1dCByZWFsbHkgaXQgd2FzIGp1c3QgYSBoYWNrLiBPbmUgb2YgdGhlIGdv
YWxzIG9mIGh5cGVybGF1bmNoIGlzIHRvDQo+IHVuaWZ5IGFzIG11Y2ggYXMgcG9zc2libGUgd2l0
aCBkb20wbGVzcyB0byByZW1vdmUgYW55IHVubmVjZXNzYXJ5DQo+IGR1cGxpY2F0aW9uLg0KPiBB
ZG9wdGluZyBhIGNvbW1vbiByZXByZXNlbnRhdGlvbiBmb3IgYm9vdCBpbmZvcm1hdGlvbiB3aWxs
IHByb3ZpZGUgYSBzb2xpZA0KPiBmb3VuZGF0aW9uIGZvciB0aGlzIHVuaWZpY2F0aW9uLiBUaGUg
YWRkZWQgYmVuZWZpdCBpcyB0aGF0IGluIGZldyBwbGFjZXMgdGhpcw0KPiB3aWxsIGVuYWJsZSBh
biB1bm5lY2Vzc2FyeSBhcmNoIHNwZWNpZmljIHZlcnNpb24gb2YgbG9naWMsIFhTTSBmb3IgZXhh
bXBsZQ0KPiB3b3VsZCBiZSBhYmxlIHRvIGRyb3AgYXJjaCBzcGVjaWZpYyBpbml0IGZ1bmN0aW9u
cy4NCj4gDQo+IFRoaXMgc2VyaWVzIGJlaW5nIHN1Ym1pdHRlZCBhcyBhbiBSRkMgZHVlIHRvLA0K
PiAqIHRoZSBudW1iZXIgb2YgZGVzaWduIGRlY2lzaW9ucyBiZWluZyBtYWRlIHdpdGhpbiB0aGUg
c2VyaWVzDQo+ICogdGhlIGxpbWl0ZWQgdGVzdGluZyBhYmxlIHRvIGJlIGNvbXBsZXRlZA0KPiAq
IGhvdyBleHRlbnNpdmUgdGhlIGNoYW5nZXMgd2lsbCBiZSBmb3IgeDg2DQo+IA0KPiBOQjogVGhp
cyBzZXJpZXMgaXMgYnVpbHQgb24gdG9wIG9mIHRoZSB2MiBwYXRjaCBzZXJpZXMsICJ4c206IHJl
ZmFjdG9yIGFuZA0KPiBvcHRpbWl6ZSBwb2xpY3kgbG9hZGluZyIuDQo+IA0KPiANCj4gRGFuaWVs
IFAuIFNtaXRoICg0KToNCj4gICBrY29uZmlnOiBhbGxvdyBjb25maWd1cmF0aW9uIG9mIG1heGlt
dW0gbW9kdWxlcw0KPiAgIGhlYWRlcnM6IGludHJvZHVjZSBnZW5lcmFsaXplZCBib290IGluZm8N
Cj4gICB4ODY6IGFkb3B0IG5ldyBib290IGluZm8gc3RydWN0dXJlcw0KPiAgIHg4NjogcmVmYWN0
b3IgZW50cnlwb2ludHMgdG8gbmV3IGJvb3QgaW5mbw0KPiANCj4gIHhlbi9hcmNoL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICsrDQo+ICB4ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vc2V0dXAuaCAgICAgICAgICB8ICAgNSArLQ0KPiAgeGVuL2FyY2gveDg2L2Jvb3QvYm9v
dF9pbmZvMzIuaCAgICAgICAgICAgfCAgODEgKysrKysrKysNCj4gIHhlbi9hcmNoL3g4Ni9ib290
L2RlZnMuaCAgICAgICAgICAgICAgICAgIHwgIDE3ICstDQo+ICB4ZW4vYXJjaC94ODYvYm9vdC9y
ZWxvYy5jICAgICAgICAgICAgICAgICB8IDE4NyArKysrKysrKysrKy0tLS0tLQ0KPiAgeGVuL2Fy
Y2gveDg2L2J6aW1hZ2UuYyAgICAgICAgICAgICAgICAgICAgfCAgMTYgKy0NCj4gIHhlbi9hcmNo
L3g4Ni9jcHUvbWljcm9jb2RlL2NvcmUuYyAgICAgICAgIHwgMTM0ICsrKysrKysrLS0tLS0NCj4g
IHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgICAgICAgICAgICAgIHwgIDEzICstDQo+ICB4
ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggICAgICAgICAgICAgICB8ICA5NiArKysrKy0tLS0N
Cj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vcHZoLWJvb3QuYyAgICAgICAgIHwgIDU4ICsrKyst
LQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgICAgICAgICAgICAgfCAgNDIgKyst
LQ0KPiAgeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2Jvb3RpbmZvLmggICAgICAgfCAgNDUgKysr
KysNCj4gIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9iemltYWdlLmggICAgICAgIHwgICA1ICst
DQo+ICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZG9tMF9idWlsZC5oICAgICB8ICAxNSArLQ0K
PiAgeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2d1ZXN0L3B2aC1ib290LmggfCAgIDYgKy0NCj4g
IHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgICAgIHwgIDE0ICstDQo+ICB4
ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jICAgICAgICAgICAgICB8ICAzNCArKy0tDQo+ICB4
ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICB8IDIzNCArKysrKysrKysr
KystLS0tLS0tLS0tDQo+ICB4ZW4vY29tbW9uL2VmaS9ib290LmMgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArLQ0KPiAgeGVuL2luY2x1ZGUveGVuL2Jvb3RpbmZvLmggICAgICAgICAgICAgICAg
fCAxMDEgKysrKysrKysrKw0KPiAgeGVuL2luY2x1ZGUveHNtL3hzbS5oICAgICAgICAgICAgICAg
ICAgICAgfCAgMjYgKystDQo+ICB4ZW4veHNtL3hzbV9jb3JlLmMgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyMiArLQ0KPiAgeGVuL3hzbS94c21fcG9saWN5LmMgICAgICAgICAgICAgICAgICAg
ICAgfCAgNDQgKystLQ0KPiAgMjMgZmlsZXMgY2hhbmdlZCwgODA0IGluc2VydGlvbnMoKyksIDQw
NyBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvYm9vdC9i
b290X2luZm8zMi5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2Jvb3RpbmZvLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS94ZW4vYm9v
dGluZm8uaA0KPiANCj4gLS0NCj4gMi4yMC4xDQo+IA0KDQo=

