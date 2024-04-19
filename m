Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF028AA886
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 08:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708764.1107855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhwI-00023P-5o; Fri, 19 Apr 2024 06:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708764.1107855; Fri, 19 Apr 2024 06:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxhwI-00021O-2D; Fri, 19 Apr 2024 06:41:38 +0000
Received: by outflank-mailman (input) for mailman id 708764;
 Fri, 19 Apr 2024 06:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iezf=LY=epam.com=prvs=0839d8b339=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxhwH-00021I-Gl
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 06:41:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd47356d-fe17-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 08:41:35 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43IKi10I014918; Fri, 19 Apr 2024 06:41:31 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xk90nh87c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 06:41:31 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PAVPR03MB9357.eurprd03.prod.outlook.com (2603:10a6:102:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 06:41:28 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 06:41:28 +0000
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
X-Inumbo-ID: dd47356d-fe17-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRzKHbW9kbIXCq7luBYXxy+i9+9HYBf+50J5ahWgUl3gL7nzZisr6317u43PPvwjdScMkpPp/9jRc17ix+wOz0TOxXuG7aMMnOO61gkFV+CjJx99cf9m8fjVF9Nxc5Pf5zvh1zd2GK4BFJXud/0iMUffTmLMbtQOnQdCg3cbOMX4tdljbpbsv+uwu3WOzvqSSzU1CD71QeRbpzjOb411XUz59rTdZFh+9TE0/H+WJ6lIJIwHNyGClWvx8Sqnt1Qsl6Q+412v2RicI8PBeCB920GGvJZZChR9C1Xy708UmwZW1MppXyqkxnowPPouaosYvIrFWXXlrC1Q1GbYgpt0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GulJ1d412oYXl06ZPsjwTwmXkwtWKEQhJlb0LYN14VM=;
 b=PZLw7slpVk5Tyc5UxyzIv3um2+dFzz99enLhR+vvodgRWYuZxTlx6blrHgCBXcmi+HJ/oZszeLOcSYqDTmTWrvbik09JFh4+KOe71VmfRlukaVuE/Gwg5l1+Su27dORAJF/QUCJPvsRn9PJnJHhR0UUqnAingwjlFhdrawLCY/nNUIfSOnUshYWA5E6emyX4jQTrgZOwe9ypGNL3QOSMGPSpbZdjLBLZhv7e4CHkucWgeGBFXWsWhxNUybgVHD2gHpJQV4ZyO1vcs9BXbn0C9Zp9BkaFmg023X6G1QnbxxbwiQdjwroN53O6Gd7pDhQ6NUInVmQaAjfMCusLdToUjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GulJ1d412oYXl06ZPsjwTwmXkwtWKEQhJlb0LYN14VM=;
 b=Fc8uN0n+aof+8foceuxC02OZXuDVA2IAACHjGBnr9s/lFq00SPTP4yZALBHXB8V8r2eLYtC89w7o8EYGtk0juwNpLlD8drx9YMdTR61LlNafer8Y2eqhH5XRB6GEYDCk5m5Gl9ZU+W2TKibgl8s0duwv1wMxacyDBZ7YXGMmBxLWcyGWNcQ6wumIV5F9nrRQp1qX0mnuhaw2ZhhkvxW6Lrs9Eizp8Ak9C96drSY3F7VlVgA97tkGetuOk1WtquU/8ai6QEcxd/2CcAnbosbJHd6XE3PhWkcZJmc2lhrY4BJya4Oq5lefEtIz8jCUMvFrVm4Fse9mZ7pFE3c1GZKBBQ==
Message-ID: <d36fb08f-b0d5-457f-b036-b0a3c04950a7@epam.com>
Date: Fri, 19 Apr 2024 09:41:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 05/15] x86/p2m: move altp2m-related code to
 separate file
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <20240416062915.3469145-1-Sergiy_Kibrik@epam.com>
 <ba37afe5-7531-45e4-b56c-22761f8dc492@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <ba37afe5-7531-45e4-b56c-22761f8dc492@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PAVPR03MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: f459dd94-3f09-4260-5753-08dc603bbd7f
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v+vG4lPO+dLvj2eYrMUW6q1vUjHrhVL4gtc2hzAHd/qoyd7bjszwCdvDZnobdKfQOUqE7g2J+qp+LMHMbAGugdaqQWj2sEHjCjFUgGe3Inesu5wUUHEUCxh59P9HkCvjFP1IW8tuxAws5MbMf/CbtJcVKawrbJqJ9H7M+sEkMloZN//ocYvQ55xlVRdIhLdCn82TwvXXzNNbuIXNRcgQ65Iy22QhDEk6r3Mhlrfq2naDOM6eqBjWdjPUxY9A2rF1phLgKsMIi5stkehJga0YBzTcKMik/57Suxj49iCpeTTtu7HS21Z/IpoR/UT6129yembDPemG6xt/ap7EYGrypBJgDVePpFmrclkkBpD7r9m5jGVyrVpob04zdDy2OkoPLb+XBQ/zA/qCEcvQN6vtGUVWq3/wkx+QYERHanE1IvqaSfaYCQUDjGhk7bfA4avLW+BsJU44UjzovlI/ZwiJk84B1WSXZ8fZivEqK1LQqTZdrEPVWvyOODHAikSf58lgBMCd3/tgTMhkZ1+lAsKnBZrk1mOS+y3QKwX78kx9kIqFP3YMFanu5bC11te3FmyinCS4g9cFFc6xoYbhpC6H5JNjkCsoF2nN9DbCQAwanUklmlVZDsHF9+ywivUiV9s/4tOIBxXWOYHICA3CKY6X/R87+sarH0eSyU/nTr+0Gtg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TzRQKzEyQ0Q0cHNiN1diUXlSOXE3SWd6ejUyYmtUQzdvRjFyeElQK2swRzRn?=
 =?utf-8?B?QlcrT3lubFJ2NldLengrVWtzOXJaaHV6REZUZkdZMTBBa2F1aEJLeThEYmZ6?=
 =?utf-8?B?Zm5XdW9leTdyWnA2OGhHZ25ESnBYVCtWano5bVcxblhOY3RxV0RMQnlKK2kv?=
 =?utf-8?B?bE15dGgzcVlnWmUyME9BcWRtbUprdDhGMG9VUnpFck84YWZvbjFCd0owRGlv?=
 =?utf-8?B?QldTUXM3d0xCQWI1VnM5Y09iUzZYK0lMenNYQStLTXJMS2pxTjcySVkzVzJY?=
 =?utf-8?B?bXBSUFdBejJYLy81ZWpWb1Q5N3g2SDhYeFFPNXdaZFUwMW1tS2tadk9nSlZX?=
 =?utf-8?B?S0hURU5EeEZzSEN0TUN5eVluTU03U3BhWjhwaUJVZGIvSDFoSXlWUGNpbWhv?=
 =?utf-8?B?YjNDTHZ6UDB1SGE3UzFxQTltRC9RTnZtaE5SSHAvUWEwNjl5RVpPN0o5dmMy?=
 =?utf-8?B?cEFmWTJNZFdHc3hqSE9MR1lXWjAvNFV6TGl1Q2ZxaWNiTmtWRmhmb3JIQ3c1?=
 =?utf-8?B?MmFZR2RsanZzVERYTEl5K1VjL1luZG1vd2lUQkd6ZTFGb1laS1lrbWJlc0Jj?=
 =?utf-8?B?MTk2dldqTHhsYnlPci94WFMvcmNyK0w3TGZBa3l6YXNsRTNNb1AzSm9ZcjVM?=
 =?utf-8?B?clBKRW9SWjZEM0xxdTlDeVA0WDZkVnVnQ05NbUxEMlRJQzBPUGtUeFdLc0dq?=
 =?utf-8?B?SDl6ZFFlaEZseEtUNFkyNk40VVZqNEJrYUZLbGt5Y0lkbVArYUVCVUROZnlR?=
 =?utf-8?B?U1BUc01nanU1RFlzSlFCRGhDd2s4RXo5NitnaU9XdnBodFNUeFpMVmpVSnU1?=
 =?utf-8?B?TTZmMlcwbi9SdnYxcjFlaFFZRS9rUExPRno4cVh6cDhXNVFYZG1PVzltb1kr?=
 =?utf-8?B?OEhwWUQ4Q0NRNHE3QXRVZUdwZDJMcUJaWmNrR1d5V2xBYzNhWTV0K01qM0ZH?=
 =?utf-8?B?c0NvVnVsbTdRMXIxSDhiN3YzbDFHN2NrTXYvL2hIdHE1UjRBbmtBWElXRGJq?=
 =?utf-8?B?bkJ6bTdrWk1zaVMzc1FrRGZGcnRSYmo5OXlleWNqZXdVVSt1Vk55Yy9sOEhw?=
 =?utf-8?B?M1dHYUVzbnprYytIMmltVC90OU9YUmQ3WWtmVDk5UHB2MW9aa1BtcmVjTGtz?=
 =?utf-8?B?cHIwblVOUS80UVdCRXpyVmtoTFlZblBnLzRKVjRJV3ZIblJSVGpDMFFlcm9n?=
 =?utf-8?B?WmoxVFJZY0V0VFlscElQVnc3MlNPbkd4UlhTRjRwUWNZcHJSM00vczZ3OHZo?=
 =?utf-8?B?eTBiVytmZzZVclpPd3dVdUtreEdtdHdUbWMxd0dPT3kvUkM0MGg4Z2s3VDZx?=
 =?utf-8?B?U0JUMVRDQ1dNNVFEdjdjMkE1Sk1mMGNia0tjLy9GM28wdzFEZTh5OEJVZWdN?=
 =?utf-8?B?ZTEzckNObDVDRUJIQmFabmRxUWJqMmNEZVJYdkhkc1NKSHVoNmJMcUJUMXZK?=
 =?utf-8?B?cnhiYVNiQUJSaWFUeDNRUkp5UklxOFh0RG9ZTWl5b1oyTUxmTStoZDE1NDJM?=
 =?utf-8?B?YmhhTlNDTTRTRDczVVQ0eGtGRmZRWWd1UTY3YVhnZjQ2UjFHdmZuS0kxdnFp?=
 =?utf-8?B?bFBCdjJHQTdEcXBiQUVLY0s2WTB0VGlVYm8wYUgzUUpUV0R4RDdUYit6UmFN?=
 =?utf-8?B?cDFWMG0zZmFKWWd3TStYTGhwczQ2a0s0VzlIMEg5TER0TVFQTldDRk1YSkZ4?=
 =?utf-8?B?anIxV0dyaGkzOGM4Zm9LaWRUMDEzMldpdFBuR0hjSWFYdW95MjBueFEycFI1?=
 =?utf-8?B?R0xiZkNhMFpSdWljd05sZFpXOFhYeERKblZSTDZuZlF6UFJJUjlrQWNBYkt3?=
 =?utf-8?B?cWg0NHQrWVFGYW5VUVd5c1M2dnZQdkpINjYycXYwOGxPQ1VzNU5wVXFlU2tn?=
 =?utf-8?B?MU1aR1FYcjhOdTJiMzdqQmxMVzFjZ3FaTS83U1R0UHZIbWd5VXhMYnlaVU9P?=
 =?utf-8?B?Yi8vYmYwTFI1eVVBc1JyQkoxcjZTMThLWUxhOENWMHdBMUZkOVZoOUdGekI0?=
 =?utf-8?B?d0ZYdDB3bWFkNXY2V3RQUURZOVM0M2I3Yk4yU1lJYzhscUI2WWRVTDVPeVNl?=
 =?utf-8?B?alBJUEZMRXdMVm5oR0VLTVlndUhIWWhmc0E5bDc5Tyt0YjdVaXNZQ3hPNXIw?=
 =?utf-8?B?SHVRZUZBTkFjUWY3TXVUVkl4WDhHRmZCV1dyREMyQ3dMRUxWU0RPMVd3V042?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f459dd94-3f09-4260-5753-08dc603bbd7f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 06:41:27.9823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hs0qrD3lqThaIep/uP1Rfr/nqkSL6N1ReQCPocTarVc5oCi6NeumuRBgbrzszV5tyr6d8SPoVY7eJQHsuuwUYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9357
X-Proofpoint-GUID: hRDDRc6Nb8u0TLQIOFbE-Dq7hRZVLQZG
X-Proofpoint-ORIG-GUID: hRDDRc6Nb8u0TLQIOFbE-Dq7hRZVLQZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_04,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=861 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190047

18.04.24 14:36, Jan Beulich:
> On 16.04.2024 08:29, Sergiy Kibrik wrote:
>> Move altp2m code from generic p2m.c file to altp2m.c, so that VMX-specific
>> code is kept separately and can possibly be disabled in the build.
> 
> The code movement is desirable, but the reasoning isn't quite right (see
> replies on other sub-threads).

understood

> 
>> --- a/xen/arch/x86/mm/altp2m.c
>> +++ b/xen/arch/x86/mm/altp2m.c
>> @@ -9,6 +9,8 @@
>>   #include <asm/altp2m.h>
>>   #include "mm-locks.h"
>>   #include "p2m.h"
>> +#include <public/hvm/hvm_op.h>
>> +#include <xen/event.h>
> 
> Please add above the private header #include-s.
> 

ok

>> [...]
>> +    return rc;
>> +}
>> +
>> +
> 
> No double blank lines please, anywhere.
>
yes, go it

>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -500,9 +500,8 @@ int p2m_alloc_table(struct p2m_domain *p2m)
>>       return 0;
>>   }
>>   
>> -static int __must_check
>> -p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>> -                 unsigned int page_order)
>> +int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
>> +                                  unsigned int page_order)
>>   {
> 
> And no unrelated re-formatting please (i.e. you really only need to
> touch a single line here).

will fix that


  -Sergiy

