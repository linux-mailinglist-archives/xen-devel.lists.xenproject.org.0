Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47908C742E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722962.1127411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xnb-0008Up-6c; Thu, 16 May 2024 09:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722962.1127411; Thu, 16 May 2024 09:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xnb-0008Re-2l; Thu, 16 May 2024 09:53:19 +0000
Received: by outflank-mailman (input) for mailman id 722962;
 Thu, 16 May 2024 09:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hz7T=MT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7XnZ-0007bz-Iq
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:53:17 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d984174-136a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:53:15 +0200 (CEST)
Received: from SA1P222CA0195.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::8)
 by BL1PR12MB5873.namprd12.prod.outlook.com (2603:10b6:208:395::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Thu, 16 May
 2024 09:53:11 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::e2) by SA1P222CA0195.outlook.office365.com
 (2603:10b6:806:3c4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 09:53:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 09:53:10 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 04:53:06 -0500
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
X-Inumbo-ID: 1d984174-136a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNWcmJsw83un9TlRBUhAEexfgDypF8G1MUZfJeCoP4gRVoYp7/wVacMEB5SorwT25b+OlRl1+BoXZF7JpCZfEGcjuW7ooJ3ICEd7SoXnzFMGWhE2I7l76ydjY8EDRZ/sFTiTY7Fb0l6CvDskWFRcI7VWB51Lqkv4r4HdmGB/e4xCVxbWB2A5MVuem6+Hbs0sBAuhlS2P7G5rSNIEqXtX71wYbbI7/JyJj3622W7AuQWkitDXnLrMWMiHfpD6rE4129+B+/7UGIkSIqrI/zrmubUs7tJ9sHPyc0CZGU5HicHIbIZ4ehZyWzrLo/d35CaUMBVz4Fcz4q6DSEQKHoEDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ljn9VtnUEyifgNA3cosOzMocDUuiDW1at9hMSJ3P5c=;
 b=ZaMRj0I8SqBiB/fX2KVEtQ+JmnxhBjX4Ql4zUUvS3L37kKWrIM0ohTQYTQSOxgFrmXeRCpXUf4RwNdhnavg+pcpj5URDwwKPFnYDkjw+afNr2ANzFG2ZN0zGYYtQqfBVVYOzLDn1nTPZ89fIhb+L3rbzfd29Joi6Ysgs4baSrsSZ/OCR+t1bPMjP7nAYrgFmEw1SUku1YSA7wz6pMUHJJndczOESdjAE4DeqNQb+fj3r++sDjsSy8NOa3gFpnpAr0ZmPxLCs9xqQa3hLeHVEjEX5JinaJk8Iqb4VDJfYLK0rr+mOsrjx5SQQ2wwiqEfa28zWuhfO5/mkblqZaa3jGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ljn9VtnUEyifgNA3cosOzMocDUuiDW1at9hMSJ3P5c=;
 b=qv0ambQ0qHDP+5KxBE/c6ZUD7Y4mdflJLkN4p8quBstHdh1c76NNPrMUOuaoz8TnOO7lTATODgT2Xh2Zh+VPnwaBWx9cE6/yT+FVVFNSPF/fRDoShPxqRxnqZ0aLCcMpWYAp/JbsqXVvzGUVq/QwzieA/J7PWu9jNLL90KiRB2M=
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
Subject: [RFC XEN PATCH v8 4/5] tools: Add new function to get gsi from dev
Date: Thu, 16 May 2024 17:52:34 +0800
Message-ID: <20240516095235.64128-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BL1PR12MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ddf47c0-3f80-49be-9d42-08dc758dff0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8U0MbQPC05dg2ofgPqGVAyNxFTAehg15x6J1n1U5HjFfX+z0un4u1tNpeoXS?=
 =?us-ascii?Q?jxboY/GgEGqVJss1DuO5VsKsP52K/eMx+lR0com+fykk5rbMZHrNgkiLYuxg?=
 =?us-ascii?Q?rpd1ZzAvwq8qRWEji+/AZeLwWFBUCR425GLIingZ1BjD+EoQyNgTdt/uXcV9?=
 =?us-ascii?Q?BcOWRb/q7UoxnNhEZJgK9Gq92QvPSRkggEAn2KO8T7qp7K7DzugKNFwK0QNr?=
 =?us-ascii?Q?odAX7duhrQYyfIxxRq3YRH30RLKRIS544jMzC7afL2wg8Qvx4/YGlwpImf1z?=
 =?us-ascii?Q?pJO3WpSsbsWFQTy3N53SJQjoWJCwVzoL6gZE7ytQhFEDMIfsxGX9exf1/kQt?=
 =?us-ascii?Q?xNfF2nVKgjzhhhdC7qacnZvmMSh3XTvxZ7YYDw92BqF5DqPgfKr97JW7mq32?=
 =?us-ascii?Q?optisaHfkDFsz8X6XBjZ0fICk+CeoGuXisP2hc+OJOQbn75F3+E2D9g8Rf++?=
 =?us-ascii?Q?TqEwft9Ua0fn+GfE/xrRqmGtXFhTwXfvqALFORowGw6mSQGhQ9lXHLGlBI6b?=
 =?us-ascii?Q?w4kXwt/njoen+TIHv/f3bKW6J3t/QzXvxgHJBu5ubqxcNdXHNN9kxf1cN4pK?=
 =?us-ascii?Q?nJ0AIgGTnK4FpU5qyrcDaPWHHZmia6WQO2g36Bg3+qvyZOeGULkBWc2tg7oq?=
 =?us-ascii?Q?35VA1yN946ANoE9FDQ3M/mnz6c08HY+OcMH8azAig6lisckUe6I7MSuArlPC?=
 =?us-ascii?Q?UqU+3h9HM3TxRqw13VQpZIXAxmnW8yBV+5aPnb/1jhY5AVOYObnkSlwhPAyW?=
 =?us-ascii?Q?8BZ1dndGjANGBMR59Oqyj/B+0qjpHns+aqho27LetEFo1ILXUt7FoQ7cGq+G?=
 =?us-ascii?Q?K62/FtejCcoms6OkntdXyW73KJ7q70iMIaI94PAjOFdkluyZVWmqMZt1JLbm?=
 =?us-ascii?Q?XnS0XArCGy1+d1qQEwILXp5f33MuVOz1cRs010JgYIFIJluU7TEpTs3OOeBT?=
 =?us-ascii?Q?1XyUEX/eOkiJjuQRpedbkWnyZ7uVM36v8XLlvA8YUBOi3GZKyB8zRSowNTEJ?=
 =?us-ascii?Q?EtIUIWeyPUdvYRGJdwfDU/oCXaBLhkRyGkfS7IPtPyrlPhquqkVVQElJd7tJ?=
 =?us-ascii?Q?uJJIS2Uhp6tLLmY9rBf6sQ+TzMnW0iq+ScDD0TsyXDU79mlNQJes8t99Yc+n?=
 =?us-ascii?Q?e04X+LbEvJaouVUqn+M2nMzia3QpxQWvBHObzLw039hs25uQGH3754tEE/ZR?=
 =?us-ascii?Q?azxW77+I8Ntrq+3+Dq4Na4I/4+6Adnj0sGYuxMbxk2AQZFUShX/mcU3F2vGj?=
 =?us-ascii?Q?EnCckLXefh7BD5LyXlGjrHN2Kf4WtcwRksYZTryqPs/8lFlsPxltbwGcNO7G?=
 =?us-ascii?Q?cmnzEVM/7wrCzq+uV19YEWgm1OwP4PWuItfyiM7TodFUcdh00O2Wa1y75LAP?=
 =?us-ascii?Q?gG+devM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 09:53:10.9350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddf47c0-3f80-49be-9d42-08dc758dff0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5873

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

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
---
 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xencall.h               |  2 ++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/call/core.c                |  5 +++++
 tools/libs/call/libxencall.map        |  2 ++
 tools/libs/call/linux.c               | 15 +++++++++++++++
 tools/libs/call/private.h             |  9 +++++++++
 tools/libs/ctrl/xc_physdev.c          |  4 ++++
 tools/libs/light/libxl_pci.c          | 23 +++++++++++++++++++++++
 9 files changed, 69 insertions(+)

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
index 499685594427..841db41ad7e4 100644
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
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..7e44d4c3ae2b 100644
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
@@ -1418,6 +1424,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
+    uint32_t sbdf;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
@@ -1486,6 +1493,13 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        sbdf = PCI_SBDF(pci->domain, pci->bus,
+                        (PCI_DEVFN(pci->dev, pci->func)));
+        r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
+        /* if fail, keep using irq; if success, r is gsi, use gsi */
+        if (r != -1) {
+            irq = r;
+        }
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -2172,8 +2186,10 @@ static void pci_remove_detached(libxl__egc *egc,
     int  irq = 0, i, stubdomid = 0;
     const char *sysfs_path;
     FILE *f;
+    uint32_t sbdf;
     uint32_t domainid = prs->domid;
     bool isstubdom;
+    int r;
 
     /* Convenience aliases */
     libxl_device_pci *const pci = &prs->pci;
@@ -2239,6 +2255,13 @@ skip_bar:
     }
 
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        sbdf = PCI_SBDF(pci->domain, pci->bus,
+                        (PCI_DEVFN(pci->dev, pci->func)));
+        r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
+        /* if fail, keep using irq; if success, r is gsi, use gsi */
+        if (r != -1) {
+            irq = r;
+        }
         rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
         if (rc < 0) {
             /*
-- 
2.34.1


