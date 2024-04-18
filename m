Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82D8A9B3E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708373.1107250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRmI-00082e-VN; Thu, 18 Apr 2024 13:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708373.1107250; Thu, 18 Apr 2024 13:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRmI-00080P-S6; Thu, 18 Apr 2024 13:26:14 +0000
Received: by outflank-mailman (input) for mailman id 708373;
 Thu, 18 Apr 2024 13:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9OU+=LX=epam.com=prvs=083815c34c=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxRmH-00080J-JQ
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:26:13 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38265ea4-fd87-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 15:26:11 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43IAi63x007617; Thu, 18 Apr 2024 13:26:05 GMT
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2232.outbound.protection.outlook.com [104.47.11.232])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xk21b8jrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Apr 2024 13:26:05 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7364.eurprd03.prod.outlook.com (2603:10a6:20b:26a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 13:26:01 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 13:26:01 +0000
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
X-Inumbo-ID: 38265ea4-fd87-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRmSVeNod0dUUqAD4UgFcAhNq+faT0Uu17JRY0Iax72nCgrl/XVgUij5pQ7JkmmpUQfTx5tt5TTGbulKrtdg99FASughaYn/NPUVcnMFFm2uzE6O+kwe5hlpZL9J6GOCAddkzGBuz9inej4E31f1Bi+zjkdqNB6Zd10NbdbLgMfcpewHeCYvdV1n6r3Pp8G1AFo5MUBuhvYZK5e3JsxT6hvcjsTCiNNsn8mHOLpsXXjMmvPHedCPCxEesd0QX5JFZDzUvUxCtB1xCN+PbCQtsJu+GNH/3MDBq/dP/NIAVvriEV6JGt3f1+cO4ldU8WB+SRT9CcgCgWsLX8N4GwumGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rhm86dB95fQfrtJ5c1vl6iHequ7334ASotL5EtvKf7Y=;
 b=nkWsU8LrNXvyyXyTP5lz6xflh2KxSNH6vxap8tDoVfN2cSA3D7wAMRx7oNaHBdh2LNfRl1WzPvN7Tle8JvuNFOSLycI2/7gJhfM7kKW3wCEf78D45dkSNAfsyF2YsVFbah9DJ2EmiRvA5Zyo8mPjIPY63/m95KURJQ6kRme0mI1dvQv4r5xmQISkmAudqmRV2Spks/NOsViHTyrQuQECz8iUZ7FBN4LglA8UDCkHNaEeiEuqgf9yDATsGVseavZf6FnbV0+RfAzLCyff6YXwHGryUfIGvSoccU/8p4mnQF9NN3eAMuAdJPEm2GD9ijA1NI59vb4JgrEm1MBXRrZODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rhm86dB95fQfrtJ5c1vl6iHequ7334ASotL5EtvKf7Y=;
 b=oBkNuOTIk751Op1scShl2K0YT5rCeaYBGVJ3QkQaorcCBBMYntxWokPD0AVsPRYGNDiDNZzt2GKHTGKcYifnV2E2AQ9De0vyPC4tPqsOV0rmTMyynqHFXxQqGjB34jkccTG49tlZE9y3N5AKt36MMyO4VF0LAcLa5WQKUNV1760JR34MNTDYgokkUALCcxKBxJHKDZbvPc2tfPujUYEKYVe4n/umOkFHgawkNA+a5In/XShTFDWubckeOCV14MrfOOS7F570A4MVPT0eXO+WNeNrT7jlWCcg3xIoTBN/sg2aGBqxoU9BbSFL2RLI7URm/k10iWOl8oyDAKDD8oKf1w==
Message-ID: <25e2f901-04a6-4c05-9072-a926f6abf06c@epam.com>
Date: Thu, 18 Apr 2024 16:25:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 08/15] x86/vpmu: separate amd/intel vPMU code
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <20240416063534.3469482-1-Sergiy_Kibrik@epam.com>
 <939adb2d-7816-4f99-9d57-ed444ab859b4@citrix.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <939adb2d-7816-4f99-9d57-ed444ab859b4@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To PAVPR03MB9212.eurprd03.prod.outlook.com
 (2603:10a6:102:32d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 90207c48-1ecd-4d2d-956a-08dc5fab16e2
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fHRAAEfR6sPDlI6jC75yhN2yW5VuwcmRTD2tMNIPBJuNSjmUw50yuB8+n2EiFUl2tZkHjQvMYjv2e9GUjqz5UybhdjtHfNOggwDz2YmdBOpsgDGAoYrE73y0M+QD272iCMGP3C5noPD3O0W8D43/0EnZyz6/bzj2Rm+rPGCp4nw/qmj+9relGnVqKeVRCdMBh0Yc2bA5Q+D+AJvGCf45WEqSMXVGgQ/+POGxVaBul3uwjli9HUqtjM1+H+5a6lp7suNW8BUAi4arfk0wPmwGMgfdsqG6XsHdg41WqUm0TAWyz+yKnP3y7226DBOHkv7Rl0nKuzFEUlos6k1OedkzBN/uR7ZgTdk21Whp8XwmmVvE/AVAtceQFICTHsOfUvipAMqiBFaLJaQyZb4gF8fE2043/vjSBfnEzTvAwLB4rg084k21Odwk0spYYG3dP6Hep4x1mxQgsBZX3d9BbQcYNAOnYi7Gmd7xB1WfUhR8NfOyJRf73px7f4/mqgk+qrMc8geKjgKrHoxv5tE3WLibjcZ3nfKDtyQhdCPXnFDLZgRumjVjx6SOCxfLeyM6ggU8VYH+a3z762NmiT6P/0EdpTsqZz10P/2hyXjLXe46D5iJIkHyGvObhwhDp8Kv0BKdTQ7N1iD+nZr/rxJMH0v3ocqKq+IEqInXZTZcOuMO674=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnA3NHQzN0xGOVFMV0luUlZINFhSSEVEMDFxdnc1cVpDbjEwb1BDTkxReWdM?=
 =?utf-8?B?cFljNnZQRlArQ0VUZlFIK2w3cEN3Rm9XTTRPSkhNeUtHREx2Z1dmNVJhWjlU?=
 =?utf-8?B?MGlSdDUzWHpRek9qUWN6S2ZXTi9URkIrMXpaZy9CckdVY3dMb0d5TU5xa3pG?=
 =?utf-8?B?b3ZMYktXNDU4MVJSRVRnNFVuR00wR3htT1JEZHgyTXhFeTdxU1FOYjlTVkhK?=
 =?utf-8?B?OVFYTzZkRG5sazZwcDJFWlBXTWZKelBEMFlrakFHU2E0eHdPYjgyRTFEZVpH?=
 =?utf-8?B?VmtVd05XZmxTQnRnVWdxZ0hkUlFrQjd0ajJyQ3BaSFg4a3gxRzR0MDNObmt0?=
 =?utf-8?B?TXJYeE16Vy9IYXZiNFpvYTVoYUVWVUVHc2RreERlbWM1Nm8xT3RBRVIyRWQv?=
 =?utf-8?B?dVVoRVk2QWI1cTJXSzZ0WU1vcFhpUW9hSGNnL0V4eWE2aHdkSnZ4MVFWK0VS?=
 =?utf-8?B?aEVOY1RiQ2g3dE5UdkRIS3YxczMzazRZTk9OUTRwOUFFbEJlMlJ3VkJSc1Bj?=
 =?utf-8?B?QXhIampieWlZMWcwc1N5NUxSQUZCY1pFUjB0S3pESG5FY2M0QTgwZWs3OWpW?=
 =?utf-8?B?T1FDVE95MEc2S1c4Z3dwNnQ5eTU0MXdRMmp1ZVhOTlFlNWR1NFBjSTh3Y1pw?=
 =?utf-8?B?TG00bkY1alJNazN2V0NMNHFuNXVhNHJaVHc4ZlUzRTVIblBZcXlTbkxKbU5x?=
 =?utf-8?B?ODlRcWdVcURtVnpSTituK0UvYXBneE1meDlwdFY3Y1E4MW9JQVFDQmNqaDdi?=
 =?utf-8?B?WVMvcStCK09YOHNLN0FyVDdRM0ViM2MxU3VOVkI5bnZseEx4RTVMTGJXS3pX?=
 =?utf-8?B?ODVnWm1KcTZFcjNqTzRBMkU5N0FVcmlud0tzYTVXbFlaTnJpZlZtMW1YNXlM?=
 =?utf-8?B?YnZrTVI1bEJWdk9ZOXNjekM4TzRkWXhTenB4bUN2VnlsMmNWWHVYRTJqWk1h?=
 =?utf-8?B?eG5tOGJCYmoxTnJSRGs3Z1QrWkpMZG9MWHlGRGRVU2loVVNEcXN1UWQ2MWZM?=
 =?utf-8?B?L2hEUjZ2NDRBb2RueUN3SGJKUkxRbEhUV203UkRzRVdDOHp1Sm81QTMrQXFD?=
 =?utf-8?B?V3EzeFB0alZONUVPOE5RNThJdWpKSnViN0ZjTll0c2hiMVFKZHhaY2lZNXdk?=
 =?utf-8?B?eStDcHJEbkJ6bWpZU0hwQmNWNGJ0ZW11K1oyR3R2SXVKdlpLN0wzLzFwSkgw?=
 =?utf-8?B?SGdkQnp4TkFhMXBYcFR1dWJ1Z1dOczlpN29QQVRCcnl6bkNUdFBwVmhvV1RC?=
 =?utf-8?B?UHp6UDczdERVbklLQlBWaTVicFBsVUtMb1E2aU5VVVliSGZBWThSNE5Td2s3?=
 =?utf-8?B?cE5UR1ZnYkJsbHhXQ0V3ZndwSTYrUnVUelNPcFJLNlBiaVQxakIzY0pOWEti?=
 =?utf-8?B?VUNoT2lzREg3VFpOVWVPSDFucTFXUHIvVWExTk1sdnZXTFIxazJWcFFVM21x?=
 =?utf-8?B?OG9QS09FaVNyMXh1N09iSUNTanBhekVWMUpmeGxZNUNCUVlkUysyZzdaNjZN?=
 =?utf-8?B?MjlpeGs3aXl1NjQ0cmhEb2p4L1d2WG96M1oxYmpYd1phcFloOWl5eTEzdXFB?=
 =?utf-8?B?dU5RMFN5MFZGdjdtR3k3SU1hbDR1V3pEb0pWbVpkdW5XLzN6b2QzT3VRcisy?=
 =?utf-8?B?U3BqdnJFeThxaSs5VEZwajdUQWhQRlAxVnZTdlF2MWVPeWdsbEcvc1I2WFBJ?=
 =?utf-8?B?VndOeUFITTVWaWVwbDNjTCs4R0dKVHJ4d0xhSW1id0pxV1NlbDhzaHJjc2FP?=
 =?utf-8?B?RWZRTTlidGZKTUJWREs1eTdna3JNQXJ1MmlOcVhlUXZvUHZmVVF2TjFUeHZR?=
 =?utf-8?B?MTM2bTc2N0VKYVJiK0h3SU9vQmk3WHZObFM3ODBkQkdSNWRRY21Xc1RnSUQv?=
 =?utf-8?B?azEzeFc0N3N3a0hhNVNuRDVSTUpTaVlHYWVjaDBkRFF1Y01LNkRkNFB1Ukhh?=
 =?utf-8?B?VUxoMEtlbFQzMUdZRE9WNjBZNksrbk5oVlVxdENvZEVvN0tEMmNadUg2QUo3?=
 =?utf-8?B?RmUvSnh6WEYvMFcwZDl2ZDhpbUZuZ3M5dlVvNUlaQVd3TFFVaGFVQ2QyUHBD?=
 =?utf-8?B?Q2YzTG1uejUxQTljVmlIZ0pFZU92a1g5N0d1ZVdGbklJMlE5K3VsTFUydTF4?=
 =?utf-8?B?VmVKT0NzSmJDblNLd3NmNEM5Qy9PZk5HV3ZFRWFHelJXQmpKSnNqMGM2Qmpa?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90207c48-1ecd-4d2d-956a-08dc5fab16e2
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB9212.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 13:26:01.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsrwNeQHy0+WWUwZgp7CVeVB43V3kj8NhmTzHhn2QocdZM2p3AZrZR+WVACYf3cC+M6vj8Vc121QQTn01lfYNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7364
X-Proofpoint-GUID: QhmpFd9IVmbZLSYQS2ZA3OB9uw1TINCw
X-Proofpoint-ORIG-GUID: QhmpFd9IVmbZLSYQS2ZA3OB9uw1TINCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_11,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180095

16.04.24 14:05, Andrew Cooper:
> On 16/04/2024 7:35 am, Sergiy Kibrik wrote:
>> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
>> index 35561fe51d..d3d7b8fb2e 100644
>> --- a/xen/arch/x86/cpu/Makefile
>> +++ b/xen/arch/x86/cpu/Makefile
>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>   obj-y += intel_cacheinfo.o
>>   obj-y += mwait-idle.o
>>   obj-y += shanghai.o
>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>> +obj-y += vpmu.o
>> +obj-$(CONFIG_SVM) += vpmu_amd.o
>> +obj-$(CONFIG_VMX) += vpmu_intel.o
> 
> I'm afraid this breaks perf counters on PV guests.  These files are
> joint guest-type implementations.
> 
> Seeing as you leave vpmu.o alone, I guess that all you're actually
> wanting to do is compile out vpmu_intel.o?  In which case, use
> CONFIG_{AMD,INTEL} rather than CONFIG_{SVM,VMX} please.
> 

Thanks for pointing that out.
I think I'll just exclude this patch from the series, and make a 
separate series with CONFIG_{AMD,INTEL} option and code separation that 
unrelated to VMX/SVM & HVM/PV, only to CPUs themselves.

BTW, how would you suggest CONFIG_{AMD,INTEL} shall relate to 
CONFIG_{SVM,VMX}? Should CONFIG_VMX just plainly depend on CONFIG_AMD, 
or more complex relations needed?

   -Sergiy

