Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OWsrE8+u12kORggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F089A3CB90E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277413.1562618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmB-0000FI-PS; Thu, 09 Apr 2026 13:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277413.1562618; Thu, 09 Apr 2026 13:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmB-0000Az-KQ; Thu, 09 Apr 2026 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1277413;
 Thu, 09 Apr 2026 13:50:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wApm9-00007I-DN
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:50:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApm8-005hHg-PX
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:50:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7ae9a-bab6-0a2a0a5309dd-0a2a4508a406-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:28 +0200
Received: from [52.101.65.135]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7aea3-fab6-0a2a45080019-34654187b92d-4
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
 b=rXT2lbc3X/fm+9bKFloG8300ettErwjeBOwUEqXy1RMYBe+uvL03Bsz2jTV9pRIjmag2o3w+MDhY87y+B2z3Lg+BQiO/HuJINWypXiiLB8Pki5mDzY8BNeYP5dTAxQHZbMzxXGkOq9LOa8nbK8ijaJHSziadxeonFcjk8xiisS1tDM6hazArWKgqSHku+2dxtxmPCbKe2bYDVYFWE6z69eOWsHe1CYjGMO41s0qYeCY1piVYr7sZeGd0DrvKLDiZ2xDt6pA2GjccGnCax/6rYE70CoxLd4yZoEK0kqZYmnp0rGOA8uqyN4XMMRSybB/VX1zfTGTYF11O0nJlq0JWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJQmSlEhor8w37ZfEXBDxIsCyB/leW+DBAzgDszdUnQ=;
 b=f3PDGMfKHqH5J/FkNBeQm/8BL7lpENbIhD5VyvjtrGz/G3a+R1HR+Xudjr3mQTlNUPuI73p1ej6iZ7v6SaJxQnTDj1G/qrGDKjATSVHB3MJ56XbYmnUC/+zoFfXLMdR4K9xfWgsXjNaC3jxz4qzNHu4Ys7b47keQqcRvv98ecWYnuVgbAL+cSUkuJdKpwLh2bh4H4BCzwyEIB4SK53qPJ0USxXSFxfFP1ao3i7elRIHB5yiCTUyUtMsP/ZtaJrd53Vmu/uwysKxXmlthHTzjzpbL3o+XdVGSmGFRz/jf+TmIClHOjtAh+v8+KHZIFyK7V5fL6Y7n8wQoJEEeBAeA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJQmSlEhor8w37ZfEXBDxIsCyB/leW+DBAzgDszdUnQ=;
 b=NesIK6UO8ap3wXRt/fl96o7qN6X6nCOZxFN5IXxEoVnCGYX91cTKMccGrBiH/pekBPQP7htV83Tdgm45/LQ4Os3lMmRP9DntwGTIRYQRpuemMKChf+6cSX86ip/NcODqjf5cu7MqcASvtdve4QAVTb53rZsdOPavNHdR+xmZMneabNNJhRYAwVJLG1cliXJ0Hk1NdRkWD+ykeQ8KtSlWFMGWi/zvWQtWiQerlGGe2TOKhKFDH/+Ys6X939twX6Qd37vErdn7kYrRiae9JPcSI+j5ZfAezj3TuTWnghmvqobkuHssgkX7cggQyStaNulpSM1HY22c8OqrB4MP1KL5UA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2 1/4] xen/drivers/char: fix SCIF IRQ registration failure
 propagation
Thread-Topic: [PATCH v2 1/4] xen/drivers/char: fix SCIF IRQ registration
 failure propagation
Thread-Index: AQHcyCfREdHUeOlrFkG05EP4j66oig==
Date: Thu, 9 Apr 2026 13:50:26 +0000
Message-ID:
 <276f353ec36258dc545bef581389e60a162988b6.1775742562.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 16f0f59e-698a-48f6-cabc-08de963ef43c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Lx3kwz7BWIHYmWzK2VomXitW+3ufFHDNQ2KsmGr+V8no/zy5snDIHzSP/vbhBtSDY2TyZCrhARkM2cHhCx/fOmcluL6Up5IA7AySrGaMlN1q8CrsGglOEcR9/7g3RjJQcDrk5JKE6Adeamxk9J3J2tzCgASvi8uhnU5vPJBiji1jSrFjKvBXfWuFSm8h9bhHYsKmZoi+8CyWNvl9aeYVQsb9UmOPUAklzoxbhmD/T+HeXqJgUUZhzeydgYqFzg9RkBr2XqDqIo0TMdzbXNjqg0c8OHrWkUDQzX+oZHDNeHD0Gwp0ujVFPlovbWfsON4KVnG/kMfRHOo7Jyuh0qBFnZ72yYV0mLmzpsg9opsPYm0uKeG8TOXgWrFvpozGkWppERzHkgr5/0PLfHLTe9IDZqgJlD8SXfbQmXRltT7XUHAOYSL0U6N0l5OruaxZFpTFv8giLAl4ng0zj+cyJXsqwyoNFKzm7GKqsgobhDBgrBQZpcvK5KaUsQXonRD7ilpnqes4GBnNPuumwVr5erBGY0PxSWVf0NV3hvHSenpdHGalx9+8O3zZBkjNQzpBCK9HIcL0uhZumK+NdtMMPiVp7zDsqmAvTPhsAMdVcWPw65QQfgz4lCkMXDzLdSO1ygElEDkyhjo87Tw1ftXnCo4zmI8n0mMqnM8Ftm3NwfrnG38VT/cU3eK9XbsLQyw2+ZWW/VK2Q762ic2xfqtSHadnYwMSFYt8AY989Vl3d4t5ObTVneWeJO18rJDE8nXUfYgWzbfWhp+OXP+m8B3BPAskFoKmTNwUjZRd/YYxpZe4u1c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WuZypSncnQ5s+MFB583ydNyjY+Xqx9+oM+nnpqwWXl5U4KfTCsQ/+Etjor?=
 =?iso-8859-1?Q?Fgt2hI7UwdVDrhUipNQKRTHTAm9feX9j1jutycaKa9VXmcV6raundNp5Pm?=
 =?iso-8859-1?Q?naTzTb25DhUDUN/rhd4G/Mo7HiqwBEvA0LWO3yuvXS48y83aDsqDArkm0g?=
 =?iso-8859-1?Q?eJosNz/U+GLdAJG+Ecz8+SIFOmT6fgTJqfAmOGtvfs0Bt3Ymio4bzZxkHJ?=
 =?iso-8859-1?Q?iRWZmEwRBurIFWoWq9fgutbGXC2TO3XwdGvDxNLGh57oLZdH0lJSplIgF5?=
 =?iso-8859-1?Q?IgsNBCgPnwGBednGrVx2LIB9o6tq0rCRhGxYsJMamxrgnv0vgZKOx5isyF?=
 =?iso-8859-1?Q?1/GGAqxGoEv75fKGvF5gdTMFtAT+EL3ngyDdtm5peba95qctui5S2+35kJ?=
 =?iso-8859-1?Q?Hkf0nwcclVO03jUoJhQ6AguS+7uPKBJ0nEEIrWATB2MbJWLuYZi2eiIeI6?=
 =?iso-8859-1?Q?VBBXmBSOd0b+c5ATh2acWLUM26eNemaHR/dL/5h9eaP6cEftRXKzp1lR8D?=
 =?iso-8859-1?Q?eIw3wooifT8O4OUgb8pvdKWt6iju+2e9W2mOBAL/I2qagiWdjkRrkKL67H?=
 =?iso-8859-1?Q?6jVSKo8ph74r7MnLZFtL1YY23Tpq0n/XrFkXPqM6N4LsYRVd/tfAJXFtDe?=
 =?iso-8859-1?Q?UrNLgbnybzbZpNOLUEXL1nxAkUNO6Ddxgrv4VoA3n8GFUhQsrucHtAvqkH?=
 =?iso-8859-1?Q?sGEKEB4aA8AszFPDRKaCSRZ10dOvRyYNVvQAFAefy1N2lyRIDb3cpMHpNE?=
 =?iso-8859-1?Q?GiPEKLypTOXTQkX7oSgPRRt+yQrUvEo3HSiUXNqr+GtTijdSYlJPHj1kL7?=
 =?iso-8859-1?Q?QKvWN2e6MDsqATV1eLfQxzY2eDMCEgogIdJScsnsL69t9HQ9aAWWzRlZRk?=
 =?iso-8859-1?Q?6GnmsFkXIOYrrG2dIZWgO5AVYuCBQ6sEh3OL+YWcZunVE2icGgnUZwN1ZZ?=
 =?iso-8859-1?Q?f4iydjA+hOZ6mGD8Vl6c1+9VtJwYo8Ya7m64SXEdksSLSsG7nl89OZ9jiP?=
 =?iso-8859-1?Q?Vb+RKEGrlf8fPDDXO5agn8rzhU4JQvtUlI7az04wQgkyIGOA5aMzlx91Dg?=
 =?iso-8859-1?Q?49K0kTDAUoyEqiRqf6OpCR0XzLwmi3rla1+DAem84iIoMC0hx15K2o+n3n?=
 =?iso-8859-1?Q?JIPLYR7GZORLvI1e1s+n4glUTl9jMcMewQth3ZMponmTrrjeGqvGWYwte7?=
 =?iso-8859-1?Q?Cw3wbe9B/C+ITDf/qo9XbGOG+jCxiMIM+BxWIgRTkZlY1Yuq/ZwuIoFcNs?=
 =?iso-8859-1?Q?FUYL8lTEhPptYNnFFD5d9XBdqpWrAXM/CiZUXXs2WUtbMTjkt0Sn9l6e28?=
 =?iso-8859-1?Q?awF1Q3Yb9JQG93J0Eg8KxOCoU8ksQ/8R4OPvbr0/unyaV5djVw+RJMdxQz?=
 =?iso-8859-1?Q?JelcV0q9Y+G5w+zyT78SV8/6p4AAjpRHEWOb0fnbHkc2vvdCk+eSySqfx+?=
 =?iso-8859-1?Q?CEjBBZsRQy4GdNVd+BseQ5P40vTTf5NtpELFf67WU0m/I7U+FiHv4DmPDp?=
 =?iso-8859-1?Q?qPKGSwBoBAIXC3/3Lb752MlBq//Ar7xvcZLykuKTm5FvuY44nygYs3Otsr?=
 =?iso-8859-1?Q?VFPPM5pYF3UkP/mCEHkNITuaybSaVJLgxyIAO6rvciSmLuRIhd6cMvoL2j?=
 =?iso-8859-1?Q?waRBffZwXqc4R1sht1mZ/aQqPymupXuf5gTfrk/dddVPnA6NfJdye61D7S?=
 =?iso-8859-1?Q?Iw+JrVlvUqiO5IJhLtRwM2w+XjDgCv0brfcnMNbJsYivjlcCQkzm4pVHOC?=
 =?iso-8859-1?Q?AMGlHGR4YBq1rHj95gzP5MBK9o4KRcAVyLTP9pJV5YqiIogIcL7GgA0lFa?=
 =?iso-8859-1?Q?zHH8NYWeLiCnr40SBGQiV6iy/pDaN9k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f0f59e-698a-48f6-cabc-08de963ef43c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:50:26.1973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpFa/9/axK9PnGrP+eIBjYjHjpp0Nd41/OfIGhufHZxZHCn+BEpCUY1W2XulPRRuXua+AZ09irkjz9LMC2/E7pKi3J6bV0BMVLFxrfBeOG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6132
X-purgate-ID: tlsNG-c1860d/1775742628-7455F497-4396C1B6/0/0
X-purgate-type: clean
X-purgate-size: 3017
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F089A3CB90E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In scif_uart_init_postirq(), when setup_irq() returns an error the
failure was only logged via dprintk() and execution continued,
unconditionally writing TIE|RIE|REIE into the Serial Control Register
(SCSCR). This armed all three hardware interrupt lines (TX FIFO empty,
RX data ready, receive error) with no handler registered to service
them. On platforms where the GIC receives these asserted lines, the
result is either repeated spurious-interrupt warnings or an unhandled
interrupt fault.

The fix adds an early return inside the error branch. The
interrupt-enable write to SCSCR is skipped entirely when no handler is
registered.

SCIF TX continues to operate correctly after this change. The Xen
serial framework never calls serial_async_transmit() for SCIF, so
port->txbuf is always NULL. This causes __serial_putc() to take the
synchronous finite-capacity path, which polls the SCFSR_TDFE hardware
flag directly and does not depend on the interrupt mechanism. RX
wouldn't work if irq wasn't registered.

As a secondary clean-up, the hardware error-flag clearing sequence is
moved to before the setup_irq() call so that error bits accumulated
since init_preirq() are cleared unconditionally, regardless of whether
IRQ registration succeeds.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v2:
- Extend fix to pl011, cadence-uart and exynos4210
- fix typo in patch 1 description

 xen/drivers/char/scif-uart.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 888821a3b8..673a2d3800 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -187,16 +187,24 @@ static void __init scif_uart_init_postirq(struct seri=
al_port *port)
     uart->irqaction.name    =3D "scif_uart";
     uart->irqaction.dev_id  =3D port;
=20
-    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
-                uart->irq);
-
     /* Clear all errors */
     if ( scif_readw(uart, params->status_reg) & params->error_mask )
         scif_writew(uart, params->status_reg, ~params->error_mask);
     if ( scif_readw(uart, params->overrun_reg) & params->overrun_mask )
         scif_writew(uart, params->overrun_reg, ~params->overrun_mask);
=20
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+    {
+        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
+                uart->irq);
+        /*
+         * If the IRQ handler could not be installed (setup_irq failed),
+         * do not enable TX/RX or error interrupts. Serial transmit will
+         * fall back to polling mode.
+         */
+        return;
+    }
+
     /* Enable TX/RX and Error Interrupts  */
     scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
                 params->irq_flags);
--=20
2.43.0

