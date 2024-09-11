Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D67D974AF6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 09:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796232.1205736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHR7-0004V3-Ka; Wed, 11 Sep 2024 07:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796232.1205736; Wed, 11 Sep 2024 07:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHR7-0004SX-Gi; Wed, 11 Sep 2024 07:06:45 +0000
Received: by outflank-mailman (input) for mailman id 796232;
 Wed, 11 Sep 2024 07:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZHC4=QJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1soHR5-0004Bj-5N
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 07:06:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e88::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6559ee33-700c-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 09:06:42 +0200 (CEST)
Received: from SJ0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:a03:331::12)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 07:06:38 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::c1) by SJ0PR03CA0067.outlook.office365.com
 (2603:10b6:a03:331::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 07:06:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 07:06:37 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 02:02:25 -0500
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
X-Inumbo-ID: 6559ee33-700c-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmZhgBjQ8avCVZC0dESKRsjH9Zt5dvpq5kLhWhQZZvv4fMTSbBElP6mNIiDdO1bUVDZ9nPxhSoGbgZgGOro7Psk17KduTyCf22JJOVbVvzh+Hk2ODTFsKOytMJphxIgUsTn5I1CAGroQDrktGzucCVdLbh0w8PUElawBG6UebkVrOI5M+Raaf2qLkRdFP1GJyv60iW0HQcijynQuyTzgNYgt76QDv0Yx9Kflbi8JqWy98QL/vTandwpFl1H+IRdhX1xnTCdsCcpmoEWZg6IgcdcdWhJcvvVOa3VkIN4IEBkqJICotY4veLqLAQdiRwzXgDteknNhyx0Lf5dzevSgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVZRw+IO1qtotopSIqvPmpFPI/GeAcb5ya8wQPHR8OE=;
 b=J5/EhJAYLJuan6O8E5nQaE2nqXm2h33L0jIP6Ut4dglHABaxvb3tkTPhKAv3dbuX22FsJQoi/PcoPsF+gU6/dPIs3p2O4TSyydCmTt7N8L4jZocfBG4g4rlFEj93qMulodEwwC8uAMh+5qHjhXQgFvpnaMNpukUJ2L5EUes4Aj0nV/yVqU2UlUNjRZuiclvfhGWQR4WI73E9RWO2GJP2jYxtU+gzDiGzCe8fwbTLZ6i7A62ZJ/IhK605cPEzxUCRAkxb9rhC4H8fuEykEplxVPnod/noSpOinsaLFaMbY5J6qiw9R2AlfiOIJe1NLQMODinJFfTlFkCZ8fG3FlqUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVZRw+IO1qtotopSIqvPmpFPI/GeAcb5ya8wQPHR8OE=;
 b=PylLIfzPn9XYUqRZj7/eR1nGFSYz2cElk0A9ql/v5HPtgT9/45WW1QgApUfzkQhtDIctq/wUN9lrBBq5Nrz8OaVpgmWJx7u4BUFDkHJSFi/k5qVWK7Xr/mLEugIAmyjxEWDZnmQ//c+LqSshhrdqKOKj0giIY27z8uV4Ywr09Uw=
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
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>
Subject: [RFC XEN PATCH v15 3/4] tools: Add new function to get gsi from dev
Date: Wed, 11 Sep 2024 14:58:31 +0800
Message-ID: <20240911065832.1591273-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 180d522e-a6d4-465e-02c1-08dcd230474f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wu6AdG77JApWKqQFFh64Kye1XhgzRvlzz3zVfKOUHByxfMGWfsgpv/ow/8Pv?=
 =?us-ascii?Q?AUrEMgzOH0aH/aYwSWgSHX0rhJiA4NCaZbmHNn/u3ROgd69sAynIagscwK/q?=
 =?us-ascii?Q?tua7xWovXwo/yBcObs/WG6DMZu1gwyUuCvI1sEqr5OcyMmQH818T0gV6KxlM?=
 =?us-ascii?Q?0uf04LxBmV39gKsTkUsvswnU7tFUKcWGQkYhJ5X5ChQyDHH2Xlnw1Y10TJ9M?=
 =?us-ascii?Q?NImVecQouSqUK44M6UuC1hEn1sy+Pw9utkJK0246XAAsASK+ylThF9R2H5+S?=
 =?us-ascii?Q?VKzDUMdgUatyVp/ibQYHHf4HlTp23yo04BgYNg1KlAq07EXGwzybehFHVXnJ?=
 =?us-ascii?Q?EWNaQpjoSEP2rn99Jr6lF7euPdcAr589lcKl5UXbwfUKL8xEq1+E3La0sLsB?=
 =?us-ascii?Q?uklcMwmhv7AajX3YVoV9qttQfskkoSjHO0bJZbnjIowggg4ZadqijtiYQj/n?=
 =?us-ascii?Q?USJtgaz4WN1P6uTR0KY6PWYnJGKanU/IHOHjwaY7dj7U116Ow5b3F/PHAOgo?=
 =?us-ascii?Q?6+rLSLEZfPK2tD/GujoACy3Oz8OiVxFLSNsetX1b2Jozp8hNbzxgnjhBB05K?=
 =?us-ascii?Q?WnYZMGX+GMIpZgsRx7qbztl3NOZacH6xouFSnp2PrWxZl8wCDfuVYU1VOuep?=
 =?us-ascii?Q?ic8goeTpqsnmVXF9Dm6CyYgYMKnAExiKCMpgT57N+OBLFuqbg2QZcqulrsMp?=
 =?us-ascii?Q?Vw9AmO3jaLFJSZVsojvtxXpjqTwGpl/+dWigAcr22qCDAE28ZMalTo2jAwta?=
 =?us-ascii?Q?3eG6UTUR4uZ8kDlZdvqs1u0U2YM7mJ57G8MF9kQ8iaisTOP9I1YwptE9f1Qe?=
 =?us-ascii?Q?sYTAlv5H18NMvdutaLPmW2WQFexk5f6ycSkyLGD7ISMw5ofMFrVOQI1E0r5c?=
 =?us-ascii?Q?sFALwiY+shef+rrjxGiT1VDnxg8seaIlJmnipEEEVKm0EBP0i2cYEaC3cefl?=
 =?us-ascii?Q?GUeSQVmQCDEz9Lg8cmW9xzTnbFVx/npAkJeOBLzvPCPecn3ofsTUENXChTh4?=
 =?us-ascii?Q?8OIuhLX3T141QjH/N315zB68pQIesVRH31Ja2iKYAlQfzCdIQjW0WX+VxaU1?=
 =?us-ascii?Q?L1WRpVsxUIv/JKp/Txk57qttFsg42FCJ0OP7LhA6q/cBttjT/r1BHd6XaIm+?=
 =?us-ascii?Q?tPezAQrVZs3l+OEN6O/Z4mnD+Bd6utPFtoDcZ+4YwmY1newdt/Tg5eYI5Mv9?=
 =?us-ascii?Q?0z2AzpuY34GnuSdqm71IgIVKBPbm/UR2c2cXwbC3lSb572VWapKd1wuZbJmB?=
 =?us-ascii?Q?+zqwwZQ8Cr/1hLk86CKE7czE7IL5Q9C5rG6uhXeN0Dg3oRHc0tPe543r8CiS?=
 =?us-ascii?Q?Qxi2udwb4AbUcAJy5OW+saUNoF7rNgmsQQb6grSLeIBvd7Bz97IW9t9Jz9fl?=
 =?us-ascii?Q?TLPS3Qd7tnUQ1W8mEtn3u6f+6PhaDw7c0FDPRIfKZroFInuoXVbFTeutvFFr?=
 =?us-ascii?Q?WaDiHWToYtnNSZOqyrDKyGY6rk6WGm4x?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:06:37.5141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180d522e-a6d4-465e-02c1-08dcd230474f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672

On PVH dom0, when passthrough a device to domU, QEMU and xl tools
want to use gsi number to do pirq mapping, see QEMU code
xen_pt_realize->xc_physdev_map_pirq, and xl code
pci_add_dm_done->xc_physdev_map_pirq, but in current codes, the gsi
number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
wrong, because irq is not equal with gsi, they are in different
spaces, so pirq mapping fails.

And in current codes, there is no method to get gsi for userspace.
For above purpose, add new function to get gsi, and the
corresponding ioctl is implemented on linux kernel side.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
---
v13->v15 changes:
Add "Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>"

v12->v13 changes:
Rename the function xc_physdev_gsi_from_pcidev to xc_pcidev_get_gsi to avoid confusion with physdev namesapce.
Move the implementation of xc_pcidev_get_gsi into xc_linux.c.
Directly use xencall_fd(xch->xcall) in the function xc_pcidev_get_gsi instead of opening "privcmd".

v11->v12 changes:
Nothing.

v10->v11 changes:
Patch#4 of v10, directly open "/dev/xen/privcmd" in the function xc_physdev_gsi_from_dev instead of adding unnecessary functions to libxencall.
Change the type of gsi in the structure privcmd_gsi_from_dev from int to u32.

v9->v10 changes:
Extract the implementation of xc_physdev_gsi_from_dev to be a new patch.
---
 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/ctrl/xc_freebsd.c          |  6 ++++++
 tools/libs/ctrl/xc_linux.c            | 20 ++++++++++++++++++++
 tools/libs/ctrl/xc_minios.c           |  6 ++++++
 tools/libs/ctrl/xc_netbsd.c           |  6 ++++++
 tools/libs/ctrl/xc_solaris.c          |  6 ++++++
 7 files changed, 53 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55eb..607dfa2287bc 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_pcidev_get_gsi {
+	__u32 sbdf;
+	__u32 gsi;
+} privcmd_pcidev_get_gsi_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_PCIDEV_GET_GSI			\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_pcidev_get_gsi_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2c4608c09ab0..924f9a35f790 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1642,6 +1642,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/ctrl/xc_freebsd.c b/tools/libs/ctrl/xc_freebsd.c
index 9dd48a3a08bb..9019fc663361 100644
--- a/tools/libs/ctrl/xc_freebsd.c
+++ b/tools/libs/ctrl/xc_freebsd.c
@@ -60,6 +60,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
index c67c71c08be3..92591e49a1c8 100644
--- a/tools/libs/ctrl/xc_linux.c
+++ b/tools/libs/ctrl/xc_linux.c
@@ -66,6 +66,26 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return ptr;
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    int ret;
+    privcmd_pcidev_get_gsi_t dev_gsi = {
+        .sbdf = sbdf,
+        .gsi = 0,
+    };
+
+    ret = ioctl(xencall_fd(xch->xcall),
+                IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
+
+    if (ret < 0) {
+        PERROR("Failed to get gsi from dev");
+    } else {
+        ret = dev_gsi.gsi;
+    }
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
index 3dea7a78a576..462af827b33c 100644
--- a/tools/libs/ctrl/xc_minios.c
+++ b/tools/libs/ctrl/xc_minios.c
@@ -47,6 +47,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
index 31979937621e..1318d4d90608 100644
--- a/tools/libs/ctrl/xc_netbsd.c
+++ b/tools/libs/ctrl/xc_netbsd.c
@@ -63,6 +63,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return valloc(size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/ctrl/xc_solaris.c b/tools/libs/ctrl/xc_solaris.c
index 5128f3f0f490..049e28d55ccd 100644
--- a/tools/libs/ctrl/xc_solaris.c
+++ b/tools/libs/ctrl/xc_solaris.c
@@ -32,6 +32,12 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
     return memalign(alignment, size);
 }
 
+int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
+{
+    errno = ENOSYS;
+    return -1;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


