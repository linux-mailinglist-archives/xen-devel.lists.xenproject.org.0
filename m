Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E784AB17124
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 14:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065549.1430929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhSMG-00070y-3s; Thu, 31 Jul 2025 12:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065549.1430929; Thu, 31 Jul 2025 12:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhSMG-0006yu-13; Thu, 31 Jul 2025 12:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1065549;
 Thu, 31 Jul 2025 12:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAk1=2M=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uhSMD-0006yo-Sy
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 12:26:02 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20622.outbound.protection.outlook.com
 [2a01:111:f403:2409::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f945c33-6e09-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 14:25:53 +0200 (CEST)
Received: from SA9PR13CA0095.namprd13.prod.outlook.com (2603:10b6:806:24::10)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 12:25:48 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:24:cafe::e7) by SA9PR13CA0095.outlook.office365.com
 (2603:10b6:806:24::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Thu,
 31 Jul 2025 12:25:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 12:25:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 07:25:44 -0500
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
X-Inumbo-ID: 7f945c33-6e09-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wd8A/AmU70O8cbxheYQa3tL4d1eSGur9t4Tp//HwpbgK2iVfwaTo+UqC2rZmROfaWU5eNcMTTEvGX1kdMLWcspUGre2GDeI6m3Ixb3fcc+DjzH4cj+oAHz/Z3pjXlcYwqUkNNKpLVS057js8dtG7zbVXpF1nu5lHTmYnSIETsTJVU2dx2qul41GnDUXqsyiIQoF5iwoBgk97OeY9hFmzvIbOFF/2D6tVyyCCA0KD7m7addsyvpa3P/OZkzBVmkcXsm/mDHfvJNPBZF+fs8aUniFz0mx5Lw5p2rp6LLx2wBI2Y2eD2uDc/m2rmmsZwMz0gAfUnunyL7SEiY73XFVPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVUcVqBfRtSae+2uGC2grkA5wYGEjvbNt8MHHuS9rZA=;
 b=NcFJjbjtSfFV5GeZCL47chfvbT5xxMDYIl7GXPpLvFbvXQ4jj1PTgxZ0KqHtMH1QFaCKfIjBHV0pevGMDyePk+/fq1vtJF7rjjusVlx1suXhy7QLfN4Pcb3ZHwSRCIUIhj3VdDej5nvm1FrDCkNEOqwEq9nsJxgLlZQHVMM7P5ey4qTmjwSRVye8DQvJs5ncx9x+OcsEklVaG0BKxWXDs8OebeeslmH1KggEDyXsgrruTL045XYPrlAT+PQ8mrszLOFEyTYh4RG8cZlfkft1lY5ISY4grWoegoHpOAvOa21cjKzM9HjJovciXvonzvmfcXAFiC/wdCGCpj55UAHM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVUcVqBfRtSae+2uGC2grkA5wYGEjvbNt8MHHuS9rZA=;
 b=MBQj3ZlDKXlIHhIgYX24TjCRC9RbgmM4rND3R3w4GtjFkYqnCdNsEQXs3z+R0s2bnR/ST6k1iHiGaO4WcU0kHJvTl57YdDY3HsPWAQtCp4H9Nmn4aJ+lrxiXRE9M7jC0hYPVFWvw2Li3EU0QEx19zrMT7OXTxmh9nGe56IfUj20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Jul 2025 14:25:43 +0200
Message-ID: <DBQ8LZC7UKPP.DR12AX0L7E37@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN][PATCH 2/7] xen/domctl: introduce XEN_DOMCTL_CDF_is_32bits
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
 <20250731094234.996684-3-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-3-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DS0PR12MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: e33a48ef-c8a1-4cfd-9f4e-08ddd02d60ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlNaVi83VTJ4TDJZUnJpT1BaQVkremp2Vi9aM3F2NDE1aUF5aW1QN1hPOUpl?=
 =?utf-8?B?dkxVbHFTaHExMXpzMGFNOGg4Nno0NjgyV1VIRXg4Ym12cGcyUEI4b1JDUU5l?=
 =?utf-8?B?aFVzbWp2S2I1Vnp6MHlLU2FSZDcwM2RlVktSOGJEak9VWE1WTG1USzd6dUZo?=
 =?utf-8?B?Sy9HalY2N3YybGRmbXlyWGsxYzlnOVpPN2VTQlJ4NFpRb2dUU2lZMlIzMmpT?=
 =?utf-8?B?L3dhaHZxVExnN21HdUdRbFYvNSs5eFJFd2o1VG5IZkwycXZ2WnpmQVlrZUZj?=
 =?utf-8?B?N0xIc0FIRSszMWZjVkVDRDR4aUhDWGMrVklVckpGamtoRHEyVEZYZU9qeERl?=
 =?utf-8?B?YStBV25BekZiUm1jemgvUkZhM1V5SXNkeDJqbTlBZk5tLzEvOGhrS0h2ZTFP?=
 =?utf-8?B?bnYva2t0NEMrbnJ2c2FkVGx2cUdyK1ZZZ1Brd2NiUzF3bXlNRFlzbCtZSXZn?=
 =?utf-8?B?UE9BdXF4TmIxUUpiajJPUVlQVHdVZGJyUVhQUjhHYVZ4azM3RFJpVVlEQ3Bw?=
 =?utf-8?B?Q0dCMG1SQzZGL3lxL0xTS3lLOVVuaTRjWE1pNXV5cUtSRitYYXNTdmZ0THpG?=
 =?utf-8?B?dSt2bjM3aDN3UGozQVRMeG9DWHoyRzRuZ0FSZ2JOU01pU2dibmdTb21tMG5v?=
 =?utf-8?B?a2N1YndSeUFYLzlMemc5R1FnVEVwaERqZkpIVkREWlArV05RQm5JNXBuY3Y2?=
 =?utf-8?B?dWxoMUYwRW5TZVFLWWlienFhYXduajlBOXYxZHlWYzlzU1pYVC9EVTNmZFpw?=
 =?utf-8?B?bDJ2cmdLMFB3aU9nMlBCRWdzcmQ0d0tYVzdDcGtaZVBqMkFDYUNIMG9taHc0?=
 =?utf-8?B?NU1XOWw0OVZCSExIbWg3YjNVNVFERkt2aHZzbGFsenN5UlJGbTFsNXh0b2Vh?=
 =?utf-8?B?TjEvRXAwQjJtZ2RXb1M2U2hySEN2ajlVSGVuaHVZOU95RmprQW5NSDhiaWhC?=
 =?utf-8?B?TDFRV1hDNzM2RUZMOWpqZ3YrZGZ1VWNReGUveGd1Uy9iYVQwb3lNdk04eml0?=
 =?utf-8?B?NEN1WC9YWDBac00yTE44UWx4K2duME13cDZWMUFuSVh0S2dVSDAvclIreE9Q?=
 =?utf-8?B?cWlIWlA3VllKejN2TlNqaDFJVUFhWHdrRXduODFLMmY3Q29qZklWcUJSMmp5?=
 =?utf-8?B?R3Nkb0ZHM3B2djE5VVlWMHptdmNEeUMxL1ZaUVVYVzVDaExvM0x6ZXYwNklF?=
 =?utf-8?B?WXE5ang2aXVKUW9LMHNWOGN3U1lKUFpka1ZZMlpHZjVYTmdJWkswaEI1aFha?=
 =?utf-8?B?czNvblpXNXkwdFk3ekpEWXRDazB5dlhYa3FNZ3Z2amx2UzZSc2JXaW90NUtF?=
 =?utf-8?B?VEpIY0FnVWtPYlhnV2Q5RWFqSVlSa1RCb1J2bkp0YVpxNGlFazVMRUZMbFho?=
 =?utf-8?B?NUVUK0loNlRMa3ZqZllKRGdZZ05hYkZmaFMzOTVLOEt5ajRiMG1YZ0hNaEo2?=
 =?utf-8?B?L0R4RDl1Z0YwaFVFY1ZxRmhQYlpsdHpWZlg3NUtyZHgxclI1djM1T2VoNU81?=
 =?utf-8?B?bk5hMHVPVHRTNk54L0R1a3lpaFlUSDZhYjZFTWpqWGU4MDUvcURaVjlIMThu?=
 =?utf-8?B?bUFndSsvcVFMQWF0eXdaeEh1S2p4bjByVUEwM0ZDYnJjWDRQdzdOenNZWlEz?=
 =?utf-8?B?MUxBbG10TnZMTmlONzFRbDB5d1FId3dEeWFqQ2sxVHNVYzJheWJ4czFDaXdz?=
 =?utf-8?B?bHowRU50WUk4dGJEeVdBWUxWQkMvOElpWVFYdTRBTlBwM040N0llUTZKRHlH?=
 =?utf-8?B?M0hscklIaEhLTms3dVZmVG0rR2h1bVVUdG5aTm5kTnFwVjVEUUNST0lhL1JV?=
 =?utf-8?B?cjFEQXBDd2E0dmNlTVAwbDZuaDNFbURXOWhLTEdBdHd5REhKaHVUSlFoQVVs?=
 =?utf-8?B?RlR2MTdkc1l1d3QwdDZYbE9MaHRrc0FoNHFSTk16OWs5bjhucllIREpuQzNs?=
 =?utf-8?B?UDJ2aEdEM2c4YjFXUGNrMUhJU2pPMzVUODlTNTU2VUhIZ2l4Q2JUQzBWWTA3?=
 =?utf-8?B?NW5MbFdBZVhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 12:25:47.4085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e33a48ef-c8a1-4cfd-9f4e-08ddd02d60ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392

On Thu Jul 31, 2025 at 11:42 AM CEST, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> This patch follows discussion [1][2] which is pointed to "historical" iss=
ue
> present in Xen and related to creating domains sequence on 64bit Arches
> which allows running both 64/32bit guests (like AArch64):
>
> Now, during Xen boot or by toolstack, the domain is always created before
> knowing the guest type (32/64bit). For example, on ARM64 during Xen boot:
> - dom0 is created with default type 32bit
> - vcpu[0] is created
> - kernel binary probed and guest type is determined (for example 64bit)
> - dom0 type changed according to guest type causing vcpu[0] reconfigurati=
on
>   (with restriction applied that domain type have to be properly set befo=
re
>   allocating domain'a memory)
>
> The same domain creation sequence is executed for dom0less boot and for
> creating domains by toolstack (The toolstack uses
> XEN_DOMCTL_set_address_size hypercall to reconfigure domain type).
>
> As indicated by Julien Grall and Andrew Cooper, above domain creation
> sequence is not robust and fragile, so it was proposed to introduce extra
> flags to XEN_DOMCTL_createdomain to allow configuring domain type properl=
y
> at domain creation time and perform further rework of domain creation
> sequence to probe guest type before creating domain.
>
> Hence, this patch introduces extra "XEN_DOMCTL_CDF_is_32bits" flag which =
is
> intended to be used by 64bit Arches for proper configuration of domain ty=
pe
> when domain is created.
>
> Now it adds initial support for this flag for Arm64 arch only. The defaul=
t
> Arm64 domain type is changed to 64bit:
> - the Arm Xen boot code is handling this case properly already;
> - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
> updated to forcibly configure domain type regardless of current domain ty=
pe
> configuration. Hence toolstack configures vcpus and memory after
> configuring domain type it allows to start with domain default AArch64 ty=
pe
> and then switch to requested domain type and ensures all required domain
> settings applied.
>
> For Arm32 this flag is ignored.
>
> Note. For Arm64, Once toolstack is updated to probe guest binary before
> creating domain the XEN_DOMCTL_set_address_size will become obsolete.
>
> [1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
> [2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Neat idea. I like it.

> ---
>  xen/arch/arm/arm64/domctl.c | 13 +++++++++----
>  xen/arch/arm/domain.c       | 10 +++++++++-
>  xen/common/domain.c         |  3 ++-
>  xen/include/public/domctl.h |  7 ++++++-
>  4 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 82eff26fb0d1..5346a533d888 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -26,6 +26,11 @@ static bool vcpus_check_initialised(struct domain *d)
>      return false;
>  }
> =20
> +static void vcpu_switch_to_aarch32_mode(struct vcpu *v)
> +{
> +    v->arch.hcr_el2 &=3D ~HCR_RW;
> +}
> +
>  static long switch_mode(struct domain *d, enum domain_type type)
>  {
>      struct vcpu *v;
> @@ -36,14 +41,14 @@ static long switch_mode(struct domain *d, enum domain=
_type type)
>          return -EBUSY;
>      if ( vcpus_check_initialised(d) )
>          return -EBUSY;
> -    if ( d->arch.type =3D=3D type )
> -        return 0;
> =20
>      d->arch.type =3D type;
> =20
> -    if ( is_64bit_domain(d) )
> -        for_each_vcpu(d, v)
> +    for_each_vcpu(d, v)
> +        if ( is_64bit_domain(d) )
>              vcpu_switch_to_aarch64_mode(v);
> +        else
> +            vcpu_switch_to_aarch32_mode(v);
> =20
>      return 0;
>  }
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 79a144e61be9..078002f964ba 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -613,7 +613,8 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
>      unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF=
_hap);
>      unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_C=
DF_vpmu |
>                                     XEN_DOMCTL_CDF_xs_domain |
> -                                   XEN_DOMCTL_CDF_trap_unmapped_accesses=
 );
> +                                   XEN_DOMCTL_CDF_trap_unmapped_accesses=
 |
> +                                   XEN_DOMCTL_CDF_is_32bits );
>      unsigned int sve_vl_bits =3D sve_decode_vl(config->arch.sve_vl);
> =20
>      if ( (config->flags & ~flags_optional) !=3D flags_required )
> @@ -711,6 +712,13 @@ int arch_domain_create(struct domain *d,
> =20
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
> =20
> +#ifdef CONFIG_ARM_64
> +    if ( d->options & XEN_DOMCTL_CDF_is_32bits )
> +        d->arch.type =3D DOMAIN_32BIT;
> +    else
> +        d->arch.type =3D DOMAIN_64BIT;
> +#endif
> +
>  #ifdef CONFIG_IOREQ_SERVER
>      ioreq_domain_init(d);
>  #endif
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 303c338ef293..3193deb9c6bd 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -722,7 +722,8 @@ static int sanitise_domain_config(struct xen_domctl_c=
reatedomain *config)
>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>             XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> -           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
> +           XEN_DOMCTL_CDF_trap_unmapped_accesses |
> +           XEN_DOMCTL_CDF_is_32bits) )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index a69dd960840a..ca59995f6c4d 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -68,9 +68,14 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
>  /* Should we trap guest accesses to unmapped addresses? */
>  #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
> +/*
> + * Is this domain running 32bit guest?
> + * Used for 64bits arches.
> + */

On arm what this means seems clear because aarch64 (IIRC) start in 64bits, =
but
x86 doesn't. This needs expanding. For x86 HVM guest's start in 16 bits and=
 work
their way up to 64 bits, and PVH starts in 32 and works towards 64bits.

Do we mean to hide long mode (or the ability to transition onto it) altoget=
her
with this?

> +#define XEN_DOMCTL_CDF_is_32bits (1U << 9)

I don't like having a flag suggesting "set this for 32bit guests, unless yo=
ur
hypervisor is 64bits". If anything because a 32bit dom0 doesn't have to car=
e
whether the hypervisor is 32 or 64 bits.

Unless we go with "domains are by default created with as much *bitness* as
possible". If so, I'd suggest XEN_DOMCTL_CDF_32bits_max, which would work
with the "hide long mode" semantics. For 32bit hypervisors you could set it
or ignore it.

> =20
>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_is_32bits
> =20
>      uint32_t flags;
> =20

x86, riscv and ppc need accounting for. If anything to fail the domctl if t=
hey
see the flag set (until they themselves can handle it).

Cheers,
Alejandro

