Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L0bHugt52mA5AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:57:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E838F437E6A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288517.1568810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5yy-0002MX-Lb; Tue, 21 Apr 2026 07:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288517.1568810; Tue, 21 Apr 2026 07:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5yy-0002Kr-I9; Tue, 21 Apr 2026 07:57:20 +0000
Received: by outflank-mailman (input) for mailman id 1288517;
 Tue, 21 Apr 2026 07:57:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wF5yx-0001vw-AX
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:57:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5yw-002iV5-Mb
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:57:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e72dd8-5cb7-0a2a0a5109dd-0a2a450ca6fe-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:57:18 +0200
Received: from [52.101.72.122]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e72ddc-62f1-0a2a450c0019-3465487ab259-5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:57:17 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11567.eurprd03.prod.outlook.com
 (2603:10a6:20b:724::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 07:57:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 07:57:15 +0000
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
 b=xf9IViNnKCM1biu3q7sVIBp1L0+9mPfNoyS2B3J5dNbCA0fshLpgn73kmKYRUXTvKxZKSkz6ud67Bwx3Y5tgfpGcaE1hJoIPYH4ReHu5nA0ecePrTg+H5qYBml23VUS5OYS3Cn6ToNxClMe3nQSQ8rQtw50nonJx/8qq1x/Z4GnFCOmthAVFMOIEvGCMD26dauaHznGc6DKrelnFln3B/8JolaCNve4g57sETvroU8L0HF7KUb9OzrSRaxzqByg1nUixdGIFgdln3e/yDbATfyCq1a4lZ5qYfDf8h3bt/CZrQu5+MYx6yxd02tmz6R7yW45sx1NV4IpSSL9qsG9TKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfkgoKhQIRkHmGsVvlt2xgEtO5O/j7hjz0ZgQq5HUCs=;
 b=kiiFiLKKx98pJlRDgno5zqKmpglfvlrvEhEUw3gmOi9B+qR9xlij00dZGxNUKFF1KSF/hlUtJ32RuoqBJfl8RjpjFnRo7rt4TT1pb1SWKrDjtuYXEbU8QtTXv2XT2z1D9wrtaEPPAIeQ703FIx+/OOe+fHjh7v8D4T+ESrMVDaEXqI+/7tM2uLyFGCHqpa8Y/uSBMzQ3Qgz6sBqhNQMerihQyF6Hn5E7i94ml1PEBLh6LTgBrHw+TkHoo/0fa08oiinS2n1ZrnDrWpryl4O/K8TJyGDf7Mcho1KIxfqgxBaT/PbZiCSCN/S4NUhQw2keMUhjm7PhrrA0kb6Xpdfm/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfkgoKhQIRkHmGsVvlt2xgEtO5O/j7hjz0ZgQq5HUCs=;
 b=gZ2QMZlR8lbqXMu2T0IVz4CbUMRJkmjhRbC+BDKHy0iVZH6JCY1YHdgRGRnfSOIeDFCYs9g+rP+Wx4eln+B+Wg6hb0qpGAv7mZ2HeHzZP8rBvIpSpRpW5twg8Xmn/gR1guCEbL/2FsWZrwVmtmfilOMJpns1wnYgh7unohvicURn7pLMhVIGv7m1cXng71jGRiihW15iJiE5G6m1yiT0CpgekS06LNBQoVs9KSiWBkFeIurKcifNV5B2t3Qhjib7/qMoG3C/6aovUlssaMQgv+W5A/rnWflkDlGcYq6XAmlND7Xs3gVqtvTZ9ZPjxy1LnazAvvC6ecexNsNy7xkQ8A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 2/2] plat/rcar: Add region id support for PCI
Thread-Topic: [RFC PATCH 2/2] plat/rcar: Add region id support for PCI
Thread-Index: AQHc0WR3HLVfDHqP50KPW64J7aGgdQ==
Date: Tue, 21 Apr 2026 07:57:14 +0000
Message-ID:
 <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1776756291.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11567:EE_
x-ms-office365-filtering-correlation-id: a05233a1-9261-48ca-b01a-08de9f7b9aa6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 4YuHtTu01ke+a/3T07/DlZAvYp1bRVQYlNqsRH79iGANZgij4rImX3ZWKOcGXe1lpDtm20GkfkQkTrTE2hA6QHFWCdCVCizpXIQqi3Ov4KyHsnL9RRKroClHv4Ezi4FxNb8CZSqwa8v9XnWfC4vY/xdahSCT0bBjwhWACe3ux6Eg+Tepmrvn5El/uDNWcVh9DpBR6CoCQ6O7JEl0bUiyk7Y/LyIITojCM9r/fPEh7fz6aWC/meRYUO7B8Eih9G9CBotevjnspBCAR9Lpzoh+8DtmkFJSNsSxAU47V1g2hYg/+1CyevSzxJKHMnZ9eh7K4nYGg2f0cLTebYYyy8K6xpa6eDzksxUXAoIuJJxlUN01w1qLXBzdPHr8wLgqBdLYx1SG/VUNTrX5oC5a+jnGaSNxWXk0eF9xeiMxgTwSjyBdWPgzgIq3sfn7tWVlll8uXoQ65jQNtK+QWAhoIaDOsZnNuzFYjELa8rNR54BcZrvYTqtROu3ArR1iT+YmUBJvBVaZ2D1gqaa5MmAWgA2ty0iy4dWYq2VroxnJHUWx++yUaoTKjR6XV2h4YritStl267LgEQvmuv+qxbpjMjXrJs+qi+OUwiYikDYH4IY5RvV6f6ZS4fuYCdKcvqWpt7F+C8GSsCLq6O39I4iOsCccM4K5fjrOwEwL1zNHYo01mtVHY3jRpeX3W0k2CU9IlJS3L2Pno9VXhhwXH3bCGTelIAKbQ5umHbdxKh+/IT9fIfIqBJdaXHVZ7BsehEIsR2ilI0k2f0NmZNHr4xFyVb+zm+7ne5nyqTk8mctQks6SYqY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yOKZq2+neFzZft4Nvtz3sTi9UNnG0eSqDePNZ9O3c3Al1WuzVa8emQVtrz?=
 =?iso-8859-1?Q?pSgK8dTAHfWWS0wGMFKDqPiU05mD87Ciy3v+OLNuxeZAf/5DEjvF0+kFRz?=
 =?iso-8859-1?Q?RmhdA3dtzne5f4VKpO9Gm2ay4LE67EZf3UVrF+1Rx8pfmvVGYzJJoyRUhM?=
 =?iso-8859-1?Q?aUlfPLXWfw0WZo+YwkxtK9BVOzytb7jY+KIUbg/1djeexrufUppoh+f2es?=
 =?iso-8859-1?Q?KW3mKdMAp1ATqoLKbTS96jXGt3u1+hibr2+g8wjcxZNWQ1hhEDDenwCz7m?=
 =?iso-8859-1?Q?SonE/49zioPbzSDzGzHSvL4aRS1exIzjfa8u257b/Qb2FqJNkJNZKHDGTm?=
 =?iso-8859-1?Q?xpXTY4ojHK5eJKD2omFiHX6Kx+yfxwZgpQna4U91cIDFlVgCtO9TKLM/0w?=
 =?iso-8859-1?Q?HhOCOB6CfIaJV7Ep2GuQvdUFYEl8PCkHyDzr553AztADiyCB8kbmFmxtgC?=
 =?iso-8859-1?Q?3Sv1Iy4TSfQw+aytJ84jIvxEgXt0xBH1lEbuKQI2MdK0WGtc6Tp6ovnBBE?=
 =?iso-8859-1?Q?oVasLc2xz57nL3CLKuv8d9z397HTJNh5yu7/BmI0L0oV0cwC/YJBJcVJXW?=
 =?iso-8859-1?Q?WKvSl5KbA2Bhq9jP0W4UZAT10Ghipscyy4u/iGHKE/AoDR8TKD+HmAi1UO?=
 =?iso-8859-1?Q?/Xx2BhUaM6jZvs8WpPWTBICPdsFtqCv3vXT2Vn9KjV/fVfk0dLQtGZKdG+?=
 =?iso-8859-1?Q?/ZLuRTG/fFdfkBcrFtUFvr0556BdqqmWYwcEGbgX7z39ulJc7FIbZB058K?=
 =?iso-8859-1?Q?ao0vg/Et8d5gGcK4VdI8lgwjkXQ5M1K7IlVevDAHztni0GEgmv7AlOZcQI?=
 =?iso-8859-1?Q?FgP4WoRPQ5uUcGgkpQUa5KWjmMmvfnIgi2R3HgVQIT4dg+1yNNT5ceVTbT?=
 =?iso-8859-1?Q?AN1FJ/Pot/qmR+83ywFtVZk9VqZJndnD90G6mMXnUuR0Qdu+RhxTENYcMr?=
 =?iso-8859-1?Q?2sSbjB0PyRJfEfWhdZvhlTqdwVdSnHUFeiGOBsjHb8i3cYDc2tzX6AxRtD?=
 =?iso-8859-1?Q?qoZZVls2XY2yaN3w5RjU3KJZOc6SIYltnp8t/4BkhGt/sVgPvcFZx1I/gp?=
 =?iso-8859-1?Q?3m8m/TMftrq8RX2ycaW6+CFRmH6svXTVxdQ9uiUqQXiKqyoOsamFH4l5XI?=
 =?iso-8859-1?Q?KGCYE575mdtmObigjTkym3Q6ng8yoO/4JMytF5oLf+F2Eei6X2FNErxn4I?=
 =?iso-8859-1?Q?a4Xjupnl8ZXN+HGQInTEhERaj2Wp177wJHOSPh/Dl3elVcab7klbCKHdoa?=
 =?iso-8859-1?Q?ZWOj1Miy+JV3lpY9ECVxQ8/MSWpklA9V2VIkYIqOvrhCNNXRi3VX/ubFa0?=
 =?iso-8859-1?Q?CXoOAr5aINqLKgUZkZYrYxU5PI08qKsyLwAy9s1ej4spuK6NqHvJgwun2v?=
 =?iso-8859-1?Q?jeLq+RSiPLlDNGM7N8fPET0ayxZBSst6rzdPyKTnRLSAUZfvuW89o8MMvj?=
 =?iso-8859-1?Q?kois52oqUX0VPwbTXBW2tVd4fKlsZyhwvkzBAwzX0IBVhz3fvBRLQJjZTO?=
 =?iso-8859-1?Q?oRoYBsRdqtgldwtXcLFsNZ5xqq6SfTKCc5mcsW7uZvr3lImCr9ehrN9GUS?=
 =?iso-8859-1?Q?vgzrNOGHo7/umTwvtg7udVFOTFr08sVVRakPXhB9ykb696idq6zfTNLa6o?=
 =?iso-8859-1?Q?GpJVi9ZwjcqmssOXJ/XF+MP5qpk5EcjARYhYd/Ks8laW02Ni4Kr6lqz+/o?=
 =?iso-8859-1?Q?AYyGYveYvXi+c0uA2r5thn5vACHGFZNsX0xQ+2ktOmDC7vO6DmLZbqP02w?=
 =?iso-8859-1?Q?jIXa0ZE9vWR0IZKskDfGc70ZJQLvznnDIjjCSTEfi4au+tpwsNI7FXjM0W?=
 =?iso-8859-1?Q?Dth4s4wj1mQ1FvQSdWedjfoPzS3NB/Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05233a1-9261-48ca-b01a-08de9f7b9aa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 07:57:14.6462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcyJf0dz23qi9VuCDsNlhniQiWcxt1awaan660WPrAxo0w3KNMhP7dA5Eu+Dnyao1iKsOYIRvZ0idZs3X9Kabg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11567
X-purgate-ID: tlsNG-d25034/1776758237-6EF72CF5-AE44305C/0/0
X-purgate-type: clean
X-purgate-size: 2996
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E838F437E6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With Region ID enabled, all CPU memory accesses need to have rgid bits
set in the physical address. This creates a problem for PCI BAR
accesses, as it would require all BARs to be 64bit. Implement fixup_bar
callback to add rgid bits to the address before mapping it to the
guests.

Add Kconfig options to enable region id support and set the rgid value
and physical address space size.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar4.c | 15 +++++++++++++++
 xen/arch/arm/platforms/Kconfig    | 21 +++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
index e1e8eb0ee1..50400c04c4 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -43,6 +43,12 @@ struct rcar4_pcie_priv {
     DECLARE_BITMAP(osid_regs, NUM_OSID_REGS);
 };
=20
+#define ULL(X) _AC(X, ULL)
+#define MADDR_RGID(a)    (ULL(a) << CONFIG_RCAR_PA_BITS)
+#define MADDR_PA_MASK    ((1ULL << CONFIG_RCAR_PA_BITS) - 1)
+
+#define MADDR_ENCODE_RGID(a)    (MADDR_RGID(CONFIG_RCAR_RGID) | (a))
+
 /*
  * PCI host bridges often have different ways to access the root and child
  * bus config spaces:
@@ -61,6 +67,14 @@ static int __init rcar4_child_cfg_reg_index(struct dt_de=
vice_node *np)
     return dt_property_match_string(np, "reg-names", "config");
 }
=20
+static void rcar4_pcie_fixup_bar(struct pci_host_bridge *bridge,
+                                 unsigned int bar_num,
+                                 paddr_t *addr)
+{
+    if ( IS_ENABLED(CONFIG_RCAR_REGION_ID_SUPPORT) )
+        *addr =3D MADDR_ENCODE_RGID(*addr);
+}
+
 /* ECAM ops */
 static const struct pci_ecam_ops rcar4_pcie_ops =3D {
     .bus_shift  =3D 20,
@@ -71,6 +85,7 @@ static const struct pci_ecam_ops rcar4_pcie_ops =3D {
         .write                  =3D pci_generic_config_write,
         .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
         .init_bus_range         =3D pci_generic_init_bus_range,
+        .fixup_bar              =3D rcar4_pcie_fixup_bar,
     }
 };
=20
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfi=
g
index 888d0b85d5..db096952c8 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -64,6 +64,27 @@ config NO_PLAT
=20
 endchoice
=20
+menu "RCar Region ID Support"
+    visible if RCAR4
+
+config RCAR_REGION_ID_SUPPORT
+	bool "Renesas Region ID support for R-Car Gen4 platforms" if EXPERT
+	depends on RCAR4
+	help
+	  Enable experimental Region ID support for R-Car Gen4 platforms
+
+config RCAR_RGID
+	int "Region ID encoded in physical address"
+	depends on RCAR_REGION_ID_SUPPORT
+	default 0
+
+config RCAR_PA_BITS
+	int "Physical address space size"
+	depends on RCAR_REGION_ID_SUPPORT
+	default 36
+
+endmenu
+
 config ALL64_PLAT
 	bool
 	default (ALL_PLAT && ARM_64)
--=20
2.51.2

