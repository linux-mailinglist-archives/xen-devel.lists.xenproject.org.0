Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53996AE2260
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021147.1397206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgfi-0003db-9b; Fri, 20 Jun 2025 18:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021147.1397206; Fri, 20 Jun 2025 18:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSgfi-0003bA-5C; Fri, 20 Jun 2025 18:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1021147;
 Fri, 20 Jun 2025 18:41:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgW7-000575-0O
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:31:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:2418::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb8539aa-4e04-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 20:31:09 +0200 (CEST)
Received: from BN9PR03CA0764.namprd03.prod.outlook.com (2603:10b6:408:13a::19)
 by SA3PR12MB9130.namprd12.prod.outlook.com (2603:10b6:806:37f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 18:31:06 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::6c) by BN9PR03CA0764.outlook.office365.com
 (2603:10b6:408:13a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 18:31:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:31:06 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:30:59 -0500
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
X-Inumbo-ID: bb8539aa-4e04-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMhqa1kTIYCf4NzWImT5JpH49AqwHqfKfygSxTixuJF3OK3syOg6QcCXEEBRhHDlNBmy0+LWoaDG87tQUl4C++3oJHq/JiM0k4ZH3u6KwBYNFIpa6z9kT35mvUMTBsE1KF7zJcLBDdBv5F323Ha6mLzUOZWzBwyBs8lc/+GIPjPwenOWh/vrHoCboinaDtajr3KKGo2QVsm1I0V0W+JgW4gZBmWEv410O9tH9nf1che0ai67CeOEoeywca8esPhhxpAdJnQG8plcVE9VltbQbolvARVKpdNw7Pul0sUdyotZeVJq0pgc2COo9hJfsWhA6yrdK5g2Tam4zRN1eypTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snID8HzNzcBZgNFX9WTQWN+pDYAdWe59wYWpzaONW8Y=;
 b=kATa3HSdtbpe8kH6R54jP8YlQUMXmiHHi7amhjo17I6GetDaC6ffHP+//zW4Q7padOWQ6FUms3BbEhFsWfoy3Td389AmnicIRieDzdeQuxNgGmsuNmr7LCtwmdii7Co9n6SIvPFvy1+YrbXHv9zazI5ba4Mt/qE6MlXkxuoAvX/QmNbhiTrw+gq7pEnyl9gmBJonl+toOdcrAsP3TKD13gkL+dAovgFhA/0wIVVe37f2bIcpuj/N+OdDq78XD6t/dDFtuOU5r1xGgYMdpz/JGcupkeALdqnyJc4n2yBBHMmn8yP1zuNT7BtbGpkwzw8g/izomcPUCjv/pxlv2n7qGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snID8HzNzcBZgNFX9WTQWN+pDYAdWe59wYWpzaONW8Y=;
 b=LI1JO43DhjthShNzR2/bHOnfgF/imP8KpPPuCGpWvKtc45sXYR5Sovd1cNX2pCG5J6HPKdxU4o2QM4W17JuZ4wycQamY7YEOtNE3j2jMwGxc4P4AzZWgx4bwbR7mcnScOH/c6qBUGmLuv4KPI0mD2wDcMo+tyrQ3PpzH8hdKO/8=
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
Subject: [PATCH v4 11/12] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Fri, 20 Jun 2025 20:28:57 +0200
Message-ID: <20250620182859.23378-12-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620182859.23378-1-agarciav@amd.com>
References: <20250620182859.23378-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|SA3PR12MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce9a183-c907-4f46-5cf8-08ddb0289e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TfBK87mEFmQtlBvOFCb0Q5j94IKmNtlgARgfkKbTNQIzzTJX4a+vacDscdnL?=
 =?us-ascii?Q?2u3mw0Ux6SVMtzL8HkaFXq9rBoB2oAt5668hET1AQmS7e2u3bfP996odCcyx?=
 =?us-ascii?Q?9idS+umbhswHRXWzqXdHd/bxGyZlnJTPeQQJDRX+4nVFDyplOMaeRYxVdFQr?=
 =?us-ascii?Q?sFod2OkVuGlyShKVJ3XEPIOYXExTsrCWVptvLFHtQqWnLwYS/HExXDWamQum?=
 =?us-ascii?Q?ksHiomdVbNRATKM9fYa7ninLBuVtOXPaQD3Iun7AKsrsPWUy6Wt6h4MnmSdP?=
 =?us-ascii?Q?z5HdsoLKQ1j3vrb1VmGFz5kh+veeFDzZW+wYh9VvHd8OMiDPwR1j6hBidt7G?=
 =?us-ascii?Q?sc3irhczOr34BE5P+RH3hny5C3vEVmmdA6IT7NVABJ0EnK3fF4sM90l7wvi1?=
 =?us-ascii?Q?HDWD779Vj7PYj7/KDQfqveWL29qVKZXKxwRerLxU9FVfKXPvBQ8D0e+Pwfjs?=
 =?us-ascii?Q?orj18Xamw3NkF2t1rkDsSxEnj04y/CBA5N7k9Tk09j0QGzR144LRgEfV+oUc?=
 =?us-ascii?Q?B6PvfgNbuoKKy8gLGxgrpMRF1XvxXzVwn9Z0OYmW9sAnydMButJ6BELQbXRP?=
 =?us-ascii?Q?wYW+ZaBbc01umpPRA+ir9qNCUxhU81uuRq0E9JJfevKtDhPh2QfC5j9Dt8tU?=
 =?us-ascii?Q?d2Ty+VXBaYoBD0SHcbz+Bub3bNJL6n5wsTv4hMxhV2F8FRo/Jkql5I9e5rzM?=
 =?us-ascii?Q?J7dJLh6w8AImC2a01mrZrqTjNo0OIY9o+/s8wQlDBJHrHlbTmZ9htJXRN0N6?=
 =?us-ascii?Q?VqfWe/UecKl+DdGjZXEwy3WNuJmmfpkYiqa2uRK1o4Qu4NJYaGhb89VQ09Hm?=
 =?us-ascii?Q?n/cVcWnGcqEJAh8n1u8EW2abUBS/LVGITP22aypwG0PcYxof/GC/0oLVnw3D?=
 =?us-ascii?Q?JnLEM15AJnmVZTjMVkIxm/rbff3S5XtlQ8kTsWd/nByZdwDBaomZ/scdWgMw?=
 =?us-ascii?Q?3iZKdRIvj0OMPDdzgWvXIzU8RrdAhpy3fIECQILqbszjPgxrdQNt4eCUuJaA?=
 =?us-ascii?Q?tprWWphLb4J4sddHcM2v5WynsZ0hzRSBPoy82nAazD8uSDXo4mYhZErg8glG?=
 =?us-ascii?Q?5DXPKKq3PtUvoyfbFu/Bp8piXcDZ/wUih9GjJuG0i7Km5iFHc/Uy8MQJXOyL?=
 =?us-ascii?Q?luy5hHbr2tEoWw3meDaTpqUBGijZ38d/sU5p40Na6yrdYRuAoPkdtI+m/y6S?=
 =?us-ascii?Q?RuvpQo4fXvxbsq+C93b4kJazoNZvsGiao/CaJvm3PBYSysuLiRpM8mDQMfgk?=
 =?us-ascii?Q?rinVj3YV9v/dW1X51w0DQq9D8Mig3GIbx09mj+mlhAcPlreo/YlJWELEU1Ee?=
 =?us-ascii?Q?9Pii/w6/NKuxv/BpKM54Zks0ZuCe7ESvT3RtZutZvfc0brPOvEAYgMoVQhFz?=
 =?us-ascii?Q?WeuOvzOmWnGhkj494uiPyN1jAbEKgZ+aof4fNNxvRVtNiW/yH0MDSQgYY82c?=
 =?us-ascii?Q?vO13gh2sh8ILDZhQP113ZmeIkoQtYHjTJzX6Kzb5tZaFMhXxIJWxiUU/Xg3g?=
 =?us-ascii?Q?pGl3STkqJnins4O/l7193l9nhU10gMc8mJF1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:31:06.1177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce9a183-c907-4f46-5cf8-08ddb0289e97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9130

device-tree.c stops requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY and may
function with DOM0LESS_BOOT.

Without this, there's a clash with x86's definition of device_t. Because
x86 doesn't discover devices in the DT it can simply skip the code
to do so during the unflattening phase.

Not a functional change on architectures that currently use these files,
as they already select CONFIG_HAS_DEVICE_TREE_DISCOVERY.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/device-tree.c | 2 ++
 xen/include/xen/device_tree.h        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 725ff71646..741e2ce585 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -2029,9 +2029,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
             ((char *)pp->value)[sz - 1] = 0;
             dt_dprintk("fixed up name for %s -> %s\n", pathp,
                        (char *)pp->value);
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
             /* Generic device initialization */
             np->dev.type = DEV_DT;
             np->dev.of_node = np;
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
         }
     }
     if ( allnextpp )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index b6d16756fc..ace7fc3274 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -108,9 +108,12 @@ struct dt_device_node {
      */
     struct list_head domain_list;
 
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     struct device dev;
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 };
 
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
 
 static inline struct dt_device_node *dev_to_dt(struct device *dev)
@@ -119,6 +122,7 @@ static inline struct dt_device_node *dev_to_dt(struct device *dev)
 
     return container_of(dev, struct dt_device_node, dev);
 }
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #define MAX_PHANDLE_ARGS 16
 struct dt_phandle_args {
-- 
2.43.0


