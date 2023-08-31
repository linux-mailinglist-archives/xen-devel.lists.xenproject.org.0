Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E312878E97A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593571.926584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3Q-0006BR-Pj; Thu, 31 Aug 2023 09:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593571.926584; Thu, 31 Aug 2023 09:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3Q-00067r-Ml; Thu, 31 Aug 2023 09:33:32 +0000
Received: by outflank-mailman (input) for mailman id 593571;
 Thu, 31 Aug 2023 09:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe3P-0005pR-7c
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:33:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eab::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 721481a7-47e1-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:33:30 +0200 (CEST)
Received: from MW4PR04CA0282.namprd04.prod.outlook.com (2603:10b6:303:89::17)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 09:33:25 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::d) by MW4PR04CA0282.outlook.office365.com
 (2603:10b6:303:89::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 09:33:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:33:24 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:33:16 -0500
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
X-Inumbo-ID: 721481a7-47e1-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmGKbokJE3I/LvawAsKudOotQKS6vaWaPKJj0ZTkYviyjVl/h7l/JmU+NLV1ye6GuZVswNvl8uidVPgiAb4PtWiPHzuFP9dA6fzlwL8oL7v8HZlvA3gUNZiinl9Qd46F8Z8aoVmJMTOIBXv1L1aF9u/fJfWkjCq2DmqfzFwVK7xaoEFBccU9pKUuFUhXhIZnNrFcqPeKlbO4y3e2Czgdv/GlUsChCUvL6EJFDxAOdDKGcjorG7f9Q1Mt6NEBwFLommS8yIcCHEHnm20X7hxXtdgNZhBI+W0LZzZq7+au9V5YxD/nmhf+rD+jNUJRar7xrE+f1p4HzGPWtW7hC+zRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGX5Hj5sdF72tVBTXUh0R/Xrx3cM3xMJ6mAZRIdjtqc=;
 b=j3QXOsVo/ACt+8iLMkJl0iCAFr8peMS5SwFByj8MNbH+f7kgjITiocAyDVwWP8I8MQzYsgmZ+zZLKq/3LV2rzvT67wdHxby3tKQ1wdgQ8KzYhMwjCabx0Fx1+3qvvDRgJgPoB33JfpBVY9tXKiyuZy7iNKUGBR/YX4NvehOXbu3lbbGBja69pZUyzm9yHWBuj/gde55MVbaH8NJwdcVy7ySeLTsLoZvvZIjkQYh7VuRN17xFpWH0VMgOHGhftkJoK5rUiQXL/g1lAbhjsX1lTwCgEpLkZBPM6aRMNyKTtj+gEvXFFAtyvY4QiLEKcphIYtAJqfe7wTT4NSSRHD4PTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGX5Hj5sdF72tVBTXUh0R/Xrx3cM3xMJ6mAZRIdjtqc=;
 b=YwB6nf1L8l/1352pdfJp0dFTsUvmZePO9JK10zfwXu8ZUD5/xgYacVPEHyLOJaQOGDmxGkYH6mgfnyuL0HDpEnoPR83bQ/dfbS/5sCv21Yn2ratqQar+UPjcvdATCwmyobVICHXROUkqMu4AZDSO3hmpT2Zv+SOJiOdWORtJhgc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Akihiko Odaki
	<akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v4 01/13] virtio: Add shared memory capability
Date: Thu, 31 Aug 2023 17:32:40 +0800
Message-ID: <20230831093252.2461282-2-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831093252.2461282-1-ray.huang@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1e4510-23d3-42e9-bc73-08dbaa0552e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4obXY5+hFRwRqvExNyC5HwgCjx0eSObM6qV/CZ7GchSa8bNK6BGodp8X5m1r360kw6F9in3PSqmae2ndUZqlGOostOfbSWYSIkvHk5MFZrOqXr7wp+9jt2fKS6GsIAmX2tI0PSvK0MWVtBy0DEgBR/mbA93LNPYwJioP8ryt4g/fdGMqJxJG5JTz5VL86McgQ5Bw8AdH38DUg0cYF6k9RBJvDaN6DKl/QXnLR2AkkwXgH4qbslZOcN1qQ01XXjsoezt7V7CJZaboSwP1fYQzJgPTGHtGnlPUqnwzMo0lxU1tCw7UE/2NltFlVbhmofOfKRhZLOiPDnm7dDrs1TwNuSIc2V147oi8FrG9RAbX2uYfnlKXXDZ2qsdtPEzVp/38470mQ9/0CtckgD4PJ0vXn3Ld+4vWA5r/kYGBqd+qMTXMOYkyvQIa3pLPyBKMi/DsnJFCBndopO13VjStUetrvavkoDnlgJAAn/SH9nFu5jn0VS5AGReO9lNs/R/lZjY02M2asZ88TNA1A12Pos+UCFdp2WS9naGIPdj8P73MRXbCwOAsDhzSSs1vxWDeM48XES0wpMMLhTRoPcWWvWcyaq4EcG+hFTsvD734HMLsZGIXs1+XXCwDXdMoh4UESZBEWUaONWINdp5Fv1btY2JQFbTSma2Ufe/3ji5AL3iUmpja89yUWR4GSndLZKncbM4A2QyX4/U/4N2TFHaSxqM+yZP3/Al6MXRoCoXeM7XIHA8r5GozC5VYbQxdp9Qo3LFq3/QJvTFAR/Up88wrTzohg7IHccdpNjyCQyG5WcIfmSFSIC5Glahmq/CvT0PHm+OoLFKCqsNx7UCeY2R9qvmKXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(186009)(82310400011)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(70206006)(41300700001)(8936002)(40480700001)(47076005)(36860700001)(336012)(8676002)(4326008)(478600001)(6666004)(110136005)(70586007)(316002)(16526019)(2616005)(426003)(1076003)(54906003)(7696005)(26005)(2906002)(82740400003)(356005)(81166007)(921005)(5660300002)(40460700003)(7416002)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:33:24.3865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1e4510-23d3-42e9-bc73-08dbaa0552e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

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


