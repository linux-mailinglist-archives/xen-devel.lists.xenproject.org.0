Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F696A9B3C2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966630.1356815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zKK-0008WG-7H; Thu, 24 Apr 2025 16:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966630.1356815; Thu, 24 Apr 2025 16:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zKK-0008UN-37; Thu, 24 Apr 2025 16:21:28 +0000
Received: by outflank-mailman (input) for mailman id 966630;
 Thu, 24 Apr 2025 16:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAo-0001nN-Vs
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c817a06c-2126-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 18:11:31 +0200 (CEST)
Received: from BYAPR08CA0001.namprd08.prod.outlook.com (2603:10b6:a03:100::14)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 16:11:22 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::e1) by BYAPR08CA0001.outlook.office365.com
 (2603:10b6:a03:100::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 16:11:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:11:22 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:11:17 -0500
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
X-Inumbo-ID: c817a06c-2126-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOk5Zcj3gGbLAGhdmsWyigFOw0M2iBItfv3nOhRJD/h8KNv+FoNeFZZaK1vZydITsCl0a8/mvtoYEg4uv1o4W/Uvx8n9aePUaA47X0nfNf7mzFPIeYxWR880sSQWNDiNlFfT+QmZf5QkwVgT9Atq7TfbnaL7UgagzB4BVDOkpCj5h8orPE7KKjBWYeCyIs+FNL9mxOLM4nZtJ8wzWOJpruqD9qRZlvW7trN57uy/WRdMLzA/+Ho+cliuPuQc4zMNBvYKHD97wg4iC4iGOMg/y3y3EUer7A8pJUe73ZZxfIk45wk4FpqwPBSuaW3LEIFF17u58eOK0+YXhDuRcezoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnYdhXQLD7Eiy2SzydZQeTnvDQgUvVY63+cNfwNHfqc=;
 b=Xa/RXKF/Hu6cDs3CEYHg72bHjuaVZhTResDnrolmA61iWXCzi3Ddk10FsK0b8SxqQp8vEitgmND3VzvyVVLgAM65HF+mIoi3asTuPuVd7GLZCxvmfUmn4Mpq3NhQYFPvOxg5Znpz36T0Bk5MKqHPNHtdkh+b1/dRe6se0Afx/bXUazE9iUR3+FrlSSPsp1a9poRoo3BxDdzMNfh2EBrLgjQj6Cl6e+R157S2tn9F2gZS/kvaZWSUQJMXK/D/ra4fDatZ292s1TrsrL5uE16rcFxqCVBvHXqkm5RlGRNaQaUNqtxt+Kj6gxpIGnBWYT2LoTWsdwT3KbuYcpcMRuvaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnYdhXQLD7Eiy2SzydZQeTnvDQgUvVY63+cNfwNHfqc=;
 b=vqz89+4STj/AcyAuHL9wdnzgUwRhHXaV/IiD1QmFRX5ZwnEaB9/EjPhRJXhf8jMyhZv7mdQy1cfFDS3sSnt+r2PGO+GLSlo/0uJL8gx+ZhRCB0aK74r+Wbt4Sx/u8r+vN4GRRRhMW+dHJx52UBfWzNGU+AzPsxu68dmEMyuWYIc=
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
Subject: [PATCH v5 12/12] x86/hyperlaunch: add capabilities to boot domain
Date: Thu, 24 Apr 2025 17:10:22 +0100
Message-ID: <20250424161027.92942-13-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: c115599b-caae-41f1-8342-08dd834aa7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7d4beJut/MVPBv15XLaG4UyINf3f7O+Bfx5SzK8YAuy55KskDcB3Q0V3wNOg?=
 =?us-ascii?Q?5A6y4zRezCJOHQmA8kL5ORJuyW9HErM4KOOT658BDTH7+Odz+0v5Rc8X1R3Q?=
 =?us-ascii?Q?Lj1MHIMtTFZlgWO4TqAM9R7LcI6w8w8WUB4o8Z6525tr3BtVevDClbXrTYIr?=
 =?us-ascii?Q?WAEdzH3JjAenaD2owrUWXmRUBFLcuPyMj5WPCIDcHo9g4MZVlwLvQPRadwml?=
 =?us-ascii?Q?L0QOkfof14bTKUuQafw5hZys/o89EAApyr4bLclmjZLMRU4WsAqKm5DQMtpI?=
 =?us-ascii?Q?U1XlHXFjoibbaRMDQRY4I4t0y8nx7gpi45f03Zeu0zdX+wRq6AaoBmiEOZjQ?=
 =?us-ascii?Q?NmUNH4zaZSjs8N6ZDRMXc7PczpCxNUajQ6jQ2uplia4NQo7EOLePFjUvviKH?=
 =?us-ascii?Q?8jCKpCmRM+tvkGpM3skUP9L4Zahn7JYZUsdyEg+x4pngrrBHL8On+GK2VVyP?=
 =?us-ascii?Q?UEWZ9cL7WHuSuLcPIvkYQFleMlJCxBHlV7xEyFAXXT24YBrHhnRNQBXYn0hl?=
 =?us-ascii?Q?WlhLxcbfVvuhDnGpkWAhF/LWI5LPM6SOvyU9m2IF9cKyT3JX41q1IZ6gHNUk?=
 =?us-ascii?Q?zKDdpGClEFENxo25MP+2P/dzWG7kJfg0KEUkbRMOUe9HYm9ykp/hszUgY5sa?=
 =?us-ascii?Q?8Fg1aPM9IGDqfgiRIk9vnU1wH5bmMy7quytOYkjWlzJlcv1fziaWMdnWnmIv?=
 =?us-ascii?Q?5JWSj1vghcL9wGIVV+Jlz+kqbBI2TUargHUlg4IGSdvmqLBhfKIpA0wGqgN1?=
 =?us-ascii?Q?VLa62k2RtaelvjO94rOxIHkUmmIO3ogX+8e2PBBZAU0O4ZHPiDHL6ek2xB8K?=
 =?us-ascii?Q?FicgiV2jDWW4O+7FSwvIpHnNz3v1kZfYJVL3OVB10q6G3KUYzkx0iu6EGQYh?=
 =?us-ascii?Q?gGp+AkYv3EOjT1tHbKxBrXuomroM3BMVybICjFN4QDUOyXOnb15ajXHNigjX?=
 =?us-ascii?Q?nG/UvlxtkKui8xRebnDyctsxvUCmvjKZ8heJLsjZrIon/qkyT6+nAzGPn1mn?=
 =?us-ascii?Q?2+6aUQyioBJzhr6rWaZOnCWRNzYp7c0h5A/oMIE9NHJIdwoA23UgVD7ZC39s?=
 =?us-ascii?Q?8/4QS7XWV65dV5xy+uDKnOxd9NDl2MTl7DAQJVQe7/4x1udSTX4nyYiysOQg?=
 =?us-ascii?Q?jx+WuSzyxk7MKvbh1qP0FOaqBXaXEsm8BDnpRbHgZ+KfjnjiaWTHXB3zTEPa?=
 =?us-ascii?Q?1Tl27xg33O0RbRgyzy8L7TghXg7NnKhkuOZuSCBdd46XfXeB+/pGkyykP3aH?=
 =?us-ascii?Q?nDOmWzNi/NtVUAJ3GdhcErhadMcgcR2HhQ9ln25oOcSWJcMrcHiOXyigs6rN?=
 =?us-ascii?Q?WOhCrNyDHR0oRQUFjM9ZmvRvIu043IOjUtG0VDrzpXYuZSDKfxo7d7zyW9GJ?=
 =?us-ascii?Q?67rNed+wVNB/bNlQJQp82CfdYw09PYpqqOhBvLC+G5KjkjKIlnZvz37h/u5K?=
 =?us-ascii?Q?T8bGnr7h9qaIzeMo6DDhcyXqD7DD3yNCsRbtyH0jAux392B4rg2H98sN/Wr7?=
 =?us-ascii?Q?E5NXUhwS6I5ltqF2NnbH0nGoFvZEkg5N8MLB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:11:22.0957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c115599b-caae-41f1-8342-08dd834aa7ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to assign capabilities to a domain via its definition in
device tree. The first capability enabled to select is the control domain
capability. The capability property is a bitfield in both the device tree and
`struct boot_domain`.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
v5:
  * Removed BUILD_CAPS, as DOMAIN_CAPS is now in public/bootfdt.h
  * Assigned DOMAIN_CAPS_MASK to dom0, rather than only BUILD_CAPS_CONTROL.
    * So it also gets hardware+xenstore.
---
 xen/arch/x86/include/asm/boot-domain.h |  3 +++
 xen/arch/x86/setup.c                   |  5 ++++-
 xen/common/domain-builder/fdt.c        | 23 +++++++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 969c02a6ea..cb5351241a 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,6 +13,9 @@
 struct boot_domain {
     domid_t domid;
 
+    /* Bitmap. See DOMAIN_CAPS_MASK for a list */
+    uint32_t capabilities;
+
                                           /* On     | Off    */
 #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d4f839146f..960e43c785 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -61,6 +61,7 @@
 
 #include <xsm/xsm.h>
 
+#include <public/bootfdt.h>
 #include <public/version.h>
 #ifdef CONFIG_COMPAT
 #include <compat/platform.h>
@@ -1050,7 +1051,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
     d = domain_create(bd->domid, &dom0_cfg,
-                      pv_shim ? 0 : CDF_privileged | CDF_hardware);
+            ((bd->capabilities & DOMAIN_CAPS_CONTROL)  ? CDF_privileged : 0) |
+            ((bd->capabilities & DOMAIN_CAPS_HARDWARE) ? CDF_hardware   : 0));
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
@@ -1313,6 +1315,7 @@ void asmlinkage __init noreturn __start_xen(void)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->domains[0].capabilities = pv_shim ? 0 : DOMAIN_CAPS_MASK;
         bi->nr_domains = 1;
         bi->hyperlaunch_enabled = false;
     }
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index e90f183481..09d2930e16 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <public/bootfdt.h>
 #include <xen/sizes.h>
 
 #include <asm/bootinfo.h>
@@ -313,6 +314,28 @@ static int __init process_domain_node(
             bd->max_vcpus = val;
             printk(XENLOG_INFO "  cpus: %d\n", bd->max_vcpus);
         }
+        else if ( !strncmp(prop_name, "capabilities", name_len) )
+        {
+            if ( (rc = fdt_prop_as_u32(prop, &bd->capabilities)) )
+            {
+                printk(XENLOG_ERR
+                       "  bad \"capabilities\" on domain %s\n", name);
+                return rc;
+            }
+
+            if ( bd->capabilities & ~DOMAIN_CAPS_MASK )
+            {
+                printk(XENLOG_WARNING "  unknown capabilities: %#x\n",
+                       bd->capabilities & ~DOMAIN_CAPS_MASK);
+
+                bd->capabilities &= DOMAIN_CAPS_MASK;
+            }
+
+            printk(XENLOG_INFO "  caps: %s%s%s\n",
+                   (bd->capabilities & DOMAIN_CAPS_CONTROL)  ? "c" : "",
+                   (bd->capabilities & DOMAIN_CAPS_HARDWARE) ? "h" : "",
+                   (bd->capabilities & DOMAIN_CAPS_XENSTORE) ? "x" : "");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


