Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L2dDyJXC2rvFwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 20:14:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3B572135
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 20:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312206.1582365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP2UE-0002DL-QX; Mon, 18 May 2026 18:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312206.1582365; Mon, 18 May 2026 18:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP2UE-0002Ak-Nq; Mon, 18 May 2026 18:14:42 +0000
Received: by outflank-mailman (input) for mailman id 1312206;
 Mon, 18 May 2026 18:14:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wP2UC-0002Ae-HN
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 18:14:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP2UB-009Wj7-Tk
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 20:14:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0b56f9-bab6-0a2a0a5309dd-0a2a4504cf40-20
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 20:14:39 +0200
Received: from [52.101.48.28]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0b570d-1dec-0a2a45040019-3465301ca213-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 20:14:39 +0200
Received: from SA0PR11CA0055.namprd11.prod.outlook.com (2603:10b6:806:d0::30)
 by SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 18:14:32 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::6f) by SA0PR11CA0055.outlook.office365.com
 (2603:10b6:806:d0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 18:14:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 18:14:32 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 13:14:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 13:14:31 -0500
Received: from [10.252.225.139] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 18 May 2026 13:14:28 -0500
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
 b=hIv7wOpp6HfNmmLE/fsknYOpt25VQ2CRvi/ODEvWPxno/2ZDCisIl5QeNhmdpT0wjgygJCyqh6yCEQUekItlx2YML+SuEaqAv80AFjS+lBIkQ77knzCoYLhVxhMo1Fzt9tojH2E8yiyDmGyveVgwR5xcHazfNijmCV4dcNXAismQkPrC2yMdbUhnir6lXDzWz2wX0Q/bLIlkNyh9Oszvg6cbqHU5TxHDqLOVQK7LUJ3B06hvWs0btVS7ymaUxlfwgWeIkPzqaDD8Wj9dYB16V6qnQhugw8U8sQVWGW+cD4ULQD/ri9MF7ftt0khkwHVx817VtIuh5CX+hJRZu8yZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzm3e4yjm5WtkXAclJVN1ira0VPRFR9VSV1Cj2+Y8uo=;
 b=cCUmV2Ba8Mk/MeI7MKZFr930EJOrkS6IWigglHKDIJcO4RWo6UCo27CzfBVqrH/Js0kziHkfrdkDXzUQ1NEcisH6NMIuUn4QOAtPNPzIEKBhZ5NBkXKR4iZvKV0U0HLT5UQYiSR4NNOgVgU3F6YdHbsLNpUTVx86ICnCqPZ4VwBr+NV0Rk98vxDttw45r8QYgx8/9H9fGVsm44LKl8oStBx+wjNEXDLWXSHtM9w5GqDVxfOS9jdfkbmYD/Pcy/WNecPUqEazNj9URmMWR4BcZKgykyYLtm9B/yj3iFzhtHDixzOZDEyhp6X7sNbLcfB0uV4XqeZ2kIE1Hez0/vrxEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzm3e4yjm5WtkXAclJVN1ira0VPRFR9VSV1Cj2+Y8uo=;
 b=o9kNbJTS5xAAsCrsCCKBRDEhbGatncO/88MoaZBBRsV7sZWgJT9TyPg/RKKSZVcnpd1K9hNx+sfcZh8aP/MKwq2rXWgodqDsYAaj62U7Ym6sQTwEuZ5JUxcxokdGYw2XDwkvXD+XveA2/kitmihPqLxGtJ0TaACJ3ARND2Kc3wk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b0a7dbdf-775a-45e2-bee4-d234ca21c002@amd.com>
Date: Mon, 18 May 2026 20:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: Fix PT_PT table descriptor value and comment
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>
References: <2ef09a6a-f78f-47a5-8ffb-cd03cb51fc1b@amd.com>
 <20260518114552.29687-1-gabi.qs.mail@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260518114552.29687-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2ac0df-5705-4f7b-82a3-08deb5094f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	QXWtIJK7LaC/bQmjAbpu7k65IV9NR+Zsq1RHAYeSIzRgyw65iJLACrfHQm6sa0Vg0OaZoV6i0VKPHzQowY/k4MS9/WY3ZgoaIG6TBBw0zI+rEmH9AA/DOt3t2wSAgkfwCtBM80SgOUiGVxZgBMqvqS7fzCNvz/GrjSPmPv/6oGK2uSE8HjxJaOunHuXKf0YYcJsIvD5A8bUwI/33kYmmoJ3MxCdPQ9sKKFXMTeheyR6EOFPASDsnAT6nduQ7PDtwFou2hfonxbeXlEA0A1p1dtd521IrBWJHsVcH8uS3sD0a/dxCi5fPkkvMvzV+rI3XHdAnsM8yiZxnd+cMqCFfJK6zqR38QOdrosCHjHGzhw524oEYVh84bxsvftFlG8tw7N7TJaKyGndgd+mfc1H/0DjlJP7A8xP3CsCHZumMzpGJ1Bv+zQ3QUr2yt3LMkSw+t4bcsgVItYKgouVsraITeKUSoVCcucGI+KsOvqLS+e5u1t5nu3ml5CIbUmTpAvi2uYYbek6ALovJpA9hBtLi/C7ZKQEFWKgFNX52rpxWX6uZvnOYVMcvngmLU94/idMoqOcoeh9aKUKgAsqDWOPL9HNvLhOPnUG6qSiD9oJCwpzUSDBAFEvsqs3e3oKx3pNFElz66Uz4Mg8T/ZagkfB7NO2zE270PlrVUHMSzs+yOQDmvUEa5QDqm0fakXXan8vz5zyls1/9wFEs35RJywOiov7NJqbcBtOr/yhaTnn8Kug=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YLn8/RLCOaGEIIEt5pKo8CiyfEkReVjt0XXEFal3bwlV5YovvPiTql/+Jj4c8b6UnCeRmlMSgNth4pV5V2pG+0pdnrDwwBQdKlR3eDKZj9i+wAr9heWrdziV1Y9PYX3/LAgo+nSdHplvyNulaxyAzF5fBVRhZsp0HluZjFA3QD45SellFsVXxx9aJH/s3pCeIr5JBtswHZwgw5IOl2TCbfLQVHktSzcp3xfRSMNtvsyUR/Ln2yvIwq/3WEnd/03bMMxi3k4WBwyM2gC3slwPAaxwhSP6Rux7rCRkNnGlU9f+vJR2IAsASDwG94+/JgRQG/ciqBNxH8vNG3mnf8kGMGcOi33mrG5fk1PTrNFwDIsrsIXFRwlPmFwGhMOThMXso520RMUnUa28vmdKLyTDqLr5f1Awz8O/5sahBw3m4MED8kpsHLZ7G8xvuoXA1lDV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:14:32.3994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2ac0df-5705-4f7b-82a3-08deb5094f66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441
X-purgate-ID: tlsNG-ebf023/1779128079-417793FF-486A0B71/0/0
X-purgate-type: clean
X-purgate-size: 1953
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gabi.qs.mail@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:gabiqsmail@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: A0A3B572135
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18-May-26 13:45, Gabriel Quintáns Souto wrote:
> Per ARMv7-A/ARMv8-A ARM, bits [11:2] of table descriptors are ignored by hardware. The original comment incorrectly described block/page descriptor fields (nG, SH, AP, NS, ATTR) which do not 
Please trim lines to 80 chars

exist in the table descriptor format.
> 
> Set PT_PT to 0x403:
>  - Bit 0 (P): Valid bit (required)
>  - Bit 1 (T): Table descriptor type (required)
>  - Bit 10 (AF): Access flag (future-proof for FEAT_HAFT)
There's no FEAT_HAFT on AArch32, bit 10 is purely ignored, so why setting it
also for arm32? On arm32 it should be 0x3. On arm64, thinking more about it,
setting AF for table descriptor would make sense only if we enable HAFT in TCR
which we don't. Therefore, for consistency you should use 0x3 for both arm32 and
arm64.
> 
> Hardware ignores bits [11:2] but setting AF prepares for ARMv9's FEAT_HAFT. Using 0x403 rather than minimal 0x3 provides forward compatibility while avoiding unnecessary reserved bits.
> 
> This updates both arm32 and arm64 for consistency.
> 
> Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
> 
> ---
> Changes in v2:
> - Apply fix to both arm32 and arm64
> - Use 0x403 instead of 0x743
> ---
>  xen/arch/arm/arm32/mmu/head.S | 2 +-
>  xen/arch/arm/arm64/mmu/head.S | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
> index 5032e6c075..cab7be0621 100644
> --- a/xen/arch/arm/arm32/mmu/head.S
> +++ b/xen/arch/arm/arm32/mmu/head.S
> @@ -8,7 +8,7 @@
>  #include <asm/page.h>
>  #include <asm/early_printk.h>
>  
> -#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
> +#define PT_PT     0x403 /* AF=1 T=1 P=1 (bits [11:2] ignored in table descriptors) */
Don't exceed 80 chars line length. Also, you don't need to provide reasoning
here for ignored bits.

~Michal


