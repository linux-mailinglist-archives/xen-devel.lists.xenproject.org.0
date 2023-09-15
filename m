Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED377A1D24
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603000.939865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kM-00030z-7u; Fri, 15 Sep 2023 11:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603000.939865; Fri, 15 Sep 2023 11:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6kM-0002xh-4k; Fri, 15 Sep 2023 11:12:26 +0000
Received: by outflank-mailman (input) for mailman id 603000;
 Fri, 15 Sep 2023 11:12:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6kK-0002xb-A2
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:12:24 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd6076f3-53b8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 13:12:22 +0200 (CEST)
Received: from DM5PR07CA0066.namprd07.prod.outlook.com (2603:10b6:4:ad::31) by
 CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 15 Sep
 2023 11:12:16 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::bd) by DM5PR07CA0066.outlook.office365.com
 (2603:10b6:4:ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20 via Frontend
 Transport; Fri, 15 Sep 2023 11:12:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 11:12:16 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:12:09 -0500
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
X-Inumbo-ID: bd6076f3-53b8-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iapucUr2vlsSieZWHSWhgcM0TK9cVn0Nmkc99XtKkpxHGX60lLJtTgq1txWaL8T5n++BqOkO1AMRoFalUOuxRFXJ9VS6vS1m3QN4LJZjbi/7eKrkPuY/ElRD2DJtEb8i9cYoXePSVK1kipBiWFl6/QDJvGQWPQL8BHssEw6mcUdz7m8B+N7WP59vrXr30CnrJihVTS5i6tIx/1210Kvbj7rpdrInccKT0SgcGgA0PhA9QLnsUGrjBeQNWf8Qp6buMAhElMGl7YmNMVWvU2s8i0wEVgjgxMeqR6xfYBR+2tw6/J8exv+o38NUzYu6LVW8pUD7C5yfQV2YR/v5p2x7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJxBlYZ1zS11ui7pIdit0J45GPJ0moHkIBTnw8ZAyRY=;
 b=Qg7WF3GEdM1ARipxW25qj3dPS4zdAXmpT34L4k8ToAqjeCfurJKAm4710MKRAqUflkmmzjtVQJQOOXGYS98cRjccYWM1xGquQVdSXrfTIq/raI8l326gKz0mOC8dY3roLK8QmI8PtmwRtPiiem6Yrxgxaj2VmZjclyrxcMP3oan81/TmBxrirMSGa0GLezPRxgK1Dyx6YzmeKbnjfkxLMhPjFJvcsBcW6fwWY1aN8+ryuVauA+ErmB17mGo0m8uEJzoKZ09PE3IU3hJK3LRcSvlYHfhsBBcOvqIw9IAlIaPWoiNhOAPF281pIIkEJkSueGgx/PyGfBw9SSUpV1752w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJxBlYZ1zS11ui7pIdit0J45GPJ0moHkIBTnw8ZAyRY=;
 b=3pqC6TilCH98HHxsLGJ4di2F/HSFs83Gu5XSQuj4AOWD0Nc4g+3Wc3jNXelaw/8g0zzb3YjtAAJwfB8XsLIcqTIcr6Z+AIMruAT76d/LbHY8VfVg9paCp4+QcY9KxYWaC131FN89q/mZWtgH/HwRUH1oNWvPYOQ+dodUKlv+NHg=
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
Subject: [QEMU PATCH v5 00/13] Support blob memory and venus on qemu
Date: Fri, 15 Sep 2023 19:11:17 +0800
Message-ID: <20230915111130.24064-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a58cfa1-f60d-4701-bd6f-08dbb5dc9e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pV9KmmlUeBWPjtOnAukKAdAT1sVRM68b3XvvENsucR8iNuS0Sz85+pzRLbecU2QdMUmveo6buuw99qQTzZH0l1uEVMSFcP4iztnpHtnlBB2Qw0FtHaJckkMGrH5rxKCUwh84ypb504A/gflCvra/STzL1rJczFGW620xtVqc/s3++tAFL9b8nmK570ZytPdnlYj4qwOuglz18NV8GdyZnj4p/uMmwFUsxB8MnBUrRQxWtQHYyxF7dLApeIU3WV9D4J64xu1Iq42OIJVJ6r/L3d1mx/JC6MdlLpzS82HQTr+763eNOTCcVoWTP2ymSfF1beMMChIQZi8Cw3zNTWZppxZWAQifcja1EAjppEFiIfHqhhgnFf/nGQ1O9YKydoGf7sUv0OPBNafOEjgLozuBTTGSpID7yr6eILi8VuKuNvrS9FogTryh/7N0xSfcNl4cc9ON3n6fXOy7UBfoG1KP41cG6Thc7iWLzsKVJbEBc0DSqStf0arA+ykBmUlkIpowsJ5uQCaEFDJi4yduC6n9rya4yMpHjGVZWPxhfk6Fa3l2qX/DLVOAHFLyl23Um3Fi8aALJfgJquihhG6mtC7hSTnIlAjwmPWhbSiNz71aMcLFtuqvS/QOYbhUDFzA/wdOBACclJyIb3eQKcIWFlcyIRwXhcDTsyFnWK+cRKqb0RRa/hH0q7L0pK+zjWJIslKh4fLsDgC8LjqnKSkpnIlnlVUd1bS0AkXksVP0wolw75hj0C2eIRfeWEZC1njKxH+I2IZIMdGPD7L23iTW3y2+HhrAnRo+UDsRe7qhbbXiE8TBZx9VHKQGOiBb96Nhi6Fz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(40460700003)(66899024)(7696005)(110136005)(2616005)(70206006)(966005)(6666004)(1076003)(478600001)(82740400003)(47076005)(16526019)(83380400001)(70586007)(356005)(86362001)(36860700001)(426003)(921005)(26005)(81166007)(336012)(2906002)(54906003)(41300700001)(7416002)(5660300002)(8936002)(8676002)(36756003)(4326008)(316002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:12:16.0125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a58cfa1-f60d-4701-bd6f-08dbb5dc9e92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880

Hi all,

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

Antonio Caggiano (6):
  virtio-gpu: CONTEXT_INIT feature
  virtio-gpu: blob prep
  virtio-gpu: Handle resource blob commands
  virtio-gpu: Resource UUID
  virtio-gpu: Support Venus capset
  virtio-gpu: Initialize Venus

Dmitry Osipenko (1):
  virtio-gpu: Don't require udmabuf when blobs and virgl are enabled

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

Huang Rui (3):
  virtio-gpu: Configure context init for virglrenderer
  virtio-gpu: Support context init feature with virglrenderer
  virtio-gpu: Enable virglrenderer render server flag for venus

Xenia Ragiadakou (1):
  softmmu/memory: enable automatic deallocation of memory regions

 hw/display/trace-events              |   1 +
 hw/display/virtio-gpu-base.c         |   5 +
 hw/display/virtio-gpu-pci.c          |  14 ++
 hw/display/virtio-gpu-virgl.c        | 272 ++++++++++++++++++++++++++-
 hw/display/virtio-gpu.c              |  78 +++++++-
 hw/display/virtio-vga.c              |  33 +++-
 hw/virtio/virtio-pci.c               |  18 ++
 include/hw/virtio/virtio-gpu-bswap.h |  15 ++
 include/hw/virtio/virtio-gpu.h       |  24 +++
 include/hw/virtio/virtio-pci.h       |   4 +
 meson.build                          |  13 ++
 softmmu/memory.c                     |   5 +
 12 files changed, 458 insertions(+), 24 deletions(-)

-- 
2.34.1


