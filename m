Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAsOKKAJB2r5qwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565CA54EDD7
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309891.1580913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr89-0005AE-E5; Fri, 15 May 2026 11:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309891.1580913; Fri, 15 May 2026 11:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr89-00054h-5y; Fri, 15 May 2026 11:55:01 +0000
Received: by outflank-mailman (input) for mailman id 1309891;
 Fri, 15 May 2026 11:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wNr87-0004sC-Fo
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr86-00Abbl-Rt
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:54:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070990-e002-0a2a0a5209dd-0a2a450aa776-12
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:58 +0200
Received: from [52.101.70.125]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070991-56b3-0a2a450a0019-3465467d29db-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:58 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6926.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:54:56 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:54:56 +0000
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
 b=MkaDUbDgp9doqh8iTPf9soKWDN91nGJXX/YMaBHtyJ+ZwDioEdstjCwuolMcLb2nU+TuzqC+S+/y1pfJgzj1mVsr555tqDTkoeANv96zA1tbmR2fthTSEEoi1rs1F6T1/46i+eQHYciVUMZH88a7jBQx1LsPfaTLIl1o3OZ/TqNrVCe1Gppd6cRqKmmVwGocjwfy7kqfTDm4REb0/87iaRifxA4Gs9jx32VHQaZRBw4jsCue+6N7gsGv3RtxnvqXdwP/sfz22vlHeoRMKrDC5L+WsJMgp43Ch1rid+5xV1QtC69mxePk0EUMRINL/9H4bamGJpRs+yiw6ih20ED2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvW2UrW+rgRpup1fB2WA+AdZ64UD5QAXF33FcLUu2hk=;
 b=rze6vTz6iXeXLmUXSpNOtVRCouz18Tsyt7FCoUPLhfNsaPftsgw1Se36Ocj5I2awd5VaKkocSKnn5hD8Tl3Kvy7ecwERTf+dPe1dtcuzmlJKNJvfeBBy43AUxWMNrSlxxJGmCS4cEZeKknRGraWX43pGHBG2zKhq9G8NO8rEVFI7WDpfakPJFz79CqOZY9Z7iC9KN6QigKl0qZHES3TRLK1/q6WWYEAFVhtD03G28YxZKsFTbygz2a+zPtX0vUFV1aaNL6q7icHeNTJDg7AjDT9B/UshNYBvYOkLQUBICTy1y6ey++rNuebaMDXB4PQmlMYjWKVDkhhXsP0ZyR7e6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvW2UrW+rgRpup1fB2WA+AdZ64UD5QAXF33FcLUu2hk=;
 b=fqQD7vPhZw7AoNuMlqGaqGYHfrp4BL7/I8iwoq2IRuDvvdOzVgj6MLrjATXI8We7nrGRRCYj8g+2J8MCMypD6NLu4kG6k65nAVjUjMrjD6bmmpOv3/buR1RJj6JzDEsjW7FOFx3shOl9NptcUGBSrrc9J8cWJyVJlz4oUrKhryRHuJQb6oSOO3htaWRSo27p8nfudGrr/Gv1aUXutiDVuGGyWacxcZXCBxDxCovY7wib3TUy6QGXwE+vuiw7fE0g6XzEsWaUt4dpNile6aHG9RBBhzBrPi83stw+Enf2dCpLflncnPpBZVjj/s1y3et/i0zlpGz5Q6toIU9DUXzZ+Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 3/6] Kconfig: Make cpu hotplug configurable
Thread-Topic: [PATCH v8 3/6] Kconfig: Make cpu hotplug configurable
Thread-Index: AQHc5GGmydFYeCVrlkigcpKCw3qy7w==
Date: Fri, 15 May 2026 11:54:56 +0000
Message-ID:
 <c32ac85498cd4dd4c1654e81b8880ce3c5149c01.1778845596.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 34844db3-f29f-4267-c1ba-08deb278c8a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|38070700021|10063799003|11063799003;
x-microsoft-antispam-message-info:
 Yali/aryMukM+qanN4sK/JxouPUhYzr7LDEzOLaZcnJqlPf6svDsF5l+bXhvNlm/uAfDg5mb88nsvOnov/RMG5MNaTmFuXDgoMt0Qu/pDo0KmST48lsO9RDoolvn5pBLkQqn4fyRUvvNaCQI6lcFPpO4Ob58hG0y3XTyWBnQ/43QhBHJP/xzAh2fmjZKCq7gcVgcyZDIyEWpaZn9L1Um1KvDOGhwm80zBC/YFacplzoV0O+tAQS2vBWgqBzNASKFN/DehY/RP/nXb4O4GvnzEjQuNOgHbR7th3U4FUzh0M8UtwToaRKnL87wBrCSYUSFWxfsP8K2nUX8LdU/5cyzg7jfjLs+1TCqcTFP6sKOd+le8sTj7HX70X+RHMN2rJIalUUvntG3LK5KfCidayQuC3NoHj+Twao4ijbZBfbqMy3BeEGPVT2CEVeA+rT1U1i/r3FUrAoh4WEbyzywEK7gUBIIWkrBXm6ODnx72Xyz63XbOAP5n4w6RbtoxTBKWPsIsDr5TxsCGS2TsO+vaaVOUYPobG79QL5zW/Da0rZtRggI+RXB9ZoS7CmKZTIIlRtXVNOJPYx3nPrhjFBeZ5+qcg2qTbOBx4FUZYen5Dlby10iAoeYzbsjX3mmg47b6oudG0XXyUSMR2PUx831iFuH95R20CFCS2OOOkJ0vOwVbY4xKY9ZCC/O3UWhZM+TXkiCJSuhTjgANce8boEpnVST32dPDdCneqHMi+telgHro/0L3VTvtZfmdcn+A9tA9aCV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(38070700021)(10063799003)(11063799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?P/vGOYwxxYo6p7zR0UQpK9rnIkQ0ApUQTaFIkBTgecOtT41W654L9aGahX?=
 =?iso-8859-1?Q?TmJ3oXBZzM4PmD3zT211lOqTbnyRUBLt5n+oQr/XyXSd7Mkt8brZeZKf5v?=
 =?iso-8859-1?Q?vjubZ9485VaDkdmyLGGM+HYJ/2MWXH4BSj5RAQowJZ0qqPR9Xg2yM1lIQ/?=
 =?iso-8859-1?Q?ad4bWa9WVee3DedpjqOya9LUJrmGMiOxJmrf2Dozs8X3CnA0IVb899prq1?=
 =?iso-8859-1?Q?QwseRjt2BFXAPrNvcuE9F1eUfXFDjFlm2+OiFsIHSLsPGLbeb61UQglHXO?=
 =?iso-8859-1?Q?9Wd8Fvgm9bpqR7BvljOsK4E7g9lqW8u4Qg8ZrKqULMdn2kDAfshlXvolds?=
 =?iso-8859-1?Q?/iWyT67egM/I0VIEw5Sn99+f7/1v6w0TWjOPgyZjLRuLsKqrJWpMTvDN4y?=
 =?iso-8859-1?Q?onnBG6IKPsuV78LmZA/Mg2pREFg58BJ5zXO58kenZMySNA+zL18GbFIufe?=
 =?iso-8859-1?Q?BBrDPertDBu/qU1BcthPnLBA28+QzaNS51vICyF52QTTOuSAZqnC+4AqiY?=
 =?iso-8859-1?Q?RO8FCEyd5lAhGs+s6fhHZ7eZaAO2ojjhsQu/ddjWouc8U1gblSUnfUcNi/?=
 =?iso-8859-1?Q?nfDxYbaCvCz3vyVhNl3sS3aJ04vi6F7sqDbzW3YTG2PHiEC6lbwZpCs8Pn?=
 =?iso-8859-1?Q?IVNy2JgdvcdaU0l5lC8h/10sQdhFB+AW6zFM9EA+zHdbYArhm9sFTzShdD?=
 =?iso-8859-1?Q?/QHLOGxUtsE73VU/T7t+67tvGBF5TaCpZ3sG+ig67L5I090HlRC7Q90y/7?=
 =?iso-8859-1?Q?PmfuqmAaksLzp2shV54PhJOmWpBd2BgqRTNNpzQy+mgWAhyjBckL/a1k11?=
 =?iso-8859-1?Q?IzUFlQe/qWEUPAbTx3L3s299K47ih8ymKaAcq7aG28Wgn3TJQnaRx6Doyz?=
 =?iso-8859-1?Q?rwSyUzYevPF3bYkHsjTE92ntdQKQ1M0pW/yA5A++E+r2zgq+AfNR4Nd6O6?=
 =?iso-8859-1?Q?8+w+IZudkeN/i3mJtQ1mguZV/66/EOHIPw6R4wkN1DHlhswZDVLKUZdN17?=
 =?iso-8859-1?Q?Nf9g/4E9CQq8AlOR2RTGGzHPxld9LI2sEToae/bLHvpo3z2/5+mtnkkcee?=
 =?iso-8859-1?Q?jdhoZgMbUqgpngpGaFO1cVQJQzKWF9h6LoV8e12DFPf5pbyP8Tt30EOKyg?=
 =?iso-8859-1?Q?L44cQpwAstIZcpvSQgz1YxiMrRWTRK88HIiaOCmrpNYruqMO7Qpt37ydsh?=
 =?iso-8859-1?Q?K9rnoiAGYRbL7hhrjldI6GMV9lx3um1xdTX9ugF2mHiFVJ1j4I3nH2w4OT?=
 =?iso-8859-1?Q?xkPDdDzDisHW5o2fXP8yPmMEfY/AzY3i33ETwjrbgLMuW4pKjglyYit9nJ?=
 =?iso-8859-1?Q?d6UDvX01lcbbKP/XatnNrx2QNdXgKxQQrGIUwJE88vzP+d8dwt7u27oUUF?=
 =?iso-8859-1?Q?0lAXq48eR0kdKTjdLh0hHR0YS07/9Fz4zXLU1rp82eCtNEXHYzeoXYmYLg?=
 =?iso-8859-1?Q?g/ibVHCpIxAxD9mCBt72r49iFWQ0dsS7Hgvxe3BfWDY6MSctW5jLcFBw6C?=
 =?iso-8859-1?Q?K16DIK1pTsMVetRfyhMg0ca6cRMIJcutryr4qn0F7DQe2TkQA0Vhn+sf2V?=
 =?iso-8859-1?Q?gMjPfV13bIzmuEWZ+sD0dMLsu1e3J/ufMAYmmgcyYJr5f2EnaB+56UcTlR?=
 =?iso-8859-1?Q?d22AKLnQZ2iptd2uQLigBwQ6MK+ONt4fb2+OwCbvA67vTrLpv/qyorWWA3?=
 =?iso-8859-1?Q?Swj7EghyCRVBeE8ZiFHNjisoN8YhFu0vhySNevOL9N6cJ0GiTb5D0nsEyX?=
 =?iso-8859-1?Q?SZyxWq29FxktPYyy+1vXEoePAOcBw44j4OdUWr6AkPo2I8oM2bvxF3jpF1?=
 =?iso-8859-1?Q?2IZ2VgTIP4e2QXWlau6op3nrxgkHEoQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34844db3-f29f-4267-c1ba-08deb278c8a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:54:56.4896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDvD/2sxQ2a9hMIN7H3whw4EPhPCOQHd17BnlX88ZgCNYF8wRzjB+Rgccw1riB8fkoZ3Nu75gEHi64vwmK15rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6926
X-purgate-ID: tlsNG-4011c0/1778846098-7CA798B7-9CD0E7F2/0/0
X-purgate-type: clean
X-purgate-size: 3571
X-Rspamd-Queue-Id: 565CA54EDD7
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

For the purposes of certification, we want as little code as possible to
be unconditionally compiled in. Make CPU hotplug and SMT operations
configurable to ease the process. This will also help with introducing
CPU hotplug on Arm, where it needs to be configurable.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v7->v8:
* fix style
* s/CPU_HOTPLUG/CPU_ONLINE_OFFLINE/

v6->v7:
* new patch
---
 xen/arch/x86/platform_hypercall.c | 12 ++++++++++++
 xen/arch/x86/smp.c                |  3 +++
 xen/arch/x86/sysctl.c             | 12 ++++++++++++
 xen/common/Kconfig                |  8 ++++++++
 4 files changed, 35 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hype=
rcall.c
index 0431f875af..3f6789c8b7 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -735,6 +735,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         ret =3D xsm_resource_plug_core(XSM_HOOK);
         if ( ret )
             break;
@@ -761,6 +767,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         ret =3D xsm_resource_unplug_core(XSM_HOOK);
         if ( ret )
             break;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7936294f5f..9046c826f8 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -418,6 +418,7 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
 long cf_check cpu_up_helper(void *data)
 {
     unsigned int cpu =3D (unsigned long)data;
@@ -445,8 +446,10 @@ long cf_check cpu_down_helper(void *data)
 {
     int cpu =3D (unsigned long)data;
     int ret =3D cpu_down(cpu);
+
     /* Have one more go on EBUSY. */
     if ( ret =3D=3D -EBUSY )
         ret =3D cpu_down(cpu);
     return ret;
 }
+#endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 0fbbdd8b28..1d0857b502 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -53,6 +53,12 @@ static long cf_check smt_up_down_helper(void *data)
     unsigned int cpu, sibling_mask =3D boot_cpu_data.x86_num_siblings - 1;
     int ret =3D 0;
=20
+    if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EOPNOTSUPP;
+    }
+
     opt_smt =3D up;
=20
     for_each_present_cpu ( cpu )
@@ -121,6 +127,12 @@ long arch_do_sysctl(
         long (*fn)(void *data);
         void *hcpu;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0a20aa0a12..9fc53fde48 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -636,6 +636,14 @@ config SYSTEM_SUSPEND
=20
 	  If unsure, say N.
=20
+config CPU_ONLINE_OFFLINE
+	bool "CPU online/offline support"
+	depends on X86
+	default y
+	help
+	  Enable support for bringing CPUs online and offline at runtime. On
+	  X86 this is required for disabling SMT.
+
 menu "Supported hypercall interfaces"
 	visible if EXPERT
=20
--=20
2.51.2

