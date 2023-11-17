Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89337EF3AB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 14:20:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635189.991041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ykw-0003pW-9k; Fri, 17 Nov 2023 13:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635189.991041; Fri, 17 Nov 2023 13:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ykw-0003n4-6y; Fri, 17 Nov 2023 13:19:34 +0000
Received: by outflank-mailman (input) for mailman id 635189;
 Fri, 17 Nov 2023 13:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SI0+=G6=epam.com=prvs=56853977b1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1r3yku-0003lh-Ji
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 13:19:32 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efbd90d0-854b-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 14:19:29 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHBwQas031704; Fri, 17 Nov 2023 13:19:23 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2105.outbound.protection.outlook.com [104.47.11.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ue45gsafy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 13:19:23 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI1PR03MB6542.eurprd03.prod.outlook.com (2603:10a6:800:199::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 13:19:18 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::7055:96d3:5428:d358]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::7055:96d3:5428:d358%4]) with mapi id 15.20.6977.028; Fri, 17 Nov 2023
 13:19:17 +0000
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
X-Inumbo-ID: efbd90d0-854b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNKa8tyRDl1oEMg+32tfre2FiG6VXLEkV8I7sZjORtLSmlZedXkHMBXXWLhL9sLfhHEMce4agRHUaolzmieYxAzGSpHto+5UR5NEimuTyul2Ln58yC5NV4+lppyocPQ903n7S919WYb8eHHoQGFBuLBHpijwXlO9y5+ooq5B5jyH9vxPbk7fpmBSZ5JTcpIfFfjB/kASsUJ3/YqrtMFahCytBRl9hLbF4xp+lAtdMfh2B4setn96QpCFP+7usEEOyndsWgY+WOnGhGAw1hNIv2KQdfXQgDXv0nVT4D2oVbvDAPOAD0kkwioe+SZKHRotFjxqaMc07wlqjyVQsNqr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hjwN7rnQC1+YhY8pragpObPEPmXhdDg0+gUBvqJq3g=;
 b=aufiUJaB75rBSQOh/Iz3RdsEJpgDyP0DzPjbPHSwKuC3MHO2QbCW5fuNGXHyFM5UAi+P/uSB9NKcit5HOlLNB2+fXnUkkz86srG/EBxFsmKmXm1Pu8cCeA/ylzUVglXMB9N0uX7V4WHqLoEAa3HjIVQ4351CgaBeRaVI8NlrS+sViaHOVMFU7OegUimUA9o+Md/o5Hbf1yWFTSt/qQM++M6WvmN/1QkLGV54+Wx/pyBgYRWimwKqW9Wtg4Fg53FYOjz7pXdbJUbgZ/Mec3yV2k8k+oJRNN5nIj+gCrKtFIMyT4RCHQuQffDa9L17GbVfxwB3WAnHBz2ErtQa2773+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hjwN7rnQC1+YhY8pragpObPEPmXhdDg0+gUBvqJq3g=;
 b=scB5amY6tUc1Jyp5jkZMagnc4GMJvRtN/ZjjjQNiduQzqNtaqgsDTnyDJ9Om2VOdpGNRKzc4bLofx1sIUXo+Vr9OqyHBL4gnDHwyyTHJ4QHYvOCm5yrwfg/0B9wQhf0tF0SM8jNVjtcsBDwr2Xs8WYuWO+51djqDUi7bfTiC/xl5DYT2uDEZ7YjNzsnLLrOnTu9Kpj3/E4ejOHSOtT8BN/Bd6IOx739576/UWANxtZMKCGGlXgJr0F/tgisgA201nrfQbBF4+xMlcOO2nTzWQJKuQ0cJEInJgXl5Tz9pbsZzaU2+Y4/WDRJLSAoUd7HqX62LebmkJRa+LDrdEqQXSw==
Message-ID: <98e05fb7-ea8b-48a4-b860-01d2a081e897@epam.com>
Date: Fri, 17 Nov 2023 15:19:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <9e0760f2-6ffd-4010-aabf-ff4f643f288c@xen.org>
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <9e0760f2-6ffd-4010-aabf-ff4f643f288c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0030.eurprd02.prod.outlook.com
 (2603:10a6:803:14::43) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|VI1PR03MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0d6a0a-1bee-4b49-fa1c-08dbe76fcd73
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F4mV82ZQE0KqyApwqlg9FWzGTKfOKzcKzFhVdT+OUfiWqSzsnQWS0cux51OEIuufLWdU1PCuNfgkVozbL+RamHS5yGcnVzpP+epJ7B7nneZtbeAjt7abwmoaY5mukD5wobTwp3uNzaXImuYrTbC3R2XshsxQi2aJ7bza/zC57uh/vTX80b9mGXLioLQWMtwMvHmLPLaHpKdfNhj1huWzsZOyAHPTd1Q+U+qpZZJ/L+zPDwMAt2NxayMvK3xW3z1O9/g1FshMVPsWtC3jYeofKN12cWCBGcSYmXpqp5G+BnCcoB+jL14CNICss38PqjngnS2StdN1B5/ko7vUDYczEJN/k2MARFH3UIoZ+QZuT25y99Rma1O094Juae3C79I82HYGyiB/cL9HMEdA9QB2B2mNMBkhKrxazWqCqiEkjJhTaZu5007djLDWt9YKSXzLX+9Kpe8e+ZooXMlDynYmUwh41kJYIMzH7IitZSEky4/6uQNeGt9MjTepZ9VKOXRonfWr76/nCU2n5rpNYxPjpC+CNccWnvD1ZsgMBdHxH92+JsDWZL3s6pjaf/hGp32IO/jCgt+OnllWq4qG5QE5oK2eWDfV8P+fxTBW3bZxJaxb/T2H23xtHVm/HJSZh8ebuttuonFKY9iP+5JFRYPR1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66899024)(86362001)(31696002)(36756003)(2906002)(478600001)(6486002)(6506007)(5660300002)(83380400001)(6512007)(2616005)(41300700001)(107886003)(26005)(8936002)(8676002)(4326008)(110136005)(54906003)(316002)(66946007)(31686004)(66476007)(66556008)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDROM2JQUEU5d0p2dUc4dEJYRmVFZCtnL2pvS0VUNjhsNFF0T2Y3VXFOYnQ1?=
 =?utf-8?B?OVpucXo0SUp2Q28vODh5S0pGNVYrellOVG1MMldIUVBVSDM3Qk1iUk9TME1w?=
 =?utf-8?B?MHRxNlJwUFFheDJpclU4a2JVcFpZY2hnVXFDQXhPb3I3SzhMUTlmN2xtenpk?=
 =?utf-8?B?dnNxcVFsNVlUS2VDZHVqaExqcnZGcDhLQW1zT1hHWkdZSlBtTUVubHhBcDZ1?=
 =?utf-8?B?QlRoV1VXNXNKb1p1cElwb3NuK0NDbU5CSThOOGxtZjV3MU9UU1F2cFFVOEFn?=
 =?utf-8?B?bG5XbjA0d0lsandqMGtWNTBjaDBpSjFjUE5XNHJDN3lrK3ZFRkZPcHYzOFI1?=
 =?utf-8?B?dGxvMUZCT3hVek13M0JoQktBQjJPOXYvaDhVSGtkSE9ETWlzY2xQK2lWRXhD?=
 =?utf-8?B?a0YwTCtyUmNINkJwNHc4V3RQTUVVdnc5Y2EzT1JvT3V2Z283NlZRRk5IUnJE?=
 =?utf-8?B?TzVyZlpLNUhBcHZNVEdwK3UycmczNDRLNmxtWnhDc0ZlUTl2d3pDOWhmQnpr?=
 =?utf-8?B?cjk2RmF1MVNXQnRGMkhNWFB5YUNpa2EvVWN3Rm80eTFPZWl1akRsZGxtVlpw?=
 =?utf-8?B?ZWJYREVEQlBKRk0zNnRqSUhCMlhadnJsOUhkbTY5bzE0N2JrVWhyRHpTSGx0?=
 =?utf-8?B?eVZzOUZNNEdRUkYyd2hYbnF2VEhEdVhRQjN0ZkZ4WTFmRmphQklobUoySEVp?=
 =?utf-8?B?QmNWUG5iYjFSd2VjZ2p3Q1FOT1o2bysvczBnL3pUcGFCOXJYOHo5VnR2QitL?=
 =?utf-8?B?cWdTdzNHYnBVdE9HVEd1YmFsc01iTjlVV1ZaUjdzZnphSlE2aHNxZHJnSWtl?=
 =?utf-8?B?M0pleXhXekhsbDlBdWk2S2RUc3Z4NlVpM0ttQzRBQlc4eEhuTGdIbC85bEU4?=
 =?utf-8?B?dUEzWWVndm5vaWNFZElXa1dyL1JoaGpRZGNqOVFSeTdMRXBYNmU5Nm1qZ3lt?=
 =?utf-8?B?eHpRUFVhWEtRVFk0NzZhZHIyVkFacWJzTFBibGcwRmlTa3lpZUJyTFRiVWxm?=
 =?utf-8?B?UUx6ZFQzNGF0cFVNQjFYNTB1TEt3MmFLUFVnRHRSeDJPemo0c1psUS8wOW1J?=
 =?utf-8?B?bUJtZTE2M1NyZjYvbzVuMWYrRGh4eEphc25yRm5RQVNmMGxJTk5iRHJtOUdG?=
 =?utf-8?B?V0xWVGF4clo2d3Nsek1SbDVoZ2syM01tQ1IrSjJrT0JSRyswUXMzQTlPU1Rm?=
 =?utf-8?B?eGtpYVpPaDhJaXJkNVNCVHcrSm5DOUpvNHd1Uk4xZGFNdXdjNU0va0IyVTdH?=
 =?utf-8?B?MWc4d3hQMFFTQWwybWx5ZDdiWmdTNkhEUkV2ZDhlWUo5cTRhY28yUTIvQm91?=
 =?utf-8?B?aHNPcWJWd3pPeHJLYnozcldYMStPZFdMVUIzbzBrS0FySXIvaDNjcUdIWkN2?=
 =?utf-8?B?NlZMQjZqajBxeTBaZ1NvWWtDdENxWlkrbmFkRVQrcnA4U3pJRklYczdiaFVG?=
 =?utf-8?B?cXBXK2NWMFFqZ0dkRWYzYUxMcWpxZTRxSk0wV3hrRjVON1cycnRwWG5xdkZX?=
 =?utf-8?B?SXg4aE5RVmpuQkxTdHpUT2E3NmNJM2JjMUZvZndZSmx2WEQwUFdUT1hkQnhC?=
 =?utf-8?B?aHlHQ3Y0c0xVNUhWRnE4OVpvN1lPQkFMdUMrYUpCTjF0dXRHdUxrOGJubFFi?=
 =?utf-8?B?NTMyZzJvM05BbHFRbWpQODBEejFRVnF2UkpGU0UvT0RpLzhFVjVqRWJqQUJU?=
 =?utf-8?B?Q3JqSWViaG9iU1FINldSQmFwRU1kVW5NRWswNmxLSHArbFh0WktKRGlkV1VH?=
 =?utf-8?B?ZmJaUHVrTTlxSGZ0Nys3RU80VHZhWXZPUTNJWlNlekhsU0pqVHRQNklpN0FS?=
 =?utf-8?B?S3RZQUo0ZW5jTHlSRU5RQ2dueS9rS3BzenlQTXBZZGFIbnZISXMyYnNuSVBM?=
 =?utf-8?B?SVZ2aTVlQ2c3VlhxdFFhT3JHbUxaZGhPeEVtZndpQmdwMC82TkFLSFE2QnlO?=
 =?utf-8?B?bTZVZDlaSHMybDVlc21mZ1VLdW03WlJyTzJKNjdXN0NsOEtYOUN4OUFXZ2kv?=
 =?utf-8?B?N3g0bkFuYzJCUmtZczZDVldleVIwejVlYk1ubFRhU1ZBdUU2cEdhc0tLUDlk?=
 =?utf-8?B?S3ZxeWdXMUliTUdBV2VGUXd2RktFUEhoQloyVDlweVA2Njh4ZFFVTXZ2WURP?=
 =?utf-8?Q?m2MIflnLbUOxAk61HjvrKkCfy?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0d6a0a-1bee-4b49-fa1c-08dbe76fcd73
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 13:19:17.8618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RQuIpn89n4WFmu8xFJFimA/KSMxPCbptn/0FS4hAVp+ZfZINR9sPw8nrPJ4OkF/Ejs5s6v5YVQIdn/YSpQhgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6542
X-Proofpoint-ORIG-GUID: nOYBwdYHtcNGXyhli3KxHvMX_ty0ms1o
X-Proofpoint-GUID: nOYBwdYHtcNGXyhli3KxHvMX_ty0ms1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_12,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170097

hi Julien, Oleksandr,

[..]
>>
>>
>> This patch series only covers use-cases where the device emulator
>> handles the *entire* PCI Host bridge and PCI (virtio-pci) devices behind
>> it (i.e. Qemu). Also this patch series doesn't touch vPCI/PCI
>> pass-through resources, handling, accounting, nothing. 
> 
> I understood you want to one Device Emulator to handle the entire PCI 
> host bridge. But...
> 
>  From the
>> hypervisor we only need a help to intercept the config space accesses
>> happen in a range [GUEST_VIRTIO_PCI_ECAM_BASE ...
>> GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE] and
>> forward them to the linked device emulator (if any), that's all.
> 
> ... I really don't see why you need to add code in Xen to trap the 
> region. If QEMU is dealing with the hostbridge, then it should be able 
> to register the MMIO region and then do the translation.
> 
>>
[..]
>>
>> I am afraid, we cannot end up exposing only single PCI Host bridge with
>> current model (if we use device emulators running in different domains
>> that handles the *entire* PCI Host bridges), this won't work.
> 
> That makes sense and it is fine. But see above, I think only the #2 is 
> necessary for the hypervisor. Patch #5 should not be necessary at all.
> 
> [...]

I did checks w/o patch #5 and can confirm that indeed -- qemu & xen can 
do this work without additional modifications to qemu code. So I'll drop
this patch from this series.

[..]
>>>> +/*
>>>> + * 16 MB is reserved for virtio-pci configuration space based on
>>>> calculation
>>>> + * 8 bridges * 2 buses x 32 devices x 8 functions x 4 KB = 16 MB
>>>
>>> Can you explain how youd ecided the "2"?
>>
>> good question, we have a limited free space available in memory layout
>> (we had difficulties to find a suitable holes) also we don't expect a
>> lot of virtio-pci devices, so "256" used vPCI would be too much. It was
>> decided to reduce significantly, but select maximum to fit into free
>> space, with having "2" buses we still fit into the chosen holes.
> 
> If you don't expect a lot of virtio devices, then why do you need two 
> buses? Wouldn't one be sufficient?
> 

one should be reasonably sufficient, I agree

>>
>>
>>>
>>>> + */
>>>> +#define GUEST_VIRTIO_PCI_ECAM_BASE          xen_mk_ullong(0x33000000)
>>>> +#define GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE    xen_mk_ullong(0x01000000)
>>>> +#define GUEST_VIRTIO_PCI_HOST_ECAM_SIZE     xen_mk_ullong(0x00200000)
>>>> +
>>>> +/* 64 MB is reserved for virtio-pci memory */
>>>> +#define GUEST_VIRTIO_PCI_ADDR_TYPE_MEM    xen_mk_ullong(0x02000000)
>>>> +#define GUEST_VIRTIO_PCI_MEM_ADDR         xen_mk_ullong(0x34000000)
>>>> +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x04000000)
>>>> +
>>>>    /*
>>>>     * 16MB == 4096 pages reserved for guest to use as a region to 
>>>> map its
>>>>     * grant table in.
>>>> @@ -476,6 +489,11 @@ typedef uint64_t xen_callback_t;
>>>>    #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>>>>    #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>>>> +/* 64 MB is reserved for virtio-pci Prefetch memory */
>>>
>>> This doesn't seem a lot depending on your use case. Can you details how
>>> you can up with "64 MB"?
>>
>> the same calculation as it was done configuration space. It was observed
>> that only 16K is used per virtio-pci device (maybe it can be bigger for
>> usual PCI device, I don't know). Please look at the example of DomU log
>> below (to strings that contain "*BAR 4: assigned*"):
> 
> What about virtio-gpu? I would expect a bit more memory is necessary for 
> that use case.
> 
> Any case, what I am looking for is for some explanation in the commit 
> message of the limits. I don't particularly care about the exact limit 
> because this is not part of a stable ABI.

sure, I'll put a bit more explanation in both comment and commit 
message. Should I post updated patch series, with updated resources and 
without patch #5, or shall we wait for some more comments here?

--
regards,
  Sergiy

