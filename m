Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3EAC4AA8
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997946.1378777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq01-0003zT-VT; Tue, 27 May 2025 08:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997946.1378777; Tue, 27 May 2025 08:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq01-0003wv-RP; Tue, 27 May 2025 08:49:29 +0000
Received: by outflank-mailman (input) for mailman id 997946;
 Tue, 27 May 2025 08:49:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJpzz-0002ks-Fb
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2417::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b5d7f03-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:22 +0200 (CEST)
Received: from MW4PR04CA0163.namprd04.prod.outlook.com (2603:10b6:303:85::18)
 by CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 08:49:20 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::a1) by MW4PR04CA0163.outlook.office365.com
 (2603:10b6:303:85::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 27 May 2025 08:49:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:17 -0500
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
X-Inumbo-ID: 7b5d7f03-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIeZ2eQo10zwcE1r+5ujiBRNlSsmDquBZcKsyQ7mhD+q7b+HZsGJcY+vkQiT6cbXTw/XdSAK8uUHTJWsZ943VY9rZ/JGpWAI1Xd4d8YnKy79ijWg6RnZHGZt08pOX/uQx69HEt8GdQjD3kqgnFaSJBYw5FJAJYMKsKaCHDw6P+fdOy/YfSnUPvXsrQMgWoliO8PR2ZgbQUrWF6lr9y6Qs7XyOI1txW/7rwvjJKfd8pU1Mw0OeV1/Gzq0VqtErLM4Z9u9Ds5YJ5IFkDnUmQKGGyQeniogX0kReTcu1EEyAPHlXWJMPddlWq7F2MVTNirtPRvON5zRcWXMYypF41eClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jy/8v14iiBy4RKFkuZ6/LcMiLpi/ycMhiWhZ/kpWtk=;
 b=f7SeKjaxeaZ4Hm5x0xcKMDOIrjT6vJ6BBpMU8eM94swkYeM+sAp+NfQu3p/3ZV9btyJKaXT1s9gPUBPMjxAcsyvB8KV4TrSwQ77Z5rgqWfgkA4OYQRH5JUen9gk7Jmya5J+pHQ6b8YHHtMagXq+gpyHb4ddZO7A9Thw89QVyrjyZCMhfp+PZfUduTY/8bLMMh7QvvPO6+bZv8ANNMxm4TCJMHel8bq2k46uUmZYbxISL9tyRrAPwMPsxGK7685TSmz29R8JG1AkiUiUAIA8YOZvfFKWEr+W2Ck0NsW5ixX6Fjw0Ph4rmaGfqJewB3PrVtRAHuBDeC6CNDGlB7BbA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jy/8v14iiBy4RKFkuZ6/LcMiLpi/ycMhiWhZ/kpWtk=;
 b=sMeEUm+9pMjaQA4UzpqSyyz7spoaY1e8ymZ7ATkV5vbkXaMEGEfhFyrTQVa6xK4LJCm5BwGoNmlAr5XaQqRzfgBdy8Op7GiCIZkuLDzxPxNhTuKs7zbDpiZS+KXybs/kofpXQRNymkhmnq1Bp9alF+3RUuOxHZMIaxoDHOGhmy0=
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
Subject: [PATCH v5 05/18] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Date: Tue, 27 May 2025 16:48:20 +0800
Message-ID: <20250527084833.338427-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|CY8PR12MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 87963892-470d-472a-bfdf-08dd9cfb5e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OqJJzblkk6wbTBFBY4VTGPtyIJsK8ia7ADdNaueXzcLIQ0JHxVTZnCMfQdFs?=
 =?us-ascii?Q?w24/b3+G1kg4NbaKVqcqcjgkZybJafnz+J0zSfhg2Rku+GLqkvwqCcjkTS7m?=
 =?us-ascii?Q?MG1xja7Srw7LLgcB8jcEEsosEx157YqWw0vkBwz7AczEFn6ibOWZu+l4jp3I?=
 =?us-ascii?Q?kz0THwUUmcGOw/Tee7O3yeoy4A7IkWFDn1xsnDDr+LbTD1yl5EuveiPXI9m+?=
 =?us-ascii?Q?cp00//bIoWm0sBbS5MB+WRMLTmf8Mw9mg9Wg52ZjIDvt2mn9oT++K3t55glJ?=
 =?us-ascii?Q?XBSyo9KWZV/bsJjXuoayNh1wlLXZ0vdjsyc0hNAUVrQUlAwucDTZqDXkB81k?=
 =?us-ascii?Q?KDVYE+xwBMNARUBuCQa9SJbVS2mTygg5dXjvPRBLXnVsZGFEMcfIguw10LF5?=
 =?us-ascii?Q?VbU9M4Tj5LWtczcX2k2q52Kbtj9sLMjx+3icdRfb1i1TXmbQosE2GuvckIgB?=
 =?us-ascii?Q?ozcSTGPX1s+dvkOAdJ/dcVGEZfyJ83qHXkiaWXIKJjW9GkiznYdHjZpDqKYf?=
 =?us-ascii?Q?rTnR54QV18cmn0aYmGsjJebtqQdCRxIA3LvEP586jcZJdSr8CI3yAIwrn980?=
 =?us-ascii?Q?lBhP2RnyGjbXR7x+POaa1yVVuvVuiFlq1pQL7pbXt1cKSUGn55lxgWni2Vel?=
 =?us-ascii?Q?1/MDWdrz2yC2uWmmIVJNMzSwA2SYS1MZ9p6yzOw41YXMSiEE4+VkiA3WPg/r?=
 =?us-ascii?Q?jcuoKkRXkvSPI9lPEF36Zsqbm2vufeCmy7nq7uiAhL8h5mEwigBv8s/YAbbp?=
 =?us-ascii?Q?wlsxTWtKE7Cl5TH9G3qsb9CErqy+ZSWf9p2av8wQBC2Vy43EJ03Gi6N6AsoY?=
 =?us-ascii?Q?QWoNeFpbf6X3LFv6ZVbELGS8ggv9RH2I50MdOVROKm7VPMzDXb5ghtx5f2Dq?=
 =?us-ascii?Q?1BP2pPPsADcNy9f6calrZPOfCn54+iMOlBpD6gFbZ2ZcBMNaYTDZoUxB1QRQ?=
 =?us-ascii?Q?+US0qoXAT0YurgJH6KsVMIMhSm+uywtKrgCxdClo8rMdTiR/BmV/M1vKT9nr?=
 =?us-ascii?Q?Nl/JRT5AXn2iA4SSNZDrvtzqbDICDduvIPGLDYFMtgiLhLeyuKkIyTR3hNOC?=
 =?us-ascii?Q?oP3DK5/tv/T5pXFy9WMnhfqjw1GN/fyRO72EFVsvc2uqggQ0MTHyWY9W8JtZ?=
 =?us-ascii?Q?fg3SahfiRWfmKMw2lwGxHkalxi+m/HfcEBSzzeWCOdgV4eIfZqfC+QPn/C4Y?=
 =?us-ascii?Q?8cXl47kC11ec6jLaqqN4UTm/0tAhi4fqJnwXBze/xdIA139usWvWnZvzyuQk?=
 =?us-ascii?Q?jXL3AEYd0izKgGGls5/eD0c13YY/QdqxiKH5M8HWnQdRwsDcuQJX/IuqajsE?=
 =?us-ascii?Q?ix+eSTQMYtEOHDGumKUvTyYGUrFRychsCv2s7go9cDgqzFdgtqX2Usu49myF?=
 =?us-ascii?Q?aRvuF6sFXVGx93NeT0ffq+304Pt1rmJzoBbKjx9wYEFtw/ErPO3fZ8Ifqf5C?=
 =?us-ascii?Q?kUV52GieTjyYBCPefafWVYbpUnbkYLD9V+V2cxoVbwQMvBdLXKGKAX1sVLOr?=
 =?us-ascii?Q?i3FE4lenjpfrtNU19UABRXyt01jS3iA7+YOP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:18.7827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87963892-470d-472a-bfdf-08dd9cfb5e49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611

A helper function handle_cpufreq_cmdline() is introduced to tidy different
handling pathes.
We also add a new helper cpufreq_opts_contain() to ignore and warn user
redundant setting, like "cpufreq=hwp;hwp;xen"

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
 xen/drivers/cpufreq/cpufreq.c | 57 ++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index d6b6c844d8..d1b51c8dd0 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -69,8 +69,55 @@ enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
                                                         CPUFREQ_none };
 unsigned int __initdata cpufreq_xen_cnt = 1;
 
+static const char __initconst cpufreq_opts_str[][5] = {
+    [CPUFREQ_none] = "none",
+    [CPUFREQ_xen] = "xen",
+    [CPUFREQ_hwp] = "hwp",
+};
+
 static int __init cpufreq_cmdline_parse(const char *s, const char *e);
 
+static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
+{
+    unsigned int count = cpufreq_xen_cnt;
+
+    while ( count )
+    {
+        if ( cpufreq_xen_opts[--count] == option )
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
+    {
+        printk(XENLOG_WARNING "Duplicate cpufreq driver option: %s\n",
+               cpufreq_opts_str[option]);
+        return 0;
+    }
+
+    cpufreq_controller = FREQCTL_xen;
+    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
+    switch ( option )
+    {
+    case CPUFREQ_hwp:
+    case CPUFREQ_xen:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+        break;
+
+    default:
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
@@ -114,20 +161,14 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
         if ( choice > 0 || !cmdline_strcmp(str, "xen") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
-            ret = 0;
+            ret = handle_cpufreq_cmdline(CPUFREQ_xen);
             if ( arg[0] && arg[1] )
                 ret = cpufreq_cmdline_parse(arg + 1, end);
         }
         else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
                   !cmdline_strcmp(str, "hwp") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
-            ret = 0;
+            ret = handle_cpufreq_cmdline(CPUFREQ_hwp);
             if ( arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
-- 
2.34.1


