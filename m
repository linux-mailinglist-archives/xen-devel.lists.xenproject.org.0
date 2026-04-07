Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NKqEgZj1Wm05gcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 22:03:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897343B437D
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 22:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275321.1561182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wACci-0003EL-NL; Tue, 07 Apr 2026 20:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275321.1561182; Tue, 07 Apr 2026 20:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wACci-0003Bp-IZ; Tue, 07 Apr 2026 20:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1275321;
 Tue, 07 Apr 2026 20:02:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wACch-0003Bd-AE
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 20:02:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wACcf-003Ayn-4e
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 22:02:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69d562b1-5cb7-0a2a0a5109dd-0a2a450ac446-46
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 22:02:06 +0200
Received: from [52.101.83.134]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69d562be-ee98-0a2a450a0019-3465538629ac-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 22:02:06 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7510.eurprd03.prod.outlook.com
 (2603:10a6:20b:2e1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 20:02:04 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 20:02:04 +0000
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
 b=kqi953PnKF4KyI2ev6+2560LztYK5dxqT0CfDhPSTDCEfdTOLV5kpmznrfnr/zIyDs//RtFS7daPztBdxiiJIaDZfhgrGQhIyAMAIP30NmMq/tkwGhmy1g7EcMr4GK/omW+pnQoqpbbPhZXU3KrklDBbKY6Z4k3WCPQWjJahrOqEUhzpfB6Hu1V7UnRALapvqVu+yChaOvA0OQ1Ur8vvFdwyVNa0RmrmMSfcIKr8fpkD2FUt8v46FOlchPOOiBvoVk2Fnm+MNSGAaCL3scnt8yr6aP/sw+oO2FgmIxKZNL3quMsnGecPr+EC18SIe5xiGlwEEzVQ3y1TC9xA1CWbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxYQd4UR3yZFv0Rmy6PJQrj8rYHknxYKR0cKkkL00BM=;
 b=j7DtTXPLx5RlGewfBpQvva/mUfhH0MsExB32vweIwqwkibxYcU5fLvQAHfkElwzT2ul6hLkGUGl+R5tQM3hjWA+7jXZx8avIoopts7bSzjW5c1O3WmaNwZaO64aD7Do+nawJWnSuan5CbG8hDRM3xYa5GjbOgA+OYhKfl8O6CBtcZWOE2qBrLO4LREQMwMHeFYdo98XDatuLavkaTF6hU1ZOa7TqHKAjdb/FypknSAFFjldxXVc/OXjAL4cEhtVFz6BSPhMqhbsGhm1Bt8aXGBlUPXhHwMwiFipswa34TdjhXiUrui4PNNFUT3bWzIw5p8vYBQS+wvZTWOeR/cOVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxYQd4UR3yZFv0Rmy6PJQrj8rYHknxYKR0cKkkL00BM=;
 b=kp9izs/C46MbG4pewZPlbPYXDXAw3u1A7/NwM/HTep0+suup6SPqDC87e4eDrdSuJV5+Uy8tlFfYMSeer9rhYQ4QgWQUA8mUdMBOcI8XLfv4KGz0r1ZAdmq3ND5sMbJ/OoQkLKiDmpeR/6PI6oPz1TafHSCKN20i8wzJFbmUhzTa02Jbs34+Qm380HpqSCt1J7M4VYjBt0bYBKPcUwZXSG1p7hklSBwCR7XlBwM9k9QEHTBNmI4ji88yePA08sYvRXS/3k6BS1WuPO2cXYgyJv6UsowtTyP85gefc+bTy9Eaf3E2IY23j+z2yPsStVS2ZPsh8wuMWEGa0XIIW9Mj5A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Saman Dehghan <samaan.dehghan@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v4] xen/arm64: Add support Clang build on arm64
Thread-Topic: [PATCH v4] xen/arm64: Add support Clang build on arm64
Thread-Index: AQHcasii1+6T8d3E0U2GKVn8gBUvHg==
Date: Tue, 7 Apr 2026 20:02:03 +0000
Message-ID: <87v7e2y1xu.fsf@epam.com>
References:
 <da1f2ca7a651a5c482a68f6a4377250fcbbce715.1765465950.git.samaan.dehghan@gmail.com>
In-Reply-To:
 <da1f2ca7a651a5c482a68f6a4377250fcbbce715.1765465950.git.samaan.dehghan@gmail.com>
	(Saman Dehghan's message of "Thu, 11 Dec 2025 12:04:34 -0600")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7510:EE_
x-ms-office365-filtering-correlation-id: 43056d0c-dab5-4045-1752-08de94e08a01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|7416014|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 0/qOUeH2DxiQR+xmOfpUKdeHq0XoEsfcXg4xq2j5pfrVJxhYvOt7auaaIEPc6hEYFL5FWejUJbG8yJUn+SwLy56IPvg3fnmUmF32LdTU7oAd5wrhGCfZlA/r2XDfq8HiqaxjGP+IaMf8Ttz1nJCSydHiSAs/0WNZ20co/f0XxKpuPkRXxz3WM11R7o7xTV1qxoL0YvT97jj9jtTLGxqhJKwqz/v+7wVbagCCEW1pPvF0AQgPOB0EgJx8135zf90/Nvn/Jj3fjhawSCrFwpcuEUpLVO9Fz9Qo4HRyuuHPNnpjNzWDHLZ8WVqnocTpxrtzx4Z3GHCU9QYppUoMDS3P+aHOLb2ugM2dX7RVQl4i3gWVmp0sucnhyNYK+t77UVmmqvqQ2XAFYeFlnvDZ9IAbRzMRaXoXwCrTpYYU0CFVdac2oCoZu638eQUh8hyYagpPP+2yITCH+wJOD+yQIRDuEnW4RY5kHkfo50bJacuvVWhQ0jTz7XFaWki/nufGyekNyvCpvnl7181hlb7xpV219h6gxhJmWwOuwqp6glNVNLxT2aiCdHGBqa0TT4rjjpSfzIHuv+yTsQ6cYG8Cugpj0mFNKeLqL7LeQz1RxQkyiYmj43UJENR/jXmEkS2aHkKsRVZSY3guVbI9Y622EHs3yXmpvwGsPCx2/4xCKVKipBNqlX4cDKuc9Y3eg46ooyEmRJBY3djkxnr/eYtmwjFKNqJHzdUMsIjDd5fikx93ZrgO3zmXFSH8RXg/nKgumNrZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(7416014)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cTNH6emoUsYFpnt4cIneCr3XVK9TjxTNUp4mqHUkEuzqmbnuuMvYncwNwg?=
 =?iso-8859-1?Q?nVu3i051ae9iv0Ei1NiHYTjlij8lqqfJmr3oFQYtlEePFV8tdp42hc9pdt?=
 =?iso-8859-1?Q?XGIdHp6DPDFLU3JzjPb8pkD+iGkKxikY2uCKnIO9k6WJ4nWU3I1FSrX1gx?=
 =?iso-8859-1?Q?AphcfW6TF7Wz4hgS7vEqqfnJgZYiIvSSINbIN/0VVgpzamdVcRhFANyL0g?=
 =?iso-8859-1?Q?vwQSOlxlv/vk4DmrAvHspYi8aThqaoPX2aT0jz/R9NJL6e1EFtcHw+ZgyD?=
 =?iso-8859-1?Q?65jEODerfmVH45Dr9YHEJQPW1yHVp59IT7vCQBv2iK94iv9glHwkfEapgI?=
 =?iso-8859-1?Q?CN9c/Dp2v2YXEqHvjT3nHdL+iTZfPc1x59w+FodixWhIY446WorpYbrAB2?=
 =?iso-8859-1?Q?7fTrrImG9tEPfnavOvgvBTFKrmElQOVe/9DFlBCSyZEmmj555GiZwwXlx+?=
 =?iso-8859-1?Q?UNq6gyZxn1RdWqd68DXS0f1gP5rx5EXlHOGlAqBUPun8Q69QUmiWxjfLEX?=
 =?iso-8859-1?Q?HTRWHwnZZkW//91b63nOm0gGAWKnWiwni09VN72bU9+knuWQf6RYQB0BRH?=
 =?iso-8859-1?Q?voxub3/mkamcRq4RqiMdyxyagfUJrUM8MNQUvrrc1fObfCHYVQ3aC+VESv?=
 =?iso-8859-1?Q?f7ctJKKmI/yscqOFEdmd/RVIEFwFYvF0kUkdAIp/Z1g6wm/7X1xGVu78P1?=
 =?iso-8859-1?Q?u9PWlqSEYbsz5yBMQrDkVZ2wF5MElVxtNixzYYtucEyFZo3ncohMjueAyF?=
 =?iso-8859-1?Q?0wta0gOs7H2js4h0T9N0+AjDWOnNO34i6q0dvsscPDjoLIE+16ZMz1qgpJ?=
 =?iso-8859-1?Q?WKxI5XpCyHqEZhmxSRt4IcIXKSB7hkVzSBcHFj6G28YWzkv24ZDOmYvdwd?=
 =?iso-8859-1?Q?IADXGFpm1+e4HUHu1e497S+AFWsB28btE9sK9FYgAI5DrzSDbH0b2pyARb?=
 =?iso-8859-1?Q?pm4YW1zwYavu/HmbQyVWEK4fksg5uWWYE/Qsb+j7LTndHHHZTmHionKy+2?=
 =?iso-8859-1?Q?1PaExtUPYwYTyB7WmYy44DKRfImg1dknsjiATgmYULLt4KFWpEZd3rOuSs?=
 =?iso-8859-1?Q?gBP5u/Tjz605kJp5RKVfPjp3glAge4tdPgL3J+mcWC474e0+qMmGshmZA2?=
 =?iso-8859-1?Q?WZTT4Krr3kM020b1ggpcLhBJ9g/o7S8JHWfBk56yfNKJbiBS0jKGVQdm2d?=
 =?iso-8859-1?Q?r8Nnk8hbbzqDPcWH2cnk58f/t3/DPqcChA8uz75YmnXpGbdvV5AsrBZH/c?=
 =?iso-8859-1?Q?Wnj2hwlFlAmpXkzgrptWsp0S6bApE5AmZ2/EmubzSxYOgIQdmoZFDSBgGZ?=
 =?iso-8859-1?Q?6UpgW6xqujmT9jvSIU/NAxZ2yP8zM3thFsgTaMxfDYcP/unB3Rbuz6fsbq?=
 =?iso-8859-1?Q?brPnx4H5KKlhhg3eSxWw/s2aFQz5KAepog76miwOQGwENiZk+/Do4rrPq7?=
 =?iso-8859-1?Q?pZseb2KP6l410YB3wuSSEGTDR+BtW/VhORMY5j/SgvSaaFcZoqX3e5/vmG?=
 =?iso-8859-1?Q?shXIhRF996TRqGaDgNa1T3PqBylrCG42sb7P+PgD1nAY2zXFtGzw5itjkn?=
 =?iso-8859-1?Q?9eIQayma0u3Cfnm6vRsu8e+GtndlFlBP1Sy9/ELkhJ+/j6caQ6TkJAhhSz?=
 =?iso-8859-1?Q?skvuG0Dvoz3Q3ZZGNudK5y/dsCFZgnTzWmAvmWnIJ1AXyVXYpRjd72DCKy?=
 =?iso-8859-1?Q?7BPA5g9Sj7jgpFCDBZx/eVvSXA7H3rT3fy48TYZBphrnL5L0cLzEOwflh7?=
 =?iso-8859-1?Q?TQLSoKhWmcCmv/d9E8UcqCUkVd8Qn6NABV5wjcja4xiEmqZ5kWXeqT4H/1?=
 =?iso-8859-1?Q?RvWwQMHFRSsHbsNCN/sVOKQILY0a2gk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43056d0c-dab5-4045-1752-08de94e08a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 20:02:04.1871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4b7e/Ec4HV9OXQ95rDBx35uTFWRZoiV3/sIRKWq6DQGHogHhYOmQNpDjSHNYihX9phG3aeaM3f6Qf2OWU/WPE9UCuOo359alTQcnX1cLjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7510
X-purgate-ID: tlsNG-4011c0/1775592126-0EB4D0B1-35D6F21F/0/0
X-purgate-type: clean
X-purgate-size: 5667
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:samaan.dehghan@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:samaandehghan@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 897343B437D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Saman,

Saman Dehghan <samaan.dehghan@gmail.com> writes:

> This patch enables building Xen for the arm64 using the Clang/LLVM compil=
er.
> Changes include:
> - Add explicit -march=3Darmv8 flag for arm64 builds.
> - Introduce `READ_FP_SYSREG` and `WRITE_FP_SYSREG` to encapsulate the req=
uired
>   `.arch_extension fp` directive for system fp register access.
> - Add ".arch_extension fp" to the inline assembly for `save_state` and
>   `restore_state`.
>

It breaks GCC-based build (see below)

Also, are you going to address to other issues that I tried to
tackle in

https://patchew.org/Xen/20241129014850.2852844-1-volodymyr._5Fbabchuk@epam.=
com/

?

> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>  README                   |  2 ++
>  xen/arch/arm/arch.mk     |  1 +
>  xen/arch/arm/arm64/vfp.c | 34 ++++++++++++++++++++++++++--------
>  3 files changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/README b/README
> index 889a4ea906..67c1aa7fe6 100644
> --- a/README
> +++ b/README
> @@ -45,6 +45,8 @@ provided by your OS distributor:
>        - For ARM:
>          - GCC 5.1 or later
>          - GNU Binutils 2.25 or later
> +        or
> +        - Clang/LLVM 11 or later
>        - For RISC-V 64-bit:
>          - GCC 12.2 or later
>          - GNU Binutils 2.39 or later
> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> index 9c4bedfb3b..bcf548069b 100644
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -13,6 +13,7 @@ ifeq ($(CONFIG_MPU),y)
>  CFLAGS-$(CONFIG_ARM_64) +=3D -march=3Darmv8-r
>  else
>  CFLAGS-$(CONFIG_ARM_64) +=3D -mcpu=3Dgeneric
> +CFLAGS-$(CONFIG_ARM_64) +=3D -march=3Darmv8

This breaks build for me:

cc1: error: unknown value 'armv8' for '-march'
cc1: note: valid arguments are: armv8-a armv8.1-a armv8.2-a armv8.3-a armv8=
.4-a armv8.5-a armv8.6-a armv8.7-a armv8.8-a armv8.9-a armv8-r armv9-a armv=
9.1-a armv9.2-a armv9.3-a armv9.4-a armv9.5-a; did you mean 'armv8-a'?


>  endif
>  CFLAGS-$(CONFIG_ARM_64) +=3D -mgeneral-regs-only # No fp registers etc
>  $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> index c4f89c7b0e..cd5c97cfd0 100644
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -6,7 +6,8 @@
> =20
>  static inline void save_state(uint64_t *fpregs)
>  {
> -    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> +    asm volatile(".arch_extension fp\n\t"
> +                 "stp q0, q1, [%1, #16 * 0]\n\t"
>                   "stp q2, q3, [%1, #16 * 2]\n\t"
>                   "stp q4, q5, [%1, #16 * 4]\n\t"
>                   "stp q6, q7, [%1, #16 * 6]\n\t"
> @@ -22,12 +23,14 @@ static inline void save_state(uint64_t *fpregs)
>                   "stp q26, q27, [%1, #16 * 26]\n\t"
>                   "stp q28, q29, [%1, #16 * 28]\n\t"
>                   "stp q30, q31, [%1, #16 * 30]\n\t"
> +                 ".arch_extension nofp\n\t"
>                   : "=3DQ" (*fpregs) : "r" (fpregs));
>  }
> =20
>  static inline void restore_state(const uint64_t *fpregs)
>  {
> -    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> +    asm volatile(".arch_extension fp\n\t"
> +                 "ldp q0, q1, [%1, #16 * 0]\n\t"
>                   "ldp q2, q3, [%1, #16 * 2]\n\t"
>                   "ldp q4, q5, [%1, #16 * 4]\n\t"
>                   "ldp q6, q7, [%1, #16 * 6]\n\t"
> @@ -43,9 +46,24 @@ static inline void restore_state(const uint64_t *fpreg=
s)
>                   "ldp q26, q27, [%1, #16 * 26]\n\t"
>                   "ldp q28, q29, [%1, #16 * 28]\n\t"
>                   "ldp q30, q31, [%1, #16 * 30]\n\t"
> +                 ".arch_extension nofp\n\t"
>                   : : "Q" (*fpregs), "r" (fpregs));
>  }
> =20
> +#define WRITE_FP_SYSREG(v, name) do {                   \
> +     uint64_t _r =3D (v);                                 \
> +     asm volatile(".arch_extension fp\n\t"              \
> +                  "msr "__stringify(name)", %0\n\t"     \
> +                  ".arch_extension nofp" : : "r" (_r)); \
> +} while (0)
> +
> +#define READ_FP_SYSREG(name) ({                         \
> +     uint64_t _r;                                       \
> +     asm volatile(".arch_extension fp\n\t"              \
> +                  "mrs  %0, "__stringify(name)"\n\t"    \
> +                  ".arch_extension nofp" : "=3Dr" (_r));  \
> +_r; })
> +
>  void vfp_save_state(struct vcpu *v)
>  {
>      if ( !cpu_has_fp )
> @@ -56,10 +74,10 @@ void vfp_save_state(struct vcpu *v)
>      else
>          save_state(v->arch.vfp.fpregs);
> =20
> -    v->arch.vfp.fpsr =3D READ_SYSREG(FPSR);
> -    v->arch.vfp.fpcr =3D READ_SYSREG(FPCR);
> +    v->arch.vfp.fpsr =3D READ_FP_SYSREG(FPSR);
> +    v->arch.vfp.fpcr =3D READ_FP_SYSREG(FPCR);
>      if ( is_32bit_domain(v->domain) )
> -        v->arch.vfp.fpexc32_el2 =3D READ_SYSREG(FPEXC32_EL2);
> +        v->arch.vfp.fpexc32_el2 =3D READ_FP_SYSREG(FPEXC32_EL2);
>  }
> =20
>  void vfp_restore_state(struct vcpu *v)
> @@ -72,8 +90,8 @@ void vfp_restore_state(struct vcpu *v)
>      else
>          restore_state(v->arch.vfp.fpregs);
> =20
> -    WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
> -    WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
> +    WRITE_FP_SYSREG(v->arch.vfp.fpsr, FPSR);
> +    WRITE_FP_SYSREG(v->arch.vfp.fpcr, FPCR);
>      if ( is_32bit_domain(v->domain) )
> -        WRITE_SYSREG(v->arch.vfp.fpexc32_el2, FPEXC32_EL2);
> +        WRITE_FP_SYSREG(v->arch.vfp.fpexc32_el2, FPEXC32_EL2);
>  }

--=20
WBR, Volodymyr=

