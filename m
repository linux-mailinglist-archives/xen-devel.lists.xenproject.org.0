Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE35H/iX12lNQAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:13:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E73CA394
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277224.1562453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoG7-0003Ms-C0; Thu, 09 Apr 2026 12:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277224.1562453; Thu, 09 Apr 2026 12:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoG7-0003Jr-8i; Thu, 09 Apr 2026 12:13:19 +0000
Received: by outflank-mailman (input) for mailman id 1277224;
 Thu, 09 Apr 2026 12:13:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wAoG5-0003Jl-F8
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:13:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAoG4-00B7ra-Cq
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:13:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69d797d5-2eae-0a2a0a5409dd-0a2a450ccb42-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:13:15 +0200
Received: from [40.93.195.46]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69d797d9-f40c-0a2a450c0019-285dc32e0c5d-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:13:14 +0200
Received: from BL1PR13CA0168.namprd13.prod.outlook.com (2603:10b6:208:2bd::23)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 12:13:08 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2bd:cafe::3f) by BL1PR13CA0168.outlook.office365.com
 (2603:10b6:208:2bd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 12:13:08 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 12:13:07 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 07:13:06 -0500
Received: from [10.71.193.38] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 07:13:05 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0gF3TNVfW6P4Fdu4q8jNxyGy45UlccT4DisTReMKT9J5QaHMUj4ieBckwm2gnSJKqW0KWmn6jo5Vy1pWJdA1XxDOM8HF6HzWX8zn1p5w3Nd6rks9U3CyQDG+BqNEeFZmHjHCoucQeERPlHXrzJEDscIOkMtqjPLVbyi8zR8iseQS3zE6D2uPUrP8oT+ygxJqGeic+mZ5tBN5tQlT3M9aK576hZ2/5ksizfGkXUK1cAcBn0cRHOdcUcmCkIBb+EQhN1V/ic75WUpKDn2BJvqrTh6/rQw2f5AoxHkZdluFM6FnGGkhCe2jRY7/LtIXQkwmVRDksQBp/OVaw+4Z4Jepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG+/s5/VEei2aLts/Afbzd0JRtoLsRnmjhJY3Iuq7bU=;
 b=vCWtUSlmit+zdEAPeR3V6l6vqyiPha9EsXwuExT9PqYYoMCZnikdqyCftyXqzJkxOQ3byMAlsgMYRjhjTJ3XcaJBrNlF4MDT3SXOYY2gF+bZHg+Fj5M9EUnU9ygJa7k175Pt8LpV2ofhq+I2VtLrP1geRiCBo36m/tpHImrdzV2F5TGXpRL++O9k9fjca5snwxbsy48kk/QVOP2KIOtegE750Yk7/gYKZiexEdHaat7o7YPqp8dF3sVMA6MTXJT7123hnFbKmGbjRUKJ//7bBJ2BYscs05GGxkG0/YhL/7rQ8sDCesUp4QeMJrLO//7h1OitL5v1Mq0wbHN8G/w7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG+/s5/VEei2aLts/Afbzd0JRtoLsRnmjhJY3Iuq7bU=;
 b=DCXyTzxp1dbq1XjpLNyiEWH2NO87yStwQ/MCVdDo/FoCSda1wd5EI2+9eo8+dWYQesUNJl1LxDc58xb0N4m+pvhGBD+f/a+M1oluQ78t1gZnFFychlswbL3y/5dPGop5amRM16ZjrXz+Bp9FtwEMRQ4ei3R9GpzKHBuYfCK8yVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0fb39238-2588-4471-aea5-ec8e695adbc6@amd.com>
Date: Thu, 9 Apr 2026 13:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: gic-v3: Use vsize instead of csize for
 virtual CPU interface
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-4-michal.orzel@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260409113934.197619-4-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 454baa88-c36c-49d7-b7ed-08de96315c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4KluF5Lg8i7J8btX3ShWfJucLtnSAUDXLa8DfRgd7zxS9kO9hzxRdzFAKwGTS2i7KvyMKc22TKO73g/g2I/daRJG0IW+fqI+/bMFUxkDZaN+x7JVNsLQx4rT8zxtCL5B92f+HAapyy+/MU2hjSaEbpadlHVDIael824sWMSie9Luom9WpvgV7zEEjt/dsXRlZUPeHLnG8nTIypNbnVbJ+aGCB7muaLHX3JOQZ1PTvFTvwo6z6gUedwXf9M9wDUckkum56DgNUFBar8bOR8AGaakY2xPo0YAtv74u7/Oo4kgHjTut/kTFvwLMaKCeW6tyOgqVyY8SnG90DxJ5Qe/xK3NRdaYQjXJ0FP/l2GkQ9UCyNvWWz/bjSqUUnDTkUIXhT7C2WtqQSAOxEBuQeolfhsd2B3O8XXDAZg4M+HI9CTYelAaPlMeFFWm0IQtzIFM2w7R9/C0mWgcQ/39nBSKGPOldzWYm3IkXteELaZX6i369Et9gE4kwq2RlylwCXnchnyEPo7rQ3PkPf209AOs+8l65sSwKBy3y8d5YmoH5BBIulIBSiDiFBUWMom5tOooXK9ScaTSkbqEw5Ph+8vRDAwnhw14GdiqSper2y/Dk3D/i7fWdlT4b2MrLho37I55uhCxZjJGCPvMTThjQMEpcGu1vasTi0+jSpdQdlYWwFYVW5rj7wu0uSnhitLSU90E8Hk4/Nv1pgPE85FfB8a+RLI6ddE74IRmKgEOhz+7yVvt+s6CmqyeRK2jl8knaOjmABAwIOCG3d+/iHzRaLjrJ0A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VSfhaKwkcDsKVe+UAKDEvCzlkwluSXolhTWfIgAd4FP98wXz6Dqlcr57369biR8N/d7lMDWKOSgm+0dlHD1ST7TshBoGftFgAuAQAuie4d8B5s6ga8MA9oF9IzxRwWxAEcpIv/ZYVZaG7rJIRj9CSgNUQgDlDMKZw1KXJLsm9SDt7UxGHTAiNnZfdDMNpEW3VO4VTwUa9r+PxrkOA48XjZicFEFkaqUoEL56JwZXpZ80+2KRWRVoLBB0Ie3DD/M18vLUHIQfTnwNo/TF9Ej7FDAWH6Gi2omnwOKIdyUC8j46JIllOL01GZEtdIwN1k5LxKMWRoD0o5sROaJAdcZlT5TZ/DzJdrkZpOI+Fphk0RJVMz1fnYBbnucjzvjSLRM8BpHVXRJgkXg1GOl0Qcq8U0C9chzBYjtJMxL6otvWeLXbRjT/LwmZThjWSCG6E1qq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:13:07.8455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 454baa88-c36c-49d7-b7ed-08de96315c46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
X-purgate-ID: tlsNG-d25034/1775736794-FD756A3D-384CEBC3/0/0
X-purgate-type: clean
X-purgate-size: 504
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: E63E73CA394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 09/04/2026 12:39, Michal Orzel wrote:
> gicv3_iomem_deny_access() incorrectly uses csize (physical CPU
> interface size) instead of vsize (virtual CPU interface size) when
> calculating the number of pages to deny for the virtual CPU interface
> region at vbase.
good catch
>
> Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GIC regions")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan


