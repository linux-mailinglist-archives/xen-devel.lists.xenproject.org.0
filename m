Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMTbD54JB2r5qwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA77054EDC8
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309888.1580896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr88-0004uC-CG; Fri, 15 May 2026 11:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309888.1580896; Fri, 15 May 2026 11:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr88-0004sS-9X; Fri, 15 May 2026 11:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1309888;
 Fri, 15 May 2026 11:54:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wNr86-0004s3-Jh
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:54:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr85-00Abbl-U8
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:54:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070990-e002-0a2a0a5209dd-0a2a450aa776-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:57 +0200
Received: from [52.101.70.125]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070991-56b3-0a2a450a0019-3465467d29db-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:57 +0200
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
 b=BEV5OC3s54nPGhUzhhezYa6Z8jBiU3xelSsZnNA5sAPnJQwOvOQaxddmouzUPb6WwfG0ZufaNdaeV0pWRiLjlvHTB/Ldobn+9tlodKwmRgA8RaqMIHbnRUScbYR6Th+HWIZwNn5czVXEhMeb3QR1IDJFoQMMfdyJ1qhynDSfWyN/qAWu+Tje+uFhSKagr2C+0Iw+gAabbWe3feLyfR0HgagRVGQs/C90L/JKFvJ54cPYHk9fHq2Q/Nr7icAIynhhKYyU9dRtcIGjeGM4WF8pq+JHwH5ejsr2eNroGp+enuX2BowrGzOTuK5YKd37JwQRC7ByLykJpd51x2C9g5eH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+4GXzKxaY7FcvQDn4UJG5CmBdGP9bNUkDoT5dWPxZ4=;
 b=XpuF/q62a08vYl3bQhhRdb7MN53IrkKjBGcc2Um+6JbofGdDGN4jMVoClpD2dyo/PxkWo02R7QWUoMxqvCHaTb/vxt00LgnoYZYPTi49vqeEu1yHez+EYjHgEQMD3nfAUnMguf4TN1tqW1lkSI+dey6JEmM6YMbHqoBiPZfPMMY1+BPBTlTc1Db03iVBY9X/QyQvDwwD4NwI9ovMYkG4/IGCoykyi8k0voMFTqgMHEMWVm0/EHJNTHCjFxppDGQEbrQYuIv1KHA59VRw0sh54elXKnwMdx1Y0HPFNO+tWOVOHMgYa56iNWTo1YhGjRXyUahn3htoXoeyNKFHdfGG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+4GXzKxaY7FcvQDn4UJG5CmBdGP9bNUkDoT5dWPxZ4=;
 b=Mji9Iy66hgE4Nd6loRkRgX7h+zTAy0l+W9S3Bi71aDorjkF+C1nY2yeznUptQZJdobSDQrFijXH0Hp6eu2PypOjFZrOrsGcZK6oln5UDIKvKth8fYyPle9QwVyivUq/hs/XgwVKmaucN9dOXCiGu2MNiG4RQpK4R19lgVhfpeSRIzLzQTXr9hag2BWAdG1QGxlqsJNTsgXiAnSu1aqzTmEf/blZvBrH+HwQNFUXeU+6deW5yNc+weYCtQujBReiSrBPpjP87gr3Bnec1Zf82aRUXe6Sm1ZfLYxBWVyxy9DO5i51eeEik68ycLT+Svdb79BxbKzNCtrucP1lAE063JQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v8 0/6] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v8 0/6] Implement CPU hotplug on Arm
Thread-Index: AQHc5GGluek78z52uke1rQL/XPKHHQ==
Date: Fri, 15 May 2026 11:54:55 +0000
Message-ID: <cover.1778845596.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6926:EE_
x-ms-office365-filtering-correlation-id: 70baa64c-cfd1-4f20-56ea-08deb278c804
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|18002099003|56012099003|38070700021|11063799003;
x-microsoft-antispam-message-info:
 3Q3LFgrkfSxJExhsfL4MZIuChq6zL623jHfN4lBlJJsxHEie64zX5egVrO+D4Ya8EbkOMwBd40Zmlm5xtrjW6HMFneDnML/bhbuDt+0tVaqX4sV5jw3vkzRnTJTh7JyJLYBX4QJZwIIZdE0L8FdgRjRbYxmSIYKUIpO3pTeKkfvpsANxr3s1YIG5Z7nBYOCDsE/08a8QqAXwWZAeIj8QlIeP4XL32H1yfgdi6fbrqN1Zcco82xs85dUUo/MUMEbzUpwkgK6xvv6SkRLd2+48p8afN/4XLWku3S2RUUeSL+FtXo5YtOzKXkS6jh4CbhsXYLhekKIPRU68D8jRhI0mmOyjSD3EKrbyijZ1UkhGJqQdE6XhLN1yN6ZQbps8TE1Yn5xEy9x1jsyXsSLbvltnwXeIgo4pPFPVcu7wRUlNRtwPTp+NNrJ2K9sN4DvAK2bZu3XsLMV31bNfTEIvWGNEMaO9Dt9nypQKwxOr/rQ+vBdJzNcEGSH0k9OmrVeQ1Ffdem2fZeeX7lFrS6dZWuRCKFD9Lm6aW68D9f6fY1WHmF1E9cfEkFk18LwVaIcV4F4hErOPwnxXLkU9TFzytQWms6uXQq7Fhbz5igYoHnxygnLRSQgn5NiXJCKYPOYj/1b2Le9uOVyOXYaEStkwAMto8rY/Da3uEed4P5nxHY1xYeqvfy2Ix1RwN0fSTyGTm+YUerqYeZOw6eBUYub5LTPJKcVnCwIbaVo+2fJnmS1CrDwNrK+Uu56oaUq1QIA176/0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(18002099003)(56012099003)(38070700021)(11063799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DPWj357pjKaHG/qzAN1Jq5nNuyIercKOAPgjyqxOhufxhesijyY9Sieu6e?=
 =?iso-8859-1?Q?v2ubqPNXwPD2vd42lAe5f1UdrYLMlqzuveGwB+Fcw20OV6jSTj6qTQBfEv?=
 =?iso-8859-1?Q?Rn4Z2qhPghiqdNY0/Q8CsWimqZhG+Yhx0XwyfuZj23XWBNnHS1/T+ROTYL?=
 =?iso-8859-1?Q?4atVyVxpA3Md564spwaUG/jpLOHIrodhAGf2fJx8dmadAkP6cF1ioZp7nz?=
 =?iso-8859-1?Q?9lmFIfJ8DdleeoMCv5ioHuTJbqTfBeO0n5BtsGKJf4zic1CkeOg7U81skD?=
 =?iso-8859-1?Q?hxi7AcQ60bwQB31dIWAFeXIIF0R6+6ngPC7zzMi9EvhJugTUp8+Ehz5shw?=
 =?iso-8859-1?Q?ACFmtCFddEGN0/bo/XfqxMTKGKjnopFINzCvZlXZa1eEysKgAl0XzM4XNM?=
 =?iso-8859-1?Q?sHLG3UEEQYbHNCnRe/IeRNYeG9VsHzc0IL51DKTTEmz44HJTLZ1994CctG?=
 =?iso-8859-1?Q?CL80IxW2TG3as0SGynrLfVHhxfqFdvQIG0Uq+gFdTao+FsQr6nXck99hrL?=
 =?iso-8859-1?Q?7tzbwJ84pk1U4fDo40CXjxt9/fgvrHHOQuYj29XVGkCj5D4bEkdsOH3ecF?=
 =?iso-8859-1?Q?YJBx0zfcJUOdW9GKM6AxWjrZDou4Izyt+9z6YAVRvRs/MQM96n/A7xGF8l?=
 =?iso-8859-1?Q?S7wdK4/WIABYH8tj7hMbmlFyqSfdaScoRxiHT6E2k4EPsQvd2y46I5iaqE?=
 =?iso-8859-1?Q?rKjIGyjzXEZbPBmx6Ndiyqyv/EzQlWsJK0cMIaWQI+zrr1oEe4VxASWjOm?=
 =?iso-8859-1?Q?Joc7NOAzGs2XyS8L+XKgs7j2MeXpDHeTLVDH9CT3dbtzV0HPp8b+gk1eRv?=
 =?iso-8859-1?Q?bKjlkUzWMq6TY7FxvZZNQoe+8ffxqgtcEt/tRu0y1EDDbEbbHPcHw43XYW?=
 =?iso-8859-1?Q?Sv5XZX1nrIiPbVuQJ9hSA/ZiQdFAx5VwYdO/nPZxOHnoF0ylILyAF2JOvm?=
 =?iso-8859-1?Q?stz+XBnXeCMeHen8N1lmM+qnUn1w6Vv6yGcISEhJ+tvWw0H5aKa5usafW8?=
 =?iso-8859-1?Q?bM0zRHa5GNk9Rv1/l/T+XN19S9pPQe2kxwCZRVQG9+tYBiNtyDHlv6Mr00?=
 =?iso-8859-1?Q?iISg8hwW9zNprfv2WcTyTtqx1ZoRuHV3aoH8ZN/iQNscbT079GWhkjtBlI?=
 =?iso-8859-1?Q?6mYOHoyL03YHAFr8cwdu3bUElgg6y+/1LkEwdOJCAfaLWcIVzX8nZJiKb8?=
 =?iso-8859-1?Q?JJAZhaaH6m7L0x5Ckx2qmPiS2fiWWUZ52QvB0o3azATIr13aXwz307B7Im?=
 =?iso-8859-1?Q?DrxAqTf9oKsyq8LSL6MzCfyfvRZShNhEuVy2MuLhUHa8NDJZzkwRksjow9?=
 =?iso-8859-1?Q?aQSt5E0hNkJr3zF8Cx3Qw8BmLFR3TvOvnWGqm9PN1n1V+0uDXBMeHyikHn?=
 =?iso-8859-1?Q?Ca0aujBb87WWevazx7ZngWgo0iS8If8r3SISvIVgg0Ijt/+vcmCfJrYwDp?=
 =?iso-8859-1?Q?ZOHGS2D2MX+5WhiEVAWioE442IfyfdxrTWsNSBW/uV5qxGVud+t4Faim0y?=
 =?iso-8859-1?Q?aX/eJ52j6uR22TouxTiDsVjycoIPtqNZI9VIeAOsKnl/ixwOSHk+XicV1U?=
 =?iso-8859-1?Q?wXOqmZ5Vla/gqQdNKSmx37ndduHzPpqTLKbHYmIzwKKKUFNgTg2pG08jWC?=
 =?iso-8859-1?Q?nGFhxu4OhraTY/SPdZX7qapgptDCS8gc6tcQqB0PDWegX2H8KzUugMjaT+?=
 =?iso-8859-1?Q?maFajH8qHXxPBY/bnBNLe7I+svmRv6FkviOkMh7/S4Ob+qnPV9bcw811e/?=
 =?iso-8859-1?Q?bJYUOo68H5PV1UOBfeQvDeLP4gxc2JjAd6OK1QZS5435fZoIwLb/Xqth+3?=
 =?iso-8859-1?Q?fkfIyPStNuhSxNXi1i3jF3nExxTpZaY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70baa64c-cfd1-4f20-56ea-08deb278c804
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:54:55.4295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RbomSVczeP+7bPb4H/dr0K+3jXAsJ4nDeH3xXaVOSzBjz/KHsP0sZH8Ane6LAWwfYP9Kl+kQoFf3GjaCMnverQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6926
X-purgate-ID: tlsNG-4011c0/1778846097-725748B7-3F2BA681/0/0
X-purgate-type: clean
X-purgate-size: 2385
X-Rspamd-Queue-Id: EA77054EDC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,suse.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented on Arm64.
2. Enabled building of xen-hptool.
3. Migration of irqs from dying CPUs implemented.

Tested on QEMU and R-Car Gen5 HW.

v7->v8:
* see individual patches

v6->v7:
* new patch "Kconfig: Make cpu hotplug configurable

v5->v6:
* see individual patches

v4->v5:
* drop merged patches
* combine "smp: Move cpu_up/down helpers to common code" with=20
  "arm/sysctl: Implement cpu hotplug ops"
* see individual patches

v3->v4:
* add irq migration patches
* see individual patches

v2->v3:
* add docs

v1->v2:
* see individual patches

Mykyta Poturai (6):
  arm/irq: Keep track of irq affinities
  arm/irq: Migrate IRQs during CPU up/down operations
  Kconfig: Make cpu hotplug configurable
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE
  docs: Document CPU hotplug

 docs/misc/cpu-hotplug.txt         |  97 ++++++++++
 tools/misc/Makefile               |   8 +-
 tools/misc/xen-hptool-x86.c       | 277 ++++++++++++++++++++++++++++
 tools/misc/xen-hptool.c           | 293 ++----------------------------
 tools/misc/xen-hptool.h           |  14 ++
 xen/arch/arm/gic-vgic.c           |   2 +
 xen/arch/arm/include/asm/irq.h    |   6 +
 xen/arch/arm/irq.c                |  69 ++++++-
 xen/arch/arm/smp.c                |   9 +
 xen/arch/arm/smpboot.c            |   7 +
 xen/arch/arm/vgic.c               |  14 +-
 xen/arch/arm/vgic/vgic-mmio-v2.c  |  11 +-
 xen/arch/arm/vgic/vgic.c          |  21 ++-
 xen/arch/ppc/stubs.c              |   4 +
 xen/arch/riscv/stubs.c            |   5 +
 xen/arch/x86/include/asm/smp.h    |   3 -
 xen/arch/x86/platform_hypercall.c |  12 ++
 xen/arch/x86/smp.c                |  35 +---
 xen/arch/x86/sysctl.c             |  25 ++-
 xen/common/Kconfig                |   8 +
 xen/common/smp.c                  |  35 ++++
 xen/common/sysctl.c               |  42 +++++
 xen/include/xen/smp.h             |   4 +
 xen/xsm/flask/hooks.c             |   2 -
 24 files changed, 660 insertions(+), 343 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt
 create mode 100644 tools/misc/xen-hptool-x86.c
 create mode 100644 tools/misc/xen-hptool.h

--=20
2.51.2

