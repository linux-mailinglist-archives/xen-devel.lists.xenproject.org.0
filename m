Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCZ1CymSzmkbogYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:58:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73F38B902
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272170.1560015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8KR1-0004dw-MM; Thu, 02 Apr 2026 15:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272170.1560015; Thu, 02 Apr 2026 15:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8KR1-0004bN-Is; Thu, 02 Apr 2026 15:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1272170;
 Thu, 02 Apr 2026 15:58:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1w8KQz-0004bC-T6
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:58:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8KQz-008lW7-9Q
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 17:58:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69ce920c-5cb7-0a2a0a5109dd-0a2a450897ea-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:58:17 +0200
Received: from [52.101.84.126]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69ce9218-fab6-0a2a45080019-3465547ea023-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:58:17 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA3PR03MB10987.eurprd03.prod.outlook.com
 (2603:10a6:102:4b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 2 Apr
 2026 15:58:13 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 15:58:13 +0000
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
 b=tghpiMlACZd75LK4R9JBKJ++WtcM4WG9gY5BcmnT1lEOdrxPnYL+4VIyTRRHd10DdRA/6xxzDAX4BMKvPUy2cVLPitl7whPZfEpl29BJ9J8IxbUYxMU1vf1VhjOI0/89XkhO0Oxwd3ldPK65/s3zaxZbrrMIdMEEdz8nvuMJfGqfBE/RqlHNdyfYvmhqa3qpsZWxoCPJrGhiceOhmCN+s0z0PE6uj20EdaXoN1g6vb+lNFTWrj9ZXqDAO/RCXxa9r0S9FMvxzuvEeHUHCjFqiM85sf5rjvDGPqcC1aVuzBrbe8/gt+UYgi8IngfV3VhpwslR5T9TyBa075j0c85dCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpfWSwmVil6HbzgJvVm7d1Y6W9dnAroOSqqCWz94rOE=;
 b=i7/us2nvthidol+qCjWIoeq2MwaTNG3wTZNi76AzQF9KHjETORyxRMFiZfj8ufpill//brlilc9cXm8pvdWewYlul6l0sxNQ2N1EHvZ5JhOLFfbx/UAU9jnxnjPaEW4Pe2QYpgS6FO8LyM956l0QNRakojuPSGimr220oNFjOJqZ/WkYxghoo2y4eM6VJXn3fLmpXPEj2g1Xh1UiaUXThAYDxsxYGbcphPHTxOhq/dTkPd1GtD6a9DuBhGGl4caaoZ00TVRE4/6Xd2eAtCxKxFvg107C8xb2xi0s5TGdFPVH0IBQYjU3UliJWKLQRFjHN6oc2d41Q3qhxdQ5WJiSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpfWSwmVil6HbzgJvVm7d1Y6W9dnAroOSqqCWz94rOE=;
 b=g4+vRidenSv5GJRpuioclB0pWPVWmFyPKRE9tnY+RnVG6W+UFmcQtlVkDe5DSODdtqiLZHz9kQGUJudVkTXk2DQEoQlxwUopAzme87lTpPsqWC2y9qHZiEvCOeoWrBoCYjYXAyzzt7pWRnv5RpFQn8/gBIlxcci3l3c/UfEROOQhZyuE+izXbLMcz7ETJxmjEXMzHLYPex1/lUx8v+tmYiNieKyMj+z0bSUaYnY33cWRuT4uh0bgKFxUXJZrMmb+84ldkckJ1su3e0PzKU+gIZw59eRKcnwgAis+WKQGrv1Y6fclMxB33fYWGx+LhVvwZmmLncbvfBOgv8EbcEqJLw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul
 Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 3/3] xen/arm: vpci: Move content of xen/arch/arm/vpci.h to
 arch header
Thread-Topic: [PATCH 3/3] xen/arm: vpci: Move content of xen/arch/arm/vpci.h
 to arch header
Thread-Index: AQHcwegF4agxAfWvg0qW+yyLTWDkbA==
Date: Thu, 2 Apr 2026 15:58:13 +0000
Message-ID: <87se9dtkvf.fsf@epam.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
	<20260401145816.169557-4-michal.orzel@amd.com>
	<e21642ec-ad45-4a61-8482-768ee666f438@xen.org>
	<bc80e004-25a5-449f-b4dc-a6afb8dc54c7@amd.com>
In-Reply-To: <bc80e004-25a5-449f-b4dc-a6afb8dc54c7@amd.com> (Michal Orzel's
	message of "Thu, 2 Apr 2026 08:32:19 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA3PR03MB10987:EE_
x-ms-office365-filtering-correlation-id: 37fd81aa-4626-4d1b-e613-08de90d0a56b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 1cfCW0Gg9L3MAcF7F0LZTt+VMAlJyxel/IAQjgd5nTqgYHcqxc5Tpyl0NgRo0Jv96qXunYzS4JxVRBZ+7GkZlVk6ndpHvhlGy85HRkFIuYGLI5PXQe77+KhT/GxRCLVBtkM4b3EHntJGWP0lhJvAnvtL19ET6Jw8E/8hCojzA+6fKBZ1D7fs81f2RRtWmzwvTgBdnkftsxWFGTaxjg1FX0N3j1xSXYOYpjyOwXoSxetRQMzlv1MYv+FzfY2CmI8WQESgBGZ6+uxEt75ZPZZ/DyiZGe1b5ujmx4qnaaZtAOcFA8s1bzNXtG2+H4B6mzf7MsOgoAGQgZQwEFLUuVsAhszzl3WngbG4GIpkXZeyEK5ZwXU+kOLUBhgzOUGshk8wddaSxYD8RCjmE7x7+9OTiVITRHoCRT35Ykp6rE540xSDveiX4CjhZwA5Igqn3Y85MyXiq8hyg2ns40+izaPZf47TfichqSMnYs53gonLTkp3pcobJofbamr4/QDybkLC0+L5cudVrwhbr1hQhHEEPChglHG0GTEHw6aPC7eRl9ttm1HyCPb0xjyojQBPM2rDXLXtAWkJohrERTfEaid4VxwjevYEXhO0BYWvd+R6lQYz2JosbV4oiJ+y7czF10kPfZasLpMxjYa6WjdgN0jdJbJnCQvHtVJXl956Dk1uLFmO73RKhlFl/UqqqN88yMx95LONGofviUO/wqdRI04LPo6jjF6ortgl3XHO4XMlbXUz1NRRRO2g8Rj5iYWRP/zNpuePLOAeFNLxSkjEUwJnQcWe/FN5+0qELAP6e2/YgPc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pO3R4ZEgqcmPhQKwL6BpR/eYdCCKmUnuEWPkgW/dbGMikU+UJNy8KrYWVx?=
 =?iso-8859-1?Q?8fqPE0MDKItJmNFmAYlOYddhTy1gqdN/LFNMGF3Bd0sROmE32P8pv3U4P/?=
 =?iso-8859-1?Q?wwZNvAryLDNlfydwKtLRc9asCwWs4FJXtQru/JxvLYSJ/sLmG7jg7bvEGH?=
 =?iso-8859-1?Q?Av/W+hoqNDvWkdg7/nIOA19UmNIq5WnzizSTRdhSbsZnSZEQv81SgcP7nw?=
 =?iso-8859-1?Q?aJ1V4XNVmtMV5qsOIswyfIWyJsvuRqyilRpU1ns/rg0x3CVceBGMV/CxjP?=
 =?iso-8859-1?Q?3wb2UTlOipZpo84fsrdrkl91013eFtGjlmmuw3aDqJt3kw4ngPd5j7M0p+?=
 =?iso-8859-1?Q?j1nf7VeYAE3w7yCNZT1aN8aED3Uo4ELo47Vuc8W+8zEqKDvRH0IzC2M/iz?=
 =?iso-8859-1?Q?GrfxLFdsn8dTjXcjtTsAuzjwc0t8p2eF2Deb1wm9ZdgZZcel0YlU+recty?=
 =?iso-8859-1?Q?f25Br0SARmR6M+z8BUzYlk5MHDJQtHVNK+CrDu3I3dtU6OC44e3DqI63Dj?=
 =?iso-8859-1?Q?nXhUutGGPZoNdxyUMHBdljJrAZau7IytlGA9frNoEOCgOmUmqx/63PChbL?=
 =?iso-8859-1?Q?6jHD4yc34Fj+SM4jxj9GjQVwqPeaJIdtrQDWzY/28FEZVDO4KR5fiNAdrr?=
 =?iso-8859-1?Q?lP/3kxY0dnHg2XqJFCk2cAEQwetQQ52Ogdb4G5cJqbq0HgrQ2XYV/s4ntG?=
 =?iso-8859-1?Q?MNJg044RGbKyUBkhmkJ6itW4qBzR9cka9nZRVIZUUukH0wOyxWQ9bB98ZU?=
 =?iso-8859-1?Q?JxmiyL4KkvU/BF4p0OJtcc7FST1GIS5RmOJqdPmO80reQNfsN+bWyrLHZC?=
 =?iso-8859-1?Q?+HvwXJ+n9op5/SscIue95wvCt489OiRbyvhFkfV+A6syI78xj7PSq8o1Oi?=
 =?iso-8859-1?Q?BRkWZStkfEd2x3+xeoy8lSjiLTURT9DiQAoGjrWoPwpiy9NFmDok+Pemff?=
 =?iso-8859-1?Q?o44fjQNdA0HsXLLEqxyW84Hwx0yh8/W0UoRtGzYt7/MNMZV+5HDInwhSn1?=
 =?iso-8859-1?Q?o3qQ/KvNFLSaz80oRP/h33IlzbaMV6LPzbnCodip5cy3VVkeHF3qMSZuhh?=
 =?iso-8859-1?Q?22gk9/CAL9wORP0PL/bgKFqmNX4VTyqK7gHsT/X2r2qAP3zj/8EzBKDLeT?=
 =?iso-8859-1?Q?6u+VNHyl7qsbaBMOnxozN8FUkf+wHQCasCrsO6gAD+Zml3TIjmbJ36DqmG?=
 =?iso-8859-1?Q?hAlNTeMPKrITw5G/hcVMLqLTYDETR0idwvXaGQtPZLbX8CnZQnSuLf58Gu?=
 =?iso-8859-1?Q?XHpZ42NmFh+holwyurVWYSF+Ak+O5OBdE6A3DRAdIGrNt2Em3/M2dzeZsE?=
 =?iso-8859-1?Q?+/kmm5pKVqqBX0FPJTPO+V0hUol3YBxUYepQdR75Qk/NCaPBc6ADWN+NlN?=
 =?iso-8859-1?Q?+N0HziGBm9rjWfjeNB4xHnJOxZq2f55agPEdmHidYoC4JcqTiNP3AlDVxD?=
 =?iso-8859-1?Q?famJsyccUhp93UcP8kLX/DSxEdhapEyl2AWpAYOrHUrGgIDULh8i1/zkUn?=
 =?iso-8859-1?Q?5o66VF9kHZFKYQUUSH0GBiJHAvsy2vFrqacztE81a9t5VP7AyqWizPCk2G?=
 =?iso-8859-1?Q?ILbHj52fMjbdhMpkYrFJNup5ZZYJm8j+zcI7XblsIMuy8HyUg3eYlqTudl?=
 =?iso-8859-1?Q?BEYKOQPJHDPEC5mt8xIBMo+EOeScfm0WX428tdFsc5QeokzOpmfBnRHckp?=
 =?iso-8859-1?Q?Wbj2g8+6GKrCUdENCrEe2hM7nQFPuHbYQPuzh+7smbRbg0Sx9nMJDWeYyy?=
 =?iso-8859-1?Q?PHAPtFnrb1jXHv3qysDX5tWW6TdsN0+Ptvn7TpGgtw8P3NqVjso8qfpV0Y?=
 =?iso-8859-1?Q?6e7MM0NZ2yFzbFOJjgHk8+Cg0JfXGQM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fd81aa-4626-4d1b-e613-08de90d0a56b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 15:58:13.6007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y85V/52DYENo7Jt/oaLS9lO91crE1LNNxB2EpsDgdwMVYKj5siL72sCAZ1zMSoS0nc5BCsKaLkMm+Xavc51BwdUEpO7WFdr8dT+gdal/YhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10987
X-purgate-ID: tlsNG-c1860d/1775145497-75557497-01D7A56A/0/0
X-purgate-type: clean
X-purgate-size: 2229
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6A73F38B902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

"Orzel, Michal" <michal.orzel@amd.com> writes:

> +Rahul
>
> On 02/04/2026 04:44, Julien Grall wrote:
>> Hi Michal,
>>=20
>> On 01/04/2026 15:58, Michal Orzel wrote:
>>> Move domain_vpci_init() and domain_vpci_get_num_mmio_handlers()
>>> declarations from the private xen/arch/arm/vpci.h into the public
>>> xen/arch/arm/include/asm/vpci.h, and remove the now redundant
>>> private header.
>>=20
>> Can you provide a brief explanation why we don't couldn't include=20
>> "vpci.h" from "arch/arm/vpci.c"? Such approach would ...
> Yes, we could but I think it's better not to use local headers if the mai=
n ones
> under include already exists. This matches the x86.
>
>>=20
>>>
>>> Update domain.c to include <asm/vpci.h> instead of the removed private
>>> header.
>>>
>>> This ensures the declarations are visible where the functions are
>>> defined, resolving a MISRA C Rule 8.4 violation.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> I'm moving a file with GPL2+ license to a file with GPL2-only. I consid=
er this
>>> ok in this case becase the copyright on a file with just prototypes doe=
s not
>>> make any sense and a license text was most likely blindly copy-pasted l=
ike for
>>> most of the files in that era.
>>=20
>> ... avoid the licensing discussion. I am in the opinion that it is ok to=
=20
>> move from GPLv2+ to GPLv2 because the license says "either version 2 of=
=20
>> the License, or (at your option) any later version". But I remember not=
=20
>> everyone agrees on this interpretation and we never solved the=20
>> discussion on whether we need to request permission from the original=20
>> copyright holder.
>>=20
>> Alternatively, I see this file was only modified by two companies (EPAM=
=20
>> and Arm). I see one employee of each company are already CCed. So you=20
>> could confirm with them if the change is fine.
> The header was introduced by Rahul Singh from Arm and Oleksandr Andrusche=
nko
> from EPAM. @Rahul, @Bertrand, @Volodymyr - are you ok to move this file t=
o
> GPL2-only?

Yes, I'm okay with that:

Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

--=20
WBR, Volodymyr=

