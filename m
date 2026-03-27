Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCitBO92xmnwKgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:24:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B543442A1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265537.1556395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66EH-0004sS-HW; Fri, 27 Mar 2026 12:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265537.1556395; Fri, 27 Mar 2026 12:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66EH-0004px-D7; Fri, 27 Mar 2026 12:23:57 +0000
Received: by outflank-mailman (input) for mailman id 1265537;
 Fri, 27 Mar 2026 12:23:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w66EF-0004pd-M3
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:23:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w66ED-002Vx6-G3
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:23:55 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69c676c8-2eae-0a2a0a5409dd-0a2a45019b56-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:23:54 +0100
Received: from [52.101.69.126]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69c676da-6400-0a2a45010019-3465457e30ac-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:23:54 +0100
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by VI2PR03MB10690.eurprd03.prod.outlook.com
 (2603:10a6:800:27a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 12:23:52 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 12:23:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns6VKo4Qa4zt5n2ciNJEI2Aedd4e5Ttyg089tvjX+LKT5C2GAg9ArM5ZkWIaSCpGRvA6UrC4Sh51XtUJD3ngorwq4VCjwVcAhUmOQmU3smP7wDesUJD4iAB8szyhMeBfc/vi0aPnbTI6fZeUcRd6J8Fdpb8oAQh9NWzgWj94TuEnpQNcsM8BXprJDjMdPXxXcY56QBnonps0jNyh+k7OVsUailPOzOM8DYF4NYzrvx7LlOidcWMSpRUHMs4vVLePiduu9HnfY3qM6eVZ5GrwjM3JR4G24wkMoYryJFazVZ4jkeyQ+xThVzhIHAwWOzvWXL+XCMQQLzHYhLDWDb9vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRi63K1VTk+7L+b9SJ6aDUmJBiPrKSQmdvGIsQImC14=;
 b=oAdR+qjblF0LkqgVeB6v7Okkjd1QJQK4r8vnPpVZqA50JxpZ4h5Vin9Mp6B+Tlgowm+2gqKotA80zAncuFdevqdestw/J6wC6zf96hVOYa6Pc+1mKLvX2W3sbzyYbNteyhKufPvGtbxC477T+iS9o02/eGGMqM1inc2SP8GjNkD039LKFQY23e4Hm/LHO3qmV9ZLPSaAGSwi/8ZHjz5GxyW1Fj7p5iRasrdY3fqUZG3v5vcpGGm9oDHIQdxDCgNAwJCLRLPLZ7ZSJ8b0I5092N+BAusKRwYD3cnVcDHC7taWnKrfzZ5+eCzIb+pz40BgunL3gzOizVDgTV4twWfBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRi63K1VTk+7L+b9SJ6aDUmJBiPrKSQmdvGIsQImC14=;
 b=tb0ew6JUXU9M2LMrz2LrvxqRx6FG3d+Ixgc/uStFufNoNNCJUrhjZdTFyWIEACseAcj7W2HHgS37Pva74MdUemPIu5OH6lIRDd7VaIZ4ceG4vwXMKdRJXA4aMWj0xSsHkCFKynin2F6lXrJtlDPh8y0YBdRBf4nmW6zBuwULzM2/Ng1bNQDNlnnpOyaN8P3ujJz/RwTIDlfjzylRu45kSWfb0SAORRWlZuB/Qn0ffiA5Tok71GqPzI375BlerkGPmrFbjDJIyG/yFHJ9dMaLvEes7XZlQC50IR2zJ9e4uQSqClDDKggbu8Fq5WrqQqF3sHoW8GoSx6UcAXYgWvWOVg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
Thread-Topic: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
Thread-Index: AQHcvSKiuRz6O/EU8kCzrBnRPjf187XBBxoAgAAlNICAANCdgIAAUd4A
Date: Fri, 27 Mar 2026 12:23:52 +0000
Message-ID: <89782bb0-d910-49b8-9a7d-83c3cf38d442@epam.com>
References: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
 <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
 <7d52cf29-c0bb-4e39-ae10-2b43f3e8e921@epam.com>
 <618e3227-10c7-46e4-9328-3d7d981fddfa@amd.com>
In-Reply-To: <618e3227-10c7-46e4-9328-3d7d981fddfa@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|VI2PR03MB10690:EE_
x-ms-office365-filtering-correlation-id: baf4de94-ddb8-4464-2a53-08de8bfbb4eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 ubTNKAttg7IP/Q3tXa+YxKzqHo+yr1lx4YqLsRDrZ/i0IzyVBnsA1d/g1OVD6974pEIwEryarp6CV4vQFHdxcoNlwH6PWfZMJ1pW+hQkPLpRV2pqOEflrleQsiGZ3LKII3pvnQmV+8/bDJqZN76TjByu/yt+KX9VebhjDz35MBHVaq8FkWhSOuFwBZNfOZCQUPQ1ru1KXXNzWC8bCIg7mFECsGxntu/xZR8dpinAnTGJDuTZXVhwOfpnyQkBLTYfdcUOckJuUCgJ6gEOdjKlkpeSygw9sc9YbUpuFcX2Oa5F5jYeNFzfU6abp6jNGBLmv4kpYc3058FyjJe6h1gPik18K+n2I2WGHt8NOR1l46wKHvSvFjiRW+vBGG8Bw2/V2d+HiJUI0A4R29JWz2IWfmRMR4rZiidq5AYq3wE5smnoz/N8o590Cj5v02aU1A3CiAWpUS314CQ7ev1RYScmFIXIDXYdBZt85+Ny8aD2FNoROckkeoQZDpTM1j6LjPTDhBYOFYaZGVuPElxK+DwB6rsBhT/mF9u5JOqj19nDnmeoMs2a7/VuTa1BujPYR60IEr/sB31qP/ql6nq5/qjnxazPN3qjONrtkPoW9kb2YJCS4+VseKI/SOmm+tb6RbDATYljJgl0WgQ5qT13gWY0JTHY1Ek+JVy4lYMWzKGoCYaZVBpm1bBbGP0uCVunWRXZKbm8yt1QTKXJxwR0NAZjHDptOM5OZtidVuMZVUfwJ3nsRgFeeyr+1aYftwUPADxk+OVjinlemZMvsD1ZlS/4//UwDRBJ9PX3AqfUtCgP0U0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjA4bmpOUW1Gc1pGUXpwcDl4TUFuNjlhN09rRVA1aDN4dlRwUko4cHVEcWtz?=
 =?utf-8?B?c2ZqOWw2SnZTbGpSWWkrS1FCRlpxN2ZZSnpCbVNOaThNUWY1K2ZaUGRqeGZ3?=
 =?utf-8?B?cXF0WURRWm9EZTcvMXBrQ1dKZXp0bzRhTHI4cko5L215ZGdwY3BHMWJYYjY4?=
 =?utf-8?B?V3NlY0JtRVVMeDJ1SmlwckhhN0h4aGJNQmR6NWZLMVJUdW5IM2g0SXNHQmls?=
 =?utf-8?B?NGhXZjRDRnBqQVI3UUpZRzNDcUI0Wm13bWdaUFlWbHMwazYyOWZJeDJXdUYx?=
 =?utf-8?B?VVRSdVVmTWR3VVNPYmhVNy9xSjE2TEg3bVg0dzNIOHlGaFBiQkFieWFZR1Jj?=
 =?utf-8?B?NkhMbWxGeHB4VVlISWdSMTRYUVB1UmpkSHhubkRHVFYyQUpTekNKMklHNmIx?=
 =?utf-8?B?aU5ZUitaOXRIMGMxUlVabkNCRE51QzdNRmo4MFJlYVd6VmdYa0Y3Vk9aT3V2?=
 =?utf-8?B?QlZ1UnE0NGV1NjFxS0JaL0FXNzNxQkZuRVN1N1ZPbjJIVy9wQ09OVjFud3Z5?=
 =?utf-8?B?KzBmcXQrZXljWFdMM1VRVThsdC85ZTJLSTJKQ2dkRWJwR1dRK1lld2VGUStw?=
 =?utf-8?B?QUlGcTlKa2ZvMWhMZFlNRlNpbTM4NnQ5OXJDNnpsUmFJdlM2VGpia3JIajMv?=
 =?utf-8?B?QTZiUjRMbjhoazZIeUE3bGcza0FwR2VkczdXc0pnOUdXcUtxd3NuZU13ZGtv?=
 =?utf-8?B?RWtFTmNtNjBSZGhRelA3eFFxd1dlWENNeW5TOEJueFV4VTlxM0JEYzVHL0hl?=
 =?utf-8?B?KzRIeGxaSm9MVTdweEZ1VldKU3Jxdzhqb2NNUEdGeGJWODNiMm44UGpua2l2?=
 =?utf-8?B?dy9DUDBUbEZWOUdaNFQ0bWNCaUZqZ3EyV0ZQWjlvRDU1YWttc3FPeTNYTm92?=
 =?utf-8?B?akJ0VFVPc3NjMEpyRjRLVFFSUk5zb0ptQzRnUkEzS2E0T284b0cxRUZNSlJL?=
 =?utf-8?B?ZHJWU3B3aXQycFpEaDhLM0FTeEQzbHpWN3hZa1hyQms0eHFCczArM2NmajA2?=
 =?utf-8?B?dUdaMlQybzZQYjB5TFJYclJmYTNQQUZJM3VqclUzTGFTb1BONncvZ3VOaFNr?=
 =?utf-8?B?Vk1ta3IzS2JkeTlHd09mM2o2TURwNEZMZjJLeFBqWUNCVXgzQlpQbVQycWFM?=
 =?utf-8?B?OFU2bjRSRUVDajBlV2laVXFtN2kxYy83RHhPbzdWMTdiaXpyTVh2NUpCSTVO?=
 =?utf-8?B?M2FudE05YVVENllpMGhwN21kMmplWEtWa0Fqd2QyWXpMOTdtN2V1aU9neHNj?=
 =?utf-8?B?RWE3SlBlMkdjWXMwNHJPejRKd3BEc0tmdUhjWEhxc0FpOTlnSEdmdHMybzNQ?=
 =?utf-8?B?ZTFmYnVDUXJmbEV6cVlLbkc3cWFaMjg1MVlPY2RoMnJkZnljc1E3YWROaFhy?=
 =?utf-8?B?K2pGaGwxQXdaOVJOOGZjdWVObngwVU93RWsxOUt2bHZjZVhmV1hQeFN3aDUw?=
 =?utf-8?B?WUFxdVJtTDFOb1g1WVNVZEljZnorMGFxVzZqYmdlMjMzdjhlUDZCMFIwdVVk?=
 =?utf-8?B?dnN2WEFrMDdqRC9kdUxzUUxxZjU4VmljLzNOL3oyLzVEWU1rNnhxWXlPdGhJ?=
 =?utf-8?B?ZnJtNnhESWt0TmFmWUlwTHE5ZU9OV2x1RTl4N3k1emhwbzFzOEZKY0dkNnJS?=
 =?utf-8?B?NEk1TUVsV2VHdUtkN096WldUd0l2Y0E0NmRYY2ZCUWNPNnpNMUl4d1dJd1Z4?=
 =?utf-8?B?bWdpb2pyRGlDZmpRT1A4R1hTdWJIdnVLZDJ3ajM0bG80K2tpd2JERVF6U1B2?=
 =?utf-8?B?R1NOckpmcFhwcllEdHB4YVpGVnhNRDUvZXM0WnRYME1aNWRyeDFPbGt0MWlk?=
 =?utf-8?B?K0J4ZWZJMFNDanRmaU1oQzJwb2VaWko1aHpyZ0pPem1MTVE5NWo3RlNCdTFn?=
 =?utf-8?B?akZkWU4wWTNFS3gxS2wwNm9WaGo4ZlZlc0d5WG9UZk9nRHJSTUlubC9sVk5a?=
 =?utf-8?B?a1VLRDZ1Tk5lcE1MS3BxSlJPSmhhYmlkQjBEdkJGY1UzL1hVRHhVVjNtVGVu?=
 =?utf-8?B?RlhrTG43MjkvRkhxblpYM1NRTEtCeGtoTFdrTFNBRHRCS28vRkswNDlLSS9B?=
 =?utf-8?B?N3h3bVFiVWZBeTlINXJNbUlxMmJpcytvS2pMRjkrMjdiUHJKRkM3d3dEZTEy?=
 =?utf-8?B?dkhRd1l3bHhsbmdSVCtTRjVwQkZ6R2xxVnJZazFLM09VM0FVMFFhd2x1anYx?=
 =?utf-8?B?RHhURWMrMkVrazlLRW93R0RQMXIvWVQxTlY1NU1oSlZQVG0yaGNZSWF2Vm9I?=
 =?utf-8?B?ZFpFUUNMRTBLdDZmMWp6TEp0UVNkbkNUSVNtZ2hhWnJVNHBZVHB2OUkyNVdp?=
 =?utf-8?B?aEdsRURwVUZLWml4OUFmaUNxdTRhZWM4TmM0YW04Q0FybHk3alFoQlpQMW5C?=
 =?utf-8?Q?JvseheHACaB60MsJu7hpHvEh6+5hhm0RR4rCA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D6D582A68987E4D8168716F7CC1BC37@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf4de94-ddb8-4464-2a53-08de8bfbb4eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 12:23:52.1481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IhG7BDeLrKpNC/Tp8uBP4OF59KIyAhktlAxZbAKiP397c5oRvQxYir9ORqQO3IjbCAerIDUzVCGj9tXmcdD6Xrao9dKg8ZbD/EAqDH9xkNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10690
X-purgate-ID: tlsNG-d62444/1774614234-8E0F9DF3-3F59934C/0/0
X-purgate-type: clean
X-purgate-size: 12144
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 53B543442A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDMvMjcvMjYgMDk6MzAsIE9yemVsLCBNaWNoYWwgd3JvdGU6DQoNCkhlbGxvIE1pY2hh
bA0KDQo+IA0KPiANCj4gT24gMjYvMDMvMjAyNiAyMDowMywgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDMvMjYvMjYgMTg6NTAsIE9yemVsLCBNaWNoYWwgd3JvdGU6
DQo+Pg0KPj4gSGVsbG8gTWljaGFsDQo+Pg0KPj4+DQo+Pj4NCj4+PiBPbiAyNi8wMy8yMDI2IDE0
OjE1LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+Pj4gWGVuIGZhaWxzIHRvIGNvbnN0
cnVjdCB0aGUgaGFyZHdhcmUgZG9tYWluJ3MgZGV2aWNlIHRyZWUgd2l0aA0KPj4+PiBGRFRfRVJS
X05PU1BBQ0UgKC0zKSB3aGVuIHRoZSBob3N0IG1lbW9yeSBtYXAgaXMgaGlnaGx5IGZyYWdtZW50
ZWQNCj4+Pj4gKGUuZy4sIG51bWVyb3VzIHJlc2VydmVkIG1lbW9yeSByZWdpb25zKS4NCj4+Pj4N
Cj4+Pj4gVGhpcyBvY2N1cnMgYmVjYXVzZSBET00wX0ZEVF9FWFRSQV9TSVpFIHVuZGVyZXN0aW1h
dGVzIHRoZSBzcGFjZQ0KPj4+PiByZXF1aXJlZCBmb3IgdGhlIGdlbmVyYXRlZCBleHRyYSAvbWVt
b3J5IG5vZGUuIG1ha2VfbWVtb3J5X25vZGUoKQ0KPj4+IFdoZXJlIGRvZXMgdGhpcyBleHRyYSAv
bWVtb3J5IG5vZGUgY29tZSBmcm9tPyBJZiB0aGlzIGlzIGZvciBub3JtYWwgcmVzZXJ2ZWQNCj4+
PiBtZW1vcnkgcmVnaW9ucywgdGhleSBzaG91bGQgYmUgcHJlc2VudCBpbiB0aGUgaG9zdCBkdGIg
YW5kIHRoZXJlZm9yZSBhY2NvdW50ZWQNCj4+PiBieSBmZHRfdG90YWxzaXplICh0aGUgaG9zdCBk
dGIgc2hvdWxkIGhhdmUgcmVzZXJ2ZWQgcmVnaW9ucyBkZXNjcmliZWQgaW4gL21lbW9yeQ0KPj4+
IGFuZCAvcmVzZXJ2ZWQtbWVtb3J5LiBBcmUgeW91IHRyeWluZyB0byBhY2NvdW50IGZvciBzdGF0
aWMgc2htIHJlZ2lvbnM/DQo+Pg0KPj4NCj4+IEkgbWlnaHQgaGF2ZSBtaXN1bmRlcnN0b29kIHNv
bWV0aGluZywgYnV0IGhlcmUgaXMgbXkgYW5hbHlzaXM6DQo+Pg0KPj4gVGhlIGV4dHJhIC9tZW1v
cnkgbm9kZSBpcyBnZW5lcmF0ZWQgYnkgWGVuIGl0c2VsZiBpbiBoYW5kbGVfbm9kZSgpIC0+DQo+
PiBtYWtlX21lbW9yeV9ub2RlKCkgKHBsZWFzZSByZWZlciB0byB0aGUgaWYgKCByZXNlcnZlZF9t
ZW0tPm5yX2JhbmtzID4gMA0KPj4gKSBjaGVjaykuDQo+Pg0KPj4gRXZlbiB0aG91Z2ggdGhlIG5v
cm1hbCByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhcmUgcHJlc2VudCBpbiB0aGUgaG9zdA0KPj4g
RFRCIChhbmQgdGh1cyBhY2NvdW50ZWQgZm9yIGluIGZkdF90b3RhbHNpemUpLCBYZW4gZ2VuZXJh
dGVzIGEgbmV3DQo+PiAvbWVtb3J5IG5vZGUgc3BlY2lmaWNhbGx5IGZvciB0aGUgaGFyZHdhcmUg
ZG9tYWluIHRvIGRlc2NyaWJlIHRoZXNlDQo+PiByZWdpb25zIGFzIHJlc2VydmVkIGJ1dCBwcmVz
ZW50IGluIHRoZSBtZW1vcnkgbWFwLiBBbmQgc2luY2UgdGhpcyBub2RlDQo+PiBpcyBnZW5lcmF0
ZWQgYXQgcnVudGltZSAoaXQgaXMgbm90IGEgZGlyZWN0IGNvcHkgZnJvbSB0aGUgaG9zdCBEVEIp
LA0KPj4gaXRzIHNpemUgbXVzdCBiZSBjb3ZlcmVkIGJ5IERPTTBfRkRUX0VYVFJBX1NJWkUuDQo+
IFllcywgYnV0IHRoZSBvcmlnaW5hbCBEVEIgc2hvdWxkIGFsc28gaGF2ZSB0aGVzZSByZXNlcnZl
ZCByZWdpb25zIGRlc2NyaWJlZCBpbg0KPiAvbWVtb3J5IG5vZGVzLCB0aHVzIHRha2luZyB1cCBz
b21lIHNwYWNlIHRoYXQgaXMgYWxyZWFkeSBhY2NvdW50ZWQgaW4NCj4gZmR0X3RvdGFsc2l6ZS4g
QXJlIHlvdSB0cnlpbmcgdG8gc2F5IHRoYXQgaW4gaG9zdCBEVEIsIHRoZXNlIHJlc2VydmVkIHJh
bmdlcyBmaXQNCj4gbmljZWx5IGludG8gZS5nLiBhIHNpbmdsZSAvbWVtb3J5IG5vZGUgcmFuZ2Ug
KGkuZS4gYSBzaW5nbGUgcmVnIHBhaXIgY292ZXJpbmcNCj4gbW9zdCBvZiB0aGUgUkFNKT8NCg0K
eWVzDQoNCg0KICBJIGNhbiBzZWUgdGhhdCBpdCBtaWdodCBiZSBwb3NzaWJsZSBidXQgdGhlIGNv
bW1pdCBtc2cgbmVlZHMNCj4gdG8gYmUgY2xlYXIgYWJvdXQgaXQuIEFzIG9mIG5vdywgaXQgcmVh
ZHMgYXMgaWYgdGhlIHByb2JsZW0gb2NjdXJlZCBhbHdheXMgd2hlbg0KPiB0aGVyZSBhcmUgbXVs
dGlwbGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMuIFRoYXQncyBub3QgdHJ1ZSBpZiBhIGhvc3Qg
RFRCDQo+IGdlbmVyYXRlcyBvbmUgL21lbW9yeSBwZXIgb25lIC9yZXNlcnZlZC4NCg0KWWVzLCB5
b3UgYXJlIGNvcnJlY3QgdGhhdCB0aGUgdG90YWwgc2l6ZSBkZXBlbmRzIG9uIGhvdyB0aGUgaG9z
dCBEVEIgaXMgDQpzdHJ1Y3R1cmVkIGNvbXBhcmVkIHRvIGhvdyBYZW4gcmVnZW5lcmF0ZXMgaXQg
YXQgcnVudGltZS4gU28sIHRoZSBpc3N1ZSANCmNhbiBhcmlzZSBpZiBob3N0IERUQiByZXByZXNl
bnRzIFJBTSB1c2luZyBhIHNpbmdsZSwgbGFyZ2UgcmVnIGVudHJ5IG9yIA0KYSBmZXcgZW50cmll
cy4NCg0KKioqDQoNCkkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGNsYXJpZnkg
dGhhdCwgc29tZXRoaW5nIGxpa2UgYmVsb3c6DQoNClhlbiBmYWlscyB0byBjb25zdHJ1Y3QgdGhl
IGhhcmR3YXJlIGRvbWFpbidzIGRldmljZSB0cmVlIHdpdGgNCkZEVF9FUlJfTk9TUEFDRSAoLTMp
IHdoZW4gdGhlIGhvc3QgbWVtb3J5IG1hcCBpcyBoaWdobHkgZnJhZ21lbnRlZA0KKGUuZy4sIG51
bWVyb3VzIHJlc2VydmVkIG1lbW9yeSByZWdpb25zKSBhbmQgdGhlIGhvc3QgRFRCIHJlcHJlc2Vu
dHMNClJBTSBjb21wYWN0bHkgKGUuZy4sIGEgc2luZ2xlIHJlZyBwYWlyIG9yIGp1c3QgYSBmZXcp
Lg0KDQpUaGlzIG9jY3VycyBiZWNhdXNlIERPTTBfRkRUX0VYVFJBX1NJWkUgdW5kZXJlc3RpbWF0
ZXMgdGhlIHNwYWNlDQpyZXF1aXJlZCBmb3IgdGhlIGdlbmVyYXRlZCBleHRyYSAvbWVtb3J5IG5v
ZGUuIFdoaWxlIHRoZSBob3N0IERUQg0KbWlnaHQgcmVwcmVzZW50IFJBTSBjb21wYWN0bHksIG1h
a2VfbWVtb3J5X25vZGUoKSBhZ2dyZWdhdGVzDQphbGwgcmVzZXJ2ZWQgcmVnaW9ucyBpbnRvIGEg
c2luZ2xlIHJlZyBwcm9wZXJ0eS4NCldpdGggTlJfTUVNX0JBTktTICgyNTYpIGFuZCA2NC1iaXQg
YWRkcmVzcy9zaXplIGNlbGxzLCB0aGlzIHByb3BlcnR5DQpjYW4gZ3JvdyB1cCB0byA0S0IgKDI1
NiAqIDE2KSwgZWFzaWx5IGV4Y2VlZGluZyB0aGUgc3BhY2Ugb3JpZ2luYWxseQ0Kb2NjdXBpZWQg
YnkgdGhlIGhvc3QgRFRCJ3Mgbm9kZXMgcGx1cyB0aGUgY3VycmVudCBwYWRkaW5nLCB0aGVyZWJ5
DQpvdmVyZmxvd2luZyB0aGUgYWxsb2NhdGVkIGJ1ZmZlci4NCg0KDQo+IA0KPiBBbm90aGVyIGlz
c3VlIGlzIHdpdGggdGhlIHN0YXRpYyBzaG0gbm9kZXMuIFVzZXIgc3BlY2lmaWVzIHRoZSByZWdp
b25zIGluIHRoZQ0KPiBkb21haW4gY29uZmlndXJhdGlvbiBhbmQgWGVuIGNyZWF0ZXMgKmFkZGl0
aW9uYWwqIG5vZGVzIHVuZGVyIC9yZXNlcnZlZCBhbmQNCj4gL21lbW9yeSB0aGF0IGFmYWljdCB3
ZSBkb24ndCBhY2NvdW50IGZvci4NCg0KWWVzLCB5b3UgYXJlIHJpZ2h0Lg0KDQpTaW5jZSB0aGVz
ZSBTSE0gc3ViLW5vZGVzIGFuZCBwcm9wZXJ0aWVzIGFyZSBnZW5lcmF0ZWQgcHVyZWx5IGZyb20g
dGhlIA0KWGVuIGRvbWFpbiBjb25maWd1cmF0aW9uIGFuZCBhcmUgbm90IHByZXNlbnQgaW4gdGhl
IGhvc3QgRFRCLCB0aGV5IGhhdmUgDQp6ZXJvIHNwYWNlIGFsbG9jYXRlZCBmb3IgdGhlbSBpbiBm
ZHRfdG90YWxzaXplLg0KDQpTbyB3ZSBuZWVkIHRvIHJlZGVmaW5lIHRoZSBtYWNyby4gSSBwcm9w
b3NlIHRoZSBmb2xsb3dpbmcgZm9ybXVsYSB0aGF0IA0Kc2VwYXJhdGVzIHRoZSByYW5nZSBkYXRh
ICgxNiBieXRlcyBwZXIgYmFuayBpbiAvbWVtb3J5KSBmcm9tIHRoZSBub2RlIA0Kb3ZlcmhlYWQg
KDE2MCBieXRlcyBwZXIgU0hNIHJlZ2lvbik6DQoNCiNkZWZpbmUgRE9NMF9GRFRfRVhUUkFfU0la
RSAoMTI4ICsgc2l6ZW9mKHN0cnVjdCBmZHRfcmVzZXJ2ZV9lbnRyeSkgKyBcDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIChOUl9NRU1fQkFOS1MgKiAxNikgKyAgICAgICAgICAgICAgICAg
ICAgXA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoTlJfU0hNRU1fQkFOS1MgKiAxNjAp
KQ0KDQoqKioNCkkgd2lsbCBhcHBlbmQgdGhlIGZvbGxvd2luZyB0ZXh0IGZvciB0aGUgY29tbWl0
IG1lc3NhZ2U6DQoNCkFkZGl0aW9uYWxseSwgU0hNIHJlZ2lvbnMgcmVxdWlyZSBzcGFjZSBmb3Ig
ZGlzY3JldGUgc3ViLW5vZGVzIHVuZGVyIA0KL3Jlc2VydmVkLW1lbW9yeS4gRWFjaCBvZiB0aGUg
dXAgdG8gTlJfU0hNRU1fQkFOS1MgKDMyKSByZWdpb25zIHRyaWdnZXJzIA0KdGhlIGNyZWF0aW9u
IG9mIGEgc3ViLW5vZGUgd2l0aCBwcm9wZXJ0aWVzIChjb21wYXRpYmxlLCByZWcsIHhlbixpZCwg
YW5kIA0KeGVuLG9mZnNldCkuIFRoZXNlIHJ1bnRpbWUtZ2VuZXJhdGVkIHN1Yi1ub2RlcyByZXF1
aXJlIGFwcHJveGltYXRlbHkgMTYwIA0KYnl0ZXMgZWFjaCwgZnVydGhlciBjb25zdW1pbmcgdGhl
IGFsbG9jYXRlZCBidWZmZXIgc3BhY2UuDQoNCkZpeCB0aGlzIGJ5IGluY3JlYXNpbmcgRE9NMF9G
RFRfRVhUUkFfU0laRSB0byBhY2NvdW50IGZvciBib3RoDQpmcmFnbWVudGVkIHJlZyBwcm9wZXJ0
aWVzIChOUl9NRU1fQkFOS1MgKiAxNikgdW5kZXIgZXh0cmEgL21lbW9yeQ0Kbm9kZSBhbmQgdGhl
IGluamVjdGlvbiBvZiBkaXNjcmV0ZSBTSE0gc3ViLW5vZGVzIHVuZGVyIC9yZXNlcnZlZC1tZW1v
cnkgDQpub2RlIChOUl9TSE1FTV9CQU5LUyAqIDE2MCkuDQoNClBsZWFzZSB0ZWxsIG1lLCBkb2Vz
IGl0IGxvb2sgb2s/DQoNCg0KPiANCj4+DQo+PiBGb3IgdGhlIGluc3RhbmNlLCAxMCByZXNlcnZl
ZCByZWdpb25zOg0KPj4NCj4+IChYRU4pIFJBTTogMDAwMDAwMDA0MDAwMDAwMCAtIDAwMDAwMDAw
N2ZmZmZmZmYNCj4+IChYRU4pDQo+PiAoWEVOKSBNT0RVTEVbMF06IDAwMDAwMDAwNDMyMDAwMDAg
LSAwMDAwMDAwMDQzMzBhZmZmIFhlbg0KPj4gKFhFTikgTU9EVUxFWzFdOiAwMDAwMDAwMDQzNDAw
MDAwIC0gMDAwMDAwMDA0MzQwMmZmZiBEZXZpY2UgVHJlZQ0KPj4gKFhFTikgTU9EVUxFWzJdOiAw
MDAwMDAwMDQyZTAwMDAwIC0gMDAwMDAwMDA0MzE2OTA3ZiBSYW1kaXNrDQo+PiAoWEVOKSBNT0RV
TEVbM106IDAwMDAwMDAwNDA0MDAwMDAgLSAwMDAwMDAwMDQyZDJmZmZmIEtlcm5lbA0KPj4gKFhF
TikgIFJFU1ZEWzBdOiAwMDAwMDAwMDQwMDA5MDAwIC0gMDAwMDAwMDA0MDAwOWZmZg0KPj4gKFhF
TikgIFJFU1ZEWzFdOiAwMDAwMDAwMDQwMDA4MDAwIC0gMDAwMDAwMDA0MDAwOGZmZg0KPj4gKFhF
TikgIFJFU1ZEWzJdOiAwMDAwMDAwMDQwMDA3MDAwIC0gMDAwMDAwMDA0MDAwN2ZmZg0KPj4gKFhF
TikgIFJFU1ZEWzNdOiAwMDAwMDAwMDQwMDA2MDAwIC0gMDAwMDAwMDA0MDAwNmZmZg0KPj4gKFhF
TikgIFJFU1ZEWzRdOiAwMDAwMDAwMDQwMDA1MDAwIC0gMDAwMDAwMDA0MDAwNWZmZg0KPj4gKFhF
TikgIFJFU1ZEWzVdOiAwMDAwMDAwMDQwMDA0MDAwIC0gMDAwMDAwMDA0MDAwNGZmZg0KPj4gKFhF
TikgIFJFU1ZEWzZdOiAwMDAwMDAwMDQwMDAzMDAwIC0gMDAwMDAwMDA0MDAwM2ZmZg0KPj4gKFhF
TikgIFJFU1ZEWzddOiAwMDAwMDAwMDQwMDAyMDAwIC0gMDAwMDAwMDA0MDAwMmZmZg0KPj4gKFhF
TikgIFJFU1ZEWzhdOiAwMDAwMDAwMDQwMDAxMDAwIC0gMDAwMDAwMDA0MDAwMWZmZg0KPj4gKFhF
TikgIFJFU1ZEWzldOiAwMDAwMDAwMDQwMDAwMDAwIC0gMDAwMDAwMDA0MDAwMGZmZg0KPj4gLi4u
DQo+Pg0KPj4gICBGcm9tIG1ha2VfbWVtb3J5X25vZGUoKToNCj4+DQo+PiAoWEVOKSBDcmVhdGUg
bWVtb3J5IG5vZGUNCj4+IChYRU4pICAgQmFuayAwOiAweDUwMDAwMDAwLT4weDcwMDAwMDAwDQo+
PiAoWEVOKSAocmVnIHNpemUgNCwgbnIgY2VsbHMgNCkNCj4+DQo+Pg0KPj4NCj4+IChYRU4pIENy
ZWF0ZSBtZW1vcnkgbm9kZQ0KPj4gKFhFTikgICBCYW5rIDA6IDB4NDAwMDkwMDAtPjB4NDAwMGEw
MDANCj4+IChYRU4pICAgQmFuayAxOiAweDQwMDA4MDAwLT4weDQwMDA5MDAwDQo+PiAoWEVOKSAg
IEJhbmsgMjogMHg0MDAwNzAwMC0+MHg0MDAwODAwMA0KPj4gKFhFTikgICBCYW5rIDM6IDB4NDAw
MDYwMDAtPjB4NDAwMDcwMDANCj4+IChYRU4pICAgQmFuayA0OiAweDQwMDA1MDAwLT4weDQwMDA2
MDAwDQo+PiAoWEVOKSAgIEJhbmsgNTogMHg0MDAwNDAwMC0+MHg0MDAwNTAwMA0KPj4gKFhFTikg
ICBCYW5rIDY6IDB4NDAwMDMwMDAtPjB4NDAwMDQwMDANCj4+IChYRU4pICAgQmFuayA3OiAweDQw
MDAyMDAwLT4weDQwMDAzMDAwDQo+PiAoWEVOKSAgIEJhbmsgODogMHg0MDAwMTAwMC0+MHg0MDAw
MjAwMA0KPj4gKFhFTikgICBCYW5rIDk6IDB4NDAwMDAwMDAtPjB4NDAwMDEwMDANCj4+IChYRU4p
IChyZWcgc2l6ZSA0LCBuciBjZWxscyA0MCkNCj4+DQo+Pj4NCj4+Pj4gYWdncmVnYXRlcyBhbGwg
cmVzZXJ2ZWQgcmVnaW9ucyBpbnRvIGEgc2luZ2xlIHJlZyBwcm9wZXJ0eS4gV2l0aA0KPj4+PiBO
Ul9NRU1fQkFOS1MgKDI1NikgYW5kIDY0LWJpdCBhZGRyZXNzL3NpemUgY2VsbHMsIHRoaXMgcHJv
cGVydHkNCj4+Pj4gY2FuIGdyb3cgdXAgdG8gNEtCICgyNTYgKiAxNiksIGVhc2lseSBvdmVyZmxv
d2luZyB0aGUgYWxsb2NhdGVkDQo+Pj4+IGJ1ZmZlci4NCj4+Pj4NCj4+Pj4gRml4IHRoaXMgYnkg
aW5jcmVhc2luZyBET00wX0ZEVF9FWFRSQV9TSVpFIHRvIGFjY291bnQgZm9yDQo+Pj4+IHRoZSB3
b3JzdC1jYXNlIHNpemU6IE5SX01FTV9CQU5LUyAqIDE2IGJ5dGVzLg0KPj4+Pg0KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBh
bS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBKdXN0IHRvIGJlIGNsZWFyLCBJIGhhdmUgbm90IHNlZW4g
YSByZWFsLXdvcmxkIGlzc3VlIHdpdGggdGhpcy4NCj4+Pj4gVGhlIGlzc3VlIHdhcyBvYnNlcnZl
ZCBkdXJpbmcgdGVzdGluZyBvZiBsaW1pdCBjb25kaXRpb25zLg0KPj4+PiBXaXRoIHRoaXMgcGF0
Y2ggYXBwbGllZCwgWGVuIHN1Y2Nlc3NmdWxseSBib290cyB0aGUgaGFyZHdhcmUgZG9tYWluLA0K
Pj4+PiBleHBvc2luZyAyNTYgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgdG8gaXQgKHVzaW5nIGEg
c3ludGhldGljYWxseQ0KPj4+PiBnZW5lcmF0ZWQgY29uZmlndXJhdGlvbikuDQo+Pj4+IC0tLQ0K
Pj4+PiAtLS0NCj4+Pj4gICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNiArKysrLS0N
Cj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+PiBpbmRleCBlODc5NTc0NWRkLi43ZjlmMGY1
NTEwIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+IEBAIC0xMDAsOSArMTAwLDEx
IEBAIGludCBfX2luaXQgcGFyc2VfYXJjaF9kb20wX3BhcmFtKGNvbnN0IGNoYXIgKnMsIGNvbnN0
IGNoYXIgKmUpDQo+Pj4+ICAgIC8qDQo+Pj4+ICAgICAqIEFtb3VudCBvZiBleHRyYSBzcGFjZSBy
ZXF1aXJlZCB0byBkb20wJ3MgZGV2aWNlIHRyZWUuICBObyBuZXcgbm9kZXMNCj4+PiBUaGlzIGNv
bW1lbnQgd291bGQgd2FudCB0byBiZSB1cGRhdGVkIGJlY2F1c2Ugc2luY2UgaXRzIGludHJvZHVj
dGlvbiB0aGluZ3MgaGF2ZQ0KPj4+IGNoYW5nZWQuIEV2ZW4gdGhlIDEyOCBjYW1lIHVwIGFzIGEg
cmVzdWx0IG9mIGFkZGluZyAvaHlwZXJ2aXNvciBub2RlLg0KPj4NCj4+IFlvdSBhcmUgcmlnaHQu
IEkgc3VnZ2VzdCB0aGUgZm9sbG93aW5nIHdvcmRpbmc6DQo+Pg0KPj4gQW1vdW50IG9mIGV4dHJh
IHNwYWNlIHJlcXVpcmVkIHRvIGRvbTAncyBkZXZpY2UgdHJlZS4NCj4+IFRoaXMgY292ZXJzIG5v
ZGVzIGdlbmVyYXRlZCBieSBYZW4sIHdoaWNoIGFyZSBub3QgZGlyZWN0bHkgY29waWVkDQo+PiBm
cm9tIHRoZSBob3N0IERUQi4gSXQgaXMgY2FsY3VsYXRlZCBhczoNCj4+ICAgIC0gU3BhY2UgZm9y
IC9oeXBlcnZpc29yIG5vZGUgKDEyOCBieXRlcykuDQo+PiAgICAtIE9uZSB0ZXJtaW5hdGluZyBy
ZXNlcnZlIG1hcCBlbnRyeSAoMTYgYnl0ZXMpLg0KPj4gICAgLSBTcGFjZSBmb3IgYSBnZW5lcmF0
ZWQgbWVtb3J5IG5vZGUgY292ZXJpbmcgYWxsIHBvc3NpYmxlIHJlc2VydmVkDQo+PiAgICAgIG1l
bW9yeSByZWdpb25zIChOUl9NRU1fQkFOS1MgKiAxNiBieXRlcykuDQo+Pg0KPj4NCj4+Pg0KPj4+
PiAgICAgKiBhcmUgYWRkZWQgKHlldCkgYnV0IG9uZSB0ZXJtaW5hdGluZyByZXNlcnZlIG1hcCBl
bnRyeSAoMTYgYnl0ZXMpIGlzDQo+Pj4+IC0gKiBhZGRlZC4NCj4+Pj4gKyAqIGFkZGVkLiBQbHVz
IHNwYWNlIGZvciBhbiBleHRyYSBtZW1vcnkgbm9kZSB0byBjb3ZlciBhbGwgcG9zc2libGUgcmVz
ZXJ2ZWQNCj4+Pj4gKyAqIG1lbW9yeSByZWdpb25zICgyIGFkZHIgY2VsbHMgKyAyIHNpemUgY2Vs
bHMpLg0KPj4+PiAgICAgKi8NCj4+Pj4gLSNkZWZpbmUgRE9NMF9GRFRfRVhUUkFfU0laRSAoMTI4
ICsgc2l6ZW9mKHN0cnVjdCBmZHRfcmVzZXJ2ZV9lbnRyeSkpDQo+Pj4+ICsjZGVmaW5lIERPTTBf
RkRUX0VYVFJBX1NJWkUgKDEyOCArIHNpemVvZihzdHJ1Y3QgZmR0X3Jlc2VydmVfZW50cnkpICsg
XA0KPj4+PiArICAgIChOUl9NRU1fQkFOS1MgKiAxNikpDQo+Pj4+ICAgIA0KPj4+PiAgICB1bnNp
Z25lZCBpbnQgX19pbml0IGRvbTBfbWF4X3ZjcHVzKHZvaWQpDQo+Pj4+ICAgIHsNCj4+Pg0KPj4+
IH5NaWNoYWwNCj4+Pg0KPiANCj4gfk1pY2hhbA0KPiANCj4gDQo=

