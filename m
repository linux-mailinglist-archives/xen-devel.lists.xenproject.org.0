Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D76B63F1
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508898.783833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvP-0000Tr-PQ; Sun, 12 Mar 2023 09:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508898.783833; Sun, 12 Mar 2023 09:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvP-0000Rp-MR; Sun, 12 Mar 2023 09:23:31 +0000
Received: by outflank-mailman (input) for mailman id 508898;
 Sun, 12 Mar 2023 09:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHvO-0000RV-Rm
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:23:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a82f93f-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:23:26 +0100 (CET)
Received: from MW4PR03CA0315.namprd03.prod.outlook.com (2603:10b6:303:dd::20)
 by BL1PR12MB5351.namprd12.prod.outlook.com (2603:10b6:208:317::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:23:21 +0000
Received: from CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::7c) by MW4PR03CA0315.outlook.office365.com
 (2603:10b6:303:dd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT082.mail.protection.outlook.com (10.13.175.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.25 via Frontend Transport; Sun, 12 Mar 2023 09:23:21 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:16 -0500
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
X-Inumbo-ID: 8a82f93f-c0b7-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUxCE7eyuR8ZKzC6jQVUJJf8lEHwqBFeQ22rRNEsREPenq+303Q91LmB4YK5HNoJH1b4TmaQyC5nhjhgzRvsevZJSLfL66X5uzE5g1oOKZoUL96JglIajvdyO7pteZW0MGR0gBP3ij54F8UKzp9InNbN4khsppnr0nQd165mp4L0hQdmoHD6rXTM7QfXBndokfL5YllrKExcDVVgj0t5SO64S4LnKefA451FPbmh/sNZN/lgMTh2sdsXE9Qmzu1+i2WHjBeMTugI7OTA7S/dbVpcS8OIQ/vsGBhO8WYFd2olDHYBYpZUFd7OR/eNbGtAYapsAMKEPIJ7boF8LsmZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MySP99NL4Cc5eNFlOLDdl3uxiv6CT1oGstfJsAE3Zaw=;
 b=EPJ6KKMRtHz443HHu2OKfl36iVa9458gL+ud6eLEKO13FeoyeHFpU1/TLGvsSrA4Utf3G7f1O2wjPLRoMbHdjmE97u6Z6nLtomTUS83RhsUPJq3k5Zpa/JJ6DFoTBtIfesBQC1uPkvPxsslNIBOd2lg9j1DhXeE5TArwPaOK6oRp6gRAfmBssYIMDpTECUnj+SmXmKyRJeW4YDISGtYVY3/p3bJe1pzJucnZL+DgfpqihQCkyD+ZNroKjzoS0SuW1vcfBgtNJMin6jufFIV3hDgTJfK/Iw7FBFU8rYtOTKLebQgsraoE7/99nV0Q0DjQ+YplFIMno1l705sUo5AV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MySP99NL4Cc5eNFlOLDdl3uxiv6CT1oGstfJsAE3Zaw=;
 b=AkTK3YLgnHy6VYr7v27eE2gkD/2YkkZi32WvIzit2W8IFAqo0ZxrHGtm3JgtZZB7ARIKyEh4YsAwvfpQ3qsIRNJmiGyCr+fJq+3ICuBkbQTSOjaOFSgZQGVg8xumId9U1vlkiF2NzXnZJImZGl+awjYoJu6kZcbQ3qwkTD02O7Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
Subject: [RFC QEMU PATCH 01/18] virtio: Add shared memory capability
Date: Sun, 12 Mar 2023 17:22:27 +0800
Message-ID: <20230312092244.451465-2-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT082:EE_|BL1PR12MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7f3646-c4a3-4231-417c-08db22db6c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GUUVhREe5AEdwl7j0EIEkBb3I6AML33ZQLUI9+NFxJRD3WLhcyhTToors9wdBlYTKApwCd7XmTlD5D2NCxzv2yBjVsl8ozCO0wyfXrINiFXUfr2kq5kMcTJmYc95u0VmklK88GsLXF+O4EDvWydrEsmXoRhPNNOWesVHxGHoz5zrrKGQxaL0MG7NCi/XxkoLDHGmlgevLDvbjM2uaO6VLfzWsfgj/GLK1YcqxbWRsz8wpnf57Ks3XKZh8XaARviE33twlXN5+oFXi+WAuRI4FyvhziMkvD6czfEd7eJLiOl1MS92n1ZirsTLRJZlPvq+hMGMPYjmRRbBk4cwf/idsZJr51XyYNXAaBfR4UWeP2D1T7ZzAvVPk6qo4jJ0FuDjsvc0N5DHhG1sojMmDAJ4cj1ujuban8Q7Irha+YCCMO+jfJGOxLBe1F1DpguwF039ZGxngTrbIq7u8CzybeKTpxsCagAZPaYRQtDGs1Cu6aKZQ3h/Hk/UaGUwmutc54PbE8DJWLTuCspVGiPkGEX/tZ2RoYrTqqTnhhmjGmWg57SHMkn3gjzBUtNoGjaQjhrBroiYXFbOTunJlFB1z/FzhGHhKCwMn1jXvnibzdSM6YWpNh1JADZuvcwB7ik+edczhbGE6gRqy+nabYmqi+Hpn9U+udnT3ipF8tpub5a4akml6wLs3gqsBLdIRdehjqvy/DLEtao0LGPiajuM4Ag9/uglbdA9x6/5uJWYCenzKKIdUShD5ZRjYOf9yPOGyLPD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(86362001)(16526019)(186003)(41300700001)(1076003)(26005)(5660300002)(40460700003)(7416002)(336012)(4326008)(2616005)(8936002)(316002)(7696005)(110136005)(478600001)(54906003)(70586007)(8676002)(6666004)(70206006)(40480700001)(81166007)(82740400003)(921005)(356005)(2906002)(47076005)(426003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:21.3973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7f3646-c4a3-4231-417c-08db22db6c70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5351

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG' to allow
defining shared memory regions with sizes and offsets of 2^32 and more.
Multiple instances of the capability are allowed and distinguished
by a device-specific 'id'.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
 include/hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a1c9dfa7bb..ae4c29cb96 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1191,6 +1191,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
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
index 938799e8f6..e67fe422a1 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -257,4 +257,8 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
 
+int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
+			   uint8_t bar, uint64_t offset, uint64_t length,
+			   uint8_t id);
+
 #endif
-- 
2.25.1


