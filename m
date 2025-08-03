Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4CCB19350
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068407.1432484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMh-0004xV-Np; Sun, 03 Aug 2025 09:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068407.1432484; Sun, 03 Aug 2025 09:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMh-0004ol-2Q; Sun, 03 Aug 2025 09:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1068407;
 Sun, 03 Aug 2025 09:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVLE-0005hH-Vc
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:49:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2414::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f71360c-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:49:19 +0200 (CEST)
Received: from BY3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:254::12)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:49:14 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::10) by BY3PR05CA0007.outlook.office365.com
 (2603:10b6:a03:254::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.10 via Frontend Transport; Sun,
 3 Aug 2025 09:49:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:49:14 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:49:09 -0500
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
X-Inumbo-ID: 1f71360c-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omLfdGw7d2lSPMugLx9+uCTo8rtZ3J6yphdWm7PlennD0rmfvfb9U1OvUeWLxnirAbqboxhjPU5dXxbjgRoPvVxttRcLrI6pKEUUE66lRN/fDE3ACEkHx/L/GxIgGPd+TQFb7rDoQHFFuL2qNJWuPGAHCdk30PPAzYMfvrx71BbAeKxRuUq2KLLGJgVl3cKO+RwX0P/sFo5mfHb0el4rYhgKc8jDpTb8PKqV9yIgrso7HbPzNdSU0XeKqbp3GwiURkXbx5r8nQPOmZYwasa+2nS5RZLTu94CsSWgrQ/c9oDCwgcbJ9u39Bx+gzocuV+qHSE8I0Mm29BZ3joqvT2b6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+rKpnCb4beuXolnCadHRn5o8RnowLF7DFrmJ1YESoc=;
 b=bJXNbP+7uv/zV8B1RvhV1FRNtdDTqtbnHnzgOknftrJUrDeiP9FdO/E82A8iUYd3IG2HXEVLumUDx8CPuMeTklurZSxzyukMHo83d13k5BT/RFXzII3qmN3mRDcxgTnZMldXH7gjdZ4mRhERyieFNe6NVtD0nVLlTloo9zQVzEm1ZlbQ/R1rtCJhDIq/dUe/ZIb21YWWjA2PUQhXSDN8wU1nyJjwpjHjmlETKmfjTM6S/pbA81qK/yJOd3dtbIuGTw0ItAUdz5YHACy1yUOjV/4eupLIoqffpBLX5HHdu/6Nz4edavtk7fECOXqIOqnR+IGHrUgGzw+6BHBW0USNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+rKpnCb4beuXolnCadHRn5o8RnowLF7DFrmJ1YESoc=;
 b=0QIibXCZjMDpVCtUYdscoonWZzoXEqThwxRgs01yUBVX7h28+Y7JQvyluy5mHg3kdrb29YERhwC9g66PXmOSrhIiVgPSEGqABxa5cTLHn6yib779jhgpT/TfidFrocf9A9LBkurXy86ayD7LYZsQ2Xh2SOqgws559FZAHOQHyzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 25/25] xen/domctl: wrap around domctl hypercall
Date: Sun, 3 Aug 2025 17:47:38 +0800
Message-ID: <20250803094738.3625269-26-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: e210ab8b-0961-47d4-0682-08ddd2730189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NSggJO7DJuJ4bYVxP683JoP5+dTN3h2HQpNPMyrVeesxNE1Lws+FSu5D9HxP?=
 =?us-ascii?Q?JidEhZUD/WVrdPLTFbtLWHSE1tLI08EXrorR9Jlsej6P2CUJXzA98O9KUii1?=
 =?us-ascii?Q?Zxo5DZt4WPUvoCCpTU8IUvtB+isMSeZhmPugsXTkRLTDTMKsbFU9GLKiSpcf?=
 =?us-ascii?Q?eEzA0SzJtBWR07YIh2cB+vzzVs+QnUzas2prhgdGKyfVWGP+tXs+YLiTkB/g?=
 =?us-ascii?Q?DPkkGwzubG0CsOeNX0rN9GfMy6nYQkjzpz55+uyWOfJTipQIwUbWtEsdGn43?=
 =?us-ascii?Q?LXrCMucTtLa8wm35ILTUdL5JdEEezLgmN+vLOZFPl9hSeJlxwNgxdhGh+9Jz?=
 =?us-ascii?Q?3kt0UVz0T0717Hs/nC7Xa7FJfr9YYmv1hvn6JMf5U7OOJUGTneQGCe5EZVrR?=
 =?us-ascii?Q?rlnRBLM+A5wZri2DU3PSKI4I/bqwNyZnL8q21aMLVhjmSqIku5VlSPMx56e4?=
 =?us-ascii?Q?2G6EXq9RuHHso8mObDiCfyCvMYaeOwLHaw/dH12AIb1SCH1iWFsPhE9rP6rN?=
 =?us-ascii?Q?wdPkX06Y1n6Oz6h1FhKD93hFnI1rbAsRTj6DYVWK/hxNNN+H1+j/AvcXfWE/?=
 =?us-ascii?Q?1Lj7syFpz531slYpkovw8wz6yHNfZVYmTcVCS6w/Uah8fLISkPad5lfFwIeC?=
 =?us-ascii?Q?6FfOWy4DyFXCi055OPRKShvtFr/cTbreiXzK+p5eoVFXlw4nQf9VLDixlz/7?=
 =?us-ascii?Q?pBjVSFRVVCMc9hE3xgJypIvEWOXpkHmvgB88mVFn0b+x7Y/uDkgErFe00TkV?=
 =?us-ascii?Q?zp5PBYKNmI2ydJU7YumBM95C2l9zSLILVMpAJiYvmi0ketSXvrLQpZ449LAc?=
 =?us-ascii?Q?AZhNRq/Q7A6UTKiw7idwqu5g4hPCZVXSs7rET71BpaJV6R22onwNGzRB65qM?=
 =?us-ascii?Q?T/DTs18GXGDejCDj1BL40ABS/bnapGe7cDH6sMiD+T3W/i4ih95xY+fS2lIG?=
 =?us-ascii?Q?pvZvLnZAH2dv7xtFgm/mmspFLFoVZNvBWQNMxFoerjlSYClYyEsEOe5eWUa5?=
 =?us-ascii?Q?kd8EPH9rU7VcppWCWqgEBDiOsxt5/kIOPdHWhsV430K7+Vu0QWPcHejaGEEA?=
 =?us-ascii?Q?bKQ1e7xhL0IrCYze6romGAsxsbxVyVwk6qD3T58k/BBroPZ2IYwPzT/eKmL/?=
 =?us-ascii?Q?f262hFfVZyuJcymxARte23gC+G8h2BbpEDhIJ/4dJodSpoHgOc33+eG/dueK?=
 =?us-ascii?Q?WZ/Im1+QbEnVD8F2GCIHeAMxZCGGKzYFnrkp7ysR9r+k9T9/SrtcXVRefdH8?=
 =?us-ascii?Q?oV9ddc62ew8VpvevqQRWigAdwe6Lnu0qFpqnT8p4mNx2mG5ekmetzarob0eq?=
 =?us-ascii?Q?difdBQ+uhdMgELD4Sv2Hef9tKucT0BRB8IY5pRYdGe4DqPJT8p5VWoqA+m0q?=
 =?us-ascii?Q?g+u/CSa7e+ZGZgsv9qA4phQODwyYXZ0vN1SQCzmaWe3UFrczKcuci/srYTf7?=
 =?us-ascii?Q?KPMd4fcIg0ChCerTh5+kHdddIzFmjuUBqvKdiLHibLRReCPUG7KHHX1AXPZl?=
 =?us-ascii?Q?N+kRoG2ZLSLgE+44JWrJjIWVAjrmm2KVNKHQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:49:14.3958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e210ab8b-0961-47d4-0682-08ddd2730189
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960

Wrap domctl hypercall def and domctl.o with CONFIG_DOMCTL
We need to make DOMCTL with prompt back, add help info and set default
value as y. We shall at least provide "# CONFIG_DOMCTL is not set" in preset
configs for PV shim on x86.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/configs/pvshim_defconfig | 1 +
 xen/common/Kconfig                    | 5 ++++-
 xen/common/Makefile                   | 2 +-
 xen/include/hypercall-defs.c          | 4 ++++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index c58c29adb0..c100b84fa8 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -25,3 +25,4 @@ CONFIG_EXPERT=y
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
 # CONFIG_SYSCTL is not set
+# CONFIG_DOMCTL is not set
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 24a7b83af9..31db3d448b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -629,7 +629,10 @@ config SYSCTL
 
 config DOMCTL
 	bool "Enable domctl hypercall"
-	def_bool y
+	default y
+	help
+	  This option shall only be disabled on some dom0less systems, or
+	  PV shim on x86, to reduce Xen footprint.
 
 endmenu
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 756ddf52c3..fc83a45b60 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,7 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index c70f745ac2..ccc38e5e22 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,7 +197,9 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
+#ifdef CONFIG_DOMCTL
 domctl(xen_domctl_t *u_domctl)
+#endif
 #if PG_log_dirty
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
@@ -280,7 +282,9 @@ hvm_op                             do       do       do       do       do
 #ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
 #endif
+#ifdef CONFIG_DOMCTL
 domctl                             do       do       do       do       do
+#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
-- 
2.34.1


