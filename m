Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F39901F5C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737134.1143289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcEF-0007nM-J0; Mon, 10 Jun 2024 10:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737134.1143289; Mon, 10 Jun 2024 10:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcEF-0007l2-G6; Mon, 10 Jun 2024 10:26:19 +0000
Received: by outflank-mailman (input) for mailman id 737134;
 Mon, 10 Jun 2024 10:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtSS=NM=epam.com=prvs=289119432d=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sGcED-0007kw-7P
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 10:26:17 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd328607-2713-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 12:26:15 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A92l6D004683;
 Mon, 10 Jun 2024 10:26:04 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ymgp3cknt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 10:26:04 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB8PR03MB6284.eurprd03.prod.outlook.com (2603:10a6:10:13e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.16; Mon, 10 Jun
 2024 10:26:00 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Mon, 10 Jun 2024
 10:26:00 +0000
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
X-Inumbo-ID: dd328607-2713-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUmBXX+BdNifj+SmxYYIlDmkjGnW9U88ijj9+N3PdFVSasz03ekEwWmlg5q6kg81fgX5d8Qtkf8cPS598LfgjDxqk1uyWtttjIzqXSe6m18Ait7wfX31gOFLmLVOGBTAT/E+1/zMXdYpPUdevwybKlNQOcFAfJAYGTL8nmtnmIbiXpovZXcUQvuBfykxfnJtKnm4d1yuJGN96jVKgenlKdggzAc4SLaV1oBiWNvnKtPSCHB1EwzuTmcRuC6pCxXcIDX8xX2/AInqi6lBIQXgZj6Evyyqi/d5sAD5olwmnZqIZY4J+g0GgQs64/DCDu5JnEOPqn0y/J85yCZR5S4zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LwftG1D1TxQ41ZNc/rQVIomsuS+AvqPSY6z59+eY8I=;
 b=Tl9lOHT3BqerJ9g//EMiVZPdlZxNmIrUGW1UZh8T3XYBFFuFBKvGYccggIn1OlI/iLqe/UduOL8hvoGtvgwQUcN6YzMTq15/1fEmn12p1gVTqhuCXOOTIy4qPgECKd4uwjrIOB5k6PJoEKJyh88AJ8yalXTbDI4Dc4OvGQl2bTwJNv8k7Pxfi4XXXEU821KcFrZB5Wp+RryFCGD8q75fyNPc8fp486TEMdJ6vtpyTkeNyarDHf/MU4KOtCVwrTbWfTQAr19T6vAo4kAAPT6lJpTDX2tdkU7uwFBxNzzBkIqW8W7hlkDX0TRqMOAtTYZAXxZfaCRIeQWxMR+Xc5RDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LwftG1D1TxQ41ZNc/rQVIomsuS+AvqPSY6z59+eY8I=;
 b=dqs5mrdsW6jHcX45I5K/3O5VhA3ZGgteZGAn10bZvGxhMEyxg9vcIV0VGxeRZft6NaSOooItr+euVD4OvUmVHp1ww0rioVKVJX82oRoQL5ufXtKBZ5glOEGFRVDc3Yff280U781tNDgr8AqL7XOqimL10Ij8UCDmR1QaOfYorKDS6EmSsItFjomleE4uiCHI167/BdaYoVI7Hu3kYoQcnmkfJmsZWwLYWnYJahlOkG40AK+DzcZy5frsp8leWzZnBlGH2XLBYikHUCGqIFL5zNspL91gKLsXP/HQadsGME332DZt8HVctnstYp3dLEdePobn99/gak6aaxyHL3BEKQ==
Message-ID: <1bd86288-38bc-4bd6-a937-d3e965f4276e@epam.com>
Date: Mon, 10 Jun 2024 13:25:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/cpufreq: separate powernow/hwp cpufreq code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
 <5cb13d1a-1452-4542-b50d-23e6a9d9d3ef@suse.com>
 <c66966da-bbe3-432e-8a2f-809bf434db39@epam.com>
 <ab57f7f3-ac54-4b41-950a-1f7bee4293ab@suse.com>
 <647b086a-04b0-42be-a7b8-a266c4f4e64b@epam.com>
 <c642d1ef-9466-424a-9e84-54accecd8c6a@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <c642d1ef-9466-424a-9e84-54accecd8c6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB8PR03MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 591715b7-cee6-4b9d-0f94-08dc8937b93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NVBjS0pMV2RwVEtuWmJ3K3kzSm5zR0xDSkpFbHNOcHl2M1RlMEowOEY3dW5U?=
 =?utf-8?B?eGRpODgyUU93U2dEYUY0NjZkZ0tmU05sdTJ0T2kySmxzNWdFbklvaUYrUDYz?=
 =?utf-8?B?K2M5K2pVZkdLV2hnOGZIdk83NGpWeXpWK1hPY1haRWxKdzdITXdMcXRmdlNv?=
 =?utf-8?B?S211b2wwUEdHdmRZY1dxT0hiZGQyMFRMdmE4Y04vZzVVK2ZzMzhXNVJSYmRt?=
 =?utf-8?B?RFZtYzMwQmNONjNSejFRaGlpQmFvVGVDN1psdnliZXhVSXV0ZXBDT3FLWjhz?=
 =?utf-8?B?L25UY3E3MFdyNWhXRDZyVUU1bG1XcWxocitxQkhyVGMzOTFXZ1ZmcDdqU3g2?=
 =?utf-8?B?K0RKT0ZLMUtwWFlkYVhTbDVKeW9tTC9IcE5IMitERSs3b2p2S0FHT3JNY2pl?=
 =?utf-8?B?YTFndnppOG1mSDNlZDdXR2syRytkUTdoWkY5T3RDdGljV0Q1Mzdabk5PdWJo?=
 =?utf-8?B?enFzM1QzczFiOFFtZHNJUXRrN000dFlHekZmeTNrSzE1RXJkK0RVWnhxbytI?=
 =?utf-8?B?VHpONVMrdWJiQjFHVmIyUy9YMHVzZ3Y5OFhLY1RuN2puU0F2c1JHTUxUa0lh?=
 =?utf-8?B?czFnSS9Jb1pXNnhtTi9OQWNOdG5EU0ZNZUlJWGpLY0VqY1lRbWkxdnBhNlIv?=
 =?utf-8?B?YVQzb1NyVW43azdRdUttZzZvZXcvazgvZUZKakY4eCttYmV5QS9GZnAxSWs4?=
 =?utf-8?B?bHlTanBqMHVFc2tXUStKeWFrWkI1Z2FZdGVJWnZpNnBVckttUnRkc2hBc2d5?=
 =?utf-8?B?dTJ2ZGNIOC9BNi9Vb1BRc2lCTGJLY3BTeUppSno0OVRKc2s4RU91R3VjMEY1?=
 =?utf-8?B?ZlF0MHNpNnc4MnBJQVREVjJMSHFyU3dlcXI1dVRmTWwyZ1hja3BSWjNpdWR2?=
 =?utf-8?B?Y2J1ZlBSaHZQTnAyTS9ISXlzdnhaVVhUUy9lbjd0Tkk4RERMUFlPZVpWR2k5?=
 =?utf-8?B?bmZjTUtKSnZkVkIzN3VnMGF5RVRaNXVFVWxVSWZkd040OW9MNUZKdE9WbmZK?=
 =?utf-8?B?bExDR0FlMmxGNUxDcElLa2sva25MWVlZdUNvUUpjcUovSDlRRHVKd0lnS1pG?=
 =?utf-8?B?ci94Q25sbG5sbGl2VElxNjJJQTgwcVNqMGl4UitVYVAzQUtXcDJUbTgvVk16?=
 =?utf-8?B?eU1XdkU0ZHpWT2t5T0NlTmpzc0Fwa2xNRVFqQmNVYXRpeS9QK3NuWkNlVEVa?=
 =?utf-8?B?SG9yNmJMNDA0U0lSNkdBKzZNejRlazM2ZXNQcFVMRmNrcVErelR3aDgzVXVl?=
 =?utf-8?B?R1k3UHc5VlVmcko4UUNDaXlyaTc3T3FFMXlNUUZkOFNGL2ZybzU4RXNoRzBB?=
 =?utf-8?B?NW0xME1lTEFrQy9uclVUZUF5dGdSMlF3RTRYQWY2NnZjaC8yVTBYc0ZNZVU0?=
 =?utf-8?B?L1B6c0U3d0N4ZzhLaVhmL0EzVkdSWVVPL3RXbzRrMnMrdjNNWjhpMGFXOFVS?=
 =?utf-8?B?OHZOSmpZcTdVd1pjNFZKYklmSDJGVmRydWQwNTZDWXljV011TDF1c3B2MkJS?=
 =?utf-8?B?Q0VYMFBadGc1dnVGR1FQaElNZGtNck1Vb0hhOWEvN0YzZXJUbTNlYTNXMUQ2?=
 =?utf-8?B?c2lOUUtHdDVWOStEVjc5bDc0b3hGMDFiVm5OUDh4T2p2L1ZnR2Z0Nklhcysz?=
 =?utf-8?B?d3I5S2FMaE1uT1NtdUlLUzdTL05oOTFTT21QZnN3L2wxQ0hWbXZYaEkyamhL?=
 =?utf-8?B?dzEyT2tXb2pvSkFFR0V2ZGp5czZuTDQyWUsySmJXaTVTMjVEVUZ5Y2hKYURi?=
 =?utf-8?Q?JxRbIaTE+cS95+NgJ0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmJ2ako2ZU9aQTB3bWNNMXRXQVBycW5UUm1pMEMzWTlUMGFyRllPdk9QUkhz?=
 =?utf-8?B?NTRiUE04blZBdVM4ZmJNM3ZWQzlXUFdmRHVyODJOTEpRd29VaVZIamxaU2Yw?=
 =?utf-8?B?Um16aVdzTldpWGRCaGdBZDlKSWozdm1YamtaK2lWa1VYY2RoRnlsSHNDU010?=
 =?utf-8?B?VG1CaXBNREVIR0IzeWVUQWNzUStKb3FkUUc3MmxsSWFYZkZLU0ZSS1pUV2gr?=
 =?utf-8?B?SnprakdQYnRRdGt5N0hxbFFUdXNRdzZ5Y1VZQlJXTFY0eUNPQjB3UkVUSTlL?=
 =?utf-8?B?b3JrVm9NNFN3OWRvL0Q1aFNJeTJsdm1GeXlXRjNBRzJoYzFvZjRtNDhHTndz?=
 =?utf-8?B?Y01zYyt1RlBxT0FldlZ0ZFFzNFMrT0c3UUxKNWJLYmhLeC9tVEljRVhYZElt?=
 =?utf-8?B?aTU5NkpocnZXbmNucGJFZG80TXhZUWNHWko0a2ttb1ZiZVJWMkVjR1Z5Q3Yy?=
 =?utf-8?B?UUcwTVp2RzgyQ0RINVYycnlkUlZCV2QxNHBaL2RUUm1wcDhiaTFFZEdRQWdQ?=
 =?utf-8?B?MmZjdUdRdWhrU24zVW5nM3NXbmpjckVoY09TdllvZVJxRWpaZVpRU0VNTlBY?=
 =?utf-8?B?UzlFTmJVU0RrWFJuVU81L2dwRi9HL29iRnJvRjJuYituM2pNWUhQUThtczRt?=
 =?utf-8?B?VjNEVXdWcm1zZS9KUUdFNjExbkNVQkV0SXRkREdIeFZRU2ZxQ0UrL0hnZnZj?=
 =?utf-8?B?WVNEaEg2aWxBc25NR2wrdHNqRjQzTnNkT2VJUWptNUUxcE5NUGo3SFJXZHBo?=
 =?utf-8?B?VGtVMzVDSlRBbXdpaUpkQnlGWlRUOXplNnRYc3BzTWZTQ0xVRVE3cVFYRnBx?=
 =?utf-8?B?aTlieExjWS9nNFVsMjAvRmR4WU9iRGM5MUw3RnBWc1VSaDBVeTBKY3ZodXo5?=
 =?utf-8?B?aFFrQStMY0ozZklZa29MUEJVWm1JVHJkWHcrdFhzS1VrYzJhWG0rSTFPTU4x?=
 =?utf-8?B?a3RrQVFva2JYZnYrdVhwcDJIWGd1S2RUVGt5SSswRzhwUTRFRGhkVWVIV1RQ?=
 =?utf-8?B?eWlPdUxSTDM1ZmVTbktINW8wNjNmdGgyV2EwYlRJOFV1RkRJMU5BUVdueG1q?=
 =?utf-8?B?UlRVNEFyZklVTVBsdUFNaHhsd1NEOW1hL3o4alBaekdEZmczL2VET2FlTFFO?=
 =?utf-8?B?OW9mK1JGRXZZK2ZqOU1TZGRsbFB5U2NEbHFTNFFCSlRDdHQ4YkZLZEZZUnlQ?=
 =?utf-8?B?UzM3NTdlR1R1Y0RrZ01Jc1QzbVRjZDVyTDBwaWV5b0Jid2xJajk1TVBwcUtt?=
 =?utf-8?B?bTRuQlpGOHpja0l4TEpXYVVZKzJETmEyQzdSWUFhY3hIVFMrMkhzUmhwWGZB?=
 =?utf-8?B?eG12YnYreUdmMEdsVjUvOG9rRDdNZCt2N1I4TkdBRlk4dWVvQmJqVWpOQ2ZH?=
 =?utf-8?B?d3BLWC9jbXpNM3FyemlDM2RycEc5T3BBVHlVOUlkTEM5K3RjZS9TTi9sTEFY?=
 =?utf-8?B?clhhU05OYTRLWjdvbFdlODdCOFNjOXNJTnd4Y1krS2g0ZHVaa0drYUMyaElt?=
 =?utf-8?B?R05qNkxlSGFDSEdsVjVtLzN0MCsycGJ5Zlc4NXUwdUtyelZWbDhadDRzcWlq?=
 =?utf-8?B?WUhLTXM3eS95Q3dHYkhQeVF5b29rOWlQTDEvamJqLzh4S0NtbGRXcWdVTkZH?=
 =?utf-8?B?NEtHalR5TFZJSVdHUXNTdnZ3eDZlSzZsVndZN2RLZDJKY2Y2VVhIRDdmZWVZ?=
 =?utf-8?B?VFFEMnNsREVTb2VlZUVxSU43YUJJc0dVbnArMFJkZjNObEthTkd4SmVFd25U?=
 =?utf-8?B?QkRhcnR0eXJnNzRsdHJOVTdzRDFZNmpOZ3ZGbFdHc21HRUNuYXk3Q2UzdFVK?=
 =?utf-8?B?OHpwTTBPRmIrSjY3elphWEtUdnNPeE4xNHVRMjA5UVNWSUh2VFpFNWRNSTMw?=
 =?utf-8?B?bEI0WjFNT0ZZTG5SZVJwakJqQVh3RjlUbVNnRTY4Umd1Z0wzb1JxNVR0eGx2?=
 =?utf-8?B?QnVOWnU2WGk1Ukovempud3VIUUtEWHRWc2ZOV3NodzlNWktJUFFpZGNEUytn?=
 =?utf-8?B?bHNsUzFXNTdaZVowL0ZXMCtsemNFVWxicVFpS29hK3B2KzhNN3RTSDMvSUM1?=
 =?utf-8?B?ZWNhUUVLcDFCV2VpUDVHMDlUQklaWUlyZjJLRWFvbjNzNGxIbzFibVBQWkFW?=
 =?utf-8?Q?X8mQJxJsbYPtCPkNFsD5lOfel?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591715b7-cee6-4b9d-0f94-08dc8937b93a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 10:26:00.5807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fq3rqlllo/1DUM/axrECjKO6ztBe4jdFp1PTxdjPJxSCgkoF3pa2uP/9YA3bdrtBCncvm8J08LAoTUyqiUGyVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6284
X-Proofpoint-GUID: Z46RluE6bS419zDJ7i2_cOENv570fq-D
X-Proofpoint-ORIG-GUID: Z46RluE6bS419zDJ7i2_cOENv570fq-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 mlxlogscore=820 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100078

>> Though I'm not sure such movement would be any better than a stub.
>>
>> acpi_cpufreq_driver, i.e. the most of code in cpufreq.c file, can
>> probably be separated into acpi.c and put under CONFIG_INTEL as well.
>> What you think of this?
> 
> Sounds like the direction I think we want to be following.
> 

Sure, then I'll make a series for that.

   -Sergiy

