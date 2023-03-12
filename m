Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BA6B63F5
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508906.783874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvg-00024d-8L; Sun, 12 Mar 2023 09:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508906.783874; Sun, 12 Mar 2023 09:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvg-00020l-2N; Sun, 12 Mar 2023 09:23:48 +0000
Received: by outflank-mailman (input) for mailman id 508906;
 Sun, 12 Mar 2023 09:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHve-0000RV-63
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:23:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9548a0cb-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:23:44 +0100 (CET)
Received: from MW4PR03CA0084.namprd03.prod.outlook.com (2603:10b6:303:b6::29)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Sun, 12 Mar
 2023 09:23:39 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::3b) by MW4PR03CA0084.outlook.office365.com
 (2603:10b6:303:b6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 09:23:39 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:34 -0500
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
X-Inumbo-ID: 9548a0cb-c0b7-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XS2aac624Ci2RHAwMjs+WlZ6S6UZSLq14rltGMqj3n+qUNMLKWTTXVvjL7C8NnMAQQYK+zvSarpM/y4Qhxhm6JftPSoU5kbiBdqJp/dh+g76xiq9qUaco8XcFyGzq5YAszPOWM/udDMZw+5ObzOlyQ3S2SpUyWbrA19XEA7+9oH+K3flHZQuXPjDLZRxlhrX6f5hmPGFw2FCQ+KySEbVgMzDmRXwboy7GvD7t+TrHxWVaIPGuJgH9tdPzL7SORrXPm1Jj8oFlVAIxSQh/XBTiGSZXgC9wrkLxTPcpbTooNHiUuWyOd5RzBd8nA07QzIWQV99ED7f2b8/EFzMCIpvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCmHaKmXg9SrbEHIXMRB80SsoLtzr4tJodZe9x58TXg=;
 b=ETXVdo7bxkVGbplS73UjCe/J1H+ZK0uPY56+iNPw0opMuhdjXWt90QSkr7sHV04kBgQPetoXifr871Lu+eVlFzRqku0Xf9u7zD1FTomQaKhcUCJo8q9WcoVp7S0pg/NHM7gxPnw6PrHZVhFGkQ0iA0nr6d85X9Zx5uWDA28hAJc3XUvS9y6/wBzDxgp6aFdX9IeKcjKQLNv5F19ZBoxvT+tQoweXtB2Qr6288moQgtdsA+HPgPgeQHJlfOo9uzrO5UGXxzoomofWvYNqA5J0JxQ5FoOJ+jNmR/yaHU/zkHvBBdGJRXFkxUpy6EYPQR0HJDS+eL4HKLcFR/sgj8p1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCmHaKmXg9SrbEHIXMRB80SsoLtzr4tJodZe9x58TXg=;
 b=UZLRhEA7cQPCx0E8GIe2Za9SzE49d1XSebp6EfWK+IorbbWhmvWCBD5p3mivMwOrvG55ILDPoPiXmU9G5Wxtch11591uf/30L2Ro7hzM+WweXcUOrOV0OG3rK3elxzXro9faQR/3WdmDUwyp9FV7dp55iELXJq0ynu4FEoPWRwg=
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
Subject: [RFC QEMU PATCH 05/18] virtio-gpu: Unrealize
Date: Sun, 12 Mar 2023 17:22:31 +0800
Message-ID: <20230312092244.451465-6-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT005:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d6344b-0d60-4e24-1762-08db22db772d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+DXJ5B3oGAwQyhKdNp79mAO31SH9seTUCYvoi0kV+PfBZ/x9JWBT7m09Y6BaV0Zt9pp60RROleYql8AIARtX1V2QTpXmUIAYicDd7pzJyEwl+xibof1kiQENsOH1G9FtL2HVX72uHaiBwYGRTQ+nAwJIaaGdx3bbnXDNRZWi/tZUJe3GDLvWg2vP0YJAlOryZ4buvtHMHOuXm7rtxRhESHzn+U0zqmFnJEsvpzPjqXH4kKpgOgT1GIl80yGG5oL4+DLQ5pO6Ipe8OS/qLLQ+DX5/4Eot1fzr7y810aCyhqAX7rmaFfUYWMtSa1vVFD9+EUwObTk0kXt1FTlAMFwR0lEqhrWcAEAryBSIqOoEybKXi0kZ4ZURBjurK25zhB0jczgGR7B9SdPeZf1Qgj+VJOfQGx1FvmRlcQ7AWYNES9Ctw1R8gM9oDczNMLVYEgYf1VAZBjSGHq1f4qb/xkvk4YZc65LT28bsmrp+41Ml8rvhf3LmX5yDl2+87+dn6R9HBd9OfKCabUBWWf+3+RZ4SrvhzOX7F/niiLdNoKE4N9+nHWggO2CMFw7lwMJ1m7vp2tyEoBH8skl+DSEWjTkMMe3vP7yyOma4v+apJZktGCRF6lPiV5MiWFv9784SUtoOBQveoeqlMkFeqzPeTJTXHowZ/mPupzpTJWg06cXUb0uEEAtZIoPzcfWDFgi3gFe4ssimJofU2D+25qe3ElFS7T3Hln5/ChnT6HeAawbmziKHqbMUqOfmNRGLQCACe77r
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199018)(46966006)(36840700001)(40470700004)(6666004)(7696005)(83380400001)(110136005)(82740400003)(316002)(81166007)(478600001)(36860700001)(54906003)(82310400005)(16526019)(186003)(8936002)(40480700001)(40460700003)(26005)(1076003)(36756003)(5660300002)(7416002)(921005)(356005)(47076005)(8676002)(4326008)(336012)(426003)(70206006)(70586007)(41300700001)(86362001)(2616005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:39.4120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d6344b-0d60-4e24-1762-08db22db772d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Implement an unrealize function for virtio gpu device.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-base.c   |  2 +-
 hw/display/virtio-gpu.c        | 11 +++++++++++
 include/hw/virtio/virtio-gpu.h |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 6c5f1f327f..5cb71e71ad 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -230,7 +230,7 @@ virtio_gpu_base_set_features(VirtIODevice *vdev, uint64_t features)
     trace_virtio_gpu_features(((features & virgl) == virgl));
 }
 
-static void
+void
 virtio_gpu_base_device_unrealize(DeviceState *qdev)
 {
     VirtIOGPUBase *g = VIRTIO_GPU_BASE(qdev);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 11f3e56013..62239dee0f 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1350,6 +1350,16 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->fenceq);
 }
 
+static void virtio_gpu_device_unrealize(DeviceState *qdev)
+{
+    VirtIOGPU *g = VIRTIO_GPU(qdev);
+
+    qemu_bh_delete(g->cursor_bh);
+    qemu_bh_delete(g->ctrl_bh);
+
+    virtio_gpu_base_device_unrealize(qdev);
+}
+
 void virtio_gpu_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1448,6 +1458,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
+    vdc->unrealize = virtio_gpu_device_unrealize;
     vdc->reset = virtio_gpu_reset;
     vdc->get_config = virtio_gpu_get_config;
     vdc->set_config = virtio_gpu_set_config;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index d1ae97153f..ef02190f97 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -246,6 +246,7 @@ bool virtio_gpu_base_device_realize(DeviceState *qdev,
                                     VirtIOHandleOutput ctrl_cb,
                                     VirtIOHandleOutput cursor_cb,
                                     Error **errp);
+void virtio_gpu_base_device_unrealize(DeviceState *qdev);
 void virtio_gpu_base_reset(VirtIOGPUBase *g);
 void virtio_gpu_base_fill_display_info(VirtIOGPUBase *g,
                         struct virtio_gpu_resp_display_info *dpy_info);
-- 
2.25.1


