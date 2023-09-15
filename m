Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BD7A1D25
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603003.939894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kb-0003tI-2z; Fri, 15 Sep 2023 11:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603003.939894; Fri, 15 Sep 2023 11:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6ka-0003qd-Vm; Fri, 15 Sep 2023 11:12:40 +0000
Received: by outflank-mailman (input) for mailman id 603003;
 Fri, 15 Sep 2023 11:12:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6kZ-0002xb-4h
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:12:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6fd21d4-53b8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 13:12:38 +0200 (CEST)
Received: from DS0PR17CA0020.namprd17.prod.outlook.com (2603:10b6:8:191::27)
 by PH7PR12MB8427.namprd12.prod.outlook.com (2603:10b6:510:242::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 15 Sep
 2023 11:12:34 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::40) by DS0PR17CA0020.outlook.office365.com
 (2603:10b6:8:191::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:12:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 11:12:34 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:12:27 -0500
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
X-Inumbo-ID: c6fd21d4-53b8-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLu1JnPLyb2+xU5JoNHWlZFepPe9qnHKo/I7v3YOB/CpzRSWa8F3DL9aKRDy8DFH0BLEK1617GSJxr8lui175M7gBAbQTRlRTL/tEQtaqbA2Z+RSDORwho7V+MUqp411e7hUPNcbLjCU6FVEOzKZCjbGgp7EDt+yRI3NSH6x3srAV7WDxGd/cfcBQyIm5ceTwmgPqn0OovahDuafFqd+lx1W/xBH6vdGaKMnVh72c1YBXV5VmUlEBoO7vMrZw6d84/ohFoqHefD69Hq34Z0t8aYyNY5Bbzax4402bI2lwJZXAcFosNal0+3Q5NoszYRl0jc7JzOTTgoOfhftghMNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr3RAYeUheQV33MWIVHkExHj4snVaxR01Xv6+3mdj/Q=;
 b=MwlmwrpB72kgTs5A0HmocC0X16sXyuqf786Rp9/DIlpk9YwDzSzDWpPCCGHMc5PBdxo1AJKEI3TrW4/MuEqJgAmeScUD4L1qhWljXKkipwr2Hb3uXCU7p2HjCU1YDHt7d14K0B12sGFhoqmC3w01nRR9/BiCDSK7KwmIcWWayjh74YmDhWOXMtowTYP86EgXP+OsoTJeqVozhjqMY+dyuPfcu6OIEdNSJrPrHMGP4cQcf4bXmKRlGRijgSVDOgnR9AnF2p5bikGchG1daRq3kPH3JcT/o0K76GBL8TnN/xoCXizWKx1XxU+rMNlK0L8MBicYfaZ8QoH3LpuK3z99DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr3RAYeUheQV33MWIVHkExHj4snVaxR01Xv6+3mdj/Q=;
 b=FLwnviJVEHgsy7qao54dFWJLzRtPhy7bU54ld0b264aitTa/T7DsDJIex5vAq0tblEpJrBzNg+bKGaUbfpHVRGrkvNasFJ3jJiZP1aB3+K2F5hpxgofsA12wO3af0kmwlXSG9yThTiCWMXerPB7oTLHqaaQ5tZK5r9GBDIyK8vw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Antonio Caggiano" <quic_acaggian@quicinc.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, Albert Esteve <aesteve@redhat.com>,
	<ernunes@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v5 03/13] virtio-gpu: hostmem
Date: Fri, 15 Sep 2023 19:11:20 +0800
Message-ID: <20230915111130.24064-4-ray.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915111130.24064-1-ray.huang@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH7PR12MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 92af8e65-8bb8-411a-4b71-08dbb5dca952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T/8zGYpfvegyyEORgClCllv3L4xzWi2bSuOpAY2WctE2jxVaBKT38l8bzchHrtS3e0IHZe7ntiNk/1swDXj6BPEZYMJB8D5yXfL/ihdmctJXk9n9o5AMm5/oV+gjnHokzc0a35jYfqfe4Q6GlQYscp5DahQfNRRuZh0ggO3Yg1XLr35Npo4gQ74EtUXOd2tdUW+5DX1BlcUr6HHE+9vFK6C3jLPSik35lkH4quVYl0uC6YCUh7QY/6FpAi15+yz9/goAIbGGpwtlAWWpYiHW1OeW+uEqjR4PpLDhKUSD6GUoMM6iQ6LqYbrOemy6OeLNfSAXtrzJ6gV7iZHQNKTVg2Wy6YFuHsRhKj8YEdU2o8Yzc1JsajBFNDQeVYMH5F4AYS35tWeVJu4UutAK0jOcZmAyvm7cwf35jt2DT3G+4wTsS4OM35IetQC1GCdqlKRKoKAACgisXdJuJVtdZIsorle3noYRb88r2xxgEZRhYD66m3hy5kuTliqgSqdSmOs/1sP6ibySHzezn50qd2QIwfus0ek/sEQGnHdXEVv521MmkbOgfhaAvDNS3fPDWV0geehO+tNR3s3VY5ZYbKS5VmzuXFHq5rTIa/Qcdj79dCCrAUvlFa1kpcKANt5rZZ7CVRZKPQcBmeLx1hstX+8dQXKtkTa0nS9s/w9SDHUPafArPjqUYy/on1wRiIxlPufaNNNJJCs8oAKlpDJSfWnLpk4dWjosctFkJ/yidcmxKGZf7l75iZ/JfBbRRmTDxnMwa6o5x1O7kacj7vdaNvUvLVUE7cYnkbvVbEGU1CmtKrM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(82310400011)(1800799009)(451199024)(186009)(40470700004)(36840700001)(46966006)(8676002)(5660300002)(16526019)(316002)(54906003)(70586007)(110136005)(70206006)(4326008)(2616005)(7696005)(40480700001)(356005)(82740400003)(921005)(81166007)(8936002)(1076003)(83380400001)(426003)(336012)(6666004)(41300700001)(26005)(478600001)(7416002)(47076005)(2906002)(36860700001)(40460700003)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:12:34.0451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92af8e65-8bb8-411a-4b71-08dbb5dca952
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8427

From: Gerd Hoffmann <kraxel@redhat.com>

Use VIRTIO_GPU_SHM_ID_HOST_VISIBLE as id for virtio-gpu.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Tested-by: Alyssa Ross <hi@alyssa.is>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Huang Rui <ray.huang@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

This patch is already under review as part of the "rutabaga_gfx + gfxstream"
series (already in v13) and has been included here because of dependency.

 hw/display/virtio-gpu-pci.c    | 14 ++++++++++++++
 hw/display/virtio-gpu.c        |  1 +
 hw/display/virtio-vga.c        | 33 ++++++++++++++++++++++++---------
 include/hw/virtio/virtio-gpu.h |  5 +++++
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 93f214ff58..da6a99f038 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -33,6 +33,20 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     DeviceState *vdev = DEVICE(g);
     int i;
 
+    if (virtio_gpu_hostmem_enabled(g->conf)) {
+        vpci_dev->msix_bar_idx = 1;
+        vpci_dev->modern_mem_bar_idx = 2;
+        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
+                           g->conf.hostmem);
+        pci_register_bar(&vpci_dev->pci_dev, 4,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                         &g->hostmem);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem,
+                               VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
+    }
+
     virtio_pci_force_virtio_1(vpci_dev);
     if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
         return;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index bbd5c6561a..48ef0d9fad 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1509,6 +1509,7 @@ static Property virtio_gpu_properties[] = {
                      256 * MiB),
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index e6fb0aa876..c8552ff760 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -115,17 +115,32 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     pci_register_bar(&vpci_dev->pci_dev, 0,
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &vga->vram);
 
-    /*
-     * Configure virtio bar and regions
-     *
-     * We use bar #2 for the mmio regions, to be compatible with stdvga.
-     * virtio regions are moved to the end of bar #2, to make room for
-     * the stdvga mmio registers at the start of bar #2.
-     */
-    vpci_dev->modern_mem_bar_idx = 2;
-    vpci_dev->msix_bar_idx = 4;
     vpci_dev->modern_io_bar_idx = 5;
 
+    if (!virtio_gpu_hostmem_enabled(g->conf)) {
+        /*
+         * Configure virtio bar and regions
+         *
+         * We use bar #2 for the mmio regions, to be compatible with stdvga.
+         * virtio regions are moved to the end of bar #2, to make room for
+         * the stdvga mmio registers at the start of bar #2.
+         */
+        vpci_dev->modern_mem_bar_idx = 2;
+        vpci_dev->msix_bar_idx = 4;
+    } else {
+        vpci_dev->msix_bar_idx = 1;
+        vpci_dev->modern_mem_bar_idx = 2;
+        memory_region_init(&g->hostmem, OBJECT(g), "virtio-gpu-hostmem",
+                           g->conf.hostmem);
+        pci_register_bar(&vpci_dev->pci_dev, 4,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                         &g->hostmem);
+        virtio_pci_add_shm_cap(vpci_dev, 4, 0, g->conf.hostmem,
+                               VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
+    }
+
     if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
         /*
          * with page-per-vq=off there is no padding space we can use
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 8377c365ef..de4f624e94 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -108,12 +108,15 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
 #define virtio_gpu_context_init_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
+#define virtio_gpu_hostmem_enabled(_cfg) \
+    (_cfg.hostmem > 0)
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
     uint32_t flags;
     uint32_t xres;
     uint32_t yres;
+    uint64_t hostmem;
 };
 
 struct virtio_gpu_ctrl_command {
@@ -137,6 +140,8 @@ struct VirtIOGPUBase {
     int renderer_blocked;
     int enable;
 
+    MemoryRegion hostmem;
+
     struct virtio_gpu_scanout scanout[VIRTIO_GPU_MAX_SCANOUTS];
 
     int enabled_output_bitmask;
-- 
2.34.1


