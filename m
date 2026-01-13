Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A7AD19AF8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201885.1517520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffsl-0002aq-V4; Tue, 13 Jan 2026 15:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201885.1517520; Tue, 13 Jan 2026 15:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffsl-0002YJ-RW; Tue, 13 Jan 2026 15:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1201885;
 Tue, 13 Jan 2026 15:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vffsk-0002YD-HK
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:00:30 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98a9ee53-f090-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 16:00:28 +0100 (CET)
Received: from BYAPR08CA0066.namprd08.prod.outlook.com (2603:10b6:a03:117::43)
 by DS0PR12MB8480.namprd12.prod.outlook.com (2603:10b6:8:159::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:00:17 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::4a) by BYAPR08CA0066.outlook.office365.com
 (2603:10b6:a03:117::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Tue,
 13 Jan 2026 15:00:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 15:00:14 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 09:00:12 -0600
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
X-Inumbo-ID: 98a9ee53-f090-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4jycobY8y6LaBFgHeH26s54NNyfRAGIcfySfjcPHlx2fplaNNoaeW9jZFd2jN4EqzHlV1DuHW3qah+NkCjjHh2mEk+N5rESfRbCgwtq16BHJpWhMiXmlY4802qaFGf36kR+2MoMmHlpYQS/9YSCFGREAsfpKXgUHnbBqpsPMfQnr/OBxtqK+Fih+a3kAyVCoKBqt9mcugDR8+heji3EezxQwSO1658gDNCOliSpIlQ407tAorKp9Xn5meYRJlraPT/JQG1XNRn2y3rC/gJJEhICRKDwXQGtoo/voeXQHiar5m8/raJqfbhxqKaKR5DCShnCcIjt/MIL1ZfFMVlzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QD+IhtFWiEwGJgIssVsWbrtrgcjCh4UTtw73d/oNM4=;
 b=GLmceAb93sgFDNgtQv9XZn+foTNBZ/X8HYRINzlw1JOBAWgby99EI1mbvAYgNMF30Bl0EVdoWM3Z6HaY7LjADP37hXFCtgl3OSOVmclW7wWnJNT/DT7wKBLGAIM3HEBsIhBaBzBJZHwNAil7uqV0vM8ULVOb5lQ+VgVo4eEo/eAGmAGYAoA+3LJKtcI990Tvfs/cgLzFCOS5mugt6VWihAPSbrMXIk6QNuUzwkui7RUnFcL7BMY0kxgRm6Gk1TER45gvoQnjkEgt8/F+Xv+YVCQ2jzGs41DGS8bMFPrlobptAl4xgGwb8mjIM01VI+d31b1HidHUQvWN3iBO6TyLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QD+IhtFWiEwGJgIssVsWbrtrgcjCh4UTtw73d/oNM4=;
 b=ZyeVYW1nj4tX4wyXFRzCl49qgu8+H6Vw9QsanBPkzQKFCatLnNi9Sl9AFiTSbECTNWksTss+rthFEZKLHheLuzf/qZ7pGwNnEhbIWEU67IJQKfoMYHZPIxmfZ2GdYsEgHLntcF0n11HdfAnGM5qQDIFOJyBf3S4s3XYdjEmS9p8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2026 16:00:06 +0100
Message-ID: <DFNJUME4L1XB.3AUTF02P2QZ9T@amd.com>
Subject: Re: [PATCH v3 3/4] earlycpio: lib-ify earlycpio.c
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-4-alejandro.garciavallejo@amd.com>
 <b28be78e-2d26-4d9d-8288-7130a64deb5d@citrix.com>
In-Reply-To: <b28be78e-2d26-4d9d-8288-7130a64deb5d@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DS0PR12MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af95650-4268-479d-9144-08de52b47559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWx0R1hMakVvWC9CZDJzTnZtRVVGcUMvTkhQRmtrWXkyNnAvQ0M1blQyRWor?=
 =?utf-8?B?eVN1bTg2bXp1OWdXUHMwNUlPMEtwMVFBVXRSKzBKeFNjaW9VT2luRVhodnI5?=
 =?utf-8?B?VUNWekFvRzhZVkpocEFEZmFTd2FHeTRKaFEvL3IwNWV2TTNwRG85T203NmdU?=
 =?utf-8?B?dTkxYTRic21lczdwTTNNcUdITWJqYmltK0pYK1lQV2hOY3d0OE5pNFR0L0tX?=
 =?utf-8?B?WjJQUXFxYVl2aFJKekZJQ0JUR0hFdHRqdWV2aDVQc1kwN0k4V0UzOWNndlVH?=
 =?utf-8?B?VEFBZjJyRFhlZEpKYVhCd0w3Ni9ublp6bzRRTVdIaUVFY1dnbkp6Nk9IbmJr?=
 =?utf-8?B?VE1oTDdmcDNqdmR1V0JyVkRHTXE1ZnM4T01FcDFic0xUZTY1amF2SDZxVUk2?=
 =?utf-8?B?RE5SbU0zeVZPZWtkTXlndVRtVDkzcERHS1dIckFKZlo1L3Y1N1ZTVGZZVUE4?=
 =?utf-8?B?YTlOZlV5ZC9mUmgvTGFIY0hTbGR0Z1FQMEJMUC8vSHU3aXlpc1I4dTN0dGxW?=
 =?utf-8?B?QkwvZnNOcmlBU0RXY3R0Qm9RWUpwcitlcFBTMEZqMHAwSDg4cjBtUWJwb0Ry?=
 =?utf-8?B?UjhOaDhaaGg0Vkg3UzZMUytLemxncDFyeGRlYWFNVWFzdnJqd2RhQ0hYSCtM?=
 =?utf-8?B?SEJqdG5lNFptbW5TWjNHVHVFOGFYQnZ3YXdrWm5MRm8zQVpXaXlONjEvU0p5?=
 =?utf-8?B?cUZKZVFZWjVJRFRIdy9pcCsrSURUcG1PaVRQYUFaa0t2alNLb081bk1pVGVY?=
 =?utf-8?B?enZvbjk2cEJhY2tBN2E5MHd0aFZZL0JTb2FTR0Rab1MyYVcxWEIvT3RmYXRp?=
 =?utf-8?B?VGxSQnZTQkJHcWh6N1JaeXlnWHpKTUZIQ0MvakJ1NXJxUTlKY29xSEpFRVhP?=
 =?utf-8?B?Y1BMOXYyTmVPcjJEZkNjR25CbEpEQUpveEpHdXBFREZZcU95UW9Pb3daS2pE?=
 =?utf-8?B?djFCQzdBOWJRSEhpUHY1NE9DeE9NZlp0OXBqWTZNTnRhNkNKVUUrVGl1NktH?=
 =?utf-8?B?U1BDYUt4UXNVTDRYRHdUVWFweVJ5ZkhjVXZkbTd5Tk91czdQM1JadjZSQXN3?=
 =?utf-8?B?amQ3b3hxT1ppWWQ0TjN5MGRWR212NElaYmN5VysxQ2xWY1FjR0kyZS9XMlNa?=
 =?utf-8?B?ekk2UnA3R2g0eVJhQkMvQnplRTBHdHBMWmVlMnBPbnZ6Qm1jOVNRVnZNWk5s?=
 =?utf-8?B?cEtNYzlBclk2R01Tbm0yelZ5b1NlVTE3M3RvRjloWWMwSEFCbzlGVVdSOHFR?=
 =?utf-8?B?c0NTNjJxbXp5bmlYL29VbTYxRTJHSE9ZM3F0WmNpVzYva2ZOTHpWTHgrem9q?=
 =?utf-8?B?WEVwME1DOXl2cVhabkl6NWxtZWRyUDIzTWJxRVZlUldBdi92TVJ0L0M1OXlE?=
 =?utf-8?B?L1hBN3VNUDlzbm1GczM4K3RERlQycXJpeEd5QnFBMUVXdDVtYmc4NnIyM3RI?=
 =?utf-8?B?MTFsSDBvVFR6Z0F5aWhmT2ZzQk91WUlMTzc3L29jSitZdnlKQnl1RkhGdFJm?=
 =?utf-8?B?VjNrd0F1Y013VHVqa0lVRm5wVFhpSkRnM3NMYU9YMFBFWTRWS2xMLzZIUnRw?=
 =?utf-8?B?TDZ2QXNONjQyUVZjT2swdWVCWllkcjR6V2pwaWxacy9LZEttNFFTTEMrSWpO?=
 =?utf-8?B?VGk4eExhZUNFRTZza3g5VjdYMHpTSHdVWVNsQlVwdDdUb1YvTmZGRjcyQjdk?=
 =?utf-8?B?aGI3dTVFWXlTd3BOZTZCdjNHcDJsUkxHcXZOM2w5MVR3Z3NRZFJzN29NV2NE?=
 =?utf-8?B?ejdmTVpybWsyUEp5TXJCWFcxdS9LcG5tZTFUM1NsbGRrd3RXeXp2VzZuWmhC?=
 =?utf-8?B?aVlackV5R0xMQWExQnpvdnI5STVYQ1ZpWTZsRHNvb3lqdWpFOVRCYStZcU1s?=
 =?utf-8?B?Q0F3TWlKc2RqQnNYd0NNMWFzeTBUV01JVVFMdGpNU2xUTHA2V2RnZjY0WTNu?=
 =?utf-8?B?MDB6NUE0SnpRS3Z2Z2sxUDBlT0QrYVVnMDBpTm1VK05WV3lsZVVnQWROb0lk?=
 =?utf-8?B?RXJPVzgycVVCNnF0N3FaVm95YjVTV3lXSVc1RFplNmw0Qk1yWUZUa05IL0tZ?=
 =?utf-8?B?NTArNkhHL2dZNWZzVW5ZemtxKzF4R0VGeUQyNUJLcTNsU0dmeVlSYXNMREtH?=
 =?utf-8?Q?e3Fg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:00:14.8805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af95650-4268-479d-9144-08de52b47559
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8480

On Tue Jan 13, 2026 at 3:24 PM CET, Andrew Cooper wrote:
> On 13/01/2026 12:21 pm, Alejandro Vallejo wrote:
>> It's only used for microcode loading on x86. By lib-ifying it we can mak=
e
>> it go away automatically when microcode loading becomes an optional
>> feature in follow-up patches.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> v3:
>>   * New patch. Subsumes earlier conditionalisation of earlycpio.c on
>>     CONFIG_MICROCODE_LOADING.
>> ---
>>  docs/misra/exclude-list.json    | 8 ++++----
>>  xen/common/Makefile             | 2 +-
>>  xen/lib/Makefile                | 1 +
>>  xen/{common =3D> lib}/earlycpio.c | 0
>>  4 files changed, 6 insertions(+), 5 deletions(-)
>>  rename xen/{common =3D> lib}/earlycpio.c (100%)
>>
>> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
>> index 388397dd3b..2b874dfd3b 100644
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -121,10 +121,6 @@
>>              "rel_path": "common/bunzip2.c",
>>              "comment": "Imported from Linux, ignore for now"
>>          },
>> -        {
>> -            "rel_path": "common/earlycpio.c",
>> -            "comment": "Imported from Linux, ignore for now"
>> -        },
>>          {
>>              "rel_path": "common/gzip/*",
>>              "comment": "Imported from Linux, ignore for now"
>> @@ -225,6 +221,10 @@
>>              "rel_path": "include/xen/decompress.h",
>>              "comment": "Imported from Linux, ignore for now"
>>          },
>> +        {
>> +            "rel_path": "lib/earlycpio.c",
>> +            "comment": "Imported from Linux, ignore for now"
>> +        },
>>          {
>>              "rel_path": "lib/find-next-bit.c",
>>              "comment": "Imported from Linux, ignore for now"
>
> Honestly, I think this needs simply dropping.=C2=A0 "ignore for now" isn'=
t
> going to cut it with any competent evaluators.

That would depend on justifications and such. But regardless clearing the
exclusion list is a different matter aside from removing microcode loading.

>
> By libryfing it, it's no longer part of the AMD target build, but it
> does want covering by *-allcode.
>
> Given that you noticed it for v2, I presume there's something in the
> file that Eclair doesn't like?

I didn't run Eclair on it. It's ignored as part of common, and the build
fails in CI if the file in common is absent. That's how I noticed it.

I'd rather not gate this particular change on earlycpio playing ball with
Eclair.

>
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index 92c97d641e..4fc0c15088 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -65,7 +65,7 @@ obj-y +=3D wait.o
>>  obj-bin-y +=3D warning.init.o
>>  obj-y +=3D xmalloc_tlsf.o
>> =20
>> -obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma l=
zo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>> +obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma l=
zo unlzo unlz4 unzstd,$(n).init.o)
>> =20
>>  obj-$(CONFIG_COMPAT) +=3D $(addprefix compat/,domain.o memory.o multica=
ll.o xlat.o)
>> =20
>> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
>> index efca830d92..60cfda4dfc 100644
>> --- a/xen/lib/Makefile
>> +++ b/xen/lib/Makefile
>> @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) +=3D x86/
>>  lib-y +=3D bsearch.o
>>  lib-y +=3D ctors.o
>>  lib-y +=3D ctype.o
>> +lib-y +=3D earlycpio.o
>>  lib-y +=3D find-next-bit.o
>>  lib-y +=3D generic-ffsl.o
>>  lib-y +=3D generic-flsl.o
>> diff --git a/xen/common/earlycpio.c b/xen/lib/earlycpio.c
>> similarity index 100%
>> rename from xen/common/earlycpio.c
>> rename to xen/lib/earlycpio.c
>
> What's wrong with .init here?=C2=A0 There's only a single string which wi=
ll
> end up unmerged so I'm not worried on this side of things, but we now
> have series doing safety things getting tangled with .init and I want to
> get it fixed.

.init.o doesn't work with lib-y; only obj-y, obj-bin-y and extra-y. See bel=
ow:

  $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y +=3D -DINIT=
_SECTIONS_ONLY

  [snip]

  non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra=
-y))

  [snip]

  $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(o=
bj)/%.o FORCE
  	$(call if_changed,obj_init_o)

That's just what I eyeballed. There might be more hidden elsewhere.

It might want fixing, specially if something like libfdt is to turn into
a library. But it's just not relevant for this particular change where the
single contained function is already __init.

Cheers,
Alejandro

