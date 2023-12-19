Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA981829C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656513.1024752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUvb-0008Gn-IZ; Tue, 19 Dec 2023 07:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656513.1024752; Tue, 19 Dec 2023 07:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUvb-0008Dv-Er; Tue, 19 Dec 2023 07:54:11 +0000
Received: by outflank-mailman (input) for mailman id 656513;
 Tue, 19 Dec 2023 07:54:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUva-0008Dp-Co
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:54:10 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8f92fd2-9e43-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 08:54:07 +0100 (CET)
Received: from MW3PR06CA0016.namprd06.prod.outlook.com (2603:10b6:303:2a::21)
 by SJ0PR12MB8165.namprd12.prod.outlook.com (2603:10b6:a03:4e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 07:54:03 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:2a:cafe::66) by MW3PR06CA0016.outlook.office365.com
 (2603:10b6:303:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:54:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.8 via Frontend Transport; Tue, 19 Dec 2023 07:54:03 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:53:41 -0600
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
X-Inumbo-ID: c8f92fd2-9e43-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4jjzSp5CORZxOiLFa7sgcHfUSZ00JRpONjH1wadXk1rvsAb6MWHPAIOAqeB8TBXzoYElRkDzaeORhs9Fx7/XanQcP56h426YlK0fp8iFACHbxh810sCaMBhAC0oPbEU3qWTJGNHM9YK4Uk+oYooKDEQn8C10EKVoXhxoDDI00RoL9Jm3MPK3v7azCU+mlzSZm6HE+Py/+DPopk/eMc0D8elbrhUDuUpbovTNtzHS6YyOVU3EpPcGZr/LP4LCjU93yWPJtPutMIT0Nsccemkquj7t1S25Rva0/ydSMgv6ndI2j8UXWibxUVs+PK0hlZkzmFJ/1Knu/TxvZVk4ES1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEpDTPDC3Kfcz8yPuGr2A70VZPsz3Bi/fF3kLhNqez4=;
 b=CZoYqZxtADrWs/Vw3l8LPo07M5OmxIlRLmKCD3pn4hsnj3M5f3vbCBmi2Jz7PfDNuYJor4RI1AVIZF5cFSWyZqKY3dn7VcBegW1zyK3031SJt2464r8ZPiGz4tEBcHtB7CSFj9nTgTLVqsmWqFgiWbb05FQcMEnML3Gf4FY9wFYOV2ihlBzrLZbYsz+8jS4TEdQ6xUhRm+1QOWyVJpmwcU8t7poM7GhAmsPtX0hX5DARfatJ/a9XFUMZiwi1eszEOT4sTRDRR0RJJdWD426TcOvoARTWTWOkKnuj1moEtt09Oq6P7qxZfBoFy6wFppmnb6YFtByh3FW1ASR//m7WKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEpDTPDC3Kfcz8yPuGr2A70VZPsz3Bi/fF3kLhNqez4=;
 b=eO3aka846iI8bYCGSmvBBWS8vWJaColZ5xgN352HWxtRJTMXasKSudbTAeyZKsSel+Cx8SUmrJ6sjuLmIsc1OGSlETRHgxFuhJfuMzMYQPJl4Zwu4tlwO65328Du6sVgILSxHlI7phv67wWeS+TdiHNosZ1xC1rAs6UHfGShvFc=
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
Subject: [PATCH v6 00/11] Support blob memory and venus on qemu
Date: Tue, 19 Dec 2023 15:53:09 +0800
Message-ID: <20231219075320.165227-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|SJ0PR12MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: b58abd96-5405-4ae2-2027-08dc0067ab28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Twi+h+gqFA9D1QnLqZxF9JvJ1kGp5fzvryg/sTF1XZlkQ1DUggu3WnkkrEIiL+YnKABEC/aI4nYfk/pUYcswGmO4P4b9T8ST/fPPWHcXb4c2mvvNrE6Yb/B/+1s8uXp95XMi2fH7K7Lmk56A9FKB1GfVUd9imSPZe6vxLlAzQp/5IVc+I1ylQ28anKALEcGsDfHPB7KVgInFUFxqhj5++oSz9byn5eYR7exYn+2+Kv2XC9No+WtVflEjxk8zPXABMOcVT24BIe+M6MW4b4VYEo9wfWbXi2vHNxgX3l7XFrePG+Zd/dH0/hIWOoGg3E8gTldQNQ8KmSQYASg0ZvpcZUQN+66lIbm3QahJJ5gFvOGnd/XCDqXX5EHFUVBzUFf6/219eEZaNlTsBiKcDAYyS4u0N9Fzxx+XXM6TE7wKahyHKwzQmfrFzxQ/gIPct0Hfoz3YZ7GqYd+EmlZqvT9aY6347d3+TNLe96RMl1mw+V272PDG5hRlxp1wKuFi/p2pOSIXn+Pb14H0KR29VMZSbQN12PXRna7G4P8fF/Zc4nfP89WelzZVTzJ6vwKXq0A+pMVDMRTI8eEiLy1/q26eRd9CnfYWDgme1YZIkOlZvFZXps1ubZPNpRWs1OvrkgzfL34NluUFlZY86rapy16uO5L5mR2I1XkGqEY3PXOpvJnOzy5SJcISRNSWXgzFsu58TXuQZCTEfCl7W2+M67nVuGJa9QbprHTcm8wbIGrnKi8AMbeNjUPnqpOC6biZTRncYHo2gx3N/n1tg8aFi09UgLxZhHfBp40qqQICrWmrs/i1d+i8+cgVzq+RgsJ1Zebb
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(966005)(70206006)(478600001)(2616005)(1076003)(54906003)(426003)(336012)(6666004)(83380400001)(316002)(70586007)(110136005)(5660300002)(8676002)(7696005)(47076005)(8936002)(4326008)(26005)(36860700001)(16526019)(40460700003)(81166007)(66899024)(2906002)(356005)(7416002)(82740400003)(921008)(86362001)(41300700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:54:03.1370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58abd96-5405-4ae2-2027-08dc0067ab28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8165

Hi all,

Sorry to late for V6, I was occupied by other stuff last two months, and
right now resume the submission.

Antonio Caggiano made the venus with QEMU on KVM platform last
September[1]. This series are inherited from his original work to support
the features of context init, hostmem, resource uuid, and blob resources
for venus.
At March of this year, we sent out the V1 version[2] for the review. But
those series are included both xen and virtio gpu. Right now, we would like
to divide into two parts, one is to continue the Antonio's work to upstream
virtio-gpu support for blob memory and venus, and another is to upstream
xen specific patches. This series is focusing on virtio-gpu, so we are
marking as V4 version here to continue Antonio's patches[1]. And we will
send xen specific patches separately, because they are hypervisor specific.
Besides of QEMU, these supports also included virglrenderer[3][4] and
mesa[5][6] as well. Right now, virglrenderer and mesa parts are all
accepted by upstream. In this qemu version, we try to address the concerns
around not proper cleanup during blob resource unmap and unref. Appreciate
it if you have any commments.

[1] https://lore.kernel.org/qemu-devel/20220926142422.22325-1-antonio.caggiano@collabora.com/
[2] V1: https://lore.kernel.org/qemu-devel/20230312092244.451465-1-ray.huang@amd.com
[3] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1068
[4] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1180
[5] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22108
[6] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23680

Please note the first 4 patches 1 -> 4 are inlcuded in these series because
the series depends on them and not because we want them to be reviewed
since they are already in the process of review through the "rutabaga_gfx +
gfxstream" series.
- https://lore.kernel.org/qemu-devel/20230829003629.410-1-gurchetansingh@chromium.org/

V4: https://lore.kernel.org/qemu-devel/20230831093252.2461282-1-ray.huang@amd.com
V5: https://lore.kernel.org/qemu-devel/20230915111130.24064-1-ray.huang@amd.com

Changes from V5 to V6

- Move macros configurations under virgl.found() and rename
  HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS.

- Handle the case while context_init is disabled.

- Enable context_init by default.

- Move virtio_gpu_virgl_resource_unmap() into
  virgl_cmd_resource_unmap_blob().

- Introduce new struct virgl_gpu_resource to store virgl specific members.

- Remove erro handling of g_new0, because glib will abort() on OOM.

- Set resource uuid as option.

- Implement optional subsection of vmstate_virtio_gpu_resource_uuid_state
  for virtio live migration.

- Use g_int_hash/g_int_equal instead of the default

- Add scanout_blob function for virtio-gpu-virgl

- Resolve the memory leak on virtio-gpu-virgl

- Remove the unstable API flags check because virglrenderer is already 1.0

- Squash the render server flag support into "Initialize Venus"

Changes from V4 (virtio gpu V4) to V5

- Inverted patch 5 and 6 because we should configure
  HAVE_VIRGL_CONTEXT_INIT firstly.

- Validate owner of memory region to avoid slowing down DMA.

- Use memory_region_init_ram_ptr() instead of
  memory_region_init_ram_device_ptr().

- Adjust sequence to allocate gpu resource before virglrender resource
  creation

- Add virtio migration handling for uuid.

- Send kernel patch to define VIRTIO_GPU_CAPSET_VENUS.
  https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/

- Add meson check to make sure unstable APIs defined from 0.9.0.

Changes from V1 to V2 (virtio gpu V4)

- Remove unused #include "hw/virtio/virtio-iommu.h"

- Add a local function, called virgl_resource_destroy(), that is used
  to release a vgpu resource on error paths and in resource_unref.

- Remove virtio_gpu_virgl_resource_unmap from
  virtio_gpu_cleanup_mapping(),
  since this function won't be called on blob resources and also because
  blob resources are unmapped via virgl_cmd_resource_unmap_blob().

- In virgl_cmd_resource_create_blob(), do proper cleanup in error paths
  and move QTAILQ_INSERT_HEAD(&g->reslist, res, next) after the resource
  has been fully initialized.

- Memory region has a different life-cycle from virtio gpu resources
  i.e. cannot be released synchronously along with the vgpu resource.
  So, here the field "region" was changed to a pointer and is allocated
  dynamically when the blob is mapped.
  Also, since the pointer can be used to indicate whether the blob
  is mapped, the explicite field "mapped" was removed.

- In virgl_cmd_resource_map_blob(), add check on the value of
  res->region, to prevent beeing called twice on the same resource.

- Add a patch to enable automatic deallocation of memory regions to resolve
  use-after-free memory corruption with a reference.

References

Demo with Venus:
- https://static.sched.com/hosted_files/xen2023/3f/xen_summit_2023_virtgpu_demo.mp4
QEMU repository:
- https://gitlab.freedesktop.org/rui/qemu-xen/-/commits/upstream-for-virtio-gpu

Thanks,
Ray

Antonio Caggiano (4):
  virtio-gpu: Handle resource blob commands
  virtio-gpu: Resource UUID
  virtio-gpu: Support Venus capset
  virtio-gpu: Initialize Venus

Dmitry Osipenko (1):
  virtio-gpu: Don't require udmabuf when blobs and virgl are enabled

Huang Rui (4):
  linux-headers: Update to kernel headers to add venus capset
  virtio-gpu: Configure new feature flag context_create_with_flags for
    virglrenderer
  virtio-gpu: Support context init feature with virglrenderer
  virtio-gpu: Introduce virgl_gpu_resource structure

Robert Beckett (1):
  virtio-gpu: make blob scanout use dmabuf fd

Xenia Ragiadakou (1):
  softmmu/memory: enable automatic deallocation of memory regions

 hw/display/trace-events                     |   1 +
 hw/display/virtio-gpu-base.c                |   4 +
 hw/display/virtio-gpu-virgl.c               | 495 ++++++++++++++++++--
 hw/display/virtio-gpu.c                     | 132 +++++-
 include/hw/virtio/virtio-gpu.h              |  13 +
 include/standard-headers/linux/virtio_gpu.h |   2 +
 meson.build                                 |   8 +
 system/memory.c                             |   2 +
 8 files changed, 627 insertions(+), 30 deletions(-)

-- 
2.25.1


