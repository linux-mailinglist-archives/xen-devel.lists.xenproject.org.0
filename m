Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O2HO86u12kMRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D95F3CB90C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277414.1562624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmC-0000MC-22; Thu, 09 Apr 2026 13:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277414.1562624; Thu, 09 Apr 2026 13:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmB-0000Fr-T4; Thu, 09 Apr 2026 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1277414;
 Thu, 09 Apr 2026 13:50:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wApm9-00007Q-NA
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:50:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApm9-005hHg-2v
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:50:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7ae9a-bab6-0a2a0a5309dd-0a2a4508a406-28
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:29 +0200
Received: from [52.101.65.135]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7aea3-fab6-0a2a45080019-34654187b92d-5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:28 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM0PR03MB6132.eurprd03.prod.outlook.com (2603:10a6:20b:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 13:50:26 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 13:50:26 +0000
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
 b=ZEfJF4ynxgz78H1SxcSfW8YAO81vVYou7L3/yqCJ9By+AdlBgJDI85NWr1y//DKwfEa1aDxPyx2OkwTBVjw1cQjlQs7CvGFJxzTUD6bJI835auTSTeK7sE2ubxXc5PSxq4ubGJnZwcqZjQlPBgUsiWQn6dgikC87MK9T/qqmtZihB27M1IOboMRhZmc0EJGf/hX/VbbA/0DXFEUx1TXo/ObPQX2GTg5JdfcFSguNw4nxTy9KANDFYhVWBpHMVBpOC0PtpUhDfqTexb2sRG9bHk7j99EigABQMRVHH1hWuR1A4+/Kzdp7VTgMTXSVV8cRB7B7R5vkliqhm4wZ1Hqivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAfXz+4yU574RkHhJeRj5xLLKToN+/aJ1HqmB1NjL18=;
 b=lBFWPfHaIA9xCfDpBnKdi7P+xkmArhsVhfSbBUACKq+vsv7MaCpNgpaZOclRTdo48D5taV9/5riGPl5z4PhcWUNlfJlVkOTlVlk59FxdsFH9sTt8d8zVRe6kjNctdIU7NodHQxS6OSXjltgxqgSrtbX0yKiNyn99BWEJ5cE600xGvkgNj43DcXV88KOjhcsh2ZkstL12T9yzMD8v8Or6jdDvluCQ5CsKEk3nS4gLmgGOTKWLunAvv3Ikf9Kf+J/XUoIYXFLkk5b4Hy0IijU5YpeM6uzkaaIMjiSA1OZh/c0gjS5PbVcMxKMULL2tIXkmqoiMsLv1SvxoqgKFcQ2IsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAfXz+4yU574RkHhJeRj5xLLKToN+/aJ1HqmB1NjL18=;
 b=IrwzPCUHzxmG0xos1tr2bSlrobF1JZ/zyStLP42/C0YyZIa55mRizxR8rILdmgCU1QDpwrfbcbhe403KSVYE6/ee5GhpFnFGrkdlMjEwINHcrEbYJK0I9s5sXiHagvHJHZSC+MuijkdrrvMHa3k5GpAjYMR2A0lf8fZyNdHCfTPUdKbF8e9mo1b3o9IfmBuPCKA1Lym09AcuqM5i55YGrWofXkKBWTfHFsYB9dJR9SsYJqhzcpAlq9o4VqdPuGTEfZ1RwvrBfJy1DBDKQRufiq2eEXS3calQ9jaayCKZgY4/Qmqgr6bTwhcgcK0FizHYovzwyXnslIGfh2US7s/GaQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2 2/4] xen/drivers/char/pl011: fix IRQ registration failure
 propagation
Thread-Topic: [PATCH v2 2/4] xen/drivers/char/pl011: fix IRQ registration
 failure propagation
Thread-Index: AQHcyCfRI6UUL+j1Mk2LAfnsFV7fPA==
Date: Thu, 9 Apr 2026 13:50:26 +0000
Message-ID:
 <9148b1721adfacf20c5621eb583f6fe87dead767.1775742562.git.oleksii_moisieiev@epam.com>
References: <cover.1775742562.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775742562.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM0PR03MB6132:EE_
x-ms-office365-filtering-correlation-id: 588abf02-8138-40f9-2dc5-08de963ef465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 bq/IPq+gM8Q4WGk61Vyhx6odZd5dQ/kue6bSmt2osxz19XcHf72joTWDhZY+Ekpg/l0+ndj1XOP+FdMPZjqkkBETFFtA8jQlhZZrsFkKiy07oLGZcDk/l0vPS9povQN+R5p8IzJjTHDuzJ6J2iTGTHEdqK+HS0hFlBOI3m2PDU5W3uU3rcDkzbacZL/CCFmVB70/NMmgi1uLec2S6j5T1JtuqwC2SuMuNz0C/u3sCLTHeW6Q1foqQ2T+4EPY0HMV7aDvLmmSK76PkybHOaSzMIyc7ge4lwm9u3OgNYp4Az/7+91Pafit43w09F5RmOGnh/c2KOrsNXRTUUhIFuRGTG3r3xKMnyqtLSBccy1apEqCFjDvNRqRQBFo9Ha8dGfT1uFw8ADnto6hmtp1yvqOwwSBlGS2Wc0tCBfr0b9UJ224a188vvHyrpsWPQ04YHvJaWkUFALDoV/Ygq4o5Rux4OCujx3waFWMOPr0n8bKVv+91twkxeCya+dxCwLECXRuSrMEwcCZJJ7TkBcqua4BDeNUH8vmUxQAzhDdFEqS3Q9ZXJJluTjZ9KFjDhrGnU602zT3f31AHXzntu/k6kJPyfRc7YH+bpT47LFDvodLI2wEPJZ2pw18wd9WzugKC4+EHSTZyHdhydcAzutNxjwh2HxkBFYodwjBs9qQH3Lj6xpcP/RvKkY1RJmeeD6zy53GkpVWZsj18uZSoitcuRUJk9GM3w54wZ2+cjYlCVea+RkT0oKQrnPuakVfYqn685HL+EHdm8y09DUGdHxA+YyCRzGyzmcSTqwSSwSp2FKnwUw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?evqDq4NKjZ11jID0xRJLv1M4athjaJ0MQzHAMTpvNCN1CxVm0tr2Rn3bVw?=
 =?iso-8859-1?Q?IiuY/LwdHIIfvj1XIIaaSgG89C5wgHZIx1G3M1CRBwWxXUollQT38yQ9t1?=
 =?iso-8859-1?Q?BJxK53QP8VHcl0Mom1EoLD2SwvsYGvKxHXiWUS8w+rH75B+yDDdCTG1L/p?=
 =?iso-8859-1?Q?8cGEtMfZHzCoorh6TlZfvlxsZv+81MgM+2POSon+Tn7GHSBO+YOJwYE38c?=
 =?iso-8859-1?Q?kL4ljvCRgsgrLNl8MpRnk/6/uicWB4CpglmZEmm/u7Ht2J42S8EaZ865b3?=
 =?iso-8859-1?Q?n2dSh1fuDGnH6f/FY0ltHJhf/m5gRpwxMFKjA+bU8YzvL6RwE08xQNgnN0?=
 =?iso-8859-1?Q?DDdjSjOOog5hq+7sC9sjMvxOGA5qdUHPMHIgdiublpzmpFYlleYEMGz54R?=
 =?iso-8859-1?Q?STREeu5M5HffIVMG1wiVGYB4vzeTk8B3NVIVBXKlYnBdZjEyJicFoVJ12G?=
 =?iso-8859-1?Q?ltWhWkKgWKXbi9yzmh2zdVpkmzKU+doFh1rbClxbGiDNVvDb6FXmrgtpOp?=
 =?iso-8859-1?Q?B2bJ3fiHc55MaLnv1+VlxGsH9Vav0bQSC2ntWI2d158T3TcNKU1G317iDg?=
 =?iso-8859-1?Q?dwJOMNUxByzkkevNcocEGXVTfbr6edhoMdkMmbbxNnYETQG70Wj1K6542t?=
 =?iso-8859-1?Q?uSHQ6zpftVDnbb4ge0wBg5eHAycNIGtEZ8Ifm+sYA8kiTMdHCQh6RIK4zH?=
 =?iso-8859-1?Q?w4CRm6vX5+y/jWXqiiUnlPKv9bHqjkOXLCZGzHhFLzjK9DDiHMkf5Bez3v?=
 =?iso-8859-1?Q?fVGQMPDNdCNiCd6Jov93WVZ6w9j8jbdnLLJ7YkBQ+1xMQ+wB5zpwAyjFLf?=
 =?iso-8859-1?Q?z5zWYfCK2crF0u/x9DmW9zOACRlm4C3ifmw9V62HAR7FJAj1Q3PPh+85rH?=
 =?iso-8859-1?Q?ynnqiAMunGDH/s8CE9YweHLza410/Y6MIfA73RZrSXjVeZ1RgLEpw0eGJI?=
 =?iso-8859-1?Q?MtpFOo0t0JD9OEEzoMLL/RDlRMZyMOfRqWuk7bwrt2sMPfaz2ElKs30mL0?=
 =?iso-8859-1?Q?f4RC7n0UywlA5JZ6jK/cAbXHF3YD5/R+B9sJ1sdon2c5GHSqQJwLAh06HA?=
 =?iso-8859-1?Q?slvhSfw5/U9Fe+ZaiVwcp7JUm6GkzM+SIvOjoeddBcrJ7CaniuUF/l68oM?=
 =?iso-8859-1?Q?CNNEotlu/4mgn+vAQZJ1kP5zoWMe2LHID1A1O70bhdfSt2sRBP6N2D4ww2?=
 =?iso-8859-1?Q?T4eDI/qEoLb26SZdWCctCwXMrUDLkt6yUoD/JM7L8NsLdlTNSdmc9FG9iK?=
 =?iso-8859-1?Q?qKoqDKSY0a4z2gCLivSpcufsL0fv7S59NFz2yFaR4MFmPSDfERmI1R5ewT?=
 =?iso-8859-1?Q?0Am+sWhQ6inyydrJC3IYklzzt+2ZXedftlCZOTrs9DFImD2/UeUoAcAQOb?=
 =?iso-8859-1?Q?FkQXRhHDjuisdVpktNnS3xqR/ZpKVtKgs6jk73vf4og7j0bGrRg5MLXy4U?=
 =?iso-8859-1?Q?cM8QiEqLCBwQHAsplbolMIDyv0MujRhwpHh2ekh52WgOm66CwXIMtUUB2u?=
 =?iso-8859-1?Q?HiDzPg3hEE6s00aXn2257i03U6S7nEyYROwBDWvK3I0wiq14zXZ5b6uUcP?=
 =?iso-8859-1?Q?rW3wPFq8bPAbmth8QZHrhf+BHqhPah/iUty8IOq1z25Oe1LxnHRW94yONQ?=
 =?iso-8859-1?Q?uqORf2gu+RtYF723h8tg/SLXXpkHfTUdDKjZSYXg2dwD5lq0Cal3anxAH0?=
 =?iso-8859-1?Q?FoQY/idYH30Tn/jYr3ZI7AV1G+eLrumIn+UlHQpNDWmSQGBZIGiaKJ3i24?=
 =?iso-8859-1?Q?IceGGNr1ln1p8AUvUbwu0zGAcGXYiHWhTxkJvW2lCJOW5kBCTgcJL65gLq?=
 =?iso-8859-1?Q?p/y2HTW45Iavl8/ClebOWMUZfW8PjE8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588abf02-8138-40f9-2dc5-08de963ef465
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:50:26.5565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYjlsjc5YKfVLkPX7juPbDHSlOjkQg2VEhGt9luVc/PKjLxmUVkFcWHyQPb2mcXOSGAfQzEAzknYtx8brKrAvfMxLGuLgw4k97D/wGSSvb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6132
X-purgate-ID: tlsNG-c1860d/1775742629-74360497-90379B8F/0/0
X-purgate-type: clean
X-purgate-size: 2372
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0D95F3CB90C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In pl011_init_postirq(), two code paths could reach the
interrupt-unmask write to IMSC without a handler being registered:

- When no valid IRQ number was provided (uart->irq <=3D 0), the original
  positive-condition guard (if uart->irq > 0) skipped the irqaction
  setup but still fell through to the IMSC write, unmasking
  RTI|OEI|BEI|PEI|FEI|TXI|RXI with no handler installed.

- When setup_irq() returned an error, only an error message was
  printed and execution continued to the IMSC write, arming all
  hardware interrupt lines with no handler to service them. On
  platforms where the GIC receives these asserted lines, the result
  is either repeated spurious-interrupt warnings or an unhandled
  interrupt fault.

Restructure pl011_init_postirq() to use early returns: return
immediately when no valid IRQ is provided, and return after logging
the error when setup_irq() fails. The interrupt-enable write to IMSC
is only reached when IRQ registration succeeds.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/drivers/char/pl011.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index 5f9913367d..918b9d4d4a 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -150,13 +150,18 @@ static void __init pl011_init_postirq(struct serial_p=
ort *port)
     struct pl011 *uart =3D port->uart;
     int rc;
=20
-    if ( uart->irq > 0 )
+    /* Don't unmask interrupts if no valid irq was provided */
+    if ( uart->irq <=3D 0 )
+        return;
+
+    uart->irqaction.handler =3D pl011_interrupt;
+    uart->irqaction.name    =3D "pl011";
+    uart->irqaction.dev_id  =3D port;
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
     {
-        uart->irqaction.handler =3D pl011_interrupt;
-        uart->irqaction.name    =3D "pl011";
-        uart->irqaction.dev_id  =3D port;
-        if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-            printk("ERROR: Failed to allocate pl011 IRQ %d\n", uart->irq);
+        printk("ERROR: Failed to allocate pl011 IRQ %d\n", uart->irq);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
     }
=20
     /* Clear pending error interrupts */
--=20
2.43.0

