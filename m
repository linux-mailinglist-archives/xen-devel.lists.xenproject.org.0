Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBB6B63FA
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508912.783895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvo-00031O-27; Sun, 12 Mar 2023 09:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508912.783895; Sun, 12 Mar 2023 09:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvn-0002xM-TD; Sun, 12 Mar 2023 09:23:55 +0000
Received: by outflank-mailman (input) for mailman id 508912;
 Sun, 12 Mar 2023 09:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHvm-0000RV-Qa
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:23:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4d4dfe-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:23:52 +0100 (CET)
Received: from MW2PR2101CA0009.namprd21.prod.outlook.com (2603:10b6:302:1::22)
 by BN9PR12MB5241.namprd12.prod.outlook.com (2603:10b6:408:11e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:23:49 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::7e) by MW2PR2101CA0009.outlook.office365.com
 (2603:10b6:302:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 09:23:48 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:43 -0500
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
X-Inumbo-ID: 9a4d4dfe-c0b7-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnijveTocjcwkKU/226Umxh92W9oXNd1EKo51GnoFFYTgPUqYE7QTVlOjTSU4VvFKXigMoYputZWjlnK9D+BhqCMzJSBfC090RVrfkbSlwrPuAcgZowPvgk/it5T76ZOe/5XeehCSsgoRPSg72Ubg/7TsMgantkHqElZ6IlccetrRKKhVMIl2WLh16JNGy1iZoVCsw0BR6CUh+PYMNJRIYEXRkDRsV8MReYqlIu+b/asFdX0R6MkXfT0fg+pcK5dZv6ZXUWIMrQnLMscQAMATGaIrl3BgnoB4NeOVEOIDZ3Ii4fbfN1/jD7FX7SRWRHzIc1RuO5vDp5mW9gYLv8jLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZIqK1/KnlRuGDUanWJgMYgPikWhZgF+I67bgQG+lYU=;
 b=M3P2pHxsocrul//TmIKjRXUZcyJwsoLCVuMEgnUIrjfPbbJfYcUdrOttGx79CmNqsNG0vUORxfz9qWddjtlryqCcVa54l0WL2JiRbdRlrB93GMlc0tJ/HWii/8k1XQQqXYVUfvLG34UM3DVFsgiDidhqVjZEy87mZjta0WVvKU5by3p+dCzLoK3LyOrjCgd9EAHnfFBCiQrmIqW6DGIZCHcPUTaTiB/59wY2UytjkKEgS5rjI87ffd+csh4vleBUfjDyUisTqfOiwKmkjunfyp+QXO52Pn6k9STYG91A7gGBrNrZE6GdxlFFBmg6Il5FIyJNreRBGwKhm1QAwD2VRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZIqK1/KnlRuGDUanWJgMYgPikWhZgF+I67bgQG+lYU=;
 b=yXPShSkTrYHgmqV9Xi5IKwmAFHU0zHmQoWA/zlpD/4oGznyGGfqfN3/PIN63andPVauvmBn4JPvVL3MrQziFAeIPeNuc9jF2DTIh498p0WhcqCGH1xVJ3dIcEH6MvcoOo2oFIeN4j26vPhYUO9IUR74mL5Jrfx4FC9nyKAwdhus=
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
Subject: [RFC QEMU PATCH 07/18] virtio-gpu: Support Venus capset
Date: Sun, 12 Mar 2023 17:22:33 +0800
Message-ID: <20230312092244.451465-8-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT016:EE_|BN9PR12MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 52491bac-ac24-4ea3-8a86-08db22db7c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WdQ1AuKBeSlhb8d61TlGsEWCIKEa8mPLYyLX4rX0qs+0f1AffWE0doOt5JzyNxh2+pnxjguJJO/aW7zUOw6S+9yuYi5fYMvsfsbKCYTaXwVsZMgCRbSDdnIXzqPtqF27hmBVOcoQCPpHOdz5yOoyhGYp3Pp+q9nlnb113skkVulMvBtBqLMw3raz3HilZ/E8bYCIpYiSpjkkJmGmsh7W+ZeT8ZIoX6G1Z2Cv0zJwACDKg1ntJyJlNvqHSRVjH6/q4FSFGR15sptxuc8CtK0bc+aFhNY58wDmsaMf4Y0QKWcRC5Yd7oCyCU0fJVW49O6uLXPkgjKmW3Y5WsvjFNSRysk1ynF0HHQZDewp/GsgzdS3jvS/WeuraSL3O8/YQy/JC2q+1WNAGGUj2HfzLDlbYY4Pyv0hHHlexqrd4KrJyInb/Ll+eAUA30F9Eg7qLFg/zbmgnvNMUGNWcSNNJgIbk65bKt++xvQNpEQ9/PWkk2298UVMRN43aim9NgQp/ECjvGlvk7tXTUFLWs/Gq5GV6+0blrT4/czXNAp91N7JdK9SXyh7S0h2Pm9UnMYaBAJmdg3zwe042/dYRDr6SfGHeFc961I7ZZxtRNvIq4lyS7dqGdn2c2k+ca/4BiK2Bkn07jzQ80WEJ6NHrO+HwTPD8KylNcU7l+vouXysujbgt0ctL0S6S+FSJaQu7xexPQ8EmJFpUtaSUtogXlKvI/Hj/8pWYrHDNe4NxMXlT6BdtsSovWVqmWpJZtOM6EKHbDl2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(921005)(356005)(36756003)(86362001)(36860700001)(82740400003)(81166007)(40480700001)(40460700003)(4326008)(70586007)(70206006)(8676002)(8936002)(41300700001)(110136005)(54906003)(478600001)(316002)(5660300002)(7416002)(2906002)(336012)(47076005)(426003)(2616005)(83380400001)(7696005)(186003)(26005)(16526019)(6666004)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:48.1736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52491bac-ac24-4ea3-8a86-08db22db7c6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5241

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Add support for the Venus capset, which enables Vulkan support through
the Venus Vulkan driver for virtio-gpu.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-virgl.c               | 21 +++++++++++++++++----
 include/standard-headers/linux/virtio_gpu.h |  2 ++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index a3c388f907..fe03dc916f 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -388,6 +388,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
         virgl_renderer_get_cap_set(resp.capset_id,
                                    &resp.capset_max_version,
                                    &resp.capset_max_size);
+    } else if (info.capset_index == 2) {
+        resp.capset_id = VIRTIO_GPU_CAPSET_VENUS;
+        virgl_renderer_get_cap_set(resp.capset_id,
+                                   &resp.capset_max_version,
+                                   &resp.capset_max_size);
     } else {
         resp.capset_max_version = 0;
         resp.capset_max_size = 0;
@@ -817,10 +822,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
 {
-    uint32_t capset2_max_ver, capset2_max_size;
+    uint32_t capset2_max_ver, capset2_max_size, num_capsets;
+    num_capsets = 1;
+
     virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
-                              &capset2_max_ver,
-                              &capset2_max_size);
+                               &capset2_max_ver,
+                               &capset2_max_size);
+    num_capsets += capset2_max_ver ? 1 : 0;
+
+    virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VENUS,
+                               &capset2_max_ver,
+                               &capset2_max_size);
+    num_capsets += capset2_max_size ? 1 : 0;
 
-    return capset2_max_ver ? 2 : 1;
+    return num_capsets;
 }
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 2da48d3d4c..2db643ed8f 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
 
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
+/* 3 is reserved for gfxstream */
+#define VIRTIO_GPU_CAPSET_VENUS 4
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.25.1


