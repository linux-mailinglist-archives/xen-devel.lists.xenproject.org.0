Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E484795467C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 12:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778454.1188485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1setpX-0006u7-9o; Fri, 16 Aug 2024 10:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778454.1188485; Fri, 16 Aug 2024 10:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1setpX-0006rl-5y; Fri, 16 Aug 2024 10:05:11 +0000
Received: by outflank-mailman (input) for mailman id 778454;
 Fri, 16 Aug 2024 10:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRqj=PP=epam.com=prvs=4958420f8a=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1setpV-0006rM-PZ
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 10:05:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 037ca5eb-5bb7-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 12:05:07 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G9LVcQ002533;
 Fri, 16 Aug 2024 10:05:00 GMT
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazlp17011025.outbound.protection.outlook.com [40.93.65.25])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 411sxn1bck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2024 10:04:59 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PAWPR03MB9010.eurprd03.prod.outlook.com (2603:10a6:102:338::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 10:04:56 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 10:04:56 +0000
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
X-Inumbo-ID: 037ca5eb-5bb7-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+IXf6F9WpfejS1C3u5w2KMlCXs5J36ADS1Gt9/DA6Eo4bCHaMAc93pIMNd/YkfxM/KJlKzUUWlv3pe1PmI5RFSBIO4sgdCDcnP/GZ8tb08E7AH8vKIwT14g4X4kg/7oENGGX+ZRboqHq3rH7Lg8rZeIdaxY/eNyoee5H6eklynwSNpuLIleOn9EvY7YNHireBan99ia7jVuI5NxFnD+eRswcSu4Jyd+QfAMRO7dOg8i316lFIuB/OKA1JcsHlAfsdv/Mz2PbsiM5r5DVGcK3zdTlhkhEOixq43DKvjjF9IaQ4q1/C39HZ3J1wKZGdAZMFbxbnxc45LKfsit6ba4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhXL0oaIJGettiklgm2AZOji3swPxQIyIWGgItFMpFE=;
 b=DpI5PxJHisrdeh9f0/S9cPCyPDvd98Tpj/iU+Nph1o67/6Z+vmDtkoBwgwpNiEVVznXyxpVDrVY/dSZFzKis3DphIPBQEbemOu6M9/g1G6gtYRqp4HpD4jI8w/saPPfH3O9qtz3TB456RZ4ii//fwA/8netNIfW48/LD5od5ahkidN+JXqjhaWL9/ohndJ9+IosqM4vYWmMkES0ERHZgwdQsifx/DLQvj8Ge0DQbOWW/mWoVCa2EBFjcXSyqD77+iyZgM98VLidgkPrvuaCok8p30idiHeaPrp2q5Ho0fXoHRnUkl1PCCJoNDxkQi9ZrkuGqaR35lUaeVuridYrCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhXL0oaIJGettiklgm2AZOji3swPxQIyIWGgItFMpFE=;
 b=jc7pVM4Z4KOFMfGm9Xnc6xY8Iycrw75XCtlwZ66sIOk61siN64hTv36PFaBLhN4mFWKy77L21q70bjhqhcmCuNC7znsO4marHVuKuaJktVzZtaidpDIFT4OoFETH2/YOU1wQ/iid7h9tjnGrykhSNm5cemAmvHWwLucTq5PKVIEq+HYMDobVP7Y/y/mDPxEGNnVScFmho31NtV/+0a2aNeUgBC6QrApDExdBSAipr0HFKWt5OGNFiMBzcBls18hczFGIFyS2Q5mbK7iyy76Sljnpgbm8oEll2pGrEZFsroehRoG4hv1xqP63sh2WJ1VTcb+7zqCbSeZ1oUf2rdHkGg==
Message-ID: <2f9b2355-1073-4d55-81d4-28d7dd245d83@epam.com>
Date: Fri, 16 Aug 2024 13:04:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6 2/3] ioreq: do not build
 arch_vcpu_ioreq_completion() for non-VMX configurations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
 <04e5397ecfcdb4d5680c7d36f71c4b471004ccd0.1723110344.git.Sergiy_Kibrik@epam.com>
 <952701cd-83d8-4c1f-9f38-ee63ba582d66@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <952701cd-83d8-4c1f-9f38-ee63ba582d66@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PAWPR03MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: c76606ee-c339-4da8-19de-08dcbddae185
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekQ2enpkN0tVbnZyc0RYN3ZRTTNrNFZHSGFSZHlNNHd1RXdUZ3VhN2hRR1lu?=
 =?utf-8?B?TitKSmJIaXlSZjd6K3hWeGJ1emZkdk9adU9ZRWFJSXQzUjQxYU1TU0lYZWtt?=
 =?utf-8?B?dmU1OU9wbVhnNmhQaG9Rd3JVbUpxWEV5ZzFwWldGV1RiTktla1R2L2hiY2Vm?=
 =?utf-8?B?b0ZtWVh5a3MvT082Vzl1dUlmb2Q0Q0tpanYvdnJ2TUVSQjFmRGVqV1BlVGZG?=
 =?utf-8?B?QjFhMjQxQWFTTDdDOVJpdDVOdWt1cDBNTFcweFIrQ3c5MitWTUcvYTNNYk1H?=
 =?utf-8?B?SW9EeDM4aUwvQ1Z2dGVHVlkwUEFUN3pmK1JERldPbjFTVVcvcDZVM01BY1Fu?=
 =?utf-8?B?VTVDUFJHeGd4TzFmS1N2Njk4SkVyYTdKNkhBVjUwcWUyTUZhRHFsWWwvNHl4?=
 =?utf-8?B?d0NreStTUTgwR1NhRkRBSlRqNm5UaWdhTndFd0J5b0c0R0lPR05xU3oyUjU2?=
 =?utf-8?B?RHc2Q0NkdG5wdjhpM09ISllBeVU0QytUbTdYS2tRbzJVbkpobmdnemNWNnhI?=
 =?utf-8?B?eG91bGNGdkZ3WktlMGI2SHpTbitwZ1lSMzNYUmJsQzh1YUdYVVduSEF3ekw0?=
 =?utf-8?B?NEJLYnJ0U1R3T2c3MUhPNVFLUzRONGVDcEg5VTJrb3l1S205MUFxU1RKaHdk?=
 =?utf-8?B?YW5haFdSN0FRZXRrTmVHUTFtMmJobXhhWmxrWm9DU2lOY2JNK2hkYTN4OC92?=
 =?utf-8?B?UmRFN3JUYmdzQm9YSkhKMEJjRS9ieUxqeExUWUY0UnR3SUVQNXdDcmdXQnps?=
 =?utf-8?B?V0NITzA5ZGd2VWRVWVdvQlJNcVZiWDlTbTBNay9VeDNZSmJyaytqVmNndW1H?=
 =?utf-8?B?T0hRT0ZBRjhvM29vMVVQek56Nlh5eXUyNmVXa2J0VzN6ekRqemFNb0hIbjE0?=
 =?utf-8?B?MkR6ZjhuOS9uMmh2K2JCWFVpVndXZ0VEREtkcmd6b1krMVZyQTBleTEwVEtI?=
 =?utf-8?B?cmdDM1BucllIZEQwSUdzTS9wUFFuc1hTTmt3MXhWLzA1eWJQOHBoektqamV5?=
 =?utf-8?B?ZCtzRzFKYlVSMDFVa0t3T3A3MUd2Z2k2MkZqNDIvUW5RUlBjRWVOZXN3bzJU?=
 =?utf-8?B?NzNCcnkxZWVydVRJZ1U4T3Naa2VNS2diQ3oyN0phNEkwLzRUOFkwZW05WW1s?=
 =?utf-8?B?QXhuaTE5U1ZFWld2Z0k0RlBvOWFWd2FJV2I2QVNNY0RDTDV2Vk5PYmtSWU9z?=
 =?utf-8?B?bmJFT3JPaWd6ZHU3aFBQOVVJVXJ2YXoyMnRZUTdjNDdCQmhnZkRJa3NQbFNU?=
 =?utf-8?B?SlJocWRPT2xocTFKR3l4M3gwRHBnaXU3RWxUK1lQMVl3YTl5b3dDTlpzRThC?=
 =?utf-8?B?WHF6U3NkS1c5Q2c4ajk4UzcwZ3pySkl2RXJ3ellsdDIzODJ5c2JhZ3hRVkNR?=
 =?utf-8?B?dkxmODhHMWM2V2IreVQvVnFzQU5tK3hVSXVZQ2NzODNIRmplQ0lqTTFoTStl?=
 =?utf-8?B?aXJvZWhIUWFxcVNtRkFnTjdadmM3SnZRSEdFekZSa2RvdWI0ZjVVby9icW9D?=
 =?utf-8?B?WVZmc3pwWnBxdGpXZk1sdUJ6VTVWb25JZDRGUHA5amdkWXd3QzNiaGNsM2VG?=
 =?utf-8?B?QXlnSk1QOXAzMDZUTFU0UmpxQnMzZ0I2dWtFYmMxYjZyUVRwZUJzcEVheUQv?=
 =?utf-8?B?eGhsQnFITmxRUXU0K1FiMml1T3ZzS3pUeGtVNlVETTFZMXdYclJlcGo5VjI2?=
 =?utf-8?B?bGlIczZjR3BtMy9ONXQ2U3ZjSXBGYUM0blB0U1N3YjlWMlRrb1d2TzdvYmFs?=
 =?utf-8?B?cjRBZVJQTnBaQnpFaGtvaG5LeGFUeE9BbFo2T1h6Zk9vb1BUc2xCcGpmcCtS?=
 =?utf-8?B?N09ER1NsbkFTOVAxVGZTUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFlFb2JhemxrZ3QwMTUwK1R6MVJyMCtKK01UTWVrdlZidmxoenVnd3o5Q2Fp?=
 =?utf-8?B?RzFBTnVSUmZ3RkovY1RoeVlhL3diNnFscHJLcHg3dEtKUG9YMnY3K3FJRm02?=
 =?utf-8?B?cE8xckZJSnY2Y1VnRUEyTFJGNFRBZWlnWFZpQmZzTUlEMHZiMjZrMEdSWHA2?=
 =?utf-8?B?M3lUS1JPT3JVWGVocGtiTDJlQlVDY0JmWDRKTzRDZEQ5K3paWCt2bEFFRTBw?=
 =?utf-8?B?KzBUcEhMVFNwTnYyNTVFdTVubkdiajBuVFdBODdncUM0d3RyRVR5UU9wdVBS?=
 =?utf-8?B?Vk5LU1JXMFdKSUVBcWMwYkRXU0VncUZmY05YQWRCdHJHZ2VTMjZhZ2pMYmpD?=
 =?utf-8?B?Qk9Fa0hDc2NBeTk4YVU4K3pGMkVMM3RtMTNFRG9iaFBNTjVUV3pIY05BVlBz?=
 =?utf-8?B?a0ZQWVdjNnRIaVZ2cFVRelZIR1BjSFNZQ29XNTQybXk2M1dOWm9vQXRsdFdM?=
 =?utf-8?B?VFl6SHE0M0tHV1NRcXRvdXVIVDA5VDRpckdoMDI3L0M1cE5Qb2x5amk1R2xy?=
 =?utf-8?B?OU5iUGtKV0wwZWR2dk9MVTQwcC9oczZKdWpFbnI4YnQwRTlVMzd2c1ZQaVBN?=
 =?utf-8?B?ZUwzLzdTNW02R1FPd09tRWoyZXlONlhoSHRQejZXbEg2Q1diU1JrMi9WUlgw?=
 =?utf-8?B?YnZwSzUvYkhzSVJlNGxWOTVsVjhaU2VwNCtXcTNVRXNXUzZaRnVEQjc5cGRk?=
 =?utf-8?B?RVRuekl4d0VPNlFuUUpxTThXNU14VXE3bjZRRmNqZTRWbjgySklSTEMrald3?=
 =?utf-8?B?WFlYZFBZL1o2d2xMWVZlRWdWRmtzdXJ3cXRiK05LbC9qWmhjY3Y5UVlmZ1JO?=
 =?utf-8?B?cDIvUUNuZDJhd21mTUsxMEdsbTMyRStYNktQQkV5SXZQRUJJWFc4ekFRc0JG?=
 =?utf-8?B?ODNRanRCaW00eDBXdWhmOENtVW1uNUgxWWtCdHgyRFAvczlINmlHczBaSkpX?=
 =?utf-8?B?SW5QUzNneHgzUVo2MGFKcVE3Q0xEbk1VM0VleUVtRU52NkNrWkJ2Tml5YXUz?=
 =?utf-8?B?d0xEV0c0TmsrVXdhdkluOU00YXhaTlpXTTZEQnFLeW9lSVVERjRaR2psdnNL?=
 =?utf-8?B?TloxUHppUUw2VkdPd0ZXL0sxQ2tETjEzVGdHT2VQTU5xSU1XNVJIa2dMZTdQ?=
 =?utf-8?B?RUd4eGZrZlk1a3hCOFAyQUVGcm1wRnJUSmtOdHFHTEtRNWIrOTJiV2Z2aUM4?=
 =?utf-8?B?MHViMW4zdjQ3SGJIMVdGOW1pWnZkVHVrVWdtblF6QjZuR2RCdGxlbkY0ZGVX?=
 =?utf-8?B?L3Z4dG5sK295QWR3cFEzM2dBTURyWHl5dDQ5UkY2cVJEcFUrTE5Ydm1HTzdr?=
 =?utf-8?B?TEJOWUlGSCtudGYxMm1XSkNuSVc4YUVHZmk4elZsQjNiYS9aYTVyd1h5WlF5?=
 =?utf-8?B?NDlYa2FYY1ptWmhxYWRRd2lLV08yVFdBWmJNYzQwR0xBRjI2aDhMWlY1MWtz?=
 =?utf-8?B?SWpWaVV4MjZDMUdBQW9odkZFVXB4eGM3bS9lK0EzL1U1b1FXZ205U2ZRTUxs?=
 =?utf-8?B?b3NOZHlIdlA4aUttNEtwQ250NkRtQ3pvQU4vQmdSUTZCVG04WWQ4d0F3NXJZ?=
 =?utf-8?B?dTc1eWtqYU01RmF0cTUzb09jN2Irc1lxck50dnF6eWFTUjREZ2tjWlhCOVBi?=
 =?utf-8?B?UTNMbTVHc1RjbUovZW5vaHA2eTkreTU5TGxuTjBqUm9hSWlGMjNvNFkvRnhD?=
 =?utf-8?B?N2ZmS05QQjJOOFF3VkUzTXU1bGoyckpXMVdyZnVSYnBtTXdZUXJMaTFRcHVZ?=
 =?utf-8?B?UVhJMGU0MnVTdzNwbG4xTVFnMGlIcGFyalBRSjNjY3JqRXpCbzF4UUdkVHUw?=
 =?utf-8?B?V2V2VTV5a0hFaW1pNkFyR1JwMzc4RWFZYURPM3F2NXBtRTQzRjZsTXdTZmZL?=
 =?utf-8?B?WGhOWS9qY3A3aFJWTk9lWnFkcE5XbUJaaTFod0F5dHVBRHZhdjdnTm40Unhl?=
 =?utf-8?B?MmxBVFkwUWtqWDhxaVpLUjBVUk5vS04rbkVBMUFMVXdiYUJzbUV6SXd4UjdJ?=
 =?utf-8?B?LzNUQ1JCU0piQXp1M0JsejZtR1JWaTlFZGtTaWVqeWdZblR2ZHdMUHlmdnRW?=
 =?utf-8?B?NWtPV3NZWHo3YkJqZjYrTFBaL0k0L05QaVVxYnJMakU1cnNBbS9ndlo2bXlj?=
 =?utf-8?Q?jqEfyum2YOqffZDYWknSkuZ4W?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76606ee-c339-4da8-19de-08dcbddae185
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 10:04:56.5113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3vYv9TEdgclvjSr/Z5OP4xZthF+D5vTpgGORX+1y5Z4c+RmWhdoOjx42itt7vb/VWHd00Hv/d1HmeeRfUL+1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9010
X-Proofpoint-GUID: 6EQVGg55vce0vnH68nefENrDpsSE4FZ1
X-Proofpoint-ORIG-GUID: 6EQVGg55vce0vnH68nefENrDpsSE4FZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_01,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxlogscore=944 mlxscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160073

13.08.24 10:31, Jan Beulich:
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -111,7 +111,17 @@ void ioreq_domain_init(struct domain *d);
>>   int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>>   
>>   bool arch_ioreq_complete_mmio(void);
>> +
>> +#ifdef CONFIG_VCPU_ARCH_IOREQ_COMPLETION
>>   bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>> +#else
>> +static inline bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return true;
>> +}
> My prior comment here remains: Despite pre-existing behavior being to return
> "true" here, I question that to be in line with coding-best-practices.pandoc.
> Imo the generalization of the stub is a good opportunity to adjust that. But
> yes, it could also be done in a separate change. If you really don't want to
> do so right here, then
> Acked-by: Jan Beulich<jbeulich@suse.com>
> with the two cosmetic adjustments (which likely could also be done while
> committing).

I'm inclined to do a separate patch, that changes return value of 
arch_vcpu_ioreq_completion() depending on completion being handled on 
not. Such change has little to do with this patch series, and also 
probably should have its own separate discussion.

   -Sergiy

