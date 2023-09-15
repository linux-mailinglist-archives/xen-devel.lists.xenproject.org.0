Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E17A1D27
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603001.939875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kR-0003Fi-GM; Fri, 15 Sep 2023 11:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603001.939875; Fri, 15 Sep 2023 11:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kR-0003DE-CU; Fri, 15 Sep 2023 11:12:31 +0000
Received: by outflank-mailman (input) for mailman id 603001;
 Fri, 15 Sep 2023 11:12:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6kQ-0003Cy-Du
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:12:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e88::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf7edef3-53b8-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 13:12:25 +0200 (CEST)
Received: from DS0PR17CA0015.namprd17.prod.outlook.com (2603:10b6:8:191::23)
 by SA1PR12MB6821.namprd12.prod.outlook.com (2603:10b6:806:25c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Fri, 15 Sep
 2023 11:12:21 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::44) by DS0PR17CA0015.outlook.office365.com
 (2603:10b6:8:191::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:12:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 11:12:21 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:12:15 -0500
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
X-Inumbo-ID: bf7edef3-53b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E55vYZbsdVBrxQdTf4MB/Hg2hxFZ6Phe01WGgDLee/LTUGbQAhQD5faL1zhwRUpoYoKoBmB0zzvDL5qoFEftPdNnmzXwveu/8opLKSUo0cvZdq5ZbgU/7XfcXU8DjNDj4A3TIWPruzE9tuZ+Mm7VqBrPZCjcv/b7bPIxdrDYSz6t2n4z7B7MieNjrQRX23n8Co6ks6Ky6I0wUppbdRq4nD+TxjH/n36U2jRNrt/Re6BH5zfz7lsV9kXxY+sMhmdBxsYF2LQsRcnMdu7WkEJxftDGx+Bca+fKxO+/zjF1CerVD2SF3JEW0+xL+fN2/NbpoxLiam/APpRH+VK8tczKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGX5Hj5sdF72tVBTXUh0R/Xrx3cM3xMJ6mAZRIdjtqc=;
 b=ZcQdBVun4R/2Yur+xI8aPKRV8EC8aI3jsO2sxhMFCYfHl4POaJr1xMTss5cSki/IPYKR5z2IysgYI/NhrlAEe4Q7gMVME+aHIDQk09NsnZ8jWiV4NKTngi5TzaZ1HBeqrc8mhUfVFYm+UbQy0U/aOu49uuCBON0+YMP8DdsaviP79EUcdPOLD++dJbPPxqWCcN9E8Dw1SDxG+beh0QpdjOz4v+25tKLgmXRPKiLgQaJH/9wtJYpQC05/gcdvqZ3MOs3ko/gY4vayLW1hV/V8S+CGVfTXnBdScaanhQZ0aoChgSko+A1sBWOz8zC1IpqdkkY60T5zXIFRnIMZN6o+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGX5Hj5sdF72tVBTXUh0R/Xrx3cM3xMJ6mAZRIdjtqc=;
 b=QdHUbyIT3dLtAOEbB03ZeEpKOltvTm6JJXGnQEcOYJEcDQVojUK4FzbdiZiABJvo7oNkvYyZDsVGWqRxeKn61I54zneVHbuYPw1ngbFzigfIcqlgArPxgbqQapZ04yx+Q94iuu2hhPaAfu/UlHkEwqxjZFAVvlmeOWzthY1Ezp0=
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
Subject: [QEMU PATCH v5 01/13] virtio: Add shared memory capability
Date: Fri, 15 Sep 2023 19:11:18 +0800
Message-ID: <20230915111130.24064-2-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|SA1PR12MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bd9e2f-f893-4c7b-ead0-08dbb5dca1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	148f8cfTnr0zV2+MVq56MzKY/rrA52TUIxkrYXKRJedW1xegN+Y59iHW1xT0X2E684pdJRBsHpz3BQIs7XITbXL1GAjxJNehgDus85aNp/1NprjyZmHfpkUw6KxP5vCIXJtSoF0Cr2HHVYaFT3owlK9zshQI1w3yk3bQqzx3LriGu/mftprQvlKUCoT4wUwvAXQroTGdKJObT2mFF0TJxHFk2hEkImR8vFTNjEPP5hIDn63hwr/2wEGnqIA7GUWwKyVvrOy+UYZ5SxigaQtsqyFHv+ac4+c461Plzg08WG0+H6Xtj/8nH7sFuY3TSk08QZGtg8UHiZYzUIw0oFtesNuUE+H2OT6mSC/gM0LnpFXczbU/IO/jrlpWJoriyIeK7PvZCI7x4L1H20eWfsPo7fEbGPLMSXCVxRBl+uSL42PkLJuDTt8CkHmT+sBN3YCfFwGQS+gV+1k7aOmQtcGF4QC1ZbaHfxfNgdmVxav0+Wn6C4GMtkH5hu75NReD3vQWqFVyJbrOfNWPEJd6nGVFxGlpsDRuBtJVw6M4MB++KV634q82y5sQlADQEiLtw+9qg8y3fRHiXerl9g3wuI145wcd1kXQj0s2Y1aFw/bnXZ0IytyjHa/BRvxXqd7lyaOH9e/PE0Dy0p0nOsAEg9qXDkReKVKzxgw/+AoAW7tBrdC/vU7coPDpNgl3zWWg7BfCAEBRRCPs39Z5zK/eCqVsQr/Syc825udELPaCW7CFS3bQnjqSEQSv6RA2YjyaJaLLu2KbqYYBPHLBCX1NEPUYxy5QTK0OEogm1h6CdprpeYc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(110136005)(921005)(81166007)(7696005)(356005)(86362001)(36756003)(40460700003)(478600001)(47076005)(40480700001)(82740400003)(36860700001)(70206006)(2616005)(5660300002)(336012)(16526019)(426003)(41300700001)(316002)(8936002)(4326008)(8676002)(26005)(54906003)(2906002)(7416002)(70586007)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:12:21.7012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bd9e2f-f893-4c7b-ead0-08dbb5dca1fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6821

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG' to allow
defining shared memory regions with sizes and offsets of 2^32 and more.
Multiple instances of the capability are allowed and distinguished
by a device-specific 'id'.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Tested-by: Alyssa Ross <hi@alyssa.is>
Tested-by: Huang Rui <ray.huang@amd.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

This patch is already under review as part of the "rutabaga_gfx + gfxstream"
series (already in v13) and has been included here because of dependency.

 hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
 include/hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index edbc0daa18..da8c9ea12d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1435,6 +1435,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     return offset;
 }
 
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+                           uint8_t bar, uint64_t offset, uint64_t length,
+                           uint8_t id)
+{
+    struct virtio_pci_cap64 cap = {
+        .cap.cap_len = sizeof cap,
+        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
+    };
+
+    cap.cap.bar = bar;
+    cap.cap.length = cpu_to_le32(length);
+    cap.length_hi = cpu_to_le32(length >> 32);
+    cap.cap.offset = cpu_to_le32(offset);
+    cap.offset_hi = cpu_to_le32(offset >> 32);
+    cap.cap.id = id;
+    return virtio_pci_add_mem_cap(proxy, &cap.cap);
+}
+
 static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
                                        unsigned size)
 {
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index ab2051b64b..5a3f182f99 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -264,4 +264,8 @@ unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
 void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
                                               int n, bool assign,
                                               bool with_irqfd);
+
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy, uint8_t bar, uint64_t offset,
+                           uint64_t length, uint8_t id);
+
 #endif
-- 
2.34.1


