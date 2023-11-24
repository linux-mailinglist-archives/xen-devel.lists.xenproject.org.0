Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5F7F71D2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640472.998787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdn-0005xP-8X; Fri, 24 Nov 2023 10:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640472.998787; Fri, 24 Nov 2023 10:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdn-0005tm-4D; Fri, 24 Nov 2023 10:42:31 +0000
Received: by outflank-mailman (input) for mailman id 640472;
 Fri, 24 Nov 2023 10:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibx+=HF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r6Tdl-00050M-JU
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:42:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b1b3d2-8ab6-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:42:28 +0100 (CET)
Received: from CYZPR10CA0023.namprd10.prod.outlook.com (2603:10b6:930:8a::16)
 by MW4PR12MB7288.namprd12.prod.outlook.com (2603:10b6:303:223::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Fri, 24 Nov
 2023 10:42:23 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:8a:cafe::2b) by CYZPR10CA0023.outlook.office365.com
 (2603:10b6:930:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 10:42:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 10:42:22 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:42:18 -0600
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
X-Inumbo-ID: 28b1b3d2-8ab6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZmPU04rh3WjDn+Lz9y4l4uLaoTnTwMn0WZvoz/2a26ttsUrMz7/IQcf3cy7mnZo/B/QCgXzFBPcbzPD/m3eltsJbhPprB9eU6cfzk8lUlEVArojmwDday7lYkZ1XXviMUgd1Mk3lQt6cvJKYL4TzL6EEsXZShgF8ZGh080RmafzjHeVQ3xW1nXwnXb1lNrYiS8hZ11uCdhbFZ+NkbNvWAWL9A5ZpSeRBD1y31qmpkeSsnFPacqrKp12s2V0vpa8ROXYUEQ/YwuxMDoW1tbwcOfAPzb8AoRadj6OV0c6moUGo1POS6mdcwhilURg81Pvm8lvFFu+9NNiABEbLi1Luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT9k6v3Ouj/9uRO3GuzjBHyy8hdEspun9TdFDzOpiAo=;
 b=d+zrMwjNBqj8g8ha/PNa6uTI8fJlbzv9IzJxIIVEbmlp+2LnBPO06JXRYsV3xksP6Dl9MFZFYg6jAjthFI2OE2LdLGldr9AUvUoJrc2KDxdseunCkWtMqNXUZpbdagzXxurhUskbohQOg04YL2lvwSQL/eWDkm4InwGIUQIzJNBfSsQbDIQTGWo5BauqH4R2w6GT1uy2SUC4TSSlBFYdnsKf5+8UDD3hX0IZ4cU2AHc5qXWqVbM7C6qeSBcCe27+4ufREzQA4iW3RgRMlJejxzc+NPUbRfnVv/MV1MweqB2VLJVcRSo6V3rUcc3atFVcjO+3zgIAbhVWtHIrfavCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT9k6v3Ouj/9uRO3GuzjBHyy8hdEspun9TdFDzOpiAo=;
 b=vWN6w/yCvubKA+7kTTzBq9OIZ4ORZdX9BRCzDBfHihqyiaPEcU3dJ6fXOnO29v1LM7VwQafpya+Er/SaMFq4PAswlGJPtM9LEl9f3A25nDlsx5yzZ8ZeAJ6jh1rBAEEasze5m1HmeEJsyPK1Bqkyv4AptdphuTCzagm8y5qkQrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Alex Deucher
	<Alexander.Deucher@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from irq
Date: Fri, 24 Nov 2023 18:41:36 +0800
Message-ID: <20231124104136.3263722-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|MW4PR12MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 29775db9-f6a3-4a8f-6ee7-08dbecda0ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u9nlbqm2ySNAzk0g3bVrtw5ufrGPGNl3yScyi6clff92PnhvGQDUCBdcX5BUVPK/V83fIRpTEBeUdWXzudg5lGDnaB70bNbr5PX/sONHPbGp2svJB7wP6X6kFCTBH+QUg2NUo5sbKoYsh8kqCyjiFKBf2iswLwUc8ndtgw1PRI2OhK8E8LV9hYygveFoHvqNQMFgUJVNRsoaOyIsfi8YxkHxaIh9v0HOChPXeMuCTOBN/sqHNcUHzVFjaAoDUq9x3x+0BUvJOkn4hz7F52yIVUB1ga2jQRIgWnuoYoRmiMW+BstulIp/DVu1Qb7VDd6GoVDog8lxt7UUQWvyRXnoZvWWl8aTGXq1xZTrGaLFWckKozILnAa2naa6Y6VuDxhN6pmmb47wfTLgZqhIDSVGYM/en5V6N1pHsejMDnwqSxTcqJjFCD567F6Eb4gZXZ5RCP+g9SNQUBvuVImoZ5izb85wOmYCy5L02Dy12Sf1lY/ijXm5CiV29tO3DsR6llDus1cisXZP1zy4e5N7WWYqThxp8ipXclW8fYcEgkQqADu1RDpCumWg/Bjx0UvZPETxhEgUjuFR7fRYjUdli7eHZle992THB9opnicmsHHLmmz6SWd52dJr6x2au5/YGG1hvqBISNxQXG8V+1JtQdMlPqL/rPuv3/QjdzN57bqaC5gXk50C6wuIReZ5uFM9PaASDlGQX88ZSvbrF+6m0FODMDZxD6NMRywFxycbSg0OLpfNh5PVbRmIw4jw7ojo71y+eRetJzNok++kjcmm66hsZw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(16526019)(2616005)(7696005)(81166007)(356005)(47076005)(1076003)(110136005)(316002)(8676002)(36860700001)(8936002)(70586007)(54906003)(70206006)(26005)(426003)(6666004)(83380400001)(336012)(478600001)(82740400003)(86362001)(40460700003)(4326008)(41300700001)(5660300002)(36756003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 10:42:22.9060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29775db9-f6a3-4a8f-6ee7-08dbecda0ac0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7288

In PVH dom0, it uses the linux local interrupt mechanism,
when it allocs irq for a gsi, it is dynamic, and follow
the principle of applying first, distributing first. And
if you debug the kernel codes, you will find the irq
number is alloced from small to large, but the applying
gsi number is not, may gsi 38 comes before gsi 28, that
causes the irq number is not equal with the gsi number.
And when we passthrough a device, QEMU will use its gsi
number to do mapping actions, see xen_pt_realize->
xc_physdev_map_pirq, but the gsi number is got from file
/sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
so it will fail when mapping.
And in current codes, there is no method to translate
irq to gsi for userspace.

For above purpose, this patch adds new function to get
that translation. And then we can use the correct gsi
number to do map_pirq.

And call this function before xc_physdev_map_pirq

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xencall.h               |  2 ++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/call/core.c                |  5 +++++
 tools/libs/call/libxencall.map        |  2 ++
 tools/libs/call/linux.c               | 14 ++++++++++++++
 tools/libs/call/private.h             |  9 +++++++++
 tools/libs/ctrl/xc_physdev.c          |  4 ++++
 tools/libs/light/libxl_pci.c          |  1 +
 9 files changed, 46 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55..ba4b8c3054 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_gsi_from_irq {
+	__u32 irq;
+	__u32 gsi;
+} privcmd_gsi_from_irq_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_GSI_FROM_IRQ				\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_gsi_from_irq_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xencall.h b/tools/include/xencall.h
index fc95ed0fe5..962cb45e1f 100644
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
index 2ef8b4e054..2b9d55d2c6 100644
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
index 02c4f8e1ae..6f79f3babd 100644
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
index d18a3174e9..6cde8eda05 100644
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
index 6d588e6bea..5267bceabf 100644
--- a/tools/libs/call/linux.c
+++ b/tools/libs/call/linux.c
@@ -85,6 +85,20 @@ long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
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
+        return gsi_irq.irq;
+    }
+
+    return gsi_irq.gsi;
+}
+
 static void *alloc_pages_bufdev(xencall_handle *xcall, size_t npages)
 {
     void *p;
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 9c3aa432ef..01a1f5076a 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -57,6 +57,15 @@ int osdep_xencall_close(xencall_handle *xcall);
 
 long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall);
 
+#if defined(__linux__)
+long osdep_oscall(xencall_handle *xcall, int irq);
+#else
+static inline long osdep_oscall(xencall_handle *xcall, int irq)
+{
+    return irq;
+}
+#endif
+
 void *osdep_alloc_pages(xencall_handle *xcall, size_t nr_pages);
 void osdep_free_pages(xencall_handle *xcall, void *p, size_t nr_pages);
 
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779c..4d3b138ebd 100644
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
index 96cb4da079..ba8803dab4 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
-- 
2.34.1


