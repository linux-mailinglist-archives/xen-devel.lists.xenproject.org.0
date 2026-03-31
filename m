Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLrXM+koy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3563632C2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268229.1557578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH4-0000ha-Jq; Tue, 31 Mar 2026 01:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268229.1557578; Tue, 31 Mar 2026 01:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH4-0000dM-Bp; Tue, 31 Mar 2026 01:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1268229;
 Tue, 31 Mar 2026 01:52:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH0-0000Hh-C8
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OGz-00HCrd-OZ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb2873-e002-0a2a0a5209dd-0a2a450ba5e2-30
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:05 +0200
Received: from [52.101.70.86]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c5-ef63-0a2a450b0019-34654656355b-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:05 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:04 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:04 +0000
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
 b=a/kAwxX4+OBTUH5X7AtKQy9OQOis9fdTdtfWvElbqS6VQ/h9SjNErw1LTQDahY0vS1eYXyLjVTQH41ObBLlAjblpnDXgxrApf4YHGg1wl5cTbbY0AhC0ZwO7D01DFZkgus79ViWQrI2dW1q/wySrJMKE9vyyuA7sotvx8p6pm8Em6EKaNlao5zs+0P7BVRYY3zgTZbqUm5S9rCTFs7IkUWL4oDZlLJzSp0oOUBqhrX+MrF5pl8TSm8XbQVmuBUFZfPHbSHFMZ8VeOiKXkjqwI5Ds1LEhZOnvoxftsKCQDykglJToPM9UMGUh1gfGvJ162GKjpXNQbHm8Fb60J9HggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UQkALZNSM6W80EXWFmegQRVGxnMDJJO0HOBLE/pK3E=;
 b=PmmpkyYhA+bbAUusRI8CRhu2I/9mrji1811jjLx0cC2ofjmQYnzUjSlsGwo63Tl4KzdJhKvpqWj43C8Py+55jxXOgZUpx5usJ2O8/VJnQPNOObv5GDbdH0qI3WeEfKotxeUzM6fEEmhT7FXJ02KpLkUUlUFdl/62Oyf1YoEBhYxFD0JTBd4OIUCDJ1JmzLugrhQvjz5vWvIJYOWltr2FzzB4mdcFTUEfYI3fgrCLQAxtnODkcXHzrMBLCNt3vs/upw+FGL/AF8023AO8oT3XqmcUkHGu25zzQAZ0LT+2Wl2P+juY9p5uUDNbXDeLd3easyXDs3q5HPsi5eG9WzyTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UQkALZNSM6W80EXWFmegQRVGxnMDJJO0HOBLE/pK3E=;
 b=DVh2IOnFC2KJgtTc8ji5SntU9cHJWMWJSuP/qk2hsYM7PLpqbszAnCUHucfcVOYlKktjFbGshjpHIXaJig/YKGsM/bnRwcAaQcsCwsN52/s2f/vm1hAeFk14i5FRJqEAIkr6+L+xLaxnL0NTxivI78A+AA5t6kd5teiwiEdCk01ZKoj+XiAEC+qCGnS+BXttdkxrbsqVFsFTNlJLogjKHr4ssdbYOC90qUs8pIKDVyoHbK9Xn/pmi/A9rNCha9DerISDhJQUXmvCkbpeXadXnn4e8pImqWM1W7AhaCcviAeb6nS5/rUyTtZIZLJK1SnoU+vDomMqAYNxXljbkIfEzg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v3 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Topic: [PATCH v3 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Index: AQHcwLD51dgqnwB0Y0ytQjpytpVPOw==
Date: Tue, 31 Mar 2026 01:52:04 +0000
Message-ID:
 <5bcbeb1d614be413c13196a38d13eb3de5c549e4.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|PAWPR03MB9202:EE_
x-ms-office365-filtering-correlation-id: f37b7569-a499-408f-b2ad-08de8ec81bab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 Htxc+WsG38+/VGAgJswQHpLD6eWxIJds0saNm8b8QTVBcN/36mgzmkfUrvgJr7E/JWP9qfY4bMftEfgwIGY6TbVdFpziNKHaYoRh3kK1CkVIdzRrNBk5R3t71XdHMFYUn3S1PTTNoregB1TA8BWwnpZSLmpm7k5Tke1c6fW1x56xsXjo5cp1GLbQ4BjA2PZYLVs7ZbulwepaJnXVx7czR1oneUbQYrr8e8WGtohKnQHo0uJ87NUbatD6I7BCcOmVDHq1rwP0loJ0InuOoXk+4EdlQzdhPA6uXkJ9YZMsPSvr4uu0dU69vQnX0dS+GfpdewGtbhjZxG5gx8XDmxs7yI/K8HcUqo1SKzd8AbCxxg9DpvxN3Ww+Roy/BsVaQ7uvLd4eAE4dD/ZeuKTJC2rmlNK+mDAI9MQ7LxPVe5jN0URmpfn13wCjpZYXhoeyHY+jrtsjXWWNE+vTgN/iDtrKFpXD2SY0TqTDITkhwMNji8WzxUFpnPBfGXda4vr8p6lUXrVwxdQgfZFUy5sXDADn9zWHmSddM6cTadvOqAN/2ep+dEYk535YCHvQMh9A7bhduOP+4E2STIqUlT3S//WpKoBtAf1hvzAB4EDrSoZQuUFOTdIHE+Lt4a35lnSUqntzuTvess7HkLOMB3KQbiz8AF5BrbFH73dXgtXqxBm+MqnU9YgwaShRLhJy9RabDdfJuiki+8cA5Xaq4XAZNq4FXi4fIhH29Eg/myB0vilimjG6vBlyK9xprV2eKx9w3xcN2wXH+N7TgNP77Almn1NEyRxkpUksC6SCpM/SAklt1yI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zS4NaBLnoCFnQhnfcaQN+869GG7dRflNVYPL8VKqBW6wQf0KJEc6SKKlWB?=
 =?iso-8859-1?Q?IvBMM9lyY85Atp+I/8hj570323lip7xrt5PjRBrvg3Vba6CtJaraoj1XYZ?=
 =?iso-8859-1?Q?Tomv+2dkROnre0Y0tgr/LWAeboxNbcSiVZ7YOH/9o3ByDHX+BukZkVazJf?=
 =?iso-8859-1?Q?Bdg6cXKHlZq3rGZZe2NwIO76WSMfYKb21No6oYsHI44w9Rzo3Sqa/JHIss?=
 =?iso-8859-1?Q?0yw9PbQDdlo99G//7D1mXyhF6FKbK25+puuCIhhsr19598vFEtQM5a0+Ud?=
 =?iso-8859-1?Q?z8LjgPX2rc8u2T169lTVJCO2dYakncZEq8JOpkBVNXyjrazqPyG5mmKO9M?=
 =?iso-8859-1?Q?nF2YD4Dgw9SZLQl9E8Sx7VHQzZW2TIk3Pb69BhHLeyWpb0uBgUmfr+1nSG?=
 =?iso-8859-1?Q?Q0KzT6UIKCQwOzHcjMKXVt0/eutW3YEI2RrlKYFbdWtWXFiJtAOM/KCgTC?=
 =?iso-8859-1?Q?9bG+VFn5nbd19JjIdXnfpNrjaNosb0Bw4aTGkfur/wRral+iTMPdmGefPj?=
 =?iso-8859-1?Q?6qK8t7Bp56AlUrs7fQxg6D810nT9SWMgXkpfVP/FvY561XgqQQW1p3dzEO?=
 =?iso-8859-1?Q?EZYbPvZy6QVcKLZudIxwnSFUhQzCB3VXk3DMd0eI+avAENCgwTUrIiFetQ?=
 =?iso-8859-1?Q?1xQEva8KTGatGqQ5RcPLf0HgzLajAfOnFshgesWbfpeMSMukCTFWCNG6Qy?=
 =?iso-8859-1?Q?qNb/sBSDrufREPpJxxUw/cK15UxMdmt+nD8XLDNOnpipvLM0e3m42t5jh9?=
 =?iso-8859-1?Q?hThO2SLyB/qUJR05XjIv58iyJoyROm5xfnCL0dezMeGi4FGkf0S0ImEAxu?=
 =?iso-8859-1?Q?O9+BWMFuRb1n1KfKk3IGRRdbT0cBmE4kQrDOVP8RH9XZAls6yAN3S5mY3f?=
 =?iso-8859-1?Q?20Oyr0YTjuGbP51nbIQ4AiC+pT1ZPb5FlfrmBesIO856zMGrwuT6ETDlOS?=
 =?iso-8859-1?Q?XbC6K0aQTjMoSczlu+/cWsCoJHtd8KpptLREutwDnXzeH0h08A9O+BENdI?=
 =?iso-8859-1?Q?uupJ8CtM79EHmcMlOKrCTsa3PQPCAoTbtCYxc1jURqygwTTEKm++uhLCy8?=
 =?iso-8859-1?Q?90lAzPR7toMA+FSGk4CtEGdJd50zFbMHdIohgxBHJuVeqhj5OXOwVzSyOm?=
 =?iso-8859-1?Q?Nm0SSPzb77Rr/djPbEh0Fi3+TG/7fRUNTq32Fm06z0C4mG/4oFmNm2Ytu/?=
 =?iso-8859-1?Q?vcG747eGMMRRHX6DYNIbMNpc/WX8RCYdR0HtUIooT86/I9AUqeKO5vAixF?=
 =?iso-8859-1?Q?ZZAI5jtYJIUrVh9nh4sYxZyC+mCv3DU59z0Vm9kX9O6gziBpHSzpM1qOtg?=
 =?iso-8859-1?Q?X/2FaPUmXHLpHB24+EhazGJh9aiMoQfy/NwuD4fiHFWR4kAdMntbjsdVp8?=
 =?iso-8859-1?Q?+Gh2npM7uszs2jlwWnKBdK7MYCqFbhTRouUsN+SvSEbLdbzrvn9uZC7QKj?=
 =?iso-8859-1?Q?f/x5RiLmkvhWtDphODCHJ+04yzLEj1JoOVYk6D6VF+wJg3cQBa0kHpfwMl?=
 =?iso-8859-1?Q?hwKI6PmDa3LvWMWo4jEgsIBjNVxcuRmvk+rSFXg4oB7elc/jNoILYGmmws?=
 =?iso-8859-1?Q?R+sl0RKO4vd061CPbNGahNUwm+Nx+hUkLh9wu1chWQnUVA0Jpuf9I9EWDL?=
 =?iso-8859-1?Q?I5nw6n9fZCM0nBbO+pmYrZlCGA5TG2dX9bAtDVZG3BD6VLa2fun6muC2sq?=
 =?iso-8859-1?Q?0PtWgUJEDyQfqRLyJM/TADnkH/uyqWLbCXUUp5nlHfhZLp+DNAyUJC9Guh?=
 =?iso-8859-1?Q?Xo6a1uCLO99wWHsZPdEAAk3OnxBH9LrQ61PAVCugPCFNWPUmglfnvh8BuP?=
 =?iso-8859-1?Q?KnVo08QlzfPC9h8AsQ50dhc5lJNBSLc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37b7569-a499-408f-b2ad-08de8ec81bab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:04.1711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hot8bFBrHYLTQX+5Daj5sDzeMH1t6YdxyRkV/zYR8Khrsh7T/3usMm2NyRTGtuA0QuZheYbChWQqc9DXrv5UNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-42698a/1774921925-A2837112-49BAD790/0/0
X-purgate-type: clean
X-purgate-size: 6157
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6D3563632C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
enable/disable vIOMMU support for domains.

Also add viommu=3D"N" parameter to xl domain configuration to enable the
vIOMMU for the domains. Currently, only the "smmuv3" type is supported
for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  7 +++++++
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         | 13 +++++++++++++
 tools/libs/light/libxl_types.idl     |  6 ++++++
 tools/xl/xl_parse.c                  |  9 +++++++++
 7 files changed, 55 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3aac0bc4fb..4de8db42ac 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3175,6 +3175,19 @@ option.
=20
 =3Dback
=20
+=3Dover 4
+
+=3Ditem B<viommu=3D"N">
+
+To enable viommu, user must specify the following option in the VM
+config file:
+
+viommu =3D "smmuv3"
+
+Currently, only the "smmuv3" type is supported for ARM.
+
+=3Dback
+
 =3Dhead3 x86
=20
 =3Dover 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index b0c09da910..b24cfd0533 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1273,6 +1273,7 @@ x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
 if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
 return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
 }
+x.ArchArm.ViommuType =3D ViommuType(xc.arch_arm.viommu_type)
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1815,6 +1816,7 @@ xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
 if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
 return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
 }
+xc.arch_arm.viommu_type =3D C.libxl_viommu_type(x.ArchArm.ViommuType)
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index e0fd78ec03..e306f9c1ac 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -530,6 +530,12 @@ type ArmSci struct {
 Type ArmSciType
 }
=20
+type ViommuType int
+const(
+ViommuTypeNone ViommuType =3D 0
+ViommuTypeSmmuv3 ViommuType =3D 1
+)
+
 type RdmReserve struct {
 Strategy RdmReserveStrategy
 Policy RdmReservePolicy
@@ -619,6 +625,7 @@ Vuart VuartType
 SveVl SveType
 NrSpis uint32
 ArmSci ArmSci
+ViommuType ViommuType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 80e3ec8de9..231dbff5d9 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -318,6 +318,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.viommu_type field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARM_VIOMMU 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7e9f8a1bc3..a248793588 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -247,6 +247,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     }
     LOG(DEBUG, " - SCI type=3D%u", config->arch.arm_sci_type);
=20
+    switch (d_config->b_info.arch_arm.viommu_type) {
+    case LIBXL_VIOMMU_TYPE_NONE:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+        break;
+    case LIBXL_VIOMMU_TYPE_SMMUV3:
+        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3;
+        break;
+    default:
+        LOG(ERROR, "Unknown vIOMMU type %d",
+            d_config->b_info.arch_arm.viommu_type);
+        return ERROR_FAIL;
+    }
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index a7893460f0..f0a9a21ba4 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -561,6 +561,11 @@ libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
     ])
=20
+libxl_viommu_type =3D Enumeration("viommu_type", [
+    (0, "none"),
+    (1, "smmuv3")
+    ], init_val =3D "LIBXL_VIOMMU_TYPE_NONE")
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -745,6 +750,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
                                ("arm_sci", libxl_arm_sci),
+                               ("viommu_type", libxl_viommu_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 48c72dce9c..f2a2bf4b23 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3078,6 +3078,15 @@ skip_usbdev:
         }
     }
=20
+    if (!xlu_cfg_get_string (config, "viommu", &buf, 1)) {
+        e =3D libxl_viommu_type_from_string(buf, &b_info->arch_arm.viommu_=
type);
+        if (e) {
+            fprintf(stderr,
+                    "Unknown vIOMMU type \"%s\" specified\n", buf);
+            exit(-ERROR_FAIL);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     d_config->virtios =3D NULL;
--=20
2.43.0

