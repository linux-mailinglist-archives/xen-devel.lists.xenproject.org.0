Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MO/HsIR/WnjXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:27:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49444EFD03
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303125.1576672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL7BN-0002p1-KS; Thu, 07 May 2026 22:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303125.1576672; Thu, 07 May 2026 22:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL7BN-0002m9-HV; Thu, 07 May 2026 22:27:01 +0000
Received: by outflank-mailman (input) for mailman id 1303125;
 Thu, 07 May 2026 22:27:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wL7BM-0002lu-AU
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 22:27:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL7BL-00EV06-NO
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 00:26:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd1184-2eae-0a2a0a5409dd-0a2a45078abc-24
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:26:59 +0200
Received: from [40.107.162.136]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd11b3-229c-0a2a45070019-286ba2884caf-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:26:59 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AMBPR03MB11798.eurprd03.prod.outlook.com
 (2603:10a6:20b:777::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 22:26:58 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 22:26:58 +0000
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
 b=nuvUazhbxIYK1lHwUk0F1sXX1g2cbsFSdOPsgbOrKBh90si6Rfm+DhZoVmFYG3L1zHLHBzt4BC2APLHH5pNFZgQVScnMbB0i8GnbMlOaIvi024FNsdW7d0aCO1FIYxCZgNM9rWEbygX9gki8A7SmSNBuEOg1X6Vzf3VfSK113nrnGeo2pvds7rn5zsjRGwcsSThRVT1vg92r8m6TU/KezsUU3cZ7xZbQ15CDW5Ayewi8A/2lEbRoCzb4JrKU5isFgmsUCarr7/I4iMxzmKpT8lkMfT3t//weDlFdORcdNrYq3LfEK532l9pn27CukNWShR1IJiA6nsZCy9JtpYMNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nK6Q3X3J844qUFdvIZPLiEQw1N4xRIYCnBas0zZCgKU=;
 b=NPek+RCBHn9uto9UlvRrnFtfT97RBXzcNDwg73qLX7PPV5nVggSZDWxlYeYBtdvucrWBtlyCH2PrJTi/fGaicVyVVqP+2SHo6IPUeO2zXz3xSrJ76URcD2g0qtIa8XjP2iPDoJrlr2/xjv0ahbn4YKNYlEj+2XiRALU1Aa90/VKl3mJvIHQcCch71aSGRIbe/g/aBzrw3g8kOziaDliS2kvAihXvUGsEZLl08qo9s9tEfoxT2BbCmhYnWjvXi1we0WPDec28NCwydhOozH0qYhO3ZGNIP0e2D59gDsmREBVFObTvOBE3kw3C91AnHEGbJ47C7K4Z8eNqTIN4Up7CiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nK6Q3X3J844qUFdvIZPLiEQw1N4xRIYCnBas0zZCgKU=;
 b=eFgMmMdWlwlFHhyiT79Cj97aHsjonm8MAJi3wvrlG1RKBdH65GXEl7ua7mTBCAqY5DxbKuiaf9ocwufS0+xW6OfGcoQiXvwthERe4ytuFxG9dTzepiAolDXzm057y50jK1AGETz+/90LVyAVlMA3z2L3mOFJOD20DFy6YgiAw45aeY6xXOX9WT5CJY84kUfqaz29UrKpgP4zk/Bmi5x2hWcgBW5YlkEO4ppxetbDSl3R5e5K1Dd8bU3tvSlzBEjHhXTurMkyRXLzVQbBFGQ6CtIccPz5C3+wm56VpeLLk41M3gBBxPhioK1KxMt5Vh5eUrpZlObcSbqM1cBNOUPyMg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v8 06/13] xen/arm: tee: keep init_tee_secondary() for
 hotplug and resume
Thread-Topic: [PATCH v8 06/13] xen/arm: tee: keep init_tee_secondary() for
 hotplug and resume
Thread-Index: AQHcwo4dY/ZGRnVq+UOonkTUHmLh3g==
Date: Thu, 7 May 2026 22:26:58 +0000
Message-ID: <87fr42svny.fsf@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
	<666917e8e8e435640c272c19908f412c315b2dc6.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <666917e8e8e435640c272c19908f412c315b2dc6.1775125380.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Thu, 2 Apr 2026 13:45:07 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AMBPR03MB11798:EE_
x-ms-office365-filtering-correlation-id: ec5d068e-a077-408a-a1e8-08deac87c07e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 qg30o+SYAB8ZZ3kpb2ozaFJ8CZ0pFXU+dwipeV/+LqDVCQ3Yv8ozrkeR9MTQvYF3xznf/AsZdgG4+rvmr/FoN809CD5WLNNrtpImbsUoh9ixQsf6+qIX4Tpm5mPe+5iIeX9T1b0ZDGlRHat/bLAqeLU1kVMi+MdJfWW34guuPqlpckwdUV4EpqjlOanEsDLccX1PwH81Yalk4AHRsT5GzS4OcMPqUGVZ2pUnz6Q+sPEMMe+wVnZX8q4TG7Gpqmtt8Hd6Tmi0C57hZ44J7LpvZMFoIUoLuK1aob3AwhZ8H1FfoMr4ew5uztkcg5DijRssS5ObbrnLeuctP77kBYubdBLHQgHT7g1qia2evMkBJ233N8mhkdSJTMBFEqOKCsQd6CwG56+phNHgsccxlOGeHmAweqVkJ7HEha2XUW7u4YEzEiiwaapM+Acj2nZ3ecTCiRzyuTzBzHQctaKRtX7RO8L1UO0FqzfBHQELOcqhUJ4m0dV4yax7RjRuiMEEKmJbi4v7V2BWmV2Q2vuDupbNvz+PVjElOI55w/BY8U2xhakmoHhG8oDkCo3FQ/N08Amo31wL8X8oow7GjgnQSz7V5NDvnXB08l79zZLt1HdHqZgRgDSP3ir8NYU92LMWFT4bJTxs2qltQE1LJQDLY6dGQFn3df4fJ/MKllqKImRM5bpgUWiJDCGvx4uQVShKU+KLVVI8Vq3hBJAgsluMQlb2bPQuYK7m+5zqjM92/GwqpR4ost0Sgr+wxrnqsa5cf6lM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TjSpMynUu+STnHXXgCsMsLO89mYEMUEltJjJBQ6FK977CWohfT+3FncKXO?=
 =?iso-8859-1?Q?BxrY2WRHKyKis8Rvfvb1lRc8VIhXs6GtbR/qGToShYyrISe2fGqVI8TY8N?=
 =?iso-8859-1?Q?qbvNGHtEK0BuNpoewLqctwYmDUtoQ5uQMjHJ1Ndz+g9WLy8Dn3K7jm9B0s?=
 =?iso-8859-1?Q?lPrz5g5Yg3bcPSIgkxVT5FkcsFczNV5sHZtxfVNjZ3ir/Xe//EUvosBiDO?=
 =?iso-8859-1?Q?mDR8PctIeS47xbi7JS4GRxidbDdsKtig+cXSsk1GMJd1RvuhqQZlmZxAdJ?=
 =?iso-8859-1?Q?N8siS9G3FojSfthXEEdPdF7xNvELIFEEtjHCd2YTW/lwf0mHhj6YSFAoLR?=
 =?iso-8859-1?Q?NChrbtwhrfCHZh2MI9VW321ecYMVNNopRfHqzMwhf28Yu8eEWIrg/KQ740?=
 =?iso-8859-1?Q?6hz4vcoDvslXLgxIZYFJmUKHYyC6+bZwAWysBtPKrr5TncrPYkfwsNGmrK?=
 =?iso-8859-1?Q?jLxca/xYAeX8N6rodyeQK7HNoCJiL38UADVdErMvwSMDkqqfLMGTtcRyW4?=
 =?iso-8859-1?Q?uqmxr5zdPLohChLceVuQS2U7SMIdnQlhlQ7oN/I6ls7eFxso8OOwQU6FnP?=
 =?iso-8859-1?Q?Vaf6oIIcOzHSrEFdoStxYu9CZIZOsI1pnJx3qnUHJoSga0S+EdhMhyVm2F?=
 =?iso-8859-1?Q?ELjBeIvRG0hfjLXXibn90y7yDRc0CN41nyHheRC3iWNGjCTpo24eTxGZuS?=
 =?iso-8859-1?Q?Keg2SbFzxGJH/91vAYJt+UdNcVF+zc9UZkX8Khpouk4b1rutW74roZVa2O?=
 =?iso-8859-1?Q?Y1Ftn9bG6iY0GvpJ10611KtrpgWiNUTfnYaHlUHeLXoPRK2VOaaV+g6qKz?=
 =?iso-8859-1?Q?vLB4Q2xpaj3YKHeofAh2QUfs46hhWTrVOZyaOkyk+osaTt8ywciHGFgY1z?=
 =?iso-8859-1?Q?s0Qs+Iv8+OIQ9aIEnWxM5t3zep3LRD5II+ix2gKooQARX+aLu/XIUPAmX5?=
 =?iso-8859-1?Q?of4SsNRZhBuXCMRWatWdxi2aGSLOZFRRzr4/doUVmX8Sjgdx9ZTbM2eNbO?=
 =?iso-8859-1?Q?aFTgMprXAPGUfrzHyr0rdJPySC+cQ9DvY6HFYm23uxQW1v20sD9YcGNDne?=
 =?iso-8859-1?Q?uTP3f3eAVDPQJJtGaZ4EWno8WRqwt+itBIfS8pT4Rd+bixcG84tlnqWNOd?=
 =?iso-8859-1?Q?DtRkQ3ZvEKvJmKVfyRtzg6NTxZP5M68HyusofE+AR+gwDYOhpOf+CGCofE?=
 =?iso-8859-1?Q?8CERWDkWE57ReHfBnC6YDWiW2dj0zWA7zL2xu7pIDdkGbG0zHeaMrfR+Jd?=
 =?iso-8859-1?Q?E04/M7kn2AJDiKPbjil/uFNQ3RTql3ZHa9l9d3CRnffM42ZrN9B4CLVjuC?=
 =?iso-8859-1?Q?E9SngpABHfz1NoSyTO5zMx/IvEJQMqMAfT7bOW7+BdLgPtb511IyWwPBxW?=
 =?iso-8859-1?Q?gwHVHGkeAo5dpURCZLsWy+Sq9qjxUESrq2cBmTonjpw0wTvQSxyvvsmnh8?=
 =?iso-8859-1?Q?fu4oG2dxVSrzAx9s6tBJwFOOzDlSfplk3ueoD+ztccr0oySX4srAf0Ylue?=
 =?iso-8859-1?Q?9p0RxEceo+ESPsTR1AYeI2GMRh+DP9GTJiOXvKKWLol0Za9r5bQD2U4mKF?=
 =?iso-8859-1?Q?72h/v4Pj+TsFJzQ5X2gzqagLCx7/yMPkM9WBZYuhPk4H5053DTLtoffsCt?=
 =?iso-8859-1?Q?vmtR42whcL+ATmo62tymDiruT36OJWg4HYPiEpKsfAfuInq9lABXi4eY8A?=
 =?iso-8859-1?Q?SaBqRyti3VpQHCnMN56iK40l0Xqn92n5lIPvDlDlIugp85H1SGQ4BRJM26?=
 =?iso-8859-1?Q?+92vwxT9TBjdKd7Z12cnSP02+qytjjM0Mk2uAByM3nCbisTTD+STZtRetT?=
 =?iso-8859-1?Q?k5APmNVtOJM3f4MOwRAFGVruEQTFn9Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5d068e-a077-408a-a1e8-08deac87c07e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 22:26:58.2667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pT4ZwsCute9rKFT3XwiLDAg1Mr/W1eRhTzBzZwJoqBmQVqsvxjbP2mJGW+8zYounWMHR54Xk//oJu2gzofZKt7v/YKWvHWkGtjv+rWNyPO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11798
X-purgate-ID: tlsNG-ef75cf/1778192819-09F6EC48-280A6FEE/0/0
X-purgate-type: clean
X-purgate-size: 1082
X-Rspamd-Queue-Id: E49444EFD03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,epam.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> init_tee_secondary() was marked __init and freed after boot. Calling it
> from the CPU hotplug/resume path then executed discarded code, which
> could crash Xen. Drop __init so the TEE mediator secondary init can run
> safely on hotplugged and resumed CPUs.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
>  xen/arch/arm/tee/tee.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 8501443c8e..00e561fc78 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -128,7 +128,7 @@ static int __init tee_init(void)
> =20
>  presmp_initcall(tee_init);
> =20
> -void __init init_tee_secondary(void)
> +void init_tee_secondary(void)
>  {
>      if ( cur_mediator && cur_mediator->ops->init_secondary )
>          cur_mediator->ops->init_secondary();

--=20
WBR, Volodymyr=

