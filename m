Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E67A1D45
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603059.939974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6px-0002lL-Pr; Fri, 15 Sep 2023 11:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603059.939974; Fri, 15 Sep 2023 11:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6px-0002jD-N9; Fri, 15 Sep 2023 11:18:13 +0000
Received: by outflank-mailman (input) for mailman id 603059;
 Fri, 15 Sep 2023 11:18:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6lC-0002xb-LU
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:13:18 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dec8bfbd-53b8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 13:13:18 +0200 (CEST)
Received: from DS0PR17CA0012.namprd17.prod.outlook.com (2603:10b6:8:191::20)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 15 Sep
 2023 11:13:11 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::c4) by DS0PR17CA0012.outlook.office365.com
 (2603:10b6:8:191::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:13:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 11:13:11 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:13:05 -0500
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
X-Inumbo-ID: dec8bfbd-53b8-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsCYbgQTcoiBN2BsYnmyfE0oz8lDNMxWDyqr+JGFri0I/t92Ecjz2kxVGXvOHZnJ2KckxZ5DhD0Eq6d5eQ5FQ5Dv5h/bZqFbqpF1WN9N/UnR/jwc7RA4KDaI1CZAzJHG4CFb+D9es6dP8Jo7muuc1/uC3iKhNsj84JJe0z2RjeTNXmIUhnxHW8GRTi36WtRUz3v5VdYKK3DsS9JxblRVOhVurn7eACAjT17MxNLl7zsrIrru2fyDQdTXmW8CjQRZdJJuwTlKurR7JARstq6NcGA/Shi7mdhqPIgP0jpuwpcgwugb1QxXOtIzYboGVRp9hP+FrFdzeAffwDCiNna+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kH4BVXS2a7kr2sDF/vIFP0W3LlCas+dPR/KYhpKBEIU=;
 b=TxsF1RWKdtrMlLjVGPCmFl9MncO2pVhdthR60I8IvwiIukYwaCpF0zLxiQxEW9DwzoK5oZHWrXdoeXKwhF5BiC5iEPsTvgii/XV3aey/VSwAP+80pLI73aW4RdV5ldOiO+HV0WF/hhDOMQkKeww1f8GJOmRv83JaZs4Qx5GkhS7vKNcG2o/xeBSawLjJXvDOueU/3L/4zByZVn1SkJjSbRRR9BHBoNF1/4HNoSvxf7Di49p3nh+X/z4FdwCw0be/zQPgJ4VUbosmZ0ALiURuYH0KC3RMZzJAU6T1209dXBn6Gvs9qhc8yrUlk5MrdtC+InrZJNRaPfbBP5AP+v6UQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH4BVXS2a7kr2sDF/vIFP0W3LlCas+dPR/KYhpKBEIU=;
 b=t+HaJqnWoZpVZZVfGJBhnX6D11j2nSXlceS2S4BehX0uBcg9xaFYMCJrubx7Wk7G5Vo0RxuQBUTLV6lg7Tbn9/qLuU6FJuvZxyp+Akp309paLTReJGAIZlc4rPhHAXGtp+9hUfHq9K9WmL30zeI8GnCSLvG+XdNqIASvRHqcKpE=
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
Subject: [QEMU PATCH v5 08/13] virtio-gpu: Don't require udmabuf when blobs and virgl are enabled
Date: Fri, 15 Sep 2023 19:11:25 +0800
Message-ID: <20230915111130.24064-9-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be00e1c-b91c-4655-1b7f-08dbb5dcbf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rQ668DS+d2z/m8khygL8WzMnGRx/euIBph+tfKQbCIIF0JRjzq1ITu4MWToO2K8yA3Z6URhJnvvt+cCNJSa/ZhAkYX5aYK6367h/+jZ5d31xs2ulgdoNkaON7jpxB5iPece3QX6AYjsYqbx9ted6+VAF4zwS74HHUdXB8nQHvv9Qctds7of0PFzIPfpYFhOsQ7B44TZsKxkGd8IgyUwOvZtUZC196i8yg1Zw5y5+sRq9Glx8DBwRADMoynZR4AvCubH2Gc2UV8ea7lSCoJBvaab6ubsKGyVJb+8/VH9d7qaXwMFhynWQuEQr7jasz4KFY4Kj7zTTO4QgHtGyjtJcLq0/AtdbdQDStXs3zxPXWE/Bp2TwqbuuhkBMuIKH8MfCDdYSvdbO+yDCXwv8E/5W8ngJpiXUzPMbraVuspXOpcLxhzgBYHZ5/iQN6qRGqzkHJxmNb2Nv+TwhaomeqzQn7RRloCTYXeV9ojw0yv0KPzJAYf8XnqCtI8PAaWeeygrPD4YaePorHF7Xm72C66TvCa3pyCKixLBD36K5IjM0ke49BflWIt/bv36x9ChvmWCO2BCCL0oRnHAVuWTRQM1rds8ZS8ivQ55gVogBNn/UplJG1A/SOGkkQ6ZiyItzdhftkBK5tLVcz8B9/+Zrcn30TTtL6PLhGmNHbh71oDw5tV9twMQNmYJz0mUo6VftudtAUzBzwnIw+4Ip0TSoT3yX1k2KoOSRay+9YZsVqcXy1N6ft/aMi5WYFoXPhePNDe45jv4RjzvHne/055/MSRb46CBk5rSuFQ3+snaF+TwzuEM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(8936002)(4326008)(8676002)(16526019)(26005)(83380400001)(5660300002)(1076003)(2616005)(336012)(47076005)(40480700001)(36860700001)(426003)(2906002)(40460700003)(7416002)(7696005)(41300700001)(70206006)(6666004)(70586007)(54906003)(478600001)(316002)(921005)(86362001)(356005)(110136005)(82740400003)(81166007)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:13:11.4674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be00e1c-b91c-4655-1b7f-08dbb5dcbf9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658

From: Dmitry Osipenko <dmitry.osipenko@collabora.com>

The udmabuf usage is mandatory when virgl is disabled and blobs feature
enabled in the Qemu machine configuration. If virgl and blobs are enabled,
then udmabuf requirement is optional. Since udmabuf isn't widely supported
by a popular Linux distros today, let's relax the udmabuf requirement for
blobs=on,virgl=on. Now, a full-featured virtio-gpu acceleration is
available to Qemu users without a need to have udmabuf available in the
system.

Reviewed-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/display/virtio-gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index a66cbd9930..5b7a7eab4f 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1361,7 +1361,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
     if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
-        if (!virtio_gpu_have_udmabuf()) {
+        if (!virtio_gpu_virgl_enabled(g->parent_obj.conf) &&
+            !virtio_gpu_have_udmabuf()) {
             error_setg(errp, "cannot enable blob resources without udmabuf");
             return;
         }
-- 
2.34.1


