Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B038B19341
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068338.1432308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVK9-0005Li-8Y; Sun, 03 Aug 2025 09:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068338.1432308; Sun, 03 Aug 2025 09:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVK9-0005K9-5m; Sun, 03 Aug 2025 09:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1068338;
 Sun, 03 Aug 2025 09:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVK7-0005K3-QM
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:12 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2409::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f639656b-704e-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:10 +0200 (CEST)
Received: from BYAPR21CA0003.namprd21.prod.outlook.com (2603:10b6:a03:114::13)
 by SA1PR12MB7367.namprd12.prod.outlook.com (2603:10b6:806:2b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Sun, 3 Aug
 2025 09:48:04 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::c5) by BYAPR21CA0003.outlook.office365.com
 (2603:10b6:a03:114::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.0 via Frontend Transport; Sun, 3
 Aug 2025 09:48:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:47:55 -0500
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
X-Inumbo-ID: f639656b-704e-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gl/6lGs5VL+yis+ga1yMNVqxbqFgrKOffGFlrWNE2heOykgPN0NSJbL1mxwmSuUi52eA5pbt5Y3C70gU2iIqMqMzLWxIc+N2VOuIWfjo3oIz7yx6OJbjp0ORA2ux7S7+vEWoGF8OTIlbiM2xZDeUKgD+O+39AcUoJLEGIvLXfU9daZ0FaKKWphfGSViddkrBjgRUcbEgUAO2JdbekWUePETr7MS7LrcipK6pFnJ8WpHB0fuHu76Ef8Ufk3AypZ2pjcp6EvQVZw6qwrUvFly0I0AIvQrBywdZwlQJubn7eavmAxY5iBgo9JlTez8j94viey8DsJC/WNEK2NiM3N9Qsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L979/F3k7RovmtHHOlf03f4PubJLrDTXgd8cZ0e9Eqw=;
 b=Z7UQ/LzDm2dcXbghMXUgXdepSi5H4LFdJLYE/bs2r9k+lvhvR+aNSWpcK+Lfy5Q0+Hu7f8SmTvMJgKttbK7ZzYCFRTxrD/awThRwqdwM8RFiRTbAN4a9xFTpRBlUmJCIJtPwjKZEhve+REvn5yNBWQNHra1CGYMajXjnKYWTeaIQxTr3FteF3fXFp5s08MDwfTbM3LF8DyhRyxGGpr0LL+t4ENfoNRVdev7r5Y3P055mCLckrNeH7EULIr9Hgi3a80h+J6wGZEmH5qHByVTyazZq2Ow+P4g5/aFM8Fhu/BZBm7FSEDGMtR1HDZzH/0/gxCRjiZ2XvYH1YVT+k7OEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L979/F3k7RovmtHHOlf03f4PubJLrDTXgd8cZ0e9Eqw=;
 b=njGnhzZpD/4LFtM53y2VKSzxAvG/e10czwTnEeeYZ00DI65H7ICw72TWiZBnxuDEbRmgFeblwSyRV8zq877UKkcwCQjc9kes6WGUsuVG/omYmWHfsSRFkpcZ2GXn6rklMH9E1PXJnqmXoMkOcbKNgGe/xfS/B0mgsFpMfN4YbFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Tim
 Deegan" <tim@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"Shawn Anastasio" <sanastasio@raptorengineering.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
	"Juergen Gross" <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Nathan
 Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>,
	"Meng Xu" <mengxu@cis.upenn.edu>, Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v1 00/25] Introduce CONFIG_DOMCTL
Date: Sun, 3 Aug 2025 17:47:13 +0800
Message-ID: <20250803094738.3625269-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SA1PR12MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 171da079-ae70-4ada-63e3-08ddd272d6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4YJLWg53YuXRRbHewNJp1/ay/aZTIRmTCfeBuTVt1o6jH5q/nskB3DJwHd0z?=
 =?us-ascii?Q?MQV6swaYV+Agd6MxNsy37pFZRd423m88CizRRFJ937NTCTJo9VhgE7PzFbAX?=
 =?us-ascii?Q?Jw5r+tQ5037ztVLpbRpw8TPExO4I/FGoZd3VlF5NtHmdurz6VUJBcCu6tPmV?=
 =?us-ascii?Q?hIHNsdEiAMdpRekc8+Bgzs7nMCg1puYNmYT/AINBGQB6DhIXvL7DLE/8qjDE?=
 =?us-ascii?Q?ilcJ2Tae2SCG/USDUR72Yc5jOmZchtrupucDRnG3wnxOyrelLXKWswK3aOu/?=
 =?us-ascii?Q?ps/YzSChlezuvA/iqDb3EaRGRa0FLG/LzSo4SvQc55mBMnbXCDq/pOk40f4V?=
 =?us-ascii?Q?iG5ztomHS+EP7aZGXP1I09GvFOVURiQzyA8cbotsMT2k+lNQKC+r6VfF6iHE?=
 =?us-ascii?Q?Zs2Ui09CKZapU1OkS74zRuU1eglt5DvyTT8Lu+od8bfVLZw5vY9we6mqTmAr?=
 =?us-ascii?Q?7VzmZhWQ+65a+xyHiq8FSidAeyrDPRNxvCr+7JJvTl6N3QqwOeY0CJ+KAqyv?=
 =?us-ascii?Q?QbzYTQunR5sX4O9pYgNJtum+TkzmZkKRn4q23vbny8fhE2BnWoxOV/1YTdo/?=
 =?us-ascii?Q?VL2UOuV5MLul3bnmPF4VFfurVhQmtHe0GHaowp7etP8JU0qCr9CB1qQMedPU?=
 =?us-ascii?Q?9aq1WGPb7Ckgkm2Ga8svlUrVupLlsat3AWUo5anLSS4YFKNyKeobWIm/Wv/U?=
 =?us-ascii?Q?QFgcU8MJIOIF5FZlpis/3j7KGv+fPSYaz6ADGRxN0NFNoMSQTyrnxZVxNljX?=
 =?us-ascii?Q?Z2+GR9pHsJnnfeyU9GYVhkAOz/lk9j5EwlXB4MiH+sbOjL0jcBaMdlYJpfa5?=
 =?us-ascii?Q?3P8C9Ad9jXv480h0AaF4N+0Tb7N2zeCYE04beKfsU+TAVuMZmXNX6jgaeYIT?=
 =?us-ascii?Q?R72NDa95ULeKsXDQ6f53FIJd3scMDpt8WwAZAE+/1k5Cuo/E4Z5GcVbiAo8g?=
 =?us-ascii?Q?8Rkc4w1DC1Q12ODUi4dnADtyodcwhp60gMVVUg61BipZv41QuxLooyo2h6t5?=
 =?us-ascii?Q?i4weDD1cI5XZ4Gah+uEW0qfZKaRI+w1ttL9qWoOmFVG6bC7IqdOgjszpxikX?=
 =?us-ascii?Q?5oqiTrG9qoPxalj21VUUAXvF+6PR+sVs7SUdP7XMt9wr6z4NRm7hPOVlKyfj?=
 =?us-ascii?Q?iPJadFAxqnHYk5DndHyTkaQuej4ct7e6wHev2F4xS6S6l5WXfUFXkWZ9ds+f?=
 =?us-ascii?Q?5Bax2S1O4L7d88AKGCcbeccNCrBd2EwzNTSJqzSJ5ZD9lVagqEq7uVpoQE3U?=
 =?us-ascii?Q?DEQnUl02UeAnhU6yLSHzpXwRnhaKdItIBsjl2XOoySk4M8NYnfQ+O4rMO7NN?=
 =?us-ascii?Q?LrqCWtW/MXrNPkV1wJqepaddcHzUsuXdHYNC04R6CaD7Bz2W3keQUPvq+uVk?=
 =?us-ascii?Q?/4fvdOSjSufpRYanMc07zUcWcsZ0M3NVd7ONeBaJvKnxsMMh/cEgaJi019Ns?=
 =?us-ascii?Q?Qpz9NbODRP8+AxFWZ1EynWvD+pyHl42FyKnz/T8DAT/9fkFTzEwhpdRgq4V7?=
 =?us-ascii?Q?da7DjE1yu6t7tEUW4vvi5zDOwve6uUClAWnS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:03.0302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 171da079-ae70-4ada-63e3-08ddd272d6ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7367

It can be beneficial for some dom0less systems to further reduce Xen footprint
via disabling some hypercalls handling code, which may not to be used &
required in such systems. Each hypercall has a separate option to keep
configuration flexible.

Options to disable hypercalls:
- sysctl
- domctl
- hvm
- physdev
- platform

This patch serie is only focusing on introducing CONFIG_DOMCTL. Different
options will be covered in different patch serie.

Features, like VM event, or paging log-dirty support, which fully rely on
domctl op, will be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as
much as possible.

It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

Penny Zheng (25):
  xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
  xen/x86: consolidate vram tracking support
  xen/x86: complement PG_log_dirty wrapping
  xen: consolidate CONFIG_VM_EVENT
  xen: introduce CONFIG_DOMCTL
  xen/domctl: provide stub for domctl_lock_{acquire,release}
  xen/domctl: wrap around XEN_DOMCTL_pausedomain
  xen/domctl: wrap around XEN_DOMCTL_soft_reset
  xen/domctl: wrap around XEN_DOMCTL_destroydomain
  xen/domctl: wrap around XEN_DOMCTL_setnodeaffinity
  xen/domctl: wrap around XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity}
  xen/domctl: wrap around XEN_DOMCTL_scheduler_op
  xen/domctl: wrap around XEN_DOMCTL_getvcpucontext
  xen/domctl: wrap around XEN_DOMCTL_{irq_permission,iomem_permission}
  xen/domctl: wrap around XEN_DOMCTL_settimeoffset
  xen/domctl: wrap around XEN_DOMCTL_set_target
  xen: add stub for XEN_DOMCTL_getdomaininfo
  xen/domctl: wrap around XEN_DOMCTL_set_access_required
  xen: make CONFIG_VM_EVENT depend on DOMCTL
  xen/domctl: wrap around XEN_DOMCTL_set_virq_handler
  xen/domctl: wrap aound iommu-related domctl op
  xen/domctl: wrap around XEN_DOMCTL_{get,set}_paging_mempool_size
  xen/x86: make CONFIG_X86_PSR depend on SYSCTL || DOMCTL
  xen/domctl: wrap around arch-specific domctl op
  xen/domctl: wrap around domctl hypercall

 xen/arch/arm/arm32/Makefile                 |  2 +-
 xen/arch/arm/arm64/Makefile                 |  2 +-
 xen/arch/arm/domain.c                       |  5 ++
 xen/arch/arm/include/asm/tee/tee.h          |  2 +
 xen/arch/arm/mem_access.c                   |  2 +
 xen/arch/arm/mmu/p2m.c                      |  8 +++
 xen/arch/arm/mpu/p2m.c                      |  2 +
 xen/arch/arm/tee/ffa.c                      |  4 ++
 xen/arch/arm/tee/optee.c                    |  4 ++
 xen/arch/arm/tee/tee.c                      |  2 +
 xen/arch/arm/time.c                         |  2 +
 xen/arch/ppc/stubs.c                        |  6 ++
 xen/arch/riscv/stubs.c                      |  2 +
 xen/arch/x86/Kconfig                        |  1 +
 xen/arch/x86/Makefile                       |  4 +-
 xen/arch/x86/configs/pvshim_defconfig       |  1 +
 xen/arch/x86/domain.c                       |  4 ++
 xen/arch/x86/domctl.c                       |  4 ++
 xen/arch/x86/emul-i8254.c                   |  2 +
 xen/arch/x86/gdbsx.c                        |  4 ++
 xen/arch/x86/hvm/Makefile                   |  4 +-
 xen/arch/x86/hvm/hvm.c                      |  4 ++
 xen/arch/x86/hvm/pmtimer.c                  |  2 +
 xen/arch/x86/hvm/save.c                     |  2 +
 xen/arch/x86/hvm/svm/svm.c                  |  8 +++
 xen/arch/x86/hvm/vmx/vmx.c                  | 16 +++++
 xen/arch/x86/include/asm/hvm/hvm.h          | 22 +++++++
 xen/arch/x86/include/asm/hvm/monitor.h      | 65 ++++++++++++++++++++-
 xen/arch/x86/include/asm/hvm/vm_event.h     |  4 ++
 xen/arch/x86/include/asm/hypercall.h        |  2 +
 xen/arch/x86/include/asm/mem_access.h       |  9 +++
 xen/arch/x86/include/asm/monitor.h          | 15 +++++
 xen/arch/x86/include/asm/p2m.h              |  8 ++-
 xen/arch/x86/include/asm/paging.h           | 34 +++++------
 xen/arch/x86/mm/hap/hap.c                   | 38 ++++++++++++
 xen/arch/x86/mm/mem_access.c                |  2 +
 xen/arch/x86/mm/mem_paging.c                |  2 +
 xen/arch/x86/mm/mem_sharing.c               |  4 ++
 xen/arch/x86/mm/p2m-pod.c                   |  2 +
 xen/arch/x86/mm/p2m.c                       |  2 +
 xen/arch/x86/mm/paging.c                    | 36 ++----------
 xen/arch/x86/mm/shadow/common.c             |  8 +++
 xen/arch/x86/mm/shadow/none.c               |  4 ++
 xen/arch/x86/psr.c                          | 18 ------
 xen/arch/x86/time.c                         |  2 +
 xen/common/Kconfig                          |  9 ++-
 xen/common/Makefile                         |  5 +-
 xen/common/argo.c                           |  2 +
 xen/common/device-tree/device-tree.c        |  2 +
 xen/common/domain.c                         | 10 ++++
 xen/common/event_channel.c                  |  2 +
 xen/common/grant_table.c                    |  2 +
 xen/common/sched/arinc653.c                 |  2 +
 xen/common/sched/core.c                     |  6 ++
 xen/common/sched/credit.c                   |  4 ++
 xen/common/sched/credit2.c                  |  4 ++
 xen/common/sched/private.h                  |  4 ++
 xen/common/sched/rt.c                       |  4 ++
 xen/common/vm_event.c                       |  2 +
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  8 +++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    |  6 ++
 xen/drivers/passthrough/arm/smmu-v3.c       |  4 ++
 xen/drivers/passthrough/arm/smmu.c          |  4 ++
 xen/drivers/passthrough/device_tree.c       |  6 ++
 xen/drivers/passthrough/iommu.c             |  2 +
 xen/drivers/passthrough/pci.c               |  6 ++
 xen/drivers/passthrough/vtd/iommu.c         |  6 ++
 xen/include/hypercall-defs.c                | 10 +++-
 xen/include/xen/domain.h                    | 18 ++++--
 xen/include/xen/mem_access.h                | 36 +++++++++++-
 xen/include/xen/monitor.h                   |  8 ++-
 xen/include/xen/vm_event.h                  | 24 +++++++-
 xen/include/xsm/dummy.h                     |  2 +
 xen/include/xsm/xsm.h                       | 40 ++++++++++---
 xen/lib/x86/Makefile                        |  2 +-
 xen/xsm/dummy.c                             | 16 ++++-
 xen/xsm/flask/hooks.c                       | 36 +++++++++---
 77 files changed, 550 insertions(+), 118 deletions(-)

-- 
2.34.1


