Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLgcN/QMj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74202135C43
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230655.1536098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU1-0001zw-Ty; Fri, 13 Feb 2026 11:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230655.1536098; Fri, 13 Feb 2026 11:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrU1-0001qr-MP; Fri, 13 Feb 2026 11:37:13 +0000
Received: by outflank-mailman (input) for mailman id 1230655;
 Fri, 13 Feb 2026 11:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfN9=AR=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vqrU0-0001fQ-Aw
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:37:12 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55a1b2fd-08d0-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:37:10 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB7615.eurprd03.prod.outlook.com (2603:10a6:10:2ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 11:37:05 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::98:900e:f8e2:716f%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 11:37:05 +0000
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
X-Inumbo-ID: 55a1b2fd-08d0-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGT4b/YxtDRqJIz9DUAkarqtLFmcLbigEYQ894C91LzBZhO+ujFUZRvMA21c/zfmQSs/cTzVLDixhrHUEMHV0n8DIgXel2ZWIsUDLI2XztAgkWDAv0Syk9XTYqaQAQguIxil7T22CR0vv3v5SBb8OrigNF3XD4XvuzNOt/UITCv7gOykDvytvjogGe62w1RcnEbMrat16KHkn5lJQBFpWV2Zq6XsYMOUPwp+tgvlgL2T6nenrull9x+kxVe/rs2557z1YnxxQb7EsWBPCDmrdpqk0Tb6H4MVtfc23f6QKPJzdEaF4fFnhnDGtpDRij2vzLNt+C6Yx3gKvNqwv9MNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjc4X3KEejC1HqIafJYoS7hCVKxcyTdjp5cOgfetpxw=;
 b=Fcc0lwXNIa+HnygHaSYtoZggHAMq6868yZ/P5yKHiWyND3pVfwqdm2q3FZJVZj+VYf9L3zOBqhiwCouaS8E0gt1EHD7q5rmG7qxrPbuBPCK7Xh2UCioI77YIE91nLAaJ97Xyu2CuBfLi8UXjnGKRZoPnKX3Gn0UXJcSQWpFBeSpnCjL2FvWX4n9nFgFeK2Qch0eP7UxKNWhC+6plg6a5M0Qqrcq5MA+tVYFv64h4J0dRxfjkDgXg1Apo0hyW4eZGbHIAhPdRdaPyYkSoYujIduYIUMyqmy7UiDsJeWXsZIK7J3juujOZvcOg1/to7C7N+f9zc11XXSrqMzRYWjVQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjc4X3KEejC1HqIafJYoS7hCVKxcyTdjp5cOgfetpxw=;
 b=lETrlcnyzdqbZgyFpz3mjJZNG3xdG5qgZJI3h+mNnxMVt8KTCrnnTAoepScd6WcYkq27HGv7G487S0nQAICdq2J7EmXmTmCv4mzKoRAUZU/GP/qU3Wy+IdBWCev8PmQbVk6LNiBiDxAJMeH9KlRfpBlxDmsXnmk9M6zsXJplTeXPv/AzNXr6VB/flG9WCb795SJZQyZRojTx1NilYY09IzRS70MzVZVZ7U1YlMWN7Kyh/IH3ZfFqYucH3+W9OYUibbcAvUnTSBd2fu3AIraYxwubzc8LMmit5DvNt/Ji+B0AL73JUcgi0l6B2XxGy41iHkJBMFW0W/3VsoVsdJjKZw==
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
Subject: [PATCH v10 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v10 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHcnN0TXj42eOktbkyLKMHKjBAoWQ==
Date: Fri, 13 Feb 2026 11:37:05 +0000
Message-ID:
 <75784317d22d50a1c41ff256e1257579a2865430.1770982468.git.oleksii_moisieiev@epam.com>
References: <cover.1770982468.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1770982468.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB9PR03MB7615:EE_
x-ms-office365-filtering-correlation-id: 912e497c-f35b-4b48-98fd-08de6af4366e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vCPeqlPmH7lABHBVBiv2fEIFV9szH61RaskRzJJf3nbrCypoZIb3eRpp7U?=
 =?iso-8859-1?Q?t5aDt0fg06HN6WMTVYCe/Gw9rKCJl+KDHZEhj3ouGWD7BeDkwvXGKE+/+k?=
 =?iso-8859-1?Q?tTTKI1UUbvof2t1LFBszjouY+IZiNaPiq0xA0EM97sy2WDcDzLQwJ2SQ3i?=
 =?iso-8859-1?Q?9S+IsIPeZIU4SEDegqfGj+0lRZC43NgA7BfUV3K/xCuv31+8K4Wg1ROimS?=
 =?iso-8859-1?Q?NI8OI5hNng57ybAuaIYuNjvXXC+uHQdIk4ndFLi7FU94JE/Aiw6vilCIyI?=
 =?iso-8859-1?Q?cxRN174b+P3g8oxZ17X/tdwWbOGck7C9xIo34ZBqdD2ryKdykL0yh6KIWC?=
 =?iso-8859-1?Q?RSGFwUuH95UNwbp50vJQ8Wu5SGNKC9xwZdXTicyucFu91lbGXI2Rvrs36W?=
 =?iso-8859-1?Q?rN+RGdjmmyQICP7tU0GlcusD6zhulsXznEcTpF6VS8FSTCz+76z3LEZj2/?=
 =?iso-8859-1?Q?nqNlPYe8qinzudeZeYn8bCO7CdDwn6j0exPenkMDLhCvoNzCjrY2KOKCwH?=
 =?iso-8859-1?Q?+mtfbRMlHm44CYWE4/0dGn3bywaYQQy6Bv1kSxq7m+AQnH90U5dVzKByRZ?=
 =?iso-8859-1?Q?ZlnIwrset72y4xogBopGUMbMqkQBL/H+SulTHAwTURm+ByQZk3JPzw9YZF?=
 =?iso-8859-1?Q?TBSoIGuqLqjObx5x3Q2Fc8CrnalkSuFdvxe0EG+D1NGCf6EYPnvLfEIU5b?=
 =?iso-8859-1?Q?ptASbBkEj7kCHhe06u6pBA1uUINVA83SqfZIC8xmb0aCB1r2BhXL/ZKqbF?=
 =?iso-8859-1?Q?hjCXvosBUcCn9pRe/qc34jp5S4Ug+4JNUAKIj+RCkjV9XU2ja/QoR3ewD8?=
 =?iso-8859-1?Q?F4ZAgmILu+i8BatMq0DrPSbeZY6xr5fkgqanzAGRFwWoVN/u6IibehQlEx?=
 =?iso-8859-1?Q?Cc4tbkkWWRDT1MyEvxWJPmbeObwmcjkRty7ONGW9wPzXKLQq+UB379zsiv?=
 =?iso-8859-1?Q?wjAGV9ywpomcJmKUbRT7hyrA8WDYCeF7vUS9/+v3grY7DpiN++TJZX+3Ax?=
 =?iso-8859-1?Q?QjebCxgTIJhuv38xlz9L25zQdKuRNbYrII2vpK6p9sfSUhTvihjdC/oRo4?=
 =?iso-8859-1?Q?T3QqdrQTM8pIkBHEeB3M/KVFFCzHZbIGtZdk/pVUMJRZhUhLPuZ7xWavLx?=
 =?iso-8859-1?Q?W0XgtjzOTrRdYNpofqFodM8ZfIx/4DF9VByLiaYETGaajS+LoFlQ2Rwu1J?=
 =?iso-8859-1?Q?NkPa7Pl+cF8v6IuDNG+aO3ZLk5x0//xke4Ic8p69tvT6aiC4wC81OpgeEO?=
 =?iso-8859-1?Q?iWGbZGQgcNe7JJY6WLOyAkIe7y0oUICPm3mmvNQvwJmui7Ooa8SigRnrkq?=
 =?iso-8859-1?Q?0f0MdhqvdyKRTn+CnAmxqm/g6t3r7ohJhYuF90uIU+UbumvBJ6G+WRD1wv?=
 =?iso-8859-1?Q?9IMM28Zk9/hgQAOV0NkiY5OfLDZRzDbdcQvQQF2ZwZyB7o9v3Ou/mx2UdF?=
 =?iso-8859-1?Q?X6LvanoUfY/0zP9brpZRAn1R2zz1E1mq9ePHd1Yc9FMxFKdlkrVwHsrUvE?=
 =?iso-8859-1?Q?/BBaI3aPrZa9tk8mxe7XUMjgeZdlYt0Mr+v4wPtMeNVSxGDgqGc4Axk7qE?=
 =?iso-8859-1?Q?+MsKA3zD+dk9B8yTqVvfgWc+Wvu+U32AXgZ1bxKKaTBsvmW+7KN86Gq5GV?=
 =?iso-8859-1?Q?ZijZHC+xqJQuRgLkwngMiP9pXAR74amHSecEjpV90WQ3/Y/e0b9XGIZCQx?=
 =?iso-8859-1?Q?wR59I7Gya/kkvDkqBOs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4pMh2BR7VuNRzBSP2d3r6DTuSAsVYNxTyDmLeI/fxepljji90+3R0cxZTN?=
 =?iso-8859-1?Q?fMxpf/3D5KHRiVD/TqL8W7LQlqbkpe5pJZTbBMTRIdNY3WX0//yM6yYOLz?=
 =?iso-8859-1?Q?zM2BH9BqUab+ixXqpGRLumD3d7DfS+MZYu6ar3Wj5qGvUJPg+z462X+rAu?=
 =?iso-8859-1?Q?xb51txKQyp0Jx/NDJGQ/ai0GF11kZiz3WwoBU8gMytlu9V/tKYSdCGbOGQ?=
 =?iso-8859-1?Q?0vFoquXhdCucmC9K2twd1fpg85WT0ZnwGA7MVsrMiAaaPfQkLorQW2RuqX?=
 =?iso-8859-1?Q?fVp9jsbyi+OWn6haClto3UYL6o62UkwIEBdfIoVuFtAr/eHca4aHqY1l9h?=
 =?iso-8859-1?Q?zVA73QTqP3afgZn6phSmAndk7eZ1x5TdXzzWBEW3Xh0hCo8ekozL3wISl3?=
 =?iso-8859-1?Q?FfDO1oAgde9TyJaNyhSKWz9vCV+Lv01UbadYJ79o8lJtL9RAt52q1fF848?=
 =?iso-8859-1?Q?XGDLpJVXwAOuPmsD4K6j12e80c4/QJYpSdkfg55JXM5pINmz4uR+3ngG1k?=
 =?iso-8859-1?Q?o59119XajL9jwjmTRa2BJLPmnCK/5axmzBJN8dO6jgbbiADNLJHK40N5ZE?=
 =?iso-8859-1?Q?RyTUp4G7t62Me/McWzUsXRhPFoCxZ1tOEA3/vTnmXQhPQ82mBk7mVBk694?=
 =?iso-8859-1?Q?z6n6LPqyFZBy/MIaDACLQejjpnd8yS/97U6nGGPRWxzLaNppWRnykYNyYP?=
 =?iso-8859-1?Q?6DEBYmGQAhkqj3JPLreRC0GXEZWMMNRI9nB3C+lnvgC7Ovzue6suViSV6v?=
 =?iso-8859-1?Q?TJipjfkbz9wSzAEK1x9gU5j7P1oTxq0GTaiiLRGs/Jft8PspT2/YK39ys1?=
 =?iso-8859-1?Q?JjDnnoXBmzWJDQvxMTdNn792AjJpw+bg9DiOFJUZsvxd4VOfVt2aGjOUSP?=
 =?iso-8859-1?Q?AV5XE9XASnqVsxIZUe2PPrq+WmikN6z5dZJkWpHTUqgpmZsQgU4LAuKlzg?=
 =?iso-8859-1?Q?e2F1odDvDUYO4CPTyAUcttZ+8V0bVv6uxaJlJiXOHaGjbSDnbqH9JyEeNt?=
 =?iso-8859-1?Q?dsR7mJB7FkW3XKvP/r9LvA+L8yHJgI0qTkfK2FcX4kbhogvChHsZwob92s?=
 =?iso-8859-1?Q?oq0S19sjG+EZta78Mkw87HY+GnWCEHVvwmeBTXonkDNE4m3/zfcUBsZJPy?=
 =?iso-8859-1?Q?Lf9qbj4ZjMT4en0lZ1eYv/rN2mnmdeA/Kr8nT1SRzPuSMsWIbbYRy319F0?=
 =?iso-8859-1?Q?q9+7Cwj9rZ1R7YFe66aeYYpGvcf8bO7nivmrSj96OnT4YYY4Zio3gOxb8h?=
 =?iso-8859-1?Q?BukJ4fCgHCJoFwYm7pT5kCHphF2VC+iVryEobLFwdzAEjNgqzPqyoyjItD?=
 =?iso-8859-1?Q?o4zTGSQe9l8rvXuiWgOlxWUlwnS5s935VkWN1ALwE36H8UpdrdfnFjmf08?=
 =?iso-8859-1?Q?H94f5KQ/OJ244g6n9kaF1BsoU6Ty+WeeYYX3ZM8YbPq3PzOWA0FV531IxR?=
 =?iso-8859-1?Q?fXkCQh2g28m6MuHiSJhod6Mh2+g1roiA54E8kHJkYFGWxr8IXPXBAOrtMY?=
 =?iso-8859-1?Q?sl0uHwkxcYqvBwAlYrCCWZ03R1jCnhPgph8fW/VuBx7TFuyAvft40e3alq?=
 =?iso-8859-1?Q?ByTq14/QxISahs9nv/A68drHbDOpGq/CjEY75yuAkkH9Zl2maKzVmTSXcQ?=
 =?iso-8859-1?Q?ZR/8r7jlsvDP9G0UEMUJ1wGSVUFSVUbnHma/usF66zkdxc5Pczp8lA06uJ?=
 =?iso-8859-1?Q?9ZxwuXZwQ4PTQ204lu4BFjOKCIIu3AJwWMKOWPTbVpnspKVP31ufR0gj5y?=
 =?iso-8859-1?Q?kDUm1k3HTs4XeQQTn8okvNMeV4JC+yz5KdaNMFHdvhWNeCMp9tSnD/zWFZ?=
 =?iso-8859-1?Q?b+IwH+yiPamo+t6XN3qeC6+f3Cl+97M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912e497c-f35b-4b48-98fd-08de6af4366e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 11:37:05.0423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+EqZmQanIbEBiLUB1/l3xE5tUYE93v/XpZqSHGpZ0MB8yTsPwMcY0b2Z2yjPqBWcd+t4wcCGmVBRWbvT976hzDqHeYWapgG28OcseiXWss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7615
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 74202135C43
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

Changes in v10:
- removed extra include in memcpy-{to/from}io.c files

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
 xen/arch/arm/lib/memcpy-fromio.c | 55 ++++++++++++++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 55 ++++++++++++++++++++++++++++++++
 xen/include/xen/io.h             | 10 ++++++
 6 files changed, 124 insertions(+)
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
index 0000000000..3b27ab2949
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
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
index 0000000000..a6ad08b805
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
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

