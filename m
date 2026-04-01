Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDrAAUu+zGmYWQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:42:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0F375522
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269724.1558637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pH0-0001xX-J5; Wed, 01 Apr 2026 06:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269724.1558637; Wed, 01 Apr 2026 06:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pH0-0001vH-GK; Wed, 01 Apr 2026 06:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1269724;
 Wed, 01 Apr 2026 06:41:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7pGz-0001vB-7S
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:41:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7pGy-00AiXb-4V
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:41:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ccbe1b-5cb7-0a2a0a5109dd-0a2a4501c866-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:41:51 +0200
Received: from [52.101.53.54]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ccbe2e-6fc9-0a2a45010019-346535368321-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:41:51 +0200
Received: from CH2PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:59::21)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 06:41:45 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::f1) by CH2PR03CA0011.outlook.office365.com
 (2603:10b6:610:59::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 06:41:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 1 Apr 2026 06:41:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 1 Apr
 2026 01:41:44 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 1 Apr
 2026 01:41:44 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Apr 2026 01:41:43 -0500
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
 b=o6us/gOvgPv94gROrBjlXupBHM+qtmB3Tirfg0ZTe6ptsLJgy9jyEo8h37MgPe1M9sueMcc21v6N7Rx3Szj156TCkcjS5epmGnTpA3jriTi11c+eIa+7cd2s9wfBPVVrMeHBOR45t5bhQPx8tBDN1Iuzk5WIaMRwFWzYbfM0nKxY+fJw9BokcpNAZDErnjCDfkbJRcCmo/rtHJsQ5aU0lvo511EUbZNNRSJSIWDngebblO9BZbDdREbI646IeBV8IiyNjgecY6jkSipTOnZPHFJMB2CafETOLIB6W/hmiVTQKIadLcV9Mvvb2PvZ2O4xMmGkm/9DW5jIL+Z83WrWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4UkN+7fTYVnKhgG0cXQ4SEnlwNdVk3op25ukMyHf0A=;
 b=VYf2eO8+h6jdjiAU0hTTcQEti5gMNN1gxg8mfO/2GBfGrqG8W8lFu6q8IoQtpUOlYHR6wLZP8vYLjNd0KwE4QvW9bucvjAXJ1eeecPMDXkrGqg5sWAWZJq4qIEDwP77APx4K8IGJtoL0j4E5rtl43ULv7+LM3mcTXrSy/8sYakqa/xML2CvTtqo0Rz8rIzW3mDWcDfH0Gez2kbN/kJh5YHpMu7WXfNYyDBBn1xeJBBWRVUxclB9s3A9/CsLJQNGpvtEmtATHVhyCMEa9Y69Y/gDiEviYFHC8+etkqvYvNfeuWQh2q3A192EpiOVQsjjUNbUwKp9lmIzW0eohCzc2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4UkN+7fTYVnKhgG0cXQ4SEnlwNdVk3op25ukMyHf0A=;
 b=d6gaBRU6RI6+J4xvX49r/QLaf1dkfI3KcFyWkDwbzdNfyY3uNJj0o45Rj7tMk1AyzcmFGbjEzz8iA6uASlQmTdhI9/8ODM0aLEj77Ut83ZU/WsfTzYuRi1BHNVnnkm3EZEVP3xz0eHGPHlUetzWOiKcGiUwgYXAO8eqJRuOA+sQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7d4791ee-05cb-490a-a209-a84a6531f0ca@amd.com>
Date: Wed, 1 Apr 2026 08:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260331154309.2921483-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260331154309.2921483-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: cd99f44a-2846-4afe-7906-08de8fb9bde4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h3RRgJUQCnZOhC2ZOt9/OQOxWKzw74odFn5Moo8IZlcfZReEDSqrd46gbXJKRnshu7kGJlIUVP3pqq6M72QeILGQxsxSQp+keXg1lW909QGmqfE/Ixa3CAouFG+OQ+eB7UF0FDCGu9Mb2vKAADa9jOZOwME6gpENhWTMbmCotpFFVPt/SJO3csm1aPZ9WEEl7cDL7cw0NZNkwW2Y0RQy8FdPmjFSQBM1Y3cKMlE5FMCMdM97Bt7n+xtcidv1BC/wMjxSZGB7KlNvmJE7gtFVYG6e0nm2JD6sWGRbibAWb6Sxfk1V3EZAGwWuSCsTlw+MiX8i6SdJQZgrzlzC5K/n/QsMjFC07zp9jyhyw8USBb625AAwiUBBWEvYlRrqMzX8nNithDMkaT9ZY5Rkn0BS9UNJ9DlVitmhnMPLtdrzmgiL/OcQliU1vme+epca6uBikNEqiwHX6BERHS0q0FVXWt6b4LYjAElwoaCCf2zmUBszMOIMivJ+045P8danMbRUOzNgwtBfgZcjuQiu7srvehNKKKhLE0YS0x2MgSeIGXNKEMHrpkWuKgqmHm6PlNr68Nn0THZiGRzjr/c04lYNoU15gGSXGtlqsdjbK3IqMl6rEcvKj+70xJYlfhW7xphgZJOftm8551SrjcXMpHPfxk7uopugCsShArpYOiBVHX0oLfJy0ft4KPFFhuv+H7gUcoAlSnmcZ/zQbi1lUUOZbi+njiH2AqVOBJW2xmWFpRtvGUxFrldpcipS2cHjqu49EyEpONw/0Qro9N2oCLaV1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DlQCr94BEl/KEkk5oTQwnoMG2k92x9dzjuBOsMC1G3kANoJI2r2fGEUo5F1cqokj1tanV84IkilF30p5uFpBu5VI6p3Swkxm8KBBw8vrDlRy75ZZZEfFFkjNeSIzPxHIY7XmKhp9yxOWNgfcI/E282J1W862JwzxIPreA/TgprzLPipBoDp8/8ZOr+yC2r4cR2QRP40I6Z2uXHnAQACcpT3ayUaQumZreE94/oS7z9BxDIoH0ocbMtemKXzq6qNBZ37FG05IcANhxgV8b1wnCpd0DgUJvVDnx2VnzY3P09CqI0fvu9VJmIibIep6mF/5JcMYnGx3XKxet/Yw4jCZjcwgu7zyCdIOSnECXw9hfF5kThgv2xTRPQrZj25erOyZvTKYeV0RdCkS9BTCztRHNBIBNkkLssWoF9wBV16BOi9pvO94wjdsRfCsm2GmhnMj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 06:41:45.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd99f44a-2846-4afe-7906-08de8fb9bde4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
X-purgate-ID: tlsNG-d62444/1775025711-B4358185-4BB7D0BD/0/0
X-purgate-type: clean
X-purgate-size: 3402
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 69A0F375522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 31/03/2026 17:43, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
> 
> Xen fails to construct the hardware domain's device tree with
> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
> (e.g., numerous reserved memory regions) and the host DTB represents
> RAM compactly (e.g., a single reg pair or just a few).
> 
> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
> required for an extra /memory node. While the host DTB might
> represent RAM compactly, make_memory_node() aggregates all
> reserved regions into a single reg property. With NR_MEM_BANKS (256)
> and 64-bit address/size cells, this property can grow up to
> 4KB (256 * 16), easily exceeding the space originally occupied by
> the host DTB's nodes plus the current padding, thereby overflowing
> the allocated buffer.
> 
> Additionally, the SHM regions require space for discrete sub-nodes
> under /reserved-memory node, as well as an appendage to the
> main /memory node. Each of the up to NR_SHMEM_BANKS (32) regions
> triggers the creation of a sub-node with properties (compatible,
> reg, xen,id, and xen,offset). These runtime-generated sub-nodes
> require approximately 142 bytes each, while the appendage consumes
> an additional 16 bytes per region.
> 
> Fix this by increasing DOM0_FDT_EXTRA_SIZE to account for fragmented
> reg properties (NR_MEM_BANKS * 16), the discrete SHM sub-nodes, and
> the SHM appendage to the /memory node (NR_SHMEM_BANKS * (160 + 16)).
> The SHM overhead is conditionally evaluated to avoid over-allocating
> memory when CONFIG_STATIC_SHM=n.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>   V2:
>    - update commit description
>    - update in-code comment
>    - update macro
> ---
> ---
>  xen/arch/arm/domain_build.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3cd251beed..07f331eac8 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -98,11 +98,21 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>  #endif
>  
>  /*
> - * Amount of extra space required to dom0's device tree.  No new nodes
> - * are added (yet) but one terminating reserve map entry (16 bytes) is
> - * added.
> + * Amount of extra space required to dom0's device tree. This covers
> + * nodes generated by Xen, which are not directly copied from the host DTB.
> + * It is calculated as:
> + *  - Space for /hypervisor node (128 bytes).
> + *  - The reserve map terminator (16 bytes).
> + *  - Space for a generated /memory node covering all possible reserved
> + *    memory regions (NR_MEM_BANKS * 16).
> + *  - Space for a generated /reserved-memory node with discrete SHM sub-nodes,
> + *    plus the appendage to the main /memory node (NR_SHMEM_BANKS * (160 + 16)
> + *    bytes). This overhead is dropped when CONFIG_STATIC_SHM is disabled.
>   */
> -#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
> +#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
> +                             (NR_MEM_BANKS * 16) +                    \
NIT: alignment. I'll fix on commit

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


