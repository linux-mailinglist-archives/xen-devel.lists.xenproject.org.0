Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724ABACC6FF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004329.1384061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMR4Z-0002Mq-8e; Tue, 03 Jun 2025 12:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004329.1384061; Tue, 03 Jun 2025 12:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMR4Z-0002Kq-4r; Tue, 03 Jun 2025 12:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1004329;
 Tue, 03 Jun 2025 12:48:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NLa=YS=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1uMR4X-0002Kk-JO
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:48:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:200a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188fc79f-4079-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 14:48:51 +0200 (CEST)
Received: from BY5PR17CA0024.namprd17.prod.outlook.com (2603:10b6:a03:1b8::37)
 by CH3PR12MB7569.namprd12.prod.outlook.com (2603:10b6:610:146::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 12:48:44 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::81) by BY5PR17CA0024.outlook.office365.com
 (2603:10b6:a03:1b8::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.40 via Frontend Transport; Tue,
 3 Jun 2025 12:48:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 12:48:43 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 07:48:41 -0500
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
X-Inumbo-ID: 188fc79f-4079-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUxlgGZ9KVd4m575LbPpWbBSucZ5vhPD91Fi3EZf1lI+R8/JF/yyKB2Gd8PseNlofQ87apIbyaM/zcYmXgbPX5aRWBGn1zjlvwHZikYrRUXR6car5Vt6/QZh2awABc7kKIYSuduq9O8kZVGirPbR6Xe4V4jQW3W0mV20Hr4mH/lAfUqwDSW25GSwMJztwWVE1Js7LZLfnUIiuN9zLQ8Y/wGDxwFCGB3M3+w4D+ZdZykk1FKrDSIcONaoRgk7K4f4dFznNjH5WmtB9fsMW+EZHrm+SuLLj7LWoz732fbYi3K59udYJFKkuayGkvcVxibMhuYbrFAyCH/Co//3tCGNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOcRDHDw2KcZP/jf3nXNcssUgkECRAZ5Ky7uoik/6P8=;
 b=cU+POluV9zhAXH/lD5kYXmxK+/zjLsGZ1N07OlLgC2STCaEnqpdou+HYx7JSVd7VbkX1ufKu2aeufESiUIV0//rps/2INbpBr36desMYbWSlh5dpeSEqMchHgqfh49m2HA21pUFnyHUjowoog/ldEaYYA5vC80n+dbojYbYL88w3JY5PNJupXnf6jTz6R/04r5xfN72YYawcekHQ3RjcArG1sCQKJsH7Wswpi2Nz5hj4LEOBraGFjMR69T1Xu0rZwWPWyFPSA44dkB0YaoXw2z2Soc5o559loSGx5o1DJgz3JdFaBXbSdyjM6FdZuUpzkRZd9+3TFLQYegyMJgqMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOcRDHDw2KcZP/jf3nXNcssUgkECRAZ5Ky7uoik/6P8=;
 b=J8G08EFYGgeFwAvWyxisJKBvwNDIHO5VcX/X6qNHsAzVbhQ3Lz4NudLymKeJrN5+8HifrfMvG87yfk6HFUyE3rbPcZEyCqrSMvRNGkeaq1C8x7ck07deKsGyW1S6nZZUac9U008lX20o6u46oHlMMuq0MGpKgxvUQrIbWr08tk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 3 Jun 2025 14:48:39 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/5] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
Message-ID: <aD7vJ1csWc_85bDr@zapote>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-2-edgar.iglesias@gmail.com>
 <b0e9ef87-e786-4237-bcc1-14058a2236a9@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0e9ef87-e786-4237-bcc1-14058a2236a9@xen.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|CH3PR12MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7f6dd6-3365-4a2f-f698-08dda29cf930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XO+ez36sywyv0UsMOOe3SKMk6XzU7si1+UwPJJNPRCb2N5n1w6udaJmpedxp?=
 =?us-ascii?Q?k5ID01ZzbhUaOTDmOWN+5uGXnGN3+unkK3lQFe8NL4RAIXupLJAmMvj1iFKG?=
 =?us-ascii?Q?vRAsIdlRLPG14kapuHjTx48HXPXOEw+4v5Bp/t6KK1kvFHYd6xZgB+jUE5Uh?=
 =?us-ascii?Q?6h4KA06iPkIx1XTTr7ZfOILLquTGWmDTrfluz09lP+gEk7aCoqKNBFAe81yu?=
 =?us-ascii?Q?epSZ28XCFPcJ6HKP9lk+z7EHax+gTjXPPmN4Bdp/ZjNU71tz1FyKiStwtuxg?=
 =?us-ascii?Q?TNfGCIHRkR8yLOR23UfziyIAd/MlsD8X6cTrzJGhwbEiRF+I64JjzO8w1BCm?=
 =?us-ascii?Q?Bjhqtamx0/LukGOV1AcsyzIA1yDCsSgZRUWTU1kygJyG7/NeupYd5AhdgEUl?=
 =?us-ascii?Q?W0YMCbgHdYUOFYj0zOSFvPv06pB2PGzo47Dfwu3CbxN65tJKTnEZ3gnDIVGa?=
 =?us-ascii?Q?/c+XnzbroFE3GIrGoT8igaDPjukxyy9jcMIsROWD7Xqtu0sHtAZ8yOthCX2v?=
 =?us-ascii?Q?EZ5gz0j9dcaKt265ftVIVbk7UIWUL3zZG9FOP/X6BxiByL4SxeGOLJWYj//u?=
 =?us-ascii?Q?hrgeDErqyx9tYIY2QVpZiJRIqnCN6GPUNUrNaKlj8b8u5xO+cYBurIQcuSi6?=
 =?us-ascii?Q?/dg4hUxoylqUmFHHCdTGndEOv2eoXl5nZKP4Fz/xUxMrxrEuZ2URpXEbDNEB?=
 =?us-ascii?Q?LzUX+BJOl/mMZKU3lCXZfaF7+1zNtMmp/6gzEcLbGAr2nomkwUB6bEgQgmI8?=
 =?us-ascii?Q?IkYJNWEVseIBmoitK/Tfp0pK3KaUkHTaQooUsn3KrUnSangsBZllgQ8mUW5u?=
 =?us-ascii?Q?+wI3+orE6YAVyvlUfxluIZivsMXLaU9pCdmDQFmmWDs2cBK1UKrOvL45ww7Y?=
 =?us-ascii?Q?HYZ6SH1BNFjRGcbGphNa4NknrGzzXpkyese9KROT+mIe1jMbm6s1ZtGxunU/?=
 =?us-ascii?Q?l9pipIlDxd4aMbVEBCD+AZF5+1YlQRdtdT2JA0Q9PL3a3THJP2ipTxkA1UOy?=
 =?us-ascii?Q?qoM+fbort1nrBfEJrhfz3/G8mRrAyQ+fQc2/BGXtji1vd8GjJA+ar0LNc8rW?=
 =?us-ascii?Q?5Agf+nfBSYH+O07EpX81cMT/vn1+Oe90OzAI1NMeR1OLju2V/AV5yVbUySGO?=
 =?us-ascii?Q?wX0Kmm+cU80oYXOQBA4ZGmUrvi9nJYOPw+JaGhjO5NbInp9zcPhY13mcLqeP?=
 =?us-ascii?Q?k3mSpTcJZmObAjsTPOo/wvLJXRJLCY/+nI1glAICUx21KPMIKOJ+7GXQeJlr?=
 =?us-ascii?Q?3SF6BUCky0no5rQBCFY6uEO60OObZ9yKOV6qbdJvhvz6YcmLopqFeoKhYMmT?=
 =?us-ascii?Q?yME3TPw6ESK4PPXrYO54WjhS8TFv36gpi92OvXsZ6HP3ury24fCNbpTFga2w?=
 =?us-ascii?Q?c/f0fHs3vQY7UhzCBvVIXaSvM3SwXTSAjRJc0OnGKewrBGgwUpTGvfJPJG0M?=
 =?us-ascii?Q?RqFR8OLUzVwpIEaeBYY9hgqBCtvqHrL9JRk/clFnQF6YoY8gEQlv4ccpJST3?=
 =?us-ascii?Q?f3XiH52ukOYYEB6iPnC8Ue9HaM0kZbcOGGIV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:48:43.4547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7f6dd6-3365-4a2f-f698-08dda29cf930
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7569

On Tue, Jun 03, 2025 at 10:36:40AM +0100, Julien Grall wrote:
> Hi Edgar,

Hi Julien,

> 
> On 30/05/2025 14:45, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add a per-domain way to optionally disable traps for accesses
> > to unmapped addresses.
> > 
> > The domain flag is general but it's only implemented for ARM for now.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >   tools/libs/light/libxl_arm.c  |  3 +++
> >   xen/arch/arm/dom0less-build.c |  3 +++
> >   xen/arch/arm/domain.c         |  3 ++-
> >   xen/arch/arm/domain_build.c   |  3 ++-
> >   xen/arch/arm/io.c             | 37 +++++++++++++++++++++++++++++++++--
> >   xen/common/domain.c           |  3 ++-
> >   xen/include/public/domctl.h   |  4 +++-
> >   7 files changed, 50 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index 75c811053c..9530996e72 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -233,6 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >           config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
> >       }
> > +    /* Trap accesses to unmapped areas. */
> > +    config->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> > +
> >       return 0;
> >   }
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> > index a49764f0ad..a4e0a33632 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -343,6 +343,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
> >           panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
> >   #endif
> >       }
> > +
> > +    /* Trap accesses to unmapped areas. */
> > +    d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> >   }
> >   int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 45aeb8bddc..be58a23dd7 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >       unsigned int max_vcpus;
> >       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
> >       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
> > -                                   XEN_DOMCTL_CDF_xs_domain );
> > +                                   XEN_DOMCTL_CDF_xs_domain |
> > +                                   XEN_DOMCTL_CDF_trap_unmapped_accesses );
> 
> Just to double check, doesn't this mean the flag will be allowed on x86? If
> so, shouldn't we reject it in an arch?

Yes, I had initially thought I could block the flag for x86 in xl but I
didn't consider go/ocaml bindings nor Xen internal missconfig. In v4,
I'm adding a check in x86's arch_sanitise_domain_config().

Cheers,
Edgar


> 
> Cheers,
> 
> -- 
> Julien Grall
> 

