Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C307A84260
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945444.1343633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qcX-0005lq-7h; Thu, 10 Apr 2025 12:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945444.1343633; Thu, 10 Apr 2025 12:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qcX-0005jf-3c; Thu, 10 Apr 2025 12:03:01 +0000
Received: by outflank-mailman (input) for mailman id 945444;
 Thu, 10 Apr 2025 12:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2qcV-0005jQ-Ff
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:02:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2413::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd5ed402-1603-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 14:02:57 +0200 (CEST)
Received: from DS7PR03CA0338.namprd03.prod.outlook.com (2603:10b6:8:55::31) by
 CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.35; Thu, 10 Apr 2025 12:02:51 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::85) by DS7PR03CA0338.outlook.office365.com
 (2603:10b6:8:55::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.25 via Frontend Transport; Thu,
 10 Apr 2025 12:02:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.0 via Frontend Transport; Thu, 10 Apr 2025 12:02:51 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 07:02:49 -0500
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
X-Inumbo-ID: bd5ed402-1603-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kosnbQTFLXM6u7onP7CdcAl3epyV2qt6uAiKmnHmMf/Y58qljWuESlTknR6lm9o5HEQXhcRrhpzic9XODYb/7RF+A3Wr5aOMnB0AaJdUEBsDFNpvEQ5kliT7aoz+LVW9SMbk5TLb8hQlqjH729w0IJIBA6XqTFp/59QxUKW+L6UXXV0BIkHnuquVJygSeI/e3ux2Ce8WtgZ/Aa2WwwGaQ7LwyezdC5E27PRpvMQ11kSJMTiTnt3iStlPFXqix6oPbRZpvx3orACqY439AjWQMMpe4g2QlbKh3pAXvQ1cgUGts96KIpNZxMMDJjJ7opEbRYh5/AghDmRyXc1MUlZL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ2nJtowApfrh7mjutfINTXmd8npFWaFh2bbOnPVgs4=;
 b=UE4fGvcXLIU6rabqLyOl4W8/uSCuPqt6eCUyHTBLJxpas0r7+a2r92EPkTMJa3k01dxATikjumHxqSCFRMZq47mQDLPc73cJb++IxAU03XrsM3iJYh/imAPyFXBESFBvwxTixBqKMQ+jI3AsK3I3qbJPDJTtKz0f7tnnie089TwXJoGiFEXBp74eLo6grW2C5v/lhoznv95vf2kdcfjWsG6YNI33ILDdGrwGCNpr3YGyb2fTMRQ7KX0e26hxMGxKuRjyuhK0j/ga7NkMWJnKnV+ZUhFDvKSipGXjZlQWAU4ai0alDY4TzCMSaetNtqKFYcc/0Igp/pX04nZWShCLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ2nJtowApfrh7mjutfINTXmd8npFWaFh2bbOnPVgs4=;
 b=AcZcvCikDqmUr19AebLLb53vehTAj/Otjq2pJBNxKjaSy67wNxw9eWCr6qiLSiuybmrVXHRzou8QRlwxYCSjNzyco22jZOjUW1XNb/GQIht4yiv12wu3xBaZkhkN2Tvs4I8ltRL6prc+okh47z6tZLvIWHhwJk/sCa0N284zfVk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 13:02:48 +0100
Message-ID: <D92XZF3R2BA9.9GKEOF93H2E2@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-4-agarciav@amd.com>
 <ay75cmCDuxMtW2NROw3rcPNNhWU-QXAuk25j_isEbVoH7WmECfIC1xWw9hX-yvWKDXqamxx32tum4_3CRN46CGrgQKk1_loSZsExg4Ata1s=@proton.me>
In-Reply-To: <ay75cmCDuxMtW2NROw3rcPNNhWU-QXAuk25j_isEbVoH7WmECfIC1xWw9hX-yvWKDXqamxx32tum4_3CRN46CGrgQKk1_loSZsExg4Ata1s=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: ff24bf39-be9b-4e51-464b-08dd78279e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akRLaTJoS1BDTzUwcmJyQlZmZ09MbXdJaTZ6eFM4UnpyYlhDRzVNV2R6aHNl?=
 =?utf-8?B?Tkl5bXJnRU5CVkR0Wk1EMlNVSE10YTFTMlh3QmVMWC9zVzBwU0tWUk5sejJk?=
 =?utf-8?B?QTJvTjlaSkowUW1LZVBLMHIzdWwzSFNWQ0VFQWpXY3MvOHVVWXR5Qm0wYTdZ?=
 =?utf-8?B?TElFMlh2SFQva3ZXVE1VWlQxMGZ2Q0w5MHU1M2pWZDJSdWY2b2Ntc1RNVkxM?=
 =?utf-8?B?cEVYMkdJeTdudHR4L2JXaTIrOEFRQ2tuWExjcDhHaTlwSy9GcHlXRFhJWHV6?=
 =?utf-8?B?WU1DTnRIK01kcUdMaE5xWHFTMnRNczB2bFJaQnJhOVJ3L0JObUYrWEZEUGJ3?=
 =?utf-8?B?QmRoTm1BK0gyV1RUeTVGU0VqL05mUkFMVmtPU3FDWFB6eEk4N3pMb2tLNnRI?=
 =?utf-8?B?ZFlYdlNQK0k4SGpDT3g3Qzd3S29Ub0h4QjhTKzkzRURZWGQ2QkZuQTYvSUhR?=
 =?utf-8?B?V2Y3bW9VRkVJcXpTS3VBRktCVkJ1MUZJczE2M2JLemJIajdEeFpnUENqb2s3?=
 =?utf-8?B?QjhyR3VkMUM0bzhMcDg0UzYwdTlJc0NPZHlPMVJ0UlVna3M0NFhTRkR5NDNY?=
 =?utf-8?B?WEJXcEUycVRoTXFqSy9LeHhia0QxMW9vS2VsdHVMakZWc3dEYVU4Vk5Kajh3?=
 =?utf-8?B?QytQOE1GVmNITElQQTJUZDVIV3JmMUo4bXBqdmtmd09lVWd0TGtHUHpzNVZE?=
 =?utf-8?B?MTRZSkVLaHh3dlk2YXk3Q3l5V0JCOGZzaFVCNDhoL1VvNE1PcTZMRHQ1ZW5h?=
 =?utf-8?B?aEhiMWg1d3daOWZYbXdTY0RIM1U3V2QwTzY1R2luTkkrSHBJbW1lRHdmOUVv?=
 =?utf-8?B?RWUrV1V1VHM3WE03SGZTUkszbDY0eUVWOEVIdnoyNjdqck5GZ2VVMWhoRk5x?=
 =?utf-8?B?SVdlTUJmd2JScVAxUUhtcFpCSjRkbUNPWlFxY2NKUE1Mb1NNeU9sc3VPQjVC?=
 =?utf-8?B?V0hISHBObjZGdGErWTdtNk91N2t2WS90OEh2d2YvdklaY2x5dEkrRGp6OVpY?=
 =?utf-8?B?VXdrcjYrbWJtSGE4RTA0Y0lubnJkUXJjL1Fack1ScmRvYVkvbk12d290NU44?=
 =?utf-8?B?UFFpQ2FUUWdycWZqblp0enUrTjI2OFpUNGhxQ0U5aElTZ2FQRVVIdE1SMkl2?=
 =?utf-8?B?RDJwRjZoMHlMZ3FabE11RUEzNW50d2pLMkJBR0EzVFdYNnpYNFBBNjJVcW9V?=
 =?utf-8?B?TzJGTUtlV2lsY3RrY2R5ZU5QeUw3L2dPeEtBT2xweGxUUjNuY01GdVJUNHNm?=
 =?utf-8?B?MW5oUlY2QXFkWkFDUW51djloSitEUkpObDRVdTJTUk10WGVCZWFMMHpIeDRi?=
 =?utf-8?B?VmdRYmVpNTBHQ1BiQjhnaFgxL2dTbzBTejVrOThLL0lWTlZvbVFEWS9hU3Jw?=
 =?utf-8?B?dXh2T1JqV29NOXZBYkJMbit3cXNRV1J3Q08wMWdSMmYxT2Rjdm5hMXcyUkQw?=
 =?utf-8?B?TjI4UWRQbm9xMzJQTXRaN0VseGJNdjZCZ05uN2NnQWlXRTNXY2R0OHlMUHhi?=
 =?utf-8?B?TXQzSXBSS2FiZzEzSUxsLzZ4T0d5SXJVTjZseVUxYWE1ZUwwdWdXMEFSVDVt?=
 =?utf-8?B?TC8vZkhHdnZ5SWMzQ1ppbGlVYVpHai9mNTFydDBGaUhONVFBZmZDRjY4U0Mr?=
 =?utf-8?B?VVhvUWtISm1CQUtVenVIN3EzL3pIMWpIeGF3QjI4b2hqc3hPUHE1OW93ajJG?=
 =?utf-8?B?MGUvcTVIblZUcnI2bytLL2d5SFMrYU1vTVZ4NWFScmJKSnUrdUJHZFFLWGVH?=
 =?utf-8?B?WmlnaGM1VGNGeWVESVpHdXJ6WXZkQmpuK01ob0VyTjBPMGVPSE9aTHQ3SVlM?=
 =?utf-8?B?L2dTMEpEL0plaG5EaFBxSzd6ZFRpV1JkL3UrL3NqSTFLTjFLTWZLYjE2SGN3?=
 =?utf-8?B?cmVaVlNxemZTNERqa1M5M1d6S2ZrVGdaRjhFN1g0Y3g5dU13bkFBeFJheE95?=
 =?utf-8?B?NUEvTjJQUU1kaXBjOE9zZHVYZ3NFczRNaTdFcnFOWGRvaXdLb1ZMSW9ERCtK?=
 =?utf-8?B?clE2N3drVEZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:02:51.3855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff24bf39-be9b-4e51-464b-08dd78279e7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069

On Wed Apr 9, 2025 at 10:05 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Add a container for the "cooked" command line for a domain. This
>> provides for the backing memory to be directly associated with the
>> domain being constructed. This is done in anticipation that the domain
>> construction path may need to be invoked multiple times, thus ensuring
>> each instance had a distinct memory allocation.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> Signed-off-by: Alejandro Vallejo agarciav@amd.com
>>=20
>> ---
>> No changes on ACPI cmdline handling on PVH, as it's orthogonal to the
>> purpose of this patch.
>>=20
>> v3:
>> * s/xfree/XFREE/ on failed construct_dom0() to avoid a dangling
>> cmdline ptr.
>> * Re-flow hvm_copy_to_guest_phys() into a multi-line call.
>> * s/bd->cmdline !=3D NULL/b->cmdline/ (to homogenise with the previous
>>=20
>> cmdline pointer check)
>> ---
>> xen/arch/x86/hvm/dom0_build.c | 12 +++----
>> xen/arch/x86/include/asm/boot-domain.h | 1 +
>> xen/arch/x86/pv/dom0_build.c | 4 +--
>> xen/arch/x86/setup.c | 50 +++++++++++++++++++-------
>> 4 files changed, 47 insertions(+), 20 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build=
.c
>> index 2a094b3145..ebad5a49b8 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -653,7 +653,6 @@ static int __init pvh_load_kernel(
>> void *image_start =3D image_base + image->headroom;
>>=20
>> unsigned long image_len =3D image->size;
>>=20
>> unsigned long initrd_len =3D initrd ? initrd->size : 0;
>>=20
>> - const char *cmdline =3D image->cmdline_pa ? __va(image->cmdline_pa) : =
NULL;
>>=20
>> const char *initrd_cmdline =3D NULL;
>> struct elf_binary elf;
>> struct elf_dom_parms parms;
>> @@ -736,8 +735,8 @@ static int __init pvh_load_kernel(
>> initrd =3D NULL;
>> }
>>=20
>> - if ( cmdline )
>> - extra_space +=3D elf_round_up(&elf, strlen(cmdline) + 1);
>> + if ( bd->cmdline )
>>=20
>> + extra_space +=3D elf_round_up(&elf, strlen(bd->cmdline) + 1);
>
> I think it makes sense to use local variable to cache the results of=20
>
>   strlen(bd->cmdline) + 1
>
> since the construct is used multiple times within pvh_load_kernel()
>
> E.g. cmdline_len similarly to {image,initrd}_len.
>

Seeing how you're the second person to propose the same thing, I'll bite
and just do it. I really dislike the wall of locals in
pvh_load_kernel(), but oh well...

Cheers,
Alejandro

