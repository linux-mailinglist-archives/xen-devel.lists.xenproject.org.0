Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C6ACC703
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004336.1384071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMR5d-0002ti-IY; Tue, 03 Jun 2025 12:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004336.1384071; Tue, 03 Jun 2025 12:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMR5d-0002rK-EJ; Tue, 03 Jun 2025 12:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1004336;
 Tue, 03 Jun 2025 12:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NLa=YS=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1uMR5b-0002r0-OW
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:49:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2415::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ed1170c-4079-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 14:49:54 +0200 (CEST)
Received: from BY5PR13CA0026.namprd13.prod.outlook.com (2603:10b6:a03:180::39)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 12:49:48 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::31) by BY5PR13CA0026.outlook.office365.com
 (2603:10b6:a03:180::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 12:49:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 12:49:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 07:49:47 -0500
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
X-Inumbo-ID: 3ed1170c-4079-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6vCE3WSXb4T4etHk1yCwA9Mp2Xyccyhg8mfFIE9qtDymJJmzSHHukfjr+Sl+hsMTVEis+KNyZ/KsYOlK8ACLIqUDWhdGU2m1fiykkf+ksMwE16NpXuQF/gNVCmP72FierHzHLUYFJt8q7IVycpcrMNKp4LQpiEOcJWeeNsF5NS+2eEEXJYLTzoGTo2lzppqsje91SK9qtK3TSaZFrurJe8WSvrwEIEFhWBJgI3x89Ja8ipNOXzwEUgahFibo3pvSfgsb7SaZxiKFdHyS/x/MYdpjJUsYp5NrWqNY4S9B8zrK4APkixeFP30I5LpSu5S4ZoYD2JcbY79jD+q41JqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeH+6vE3mqu6gFB7KJtAW7zewFOjGEkZ3/AZ4fTWlOc=;
 b=VrwfpoSDzEX2Lq1YaqnCcpusOTEQ2VecO3KZD4ef/X/uff4t8SwNZ4E4FvXOk/OmQVjNlJ23pic6G/4vHA5saGimpN6KAujvZw8LQCBVzr89I1jXyvGoO6erlb8SaDmaA4gJrwtCzzT2eaieoByW2xDUDuUkb/STieNKwWMXWYwLc2JC8teSJkUEEBplyM0yDLBoDnqE9AKdsMuZShou8KI+i4L9uqLRiiVSdZHovttXiVqfDHXIiNUNqOrAqGSC8UgblktyWy/ZGfWicgGz498AKKdOQaxMH23es8P+X0x82FXIe8pb2Np+w9F884LG/zT0URXS5FHE9rJhssT5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeH+6vE3mqu6gFB7KJtAW7zewFOjGEkZ3/AZ4fTWlOc=;
 b=leCnLys23jykV9xl7Ow/3UjdAMs6K8Hcm2XwZX1fiJHETA91KDo7tGzdMkCDxqEo3WEIl1ftY6j0dT7jXSYAlq2LTKKuJRxhB6qwHC4Fvk1sygfpxzCow9Rs5ggQILw2IKAtbnBP/Y0gS14JTbuHeMsH1RoRfWU2/dhy30xjbN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 3 Jun 2025 14:49:45 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/5] tools/arm: Add the trap_unmapped_accesses xl
 config option
Message-ID: <aD7vaXgHka5aBhdF@zapote>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-4-edgar.iglesias@gmail.com>
 <dc9d383e-f23a-450f-b4d7-8e13e2155817@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dc9d383e-f23a-450f-b4d7-8e13e2155817@xen.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: df3ad9f7-a003-4533-ae06-08dda29d1f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YAdSiOHsTkH0G8hVIR3XD/q7oHSAG49jRe2/XRK+PF/a6JEPNiRSygcpTCFc?=
 =?us-ascii?Q?5UOR2Ba628bqeY66JRYvNUXkvf8eXMhhH7kKn3cEme8ZcNcz4+DHdHiUfl6R?=
 =?us-ascii?Q?ZFpRw0s1k3iVmlxT8SAQARa+Fjpe3etIyBasQIhWQAr8PJEQAgrYNbZIUzof?=
 =?us-ascii?Q?A+Rq+mQjCOpCcTLI+dtwqT0Qiqc4PbkCotvXsaAVFrxxT0RCAvHO0HKLuEvL?=
 =?us-ascii?Q?AQLEcqeCzI1w6YWulMydG/PplJ3KmZbgxfy/2mrkIVVFg8jBO4616XlrFiRF?=
 =?us-ascii?Q?fsit83gN1jt5gCcia0ULWR3d6sME+UFiAGdqtj8m/7BuLAjarzIZ8ZRUjYDP?=
 =?us-ascii?Q?j8jXoWhgrfXvSUMTCcXTtE8I6Q10scq/C/RktxgibRibI6jc8VYtTOXzEX5g?=
 =?us-ascii?Q?smB10LGROm5yg/7hfV/fCrgQ3I8cfuR6FZAvuttFau5xMqa2H9E1OwbK/qSt?=
 =?us-ascii?Q?YwSi8l0EBmQr5dTijP+cPsHFMnFXQg3zLi0RhTCdWNbc+YNaNCbadT/XcYiN?=
 =?us-ascii?Q?5YoYmg2RMIdI9qXaHM2eVjLIYjVrTealz7Bce4p6KeSIOYu5A/tKPKcquIGW?=
 =?us-ascii?Q?GmUo1dXcmD7cgI1WK/KObnzDSnjb43JBZjv2jMrOW1WIs0PSDdz3fNUVZq2s?=
 =?us-ascii?Q?vAqL61kyEDatuPfdD3E7EVMUVtM3MGbPsTRyMtO1nec2eIZ2fAOFJogKu95y?=
 =?us-ascii?Q?bwDnBg3e+5qYnXbtTxoD7aHQH7lAHvr/u5c2KteJpfgomArXVZIWxfpA8qsk?=
 =?us-ascii?Q?xie9g+IvehYTWaj28y1rJpyjDqLT+ZXwfDk1VCjYPssaQ+Bmm/uUzu8sND/5?=
 =?us-ascii?Q?CeK8dqV++fLDZRQLEXbamo/SevZ/YCmhTAVtYBN4xwhFB5pU0/NDncmmR87N?=
 =?us-ascii?Q?gmcu7rgpdFK6A43JD8W5F1qyv3ZoggCnRpkM/9j2FzSfuyKuiusK+5t6+hja?=
 =?us-ascii?Q?RbRSTcY0s8d7CSu79O3P9F+1smUCYJH1Tdhr0hQBk3Gi29hEenJwgnbENf22?=
 =?us-ascii?Q?jWvoxC32aPdKc3fGjgaCnU2a4phBZbRL3mXWYSYVCJjoa4ZDBrfM9hZb1U0F?=
 =?us-ascii?Q?Ja3IGnyqiMdNpBZl6wzIzJR2JcRCfnYuQZRU8DSVIlcbBnMOm3QyW9wrFLCI?=
 =?us-ascii?Q?hGBJj7PUjcw1NxAwBkCcEA+bbWHNU3gUWy7GEbESMeX6LTu8+z61bVZQ5ymh?=
 =?us-ascii?Q?i4MMfDjqoCqNNYBEPrbTFeWNFWMsLOvcIARbe6TNH674UA8VOsfxiWoifUrK?=
 =?us-ascii?Q?p6uMu5jz5SOSV16OEYuz5D3yiJvZnHSGadrl5Fi6BVtn2yzgK7DNeHfMunml?=
 =?us-ascii?Q?xS/P6BAtCFO0h6TZkc12Y1ANnRHxM9ePUqjlLBjlGCf3IYkJKhD/qFU8kNpe?=
 =?us-ascii?Q?XYjm4bAis4y9ZZ4zrnv4zogSRUgwY7ADHspPzdRwNaMasijeYgrH5RCyKKDJ?=
 =?us-ascii?Q?T0LLHdZgJto0FPkOnz41PSTVfpFoZmpzjjHluvY0oj95BtgJa8ZKxJ3+UcHj?=
 =?us-ascii?Q?LTXdX9RU8p1ARt5tPdCAoFHakgFA1uKrdsTP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:49:47.8831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df3ad9f7-a003-4533-ae06-08dda29d1f97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322

On Tue, Jun 03, 2025 at 10:34:53AM +0100, Julien Grall wrote:
> Hi Edgar,
> 
> On 30/05/2025 14:45, Edgar E. Iglesias wrote:
> > @@ -1714,6 +1711,9 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> >       /* ACPI is disabled by default */
> >       libxl_defbool_setdefault(&b_info->acpi, false);
> > +    /* Trapping of unmapped accesses enabled by default.  */
> > +    libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
> > +
> >       /* Sanitise SVE parameter */
> >       if (b_info->arch_arm.sve_vl) {
> >           unsigned int max_sve_vl =
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index e03599ea99..38770eea5b 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -667,6 +667,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >           if (libxl_defbool_val(b_info->vpmu))
> >               create.flags |= XEN_DOMCTL_CDF_vpmu;
> > +        if (libxl_defbool_val(b_info->trap_unmapped_accesses))
> > +            create.flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> > +
> >           assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
> >           LOG(DETAIL, "passthrough: %s",
> >               libxl_passthrough_to_string(info->passthrough));
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 9bb2969931..e33785c661 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -736,6 +736,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >       ("vmtrace_buf_kb", integer),
> >       ("vpmu", libxl_defbool),
> > +    ("trap_unmapped_accesses", libxl_defbool),
> 
> I think you want to add a LIBXL_HAVE in tools/include/libxl.h for this new
> field.

Thanks, adding it in v4.


> 
> Cheers,
> 
> -- 
> Julien Grall
> 

