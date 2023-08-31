Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BD778E979
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593570.926574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3I-0005t7-GO; Thu, 31 Aug 2023 09:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593570.926574; Thu, 31 Aug 2023 09:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3I-0005pX-Dl; Thu, 31 Aug 2023 09:33:24 +0000
Received: by outflank-mailman (input) for mailman id 593570;
 Thu, 31 Aug 2023 09:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe3G-0005pR-RB
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:33:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e89::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be56da1-47e1-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:33:21 +0200 (CEST)
Received: from MW2PR2101CA0024.namprd21.prod.outlook.com (2603:10b6:302:1::37)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 09:33:17 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:302:1:cafe::55) by MW2PR2101CA0024.outlook.office365.com
 (2603:10b6:302:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.9 via Frontend
 Transport; Thu, 31 Aug 2023 09:33:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:33:16 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:33:10 -0500
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
X-Inumbo-ID: 6be56da1-47e1-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWpia6LSni2HH+R19FgEnQYCWCD4FSkSL+exj7E2WwupvwdI6WpCu+j/TiBRCGl0PGcfcF7iChmsjMGXrXubmlGykWXmFh5hot4hQuGy9FZFWnpJLTEytJRRdh8Y9/5jzMWVLKQOGKzG6Qj/+5vhh9x5DIeOdTrbamNgk0zlSzy2Ar/OFbLqijdLP86iyhW86flFS+l5iLD0TPoWHZMnyDKMQWvUZAcvqh2XiwuYw1hTIAzN99HW3bShBzPkMFWS7HD7RCeEoMgDP8TndzjSsmYyB73znR4UULrWoXIPUvVGBiGfyTNAMoyKh7a/44BnBZhkhjW7OroShWlcXE6isg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40iM+fZux/xCi4XmCq6hzMQOQ9bUd0OFvX4rrQtY/pc=;
 b=UU60r8fG+F1JJnuVh3njYnUoA0j36Ri9Ge1O/iRm2NVXokLmvphlFrU7Lps5uy3kdxslZsdyRLZaausYz0bYT15cqjXguzAcuNO/GZcKRlm4TT/1glJOCK/zI6gWzW3Dl6FbFZZjkGruldIrwSNzs8+uAH9gFCEpBm0DuBJVE+bujdJia+ITiS+fO2yfwrI540vvVcvsQoWVSxof9P1DmJw/SZ5hkCypEquXGm9/bWisbFX15b6u7RZHODneIch+7LdbIntSPRutYSfgxaKSuK+IaaUH8UN4XrOW3WHoFst1KvNA/sHyS3PoNwGsUYy7WJar2yixnrMcolUx26y/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40iM+fZux/xCi4XmCq6hzMQOQ9bUd0OFvX4rrQtY/pc=;
 b=N/oWC1EG6DRzt1lSSUXsSQ9YalQ4H8wUMdaG1Gqx/4XU6WRECl46UOTtK9wEgnryOfMKNP9yZtTM4kGcGbSOBm5+4rYV62A/zPOjhqVAjKIHWwc1E3BYLo+oquOE+yAywVqogH6wfDpJ15kG1Hauaq75LFBUOXufzWeNSjCVhpg=
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
Subject: [QEMU PATCH v4 00/13] Support blob memory and venus on qemu
Date: Thu, 31 Aug 2023 17:32:39 +0800
Message-ID: <20230831093252.2461282-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DM8PR12MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3c0d40-ad27-4e8e-874f-08dbaa054e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/iHGW0ABY3mH3/L11xmSshoBnuBFKerSyq8+VZw7zz6+m+CjsrIR9MTOBAmZctxICpznEIkv+vCK2EZ2+oPaZmEE5bWvDX4V6c0lkJ6lel278gJITQrFs8ZLYqidcYGvsw5EymjMhrVICA4mWtGKLvu9yw6xJJqQIQkHP89iVywcEw5vLohJ+dQ9GLKIVaGfKFCRIM8Q7kyBECmoD3uDjzP0hzkjTELuVi2HdIwp8tBLiBvpZMqAVfSarMsD9qjr1DosHliR5w5ixpyIqTNBSwKiCz0jTKEHNfKi07M/OrN1s3Fvz4bR1KwiZo3jUIHyFo8xjgKnd7B43vs3s16VvaT/coxurAqol5mDdK1cWU+30Ei5Mk+55T9O3qtzGKtpgrpuEx2X0D6wdnnEgK8coDsAIOpKArtS9ot4HyPr1q8nhfeN77GUCsXLGdixmMplfoBD/V7C4IhbNR9NRBx0qbtyt6hMogr+BaKsZdtkMVgqGqw5IhtcdvsKwxVXz8IaXHPh5T9cLfzygjK+OvPXxKXagAipjbu/0Pwho1e4AKmpgiAHvhhKXIAltZ5L3dMHV7bDBl2Gqg6ng5DALDsxnihiKDUbI+wVpKGJZwGTZ9qizzQoHzvGW8KPoNfPigJT8ta+PFn4iRSm9ixReY48vKBLNh2f5XhQSNEL2KozxSrgbPC7ZE6z6Fx2tQjwe6RQx41BTI5x4oND7b3Gge1mCRrhbP3Hy/oLQtRfnM5XSRt/wl8hf8D6FPewiawwuTL6WBI4dBwuohjB33f/7ZzRAfGsYK5qCeNzCRU9DyivEgWkWDb1LGyUQKSk+BRHHgz6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(36840700001)(46966006)(426003)(40460700003)(316002)(66899024)(41300700001)(5660300002)(336012)(4326008)(7416002)(8676002)(47076005)(16526019)(83380400001)(2616005)(86362001)(26005)(36756003)(1076003)(36860700001)(2906002)(40480700001)(8936002)(6666004)(356005)(82740400003)(81166007)(921005)(7696005)(966005)(54906003)(70206006)(70586007)(478600001)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:33:16.8001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3c0d40-ad27-4e8e-874f-08dbaa054e60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5400

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
  virtio-gpu: Support context init feature with virglrenderer
  virtio-gpu: Configure context init for virglrenderer
  virtio-gpu: Enable virglrenderer render server flag for venus

Xenia Ragiadakou (1):
  softmmu/memory: enable automatic deallocation of memory regions

 hw/display/trace-events                     |   1 +
 hw/display/virtio-gpu-base.c                |   5 +
 hw/display/virtio-gpu-pci.c                 |  14 +
 hw/display/virtio-gpu-virgl.c               | 270 +++++++++++++++++++-
 hw/display/virtio-gpu.c                     |  61 ++++-
 hw/display/virtio-vga.c                     |  33 ++-
 hw/virtio/virtio-pci.c                      |  18 ++
 include/hw/virtio/virtio-gpu-bswap.h        |  15 ++
 include/hw/virtio/virtio-gpu.h              |  22 ++
 include/hw/virtio/virtio-pci.h              |   4 +
 include/standard-headers/linux/virtio_gpu.h |   2 +
 meson.build                                 |   8 +
 softmmu/memory.c                            |  19 +-
 13 files changed, 446 insertions(+), 26 deletions(-)

-- 
2.34.1


