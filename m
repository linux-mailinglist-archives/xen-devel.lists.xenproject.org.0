Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB690B133BE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 06:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060914.1426449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugFfj-0000oD-1h; Mon, 28 Jul 2025 04:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060914.1426449; Mon, 28 Jul 2025 04:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugFfi-0000m5-Ql; Mon, 28 Jul 2025 04:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1060914;
 Mon, 28 Jul 2025 04:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3q4=2J=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ugFfh-0000lz-GU
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 04:41:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2405::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 136b8c86-6b6d-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 06:41:07 +0200 (CEST)
Received: from CH5PR05CA0014.namprd05.prod.outlook.com (2603:10b6:610:1f0::24)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 04:41:02 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::4a) by CH5PR05CA0014.outlook.office365.com
 (2603:10b6:610:1f0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Mon,
 28 Jul 2025 04:41:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 04:41:01 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 27 Jul 2025 23:40:59 -0500
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
X-Inumbo-ID: 136b8c86-6b6d-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kie47DQxgPSEVkfeG/2/LwCNalrCktKDPWUUp6Qrsvu/tGSuo4C+5BAQnOL6EUvdAIREZir6IEYU6xSCUu7Mf5d3zwzSHL0b4NWI5BuyLqD8JQx8crRGj1p2J6hJQ7S9wDGLOobieoFTFiPIZivLgQ/jf331mpY7rO/p3EWLXlGm/DT0H/8Xlch+jo50d0sNZL2AFk+gQsyqsXVmFYOKsehibGKy8O1m6vTQYcKSIHK/zTJT3JeBLsziKU39sN8QWqowT/rPhyKn7U26VA1FUVLNCnDbr+47NTrvkTqkw1SUYFmdLIQBg98sAM4lO37oOEKICexnHfLnvxtoBYMutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i41GCIBQ/7vNWYeToascu+RjvEBBgnZLZ0b1tb8+0jc=;
 b=opkcDpMH+loMeZ/8uFxyFRIDpBTyhQLJIP6lvA1la15HFUIe865fDmdNhVCQFNfk91IozxvIlre3akIFU+N5ADdXfD2GrEOjrx9XlI+pe9eBxSdIw11fACAjoRWIoW5R2Wps+PL/VIsSTI1sa9bB7q3f2Nh98XG+zC97osKclIlVP+JGTLR2vcMxMumYe8IR6bIjsO/rJqYJJtvQSWNSm6A0q6j1TB0Jmi8HZ5gdVppJKVuxo+/jUA3ks84n9fcFaY4FKhhnvS/ZaeaHqiHT8sQqnOucF3dfuvpPhlXoMKqiF7/Kw472nhUgfrBCQEb0F8gZdkxAq9bVnR8qkR2AYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i41GCIBQ/7vNWYeToascu+RjvEBBgnZLZ0b1tb8+0jc=;
 b=ZKJTa0ysrXCiyQrss30UUnN2jvFTATMSPoMd1XxjtB7pruM5BjOccC07wI64DXzUEFswVw1qnSO3FG1JF+uZ++HdyBHLXyxNQyliVLliWubwj8ach0gilSA1R72pKdiqhaQropjaYeh69eXSd3gTjO6xZn+8NEdYwXck4YuoVqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <Edgar.Iglesias@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v1] tools: make "opengl" generic
Date: Mon, 28 Jul 2025 12:40:07 +0800
Message-ID: <20250728044007.4026420-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a8d415-0bb8-48f2-7b6a-08ddcd90f442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fEwGjJP95g/BR0rNsep5oz0tgMEWtWpq5HMc5WlSz445U73A2LKmaS9UiumA?=
 =?us-ascii?Q?ohdZO++wPw4FbvMsS1zL7V+SrxcHHy0HZmbRBjdhlQuMtSh3HZ9Eq7JNW40a?=
 =?us-ascii?Q?rZ0ru6tD7Z+S2RQlv2NScl6MA//uMfrNWSQzqXTH39+HoONiEP/GbjJ586Hp?=
 =?us-ascii?Q?keAMrmYnvFnvw/DidiKGhx2CAUOy4qXdyVrnBnO28mgim4N4hH1FgHwQQVIx?=
 =?us-ascii?Q?vZVCBBIbGdtMsTy8FHE/8eqjE7iAG/mqd29KDoS5jxVZJK9XOtV3Dg9V+W+v?=
 =?us-ascii?Q?g/FGF235OqeaQZNzMwnC5KOTUruVwrvWM/KglT+BrjRXcDmgzWI3lLDDdrJq?=
 =?us-ascii?Q?SpcPey4RM+V1LaiJgFY4DNdVc70yDM+tzY7kKtX8c1qJcadMS/l12PHgqSWi?=
 =?us-ascii?Q?yDOPcdXEKBAAZDFtON2XDwz/VeaAuHfjZuSBVZiTvjXpCztbqOEb6d9YeOi+?=
 =?us-ascii?Q?6JBEwiXEqWmT7t3MABXLWtkHMsrTbREeTTetkPcRR3rfwMUB2Q7ADtC002ZC?=
 =?us-ascii?Q?4yyaa6yMlgylVhwMP9HOdJ3VAjcIq/l33MPwgZJ6mvh38Qpe84VuDsFx00R3?=
 =?us-ascii?Q?GV0joQluNrIuCuQhtaUTz8BXK+3R696N6p6y8yjFhljgMEzLeHnQu8NHPJ8/?=
 =?us-ascii?Q?qTUNAkIGjMNWTK5g0VcssRvwCLySewuOpVHpvwoVilwOYdtEBwdl/xZ5vYEJ?=
 =?us-ascii?Q?Aq75enJ9OWbp0zAo0hq9miuZZIjMv2erwtSY3OMxXPC6RX6gHgiqC7+2vICs?=
 =?us-ascii?Q?J0ODGUy92JmNkyz+oaL1e6D8F8uVyDgTqIT2xIVtZJJcTNbx4Tww0dAjXRB7?=
 =?us-ascii?Q?Cq5kR0zta5ahtMe6oQlAjiQXvgNNwGCzHcdXTXW69pptpwUCdIke/MknwOGg?=
 =?us-ascii?Q?buYKjTw8kD3ytQHuPuAS00RdTN5MxuDuHz8cBe9FydR2PXzI9Hx+2jIkNp/3?=
 =?us-ascii?Q?bBsw9mvP6KI3rPku3Ar5Js/LhmoOq7+rKJ5iLye6gMzQsaE6JFHIex7hc6Qu?=
 =?us-ascii?Q?HnoMp69IyOljagB180waAR1QcBB5Omn/5j6xVAdmtOv3avIV7upkWwbERqT4?=
 =?us-ascii?Q?gO1ztwSZDvqUPIFiYh32fW45pjIsKhvkslW+ptk6lc3EkCMr78pxIL2rZSWu?=
 =?us-ascii?Q?fiNGdliKp8DYRcrq/gOp1EeCJqHICboCk6+m7Mu0rFY/TyOr4veTWJCb6Weq?=
 =?us-ascii?Q?6l/p0wYSSk7wJX3m0OMNel8pIxxA3zhq6cONr/IMWKBNnaMGulHTVQ+YW3K6?=
 =?us-ascii?Q?fgea/FDVEYT6E/skI/yskzbjEQUAHZiH5vqmWrnIkX2gIPWYgEtPDqWd6yif?=
 =?us-ascii?Q?CXd3gNyNg5u50++Coor+MGTc9hppU2A3x+cczLo2HIih2OQ8dO3Yk+vOkevY?=
 =?us-ascii?Q?pbHCHgB9olE/fuNfWyslAfBmyiJsrvyKF/kyneJHJk9qFFdEvAVTJuErYf4q?=
 =?us-ascii?Q?QhnbWsooFAQ+D9ycE5yFfPfBwkVkRCJjMUUhQbFdcfw3m8oXZ4rT6bvIC1WM?=
 =?us-ascii?Q?I49m/pn3AYCY6abf6ES7+WwJCftWsKX7Dil1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 04:41:01.2910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a8d415-0bb8-48f2-7b6a-08ddcd90f442
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310

Display option, like vnc, sdl, etc, will be checked against in latest QEMU
whether it is compatile with opengl context. And vnc is incompatible with GL
context.
Now, when running hvm domain with gl context on, such as
"device_model_args_hvm = ["-display", "sdl,gl=on"]", we will fail with
the error of "qemu-system-i386: -vnc 127.0.0.1:0,to=99: Display vnc is
incompatible with the GL context", as vnc is set enabled on default
for HVM domain.

We shall move "opengl" option out of specifc sdl display, to make it
generic. Then when users explicitly set "opengl = 1", default values for
vnc shall be changed to disabled and libxl__dm_vnc() needs to return NULL
indicating vnc being disabled.

If users select both vnc and opengl in xl configuration, creation
will fail and error out incompatible info.
To keep consistency, we also make "opengl" generic for vfb[] options

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 tools/libs/light/libxl_console.c |  4 ++--
 tools/libs/light/libxl_create.c  | 10 ++++++----
 tools/libs/light/libxl_dm.c      |  7 ++++++-
 tools/libs/light/libxl_types.idl |  3 ++-
 tools/xl/xl_parse.c              | 17 +++++++++--------
 tools/xl/xl_sxp.c                |  6 +++---
 6 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index 044ca64676..fc3dfddc4d 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -694,7 +694,7 @@ static int libxl__device_vfb_setdefault(libxl__gc *gc, uint32_t domid,
     }
 
     libxl_defbool_setdefault(&vfb->sdl.enable, false);
-    libxl_defbool_setdefault(&vfb->sdl.opengl, false);
+    libxl_defbool_setdefault(&vfb->opengl, false);
 
     rc = libxl__resolve_domid(gc, vfb->backend_domname, &vfb->backend_domid);
     return rc;
@@ -733,7 +733,7 @@ static int libxl__set_xenstore_vfb(libxl__gc *gc, uint32_t domid,
     flexarray_append_pair(back, "sdl",
                           libxl_defbool_val(vfb->sdl.enable) ? "1" : "0");
     flexarray_append_pair(back, "opengl",
-                          libxl_defbool_val(vfb->sdl.opengl) ? "1" : "0");
+                          libxl_defbool_val(vfb->opengl) ? "1" : "0");
     if (vfb->sdl.xauthority) {
         flexarray_append_pair(back, "xauthority", vfb->sdl.xauthority);
     }
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 4301f17f90..7bbd1ff9b4 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -339,7 +339,12 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         if (!b_info->u.hvm.boot)
             b_info->u.hvm.boot = libxl__strdup(NOGC, "cda");
 
-        libxl_defbool_setdefault(&b_info->u.hvm.vnc.enable, true);
+        libxl_defbool_setdefault(&b_info->u.hvm.opengl, false);
+
+        if (libxl_defbool_val(b_info->u.hvm.opengl))
+            libxl_defbool_setdefault(&b_info->u.hvm.vnc.enable, false);
+        else
+            libxl_defbool_setdefault(&b_info->u.hvm.vnc.enable, true);
         if (libxl_defbool_val(b_info->u.hvm.vnc.enable)) {
             libxl_defbool_setdefault(&b_info->u.hvm.vnc.findunused, true);
             if (!b_info->u.hvm.vnc.listen)
@@ -347,9 +352,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         }
 
         libxl_defbool_setdefault(&b_info->u.hvm.sdl.enable, false);
-        if (libxl_defbool_val(b_info->u.hvm.sdl.enable)) {
-            libxl_defbool_setdefault(&b_info->u.hvm.sdl.opengl, false);
-        }
 
         if (libxl_defbool_val(b_info->u.hvm.spice.enable)) {
             libxl_defbool_setdefault(&b_info->u.hvm.spice.disable_ticketing,
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..7adf473c81 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -672,6 +672,10 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
 const libxl_vnc_info *libxl__dm_vnc(const libxl_domain_config *guest_config)
 {
     const libxl_vnc_info *vnc = NULL;
+
+    if (libxl_defbool_val(guest_config->b_info.u.hvm.opengl))
+        return NULL;
+
     if (guest_config->b_info.type == LIBXL_DOMAIN_TYPE_HVM) {
         vnc = &guest_config->b_info.u.hvm.vnc;
     } else if (guest_config->num_vfbs > 0) {
@@ -955,6 +959,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     const char *path, *chardev;
     bool is_stubdom = libxl_defbool_val(b_info->device_model_stubdomain);
     int rc;
+    bool has_opengl = libxl_defbool_val(b_info->u.hvm.opengl);
 
     dm_args = flexarray_make(gc, 16, 1);
     dm_envs = flexarray_make(gc, 16, 1);
@@ -1084,7 +1089,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         }
 
         flexarray_append(dm_args, vncarg);
-    } else if (!is_stubdom) {
+    } else if (!is_stubdom && !has_opengl) {
         /*
          * Ensure that by default no vnc server is created.
          */
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index fe251649f3..ab768381ce 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -349,7 +349,6 @@ libxl_spice_info = Struct("spice_info", [
 
 libxl_sdl_info = Struct("sdl_info", [
     ("enable",        libxl_defbool),
-    ("opengl",        libxl_defbool),
     ("display",       string),
     ("xauthority",    string),
     ])
@@ -670,6 +669,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        ("acpi_firmware",    string),
                                        ("hdtype",           libxl_hdtype),
                                        ("nographic",        libxl_defbool),
+                                       ("opengl",           libxl_defbool),
                                        ("vga",              libxl_vga_interface_info),
                                        ("vnc",              libxl_vnc_info),
                                        # keyboard layout, default is en-us keyboard
@@ -748,6 +748,7 @@ libxl_device_vfb = Struct("device_vfb", [
     ("backend_domid", libxl_domid),
     ("backend_domname",string),
     ("devid",         libxl_devid),
+    ("opengl",        libxl_defbool),
     ("vnc",           libxl_vnc_info),
     ("sdl",           libxl_sdl_info),
     # set keyboard layout, default is en-us keyboard
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 28cdbf07c2..9e9adcec77 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -272,7 +272,6 @@ static void parse_top_level_sdl_options(XLU_Config *config,
                                         libxl_sdl_info *sdl)
 {
     xlu_cfg_get_defbool(config, "sdl", &sdl->enable, 0);
-    xlu_cfg_get_defbool(config, "opengl", &sdl->opengl, 0);
     xlu_cfg_replace_string (config, "display", &sdl->display, 0);
     xlu_cfg_replace_string (config, "xauthority", &sdl->xauthority, 0);
 }
@@ -1291,7 +1290,7 @@ void parse_config_data(const char *config_source,
 {
     libxl_physinfo physinfo;
     const char *buf;
-    long l, vcpus = 0;
+    long l, vcpus = 0, vnc_enabled = 0;
     XLU_Config *config;
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
@@ -2572,7 +2571,7 @@ skip_nic:
                 } else if (!strcmp(p, "sdl")) {
                     libxl_defbool_set(&vfb->sdl.enable, atoi(p2 + 1));
                 } else if (!strcmp(p, "opengl")) {
-                    libxl_defbool_set(&vfb->sdl.opengl, atoi(p2 + 1));
+                    libxl_defbool_set(&vfb->opengl, atoi(p2 + 1));
                 } else if (!strcmp(p, "display")) {
                     free(vfb->sdl.display);
                     vfb->sdl.display = strdup(p2 + 1);
@@ -2791,14 +2790,16 @@ skip_usbdev:
 
 #undef parse_extra_args
 
+    if (!xlu_cfg_get_long (config, "vnc", &l, 0))
+        vnc_enabled = l;
+    xlu_cfg_get_defbool(config, "opengl", &b_info->u.hvm.opengl, 0);
+    if (vnc_enabled && libxl_defbool_val(b_info->u.hvm.opengl)) {
+        fprintf(stderr, "vnc is incompatible with opengl\n");
+        exit(1);
+    }
     /* If we've already got vfb=[] for PV guest then ignore top level
      * VNC config. */
     if (c_info->type == LIBXL_DOMAIN_TYPE_PV && !d_config->num_vfbs) {
-        long vnc_enabled = 0;
-
-        if (!xlu_cfg_get_long (config, "vnc", &l, 0))
-            vnc_enabled = l;
-
         if (vnc_enabled) {
             libxl_device_vfb *vfb;
             libxl_device_vkb *vkb;
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index 4383ad177a..62a1d012c6 100644
--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -120,7 +120,7 @@ void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
         fprintf(fh, "\t\t\t(sdl %s)\n",
                libxl_defbool_to_string(b_info->u.hvm.sdl.enable));
         fprintf(fh, "\t\t\t(opengl %s)\n",
-               libxl_defbool_to_string(b_info->u.hvm.sdl.opengl));
+               libxl_defbool_to_string(b_info->u.hvm.opengl));
         fprintf(fh, "\t\t\t(nographic %s)\n",
                libxl_defbool_to_string(b_info->u.hvm.nographic));
         fprintf(fh, "\t\t\t(spice %s)\n",
@@ -219,10 +219,10 @@ void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
         fprintf(fh, "\t\t\t(vncunused %s)\n",
                libxl_defbool_to_string(d_config->vfbs[i].vnc.findunused));
         fprintf(fh, "\t\t\t(keymap %s)\n", d_config->vfbs[i].keymap);
+        fprintf(fh, "\t\t\t(opengl %s)\n",
+               libxl_defbool_to_string(d_config->vfbs[i].opengl));
         fprintf(fh, "\t\t\t(sdl %s)\n",
                libxl_defbool_to_string(d_config->vfbs[i].sdl.enable));
-        fprintf(fh, "\t\t\t(opengl %s)\n",
-               libxl_defbool_to_string(d_config->vfbs[i].sdl.opengl));
         fprintf(fh, "\t\t\t(display %s)\n", d_config->vfbs[i].sdl.display);
         fprintf(fh, "\t\t\t(xauthority %s)\n", d_config->vfbs[i].sdl.xauthority);
         fprintf(fh, "\t\t)\n");
-- 
2.34.1


