Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C381829D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656525.1024792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwB-0001aI-Ty; Tue, 19 Dec 2023 07:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656525.1024792; Tue, 19 Dec 2023 07:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwB-0001Xl-PL; Tue, 19 Dec 2023 07:54:47 +0000
Received: by outflank-mailman (input) for mailman id 656525;
 Tue, 19 Dec 2023 07:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUwA-0008Dp-4x
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:54:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e83::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df7cae0d-9e43-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 08:54:45 +0100 (CET)
Received: from MW4PR04CA0277.namprd04.prod.outlook.com (2603:10b6:303:89::12)
 by DM6PR12MB4863.namprd12.prod.outlook.com (2603:10b6:5:1b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:54:40 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:89:cafe::11) by MW4PR04CA0277.outlook.office365.com
 (2603:10b6:303:89::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:54:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.7 via Frontend Transport; Tue, 19 Dec 2023 07:54:40 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:54:32 -0600
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
X-Inumbo-ID: df7cae0d-9e43-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYxKGRR61qBPr4krhR53/x2i+/tRdouf51DP+SRNEIseb5IHDT7N39VmJM4E+sGkWNxKHCqESA1gp2/xwc9tooj2pJhtPNnrZ42pl9ba/iAaGTy49CDcHn5wGpSJ7ypZEfvmrdvYXh/LkGfI4noApFYqI3rPL4ztHKbm0Nl3kw408AMFNC05C7Ur8eSb0tmBXowy8kmmxZ4sLpgus3wC1iwxtSWfus4pcnAu18BHuhYitiKQMANoju9GUZCck6vnPXsQcT44E59vua3YfRa6vQcEgdisIBb/WjbzRKESCmWq9h2ZU1y/M6P8V3VSnBGARG4edMoDNISg1UlsGBETUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm+x9hO2OZqrH2JAMynkQ88/E+kT5I5SP0gGi9uxqpU=;
 b=TZ3N7g9XWZfSCzENO8Wrvdd+pUFVbD3v/Dw+Z7UmAOsI/SPEeDkujKo44r0TFnM+S3aCn3aIdcvxAOJoqjVD5O74TPp4iLBuyEc8hOdcx2R8b9XSTW3lsHMRjbCZg8JjPE+MP/pvgf/vWYN+JegTBqy5xFYqjtZTkTSVNRkFrGa7X90q7bxnAS8/Q2NMkJLpY1Z4SasufV8CBdrgKWkvZZOjEXuocCEV7UKNvbe35y5B8ub30hg43XLRwUPv/j2480MFDf/Aa1ggFcLJP9zWtEb4ffCuOmSEn+4s7DapljrPXmRAs4ZSMyKorq+4SzTeHJCThpzaQ18hC9AlXahCDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm+x9hO2OZqrH2JAMynkQ88/E+kT5I5SP0gGi9uxqpU=;
 b=CedPQ5+Xsn8ZrqsTWCtCVX3RxSO7RCqcvn8sEW3VJC842gwh1dD68N1r/2Wb7ndP/6O2SSt4lOIpJ/MeO3qBy7C2dfeviBvZacDZbmnHg4SvKd/UayhzbTakt45S7w3pwkiV8Reh4mQn8BF+h+3EWwNUHPP5JUNBeqYSs/wDUC4=
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
 Jiqian" <Jiqian.Chen@amd.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 04/11] virtio-gpu: Don't require udmabuf when blobs and virgl are enabled
Date: Tue, 19 Dec 2023 15:53:13 +0800
Message-ID: <20231219075320.165227-5-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|DM6PR12MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 934086c8-b3fa-421f-7fbf-08dc0067c166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7GUOj+mSDtBeSW5AvfsXsKaqOMSxKAk0Ex7s4rCG458gMmUtzCsoyQ2e6nHG/8PW5qjuG0rfWqxVAA+avaO9z2XnaSGA1fZYgOwC21f4uej2c13aRSabTjToLB+6gBIZcjaQuet/n5pwXA4ylMYEpgdvFtGNg7ZnK7mvx2rAhkOe9IxZig255nWyvzU7T4Pwpb2OyCU4ncYt1YgmXcsPBIOrWdGizXlKXUA6rMniPqNaWZ3J0xa7JioBZVNz0otDgLtFouomMOmlbx8pz/voWRX47fUlcZ5b+djAcNil4+kzX+cOwQJKGf7yoORY581xZs7GBgxj0dhOSKQnHVJjR1EtGSTRRGkvyepPG0kKXrxH3rEHps7YnUEuYOzeGR5sy9GzPBiv3p6JoTC480FfP7LZPptBuRfcA+TA7+h15nfuZvORornSFQSwDNztapJuQUP7Z8FYz3CYncHF9hq1kRnsLCJS/2GqggkZxU6FJxVdWocAbU+dJ1fVtoo47/dWgaYHAFGSyxnhq4+TyxSX063lskdTkzQKQgR48HQBXdxF8Hww0GlvH6AsTEVWaL6Eb+hLrruXolllN9130cV8LY72sabwvnsGu4LOIcA5kVn76QUmeS1mYP786s15PNlirKSttaUL4ube5pEgdBNOzEdPBgfPEfM8Th90mpQuD00vVqPGG2WDdptPfx5X6UeMFoEo9zVw/6vULopEWE7KOX6fjQfyHI/rh5rdmJccfSq8ZY/FFHKnKO47MyQoqATwpBnZTyEPxJteZEEoM6g7nBhWLbjBIYU64iGUm2rUA0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(36860700001)(356005)(40480700001)(47076005)(40460700003)(336012)(426003)(26005)(1076003)(83380400001)(16526019)(2616005)(36756003)(86362001)(921008)(82740400003)(81166007)(478600001)(7696005)(6666004)(316002)(54906003)(110136005)(70206006)(70586007)(4326008)(8676002)(8936002)(7416002)(2906002)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:54:40.4556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 934086c8-b3fa-421f-7fbf-08dc0067c166
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4863

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

No change in v6.

 hw/display/virtio-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 8b2f4c6be3..4c3ec9d0ea 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1443,6 +1443,7 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
 
     if (virtio_gpu_blob_enabled(g->parent_obj.conf)) {
         if (!virtio_gpu_rutabaga_enabled(g->parent_obj.conf) &&
+            !virtio_gpu_virgl_enabled(g->parent_obj.conf) &&
             !virtio_gpu_have_udmabuf()) {
             error_setg(errp, "need rutabaga or udmabuf for blob resources");
             return;
-- 
2.25.1


