Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KDOGZ7n8WlZlAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:12:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019324935EE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297210.1573320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI2pu-0005kP-To; Wed, 29 Apr 2026 11:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297210.1573320; Wed, 29 Apr 2026 11:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI2pu-0005i3-Qg; Wed, 29 Apr 2026 11:12:10 +0000
Received: by outflank-mailman (input) for mailman id 1297210;
 Wed, 29 Apr 2026 11:12:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wI2ps-0005hv-I1
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 11:12:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI2pr-003bA3-U3
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 13:12:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1e784-5cb7-0a2a0a5109dd-0a2a4508cb6a-6
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:12:07 +0200
Received: from [52.101.57.50]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1e785-63b5-0a2a45080019-34653932951c-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:12:07 +0200
Received: from SJ0PR13CA0080.namprd13.prod.outlook.com (2603:10b6:a03:2c4::25)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Wed, 29 Apr
 2026 11:12:02 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::73) by SJ0PR13CA0080.outlook.office365.com
 (2603:10b6:a03:2c4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Wed,
 29 Apr 2026 11:12:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 11:12:01 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 06:12:00 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 06:11:58 -0500
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
 b=JY2QU+Bv3d9eavG3kWFDtSbS1wfd/xftlcco9FD9n3MAZ7AOliO+u59VvMEBKbyFMRGgg9RQ/zjuujIpnLRTBxP8kzAa8RO3+Ex+zBlfGeCjuG5RxfZhKJmIwq9dzMyFpI1mJ6StRqviLuTtr8defX8fySOC6ORFw0MjI7V7pLTsq7sxUDYSzJij2gZRi0CEjp6hSGMtbOQ9+l/njVD81y6KRZ1S7GsHsVHivXxYb8JiyN1te7C6o51V/Seidq5yijrUrABQid8IN7HfWjwQXx4FW46MIofX3tomyLTH8AToEr2fkdYKeCVgm1zgQJcoPvj3ABT6/f3vgGGsswlbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OhkMHXducRriWhUH8Hmrl2Wr8sNaEW9VFkdIaPlvwY=;
 b=A3P0Usq/w8amGOUgodAMA+YNbSViEgAB8AdkNyMnUWdOdMYcq2+NXI8O8SZhGMSqXIYWLmhP7dulQxFx1oHW9CvlaGGztavZEVDpns1nYY5sS54S/ezUki5381OUk69bX4uOCZTMQeIwcHC5NlWc+dNPAf2CZYT9ChwaqNCPq0ijNwLjOxZ97q6qACN5x+xOBN8qz+/L4wtRGg0etd+pFnws0ZGrLNSxQZYusEGKjIdL6CrHQEAgckCorZwDqR2nvxkHy53jxdmjtFM+s4Bv60qL92udgRLzP2EXw/X5Pdz8dz/ZvmuYUI/E3MdQO9FOvyQGBzmwr6LzKNSNP9gnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OhkMHXducRriWhUH8Hmrl2Wr8sNaEW9VFkdIaPlvwY=;
 b=PAfVhPMhn4uonL20AMT9SXRMHBpfSYhs/ya54S5bgSgYKx9PKr+TRNe71qebFvgE032AYErvpmn77gUKzJM4G1Bk3khsAouEI5J7+leFyiJNpjog1rfmTNUyG+qe3IQgOvW7uiicDq9LCx/zkb+RmTb5sexL3Yi2igUEShz/59g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <93da1c54-e812-41d4-9201-cabdc3fd6411@amd.com>
Date: Wed, 29 Apr 2026 13:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm/mpu: implement setup_virt_paging for MPU
 systems
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>, Hari Limaye <hari.limaye@arm.com>, Harry Ramsey
	<harry.ramsey@arm.com>
References: <20260420142224.1802911-1-luca.fancellu@arm.com>
 <20260420142224.1802911-2-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260420142224.1802911-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e39cf2-a4f0-4c12-3c99-08dea5e02345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VgK8C2ItFq0XvHwz7f1DONkV1JKJmvLwXCpE90rmyIeS2+za99R9OGlJD5vBIXd6+plbNQIsCrRAMmhYLK7w7Vs7eutVQf1q9clJOcDj73sL48MAnGha7Qk9Yjp6yboFjunNCrf6JsfoF4SMPaP+Og1bUj7nF8b0LS8OMhIQL6cus82cLd7CHwy95/Fp9aezpaGJm+Bk2vpQN6NA4VkDCm/+X0KpDAk1FRyyCxS/4L0g2wlC8i4OBVs0qVm93mp4u9gSfJSYmOt1i9P5X6zuQyjJnqwElltAGMuo6E1ORbg+J6NvGuDTnLxfYpYSk3HmW09pMIkAJdUzwfVDFYTjrsubwpVLkBPqNafP1w5ZG26xMT3oc3BCTN6oE61MFjA9h2Va7pZC43HtwETBAjEBPEcZ/Ic0uflcAbXvNA87R9ZIohr9KPkxA9QG8uk3D7mOja1xYRmUUYhblbRm4JAtwXBRryMJpy2gU5QZPLtX0EXSZfmnHmLznZpgdG45RLDm5ziybffUnBXVRS/nFeqp+9zdGuFjeCwLLEhuQfeUOPCEbbtwlcwzxga2S3OBmQ0Fnm3SXCpNFpDsSzDxJqxxBUvX3HK+Wjrs7NG9vmAM9bvGPXEqo0pvShVNgvV8ec9O065bex2p8pVFzXsxVxov2tQm3gowPNou8DpH0vHcUEjYgfbQzM1is1101z9eiNBu+OIDaRNXWBpekWHWNmq/XX5Bzq9tbB3wGP+X71hs+b0q0Bd9zFm2YtcnHDwoHM0XLlxu+Y1ILS06d70/Gw3pew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/SoOinoy3PY2coPrSh2Ei1iWQHaoj1okdCr0YzYr52XZxokwK6VxwoGpYbhN7jV4V0VxEFlv4bzjzlsrRD4NbS+UovbVLaVnSUr4vl7iRJ+QX9dC5brbr5wzBsoU1XZAlh0UnHw9OJZDuhz5tYNwpdwnkJ/Jp2j+DiwlvXd4q4e/z2Zbc8aiwibuyi3Kl5bu50cjepX7r+eoB8LjNL06dYxG00cw44lVnDpIC3NR7Wvqr4qYZ6RP5aSLoqhfgfs4oVahcq02VuTUk/1Fxn4mXigaaSdvOEkPdMNzslQ9h1FJ+qEDSUGIkysnneoBYAF3vUN8ORnYqqXHGQOx6EL2YtmtmdfKFYEhwvI/07KbNwb93w8lF45vDETgz2GH27aMhx1F9o41RPbepywAlMaEEKb4n0e2FBad5S1vV+c6VFRlYVpX3sHKvco9QIU7cgFW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 11:12:01.4845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e39cf2-a4f0-4c12-3c99-08dea5e02345
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
X-purgate-ID: tlsNG-c1860d/1777461127-C0B64DB1-12EA0F7C/0/0
X-purgate-type: clean
X-purgate-size: 4976
X-Rspamd-Queue-Id: 019324935EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,m:harry.ramsey@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,vstcr_el2.sc:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 20-Apr-26 16:22, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Implement setup_virt_paging for AArch64 MPU systems, taking care of
> stage 2 address translation regime, IPA bits, supported VMID length
> configuration and VTCR_EL2/VSTCR_EL2 register programming.
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
> v4:
> - Fixed typo in the comments
> - Fixed typo in the commit title and message
> - moved p2m_vmid_allocator_init() after write of
>   VTCR_EL2
> - Fixed printf format specifier %d -> %u
> v3:
> - Refactor unused code to more relevant commits.
> - Add P2M print information
> - Formatting issues
> - Update commit message
> v2:
> - Separate commit into multiple commits
> ---
>  xen/arch/arm/arm64/mpu/p2m.c             | 80 +++++++++++++++++++++++-
>  xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
>  xen/arch/arm/include/asm/cpufeature.h    | 13 +++-
>  xen/arch/arm/include/asm/processor.h     |  8 +++
>  4 files changed, 101 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index b6d8b2777b58..a39a1fc38946 100644
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
> +     * with IPA bits == PA bits, compare against PA size.
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
> +     * address space to access the Secure PA space as Armv8-R only implements
> +     * secure state.
> +     */
> +    vtcr_el2 &= ~VTCR_NSA;
> +
> +    /*
> +     * cpuinfo sanitization makes sure we support 16-bits VMID only if all cores
> +     * are supporting it.
> +     *
> +     * Set the VS bit only if 16 bit VMID is supported.
> +     */
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> +    {
> +        vtcr_el2 |= VTCR_VS;
> +        max_vmid = MAX_VMID_16_BIT;
> +    }
> +    else
> +        vtcr_el2 &= ~VTCR_VS;
> +
> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
> +
> +    p2m_vmid_allocator_init();
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
> +    printk("P2M: %u-bit IPA with %u-bit PA and %u-bit VMID\n",
> +           p2m_ipa_bits,
> +           pa_range_info[system_cpuinfo.mm64.pa_range],
> +           ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
NIT: No need for spaces between ().

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


