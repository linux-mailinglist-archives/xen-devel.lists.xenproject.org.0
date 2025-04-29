Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE37AA0BDB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972418.1360784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHE-0004P3-3Z; Tue, 29 Apr 2025 12:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972418.1360784; Tue, 29 Apr 2025 12:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHD-0004NC-WA; Tue, 29 Apr 2025 12:41:31 +0000
Received: by outflank-mailman (input) for mailman id 972418;
 Tue, 29 Apr 2025 12:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDi-0007L9-6U
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2413::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c15bbb54-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:37:48 +0200 (CEST)
Received: from MN2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:208:23e::14)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 12:37:45 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::8d) by MN2PR14CA0009.outlook.office365.com
 (2603:10b6:208:23e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 12:37:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:44 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:38 -0500
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
X-Inumbo-ID: c15bbb54-24f6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKY6d7qUdjWCXXp4sPcMpQn+ypy1VohlOBGabRj97oHZdXEJCgIQqmQXdY0ADfF8tEcdQvczoTXv9iHBQfy6Zbir19yEkvbgZR74Buk49KdRpKeGTKUNM2LmO4QLW3qpMVFscH4546HKQwQjdnLMq0wzBQ6a06iCUwYKp6si1eskN/YJ398hSNno9UUANZBxYf39qj9fX+buP1z7o323cksgdxd0HjijV0jh5z4eON0Lv/q8E6I7YPrVFHWHZQ5JKB3ntom2leNUwBwp/9Cxj0MDh24yiNdJx/jW61maE8YEr8olix5OTmoTtiN4fn7RSqKaXxOtyLAqSzdulJkD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWJmF8J3I0L8/d+4QMX42T2JCCUmBXzaxaMVzbsl3mk=;
 b=Gr4U4qEXs2iPbBD+5sBco5uXW68DSq2n7jkcXyUpckuGbAv2XBWwdO6+7V1zaGbk0bQtB4RLCuuBcPdrrEvSqFVp/20ZnBdOu45mxFtir4ZmNcsWoqhmEyi4g1RFVBido6dRIJxHxjWmFRTAKpIZCOeSDeDcCMQLOHagluTRrqFpvbBFh/WFZsxhSfPalx7bCACGxV4iNTzHqSCPdp7nHDF3fayEVlBRnd0NbvBab1dsT3T1lrCidCnbT4YAaG0O878TIya7qY4iHONWfLWNcdIfxN5mDH+q9TiBzQByj13UyBLCRev3G+Y0h5cf71dXc+Jlt99boEm9flpqVMbqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWJmF8J3I0L8/d+4QMX42T2JCCUmBXzaxaMVzbsl3mk=;
 b=Gf8f8Nod3SC2lLGSnD/pkP1bsOurYSEBsC8ZmEhiRFNZL1Pq6DYnO7KbmJAM9H5tPr5OZSzesQn7iHjjb5Vaj2zx/SLbtDqsFugibZ9fNk6U8zGJwpDzayIhof1ln322oT0Ez6+0zUKbk3rH2uYsXWvzaMS9IGycbBF7MdmzNVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>,
	"Denis Mukhin" <dmukhin@ford.com>
Subject: [PATCH v6 09/12] x86/hyperlaunch: specify dom0 mode with device tree
Date: Tue, 29 Apr 2025 13:36:20 +0100
Message-ID: <20250429123629.20839-10-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429123629.20839-1-agarciav@amd.com>
References: <20250429123629.20839-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 551c868e-1a01-42e0-77f6-08dd871aa411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AKwx6ZHWVZUgbJxSO2TeTuSDoN+7M1Nfs7AjTdpL7uIppYS6wPwCREyFU9BZ?=
 =?us-ascii?Q?BLMHikTWLb1bGCPAJW9Bj9QApR3XvtPpCBFcZQpb1ynP/NeN8wFZGtL1ORoi?=
 =?us-ascii?Q?V+qvEjWOupTw5o2NF5yHPwUeO6FnskTC7CAEmvbRpsl2cVXSEEZ+kzihjONr?=
 =?us-ascii?Q?S0AQFkjxkHpmaGPj+QA6fsb3MFpz0gbLFXEmbvJOe5jbmeg0rF92CuQWJl7U?=
 =?us-ascii?Q?hJovHr9rnt8MR4rdm2sUjMyXJiFHi/5RjugrdByVwOnXOE2AK5wWe99buQh8?=
 =?us-ascii?Q?XqwZeeFB2s42EUG6sMYwL4GJVOmGWgl/2cHrRqHZlUzK1qiWM2mvB0D8t9aR?=
 =?us-ascii?Q?KLxF5Q2VrflcAj4bzsbBXo05kIqb9Ay+nGF5MS5P9alLuBEL0ZfjhRPZxhR9?=
 =?us-ascii?Q?tnClwXwWZLby6hlkjknEndiH/ZtWznNWAt3Cf2epXnlG3TGEQbOdD0+xW+Iq?=
 =?us-ascii?Q?JpbDl1OEw0wv79oqv88TiWWsANaXvmFb7oiaziOgLMpeC9rn4pHzWFA1YBrp?=
 =?us-ascii?Q?Z3n9dsLTb6Cz/QIjs7NF5DMunaMk0VVCsBqlxix0NNyrtbURvh6jhyPmKoVQ?=
 =?us-ascii?Q?EasqZeDzVdFjG9t2KU9zLVMOf4TQh+diZwyLYzBhnHLyCdT78B3Qi7K7o8lS?=
 =?us-ascii?Q?FXJ181ntv53HwqmkikxhRBZ6/cMm+U9ojqdqbcFpgt/gRNXTCdx8+wsOTP1D?=
 =?us-ascii?Q?I3OhZuN9QAKqV+O8RmfT4gCQVMiiaPUXs1+NTyblpECUkJ836mKMxJBX7TQy?=
 =?us-ascii?Q?ebr7DD+e0iP/Ex5ckpk+Jgh7wtEB+bNqnB3ytwDJqAlLpbXEKpu7PkxYOYAn?=
 =?us-ascii?Q?X2RwBmGy44LcL1FD421GNeCq/KoIxIesTS0F1qNIZa3l5ekLWq516Pvt1dVa?=
 =?us-ascii?Q?gP8Kkqo7ws+7l5Q3/0tjJ6LDzxl77hYoVT7G94Bj+d6bTBmRdp0YZ/qSqzpp?=
 =?us-ascii?Q?iMX8BD4VqpjHTxvdBbgNgejXMOEXor33dnG1/M1j8ejctvmxxan9B8NA/Tp/?=
 =?us-ascii?Q?NBFeb14GEaCsn6tlSVPsfvcFgcgi723sPcLYtm3SYU+bckXPM43V7dUuiwDa?=
 =?us-ascii?Q?rD73Wt2y/Umcry/qlyrqTO3aG8AsP5nzWfe6qRrA3e6LA8gqiMnUfcQg2oAB?=
 =?us-ascii?Q?ZvINcjG8UDp6c4xNhjdzLx2dUsagdBza/IjB4b3a9VOMA9rcenyE96VPV73v?=
 =?us-ascii?Q?ElsqIEXx+ufQ+8I9yxTj1JdKnBuPrz0Alf2CebaldAf8dGB34TYtMZm44Buj?=
 =?us-ascii?Q?4rLjqttXs1HVZQxXLtutwVcU51ira3gdJegdwffA+BsSlQ7laozM6zflEqx8?=
 =?us-ascii?Q?YLzmA2Sy9KCryzW4ZNzECZxwSnjrFm6YrsX4o2+SwEDroD4KfiNJDGiinJxb?=
 =?us-ascii?Q?noabOCvXrw/XceRNSoIfAwONn3SYAQu6c8bTer8YeaLWy/JHWwYMUjxjYfCO?=
 =?us-ascii?Q?V5zR6Q6SfLZ+ytI26q8CjmlRF53mazyvZrb/pTQGiwxwVH9S3esH6tJAOlK2?=
 =?us-ascii?Q?SANHydmW8xv/yJk45dmX3LZQVVwKPZjgiKAc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:44.7150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 551c868e-1a01-42e0-77f6-08dd871aa411
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Enable selecting the mode in which the domain will be built and ran. This
includes:

  - whether it will be either a 32/64 bit domain
  - if it will be run as a PV or HVM domain
  - and if it will require a device model (not applicable for dom0)

In the device tree, this will be represented as a bit map that will be carried
through into struct boot_domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/boot-domain.h |  5 +++++
 xen/arch/x86/setup.c                   |  3 ++-
 xen/common/domain-builder/fdt.c        | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index d7c6042e25..e316d4bcde 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,6 +13,11 @@
 struct boot_domain {
     domid_t domid;
 
+                                          /* On     | Off    */
+#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
+#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
+    uint32_t mode;
+
     struct boot_module *kernel;
     struct boot_module *module;
     const char *cmdline;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 10ff67ac37..343f87ee9d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1030,7 +1030,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
 
-    if ( opt_dom0_pvh )
+    if ( opt_dom0_pvh ||
+         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 2c05b0a22d..aadca11dfa 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -235,6 +235,27 @@ static int __init fdt_process_domain_node(
             bd->domid = val;
             printk(XENLOG_INFO "  domid: %d\n", bd->domid);
         }
+        else if ( !strncmp(prop_name, "mode", name_len) )
+        {
+            if ( (rc = fdt_prop_as_u32(prop, &bd->mode)) )
+            {
+                printk(XENLOG_ERR
+                       "  failed processing mode for domain %s\n", name);
+                return rc;
+            }
+
+            if ( (bd->mode & BUILD_MODE_PARAVIRT)  &&
+                 (bd->mode & BUILD_MODE_ENABLE_DM) )
+            {
+                printk(XENLOG_ERR "  mode: invalid (pv+hvm)\n");
+                return -EINVAL;
+            }
+
+            printk(XENLOG_INFO "  mode: %s\n",
+                   (bd->mode & BUILD_MODE_PARAVIRT)  ? "pv"  :
+                   (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
+                                                       "pvh");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


