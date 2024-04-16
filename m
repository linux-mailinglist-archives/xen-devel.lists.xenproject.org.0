Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1B8A67EA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 12:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706853.1104273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwfoH-0004Ei-UG; Tue, 16 Apr 2024 10:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706853.1104273; Tue, 16 Apr 2024 10:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwfoH-0004CR-QX; Tue, 16 Apr 2024 10:13:05 +0000
Received: by outflank-mailman (input) for mailman id 706853;
 Tue, 16 Apr 2024 10:13:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BC7b=LV=epam.com=prvs=0836b5ee6a=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rwfoG-0004CL-FE
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 10:13:04 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e5842d-fbd9-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 12:13:02 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43G5qcda026305; Tue, 16 Apr 2024 10:12:52 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xhkjpgqaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 10:12:52 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PAXPR03MB8273.eurprd03.prod.outlook.com (2603:10a6:102:23c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 10:12:49 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 10:12:49 +0000
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
X-Inumbo-ID: e7e5842d-fbd9-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeddmgGkD6RRokAb4fIjyWrDCe2SMR6dAZNkgvZBWXaMERVHxHHiQIqO6msfgUrJahtIWeNaZVVJGAFPdglHnQYtUZID/Jww2kLTB9U4zVH/o6X+2uDzg2NBnf0dz8a1w8iZshOjrgbMdu1ToCJGbLu9RQJ2bu+F15pKhUHFu1vLAvYI+aUL+E5GrU6hqPmEPW0LJavoStA6QI8rONFU0ImjevIQms3k4c3rVxbhRloGVssNiRChuFOgVPqKSsd2BfcPsj+P/ZM5gTp9lRyzf9GMpOqiu5ql3P0CDnv6/ALBL5YIS66aF14egUjlqZUNqmXjQ36fGa38FvOvnOL7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4rks9lKeC3LZFoIvdM+vuOnJIJ39cIHHx9+idzsks8=;
 b=VsfxlIMmbLP01WNbWh+DhLVvso6Q4XCKprnvQJCstx2J2o+lT0Yirjxv4xoJk8ZPW3RHSsLLtrjny0GLMpprAgoolis4ip526soKxrIFQ8uhrInYrxRzjyYFeCygT7ddsSFFieZd2tBsH2k8gs3eIW88mK8y6UPJAV/OzAJPGXdBBLuxhN+w3EFwgAn+Urc1jgsAnltlOHP68hoblvHDyRtlErw+hRyVrBKDj1Q5vxdQk8PDCy0ewlWbgp0is8cW6s711wX/3bO8Z/0FOaepr8kjUcw0eFGRo7weTpI9Jgysc1Qr4pMh06rxlUGTJY6GArR2d+HnAnw6uq6/PTRKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4rks9lKeC3LZFoIvdM+vuOnJIJ39cIHHx9+idzsks8=;
 b=pBnMV8hAE8GwSPAcJUWNcFbVO2nICzG4x6vIDucapekKwWmpqsE+p+NrT/i+gssH8uZYw1BCI8nOvISNP8v7phX68lYkFVnEbzphNZLB0KB705n2MrriVcXByL0MpbhjSir5fXSOVM+qmq3ltvTBxg8b2dS+kH3+/bE3LpEOQDgUP692XjSgY8kb1HNASg81TScZ9OD5zxg/95JlbbKr1JN0UdbpJSXLeOaif2ICRiL5QBM5t940OJXhwmwoRQlBMTjQ1KUEC9JawBpEn1AlssDVNaldjIhtKCMvwBu3oh04pAhSdtC0s7bu1dGy8Z4kM2wzFeNwuom6yLQKGz9iDg==
Message-ID: <e3f24e03-4e3d-4106-9887-12cd4aa6eff8@epam.com>
Date: Tue, 16 Apr 2024 13:12:46 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 15/15] x86/hvm: make AMD-V and Intel VT-x support
 configurable
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>, Jan Beulich
 <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <20240416065012.3470263-1-Sergiy_Kibrik@epam.com>
 <2a6779ba-e3d7-4f53-8a0c-404f139ba254@vates.tech>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <2a6779ba-e3d7-4f53-8a0c-404f139ba254@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PAXPR03MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 1576c8d3-0090-4e33-9735-08dc5dfdc4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mKC7mYAiTwHfqjNCXlfziRnnKJzDZkLaykNwwJhqT70LnIN0atbvtWh2EMOZRuwbDMjVlfvGxOmAZ3AGbLeE1eLrpwz32daBE3/fpzgDtOotwvq7YR2NtMkkwBQX2MAdpvllSYrRsYBl/Nbt7DOGloJb6hpJRuCriVoVZC3ryF92d+TIlrneiZYNMJPhZZvk37bFidLrCf3jO2+0avQDJosdG7snnWwUUdXGU3kSvarEKLBI+YbSCi8w8WbmpyNJT7cugZOc250Wb26vBGmIsM3PBsLZhXrru+aIZEGLQrXB0nsEHqrjn/yyEN8CBz4RrO8z2LNDmNpByyBEX3+yl19s0w8Zv/cjXPeNrIhJnwibykyupu3XWL+8tTVMb5t2BxdE+QL24WtcpK1M9DnTy7k4jrh43k/s6WHtYeDYZJS/7iiEK/Ou8cj3ptIiHaorgyQBmFj+iOvaMwg0wOEGutOK37F56Wal/ka3sXz0kbp0JeHBuBanV1n2IvmNMxceY6wXSiPUj+wlenk+xNUg+UCpxhQrYXVwdVCcm+grMO5IBRadePol2WqO117aKjyJ6R3fLCJF5ph9sMYGeOgg/kai4rJHOdoscZ0FW6DkOMBEaKniR70BzQcWW3M4l6AqE1LSm/lEsmUDWUuf4CrpuxrJhqBLMskPpuzS3ghqvVc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MU4vV3JUNzI4RlFyYXpzQkIxd1Q2SDQ1TGh1MUJqSHNySUc0dmw5Ly9XajlE?=
 =?utf-8?B?Q1BiNVZzMC9qRGtQRDhDbzhBTXJ3d3NoKzl2Um9VdHVKc2hZQVp0OXlSd0xO?=
 =?utf-8?B?OWZuS0w5eDRYUDBScTFaRjdBa091bkt5N01RMEhiSkVqL0RxZzdtL3dOaERV?=
 =?utf-8?B?LzBxM21qbVBMNHNIN0JYa0lrQ3NUa1JKMUFWdDE2ZFdzaEloVGJScnN6N2lz?=
 =?utf-8?B?cXV6NkUrTys1Z21wYU9jMnJabFpIMUhrQWJ0K3NVOE9iNWFTS1FJOSs4S2Vu?=
 =?utf-8?B?MDZrVWdVNVRCdFk5aXVQcFNWQkgrbU1JcktIamlmK29GeUdQT1RZdG9qMk8v?=
 =?utf-8?B?V0NQYUpWWnZFa1pEN1pzdUVMdW9qdThsbmEveXdSMFViYU1iL3ZZNWMwcCtu?=
 =?utf-8?B?QXI1a3J2bkJDSHFmUkFxbVRPRytxRElSMzVXbS9sTnZGN3FBQytrOWNiOEZI?=
 =?utf-8?B?K3p6UzR3L1ZxQzM1aExvT09LUWd3aTJ2YXpab2E5T3VVZ1cwTHNZTEFMejZu?=
 =?utf-8?B?citZZlBtZXBNT1hrRlpISjQrOG1yVzRtditxMU1iK3NjYzVoZXE4Y0tBY2Q1?=
 =?utf-8?B?RHVYZnJ1dStYTjI2azFkWFcwamViVVliM1V6VWx0K1I3Rkh6cnVwaURhSERP?=
 =?utf-8?B?MFY4Y2NjRGFNV0RpWjJHU20rWmdHVk4vM3BXZVF3TWxESE9WZnVXQjVuVDMy?=
 =?utf-8?B?L0RaQXF4QnpqU0taalB4RjRKL1hnSVd0NTJIdll0T09wRDlkTFNlNnEyeUxh?=
 =?utf-8?B?VnZnTEptVlNLRklLL0lkRktxQlhSTGtYa2ozazM2T3pMTUNGWjBJYUZWaGRn?=
 =?utf-8?B?S1ZKTDdkZHRCekRiNmxjdUJtNmJNa3huUEZWRGw0d2ZyeU5qYUtBdlcvQUtU?=
 =?utf-8?B?Um84RDFUR1lFbkJLdkFKNWtqVzNrdndJTk0wN0R6alJhRERkaUg0bHNYZzNC?=
 =?utf-8?B?M2xFUFpxR2RySjNLekdETEtENWFTRHppZmJRMWtUOHlhdEJMUG92aVIrTjRz?=
 =?utf-8?B?WS9ML2NxN1hvU0pGQjFSR2Jwclpnd3d5Qm14eDcrMWZEbWtQbFhKSW00S0l6?=
 =?utf-8?B?cnFzY2FXSHB5ajg0QWNiVUpJSzAwSmFNRzE5VnZvbHQ0bFpiVXAxSWRqRzV3?=
 =?utf-8?B?dWRaODdVd0FnZlpLVnVYU3k5eUFkbFhYeWJSeWludTBxemwyd2lhbUR1T3N1?=
 =?utf-8?B?M1ZEaVhhcE41ME01eVloTjNBYkt3MHRybnIwQlArTG9yMzVjY0RJVlY0dXRn?=
 =?utf-8?B?bSt0aGk4T2dVRDVaZVVSd0FDU21ZWjhyNGRtRGQ2WGJzdktzSWxpUHdZV2FD?=
 =?utf-8?B?aG5KUWs0MTlWUGs5L1d3NThwM3czNFgwM2JnTXJZaVU2bTRONGM5ZTFibUFy?=
 =?utf-8?B?WHk4c203dDQ5SVFFdzRvOGs3QkNKZ0FNY3BScmdTREhUVENMME54Yk5HZ2Y0?=
 =?utf-8?B?enBwL3R5Mnd0SjdBbEdmaFdTOTJ6TUt5bk9BRmxHMUptQmF5a1cvTjBmQ0ZR?=
 =?utf-8?B?WmRpNDM4MUVEM1BHQmxDems4b2xhNTdRWmQ5MjBkSGZDemp3ZzdlMlVaMGlj?=
 =?utf-8?B?NnJnQ2JyZE41aGswcjNxSjBFcCtYZUgxUEhyYmlLRG9NTmZLRGszNE1Ka21E?=
 =?utf-8?B?QWoyUTFIRzF0WXNmRzFESjdJalJ0Qis5UTZYU3BVL0pUMEFSSmszQkZaUlkr?=
 =?utf-8?B?dWJxUGZUUmtGVDNTbndlVG02eTJVcG5mTFdybjNRM0FwVVNWd3JZcGtzRlVa?=
 =?utf-8?B?am8xaEhyWVI4Z2tRbCtvbGp1SXdPUVlsaUxiM0krcnhmUDJDb0FLbGxNV0dn?=
 =?utf-8?B?V2daV292aGdZaStUR1BkZm9VUTVSZmoraTVoRy9vaTlGVkd1eVlxcFVwaUsx?=
 =?utf-8?B?aHcrd2F2bG82Y21QRHR1T0dMaWtNcUsyMDlmRVZXOVdYVDhaV0VCWHNWdktE?=
 =?utf-8?B?U3JpV3l4YytnWlplbEdTKzlRVU5Xa2tRSUROUFkrbEVrM1M2aldKRVJTNkda?=
 =?utf-8?B?NDhZZEFHblFxTERTaDliSjNpUTJ0WDl6V1Z5YkZmUTR5V1pUNWlqYkpXdzNr?=
 =?utf-8?B?cUFUN09YZktYOUxhdHduTEtpUWtiUWdSS3hmOWtkWnc2Wm1kRWhDMk1GQXFn?=
 =?utf-8?B?S0tzL3V3ZFRQelB4VEpDV1N1eXY1ZjNSaGZBNDFqNWM0SHZYdWNoS0RvMGhk?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1576c8d3-0090-4e33-9735-08dc5dfdc4ab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 10:12:49.0060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KHEh0OxVt++P+PiFPUrc3w7O/ItcIkKqZxlyxeSHpl1TUoMFHqZaMwRLv2T6RnaAUStwH3c0g5+/5FKgtCplQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8273
X-Proofpoint-ORIG-GUID: QFZfhF5qgIsW4G2yYqR7RV7_7mYBLnXj
X-Proofpoint-GUID: QFZfhF5qgIsW4G2yYqR7RV7_7mYBLnXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_07,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=942 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160062

hi Teddy,

16.04.24 11:40, Teddy Astie:
> Hello Sergiy,
> 
>> Also make INTEL_IOMMU/AMD_IOMMU options dependant on VMX/SVM options.
> 
> The discussion in the RFC series stated the IOMMU may be used with PV
> guests, and doesn't rely on VMX/SVM support (in fact, it can be used
> without HVM support in Xen).
> 
> However, in the discussion, posted interrupts were supposed to be
> dependent on VMX/SVM instead. I suppose this is a leftover from the
> original RFC ?
> 

oh, yes, this bit remained from original patch, and indeed shouldn't be 
here.
I shall drop it in v2.

  -Sergiy

