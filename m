Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846E9D4AE2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 11:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841281.1256769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4PZ-0001P8-E9; Thu, 21 Nov 2024 10:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841281.1256769; Thu, 21 Nov 2024 10:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4PZ-0001Ne-BC; Thu, 21 Nov 2024 10:27:45 +0000
Received: by outflank-mailman (input) for mailman id 841281;
 Thu, 21 Nov 2024 10:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7dD=SQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tE4PY-0001NY-Ac
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 10:27:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c0d21ba-a7f3-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 11:27:40 +0100 (CET)
Received: from MW4PR03CA0241.namprd03.prod.outlook.com (2603:10b6:303:b4::6)
 by DM4PR12MB6398.namprd12.prod.outlook.com (2603:10b6:8:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 10:27:34 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::77) by MW4PR03CA0241.outlook.office365.com
 (2603:10b6:303:b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Thu, 21 Nov 2024 10:27:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 10:27:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 04:27:33 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 04:27:31 -0600
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
X-Inumbo-ID: 3c0d21ba-a7f3-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjAyIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjNjMGQyMWJhLWE3ZjMtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTg0ODYwLjAyNDY5NSwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sA6gjVI97pJWR3VqCwai4yssfB9Jl1/XhklJWQ+nGlZjEOJLA9gmr9JBISf3hoXoKZJXpoFCsj70PATf98iwy7uoc0csatZd0n9/rBPuaWyNCHeVlsO8K0p7DHLCPmdwhNI8QZfJEMstfIs1R9QWPK+aQKf/4/rUexSfwMB7CHoDmTyijgjHFXX3iplQtXOuqAV3nPDjiyID3fuE2NlHrtqt6XPcD1vwEPqzdwxGXvtwXi/4BuujnGFlYE8ta9W9Qa/fuiMGTI2XhVD1h/MlXM+C/d5mWEQ3uLSMx+dETMjW30bNKtERFuL6Fj/JtCkoo18LpjYvaHMWA9SNzgi8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIXn4ITrUG/XnG2Fc3dZysNG4aJEGMa3yR8pa6UN9pg=;
 b=faaJkzWM2UpEvz0/JtdJKqe7GqenJMZ1C5ozdZ7AWVBA68ISTckWh6Jfcq9ODf+WtMJMER2p/14K5IXWM+2pSLzaTk+WyATsVYoqnxtRLC6CrPjVGOy3yA22xXWTnnDKonxA4UsR+54Y4sBCoLPym6j32hC76F17X50UlW6D4k8ADAaBpbZPBROc//+Kk0b1M1LdylquuvLDUIAHqgy+Lqmw5XpJBcwvSBgFInRSZpWS43aq1cSBgauTGAIJX7PyLaOidLFjI76uAWfhjlx4T7wF/LitttlwJZZqHPX66Dv/Bq853j8++1heh9P0uqHL9KT98odVq49y97XHxfu+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIXn4ITrUG/XnG2Fc3dZysNG4aJEGMa3yR8pa6UN9pg=;
 b=Od3f/ZUFTluOtvZ5TYQqw2YvDdqQIXs5klU8KUG60xy5tEra5J4HbUh+dxCZrPnSSIVGmWpkC1OSN3o6x6iTHRlk5Cj4uCFG3qq3AKIjlRnuw2/qH0eJoU19NZbk96gG2eCj0lr8H9fxHNbb8fPkk4fDe5oS4O8lkdBw7Wx3x6I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <74f837dc-eaeb-495f-89ca-296eb56ad36b@amd.com>
Date: Thu, 21 Nov 2024 11:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/common: Move gic_dt_preinit() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <54d0ff689e167b3f3137afea45307f762ce0a974.1732027385.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <54d0ff689e167b3f3137afea45307f762ce0a974.1732027385.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DM4PR12MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdde05e-7e18-4c9b-450d-08dd0a171ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0R2b2hPbmlsaVM0VTcydkdRbWhmM2JuSTBaMFhZS2h6Qm5GMGp4cGkvQTJR?=
 =?utf-8?B?VTlBUC9SbFpqeE4zOTB2YVRQUDNncm9HSXNoQ2Y3YUdQQTg3VGRJM0ZuQlFx?=
 =?utf-8?B?NGthVDJvalgxYUJoczdERXJqUGl5aUwzd1poTEZCQzRhM1ZNS3ExK1ZsdWYw?=
 =?utf-8?B?dStkZlVsK05UQzQzUjlLOVd2bmF6cUZ4TmtuWVZwU2JoTXBjWkpjOHlScm5C?=
 =?utf-8?B?eU9mZktVa2xDVHo3QU1teDlzR1dCQjRWU0VIVDN5VUhkcVdzUzR1MTNvZjlv?=
 =?utf-8?B?TVdiS2hKOGdMVThaNDNtVnMwSUs1dTJPNnJQQmhLWjNKM2NhYnplQTV4Ly8v?=
 =?utf-8?B?MW5oV1hqSnNSUXFYc2UyeUpLbTFFSjA1Y0ExOEt2eU1mRitWU1NOQkJxYVMx?=
 =?utf-8?B?dnhRMDZsdTIyYTFtQ0VJYVRoeFA1TG91dDgySzZ1SGJvR1dUOS9kMUREdmc5?=
 =?utf-8?B?ajU0LysxWkFMbTdzeUJqckZoSktGbDNvSFBXRmgyUWRDRzNDNFEzK1pibnlO?=
 =?utf-8?B?MHJaSVdLa3dKdnRGSjZHMndtYk5xMm8wRGt0NndBbTdnRlF3QUJoVzEweFQy?=
 =?utf-8?B?aHJxTXlCbHNXeTMrOGM3RTdkanNkVVFkYjNGZ25CU25iUHRORmY1Q2pVRHNS?=
 =?utf-8?B?UmJwVE8yaXY5WkFPeG5Edi9DcW91M3dPbWtrMkdLcTJZUjhITGlLQ3RJWWln?=
 =?utf-8?B?NUQ0bDdBdFlYcUkvV2I3NURYYkFSUUM5NlZkVmozeFMxb3krWFpTdFdLU1N3?=
 =?utf-8?B?SDdwSEQ2WExPYWVhdEJ1aGZmOHoxRER3OWdYUjhRR1NJTlVJYWFhSENBRFB2?=
 =?utf-8?B?NEdIK0NXb3lsUjQ5d005azhvcjN5dHEzWVZUZUdyYVh0YXdCV211ZGFVdVVy?=
 =?utf-8?B?K1NNbytsSm9OK1ZqTVJMaTNudEVvUWFNUzdPcXNPblEvZlBRSUIzb3dDUWNk?=
 =?utf-8?B?eDVDNklwME5rdFpJRS9obVBJdUg1SmJPaTZ6dk1wMTNYNGVMUVpwZjlOV0I2?=
 =?utf-8?B?dWw2TUlscHl5VWQvUjh2empoSE9kQjNRTjJ6a2pMc2hiNHhTb0kwOXN0NTdE?=
 =?utf-8?B?Q0FHZ1g1Z1FvNk5sZHJveCtUVWxDWGJLc1Y0WDIvSGgrSUpLTHpkUmJLVjBn?=
 =?utf-8?B?THhFM2VDaUJCTTFWUkxXZ1Brcjc1cnQ3ZU9yb3psa2pQZ2ZkZGthQ3RlVjZB?=
 =?utf-8?B?VW5LVEhIM00xaVdYNjA3c09BdUtrdDJ6OTNnb2R5NlppNldVbG5HeUEvL3Mw?=
 =?utf-8?B?V2hUSzhHNWNhK3JzTTlFa3ZHZVJIU3RodWFDWEwrVGZvZ1k5MUZFb0IxcEJ2?=
 =?utf-8?B?N2U1b1ZlT2dKVjE0WEloNmYzYk1NYkpoUW5BS0pwSHROMUx6ODZZM1c1Si82?=
 =?utf-8?B?ZUNUYjRoQU9BRHZVYU1hTUdvTFc5NUV6S09KZTU3VG13eENRL2xhOW5zSVl4?=
 =?utf-8?B?a2RoZ0t6WnQwcVgxVCtSbWc2cG9Hak9PY08wUkppbG5jYmFwMW0vWDYzNnU0?=
 =?utf-8?B?Sk42dWZnK3RmZ1A1MkFHK3pPQjZPWlZJdFFEaHl4OG8yYWVsUWpMampzSGVG?=
 =?utf-8?B?ejhMNlNUSEptTTRySmVrTjJqK3N2K3ZmUGMyWi9idWtpK1N6ZmtvUTdFQVlY?=
 =?utf-8?B?Tkp5NTdTTEJOZytwK1BiMzNZdG10ME4wVDhzWnhxRkwyWS9VZ21LeER0Q2Ju?=
 =?utf-8?B?YWlnRGRtZ1JadkxvVTJjTlFlMjREZGFQN1dkSWtwWHo2b3lqSXNreldVU000?=
 =?utf-8?B?OGVCVVBHMmhGWFBTYkpEN3N6RU9OWUMvU0x5aXA4THpOZldVWGpzbTNoeUJJ?=
 =?utf-8?B?MEI0TVYxN3pMbStWdUFycWxBZlJ0R1AwWVRxQ081RXIyWUt2QlZpVVcxQm51?=
 =?utf-8?B?WjBLZnQzWC92RFZiZ0lza1UvZmpWTXByM3V5YUN3bFBwZ2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 10:27:33.9654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdde05e-7e18-4c9b-450d-08dd0a171ce1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6398



On 19/11/2024 15:56, Oleksii Kurochko wrote:
> 
> 
> Introduce intc_dt_preinit() in the common codebase, as it is not
> architecture-specific and can be reused by both PPC and RISC-V.
> This function identifies the node with the interrupt-controller property
> in the device tree and calls device_init() to handle architecture-specific
> initialization of the interrupt controller.
> 
> Make minor adjustments compared to the original ARM implementation of
> gic_dt_preinit():
>  - Remove the local rc variable in gic_dt_preinit() since it is only used once.
>  - Change the prefix from gic to intc to clarify that the function is not
>    specific to ARM’s GIC, making it suitable for other architectures as well.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v4:
>  - Add SPDX tag in intc.c
>  - s/num_gics/num_intc
>  - Update the comment: s/GIC/interrupt controller.
> ---
> Changes in v3:
>  - s/ic/intc.
>  - Update the commit message.
>  - Move intc_dt_preinit() to common/device-tree/intc.c.
>  - Add declaration of intc_dt_preinit() in xen/device_tree.h.
>  - Revert intc_preinit()-related changes and just back gic_preinit() in
>    Arm's gic.c.
>  - Revert ACPI-related changes.
> ---
> Changes in v2:
>  - Revert changes connected to moving of gic_acpi_preinit() to common code as
>    it isn't really architecture indepent part.
>  - Update the commit message.
>  - Move stub of ic_acpi_preinit() to <asm-generic/device.h> for the case when
>    CONFIG_ACPI=n.
> ---
>  xen/arch/arm/gic.c              | 32 +-----------------------------
>  xen/common/device-tree/Makefile |  1 +
>  xen/common/device-tree/intc.c   | 35 +++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h   |  6 ++++++
>  4 files changed, 43 insertions(+), 31 deletions(-)
>  create mode 100644 xen/common/device-tree/intc.c
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 3eaf670fd7..acf61a4de3 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -214,36 +214,6 @@ int gic_map_hwdom_extra_mappings(struct domain *d)
>      return 0;
>  }
> 
> -static void __init gic_dt_preinit(void)
> -{
> -    int rc;
> -    struct dt_device_node *node;
> -    uint8_t num_gics = 0;
> -
> -    dt_for_each_device_node( dt_host, node )
> -    {
> -        if ( !dt_get_property(node, "interrupt-controller", NULL) )
> -            continue;
> -
> -        if ( !dt_get_parent(node) )
> -            continue;
> -
> -        rc = device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL);
> -        if ( !rc )
> -        {
> -            /* NOTE: Only one GIC is supported */
> -            num_gics = 1;
> -            break;
> -        }
> -    }
> -    if ( !num_gics )
> -        panic("Unable to find compatible GIC in the device tree\n");
> -
> -    /* Set the GIC as the primary interrupt controller */
> -    dt_interrupt_controller = node;
> -    dt_device_set_used_by(node, DOMID_XEN);
> -}
> -
>  #ifdef CONFIG_ACPI
>  static void __init gic_acpi_preinit(void)
>  {
> @@ -269,7 +239,7 @@ static void __init gic_acpi_preinit(void) { }
>  void __init gic_preinit(void)
>  {
>      if ( acpi_disabled )
> -        gic_dt_preinit();
> +        intc_dt_preinit();
>      else
>          gic_acpi_preinit();
>  }
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 58052d074e..7c549be38a 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -2,3 +2,4 @@ obj-y += bootfdt.init.o
>  obj-y += bootinfo.init.o
>  obj-y += device-tree.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> +obj-y += intc.o
> diff --git a/xen/common/device-tree/intc.c b/xen/common/device-tree/intc.c
> new file mode 100644
> index 0000000000..d2bcbc2d5e
> --- /dev/null
> +++ b/xen/common/device-tree/intc.c
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/device_tree.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +
> +void __init intc_dt_preinit(void)
> +{
> +    struct dt_device_node *node;
> +    uint8_t num_intc = 0;
> +
> +    dt_for_each_device_node( dt_host, node )
> +    {
> +        if ( !dt_get_property(node, "interrupt-controller", NULL) )
> +            continue;
> +
> +        if ( !dt_get_parent(node) )
> +            continue;
> +
> +        if ( !device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL) )
> +        {
> +            /* NOTE: Only one interrupt controller is supported */
> +            num_intc = 1;
> +            break;
> +        }
> +    }
> +
> +    if ( !num_intc )
> +        panic("Unable to find compatible interrupt contoller"
> +              "in the device tree\n");
Don't split printk messages. Also the split is incorrect as it'll result in "contollerin" (i.e. no space in between).
Also s/contoller/controller/
 
> +
> +    /* Set the interrupt controller as the primary interrupt controller */
> +    dt_interrupt_controller = node;
> +    dt_device_set_used_by(node, DOMID_XEN);
> +}
Missing EMACS block at the end of file.

> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index e6287305a7..33d70b9594 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -238,6 +238,12 @@ extern rwlock_t dt_host_lock;
>  struct dt_device_node *
>  dt_find_interrupt_controller(const struct dt_device_match *matches);
> 
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +void intc_dt_preinit(void);
> +#else
> +static inline void intc_dt_preinit(void) { }
> +#endif
Is it really needed to provide the stub and guards? Other DT related functions in this header are not
protected and AFAICT the inclusion of this header only works if CONFIG_HAS_DEVICE_TREE=y.

~Michal

