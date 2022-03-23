Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3004E5DEE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 06:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294011.499986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXFlw-0003Wz-4L; Thu, 24 Mar 2022 05:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294011.499986; Thu, 24 Mar 2022 05:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXFlv-0003Uc-W7; Thu, 24 Mar 2022 05:12:31 +0000
Received: by outflank-mailman (input) for mailman id 294011;
 Wed, 23 Mar 2022 17:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cV1o=UC=oracle.com=mark.kanda@srs-se1.protection.inumbo.net>)
 id 1nX4oi-0002ak-WB
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:30:42 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f408d309-aace-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 18:30:38 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NFK6pe016333; 
 Wed, 23 Mar 2022 17:30:14 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3ew5s0t989-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 17:30:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22NHHl2i045406;
 Wed, 23 Mar 2022 17:30:12 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by userp3030.oracle.com with ESMTP id 3ew49raha1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 17:30:12 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SA2PR10MB4809.namprd10.prod.outlook.com (2603:10b6:806:113::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 17:30:10 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Wed, 23 Mar 2022
 17:30:10 +0000
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
X-Inumbo-ID: f408d309-aace-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wKI/gJwiIO07G6Bm4xdEtvjsCv0j2LG8UMWtAshBcSc=;
 b=ViRabcSImIj1feG4XGLBqtiJ/FGBDdIN630z/0+n+/0jAFSSk93WY6dBQn6ESxkV8hpz
 fXx2hGGH/5jgz8UTudU8Asp5kXIppvP3vzV/LNyj3lvINLnh/zWEs+XzbK/CgOasnONO
 aWWbzyJ3EmqHSflZnHKLn6zRag9dcUbnbAAoO36ZI3j2IFyAiZhXgCJURsdshuYC8ljN
 9PQ6Oopk893pnNNItVjUxi+Diat/DkInH0jNIbzqz7Dxt5l2nN7/e22PoGxeM8CZLBjz
 jtAXJEv2nXdl6q7wPQ1JGrp5Kz6oyFoBrN+elX6jPSny086khuQdxWDn7AgP1BbKLma2 ug== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKyC4FFred0W4aOyj/U8CVeDnj4+mD+0gufY1PPlvqfZcaWgmVx9tf7nb+YsKjR7WNIej9k6UtXOSWi4R2fhKi12+lXuJ5iBRMQKeqBFnwvZo1mPu6cfaUGgs+N7IJ1VKi5UQqadNGIvvjco4p6DlABv9NCE4o0F0SeiLWS7Zg9bxqrN+Rj0N7VW9jhSS0gZf1QmiP8h6XArfWf5M0qFvsY0h/zBHXgCFJy+EEMee2hQfsv/ZoqAtFHBQBPHHdQlKCWl9T3h/LbYJ6VtMtpUszVmFd3NEbfDxT9ujfh2q6iycPqG2uG9Ds0ojRsnj7hcCtpDxOMn8o91Q3zVR0NVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKI/gJwiIO07G6Bm4xdEtvjsCv0j2LG8UMWtAshBcSc=;
 b=e+1abBfcWzmpdVh7si2q8UlNP3ugmiJR51o1d8XyD7D5s8xgKHQUClmpmDXnSnCdtBM+7WFGzldGDcBjG7Ccy7sfMxV7nCB6uaoYGCoxiACaAM2u3F1GCb5bnp8VbykVEnBc4FbAZu/OioNM0rt/Urc1HRzlVnFH32RhIWHCWb7H6nMr/IpzgemnECS69R1ST63XWOWOV6XYpgPVlWgWvMd2Ih3WrRh4IgZeJ3AnTYfhxc/ilSaDQoC6cd9Fp36KPKwuLcuooNYPJnKrh/Y3ofqfoECVparA+q3FlcpM25IX5iPxX313+rsEcmRsDp02Gl8Ip2uB3X+IMq9gumvt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKI/gJwiIO07G6Bm4xdEtvjsCv0j2LG8UMWtAshBcSc=;
 b=pqDoYFgOu1iGm+0HZU3BbA6MxgTwJJPCR/P08hrTmg+G4TtaOzxgbliu7zr8sznPxm8+yInAbdHMuT/5wBzHZtr2yL/Ca5ryOTO1bSePULiPxoHebE+jsasPj8gHOclq+pKrDLRTc9fcY2xu6MvDIVP1MyEHJMCbm0w803W+qj0=
Message-ID: <9a59a719-7e33-ada7-a8a6-1631df1759ae@oracle.com>
Date: Wed, 23 Mar 2022 12:30:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 12/13] softmmu/cpus: Free cpu->thread in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>,
        qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
        Laurent Vivier
 <lvivier@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        Cameron Esfahani <dirty@apple.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
        Paul Durrant <paul@xen.org>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        xen-devel@lists.xenproject.org,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Reinoud Zandijk
 <reinoud@netbsd.org>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Huth <thuth@redhat.com>, Colin Xu <colin.xu@intel.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-13-philippe.mathieu.daude@gmail.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <20220323171751.78612-13-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:6e::15) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61367cd9-6dde-4aa0-1a19-08da0cf2c7fb
X-MS-TrafficTypeDiagnostic: SA2PR10MB4809:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB4809F113F3255278300F8E0FF9189@SA2PR10MB4809.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eMi1xnb89JVRflnaxbp7GpxZdBgAnxavXSElOob3iIGCrLLPdR4vR2oV/JjmC7De/TovLlh4RomI/YZLd2+l2j5GMAeCNP5DjXbAv6+cch4bs5w39vq4KAbTqIxZf8bGsTmrSiXWU1H3pZ6sCvnlUILptsw3A5CH8TtddcBh+dcB+UBVM/McxuMJfJ2O0wHaqGmTAAljaj2f8bLEYWqPsxaRWBS6A4rLcXK3NcmA9hv8QbLW9Iuk6tAXYQrBYsmpf2O9CY8CorLn20KgCm6PQ/9OAiMZ5ywXou6Bd+SHRrtI8vfaNCvJfQfwY4hJ5u7a02lbgRK235XQpcglP228elW1YFPevMaA81lLIrq4odjpgELaCSTd3HZXxDAsoruQzqlNRuKP/XGdjAtqdYfyq7R77yRkWZAuMcRkq11G8COAaMblMZhaT+GpK62y/Czls9ihXAvjOU7FQmhXHHCphY3woasKxtlFcN8OGBit41dw124aHmWdAl5daDwFKb0vqiDIEqjDll9/8UNajIlCpZZbDxvA8m1be4G1NzdReU+unUfBMkkVmSNf6QJUmTv7ORD1Gu5lluEpSM++jxXh6sTV6M2M8CVdZfLHBjJzr4DQctu6luI6klPZaLDkdG15/AuTaiUThDGoZVcSzrQlvkL/YmtJBn37KKyMsbxg2jAIjKN+MAmSlpFxmOuEhI/25DasvTxtIxLbaPQywp/Hdly+61e7h7pBvbcJdcbe+zD0nISf6wEJ94RNHLNY1b6Og8MZyxG6Q0sEUUTEMCyZCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB5841.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6666004)(6512007)(44832011)(6486002)(86362001)(31686004)(31696002)(508600001)(26005)(2616005)(186003)(83380400001)(53546011)(36756003)(54906003)(7416002)(5660300002)(38100700002)(316002)(66476007)(2906002)(66946007)(8676002)(8936002)(66556008)(4326008)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjB3NWJxR0J1ejVycml2ZmZKTXg1NmFDR1RXVHdJNjQ1b2V6UTNXaW9Wb3hQ?=
 =?utf-8?B?VTVUOTlKc0F2SHVtUWR2eXRXRFozRUxlRG1aYVhzK2svWExLNXpMY3ZVazUy?=
 =?utf-8?B?VGhURXBXc21iOWNIWEpPREl4MXEzOFJndmVKRytKaisvRjdYTnluSWZNNGor?=
 =?utf-8?B?YmNkaFJBb0JyRmxlTmtqVkdNQVh0d0ZZdGtteGxnMmNUTU8rbktkSm0yZVZF?=
 =?utf-8?B?cE9tL21YMktIbGkrdHAzbllUcFU3QkJNWU10UjJnV3l5Q0cycU5ITXhjRVdm?=
 =?utf-8?B?RFNJWjQvWTdrRHh2Y2VVTHBvMlBrNjJ4ZG93N0NNeDIrbjErT2tsQ3IzNWVH?=
 =?utf-8?B?TFMzWW9XN3REV1VYYTUxOUMrc0poZi8zbkdVYjhPYXNTVGVUcGhEWS9MT05V?=
 =?utf-8?B?dTZqK1ZOSzhLK1RPWSs4TC85dTVqY2s5UkFIS1M2Q1Jlb3ljaEZwV0lFOVlo?=
 =?utf-8?B?eEh2bGVkZFFNQ3BvV2FyLzNPZWdPM2NZWHl1SzBoNkE5aHBPd3Uzc3Zpb1VZ?=
 =?utf-8?B?QzlabHBVaFAvMzdTUVFNZURaaU5oWThoR1FrQVlBSTVHOEU5LzBlbHE4dHcz?=
 =?utf-8?B?NGZYQy9wa3hMOG02djFWamNWMGlROWtJWHlOYmkwb2RXbnVQS1JKNCs5Z2xJ?=
 =?utf-8?B?OTBkUFRrNFBKZEs3Y3NIaWZmU2JLcUt0ckt6dTQzaHJCUDlrb0hoYjU5dytP?=
 =?utf-8?B?QW9RZlNtRUVFSE9qSXVFQlU5cUk5Q1ZPS3BERklxWS93Rlcxa2NqcUJKNEg1?=
 =?utf-8?B?eFlFN3UyNXlYQTVSclIrWlZ0Nkx6bFF3cUcrL0xjcEc5Uk12eC9sWE1vRUhv?=
 =?utf-8?B?cjNWUTBRbUsxRHcwNFd4SWVKa2FhVEhEMXZPSnhNSU5IalQzek5xVE56NTFt?=
 =?utf-8?B?RitOVDhDdWNGcmpaQm5waGtZRFBRVG53aTJVdjY1cU5tVWtCTm9mZjdORkpC?=
 =?utf-8?B?RmpHa0R3cDdxUjdtYWtWUkpMRGVDUUtiU0FwNncyODdFMzQrTWdtdXdsdWc2?=
 =?utf-8?B?Qm52Qm9tZkVHQkVsWFJPMGxiK3ZvUDZCTElQT2ZNcnhVOHZqMElsSGxmd2Jm?=
 =?utf-8?B?czJmWWlMVUtFdTZMVEhUQ2VxS0k3NnQvNEpyQ2NkV1ZUeFpKeE0zS2NKWE93?=
 =?utf-8?B?K3dmWFludVAzUzdIa3pyS0Fpb2ZQWmVwV2ZvY3F0ZllzT0JVMjl4dkpJMWk2?=
 =?utf-8?B?UXp3S3RNT3diaytYMWVuejIzNk9hanVMcUN4YjBRWFZJL0lIa0d5MHVOUC9p?=
 =?utf-8?B?R2pQVnZJOUJuQmpuM0NFd1hBY0c2K0NQbGtEZDdFZFEzYXJqd0hsMUtTSUcr?=
 =?utf-8?B?UVl3QTM5a0pWclZHd0pjL1FzN3R5V0NZeGpJaW5UcWR3ZUl1U3djaFRFSU50?=
 =?utf-8?B?dWRET1J0TXlnZ0ZUQm5iZG52SFI5UnlkZE9xNkRQQmVIN3QwQ1JPYTBtTVcw?=
 =?utf-8?B?dmZ5c1VRRUhvYVVDUzY5eTlSbmVQUXdpeW41UmZRQkdHdlgvcmJoZ0JsbVdE?=
 =?utf-8?B?KzZkNzNuWEo4dEVYSDFWck9vc2tFWUo0QjRrelpVcG8vRjdnNTkwYnBGRlE1?=
 =?utf-8?B?eEdzR1BiMVhOWmJQNSsvSDREM2VJcGIzVlZYd0dtL3lhRGtNSUt1VDlma3A0?=
 =?utf-8?B?ckNRS1NjZzYxNmkvMm9SUnF5VHk3R1BzUnU5ZUV4bzhvQWNIOE9kK0xYN2FW?=
 =?utf-8?B?aXVxOEttRHlzS1l1SVdlQlVFYXhuZlVtT0haZnNNcUdDMmZWR2JNek5ESlRU?=
 =?utf-8?B?RUYxL2ZPU3VXSmhKKzVMQmgxaWtuenY5aHN4anZZaG1EbDdXOXNZaWlGQzlm?=
 =?utf-8?B?NVZLYzhaVWZ4ZmQ4c09DSnRYbkR6RG9CbW1QV3A1Zm9xUEJBV2dHN2cwb2dy?=
 =?utf-8?B?TkR0OEhZS1A5aGorK1lrYk0xN0FsVkhsRHorQVU1Z1V3RitvL0xLVlZuZTgr?=
 =?utf-8?Q?jXZ3w+1lYOuCsykeotx2YJXZo07d7+P4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61367cd9-6dde-4aa0-1a19-08da0cf2c7fb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 17:30:10.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rxaJ2/9uTY0sXoaV4w9VswOCC4NnYIvm4T4jMryqK4C2NVfLytUXy6bOq17OseY5o4bhxQpGWD2JxbmPTC5FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4809
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10295 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230092
X-Proofpoint-GUID: LWMfiaG2Xb9Y9wIJHXs8TcMMHFKYMJgj
X-Proofpoint-ORIG-GUID: LWMfiaG2Xb9Y9wIJHXs8TcMMHFKYMJgj

Thanks Philippe,

In the patch subject, 'generic_destroy_vcpu_thread()' should be changed to 
'common_vcpu_thread_destroy()'.
Same goes for the next patch (Free cpu->halt_cond).

Thanks/regards,
-Mark

On 3/23/2022 12:17 PM, Philippe Mathieu-Daudé wrote:
> From: Mark Kanda <mark.kanda@oracle.com>
>
> Free cpu->thread in a new AccelOpsClass::destroy_vcpu_thread() handler
> generic_destroy_vcpu_thread().
>
> vCPU hotunplug related leak reported by Valgrind:
>
>    ==102631== 8 bytes in 1 blocks are definitely lost in loss record 1,037 of 8,555
>    ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
>    ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
>    ==102631==    by 0x92443A: kvm_start_vcpu_thread (kvm-accel-ops.c:68)
>    ==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
>    ==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
>    ==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
>    ==102631==    by 0x93E329: property_set_bool (object.c:2273)
>    ==102631==    by 0x93C2F8: object_property_set (object.c:1408)
>    ==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
>    ==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
>    ==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
>    ==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)
>
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Message-Id: <20220321141409.3112932-3-mark.kanda@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   softmmu/cpus.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 37325b3b8d..efa8397f04 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -619,6 +619,7 @@ static void common_vcpu_thread_create(CPUState *cpu)
>   
>   static void common_vcpu_thread_destroy(CPUState *cpu)
>   {
> +    g_free(cpu->thread);
>   }
>   
>   void cpu_remove_sync(CPUState *cpu)


