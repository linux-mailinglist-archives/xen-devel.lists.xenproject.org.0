Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18094600B97
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 11:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424276.671580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMlj-00045k-67; Mon, 17 Oct 2022 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424276.671580; Mon, 17 Oct 2022 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okMlj-00043Y-20; Mon, 17 Oct 2022 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 424276;
 Mon, 17 Oct 2022 09:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CpyK=2S=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okMlg-00043R-TW
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 09:50:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a02ebea-4e01-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 11:50:43 +0200 (CEST)
Received: from AS9PR06CA0720.eurprd06.prod.outlook.com (2603:10a6:20b:49f::31)
 by DB3PR08MB8963.eurprd08.prod.outlook.com (2603:10a6:10:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:50:26 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::de) by AS9PR06CA0720.outlook.office365.com
 (2603:10a6:20b:49f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Mon, 17 Oct 2022 09:50:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 09:50:26 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Mon, 17 Oct 2022 09:50:25 +0000
Received: from b22b9f0567e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F0F695A-4188-4E78-8D00-AB1BBA3563D0.1; 
 Mon, 17 Oct 2022 09:50:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b22b9f0567e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 09:50:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7763.eurprd08.prod.outlook.com (2603:10a6:10:3b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.28; Mon, 17 Oct
 2022 09:50:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 09:50:10 +0000
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
X-Inumbo-ID: 2a02ebea-4e01-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ENKEhc975Y0EGve9CDbybTTXZ9LRC7C+tnUBPWSB/ZNH/IgdDMxhM6cbgQpyxX/CVgeSUiEWaWg6K/g2Lados/TKQccrSoTUS3VPOS3rRa9nkIGabuh+3UNfaXc35T0Y/TVp8GN+M7LFRBsxcMzOazk9lkYBpo9B1OQ4pzEoy6cczu7Ixs46ISNlRfF2TPMXielL4F3JRwcbCyRpGcBzVOd2yOAiclRp81OgQB7y6PEbPHLMRO0+zLU8j0Mf2PecNeD5yRkjnVRzmdle24Hyo2Tp+SO8l+9PdKcZBIFcC87cDiYO8bJPK9IjSCpcQIp+738L2Re7rraigY98TBCsaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hln1HqoRAY9j8vSTiaOQNbP/esfHGm+SlAueQ9hWhsg=;
 b=A/KZpCH4RatmfvUSZo9r43MngC1eEDfBT90HIPpm+dxHCG+au5wlBS5MjHqhec/wMo0+0XPTsm6pAwhD7GkvKF3sVLzns3sLcXWFQOf3mpx4BEYkud54PmGHfDyUlCMky6c10+Oox+15th0NN2yYDBwnsZKCEasE5OoBipnji0KtKClBIXZuxzlbdgMqSQBv9ItqDFMp3TzFJDGHC4b66aHtDPhujWuKvm9qd8ngfpo52cDPK5aQx0k7qV1VKYJ++QpHbOVAFnrwnC+5cziul/QezwtINXWYZUMcJkmT6JX5HZ5UYbPWFX75Ix1iepBPPu00yD/NFm+6uOGN+98m1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hln1HqoRAY9j8vSTiaOQNbP/esfHGm+SlAueQ9hWhsg=;
 b=VeScpkmFUNrYQxHXm+CFImou6Z8AwLpFS2PMU5+e5jJKLwUxPXIs0vKdf43Xs16OzriRxkK0yNi7oQo3On5enaNCK2V50yqUYIvQJcnqa9LJDWg0DisaNLE4ioc6C41qDcMfGtNodPgEDult5mCpi/Nev78TKDgiZPucXJfcM8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04d89ae35d4ae77e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvXTojj93wOo4lsZpn7XM5gi07YRL9mp2Dka81aK+SapsFotx3Q28PFL4Zdkr2/BSR6zJV6wehBJn4iMpd/U2U3XDviKhyuUWOKy3t2hIqvuGs8+Xr02mo85otX4I4lNaQBs9cE2M+tAIvk52GebDVg/jNYvMXPGayYjRfJL7fY5ZoAP4taP+J6mTIvI6Dp4yOU755WMWE/lDQH5YAVd6D0vEFHnaUC3A5vftBqNJJfvkS3smmJl63VYjGQ2f4qqOEdzPdzuMaENPkbHQz0slfGS8ZVU07aXRI0nx4sSPMUk02+Plzkp51bOA9c/VeptO5Qz7c3qCKpj9MdBoBqFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hln1HqoRAY9j8vSTiaOQNbP/esfHGm+SlAueQ9hWhsg=;
 b=cG13RTo/tiO3+Uu/5PQ4CB4gB+v6vMfnrTYeGfeqOhkPMLbkMxMwZGtFjegf1ThAMVjbbl5TLWeUruNG33bjJ7A8/SoICgdFL+RJ4/9W0gA4fbVoyksZSENnooXeFE9z4zo/WLfJQoHoA3YMc/PoSkaUsXNEo98Ib0r4I3530RCvf4nlyftLXAsgc0C/ZxEj58bAdXmsRRPisaCWPkLGn8e9Fd5dzHbDbCtGgbzNBUtJOQj7QH1n+kHf/WQgYHtO1gxKXhYI1Ddg9cCW2POx25QJ54H0fAkKExvZy4VVECx4tXbE4l8UywrPXs6tSBby7EBnr7nyoaT4S7S2U4525Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hln1HqoRAY9j8vSTiaOQNbP/esfHGm+SlAueQ9hWhsg=;
 b=VeScpkmFUNrYQxHXm+CFImou6Z8AwLpFS2PMU5+e5jJKLwUxPXIs0vKdf43Xs16OzriRxkK0yNi7oQo3On5enaNCK2V50yqUYIvQJcnqa9LJDWg0DisaNLE4ioc6C41qDcMfGtNodPgEDult5mCpi/Nev78TKDgiZPucXJfcM8c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayankuma@amd.com>, "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Henry Wang
	<Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Jaxson Han
	<Jaxson.Han@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Topic: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Thread-Index: AQHY3vmtdKYr9F2nyUuznJvSQYcvHq4OMlaAgAEAmYCAAyG8AIAACRAA
Date: Mon, 17 Oct 2022 09:50:09 +0000
Message-ID: <5A261DDB-992F-4290-BC0C-05B8508896DC@arm.com>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <alpine.DEB.2.22.394.2210141109400.3690179@ubuntu-linux-20-04-desktop>
 <e5e337cc-9478-e4d5-e7ce-71138817f56e@xen.org>
 <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
In-Reply-To: <2FED929A-C718-468B-B385-5C80CEED0664@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB7763:EE_|AM7EUR03FT005:EE_|DB3PR08MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: 794d9059-3e04-4e8d-2a79-08dab0250473
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aV3PAPEmBax1ji+ZDASmiZ+61QCc6zQG2t9x6be5xnz+YSRf/lVCBrNmBIUaQtEOxn98/8m8Vlb8iqVGHzFR/OPywdPH6Q9Jx+QZX0qOQfoBl6ZP7pCBULeYizzV/pr9DwSFSpDNjMME+MLIyimcd2AZTlNKv5NyztgqxF4ykKU4R1T9lqO4TkWud0Tl1hQX9DqzGm45vF86qTlx+U8U9a88PMzUGsT0FjBz8ZHM4KuHaeNYZo22HaBTSwA7tsaKJiSvRp7N4QbF1ZJoi1nystmq6PqNbTYDetg4tj0LmOowN/0MIfKe9OukMXxLeFL4e2M/l6o5e/2ETAJf8Rf8HDK9/tKN/RLLJqKINc17pfw8Hd1PdZiY/SM6tyKvUCWc6Tu81MB87QedyqqUaKBBJPDBsqG1et7bUArTchY3tzk1rGWQNddZnnpQfdm3Qh67gVtXWW4ZqI2pTXz8euoqAf5K2NuO17lq/25Zarfu8R0D9WGzbE5K0P07YdW59A8ZmvClb8K1dq2qMOyFhC038beqyKhua2c6cIFhsaQXGmoeNjeCzQf+enGaDAPXwDoKv49lfdPn16M85VrbgVtSFViF/nfGiFXElb1bJTHSh9HZ9HSeB3dBJobbHfYLh1/QD9LP2oiatYCmIIXdDAS4dOtTY+hj1pqpbxckbWNtlKl5f32Ofb9jFHzkkDUbuO06DoxCvh1oKXsdsRxoq5d/l0z1kl0LAczv3AyED2RoZaapTRzai0mNBnaZsLA5piQSjSKqJNqvlOWtXrDqENm0aZLzYro2Mv9GvLCuK7EDWRSvUeSwDc+/TsE1ZlHXzc28H4MGiU1qkwjHkyr4860RIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(66899015)(6506007)(36756003)(2906002)(33656002)(8936002)(5660300002)(53546011)(86362001)(186003)(6512007)(26005)(41300700001)(38070700005)(2616005)(478600001)(4326008)(8676002)(64756008)(66446008)(6486002)(966005)(71200400001)(66946007)(76116006)(66476007)(66556008)(83380400001)(91956017)(38100700002)(6916009)(54906003)(122000001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9EA681C8C0FFBF4E871FD70B1F2D3225@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7763
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2452fe9-e34a-4f9d-e18d-08dab024fa6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0yTW4KTZdigHTP/O0kfFKjoPbkL3SdsIY+/yuLJeRrRBMKw0liyWQqwdBNICRYqc4jJyGcyOQ9ZRlFpZSbo/f5Fu+k6XN6ZnPYut+fdGMGaZQv3aUnt5Ti/a5CyMJYxtofof4FQ8md8dXl+IYjoIbpmIPd9yIxvh9iRdGlTDQSLG56Bs4O3+kMWrpIb0hDm/kKNF6scyAJCcaY/e7FyXZME7ijUxjSC+q/7VEfjhwq3cYxaTO/T+6rGCaVL5mMjqLaiMlMSZ2PiRrjIUD9mHyp4ApaW+T+M/MSQPj5vvALVXoDvhPQmbKGJZvK1P+PJ7SHfsgNb3ZOZ3Bs7Nq0TNAsZvDdiPQG0yZU8Kqckqv7BgArz3Kb1bRrDUz0o7w6b2VGjrF/T1xfu9BI+AOfSYQiDS3+8pKZEMSxNCSPsWpFqopVTwO+2SpEaPWBwCTGD6mch+U87nRn+JS/kDGT9ve4EKMwQwq4TMpeuK19u2NAhBEgOVHMie/SPWek/EUlUSeY5rvMEt2bwWoMjXpjA8ijPP6A30SlY7RevucqxMXu/jISq5/DSJhrNVnrTb5FfH3/OTbQRUWlgpL1mPWF9wX7gu4baqyKRf5s8Ss9Yu5CmfceZJsQ5VXf8lYNEwcP9dbw48Gbb0WOQvFZSRGG2HdgAlp6pOh+xu2vXZ/zWpEb+ww8VLbClz3xAAGP6VW4LwWfBNGOMMVZxNnSutn5NtKg8s5GrcsX9weswzXuKhk6JYpj69yCcTiqX9dLA1WOZujOpxHuMsvLbrIaB9+58vGg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(46966006)(36840700001)(66899015)(36756003)(33656002)(86362001)(2906002)(5660300002)(82740400003)(336012)(2616005)(186003)(47076005)(81166007)(356005)(83380400001)(26005)(53546011)(6506007)(316002)(966005)(478600001)(6512007)(54906003)(6486002)(70586007)(70206006)(8936002)(36860700001)(40480700001)(82310400005)(6862004)(41300700001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:50:26.0656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794d9059-3e04-4e8d-2a79-08dab0250473
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8963



> On 17 Oct 2022, at 10:17, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi,
>=20
>> On 15 Oct 2022, at 10:28, Julien Grall <julien@xen.org> wrote:
>>=20
>> Hi Stefano,
>>=20
>> On 14/10/2022 19:09, Stefano Stabellini wrote:
>>> On Thu, 13 Oct 2022, Ayan Kumar Halder wrote:
>>>> Hi Arm mantainers/Folks,
>>>>=20
>>>> Please refer to the discussion
>>>> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
>>>>=20
>>>> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed vi=
rtual
>>>> platform.
>>>>=20
>>>> Zephyr is trying to read GICR_TYPER which is a 64 bit register using l=
drd
>>>> instruction.
>>>>=20
>>>> As GICR is emulated by Xen, so this instruction gets trapped with HSR =
=3D
>>>> 0x9200000c.
>>>>=20
>>>> As ISV is 0, so Xen cannot emulate this instruction.
>>>>=20
>>>> The proposed solution is to use two sys_read32() on GICR_TYPER to retu=
rn the
>>>> lower and upper 32 bits.
>>>>=20
>>>> With this, HSR =3D 0x9383 000c, ISV=3D1 so ISS is valid.
>>> Hi all,
>>> I wanted to take a step back on this issue before we jump into the
>>> details.
>>> Differently from other instructions we discussed in the past, strd and =
ldrd
>>> are not deprecated and are not "unusual corner cases". There is no
>>> statements such as "please don't use this" on the ARM ARM. If I were to
>>> write an register read/write function in assembly for an RTOS, it would
>>> be reasonable to use them.
>>=20
>> Just to be clear it is fine to use the ldrd/strd for accessing non MMIO =
area. The problem comes with MMIO access because they can be emulated by th=
e hypervisor and we don't have the syndrome. At the moment, this is only a =
problem when accessing some of the GICv3 (including ITS) registers.
>>=20
>>> So, I struggle to see how we'll be able to deal with all the possible
>>> RTOSes out there that might have them in the code. We can fix Zephyr,
>>> but what about FreeRTOS, ThreadX and the proprietary ones (VxWorks,
>>> etc.)?
>>=20
>> This is not an Xen issue but architecture issue. The RTOSes will face th=
e exact same issue on any hypervisors unless they decided to decode the ins=
truction.
>>=20
>> As we discussed before decoding an instruction correctly is quite diffic=
ult to do (what we have in Xen for pos-increment store/load is just a band-=
aid). So I would expect the other hypervisors to have made the decision to =
not implement it. AFAIK KVM doesn't suppor them,
>> Note that looking at ID_ISAR2, it seems that ldrd/strd is technically op=
tional. Therefore, the RTOS would have to assume it is targeting a processo=
r that supports them.
>>=20
>>> Unless we can get ARM to issue a clear guidance that strd and ldrd are
>>> deprecated,=20
>>=20
>> Arm Arm cannot say that because ldrd/strd are necessary to modify the LP=
AE page-tables atomically. What we need to know is which instructions can b=
e allowed on MMIO accesses.
>=20
> Definitely this is something that arm arm cannot fully answer as it is al=
so down to the full platform. MMIO accesses are going out of the CPU and he=
nce wether or not 64bit MMIO accesses can be properly done might also depen=
d on the bus or the IP on the other side (some peripherals might just refus=
e 64bit accesses or some bus might only be 32bit so the operations would ne=
ed to be divided).
>=20
>>=20
>> I think I already raised that when Ayan added decoding for post-incremen=
t instructions. There are plenty of instructions (or combinations) that doe=
sn't provide a syndrome and yet the processor doesn't prevent anyone to use=
 them on MMIO.
>>=20
>> I was worry we are going to have to continue to decode instructions in a=
 non-compliant way in Xen just to please a few RTOs that may not even run a=
nywhere else.
>>=20
>> This would also reduce our leverage to request a change in the RTOes or =
the Arm Arm (maybe there is already a statement I haven't spotted) because =
Xen will already (badly) support the instruction.
>=20
> Going back on the ID_ISAR2, if Xen is properly setting the value seen by =
the guests, there is not reason for us to actually emulate those instructio=
ns.

We need those instructions for page table access and it is mandatory to sup=
port that on armv8, so not the solution definitely.

> The emulation code inside Xen cost a lot in matter of lines of code and w=
ould need a lot of testing (which is missing at the moment).
> So as we have a standard way to inform the guest that this is not support=
ed, we should stick to that.
>=20
>>=20
>>> I think it would be better to attempt to decode them rather
>>> than just fail. I don't like to have this kind of code in Xen, but I
>>> don't see a way to support R52s without it.
>> That's not specific to R52. This is anyone using GICv3 on Arm32 core.
>=20
> Agree.
>=20
>>=20
>>> That said, of course if Zephyr was to use two 32-bit reads instead of
>>> one 64-bit read, it would be better for Xen. And we have more important
>>> things to deal with right now in terms of R52 support (it is not even
>>> upstream yet). So it is totally fine to change Zephyr and move forward
>>> for now.
>>> But medium term it doesn't seem to me that we can get away without a
>>> solution in Xen for this (or a change in the ARM ARM).
>>=20
>> See above. This is an architecture problem and we should discuss with Ar=
m first before continuing to add more decoding in Xen.
>=20
> I will discuss it internally to have an answer but I think that the answe=
r cannot only come from Arm as there are for sure hardware implementations =
that cannot support this, as explain before.
>=20
> Cheers
> Bertrand
>=20
>>=20
>> Cheers,
>>=20
>> --=20
>> Julien Grall


