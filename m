Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A9C5114D0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314817.533058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njemQ-0005Z6-0V; Wed, 27 Apr 2022 10:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314817.533058; Wed, 27 Apr 2022 10:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njemP-0005Vz-So; Wed, 27 Apr 2022 10:20:17 +0000
Received: by outflank-mailman (input) for mailman id 314817;
 Wed, 27 Apr 2022 10:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njemO-0005Vt-HX
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:20:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0d17f4d-c613-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:20:14 +0200 (CEST)
Received: from AM6PR08CA0024.eurprd08.prod.outlook.com (2603:10a6:20b:b2::36)
 by AM4PR0802MB2148.eurprd08.prod.outlook.com (2603:10a6:200:5c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 10:20:12 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::34) by AM6PR08CA0024.outlook.office365.com
 (2603:10a6:20b:b2::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 27 Apr 2022 10:20:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 10:20:12 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 27 Apr 2022 10:20:11 +0000
Received: from a2528813ef94.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 01FF046E-D387-40C5-A665-A6F69F14045B.1; 
 Wed, 27 Apr 2022 10:20:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2528813ef94.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 10:20:01 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM5PR0802MB2545.eurprd08.prod.outlook.com (2603:10a6:203:a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 10:19:58 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%9]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:19:58 +0000
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
X-Inumbo-ID: a0d17f4d-c613-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HfonyERqP8mwV+NGWFPMrW/ZlAnyRpavMMSp6lgd1l1rUJDLJ8MPcQHoI/KsOZ8Iu+vJchkx9ve9UmHSc3if4d74i8RJghqKkWVjgLNyIBHH/2vKGWweoTqg6cxeBDE8dO9/cCC0F1jMmNhtEwDBCTh1CAytUdBvMm1pWvDwFtmewoafQ+kU2/dTBH1+LweuITodCU74pdF50iIx4RYD3tE74+EwA01Tei/PfLStaGDOdBoli3nao+5x2N7aEdR6XcQ+LWb/S2jTSravbawkrT3LbEJYfImm1cIXUDihykzzFOzLmXBid69InAqtyHjq14ry1mc8cJsJkyl2969/vQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIVys0Ko2yB62h5Lv29829teqGadVMHuVqXj9DPbCpM=;
 b=Uy6yst1yAbTWGqKvwmNqfI72fwmWwH1MUDHMZgXPdCfaYoppYoMJRpC9AT8tzxZYxjRq0C3obLHPr4Rp6TCCsCfkNXctR01QIqZh2IgSsM4YAH+ySsafwi3H5Hfr8/KAvBIwlsmoO+2WJYfIigIJtzgxIn1LgaoSSlkkGmdaTYZlFi0pS4OCD86vHo8it4UoeAOaEy9qVct973N+YDwCYc6EfLeLrE/cL2+MITGVxdUeeiFQqceBeYNhRS0mActlJqtFjtNo4gKXxPR4icPagtTz2MbdqBjbAp/3dFeWBmdt4GbYsqVPy6qyhWu7OUc0A0evevVzTR1hbby3GHI8Xw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIVys0Ko2yB62h5Lv29829teqGadVMHuVqXj9DPbCpM=;
 b=B1EyIYKbCcJKjJcm7U3SKENzkDDOIctgIgK/8L2f/CL9vSc3byV66tPCdIe00lGq9XmgRu9Vx/7bwxgcVxsbeJKu6+9MI4RcGsdLoyFN4j8CNI0OJsaRpU77pFNXUXclpp5aMYLTL9FGpdooAHvmn62JfWL6Gf4wXx69iCUgfvQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMWWvYQJU7l3o4Z7ZyFZJEu5P31faqie/hzgDgqCtAs70Vll52phMu+yVScmw0ESFyuPYq6Z2SG2Sg4NMPUfisMMY7k1cJpNmB9ir/1KmyfxYtM9p+IHwPvS6E8Za5L+tpPF1KljfgLYDK3qJhATixORw8MgWonqAbisJwSczSwFRZdRd4Somj03HSe8GcWqkbFYKXgS4rSsB9Ak2eEZAScSKD1QmO2GAKKTU1Dj+zrvHOXROkbYG61BfjOo3iZStOXKUXjHgwAuXcmOdFCWGfkQ/YwnlIlojsBtTKc+2tMlJ3KxdEEcFaW83MP7+gVVHReTRQXufFsz9TpjPP/0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIVys0Ko2yB62h5Lv29829teqGadVMHuVqXj9DPbCpM=;
 b=OdmM1QOqA+lJXHj/wt7iI7NXTVf66IL9iUSDZf3gLRpTmPy22VDRUvCGqG8mLFkYkoOHUEbPn8QfdWQ90phFdgmKr8OZxtOJVjLuiLIDxhBWocOKdoYq+0mI3+HfNW4pUPE4B/hpOg9Ih1Y3ZbkOR0K636VozPwEPUN7QUbIsGRD4tMri8Qyn7n0LwQkB3ye/ToFUS+FAemzWtGFSC7O6fPD5g0Sl5ZQrvxjXoIyhBg0retUwtHzaVApdLNvDGOMJiVk3lDUHRtONhxEXRGwgIZfvxgBxtMMG2Vn/75jx9BZRjdWVmMBbSftLcXR8joJ6ThOz55ApALayhr77VTqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIVys0Ko2yB62h5Lv29829teqGadVMHuVqXj9DPbCpM=;
 b=B1EyIYKbCcJKjJcm7U3SKENzkDDOIctgIgK/8L2f/CL9vSc3byV66tPCdIe00lGq9XmgRu9Vx/7bwxgcVxsbeJKu6+9MI4RcGsdLoyFN4j8CNI0OJsaRpU77pFNXUXclpp5aMYLTL9FGpdooAHvmn62JfWL6Gf4wXx69iCUgfvQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYWhk9pvmpyYf9yk6PCG0TATWN+q0DifWAgAAAvZA=
Date: Wed, 27 Apr 2022 10:19:58 +0000
Message-ID:
 <DU2PR08MB73250D118F81DF1FF2C89DAFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-6-Penny.Zheng@arm.com>
 <95b1d82e-92fa-7468-d3aa-038f0de937d9@xen.org>
In-Reply-To: <95b1d82e-92fa-7468-d3aa-038f0de937d9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 041C02CBE2E6764894F8FB6A94070653.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bc195353-c75a-4d77-f30d-08da2837838e
x-ms-traffictypediagnostic:
	AM5PR0802MB2545:EE_|AM5EUR03FT056:EE_|AM4PR0802MB2148:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2148C7D95D70DA30ED60CE0BF7FA9@AM4PR0802MB2148.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VCXDpr1eQZkzFyo9AsHrC9cOZb6m1wzu1ElZaJBp11PeCTjTW445/ggWRYzSw8uC0R1wP+545AWSxRwPm5oafynQw3LDThxfYa3GN+7XTPKel3f/K4xd8qLX7u2mfYOeXjli9OpQM5xDPkfuA9hICUwHA2kqufOKsDhRVDNKh2JhJtueSe50HZnX1ssUplnd/9CQcZF903aK4uJvgcllZ8DouqHR0BlOJEYRQMAQ2w4b0sZmE0207DbkkEz2J6F4wo0qXC0rXIjL7fhyDkKz8Fn2zvVFR0dylRaI+2t4sJQfWkwkIrHClTjgBUHrS7tAHWOEQR7fl1lm4qrdtt9vXjnycng5t7QJGkvpXpMyaZwPEC9Ue3h8nGXaGp62FKkrtum/DgYEHNoAJy9x7BQ/uBlWEsVWj5QSnBaBWJHgSjBZDKf3LmdYfVHZfEMjEnK4pFDJNzBF9ohBng9H3XBKiDuk1AUQ1TOZ+GwYURGOx8yLFTsirt2X3yy6RNuuX/MVdePQJkTWe9GPCkJtPpNdOm0x4g0GcedhFCWDtwx3Ysud8QjzNJeHA0vqYmhh+tJEivD9u/+AMvTQcS+gUtL2WIi7uhrnsVVff8dJ7xWavnQzTL+di6WX4NAVvPpUnIOJnbYyUC7FQXbxr0Mq0pUOrbQ+I2zmOnjRPiShf2TzrPy31jNLxKnVe4rY4QCT4689DOUshNYWXQaLf2mRQTP1mQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(26005)(508600001)(83380400001)(33656002)(38070700005)(76116006)(55016003)(66476007)(54906003)(122000001)(86362001)(316002)(9686003)(64756008)(8676002)(4326008)(66556008)(66946007)(66446008)(53546011)(110136005)(38100700002)(7696005)(5660300002)(52536014)(186003)(8936002)(2906002)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2545
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebc437c3-2714-4cf9-4a06-08da28377b72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ZUtYyKrTfoEyHpz2F3bMSlJryFZRXxJ8yKW85v3v5TT/1YVGj3qPJOqybr4d7ZiRN1jmvvNhUz5aAu6BgFLTrKe2IpKZjbM/4cebt3EhEzEaWfqLk3XjkLYiMSZf6cDsSrlKvjuosnZc3jWkEHnH9doZwjgqqsAZYpwiy8aFFgmgUcx9UvksyWU776NrJxDuAXICzQQOgVDAtoZmHLqOL0YZqRyAMvA9zvl7v1ycmJrAdR4bn8VeRRhrTBPitOuwj03NhwG5pIkQQwOtyokNN+8/dp2bG0zL9dkt35UHNsyS3HPxP6/EGYDYB2WLhxyx8BN74qriIi0XmSLADSWs9d1ZBdQ0e2Kg1ZYg44DmOGd+/ueVu3e8nrArPFSWsDur0Ejbb17jtMRTBIdLet11fJwzok/B5EjXdXSjvw7+uI5PvDjDL+70V+tw3bvNLOYyBVuC1lLl7rNum/v7LCcGmViqxE4gUgJhC4vdgITc3zUVngNfZmq+/oGqitJJC79zfI8SG+GOtPANeyrFii9mMxNdlJ7AITIKFD06+T5EYJezxUuWFovapx0Yb7RsbEN0CpgLQCifA9OI5Za8SlQB41x7VydIU1SM59hj+t0TUBsWeTkTb7jUkpqG20zmU2A2fIi3d4VlQ4s1TZqVlZHOCPJtXV/wSZvX5N/q813TySTB38S8xgseTculb59wVCn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(110136005)(81166007)(356005)(316002)(40460700003)(70586007)(54906003)(55016003)(508600001)(7696005)(86362001)(83380400001)(186003)(53546011)(6506007)(5660300002)(36860700001)(82310400005)(33656002)(52536014)(2906002)(26005)(9686003)(8676002)(47076005)(336012)(4326008)(70206006)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:20:12.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc195353-c75a-4d77-f30d-08da2837838e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2148

SGkganVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyNywgMjAy
MiA2OjExIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5j
b20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+Ow0KPiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsNCj4gSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyA1LzZdIHhlbi9hcm06IHVucG9wdWxhdGUgbWVtb3J5IHdoZW4gZG9tYWlu
IGlzDQo+IHN0YXRpYw0KPiANCj4gSGkgUGVubnksDQo+IA0KPiBPbiAyNy8wNC8yMDIyIDEwOjI3
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBUb2RheSB3aGVuIGEgZG9tYWluIHVucG9wdWxhdGVz
IHRoZSBtZW1vcnkgb24gcnVudGltZSwgdGhleSB3aWxsDQo+ID4gYWx3YXlzIGhhbmQgdGhlIG1l
bW9yeSBiYWNrIHRvIHRoZSBoZWFwIGFsbG9jYXRvci4gQW5kIGl0IHdpbGwgYmUgYQ0KPiA+IHBy
b2JsZW0gaWYgZG9tYWluIGlzIHN0YXRpYy4NCj4gPg0KPiA+IFBhZ2VzIGFzIGd1ZXN0IFJBTSBm
b3Igc3RhdGljIGRvbWFpbiBzaGFsbCBiZSByZXNlcnZlZCB0byBvbmx5IHRoaXMNCj4gPiBkb21h
aW4gYW5kIG5vdCBiZSB1c2VkIGZvciBhbnkgb3RoZXIgcHVycG9zZXMsIHNvIHRoZXkgc2hhbGwg
bmV2ZXIgZ28NCj4gPiBiYWNrIHRvIGhlYXAgYWxsb2NhdG9yLg0KPiA+DQo+ID4gVGhpcyBjb21t
aXQgcHV0cyByZXNlcnZlZCBwYWdlcyBvbiB0aGUgbmV3IGxpc3QgcmVzdl9wYWdlX2xpc3Qgb25s
eQ0KPiA+IGFmdGVyIGhhdmluZyB0YWtlbiB0aGVtIG9mZiB0aGUgIm5vcm1hbCIgbGlzdCwgd2hl
biB0aGUgbGFzdCByZWYgZHJvcHBlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpo
ZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+IHYzIGNoYW5nZXM6DQo+ID4g
LSBoYXZlIHBhZ2VfbGlzdF9kZWwoKSBqdXN0IG9uY2Ugb3V0IG9mIHRoZSBpZigpDQo+ID4gLSBy
ZW1vdmUgcmVzdl9wYWdlcyBjb3VudGVyDQo+ID4gLSBtYWtlIGFyY2hfZnJlZV9oZWFwX3BhZ2Ug
YmUgYW4gZXhwcmVzc2lvbiwgbm90IGEgY29tcG91bmQgc3RhdGVtZW50Lg0KPiA+IC0tLQ0KPiA+
IHYyIGNoYW5nZXM6DQo+ID4gLSBwdXQgcmVzZXJ2ZWQgcGFnZXMgb24gcmVzdl9wYWdlX2xpc3Qg
YWZ0ZXIgaGF2aW5nIHRha2VuIHRoZW0gb2ZmIHRoZQ0KPiA+ICJub3JtYWwiIGxpc3QNCj4gPiAt
LS0NCj4gPiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oIHwgMTIgKysrKysrKysrKysr
DQo+ID4gICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICB8ICA0ICsrKysNCj4gPiAgIHhl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgIHwgIDMgKysrDQo+ID4gICAzIGZpbGVzIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vbW0uaA0KPiA+IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmggaW5k
ZXggNDI0YWFmMjgyMy4uYzY0MjZjMTcwNSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vbW0uaA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5o
DQo+ID4gQEAgLTM1OCw2ICszNTgsMTggQEAgdm9pZCBjbGVhcl9hbmRfY2xlYW5fcGFnZShzdHJ1
Y3QgcGFnZV9pbmZvDQo+ID4gKnBhZ2UpOw0KPiA+DQo+ID4gICB1bnNpZ25lZCBpbnQgYXJjaF9n
ZXRfZG1hX2JpdHNpemUodm9pZCk7DQo+ID4NCj4gPiArLyoNCj4gPiArICogUHV0IGZyZWUgcGFn
ZXMgb24gdGhlIHJlc3YgcGFnZSBsaXN0IGFmdGVyIGhhdmluZyB0YWtlbiB0aGVtDQo+ID4gKyAq
IG9mZiB0aGUgIm5vcm1hbCIgcGFnZSBsaXN0LCB3aGVuIHBhZ2VzIGZyb20gc3RhdGljIG1lbW9y
eSAgKi8NCj4gPiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gKyNkZWZpbmUgYXJj
aF9mcmVlX2hlYXBfcGFnZShkLCBwZykgKHsgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAg
cGFnZV9saXN0X2RlbChwZywgcGFnZV90b19saXN0KGQsIHBnKSk7ICAgICAgICAgICAgIFwNCj4g
PiArICAgIGlmICggKHBnKS0+Y291bnRfaW5mbyAmIFBHQ19yZXNlcnZlZCApICAgICAgICAgICAg
ICBcDQo+ID4gKyAgICAgICAgcGFnZV9saXN0X2FkZF90YWlsKHBnLCAmKGQpLT5yZXN2X3BhZ2Vf
bGlzdCk7ICAgXA0KPiA+ICt9KQ0KPiA+ICsjZW5kaWYNCj4gDQo+IEkgYW0gYSBiaXQgcHV6emxl
ZCBob3cgdGhpcyBpcyBtZWFudCB0byB3b3JrLg0KPiANCj4gTG9va2luZyBhdCB0aGUgY29kZSwg
YXJjaF9mcmVlX2hlYXBfcGFnZSgpIHdpbGwgYmUgY2FsbGVkIGZyb20NCj4gZnJlZV9kb21oZWFw
X3BhZ2VzKCkuIElmIEkgYW0gbm90IG1pc3Rha2VuLCByZXNlcnZlZCBwYWdlcyBhcmUgbm90DQo+
IGNvbnNpZGVyZWQgYXMgeGVuIGhlYXAgcGFnZXMsIHNvIHdlIHdvdWxkIGdvIGluIHRoZSBlbHNl
IHdoaWNoIHdpbGwgZW5kIHVwIHRvDQo+IGNhbGwgZnJlZV9oZWFwX3BhZ2VzKCkuDQo+IA0KPiBm
cmVlX2hlYXBfcGFnZXMoKSB3aWxsIGVuZCB1cCB0byBhZGQgdGhlIHBhZ2UgaW4gdGhlIGhlYXAg
YWxsb2NhdG9yIGFuZA0KPiBjb3JydXB0IHRoZSBkLT5yZXN2X3BhZ2VfbGlzdCBiZWNhdXNlIHRo
ZXJlIGFyZSBvbmx5IG9uZSBsaW5rIGxpc3QuDQo+IA0KPiBXaGF0IGRpZCBJIG1pc3M/DQo+IA0K
DQpJbiBteSBmaXJzdCBjb21taXQgImRvIG5vdCBmcmVlIHJlc2VydmVkIG1lbW9yeSBpbnRvIGhl
YXAiLCBJJ3ZlIGNoYW5nZWQgdGhlIGJlaGF2aW9yDQpmb3IgcmVzZXJ2ZWQgcGFnZXMgaW4gZnJl
ZV9oZWFwX3BhZ2VzKCkNCisgICAgaWYgKCBwZy0+Y291bnRfaW5mbyAmIFBHQ19yZXNlcnZlZCAp
DQorICAgICAgICAvKiBSZXNlcnZlZCBwYWdlIHNoYWxsIG5vdCBnbyBiYWNrIHRvIHRoZSBoZWFw
LiAqLw0KKyAgICAgICAgcmV0dXJuIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHBnLCAxVUwgPDwgb3Jk
ZXIsIG5lZWRfc2NydWIpOw0KKw0KDQo+IENoZWVycywNCj4NCj4gLS0NCj4gSnVsaWVuIEdyYWxs
DQoNCkNoZWVycywNCg0KLS0NClBlbm55IFpoZW5nDQo=

