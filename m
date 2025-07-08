Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EC3AFC795
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 11:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036321.1408576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ52E-000382-Bp; Tue, 08 Jul 2025 09:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036321.1408576; Tue, 08 Jul 2025 09:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ52E-00035V-8d; Tue, 08 Jul 2025 09:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1036321;
 Tue, 08 Jul 2025 09:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZ52D-00035P-Ab
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 09:54:45 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2409::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9078a4d5-5be1-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 11:54:40 +0200 (CEST)
Received: from LV3P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::10)
 by LV8PR12MB9109.namprd12.prod.outlook.com (2603:10b6:408:18a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 09:54:35 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::34) by LV3P220CA0030.outlook.office365.com
 (2603:10b6:408:234::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 09:54:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 09:54:35 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 04:54:32 -0500
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
X-Inumbo-ID: 9078a4d5-5be1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xETmoImyzk3dXttP51/7GiKjkAJzIsmECRv3xsC8IEJmqmTlB7u30mBjn1gfj0Pu5qB/JxuOrtBnJ5sqjd8rf3ZS56LrDc5dGiq7pkLwerEHROSy3Hyy4aAP+t0SNWLC+YyfJTDP8KudMmbiHYdzP7ZYWJ8U8/nj/d/2syiRcI/vI2a8NMkkX2Brqe4AoaxxsE3OwtFbFgFWKItBclfc3w5RPVTOKNEMwAIQvgYmJjhMSOFkSSQkVzjn5XFL3xea2VrQyQrafJ0g+NHNknfXCLFVapWSfkPlPUrv4rhjSI8VDjCZ7e5dXNOhC5PBOhVo+YduIe5PmfxpPeRedVUmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnkr2XUcJy0cU69vf0NDpq+bxw60h+0QWEzvKe0tSlQ=;
 b=cAskq2VG8g4ragqiuMMVlE6DbA0SP9PoKFxlgTs8gV1Q3bV6oUv4YbJDB3nwfB4lYPRoXzOWgRqFJDqFE4i/2PgdiMLviZ2FUKCh70SK3UiUUiPdXvmSlmqsvW052rRHZLobB2e3B5IAambKkdlPHmbOKWKD9/veLw69H8t3G6Rj/hNZYWNQtMBwLne28mbwoYl9MHiNMmwO8/wFh1jKsXWGFgRHBQNoZ0abc+5SuxkBN/9n3mA5bfoKerdeb1gUETJoYa6/EqbfspZ5WG5GocXgipvLUxFEgBuACbOr4UawAryY77Fmwuq7leOq8VDiISooJxiWxLoG6cis9lI7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nnkr2XUcJy0cU69vf0NDpq+bxw60h+0QWEzvKe0tSlQ=;
 b=SVvS4BSwDKmrBZYsbwjLtB8Byg9G369ToKaO9t7Dl8RFMr5OTM9BBwsaQ+n4PMJmVpVGdUV6yXYp923HT6WOzbDagWqa8eI+Sr2YdTrHgrSrGmPXjJecTX+84qFO87ByCXQn8EGIXGDQfkL48QVLUCeTFGvzUkFeTol+dRnKRvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 8 Jul 2025 11:54:32 +0200
Message-ID: <DB6KZPEF7I24.3TZ8FA01MF8A@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>
Subject: Re: [PATCH 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <20250708000712.2731666-1-stefano.stabellini@amd.com>
In-Reply-To: <20250708000712.2731666-1-stefano.stabellini@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|LV8PR12MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de288bf-5f4c-4e1f-198d-08ddbe0571f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEJ1TjRNQTBrczNzeVJLMElSeDhvTEc5M3JRSEpKWGdpazZqN1IxZ1dqTS9V?=
 =?utf-8?B?bXRncSt2YUJ2TDNBcnpHREQyZ2RZYWw0S2dCaEJnQXlDZ29DUGZaRmQzbkEr?=
 =?utf-8?B?eEl4cmpocmdPakdoMXUwb0p4eTBMTVQ5clR1T3o3aU5EM3BJQ2hkTnhPT1ls?=
 =?utf-8?B?WU11dWc3ZTZKbXc5ZU1hQk4vODI3YjBVY25aTitWL0xLSlZHVDhRc2VFYnNE?=
 =?utf-8?B?UEN5RWFyUjVmdlRqUFlRUjF4MHFUNHM2R2VTTzhQdGd5TlNsZmZ4YWIzU0pn?=
 =?utf-8?B?UHBUNCt3TTliTlY5SkdVdFR1ZWNqRjVYWFpPdGE4UzJZUjNDeFhhKzYwZVJU?=
 =?utf-8?B?Y2RXVlFXdUU3cm5MdGhnekxkSjZjZm9NOFpFaEJIVlRpTEJJQ3dYR1JFVkRw?=
 =?utf-8?B?SkdJMGdWNFhQQTZWcndJU1MwKzB0em13SnJra1B4NlhJNEdxK3VhdkxQMWpG?=
 =?utf-8?B?MXVkdFUzMVlzbTNHWGVVUWlxRzhLaEpndUIvU2dyUDdwZlFQTW85eXBoWXVa?=
 =?utf-8?B?Y3VvZFh1UlBGTnk0Q3poMjhxMWxHVWUzQUxyVnJmcnd6MTZnbnRBYlZ1RTBr?=
 =?utf-8?B?UEtjWE0yOEFWTzJlTXVTM3Nabjd5V09OS1lzaDBMUFRUL1ZiaXpMRkl5amNF?=
 =?utf-8?B?WndyVlBnbzVXbitoWFFWM0VUN2dXZVZiUEJOL2RFdVRkeGFSbkI5WElja0Ji?=
 =?utf-8?B?TTYwWDIyRkVOR080TnlqeGVsV1FrN2toamJZai9iWWNsYWt3T3hlTTVaK09p?=
 =?utf-8?B?SllpZzJDVWZBY1R6OTdYQllFUW4rSnZad3BlTXNHQlJCMGN0WGJFUmVTRCt2?=
 =?utf-8?B?SHJiWWw0ci9qZ3NhTWY3dGQyeEdJcEJvTk5NN050ZisrVEdiUEFTYXIvQitT?=
 =?utf-8?B?RlQwZmVLMVgyV3NPRzlsdVRyandVMlZMKzE0Q0tTRklXK2NSTHdIa3prNG00?=
 =?utf-8?B?cGY2QXVLMytYcVExSU43b2g4WkhTT2EwanZHZGNKZkhVaHY3NHp2b3J3aTFP?=
 =?utf-8?B?eXB2c2orV242T0FwdXlTUklNeDhoYU5HRkFuREJyRERBSTJuUnZrTUc3eG9r?=
 =?utf-8?B?Y3Frall4ekFTenFWZjlhUzB4d3lxZHZweGZOaE5iTzQ0NGtxRjRQcHhMYkRt?=
 =?utf-8?B?aTVoOHRDVVE1QWNYSzJGbE9OSnhLZWdYSXQ0enN6MEI2d2hBcHdYTUhiajJF?=
 =?utf-8?B?N2hIdGhUTHdwSitpN1NqZmxHMFpCNm9md0kyK0lXeWRCTGdpSkVzNXVpWGZD?=
 =?utf-8?B?aXd4MlZRdDErSFRmaWF2ZTN6UzVDUU1SZ2tESktua3l6OWs0ZCs5cnVSYysv?=
 =?utf-8?B?QUhNT1JmcUtidEpXOFFCcEI2SnBXSlhXRzg1RHFJSkFETTNLYWZMVDRXL2tL?=
 =?utf-8?B?VEh1QnFyYjlSNEh3SDhGM2IyaEttN0dWU1NqSU5DRlZPYUpHZjVXSWFnNEZJ?=
 =?utf-8?B?WmZBZThCanVqN1dzVTdKcG4wQjJ5cUlKdi9PdVByNUt5c3hiRllrbnpCWlNj?=
 =?utf-8?B?NnVYZ2xyZnF5c0JRdFJDZnJvY01XZ09zQk9iVmUxR0pUakFrZ293VUZtTDZP?=
 =?utf-8?B?NmVHdzFhQUhkUXBqamRIYjlnaXNPU2lpT1hmTnFTa052YjVYNFFKLzA2QTM3?=
 =?utf-8?B?OVpYSmNQYThFNmxKejdjY0JTZ2ZMdzMrbVNXL1BPc3dJbElJeitCYzJNRlB1?=
 =?utf-8?B?b3JxcmpoendRY2traGJYbE00dWJQQ3VBSzBUMWdxbWc4YURSZ0hhNWFreFkr?=
 =?utf-8?B?clA1R01PTktveGpKUnNwd09CdDNqcXRxd1NaRng2SHZ6TWxkdnhWU05yMG11?=
 =?utf-8?B?QmczNFBoZHliSXJDbWRXRmFOclVaS2NITldSZzlrVm5DUnJqTjhsY0NMQmVa?=
 =?utf-8?B?cDZtcjRXcDBFblJVdVJNaFNTRTZkZk9qZWJ4Q1RITFF2VnltVzdEVnRCMVZy?=
 =?utf-8?B?QVlkbU1ySjhIYkpIUGU4WENObForUFZUTWdhdGZjQU0yL3BlVkZzK2tTMjhr?=
 =?utf-8?B?cGlScVBnYW9PRWRlU1F1bUJvdXBUY3Y1TjVXclIxR1VXZDBZWXgvc3RyWnpP?=
 =?utf-8?Q?sNnTzt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 09:54:35.2244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de288bf-5f4c-4e1f-198d-08ddbe0571f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9109

On Tue Jul 8, 2025 at 2:07 AM CEST, Stefano Stabellini wrote:
> On real time configuration with the null scheduler, we shouldn't
> interrupt the guest execution unless strictly necessary: the guest could
> be a real time guest (e.g. FreeRTOS) and interrupting its execution
> could lead to a missed deadline.
>
> The principal source of interruptions is IPIs. Remove the unnecessary
> IPI on all physical CPUs to sync the TSC when the TSC is known to be
> reliable.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/x86/time.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 59129f419d..bfd022174a 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2303,6 +2303,10 @@ static void cf_check time_calibration(void *unused=
)
>          local_irq_enable();
>      }
> =20
> +    if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
> +         boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
> +        return;
> +

This should check "(tsc_flags & TSC_RELIABLE_SOCKET)" as well. The TSCs mig=
ht
still be unsynchronized across sockets.

I'm still quite confused as to how Xen (mis)handles time, but wouldn't this=
 need
to go inside the branch above? If the clocksource is not the TSC as well th=
e TSC
can still drift with respect to the actual clocksource (PIT, HPET or ACPI t=
imer).

If so, we could probably do an early return in the branch above ignoring th=
e
conditions (they are required for picking the TSC clocksource already, incl=
uding
synchronization across sockets).

Another matter is whether we could drop the "master_stime" write. Would we
care about it at all?

>      cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
> =20
>      /* @wait=3D1 because we must wait for all cpus before freeing @r. */

Cheers,
Aljeandro

