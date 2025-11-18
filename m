Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64CEC68C78
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 11:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164578.1491508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLIoX-0007Ju-Qs; Tue, 18 Nov 2025 10:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164578.1491508; Tue, 18 Nov 2025 10:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLIoX-0007I3-Nv; Tue, 18 Nov 2025 10:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1164578;
 Tue, 18 Nov 2025 10:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=USx6=52=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vLIoW-0007Hx-90
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 10:19:56 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fb124f9-c468-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 11:19:54 +0100 (CET)
Received: from DS7PR03CA0025.namprd03.prod.outlook.com (2603:10b6:5:3b8::30)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 10:19:50 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::97) by DS7PR03CA0025.outlook.office365.com
 (2603:10b6:5:3b8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Tue,
 18 Nov 2025 10:19:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 10:19:49 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 02:19:47 -0800
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
X-Inumbo-ID: 1fb124f9-c468-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrJL0JrMEB0m7a4tht5R3yH1rzrwmSdkQY/WEevBthYob7bMkNHzhkCPTbg4bPFb2fZ2TbAB9MO1r3dNMxZhmrROGD2J7HDixa20RXUst/km/mSbu7mUxkmiv7LtukLV5h+Iy2FRvML36aqkyiTeDcAftBoAEHlWrn6Jkf8pEFZwDDf3bablCvqgsyQmz1jIBC0R1327QReAv+W4m6nXmpkYG28s7BW652xwm9nnyaYAQHGBUB/bCW+zHAZgd8OlvqOQAdKFSyThGV8lgb8lzR31ciSBkHjIPOCd8v5kU+5aeuKaVTFtDR5NrSS/BqKYANLaGrAKNpN4MLsWBTGzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/9VCwJ30+tlSZHfeU8x6VTrj4Pik8zQbWJTIumAWYI=;
 b=V0Fxb3GTRFK4hXijuwIPhtT0QjwhyYtTk7pTulMgNQ31KTBGGYdLjKXW9LtfatsL6KOE2aGs4FTRQ48bCgpEbio+H67D2ix6pSb5+GmI2+/g0SJ1dDtd3XCVCdDxTUbQfVZbkmNX4OrIUNBMGKVu9fPpCsBKssMvWcyKBb1RITj2psT1PcY1vPDDbGP3vSJFrce4owkSbZ7tSUB/m2L/gRGMClOi60L75676K+fECj/Q8w6mmECfJmYt/3zOkKM3TJ0Ifa56lVDGMgspNLLILyjJBawCVtghX/QcmE0/wYxPVPFtBHfJS1bIGDOrMdhDEc3XTkT4y2g5XbuUMpWbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/9VCwJ30+tlSZHfeU8x6VTrj4Pik8zQbWJTIumAWYI=;
 b=0uXTuY4LY4BbkEhJON46/wAYb9ROHsie5PRS4/U05+QyiV7nNT0evzA2vTmEcl1myWFXAEv+zTdASHmpYbSra7grUSk/7YR+L6ZhiLGhllZhSJ4cLTp3tT0HG9gMrzaBnSbP9PuvaIBx6aXey0n22mV5dmkfSJjeSwRbxQ4exf4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Nov 2025 11:19:45 +0100
Message-ID: <DEBQTGUHGDTP.QF2PFIK6CKUZ@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/4] Add Kconfig option to remove microcode loading
 support
X-Mailer: aerc 0.20.1
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
 <61df49ba-4aab-42e3-b945-700a8f20c739@citrix.com>
 <035a9514-9a7f-44ab-86a7-61deab37f7c7@suse.com>
In-Reply-To: <035a9514-9a7f-44ab-86a7-61deab37f7c7@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: 47eef671-c8ba-4e4c-169d-08de268c01a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzE0ZkJwYkI2NGZPcmcxWlFIUG4vUWFvZmo5TStKU1dsVnZ4dnd0U2pHUDdZ?=
 =?utf-8?B?c1Q2TG5Xc2pJU0VBNjJDM29mTFRxbWNCMTdTdVFxa3NBZTBQVG5ET3cxaW5Q?=
 =?utf-8?B?RDdpUEoyOVhtbjVOUzkrbGJJbVRYTDBsdk1FUHQ4Yk5ZRDc2cW80b2ZsbGg3?=
 =?utf-8?B?WlFDZXY5L1UzQjR0ekt2L2U0bFVXbktGME84OTV3cUdjRERCdXJXdElsVTZT?=
 =?utf-8?B?MDRTVTYyNmxkVGw5dkF0RmpsYUs5dG1iSE9wZVJlbUgvRFAyMlcyanBFTmJk?=
 =?utf-8?B?eVhyb3dFOEl0TmZCVnpvWDNIbmgxOTRmeWlwQXRCTWxpQ0J2QXNaSGlMNjdV?=
 =?utf-8?B?NGVKbUFIV2IyNUMxSkxLTHR6Vm52MlFMY0dGY0NvYmpWNzM5Z1Z5UXJMZUNt?=
 =?utf-8?B?NXFFSndGeDQxU1pidm5Rcm9CV3pnYVlYZ1FVdm94WFc5RGtBUGV0bTlRMmRU?=
 =?utf-8?B?UDMxek5DWHBmR3dXQ3NCVENxUXR4dWhmTHhQSTZqVVpaVHBaVHo0Q3kvTjFk?=
 =?utf-8?B?RDMvZW52Q05SYjhuZ1hmTFE3RTU5RE1BeHFlQjBrTXI2SloyQ2dPWmJWZEVw?=
 =?utf-8?B?NDBBTmRiK3RNSUhPQk5nTW1QUGdOL0laNURSZWkzR3RRWGUxMWNvTUZVamlQ?=
 =?utf-8?B?MXQ2MEgyUW83anpUQWttYTNsL0RidlJxZGw5elQ3dVlwZGpkV0FPQzZMdnpl?=
 =?utf-8?B?VTVzNWZtUkw4MHNzMmhkNkUxVllKcUJnTVFNcEdMUXhMUXh5b3BFTkt3SUIv?=
 =?utf-8?B?Y1FtVTlMVVJ3SHhlWWIvRW9COExuOUxLVkEzSUZNdkt1Z3pCQy9PdjBoU1hF?=
 =?utf-8?B?RFBtSG9XK0FKR0RKdm5wOFkvQ0ljN3VESTZjMlpUR24xallmZnQ1N2pGOGVT?=
 =?utf-8?B?bTFlZWNpU2JSZ25wYTVkOWdwQUhzbHF0YUwvRUdMK0t5YmVQTzRXU2swOTRk?=
 =?utf-8?B?MkJtdE0wS2JMc091TVBhV2RwYkowU3N0UzdjZ05kTHFhL001Q2FxVWVDeU1P?=
 =?utf-8?B?SkJ1ajNCQXNHRGpBK01BWnRaemNEWEIxZi9xaDRDanI4Nklza3hxL2E5TXAv?=
 =?utf-8?B?YlZZM3JSRjRMWmlFb2xYVml4RUpJSFYwN0NFc0N3WUZrSG56QXJORUs5QmxH?=
 =?utf-8?B?NUxVcTZ4Vm9mK2lVS1h0RC9xb3JQWkZYUWovdk0vUVJYZ2VubEJRNlJtblNB?=
 =?utf-8?B?VnNnY0RnU3NGNFlCbi9MbUVHRTdvZk84NmxzeTlFMmIrTFhRVjRrWmFxaTB1?=
 =?utf-8?B?V3hIWXlTVjkzeWVnTFpBZm9QUVd2b2Q2RG9IUWcza0ROSGp6NVFWcTN2aWk4?=
 =?utf-8?B?RHd0Z241UjdHaEp3OHVpcVQvQXlwcytxZTZTckhnOXMycUlRN1IyYnV3U08x?=
 =?utf-8?B?UkthQmtFWlgxSy9GeDJpOFRITzBwTVJ2L1VCUk1zak9tbmI1MC9Gbm1qTkVF?=
 =?utf-8?B?ZWo3bmZGNkVKYUU0N1BsTU5NV3M2VXdjbEo5aDVCTnJmcng1S0NwZnpJdWFo?=
 =?utf-8?B?cEtPcFNRZjBkTmFZeWpoQkw2eE9VZlYzUHkyQXFXUEFLUm1zOWxoUnV0bHla?=
 =?utf-8?B?RGNNNE9DaDYyTFRSWGJ6cUlmREJEZmgxdjIvcERiL2dVMnVkQzlYTXNpczNN?=
 =?utf-8?B?aDhHbmNDQU9yR3Q3QkJ1MTVWUnpFeE5qU3FGcEpsR1IrQTdDSE5DMEdxVzda?=
 =?utf-8?B?K3JkbWlnTklsRVY2ZEdZQmRvc3QyKzJYSk9RR3lQZGlWQ0x5SkdMSWVwNkpF?=
 =?utf-8?B?Y1pVeTBQL0hwMGIrV1BoQ3VtQUkrYUtzVWhXTXJKc1lzZ3lLdklVeGY2TldO?=
 =?utf-8?B?K1Z2dUY4SVJiYmRLbU5Jb3l4Z05FUmgvRGZucjRaUVVsRkZOcWgwMFFjQkpV?=
 =?utf-8?B?UXoremltOEN4cFAxUy9yNEtOOXpSKzJud1NTbGcxaGZHTUFybEg5T0hkczl2?=
 =?utf-8?B?K3hQNlY5SVNNRkVCTXNIbU9oY0cyQ2E1QXIrNVE5cFg0K2NjVWwwaGtvZnBw?=
 =?utf-8?B?dDhZQk1UcTBpUzZEQlkvR3lZOFJIYmwxMUJnNWJFVlZoa0ZUM1FKN2kzb3RC?=
 =?utf-8?B?cTAzZHJRbks1N3BXTXYrSWF1bnpiMDMvclF2NUdwNlNQbzRyY0RHbzBwaEVs?=
 =?utf-8?Q?r0yo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 10:19:49.7182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47eef671-c8ba-4e4c-169d-08de268c01a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322

On Mon Nov 17, 2025 at 5:55 PM CET, Jan Beulich wrote:
> On 13.11.2025 09:50, Andrew Cooper wrote:
>> On 12/11/2025 4:22 pm, Alejandro Vallejo wrote:
>>>  xen/arch/x86/Kconfig                    | 12 ++++
>>>  xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
>>>  xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
>>>  xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
>>>  xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
>>>  xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
>>>  xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
>>>  xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
>>>  xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
>>>  xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
>>>  xen/arch/x86/cpu/microcode/private.h    | 14 +++++
>>>  xen/arch/x86/efi/efi-boot.h             |  2 +-
>>>  xen/arch/x86/platform_hypercall.c       |  2 +
>>>  13 files changed, 259 insertions(+), 158 deletions(-)
>>>  create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
>>>  create mode 100644 xen/arch/x86/cpu/microcode/amd.h
>>>  create mode 100644 xen/arch/x86/cpu/microcode/base.c
>>>  create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
>>>  create mode 100644 xen/arch/x86/cpu/microcode/intel.h
>>=20
>> This is awfully invasive for something that ultimately drops only a
>> handful of lines of code.
>>=20
>> First, it should be CONFIG_MICROCODE_LOADING.=C2=A0 We're not getting ri=
d of
>> all microcode capabilities.=C2=A0 Also, of all the places where UCODE ne=
eds
>> expanding properly, it's Kconfig.
>>=20
>> Next, annotate the functions that you conditionally don't reference in
>> {amd,intel}_ucode_ops with __maybe_unused, and dead code elimination
>> should do the rest.

I've done a few tests to see how something along those lines would pan out =
for
our needs. Our coverage tool correctly ignores ellided functions, so I'll b=
e
sending a v2 shortly.

>
> Are you, btw, sure this would be Misra-compliant? Right now we solely
> deviate __maybe_unused when used on labels which may really be unused,
> afaics.
>
> Jan

Rather than appending an unconditional __maybe_unused (that's, imo, a bad i=
dea),
I'll be creating a local __ucode_loading attribute in private.h that maps t=
o
__maybe_unused when CONFIG_MICROCODE_LOADING is not set and to nothing when=
 it
is set.

However, I'm tentatively keeping the movement from core.c to base.c, as the=
re's
just way too many functions with external linkage to ifdef. It'd be an utte=
rly
confusing file otherwise.

Plus, I'll be conditionally getting rid of earlycpio.c too, which is someth=
ing I
neglected to do in v1 even if it's only used for microcode loading.

Cheers,
Alejandro

