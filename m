Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B8AACC72D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004390.1384091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRFI-0005Gy-No; Tue, 03 Jun 2025 13:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004390.1384091; Tue, 03 Jun 2025 13:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRFI-0005FP-KN; Tue, 03 Jun 2025 13:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1004390;
 Tue, 03 Jun 2025 12:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NLa=YS=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1uMRFG-0005EW-U7
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:59:58 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2009::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a506bb9b-407a-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 14:59:56 +0200 (CEST)
Received: from BN9PR03CA0571.namprd03.prod.outlook.com (2603:10b6:408:10d::6)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 12:59:51 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::39) by BN9PR03CA0571.outlook.office365.com
 (2603:10b6:408:10d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 3 Jun 2025 12:59:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 12:59:51 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 07:59:50 -0500
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
X-Inumbo-ID: a506bb9b-407a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPZwajjFx39L0eaZ0CwdLZ02AV6SjOrarltq7bE7K7VP1dc/ORVPeaYT20ZbnpwFgUaj7agABOsZrJDyPduTLkOspE0Iv4L+/iqP6Vdsqu2X+R/zh2DTfUR6ncjJXJj0odRmJbVe831niInqTh16HgFP7Y+TkiY2y+rSHAW3vQIzJDYrxrueeIa2qcDhMpCb0AWthLAhUXV0Wdfb4yCXns2qjMDvqjLmfS6ZRsKwfTZdUYSjkWkkAJdhbT3LAaGiHaapJ1B+PZehhPYxc4hpKuzOLgsK9GeTU4hZPxyJB6GLNsZhmcMk98D+e8N+QvR4iyrRElayKq1jiOJTdtgW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDknBqx6r+bD0zEt/g92j+dwpHxuazo88oXLlU1/jfU=;
 b=inEI3BB7Z08HgHWnAeV3UsNZeSRvWfzY+JKlYPwU7pDsv07bxXgWojxNLsGui/FZ6RJZ1TI3/RITNx5FpMj8Xe3mG/4ykfD/RBuZN366IbtYaFWaOUqbaGcatPayQzLRj5dIOess3t/iwxmIwaZJAMSXhCUAXC3GSDP0SZ1cyg/bwLpiE4jwwPfmQxmlXWLxIDMcHsOreMOj+UOFcAUhfA1j3VCSZKdceDYFeN7CM/PqQMgeCDu11F0oBzZ18P9BKyWD5DnjMrefIAnoNW43nEnRANzTdIbPMN7uhsBFlWJ3aa5ueRyBkT8Iu1P8ytK5S0hH5WakCQYKxdUWmjhYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDknBqx6r+bD0zEt/g92j+dwpHxuazo88oXLlU1/jfU=;
 b=cTlqYStsSvvCs8YuOqgtVxL8Wt14EwPvDtyGL6z7CBVJeq7olsla3tyHcNa7YcyQDGS+xpuBD5u+6UeIQIhNOg2oS2KM1S1PQntd0/my/6HvXXNtqD9KuOY1PD9lXrreuc/FgloabCMNxL4W2fVoZ5YwTCeXiC1qAXZKeG7iTQ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 3 Jun 2025 14:59:49 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/5] xen/arm: dom0less: Add trap-unmapped-accesses
Message-ID: <aD7xxWhBG6Boap_6@zapote>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-3-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2506021535490.1147082@ubuntu-linux-20-04-desktop>
 <f62020d9-1cd5-4afa-ace3-98902526e58b@xen.org>
 <alpine.DEB.2.22.394.2506021555540.1147082@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2506021555540.1147082@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 784a01e8-40cb-418e-517a-08dda29e8751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vOfr4gXWgi0qjFuaItP7Ywfp4BL1fv1DMGHXITGtWUIeVmZTbybWh9zNnOkf?=
 =?us-ascii?Q?h82L0dgNOODpNNLeRMMG+urTX5E0k3k0FEwRgqA4KxV7J6pzQ26o7Hh+sHrj?=
 =?us-ascii?Q?0XSArb70RjWzKUtrYw4j65O6Byt+VTX14G9AZE3Vzg6b2CK9FpwbO7gIf8kv?=
 =?us-ascii?Q?x/m6D/+/6VNMtxxAjkA8p5iio0Ub6fNM1U//DqkKyY5mWC912F2HhdCYCG5V?=
 =?us-ascii?Q?ql1is5ZgnaTUxfWzfv5EwmXZbZS49B9V49NhZTF17UXwfftM43tVVP0qGyg2?=
 =?us-ascii?Q?ZUX+rkXLGadXnHy8lDIpmIxVR+IyTBRHawG+GX0GqN1HgFpCd+uj/tNGdhgl?=
 =?us-ascii?Q?by7KnWIC94TSQ09nvwyTS59RlbZ70MGmCKtRkHYAsSKhNjmgbO7u/ADER1fj?=
 =?us-ascii?Q?SbFAxWCCe72P8BIdKmsxkq5WYyjU9l0uOke0x2TakjYlyVWsg+Uw46jWz0j6?=
 =?us-ascii?Q?3Hvhho6qP84zG9rdmozPD1Ls85A5DdoTSEXWbeSU69YJPCHfj2+cKaUTasHh?=
 =?us-ascii?Q?axMBo41I592EJYx09+2VYA1mkt6Cg6ii7s+ZW6+dACKEEWgguJpr37e9E2b1?=
 =?us-ascii?Q?ezwSB7SEXl4GP/HMzCJE/FacUVXu5XKAr1qFk2Ectgn9idAZOAD854PUmUIZ?=
 =?us-ascii?Q?bPBiXLPy2pvbI9ezxzTwLrJ25bsVv+I9kkKCne5fIe11wDBF4PxesMcIbJWK?=
 =?us-ascii?Q?vungurhv/BFq1/781GQ3P7vNgKnnrCSlNn41rkcOucNr/0zDps0BGvpgVfow?=
 =?us-ascii?Q?qqHDk1cPjOdNzORXj5RQOP4fUAdi3mikop4hj86rIE0oQRNlgChBIIuGbxDB?=
 =?us-ascii?Q?RPaj4jCctjyHQiZbGz3TTeMD5ScZ4OLNjCv3vQNAibfqogbL8KbzJ0hSBEeb?=
 =?us-ascii?Q?yCqui//IyhKn39huDgfDKYZ9Rs0TOa8FDPDxSgyAX3eUYC0Vg48YFV6HvMH0?=
 =?us-ascii?Q?i97dD82Ozuowl7lCOHJWxTQkdM1bG4COdHn6rElUBiR6iy7O/Nc1t6ueMACd?=
 =?us-ascii?Q?JN+56i2Jz72LWOnDsn/c5EMuz2oDY4D8yulfTlviHZbuZbQfE4/+dzkDwLAt?=
 =?us-ascii?Q?a76oCkjg/TXyF+Au8e0UvXXpo9UIzeDeye1J5n7WZ77jcAdGXMPJ4v0TXL46?=
 =?us-ascii?Q?sTEonQiQlJhGHS44BVR9f0VFWfYh6I/bYxQj7/pUjoLvN8FJomq8oVOmJ6lA?=
 =?us-ascii?Q?5Gzdsfm1GXFb4uFuVqJkxzUPS8GkIF8RvQUmrpVbfpnZlXrS8NjlcLU8He1Z?=
 =?us-ascii?Q?lVqNuQmAfwBmVHe38+Jc8WEmmShEgL881gbVauvM/BWPhFif4fCdW5f0Zett?=
 =?us-ascii?Q?/jl2HITx34ibdzx5R0R4B9czU2qCymmQ6Y+71tNbBNvri2VXwHU39UBQPpOt?=
 =?us-ascii?Q?ly8p0Mnc+htzFLgN+zMo73ZkJnHZmqOTkULQ2tulGcS/DWfwl8fAPl4yYKK/?=
 =?us-ascii?Q?2NW2IEVp4JDku7j8BdeGCUgC5s4MmEv+0POMKzZfaFxoLQzBftzwz1slMDsp?=
 =?us-ascii?Q?2RFPJgqYZckq+cxh3klvMUtRSFyboAn4+jCK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:59:51.4833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 784a01e8-40cb-418e-517a-08dda29e8751
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429

On Mon, Jun 02, 2025 at 03:57:28PM -0700, Stefano Stabellini wrote:
> On Mon, 2 Jun 2025, Julien Grall wrote:
> > Hi,
> > 
> > On 02/06/2025 23:36, Stefano Stabellini wrote:
> > > On Fri, 30 May 2025, Edgar E. Iglesias wrote:
> > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > 
> > > > Add the trap-unmapped-accesses per-domain fdt property.
> > > > 
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > ---
> > > >   docs/misc/arm/device-tree/booting.txt | 10 ++++++++++
> > > >   xen/arch/arm/dom0less-build.c         |  9 ++++++++-
> > > >   2 files changed, 18 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/docs/misc/arm/device-tree/booting.txt
> > > > b/docs/misc/arm/device-tree/booting.txt
> > > > index 59fa96a82e..9add6440de 100644
> > > > --- a/docs/misc/arm/device-tree/booting.txt
> > > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > > @@ -225,6 +225,16 @@ with the following properties:
> > > >       option is provided with a non zero value, but the platform doesn't
> > > > support
> > > >       SVE.
> > > >   +- trap-unmapped-accesses
> > > > +
> > > > +    Optional. An integer that configures handling of accesses to unmapped
> > > > +    address ranges.
> > > > +    If set to 0, guest accesses will read all bits as ones, e.g
> > > > 0xFFFFFFFF
> > > > +    for a 32bit access and writes will be ignored.
> > > > +    If set to 1, guest accesses will trap.
> > > > +
> > > > +    This option is only implemented for ARM where the default is 1.
> > > 
> > > Please expand it to: "This option is only implemented for ARM where the
> > > default is 1 when trap-unmapped-accesses is absent."
> > 
> > I am confused. The document is part of "docs/misc/arm" and some options like
> > "sve" are Arm specific. We don't mention this is Arm only because the
> > documention is Arm specific.
> > 
> > I know that RISC-V is starting to share the bindings. So really (part of) the
> > documentation should be moved to common. Until then, I think it is misleading
> > to add "is only implemented for ARM".
> 
> Yes you are right. Maybe Oleksii or Alejandro can fix this, moving this
> file to common.
> 
> For this smaller patch series, I would remove the "is only implemented
> for ARM".

Thanks, I've changed that line to:
"The default is 1 when trap-unmapped-accesses is absent."

Cheers,
Edgar

