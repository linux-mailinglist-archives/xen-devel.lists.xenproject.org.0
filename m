Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352EA8FFF04
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 11:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736451.1142540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFVgV-0001SQ-AJ; Fri, 07 Jun 2024 09:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736451.1142540; Fri, 07 Jun 2024 09:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFVgV-0001Pl-7Z; Fri, 07 Jun 2024 09:14:55 +0000
Received: by outflank-mailman (input) for mailman id 736451;
 Fri, 07 Jun 2024 09:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERR9=NJ=epam.com=prvs=288857fa54=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sFVgT-0001Pf-I9
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 09:14:53 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64e2fd0d-24ae-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 11:14:52 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45769RDY013605;
 Fri, 7 Jun 2024 09:14:37 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2040.outbound.protection.outlook.com [104.47.13.40])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ykvp6rjun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 09:14:37 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU0PR03MB8981.eurprd03.prod.outlook.com (2603:10a6:10:477::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.15; Fri, 7 Jun
 2024 09:14:33 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Fri, 7 Jun 2024
 09:14:33 +0000
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
X-Inumbo-ID: 64e2fd0d-24ae-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYOnVkWUUHaqMSpkk69QKjRiMTUJhdfh1v+Ow5eGCEt74p5tEsSa/pOIXq/57Ek3mTyEI85Yx8MARnDogUZ+8cpYy3/sBsCoPZpwW06jQJua7JTysGMNuW5W7us9Jd6JlYTq/gZZspztpPdbuXJwhjdtvSxzlU8S1vmb1rHR2EYYZfnFVxQaTBI2Jr/ce4P7YTupyz3s8KjCttFwk0+ikGvhqyJtD/yQNLg0ok5oErWqeHkILnKuPgrWG3Ad5WBDIZxrorHADZP/wh8ldp9UmTqFSmyQywGEQk6qRcVnAvb10fLwFPmXp77fLLx0GAKw6W3BAdrvgz1TRTYDcfVYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiKVYOgXgaZpYoJuUo4D3kT4lGfZJ/ey2VihoOkDpHU=;
 b=F79Kl81dmgOYVf+6fzuohp7kBQuUdwdrmhsZH+5DCuFr+c1qnzbQXMTgpn6Hp2RUXVYzd9kzJ1Q+IURBsTWQ+cd71oW7Ol9IcNZxLbeg3ZVPOge1mYP+7W386qOqGFRRJjHc4KH3J5gkk3u6V4qd+hByx6/4FtBWznzfe9nD+CYj5HH0yjMTWYCTz15M/c++X1HDMJX2ctjjy07cMPy+b23aRQ76VlvGLTdX/B43ulK9PGCaReYvFtBPSi2p2pSBoPbn2Omv5WvQXJ5drT7YNIp8P14qqfWa6ohcF3cNz4NAtjFhfX8mOeTUtU5M5Gcun0jO2n3NwigRgm7Fdyxotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiKVYOgXgaZpYoJuUo4D3kT4lGfZJ/ey2VihoOkDpHU=;
 b=su0M8Y+VW9cYdpvsaHGTsPdgbGBQFCGM20K3Bpz/jpBIfGzs/ZMzVB1VPUh4DT0e8oRwqQ8kV/JAo6dzZ18znJXXRnAi2AGQfCzgtkLvuzP0bxqhk0O5Ea3GhC1Ds40jid1J7B7gQOG1tpf78IK8mQ5DIIcm/ZqISt+BOR5eJjxZSV8SXhZI+jR1jal4iy0J8FUMV4YRUd7ms8lFzuFI5lbOWYi27oHxuFiRn3+ZpSTy60rS7qQa4QwF6csL2RMV9nJZbzZf/2cRVK+venN+lND1n2Ra854JusGfv/F0Ir/Kr7Ef8B6oUk7oSaZ0HEekryf193qyHWnLD/QHmhMXAw==
Message-ID: <647b086a-04b0-42be-a7b8-a266c4f4e64b@epam.com>
Date: Fri, 7 Jun 2024 12:14:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/cpufreq: separate powernow/hwp cpufreq code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
 <5cb13d1a-1452-4542-b50d-23e6a9d9d3ef@suse.com>
 <c66966da-bbe3-432e-8a2f-809bf434db39@epam.com>
 <ab57f7f3-ac54-4b41-950a-1f7bee4293ab@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <ab57f7f3-ac54-4b41-950a-1f7bee4293ab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU0PR03MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 844d433e-8692-484b-6c4e-08dc86d23e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REpGcmtWRnNsR0NMK2pzdUNkcDVjTW9TOTRSamc1RU81VnNvTmZqd1QzclFH?=
 =?utf-8?B?b1k4OEx1Vms4SHk4NmdwdGt2SzhtNk52cTdtR05Ed2dUSHN6bEh0SlBjSW95?=
 =?utf-8?B?Q3FsYXRmbzdabXNidkgvV1h2SlJqTUdLS3RHL1NaSzI3ektmRDIxd2orMjl1?=
 =?utf-8?B?WEgyeDZlaGk2MXI1dnoxdk83ZG0zYU1IWUcwdExnUVBHR0d3NUJpQldueUhX?=
 =?utf-8?B?M2NoZ3ErUGtuZmpTTlZGczJuQkhDdTVNeU1DdHRnMzRoSXJiSENjQ1h0UDBS?=
 =?utf-8?B?Y2o0R1QyR1d1Kyt5aDlJTkNBUFcwdUtxVkxoc3BXK3dZRmUxaWV4VHNvOFNE?=
 =?utf-8?B?ekk4L2xwb0ZOZXdRTkFEeG8yTmNKWGx5NWZXL3BpVlEwM3RFMnlBQjZGTmpa?=
 =?utf-8?B?bDh2cmhrVi9ZbHNCN0pHUlhmWkt6aDkxNUN6R2lMMXJ4Y05MSzdGT2ltcDEz?=
 =?utf-8?B?cDNPQnYzSGJJWkVFY2lXQXAwYUR2Zzd3WmxUdzVBREE5RzFTdTJ6a1A4SlpM?=
 =?utf-8?B?WXVWS0IveDhHNVZQczl1MGUrWUVRUVJ2ZXU3RkFYWmI1RW1icXJEczgzbkdy?=
 =?utf-8?B?RFZFYzlxbmdxY2RrcDR4M2U4Q3Erdnc3VWJwMTJvaTZUdXNJVnB5R09FY0ph?=
 =?utf-8?B?WVBQNGpyVDNBcCtwWmFkMEFITWxVREhQcFk3c0NhVURNbEFHcXZmSHJreUo2?=
 =?utf-8?B?M21ZSzN5bStZS2IrWXhqd3FGT3FWdTdyM3NBZFZDQVJ6YllKZmpKcXp0NU9p?=
 =?utf-8?B?dE9XNkRmS0srblNNNEsyZm1JRGVLbWlKRTJvbURHakVqVlBMaGFhM1BIZnI1?=
 =?utf-8?B?b3J6OUNTYTJuT0hXYWhKUEZ1cGlCRlptdnhHUmp1TlFoT05hRGxKMitxdzZu?=
 =?utf-8?B?ZFVNU0g0M1dJczF1NlV3Qm45TnV6Q2drUWN6ZHZ6czJFa1RrNzdKY3d5Y05i?=
 =?utf-8?B?NDdGc0RKT1RXQnc3MlhZUStBMXlEZ2F2NGJSY0lYRmJlR09hNy8xYXJJUHBl?=
 =?utf-8?B?RHMyMUpEVGRrZlBVajV0a0JzK3ByL0NpYzlMS3FORUFRVjh2czIxSXI0K05H?=
 =?utf-8?B?bHhJczlxcWt6NDNhczJtVm1sT3dZdE93K1U2SnpYSlA1UXFPdWliejJ4b2dm?=
 =?utf-8?B?QjlyQUxBNTc1aDBaZkhKM0NqVC9YU1BycU5JVnl2dkdTeW1TVFZqd2laOGN0?=
 =?utf-8?B?V3RnbFo0ZmsvZDIyL2hiSGJTdHFJd25XVGZUTVJ6alhMUWNwYU44SjJuUUQr?=
 =?utf-8?B?NDlpM2VnWXdjNytqbDd0RTdOOFdWaUxLSkc4VitSN0t4dksxMDZqQnJJK0Y4?=
 =?utf-8?B?NkwyRUg4QkN0RGV1Znhhb05sVWVXdGJ0RGNSSjRrOUp0bE1vTllpYys5RVlZ?=
 =?utf-8?B?SThkbVVRNkhDTFZFWTFRYU9aUEtyc3ZtQlZYcmt2UUNVNXFyQm05NkI2UGxT?=
 =?utf-8?B?VndvdkpUZWpEVkFZNGVJeThjcEZ5bGZMVndTSTZBdU83ZFEwT1BiZFBwcHY4?=
 =?utf-8?B?N1RVU1VwOFZNQUpMbFBBekcyS2hOZmpnQWQ5QmphOUFIeDJtSW4zUFVKNkh3?=
 =?utf-8?B?VjVEcEtVOW1GZGNXUHJDN2E0U3hnUEhQK2JMM05rNkJwQ3VQN1o0bFJwSVVW?=
 =?utf-8?B?aDFodXFxNU1mK0NEK3B4MnJiUGtBbnRtaGtzd1VpRW14VTR0T1pBdDFlVCtY?=
 =?utf-8?B?WDhlMjdaa3pzbFMxZldUeVZyUGFwZGVpWEEvV3FVQURnVHBxT3Q2VmdwejY4?=
 =?utf-8?Q?gE/AE1I3xcPahMux3Oy2tm2vLF6mAVMqrGi0cT6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1d2YmVUWm5Gb0trZlAvUmVxMENRVWY4dEhvVmFBNjZTQTR0azJ6bi81M21G?=
 =?utf-8?B?VUJIWXVUVXREdnRONjlsTCtHVXNTMGswc2t4U0lHTzMwdUJPWlRsMnVkM0h3?=
 =?utf-8?B?aG5qSXEyaTVVUGFERkN1RWo1QUVBSlY5dkF1QU4wRFBEaDRVTElhc0t3SStO?=
 =?utf-8?B?Z1pTUTYxdmx5RVZlSlVoREVjS2pYWWxHRUxCbThWU2l5Y3hJMTU1R1JKQzhO?=
 =?utf-8?B?Z0x0U3dpdUJGdmZMR3VyTUJEeEY3dTdXQWhLcFVIekJoakJKRU9XV1VqM3cz?=
 =?utf-8?B?RkVCbVpHSTZ4MXFOVlZSS213aDhNSEg1d0tiQVdiamRacVoyMTVUMFQrQ3lS?=
 =?utf-8?B?eHpSQ2VWdkw4UDZNallUY0V4Z080bVIzN2xlRjBVUkxWWkhlVDNvbEkvZ1g2?=
 =?utf-8?B?ZXhIb2hGTm5WcnBsTkF6cHhyTmVpSjdKdEJOSzI4OEE4dUlwalhGRUZvMVZT?=
 =?utf-8?B?Y1hvaXROelJsMjJHbEFJTzN4VmNySWNJVm12dWNmRko2alBDZCtJTWxZLzhy?=
 =?utf-8?B?di9VMU1tSFY2Ky9oVUFTdDF3VkpWZ3R3RUpsRzZNRzdHV0FPSUJlQXErdjJi?=
 =?utf-8?B?OUoySWZOcG1LaEY2bHdUZ2p3dDBrMDZtc0IybDdOK1FWcFYvMVptUldKYVZn?=
 =?utf-8?B?WmlEVjM4bUI1VXFoVWxCZUQ5SnRzUGgrV2pvZk9pRVhyeGh5VFRqYk9XVnFk?=
 =?utf-8?B?eU1FdUVzMklQR3RPbWdLbTlaRDNJNG5ld2MyVXAzcm1kV2NGRk9nUGpDT1g2?=
 =?utf-8?B?VjJSSS9vYjFsakVnQ2hrQWJRUGZPbzJZUVNxR0xVcnZHZkR1aSt2ckpibDdM?=
 =?utf-8?B?WDJjblkzMVZCbTNkQ2RnQnF2WGM4L1R6N2lmUmo1T21SY3JLbC85cEhUdFY5?=
 =?utf-8?B?NlpoWkxBUG9KaTg1dTUxZFNuLzBYVnhxRjFvMG4xN3JoRG1EYTNFcTNnNFcw?=
 =?utf-8?B?YzVYRUVqenFTeGR1M0E5eFh6d1FTZ0FnMUI2YkpHMVBvZFQxV204ZUtLc3pF?=
 =?utf-8?B?M0VBMExkUjlCWXBSSTlFazlOTDNFOGlyRkhrYTFXbWhjUTdGZ2Z0MnFKV0tZ?=
 =?utf-8?B?aDRLZWZ1VExyMWZ5aE1MbGFCT1U4d1Z5TWJRRGRuazFaSnYxSGVjQWZDQjdq?=
 =?utf-8?B?WWtTRWxyMWcyYWJrdnMxd0RvaVNIU0lPRWVnM1BUL3N1ODQ5TXVJSGdid2Zu?=
 =?utf-8?B?cVAvNXZoVTk2WEgxbklQTlUrb2R5WTRkYi9xY1lYTmpYNEhCMEZkcENqVW9z?=
 =?utf-8?B?Umd3S3psc3Z5VU55THl4MFBBMDVKU1FVRkdPbFpiVzJObXhMYll5c1FHVjN1?=
 =?utf-8?B?US9hSVgrT0FTTHJXeG5NMld5REhuWUhsWGlld2VJWWhwb0FmRWNEQ2JHV0Jy?=
 =?utf-8?B?eFBBQVF4eEtHZXRtMVZKdmNxR2x4SGpaRldKTW1aS0duZXV2c2x2MGZieXdv?=
 =?utf-8?B?TG8zTGw4enJucmpyRmxVenB2cWlnMjJRVG1VK1pVTS84RjRnWGM2L0J2MnFC?=
 =?utf-8?B?TzRpKzk4TUpyMUx0T2tIQ2ZYRWtJbWNhZWpTbkJoZVBaalB2SGJnb2prMDhE?=
 =?utf-8?B?UDVUcCtaRStWK2JoS3VQN2Zjc2cyYjduZFZodGZucUhQVGxOUnBBTUtHaHpq?=
 =?utf-8?B?ckhtQk5ubHZLRFRFMXZ2eHlocE5RQU1hU3Npd0pJZnVKeHR2TlprTG53WjVW?=
 =?utf-8?B?eEs4Qy9Od2Z2SUR6YTFtTlJxek53TytmWmlYSTRJNmV3eVh2TlIxeUt6R2pp?=
 =?utf-8?B?ajVMeU5QRDc2aDU5bVBDSXlCRnNKdSs1OXhpM1ZxSHBmS05JQ0FOcm1zWFdU?=
 =?utf-8?B?c1ZEcXc4NnlHaCtWVDFqNkhUSGdlamJ6c3Fya01keFdXS3NjODBkUjdyUERy?=
 =?utf-8?B?R24zc0VEOWhEeEpQWDdwNmlTMzJMc1dYV2krZjFGMzk0bmtsNTQrMGtyM1ly?=
 =?utf-8?B?S1Juakx6ZTZES0VuNldVeU96cW04U1djWXEzRmhxZnlkQ1JaZnI3bG1TL1J6?=
 =?utf-8?B?aDFCeHVvVjdIbllvUHdvRHFYU2VGVzFmeUhKM0ZGRTZPbSs4NWx0L2hkbTBu?=
 =?utf-8?B?aU45WElaVWhFQkJKTXdWU1g2TGtUdWtPMzVVRFFJRzdTVnU1THQ1b3pSeVd5?=
 =?utf-8?Q?f816imtojE0NpqieXZR3G7yii?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844d433e-8692-484b-6c4e-08dc86d23e9a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:14:33.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAFM+Qu4/pO/5oPATkvA08aBT4okO2iFTB9dU2PuVY5JR5ObflMaBzbeFZY9LwEYsCqE7WEQ7oCRsNZccLtFfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8981
X-Proofpoint-GUID: f23x7LXJJyCBkg_1Dwu6Ur0MIHtBW4Fw
X-Proofpoint-ORIG-GUID: f23x7LXJJyCBkg_1Dwu6Ur0MIHtBW4Fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070066

06.06.24 10:54, Jan Beulich:
> On 06.06.2024 09:30, Sergiy Kibrik wrote:
>> 06.06.24 10:08, Jan Beulich:
>>> On 04.06.2024 11:34, Sergiy Kibrik wrote:
>>>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>>> @@ -657,7 +657,7 @@ static int __init cf_check cpufreq_driver_init(void)
>>>>    
>>>>            case X86_VENDOR_AMD:
>>>>            case X86_VENDOR_HYGON:
>>>> -            ret = powernow_register_driver();
>>>> +            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
>>>>                break;
>>>>            }
>>>
>>> What about the Intel-specific code immediately up from here?
>>> Dealing with that as well may likely permit to reduce ...
>>
>> you mean to guard a call to hwp_register_driver() the same way as for
>> powernow_register_driver(), and save one stub? ?
> 
> Yes, and perhaps more. Maybe more stubs can be avoided? And
> acpi_cpufreq_driver doesn't need registering either, and hence
> would presumably be left unreferenced when !INTEL?
> 

{get,set}_hwp_para() can be avoided, as they're being called just once 
and may be guarded by IS_ENABLED(CONFIG_INTEL).
The same for hwp_cmdline_parse().
As for hwp_active() it's being used many times by generic cpufreq code 
and even outside of cpufreq, so probably it has to be either a stub, or 
be moved outside of hwp.c and become smth, like this:

  bool hwp_active(void)
  {
     return IS_ENABLED(CONFIG_INTEL) && hwp_in_use;
  }

Though I'm not sure such movement would be any better than a stub.

acpi_cpufreq_driver, i.e. the most of code in cpufreq.c file, can 
probably be separated into acpi.c and put under CONFIG_INTEL as well. 
What you think of this?

  -Sergiy

