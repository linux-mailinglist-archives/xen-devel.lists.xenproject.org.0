Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EA5BD28EE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141992.1476219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlU-0003z9-Gg; Mon, 13 Oct 2025 10:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141992.1476219; Mon, 13 Oct 2025 10:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlU-0003uX-7E; Mon, 13 Oct 2025 10:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1141992;
 Mon, 13 Oct 2025 10:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcI-0004Rd-Bm
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:22 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd058701-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:20 +0200 (CEST)
Received: from BN9PR03CA0497.namprd03.prod.outlook.com (2603:10b6:408:130::22)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:15 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::59) by BN9PR03CA0497.outlook.office365.com
 (2603:10b6:408:130::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:17:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:12 -0700
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
X-Inumbo-ID: cd058701-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZQe3SLaQG7OaY6T70B+v0+5YAKkChcwfCp7j4IUKFiqw1EGeSztyboKXGKMaCQxTwFSnfMrkn9YBEIfaP8VxUnbnz9QNYKIcKFNxWhrPNt04cICAD5NmCK+Iehf2z1rmf99y9V01Hst1W798GLcHaLGDuEY8oCbVzyow+2keiE1LW9itARtf9oO8AYXc06SB5TZ6hLP+Y7Qs+tBM/iqaHIQ9ost2Htqag1sIiEuLeMU7MggZ18CkOQ98AqpfSJqaQpVyemhNUqegO7VrDxPm/bCJc6XFZ/+HOW6QX7SMiLTfHoaexO2WvsXP/dVb1TWAAOUfktFDcAbrLBBcs3BAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUzeX3m860DkQZELNQP1jPIoGOmjnl/TlRkAt13jUvE=;
 b=TxSyslhUD46GZCsnNvVTI2hD7guLrUwWol1O5yAQxPC89ROyfsnOfj8vx5sTFenutjcrW6lK4CFctZ3+SeipC+Pe3UiJ9No+NDiOlR9Tmi4DPBshz5lYS6mNyDjnTIqfbhuPKHaM1KK6Zt903MifeQ783V3tkZtGYyCFG4vcbq4TQOZjhtWKKnZ7PoMBrM1TPdqN62GD80muE55I8tNXEUpRhlnBoM/EKCwVTj4OT6vGjoL/0e3cJYYZK4iAk9xzx6Tb0OMPPQSh70SZtmejnj4mzOw2C26UsHKgdZy6PjEIw8rraXjUZkqotFnpVr/I/JyWVUenfrDe+yBTl1g5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUzeX3m860DkQZELNQP1jPIoGOmjnl/TlRkAt13jUvE=;
 b=WyOzJ3PE5hf9twomtVUhMU29tw1dn7cGIfB+XMXiKvXKLVJDJiQiChLJHOKPSzFG4qr5q1i/mAcPQGclp9MspgX2v32eS66SD367HLANKJGxeYCy3m3u4JvaKhulXsP2vlhU0hyJYoTYARf/klS6IrYLqP2rJCZWxOJXuuN0eak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 16/28] xen/domctl: wrap domain_set_node_affinity() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:28 +0800
Message-ID: <20251013101540.3502842-17-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 739cd843-ed09-4ca9-400d-08de0a41aed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SPmNtJVEo5BGCNI5M8+6zrlC97ZUDxpZ2FaP4DQPcjc9riK90nMwR+q7vxvW?=
 =?us-ascii?Q?uiJCfo6WWXLZlbDRqKRNP28ojNAO/IId7gZUcZzzs+YTw6/PhJJ5FHboO980?=
 =?us-ascii?Q?xs5nOVmbCtcYy98mPduGyBlLXfKMDW3NJUKJuoM7z4p+eCJb/yUALh8Jumxx?=
 =?us-ascii?Q?nGakxaqFfcddGz6hbzx9/O7Znu04XvShwc3ubGcsjrIr9QWQ1sP5lyGVaikP?=
 =?us-ascii?Q?SeZZIunAES6efKxAa8LdiLxrKmVf4QV42UzRxS7Uk3NscY7oOkJ8xoE+Jsgi?=
 =?us-ascii?Q?F5To80PnXePaRJr/0O6JQ4plpeiyRlUfP0MzDFGSyUYyC+KJTHlEq+P51PS0?=
 =?us-ascii?Q?DksZgcNPCJxS08bfqT5j9Dh8c9CTKvf1FsSD/qNbAS+rKProCh7nkyno3N/M?=
 =?us-ascii?Q?C2MHWGBj1VHBJJU7amJx04qnCz/XJSUbUdk2s6gYqcqvHDRv7P7wl0j6lRtI?=
 =?us-ascii?Q?EXx2cduWwGAk97iR5ToFPrtoEVNWSMsjwb39yq+MGJAehEHwesApwRsbIL0t?=
 =?us-ascii?Q?YL92zvl+lynEjvH4eZ115Cy5dJzrdVLh18Fm8NTCY7iDZREm2uS7Sk8CzK+y?=
 =?us-ascii?Q?g6p5d77YOAzDnW9Kyn0K43V6ybWGBojoaOau7U5MTU75SMLDiV8+5e4xoxFf?=
 =?us-ascii?Q?MhQluH2xWot0Uu2PBtvD7///CHPm3+2ZpRnZtQQgvgAHIlk/7SD7gtviL/sx?=
 =?us-ascii?Q?lkr3pFVQ963XPhAKsM4G9rdoF8JDExrB87FmXtz5nR320XvfRanrZ7DXIwOY?=
 =?us-ascii?Q?97McZfUSxhJqUA4GXRrbIkhbkIVeE/eYT9Jv/x2SXztNbhQq/YEY9+jNgkPy?=
 =?us-ascii?Q?AI52DfZAXUUeoN3zNAPFkD6Qpwb5kD6ZFXi2bGMv5kREA6aWeDLNN5bvkCxW?=
 =?us-ascii?Q?Y0K/eufQUAIE+2jmtnc84fb3S8ULPjEKPgaDF9U0qOc0ntTWonIz4L7EYAPA?=
 =?us-ascii?Q?jgOH/UFvIIXH36QlfC8YrmAixFxSy8KN/2PwNv4vJIh0qCMVJzfGAcGE4bDp?=
 =?us-ascii?Q?lLKCm8gpOLmI8KK3H1RtlxA+bKRoAbFNv2BlUA539MO6S0SzZnNc7Wy5Ypr1?=
 =?us-ascii?Q?CjRFoHMv4cRhlgTO6RrmlUxpk5S/8Ik0E0xH/+Pgm69gmerXauuYsp2BoiWG?=
 =?us-ascii?Q?RkCdrL7pnh5s+SR2J1lSyCyshjdKJWnyt2x152tp+ZDx1P0rGpHzV81q4kow?=
 =?us-ascii?Q?1dURCPwf0q7GNQ9SPYwlsjUYBdt/srYo64M7F8FRMba/SiA584FtVWBL7lrf?=
 =?us-ascii?Q?lcxlXrEFck5o6SudXI40rcYxKttl6ZhcR80llUBsFXtJxCVvzA7QtCve10eo?=
 =?us-ascii?Q?xcqpb84Qa+fRPyZHai1bX+K7gnnEzHT/SOC1SgOlO/7RNxmtceGjYQnQy7O4?=
 =?us-ascii?Q?/UKvWyB0d7trXzfZpS9m2LKAZRjwkfAXyvbmDpdfOhi3r15EQPdZyX0VAkdj?=
 =?us-ascii?Q?bUkvf1P2Y3oq7IG586CGKJKopLFWrY02LRZ2WNkYxaGyUgcMi6JOKWmuj/Rt?=
 =?us-ascii?Q?GbFiUKgezX3Au8WuV8AkTLBH8QvZ62kvhvq6tXwcUSnsDssPJq09+3/+Mn+N?=
 =?us-ascii?Q?HMlzkuQOf/O5H7CuBEs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:15.5131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 739cd843-ed09-4ca9-400d-08de0a41aed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030

Function domain_set_node_affinity() is responsible for
XEN_DOMCTL_setnodeaffinity domctl-op, and shall be wrapped with
CONFIG_MGMT_HYPERCALLS. Otherwise it will become unreachable codes when
MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_setnodeaffinity-case and xenctl_bitmap_to_nodemask()
transiently
---
v2 -> v3:
- address "violating Misra rule 2.1" in commit message
- remove transient wrapping around XEN_DOMCTL_setnodeaffinity-case
---
 xen/common/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5d81ab3045..6778dc388c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1105,6 +1105,7 @@ void __init setup_system_domains(void)
 #endif
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity)
 {
     /* Being disjoint with the system is just wrong. */
@@ -1133,6 +1134,7 @@ out:
 
     return 0;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* rcu_read_lock(&domlist_read_lock) must be held. */
 static struct domain *domid_to_domain(domid_t dom)
-- 
2.34.1


