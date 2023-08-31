Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFF378E9A8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593626.926673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeAT-0004Hn-1x; Thu, 31 Aug 2023 09:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593626.926673; Thu, 31 Aug 2023 09:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeAS-0004F2-VO; Thu, 31 Aug 2023 09:40:48 +0000
Received: by outflank-mailman (input) for mailman id 593626;
 Thu, 31 Aug 2023 09:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe4d-0005pR-2v
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:34:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eab::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e974a5b-47e1-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:34:46 +0200 (CEST)
Received: from SJ0PR13CA0105.namprd13.prod.outlook.com (2603:10b6:a03:2c5::20)
 by SN7PR12MB7419.namprd12.prod.outlook.com (2603:10b6:806:2a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 09:34:42 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::79) by SJ0PR13CA0105.outlook.office365.com
 (2603:10b6:a03:2c5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Thu, 31 Aug 2023 09:34:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:34:41 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:34:33 -0500
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
X-Inumbo-ID: 9e974a5b-47e1-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGjl2NGlswrqBZCj7671tYCOZpD2NuDesuEVau5Sp5XsAc0NcP9HYISnfeztfSmU+z3r65mEdPA540hly1Qlp3UP2MoXH7+mlOOPfX/ssbh1JgCkbMQ5rlDQaJz+SpD3VsBlAlkbtT1C7omLTy+SMa/HK1Ja8p1OqNJlbAbDK1ha1HJZYQg0dCJYAUpxdNw/47JB00CPWiVNrRGJd4c0oL9vm68yFLwaPwU1SrART6LGKH39CGWYZKIJCLvWkTTC5Ph1IkQ/gcP7WIGPYJX5+I69LdT72kicrJYRiiVXOQlEjVBJmdEtsU2riRot3/nII+4SO3ftSFcrSfIW3qDHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jKl0Cln6cyhAJBoLYKE6z9NzKJbaZOSW+kOo6d5qjw=;
 b=oB++OdzYAxAOLWwAQckIGiNZ9GA6SQM1L1YkwShr0FtJQn3kr0EtrnOR2/CFjdyhcnemxUMbrdZI2cwkj5iLX7Pu9GqIBhUatJhPz8ZXMOrhpJcR8whBqhUeB6BLp02LJjv8PjCdNS9r/M5xolYJ5yu4ge5XV2SyAfzgxJaUXdgmGq8qB4mzFRRwer3QFyqBqfE+78mDTirFLssYRgukuBSkcKQZ5KFlfcog+RdS67hSK5wiQCNwV2HoRyD+R4s5ZfVprb3WvXCsQ3d41mEIT4dx4D2wO5R13cqONO1V0UWxlC/e7m1cDTKjgvBnb4oQ0VT2nzp/dCukOt2GUCO9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jKl0Cln6cyhAJBoLYKE6z9NzKJbaZOSW+kOo6d5qjw=;
 b=mXF1xyXyPcKY9wWTofBEF3Tq3dRF03jDbPyyRRbf1hM322av227XY8oC2BF/emjr+omJAfcGTdMUnVugLF8mPg3SV8jTO0AccznJGOc61Fpjf1M9U/h3MnrVg3i73PWax8mO/MPkWrU94YFENxBDQoSDYnl0P1pCfOZuwpgSPD4=
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
Subject: [QEMU PATCH v4 11/13] virtio-gpu: Support Venus capset
Date: Thu, 31 Aug 2023 17:32:50 +0800
Message-ID: <20230831093252.2461282-12-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SN7PR12MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: ec34e4a0-b066-4d47-1f4d-08dbaa0580e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PD6SdGS+R700jXDVgrH0gg2uCJrEQY+Wy07I6QwbVMDEyuDFsXSg5sWCgm+zonTHCd6kxAFcfKDujVf2dwftmLVdon1v+/KX8aP8nhlIbR4eVmK8A7RNkgAaNfo7xTDUNMrF2WjlbYpQBQjA5PXHgaUdY8tKZ9VjYjv2FdNV1Ep206TN17rqz4xh+6oaHvUWdRjuGL/0Mo+cKG+YmSv/nDgayWnHR0LWEPZ67+0C2oOHHeRmkAJ7KY1wtlcyZjxq8xm6+jEj5SLoOyfyMdwT/iLrkii+QHcFQfLJFzIJGfIsC7v+tvW1IHyJHOA8PEftyjmCdFzDHjQhmreTT6ETmMuYV60BiZapTZxnvB1nZGsa/y6VMwuJTpWx9gQXI1hf9qiNCuKMdJf7cljUvV6O7bzaJA75jzHfp5vZ+jtVtQ8asZj0bU9QwOYrqhYfImUmY/nbo5dJnTuZne3RnRf5rOVQOWFKDuaNMGe+LhfPZBalfyO7kQUeywTHgFsnYWBWIXnO9bA/sKvbie5JV3mP9MfmY73IO6WPE6+GtoMpRdIWH0AkfA9zmhoYAtZdYWNVFs+4RFM7mFtSlQedAOwBBDpCy03vArAvGjoWsmAqvtBDRYL/iGcZGN6J50me2J7/TxJ46eHE36KQTHKlZvvECZLzl01rem2NJ6UGd+tGJDA0qm5jFd/juXlo1xrbNoDVv/IgoCxkWfKSvIR5rxIdWzt6svxWRlUE6cU5Wq7QJDmX/I6BVUXISIm1j5sNlTIicIZzsI2jYM7B5b1N/ysUKlLoayLxyxZVudanCbYogEM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(356005)(921005)(81166007)(82740400003)(8936002)(6666004)(478600001)(70206006)(110136005)(7696005)(70586007)(54906003)(316002)(41300700001)(40460700003)(26005)(2616005)(16526019)(36756003)(8676002)(2906002)(86362001)(5660300002)(83380400001)(36860700001)(40480700001)(1076003)(426003)(336012)(47076005)(4326008)(7416002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:34:41.5290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec34e4a0-b066-4d47-1f4d-08dbaa0580e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7419

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Add support for the Venus capset, which enables Vulkan support through
the Venus Vulkan driver for virtio-gpu.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/display/virtio-gpu-virgl.c               | 21 +++++++++++++++++----
 include/standard-headers/linux/virtio_gpu.h |  2 ++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 1a996a08fc..83cd8c8fd0 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -437,6 +437,11 @@ static void virgl_cmd_get_capset_info(VirtIOGPU *g,
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
@@ -901,10 +906,18 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 
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
2.34.1


