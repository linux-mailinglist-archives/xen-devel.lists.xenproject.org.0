Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7129D28DD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 16:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840351.1256116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPjN-0006OV-2e; Tue, 19 Nov 2024 15:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840351.1256116; Tue, 19 Nov 2024 15:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPjM-0006MM-W7; Tue, 19 Nov 2024 15:01:28 +0000
Received: by outflank-mailman (input) for mailman id 840351;
 Tue, 19 Nov 2024 15:01:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Qpl=SO=amd.com=Luca.Miccio@srs-se1.protection.inumbo.net>)
 id 1tDPjL-0006MA-4h
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 15:01:27 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2406::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 219fbf2c-a687-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 16:01:19 +0100 (CET)
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 15:01:13 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::5) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Tue, 19 Nov 2024 15:01:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 15:01:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 09:01:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 09:01:11 -0600
Received: from xsjlumiccio40x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 19 Nov 2024 09:01:11 -0600
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
X-Inumbo-ID: 219fbf2c-a687-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNjo6NjA1IiwiaGVsbyI6Ik5BTTAyLVNOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjIxOWZiZjJjLWE2ODctMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI4NDc5Ljg1ODk0Niwic2VuZGVyIjoibHVjYS5taWNjaW9AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l20bwZWr7CU7mN6bCO0ApHpxfq4H1cYv2/9WRupGVa64j5ipe6Tlkc+k3uI3K1Oa3v8duArTxgXHPdZC7YVecWRA4bad21gMClvy05MshUYD6QR4t1IoRFJKO7I87d6Q2gb+0/bkx39Jtx8f5c+XpS4DYdRUWTbNMAJk2bQfYAK3IorbRNwhN5pPRtN/9mYFN+kVIjs3I9lX2Q1MSnsVyNEpJVBnNb/QKXiJlFS0ToLGFnXP0CmD15wgSKuHXYcwLG2XpNDvvVsXkhdh1wLepteEDQBjVyD/dMPdURSj/R0KLJwiGMkTBVMfnc56AkxvImmM4sgKygFpe84y3gPDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgX1RG63i7eS+LqYlHg9yb4nVKr5zAHP3y8gE1F5F4A=;
 b=Ltr08MRltq3eb9oFs6/XuUVnlH5nwUoWgx6Sc18VH5Z3x0LgJEfaw+w28Mi2toRMhFKoT+BS2P/zvmrEnjhMhZtcEDjMezp0Lb+yGbMtpAbgSyZi2KNUo47TeXV+z9pALfBbRtcYCYH2AXoRUiVwpYTmOQPkQivxJCVUYzQwNu6UzYbL5qbr5fRlfcFq/fYdgG2Sk9AYMg0WcoDmT0GSLeHidgmqXeaQN2VrC2sBdmh5/jjNwWA2McSavxpFSlmKHBEIVoo2DHFiAcx38Q9k/DwphQmuJVpPd164vsDwzS01GKl/JE+X7Vls4LRrkwZ182jgFN3+suj+iESNOlkT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgX1RG63i7eS+LqYlHg9yb4nVKr5zAHP3y8gE1F5F4A=;
 b=a4VA/KG90tTfiS/jNmD1qE727KDGQ4Ucmg7quoeyDho4G0lINKmqOR7WbVZ57IVjHwsedTQ3nTCdWu2T+MWCc+Vpxt/mxM1/tUEqwWh4gi2YSq3u47+6TEKc+jEAPxhKHkveep8XN65C5rMgB4umyLqw7KwrNeOrP+/oFVtsTLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
From: Luca Miccio <luca.miccio@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
Subject: [ImageBuilder] [PATCH V2] UBOOT_SOURCE/SCRIPTS variables must always be set
Date: Tue, 19 Nov 2024 07:01:11 -0800
Message-ID: <20241119150111.3569267-1-luca.miccio@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: luca.miccio@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e68807-8f6a-46ac-2c62-08dd08ab0242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WldhSl9mUQqMIVzjRT1SNYQq2sHkPWAwQv203TCEi5eX1g2Q+H/eqmmy6Y0/?=
 =?us-ascii?Q?McvaZ36SkH06ZNsdei+pUzK+RKy08oiuJbMm0bIuCjXC/zuGlg1gBI8r9YEK?=
 =?us-ascii?Q?LocIRioYsoWm5hrCZJ6+tUri+8m4aPZuSiA0dOj4fiFEIbf5YUim6Hu6oO03?=
 =?us-ascii?Q?13wIPyQCJGoMh/8G7ZUecHRPAQ2Toz9u7ukS6ejvI3zvJZQo3oPr4nIqbCeI?=
 =?us-ascii?Q?KeFIBcHtUxM81hkQyeketTzVqTp14fnWhtJouP3POwMJAeIRcQ+0qfmrcA8M?=
 =?us-ascii?Q?YsBCngwYV5d09NIeR+tFnbfT9cmCLkd/ebslJ5d9Nvcmsa2iRb3bshJSHUv7?=
 =?us-ascii?Q?LOjKurNKjxqpLOThBKmAP/nNHNuverZzfaksYbHV+t4zhMmsZX0uUjQkaj4t?=
 =?us-ascii?Q?td7lcZAzx7W5q+Xd95iuS4SFOzNb0DwyWWTREoMbfw4Ls8Bm+A0bScv8UWD/?=
 =?us-ascii?Q?WuyIcGH6JfZ38opG+DVmmEWvlVHGvVovO9C3H6FEHhkfS5Vdx3HxUWKn3gsb?=
 =?us-ascii?Q?xpIKMXR4wb0miJjCerV/ciJmNNRjNhRxGshInU5BOVW7fpbP2PnvnW9QoPcq?=
 =?us-ascii?Q?+r1iDn31rn4dEu9EOTUQySPvESM5Tnu8TaK1mNdJAhgD4nFaYIJC3EtMw9ad?=
 =?us-ascii?Q?q8lJWMisaI29N/CtS2vRjlMHs7KL4vPS6aiRDV/mGnklFpiusxHC5jx/uLw2?=
 =?us-ascii?Q?7I4AfBJdIJfF44tVyT+5HZeVmO+veNfeTIVejZYon1SKdP6dD6jnz80itfc9?=
 =?us-ascii?Q?ORK0/SoEYq7WT4Iv4R6/7L40EmwlTnhA5nPxLPqUmegrMVtsat4q7Y0dpHpY?=
 =?us-ascii?Q?T1bC+EGSHIvHzImbXWMeKD9emjz2/iSvxwFd/GNfwz1FClQ31zQ7JC94agzx?=
 =?us-ascii?Q?3gOxgTA+/pRnB3ysM2YJ7vtxioBYpaOdn/zZ8tyTjnLCN94+JEUTLRIpqFw1?=
 =?us-ascii?Q?+fG9k+BJFBjA7clyPlQx3AO41L0Ug7VyF6kiTBSHhGccV1oTeLNWU9t5upqF?=
 =?us-ascii?Q?cSKCoYj3Ol3n769uPD/dh1FKhzRqK4uooIFB/2K+xCP3Q8WMvKgj9dulbuR7?=
 =?us-ascii?Q?cXLrQuB/wM6N+vJIDWCjkr6eEAW/Y7NRPpWWzybs6JscZa3JfZSJEZ19MteP?=
 =?us-ascii?Q?HV2DOkkDuaUtJpykcWcZPTH60InI1GB0MFHORK2e8okO4HKQrDgJISfAjO+h?=
 =?us-ascii?Q?S/GUUFxObr99XTSLD9V79vvUR0u2oSTO0D8ItEBBzKm2qB+CYYFLZlxNEkwS?=
 =?us-ascii?Q?GXR5zudVjrnVTHLEeo/jM6sBnXjvWYlHQpHpA56C4BDsE6buGoB/LtZNmjeh?=
 =?us-ascii?Q?3xCKT5H9DWHiAdf4KFCFRV1xx7oYbI6SpSsXK5hGbTfgrPNzQ/iARfmg+sZH?=
 =?us-ascii?Q?C1qUGwZHeMUVvmGy9fLoEBKyrtP0f1iBZmWSXnVIBgV/4I+itQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 15:01:12.6018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e68807-8f6a-46ac-2c62-08dd08ab0242
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247

The current README incorrectly omits the need for the UBOOT_SOURCE and
UBOOT_SCRIPT variables for uboot-script-gen to function properly.
Moreover, the script silently fails if these variables are not set.
Return an error if the the UBOOT_SCRIPT variable is not set and
correct the documentation accordingly.

Signed-off-by: Luca Miccio <luca.miccio@amd.com>
---
 README.md                |  3 ++-
 scripts/uboot-script-gen | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 4fcd908..ae2fdfd 100644
--- a/README.md
+++ b/README.md
@@ -272,7 +272,8 @@ Where:
 
 - UBOOT_SOURCE and UBOOT_SCRIPT specify the output. They are optional
   as you can pass -o FILENAME to uboot-script-gen as a command line
-  parameter
+  parameter. It has to be set either in the config file or CLI argument
+  though.
 
 - APPEND_EXTRA_CMDS: is optional and specifies the path to a text file
   containing extra u-boot commands to be added to the boot script before
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index dcf5bdb..fc63702 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1210,6 +1210,18 @@ then
     UBOOT_SCRIPT="$uboot_out_opt".scr
     UBOOT_SOURCE="$uboot_out_opt".source
 fi
+
+if test ! "$UBOOT_SOURCE"
+then
+    echo "UBOOT_SOURCE not set, either specify it in the config or set it with the -o option"
+    exit 1
+fi
+
+if test ! "$UBOOT_SCRIPT"
+then
+    UBOOT_SCRIPT="${UBOOT_SOURCE%.source}.scr"
+fi
+
 if test "$fit_opt" && ! test "$FIT"
 then
     FIT="${UBOOT_SOURCE%.source}.fit"
-- 
2.34.1


