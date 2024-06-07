Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865848FFDDC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736382.1142481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhs-0002Us-F2; Fri, 07 Jun 2024 08:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736382.1142481; Fri, 07 Jun 2024 08:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUhs-0002RX-Av; Fri, 07 Jun 2024 08:12:16 +0000
Received: by outflank-mailman (input) for mailman id 736382;
 Fri, 07 Jun 2024 08:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avvd=NJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sFUhr-0001Em-B7
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:12:15 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20624.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a854c5-24a5-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 10:12:13 +0200 (CEST)
Received: from SJ0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:33b::17)
 by SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 7 Jun
 2024 08:12:09 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:33b:cafe::8f) by SJ0PR05CA0012.outlook.office365.com
 (2603:10b6:a03:33b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.14 via Frontend
 Transport; Fri, 7 Jun 2024 08:12:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Fri, 7 Jun 2024 08:12:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 03:12:02 -0500
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
X-Inumbo-ID: a4a854c5-24a5-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biTfxaOagWATFbVkVPDhuUnrVzwblk1bCtHwOfzanszi0FrFkesIJrHhUcan3zLxcLzJip+DnZEB8sWGvR5tSp6q5u5TWOiKQZTy6C5MKomzrsCbhhl4mclbXySAwBzlJvQ37ZQLwGQB3izxEpJbDoZFFUslo+SIrNuE5jq+N8BNme6muqvCn+85OG/jlbXrkrOwiJ3ycRkuSOITDVvTB23lQMSC5/Lpdz70WN8//Hg5Hzukg8N0JMtOWq8KsyVpjI3fMK85Ct2HdQSpEySCROT6h4xIQtyV5Pvv9/NU3nQSHQGdkq13UllsNDU+zE9ssqtDfLN+38qoSpgaZ3Cvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fwxiaHPU3gH65mb06pygxWzyZ3jBWCUum2KJFb89q8=;
 b=XnTogwIqwP2b/fjBKTruDNL4jUJkysZmw/hzENtS1Er5HXHeJLWrWs2OTYzsFXz1UPVv5Zyq0if9ADcSHwNZfGshJIgaxWbkjklmifzt932QGg042iYG+5DhcE+tgxDolTJEQY4tr60y/ALSdgAPPwvXD2a76v/DDj/GrR+OwNMehUxsaFv3DODgIG3hIMXnaGJoXInGLwapSp5MGujINKAr3FjmfldZpSn8kZ2zXvbO2zeuZNWfJ8pXnpHKSRYcmk4sS1cvf+y/oAJpJT5gkGIuWD4Zyik0U8h7WpGqJO1WwQc5F6xTFtU33hPlETpmaD+yWWtcSzibOHlr36/+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fwxiaHPU3gH65mb06pygxWzyZ3jBWCUum2KJFb89q8=;
 b=ziX6Zn3uSO+vlc6n+90i6MjLnsh1mfvJsChKW863b+Bqvwj7BiHq6xq5MvKAMxGZDuLuCOMRkNETvSZgF54pik10gpk4EyLNKoJNGRLhgz6eeuPHV1Zhh3XczH/yFHvWdRVMe7Sd38jjMvuys8+6iAT+fyi+HN0wZ/4pRmqlesk=
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
Subject: [RFC XEN PATCH v9 4/5] tools: Add new function to get gsi from dev
Date: Fri, 7 Jun 2024 16:11:26 +0800
Message-ID: <20240607081127.126593-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607081127.126593-1-Jiqian.Chen@amd.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SA1PR12MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 782befe2-48d6-4505-8203-08dc86c98717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|7416005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dohy5EqQoVV+7Xm7KnJSp4Wxvs9wgiLPymZD+lEHWKXbuSgzFv7dhalYppzW?=
 =?us-ascii?Q?asHYz0nY8DOqsxmINW9wRHoOl80RIE0YVhCbBR+W0OVCEXLXn2mAdPFM9ooE?=
 =?us-ascii?Q?nPNP+TL4DTR8qjgRT0FYTIj1XlYqWWdSkL9hcIXYk5VCgcWbQrAeoNr25UFk?=
 =?us-ascii?Q?7IvVXHNY70jyatzT2o8CImKmAYZbqnzUy4cG1UjkNm033xc/fdtXzyTG68cd?=
 =?us-ascii?Q?wgXHfCUqtBQDLksRxVal/3nUk3tQPePu58DaZnUVIsYJ+I2jYN0rgQ8ZaQNT?=
 =?us-ascii?Q?2E1mIFaEgm8dIUVyVRX+CW0GztqDNjqVLZT6ybI/ucw+mns9aIq/2rfijZi3?=
 =?us-ascii?Q?vT9SNx/o5Jkj+dwMTFBLY9OWUTcmed8tsb5snPHPLXpxg9KSg7/JvU2ICaBS?=
 =?us-ascii?Q?+Fni4Y6NIQpvXRCKqy3YEfdWitsITsoJOfbOP7Im1+dUArrVEeFrBhkEJVVA?=
 =?us-ascii?Q?Kt/3rv8/V20sx6mKNpojNn0mquQXCtUj2iOfFBFQILkGcKzMdlfONrp3F+xx?=
 =?us-ascii?Q?J0h6/ibwUeabS7TQesBIiXpkRG4SoP3/U2b5N/vpfL3FuThT761ZwgrThS1W?=
 =?us-ascii?Q?rp6Ano6vi3sWyW8bz5lIoMwC644EstvkIUz/E7aDRLZMu7pg+LSbtthye88z?=
 =?us-ascii?Q?Eqp0SYf/TNS6cA2d/HYXGXNlU7TqcusxMeaCgQNEMAqW0aU6X9wtjy/5XQ8S?=
 =?us-ascii?Q?BqPE6/p9kUeTpRepEUbmCDqB6uBCZcyQi5/5fRhMLpJd4cQJeri5CXjglLi2?=
 =?us-ascii?Q?6918dG3Aa0uIV+9mwyuNhn16gjv5lTb1R5eTLaEVeuN4Juli/z2/qr2rCszY?=
 =?us-ascii?Q?+Fl3179P3iaG6YjccxcKHHk0KOkVNx/gqwh30mAMUIGFOAq70IesmrppBO6H?=
 =?us-ascii?Q?b0fBbE73kMEE78p3p3iFCQBm9yqO5fQj+noyUruDNo3d4jigId4GIUfV08A6?=
 =?us-ascii?Q?xK4omLXsPFZg7nqwOv4rv2mbWaA0tLzjKUL+lzKXHxJi4wXrcpXqRXTGfQ/0?=
 =?us-ascii?Q?sxIALOSrw2Ft6IQ2LOr7GLN+BPijz0q2YOzq9MQo1r+fwL/W5NsTGfnS5fA8?=
 =?us-ascii?Q?wF0UqtVBvNcVNMmlTKS32NxwrjBjJD0zMpnDBAnug+Kkg4YYjN/w1yV4hyFX?=
 =?us-ascii?Q?oQQpRyFIYwmq00leRhDeND1qhOPDHxXY7ggZvRAUAhLpKawRxJAPHcG5yt9g?=
 =?us-ascii?Q?UZ5UfSHeTGghuYjzO9SjJxfwppNrATSYc6vW+H2aQvDH7EQy9ARhFNNV3NGH?=
 =?us-ascii?Q?ufwloIkg45MKPJQRBFXaJ90g78rfVtM+0d3zBPoLnTp4bBtAtbR8ECDxURw7?=
 =?us-ascii?Q?52bPZUghJnC5wwg1gMkQVA4VXcc1FmlKanb1zGxSZVjPJR3T3upwVrvWtTTh?=
 =?us-ascii?Q?UPoU5nVvN/e8ABY2+ub8BvsG5yEGuJssUtEuvAmo6BgYy1e62w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:12:09.1062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 782befe2-48d6-4505-8203-08dc86c98717
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993

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
RFC: it needs review and needs to wait for the corresponding third patch on linux kernel side to be merged.
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


