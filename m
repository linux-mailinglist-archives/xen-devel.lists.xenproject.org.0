Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8AC7A1D2B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603014.939915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kv-0004zJ-Mt; Fri, 15 Sep 2023 11:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603014.939915; Fri, 15 Sep 2023 11:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kv-0004v9-JL; Fri, 15 Sep 2023 11:13:01 +0000
Received: by outflank-mailman (input) for mailman id 603014;
 Fri, 15 Sep 2023 11:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6ku-0003Cy-7l
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:13:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3032635-53b8-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 13:12:58 +0200 (CEST)
Received: from DM6PR05CA0060.namprd05.prod.outlook.com (2603:10b6:5:335::29)
 by DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 11:12:53 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::db) by DM6PR05CA0060.outlook.office365.com
 (2603:10b6:5:335::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:12:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 11:12:53 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:12:40 -0500
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
X-Inumbo-ID: d3032635-53b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzriP+yOWO2THW1cgtHr4x34QFSqXCrCuQs2K6aeXYVrK/Hv3QHPjRdvtdYfXxCAH6QWJhP1BJ1Rw3rrd4EiXhMktBBdfPGXzGyRX3fFo7ntykh5B316j2cVcE4gfyhFXn3k4btWmCj25mRQYJn8h6+KhKG8CShiM0odWU0/uc/kZqRI+EqLYvhgFuK7HSqF9DkHFVnUDaBBLqIN4ZARV3BmUuaMMRWajFZlOAVcC94cA7nZCSTg9sXEH4RiVoSZn/38Fkyphwc4uVdm09H52W98HSne42BbDOYVqcJNRNwYo8z7WPzjFlTlpC3urkVQzk3O3NUJoULkTNntEuNSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oZk2aW8HC0IURT0X+XD0S8DA/oj3Z2KF9z6UX+B5YM=;
 b=feNa3YuEylihhZ1lx4dMjFqdJxIU1TDkYVdLREie/Lsldmxm79Gv4av4wQ9sH2mYgkYcnVfWb48jh8llB2WglTJcv6WFjpyCteSjUBAlhx4lb3J5D0zGHjsyeRcG/soJyMD+hF1PvLgYzKGBk0msb/oy1szI4uJP9bFs87qwplvKSDHJEjNTqIzqpyFN7SeW3y1OVNefW/5bAlrh7erpqLhIW0nHAubjEOMqdmJHcy3x2qurqxtKZe4JIRh0AbSrCcvrh3DJWCFEnSPIPODG+46IkdT8AI/hnicN+SLqQRrpc9q643aTLWxus692kODIEs7AlCkZ+0ufGk60CbtsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oZk2aW8HC0IURT0X+XD0S8DA/oj3Z2KF9z6UX+B5YM=;
 b=fhFD2ddbYlhbjFMopPhRVVa3ZU3gvHDFklPxkIMRpWZhOSpbH+p3yHxFXuj36lAzEeB9ea+4ukqk8gkrY3ap9ZfsCtGwHp8T44k7IrtMY1cj7WtlMYkyLGmCXwL1bEzjNz5XXD/JhJbc+On5a+T53tXcS0FjRqZA+0O19DpcWD8=
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
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Antonio
 Caggiano <antonio.caggiano@collabora.com>
Subject: [QEMU PATCH v5 05/13] virtio-gpu: Configure context init for virglrenderer
Date: Fri, 15 Sep 2023 19:11:22 +0800
Message-ID: <20230915111130.24064-6-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DM4PR12MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d0b8a9-9383-443d-eda5-08dbb5dcb4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zNzUyIS7lbmsGprOBH+aQOLUy9boun/CoU4y6FrogIYHsE4X8AVBum4TvLn2E0ci82dp08OgAz0PxZAb000gBV5MBJTwKCQHppAmpkcxaZlEaCIwo7Uu5LA6O+lufULfMOT5ttUi/q0JdLd1NtHM/OqQvB4ZUrl7U7teVK2v95J0f71JJ5KxM3bbYTTqI0P48/KB4jfI2EYkOATQTThcxj4qpIcnLUl7iRWiKIFhAizRVt7mmBjLeTO0tZvU2+B2+VmBwyMI/IgKopeYWeyzfO6Ky2e2dnnZdf2Ip/xqKNBc++yAGRQV8wLblxIFcYt0mDDgLz8xoNa14KitI8ThNJAOjbDVjB8IKA95yw8S3qx+GUVRiDNTKazDtpcos8GoDLKEc2NeTT9UgV08Oa96dyyoy9AryFocixq/QPYMAJJlrVSRZcERAnTjlQvCSFQtmufEL/S5lULeWnjjXEkHKeYpq89hrXsDJvLHVEWHjZZhwQmUPQr74Jz/yT8T1zFqtgUNP3oIOekIJ3V0wtMdo5dLYzr8dOVNFcA7zKtgIINEzxMs0QIPLqODN2CTF7YK17S7hf2bqke7h2Ny2+TtpfShAbAvTI+Jvo1acH/+2HTOBvgcX59igwQWIQKaz9eAsTgc6aW17paF0y7zgEUxx6uLWIiQr/A7BE3yR7lEF/u7+lrWlHbzSxH4vt3UwJq9tk/KfMQWqPVtMxH8T8r6UNKKcN1FDwbswAQsDiUJ9/yV3q7fTbPiyPn3dWkbN2dChR1sCh9S0qVVI+SBD5zdD/vyVQ4LxIk1Hy4hpQHl3zo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(16526019)(5660300002)(26005)(8936002)(1076003)(4326008)(8676002)(40460700003)(2906002)(4744005)(7416002)(86362001)(81166007)(356005)(921005)(82740400003)(83380400001)(36860700001)(47076005)(36756003)(336012)(426003)(40480700001)(7696005)(6666004)(110136005)(2616005)(54906003)(70586007)(70206006)(478600001)(41300700001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:12:53.4454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d0b8a9-9383-443d-eda5-08dbb5dcb4e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5184

Configure context init feature flag for virglrenderer.

Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

V4 -> V5:
    - Inverted patch 5 and 6 because we should configure
      HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)

 meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meson.build b/meson.build
index 98e68ef0b1..ff20d3c249 100644
--- a/meson.build
+++ b/meson.build
@@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                                        prefix: '#include <virglrenderer.h>',
                                        dependencies: virgl))
   endif
+  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
+                       cc.has_function('virgl_renderer_context_create_with_flags',
+                                       prefix: '#include <virglrenderer.h>',
+                                       dependencies: virgl))
 endif
 blkio = not_found
 if not get_option('blkio').auto() or have_block
-- 
2.34.1


