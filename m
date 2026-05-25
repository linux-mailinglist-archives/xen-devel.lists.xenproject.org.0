Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNebLRs7FGqKLAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BEE5CA462
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319204.1586908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3V-0004C4-Bw; Mon, 25 May 2026 12:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319204.1586908; Mon, 25 May 2026 12:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3V-000478-8K; Mon, 25 May 2026 12:05:13 +0000
Received: by outflank-mailman (input) for mailman id 1319204;
 Mon, 25 May 2026 12:05:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wRU3T-00044F-Py
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:05:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRU3T-006YWw-5z
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 14:05:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143aee-5cb7-0a2a0a5109dd-0a2a45099b8c-24
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:11 +0200
Received: from [52.101.72.134]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143af6-2497-0a2a45090019-34654886b266-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:11 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM9PR03MB7026.eurprd03.prod.outlook.com (2603:10a6:20b:280::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 12:05:09 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 12:05:09 +0000
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
 b=AK6ztw1xZoN/GsyUQ0/UjhX21tqNJClwKAen+sQ1t5wwhKGR31r+X8I13vpvNtZ2ew1pN8Lb0ymG2KTF+QPLLC/fINz5Gpgr0LM5lqncp70pRMQNql6IHrRGHsSYk9EYs+8XGTJzXgCfnFRd2K8kiRSeDgvsWFsdrUlKkjZhGWcqiZRHWU3GIcusIacWxlaHodjYaI6Z3HAY47V+INMt8YMlqukWGr8UJhb8uVfFPk/VpUhCGpvQoZ9HqeKhjCs2xHawC9SvYQaI4ajnolkRiAlc5GGWoA9idrjwLYMmPcKfSdOuvY6fNLXWXXjdJz4PACLNncVIgzF/dNLsec81/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfHfQaxeNdr+CpHuEaonZEFBu7gjFFMWoYmdCiLZ2tI=;
 b=Z+Dku5TtxQdE0DO48enxSegVvhsL2+bOIpG5uJzQ4QIVeVRTgT2Wi39op58Ii2PpWUi+l5x2J81+jFQmCUO7OPxTbpj3mpjf5d0tSJieGCn3Yvpsu2XgUXsvAXrnSxDS2VNsDbMQXfyWhvRNWapcWvTs1GzTmwcGThBFUii0rrYPAY5aE6tkfmasabVCP/3+fXbKYN+gdyUQFuNahKHHjQiYZMRNEE5CLRlBhkv/h2y4CDnPGDJn2+kFLQX3kM62ElLChOHohQBrjqPFlKKsfLuMrsAjcCQCpiUPsk0R7rGTQEzlMtl/sJtVCK78KVaSLb+2ueAc51YCyCBcM+5w6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfHfQaxeNdr+CpHuEaonZEFBu7gjFFMWoYmdCiLZ2tI=;
 b=sgK1u2xWSJAoiBXRVF6bljCLGuDourpiEAxK8qSn92RfwzhB3aabdiFxN+Awm4zjvkTaxkapgeikVrvl+4B0iuMVwIluFQPM4vejgs/J2RioHkuNaYSm3NRf4/QdS0C4J0gr2lMM0y6ig0PfjDFZAN6zuhED/b6Q6dpncICgtK8DU9QJ9DqZXMeo7or5nkUDpnKUihjSZS4iDcGx44fg5fP9qUZCL3CsFOR9+XD1oJAnCFg8HXr4qFPR4gaDrnes9RTjxUCJwbL3YPz7MpyMMfxpNf86rt3ezBTqTE8lSS2qShvVdNAVckQAarqmiaBRq/zOGhZWS1GlVxipHn3VzQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH 1/3] misra: deviate MISRA C Rule 5.5 for 'hypfs_alloc_dyndata'
Thread-Topic: [PATCH 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata'
Thread-Index: AQHc7D673hceQskKjEuWuHstCHXB3g==
Date: Mon, 25 May 2026 12:05:09 +0000
Message-ID:
 <ea6996796564e18334e9951449748e5ac4a8a7f6.1779709902.git.dmytro_prokopchuk1@epam.com>
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
x-ms-office365-filtering-correlation-id: fefb799f-7b3e-40d7-8bdd-08deba55de04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|18002099003|11063799006|3023799007|56012099003|6133799003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 KP8+TKpy4/oT6l1VXwcThTC9Mb54M7kbajsxwRH4qk3cY/LZ+g7WMPvO/ggzaDR+fSYPXw1Vri088qX8b8EcGlpE7mlVVloA4XzNbcYUgrIBWp3T/o+HfQWd4a3ErSBtk8xzqM8g2e0KLb0srrYP0Hfy5s9ISC+L+2pj0O+vnyxJwVRyWKjpgbYOXrTR+o4d2c8D3Uv3hA+oG5tXDiJAQyn5WV8FWHIcaXvdTFRBu60kWijbMPpta8LTEf05KG5AGNOyzjASBlel1bmF261+fWYj5YbuXDijP91BXmJFPnPCQ8P9fEAANBseF9Ad4yoY8GQpvpg1baMFkRIGliAT7wMEHuBFYogLFpqrhQTU0ilyjHoDe9KzprhW7pVc09+xfdbVcxOno+g9dwEQaGqRjBIgDa/RZ6Q00zI8TbLy8M0bQHzcXmW9uP9ZfMNgh8F3mEZeyUwy5ls+9V5yDP2ZxCQJLfBiQvBYMS1UqpMnRogq+neRL8lIvaSYhBipiKv4DNXw48omFD+06QMG0XZBI3BQsdyFThxgzgF2AhkhztYjImYrIhemJeA4jlWp+c84InNRvzaP4/ION4dr7rKaCpBP5v7ZIMikpUG8ajvtl1sS1rxtTx8PgEoTNBiQZ+LCP6e6+0h5cBLIVmyaLUGb1BUi62CAs7/z+T2fmo2mBqS6L8sEoEhdmULlr8XGY7lawtgZUQJODu9DNYl3nBZwTe5C7Gq3kJuytwyIoINdeohyFe0OzwI3WbMr+YSYbRhf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(18002099003)(11063799006)(3023799007)(56012099003)(6133799003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?K76tgRMMJ3rLya3WKiPZEWbcMizPxOcytVaQX7+p0h3IT8rY+Ph+mQ9z1K?=
 =?iso-8859-1?Q?mIqrMffdqP0JFS1qoE+m4pvJE4FNCzN9RYGK8VkFs8HoAsR6o8jYncARLd?=
 =?iso-8859-1?Q?Jk82wU8GGHil8K4fdNlINCl8WAI0j5rWyKDPi8DakDbkYUdF31jMIH45ZP?=
 =?iso-8859-1?Q?ZP1oaNxY+dhGscvUZPQo6o5fcp/pfJV+AlSBR22t1O1rf7wYdMf3OaXwz1?=
 =?iso-8859-1?Q?8onLRi1RtPy7rifOcrlSERbwfca3ZkkVvyeGWrH2473ex9ELHAPec0KqWR?=
 =?iso-8859-1?Q?K8ixmyHlhSGzwVE7Zwrx5ZD06KRAvt/hL4OLL5whisyo3cfgxG7+vwZKkt?=
 =?iso-8859-1?Q?WoGnJZ4qTpWptVTUQ1LaE6s2JNIUcrDNPJ/uHlsBJe5wxm/jfF9FyQH+uS?=
 =?iso-8859-1?Q?I3R1569MnhwMGMLPYNctcOCjQYH+kMRBMMtDiCC1I836YoB9tGsRtYu35b?=
 =?iso-8859-1?Q?5/lC4Ls2G0a5FevbzhnHs0OK/Sjc7qPso2QrfDItx20UdXnVFwTnbVtthP?=
 =?iso-8859-1?Q?XcO28Y4vqNxEZuzFRjoVC0cRqDaO30SUTD7o+ypVv1qyRZVVThG8GVv0hP?=
 =?iso-8859-1?Q?BHnglpFS+Il2w7AJ/KOgfLlsVLXrfRGXC+XClCyWAx2Fc3yey4d4hHopEN?=
 =?iso-8859-1?Q?e/NeNNCxcwhS2xBuqgJcEstZ/cjVpnc7uobovhRtiL0NBXoYzV2g/rQNXF?=
 =?iso-8859-1?Q?Y9MB69z3ysYk5wd4lyFAC+JQp5u4l4ux0cLl/8PBUDHzmJHsQlsEoBewOY?=
 =?iso-8859-1?Q?bUW8izHyUXd/rhufcK68fwpWO5yHadXPQH9/OWQh3RQU63qey3D0HA7/Ib?=
 =?iso-8859-1?Q?uCMTqvKRQ/saGD8YLoozmhZXwfdbHhkGyR26eTgphFIg7SFlCVIlAXmCg8?=
 =?iso-8859-1?Q?fAvc3WHk/St/SlqEjm0rSDSOPXmNew4N5mQdobj1xsjTPUQWGKsaXp7ff9?=
 =?iso-8859-1?Q?NYMmn+JlnfyFB5VgC6GcPi0xhR1perQ9mcZFuAtOENXwRxnbsxU01K8ELk?=
 =?iso-8859-1?Q?xwhAgtKxZhzz7ItEtuRoyVp3HDyOYgerbQW9ls1iuI3QYj8PVqxytBZGGo?=
 =?iso-8859-1?Q?295m8IdT14WbOEkuPeFzh82ubZCDADUc1kc5FRk0d/D3D/wJTchwkXne7F?=
 =?iso-8859-1?Q?iU0wL6R9qpXl/qDmrUJcsF/JtIko4JVDgi1g/eCznP033aeWv6SoTg2T8C?=
 =?iso-8859-1?Q?Xd3yIoo1cBchskCuSB54fzBgqIPufm6J9Apd4FoJuQf3XTwio4kSFXB8TF?=
 =?iso-8859-1?Q?rpt1sEoJhPeEbzm1g/NPH7w4P0c1a9HpkG0k/H9N3DSI01huTwOWAvnEbt?=
 =?iso-8859-1?Q?0Iw3msn/AWHG36y2SA4e83LOZdkLeCvSDn5uoQaKk+UzpiO7Bd5/VQjHww?=
 =?iso-8859-1?Q?G5Iz48rgQ171BLMrarh0tkMcyoHhZHhSC7E4wVdVjPIZBoyXecREOEiUqd?=
 =?iso-8859-1?Q?NDSpSicdgBjdR9xk1kQ80qcvGDuuWyB9YqeTP4ryfo2B62/vdpYXGSRasb?=
 =?iso-8859-1?Q?yVX8r5Kt2aMNI4MKl2ydoyQW5x/gzX9a4d1MOYCBjpy3QvqLbWNqbold0x?=
 =?iso-8859-1?Q?ZxIazreGCnp+JdFzDOczbVOZwzi4W4ZE4Q4OUr4uxLqIkxfhp/pjMh1ucR?=
 =?iso-8859-1?Q?1bwq8CpBsWA/VUWqX6eFzxNRhW62jhGUBgkVd1KtilKrpxpO7KnFqsNCwb?=
 =?iso-8859-1?Q?14Tmq4UWYKLGGWCIc1tIL318tM/pbMl37cmqbAhW96yPieQexArPTXoTVv?=
 =?iso-8859-1?Q?8VpKX8z1ekL79gfA38ezVUBK6I4Z7zyvpdvlU5s8E3nHNbBMz+LA6RqT67?=
 =?iso-8859-1?Q?Z3QV4GgmyS17yIVyGI6e+6wKCnLqvVo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefb799f-7b3e-40d7-8bdd-08deba55de04
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 12:05:09.2436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9mymJdIHltz1JqQPsI6/DSCGGlPftjP8sJvuRkc8T/VeQiwfKXzrAgtFnsQyvD5egsXLmzVayflpv4dDc/SOSd2nti+8bLjqMkFWI6fb210=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7026
X-purgate-ID: tlsNG-bad1c0/1779710711-88F71A53-9A0FA40D/0/0
X-purgate-type: clean
X-purgate-size: 3746
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:email,epam.com:mid,epam.com:dkim];
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
X-Rspamd-Queue-Id: 39BEE5CA462
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate intentional identifier and
macro name clashes by specifying the macros that should be ignored.
This includes 'hypfs_alloc_dyndata', where the real function takes
an allocation size and the same-named macro is a typed convenience
wrapper that expands calls using sizeof(type).

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 9 +++++++++
 docs/misra/rules.rst                             | 4 ++++
 3 files changed, 19 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7d4b6f2948..13a34b7703 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -132,6 +132,12 @@ These macros address differences in argument count dur=
ing compile-time, effectiv
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(update_gnttab_par||parse_gntt=
ab_limit)&&loc(file(^xen/common/grant_table\\.c$))"
 -doc_end
=20
+-doc_begin=3D"Clash between 'hypfs_alloc_dyndata' function and macro name =
in 'xen/include/xen/hypfs.h' is deliberate.
+The function is the allocator taking a size in bytes, while the macro is a=
 typed convenience wrapper used by dynamic
+hypfs nodes to allocate per-request traversal data with the correct size a=
nd return type."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(hypfs_alloc_dyndata)&&loc(fil=
e(^xen/include/xen/hypfs\\.h$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b048309596..f5b4ce9315 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -176,6 +176,15 @@ Deviations related to MISRA C:2012 Rules:
        unused 2nd and 3rd parameters to avoid warnings or errors related t=
o them.
      - ECLAIR has been configured to ignore these macros.
=20
+   * - R5.5
+     - Clash between the 'hypfs_alloc_dyndata' function and macro name is
+       intentional. The function is the allocator taking a size in bytes, =
while
+       the macro is a typed convenience wrapper used by dynamic hypfs node=
s to
+       allocate per-request traversal data with the correct size and retur=
n type.
+       The implementation explicitly undefines the macro before defining t=
he real
+       function, so the name clash is controlled.
+     - ECLAIR has been configured to ignore this macro.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b3e929307d..c0237725a9 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -222,6 +222,10 @@ maintainers if you want to suggest a change.
        Clashes between grant table functions and macro names are allowed
        because they are used for discarding unused parameters.
=20
+       Clash between hypfs_alloc_dyndata function and macro names is allow=
ed
+       because the macro is a typed convenience wrapper around the size-ba=
sed
+       allocation function.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

