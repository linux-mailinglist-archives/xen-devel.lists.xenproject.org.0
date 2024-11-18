Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA49D12B6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 15:12:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839378.1255182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD2UG-0000Ij-N8; Mon, 18 Nov 2024 14:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839378.1255182; Mon, 18 Nov 2024 14:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD2UG-0000Gj-JG; Mon, 18 Nov 2024 14:12:20 +0000
Received: by outflank-mailman (input) for mailman id 839378;
 Mon, 18 Nov 2024 14:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q2I3=SN=amd.com=Luca.Miccio@srs-se1.protection.inumbo.net>)
 id 1tD2UE-0000Gd-Op
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 14:12:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2416::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a22eae1-a5b7-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 15:12:12 +0100 (CET)
Received: from BN9PR03CA0264.namprd03.prod.outlook.com (2603:10b6:408:ff::29)
 by SA3PR12MB9129.namprd12.prod.outlook.com (2603:10b6:806:397::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 14:12:07 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::c) by BN9PR03CA0264.outlook.office365.com
 (2603:10b6:408:ff::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend Transport; Mon,
 18 Nov 2024 14:12:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.0 via Frontend Transport; Mon, 18 Nov 2024 14:12:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 08:12:06 -0600
Received: from xsjlumiccio40x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 18 Nov 2024 08:12:06 -0600
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
X-Inumbo-ID: 1a22eae1-a5b7-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjBmIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFhMjJlYWUxLWE1YjctMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTM5MTMyLjQ0MDQ0Niwic2VuZGVyIjoibHVjYS5taWNjaW9AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGDxbQ49SA0PXO44Cr7jndWjw2qAOMx8ScY5aviUcbGPS1qGaTMI+MZbV2sFbyOAvkpC9+HcyUPOOHe0K4BjX9BHYk2v+90MCx+Jpsl4NzzzWdhEeQRaS3O7K9oJyxbWlYrkDyWddnYTW7Az/tkmRnmw9t9a4AbSHSY2AOWXqnnwhUO6XcImp/RxDl5B9p9szwVeQiMk0/kxkdA83hHt4rm1MvUoNJAT8+jtgq0a6rvT5XVsfpZ9PXLSkk7IqPmI6FCRmUb3D72Z537qt9q4cNYgcCc6xcJLW2JUnfiuU99Xcm17vNvnH0dBTrwTVEVX+KKS/dtmJcK6GfUyXVwDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIPcYoi1Fs7A/Wu4MhK50YfnJFxQpucwP7BSJ4pohbc=;
 b=rJKdBeliq+A85VdvxsJJLVyh56ZUHrGD0zPPh/RUSGj0fFmL/nAdC2n6lTgUTqupf6SnBaA+sGBpFdUws4+oibw4JCEuYpaTZtTx17uMG863m0Bn2NOERhRJCWBFoduhd6NVBJSA8AcCYmXRj/Py3p1S0J5MbKG+mxYgLBOpbzEa9Y07/X3PXnzdU3Uti05OpIpXHemtZJ7jhB2ZuOzE5KUGM9s0VYlVDu5GWa9oec/5hb47oRS3IW1O8q7w0hbxwW7pHkjmw5pgSNrVzzUdR89QIUUSdb4SB+pBqQzC/h1IhBVXVh/dI3w48deZ/gBajGAOHQtFVuFu6hWUxa2vVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.12) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIPcYoi1Fs7A/Wu4MhK50YfnJFxQpucwP7BSJ4pohbc=;
 b=PTArKybupuUWkTBPyrTI2zbsZI4lJmdHi8ganFTos04ErJ10j5wd2pmMhNjz0TUi/uxRK4vCjbyVK4TqlGWA2KPJlTEAy2U5aVd53Ik+uO2W7dfHmb6+QCigQwGApwR6Lm9cwnt1DLezGqxj5cpt3z5mJNHAFHlZS3uTHg58XGk=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.12) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.12 as permitted sender)
From: Luca Miccio <luca.miccio@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Luca Miccio <luca.miccio@amd.com>
Subject: [ImageBuilder] UBOOT_SOURCE/SCRIPTS variables must always be set
Date: Mon, 18 Nov 2024 06:12:05 -0800
Message-ID: <20241118141205.3513831-1-luca.miccio@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: luca.miccio@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SA3PR12MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: b68fe406-5c93-448b-96fe-08dd07dafc19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SatS/tKNl1aTpNNKcgF6SSftA/g0IV9jrm1C1dJYTGsIl/Trkm8hOTiVOmQd?=
 =?us-ascii?Q?Km0Be6MgyECLri+bRjyXrm3li3+PDvOj/Ak7vyQiuxOXPps57xN4t94qxnt7?=
 =?us-ascii?Q?MPetzxMNbThb+tmORmgNa5zm4w/va9cGSPUprbDqou3cmuF8f19zoIMsMe5Z?=
 =?us-ascii?Q?+Ugs9TAa5qR4+zibRAmure6217A62BdGZQoOROTvNcbdUsyBk5Gi8GCAZEe3?=
 =?us-ascii?Q?2GlHqeeJt4/5y5dFEJm2VjBxWGs1uP4y+9C8hLZ7vniyzHGGqo4BT7y+iJBI?=
 =?us-ascii?Q?+1hZqp0A3RAME57zHDTeE2OAC6LcTxDmpS7SoyCDySbFmwRyJvMBeHAGvuAy?=
 =?us-ascii?Q?HyaB/lVFoO+IhXsAdwIgNdpSYBpiW00f3jWZ7Tanv/TFURaseTEygeu6vceg?=
 =?us-ascii?Q?hSAJkKkG+WR08P4AxtYBZGuAvFM1FFnG5PC7Bkqa9mMA7HGKZsu7RcXw0Liv?=
 =?us-ascii?Q?v1P6dxJy8OQVSlzQGfIGB4LLzupaW2BVHAkNnb2XgpLcZjOtqB4VwUm9xs7D?=
 =?us-ascii?Q?vVUYR+DNhE+0yt+fsGA7X3EFI8NR9X35cnyZw/u63ixuV25q8zVObLhs0OzW?=
 =?us-ascii?Q?BYRLJyAeI/rq9sPIueC8CUdSBq/7PaDEbAweo5vrbdzvZ5NJizde1kNfuBz+?=
 =?us-ascii?Q?81DEF8+JgQqmWpr3tgOAxgzPej8Ijc4aPV05FrIRGWm272Y5iFZLfoC/eaPC?=
 =?us-ascii?Q?3jQGFNJFCJwBK3YvDpqnEyk+mev2Hf5d63yeLMtq/0+iBoIQyCczqMozBufe?=
 =?us-ascii?Q?n1FgzUuFSxOAwMeX52m4Ch/QfBQO4dnOfzWARGfEhOGDako0MtnMlQ0NRq1Z?=
 =?us-ascii?Q?qtuDtTxhqhwPr34qm0+HFNvkpVBIsSfotel+4z9n9N/gueV4802PX3N75Njc?=
 =?us-ascii?Q?jXkvqvW3E3uHorsRKaWgfxd2Ry5cqVB9ickHIdy4FbZsNNeBg4zckUyaCRd9?=
 =?us-ascii?Q?5Gaq/dgJ9QT76CVxa43AhQ28md4VcGB3ZjS3kSYa1Zi4ekXzhJB2TdGr+g6+?=
 =?us-ascii?Q?QdeDBpcLCqhflQSlZMDOQ1l+LPu3VQrte4GBuJZnoe8U9WdAOSGtchyzaoeN?=
 =?us-ascii?Q?KyFcyU1EDb3++kUBv/Sxz+GzvyiDwywrn9AR8KmNucVrDcq9biAfO1F9KOWz?=
 =?us-ascii?Q?ZsPKKu63NNaQXGS+G+osvyB0uU46cFBZAwx+0YyZMsCfVvPIYEFGg52QVTjr?=
 =?us-ascii?Q?fsBH6Bc2+L509alxik9kt4RYcKUaCQe8ZR4AEkjJdbgNeNUL5/Fy8dUIgQdw?=
 =?us-ascii?Q?c2FgUYdhou452bMR5Q0hmARlDASgb0BDj6TEh2u1U+2YIWWISnVppDeIVgk4?=
 =?us-ascii?Q?cIu+tzlwmZba7fnkH38KztDYVCyjcaEciuOvCqVCLuQF171JLzAutcxARJvv?=
 =?us-ascii?Q?d8mUSqWbaH+w4kGm+v0A+0//TnGIVIuJh2pn1k0oiDQFi9bWRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 14:12:06.9653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b68fe406-5c93-448b-96fe-08dd07dafc19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9129

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
index dcf5bdb..b07cbf1 100755
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
+    UBOOT_SCRIPT="$UBOOT_SCRIPT".scr
+fi
+
 if test "$fit_opt" && ! test "$FIT"
 then
     FIT="${UBOOT_SOURCE%.source}.fit"
-- 
2.34.1


