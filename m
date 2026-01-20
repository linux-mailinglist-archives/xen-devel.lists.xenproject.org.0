Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNwQBS60b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D448239
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208878.1521007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBWt-0002Xt-Vg; Tue, 20 Jan 2026 13:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208878.1521007; Tue, 20 Jan 2026 13:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBWt-0002VZ-Sr; Tue, 20 Jan 2026 13:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1208878;
 Tue, 20 Jan 2026 13:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viBWs-0002Ip-Ij
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:12:18 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3e0cf2b-f601-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 14:12:16 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5678.namprd03.prod.outlook.com (2603:10b6:a03:2d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 13:12:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 13:12:12 +0000
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
X-Inumbo-ID: a3e0cf2b-f601-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNO2obZ4s+NF1tgTiqrYQo7qGkHVB1ZdBiIsrKVXmUEHT84OZsRVjafNeu6POUfNy942owf+F/cJVAi4aKsSWFiw0dFqbcouxIGfEseUZUFSB3n/3/qWorUoAKnobTgNpBQG5yaIKPqfpDbadA9BI/0jUFknAvinRVvMkBUDydBIqUT8b9A1fl3hB4cURJN20BE0dCZFDzY1aJ5KttmvvyEEM6XV0MtyGLhuMsF1ML/4j823rfEi3GFVWN2puL7EaH4ziHeO/OAi2TwW7KmwKf2rGRIbjRHym0hXbPleo8TJpFUV/f1O6kxTTUPYg461Fz+WnH5dACzyEwLoiF7qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyCajYi4UBGlA1x2vDE96X+W3jTH9wnPpNGsALWMpe0=;
 b=oC5JQ5FgA+uoK/4K99dT4/5pfbX8lpFV/XdXtaZ1YRZxPCNmWlltEo4D1saMeJax79h5fgPv6YpcSaBFj/qZZqlO1p6KzCM6fHVgNCU4sWnnOVpMLMhnDjAy8h6XShSJw8QUZTwy9UHJ0xt/HjEf7x9WIoO2uVaeZE+/bmmSWhONR/6fJuyy45Yt5ihCHLaoyhpMq4+nzn1rMIRxBAiXve96RA4uWZAhUPibbwsFevZodtYxO7eLsYfuFhCx4AixNFtYGJsosk91Rq1efgeB6bjvjCS6SWztQp3504BhI+bZdI6+ZQ+Sy2hnMWXHulDI/t45wHvs4EzhZu1hAcI38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyCajYi4UBGlA1x2vDE96X+W3jTH9wnPpNGsALWMpe0=;
 b=UuSUsOMJEu+cQqfXjIkliXMhv7JDOEP8RT59ZUzm3FORLLN2m7PKZsaL5bML2RieWVevvX9Kq5oYfxw7h8CPKP+X2PF2oL5lPu1KGxGc92qJuApaJgZzpFGWK9qd0TLt2lTHvkiD2s2MEC1T1D66SYnEfGroCZqGwTG4QIHDyMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <010b9a56-4e43-4813-b705-e34d8b4a67c5@citrix.com>
Date: Tue, 20 Jan 2026 13:12:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] x86/svm: Add infrastructure for Bus Lock Threshold
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0471.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a56578-d3d4-4d08-85d3-08de58258645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QU5xTGhweWxzaG5yTFQxZ3ROdU50OFRxWUg4RUZXTERaVFpOazVlWjMvNFcx?=
 =?utf-8?B?RWhCY1BSMmluTWJGUUFJWCtycnk0R2NQd3RlWmVobXhkU1EzUkdhcTMvTHFJ?=
 =?utf-8?B?QjZWMVBScWVEVzIzWXk0NVVlMm9UTmUzVWdhaDVvYjAyczRCZkl5cVY4T3lu?=
 =?utf-8?B?RGt4dC9kVUdLT2F1bWdqMnZwVjhZMERjTURMMDhVN1RpRnovTUpuQVpaVDZ4?=
 =?utf-8?B?RWJuWS9CN2pMcDVyY1JENUREblVUODVub05HWDl4UmlVU1hWYjdoZVVrVGpO?=
 =?utf-8?B?SU9iVzFOS2RwWkVXWHZ0UkoxTjVEeFpRNHYrVkF4YzFPOEE0Z2xBaFMzZENy?=
 =?utf-8?B?MXRobW9Kc01Qc1VEcG5kMDYxQng2Qm00THlSODlXZWpHRGxzVkQ1dnZQYkR2?=
 =?utf-8?B?S2hqcDBNL2tXd1ZIMWVHS1lrbDZDZkw2OWlNMGdLc1REQzRYWVpPNDI4ZkdC?=
 =?utf-8?B?cDlKNnNqd3dCR1VTZzg4aVdGclFjUS9DS1NjVHRsdkRCMXVmeXZBSFg0eUp4?=
 =?utf-8?B?Y3FuTkFsaGlUK1VxS2M4SkRqUUs1RmdETGxtVk9xaXFLWUNseVl6TDRhRHY3?=
 =?utf-8?B?MUJkWjRnZ2NNMXZCcFNMSjFuelJqbGF0SEtpcW5uYzdzVTlqRFlXUVhldlM1?=
 =?utf-8?B?ZjZsSVdzZFpNdzlrQWtpOGRYblErL1Fwa3hobGF5Zys1QzN0Q3Z5WDVGaHh4?=
 =?utf-8?B?WHRkSDg5VXhjQ0VHb3Z3NzJ4R0QwY3ZZcnFTalNrWEl3N1VUbjUxRzhkOHEw?=
 =?utf-8?B?dSt2SExmcHovWXlHYVJJL2xhT3RmOG1KYlpXODVOUEZaSWVMRXBMcWVieXZX?=
 =?utf-8?B?VUw2eHA5aW9pN2VhOUN3dkFCZjAyYWlEbk1NMFVUSGdmVldsaFRYQnJuWHcy?=
 =?utf-8?B?OXkwbzFGSVRqbVRZOWRRVEgvRXJCNzJLUktRVCtKM2xKQ0wvYkdXbFJXOWk3?=
 =?utf-8?B?cXBwZ0hJckpxSkhiU2dLd2lMUUJrV3pWdDVodjhEczZHTFg4L0pPRmFrUDRt?=
 =?utf-8?B?eTQ5ak83YVZQaityV1pqQXlYdHhuakNZOVVjK2NkQjk3ZzNzcXRWcGtKdCtu?=
 =?utf-8?B?YUdVNnhGbG0wcXlSSjZaVFAzcEJtV01MR1I5Qm5rSThyVDlodjN6Uk5Kblox?=
 =?utf-8?B?S29vWkwrYXVyNndnUnhucnB6anBPMWpHM2swd1NJN0kvbjl0NGw1b29CRTRO?=
 =?utf-8?B?Q2M5UGh4dXhUamtHT2gvQnVuTGtmVWx4K0NIYU5mdTFtSmZvc1g5ZURLZFo0?=
 =?utf-8?B?b3lGRUFWQkc1WHF0TWtmQzExTWZ1YTR6cE1KaXJ0SWd1VVZ4TUVhUmppOVZO?=
 =?utf-8?B?YTJ6TGRDelJVRFprNURUS0tncm9tb1JhOU8rT08vSFo0ZkRzMWJ4QUhqOXNk?=
 =?utf-8?B?NGZZUEgxcGo1cW9rNWx3bVB6V2xwb3hXcWRTNVh4T0ZUOVBWK3h3SjgwOVNz?=
 =?utf-8?B?c0xLNGl4SnRqQW1oVnZuR0ZxRGxqTEhPdDVDNTA4dlljTmtLVXIwMjlCbVdX?=
 =?utf-8?B?d2lLMDNNMDZodWlmbVdJbjFHUUFmV2NZMFVVZmp1T0VzQkFCNFVrS0t4UGR5?=
 =?utf-8?B?eitnTmc3aFRlM0tLR21XLzFkL2NOcVhNMVpwZjlwOHhxaGE4Ymo3czd6UFh4?=
 =?utf-8?B?bjZtVlpuL1kxd1dUekFZYzFjeHZoSjYydlRJdlBNQWF2L3Y0TlhjTENsb25C?=
 =?utf-8?B?KzU5YmhvYzEwd3ZtRCtFTlNCVDVkMzgvRGQzdDVlRi9LTFR2b0JaVHJnZzdJ?=
 =?utf-8?B?akx3UFg4L3cxM2ZHMlM3cm9WcXhLem8yamwyVE1RZWlhY0sxakR1ZnVMNTJa?=
 =?utf-8?B?cE1JYjRsYlBKS3l1ODNST2F0Z3VyaXhQazZPdWY4K244ZkhVeXVGWGhZOW5M?=
 =?utf-8?B?L2xvek53THRtdThwUXYzblZhTTZqQjZFdTFDM2QrQjM3emN4eW5seUdjWTBy?=
 =?utf-8?B?b2lqUElqSkRQejU4TTJUSmZQSHpWaUtGUjFSTHNMWTVjUFRNVUZ3SUl5K1Z3?=
 =?utf-8?B?OCtMSlBqT1hHYk5oemZYSDdyMk90ZVBjZkhuNXY3RitDajVwckhFL0dFZ1B6?=
 =?utf-8?B?UzZkQlg1QmwrZFJibTZ5Z2xJVjVydHp3aFovVDRJR0QxQTdvZDA2bHpxOHVm?=
 =?utf-8?Q?CSnU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRIVlB4T2NKd2NWZXdpN1l1SDJLQ1JvMTgwU1VrRVRGL1p3RktHaW5MYk5N?=
 =?utf-8?B?TW50cnk3S0gxbDRWN3dzOElrWEZaL2dLWm1KOHRFTzQzZEdkcUl2YVZDc3VG?=
 =?utf-8?B?UzBEQmYwOWZ2bUtyOWV5Z2FielROKzU5Zm9YV3dNZU5DV0s2bTdaZUtNME41?=
 =?utf-8?B?YWZzQW9XWXpRODFheTRjNHpJQTNHYWhzQTBpeVJTQmx6aXAraVYvcG9RUENi?=
 =?utf-8?B?VDNoOWkweWJBcEJ3aHE0T0YxRmdSbWs5VnFGWWFmKzB6a2VBTFVPZm1HdEdD?=
 =?utf-8?B?aWx6T0pWNHl6Rk1UOE1ROHgwZE5IVVczL0pNVldsUFZ0OWhGblpmS1NzUTVr?=
 =?utf-8?B?OHk4MmpoZklyWm5rT25DbEFqRTErSUYrQU9oOFVUcHkvS2NvQWhiVnJFanVk?=
 =?utf-8?B?M1kxMW91MVh5SCt4NXBRU2JKdDV6bWt3eHRGc3hVcklvcHZqQy9SekhwY2VR?=
 =?utf-8?B?UnVvMG1GZm1XWEdrOFNQaEQ2UnhBcUYxSHJtd2VBeGYwcXlhcmN3a3pvWjhm?=
 =?utf-8?B?b2FpWGhFNVVPbmQvcVN1Vkh5Y1hYQitLTi9XckVvM2laSVVqOCswb0NSek9I?=
 =?utf-8?B?UmFPWFo4VW9yZXlxenNjSms0UEQra0ttRGNGdzM5eDNzMWNWL1JLbWN6cGZR?=
 =?utf-8?B?TS96YTVOei9iZjZydXNPU3Z3SEIvVE5DK0N0d0Z4aXhKNGVaWnlVbjdmSkEz?=
 =?utf-8?B?WEt1UHYyWTNNUW5wSDY1RDIxNWlpcXV4enBWUjNCditvNGZkVkVlbjlQSm9J?=
 =?utf-8?B?ZDNCYlljUVJ4SmlWYUVkM09xT2Z1MlR0WW5BTS9UdHNCY1RDLyt6MG9CbFlM?=
 =?utf-8?B?L1grbkgrdFhXcUtEVUE0eWxMOCt5Mk1HNzNiaiswcXZheEYxV3pDc3h1dXVU?=
 =?utf-8?B?RlJrUk0rT01KNEZXUTBjTlFoYzErWDF2c3VNaG9JdFljQzJJZ1dRTjFDRXJn?=
 =?utf-8?B?czZCY0lTY09ESERXSWhZMXJyUGZmVnAydzV5TVYzckZlZFFPUStLajNCTzNt?=
 =?utf-8?B?Rlcxc1ZhUHpVY2tNcUJkL3FmaUZIaGpobmlFUlpsTWcwbkJQMUNBUDFaK0xE?=
 =?utf-8?B?ZCtXZXl2L2ppeXJMMzJITHFpMHBkZFZMRHAwUHRoRGhiNWxtc0hPL1Z4eFZv?=
 =?utf-8?B?RmVJbHlZVnVHZm84eWhDN1BNZ1drRnZRZVBzOWw2TEx0cEk1TytOWFBxN2xB?=
 =?utf-8?B?Uk1vbWpVSUJtZUZYbldnZkNBRHVqY0phRWRENG83RDFiQUI5ODBUZ0N1T1h3?=
 =?utf-8?B?NHE4RjdBSnlReElHeDNsVlVkamtRWS9RcTBiTDRYb1VYY3JBa2VTYWZpbUxX?=
 =?utf-8?B?RnV5bUdNSGZBTWpUaHErQ1dMc0VwOURiY1VHVkFxOEJFQndTSnlPWGh2bDU4?=
 =?utf-8?B?Uno2RmphZW4rcVlEc2ZZK0I5UDB2QUlDTmZPelZJYlIzRGpvUjhQczdQbFhB?=
 =?utf-8?B?cFZEL0lmUWFwN3o5cTVTZUNZekpKM0UrM3hBUlQ0QzdzODdsbS9ZWkIzc3JK?=
 =?utf-8?B?MWhvUmM3aGxMcU5wbTlrTDcxYjFSdThhRnJHZVNzanMyYWhuMXJJQnl2dSt2?=
 =?utf-8?B?SjFNMHJ0ZW9GakFxeFZub29JQ0hJcXF4ZXNzWTE0SlNBZmtqMCt2QVdxR1Fo?=
 =?utf-8?B?YURtR3ZMYzNES1QrYWRtRlc0OHlZVWpBM1BnMXdCWmJkZ0djNHBrMm11aGtj?=
 =?utf-8?B?ZG5WM0NqV1pwQWt2b2RmOXZBS3ZVVmVSVUNPMVlYc2p1K0dRd0pkd3F4eWFj?=
 =?utf-8?B?SUpSdVBtZkgxTFhpbnlsM0tsMmFObTNtazc4QXo2d2RiWGNOcHFKQmE5cEZq?=
 =?utf-8?B?Yy9rTFZXS2dCbjdQWnRCMVZRdHVBa09IY1BpVXBWTEVrNitOeHZTdkZxOFlI?=
 =?utf-8?B?azd1WVVhejI5VlZjK0JjNmZJVmJ2cjdoNXljbFJGMHpySkxSN0dENm52cTQw?=
 =?utf-8?B?QkRFdThwSzNZMUtIM0RXdTFJUnVxZzgwTXpTTG50aWtRcHZ3dkdUUmdqbnow?=
 =?utf-8?B?TTJFM1ZNbi9GR0ZTTGtDZXQwcmljZjNKaitJSHZhVmlnSmZndWdnckNHZkhO?=
 =?utf-8?B?RUhxSHBEK29ZbWlJb2pkZU9kY3VZRDhielBkUW9qbDJianlFZ0pTcmdObm9C?=
 =?utf-8?B?RElEb1lPb0tZVFJBTlU3VmxacVl5WitoY0s1NlV0a0FhbTVRbzMwVEVVaXlH?=
 =?utf-8?B?cW8wMDdtYlluZXZtam1hdUk5YytMbzFYNHp3bU5FQjRPejlpalVvSXlGaVFm?=
 =?utf-8?B?Q21VOWN6Z3prR2RBaVFWRU9iaUs5MzJVb0xkZWJtYVRrdFNPV05CVTAxL3Vl?=
 =?utf-8?B?dFY4cDUvM3QxOUZMam1lZWZmb0RRVjczWG9LMmZtSDBjZnc5UVhUZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a56578-d3d4-4d08-85d3-08de58258645
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:12:12.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiDLka+YJ9phB2wThiuciRlRu3MjTeF4kGX69CBlqygLxn3dtGcsQOXXxKV+o/uE2Bn8tIQuQDSGGI4Pta0vPz1qpYTPjmZ+BacjMhW5Bc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5678
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BC6D448239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> index ba554a9644..85e194f247 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>      GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
>  };
>  
> +/* general 2 intercepts */
> +enum GenericIntercept3bits
> +{
> +    GENERAL3_INTERCEPT_BUS_LOCK_THRESH = 1 << 5,
> +};

Abbreviating thresh like this not great.

For the intercept, it can probably just be called BUS_LOCK.  There's no
other form of such intercept.

>  
>  /* control register intercepts */
>  enum CRInterceptBits
> @@ -289,6 +294,7 @@ enum VMEXIT_EXITCODE
>      VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
>      VMEXIT_XSETBV           = 141, /* 0x8d */
>      VMEXIT_RDPRU            = 142, /* 0x8e */
> +    VMEXIT_BUSLOCK          = 165, /* 0xa5 */

VMEXIT_BUS_LOCK for consistency.

>      /* Remember to also update VMEXIT_NPF_PERFC! */
>      VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
>      /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
> @@ -405,7 +411,8 @@ struct vmcb_struct {
>      u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
>      u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
>      u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
> -    u32 res01[10];
> +    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
> +    u32 res01[9];
>      u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
>      u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
>      u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
> @@ -489,7 +496,10 @@ struct vmcb_struct {
>      u64 nextrip;                /* offset 0xC8 */
>      u8  guest_ins_len;          /* offset 0xD0 */
>      u8  guest_ins[15];          /* offset 0xD1 */
> -    u64 res10a[100];            /* offset 0xE0 pad to save area */
> +    u64 res10a[8];              /* offset 0xE0 */
> +    u16 bus_lock_thresh;        /* offset 0x120 */

bus_lock_count, which is basically it's APM name anyway.

> diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
> index a6d7e4aed3..14fe4abf96 100644
> --- a/xen/arch/x86/include/asm/hvm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm.h
> @@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
>  #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
>  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
> +#define SVM_FEATURE_BUS_LOCK_THRESH 29 /* Bus Lock Threshold */
>  
>  static inline bool cpu_has_svm_feature(unsigned int feat)
>  {
> @@ -56,6 +57,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
>  #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
>  #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
>  #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
> +#define cpu_has_bus_lock_thresh cpu_has_svm_feature(SVM_FEATURE_BUS_LOCK_THRESH)

We actually discussed this on the x86 call just yesterday.  This wants
an svm infix to match the others, and the thresh suffix can be dropped.

I can fix all of these on commit.

~Andrew

