Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2BDC915DF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 10:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174593.1499545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOuUe-0007Xd-R1; Fri, 28 Nov 2025 09:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174593.1499545; Fri, 28 Nov 2025 09:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOuUe-0007V6-Mn; Fri, 28 Nov 2025 09:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1174593;
 Fri, 28 Nov 2025 09:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=94Jm=6E=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOuTn-0006WV-6a
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 09:10:19 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4094764-cc39-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 10:09:07 +0100 (CET)
Received: from CH2PR02CA0011.namprd02.prod.outlook.com (2603:10b6:610:4e::21)
 by CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 09:09:02 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::86) by CH2PR02CA0011.outlook.office365.com
 (2603:10b6:610:4e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 09:09:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 09:09:02 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 03:08:58 -0600
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
X-Inumbo-ID: e4094764-cc39-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmyOgPvC7uxAzbSdE+UZKMJt3InR5o7SGExlrQBbsheq0egPe+qkenPci+vC6P4x/rXf8fTuCBhScXh6XOTrOawGs5lHP6apkkhpT4fPxwU9kM7gawDMzo0XS5RAKsx9uXNoLBjr00xGCa3Sw1uEnjjNtded4c6UmYa4AcGXzP18KhgGTiBnlX69Vc/ZIPUBbogfb+v0rRT94jDqbQDC2wKYCLcuMi96nnVGUr+M7e3wBxrFoVb8Lp91KUBrSVN7bZ/Vfej/xE16aXafhrSNW7uV2pGEjzIMsXg1+VfdWyo63zrQX28cnTzen44saiQrbxPdC836um0r2ZfH83/MQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U4yH5W9GfOQf/6/MMIodDFYiQVfW/4jNwwI8tm3RtA=;
 b=V1Z/GxYhXLqs1yefrc1S6aHZiegVq84n7ejOe12VjsvoVFVjCwA95u1mcUWvnTBsHizzbKgY8B688+g3eKSTsg/dXqc6VtBdDpgqeZwB9dqg7dgHFv9Hn7C6wyzXLmgULeiDINBy/87qRWapDqFFlqZ2C/x0JaEVYMaMc6MNjbmCDp/aa9B3u5HAGxtIsk7Cpvu/Y8kwnhY2iwCW2+NfPmSQbw6/w1vYnkZg/N2/10CRPxfCL+RZUl9EEUXFq+HLIYmo5EAx4DFYWrBs1ObhtXIlRPK7xmuxyzuFDfqX586jKNCwGHE55sJRbBnjiCP9KrdsvHS64c1x/suQJdyNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U4yH5W9GfOQf/6/MMIodDFYiQVfW/4jNwwI8tm3RtA=;
 b=o5HyhgGygfARnmuJIbYn0OpFWEFYKyF7ToEx9/Ps+RcHI9e4Vy1bK++4sZFB91e4iCs8nygifK/fUOPJw6B2VvRcjCkr4k+bVN6BeKVvUTsPAeoIzEVlg3R7UDKoCqNlN6/ePIxmNh7InSrmHKPurPvwO6eaLgflk5zL0OBp/5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 28 Nov 2025 10:08:56 +0100
Message-ID: <DEK7KOZSJKIS.27HZY0CC6WYY0@amd.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before
 using it
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
 <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
 <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
 <9316c348-b4d9-4131-b1da-a9b5083d91cb@citrix.com>
In-Reply-To: <9316c348-b4d9-4131-b1da-a9b5083d91cb@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|CH3PR12MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 495d80fc-c1f5-4486-b377-08de2e5dc65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFpYR3NEcVB6bjJLUThjVkZTOWZINjlaWTlBYk1takh6TkZTMmV4OGJuQ2xU?=
 =?utf-8?B?QVhURnZNT1IwaTVUbHdzUUp0bitSbThNSFR6UFhBSmFNM2pQcUhFV1ppSWcr?=
 =?utf-8?B?ak9hQk1lcHp4VlRXK3J0ZisyYjNoazVmVGdPdVFWU3pRNzkxcUhCZDZsUzA1?=
 =?utf-8?B?eHhhVFMrT0ZmUG1adFN5LzhnVzdpZEtpSXppKzNuYXlueENxemY5THZnMTVu?=
 =?utf-8?B?UXBxdW5yd1NTeG10MUlkYU84ZVBQN3BOdisybHM3TTFlQmZXU2xUaHJiR0tH?=
 =?utf-8?B?MnlBVXd4K2RuTENLR21QYVh2aE1OQlUrRDBmdVNLeVpaTHlheU1lSDY1d2RX?=
 =?utf-8?B?dEZOazdrd0pFdkkzVExBa0c0VzNTNkt0Nlduc2ZsR2NYQnorV0NxNWgxbThS?=
 =?utf-8?B?a28wb1E2UlhKaGF5Z01Gd3cwbXhRWEVIeGNseXk3VVNlY2IrOFNxUlhRbzNC?=
 =?utf-8?B?d3ZXNm9URnh5WmZRNjhGM2ZxMzhrWnEvY2VCdVdZVEplOTRoaVNhdnovS1VY?=
 =?utf-8?B?ZTY0Vys3REVka0h4RVVLRFQ1Z2pqVVJXeXhtdEF3Smp3Sk1POUVLbVdmZWdS?=
 =?utf-8?B?d28rVjJ3ZjZOMTMxNXRwcWN2TzBXbzZXS0lyRHVQUkYvWEQ1bzZ1ekp2RVFz?=
 =?utf-8?B?TW00SGJmRWR2emlkOWJTWEVrMWtVNzk0dHE5WGpMODc1eG1TczNtaXB6SDZQ?=
 =?utf-8?B?WjhjdE5nSUNsMXRob2RpVjFDaXp1TTF4OCs3dHQ0d3I3OExZcWJvWHF2WStn?=
 =?utf-8?B?YnI3cjZZeHkwYy9WemNOV002M1R1WXEzTFhNS3ZGcGN3eldpbmhvMFBsdHdH?=
 =?utf-8?B?OGNybGZsM0pabDVabFVpRXFwc0RwZHE0RTM3Wmxrc1B1WkpIbGdjQnhkM0Zm?=
 =?utf-8?B?OU1jM2tSV0d5RTBDT1lKRW1GdHNuWU90enVoNCs4RVoxRnplajdKdFlNR3ho?=
 =?utf-8?B?RWNuOEhIOG5oanlJVTdPeTRaZ3dSNHF0VlExRktmdGwxL1ZqMjNtWnI5d01F?=
 =?utf-8?B?Ymg4WmJxSVhEV0Z6ekpLM2MwS2FKaU5BMS84Y0J3VUVIR0hEQ205Y2hnSzZt?=
 =?utf-8?B?VThtYkFpT081bzlaaVZHWE40d0dZbmg4USthZmJFTG1aQStBTVRxTkdSQVBD?=
 =?utf-8?B?Y3JUWXZjQ0hTd2tjcjI5RWtTT3p2VVNqQUpPMkFjcndrTWo3TmNOMm5oaUhh?=
 =?utf-8?B?SGZvakJ2SWt6VFp2MHg4NGczYi95bGVTZXIvVU0wcVpYYlJTTUtJbDA5Zkd5?=
 =?utf-8?B?ZGxETHE0Sktoa1pWdWVtQnJoUEVXSEJvdzF6dWN0WjVzOVlwVzFmeGFnMllK?=
 =?utf-8?B?WURMUG81V0JVZDlUbUJSSE1lVk51czhtZnp0SnVwUTdUMjNZdnZzbVRxUFA1?=
 =?utf-8?B?Mk1vYXdzVTVrSXJBTlMreXpyZ094NENlYk56UGNRMmx6dk56WVA0djAwRjZa?=
 =?utf-8?B?VjY0Z1dmSUQ4MjZ6SjlSNWs3NXdkYlluSVlBdm5OWnFUZHpzSUNQZlhoNnUr?=
 =?utf-8?B?UnM1WGJPaGRwYU85QldkVkZEYlZJazlRbVBGS2dnOFpYT2c1ZUppd04vSTRX?=
 =?utf-8?B?emYya0RGUE14SDJBdUMwSTdIWkxlU0QrS2FrbmVaOUZRUjZNUXJCbHJ4T3hJ?=
 =?utf-8?B?aElIakR2MFVpcDZ4UmlYWFJaUnFBbTY3eFg4UjkxZDFEeDVjRTF1RjNWZUdB?=
 =?utf-8?B?T0RiWVNpelZ2SmY4c1B0N0lQMlhMWjMxR2hpZW1aWEorWG45OTJGZ2dmS2FE?=
 =?utf-8?B?aDlYaUsySVpKVm4rK2ovV0xFV0s0dlhSNUxJY3V5NG1qZVAzU05RdzNVaFls?=
 =?utf-8?B?clFTN3pCTXZzT0JZWG91aklLdGFKYlEvTHQvSWUxSWQ3ZjdyL011eVNJc0hO?=
 =?utf-8?B?TzVJNjdmak52SmYvTUJLWnY4ZER6ZkswMytxT0NvRllRVlhuLzZkU0hPWHEw?=
 =?utf-8?B?YisxZWVjK1F3R2ZFUE1wa1ZienFWSFRxRFRmWFNnbzVJZEphelRhQmRIUStN?=
 =?utf-8?B?b3lZSGNlRjY0akVhWkxPU1AyWThlV1o4VGVwY3JqQnQ1SFhHTXhYa3l1UUNV?=
 =?utf-8?B?V2x5RHV4UDlqM2psamNjMnRiN0FKUE9rTGpFektXQmZHRXlxMG5hL1hZck5s?=
 =?utf-8?Q?UiAU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:09:02.7462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 495d80fc-c1f5-4486-b377-08de2e5dc65c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185

On Thu Nov 27, 2025 at 9:36 PM CET, Andrew Cooper wrote:
> On 27/11/2025 1:15 pm, Alejandro Vallejo wrote:
>>> Which raises the next question: Should we even allow a hypervisor to be=
 built
>>> with X86_ENABLED_VENDORS =3D=3D 0?
>> That's the most extreme case of "should we boot on a CPU known CPU vendo=
r that=20
>> has been compiled out?", the current code in the RFC uses the unknown ve=
ndor
>> as fallback. We could also panic. We could be trying to exercise the
>> "no assumptions about the vendor" paths.
>>
>> It's a policy decision for you (x86 mantainers) to take. I personally th=
ink the
>> default path is silly in this day and age and we could get rid of it ent=
irely.
>> Without it X86_ENABLED_VENDORS=3D0 would be indeed illegal. On that topi=
c...
>
> We allow compiling out both PV and HVM, so Randconfig can search for
> broken corners of the abstraction.=C2=A0 The same principle applies here.

That answers how to prevent that configuration from appearing in randconfig=
,
not whether that configuration should be valid or not. That's what I meant =
is a
policy decision.

As the RFC stands:

           CONFIG                      POLICY
   X86_ENABLED_VENDORS=3D0 | all boots use the default CPU
   UNKNOWN_CPU=3Dy         |

   X86_ENABLED_VENDORS=3D0 | panic on boot
   UNKNOWN_CPU=3Dn         |

   X86_ENABLED_VENDORS=3D<all> | current all-vendors-compiled-in
   UNKNOWN_CPU=3Dy             |

   X86_ENABLED_VENDORS=3D<all> | Marginal code removal in early_cpu_init() =
of
   UNKNOWN_CPU=3Dn             | the default CPU branch.

   X86_ENABLED_VENDORS=3D<more-than-1> | x86_vendor_is() folds into false w=
hen
   UNKNOWN_CPU=3D<any>                 | checking against all-compiled-out =
vendors
                                     | Also, some &-checks turn into =3D=3D=
-checks.

   X86_ENABLED_VENDORS=3D<single> | Same as the one above.
   UNKNOWN_CPU=3Dy                |

   X86_ENABLED_VENDORS=3D<single> | x86_vendor_is() folds into constant tru=
e/false
   UNKNOWN_CPU=3Dn                |

Does this sound like a credible approach? What could be different?

  - Should we remove the "default" case altogether"? That removes the Kconf=
ig
    and simplifies matters somewhat.
  - If the default case is to stay, should we allow running with no-explici=
t
    vendors set?

>
> For running such a hypervisor, I can't see anything that would
> fundamentally interfere with PV guests; PV guests are all architectural x=
86.

You could also run HVM, seeing how SVM and VMX don't intrinsically require =
AMD
and INTEL respectively, but it wouldn't be pleasant, secure or safe. It wou=
ld
be wonky at best. In general it's a path I wouldn't like to fallback to on =
the
basis that it's completely untested. I don't believe OSSTest ever exercised=
 it
(I wouldn't even know how), nor GitlabCI, nor XenRT.

>
> I don't like there being an explicit Kconfig option for UNKNOWN.=C2=A0
> UNKNOWN should simply be "didn't match anything we compiled in".

What I require for the optimisation to fully work out is precisely the remo=
val
of that the "didn't match anything we compiled in" as a plausible successfu=
l
boot scenario in order for all x86_vendor_is(x, X86_VENDOR_AMD) to fold int=
o
"true". I could reverse the polarity and have a REQUIRE_KNOWN_VENDOR, but t=
hat's
a non additive option that clashes with allyesconfig/allnoconfig.

>
> ~Andrew

Cheers,
Alejandro

