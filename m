Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGiPKJG63GlCVwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:42:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6213E9F66
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1280989.1564063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDoE-0007lO-P6; Mon, 13 Apr 2026 09:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1280989.1564063; Mon, 13 Apr 2026 09:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDoE-0007ia-LY; Mon, 13 Apr 2026 09:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1280989;
 Mon, 13 Apr 2026 09:42:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCDoD-0007iU-UR
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 09:42:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCDoA-002JN6-T4
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:42:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69dcba76-bab6-0a2a0a5309dd-0a2a4502d81c-18
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:42:20 +0200
Received: from [52.101.85.57]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69dcba78-42fa-0a2a45020019-346555392bd8-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:42:19 +0200
Received: from MN2PR10CA0023.namprd10.prod.outlook.com (2603:10b6:208:120::36)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.18; Mon, 13 Apr
 2026 09:42:12 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:120:cafe::c9) by MN2PR10CA0023.outlook.office365.com
 (2603:10b6:208:120::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.47 via Frontend Transport; Mon,
 13 Apr 2026 09:42:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Mon, 13 Apr 2026 09:42:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Apr
 2026 04:42:10 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Apr 2026 04:42:08 -0500
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
 b=t9exD6eZ2uw+krt0YIaN856eXRMe6W44TaHu5kkk3GjrxtUeHrp/DkjHfn22jb1//162JkGgbOKf40sj2p0J42rqLdQiBxnILr5zO6KyYBFMzThTtWiNC9IPgtIoqt+PLh0dWhogG7HNMJL1pUeja4ICNXlrZ2twkdNlnuc5AJBP6gS89qfqR3zRuOM+mtA2lrdCrYIWGJXJNE5saFPxqgRDxC/sfNBlUy6MCQUgLQNyi2NPqUdW+ZyA2LbcZBj12uBV3cSnTwf+ztGesJj+fcgWD/LLwG1U1gSKLaQe68EiFnFtihaaqhpYERhEKFwtwqmvy6eMeFsGJrXdRxGzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAUs4XlpWtrjUVRrotvwSiqcy8WNBd6Fmf93e1EHfsA=;
 b=yXgpUmflML60kIK30+2pMDhq517LT+Is6WLFXbfJ7OkSPiH8+ZiOgZDFvhx8xRFN6mOw/Xl83+ydfy3xTcPtomhHMvvE/cZtX68NlE19kKDn/V1jVp6A7dBws4Xx7goHi1yZ2ZQx29nIXtzNoaPctsMSi10BNV6Pk4uMIr0WrOxnwHkf/I/dVvFCNZofoNsoxoAtcUB5ibYzgb8EsQXPs9TfihQC/HlkQAp1SYoja834iLFd3BTYsdikviF03FYPGuYaZ7qt0jRgiVEP2ptlvyI0wDIMAYjTtCt0ZISDol+3x38VN+KmWBVjh8BoBK8xw318p8bXTT5LGEs51la/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAUs4XlpWtrjUVRrotvwSiqcy8WNBd6Fmf93e1EHfsA=;
 b=4kJ2hKg+mqKIKu4Sx8GhNYgKMAc5kWJG97p80ho/MapqtDNogNcArjrPfxFmmH7+e4dlzMNF4eDZkfWbVaB7vSzfIen8mSxtxkmGPE4AL8vG791Q1iKCqZOS8pLer7ydGwJaA/awjWWgQYHmmOp3J255L3mlWgKeLfSHeyZ6EP0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <43fd7fd7-43dc-4c17-8ff6-b58800fd5f46@amd.com>
Date: Mon, 13 Apr 2026 11:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm/mpu: implement setup_virt_paging for MPU
 system
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>, Hari Limaye <hari.limaye@arm.com>, Harry Ramsey
	<harry.ramsey@arm.com>
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
 <20260408135531.1744388-2-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260408135531.1744388-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 784e2231-9c7d-4e46-3ac3-08de9940efcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	d59cfNUcW6Z8qWMzF/Hj5wvCZOYe/mfXDk4I102qo4yNRZt2XQ66zun9ioyaB8D+N824ZQookafuRqxfKvawQbP1snB9LARiebPKVsgzVBVsepSR7Le21wS+vDs6A1cl0rDMnuAChTkJ3cLFH92t2kDFtN5PHjqEDkb9FuU9XY4kE1e2mlVW5LUpTR4yb9kKhQEpwf7iuo4u8pCyR6itKnVu3rHkxkxI+aZ67hUpfqRMhFCXw4HAqOhmcHoEdiPiGn3bAXAYizQ1Y3kZkNGvkRzKyjA+RZzewTgCKQHpNs5NpDlukSKdYBehHcgMY7Cwjh327nc3gYJYlofLpiRAxFnslGlDT6HCap2ywL9swqYp15ioQmvqlbYbetE5aHBDQ4e96w9JQEB2SxeXh/Wuj+EeGxxvHjbnCuZ4lcTetWekElHUShb9V0fK0Efge60vofaeK/AHNk86jqk6J22CuduWfdkpxnUnGuIQ7hDwVk0AEkSAeE9XYSt9EHNv/APRRy+OiqdKonzGuo34dP4JDV0qjkLWl0fd/IhcLWO/ktRQJCMKVjq5x0QwBI64vf11uCr2zSo7WvUO/yQjfWqEXUG421cX6ynQ9yBUl5H8ADCrcXpAobRFu10eMmhpGLfoppO2IOiYnSJO6kqtLLgUpzBZ9caCZGv2OubqIsrwOLLk4gv2QeMBNoK0ijs2eSn4tkQS8AS49ePW/RxFFnvyRw+QTEA0BUJd70F2AediWc1qxmwnMcENbBo+Ftp5o3TW8X1pcGaPYg7DxT0jFGfwFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YU4lJNFs88W/rGQqMzu5Le6WfPbF9BydeU83ygvZwrMCeZYfbiyBldsv/kdu1/+vk4bQHv/Pb5NByUCxujhkyQix7HtZccOhfyJpKIn0o8wJloY/3OV5FzDV8jUmf42+4ovQwpJUKw9Z4AXOpzIXEv/FSIF/x7A3gewE28M/d8PQ+QrzOWwcM8Mo6U/Slu845g546moXriXeDBLXuMs/0aY9rG9PegnOffGOLIBG8821EYdPskqodS4ie5IsKYiUHKOqyQcCJEsvbgqzYWyanXPbhnRLRWBH9/di9SU9VS62IzRe4p/Gcit/Zqnbq6yogoqKOwZmI5K5zwkV+Z8oqRv8Gw1Ev0o9kUn8uJ2UpS0vQHGQjCiWxiE0NNhnjkLANNBwjEOAyxsKfPO7iBQZ1LozMvDfrM3HnEM13locnk43n8cqxXN/ftgPNz8iy96v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:42:11.3047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 784e2231-9c7d-4e46-3ac3-08de9940efcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
X-purgate-ID: tlsNG-720697/1776073340-AD53CCD1-D31D7DB4/0/0
X-purgate-type: clean
X-purgate-size: 4717
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,m:harry.ramsey@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vstcr_el2.sa:url,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 0D6213E9F66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08/04/2026 15:55, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Implement setup_virt_paging for aarch64 MPU systems, taking tare of
> stage 2 address translation regime, IPA bits, supported VMID length
> configuration and vtcr_el2/vstcr_el2 register programming.
> 
> Implement also the Armv8-R specific changes to ID_AA64MMFR0_EL1,
> related to the supported memory system architecture (PMSA/VMSA)
> and check that when MPU is built, the underlying HW is compatible
> with PMSA. By default MPU at EL2 and EL1 is required.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> v3:
> - Refactor unused code to more relevant commits.
> - Add P2M print information
> - Formatting issues
> - Update commit message
> v2:
> - Seperate commit into multiple commits
> ---
>  xen/arch/arm/arm64/mpu/p2m.c             | 80 +++++++++++++++++++++++-
>  xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
>  xen/arch/arm/include/asm/cpufeature.h    | 13 +++-
>  xen/arch/arm/include/asm/processor.h     |  8 +++
>  4 files changed, 101 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index b6d8b2777b58..fda512dc7c8f 100644
> --- a/xen/arch/arm/arm64/mpu/p2m.c
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -2,11 +2,89 @@
>  
>  #include <xen/bug.h>
>  #include <xen/init.h>
> +#include <xen/lib.h>
>  #include <asm/p2m.h>
>  
>  void __init setup_virt_paging(void)
>  {
> -    BUG_ON("unimplemented");
> +    register_t vtcr_el2 = READ_SYSREG(VTCR_EL2);
> +    register_t vstcr_el2 = READ_SYSREG(VSTCR_EL2);
> +
> +    /* PA size */
> +    const unsigned int pa_range_info[] = {32, 36, 40, 42, 44, 48, 52, 0,
> +                                          /* Invalid */};
> +
> +    /*
> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
> +     * with IPA bits == PA bits, compare against "pabits".
> +     */
> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
> +
> +    /*
> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
> +     * memory system configurations supported. In Armv8-R AArch64, the
> +     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
> +     */
> +    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
> +        goto fault;
> +
> +    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
> +    if ( (system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_PMSA_SUPPORT) &&
> +         (system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT) )
> +        goto fault;
> +
> +    /* Stage 1 EL1&0 translation regime uses PMSAv8 by default */
> +    vtcr_el2 &= ~VTCR_MSA;
> +
> +    /*
> +     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
> +     * address space to access the Secure PA space as Armv8r only implements
> +     * secure state.
> +     */
> +    vtcr_el2 &= ~VTCR_NSA;
> +
> +    /*
> +     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
> +     * are supporting it.
> +     *
> +     * Set the VS bit only if 16 bit VIMD is supported.
> +     */
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> +    {
> +        vtcr_el2 |= VTCR_VS;
> +        max_vmid = MAX_VMID_16_BIT;
> +    }
> +    else
> +        vtcr_el2 &= ~VTCR_VS;
This is the last change to vtcr_el2. Why do you put p2m_vmid_allocator_init()
in-between this and write to vtcr_el2 register? It looks odd.

> +
> +    p2m_vmid_allocator_init();
> +
> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
> +
> +    /*
> +     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
> +     * To make sure that all stage 2 translations for the Secure PA space access
> +     * the Secure PA space, we keep SA bit as 0.
> +     *
> +     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 NS
> +     * configuration is checked against stage 1 NS configuration in EL1&0
> +     * translation regime for the given address, and generates a fault if they
> +     * are different, we set SC bit 1.
> +     */
> +    vstcr_el2 &= ~VSTCR_EL2_SA;
> +    vstcr_el2 |= VSTCR_EL2_SC;
> +    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
> +
> +    printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
All these are unsigned, so %u.

~Michal

