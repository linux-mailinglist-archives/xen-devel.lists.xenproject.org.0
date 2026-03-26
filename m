Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iUAeKFaDxWmM+wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:04:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F833AAAC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264697.1556095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5pzr-0002ia-Sq; Thu, 26 Mar 2026 19:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264697.1556095; Thu, 26 Mar 2026 19:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5pzr-0002fX-Pj; Thu, 26 Mar 2026 19:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1264697;
 Thu, 26 Mar 2026 19:03:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w5pzq-0002fR-5q
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5pzn-00HY7F-SZ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 20:03:57 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69c582f4-5cb7-0a2a0a5109dd-0a2a450ac992-44
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:03:57 +0100
Received: from [40.107.130.88]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69c5831c-1772-0a2a450a0019-286b82580f01-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:03:57 +0100
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by PA4PR03MB7389.eurprd03.prod.outlook.com
 (2603:10a6:102:be::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 19:03:55 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 19:03:54 +0000
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
 b=y1hOPlrnJ+TKqAeNQrQneonaVMnuGH05ZW2mI6LaeSq16hhKwNZSoLeNe2wPhcpYTgnJgFVixIzpQkvRAV0B+J1WXfc5v+O1V97QvSR/0XiHxgLwkPUI07eKbsEycXcpR8bHIYO1/XKk/WUQlD90cBTagWqFX0yIi0dL3uEMeOMIVm+PyhGmNgwMLptYQquWBTl4imZQ0KhnIOr+OxVJIBNB63IioqH+z+4KEuvYdBfArg708yU6mxiweK3BET3lbYx0erDOjPEtjEUjzJDed5OD+q7ElIJA/VajQD5w3xKRb6Rrk0QuwhiZ14y6qEo5DL+27eROVDD3k/aM1anPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMdUdBfSw1KZwrKOD+g64NVOANA5HuqmzSPMj2dbWII=;
 b=keb+p5WF+6Sy4VGSN42r87PyqxVwxL/46T4R5UHJcMSm2BOFIozSPhdUzGTMTJzNGgRCCj4IKHv7sgtfBYy7JdEgZiKckMHCoSFePYaoBZ3XuPA5X6SObr9bM/cCX7Ifl6dcUAydxB2LBikZ9qxREXDY0fPd0MR6fL4z9OcZNodqALPwfD62ECoNJ5mX1p3jQXliJwlyTyOSFsRi7raUfjvBU4lUSzH0oYyWrz9UBeSNFhCOuV6XkJCHBAbWXJh4E1Jjo63VnuCpzh5ISG0S7l5ENayawDP2wpdf5cXwAu6nBpvJqBnqVriXqGaQvOyR+GITw8S4vTkBzbjV1uhAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMdUdBfSw1KZwrKOD+g64NVOANA5HuqmzSPMj2dbWII=;
 b=sivdl4q9nPrQxxDxNlCcStITu8x8OHy08oJWUPHIYCVLzTkn9DXWqSXIb4CkPUNiQ8sfapTE7+7FOcsHsNwN+6DLxgf4u4EhtqTeKJocztFwGc+Yg+hJJ46SEtZHJ/32JIOcgz9AgDrtGW83WyEthNxO3dMDE3IQ1+QxjE8y6AKNv5BFd2Y7dzULdDD2MIJOXN6Fsc1V6bqXbyc7YHu56AhqGRXQE7fp+w55qeVDQegjXMhVpQmjZvY5LYNwSe/WeephaWJ8635NmBESUILENPaq9rZXz3kGZYJ23IujB6wWgvqAHpwzD1s01CJ62Ifjp6xpvM01j/Nea7ynubTsDA==
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
Thread-Index: AQHcvSKiuRz6O/EU8kCzrBnRPjf187XBBxoAgAAlNIA=
Date: Thu, 26 Mar 2026 19:03:54 +0000
Message-ID: <7d52cf29-c0bb-4e39-ae10-2b43f3e8e921@epam.com>
References: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
 <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
In-Reply-To: <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|PA4PR03MB7389:EE_
x-ms-office365-filtering-correlation-id: dc7e1db5-44ba-4686-6aa2-08de8b6a6cd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 q7Qtc2SDyCf6ANSAUhvrg8/2Kk3k0dpsatp2U5C90qe/SiwIwFdZrRwT8A/w40fjrpt7ZyCB61uvi8/sGcFwRZvn9ITHkNAiBjeYGocS5zcW51G4thfMcB1uORZ5Ctrwg/BLD3RZdtgn6+80NCgnUdXr7qe19A2t/7PZjVs+2/zMybX66HLDeSyiCV1DAhaoEpx+cAOjGgHzx/FMes4FDHvrUnNfDmLWVGCj68obRkyKajbDmdoJUPlez3BpzgHXRrfosUGFvwkCwbGJ+8OKQfJ1++gxyB2Oj/HWv5e6+dIrVcmlCWV+T2q5yWGx0q7eU847YvAP/VThk5qc7yU0/4hFF4wtiq+h5jXWoWQq0/j/DasrItXrgZ1l2I142M1Xpx+0FwZzlnqIui2tegXIeZj/lM26cnUNE7Su5FQ+eFFCqwnYlsV5CPRbF28VzkrW5SXmukz/BipYfadFvfHRQfZtoarciq2z0z1kky86+rHLCGQKRn4ty0xWnjkCASdlqYltqnoqSyiuugE5ueiocatIDNaDveDjphg9CeLnqvtr8l310hQpB20LawZw89HceMxQLIJxwCZHxTLHRccm+hhvpbZXSFb2GNm5yEBQ8S6DEeQO9Sk53h0h+N2SndbFRQstO+hIhpSNA5yqbESfVRmPiCOdv/Bo/ccjzv7ivMRCOqrf96rTOlkncZUGrui3D6MLFcUayJdkh8avGNvCFRyyu0mD0eW1QAg6CMhImGHl4d3/jG/QoDymurxcvVXX0Rew1+SxXJrjpB4DvnyKxxrlIsvkkLdDl8rPLlsipKo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzhnS3l1M3ZYeEkzelhHKytoR2JFMDloVnZYKzdaUmZma0c3dHJXR2ZOdS9s?=
 =?utf-8?B?UzNhRUp5QjVUN2Q5Y0wwdnpwbTJ1L2FPR0E2d3FFYlVyTmQxbnhqVVJ0V0VC?=
 =?utf-8?B?ZGJmTmpycWJHdUJmcUZoUjNmKzNFdXQycThTT3FON0kyL2JmZVkvU1JsRnI2?=
 =?utf-8?B?SGtLRkZMTkhnWHo1UUxwQ0hac3BJVTBYUlFoS0pqWlJKSmVpcVo5elZFeFF5?=
 =?utf-8?B?NWVQYnA5SXNHYWFFdWQ2M0llOXIrQVJsaGMybG41VmorMzJ4OVJCTThRQlpW?=
 =?utf-8?B?dWNJamZ0NDViS1FnMnVOUm56d2tpUmVkTlkzb094QXQ3aGkxVHB1N1VrSVRo?=
 =?utf-8?B?T1NlT0xoUmsrZEE5T0l6b3lHUFlWeVhidnljNGVQc3FJSjZqRW1XQ1dUWnBk?=
 =?utf-8?B?M2phT1BmY2MrRDl1WWUyT3Q5U25YYkd4R3U3KzlRZEJyQVJNRWJwWTgvNHRw?=
 =?utf-8?B?MWgraTVJMFhRbU9uMVVVbzJ3N0lFYzJGRFpsZ2wzNU9WVHltY3hLQ1dTUEQ5?=
 =?utf-8?B?QkFkWjFRNlc1L0wvZnBzTGROOGZtMHJBd2ZaM1BjYUdNek9wRlB5RTkvcmgy?=
 =?utf-8?B?cFVNazZrcFRoZlRJejVTMWhBelp1RlJxZkhGbDgxV2VxRWdoODZrY3NZTGZv?=
 =?utf-8?B?OXNCN0NlRHRFTk1iNmVWVGdpd3FhTit6OW9Xb2xINm9BV25GSkZkc3NEQ1Zz?=
 =?utf-8?B?UWZ5dGwzK0RONmN2OWhhR2haNzBjQTlKbXloTXUzU3RYelJOSTNTRjVQQXEr?=
 =?utf-8?B?aW9qMGlPWHBtZHZmRTNFbEQ5SlNBT1lJOFFaa1EwUG9OY1UrRFNRRXhFTUJi?=
 =?utf-8?B?SFd2elNDcUN5Vm5jRkkyaUkxYTladENyS3dZOXE5UzV5eThzODljWTA1M3Zx?=
 =?utf-8?B?UnVpem5NZFJFQmFkTGkra3J4RE8yRFlRd1ZoUGNvd2xqdFRBWmxBT2YxSkJK?=
 =?utf-8?B?WEMzaFE3YW1nM2JGU3QxN1FuQ1RORWR4amk5aFRFRWxmamtEaEM1dm5TWHkw?=
 =?utf-8?B?QThpVmpWUGFWaWNVYVVSZTZRN2Y5M3VqTXlUaFRWNE1aTkhvaUxWaVlkaXNp?=
 =?utf-8?B?a25GNzRSMUFSaFd4OE5zMFNCZlB4STRLM0NTWS91dHQ0TmxaVTd3dCtTTjVY?=
 =?utf-8?B?QnYxQmNFbG42SUo2VC9GdVFaZjQ5WU01bU5DWGRuU29oK2JpTUlVNk9KejhP?=
 =?utf-8?B?bFU3SlpNdDI4TUdWa1NWUkRGYWllME9HS2trUVg4cVRxcmQ4S1VFaDNTT0xL?=
 =?utf-8?B?a2hmME8xT3FjQXhWb09LTjU5b0U4Sk14RHd3aDNKM0Nhb2ZBSzlSclpPQzAr?=
 =?utf-8?B?dCtDaWx1YzByc2drK2hVK1dsaTdhdFlrUG5kZXQxUEkwUXNlOU1QVWxGZGM1?=
 =?utf-8?B?U0FsL1M1eDZTeHpPN0JTRUVEYmtQZ2l1NzFxUXVrMnp5dHZYdGh0T0J5UlVO?=
 =?utf-8?B?dWFqZ1cwbmoxSVY5YkRqV0orMjhDcHcwVDh6eDVSbDUxYjNrUDdxWDY3cnMx?=
 =?utf-8?B?WFV6VmV5UDUxNnBVd2lBazBRa0sweDEyUEh3dStNNkh2MkR5UWd5VjBhcTFs?=
 =?utf-8?B?Yks0N20yUWdMUlBZMXBXNk5hd01nNGxOZ21yZy93eHpCMnIza2tsdUQ5Z0VL?=
 =?utf-8?B?MGJZbm1TUnB2UGhTbXVGVGd4TFg4YzVxbDBUYUZ1NW92K2NrRVkzWWRlVEd2?=
 =?utf-8?B?cTczVlhMbHFjZFkrUW9TcytFMDlwYjdURkFTTDFVOGlYcm95VlJvTlRiTEhi?=
 =?utf-8?B?a1pycVJ5ZVYzcmZBWTNhNE5YL1JvSjNZaEJoeEtXTm5vRngreEM2WmhJUzM0?=
 =?utf-8?B?YjhkYkM1T1c2Z0dkL2lJQjhDeDl3MCtaRE44UE0xZjRkdGxHLzBnVCtEdzhr?=
 =?utf-8?B?clpZOGJoY0ViQ2pwdzFrT09Ic1FLZTVnLzAzTUNZTElsN3diRE5pMmZHdWRv?=
 =?utf-8?B?cEQxMlI1VzlVS2E3QmRFUms1aFp2NkwyaXYzNkppOUJLU3ExeFhROXhmTkgz?=
 =?utf-8?B?VlZ5c1BLTmkxYUlDN2QrcTFNZFNVS0lkaEZqaG9wZTIwWlF5TFNuNHlQekkz?=
 =?utf-8?B?bVFodjZtdTcvUy9VdGd4b1RuL25KK3BTM3dDK1BqNjNSMlNIdWpvZFg1Nk5p?=
 =?utf-8?B?dkFjOUJxME9zMGgxQXZLbEVVbC8zM3hRWkpaNWV2ZWpmMm9hSzUrNlJmYWJq?=
 =?utf-8?B?d09GRktUTHBWQWdLczhYRmlQUnI0dStHYStCbzdPR1A3U1RBU1g3UHJWVkZG?=
 =?utf-8?B?aDRKZjRpbFhlaCtLdFB0UHo0b2lSWVJaelBwM3cxdVBjcWNLZjBXZWNMbldr?=
 =?utf-8?B?MTUxQ3YwYU91emt0amsyWUY0UlZUN2c0OEJ0ZUNDcnVEM3prdUV5VlV4bHEx?=
 =?utf-8?Q?7Zh7TyO0dKbZyORo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EDB62C06DA1F649991864E05012CE54@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7e1db5-44ba-4686-6aa2-08de8b6a6cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 19:03:54.0857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5sqih/T75Dy2Kliyly3pvIRZpgVKOia20iYyZOY9fSySgLrPgy6B0rI3etfZowLITLpBufoHDOhkTIEzYH7V2jhLJi5abVKiKqB/Tx6GEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7389
X-purgate-ID: tlsNG-4011c0/1774551837-52E95900-96ED9117/0/0
X-purgate-type: clean
X-purgate-size: 7108
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid];
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
X-Rspamd-Queue-Id: 0C9F833AAAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDMvMjYvMjYgMTg6NTAsIE9yemVsLCBNaWNoYWwgd3JvdGU6DQoNCkhlbGxvIE1pY2hh
bA0KDQo+IA0KPiANCj4gT24gMjYvMDMvMjAyNiAxNDoxNSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6DQo+PiBYZW4gZmFpbHMgdG8gY29uc3RydWN0IHRoZSBoYXJkd2FyZSBkb21haW4ncyBk
ZXZpY2UgdHJlZSB3aXRoDQo+PiBGRFRfRVJSX05PU1BBQ0UgKC0zKSB3aGVuIHRoZSBob3N0IG1l
bW9yeSBtYXAgaXMgaGlnaGx5IGZyYWdtZW50ZWQNCj4+IChlLmcuLCBudW1lcm91cyByZXNlcnZl
ZCBtZW1vcnkgcmVnaW9ucykuDQo+Pg0KPj4gVGhpcyBvY2N1cnMgYmVjYXVzZSBET00wX0ZEVF9F
WFRSQV9TSVpFIHVuZGVyZXN0aW1hdGVzIHRoZSBzcGFjZQ0KPj4gcmVxdWlyZWQgZm9yIHRoZSBn
ZW5lcmF0ZWQgZXh0cmEgL21lbW9yeSBub2RlLiBtYWtlX21lbW9yeV9ub2RlKCkNCj4gV2hlcmUg
ZG9lcyB0aGlzIGV4dHJhIC9tZW1vcnkgbm9kZSBjb21lIGZyb20/IElmIHRoaXMgaXMgZm9yIG5v
cm1hbCByZXNlcnZlZA0KPiBtZW1vcnkgcmVnaW9ucywgdGhleSBzaG91bGQgYmUgcHJlc2VudCBp
biB0aGUgaG9zdCBkdGIgYW5kIHRoZXJlZm9yZSBhY2NvdW50ZWQNCj4gYnkgZmR0X3RvdGFsc2l6
ZSAodGhlIGhvc3QgZHRiIHNob3VsZCBoYXZlIHJlc2VydmVkIHJlZ2lvbnMgZGVzY3JpYmVkIGlu
IC9tZW1vcnkNCj4gYW5kIC9yZXNlcnZlZC1tZW1vcnkuIEFyZSB5b3UgdHJ5aW5nIHRvIGFjY291
bnQgZm9yIHN0YXRpYyBzaG0gcmVnaW9ucz8NCg0KDQpJIG1pZ2h0IGhhdmUgbWlzdW5kZXJzdG9v
ZCBzb21ldGhpbmcsIGJ1dCBoZXJlIGlzIG15IGFuYWx5c2lzOg0KDQpUaGUgZXh0cmEgL21lbW9y
eSBub2RlIGlzIGdlbmVyYXRlZCBieSBYZW4gaXRzZWxmIGluIGhhbmRsZV9ub2RlKCkgLT4gDQpt
YWtlX21lbW9yeV9ub2RlKCkgKHBsZWFzZSByZWZlciB0byB0aGUgaWYgKCByZXNlcnZlZF9tZW0t
Pm5yX2JhbmtzID4gMCANCikgY2hlY2spLg0KDQpFdmVuIHRob3VnaCB0aGUgbm9ybWFsIHJlc2Vy
dmVkIG1lbW9yeSByZWdpb25zIGFyZSBwcmVzZW50IGluIHRoZSBob3N0IA0KRFRCIChhbmQgdGh1
cyBhY2NvdW50ZWQgZm9yIGluIGZkdF90b3RhbHNpemUpLCBYZW4gZ2VuZXJhdGVzIGEgbmV3IA0K
L21lbW9yeSBub2RlIHNwZWNpZmljYWxseSBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiB0byBkZXNj
cmliZSB0aGVzZSANCnJlZ2lvbnMgYXMgcmVzZXJ2ZWQgYnV0IHByZXNlbnQgaW4gdGhlIG1lbW9y
eSBtYXAuIEFuZCBzaW5jZSB0aGlzIG5vZGUgDQppcyBnZW5lcmF0ZWQgYXQgcnVudGltZSAoaXQg
aXMgbm90IGEgZGlyZWN0IGNvcHkgZnJvbSB0aGUgaG9zdCBEVEIpLA0KaXRzIHNpemUgbXVzdCBi
ZSBjb3ZlcmVkIGJ5IERPTTBfRkRUX0VYVFJBX1NJWkUuDQoNCkZvciB0aGUgaW5zdGFuY2UsIDEw
IHJlc2VydmVkIHJlZ2lvbnM6DQoNCihYRU4pIFJBTTogMDAwMDAwMDA0MDAwMDAwMCAtIDAwMDAw
MDAwN2ZmZmZmZmYNCihYRU4pDQooWEVOKSBNT0RVTEVbMF06IDAwMDAwMDAwNDMyMDAwMDAgLSAw
MDAwMDAwMDQzMzBhZmZmIFhlbg0KKFhFTikgTU9EVUxFWzFdOiAwMDAwMDAwMDQzNDAwMDAwIC0g
MDAwMDAwMDA0MzQwMmZmZiBEZXZpY2UgVHJlZQ0KKFhFTikgTU9EVUxFWzJdOiAwMDAwMDAwMDQy
ZTAwMDAwIC0gMDAwMDAwMDA0MzE2OTA3ZiBSYW1kaXNrDQooWEVOKSBNT0RVTEVbM106IDAwMDAw
MDAwNDA0MDAwMDAgLSAwMDAwMDAwMDQyZDJmZmZmIEtlcm5lbA0KKFhFTikgIFJFU1ZEWzBdOiAw
MDAwMDAwMDQwMDA5MDAwIC0gMDAwMDAwMDA0MDAwOWZmZg0KKFhFTikgIFJFU1ZEWzFdOiAwMDAw
MDAwMDQwMDA4MDAwIC0gMDAwMDAwMDA0MDAwOGZmZg0KKFhFTikgIFJFU1ZEWzJdOiAwMDAwMDAw
MDQwMDA3MDAwIC0gMDAwMDAwMDA0MDAwN2ZmZg0KKFhFTikgIFJFU1ZEWzNdOiAwMDAwMDAwMDQw
MDA2MDAwIC0gMDAwMDAwMDA0MDAwNmZmZg0KKFhFTikgIFJFU1ZEWzRdOiAwMDAwMDAwMDQwMDA1
MDAwIC0gMDAwMDAwMDA0MDAwNWZmZg0KKFhFTikgIFJFU1ZEWzVdOiAwMDAwMDAwMDQwMDA0MDAw
IC0gMDAwMDAwMDA0MDAwNGZmZg0KKFhFTikgIFJFU1ZEWzZdOiAwMDAwMDAwMDQwMDAzMDAwIC0g
MDAwMDAwMDA0MDAwM2ZmZg0KKFhFTikgIFJFU1ZEWzddOiAwMDAwMDAwMDQwMDAyMDAwIC0gMDAw
MDAwMDA0MDAwMmZmZg0KKFhFTikgIFJFU1ZEWzhdOiAwMDAwMDAwMDQwMDAxMDAwIC0gMDAwMDAw
MDA0MDAwMWZmZg0KKFhFTikgIFJFU1ZEWzldOiAwMDAwMDAwMDQwMDAwMDAwIC0gMDAwMDAwMDA0
MDAwMGZmZg0KLi4uDQoNCiBGcm9tIG1ha2VfbWVtb3J5X25vZGUoKToNCg0KKFhFTikgQ3JlYXRl
IG1lbW9yeSBub2RlDQooWEVOKSAgIEJhbmsgMDogMHg1MDAwMDAwMC0+MHg3MDAwMDAwMA0KKFhF
TikgKHJlZyBzaXplIDQsIG5yIGNlbGxzIDQpDQoNCg0KDQooWEVOKSBDcmVhdGUgbWVtb3J5IG5v
ZGUNCihYRU4pICAgQmFuayAwOiAweDQwMDA5MDAwLT4weDQwMDBhMDAwDQooWEVOKSAgIEJhbmsg
MTogMHg0MDAwODAwMC0+MHg0MDAwOTAwMA0KKFhFTikgICBCYW5rIDI6IDB4NDAwMDcwMDAtPjB4
NDAwMDgwMDANCihYRU4pICAgQmFuayAzOiAweDQwMDA2MDAwLT4weDQwMDA3MDAwDQooWEVOKSAg
IEJhbmsgNDogMHg0MDAwNTAwMC0+MHg0MDAwNjAwMA0KKFhFTikgICBCYW5rIDU6IDB4NDAwMDQw
MDAtPjB4NDAwMDUwMDANCihYRU4pICAgQmFuayA2OiAweDQwMDAzMDAwLT4weDQwMDA0MDAwDQoo
WEVOKSAgIEJhbmsgNzogMHg0MDAwMjAwMC0+MHg0MDAwMzAwMA0KKFhFTikgICBCYW5rIDg6IDB4
NDAwMDEwMDAtPjB4NDAwMDIwMDANCihYRU4pICAgQmFuayA5OiAweDQwMDAwMDAwLT4weDQwMDAx
MDAwDQooWEVOKSAocmVnIHNpemUgNCwgbnIgY2VsbHMgNDApDQoNCj4gDQo+PiBhZ2dyZWdhdGVz
IGFsbCByZXNlcnZlZCByZWdpb25zIGludG8gYSBzaW5nbGUgcmVnIHByb3BlcnR5LiBXaXRoDQo+
PiBOUl9NRU1fQkFOS1MgKDI1NikgYW5kIDY0LWJpdCBhZGRyZXNzL3NpemUgY2VsbHMsIHRoaXMg
cHJvcGVydHkNCj4+IGNhbiBncm93IHVwIHRvIDRLQiAoMjU2ICogMTYpLCBlYXNpbHkgb3ZlcmZs
b3dpbmcgdGhlIGFsbG9jYXRlZA0KPj4gYnVmZmVyLg0KPj4NCj4+IEZpeCB0aGlzIGJ5IGluY3Jl
YXNpbmcgRE9NMF9GRFRfRVhUUkFfU0laRSB0byBhY2NvdW50IGZvcg0KPj4gdGhlIHdvcnN0LWNh
c2Ugc2l6ZTogTlJfTUVNX0JBTktTICogMTYgYnl0ZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4g
LS0tDQo+PiBKdXN0IHRvIGJlIGNsZWFyLCBJIGhhdmUgbm90IHNlZW4gYSByZWFsLXdvcmxkIGlz
c3VlIHdpdGggdGhpcy4NCj4+IFRoZSBpc3N1ZSB3YXMgb2JzZXJ2ZWQgZHVyaW5nIHRlc3Rpbmcg
b2YgbGltaXQgY29uZGl0aW9ucy4NCj4+IFdpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCBYZW4gc3Vj
Y2Vzc2Z1bGx5IGJvb3RzIHRoZSBoYXJkd2FyZSBkb21haW4sDQo+PiBleHBvc2luZyAyNTYgcmVz
ZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgdG8gaXQgKHVzaW5nIGEgc3ludGhldGljYWxseQ0KPj4gZ2Vu
ZXJhdGVkIGNvbmZpZ3VyYXRpb24pLg0KPj4gLS0tDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgNiArKysrLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiBpbmRleCBl
ODc5NTc0NWRkLi43ZjlmMGY1NTEwIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IEBAIC0x
MDAsOSArMTAwLDExIEBAIGludCBfX2luaXQgcGFyc2VfYXJjaF9kb20wX3BhcmFtKGNvbnN0IGNo
YXIgKnMsIGNvbnN0IGNoYXIgKmUpDQo+PiAgIC8qDQo+PiAgICAqIEFtb3VudCBvZiBleHRyYSBz
cGFjZSByZXF1aXJlZCB0byBkb20wJ3MgZGV2aWNlIHRyZWUuICBObyBuZXcgbm9kZXMNCj4gVGhp
cyBjb21tZW50IHdvdWxkIHdhbnQgdG8gYmUgdXBkYXRlZCBiZWNhdXNlIHNpbmNlIGl0cyBpbnRy
b2R1Y3Rpb24gdGhpbmdzIGhhdmUNCj4gY2hhbmdlZC4gRXZlbiB0aGUgMTI4IGNhbWUgdXAgYXMg
YSByZXN1bHQgb2YgYWRkaW5nIC9oeXBlcnZpc29yIG5vZGUuDQoNCllvdSBhcmUgcmlnaHQuIEkg
c3VnZ2VzdCB0aGUgZm9sbG93aW5nIHdvcmRpbmc6DQoNCkFtb3VudCBvZiBleHRyYSBzcGFjZSBy
ZXF1aXJlZCB0byBkb20wJ3MgZGV2aWNlIHRyZWUuDQpUaGlzIGNvdmVycyBub2RlcyBnZW5lcmF0
ZWQgYnkgWGVuLCB3aGljaCBhcmUgbm90IGRpcmVjdGx5IGNvcGllZA0KZnJvbSB0aGUgaG9zdCBE
VEIuIEl0IGlzIGNhbGN1bGF0ZWQgYXM6DQogIC0gU3BhY2UgZm9yIC9oeXBlcnZpc29yIG5vZGUg
KDEyOCBieXRlcykuDQogIC0gT25lIHRlcm1pbmF0aW5nIHJlc2VydmUgbWFwIGVudHJ5ICgxNiBi
eXRlcykuDQogIC0gU3BhY2UgZm9yIGEgZ2VuZXJhdGVkIG1lbW9yeSBub2RlIGNvdmVyaW5nIGFs
bCBwb3NzaWJsZSByZXNlcnZlZA0KICAgIG1lbW9yeSByZWdpb25zIChOUl9NRU1fQkFOS1MgKiAx
NiBieXRlcykuDQoNCg0KPiANCj4+ICAgICogYXJlIGFkZGVkICh5ZXQpIGJ1dCBvbmUgdGVybWlu
YXRpbmcgcmVzZXJ2ZSBtYXAgZW50cnkgKDE2IGJ5dGVzKSBpcw0KPj4gLSAqIGFkZGVkLg0KPj4g
KyAqIGFkZGVkLiBQbHVzIHNwYWNlIGZvciBhbiBleHRyYSBtZW1vcnkgbm9kZSB0byBjb3ZlciBh
bGwgcG9zc2libGUgcmVzZXJ2ZWQNCj4+ICsgKiBtZW1vcnkgcmVnaW9ucyAoMiBhZGRyIGNlbGxz
ICsgMiBzaXplIGNlbGxzKS4NCj4+ICAgICovDQo+PiAtI2RlZmluZSBET00wX0ZEVF9FWFRSQV9T
SVpFICgxMjggKyBzaXplb2Yoc3RydWN0IGZkdF9yZXNlcnZlX2VudHJ5KSkNCj4+ICsjZGVmaW5l
IERPTTBfRkRUX0VYVFJBX1NJWkUgKDEyOCArIHNpemVvZihzdHJ1Y3QgZmR0X3Jlc2VydmVfZW50
cnkpICsgXA0KPj4gKyAgICAoTlJfTUVNX0JBTktTICogMTYpKQ0KPj4gICANCj4+ICAgdW5zaWdu
ZWQgaW50IF9faW5pdCBkb20wX21heF92Y3B1cyh2b2lkKQ0KPj4gICB7DQo+IA0KPiB+TWljaGFs
DQo+IA0K

