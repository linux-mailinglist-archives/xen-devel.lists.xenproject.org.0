Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BgEHvRre2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3887B0D34
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216559.1526484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpY-0000iA-A2; Thu, 29 Jan 2026 14:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216559.1526484; Thu, 29 Jan 2026 14:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpY-0000fD-7L; Thu, 29 Jan 2026 14:17:08 +0000
Received: by outflank-mailman (input) for mailman id 1216559;
 Thu, 29 Jan 2026 14:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLTt=AC=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vlSpV-0000f7-SD
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:17:06 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f16c8c6-fd1d-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:17:03 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI1PR03MB10078.eurprd03.prod.outlook.com (2603:10a6:800:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 14:16:55 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:16:55 +0000
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
X-Inumbo-ID: 2f16c8c6-fd1d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQeIYo0HpcmXtgYzVD0dXlLQRYA5imUdsEfAGQCiquiKoYVssJ1EJx+fiZObzmd9vSEJy6Q++ZO+Pg/1ZBSKl+tsukH6bBqF+EMnFMmTw1yb0ogzeTPX1iWilDSA27NKmT0g+EP3Ql92M3j1qRHg0p9nP57GfaFJ7ee6He2mg3kxaxFFdVOk4FoUL808cQRokjwoHdEK9Pxom83nbRJcQKmCgVDSL+dQysxIh+cQPKRcyqDH6+UAxvFwOF46vBhi+pMIktKP0pkgUOz3mfHqLh2K60fGbyKAR5jtVHT7rCsqTw/ErPAko4nX0r5iP6YNIDxAPxmMlPRYdgtWh+288g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibKaJmnmVsKkCLLiwRUvv6w33HYLnTMURDRsiOZQ5ic=;
 b=ZyU9AthvX59qCeDD8OUrSCFk9+P4v/ZqrLOm5TPGtJfTXM13NxjPXjXq4PXeYrlNsHWZiD4Zi2+cZro4pA9VUS71CXMuut/p2XVMKmib9/xVnwLYt4TvSOwr+1wQ9UftosLovyYK1tTroLd4noXrn4N/mr43YYl1W/+STUn4dHR5zl/2gsEwUV5iLmIlJ/OFE78d83jIczY9Lls8E9FQwVKlg4w7b2t+XSqazLee+VttjLNk2JOp4RrV3YrEKqlp63XjXs1/EUA1RHaOAejYkufkKmnH4Ez4RHerkO8ySlDG48CQjt1OPdm5+5izNfrSDS/IouPOKlx3C92y28gqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibKaJmnmVsKkCLLiwRUvv6w33HYLnTMURDRsiOZQ5ic=;
 b=Qa3SWFKfKoWKS2PzD9HUwkHqFtiIuQ8Y3nDYcrZGRh5HfmrRf/+GA7nAuTxdQafPi4LajVD+7RlIwNky1d+yUq8ThkrIvh1VSMMEENLflO1MMGmPSViQGNSI6Z0Wqv6AWi5gilGdhbfNNDxZncjfWHqM5Ij4Vv70ZquEy0gOf7RRuf13nbSO5jQYr39CGGvS3rzrR6CE0/o3hpHZSbN+ZJvuvEUEpjW/JBc1LNo+OgKE/UO4Oijk4OEHHh++7dWa4JERqcnW4iboaAwPbYJipN6tXoTd4n8kgZeWh5a/po5EcgAhv2/jfJHUxkd8QTJNJSP+57Yt/6WMiFzxJWFZhA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v9 3/5] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v9 3/5] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHckSnrjR8vkz+RAkaYhf4MP0G0mA==
Date: Thu, 29 Jan 2026 14:16:55 +0000
Message-ID:
 <c1d8b28fffd3380bdf914526f6934a444be5e75c.1769696107.git.oleksii_moisieiev@epam.com>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769696107.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI1PR03MB10078:EE_
x-ms-office365-filtering-correlation-id: 9886b90f-f9a8-423b-a641-08de5f410e68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bZsip0kioMtZoAqzNqHfKxUTF8VIv042ENscfHpfi1U7jSFomrS1ISwLd3?=
 =?iso-8859-1?Q?MXML5AbHhYaxSu9jt7XKxxwpdcsiEeQSmCqj8NRxZQ4BWz/i95VRGZY712?=
 =?iso-8859-1?Q?4ZBO6k1Xb2vYD/dnOViQSo1pDX2vTCHDaJ7+KoeWmxHCW+AMLbc5zeKNBM?=
 =?iso-8859-1?Q?vPPqaZ6nY+vwlYUU4IOklqrZMdFf/jfveDTbbcjsJl6X++j/buuwdWvfQI?=
 =?iso-8859-1?Q?UxSpOpHrOF9Y6/HB7q5Z6sJykG2Fs++u8aiG6PjWC+lXkXt9zTCbGlt8fX?=
 =?iso-8859-1?Q?AqBhXDBLdPP3+JwzGZFrPn6EX4slkEfCY7ctirm6V9O+OlcA5SDVCZW45n?=
 =?iso-8859-1?Q?bqNlguO46HeEoITRpi1KikN7PCItwRSk4dbmUcSwJZr5OQ+9AX4jLPeIhE?=
 =?iso-8859-1?Q?rHyaaRCHg/en6aByRwzEJd3Q7Ujs3zbReO+NtKnlH9cNkOOXTgjS5wNWij?=
 =?iso-8859-1?Q?YEaOU/Slh6kZDWNDrNZ7lhC58ULt5L1exwEiA9fnagLLuhKaqb7ddRwtmx?=
 =?iso-8859-1?Q?rex92hl01MQmFPZHVYpTCUVQarAicr43Ysfxrf1p05SjBPEiLduS7y32ig?=
 =?iso-8859-1?Q?ji1rFO6CdtIuicumqXi7FXPxFeIpx6POR6Y1cjtQk34l2sQItBClZgmDO9?=
 =?iso-8859-1?Q?oCklKwKNONCR5MwQxFv64spz3VJEpXBA3DQXJw/tNPIfHW6al2uNmIUDP+?=
 =?iso-8859-1?Q?OVUTLafZWZZ7SgoS1XseswHdav1ZLxXL+cMDSSoe1tBYu7oaYwVu6kz/re?=
 =?iso-8859-1?Q?nMukYQEy1IItp8DoLmoMLZ+mpImVzohn27oBw20/WklOk2WhYKD85anP7f?=
 =?iso-8859-1?Q?p4ij0Byrw9L1eHk2Va/HX+4QahPxN3CHT38qEKCYovcyDGA/rH+d/q7t+M?=
 =?iso-8859-1?Q?aJG5DrRucIcQiJtbQrZf3braRuSIEouS2oG3dp9Nx9nb34LbxrPAT4xwS9?=
 =?iso-8859-1?Q?o0TGwn33oNUENtuXGxWHCFsWnHSNmmYFVegZObTty4r/OeuLThMrsFT2Wg?=
 =?iso-8859-1?Q?vTOfsA+1onu7WImHkPsnsXmYQsGL2AWokq75X6U6MQxfhojkN+URZ6GpEm?=
 =?iso-8859-1?Q?KAEfOHWOpusfTqalp4f8JTVOE/5qxr0MdUhm3g5AqOTyBep61RqE7KIBBI?=
 =?iso-8859-1?Q?w6jn1TmzOHTvqDUNV5xwrTgS1bGGL92IPi+79JFsAfncqyrXLpB8pEExvl?=
 =?iso-8859-1?Q?Xl9AtZfNwAwRQskL6DUDY3IClsjbpLa/1iEr4pVZSThpaT+Tpk6J4UuJvV?=
 =?iso-8859-1?Q?mhzWkuVSkN7hezb6p92TQBPXLoHDPxAzvfijWUhl5a9NI7rLOpCpBsF4hG?=
 =?iso-8859-1?Q?vQhyOpSFNDSQ/pLnB7v7W6u8l0oJix9X0xvuUYM9WTTz7tbYbB9xu2RVp0?=
 =?iso-8859-1?Q?dtVpGL5gvKmXSHen5Sol7kXPa4WUWgbY1eyStc6o8/kKYmlrdinOeHS+69?=
 =?iso-8859-1?Q?riqC9Kexs68YqXneUJIjh0V0hjioRurI+YbTwI+UP2tkZRLlwb4ljEFWd/?=
 =?iso-8859-1?Q?pbJ4HsINzrUYOBwscRXxQHL9kZrUCYxcFgf50KyyjR6cYetojL+wDov96Y?=
 =?iso-8859-1?Q?giPNkrXrd1UCCP85a2fI0k2GjdHQwE2SDhp9b76cjE4JLawrGDMF2HhsSc?=
 =?iso-8859-1?Q?1irm/M7hAv/Dt538Sj7R73HijOc7mbKu2FZcAxVM6t9qJ5O7U5irDZo2cw?=
 =?iso-8859-1?Q?rKpc4giIzooWBlVOTgY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zxb6TRv95WUUJCJquFhSJHEzn4MRvnndBWcGPn2SU3TqDp3yxc1pt1hpKB?=
 =?iso-8859-1?Q?BahcX07j5x18NUdEH5e/koR3Na60VuN4eIEUXJ55QK2yuaphBuHfjS3shz?=
 =?iso-8859-1?Q?xR2a4gXOMI4E6LynFGDXvGJJY+0XLdhHMz9YUlX/Iis8tXKBdGcksCHKbU?=
 =?iso-8859-1?Q?H9M5sjZYU5phQwqfzouv5ItxUIVZq4zD6VBGfdfSbBsMxvTtxk/4ubjXRB?=
 =?iso-8859-1?Q?6eTqe84cJGw0EXvYYWeOqU/KtnfYye8H7d2FDG4z5G3w8RnqaZ5LqlLo4t?=
 =?iso-8859-1?Q?fT/J6XJBjrMAfLtHoMkNcNxWf7s6EiH2IyDbd+9sqT1SHI6W1bjmVdhycd?=
 =?iso-8859-1?Q?KbblFHUenkRnWMdLoW+1IrMSER8QjOQE6k1Ppa7IXv+tn6isxNkSJGeZtB?=
 =?iso-8859-1?Q?TMExO0kVAsaHzHxtU6D8bfreW3XyBDs6pqa7OiKZ9PYh4hoa+IsLsaEenf?=
 =?iso-8859-1?Q?Cvpo1Xe7kugoy7US9p8iK6TfUn1m27nvXn/9k/12J35m7kADEx5W06pfUi?=
 =?iso-8859-1?Q?WQ4JI4ALbMxEOKJoqRGYiXJMoeX06RPzx3GS3jB0lJEo9rYHpgwLxk9huS?=
 =?iso-8859-1?Q?KIkP+8p21PYNMmOUb16b7Gu0mIF1tf90Z43jPQsYPOf5N+KHw67MPvtT8i?=
 =?iso-8859-1?Q?KE2Q9uqThHFO/7Aw3jq9cii52Q8Qt1yZV9uQOXPpPE8eLPosnP4rMrBvL9?=
 =?iso-8859-1?Q?P860HyXVsg/4t1o+d1rK3TFUoFjS6v2X3vslAmc9y6sYr1bg/KFY8D2oYd?=
 =?iso-8859-1?Q?fxqYA/z3FsyWHRVNhHjT11FoPFqDlX5mofyYElc1j5j4LQhdEMA+GxsYma?=
 =?iso-8859-1?Q?gZznuXjH/bzseK+GcUD+iOpmc0TiBopnV5aMb/myruvL+N099GWzxddsUy?=
 =?iso-8859-1?Q?58tDeoHjk3AZl/87ke6flyui+PQaGTxDvTYUFq3bi7dMRb5wKOLqJWzA3/?=
 =?iso-8859-1?Q?4Qp4I1J20ftXP+78wIxwqE9KqmpSe0iTfR6H2L0+1sDe/aVkm9pJqLarUN?=
 =?iso-8859-1?Q?p7owHPsb+SOMw479B/drlT0F4DMOlhsKy/TB+/PoqJdUPecYYtmkln83jN?=
 =?iso-8859-1?Q?t93fBJI2x1QOHao7eypmFHQk9czhKcfCxpr14wvjyTmrI276jwZhU/qTm+?=
 =?iso-8859-1?Q?AqEJ5n8Tf5TJHgAm5BOuyP2RTOxQfCf4QDHTMGbXEZQaqWiRljmsAPqCXX?=
 =?iso-8859-1?Q?Ezoc1d2Cf4cTs6m/5sGOM3n/txVMqMeQWLEgt2oO4LSrx5M55aJ72g26OV?=
 =?iso-8859-1?Q?EaXsB7obS1+DkcznlDv8UfNVg351rOHlGWPvdJhLDQaesfRBaki5Ue+Xiq?=
 =?iso-8859-1?Q?iwE800CIYjVaG+UYEHpeN8gG6NGVn5vxGoo5zjN9nugal/nQaz4OyoTatA?=
 =?iso-8859-1?Q?EGciozw0+PLYufX/qceACLR4XuLZa+kglV8dH/4WlBq2NL+Z8pXaCSyviY?=
 =?iso-8859-1?Q?VYZk4u+Ps6bhQ1+BNbPnTGtzreQsEiQB+GhYFBn8x8OqmALtx6RGsSO9uw?=
 =?iso-8859-1?Q?uBcPVNuqFJuQwjQ+sppR1i56Y32A5eI/C+GfMYjSj3zPHEaaZqd1NLHIXd?=
 =?iso-8859-1?Q?zTpVV9pK6bS9EgWuoqf3uWXdSsS6ym0qP8A+ab2xAXTJKSbks41Xup7S4y?=
 =?iso-8859-1?Q?inET58jWEBUvbHD1mPFM9pgbPxbD1IlX9qBzpgGPKUMf/2nk+0RkNRPUhG?=
 =?iso-8859-1?Q?RTXNzeG7vzayvb6P4x8IhWBV0zBbyEhxo7oHzvj9IwZW4g7El8ZAacX9FI?=
 =?iso-8859-1?Q?/ZRHgc+XKwSpNNQ9LfQHSdETj4M7oXZ0csblPeKCSvGRXzPRQzxqiZZH4+?=
 =?iso-8859-1?Q?W5cUWcblxbU50OADGiuqEUghWm+/Kgw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9886b90f-f9a8-423b-a641-08de5f410e68
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 14:16:55.1260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaEC6+0FsO3E7IJYQrYriTeAVJSeXBAYGDYZrQA2X2dWBa21cR6ulLdyrDSGNA7jzz35keNCrGOeqeEH+MP+6carC/MRlrCrx+PLor/28EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C3887B0D34
X-Rspamd-Action: no action

Introduce memcpy_fromio() and memcpy_toio() helpers to copy between
regular memory and MMIO space on Arm. The generic prototypes live in
io.h so other architectures can provide their own implementations.

These helpers handle alignment safely by using ordered byte accesses for
any leading/trailing unaligned bytes and ordered 32-bit accesses for the
aligned bulk transfer. Using the ordered `readb/readl` and
`writeb/writel` accessors avoids unintended endianness conversion while
respecting device ordering requirements on ARM32/ARM64 hardware that may
not support 64-bit MMIO atomically.

The interface lives in the generic header so other architectures can
provide their own implementations (as macros or functions). The ARM
implementation is placed under `arch/arm/lib/` (mirroring the x86
reference layout) and is split into separate compilation units added via
the architecture-specific lib Makefile.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v9:
- reword commit description to refer to memcpy_fromio and memcpy_toio
- ordering obj-y in Makefile
- rename ALL_LIBS to ARCH_LIBS
- drop io.h and move definitions to the common header, fix comments to
be arch neutral
- update comments for memcpy_{from/to}io implementation

Changes in v8:
- switched to ordered accessors to address the ordering and barrier
concerns.
- updated the documentation to match the implementation and explicitly
state the supported access sizes and granularity.
- rename memcpy_* implementation files to memcpu-* to follow naming
convension
- fix indentation to match Xen style
- fix intendation to match Xen style
- move memcpy-{from/to}io to more convenient library place

Changes in v7:
- x86 guidance: removed the speculative note; header now just says
  each arch supplies its own implementation or macro.
- name spacing: dropped the double-underscore; the helpers are now
  memcpy_fromio / memcpy_toio. The header also explicitly allows an
  arch to define these as macros before including it.
- updated io.c to keep 32-bit transfers safe on arm32
- moved to __raw_read*/__raw_write* accessors to avoid endianness conversio=
n.
- split the helpers into separate compilation units

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/arch/arm/Makefile            |  1 +
 xen/arch/arm/arch.mk             |  1 +
 xen/arch/arm/lib/Makefile        |  2 ++
 xen/arch/arm/lib/memcpy-fromio.c | 56 ++++++++++++++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 56 ++++++++++++++++++++++++++++++++
 xen/include/xen/io.h             | 10 ++++++
 6 files changed, 126 insertions(+)
 create mode 100644 xen/arch/arm/lib/Makefile
 create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
 create mode 100644 xen/arch/arm/lib/memcpy-toio.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7494a0f926..5b8e170e01 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y +=3D platforms/
 endif
 obj-y +=3D firmware/
+obj-y +=3D lib/
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..009bb22c45 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
=20
 ARCH_LIBS-y +=3D arch/arm/$(ARCH)/lib/lib.a
+ARCH_LIBS-y +=3D arch/arm/lib/lib.a
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/lib/Makefile b/xen/arch/arm/lib/Makefile
new file mode 100644
index 0000000000..07a0d9186c
--- /dev/null
+++ b/xen/arch/arm/lib/Makefile
@@ -0,0 +1,2 @@
+lib-y +=3D memcpy-fromio.o
+lib-y +=3D memcpy-toio.o
diff --git a/xen/arch/arm/lib/memcpy-fromio.c b/xen/arch/arm/lib/memcpy-fro=
mio.c
new file mode 100644
index 0000000000..1b13cf5ff8
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/io.h>
+
+#include <asm/io.h>
+
+/*
+ * Arm implementation notes / limitations:
+ * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
+ *   32-bit accesses for the aligned bulk; no wider accesses are issued.
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
+ *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
+ * - MMIO must be mapped with appropriate device attributes to preserve
+ *   ordering; no extra barriers beyond the ordered accessors are added.
+ * - If source or destination is misaligned, leading bytes are copied
+ *   byte-by-byte until both sides are 32-bit aligned, then bulk copy uses
+ *   32-bit accesses.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
+                      !IS_ALIGNED((unsigned long)to, 4)) )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        *(uint32_t *)to =3D readl(from);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
diff --git a/xen/arch/arm/lib/memcpy-toio.c b/xen/arch/arm/lib/memcpy-toio.=
c
new file mode 100644
index 0000000000..2554ac3efc
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/io.h>
+
+#include <asm/io.h>
+
+/*
+ * Arm implementation notes / limitations:
+ * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
+ *   32-bit accesses for the aligned bulk; no wider accesses are issued.
+ * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
+ *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
+ * - MMIO must be mapped with appropriate device attributes to preserve
+ *   ordering; no extra barriers beyond the ordered accessors are added.
+ * - If source or destination is misaligned, leading bytes are copied
+ *   byte-by-byte until both sides are 32-bit aligned, then bulk copy uses
+ *   32-bit accesses.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count)
+{
+    while ( count && (!IS_ALIGNED((unsigned long)to, 4) ||
+                      !IS_ALIGNED((unsigned long)from, 4)) )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel(*(const uint32_t *)from, to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */
diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
index 164a20c5d7..1bb164b6ef 100644
--- a/xen/include/xen/io.h
+++ b/xen/include/xen/io.h
@@ -67,4 +67,14 @@ static inline bool write_mmio(volatile void __iomem *mem=
, unsigned long data,
     return true;
 }
=20
+/*
+ * Copy between regular memory and MMIO space.  Implementations are
+ * architecture-specific and must use appropriate MMIO accessors for
+ * their memory and I/O models.
+ */
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count);
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count);
+
 #endif /* XEN_IO_H */
--=20
2.34.1

