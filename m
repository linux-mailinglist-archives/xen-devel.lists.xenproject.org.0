Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6642510FAE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 05:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314314.532318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYjZ-000630-4J; Wed, 27 Apr 2022 03:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314314.532318; Wed, 27 Apr 2022 03:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYjZ-000613-0x; Wed, 27 Apr 2022 03:52:57 +0000
Received: by outflank-mailman (input) for mailman id 314314;
 Wed, 27 Apr 2022 03:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q6ah=VF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njYjX-00060h-Gp
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 03:52:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83f55933-c5dd-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 05:52:53 +0200 (CEST)
Received: from AS8PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:20b:311::30)
 by VI1PR08MB4029.eurprd08.prod.outlook.com (2603:10a6:803:ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 03:52:38 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::ca) by AS8PR05CA0025.outlook.office365.com
 (2603:10a6:20b:311::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Wed, 27 Apr 2022 03:52:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 03:52:37 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 27 Apr 2022 03:52:36 +0000
Received: from d2d29c3c7d81.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F596CB6B-64C9-4AE7-880C-66FEB5A79F13.1; 
 Wed, 27 Apr 2022 03:52:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2d29c3c7d81.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 03:52:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 03:52:29 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 03:52:28 +0000
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
X-Inumbo-ID: 83f55933-c5dd-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=l3+dSZTCEJMFXhRnWKoWaU5jqCF7ovPFpWfhQB5ByorNTVUVSUl9XWhaJct48mOQpLfidI+rdfRzFDf8ZEwCQ55F0XQq8frgnwnwrz4Y8hVcfJSYmHpioPukiZkUU/qIO54OQeFruvZicQIhJye1XzAi7lR+RMNfmzDWd5vAxjHEdkOGb02keELB6D7uu/r3XJxo/vbQ78TNpglVxURyRs1sGb3zsmVPIwPA4I5WMBswsuLXnDCoiCvVcv39fCXiYi++f9JhYenp20kRnh+oV57eKxNB1D1IVPoZ/hSVr38lxQb61JUT7sTL3vGe3irnP5eZ9ajq1gwyUD9pOdSglA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pceHUH/SelruKIeUg8IoL4G9TiVeeobEpOyMvTiaeKI=;
 b=D+l26pi0o8P6EjJ0FzSCuIxXUHkoAqSV4H7VwKlIEpshfZRYoRoUxHfK0nX/pxwLc9ryNSJgx66XKTCqRct2NktIq7eAA32Ps948rXRaaBk7jh1b+m9bwsVE7ocE/b+89QZY/ApOjULXUfA7rjft+22EKyri9pVeV4/pFgC4lZpWw4A4Z8wURzSL9/OLeEe/Riyy7HDwq5unTcMaC8GGw2FjppnX906DAGS66Oh8p7vZdOOys4k/5AwtbdrAfz6G4S9ClF7Mu27aoAK6gnddh1EeXYAIbDe6JhqFxPTb2O4fcHRT9twAZw/zSMwPnWSFzb35Ov5eFF3UMNDxasXH/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pceHUH/SelruKIeUg8IoL4G9TiVeeobEpOyMvTiaeKI=;
 b=wW1Vs0Wc+gPzarZSvZSca+BFti5AVvgOCU4Fe9kL4MW3ajp8xvxzEClb0lWjC4adO3Os91G/sRWEwRB2VPOBQ3p5Bz4PbYWJuBy35OAGRFb2EAiIvWtw566FiNBa0gA7iFAhfXWk4uWt020zOMqKM9moj/3WZLOEAfpoQQGw1BE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9G2ozMMY/qOJN4nR/0x5iqUx5SZCLbRgXHJdyC9S+alojjw29XaSjyIlmi5pufKxTaRImVuH9MF6j2eFOZxwFscdO20cXSB22+Kq9TlzRxcXmTvciSerdXcNVBNL3p4CpFsmF8b2Gp/XJBGcmrGb7Q8AskZnI0UrlOUcQWXvIZDB1g3UDg31/ssL1seG0luuIG1drfKTZ00uQij5NGGt1g/e2KMFL+NKFAM2FvWNfms5o84vP0XiB13IQO3fPN9l8m9Gzbb/rydbZ4mDkfyN9KIXpXaw69PrhXqadXGO/HT9jfKjvsJ7INNa/BDptTfmjjny0ytrgrrzRjYdfBD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pceHUH/SelruKIeUg8IoL4G9TiVeeobEpOyMvTiaeKI=;
 b=LdlFuJTC0NgrkCO30UJG3okc/OtU8jb59tlkaAeIIROI0EAJtmjc7lwuMaRZHFn4TK4NmNIIn5aBIK7iwzJ5QCkLeHj6GYvwTukNIz1Dn9l2YbJLRpq7Xy4eg0CKWiGKFbaVPQ8Pq9DM4S9Zre7xsmE4v85iLOyNDEzZchWOYGIDT1yEXyUxTq+2L+X1m5s/TH3hA95vZzB6imse3lKQU2pEaxacohU/VKC41+i1geseO07H9QicNIAkyuXSZTthwfxmLJMePsk63WDkP+fbBe77lzpzRdmvgY60wrRaEi1lCPiNTnaGmQZ52Mp0NWyqvEAic5xJWXegjmgepdMmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pceHUH/SelruKIeUg8IoL4G9TiVeeobEpOyMvTiaeKI=;
 b=wW1Vs0Wc+gPzarZSvZSca+BFti5AVvgOCU4Fe9kL4MW3ajp8xvxzEClb0lWjC4adO3Os91G/sRWEwRB2VPOBQ3p5Bz4PbYWJuBy35OAGRFb2EAiIvWtw566FiNBa0gA7iFAhfXWk4uWt020zOMqKM9moj/3WZLOEAfpoQQGw1BE=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
Thread-Topic: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
Thread-Index: AQHYUwP8rcNxDcW2QEyqIlyEGMAP4q0B8r0AgAAgsICAAD42gIAAz9Gg
Date: Wed, 27 Apr 2022 03:52:28 +0000
Message-ID:
 <PAXPR08MB74209F0F6F0B189FA10D04FA9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-6-wei.chen@arm.com>
 <6d666aa4-c0d3-b8ed-9fca-e9d2179564d3@suse.com>
 <7d7fc887-20a3-49c3-0754-3bca3442ccce@arm.com>
 <79e3fc8d-7064-e981-b90c-d0f7fa0aafae@suse.com>
In-Reply-To: <79e3fc8d-7064-e981-b90c-d0f7fa0aafae@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 673D8F9C32B4A74A9D7988E1CF6ED389.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: acc88254-3c2b-42eb-531e-08da28015ea0
x-ms-traffictypediagnostic:
	AM0PR08MB5505:EE_|AM5EUR03FT044:EE_|VI1PR08MB4029:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB402937E99949B3207463E3739EFA9@VI1PR08MB4029.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dLIxk3NkT0958x1petdcsd39ww/2wQg09RivLEK8d0d3Y+2MznmPXG/CGOHbM6rhxi14OfJJQAKkKoBKZmFeB04mFvQbLeRZGkVSjxdNICJSFzezZINXh212YseaKWp2BJmgy6kE6Jnip+eb3ANbcTbzz6jXPlmAatD33OtwAQcYd/Gc1qfxoZI6SRt4nvyE2i9FHju0mSXS983WObKptbiGZdtt5+X1QRnXk/xv5q3klv/PnshDQo7DPHgQjCzRd0Ms3qyvx0MXtaS3FwXC1jnS+bZUB+jl71H2GxLFTmkihGkbm+xGXTjlpd7zZj3SRtf2XCfInADmJRbuRppZOVo8JkvQ9FDZd2LwxzcxOyKYDuqC+adRcNUgCA5JCYACaubO2ztsSJnfawzR8W+tFRIuvd3uLBu4vj17v0EphsyZyL/4/h+/jVwNft/izfFO4DlpszMUKCe3t4yGUxC3Zn3oMoXblDu6sNUHUIGLPFk6cFl2gY2VEz2yxrImB7myu8bcjYAwholXCD/UL+Dn+wwoseckhERAh+Uiyg7+Ca7JOuEggvd3ad912i9cF/ZYGOOSyHUMKTfvssHV+zGncF5IxJPNrFtj2Gs+ZBqhcOpSFsbZs7lA4OEfG1pbYx36nI44WbCA68Nes2UR4MPjw3rrCUgZb7mPBUe/7oufdu8CBuTjsub7WJ46z5WrZ+t79GCV3v6q9zMaAiKe2RSHYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(26005)(66946007)(76116006)(33656002)(8936002)(6506007)(66446008)(71200400001)(66556008)(54906003)(52536014)(316002)(6916009)(7696005)(66476007)(508600001)(4326008)(122000001)(64756008)(8676002)(5660300002)(2906002)(38070700005)(186003)(55016003)(38100700002)(83380400001)(53546011)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a66e5c3-43c9-4b1c-7a32-08da28015977
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JqcvEDgwDN7BcBI7htUEOtdawBkMD4/t/8j46twPJuswh27ge0BKlK6MtMqlkvje3xF1xGoGESdk7d4yTq6q2oU89w03Rse4nm9UKa7vuTpt+0xa7bcf/Re2ecwgD8QHj+EpBXHvugg6TVzLmCPNecMmStkF5Vuaw4hfp7Je2A+usA0Ytw1t7UJbLtfGcWVh1zGYwVT+awESGVlfbMFuJNO3H7TIKC4mSUyTZwFQHcBxl90qZ4Z9kQ2lIUvfYgsWJZmnCIxLfTJ6Z+2Ppb4kF7LEiIiulTm2SfLxrzw42STGIDHuNmF5OMfLjQcti1sRmbx42yYqRK+YjJkAEi/DiLsGS26P2wDnQ5F9S6NEHmJoLt+jrpSlxFcRD4gJyqKrLzc6GBeTcT068RQCia8f8RS4vkeVACjHgPSNt5vVw596RdjQyLL5M6mU5JdD91X1hhBHFpL3jHAt9ydA2JIqVEkdZlqqF0ZbPhxA7I57ZtHOKyS7LC1qteGuQoZUNc0iyhy6b1Lk+kUZK19Yp71SfjxOm1UdbZzpBX0ORRzUEeAMR3QzTOHvjW46c0Pnrbeuiu2sR8X5EOttvw5yY/JY7LqGNIm32UWINtRz7pZJ8MueC8POR3s8ZhkYF3HO1FRo620g/SkMeNVrecSZGhKN2mM7KRpB4rz7MAa7qV/BrXSX8ftmrM7IetYFjKqz34wc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(70586007)(70206006)(54906003)(81166007)(356005)(53546011)(9686003)(82310400005)(33656002)(86362001)(36860700001)(7696005)(6862004)(8676002)(4326008)(6506007)(26005)(47076005)(508600001)(186003)(8936002)(40460700003)(55016003)(5660300002)(83380400001)(336012)(316002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 03:52:37.3208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acc88254-3c2b-42eb-531e-08da28015ea0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4029

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDTmnIgyNuaXpSAyMjo0Mg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMDUvMTBdIHhlbi94ODY6IFVzZSBBU1NFUlQgaW5zdGVhZCBvZg0KPiBWSVJUVUFMX0JV
R19PTiBmb3IgcGh5c190b19uaWQNCj4gDQo+IE9uIDI2LjA0LjIwMjIgMTI6NTksIFdlaSBDaGVu
IHdyb3RlOg0KPiA+IE9uIDIwMjIvNC8yNiAxNzowMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+
IE9uIDE4LjA0LjIwMjIgMTE6MDcsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gVklSVFVBTF9CVUdf
T04gaXMgYW4gZW1wdHkgbWFjcm8gdXNlZCBpbiBwaHlzX3RvX25pZC4gVGhpcw0KPiA+Pj4gcmVz
dWx0cyBpbiB0d28gbGluZXMgb2YgZXJyb3ItY2hlY2tpbmcgY29kZSBpbiBwaHlzX3RvX25pZA0K
PiA+Pj4gdGhhdCBpcyBub3QgYWN0dWFsbHkgd29ya2luZyBhbmQgY2F1c2luZyB0d28gY29tcGls
YXRpb24NCj4gPj4+IGVycm9yczoNCj4gPj4+IDEuIGVycm9yOiAiTUFYX05VTU5PREVTIiB1bmRl
Y2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikuDQo+ID4+PiAgICAgVGhpcyBpcyBi
ZWNhdXNlIGluIHRoZSBjb21tb24gaGVhZGVyIGZpbGUsICJNQVhfTlVNTk9ERVMiIGlzDQo+ID4+
PiAgICAgZGVmaW5lZCBhZnRlciB0aGUgY29tbW9uIGhlYWRlciBmaWxlIGluY2x1ZGVzIHRoZSBB
UkNIIGhlYWRlcg0KPiA+Pj4gICAgIGZpbGUsIHdoZXJlIHBoeXNfdG9fbmlkIGhhcyBhdHRlbXB0
ZWQgdG8gdXNlICJNQVhfTlVNTk9ERVMiLg0KPiA+Pj4gICAgIFRoaXMgZXJyb3Igd2FzIHJlc29s
dmVkIHdoZW4gd2UgbW92ZWQgdGhlIGRlZmluaXRpb24gb2YNCj4gPj4+ICAgICAiTUFYX05VTU5P
REVTIiB0byB4ODYgQVJDSCBoZWFkZXIgZmlsZS4gQW5kIHdlIHJlc2VydmUgdGhlDQo+ID4+PiAg
ICAgIk1BWF9OVU1OT0RFUyIgZGVmaW5pdGlvbiBpbiBjb21tb24gaGVhZGVyIGZpbGUgdGhyb3Vn
aCBhDQo+ID4+PiAgICAgY29uZGl0aW9uYWwgY29tcGlsYXRpb24gZm9yIHNvbWUgYXJjaGl0ZWN0
dXJlcyB0aGF0IGRvbid0DQo+ID4+PiAgICAgbmVlZCB0byBkZWZpbmUgIk1BWF9OVU1OT0RFUyIg
aW4gdGhlaXIgQVJDSCBoZWFkZXIgZmlsZXMuDQo+ID4+DQo+ID4+IE5vLCB0aGF0J3Mgc2V0dGlu
ZyB1cCBhIHRyYXAgZm9yIHNvbWVvbmUgZWxzZSB0byBmYWxsIGludG8sIGVzcGVjaWFsbHkNCj4g
Pj4gd2l0aCB0aGUgI2lmZGVmIGFyb3VuZCB0aGUgb3JpZ2luYWwgZGVmaW5pdGlvbi4gQWZhaWN0
IGFsbCB5b3UgbmVlZCB0bw0KPiA+PiBkbyBpcyB0byBtb3ZlIHRoYXQgI2RlZmluZSBhaGVhZCBv
ZiB0aGUgI2luY2x1ZGUgaW4geGVuL251bWEuaC4gVW5saWtlDQo+ID4+IGZ1bmN0aW9ucywgI2Rl
ZmluZS1zIGNhbiByZWZlcmVuY2Ugbm90LXlldC1kZWZpbmVkIGlkZW50aWZpZXJzLg0KPiA+Pg0K
PiA+DQo+ID4gSSBoYWQgdHJpZWQgaXQgYmVmb3JlLiBNQVhfTlVNTk9ERVMgZGVwZW5kcyBvbiBO
T0RFX1NISUZULiBCdXQNCj4gPiBOT0RFX1NISUZUIGRlcGVuZHMgb24gdGhlIGRlZmluaXRpb24g
c3RhdHVzIGluIGFzbS9udW1hLmguIElmIEkgbW92ZQ0KPiA+IE1BWF9OVU1OT0RFUyB0byBiZWZv
cmUgYXNtL251bWEuaCwgdGhlbiBJIGhhdmUgdG8gbW92ZSBOT0RFU19TSElGVCBhcw0KPiA+IHdl
bGwuIEJ1dCB0aGlzIHdpbGwgYnJlYWsgdGhlIG9yaWdpbmFsIGRlc2lnbi4gTk9ERVNfU0hJRlQg
aW4geGVuL251bWEuaA0KPiA+IHdpbGwgYWx3YXlzIGJlIGRlZmluZWQgYmVmb3JlIGFzbS9udW1h
LmguIFRoaXMgd2lsbCBiZSBhIGR1cGxpY2F0ZWQNCj4gPiBkZWZpbml0aW9uIGVycm9yLg0KPiAN
Cj4gSSdtIGFmcmFpZCBJIGRvbid0IGZvbGxvdy4gTUFYX05VTU5PREVTIGRlcGVuZHMgb24gTk9E
RVNfU0hJRlQgb25seSBhcw0KPiBzb29uIGFzIHNvbWUgY29kZSBhY3R1YWxseSB1c2VzIE1BWF9O
VU1OT0RFUy4gSXQgZG9lcyBub3QgcmVxdWlyZQ0KPiBOT0RFU19TSElGVCB0byBiZSBkZWZpbmVk
IHVwIGZyb250LiBPZiBjb3Vyc2Ugd2l0aCB0aGUgY3VycmVudCBsYXlvdXQNCj4gKHBoeXNfdG9f
bmlkKCkgbGl2aW5nIGluIGFuIGlubGluZSBmdW5jdGlvbiBpbiBhc20vbnVtYS5oKSB0aGluZ3Mg
d29uJ3QNCj4gYnVpbGQuIEJ1dCB3YXNuJ3QgdGhlIHBsYW4gdG8gbW92ZSBwaHlzX3RvX25pZCgp
IHRvIHhlbi9udW1hLmggYXMgd2VsbD8NCj4NCg0KWWVzLCBJIHdpbGwgZHJvcCB0aGlzIHBhdGNo
IGZyb20gcGFydCMxLCBhbmQgbW92ZSBpdCB0byBwYXJ0IzIuIFRoaXMNCnBhdGNoIHdpbGwgZm9s
bG93IHdoZW4gd2UgbW92ZSBwaHlzX3RvX25pZCgpIHRvIHhlbi9udW1hLmguDQoNClRoYW5rcywN
CldlaSBDaGVuDQoNCj4gT3RoZXJ3aXNlIEknZCByZWNvbW1lbmQgdG8gaW50cm9kdWNlIGEgbmV3
IGhlYWRlciwgc2F5IG51bWEtZGVmcy5oLA0KPiBob2xkaW5nIChmb3Igbm93KSBqdXN0IE5PREVT
X1NISUZULiBUaGVuIHlvdSdkIGluY2x1ZGUgYXNtL251bWEtZGVmcy5oDQo+IGZpcnN0IGFuZCBh
c20vbnVtYS5oIG9ubHkgYWZ0ZXIgaGF2aW5nIGRlZmluZWQgTUFYX05VTU5PREVTLiBCdXQNCj4g
c3BsaXR0aW5nIHRoZSBoZWFkZXIgc2hvdWxkIG9ubHkgYmUgYSBsYXN0IHJlc29ydCBpZiB0aGlu
Z3MgY2FuJ3QgYmUNCj4gbWFkZSB3b3JrIGFub3RoZXIgd2F5Lg0KPiANCj4gPiBIb3cgYWJvdXQg
SSBtb3ZlIE1BWF9OVU1OT0RFUyB0byBhcm0gYW5kIHg4NiBhc20vbnVtYS5oIGluIHRoaXMgcGF0
Y2gNCj4gPiBhdCB0aGUgc2FtZSB0aW1lPyBCZWNhdXNlIGluIG9uZSBvZiBmb2xsb3dpbmcgcGF0
Y2hlcywgTUFYX05VTU5PREVTIGFuZA0KPiA+IHBoeXNfdG9fbmlkIHdpbGwgYmUgbW92ZWQgdG8g
eGVuL251bWEuaCBhdCB0aGUgc2FtZSB0aW1lPw0KPiA+DQo+ID4+PiAyLiBlcnJvcjogd3Jvbmcg
dHlwZSBhcmd1bWVudCB0byB1bmFyeSBleGNsYW1hdGlvbiBtYXJrLg0KPiA+Pj4gICAgIFRoaXMg
aXMgYmVjYXVzZSwgdGhlIGVycm9yLWNoZWNraW5nIGNvZGUgY29udGFpbnMgIW5vZGVfZGF0YVtu
aWRdLg0KPiA+Pj4gICAgIEJ1dCBub2RlX2RhdGEgaXMgYSBkYXRhIHN0cnVjdHVyZSB2YXJpYWJs
ZSwgaXQncyBub3QgYSBwb2ludGVyLg0KPiA+Pj4NCj4gPj4+IFNvLCBpbiB0aGlzIHBhdGNoLCB3
ZSB1c2UgQVNTRVJUIGluc3RlYWQgb2YgVklSVFVBTF9CVUdfT04gdG8NCj4gPj4+IGVuYWJsZSB0
aGUgdHdvIGxpbmVzIG9mIGVycm9yLWNoZWNraW5nIGNvZGUuIEFuZCBmaXggdGhlIGxlZnQNCj4g
Pj4+IGNvbXBpbGF0aW9uIGVycm9ycyBieSByZXBsYWNpbmcgIW5vZGVfZGF0YVtuaWRdIHRvDQo+
ID4+PiAhbm9kZV9kYXRhW25pZF0ubm9kZV9zcGFubmVkX3BhZ2VzLg0KPiA+Pj4NCj4gPj4+IEJl
Y2F1c2Ugd2hlbiBub2RlX3NwYW5uZWRfcGFnZXMgaXMgMCwgdGhpcyBub2RlIGhhcyBubyBtZW1v
cnksDQo+ID4+PiBudW1hX3NjYW5fbm9kZSB3aWxsIHByaW50IHdhcm5pbmcgbWVzc2FnZSBmb3Ig
c3VjaCBraW5kIG9mIG5vZGVzOg0KPiA+Pj4gIkZpcm13YXJlIEJ1ZyBvciBtaXMtY29uZmlndXJl
ZCBoYXJkd2FyZT8iLg0KPiA+Pg0KPiA+PiBUaGlzIHdhcm5pbmcgaXMgYm9ndXMgLSBub2RlcyBj
YW4gaGF2ZSBvbmx5IHByb2Nlc3NvcnMuIFRoZXJlZm9yZSBJJ2QNCj4gPj4gbGlrZSB0byBhc2sg
dGhhdCB5b3UgZG9uJ3QgdXNlIGl0IGZvciBqdXN0aWZpY2F0aW9uLiBBbmQgaW5kZWVkIHlvdQ0K
PiA+DQo+ID4gWWVzLCB5b3UncmUgcmlnaHQsIG5vZGUgY2FuIG9ubHkgaGFzIENQVXMhIEkgd2ls
bCByZW1vdmUgaXQuDQo+ID4NCj4gPj4gZG9uJ3QgbmVlZCB0bzogcGh5c190b19uaWQoKSBpcyBh
Ym91dCB0cmFuc2xhdGluZyBhbiBhZGRyZXNzLiBUaGUNCj4gPj4gaW5wdXQgYWRkcmVzcyBjYW4n
dCBiZSB2YWxpZCBpZiBpdCBtYXBzIHRvIGEgbm9kZSB3aXRoIG5vIG1lbW9yeS4NCj4gPj4NCj4g
Pg0KPiA+IENhbiBJIHVuZGVyc3RhbmQgeW91ciBjb21tZW50Og0KPiA+IEFueSBpbnB1dCBhZGRy
ZXNzIGlzIGludmFsaWQsIHdoZW4gbm9kZV9zcGFubmVkX3BhZ2VzIGlzIHplcm8sIGJlY2F1c2UN
Cj4gPiB0aGlzIG5vZGUgaGFzIG5vIG1lbW9yeT8NCj4gDQo+IEl0J3MgZ2V0dGluZyBjbG9zZSwg
YnV0IGl0J3Mgbm90IGV4YWN0bHkgZXF1aXZhbGVudCBJIHRoaW5rLiBBIG5vZGUNCj4gd2l0aCAw
IGJ5dGVzIG9mIG1lbW9yeSBtaWdodCAoYXQgbGVhc3QgaW4gdGhlb3J5KSBoYXZlIGFuIGVudHJ5
IGluDQo+IG1lbW5vZGVtYXBbXS4gQnV0IGZpbmRpbmcgYSBub2RlIElEIGZvciB0aGF0IGFkZHJl
c3Mgd291bGQgc3RpbGwNCg0KSSBoYXZlIGRvbmUgYSBxdWljayBjaGVjayBpbiBwb3B1bGF0ZV9t
ZW1ub2RlbWFwOg0KNzQgICAgICAgICAgc3BkeCA9IHBhZGRyX3RvX3BkeChub2Rlc1tpXS5zdGFy
dCk7DQo3NSAgICAgICAgICBlcGR4ID0gcGFkZHJfdG9fcGR4KG5vZGVzW2ldLmVuZCAtIDEpICsg
MTsNCjc2ICAgICAgICAgIGlmICggc3BkeCA+PSBlcGR4ICkNCjc3ICAgICAgICAgICAgICBjb250
aW51ZTsNCg0KSXQgc2VlbXMgdGhhdCBpZiBub2RlIGhhcyBubyBtZW1vcnksIHN0YXJ0ID09IGVu
ZCwgdGhlbiB0aGlzIGZ1bmN0aW9uDQp3aWxsIG5vdCBwb3B1bGF0ZSBtZW1ub2RlbWFwIGVudHJ5
IGZvciB0aGlzIG5vZGUuDQoNCj4gbm90IG1lYW4gdGhhdCBhdCBsZWFzdCBvbmUgYnl0ZSBvZiBt
ZW1vcnkgYXQgdGhhdCBhZGRyZXNzIGlzIHByZXNlbnQNCj4gb24gdGhlIGdpdmVuIG5vZGUsIGJl
Y2F1c2UgdGhlIG5vZGUgY292ZXJzIDAgYnl0ZXMuDQo+IA0KDQpBbmQgYmFjayB0byB0aGlzIHBh
dGNoLCBjYW4gSSBqdXN0IGRyb3AgdGhlIHVubmVjZXNzYXJ5IGp1c3RpZmljYXRpb24NCmZyb20g
dGhlIGNvbW1pdCBtZXNzYWdlPw0KDQpBbmQgZm9yIHRoZSBib2d1cyB3YXJuaW5nIG1lc3NhZ2Us
IGNhbiBJIHVwZGF0ZSBpdCB0byBhbiBJTkZPIGxldmVsDQptZXNzYWdlIGluIHBhcnQjMiBzZXJp
ZXMsIGFuZCBqdXN0IGtlZXA6DQpwcmludGsoS0VSTl9JTkZPICJTUkFUOiBOb2RlICV1IGhhcyBu
byBtZW1vcnkhXG4iLCBpKTsNCmJ1dCByZW1vdmUgIkJJT1MgQnVnIG9yIG1pcy1jb25maWd1cmVk
IGhhcmR3YXJlP1xuIiwgaSk7ID8NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KPiBKYW4NCg0K

