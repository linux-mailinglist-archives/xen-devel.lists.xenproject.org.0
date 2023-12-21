Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F3281B375
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658764.1028111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGEM-0004fR-2M; Thu, 21 Dec 2023 10:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658764.1028111; Thu, 21 Dec 2023 10:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGEL-0004d8-W0; Thu, 21 Dec 2023 10:24:41 +0000
Received: by outflank-mailman (input) for mailman id 658764;
 Thu, 21 Dec 2023 10:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HEgZ=IA=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1rGGEJ-0004Xj-Rj
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:24:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23bf439d-9feb-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:24:37 +0100 (CET)
Received: from DM6PR07CA0113.namprd07.prod.outlook.com (2603:10b6:5:330::16)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 10:24:30 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::a3) by DM6PR07CA0113.outlook.office365.com
 (2603:10b6:5:330::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20 via Frontend
 Transport; Thu, 21 Dec 2023 10:24:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 10:24:30 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 04:24:16 -0600
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
X-Inumbo-ID: 23bf439d-9feb-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jERasMzmjbTxZkoz6s9aPLI+TfSRoLMtG9Pqh69YkzRr3Dq06Z/AVT+GwGbBEeFTo3Dl+NdLpgTsAypocqnvLBB76eg8rcMeqzrB6+uKUIXpLn/HNCW08wb4auI0QoPfVs/2sJCr6u4xnHTvqYUcls5Ct2HQjHYHFgSUJe+ZE3XOGMfIWRMTSj/bNu3yDuOL6sam7WZSyQvSKVKue+VW0dsgOg94d3AxGj7W8ia8ycTjNBgYZFH0G+iDbmFCNp4SJPS2mD05txFwWqhBD+R7ol3LZRKpqvizfRsPZTyDMSjR49/KwpXCDyBoxgclT7JlE1z6KZFN4zAaPhXtWNIRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5nowDQx2hz6h1Oq56yTcaTPYgCFQhF1Wp6/Ebw4Ly0=;
 b=LndurRNOoEGK+wAewXU5WJMU7co1cKThtACOmmVN4glLJHbDdm/Nc7oykqqfFgK/W1neEeFQ6J1wh6KLSgSRR6Bv38/ZQxlPtoQncXJTvEl90LXGmL7wRC2DZd+5sXNiRxVBoFUpwsHKp8Z9g7VKcbXQ596zHMUWBKEyRZeL+MWKm2CJ9jGF9YN8Q7aIoQlfryurFDEoSIkv4dVCugDNVgOi2qaVOSUyJlqmELUHtvl883jWgMGjqN97hyD2Xy34ANmDb0zaZiowhNUEcHJTbfclHaKFYHuaeOfiQJue4GGvIoaDIT937kKTgEaCkh2onfLLkdwdeMDc2SVJXUKn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5nowDQx2hz6h1Oq56yTcaTPYgCFQhF1Wp6/Ebw4Ly0=;
 b=VkkzPF0wjwmVtQ6swvGhvZW+UnWnaEdVzLHwEs9l2YVrB3oEfBCoG5HHNMUXLYS2zvRsCudRaxSOiFEp0DYCSoPZWvhDnLK3GLNd8Kobs5+aG4nsJ1KO6J7TyrC5dwvqmu0cNCMdx4Lwz1onxn06XVEaiN1EOuR+/rZ3Wc9776w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Julia Zhang <julia.zhang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Honglei Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
	"Chen Jiqian" <Jiqian.Chen@amd.com>
Subject: [PATCH v2 0/1]  Implementation of resource_query_layout
Date: Thu, 21 Dec 2023 18:23:41 +0800
Message-ID: <20231221102342.4022630-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a8e435-a527-4d31-1a09-08dc020f04ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5OdeR9R7YbD9DepVSYRhxFcvqDa1W2Nrru5F7yKMgZs/Ob3g0EcSjfl2QqsW331rhVCuMZR91O+7ShyeXABE5wD3NL9T9tPo89qTkKc9j1PtW4kDXznqbqLzOvLYG5oWBww05C5+IdW8kvmI4D9/oCXvBWyoIRTa+49IxbV1O5GZMuLr5TjnnRk2YfyEwbpFtYJS8Y+0k23Ie0d10IxlbI/ZUvG0wIyM4fe3KwgUchj/jcy0IqjXPi0ZgWHRcP9ZMNSpxLzwbeCP/W5hd6D8Fx8NPTUh61W51NzYeEOx98KQ7CvMoMJ5jHv5dfZOep608MVIDnjar9qAf2tLfrmWuujyL4zSpq86QNwxferFYRvVCsvnp4gJ4PXjHaojfUwjzWKF7NMLq8B2WYTBIRBWiDYWmb7HOEU7stege1ZU4Ngoae4EA2iQmsfFG2Ifkc3Kd6iRKS2M03HlvgYHthhBTcmymK5qknGoih84pACEvhPP9OKkGgnX9yJctIO8ye3ZEKUeICs1vat5pxpNr7jqhZ/cXEYGgpiWYsGJsDBnv+q5zIbnd46izhBcf8XFn0iyoR6aUvADXtP7xWvoOplEiH3zL4OSX2Xz7iiL52Bj2f0sW1mrvR2tioqNN/qDwb+H9u4A4+hV4+j2/hwzg5YCjY2PZ+SsVdUFoKsBD7XmEq5tliqw/j1Rl+je7ztOkVqaWBbD802Gor6b9QKeewxU/Pvarz+meXfnPubMZfsJhEMlU0p4vkmuBLJgfspn3Smu0cjXzCSvO0HLvJsaj8uiNg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(36840700001)(40470700004)(46966006)(8676002)(4326008)(8936002)(26005)(2906002)(40480700001)(478600001)(316002)(40460700003)(44832011)(6666004)(70586007)(54906003)(110136005)(70206006)(7696005)(5660300002)(86362001)(36860700001)(47076005)(1076003)(81166007)(82740400003)(2616005)(7416002)(36756003)(336012)(356005)(426003)(41300700001)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 10:24:30.5204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a8e435-a527-4d31-1a09-08dc020f04ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140

Hi all,

Sorry to late reply. This is v2 of the implementation of
resource_query_layout. This adds a new ioctl to let guest query information
of host resource, which is originally from Daniel Stone. We add some
changes to support query the correct stride of host resource before it's
created, which is to support dGPU prime feature. Without correct stride,
dGPU can not blit data to virtio iGPU correctly. 

Changes from v1 to v2:
-Squash two patches to a single patch. 
-A small modification of VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT


Below is description of v1:
This add implementation of resource_query_layout to get the information of
how the host has actually allocated the buffer. This function is now used
to query the stride for guest linear resource for dGPU prime on guest VMs.

v1 of qemu side:
https:
//lore.kernel.org/qemu-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#t

v1 of kernel side:
 https:
//lore.kernel.org/xen-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#t

Daniel Stone (1):
  virgl: Implement resource_query_layout

 hw/display/virtio-gpu-base.c                |  4 +++
 hw/display/virtio-gpu-virgl.c               | 40 +++++++++++++++++++++
 include/hw/virtio/virtio-gpu-bswap.h        |  7 ++++
 include/standard-headers/linux/virtio_gpu.h | 30 ++++++++++++++++
 meson.build                                 |  4 +++
 5 files changed, 85 insertions(+)

-- 
2.34.1


