Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QT/PI/CV6GmrNAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC544408C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290083.1569782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxP-0001CS-Bs; Wed, 22 Apr 2026 09:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290083.1569782; Wed, 22 Apr 2026 09:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxP-00014q-8k; Wed, 22 Apr 2026 09:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1290083;
 Wed, 22 Apr 2026 09:33:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFTxM-0000qu-Rm
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTxM-00HYU2-8F
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:33:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895d9-5cb7-0a2a0a5109dd-0a2a450abbdc-18
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:16 +0200
Received: from [52.101.72.72]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895db-56b3-0a2a450a0019-346548484ad9-6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:16 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7710.eurprd03.prod.outlook.com (2603:10a6:20b:41f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 09:33:14 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:33:14 +0000
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
 b=dnDgQtjIk5mjUzWBH84HHV1XHL1DX9kNXewpHWWG+gR38xOc9N8yembUMnQhVI2F8nNCchaxVe2pxnnwVUXV7OHwWoH9nAGCfd5gfF0fvVzy6VEjkcRap51FYMGI+PhTWaTOJ8BgIvk0Z11TOkf9VWr6uCaS9xca3dI0AvA0SWLqnkj0Q5cx0lv5vM4XDLN6TW7TcfJnHrAAenrhI+iSpU2EGYyHEfbGaYJ/eaYG2+qTvKvjwqGTFkLsKhWJjaxpTZq1qnEbEe3Qeus3Vpkt13K8+cWxQGn6ivu83JcFjEduDFeIyLmnglz7FZMkG+HC61EjguKhxBUVBWoF4Avz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZFIzJHIEhj0/DcfLKHa9Srjz1IUu8KC+j6B9uuxT7A=;
 b=eCtyB872bUfTOnXKpeGynGhsiFvkrs9gzArU1jnYqXm+XLRSaxV5uLNPYFgpKK8tGHzxcWA4Ok6JIdmfWqTm77SbmJ2Ryzl7gigkiVrEW3J/ENyycKmZMaeqCWidKc33bnueY/p31WLz1ZO7iGkK2+Qy770mjY75Ru0x4msaTI4yeXAKtvYoXjinNfQRQVbLkxGDCUis9TJw2vEYbqzf8CIJhcixb4VMo3RFg2zCLSCoET3GOkZTTvF10Cyyjmq/ZLULq0Lxf3Nqow0QEj8UsbnhNxfoDRaEJ02H6y6CBpPcSII7VS5luAUXGe9XxIqtnC8/GB2hWf97O5h+hj7EzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZFIzJHIEhj0/DcfLKHa9Srjz1IUu8KC+j6B9uuxT7A=;
 b=YQzckkDQjcd8cJl9Un+HCEwL/RSyHbNYiUMdtPq7aedmWyvkuMHuiR4O1CJu1usBXikysgn6b7NDfTeGvYi/7yePJQGTKiDRfR2EBr2yIlStT4v8+Ji4isbZU/xL+/nITmk5GN/z2ZXfzQOiz3KXCXP2sDkO3Z+WMFgy3v2dGPFGzl8i9T1McXpFJ995Z3PE3U5mkQENvOVHFvK24pQysGaYk6IUqcayUSaXZHgpLFyexxiESZhgFGdsh/XvwvW5H8/LQsVnbCWlDi/HJKmeJbhwUCu7GNPmS1826AjQc+iYE/k8KNnw9ncG5CU1AaOlCf7lfhVHrhlnzod/vn7ZBA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3 3/4] xen/drivers/char/cadence-uart: fix IRQ registration
 failure propagation
Thread-Topic: [PATCH v3 3/4] xen/drivers/char/cadence-uart: fix IRQ
 registration failure propagation
Thread-Index: AQHc0jsKDUGFeFpJykGixIc8urTLVg==
Date: Wed, 22 Apr 2026 09:33:14 +0000
Message-ID:
 <fc65ea2c9dcc7c3bc632c8c1a9f14eeb5de6d9b9.1776850201.git.oleksii_moisieiev@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1776850201.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB7710:EE_
x-ms-office365-filtering-correlation-id: 1e421a2a-4a1d-4eb8-cc13-08dea0522d76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 vU5X5BYh5+FQgee4CHMZg9N3WUbsjtf2WGRkt8v/GvadazB7P7MqyFCWmpPwKjc54ppad4Xf0Y4Yg2/G4hNPS05hHE6rn9K4YfNeIhgbRCC9qfE0OWVzt/yU1xHzf1SeZkSw001RTw2IkfuL6n1NPauVrgx591Lou1I+SfLW00/YRGFVBwTsnT1eqzKNTHatuay2wt6Du+SxEOyhEbxRdnaHkZFeX+x52kLdaS1GeNmQG0nxmIAQPbcVRAWvOic+uEYNuoch378c905ew290K9Noh0U/RGUD40CdRs5MaGFaMdCtiviY4+GqHSunL6Jv/uUoOWThYpQSHyrLm4zVpBU30pQPV2/nLk/yatEtzkyOJQJbi40RmeXXJumJy62Vdh/VVHvo6B3JHiZ8i7GdMbtwq8lsHWE/7AqSO0BKfYtXiUIBdXXK7khrPHeS9H3Q60rM0H02ENEsBP4vt80afxlfAdRg7iPUS4X/aVtESHQy5pPL9e8z5jKF7DQL9unmzxWzNe8AgPOYwnh/bq9Z/p3b+WwL6ooXJmtfUxyUv7bdtomWAY/uSwKordaIla+gFQs9ACOU1r0FsJgfvSjg7ALWJnK6Qzf80JeO3F98KKr9hy1L+KB1wzZyTU5zdpukk0GEc6Pqpnc8bWQqxjdafS/H260PzC1FR82ZeezejWYEO0D/eYBTJlQVNwx2Ub7Xhmn4eXZKaG5VI7cTHhUZu624UB3D8vU5N1YJKYEEsaiTfWq5vCxE81p6wyKFTA9bNr6M0FPnddQVOnPrQHeyCjAfi+SzC1XRpEXi4ll/n6g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?N8GMvou/uNo5S7jOjhvTlppR/XSB4L1bEosdS9gqXf9pUTuYtfi8EPcJjx?=
 =?iso-8859-1?Q?PaIFHMwwaA00iszkRahO2oCTjELsLQaFuUP+pEHX2UlqE1LoUaJlPIw1VM?=
 =?iso-8859-1?Q?pF7SuhXtPghZp6y/NiO8lzreX6021KRFHsWtynEXk57XojH6tKcp93jyaQ?=
 =?iso-8859-1?Q?i3sJD54MzkZ9fiAm5PJBxh6ysbuji/o9oZK2YWkf1HK59JQGrxlTBgwjBi?=
 =?iso-8859-1?Q?y2PnLmInS7fEN7gIiK2Ht/LbXd2zZxvoOeZ0pP8SqyJQfaBZtht+E25cAK?=
 =?iso-8859-1?Q?FazjDnsOI/ysIrxV2Q2ppuH+JcKbvep/ptFvNUXnEh0VJlri87av0jAMSS?=
 =?iso-8859-1?Q?e3ZREyo5+vSEKJrgupUymdf05g5K1hI2HHK8XsIrLXQLHjwTzKp2ElLYMh?=
 =?iso-8859-1?Q?lVyPg/ICC7JpnLcyG0YP2DnIRf4RuL+Vw+ODkT+J6ZGkX03X34/SGgdP7t?=
 =?iso-8859-1?Q?Q+l/ZCY353NhTh5h8WHrUSDAW6MH/Co2En8qmfX84huKC3VmeVkMFtXJf2?=
 =?iso-8859-1?Q?uMJbvrlbc98PKTMy1es/dhl3zZ25+YMNQUg7h0v8CPhOrU/+h7rF/lC3eP?=
 =?iso-8859-1?Q?MAuZPC1c3NXQZXUMFDX5qEWhWrGEKesUGgr6y3xriufO8dkZT/t+2lnVuD?=
 =?iso-8859-1?Q?CHwnyL1VQrSCiubwOFJf2RfT+zScgP2J0zltpAgSqcGO+oz2dzluLJ9Vgc?=
 =?iso-8859-1?Q?WLlG6pb2cHNPwjxUXgEDUKFYhe6NgKwdqd/4jd5ud7QVQrOKnRlEXz5ZDy?=
 =?iso-8859-1?Q?vqXfwDQ3DssIwtoEbD5Mvil7H1A8QYm2wGzpJatvYHNeCdCZT5uM7glWWF?=
 =?iso-8859-1?Q?hW+Hw9hTqYfZZxoLHCC4NHgwzajJgv8DcIhglUQh4NA5j9Db96h6oo7duO?=
 =?iso-8859-1?Q?wjQHLKKAzGIkHNBxbyifX97lXbsVxxvwo8QG4OhrX0uILKqV0TmpPScX/0?=
 =?iso-8859-1?Q?YapsjCuKT45O8s5jiBetzMRXxET6C7wQkSU+9+goMCgDzaQYyj1pIzw+wF?=
 =?iso-8859-1?Q?AAwLqLgeU5aDME3d5Vdvram8X68BDPa7QNfOa6A3wEEhK8VtKKO7Ghpl+6?=
 =?iso-8859-1?Q?V8mb/qhScPDEAb/b4VThuic2NSqclnvy2XsimYQRXLe0+YZGny5zp7gPYT?=
 =?iso-8859-1?Q?r4fpx9Nkjz/YPbp3W4VIbMGHfsn3gUC2MxEUmAYc+48a2jD12FGWIj0aAf?=
 =?iso-8859-1?Q?Ubqm0GxP22GzqSVsF2wgjVUHR5MTR/TRw46ym1JYTdgpP65Bd6QfihuoMP?=
 =?iso-8859-1?Q?QMAGrXeRdCP2SH2TQOPsiWPOKdzr9tFrJxmLnOL40PSf/orG9TEGTuxAT9?=
 =?iso-8859-1?Q?+wF2nLDTo4TXiCqhZoTlRu3L1jpxcStaE9BB85O+6AeboYXjGDc7Od5CpQ?=
 =?iso-8859-1?Q?ZQUb44EfccanSx0iPvoNUwGYBC91BArGxpS3PjQ2wsZN5KX0a4gvFmtX5A?=
 =?iso-8859-1?Q?pjzBkaVaWLhSH8V7CoEA+f3ZYn4GK/vPwo9Q24kQP5rd7sJ3VmGlzsoGJL?=
 =?iso-8859-1?Q?PulrcO3jfp0miichGtQv7kp5x9j4ME/zFs7vq0UnkC4U7b4/QetJzDUobx?=
 =?iso-8859-1?Q?YBD2Dd28Mh6xMtN8Vh3KDnygXnvnlX/3f41q+knIXwQAdAygKgZJ6DfVPn?=
 =?iso-8859-1?Q?zgtzk3K1U07B6vUTdnKbQGVctLgU4Cj3QsupN3z2z4yAZMTLVjZ/9109uY?=
 =?iso-8859-1?Q?G1tFz8u9F25CMWWpsrk+3lrdiNhhkso2ifIfEvC7jFhM78BFr27H5Dau9T?=
 =?iso-8859-1?Q?Qe4Mo1TqLxj09JpGsn7Z0GRDT2q+wmNLWJ2ZrDieml1z9s0SrV4IfnhGe4?=
 =?iso-8859-1?Q?hOUwhNSiZ/Xfq5I6Uhj/Ya/koPF9n1g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e421a2a-4a1d-4eb8-cc13-08dea0522d76
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 09:33:14.3355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKswPy/+HuWuXumqhpQTEsYXxoI0UguotPh5LEUd9dSAeMjr1jNaZAaS4GuloBmIAV89jsDc30zPKGr3WOicrrOquW5bZzaqsn5rj5GmZPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7710
X-purgate-ID: tlsNG-4011c0/1776850396-45F698B7-E2206A9F/0/0
X-purgate-type: clean
X-purgate-size: 2667
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 75CC544408C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In cuart_init_postirq(), two code paths could reach the
interrupt-enable write to IER without a handler being registered:

- When no valid IRQ number was provided (uart->irq <=3D 0), the original
  positive-condition guard (if uart->irq > 0) skipped the irqaction
  setup but still fell through to the IER write, enabling the receive
  data interrupt with no handler installed.

- When setup_irq() returned an error, only an error message was
  printed and execution continued to the IER write, arming the
  receive hardware interrupt line with no handler to service it. On
  platforms where the GIC receives this asserted line, the result is
  either repeated spurious-interrupt warnings or an unhandled
  interrupt fault.

Restructure cuart_init_postirq() to use early returns in both error
paths.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v3:
- clear pending error interrupts before setup_irq call for cadence uart
- change uart->irq <=3D 0 to uart->irq =3D=3D 0 since irq is unsigned

 xen/drivers/char/cadence-uart.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/cadence-uart.c b/xen/drivers/char/cadence-uar=
t.c
index b2f379833f..8961d39de1 100644
--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -72,19 +72,25 @@ static void __init cuart_init_postirq(struct serial_por=
t *port)
     struct cuart *uart =3D port->uart;
     int rc;
=20
-    if ( uart->irq > 0 )
-    {
-        uart->irqaction.handler =3D cuart_interrupt;
-        uart->irqaction.name    =3D "cadence-uart";
-        uart->irqaction.dev_id  =3D port;
-        if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-            printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart=
->irq);
-    }
+    /* Don't unmask interrupts if no valid irq was provided */
+    if ( uart->irq =3D=3D 0 )
+        return;
+
+    uart->irqaction.handler =3D cuart_interrupt;
+    uart->irqaction.name    =3D "cadence-uart";
+    uart->irqaction.dev_id  =3D port;
=20
     /* Clear pending error interrupts */
     cuart_write(uart, R_UART_RTRIG, 1);
     cuart_write(uart, R_UART_CISR, ~0);
=20
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+    {
+        printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart->ir=
q);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
+    }
+
     /* Unmask interrupts */
     cuart_write(uart, R_UART_IDR, ~0);
     cuart_write(uart, R_UART_IER, UART_SR_INTR_RTRIG);
--=20
2.43.0

