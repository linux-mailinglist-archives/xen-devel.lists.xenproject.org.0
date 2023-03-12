Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC216B6418
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508942.784007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0p-0008IK-34; Sun, 12 Mar 2023 09:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508942.784007; Sun, 12 Mar 2023 09:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0o-0008Dn-Rc; Sun, 12 Mar 2023 09:29:06 +0000
Received: by outflank-mailman (input) for mailman id 508942;
 Sun, 12 Mar 2023 09:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHw0-0000RV-Cn
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:24:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a28aa367-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:24:06 +0100 (CET)
Received: from MW4P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::7) by
 DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Sun, 12 Mar 2023 09:24:03 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::e) by MW4P223CA0002.outlook.office365.com
 (2603:10b6:303:80::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 09:24:02 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:56 -0500
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
X-Inumbo-ID: a28aa367-c0b7-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isOdDQt6RyjVPyAMiYXNojtUDwXr35WJV/hV99dIzs9xuesQgHdX+W68k6kbhBD8U5eQZR1t9wFpy9TIh2Ji0C8ozhNX6oGTc58LI7vI+T3JGnxZVvz3SSGdVtDnRR+YvpfO0RyTy3eOPIzjPiVDMvlQqaL0l+LI1vuGSRy/CfV2fIXTb3XM+i+Jka41bX5k9g0HdEMWFz31q4GwsUgZV9d0ox0ZMMT4XbcrCi8p7Lvj88LcaodoqXAlYyAe0n/lSWph9Lhnp/IFfrR6S4o5JTDIQ3RDSqiNDV4NDtydmu6Y+LCmkQ6l8ek0t0rT8hyDnxyf9sVaFj5lhodTCvP6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W6fQSR4XNefyBjEnNx+xHfZ42DHRPg5Zu3WKU9uK+4=;
 b=GdcmHVdhIvqZRDr6gi+26r8rU/McSZnQwIU70jXaC4Gs4JfDmu9zO9MlZg0HIMN1zkbPKEQcvyQsupIBEAFqMaX1sk17rmxhKlmiwTFJwXHEoiAWDLP0cmN0784aMjVybolTQ9RnR6H/RyCYqyWRSt+F2abXL1aKscFOE/Ud8cnGiUmUkY+Sjr8F/98dzh4VD0I2ySluUV++XwNPV4VIyVEvDU/RYHtjyKs3Y//S8qSTlvMAHyIzthySoJMoWjAYhbuEUi5Zx7rLl1rq12xpRmqmXc/Af6Ps0MeeygRS6tbI0vz5W8LIb3FjqSX4yVHRADa4AOxV/DT5J0guKpmlNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W6fQSR4XNefyBjEnNx+xHfZ42DHRPg5Zu3WKU9uK+4=;
 b=je3L3MCKPTObPgXmj4V+3UoH2L+MabeJVZ9CHGaS7Si2MuYKX1SzE9SGxtvvpp6suulYk4qb+WCNwT143M7UEIGvrFI84KdHgl7A1MbyoYxK3eh+Op9T5zmdj4VCbEnUhNOFw/7GyqWRYKL0atOT4uakqCW8tD0a+qaE8fK5qsE=
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
Subject: [RFC QEMU PATCH 10/18] virtio-gpu: Handle set scanout blob command
Date: Sun, 12 Mar 2023 17:22:36 +0800
Message-ID: <20230312092244.451465-11-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: 9554ee66-e5c4-4edd-5212-08db22db8534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5CLHP5wU2YH8UsonWfyKjo2Bma1/vH7DsvUbXzwsz2LNisDvP+HsGpeoDmF11m0CLuwwlUygEJ5LtBBmqWEU1/xVV+3eNpSiO/i/XLGFr9FlSqX/w33c9syHwmQc1GxVmeNJ8mQcGqeYAKjlTcCydXC7AiHEgo2/UAPkfUvxdQcuAskMdDswxDxmFCOce4PobuZWdFaOztpVcguL8sP6O7G0tmhO1mDhreC2TWl6+TOosLQn+ghFAz7R0n6i5cF9AtYP453TCDPIA4pwmK8H42l8giBx7V6B1rIWY3JwZSv5vL647GTkFXt4sJvxWBD7WqdeYpmZ3zulxPNsc/zO789WGaYpQTUkIB/OLPXxDbV14/fGdKUg7jg96jUl1RyEP9Xr99BwZoFKE3XBa5VS/tt/huvN+EooBQ0NlrZWWquYEeKG/1vUxWSyoq19+3LaJZ86qCYRcwzBTYA7iFlXbcb2Ljnbro6AzK0zpB2/qJ2Go5Seo+X94BASrOvqodKd+Gs9yoJEBJ/9mBknFWieZWpodjaH5SmPwTCLOegZLQ3fe/Usq7SGU0aI6sqHWBZouT/BdU85UXoHQzayiF0yzSnYpnmsdz/eEdo4cRbjiVbUuTsFcstsqBC55REHXOIZUsfjjLvLIz397EYxx4j0PBW4ZQkaR35F/l6//nuG31cvZGkrOdzEGfdl6rUaMe6/MnnU3ck9TShs7wQ6urycmihFWp9z8HbNCY/0iiKITg4RnMQXwggYdX0ouI9AEyQA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199018)(40470700004)(46966006)(36840700001)(82310400005)(36756003)(86362001)(16526019)(186003)(41300700001)(1076003)(26005)(5660300002)(40460700003)(7416002)(336012)(4326008)(2616005)(8936002)(316002)(7696005)(110136005)(478600001)(54906003)(70586007)(8676002)(6666004)(70206006)(40480700001)(81166007)(82740400003)(921005)(356005)(2906002)(83380400001)(47076005)(426003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:02.9475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9554ee66-e5c4-4edd-5212-08db22db8534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Use mapped data pointer as data for the scanout.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-virgl.c  |  3 +++
 hw/display/virtio-gpu.c        | 11 +++++++----
 include/hw/virtio/virtio-gpu.h |  2 ++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index f5ce206b93..1fe144f64d 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -653,6 +653,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
         virgl_cmd_resource_create_blob(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_SET_SCANOUT_BLOB:
+        virtio_gpu_set_scanout_blob(g, cmd);
+        break;
     case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
         virgl_cmd_resource_map_blob(g, cmd);
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c7d1e52cb5..1e334a1e78 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -144,7 +144,7 @@ virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
     }
 
     if (require_backing) {
-        if (!res->iov || (!res->image && !res->blob)) {
+        if (!res->iov || (!res->image && !res->blob) || !res->mapped) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: no backing storage %d\n",
                           caller, resource_id);
             if (error) {
@@ -637,7 +637,10 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
         }
 
         data = res->blob;
-    } else {
+    } else if (res->mapped) {
+        data = (uint8_t *)res->mapped;
+    }
+    else {
         data = (uint8_t *)pixman_image_get_data(res->image);
     }
 
@@ -714,8 +717,8 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
                               &fb, res, &ss.r, &cmd->error);
 }
 
-static void virtio_gpu_set_scanout_blob(VirtIOGPU *g,
-                                        struct virtio_gpu_ctrl_command *cmd)
+void virtio_gpu_set_scanout_blob(VirtIOGPU *g,
+                                 struct virtio_gpu_ctrl_command *cmd)
 {
     struct virtio_gpu_simple_resource *res;
     struct virtio_gpu_framebuffer fb = { 0 };
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 0a44aea4ee..ce49cdfafb 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -284,6 +284,8 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g, struct virtio_gpu_ctrl_command
 void virtio_gpu_update_cursor_data(VirtIOGPU *g,
                                    struct virtio_gpu_scanout *s,
                                    uint32_t resource_id);
+void virtio_gpu_set_scanout_blob(VirtIOGPU *g,
+                                 struct virtio_gpu_ctrl_command *cmd);
 
 /* virtio-gpu-udmabuf.c */
 bool virtio_gpu_have_udmabuf(void);
-- 
2.25.1


