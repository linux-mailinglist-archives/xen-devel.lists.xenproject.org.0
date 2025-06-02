Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C950ACAF56
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003391.1382938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5Tv-0006Jn-9y; Mon, 02 Jun 2025 13:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003391.1382938; Mon, 02 Jun 2025 13:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5Tv-0006Gq-6M; Mon, 02 Jun 2025 13:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1003391;
 Mon, 02 Jun 2025 13:45:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM5Tt-0006Gj-FC
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:45:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2416::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dae1bd6c-3fb7-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 15:45:34 +0200 (CEST)
Received: from DM6PR06CA0039.namprd06.prod.outlook.com (2603:10b6:5:54::16) by
 LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Mon, 2 Jun 2025 13:45:29 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::f1) by DM6PR06CA0039.outlook.office365.com
 (2603:10b6:5:54::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 2 Jun 2025 13:45:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 13:45:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 08:45:27 -0500
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
X-Inumbo-ID: dae1bd6c-3fb7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBR0+8L3vqm+K7vs480inmY2pLH2sgGOr2BtB1ZqR18p5KHjmFJv8DjtnxF9yX550orVlN0tnfUoxGb2iAyf46VR4NdHjOrkgZ4PINpWm06fjTVwYYEHEnP0VRHDZUij1QkDhV5tLN8QVU5Qabr+hoG7CCgJNzlDU2Yu4YSZVxnBCnuzkxOsmqpj/ajb2KIJwys6xZm0fOwTOsz7eQjXI2Js+KQnvF9v0GTa49jwew9YWEysCgfE2VnJkbIwRtfTGwPpQQcIhhw3fdqN8tulGAjOT+lMbHp7F0oP5VFu/eC9p6FUdj2m99p0CPFmwlD4duf2go+5H66EPeCPS4iWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfnnRzDw+6tDzTcBk1dZpJldnwaZ1kJT2h30g57b2tU=;
 b=W9gmTRBGS6JIqD15k0o8PAhoIdahWxug+JF9iu8+XEXy3tp9E4fjL/DKNi1ZAgRLddhWNe0pX75O97wgZuaThDZQQPEs4rP3yhefmCmaAZza3yKNiLHylQe1jUVwZTFMXty53J3oCdS0wg1dxc0IIPKNPOP4XcoBF24yFmo9zYZvA8Cx0yhCh3Zq/Oq/xwZ7+e24VSPdv52ZG4Cmhie9fAne57FV2wtJLWZzyDOtKi2oS5l9XsgzDvpOuVz8V+wjAE4Qm0UbGhxyHazFmXJG+zatzpl7XPiGUpBVQ1OkaYEwavwTdIpfYnnMrQwwPtF4mQurue2hmpRaHNn2kKBGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfnnRzDw+6tDzTcBk1dZpJldnwaZ1kJT2h30g57b2tU=;
 b=rSChZk62YJctp+zRJE27EI9xk/nDGARSwFG/+C+xpBLP2ZQfv0UzGQ0QHOX2srXnmYXEzVYEd4kvdIhX5VzXTsszm9u/lxqAIbgZP1LxfvFI06Q8KTXzVXxc2t1/GHlvuXPvuv/zXLW8BDmOBiW0LKmxau/crzj0H7kDY/KchpY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 15:45:25 +0200
Message-ID: <DAC3CVFT8BOJ.14O7AZHYMIEQE@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 02/19] x86: Add missing pci_dev forward declaration in
 asm/pci.h
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-3-agarciav@amd.com>
 <9b5a1599-d8dc-423d-b144-90bfe33cdae9@amd.com>
In-Reply-To: <9b5a1599-d8dc-423d-b144-90bfe33cdae9@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 648d7dfa-7f5d-4d70-a64d-08dda1dbbca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDJWTlp4eU56K1QvSmMwWUxSYXZqNG5LdXpzR3pnRVJOaW1HbGtNaStHSFg2?=
 =?utf-8?B?OTZVOEYrMXMzN3BMUWZWY1hJYTRScWcrM0p3MXU5Q1pnd2YwU0JKcEUweDY1?=
 =?utf-8?B?YVRoTDljNFY4Sm8xQkpCbm8yc2MrdjB0WXd3bXE1V01nNkF6V0wwblE2VlFs?=
 =?utf-8?B?WXJERldmaEoyMkRxSlo1dVhQVzcvN2pLMHY1bG1SbmdNdnplWHZiVVhMWEgz?=
 =?utf-8?B?RGloUSswUEk2SUNCMGZkUmJBdVVsWjJlVFdNaEJFM0J0bHU0cmZYSDlpckVQ?=
 =?utf-8?B?ajdSdWVjY3VTTkQ3VEpLR3hIT1lndDYzWlhMdXcrc2tBTzZuSGg0cndXSG50?=
 =?utf-8?B?bXpPbjV1NUNPMVJ5alMvMm9HaDN0MlloRnVEaEJJMlpISWNoQm9DUW1jSDNL?=
 =?utf-8?B?blFvT2RpaThvdVFDTVhCdmw0MXNyS20reENzR1k4dkdVdUowOENZblBCVGVt?=
 =?utf-8?B?ZEtnblJOelBidUttWDhEZkVGaVhtN05yb0Q0ektmL216dUIvTUg0cjVRSVlF?=
 =?utf-8?B?RkIrQlo3QkNQZlN3NVNtMVFMdm9icVZOaWkyTUJSTlVkeHFhQ1A5NnY0M05l?=
 =?utf-8?B?NkJDaWhOcUE3SkNjdVRuRDRMTU4xcVkwaHlDN0tzS1NzOTcxNHJSNjJIZlVR?=
 =?utf-8?B?ODRrYzZjbTd1T1VBR3VqQkNzd0UyK2FTRXpWZTlqdEZxMDV6K215U2lySTlk?=
 =?utf-8?B?aDFZZWx1UGlhVHMwSkpvdXloYUtyaWtRQVFWd2JIZE0vaTIweWYxbGJ4cEM5?=
 =?utf-8?B?NEFUdnd5V05FUmJ0cVI1Tk4yTWd4WGV5NThJRmZFYkk4VVZMOUtvZms0eUpu?=
 =?utf-8?B?ck9yRFl3WlpwRlVhNWltTE1WMUxpaTRJbkRWOXMwSm1BYkFKSmpXcFJ6b3E2?=
 =?utf-8?B?YkNCcEdOS0JKMmNvZnlzaVAzNExsVjkzSXk4R2pxY1VZeTJKbkNnRk83WGg3?=
 =?utf-8?B?ckQxVzNXaXoxL3dnanRMcjcyOU9EL3h0N0ZJSkJid2k0K0lhcmpOZE5sR2RJ?=
 =?utf-8?B?ZmV6WmtwZTc4N2JTYXljVnlTcnZUdmF0aXBpdlpDQkFLSFhxZmZSbnZqM2k0?=
 =?utf-8?B?bmprai9veEpYYlJZaVAzMkxZY1RtTTQxd0ZscUVKN3lUb3NzZGJTaVM4aDJ6?=
 =?utf-8?B?TDZLR0JYL1Zham1FczYrL2JETG94Y3lnTFFTZHFZc3hBekYxOVluL0ZWcVho?=
 =?utf-8?B?UFZLVWZBSzRkbUhLWFo2cVpjNXQ0ZlFxSXlvSWpMSHNyREYvR3pUMGxxOUtL?=
 =?utf-8?B?ZEJEQ1RCbHAzUVdQV3N5MGpsaXA2ZDhmdU9rYmVLc3lmTHJZdkpsc2xiU0ZL?=
 =?utf-8?B?cXB0YVNDY2Q2OHR3eExucGozME15ZFFSZ3V6U3k5UU1yb24wMjV2cXE5UTNk?=
 =?utf-8?B?WkFlVTdodjJsMWJDMlhZOCtiTjhBeXZOMDg4OFI2cldXK2VaYlpoYWVMSXlu?=
 =?utf-8?B?SHZLbFZUQWZ5QXhJVHVBS0VhTVFWazEvbHNsdHN4UWpYbThHUjVna3hBeS81?=
 =?utf-8?B?ZDlmaFdOeWhpTnY1d3ZINTBVVHVOclpqOG8zdmZzWDExZ1U0cG85R0JET1FP?=
 =?utf-8?B?dWE1dkdHNmxyM3daQXdkblZ6WldBVGJOMXFWODg5ajdCd0cxS3JPbHcvbXVQ?=
 =?utf-8?B?cUNpenNPbm8wbmt1MkVnd0ZQMWNYL1BZSzcySko5aklxd2xhS3hJd1hXaDkx?=
 =?utf-8?B?RU5sSmFqRWFXNy9JNmsraEU0MXdNL3ZDVWJXZ1RIdVhMK1JVaEczS1RLU2pF?=
 =?utf-8?B?ZWkwWEhUaTdmaDlhYWdRZDRRQ1lyWDltQVBvZVF6bWEzZnNQNHlsMWNndzZt?=
 =?utf-8?B?V1c3czJ0MjMzYlB1WW0ydWk5R3JVcXhlaEhETmZzc2hzZTB2VmtBVGNJQnM3?=
 =?utf-8?B?d0xDVXJDRzFSMm9LdXJxWVN6VHlSbjkvcmk4NmRjeFFkNVBzOVZ6ME5nY29G?=
 =?utf-8?B?YnlCSENsQXN1alJreURBTEVkZGd1STlQVW9LVTJBaTRPRzlTdUxNU2s1ajA1?=
 =?utf-8?B?YkNWcFM5VkJQeUcrMXhYZjFsUkxHUWd0MEVuQWpDbGVnZ2VlbDVHbUhEalJ0?=
 =?utf-8?Q?T3+mox?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:45:29.0551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648d7dfa-7f5d-4d70-a64d-08dda1dbbca5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822

On Fri May 30, 2025 at 11:04 PM CEST, Jason Andryuk wrote:
> On 2025-05-30 08:02, Alejandro Vallejo wrote:
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> Some sort of reason would be good in the commit message.
>
> "struct pci_dev is used in function prototypes within the header.  This=
=20
> is in preparation for including (transitively) in device tree"?

>
> ... I'm guessing that is why.  Stating  it would be better.

Yes, but I'm not sure the second part of that explanation is relevant. Unle=
ss
specifically noted in the header, they are meant to stand by themselves whe=
n
possible and not require preinclusion of something else (in this case, xen/=
pci.h).

This patch would still be relevant (imo) even if I wasn't using the header =
for
anything.

>
> With a suitable reason:
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,

Does this sound reasonable?

  struct pci_dev is used in function prototypes within the header, so it mu=
st
  be forward declared for asm/pci.h not to depend on xen/pci.h being includ=
ed
  first.

>
> Regards,
> Jason

Cheers,
Alejandro

