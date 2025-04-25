Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F10A9CD14
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968297.1357950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8L2K-0001Iz-RS; Fri, 25 Apr 2025 15:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968297.1357950; Fri, 25 Apr 2025 15:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8L2K-0001GI-O0; Fri, 25 Apr 2025 15:32:20 +0000
Received: by outflank-mailman (input) for mailman id 968297;
 Fri, 25 Apr 2025 15:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8L2J-0001GC-9J
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:32:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2009::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77a3d77e-21ea-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 17:32:17 +0200 (CEST)
Received: from BN0PR08CA0003.namprd08.prod.outlook.com (2603:10b6:408:142::19)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Fri, 25 Apr
 2025 15:32:11 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::bb) by BN0PR08CA0003.outlook.office365.com
 (2603:10b6:408:142::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 15:32:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 15:32:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 10:32:08 -0500
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
X-Inumbo-ID: 77a3d77e-21ea-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6QFvJC+/8KisYvuyKkj6Lk+Xl7PZfKEERZoeShQpBmAI1tIFPbcybIqgDA8Wx8Pf1zznQU/cB7uzIXqUDIcRA83PdtrbV6gycGUDYfm47cbmAUyo+SVybB0GoaQNKTsz0kTA4Q2YgOgT+hw4RJweY+THboID331m32NXp5VGZdovX+0KSR7isexJoTbdO+qQQf9A065WeAF6hrv+Z/gYgxsvMG0JQNN7YkImt1Z84F0s7P4uIhHxPxo/HfpCvkuvbxUK+ny+nBM5YeqcZ6xURf2pVKyskRmJnRUBDLvqC7FA4osvlkmlAjGehlW7ZWO67P174d+rmzbZJ7/+4oJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EF19AcWwzX4Mf+Mvfee+VJ3jfJzBFAX96NRbqe/Paak=;
 b=tmUNIEyHvBba8nNMdCKiOX8EVeHSg1ndBx7dERhfN6kdxoLcyh3lwe/HpFmw82KEGqUkc2pAix5Flz6v27G+s2rjwuTtcA7w7MdGxxh3ttQP3RzW5xy6fDp7+tZYRlnOcCTYIotTk5ck684htoymGW3imAP2joyoOjNPCM7elsB24g8JVYcNU30oknfPsfNEdp2qMjpHdnVyYrrnL+nPbBQ9GOOPHh06uL6a4iaRvu7ApBzIca5N06wdiJMFvtQGanviX3nwbiqf94xtVp0zX2hefntWp+hkqAPRi6Sy0Y1ClBQndO3wU8XanC4Ioi1+gdmr3aQiymmEoL9WlSiD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EF19AcWwzX4Mf+Mvfee+VJ3jfJzBFAX96NRbqe/Paak=;
 b=c9onfsz58/+eHoeevtBpbIUwnSlDfzdB7adSva2zlA1WzgjLq0zTVmvDDV8oIM5K1f9MV91Sxlg+zx7VYSnEJZDv/aaageDPaWOS/C8eDdbsyyHV7PJpa8IqlobGbr7oFajdNoVCltyUF9ppNmq7ue5DscumRqtWk1RNvI2ZgH4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 16:32:07 +0100
Message-ID: <D9FTTUWYQE4W.28DF7XSYTJ9TH@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v5 12/12] x86/hyperlaunch: add capabilities to boot
 domain
X-Mailer: aerc 0.20.1
References: <20250424161027.92942-1-agarciav@amd.com>
 <20250424161027.92942-13-agarciav@amd.com>
In-Reply-To: <20250424161027.92942-13-agarciav@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 0108a2e9-e613-45de-3d64-08dd840e58a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZitmTUhQK2ZDUW9mdGZidnB3UGNmZzJHQmV5M2toNDRadTExUVZFTW9LYVZK?=
 =?utf-8?B?WnFkSVZIakZjN0haMzkrRFhpTWZUdnVEZU81V0pNNFZNV1I3OHd3Sit4eHdm?=
 =?utf-8?B?QkovczhxMGlpTDA1UjBxTXIwZHFoMVRMOWs0ZVhSZG5BSm9NNlJGUlJ3dnZT?=
 =?utf-8?B?all4NmhqTTNEalIxdDl4WHNZYVhucFhQbUQ0c1dLWHJjeFB6YW9sVHRyM2Zk?=
 =?utf-8?B?SWdQN0ltdmMvRmw4NmRIMG1TZ0VvcFN2YTFqdTVXWnFXc0dNdUw5Tk1mREl5?=
 =?utf-8?B?OGpldXZtc1p0WEVTbjU1a0w2SSt6aWt6aVgrcFBXdUJySXAybzhyUHduYWxH?=
 =?utf-8?B?bFBOZ1cwUzdiSysvWktpcUJGZytyY0hVNHlyUUdKN2RNSy9VT1RQTmhVTUgy?=
 =?utf-8?B?ZzFiMTVwVHFIVzI1NnM1azg3bXpOL09kaCsvTW1ZcEtFSmZpU2lxTnhGbGc5?=
 =?utf-8?B?YjBLR2hzQytidW9IdXplYi9oejZpYTIwR3RRcDl0R1ZYUk1zdkpXOUxIU3Jw?=
 =?utf-8?B?OEUxMThYc0ozeHVYTUhMS1I3RFZmdkhKTG42b01XYkptS01xTmlBek5FTkV4?=
 =?utf-8?B?Rk81bG9vV09TQnBwaFVEZHZ2WmJxanNuVGZFV0t5THNQSGxCK0QxUWc5Ym9B?=
 =?utf-8?B?MnZ2VW9ScExwSFBOcWY0TzgwaU9uUzk2ZmdZd1I0SWVIMEFNWDJGWURVQzFZ?=
 =?utf-8?B?Rm5EeU5NOEI2RnFCS0QreVc0eTBkTmdSMXZKRUlvZ3dvbXJndGhtL3dRMC9q?=
 =?utf-8?B?OTFKSnd1dnNUelRScTFPQXpCUW9TNk10SytCS3BpWmkrc0xPUHBWRDNydUY2?=
 =?utf-8?B?NGRubUxvVis2TjhwY1FBcENjdjFrbU5rWG5HdkdiblRyYUdZL1p5d0x0Q3lj?=
 =?utf-8?B?RlBpU0pVeXV2ZlN3NVRNUk1DYkI5Z21DMmEwM2k2MkpsYlVSZ1N6Z2RkQXFl?=
 =?utf-8?B?M1hyc0ZHeVluV0kwYjN4bitHZWFCMnV3TXdsMlVBc2cxVGtGem0vR1FoOXdp?=
 =?utf-8?B?ZWlyRjAvZE5HR0xNUjlZbnRCdzRRMFBHTHZkam90Z2VkaGRXS1psZzZwMnM5?=
 =?utf-8?B?WjN2Vm9LdkFXSVR0NzU5TEVsblB5QmN6WmhEZzFYeE5NL29VaFY5cUNIUmtq?=
 =?utf-8?B?ZjZqSzdJTkh6ZDJRbzdNL2EyVC9LYUF4T3VueDR4VDJJMm5laU1XQ1I5YmFV?=
 =?utf-8?B?clVwTDNYMStQd1RvODROeWFyUWJ4WUhoWStIazVFWWU0UG5tRFFZa1JmU1M1?=
 =?utf-8?B?SytQVWlUSm5EOW9xWUJ1ZnhINGZzM2NKNnQyQ1FaSm5wL2w1MDdzUmdTQk1H?=
 =?utf-8?B?aDNNcGNWR2F3SEIrclliRE51ZEt1cytieGJHem8rSDRZT2x6UWw1WkNNYXNk?=
 =?utf-8?B?N1UxTUY5VnZlTWxGV0pZVTYrbkwrOE1LbDdQaDdrNm9tYU9MRHlWRG1BNHZB?=
 =?utf-8?B?TlM1WmJhMytiRGNxSEl3L2ZuTTU4czUwY0RTTUpDLzB5Y3NtUmd5V3grZ0du?=
 =?utf-8?B?dGtzWHJGbmVoeEJLdzNFY1BORUYzVDFHK1lVMkI2WjcxSXA3WTJxSk04SWtz?=
 =?utf-8?B?WnIvM0YreExuV21LbEFuTEREcmZSOEw4L1Y3eUF4S3p0U0xyMWxIa3dyOHdv?=
 =?utf-8?B?WWxvN0ZxaExuSzE0SGprTi9hZ2FlMzFDK2VkbUMwSitQYVBHWTIvNVBmeTkx?=
 =?utf-8?B?eXFRTC9adjJ0R3c5YVI1SDRCOU5GODZCM0lCeUxkc25scVAzZkEwcEp4MTlF?=
 =?utf-8?B?b2k4SktwcjlXU0NpK2NkNW1uZWVGSmRieEkwRnBBSXVzN0U4c3hxdHJ1Qm1S?=
 =?utf-8?B?VzlsVmtFSGFtV0RtVzNMU21qQnJTcFk2aDIxZGY3a3lLQlEvVzBVRkkyam1t?=
 =?utf-8?B?b1ZpQkxBVE94M3ZpQUszbTFKYll1K0lKYW42aERYazVXTHlRYVZpZ1A1YWhO?=
 =?utf-8?B?OGt4NGE4UGxDd2Z4ZFN5SzdwTTlrTjB4eEc3SkZYNnNnZHJDZFZVa1hHejJE?=
 =?utf-8?B?VmtyQ0ZEMkdNbUhmNmhReS9qK2xyL0x0b3dhOC9sNmNsYVV2YWE5TmtPUEFl?=
 =?utf-8?Q?zlFBsV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 15:32:10.7869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0108a2e9-e613-45de-3d64-08dd840e58a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192

On Thu Apr 24, 2025 at 5:10 PM BST, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>
> Introduce the ability to assign capabilities to a domain via its definiti=
on in
> device tree. The first capability enabled to select is the control domain
> capability. The capability property is a bitfield in both the device tree=
 and
> `struct boot_domain`.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> ---
> v5:
>   * Removed BUILD_CAPS, as DOMAIN_CAPS is now in public/bootfdt.h
>   * Assigned DOMAIN_CAPS_MASK to dom0, rather than only BUILD_CAPS_CONTRO=
L.
>     * So it also gets hardware+xenstore.
> ---
>  xen/arch/x86/include/asm/boot-domain.h |  3 +++
>  xen/arch/x86/setup.c                   |  5 ++++-
>  xen/common/domain-builder/fdt.c        | 23 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index 969c02a6ea..cb5351241a 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -13,6 +13,9 @@
>  struct boot_domain {
>      domid_t domid;
> =20
> +    /* Bitmap. See DOMAIN_CAPS_MASK for a list */
> +    uint32_t capabilities;
> +
>                                            /* On     | Off    */
>  #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
>  #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d4f839146f..960e43c785 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -61,6 +61,7 @@
> =20
>  #include <xsm/xsm.h>
> =20
> +#include <public/bootfdt.h>
>  #include <public/version.h>
>  #ifdef CONFIG_COMPAT
>  #include <compat/platform.h>
> @@ -1050,7 +1051,8 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>          /* Create initial domain.  Not d0 for pvshim. */
>          bd->domid =3D get_initial_domain_id();

Self commenting that I missed XEN_DOMCTL_CDF_iommu being passed if
iommu_enabled is set (out of context, a few lines above). That should be
gated on DOMAIN_CAPS_HARDWARE being set too. Just spotted it when
rebasing the RFC series from Daniel.

Cheers,
Alejandro

