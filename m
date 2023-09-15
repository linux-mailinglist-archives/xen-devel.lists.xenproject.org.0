Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CF7A1D47
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603060.939981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6py-0002q4-4h; Fri, 15 Sep 2023 11:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603060.939981; Fri, 15 Sep 2023 11:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6px-0002lR-VU; Fri, 15 Sep 2023 11:18:13 +0000
Received: by outflank-mailman (input) for mailman id 603060;
 Fri, 15 Sep 2023 11:18:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6lf-0002xb-ER
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:13:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efbfcd7b-53b8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 13:13:46 +0200 (CEST)
Received: from DM6PR02CA0047.namprd02.prod.outlook.com (2603:10b6:5:177::24)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Fri, 15 Sep
 2023 11:13:42 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::96) by DM6PR02CA0047.outlook.office365.com
 (2603:10b6:5:177::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:13:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 11:13:42 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:13:36 -0500
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
X-Inumbo-ID: efbfcd7b-53b8-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvoWYV7bTNHPp3a/nfPCl3fdwl2aTAIRxRBg/fIxw+IMkxuzd4zNp6gtuVIbTRl3LshJ1oYRsLCHLFG5QVAjK3xrJyU05rOgUWMOHYZmHBBSKowCuXUTcAKC8MztvSxQOw5W5bSbfV8DCw/CHCB94HPnt45BLkDY+NmURnrhqf/8USyH7Tu4dy9tCY7Sc7rQmmktw3gRzRfPrwPLCIlSMMPgP+WeUTsqcHm6zBy4ll9y1WDpOz6Ak7DedPLl9Nzav5c34SIY4/Naidpw0dRb9/auJg9yqKwIJKB/g+kh9+XI3A5Ea8+lhtzPtjWbXsWTrucD6Qdmvjp5jY6ZBCekxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doHo9C4Pm4Ui7n/4etAaiF8HheLBr5YOGc5k2SvIw1c=;
 b=b7t33fBWp9FiP5OgA1G5gyPJbvZ8TdDWO2CyOGaCgJm0hw6vt8B2pXcen4NeWXRBxeFIX1Aqzjp7HGC94m2EkmXHVhEpMIPLdv663ncfhdfg+ZYcfSEeWN2KU8sbaS39a/h4vg4PoR6UtnJh5drwi0F/voNt9IWCFZ8biWa7kqQHH00hsb/0c/da+zGq4U0viyx8+edKj0ZIgooJYtCraRjqAhTCcwBuZTKdM4C2pQZ0TIKWdrWpEzFzj1LN4rvPGTDc/sLyFI/Zed8dy+OGv94FzwQCek7m8ql1r1pVQXOtJdis7kHz70/f7s8u6ZPfgezPhPd1BV4S3upvdfC1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doHo9C4Pm4Ui7n/4etAaiF8HheLBr5YOGc5k2SvIw1c=;
 b=D3PWJi7T/AJUYP96Gj1muvD/6xCuUnj2MEnB4x8OUf7WydYDbr/KN1V3b490Bxx36YJau32N4NYLRYzOWnXpCCYsmcGPIyK4y5648+meZI84baq+PFP9RxVBt5TIUCIDBC/G5o/VYWMjE/O53ChEJokWpZ22vD6brBY/K5LPbvg=
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
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v5 13/13] virtio-gpu: Enable virglrenderer render server flag for venus
Date: Fri, 15 Sep 2023 19:11:30 +0800
Message-ID: <20230915111130.24064-14-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c85e6bb-27ab-488e-994d-08dbb5dcd1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/IjleQEDOaKMtBI3MXvY/fI4YUpE7kXeauzblPqd7AZnPMIjJM+QL6aC57xcn6AQZF0SlUkyvEZrhGDKGQUmTdDS6zsZA7hUwxKvhTlntp+ZC74S9GpSbuXMmihfGft2m3QkQZN5Yh+dJDgPRcjwasfg+Q26i4754kTweyM6EtfabuwpamwPNNj3lVoe8Zof32UzQ5DMpjZBjf3Xd0r7wvjferfPLiusx8iOdPQgxtkwvEAyFRZWhUebIAcjmF9V62707lXBIL9JPdtLSVZUfvJYbtVRsGMYQ9pZ0f5fchJCM+ACFVOLIHZbd5v9c+4TsaFaLqldsy+5CE1EDgSeEAZJEDU/whDfh6ILuPmwXYG3yM9FBifpIsgrhSu0L+ozRvdWdsAeTIv/+xA7r55mJZyQebttDzEu/Umre09XTf8F5nnuWQ07aymHDvmmObTR0x1FTOKv8h6XuURYMLgYh6FhMoZGKk+t9Fm1Tu3BtBAPfQWREZsKvS/acgH+YVcHTfzv4MP5pVQOP8MncUZrq+Nv8GRSeG3ytY+hr7nqISaykeorng/cR1lnkcuXCj2GQcBOaYyYjrBWKA1DbpQSvqSMANEZTzAD2/9lq380F8sQTCbzy4D+zC9JtTQ6U8cjRNAXQSArOKlgPXDC0vcJnRzEN6+V+CwqX/9GAOUfqwB8n3C3a59jRKQDE63/4y9698dYNEP826MRUq9CID9L4W7EdCyWhAqAgCwoXieCmetaQM4N9v/GBUGdbmSeOjAQKHHUPg9J3Ddj1nuSdPqZRsHpL65rS5/nEOEip1xkDQE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(82310400011)(1800799009)(451199024)(186009)(36840700001)(40470700004)(46966006)(426003)(1076003)(2616005)(336012)(40480700001)(26005)(83380400001)(16526019)(40460700003)(82740400003)(86362001)(110136005)(7696005)(70586007)(921005)(478600001)(356005)(81166007)(8676002)(4744005)(7416002)(2906002)(8936002)(36756003)(5660300002)(4326008)(36860700001)(41300700001)(70206006)(54906003)(6666004)(316002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:13:42.0734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c85e6bb-27ab-488e-994d-08dbb5dcd1de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827

Venus in virglrenderer has required render server support.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/display/virtio-gpu-virgl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 39c04d730c..65ffce85a8 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -888,7 +888,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 #endif
 
 #ifdef VIRGL_RENDERER_VENUS
-    flags |= VIRGL_RENDERER_VENUS;
+    flags |= VIRGL_RENDERER_VENUS | VIRGL_RENDERER_RENDER_SERVER;
 #endif
 
     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
-- 
2.34.1


