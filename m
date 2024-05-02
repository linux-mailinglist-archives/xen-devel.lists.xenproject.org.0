Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3558B9700
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 10:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715672.1117472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SHf-00041J-L7; Thu, 02 May 2024 08:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715672.1117472; Thu, 02 May 2024 08:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SHf-0003yK-I1; Thu, 02 May 2024 08:59:19 +0000
Received: by outflank-mailman (input) for mailman id 715672;
 Thu, 02 May 2024 08:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=216C=MF=epam.com=prvs=1852dd919c=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s2SHe-0003yE-VI
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 08:59:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40f66568-0862-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 10:59:16 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4427u0dL022407;
 Thu, 2 May 2024 08:59:12 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xuh9fbg3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 May 2024 08:59:11 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU0PR03MB9731.eurprd03.prod.outlook.com (2603:10a6:10:44d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 08:59:06 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 08:59:06 +0000
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
X-Inumbo-ID: 40f66568-0862-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YatD3XBSyoaUgMlh0vQoPJqumriNyB3sk2jskvyjVM2SkVvLvafkkXy4lBBtsitftx6+9HgrH0DZTFZl/n+6p2m4x+hHbfPmtyr6aibgzL+Kia1N9ECfFwI9pI9271xs/Si9Q5GvL6ad5iucsVf6Kn6K1tiYnUamVCGcl2bAbzgzO0zldHJigUymC/iav4OrJ5MPrklUGle+3JgTgltqXAJRhXULgqsXMDWzk4BkXwnT5t24FC9B81PE8xiWAyY0FYUh5lE3FsOHp9pacaTIEQ8pB6Ohy9BRbf7tgT0ZbOvrqCOJptCBBGH9mWqtU4Ch05BHCcikzHGWGiL8MX6MGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvcjSf2ot5E0HjkHo7YQYp8x3QeT0rou/3zsPr4sqDo=;
 b=mNAm3Gh5JrhDvDj5NW/tnSuPvbbflXR7JJiDGrKXvoJn7cJe+S+71/7js5VYXmnGOsbqMJepy2lum3l2GS0sBP4nb3GcqlAewr4RY8kR+11gAb1JjWBYrb5j+DANysKkb54HUHvXDS3G+irY6cn8LcpTB/vGbarW8pa8C9z1gmPXevJYhjth03mgst7aOFhjdkbOoq0q1NVUamtReQiHNKC3um/pptQnCNdm826C1H8EQOdu3NTIdirFrHaqaOC5KGQ3Oynacv0v65k2HfpQn73cGCwo6gWEMu4OhpZyXyY8vMO9QIgbqP4VrwhHSWy96gl8Bw6WGzO3Zc1vrKBFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvcjSf2ot5E0HjkHo7YQYp8x3QeT0rou/3zsPr4sqDo=;
 b=Zpio9p/n7MvRi9tzA1DJSzeiGUkxvNox78pLTGnqFjgRF1lf2yQ1fDrb1sc9ftiBS/yku0qy3tq06W6FJ3+F01o1ext5JCS+PvS+MAwwcOlNUNBjoVbAZEB2LLnQZ2KOEBKEQ/zGMpsMhhdyhjesVi3bj9bTnPvdPOkTh6co2GbH9/3FxSGOQ4GZ4fGdyutVyuFvM5RfvaYnOzj4jQDBvXp3afp6GDz1YhlOEG3KdpHXPyr4C641AM8zPC3TXmyy0sWc8liauwjjpp6zjpukHV9G0sSevg/sKaQa/jZepFAUk8qrBfcD8AJsGGqNdIhZ14ldvcU0rgrJH5TLqthILw==
Message-ID: <256d9aee-5790-4a86-b50e-80429a117724@epam.com>
Date: Thu, 2 May 2024 11:59:05 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 7/7] x86/MCE: optional build of AMD/Intel MCE code
To: Jan Beulich <jbeulich@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <82df6ef350a2b4f42ec7adf12a90ebeae1d133f6.1713860310.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2404261615250.3940@ubuntu-linux-20-04-desktop>
 <a0cde29c-2b30-4b6b-a6de-135b10d7f165@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <a0cde29c-2b30-4b6b-a6de-135b10d7f165@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU0PR03MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f090e63-246a-4dc3-338f-08dc6a861f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXRKRHlYaGQ0eVg5M1JsRkpRWExHV2NBNTRxOFpxdDhlbUVMSnNSZUZ3TmF5?=
 =?utf-8?B?eTlZZzdDamtmbExMWTdlNCtnSDNDNFdoZnNiRFllckxFOTgvREt4NkNHZVVM?=
 =?utf-8?B?eFplalhId2hMNkJ6Q2tKaEx4M0U3MTBUamNLVVdzdTdwSTlrTkhkNGZyTnFy?=
 =?utf-8?B?dGNHS1hpZWJUWFF3UFo4VGF6ZExwbmRjQ21XZnBOVitiTm9tZnU1VDRqRUJl?=
 =?utf-8?B?eHdjVU13NHNjcngwV2d0TWZpandkOEc4eEN1Qm43aXpqTWQxVU5DRVpkcEdB?=
 =?utf-8?B?bmFkVTRwYjZJYXh2clBIMkhuRS9Xa3g5K2V2cGYwWTQzZXVoNCtoQldSNFds?=
 =?utf-8?B?SWVsT2t5cCtlMHdBbnZPOGFCR0VrYnZoM2dwVE93ck5Kb2djcVpkWUIwRGMz?=
 =?utf-8?B?RHJhaysvaVYzeXpWeXFYSDZjOS92Vk8rcW9aQ1grbTVzZkhabVovTWs4NHhU?=
 =?utf-8?B?bG0vdHNmakhyZlh0ekNDOUxiYndMb0g5T0oxUzRSNHNaM1B0VURmSTRwNjdX?=
 =?utf-8?B?bndseHZ3bnU2ZFhQSmdnV3ZRQVlybm1lZkRYVm1tU085VGpBYXltVkxESHBa?=
 =?utf-8?B?b25ZNjhBRmN6MzFCVTExNXlBSXRSM0E2R2VJUjFPRitVRGNoYmRicXU2aUdw?=
 =?utf-8?B?Um0wQUxVRU9BejRWY3I5dGt1NTV2TUNKdndoeUNiM0Z4Q0hmSUcrVWVsc0Iz?=
 =?utf-8?B?K0tjc0hpZGNaN05MbFErTW5zbTM5MzZzcW1USnYzM29kQWRsQ2ZRSURNYmVR?=
 =?utf-8?B?T21FRWErY29sWHg2cmRqVmJVZC8xMkc3THFSaFdabzdYdHo0cVpoOWhiSkdr?=
 =?utf-8?B?djNwZElkWisyZVpmVWNnTkVndDJPWXRJOVd1dDB2ZWpmN0pmQlVURnpmbjU1?=
 =?utf-8?B?RU1jb2I1T3Q3QVZnZHM0bFZLbW95RWRTTjRFYy9pcXBFUnNJckJVdGpZR0Z5?=
 =?utf-8?B?Z0dFMitwc1ozM0l0eDRnUXFQTkR1RlhkbUNsU2srNHhIUmQzZDB2WlRzWFh4?=
 =?utf-8?B?N3R4QmVoKzBwOEN5bkdnaE91RHU0OWhBa3ZUaFRmdkFyeFF1R0dxOWRLb085?=
 =?utf-8?B?K2xneXZreXpseGVBbVd2SG9FOTZUcWF0NFIxc1QwdFNvN3oyN3o0QXU0UEg0?=
 =?utf-8?B?cG1JV2k2ZWx3cUx6c2QyYW9ZQ25lL0hpd0YwVlo0UHBFeWZrVUNhTVU3VGZ2?=
 =?utf-8?B?bDZzK2RoeEFFWTEwS2ZsdEIyZ1YwUW1aalBaRlBFUmJ6YUJhS2hTbFNBUytj?=
 =?utf-8?B?dm8waEdMenVUblV4aStCYmZ6ZTZCbWt6d0N5eHlXZDl3WktQdUFZaGVOQktZ?=
 =?utf-8?B?OXBNcUpUeDkwWWNRNUxLZFBnNHhzc2JIMzVqejE3UlkyS0VybFBoYXQvZC9t?=
 =?utf-8?B?TVAyVjdmQU9WLytHS0RmdldOR2FWNDV2MnRyaFRIakpUdHVrMm5ZcnJaazBZ?=
 =?utf-8?B?T1grbkRUOS9aaW83anFEWWVIODJ5UG9LMmtMQUZ2SmxvS0haTkFibFNWbWtW?=
 =?utf-8?B?RzhtT2xlVHlDWTc1MDJzZlBKb2g3UVV5ZTBid25HdVhqWllqWXFUM3RIVGFD?=
 =?utf-8?B?Nis0WU1EVjBMdStkQTBLTDRHNnlSeFZWTi9uczNoenZmMEhiR2UvVUhpOXZk?=
 =?utf-8?B?THcyT2k2dVptSDBzUkdPNzJEYm5BeU16U0I1Wm9EaGhUVVBKUmJWMEtDc29Y?=
 =?utf-8?B?Yk13YXRBRVg0NVU0MWRqNmlmQ2FPMk1HVHlhMXdMR1lTcVlnb3hsNUdnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUlIUThLQThHbEU2SVRpaXpZOE1BVG1vTHJDTGVaVDZoaFF0QS90S2htL1Bi?=
 =?utf-8?B?UmdoMUZVSG82VHJqcllpUjl0OTZZMnFYRzFWazQvMlU0RjRmNHRhMXRQemFU?=
 =?utf-8?B?ZENJTlJ5ZGpybDIvQjl2S0VGUEJpTm0rQmpTYjEyUWVuVnd3TEV4RmNEUDBn?=
 =?utf-8?B?VVBqeExxaGNmd2IzSFB2V3JLZ241RDlaeWV6Slc1cFRZalBwRlp1S3VjT2Ix?=
 =?utf-8?B?SzgvWEJJTTBNbkdMRWlPRGdUdHlRd2kzNS9iV3M4cFRiKzArYnhyOHVBYVFP?=
 =?utf-8?B?MnhwU3gwbkdtRFo0M3JmeXlKSWY2OWtUQlhjVjJGZHdzTWg5K29oR1pJbVRv?=
 =?utf-8?B?QmJSVEJXYmNidGNrMmJHUmp0WjcxbGI3YjVVK24xWDRwMmVZS292Z2xDQ2dH?=
 =?utf-8?B?VW52bWQwaGYvN25FNTdJZ01XcUo4K3FjMHlyc3pZU0VPRUlodkZDM2FzY3ZL?=
 =?utf-8?B?WXhGWVhuRGVvREJ2UkpXeTM2TmlCMUZVVTZaYU1VTGdBbXNOa2JhRHY0b3J5?=
 =?utf-8?B?RGJGVHNKMTNhOFpTWDdteHkzUnBSeTlVd0ZYNWEvMTdRbGYybGkrU0g5NUl1?=
 =?utf-8?B?ZHpMV2NBYitiem01RVhOdDBNbEVqcGd4YVZlSnkwWVZUTzBicHlwMDFTeEJI?=
 =?utf-8?B?YWtqN2xOZGFSS1pWNW9ZcHAvRGVxdWprcWZ5S1h5L2wxU3Jkc3ZFZThxUFdm?=
 =?utf-8?B?N1J2TnJKTjR2bFJveXRYbWpxemYxUGk0aGtVNDc3Zk9wM2c4VXJZSTBjRzNF?=
 =?utf-8?B?RjBLUE93a3J5R0tEZUVrYnZwYy9SeFlzSlJ2RjdNTmJEYTNiY2hWcHdQTEIz?=
 =?utf-8?B?WFVtSUl6Q0ZGYXZSaFhiVEtpUnpZWjFnNloyY1FDR05aVnR1cDRrbHh0c0RT?=
 =?utf-8?B?MDFDeUhFNUY5RUFXL3dtUGNNcEtMUjczOHpkOWNPVVhLUnlUSUxjMnZnd3Fn?=
 =?utf-8?B?aDBESkNsa2FNM25jdWFDWFFMcFpRZkc2UlROU3F4RnpjZlIzQWhzSlo0NTBV?=
 =?utf-8?B?M0FDVm1wTjhrMStUU0x1QjNmK2VBWks5NHZwTnNZQVNlbGIrMjA3VUt2bjlY?=
 =?utf-8?B?MUZIWllhMU5QdlcvTjVPUXRHdDNRSUY1QTlaOXFNbndHbzd5RTVGajRIUFdl?=
 =?utf-8?B?cFFGeXRCMEgyZkRZMGZjS2MyQW5qZUdGQTJiTE5lUHhMR00raXhpanp0eVhk?=
 =?utf-8?B?V3M0WDcyZ0ppTmREYjdhNFJUMXMrdWJlVm40c0RmSURvcThhQnFpQndadTFy?=
 =?utf-8?B?SGpLUDZNNy9tY2ovQWlWc0FsbEV2WVF2VUk1cDVHNmtXam5oZ3dwVmxEVEE4?=
 =?utf-8?B?dndsYXVKVDNiMTNSMVk0TjZxcEw5RllKeUhvWnlmeEpYSFNWOWJiVjRoUjJ2?=
 =?utf-8?B?TkZibjdrOFB3WnhsajgwbmNRd2dmcm5BYkVlQ3hWSnVCOGtuOXZ2aEMySk1C?=
 =?utf-8?B?ZGVKdkwzdXdOWC90M1JvdmR4ZkppOFI1MXYrRlFiYzB1RDZzV01GMEVFYS9s?=
 =?utf-8?B?c1V1YlRuU3g4ZzlyREJLZ2NJd3JRZUY4VE1lRkVpMk1NdVpRWlFjbm5SL21q?=
 =?utf-8?B?Q0tSaG9NQWpOUlh3Z3ZZdTFuZytEYm9HNEtheERqZmVGVlZxSEl6M1JGOFRh?=
 =?utf-8?B?UEJmb2xMZmRCaEhJUEZrTFh2YWVtV3FCbmszUVBOdmhJdGlsRExxM3ZYdVA4?=
 =?utf-8?B?bkt5Z0lRVUt1R0NaU1V3U2pXbjczMFZKZUJzN1RmYWhvVnV2VG1KNW1ibDIv?=
 =?utf-8?B?ZWU4dXkxNTJrb2lnUlZKbUdTWnJCUW1idkYzTzJNdGxFcDZrQWtpRG83Q2RT?=
 =?utf-8?B?VWU2dkt6a0FoalhZR3BFb0ZBOUZ4b3ljQnliZml0Tk5hYVJEZGV4WWlzOGtC?=
 =?utf-8?B?Z1dWdlhIZjdSVTJxb3FuS0lJRUNGWE5ERSs0T3RBSEgxLzN6YThIbWJzcnAr?=
 =?utf-8?B?U1pmWGdVR2NSQXZCMUpmeW5YOXltQTVDVi9pWkRPUEVha0syaTdHQ29pSFdy?=
 =?utf-8?B?VTN1NTJJU0d3eG1oeUp1cFJ6cUNMVmw3aURRQTNUUVIrZ0tKbGpsUlpWWXhJ?=
 =?utf-8?B?NGt4UUNHUU14b1dFT2twNzJVZFljRDgrNksyWkEvMVByZDhxNlpndEQ5N2w3?=
 =?utf-8?B?bUhnUkM0bU51d241TERKZHhrOHgrTDYxNnlib1F2bXZEYlZ4YUs5cTdYVlRy?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f090e63-246a-4dc3-338f-08dc6a861f7c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 08:59:06.7300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTSFKdtArINgJAE+95e5YByjOkm9YuzLibhpH+iDyTocOtV3mcVf5vkZp+tQYNOLSg9ADGJnACZ1WAuq3CfZ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9731
X-Proofpoint-GUID: inOkiGseoYVfHLKKXR_8xyjg9p45Ly_f
X-Proofpoint-ORIG-GUID: inOkiGseoYVfHLKKXR_8xyjg9p45Ly_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-05-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405020054

29.04.24 18:54, Jan Beulich:
> On 27.04.2024 01:16, Stefano Stabellini wrote:
>> On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/cpu/mcheck/Makefile
>>> +++ b/xen/arch/x86/cpu/mcheck/Makefile
>>> @@ -1,12 +1,10 @@
>>> -obj-y += amd_nonfatal.o
>>> -obj-y += mce_amd.o
>>>   obj-y += mcaction.o
>>>   obj-y += barrier.o
>>> -obj-y += intel-nonfatal.o
>>>   obj-y += mctelem.o
>>>   obj-y += mce.o
>>>   obj-y += mce-apei.o
>>> -obj-y += mce_intel.o
>>> +obj-$(CONFIG_AMD) += mce_amd.o amd_nonfatal.o
>>> +obj-$(CONFIG_INTEL) += mce_intel.o intel-nonfatal.o
>>>   obj-y += non-fatal.o
>>>   obj-y += util.o
>>>   obj-y += vmce.o
>>
>> Awesome!
> 
> Almost. I'd appreciate if the ordering of files would be retained. It's
> not quite alphabetic, but still. Moving mce_amd.o and mcaction.o to their
> designated slots may or may not be done right here.

sure, I'll leave ordering as before

> 
>>> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
>>> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
>>> @@ -24,14 +24,20 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>>>   	 * Check for non-fatal errors every MCE_RATE s
>>>   	 */
>>>   	switch (c->x86_vendor) {
>>> +#ifdef CONFIG_AMD
>>>   	case X86_VENDOR_AMD:
>>>   	case X86_VENDOR_HYGON:
>>>   		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>>>   		amd_nonfatal_mcheck_init(c);
>>>   		break;
>>> +#endif
>>> +#ifdef CONFIG_INTEL
>>>   	case X86_VENDOR_INTEL:
>>>   		intel_nonfatal_mcheck_init(c);
>>>   		break;
>>> +#endif
>>> +	default:
>>> +		return -ENODEV;
> 
> This, while perhaps desirable, doesn't fit ...
> 
>>>   	}
>>>   	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>>>   	return 0;
> 
> ... earlier behavior, and hence is somewhat unexpected in a change which, by
> its description, looks like a "no functional change" one.
> 

I see, will try to describe it a bit better then.

   -Sergiy

