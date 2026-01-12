Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0CD14E18
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 20:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200882.1516685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfNLt-0007l2-Rn; Mon, 12 Jan 2026 19:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200882.1516685; Mon, 12 Jan 2026 19:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfNLt-0007iL-Om; Mon, 12 Jan 2026 19:13:21 +0000
Received: by outflank-mailman (input) for mailman id 1200882;
 Mon, 12 Jan 2026 19:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1UP=7R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfNLr-0007i8-SN
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 19:13:19 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc690cf9-efea-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 20:13:12 +0100 (CET)
Received: from SA9PR13CA0176.namprd13.prod.outlook.com (2603:10b6:806:28::31)
 by DS4PR12MB9682.namprd12.prod.outlook.com (2603:10b6:8:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 19:13:04 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:28:cafe::2f) by SA9PR13CA0176.outlook.office365.com
 (2603:10b6:806:28::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.3 via Frontend Transport; Mon,
 12 Jan 2026 19:13:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 19:13:04 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 13:13:01 -0600
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
X-Inumbo-ID: bc690cf9-efea-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxMDUJ8W+x63N7c1uclnCBhUGrXKDfDs9v7hXAOLulznpO171F3fMbqRhRQ2XREoSXfRNWhsH8S8vCAcwLjvZvdKdE7zV7oJyWPmMv0JbCq6/yrGKxIvO4EBHrqOIJcLahbvnxVjSahwWYio3xLUdPS76pXwym1gP5xT9Mjhau8fAm7/9rjGsKM9TbYQ5U57AOz4bs8RS8ipZpAEbrmc67vyaTn8OtJt9r3iS4ly5u6juMd+2xdtlidgelIVFa9HpYGiAEMEcyywy7eVOdqd/9NaBxdrytV/+eEXClPo+IEXGZcamP7+kJhbhorlye5U6/E6pH1WkE/P9kS9xaEoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Diup30xjS7Ne/xG0UQc2yl/qK6JjSrERes/xZyIbWQo=;
 b=MRtLngvBsG03jwXvhd39KSe5KvC7Atb7aObLtjEUns8kYAqzxyVXN04TH45nUeFdaDftlcwHMVm+VRmoQ7Vv8EH0iakZLON9rBfq9KGfxAa+fEpi6ibsaxI5RGciUA+8LDZgse/mAFwFekzPIKIWp7iP8v7Lbgk5annsVID12iaJiefEttRSLxvZv9RoHfdjupdIEPK+swgl65DOng07sK3WdxiODT7T1QNS2RvI3EDhcSYVuePK4MP3aOaMSx6UpxRBk4vyyeiMnnK28wespUZo0HLRBuokDiEsqeBAV0ZZud/Q3rAUoUByLdaetdE7h865MFIo/PPMp73PHeax/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Diup30xjS7Ne/xG0UQc2yl/qK6JjSrERes/xZyIbWQo=;
 b=xgjImUwNWcd+StGNFOiw//GfGCubb6wLj/rZsYu40tY/k3/pvM/ihBhMmx/UTiJeHy7P7b1BILBIzOZc6e7Sv1NEspS7i+K9guWD/EPnY+aAtyG8xf7UUg6wyj4YhI1ohZ1Sfdc66LIlJMP8MLoSwyG1gZ8CE/hG79SHKu6RdrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Jan 2026 20:12:59 +0100
Message-ID: <DFMULPGYXFY8.2B2XN60W4G9IA@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove
 microcode loading
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
 <DFMU244K4E7W.6M0TQ5AI1TUE@amd.com>
In-Reply-To: <DFMU244K4E7W.6M0TQ5AI1TUE@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DS4PR12MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c114c5-7d1f-40ab-f432-08de520e9c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEF3U2tmQm1GL2l3QzNhNVoySjdjY2F5Ry84RHVQYkJrQlFWQzV5N1pOWklV?=
 =?utf-8?B?TEE2MHYrTGlCbEdTdVAwWU4wbjBLcDROTnBPcnZPbEE5bW1mVEF3SkE5cDVa?=
 =?utf-8?B?QkYxUTVpRnR0VkJBbWg2c1RoU3hYZHdHNE16K3Q0SEczVDB4UlZZcWhwaGNr?=
 =?utf-8?B?dW5BRXhrcy82QjRRTkdJQWUxWEZTUmJNemY2YThMMEhseE83OGg5MGFZUG5Q?=
 =?utf-8?B?bzgzL1doVGpCc2lMaHEwWGJUOURTU085RVJGcG4rbjM1OUdzZFZzbWw2ZkJi?=
 =?utf-8?B?YzNjd1BMRElaRm5ZclVlRlIzM0FtenYza1V1eDRiVmo0K0I3by9Td0dkempk?=
 =?utf-8?B?OWhIVG1SNEdVYmtwV0hBd0RUUm5na2Q3eEUrZll5a3RrcG56NVBUbFBmMVdi?=
 =?utf-8?B?ZnFOUW5DVHBISWpSYjRlM0hPNFAxK3BLVVJKem5pbHhkOGFQam50REoxVjcv?=
 =?utf-8?B?bXdXSGxXeHNmK2NLV1JKVnhSb3hXTXNYMGlSYi94NW5vQjFGRC8weS9QZXBR?=
 =?utf-8?B?bW1BU21PVk84dHdKZVFtUng0VkxwUWIwaTRaT0RXdmNrTnlHODJWUXFYVkxY?=
 =?utf-8?B?cFIyRDdHQzN0eGVMM0hiWGtxUTZhZ3FnZTFJTGpONDhONkNhQ0JQaUp0bXRw?=
 =?utf-8?B?alJyNjdXandpUFdDU1JtZ0hhZ2hyU1dBdGtCV0FwT213RElGTDMzb0RNTW96?=
 =?utf-8?B?KzFEVG5tRktOZDNIb0U2M0ZkQklxM1NaWm90NjVvcnJKVXF5OHY5dzZLdDlx?=
 =?utf-8?B?ZDdHdzhrYjl6cGpYOEVBZ0dKemxralBQL2RvS0ZXRWkxOUpxMU5FQU0yeDhN?=
 =?utf-8?B?MFd3UUM3a2Z1REFMaHRvZlNPQkx5UVZMNWZLaWRnQml1VkpZdGJHL216WWZh?=
 =?utf-8?B?SkMzUnh4VXlWdWVESlBMR3U1ekxTb2tkTFk4UUV4Ym4xd2ZpM093SXBWNWtP?=
 =?utf-8?B?Qi8xQ2RsZ3JLTmJldjNqd1NNemlSNnFwaWlxaklEK0xmdGR1QWN2aklqYnlW?=
 =?utf-8?B?QVppb21JNkhuSmp3WldvS001d0RBc2xJQitkWUI5emhvUUNBemhDRTlsenQ3?=
 =?utf-8?B?QzM5bTRlTGJsREdyY0dJSjE1blV5QzBRazZEUW96UUtCTkNoU2NZaGc5Vitx?=
 =?utf-8?B?blIwYUgza1p2d3lmckR6WisxQUtUNnJQTFN4ZU1ZbmdPUE5EYVVEVmlWRWlJ?=
 =?utf-8?B?NmFyV1RzQkJ6bkdnbk9ZL0xTeFR2cW5sY3hrSFJxWGZxcFdOUVIyTVg3OWZL?=
 =?utf-8?B?WHBEU3ZDbi9VKzB0aDZ0UU9DSkhWb2F3Vzh0c0VzbldjcWtMbjNBZVVrTEdU?=
 =?utf-8?B?YmZGK0dXNU5tV0xpK0ZBbVlzLzl0OXExVHhuYW1Ob0w1ZFFrZXBZZmxGa3B3?=
 =?utf-8?B?UHVTR1lFdUxPQVpLUVVRbGU4UmRianVaM1hpWU4yL1VIKzJHcDA0NDZ6VnJS?=
 =?utf-8?B?eXZGZkxsWTZ5Q29ERkp0YzBlbVBYWVVSajd3R0tXYm9ucE1Xblgxc0Exbzg1?=
 =?utf-8?B?d0VIb2QwY2tjQldGaWZZQkR1SmNzcTgrUUJLQ0dnRzE0Y3IrMUwvRmZJdXlt?=
 =?utf-8?B?Ry9UeWdLZ3ZHS25XUnVkSm5RZGZLZWlPTGROS2FsdHU0MEVlWURJQllSNFpC?=
 =?utf-8?B?WmwwcWxYTGNmNEhOdEY4SDduSVhLWmlQdGQvWVhyRjRJbWIxQk92SE9HRjNJ?=
 =?utf-8?B?NGdTVGFVd01JNDA2QmJodWlHdUI1ZkRSWjc0WmpPL1V3ODVvSEdOeWVldHNu?=
 =?utf-8?B?bi9vQ2F5UDllM3JNTEhKTkhPVlA4QkJOckt0NjE3RE1XVGx0SUQxeGpNMFVB?=
 =?utf-8?B?dXREeCtWL0dVaWFtYlZEdUdwQnNEL01xQzN6aUlDVWJmMDJaTUpvNXorczZs?=
 =?utf-8?B?WitsL09mcGNwVENrQzVNSnljNVV5a3VvNlIvQzduT0hZUWFQcG1GL08zSnRi?=
 =?utf-8?B?bmxHWVJqUEJTMjM1ZjlDK3RSTWt1WUdvcnpNSGRsU2pQaUdFYUp5SGRabHVF?=
 =?utf-8?B?b3I0dW5qUFZaSndjd1lmeGJPLzhQNzc2ajJFTEt2NjFQMGhrRzdtakFZdjhY?=
 =?utf-8?B?MmppVU45V2pMVmZwbGRzWFplcUdQM05ZRHFsb0hZYk44TERIcWxPL2k5RTVX?=
 =?utf-8?Q?uMEg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 19:13:04.2821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c114c5-7d1f-40ab-f432-08de520e9c98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9682

Hi,

On Mon Jan 12, 2026 at 7:47 PM CET, Alejandro Vallejo wrote:
> On Mon Jan 12, 2026 at 6:15 PM CET, Andrew Cooper wrote:
>> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>>>  automation/gitlab-ci/build.yaml    |  2 +-
>>>  docs/misc/efi.pandoc               |  2 ++
>>>  docs/misc/xen-command-line.pandoc  |  4 ++--
>>>  xen/arch/x86/Kconfig               | 14 +++++++++++++-
>>>  xen/arch/x86/cpu/microcode/amd.c   | 22 +++++++++++++---------
>>>  xen/arch/x86/cpu/microcode/core.c  | 25 ++++++++++++++++++-------
>>>  xen/arch/x86/cpu/microcode/intel.c | 16 +++++++++-------
>>>  xen/arch/x86/efi/efi-boot.h        |  3 ++-
>>>  xen/arch/x86/platform_hypercall.c  |  2 ++
>>>  xen/common/Makefile                |  3 ++-
>>>  10 files changed, 64 insertions(+), 29 deletions(-)
>>
>> Much nicer in terms of (non) invasiveness.

An interesting fact came to my attention. If you set a function pointer as
IS_ENABLED(x) ? foo : NULL, rather than ifdeffing out the compiler doesn't =
even
need __maybe_unused to eliminate the statics.

I'm adjusting as needed and creating something so that...

  custom_param_if("ucode", parse_ucode, IS_ENABLED(CONFIG_MICROCODE_LOADING=
));

... does the right thing. I'm sure it'll have uses outside this (minor) pat=
ch to
remove a number of cmdline handlers when the feature they control isn't act=
ive.

Cheers,
Alejandro

