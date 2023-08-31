Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854E78E97F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593585.926624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3t-0007u6-W1; Thu, 31 Aug 2023 09:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593585.926624; Thu, 31 Aug 2023 09:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3t-0007ps-Sw; Thu, 31 Aug 2023 09:34:01 +0000
Received: by outflank-mailman (input) for mailman id 593585;
 Thu, 31 Aug 2023 09:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe3t-0006tw-03
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:34:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82e3cc4d-47e1-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:33:59 +0200 (CEST)
Received: from BYAPR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:c0::21)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 09:33:55 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::52) by BYAPR05CA0008.outlook.office365.com
 (2603:10b6:a03:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.14 via Frontend
 Transport; Thu, 31 Aug 2023 09:33:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Thu, 31 Aug 2023 09:33:54 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:33:46 -0500
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
X-Inumbo-ID: 82e3cc4d-47e1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhAMVfFYfWHgnoCmKyczvnTv91FxW8pSSHplnlvFpJt516eIQyyuvGoCTcxqBN+DshBvxOoMi28wkdwCYxMKKaafkOAcbhuu5U7xpGvyRxZKJy64vFPjhjlGuAx2RnWMCnC7Zizv5tAVL10aHBtwqYQ8/053CviGapdC4mhYAPHbnxQmmHGP6tzP3TVNWi3XIC7Ak36cryqREHJvgnLQFKIcblRzfB0t43XoJCoruzs2PQRH6wL4Yvgbo/lD+4HpSPqWTMMSbeLGBSY2ttYrLCCNdz7tVExXl8/qqJqz74eYuTVepGb91GZu9QIeSUMUNxDi5f010Vh5rrvvb5CGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRQ1qUyvUZQnKdi9DaXDIHpX3dEnpLy+x0X55ktio60=;
 b=RLQX8DX7jdtdSi2zAfPU4M282BBEwtMlARueetYyW05EPj73d1yn76cXb7BWKcEq63xLBELaOxW7/phRMSdz5kPvcK9CZ3PuEYm4vLHOHcAQpFv5VUGkyQOVAazn3BFHoL1tHmO1+7204UPhhgi1ydj6gX4cNJApI4Mdx6zGWJ57TzuUc0B2elp+NTyc1Uj1WMEBTfVQFtDIHrfn3Oi/iazaSkwlG61pSaJGBuomIXpRcliKVMswDggxYoV91HmgdQay4crogrcM5rA0CFgNOhXgHBerwZOMW9YGuNUAd/+aClX9ZczAYzOoo4qnQiK8XhkpF3NFDbRkSGCO1g8xvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRQ1qUyvUZQnKdi9DaXDIHpX3dEnpLy+x0X55ktio60=;
 b=dU5H2AkhpbH7kR7PDWUm0+WyvFE4QNRUZjSYjhCIUPmNouDyCfk+5yTL7CUf990tbisyqwUWESgOYJQhZvFRyxiMUuBaLcgp4/p2c/9DiGTTzovM821zl5lPblPaxr9L+zwZ8gUR87dPdCXaL4uK2Y8yo7LCoqcynjcE+9NCxQs=
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
Subject: [QEMU PATCH v4 05/13] virtio-gpu: Support context init feature with virglrenderer
Date: Thu, 31 Aug 2023 17:32:44 +0800
Message-ID: <20230831093252.2461282-6-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: f607c5d3-3400-407b-ec9b-08dbaa0564cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ejNdyq5NksTMzk+vaYTabHky77ur3qk4Re1+zmd2EkAc4KZBvnnG9TKEJgE29nj4+9vrnil+ZzsL4yG8/cK1mADiSFDMHFDiVnQ0YX0MHi6ENyNuZmKAyuuTg08kTYh+XOyvhpv4tBB6PjZEHF/1Bva+qUxvGlNfGVAT5odhhu4iKEVwVDsO6Nkurde0Cgih070nR2cprnXoSrv8jtTRrAGQtYWc5f0nC/tfbX1Qrrslo/xunempOh9+EGTHC8GY8Qwo+5v5rkGbxFTc/aojtXJG2SP3NpiXFR1xF0PtlW8zoIgy1uZN2uCzrQedJgOkrXAp0oTNpvPSN8Gnz+2uxihjd2uY6JWtuXeRyyiLNJJBBt/N4p+XzL6FEpMwa1n1cDYygsrPhQ0wpxMV7LCT4CxKyEpx2tSpThrvWGkqNAWpKesA7mPCVeNEqB4aY/baAtZ83k4/U8Y03z7sj+T993+tQFsskoYVlAuNQmbgBDMTr7w7noRWnh/C7Cf2J8sH5woXr+dVYZ2vGYMT9wMDXiWcRtR7JeVqr8dkuT2hlDCydrOoMc/Y0EnlNz9zeEGV+dgjbmhlapTtfpd1SKG4u5oist6P5Tb571r/uxfnHe11z3vbKho/Rr8tVpRGeuxl9eU0CPRvaEYTg6C3SpLwyYcfmFhSdVlfqJhjqTqn2v7wJw1jG9npBpdreXqgvmszyMfCAq2V+ZvCuV1+Gv3TB/9OF97f2L5eoBrqRpkAdyAGOxAXCmhCm/ejX4XfJ0Um/VD9BHvH1kJsKTCZYFCcJ3a7QSEOoXlu8e/Ez6vQuE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(186009)(82310400011)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(70206006)(41300700001)(8936002)(83380400001)(40480700001)(47076005)(36860700001)(336012)(8676002)(4326008)(478600001)(110136005)(70586007)(316002)(16526019)(2616005)(426003)(1076003)(54906003)(7696005)(26005)(2906002)(82740400003)(356005)(81166007)(921005)(5660300002)(40460700003)(7416002)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:33:54.4426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f607c5d3-3400-407b-ec9b-08dbaa0564cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357

Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
feature flags.
We would like to enable the feature with virglrenderer, so add to create
virgl renderer context with flags using context_id when valid.

Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

New patch, result of splitting
[RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature

 hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
 hw/display/virtio-gpu.c       |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 8bb7a2c21f..312953ec16 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
     trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
                                     cc.debug_name);
 
-    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
-                                  cc.debug_name);
+    if (cc.context_init) {
+#ifdef HAVE_VIRGL_CONTEXT_INIT
+        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
+                                                 cc.context_init,
+                                                 cc.nlen,
+                                                 cc.debug_name);
+        return;
+#endif
+    }
+
+    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
 }
 
 static void virgl_cmd_context_destroy(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 3e658f1fef..a66cbd9930 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1506,6 +1506,8 @@ static Property virtio_gpu_properties[] = {
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
+    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


