Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4AB8FFFC3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 11:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736466.1142551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFW5w-0007RW-Id; Fri, 07 Jun 2024 09:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736466.1142551; Fri, 07 Jun 2024 09:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFW5w-0007OM-Fp; Fri, 07 Jun 2024 09:41:12 +0000
Received: by outflank-mailman (input) for mailman id 736466;
 Fri, 07 Jun 2024 09:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERR9=NJ=epam.com=prvs=288857fa54=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sFW5u-0007OG-7q
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 09:41:10 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f006694-24b2-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 11:41:05 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4579KJqL031755;
 Fri, 7 Jun 2024 09:41:00 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ykyfwg2pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 09:41:00 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS4PR03MB8254.eurprd03.prod.outlook.com (2603:10a6:20b:4fd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Fri, 7 Jun
 2024 09:40:57 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Fri, 7 Jun 2024
 09:40:57 +0000
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
X-Inumbo-ID: 0f006694-24b2-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GljUWAsv1HfUzkBS50fkBCH/b3CL2GWuR7Hv9bJHDveXLV/4qwOr7Doai2WRjfMav3pyHNet0udNCjwA2zpN5RjuKV7mH0cXSKlFjPIAXTo+jAo1HfxcD0MIi3lXP6GBPcVQ5as9hzPO6jXLm+NbFhI1TH8+svVDR9BICvANbOn8vTl80EX4YRE8+EWKkXo7e5HLFLZUaw8/tHgM89HqWmNInlQ1kpYsBu8BxE0Yu0ye2C4GX9bgc1VCtSc4i1GfmpVvIKcWfknMKM19a91f4/WJ5prBbRQF2DemiCZyiW0o34jybsedTT/4XNqeXhwbhPXWcxelv31CYzpuaEVSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQSWMvFthlOnIXd7KFncBqnKIJ2wikQTFBXuPSArA1Q=;
 b=gyO9AFr1KwLsCvqghWsmc0eIbPmLoiotR9w9pUOk7wsaGgCzC8sRZLnp1EG52nRMElrd0hGZRGPuDOx5Cit6hr5VMVLRUq/CAGF4LxyRPwY4UljbMVO00jlPtUy+GXGPT4of7J3J3xck0y0414fd954PQP2kGvhXWhjP0LMSE/ypCsU5Jb+c/1d/TEw0Utg7QiCzngI7dexkrVNiTrPKXXWwnmm+LroqcTAR2fLMmPv6pcF+BnuwaEiSKEURzWtHT37Gv3wYId4icN1mkMMeSROagutRunfQ2ljAtnBmt5g2boL2cqdjJV7rNqrCJ0YtFz1UuuvrKtyKwTjbRa9Xzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQSWMvFthlOnIXd7KFncBqnKIJ2wikQTFBXuPSArA1Q=;
 b=usEEqxArfBhUbF3Xv68xmPoRmIwLu96n1JIF8uV36rppdfivospTIdFit59ndS9itxdRRn4V4MrVFOeh2uDBwWqMKnWBYOmqq7U0yzz7Mk/kyHLowSk7RpmOw4Z93AihTJW+IKLVU6xs3eMYle9QDMgaauxwVZzLkD82ikNR1LWR+6jRxI4YyqVwqqgmB6ss3URhhD0iD8w1SWFz9GNUvhubSDP89GD0Ua0OJqo0A32qPPiTZT8ty5kRxXXpdYy7B2Zmr+IpPcHlUnSsagzs3U5qlwYgBlAwt65zdkWS6+xAnCorWBUWUKzvl69GGCn1K9rambprQZ9x7g8GYw1dtw==
Message-ID: <971ed412-c016-4e95-b691-2e6795637c61@epam.com>
Date: Fri, 7 Jun 2024 12:40:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 02/16] x86/altp2m: check if altp2m active when
 giving away p2midx
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <9306d31184b8e714c3a10ccc6a2b2c6a80777ddb.1717410850.git.Sergiy_Kibrik@epam.com>
 <7493c91c-070b-4828-a7f9-15d618d49ce5@suse.com>
 <c72ef6c8-6e5a-4533-a049-7636f6387e4b@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <c72ef6c8-6e5a-4533-a049-7636f6387e4b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS4PR03MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 830b2d32-6cd8-4de2-adb0-08dc86d5eeb9
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2RFZ3VCQkVrOHV6T21nODR4KzdrNmtLZmlmWjBEU0tYMWJrdmxtRXpLcUd3?=
 =?utf-8?B?bWl4QkIyS3F6MmFIWmJ1Mit4NkJCK285b05IOXoyWEU3Z090T1pBNzFaSDN6?=
 =?utf-8?B?YmZQUzdIZHQvL09JL0RLZ21HaFM5ZGlsMlFad2I4eTJRN21jM2VPNGdjQzJU?=
 =?utf-8?B?aDFadkNQSzc0Q0dpck5DYmNsaEl6T3pDMkFJZjRNS3VQZ2g3S095Q0duWHly?=
 =?utf-8?B?Yi9EUTZZS1pnSGZaSkVBUEEyMnlhWnZxVGU4RDZyRVVCNng4eWQ2dzIvU2V1?=
 =?utf-8?B?d0tXR0NiQnVWOW9CSTY3UUlJMFB3YXo5T0h5eGVOa0ZSMTZLNXdFaUV2aS9Z?=
 =?utf-8?B?ZzdOTmtoU2lzN2NpbzdiSnlsM3U5Nm1IYndKMTJYTzNrRk4yazczd2x1Y1FO?=
 =?utf-8?B?VDBlZXUzUWFBL3ZMWW5jYnZ0dzVoUWpSdzBTQU5iMjRyNkNzZXQ0Um9HMG5w?=
 =?utf-8?B?czdGSkhYWnBmdUZ1ME9DWFBpeHE0VXpkblNlZTM3UUNCSjlLUzJvb05xQU5o?=
 =?utf-8?B?dHh3bUZ2R2R6dHdCdTgxc3VXWmdXaENJQzZvMmIyMGFtTEp0UDFNS25jdloy?=
 =?utf-8?B?ZUNHbWlRQitYN3NPTEtkVjBvdlpvM1pKQ2FjQlU2SHR0YmMrcGpyYVBDODVO?=
 =?utf-8?B?ZzJ3bk9oajFoSW54dFAwWitBcStIUXI0ZksyNmcweFZlanp0VW02d24yOFpN?=
 =?utf-8?B?SjMrYkVxNkYvVVhhN3dLeTZFUldJNVIycnhlRG5BVTV0WE1QZ2xPNEtZUmpF?=
 =?utf-8?B?dEd3aUVOUDBWZktXZWlMNlhDU3VtQ2E5L3laNlJMZWNYV3B2aU9neVA4NnRq?=
 =?utf-8?B?b2xySHhTeGEzMW0xSUh3YUdqVk5XakFGVkY0eHNKQWdrNDV3N1pZMXZPSnNJ?=
 =?utf-8?B?Zy8rTnFvYXh4ZGdNNnFjdHorYUwwTmcrSU9FMXRBUWhMQmNPQ1ErVmpvM1Ba?=
 =?utf-8?B?UVprc2drQmw5ZElwMDVUbXdtWkFheWVvSVhKTGhYQ0JsZ3NsNVhRUFRURjl0?=
 =?utf-8?B?UjhBWmVaakhTa0dWYnN1V1ZSbEJkd3U3Y1AzcWVZcCtlMko3bTJKQmhTbzZp?=
 =?utf-8?B?SXIwSTNvWWVsb0F2OXBIRHNtN3IzSUR6OFcrN0kzVklRVVJCWDE0Y21aU0ZE?=
 =?utf-8?B?MEJQcTJnekQ4RzJDQndMd1BpV1RZREIrTS9uVXF6NUdtRXNJMGtkRkdLWTA5?=
 =?utf-8?B?NXoxTnY0Yk9xdDBaYld2aDN2bnRpeUlHMjZXQmdUM2k4Q1cwSWx1WFBpYU5X?=
 =?utf-8?B?ODVpd3dHVlZpWTFHaXR1ZjFmblVCQU5uNlRldEtjT1RHL05JWkV3Y0pDWUln?=
 =?utf-8?B?L1kxYjBqRW04alp0Tkp2bjJjV09xbVJHeUJsQzdrUUlPUUNzM3p0Y2lLMGYx?=
 =?utf-8?B?ZERNczh0NkMvT1RsUmFMTDZKeitkbXdlellJdG1qZDVnNVdLYWNKcWxFa2pm?=
 =?utf-8?B?Z0RDZHNZckdTSXFjVnNBR0tYclZ0RnQvSUUzMUN1SjZGd05MVzFobTNPd0pV?=
 =?utf-8?B?aFcxNEFVQXJObnpKZ016ZWJVS0REYk8xR0owL3U5YlRWQ0x2dmxWbzhYRjRw?=
 =?utf-8?B?SkdveURNd1Uyazg4NzY1TEppWHgwanJXMFJlbEFZWWdVL3VlUHV2Y0lZZy9Z?=
 =?utf-8?B?TzBnOHI5OFl4OEEwQzk4VEZLSWpQa0YvdGp6ZXQ3ak5wWVJGYncwelVZL1Iw?=
 =?utf-8?B?Z1I0RkpkTUtDZmxGeVFZS2hKanlGelRhNllOZGxBcE5KcllIU0hrK20wWVZw?=
 =?utf-8?Q?v6FWmdz0Gw+WXzOuts=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHpHT2o3RUN2TmVMRU1IU3E2czYwYjdPemIycmFxVG02Z0ZSU1d4NjcyajRR?=
 =?utf-8?B?bjdMRlI3MWg4VnBjOGRzR3JUYytqckRDbTNxNE1Ncmh4K3d5SGErUWZlcnEw?=
 =?utf-8?B?OU1tVkpqaGJNOGZLNGkyb1pFbW9wVy9RSXI2dk1EajBXZEdaMloxUUREMG93?=
 =?utf-8?B?Q3o0bTV0U1gxeTBXRGpTWWpRQ1pMNzVHNXRLazQ2WXdnT2tRWEhsdStOWmJq?=
 =?utf-8?B?SmdnTkxKZjVkb0dyTmx3WnltQjlFQXpDYTgwczZWWGxkcFRlb1pXSTlhNDdm?=
 =?utf-8?B?VVFPK2VoRHhVQ1UwQTNiOS8xNGFHa1BXWWpjYzFxOHc3N3RNMEtoeUM5SlFX?=
 =?utf-8?B?Q0RyaytxNmVUN0daMzF0Q3hxUTBtNkpHT0dhNDAvekZGK3hBVFdFb2laWWFZ?=
 =?utf-8?B?cWdRblM4UTV2dGU1OUNNZHlydVR6Y3c2Q3dkTHlmbnZjMkJGeFd6WnBXODQy?=
 =?utf-8?B?eDJ2b2Y0cXg2UzdqRFBHcGFUM2g2eDd4Y3Jsc3IrRERoK1dzTFg3aEtZd3Fn?=
 =?utf-8?B?U1VPbFpVT3Q1YVh0WWMrK1J6TXZQZEV2VDhuOW4zRzhKZXNIWEo1bzA3QUcw?=
 =?utf-8?B?Rld2OXBsS3VFZFVFdVpGK2lKVVZhTi8waDlGRGFzREhYdTVjaEtIRzl4cFEr?=
 =?utf-8?B?VXB6YXJmb3BXVklieERRTnBrcTA0SGowd0tHclNXU0ZQaXE4SkZvVUtYSW5N?=
 =?utf-8?B?QndKSGR6MzA4THpNUnBNNUZVZlJWSnVTZ242MWVNV0J3d3M3N3lPU2pzS0tN?=
 =?utf-8?B?MXdJK21KK2k4WDJCa1M4RVVha2FpVGtYVGJYcVlMR3RTSDl4NlJ1UTg1bDE5?=
 =?utf-8?B?TEdCbFEwV29ndnJ5VFMvd3g4aWJnbklRMFZwVGhDVXlVVFU0dmVlWUhPZDhD?=
 =?utf-8?B?cTRTYzdMRXdmanZxZnliRjdFbEtnTThMYjRPOEYzci9Pdi91SmJkaDd0MDl4?=
 =?utf-8?B?UGJnUmR3YUNiMFBJbEtEczhjMHRrM3NLMHBldm9QVC9IVkt2SWRmMlNwNzdl?=
 =?utf-8?B?ZDhydkh5THVNVFhtNEtpc2MvdWtIOFU4ZGRXc3RxZ3JFVWdxR0sxOUtjOU53?=
 =?utf-8?B?RUpjS2NER0Z2cUNtdGtJQUN4Mjd2UFBCcVVaR202MitFR3BUcDJESkZrZUgw?=
 =?utf-8?B?N2Nja2MyYnZNc2p0YmxCYXpDdmdXQ2NCS3hOM05VdWdEMVlDaFZZVm1WMFYz?=
 =?utf-8?B?Vm9UR3R2Vy9wVlRoT2RkMzBvV3NUcDhoK1IxeVdJbWxpR21jUFFSZW16aVhn?=
 =?utf-8?B?N01kdXlDMm5HVWVZek0zWHZHall1SXJJeUhSN3dHRURzMUF1cGlzNnR2Nkwr?=
 =?utf-8?B?R1lLNUR4KzN4TEJrZWhCdWxsZnNYMGhEVVhKSjJiWjBteXhjamlERG1ZaG8v?=
 =?utf-8?B?QXgzVlRWS2pRcWJiR0hIM3BnM25hanRmdDkzTmdRRUdSdGkyRm1NZTJOckY2?=
 =?utf-8?B?TFRlSk9uazRwRUFoeGhQNDJUTkRaVjkraEpnRmkzTkJZVks0MERaUlNlNVFp?=
 =?utf-8?B?SzZUY2tFSDZJZktCdVVTN281SGExSEhwY3JMVGk4a1VnWGVObTNaeVNsM3Zt?=
 =?utf-8?B?TkozelR0NmVKbmJCdkNISkw1Q2tYRE9KdVltZ0hmT0NDTWdZWXR2TElOWnEw?=
 =?utf-8?B?QUE5eUFYWWtBd2RjNVFqQW9oL05pK1RIUmtuaEIzYUVjUXA0WGVCVmd4dFhN?=
 =?utf-8?B?YjZVQ3RxaHhESnpkOE9ja2IyaTVBc283UU9LeHgyOGFTVjJRTHdMQk1ybGhn?=
 =?utf-8?B?ZGl5NFhpbGdqWkxXdTArcnlqZzVYSXJRajd1OTVVdUtOdlNndlJQSzFRaWR1?=
 =?utf-8?B?N2J3N2dLRXYxdUMreGtMaVEzUzJsWjh5NFFreUNBcWIyNmxITnlpWnpkbGx6?=
 =?utf-8?B?eWZFK0VVRmNsWVJjQkZSRTVMVEkxTk5NQXgvTEtyeDNUbndGczdqTlU1NGhE?=
 =?utf-8?B?YWVEMlVEYWdXNGJvYlB4NW40djlpQ250MHhKMWRQYUs1bmFrVXppZEpCNUV5?=
 =?utf-8?B?TVZPeXpXOE5uNWVJWER1L2tHci82dFlmK3JiM0xVcWhwanpEM1laVFpCVGtR?=
 =?utf-8?B?TUVpU3d4RDdOUVJGN1gzeFlWRFNZQlRubm4vZjZnOGIwWW5oQlpMTm9tV3lV?=
 =?utf-8?Q?hsdOC5nzQj2HpWcZ+0Mwv4Wvb?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830b2d32-6cd8-4de2-adb0-08dc86d5eeb9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 09:40:57.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2rUWKXlWhl+P0iIEr6eyzSTGpbg5KZMpIDgRxVTmgncMs9c85wTPgNVwMMJ6/lzozzde55uiOEt0SpRrOmoMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8254
X-Proofpoint-GUID: PKBOr8KXeGoeAHSinQdc0mhaoa3kX7oU
X-Proofpoint-ORIG-GUID: PKBOr8KXeGoeAHSinQdc0mhaoa3kX7oU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=903 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406070069

07.06.24 10:50, Jan Beulich:
> On 07.06.2024 09:25, Jan Beulich wrote:
>> On 03.06.2024 13:09, Sergiy Kibrik wrote:
>>> @@ -38,9 +34,13 @@ static inline bool altp2m_active(const struct domain *d)
>>>   }
>>>   
>>>   /* Only declaration is needed. DCE will optimise it out when linking. */
>>> -uint16_t altp2m_vcpu_idx(const struct vcpu *v);
>>>   void altp2m_vcpu_disable_ve(struct vcpu *v);
>>>   
>>>   #endif
>>>   
>>> +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
>>> +{
>>> +    return altp2m_active(v->domain) ? vcpu_altp2m(v).p2midx : 0;
>>> +}
>>
>> While perhaps okay this way as a first step,
> 
> Hmm, or maybe not. 0 is a valid index, and hence could be misleading
> at call sites.

I'm returning 0 index here because implementation of 
p2m_get_mem_access() for x86 & ARM expects it to be 0 when altp2m not 
active or not implemented.

   -Sergiy

