Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0499B78AA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 11:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828581.1243513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6SQX-0000wL-EG; Thu, 31 Oct 2024 10:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828581.1243513; Thu, 31 Oct 2024 10:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6SQX-0000tx-BP; Thu, 31 Oct 2024 10:29:17 +0000
Received: by outflank-mailman (input) for mailman id 828581;
 Thu, 31 Oct 2024 10:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFO/=R3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1t6SQW-0000tR-9o
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 10:29:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2413::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f591936d-9772-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 11:29:08 +0100 (CET)
Received: from BL1P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::6)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.24; Thu, 31 Oct 2024 10:29:04 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::ce) by BL1P222CA0001.outlook.office365.com
 (2603:10b6:208:2c7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Thu, 31 Oct 2024 10:29:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 10:29:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Oct
 2024 05:29:04 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 31 Oct 2024 05:29:02 -0500
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
X-Inumbo-ID: f591936d-9772-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjE1IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImY1OTE5MzZkLTk3NzItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzcwNTQ4LjY2NTk0OSwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmbCvpwZHW+5CjuI0ZhsHM/Det2bGWo6RPqlAX2b6/F8b6h7IHtiqCABqdZRZmj8J+0QQixd93Eg4g+A3cWmlv4VOg5WxFXrCNh3ZDdLSshA78InTuXy3FzALIubRvQXV+DEHT/wx5HJ+mVPRS0XCtSrKH637QWV89mz0x40iAVlqb4Imfa6m7JvShmurygWukg5hinaCz38/uS+ofbbR4vKy4pPNXIb/ZIg8ZKMNV9Hf2G/3IUOoaDsp+zDuUMfFg7Ir7bTBVhP9LiPVi3+S5fFAvkFUBRJrvOojK23sAGgPkt5WafdCf16QRYFGgCgtgK1+T82DbrWFXwcWtJpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D13RHuKFNutF6U+Uy+kHpAoeuJDEwedRhhiK/+uX4U=;
 b=fZ0fUNfcdie21jiKg/Q1volfllCJThxfj4vgRMfkpcrj/kvzcQOIVfnBXncOWVHYAGdsjUoZD7jdSvL2zqbw5ch/E5fPjmrCPnlcuz8UXhrT8tiBQgZWTdvvm19k5R/r1rx8QF2Sf2UjjRh2Ve8GBlQW072dmCi8AHdsDdj6PiVkkSclANcUI5mL/cRdkCw1riLooMFiSxtVp2inuuhNxYT2j+zc57A9es173QARUbi5zLGOIuRGXgCBw+jOhY/73Yp8i+CIM1wGq4OUfayeogMNv+Da11By01NQzt9423fvnAbQ8OeqvdL/pcMscXdxqkpBzG0/hsMSnO4EansRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D13RHuKFNutF6U+Uy+kHpAoeuJDEwedRhhiK/+uX4U=;
 b=GdJ6RrJSACzCBVpmwPxisz/H7IdHaa85/6TuEfiB1F7K1CTG6guSxi2FAjRpTU0CQVLUC3q2r/Zk5RzuaG/9jS9ahUhdtimgzwKwQ92hYodDGtcfA73945b6sY94O+63SnRdqNxENu77jLCobU0Srw61NJW7/mXWVkqIaXEWkpg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c400bd0f-1360-45ea-bd29-bf7883debd93@amd.com>
Date: Thu, 31 Oct 2024 11:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/common: Move gic_preinit() to common code
To: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <e906b538aba684ab108cc70e8c60ed35ddfad74e.1730292286.git.oleksii.kurochko@gmail.com>
 <6461a47f-759a-4138-970c-4e5f68b07bae@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6461a47f-759a-4138-970c-4e5f68b07bae@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 6172155a-a863-41bc-8894-08dcf996d83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFFSTEFwZzFDaXlqZ29ubzNtbWF1S3dFTzF4OWhodTdUUlIybDRndlh0L28w?=
 =?utf-8?B?QkJIWXg5Q1AvOGErTDY1clRhRE44QzNHcGVjOXIwWmJpUENVTGFZM2EyS1FK?=
 =?utf-8?B?MXJKM2trUVVBZzB3VzZ5MzdFL3dvYmpydXBPaTVqamRXWFlSMG9wdHBEYkVv?=
 =?utf-8?B?MXdjNy9wL3EycVFhdXNMWG1Ddkd1c1VBd3NHMjladFVtOU9Cd3dvVVJuSlZC?=
 =?utf-8?B?Y1RkOVhpQUtZZmpqZVVTUFVaZzNTTENSbjlENWZTbnMrQlhWY1pIVXVEenY4?=
 =?utf-8?B?dWV5WGRvY3huV0djVUNiWnptUk4rbzN2NG0wNGdyWSs4ckErUVhrNEhoc283?=
 =?utf-8?B?QnZ2Y3pxbTI1c2dkUTNIMmxaaGhYMzlWemhvZFZrdThoKy91NFdNU20rYklw?=
 =?utf-8?B?WDBsaDhMOHUzclUwbDZnU2t3d3NMOW82cURkTlU5U2JsYkpWZm5oQ1ZqQUhG?=
 =?utf-8?B?L00rM0REZjdUUE9RbU1YekJpWWt3SERhZSt0bTVlYmVqRUtuQTFpaUtUM2gw?=
 =?utf-8?B?WlZBMEp5b2F1K08vU1N5cTk0VTBIM29hVnJEQllXMDNBem9CbmhrTFF2QWFo?=
 =?utf-8?B?L3ZUVllLVkVxVExpRjBRQXdpRzRwTmt5TUs1VUZrL3JPMzdkR0tabGF0TG5k?=
 =?utf-8?B?UDRxL2VJZEx5bDZTVTZuV1pPQ1JDZnRBU0tlZ0M0ZGlTTHBOSDRkV3A3RDZZ?=
 =?utf-8?B?eHI1YXA2UGRsQk1SVkdzaDc0endodFVkMk5xbStFbEVGdXlsQ3JLWmlnUXZy?=
 =?utf-8?B?cmtaVjM5L2VaZmZVOFhYdGZYZHl1dnFnbzlDVGlLNDZVNHMyTERwU3U2V1ht?=
 =?utf-8?B?dWxuNzh6c21kbXh3UUFQN05nVXRDQ2t0NjdlTEhZOWlYNkxNYVQ5c2lsMlow?=
 =?utf-8?B?cHBCTXV5NldGVDVyZUpxSy9BQW1UMWp1QXVNUXRTSmZRd1hnckVqdWx1dFZG?=
 =?utf-8?B?WEsrTmxlZExtRXRKc1lLMHg5TWxSMStOQVRTYzMwWUFVb0VsVTNhQVN6VkRi?=
 =?utf-8?B?NFMzK0RjR2pVdjJPWHpyZkM3YUpGeW9EQ0FENHQ4b0V5cktqTFJJSnNDc2sv?=
 =?utf-8?B?d1pGZ0RJeEU5Rk0rckNKRm5JZnVBaDFaUVZGZnpYUlZteTRaZE5ScnF0dWMx?=
 =?utf-8?B?djlxN2RJbFR2SmF1bEpvdXFDalh3bDRoKzRXQzN4L2FHRzFrczRHUHZnaDNZ?=
 =?utf-8?B?U2RlZE1tS3pYK0F0ZlVEb0hsM2hMRHFtYVZZZ0lKRktaMmgvWlJ4cTRuRzND?=
 =?utf-8?B?VXFRM05OalhuT3I3S2hjMzIxOThEVGtUZDJ6WjZiTGFwbG01ZytZclRYT3VJ?=
 =?utf-8?B?eUx6ZUVqTWhteWQyZ2ZBWEJjWmVGM3R5Y0I4ZSsrZGVNcCtrN21TMVhadVdT?=
 =?utf-8?B?N2x6U2xINW5vMWlrcm5mb0RQU205WlNQU1N3R3l6NVRyN04zaDFsaVFBbDRl?=
 =?utf-8?B?clE1VmxzQStzNmdtOEhpTGlQOHhwK2VZV0ZCRk9lcm5IV3R5dlBHcDB3dzVW?=
 =?utf-8?B?ZWRPSXNQWTF1cE9pL0pPTXFPWVJOR0RhUmRLRG5obGhmcHpRTE9VSEF1ZW8w?=
 =?utf-8?B?bmpIcjZBSTNqSTRKclp4VFljRUJRMm9EZktqTDMyS3F0Z0h1WFVtK3NXNjdU?=
 =?utf-8?B?QnpIZG9YR1JZbzlPVVVZakc5Wm5KN05NcmY4Y1dtbThjVXJFK0dvbHBUL1ph?=
 =?utf-8?B?cTE4RUg2R1FEQjJ4OGIzS1lCSHV5dmdYLzNLWVNZeHg5UVdLZldzcjdkRE4x?=
 =?utf-8?B?anc3NVBkdmVwU08rcXR4T2xkNHJIZDR0TUdFeDMzUFRmc1U0NjRWRSsyVllE?=
 =?utf-8?B?eU5sZjNEeUZMUlVmQVZEbXFUVHF2MlNMRUhwVmN3WVFtNExEMlhwQnZyU1RL?=
 =?utf-8?B?VEZjTjhIc3ZLeXFrQ0kxZWEyVWZOZHB6RFBJSWhiN2RaM2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 10:29:04.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6172155a-a863-41bc-8894-08dcf996d83a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632



On 31/10/2024 10:34, Jan Beulich wrote:
> 
> 
> On 30.10.2024 14:14, Oleksii Kurochko wrote:
>> Introduce ic_preinit() in the common codebase, as it is not
>> architecture-specific and can be reused by both PPC and RISC-V.
>> This function identifies the node with the interrupt-controller property
>> in the device tree and calls device_init() to handle architecture-specific
>> initialization of the interrupt controller.
>>
>> Additionally, rename gic_acpi_preinit() to ic_acpi_preinit() as it is used
>> by ic_preinit(), while keeping it defined in architecture-specific as this
>> part is architecture-specific. In case if CONFIG_ACPI=n a stub for
>> ic_acpi_preinit() is provided. To declaration/defintion of ic_acpi_preint()
>> is added `inline` to deal with the compilation issue:
>>   error: 'ic_acpi_preinit' defined but not used [-Werror=unused-function]
>>
>> Make minor adjustments compared to the original ARM implementation of
>> gic_dt_preinit():
>>  - Remove the local rc variable in gic_dt_preinit() since it is only used once.
>>  - Change the prefix from gic to ic to clarify that the function is not
>>    specific to ARM’s GIC, making it suitable for other architectures as well.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>  - Revert changes connected to moving of gic_acpi_preinit() to common code as
>>    it isn't really architecture indepent part.
>>  - Update the commit message.
>>  - Move stub of ic_acpi_preinit() to <asm-generic/device.h> for the case when
>>    CONFIG_ACPI=n.
>> ---
>>  xen/arch/arm/gic.c               | 45 +------------------------------
>>  xen/arch/arm/setup.c             |  3 ++-
>>  xen/common/device.c              | 46 ++++++++++++++++++++++++++++++++
>>  xen/include/asm-generic/device.h | 10 +++++++
>>  4 files changed, 59 insertions(+), 45 deletions(-)
> 
> Looks largely okay to me now, with a question and a nit at the bottom. The
> question is mainly to Arm folks, where the code is coming from, and DT
> maintainers: Is a file named device.c really an appropriate "home" for
> IC-related code? If IC is a common thing in the DT world, would such code
> maybe better live under common/device-tree/?
I think we will have more interrupt related dt stuff common, so it would make sense to create
device-tree/irq.c or intc.c.

@Olku, can you please s/ic/intc/ ? It's much more common abbreviation for interrupt controller.
You can do e.g. grep -Rw "ic" vs grep -Rw "intc" in Linux Documentation/devicetree/bindings/interrupt-controller.

~Michal

