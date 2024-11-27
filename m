Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED79DA977
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 14:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844856.1260371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGIYU-0001Z5-HJ; Wed, 27 Nov 2024 13:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844856.1260371; Wed, 27 Nov 2024 13:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGIYU-0001WE-EF; Wed, 27 Nov 2024 13:58:10 +0000
Received: by outflank-mailman (input) for mailman id 844856;
 Wed, 27 Nov 2024 13:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjDT=SW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tGIYS-0001W7-Nz
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 13:58:08 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9df16635-acc7-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 14:58:03 +0100 (CET)
Received: from CH0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:b0::16)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 13:57:55 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::c9) by CH0PR03CA0011.outlook.office365.com
 (2603:10b6:610:b0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend Transport; Wed,
 27 Nov 2024 13:57:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 13:57:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 07:57:54 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Nov 2024 07:57:52 -0600
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
X-Inumbo-ID: 9df16635-acc7-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjE3IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjlkZjE2NjM1LWFjYzctMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzE1ODgzLjI5NTE5Mywic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLIZH1QfB9Yf5FQb1NwoLD1gPcAPjfOsNYNSjUqAWOnpLk3od6xvSG+7SArO+E/jHscKd7ftro3Lz95MshY/E3w/zqNG1wmUvdh6qUr/ASdXjnev4zeeuDE6uufUsykrhJnJ2mw5oCCGd1N0incmC8pB0YdV5d0GTCveI8Pio2xf04WSeUplfl/vOroltGftx67iqhcaZLD6H48czeQ/ymsOXuGKhcdwsOA9s9dTMJjWLbrEE1KvJLatqj2bfSuKutlUX+Z7n4WnJI46Veat3BigRc+JeV8Yi/3Gh0rM4OLv4wrZO4I13WPwpwmjpXUhUkDQC+wYW8/dNlprURGAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OPpQ6SSC7w1EteO/O4Qgo0V+iE709uxjQDzGlRrdUM=;
 b=VWDJEcuRsBYXzFkU+JhpbPCueDqkBpWZBSikq6yE+yFH4/xLzEsokQmWIpWhaX7L1QLvLOZI++DzuCPm15142TjLN23GpvTBT1DsSQyhlxGFfXw7RIE1jKxTzj7ohs/osY4vvTN9BrD2bCU5ANUzAh+nP3OFJ4wNQ+jKOZvO6/Xjpsa+HyMEck3LkXlbMeny0xhQP0f2TqfFQzRyvT/uYV+wrWaAZAcF6ctWmaHub7acH7wUK+wrAbE6y2WY+SJFzOSF8SRmObkmTLJqB+qP9U7qn9fSbwZmWRQziJzX+YJdJ8M2XRMyzbaGdcOD2PGe6TsInSBtupSPYfUgaeII8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OPpQ6SSC7w1EteO/O4Qgo0V+iE709uxjQDzGlRrdUM=;
 b=YpAbJ1u+xlJ2chhckher3PvJUEJhHQxhEAAitwP+J7uth+YxWP6wZ3CLaPAWZCXgv3c8OhxONa4araCI35keG2f9GnH2qOAJCb6+pCscZFPxoBWy1DN2c8OUrAbm/G/Ru4Bv1NQeT13QZ8bt0875esMjUWUXDBXM+XG/qZD1hJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9444da80-8982-47b3-adc8-84107c50ad20@amd.com>
Date: Wed, 27 Nov 2024 14:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/12] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: <xen-devel@lists.xenproject.org>, <andrea.bastoni@minervasys.tech>,
	<marco.solieri@minervasys.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-2-carlo.nonato@minervasys.tech>
 <93c0a25f-4edc-4d21-8767-48d496cc3575@amd.com>
 <CAG+AhRW+5XUk8KBFiB9LO6h=7W4nmXn_ZDtPuC+sUFgckKR_HQ@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAG+AhRW+5XUk8KBFiB9LO6h=7W4nmXn_ZDtPuC+sUFgckKR_HQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 11905d9c-ac0e-4f28-3167-08dd0eeb7e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2g3VUFJSk80RThwKzRxblV1R2lsUUdTUGVxVjI1UWZqNWpiNmZQQlZ1NjVt?=
 =?utf-8?B?dG9vdm1NZmhUYURBM2RIMmpwZUtubTBmQUNPdDBkU3BrT0FBT3pZdFZ6U0lp?=
 =?utf-8?B?c2FheFB2OW5qMC9FOWRDUUk1ZjJpNWN4NGRKNC9DOXhjcVRXWlhpNU1wTWJW?=
 =?utf-8?B?R3czZkoxQk5uTFloRWEzek03anN2a2EvSWVvTC80S242c3VhU09BOWdMTFI1?=
 =?utf-8?B?SnVSdzdhM0tVaHdhb2xMa21ua3VuTGRtRmhFTEFlS08zTDdta2FqS0k3OTE3?=
 =?utf-8?B?QWJPM3N5K0xiZW5ZUzNObGNtMG1rSDdhellZMDdtU0RDSzFJR0gyQ1BUTGw5?=
 =?utf-8?B?V2RFa0YwcjQva3dUTUtMYTR0NzlPSnkvVWhqWkc0NTdsdzA3WSs1MEI4NlZZ?=
 =?utf-8?B?TnJrQk5mU0dialo3YUxoVjNjQisrRlJvWVgzbFhISHZXUGcrUkhYYThvWEZr?=
 =?utf-8?B?WE43Z2N6SkxOL2x0L0VlMHk5WkZyaWV5NnpsNjNLeG0zQlQ5d0diaFN3RzlR?=
 =?utf-8?B?UFBOa0RlODYzUnJxT2dXSFdqZURUM3hxSE03aC9WZkhFL3IvRDc1b1pzRkdU?=
 =?utf-8?B?bWppK3N1c2N2MjVKZjluRVpQUUdLL3Jndkc2bDRNbHk2NXp1OHoyWTNqWk0v?=
 =?utf-8?B?eko1K3dXNm9KREJHa3lrVkFmTmZPVTlsUFpLYk9IdVkxVHdVWFVuZjZzcnZJ?=
 =?utf-8?B?WFF0LzR6ZWlGaS9YV1ZJRTNXMFc3dmNlQW9iaklRVWJNVllXWjBERlErZE1U?=
 =?utf-8?B?eEV0bEVhMGNXYk1RYy9JRW45Um14WjVXSzF5dS9Ra0dZM0JNY0pIWUp2WW52?=
 =?utf-8?B?SElabUoyV1FaMFFJWm9lU3FPY09mZG9yVGsvcTY0eC90VTI1V21jRVhjT1U0?=
 =?utf-8?B?ek1JTWg2Q25JU3YvR09xbHZRdWM3TTVBdGNqR2tWQjJUT21vakYvbjMweGhH?=
 =?utf-8?B?bTh4cUFRejV1bnVuU0pNSldjV1Y4T0dhQXExeHVLd0R3eTdrM3kyMzAxNk9j?=
 =?utf-8?B?RkZaSEViWWZGQ2FqMmFvUWtER01MUXoxaksrM3E3VUxVY3B6VGpjamRJcTlV?=
 =?utf-8?B?MFZVTlNld2VkS0s3T0dUN041RmZvQXRSU3Z3NGxOa0swS0pHWit5RXUwU0tl?=
 =?utf-8?B?S2x1emxyTCs3bzdRa3VnSTdra2FTWTVSQUh1VHRQemVVbWlQaUhkSHZFRy8w?=
 =?utf-8?B?Ykd1Wk9TVk84VkN3V0k3STJXZGl0MXovdkZUZTZ0dEVmSUl3eU5YRHRMWFlk?=
 =?utf-8?B?aUlUdnJFcGFuWk02OWdaRWFTaVBYS1BFUVZOL0xhM0IxbVJnUUlObXlEKytT?=
 =?utf-8?B?bkdVanpQdHNwb2RJNkx5V1M5cVBCVjMva1pOUTNxRTErZ1V3NThpdkVlcXRw?=
 =?utf-8?B?b214Vlg4ZjIzVnQ5MGs4dWF3WnZmWUhkb0xEdjNCRlBPam94eXM0Q3VBSHR2?=
 =?utf-8?B?UlQwZFJGVkVyUS9MUVlLSlFpdWhCUGpXMGhxR1R3K2N3L3RUdDZ6UXU4bnEx?=
 =?utf-8?B?c0dUR21QTGE5dWpxVjNLR2ttUTVxV09oY2pUZUcwWGhvSDBkUThFcTVuNVpX?=
 =?utf-8?B?UXduMUNaVmNlZFVVVnBTeWR0MTRsNWVzY1pIZWF2ak1taDJzZ1g5UFBnTSt5?=
 =?utf-8?B?blk2WU5IVlJ6S2U5aW1OcHI2a1ByMEt4NzhXS2YzYU50K3V4dlVIRkVFNFJz?=
 =?utf-8?B?TzJjbG1Mc2lwQnpseXpHemprWmJJQWQ3TjZaSTRMd2kzV1RGNmg2cDVMQkU1?=
 =?utf-8?B?Qnc2cjJ0TkN2cnZJeEhGU3dhWkorczVydFUwVmgzczhBR2hUb2c0WmxUbmQv?=
 =?utf-8?B?c3ZHc2tMZnIxNkRoaWdHUk4zSDQxVHVSN3F5anVHa0Q2ak9pNnZCWFRyL1d5?=
 =?utf-8?B?QkMwTWhiTU1qTVAxZUpzOXJPZklRdTV1SDFvckxrSDB3bTAvdFNsNFY4dW55?=
 =?utf-8?Q?2/ACuue3gnDL2gFk/iWcrw5KsGdZxNE9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 13:57:55.2560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11905d9c-ac0e-4f28-3167-08dd0eeb7e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892



On 27/11/2024 14:24, Carlo Nonato wrote:
> 
> 
> Hi Michal,
> 
> On Wed, Nov 27, 2024 at 11:48 AM Michal Orzel <michal.orzel@amd.com> wrote:
>> On 19/11/2024 15:13, Carlo Nonato wrote:
>>>
>>>
>>> Last Level Cache (LLC) coloring allows to partition the cache in smaller
>>> chunks called cache colors.
>>>
>>> Since not all architectures can actually implement it, add a HAS_LLC_COLORING
>>> Kconfig option.
>>> LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)
>>> because that's the number of colors that fit in a 4 KiB page when integers
>>> are 4 bytes long.
>>>
>>> LLC colors are a property of the domain, so struct domain has to be extended.
>>>
>>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

[...]

>>> +### llc-nr-ways (arm64)
>>> +> `= <integer>`
>>> +
>>> +> Default: `Obtained from hardware`
>>> +
>>> +Specify the number of ways of the Last Level Cache. This option is available
>>> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
>>> +to find the number of supported cache colors. By default the value is
>>> +automatically computed by probing the hardware, but in case of specific needs,
>>> +it can be manually set. Those include failing probing and debugging/testing
>>> +purposes so that it's possible to emulate platforms with different number of
>>> +supported colors. If set, also "llc-size" must be set, otherwise the default
>>> +will be used. Note that using both options implies "llc-coloring=on".
>> I can understand this decision, but ...
>>
>> [...]
>>
>>> +    if ( llc_size && llc_nr_ways )
>>> +    {
>>> +        llc_coloring_enabled = true;
>>> +        way_size = llc_size / llc_nr_ways;
>>> +    }
>>> +    else if ( !llc_coloring_enabled )
>>> +        return;
>> the above code does not seem to be right. When debugging or in general it is useful to have on the cmdline:
>> llc-size=1M llc-nr-ways=16 llc-coloring=on
>> and be able to disable it by just switching between on/off in llc-coloring=. However, with your solution,
>> even if I specify llc-coloring=off, it will be enabled because I specified both llc-size and llc-nr-ways.
>> I think llc-coloring= should have a precedence.
> 
> How do you differentiate from
> llc-size=1M llc-nr-ways=16 llc-coloring=off
> where llc coloring is disabled, and
> llc-size=1M llc-nr-ways=16
> where llc coloring is enabled? I mean, in both situations llc_coloring_enabled
> is going to be set to false.
I was thinking about the following:
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 29b75e0e0d6a..b6684a6cf736 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -11,7 +11,12 @@

 #define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)

-static bool __ro_after_init llc_coloring_enabled;
+/*
+ * -1: not specified (disabled unless llc-size and llc-nr-ways present)
+ *  0: explicitly disabled through cmdline
+ *  1: explicitly enabled through cmdline
+ */
+static int8_t __ro_after_init llc_coloring_enabled = -1;
 boolean_param("llc-coloring", llc_coloring_enabled);

 static unsigned int __initdata llc_size;
@@ -48,7 +53,7 @@ void __init llc_coloring_init(void)
 {
     unsigned int way_size;

-    if ( llc_size && llc_nr_ways )
+    if ( (llc_coloring_enabled < 0) && (llc_size && llc_nr_ways) )
     {
         llc_coloring_enabled = true;
         way_size = llc_size / llc_nr_ways;

~Michal



