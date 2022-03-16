Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674534DBA4F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 22:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291293.494327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUbVV-00078i-BE; Wed, 16 Mar 2022 21:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291293.494327; Wed, 16 Mar 2022 21:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUbVV-00076j-7a; Wed, 16 Mar 2022 21:48:37 +0000
Received: by outflank-mailman (input) for mailman id 291293;
 Wed, 16 Mar 2022 21:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkWL=T3=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1nUbVU-00076Z-4L
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 21:48:36 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d37aa3d4-a572-11ec-853c-5f4723681683;
 Wed, 16 Mar 2022 22:48:34 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GLE99c030868; 
 Wed, 16 Mar 2022 21:48:25 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6qp7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 21:48:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22GLjxkq041330;
 Wed, 16 Mar 2022 21:48:24 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by userp3020.oracle.com with ESMTP id 3et65913aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 21:48:24 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3010.namprd10.prod.outlook.com (2603:10b6:208:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 21:48:22 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755%9]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 21:48:22 +0000
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
X-Inumbo-ID: d37aa3d4-a572-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wZtpzwDGjiPae7stspqZY4t+SgZzNALigEBwA7Pgq5c=;
 b=EJ15RyoY1kolOEjR9nboFDgfLmkRYRK13Uvh+zlAGdQ7hAzbSJi035dKwM1jrg1rAxKH
 RJ4qjHNiH4z0m/qcwluyWNBjOYWW7H9OitEwJR4DrFuID01hPBV1q/uw/J3La/DCATQN
 TR87YO43K6suSccG/4fV5Ew9TyiU7DGaXV6o7klelGyqREkhxVpVZ0T8RUJCTMhKo0+8
 m2OOdu5FrPi5StYKuu5YUUdQ8S/h+YglJROjcVybx54+yfkvacfyUoiYLz5SYFSKrCWO
 oaa+ywM66v0axuaEXC/dZfy3Yv5EHOK63fjLSeoK314Mjp0/zR2UkRrHTjueuFQOmV5z tQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDCZo4/FgBX0Ws86n72zk7Vwctx6hhcmZ+ERawAkn4QLHd2swEuQa+4tvUWvGSkfSVYO/8Lhuwvatn8H9/KSPoGfig1uhPz9/RUY0DKgNittx+gpiD1Ddc/HlgYh8ODoHd8cA3UOXrrlpujfcRE6ftm4LbU4qeQQqNo1XYyXYHdCrbLct9LUIFeAAv5LKbdh0vCHC9QvpNBIgHD11tsItzSjk2Gakp/Pm+qClMzoeZxYALOL1Z/EBLN3KBJHW+SiML3xcIHDbRxqvpKWCu1FNNDN6eR7KIr6AVsb35TrERDIrdCwyzUSrqjI/RvMwUS0LfycqgZhBQm4rQQ7f3jCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZtpzwDGjiPae7stspqZY4t+SgZzNALigEBwA7Pgq5c=;
 b=hpbFVePbLVIAGu3MaZTlP1oQL6WXo6YDKp/J7WwZrpMAPez/crQSUDNpbsYJEDq7VXOcIicW6S9Sd+/fUrWZKOVaBSaCP7Pku4FC/IvHPpbUG4kRWOiEWZKwG6BhoalUgzyn19b4YicK1o6v/fyBkp5wO4LDJQsN26+oNQITwjz3sJU5Rsj/d+2NDhCtEVYbFc5mJSxCrffnxPax8gDR4zE7XQfsSvYHXaWVxPlF6RaaVEWELrJ6+TdPppBbs2HqE2mBSlSkxeA3mB6II3mIyxanly9ZhZqVA9mplyYl0vNIhWoCUXEAWkE25Iwj2gRRG6J3TZjPs30xcGAoNVl1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZtpzwDGjiPae7stspqZY4t+SgZzNALigEBwA7Pgq5c=;
 b=I7VErfIY/sNYoKPLIAoAQHA4khzoCuB+WAQpuuawWrC8IBeeL7LMj2XKYMmz4G4EmXFyZcMRRoecLoLNL/sxt5eS9l0ZzDcTHQ4jHfuoruCA9DOK8dUp7AgY/2D+gTfv879QUxso8olF/11ZrlJFJm6GP/gUZ3skQ6azzEUOc+E=
Message-ID: <a0dc57da-43c4-7532-34ac-290add25bccf@oracle.com>
Date: Wed, 16 Mar 2022 17:48:16 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] arch:x86:xen: Remove unnecessary assignment in
 xen_apic_read()
Content-Language: en-US
To: jianchunfu <jianchunfu@cmss.chinamobile.com>, tglx@linutronix.de
Cc: x86@kernel.org, hpa@zytor.com, sstabellini@kernel.org,
        xen-devel@lists.xenproject.org, trivial@kernel.org
References: <20220314070514.2602-1-jianchunfu@cmss.chinamobile.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220314070514.2602-1-jianchunfu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:806:6e::6) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 170dc5bd-d7ce-4649-d81b-08da0796b0f7
X-MS-TrafficTypeDiagnostic: BL0PR10MB3010:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB30102C4D6A5565075ECFF0988A119@BL0PR10MB3010.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9+ztRUn3xGjDbQLzg827TNC3G4maJBoTQ4TgpuT9zSMPySEnqaxVufGszAcfHM4kSDaUmqELkfw7X8Lot8oEXrYfblFo8j93tSZ9r67GBYPeYXDIY94bmJbKB3Ykq42uJ1/xiZCxAnTHlE5tMgTPvsy58q5lozYuMERf+1vmxxTlW2PkjMGpsv4HvnWejThfEKvCuVJrli3AXmi1fMG7wfx/LlDRkhJ+PfrwZuVuI7YKUtUygMGZuKO2jRXCxYpZocIAlMcnItDtfAz526oC/idKqDrIBh0KVahviLv3eFr6waXKlyNFlXVicx6XmQZTb1mf/APmXErBj4ee1fgYQ/MOlm7zXYRrpFeAZgLzrJPSrnM2ndeXxIfRGHuqtKlvO+MrsrXE8XJYAc2UMxtBJvS3R+lpiEh1jE9SlxNwEBNIdVZJpLYofWK+CduWOJezOXN12fw0JQp/OML+ephAPXcK64ZZFMkOfoGTyPDcQUN/srH6YMBh9BBmV5QXnXWaGGNCxfxh9y9jE7h0DIwAa3ZTmPslByTkTbUqoHRtY2wWBBD8hqYpPLhCZz3UICw76biGlZvUZ9Rc0Lfw62SAtCnvTAtyAD8j2jUW77uMZ7x6NOHdfAYFKA4laZJ7AipwuUzSBUUYKEJ3MNfDc74GNrfAdOYwq0F2H6erR/L9YCOtKxeCXLIXZzib82n9Haqrx2SF0ECPx+FprHm3OIzcBJZvnwh6kfYePVP/dptoyy6RtExyaPC9wchqEHDK43al
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(508600001)(186003)(44832011)(4744005)(6666004)(8676002)(4326008)(6486002)(8936002)(66556008)(66476007)(66946007)(5660300002)(6512007)(316002)(2906002)(31696002)(38100700002)(6506007)(2616005)(36756003)(31686004)(86362001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ekVBdk5BVlllV1ZZQURtSURSQ1MyRDNyNmFnWXY5cWNRRGhmL0x5UmpwZEUy?=
 =?utf-8?B?dWF5K2M1dXlhajRLNGxaclZ6SGtuVW5QN05KYmRwRXJ6OStCR3FEYTVEcEFt?=
 =?utf-8?B?S3NsV05yWFI1dU1TVWRmZkpVdUcxUWhHR2UvV29oM3VIUGlsQklZcW9hemNV?=
 =?utf-8?B?bm9GcThIMEFzKzVLNHNrTHZjM1I0Q21UeTVRL3ZkMHhVRFJsYXJpUzdMREJF?=
 =?utf-8?B?VXhGWlZPSDB4Y2QvSjg1TFIvQzdYekdickpkSjNZRElXeERKOWRYM0FKMXFO?=
 =?utf-8?B?N1RVTUVLZXRzQk9oSmRsQ2N6ZkY2a1poWVh4R2VhRjlBeUZXNUR3REdZeDJY?=
 =?utf-8?B?UWtUV3QwazNQVE0vR012TE44Y013WTE4dDJ4Uk8wRzZoN0hoRDRWRDE0Y3I4?=
 =?utf-8?B?TTNVWEYwcm5FMHV3RDZ2YlQ2ci9yZTlNNVFQNVJNMVgvNmRFTGJPWHVheWV0?=
 =?utf-8?B?RTBZNUpmcm9xYUtXOVQxc1ZFMVN4WHh5WHliOUk3Ymd6bCt6cDlLWWRpblp6?=
 =?utf-8?B?bTUzem02ZHZwS2xUNkdhZHVOUThKTUtGSkdPSFRLTi9FKy9xMUJHSWxMMlFh?=
 =?utf-8?B?bDZIKy8yRzMvVlAwaUd6ZU9meTBhbk4vdHhDWGxoV0RmblVWRUoyVkJHTDlR?=
 =?utf-8?B?MXd5MWQwUmRnM2lDTEplTlZFRm1XenN2bEpKTVRKSGV3dEdmL2tSYXlkUHhL?=
 =?utf-8?B?SnUvVmFaMlYwRFNnM0tjRXFYNkFZREtHblJZSzhqUWRmUmRrQVpQRW1reFd1?=
 =?utf-8?B?cGFIM1F6Y1pKV2JHVWFtRnYycGVTVm1JZ0I2NDRyczE3ODhFV2UxZW9tQjhn?=
 =?utf-8?B?dm5MVktqOU5VWDNnZ1pOS25nUVlhUks4eDNwbXhuODJFUDhrNmxZdHZLYkhO?=
 =?utf-8?B?RnQxWXp0QjQvbXI1NzBOM0hldUZtdWw3YjJzaUIzcFIvdWsrc0Z2eWJ1TXZH?=
 =?utf-8?B?aHpHK2JReG9tZ3B5UzEwVUtjcjErNzR4QlVpaDR4QVppbmMvaXRjR1RJNjhr?=
 =?utf-8?B?bGlBNXhoNlE4L3lYVS91eGZ0NUpYQnlKcURrcXhQWVZUdmx5ZVFHRHUrMGE3?=
 =?utf-8?B?QmZTOFRTSTkvQWtlNzF4K1FzM2tRZEFyQ1RSYVlSaWFmYTczQURYVlhDaDRD?=
 =?utf-8?B?OTVlMDFpdFh1YVRXV1NMcXJlUHBsL2FDcEowY3RpSnd2SGg2VXJGeDdOYm53?=
 =?utf-8?B?YTE1SVFnN1J1dHBSV3YvOGJoRCt6dDM4T3pFSStDMWlGNllPWFJYTUlNb00z?=
 =?utf-8?B?UDdPcHFzOTV2YllRSDFodi9QQlVNWHFaU2pFY2JRbG9oNXJhcEFmY2pnTlRv?=
 =?utf-8?B?eU00WFVYcno2c2Y1Ly8rU3N3cm8xZlhpYlpMSi9KQW1KdXdPVHZCOElkNmRV?=
 =?utf-8?B?NDRRY3FEYjYxbi9xRVpReXZUY3d3RlJVNmhPZFBkdkJlMFJ1L0R5S1BlV2ty?=
 =?utf-8?B?MzBRbGF0WURUWnN6WHZhK3BiZFhPQ1VpSzZKbkQvclBpMmxnTFZJTGpwQXNk?=
 =?utf-8?B?b2VqTlpocDlLYXpoT2lScFVHWFd3dzQvMVpBQm1BaHkzSDRwT3JCLzNocjdj?=
 =?utf-8?B?cmFXcXlOZWN4ekIzZTBEd3RjcnpNaHlPOEhGSWdtakNqM1NJK3lVUm5uTG5U?=
 =?utf-8?B?RTVManprUUlCTUI5TXFNeUNEUEVPYmY1N2twYzNhN0txb1R4Q1NWMmZRN29y?=
 =?utf-8?B?MWxvdVlMN3d5VVNqSHF3VzNxZjgwYjF1MEd0ZExkcGh6TDVFbXdNeG8venZV?=
 =?utf-8?B?S0dMVi9XMjRvTVdLeHhzaWpBMFI0Tko3ZG0zYWozU2lKOFh3emNMYys1NFIw?=
 =?utf-8?B?TlJ5VDJyOGJJYVVvNHI1czhzcjJyTUVTM1VQbTF1RkU4WGIvd1FibytlQjhO?=
 =?utf-8?B?MTRUSWc4QXNTR1FWcmJ3V3RzbGFoYTB1MldMQWQ1ZkFzRncrblR0MWZ4UGFW?=
 =?utf-8?B?bXZ1Wm9aUEVDbkRybGVJTGpJY0cyQkdmU1oyMXJvb2M4eFd2ZWF6NW9EYXpL?=
 =?utf-8?B?OGtsTE13bWRRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170dc5bd-d7ce-4649-d81b-08da0796b0f7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 21:48:22.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2giQyHTqsH/KJZQ07yZbj//HXZptc9Jctlw2qvxgcc7NTSEeGE/eAwzZBudl2Ihc5IJpOmxxlaeiQv1k3nY72YIgeNnjZjR+2gNQYaEohI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3010
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160130
X-Proofpoint-GUID: 7kg-Cmerxm5AtnlyXtOpgq8Waoc75Wvv
X-Proofpoint-ORIG-GUID: 7kg-Cmerxm5AtnlyXtOpgq8Waoc75Wvv


On 3/14/22 3:05 AM, jianchunfu wrote:
> In the function xen_apic_read(), the initialized value of 'ret' is unused
> because it will be assigned by the function HYPERVISOR_platform_op(),
> thus remove it.
>
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


Applied to for-linus-5.18 (both patches)


