Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AFKBFmS12k2PwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:49:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F213C9DCA
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277156.1562417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnt3-000567-Il; Thu, 09 Apr 2026 11:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277156.1562417; Thu, 09 Apr 2026 11:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnt3-00054B-G2; Thu, 09 Apr 2026 11:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1277156;
 Thu, 09 Apr 2026 11:49:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wAnt1-00053r-It
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:49:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnt0-00C4s7-RY
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:49:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69d79233-e002-0a2a0a5209dd-0a2a450bcba4-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:49:26 +0200
Received: from [40.107.208.45]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69d79244-bca8-0a2a450b0019-286bd02d8a66-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:49:26 +0200
Received: from CH5PR05CA0007.namprd05.prod.outlook.com (2603:10b6:610:1f0::12)
 by CY1PR12MB9582.namprd12.prod.outlook.com (2603:10b6:930:fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:49:20 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::a7) by CH5PR05CA0007.outlook.office365.com
 (2603:10b6:610:1f0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Thu,
 9 Apr 2026 11:49:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:49:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 06:49:19 -0500
Received: from [10.71.193.38] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 06:49:18 -0500
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
 b=rbjbfyNqo9hZIar3dgLzW/ktfdYYk9W3TBQDwPWnlBlYo+fz/Kl2zwdrI7Z2fkbgmydnfFfJlzaAoV9jL/7GsKYnh2kf2OPAGo5/W5JnYpoa6fo3qdgJQoYDbzkYvRs/mf0J/yc01jSgaYFcRDYki5LaqBM9roVJcEhY3ENAlVKCf1l6ezjG/GCdH/nTQfWbiJWf6aIPOFStmWX+hmRUJ7cqJSrR3yNqpb37YQqjo7h97mF0yEvgKIND/71cfvgd2h1hvgmVAb7nkblZvFsTz0Q3xu5WMzJasXR1TcDn63R2Drh6Or/RzsDXPQ8pGJM4vbuR6ZRfqn0Jfjupl76BJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joPB6XMzDR5Z7gT8RHe0PBANTX03DUQl03JUlvE+GIM=;
 b=pq/ePJgVehMZ8BfpRYLtv4DqaDRT6i+a4B1+SreTlmo9qlh8WHeTelODKpOlV+BpgGK3hED6e7A1auRA3Dr4JLsIc+2JHFI6W/VEIJqsPgA00VpDC4wuJa+TjEu8AV6Rdg25JdkzkP0x3/ZlCEBgfJXDFqVU1lgnbbCc9Yoh2aUPegwtda72jVQL6SczDmnDRXuR3h24unH2C90j081WnLji9Foxe5tDCvVHimK3ir7SJLU/pWWz1r+AqLmjawQOrk5G+DVDxuzQiIQAvcZuVHvm000j90SserXG5ELgjAlUhv9rxY4IeI0xZcPAhyKNsOk6Y77GMLtBSXGvj4DTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joPB6XMzDR5Z7gT8RHe0PBANTX03DUQl03JUlvE+GIM=;
 b=ar3brCrQ+A+TZizy0dVGFi4CFJ1Q5UDjHCNx8T4SlIA9EfbVd/jcEhCXiJ6za2F7F/doyE4rHiMRRPfqUGl0y7/NNaeofnjJ+vEXHu8WM9KIutu6fK5NaslnTzd1L7tmQLTJN8jJL/kiOmtGharHxbh+Sn6LuvrZ0EZJfzUsQKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a63da4a7-9e0a-494f-a29d-72192e3a8e55@amd.com>
Date: Thu, 9 Apr 2026 12:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm: Fix off-by-one in iomem_deny_access() calls
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-2-michal.orzel@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260409113934.197619-2-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CY1PR12MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 809d6438-0505-438f-6bc4-08de962e094b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L98HfzrB6gZtyuGSCMGJhjE8IHLpJVTsh86Fo3fVZVDYLlBsm6k7JLyWSQoataJKmyR7K6DDxknQbp9r1arPdBbRSE57mD9BrVrNAzGGH+CM9A6Q8dI3TATZisGha5+jUSVXiPt+1hz4kJKt7z4wZSZLuck8FT5SvChpZNaTOngfuwd72CagkwWVyHMuJBvTG6Q5onzxU/ZteZOKSJXUGLGy4Q7UL/7CbRaNHOaw9w0ajnQnesF5JE86S5NoPFrD032Uj93p/SmOXAnAw7rB42JMtr+oyPPUieUbKaBp9oCruFtAgYZSiAOZ+432jNkABzyji/kjNAsHpG+ChqRkmn6jJ+oofV+YVsZpc1TUKOXuD7L6M/Mgn44bWnQn3ydjJdOWPPCU0eSS87rAK74JeUrO2sBvkIHMAAoVdGPJRnQqMgd8UgK7mlt3k3oYQPG/jth0XUqkAJWDYEBXYtPFzIPVntciqi8Mqu2wYHSjGzMOkm4gOdvPGMeWIx84HV7/PlpZv7W4509VYUo0L5kZw5Pe8VCmhTxOnct7GN7dHHgYp2fMY0D2jS0bjspdVLSVRA7lmqu67Orgocn24mXb6DuYvG2kcucNhzgd4E0XZEVy4CDR5M0PIAcpqmYXrFnosWxOhWVJS5at4TTV3BAFsLYWUf5sasARU4fN/7ZCTVhi/t98o9UvQWn/NJWc9LVj9J+i0mjtVeLLwPZK4ROFhsR1Vddp+F/V8+yz9rmpJDwg4gmWF9nDFuGp3PABsp52Kf5jMe/OAYtP68UVism2Ig==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LNE1NgjSGVQ9xLQm19ZhCEZ3LaDIdJbIMxMJG1Kfx5R4nEt0GyswsdLNwFAFzhoc8wVi1+HdrED+Daex9MgCy0wWs/YYju4LAW5VgroqiCVeqPH0rW1dZL5rO+e0SVNF4x2+HtP5aZm2oNGiA9D2q5IxSbvR2cg+odrN/agJ9QX/DX/HvydXAEO76XAsG874C4627T7Mitq53cxD/6Xv4yjAVVGOVokkIRjNmeuZCtkXoou7yCYKxw4MavtdIHmkicvwqpT3rW1NT7io9Dnw32xGN1qd5NiaV7kCUvcVYfdph284eCWb3XT4SXdRrvt9O9dTCOc+yGQPtGl33T4EL1OqANFooiJO8ga/fXTqVBR/w8ChYyJ5+v4IyknoscIMEODQVXV1X0PRTUsnpNr4upZBnsds6u7jXrbj4JfKf5vp3xCQR4ldY2SThz8B5xQ1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:49:20.0845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 809d6438-0505-438f-6bc4-08de962e094b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9582
X-purgate-ID: tlsNG-42698a/1775735366-EE3542A1-C5046BC6/0/0
X-purgate-type: clean
X-purgate-size: 5438
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 74F213C9DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Apologies if my review is weird, I have been looking into too much of 
safety stuff.

On 09/04/2026 12:39, Michal Orzel wrote:
> iomem_deny_access() wraps rangeset_remove_range() which takes inclusive
> endpoints.  All call sites in the GIC and ACPI code pass 'mfn + nr' (or
> 'mfn + 1' for single-page regions) as the end parameter, which causes
> one extra page beyond each region to be denied.
>
> For single-page regions, use 'mfn' as the end (denying exactly one page).
> For all multi-page regions, use 'mfn + nr - 1'.

Just reading this and the change below, it seems that the issue was 
caught while doing some boundary value analysis. In this specific case, 
it seems the boundary values were set incorrectly.

Can you explain a bit more (the boundary/edge cases) in the commit 
message and give some reference to test (can be even a different repo or 
something) on how you caught this and verified it to be correct ?

We can keep this test somewhere (and tag it to the commit) even if such 
tests does not make sense to be upstreamed.

- Ayan

>
> This matches the correct pattern used elsewhere, e.g. in device.c.
>
> Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GIC regions")
> Fixes: 66158be465 ("ARM: ITS: Deny hardware domain access to ITS")
> Fixes: 97e9875646 ("arm/acpi: Permit MMIO access of Xen unused devices for Dom0")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/acpi/domain_build.c | 2 +-
>   xen/arch/arm/gic-v2.c            | 8 ++++----
>   xen/arch/arm/gic-v3-its.c        | 2 +-
>   xen/arch/arm/gic-v3.c            | 8 ++++----
>   4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 5a117001ef11..249d899c3337 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -48,7 +48,7 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>       {
>           mfn = spcr->serial_port.address >> PAGE_SHIFT;
>           /* Deny MMIO access for UART */
> -        rc = iomem_deny_access(d, mfn, mfn + 1);
> +        rc = iomem_deny_access(d, mfn, mfn);
>           if ( rc )
>               return rc;
>       }
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d05d..014f9559673b 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1079,23 +1079,23 @@ static int gicv2_iomem_deny_access(struct domain *d)
>       unsigned long mfn, nr;
>   
>       mfn = dbase >> PAGE_SHIFT;
> -    rc = iomem_deny_access(d, mfn, mfn + 1);
> +    rc = iomem_deny_access(d, mfn, mfn);
>       if ( rc )
>           return rc;
>   
>       mfn = hbase >> PAGE_SHIFT;
> -    rc = iomem_deny_access(d, mfn, mfn + 1);
> +    rc = iomem_deny_access(d, mfn, mfn);
>       if ( rc )
>           return rc;
>   
>       mfn = cbase >> PAGE_SHIFT;
>       nr = DIV_ROUND_UP(csize, PAGE_SIZE);
> -    rc = iomem_deny_access(d, mfn, mfn + nr);
> +    rc = iomem_deny_access(d, mfn, mfn + nr - 1);
>       if ( rc )
>           return rc;
>   
>       mfn = vbase >> PAGE_SHIFT;
> -    return iomem_deny_access(d, mfn, mfn + nr);
> +    return iomem_deny_access(d, mfn, mfn + nr - 1);
>   }
>   
>   #ifdef CONFIG_ACPI
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 9ba068c46fcb..e38aa8711744 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -1009,7 +1009,7 @@ int gicv3_its_deny_access(struct domain *d)
>       {
>           mfn = paddr_to_pfn(its_data->addr);
>           nr = PFN_UP(its_data->size);
> -        rc = iomem_deny_access(d, mfn, mfn + nr);
> +        rc = iomem_deny_access(d, mfn, mfn + nr - 1);
>           if ( rc )
>           {
>               printk("iomem_deny_access failed for %lx:%lx \r\n", mfn, nr);
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16ab..b3e104ea4ad0 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1602,7 +1602,7 @@ static int gicv3_iomem_deny_access(struct domain *d)
>   
>       mfn = dbase >> PAGE_SHIFT;
>       nr = PFN_UP(SZ_64K);
> -    rc = iomem_deny_access(d, mfn, mfn + nr);
> +    rc = iomem_deny_access(d, mfn, mfn + nr - 1);
>       if ( rc )
>           return rc;
>   
> @@ -1614,7 +1614,7 @@ static int gicv3_iomem_deny_access(struct domain *d)
>       {
>           mfn = gicv3.rdist_regions[i].base >> PAGE_SHIFT;
>           nr = PFN_UP(gicv3.rdist_regions[i].size);
> -        rc = iomem_deny_access(d, mfn, mfn + nr);
> +        rc = iomem_deny_access(d, mfn, mfn + nr - 1);
>           if ( rc )
>               return rc;
>       }
> @@ -1623,7 +1623,7 @@ static int gicv3_iomem_deny_access(struct domain *d)
>       {
>           mfn = cbase >> PAGE_SHIFT;
>           nr = PFN_UP(csize);
> -        rc = iomem_deny_access(d, mfn, mfn + nr);
> +        rc = iomem_deny_access(d, mfn, mfn + nr - 1);
>           if ( rc )
>               return rc;
>       }
> @@ -1632,7 +1632,7 @@ static int gicv3_iomem_deny_access(struct domain *d)
>       {
>           mfn = vbase >> PAGE_SHIFT;
>           nr = PFN_UP(csize);
> -        return iomem_deny_access(d, mfn, mfn + nr);
> +        return iomem_deny_access(d, mfn, mfn + nr - 1);
>       }
>   
>       return 0;

