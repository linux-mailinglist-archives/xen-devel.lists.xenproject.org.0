Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6D6A5326
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 07:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503011.775117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWtj5-0000LX-H0; Tue, 28 Feb 2023 06:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503011.775117; Tue, 28 Feb 2023 06:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWtj5-0000IO-Dt; Tue, 28 Feb 2023 06:44:39 +0000
Received: by outflank-mailman (input) for mailman id 503011;
 Tue, 28 Feb 2023 06:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iUwr=6Y=oracle.com=joe.jin@srs-se1.protection.inumbo.net>)
 id 1pWtj4-0000II-3z
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 06:44:38 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a3485d7-b733-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 07:44:34 +0100 (CET)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31S6BWbQ026040
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 06:44:29 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb7wned6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 06:44:29 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31S5vF9C029242
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 06:44:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8scdsdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 06:44:25 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 by IA1PR10MB7214.namprd10.prod.outlook.com (2603:10b6:208:3f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.16; Tue, 28 Feb
 2023 06:44:23 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::d2c0:2a72:2c9:e988]) by BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::d2c0:2a72:2c9:e988%3]) with mapi id 15.20.6156.014; Tue, 28 Feb 2023
 06:44:22 +0000
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
X-Inumbo-ID: 5a3485d7-b733-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : from : subject : cc : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=fgvHt5SuU9nY5xgzbhsJbr2Vu067gE/yZqnquXFHFpU=;
 b=TmDfbHZ9YLJB1O/BJHkeb5KE79P2LzXznV/UzHSxAdO6ONfAnujyyrLXizD5g4vVm3EE
 +IqelPaaagq3o+wuqXmy4P8LTqwaGSopMVtIca44FFtZh41frwrE4Y0bXLCkgwujs3D0
 Uia2+jrxy/l9tJGKXn7quu40yVt7ILoONYxGc18TUG6caUCKLRhv1fwujSRALbrUP6Y/
 94liVtiBiHAHT3exZCFerkxewoqdS3MSwe/4uc6Ms05CCAlc6JKYfegtatS3GlaqOUw0
 LX9gaUxNBJtJRYb6yH5l/VOUytI55kzz+dzbdmGP4YGC6lkEUPvkGy/PK3rrOynwEqoU kg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/2dmsmvOGvddiI8UQXG3MFFqOBg6f4hjr3gCFjp+gxUjd3OQDdKrXOgcvWv/jplNUAGZABGRPEypLeGY7I8FmfMCpqf+K+msmyQQSR5ueYCg6DFx9JOiMHuqWVEs6tNvfMbXNH9y3NX9bbtklGrKmJQb89+9haE5nxy/hnCBY82SdIn8/7lSMVPT5kdIIwqsJd7bf58GVDntsD6JZetRYdbmW0kM5fpfUFzCe+r3yZ08ZQ9LaRIr4i42vy6P47mpVztu/lz9U9Li+LqzSby+XmtUII04nHOAGW8ySMwtpsuTY1t02cH5YWG9HoxzqnW41t52qDKr7QzpJlJZaO4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgvHt5SuU9nY5xgzbhsJbr2Vu067gE/yZqnquXFHFpU=;
 b=T3qNZbAhNiWVycF9UAwcdmTR9DpscWGpYHieALJUneq8bBRFMkbwLUnKR5h5qtK9QUkXJ6vArZH/V82hgQ9VQoT5dBGyU0NEokgbQhTTuUSVRH0Si6Tt3w842dLqjfxt3S3C+k7JBMRqX242cLB+pNK/mFsQr4zV/Vgr4XEveVC9uIqCt9R6C1VN+RO2r5Q+A6xlzPMRzLMBqbjwNxqXFnOsNDVIeeIUegBxHf0Ss+Ip2kOyHdq9jH0gFMo1E4mLcUhQXCb/dFNV5p7xLfgPKXcKHUqCH6IvRj+wibKWgMMQ/sdK0D7RLjkEi3MZ9+Zjb41rBc61HW9M6GZfuUxuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgvHt5SuU9nY5xgzbhsJbr2Vu067gE/yZqnquXFHFpU=;
 b=GqSfc+eciXtJNbNaTfJ8qLvFY7gbvNsWVK92h+yKIU3T1/t/ZRvw1rOgdwAxC9S+lwQfCK9lYgS6k1Mhuh2aT5wKanMLDDNUKIPBlGy1JyhomNLugcdFWXSZWmig2VRj3uq8met/osd/T/xqCZmhEbW4U0zmTHOAjTHUVQILTE8=
Message-ID: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
Date: Mon, 27 Feb 2023 22:44:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
To: xen-devel@lists.xenproject.org
Content-Language: en-US
From: Joe Jin <joe.jin@oracle.com>
Subject: Is xl vcpu-set broken
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To BYAPR10MB3160.namprd10.prod.outlook.com
 (2603:10b6:a03:151::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3160:EE_|IA1PR10MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 1428af61-c4b1-47b5-44a3-08db195739ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qg07FUM8mLSd013a8svRo8RtxR3fvpxZBirGJ6mFUR/6km95MvPrBnzv6lDvOg75FMl+GmWPxcxa3466gLHVzFNxwvKepC9UrAitASe18IAyzMJ2sipd6LcHoKi6MW5O9ySnwbwVlmay4KSK7jwqxEAsULz0Rw2+R4ZuvWiqYQQ3KGg1AQbBl9+Bfe3BbrfO9u9o63xUweV7WZw2Q6HkEKpsJiuFaOz2/7EE/x3o2NmE1lnnN9ZDiJ39obrb2lAfZ0iGdd1ggyA4/fec8JmsnWeeSnzXP6wA10KH3+UTlBbxlOL/EjYNigzu9oCMro/4sGpa2UC5EDGE0+iDv/TX9YhyyvUKEfrcAp0QhZ9J/yLb/HZ4YL+uTc7E5HhYvz2bII8nC616/r7SKVQrgFWjlIySJ3430Nr9m9ONzPN74Vfowy+l1A2HzKAI+ajXwbTmWF17ujTgQ0eFdbLBV/vDl0yLfNhr+4xocdtlPxxexCFLtg/IOiplWtOlT9V5bNydSz3gatbhxgAj5abejui5rY20Jp33TM1F8LMIuLihoE/L/Ms2vCYaioXrvEhQpshyp3MREijr/6VHCZW0CM3U+XUk1dZYx0py3yr0BGjPMtIblHrC0p6ucI3ZvfzZHEHsjs09HFbmgwQ/QzYsBuowA+AqI/IU6lEMqo5HWfCXrevDa/KgNQlYUlT2c0C5e/6MjA+XBU828nSThbQg+W6sjUlvNlqeUXmzTH8ofIYEL2U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3160.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199018)(31686004)(31696002)(86362001)(36756003)(41300700001)(66556008)(66476007)(66946007)(5660300002)(8936002)(6916009)(4326008)(8676002)(44832011)(2906002)(3480700007)(38100700002)(6666004)(107886003)(6486002)(478600001)(316002)(83380400001)(2616005)(186003)(6512007)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djRYL0JUL2QyM1FSdUM4Sm5LRkFHWVBmVWwzS1VSRVBueHZZc2tPaGhER2lk?=
 =?utf-8?B?dk1McEFNQVZIbEViUGdsbnprNUh5Nm1lclplMUlOYkZ6NTgwcS9TelZPaGk4?=
 =?utf-8?B?Uk55dGhMdEhhNnBTaVRqcnJVMXc1eXpCN21TeWNpMDZLRVBhNHlCVUQzaExJ?=
 =?utf-8?B?K2JsbjFkK0RFdkpLQVg4b0Jya3V4TWxJZVcvRFdNZlRpdE5NamQwTzVKbFZi?=
 =?utf-8?B?SDBST0k5TXBOZVhUakx4UitVeFRpTlJwd2pCMWhDN1FTcWt2YXV6OUt0SFBx?=
 =?utf-8?B?QWtFKzNYdHByS2JaT1d4QTE1K0ZiaDVudlZCSm5qVjZhNTVBeEdiZVhaeWRL?=
 =?utf-8?B?c2QrajVlNXRpbWNKbU8wOS8rMVhmSVZqSi84NG1DNVBHV1lDMHBpSHFaSzhZ?=
 =?utf-8?B?QUZQSGFkTDNuTzBEbUtFeWE0ZHliSEFlY1lTdmlCOXdOK243NnFqZHVYY2cr?=
 =?utf-8?B?U0hMVzE2V0R3VjQ3WkhnQUszVjFkSE5EQUVBd2VEOGxWRDdxbXBHdVp5SWZ3?=
 =?utf-8?B?NGEyeDFnYk1ENWQzYjlObVlzYlVCOUFHSXhRTXZYbnlRTVhLYVdJYitXV3Vx?=
 =?utf-8?B?M3cySEpheWNiZHZ0bmtwbGRMSElRWnNSZUsvc2hSaW4xWHVXTVJlQW5WWGlX?=
 =?utf-8?B?UlNYNEJhZ1NyN2w3TVNmRHBFLzRoK1R6VE82NVptdi9wZnZ5cTBoNnlHNGFG?=
 =?utf-8?B?WFhBcmxIczkxbEhBUXJZeWdXbksxcjhob3dJYXU5UmZCblRUbzdYRG1RNm1I?=
 =?utf-8?B?RTJ2TGZ1dHhBbS8yYVZOOVAzTW9iZlM3TEwxSzN0d1FJTlBZdzlTY2Rqa2Vh?=
 =?utf-8?B?cyt2R0JnZzFranFvaE95eHBobFhhaERrVEhSVGRVblpXUkFaL2hqVUV5K0Yy?=
 =?utf-8?B?ZTFuaXJtVnR6cnZGZ08wK3lGallhUlNEY1RBaXBPdFBSOTkzb2R4dHpOUmFs?=
 =?utf-8?B?TDR4QVF1SXRlQ0ZScHBFQlhkT25WOWlxU1Nzdis4NVpWN2ZxTzhaenczNzdn?=
 =?utf-8?B?ZFBIc2piU29ERUpWaExyWFhBNXhEQ2pHOWNrbTJRU1dYMnZkRkhMVFYvVFRY?=
 =?utf-8?B?emx3ajhqbXM3RG1VZHRiUzExWTJXd3FuMHFhUFM1eVVqRjI1WWJCYnZIWVI3?=
 =?utf-8?B?c1NHdEdZNXd3SGp2NFh4YUt6ZHFML29meTZKYUluY3g1d21SUmJUeDBRM2Ey?=
 =?utf-8?B?UDhSZkhEaFhYaHpsVHRGTVdNNDlRTHV4SUZ4OXlmTEtvR2w3MUNmcDV6eUx3?=
 =?utf-8?B?dlljWlFKbm0yUGxFNHNTY1lyQzg0WDlpa1Z6MzJVSjhVNXFneU13V1V6eDE2?=
 =?utf-8?B?dGE4OENKUVJhRU5qU0RGbzlPRnB1YlFOWjlsU3ozbTBTN2pzTVhENGVNLzVu?=
 =?utf-8?B?Vm43SDIyMWdtUGdpbnU5N3lCUlFtNkJwR3VUKzF3VzVVUnVhNjVDY05ZWkpN?=
 =?utf-8?B?dTBlbHdZNGF6c1RKTWFJRzZLS3hKdFAwallrSUZ1djBFV1h2RUpzQVlESy9I?=
 =?utf-8?B?MkErajVDRG1wTHE0V0hkQUhhTm4yeFdmUzliVWZEZEk3V1BVbzZCOEZ3d1dS?=
 =?utf-8?B?dzJJWjY5cllUTlM0RjdPQkR2azVnUmZwOHJMRWhKb3ZDNmNLSFlKZFhwVmRr?=
 =?utf-8?B?UWRJN3IwZ2hla1BNZlZlV01LWWl3aHVEUHQ2NzkydmpxTFpidGF4R2FTcHBJ?=
 =?utf-8?B?aHFiNm5jTVhWaXcxcGc4M1libThkNDJsVG41MkM4ckY0cFczSW9DNHpNSHl2?=
 =?utf-8?B?WkdWdWlsTzlIcGpvaEhiU2FYTWhyTHVKR1hUVFJhaXFpSjZkN3RUNnM2QkE4?=
 =?utf-8?B?R2J1V3UyZnh1TktpL2Q2elZndVhaa09CYWRnQ2d0RG9PYkl2RFd1OTV0VGhC?=
 =?utf-8?B?MlZLcXdZSGk3RWNTU3d5TEtPMFRESkprcVdQY2UrZUk2Y1RGWFczYkRMaHdW?=
 =?utf-8?B?aHIxZExBTnFLRjVqdVhSc2NDaUlDRjRhcm5TdXJja05hbjB3VjlyUEx2cElx?=
 =?utf-8?B?UFVZc1BYYkhJQzZnczBsejBqQTQ0YmY3ZlV0T3JKb3FOTXhGeGpOOTlxTkxr?=
 =?utf-8?B?Q1g4bG5HY1lDZkVOUFJPcFpRS1NDakNtWTF3VkV5TkIwcitHbEllNktaclRP?=
 =?utf-8?Q?vePlTumm+rl6wpIwnRM65fBS1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jPLMHcIb0BUk6aUbGjWYBdwQSy0yeF599XWIxfyVpVdlfX5bKeVjthB8LZax/svqEfkA1osvtccEopJYoMy1fadYeyvW5qpt5VpAGAjeF0KttTip1prMJtiZ4tcXJxcQs0yr3QEWI06V/vN9eqCaEJy0+/D6PkA9dUuihWWPpGtYEV6zNq0Cehmp39EjqUCXmnuyE4ejrtRWFtUbNfm3TaS/JGYCheDnn8lujrLxFcrkCP1/dlcsqepGu/vEeK5JCYIisY2cNGbO/jTnngNEnkO/2AEOq0BO08SSaIhUJUnF4xJ2bCacYcFA1D+QlQacrssE2dibrMKcCFNJwHvhi7xOArCbZsF4KyjKqcgN2Uo1FXDqNP3M/4vloZ+8xYjXK4xk0LzWpERWLsTia+H/lM69uo6YnmWb75cXtk9YkFbQmQkMSH4fJP4PmSphSCeKIWdo3ek2u1D5azMheS4Zy467KH/nCqq0Rjx+fKUuA9X3E+7huHDA4sA0Y//0Axwwo5GAdenx61ryHp1Ba62KVyTWVeZfnQVARD/FdZX0AODAL3C007kbrNSKu1ir/RJR520ZRP9ADNI1YAL9Qmffc0cq4BPJy6VZcRfQu+23m2h105dUNbN1R65UxpEAmAq6y1ECx+cllm1AGFo4YrXmoEKPWR9QvSPAW27SJlt5A9ZB7b8s91tUPnhxw5EzbT/T8w0adNp51Zqs/ZCSE+ZIV3Pw2DlgO7GtAt+mAWr3ubYkaoCf9tNpXcvD6T7TMyJ4KUWUtxwSMRYW9+5jirjlgg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1428af61-c4b1-47b5-44a3-08db195739ca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3160.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 06:44:22.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ateciH/A2tMSjBDGon3AiennN8xqHVYOzYImgcY4z0OCTUpp1jQZPEomyT/SSsYshBi559Lqr9Igd38GBucaig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7214
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_03,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=781 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280051
X-Proofpoint-GUID: ZqEF0LjRKMiz9TtqgoA1FdZvjuOXq13z
X-Proofpoint-ORIG-GUID: ZqEF0LjRKMiz9TtqgoA1FdZvjuOXq13z

Hi,

We encountered a vcpu-set issue on old xen, when I tried to confirm
if xen upstream xen has the same issue I find neither my upstream build
nor ubuntu 22.04 xen-hypervisor-4.16 work.

I can add vcpus(8->16) to my guest but I can not reduce vcpu number:

root@ubuntu2204:~/vm# xl list
Name                                        ID   Mem VCPUs    State    Time(s)
Domain-0                                     0 255424    32     r-----     991.9
testvm                                       1   4088    16     -b----      94.6
root@ubuntu2204:~/vm# xl vcpu-set testvm 8
root@ubuntu2204:~/vm# xl list
Name                                        ID   Mem VCPUs    State    Time(s)
Domain-0                                     0 255424    32     r-----     998.5
testvm                                       1   4088    16     -b----      97.3

After xl vcpu-set, xenstore showed online cpu number reduced to 8:

/local/domain/1/vm = "/vm/aa109ea0-2fde-4712-81d8-75f73bd73715"
/local/domain/1/name = "testvm"
/local/domain/1/cpu = ""
/local/domain/1/cpu/0 = ""
/local/domain/1/cpu/0/availability = "online"
/local/domain/1/cpu/1 = ""
/local/domain/1/cpu/1/availability = "online"
/local/domain/1/cpu/2 = ""
/local/domain/1/cpu/2/availability = "online"
/local/domain/1/cpu/3 = ""
/local/domain/1/cpu/3/availability = "online"
/local/domain/1/cpu/4 = ""
/local/domain/1/cpu/4/availability = "online"
/local/domain/1/cpu/5 = ""
/local/domain/1/cpu/5/availability = "online"
/local/domain/1/cpu/6 = ""
/local/domain/1/cpu/6/availability = "online"
/local/domain/1/cpu/7 = ""
/local/domain/1/cpu/7/availability = "online"
/local/domain/1/cpu/8 = ""
/local/domain/1/cpu/8/availability = "offline"
/local/domain/1/cpu/9 = ""
/local/domain/1/cpu/9/availability = "offline"
/local/domain/1/cpu/10 = ""
/local/domain/1/cpu/10/availability = "offline"
/local/domain/1/cpu/11 = ""
/local/domain/1/cpu/11/availability = "offline"
/local/domain/1/cpu/12 = ""
/local/domain/1/cpu/12/availability = "offline"
/local/domain/1/cpu/13 = ""
/local/domain/1/cpu/13/availability = "offline"
/local/domain/1/cpu/14 = ""
/local/domain/1/cpu/14/availability = "offline"
/local/domain/1/cpu/15 = ""
/local/domain/1/cpu/15/availability = "offline"
/local/domain/1/cpu/16 = ""
/local/domain/1/cpu/16/availability = "offline"

But guest did not received any offline events at all.

From source code my understand is for cpu online, libxl will
send device_add to qemu to trigger vcpu add, for cpu offline,
it still rely on xenstore, is this correct? anything can block
cpu scale down?

Appreciate for any suggestions!

Thanks,
Joe


