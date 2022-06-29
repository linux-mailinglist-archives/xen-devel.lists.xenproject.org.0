Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B422B55F61F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 08:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357547.586161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Qsw-0006Sa-Tx; Wed, 29 Jun 2022 06:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357547.586161; Wed, 29 Jun 2022 06:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Qsw-0006QM-Po; Wed, 29 Jun 2022 06:09:10 +0000
Received: by outflank-mailman (input) for mailman id 357547;
 Wed, 29 Jun 2022 06:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlzK=XE=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o6Qsv-0006QD-4f
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 06:09:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fba104b4-f771-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 08:09:07 +0200 (CEST)
Received: from AM6P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::28)
 by DB7PR08MB3721.eurprd08.prod.outlook.com (2603:10a6:10:7f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Wed, 29 Jun
 2022 06:09:04 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::5d) by AM6P195CA0015.outlook.office365.com
 (2603:10a6:209:81::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 06:09:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 06:09:04 +0000
Received: ("Tessian outbound 9336577968ca:v121");
 Wed, 29 Jun 2022 06:09:03 +0000
Received: from adec7aa232ab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC212FA6-EE96-4363-9A75-343CFBE0FD4E.1; 
 Wed, 29 Jun 2022 06:08:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id adec7aa232ab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 06:08:54 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB6698.eurprd08.prod.outlook.com (2603:10a6:10:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 06:08:52 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 06:08:51 +0000
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
X-Inumbo-ID: fba104b4-f771-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gQ1VemotP6HLPmNrrXRzYbcxg/9Iynt+8ErCxUxdGHjJ1nAKt9SEeSzwy25pL9xH3jOP5KTodef5XRAWxjt4xhorr9OynXzUrFqOOAjWPYviNZlH4hDGVoxB3nrNQcom8LNQO7fdIQJM+WM8JupY2za7wJgkDzDz9+DU5+W68Y+SKwFGK4i1q5PNRF1PKWQPjHZy+s10rMirPfCEMNsW4bZ0JrOTXDfb9uBsqq5Owlokpt78SGI3My5Pa5zwMeDyZybN1Zgp93WHcbR0QKJztWd/bYQMcN1C9HqPLmErpRgMDAhzeERJE0abnXXJTjeRoMEOB3HYyQvLGPm+ai47jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAELKJo0AWpheEOWeZU4t88zp0j0ouqU4liKC/e+OrU=;
 b=ipnwt0olG2UuY0MiRUx5OW1OXBC7BPpdObaMft1o/4DUjPLFDc6E6PJwt/a0/GHIrKBx8fd7ZqGmPvyM4bsLAbd9RoXBeD+aDadbzJGT/YvFfH2LfK/86YqHHx9p8rUljvG5xfdQxP47Si2waf55tAjceGsiyvfXi62ZFyMb8Xk2scv9Ymw6ppKKj8FxweZd4Otg1jlniKfWGnry4rH/Qa2mU5PdPaesjF0bGLb1BqNpjB6LnI5mWKaPbQDhhyRIx2Fg2RCLqe16KJVZjHBLNsYAneWKVSSSxLQTBlR50VHFpti41BQ9dC2LZqF8SpLwyBb15/Wygyx0WG7jowJLqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAELKJo0AWpheEOWeZU4t88zp0j0ouqU4liKC/e+OrU=;
 b=8tGR4aBgHGLbYQE4FJuAYClvpk8MkNTE6ldiWClem5AoKted+vzcu3K7IV0CctyThthNeXN2grgwJnsWVrJxz3vG0QvQfahybqE+YRUhkX31btIx2/2RO08DZO0iODhuPLmu2LN08qWMIIsB9c3PCUBVBAJXfGIni6DHHcPAgmA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/hNO7aJPZMgDgZp6EucuqjkiHN3Q7eO8F6zHw7LUFqams44yy3VN40SeT3xwoLU3J8for0AwYTjqIqFpv3u+5BxM3MlWTUqNJWRUMvD0jLhi45BkhoP+iDE2Es49NJjzWlc4drPRh8ohmO2cT4+JdP2qq5sdwhwSFkjJ1zDVwfsGNP3aTvvBiu9RraPc6N9KYsJz2gzWT61RH2g0njQ42uuOMPkOO7RzixheT55re+GII+Y2ryngDqQK1Ai3UkOyeeUQE0+eKyvd5+xHpnpCEJfTxjd2U7vkRYApXFKKPzd+Q+yIDP8KMLMJ206UhNqFVyUWRUs0Z5Xunmfv3nRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAELKJo0AWpheEOWeZU4t88zp0j0ouqU4liKC/e+OrU=;
 b=i49pvj4xdiXr842NnVy27v8P2e1tXdk4lTDnB4pLyL1lNNpmQg/LG2VsulW3H0odrYrSXyWMEYEI5bCNnxsBIDCd/gmP4HsCKSvixuQkKR7g4pyYKVnTW0ap1lO6lNNn4SPWxIOHYQd1u7M7FPRgvEO2m3xM2URsLxt+x0jo/gkszv2JkjWtDHM2u8vFt7wMuORdSx3n4CQ982W59/9OuxqtEFeT3OH0NiwX0IUbh2wGRh7+qyk9O4VBFpnBWYMxh1/EZXVGFkpnD1eGi/wBVmiDM5csa+LHJwiEce/pOjOyJmmXuyxLV6qsyfxVRtyiP9I7tqjviV6YTAXp7q7x8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAELKJo0AWpheEOWeZU4t88zp0j0ouqU4liKC/e+OrU=;
 b=8tGR4aBgHGLbYQE4FJuAYClvpk8MkNTE6ldiWClem5AoKted+vzcu3K7IV0CctyThthNeXN2grgwJnsWVrJxz3vG0QvQfahybqE+YRUhkX31btIx2/2RO08DZO0iODhuPLmu2LN08qWMIIsB9c3PCUBVBAJXfGIni6DHHcPAgmA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
Subject: RE: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Thread-Index:
 AQHYhE/FRuoXPvvK9EWAAAtCUPIrtq1bKxqAgAfcEECAAA7bAIACoRkggAA58ICAAACkIA==
Date: Wed, 29 Jun 2022 06:08:51 +0000
Message-ID:
 <DU2PR08MB7325B9C7AC3441780E7AEB78F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <380b2610-fe2f-6246-e6a4-f0dd8295d488@xen.org>
 <DU2PR08MB732507EFB0CC4FEAA4872B3AF7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6cfca3ce-219e-f9e4-e30c-40d7a74ea523@suse.com>
In-Reply-To: <6cfca3ce-219e-f9e4-e30c-40d7a74ea523@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 170E402F55E47347B72F05CCC6033C8E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 724968e7-9882-49ef-6760-08da5995de5e
x-ms-traffictypediagnostic:
	DB9PR08MB6698:EE_|AM5EUR03FT038:EE_|DB7PR08MB3721:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S2rGMoo1NsKJMnnb9DvXOyfjgKr6HJdjlov6k/he6ieC5gDzmdndZHLjZYxIS0mFQEVUYlizmdjcNBiy90yNqsN+sxpBj0xsvK9YshX1Uo2h4OBtfSLgO2g7i4tkA9NY9Ye4HMktm47ww6eui0iiGUiy2ynzoSEId0ZK/AoT/jfEf/e46/YT9sSFN5U10CvGT+6yqBwMO/lsgf385i2KTi50O7Hx+mC51DxYlD6ttVyRLCgbiedUAkwtwpPvBtA8zkyvLGnRnH29n2fjbYxi9U/n6cbVjyrThjSyc5Lg1+rJrGg1Zd1TD5i9Cga5fUt/8aJB8fLUIXmvc5RCQEk21WW3ZJr+nw5ZqAgS9LuUwvm8NTOOSGirHbZgsEYKhVNlwScBo6UkAzcWbVucJr4AYhZIDPn5F0dnHMPFxWOtDFPacZdwguaMmiyUUs/l2y/cJrP4QXX0fJkbneOvPRHROH9E5ZO6ncAISMc2mhR88dKS28JOURhBi3e0Lro2yVDINtJC+9+Jm/F4SNaz91qD0x2irIO0mqSe2rGhjtaE/L1iN5PiPUjZLZuq8JoZ4TmpFlTQJ67WCGUYzY01JdCYDuBL0euSFTePhUU6nAZlT97lv9Ei9hZkbFwn9A9lPnESgrZicjAZlhTfM2n7A8raUTHov99EjD2sF1cLXKwtEbjVzDTO5A3jLCIH1rcOw9OL49q3ectYOPEKwhU1QnlfFNyeBOwPkVjyhjrSqNcVpO+cAH7eu7vlavyWquEBUTyK57nC5BraMjbq5v4iYPh7rRTNQu7EvSvnXrsvCHslHmI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(38100700002)(41300700001)(33656002)(66476007)(54906003)(5660300002)(186003)(316002)(6916009)(2906002)(478600001)(9686003)(7696005)(83380400001)(26005)(6506007)(86362001)(76116006)(66556008)(38070700005)(53546011)(71200400001)(55016003)(8676002)(64756008)(122000001)(52536014)(4326008)(66446008)(8936002)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6698
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d03ea7c-5ea2-4790-cc3c-08da5995d6f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MX5tUQwDDSytZkaetCraX7LJsiY5btwvxjdM7fentSDlCq2Os54M3r4c42D4mQr4/h9gKwyz9v7uO+4/0XnvwzPEZildNTTLAXtEKYpGAV4f/ah5gWdR0nBfVEd0RS56xyYqWRl8X6VTCH2I966Bl6k2fsuBIM5f2tQeos7lkF6Q41Yo8Qp9Pp7iz04eHOaBTBAtiLjfzJMrVRkqNLS2RMqgRiL7YpFROgfU07SHoH6oWS9AMC2rdD7Ha2c4gqRTP2lwY6NWim+kDWahsY5A3wg8OUgxLmSVFe+WMxY0DOeP/iUb+ujz30CyEOvxMXZWE10Mn8iS3IEm/YasJ0Eeq3dUnrEc8e6CCY9jT+UyNmg3+Z0o2yPJfkrlnB/DAfeLGkjMH4FLdg002OdJRS/Un2pmrK0Y7t62TLwIKRTI+uiIQRMCebLiZnCiCBhaGYFwX4aX8tWNaqX/c8BWwPhLF6gAT7PrFyDDnV6wxgXO/+6oBs2SjIch8K72koDw5Bit1U+IWvKw1Xp8KhgcAXGzduDgAK1el26ff6zjvjfiOyKPgOsk1sowg3n8/Z5VuKvx9WRuwOaRkefruJKm2nc3aIkLcNNJ6b01+cmV/jyr87i8e1ccWdzntONjniNyfm0/xkSnrMBWisgiHSG6ys1Ak/Qi2HtgFYhi/XlV/84ltU8O1034bwEd6/rsCcxkttkZoSw6nYo88s9QjT4hNlHVJRufS6847uw6mgKYW3g7mS62wlyBh+5PglIbQiJIfjEDiUVsPHiWacVieLBylXj9wamwFUe3qRhVCEj+cxBQrgdnzB1VooAaSbKJSjgaHiRR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(4326008)(40460700003)(70586007)(55016003)(70206006)(8676002)(36860700001)(8936002)(7696005)(54906003)(316002)(186003)(52536014)(83380400001)(478600001)(33656002)(26005)(5660300002)(41300700001)(2906002)(81166007)(356005)(47076005)(6506007)(40480700001)(82310400005)(6862004)(336012)(86362001)(53546011)(82740400003)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 06:09:04.1137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 724968e7-9882-49ef-6760-08da5995de5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3721

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjksIDIwMjIg
MTo1NiBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBX
ZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
Ow0KPiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1
IDx3bEB4ZW4ub3JnPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyA3LzldIHhl
bi9hcm06IHVucG9wdWxhdGUgbWVtb3J5IHdoZW4gZG9tYWluIGlzDQo+IHN0YXRpYw0KPiANCj4g
T24gMjkuMDYuMjAyMiAwNToxMiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuIGFu
ZCBKYW4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiBNb25kYXksIEp1bmUgMjcs
IDIwMjIgNjoxOSBQTQ0KPiA+PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+
OyBKYW4gQmV1bGljaA0KPiA+PiA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IENjOiBXZWkgQ2hl
biA8V2VpLkNoZW5AYXJtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+ID4+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLQ0KPiA+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDcvOV0geGVuL2FybTogdW5wb3B1bGF0ZSBt
ZW1vcnkgd2hlbiBkb21haW4NCj4gaXMNCj4gPj4gc3RhdGljDQo+ID4+DQo+ID4+DQo+ID4+DQo+
ID4+IE9uIDI3LzA2LzIwMjIgMTE6MDMsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gSGkgamFu
DQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBwdXRfc3Rh
dGljX3BhZ2VzLCB0aGF0IGlzLCBhZGRpbmcgcGFnZXMgdG8gdGhlIHJlc2VydmVkIGxpc3QsIGlz
DQo+ID4+PiBvbmx5IGZvciBmcmVlaW5nIHN0YXRpYyBwYWdlcyBvbiBydW50aW1lLiBJbiBzdGF0
aWMgcGFnZQ0KPiA+Pj4gaW5pdGlhbGl6YXRpb24gc3RhZ2UsIEkgYWxzbyB1c2UgZnJlZV9zdGF0
aW1lbV9wYWdlcywgYW5kIGluIHdoaWNoDQo+ID4+PiBzdGFnZSwgSSB0aGluayB0aGUgZG9tYWlu
IGhhcyBub3QgYmVlbiBjb25zdHJ1Y3RlZCBhdCBhbGwuIFNvIEkNCj4gPj4+IHByZWZlciB0aGUg
ZnJlZWluZyBvZiBzdGF0aWNtZW0gcGFnZXMgaXMgc3BsaXQgaW50byB0d28gcGFydHM6DQo+ID4+
PiBmcmVlX3N0YXRpY21lbV9wYWdlcyBhbmQgcHV0X3N0YXRpY19wYWdlcw0KPiA+Pg0KPiA+PiBB
RkFJVSwgYWxsIHRoZSBwYWdlcyB3b3VsZCBoYXZlIHRvIGJlIGFsbG9jYXRlZCB2aWENCj4gPj4g
YWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoKS4gVGhpcyBjYWxsIHJlcXVpcmVzIHRoZSBkb21haW4g
dG8gYmUNCj4gPj4gYWxsb2NhdGVkIGFuZCBzZXR1cCBmb3IgaGFuZGxpbmcgbWVtb3J5Lg0KPiA+
Pg0KPiA+PiBUaGVyZWZvcmUsIEkgdGhpbmsgdGhlIHNwbGl0IGlzIHVubmVjZXNzYXJ5LiBUaGlz
IHdvdWxkIGFsc28gaGF2ZSB0aGUNCj4gPj4gYWR2YW50YWdlIHRvIHJlbW92ZSBvbmUgbG9vcC4g
QWRtaXR0bHksIHRoaXMgaXMgbm90IGltcG9ydGFudCB3aGVuDQo+ID4+IHRoZSBvcmRlciAwLCBi
dXQgaXQgd291bGQgYmVjb21lIGEgcHJvYmxlbSBmb3IgbGFyZ2VyIG9yZGVyICh5b3UgbWF5DQo+
ID4+IGhhdmUgdG8gcHVsbCB0aGUgc3RydWN0IHBhZ2VfaW5mbyBtdWx0aXBsZSB0aW1lIGluIHRo
ZSBjYWNoZSkuDQo+ID4+DQo+ID4NCj4gPiBIb3cgYWJvdXQgdGhpczoNCj4gPiBJIGNyZWF0ZSBh
IG5ldyBmdW5jIGZyZWVfZG9tc3RhdGljX3BhZ2UsIGFuZCBpdCB3aWxsIGJlIGxpa2U6DQo+ID4g
Ig0KPiA+IHN0YXRpYyB2b2lkIGZyZWVfZG9tc3RhdGljX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IHBhZ2VfaW5mbw0KPiA+ICpwYWdlKSB7DQo+ID4gICAgIHVuc2lnbmVkIGludCBpOw0K
PiA+ICAgICBib29sIG5lZWRfc2NydWI7DQo+ID4NCj4gPiAgICAgLyogTkIuIE1heSByZWN1cnNp
dmVseSBsb2NrIGZyb20gcmVsaW5xdWlzaF9tZW1vcnkoKS4gKi8NCj4gPiAgICAgc3Bpbl9sb2Nr
X3JlY3Vyc2l2ZSgmZC0+cGFnZV9hbGxvY19sb2NrKTsNCj4gPg0KPiA+ICAgICBhcmNoX2ZyZWVf
aGVhcF9wYWdlKGQsIHBhZ2UpOw0KPiA+DQo+ID4gICAgIC8qDQo+ID4gICAgICAqIE5vcm1hbGx5
IHdlIGV4cGVjdCBhIGRvbWFpbiB0byBjbGVhciBwYWdlcyBiZWZvcmUgZnJlZWluZyB0aGVtLA0K
PiA+ICAgICAgKiBpZiBpdCBjYXJlcyBhYm91dCB0aGUgc2VjcmVjeSBvZiB0aGVpciBjb250ZW50
cy4gSG93ZXZlciwgYWZ0ZXINCj4gPiAgICAgICogYSBkb21haW4gaGFzIGRpZWQgd2UgYXNzdW1l
IHJlc3BvbnNpYmlsaXR5IGZvciBlcmFzdXJlLiBXZSBkbw0KPiA+ICAgICAgKiBzY3J1YiByZWdh
cmRsZXNzIGlmIG9wdGlvbiBzY3J1Yl9kb21oZWFwIGlzIHNldC4NCj4gPiAgICAgICovDQo+ID4g
ICAgIG5lZWRfc2NydWIgPSBkLT5pc19keWluZyB8fCBzY3J1Yl9kZWJ1ZyB8fCBvcHRfc2NydWJf
ZG9taGVhcDsNCj4gPg0KPiA+ICAgICBmcmVlX3N0YXRpY21lbV9wYWdlcyhwYWdlLCAxLCBuZWVk
X3NjcnViKTsNCj4gPg0KPiA+ICAgICAvKiBBZGQgcGFnZSBvbiB0aGUgcmVzdl9wYWdlX2xpc3Qg
KmFmdGVyKiBpdCBoYXMgYmVlbiBmcmVlZC4gKi8NCj4gPiAgICAgcHV0X3N0YXRpY19wYWdlKGQs
IHBhZ2UpOw0KPiA+DQo+ID4gICAgIGRyb3BfZG9tX3JlZiA9ICFkb21haW5fYWRqdXN0X3RvdF9w
YWdlcyhkLCAtMSk7DQo+ID4NCj4gPiAgICAgc3Bpbl91bmxvY2tfcmVjdXJzaXZlKCZkLT5wYWdl
X2FsbG9jX2xvY2spOw0KPiA+DQo+ID4gICAgIGlmICggZHJvcF9kb21fcmVmICkNCj4gPiAgICAg
ICAgIHB1dF9kb21haW4oZCk7DQo+ID4gfQ0KPiA+ICINCj4gPg0KPiA+IEluIGZyZWVfZG9taGVh
cF9wYWdlcywgd2UganVzdCBjYWxsIGZyZWVfZG9tc3RhdGljX3BhZ2U6DQo+ID4NCj4gPiAiDQo+
ID4gQEAgLTI0MzAsNiArMjQzMCw5IEBAIHZvaWQgZnJlZV9kb21oZWFwX3BhZ2VzKHN0cnVjdCBw
YWdlX2luZm8gKnBnLA0KPiA+IHVuc2lnbmVkIGludCBvcmRlcikNCj4gPg0KPiA+ICAgICAgQVNT
RVJUX0FMTE9DX0NPTlRFWFQoKTsNCj4gPg0KPiA+ICsgICAgaWYgKCB1bmxpa2VseShwZy0+Y291
bnRfaW5mbyAmIFBHQ19zdGF0aWMpICkNCj4gPiArICAgICAgICByZXR1cm4gZnJlZV9kb21zdGF0
aWNfcGFnZShkLCBwZyk7DQo+ID4gKw0KPiA+ICAgICAgaWYgKCB1bmxpa2VseShpc194ZW5faGVh
cF9wYWdlKHBnKSkgKQ0KPiA+ICAgICAgew0KPiA+ICAgICAgICAgIC8qIE5CLiBNYXkgcmVjdXJz
aXZlbHkgbG9jayBmcm9tIHJlbGlucXVpc2hfbWVtb3J5KCkuICovIEBADQo+ID4gLTI2NzMsNiAr
MjY3NiwzOCBAQCB2b2lkIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBn
LA0KPiA+IHVuc2lnbmVkIGxvbmcgbnJfbWZucywgIg0KPiA+DQo+ID4gVGhlbiB0aGUgc3BsaXQg
Y291bGQgYmUgYXZvaWRlZCBhbmQgd2UgY291bGQgc2F2ZSB0aGUgbG9vcCBhcyBtdWNoIGFzDQo+
IHBvc3NpYmxlLg0KPiA+IEFueSBzdWdnZXN0aW9uPw0KPiANCj4gTG9va3MgcmVhc29uYWJsZSBh
dCB0aGUgZmlyc3QgZ2xhbmNlICh3aWxsIG5lZWQgdG8gc2VlIGl0IGluIHByb3BlciBjb250ZXh0
IGZvciBhDQo+IGZpbmFsIG9waW5pb24pLCBwcm92aWRlZCBlLmcuIFhlbiBoZWFwIHBhZ2VzIGNh
biBuZXZlciBiZSBzdGF0aWMuDQoNCklmIHlvdSBkb24ndCBwcmVmZXIgbGV0IGZyZWVfZG9taGVh
cF9wYWdlcyB0byBjYWxsIGZyZWVfZG9tc3RhdGljX3BhZ2UsIHRoZW4sIG1heWJlDQp0aGUgaWYt
YXJyYXkgc2hvdWxkIGhhcHBlbiBhdCBwdXRfcGFnZQ0KIg0KQEAgLTE2MjIsNiArMTYyMiw4IEBA
IHZvaWQgcHV0X3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkNCg0KICAgICBpZiAoIHVubGlr
ZWx5KChueCAmIFBHQ19jb3VudF9tYXNrKSA9PSAwKSApDQogICAgIHsNCisgICAgICAgIGlmICgg
dW5saWtlbHkocGFnZS0+Y291bnRfaW5mbyAmIFBHQ19zdGF0aWMpICkNCisgICAgICAgICAgICBm
cmVlX2RvbXN0YXRpY19wYWdlKHBhZ2UpOw0KICAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UocGFn
ZSk7DQogICAgIH0NCiB9DQoiDQpXZHl0IG5vdz8NCiANCj4gDQo+IEphbg0K

