Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BADCA9C8E5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967852.1357567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8I5s-0001J1-RM; Fri, 25 Apr 2025 12:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967852.1357567; Fri, 25 Apr 2025 12:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8I5s-0001Hq-OV; Fri, 25 Apr 2025 12:23:48 +0000
Received: by outflank-mailman (input) for mailman id 967852;
 Fri, 25 Apr 2025 12:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8I5r-0001Ff-AA
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:23:47 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fbedf2a-21d0-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:23:43 +0200 (CEST)
Received: from CH0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:610:b3::23)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Fri, 25 Apr
 2025 12:23:33 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::b3) by CH0PR03CA0048.outlook.office365.com
 (2603:10b6:610:b3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 12:23:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 12:23:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 07:23:32 -0500
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
X-Inumbo-ID: 1fbedf2a-21d0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XryCHQ9lcLbJ2a8GyBfOuLhRYmKoCBDhrIELnrsJnsNSUT0oFZSGeOwis9gW3o+WUZknSuMe13qTPnnH95CWYaE7h+Q5G9IdaREM4q/0zvRe3VmFG5Q/AREouWB4wXvQe/cy/0vxf5Rw/fhHlJxIkYr4Yvk1D6k2FaY0GrkaL6uyskFJkQZYC6sf2kVCcE/pfVY9Ay9lUs0aeJkmtIWavFt0cLaqqf2R4IvZUqZN/jG9drskgxLqTxORYUWljzOoUK0pen5NvQ5osA9lGBOOTJm9Z3H1WLtnsu7apUIelmdf8ekKj6w/39+YlCi5oZXibo24kgJX4MyE8o9JAi19Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pGcYbRi0Ea7ULYgSqcSRAcuX2/Qs5vWBI6vB5qWo/M=;
 b=iEhzQdqbUhgfwa22p9k5DCfNqvS7QI6gusNO/4tM5tlvh+x4gYtBcwh52V0FNHhvqNwGZlJZYCni6qDtFCRUu8llB9B3p73gyKFOthlKxPHozTgrKxZvZJ1WHx9v4r7sYGliYhj2m7wL/TGccKAqdEkV9mq+xa6uVjE/fk2AnVp5ny+MwlxGV1GCvfbWG1NqLVvIPiSQgZGk1SO5nPK1BzEQ5Knfov0xPUUnhCyGOdaSHafxnu9peoDm6MpmZx8NHbwLuJrMMTbx7EgJVY3SJyVC3Heeq1SDI5KUaF5XJkzACGPE52htgvcriL2V1Z7P/eeDNqGOiybziFTBrhIj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pGcYbRi0Ea7ULYgSqcSRAcuX2/Qs5vWBI6vB5qWo/M=;
 b=auF5DBC/mM/m5AwdDeCJLmXuC9aRa+KagHo9qg91SdRhR0M8GpsmEI25qz8PSv+XUOkQ7fiNnaqh4rbmo/UvNykKtbDXHchOohrD2H546R6wniTl/uFR1LBpn/cHPeI8FzBegPVYvOQUiHYT5vzjCFAok1rG3xZyE5/lx+p3ElI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 13:23:30 +0100
Message-ID: <D9FPTG9VXGV2.3OT1N6UFNG2WI@amd.com>
Subject: Re: [PATCH] x86/hvmloader: fix usage of NULL with cpuid_count()
From: Alejandro Vallejo <agarciav@amd.com>
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250424125813.96449-1-roger.pau@citrix.com>
In-Reply-To: <20250424125813.96449-1-roger.pau@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbd7aa2-1bdd-4161-84d8-08dd83f3fef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkFVMW5pR0RiUGc4Z00vVzVsTmV5RE1TaXk4aWRnd0tncHB3S3dCTTJuK3R5?=
 =?utf-8?B?UExmNWxIV1ozazQ0dFRzdEgrZGFUWWNjdzJWNW1MRE8reWtMUjZKbjFydTdn?=
 =?utf-8?B?Z3BTZFZwMWhpY292QlR1SmdCQk1qU1JvOXAwQnozYkpiWWpZbEsxUWFnRG1q?=
 =?utf-8?B?N3lRcWJBMFJ2dmV5Nk9OZHJxU1BWWkZpWWtNbThSSzFZZ203OGtwVzZpdGdR?=
 =?utf-8?B?bHJZdWNMVEJkWnhHdXR5Z2loOWc1Wk9qZzlBME83VDNOeDNuY0FyK3JzYjd2?=
 =?utf-8?B?QWM1QzBiaitpYm1oRitlQmpGejhSZlpaSmV3UEx1eGR4UHVYQWZOTVl4Szdr?=
 =?utf-8?B?UHhMcEI4enZ3dFJFRElDU0pRejF4WEpvMElidnN3VVVJVlphdUF5QWFaOGFQ?=
 =?utf-8?B?S3NiaEJXV1N6WlRWL3BFWlVqWTBJNFhJTy9PUG1vdWFLUWpGeGxQSEo3WFJ0?=
 =?utf-8?B?T2xyemtqQWk2VmVsTXdnbEVCSS9BNjdiSFptaVRJQjFIV1RkTW9LRVJZNlBZ?=
 =?utf-8?B?bE9mZ0hUeHBHck5OMERWazY3S2FaRGdBUVFldm5GelgzWE9BK0FCRHVEK2Fy?=
 =?utf-8?B?LzZLK2ZyNXdnTGV3ZHZveFdQNkw2eU04czVGRUxJUlVhYUxlWW9NQXdZUGkr?=
 =?utf-8?B?WTkzYW0zMXBzOHMzaDFJTHZaaEUrS3BadkE0N3JhNVVsUExoMDNFOWE5WnI2?=
 =?utf-8?B?TnhvdHdJYk1kd3d0dmdVNzdKUS9sQnpLVGlvNWVkQ2szeEZUeUVmaFRvQ2kw?=
 =?utf-8?B?K3lwYVVYZC9UeG4rb0ticE03amVOY3UxZnZvYlVzbEpBNjliZHVYZTkzdHlj?=
 =?utf-8?B?M2JnTjRwYUErZU4wUkx3VmFWMDBCLzQyRGMyMkN5ekI0aDltMng5SWxCWSt0?=
 =?utf-8?B?VklyQk13UnRTcTRlRkYzdkxldU5wWGpGWXA3MUtyekQ4THBzV3Yrcm91dWM5?=
 =?utf-8?B?UWY2aDR4QnJQbE41bzdHdFVsaysxMzVhUU1Hd3ZNc0pOaWYrbmpoZW1lenBk?=
 =?utf-8?B?MitpaWZWbGFab0lBa3VKWktnclM5UFhaL2Q0M25IZFBHS2RjVDdLR1hha1V6?=
 =?utf-8?B?b2xzcXE2aXJrQkZkRUwwbS90cFJBSGRxc2RLZWpyME9lczl0bDRpL0pKa2U1?=
 =?utf-8?B?Q3dOZk9SWmZ5cnFscGkvNUw4RnM2ZFdzV1l6cHlycmI1Z3dTdGNaTFRELzVi?=
 =?utf-8?B?NjdqOVpVaEdrVlhCMnNneC9MN0ovc0o4c1k0NXVpSkVMdkdYY1RldHpveUo4?=
 =?utf-8?B?TXpjUFJnN3RsUTJnZkkrdmR6cmRuNzIyZEdCckdoQTFZbmpiaE1rQTNlZG5y?=
 =?utf-8?B?aDU5bHBDOTRlKzJjRzJMK3FQYWE0c2lVckhkcnJpT050SUJmQTNmUC9ybTJG?=
 =?utf-8?B?L05MU0lqbXg0UlcwZTVzbVRwMVdPNmM5Vm40T05VZmxTSTN3WGRrenFaNHlO?=
 =?utf-8?B?Rkg5QlptSGM4OUVYVnU5a1puWnRCSXUyblg3UGo2aUZMTUVkSVFrTlEwK3FW?=
 =?utf-8?B?cnZXYWEyRkRtYXJ1WnA3RXRWcEp2YkthYVU5MkJHU1ZwRmEzTC91eEpIaEVS?=
 =?utf-8?B?RmtoYnkxcmNtM2kwUUplNnRTZ1pZNzJYNFBwQ1p2TmZxTW1adm12N2V4Z3Y3?=
 =?utf-8?B?SE1TK01PM3owWWV1eGFnOTFlZy9NMkxNdXQ3SVZSUDFQT3JzN21pMUhqM21k?=
 =?utf-8?B?TGduaWo5UVEvV3g5NlJjNmI1NkFtdFJjeHRSSnFpejNNWWkrODJwU1BLMVhT?=
 =?utf-8?B?WWhxMzYyQ25FTUZZUVZjRmFlWXEvYS9qY2JkTmtLM29iYUtrMXN4RTkxZlZK?=
 =?utf-8?B?TjhTYkpJYzdkbjFlZ0VrTi93N3dGcy9jaVhmSXd5ZUhydy9xdS80ajBSRW9D?=
 =?utf-8?B?K3l0VzJWTHAvbmovbnZDQnRJOVU5QUtYdFZwRktSZllPWVQwaDAxMjNXVUk1?=
 =?utf-8?B?bzR0cDZTS2NQdXBVY0w2b0VLcGZLNnQ3b2srMmZJWG5BaS9keXA0OXQ3N3Fv?=
 =?utf-8?B?YWEwZFlGM2RaS3ZnWHEwZVR6eE93S2E3Mm1QRFBHKzRuelM5UWVJelZvSW02?=
 =?utf-8?Q?aKL37h?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 12:23:33.3517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbd7aa2-1bdd-4161-84d8-08dd83f3fef3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196

On Thu Apr 24, 2025 at 1:58 PM BST, Roger Pau Monne wrote:
> The commit that added support for retrieving the APIC IDs from the APs
> introduced several usages of cpuid() with NULL parameters, which is not
> handled by the underlying implementation.  For GCC I expect this results =
in
> writes to the physical address at 0, however for Clang the generated code
> in smp.o is:
>
> tools/firmware/hvmloader/smp.o: file format elf32-i386
>
> Disassembly of section .text:
>
> 00000000 <smp_initialise>:
>        0: 55                            pushl   %ebp
>        1: 89 e5                         movl    %esp, %ebp
>        3: 53                            pushl   %ebx
>        4: 31 c0                         xorl    %eax, %eax
>        6: 31 c9                         xorl    %ecx, %ecx
>        8: 0f a2                         cpuid
>
> Showing the usage of a NULL pointer results in undefined behavior, and
> clang refusing to generate further code after it.
>
> Fix by using a temporary variable in cpuid_count() in place for any NULL
> parameter.
>
> Fixes: 9ad0db58c7e2 ('tools/hvmloader: Retrieve APIC IDs from the APs the=
mselves')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Ugh, that's on me. I was sure I saw the pattern in Xen (from where the
code came from), but clearly I hallucinated.

> ---
> Could also be fixed by using the temporary variable in the call sites,
> however that's more code in the call sites at the expense of less checkin=
g.
> I don't think the extra NULL check logic in cpuid_count() is that bad.
>
> Overall the solution proposed in this patch is safer going forward, as it
> prevent issues like this from being introduced in the first place.

Might be worth moving this same extra checks onto Xen's cpuid. There's
no shortage of `junk` variables at the callsites.

> ---
>  tools/firmware/hvmloader/util.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/u=
til.h
> index 644450c51ceb..765a013ddd9e 100644
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -190,6 +190,17 @@ static inline void cpuid_count(
>      uint32_t *ecx,
>      uint32_t *edx)
>  {
> +    uint32_t tmp;
> +
> +    if ( !eax )
> +        eax =3D &tmp;
> +    if ( !ebx )
> +        ebx =3D &tmp;
> +    if ( !ecx )
> +        ecx =3D &tmp;
> +    if ( !edx )
> +        edx =3D &tmp;
> +

A somewhat more compact alternative that doesn't require tmp would be:

  eax =3D eax ?: &leaf;
  ebx =3D ebx ?: &leaf;
  ecx =3D ecx ?: &leaf;
  edx =3D edx ?: &leaf;

It clobbers `leaf`, but only after it's no longer relevant.

>      asm volatile ( "cpuid"
>                     : "=3Da" (*eax), "=3Db" (*ebx), "=3Dc" (*ecx), "=3Dd"=
 (*edx)
>                     : "a" (leaf), "c" (subleaf) );

Cheers,
Alejandro

