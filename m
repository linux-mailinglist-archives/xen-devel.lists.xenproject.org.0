Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433CF5B0639
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 16:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401851.643807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvpX-0006hv-GN; Wed, 07 Sep 2022 14:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401851.643807; Wed, 07 Sep 2022 14:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvpX-0006fm-Cu; Wed, 07 Sep 2022 14:15:03 +0000
Received: by outflank-mailman (input) for mailman id 401851;
 Wed, 07 Sep 2022 14:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVvpW-0006fg-27
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 14:15:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74d3def5-2eb7-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 16:14:59 +0200 (CEST)
Received: from DB6PR07CA0181.eurprd07.prod.outlook.com (2603:10a6:6:42::11) by
 DB9PR08MB6540.eurprd08.prod.outlook.com (2603:10a6:10:260::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Wed, 7 Sep 2022 14:14:51 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::f) by DB6PR07CA0181.outlook.office365.com
 (2603:10a6:6:42::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 14:14:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 14:14:50 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 07 Sep 2022 14:14:50 +0000
Received: from 4c41b67a78e3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E65BE13-518F-406C-8E36-A46A8B803B1D.1; 
 Wed, 07 Sep 2022 14:14:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c41b67a78e3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 14:14:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB5585.eurprd08.prod.outlook.com (2603:10a6:20b:1c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 14:14:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 14:14:38 +0000
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
X-Inumbo-ID: 74d3def5-2eb7-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ppo5U8i4vs9UYA2NvdxyMwskAnWm1MKb6zzGCXfAwP3dtqEXkaq6z5X0QfMK/lpXAzn0Li3fru6tLKjmt0STkhPtzSxX8bY4PbeRoCtVN96+RHGDaTmHRv/lUrH/IChb1yqR1rzud2kvF+VsNQgRITAWOAbjsrK4y3YWySt7RSHPJxDHcmM2z3rUpYfjpoxh2NHTM4IwbJpcG2xVCKHQ/ovU7GPMKigJq0xrcN9+dcHr2ihz+Yer3YEttik7uPS9+DyOVTJS3i3qB3FU1Vvm6+NKhZ1A6fLOeYTnRWvg9gHO1CuL/184KNfa56cwP+DFB1UUI7plVpLRGnQZaIQBxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rW06Bc/e8+mEo4JxNKnPJ8HhgaDxkvBL1xipYJkYhk=;
 b=NElo8s1zSyArBUAkidHYF1doQ/3SPPm4FscBDSmiDudD8LcSFru/xPywwVfHTkFkhf1w7mVflU1/S4ljrWZfc673ipyAdvQn7nXQsdOqDStkG9ayn/p8uiOICoteo2JRIAG95zu0bv5z6SF5//5KUUC65UvatsFMuiFTPGDH6VzkW0IqDkCd2iWo4Q1Tm5acHsVS+/lPGO0RSX85OFkFDylAwpC8MF26HZ8246U/4YTgRkbsajcPWc81aJdWEo4AbYDzZATuhtnTwxvA0Hk0Owhc60LoGz7USI7kMEMa+B+AMPeTgrOohZ3HYB8QZ0c7E2EDckGWb+vB/iM3SorwCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rW06Bc/e8+mEo4JxNKnPJ8HhgaDxkvBL1xipYJkYhk=;
 b=17fJ02mfrrusMFxvslzSclxHiEOLMQt7H03P+hXnr1jUisCM7OAGND9at6P0g2Lf4xWVLXOrs2LdLnQbxMEjRLvACMjeIj4nIyiZiPptLEUVj3mxSGjeK+ZRK2nUkALYdvhyJDOxtaoeN5PEA3UT/GSBOrFWljXhW8dmhMVJdYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLUdIr/caR52ts9PcjP1m00OTRIoeJr7B5m5sClwGADh95lYzsfVrjPwlcRKMXWHHpxOwE8RsRa7g3jwrH8LgAKqJIbspmd2rdwZ4m3qY2KlDhPCUzw/j9WXQXgACzHQnovyJnIFRKRE8AZ8DkBYzN0al7Zl1Y3biwTj4VP14gaB0FQNEO2RTQRDhqZePewcJi4isNfsEv7Ca1ckJdlBwhpw3+d8UFe2yc52VU0l/Fl0zm297Bzv5IN0oxe7zHp8h0CKHmHMImWmXJi1dtE7PNNlde19hbIvRrFAhiHo30XkjmgXxkloyOm3tlaA68yHa8rpdthZA6JHoX3uw2egCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rW06Bc/e8+mEo4JxNKnPJ8HhgaDxkvBL1xipYJkYhk=;
 b=OxVJCzKSJjys4CNuft7neg7otj4bw+steiE2iBXJMMtMHA7KIwGQeSHtz2s5qT1FCxsTXQA1ujFm7bowPypCX0gxe03X3APa7EGkEY3TXMfFnJv8WCBZAR3F3WNagQhiH0km/JWeCoTtweW8aHO9RVN4M8QRtM+XTC9tUQy6qb3tl8rhf2VaPFZC9ENmtbcNv6fupTZKwkt8GrWnHOxL0EJn8RMkt6CoRY6cklZLO6Vd4W+Z6zKQtE0wIiMxNhkfLoSiLYUJnxgCcYNaR/R6IzyjZe5FgP+YYDWz1IELwSwRkV1dN4QwrOVQjgX4/DxDOI3J5EIUTkJM6xPAy7toVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rW06Bc/e8+mEo4JxNKnPJ8HhgaDxkvBL1xipYJkYhk=;
 b=17fJ02mfrrusMFxvslzSclxHiEOLMQt7H03P+hXnr1jUisCM7OAGND9at6P0g2Lf4xWVLXOrs2LdLnQbxMEjRLvACMjeIj4nIyiZiPptLEUVj3mxSGjeK+ZRK2nUkALYdvhyJDOxtaoeN5PEA3UT/GSBOrFWljXhW8dmhMVJdYI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ7IYztv5II0KGaSuPgw9aFq3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAAB+gIAAARoAgAACMwCAAABysIAABM8AgAABvTA=
Date: Wed, 7 Sep 2022 14:14:38 +0000
Message-ID:
 <AS8PR08MB7991D882840CD6EA9D38C7D792419@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
 <eed26206-9684-4010-278c-14ed3602582b@amd.com>
 <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com>
 <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
In-Reply-To: <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F0EEEC8FBFE0DC47A65A7FF73396C921.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d27804c6-cbd4-4c03-c08e-08da90db541c
x-ms-traffictypediagnostic:
	AM8PR08MB5585:EE_|DBAEUR03FT036:EE_|DB9PR08MB6540:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PH3Mxo/1Ur0Iqz4phAdKStaYAPfok+FmhGKcEkUwlPN/Ryl97GAV3nhyDpRr5FWTsH5RbIVq1UPk5ydkk5qn4IMT0Vwi1TNIrjdwzNfZ6tiX9j+M/G+ehERo246ysp4R7iBzf0UpUObqDt1YTVupJTX9LKZUSsm6fPeZyFtQYB8RNvm+EMctsNuftjvhaol17vGIO0ENJp49vIetSN3xs+K/dmBLXzW5ngush1Rel0mRKZKCZWYkhUT07pQECbGRJwu6V2v8ghYkxfIpr2YAnXwwstXxun1RS74VQAxjhVtMZ/7nCeBxMMd4hj9gMsfxNfhmpnPZxyqEzb7q8NmT+wO5/7jFjsJkpp0ffzPiU63o71ltYnHpnVnP+JYbIwwyGisbqFAG/bB4pJBLYZZKk0TREVZM1snJzC/0znTQK8cASTUsRGSo6DEyQqRe66hRkb9vawIPQ6ytRU0IaOThQXHRAkvIMdXgDnVcVtNuTcIGBRjlJHeeZ1mmxs/abqVxH/9Xzu2NMTF+1djtFpolr2jLvOJ1DoX1KOXIjG0uQRp9T0y9zkZu5gmfzcO8YO6Ef/2FpDz6st9rELOA2dqlbX1po6L+G9VTIsdqa1c2Sg4w7E+0W3xOObEb7vg4XOIWkpevAmZr0jTTvOm9FBN1s+wHDU7rivKnOwGsQ3WCK/89QS/Rq23bl1qRQcjtzr1oqaeK2YCi7kCKOjYkHL8ypoJgtkRXDX+mSZNSY1ivBm1K7GSAqDnuC8uGFXVp7p67Gy4iZLHDJ9ArHwuRNsSjeQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(54906003)(5660300002)(71200400001)(8676002)(41300700001)(66476007)(4326008)(110136005)(64756008)(478600001)(66446008)(52536014)(8936002)(316002)(66556008)(76116006)(66946007)(86362001)(33656002)(186003)(6506007)(7696005)(2906002)(9686003)(26005)(38070700005)(122000001)(83380400001)(55016003)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5585
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2944c3c0-f436-4cea-5669-08da90db4c70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	upAmw/YlZR9vhjJ2yTou2EfnISvoUkBbArw/TbM3gcCqYyxI/N0cyl+FU3Fe3xc5dhg4PnLy8EsNW8vtNkR92GyKTaHAsQhtw7VwQ4c1pif8ImD1dxX9zhWF1+QUM+p6t3db3SNgT+aRjTLC1fqdr5+p7NsrZrwMY3+1Efol8zb8eatGSY7iuRnx6Apc/V9ENjRolvopuE7WIurK6QTjyK9yOlzr2MCUFcO2ivfju5gjwsC5z5ZjT94GtbzHxDH11WFPdgNiYTSN5EvLvGtkjUi+hNMpZqqGIcqyfDzeq7SfPmbHxPXcLeMeVdygUiWvF0ltN3jcMigLYOzYKubwWFAmgitnLcQL7d2JPnafrwe3ssaPeABACHWw3NAFeaBpesisT5ntOwLMCUlFaBIDzew/00LgS4Fh1AUrzIRjrJ54MXwQRN8uoWgp/o9nJGdqSju35g8yjxM2JrvdSApgy7QNlAGqXOHDpxs193Jmq58Vf9PJg+9wpMLYcG2sMDWW4VrdbWiOw5DrSJG6bm3aJH/rnVcjqimRgo2nw2ZLtihrFCQHYhabJ+eaLLWef/825dvnRb/YSi43uwkaEhv0zLXS7YmxDgc4CYco8CdsYjEgykxTPqqrBZw+QQBF8TxzexXIn3PR7fScCdlfyz2A09adIq58BeP8WQuk0kEEWd97/IK0JEcWx3yuOZVO5bcLpLlVpdqHFhOHialL+vTUYPfvYv+ri6RBDdc9GL1+8TF0drQFwINYvSLFFoS9S+y7FEm9j6K8Wy0V8HQTScpNtA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(5660300002)(336012)(186003)(2906002)(40460700003)(55016003)(40480700001)(83380400001)(9686003)(26005)(4326008)(70586007)(33656002)(82310400005)(86362001)(70206006)(7696005)(6506007)(36860700001)(8676002)(110136005)(41300700001)(54906003)(81166007)(356005)(82740400003)(316002)(8936002)(478600001)(52536014)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:14:50.9754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d27804c6-cbd4-4c03-c08e-08da90db541c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6540

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gSSB0aGluayBJJ3ZlIGFkZHJlc3NlZCBhbGwg
Y29tbWVudHMgZnJvbSBKdWxpZW4gcmVnYXJkaW5nIG15IHNlcmllcywNCj4gDQo+IElmIGl0IGlz
IG5vdCB0b28gbGF0ZSBmb3IgeW91IHdvdWxkIHlvdSBiZSBhYmxlIHRvIHJlc2VuZCB5b3VyIHNl
cmllcw0KPiB3aXRob3V0IHRoZSAnYWRkcmVzcy1jZWxscycvJ3NpemUtY2VsbHMnIGNoYW5nZT8g
VGhpcyB3aWxsIGdpdmUgbWUgdGhlDQo+IG9wcG9ydHVuaXR5IHRvIGhhdmUgYW4gb3RoZXIgcmV2
aWV3IHRvZGF5Lg0KDQpJIHdpbGwgYmUgb2ZmIGFmdGVyIHJlc2VuZGluZyB0aGlzIHNvIHlvdSBj
YW4gaGF2ZSBhbm90aGVyIGxvb2sgdG9kYXkuDQoNCj4gDQo+ID4gc28gSSB0aGluayBJJ3ZlIGdv
dCBzb21lIGJhbmR3aWR0aCB0byBkbyB0aGUgY2xlYW4tdXAgcGF0Y2ggdG9tb3Jyb3cNCj4gPiBh
ZnRlciB0aGUgYWdyZWVtZW50LCB1bmxlc3Mgc29tZW9uZSB3b3VsZCBsaWtlIHRvIGRvIGl0IGhp
bXNlbGY/DQo+IA0KPiBSZW5hbWluZyAieGVuLHN0YXRpYy1tZW0tLi4uIiBpcyBhIGJpdCB0cmlj
a3kgYmVjYXVzZSB0aGV5IGhhdmUgYmVlbg0KPiBkZWZpbmVkIGluIFhlbiA0LjE2Lg0KPiANCj4g
SSBjb3VsZG4ndCBmaW5kIGFueSBzdXBwb3J0IHN0YXRlbWVudCBzcGVjaWZpYyB0byB0aGUgc3Rh
dGljIG1lbW9yeQ0KPiBmZWF0dXJlLiBTbyBpdCB3b3VsZCB0ZWNobmljYWxseSBmYWxsIHVuZGVy
IHRoZSAiZG9tMGxlc3MiIHNlY3Rpb24gd2hpY2gNCj4gaXMgc2VjdXJpdHkgc3VwcG9ydGVkLg0K
PiANCj4gVGhhdCBzYWlkLCBJIGRvbid0IHRoaW5rIHdlIGNhbiBjb25zaWRlciB0aGF0IHRoZSBz
dGF0aWMgbWVtb3J5IGZlYXR1cmUNCj4gaXMgZXZlbiBzdXBwb3J0ZWQgYmVjYXVzZSwgdW50aWwg
eWVzdGVyZGF5LCB0aGUgY29kZSB3YXNuJ3QgcHJvcGVybHkNCj4gaGFuZGxpbmcgcmVxdWVzdCB0
byBiYWxsb29uIGluL291dC4gU28gSSB3b3VsZCB2aWV3IHRoaXMgaXMgYSB0ZWNoDQo+IHByZXZp
ZXcgKENvdWxkIHNvbWVvbmUgc2VuZCBhIHBhdGNoIHRvIGNsYXJpZnkgU1VQUE9SVC5NRCk/DQoN
CkluIGN1cnJlbnQgY29kZSwgdGhlIHN0YXRpYyBhbGxvY2F0aW9uIGlzIGluIFNVUFBPUlQubWQg
YXMgdGVjaCBwcmV2aWV3Lg0KDQo+IA0KPiBUaGlzIHdvdWxkIG1lYW4gdGhhdCB3b3VsZCBiZSB0
aGF0IHdlIGNvdWxkIGNvbnNpZGVyIHRoZSBiaW5kaW5nDQo+IHVuc3RhYmxlIGFuZCB3ZSBjb3Vs
ZCBkbyBhIHN0cmFpZ2h0IHJlbmFtaW5nLiBUaGF0IHNhaWQsIEkgY2FuDQo+IHVuZGVyc3RhbmQg
dGhpcyBtYXkgYmUgdW5kZXNpcmFibGUuDQo+IA0KPiBJZiB0aGF0J3MgdGhlIGNhc2UgdGhlbiB3
ZSB3b3VsZCBuZWVkIHRvIGtlZXAgdGhlIGN1cnJlbnQgYmluZGluZyBhcy1pcy4NCj4gU28gd2Ug
d291bGQgaGF2ZSB0d28gb3B0aW9uczoNCj4gICAgMSkgUHJvdmlkZSBhIG5ldyBjb21wYXRpYmxl
IHNvICNhZGRyZXNzLWNlbGxzICNzaXplLWNlbGxzIGNhbiBiZQ0KPiB1c2VkLiBUaGUgY3VycmVu
dCBiaW5kaW5nIGNhbiBiZSBkZXByZWNhdGVkDQo+ICAgIDIpIExlYXZlIGFzLWlzIGFuZCBhY2Nl
cHQgdGhlIGRpZmZlcmVuY2UNCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIG9u
IHdoaWNoIHdheSB0byBnby4gV2hpY2hldmVyLCBpdCB3b3VsZCBiZQ0KPiBnb29kIHRvIHdyaXRl
IGRvd24gdGhlIHJhdGlvbmFsZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugb2YgdGhlICJmdXR1cmUi
DQo+IHBhdGNoLg0KPiANCj4gSSB3b3VsZCBub3QgYmxvY2sgdGhpcyBzZXJpZXMgb24gdGhlIHJl
bmFtaW5nIGZvciBleGlzdGluZyBwcm9wZXJ0eQ0KPiAod2hhdCBtYXR0ZXIgaXMgdGhlIG5ldyBv
bmVzIGFyZSBjb25zaXN0ZW50IHdpdGggdGhlIGRpc2N1c3Npb24pLiBUaGUNCj4gcmVuYW1pbmcg
Y291bGQgYmUgZG9uZSBhZnRlcndhcmRzLiBJIHdvdWxkIGV2ZW4gc2F5IHBvc3QgdGhlIGZlYXR1
cmUNCj4gZnJlZXplIG9uIEZyaWRheSBiZWNhdXNlIHRoaXMgY291bGQgYmUgY29uc2lkZXJlZCBh
cyBhIGJ1ZyBmaXggKGFzc3VtaW5nDQo+IHlvdSBhZ3JlZSBhcyB0aGUgcmVsZWFzZSBtYW5hZ2Vy
IDopKS4NCg0KQWN0dWFsbHkgdGhpcyBpcyB0aGUgb25lIEkgd2FudCB0byBkaXNjdXNzIHdpdGgg
eW91LCBJIGFtIGdvb2Qgd2l0aCBjb25zaWRlcmluZw0KdGhpcyBjbGVhbi11cCBwYXRjaCBhcyBh
IGJ1ZyBmaXguDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+
IC0tDQo+IEp1bGllbiBHcmFsbA0K

