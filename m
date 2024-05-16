Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EFB8C742C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722961.1127402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XnY-0008DR-Tu; Thu, 16 May 2024 09:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722961.1127402; Thu, 16 May 2024 09:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7XnY-0008AW-Qa; Thu, 16 May 2024 09:53:16 +0000
Received: by outflank-mailman (input) for mailman id 722961;
 Thu, 16 May 2024 09:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hz7T=MT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7XnX-0007bz-Be
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:53:15 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc561bf-136a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:53:13 +0200 (CEST)
Received: from PA7P264CA0355.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::24)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.28; Thu, 16 May 2024 09:53:09 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10a6:102:37c:cafe::34) by PA7P264CA0355.outlook.office365.com
 (2603:10a6:102:37c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 09:53:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 09:53:06 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 04:52:57 -0500
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
X-Inumbo-ID: 1bc561bf-136a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAPRRoU7/BI9Gf3JPfgkdkgwy3bwou0kOM/nRVxchVReYBxKuZV+vfQvDcf1hU5YR57akyl/Iuz1EfKuKUJs+vcw25tpa/R/SkrtU1MzkTb7baH53plRocShpxTeGOgOawy0NF+vv15woPQ7ORsh4yF7vvOXJFOmO8f1BV2yWxNQJBBPpMrQYiNL/rJZEc4QiBZ2KCmRIOfonpdIZ+W5T/bPBrchBWgwJ57VnZlvdzpIwdPfpF9E0d4uEhgk+teSjwsCgzPWNukeX3L37r0irkHmfoyQhdb+ufmLM0kRNVsURMpWI3jahbcnSnO/hetqnFeeAIRLufveghBZ7PwVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/Ec9q5A5ur4le3zKaKlsOkcz/0csbeUoraafjUCch8=;
 b=Dz20fxenNZRTWAAHnTqI8/3y4Z/wKVXKJYv4QhuxgjVF52jOUeLobwSRc4CPKn402hVzUD6Xa5DOokzeAo1hM6lTQlaMMzChgD/HPbq0CHBJmgTC9zT4t0kyC6NbkEGSC1aNKJGMcfFEZ9w6Wfg11DHK+P4Es+5s+rdGscltN2+UbOXppDaxjwJt7tlf6l6iX83Q6uYNqDPPt6tZP29PXX5f7DLborndzKwjsqj6MmP/a+Cb+vJFKfVmo7KcpNsz97A6+vp6MZkoLc6JS2XTBRZybYTLB3bk6BlFOuHckZ87toZQT/SiajJgBBzFHHIwoqZpkvSIQy1X1IJtXq6z4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/Ec9q5A5ur4le3zKaKlsOkcz/0csbeUoraafjUCch8=;
 b=yBRpxeUbTxZI4eXn66FP5RuU2ZJTRdnp5rkKbeQYlCu0e7cjh49VrEtVcgwECa/iyDrnplbr0UoUzj2QwZLzwKKPln0xu6gyyO0K5rCmL5qs1Hk50bIX/Vxqk6YMlEA97eDR82U0wC5kecXgCv9qjFisx/qUXred7NYkeB+1hOM=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Anthony
 PERARD" <anthony.perard@cloud.com>, Juergen Gross <jgross@suse.com>, "Daniel
 P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v8 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Thu, 16 May 2024 17:52:32 +0800
Message-ID: <20240516095235.64128-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516095235.64128-1-Jiqian.Chen@amd.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ecdb5b-a85e-4e4a-c7e5-08dc758dfc88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3PDSWubrASEYM7A8ism4geb92zMjOFvEBobGcGuHDpkpg7UBAUp5bzQ1Tddu?=
 =?us-ascii?Q?7hijW5JmvmARZkIPyEeKj6ujGrBg87v0D2IgUze9VKA7RXShlmzEhPLShTQ6?=
 =?us-ascii?Q?5e62LtZQPuKh3Dqzy1WDqJRxoPfWuzl2WspspxhZZtttXe6FD+Oj785Su5HE?=
 =?us-ascii?Q?cPGfATvF508MQ2XwIW1b0FModtodLh3PYQIVl8YmxQ9ZKjyt9dF1h2Ajd+hZ?=
 =?us-ascii?Q?YtElcC+1DbsXmzC6+OOyVQKpis/AfCWSOzkQ6Pu328FtxDdm0YXGuU2EO4Ma?=
 =?us-ascii?Q?F08TRlrq9Wqgpq7rH4beZsaE4bB9NPu/IZOCHakBx8L893ssUqXruRv7Ad84?=
 =?us-ascii?Q?vO+XsZTw05HbfEX2B5sh8Gla3cFqo2Gqs1JvH6731NwyUUb6rQCVKvinFGKF?=
 =?us-ascii?Q?6ggRxsXYsYcYzoqPvVLBxqT6Y7VB0b4H1ZUBlyDC61VAgRaMczX9nFiAub2Z?=
 =?us-ascii?Q?rr72kI9IlcYD7kEOJhPr5w7oVVfCJYdfK+fbzWeI3/lxAGQt3BvKTjcJr2+8?=
 =?us-ascii?Q?JkNtMC/nPh9mvCxYUE1PlMdLUe/9aekl3nuBwuVhInnHn+2IPUZpgxpejacD?=
 =?us-ascii?Q?nFtIKmeyBLxM9GbNZpUAoioHSCBrMc82ILSH+dNV83/GtVmoOq24Nz4gpLWP?=
 =?us-ascii?Q?xz3wb0BkmaKwNBpoIMycFUd61QZJmL/7OVDrxK580iCNQUpadnkGDD38nraG?=
 =?us-ascii?Q?ADwU56HmfIZK5BIub9j7b47LuHCH+XPxnvnFxz84AZr+EFGbTzdywB75JXRw?=
 =?us-ascii?Q?39proVguhmQr2NbuD05DGkprL7vyx29akRSsm/Rs6OdrIk4iD4lhgSL8guEM?=
 =?us-ascii?Q?Xcqo2CziGdkd050qppSQpFj8NuUPfS9QIiCvVaWAlR2053sJpTD0rrEuHYdr?=
 =?us-ascii?Q?c1+mRi6dSyuaGASUY0yV9LL83aK9393k5iLUFf6hAuqAo88fP/9SEKFTebiD?=
 =?us-ascii?Q?pMWjwvXUzCoewdPawkQEMtfYnOqXroZoss5pZ4NdxY776Db+Sf0B0xWCSeO4?=
 =?us-ascii?Q?cBuKr0Cl7BCeb9Mz0o/lwszBLa0IIcoH9Ezyy+SGC0Mtpxkm/BZn7D2eqylY?=
 =?us-ascii?Q?GPGdXw6wFqHGcv1Qo70KXAbYbHscdO51jdexPbJWyKk5rY9KdSadgkwrc6lO?=
 =?us-ascii?Q?xjUCHK9E2XC2p9CNPhHppnC6ZqnOLBIErv8QJ1x1rZANZRp5pPm/r7vrBFJF?=
 =?us-ascii?Q?0SMv4HI/vCbDRDgNyZz6aUDFgpvyCOILnQAe4fNOhMuuxKq/i02GIOzVmBRY?=
 =?us-ascii?Q?rVTZUfPm7yulqycTUKJVsOqq1RLY+jHSI1I4//mkrIjv4umM8mQehMDR4CJQ?=
 =?us-ascii?Q?7pMRDJii/NDsQjsc9D6HdI8P7cYZZVNgqWQ+GkxR/04sxdEPjzC2yFZTItcL?=
 =?us-ascii?Q?hUHnEpwCWMGMdxB8zAyIUHNjeiJn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 09:53:06.6803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ecdb5b-a85e-4e4a-c7e5-08dc758dfc88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see
xen_pt_realize->xc_physdev_map_pirq and
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
PHYSDEVOP_unmap_pirq for the failed path to unmap pirq. And
add a new check to prevent self map when caller has no PIRQ
flag.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  2 ++
 xen/arch/x86/physdev.c       | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 56fbb69ab201..d49fb8b548a3 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -74,6 +74,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 7efa17cf4c1e..1337f95171cd 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -305,11 +305,23 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_map_pirq: {
         physdev_map_pirq_t map;
         struct msi_info msi;
+        struct domain *d;
 
         ret = -EFAULT;
         if ( copy_from_guest(&map, arg, 1) != 0 )
             break;
 
+        d = rcu_lock_domain_by_any_id(map.domid);
+        if ( d == NULL )
+            return -ESRCH;
+        /* If caller is the same HVM guest as current, check pirq flag */
+        if ( !is_pv_domain(d) && !has_pirq(d) && map.domid == DOMID_SELF )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+        rcu_unlock_domain(d);
+
         switch ( map.type )
         {
         case MAP_PIRQ_TYPE_MSI_SEG:
@@ -343,11 +355,23 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case PHYSDEVOP_unmap_pirq: {
         struct physdev_unmap_pirq unmap;
+        struct domain *d;
 
         ret = -EFAULT;
         if ( copy_from_guest(&unmap, arg, 1) != 0 )
             break;
 
+        d = rcu_lock_domain_by_any_id(unmap.domid);
+        if ( d == NULL )
+            return -ESRCH;
+        /* If caller is the same HVM guest as current, check pirq flag */
+        if ( !is_pv_domain(d) && !has_pirq(d) && unmap.domid == DOMID_SELF )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+        rcu_unlock_domain(d);
+
         ret = physdev_unmap_pirq(unmap.domid, unmap.pirq);
         break;
     }
-- 
2.34.1


