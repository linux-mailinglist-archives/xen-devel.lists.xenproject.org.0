Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A5AFD5C6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 19:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037015.1409664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCVH-0003Zo-Iw; Tue, 08 Jul 2025 17:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037015.1409664; Tue, 08 Jul 2025 17:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCVH-0003YN-FP; Tue, 08 Jul 2025 17:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1037015;
 Tue, 08 Jul 2025 17:53:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCVF-0003YF-DI
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 17:53:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2415::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69597026-5c24-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 19:53:11 +0200 (CEST)
Received: from BLAP220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::32)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 17:53:07 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:32c:cafe::72) by BLAP220CA0027.outlook.office365.com
 (2603:10b6:208:32c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 17:53:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Tue, 8 Jul 2025 17:53:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 12:53:04 -0500
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
X-Inumbo-ID: 69597026-5c24-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Do9wTAAhRvq9HFzl58S6xZZ6Anbg9m0LVRJ/VprPgOD2+Mg7xQHzKS+cjjRJ825Omspp5a+NkrrkAkBLQ5vdX54iSK+r81imBVkcuKvcdog4uD16YWTaUQCMvG70zBiflh+/E/HE8Iy9zEyXNXPJgm/5eNRkdfm3EMgU4V2Y2G9qPQzm7Mzoys57t5OcjPFfeaLeOAZvPzfXZoaDNMEqaIrsZDDYilnPvwAjFDyYrOeFqV9b1V3gWw2lJoD9z9cnm6VGS7aiRdoxFEDy18Fx2i3D6OEQKye4kvSf5sOSyvRPHzIwsjAT0F7kX3OgwxxxwQ0ML092A9g+ena9qBp7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVfrjj51kzoFCKFr0dUpXaVy/wgbKEn9Bgu7PzAwDOQ=;
 b=bIk0O3KNacL0RE5s6Tkhxt6tTaEH+HAFzGJegQ8Bl4j97EOvpS5t9MrvOsA/C+83ArXYHhBzzauCEx9/SH9Ap8ueRl3hvjGf8jhHJM6EVAtCakXKsaE9rGESX3QekOP+uDs2d3wGy2vYgMfIt0YPnlhMe/aKKq2kLEk6fzCX8SoNqujtCeI9atTbP28Ip0YkDGqRbESlA4wlk298wKBlVSpIq1lSFrr1PO6B+5f4kRB52leJgLyTKHs1Rny/a0fZ+YZEzVnrdSJaPoRu5Eml8ajkNmzl3FStpQfNaGIVnasyTmMr9h0DuF7xQpAgkw8I9fg09dbjQSjwQRKRS0taww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVfrjj51kzoFCKFr0dUpXaVy/wgbKEn9Bgu7PzAwDOQ=;
 b=NHDV0ons+hJZMpDVwWsQ9s5hrdorh4gcPZ+EVYe7isRZEc1kBiYER3z6eE+kzJSEyaskYUOXk5dF+bm9Qc5H3DlD1frGFlW0C0tsBNBrV+8eswkB7d2L09A43OSnzSs8q3zg/BuV6/tjZYHMElc9IIX8vJVOF6y6azdgWLc5yKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 8 Jul 2025 19:53:02 +0200
Message-ID: <DB6V62MVC3SM.2UN6E78FIRFMH@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>
Subject: Re: [PATCH 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
X-Mailer: aerc 0.20.1
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <20250708000712.2731666-1-stefano.stabellini@amd.com> <DB6KZPEF7I24.3TZ8FA01MF8A@amd.com> <alpine.DEB.2.22.394.2507081016420.605088@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2507081016420.605088@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: ff243a00-355c-4aa9-3c83-08ddbe484b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDVNbStNWWtLSS96eG5QVWxZeFFDaThoOWVkQXJ4clFiRkxJbng0eU9kSUhD?=
 =?utf-8?B?RlVacllJbE5paHVGQ2NiSk5lV0JROWRra0hvcFBmbTVSSTZVRXdvbU1BblFU?=
 =?utf-8?B?WWJsOExVbVRSaXpZbFZXTTNLUk1HL2dBb2FsNzY1UTdQTTZXS0RzNGpLeFVw?=
 =?utf-8?B?M3MvQmhTdHJteVB4Q1o2bVJUV1NUMTBmVnl2ckVMWk1ZRHFieEZNQ0lseHJx?=
 =?utf-8?B?KzZneXlVMEQ3QzFNNVp5VEdEVmxuMDcycDNCb1JlRkt2RTgreCtKckViNm85?=
 =?utf-8?B?R0lGSW02Skdnb1dhMWg0aVlhNDV4MVZ6VUljNm02Ri9PRXJROFZZeHBsbTl2?=
 =?utf-8?B?QlFmUGR0Q2R3Qmpub3ZrZHdTSHdCaE5PUXBsa2sxdUh6YjhvQ0FRMy8yQm80?=
 =?utf-8?B?WXd1akQrNWRvUFRqajZKRW1SM0FMM2Q2ZWJneVozU2ZuU0NjcjY2ajRXNkZ3?=
 =?utf-8?B?RkwvK3ZnbEh0emNyTFhuL2JzYUJPZkYwK1NhSXE2ditrZ3JmcGhPWk1yMW5v?=
 =?utf-8?B?QUZVejJvWnR3aVRybXhkRG5FSHVLRTJNS1BCQlV4S2JBMXNkand0clZjTHli?=
 =?utf-8?B?b0Jha1lmYzU1VG56ay9la3had3NzWDRLVGN2WXRHcHBJL0Y0YkNlY29mRXNa?=
 =?utf-8?B?TUJmd0gwU3dKS0dkWE12N1JneWFsY0JlOWdOOVpKUzZZTkJVenBOeFZVdC82?=
 =?utf-8?B?TVNzTEpYSTZEbkJyVEJFM2h3K0lENlNKUlZ3T3BzeHBJbEZpYm5wdHZkNUJr?=
 =?utf-8?B?V0JPZjkrT0xBa0dLK2Y2ek93N3RIc3pEbmtudWI1bS9IV0tDWHcwY0ZnaU5I?=
 =?utf-8?B?ZEl5NGV3Wk1YbENNT2ZWcjNRTkNQTWozclNVbWNZajh4YnFOV05yZ0JvMVdG?=
 =?utf-8?B?dWRIUTJPR2pueEJZYWlNeEtyTFFnM3pnbUZaYlJQa2NYNEdiSk4xTmlYbjIz?=
 =?utf-8?B?bkxNaWtFZEkrVG5wSlpMeU1pSFJjUXluS2NVNi9lRG1yNzRFbkhoR3NObksv?=
 =?utf-8?B?VE5rSW9KM01ZQTVxZjJIRmVlT3B0eFVqZTQvdEVnNlZyeTRiZDI2VmFaTFV3?=
 =?utf-8?B?WlFMeU1DanpXUnVYemY2dW96MUdrTko5UkF2VnBQWGZ6RWRqRk16RFFicUZT?=
 =?utf-8?B?WS92Vy9rZmdHWnJsbXY3TWhlMmxuUUtPK2tKVXhHaTl5dU9sSWhKZ2ZKUnVX?=
 =?utf-8?B?Q3RLeXdra0VnSVNFTVhYRkwzZXJpT0U4TGNnK1lDbERtcGJZb0NWOXFEY3Zx?=
 =?utf-8?B?Rm5QakhjdE5hZmE1dHpDbkEvRFcwbHRlN0NlVmQwVXQwRHFvNjM2d0U3YkVP?=
 =?utf-8?B?b21NNi9iS3lVWk9NY1E3RWtWa2RteUdTdEFXUDd6ek96M1k5T2ZnVWNCb24r?=
 =?utf-8?B?K1lRR0ZTSEJTSTJIVmVycWNoNXlOc3ZMSjBPRktBRDJzMHpPbkZMSUt6dzhJ?=
 =?utf-8?B?b3E5WEJVZlg4WjBCRDJ3UlpxSmgvMmRGTkIzWnZ6ZFdHUlNYNFdLekRxK0Jz?=
 =?utf-8?B?YWl5ZjJINHZQRWdwVG45WE9BMlVYNGtoZ05LTnQ5RmRLNDZOc3ZqeDM2K0sw?=
 =?utf-8?B?ZFY2bmRxbC9SYy84eElEWGZPWGpoWmtYRjJ1WG96dU8xUXk0Q0o3aXJjUng3?=
 =?utf-8?B?WHB6UlJPWWpUMmxhN2txWGp2ZStiT2lIdTR4NjgvQ1p2bTlGSExESHBLVDg4?=
 =?utf-8?B?SjJrVXcyODZmSGkxUHZxRDIyZlhVWVNlL3dOYitVTXptamxYaG9QT2FiOThN?=
 =?utf-8?B?Q0hUNEREa3orY2VVQzVFSklLUDQvbTc1UlNGa25PM3N4My93L2IrbitpVXov?=
 =?utf-8?B?UTd5WWJ0b2FVY1RZaU8vVCtjMG5HQVFzYS9GM3MrN2Y5Y2Z4aVRiMVNBdG00?=
 =?utf-8?B?RGJIQXdUTXZTSmtOWXI3Mm84Z0dJSDFWZ1ppYWppNmN3VzZSY0s0OTRCRWZ5?=
 =?utf-8?B?aDU0WXBDMFRVSG1lOW8rU2o3Z3dwbmhGMFZka0llbFh2Yysyc2VqVlhGNVo2?=
 =?utf-8?B?YVdtcE5sQTFrY1h3Z2lqRnRBckZyYlRxeTVpdFVMNUp1a1dqbjFnc2VjTFRC?=
 =?utf-8?Q?UAwXNN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:53:07.0716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff243a00-355c-4aa9-3c83-08ddbe484b90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084

On Tue Jul 8, 2025 at 7:40 PM CEST, Stefano Stabellini wrote:
> On Tue, 8 Jul 2025, Alejandro Vallejo wrote:
>> On Tue Jul 8, 2025 at 2:07 AM CEST, Stefano Stabellini wrote:
>> > On real time configuration with the null scheduler, we shouldn't
>> > interrupt the guest execution unless strictly necessary: the guest cou=
ld
>> > be a real time guest (e.g. FreeRTOS) and interrupting its execution
>> > could lead to a missed deadline.
>> >
>> > The principal source of interruptions is IPIs. Remove the unnecessary
>> > IPI on all physical CPUs to sync the TSC when the TSC is known to be
>> > reliable.
>> >
>> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> > ---
>> >  xen/arch/x86/time.c | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
>> > index 59129f419d..bfd022174a 100644
>> > --- a/xen/arch/x86/time.c
>> > +++ b/xen/arch/x86/time.c
>> > @@ -2303,6 +2303,10 @@ static void cf_check time_calibration(void *unu=
sed)
>> >          local_irq_enable();
>> >      }
>> > =20
>> > +    if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
>> > +         boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
>> > +        return;
>> > +
>>=20
>> This should check "(tsc_flags & TSC_RELIABLE_SOCKET)" as well. The TSCs =
might
>> still be unsynchronized across sockets.
>>
>> I'm still quite confused as to how Xen (mis)handles time, but wouldn't t=
his need
>> to go inside the branch above? If the clocksource is not the TSC as well=
 the TSC
>> can still drift with respect to the actual clocksource (PIT, HPET or ACP=
I timer).
>
> I can move it inside the previous if
>
>
>> If so, we could probably do an early return in the branch above ignoring=
 the
>> conditions (they are required for picking the TSC clocksource already, i=
ncluding
>> synchronization across sockets).
>>=20
>> Another matter is whether we could drop the "master_stime" write. Would =
we
>> care about it at all?
>
> I'll drop it.
>
> Is this what you had in mind?
>
>
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 59129f419d..d72e640f72 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2297,11 +2297,7 @@ static void cf_check time_calibration(void *unused=
)
>      };
> =20
>      if ( clocksource_is_tsc() )
> -    {
> -        local_irq_disable();
> -        r.master_stime =3D read_platform_stime(&r.master_tsc_stamp);
> -        local_irq_enable();
> -    }
> +        return;
> =20
>      cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
> =20

Yes, I think that would do.

Cheers,
Alejandro

