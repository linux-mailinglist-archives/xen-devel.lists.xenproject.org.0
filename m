Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295246B63FC
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508918.783914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvz-0004Ei-MG; Sun, 12 Mar 2023 09:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508918.783914; Sun, 12 Mar 2023 09:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvz-00049r-IO; Sun, 12 Mar 2023 09:24:07 +0000
Received: by outflank-mailman (input) for mailman id 508918;
 Sun, 12 Mar 2023 09:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHvx-00008O-Gu
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:24:05 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a15425e1-c0b7-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 10:24:04 +0100 (CET)
Received: from MW4P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::7) by
 CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Sun, 12 Mar 2023 09:23:57 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::e) by MW4P223CA0002.outlook.office365.com
 (2603:10b6:303:80::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 09:23:57 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:52 -0500
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
X-Inumbo-ID: a15425e1-c0b7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dby9PyNrcFZXc3w93zGeT3Lld0g7FSt9MOmEy1hrxuwCN1gnVd34rLbdNlAx/0jY1f03RR5ticK7BWmu5XP5qOgJJa2Ogzl9QDwtzHsFv+S4eZMBwiilTKlbSW6Yq7njS/BQctgirSFK1WDtnNGFv5nUq3ddXJ28pf3EWzNT/QwC/wiSIyKOl028Rw/t4nIpA2/f1Uha0NAJDukX83UzzEC0Bfib92CXL8LmjLUe2yiUhCEGu06tREL5tFMtIUzj9D+ektT0pXdGDOa1GnvB7U1JKVbV95TdgSEfh4+0Tse6nlLjdNXBsQ8MWWEvIhxU4OgmcQ4kWEkLLfQ9NCJRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bqo5UUHvKaJ96skD8ltfQSj1ob1olkWMen932bB4E0M=;
 b=A3ngGLmgwpUrcw+gP78FSMPUsmMYRFhn0axJUC684QQq5UqBrmvYTGjHXSUKq60+IV4NQrb7ShLUb7aH85wAfbu5VZ/L4t7BTvzNrLSeRQBhPlfbyuKm3fy4oNy7gAPeTlBXBHAOu2FpKzUwz6IzivMWQ7CkCrKL8CXBF77HTvBnzYXuUPYye43+KiSUlioWT5EPWhb83DmmVzLxa6WDBqmKNSx/VmWsdIWqX/EyQAYePRSm/TTKJLB+b1KimHuQ4ntRi0x/CHCRuZkxKdvWjX16IDyWlvfT6GJlFvx+DqXmz9z4KzIRKcIqJympdmbbUmWuDf1WH56Vcavs9+1qHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqo5UUHvKaJ96skD8ltfQSj1ob1olkWMen932bB4E0M=;
 b=iOiycFy6atT9VZO2v7M4NyTWr0WgEnhbBoCAtbKdienp5zKAXzM6njglNGO3IK27s3/3uDADzq4JAfp+B+zCsVrlLHviTagFUmx/TE0fbKsEs7IzAHerXPQ5gtpyL9vs2ahDSlaj0QGyXxEVAJdi8OpHALXCx0Ya6Jtq1Xpq1Vs=
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
Subject: [RFC QEMU PATCH 09/18] meson: Enable virglrenderer unstable APIs
Date: Sun, 12 Mar 2023 17:22:35 +0800
Message-ID: <20230312092244.451465-10-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|CH2PR12MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dffb5e8-41f1-43f6-8892-08db22db81d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y86SUr+jwgzasKdrOvmk8524iVts/Yoxc+yEKW/6ckrGyMiOr9ZREwmWmyxTfiSKUKZIC93AKDfytuetiK6qMY60M8XRZkf9nMuS3+nBLgfjWYhYbvW13RcC5EUJ9XOT8KHtxsimkw+Iysf2wfJ/HsF29lInFxl/kRDR6UJIUo9gctDfPmsEx5SGg8SpUUeI5Yl/lcixKuHiR57yEiDMtggPuCQCZNg4+GOgfQjs1Vs7c0of0PlwYjSztn4EuAV62pOlVDxbiSAMS+tOqSNgMD+AzYnqwfLqN+s1ZwmnUTZ0tR6Zny3uP9zC0ViPwiIMNXecwCVxO0rb48UZVmth0YEqttt0TqCZMPSg4zfuwuR1CcAVgY/D3o9uztN9HrL+TTcOpCbr5hr/4A2AKH1OlxMUPUO9FqTYIjOa0wTnrywTJqNbmaMV/YQA9AQUuM0ea/y3zlmWO0Ot0vx1rTt6s6QH9HmRwj5GzG2AKfmznnR81cqh9agOjHtKZ9PbkmNQG8YlnOuqvUxwa19KjL0TtB2RLudqApCnFginyV2dJeR2Sb9F9WTpEYH+q3kzNDABPPbUMRV1Q59mxVZJ0NR1SCi3vxzrC5oDtdvfPi7cBX4tWlAZcFNzlAeZ3YgLrsjMMry+rYC6bi+knYiRL8I+1tlveaRgG+BWf6xfL0oDJepUbZQDi9BiZCFckQBVb1KtE3vDur+nBVJj4SVMkeg4pmBn8BX+If+0ZHMHAO8kxdHeJST7Qy6UA1feQSJWmtuj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(921005)(356005)(36756003)(86362001)(36860700001)(82740400003)(81166007)(40480700001)(40460700003)(4326008)(70586007)(70206006)(8676002)(8936002)(41300700001)(110136005)(54906003)(478600001)(316002)(5660300002)(7416002)(2906002)(336012)(47076005)(426003)(2616005)(83380400001)(7696005)(186003)(26005)(16526019)(6666004)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:57.2604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dffb5e8-41f1-43f6-8892-08db22db81d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Also, use alternatives to meson compiler has_function, which does not
work properly on my development environment.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 meson.build | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 826b3473c4..8cd453844f 100644
--- a/meson.build
+++ b/meson.build
@@ -774,13 +774,16 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                      method: 'pkg-config',
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
+  virgl = declare_dependency(compile_args: '-DVIRGL_RENDERER_UNSTABLE_APIS',
+                             dependencies: virgl)
+
   config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
-		       cc.has_function('virgl_renderer_resource_create_blob',
+                       cc.has_type('struct virgl_renderer_resource_create_blob_args',
 				       prefix: '#include <virglrenderer.h>',
 				       dependencies: virgl))
   config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
-                       cc.has_function('virgl_renderer_context_create_with_flags',
-                                       prefix: '#include <virglrenderer.h>',
+                       cc.has_header_symbol('virglrenderer.h',
+                                       'VIRGL_RENDERER_CONTEXT_FLAG_CAPSET_ID_MASK',
                                        dependencies: virgl))
 endif
 blkio = not_found
-- 
2.25.1


