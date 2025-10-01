Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D9DBB1076
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 17:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134894.1472421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3yb8-0003oZ-1B; Wed, 01 Oct 2025 15:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134894.1472421; Wed, 01 Oct 2025 15:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3yb7-0003mu-TK; Wed, 01 Oct 2025 15:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1134894;
 Wed, 01 Oct 2025 15:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zY0S=4K=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v3yb5-0003ml-Rb
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 15:18:28 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df8eb1c3-9ed9-11f0-9d14-b5c5bf9af7f9;
 Wed, 01 Oct 2025 17:18:25 +0200 (CEST)
Received: from SJ0PR05CA0149.namprd05.prod.outlook.com (2603:10b6:a03:33d::34)
 by PH7PR12MB6695.namprd12.prod.outlook.com (2603:10b6:510:1b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 15:18:20 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::1c) by SJ0PR05CA0149.outlook.office365.com
 (2603:10b6:a03:33d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 15:18:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 15:18:20 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 08:18:16 -0700
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
X-Inumbo-ID: df8eb1c3-9ed9-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2aXQ1rtt/8cibIDoATaZqxd7/c29+PbHuHjOHPcfAiyRrQPWTbjoyHDO/EcwMqGyDYtP4/KS5mf5++FfqFlzKF0oCncqXOp7gYUXIFw1JD5M7XxMK7NK3GpJu11aPReHzbMKgix2xL3JFlN0ckZeiVNSEt8XtXD4k2NWyrXGwQO+ozK6Qa5+w1IddYbGZlMi0GIX5h3L/Q+gIWmDGMsLgf1q/fHuAP/UUP2HLrUU8DjfGOBzy2osQxRaZSiWdu0xtvTYtNxTeVJN9owVkBmp5Eap5aWFMfBgbZhP1nW5HBhaU33UtUkPXOWc2HUhfuPwjTIP6SsH9qsB9b967gYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwUIIz4hwepGraBwD/VooBTL1DbVku9Nu4CJ8QsSV6M=;
 b=lAuDt8hrROrRXF7+iBZ9YN/18JBm5xXZH3dzdzPAXABb9JK9BMnfrZl9IhSA4SpHT3qtsaL1+mkM0mN0d4bnjSYT9EZlkGq623wH+qDZ5ZBFPknOXPVXz48JsF3UUtb45fN8pCt7vHj28YCSD4Plaba2JjFs3pCX/N0/K2TMImp4fkn39ITxS6PkWltkS0UCOKmDjMZkFmrRvHAdQRoixKR/2D+QOSnaUoIrl9nn7rIYM+96cjSSZg4iWyK+9QbGnpaKzuCbrdMU9q9NzDAT0Sgi5ohX5atQ8cKf5o8XZlyMZqwUNk5Dk1f2i7nGuKzo3wiMwmQMlByPEYHQw/fSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwUIIz4hwepGraBwD/VooBTL1DbVku9Nu4CJ8QsSV6M=;
 b=keo8D9y2tpZ/2fQ+kHBco+ANi6AzkCWDtYOYhBkQHfmtaH29mqRxNW23bW4J2pmie34zweUnxipu8jnePIG6XtjsFcUaJy7cW8UOm17E4L4sKjr7180tbWx2/A9PMUMJyeEAwLPfB4LK5mcLWoWqb95Mf/T5faC0nXAkkeybU8w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 1 Oct 2025 17:18:15 +0200
Message-ID: <DD733UWP8JVK.SSX8U5ENELIE@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
In-Reply-To: <20250930190550.1166875-1-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|PH7PR12MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d70ac1e-c25f-40c3-1de1-08de00fdc14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjhQNU14NXR5Y1dXTUhSclBJeUxRVWx6emg1M0hPVmZWbnMxUk1Va0Y3YnJC?=
 =?utf-8?B?ejBNWkdXZHVaV3hhNlFpZ2JMUWxjN29wOWtGMWk3YkZOTDZVKzRkNGhrY2kx?=
 =?utf-8?B?SjlObjBwbkdaY3JuVHY3eExla2VFQm5Ec3FSSDdmOWErd2pDWFNEbUJ5QWdW?=
 =?utf-8?B?ZDlzS2NGOVdvbjJjbFZoT21aL2pTVnlzOG5EUndYc0IrZHdQcnoxdzdzM04x?=
 =?utf-8?B?VUJWak5FbXQ4UFVrTTBEZTR0cjk4Z0VRQVM2MWtOZGdIcitVTlJ5SDhZU0tm?=
 =?utf-8?B?K3NsYmp3VWpuSFE3bHkybitBRmJmckVucTFEUzVTQSt2ZHYyZE9PL05vdEdh?=
 =?utf-8?B?R2hLZ3FSVWtOblFWcEdJSlNtV0xZbFNFMVVnY09jUDM3SzE3dFdpTkNqbmUr?=
 =?utf-8?B?UkFjalg3QVJGMXlDTThndjNhajQyV0huRDR5YWpBeUdieTg2VDJDaXN1c1hT?=
 =?utf-8?B?RmgrdHdicFIwbjJGTWtnQjltY0ltQlA1cW5wZ2hPamhyRlBXcTc1RDVvaXV2?=
 =?utf-8?B?TkVYdW9vY0t4NFNsbVA0T2tvandQVWpxWjE1azEyd1pPeE9UNUdrUis1aXdJ?=
 =?utf-8?B?RE1SR0FsdFk2aWZBK0xHN0lJTElGT2hNMUNCTU1KSmZ0NERXdzNETTRYSXRL?=
 =?utf-8?B?bGxIL0E2L0tTU0hFRDNOZElFdnFGeEtpRXJaYktkdVB6VXlmWWgrUmxVelRP?=
 =?utf-8?B?TUdwcmhvNTQ5NWR2NGlKeFNTNXVwTm1kTkFhUGVMWDRReXFrdHU1TkdaTzlG?=
 =?utf-8?B?ZHg2WS8reXpuNGNZZk5jU2lJT2RVUWQrQ0RCcjRjWjJlUlg5aGptUE04ZW5r?=
 =?utf-8?B?ekgzbUNQUXdxblIyN0FGWlplTmFGOVJZWk1WZWp2dmo0cS80UVUxU0p3M3Nw?=
 =?utf-8?B?MTV1ckM3cnBRZVRNS3NwNFBKQktQRHhIMElZR3V5YVp2VDNXVFdoZWFEbFo1?=
 =?utf-8?B?cW9CQWlYTDdUZ1huMXFiU3ZKQzNtcjRxYnd0dWxJa1lrRmRLem5TdGRrbjZN?=
 =?utf-8?B?SDcySVhwc2tUVWp1YjV3UE5Ob3FTL0tzZTNZWDJkOFg0UldoUDdMd0I4Umov?=
 =?utf-8?B?UlhOSGFKMlpmMVlUeGVmODNsREZjYXVwVE4rRVlvN1RpVlJQeGlvTGtZL2Ew?=
 =?utf-8?B?S0VacUIvOVVBZDVnNkhMOUYrcHBybHdOUURpMjY3QUZkNXRzS2FhWU9aa0ZW?=
 =?utf-8?B?ZGNUSzI5YlNza0tPZXkyc0I0cXZPUEdYV0o2c1BvMm9lUFc5MTIwN0RjNjZI?=
 =?utf-8?B?QkZ1K29CMUhBVXA3YnIzZzFqblUyYk0rTnlOWEhwSjJEdkJkb0FpMXFoa1Yy?=
 =?utf-8?B?REl0aE82YzU2WGswQ241TXpqcHZyWEpRdGhuQk9mMFdVbkRUUkVTUzlGSjdo?=
 =?utf-8?B?MVdzVURkRElIOFF2YlZ3dzRyd01MVmVmU1BBK0RuUEk4QmlzUXNPZklycjdq?=
 =?utf-8?B?bUpvdHdhNldFV3BJcmR6a1lqRzFCYjJocmltMUFpWXkxNzhFeFZtUXF1cWpR?=
 =?utf-8?B?Qmpocy9uc1F4WlZRUmtlK01Bcml1b2xZL1haZmhVSkdtd2hhekVyVjJ5WTE2?=
 =?utf-8?B?SlNFb0ZwODFxeTZwNmxTYXdsVy9vTnRNdnV2VHNyM2FzYWFLWWVOSVFGOGFy?=
 =?utf-8?B?U1g3cnp2U2VNWXJjdk12RlpHR3owQTlpdkRrZmd0WjdHWXhmcVdmODdhOVJK?=
 =?utf-8?B?L0NxRXduV2hVY0MvRExiUlhWTS9UMUhYdVAxNDF5eTcvSU5KSTlaQTRrSTla?=
 =?utf-8?B?WVlITUZ0OGFKalRzVWlGRkJQdjNGSGFPR3E1UlRwK0w0dEYrYkdGdW1KWWpU?=
 =?utf-8?B?ci9iT2dvQlFVOWdRSUNWM2lERFN0Tzh5WTJIQmFPMnIzUCtFbmNUNDd1VjlW?=
 =?utf-8?B?Yk93UzJvL0N2Sk5BMjV6UEtPYzJPd1JyMDZ5RExnUGp1ckZiS3ZOdlllUVZx?=
 =?utf-8?B?ZktJL20zdHlobW9DRUZsQ1R4NkROOXRjMllnbHNaZUJJNlVJUnltSUpyNXRK?=
 =?utf-8?B?NHkyQVFPNFhWZmJVQXhTdXJTaHFNeVFMV3Z5V2VNMnFuc0x1L2NDZkFidi9Q?=
 =?utf-8?Q?+zayw+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:18:20.1532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d70ac1e-c25f-40c3-1de1-08de00fdc14c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6695

On Tue Sep 30, 2025 at 9:05 PM CEST, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> The LAPIC LVTx registers have two RO bits:
> - all: Delivery Status (DS) bit 12
> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>
> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus=
,
> and the IRQ is:
> - or accepted at destination and appears as pending
>   (vLAPIC Interrupt Request Register (IRR))
> - or get rejected immediately.
>
> The Remote IRR Flag (RIR) behavior emulation is not implemented for
> LINT0/LINT1 in Xen for now.
>
> The current vLAPIC implementations allows guest to write to these RO bits=
.
>
> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expec=
t
> to implement "Write ignore" access type for RO bits by applying masks fro=
m
> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
> allows writing to RO fields.
>
> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits=
,
> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
>
> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
> to reserved bits should cause #GP exception), but contains no statements
> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
> now uses different masks (than vlapic_reg_write()) for checking LVTx
> registers values for "Reserved" bit settings, which include RO bits and
> do not cause #GP exception.
>
> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.=
")
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Changes in v2:
> - masks fixed in vlapic_lvt_mask[]
> - commit msg reworded
>
> v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.5=
19568-1-grygorii_strashko@epam.com/
>  xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 79697487ba90..2ecba8163f48 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -44,15 +44,17 @@
>  static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =3D
>  {
>       /* LVTT */
> -     LVT_MASK | APIC_TIMER_MODE_MASK,
> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>       /* LVTTHMR */
> -     LVT_MASK | APIC_DM_MASK,
> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>       /* LVTPC */
> -     LVT_MASK | APIC_DM_MASK,
> -     /* LVT0-1 */
> -     LINT_MASK, LINT_MASK,
> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
> +     /* LVT0 */
> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
> +     /* LVT1 */
> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>       /* LVTERR */
> -     LVT_MASK
> +     LVT_MASK & ~APIC_SEND_PENDING,
>  };

This is a bit messy. Why not have 2 masks? One for rsvdZ bits, and one
for RO?

That ought to simplify the logic in both the MSR and MMIO cases.

MMIO would do RAZ/WI on the OR of both, while the MSR interface would gate
#GP(0) on the mask for rsvd bits only and ensure all RO bits are preserved =
on
writes.

Thoughts?

Cheers,
Alejandro

