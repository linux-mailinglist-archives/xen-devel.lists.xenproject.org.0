Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60AACF4A9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 18:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007207.1386516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDlL-0006yD-Mm; Thu, 05 Jun 2025 16:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007207.1386516; Thu, 05 Jun 2025 16:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDlL-0006uw-Jm; Thu, 05 Jun 2025 16:48:19 +0000
Received: by outflank-mailman (input) for mailman id 1007207;
 Thu, 05 Jun 2025 16:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNDlK-0006un-Nr
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 16:48:18 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:200a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0160857-422c-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 18:48:17 +0200 (CEST)
Received: from BL1PR13CA0141.namprd13.prod.outlook.com (2603:10b6:208:2bb::26)
 by DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 5 Jun
 2025 16:48:12 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::2e) by BL1PR13CA0141.outlook.office365.com
 (2603:10b6:208:2bb::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 5 Jun 2025 16:48:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 16:48:12 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 11:48:09 -0500
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
X-Inumbo-ID: e0160857-422c-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APCmNb+QpUhZJB6Xg96ZWi+qOChMFqJw3R0YAccDVmWKjS8Zlk3HqzhAbxbDWMbyrI0qk0rjHliNZ6dqtKEir4RC3TVaKG6EK7T732yclMfyw804wZECFOsUVjhlA1wfta/Uzl3J//z+a9rMyznjUC5gpgQFhrxFstXZ+guwFy8nTLJGD/3YRqFAaXII12wZPCzWbGeRuF5JGGWXmzXIKHas6+BEAznwAnllWj7FyNgLnvftIFa92Znd6Xs1URddNLxXbWnxzLM7sVjMrEonMlnIsjmdq4TJuR/8WBS/PuuOQnOXe6qTnvOutdmlozDbXlOBqIYxvrRoO/kcXRGykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brQBMa16MGPBhDyBTlggoh/GIRLyydfBBwScQfBaSsA=;
 b=SXy2w8GRgEXd0HK3kRKhMW/blUex6qitkZzzVTK3h3xNWtgPi8uxwBX8QYqTX7dKeSrT9IhcYLpCMvEaO6nUm4fVhqW9QpEkZXnb/nJhI7fcsPXIaS1K6sjw41UP6qYopO+l0BWce0QsYUtCe9ps28ub9NJtPe+JnTNQpLfRzG81eVQ4CS+KRee/PmkhJEiO4zZB9U3Dc0BKNFOYWFBq1aCuvn/6Ab7Nw7EIQo+MrRdqVRblOKVVqYTDClyQgMq23uBmlbvRHLMwWDS5E+9cFXrrIip47FTp2FPDnWRXG5M++E5TUbGf65uaKYVzrrfP/CXxrwJpnBDBtljI4WdeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brQBMa16MGPBhDyBTlggoh/GIRLyydfBBwScQfBaSsA=;
 b=yGcqc70cfQakgeie9+Fxv5jtOETTd6wfLTT79X+uAC1kbUMLYHnOlGiRLNvumD6Cbdlp7yZ32TkUhrWxsgRh37JbJ7UHaRAOeHrNQYxQteSCcYBudNfaaL81sDH2EKh7Rp6kshqvVNvuZfQ0JzTUG0dXkk7mwKEdwSTMPYiSSSI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 18:48:08 +0200
Message-ID: <DAER4E9ML3N6.3IR8V47ATEDZL@amd.com>
CC: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-7-agarciav@amd.com>
 <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
 <DAC42T9A7DMZ.3P5GWMI89RZ90@amd.com>
 <daa4bf8b-3082-47c0-abab-74a103c1b6b2@suse.com>
 <DAENVFUK1OBR.BKRNCOBGBQ9Q@amd.com>
 <8768b970-6c62-4fc4-8ef5-b74f1aa650e6@suse.com>
In-Reply-To: <8768b970-6c62-4fc4-8ef5-b74f1aa650e6@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 5766f39d-338e-41dc-e491-08dda450c28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW8xYW1MOFk2ci9QZ0RBTDZvUEw3WUNsVUZXd2RSaU1IcnhvYndwT0dwdzRZ?=
 =?utf-8?B?L3prZ3JxeEhyUnFEVHVIeXdua1B0RHdXaGdmRjZzZEE2NkQrYXd6b0JyVFBy?=
 =?utf-8?B?bHJxZlFJZVRpYXRGdFZLallOMnNsUGRFaXQzOFJyaTloQnlEanROVkd5SHNZ?=
 =?utf-8?B?TUhDbHRZVng0dU05d1NuVnN6NnFYZU95b0MwUHhVR0JLSXQ1TGtKZ3ZqR0Ix?=
 =?utf-8?B?OGZyUFA4cC9zNDJUWk5zYU01dzNmU0ZqWUg3UHlxdWJQTGpsSUhRcEdXWHdL?=
 =?utf-8?B?Z1Vrc3E3bkJCNnNxOVBaQ0U4S0NBRzFqTEtSM0dCZEVQaTJ1VkF0cHZ6VzMx?=
 =?utf-8?B?ZjVlQUJmRCtVQnNXTXVIZjVrdnNjUm9MeTVpNnZvanJEOEhvRnJWSythdUgx?=
 =?utf-8?B?NGljQWI2eE1yS3hBc29vcXI0ZlMvSkdlNExadFlhS3l0VFAwS2VjbjkvcDVz?=
 =?utf-8?B?ek9HYWxFUml2Ti84M1JObUZJR0dRWHRsY3Q2L2F4WkFLTjEwRWEzN3pJY0Zq?=
 =?utf-8?B?d3JiTWNFVHlMT09UblprSDY1U2h3WHQ4QnZxaUpmN3hPM3djeHNRUEkvR3RY?=
 =?utf-8?B?VVo4NWpUTlU5RmVZM2pIUW8rdDNQeE81NHQ0NEU2MW5wY1VYZmJEckRpemVl?=
 =?utf-8?B?cXBpalI3MnZsSzFWcHk1dTQwNC9iallTNlNuK1d5VEtQcXZyZ3RPMldKbFh3?=
 =?utf-8?B?c05LOWx1NDN3cmt1N1BmZVhHenRIK3I1OUFnUCtTMERQaHBtVE5DZkFMYUJE?=
 =?utf-8?B?TVRsbDhTU3RuK3Z3RWxWN0RMMW05RStJMVVLU3NUL3BIOUNpdCtsajFsbzNm?=
 =?utf-8?B?SFFoOW5rUGNtUmNxZHEyWUtFaXlRb3k1NHpYWXFlZVVMNG9jQnRmdHlSK0da?=
 =?utf-8?B?bFVDanZBSVNETUN3emNKZ2hjK01VNnZyME5idkcwZ1czS3lmMU9wQWMyVVAw?=
 =?utf-8?B?Wml3dnptOVcyMVRFdnhRMGZGZWoyN3o1eHRBa0VIUG8xaTU5bU53amNIWTF0?=
 =?utf-8?B?djFBRWFteDRsdjRnQW1TQ2ZpOThIVmluZjJCbG9ZQVFiZ2dlWXc5S2RwUlVz?=
 =?utf-8?B?clRHQkxlMGdOLy9rbnBjRCsyRHcvS1A1NHZaSmpuRm4yUngyb3VBMExDUHAr?=
 =?utf-8?B?OWphWTJVK2VOc0Z6OXNiU1hBb3BMWmc5bEIvVmkzeEFVMlR2ellWTHZmaWRT?=
 =?utf-8?B?ckwyQXdid0JLOFFWd3NNV0ZPaStIRW1aS2IvT3lIKzIwTVZNNzlCSHJPR0lo?=
 =?utf-8?B?SjUxOHo5Y1E3ZXZlMmhXWk0rLzIwdlp5MXljTzF4QmtwRnByeWY5QnNSdlZQ?=
 =?utf-8?B?dzdYbTdsT1VFU09BUnRVVGhsMlc5T25hWDRDNU1lWE9EUDBhTkJyU3RGQ25k?=
 =?utf-8?B?QXpMb05sV3pzcUxoOU1EclY1U2xsVXVqK2JUcTRMa2NHZWFTV243Y3E0SXpo?=
 =?utf-8?B?bVYyZXB0czE3Q2FFS29UYm1pclJ3aVFsdDVhWEJjcndrUU1UVHB0UU1JVG9h?=
 =?utf-8?B?aERZWW9KdHE5aXNYQktDV1J4Zmt2OERZNUp4YTkxcXNrU0dBQnAyckVHWi96?=
 =?utf-8?B?UEFkTjVWS2FwbXdZRlJFQjhsekUrWCt0bW9xcGRzQkYzd3NaQzdURDVsWEVO?=
 =?utf-8?B?VnVBYkRMckNyWnJUUkU3V205eUFqcno2ZVM3eExvNUFPNTgvQjYxbFk2TVZS?=
 =?utf-8?B?U29FTUdNZXBkR1BMN2hmWU9VdUNnMVhOZlEwN1pQZlZCMk0xekMzbG05Y25O?=
 =?utf-8?B?REE0VFlQdlVmaVF5bUFSVEthUUMxSU5ZcjhINmo0Wi9aUEl3clhROE9jbkZq?=
 =?utf-8?B?VnFXTW1YWDdaMW1DZG5WUWNkNjNyVXN6SjhRaVErd0QybmpJOUFzNlBBTW51?=
 =?utf-8?B?Y2tSTC9ld3hLYlo2UG1JTWdLelB1T3ZBR2V1VFl0WHNMVjNCNWRqcDZpNHlW?=
 =?utf-8?B?U1ZuU3BFNXYzMitUeEZKeTBvMSt0WUxFVU9NaFNZbU5Zb0pTQVlVTTg5MzZ3?=
 =?utf-8?B?MG93ek1ZUlhqdy9sdml2Q0oxSXRCNFU1MmZZaWNLTmRJZzF5S0ZuUDBLZ1Yv?=
 =?utf-8?Q?7V4ZW+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:48:12.4137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5766f39d-338e-41dc-e491-08dda450c28a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495

On Thu Jun 5, 2025 at 4:20 PM CEST, Jan Beulich wrote:
> On 05.06.2025 16:15, Alejandro Vallejo wrote:
>> On Mon Jun 2, 2025 at 4:24 PM CEST, Jan Beulich wrote:
>>> On 02.06.2025 16:19, Alejandro Vallejo wrote:
>>>> On Mon Jun 2, 2025 at 9:51 AM CEST, Jan Beulich wrote:
>>>>> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>>>>>> --- a/xen/include/asm-generic/device.h
>>>>>> +++ b/xen/include/asm-generic/device.h
>>>>>> @@ -6,9 +6,7 @@
>>>>>> =20
>>>>>>  enum device_type
>>>>>>  {
>>>>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>>      DEV_DT,
>>>>>> -#endif
>>>>>
>>>>> Why would this enumerator need exposing on a non-DT arch? In fact I w=
ould have
>>>>> hoped for ...
>>>>
>>>> A non-DT arch would not include this. x86 doesn't.
>>>
>>> Both here and ...
>>>
>>>>>>      DEV_PCI
>>>>>
>>>>> ... this to be hidden for arch-es not supporting PCI.
>>>>>
>>>>> Similar concerns elsewhere in this change.
>>>>
>>>> This file is exclusively used by arches supporting DT to abstract away=
 where
>>>> the device came from. x86 does not use it at all, and while it wouldn'=
t be
>>>> impossible to compile-out DEV_PCI, it would needlessly pollute the cod=
ebase with
>>>> no measurable gain, because the abstractions still need to stay.
>>>
>>> ... here: In "xen/include/asm-generic/device.h" there's nothing at all =
saying
>>> that this file is a DT-only one. Instead there is something in there sa=
ying
>>> that it's suitable to use in the entirely "generic" case.
>>>
>>> Jan
>>=20
>> Try to use it from x86 and observe the build system catch fire. It could=
 be made
>> to not go on fire, but it implies heavy refactoring in x86 (particularly=
 IOMMU
>> code) for no good reason because there's no devices in a DTB to disambig=
uate.
>>=20
>> How about adding this to the top of the header?
>>=20
>> ```
>>  /*
>>   * This header helps DTB-based architectures abstract away where a part=
icular
>>   * device comes from; be it the DTB itself or enumerated on a PCI bus.=
=20
>>   */
>>=20
>>   [snip]
>>=20
>>  #ifndef CONFIG_HAS_DEVICE_TREE
>>  #error "Header meant to be used exclusively by DTB-base architectures."
>>  #endif
>> ```
>
> Might be fine, together with giving the file a name somewhat referring to=
 DT.
>
> Jan

That would bring it out of sync with x86's asm/device.h. Both of them defin=
e
device_t and doing so in differently named headers would just be confusing =
for
everyone.

Cheers,
Alejandro

