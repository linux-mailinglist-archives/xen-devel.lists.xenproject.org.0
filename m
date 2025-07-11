Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1706B011C2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040189.1411639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nX-0003Vr-Hv; Fri, 11 Jul 2025 03:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040189.1411639; Fri, 11 Jul 2025 03:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nX-0003Sh-Ej; Fri, 11 Jul 2025 03:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1040189;
 Fri, 11 Jul 2025 03:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nV-0002LK-Cy
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:41 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2406::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 599d4927-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:40 +0200 (CEST)
Received: from SJ0PR03CA0140.namprd03.prod.outlook.com (2603:10b6:a03:33c::25)
 by CH1PPF2D39B31FF.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 11 Jul
 2025 03:51:35 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::5c) by SJ0PR03CA0140.outlook.office365.com
 (2603:10b6:a03:33c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 03:51:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:34 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:31 -0500
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
X-Inumbo-ID: 599d4927-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4tNC57znbiVZhGbg+bZW4LW1gfnc7y+hSr+D1lCJlIEl0t9pvprCSqKQ27cSdhagwPfbdq5bNrOEC4rOlEs1bA6rcFefV2WV+HvCjDKVuD1tmlrEQlXPdxi/g5GCyrnDrRaPL7Q9yekDoD0JV7sPz8z+tIPGElLsIV6HdnXCFC0wKqA4q37Ntu609Vp/dWHHjGTcZz+9Y/Z6jFshgUoWQmZcDfWr+J16NypB9Wy65+jggy4t2zfPdjZxedUiDeLJXr7xqNsNdHujIibEkSc/kMniABOKSPdzTbGg3NXKJmIb4jmI23yMmtcFdAnJT0Et5qy7MONEVFa9G2A94vUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hz2vvcLhqMjL12aKRxcqVaRwBFGL84npFuUZ7vzfLlM=;
 b=sRh64jnVx9+dO6Uapr08P8jJOZ9W8S/PaXJZgkfbrzLgsMyFhRNkFP4AlL2KOlTb8bvevQUg7PWbl5RijBrPW//92xQY6+VlhhDdX2bcJmfhkQjCvujAtOLrrI8KsG3/+7JQNXfowdhAG1JONpedJEtNm2OAhRkBIzKzUpvGwKEu4cxCOMrmoHS6lqIqbfuq7OJLOs3v+ryTmh1x6spQX6XHmAOsfSdgqjuhgQ7an5yMLNfPfJlsn47X49mVMy9NtWRmwRfW15kfARv+0j6ijpf3fjTDfaLWR8ol3244nk2t8NyL5smIFvd9Ody1M8AQMMCwiqU8XPcJ7B72c2PeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hz2vvcLhqMjL12aKRxcqVaRwBFGL84npFuUZ7vzfLlM=;
 b=138UGLy0DMTqlrZtt2iWQnkNTgVvO4NZ5RufP4c2pl2uwXgz/d/KdrbaRA9kQdsazlfYjV9KxRrfA97GH8p31vAzmliS8x+cPtXG2PIVHlzMXKDDz1YS/0NVndvAEnkFcXkkIfbnYHgbtaYdWa8QrWCWjqH4bZjOSoaC6XnPa3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Date: Fri, 11 Jul 2025 11:50:52 +0800
Message-ID: <20250711035106.2540522-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CH1PPF2D39B31FF:EE_
X-MS-Office365-Filtering-Correlation-Id: 85756015-e018-40df-06ab-08ddc02e3af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIIUYSthzS1Vo2EDvYx//ZijMT4MavIsEo1T26U8BxDdKc62kmrVuPkD67wc?=
 =?us-ascii?Q?y6zlIFkVz0hje1G4Tj13TuEdIlasAr5PrV55+kK9OwGJUDYhdMbxeosiOZ1v?=
 =?us-ascii?Q?+iB7GoLFeDrFJWTgB0/iw0x/e4JCXgBMEqx6iC5KuA0KPOu6KNTPy2uhNjlB?=
 =?us-ascii?Q?2z7P2mnUht7jScPzjacLO8taQHw0G2a+8VAI+vSkIkyq/zVSfTR4MXZBtebQ?=
 =?us-ascii?Q?hHOqzfkqpVP+maxOJBCqfeiRnRCbMo0B6n0iNWdFTEssk8lX1aHkQKJgNHoc?=
 =?us-ascii?Q?Q/mwbTLtEIphc41mh9f2kaDXL78Df3JH5YBkDl0+vFj0MdjfiTLDCnLyA1lk?=
 =?us-ascii?Q?JVJZ0zqDl8rJhWHOcClMx7Wc3MrGTZ1Z8lYAdGdBZzJbgjITpvFq9XCj9rxg?=
 =?us-ascii?Q?Bfd8Z7C0BoLj9hW6UEdzbAf6uj7vXZHzfWZfpVP7v9LYifFJJy8BimHl+oG5?=
 =?us-ascii?Q?0Zav36B4UtlwHNZgj+9eWGMEp/N81Oi7upOfKTxYaQR8OLJJd470O/g6vgwP?=
 =?us-ascii?Q?gkT09WRshpvdwi6/Rq9XFoczXMTSAc9E/euYfmUtqtO81lFAr6Lm031eKnXB?=
 =?us-ascii?Q?Yg7bFl2Q8iMXXQSmLIF8Gn5FD1CB4oGpKrLLo/PodMpSyhpTTzWwK6z3XKO0?=
 =?us-ascii?Q?d0FeDfrK+niD+qzgUzlWbney06FkjN+PwtiT2zOZOahxqFbKQNTy4vFi/5q+?=
 =?us-ascii?Q?55TiD+nK4UzWf7vYW49zYQSQVMRW9l3TNBFe3JeDPwKZ/lwQnprBQtQ7QuP5?=
 =?us-ascii?Q?ttPzKbD+CrmS6zW7LqJOae7ao2TvXKTWanwfj5Y7nIGoALn6i3plOLBHl3Kc?=
 =?us-ascii?Q?smZxStskBftNsdFc0MbqNHrNooy45PN0PQOoRlHoaDTke0sohcFgp3DxEhnp?=
 =?us-ascii?Q?hzbT8XjxgNANFBktGOaJZgM2R+As1AvMc3JsmCPLMH3BTq1vz+eekU9hpSTx?=
 =?us-ascii?Q?YibEx9khP983NbSK8+gwitRf6bVVR1Jqm5eTgN6Te7fvlc+Zg/TWiK8lqYtC?=
 =?us-ascii?Q?nAvIdRksRE7gnMqpyt0Wv7UVS8+NTnxGqQpCUx6bZz9Ms11oQ9VHXj+PVeKw?=
 =?us-ascii?Q?bjc9PEZTId0kOKMdgYD22H4WYD8opwz0SPfMKuNfbCUJBo7DGPvVc0xiL+9Z?=
 =?us-ascii?Q?tYr6wI82EhR06LFgM1w+U81sS5PKqnMhbQXhAbF1z3hMi8dkg+ceG82/wmrW?=
 =?us-ascii?Q?az+8iQ83kurYqSIqQhaoDIC2e7RP6AyHB3JOFZuSK1VKXO+JlT95r0pXkAYy?=
 =?us-ascii?Q?Ulru3d3HmFxLdpZ2i2Vq5U51LwMO6uwyYURZBTOos7Q9z7+oEEW/T6iIEE4h?=
 =?us-ascii?Q?Rw2yBFEJmFE9OabKJBc1CW3qqivA6IuOPMezEsrG+9XO8LNjc/rn0gixvxLY?=
 =?us-ascii?Q?t/cRAI+zN5N9M7tV2Py3qglENcu/uKMgqolpXfPGOGsExqrN+tfer/xWWrdc?=
 =?us-ascii?Q?++48XDzSUAt1krloCL/ebm1A9rjMeVFSoManfVFNhdkOyEVqmu4R+L1V0Hvl?=
 =?us-ascii?Q?g4JbEQnX/KMsjUktYXsyf+oIpehZYUSwUjAx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:34.5563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85756015-e018-40df-06ab-08ddc02e3af9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2D39B31FF

A helper function handle_cpufreq_cmdline() is introduced to tidy different
handling pathes.
We also add a new helper cpufreq_opts_contain() to ignore redundant setting,
like "cpufreq=hwp;hwp;xen"

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
v3 -> v4:
- add one single helper to do the tidy work
- ignore and warn user redundant setting
---
v4 -> v5:
- make "cpufreq_opts_str" static and the string literals end up in
  .init.rodata.
- use "CPUFREQ_xxx" as array slot index
- blank line between non-fall-through case blocks
---
v5 -> v6:
- change to "while ( count-- )"
- remove unnecessary warning
- add an assertion to ensure not overruning the array
- add ASSERT_UNREACHABLE()
- check ret of handle_cpufreq_cmdline() and error out
---
 xen/drivers/cpufreq/cpufreq.c      | 59 ++++++++++++++++++++++++------
 xen/include/acpi/cpufreq/cpufreq.h |  3 +-
 2 files changed, 49 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 564f926341..887bc5953d 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -64,12 +64,53 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 /* set xen as default cpufreq */
 enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
-enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
-                                                        CPUFREQ_none };
+enum cpufreq_xen_opt __initdata cpufreq_xen_opts[NR_CPUFREQ_OPTS] = {
+    CPUFREQ_xen,
+    CPUFREQ_none
+};
 unsigned int __initdata cpufreq_xen_cnt = 1;
 
 static int __init cpufreq_cmdline_parse(const char *s, const char *e);
 
+static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
+{
+    unsigned int count = cpufreq_xen_cnt;
+
+    while ( count-- )
+    {
+        if ( cpufreq_xen_opts[count] == option )
+            return true;
+    }
+
+    return false;
+}
+
+static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
+{
+    int ret = 0;
+
+    if ( cpufreq_opts_contain(option) )
+        return 0;
+
+    cpufreq_controller = FREQCTL_xen;
+    ASSERT(cpufreq_xen_cnt < NR_CPUFREQ_OPTS);
+    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
+    switch ( option )
+    {
+    case CPUFREQ_hwp:
+    case CPUFREQ_xen:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
 static int __init cf_check setup_cpufreq_option(const char *str)
 {
     const char *arg = strpbrk(str, ",:;");
@@ -113,21 +154,15 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
         if ( choice > 0 || !cmdline_strcmp(str, "xen") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
-            ret = 0;
-            if ( arg[0] && arg[1] )
+            ret = handle_cpufreq_cmdline(CPUFREQ_xen);
+            if ( !ret && arg[0] && arg[1] )
                 ret = cpufreq_cmdline_parse(arg + 1, end);
         }
         else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
                   !cmdline_strcmp(str, "hwp") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
-            ret = 0;
-            if ( arg[0] && arg[1] )
+            ret = handle_cpufreq_cmdline(CPUFREQ_hwp);
+            if ( !ret && arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
         else
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 0742aa9f44..948530218a 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -27,7 +27,8 @@ enum cpufreq_xen_opt {
     CPUFREQ_xen,
     CPUFREQ_hwp,
 };
-extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
+#define NR_CPUFREQ_OPTS 2
+extern enum cpufreq_xen_opt cpufreq_xen_opts[NR_CPUFREQ_OPTS];
 extern unsigned int cpufreq_xen_cnt;
 struct cpufreq_governor;
 
-- 
2.34.1


