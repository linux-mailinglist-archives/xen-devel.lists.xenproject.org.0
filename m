Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB208896DA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 10:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697613.1088520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogAg-000896-L8; Mon, 25 Mar 2024 08:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697613.1088520; Mon, 25 Mar 2024 08:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rogAg-00085t-Hi; Mon, 25 Mar 2024 08:59:10 +0000
Received: by outflank-mailman (input) for mailman id 697613;
 Mon, 25 Mar 2024 08:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuX/=K7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rogAf-00085V-3g
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 08:59:09 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eea26485-ea85-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 09:59:06 +0100 (CET)
Received: from DM5PR07CA0111.namprd07.prod.outlook.com (2603:10b6:4:ae::40) by
 PH0PR12MB7983.namprd12.prod.outlook.com (2603:10b6:510:28e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Mon, 25 Mar 2024 08:59:02 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:4:ae:cafe::c7) by DM5PR07CA0111.outlook.office365.com
 (2603:10b6:4:ae::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 08:59:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.0 via Frontend Transport; Mon, 25 Mar 2024 08:59:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 03:59:01 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 03:58:59 -0500
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
X-Inumbo-ID: eea26485-ea85-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfNgrUG9g+DHdtC0T5DQXbJ3LSeO8pAvFhkgmlLedlxs9NJ9pln+fh3EXkw3FcBSLFRutR+WstNcQqY62ZNFV5pb1OQ9M+04CEFOuwedrHKvsGlMaAtxAuI9nyxVret1dnX057idt4A0gXHrecjw6hnbjRbXwMLlsATsgSN3Y/SNnYBWL57zWo3wJeYPIgYvdBl7cwoLhsWkwqEmbU5vaIC80/uULqMOJ3sTNeYTs61mCWIbsTTvv21pRmH2Shy8pxrrnLygnOJ3Guh66XoiPcdknnrNruhRd4HNZz0izdgTroCKpp0JbChpiWaKR6rb6XOUHFAnKcLbdjTuyRvjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4H9KjaFfUVYMideOenLmn3bhD7kmltbtFAZOlSa/Co=;
 b=fI3LVZH/2gJaNH4N6WnhkS2MMZO4vZVlPOcRXZMF2DEsEZ+dcT3K+7P5bRHUa8vwX6iy/qxptgWoJQVCL80aW1dVCaS1Y8QckHspWkBX57moZsUttFYILl/3XmeL0basi78tp/JCzpsYljZ6RoMeiHyPBEe5Hft9XCuZmp38dzkNgRHgA0mQYOxSZCfh+3kEz34VCsqZSiHM/1Znol0w/MDOSQh2g/ARqnVs/zeAbolBF0+tU2UClZbFRLMHbPq4h5PRCM72bPHs3UHWI3rGuEOKq29XvnyhcNtt4YlTzqVh+vHIl9gCq69aXyua9pLr2JauL5OVXd8NIUxWvnNblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4H9KjaFfUVYMideOenLmn3bhD7kmltbtFAZOlSa/Co=;
 b=HRLF+7Y8FFwYbIvccAbNVHWRoyd1dMRLFzazE2JCC7NTmB8y2hrZyD/uhrFXAsspLtkzdJ4/zy/mO1H0Fh6Jha59NBngEPTbPrx2qiDsRVxR/mj5S01fsbRZd7XR3fT9IxNorXZmP/pyxjXxmEo5IAJEnlCg/CuYHt4mSKzqQ8M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3a9e8323-9eb3-4c06-9ef1-e85c8bf2aefd@amd.com>
Date: Mon, 25 Mar 2024 09:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] xen/arm: List static shared memory regions as
 /memory nodes
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-12-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-12-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|PH0PR12MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a2c145-5acd-43df-81d1-08dc4ca9d124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qKRGCT3ZiIJXc4htL89UCzEaz6SchndALC3lFhkNwcptL10gx/YtqTOHor2kC0cejGTgwcrx+m4i/SPciLk7+e+gZIi3Kz2odCsaEgJyLU+ttOnQn5N9uiuq3JsubaI0ggcFUufUKgRNCE2ucI9rvXrZfqBPcyHLU8VUZ8G7317kGJ5UHmgC1pfDuvZUkyAn902DVOe5VIcoj0qSqLGozKCbxVSYYmrlb6Xq7rW78ofsMcur33EYCc08fQmIHJTzpqI9C/Kf+DD7qG27bGYWF6a9LAxPZBdV96zOya8A5ZvzYsF9KQ1WDvooTAnpmQYB2D+7J5kB6b8jdhcwNP0z4fDFnpN1pbAOy7IgyUjwfHSOlI86T1OGzQmxPl3cZljAbmpxdAyZpUm1PUWWF3zhdIQiH/0R6UklGDXBuuj//DG2dxNAxKyBLmQayMxpmqRZovMtlOakpxm2+FizTZlFI2osktTCeKHR9UswIUu2VvpufQvx9wro5js4hhqGlf9+oNrIrVEyuDWvzL1iBrTSufMZ392i+KvTdDyo7EyBWoPJic3G1hM9xt0QAzGaEgw/Xazz8/gQkvBfl/ugVqbmIBvS5k2I1kthvRT7dkSc8HJvzv4x8teqcT/s1j9R65pPJe7dL1GzPswyR2lQUBFN96b1Uwnv1WvJf5zYn7iI9k5EdSghozrwcH7n6FU1c3sPwZUWWgyUeGQvDYSs5XqtFNr21HG2of/aGS/kxfSp7ir42+FkB+PSrW0hPdArbl2J
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 08:59:02.1157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a2c145-5acd-43df-81d1-08dc4ca9d124
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7983

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> Currently Xen is not exporting the static shared memory regions
> to the device tree as /memory node, this commit is fixing this
> issue.
Looking at the implementation, you will always call make_shm_memory_node() twice. For the first
time, to create /memory node and for the second time to create entry under /reserved-memory. Also,
you will create a separate /memory node for every single shmem region instead of combining them
in a single /memory region like make_memory_node() would do. Can't we reuse this function for simplicity?

Also, afaict it is not forbidden to specify shmem range (correct me if I'm wrong), where guest address will be
within with RAM allocated by Xen (e.g. GPA RAM range 0x40000000 - 0x60000000 and shmem is at 0x50000000). In this case,
you would create yet another /memory node that would result in overlap (i.e. more than one /memory node specifying the same range).

~Michal

