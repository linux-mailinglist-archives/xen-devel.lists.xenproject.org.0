Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cwO5FBk7FGqKLAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3985CA449
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319205.1586921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3X-0004Wf-Jf; Mon, 25 May 2026 12:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319205.1586921; Mon, 25 May 2026 12:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3X-0004UF-FO; Mon, 25 May 2026 12:05:15 +0000
Received: by outflank-mailman (input) for mailman id 1319205;
 Mon, 25 May 2026 12:05:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wRU3W-0004Tq-Da
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:05:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRU3V-009ZMm-Pi
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 14:05:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143aef-2eae-0a2a0a5409dd-0a2a4508d8a2-16
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:13 +0200
Received: from [52.101.83.125]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143af8-63b5-0a2a45080019-3465537d3e5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:13 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM9PR03MB7026.eurprd03.prod.outlook.com (2603:10a6:20b:280::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 12:05:10 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 12:05:10 +0000
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
 b=XSyYHwcdGkp/piFroI8HCrDIxrRMatBzGMiR1AfMB+pgs1+x8vNVdCLnQG+iW2IGSyhyP62rdMgYbj2zV8SzBH2Xmq6IyOz8h8IvAU7uu8OkoUPPgSzd8SCKWx8UpKwSKae+sc1bmR50BINjoTXCzcI4IkQTZ7YMTQE6MCf4EHhCUuvENt9OuEk4EXghva9Oivxi0/q88wnvDCd0faUZ0JgnAtlAdCAboArfXRuw6HbNQceXfg5oaT+lZnXDgWTZDPHJgUqKmMvFAjbdKRHbNz6bvp5Ekzb0icgwrgdPlQIkIYDRAV+to9TIqJKsnTbI3l3CVzzX2dOSuvJia3k/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBJqopGr6g4Rs9QOkGhc7LSDyZACBgo/wZojZWVMwSw=;
 b=M4XQnBbQwy4RowH7Nl0uu0xwnS8dWtuIBnLgd62TwsJb3L2n+uo/or/v85hxJ7fgKPb9Raq9UmecjRtK4eS0rbs+QyGtxV3iNcQ8aB4yN/yE4kmeclsSeT6fNt3PAtFQgCsFyW+90WDaFjjwrDY59f3g6MA+OGAcA1864eyaJuOtbvYRUvgnA6Cqa3zCYFv/29e1BtVowebhg6hL1YM/WEbRTPehSN2IE/NRAeOU18uFq5XyCPb80mNJHa6g8QT6U6LPx+oeSbsDQXvJd7X0GSazcTrKGge0EQEOFGPVz+0g2oqQFvqbjnDpPBwj4Xqj+yONdIxtUJsOkOE0ia6jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBJqopGr6g4Rs9QOkGhc7LSDyZACBgo/wZojZWVMwSw=;
 b=JkkVwt+PU0L25LKV3qMsP3ESbFYfc+MKimKJAGKC0pcfW9mXvgamVm5+LYKa+4Jzt5DjGZO5sL65dpWCe6HCbWJTqUOwj/nL+Up1XWmnkZbxELW62k3DNALhqOb5va3uaHtVanMTBauIBrjGv/7fyQ49oFXHTk7ZYb/Uv3jxVLrh8fHs2nlyv47y6jdNLjxJBtCqAcaCNOY0p1n9AuKqfqe74e5/o4YbUNBBkS6mphaf3XSYy/loIM1p0+1uycKr3Mbjz/uq+N0bFCZEoJAeoe70mLb7jv644kZfyNXGUktTsTQ14iMj/ya+qTCKjJ8NCVwXk5V0Ak7Yf+M7zP2qKg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH 2/3] misra: deviate MISRA C Rule 5.5 for 'request_irq'
Thread-Topic: [PATCH 2/3] misra: deviate MISRA C Rule 5.5 for 'request_irq'
Thread-Index: AQHc7D68tJeu+7CD8Eibunvyp3IKiQ==
Date: Mon, 25 May 2026 12:05:10 +0000
Message-ID:
 <ea8766aa1d70072815f98b904f317d02e25f3c37.1779709902.git.dmytro_prokopchuk1@epam.com>
References: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AM9PR03MB7026:EE_
x-ms-office365-filtering-correlation-id: 4b2608c0-9a7d-43be-ecbb-08deba55deb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|18002099003|11063799006|56012099003|6133799003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 sOySvuvpO0XjwOSkuXFkCSzRmzY5eE8LlKwqonu/eAUiWzj7jHSiCJsHdhy/0mdGbsqN6w8fF5+vPdRGsUFIbg2uWp/N0YbDIIS1A91WE0o/gqZ6hYKvrAqulUru8iMgNRGHig9K1tDp3aMAufmU8ofWFYEdLrfYrToktKN+Nyo/LRH9bMg7U9NGLNeGqJJm5vvLljhU7LN6gWBqPccyBc1beQH+12lm9aiE1jYKicRe+IIR0DehrsSI8WrST3FzDPqHQtpuzvqgOXRscXr+VmcCcTu8FHPXeHLdMC9WVs0y9smxhv1gPgRFjVsTENiVVrdlk8w9VUzHR23JqKBPhfuQUdmM5UQIMUwDtpZJdtWtc0VewlCjXrFK2KSxI15fYk1o41+Y6xFWzbI3STBp9anrc4Za0p3IcI3FO7nCG0McMBNIGisYL/AtCWUZjo74cacfn17l/19M21FXTsXllzto3fH5L0acfolFdaYunYY6POUtyisn/0cAvDbbwMznimm0FyC/b0osHYnMeM5sjk31eZ3D4CmV+b14CwgUeEYjKsg+lXZN8vT+7QroktvL1ftMRw2zhFh9L7aCDxj5dCSURG3jzVCB/vvrEoLVwQl3Y1BHyDf1+Ix6UiQIWuGl2gudESyaeDWssFEQUgwLERuTZgLMdlz6tq+PVB7goBF2fmk2XzCUwfi7Iz+3jqvkPdOA/UzaGhdQ9dFGagPkIenhJrb/huvFCbgR+PW9IOTrzeVGh+FldRKxbdtS+/qM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(18002099003)(11063799006)(56012099003)(6133799003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/+ptrYb0rjrHiVQINeSgtmGm6R4U9U3hiL0j34j+Y6Yhx/KZ1T3IrN3BIp?=
 =?iso-8859-1?Q?ton/0GDncG9bACurzqKUo81LHimWAyxkgVVq5zTUKxqNEB/An0zJzDUmGz?=
 =?iso-8859-1?Q?YYqouCvWNL4HxoiEGXhTuFVDA+d3n4hu12DkmKlFcLz+GV6NXSRQYmyU7n?=
 =?iso-8859-1?Q?cPm/9KGzwqykinVZ0h5pcJoNiz2s7Q/fD7Z65lwTQWDu6IR+UJYrW+Ayn2?=
 =?iso-8859-1?Q?BKwLiJwUWK7wz53v2ocXrR1/kob3/TrRAoz7FXwnW9tm657RPr0PZNwHsa?=
 =?iso-8859-1?Q?HEi5n/ptEpfXtLxXw+sFJ4QhAd4V48XyelYv0Ihgu8XozdnFHmtF5Iy2ev?=
 =?iso-8859-1?Q?NWH7/ToNCSc0/uLXW05oZhYe9gIETVl3PgTojRLzzzNWVEqBZo2t0yx+Nc?=
 =?iso-8859-1?Q?ksSgEhCJLh413VKcDYu02fRwrZaFAdLIDC4fMoCqeWWQYVlwCcKRy878qH?=
 =?iso-8859-1?Q?xGf7K1m/yH83jtLO9wddAgWPBV3rzhggZWQPlrh8fCWZ+iGxHcI9iDsoIq?=
 =?iso-8859-1?Q?gAghLBZj4c6//4AdGhLJWOX4+24glNsdsKjDrYDYVKZwmN6WLtWB6J4Bn3?=
 =?iso-8859-1?Q?JECYKg2TkldC+hgE26I+KdI1saBxuYDFtYqCxXylTZn7vi/58l0Vuk1KC6?=
 =?iso-8859-1?Q?G4V6Zx5JMcwwgw/qAh7qNEvu0I4A2qjVVlPf1w+im2vfmHjCbfsPcInkJ2?=
 =?iso-8859-1?Q?lglPHZ0U8ODsphubgpqVmT86EjJCTxsdOF+bZjoHKdKT3vJURyPyH9/sry?=
 =?iso-8859-1?Q?bgOYfeX6gsl+lYkV9jkUnZwVen5AfF7G++dBkSulh9cUlo+Q1hixNjx/vw?=
 =?iso-8859-1?Q?jfpMjUoBml+LgMA+q38J6+OEECXpuqdWWvsMoNX2ZYq3QqsKW1IiFdH3LV?=
 =?iso-8859-1?Q?ZKrjYqlN4OD3LkB1+SAdn0E5hyI1T/zlQNaTriOtDcRgfP0U3c9Oo15pfR?=
 =?iso-8859-1?Q?whysmNVQ8oUpynMwJOLVv1rUBtJp4OE98H6vggWfp5mSmQ+gXEpqiFkmfn?=
 =?iso-8859-1?Q?EGpf16zmWPWWYzaUX17P87X0oJR5bNSeET8ohMpbF6AdZNs8cf0yFOHlDY?=
 =?iso-8859-1?Q?dvfb3tM3//j+VhXUJ7ReVbjMDnFkvAa3bgjG1H6mAdosKQVP1H39M95sqY?=
 =?iso-8859-1?Q?36PhyP7/C/4qvsYy3A3GkT+BoTFI7qXL4wDMdJV7M3tgIhiVN/pAw8mQVx?=
 =?iso-8859-1?Q?S9R05iaUeGVp3DIzOcFWAR8PD2hn1FX4VSWviVcEFrurYGxbDUvH67fg3r?=
 =?iso-8859-1?Q?7hWJgVHBydaprOBw1H1p3pa/BY0nKEVynuFKK/CS8z4oK+ofqlUFDO79Nn?=
 =?iso-8859-1?Q?EQ8HRoS6nYNqq00gw8fYu6OiCgB4HgWWd1vdFRICvpr4e/VKy89RglHCxj?=
 =?iso-8859-1?Q?WCgbPrL+5a0q/9BxLy0gh32pChNKl5WnhBARJFDOzwzsGH0sS9b/1mJclH?=
 =?iso-8859-1?Q?Jd9hu+W2zu6rvmNQ5ELQ1ngNxzgZ7ICD8Y10R/iwi4pb7a5ZeeVUry519q?=
 =?iso-8859-1?Q?jrfkX3WWkbYXAa+4+vRIUkdjGfuNF9YF/5NeYXUs8hbAxxBEYFrIerIVq5?=
 =?iso-8859-1?Q?NstfFCfVRGZgOhrdLtYJrrZV1dPof1mfstrZiN2wW9wuuvhmvs4NpqsGnd?=
 =?iso-8859-1?Q?D8plyHdvYrumovZl8iOzWitOWbnOpojjPODG5PvA8ssJ1z7vqXIrzr6phM?=
 =?iso-8859-1?Q?1lwlkYXjGjmCGGnDG2ZJrOXd9OIrlyoiqons0GsErkPavpvZnOLbZf0RSj?=
 =?iso-8859-1?Q?pon+FPY1p/ne2EdXYClctptJhZW0JD1Rrj8nyudGQkLuSKxvALgvspGdSF?=
 =?iso-8859-1?Q?bN1c7kXsznZgiH9+DXtj/ttg15fM6ak=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2608c0-9a7d-43be-ecbb-08deba55deb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 12:05:10.4094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KDik52oSrEsEyHt6g7E6PVQQsKHQgIHCPSiMDhIMMzvJOYpU3VTs+cXWw29o7DymZHUrXHRDX2OHu7GNT3Ls6Jney7IvnaDZVrSXojLDxJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7026
X-purgate-ID: tlsNG-c1860d/1779710713-B6B74DB1-D5857156/0/0
X-purgate-type: clean
X-purgate-size: 3492
X-Spamd-Result: default: False [0.81 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,epam.com:dkim,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ED3985CA449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate intentional identifier and
macro name clashes by specifying the macros that should be ignored.
This includes 'request_irq', where the Xen function takes the IRQ
flags before the handler argument, while the macro adapts ARM SMMU
driver calls by reordering the arguments.

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 7 +++++++
 docs/misra/rules.rst                             | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 13a34b7703..7aa64796ba 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -138,6 +138,12 @@ hypfs nodes to allocate per-request traversal data wit=
h the correct size and ret
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(hypfs_alloc_dyndata)&&loc(fil=
e(^xen/include/xen/hypfs\\.h$))"
 -doc_end
=20
+-doc_begin=3D"Clash between 'request_irq' function and macro name in 'xen/=
drivers/passthrough/arm/smmu.c' is deliberate.
+The function uses the Xen 'request_irq()' argument order, while the macro =
is a compatibility wrapper that adapts
+ARM SMMU driver calls by reordering the handler and flags arguments."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(request_irq)&&loc(file(^xen/d=
rivers/passthrough/arm/smmu\\.c$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index f5b4ce9315..01f141b73f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -185,6 +185,13 @@ Deviations related to MISRA C:2012 Rules:
        function, so the name clash is controlled.
      - ECLAIR has been configured to ignore this macro.
=20
+   * - R5.5
+     - Clash between the 'request_irq' function and macro name is intentio=
nal.
+       The function uses the Xen 'request_irq()' argument order, while the=
 macro
+       is a compatibility wrapper for the ARM SMMU driver that adapts call=
s by
+       reordering the handler and flags arguments.
+     - ECLAIR has been configured to ignore this macro.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index c0237725a9..097c20432e 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -226,6 +226,10 @@ maintainers if you want to suggest a change.
        because the macro is a typed convenience wrapper around the size-ba=
sed
        allocation function.
=20
+       Clash between request_irq function and macro names is allowed becau=
se
+       the macro is a local compatibility wrapper that adapts ARM SMMU dri=
ver
+       call to Xen's request_irq() argument order.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

