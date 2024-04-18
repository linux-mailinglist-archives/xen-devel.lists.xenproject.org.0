Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88268A9AFA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708359.1107220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRbW-0003bq-GH; Thu, 18 Apr 2024 13:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708359.1107220; Thu, 18 Apr 2024 13:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRbW-0003Z2-DG; Thu, 18 Apr 2024 13:15:06 +0000
Received: by outflank-mailman (input) for mailman id 708359;
 Thu, 18 Apr 2024 13:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9OU+=LX=epam.com=prvs=083815c34c=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxRbU-0003Yw-Hn
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:15:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b82e07-fd85-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 15:15:01 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43ID0hB2010513; Thu, 18 Apr 2024 13:14:28 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3xjyq4s365-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Apr 2024 13:14:27 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB9934.eurprd03.prod.outlook.com (2603:10a6:20b:62a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 13:14:22 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 13:14:21 +0000
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
X-Inumbo-ID: a8b82e07-fd85-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgsQrr2mPI1IuhMvfhl/fuVTeJj8CxZCWSMokWRh1rdLTCPxf2JlTTrDfFz+qP5SdxTfE8zj3VG3FV/hKiWxxO96aXtKbk0lvUOv+9ejWRNzCrMRxwL47Pw9A/trmqkCLjAzLzxn9jcGLm7YHViVjiO4Lqirpvoq5vKpGVB6aVHXPTq2d8nOqNYJHeTU8EgbEOuE65yiFXYAVipmK3kH4AqKfASFB8H7Wmjf6jZ94BCRrgGIP0vqsrG2Z8GgP/GiIBeWe7o+eDAWetsUPHMfLieQ8tR4RlL+Nn7b2hBLq38mgF43j0p8T4WgftSyiMw8sfszVDRcEnT/KPxbt1bqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0R16f034gfUp7r9CNEOYXZqUEb/zchbgWuXzGPdp80Y=;
 b=dQHvfARlaTpdAsVAmX/bCMTDPTypfkThyRyF20REjKXX/f7edH+D3g35C91gqX8hCiewhVZiA29se00u4hERGybbQW1WDExflL6M/XwEwyEr+9hmFNeMYcgyiBV+9HLpPGYi8MBinDJRQOxnGm2cjr4a6ngf6KWAR2+kcJ+RU1pIVpsFNlk0sq8h9OSAeJUri6kGOeGDwWL7/XSjL4BdsFpfVvth/jxaWlTrn7s8d0t2mrBrvzn4Ww8ICE484z67364Gv5rCE11RIKh4uo8Gz1da1BKNk40QQkfTZx38LpBW3hZDmZGKvD3e7U0uUZ9aYxh9KkookoYazbkeJYkBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R16f034gfUp7r9CNEOYXZqUEb/zchbgWuXzGPdp80Y=;
 b=AujjKIX/LB2x4xyL2Evx1xVr2I2vaHJHKLc8wrtpQGyt6PbTob117KLRzA15a++qYjF2Zl9utzfiUlt2ku7tSfL82XE+3CtfO4IEOS6qUdvU3Om80GbvfXE+U5YW39vcUxQ1cv6MelpaTuNm61c3mH3qIUMc2ghkemofpI2zgH5uXZwZPUV7YI/HYR1TIUGTIb0lMHNVzd+UeuAAjPRiTtADvaFombMCAHchAxPIxVvY26VDXbNJZSNZuuDxF9rhv52eS9jZuByMvQ/ppOE9nNL/xgOz2kaNkQA81dNQPvB/NY7EldF9UsB+UGrFOzlcSNjyM2fPPLeMsCEJsG5gYQ==
Message-ID: <e928f8c4-b9b3-4f40-9cf9-f04f5ee29d68@epam.com>
Date: Thu, 18 Apr 2024 16:14:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 00/15] x86: make cpu virtualization support
 configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Tamas K Lengyel <tamas@tklengyel.com>,
        Alexandru Isaila <aisaila@bitdefender.com>,
        Petre Pircalabu <ppircalabu@bitdefender.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <20240416061845.3467822-1-Sergiy_Kibrik@epam.com>
 <9f00278c-b205-4afd-950f-857b75004c3e@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <9f00278c-b205-4afd-950f-857b75004c3e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB9934:EE_
X-MS-Office365-Filtering-Correlation-Id: 5853f38d-88aa-4fc1-289a-08dc5fa9761f
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kr77XyayasWPEsM8mhxzo7+JtTCObm3gc589C/VoLk1HJXbG/UzBVQ1o1yMhleQjmM9vAA+I7177j3dc1NPe1+yy5CjpPClfK6tvo/zW/ttV5NrYpW/HlXsMHgrQvuVI4Gt8VlOregtbMM2b7kU/0kLLZYgSTHZQkQD6LeCivnSWDQnCJc4zVI53F3qNf06tMU7g2eFZJUGJxfUekvmz6LrrsVDtAZL7kzUb5xx/fLZ1xjHFtoGrQqGb5aUwXyPYX23qXuIsS45mYGP/lyCHOFACTyj1iQ0A0CGrLSjGX6yBSl1bibVfsvgpjcTy6sZuwT2fTRHVGTqLBkyCIqqGs+TUtYSPfaXgysdfG0lhubJdDwBJCz/XazYUD5mEhyJhN/6jmi9pvr341IXDVBMcBB3SY79kB8GsEubMg2zX7c6qrMX9e9emknR9y3NZp5P4JnCr1Uzo1KnXAoK/nJUFzYATH6YUs+Z3TinGmrClrWh9jQISjA9hOeI8lciMMsKt8dJlFoV0yWJpobBjPsyAoNpF6Os1BwlSGuAQx+pjS6KLtq2j5d2NKw4VsrwG5emdmsfYLmghk9w94825p/f/xvZnJgRlpsjXmeawvq9WX5Khewf/eVsd+qIVqPVX7u4e9FzYFpcED/trhh4EYPweYftyKmKt6vMbx5iI5JGtmmE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU9XYVVPR0FpWmJocnZlbmk4L3hZS3A1NWZsdmNsR2I1K053Q25kYUhnZmYv?=
 =?utf-8?B?TU1vNU5ML2F3SUYvZEtWOEdIU1drdzNVM2c2ODNaajgvWmVqRlFEMUtNZDBZ?=
 =?utf-8?B?MmE1Y2JCeXcreUtGQjJJZTk5NVJJeGpoYVN6enhWMUEwSUFLWnFkWThWSGxj?=
 =?utf-8?B?Wnp0ZGRyS0dTTTZhMStPVTVUdzcwd2lza05Zb0pGMUFxbVBjeXZXQy9KVm03?=
 =?utf-8?B?dC9kQWYzWlpZSk9uTWZYNDVHak1hR1NyUW5KbWl0azBQZThyOVNsSG5wdWFm?=
 =?utf-8?B?d05TZUpIZmpQWjV6QVFYbEJMNkZob1JaR1lmOXVFMnZYN25OeERSN2FYVm9F?=
 =?utf-8?B?QkVOdk9ldXFQZExkdmtTa09aUUI1WE9QbC8zZEJRNUswdDFXaU1EYVdBT3dS?=
 =?utf-8?B?OXozUzB6b2FDWlNoQ0RCSVlmeVFWMVRIdUNuRXhKL2w3NFhqVGZZaDN3RGlZ?=
 =?utf-8?B?d3pjc0lBbURWOFZkSXZ1K1dHNlczYXJxWE9CVGpKZ05OK3Z6WGFJYjMwczFW?=
 =?utf-8?B?Zyt4alZHeGR1c2s2M3l3dEtqelk4cTJQUFhxN1Y0ME1NQVZQUHNraEF2SFNp?=
 =?utf-8?B?QjhBNjFzRkdqTStoUVE4cHBiSmkrWGRFQzRDa3NZYTZNbGVjL1ZueWVHZmND?=
 =?utf-8?B?MjY2cHdsV1BiUnYzMllsNlpnbmQ0KzR6TlJoS0dGYnY3NGJtTnROYkhhRWU3?=
 =?utf-8?B?YUt4endXVSsydVZYUmFjUVFrZTRYaVNyMkhzUEV3TjZjaDVVZEhtNXF2RVg3?=
 =?utf-8?B?dlZLQ20zaEVkYStHUVdzRjhoSFJXOUZGZzBVZjhjd1FGUGZoTGRvY05JVzBu?=
 =?utf-8?B?VzhFbmlsb0pmWGs4bEtweEJMU054Yy9CNWp3ZU1WbmNjQ283alFSVUtIMjZo?=
 =?utf-8?B?bGZrYVh0bVhrODZ2SmhVQlM4MUh1ZGFSMHlVOWRTQnhuUGNoNnZwTzZNVlV2?=
 =?utf-8?B?TUVjVG1qaTNqYWhYUEtEOCtNQjNyMVR5QjhiQTEveWxQUmxweTMrZ3VlKzkw?=
 =?utf-8?B?L3lGckpxTEZBazhpZnYvbDFKczFtcW1vRndBU0hmVXNUaWx0RXRKakNJenM3?=
 =?utf-8?B?MFE1UGxBaFBCZlRBOWVTNHF3VG1nNEttcUx2d1UxT0xJcm9FeTFRUFhpay9N?=
 =?utf-8?B?S3N5SE1OdmNqb090ZHFRMk1DQTBMazVsM1BTTFAwYWt6dGgxOVEzaC9Kc2tO?=
 =?utf-8?B?NzdzZzVmN0dtdFpJRUZmQjNOT29YVjNkVG93WStsbkc5eUJocEhYNDdCcnZO?=
 =?utf-8?B?RkVDYzlQQWhBRjA4NnpSNzBwb2JON21zMm9CdlRzZy95REdYY3dIdzBzUUYr?=
 =?utf-8?B?UUF4Ry9GdVo5ZU84NW9icEdCcGZmNnFDNWQ0Smg2bTVyNUdCdUNIbnNGWStn?=
 =?utf-8?B?MkpaQmdqaDhkbEg3cmpJYlVWWmo1QmVqRkxOODhOT0NjY2xTU20yU044MnZB?=
 =?utf-8?B?VUJFV3lJUDZsZG5KWHdzVlVWMmFsQUc3Z0EyT1BmZURtbmQ2RUtNZFdsZERm?=
 =?utf-8?B?VUMrL1Bma0lEYzE3aFRRZU9pa0FzOFplNWJ4SEhZREoyZnd3d2lTU0RQWmQy?=
 =?utf-8?B?Q1B0OUx1VzlvWUlzOHlaOWdOQkJ5ZURuT3laYjhOQ0hreVlNMGJuVmFlTHlZ?=
 =?utf-8?B?YjJtQ0RwcFFaVGMwTHJrMi9obDdjTnJvZnQxS3k3amRCaE9jWkpxY09FUlZL?=
 =?utf-8?B?RmJMVkZsZWtnL0tVTGV1VmY0VEhCczNTdzZ6Qk9XR3BxZlhRcjhOdk5hbEYx?=
 =?utf-8?B?N1M2RHZBMjE3WW1WM3JJa2JlQ2JoQm9aa0FOV01leW95dUdjVTR6REpCdGt6?=
 =?utf-8?B?MzMzZ0NCT1NpaXN2NDM1SE1WR0tiNWZjVWREcWdCNGFMakVWSldoSlpQcGp1?=
 =?utf-8?B?RDFBOWRwVTI2NUN1SGRwZjNFR1puWUZVSDhqc0hMM0xBV3pJclZEWnZqT2VM?=
 =?utf-8?B?VXJUTnJpTGhnOVNSbjBXR3M0Wjc5cll4ZVlOS1k5UEo0Z2hjZlNpYkpoQUJD?=
 =?utf-8?B?NFI2LzlnN2hMVHZONGNjTTJFOGlVdFhmY1lVT055WFpDZ1FIUEEvTjVPQ1Mz?=
 =?utf-8?B?aEFYd2I4ejdRR2hCN2M1YzY3TXlRbGNnQ002Z0Z3WlRpL09uLzlCd2J2eXdN?=
 =?utf-8?B?b2JlOWdkNHViZDNnMWx5b2FDVERVb0ZweDlhNHVQMjdvcXdFRFI1dUppcnBP?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5853f38d-88aa-4fc1-289a-08dc5fa9761f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 13:14:21.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlpAH/n0GDTHNn1cF37E1/byABG7bv3MsNHb0bRwEx+gZnhwbYpbQ1bJa3leoI9qq/IHF87C71xaBxvj8vwV1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9934
X-Proofpoint-ORIG-GUID: 5ugDJxzTePmxP7hNbkogpwuX8Nz4bUzL
X-Proofpoint-GUID: 5ugDJxzTePmxP7hNbkogpwuX8Nz4bUzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_11,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=804
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180094

17.04.24 17:46, Jan Beulich:
> Going forward, can you please make sure you send patch series as threads
> (i.e. individual patches with Reply-to: referencing the cover letter)?

oh, yes.. sorry about that, I myself noticed a broken threading only 
after git send-email started firing..

   -Sergiy

