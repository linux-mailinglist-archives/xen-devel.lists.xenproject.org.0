Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A2C96949C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788643.1198080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNay-0003A9-1n; Tue, 03 Sep 2024 07:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788643.1198080; Tue, 03 Sep 2024 07:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNax-00037S-U9; Tue, 03 Sep 2024 07:04:55 +0000
Received: by outflank-mailman (input) for mailman id 788643;
 Tue, 03 Sep 2024 07:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqql=QB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1slNav-00037M-KI
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:04:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2417::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd4cc3fb-69c2-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 09:04:47 +0200 (CEST)
Received: from CH0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:610:b3::22)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:04:43 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::9c) by CH0PR03CA0047.outlook.office365.com
 (2603:10b6:610:b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 07:04:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 07:04:42 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 02:04:38 -0500
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
X-Inumbo-ID: cd4cc3fb-69c2-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocMm2SkZoeUt6VK3U8sGw+7+3gjBHlsk1fXxpzeMNIxI99qSRAyM7L4vAWDox5zIrT3LnKdepPmPQwOzpHjXnIcJyzhvrztkTGhzvLT6tpZY8/UjQDVi8C8JlXB8Od0zT5lH0QnkUT95VgblgZU6yqJTOC/DAO9rCzMHUR5IZ0cdTcG0eQw+HyZrykdqec0bUktwMh+oVpUWieQusqxeYvF0lElJRRvuUW44QFGSiy7ghvz2EmoCI8KtLdIh9ycOcobILAWgQWQHoYUOL82aVIi/2Hglbn7WBLiQ6sc/VQLlko7zWZl964GfoHp2S5pVPYNAmc+IF3e3kaJ5zkn21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIXEiPndAjdBI+7U+N4I+Ks+PHIk5UDZQB5eub/RCeU=;
 b=noXMTlHDixybuW4C+0uCPVzVvjctrBzg1MUVQ/BJXatyZGfdhjB5a2iwjVSg0ezwRvxgZaV/WpBuYxc7cT09om9BXeIn/+8S0Jt/DRcepdnOyPgVZo+ut9h3w7rrBepXvl8zpvtnrgIWkJ3BjBpyhTxaHD1+5oKSsY45etLpuH+gTz5iEWmGj6BGNfcYfQD9SDLLJUx2H7O/0dGjbNXbBXR/Ntn86w8K8qnqmg8YsVHM11Q8J2uc9dk5v40ih/ks83sNG3o7ncm5LsdjeGCQNmaRR1xB0PlNPLMjzH5WhUVrWQzyJMRSo37mhXUBRrKUrBAIHHIc2RaTWkpjCHn04Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIXEiPndAjdBI+7U+N4I+Ks+PHIk5UDZQB5eub/RCeU=;
 b=HtFPNAZowbr5lvl6WU1qDNKt4C7Xgo5WLO6OHpQNcIHdlKZlurGvZdfyfxsRTnbAFNN9PtY1M8EUsRatushODJUxGVLEG60/s+1RsaDgSWH4ssQjZFfjh9t3VXUxoWLb/Uy9h2OBAq8ThDhHutuvWSwkyuu7Gw9xjQTeJCYlQoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v14 0/5] Support device passthrough when dom0 is PVH on Xen
Date: Tue, 3 Sep 2024 15:04:19 +0800
Message-ID: <20240903070424.982218-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a7abfd-1c36-4e28-0e9c-08dccbe6afda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lNdeCbvweKGt+2H6WGVBETEgrjuDCqWcp0hEJNH4NoAVXjaj7Y21pgKwcRON?=
 =?us-ascii?Q?9iRusKWst4gdkaDd0Ls7wVnmBTwGgtfXt5zlrIwz/DE2xwSHsierMRCFGJJs?=
 =?us-ascii?Q?d+CLDnN/JUgA8XNXvScFSTOHaOttB2/h0SN+jYT0x2Oj0Cc0Vzl38NNVSqFU?=
 =?us-ascii?Q?FvDpX8JP/9SFuySa2dtOMWMAC9OTgvdcGpjIfQDSbtuOtdXnBI6hD3s2EaMO?=
 =?us-ascii?Q?GYzhi/A+OLfsi7j0SpHbnZOxKV8daKhLCFBXl0eF9wJ62IR7Ug1Qu6MqUqwf?=
 =?us-ascii?Q?Du7bSjFQp1DeHdUkvHQ3tZjGNdCM1Bd0gfWyWJBLFcwUpqEKbJTOkFM7z7g6?=
 =?us-ascii?Q?Yr5i9etdOwz6xUMNBS41SgND05Z1L8B0cuWAlldG9VL0hg9qqcSzR2c2qwKC?=
 =?us-ascii?Q?icxZdTdDUeHAQy601fkNYPRIxFkcnrYfmqgPg8JHxwFp4N6cHrALizsTStN1?=
 =?us-ascii?Q?5IvuS3rAUdvod7hz3c0C1FmIYAR+ztvecQdZ5tgODIbWsQ9yYk7sS/I2dIop?=
 =?us-ascii?Q?jan55nIWzAPojnvStGkS4LeZ8sm6S5NaUld1aXCLGxE0a/ecCxtGNB4VM5el?=
 =?us-ascii?Q?4N2ZaPl9H68VPrUSAMYk7XW6fbZoK+zUd/yOUchf6SswQhEYswRCNzjEx5j8?=
 =?us-ascii?Q?dFkCQC67HwLtbPz0BO7GCnrxuAvBMPviEhM3pD9EurCPJSa7vPwpr1HXDwHC?=
 =?us-ascii?Q?DBtbw+DL2HB5jGKuhSS2CXWC9YcjEf6BDV0rL97kPrnr55GaLtvkCAhL7Ovc?=
 =?us-ascii?Q?9hObj31oqSp9x8m0c/+3Tea9q6ZMuHFZuc5qP6yrmGtsF0/vsLROuXCIQ4Vi?=
 =?us-ascii?Q?ogJ9eFDdub5qe1twaXzhCVPL7vk+M1/wn3AwBWbMa46SlnS4N+psKgzj6a6x?=
 =?us-ascii?Q?DfGK7zCrEcJ4l9KaGdoGQ47LFaqtLrXt+YFVRc/4+hsVWjQcVhaPcCgP5cle?=
 =?us-ascii?Q?yIh+YgrEuXSxSqkdw24fma/zasKZvMjNK8+ccJu3+68dhAzHrczVjbCxo5Po?=
 =?us-ascii?Q?ty1Uml5/IJSJZIZZJBcQVRKYxLvzTC+tNfSauwHX7I9flEE5Pp2z+jZiQ+ZA?=
 =?us-ascii?Q?n4tSASbGnP69x/SQGmdxqnN5fWp6kZbK1sdgabki1Q2ZCbpZudbiuhlW9uJO?=
 =?us-ascii?Q?qGn+vgC49FMlP+/I1WVhGfK2mBLTmRzsSu7n2MOrZZ1k1JXfWxzE2ZN/pdnC?=
 =?us-ascii?Q?vzTu7glQi023bbvBnvA9L829jkfvRFTpXDJYLgw7EppTbM3wjKA5Byz8AdYV?=
 =?us-ascii?Q?d4Fztj/0xDrhkUkTfvcI3GZfDySAFMVjGMCJ/lwgtTDxzPzFnAEly4QBbAJ8?=
 =?us-ascii?Q?GsuMendYD99t4Z3EjEMBiIr9g42/L54zE0V5M0rca3yB+UsitA7SU4nMQGhg?=
 =?us-ascii?Q?TtDtkmEHexIFOAfWaLiMPJ+a2ucLtk08uoxUWW16qTff7moLt0+B5i/yQD3F?=
 =?us-ascii?Q?2cL9ldAn7Myf9BVuQmlpun1HndMZSLGSwhb5/LhXpwXSuhKabYQbWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:04:42.9862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a7abfd-1c36-4e28-0e9c-08dccbe6afda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840

Hi All,
This is v14 series to support passthrough when dom0 is PVH
The expected merge order of this series is the first two patches in this series, then patches on
kernel side, then the last three patches in this series.

v13->v14 changes:
* patch#1: Removed the check ( !is_pci_passthrough_enabled() ).
           Added if ( dev_reset.flags & ~PCI_DEVICE_RESET_MASK ) to check if the other bits are zero.

* patch#2: Modified the commit message.
		   
Due to the patch#3 of v13 had been merged, so the sequence number of following patches are v13 decrese one.
		   
* patch#3~5: No changes.

Best regards,
Jiqian Chen


v12->v13 changes:
Due to major changes in the codes, all the Reviewed-by received before have been removed.
Please review them again.
* patch#1: Delete all "state" words in new code, because it is not necessary.
           Delete unnecessary parameter reset_type of function vpci_reset_device, and changed this
           function to inline function.
           Add description to commit message to indicate that the classification of reset types is
           for possible different behaviors in the future.
           Rename reset_type of struct pci_device_reset to flags, and modified the value of macro
           definition of reset, let them occupy two lowest bits.
           Change the function vpci_reset_device to an inline function and delete the
           "ASSERT(rw_is_write_locked(&pdev->domain->pci_lock))"; because this exists in subsequent
           functions and it accesses domain and pci_lock, which will affect the compilation process.
* patch#2: Remove the PHYSDEVOP_(un)map_pirq restriction check for pvh domU and added a corresponding
           description in the commit message.
* patch#3: Add more detailed descriptions into commit message not just callstack.
* patch#4: For struct xen_domctl_gsi_permission, rename "access_flag" to "flags", change its type from
           uint8_t to uint32_t, delete "pad", add XEN_DOMCTL_GSI_REVOKE and XEN_DOMCTL_GSI_GRANT macros.
           Move "gsi > highest_gsi()" into function gsi_2_irq.
           Modify parameter gsi in function gsi_2_irq and mp_find_ioapic to unsigned int type.
           Delete unnecessary spaces and brackets around "~XEN_DOMCTL_GSI_ACTION_MASK".
           Delete unnecessary goto statements and change to direct break.
           Add description in commit message to explain how gsi to irq is converted.
* patch#5: Rename the function xc_physdev_gsi_from_pcidev to xc_pcidev_get_gsi to avoid confusion with
           physdev namesapce.
           Move the implementation of xc_pcidev_get_gsi into xc_linux.c.
           Directly use xencall_fd(xch->xcall) in the function xc_pcidev_get_gsi instead of opening
           "privcmd".
* patch#6: Delete patch #6 of v12, and added function xc_physdev_map_pirq_gsi to map pirq for gsi.
           For functions that generate libxl error, changed the return value from -1 to ERROR_*.
           Instead of declaring "ctx", use the macro "CTX".
           Add the function libxl__arch_local_romain_ has_pirq_notion to determine if there is a concept
           of pirq in the domain where xl is located.
           In the function libxl__arch_hvm_unmap_gsi, before unmap_pirq, use map_pirq to obtain the pirq
           corresponding to gsi.


v11->v12 changes:
* patch#1: Change the title of this patch.
           Remove unnecessary notes, erroneous stamps, and #define.
* patch#2: Avoid using return, set error code instead when (un)map is not allowed.
           Due to functional change in v11, remove the Reviewed-by of Stefano.
* patch#3: Add more detailed descriptions into commit message not just callstack.

patch#4 in v11: remove from this series and upstream individually.

* patch#4: is patch#5 of v11, change nr_irqs_gsi to highest_gsi() to check gsi boundary, then need to
           remove "__init" of highest_gsi function.
           Change the check of irq boundary from <0 to <=0, and remove unnecessary space.
           Add #define XEN_DOMCTL_GSI_PERMISSION_MASK 1 to get lowest bit.
* patch#5: Add explanation of whether the caller of xc_physdev_map_pirq is affected.


v10->v11 changes:
* patch#1: Move the curly braces of "case PHYSDEVOP_pci_device_state_reset" to the next line.
           Delete unnecessary local variables "struct physdev_pci_device *dev".
           Downgrade printk to dprintk.
           Moved struct pci_device_state_reset to the public header file.
           Delete enum pci_device_state_reset_type, and use macro definitions to represent different
           reset types.
           Delete pci_device_state_reset_method, and add switch cases in PHYSDEVOP_pci_device_state_reset
           to handle different reset functions.
           Add reset type as a function parameter for vpci_reset_device_state for possible future use
* patch#2: Delete the judgment of "d==currd", so that we can prevent physdev_(un)map_pirq from being
           executed when domU has no pirq, instead of just preventing self-mapping; and modify the
           description of the commit message accordingly.
* patch#3: Modify the commit message to explain why the gsi of normal devices can work in PVH dom0 and why
           the passthrough device does not work in PVH dom0.
* patch#4: New patch, modification of allocate_pirq function, return the allocated pirq when there is
           already an allocated pirq and the caller has no specific requirements for pirq, and make it
           successful.
* patch#5: Modification on the hypervisor side proposed from patch#5 of v10.
           Add non-zero judgment for other bits of allow_access.
           Delete unnecessary judgment "if ( is_pv_domain(currd) || has_pirq(currd) )".
           Change the error exit path identifier "out" to "gsi_permission_out".
           Use ARRAY_SIZE() instead of open coed.
* patch#6: New patch, modification of xc_physdev_map_pirq to support mapping gsi to an idle pirq.
* patch#7: Patch#4 of v10, directly open "/dev/xen/privcmd" in the function xc_physdev_gsi_from_dev
           instead of adding unnecessary functions to libxencall.
           Change the type of gsi in the structure privcmd_gsi_from_dev from int to u32.
* patch#8: Modification of the tools part of patches#4 and #5 of v10, use privcmd_gsi_from_dev to get
           gsi, and use XEN_DOMCTL_gsi_permission to grant gsi.
           Change the hard-coded 0 to use LIBXL_TOOLSTACK_DOMID.
           Add libxl__arch_hvm_map_gsi to distinguish x86 related implementations.
           Add a list pcidev_pirq_list to record the relationship between sbdf and pirq, which can be
           used to obtain the corresponding pirq when unmap PIRQ.


v9->v10 changes:
* patch#2: Indent the comments above PHYSDEVOP_map_pirq according to the code style.
* patch#3: Modified the description in the commit message, changing "it calls" to "it will need to call",
           indicating that there will be new codes on the kernel side that will call PHYSDEVOP_setup_gsi.
           Also added an explanation of why the interrupt of passthrough device does not work if gsi is not
           registered.
* patch#4: Added define for CONFIG_X86 in tools/libs/light/Makefile to isolate x86 code in libxl_pci.c.
* patch#5: Modified the commit message to further describe the purpose of adding XEN_DOMCTL_gsi_permission.
           Deleted pci_device_set_gsi and called XEN_DOMCTL_gsi_permission directly in pci_add_dm_done.
           Added a check for all zeros in the padding field in XEN_DOMCTL_gsi_permission, and used currd
           instead of current->domain.
           In the function gsi_2_irq, apic_pin_2_gsi_irq was used instead of the original new code, and
           error handling for irq0 was added.
           Deleted the extra spaces in the upper and lower lines of the struct xen_domctl_gsi_permission
           definition.
All patches have modified signatures as follows:
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com> means I am the author.
Signed-off-by: Huang Rui <ray.huang@amd.com> means Rui sent them to upstream firstly.
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com> means I take continue to upstream.


v8->v9 changes:
* patch#1: Move pcidevs_unlock below write_lock, and remove "ASSERT(pcidevs_locked());"
           from vpci_reset_device_state;
           Add pci_device_state_reset_type to distinguish the reset types.
* patch#2: Add a comment above PHYSDEVOP_map_pirq to describe why need this hypercall.
           Change "!is_pv_domain(d)" to "is_hvm_domain(d)", and "map.domid == DOMID_SELF" to
           "d == current->domian".
* patch#3: Remove the check of PHYSDEVOP_setup_gsi, since there is same checke in below.Although their return
           values are different, this difference is acceptable for the sake of code consistency
           if ( !is_hardware_domain(currd) )
		       return -ENOSYS;
           break;
* patch#5: Change the commit message to describe more why we need this new hypercall.
           Add comment above "if ( is_pv_domain(current->domain) || has_pirq(current->domain) )" to explain
           why we need this check.
           Add gsi_2_irq to transform gsi to irq, instead of considering gsi == irq.
           Add explicit padding to struct xen_domctl_gsi_permission.


v7->v8 changes:
* patch#2: Add the domid check(domid == DOMID_SELF) to prevent self map when guest doesn't use pirq.
           That check was missed in the previous version.
* patch#4: Due to changes in the implementation of obtaining gsi in the kernel. Change to add a new function
           to get gsi by passing in the sbdf of pci device.
* patch#5: Remove the parameter "is_gsi", when there exist gsi, in pci_add_dm_done use a new function
           pci_device_set_gsi to do map_pirq and grant permission. That gets more intuitive code logic.


v6->v7 changes:
* patch#4: Due to changes in the implementation of obtaining gsi in the kernel. Change to add a new function
           to get gsi from irq, instead of gsi sysfs.
* patch#5: Fix the issue with variable usage, rc->r.


v5->v6 changes:
* patch#1: Add Reviewed-by Stefano and Stewart. Rebase code and change old function vpci_remove_device,
           vpci_add_handlers to vpci_deassign_device, vpci_assign_device
* patch#2: Add Reviewed-by Stefano
* patch#3: Remove unnecessary "ASSERT(!has_pirq(currd));"
* patch#4: Fix some coding style issues below directory tools
* patch#5: Modified some variable names and code logic to make code easier to be understood, which to use
           gsi by default and be compatible with older kernel versions to continue to use irq


v4->v5 changes:
* patch#1: add pci_lock wrap function vpci_reset_device_state
* patch#2: move the check of self map_pirq to physdev.c, and change to check if the caller has PIRQ flag, and
           just break for PHYSDEVOP_(un)map_pirq in hvm_physdev_op
* patch#3: return -EOPNOTSUPP instead, and use ASSERT(!has_pirq(currd));
* patch#4: is the patch#5 in v4 because patch#5 in v5 has some dependency on it. And add the handling of errno
           and add the Reviewed-by Stefano
* patch#5: is the patch#4 in v4. New implementation to add new hypercall XEN_DOMCTL_gsi_permission to grant gsi


v3->v4 changes:
* patch#1: change the comment of PHYSDEVOP_pci_device_state_reset; move printings behind pcidevs_unlock
* patch#2: add check to prevent PVH self map
* patch#3: new patch, The implementation of adding PHYSDEVOP_setup_gsi for PVH is treated as a separate patch
* patch#4: new patch to solve the map_pirq problem of PVH dom0. use gsi to grant irq permission in
           XEN_DOMCTL_irq_permission.
* patch#5: to be compatible with previous kernel versions, when there is no gsi sysfs, still use irq
v4 link:
https://lore.kernel.org/xen-devel/20240105070920.350113-1-Jiqian.Chen@amd.com/T/#t

v2->v3 changes:
* patch#1: move the content out of pci_reset_device_state and delete pci_reset_device_state; add
           xsm_resource_setup_pci check for PHYSDEVOP_pci_device_state_reset; add description for
		   PHYSDEVOP_pci_device_state_reset;
* patch#2: du to changes in the implementation of the second patch on kernel side(that it will do setup_gsi and
           map_pirq when assigning a device to passthrough), add PHYSDEVOP_setup_gsi for PVH dom0, and we need
		   to support self mapping.
* patch#3: du to changes in the implementation of the second patch on kernel side(that adds a new sysfs for gsi
           instead of a new syscall), so read gsi number from the sysfs of gsi.
v3 link:
https://lore.kernel.org/xen-devel/20231210164009.1551147-1-Jiqian.Chen@amd.com/T/#t

v2 link:
https://lore.kernel.org/xen-devel/20231124104136.3263722-1-Jiqian.Chen@amd.com/T/#t
Below is the description of v2 cover letter:
This series of patches are the v2 of the implementation of passthrough when dom0 is PVH on Xen.
We sent the v1 to upstream before, but the v1 had so many problems and we got lots of suggestions.
I will introduce all issues that these patches try to fix and the differences between v1 and v2.

Issues we encountered:
1. pci_stub failed to write bar for a passthrough device.
Problem: when we run \u201csudo xl pci-assignable-add <sbdf>\u201d to assign a device, pci_stub will call
pcistub_init_device() -> pci_restore_state() -> pci_restore_config_space() ->
pci_restore_config_space_range() -> pci_restore_config_dword() -> pci_write_config_dword()\u201d, the pci config
write will trigger an io interrupt to bar_write() in the xen, but the
bar->enabled was set before, the write is not allowed now, and then when 
bar->Qemu config the
passthrough device in xen_pt_realize(), it gets invalid bar values.

Reason: the reason is that we don't tell vPCI that the device has been reset, so the current cached state in
pdev->vpci is all out of date and is different from the real device state.

Solution: to solve this problem, the first patch of kernel(xen/pci: Add xen_reset_device_state
function) and the fist patch of xen(xen/vpci: Clear all vpci status of device) add a new hypercall to reset the
state stored in vPCI when the state of real device has changed.
Thank Roger for the suggestion of this v2, and it is different from
v1 (https://lore.kernel.org/xen-devel/20230312075455.450187-3-ray.huang@amd.com/), v1 simply allow domU to write
pci bar, it does not comply with the design principles of vPCI.

2. failed to do PHYSDEVOP_map_pirq when dom0 is PVH
Problem: HVM domU will do PHYSDEVOP_map_pirq for a passthrough device by using gsi. See
xen_pt_realize->xc_physdev_map_pirq and pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq will call
into Xen, but in hvm_physdev_op(), PHYSDEVOP_map_pirq is not allowed.

Reason: In hvm_physdev_op(), the variable "currd" is PVH dom0 and PVH has no X86_EMU_USE_PIRQ flag, it will fail
at has_pirq check.

Solution: I think we may need to allow PHYSDEVOP_map_pirq when "currd" is dom0 (at present dom0 is PVH). The
second patch of xen(x86/pvh: Open PHYSDEVOP_map_pirq for PVH dom0) allow PVH dom0 do PHYSDEVOP_map_pirq. This v2
patch is better than v1, v1 simply remove the has_pirq check
(xen https://lore.kernel.org/xen-devel/20230312075455.450187-4-ray.huang@amd.com/).

3. the gsi of a passthrough device doesn't be unmasked
 3.1 failed to check the permission of pirq
 3.2 the gsi of passthrough device was not registered in PVH dom0

Problem:
3.1 callback function pci_add_dm_done() will be called when qemu config a passthrough device for domU.
This function will call xc_domain_irq_permission()-> pirq_access_permitted() to check if the gsi has corresponding
mappings in dom0. But it didn\u2019t, so failed. See XEN_DOMCTL_irq_permission->pirq_access_permitted, "current"
is PVH dom0 and it return irq is 0.
3.2 it's possible for a gsi (iow: vIO-APIC pin) to never get registered on PVH dom0, because the devices of PVH
are using MSI(-X) interrupts. However, the IO-APIC pin must be configured for it to be able to be mapped into a domU.

Reason: After searching codes, I find "map_pirq" and "register_gsi" will be done in function
vioapic_write_redirent->vioapic_hwdom_map_gsi when the gsi(aka ioapic's pin) is unmasked in PVH dom0.
So the two problems can be concluded to that the gsi of a passthrough device doesn't be unmasked.

Solution: to solve these problems, the second patch of kernel(xen/pvh: Unmask irq for passthrough device in PVH dom0)
call the unmask_irq() when we assign a device to be passthrough. So that passthrough devices can have the mapping of
gsi on PVH dom0 and gsi can be registered. This v2 patch is different from the
v1( kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/,
kernel https://lore.kernel.org/xen-devel/20230312120157.452859-5-ray.huang@amd.com/ and
xen https://lore.kernel.org/xen-devel/20230312075455.450187-5-ray.huang@amd.com/),
v1 performed "map_pirq" and "register_gsi" on all pci devices on PVH dom0, which is unnecessary and may cause
multiple registration.

4. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device\u2019s gsi to pirq in function
xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq, but qemu pass irq to it and
treat irq as gsi, it is got from file /sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get().
But actually the gsi number is not equal with irq. On PVH dom0, when it allocates irq for a gsi in
function acpi_register_gsi_ioapic(), allocation is dynamic, and follow the principle of applying first, distributing
first. And if you debug the kernel codes(see function __irq_alloc_descs), you will find the irq number is allocated
from small to large by order, but the applying gsi number is not, gsi 38 may come before gsi 28, that causes gsi 38
get a smaller irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want to use gsi, we can do a
translation. The third patch of kernel(xen/privcmd: Add new syscall to get gsi from irq) records all the relations
in acpi_register_gsi_xen_pvh() when dom0 initialize pci devices, and provide a syscall for userspace to get the gsi
from irq. The third patch of xen(tools: Add new function to get gsi from irq) add a new function
xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success. This v2 patch is the
same as v1( kernel https://lore.kernel.org/xen-devel/20230312120157.452859-6-ray.huang@amd.com/ and
xen https://lore.kernel.org/xen-devel/20230312075455.450187-6-ray.huang@amd.com/)

About the v2 patch of qemu, just change an included head file, other are similar to the
v1 ( qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.

Jiqian Chen (5):
  xen/pci: Add hypercall to support reset of pcidev
  x86/pvh: Allow (un)map_pirq when dom0 is PVH
  x86/domctl: Add hypercall to set the access of x86 gsi
  tools: Add new function to get gsi from dev
  tools: Add new function to do PIRQ (un)map on PVH dom0

 tools/include/xen-sys/Linux/privcmd.h |   7 ++
 tools/include/xenctrl.h               |  12 +++
 tools/libs/ctrl/xc_domain.c           |  15 ++++
 tools/libs/ctrl/xc_freebsd.c          |   6 ++
 tools/libs/ctrl/xc_linux.c            |  20 +++++
 tools/libs/ctrl/xc_minios.c           |   6 ++
 tools/libs/ctrl/xc_netbsd.c           |   6 ++
 tools/libs/ctrl/xc_physdev.c          |  27 +++++++
 tools/libs/ctrl/xc_solaris.c          |   6 ++
 tools/libs/light/libxl_arch.h         |   6 ++
 tools/libs/light/libxl_arm.c          |  15 ++++
 tools/libs/light/libxl_pci.c          | 112 +++++++++++++++-----------
 tools/libs/light/libxl_x86.c          |  72 +++++++++++++++++
 xen/arch/x86/domctl.c                 |  29 +++++++
 xen/arch/x86/hvm/hypercall.c          |   3 +
 xen/arch/x86/include/asm/io_apic.h    |   2 +
 xen/arch/x86/io_apic.c                |  21 +++++
 xen/arch/x86/mpparse.c                |   7 +-
 xen/drivers/pci/physdev.c             |  52 ++++++++++++
 xen/include/public/domctl.h           |  10 +++
 xen/include/public/physdev.h          |  17 ++++
 xen/include/xen/vpci.h                |   6 ++
 xen/xsm/flask/hooks.c                 |   1 +
 23 files changed, 409 insertions(+), 49 deletions(-)

-- 
2.34.1


