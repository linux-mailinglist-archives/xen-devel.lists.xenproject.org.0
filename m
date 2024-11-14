Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2489C912E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 18:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836742.1252630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBe30-0000ZW-Gf; Thu, 14 Nov 2024 17:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836742.1252630; Thu, 14 Nov 2024 17:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBe30-0000XE-E5; Thu, 14 Nov 2024 17:54:26 +0000
Received: by outflank-mailman (input) for mailman id 836742;
 Thu, 14 Nov 2024 17:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpK4=SJ=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tBe2y-0000X8-UB
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 17:54:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f403:2612::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7973f4d8-a2b1-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 18:54:20 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU2PR03MB8091.eurprd03.prod.outlook.com (2603:10a6:10:2e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 17:54:16 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 17:54:16 +0000
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
X-Inumbo-ID: 7973f4d8-a2b1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjMxIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijc5NzNmNGQ4LWEyYjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjA2ODYwLjU2NTkxMiwic2VuZGVyIjoiZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldwIYbOdfAgAA1vzcni0+yRH8YYOi1rz7xDbUH8hHFIlM+3nuJ9TLjrDpd5+TA0cxpmE8Ylj2vBvJFJF8r1nHCKHzKzsGljfBRDJ2RLeWdzwNx5bVqZeOeUvMbcj+mC5y0iC0Cr6jRJMc14aAJxlM/CkeTFhhzIekH/9t5tBPKeWyCEcGfdYZnSAd5Xg5muQrhyX5EFCdET/ItWfCP2n25zdf2oafpI1RnRB05klwMdi01w7p+1M8yOWzce74BFs8C1lfgeAu2pkcBIFpRauimJ4fCrUJYR3fw4qG/B2cdzv2p5l7VK0/FEtU7q1+87MxLDd2FQpgWgPGNSgnjValQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xxh9CkyzunF/CGGaKiqAzpxTU706WN/qzYGuqnx4XgU=;
 b=Yj8tQxiodNEgGAlSdl00GtN+xUlKR+syHB4Q2pGtaAJ6JrwU8lxhYINyYROTtkhUQNrWbhRgjGMGDeDo2lYuEcxp1fR39YoNoWqYsAXRaJgp6sbWSwwGgA23PfEi+X90A21ibKAPBNU4y5qmnxj2fxURCOrm2sHr5A26Akx0H1tZJofj8eIJ6bHzZdlOkeV3x8p59r4RY59EeRiNI7zYBcb2X7NDloFt/L2CVChX5r9Pw5EUkEO9Xoklsoe8McFvcVD38/nRBuqkMgAc4AKkji7BZ0lWifocFP7DT8DO9078b15Z4pvy8K94gwjURRPfn3U39ooYO3zriNB3L3b60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xxh9CkyzunF/CGGaKiqAzpxTU706WN/qzYGuqnx4XgU=;
 b=dTRGQfh2kruuzJmuRiVa+3UXRWGGA0+l5tqePpBsDet7bMyd4mPNH15ewCCMYVBe7cBzT7VWa0mvK1q68EDyi/L5Xkr7iE/WT7vOOZWBBFCuLXuhiPCX5pKK7MZUDw+tHpbPFPR2IXIpl2k6jcCIA99tR6Q1dKQP5KU7vTpadbryzU4Lq/1yZ69jc2NxfMl+IalpSxgMGLmGn2h4c93bjgsO0ckObR/m9NGOaNXcmBxIUI24KbxIBVQTL+IxXQZ4iHVnzoIMQJatCxbCx+qNOsOVMnydsyErtc/mam7t8qFoSbhWndShyjNsx8z+aULgObiJNh1b3c87sXzj6Ergdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <3f3e207e-65e3-4be0-b302-ba04e256625b@epam.com>
Date: Thu, 14 Nov 2024 19:54:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
 <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
 <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop>
 <92564de9-24f7-4259-bc45-a95680101693@xen.org>
 <e023a861-a1d6-415e-9be8-688664bf5680@amd.com>
 <8e467912-a71a-4c10-91dc-46706ed7aa1e@xen.org>
 <7ba02037-05ec-491a-92c6-de7195d298ed@amd.com>
 <7eef8e7a-e2a1-41bd-8805-b00a2bc0ae1a@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <7eef8e7a-e2a1-41bd-8805-b00a2bc0ae1a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU2PR03MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 06aec46f-523f-4b2a-6cf9-08dd04d55b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE5iSHMzK05ib1NYUEM5bVd2eWVqMUtaS283enQ2MjY4OHlUcHR3dmZMRmEz?=
 =?utf-8?B?RkRDZlNZNkIvSlRHelByd2Q2ZFZmL3ZVSmRrQUFNTzVFV1Y1eDU3U0lUcVdN?=
 =?utf-8?B?bGJHclNseHlSRWtySk1BK2xrcGpzdW5vaUpCUnUxNERGcFpJaExQUU5CemJJ?=
 =?utf-8?B?K1FXN0pNbEpXY0JUd01MZ3hCckVlNUIwTnYwaXRjNDVWQ1dqdkl4bVp6Y1RT?=
 =?utf-8?B?THduVjgrSXZmRTZTZE0rbmtWc0x5V1JUL21xMXh5VzB5MTM0dkFCMkhkV0lv?=
 =?utf-8?B?R0lhdVFMeURQTUdSYXR5S0NlQ09zK0ZLZkV3cXVGTTFZTEtKZEFNdDJFcXo1?=
 =?utf-8?B?Q2s5N3c4QzMya0pkNkZpdlRZVi9ldmhPdFc5Nm8vcy9lVkFVQ3R6dFVuU2Rx?=
 =?utf-8?B?RHNpczRlaVRrQVZGUVZzVy9tOTJWaWIzU002VkVtV1Bwdm1ZdlZ2WEU3T2M2?=
 =?utf-8?B?cStyWHZQSUlBZW5jeWVnc05uMTluMkFYS0xqdUw2WmQrZHhzcmhwVVdORG04?=
 =?utf-8?B?UzhGL1F6OUxjYUFOaFFvT0Z4TkZOejBGQ0NmYlAvc3p3OHFTenRhbVkxejh1?=
 =?utf-8?B?dnFFK09JVWFZWUJOQ0oyQS9tend4WVBJaElOaWNiUHdSeW50Z2hHK0pjS3Jm?=
 =?utf-8?B?ZmFOT1p3aU56WUgxaC9RMktEQ1hnTmRUS2lHVzFFSDlLcVJkWXBMQlhNTlBV?=
 =?utf-8?B?K1NQTkRQaDVrcnpReUVyTE1aK21IaGExQVl1N0ZMaWd4Q2E0M0ZvOE9IT0xC?=
 =?utf-8?B?NTl6cWFsa3BnUU16ekF1LzZPY0I3ZHprSTFOY3puSU1OTGp6QmZwUXpmeExj?=
 =?utf-8?B?NkM4RTFrcFBDckprNzIrOW00Nzd5OGxZNkxreDZoS0FlcjFYRFQ3NWI4TjFr?=
 =?utf-8?B?U2pjRnViV3hWOVBKUmpSK2liU2lNWnBUTEltTGYxb3owMm9ya0RBNUM4UmNk?=
 =?utf-8?B?Z1pVM2dWVEhndmpabkVDNWpxalVmWXlZRUFlYTRNT2RoTTVINWUwa2IwMG0z?=
 =?utf-8?B?Y1Zlb0tmbEtUNW5BWk1LeEJYWlR1QWFSam8zL2RPdnhxN1BTcEgzUTdManJk?=
 =?utf-8?B?alB4cjJ4TUdidThTc1V1QVZTUnlXdWVHbXFFekdqQW1CeUxvamN6eHJSUzFY?=
 =?utf-8?B?UUtSS0U3MjlPYmtpTEFXK1dpTXQ1b2hSWS81S0Z4V1IyeTNtK1ZXSTVSWElV?=
 =?utf-8?B?bEgrN3ZPZnVGT0hQam5qb3lMVFBFc1BqMWRUL2R5MFAvdFBWZ0hrNnlwOTM4?=
 =?utf-8?B?SmtaTVJqL003c1NiS3BqYkZHMHBQL3kvd3BRaldYZE1CdGZRdmkraU9sZFlk?=
 =?utf-8?B?VUxnb25yTDVSRVJxczVkeHRuU3NFNnpzMHBMSmR0L2hKbUkvNzY3SmdaNWpi?=
 =?utf-8?B?L3FlaGNyUERpdTJ4NXN3T2sxZWNLL2N2Y1BVVGx3WXZpdjNaWDNFNi9mL3Ny?=
 =?utf-8?B?d2w3cEM5blZXVEpxUUxXSHpTOTR2QWwyVWtVNUxET1cxdW52SUlwanI1Y3ls?=
 =?utf-8?B?YU1DZmtDK2Y2WFdQQVU4Z1hCRE5KbmdYeEdmTi9IeTkyTXFmcXZIejFkT2FB?=
 =?utf-8?B?Q3lzVEh1Y0NSTDNsdFVOSWVKU1gwUktBc3FqWE5MdjJPMkxhUUszK2hBc2FB?=
 =?utf-8?B?ZjJVU2Ficy9uelFSbGdzVWhjTjhXaTNNbjA0cXhGR21EL1dyUGpYNHZ2d0pX?=
 =?utf-8?B?UWIvZWVxZ3Z6M0pyejlYVFdRSVBvajFjT2FiZVZZM3Bma1hoMWx5MTFMU1pG?=
 =?utf-8?Q?l9FANd5xwGGC+usAmBpCWiMYDsUBU7o6QS8BWQi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZvdFBxNWV4QnRXWi92aTVTSGlkU3Fxa0VZUEJnU0JTa3M1UmJrb21KakdK?=
 =?utf-8?B?cXd0QzdIQ3ZNZ09sN29OazduNjc5UWFLZFRtOHdRRm00dXZpUnpEWjdOc0N4?=
 =?utf-8?B?UU1ySVRvQkpqM1BneEpXUzk4dVlHazdBeHBFa0w0OEw1NUxKNzhTSllCZnNW?=
 =?utf-8?B?eVRvNW1WOXk2c09jQWprL0M0dktoNzJLb1VnOGM1eFE1M3l0YUdLblgxZlZy?=
 =?utf-8?B?WGJ3TDFZWWQ2d01zMkJ1Vi9JVUVzV0JjSGxFa29mVWIwOXY3blB1N2Q0SzJu?=
 =?utf-8?B?S2F0L3lyNFRYQ1AxRmFFNnY2bThYeXlmR1Z4alRlNE9UUDZiMDc4Q2hnVHFX?=
 =?utf-8?B?T2ltSjZtZ2dBT2c4OEs0a2luZDJyWXRBdDVxVjU4WTlRVFVtTXBiVjcwWTJo?=
 =?utf-8?B?U1FoWHB4M1NVOU9NeXVVNVBZejUvcXJKUUFnakpJWTE3eDBudmtOMHJGdndV?=
 =?utf-8?B?TFBkTUx5RFNRVW9sOTJNbk5sUnQrQ3ZtNC9US1RDdGZNeG1iL2FBWEh3ejNL?=
 =?utf-8?B?cSs1VEpkNzN6OFNLMzNqZkgxbGRNSWZjZ3BTSXpJZnQ1UXkvRkh5clBWMUw5?=
 =?utf-8?B?K3FjTmdWWlVqUGxBbG42MWkvRW1Gd0pjckcyeDFUelQ0VStoR2lMc1lUVWxW?=
 =?utf-8?B?ck9tQTltL3JmWTY4anphc20vc0hGUU5KV2NIZURXT0hBZkZxUFNRQXQrUElp?=
 =?utf-8?B?dlpMWnRYaGwydkZpT1Vkb3dhMlNCeCtpWHJ3cjJ1NmdHNFlreUZsMC9ZVzJZ?=
 =?utf-8?B?ZjhLbkZNWnhIMEFBLzcvRXJEVHFWelZTdjhuZEFNcW5sVmx1YkUzcm40V2tV?=
 =?utf-8?B?T21FMDhkM1dYUm5CMWZTMzRQUFB5R0I0dnphTmJURURkOGMvcHFuM1VQamVo?=
 =?utf-8?B?aVRyNXV2Y3Z1dmJEVUVZUUpvc1ZkZm1IT3pyREpzdUc5Q1VxWXFNRGJkNS9I?=
 =?utf-8?B?Vko2OGpoSXk5YWFqQ1JwM1FTejNYaW50Slp1cU11ZDViVFUzV0JXYm8veVZ3?=
 =?utf-8?B?ZSsvZ0paNDlBcDloMmhGRGZyRjdaNUxNUW85MjhKZ3ZTR09vR05TUnBXcDlh?=
 =?utf-8?B?L1JTVWZiZlNWbEJkdnRNNnA5V0RHdGRSTzhxbCt6R0NDSlo4MWU0ZGNENkdL?=
 =?utf-8?B?dkUvejlDcjEvMXlUY1hxOHRPbEpoSHhIUlI3cmVHM2RUMW9TMzNPZjJnazZX?=
 =?utf-8?B?NndoWG1KRDFaR2Zwb2d4ZXZUR204VzR6WHZSVDNvWlp5eFVJQXo1MUpueFV4?=
 =?utf-8?B?dGV6L3hRR1JsYkxna2dob3lZTzBaZU42am1uYzFoWVlBeGVNWWNvbDE0cC9i?=
 =?utf-8?B?enNxemdJT3BSbTZjYy9hV3hsZHZpTUE3Vm1nUy9GejEyQ1BWVmlzdlBGWVJo?=
 =?utf-8?B?RGpIYncwYzlFVnEyTHpsdjFtc3NIN3NXejByNVhqZUE0S0s2TEo2Rm1OQVhF?=
 =?utf-8?B?aUJxU2l1TVh0Rmd0ZzRiU29sMGFvRENyV0NyWXhVT2x6MjJoUDFhR2c4emwy?=
 =?utf-8?B?ZlpteUZuMmJ3bUFqbHFtYllFdHVNV3d5SDhPei9kOGxGY3I0d0hwNS9vZ0w1?=
 =?utf-8?B?akNsK2dUV0gvUU5hTmxqdzlSNUwyVFhydHNSdnJXMzFNTGVwb1hLelMvbUpx?=
 =?utf-8?B?OUVVM1M3S2U4aUtaQllGbUkzTkw5c0puM1Axc201a2VLT1JOMzc5Tk92MU1p?=
 =?utf-8?B?RVgwelN1Y25QLzhwY3F1Z3J5RFFoMzFWRjhYUkxEMVJFWG1HSXY1RXY0M1VV?=
 =?utf-8?B?TlZ3VzJOaXlNaWRQM0JUSmhCR1RmZjByOGFuM2RtRmFlMFhST0IxZ0N6T3NI?=
 =?utf-8?B?QVg5dnk3R2NvcERaSjdSS0FRUU1sWnFoUkpraElkL0FHcUNYVjlyV1FaRVVa?=
 =?utf-8?B?Q3JkQXlOSFFiQkh5eWlHWTJUSkMwZllXaFZ4c2pqMXRMMVFBVUNCUzF2QnZB?=
 =?utf-8?B?WUdmT0pLRjFsL0N2aEJiQ3lCR1Nieit4NE4vWnN0Y1EwVzA4Z2J4TmNHdDB3?=
 =?utf-8?B?UWE3d0V5b2tadXloSzk5OGhzZG9qV0FURWZUWjRyTkJhZTJVSHh2YWdkdm1K?=
 =?utf-8?B?c1oxR29UQTVEdXlrOXZ2c2JtdW9xRUh0WHVaeWxtYWNpVTc2eFRtMkZsaXRY?=
 =?utf-8?B?UEttY0JpQzVhb0lWRms2SWZPRU9TTVprVlJ4REowSmoxQXh6VnZJRW1JN2U1?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06aec46f-523f-4b2a-6cf9-08dd04d55b16
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:54:16.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PLVrUZ3ZnugWM5ooCgSp2DF3UCUqz4XPSRbSMu0Ehc+yOzFS/YhXPB/FzrXZQrxISot3i5MxNJ9mEs6RGHtMBc/cfVXO+1Rju9YzICEHuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8091



On 14.11.24 15:09, Julien Grall wrote:
> 
> 
> On 14/11/2024 12:22, Michal Orzel wrote:
>>
>>
>> On 14/11/2024 13:04, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 14/11/2024 11:48, Michal Orzel wrote:
>>>>
>>>>
>>>> On 14/11/2024 11:31, Julien Grall wrote:
>>>>> Looking at the code, I think /memreserve/ and /reserved-memory are not
>>>>> mapped in Xen and everything in /reserved-memory is mapped to dom0.
>>>> Why do we forward /reserved-memory to dom0 fdt but /memreserve/ not?
>>>
>>> I was wondering the same. The main issue I can think of with
>>> /memreserve/ is some of the regions will likely be for Xen own usage. So
>> Can you give example of regions defined as reserved for Xen usage (other than static-mem)?
> 
> The spin table to bring-up CPUs.
> 
>>
>>> we would need to have a way to exclude them from dom0.
>>>
>>>   >  From the discussion> we're having it seems like we should treat them
>>> equally. Also, looking at Luca patch,
>>>> we seem to special case /memreserve/ and only allow for overlap /memresrve/ with boot modules
>>>> and not /reserved-memory/ with boot modules. If we are going to claim that all the boot modules
>>>> can be marked as reserved by the bootloader, then I think we should treat them equally providing
>>>> the same experience to dom0.
>>>
>>> In my mind, /memreserved/ and /reserved-memory/ are different. The
>>> former doesn't say what the region is for, but the latter will indicate it.
>> In the context of this patch, I don't agree. We're discussing overlap, and if a region A
>> from /memreserve/ overlaps fully with a module A, we know what is the purpose of it.
>  > Today it's initrd, but as you say we cannot rule out other modules as well.
> 
> To give a concrete example, the /reserved-region/ can be used to reserve space for the VGA buffer. It would be odd that someone would put the boot module in the middle of the VGA buffer... If Xen ends up to use the VGA buffer (not the case today), then it would be a problem. Xen would need to be reworked to move all boot modules outside of the memory because it can access the VGA (or any other reserved regions).
> 
> The problem is slightly different for /memreserve/ because we don't exactly know what the regions are for until we parse the rest of the DT. Yes technically, a user could put the initrd in the wrong place. So the problem is the same. But this is a relexation I am more willing to accept over /reserved-region/ right now.
> 
>>> So I am not 100% sure how the bootmodule could end up in
>>> /reserved-memory/ because they are described as part of the multiboot
>>> modules. Do you have a scenario?
>> I don't same as I don't have scenario for /memreserve/ overlapping with sth else than initrd.
>> All of these comes from my validation of u-boot, grub, barebox code. I have a feeling that due to
>> U-Boot trick that is not present in any other *known* bootloader, we are trying to over-engineer the problem :)
>> But as Stefano and you wrote, we should follow the spec and for me we should therefore treat them equally.
> 
> See above why I don't think we should treat them equally today. We might be able in the future if we can categorize all the regions in /memreserve/.
> 
> [...]
> 
>>>> Last thing I wanted to ask (for my clarity) is that if bootloader loads initrd at region A and marks
>>>> it as reserved (either in /memreserve/ or /reserved-memory/), and later on Xen copies initrd from region
>>>> A to B, shouldn't the reserved memory region be updated to cover new region for initrd?
>>>
>>> If we mark the region has a reserved, then we are telling the OS it
>>> can't use the region. But I am not sure why it would be needed as Xen
>> Well, in the context of initrd, kernel uses it even though it is reserved. This is because
>> of the second part of the spec where other bindings come into play.
>>
>>> doesn't care how the regions is going to be used by the domain. From a
>>> domain side, do you see any reason why we would want to mark again the
>>> region as reserved?
>> TBH I don't same as I still don't know why U-Boot does that trick. It comes from a very
>> old code and my initial understanding is that it is done purely for U-boot bookkeeping.
> 
> /memreserve/ (and now) /reserved-regions/ are an easy way to find the regions that should be excluded from the RAM. Without that, you will need to have special case (such as for initrd, and the various xen boot moudles). I suspect that Linux have a special case and hence why it hasn't been a problem that Xen doesn't reserve the region.
> 

My be it will help in this discussion - some investigation results.

At boot time (only ARM64, but other arches looks similar):

- Determines if initrd present from DT : early_init_dt_scan()->setup_machine_fdt()
or by checking bootargs "initrd/initrdmem=".

- [1] In arm64_memblock_init() it adds initrd in reserved memory
https://github.com/torvalds/linux/blob/master/arch/arm64/mm/init.c#L274
therefore Linux doesn't depends on any kind of "DT reserved memory" ranges for initrd.

- The Linux processes "reserved-memory" nodes first.
https://github.com/torvalds/linux/blob/master/drivers/of/fdt.c#L504

- After this FDT memory reserve map is processed:
https://github.com/torvalds/linux/blob/master/drivers/of/fdt.c#L496

The Linux doesn't perform any special processing of FDT memory reserve map -
it just adds it to the reserved memory list (splice allowed), which is reasonable, as
Linux doesn't know what is the purpose of each reserved memory block in FDT memory reserve map.

Later based on DT (or other meaning) some reserved memory can be handled in a special way.

After early_init_fdt_scan_reserved_mem() finishes - the result is the list of reserved memory
ranges which are excluded from generic memory management process.


In case of Xen, initrd is not intended to be used by Xen directly, but should be passed to Dom0.
My current, understanding - it will be copied, so from the Xen point of view the memory occupied by Initrd is
not permanently reserved and can be even freed once Initrd successfully passed in Dom0.
Also, due to the point [1] above no need to pass initrd memory as reserved region to Dom0 Linux based domain.

Honestly, it looks like nothing from FDT memory reserve map make sense to blindly pass to Dom0/hwdom
- initrd (described above)
- FDT - it will be generated
NOTE. From u-boot fdt_shrink_to_minimum() code it can be seen that FDT region also could be in /memreserve/
https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L766
- spin-table : Xen owns it, I assume.
- any kind of secure/firmware memory - domains do not care unless specified explicitly in "reserved-memory" (or by other means).
   Xen will guarantee that such ranges are not touched/allocated, i assume.

So in my opinion.
- native Linux (or other OS) need to know about all reserved memory to avoid clash with generic memory management routines.
- virtual Linux (OS) does not need to know - as Xen should exclude memory, defined as reserved in System device tree,
   when allocating memory for domain.
   if domain need to know about some reserved memory - it is expected be defined in DT explicitly (or by other means).

The Xen performs the primary memory management role in virtualized environment,
so it is the main user of any kind of information about reserved memory.

Do not shot me please I've tried to be helpful...and issue fixed.
BR,
-grygorii
  



