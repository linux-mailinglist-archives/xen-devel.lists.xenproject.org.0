Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIaLIaEJB2r5qwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA354EDE0
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309889.1580902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr88-0004xk-LL; Fri, 15 May 2026 11:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309889.1580902; Fri, 15 May 2026 11:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr88-0004v1-Ge; Fri, 15 May 2026 11:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1309889;
 Fri, 15 May 2026 11:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wNr87-0004s4-1F
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr86-00Abbl-DX
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:54:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070990-e002-0a2a0a5209dd-0a2a450aa776-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:58 +0200
Received: from [52.101.70.125]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070991-56b3-0a2a450a0019-3465467d29db-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:58 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6926.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:54:55 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:54:55 +0000
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
 b=Snuy+/Ydv9IS9NNHSrazbS8S2KXSVad1Fk9NbnK3sdxyXkHv/L2dtPvSuARonY+w6zVahRz7EBMIZPpbfGl/7IdZEiQe0y+zY19ywjbq26CXELqnYGUHhNqOd/nLaou+Ib8C9AQKvToT3d6GP4EFr5Ynm/MoQ+QniHBWQqtk5anb+0jNdZZSupCDseX79YXNN3vMvgg8sXbUHIrtnbNAcmYkEKkSKE9NLWuQl5rsQ7SooS7Ssh1x64fP3P6CmeoOvwlTgGTejgENLsqNjei56gIE/IXm0lJupAxsuoX53AptLIEqyTfDtEcqvvTArFdgx286w4wdgdRu3skziVPSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhGSJeVHTRH7CAcL+cB5KNt1t+/dEP9CdloVh0N4g78=;
 b=jkLpAfmIVHca36S6icMq30wDyZYtmLEPyif4U9s2b6prr80A9kUGmc+w01et/JJa3RL/iqSqeQvbwYtsU2u9qGEehd40N8u64mbd0Q3L0PXfr/lRyE0KPcnuD6Ko8cX2MTdTw4Kda9l1x/oO+gwAWTVdIEfjCgB8/hJHXjoLRO0A2qYxvzBzau3aCii102J4XZD2E3gWAx6YF26T7+aSMr8M/7AaYVbvwDY4Dowammlip0MKNUhIslW+kyVLBz3SSlS8DL0975q6mRnjyPFI3HvQDL2cwkwMT4DWl84ay4VyRkNhIK7ANLiAeG593916bGC0mFYd72+NqhX0UoBdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhGSJeVHTRH7CAcL+cB5KNt1t+/dEP9CdloVh0N4g78=;
 b=JYXou3GXG4cKitsmoVYyC87XDBzN5GnnFx3h3QchgTFzVG8SahLk3AAJ5NoajWA/9VZtVykUL3ch2ukF7BQ81OZhmqWu1KXCcVI4Qp5WnVe2+dE4gBHJ0Xn6JX6Cz4alz9q16cgOAqGg7GIWN3jw0NFxQr9HPJ8lhYJNXybcDNYWpMwkYep1w7Y2bTgqIfw8+v6cHUheLjRUegv/VT8MamQ5zns5hs7O4c4XEr2PlDB/e19ktecYs/6OvGNIkJ7qAQm/6kXXz/GWvhhfpfkvsYO1/nlRiKh2lm3h7A1nfqPIFv1BU+WzhKz+w9kw/yqTGhVVH8z9PqYbJOvK/jJmig==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 1/6] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v8 1/6] arm/irq: Keep track of irq affinities
Thread-Index: AQHc5GGlhAXHchguZ0CmpA+A7r8r9w==
Date: Fri, 15 May 2026 11:54:55 +0000
Message-ID:
 <72c0423562c81fe1bc90aaaf1f79599a94e771ca.1778845596.git.mykyta_poturai@epam.com>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1778845596.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6926:EE_
x-ms-office365-filtering-correlation-id: 4ee603f3-306f-4d06-2e97-08deb278c83e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|38070700021|11063799003;
x-microsoft-antispam-message-info:
 pLwNM8Er6ig/o1Q7nkTpSfBLQCjxJLFBpPY3Rwo9rONhG1VD+wWlfaLgY3w+yWkrpCj8FrpkULZkgDdmLw7BejBL7mvdzFcwKzt+b5G8kU9W57jP8f4HugBgsmI8xpuPzChNHAILJa3QikG4XlEO7aAvFM8JnlBYeWHNc451+iqvZXQeYPzwNdBCX45pUnTacn+/i5f/tYYdigXePRcxglZASwHAmIdBQrgVgWyG1IfINgUjnp8dXvVb4VyPLvNjBnNRWcp91l0Jq5Y8SjOQYOqw91y/XTcus9OKRMocqeL9C1iy/9ZquDpVcIXx7+5xKP2djxYvObC+m5M9XpiX6XTGKSKFYXRxfbbZ0OjlgOCrU3iYIDKDblz+2v0lh9wsOXBfcSbQdivcKXdO9bHwKqAfC3S8hV8OsGhlF3A21UwG2Y24AW+kk8Fe8PzArc0/nszB3kfXffDG2hUC9jS2qE4+SUlFB4azeOZUiScrjIlv99tPCcL8NMPxkCVrDYSBFYCDrgQQTMuytMJc+U/UHO9yeGlA3bd+HkwWd9J8kwuo8VMYtcuSLgSxhMgc1ONLBbr0cZTD0+k9Tsl+BIHuyzBqe21Xwb+39TwJbaW0Zrv7IC/bcLPsYpdashQS+1BG7l9OHSWIGynCOSpjjmHrJsX9TMYBdoBXxj0WxnyGWcJm2oVLnCriotVPtXQvOfqup4olYLGDIlwdilpf6n8ELWfzttZfF8Z8fggV+Kobo17KE8YR3SCNt0mZ+2cA2k24
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(38070700021)(11063799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?w7tFQc4EaOeUK15ooJaNHTskvIt+ccLep8Tuyco6gYx/dahIFTsrWFdLYa?=
 =?iso-8859-1?Q?oMn6yoVdm9+b2ieHqm/VQxhZkYfInq+tY0C4FRpaNYHDN/H8OfuxEw7cwn?=
 =?iso-8859-1?Q?o9bFRyR6eEzHjDO/f5jhlnjs2PKxZUWFVVqHFX9uS7MMz83+mrD5Zsx+AH?=
 =?iso-8859-1?Q?s/5pqIUZPsZ6DXO4oDHDN/2xfecAIu7bI28i3FVBaw0diBzhkG7/sdzgw2?=
 =?iso-8859-1?Q?iIyn1sIPlQ+AvxOOddMRQHOoxMAJoflWCBuJA46d0mJyTfK+T5/8FbJoZz?=
 =?iso-8859-1?Q?TB5NeRVoQWNwb86OiF/lS9KuUol0kAp1quIJ6Rvl/tB9MK6W0h1ECx2Wfl?=
 =?iso-8859-1?Q?pnrGtHMyx7yj6bfzb/c+PDCyXxIede1xeIsJB+3gavYgWRk+IflhnQovMZ?=
 =?iso-8859-1?Q?H8JzR45BaKq3nTx9UkaER8w798AuvAEK3BlaJ7AIZSsVa6yEKZ26K30Ij4?=
 =?iso-8859-1?Q?jQqT9oAUzcqy19CXAk2xBu2CNFHOC/x4A7kMn39/ZAZdTtQ6UeTTWUByYI?=
 =?iso-8859-1?Q?heOgP2jHfvHhl01wZYKMFY3wJRELEU5Yg+g7/Fkxqqxe8RiR0XwDhflc29?=
 =?iso-8859-1?Q?IiSACpoN23DenxAE/B0RCV4l5lnaC4qrfFq8QMTs/dv/msbrUj5O+PizyH?=
 =?iso-8859-1?Q?8D0gmykMpHK5Z918JXA6u4vDfJV0qqoLltMvYVbilXyYncJvBRuK3LSE5h?=
 =?iso-8859-1?Q?Mtr0LAh0j2iNLh2L44aWB1h0p3LodCsoerCyJBT8P+IxtnQHyPQL38dPdj?=
 =?iso-8859-1?Q?BvbkQXDT3YXf97ZwMFyiN4nyKsS23UGaTYPRpJhfXh2PPr8KXW8Nrqbbf9?=
 =?iso-8859-1?Q?5BSRN/oWfFi24wEdvwbgGIo5HzoB0kDznrABXOZQAWnq1WzkvWcTuOXGsW?=
 =?iso-8859-1?Q?vAk/5UwTZhpm0zgCMMBEeKwzOpay52VNJOKNwwf6AySeD/UJU/44Bhl9RY?=
 =?iso-8859-1?Q?lc/hQO1WQR0Ax8krReJe7YCtA+h5iyUNEHYabVY/zf7WiMMTxdAqr3akKx?=
 =?iso-8859-1?Q?Da73FZw5R3+qftgQ+hhnOyca2kqgA8zUEfgWfmQyXeC/u/xuHgWNQyfMPZ?=
 =?iso-8859-1?Q?ZM/BpBCIxv8ZtXbPWu6kWRHzRsaGY34EcRXjxkTRnyMAkoexDtNhfIUw9Z?=
 =?iso-8859-1?Q?iV/nhfTb4fTJu4M4TZKgj+iJHHIMGXJEg+D3/IRthqFYVLPQ63CYWgWQsr?=
 =?iso-8859-1?Q?nTHlSw372Vjohu8n6ub8dDiJGmL4vR3TNbDvDfA5+A9uRxSj1TYCRQIF3y?=
 =?iso-8859-1?Q?vJ1hjouaJVu9bKxicYRxwMAOt8XpwoIp6w3n9dYg9DkaZ92eYjncWtBIZx?=
 =?iso-8859-1?Q?CqgkfkCV5Hv3Te4Jt/mFAz8PHbUWx11S8PdPjvbl2pve8l0rC4JjURTkMu?=
 =?iso-8859-1?Q?CRMBaA0tKjfSB65NY2Q+HUy0/+6ujA7Nz5iijbHj7Co1Ssf3t6w3Xl/+9R?=
 =?iso-8859-1?Q?+wm+8Esm+vxgcqlIJnTlYxJqVEY4jv8G/U8xTGCUEaNWDr8vggZkIhrCDC?=
 =?iso-8859-1?Q?gL85IysEFIdbF+2eISJ+n3s3eGyMvSzChADj4Hs4uKy0e9JoGth9+W1WIE?=
 =?iso-8859-1?Q?0Seo5sKfQhQqxbsYiHTl7w5YfhwZbmr0/+nsBI8ZrmsAQrAhmxDNu/Et1W?=
 =?iso-8859-1?Q?E+e1v1crEs73uKd/tKbYWkViYtfJFCQEWnYWiRUJywlzyT7xrHV+LvolYv?=
 =?iso-8859-1?Q?GyBpyY0FsyaDz6Q/CZ8qJ5JFi7fnmuM6fSE+LEGF74tEp4I2EBOQ0fefwZ?=
 =?iso-8859-1?Q?v5512uT5XChLhtH/bdYRl8KFx4vbHPRU+WOoKylGOcXNjtLaImgdfRMYfZ?=
 =?iso-8859-1?Q?YxAAxSLhl2qk3MTDRg/vBV274zQwvNA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee603f3-306f-4d06-2e97-08deb278c83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:54:55.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VH8yQHnDiXEazKaq/MnALjWxTFEsshPBt/VlZWgTZQpJr+0+vlYBr3aeQRg2rX7guF/ew7YpfSjAJwtNX0riA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6926
X-purgate-ID: tlsNG-4011c0/1778846098-7236B8B7-D21091B9/0/0
X-purgate-type: clean
X-purgate-size: 7495
X-Rspamd-Queue-Id: 07FA354EDE0
X-Rspamd-Server: lfdr
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
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Currently on Arm the desc->affinity mask of an irq is never updated,
which makes it hard to know the actual affinity of an interrupt. Fix
this by updating the field in irq_set_affinity. Changing desc->affinity
requires desc->lock to be held, so add an assertion to ensure that
callers of irq_set_affinity are doing so correctly.

With desc->lock now being required for irq_set_affinity, add locking
around calls to it where it was missing.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

---
v6->v7:
* update commit message
* fix possible locking on null desc
* collect RBs

v5->v6:
* add missing locking around irq_set_affinity calls

v4->v5:
* add locking

v3->v4:
* patch introduced
---
 xen/arch/arm/gic-vgic.c          |  2 ++
 xen/arch/arm/irq.c               |  9 +++++++--
 xen/arch/arm/vgic.c              | 14 ++++++++++++--
 xen/arch/arm/vgic/vgic-mmio-v2.c | 11 +++++------
 xen/arch/arm/vgic/vgic.c         | 21 +++++++++++++--------
 5 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index fae80e6cd2..28ad4903b4 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -232,7 +232,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
             if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
             {
                 struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
+                spin_lock(&p->desc->lock);
                 irq_set_affinity(p->desc, cpumask_of(v_target->processor))=
;
+                spin_unlock(&p->desc->lock);
                 clear_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
             }
         }
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..7204bc2b68 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -216,10 +216,15 @@ static inline struct domain *irq_get_domain(struct ir=
q_desc *desc)
     return irq_get_guest_info(desc)->d;
 }
=20
+/* Must be called with desc->lock held */
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
-    if ( desc !=3D NULL )
-        desc->handler->set_affinity(desc, mask);
+    if ( desc =3D=3D NULL )
+        return;
+
+    ASSERT(spin_is_locked(&desc->lock));
+    cpumask_copy(desc->affinity, mask);
+    desc->handler->set_affinity(desc, mask);
 }
=20
 int request_irq(unsigned int irq, unsigned int irqflags,
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 6647071ad4..c59f6873db 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -445,7 +445,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
=20
     if ( list_empty(&p->inflight) )
     {
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         return true;
     }
@@ -453,7 +455,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
     if ( !list_empty(&p->lr_queue) )
     {
         vgic_remove_irq_from_queues(old, p);
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         vgic_inject_irq(new->domain, new, irq, true);
         return true;
@@ -473,6 +477,7 @@ void arch_move_irqs(struct vcpu *v)
     struct domain *d =3D v->domain;
     struct pending_irq *p;
     struct vcpu *v_target;
+    unsigned long flags;
     int i;
=20
     /*
@@ -494,7 +499,13 @@ void arch_move_irqs(struct vcpu *v)
         p =3D irq_to_pending(v_target, virq);
=20
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+        {
+            if ( !p->desc )
+                continue;
+            spin_lock_irqsave(&p->desc->lock, flags);
             irq_set_affinity(p->desc, cpu_mask);
+            spin_unlock_irqrestore(&p->desc->lock, flags);
+        }
     }
 }
=20
@@ -574,8 +585,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsig=
ned int n)
         spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
         if ( p->desc !=3D NULL )
         {
-            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             spin_lock_irqsave(&p->desc->lock, flags);
+            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             /*
              * The irq cannot be a PPI, we only support delivery of SPIs
              * to guests.
@@ -944,4 +955,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, u=
nsigned int rank, uint32_
  * indent-tabs-mode: nil
  * End:
  */
-
diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio=
-v2.c
index b7c2d7ce99..fc04741ca1 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v2.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
@@ -159,24 +159,23 @@ static void vgic_mmio_write_target(struct vcpu *vcpu,
     for ( i =3D 0; i < len; i++ )
     {
         struct vgic_irq *irq =3D vgic_get_irq(vcpu->domain, NULL, intid + =
i);
+        struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
=20
-        spin_lock_irqsave(&irq->irq_lock, flags);
+        spin_lock_irqsave(&desc->lock, flags);
+        spin_lock(&irq->irq_lock);
=20
         irq->targets =3D (val >> (i * 8)) & cpu_mask;
         if ( irq->targets )
         {
             irq->target_vcpu =3D vcpu->domain->vcpu[ffs(irq->targets) - 1]=
;
             if ( irq->hw )
-            {
-                struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
-
                 irq_set_affinity(desc, cpumask_of(irq->target_vcpu->proces=
sor));
-            }
         }
         else
             irq->target_vcpu =3D NULL;
=20
-        spin_unlock_irqrestore(&irq->irq_lock, flags);
+        spin_unlock(&irq->irq_lock);
+        spin_unlock_irqrestore(&desc->lock, flags);
         vgic_put_irq(vcpu->domain, irq);
     }
 }
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b2c0e1873a..1c44236c4f 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -812,22 +812,27 @@ void arch_move_irqs(struct vcpu *v)
     {
         struct vgic_irq *irq =3D vgic_get_irq(d, NULL, i + VGIC_NR_PRIVATE=
_IRQS);
         unsigned long flags;
+        irq_desc_t *desc;
=20
         if ( !irq )
             continue;
=20
-        spin_lock_irqsave(&irq->irq_lock, flags);
-
-        /* Only hardware mapped vIRQs that are targeting this vCPU. */
-        if ( irq->hw && irq->target_vcpu =3D=3D v)
+        if ( !irq->hw )
         {
-            irq_desc_t *desc =3D irq_to_desc(irq->hwintid);
+            vgic_put_irq(d, irq);
+            continue;
+        }
=20
+        desc =3D irq_to_desc(irq->hwintid);
+        spin_lock_irqsave(&desc->lock, flags);
+        spin_lock(&irq->irq_lock);
+
+        /* Only hardware mapped vIRQs that are targeting this vCPU. */
+        if ( irq->target_vcpu =3D=3D v )
             irq_set_affinity(desc, cpumask_of(v->processor));
-        }
=20
-        spin_unlock_irqrestore(&irq->irq_lock, flags);
-        vgic_put_irq(d, irq);
+        spin_unlock(&irq->irq_lock);
+        spin_unlock_irqrestore(&desc->lock, flags);
     }
 }
=20
--=20
2.51.2

