Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD68NGK0nWnURAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:23:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E9188527
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240114.1541609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutJj-0004k1-EU; Tue, 24 Feb 2026 14:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240114.1541609; Tue, 24 Feb 2026 14:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutJj-0004hc-B8; Tue, 24 Feb 2026 14:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1240114;
 Tue, 24 Feb 2026 14:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCRR=A4=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vutJi-0004hW-Aq
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 14:23:14 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a45ab28-118c-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 15:23:13 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:23:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:23:07 +0000
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
X-Inumbo-ID: 5a45ab28-118c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEcdsakT4Bss9tCvWLeJXwZkLdt2BaX70SvGuK5dHkgvPr83+ZHXpkbhChS1PRUyjccN3QFAPav2yheNcmOtf2zQ9vZ3VGIuOn2EcFOjhjfFyCd5a317OTk3ttK2HrwY6lgPL0bh1GMgFv2WS1QgSzGh5TZT55KRMv628OKmeSR56vdy8xI0z1qQImYW3ePqmWsNY5i8cNG3Wk/bcmLQ89JAyVSvTu6wKId2Q2tVFF1ZJi+KGqzdmRDzaYaR2FWwsTkVa9V5nyRSsfMn+fNN9ODWiMSRbPPjh6tbnSIVnWDP8W8VzVb9tV9sxfxFPzVAMB2kCB4bXB/Jbbdy6ipiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4ytCpZ3Tpi9Ml3xdMAtu7ETcazy2dztxT4cPcH6rdU=;
 b=mPdxM2fPFj5JxlD3FRQqFDL9Qnx8o7EcbntoC+t5C6xN6zwFB7Yu3uQpCMeNQTJ7MkDxfKGOwsyhsfcdktTbdPd8oHxc9zftqU9vteEfPon9X4jQMHd34PdI+0RiM8E1xKvDO9ijIbMlIc+MUxT9+Iepub3HHoeSlDRU/R3vdPRPvd8OQ0L7sMQRlcTODMRBcak3fce7AzH0E0ilFBL+pKczQ7noUFXJQRRXyQs6sLb799GvaTGu/+sir37UtaQgtFW7oN+yKyGYry0hzrMidurZ3iIcKi6ExH6tWf57RMPgzktCGLgASWACDC407Ueu8nBmQPz7fNYLaU8Q+LEMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4ytCpZ3Tpi9Ml3xdMAtu7ETcazy2dztxT4cPcH6rdU=;
 b=SlLZC1b27tAufBsd74rkTZgSPW2tmqfplyd7PJtPFnMvTDhWjEELdtODThVBJ/30pfabvuj9Vd1sQ//2EDMZk7LGyj/l6Xq4m2zeoVKAiNITq+lwCmVDd/YDrmm+r/uQcx5UbAnKqgsaqVsEMu7N/eqer/MsewHy4YOjaqe3rYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e28c13af-e639-474a-b63b-411baf063e48@citrix.com>
Date: Tue, 24 Feb 2026 14:23:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 1/2] xen/arm: Simplify SMCCC handling by reusing
 __declare_arg_$()
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
 <20260224124558.3675278-2-andrew.cooper3@citrix.com>
 <631f2de3-f551-412c-a465-34cd5d8db8a3@amd.com>
 <46b25d29-d7b9-4b5f-af54-074ecce5c34c@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <46b25d29-d7b9-4b5f-af54-074ecce5c34c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 5072e1e9-296b-48ef-7883-08de73b03b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkIyQk1uaXJLbDJXMTlqS0pNcWd5dVd2QURkeVVML1l5a0QycE5iWkF4SE42?=
 =?utf-8?B?RTJIQWxnS0pOcWlCSTJKVGlXZXk3M0ZQcXNOeXFYSUJnYkdLQUxlVUYzbG1U?=
 =?utf-8?B?UWN5M3FOaUpGdXI1RDAvZXhmdHo2L0NWb3RndjlVcVd5UElUN2E3Z0MwVjlG?=
 =?utf-8?B?MTRveHhEc29KRjRoaUVhc1pGUzQ3YVNabnB6aFl5SlU0MXVxcytHREZYT0tF?=
 =?utf-8?B?bWhvQlJYUk41cDJ1ZDlvelVRZ0tWOFFiTzB6R2RmSUEvK0hwcDRXbExnUk9X?=
 =?utf-8?B?ZmhGM0NGUmw1eE1qRUJpaTRJTDlWVXZYOC9Wd2R3TzBCNkRMMGE2VDhLeDR5?=
 =?utf-8?B?MUR6TVRodllMM2xmblZaZnlvL3QxVjhGTWdsUjI0VnN1c2hCazB3VnFjck5y?=
 =?utf-8?B?YjRoMHJQRk5Ic3BMVSt5aStTZzcyYTN6SWU3cHg2M3d1dXBFK2pSUXA1VXZV?=
 =?utf-8?B?OEhFbFlFaVJGRVR1L2tsU0pmUktXTGdneWRKVUwySXViN3FyZ3NCZEIrNzNF?=
 =?utf-8?B?WnBQV2dINmo5YmVPN2JzekdFTzQveGZZYTdRYzJpTkFXa3VJTXd6Zm9hdmJD?=
 =?utf-8?B?TUVvSzJBTDF0SjdRMFdTeGdoTjg1bzV0OFBxRlFYcWdTM1VrSk10YzJxY2Jy?=
 =?utf-8?B?eWRYNWlyMkVjU3JHSnRiUWVHWHFBeUF1VE9mNTNLVy9aYWRJSzBpUXhLSHNR?=
 =?utf-8?B?WklWQVdJd2lKa1lXc21QaDN4NDNVNklaeGpyK01qbzMrWkVXRVpicDY3MWlk?=
 =?utf-8?B?OURHUHhLWUg1bGgvNmw4dTA5QnFETkJsMDNmQ3NHYXFPOXdkdlREd1EyVzNV?=
 =?utf-8?B?TkxSdjVLZUluYUpBQTRjVGVYVE1DblhCUm1qWUVmTHhQUXhWTlY4QVRIcnZy?=
 =?utf-8?B?VW9LSG1UL2NJcUR6RHJSZzBYOTlSZzA3ZHJVVVZWZk1Ld3YvM2F3d3lOSnh6?=
 =?utf-8?B?VHBZc282NG1ZZ0FQaW9oZmN0WVBoNm03WW5KbmtRbFFZMW45TCs5ekNQK21n?=
 =?utf-8?B?YUpDZHJjRGpIRHV2U1dHU3BwYmE4NXZwSHJWSUdpSzNKcklObUFFT0FUQmF4?=
 =?utf-8?B?dFpuSHRqb0VHNUFoQ2c4R0l5ak95RDBmcUtrSno2MXVxOThMM0FJWWZyVmlP?=
 =?utf-8?B?WFBsRzBEbHQ1ZlVyNys2Rm5ZZjU3ZURUdjZQcE5RSTU2OEdBbEZjdzZ0MjND?=
 =?utf-8?B?K1dtbEljc1hFUUw5dVJOMVUzeEFtNVRVN0xBZHVaT0pOc0I2ZW1UK1RuWVhU?=
 =?utf-8?B?MzVSLzcrZ0ZDSDlDSDVxZlp3RDl2WFBnUmpSM2JkRFcyRXlGUUd3Nk1pblpz?=
 =?utf-8?B?aVg5ekhjbG9LZW9JTmR6SmFGS3ZPRDNyNUF0bUZxQkg4dnpqUHptYkkvb1R1?=
 =?utf-8?B?MzdJeW1HMnlVcHVUaWY3Z0xrcUx1Z3RXYTdQSEFCQm1XdDg0UGZpNHdHdXNk?=
 =?utf-8?B?eUswVHFLZStBYmNVTWZFTWVuNGErNlB2M2o4ZU16ck4yYnBOWVQvZG4yRWls?=
 =?utf-8?B?c1RuTHcrcTIzTjAvSnRPN0ZTallxT1EyZUJidnpjWElJSEZpV1ZIUnFFY2pK?=
 =?utf-8?B?ZVd3VFN3dHg4QkJsU0dPTVgrVENMMUZ6WnhVdFZHTGg4MlRDWHRsQ2NocjBu?=
 =?utf-8?B?cFhBRWU5ODRMV0tTbFB6R09Sa2dMOVd0OFFndE0yZ0lhdFk4WnprRkdobUQ4?=
 =?utf-8?B?Uy9JSm83RkdWcG8za0NpOTBDNWZlWERiOGMyNUR0TGFyeUlSYXBDVTNOMytl?=
 =?utf-8?B?ZVVPRDg5bk15Y0xGeWRKeU9HRGZ5SzYvNG1DUm9ESjJuaTd0aEVCRzBUKzVJ?=
 =?utf-8?B?WnErb1dwV2V4S1NrTFhTb1l5Ty9rQ0xUMkxaVkowSXdyYnpUQktaaGtaYmd1?=
 =?utf-8?B?Nmh0VWpRejF5Qk93amEwR1IrYTkrMUJYTnp4azR6QndQOEJYL21lTzc0Q25n?=
 =?utf-8?B?TU54TjUrY3FDSG1MNTdKalRqQzlXSmFjY3Q2SGJvOHJTMysrZHN0WXpSbG5O?=
 =?utf-8?B?bVd0ZnhqUW1FcE8xOENsT09nNU9GZXV2bXZFUU5ZU2N5NEY5UlpWcTl5bTZO?=
 =?utf-8?B?dmZnREppeHZ5cmNXUmdZdXcyZWprd2NmWUpjcFBXVjNUZ0NsdTdTQnRYdXJl?=
 =?utf-8?Q?EKPs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmhTUHZ3MTY3OU5UQkkrbjFwd1FvTFJhazI2bnJzcjBrQ2YwZU9tN3I3Zkhr?=
 =?utf-8?B?aTd3SHdpTktWS0lYRlRlditPSXdEdHRsMzI0YjJWOVVQSTZpUWg5Y3BZancy?=
 =?utf-8?B?RkpNYzZ0Y1dTQ1laVTJoa3plclZDMFBWb1JJN29ZTEhMS3k1NkNkN0VHR2Ny?=
 =?utf-8?B?bE5HbGQyR0hmMmpKc0VxRFg3TTAyem9xZ3QwRkorcUt4RXc0MmxIUmt4ZkRG?=
 =?utf-8?B?UU5vL25jaGZxdDMxZjNrTXN0UGU0d2FCOEJnYWhWaTBHczZSTjJkNEIzSzQ4?=
 =?utf-8?B?T09zcURLRTJLMXpTSXpiNTgycWdOZkU0U2swTFhhR3FzSmJTb290VWNuNlJ2?=
 =?utf-8?B?a0ExeEFZd1RNUmhVckVkVXV3WUcxc2lSVEZPRHFRdzBHYnpPc3pBakk5N3VC?=
 =?utf-8?B?NVVUcjErcENuUjR6YzMxeWYxZ3Jtc2NBZ3B6UitQRnR6UjhKLzRlRk5salor?=
 =?utf-8?B?eVNYSEU1OGFYMTdqSmxNbklXSjhZbWYwOEpGemY1S0FlMjh0OEloYTVNR1RB?=
 =?utf-8?B?SEFud3NKR29oRU5mV2tGUCtNQVdEdnhtSSthUW96aGpZNEdSbjRxMHlWUWFB?=
 =?utf-8?B?NFBOS3ZoT0U4a0lweHQ0TzAxMklnYkFhOG5NanZsRE9ZNW1vWStZNVZTRW51?=
 =?utf-8?B?UjVyOXI4dTRIVDlodTk0S3RXMVdoM294VGZmVXFlK3BVZjhvL20xZnFqeEJG?=
 =?utf-8?B?QVBBbVBMaGhkL3VhNGphU0E2S1UrZlFJVDJFZkZRUzFKc1d3V3pXL29PTFZM?=
 =?utf-8?B?UDBnRzZaRThFNjZnTzZVWEI1QkFad1BvajMreDdkMTBsS2hHZlpPdFZjZGVD?=
 =?utf-8?B?MlorcklwWng2RkxNUTRlYWFpVWxaQVpyZ2VnNlB6NGFNTEp0Qy9zRURMQWZW?=
 =?utf-8?B?cjlveDgrSWhsb2xYYzQ5b0VxWnh1aUVCVmQ5Q3pEMllvRmJQODhtRm9BcThs?=
 =?utf-8?B?Ny9Ma0VlYmZta2srWVAwcFc1UUd3WC9GSGpwdXBUNnEyWXZGQ2orMFlTRWQ5?=
 =?utf-8?B?UTRtY216UDJuWEViZEp5T25MV2Z6eUdyVElBOUtNaUlrVlZrVmJOSjF1bFVC?=
 =?utf-8?B?bW5NTzBLa2RVRkhTQ2RveFh6UTh1aFFINXEzMFE4L29KU1RsWjhqZng3eXgx?=
 =?utf-8?B?VEN2VDl5N2p4ZDFZQnkxeVdhZ3lHOGtrZU9uQkM4Zzk4cDRERStBNmJWK3gy?=
 =?utf-8?B?Y2dyVWljTmNqWkFQUlhGREJXN0xFSytpQU01VmxmbGNPODV5MEJ1UzE3alA3?=
 =?utf-8?B?SzlhaDlCZU5IeFpQSGZpWDMvaENUV2lyYktOZzltM0Y1SFRFajAxRjdvRjZ0?=
 =?utf-8?B?eDlLa1ByKzNFZU1UUTBXV0lmZDhIMno0Z0o3c3RjZkN0RWxKZ1RHVi9JeGRQ?=
 =?utf-8?B?cXpVQXFIWW4xVE9FSzFXWGs4WERNb3ZsZnFwQmZIU1pSYmFGU2p1L3NZTmh5?=
 =?utf-8?B?Mk0yUlpRZGE1WFhnVmQ0Zm9OdU8rM0NlalBtZmhBaGdqTEhRYUEyZGxwaUJn?=
 =?utf-8?B?NmxsLzJuR3hFNzFsTlNDd1lwOW1Zajdud2FveHd1VDg5RGU0VUp6SXprNWNY?=
 =?utf-8?B?VW5pZ084YUdNWEorSWEyOUQ4SXZTQjdzbVBTUUVlbDVhd0RpYVVYemlFTGJG?=
 =?utf-8?B?bGYzZWxVcUkxZzhqNlozMEI3MGwrWno2dFdobGVxWE9qdGZMaVBaa0RVODhH?=
 =?utf-8?B?Y2Q5L3FPTXhsblVJMUcxNU5qNDk2UjNOS3k0OHRPdW1ORi94TUJqeitCbk1z?=
 =?utf-8?B?d0kxVGFKMXM5akN2TWZsaTNUS0ZLM0x2aG9rNUp6bjVQaWwyNXk0WFZOWjlz?=
 =?utf-8?B?cGtpMTYxZS9zbm92YUxGV0tFYjhXNkJpd3JtT0V1YmNwZ1NKK2RwSGJGNnMy?=
 =?utf-8?B?R3JJc3JPV2ZxNGtMcmlCaU1KYnNYY1dTdzJRTjdOMGw5OVZVT1Y2N3diRlMx?=
 =?utf-8?B?Y1BzUWJiQS85SUwydVo0WEZWeHdCalhyUkhqMVQ1ektlU1B3b1JJRzhsTkZV?=
 =?utf-8?B?MVgyQjR5a0F4MHVjTDdTYjhSbjV1NHozVlpLU3JEdEgxN0pIZ0RFci9DK1hh?=
 =?utf-8?B?L1hwd0dMckpUb1o5Vi9oZk1hUEdZc0oyMkJLeC9CQ2RBdWhBVjUzY2VLa2dj?=
 =?utf-8?B?VE9QMnkxZVd0UlZBejdLZFNaZmRRZWFxc0RyQnVZV1llQXdlbmJrZ1FScW1E?=
 =?utf-8?B?YldqSVh1VDlWUGFNL2NDU3dIcDZvaHQvV2lZVkpqS0xaMU5Xa1IvbDlCbHZi?=
 =?utf-8?B?bEFkMWc2NGZsQVl2Sjd5OTRtZmZSRm9GWWxyZHJ4QXdtSUVVVEFuQUtNUUE1?=
 =?utf-8?B?ZXlTTUl6Mld4QnFhM1UramMzYloyQ1JESXpTc2RPN0NCVk5xME9pZ2dBRG85?=
 =?utf-8?Q?PuPqogKEDXqBtV3o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5072e1e9-296b-48ef-7883-08de73b03b30
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:23:07.8477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpg2nzA930rJrV57iLzY3Jxp/SUlQZwKbJuJr9d82gaWotQub371q8dZZlcd5ehchI5VZCx5Y5MLW9Xc6O4OrD1+CjuXsJRHnY3vE74wly8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5937
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:email,arm.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 296E9188527
X-Rspamd-Action: no action

On 24/02/2026 2:17 pm, Andrew Cooper wrote:
> On 24/02/2026 2:14 pm, Orzel, Michal wrote:
>> On 24/02/2026 13:45, Andrew Cooper wrote:
>>> Now that the type handling is entirely uniform, it's easier to see that
>>> __declare_arg_3() can use __declare_arg_2() and so on, just like the larger
>>> __declare_arg_$()'s already do.
>>>
>>> No functional change.
>> This patch won't build.
>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>  xen/arch/arm/include/asm/smccc.h | 15 +++------------
>>>  1 file changed, 3 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
>>> index 5b30dd57b69d..347c4526d12a 100644
>>> --- a/xen/arch/arm/include/asm/smccc.h
>>> +++ b/xen/arch/arm/include/asm/smccc.h
>>> @@ -114,26 +114,17 @@ struct arm_smccc_res {
>>>  
>>>  #define __declare_arg_1(a0, a1, res)                        \
>>>      typeof(a1) __a1 = (a1);                                 \
>>> -    struct arm_smccc_res    *___res = (res);                \
>>> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
>>> +    __declare_arg_0(a0, res);                               \
>>>      register typeof(a1)     arg1 ASM_REG(1) = __a1
>>>  
>>>  #define __declare_arg_2(a0, a1, a2, res)                    \
>>>      typeof(a1) __a1 = (a1);                                 \
>> You should remove this line and ...
>>
>>> -    typeof(a2) __a2 = (a2);                                 \
>> keep this line.
>>
>>> -    struct arm_smccc_res    *___res = (res);                \
>>> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
>>> -    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
>>> +    __declare_arg_1(a0, a1, res);                           \
>>>      register typeof(a2)     arg2 ASM_REG(2) = __a2
>>>  
>>>  #define __declare_arg_3(a0, a1, a2, a3, res)                \
>>>      typeof(a1) __a1 = (a1);                                 \
>>> -    typeof(a2) __a2 = (a2);                                 \
>> Same here.
> Hmm - it built for me.  I'd better figure out why I missed it first.

Ah - a last minute refactor, and I didn't build test on this commit
boundary.

Fixed.  Thanks.

~Andrew

