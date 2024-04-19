Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E38AA784
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 05:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708682.1107735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKc-0002Jo-NI; Fri, 19 Apr 2024 03:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708682.1107735; Fri, 19 Apr 2024 03:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKc-0002HD-J9; Fri, 19 Apr 2024 03:54:34 +0000
Received: by outflank-mailman (input) for mailman id 708682;
 Fri, 19 Apr 2024 03:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxfKa-0001xW-PW
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 03:54:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86fada77-fe00-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 05:54:32 +0200 (CEST)
Received: from CH5P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::19)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Fri, 19 Apr
 2024 03:54:29 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::1d) by CH5P223CA0003.outlook.office365.com
 (2603:10b6:610:1f3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 03:54:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 03:54:28 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 22:54:24 -0500
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
X-Inumbo-ID: 86fada77-fe00-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj+AfPkUWWBncosJbyimhuLLuK/Pfztvz6j79HwaLgG9OCoqZ19MQySQNhXUyu3DPgU2BPswKgW+svPv1iC9GkhNiE76mW+XEKi1jmG0mTvi4SKz/7EBXiYNRCKV7IjsYgCceLU+nuLghlTOl/7YJWDafF1mL6H59RD2w+oZAv5d0lgOyOFwUqWyWCQTzKc7pKg0+Yw/NuH78rx5IIAM9ODUBaj0aBSnu6p4sL0u+QMSKvAuh77i5X4EX0aRc8/S+tyILKg8oir7IV5NPMyuY30+bY8jfBDmM53falS+ligKAWdU+ZeiE2KK4RJLrDOe0clj5l9prCHM0dytUgkmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWMKhG5lVTeKf+NSXNTQ2LT4bcOahI5fL1ibq4Lk0AQ=;
 b=edTiBj/Lvit3XD6tOxLu288Do9uY6sq10PosakILlmswGkE2UEQv1Bjytqnbz7H4NCkEpQKME80dAXaizQrE0J+txvjkYBBMjGAgXgE8aq1DCYj2HB/8D3wqv+4fAcQ1JHXGeV7UZejd7pjIMRvsx21HNS3WkUqIEknhT7myjKW2DKb4LfinGbBqnVhGn8EYbmOq6OOf6toMHpvCcz4sqSdsPlzX6XtZR3DbqnaO8N/CWBvjT84Uya57ZoQ/3z0bFYERwnjomybZYVtwWMBnntYofr/pwPDkilwW8wQ/gE4L7SK+9jJbD3AY/GQ6QiuTfmYa9U4jjlvgLb7AewuOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWMKhG5lVTeKf+NSXNTQ2LT4bcOahI5fL1ibq4Lk0AQ=;
 b=Wf+LitCf2Fy48R9gVxkIH4/CgYrOss9EidCXgm2bouXjr0Qv6Maa7NmNU4UYQA5lHGls3vMLY6EnuAJAnL75r2wyAB1LrPlau5Ci/FQarGXLrtXs1N6MHnYfzTAgfYaEvNiWtA0yoI5Ajm1nahMJaWMF8kcLvdx9slXUdY/6Nbg=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v7 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Fri, 19 Apr 2024 11:53:37 +0800
Message-ID: <20240419035340.608833-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419035340.608833-1-Jiqian.Chen@amd.com>
References: <20240419035340.608833-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 44055d54-b656-42a9-3868-08dc6024696d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZUuJruOBAT3DzK9xSG9b0d6lyFL/wV6b5/tLZfHez7v3RCfu4bhv9JYGg7ba?=
 =?us-ascii?Q?crggzs5E+XlIlI7RTP0XyNSdtS/jMvRhIbc8Ht//yJg/Re7v3BQjMqqDBxg+?=
 =?us-ascii?Q?NyFNMcrD7wzBB2FLxmNODnQabyEVZm6/6khM22t7MccXOEK5Qq8qtGW8zj37?=
 =?us-ascii?Q?k3tDzkbP9n38ZOmuYvbhtMCQgklx1rTmi5f33B7mfTZL8bLsNrdKHMkxgalK?=
 =?us-ascii?Q?28YJiZt4ewurzG6t0BAkouVUsdY0BiS9HnHbNsUcCrCJ249fCPCfg0nUgrLp?=
 =?us-ascii?Q?usRLqRP0o86OaSK3e6wgBkzGQaesv5PnaRrquMALOs/VsjNod5WUbr8HQMv0?=
 =?us-ascii?Q?hfuHuoWL6Cz/YnIxaoF24tS3XkxjiAsuessMb96bJSHpCz1DQ7ac/8unzzGO?=
 =?us-ascii?Q?7ep+Xb3bz+nw4XfrirNPhDG+fMUxNV4KjGMx+OaCpJVr06HLx/M03hxZ9Qyt?=
 =?us-ascii?Q?eSiV4izBd/zhoFfVZuxC7cJS6CBtyPSwtMdIHWdRomRdirPNJgQShd38q6hK?=
 =?us-ascii?Q?uW2rR5dx9wdiOvB6NCRoXGNrrhBMVJH5vBRQjbiNQkFWoZ0giuN1bs1KTyHh?=
 =?us-ascii?Q?LkwAI0lgBueDl/UPjnFfSYF9kgjloNSlp7ZRvmyKf2ZW371UCXXWCB3Yu5Uy?=
 =?us-ascii?Q?Q1P0Qz1VUGp+zoR6bv0yA+PUzN3tLf37Ue2oBzhDJ+9w6FzS2dyXkpS+A1/t?=
 =?us-ascii?Q?KMVOBJ66BFgrTZecchDmCOS8xx0+na6IIaSysS6QvE3B+dN4G5cSbtYDihQF?=
 =?us-ascii?Q?XxhWOk+Imc/12NB+K54CTNSMkZ8Mc+fNMzDHx5f3nVXIwqlBfqtOvk08AqXr?=
 =?us-ascii?Q?8Rgjnbj2DWXi0xJfmKkAv+6DT+EZLIT371qEOKYzNFGfo39dFCd5mmY/PK8Z?=
 =?us-ascii?Q?XjJQrPw+K5fFDIVhLnBVOVhMrKS8LEphoefHQIlLg6Wu622l491OFpPiq8tt?=
 =?us-ascii?Q?hhUueU8Fo43xzqU/inrJF7IAATFXtCqIJ7tOHC/iukl6g4QyIsggIkpzTGj/?=
 =?us-ascii?Q?AW9KwJDg1ZV/WgZILWFsafFWlJLUKTjcZal57yBUOJsMNKJrcvYitq7bHemr?=
 =?us-ascii?Q?haRhfTxMzDN30U0sx81NFWs6npJ9Lsrkn1sePGSS5m1sSt3fzuTP8PVpzURI?=
 =?us-ascii?Q?aMsR7cKa8gDemWmq9otOpSY/4PELLeU1CT2vKmreC4mrBhs6DAeqMmLa5P+B?=
 =?us-ascii?Q?CZZI0uXIO1MYT7gSPnatYdPH4C9fIenfT1BCC2/EX04RWVt6VJ2bYIKISF+4?=
 =?us-ascii?Q?H4x9TtiQtbMzRjccB/cb7/NBxZpph/L+ulQ21BK6Bh1aW29WGwcWOVINdxsx?=
 =?us-ascii?Q?aQHNRm6qX/VHljOq/A493EzG2D1iEFwQOexasjMMUzEtVWffcb5Ja9+h4ojQ?=
 =?us-ascii?Q?QpDP5tI/v+DTsSi9xab2pq541sGr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 03:54:28.2997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44055d54-b656-42a9-3868-08dc6024696d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797

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
index 7efa17cf4c1e..1367abc61e54 100644
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
+        /* If it is an HVM guest, check if it has PIRQs */
+        if ( !is_pv_domain(d) && !has_pirq(d) )
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
+        /* If it is an HVM guest, check if it has PIRQs */
+        if ( !is_pv_domain(d) && !has_pirq(d) )
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


