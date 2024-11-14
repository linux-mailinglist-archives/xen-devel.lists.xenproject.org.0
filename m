Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA59C91E5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 19:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836781.1252671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBew3-00032L-DJ; Thu, 14 Nov 2024 18:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836781.1252671; Thu, 14 Nov 2024 18:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBew3-00030r-AZ; Thu, 14 Nov 2024 18:51:19 +0000
Received: by outflank-mailman (input) for mailman id 836781;
 Thu, 14 Nov 2024 18:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ir3r=SJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tBew2-00030l-6y
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 18:51:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 690810a6-a2b9-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 19:51:09 +0100 (CET)
Received: from BL6PEPF0001640D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:14) by LV3PR12MB9186.namprd12.prod.outlook.com
 (2603:10b6:408:197::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 18:51:03 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2a01:111:f403:f902::3) by BL6PEPF0001640D.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22 via Frontend
 Transport; Thu, 14 Nov 2024 18:51:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 18:51:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 12:51:02 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 12:51:01 -0600
Received: from [172.30.86.253] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Nov 2024 12:51:01 -0600
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
X-Inumbo-ID: 690810a6-a2b9-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjExIiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjY5MDgxMGE2LWEyYjktMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjEwMjY5LjYyMzg5MSwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQD4ZWJUi4w8SF6IKECXAUsEm3u6Hf3u99i88GKc7Paa9LB7noEYdNCsDKbZwRFiA1cJ2k9AGxxBo97rv1Zx8QshVumwzYnihC7XWZtOSsfjkR+wCiiyKgVGG4HibMz8vZHY5MccI2r/5WtMJvrK1h+pYjeuASBUOBxNlZPGuV2gyEZoJOdaIUTYKemCNCxq8eekLwCowZI1Msr9+xwR/bVurueTphIow8Ub6mYjZQYZhLRoOLgzhXLgXxDSD96l03IISca2PnMS6A60sPduft/akGo2r2OZ87MsCZhhakguTy/DDsx1QkacqKzgltF+fcyN38U2tdyb/Qla0C5vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GvLLLgzLWn1/eJDkQtUNK1il4m+YT3p5BYVXAjNWi8=;
 b=k21DIFt+Ls6UZn/yX2wIa1mGK5qtGSoBFoN6Zisx4syPwaVHIyUtx7yhZBJoeZ4/2Hi+ewS1K25bu1p4OIYFVV4Yvj44W0sASThCkB0BIKqrP1sSdcA1PepyNMzRtYv7H7xZqKPKs3UFXePuR8oqKResqYaYUi0QwGpaDZJqbQwOzEtOHGELIpyzulvx75tgzJdOy6ZqxlKCyd7sZf+PL20q3VqjfU6KSIocoS0UbHMr/ImrJfCGUgUqR69ENn0apt0QLkonGd0TIhGZEOkME/SlKvuhr96xR3laQHGx1x2TDW5YW7L5z2Wr8kSqqzkfUEzn6JhS97ozFOlrOVLZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GvLLLgzLWn1/eJDkQtUNK1il4m+YT3p5BYVXAjNWi8=;
 b=SZ0/hZ17wDLXVrA3bSFYNydQDgfXH0fnGlj8mnfB6IpkVX8MMmdSpIrkncH6sOF322GNEfRqrNzHXZo68N0quXiwW6/IB8aMLHfj59/YS/LlffH3JDQfJPFy60w2W+RPLXgDdA4MjjxquP4A5cLKghlwfhe3OpTV6Sm6lEQiWrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <06149848-c14c-4f44-80b8-b596479505cf@amd.com>
Date: Thu, 14 Nov 2024 13:50:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/pci: introduce PF<->VF links
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20241112205321.186622-1-stewart.hildebrand@amd.com>
 <20241112205321.186622-2-stewart.hildebrand@amd.com>
 <975e3dbd-40e8-49c6-8aab-7e7bde1a233f@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <975e3dbd-40e8-49c6-8aab-7e7bde1a233f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: bdac6171-bcea-4139-c8f9-08dd04dd4a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?byt3bTJEYjU4MmtVVDBma1orRmdJOUhmZjNLNFc4Y0xPNC84YW90UTlURjJl?=
 =?utf-8?B?OGw2OUNYR0crbk9ZL2h2dmVKVzZXM1lxS1RzaURld3hPM3V4VzlsdFVkRHBL?=
 =?utf-8?B?Y2NpbVZGRFpHVThjejZweVNXd1ZOTGhFODdDMHZnMnVRNzJPckg4Nk5qeUlj?=
 =?utf-8?B?QkhUR1R3MmZwSmZOdkUxeFJsY2NkNXpXTnQ1SExNQkkrMVVnM28zcWdNald3?=
 =?utf-8?B?VTZaaytQbGRKcWprZE5GeFpobkhTUEVDVkttN3VhaGJPSFVTb3RuNklTZDgv?=
 =?utf-8?B?emhzNzVHWWpKUHVRUEZiR0VmTlFmQkNXbVhxUzFlNnI0NkhEOW1ZT1RkTGx0?=
 =?utf-8?B?cWlOc285UDZRZmNQRjFTRS9PalhHRHczV1R5Y3NTMTdNQlI3UmlPcFNKdW9w?=
 =?utf-8?B?enZOdUJncU1lRjhHZXowenpvZ1g2NEdTcjhLay9FTXpWOG5pSWtNNGlkWExX?=
 =?utf-8?B?THZlOHc5UU1oR3J4dms5alJ5L3NLVXM4emEvSUNRK1ZRby91c1A3dWUxSm9i?=
 =?utf-8?B?STdScm5nTVB1QnlrZnR6MXNROWNwMmkwL0FhNk1CRU5FOWZydk9hMkVHdXVj?=
 =?utf-8?B?Tzd0Nm9yVWtKOVJFZW13RnM5bXpHRlJlbnlkVDg0c1VYNmVoRUd1cHF3cG0z?=
 =?utf-8?B?ZVloREhZRlU2Qk9Cek9MRm9hMVBieE5oNnlXQW9xaDZQeG5sOHpZc0hPeHdr?=
 =?utf-8?B?RzFWZk9wdy9hWHkwUllJYXRFSG9jK2YybzlpNkR0eTdmOXpPQ2RCUU1aTVZ6?=
 =?utf-8?B?R2taZG42VHRFMTdGbWNhekg5RSt4WW5BSXVjYjlVNm82eUNKYmo0dDdVMGI1?=
 =?utf-8?B?bXJCakJFSXR5OVVIQVVEUlkxWm0yWDRDUE1KRlJGV25CU1ZXZHE4ZEhQUW1D?=
 =?utf-8?B?UXBBbDRDZHpIT1dtVlBPWi9vS1NGRTVGb2VmV2tWVEI1dWwrVjhoeXIvY3NC?=
 =?utf-8?B?MGRBdy9iN2g5TW9tOGF6czRsTFIxNUlOS1Z1MnkvMk9pTHdqR1ZXY09PWmF4?=
 =?utf-8?B?SWpYdnlPRkwzZDZrQTNqT2laVUJCUCtXSkRnN1VrNTd0U3lDS090S1RGcjAw?=
 =?utf-8?B?VWlKRWtDY2prSXU1Z3doRnFvMFV5OWVlS3AwN0JQSy9zczdXc3c0NEZFT09k?=
 =?utf-8?B?c1dTL1NiaFdMVU5ENHNncndjT0JqeEEzODUvWFJKNzJNK3ltc2lyKytTRnp6?=
 =?utf-8?B?OXYzTExEZXFxaFB1eVNrYytNd1Y1ZlhBS2FhZXlUaDRtTWJxSGRTQ1ZNTjQ3?=
 =?utf-8?B?N3R3YmdJQWJBOS9WVk9nRzU0QzFkNHhHRGFZTU9wS1NHdEFQeDBIUTErakJv?=
 =?utf-8?B?N0MxL2F3ZHJMbzJhNU00REROblJIS2NJdHAwWllFVFpFUkJZNG9QU1JpU2dW?=
 =?utf-8?B?R0pCZU1tWmpWamN3TEtadUhCQVcrRUlVcktoREZSWlhxYkd5SGc4R0QxelRU?=
 =?utf-8?B?S0lOR0wvMjJlc2V2Z01KOU8ybE9XZmFjM01RZWhGdTRReWJnQ2FjZmtLb08x?=
 =?utf-8?B?QWFEWlJ5QlZCd1JicEdaTTVBbCt3ZTZRV2swOEtLUzhCdVByQnFuTCtuYkJy?=
 =?utf-8?B?NG41SWJsUm1HODlESU9TUW15L0N0K1laRDN3ai8wTUtZNmhtOVE0SW4yRWEr?=
 =?utf-8?B?RXJ0ejRhSVhyTjBCL0FTcmNCYzVJNHJZYVVkancvV1l1RkVGWm1UWG9DOXV1?=
 =?utf-8?B?anNUaHkyS0pudDdxaVpSSWphWEdlSGJXSHR2dG12SkYzMjlMUHRpU2ZmclE0?=
 =?utf-8?B?UTVZYzZBVnoyZ1JXRlg1aHNkald0U0V4TVQ2OHJ5eUJmM1lUUU45QzZPTFZn?=
 =?utf-8?B?R3hucGpsdTdjeU02ZjBna3NzZ3BKTUlYVWZxNStVeHZmeWEvS0NFK3ZvaHc1?=
 =?utf-8?B?V2tWOHczQU40V3drMmNnTjd3Ym02RFpJWWJSMzNyNTU3SVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 18:51:03.4454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdac6171-bcea-4139-c8f9-08dd04dd4a2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186

On 11/14/24 05:34, Jan Beulich wrote:
> On 12.11.2024 21:53, Stewart Hildebrand wrote:
>> Add links between a VF's struct pci_dev and its associated PF struct
>> pci_dev.
>>
>> The hardware domain is expected to add a PF first before adding
>> associated VFs. Similarly, the hardware domain is expected to remove the
>> associated VFs before removing the PF. If adding/removing happens out of
>> order, print a warning and return an error. This means that VFs can only
>> exist with an associated PF.
>>
>> Additionally, if the hardware domain attempts to remove a PF with VFs
>> still present, mark the PF and VFs broken, because Linux Dom0 has been
>> observed to not respect the error returned.
>>
>> Move the call to pci_get_pdev() down to avoid dropping and re-acquiring
>> the pcidevs_lock(). Drop the call to pci_add_device() as it is invalid
>> to add a VF without an existing PF.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> I'm okay with this, so in principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, I very much appreciate it! However, is it appropriate for me to
pick up this tag considering the requested/proposed changes?

> A few comments nevertheless, which may result in there wanting to be
> another revision.

I'll plan to send v8. There were some minor comments from Roger on the
removed snippet that I will also address, and I have another proposed
change.

>> ---
>> Candidate for backport to 4.19 (the next patch depends on this one)
> 
> With this dependency (we definitely want to backport the other patch) ...
> 
>> v6->v7:
>> * cope with multiple invocations of pci_add_device for VFs
>> * get rid of enclosing struct for single member
>> * during PF removal attempt with VFs still present:
>>     * keep PF
>>     * mark broken
>>     * don't unlink
>>     * return error
>> * during VF add:
>>     * initialize pf_pdev in declaration
>>     * remove logic catering to adding VFs without PF
> 
> ... I'd like to point out that this change has an at least theoretical
> risk of causing regressions. I therefore wonder whether that wouldn't
> better be a separate change, not to be backported.

That makes sense. I'll split it into a separate patch for the next rev.

>> @@ -703,7 +696,38 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>           * extended function.
>>           */
>>          if ( pdev->info.is_virtfn )
>> -            pdev->info.is_extfn = pf_is_extfn;
>> +        {
>> +            struct pci_dev *pf_pdev = pci_get_pdev(NULL,
>> +                                                   PCI_SBDF(seg,
>> +                                                           info->physfn.bus,
>> +                                                           info->physfn.devfn));

BTW, since I'm spinning another rev anyway, are there any opinions on
the indentation here?

>> +            struct pci_dev *vf_pdev;
> 
> const?

Yes, if it's still needed

>> +            bool already_added = false;
>> +
>> +            if ( !pf_pdev )
>> +            {
>> +                printk(XENLOG_WARNING
>> +                       "Attempted to add SR-IOV device VF %pp without PF %pp\n",
> 
> I'd omit "device" here.

OK

> (These changes alone I'd be happy to do while committing.)

I'll include the changes in v8.

>> +                       &pdev->sbdf,
>> +                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn));
>> +                free_pdev(pseg, pdev);
>> +                ret = -ENODEV;
>> +                goto out;
>> +            }
>> +
>> +            pdev->info.is_extfn = pf_pdev->info.is_extfn;
> 
> There's a comment related to this, partly visible in patch context above.
> That comment imo needs moving here. And correcting while moving (it's
> inverted imo, or at least worded ambiguously).

I'll move it. As far as wording goes, I suggest:

            /*
             * PF's 'is_extfn' field indicates whether the VF is an extended
             * function.
             */

>> +            pdev->pf_pdev = pf_pdev;
>> +            list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
>> +            {
>> +                if ( vf_pdev == pdev )
>> +                {
>> +                    already_added = true;
>> +                    break;
>> +                }
>> +            }
>> +            if ( !already_added )
>> +                list_add(&pdev->vf_list, &pf_pdev->vf_list);
>> +        }
>>      }
> 
> Personally, as I have a dislike for excess variables, I'd have gotten away
> without "already_added". Instead of setting it to true, vf_pdev could be
> set to NULL. Others may, however, consider this "obfuscation" or alike.

This relies on vf_pdev being set to non-NULL when the list is empty and
after the last iteration if the list doesn't contain the element. I had
to look up the definitions of list_for_each_entry, INIT_LIST_HEAD, and
list_{add,del,entry} to verify that vf_pdev would be non-NULL in those
cases.

Perhaps a better approach would be to introduce list_add_unique() in
Xen's list library? Then we can also get rid of the vf_pdev variable.

static inline bool list_contains(struct list_head *entry,
                                 struct list_head *head)
{
   struct list_head *ptr;

   list_for_each(ptr, head)
   {
       if ( ptr == entry )
           return true;
   }

   return false;
}

static inline void list_add_unique(struct list_head *new,
                                   struct list_head *head)
{
    if ( !list_contains(new, head) )
        list_add(new, head);
}

