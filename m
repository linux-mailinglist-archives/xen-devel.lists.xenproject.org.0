Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPp6DPSh+GlExQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:41:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F84BDFE6
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299935.1574496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtXY-0004hN-A8; Mon, 04 May 2026 13:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299935.1574496; Mon, 04 May 2026 13:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtXY-0004fQ-7O; Mon, 04 May 2026 13:40:52 +0000
Received: by outflank-mailman (input) for mailman id 1299935;
 Mon, 04 May 2026 13:40:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wJtXW-0004f4-8Y
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:40:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJtXV-00GJlD-1v
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:40:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69f8a1e1-e002-0a2a0a5209dd-0a2a4507b602-0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:40:49 +0200
Received: from [52.101.70.94]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69f8a1e0-229c-0a2a45070019-3465465eaa83-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:40:48 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by PAWPR03MB9106.eurprd03.prod.outlook.com (2603:10a6:102:33e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:40:45 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:40:44 +0000
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
 b=KnpLMBPYLUMp8lFyGBUJVAcoDoDpxi1dJHF2LfZ71SoMZ2b4eI8p2vorjT+pcudW2pKFrE6hkuPOTsqVFF+XAT2yUiU4+JLOmmjfvbsrlrOe+nLfE01eTbLAAXafEdIO+64Yj4Vq81D0PUZkfig62er9HxcSyXNgmlU5bDWDxsUPk49TwF/hjuWZHpc3fquDCY4kshXfLGoqYXGgr6fg+RvS0aoY2JTJFg3BABLaMgaoWTG6IjtIa5OOWZ0t8hDKvd+h1M55Sg5qutV2QMAb+60aqw9M59vb34V8oOYiQFpsRnTTt/LIasDtuRBMM1qHiwjootDmVOZMdIShw4DEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbrAVut94sJ6tMqG9N+0US2Yjz7n+raoSKn/WWaiOuc=;
 b=cKFoIWwFGZZSYwEzroloyp/izkuLTGKXmoaaT8Yv3oNh5x7t5GB0ST5YhlNlZ7Tnj2A9hsLDfzX/EGmk3On9m+gWMAST+0m2hfLehlRdt69qRsMVSmh8hdgu+t1bArMbNwMstldBrYRKvKGmj/uUBb05qh6laL9oEWAEcJJZYqCVRcwil6+A9fJAmlXR46+zLIyPgKaEoSQZq0FR7bMOaRM0tuVCaKo4vA7lMRZ5D79h51RGDrewUp/BybqF+pHPWD9fmyW7nwVx/LhhWp1t9gbY5leyy0Mt4xKJCuoIvWtxJwM78FuoJlGU4CuSb7tx0W3d59WQxj3D+oqucSL/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbrAVut94sJ6tMqG9N+0US2Yjz7n+raoSKn/WWaiOuc=;
 b=XVUCLuJpvKhvU9ogZSpeVO4CTOHidFNJeyMN60lAJOKquNh0jiQRZzKHcK7GUvydPzl7vb+iqWql4sB53hTsxlZX+o1Z5OB43U0slWl7njpLXtoIz/LkM0+vc4Si4adCmrymSCTCLKBvOq1SH9vuAq+VzthH9qmB0Y/SqQKqDjFy6h9gwxe80Yt54KQ3KtTEFuCzaWkaGYubtCWzD+yYPmr/dlwPvyZ/QoprADCzV82nzUPxKCLUy/jEZ9HSd0OM6EywlE4no13S+CdI35C2X3GKVustnR3tA0SNsXKC6G9RW9sjl0mkCsBs7y+b8IiMWxoXJYC0IRC+IZsesQBOGQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3] xen/sched: rtds: assert replq is empty on timer (re-)init
Thread-Topic: [PATCH v3] xen/sched: rtds: assert replq is empty on timer
 (re-)init
Thread-Index: AQHc28ubWcgbGgaJskq0Bya4iIMSqw==
Date: Mon, 4 May 2026 13:40:44 +0000
Message-ID:
 <f751db3a02efa96d737235e58eb7bfb35e6218bb.1777901826.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|PAWPR03MB9106:EE_
x-ms-office365-filtering-correlation-id: d6fee17f-6e06-4712-058d-08dea9e2bdf9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 4yG6IpwEc7oYc5FjpTakcGWKkE4H6Ntw1pb9R0RxmGN/IqSG4tPtYqn4uI6oEkEt0YOucVKLL20lxvd6H/YAhPANeZbPxjzqlsXbdqK7SFUxB2bI65CoJqPDFZQkvWIZ7jMSQAA0xyb2pKCHk0tc4IN05Ud0uPhh5jopB+hke1Q4AYfLjQkNs8MTkzI1CiDJWB+xshH25NZsxBc6Mc/s/Q/U/qCMMQsjtqJvlNLGtPD9AiZo72TGwPR18NLv/lBE9Z0tTTvL0Rc3LtVdRizyzQYc93chmnfX0JSWLRqu39bOBCiFSiJ9AJUqjp1A46MZ8SaDOMO8o6CSzNKj42ccgSxqxPjVotFKZfR2i3qO4Y/Tz3kTneRgSLdUUBc8sikk0xus/sW/pNX/iwGzqat7PIYZd6xxmswuern27C0/PEqnpOr0GcY8MEjMr6Mb34SdxEMTKWkd/lGo+xD+OOGcNVeMCwDkmhCsA/OPwcMm3pFYLJvIXlHodt4KWS36kWadqEven7QWU0C1onGOZSQyWMFJgCPzS7uiV0G6j7q24lVmyTR/gjEighvNRqqDd6ILl0KmihuOFcf/SFuxHPJpVukxNE6IL/autp86tKk8nc0Tgd4FIp162eKgVD5ujchndDRO2nlLB7cSDnLOO9UiuuAan9IHEDLq2gufDdtAah9eeaQstKAJXwZGFn/q+jLcWaTTkArvaiSyxXBxGHduqxMWZz0sqR5mWS2Yb+WiDki8VnwRMyAJS9Uac1npODiN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/iuDqoJXOK1dK08SlFxhgL8KiPcUUXtSPC037zxOXeetsUfh5Okmc6owWB?=
 =?iso-8859-1?Q?Ma9Di20Vtc8qOY4kXv63h9Xt6Fu1jZZJDtvjMeP3WGRd8qKNhOWjShzofG?=
 =?iso-8859-1?Q?xLwPR2jViJME5t50xgAvHLwugYIq5F6AznAILz0Ua8dYxy9PKcvCyEwzYu?=
 =?iso-8859-1?Q?0SIOvtl60EQk5lSuIzRsN9sU1Hsb9romxCRz8a9ueZj2XopQZoiaUgX5wa?=
 =?iso-8859-1?Q?2sr6OvK4LiT26cxqaz6QpQuZ8FlB0pOnzgFqXdcG7zuUvZ3IZKTtktLfFQ?=
 =?iso-8859-1?Q?92elZ+dNFV0SUNAIn2x7xnCAzkbxM+sLt4Q73MWrwzc3r0rV0HtQgFlN+0?=
 =?iso-8859-1?Q?R0ea4UfbgzODdoqjYs1gK9a5vGZ9u2xZ5yHZ+j5lw9KM2lcYG/D0Oe3huu?=
 =?iso-8859-1?Q?hFT7BYiiuAZx2/3b5+8fx5SD+cT0UqOIdYZ9RbxAu/Ungn318VLPZSYFyz?=
 =?iso-8859-1?Q?jDvri22a0XYI9MoupKlbPv4kgGGfHIBKKwu0PTgemBa74eVnaF0YQqm7pa?=
 =?iso-8859-1?Q?gWA6XOzXaH5qrMMvU1HP9Z4pob2SHljZp/3C7oDaGRCEt+jHAszAg0swbw?=
 =?iso-8859-1?Q?5OfxR52xoXrAVs+l6x11brIirZqcMusN9v+GNfVj6FXbvI0broiliJP1rT?=
 =?iso-8859-1?Q?HZCENB8Awr1+vJa2GeElLdoE+iBLwYRODTSkWxUsZPf2Qs+3Br5/urzSs9?=
 =?iso-8859-1?Q?DS9WBH/43xuqPQocB31rWm2K+pvyn4KcyyPNEOnAcTSRqF00j0uHtEVa1C?=
 =?iso-8859-1?Q?1blyFmTLNTlLGN23/FiGsGEKPiqsT++mcTb9Boxz2lQar4vznpk0fmQtAE?=
 =?iso-8859-1?Q?Wyo82guDh85Wx86VknApox5VipUBcWAZJcorMNe0u5pPLmqNZYSVJYHFMh?=
 =?iso-8859-1?Q?Y/sXakoVHjLRZPCuOkbOQAE4fYhpzqTbTlclaEhWJGQONlKXZR5Ut+cwn2?=
 =?iso-8859-1?Q?C+eokKkbrBTbcL1WCHDrwHFuEnXe06sazixrinng2Enj7YCTgf3yHPLjPC?=
 =?iso-8859-1?Q?Jo/kw+D1Rcwvya+ecAL00TtnoSLCjkHNyRRwdQ9IeviGAQhv2qIHoP3vsf?=
 =?iso-8859-1?Q?nJcfbpizBBa9bmLVWPQTzgUScz8l9RqdkDpCtQXmTxmH/Y74FbwIgpg7vv?=
 =?iso-8859-1?Q?/cNFQ7218raJV6nmiTmk4LbtLm4/5Zbx+MTAWwzF1RDsCrLYDbGeote3FA?=
 =?iso-8859-1?Q?rAqHZdrJOkGOruzhCCKbMLoSdRY04LztpclWvo9E7RCjqvbM1uzZwq4vt6?=
 =?iso-8859-1?Q?oQXkHJaR46I1CGZislthi+eEj8blHJtmsyrI6zLTe68heIBJ9gZsS4BVZE?=
 =?iso-8859-1?Q?Tk00MOO+xMT5k+7xEduAkxmjXAxRBQc9B7xmEoV45DvyOnB9dRMMSf/EzR?=
 =?iso-8859-1?Q?Y2GD3zakG0lAsPQ1wqDH//0m3LBVl3QRPd80vOlCA8S1lNViKVrFCEqWIG?=
 =?iso-8859-1?Q?aM+dBjMXeJC9pq7pewzXE2jzeO4cJWsJeNJfprgFcx4WkJp6gy+XoTSiOD?=
 =?iso-8859-1?Q?S9VcFbwBPM2tYrXIoFJIG8lLPmoGx8V6J5AsG3s2bbIjdbtIfZq5owVxJF?=
 =?iso-8859-1?Q?X+2FyGMP3d+PtDLcupWg4ZoTgGQbhJVN3zZEHjEnmSkurPR8NUFD0QOVFt?=
 =?iso-8859-1?Q?Tu3PugJTpXucwdxFrjnBGFkw6Z5LKsFWheRu4aucDt7NM6ChJ7OFzPJTj+?=
 =?iso-8859-1?Q?n4O1G/SP+TW9iXUjXCuCD+P2V4XjxmLw8G2+nV/8lAS+ljlqoV6+3Nk7+4?=
 =?iso-8859-1?Q?ethnLbAXQN71TIePWJvwmjwDUHZT0rkb40gBD5SoWUlMlWg3KBWHOVlnRu?=
 =?iso-8859-1?Q?ZY1X5FYo0+wuyDn06ks85VpTgm7uLC0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fee17f-6e06-4712-058d-08dea9e2bdf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 13:40:44.7891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqUr9WanAyxOBty5aFohxkP/fJUt2rZMXD4FrTu5VrhUJd8CChRr7V8pVuhjuFI+7qjkwQ9/ZiwUd5JuhzgXJig4ehmH9qaVvL6blDNHYkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9106
X-purgate-ID: tlsNG-ef75cf/1777902048-ACD67C48-B9557FFE/0/0
X-purgate-type: clean
X-purgate-size: 2231
X-Rspamd-Queue-Id: 869F84BDFE6
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

In RTDS, removing the last eligible pCPU kills repl_timer. When a pCPU
is later re-added, rt_switch_sched() reinitializes the timer object.

cpupool_unassign_cpu_start() refuses to remove the last pCPU from a
populated cpupool: if any domain is still alive while the system is
active it returns -EBUSY, otherwise all domains are first moved to
cpupool0. Consequently, by the time the killed-timer branch runs, no
units remain in the pool and replq is guaranteed to be empty.

Document this invariant by asserting list_empty(replq) right after
init_timer(). This catches any future regression in cpupool semantics
that would leave pending replenishment events behind across a
TIMER_STATUS_killed -> init_timer() transition, where the timer would
otherwise stay disarmed until an unrelated event reprogrammed it.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v3:
- rework patch according to the comments. Since cpupools functionality
rejects last pCPU from removing so re-arm functionality doesn't make
sence. So patch was reworked to check that replq is empty after timer init.

Changes in v2:
- update commit description, remove unneeded paragraph

 xen/common/sched/rt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..4b643eda30 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -743,6 +743,14 @@ rt_switch_sched(struct scheduler *new_ops, unsigned in=
t cpu,
     {
         init_timer(&prv->repl_timer, repl_timer_handler, (void *)new_ops, =
cpu);
         dprintk(XENLOG_DEBUG, "RTDS: timer initialized on cpu %u\n", cpu);
+
+        /*
+         * cpupool_unassign_cpu_start() refuses to remove the last pCPU fr=
om
+         * a populated cpupool, so by the time this path runs (timer was
+         * killed because all RTDS pCPUs were removed) the pool must have
+         * been empty of domains, which implies replq is empty too.
+         */
+        ASSERT(list_empty(rt_replq(new_ops)));
     }
=20
     sched_idle_unit(cpu)->priv =3D vdata;
--=20
2.43.0

base-commit: 680da952ac1ddfc94f9d1cd4dfa1815badae5302
branch: amoi_rtds_rearmv3=

