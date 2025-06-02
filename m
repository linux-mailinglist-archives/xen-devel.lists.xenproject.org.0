Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC72ACB034
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003435.1382987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5jS-0003Vp-LJ; Mon, 02 Jun 2025 14:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003435.1382987; Mon, 02 Jun 2025 14:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5jS-0003UO-IS; Mon, 02 Jun 2025 14:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1003435;
 Mon, 02 Jun 2025 14:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM5jR-0003UI-BZ
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:01:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2415::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a087b87-3fba-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:01:39 +0200 (CEST)
Received: from PH8PR02CA0007.namprd02.prod.outlook.com (2603:10b6:510:2d0::18)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 2 Jun
 2025 14:01:35 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:2d0:cafe::b4) by PH8PR02CA0007.outlook.office365.com
 (2603:10b6:510:2d0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Mon,
 2 Jun 2025 14:01:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Mon, 2 Jun 2025 14:01:34 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 09:01:32 -0500
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
X-Inumbo-ID: 1a087b87-3fba-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chy0kpLjGVdV8WkiiBwAegRUIvwCVNk9pivzdoh/iYVxMgGzqQCjIlCy4jhEXy1q5/y5kMRyjb5xbn4Y/J38gGWAPLWkGiQENJwB7c09SBxP2a5iQpPtrG5N2UoOa0NzSZVjmwA9RbkH5mTCSq/segOZ0ZX+oytA08arlwuvazDTF6BvigsG7gxXOsQpQ5ay/g8lKiWbHPvHM1XnWL2+nV1oV1uZZuGWoqCyHOTI9QC45BZDjFDZLT+IE8j1gHwsCe2R6AtXe34T5IUjUvRXA+y9LNK4xJlY96MjsXE5zOsAGvjOsOlXRpwkqjCAsAWOKT5Q7ZhqseSw69lLfSkWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ld1S+SP5zIa3cFaYHbDba9acNH4nT5mVLdFuQSLkneE=;
 b=CXtZzVtwqMg4K06Tnh7PyPReoaF8z55SfFITVuNcabGhhYTjWUO0Rvo3QFQwdAFNmMU19dMCOQAKu0ODzdsZI8BWhqpHMqTlT36ucVxW99ufBjq4SDaoBf4RUVCNtd6BeTiztuehA+xsLQ8exFPJMUtQX7k0At9RCd88IZxpAnSMBdG9a2acHP+V30zDqbPHFd5tFef6Y0wRnj4CB2+NHp54U71hBhnik5FHPgECcu3Qa6ZueLViUjk1oWWCZ29S48OOrrOiv1HAvsn2wei92BQpNxc01gus9hLbc+TT2gi5RTCjBNwjL9h4Bwy1SWLpq44EgfeVC/401NAfnU/b5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ld1S+SP5zIa3cFaYHbDba9acNH4nT5mVLdFuQSLkneE=;
 b=wLjLxHZ83JJAYid29JII/O8nIl/fKkkR99SWDdiozPMAR22t6Avb2uc3HwXcpIZxR1l1DlmH7/vw7OgCrWQ0Q13OzPol5xQu0uMevIrbNijCvjmG+sT64nwm4HCPXN/TIeYiTfehGJ7/X3DKOqOPFeFHhE1hXZ3dIxo7pykIhAI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 16:01:29 +0200
Message-ID: <DAC3P68QEAEJ.1GIQFC7FRHKXE@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/19] x86: Add missing pci_dev forward declaration in
 asm/pci.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-3-agarciav@amd.com>
 <680c7ba4-e4f4-4fb9-969d-ecaa206e37c6@suse.com>
In-Reply-To: <680c7ba4-e4f4-4fb9-969d-ecaa206e37c6@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 899cb75f-f14b-4b69-8455-08dda1ddfc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnZJZnozb2NucHk4VEtNUlhMb3Q5UjhNck94amJVeUlsV2ZzM3R0Z0FQc3hZ?=
 =?utf-8?B?L2NydmpxTGxWSUhzdUFGdndJdFNlN3lFeEtMNlVyOFcrS2M1MmhtUEVhcW9X?=
 =?utf-8?B?TlRRQmdLTE5GTFpHVGF0S29DV1d3eVk4QTV4UzZKWTNyTGtOZUpSQy82RDlS?=
 =?utf-8?B?bG0xSng2OER1a0hOb2x3T1NiakhxNGc1U2pQM0ZLeTg3SHVwd1d0UGNMcjZP?=
 =?utf-8?B?Nko1K1VQL3RXdWpSU0lSMGh1cmlGcnBIZmwxK2RUbWpvMHNIYjR5Yk1LK0xo?=
 =?utf-8?B?N0lLTVRLbkJIbTBEQzhqREFpOXEwRFhlQlJNOHhsYmN0YmxkV2RkZjlTQUNV?=
 =?utf-8?B?WkdIWDBQeERDa0VIRXpVZ09FeG5keGkyblJ3cWJBenM2eWNYQ3J2TytJaEcz?=
 =?utf-8?B?VmhXaXkzMERUcTVOaUk3UExzZyt1d05wZzYrSEVZOU1PS0NBT2dvVVlxc0hi?=
 =?utf-8?B?NVB3cVlTSUR4b04yQjFESFF1N1RLZ1M4WEtxYnlqd2YxTm1ZQnFjUkdCNEZB?=
 =?utf-8?B?eGpVTWUxVHhLUEltNEFCNXd2TFNVeVRMLzYvT0YvUmJDa3dVQndLUlR1Q1pp?=
 =?utf-8?B?R3lrdDBBMlhBNHA5U0Fhdk5Ndzl5KzRyOStFdk5DUnh1ejVpUDQ5U2xLTkVx?=
 =?utf-8?B?cWNzRVlFMHZQcWFhSDdRM3p4ZFNFRldmM2VuUysxUGx6SHNYQWhzTzZZT1Zk?=
 =?utf-8?B?TTF3UEZhL0dHT3FyTUFtOUI2QUtQaGhUUHVCMEpUSnJlSG51UkprN3B5Nkov?=
 =?utf-8?B?ZE5LdmVKZno3OTNWU3QxTUpxU0dzb1JZTmxDSzRBaFluSFdZVnhEb1BGb042?=
 =?utf-8?B?WHFqZlJETWhTTlplZTU2SHJpQ3FCOVF3dmJ4d3FjWFBIRVd1cGtEa1JORDRE?=
 =?utf-8?B?MmhRcGFITzR6SXlod0NIRGtnNHFJQllsdWp0UmJCZXpKSEc4OHZjbUxkMmVm?=
 =?utf-8?B?L0pIZ2ZIb0VXSFNwcUl1Vm5Wa3A1WEpkZTFqbUVReU9mSEpHYm1pbVJMZjBw?=
 =?utf-8?B?ZjJJb2FCWWM3TU9HcTcyZW9tSVhDTE5ma1R0REVQRDc0bHNUUjlUT0RIcytq?=
 =?utf-8?B?Wld6L0hqQlc1RDFUQzUwbFhZbkx2NkQycWlHTHVmQVNKb3hCUWVYYTlGakxn?=
 =?utf-8?B?UlU5ejJKL0hWZGgzVWl0TlJHWForT1NVZi81TnZEZUk0YThCaXZ5VWRPejRW?=
 =?utf-8?B?UUNhQXlKZVNWSlJxTzlZTFRUSDRWS0xGb084eDBlQXRyN09TblpmWXFYTWY5?=
 =?utf-8?B?dzZZc2ltYkVVWWFaRWsxc1FQL2xvUnVSRmR1M1Brakk4azFMUjVUaVE3dFpC?=
 =?utf-8?B?U0FEeTZlUjdxUXVqeUYzYkJ1YlJrVS9tVEpVL1c1K2ZrZmRXTFFsSUZXUXI5?=
 =?utf-8?B?QW5BK3ZxZTduRTl5MVdpeFBERklhL1ZyNXRMMXNrQUkybnlyRnR3dGp3eHV5?=
 =?utf-8?B?WHBaUmhkMWFZK3FFSHgxb3YvSHpTanhObXQ3TUk0SkFpUUFVcFlGcVFKUEhV?=
 =?utf-8?B?dHNIakI5b21vaHdTWXFqK3lQQ0ZCMnJqYUswcE85dm5DdUdZdHRqQldJNlJL?=
 =?utf-8?B?eDRYZ3gvT0tkZzBNZDZ1ODZVRWdwZGVhZHVwcXV2QUpWcU5rTUw0QjhEUDZ3?=
 =?utf-8?B?ckZmYy83N3Nqa2VjcHZFdTZXY21IVzFVSHdncUdhVkFpK3hDMGw5bkRFaTVE?=
 =?utf-8?B?bytyVG4vS0FSRXFHYk1DajFDSnZQRHo3czhFYU5JL0dFR2NUdFlMamVYMjg0?=
 =?utf-8?B?N1BoeGFhaHJVWjhLdFc3STdVNlpzcUNwMk9EYitXOURZVGIvTWh1SDFhR0Ru?=
 =?utf-8?B?RVQ4a0cxb1JSdjZUVmw5TFYyWlllZmJzUE9YS0E3LytnK0xjUy9tTElMZmVs?=
 =?utf-8?B?Z3pNKytFTW1jRE5JTC84M2lkRXNrQ1lsNXJIVUlCb3UxWndRRmFZMTArMUNZ?=
 =?utf-8?B?UzlRUS9ESnozUnpwd3JuUkQwNkhGUWVHM0RIYWxYNE1QRkhBQVFwTHk0c01t?=
 =?utf-8?B?MGNwUmlWV1FYeUxWajVZWFBPWDE4OTJkMitmRk1xd2hUYXFwUkFnYm1yb2g5?=
 =?utf-8?Q?3rk5qg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:01:34.6949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899cb75f-f14b-4b69-8455-08dda1ddfc3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999

On Mon Jun 2, 2025 at 9:48 AM CEST, Jan Beulich wrote:
> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/include/asm/pci.h
>> +++ b/xen/arch/x86/include/asm/pci.h
>> @@ -13,6 +13,8 @@
>>                          || (id) =3D=3D 0x01128086 || (id) =3D=3D 0x0122=
8086 \
>>                          || (id) =3D=3D 0x010A8086 )
>> =20
>> +struct pci_dev;
>> +
>>  struct arch_pci_dev {
>>      vmask_t used_vectors;
>>      /*
>
> Would it perhaps be better to put this ahead of xen/pci.h's #include, thu=
s
> helping all architectures?
>
> Jan

You mean include asm/pci.h from xen/pci.h ? Seeing how arch_pci_dev is here=
 it
must already be transitively included. I could replace all asm/pci.h with x=
en/
pci.h instead, but this seems strictly better so you can include asm/pci.h =
when
that's all you need.

Or did you mean something else?

Cheers,
Alejandro

