Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980DACFFDB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008320.1387593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTnd-00006S-2y; Fri, 06 Jun 2025 09:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008320.1387593; Fri, 06 Jun 2025 09:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTnd-0008Va-0R; Fri, 06 Jun 2025 09:55:45 +0000
Received: by outflank-mailman (input) for mailman id 1008320;
 Fri, 06 Jun 2025 09:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Tda=YV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNTnb-0008VU-9l
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:55:43 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f04c62-42bc-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:55:40 +0200 (CEST)
Received: from CH0PR03CA0071.namprd03.prod.outlook.com (2603:10b6:610:cc::16)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 09:55:34 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::81) by CH0PR03CA0071.outlook.office365.com
 (2603:10b6:610:cc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Fri,
 6 Jun 2025 09:55:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 09:55:34 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 04:55:32 -0500
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
X-Inumbo-ID: 66f04c62-42bc-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQGd5PVRmF0qnee5IcahzymV9IsiSxcaUDaROc0EHMbtNULsHIQuXXVsATwB1OF3f5XBxLz7yh+Ls73L55fiXPC9fq73VgztdUJ+l0wxmwpUktEowWiGbaZQGN63vSlr5HJUTkzjB30+TiIpGELaB/thCFAEJKmG0EyJAfZzhP/qP30WfEJS/KZhVaL5RHAqLCtnsA+b/vRSOpQIItsIOstaMhrzvaJce7BjCwtfnzPi/MTVFyksMqlue6/3el5NOC1icR5KzJQXlC63qym9s7IDkWwEfbxcxOZTEOZuI/ftV4KdmAWlNwLNIeXao2NGo/PCVO633qUXYB8ApOikbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3sq9ZSeuYfZ6qSVtrYHI1s8YoEhXWX1JYfCFAdlAOY=;
 b=sAp1COQCz4TJLgLz1mb8fCVT19SOuQuyeZxnuyd7OU1sp/VXMX/CTQ2llXkf5cgzFG5jv5ByamLskyfbCQFUUsFGag9KxuTNLnYBRnQQJzHUewXia4KuYg/sQmBZdI/k1ceqnpdt1VWLcgqALWQM9GmkTlubXONOA+I2iCQXwMaewt1NPePncFKeivzQ973YaCljWe5GCBItrixd8/gY7WR8n+ecnqQ/g5FZz1r+2NAS7XWm1RK3Yrd9M4Gh52Gx45bynalv9odpULDmXwoP2Wei7vhGR5iSMwLs4r9jJhT4wRpHz+cSz5Vprq5IbuQSJFRW3fo8XqdsjIce2rjQAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3sq9ZSeuYfZ6qSVtrYHI1s8YoEhXWX1JYfCFAdlAOY=;
 b=eWJpGZEURSF6/75J+pUv2uDmKKUtNR7tjxbDsuTRRdgX8MgnzPpygZtnBZD9Yfb5rc/z7jxSBVG3n8UnszOuMFxpcL2+gKlfPFVjXrrnwQLL4EJ5buyk3WgoaSB2TRUVD37ONv3lyqrdgkKlhtBGS9tw8lyCLjVBj3lbwv2ln1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Jun 2025 11:55:30 +0200
Message-ID: <DAFCZ0J2JEVF.3TIHRWPDJA1PL@amd.com>
CC: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 01/15] xen: Clean up asm-generic/device.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-2-agarciav@amd.com>
 <38104467-fb7e-4aa3-9c78-0f9bf23183eb@suse.com>
In-Reply-To: <38104467-fb7e-4aa3-9c78-0f9bf23183eb@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 2877acb6-72f4-4bc0-6511-08dda4e04828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmI5VVB5SEtmTG1iRG93enc4S0lvYlZReHZxcloxVE1kWnBpMHE4TG9sVGw4?=
 =?utf-8?B?dXZ1d05kd25JNXZDcEZTM1RLQnY1MXVrZktCSmdtL0ljL1VRbTNKc1RXYjFy?=
 =?utf-8?B?bDdka1lhQ2g3SnhNSUxYbjdJdWU0YTNDWCtGWHFPSGVsdjRNcjVsUERnWWVo?=
 =?utf-8?B?Mk9lcFRIOUFRRGVWcy9NQ0p0MFpONXRGSXdORFpqNzVJYUNrS3hnSTVhUzVJ?=
 =?utf-8?B?RmFIWkpJZXlGS0JZWkdGTlYzQ0RldWtYeWJ5V3BEaklGZWdETkU4bENHMFdN?=
 =?utf-8?B?V29LazFTdlhqYTFTTlVKNzhwMWFGNlN1T2hmcDdQNGN2emMwY3lZdzZvNUhi?=
 =?utf-8?B?RzZSeVVxcDdXaERlR1lKL3FiUlZwem1sYzBHL2NVV1ZlNlo1aXR2cTYxN0RR?=
 =?utf-8?B?dWhvbjJSVDVrNXo5cXRkRE9GTEwzZ1BMN1NsN3VnZ3dMYndiSnZlU01IUFMv?=
 =?utf-8?B?a2RLcUtKUEg5Umc5d3ZnNnZDMXMydEtEVDVVRzFHMXNvZmhWUkxVaVRacE1i?=
 =?utf-8?B?bmJ6azA1bnk1ckJTblBMdUdpVFdhWVJmWCtiTXpxRjBoSFRYclZXSWVSeHN3?=
 =?utf-8?B?ZjdRU3EwQ1YwNzBaa1F3cGxyVE9LSzd4b3lSTjVJRFdNb0J6Rk10UnlzN24x?=
 =?utf-8?B?cmgrNjM2NU5QazRNbm1LbjY2ZmtwUWxqL1lGQm02Lytob2Mya1AvSFZrRndI?=
 =?utf-8?B?ZmpzeFVXVDYxZlBwc1hxbnpxVFhSeHV0L09yWUJhbU9UWURybHFXYWlNb1l1?=
 =?utf-8?B?UjZoZEpnK2NpVjRPM1d2aVNENk92aE1wRkJEQWJiUVh2UnNqd1FCbU8xcm1O?=
 =?utf-8?B?MVQ3STU0eGp4Z0dIdC81amhlVlJ2WURSWHhYMjM3OTFJZUJGTm56ZCt2NU9G?=
 =?utf-8?B?QzBwcjJnZmR2bWRPN0wyNXZ0bkllTnAyUUZmQ0EwOEpYTzVFcVFTTHNlV2NI?=
 =?utf-8?B?bFkxcnF2VmxNdVVqalFUS3hQVkZXWjNmckJQZEhxUExacWx2NU94V1UvM2dj?=
 =?utf-8?B?MmhlNjQwZnhYdWphWEF2K2MvUEM2OHRjOVAwaFVDZ3F2bHUrUVkva0FwbGZJ?=
 =?utf-8?B?VWVvYW9rZTkvR3FnMmFROHlJN1FQK2l6SFp0aVpCZEhRYnJWN1lmTTIxbzBo?=
 =?utf-8?B?MGxtejI5YzN3SGtXc1RKL0szRkR3VkRjYTJ4bkZrQTZoY0VxdlBLaWpvdGE1?=
 =?utf-8?B?VndlVk15S0RCMHgzNlhkUHdXcHNTdHR1K1Z1T1gvQ2VKNklhOFpuRUdzZ3Qx?=
 =?utf-8?B?R1cyQWF1SXNFWVFudlQ4anE4bEcrR29wVnZocFc5RGJ3MllxWEZwMi9YMkNh?=
 =?utf-8?B?cktzTEl5VHQrdzQra3lpYURXNzh5Ri91YTY4b3kzV2NnMm9ycWN5dnVhRzE2?=
 =?utf-8?B?T0k4SjNpQjRySkdDbkJtWmEwcW1TalhrNlNBN005QVV5Z0MzUUJxZkR0M20y?=
 =?utf-8?B?emU0WFZmSkxIZ3hlajlTK3B4UmpUMFBwS3ZMVEFKamgyTXJYRmMrYWI1bXAw?=
 =?utf-8?B?VU0yY1J3Q1JUL1NQRWxadzNtUDFlVXM3K1FralZwanhFZUR2K0pqY2h0Qlpz?=
 =?utf-8?B?Z2NhOEVmNnE1My9Id1g1TEU3SURTTVVZTm5SMmVPbTVjRE82QytIMXNTT1hK?=
 =?utf-8?B?WUNUQjVYSGl2MEJqREdOeHUrWlNIeWhTTFNhNDNNQktMeHZReEpSWHlkcUxN?=
 =?utf-8?B?SE43SUJOaTR5UHRrTWZwQlNGb3AvQVRmTVRUL0gzSDNvanFEaHdDcDZFOXNO?=
 =?utf-8?B?TGkzOW5zOHFQMGNZb2g4eGwwaGkwSS90UWZ0THRwTGJSYjlJREtxQkw0Y2Yx?=
 =?utf-8?B?SEx3d2QyeGVTQm9DZFB5UWdzNlYxdTV6Z0NwSVlLdFBxQjdJSHZ2Z3V2YVdL?=
 =?utf-8?B?YWo1NVlvcno3bVRLbnhOMVBremIzbVZrUmxFUTliT213M3RsMkFDdlo4NU5m?=
 =?utf-8?B?ekJod240TVpHc083eGI0MlRWVUc0UlJ2QkppT2tQak9FckhjZjd3Mm9XbWVT?=
 =?utf-8?B?V3dOeXFIVmxCZUZlQ1JnSVRGbURnT2VrNEtKUVd6Y3g0cHhhbW1majVlaTlx?=
 =?utf-8?Q?xJRGZX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 09:55:34.6183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2877acb6-72f4-4bc0-6511-08dda4e04828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849

On Fri Jun 6, 2025 at 8:51 AM CEST, Jan Beulich wrote:
> On 05.06.2025 21:47, Alejandro Vallejo wrote:
>> --- a/xen/include/asm-generic/device.h
>> +++ b/xen/include/asm-generic/device.h
>> @@ -1,14 +1,20 @@
>>  /* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * This header helps DTB-based architectures abstract away where a part=
icular
>> + * device came from, be it the DTB itself or enumerated on a PCI bus.
>> + */
>>  #ifndef __ASM_GENERIC_DEVICE_H__
>>  #define __ASM_GENERIC_DEVICE_H__
>> =20
>> +#ifndef CONFIG_HAS_DEVICE_TREE
>> +#error "Header for exclusive use of DTB-based architectures"
>> +#endif
>> +
>>  #include <xen/stdbool.h>
>> =20
>>  enum device_type
>>  {
>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>      DEV_DT,
>> -#endif
>>      DEV_PCI
>>  };
>
> My objection to these changes remains; as a generic header it ought to be=
 what
> that attribute says - generic.
>
> Jan

It is generic for any architecture where platform DTs exist (that is, anyth=
ing
but x86).

As the commit message states, these guards are useless, provide no function=
ality
and create the fiction that somehow this header is still relevant on an
architecture where only PCI is available. And that's just not true. x86 bei=
ng
the sole architecture without DTs actively overrides it, and relies on devi=
ce_t
(defined as struct device here) to be a "struct pci_dev" instead in
x86/include/asm/device.h, with dev_to_pci() and pci_to_dev() being irreleva=
nt
because device_t* and struct pci_dev* are identical types in x86. Removing =
that
override header is not just a matter of performance. All the IOMMU ops are
referencing device_t, while the drivers are assuming pci_dev, so all IOMMU
code breaks immediately when x86 tries to use this.

To be perfectly clear, this patch isn't strictly required to do DT unflatte=
ning
on x86. But it's a piece of arm tech debt that Xen is better off without.

Cheers,
Alejandro

