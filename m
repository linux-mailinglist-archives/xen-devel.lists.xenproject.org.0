Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F909D8A22
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842924.1258588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbov-0001pA-Ot; Mon, 25 Nov 2024 16:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842924.1258588; Mon, 25 Nov 2024 16:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbov-0001nY-LK; Mon, 25 Nov 2024 16:20:17 +0000
Received: by outflank-mailman (input) for mailman id 842924;
 Mon, 25 Nov 2024 16:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOuq=SU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tFbou-0001nS-VU
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:20:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2415::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b76c93-ab49-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 17:20:12 +0100 (CET)
Received: from YT4P288CA0031.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01:d3::9) by
 BL3PR12MB6644.namprd12.prod.outlook.com (2603:10b6:208:3b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 16:20:06 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com (2603:10b6:b01:d3::4)
 by YT4P288CA0031.outlook.office365.com (2603:10b6:b01:d3::9) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21
 via Frontend Transport; Mon, 25 Nov 2024 16:20:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Mon, 25 Nov 2024 16:20:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 10:20:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 10:20:04 -0600
Received: from [172.30.86.253] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 10:20:03 -0600
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
X-Inumbo-ID: 24b76c93-ab49-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjFiIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI0Yjc2YzkzLWFiNDktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTUxNjEyLjIxNTE5OSwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dByhgXLebWfI2TS/CidApe4zKf4U4C+GI8WdHHJ6wKGECcV050xsMIna2rq8CtLI4R8rcH612isaZR9h+m5o+uMXJEXHFIVF5OwNlouPj0wWn6U5rfzwFRUCtEaFg6/YQwB4cUQbLdGOvjnccb6Ek9ZRf6pzLbr+JsQRbcbOjHjqASi9czmPR+mC45d5HozgTp/22Ph1XrZ5fLSjvDsv8q7GSj/YyXMfSr4VnDBsrcalxfGeTVJCvBWetTKAWuh9qxQ/FGnQar0xvFgkuhAMqAE8FkC/SrziJcWw2UhKq49u4vDcFpami5cJgcYibh0pknwifX1yUTEF/pB06PV6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56FSmCZmzqkiLDtcIj/w388Am0xxIzp7LIQ1gUTN+3c=;
 b=LmQVJFPrWXsuMPIzpb6afbxxNyzO2Jl102dCEf05Hjo6BjDObGITQkmLxLsP23Nq9sYqmHIE5W+hrKOrrSN/BIx0+n7Cd2TqXt20HR6aVsjjCQ3z9cHNP1YxkuImJy/+7HFWS0+D8aDGWq9EzKIiEQ31yTghgX1L0E2MkxTk7PzXBSxkFhaHuZu71TbF2suNutiT+xoTphBbKoasJ09C1FzU2txazR7JvLYJbHDQbVSKpYPFibVjmJuUJNdGfLTJ3iGy0A390/S9X6NNBTUat2yyA3Xs8RXhzk+L1WM4sLgN16zrRkFG0zgdsrtyoO58JvBSaTGpGYEg0TiChSX1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56FSmCZmzqkiLDtcIj/w388Am0xxIzp7LIQ1gUTN+3c=;
 b=TEG9MAEImpJcfX3ep9lO7G+qviQiOuuDAYE3c95wT/9FPXc27SoNWajSGF2Jp8+gMohEXfEB66HGohRo2XhcSIpArUvwcuQ7wxTPZR6iSqd6pUg8r1bMaZc9EgMOLjxrtupjznAbGt/XZWIFsg2Z3c2ShwArQcvf+UtmjNnzW9A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c3eb63eb-6f00-4fc8-9a60-4174199ae7d2@amd.com>
Date: Mon, 25 Nov 2024 11:20:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] xen/pci: introduce PF<->VF links
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20241115160905.551224-1-stewart.hildebrand@amd.com>
 <20241115160905.551224-2-stewart.hildebrand@amd.com>
 <4fca39e6-6c59-49cc-9f76-9fc226c49f8b@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4fca39e6-6c59-49cc-9f76-9fc226c49f8b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|BL3PR12MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcb99ba-28ce-4066-1922-08dd0d6d05e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3VqblcxaGt4ckhITUJtMzF6dmVvdjZoOFcrUzkxS2YrbXdJV3pEMUFnWHJG?=
 =?utf-8?B?N0lqQ1dKT1ZUdjRJejd4ZXhVMXBISktpZTZCZW84aklkNkg0WnBwY21SRFdS?=
 =?utf-8?B?TTVGR2lYRTlVWWdINTdoNnZMTlMvU2VVQVBkUW9hS3pxNTBsUWV1MXdtWXN2?=
 =?utf-8?B?bnRhM1J3N3k2clU4T1d4MWl4bzFOaWVtd3ErTHZpQ3FWS0w5bURqdmhBWUtG?=
 =?utf-8?B?UnFxVWdOV3l2c1NqQyttRnZHdVJrbXNvNjFqSFZ2ZGp4SVBjaTNPaVgwL0hv?=
 =?utf-8?B?Rk0wWUZiTHM3RTZMdGZqQ211MGFkdStXNVpVMUJ1Y01CR1pnRWZpNVlQZzkw?=
 =?utf-8?B?SFFyWUJqL09nQzFWMEhUT1pUbFBvVlNqcnNBL3ROamdsVlROSE5jNytmZ2NK?=
 =?utf-8?B?NUNweWc5RldFdTlmVWRkR3NyWHdnejFKSzNwU1hFdG5WemVvc0N6bElLTkVL?=
 =?utf-8?B?UFRaQjZmSzkzVDJKZmw3NWR4enJhMTlsK01LTGd2b2tQMzEyOFNkNXFUZ0ZL?=
 =?utf-8?B?WFBrNkM3Rm9HODlPYUN3cnZiaXJ1RzBhd01hNU5PcDkvL3A4WU1tenlXUkxQ?=
 =?utf-8?B?MjBDakVyWkZGOTlVL25teWtIaGlMVVdscWFEd3dlS3k1VzBwOG9mamFiekwr?=
 =?utf-8?B?UUdzcUtGZG0rTldMR1hZcmJJeHI3T1JNQnNWMDVGem1PbFZrUXpaSklZVkdY?=
 =?utf-8?B?d051eEdCK3ZqcncxNVBHWEtoelg3TkZBR2hHTHVIV0h2U0FTRnpLclF2Mkdv?=
 =?utf-8?B?bjliK3RTUDl1alZkZHVIT0RwREt1ZDhWWTVyNGZoTHVqODlDTnZ6d3hFVG9v?=
 =?utf-8?B?bkZ4UEpmbDQ5U2drVjYrbTg1aTRKcURrcGx6SURVYnhDNVAzdEN2eC94M0Y3?=
 =?utf-8?B?TDVxYjl4TmtEUFNxSXdhOUJ3TVp5NGFpLzBmRVRRNndpeVc0OWVVY3JFN2VZ?=
 =?utf-8?B?emdPWCszUWZOeEt1cW15RlVLRnJ2ZW5Wb05VMVNSSXFqRndFUGl0cmkvSHJK?=
 =?utf-8?B?K1ltM01EOXpnQnMxZTQ2Z1B6c01yY0FQdFd6ZzB4b094aG90a3lLL1RvVWh0?=
 =?utf-8?B?YzZvOGMwS2tFNVVKdzdrakVZNmZsQm5UN0JzMkdvV0twOStEVGZRMWlZcWQ4?=
 =?utf-8?B?VHF4cnN3cUJHWmNZaXgxRzFYaHliL1ZmRVB3V0UrbEtIbEYxNXA4ZUdVY2Fp?=
 =?utf-8?B?YVZVNzdRc0RydkxVSDd0UWVxQkp3bXlNN3FHQnNoWWV2NnM0RjFzQ3FQQ0Y1?=
 =?utf-8?B?VTI4NkNVdGV0VkpMQ3V6cTdhNUhJZTRzTythSllxQkVsZlZpcE51YmdnS3Zk?=
 =?utf-8?B?RmJiWGE1ZEhTQjVwdGQ2MWc2cDhQc2NVdnFRZHNwNHVkamxUOTI0T3JZTWtk?=
 =?utf-8?B?REJQQXAyQ3FPMGVsYSs5T211cFlpSmlEdzVIdmJQbk4rdWVWYzVHR2Z2eXNo?=
 =?utf-8?B?U3J2R1l1aEdCNkpsdEpDYkVYdFRxT2QvZUNRSU5mNkpvWm5BZDlEcDk0UlYy?=
 =?utf-8?B?MHVIM3JmVnVZRVRqVE0wL0Myb0tpcjR2ZFV4RVhhZjM3OXVEZC9ScFB0Q0l3?=
 =?utf-8?B?WTZJRkdZNzhzOHprZTF4blJYNVFkQ0s3VkQ3Z0ptMStGaEpwcDFQNmR1dDJr?=
 =?utf-8?B?L3dUaERZeUhuUDVSZS9FUlN2b3BTRXlqVE14ZXNid1VxV3BHcGMyYm1UdmlI?=
 =?utf-8?B?TFRFcEs2d2pickxoQWVCRUdJWVU0endDYlZ2Vkc4ZDVka3djWXpzMGxHTFBz?=
 =?utf-8?B?MWE5cTEwbHNCTWYzaUo0WFZMMm5ld1FiV3BGc0RCRFA2UU03Vlp0YUdra2lw?=
 =?utf-8?B?SHBaNGtub2JNcDhGbHlCQTJGOE5hNjNDdmtqSGw5SW1mVFVwRWd0UXhLenFR?=
 =?utf-8?B?bXBhbUdJWFZDOVZKNnhzWXNlcFZZV2tqSEZ0ZHhjckxWVDU2VlNYZlo1R2hM?=
 =?utf-8?Q?9ABAeQX5XK2XTG0rYYUB/45QNj3Qtysu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 16:20:05.7455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcb99ba-28ce-4066-1922-08dd0d6d05e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6644

On 11/25/24 11:08, Jan Beulich wrote:
> On 15.11.2024 17:09, Stewart Hildebrand wrote:
>> Add links between a VF's struct pci_dev and its associated PF struct
>> pci_dev.
>>
>> The hardware domain is expected to remove the associated VFs before
>> removing the PF. If removal happens out of order, print a warning and
>> return an error. This means that VFs can only exist with an associated
>> PF.
>>
>> Additionally, if the hardware domain attempts to remove a PF with VFs
>> still present, mark the PF and VFs broken, because Linux Dom0 has been
>> observed to not respect the error returned.
>>
>> Move the calls to pci_get_pdev() and pci_add_device() down to avoid
>> dropping and re-acquiring the pcidevs_lock().
>>
>> Check !pdev->pf_pdev before adding the VF to the list to guard against
>> adding it multiple times.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

>> @@ -698,12 +691,48 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      if ( info )
>>      {
>>          pdev->info = *info;
>> -        /*
>> -         * VF's 'is_extfn' field is used to indicate whether its PF is an
>> -         * extended function.
>> -         */
>>          if ( pdev->info.is_virtfn )
>> -            pdev->info.is_extfn = pf_is_extfn;
>> +        {
>> +            struct pci_dev *pf_pdev =
>> +                pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
>> +                                            info->physfn.devfn));
>> +
>> +            if ( !pf_pdev )
>> +            {
>> +                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
>> +                                     NULL, node);
>> +                if ( ret )
>> +                {
>> +                    printk(XENLOG_WARNING
>> +                           "Failed to add SR-IOV device PF %pp for VF %pp\n",
>> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
>> +                           &pdev->sbdf);
>> +                    free_pdev(pseg, pdev);
>> +                    goto out;
>> +                }
>> +                pf_pdev = pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
>> +                                                      info->physfn.devfn));
>> +                if ( !pf_pdev )
>> +                {
>> +                    printk(XENLOG_ERR
>> +                           "Inconsistent PCI state: failed to find newly added PF %pp for VF %pp\n",
>> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
>> +                           &pdev->sbdf);
>> +                    ASSERT_UNREACHABLE();
>> +                    free_pdev(pseg, pdev);
>> +                    ret = -EILSEQ;
>> +                    goto out;
>> +                }
>> +            }
>> +
>> +            if ( !pdev->pf_pdev )
>> +            {
>> +                /* VF inherits its 'is_extfn' from PF */
>> +                pdev->info.is_extfn = pf_pdev->info.is_extfn;
>> +                list_add(&pdev->vf_list, &pf_pdev->vf_list);
>> +                pdev->pf_pdev = pf_pdev;
> 
> As a general pattern, I think filling fields before adding to lists is preferable.
> For now it doesn't really matter here (lock held here and while removing), yet
> still: Thoughts towards flipping the last two lines above, perhaps while committing?

I'm OK with that, feel free to do so.

