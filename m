Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240EA9EE85
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970499.1359174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MIZ-0007LZ-5n; Mon, 28 Apr 2025 11:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970499.1359174; Mon, 28 Apr 2025 11:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MIZ-0007IR-35; Mon, 28 Apr 2025 11:05:19 +0000
Received: by outflank-mailman (input) for mailman id 970499;
 Mon, 28 Apr 2025 11:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1Z=XO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9MIX-0007IL-Iy
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:05:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2417::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a94c3c4f-2420-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 13:05:16 +0200 (CEST)
Received: from BL0PR0102CA0039.prod.exchangelabs.com (2603:10b6:208:25::16) by
 BN3PR12MB9596.namprd12.prod.outlook.com (2603:10b6:408:2cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:05:11 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:25:cafe::86) by BL0PR0102CA0039.outlook.office365.com
 (2603:10b6:208:25::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Mon,
 28 Apr 2025 11:05:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 11:05:11 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 06:05:08 -0500
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
X-Inumbo-ID: a94c3c4f-2420-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2/G5O0qcSrHofL5elr+6oFqcEB/6Lr8PKTxtvdW4yaQmPvEI1mcEFEtDKzsVT1XYdRJ7cjwqj4NV09vJmDtg2oNNFVyPp4dCyp6TcIoEQ+QggTXVH8v+z+LStkyFxfxWT4HhdXe8UnjSv7ihFM6Rl3hBzeQ+AgULvrh8OA6CW6aFmQGQ2VZ5fK5G/5Rew9egAa4qTuSr64K/Melj3NgFzhztk/EuuG9ZMK9yHAG06oAUM0aqeDyujyCRSFnuYXJwOb6AosWO1iHXP5DJcDBLrY2vn89vu6xEgoPR6oNR13vOq2IBOO7rzrAxWWtO4bBotMv5V+VoNAuOmM/257Xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXu+t5vUw61xUGHFnAnZGPvjNSCX7BwA+lRXLFPTy0A=;
 b=s9hcOZs6VroCkXxYCc4ol9PKTrtLbPxotM9k+mGQ9/ELYb+YbIKOEB3NNI+49PT4WPSa1iIHFzEdlLS3RVD8mGAljwOQ7HTqeqBAkJyiffDJbVa6FXfFAQVYGb2c37My7zAb//F4uQWhbSLUprEOoWOkGq+PTUPKWJa5OaT/2rh/idlOVLIm8V/LrpHH3gdoG8hB/DGu3UPMsC57rRHQVwqJK8knXTW4KTPmJM+cloj57kTyN2NCSQwIdN32jQ2g3gannRCvjiQ04xJxiDKThko1baKsHdiugIxx5n9b+tTdY6fKLtSo/na6qtx1MkkdMY1G/MNBIbcg1EqbRZZQrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXu+t5vUw61xUGHFnAnZGPvjNSCX7BwA+lRXLFPTy0A=;
 b=axtu221n2p5DCmP3fAlBs06hD1x0BT92JQ4umGsFFrKtzmSbDz35ypleeGHRyN2VHZZDsFSCxXJsJ9MjHHsw833cxE9u4raEW8ipxSqKdQHFV+ywmUq5rEYA3VYqJFUaNz4PQ3JLzlKicp9fUTVtrQ4R33/4AaCRo7H8514Rj9M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Apr 2025 12:05:07 +0100
Message-ID: <D9I8127P22HG.1K10R2IU0VPO8@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v5 05/12] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250424161027.92942-1-agarciav@amd.com>
 <20250424161027.92942-6-agarciav@amd.com>
 <15e4ef59-183d-470b-b596-86f4b5e56bd4@apertussolutions.com>
In-Reply-To: <15e4ef59-183d-470b-b596-86f4b5e56bd4@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|BN3PR12MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: e841ce06-e4d0-4c88-53d3-08dd86448ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NCs1NitUbTFvcGRERmR2RXh3Z1VlVnJkTTJpVzdENjR4Ky9JZnJxOUxHMjZI?=
 =?utf-8?B?N09WWWx3b3ljb2lHZ2xDbWZOMFE4MmNISmZ1c0cyWDh5ZllncnpOWWNWTlJa?=
 =?utf-8?B?akNvRU8yYVBneUROdkptKzlxNjNnTUlnZGViRktud1BkSVRLZ2FYTXBLZ2xu?=
 =?utf-8?B?MW5vVU1GVHhRRTM4VUdUekpOU2tyS0hhU0EwakVHNHBEbGVRMkZtTHEyemhY?=
 =?utf-8?B?UDRDd0Q4Tkx2eUFxNk8xdHc4U1ZxaE16YlJMZ3pCMWo3bDNDejJjdDlWbzQr?=
 =?utf-8?B?VXZ4WG9rKzlkMU5EVDRFSWRzaXEvNjJEUDVrMXgrVzVZMk9FTU5qWDc0UGNJ?=
 =?utf-8?B?NUhmSEROOThzaEUzdDFaTnhYNGp2MEpHRzdhak0wOUx4d1YvRkUzVEw2WkFP?=
 =?utf-8?B?aEJvdStHQ01kdmZ0SkNrMnN3ZGQzcGpXMk50QWg4ZmJnNCtrd2JST1JrUDNF?=
 =?utf-8?B?VHN2eFQ3cGIyTm9VU3RqTkZuWUFZQU9VZHAyK2hrazU1TitrNms3bmFZd0pC?=
 =?utf-8?B?RlozNlhUa2ZDTkgwdnpXQ0xqemtYOE5mSHBmYzUzRU9KOHE4VUZjWkk3bzdV?=
 =?utf-8?B?dEYraHptRDRxcENRSXI4aGJoL0RPM0xMWGZoY3ZCcjFTaExZblRScGZCWE9B?=
 =?utf-8?B?WUxwUjFSaW90Ykpyd2YwVFhzQnUzcnQrcC9xS2VOYmtwUkpzbW1iWmZKZm9p?=
 =?utf-8?B?b2F0eVdmclVSaXlVeGpIUXBGcVVOQnNKcXpDbEwrQ1V3eWpxZ3hLYkJNYnZF?=
 =?utf-8?B?RWlxWFR2NXBXT3pDd2hleE94NUZIcWs3K3R4WjR1T3doYkZrZzVVSUUyMXV1?=
 =?utf-8?B?eTlpL0ZZSFlyMmd3YStLdXU3dTZYNUE2N0t1R3h5SlBacm8xMjBnKy91VnJB?=
 =?utf-8?B?cndIa1pnN1FnTWtidVZHZ1VoMDdTVWhiTyt2bVE0YzhaWDNqM3FlZWsvNTh2?=
 =?utf-8?B?Wldqdzk0TmJPRVBORWIzZ2pHdW5EYWEya01YanlLMUg1bHp1ZzBhZjY4VmZy?=
 =?utf-8?B?TnJWcHVGU2E0blV2b2ZWOTFNYXk3Q042cllUczJDUXdYUmNkd3lvVGdiMmh0?=
 =?utf-8?B?VUZ1ZXVTOGVBa1NDZUxUWCtGYWtGWDFEMWkrYWVseENsazNnK1NqWmR6ZEIz?=
 =?utf-8?B?NTZ5RDYxeGs5TlgzbXRodkNub2kxOHA4Q0NYTGMzRlI0UTB1S1h1ZUJBdTNE?=
 =?utf-8?B?MnlTNEMvTnRpNVpUUm85NUlNMXg1TE0xSUsrcUZPR2x2akFxQ0RBRkNjVUg0?=
 =?utf-8?B?ZENrakxsRWxiaFcwNlBZS1JhRmxDYmJPaHpoNDZ1bk1KQklHbTFkbTQ2blpi?=
 =?utf-8?B?YjJESmphOUoxaDNtejQ2cjJ5U2JpeVVDaTdLWmpNY3hzWEFFNEMvRmxNUXpn?=
 =?utf-8?B?aHRtNXFrbC9ZRXVQV0U4RlduYXBDSVBOYms4aWNVdjJjYTQ3Q2Zoa2hHVEo3?=
 =?utf-8?B?OTQrdWxyajJOVWxMcE5MTGloNGJWL0E5QkJaa25paDE2VzJrQjgvY09JakpD?=
 =?utf-8?B?VnRhZFRYMFlOVWRRUFJudFhyMThMS1I3dXFhZCs2TSs3Nkg5Nk1PZVhWUlRY?=
 =?utf-8?B?K2NFQmJnSXlVNHFWZ1VhRXRtdTNHYTllci9XZXdwUHZaVDRqRDlLaUZBNzA5?=
 =?utf-8?B?bXgvcy9TUS90dUQxWGkwcEF1YjdDWFlJWk1oZlNQQ00yMmQ5QllWa1Rvalc0?=
 =?utf-8?B?QXhIVkV3QU5ESjA4TUZjR1hsZytaMFd5VHdPRjNJazhUd0JGODV0ZDgxOVFm?=
 =?utf-8?B?V2s3aG8rOWphRXFqZEVvSnJnM2Q3dmVlV2UxV0l1REZDa3lKR0FJczRxelJn?=
 =?utf-8?B?NkdmT1JUWVJZTFdaYlRMdExmY2lKRWxXVW9oMmQ2TFEzVDZqS2M3ZUVDU3dp?=
 =?utf-8?B?bFZBM1hzbDNsaUxPaDJXQ1hEK3huZlFXcjE1M3JKQzhQTEozRWNuUUMzTWJT?=
 =?utf-8?B?bEhsNXUycDVyVTU3MUpqZ2l3L3VGMWpQL3NhYnMyT1FoNlQvWGhGU2dMSVho?=
 =?utf-8?B?MXF3YytzY2Y3MXZWZnJtVTVEa1FRcVhIRTJwYnF2QThCb2ZVT0xsZTRXUUZm?=
 =?utf-8?B?RFcyU2k3U2tMZmhaUGVHUGlnWEJFWHk5UTBsQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:05:11.4547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e841ce06-e4d0-4c88-53d3-08dd86448ba1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9596

On Fri Apr 25, 2025 at 11:32 PM BST, Daniel P. Smith wrote:
> On 4/24/25 12:10, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Look for a subnode of type `multiboot,kernel` within a domain node. If
>> found, locate it using the multiboot module helper to generically ensure
>> it lives in the module list. If the bootargs property is present and
>> there was not an MB1 string, then use the command line from the device
>> tree definition.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v5:
>>    * Add domain name to the error path on no-kernel.
>> ---
>>   xen/arch/x86/setup.c            |  1 +
>>   xen/common/domain-builder/fdt.c | 64 +++++++++++++++++++++++++++++++--
>>   2 files changed, 62 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index bd13d9d196..7e756302ae 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1290,6 +1290,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>           i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>>           bi->mods[i].type =3D BOOTMOD_KERNEL;
>>           bi->domains[0].kernel =3D &bi->mods[i];
>> +        bi->nr_domains =3D 1;
>>           bi->hyperlaunch_enabled =3D false;
>>       }
>>  =20
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index 11f0436e85..662c715483 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -99,9 +99,9 @@ static int __init fdt_prop_as_reg(const struct fdt_pro=
perty *prop,
>>    * @return              -EINVAL on malformed nodes, otherwise
>>    *                      index inside `bi->mods`
>>    */
>> -int __init fdt_read_multiboot_module(const void *fdt, int node,
>> -                                     int address_cells, int size_cells,
>> -                                     struct boot_info *bi)
>> +static int __init fdt_read_multiboot_module(const void *fdt, int node,
>> +                                            int address_cells, int size=
_cells,
>> +                                            struct boot_info *bi)
>
> Shouldn't this belong to when the function was introduced? Though=20
> looking there, you push it out into the header? Guess the real question=
=20
> is it static or not?

It's to ensure MISRA compliance on the previous commit. See:

  https://lore.kernel.org/xen-devel/173f7129e82958a9737627129ac3c5be@bugsen=
g.com/

Cheers,
Alejandro

