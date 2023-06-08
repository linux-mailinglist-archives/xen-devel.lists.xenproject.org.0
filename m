Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE78A727690
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 07:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545090.851350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q780z-0002Vq-2E; Thu, 08 Jun 2023 05:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545090.851350; Thu, 08 Jun 2023 05:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q780y-0002Sz-U0; Thu, 08 Jun 2023 05:16:52 +0000
Received: by outflank-mailman (input) for mailman id 545090;
 Thu, 08 Jun 2023 02:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nBD=B4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1q75rG-0004rr-CX
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 02:58:42 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e3b6ef6-05a8-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 04:58:40 +0200 (CEST)
Received: from MW3PR05CA0021.namprd05.prod.outlook.com (2603:10b6:303:2b::26)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 02:58:35 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::2c) by MW3PR05CA0021.outlook.office365.com
 (2603:10b6:303:2b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Thu, 8 Jun 2023 02:58:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Thu, 8 Jun 2023 02:58:35 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 21:58:30 -0500
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
X-Inumbo-ID: 5e3b6ef6-05a8-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0dY5/27g2eph55w8e9ozNkKel7en8xmUTUTELADSm63S9QkDMUO0zfByDQuRFOwPWk4cx7CSa+O0PMrFxrNDvzlJds8qCOuVK4JfwzZAHP6i/NfV5mXL8eiZPR7cyUyIgfIbp170WyMOVIpSlJfcAbtEy+TAdG37UKqenGkb679Sy12sZnw0JLlkUXKwxBkE6N1F43SU0w5+e9dPk/YEr0wNj9wOqbBKzYXEWqroSMlQ8BgZwDhxhbRJk4ff+yqrbFG+OaUNfkW/F3ATUwuHdYGrrZdQlTw+nDOnop16vu6/i4mEF4A/15XcEGbcxBU/IoiB+jon568vhMNOpy7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8/Q2+Pz93oHH5y9Q2HrhJbwQdEQfl4i0Cdc66N/5YM=;
 b=Uj/oCKxoUqbWMOKcj4jo1L/DkMRAXV2Aei26htHiX13jo7VXshS0OvncSTFYCNYuNC0lVo+vnA8DngKgXnbVSY+fqETtPfleZpf5TPPvsngjPUMYXpONnD85XguKKxvTJwXeFNslOiw8p405SAEJ/He2sZtSs/13xE9wTedL9CVyP8LLPSNbwE1Gmb+tBtEl2qtsMDYS8AuIBATpUoAI79mKtGip1B+0Xof1XiGKzFzwjVq4WvCRb6WedIUn6CEyeYLFyW6Wy6VgGHKlJ8yT6HdaxhqygjLjqVji0OGnrpP7ifWUt6/Wf0fU0pqk1y7xa/Sjkt0JxZBuTBjkL9RDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8/Q2+Pz93oHH5y9Q2HrhJbwQdEQfl4i0Cdc66N/5YM=;
 b=wSHhmWSumB3sFnBFZ690t1nAu904qEAaQBRpmC2dWZ825fZXoJGPICoi1nu7ff5iYL2LHAHFfrwtQO/Wuw3hRSrbVoi7+ZNf6uTIjRqQU9DRH1pMXz3WjzFfvrGT/2gQCML2q3C3DdrwjjZSnwSsJ4o6oSZkEx+k6fd7HU1Pe7Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <Alexander.Deucher@amd.com>, Christian Koenig
	<Christian.Koenig@amd.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>, Honglei Huang
	<Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [QEMU PATCH 0/1]
Date: Thu, 8 Jun 2023 10:56:54 +0800
Message-ID: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 4caee1c4-31b0-4e16-d363-08db67cc4075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nZKmOSBEr5DSUNcMJ6bkEXLRSrlThNUwc4c1tzXEfUJv/O25PxkVLF504ewymgm63acKs6Omz6TnZpk0h8iIPWRtyr4VI9H5/xkZv9rf1bXdk4vf9UeDoNytS9iGB5fHvuYrA26fLGtBl88O2jogFwXH5H/WRMLu6AKThEorUigg9rcMbdYwm1BFBPJmRn3xjZIPQs/ObRcaFYhb+D790FiYf9xV/DMV6xU7zd/Zfz9uyr0UrOd2ctl7GGnCO64Smv9wrehpUz71ezqAsQWJWzVFVdEywiRc1fmNMA+kR8d9BKzUmslTHb91QbWmKrvkQAwidMXiipNqrntBLASQ7PMpi7E2zSMnF7ZxMluepTK+/hNrQwhBFsqwWU1YuopYwXHA+3DmXvPl/LralUjSq4PZP1NEOIDIKiDx3jtchN0Gs/EdoRCk1Gm3Jwfic3R20PRz4rd8yedNvEN8mPJhAFqE2e/2xUnmhJIPp0w7W6juzHMFuIIVs/PXWxQuMRBRxCmgT77M9xnJevQtGyxZ3ByHGNrrZcI63AJOlng156Xx2lFePSQfdLtowUK337bVcNKNvoD2MgU37tzCr3hZODk2ore3CEWQdGW0yJOPPsF+uFtEXIncLLPH/0EvfKrMfAVR2/Ba3Dtiv2c1k05T4WZK1r/3lIKYCZo9kAXnZ89BL88Gy8SyLmq8U0B/t78u34i0vLcU67ny/PSF6Jj286WN8i+XXDZMWlVzJXG6t1aB1BV2xw5I4qxs4oihB7soyXQjTqjJKuKP5f65l6FxJt0mozVhPI1H5x/dCv5TWgg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(47076005)(2616005)(26005)(1076003)(356005)(81166007)(921005)(316002)(40480700001)(83380400001)(70206006)(70586007)(4326008)(7696005)(6666004)(16526019)(186003)(36860700001)(426003)(336012)(40460700003)(478600001)(82310400005)(110136005)(36756003)(54906003)(2906002)(5660300002)(8676002)(82740400003)(8936002)(86362001)(41300700001)(7416002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 02:58:35.4103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caee1c4-31b0-4e16-d363-08db67cc4075
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470

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

 hw/display/virtio-gpu-gl.c                  |  9 ++++++-
 hw/display/virtio-gpu-virgl.c               |  3 +++
 hw/display/virtio-gpu.c                     | 26 +++++++++++++++++++--
 include/hw/virtio/virtio-gpu.h              |  3 +++
 include/standard-headers/linux/virtio_gpu.h |  9 +++++++
 5 files changed, 47 insertions(+), 3 deletions(-)

-- 
2.34.1


