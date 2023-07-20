Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0775ADDC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 14:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566569.885559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSSa-0004Kf-AQ; Thu, 20 Jul 2023 12:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566569.885559; Thu, 20 Jul 2023 12:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSSa-0004IR-7h; Thu, 20 Jul 2023 12:08:44 +0000
Received: by outflank-mailman (input) for mailman id 566569;
 Thu, 20 Jul 2023 12:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5mVk=DG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1qMSSZ-0004IL-94
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 12:08:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a251b6b-26f6-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 14:08:40 +0200 (CEST)
Received: from SJ0PR13CA0156.namprd13.prod.outlook.com (2603:10b6:a03:2c7::11)
 by DM4PR12MB6088.namprd12.prod.outlook.com (2603:10b6:8:af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 12:08:36 +0000
Received: from CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c7:cafe::2c) by SJ0PR13CA0156.outlook.office365.com
 (2603:10b6:a03:2c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.20 via Frontend
 Transport; Thu, 20 Jul 2023 12:08:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT074.mail.protection.outlook.com (10.13.174.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.28 via Frontend Transport; Thu, 20 Jul 2023 12:08:36 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 07:08:31 -0500
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
X-Inumbo-ID: 2a251b6b-26f6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bx+iNGstkIYsdm93IjChgam34Y741kYWQYAs5b1ZvWM+9Fg80nvtp+R0k/3yYHsxjMS+0mNVF/oIo5ovwrktWcj90k7thQnjVnETfqRFdRW6sxZwkjCxfIryiUfoGW7W9DSV26wPZR2wmj799PqPVjYywORUX2sj8plw4nt4mc8TJw+CCWBc5oLXo5wkDM2A901cOR+ZyNBIA3uGdZvokYX3bBNRupqMmUHDNkGFEcUuYQGWfEQ55ZG/rIwPTGli5nvkzqqtuKYkYGZWWpZ3o7huEsjOppL/XVIfZSk1urDPc4xC/0W4PK6+3z+i3cbZW0WLPdPxjE03O+1fCijuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ9pj/iaxuUff0x3bnr1X9IpLfVr35JpB2JPJTt6P9c=;
 b=RxGAQrAtoAAP/NWWlV3mLMZpP5WP8OXV/NTUnygIajKL+9NuxlFW/93f/jmv8jisCANIu7tntTutCFP/SdNsyseASUMZZnjcKT4MJdqGjbkjx+ffMHRJY8FZEwVR0xrEWHhwzjjCB7oRK/krqnxgVXmLQ4cYg4nkb+I2UF5VOuzaH0BNz0RV67SGbz/iPmVxitf9qohVxP2zquvdq0Cx/nvd4RetWkSeV4tt+D9IFeDhUszkfclxCtTEue9QTLDQ1psS3htYdsEvifnbfdEJKX+2MV+CKb3Amrtkbz6TgWeAJhrzrgF19CETEqbkznwlpyCrK6Bpm/H/RX/2+pkgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ9pj/iaxuUff0x3bnr1X9IpLfVr35JpB2JPJTt6P9c=;
 b=fhDPD2QBwgYspP3RarJbzRnOWvdbgccilado6ER2rdk4UUXDLAjb913Fj0gleQcZ+5la7Jr6FGPzpBO3IKHFbYLkfE1D1S0X4cHrUKyDcxWfcxrNyvUID2RvkwHS5DhZ9tBVxlRN9HLQiW8ExQX3rlz9kRV+SSxkP+wE09KgjUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Robert
 Beckett" <bob.beckett@collabora.com>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Alex Deucher <Alexander.Deucher@amd.com>,
	Christian Koenig <Christian.Koenig@amd.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>,
	Huang Rui <Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [QEMU PATCH v4 0/1] S3 support
Date: Thu, 20 Jul 2023 20:08:15 +0800
Message-ID: <20230720120816.8751-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT074:EE_|DM4PR12MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: cc098db3-75fb-406a-111c-08db891a0bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	33wYTmt0JEQfT4p2Tho6l7PnBKGlFvsyDyL+Ln74JnKl3fjDs+C7a1KpWoXmD5+q1tXv04mt897X/36lJVSfUhiJBd4U1FpodRu+0K1Q+SK3w2Mj7XZjhstbCPu0SoYRVAs+sfkLznZmRN4Ah+jC9k8WCx+u/DKdXRfnuQFvHPK55GDVzN3gfUa8dtp+EAXl5iYcVg9EEaAWuNi9ra1MZMaTlIJcbYUsUpPrbyDwI9oA+tEK/yofBr+8ExmO1ODYJxspyveDH/8LHpxpNPoArcNXsizG2klsbxPxcvpAhrgey3QtzEm4I9pzGyk22/8ippoP/V6BJffXtnwt23tWiAJ96FfnyFFBtRNZykxYmQudg2apolTw1D90VfWCAmXRG5U+DMz1QKFYuQd9YQ9Rr/6zWCNQXrTr1y6Q1hTFpkZKcXouAF12jws/UeG0KLA/wZzCe9Xmsb5oBDTDNBP/83bB02HhGGIr803SW2rr/mlfGXYt0aiqyQPnVD5NJ8USrKyn4vcx/4whpNheEq12em/XgfJObN0LFOTxEAkdeqm3AsX8ena1JACtec3VNgt8sZrhKPhQltM9JjICUwXsrnDB0R7KavBjuvSRVXcuzhY36NJSPGSxIFfkcr3JVkvG+xxwd4vYnX4s8H64+qM7jRxL57rOPKo5KNtZfG2iozdnBcJ9w1VqjeB2nvAHe7ETHZYGom4Md9XTGsbz6c0gO0pi8VGNmj8hpw3m8wZtV1RkivDg9oKeJNa3VY1obSJ1YlFQnlclZNgvz65Rz+G+DwwoQqm9XOvrxlCFCbQ6pA0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(40460700003)(8676002)(8936002)(86362001)(426003)(47076005)(36756003)(2906002)(2616005)(41300700001)(83380400001)(40480700001)(26005)(5660300002)(336012)(186003)(1076003)(16526019)(7416002)(70206006)(70586007)(4326008)(7696005)(82740400003)(110136005)(356005)(6666004)(54906003)(966005)(316002)(81166007)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:08:36.4284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc098db3-75fb-406a-111c-08db891a0bf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6088

v4:

Hi all,
Thanks for Gerd Hoffmann's advice. V4 makes below changes:
* Use enum for freeze mode, so this can be extended with more
  modes in the future.
* Rename functions and paratemers with "_S3" postfix.
And no functional changes.

latest version on kernel side:
https://lore.kernel.org/lkml/20230720115805.8206-1-Jiqian.Chen@amd.com/T/#t

Best regards,
Jiqian Chen.


v3:
link,
https://lore.kernel.org/qemu-devel/20230719074726.1613088-1-Jiqian.Chen@amd.com/T/#t

Hi all,
Thanks for Michael S. Tsirkin's advice. V3 makes below changes:
* Remove changes in file include/standard-headers/linux/virtio_gpu.h
  I am not supposed to edit this file and it will be imported after
  the patches of linux kernel was merged.


v2:
link,
https://lore.kernel.org/qemu-devel/20230630070016.841459-1-Jiqian.Chen@amd.com/T/#t

Hi all,
Thanks to Marc-André Lureau, Robert Beckett and Gerd Hoffmann for
their advice and guidance. V2 makes below changes:

* Change VIRTIO_CPU_CMD_STATUS_FREEZING to 0x0400 (<0x1000)
* Add virtio_gpu_device_unrealize to destroy resources to solve
  potential memory leak problem. This also needs hot-plug support.
* Add a new feature flag VIRTIO_GPU_F_FREEZING, so that guest and
  host can negotiate whenever freezing is supported or not.

v1:
link,
https://lore.kernel.org/qemu-devel/20230608025655.1674357-1-Jiqian.Chen@amd.com/

Hi all,
I am working to implement virtgpu S3 function on Xen.

Currently on Xen, if we start a guest who enables virtgpu, and then
run "echo mem > /sys/power/state" to suspend guest. And run
"sudo xl trigger <guest id> s3resume" to resume guest. We can find that
the guest kernel comes back, but the display doesn't. It just shown a
black screen.

Through reading codes, I founded that when guest was during suspending,
it called into Qemu to call virtio_gpu_gl_reset. In virtio_gpu_gl_reset,
it destroyed all resources and reset renderer. This made the display
gone after guest resumed.

I think we should keep resources or prevent they being destroyed when
guest is suspending. So, I add a new status named freezing to virtgpu,
and add a new ctrl message VIRTIO_GPU_CMD_STATUS_FREEZING to get
notification from guest. If freezing is set to true, and then Qemu will
realize that guest is suspending, it will not destroy resources and will
not reset renderer. If freezing is set to false, Qemu will do its origin
actions, and has no other impaction.

And now, display can come back and applications can continue their
status after guest resumes.

Jiqian Chen (1):
  virtgpu: do not destroy resources when guest suspend

 hw/display/virtio-gpu-base.c   |  3 ++
 hw/display/virtio-gpu-gl.c     | 10 ++++++-
 hw/display/virtio-gpu-virgl.c  |  7 +++++
 hw/display/virtio-gpu.c        | 55 ++++++++++++++++++++++++++++++++--
 hw/virtio/virtio.c             |  3 ++
 include/hw/virtio/virtio-gpu.h |  6 ++++
 6 files changed, 81 insertions(+), 3 deletions(-)

-- 
2.34.1


