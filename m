Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9C90A8E9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741968.1148681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Ei-0002UZ-Jj; Mon, 17 Jun 2024 09:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741968.1148681; Mon, 17 Jun 2024 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Ei-0002RK-G6; Mon, 17 Jun 2024 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 741968;
 Mon, 17 Jun 2024 09:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d9pI=NT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJ8Eg-0002Pn-Id
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:01:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 234e7e86-2c88-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 11:01:09 +0200 (CEST)
Received: from BN8PR15CA0029.namprd15.prod.outlook.com (2603:10b6:408:c0::42)
 by PH8PR12MB6700.namprd12.prod.outlook.com (2603:10b6:510:1cf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 09:01:04 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:c0:cafe::cf) by BN8PR15CA0029.outlook.office365.com
 (2603:10b6:408:c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 09:01:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 09:01:03 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 04:00:58 -0500
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
X-Inumbo-ID: 234e7e86-2c88-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/OItcKfDUgqlBRD20gRODIS1iIFZuRh0Q6vziAgTLz0HI4mlt39d5M02P+nRQJj8v4ndDS0Go4MmPL2wmwI6gKMFOF+n+6NDy4FpjTCAzHfLOBmfdAgZ8oPtyQI6zR2IAF8DdaRxp2Xt59wKJ3gsjARmtYcMMS4HeiVjXt4dV68bL3RoZF0v6opywgIIxhHmsiyAX9MJ01PvEWKymoUIZlDhJf69MVa9ROk+wdR5slKHHL/WU/q0CIUyr95ptlv9h/JxKZ8w8N/SzE3sTbarCHMOJQ+IX4vOKZufidsNwn5vRE+zijXQoMmnsBgW9M6KyOtVSh7jLHXfyN91MDpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHlhfR+6LFbHZD8B8gyJwfo61Uh/eaul+uFJfc005VE=;
 b=Pb5PS5IbJkTBHHY7EtLfvtYNnn0MEY1frGtttA95AOymU87g97e74p52TLjDQ1+nqnltyV5RRBQEIwRBti24QkDcGhhO7zo3zucF4cSmgYVFOMZG51bssFQ8UIwXAytiOn3yBsShIe4FqrTLB2ge1/m2diyKkAtTfP67ekoLDBBxFV6HPsAhx1CQU0BQTVqhUnlIwpDJLA4aakO4VUX5eh4mlkrTG04h3u/hmhODyFZIvU2ZY9f4ogY7d/CLtjmW+0XA9MlC454sm+++a23aQ8YJdtMvH9EKo+4rmleJZd0C23OZTNEFbqGe7mrOBFSZuTbUyinqm62T5icJmmp1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHlhfR+6LFbHZD8B8gyJwfo61Uh/eaul+uFJfc005VE=;
 b=EW8hSIoz1Ou0bFy8+jXpFmAEcuW+DTbGn933va3B1gGrWZL9VnZaKZ9mspm5x5HFytV1O26aQO8dmvV9EOfgKGMy4Q7+xqLZCeAt7N8C+D2xtKrvOCk8E3Hb5/ItHypJ7UA8xOL+QZx8PVP9zzbC/t2ydx9Ge6S1R0F+vRbZQ4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v10 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Mon, 17 Jun 2024 17:00:32 +0800
Message-ID: <20240617090035.839640-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617090035.839640-1-Jiqian.Chen@amd.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|PH8PR12MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 71057a8e-bc9d-4bdc-e12d-08dc8eac03f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|7416011|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5RhCespujpkWCvaWJ2NqD1E6z/focBXAwMAf8d5BTs8cvO/aypjG7ZEagf97?=
 =?us-ascii?Q?Xv3UM3h4U6be0hZwWhxSi8BHtEMkMVR5N7MrVWQiDcvof7SRGJybD9irbKZL?=
 =?us-ascii?Q?nDiGZJ41XXZQWqSHgeiU2m2AwAupOO8H1rsWXJo3rsm6Y7uHCkfuCa8ZF9LD?=
 =?us-ascii?Q?By1Xz4GtEESsSvOVENAikmv5/xtt2OCeC9QoVZ3rhimgApnQxsh8/N0/Z81E?=
 =?us-ascii?Q?uTn13z64OSf7jHkSYnU9d1mUGsZwtaPbUBPJVxnAEQ9hJzql5fY7c7vR1R1K?=
 =?us-ascii?Q?UbCPg/JcOYZm42NFbmkIX43ixDvMuDkwb178iKs26tnpizXLA7XI89vyVwsp?=
 =?us-ascii?Q?5Y3BQiTrfiMdlLds2PSOQhEbWeTH4PcNn/CFWQ3HBruQSRNEYXvD3fqRPL/j?=
 =?us-ascii?Q?jrrY+t4G3/o/U0c+3P2W8w/A6rB+42uNXTxL4QmTmRxGu4W7H7ZK8YMtSDpm?=
 =?us-ascii?Q?oYa9Cbr4kc3IBOQ6OJcdz6Jcz0XZ8gRK4QYcLXJW5SQiedJCd4FTNijqYo6Q?=
 =?us-ascii?Q?+ARFePPP76R0QhFSRMn9SM3NzMxM5S6G+rJGbeq0m/2/Yoa3gE8B5rfH7lBV?=
 =?us-ascii?Q?QcXRnxtxcFQOD83U0EbkIP0xajxBoNRjEJdOjQZdWaDISRX9W8uMGL6XouvM?=
 =?us-ascii?Q?E7JttXcTGLRPVa3kaEqjPWyalm0swRDxByjPF+50bOwkC7DVMdWnoOFfyU3i?=
 =?us-ascii?Q?fQx13hLDy24tDVB+47AXA1nvLqkbi3+l/cOwAWxowXFDg2wiwfbru/2tW2NR?=
 =?us-ascii?Q?sfMyqceJNorwyS0iuEWmKqw9CtKyzhra1Kdj03cV6EzjTqHp0e+XlOiMy4zR?=
 =?us-ascii?Q?H1lHIIYgMa1gwmwB4sMK/Rl9gavZxTfUfGHyipUv11OVLK6ja9pkdqqgLSeA?=
 =?us-ascii?Q?R2X6fHppaF8yVry9WEZRXejlBtruXyV2AyZMqp/e/lvmzK/OUgki9DzRzTiE?=
 =?us-ascii?Q?L5ZR5ftb5NGp/j3nK11Qpx74ctXnJfMju3jQUUzjyHqAFSGDPniYWHZiG1O7?=
 =?us-ascii?Q?sZy+pY/8oHkZBsOLXJunSfxB6c604HKhef6I7qCJQWa+OqrGuPY5gff7QSxg?=
 =?us-ascii?Q?lovg4sjBiU+apM6/tDZJ9G0uC9hNexSwx8lWHL2rk4u4LjYLDwsV9a4zsPwY?=
 =?us-ascii?Q?EhS6ImspflTvor1TSGB/YwB8FRXUKZGtWyyFj5F3Ubvn+vbfHgfk+ZrBYopQ?=
 =?us-ascii?Q?00i1w04GIoN0BsTk/kKM0xAdPWz+PgRXPinOOefRC4rt+9/vbdHrG6aTC4DL?=
 =?us-ascii?Q?bhBv7etykrVS+0fbwvCZqptWRLDPG7STVdqSp5+i065HsbPRo/apTMtrTViW?=
 =?us-ascii?Q?CnA2ovufRvmJ4jI01uJ9I39q056hX3r6PuW9rJMXSAT52zQhUNXIpuDH3OFk?=
 =?us-ascii?Q?/JlBkmVbUDD1A+VtjA2lqYBSGhEy87b+B4XklfiPYcOzR/scFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(7416011)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 09:01:03.1173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71057a8e-bc9d-4bdc-e12d-08dc8eac03f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6700

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see qemu code
xen_pt_realize->xc_physdev_map_pirq and libxl code
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
PHYSDEVOP_unmap_pirq for the failed path to unmap pirq. And
add a new check to prevent self map when subject domain has no
PIRQ flag.

So that domU with PIRQ flag can success to map pirq for
passthrough devices even dom0 has no PIRQ flag.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  6 ++++++
 xen/arch/x86/physdev.c       | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 0fab670a4871..03ada3c880bd 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -71,8 +71,14 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd )
     {
+        /*
+        * Only being permitted for management of other domains.
+        * Further restrictions are enforced in do_physdev_op.
+        */
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index d6dd622952a9..f38cc22c872e 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -323,6 +323,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !d )
             break;
 
+        /* Prevent self-map when currd has no X86_EMU_USE_PIRQ flag */
+        if ( is_hvm_domain(d) && !has_pirq(d) && d == currd )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+
         ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
 
         rcu_unlock_domain(d);
@@ -346,6 +353,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !d )
             break;
 
+        /* Prevent self-unmap when currd has no X86_EMU_USE_PIRQ flag */
+        if ( is_hvm_domain(d) && !has_pirq(d) && d == currd )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+
         ret = physdev_unmap_pirq(d, unmap.pirq);
 
         rcu_unlock_domain(d);
-- 
2.34.1


