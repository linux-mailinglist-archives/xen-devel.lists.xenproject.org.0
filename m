Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C4D8AA783
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 05:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708684.1107755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKl-00030z-9N; Fri, 19 Apr 2024 03:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708684.1107755; Fri, 19 Apr 2024 03:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfKl-0002xJ-5V; Fri, 19 Apr 2024 03:54:43 +0000
Received: by outflank-mailman (input) for mailman id 708684;
 Fri, 19 Apr 2024 03:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxfKj-0001ls-QF
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 03:54:41 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b50d87a-fe00-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 05:54:40 +0200 (CEST)
Received: from CH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::16)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.53; Fri, 19 Apr
 2024 03:54:36 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::a5) by CH5P220CA0004.outlook.office365.com
 (2603:10b6:610:1ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.30 via Frontend
 Transport; Fri, 19 Apr 2024 03:54:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 03:54:35 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 22:54:31 -0500
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
X-Inumbo-ID: 8b50d87a-fe00-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAFTr1I08cg4up1uHvs1bYXUmcOZVDsICbE43HmwT5OzTgsz3Ra04kXtQMQvNnSRiXh9uEQMHAZm8aO0gJ+YdIvvzMd0MtNlxtArt7222yUMjpK+CLGf2RJyGuocju9CjY+QV1M0rDwRn1mwJ4s29zO3CiB8+N20ozJnl/354CiexMbsOAZ6XDURC5240+3waOakXpXEMh+FGMSgve2lNACicPCu0JCTOdK+l5yZCTwZlAUMquyxmvg9uLDfbRUwPEguFjYguluoR+AJZqAGw7aFZ1+EINSdjdwix/fOj4Zyibie6G2NR3PsHGYdFl8LaR+/jBtD4xjVxNsDY1kl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88JcE9Ad2syAQsm9w3u6rHe4+iMIG9q0VZLeMKdweWo=;
 b=B0hD2qWvQTamXzWu8SxLJcH8h4n/1FvPHpBWOyptY5v2hoOlXpTIl7jaQgV40OU40eiaYUSr/gGGB6GDCI0Rp+1W2muFo62NKi+UHy7Nwe7e0jwvx43IwMSFrv8BadMr30dgVLmcxFDCFQWhJ1OrCHndnLPdGeyv/T9oWfgh0+4yc70nSju95Iq4wYOC2uOd4O7uBWNL8MXqPkaG9kVmBmmnH21ldbOSBWRkniVfSEh4LApIAGlQPyvFa34xppYdfxHZQ72rFT0sJETUE4OIX1yLnAez2SzBqe+eIojsX0cA2n+jjfcKhtgILbuKN0ivHMWxhUfcEscVdRru5znC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88JcE9Ad2syAQsm9w3u6rHe4+iMIG9q0VZLeMKdweWo=;
 b=39myrN8fKW9k66S8sMxbteM2YYyUfchutdACvGlGvU4xQQ43oNSM+EPA+VpXDztlPiAyhtcIL0FgpXHuK9kUhoSoTWzj7buNLGCi5KdP9C/m5s1sNMilJqj7O62rLEDrXYz6Hkj2TQ1kU0ZVGflUKvGaRnDzOKneymlldOaJay4=
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
Subject: [RFC XEN PATCH v7 4/5] tools: Add new function to get gsi from irq
Date: Fri, 19 Apr 2024 11:53:39 +0800
Message-ID: <20240419035340.608833-5-Jiqian.Chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 33eeb739-1744-4e7c-c3d7-08dc60246db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UmCgM4m0rNACDsVvP8oA0XkjJKXEOtiaSO2uF6gPf9TxuwlcE5jUcxN6ZirH?=
 =?us-ascii?Q?IDOMH/PaVumSg+YVojKDMGJ7sj63BifBtOAgXdUOiSt8nKmMJ5ACyPWV+Ctq?=
 =?us-ascii?Q?UEUJCHo4c7Ukii2lxskpaudfsQdW0/2/sLgyMpA66Al01gkyVeCgMQ/Y7b3i?=
 =?us-ascii?Q?1Lb4fHhaFAQtN17U6HWtscKCmFqti8EqWpSQ/WOWnCEJJ3HP+0DdT76E57Oy?=
 =?us-ascii?Q?z/7BXTTnG5959JLVVG1ikqpkS10n8zk+gnHqYZ4uFYaFxh4J3qPT/kMEQhIG?=
 =?us-ascii?Q?65JobXdEjyfft6aKA4GPPz3qg2B+ooMtAXR1AlRUXhEERsGZ6UkHjvuFDi4C?=
 =?us-ascii?Q?ET4wjMqGJD8vH+NAQhJlDdxIxs/iaJTgSISnaWCMnEptHWTIqpPu+VtjS8dW?=
 =?us-ascii?Q?NXzkMeExWuhKk4l3ZuDNG6gmZ7MTNKxIhj3qY1JiTkusvTUs9WLnXRU/swtt?=
 =?us-ascii?Q?pE99/46/dl+OackhKDR7wmgHf2q/j+qF2pFDl88KwHgsA7JRc2Wke6mWjw6V?=
 =?us-ascii?Q?xpKwN06yTHMCe4rAM0gcg6wLBP0xaHis1QJ0KctWWSGn3eckC8Js7LWt1i07?=
 =?us-ascii?Q?7pQfa1B1eoASmiOhjJ2QQaQGtbeSuMC6VoEghFJ169uHeQTtbuMZwXioCkAV?=
 =?us-ascii?Q?nxdY0bzwI5ktIdHgFn5SMxRkxb0VJnDSO2i5RStGJtGoq9IslBYHizs5ZbxU?=
 =?us-ascii?Q?cIsALQ2pALlxFUG/kogudJ603ZTQhGEnFPDYCl2pNLFA4Tr1/20UdXHYzK3i?=
 =?us-ascii?Q?TvXYlz6A9iLnMgEh8wxWkwh7+nLjaQv8s5rgwiiKg8LT71ZkNsSposuwgqJ5?=
 =?us-ascii?Q?d9+PvAQaOBY7GT0QFJGELTcQNYdGxT9aXqk1zgNndMtsFRxT4HyVoN1IO4gD?=
 =?us-ascii?Q?LYoZxpwEzZIhHNVlZ+xKn3pJYMXrzRB5x1p96Ul/aoTC/RSrpHBEVUqT2gxm?=
 =?us-ascii?Q?yhf54UOT6kbGWW3VcQfPWwVydBzfAoBJq3uimjbzo30FnYD4EqzoV9fig80U?=
 =?us-ascii?Q?Ugi+skP6r3UZKJUGvmKJ9S/EGI6N+eGTP84O6KifBDNVBa9IHwW8u+Jj4fRv?=
 =?us-ascii?Q?zWqOAZKMRngfO8QyeMYttpIoDSWMeI4WBVlV2t0V5lPOsLmxiQq7k8edOCwf?=
 =?us-ascii?Q?zcUPRofGUdbrFztJYTiTqNLiKH7YPCryDwMle4Tbb/N2DE+Fw62Tha6BScpk?=
 =?us-ascii?Q?SUI9tFj+ST20BqxSQKU0L9vn2jmlqyOeUJ7Jdne3WWPci7ny4sr7PmzymlNg?=
 =?us-ascii?Q?rlCbuVjCef2EF5ZBwqsEtazmzkSWc6enIiweOdCkbqIHVwZiTdY0lXB2g0A4?=
 =?us-ascii?Q?Wc7Y0ZDtVJQh6hAP4h88FbylcWknnUYZBh9xP6oOGAnHYxnGipVNMSDBNYmL?=
 =?us-ascii?Q?TXWnnBI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 03:54:35.4598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33eeb739-1744-4e7c-c3d7-08dc60246db1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664

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
And in current codes, there is no method to translate irq to
gsi for userspace.

For above purpose, add new function to get that translation.

And call this function before xc_physdev_(un)map_pirq

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
---
 tools/include/xencall.h        |  2 ++
 tools/include/xenctrl.h        |  2 ++
 tools/libs/call/core.c         |  5 +++++
 tools/libs/call/libxencall.map |  2 ++
 tools/libs/call/linux.c        | 15 +++++++++++++++
 tools/libs/call/private.h      |  9 +++++++++
 tools/libs/ctrl/xc_physdev.c   |  4 ++++
 tools/libs/light/libxl_pci.c   | 11 +++++++++++
 8 files changed, 50 insertions(+)

diff --git a/tools/include/xencall.h b/tools/include/xencall.h
index fc95ed0fe58e..962cb45e1f1b 100644
--- a/tools/include/xencall.h
+++ b/tools/include/xencall.h
@@ -113,6 +113,8 @@ int xencall5(xencall_handle *xcall, unsigned int op,
              uint64_t arg1, uint64_t arg2, uint64_t arg3,
              uint64_t arg4, uint64_t arg5);
 
+int xen_oscall_gsi_from_irq(xencall_handle *xcall, int irq);
+
 /* Variant(s) of the above, as needed, returning "long" instead of "int". */
 long xencall2L(xencall_handle *xcall, unsigned int op,
                uint64_t arg1, uint64_t arg2);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..2b9d55d2c6d7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1641,6 +1641,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_physdev_gsi_from_irq(xc_interface *xch, int irq);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
index 02c4f8e1aefa..6f79f3babd19 100644
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -173,6 +173,11 @@ int xencall5(xencall_handle *xcall, unsigned int op,
     return osdep_hypercall(xcall, &call);
 }
 
+int xen_oscall_gsi_from_irq(xencall_handle *xcall, int irq)
+{
+    return osdep_oscall(xcall, irq);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/call/libxencall.map b/tools/libs/call/libxencall.map
index d18a3174e9dc..6cde8eda05e2 100644
--- a/tools/libs/call/libxencall.map
+++ b/tools/libs/call/libxencall.map
@@ -10,6 +10,8 @@ VERS_1.0 {
 		xencall4;
 		xencall5;
 
+		xen_oscall_gsi_from_irq;
+
 		xencall_alloc_buffer;
 		xencall_free_buffer;
 		xencall_alloc_buffer_pages;
diff --git a/tools/libs/call/linux.c b/tools/libs/call/linux.c
index 6d588e6bea8f..32b60c8b403e 100644
--- a/tools/libs/call/linux.c
+++ b/tools/libs/call/linux.c
@@ -85,6 +85,21 @@ long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
     return ioctl(xcall->fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
 }
 
+long osdep_oscall(xencall_handle *xcall, int irq)
+{
+    privcmd_gsi_from_irq_t gsi_irq = {
+        .irq = irq,
+        .gsi = -1,
+    };
+
+    if (ioctl(xcall->fd, IOCTL_PRIVCMD_GSI_FROM_IRQ, &gsi_irq)) {
+        PERROR("failed to get gsi from irq");
+        return -1;
+    }
+
+    return gsi_irq.gsi;
+}
+
 static void *alloc_pages_bufdev(xencall_handle *xcall, size_t npages)
 {
     void *p;
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 9c3aa432efe2..2d86cfb1e099 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -57,6 +57,15 @@ int osdep_xencall_close(xencall_handle *xcall);
 
 long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall);
 
+#if defined(__linux__)
+long osdep_oscall(xencall_handle *xcall, int irq);
+#else
+static inline long osdep_oscall(xencall_handle *xcall, int irq)
+{
+    return -1;
+}
+#endif
+
 void *osdep_alloc_pages(xencall_handle *xcall, size_t nr_pages);
 void osdep_free_pages(xencall_handle *xcall, void *p, size_t nr_pages);
 
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779ce8..4d3b138ebd0e 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -111,3 +111,7 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
     return rc;
 }
 
+int xc_physdev_gsi_from_irq(xc_interface *xch, int irq)
+{
+    return xen_oscall_gsi_from_irq(xch->xcall, irq);
+}
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..d4313e196ebd 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1486,6 +1486,11 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        /* if fail, keep using irq; if success, r is gsi, use gsi. */
+        r = xc_physdev_gsi_from_irq(ctx->xch, irq);
+        if (r != -1) {
+            irq = r;
+        }
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -2174,6 +2179,7 @@ static void pci_remove_detached(libxl__egc *egc,
     FILE *f;
     uint32_t domainid = prs->domid;
     bool isstubdom;
+    int r;
 
     /* Convenience aliases */
     libxl_device_pci *const pci = &prs->pci;
@@ -2239,6 +2245,11 @@ skip_bar:
     }
 
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        /* if fail, keep using irq; if success, r is gsi, use gsi. */
+        r = xc_physdev_gsi_from_irq(ctx->xch, irq);
+        if (r != -1) {
+            irq = r;
+        }
         rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
         if (rc < 0) {
             /*
-- 
2.34.1


