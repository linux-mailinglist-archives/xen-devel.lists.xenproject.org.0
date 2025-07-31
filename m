Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8186B171A1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 14:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065579.1430959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhSri-0002iZ-JZ; Thu, 31 Jul 2025 12:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065579.1430959; Thu, 31 Jul 2025 12:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhSri-0002fj-GP; Thu, 31 Jul 2025 12:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1065579;
 Thu, 31 Jul 2025 12:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAk1=2M=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uhSrh-0002fd-Gw
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 12:58:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e9de97f-6e0e-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 14:58:31 +0200 (CEST)
Received: from CH0P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::27)
 by CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 12:58:27 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::4) by CH0P221CA0001.outlook.office365.com
 (2603:10b6:610:11c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 12:58:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 12:58:27 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 07:58:25 -0500
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
X-Inumbo-ID: 0e9de97f-6e0e-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wC/lHXCHwWiCaZb7icI4m8WZr8CrXHB9WuUZDFpuwIO2OSeelZIWoZtIAfZJ+ezjxJ8Jtro4wyTTHK90gso/xsJfxEVnGNdDmZw5Z2jb0sfWRGrFdU/rndPQ8rgiGPV8DSm2qW9JnDqicmLkOnszXZ9+kPsJVdpKRLbaLMUsYmxgSbK9Z7SFtenFnx/8TLFo3JVkQKmC1ik807T9WWe5nrjN03FyTMrp/1A/ivTd4BGPwm9EcxyuuJPzhiMZ+YH2pz2CpMtkK+6HqT/toAdc2/ZEcJrB1tQyGtkQkrsQhE9yOWOXlqNTDXBiTgsOK+ytEKbTqmmNrxBh4tutLP4ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RSM/MNDAlV96D5QSqKfladsPTQ2VXwvrkNGuFBgTOg=;
 b=ejx0ZVzTJyo/c3a8OICRO5CNuU8rwfVftUdpCAR+RHaj9jyFA1ewSLcX65vew49Nc92a4WOuGs1mtOmrRwT9B4Wh5ig8dw0cya3AutOnqwQw7urAQ+QT5xzdhj/EVO3FjRVC/7jndE/2TQqIbR80ASLU3fEUuR6L/47yizuYJKrEmss/jQBZ6Jw7IogO8z2H2OVCufXTlsIS4aU75FJT70P53xfNsKevaES4XsKt1srdT6MIVHGq1GvTq/LI3j+NOMODYGq6l+SxlMLMA+UfX9GOiTV4cDHSH8E8Y6yHOxwJTBbXbWcWMJipgnZCqLRDeuCr0OOXGmN/R/t5o/I2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RSM/MNDAlV96D5QSqKfladsPTQ2VXwvrkNGuFBgTOg=;
 b=p/TnrcVXh11fm0kPHMLKOj2gW4kpZNUgQBARlTlgiGII1PDZqlPQZpa5uaVZemjufXKhjpov7HZ7i/qOgxYEmbSfzLKrmpn2WF+rDSCbFFWQkgbEkOVkS2FiJ3d8Zcr6qoMOGeXZ7Q1xNkXgs0i18+0aZfAoYJivm46izUUqUVM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Jul 2025 14:58:24 +0200
Message-ID: <DBQ9B06NKSZT.23EK71GSDK04M@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN][PATCH 5/7] dom0less: Parse memory properties in the
 common bindings
X-Mailer: aerc 0.20.1
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
 <20250731094234.996684-6-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-6-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CY8PR12MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a8d1d0-f184-44fc-75ed-08ddd031f13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHBWSzE4dklKTk41dzRmMi9WbVQ0eC9HSFNFN1Mwc3E4dWMyQzFnbEEzZjIz?=
 =?utf-8?B?N1MzWmlWTURrdzZyb2hTNmovalJsQ1FCaVp0VWlmRDhTcVdqeGZXMHIvc21O?=
 =?utf-8?B?VUZBdExxZHhsb1RIb0M1S050V1ZrNzNtYW9ReGpmd0tJeE5rS1FHb0pRVHo3?=
 =?utf-8?B?Q3c0TUR1MlAyRGZBOU8xY1BPSVpEeXV0a3BmQkdtS0dNSk5yZjFxT0VVUUJK?=
 =?utf-8?B?SGliempCLzhXUWJjMmJvd0NxWWNMcVRIMXhMVmFVczlhdE80WWxmdFNxRGFH?=
 =?utf-8?B?VFg3VndrZkNzbG1kbDlwc01ROHUwNGc5SGRuWlUrd09iQlZoMEhUTGRiTXNq?=
 =?utf-8?B?d2d6K3VYSmhjK1Vnb0RUZ3hiM2RZUVJKV0Z2MHEwTWU1V2VqbXRNcGRoc01h?=
 =?utf-8?B?OVR4U09neTI5Q0ZVOVdnWGtOV1FPMDZVaE9pODhYMW82blJLNFByenlXQy9D?=
 =?utf-8?B?SkhPd0dBbWdNaFVxQVJjQlRhcHEzaEQxQTBKQzZ0WDdpZVF5OUFHdDdXWW1K?=
 =?utf-8?B?MkxaTVVtSXFuTi9xaFozYUs0RER0dG1KT1huU3FWOUFVTXc2TmlVdXVPamdp?=
 =?utf-8?B?a2RIM2lwS2ptemd1VGdyTG1yUVRMSEI2Uk1PNWJWcS9ibFVhZTZhYWJ0aTNh?=
 =?utf-8?B?cmhobTFYQ0thQVdmY3NKTVAzQ1kwOG1oTVRHVVYwL1QyREJEMFo0TWpYM0I5?=
 =?utf-8?B?dkdQWEl0L0Q0RjJrTGRGaFR4SGhqdkZLYnhZbWFZVXNpcHl5SkJDRDZOc1E0?=
 =?utf-8?B?SFI3bnVrWnprRmF5WC96dm1KRFFSQi9OYjdrOGFET2JicHhsdGlFNGhXam45?=
 =?utf-8?B?eXhoclpmbFhpVDJZVVpuMXdlazcyVjFETlNZc1NxcEx5MXhmWGdhc1NZVVc3?=
 =?utf-8?B?NjlxK092Um1kWEZOS1JKTkFYTWlTV1hmTDBQdktXZWpMOHJuZEVjL093dmtM?=
 =?utf-8?B?L0psazFuZGlRWnRDM0ZjbEU3SG1DUFhvc0F2S20wSmFrRjRvTVFWOEh3NlZw?=
 =?utf-8?B?TDZBbGlCL0pubVlja255YXFnY0xUZFN1Szg3bVVDbys0R0NPaWFUK0IzaDRM?=
 =?utf-8?B?OXJOdDdOZmF2bXY5WFh0N2xuMjU1eklaZ0N6VlFQNDNUc0toRm1iZkVFaXpJ?=
 =?utf-8?B?NFdEa05qTnYzeFNZMHJkRE1VRUFjYjhDejZ4T0g4K1hscHZMQ1I0dHFsZ3R5?=
 =?utf-8?B?YnVSRmJ2T3d2OWcvQkxVRVhVcEc1bnJHR2IvNStZcC9XdDdIdTlwbGlvNXRr?=
 =?utf-8?B?MUQ2d2lrcmJrcm5wMTFGQkpmTWwwSTZBRXJvdUhSMGJzZEw3aCtSMDFJRUY0?=
 =?utf-8?B?dXM3SnlaVE9VajJBRHdRR0dIZ1orSW43TjlHNnh0L2NQRkhJTTdjbmdYZG9O?=
 =?utf-8?B?RFgyczAveHlzMkVTSm9wQzdFV0NpMGNRcHVUY1Q1NFZyc1BGeXkxMXFJUkk0?=
 =?utf-8?B?Vi8zekVSVFFXQ2x6N2JtdXl4SE1mSXFXRmo4UzRtb2tNT0oyOGcyZFNXanRQ?=
 =?utf-8?B?eVlWbzBXYXJYcVRtcFZVa2x4ZkZscWtKV3J4MDhiSVR4UkV3NWtHUnhoUENE?=
 =?utf-8?B?TUVNUkUvenlmSEw1VkdwNEFKS3I5OGFqRUE3Mkt6bzNmMklYZy9vRzVOMlhC?=
 =?utf-8?B?aVRrdG5hc1RCNTZ6ZEZoQnY2YXZSUi9ZNUlkSWgxRGtOUlp5bG5sTkNOa1l4?=
 =?utf-8?B?RFBCN0d1YmhWY2UwRElSTjlvSW4zbjNQNVNOZjBsclVzNTZ6dnZNdzZZYWwy?=
 =?utf-8?B?dWQxMURRdWlEeExkVHVsU0RaU3R2NTJUZ0FESkFIVEpXWUhFMFIyV2ZYZlQy?=
 =?utf-8?B?Q3ZUcEFzdmtVL292d3FVTnpNNnY5WWZCTG95TmlzMExWcG1TWEJ3TFlaNUVW?=
 =?utf-8?B?OGNsRWc4YTltVjhjTEd4cGhnamRBSXU4N09weW1BWXI3OFRuTkJjZUUwcGJi?=
 =?utf-8?B?eFc4amU4SE1sSGNrTWhrRkRJOTVnMXdNZXpESlpzTS9Cd2I0TzhaNisxa2FK?=
 =?utf-8?B?SnhvY3RTUUFhRGdYZDliMTJUWStsK2RGL1N4OE11UDFJWW9hM2g2UlBnTTJp?=
 =?utf-8?Q?SVCI9U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 12:58:27.4872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a8d1d0-f184-44fc-75ed-08ddd031f13b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7435

On Thu Jul 31, 2025 at 11:42 AM CEST, Grygorii Strashko wrote:
> From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> Move the "memory" binding from dom0less-build to dom0less-bindings.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/common/device-tree/dom0less-bindings.c | 3 +++
>  xen/common/device-tree/dom0less-build.c    | 8 +-------
>  xen/include/xen/bootfdt.h                  | 2 ++
>  3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/devi=
ce-tree/dom0less-bindings.c
> index 41d72d0d580a..4513f03e367b 100644
> --- a/xen/common/device-tree/dom0less-bindings.c
> +++ b/xen/common/device-tree/dom0less-bindings.c
> @@ -141,5 +141,8 @@ int __init parse_dom0less_node(struct dt_device_node =
*node,
>          panic("'llc-colors' found, but LLC coloring is disabled\n");
>  #endif
> =20
> +    if ( !dt_property_read_u64(node, "memory", &bd->memory) )
> +        panic("missing memory binding for %s.\n", dt_node_name(node));
> +
>      return arch_parse_dom0less_node(node, bd);
>  }
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 6bb038111de9..8906e35e6978 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -738,14 +738,8 @@ static int __init construct_domU(struct kernel_info =
*kinfo,
>      struct domain *d =3D kinfo->bd.d;
>      const char *dom0less_enhanced;
>      int rc;
> -    u64 mem;
> +    uint64_t mem =3D kinfo->bd.memory;
> =20
> -    rc =3D dt_property_read_u64(node, "memory", &mem);
> -    if ( !rc )
> -    {
> -        printk("Error building DomU: cannot read \"memory\" property\n")=
;
> -        return -EINVAL;
> -    }
>      kinfo->unassigned_mem =3D (paddr_t)mem * SZ_1K;
> =20
>      rc =3D domain_p2m_set_allocation(d, mem, node);
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 0e82ccea2f84..0b73ed835000 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -121,6 +121,8 @@ struct boot_domain {
>      struct boot_module *initrd;
> =20
>      const char *cmdline;
> +    /* Memory the domain is expected to have attached after creation */
> +    uint64_t memory;

Either state here that the units are 1K, or make the units bytes by multipl=
ying
the result from the binding by 1K. If the latter, you can probably replace =
all
instances of "unassigned_mem" for "memory" in boot_domain and remove that f=
ield
in kernel_info, which goes in line with the intention of shrinking kernel_i=
nfo
in favour of boot_domain.

Cheers,
Alejandro

