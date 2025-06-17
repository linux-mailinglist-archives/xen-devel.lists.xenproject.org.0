Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30854ADDA34
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 19:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018391.1395289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRZt4-00033t-Hh; Tue, 17 Jun 2025 17:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018391.1395289; Tue, 17 Jun 2025 17:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRZt4-00031Z-Em; Tue, 17 Jun 2025 17:14:18 +0000
Received: by outflank-mailman (input) for mailman id 1018391;
 Tue, 17 Jun 2025 17:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wDO=ZA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRZt3-00031T-0b
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 17:14:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da9a652-4b9e-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 19:14:14 +0200 (CEST)
Received: from CH2PR14CA0029.namprd14.prod.outlook.com (2603:10b6:610:60::39)
 by IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 17:14:10 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::70) by CH2PR14CA0029.outlook.office365.com
 (2603:10b6:610:60::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Tue,
 17 Jun 2025 17:14:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 17:14:10 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 12:14:08 -0500
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
X-Inumbo-ID: 7da9a652-4b9e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN8yqFz1kLAEq0P4HtMIhnEw1lhJAHOrkjMuOBBVqY1KZWb94xjV0CxROqDQnt9IYLLe34V9WafoqmIvO/WGybQqvimk9ctC9zpJpbQrAWloRwfnRFf/j6SwWZJz+TcONNhaIti7jmeC710q4pud57IYy//AqsMsDZh5donom/QfdWiGfOjmEQFekN12eTzYHNohmTXBpCWW5NkeXzcvRHLqzFf94KKENcrSl4Zvi9z88SvA/jT8JvNMG9KOeg2VgLwoTMPNUU0mnzwJVOVNawme3rYCr3+3t7unVqqVFDFH8xYI0rQAu2I4RhYcHo+1uEfCaHgkqjBfFGwySxpvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=626UhhwDAAKKE8InXLkNjul1IpTXB+/Xqq68g0GeaK8=;
 b=TT13PB01a5EOy61WcWpj6+g+6OZheIq2efVQSMu6YaIMWnPX/wGxZcUulIYJfHRSFn76agW4yA6aPapKoAIRFUa02fVfav2vSabibmXoULP1CvvwejTCIEwt1gJNR/CeHdO7KuSQt/VDdG7qOpeZEZbuXSA556KqogxVduf2/g7qAaVnAljdyiLH8O7RCaCs6/vpl8vGFkeL9DpUlXEtJTLgS6sMZO7N82IDd6ocRT2qI0foQpALbuR1eKa0kITFiCbA14j/GVUCU2ybDdmGtqKPoZSuZmDvgJTxglgikiI+Npw7Xkw5wDjuRXn1ezXNrSZIWoTykdTTt3GcYj0d0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=626UhhwDAAKKE8InXLkNjul1IpTXB+/Xqq68g0GeaK8=;
 b=A/BGe533bBWi4h5bbM3UdFYz/09qG5xbzcZsPMwks6E90HJ/kePYGsjA7zOXgHfwsHxEnnV7LWQxPGr/idKYU9tiKRk4UQEoh6ZXB8qHQMdE6BiLTehTXraZagnU0ftDwhb3acZxmoPUL4zfukkDp3VPKjhMxy06nuhlQdDOan8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2] xen/dt: Remove loop in dt_read_number()
Date: Tue, 17 Jun 2025 19:13:57 +0200
Message-ID: <20250617171358.670642-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fefd52-b252-4fbc-343b-08ddadc25ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PBWAIuQuBRMR/AHT7eJFLlqnH69tw2165z5b+05+JgHX2niYduUNIpDgXw6E?=
 =?us-ascii?Q?ZCTQUsM3j8DJjE91nRD+IqSS/CrHCK5yj+ygwEOUldDnU9hWsgEjkt5t2iee?=
 =?us-ascii?Q?45OoaCNGzMea2wbMk3GswIs4V9DQGsvT3HhpQHv43860zmv15FNafvO9e/wB?=
 =?us-ascii?Q?Qz/LAj0LNdZLMNI7x5D343hbKuuff9uB2058JJd2yTawglC2b3Vs5iuM1c3Z?=
 =?us-ascii?Q?vh1dMAux+pB2Bx2bbdbroJikYgSlAaBVj6JFeI/th+RinLwJ/l6dTwNPkfUF?=
 =?us-ascii?Q?dDAhrBGVYIPyNF1Au1l1eMWDXmKYZ2UXPLBEOiEGRoGLZSUA8ZEpe0K3vHIX?=
 =?us-ascii?Q?6kZdf+pNP9gbLmtW26IGxMJOkEkctv7bdFwK8p6ZtI3OvQbH6UsszqhtLxNb?=
 =?us-ascii?Q?kKcof4bByWFQfHgnW7KmUxOiaOyzM1S9Ty5AoXtxcljC4m+0WxlumnoHcxtY?=
 =?us-ascii?Q?7Q3X0gpvRoaIDaMrJZT3I+06MqjB1AmwFmpQqrpQIaxmZqLymPiZ98nw5v42?=
 =?us-ascii?Q?cDxeBhtUTXD2V5vs2kKmaXIlf0sojRaTEnNu8WCdLygQQjxYssINzhJGx75Y?=
 =?us-ascii?Q?0lgNvB6IfLkEHXkwV2SYD1lMAuM+F4fH9TA6SOivNHcmwVveOuQjys8gdJdf?=
 =?us-ascii?Q?lPIcltfWnMTKTL0zEDCnlEsUbE0PJUP18/Eg+KpkkFpLLDrNzgPFxoMrrOFG?=
 =?us-ascii?Q?nuOXUEC0hPK87kxETQ/CvTcXlRyPj1AU6ieZrunIt349kWTR1Vtyo9aSAYE3?=
 =?us-ascii?Q?4Z6tNuZrJ7Yk30H/+xF9pGcmkgVpAj8MckGy85+gkO04XdpbWWeCxw/JYKwG?=
 =?us-ascii?Q?9U02yYEAhXHfo+/5EGCwnUYjew4dNadR6uSOE+iMgGGVEcndk7wipwYT9ws6?=
 =?us-ascii?Q?k3SrFxo1EBhBRuNBU2ki5A8kFGd+wdupKxPPTp4Dng0XvUhCyrkk549TRMaQ?=
 =?us-ascii?Q?MGZv/ANfdAFnsagpxUOR1MiSosbUkJVuV3ZS8FKacgrNuRBG6d5E7lTIHJ0d?=
 =?us-ascii?Q?yTjp10DEbKvmqgsJoV6f/TsOEoUPeAJGVzqsljciPOjJctrXC3yB3uJFn18O?=
 =?us-ascii?Q?9siJkAIXCwZ1rlZXFpugLYLjmmWp3z/hBh54IXJMC2TjbbDIPJ/M+owWHL7/?=
 =?us-ascii?Q?XBoVds5jW3LqRyFlQP66fl4QmO62oEZ6o66F98rY2N1F4vzM95MrBt+EBvJY?=
 =?us-ascii?Q?YZtcwTnDGubBsB5iMB6rSbuI7dwnI0ZiRdvNJNKzWtMs+uzMyurcFW45ATOL?=
 =?us-ascii?Q?HoCdUNqcNiBzb6x5Jzm4blJPn90+soratNYw90sXfkdPHXck8btHOhPbmDAC?=
 =?us-ascii?Q?DheUemznZGS/mwr6ZhDUyRzXtw+HBDKnbW7/V8fsalTil7OzAkClw6jb2g4m?=
 =?us-ascii?Q?jBCY0R6hUKx71EuO/xuZxPNAwSUXwdNZUIiXWCmebXK+XWQaLboDAL3sovie?=
 =?us-ascii?Q?gilRaLZcN0HFujMGPDH3QwJwjA+WPl7l7HFRfj53UTPUtSH1sZXKIvWWAcSV?=
 =?us-ascii?Q?0WXRQScwPN8ZGuuLwbsQbv8AKC1duEuYqrea?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:14:10.1635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fefd52-b252-4fbc-343b-08ddadc25ffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263

The DT spec declares only two number types for a property: u32 and u64,
as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
with a switch statement. Default to a size of 1 cell in the nonsensical
size case, with a warning printed on the Xen console.

Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v2:
  * Added missing `break` on the `case 2:` branch and added ASSERT_UNREACHABLE() to the deafult path
---
 xen/include/xen/device_tree.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 75017e4266..2ec668b94a 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -261,10 +261,21 @@ void intc_dt_preinit(void);
 /* Helper to read a big number; size is in cells (not bytes) */
 static inline u64 dt_read_number(const __be32 *cell, int size)
 {
-    u64 r = 0;
+    u64 r = be32_to_cpu(*cell);
+
+    switch ( size )
+    {
+    case 1:
+        break;
+    case 2:
+        r = (r << 32) | be32_to_cpu(cell[1]);
+        break;
+    default:
+        // Nonsensical size. default to 1.
+        printk(XENLOG_WARNING "dt_read_number(%d) bad size\n", size);
+        ASSERT_UNREACHABLE();
+    };
 
-    while ( size-- )
-        r = (r << 32) | be32_to_cpu(*(cell++));
     return r;
 }
 

base-commit: 14c57887f36937c1deb9eeca852c3a7595d2d0b8
-- 
2.43.0


