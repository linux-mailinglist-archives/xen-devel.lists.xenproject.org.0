Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97AE44434D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:19:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220917.382365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miH6w-0001np-74; Wed, 03 Nov 2021 14:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220917.382365; Wed, 03 Nov 2021 14:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miH6w-0001m3-2z; Wed, 03 Nov 2021 14:19:30 +0000
Received: by outflank-mailman (input) for mailman id 220917;
 Wed, 03 Nov 2021 14:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjvR=PW=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1miH6u-0001lx-KE
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:19:28 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c3979ab-3cb1-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 15:19:27 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A3DxOMR016601; 
 Wed, 3 Nov 2021 14:18:55 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c3mxh28nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Nov 2021 14:18:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A3EBe5V108321;
 Wed, 3 Nov 2021 14:18:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by aserp3030.oracle.com with ESMTP id 3c3pfxphp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Nov 2021 14:18:54 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2884.namprd10.prod.outlook.com (2603:10b6:208:30::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 14:18:52 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 14:18:52 +0000
Received: from [10.74.107.153] (138.3.200.25) by
 BYAPR03CA0031.namprd03.prod.outlook.com (2603:10b6:a02:a8::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 14:18:48 +0000
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
X-Inumbo-ID: 0c3979ab-3cb1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=NW9vzCpliR3YWkmxxZQWxqQT+rgPZfGGM/fLhB3BeL8=;
 b=el2nGhkmUHyzgLMT53yorIJhLlGE8G/CgkwX3at5SOVx5mQGk8kaFuxeDWtREkS4g8PT
 n+yEMsLLkatmd6WWNEn4uYbnANsC2G1lknVdrekCwnAmEKCqG33p1b5OVpVydm3rzVZU
 JjuR8FXSQ5lJXqjNqo9/lTC/XTtfeosQvcTe61Dokp2NjkVq5iWtx3tenI0ytsAGfVYm
 MGDjJf+OrAdOgwFqmcxvmaDy1Dqqxf0Zawvr6A7CZdwIIyXNknO63sZ9ujh3WbYxHyAi
 guOTsNcQlclywAEGtZsBi84HvZ8SuGdoROII63A+NSCeBmbAjvzCb5uWfTbO7PyfeWco 5w== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2d6M4J/VagU//R+YoQQp/qn6Vraxb+bo0SwLhxtUGFsEOKDM9xIEfuxGmve+HAKW4ncFzyPQq5yqFCFducx3EG4r0iT/LVVsCw68rRDwSrjl7i6W4Wb4ZD2fYDfGFcT+Df/6yWkmuk6mZDALR1IHzRc5EZbsjzHiXSvnQc+7QyZO5+hJVu+cwwFoLhnsqAjOK24Y1gFF+A5gFzQBp4ze5jRgmOVyKakDznq5CHUIc31wAAsce/4sMAnrrycP8TqV6yaD5mSQ9QSgbJi9qeZwCeli1Sg2RTTpQ1nzDzgJob5CU8YEQIvLajwnoRucDFAgLcbHihJJTBysRJS3ZcLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW9vzCpliR3YWkmxxZQWxqQT+rgPZfGGM/fLhB3BeL8=;
 b=n+gg9GCWGkSzvekLyWU9JaxO9aOJpHfH88K4RY1ESZVIcmTv+3Q7J/bMxG5Qj131DDy+9RRg+omsqHG31PwQNmfSEm/JMmswhg6wnPHbO5TGPRxzFQLPCp2nURwZJacy3JzTFqJBdqqERXxi2rFp+RWdrq4jaD2/OFezERkRW5/kQXtylkkSqOSmSeHRML+Ukm7PFp5rWkips6oiXs4g0aeA4T+yiw9ftrmumUuOwpHUPCr8aixRe0s5/DoGCpcKI7uSis4/+vaBoJzcSU7An+HwOvTTXMSmN+54+mMEzCqDtNMfhDR9ej6AW86s6oZ+4QDqC9ZJefBdoLz1kqXFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW9vzCpliR3YWkmxxZQWxqQT+rgPZfGGM/fLhB3BeL8=;
 b=a9eKmTCQX4k0JNZQcSMraRCz/hjW1ySyCMBZ+NVeqc7kryptrgtrQeE7p4F9e218DRQru99z/qBWb6aDRL7+y5ZcGdHd7FTBzN2F9/Ko6H19AlFywlToTgAnOYT/NplyBmUEiP4UbkPdMusaeN9cdp4MTNBeppkemeWrFXqn278=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <399d086b-b799-8d8d-7347-313474a744f2@oracle.com>
Date: Wed, 3 Nov 2021 10:18:45 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH 0/4] xen: do some cleanup
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20211028081221.2475-1-jgross@suse.com>
 <d672d22e-770d-d37e-b094-29563106511e@oracle.com>
In-Reply-To: <d672d22e-770d-d37e-b094-29563106511e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 839e942a-90dc-4bb7-8696-08d99ed4dc7e
X-MS-TrafficTypeDiagnostic: BL0PR10MB2884:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB28846B12DC746245EE2E74468A8C9@BL0PR10MB2884.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jIkgUJwseYxrxNdX4XcJSZ9R81tu0Ep8nEweh9NrHpZzUh56e51v3KCH4Gve8lsqQyizpFmz1swnPMdznj4ZylndkjPbLwXLjfkSj0vfKWzWWXLkHYVtdOCBxK8nVw0AGvnmS1p2U+piQRcRfqkE5Y793fW1PWR2yEzqo+8VjuQTxvQmjdjRddZCnVF6l9KRk/gObzuxcXHM0RGpNmsTUz85wQH9Hl9dLuki7RzCFDxu+QKjECn/ty1tMBOYgLfYgB6GOyjI36wr82YKMnx9f1/Bv+tukMuaq6Zt9K3bnHpEUcKk45EvhYSc9/LYYXaLk2BGAEcsbkoSf9C9HR1W4xlhLxUX4rV6zUuDhxOzfH4jpeFuUBI6oDGk0DHxD9PMFT8erpfv9q7EaIyspK06rquG5BlY/vxUNprYttKTpyLTepk8fliNgmH143Sla/nFWITh7l6yLU95fiK02qW9l9GFaBxcoBh99Fo3+uls+tUGbX36Zy2E9Pk3eMuOUZCdwH2kTCMBXKFcrmJSIv1GUXCHvc+lnlu2dXHdRIN7tFBrnLBGRY0nx+GsOnZap4wdoxhhw96XEXJe5Y2yFlqYr15IqlToJG9iiMaogilm8unh65/ccKcEW8ehqXHUy0NykE3CvKocEhgMJTTyMFsNSbfcRbVI/O/eemNGv6Vwpf8OuFnMoinIVyFX2m4oNehiCixznFn7PtztCr+fC0pL97KDYtVX9A/VSD6mhoHFzztwSidt4qiHA82HtPuTSdm/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(508600001)(66946007)(2906002)(16576012)(6486002)(54906003)(86362001)(31696002)(53546011)(5660300002)(186003)(26005)(44832011)(66556008)(66476007)(956004)(2616005)(83380400001)(36756003)(316002)(6666004)(8936002)(4326008)(7416002)(4744005)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TzJrZzdLSGt4eVdKTnNjVFZZSVhJSk55Vll6QWNmZEJPMlg2OFpvU0hkN04z?=
 =?utf-8?B?S3QxbDU0WlgzUUVYaTRqVXFnclVmSEZRZnJMdHl2T0NMRmtMdFQ0MDg0NUtw?=
 =?utf-8?B?WUdqUFZQN1B1Si9OZ2ZpZk5nUWJ3dEJ5TXpwYWRmZjVDRmlTV1RCSWkrcHB6?=
 =?utf-8?B?a2w1Wm0rUWx6amlUajYxNm42cFpPVThuZEZsemNyMTQzWncyZW9WOW1WdCth?=
 =?utf-8?B?d201eGhQUmExSTB4RzVuUHFMYWFacjlxWWorWlNiVWRHVkhGMitNZ2wydTdw?=
 =?utf-8?B?RW01RGp4YkJ2WGh4WDBIU0NVRTBxdE1scEhWRG0yNnRMVVlGWmhUS2xlT1d6?=
 =?utf-8?B?Q0pJOFNHdnZTaWdXWS9aNTllVGROdXJTYnVQcVg1aCtuZ3BnYVFrVDNneWZS?=
 =?utf-8?B?YUMzSkhKYUVHQmljTHJrSVhncUNIYU44RTdDVlVqY0JKV2h3ZkpUN0RJNllY?=
 =?utf-8?B?UDVqd1FQcWlxNjlVeXFEWCs5UUlscnJVSkxyUWRpU29qSjdseFFwTG9EcUpz?=
 =?utf-8?B?b3lFeE9JWnpOdEVTMnd4bE5DOE5pUStaUUNjMTZzeFRyOHhabk9SWmlpN0VH?=
 =?utf-8?B?bDBNSHBtaXlnRFEzNzJTT3JPN2x1SklFcUsyS09vdHh2bkdqQlJMNHpOVlFs?=
 =?utf-8?B?N2JvTG0wdWRZOVVwcE9qYlg1NEkyY3NGZ2pzNU41dldrZlNiN09Ya2NoTVVS?=
 =?utf-8?B?SDJxaS84NFBDcW5Uc3BxYWpkQjh2NkptUHU5SmhjM0FJQUVzNjZDS3RxLzJh?=
 =?utf-8?B?Z3RpQ09lZkhObFhjbkVZTldPTGVXL3Vqc3BTb0JjRmVqUmhIYUc5c2VxVG80?=
 =?utf-8?B?WDM4RVphTFlsTXNZSFViYlpFS0N0QnBrb0NoV0FuUWdpME54VHA5WGd5QlJ4?=
 =?utf-8?B?TnliYUp3NUZYNmp4WDhGaGo4M3pBK3lNQkUzblQzZVcvSHpkamdXZGdUZzFr?=
 =?utf-8?B?VHF4UEI5d0JKdnVTSFhxSWI4NjFZOTZqcE8vTDgwNmJ2OCtVOEk1bTlscExt?=
 =?utf-8?B?aFI5L0JGakhjdDBXbndRWlQ1bVFTSklMUFJEckRTZEh3eHg2V1ZhelRVZGtn?=
 =?utf-8?B?MTZMWXJGU2h5cTZhTjNJSEpOVElzdWM1eEtUZ1ZhUHE5V09aQU5UTFNoUXlj?=
 =?utf-8?B?UjJVbExiNlEwMWpCSmhhMThNaEpzbDNiaENkL21TaGVVOEhqT3d3dk8rN1ZM?=
 =?utf-8?B?RDAwTkVjVnltN2lkZFFtaHpyRlR5azMrTUcwdUtQZjdMblVnTFcxZTlucVlQ?=
 =?utf-8?B?ZVZra0MyMXFLU0tBS2dqUmpVNVRlTmZjTFRYWU5Ya0NuMk9oT0Z3a3ZKdVQy?=
 =?utf-8?B?S1o3Mktwd3piRExIU2RUcGFBOG93RVh3QWZkSHBEV1A3cjFCMlZ4U21Qbm53?=
 =?utf-8?B?YmhadEYxTEdGUFFEaFM4bHkycmkrV1plTzJseHd0YmRVYTlRRDlUV2ZKUjlx?=
 =?utf-8?B?WTEwTlJkbnhlSFl3TzY5eXFZeVR4ZWcrYlFjTzFMVWZCVTlRNVdRZlArdGpu?=
 =?utf-8?B?enJVTDNLdEN3QXVVTWtxdDNYSDJoTVpkd2pXb1dBckp0UzNSTkFHVUkyblJ4?=
 =?utf-8?B?VEh5clh3MzJmSUZaRFZla0JuZmhUbXRRdDBzQ3NUUWtrYVB4SXpEWm9iTWh3?=
 =?utf-8?B?NFhJcFJNQytjbXFaMktoTmdRQjEwbUZnc0w3ekNKRWVGNXNNK1Z2c0ZJN3Bo?=
 =?utf-8?B?VmMwRVVJelByYWMyckFINHNnMmdBN0JtTm9uNFh2RStqcWZUQzBSWkx2U2NH?=
 =?utf-8?B?SGZZZmVrZXpyLzJEL1JMZ2RKeTBKZnREZHM4VEZ1RG03bGdBR29vVXVRLzBu?=
 =?utf-8?B?SnZEYkdybnhGRGZ2SzJheFlDVmliTVQ1U3hwRHNDNi9ZUmdtanpzSUppaGs3?=
 =?utf-8?B?SUFBUnN0MFNBUC9ZQU5oTDY5WUw2NTJEeldCZUxEVTJpZ2UyWFZ4bnpOck0x?=
 =?utf-8?B?RERsRHcyNUJjZ25SQjJYc2lWYW00N2MyUExSZkFqN21PQ3dXNm40L0w3SVVj?=
 =?utf-8?B?R0pBdTJCWWpONzlhRWY1VVNMY25mK1Q1dFd5Y1RSNXlGaUFOeVZNWFd3MHZX?=
 =?utf-8?B?M0xsVGI0UThOYnZuaFd2bGdPR3BnUTVZd2tzeHk5N29hLzd2L0hweXQrL1pi?=
 =?utf-8?B?TDEzYXBOVGFoQjk1M2xOKzBTZ3dCTlk0OHppNnFHcmlveHF1SDY5eldLMER1?=
 =?utf-8?B?SklyS2ZwV05LTW05b2hhM3g4RlZ0Z09nc1JaQXZoUE1UREtnU0VxaUc3T3FD?=
 =?utf-8?B?V2FqMWYwK2dnWHF6WnRKT0ZFU0dnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839e942a-90dc-4bb7-8696-08d99ed4dc7e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:18:52.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVjn4HeMmoan6GlQMJ5lCXpV/YanURlskHoNNdQZn5jBYafQUY7hCzxavSOOdpv342GgT9wmaqcDb4uPwJspN5Nb99a9PTIEpreNaENXeaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2884
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030081
X-Proofpoint-ORIG-GUID: v1_sH-9MFGzO4OCLoptnhWb1Zsu8W1r7
X-Proofpoint-GUID: v1_sH-9MFGzO4OCLoptnhWb1Zsu8W1r7


On 11/1/21 3:15 PM, Boris Ostrovsky wrote:
>
> On 10/28/21 4:12 AM, Juergen Gross wrote:
>> Some cleanups, mostly related to no longer supporting 32-bit PV mode.
>>
>> Juergen Gross (4):
>>    x86/xen: remove 32-bit pv leftovers
>>    xen: allow pv-only hypercalls only with CONFIG_XEN_PV
>>    xen: remove highmem remnants
>>    x86/xen: remove 32-bit awareness from startup_xen
>>
>>   arch/arm/xen/enlighten.c             |   1 -
>>   arch/arm/xen/hypercall.S             |   1 -
>>   arch/arm64/xen/hypercall.S           |   1 -
>>   arch/x86/include/asm/xen/hypercall.h | 233 ++++++++++++---------------
>>   arch/x86/xen/enlighten_pv.c          |   7 -
>>   arch/x86/xen/mmu_pv.c                |   1 -
>>   arch/x86/xen/xen-head.S              |  12 +-
>>   drivers/xen/mem-reservation.c        |  27 ++--
>>   include/xen/arm/hypercall.h          |  15 --
>>   9 files changed, 118 insertions(+), 180 deletions(-)
>
>
>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



Applied to for-linus-5.16b.


-boris


