Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AICtLFO06GmIOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:43:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F024458A7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290368.1569973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVyt-0001Ny-A3; Wed, 22 Apr 2026 11:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290368.1569973; Wed, 22 Apr 2026 11:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVyt-0001LK-7K; Wed, 22 Apr 2026 11:42:59 +0000
Received: by outflank-mailman (input) for mailman id 1290368;
 Wed, 22 Apr 2026 11:42:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFVys-0001LE-FF
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:42:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVyr-0071tJ-S5
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:42:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b43e-5cb7-0a2a0a5109dd-0a2a4501cfbe-6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:42:57 +0200
Received: from [40.93.195.59]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b43f-c1f2-0a2a45010019-285dc33bb79c-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:42:57 +0200
Received: from PH8PR02CA0016.namprd02.prod.outlook.com (2603:10b6:510:2d0::25)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 11:42:52 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::72) by PH8PR02CA0016.outlook.office365.com
 (2603:10b6:510:2d0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 11:42:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 11:42:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 06:42:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 04:42:40 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 06:42:21 -0500
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
 b=lF0O8gMa8DID+fTgMBvI+g0D3D2COPpUeJx7U20+MwGrzyoZuXl91O3hfZ168Fd1k2x+nuVimlAKwuQ//wiG3+3ADaFJUXds0IEqFMCNYI5mKlI+zBQLeYKNv0SG2WhQ++OrLzgwUHTHuu5b31Tyi5DfVKj/wQLxsRLVCZgfiQiDIH5OMSwq48seb9DgCXeJNJ7LCaWloC1KJOMT6EiFphQCw4S6ZTbwH8uO6IFBu4hg+B3PrYIkiigbP1j7inGHf8zMy3RrqWRxkk+EbiVA9575sG5a3HWXIHMPG4NXp+xUdUjqH9rDn42OX5BY50eNtWPF/iTjmqB9HTR+t4Zp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZw/CmPc1QOD6ePZ9wEN5SKcOWeF5ECPU5BRMNQFpfQ=;
 b=T/D606EZ+5x09Lh7trEN5rw3tKd1D0SeKC38CLIPYzfb7lPKfSahG0Bq5HEFGG3TCmMCKP21vdKNTkZZaKpLqcBGu3/RXSpgAmGVk4EiZzTyPsqmoikbYyNU7RZoj7oB/xkxSh8+VY3lMDyE0lqYRY7MJeFFWFM+WT+CEu5KmxdcpiSac5NoTc8KSqUvs4BW+2FaU6abEGnVtN8l207zGlBVmx7ME9YzM0mpsd50aku4AwAVQ/NEIQJHm6HRPN737zY91yzjcShO7+ggV1nvrjX9aiZueVGUKgHrhK/x0cUJnq1ty6drtWtrYnNwkErAOJoR49/zCUYSt+HyG2xt3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZw/CmPc1QOD6ePZ9wEN5SKcOWeF5ECPU5BRMNQFpfQ=;
 b=MdZCZNXN/FNaJXoAPEArEP7DTHU5CwdxdC8EIxzurAB9UZZ4X9wYZ9LO/QRyuys5I4ksdcAX9nnqW+eeRFeRFOweayEgDeOh50cTVjAWjYdpU4eQCThW7pDwJfalvIJg/rWRSlqMIS/EXXixY395n7taRwb+59IdF52hvuQfGOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6c02e12a-e091-4416-980b-5a7a24ba71d8@amd.com>
Date: Wed, 22 Apr 2026 13:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/dom0less: introduce next_phandle in struct
 kernel_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
 <4a9d79a9ef2bf25e904c9f49ddef7d5a3f3a4ac2.1776780944.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4a9d79a9ef2bf25e904c9f49ddef7d5a3f3a4ac2.1776780944.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 447daf32-85ea-4dde-70ff-08dea06447f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ecDK+eY72jJKfPPpwOve1ttCfCqN9eFB45YV2gbB5DXQTKyiWwo1mPqUJJfma9xFSUNECTy7EeLRJyNUMnJqkllGXavc2EB5khU7hybSUbow4ER/L0ouz/j8O19t4zNGboK+EIbdeF7r8BwGMkxGHiV3zVSDFryP2E1D55zRh0JajB1NKG1zfMAdRkaOYW0atIKwos5WmcUTC6dIM6WWmV58/Z37VG0oQrcd/PzXy1lK9UOm0iosJFZ2RQNUmQzqe7OfjlhfRHb+GZ/B6nLl0SbEH+w250BgVktSRIaoRvwMULatui7UsVq165grMKV3CAgB0FPs2OmhpR0XVgNavGyq4eB35SJJ6R5tWsFPhmQ6DAgpuRBiUEdq8a8gVx8nYykIWz6DdlTnyqgaRa5skae/M4z9lF6O/mUuovsohQ2YQ502WnTvk+JjbnsvHaSa4NirW6+HU9i/9PzWQzgOA5/vdVLKR+NY6YM4NjfupWdsIuh25eYqPkUiwroq+9ccukPuxmPTp7nXQbMq5frXQIipg0tqQp+h5hMh7r42j+dXLntCY+GBkKtd2tYBAhcve+SFdM4uH3OKcLEa7U0Y4DMhJoVTPHoQHCIqZ7onIG7DqET52e38GDG2HOw/O9beQGwvtHEDOBbLD4KiVScJXwRrl5RPrTuHuGTdn81l+tIQbumUPrqsUp2PxZq6oSsz+vNptZcwT+YfPMMXFTKBh7N7E9ymGLf+djf/lnHfLzNvJzxas89XwmRhIP/+zdkVbx/CW/WJvbEdX0dFh2xYhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kSBXeR025ufhbY7/pzFham5FQbdaT2vzOnvVIj/9fJ5HU1pHdiWPdeAA4MnW5T0aa2Oaj2YvqisQ1TzYk5vwFWn8aDj592fl6elmjGyHXq/Lw66nPF89HNST5L7ATxS9Nl7OUAPsrPvHMILVUvMw5aD0712A5WcQKFdqdxZ6m5QFfdVSZPL7Hb2Sjztcf0dXR7ip8HcCurDeKxJucZHOL/8rT1HuHTd5kFYOoCvk/V4i5XS8+bFcsdhqT5fTFErVkfhLjbwX8REFJMpXKB0b69Y1aHIR1W2EBl6oTkVMHC+jFsQYoApaAlGobvrBvpMpu17QCRcKBgnas4aLEYh0vLDVhsbdoWN3A70tkmqpH0NnIXvK4RPMw9EEYtBDOn1aS6kLLBuZuCeuniFztnXiiMAqbLkkI/5S5RbhVzNK/qmeB0QqzYtcE6Kd9DO0AUn3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:42:49.6558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447daf32-85ea-4dde-70ff-08dea06447f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
X-purgate-ID: tlsNG-d62444/1776858177-B5E6BFF4-2E385CF7/10/73395122804
X-purgate-type: spam
X-purgate-size: 6758
X-Spamd-Result: default: False [4.81 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[amd.com:s=selector1];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_SPAM(0.00)[0.998];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_PROHIBIT(0.00)[1.171.63.0:email];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_ALLOW(0.00)[microsoft.com:s=arcselector10001:i=1];
	TAGGED_RCPT(0.00)[xen-devel];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,d000000:email]
X-Rspamd-Queue-Id: 02F024458A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22/04/2026 11:44, Oleksii Kurochko wrote:
> There are cases where it is necessary to know the next available phandle
> number in order to generate phandles for guest device nodes.
> 
> When a partial FDT (pfdt) is provided, special care is needed during
> initialization of next_phandle, as the pfdt may already contain a dummy
> interrupt controller node with a phandle assigned to it. next_phandle
> must therefore be initialized to one past the highest phandle already
> present in the pfdt, to avoid collisions.
> 
> Since next_phandle may be needed for the very first guest node generated,
> domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
> The new call site also aligns better with the existing comment stating
> that domain_handle_dtb_boot_module() must be called before the rest of
> the device tree is generated.
> 
> Introduce alloc_phandle() to ensure that phandles allocated for guest
> nodes do not overlap the Xen-reserved phandle range.  This helper will
> be used by subsequent patches (by RISC-V at the moment).
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Here is an example of generated guest DTB:
>     cpus {
>     ...
>       cpu@0 {
>     ...
>         interrupt-controller {
>           compatible = "riscv,cpu-intc";
>           #interrupt-cells = <0x1>;
>           interrupt-controller;
>           phandle = <0xfdea>;
>         };
>       };
>     };
> 
>     /soc/imsics@28000000 {
> 
>       interrupts-extended = <0xfdea 0x9 >;
> 
>       phandle = <0xfdeb>;
>     };
> 
>     /soc/aplic@d000000 {
>     ...
>       msi-parent = <0xfdeb>;
>       phandle = <0x1>;
>     };
> 
> Note that phandle is generated in this example not by get_next_free_phandle().
> 
> For non RISC-V people, APLIC is an interrupt controller (something like GIC in
> Arm), IMSIC it is interrupt controller which provides MSI and connects to
> each CPU.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
> ---
> Changes in v2:
>  - s/free_phandle/next_phandle.
>  - s/get_next_free_phandle/alloc_phandle.
> ---
>  xen/common/device-tree/dom0less-build.c | 44 ++++++++++++++++++-------
>  xen/include/xen/fdt-domain-build.h      |  6 ++++
>  xen/include/xen/fdt-kernel.h            |  3 ++
>  3 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 840d14419da2..ca3ac84a3ef3 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -389,6 +389,24 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>      if ( res < 0 )
>          goto out;
>  
> +    /*
> +     * Find the highest phandle in the partial FDT so next_phandle starts
> +     * above it, avoiding collisions with pfdt's own phandle assignments.
> +     */
> +    res = fdt_generate_phandle(pfdt, &kinfo->next_phandle);
> +    if ( res )
> +    {
> +        res = (res == -FDT_ERR_NOPHANDLES) ? -EOVERFLOW : -EINVAL;
> +        goto out;
> +    }
> +
> +    if ( kinfo->next_phandle >= GUEST_PHANDLE_GIC )
> +    {
> +        dprintk(XENLOG_ERR, "Phandle allocation overlaps Xen reserved range\n");
> +        res = -EOVERFLOW;
> +        goto out;
> +    }
> +
>      for ( node_next = fdt_first_subnode(pfdt, 0);
>            node_next > 0;
>            node_next = fdt_next_subnode(pfdt, node_next) )
> @@ -459,6 +477,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
>  
>      kinfo->phandle_intc = GUEST_PHANDLE_GIC;
> +    kinfo->next_phandle = 1;
> +    BUILD_BUG_ON(GUEST_PHANDLE_GIC == 1);
I'm not sure that we need this. It does not seem to be useful. If you want to
keep it though, I think you want to compare to next_phandle, not opencoding it's
initial value.

>  
>  #ifdef CONFIG_GRANT_TABLE
>      kinfo->gnttab_start = GUEST_GNTTAB_BASE;
> @@ -499,6 +519,18 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>  
> +    /*
> +     * domain_handle_dtb_boot_module() must be called before the rest of the
> +     * device tree is generated because it sets phandle_intc and next_phandle,
> +     * which subsequent node generation depends on.
> +     */
> +    if ( kinfo->dtb )
> +    {
> +        ret = domain_handle_dtb_boot_module(d, kinfo);
> +        if ( ret )
> +            goto err;
> +    }
> +
>      ret = make_chosen_node(kinfo);
>      if ( ret )
>          goto err;
> @@ -516,18 +548,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>  
> -    /*
> -     * domain_handle_dtb_boot_module has to be called before the rest of
> -     * the device tree is generated because it depends on the value of
> -     * the field phandle_intc.
> -     */
> -    if ( kinfo->dtb )
> -    {
> -        ret = domain_handle_dtb_boot_module(d, kinfo);
> -        if ( ret )
> -            goto err;
> -    }
> -
>      ret = make_intc_domU_node(kinfo);
>      if ( ret )
>          goto err;
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> index 1d9e77df0eb3..a604f3983fe6 100644
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -63,6 +63,12 @@ int find_unallocated_memory(const struct kernel_info *kinfo,
>                                        unsigned long e_gfn,
>                                        void *data));
>  
> +/* Return 0 (invalid phandle) if the Xen-reserved range has been reached */
> +static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
> +{
> +    return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
> +}
> +
>  #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
>  
>  /*
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index aa977a50f4fc..438adfe3855b 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -44,6 +44,9 @@ struct kernel_info {
>      /* Interrupt controller phandle */
>      uint32_t phandle_intc;
>  
> +    /* Next free phandle available for assigning to guest device nodes */
I would mention not to use this value directly but rather obtain from
alloc_phandle. This value should only really be used by alloc_phandle.

~Michal

> +    uint32_t next_phandle;
> +
>      /* loader to use for this kernel */
>      void (*load)(struct kernel_info *info);
>  


