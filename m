Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK7RJ4wP/WmwXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:17:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3984EFAE4
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303107.1576653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL725-0000Ve-CZ; Thu, 07 May 2026 22:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303107.1576653; Thu, 07 May 2026 22:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL725-0000TZ-9k; Thu, 07 May 2026 22:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1303107;
 Thu, 07 May 2026 22:17:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wL723-0000TQ-5l
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 22:17:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL722-007eMf-1r
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 00:17:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd0f19-bab6-0a2a0a5309dd-0a2a4509adca-36
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:17:22 +0200
Received: from [40.107.130.140]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd0f71-2497-0a2a45090019-286b828c3707-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:17:21 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM0PR03MB6212.eurprd03.prod.outlook.com
 (2603:10a6:20b:15a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Thu, 7 May
 2026 22:17:19 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 22:17:19 +0000
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
 b=f5MEGmy/J+gX5vtF5LqRN11jrak48WBgme41K0T+4hWH6F7TVRDvaDN+CXj0NZ2vuhzhhpYXQZUxP7oA6pymslBGdt7L8IiDIZDKBfMcsUneXD0p3B/e/bB4iEZSoCK0USddwyxPWPJ3PQ9rka8Unxcd4RPX/o3vEhB9K+5lvsF0itGoNJFkzcorFnyF7PLMLotFSaDNNfJoNwf5mqoMTsAwckBdSfxdIfuHQd7KJEYngUoVYx7k7GvsjlBDybVTvKBS6zki+GzlGByh+gAOARGTEK312Fzl8GOBOhZ3jsCMYQcOf3dEl4i8G/p2RGKjcim11tY0wOpcu1mKXEHNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gj+H61b4cBPdhCrcTDxbYcNZB0RnTmLc5YJRzY/mpw=;
 b=DIG4Eat6loYlmA87X6O9aH0RgBJ/UqrE5OUDG8ENegsYhIAaoaCMCFnH4Dx2cOrVQqrhJvctU0/Bo6NAevVeg42gIbBT7bPatU+PE08FZaJKMGOmsvPi0OdvEPMNW6O374mgJ03wlFF1yJyV8tT5gKcp/p+CcGQA4eleNeQ3sV1Ke7Yw5LRuHlMICr4qcGDjkkQTIXhTJpqraOAIsrO8igzaUqfDPFI4GHhwcUYXzfqBCcY8Ls4rdSlbw+I3R49PHjnnR4R7He/QzomlLqZzYhKfYu4rDidqUF9mhu0XM7i2xvbbOQJtrb8LIcdn6ngiIe9BA4wZlq55ifnkAeSXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gj+H61b4cBPdhCrcTDxbYcNZB0RnTmLc5YJRzY/mpw=;
 b=j7OLvvOvF01Swj8VkNF5AIikZ99svwxBpfKOUyALLoZgoW7O0nG1pTkWt7XB0N2iVhsLP3TuLG+whl5pcmcCsy5XxXpfFKqKKwv1DM2f4P8ULpEoDzc6nkyw6h2iUxdGI4e39pEg46AknizWD0K9rFu+A+FmkeMiiZfAHqK8TuaYDY3/vZ5ZO6p2ZbfOoW2yo6Pe+EQjxX8Tf+DHsgx2fXfEK6ShDjGKi3k0+FhcD21BtxY8GNVXxja2HJ0q8xOTIdF8QbEMsq5J1WvizLc9p1TgpxPkQNRgoAtkcQxuvsuC/9CGn466mjFzXrfR9ovnNfSosL8x7axlZrmfgpny0A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
Thread-Topic: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
Thread-Index: AQHcwo4hPbJwnp+6uEuyL+cZ1kMgQQ==
Date: Thu, 7 May 2026 22:17:18 +0000
Message-ID: <87tssisw41.fsf@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
	<f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Thu, 2 Apr 2026 13:45:12 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM0PR03MB6212:EE_
x-ms-office365-filtering-correlation-id: 913b6b2c-ba50-4cc1-0074-08deac866745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 FyTFUJsuk2TY+xKhwJA8ceED+HtkePVhPqXYp5nfbYLXlyv552kkn18mxXjElYf409iDemuHpJknMNYiU6dLJ1vSTBxX1ZglRS9k7N+7lNgrD62WTsP5YqeA3i2ysbbPMqt/zD/rHZS/G0LcnaetqtAsIWJ+8XYacqvS3UP9wDRLOGDTI5Cg7noRIP+mGacuZqRKjWE2tEOapsEoGOFC+s8nxiJPQFv2Vhn2IUwakDsC5caz+zdOAk6ifA8vAl89Bcsgl0HfAO59IeDwjM/yX7PT7NHn5Q75nkPzbGO+UPAIETuXu/IcJ2mE/LQ6C6ekT8gvEejACMfci7zyNcWAXsUWXlYwkS2ahsCC2uCGCvxon0EzACKhmWe/VwS+ZfzFVjHr9ICpUoXc7faQIRFmrJioaNqnW9yrwpLqOcor+aTatl0Vh7QH+PUiiVYZRAsV5OG5aN7BPElkNBiDk/nfsudPhwxFn2xxlT4MYo/6KI/QzJmAg6i6oU60vRksAarSYf8j77C81VzUf+bEQkPsU5wNzrbLAr7tzXSTx1KWtCKlWZjMcfnpxg3cYrkgtpivxIh1ystC7CCuPICXwbdgv1YIgRqJ0EStlhZCbjW3bNi1uGjODzIs41vyPaBJeVjhQK6XvGomyCzmJFjX3M9b/75gPqhAM4x3ntkv4zS2duiWZ2iWKPk3Wg822ncHwo93P5r7zn0l+CYWjc0QgZWVzqSJLd9zWLbvX7Sn45BvkeZR8c1HuzqUxeEQ0ZbQMzxY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6wURhop9aRvwko2xNR1DffMKV9Ly9hzEYAPsAngryHwt5+5/5ltluiw1Iy?=
 =?iso-8859-1?Q?yojipLOTJ/6NIA7SIqN13SerShNEz0Sd12a4u3tw2DAo/AzFgOx/2DayC2?=
 =?iso-8859-1?Q?NfnX0dziH0ca1zItvnNa7fDkCtyP4lI3BDj/wkt3P+XvTS4bhBS944eLB1?=
 =?iso-8859-1?Q?fXiWnS4yvV6pfVFXMMRFuQa80hmqPRh+t/WW44b5HTjxy+n3/lCqI1Zijx?=
 =?iso-8859-1?Q?ikgXUKj3WJ+0QWv6yejreEQ1HopHDDgTD5x3cNhvdF6L+GK6tTl0yywQiU?=
 =?iso-8859-1?Q?+1oq2ad1kwGT+mnyjKmqDexQCxhrdcd9cw1Q/H5qg+TVGzU+Ios5Bj9ynL?=
 =?iso-8859-1?Q?t1wFr8uh+Kn8wEboFqKtIeDlDvi5AgaSEGaPIWcBm+NJro2ZmFL45JtZKl?=
 =?iso-8859-1?Q?uxRB1T6h7XzNZiDDxtrDFnFuevHS0NCXzstzciIMfY4nOpnFpXXqGKXqAL?=
 =?iso-8859-1?Q?xaAgqH0RhGhmCPbLYQZ07QYxPO06aws9mQYKygmWd8uNMl0cYSMdcodxGj?=
 =?iso-8859-1?Q?QiJzMDpkmdvhHpuO6Agki4klOeudebUx6wM3v9O9/Uj6J1qtLG3oN/WFOO?=
 =?iso-8859-1?Q?AxS5weX4z1Rr/nIFmXE3pjCmfjDpvHPDcsDiIyLK3sA1qM2tXfyr0tutFy?=
 =?iso-8859-1?Q?4NJMf1GEYOxPt77kOHtj1fFcJf+xGtQrh1qa4RDGrAgxIxlGIfiS5Oxaj6?=
 =?iso-8859-1?Q?wWH8LBHNvQY0wRhnbMtreFJwIO3//Ef+IHEWEDdWMf4hsHxNUhbJd3ZfOr?=
 =?iso-8859-1?Q?TeTeIhT3NUXo5y4uLfMOq/ulryfZLbiTzzH4PzphDhk5aqzTWvvWUZWCV7?=
 =?iso-8859-1?Q?KisIECRC+s2Ooeu4KAL9Vy8R8KcGKCu2QQptyHh+QE40yI9NjsD/4zuYDs?=
 =?iso-8859-1?Q?ZsdbZc7oNW7QKwVk9CtZAdD0B9qBCmRn1mC1wID0HWb0xaEGrj9jDmmpmv?=
 =?iso-8859-1?Q?tbzXSN6mFqEUdiA4KNIPXso8uQATMadri6p5GHm4/KmjwAJX2k/fb4/cKj?=
 =?iso-8859-1?Q?CxIx9sJI5ez0rk4lWNbNEyrR3ww4IxnOEqyOfA9CFHAunQjqaNTXvzVtjg?=
 =?iso-8859-1?Q?EzxFONmY2ghqP7+PrFGXgtwYzgIpH1dRm/5821ojgYgDzzNEMzKH4BY6i5?=
 =?iso-8859-1?Q?QJA9qQXbnkqTwJVK7cftEIFzBuSk1PG1aAGsWT1eTZyujUhzVGQ7u9nXlZ?=
 =?iso-8859-1?Q?XDxs9MUVd3JhXOPE2BHtWMiL4TaMSMNFjmxGFJCQkZeMfHxmspRja7ZcMp?=
 =?iso-8859-1?Q?lBfwEVCY0jTRbn2IACHJAdlKmtMyKdNvXxvMCeBS/ZWTJlPmRiOyIj01vG?=
 =?iso-8859-1?Q?fEhASPY4QdBwI2doAnKJls73MbaX9DjM47SBy6t9LjVQkNU+9xGKYrbHF8?=
 =?iso-8859-1?Q?HKf9mK5g1L5RZBNcxwadOtCZfVR4ceS0KdAZkC3XceYMDO0iHzthR74oN7?=
 =?iso-8859-1?Q?noskYhIqrk6arU3n7mPKCQAGXh6gSpwLz4NeqO7dBFcktu3bQ+LesUHfEP?=
 =?iso-8859-1?Q?ymJQ6J1NH2a2ahTdYPskPzsuU1yURAJjEKRSYPFjZIa2SasC9SBFThYMQ+?=
 =?iso-8859-1?Q?nHC/fy3nuchoX8VZEm48Fmwr4YLCs4HRcMNoBa7vJuQYk+OARjzt4C83fj?=
 =?iso-8859-1?Q?uuK1RlsX8qES3Fk7hbnvxsCqb4ZQixw7+o0XVGb9pvhHg8p1unV13TSfwG?=
 =?iso-8859-1?Q?uGQw/Cz851tof/UAmbNMqbEhYgVRA1jj4w2OWAaXMOgwDJmVLNgd6Zx9O0?=
 =?iso-8859-1?Q?NJyPgTTp4THYx6t/kiKevI258SaDOy0PGvKYvzhrqSUYP7HYSMLAxrKuSX?=
 =?iso-8859-1?Q?XFLg/n7OT4nMxELop8RBzu5vMee/Igk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913b6b2c-ba50-4cc1-0074-08deac866745
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 22:17:19.1191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kc52ypWEbkIKpFphQE4GU0MeY2jv9vx0iYAZsHWt7o+rap5GkYXX9Aegw/aR2khML10P3eFnU6MJh8jbfYhGNSutRNQ8s7/dwqUt9EKTJTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6212
X-purgate-ID: tlsNG-bad1c0/1778192241-37175A53-66E71E72/0/0
X-purgate-type: clean
X-purgate-size: 8203
X-Rspamd-Queue-Id: EB3984EFAE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid,epam.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Mikola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> The context of CPU general purpose and system control registers must be
> saved on suspend and restored on resume. This is implemented in
> prepare_resume_ctx and before the return from the hyp_resume function.
> The prepare_resume_ctx must be invoked just before the PSCI system suspen=
d
> call is issued to the ATF. The prepare_resume_ctx must return a non-zero
> value so that the calling 'if' statement evaluates to true, causing the
> system suspend to be invoked. Upon resume, the context saved on suspend
> will be restored, including the link register. Therefore, after
> restoring the context, the control flow will return to the address
> pointed to by the saved link register, which is the place from which
> prepare_resume_ctx was called. To ensure that the calling 'if' statement
> does not again evaluate to true and initiate system suspend, hyp_resume
> must return a zero value after restoring the context.
>
> Note that the order of saving register context into cpu_context structure
> must match the order of restoring.
>
> Support for ARM32 is not implemented. Instead, compilation fails with a
> build-time error if suspend is enabled for ARM32.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v8:
> - fix alignments in code
>
> Changes in v7:
> - no changes
> ---
>  xen/arch/arm/Makefile              |  1 +
>  xen/arch/arm/arm64/head.S          | 90 +++++++++++++++++++++++++++++-
>  xen/arch/arm/include/asm/suspend.h | 26 +++++++++
>  xen/arch/arm/suspend.c             | 14 +++++
>  4 files changed, 130 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/suspend.c
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 69200b2728..c36158271a 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -51,6 +51,7 @@ obj-y +=3D setup.o
>  obj-y +=3D shutdown.o
>  obj-y +=3D smp.o
>  obj-y +=3D smpboot.o
> +obj-$(CONFIG_SYSTEM_SUSPEND) +=3D suspend.o
>  obj-$(CONFIG_SYSCTL) +=3D sysctl.o
>  obj-y +=3D time.o
>  obj-y +=3D traps.o
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 596e960152..2cb02ee314 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -562,6 +562,52 @@ END(efi_xen_start)
>  #endif /* CONFIG_ARM_EFI */
> =20
>  #ifdef CONFIG_SYSTEM_SUSPEND
> +/*
> + * int prepare_resume_ctx(struct cpu_context *ptr)

"cpu_context" is very generic name, especially taking into account that
you are introducing a global variable with the same name. How about
"resume_cpu_context"?

> + *
> + * x0 - pointer to the storage where callee's context will be saved
> + *
> + * CPU context saved here will be restored on resume in hyp_resume funct=
ion.
> + * prepare_resume_ctx shall return a non-zero value. Upon restoring cont=
ext
> + * hyp_resume shall return value zero instead. From C code that invokes
> + * prepare_resume_ctx, the return value is interpreted to determine whet=
her
> + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
> + */
> +FUNC(prepare_resume_ctx)
> +        /* Store callee-saved registers */

How are planning to synchronise this code with actual cpu_context?

I am pretty sure it is better to use offsets generated by asm-offset.c

> +        stp   x19, x20, [x0], #16
> +        stp   x21, x22, [x0], #16
> +        stp   x23, x24, [x0], #16
> +        stp   x25, x26, [x0], #16
> +        stp   x27, x28, [x0], #16
> +        stp   x29, lr, [x0], #16
> +
> +        /* Store stack-pointer */
> +        mov   x2, sp
> +        str   x2, [x0], #8
> +
> +        /* Store system control registers */
> +        mrs   x2, VBAR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, VTCR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, VTTBR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, TPIDR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, MDCR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, HSTR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, CPTR_EL2
> +        str   x2, [x0], #8
> +        mrs   x2, HCR_EL2
> +        str   x2, [x0], #8
> +
> +        /* prepare_resume_ctx must return a non-zero value */
> +        mov   x0, #1
> +        ret
> +END(prepare_resume_ctx)
> =20
>  FUNC(hyp_resume)
>          /* Initialize the UART if earlyprintk has been enabled. */
> @@ -580,7 +626,49 @@ FUNC(hyp_resume)
>          b     enable_secondary_cpu_mm
> =20
>  mmu_resumed:
> -        b .
> +        /* Now we can access the cpu_context, so restore the context her=
e */
> +        ldr   x0, =3Dcpu_context
> +
> +        /* Restore callee-saved registers */
> +        ldp   x19, x20, [x0], #16
> +        ldp   x21, x22, [x0], #16
> +        ldp   x23, x24, [x0], #16
> +        ldp   x25, x26, [x0], #16
> +        ldp   x27, x28, [x0], #16
> +        ldp   x29, lr, [x0], #16
> +
> +        /* Restore stack pointer */
> +        ldr   x2, [x0], #8
> +        mov   sp, x2
> +
> +        /* Restore system control registers */
> +        ldr   x2, [x0], #8
> +        msr   VBAR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   VTCR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   VTTBR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   TPIDR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   MDCR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   HSTR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   CPTR_EL2, x2
> +        ldr   x2, [x0], #8
> +        msr   HCR_EL2, x2
> +        isb
> +
> +        /*
> +         * Since context is restored return from this function will appe=
ar
> +         * as return from prepare_resume_ctx. To distinguish a return fr=
om
> +         * prepare_resume_ctx which is called upon finalizing the suspen=
d,
> +         * as opposed to return from this function which executes on res=
ume,
> +         * we need to return zero value here.
> +         */
> +        mov   x0, #0
> +        ret
>  END(hyp_resume)
> =20
>  #endif /* CONFIG_SYSTEM_SUSPEND */
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 31a98a1f1b..c127fa3d78 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -3,6 +3,8 @@
>  #ifndef ARM_SUSPEND_H
>  #define ARM_SUSPEND_H
> =20
> +#include <xen/types.h>
> +
>  struct domain;
>  struct vcpu;
>  struct vcpu_guest_context;
> @@ -14,6 +16,30 @@ struct resume_info {
> =20
>  void arch_domain_resume(struct domain *d);
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +#ifdef CONFIG_ARM_64
> +struct cpu_context {
> +    register_t callee_regs[12];
> +    register_t sp;
> +    register_t vbar_el2;
> +    register_t vtcr_el2;
> +    register_t vttbr_el2;
> +    register_t tpidr_el2;
> +    register_t mdcr_el2;
> +    register_t hstr_el2;
> +    register_t cptr_el2;
> +    register_t hcr_el2;
> +} __aligned(16);
> +#else
> +#error "Define cpu_context structure for arm32"
> +#endif
> +
> +extern struct cpu_context cpu_context;
> +
> +int prepare_resume_ctx(struct cpu_context *ptr);
> +void hyp_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  #endif /* ARM_SUSPEND_H */
> =20
>  /*
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> new file mode 100644
> index 0000000000..e38566b0b7
> --- /dev/null
> +++ b/xen/arch/arm/suspend.c
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <asm/suspend.h>
> +
> +struct cpu_context cpu_context =3D {};

Don't need to zero-initialize a global variable.

> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

--=20
WBR, Volodymyr=

