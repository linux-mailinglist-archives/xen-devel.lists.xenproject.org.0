Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A9FB0D60B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 11:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052209.1420785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue9QO-0000lk-Ev; Tue, 22 Jul 2025 09:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052209.1420785; Tue, 22 Jul 2025 09:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue9QO-0000jX-C5; Tue, 22 Jul 2025 09:36:40 +0000
Received: by outflank-mailman (input) for mailman id 1052209;
 Tue, 22 Jul 2025 09:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue9QM-0000jR-9C
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 09:36:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:2417::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b8e4ce1-66df-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 11:36:35 +0200 (CEST)
Received: from BL1PR13CA0008.namprd13.prod.outlook.com (2603:10b6:208:256::13)
 by LV8PR12MB9665.namprd12.prod.outlook.com (2603:10b6:408:297::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 09:36:30 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::51) by BL1PR13CA0008.outlook.office365.com
 (2603:10b6:208:256::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 09:36:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 09:36:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 04:36:23 -0500
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
X-Inumbo-ID: 5b8e4ce1-66df-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNaJGLW97lFaKGEt1QDZswXmpg/hHx2a11BYGSLbaoxWgGvJF1eZfjnTqmdNtyqoKKVUJiqXUHU4IzFh2cJxGY/eNAxip7W48Sy3n6x7zTNU0NVpFnNUACVRxoYLUPXOgjq1G0d2A+LL/7OQQsno/h1T528ocK8lPhsaJsqvVRwS4WeYaDFWxQwdD+xtLebP4WH0p8KN3mPuihCoeY1ZTtRJhgP4JOaOaFGuBbpTkrDwIJNp/ZVawb5rPjx09oXA8TDYAmqg8iefEQjxkZEUYYrchvYkEkcu16y5bGzRBOIaIS6prUK3qtzw0CE4HbbfrnNjyZFIxGeXMu9eMkHVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DowMRegUDJ8kVLay1mGSZIGQvrDh9n7ETmsjodVp+QY=;
 b=VK0ej+dlrmjCLhbPyawI8NrOAjZOVNxJDxAzGL34w5j2DeazdESd4POBeb6CV/W2+zHkhLIlPPzAqJfw4PsEoHX8NjU3cuGS2qw2MvxH1BNunWNGiRqKeXl+fd0uQlJz5Mzz2Ll1m91gLVtOPXEGVPMZQALJk1pn26NiENfD0xmjepm/1F1ydIG0xfzhmATfIZThck+77CpqzoEPYydDBv+ZQePRQoc6konFGdc9CF3C7g23dsZvS46a8v/QJeLGGAQBVFBocYf9JkD16lhBJP0L9XbqqqMrd4jU692EFPl2X1TMGpU53JYmskH01n26pCl6YygjntrQxM7Ks3I5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DowMRegUDJ8kVLay1mGSZIGQvrDh9n7ETmsjodVp+QY=;
 b=B08k0wx9aT5yVsFu8KoYy6CqX2oTINj1sSkknnfAJH/dNTuyjvp5dvtnUOFfL8bIcTDaJK2Ok7KRpJZmSIZV4e51xtVqGOzVwctb9sDJEmFS4Bu65vheH5IqZ6Oa6OYz9zBvsSaXwMK4RiTRg9zzUsCqU0NktdegQbHuDX5VREY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Jul 2025 11:36:22 +0200
Message-ID: <DBIHDF1PW46T.3RKYK1M3O7T0L@amd.com>
Subject: Re: [PATCH v8 00/11] Allow x86 to unflatten DTs
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Alistair Francis <alistair.francis@wdc.com>,
	"Bob Eshleman" <bobbyeshleman@gmail.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
 <f179fb97-e6f8-4329-8d92-87f31b9b42d5@suse.com>
In-Reply-To: <f179fb97-e6f8-4329-8d92-87f31b9b42d5@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|LV8PR12MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a07eb2-f796-482c-82da-08ddc9033c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVI4N3JEdDh1YkNoRnAzOEpqTXpTRFVMNmZ0NSsvU2xoYWg4aXlYME1BS1JZ?=
 =?utf-8?B?S1FWZTJvK0l0d3FpY1A5OFBLOUh2NmVpOTlIK2dsZ3pFL3V0dU5MS2s4Wlgw?=
 =?utf-8?B?NkhjcGFNUzIvYWRXUGs5dUpEaGUzZkozL3h3blVORlRsYnlyZlVlVnBxQWIr?=
 =?utf-8?B?cXBBcytTU1N3NmloVUZoSit3TmJweFF0Z3hnNktTd3ZmdXEvNlk2YjZuNnNQ?=
 =?utf-8?B?Q3piZzd4SEdKZ0RXYkJYMU90MHRlUlo5MmNrbTRIUFQyc0NEaGs4cGNSUHho?=
 =?utf-8?B?ZkFOaGx3UjFyTzlIaVZiU2ZtdFJ5V0Z1M2xIb1RXTGhVb09RWlZ2bndMWVRB?=
 =?utf-8?B?Y2p3VVY3OHJTWng1TGU4bXZ1WWVuUlhlM1htWDkwWklaRHliRGM0dkVqN0VP?=
 =?utf-8?B?SzdiaWFmWmNCVlgrTS81K2wxeXdRN1NsSGt6QlRCQ3NxTlRuS1hyeUFabllt?=
 =?utf-8?B?K2kwYm1oZE9xN1lTUkF3YWV1R09kbTVUcUk1elhGcWVyZldaWWI0WEtvT3la?=
 =?utf-8?B?S00xTE45dzc4NWhpamhmZEY0K1lhaEJKN1dzSW40alI3REUyQ09tQkM3cVdU?=
 =?utf-8?B?YkVjVWxYWVV1YmhUL3dXdjBwbGwvbCtTRGhmZHZqUW5CTkNVbnIvd25xelZD?=
 =?utf-8?B?d25vbU5GZFY4RFBmb016SGNOeUdESnR3bUxxVCtReFBMb0ZDVkJ2dlZnZzVv?=
 =?utf-8?B?TEdIYWQ3aFc3a2dQdWFJSm90c3ZlaG1rNzZPKzVRRTh3WGh5Zm5FL2pkbDRk?=
 =?utf-8?B?RDRjVW0yZEtZTFlNYlZMK0pESml3TnZFT00rN21Ga28yN3JjYkJ0S1o1M2lo?=
 =?utf-8?B?RU50dGJjeXBxbTJYakJSVmF3cDdFQm9WQ2M4Nm1uT3hld3RwZkdVU2tvMU02?=
 =?utf-8?B?Z0I1NEd6cTF2cDVKWkVTV05lNDdBTkNEbDd1dFZBOGZ4a1JTVE5SQmJrSE0v?=
 =?utf-8?B?b0ptaVpTalZaeHIvR08zYmsvUmlhd3prWC9OV3lobWZCNCsvQ2JNcVNtVmRB?=
 =?utf-8?B?NWxINmRWYzBoZ0JHVEtTVkRJWVNjcDMyN2xsRzdkRWZ3Y1hmeG9tWU0xZHNK?=
 =?utf-8?B?SVZTYVdCNUZZK0lYOTVob3FnTFNWY2JETlFXZy90OHJCbzFuYVVta1NGOGk1?=
 =?utf-8?B?MTNnUFhiSXM2eXJ4VXMzVHhkS0RSWmZVSXhjNnpseFJwdG9Gb25nNEd0NHNF?=
 =?utf-8?B?MG41SWhsUTBDcXh6R2RMbFRYTGNtQ2k4SEZpdWpoTWVBZWc0ZnpoMUN4ZDIw?=
 =?utf-8?B?amJabllzNDFTSzNGWHpiaTljWXV5bUJFQm10ZFpxd2RkV3hIZ3F2SFVYWGNB?=
 =?utf-8?B?RTJvWWhvdXM1cURUS0RRbUU0QjhiQmVxMHYybUZwRHZiQnpud3FvZHg5UlNu?=
 =?utf-8?B?ZHF1bE5NZ1kxaHUrWlNsM2RsTzZQTGRiN0kxS1VUUE9YYmtqZnNNN3ZyQVgy?=
 =?utf-8?B?MkF2eFdWVFAxWjFtNW5BR3V3dVRZTkM2Qm4yK05EYS9sZk5VWHJBLy9WZGww?=
 =?utf-8?B?eUQ4Um8rZlZ1VEJUYnJRWVN4aHMxSEx6UXYrN2FMamFSOXlKSVFSQ1FzSGdO?=
 =?utf-8?B?Z1BJSXZWL2prWG02b0dqZE11R2RIcDJkenhqZ2Q4ZFhkNHVkZGQvYmR4UjU0?=
 =?utf-8?B?TWwvUmUvbS94dGZvOUY3Z1hubmZrbGRDNmVjTWxGZlhDbXNjRjdPRXlHRXpP?=
 =?utf-8?B?T0xYVlp4NVdibWlGOWFaUlZSajJVa2QyNGFSZHE2cVRUb2RVeUo1ZDhvdlNJ?=
 =?utf-8?B?V1o4WGNMdTZ1bEEyUC9sdXJZM0UxREpPeFZKc21yaEpDdG1qS3NEWkVTUExz?=
 =?utf-8?B?Q1JBdkg1YmxDd0NoaDltQkVzbENMNzVJRFBZY2tuS20yZlVPdUpWSW9pL1hn?=
 =?utf-8?B?c1JvbWJNcDVoSUFyMTUxMS9QTVo3UHpEUzZac2xwOGhBZUVZbTkwdjkxbStn?=
 =?utf-8?B?V1FaVW54eGZtaThCejRORWcyYStyMGQ2VHpXZ1JjVm1ZTXpTZnNWcFJXMFZ6?=
 =?utf-8?B?NEYzTDNnK293MGo4MDhSMlpjaysxT25kR0FQOUpBZWQycGdvdFhtb2Y1RnVi?=
 =?utf-8?B?ME9WbXV0OUVSVjI3VWNYTFk4SlQrMkk5anRJdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 09:36:29.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a07eb2-f796-482c-82da-08ddc9033c9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9665

On Tue Jul 22, 2025 at 9:00 AM CEST, Jan Beulich wrote:
> On 22.07.2025 02:05, Alejandro Vallejo wrote:
>> Hi,
>>=20
>> Really minor changes wrt v7
>>=20
>>   1. s/BOOTMOD_XSM/BOOTMOD_XSM_POLICY/
>>   2. Remove stale obj-y statements in the last patch
>>=20

This pipeline turned green on the build each commit job, so...

>> pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipeline=
s/1940366600
>>=20
>> v7: https://lore.kernel.org/xen-devel/20250715161108.141126-1-alejandro.=
garciavallejo@amd.com>
>> v6: https://lore.kernel.org/xen-devel/20250708180721.2338036-1-alejandro=
.garciavallejo@amd.com/
>> v5: https://lore.kernel.org/xen-devel/20250701105706.86133-1-agarciav@am=
d.com/
>> v4: https://lore.kernel.org/xen-devel/20250620182859.23378-1-agarciav@am=
d.com/
>> v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@a=
md.com/
>> v3: https://lore.kernel.org/xen-devel/20250613151612.754222-1-agarciav@a=
md.com/
>> v2: https://lore.kernel.org/xen-devel/20250605194810.2782031-1-agarciav@=
amd.com/
>> v1: https://lore.kernel.org/xen-devel/20250530120242.39398-1-agarciav@am=
d.com/
>>=20
>>=20
>> Alejandro Vallejo (11):
>>   x86: Replace arch-specific boot_module with common one
>>   xen: Refactor kernel_info to have a header like boot_domain
>>   x86: Replace arch-specific boot_domain with the common one
>>   xen/dt: Move bootfdt functions to xen/bootfdt.h
>>   xen/dt: Move bootinfo functions to a new bootinfo.h
>>   xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
>>   xen/dt: Extract bootinfo-independent functions to bootfdt.c
>>   xen/dt: Extract helper to map nodes to module kinds
>>   xen: Split HAS_DEVICE_TREE in two
>>   xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
>>   xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to include device-tree/
>
> Pretty clearly, as per the build-each-commit job in CI, there must have b=
een an
> issue in the middle of the series:

... I'm not sure what happened. Let me try to repro locally.

>
> In file included from ./arch/x86/include/asm/bootinfo.h:15,
>                  from arch/x86/cpu/microcode/core.c:37:
> ./arch/x86/include/asm/boot-domain.h:13:8: error: redefinition of 'struct=
 boot_domain'
>    13 | struct boot_domain {
>       |        ^~~~~~~~~~~
> In file included from ./arch/x86/include/asm/bootinfo.h:11:
> ./include/xen/bootfdt.h:103:8: note: originally defined here
>   103 | struct boot_domain {
>       |        ^~~~~~~~~~~
>
> and similarly
>
> In file included from ./arch/x86/include/asm/bootinfo.h:15,
>                  from arch/x86/pv/dom0_build.c:17:
> ./arch/x86/include/asm/boot-domain.h:13:8: error: redefinition of 'struct=
 boot_domain'
>    13 | struct boot_domain {
>       |        ^~~~~~~~~~~
> In file included from ./arch/x86/include/asm/bootinfo.h:11:
> ./include/xen/bootfdt.h:103:8: note: originally defined here
>   103 | struct boot_domain {
>       |        ^~~~~~~~~~~
>
> Jan

Cheers,
Alejandro

