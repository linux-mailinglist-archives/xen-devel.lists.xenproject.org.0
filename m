Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0B90A8EA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741974.1148700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Er-00039M-6M; Mon, 17 Jun 2024 09:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741974.1148700; Mon, 17 Jun 2024 09:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Er-00036w-2q; Mon, 17 Jun 2024 09:01:21 +0000
Received: by outflank-mailman (input) for mailman id 741974;
 Mon, 17 Jun 2024 09:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d9pI=NT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJ8Ep-0001sw-AX
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:01:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2774648a-2c88-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 11:01:17 +0200 (CEST)
Received: from BN8PR15CA0035.namprd15.prod.outlook.com (2603:10b6:408:c0::48)
 by PH7PR12MB9151.namprd12.prod.outlook.com (2603:10b6:510:2e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.23; Mon, 17 Jun
 2024 09:01:11 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:c0:cafe::d8) by BN8PR15CA0035.outlook.office365.com
 (2603:10b6:408:c0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Mon, 17 Jun 2024 09:01:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 09:01:10 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 04:01:06 -0500
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
X-Inumbo-ID: 2774648a-2c88-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbDf4dbs+m8vUYVmDh/8Q4rhbo2G30UwUNNWeW7jCcrmY0XdDIhi4w42YXyEmkfZNxTy/PbnDbNODM1+TiT+75ac5Tyfgx0YogqDcOXPQfHmPKBST+1001mrx5P/ICNc5oMALuw1XlH5VJtenWcUIMZsuyIH/1cVnnqta4ak/GtdCqJClNc8SlOVFNKvgPBc2l86YrRKrjzavFYLSaRbNNJZLn7vcr9WcDTNTp+wXYHCzPE7Qz1RB21AijXl3lcwAjF2JgcR1doW3UhNGFWhrkbeVucvweP/EC/qG5if3mTmCEmBO34KQWKKWoBsUuRO2oKbZbRLZssMoLxi76cl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8s3U4eyGcJsdb4tSa9ckkziPh9Oq4xAV7y+FvlnDtE=;
 b=ZICHO0KcrhZJQxPjDVcEMXya01HEcPnp0xQyaCpveFdsm2Ulo7EoQOiqW/BBnBt32umGHU5ES6sTzu4wX7sXkCbcvM2n18rYWObd/LfNnJAAr5IBRiRfnESeCtNNa8PpeK5wdzRrqsiCL2gXaC3QM7EAdjV3jDsXO1DmdLaN0hYX52G3JIrQgw7p+BmyJmtsxLG+iDICLyN10ZaEG44Rt7eU8lSAiKIA+NPaaZ+17H78Eeb+wau3l5J0tDGhXceNK0TaQwJ/oU5lCIzsAErO/mY8WezxE5zK11OeSyaFHfmrnRmOeQNXpkAySLOFvhGzBamhTPt04Ny13rGUgm3CIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8s3U4eyGcJsdb4tSa9ckkziPh9Oq4xAV7y+FvlnDtE=;
 b=jwj5bqeiTXDKukKhCTw+be+IJj15hOH513xBgzOS2FgFRlunNVsCnzjt4LdBLhP+ZU6jWJQ025j1Aiwukhq/VWo7wCU9EoCrGv1/qPBuAZYd0BTWi9WZYvXlICvYIVhI5QzI9AdgfBhOOI7FkuT5zPyuvgGKi76/vwiT/y1eIkA=
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
Subject: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
Date: Mon, 17 Jun 2024 17:00:34 +0800
Message-ID: <20240617090035.839640-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|PH7PR12MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec7969c-ea83-48c8-e2fe-08dc8eac08aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|7416011|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OmEa7K1oE+a0C8ZBPzcMAzGV2n54AbTgYjjgSV69MV5FScvnebwT44K3bBug?=
 =?us-ascii?Q?qKSGeVx/+ZqxIKfSCTFSv4f5l8a2su+XB9E7tGp2apWlMMTmgsWCBOuHVR3V?=
 =?us-ascii?Q?tXl2phSLJmABf6PCnZQCthWwzoPyllhlxYGshEQ5qN6J6BSOu6ATLvHyi1dj?=
 =?us-ascii?Q?Au+DuNXNfJ/5IyXuCjYVn+R/KjbW5v4V1GrfjE4Dmm0ygMz3KQMcwz8NT419?=
 =?us-ascii?Q?w4HLTJTwabsKpSsfQuG83BBJCe7m3AxwwnnacxHqdDQLJKmBP9CgGNxGZYEV?=
 =?us-ascii?Q?RpokbQE/uByXpLMn93am0nqYEq1T9Rea4Wq3pbH4LD8QG328cDTTnq6Yzpp9?=
 =?us-ascii?Q?+nUSAP9ayGxqK8aC/FXSRIaAW5WlPi/rvRauQdbrt3V1+xbRSAuGTN33emt8?=
 =?us-ascii?Q?Hr64xFbqFZ87uAXg05Ve6BUfOk39uexKwZ7pITKHoTynDcqquffA2Ven6jxY?=
 =?us-ascii?Q?rMg/1UwWyldvkw6JcbDmTH0qW6rdTqDUFHHdi7ROYq5ZBOdBRrz8sSlJxuU/?=
 =?us-ascii?Q?7v8akwX30hbxoVMD1Ty4CSmQ1GO+flrmnLQlqhr83dGwLXmZvXd2CNie58aF?=
 =?us-ascii?Q?vppQ54YGFjsNuKqFv4IB6ImOqrFcEN0E6UBYuiQ++E7oyEo3pBk49Cu52KtE?=
 =?us-ascii?Q?ciNVz3BMAMJN3DcxdOA0j0MV8WSu3eEp3CjShb4OUw+TAnUVoQmL02YoXfKF?=
 =?us-ascii?Q?Rosq9ARWYMk3RB8O/zROlmr1qN4NTiZqZtclHv3/Tn7/aQqQmWRruu0Ummzc?=
 =?us-ascii?Q?rGg+FsHXf7Uq6VyfiBDW1ffN5/RRoVRQ8AzFBxQD1ljUhu3NczKdPcn8kIrx?=
 =?us-ascii?Q?CdT5bx6fhpJ+ecusVTQ+bFthxmgOi0vA9T3OjXTLU2y2LjPp+Cksx2BbAzuA?=
 =?us-ascii?Q?et2vbLvnz9Xb+Eh9kM/jYwttetZJXUeAbMPypK1e7EsYide0o8+SUZsgQ5YS?=
 =?us-ascii?Q?I/RNKoz8cB8IxhcIPtBrtzoh7q8rSD1CXjzTsurg492iPpi8eZf7vhyeT7UU?=
 =?us-ascii?Q?UVqTV0ZEDTmcrzqeezyjs0UPCMkW49jB6ztOid1nmLo4H6OuEbkC/pY+dP4S?=
 =?us-ascii?Q?X1d5xTb/5JYix/brtYwqBBfcyjYSBW9BRWU0Qw5+4Ou5QKIbHez4H4yKTpqH?=
 =?us-ascii?Q?kotURZIH2Wsfqe42I+ch0iJ7l9NQQlC9zwOVmPdKVWq6Pu9RaOF4ntS4zEVZ?=
 =?us-ascii?Q?6bu9KM+gSTb7ReAsxTYx8z+lX48p/lMo3UGYsn5TOlIrLH1STagV5mkDObb2?=
 =?us-ascii?Q?LrILnus2fAAFUdDQ5bCvPr4wLPK4bHpYr0FwR0VIDkSYXIooyMBKMB6YVMah?=
 =?us-ascii?Q?qsDB5BgWNWHdbV3eK6EtZiYPR6V7ApfqPO86AkmUB4CIAdWW2ZAaEmfYnaQ0?=
 =?us-ascii?Q?qvAQMRZtVpVQulSGXOPBhQFozruXlmTh7r6UVs/1Ikijryjm0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(7416011)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 09:01:10.9922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec7969c-ea83-48c8-e2fe-08dc8eac08aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9151

In PVH dom0, it uses the linux local interrupt mechanism,
when it allocs irq for a gsi, it is dynamic, and follow
the principle of applying first, distributing first. And
irq number is alloced from small to large, but the applying
gsi number is not, may gsi 38 comes before gsi 28, that
causes the irq number is not equal with the gsi number.
And when passthrough a device, QEMU will use its gsi number
to do pirq mapping, see xen_pt_realize->xc_physdev_map_pirq,
but the gsi number is got from file
/sys/bus/pci/devices/<sbdf>/irq, so it will fail when mapping.
And in current codes, there is no method to get gsi for
userspace.

For above purpose, add new function to get gsi. And call this
function before xc_physdev_(un)map_pirq

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
---
RFC: it needs review and needs to wait for the corresponding third patch on linux kernel side to be merged.
---
 tools/include/xen-sys/Linux/privcmd.h |  7 +++++
 tools/include/xencall.h               |  2 ++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/call/core.c                |  5 ++++
 tools/libs/call/libxencall.map        |  2 ++
 tools/libs/call/linux.c               | 15 +++++++++++
 tools/libs/call/private.h             |  9 +++++++
 tools/libs/ctrl/xc_physdev.c          |  4 +++
 tools/libs/light/Makefile             |  2 +-
 tools/libs/light/libxl_pci.c          | 38 +++++++++++++++++++++++++++
 10 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55eb..977f1a058797 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_gsi_from_dev {
+	__u32 sbdf;
+	int gsi;
+} privcmd_gsi_from_dev_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_GSI_FROM_DEV				\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_gsi_from_dev_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xencall.h b/tools/include/xencall.h
index fc95ed0fe58e..750aab070323 100644
--- a/tools/include/xencall.h
+++ b/tools/include/xencall.h
@@ -113,6 +113,8 @@ int xencall5(xencall_handle *xcall, unsigned int op,
              uint64_t arg1, uint64_t arg2, uint64_t arg3,
              uint64_t arg4, uint64_t arg5);
 
+int xen_oscall_gsi_from_dev(xencall_handle *xcall, unsigned int sbdf);
+
 /* Variant(s) of the above, as needed, returning "long" instead of "int". */
 long xencall2L(xencall_handle *xcall, unsigned int op,
                uint64_t arg1, uint64_t arg2);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9ceca0cffc2f..a0381f74d24b 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1641,6 +1641,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_physdev_gsi_from_dev(xc_interface *xch, uint32_t sbdf);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
index 02c4f8e1aefa..6dae50c9a6ba 100644
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -173,6 +173,11 @@ int xencall5(xencall_handle *xcall, unsigned int op,
     return osdep_hypercall(xcall, &call);
 }
 
+int xen_oscall_gsi_from_dev(xencall_handle *xcall, unsigned int sbdf)
+{
+    return osdep_oscall(xcall, sbdf);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/call/libxencall.map b/tools/libs/call/libxencall.map
index d18a3174e9dc..b92a0b5dc12c 100644
--- a/tools/libs/call/libxencall.map
+++ b/tools/libs/call/libxencall.map
@@ -10,6 +10,8 @@ VERS_1.0 {
 		xencall4;
 		xencall5;
 
+		xen_oscall_gsi_from_dev;
+
 		xencall_alloc_buffer;
 		xencall_free_buffer;
 		xencall_alloc_buffer_pages;
diff --git a/tools/libs/call/linux.c b/tools/libs/call/linux.c
index 6d588e6bea8f..92c740e176f2 100644
--- a/tools/libs/call/linux.c
+++ b/tools/libs/call/linux.c
@@ -85,6 +85,21 @@ long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
     return ioctl(xcall->fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
 }
 
+int osdep_oscall(xencall_handle *xcall, unsigned int sbdf)
+{
+    privcmd_gsi_from_dev_t dev_gsi = {
+        .sbdf = sbdf,
+        .gsi = -1,
+    };
+
+    if (ioctl(xcall->fd, IOCTL_PRIVCMD_GSI_FROM_DEV, &dev_gsi)) {
+        PERROR("failed to get gsi from dev");
+        return -1;
+    }
+
+    return dev_gsi.gsi;
+}
+
 static void *alloc_pages_bufdev(xencall_handle *xcall, size_t npages)
 {
     void *p;
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 9c3aa432efe2..cd6eb5a3e66f 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -57,6 +57,15 @@ int osdep_xencall_close(xencall_handle *xcall);
 
 long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall);
 
+#if defined(__linux__)
+int osdep_oscall(xencall_handle *xcall, unsigned int sbdf);
+#else
+static inline int osdep_oscall(xencall_handle *xcall, unsigned int sbdf)
+{
+    return -1;
+}
+#endif
+
 void *osdep_alloc_pages(xencall_handle *xcall, size_t nr_pages);
 void osdep_free_pages(xencall_handle *xcall, void *p, size_t nr_pages);
 
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779ce8..c1458f3a38b5 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -111,3 +111,7 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
     return rc;
 }
 
+int xc_physdev_gsi_from_dev(xc_interface *xch, uint32_t sbdf)
+{
+    return xen_oscall_gsi_from_dev(xch->xcall, sbdf);
+}
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 37e4d1670986..6b616d5ee9b6 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -40,7 +40,7 @@ OBJS-$(CONFIG_X86) += $(ACPI_OBJS)
 
 CFLAGS += -Wno-format-zero-length -Wmissing-declarations -Wformat-nonliteral
 
-CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ
+CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ -DCONFIG_X86
 
 OBJS-$(CONFIG_X86) += libxl_cpuid.o
 OBJS-$(CONFIG_X86) += libxl_x86.o
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..376f91759ac6 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1406,6 +1406,12 @@ static bool pci_supp_legacy_irq(void)
 #endif
 }
 
+#define PCI_DEVID(bus, devfn)\
+            ((((uint16_t)(bus)) << 8) | ((devfn) & 0xff))
+
+#define PCI_SBDF(seg, bus, devfn) \
+            ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
+
 static void pci_add_dm_done(libxl__egc *egc,
                             pci_add_state *pas,
                             int rc)
@@ -1418,6 +1424,10 @@ static void pci_add_dm_done(libxl__egc *egc,
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
+#ifdef CONFIG_X86
+    int gsi;
+    uint32_t sbdf;
+#endif
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
@@ -1486,6 +1496,18 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+#ifdef CONFIG_X86
+        sbdf = PCI_SBDF(pci->domain, pci->bus,
+                        (PCI_DEVFN(pci->dev, pci->func)));
+        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
+        /*
+         * Old kernel version may not support this function,
+         * so if fail, keep using irq; if success, use gsi
+         */
+        if (gsi > 0) {
+            irq = gsi;
+        }
+#endif
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -2172,6 +2194,10 @@ static void pci_remove_detached(libxl__egc *egc,
     int  irq = 0, i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
+#ifdef CONFIG_X86
+    int gsi;
+    uint32_t sbdf;
+#endif
     uint32_t domainid = prs->domid;
     bool isstubdom;
 
@@ -2239,6 +2265,18 @@ skip_bar:
     }
 
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+#ifdef CONFIG_X86
+        sbdf = PCI_SBDF(pci->domain, pci->bus,
+                        (PCI_DEVFN(pci->dev, pci->func)));
+        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
+        /*
+         * Old kernel version may not support this function,
+         * so if fail, keep using irq; if success, use gsi
+         */
+        if (gsi > 0) {
+            irq = gsi;
+        }
+#endif
         rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
         if (rc < 0) {
             /*
-- 
2.34.1


