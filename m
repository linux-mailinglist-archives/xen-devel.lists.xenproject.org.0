Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25E81829F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656514.1024761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUvf-0008WI-Uc; Tue, 19 Dec 2023 07:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656514.1024761; Tue, 19 Dec 2023 07:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUvf-0008Tb-Rk; Tue, 19 Dec 2023 07:54:15 +0000
Received: by outflank-mailman (input) for mailman id 656514;
 Tue, 19 Dec 2023 07:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUvd-0008Dp-Of
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:54:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc22c014-9e43-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 08:54:13 +0100 (CET)
Received: from MW3PR06CA0030.namprd06.prod.outlook.com (2603:10b6:303:2a::35)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:54:09 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:2a:cafe::19) by MW3PR06CA0030.outlook.office365.com
 (2603:10b6:303:2a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:54:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.8 via Frontend Transport; Tue, 19 Dec 2023 07:54:08 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:54:01 -0600
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
X-Inumbo-ID: cc22c014-9e43-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrtz9fQhePsxYWraFD3LLEotbMqfkg2dX/pzH4mMK8OdE4gQ2+SECpEfbwK/Pz/pHnv5QgIFJCPG9Nh0L3onYmA5ru27Pu0GXMBXOfyqPHbFEcNiDKZ2z66EtNPfSKH/HU/hO8toNhJviHs94BgqLy+4tyHitpBRjko8rS1SJelDloQ+7GIr7zhcsuGHFP/UxPJkGOLzzjZ6EspkgM+s8XRsbPUaom9+F7RR6lZPmrpZPP+zKbllXBbaQhAL1JR1bwfewPHVzXdqIPzIyNlK7585CpGuypZovyBHn17Fd6Z+Dry9ZR6EzSNY1AUntqsXRVRPp1BvQatf4vBlkz+iHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o80xoaBmG8h2A9FAJS+hScUpb9r7tnLzxTs/uXia+bM=;
 b=QdTYMSvAl3S2d7qpecga+eqTHZN+OWTL01t6cpJH5m39ZMJwMgcZheyXHXMM/QJNDznc5E0tb67wJzmhQPj8C0yyYmEGUKN48CuxkpjW62nGyo9k8jIr33ulmPod0S9p9UpR5J/SAkoAxeF9ImFGLwo/aJ9ukwQpbYY/Fw4HElpWFwpd/4iW9qaJtpyDo68mzNth1hXnAa/auf1rUqk8HGZ9BnO7jC6gnhwTouWbT28aegIyIPhrT2P+cfDOWLGsmr9dWDY3TzeNa8EQjSohhtC0/hgvIaedeaT0ZmzvFxYN1YeoFV5hcCRJxsZ62qwlbcMcRGrU3yPILcrv7fC8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o80xoaBmG8h2A9FAJS+hScUpb9r7tnLzxTs/uXia+bM=;
 b=nur+1iy5MOOdFGQs8aEbhlTUfyz3/plUmfgqQ6QUqqGIOqnjuZyd9xczLAdM1hnKKoIZ2O/HZBYrKcIeToyR54+UUELi6ts3rLB1RoNERpQfxxJhWWSK0IyTFwOfgQGt5pA5HMxmQDGeFuVUPCL9JWCAkqP5FP1pvyaslS9WT2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>, Alyssa Ross
	<hi@alyssa.is>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alex Deucher <alexander.deucher@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 01/11] linux-headers: Update to kernel headers to add venus capset
Date: Tue, 19 Dec 2023 15:53:10 +0800
Message-ID: <20231219075320.165227-2-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219075320.165227-1-ray.huang@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: c04be24b-ffbd-412e-7046-08dc0067ae63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lPAv71mITwNdRFsgYvx1taLgdviAJdQxigc2aP/N/dB/Vq+19jLqfe5pJqNJA+4LWcNsHEpHs96xowkUi6hbxgITUwsBf+uxMbr0W4XNHXdbb7iB0OgD2zdj/C9Fxlx2frdkCS1rUDWhCkYII2RmFJCPW+Y+CSPwAF5kcVIoCfPWPg1Uw67/2sTu4EyGmVcMGKXviUS4APov20dKENmfBIidgaz7FXee2LV5NKa48PoEKk6k79EwWWjt5ubcjfnt9ZmBUT6CmCM4hQmZwWt7PAQIjbXYtTvF0nMaZK3/a2JZf7H3Vi7y2x7btbacS3nA5R3h2auvlqNJfShBXMeP3+UqczJJ2cNK9Mx2l/Kj9FttOFy0WH8JgI2igLkvUFXskoDdtKp5tuCIwMqJqAv4+QCUu+4wvOrzcxOdFUQdg25j35/UAwwa3STFanReMSJkCV11vaT3RSXCcOZoYLSbeAMu2PoyqQAdPfPlruoOEsGvU+Gs/HJfoVP5K+q7NNSAupkh7/Ph6OWqc+aRKRNdQv7wYNHRTqqUMevZyRP9Rj/3kRv1HLu+hd33fIi3WvZ6RpHniGHzAPj3TTMN1OhqXl5xonc4/nU2sAI8e/lInSFxlhv/poir1PU5GBbc8fOnH9ArtRtRhpqYEthZiFw1bN8sc1w3XWjgdGrggdopNN8AJCjjQVL0uZVJVJEBjmAcDFVpSjiwjE8sOBkQcOGnR6tpuA/b6uqBRZRj1veDmdqgdg5Mc4gs7idGHZX+FzroGyW6Qvm6Df1D3/Z8DR45ww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(26005)(336012)(83380400001)(426003)(7696005)(47076005)(2616005)(36860700001)(1076003)(478600001)(4744005)(5660300002)(4326008)(16526019)(41300700001)(15650500001)(7416002)(6666004)(2906002)(8676002)(110136005)(966005)(316002)(40460700003)(8936002)(54906003)(70586007)(70206006)(86362001)(36756003)(81166007)(356005)(82740400003)(40480700001)(921008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:54:08.5432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c04be24b-ffbd-412e-7046-08dc0067ae63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124

Sync up kernel headers to update venus macro till they are merged into
mainline.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Changes in v6:
- Venus capset is applied in kernel, so update it in qemu for future use.

https://lore.kernel.org/lkml/b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com/
https://cgit.freedesktop.org/drm-misc/commit/?id=216d86b9a430f3280e5b631c51e6fd1a7774cfa0

 include/standard-headers/linux/virtio_gpu.h | 2 ++
 1 file changed, 2 insertions(+)

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


