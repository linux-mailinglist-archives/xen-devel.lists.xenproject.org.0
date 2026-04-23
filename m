Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIrDJcxE6mkhxgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16C454B78
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292402.1570895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweb-0000n1-AL; Thu, 23 Apr 2026 16:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292402.1570895; Thu, 23 Apr 2026 16:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweb-0000jb-5I; Thu, 23 Apr 2026 16:11:49 +0000
Received: by outflank-mailman (input) for mailman id 1292402;
 Thu, 23 Apr 2026 16:11:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFweY-0000DF-Tl
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:11:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFweY-004X3T-AI
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:11:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44be-5cb7-0a2a0a5109dd-0a2a450bafd8-16
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:46 +0200
Received: from [40.107.159.119]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44bf-212f-0a2a450b0019-286b9f772e5a-6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:46 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by PA4PR03MB6752.eurprd03.prod.outlook.com (2603:10a6:102:ea::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 16:11:42 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 16:11:42 +0000
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
 b=UdJH5IOkNN37mK9LVnF/Myt14grTjU33TzCdSWJ+4B+fnJkzfTCkIRT+MO9bld1hLVRxSMZ9dAFC/7rgJdEuGZjm0/M8G8dQssJRAZ2McFL2zSM9Alr3LQtVhTaZP+6+7NrLWiWjVms7QzVQUkgGozs3qZR+1vQNypXldWYGGLItm+KbKqqY8yWXDdSy05cHXpRXQrvYy6Esq37e6FmK+on01UMlIPznH51I8Fp/ecsaBbqsprRdOKhNDPgQCUyTcir3t0QCcCmkK0rsvCZaGZiCfXTVEpHEzdQHKInrZ9eYxA5SihdyXSOQjdZzPTilKucAWOBAL2PFbOlni97GXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGOYorYk5IqETMMU68/1IVtJZAZHO3i8w9NcL6A6PSw=;
 b=wmEX23jMSaMfzqFIlIHK2fkmYTUO7Ol61qsi8uLw9n4/3OtNPbOOQWiYC0xYuCZOXIT13uPqfpupS+6QCoUYkMUmkqNyEp5e6l8jaMayES3YQs5WmX7NPrxrg0f88tUzjsq5HRoeYP4JiQmjkxgllmN/NJfrGjpHZYez9GAPKq2pA1gUKIQx6Cqh2ZgifniygzJogm6FCAYWzFdmofu4JGu2J7h4JhYlPrcYKWyVypy4MjGLHMdmplVo8HBuw3S2KO5MQ6TX3wDV5eIqZQlHK4QMYK2iKUJ/GDq/CfRoCfRBSFNuFu8Mi8gTTRHeiSxXr5dZ4dawQz4uWRRzD42BKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGOYorYk5IqETMMU68/1IVtJZAZHO3i8w9NcL6A6PSw=;
 b=HzSRWcStkC+977OP+ovidXBXVczUZZCw016bvMl5gf7y7C8XyUFJCU3GNqtN+zLK9X98uQpKIRr8GL6j4RVySl0xNuPwl4jGgumCoTXIzGz7U5ZEpvaadlcFnasMI7P1sDwsyjY7ewG+tAshweXpDI4H6/JJgrUXJ1SnT56hPUOOV0GdlIo2rg9UUdxl4UQOhVYh1sW66lr/2zHOBx7DsgAKSr1QM4iV6bAJEQBsz1S+ssUAdec0DoQ/7+Tu/48mjll+RD+JsrlPnyXQSyU4u3YGQGhoAytfsJb9AXCp/4HPnT/YsCZJ1UzGB1/LncqTdWH1OfH8yZSzxug0oPNfyg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v4 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
Thread-Topic: [PATCH v4 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
Thread-Index: AQHc0zvfSaMcr5qlbkezhiXMQevBTg==
Date: Thu, 23 Apr 2026 16:11:42 +0000
Message-ID:
 <68ce483d6e42a4f7504fb73e5d20fe922f0c22b6.1776960679.git.oleksii_moisieiev@epam.com>
References: <cover.1776960679.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1776960679.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|PA4PR03MB6752:EE_
x-ms-office365-filtering-correlation-id: f122a687-49d6-4e8c-e04a-08dea1530244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 Bxq4z49SIkExxfKqeJgX5tZaIsu1GIvEsVQB4d5AYabHB5mnreEfXUoubjIkiQrLim9/YXr5FS3+4tR3lkH8r8xfG8OMIUf96C3UL9rlUTxaV0+5gOhhUSVHXMA8wLK4O36+1/zzKMRpItj4wh+2vpSfSNGiHged/FdrtVv0UfY+pmQ903RngerhlCKARtCex/Mw3hLS+0CkbmVL71PLFQE49jnysH+bJjeX7fGlLl+iiLiLLh8xDvLejOxvJhfyxk8iV7quu1umtjw8v4sQaOqcvGNV0SoK3H7Bl30aA1vQP5e2VXA4yRAipqMAYk1kzSaStN5hSKCuoDeo8/I17SSbn4Unq59Jxs8NUROJN6MY8N2U8r6j5fkSpKHuJimhWPnww5+UwzrFvpOwqI0H1589QZVHGohzUJyPzfJFoUflB+C+mTJwdT0osacZOEIT88jd8jm3MWwLAjjgxSeDYYl8F1il+7mCU08K+tSkzQkt+sjrNmsCgGPFXMGoi5Y7jAhQZwrffpGocLVVMULHJlM0D/4eyvRLrkm//biE5fO7v5eYDSpHNuFFdxFcTw3gXcR65R4YB2ByIttHODbl9t8EigYB2gDo5YJycWRX9z7/W0Y1zq4EuP3CVxMhzRjq6I+ccRus11DViOxSKKfkSTvugl2rjYiK0OEYlovMwWGoOEcDkFZZsOcqH3GoDyZ5hL3ocy/3bF6LIYoA+rh7fztImmqSgorX2f8xTczyZvU9iko5HizbFvr+D5t7U6WTYv7T2TRsHpxh36GgqiLzGoeqkCtKq3ck9hJCUAnTOoI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eBftifm1g+RRvki5Af32STODtX3e4nCY5WpJZpVLMbWIB/eUBh4veAZHvu?=
 =?iso-8859-1?Q?aRqplzoxmJrHNU7x/AZwcwaP7Z3ogpPdZ3yp4qlioQ6mnT/ammauxKPuEo?=
 =?iso-8859-1?Q?jsYM7S0FYhhUH9y62HesdAn6kgeUd+da2KVTTumlquoEiShijwT+VNnBzT?=
 =?iso-8859-1?Q?voVZJtHZEu6bGatMdpoPyvviXy0UgGbX2s5LlMCwud3T2QfUi+wbWNIzoo?=
 =?iso-8859-1?Q?H4rNh89i2Z8dk9rQrfDHjfuqHAWAhia7iu9b21fpSficBPtp768dj+IBSm?=
 =?iso-8859-1?Q?/p7+5f0YYHiV0UqLU0CiDvCrb6MLyhZ31Xi6Gye1wbD1qHKLZSfDSJgMFm?=
 =?iso-8859-1?Q?blQm4n70JY3eshYOhm3HT5VarrwBjPceT+zLwVl2KOsXkAQzpRIYpOboUp?=
 =?iso-8859-1?Q?v2L+wvqi0pJCQXvxYzFu45H2D3n+xHp33PhshoA0Z/MdkXQYPFxxMyVDn3?=
 =?iso-8859-1?Q?gf6CH1nNPUO20iVJ//I3TCuzFrfToavq9lWLgs6KbB/SsLIJqVFdT34hHV?=
 =?iso-8859-1?Q?36nuQfnJzQdi4N4gxgkhtW2OIdhwCZ57YgAo7BqiUfsVsJDPD0Wu1ocfG9?=
 =?iso-8859-1?Q?yRMykH041HD6/MUyvYvzguN3Q8g3b5+giJW+EZ8eOXWNdACpnrbyaysic/?=
 =?iso-8859-1?Q?/eXyIw+EpQPvy2LSw+sX18zhIq6WmLLaHp9VGk+vyIweZwdKPSW2C+ejEA?=
 =?iso-8859-1?Q?WUWiZcEgDuwnIrH1MgTyNJXc8Ab0zI2DVdz5sxBpnyUkiXYdpfXZRm51v4?=
 =?iso-8859-1?Q?NISmgTuuOsWfbu2Pz2Vkdu1H1uO/xVqhJVxVbP+fqFAJ2S+XLnF6qTQpEU?=
 =?iso-8859-1?Q?ML/nKpMaTfjN9q5Y3WvcXSawVyBWFbusRnYGKUzHn7bU7v1QsUS3rF7LPG?=
 =?iso-8859-1?Q?PrDzDfKvlIhTBAdJ+dz8tEMGSgaSkEphIJPcZFdNP5CA3lMWoTTEoZYHMv?=
 =?iso-8859-1?Q?szjwt7jnuW/kZnLSLZmpCsTQu+HbV7msILa/iiQO9akIMVcbnr5/jqftL5?=
 =?iso-8859-1?Q?E0GTkOs9V6UcfyUFLUclqHSJMwK5iu4enmxP1GVSfgVQfsO8X/x1x1aZXq?=
 =?iso-8859-1?Q?KomhyxUSaJHsE9jhnfgx040HTj68heaarbwXniEVD0d4/MTU/qq7gzngoq?=
 =?iso-8859-1?Q?J0Z2Jq0OxdqIM1TXjT1vviXUhUwryBL6t79VTmCGlugsPMeqHMv8+CklzG?=
 =?iso-8859-1?Q?0qcYX0+j6fakwfycWzyiLAV86/ZnGJnI8TX2N5JliGRqPneA3IjJtC3HOw?=
 =?iso-8859-1?Q?egpHMhIZ2tFBWsgsztBsFj8dZdSh8Ioqld6QShWnjZIcQVA6yzlcMipBSN?=
 =?iso-8859-1?Q?R1QusXYcDWa83P5FsWVfHgfKMydUtRVP5RmuJ6nhgHTQQC2baRTOYhgUVG?=
 =?iso-8859-1?Q?GhWblnyVrOsOex6csPdYEVM9/49CeP3Q9+lnYdL7iyOVmN5XSfp6KiFUgh?=
 =?iso-8859-1?Q?1onRQH1ltc6lbpvHf5/xVeqaFVavh8YKh5tikPrcpUeZRdzhBgK6DYVWcN?=
 =?iso-8859-1?Q?AXIT9ZKeiuSCS7EHFvi84harnBZE8Ian6sAVSNqc59sLqxy6XScm9meavH?=
 =?iso-8859-1?Q?D59W/AJl9AWP3KZRcDilxPuOcYFG/rSyrjl8ygg0JXb+CCSgRIS/QLEo6c?=
 =?iso-8859-1?Q?mnWhPG6lLelEPXdAl2LbRw6EFZfb8/p/6NURj+lD81dknuAw6k/wUeJqVw?=
 =?iso-8859-1?Q?U5PSMpVs2ke9qC01LW+CPlJAV4tFpt3wtjWX/gZoN2VdqgUzKLdOxYvV59?=
 =?iso-8859-1?Q?ISHWQusiNCoUx44Cf6OUsAKCH+Y3aRycrNd+5MdsY+S+Z2iedxn/mp6DwS?=
 =?iso-8859-1?Q?toS2mYD98ERG8CDV1l99vXFqiFSV2Rs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f122a687-49d6-4e8c-e04a-08dea1530244
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 16:11:42.4981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyP9VIEDA3wOFNpX11xewcI+jGgGx690b65XjIbY6HjOMJ7Oo6BVnzl/toOc8vXvO6rPKPB5radTyAlKCv4JxaaWSCICMZE+dUsZ2PM0yhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6752
X-purgate-ID: tlsNG-42698a/1776960706-07979F3B-924B5D52/0/0
X-purgate-type: clean
X-purgate-size: 1917
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid,amd.com:email];
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
X-Rspamd-Queue-Id: 1A16C454B78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In exynos4210_uart_init_postirq(), when setup_irq() returns an error
the failure was only logged via dprintk() and execution continued,
unconditionally clearing UINTM and setting UMCON_INT_EN. This enabled
receive and transmit interrupt lines with no handler registered. On
platforms where the GIC receives these asserted lines, the result is
either repeated spurious-interrupt warnings or an unhandled interrupt
fault.

Add an early return in the setup_irq() error branch so that the
interrupt-enable writes to UINTM and UMCON are skipped when IRQ
registration fails.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes in v4:
- update comment on setup_irq
- change %d to %u since irq is unsigned in exynos
- add r-b

Changes in v3:
- skip clearing pending interrupts if setup_irq was failed because
according to the 13.4.1.13 of the RM: it must be cleared after
cleaning interrupt pending in INTC.

 xen/drivers/char/exynos4210-uart.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos42=
10-uart.c
index 58901df554..7addc11c2c 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -199,8 +199,12 @@ static void __init exynos4210_uart_init_postirq(struct=
 serial_port *port)
     uart->irqaction.dev_id  =3D port;
=20
     if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-        dprintk(XENLOG_ERR, "Failed to allocated exynos4210_uart IRQ %d\n"=
,
+    {
+        dprintk(XENLOG_ERR, "Failed to allocated exynos4210_uart IRQ %u\n"=
,
                 uart->irq);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
+    }
=20
     /* Unmask interrupts */
     exynos4210_write(uart, UINTM, ~UINTM_ALLI);
--=20
2.43.0

