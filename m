Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE0AD9111
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014511.1392660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6D1-0007Ni-9s; Fri, 13 Jun 2025 15:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014511.1392660; Fri, 13 Jun 2025 15:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6D1-0007If-4W; Fri, 13 Jun 2025 15:20:47 +0000
Received: by outflank-mailman (input) for mailman id 1014511;
 Fri, 13 Jun 2025 15:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ69P-0001Mm-UF
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:17:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2414::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74315ec5-4869-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:17:01 +0200 (CEST)
Received: from DM5PR07CA0079.namprd07.prod.outlook.com (2603:10b6:4:ad::44) by
 IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 15:16:58 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::b8) by DM5PR07CA0079.outlook.office365.com
 (2603:10b6:4:ad::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 13 Jun 2025 15:16:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:58 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:56 -0500
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
X-Inumbo-ID: 74315ec5-4869-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oir+acExoA4qX3AbruiBxJG5szffXfkpAwazU9HvEmocTnr368Z3f9Dg3NeVNpkN6Kjno3jgQSnSJd6DsmgUeS/QDiWFhv6WjzWD8qXRwP3LVPHSk3xRmUAPkmh6LxeY6/FYYKWqNeDTHSDC8nBME1O4YL27fis6IFf7TVUIvAKfL9NGCN60aprjZFtmd8BckFsDK2UlCdWwH6Ve/fPZIVYtJJ8hMHlgN0pLDOPYKZMhqnSYqg1i5r+cUsieSVvK4yhYKTefP0dEXYmyE1ENwmzAW7lBudp39du/wa3/E57fcR6rtA21BPJqZGNfgyfDW+nDe5YXNpW6WvyEoev83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brxUSyWoWAWqxgYUG8qaIMM7Yyx7/AEhfufohTwOIXw=;
 b=w98UlQ0DESOvBmVBzPA9TaCxX8vl+LrB7kDhQUNqg0ZUj+DBrvtuDCRFPNLFWnfVlQcLJ1V+3g/sjNAQoGzdQ6znMJT+Dt+aiWQo2uk+QZ1ES5RVnLOaNZ4yGEf8VMtTMsgUv3VxzkVPW2hJfnjpaIeNpoKv3whd/7Ypl4SOZFmUTo42ArlOIUDc+Lm8O8d8uUSlbSNUe3zZVGBEbVkyRntspjUJHWYFXnYPFbILPpxxViaUlU+YA/qWTe4mc3fO0uTnCO0CzGNZCICwiSig9pOIXhRcnwcaRqOgo34dRoJKzx6QMxxFNcBQBhuNSA//gjRYLGabf39AuNLWdJRrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brxUSyWoWAWqxgYUG8qaIMM7Yyx7/AEhfufohTwOIXw=;
 b=pNKo9mmV4oDqgIJ+sjqn9NNtcxKjZexZ5LDy9EVjo4oq4kPKQqlviWdmnnQPKPtwgmzs5mHuMvlkxfybUUApSuAq5s1Hu6zwuSYAxutQTYjzXzdwLIvcHMqA5l5+eaa9Aw8AL/2NyRFZkyvz1Kppb9pwhx0nwUkKZf7SpIjjFAc=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 12/14] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Fri, 13 Jun 2025 17:13:21 +0200
Message-ID: <20250613151612.754222-13-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e9a47c-06c6-4580-bfdb-08ddaa8d56fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qg5eXVHasiZAJ1vpklXsNvZB9WtvIfF8lc46zZIY+Qc7uugp/agnb+ZY2ehJ?=
 =?us-ascii?Q?SV2Hm3Yt2HaAPNprjmBCCTwt8R+wLbwJMbiv78lbhh6v0woQSFUjlSGZtMMN?=
 =?us-ascii?Q?+nU+rMqAFNen/sSiLzPJ4LuTHHn0Iyk6v9XnAh8q2Gmdb3J6FDpAOPhunOtK?=
 =?us-ascii?Q?2oF6YwZscLDC8C6B2Y4OJHcIiaOrW0SiQbrzyFjrEIvMeX4kQnDUFMBbQMYG?=
 =?us-ascii?Q?p4bdcjrOXHCmtbZ5I9mZwT/nAjBclFwktOC3paT7+L7IaZR5qM0jQKYqHy+Q?=
 =?us-ascii?Q?8xqmxnAdMmO7y3w0BC0yhEcaJ6Xz8dYLqz7DgKcqm21OellkhKxhY4SUDJAw?=
 =?us-ascii?Q?eqMRT0CXK7M3OPMX/r5pKQ8M9rijOgS4nMGWpyjEUlz2AfZCo/vLcg2+FzU9?=
 =?us-ascii?Q?c0iL7dwqAheH0bk1o2D4p4VdiAfe1+1IsERji8IMD+mHO8OW84hdvyNLyV/J?=
 =?us-ascii?Q?Ocglpg1Z3f+w8FD/C4kC2+RcjujIDUZAKn7zypXPY+stSdjmbDa5Ii51wdmB?=
 =?us-ascii?Q?MqemEGYoeiwZ3o7q2LOjdBdwxh0QD8FUTnuRAvmQwNG16QEE5F6+G4dWYUWs?=
 =?us-ascii?Q?S/mafBHaFLwlWHD40tttVmte8USYcqIhCUSiav+oDgAcMpiqimGUKFc2RYUC?=
 =?us-ascii?Q?4FHQnVAt6vqs2GtKEqcr1oWM6X7m0HmFAbfRkV72/P3X3TSAxdSct1yYsi4Y?=
 =?us-ascii?Q?0dNxUE+1acl1THQh17e6zvwHKkRK/WjOTTxHZc1s1iWzg8XhBUOA3XW7oqz0?=
 =?us-ascii?Q?HgstKJYXbcyeBMPMpS2WHJuTcjkVq3C2OM6JenPQZ9TZiZEzb3kvCTQ2XaDu?=
 =?us-ascii?Q?5nZjYMx8hQJlrq1isqRgZ0drd/aWR7nfwL4tBqwVdE/AYAoyM6DckJG9cyki?=
 =?us-ascii?Q?bkjzFSlskIA5xrpHPjkAU/nRcULcsME+82eFB655MoYT6bzIjpUptS3j/p+P?=
 =?us-ascii?Q?IHDLBtGGylTQNbEGoP4HR9FZBHpQEenMUnir/z4HmDW9elBSWVXO1YUY6HvE?=
 =?us-ascii?Q?3jIVq4wcyNFHePzvBtSncBjzpZvs4GdRaqGAO5E9if0zcn4uq1iDpcU83nxP?=
 =?us-ascii?Q?dYlVqzhYElVqt1HyD1T2LYkhDEYXhr0PgRleaqlxIz3vzrN/XdsDsTG3lTyU?=
 =?us-ascii?Q?ik0ewNBB6BSIKFknpDGVj/hohcetXWgiCU7oxp0+AW4YHsO+8sQGYcp0gC/+?=
 =?us-ascii?Q?HaVtVaAlowJhMXdZERXYhS7pt2X+PbfjSwoCFWz7hafeY9oEqzhpe2SlbTYr?=
 =?us-ascii?Q?Tq4OeOKKqgi0qCeVTiMXNPv2nJIZpuyTgUoA3MLRm/7thX7hUvZhR7H536ZS?=
 =?us-ascii?Q?2apr5udHK4I+rPzPwIuN7fHVmuBmAb+w+/O4OrUDCsYlwELU96YXf/s2whE5?=
 =?us-ascii?Q?R7BviyX/fpcnos5+uNcA+mbR/gapScaQYKWUng0vYDij16izjzzsUrSzc1i1?=
 =?us-ascii?Q?GL5z4XAe4h8xJ1c3LWLkAxgfXIbzCVzYsqqDftsoyr28b8Qyg0lTYzqDhJWU?=
 =?us-ascii?Q?acRBVUTtNvNfHKUQ5jFP/Nosl5pq+dtqgjtw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:58.2154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e9a47c-06c6-4580-bfdb-08ddaa8d56fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649

... which means, device-tree.c stops requiring strictly CONFIG_HAS_DEVICE_TREE
and may function without it.

Not a functional change on architectures that currently use these files,
as they already select CONFIG_HAS_DEVICE_TREE.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/device-tree.c | 2 ++
 xen/include/xen/device_tree.h        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 886e6c7712..c8a9c0e46a 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -2028,9 +2028,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
             ((char *)pp->value)[sz - 1] = 0;
             dt_dprintk("fixed up name for %s -> %s\n", pathp,
                        (char *)pp->value);
+#ifdef CONFIG_HAS_DEVICE_TREE
             /* Generic device initialization */
             np->dev.type = DEV_DT;
             np->dev.of_node = np;
+#endif /* CONFIG_HAS_DEVICE_TREE */
         }
     }
     if ( allnextpp )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 7d1c8bc305..641f24518d 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -109,9 +109,12 @@ struct dt_device_node {
      */
     struct list_head domain_list;
 
+#ifdef CONFIG_HAS_DEVICE_TREE
     struct device dev;
+#endif /* CONFIG_HAS_DEVICE_TREE */
 };
 
+#ifdef CONFIG_HAS_DEVICE_TREE
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
 
 static inline struct dt_device_node *dev_to_dt(struct device *dev)
@@ -120,6 +123,7 @@ static inline struct dt_device_node *dev_to_dt(struct device *dev)
 
     return container_of(dev, struct dt_device_node, dev);
 }
+#endif /* CONFIG_HAS_DEVICE_TREE */
 
 #define MAX_PHANDLE_ARGS 16
 struct dt_phandle_args {
-- 
2.43.0


