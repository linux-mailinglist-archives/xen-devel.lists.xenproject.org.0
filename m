Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43E568379
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362051.591910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91Kr-0002dJ-PB; Wed, 06 Jul 2022 09:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362051.591910; Wed, 06 Jul 2022 09:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91Kr-0002aY-LT; Wed, 06 Jul 2022 09:28:41 +0000
Received: by outflank-mailman (input) for mailman id 362051;
 Wed, 06 Jul 2022 09:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o91Kq-0002aS-So
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:28:40 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00060.outbound.protection.outlook.com [40.107.0.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04c3a3b6-fd0e-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 11:28:39 +0200 (CEST)
Received: from DU2PR04CA0264.eurprd04.prod.outlook.com (2603:10a6:10:28e::29)
 by AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 09:28:37 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::9a) by DU2PR04CA0264.outlook.office365.com
 (2603:10a6:10:28e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Wed, 6 Jul 2022 09:28:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 09:28:36 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Wed, 06 Jul 2022 09:28:36 +0000
Received: from dd66ec49db92.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83D90A54-C7B5-4C3C-A7BF-8334064A4CC1.1; 
 Wed, 06 Jul 2022 09:28:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd66ec49db92.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 09:28:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM5PR0802MB2404.eurprd08.prod.outlook.com (2603:10a6:203:a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 09:28:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 09:28:28 +0000
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
X-Inumbo-ID: 04c3a3b6-fd0e-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GBoX4P433jl/LFzmXxMlZJLg1/apEarHLfbvyKJ4pAj5npaNEObbEKy7jvMUQesurwx7gczOqaQt2l+xweDDbUfFsP7GfDq4sEJzw3oW2unBuy/fTVXveGlFHfKrFBKTSQIlDOn+1B4Q66VyScFFJ1eX3C838uGKKKalBuMFF5C2FuK786j1pvxwrdqfRf9pJP1FwsTEbi/SfT74SYTAU0pLy2Tqb4Y0gr2RWEWCOIklXgMMM0GjTuwrKRdDBD+1P4GHvtOJw3Wwi05lueeTpc+XGffdiWZee/Yi7gsgFmIzsKGUykMf2MHHbz7L1HzHBQ0jvgqmGQOVT2qWz8lAyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG3rKQnfuoIiGc64LK+407lz5Kp6l6aLTewi2Sn8cvA=;
 b=KTMztUpFY6osEPBNX0kDD9R/d3YEV8td8m3+AQp03+DRxleOycYWOdvjAWEaMjecSiY18RXrGdWC0hkJOQVXoHE9krx5ibcEhbdq+F5QqcrVD57ltlxyceiATvinxzPagbCgcis1Cq+WZFnzZABay1V0tqdXZXgISgV94e24gGFL00keTlrDfPDiwsd9c6xcG8AumIp9SYjBnsikWvpvVeiPZu3uES8/AXarwO1tI/2UKW7zBSJv6OmS3VAUmeb5Rbb9qZ4kwJ28xbBgcz8bHmbrFg3ewNp12ILVx0cpYERWQatQuZDhnx7la3JmqzwZ9xXdxRx0les/fFcNBvZC0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG3rKQnfuoIiGc64LK+407lz5Kp6l6aLTewi2Sn8cvA=;
 b=y6h3cJKLnq/4Cc/wsLi6IKfkZ8E0DXBAGKQSpdpaInUFW0IB6xxns9APZJ5BgfG8SvLSnOrTeIq0BmoEywMvi0K7nHj4KVaNhkYPCel8RBV9tvhWoYAkR3zO3kwSC55Hi9VNpy1RUOJmHW5iIAEBi07B527HlE/Gg2ic8quowDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp16wDlj2vSeKUTEsFcVnW5Pti5uHF5R45zK5uU3nsrRiVsbFrIChYhXtMOEgNL08T+soI5dk3HfStmOdCjbF4NBU4AKe8zGKoVctUX4LeJ/OkYkWAQ4MKXEvo5NJFFUJvPaVXphE5bUcmImieJzTvqrkDLj1vyL6Qfo+Pd6h/csDlocjt5QWPkRwEAGJkgR9hEQ1b7qQKNzg6MDfQhsXQnxNpJ/oL5WICX6Tm2L7Pux/YLaKyd672c437JclVBQnQP5YWM5HuP4upX7PONZcGWWwJ6loflnGnrpPh++7joaaZwLKmKWFeeL6JTTygvCh3saxQma9sjJvN31Nv0wLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG3rKQnfuoIiGc64LK+407lz5Kp6l6aLTewi2Sn8cvA=;
 b=QS8ZEo1/SCmeBfEo87mi/0NwJEuKY1ztN5BJMl6of+YRSR3uuR8qWy8i9WKKYODpy/Oxo4Fngfv80ksVy1r1MrAQp11EponVVkQT3/2wvATH5oWBsHY4GpUL558LOLW08KXOFgAwLu4N0P7eDQuOERCPhDU8GxX/3gCahmVY3u1alqIfliZMFBasyABlz4olYfwoYcsdxL68NnJaB6wtqeldqNFCCaWoml0hhTC9DzYFzaW2EnKw8Ce2wJY0n7GiIyIRkLJ5z+B+DcOMSR7ade8p3/Wk40LvV8SJz8cffeSYMbQg6ALb0/sP9PMYHPnMayl6BjjhH8JNbbz5i8TK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG3rKQnfuoIiGc64LK+407lz5Kp6l6aLTewi2Sn8cvA=;
 b=y6h3cJKLnq/4Cc/wsLi6IKfkZ8E0DXBAGKQSpdpaInUFW0IB6xxns9APZJ5BgfG8SvLSnOrTeIq0BmoEywMvi0K7nHj4KVaNhkYPCel8RBV9tvhWoYAkR3zO3kwSC55Hi9VNpy1RUOJmHW5iIAEBi07B527HlE/Gg2ic8quowDM=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [RFC PATCH 0/4] Introducing a common representation of boot info
Thread-Topic: [RFC PATCH 0/4] Introducing a common representation of boot info
Thread-Index: AQHYdHf6JvWZG2GXVE2XLLkq14FnwK1xI0fQgAAhtYCAAASccA==
Date: Wed, 6 Jul 2022 09:28:28 +0000
Message-ID:
 <AS8PR08MB7991EC2DB63BEE151BA1818992809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <AS8PR08MB79910EC13ABF2C848AF9850092809@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <46944677-13fd-829f-1b73-13720bf2956e@suse.com>
In-Reply-To: <46944677-13fd-829f-1b73-13720bf2956e@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FAF8D3667A01B541B58C691FD1677C62.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 85b97d1f-26cf-48b1-9ac5-08da5f31e770
x-ms-traffictypediagnostic:
	AM5PR0802MB2404:EE_|DBAEUR03FT048:EE_|AS4PR08MB7925:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c+Cl7SPrkNyp3OgpAwoZ38QKKPaiTb5Me1LoBYeSBg/OZNSq71TWS1dp2j9kKh6z+r03gexq6ng5T8OoC7o0+oOlMATECOgSSQXQIKazR6MdYdUYX+URQF8n5wp+yYtrNeSrsxAvfNxwqog+nnrMS8DYM6PhdAkPm5bHDRyqeMnicIhQ5qZ6GJBKSNStnhXpFWcBL41nP7PTCU7jo8IOXVvOxnmMLKdrIhJqHQMLO2Y9E3RM58G2Qy75mA34WxEyjQ/4gKbr8rjosfvkcEsSok79ZAa6qvl6tLnw7KkBFYPRsbt8gSdq37xoTGCZXrzh/7tOTSpM3upvEV6QKmKSzzXOV85fuQkf5LUWDEWpQl5yPkr8r0enjl1yMcvsSvty3NuVO+NUtdWwoFQGpIw9NrS9QluXPL7r5rg6G/iD2oqYz6/ndZ4HvYiyH4IAOxF1hsb8cLlB4eGMH3Rnozya7kQiUmQJ7rq+X+cx2jxjzXel9RjMeBGL6NXKkTA6Sls2DAJAFavk6/KKgAR2hIpaN9WhKwNDCi+lVO6Kq+dWLe4oAUUfOmZD+15/iomukLXyM4XR0rbCsuTA7HIJ05eR1i7jWv93LtJjT/A4lWCCO+pzSr9ZXpyaEshD2lWX/mtD2xpupL8qzOOH91raflhCszay0Jm5hLpnxC6zfmBVFC8sTorISSATCwsyH2hl+s2qtq3r9A2kJfXMaFMHzxHLugmfb+AUkaB+jvGsP2j4tAFkaf5aJ/DJpUjfRv0958e5RWUas2zBW2vTqygDPMwH1h0CeWU+2Fxv2B+2uPi3WkuJu0rrbydV3xAW4hIhC4/W
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(52536014)(8936002)(478600001)(53546011)(9686003)(6506007)(5660300002)(41300700001)(2906002)(7696005)(33656002)(122000001)(26005)(86362001)(66476007)(66446008)(8676002)(55016003)(186003)(38070700005)(54906003)(83380400001)(76116006)(66556008)(6916009)(64756008)(4326008)(71200400001)(316002)(66946007)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2404
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b232a494-3014-43de-3d36-08da5f31e27f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XpT+r6NDQfJVcl1QMP3T5k/j/vzKFlEuqceBt7uy3oDdCVyANNnXQQOCLkShJOWIVv1rGCXCGhWcwzdY5gAg/AhLomEIjjtTvomSdDAv/ZmVsPX9oFmpJXnYANCv2PO2RtOXZMMhG9HdFo6EBgnEg0fWAPM6/vwmQMDkYfnVynhwKm35R80LDHLPxJqEahUFSxZxqrzjsjOMMvckSmZiX4aRjBAby9/TUuHna5erdeyJteKLEHQCuHViCCKJzOver1P+mcI2xQgrhUD+nGfdfZlhQoN+fQ591VSNp7li1cRJ4CwxC3VUlx2Sufvhq1VCPm9MUFKf7nYI6gfoBqU7LT/vpk6lMl2C1A08R1HE8Vk9S56lY783zWAaPV4ZOnBQM9eDhApzuKb21Bmr+QpUfSNmcAOxI3rqxy5+1QKiYBqChyJrkqZ/N7Hc3rndb5WOBAcukk7vMVEZfq9D3F0tGCdBYsnto080S2gU1j4HKCCPFNiFle9ac0QnrU5UJg3MH5r5h8jlA9CMk0i9Xe6S+XNskOqyPPQfcQyV+GdrLLMXjKP2YQKVk/mqJzSu+QOU+LdnG8DDXZOhmloO90QwclxMR1vKjAsNop4vKd3Qb8a0J/WmkknYEcm9/0edC24BljNA+ZgnLBqnTFfgZ/GS15QZs+sfQvmUCtxyrM2WDitoSWV5R+CcQsJI8MP6ZQozWK3cG/jBHfPXCB4pt6wJXJbijkb8ATFoIa3rT2pIbpQtzwgwWH0fAupHntiNce2YkBF7+XpFCLJiWsKwzAg5xXAJqTaTuvSVueyKdLAYIe3owqxWsaaBwOZTqy/jfsFc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(36840700001)(40470700004)(26005)(40460700003)(7696005)(6506007)(9686003)(186003)(83380400001)(82740400003)(336012)(478600001)(53546011)(40480700001)(2906002)(33656002)(55016003)(4326008)(8676002)(70206006)(70586007)(54906003)(86362001)(82310400005)(41300700001)(8936002)(81166007)(52536014)(6862004)(5660300002)(36860700001)(47076005)(316002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:28:36.7299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b97d1f-26cf-48b1-9ac5-08da5f31e770
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7925

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMC80XSBJ
bnRyb2R1Y2luZyBhIGNvbW1vbiByZXByZXNlbnRhdGlvbiBvZiBib290DQo+IGluZm8NCj4gDQo+
IE9uIDA2LjA3LjIwMjIgMDk6MzAsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gSXQgc2VlbXMgdGhh
dCB0aGlzIHNlcmllcyBoYXMgYmVlbiBzdGFsZSBmb3IgbW9yZSB0aGFuIGEgbW9udGgsIHdpdGg6
DQo+ID4NCj4gPiBQYXRjaCAjMSBoYXMgc29tZSBkaXNjdXNzaW9ucyBpbiB0aHJlYWQuDQo+ID4g
UGF0Y2ggIzIgIzMgIzQgbmVlZCBzb21lIGZlZWRiYWNrIGZyb20gbWFpbnRhaW5lcnMuDQo+ID4N
Cj4gPiBTbyBzZW5kaW5nIHRoaXMgZW1haWwgYXMgYSBnZW50bGUgcmVtaW5kZXIuIFRoYW5rcyEN
Cj4gDQo+IEFzIGEgZ2VuZXJhbCByZW1hcms6IFJGQ3MsIGF0IGxlYXN0IGluIG15IHZpZXcsIHRh
a2UgbG93ZXIgcHJpb3JpdHkgdGhhbg0KPiAib3JkaW5hcnkiIHBhdGNoIHN1Ym1pc3Npb25zIChh
bmQgb3RoZXIgd29yaykuIEksIGZvciBleGFtcGxlLCBoYXZlIHRoaXMNCj4gYW5kIG90aGVyIG9u
IG15ICJ0byBsb29rIGF0IiBsaXN0LCBidXQgSSBjYW4ndCByZWFsbHkgcHJlZGljdCB3aGVuIGFs
bA0KPiBoaWdoZXIgcHJpb3JpdHkgaXRlbXMgd291bGQgaGF2ZSBiZWVuIGRlYWx0IHdpdGguIEl0
J3MgdGhlIHNhZCByZWFsaXR5DQo+IHRoYXQgaW4gZWZmZWN0IHRoaXMgb2Z0ZW4gbWVhbnMgUkZD
cyB3b24ndCBiZSBsb29rZWQgYXQgYXQgYWxsLiBPbmUgb2YNCj4gdGhlIG1hbnkgdW5mb3J0dW5h
dGUgZWZmZWN0cyBvZiBvdXIgbGltaXRlZCByZXZpZXcgYmFuZHdpZHRoLg0KDQpJIGZ1bGx5IGFn
cmVlIHdpdGggeW91IG9uIHRoYXQsIGFuZCB0byBiZSBob25lc3QgSSB0aGluayB5b3UgaGF2ZSBh
bHJlYWR5DQpCZWVuIHJlYWxseSBhY3RpdmUgaW4gcmVzcG9uZGluZyBhbmQgcmV2aWV3aW5nIHNl
cmllcy4gDQoNCkp1c3QgdG8gY2xhcmlmeSB0aGUgcHVycG9zZSBvZiBtZSBzZW5kaW5nIHRoZXNl
IHJlbWluZGVyIGVtYWlscywgZnJvbSBteQ0KcGVyc3BlY3RpdmUsIHRob3NlIGVtYWlscyBhcmUg
c2ltcGx5IGZvciB1cyB0byBub3QgZm9yZ2V0IHRoZXNlIHNlcmllcyAoYW5kDQphbHNvIG9uZSBv
ZiB0aGUgcmVzcG9uc2liaWxpdGllcyBvZiBtZSBiZWluZyBhIHJlbGVhc2UgbWFuYWdlcikgaW5z
dGVhZCBvZg0KcHVzaGluZyBhdXRob3JzL21haW50YWluZXJzIGFuZCBtYWtpbmcgdGhlbSBmZWVs
IHN0cmVzc2Z1bCAtIEkgd2lsbCB0cnkgdG8NCnJlcGhyYXNlIGZvciBiZXR0ZXIgd29yZGluZyBp
ZiBteSBwcmV2aW91c2x5IGVtYWlscyBtYWtlIHBlb3BsZSB0aGluayBpbg0KdGhpcyB3YXkuDQoN
CktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

