Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB944A750
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223697.386511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9j-00007N-C7; Tue, 09 Nov 2021 07:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223697.386511; Tue, 09 Nov 2021 07:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9j-00004t-7i; Tue, 09 Nov 2021 07:02:55 +0000
Received: by outflank-mailman (input) for mailman id 223697;
 Tue, 09 Nov 2021 07:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9h-0008WR-L0
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:02:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ce2e50c-412b-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 08:02:51 +0100 (CET)
Received: from DS7PR03CA0324.namprd03.prod.outlook.com (2603:10b6:8:2b::24) by
 PH0PR02MB7319.namprd02.prod.outlook.com (2603:10b6:510:1e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13; Tue, 9 Nov 2021 07:02:48 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::60) by DS7PR03CA0324.outlook.office365.com
 (2603:10b6:8:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 9 Nov 2021 07:02:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:02:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:47 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9b-000Ga6-Ly; Mon, 08 Nov 2021 23:02:47 -0800
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
X-Inumbo-ID: 0ce2e50c-412b-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAP3qgvzQ3dPMe3SrwEtSEu1Dr3ppafUBsjhSG+PA+Gd5vxY/0c/CRdPMMWVzNnmYuZyL7PzCzf/kbmM+knLC27hRTknAbxg97mhcWbcHK1XH2UwXi3hJanceOOjcwYRerenn/ORieMONQQms2A2EFXU0dt38x/l8W/bEBkX//zltAB/DdjQEre5jLw0omyLyp/4xxXDEojBzaS38wdtgdDPTjcEwZWrFi6hzPSO1oDR9sOWCPeBgAuEwIrR2+/FCTTsb31/mdoQT26YnwQ5Svoc7FCc7yuA1u6r8izLoUJWoj0PC4Kqd9od94EPYlK/T9/mrifj7IMKo5LAdMGH9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIewzG8LywGWbHesUbd3OwI+EI+4G2+90rM3TjxjMto=;
 b=AC+zclWUX4ssIdyn93a9IQn6m6QDevnHOpDEA9DcDCC5Q1U5zkjQHjomzZ74t019M8o7u3TpPg9dM9jXl+0e7Putf8JHToEi/J6K6ij0hIY9BLLSL/JZ+owJohdsrY63CqvGue4hDPMm9w8GAlvKUkDHRU8EZJsLkt30dSux81pj2r8IV5PNbmHzAs8zeNWU1LAg1gQgmrCuWmF3BlKaWKFVeNcAaOo5qVgklJcYkvF/sZ0FpCOw98+JkazGJyKW8Op2Ux+8AzkigC6NIKChNCjAEU7iBG7sUAUUQWAGioJBG/fZT7PhN7F8oiQNkwaOsmVWt4HhP1pltaSDRYEBXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIewzG8LywGWbHesUbd3OwI+EI+4G2+90rM3TjxjMto=;
 b=RxwU6jSjsdsz0tComLWtsmkxc7BuI1XJtTd1Bxms/rbKzjwRWdKazW0IilVeMiZj/rCd1wI8WM7iBvO2lO2Cj70EHVrxtJdmJ25lmUJ4/2O8/sBPhwaAF5u8PRtCNkPIk3L/EKh61s34clGjuPlWAxXRrZMb+DOJe1GF1K7v+AQ=
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
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v2 05/12] device tree: Add _dt_find_node_by_path() to find nodes in device tree
Date: Mon, 8 Nov 2021 23:02:20 -0800
Message-ID: <1636441347-133850-6-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16419d0b-8a6a-4c6d-519f-08d9a34ef01b
X-MS-TrafficTypeDiagnostic: PH0PR02MB7319:
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB73192148A09CB12916062838BC929@PH0PR02MB7319.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CxrKvQBgjaFpqcDX9shXu8wa92CnssaHYwKGafmN6YKDRGt6L4gNl595IsjZJ4BvF8Uw+OY2Y1GCneV2XjdMkuxHfHIzIAvXlG5jxcKgJg0edp8LHMJArYw0NTW1zngjBMV0c2ABNrHxEvA/d99RJ1+vMxU4VqTNbIS3kCU1urUDiNfNqpbHbklGEhAFQgxyaPTN0N+vSFqUuPKAsOUasY9t2dSOjpN64f72Fw3EZ476FzPQycLxO07/hcqXovaZtRK8v2HuT1AaKsS0iYb/vALngN/hLwOptK+Y8y7Q5ptOdnNGlIuZiJXm9DeLjfF00k5psJhgwswRAfIbvhIZS9jnDmJ5ReZ6yPiJ/mevQabMvuAFEHIYI9faQq6fUN2pCnSiHQ4azgar4W2z52H8F/24RQU7p8ccg5qFrf+PRSjfUphq83xGtYZX9Vcdu/gUdotttxVsrYD+tPbZwK6dtVz7FxCTWLzbuZXeeusqAfAQHREehjiBwoSdk0+WizXybFI9duUXrum4zpO24FUMa1Rza+SXopaQEs0nFoDA7uk2r/PtCXsbCE6QWE/VVwnoiNAGiPpCLEA0aQpD6CgvzPRDhIG+aC6yaJn5vsRQmgNTuxCzXrv0y0Dn9ETHiAU4ucJaf4v09AzMK1nIAvw0eY6ScNSciOqhM5tcitd5LdYFZF2oBtkF6U/u7KI/ZrIusFzX01tgkvavrRuPXmu6uYRL/8oODc2FkS0nZITnhadDrrIS8LAc0y7QZy1P8RAf
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(336012)(5660300002)(426003)(36906005)(7636003)(82310400003)(36860700001)(70586007)(2906002)(316002)(4326008)(2616005)(36756003)(107886003)(9786002)(47076005)(356005)(7696005)(83380400001)(54906003)(26005)(6916009)(186003)(8936002)(8676002)(6666004)(70206006)(508600001)(102446001)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:02:47.9785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16419d0b-8a6a-4c6d-519f-08d9a34ef01b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7319

Add _dt_find_by_path() to find a matching node with path for a dt_device_node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/device_tree.c      | 10 ++++++++--
 xen/include/xen/device_tree.h |  9 +++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 88f3f7e..26d2e28 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,17 +358,23 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *_dt_find_node_by_path(struct dt_device_node *dt,
+                                             const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(dt, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
     return np;
 }
 
+struct dt_device_node *dt_find_node_by_path(const char *path)
+{
+    return _dt_find_node_by_path(dt_host, path);
+}
+
 void dt_print_node_names(struct dt_device_node *dt)
 {
     struct dt_device_node *np;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 9fc63ab..5ba26a0 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -525,6 +525,15 @@ struct dt_device_node *dt_find_node_by_alias(const char *alias);
  */
 struct dt_device_node *dt_find_node_by_path(const char *path);
 
+/**
+ * _dt_find_node_by_path - Find a node matching a full DT path
+ * @dt_node: The device tree to search
+ * @path: The full path to match
+ *
+ * Returns a node pointer.
+ */
+struct dt_device_node *_dt_find_node_by_path(struct dt_device_node *dt,
+                                             const char *path);
 
 /**
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
-- 
2.7.4


