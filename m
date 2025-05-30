Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67224AC907E
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001141.1381340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL054-0003MV-Fi; Fri, 30 May 2025 13:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001141.1381340; Fri, 30 May 2025 13:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL054-0003JN-Bv; Fri, 30 May 2025 13:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1001141;
 Fri, 30 May 2025 13:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9pRJ=YO=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1uL052-0003C4-6X
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:47:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a2d703f-3d5c-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:47:19 +0200 (CEST)
Received: from SA1PR04CA0001.namprd04.prod.outlook.com (2603:10b6:806:2ce::8)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 30 May
 2025 13:47:15 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::ca) by SA1PR04CA0001.outlook.office365.com
 (2603:10b6:806:2ce::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 30 May 2025 13:47:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 13:47:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 08:47:13 -0500
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
X-Inumbo-ID: 9a2d703f-3d5c-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbsyxJ6az0do8uNT1sxfVt9i4wib7nGWKBgUqvLdA+hJsubhDIDqf/3WuQmJlbin8ctUDeKn8v8hHbPK4Zq65OzCFavV/A1VqqzS7vQ2FljL9sdoUjUoNLkABF4QyB4KaKxJZAHN5p1gURMb16yD9OuphTZQ4HxWxDy5HEv5OjJ01V9lq28vq9ZZ7lHhl41KUQlI+BF4oguLYqq8hf5kOVFHjy3iVYoSJyCXmrBrJrLxdMtBnpMdwVA8lLiNgkwBVCnABmv5snDTBjRbEyvQpP0IXDMZf+/mMyCGpB+JXAJOB2r/uy+Brpo4PnboxNiJqNMjeJzZU8tdxZ+VRxSwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvOIrJV1fjk5IvQMmXUd+maoM+MrcX4tQfw9ZQA5QzQ=;
 b=PX6ExR8TQiuh4khVdvj/lC8ulU++2qHJuyD4QlWR+A1+pncyJ40mQVh6Z6y5yOIC4ngTq3QDm+yRWbKpJbj+wsyId5ozMV1aZ6+1vwKHXWs/gwqQUe3vG2pG7FJWjYZp0WaD8ZTNJOtHI175xXbXjhNsNtiUpLuo8p9zuhSdI+NFJb07JpxfK+822DWslrZPQ12hIvQGG1Gl6UahclB2x88IaPjQQa57RHNY72/BcnjLZkM70x4B3ddTJ7G33ad6TBgWSmXq3CkJl3xfL9gtIHs2WrRUiEQj5wtTYPKF9iUAR6CDiX5Z9zR0wIjwUNfo4yv5a80cxQLWAfHMs8FWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvOIrJV1fjk5IvQMmXUd+maoM+MrcX4tQfw9ZQA5QzQ=;
 b=KBd17xQkaPtUcXqDgHQCsPCg9BoGXowtGbNl89Iv/0vpIdp+LNy/iZWynBOIqCFETv6fKtRyWOo1kYYJvXSeP8TmgACQ+UCxEQJTYrx5+KLwECfgttZDBdP2x7gmQgYqR+fuoSW8XJjqkkNACIgk1x4+dizmexRWOsb0AVsLfxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 30 May 2025 15:47:12 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
Message-ID: <aDm24MTIKvtjjHrM@zapote>
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
 <20250529155024.1284227-2-edgar.iglesias@gmail.com>
 <b77eb813-300a-4962-980e-02b236e2c5ca@xen.org>
 <aDiKHvtbApmT9OmH@zapote>
 <36dc6b2a-6dd0-4176-9f7e-a021a2427ed2@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <36dc6b2a-6dd0-4176-9f7e-a021a2427ed2@xen.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7b8e3f-6305-44af-3b67-08dd9f807bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kET3Knund1P/qHG3aUFg4UJlKBYC3jW7OVOfoS9fEs7PTTF/AAfLKxJutGTW?=
 =?us-ascii?Q?5cW449oDqrGOTU8KKAu6nvRZFoPoZI/EVOXMOFtuUz3TQYnFXIZMFo/qDMYn?=
 =?us-ascii?Q?CZi2aWDGZVdcr16zLyekeuYm9QTsmhp8quArlyXn8twvG/nCijTavuCSf+34?=
 =?us-ascii?Q?HX5hugQmzFxA0B6qzA3GNgcoDnie7WFmFFL9Hlx+fCwSo98B56JFV6HP55dC?=
 =?us-ascii?Q?kYoPWvVTaaUL7W5tkzahueiGSq2PYb1nMl9ZDRNt6JtH3cw+drqsRmCWlW6Y?=
 =?us-ascii?Q?cp9i0T6mEe1503NOG7Afu3zcBRTt6ubkijc0mNzK/Cl2VnFzIrAkJJKI0HmE?=
 =?us-ascii?Q?YPhqY7I4JPlJfqthum/ai4QzuTME1j/JE2plZH/6+MwhaA/IRCN1qlVyckWV?=
 =?us-ascii?Q?zPK5iLL39OTCK7NaOB9Dti6t+aWdZgkPx050iK2ZkeMTVbptHSk33B77rs6x?=
 =?us-ascii?Q?FwMETWS/111FM9Hw8rbaM5g2v8hJVlis8a1BG2yoNzmHG8mRKDM+z2UctIju?=
 =?us-ascii?Q?WOU9zZVYojWZQpzVAl2TDGqZ9GpMSTuxhD4QS10kVuztXd7Hahi4YMnoaKMD?=
 =?us-ascii?Q?eJo+5iwq+IehfMqetJNok2c6/Vr6A/L38uTdKKJ+hkTbJv6TzwIzZrpztO4Z?=
 =?us-ascii?Q?cIx1E7/pshzcHUtscJ17VNO+UzI9S47eDI5KRFZpgkt2GOwzJxoodKuSv6DH?=
 =?us-ascii?Q?p7mBHwWB6GrO2hguRIzTxYAWNMo6Q+umvfpTnq4ZrFyVKdY2dagc6Ad4ExAG?=
 =?us-ascii?Q?b9cLV1ZzYmtUleKSnoEyOzk9RcztpwmE9EoNeo/cRDcG+qO03Nxd2w5L4E29?=
 =?us-ascii?Q?p+pXCSUpk9Hq9bZxncoCm7hQc2uNm4vwuOigwTYgcs2Krqg6ccUUGTyX+xsU?=
 =?us-ascii?Q?4i9J8T1WZ+uotoKwvdXeqGaUZ8GlEsJnf/4sx89F5ZVrWDBMcIdxDmtADaQX?=
 =?us-ascii?Q?Xebcdp8dekTprIiQy/JwgZj3jpJZvV1InHquKg1bSXwIYRLzReAB04RUl40m?=
 =?us-ascii?Q?7yUBB3ezdlgQTeFeKSE9B7esADbfYyw7MuT/gXXF8e1DFaZvKP15gpSKGmeI?=
 =?us-ascii?Q?4Bt8w3cJS9+WrVGTl5XOompvNVv8ZR+k66wddxV8oG+UTbp4rRd9EYE+JT3C?=
 =?us-ascii?Q?p/zRaqtS8qc5Chkpjy/+ueeWd/cJE/SmHebTnxmoRU1LFq5lR4vaGPxNzctW?=
 =?us-ascii?Q?A1TGI9ZDdFn/X9mzMimSRItbyf7sdo1hEi9buL7vgaoDh4/Mi5BtYDqmEB2O?=
 =?us-ascii?Q?WabbK/KImtazylUSSTQoWQiQxV9IzpdVTi+it8rve4/BTZ7wsoe3uQfFQWe3?=
 =?us-ascii?Q?8fNivzOWlheGxAr4EL6MNHDjKuHpbeesYqsX369e3WWO4JYGor9/gGwCH2RJ?=
 =?us-ascii?Q?Nt+9ZE2ezLhRLj93eNi7m1PKFIzxPsEWufBQlAnmuty4bez9glQdIUEl1As8?=
 =?us-ascii?Q?SY9Rv33QNQJIir0iRwFJkVVFAfNMgPj2loJfqsMoPubHjUP6ZiVilWZDT7/l?=
 =?us-ascii?Q?ZAVYqz0Wl+rWzsSNk6Lr6wEjeXbOhMVAOab9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:47:14.0448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7b8e3f-6305-44af-3b67-08dd9f807bfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996

On Fri, May 30, 2025 at 10:01:23AM +0100, Julien Grall wrote:
> 
> 
> On 29/05/2025 17:23, Edgar E. Iglesias wrote:
> > On Thu, May 29, 2025 at 04:59:21PM +0100, Julien Grall wrote:
> > > Hi Edgar,
> > 
> > Hi Julien,
> > 
> > 
> > > 
> > > On 29/05/2025 16:50, Edgar E. Iglesias wrote:
> > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > 
> > > > Add a per-domain way to optionally disable traps for accesses
> > > > to unmapped addresses.
> > > > 
> > > > The domain flag is general but it's only implemented for ARM for now.
> > > > 
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > ---
> > > >    tools/libs/light/libxl_arm.c  |  3 +++
> > > >    xen/arch/arm/dom0less-build.c |  3 +++
> > > >    xen/arch/arm/domain.c         |  3 ++-
> > > >    xen/arch/arm/domain_build.c   |  3 ++-
> > > >    xen/arch/arm/io.c             | 36 +++++++++++++++++++++++++++++++++--
> > > >    xen/common/domain.c           |  3 ++-
> > > >    xen/include/public/domctl.h   |  4 +++-
> > > 
> > > Looking at the changelog, I saw you removed the go bindings (although, they
> > > were in patch 3). But I don't quite understand why.
> > 
> > I got a little confused. The file tools/golang/xenlight/helpers.gen.go
> > has the following at the top:
> > // Code generated by gengotypes.py. DO NOT EDIT.
> > // source: libxl_types.idl
> > 
> > 
> > So I got the impression that we shouldn't be editing it.
> > Should I edit it manually? Or should I try to rerun gengotypes.py
> > to generate these bindings?
> 
> As the file is checked in, I think we expect the developper to rerun
> gengotypes.py. Anthony, can you confirm?
>

Thanks, I've included a regeneration of the bindings in v3. If it for
some reason is not needed we can drop it.

Cheers,
Edgar

