Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AF4F60BC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299900.511210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6GK-0008MN-Hq; Wed, 06 Apr 2022 14:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299900.511210; Wed, 06 Apr 2022 14:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6GK-0008KX-Eq; Wed, 06 Apr 2022 14:03:56 +0000
Received: by outflank-mailman (input) for mailman id 299900;
 Wed, 06 Apr 2022 14:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc6GJ-0008KR-Gg
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:03:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 566f73f3-b5b2-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 16:03:31 +0200 (CEST)
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
X-Inumbo-ID: 566f73f3-b5b2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649253812;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Mu4E1vEqUztEUpqJRZk6zrfmukxQXpT597vDR6Yc47s=;
  b=T0FwRewHhtVXSOMYbPYI+QjmgtrEhDk8oyOMPhyZxlQ5hIfjPZJzFkfb
   Pba5XXc2sKd+o6bzK/1liME2UcO975LSKTsAH0Enhpy8j+dYSr883qmIj
   AOguIFYTzbqL1t6FtOtmV318dMmoA44WsUG0v/xcmTPPGzBlSLhyoT3+z
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68158191
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LdiyfajgcP3Pp0u5GNQAjmW0X161TxAKZh0ujC45NGQN5FlHY01je
 htvXGHUM6qIYWXzeohwOYzg9kkFvMDTxtI2HgVt+3wzRS4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vT4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQ4vAILeo/4vbzl3NQwnIat5+aHiAXfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiOP
 pdJMGs2BPjGSzdgOWgmU4gup7+52n7ccn55rAiMpJNitgA/yyQuieOwYbI5YOeiRshLn0Deu
 mPP+Uz4BA0XMJqUzj/t2mqlm+vnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeTDoU+
 U2yheHVJRNJneSJT02c6JK0ombnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2j0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJczV/MBuaL9UdF1M2xpjGGeC6bKIN8N8nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpP9PoW5h6nfiwSo+NuhXogjxmOMYZmOivpn8GWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQzh7UaKOmO9/IOSIXc19z4/1w
 510YWcBoHLXjnzbMwSaLHdlbbLkR5FkqnwneycrOD6VN7ILO+5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:KRfB/qurFXpm5QUu9QDq17z07skDFdV00zEX/kB9WHVpm62j9/
 xG+c5x6faaslsssR0b8+xoW5PgfZqjz/FICOAqVN+ftWLd1FdAQrsN0bff
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="68158191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVnekTLE4YCIYsQ50hF43UiqanNbROUiFGflaBgcc1FgFfWIclEv2q/F5D1C4qY2VpY5O/0dkIE/6clAoEbJQSJ/9FHN0cfrPQQLm2844gDm8z8mx6GxpXSZokxcg2tLFleozPhKA+IfOGdYmRr9HIzdn8KtwFFnETOZzr89OVoFa2KPJaA6jiP/N+QvEdkNn8//IpvqaoX8vNa1qtzxi5ot2OEVA/PWDwcl1uG39WcOqvcG6iLAJEi4s2pKDSApwhHrQCr9WQYY1x4+G5rlBqlgQ/uOUYuEgusVtO45ejGdvugNqvlWizRHTUnulRmo380dIti1hulw4QPNRrt40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkmkANuBOeSe67zXP4NdiqNnGLrAzAMvd1p3Tvzy/zc=;
 b=n7ZKajFpEQHXGuR3qGd38atssBPa/gf0Vv8hVJzuLq//kWgLv7UWOcuLLXLWuJYrWlx+VPg72O9d0JB+aB3EAZ6WXHNsRMvcpFwEV7BYg3TBl7oSlbe3T+xD3UkqnUhg4gTySSeAsxgtg04/VnNF0Zk+AY1xjOnAjTmnNstxT2lvmuIofuF/VbKGLSFxJnIwr9eT9px4a/FO5TQXQN4b9syZZPWXuF4FI32Mhj1NN4P8SKy5WL/2xaSQv7354UEJYLkg/15LtF8D5NaMwfQBWFZkCZezsFwZbomcMlNncGJ2GN2X/6QHufHgFx8GyNVosjnKben1aMMH2gSUpift1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkmkANuBOeSe67zXP4NdiqNnGLrAzAMvd1p3Tvzy/zc=;
 b=Ddo76LQ1wOD8jibZ1Zv0QHL8EQW6Bhbfsd9dfiIx5RkZ/6cpll9dcLZPtcUVRrKzCVhjRd8JriDFh9reURZGg00kjMAkWJe+vQNyVkTVN2cm+mT/3z3ULqZL9K/J34AYAFSbEx+Sar0Td+sM+k/dkzyL4mp5TQggB2MoNxOr2eo=
Date: Wed, 6 Apr 2022 16:03:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Paul Durrant" <paul@xen.org>
Subject: Re: [PATCH 2/2] VT-d: avoid infinite recursion on
 domain_context_mapping_one() error path
Message-ID: <Yk2dnzI4WSm1xMdP@Air-de-Roger>
References: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
 <535d1050-e5e0-6e1f-5299-f41b84350ca0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <535d1050-e5e0-6e1f-5299-f41b84350ca0@suse.com>
X-ClientProxiedBy: LO4P123CA0138.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8e1bb7e-a789-4735-e48c-08da17d63736
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5807:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5807BE1AD976B943EBC8031C8FE79@SJ0PR03MB5807.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbEnRFaeH88Akv+4WEFMcJEZpyhmG1rg85rKIhPgRHeDQESPIhVOftFjoFV0zrOtc1g+VPWi7K6mgJVb7Es4XYPH2y4xDHT3iMLTku5rH8JPvfhYzQ31J2+EWF2JYoFxTvbXvZGjZI+rR3CnzAKgt6aP6kyiMrnPRpRoyVQTKG76JSZ7VAgCrPqovl198u8sUFO8TKI6Z4VyPpnwVBqaxVrcgZaVBFtNcfUpw3t1mqV3iN4uCJ/Td83x3ycO6QQPpNjvgcobKOeGjuBWjN44rzGHyVJevC2rZzbn5UOYLEHhGWqAvajVTUPiED4EzhoGN033O5RZAg/197I5HvwsmwstkoyAr6WQLCZKKI165cjGM4CIvpJP0C4pj4gWnvBvxlRe9qvHq7KwDiVw5JxUJ6RcEGmgLdKzYnuNW6/ykNPh3BsfUQo/stdLNRFscD5CKWH+2xnC6N0hg4d/0mEL9c4gFBOIiAXYMk41Kpe0ANlq2U55Y+moiS9vOlo4Mjc9Ii4a61gVqTVtgNqj/lyhdou3XhjcwuHT9+ibvRVPcGMnxIMi5r8c0eZsS/Fp+Xt8X7pGvwGbTACkATQ1PyuCdQAU0xc7Y1YzK1JkwTJLg6mfCTalVet4J3iUcxjwX7LxrfODT1u21r/XuvQG9uzheg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(82960400001)(5660300002)(316002)(4744005)(38100700002)(54906003)(6916009)(186003)(26005)(508600001)(6666004)(6506007)(9686003)(6512007)(6486002)(66476007)(8676002)(83380400001)(66556008)(66946007)(4326008)(85182001)(2906002)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2YrQ05YekF4T0taeFNZTitlaTVKWnRXdFBQemJXOTFKT1drc1c5TTYzY3dy?=
 =?utf-8?B?Vm54QUpXV0lRcTVDMk5mMnZSeGYxdU1KTy9lWXUyYXpvY3YyTS9hVVM0NXZs?=
 =?utf-8?B?eDVLdWlqUDl6T083MHZ0Nko4Uit0V1luYk1KbStHUjNocUdpSUZPMmZHUEw2?=
 =?utf-8?B?cFhXcERiakltV05yZ3NWNjJrVmZrUy9nWTFjMEtvM2VaSVNSbkFjeHZhK2Fw?=
 =?utf-8?B?MTZReGg3NlV1WGd4QURqMkFISVNiWnB1clQ3K0xoUlA4T0JpUFlrMzYxMFJZ?=
 =?utf-8?B?VHllM1A3RDZLV3lxcEl4TmpQSXFDWTFEWkVyWlZReDJlbnlsNlVTSVZBenZX?=
 =?utf-8?B?VFF6bllpOHNPOWZnOUM5eS9wTkxqRkdWODRSZ3UvZndUL2gwaGtpMm1najl0?=
 =?utf-8?B?RHhjWEpRTEUvTUc4dm8zb3A5SGk0QUJJSVl5aDJaZHlJQ0FWbitFSWYvMnpH?=
 =?utf-8?B?ZFFJdE14c3pYQVNmYW15NVQyeXpLOU45WHQrMTFkK0VGOGl2SDN4MHp0ZGI4?=
 =?utf-8?B?ay9SYTJKQXlFeXhhS0dyT2tyS2MvOThjV1I3dGw5Y0UyUXdZV20rYXFRRFM1?=
 =?utf-8?B?NllyNkdsSnpjcGNvei9sNlFkS09vY2RtbXB2TFZDMFF0aXl0M2VUM044MUtn?=
 =?utf-8?B?bXE0MXNQUVRJaGZOWGJYQWRteEtzWElBZUp1djNGLzVSZ1owc2NtV1ZwWkEz?=
 =?utf-8?B?V3FTUHVCZzAyZFd6MkhSbEpyQmpyYmxxTDJLU2RsRVA1VlhJZXBsNUsxclQw?=
 =?utf-8?B?Q0s5dVhObWRyQm50MjRLb0JYa3lPOENwUmdBRGVIc1ljQW9ma1FSMGtWb0hv?=
 =?utf-8?B?KytEVWkrVTI2QUtCd2puNTY1aGtsZXJjTG5FWWlVNE1kc2o3MFFEbFowOTlz?=
 =?utf-8?B?U2laZ1VjZjNIL3BXMXVlZk1rRmE5UGxLNGNIWWxZRGVsdGRjQ1NiY2hIcVpt?=
 =?utf-8?B?ZnNJVW04TGliaFJZSUIxRnRlbUNkeGZnYStQU1BxTnVZWFB3eFk4Nm9yUVkz?=
 =?utf-8?B?ajZIV01ETjRoSFdxL3lBWEpzRWNVSmc5UlBENFlkUWp3RlRIVHg5VCtjZFNJ?=
 =?utf-8?B?aEZEWCtnV2RmL3lmQ1Q0TS9MajBZdzg4V3V1WnVQbGhQZG0yMmlzQWtGNWFN?=
 =?utf-8?B?VTArdmJielNjL1BOMU41YWVwZDB0NSszQ0R6VGhWOGNkdm1YVitCcjZWbG5H?=
 =?utf-8?B?WVIxQ0RkRGJpTG9UaHloVmJZaXhob3J2ZjdsNFNFblZwR0R0dUdMMlBsTjJP?=
 =?utf-8?B?UUE5QzJSMWQrZ0ZZdU0zM0VHbGVGaThSelJ3NUNYdGk1MDRJYmtLdHp4SWFh?=
 =?utf-8?B?Y1JHa1VrYWtrMVN1enhmVjFSWC9iVUNYdmthdHJkckVwYjduRkVZZ2l3MlBz?=
 =?utf-8?B?ZEdEMURZRlFPTzdxVWhKRGVFbjI4YmJvcnI2aWdUbHNzUDJTWURLeEFVYloz?=
 =?utf-8?B?QUxDdngxOHBiOVlQRnFMM1Axa2lxUVNkQzQrTGxhQW9BZi83amJQRnREYW5D?=
 =?utf-8?B?bXBsMXdQM2NSYjg3cndPK3M5dWZKdENNTW0reExsT1FPNTZsdzRBM2JCZkRa?=
 =?utf-8?B?MkpyeWNSWmJmTkhCT3hGY1ptSUZFT0czRC82VUYwZWs1Si81OG9rQW1zQVNx?=
 =?utf-8?B?MU5kSHFzZ1hQUlhISEp2RU9lSHNKUjJqeTRoT3RreStZUEFkbzBGQ0NvWU1n?=
 =?utf-8?B?YXZIR1gvZmo3Y2FJeWFvQ2Q1WWNPcFl5eFpwQ3pFazJmUE94UnE1aHJyR0dZ?=
 =?utf-8?B?SjY5ZUZ4OEg5NEVvTVFRL0xLOGZpNGJqeVRjK3pkR3AxaUp5RGFIYTMvWERN?=
 =?utf-8?B?N0JBdVQ3bDEzYXd2UnJ5eUVaK2dYWFZ6bzNTdWlqdzBxMzZFejlTaGxzd05j?=
 =?utf-8?B?WVlua0Nhb3dGRWRxaEV1clN4T3Rmb2g0MkpUYkNZd0sxMmFBZElVM0hvRHBL?=
 =?utf-8?B?dE9wTkhGa1UrMnAybU56MlB2KzB4MVdMTzYvNDV0dmI1LzA3aXJFN0l2K2c1?=
 =?utf-8?B?eFV5bHduZ2tyWGpwK3MveVlRTFRmeVhtSkdobW5LcDJyS3hvMEYxdFFiZVJa?=
 =?utf-8?B?elNsajVZZVovS2FOOTUxV2psTmg2MlA3VTFRNGkyY1hSZm5TTVVHZzc0WUpi?=
 =?utf-8?B?MFdCSVF5eE1YMVFwalNzeEhzWlVKZ2E2VEYzbFFDdmhWbUliWXY0N0c0bFNB?=
 =?utf-8?B?d2lqVG0xemZDVGgvTTZpUjdoU1N6cFhFM0VDWW4vakxmWFBteGQyMlVudkZq?=
 =?utf-8?B?L2hpdVY2SERDK3JZbFpwVWRzQjVVRThqSklBWGdMcmYxN3c2SExyU1JxMlMv?=
 =?utf-8?B?SDVhNFdIbno5M2w5dytXZTBsUzdTOWdLbFM3akxUdldlNTE1eExaWGorRFpr?=
 =?utf-8?Q?u+ifQr3qkFXpdbr8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e1bb7e-a789-4735-e48c-08da17d63736
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:03:24.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jspmxtv6hvOT/zAR2lbKXUdt58XNLb3A3Vi7RMoktQ2pwi1KxcWwp3QkvohBcwzYGN9dF4NqcJqKcUNoJ4Z8PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5807
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 02:25:13PM +0200, Jan Beulich wrote:
> Despite the comment there infinite recursion was still possible, by
> flip-flopping between two domains. This is because prev_dom is derived
> from the DID found in the context entry, which was already updated by
> the time error recovery is invoked. Simply introduce yet another mode
> flag to detect the situation and cancel further recursion attempts.
> 
> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

