Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKljIxL02GlJkAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:58:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9313D7CB0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279064.1563684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBBRN-0001Mt-OK; Fri, 10 Apr 2026 12:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279064.1563684; Fri, 10 Apr 2026 12:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBBRN-0001KF-Lb; Fri, 10 Apr 2026 12:58:29 +0000
Received: by outflank-mailman (input) for mailman id 1279064;
 Fri, 10 Apr 2026 12:58:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wBBRL-0001Js-RH
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:58:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBBRJ-00CVQa-Hf
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:58:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8f3e9-bab6-0a2a0a5309dd-0a2a450a9c12-18
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:58:26 +0200
Received: from [52.101.193.15]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8f3f1-ee98-0a2a450a0019-3465c10f2e6f-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:58:26 +0200
Received: from SJ2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:a03:505::16)
 by CY1PR12MB9559.namprd12.prod.outlook.com (2603:10b6:930:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 12:58:21 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::ab) by SJ2PR07CA0016.outlook.office365.com
 (2603:10b6:a03:505::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 12:58:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 12:58:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 07:58:20 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 10 Apr
 2026 07:58:20 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 10 Apr 2026 07:58:20 -0500
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
 b=MBrsyfbNjUQfUlsQqHBL4G688mVg2s30LgWM0tnzT4vEGsNEF/oMV263DX383sKauIUtLbj3bh7QvkOcOnvejNITm2ADIk/ux1GK++u8aa/+gplOBscRqv/bPBjolyTrEp6lnh435DrJc23JEAdsRdceWnkbasPD7JL/AWjsoxYMNmUDrfnCPwct0hfXcKIDzt11SnTCnowzUqeTR9S4/Wl8ckrwjwyfW28Qx1ccZMa45IKquvG5OrAF9iKZXa5gMHyzF7D/Lw7paBe9VnSBpGKr+baQlxIokdVR0UYmsJRFJ7UmKutgPBU9H5qwLnx/XwveOH6SZk5IpC1sW364PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzLSHPbl9KU89iufjOJ85QHvSN22Wl8jKZxhnXFhNcQ=;
 b=oTAwbyomxqX7q0wAFbcDoX+4vvVq1V8oAOSAFrJVTAGYbfU33aM+Bmsn9XR5rVTTSTicRNTmnVqkRrOw2Kgu5oRlnkA7PnHc1CBT/tEhxfSBbFH094zGv8yKHLMNO0O1UYY1M5nQhgUQF7oPdN5fVe3JQnC5463t6pVtOocRJkyVv9fUoJ5cFiBbqyBvwk6GvVBRq0ptOPZ6pYWIK6jkFDKVdbufg3XTYohnVqXCRhxVOwfyaUKZjRajo9lDP1+ZUw7pkNI+h5JJ8ypHRxxS2P34u0MdUCxd4V9Fxr55zTj5pkeqt5iKWOHVPsng3u+d9xhHC/oI2mMdWwldpIOAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzLSHPbl9KU89iufjOJ85QHvSN22Wl8jKZxhnXFhNcQ=;
 b=q+04cJy65BgarDxGmFpi73P9MWAjYn04yG4kGlY2tklqyH7VvLLrzfv1FbVXNsGuA5Mwc7RtV5G15LFzLd5CdeRrfD68PLmXDMKZc8glMuCASleGZOT37AmqcJRfLq9cNEsYqrCOJZ8jZJhgQFfAqu/3oTJQWhm0Io0LA8eVKJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <2ffad2ca-e60d-4cc0-866c-4881544fcc96@amd.com>
Date: Fri, 10 Apr 2026 14:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Potential double-free in Xen dt-overlay attach/remove error
 path
To: Gyujeong Jin <wlsrbwjd7232@gmail.com>, <xen-devel@lists.xenproject.org>
References: <CANrF8CHA1XacwRzNcw3zt0goEV-7in_=vtEYhLxSjwaV62jrTw@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CANrF8CHA1XacwRzNcw3zt0goEV-7in_=vtEYhLxSjwaV62jrTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|CY1PR12MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: 539da364-68c7-44cb-26d0-08de9700d80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gSS8A32tt3Z4wmcFGYynsOA6noy6QZJclIxRXz4ydSMPnzZaLbAnKE0dtS8YvdF/NZKAzgKAi0ZKeB1oLO+Kgx4pAz/TF7so+U/wnIGrjss6L0JFgVXq6q7P2KlopwFznjBLY2y1ch9m3EMfPwLzcNpPAAF8uTmn0DfzQ8zOxVBxklaCKA6cA3X8mHoR6z4ufkln9aQhiww1A/cbaUCcP0DwbVU4DuwX4ng4lSYShntd1GA4ly6nbtZ6trY7fpaXiF06p6ftZsfXOE2Fts45yAkxJoJKH8mQMB3NoPdM6f0ByFY8LeFP1HKEvVEXnev/c4xKkvZ1dXv4G9gLb9g6h+Kj2ZfyyzJm8/ejKBU68TMhm9aqukaxfkEGvDUQcC15ibMXT6T+XaB49+cCL0OVKZCGO2QvT2Ff6OOcUva9/ksQWlrlUyCEOjKS2ufntS/ZJSnTYGukIaSBTMK/4rLd5VT4/At6TPxXmWeN6QVg7Nro7dAlgNK8/ReGM65tqcZjtb8J28RLLc9mi6/GADU05IRvyj5p82ITRpX6NvsKsbtNhKjoATfX5bMoIIItAAWOGQI0aDLcNHa3Q0k0nu2+TH+waXBwn3fzt5a064BMc+XmXERvy81hgNH2Wj/0BfTBe2MJIys+o2C2S6mTH5NwqYxSeoZIZxYLnUCPOiNxYljmsfv6Jn2sl0LxfT2KQ4SUxxFqa3f9WaWspFEaRo5/SiEnQQmau/DanVS82txwvkPx62viS0V1NRc9WMXhd7q+AKu0bE9kJ6tFF3UQ0tAoXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LczEvHB06v6vnxUuWzQ7sYwj2hNXvVnh9Og/4nBHEZYaGeKm4RgR1LDtQrmhUDsCL2np3HTRX9SZqPKDfRYgFwT2NMCVYkt8549QHv0OMPiLN0EBWKc5SlaIslr2HhnTlq1HWMrOhEA4yerliXLzVeQupEOMLG8nz8FPYgbe3SJEdo6ODkf+oYjv/ZE0yhi7vG0hkcHY7B3ntZmcb/fvxjZXunlpiZ7NeHcp8Qqu35pl2riBQKVx3eTwlxONpzc3fyHETIeJO9eqN5q9bknREdykgo6It+IdHqUrZQPtUJKl2q7hqM6DD50+RHJ2Lu3we2wMYPt1Cn2INU0Q2zmhophRDA/piah9CQ9AMlcgm1jLXk/bQD+PwKSnmbqrlfExHLzHFf/PFgdtF0j+MrACxkde7Xj0xvSNSyVSFZDWFimXKkb0XL2huW0O1KnpRIFD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:58:21.2957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539da364-68c7-44cb-26d0-08de9700d80e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9559
X-purgate-ID: tlsNG-4011c0/1775825906-BF5460B1-DF38D3FA/0/0
X-purgate-type: clean
X-purgate-size: 3893
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
	FORGED_RECIPIENTS(0.00)[m:wlsrbwjd7232@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,aka.ms:url]
X-Rspamd-Queue-Id: DD9313D7CB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Thanks for the report.

I will try to book some time next week to investigate the issues. Our DTBO
feature at AMD diverged a bit from the upstream one, so I already planned to do
some work here but as always there are tasks of a higher priority.

~Michal

On 09/04/2026 23:28, Gyujeong Jin wrote:
> 	
> You don't often get email from wlsrbwjd7232@gmail.com. Learn why this is
> important <https://aka.ms/LearnAboutSenderIdentification>
> 	
> 
> Hello Team, I was advised to report this issue in this way because dt-overlay is
> currently experimental and not security supported.
> 
> I would like to report a potential memory safety issue in Xen related to the
> Device Tree overlay handling logic.
> 
> --------------------------------------------------------------------------------
> 
> 
>     Problem Description
> 
> A double-free / use-after-free condition may occur in the dt-overlay handling
> path when an overlay attachment fails and the same overlay is later removed.
> 
> The issue arises because rangeset objects are freed on the failure path of
> handle_attach_overlay_nodes(), but the corresponding pointers are not cleared.
> Subsequently, handle_remove_overlay_nodes() may operate on these stale pointers,
> leading to a second free.
> 
> 
>       Affected Component
> 
>   * Xen ARM
>   * Device Tree overlay subsystem
>   * File: xen/common/device-tree/dt-overlay.c
> 
> Relevant functions:
> 
>   * handle_attach_overlay_nodes()
>   * handle_remove_overlay_nodes()
> 
> 
>       Impact
> 
> This issue may lead to:
> 
>   * Double-free of rangeset structures
>   * Use-after-free when accessing stale pointers
>   * Potential hypervisor crash (DoS)
>   * Possible memory corruption depending on allocator behavior
> 
> Given that this occurs in the hypervisor context, the impact could extend beyond
> a simple crash under certain conditions.
> 
> 
>       Root Cause
> 
> The issue originates from inconsistent memory management between the attach
> failure path and the remove path.
> 
> In handle_attach_overlay_nodes(), the failure path frees rangeset objects:
> 
> |static long handle_attach_overlay_nodes(...) { ... if ( entry )
> { rangeset_destroy(entry->irq_ranges); rangeset_destroy(entry->iomem_ranges); }
> return rc; } |
> 
> However, the corresponding pointers (entry->irq_ranges and entry->iomem_ranges)
> are not set to NULL afterward, leaving dangling pointers in the entry structure.
> 
> Later, in handle_remove_overlay_nodes(), the same fields are used again:
> 
> |static long handle_remove_overlay_nodes(const void *overlay_fdt, uint32_t
> overlay_fdt_size) { ... rc = remove_nodes(entry); ... rangeset_destroy(entry-
>>irq_ranges); rangeset_destroy(entry->iomem_ranges); ... } static int
> remove_nodes(const struct overlay_track *tracker) { /* Remove IRQ access. */ if
> ( tracker->irq_ranges ) { rc = rangeset_consume_ranges(tracker->irq_ranges,
> irq_remove_cb, d); if ( rc ) return rc; } /* Remove mmio access. */ if
> ( tracker->iomem_ranges ) { rc = rangeset_consume_ranges(tracker->iomem_ranges,
> iomem_remove_cb, d); if ( rc ) return rc; } return rc; } |
> 
> Since the pointers were not invalidated after being freed, this leads to:
> 
>   * reuse of freed memory in rangeset_consume_ranges()
>   * double-free in rangeset_destroy()
> 
> This creates a double-free / use-after-free condition.
> 
> 
>       Environment
> 
>   * Xen: 4.22-dev-517-g500ee5fe0f
>   * Platform: Linux (WSL2 environment)
> 
> 
>     Suggested Fix
> 
> After calling rangeset_destroy(), the corresponding pointers should be set to
> NULL to prevent reuse:
> 
> |entry->irq_ranges = NULL; entry->iomem_ranges = NULL; |
> 
> Alternatively, the remove path should defensively check pointer validity.
> 
> Best regards, Gyujeong Jin (Giunash)
> 


