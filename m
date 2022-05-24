Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24973532449
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336206.560539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAp-0004gZ-Cf; Tue, 24 May 2022 07:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336206.560539; Tue, 24 May 2022 07:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAp-0004fI-94; Tue, 24 May 2022 07:41:47 +0000
Received: by outflank-mailman (input) for mailman id 336206;
 Tue, 24 May 2022 07:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xlLi=WA=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ntP67-0003DA-Rt
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:36:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa0c78c-db04-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 03:53:49 +0200 (CEST)
Received: from AM6PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:20b:6e::26)
 by VI1PR0802MB2382.eurprd08.prod.outlook.com (2603:10a6:800:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 01:53:45 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::fb) by AM6PR02CA0013.outlook.office365.com
 (2603:10a6:20b:6e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Tue, 24 May 2022 01:53:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 01:53:44 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 24 May 2022 01:53:44 +0000
Received: from f55584042583.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BDE99E5A-EDDC-412E-84E1-31C7A7729BCC.1; 
 Tue, 24 May 2022 01:53:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f55584042583.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 01:53:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB7168.eurprd08.prod.outlook.com (2603:10a6:20b:3de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 01:53:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d33:77de:5850:383d]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d33:77de:5850:383d%4]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 01:53:30 +0000
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
X-Inumbo-ID: 5aa0c78c-db04-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iDmA2awDW/nZqOfMJveuIetBwLN+/YzZ2XwFaNr9YQVhKAjD60JcMREvyGgzYNqFfZlwq2NZOaJjgc94W5P8S1Bameo50heRGyUhpMur0sabANZpMK6+yYxsg61wmz9mAmk7J82Ac9YybhpHo6dtz1cTPd84gaI+EaGGlUXwkZkwPLDYUqU8NNvbKwvzjXwdxTD4bBerRQXVyZ7NNQ4dJ5spO+5q0tnTqVcH+kghqs678ht1+MMaqqOo/10Zm6XrohDqnrH+JMDeendP+ZH2UrTq+kBSHUDS9nlX5xu+8H4/5mzcVcPIE+BVP2toADxETpdeAiM2neL2yBFp55VLSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbfsLqG6kt3nCXdCjZQaJuK5vul4eNOGgwf/vjiIsus=;
 b=bNKmSNQzVLhJp+Ml4TMuTAhf+n/0+0OSrGqvkBLGFn4YI0ggjs2dyvFdPUw4xCXnFPB6Wv40UWaMQyEEsxSSKS7/nd2h3s/VSJBQe9jHabU77bdp92itYTq1YqYDeGaxFBGRb+cfjirD2RyY/rigo/Qd7ZqmogKK2dc6IblpsVv5ucIr2D8Wvikd8GwyrpmAoMj2zEi4qLNrI0uCpCrUr2MLcYAPr3Wy/mELW1XTTFo5IgkIvqPXpcUvN+WCMS2gwggmc3IRgl27HGoC1PQhU5PwdOG6f9gkmuFJXEQjSbXmxRuxeJezuBOlmokWhzLPWJZVui/dQVkhl5QJQKnrCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbfsLqG6kt3nCXdCjZQaJuK5vul4eNOGgwf/vjiIsus=;
 b=IZv4ul91Eq1Ft2LpA1t79MB0P9oQkdFR0hIH6iDkiPv0p6MR+JRsqK7AvwfgnPxOfa0718cmL0Y36n4wCR3AsNJg5kHYHfFvE9GtVt8T/Djv80+WC7tKHCuqr2Lmh9NAIvrwC5TgRcnZf9gNmIY/919jCvVsLWCadviS4y9St2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keRRVUOwfAkEE51Rhz0eegPl93vhoGP9LNz4YUtKIhUiKr3TFMhQqjml7AhYbT5TZsu0ddQvzZ4tap+Ei8FeBrGL5q204tB5jY2YvEjCBEvfRJMZHKX8/kGxj6QLYmPPfyV+GfoCwkUivSJAegBG3ODjE16NRfsd3A3vqS4uhL9rLR2OqNbIpi++0XErhrQnxMO6GnKd4KM2aN44VNxdOLGbMZhDfWpa50QvlXKvNEJzdE3eUiGK7VujJ2woIRg67s/t4BrULfpGbQFRXhTnd4vNt2YLJuP3H2wJR7qDjDnfa5mb0fxM5vMiAQMJUcrI18sJATy2LGsm/RGCFCN+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbfsLqG6kt3nCXdCjZQaJuK5vul4eNOGgwf/vjiIsus=;
 b=a/6AtzCDhiBWQnb//UzwNZH9Gg0yh2q8onj7RROemlZJ+tti31mMd3CbJ9blrrOBvYLrZ+nTgFGIXo2e0+R3Sr8yNTgw1glwPwsYBNwk6E6kcobHPPcOqZhZMFXo95f6kGV36oCCdLd7XolG3EfD0kcFmcN0Nx3Ud/8msXAkC2DdUnSyBVzo201mHzCgdrgC29rwV01io2Euitw+X2SmyEPSW6ergG/+V2flAhbXp18oT5lI05A9tHB1e989Csb5uoNfEPYiYsB3vxd6f41ZUeQymK+R+NT2f2BTLyzjPrfq6TrMrdKb6KVVBr/Tx6Qk6SB/QmV4aZcY29HhDoA58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbfsLqG6kt3nCXdCjZQaJuK5vul4eNOGgwf/vjiIsus=;
 b=IZv4ul91Eq1Ft2LpA1t79MB0P9oQkdFR0hIH6iDkiPv0p6MR+JRsqK7AvwfgnPxOfa0718cmL0Y36n4wCR3AsNJg5kHYHfFvE9GtVt8T/Djv80+WC7tKHCuqr2Lmh9NAIvrwC5TgRcnZf9gNmIY/919jCvVsLWCadviS4y9St2w=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Wei Chen <Wei.Chen@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH v3 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Thread-Topic: [PATCH v3 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Thread-Index: AQHYYb3lzX/A67bY90iFDVxfuK8rvK0f3b6AgA1/p8A=
Date: Tue, 24 May 2022 01:53:30 +0000
Message-ID:
 <AS8PR08MB7991500E0D0127986F4D957B92D79@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220507025434.1063710-1-Henry.Wang@arm.com>
 <20220507025434.1063710-3-Henry.Wang@arm.com>
 <5c0e81f1-fac4-f14f-f4a1-2a00f6d16f47@xen.org>
In-Reply-To: <5c0e81f1-fac4-f14f-f4a1-2a00f6d16f47@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4A4F9E7E0330D9429564DC01FC518ECD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a86f032f-e948-4d61-2fb2-08da3d283c86
x-ms-traffictypediagnostic:
	AM9PR08MB7168:EE_|VE1EUR03FT061:EE_|VI1PR0802MB2382:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB238254CC47D00EB4582D614792D79@VI1PR0802MB2382.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 441D9BRNCR52EROnkDUQDEbctPXyAKnNzHolWJGSrlRtfQ4BzGhBeG2NBz+9ULjWKRigSZ2Pl6SMnSsWtAmljmVtphlbYkqCBD7MIe4a4if2rABc20afv7WnkngwELBz1/OYBF5zTIjncQe/BFpDrzFPIsyB42Z15CNaVwqFl/1UeIxhK8+oBlN0IS02ei5gnWb7wIMv16LRquiKQY1HRlwUh8xBWV7dEtRa6y3RZSUUx0V2TpwWdZ5H4sGx0Xvkja3wuo4kgIAoGNweo3199Hi1LyJQOSajKiEjsshOOfKsRR659T/GQrJ6bPnmHjnzDcNiYj9Cm+Mq2Ljz2h11048OnyBqGhki5F90sh//zuDo9WgkNln9efzLbMooZNHUR2RbAsA5stxmic5VMAyu1eNcvznmy5mjJyJ6vwXA2sadF26k5er5fO0n/49AdpoM8sM22qhgDuKUSaNg2YSDzvYLihBIPP2b0ZnZBUQOYZULa97WJhWky3BVISKspsWL9U9YGC21xMurkTgnzokzxgH7l5Y2Qlbb1KHJhSXmF0doWMzuKNFtq0HPEwRD50+UobhXH7a31KWSl4wtlfX9YShSLgK7A5dOdSacmQyf80xdvVcvQnJYEDCxNU20Xu4mJRHafV1lgbhNNvL6iqlbnLpT/CiGPOtN42kzci5OsF4atEGMbk/P2XFesqDpN6SdWgEhYWL/IZzR07bWTqUq1Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66946007)(66446008)(8676002)(86362001)(66556008)(66476007)(122000001)(64756008)(54906003)(7696005)(38070700005)(110136005)(71200400001)(4326008)(508600001)(316002)(186003)(8936002)(83380400001)(38100700002)(53546011)(6506007)(26005)(5660300002)(52536014)(33656002)(2906002)(55016003)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7168
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13812071-4b2a-444c-273e-08da3d2833a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ndZ0QxZvJucq5QTCD11Kt6QEBj0OubnMKhfYTUq7A3+R7BxyoQbalAGJPflaYpXNQUKDMasniBLvGmKs8BxWa85olbJZhUSXeZ0+fD0wSh5Qr7OeRcdKpEVynxT5uNvxyUr7QvKaqYXSVD9y5ilOR1o802U/bDbBs7r++QBd7tF7Kp1wvzb0/nJ1FiWbFpNiMprJTieD3o3/XqiYgfXmXf/1SNyc2yJgpT424EDV5nePBp9tEFt08P2yP7gXwuwP8fEgKFsKUjGX6eW8gcyYf1umgnJWhA4TPRcqqKq9y3XEUcbWQBKyqSWLXKZiQF4Cp3hexv1UuLspR8IW7N7FTiGPmusB/DWKJDEZAE3fyt52oFSf+IEp7wvgamojDBGd5+aK/ut4ZHeyC9g7L/Wp13TC7uTihoGafU2JRUqiW+MGOaw1i8+qKL/5SEp7jV4rkPOZubHEGl9TlhUOeV+TrEXp3z8oEeJ11rHtsrkFJwYetR1yep33Cpa0UsF40Y0ci5vbHCVt+klCjP+m6mbSYpVvOe3Yp7EFI5fiAgiFicghRF4C1QskeVp+WDw87myeMEgSYGD2z+bFqCbM8e6In73EDBVAN+XjOcCwyF11Kd/Xf3imGHIGLc6N25cIjT5JQSw0tN3H8EEgrThPnN5BfyVOwvIPweW1iqhFzvdUuGsGYRVDPutfNouJeSLUVAbH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(82310400005)(110136005)(356005)(8676002)(33656002)(86362001)(54906003)(316002)(81166007)(36860700001)(53546011)(9686003)(26005)(70206006)(70586007)(40460700003)(55016003)(6506007)(4326008)(107886003)(7696005)(508600001)(83380400001)(8936002)(5660300002)(336012)(52536014)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 01:53:44.8691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a86f032f-e948-4d61-2fb2-08da3d283c86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2382

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8yXSB4
ZW4vY29tbW9uOiBVc2UgZW5oYW5jZWQNCj4gQVNTRVJUX0FMTE9DX0NPTlRFWFQgaW4geG1hbGxv
YygpDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDA3LzA1LzIwMjIgMDM6NTQsIEhlbnJ5IFdhbmcgd3Jv
dGU6DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMNCj4gPiBpbmRleCBlODY2ZTBkODY0Li5lYTU5Y2QxYTRhIDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMNCj4gPiBAQCAtMTYyLDEzICsxNjIsNiBAQA0KPiA+ICAgc3RhdGljIGNoYXIg
X19pbml0ZGF0YSBvcHRfYmFkcGFnZVsxMDBdID0gIiI7DQo+ID4gICBzdHJpbmdfcGFyYW0oImJh
ZHBhZ2UiLCBvcHRfYmFkcGFnZSk7DQo+ID4NCj4gPiAtLyoNCj4gPiAtICogSGVhcCBhbGxvY2F0
aW9ucyBtYXkgbmVlZCBUTEIgZmx1c2hlcyB3aGljaCBtYXkgcmVxdWlyZSBJUlFzIHRvIGJlDQo+
ID4gLSAqIGVuYWJsZWQgKGV4Y2VwdCB3aGVuIG9ubHkgMSBQQ1BVIGlzIG9ubGluZSkuDQo+ID4g
LSAqLw0KPiA+IC0jZGVmaW5lIEFTU0VSVF9BTExPQ19DT05URVhUKCkgXA0KPiA+IC0gICAgQVNT
RVJUKCFpbl9pcnEoKSAmJiAobG9jYWxfaXJxX2lzX2VuYWJsZWQoKSB8fCBudW1fb25saW5lX2Nw
dXMoKSA8PQ0KPiAxKSkNCj4gPiAtDQo+IEZZSSwgdGhlIHBhdGNoIGludHJvZHVjaW5nIEFTU0VS
VF9BTExPQ19DT05URVhUKCkgaGFzIGJlZW4gcmV2ZXJ0ZWQuIEkNCj4gaW50ZW5kIHRvIHJlLWlu
dHJvZHVjZSBpdCBvbmNlIHlvdXIgcHJldmlvdXMgcGF0Y2ggYW5kIHRoZSBvbmUgZml4aW5nDQo+
IHRoZSBJVFMgKG5vdCB5ZXQgZm9ybWFsbHkgc2VudCkgaGF2ZSBiZWVuIGNvbW1pdHRlZC4NCg0K
VGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24hIElJVUMgdGhlIHBhdGNoOg0KInhlbi9hcm06IGdp
Yy12My1scGk6IEFsbG9jYXRlIHRoZSBwZW5kaW5nIHRhYmxlIHdoaWxlIHByZXBhcmluZyB0aGUg
Q1BVIg0KaXMgbWVyZ2VkLiBTbyBJIGd1ZXNzIGJvdGggInBhZ2VfYWxsb2M6IGFzc2VydCBJUlFz
IGFyZSBlbmFibGVkIGluIGhlYXAgYWxsb2MvZnJlZSINCmFuZCB0aGlzIHBhdGNoIGNhbiBiZSBy
ZS1pbnRyb2R1Y2VkIGlmIGV2ZXJ5b25lIGlzIGhhcHB5IHdpdGggdGhlIHBhdGNoPw0KDQo+IA0K
PiBJIGhhdmUgYWxzbyBjaGVja2VkIHRoYXQgbm9uZSBvZiB0aGUgQVNTRVJUcygpIHdvdWxkIGJl
IHRyaWdnZXJlZCBvbiBteQ0KPiB4ODYgc2V0dXAuIFNvOg0KPiANCj4gVGVzdGVkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgYm90aCB0ZXN0aW5n
IGFuZCBhY2tpbmcgdGhpcyBwYXRjaCENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4g
T24gYSBzaWRlIG5vdGUgKG5vIGFjdGlvbiBleHBlY3RlZCBmb3IgeW91KSwgSSBub3RpY2VkIHRo
YXQgdGhlDQo+IEFTU0VSVCgpcyB3b3VsZCBvbmx5IHRyaWdnZXIgZnJvbSBDUFUyIGFuZCBvbndh
cmRzIGF0IGxlYXN0IGZvciBBcm0uDQo+IFRoaXMgaXMgYmVjYXVzZSBudW1fb25saW5lX2NwdXMo
KSB3b3VsZCBzdGlsbCBiZSAxIHdoZW4gYnJpbmdpbmctdXAgQ1BVMS4NCj4gDQo+IEkgd2VudCB0
aHJvdWdoIHRoZSBvcmlnaW5hbCBkaXNjdXNzaW9uIGFuZCBJIGFtIG5vdCBzdXJlIHdoeSB3ZSBz
d2l0Y2hlZA0KPiBmcm9tIDwgU1lTX1NUQVRFX3NtcF9ib290IHRvIG51bV9vbmxpbmVfY3B1cygp
IChhc2lkZSB0aGF0IEFybQ0KPiBkb2Vzbid0DQo+IHNldCBpdCkuIEF5bndheSwgdGhpcyBpcyBu
b3QgYSBtYWpvciBpc3N1ZSBoZXJlIGFzIHRoaXMgaXMgYW4gQVNTRVJUKCkuDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

