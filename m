Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5019E7FAB
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 12:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850688.1265074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsXy-0004Ga-6e; Sat, 07 Dec 2024 11:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850688.1265074; Sat, 07 Dec 2024 11:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsXy-0004EF-3g; Sat, 07 Dec 2024 11:00:26 +0000
Received: by outflank-mailman (input) for mailman id 850688;
 Sat, 07 Dec 2024 11:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlXb=TA=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1tJsXw-0004E9-NB
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 11:00:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2417::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7464947a-b48a-11ef-a0d5-8be0dac302b0;
 Sat, 07 Dec 2024 12:00:23 +0100 (CET)
Received: from SJ0PR03CA0078.namprd03.prod.outlook.com (2603:10b6:a03:331::23)
 by LV8PR12MB9111.namprd12.prod.outlook.com (2603:10b6:408:189::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Sat, 7 Dec
 2024 11:00:17 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:a03:331:cafe::c3) by SJ0PR03CA0078.outlook.office365.com
 (2603:10b6:a03:331::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Sat, 7
 Dec 2024 11:00:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Sat, 7 Dec 2024 11:00:15 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 05:00:10 -0600
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
X-Inumbo-ID: 7464947a-b48a-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Er3g1LeEd+tDUQkY1k7rKlLf4GN/8cRHuiX3o1svnMQT53x4+jZyfivH4HcFVJMmFMGmbVBVfDJ2H210sgY9OG7EDIfgg2myOQI+CVg78p7C1EDdaaxCSzDbB7ZvUQ3E4gnVadzk8/Svsg4EQJMAU3Gasa1UYJ+ey2injg4oHHHJStJysK5cPj7O7Z5pNQHeIS69ViGJ/mSvqERP9iZ3B3VSmfUZDDqG4dWwpMs5M5goqaWxfLhsTYOcH0BaaDjJEiCX8irv2q3QEU9eL0RfC6kbgJWHkjJihc+qtH8P4DJ+eiutYBtWikwN307gON0XAN21Xl4GVkb3gL5zvfcTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijr4V8vm1YJGIO6GrqqHeyIQQ8oHc1GLvuA8nvRmTjY=;
 b=bjFUJH2jcoLL7qQB5r3Fu6w0KTG4UkOoVFLoURLRZ+PZY9bP0j5vj9tbzOaP/vhSM5ODzJHzfQCvkidFmi2oSCK6kG4mLQOILjfuN3qWIP5s/DLd47FHmkNJ6rbcddOTX01qYcAmU9pFKDxtv+6Tj4dSxIDG+hdldijtjIP5XLh1jR44vuoK6vmlU/er3OfNVXoiefFQg5lT3B5DGz0qNavsISwWlgAh035Nh/MjJW1qIngz58Q2bPwlyrZe0Gy+MWToUgc1/6UL/6qTZSqumqm2rU3k2l35aNj+zij3U28mY1YDS8VE4X4mvvndKbNgD+VG1+8rmlAjHMpRhZrNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijr4V8vm1YJGIO6GrqqHeyIQQ8oHc1GLvuA8nvRmTjY=;
 b=VlpbfAyOwDL1W22mpH+tsabVhtqy/ZSTmLTS0N6HHkAYVt0TXCYh1+6bAaoPPe5Z4o+f4RxAQ7APKIaOm4liLEeHf2gkDvPo+am2476UiFWUD7lGPlpiiIkocLpv9pwkBaFuGOEvJw+R88idmoJg6SMduvayCQGDMoe34h6EpG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Julia Zhang <julia.zhang@amd.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>, "Julia
 Zhang" <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>, Zhu Lingshan
	<Lingshan.Zhu@amd.com>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
Date: Sat, 7 Dec 2024 18:59:46 +0800
Message-ID: <20241207105946.542491-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|LV8PR12MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 29263f75-f1d5-46e0-c003-08dd16ae54cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5TbJt/kSUA6L5Q51rIhtBjQ4cWfnk4WhK3C3oZFRmvc1ZBcjAA+trd5onSIM?=
 =?us-ascii?Q?w9B1B7GLBMK674L4MYEU1knS4ptyyGeXfcZTGAjnvgYHxpPS/OL3CSblNktn?=
 =?us-ascii?Q?yPnSENmv7rUBz1C2s+RRdP+uRrOvUXQ9tI1Gy/iGOulbYEUhi473QNqdib1e?=
 =?us-ascii?Q?RhvkOKVew+A7rQw3rur4mex0uyyByJTfti69yJ5RYWn41MPLLlPWpWdWP6cR?=
 =?us-ascii?Q?jv37LT5yEFlFuxuvQVwNUeaS0oW319N1zgsNy4BofQtQ07C7UzzbJ4JbVNLm?=
 =?us-ascii?Q?BXWjmCj4GBrJYWnEjZVcD+3RtEWVvWwImf8KcLj+VdLemMIgWLs3SlEAq18I?=
 =?us-ascii?Q?jWT3gOHe4WiHPoPE+xbcjFv6Wd6UTh7+ufmAtzo+Uf/09Sj2Q2cAmXFPaThE?=
 =?us-ascii?Q?SUCQ43mgUd0AK4KKkqD6Oi0M3wH2bQLZM8WM/r3tJ/Yhf/5iuUI6FF1jhyoT?=
 =?us-ascii?Q?QXy71eeluoeFeJfrmkylWfqYyPjvMNQggNEBbPjnkH+65FkTm7pR6mpuonlR?=
 =?us-ascii?Q?LYHDtzH6gNF47qH2p7pFSM6YJgkY2E9vzmnRfVluFrkjeqFn8GcCaby5HfPe?=
 =?us-ascii?Q?+Gu4H8mGUnwJ1fZOEhk+R22GqOtysXIjEl1/yAM+5ZhGoVOdAML5dOaYYvJK?=
 =?us-ascii?Q?JveKQrt1X6w0y4Ck5lri7RAJYAQUe/slvW2KgKidHLsfFbwQi76JXjiRFcBu?=
 =?us-ascii?Q?RpFNmQpHsuu0Mxmbmw03YWhYL4qFQR7TiCwLw8kBaNhboxud3pTZo7sw+qZj?=
 =?us-ascii?Q?GsvY8xIKJC3KcQ/FNJA7TTxS8gDeoU8DwJDYUElF7goGwtPR8nnAh7Ov74Nm?=
 =?us-ascii?Q?2bJZ4QaL/U5WhveTuvBaF+fRmyDhrqqT8s9MR4J7iP7f3MIMZP9884Eseh6s?=
 =?us-ascii?Q?URyZy6v/2abxFaXw/+0c/gDUXzRh+KQS12JLA4o80TffBRnVHuHRPgTfzDXo?=
 =?us-ascii?Q?MhwRUsR+5USCp2oYVvUeeMKUrix2cxw98wUPitILzVS6K9Gejfscf4Rq9+wC?=
 =?us-ascii?Q?dUTkchFKldSx7FD5KqVDfSpl5vp5P9dFDGQASW4teMWMO+/DWDtFMSjHdWuq?=
 =?us-ascii?Q?pkBntXog6tHt2+INdz3FVmMoutQpZQinER1jms7fAV8GsE+JhzfsWtdeXhoI?=
 =?us-ascii?Q?BxxaG9mu+D7X7sOgq9GX7KpHKwXhioopjdyPl+k5CBhmwvAIxK2B82l4d0WI?=
 =?us-ascii?Q?+KONyawcLhpUEYngRjlMLm6zVnHh4VSt1+JaNB3Teb2ndOP3ApPd7+2LQjnG?=
 =?us-ascii?Q?dB+FZqmtDUvIfWPszwaWfEm/Sw7jTjNXpuxdpxiWOD5VOiw2O7dt41kT1Nh2?=
 =?us-ascii?Q?MzR4L8Gc0wMDXGVLnZKsos9ikSiKX0QpZPIYonMYKjbRwbfhD1QAMjwfmrQI?=
 =?us-ascii?Q?CGLQXcrgrmLbzz8poJ/0QEOKm7dPGjuF8vuNwRLsWOUAQWua2MysO+rZvz7X?=
 =?us-ascii?Q?ZdnSlWFRP4Xz9OlB0cjX9ev3UyUtlMNE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 11:00:15.7806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29263f75-f1d5-46e0-c003-08dd16ae54cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9111

To implement dGPU prime feature, virtgpu driver need to get
p2pdma_distance of two GPU from host side.

This adds a new privcmd ioctl to get the real p2pdma_distance of two pci
devices in the host with pci notations sent from guest side.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 tools/include/xen-sys/Linux/privcmd.h | 12 ++++++++++++
 tools/include/xenctrl.h               | 17 +++++++++++++++++
 tools/libs/ctrl/xc_freebsd.c          | 11 +++++++++++
 tools/libs/ctrl/xc_linux.c            | 24 ++++++++++++++++++++++++
 tools/libs/ctrl/xc_minios.c           | 11 +++++++++++
 tools/libs/ctrl/xc_netbsd.c           | 11 +++++++++++
 tools/libs/ctrl/xc_physdev.c          | 12 ++++++++++++
 tools/libs/ctrl/xc_solaris.c          | 11 +++++++++++
 8 files changed, 109 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index 5071ebcc8b..fbdc9aa927 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -110,6 +110,16 @@ typedef struct privcmd_map_hva_to_gpfns {
 	int add_mapping;
 } privcmd_map_hva_to_gpfns_t;
 
+typedef struct privcmd_p2pdma_distance {
+	__u32 provider_bus;
+	__u32 provider_slot;
+	__u32 provider_func;
+	__u32 client_bus;
+	__u32 client_slot;
+	__u32 client_func;
+	__u32 distance;
+} privcmd_p2pdma_distance_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -131,6 +141,8 @@ typedef struct privcmd_map_hva_to_gpfns {
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
 #define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
 	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
+#define IOCTL_PRIVCMD_P2PDMA_DISTANCE                          \
+	_IOC(_IOC_NONE, 'P', 11, sizeof(privcmd_p2pdma_distance_t))
 #define IOCTL_PRIVCMD_MAP_HVA_TO_GPFNS                         \
 	_IOC(_IOC_NONE, 'P', 13, sizeof(privcmd_map_hva_to_gpfns_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 29617585c5..42d15a22b8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1654,6 +1654,23 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
 
 int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf);
 
+int xc_physdev_p2pdma_distance(xc_interface *xch,
+                               uint32_t bus,
+                               uint32_t slot,
+                               uint32_t func,
+                               uint32_t c_bus,
+                               uint32_t c_slot,
+                               uint32_t c_func);
+
+int xc_pcidev_p2pdma_distance(xc_interface *xch,
+                              uint32_t bus,
+                              uint32_t slot,
+                              uint32_t func,
+                              uint32_t c_bus,
+                              uint32_t c_slot,
+                              uint32_t c_func);
+
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/ctrl/xc_freebsd.c b/tools/libs/ctrl/xc_freebsd.c
index 9019fc6633..4e0df06b7c 100644
--- a/tools/libs/ctrl/xc_freebsd.c
+++ b/tools/libs/ctrl/xc_freebsd.c
@@ -60,6 +60,17 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_p2pdma_distance(xc_interface *xch,
+                              uint32_t bus,
+                              uint32_t slot,
+                              uint32_t func,
+                              uint32_t c_bus,
+                              uint32_t c_slot,
+                              uint32_t c_func)
+{
+    return -1;
+}
+
 int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
 {
     errno = ENOSYS;
diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
index 92591e49a1..9aeff2328f 100644
--- a/tools/libs/ctrl/xc_linux.c
+++ b/tools/libs/ctrl/xc_linux.c
@@ -66,6 +66,30 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_p2pdma_distance(xc_interface *xch,
+                              uint32_t bus,
+                              uint32_t slot,
+                              uint32_t func,
+                              uint32_t c_bus,
+                              uint32_t c_slot,
+                              uint32_t c_func)
+{
+    privcmd_p2pdma_distance_t p2pdma_distance = {
+        .provider_bus = bus,
+        .provider_slot = slot,
+        .provider_func = func,
+        .client_bus = c_bus,
+        .client_slot = c_slot,
+        .client_func = c_func,
+        .distance = -1,
+    };
+    if (!ioctl(xencall_fd(xch->xcall), IOCTL_PRIVCMD_P2PDMA_DISTANCE, &p2pdma_distance)) {
+	return p2pdma_distance.distance;
+    }
+
+    return -1;
+}
+
 int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
 {
     int ret;
diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
index 462af827b3..4698cca5ea 100644
--- a/tools/libs/ctrl/xc_minios.c
+++ b/tools/libs/ctrl/xc_minios.c
@@ -47,6 +47,17 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int  xc_pcidev_p2pdma_distance(xc_interface *xch,
+                               uint32_t bus,
+                               uint32_t slot,
+                               uint32_t func,
+                               uint32_t c_bus,
+                               uint32_t c_slot,
+                               uint32_t c_func)
+{
+    return -1;
+}
+
 int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
 {
     errno = ENOSYS;
diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
index 1318d4d906..7e0ee8417e 100644
--- a/tools/libs/ctrl/xc_netbsd.c
+++ b/tools/libs/ctrl/xc_netbsd.c
@@ -63,6 +63,17 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return valloc(size);
 }
 
+int xc_pcidev_p2pdma_distance(xc_interface *xch,
+                              uint32_t bus,
+                              uint32_t slot,
+                              uint32_t func,
+                              uint32_t c_bus,
+                              uint32_t c_slot,
+                              uint32_t c_func)
+{
+    return -1;
+}
+
 int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
 {
     errno = ENOSYS;
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 25e686d7b3..4ee8f39e09 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -138,3 +138,15 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
     return rc;
 }
 
+int xc_physdev_p2pdma_distance(xc_interface *xch,
+                               uint32_t bus,
+                               uint32_t slot,
+                               uint32_t func,
+                               uint32_t c_bus,
+                               uint32_t c_slot,
+                               uint32_t c_func)
+{
+    return xc_pcidev_p2pdma_distance(xch, bus, slot, func,
+                                     c_bus, c_slot, c_func);
+}
+
diff --git a/tools/libs/ctrl/xc_solaris.c b/tools/libs/ctrl/xc_solaris.c
index 049e28d55c..a054b40b31 100644
--- a/tools/libs/ctrl/xc_solaris.c
+++ b/tools/libs/ctrl/xc_solaris.c
@@ -32,6 +32,17 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int xc_pcidev_p2pdma_distance(xc_interface *xch,
+                              uint32_t bus,
+                              uint32_t slot,
+                              uint32_t func,
+                              uint32_t c_bus,
+                              uint32_t c_slot,
+                              uint32_t c_func)
+{
+    return -1;
+}
+
 int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
 {
     errno = ENOSYS;
-- 
2.34.1


