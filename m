Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A7FC4DBA8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 13:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159022.1487399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vInXD-000746-Gf; Tue, 11 Nov 2025 12:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159022.1487399; Tue, 11 Nov 2025 12:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vInXD-00072G-Av; Tue, 11 Nov 2025 12:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1159022;
 Tue, 11 Nov 2025 12:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1Vt=5T=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vInXB-000725-83
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 12:31:41 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa63ee4-befa-11f0-980a-7dc792cee155;
 Tue, 11 Nov 2025 13:31:33 +0100 (CET)
Received: from SA1P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::12)
 by BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 12:31:26 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:22c:cafe::63) by SA1P222CA0010.outlook.office365.com
 (2603:10b6:806:22c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 12:31:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 12:31:24 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 04:31:12 -0800
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
X-Inumbo-ID: 5aa63ee4-befa-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR41mtm9eJz7qaK2QQIsmc3qpzt5ybMRH8lq+YeVxd0Pk3u4327/z/5AAl5XKbj++/PJt8WEvlSDxszoDrekEqitFu3KmmQpz+HFhCIkrDOSkfVaw7aDD6kFNqsREf8ie1mh0ufH/Qs2Ro4V+MRuyvHJ4EeSfNM9R3EDV60L7+qVMHfXGTX/7WMxiVs4n3k16HtgQaewWzRjVNC+RdDGU2iO/DcoATAQPIqPQ2vQ/II0DjNsB2OrsdPoGVQY0bkrc1QafRxmKms4cBpJSv/E/jBhsWL1gj1wDAfhohpgaNaCmeG9B+UdV7Jiconrx/v/Y5G8dPTwl3z6XvctT59nGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JixLRuDbhpo601JIIBwobSidqDWDYIIxUEqG5Wma9Y=;
 b=qXydFMibpHzIDbG2tvlej9lpeO19RrWcQANMdiDnHIx11hDAO5JmTHRQfOo6x9x7jSJqZfS6OAUllgjWF3YSWQHtvaYYnM9D7YjCDqO8lJV4/KMNpj+ZO/voD9J9dwP1KkHNeCQMnxVbGp11KKR6O6TA7EIziFpezQG8G37bkPkJf7y6N7iyUxv5HL3kCeFACW9qeJmZO0k9+AN1p+1TvjN+1lS7lOfFU0clverkuVU9bwBSQZDtWwbE9XmXqITn0MIQ+uUNuebnB+BSVTcNI4/ZEP6te/VLESipbvHsQff72QsgnJIre9LTaiGkwMPuG3MlOfRqDqT49/u2fbGQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JixLRuDbhpo601JIIBwobSidqDWDYIIxUEqG5Wma9Y=;
 b=ZV9Qwb4K63KKNpGfBw+MqRAlcYKxdROWaowIoYOAWKhgi2dgfPnoPWulJWY/pf2yKNwD6ypx08x0Vo0p19nOFBAgLuAUreWXdPbGUxes8hSEUUE/87oBjUSpHVt8zGPRywkhbkRBjU+d3agc3KpSEDjP8r/jtRi1Cf0ZUC7C1y0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 Nov 2025 13:31:11 +0100
Message-ID: <DE5V8ACYEX88.9BO1WIVYJ3U1@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
In-Reply-To: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|BL1PR12MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: bad8da4d-b0d8-4b84-e265-08de211e3a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZitaR2JSU2Q2UkJWeEZnV21mRTNrU0dTYzdoU04rbktTTWFyaWliM0F5aEN0?=
 =?utf-8?B?RUlQNENkK0NZaWRuOGZIMTB0Zi9iWWVMSU9NK0lwTXVQbXVraW54cSsxQlB1?=
 =?utf-8?B?dEpQTmFHdTRwWXhuZGhrRnFSV0cyZDhDS3prRU1YYUVQM0pMWHpyTFozNjg4?=
 =?utf-8?B?S2M2ZHJpY3k2bC9pQVJsakdSS3JxaUNtamRsOXlFRHFrWGRsdkhGRXp4VmJy?=
 =?utf-8?B?aVQwQnVvZ0gvSHJZdFFnWC8zcUg1SnRuOGZ6bGZSOTFyK3hMR2lKbUE2Z1kx?=
 =?utf-8?B?UlJiVHpTOExvZ2pGaHovYWtkeGI0S3M1U0FlcndqL0RabVUrT0lTVEtHaFRy?=
 =?utf-8?B?YUFUUWlUMG5jZjlvcUVQZHlvNysrWFlMQnVNUTVuaGtCYmRMV3ZhbDFBTEdq?=
 =?utf-8?B?WGRYdERVRTRSSyttRVpEelgyV0owc0ZJSlA1STVJUUpPa0ZxQkd5SXNYdnRl?=
 =?utf-8?B?c3ZtRHk3eW5CbktLR2NYNU14Mzh4TFF6cmwybEpZWDJiM2pWRVNzMzRZd1l6?=
 =?utf-8?B?NGs4Wm1qOUhJWDlzWW9OSEhqZ1J5a2QrcVhLNTBidzllSXUvVWNlUVBmT0Jh?=
 =?utf-8?B?dVpVd2I1RTJ6TUFzK1QxZGRaZVBEVDNtSkRjeUJaL0N3VWVROG02K3c3V2NO?=
 =?utf-8?B?QkowOFZSdWt1STc3T3RBaUF4SXFYUnAvZ1hzVC8zNTdjOTdmOWxBSHlzUmUy?=
 =?utf-8?B?T1prc0JpQ25tSlFCeDR0d252UkJrVkpmekNrbEJvWGM3TEhOMDNUeHVNZS81?=
 =?utf-8?B?WEptMjJlKy9TWm9GYjk1cGU5dHBiVVRsQlZFcFpOT25rU08vOGxSWk5ISE9S?=
 =?utf-8?B?SURnOFRHTWNJNjJ4bWozaTNNL3pCRlBaY3k2cGRGL3BrWDk0bVhlNTVPT3Bv?=
 =?utf-8?B?OUdObzA2NUxlQ3BaaGFXVEFPaUJhNWdXTGNEMEowcG5CbW1VdGtvcVZsUUVt?=
 =?utf-8?B?QVdXUjdyKyszUHhqYmtCd3ArWHRSUzZkNENZSEl5aGVvNUxtRzNJb3phYk8y?=
 =?utf-8?B?WVJ3K3pGUmJSS1NGOTF5WXZybTI0aFlabDNkbm5qNUIxVjJGemR1alFOYW8y?=
 =?utf-8?B?Sk1pN3NkOCtyQ1Y1YlYvSnZXT05pL3dxclQwcUh3aHk3UEY1NVIrdTZxTW9x?=
 =?utf-8?B?YWsvMk5oNDFmNUpGdEhXeWJhT2ZTMGZ2L1BSc0dMWTEzN2NKU25FS3hmUXZz?=
 =?utf-8?B?OHM0KzJhVG9hNU0vVmRNdGhoUWlBTXhhZVdoUW1neDc2K05RWnRFTjh5NWFi?=
 =?utf-8?B?dHk0c3ROREtrdk9Fc0tvUXZ5ajFNY29MWExFeVJOWjlBRTl6eWhyTDd5eE40?=
 =?utf-8?B?RzVIenJhMnl5K2NDL3dsQlhQanVxMUFhTHBFMnRCdGtFbVQwdi9WOTUyYmZx?=
 =?utf-8?B?bUlHUlFTVFpobk12dFlURzNic3d5Q2NKeXppZjlsMG9tZHo1dkdMTW5iVFFY?=
 =?utf-8?B?UmtaOU44cmNIMngxVklnbFhnUHZMSHV6KzVtWGZiWEpWMGtMTW9MNzFrNjYx?=
 =?utf-8?B?LzY3eVFibitva0tSelp1ckM2YlBueUYvNG91ZEduN2R4VnpvTmN0M0Zlb2pT?=
 =?utf-8?B?anhqem1RYUpDaTdNcGtvNXdyNE5MZE1RbHlSTnNKNG1vdWJmczRnNXN2cENv?=
 =?utf-8?B?aUFIcjdXMmZmQ2FvQWlYMjlTYlo2K3JEM1Q4a2xtSVlqWEw3dForV1U3RWg0?=
 =?utf-8?B?aGRtdStSaGsrcUF5Tk1iRkFKNFBxa1A1QUp0QmJjeGxxNVZOeFRRM0JqSkY1?=
 =?utf-8?B?UU5PWHQzOHc4aEcrdzBtcllMUVpEWDZMK0dFc3VkeU9oYVJmWnY2Q1dLcStt?=
 =?utf-8?B?eEFuYTBHZ0NTK1puSlpjRFlyWVVmbUxXdUFiNWpKQ05YK3NWQUUrOU55eFJH?=
 =?utf-8?B?eFhxY1lLWWoySWg0Smd0VEZoNlh5N3NOVUhYK1BQMmlualZ5dVl1V0tNNzJM?=
 =?utf-8?B?VjllZGFjVE90UVRMUHhNTm10L3cxS1IrLzdGWTQxNHpGTlUrbEE4VEtHaEU0?=
 =?utf-8?B?dlYxR2N2SjZROVRSanRoWm82U3RKRjlXb3U2MGR6MnIxWkRQSnJ3bG9yYkZw?=
 =?utf-8?B?VWNvcGtWamRjTUhodm1URjFTT1BqbmpqeEdHNjhzSi9kTmxOTGpjb2pMb2Yx?=
 =?utf-8?Q?mPCI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 12:31:24.6327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad8da4d-b0d8-4b84-e265-08de211e3a79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753

Hi,

On Wed Oct 29, 2025 at 7:26 PM CET, Teddy Astie wrote:
> Introduce a new flag to force the x2APIC enabled and preventing a
> guest from switching back LAPIC to xAPIC mode.

I don't think you can really do this on AMD without advertising it somehow.

And there's no architectural way to do so.

>
> The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
> architectural MSR of Intel specification.

Yes, I can see this being usable and a good idea on Intel hardware.

>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> This feature can be useful for various reasons, starting with SEV as
> it is complicated (especially with SEV-ES) to handle MMIO, and legacy
> xAPIC is one thing that needs MMIO intercepts (and Linux uses it during
> boot unless x2APIC is initially enabled, even if it switches to
> x2apic afterward). It could also be interesting to reduce the attack
> surface of the hypervisor (by only exposing x2apic to the guest).

On AMD (again, AFAIK) you do have to implement xAPIC support to provide a t=
rue
AMD-like system. Anything else would be a Xen-specific extension.

The intended way to go around trap-and-emulate for xAPIC access is to bite =
the
bullet and implement accelerated AVIC. That has explicit provisions to enab=
le
SEV operation and would have the neat benefit of elliding certain VMEXITs (=
i.e:
EOI). It'd also simplify MSI delivery on non-oversubscribed CPUs.

I assume you already looked at it and concluded it was more work than you c=
ould
afford, but thought I'd bring it up anyway.

>
> As it can allow to have MMIO-less guest (using PVH), perhaps it can
> be enough for avoiding the problematic cases of virtualized INVLPGB
> (when we have it).
>
> In my testing, Linux, FreeBSD and PV-shim works fine with it; OVMF
> freezes for some reason, NetBSD doesn't support it (no x2apic support
> as Xen guest). HVM BIOS gets stuck at SeaBIOS as it expects booting
> with xAPIC.
>
> On Intel platforms, it would be better to expose the
> IA32_XAPIC_DISABLE_STATUS architectural MSR to advertise this to
> guest, but it's non-trivial as it needs to be properly exposed
> through IA32_ARCH_CAPABILITIES which is currently passed-through.

ARCH_CAPS is part of the CPU policy. You can have toolstack set the bit and
have Xen take the hint. Then it'd also be sent on the migrate stream.

Granted, that wouldn't help you on AMD hardware, but it'd be perfectly
spec-compliant on Intel. A different take might be to have a Xen-specific b=
it
in the hypervisor leaves, mirroring the arch_caps bit.

I think SeaBIOS, OVMF and NetBSD failing to boot gives you a hint that, whi=
le
this might be a good idea for some cases, you do need xAPIC for a general
purpose VM. IMO, at least.

>
>  docs/man/xl.cfg.5.pod.in              |  7 +++++++
>  tools/libs/light/libxl_types.idl      |  1 +
>  tools/libs/light/libxl_x86.c          |  4 ++++
>  tools/xl/xl_parse.c                   |  1 +
>  xen/arch/x86/domain.c                 |  2 +-
>  xen/arch/x86/hvm/hvm.c                |  2 ++
>  xen/arch/x86/hvm/vlapic.c             | 23 ++++++++++++++++++++++-
>  xen/arch/x86/include/asm/domain.h     |  2 ++
>  xen/arch/x86/include/asm/hvm/domain.h |  3 +++
>  xen/include/public/arch-x86/xen.h     | 12 +++++++++++-
>  10 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index ad1553c5e9..01b41d93c0 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3198,6 +3198,13 @@ option.
> =20
>  If using this option is necessary to fix an issue, please report a bug.
> =20
> +=3Ditem B<force_x2apic=3DBOOLEAN>

nit: I'd say "x2apic_only" to show not only that it starts in x2apic mode, =
but
also that it must stay that way. But tomato-tomahto.

> +
> +Force the LAPIC in x2APIC mode and prevent the guest from disabling
> +it or switching to xAPIC mode.

The "or switching to xAPIC mode" part is redundant. The means to transition=
 to
xAPIC mode is through disabling it.

> +
> +This option is disabled by default.
> +
>  =3Dback
> =20
>  =3Dhead1 SEE ALSO
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index d64a573ff3..b95278007e 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -738,6 +738,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>                                 ("arm_sci", libxl_arm_sci),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("force_x2apic", libxl_defbool)
>                                ])),
>      # Alternate p2m is not bound to any architecture or guest type, as i=
t is
>      # supported by x86 HVM and ARM support is planned.
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60d4e8661c..2e0205d2a2 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -26,6 +26,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
>          config->arch.misc_flags |=3D XEN_X86_MSR_RELAXED;
> =20
> +    if (libxl_defbool_val(d_config->b_info.arch_x86.force_x2apic))
> +        config->arch.misc_flags |=3D XEN_X86_FORCE_X2APIC;
> +
>      if (libxl_defbool_val(d_config->b_info.trap_unmapped_accesses)) {
>              LOG(ERROR, "trap_unmapped_accesses is not supported on x86\n=
");
>              return ERROR_FAIL;
> @@ -818,6 +821,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__g=
c *gc,
>  {
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +    libxl_defbool_setdefault(&b_info->arch_x86.force_x2apic, false);
>      libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
> =20
>      if (b_info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index af86d3186d..d84ab7c823 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -3041,6 +3041,7 @@ skip_usbdev:
>                      "If it fixes an issue you are having please report t=
o "
>                      "xen-devel@lists.xenproject.org.\n");
> =20
> +    xlu_cfg_get_defbool(config, "force_x2apic", &b_info->arch_x86.force_=
x2apic, 0);
>      xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
> =20
>      xlu_cfg_destroy(config);
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88..02f650a614 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -704,7 +704,7 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
>          return -EINVAL;
>      }
> =20
> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED | XEN_X86_FORCE=
_X2APIC) )

As I said, I'd reuse the bit in ARCH_CAPS in the CPU policy. That also mean=
s it
can be properly migrated and you wouldn't need an extra boolean in the doma=
in.

>      {
>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>                  config->arch.misc_flags);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 0c60faa39d..73cbac0f22 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -616,6 +616,8 @@ int hvm_domain_initialise(struct domain *d,
>      INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
>      INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
> =20
> +    d->arch.hvm.force_x2apic =3D config->arch.misc_flags & XEN_X86_FORCE=
_X2APIC;
> +
>      rc =3D create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NU=
LL);
>      if ( rc )
>          goto fail;
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 993e972cd7..ae8df70d2e 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1116,6 +1116,20 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t=
 val)
>      if ( !has_vlapic(v->domain) )
>          return X86EMUL_EXCEPTION;
> =20
> +    if ( has_force_x2apic(v->domain) )
> +    {
> +        /*
> +        * We implement the same semantics as MSR_IA32_XAPIC_DISABLE_STAT=
US:
> +        * LEGACY_XAPIC_DISABLED which rejects any attempt at clearing
> +        * IA32_APIC_BASE.EXTD, thus forcing the LAPIC in x2APIC mode.
> +        */
> +        if ( !(val & APIC_BASE_EXTD) )
> +        {
> +            gprintk(XENLOG_WARNING, "tried to disable x2APIC while force=
d on\n");

This is intended behaviour, not a warning. I'd remove the printk.

> +            return X86EMUL_EXCEPTION;
> +        }
> +    }
> +
>      /* Attempting to set reserved bits? */
>      if ( val & ~(APIC_BASE_ADDR_MASK | APIC_BASE_ENABLE | APIC_BASE_BSP =
|
>                   (cp->basic.x2apic ? APIC_BASE_EXTD : 0)) )
> @@ -1474,7 +1488,14 @@ void vlapic_reset(struct vlapic *vlapic)
>      if ( v->vcpu_id =3D=3D 0 )
>          vlapic->hw.apic_base_msr |=3D APIC_BASE_BSP;
> =20
> -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> +    if ( has_force_x2apic(v->domain) )
> +    {
> +        vlapic->hw.apic_base_msr |=3D APIC_BASE_EXTD;
> +        set_x2apic_id(vlapic);
> +    }
> +    else
> +        vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> +
>      vlapic_do_init(vlapic);
>  }
> =20
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm=
/domain.h
> index 5df8c78253..771992d156 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -509,6 +509,8 @@ struct arch_domain
>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_P=
IRQ))
>  #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI)=
)
> =20
> +#define has_force_x2apic(d) ((d)->arch.hvm.force_x2apic)

This would be a check on the CPU policy instead with my proposed change.

> +
>  #define gdt_ldt_pt_idx(v) \
>        ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
>  #define pv_gdt_ptes(v) \
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include=
/asm/hvm/domain.h
> index 333501d5f2..b56fa08b73 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -108,6 +108,9 @@ struct hvm_domain {
>      /* Compatibility setting for a bug in x2APIC LDR */
>      bool bug_x2apic_ldr_vcpu_id;
> =20
> +    /* LAPIC is forced in x2APIC mode */
> +    bool force_x2apic;
> +
>      /* hypervisor intercepted msix table */
>      struct list_head       msixtbl_list;
> =20
> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-=
x86/xen.h
> index b99a691706..75aa31d9ed 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -309,11 +309,21 @@ struct xen_arch_domainconfig {
>   * doesn't allow the guest to read or write to the underlying MSR.
>   */
>  #define XEN_X86_MSR_RELAXED (1u << 0)
> +
> +/*
> + * This option forces the LAPIC to be in X2APIC mode (IA32_APIC_BASE.EXT=
D =3D 1)
> + * using the same semantics as IA32_XAPIC_DISABLE_STATUS:LEGACY_XAPIC_DI=
SABLED
> + *
> + * Attempts by the guest to clear IA32_APIC_BASE.EXTD (e.g disable X2API=
C) will
> + * inject #GP in the guest.
> + */
> +#define XEN_X86_FORCE_X2APIC (1U << 1)
> +
>      uint32_t misc_flags;
>  };
> =20
>  /* Max  XEN_X86_* constant. Used for ABI checking. */
> -#define XEN_X86_MISC_FLAGS_MAX XEN_X86_MSR_RELAXED
> +#define XEN_X86_MISC_FLAGS_MAX XEN_X86_FORCE_X2APIC
> =20
>  #endif
> =20


