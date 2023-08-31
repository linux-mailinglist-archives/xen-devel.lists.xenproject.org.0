Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921278E989
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593599.926655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe4F-00017N-Vj; Thu, 31 Aug 2023 09:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593599.926655; Thu, 31 Aug 2023 09:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe4F-00012M-Qj; Thu, 31 Aug 2023 09:34:23 +0000
Received: by outflank-mailman (input) for mailman id 593599;
 Thu, 31 Aug 2023 09:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe4D-0006tw-Qd
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:34:21 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f143fdb-47e1-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:34:20 +0200 (CEST)
Received: from BYAPR07CA0049.namprd07.prod.outlook.com (2603:10b6:a03:60::26)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 09:34:16 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::7b) by BYAPR07CA0049.outlook.office365.com
 (2603:10b6:a03:60::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Thu, 31 Aug 2023 09:34:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:34:16 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:34:08 -0500
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
X-Inumbo-ID: 8f143fdb-47e1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G06Hc0ANkjTHf1KfDwuIZ76eQLjwJvv65krvi00iHGBg+QojPRAgWVzrE+bvyPKfw3px8wYhpXKDLDnuLNYaDEsr47uX3+CuxTZgFEYDW11FCY50K4Y/fnbwAsWecS98Q9oh1KdV2LLhuuPPkGcWrEaft/6ZJMvZ+BTSRYHHpiy8505gCjr+bU3xdq2p9SjKamtCKjMbCsWXrUDi3oAVNrAO/BCvrMh/Us6Z4Km8bwX/3IEjn1BJHGsgGXfnsIe/gAEhUWMkuPSorAieusKAdFRQOwtaeQRwQ7CimrWqchru8XwnG6CvhZzzJOyHf8HTyLWakIQfTNtTHYEFTkp/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+X5ZatVHqnfPO5JcziK+a+lIS1VDYzYwjEVUrRs1ww=;
 b=kx7NnMsj3jrq6ZkgVcFstBlGfVsfpCUpDAcIptKAwUPpMMFp+EO12Wc18hCK0NuBGehFS7FOg9FJ+eIqyn9OLts4Wwt2jzaq5pAcDPxCYDlt1wgr9rmQ2HV9jgtHtiy6s3N6YNUA2YlpoKCa8P07IoVM0U5nnQLNVy3JiC11Ah7SkgNflpsxoXbjMMmxHRRByG9KQlZZc0I5V96ixu/aBxDu9ftr1LIpDDZyHKLgb/yKyOtoRVcNNk2prpxnbQ2QIw3sHQOM1YusdHrc25ZYH9ZyPKDRCqXYUsScLenC50gir5wWTyXSJwOC0oxRS0sCHqCZCRD/s3erRIdDIcYmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+X5ZatVHqnfPO5JcziK+a+lIS1VDYzYwjEVUrRs1ww=;
 b=tMffFEefbmerBgeWmWDt+M4JbUDbY6mNxyraRA0dU94BL+V8HL0FutIU5kf6IntVVPn2mhogY2B+YMLh0+wz6/zD5ggT5LHFQThhB3SsRNV0AQQJ8mYUOU51KT2xmp/D/3Vw2AMOHwbu0HCDb3FnoStAZZ0P+lLM8Z0wliFRGvA=
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
Subject: [QEMU PATCH v4 08/13] virtio-gpu: Don't require udmabuf when blobs and virgl are enabled
Date: Thu, 31 Aug 2023 17:32:47 +0800
Message-ID: <20230831093252.2461282-9-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|CY5PR12MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: c886956b-e0cd-479f-c094-08dbaa0571c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4r2es5Rgb85nUtf4YzkQ3HSVYYvhKASodBRoTDxX2sr+BRELK0XFk5YFoazM9roAV7NY7mBQ8G3Sle8GAS3gGBGH2U5CPhRIzUCicauXN8GIkxo1EBEAding1w/BytYEH1FZ2gWqxrUf1jdUrNhTVIX6bHKevahpDOFi8H9w28OykpFmkwTfqdMA133YW29gSmYpCQwF7TeXlSrKZSa7t6dGellFIodQoXhchy+4WYUhztiS5wEv8LR/A2we0bOP+croL4CdkH1x2RA4z1w4MIxoBd//88wKpvNTLzT9TMxKRH6t2qa251SXkTT6YH5LIPEU59Gakq92qPZGenRhqKG169VYKxAFtqqlN3Cs+aeZoWnqDiDvF5e9wFSa8LVEmaHYp9ibwILld8CX2MV245bqhenLg2j84jRQHWy6OSrc0MeegThQgHKPLKutNK/U9lUrFtKojDm8208iAcRN3i92ND/ccwF3PhLRK2bvImKcovkAI43O7/jwwq12Yqn9Z2Msf1mHwrh95wz0m/kTkkQTTUkp6NecidPHzHIaVRLs+oxYo7c1doz9TJ3TKtS3pqQ9aRHvlmMnSKvWedwneXlFn/Z7N9LqzOpjlL9k/b96IkDsZz00yblOTQvcmFm5o4xpmm5acH+WX0G1Q7o6PRZrkggOERIAfUPiDLuGSBoWElMQc7XzowLSJ2XoJaem2mdhT6I89EAkdtkVxp9YYYrYORsrYIVeAqkQQTZZopKLgjEPd8dkaCKZJ6vApvzQm4GtYbSrJTw/YHtyUdVyxU7HSpKZSgqtAdGSM+PUT/Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(82310400011)(451199024)(1800799009)(186009)(36840700001)(46966006)(40470700004)(6666004)(7696005)(478600001)(83380400001)(1076003)(2616005)(2906002)(336012)(426003)(26005)(16526019)(7416002)(316002)(54906003)(41300700001)(70206006)(70586007)(110136005)(5660300002)(8676002)(4326008)(8936002)(40460700003)(36756003)(40480700001)(47076005)(86362001)(36860700001)(81166007)(356005)(82740400003)(921005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:34:16.1863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c886956b-e0cd-479f-c094-08dbaa0571c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348

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

New patch

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


