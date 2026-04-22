Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEBVIPCV6GmENAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02B444089
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290081.1569773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxO-0000x2-TI; Wed, 22 Apr 2026 09:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290081.1569773; Wed, 22 Apr 2026 09:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxO-0000tQ-L4; Wed, 22 Apr 2026 09:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1290081;
 Wed, 22 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFTxM-0000qj-Fw
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTxL-00HYU2-QM
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:33:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895d9-5cb7-0a2a0a5109dd-0a2a450abbdc-14
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:15 +0200
Received: from [52.101.72.72]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895db-56b3-0a2a450a0019-346548484ad9-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:15 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7710.eurprd03.prod.outlook.com (2603:10a6:20b:41f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 09:33:13 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:33:13 +0000
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
 b=PWLzPj9MnfT3kxCioJLRHzqqu4T4HdQCj4kQgR/Rj4xvrhIE786Jl/MCxgSX1UNuSgBiEjpLSMuE0s0g9VM9W1VgKW16qE7LIz2lKnauL2LO7yoJATGRtCrbSRaC+p3N6en1TTf5m8ZfSLwzPS4sRL87M6uTJdvpFzMIujOeg03LaI38KNhEyrUHlcnNjN5MfkZFqVUslC5pIP8IKgIEA0UUAGIzzE4znG8ZRdRyxEl7uNeCYMVRaRrSqny75mV3VpLykzvEzTOZU6uTX5ZAWa27z0Hn/zOVz+IGeOAWe3ZKwdfNRjFbIdnhUwZutCPEu7bbHYyp6J24d6LyCrOgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DcNez1M3Dn6MN/zRL82fATol+87hIm7jRp25fQVXYQ=;
 b=ZgnOrW92592B6aOrYq9HxH+fWrpLEFU5hWBARLDFjuOdeqEPz/abEBgS4uybfornSrJpcieUKRoonwqaxS4+wj+XJkXbmsFqyu6fbvvKLKZJ2LgieHu2UssdE7xEBpJYMqXFxN77/rlnL2ukWat9v+1rMqm4pWVwI13Xtd/jb0MTxEevFbUIZwRvnJgNjXc+J56HLSg1AbY3itNtd6L4GCBr0NW5LbKLNRRP71SuC4sO10ah+4MLE9ByVp42Oov0DelcjSlndATreNWLhxrZI4bxfelnRugwFnHcKhZnl0M5irgZdOxapxXpOE6ecgEv6piCgse5/aIdqIJK01rETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DcNez1M3Dn6MN/zRL82fATol+87hIm7jRp25fQVXYQ=;
 b=u+AGlzYNwb/GPvpce0So+D6GZHdbva6W3iODdBEgdJnhDKGLOpKG2D02CGQGeWXVuIuJAErz69g7hhIEhcqeoBTLMQOvp+RyNtbP4UTROKqcAPZUgtS+PdMM7KMFp36ww1j7Lw5cCGls8LPMX0KBrL3CA6R92LHj+nLgrJTJW//myxI+qT1gOfZRokSdwxWA9o/QWYj+aPkg2dgrZgPGoHY0Y6H9Adbx/UwZ2acCszePeZtSHdSzWBYa4zgAVuFNu4MBTXTlpewJHAPJaptgltmkhC2c8l/xLwsFVJ29by1ES6ZOBvCWbun+qLCo7hKfdpC0LeCk327rkKp70TLT3Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3 1/4] xen/drivers/char: fix SCIF IRQ registration failure
 propagation
Thread-Topic: [PATCH v3 1/4] xen/drivers/char: fix SCIF IRQ registration
 failure propagation
Thread-Index: AQHc0jsKUadkzPilIka4irnnhKul9A==
Date: Wed, 22 Apr 2026 09:33:13 +0000
Message-ID:
 <519488a3f63d3bb6af9a6fb794b85e9960710b23.1776850201.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 40a909f0-720c-4429-84e7-08dea0522d03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 uyrXlmIH4MpujhIg4OHJd9il9/FqOokyIxJdDl4BJbrQAAEfo3knonzCh1r3Ba4aJcRvB1rIyCD4M4x4yPIro0LnA7o/S45ySPVFhrozijjVGRLuXHYzsAtCwRf6ET+rO9ST5Q22YbPKUqylBR+2gOJVLaKlwzpdvWF8PRHjJD765V0gus6z0SRt4qvzO22Y6+3D+Q7Xirg0zDWY4ZjwxPK3MhyxVz61u18Szhdzmg4NYcUGr55nHbxc4AEqKrdZZ1eWJDYr9LhDbveIXc+Fa1AudG4+arXd+KwOX273sY2bVLAO+83xXGOwIC2xb+oDM+sqJ9gtvx+yGCgfaHOj7NP3/poZBFVHa8R3z2Pcr45D7/yXq1TQl7thkXS1NdlWvzE200PYa8USY5BiBoq/c4W5HZnK8N8yDOtJLvPHqtvm1TIZAYFv94E7cMwlTBRXp0QV9T47eowKhqVxRaW0Aebm6QYZYXdCGV6lZKmvlSYLl5fGgmhNT32SyiIbzwUFu9vZqu+7ys95WQzKQNr2PhPhNG+eYZ8hhY+FUSzVYT/qG3xYnKnFNG4GN5Us8rIRfLDIWnKCq5IDTnAkNn0h2PphBOWlX9RuE3+FLjUofkndLxRsXwh0SAX8k3RPiUpLTXk8id7rwF3zKnfMrD0XcTq2wEqTKaMSZ10/G9wQKN6dfJiDNhWiyZMz4uNB+HFC6zcNO1gCy/V5qSsmrUwZHrRNPCn8IuKpexD96kpvSF7ZcAxlog+SicLbmhz36tLy1Bvf8heXIgRhg8FfNAaXMqgBxaXoNiugvkvnAn4jQQE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ME/9BiZA5j+vMG1jj/oGm+ui0xqYcs+956nIuurIUJffHZj26CUEgSzNN+?=
 =?iso-8859-1?Q?X0odMhVxjbZWOf1gcLQFrSWOrx85aDcsYPS2tbMJFeMKLx/f49nsIuro/s?=
 =?iso-8859-1?Q?og7VBjA+PNkRbkHIdi9B/S8RX3W63qeGNInadih7S5ldeRxTHgyT/wx8yb?=
 =?iso-8859-1?Q?dsHDVyMvvIhmJ67mfs+GP6UTLr9vRYRZnKBUCytiQOFqnWFkEVWnPS+L4T?=
 =?iso-8859-1?Q?wnUxOipb7vnoLjWsdWYybB13gn1JuIgNECWMyjKrONl08WNJZyaGSlFNvA?=
 =?iso-8859-1?Q?Of4Ke9y3j7A/uKCi/cmsLKrUxCRH8mtIsVByc2UqgEjW7OURMG/g6zNaCT?=
 =?iso-8859-1?Q?OokIyAXztJAcPGrTLCV2+EWCxL9mwiRIgz/PfJRTrtEbN8PHuDe7SbcD49?=
 =?iso-8859-1?Q?nc1luDQ9VcVxWMYexm3HoxZI8aX40wQdzrPmmgAxhpk6+FeFuXVWdtKVDe?=
 =?iso-8859-1?Q?j6Xj7+tokmRzFOkIUQYI6x7m+uy5805G1VfnEhfL7fF1YVV2+iKDeSoW8U?=
 =?iso-8859-1?Q?QbXgaFgDf+bSL1Acry1MI1PM31tEjGjlEQYkckL5mWkrmu0YGqSY6Bcxty?=
 =?iso-8859-1?Q?nWmEAzdAdlekouorBJFL3t6AJ7yTHyfXSGKxVADD9C7B1aZjekEIMdMmpH?=
 =?iso-8859-1?Q?CePqKDc73alI018okhRjw5RB5YB2uw9NQk2Fj5A51QLRgd1gGGMowxoV4+?=
 =?iso-8859-1?Q?hMVLfInMju9YzuHl7b6VPxtuUy4T+VjHD40l50J9gD5BlbBTwwRVjzXI2i?=
 =?iso-8859-1?Q?dTygnJJMR0fdXPYrsPk/yvUVY/ycUHWXfL3rL3iE9pq4ocdadsxK4ZR4/j?=
 =?iso-8859-1?Q?HDE3/BVHOw/7RmsE9LBxrnNVv793IuYjCQov+9L3A1hgxVeeVa4LllHeKP?=
 =?iso-8859-1?Q?rT3tEzaUqg7+X88RDPFeTt/lEsrQLuvQ2U0m2DSQUDm6Q1Dfn3kpvnFQzf?=
 =?iso-8859-1?Q?imFPTjQPvZwnsBV0NAlqv3wcY5sfYQ5t3dEjhUFhc3GQwxIyI3P1s5AzW8?=
 =?iso-8859-1?Q?sJB1PQXjrPUfYWKWcMaWzdqL2NxVUReYQo44v2s4oZY35kcREu5LzmwRnZ?=
 =?iso-8859-1?Q?jj33toowbTRc6YvLiIuKTBQRnAYp+uj89Ach9E11BaooZKRL0uWjbnC42X?=
 =?iso-8859-1?Q?Xa4MTLBvoW1AF1hsYi8Fr7sdC5AfmbIYSXibGysdFKcmuCphJPFZF/QByt?=
 =?iso-8859-1?Q?pNN5JeCsdJUw2Osz/m7Hyumi6tUqCFOOAHPi47GOeFWGaJp0q6wh3U8tq7?=
 =?iso-8859-1?Q?H5pXCdjaFOUR2KIWGJPSwe6ucdwyxsPJuk/i9iv53IVnq4vdKRdfqirJBC?=
 =?iso-8859-1?Q?Euvnzq6K8ZtUztRu9lG0RgPGKdmjxlJ+GkcZKOIRj5YJbeHNeh9kkIVWhd?=
 =?iso-8859-1?Q?TF5umi+ph58bGbqTYjIDakgrpW4jvqrGzgNueQe6qBiMlhgRaSjlUGjyTi?=
 =?iso-8859-1?Q?T2okLTVE40ce9z2sV3fOfpOjjGO7N8rCLvyL98d/TzZajwEv5Bj98hmAEH?=
 =?iso-8859-1?Q?HbjiPkFmDysMaUuEeEbpXBXzUiId/A9/UNsscqkzFQ76u+n1EqDfvtDTs3?=
 =?iso-8859-1?Q?p1t2fZrEBFddgt15lRNQYWUSi8OUIbfc1X65GCEtP84UrqXmh0Rv/bv8Pk?=
 =?iso-8859-1?Q?rVYWwELRdwtEKP2rv3X0X7Ot87MuFQ3ciSnFKIL96BO9WSg2c8op4kzngP?=
 =?iso-8859-1?Q?VVzpoL6bnOumbE+gOGJ/LG3n5t1boNgvWfIj4hruTSi42GmuvGnsWXadxP?=
 =?iso-8859-1?Q?LqYiLaeHQ0GCHAbqY0d/qbCylsqSdMP6+suTVM0aJfc5Cm5CIFD5yqmBHe?=
 =?iso-8859-1?Q?ZZithb95xCdndYhWyWexiJ8Vk2/m+SM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a909f0-720c-4429-84e7-08dea0522d03
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 09:33:13.6031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulqNtfuQBBUJ+pn98mgs5l4dSKIRdQ3V6MRkh0vYRGKjU92HeTlUTN3DFP5vjmwuV2oIPelJSuxcmYGUw3xs5xIN1RVcuo/A5SVDT/G+wEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7710
X-purgate-ID: tlsNG-4011c0/1776850395-815848B7-4717532A/0/0
X-purgate-type: clean
X-purgate-size: 3042
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8D02B444089
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

(no changes since v2)

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

