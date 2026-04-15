Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPa2Av+l32miXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 16:51:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65917405870
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 16:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282584.1565146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1aL-0000M5-2P; Wed, 15 Apr 2026 14:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282584.1565146; Wed, 15 Apr 2026 14:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1aK-0000Jg-Vo; Wed, 15 Apr 2026 14:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1282584;
 Wed, 15 Apr 2026 14:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wD1aJ-0000Ja-Nu
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 14:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD1aI-006h9p-83
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 16:51:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69dfa5e5-2eae-0a2a0a5409dd-0a2a4507864c-2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 16:51:18 +0200
Received: from [52.101.70.90]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69dfa5e5-ba2d-0a2a45070019-3465465aea16-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 16:51:17 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB10332.eurprd03.prod.outlook.com
 (2603:10a6:150:160::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 14:51:13 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 14:51:13 +0000
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
 b=pNXHWB815q8z0I3MymuDdLVNTREQ3gjfiANNfDGe0tSmSqOTAhYyZJxIlmmTKpteDaTxV83x2euArsbDBvNjpmsWHKvB58I7tsuvb1+0ct0QggP53aHSMechDljUg/+mbN4xTeQF3v3M/lGIu8bGTQkLzdmjmq/+DIWk5Ad8v4LxA7pGQFxAyLSPbtTTiw6k2GLm4jcS/w/dllrYC1UpZLqj+wLlcAOD1bRx8Pwn9JhX8JIzCkuOlUvDTc+sSmJzhKvN13KxyoAICzH/hSHP7rQgdWAhOXAlOyjwoMAFkHucwaHdRFBExchzQX5XDQZdW/BnfSlyvJw/CL+0r6dvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2z8A4beCmW03g94nx44erDZyXZVg5UfzsoDSGXfkes=;
 b=srjl77pw4XUnHFgYL3RtnBigO4GmbpBuUGkseugvR+aEuGu2YE9yf/G587IecqcaZ0y9iJMqrwvo/c3lo6j4b469+0B1BSA3UW4qLIrE7I9tfk1uoOZuGmXUkNHQHuPYup42sYXve+vR0dWS4A2qGZIeMfQOzjVW9joXZRRA6mmhvqlRp9lLfWxu5cabJrRT1s0pn4YHcvo3TJUom25/HHjo/PpME2kDnJVeucrQm2VdlQs8BlgLfD5tN3ghz3KISDhKl0nq6L2wOE5sKwSdr9NPQLv7P5uCQOG0nLDz4Nmpsnvk41rmwYKXuZgBLoce6+Qlf9XBZ7uXBHlk6pURvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2z8A4beCmW03g94nx44erDZyXZVg5UfzsoDSGXfkes=;
 b=syG+V+SgK+qRcbte4JuaIrHIk3q3xTq3Th9clobjeP1R/l/KKiHUPX9IcbRNymvy2/dBz+VC9WhNt6yf7E33G2lymFeSpquRUMDOoNEJDGLUvK2KgPBKMGlIWMCqmoq7as4HKqq1TdSPRrT1kXit+a+j7r+T/VzxO6TDYLk4y5kQVTrfSVQxZrr/MWAllbZSr4o9RdI4LWih99clH2TKakzVA+EfCixrlYUhYglnpEQqdIzcqXE4kmCAEx7qexK+uLVJOQNkXc0NZARQPaHiRo+6WEVrAJJioKRadaYeqGgX2oraeZc6uMO8gcXVNDnEfSTpJ2V7gqlnowquuNxvyw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcwDy3LJnr4T20vUWAas874pXmi7XHAiYAgBlL+wA=
Date: Wed, 15 Apr 2026 14:51:13 +0000
Message-ID: <f4a1cfa1-f3ea-4fa0-bffd-1f6346e07d39@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
 <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
In-Reply-To: <58cfab3b-7cf2-4e38-9968-1248e665f985@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB10332:EE_
x-ms-office365-filtering-correlation-id: 17982b2e-43ec-4973-cfbb-08de9afe7090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 yIpNC8Up76rBTKEI5aTRbn/8C7U7g7v0vCUEHRd9dL0xlV3lkhmvT+0eKE6JlCfvRmpm1Dg1x5qhGB/7DEbHwnxWgmWVeztNljX2XmF66/zlQKO5rVaQ8RbGlhFDkJ0hPFnaC76D8ThHPpAeibod6YXwSxXiB1JWKkto5IyyCtdimo3NklRSc89NJoJ5q7SJTunmD/pYaNJPZTL2dV63w7ZtzqHPUJUOUu2U0I/ZzmDZpiYNntziEXGb2J4J8OFIQ5a+A6TqGjn1kDA3EMQOerVDAksf2JQJL8vjH3D0tlMNEMi5px8CXv7Sh0uLMeoh/9NBl7fBWo+h3jX1ZkSWH4hgcCjv0JBzTtlWfn2ZAxRzW+iVntYcHjndF63/5nWdolHrT/+Lr7/PYYUoYvTI6O0Fr0NcWmeZ1cMno5ucw7hCl3JngnLzjtD4jEP5SJiiJ2qbgIbikCA9mDcUwwapW3J8b4WpCswBhOu+vyTcXd4lw8vI4f9usisF3PI0tmSiBoB3K+TGWhzrqSbUVFPGJVq11zM3NlOZ4xyZWYuQElNR6il777LIRu2gs7uDP6Tu6zIjmQmVHQi6uhYnDXXJO7/hBRDzlxbRVdpt1dv7MuTGonL8TKEJBXZ7lDJF9u/HDdyBxs7Ehzf4bQnmbwkVwhJaXcyrTPqXpDEXSpLJypBOD7KDSwErg1GrNzZA93sx1H2T3WDakh9Sfz8I9poMLEquy8Ll4vfY3FncHPr+WXEFLQw5Sao/DG9Fr21q2zn1xZ4qUVxxWFskehO3KTG8qPip7CwH09ZgdWWeXQHQ1WE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qk0xS013ZjhPNURsQ0pjUk9pdjJESDhqL1NmaVloRW5naGN2QkY5Z09seWRN?=
 =?utf-8?B?SjJieHRWR1FKVnZBM1NOZU43YzgxNW5kdk4rc3BQcEZpNGhuR3FYR1NXUDlI?=
 =?utf-8?B?TjVTNmdiQThPS0ZDK3pINnlqTkZHbms3QnQvaFlNYjBsQW1XVDNPa2NqQkty?=
 =?utf-8?B?ZVJJa01zd0ljRGZJR1dKenMvZTY5dkZWQktVQ3paWTB5emQzZERHNDBjTGxC?=
 =?utf-8?B?QXlWRjlINHl2aUNaMVNlNFExWDI4MCt2WmNIbjZZblZCM0FKaVRFYS9YTFN0?=
 =?utf-8?B?YVkrK2FoT1YzOUpoNGNlc05mRVk3N2E1TERIRXpjUU40UnVyMEsyNmw0YWww?=
 =?utf-8?B?ME1LYlh2aktjYm9uSWZnSzVZR2pxTmIwbVVSb2JNY2xGcXR2dzhHN3JvR3hE?=
 =?utf-8?B?b1NCMm5GejVDR3ZzL3o4U0xqYW1UU0RqQWtJOWxDSlJlQ2dqYVhxZFBjUzBR?=
 =?utf-8?B?Sm8yQ24waDRvYjh3ZVlLa3ArcWl3dVdzYSszVkpWNitBRE90MTFFeTcyNGpT?=
 =?utf-8?B?VGVRTS9YanZSQ0RtUUx1R09hNlNaa1lncEh4ZVk5WmZFNlRCcVg4NEhGWFZ0?=
 =?utf-8?B?aEhnNTN0N2tibUJmcUw5SS9ZT3BFZThJRXlpWDR4RnJvSE4xV1dLY0c4VjVl?=
 =?utf-8?B?cHNza09hOGRDOXBpK2dNRGFJeUVQTDIvMEZXSVV5WStDWnVEU3M1bjNxejlH?=
 =?utf-8?B?Ym9mb1liR21kRjRiU3NacFNsMFZxVlVleVVlN1prdTVRL29nSER3bkRBaVZ4?=
 =?utf-8?B?eTRaZXc3NWxMWVFiYnkrQ3B0OTFtR1dYTUcxNGovRDZENmlIWm5kbmVpZFRK?=
 =?utf-8?B?MnVDSzE3WjltdXFzL0J5Y2xOYkExN1o5dWxvSEZtek9iMXRwd1I4SnhyUFZC?=
 =?utf-8?B?bTVXOWI2VWh0MkxSMEwwb1hvNm5DZzhSd0NtL1hXQXpPOW1rVU94ZGhLK1ZH?=
 =?utf-8?B?ZmRvSVM1NWh6MWJYdEVaclU2d0ZYemhXdkNCS1hpclRKemRWNThYa1VOdTNj?=
 =?utf-8?B?Mk9WWThJdjNrUnV1czUzQ3p2akNidnErV1o4UFl6NVJ4eFE4L1YybjlUbXJL?=
 =?utf-8?B?b3hiMkxyM1lhVEl2R0VlNFJxOXJscmN4T1BuUXZPdjR2OU8xTzQ0UUppVWs2?=
 =?utf-8?B?UENSU3lUOTdMVjlBOVgyZnNYWXRGWE9WZ2lwNW1KUmZiSjBGaGt0YzdBUzZj?=
 =?utf-8?B?VC85WUNiejRkcy9vOFdpcGFOV0c4QVp4d25RTkNpell2a0ZiVTNEQVQzS09x?=
 =?utf-8?B?SHU2QVdaV3Q4bkVWRXZ2RjN6K3hMSlpZYmtqRG4ybERlNm85blFiRTRBQUND?=
 =?utf-8?B?dVllTEpxQUJkWUh3WlA5MWtMdjBuTkhMVktZUXI0M01VaHBaa3F6WFowbzB0?=
 =?utf-8?B?UG9FV2lmS2ZsZVlPTG1zOWMwSDNYc0g3V3YvVUVDVWNBWXpZM3pQKzh1c2lY?=
 =?utf-8?B?ZjZsb0xGejdCUG5yTEZKS0w5a0drTFlGNjA1ZVRrWlFOWVR4L2l4bHUvZWps?=
 =?utf-8?B?enZhaUpZOW1HUlFHbzNvZk5EMGRWdHN2YU9IbEJ0YlpLUWtoeXVpMGNpTkdH?=
 =?utf-8?B?aGhFSThvWllMWmlIbWpXRnMvbE83Q3h5dlFQdUxxd0xTZ3J3Uk5LajY2WXRO?=
 =?utf-8?B?Vmt2aU5tVXgySDBLQTA4Vy9IMGhZNUUvUXd1S2ZETHFxMnZVQTdRTEFyTTJE?=
 =?utf-8?B?QzNSaTdIeXBWbUFmSk1aMDZLZFdPZ1IyVFBUVjBrMWFubUl1cWV5NVNnbHJ3?=
 =?utf-8?B?L1FzMGN5NVorVWlJSThEUU5aTU5mSmNqYXg1NEZvbFphV2VUTnRKWmxzU0Zi?=
 =?utf-8?B?aTJ6Nm9teU5zUGh2alBqMUtLcjRSR1FxVlVzUU1xRnBzdjZnUFQrSDdLd3hr?=
 =?utf-8?B?T3lCakFzM09kTXI0d3h4YzFaeWFsZjBLZzZqemMzSWhPWWtTSC82ZVN2c3Bt?=
 =?utf-8?B?SmtvUkZsOXUrTVkram11RG10dnhPYUgzSE8zTEZ2c1U2U09ubGxZMDZMaVZs?=
 =?utf-8?B?dTM4Rno2SHF0QkhkMXk3Njc2QnFVVlhHY1luT1Mxc0tnTnpNUmNJWkZ1NEZG?=
 =?utf-8?B?bHR5OWZFSXJHTTlBd0xJZm1sazFBdER3V2ZQVXZWTm1NSEc2S29LeUt2Y2N2?=
 =?utf-8?B?SVRJSGtrRWdQUSszTkRVcHgxQkNOVDM4V3pxNHV5ams3ZkR4OTNTTWMyclBi?=
 =?utf-8?B?VU9KNC83aVJnQ3B2YWpLYkxjdWQ2M1FhckI3Rzl5SkE5YXNjbFZYZHRVNTJB?=
 =?utf-8?B?S0E5b3dHQ0VWalZsa2pFcUdsRU1nSGtRRXVuZS9kRDkwRWt0YSt3U2lBK0dl?=
 =?utf-8?B?alUvMEhlUEQ0blRad1hhVExyMWZ0N0VqZS9rbm51dzA2M1NRY2x2ZE5XS05F?=
 =?utf-8?Q?NiDhyuVUPc75sz+w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F4B7C980A17D445A8B27296CDD17E4F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17982b2e-43ec-4973-cfbb-08de9afe7090
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 14:51:13.3482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJudqi0nyciJngUdQ3kjMAfpCfavqIxphbNOzIV9ZeSkcoRaDBV3wXU9v9/fJnai+7gH97lyMPhHQnKLnCzGRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10332
X-purgate-ID: tlsNG-ef75cf/1776264677-88F5E41E-2AD6CFCC/0/0
X-purgate-type: clean
X-purgate-size: 3052
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 65917405870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDMvMzAvMjYgMTU6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wMy4yMDI2
IDEzOjU5LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IFdpdGggQ1BVIGhvdHBsdWcgc3lzY3Rs
cyBpbXBsZW1lbnRlZCBvbiBBcm0gaXQgYmVjb21lcyB1c2VmdWwgdG8gaGF2ZSBhDQo+PiB0b29s
IGZvciBjYWxsaW5nIHRoZW0uDQo+Pg0KPj4gQWNjb3JkaW5nIHRvIHRoZSBjb21taXQgaGlzdG9y
eSBpdCBzZWVtcyB0aGF0IHB1dHRpbmcgaHB0b29sIHVuZGVyDQo+PiBjb25maWcgTUlHUkFURSB3
YXMgYSBtZWFzdXJlIHRvIGZpeCBJQTY0IGJ1aWxkLiBBcyBJQTY0IGlzIG5vIGxvbmdlcg0KPj4g
c3VwcG9ydGVkIGl0IGNhbiBub3cgYmUgYnJvdWdodCBiYWNrLiBTbyBidWlsZCBpdCB1bmNvbmRp
dGlvbmFsbHkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9w
b3R1cmFpQGVwYW0uY29tPg0KPj4gLS0tDQo+PiB2Ni0+djc6DQo+PiAqIG5vIGNoYW5nZXMNCj4+
DQo+PiB2NS0+djY6DQo+PiAqIGRvbid0IGNoYW5nZSBvcmRlciBpbiBNYWtlZmlsZQ0KPj4NCj4+
IHY0LT52NToNCj4+ICogbWFrZSBocHRvb2wgYWx3YXlzIGJ1aWxkDQo+Pg0KPj4gdjMtPnY0Og0K
Pj4gKiBubyBjaGFuZ2VzDQo+Pg0KPj4gdjItPnYzOg0KPj4gKiBubyBjaGFuZ2VzDQo+Pg0KPj4g
djEtPnYyOg0KPj4gKiBzd2l0Y2ggdG8gY29uZmlndXJlIGZyb20gbGVnYWN5IGNvbmZpZw0KPj4g
LS0tDQo+PiAgIHRvb2xzL2xpYnMvZ3Vlc3QvTWFrZWZpbGUuY29tbW9uIHwgMiArLQ0KPj4gICB0
b29scy9taXNjL01ha2VmaWxlICAgICAgICAgICAgICB8IDIgKy0NCj4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnMvZ3Vlc3QvTWFrZWZpbGUuY29tbW9uIGIvdG9vbHMvbGlicy9ndWVzdC9NYWtl
ZmlsZS5jb21tb24NCj4+IGluZGV4IGI5MjhhNGEyNDYuLjAzZGZjZWU3ZmEgMTAwNjQ0DQo+PiAt
LS0gYS90b29scy9saWJzL2d1ZXN0L01ha2VmaWxlLmNvbW1vbg0KPj4gKysrIGIvdG9vbHMvbGli
cy9ndWVzdC9NYWtlZmlsZS5jb21tb24NCj4+IEBAIC03LDYgKzcsNyBAQCBPQkpTLXkgKz0geGdf
cHJpdmF0ZS5vDQo+PiAgIE9CSlMteSArPSB4Z19kb21haW4ubw0KPj4gICBPQkpTLXkgKz0geGdf
c3VzcGVuZC5vDQo+PiAgIE9CSlMteSArPSB4Z19yZXN1bWUubw0KPj4gK09CSlMteSArPSB4Z19v
ZmZsaW5lX3BhZ2Uubw0KPj4gICBpZmVxICgkKENPTkZJR19NSUdSQVRFKSx5KQ0KPj4gICBPQkpT
LXkgKz0geGdfc3JfY29tbW9uLm8NCj4+ICAgT0JKUy0kKENPTkZJR19YODYpICs9IHhnX3NyX2Nv
bW1vbl94ODYubw0KPj4gQEAgLTE3LDcgKzE4LDYgQEAgT0JKUy0kKENPTkZJR19YODYpICs9IHhn
X3NyX3NhdmVfeDg2X3B2Lm8NCj4+ICAgT0JKUy0kKENPTkZJR19YODYpICs9IHhnX3NyX3NhdmVf
eDg2X2h2bS5vDQo+PiAgIE9CSlMteSArPSB4Z19zcl9yZXN0b3JlLm8NCj4+ICAgT0JKUy15ICs9
IHhnX3NyX3NhdmUubw0KPj4gLU9CSlMteSArPSB4Z19vZmZsaW5lX3BhZ2Uubw0KPj4gICBlbHNl
DQo+PiAgIE9CSlMteSArPSB4Z19ub21pZ3JhdGUubw0KPj4gICBlbmRpZg0KPiANCj4gVGhpcyBs
b29rcyB3cm9uZyB0byBtZS4gVGhlcmUgYXJlIHg4Ni1zcGVjaWZpY3MgaW4gdGhhdCBmaWxlLCB3
aGljaCBzaG91bGRuJ3QNCj4gYmUgYnVpbHQgb24gQXJtLiBBbmQgdGhlIG5hbWUgb2YgdGhlIGZp
bGUgYWxzbyBkb2Vzbid0IGluZGljYXRlIGFueSByZWxhdGlvbg0KPiB0byBDUFUgbWFuYWdlbWVu
dC4NCj4gDQo+IEphbg0KDQp4ZW4taHB0b29sIHJlcXVpcmVzIHhnX29mZmxpbmVfcGFnZSBhcyBp
dCBoYXMgYm90aCBDUFUgYW5kIG1lbW9yeSANCmhvdHBsdWcgY29tbWFuZHMuIFdpdGhvdXQgYnVp
bGRpbmcgeGdfb2ZmbGluZV9wYWdlIGl0IGZhaWxzIHdpdGgNCg0KeGVuLWhwdG9vbDogc3ltYm9s
IGxvb2t1cCBlcnJvcjogeGVuLWhwdG9vbDogdW5kZWZpbmVkIHN5bWJvbDogDQp4Y19tYXJrX3Bh
Z2Vfb2ZmbGluZSwgdmVyc2lvbiBsaWJ4ZW5ndWVzdF80LjIyLjANCg0Kd2hlbiB0cnlpbmcgdG8g
ZG8gbWVtb3J5IG9wcy4NCg0KSXMgaXQgYW4gYWNjZXB0YWJsZSBiZWhhdmlvcj8gSWYgc28gSSBn
dWVzcyB3ZSBjYW4gYnVpbGQgeGdfb2ZmbGluZSBwYWdlIA0Kb25seSBvbiB4ODYuDQoNCi0tIA0K
TXlreXRh

