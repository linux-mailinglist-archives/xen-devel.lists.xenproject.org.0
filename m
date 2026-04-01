Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNq0A2RCzWkkbAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:05:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF237DADD
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 18:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270674.1559267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7y4c-0002f9-D2; Wed, 01 Apr 2026 16:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270674.1559267; Wed, 01 Apr 2026 16:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7y4c-0002ct-9r; Wed, 01 Apr 2026 16:05:42 +0000
Received: by outflank-mailman (input) for mailman id 1270674;
 Wed, 01 Apr 2026 16:05:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7y4a-0002cn-Ux
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:05:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7y4a-007T16-2j
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 18:05:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd4248-2eae-0a2a0a5409dd-0a2a4508c04a-36
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:05:39 +0200
Received: from [52.101.62.62]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd4252-fab6-0a2a45080019-34653e3e0930-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 18:05:39 +0200
Received: from PH8PR22CA0021.namprd22.prod.outlook.com (2603:10b6:510:2d1::7)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 16:05:33 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::19) by PH8PR22CA0021.outlook.office365.com
 (2603:10b6:510:2d1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 16:05:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 16:05:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 11:05:32 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Apr 2026 11:05:30 -0500
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
 b=QFpxjoxdC5coyM1Wqys6pK6OgG/kE5gqEoOycLn5k6rY37WWBPY4r+klJLwMT9/AOZmbnacy4OifLE4OVGHKR8JjCHRav12hzj/I7+amDZM6v/0vS9XG1Dt6TuzgC6+2zt5m24Oq/kxImQL9OPUEpyGHRYw3QJvy/j9QMzNb91E1MebNYobn5r5QWyqwO0RkK3o++XHBPVHddmLJl3aRCi5LONgnIFKCjwp9fMwgfL9ENDk+nKHcsDRHXHU6MMkBCUbswOPn7rYMqP94hkeQDIf38kFFSQx8T+8PPlxgB63IhaiAKGB6qLLiq/9x49OdbjfoKNcMNo3jRlFDRtwdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSIazrg/cqQji1+wSWpobRCOkBtPno0U1QWTzFGCx+k=;
 b=KNfFUjecw5XZTlg9+72jVOs4PMCoNyLnpYGMyr3kPs549DudZ7bXmLxOuZwhz6Iy6wfHdf0b8z8rPJSLnJhbI6Owz5pbKBEjk01Cy5JNLQHu3tnx/6MXMXlalKvr9MrlByfIySdII45OtDXV1VZheIi2ZPNuRRV+CXYs3sID7LZvRSaYfFNUuZSJE/BjKoowHhBSn7/ud2oaGXoxSm1ZqOpZKlsOfF5nQrvInX1k4MTJuPr+kZskUbbihs4L9QOdVs3nu98pDtRgjy+1OlqkB3NOZK3QtkfgP3j1fCgzradfqSwhTMxfADetJ7wR6fZqdR6eYgCmNeNSP7ScK5QgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSIazrg/cqQji1+wSWpobRCOkBtPno0U1QWTzFGCx+k=;
 b=mSVdlAjrMi5Bqvq/ZB/uOG91WstAQC4WKmoP0Hxyz2g5qMj3uowNu+PlUE6aLVVyFWyAFcDLSnuGJdc1yYSzXwSXyk9q7IwtM1yTZ2WcVG3UFucBNOHvJ99iJbiG8LowMXE3XXuepu9dSsTgCB0mCLO2/aXanMteNNNTow83UKE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bf7b757f-e149-434b-b454-53877bc87a16@amd.com>
Date: Wed, 1 Apr 2026 18:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] make ioremap_attr() common
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 8942affa-c2d1-4618-4cb1-08de900880e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xGnXgnJKj612pEKZu9FxX1E7oNdq1aOXn4W8KkFFu8iEcTGueaHMJudB1255021d6ZInPq39/ery+liX3NHm2A5TwN/8gIVeHn+BkbrP7ndvG20FjS0sXrFV6BH+3Dww2XlO5LQykGzUt3kGzVIUXlI3E7sQs7cF/rOej9d/sdhtR8mHmuVzdpXDnYFSJ/Rt9poFNpN1Vv8UwdTEiI7SllvfYB7WZEUg8w7/vGjou0063dm6FTZmuvS/5J4cNajs8g/WqezH2vIsNhakkiugmgiAGVVUmtJVK3rFwjvaN3kaSmotZO480LAbnlyenvRhiw9VlSGDC71XINR/ohziYc7bBIfU9ssU7ZYrN+4OG/cmDozAeJB4iERz/1nykoUaipINAfJNqvoA1HZd/w5Yp+wvl/Cl8CMMW8Yok0VOvuKjDFeK6yq2B693yvmvqlkRzPterQ9zZPK9L0t7jodvU6hZTzURLwGdfL7ueaE9QRmhKrvA7ewwULPNU9kAumlxbZD8FzM25Az01FN9lP6mzkMwarW3t7Wcc7CIbiAbmqLGnzae6YHbEvRR5C/PUlJ7uNBn62+I4Y/fiFz5ExHpSHZUNA9HjsBAqLT5ZVXMqKmLdhhm8rIfvnEKhhVr7mOy8lUTp93nwZJONX/oFpmWKdfV71L1ygoXFrtA3Cs/o+cburBFbcQCWlUSTXLqu0rgjtii7BLBoOIDBk1eZvE/IWxb2jE+I41aN+OKvysa9w5xuB98sY3x2FSS7MeVDvKZiwH1exizCkY2G/hROapjfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	boHhRra85SIu4ZdrDm0X3dkP7PJDlYbgR3SgHo8oWCpExBsc1bQfwa6kFL5ILxcoPg4cUVmj0gVlDwk4KJyBEifd/LwqlnRvLO+Zf6y44AOqZrFuAAf19GX05lkJ48gFjUWHGSDZdF8RjBBC1DbdFXFAojQR+hQI+4VV8r0Cry6UGSORt8aO8xDfddTyF6P0bRdxR1DiIETbtGJwzFmpFTeajQmkCfLR9kfIBysoByT59TC1zlatWpPYhUlIQphhQBoxJl9S8U7qmL93sbz0DwVsm2JS5qYoC2zPFKfDf4pNlge5HWax0y46CaDE1RIDMwKBUpxD9iIbzbx88lJVks+hGM3k0ZcnWois06K4Apkn7l1Dc1lc0d2WBYh45ayhr6qlXZ7HT3rGgogM6mVuNLSHjNh3wHWqxygit+kjNXAba3SstUJ2td0obAhA51Yr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 16:05:32.9202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8942affa-c2d1-4618-4cb1-08de900880e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613
X-purgate-ID: tlsNG-c1860d/1775059539-F6151497-3409965B/0/0
X-purgate-type: clean
X-purgate-size: 10085
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,wdc.com,gmail.com,arm.com,epam.com,raptorengineering.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:tpearson@raptorengineering.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 56CF237DADD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 19/02/2026 16:51, Jan Beulich wrote:
> This core backing function is uniform; what varies across architectures
> are the attributes passed and hence the wrappers around it. Yet of course
> extra checking or special handling may be needed per arch, so introduce a
> suitable hook. Permit such a hook to return both adjusted and un-adjusted
> (for the page offset) pointers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Declarations (or inline counterparts) aren't being moved around, to avoid
> the need to touch source files using the functions. Quite possibly they
> want to consistently go into xen/io.h and asm/io.h.
> 
> Of course ioremap.c could also go into lib/.
> 
> For RISC-V the wrappers likely should become inline functions?
> 
> PPC doesn't reference any of the functions just yet, so gets only a
> declaration.
> 
> For Arm, a TODO item is deliberately retained, yet seeing the use of
> ioremap_wc() in domain building (which by itself is questionable, see next
> patch) I wonder if that's even feasible as long as we don't have
> memremap() or alike.
> 
> --- a/xen/arch/arm/include/asm/io.h
> +++ b/xen/arch/arm/include/asm/io.h
> @@ -1,6 +1,8 @@
>  #ifndef _ASM_IO_H
>  #define _ASM_IO_H
>  
> +#include <xen/mm-types.h>
> +
>  #if defined(CONFIG_ARM_32)
>  # include <asm/arm32/io.h>
>  #elif defined(CONFIG_ARM_64)
> @@ -9,6 +11,16 @@
>  # error "unknown ARM variant"
>  #endif
>  
> +#ifdef CONFIG_MPU
> +void __iomem *mpu_ioremap_attr(paddr_t start, size_t len, pte_attr_t flags);
> +#define arch_ioremap_attr mpu_ioremap_attr
> +#else
> +/*
> + * ioremap_attr() should only be used to remap device address ranges.
> + * TODO: Add an arch hook to verify this assumption.
> + */
> +#endif
> +
>  #endif
>  /*
>   * Local variables:
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -5,6 +5,7 @@
>  #include <asm/page.h>
>  #include <public/xen.h>
>  #include <xen/pdx.h>
> +#include <xen/vmap.h>
>  
>  #if defined(CONFIG_ARM_32)
>  # include <asm/arm32/mm.h>
> @@ -200,13 +201,12 @@ extern int prepare_secondary_mm(int cpu)
>  extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>  /* Helper function to setup memory management */
>  void setup_mm_helper(void);
> -/* map a physical range in virtual memory */
> -void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
>  
>  static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>  {
>      return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>  }
> +#define ioremap ioremap_nocache
>  
>  static inline void __iomem *ioremap_cache(paddr_t start, size_t len)
>  {
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -455,11 +455,6 @@ unsigned long get_upper_mfn_bound(void)
>      return max_page - 1;
>  }
>  
> -void *ioremap(paddr_t pa, size_t len)
> -{
> -    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
> -}
> -
>  /*
>   * Local variables:
>   * mode: C
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -206,23 +206,6 @@ void clear_fixmap(unsigned int map)
>      BUG_ON(res != 0);
>  }
>  
> -/*
> - * This function should only be used to remap device address ranges
> - * TODO: add a check to verify this assumption
> - */
> -void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
> -{
> -    mfn_t mfn = _mfn(PFN_DOWN(start));
> -    unsigned int offs = start & (PAGE_SIZE - 1);
> -    unsigned int nr = PFN_UP(offs + len);
> -    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
> -
> -    if ( ptr == NULL )
> -        return NULL;
> -
> -    return ptr + offs;
> -}
> -
>  static int create_xen_table(lpae_t *entry)
>  {
>      mfn_t mfn;
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -9,6 +9,8 @@
>  #include <xen/sizes.h>
>  #include <xen/spinlock.h>
>  #include <xen/types.h>
> +
> +#include <asm/io.h>
>  #include <asm/mpu.h>
>  #include <asm/mpu/mm.h>
>  #include <asm/page.h>
> @@ -593,7 +595,7 @@ void free_init_memory(void)
>      spin_unlock(&xen_mpumap_lock);
>  }
>  
> -void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
> +void __iomem *mpu_ioremap_attr(paddr_t start, size_t len, pte_attr_t flags)
>  {
>      paddr_t start_pg = round_pgdown(start);
>      paddr_t end_pg = round_pgup(start_pg + len);
> --- a/xen/arch/ppc/include/asm/io.h
> +++ b/xen/arch/ppc/include/asm/io.h
> @@ -13,4 +13,6 @@
>  #define writew(v,c)     ({ (void)(v); (void)(c); BUG_ON("unimplemented"); })
>  #define writel(v,c)     ({ (void)(v); (void)(c); BUG_ON("unimplemented"); })
>  
> +void __iomem *ioremap(paddr_t pa, size_t len);
> +
>  #endif /* __ASM_PPC_IO_H__ */
> --- a/xen/arch/riscv/include/asm/io.h
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -41,6 +41,7 @@
>  #include <xen/macros.h>
>  #include <xen/types.h>
>  
> +void __iomem *ioremap(paddr_t pa, size_t len);
>  void __iomem *ioremap_cache(paddr_t pa, size_t len);
>  void __iomem *ioremap_wc(paddr_t pa, size_t len);
>  
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -587,20 +587,6 @@ void *__init arch_vmap_virt_end(void)
>      return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
>  }
>  
> -static void __iomem *ioremap_attr(paddr_t pa, size_t len,
> -                                  pte_attr_t attributes)
> -{
> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> -    unsigned int offs = pa & (PAGE_SIZE - 1);
> -    unsigned int nr = PFN_UP(offs + len);
> -    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
> -
> -    if ( ptr == NULL )
> -        return NULL;
> -
> -    return ptr + offs;
> -}
> -
>  void __iomem *ioremap_cache(paddr_t pa, size_t len)
>  {
>      return ioremap_attr(pa, len, PAGE_HYPERVISOR);
> --- a/xen/arch/x86/include/asm/io.h
> +++ b/xen/arch/x86/include/asm/io.h
> @@ -47,6 +47,9 @@ __OUT(b,"b",char)
>  __OUT(w,"w",short)
>  __OUT(l,,int)
>  
> +void __iomem *x86_ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr);
> +#define arch_ioremap_attr x86_ioremap_attr
> +
>  /*
>   * Boolean indicator and function used to handle platform specific I/O port
>   * emulation.
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -611,7 +611,15 @@ void destroy_perdomain_mapping(struct do
>                                 unsigned int nr);
>  void free_perdomain_mappings(struct domain *d);
>  
> -void __iomem *ioremap_wc(paddr_t pa, size_t len);
> +static inline void __iomem *ioremap(paddr_t pa, size_t len)
> +{
> +    return ioremap_attr(pa, len, PAGE_HYPERVISOR_UCMINUS);
> +}
> +
> +static inline void __iomem *ioremap_wc(paddr_t pa, size_t len)
> +{
> +    return ioremap_attr(pa, len, PAGE_HYPERVISOR_WC);
> +}
>  
>  extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>  
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6166,41 +6166,15 @@ void *__init arch_vmap_virt_end(void)
>      return fix_to_virt(__end_of_fixed_addresses);
>  }
>  
> -void __iomem *ioremap(paddr_t pa, size_t len)
> +void __iomem *x86_ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
>  {
> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> -    void *va;
> -
> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> +    WARN_ON(page_is_ram_type(PFN_DOWN(pa), RAM_TYPE_CONVENTIONAL));
>  
>      /* The low first Mb is always mapped. */
> -    if ( !((pa + len - 1) >> 20) )
> -        va = __va(pa);
> -    else
> -    {
> -        unsigned int offs = pa & (PAGE_SIZE - 1);
> -        unsigned int nr = PFN_UP(offs + len);
> -
> -        va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_UCMINUS, VMAP_DEFAULT);
> -        if ( va )
> -            va += offs;
> -    }
> -
> -    return (void __force __iomem *)va;
> -}
> -
> -void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
> -{
> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> -    unsigned int offs = pa & (PAGE_SIZE - 1);
> -    unsigned int nr = PFN_UP(offs + len);
> -    void *va;
> -
> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> -
> -    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
> +    if ( !((pa + len - 1) >> 20) && attr == PAGE_HYPERVISOR_UCMINUS )
> +        return (void __force __iomem *)__va(pa);
>  
> -    return (void __force __iomem *)(va ? va + offs : NULL);
> +    return NULL;
>  }
>  
>  int create_perdomain_mapping(struct domain *d, unsigned long va,
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_GRANT_TABLE) += grant_table
>  obj-y += guestcopy.o
>  obj-y += gzip/
>  obj-$(CONFIG_HYPFS) += hypfs.o
> +obj-y += ioremap.o
>  obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>  obj-y += irq.o
>  obj-y += kernel.o
> --- /dev/null
> +++ b/xen/common/ioremap.c
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/vmap.h>
> +
> +#include <asm/io.h>
> +
> +void __iomem *ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
> +{
> +    void __iomem *ptr = NULL;
> +    unsigned int offs = PAGE_OFFSET(pa);
> +
> +#ifdef arch_ioremap_attr
> +    ptr = arch_ioremap_attr(pa, len, attr);
I made an observation reviewing this patch.

TL;DR: Nothing wrong with this patch

For Arm MPU, callers now receive a sub-page-offset-adjusted pointer instead of a
page-aligned one. mpu_ioremap_attr computes end_pg = round_pgup(start_pg + len)
instead of round_pgup(start + len). Before, this was masked because the returned
pointer was page-aligned, so callers effectively started from the page base. Now
that the sub-page offset is correctly applied to the returned pointer, a caller
using a non-page-aligned start with a len that crosses a page boundary would
access memory from a different region.

I need to send a fix for MPU.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


