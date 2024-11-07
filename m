Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299FA9C08F3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 15:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831863.1247248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93ZO-0000bc-Bp; Thu, 07 Nov 2024 14:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831863.1247248; Thu, 07 Nov 2024 14:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93ZO-0000Z1-8f; Thu, 07 Nov 2024 14:33:10 +0000
Received: by outflank-mailman (input) for mailman id 831863;
 Thu, 07 Nov 2024 14:33:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1QHo=SC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t93ZN-0000Yv-B5
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 14:33:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2416::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f63f5d3-9d15-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 15:33:00 +0100 (CET)
Received: from MN2PR03CA0024.namprd03.prod.outlook.com (2603:10b6:208:23a::29)
 by IA1PR12MB8189.namprd12.prod.outlook.com (2603:10b6:208:3f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 14:32:51 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::52) by MN2PR03CA0024.outlook.office365.com
 (2603:10b6:208:23a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 14:32:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 14:32:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 08:32:50 -0600
Received: from [172.25.174.226] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 08:32:49 -0600
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
X-Inumbo-ID: 2f63f5d3-9d15-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjFmIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjJmNjNmNWQzLTlkMTUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTg5OTgwLjUxNTQ5NCwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlSmXbHXlTVDvFHHbfkSo1WPh94+/kCZHJDNPQBq6mTqugnt6afoT6KeVHy7QXIraqUb7dfRAR3WljsAo8NdITJ/85zelrOy1wosX3zxtHNhz0WjwyPhOfIAQmXjGNe3OrM/mErn2RklTmkAwDX1HRgTwE+FWZ+ZTHZycHHUTO/tpzg9shk5IjeO9k2TzamwcLBDMAwUGZEiYnlOOmLf5+UbfTS8veN8Eqqbh+YtVUj/Kj2FFMB6Ux2mgbysnTj9TMHExnb55yZbpK9E3vkEtG/1wYrWtghm4aXSqnbxNQdr8TgaCEyu/isGn/Y/bG041w96wOb4f6i2GCn6p0m5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3+87iTJa5i3OVo6HJ1Hufy8q+Y1/QfHAYtRW7sPQMU=;
 b=I79TJ1zxVaAp1ajRr2gYen5fTS7tlCH4uvcrX07c8s+oalGazj6Xb9WXRZOSogvmfDUcQRSjJeJomufMbYQgMpHxXm7ORw6R5WbUp7vZesRbwAHwTYg7NkYUrnrnOcyPHKkdqz89uETT+aJihAysDA8ldTrsMNcC/jLw6cBoHglS97Dv8CaGz3zts2UTqnDVgi09XOnzkTIIJLiL7IFkM68gJhDw2Y/BGOz7vmb2XBBq/c8ocZY74kMCitSxMqhpQmAZY40P+2EY4n3SPYX4gZvLStUVqsvUZXXk0wmcskULouuxNAK0LtmqpkBivsnTJW0TCVp8erAAl21uChCTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3+87iTJa5i3OVo6HJ1Hufy8q+Y1/QfHAYtRW7sPQMU=;
 b=Egn20PlOuVr9oq18I8drieJlhPkBYI5ke0M/x9PK7SLNLILV4WAFs/VWlJeOHcH2fiRBkwPz9C5xqWgy/B9l8SF3vSd/7AGtmg2YYbEh3I86EGyVFzP+BybLjV0XnSDC9xhrEBe3s0gCZrbI4EiiIPSc5v+WMqx5n10SDvlU0x4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e9a02c31-519c-4cc0-b623-7f2335c7aeec@amd.com>
Date: Thu, 7 Nov 2024 09:32:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|IA1PR12MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0b00c4-c73f-4a5b-bd3b-08dcff390f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU0rQXFNeUJ0NnBqaVdIWTk1QmtGemVicGlUSkV6RW5qb1lrSDIrRVkxc2h3?=
 =?utf-8?B?NVRVbUNFZVpzUlVLVjNqTkZncDNNK25JQnhWbTlPbUthNGc1OGhGMW93alVJ?=
 =?utf-8?B?dmZNaGs5VlFWZmgxZHpyRFpzZVBRV2RGeUlMUDNORmlrU2RreU9yampzS1Bm?=
 =?utf-8?B?aEpJVDM2MTFKSzZvUjNEd2hJYmE1YzdleFRpYnlvSFFyTkhLai9WUVFUcHhl?=
 =?utf-8?B?SkRPQ21rUDFkTFpGZ2lGY1F6YWk3MWU1cWUvWlpzZk83Nm4wa1NyRHNmaC9L?=
 =?utf-8?B?czV4MlFaU0d3eS91bE5oZStjTzNtTDFDQU44VC9HbnN6NUU3SWJJcm92djhX?=
 =?utf-8?B?UjNKanlzdnBVN2cwWnpCUEkvdjhyRmYzVlNMMlJsV3VOWE9Rc1hvTTJEaTU4?=
 =?utf-8?B?anpIOVRsTzhZSzlyb3lPbWFia0J0MXRZUmwvZ2NKb0h5RWhvbzN4ZFJNaDlt?=
 =?utf-8?B?N1FSdWpwZFB4cENkZjV3dTFJeWFXZmZRNnR2OWJ2L2RGdFFUSWlYK3VHbGNC?=
 =?utf-8?B?WTB3OG85UlVqUUdwM1RQczFZM0tqOUNQTjlNZ01RUkVkY2YwTHRBUmthMVM0?=
 =?utf-8?B?Z04wWkxlRzkwZklqNlhiZkY0dytSdHhSdU0wUVVSL04yQWc1dng5T1ZBaC8z?=
 =?utf-8?B?S2VpZFUrZDR4UmY2TEE0bzcwZFlXTExjYlJpcGZ4VjJkS1RVL3BqY0hZWWhv?=
 =?utf-8?B?TnFtN201bVdKazl1c3M4MlVXZ0E0NFJ5NFVQZFQrNExvOHhUY2hYM3Q4em85?=
 =?utf-8?B?NTZuQUtQTkQwb2JBdDRkK1EwUDlGc2VhZE91Z1hoakgzQWlZOXAxam9Nb1Uy?=
 =?utf-8?B?bnBrTUV6WVVxaWNKVWdXWjRnamNSaFRLNXZQMGFxWmE1YXd0RW1MQ0hOV1d1?=
 =?utf-8?B?amdCdGJRQnVML05tWjJ0anFBOXMwWmlDSFlndnp3Z1JBREhENzEwZWMzcGJa?=
 =?utf-8?B?ekZLeHcreW16QjRMTHcvQVgxa1d5TTVEUTRIK0Y1ZDE1RjVmMy8xU1hFcUJy?=
 =?utf-8?B?RTd2OTEwM1RKb2pHUmNXQk1mcGhQZFgxeDRrK0w2OXBZUGJPOGx6RHA2V0F5?=
 =?utf-8?B?NzRSbDdjRHNmdFViMFFneEt5RXV4R3NRazhNNHkza0lqTkhzZzExR0RwSWxC?=
 =?utf-8?B?Zjc3bEV0OGlrS3RQcnNDenRyeHIyeDJHVGREZzVVUEQrK0FCQU9rWUFQa0Vi?=
 =?utf-8?B?M3FmMVhNem93UFlnbVN0VTdxR0JPSjdlZ2c1N1FpdTNsZEdNLys4N20wbzQ2?=
 =?utf-8?B?b0NhSEx4QkFRS1o0bEZxbVh1YnNiYU9LR04rcUNuR1RkVEZZRUc4U2xlSWo2?=
 =?utf-8?B?Vk1xVEVxUnhIK0c3SnRuQnRTV1BzbEwrTnRqcW1waXBRQXdhazRHN052U2ZR?=
 =?utf-8?B?RmZrMHhwNU9nVTIrMjhiL05kT0lXTURQKzVEaDNqWkhqUDlicnBkMUJsdVNn?=
 =?utf-8?B?ckMzeUFKcjJWRVhQeWo3K1JSQmo4a2k3MHZNeEJHaFZFOVlnQWV5M0dUWDVD?=
 =?utf-8?B?UGtHa212UkNUNndqaUt0dm4xVEhNSUtqU0xXb1NtS2hkVXNWWlVkb2hxaVdp?=
 =?utf-8?B?aEhuTjJodUZGTHd3TTRlN2xySmhTOE1qazlLZllKL0RVdXBCa2Urb1hLcnUv?=
 =?utf-8?B?V3Y0T2FZQzNGMDBHNXY4YmdZZUlzRm9KRFZmTnlqem5oay8xZk0zN2NYYng2?=
 =?utf-8?B?S0tGZmpweS9ORWQrcU1xOUhXNGcvZUFjbTdwY1pWSWFxUHdBMDNNdG85a2ln?=
 =?utf-8?B?dStIWGc1QjlsaitzUnZEY3VLVDRtbmJ2SFdtVUV6c0pmS2JjNjNLa2pHell3?=
 =?utf-8?B?RzlueFNWN3dSTzZWaHpzRFVsRUw1cUNsVzlaV2JiYUhKOEh5Q0NoVmFxWTZa?=
 =?utf-8?B?TVBESVdJMkNNTkprVUNhU3FVa1o3aWF3U3hCaHVrWWhmVkVDZTkvUExzTkMw?=
 =?utf-8?Q?uf2v1J3/gI4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:32:51.2279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0b00c4-c73f-4a5b-bd3b-08dcff390f31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8189

On 11/4/24 02:44, Jan Beulich wrote:
> On 01.11.2024 21:16, Stewart Hildebrand wrote:
>> +Daniel (XSM mention)
>>
>> On 10/28/24 13:02, Jan Beulich wrote:
>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>>> Add links between a VF's struct pci_dev and its associated PF struct
>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>>> dropping and re-acquiring the pcidevs_lock().
>>>>
>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>>> VFs may exist without a corresponding PF, although now only with
>>>> pdev->broken = true.
>>>>
>>>> The hardware domain is expected to remove the associated VFs before
>>>> removing the PF. Print a warning in case a PF is removed with associated
>>>> VFs still present.
>>>>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> ---
>>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>>
>>>> v5->v6:
>>>> * move printk() before ASSERT_UNREACHABLE()
>>>> * warn about PF removal with VFs still present
>>>
>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>>> just after an adjustment to the commit message. I'm instead actively
>>> concerned of the resulting behavior. Question is whether we can reasonably
>>> do something about that.
>>
>> Right. My suggestion then is to go back to roughly how it was done in
>> v4 [0]:
>>
>> * Remove the VFs right away during PF removal, so that we don't end up
>> with stale VFs. Regarding XSM, assume that a domain with permission to
>> remove the PF is also allowed to remove the VFs. We should probably also
>> return an error from pci_remove_device in the case of removing the PF
>> with VFs still present (and still perform the removals despite returning
>> an error). Subsequent attempts by a domain to remove the VFs would
>> return an error (as they have already been removed), but that's expected
>> since we've taken a stance that PF-then-VF removal order is invalid
>> anyway.
> 
> Imo going back is not an option.
> 
>> While the above is what I prefer, I just want to mention other options I
>> considered for the scenario of PF removal with VFs still present:
>>
>> * Increase the "scariness" of the warning message added in v6.
>>
>> * Return an error from pci_remove_device (while still removing only the
>> PF). We would be left with stale VFs in Xen. At least this would
>> concretely inform dom0 that Xen takes issue with the PF-then-VF removal
>> order. Subsequent attempts by a domain to remove VFs, however
>> (un)likely, would succeed.
> 
> Returning an error in such a case is a possibility, but comes with the
> risk of confusion. Seeing such an error, a caller may itself assume the
> device still is there, and retry its (with or without having removed the
> VFs) removal at a later point.
> 
>> * Return an error from pci_remove_device and keep the PF and VFs. This
>> is IMO the worst option because then we would have a stale PF in
>> addition to stale VFs.
> 
> Yet this would at least be self-consistent, unlike the variant above. No
> matter what, any failure to remove VFs and/or PFs correctly will need to
> result in there being no attempt to physically remove the device.
> 
> You didn't enumerate an option lightly mentioned before, perhaps because
> of its anticipated intrusiveness: Re-associate stale VFs with their PF,
> once the PF is re-reported.

I'll plan on this approach for v7.

> Problem of course is that, aiui, the VFs
> could in principle re-appear at a different BDF (albeit we have other
> issues with potential bus-renumbering done by Dom0), and their count
> could also change.
> 
> Jan
> 
>> [0] https://lore.kernel.org/xen-devel/20240827035929.118003-1-stewart.hildebrand@amd.com/T/#t
> 


