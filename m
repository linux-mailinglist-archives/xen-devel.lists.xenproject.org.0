Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30E044A747
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223700.386541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9n-0000oN-KO; Tue, 09 Nov 2021 07:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223700.386541; Tue, 09 Nov 2021 07:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9n-0000iA-B0; Tue, 09 Nov 2021 07:02:59 +0000
Received: by outflank-mailman (input) for mailman id 223700;
 Tue, 09 Nov 2021 07:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9l-00004s-Uf
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:02:58 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c1cc54-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:02:57 +0100 (CET)
Received: from DS7PR03CA0326.namprd03.prod.outlook.com (2603:10b6:8:2b::28) by
 MN2PR02MB6894.namprd02.prod.outlook.com (2603:10b6:208:202::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13; Tue, 9 Nov 2021 07:02:53 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::d9) by DS7PR03CA0326.outlook.office365.com
 (2603:10b6:8:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 9 Nov 2021 07:02:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:02:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:51 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:51 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9f-000Ga6-3f; Mon, 08 Nov 2021 23:02:51 -0800
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
X-Inumbo-ID: 10c1cc54-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjUmxrbS9Z48N1bB0x+nE/xu3+s2n7pbUxPKHP1625KlF327Li7N5Kds3JksfRKXBk8qeTeylI145cGR7pEX2dC5tJ5nxG2c7tLX0lEqdUqSYDayZx13fCvkcXvcNj051POGK9tb+sQ/GvQfD22bg8BR+iJaQzLskktIl36sZkCBHBAAsZAfMCeJJQV5zmvCrHKQtcFIQV/ztfS4qaIq0qaI5bJJ1ro660Q9dRoAIp0GMarpWgWqiLpCEcd0FOymTcSUm3FamYE71zj2LC7TYFW3lu/XzMIKBPS08B0NihvVcj/K/7XR2gbAKZYL0+AcIdUIH2z1qwxoX+3mqbzmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVTdL2JkAaFCrQBMdzufBf1qaaoyDchjyzTR3R/6sMQ=;
 b=Rxy5+F86No0TIR1bdFe9VXQW3azprKEbUS7aMS67PSudjCYsFYYIVnl6hkulqwqo6zRJ82UWmzO/InZhoaWzBnS24FcPFf1gJRzfKqeVuZHfxecl/jr1ijyzRyt2sKTGjFfiTChU/AudJXHW93MOMXpTz7sFz8qVeWaQYEH+zGrq2+6YcJIMg9o9AG9ra1vhBzVogGHw/BYx/AHzvcWbEmaSGWSQzdKdme6p2YhEV9A62atOVXd+l9YIbWi8dS1PA8vVf4wPVScJlexsXWnmpNuf4UXDb1J5Jhawg/OStugkO/Fn0xpsNPJt75+dSyXcbRyjN+H8+QyvCCIo7slWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVTdL2JkAaFCrQBMdzufBf1qaaoyDchjyzTR3R/6sMQ=;
 b=ja6xZHGxpWL5BZNipXkWRCQSD0ax2aNePpFfIZG7iuJM+XaiY2DAM0ZhPdl0SQXwmlpsq/w0/u9VlP7z96kxU+IM1VUX4ktk6Ymx9mkRtwg9JIoHhBN43ybYL5FMq4zuB6CL92ESATp2Ems/xaj0w/20e6kov8q9FVL4RnE/6ZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [XEN][RFC PATCH v2 12/12] tools/xl: Add new xl command overlay
Date: Mon, 8 Nov 2021 23:02:27 -0800
Message-ID: <1636441347-133850-13-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec176ae9-4f43-44fc-9f81-08d9a34ef37b
X-MS-TrafficTypeDiagnostic: MN2PR02MB6894:
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB6894D7A858BCF15762B16E89BC929@MN2PR02MB6894.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PmBHn+r2mrAQuobPjEC5u+B9C+zkhFQnlM38LS6wn0N3NGQX4a8LyKunx4YQubG0hiuypa+pitqKfNLN7esvj3ZHV+vgVgUgYDhhpjiRQHNd7EwqqYoWDcL7+ut9iqa3b0fdVnQaME5ys5RNd8ieBsaq/lf94C6TB55J2qab63XHH3z4ILhVT6FiLfE49nBOaeSaaDzuVhbvjtLdBaSQI22bokqu35lL16OAN3UfAjZ5G3J0oC6z08MiPdCtbLBNgskaTp+PSpwvANowwWk9uUb8w03QiStvmr58ennoX0sfDDHUeIe8IMMYFrKdRqMRJfmq1esUgoZsLAnOzgs4k5dM3Bwnw8W6qKq4jOpttxTisuuEMD8q2Pr7oRzq7fGmpx3yfUonJZh6NJys/kQ7TMPUtcrJ8OBk7P0QOGpB7Ivvn0s7VAdC+lYnZOpBCkFyC5E5NPrVRMgw7UFuCMRyk+HGQZA63UwRvQ94FwbZeoJov4m7AWzn9kJWOCIwI0Q9JEkAyGM/YHDL5HbJ4OsQDHLuKmyw4jSKQLd3AkO78XxjNBjKRwz/rRRgKl8Qu75bvG0IzydLvzIpJFwRUFEyg7zcR/gLHXS1IAF0278c4hmUatOJAKAsDP2TiXJnbYdTGCRkjLNIAAU1yolpoZGaX/Gz3npws52xZF5d5SjlJr6SEW4CvMhK61DwDJO6mMP1LmQYYQou1Nv0k7ETsM59FCDvtHDctEBW5IV/PYxzApo=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(7696005)(26005)(8936002)(8676002)(6916009)(6666004)(4326008)(186003)(7636003)(9786002)(426003)(2616005)(336012)(47076005)(82310400003)(316002)(70586007)(5660300002)(508600001)(36756003)(36906005)(54906003)(83380400001)(70206006)(36860700001)(356005)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:02:53.6438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec176ae9-4f43-44fc-9f81-08d9a34ef37b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6894

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/xl/xl.h           |  8 ++++++++
 tools/xl/xl_cmdtable.c  |  8 ++++++++
 tools/xl/xl_vmcontrol.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30..2ee75a0 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -98,6 +98,11 @@ struct save_file_header {
 
 #define SAVEFILE_BYTEORDER_VALUE ((uint32_t)0x01020304UL)
 
+#if defined (CONFIG_OVERLAY_DTB)
+#define XL_DT_OVERLAY_ADD                   1
+#define XL_DT_OVERLAY_REMOVE                2
+#endif
+
 void save_domain_core_begin(uint32_t domid,
                             int preserve_domid,
                             const char *override_config_file,
@@ -140,6 +145,9 @@ int main_shutdown(int argc, char **argv);
 int main_reboot(int argc, char **argv);
 int main_list(int argc, char **argv);
 int main_vm_list(int argc, char **argv);
+#if defined (CONFIG_OVERLAY_DTB)
+int main_dt_overlay(int argc, char **argv);
+#endif
 int main_create(int argc, char **argv);
 int main_config_update(int argc, char **argv);
 int main_button_press(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d..dd43920 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -20,6 +20,14 @@
 #include "xl.h"
 
 const struct cmd_spec cmd_table[] = {
+#if defined (CONFIG_OVERLAY_DTB)
+    { "overlay",
+      &main_dt_overlay, 1, 1,
+      "Add/Remove a device tree overlay",
+      "add/remove <.dtbo>"
+      "-h print this help\n"
+    },
+#endif
     { "create",
       &main_create, 1, 1,
       "Create a domain from config file <filename>",
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a..88c8e66 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1262,6 +1262,53 @@ int main_create(int argc, char **argv)
     return 0;
 }
 
+#if defined (CONFIG_OVERLAY_DTB)
+int main_dt_overlay(int argc, char **argv)
+{
+    const char *overlay_ops = argv[1];
+    const char *overlay_config_file = argv[2];
+    void *overlay_dtb = NULL;
+    int rc;
+    uint8_t op;
+    int overlay_dtb_size = 0;
+
+    if (overlay_ops == NULL) {
+        fprintf(stderr, "No overlay operation mode provided\n");
+        return ERROR_FAIL;
+    }
+
+    if (strcmp(overlay_ops, "add") == 0)
+        op = XL_DT_OVERLAY_ADD;
+    else if (strcmp(overlay_ops, "remove") == 0)
+        op = XL_DT_OVERLAY_REMOVE;
+    else {
+        fprintf(stderr, "Invalid dt overlay operation\n");
+        return ERROR_FAIL;
+    }
+
+    if (overlay_config_file) {
+        rc = libxl_read_file_contents(ctx, overlay_config_file,
+                                      &overlay_dtb, &overlay_dtb_size);
+
+        if (rc) {
+            fprintf(stderr, "failed to read the overlay device tree file %s\n",
+                    overlay_config_file);
+            free(overlay_dtb);
+            return ERROR_FAIL;
+        }
+    } else {
+        fprintf(stderr, "overlay dtbo file not provided\n");
+        return ERROR_FAIL;
+    }
+
+    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
+    if (rc)
+        fprintf(stderr, "Overlay operation failed\n");
+
+    free(overlay_dtb);
+    return rc;
+}
+#endif
 /*
  * Local variables:
  * mode: C
-- 
2.7.4


