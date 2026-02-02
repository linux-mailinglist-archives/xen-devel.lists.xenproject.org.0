Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FCDOCbOgGkfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:17:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E03CECF4
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218867.1527748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcB-00068Y-QS; Mon, 02 Feb 2026 16:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218867.1527748; Mon, 02 Feb 2026 16:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcB-000669-N7; Mon, 02 Feb 2026 16:17:27 +0000
Received: by outflank-mailman (input) for mailman id 1218867;
 Mon, 02 Feb 2026 16:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZn-0000fY-4N
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:59 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c673a93-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:49 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10299.eurprd03.prod.outlook.com
 (2603:10a6:800:202::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:14:46 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:46 +0000
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
X-Inumbo-ID: 4c673a93-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C55WifUFioBhzi7YiXT1GEsrsKjJ0uztQmXkuIELdYrKbT+qJ4Uc/sx4F7SHoMmepTHqvA3fuAPcxstxhyqrYKINQHEV7iDohWRuUptNX+dOdgBLjG2zY3mpz4KPZgp7YlrrsSDA8gDWmLYKwzT/vZwervwAp+4NxF8cM9GjDcN++eV1CJaBn+HEGYClM2nmlW14IJaoFojzRhSNSN39RkPdlECP+VQcuNVArMCTZabXCB+XY3WoOiYoaS56kfcFwf6sjTiBXx/v5XfgX97n846G9+EKaxyhxBKlxVy8SjGS0zJw2mqdFojweOG5dqKRUvTY+KooFjV/KjgOgHAkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXMYScmwV7lBGFpfQGDBr3UTcEynpVgBBIb7Xeh2ylc=;
 b=jz6rPNJuxV3RYh2U0DEGQKnd8pKLo7U05rlMdRzdPnuOtAAF0LTWCz7xMXF2l4yf5kCL6PK96PJ0la2RnX+/s2+B7LoTZNDN30V3WAUbHZDAQo+gwEO73WIqltZFzqYz4i2zTO0kV81ukogJetCxm7VfrTdbNw2aWw38zbgjUAQ7o9yQOPpcwstjSG+fG8gTq1c/24E7Unb1YKkxI2e+WU8k4oQZMScDV3FJGf3Rvlk5812vHIKo01rUImjbscWOp/yTYSRY6yAOAuzpBy4aCbHA19i+e1fi1D3s3AL5JVeK3z0ERTbJv1rsah2WHQYlN+ilnxWqwdsZfddd1kt3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXMYScmwV7lBGFpfQGDBr3UTcEynpVgBBIb7Xeh2ylc=;
 b=n+ZXKlv+W2HmMsn1Hivw60wxQ4hixPmWJJxplMVd9icKZu8fZP8WufEd+7UUH2lDNVQW3aqNHtHlhtjm+Rubk4xgd5lb4eRQHMiNIMU0D0bsa7eGm6Wa0j+FNxHzO1q3nrNE44cRXXG0SGxg6Z8JTqBd1yTbl+q+/J6dzxqqvxyPKISbDvGRm6lOy22h/OsMnrVRyeGnlFKHhDKa8MAZ4KQHMsKW2GgL5T45lAaZXWF6+l5UsAjNrlPdT9XtUqgwiz7kbr4+hgeQGzccsLCYOah/FiQYDuzfX3G5m3GKWJxp0lViVuRMTI0/I8ULgJ2KZlWa5lkA3w1koKZ0low5lw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 17/19] arm/gicv4: Handle doorbells
Thread-Topic: [RFC PATCH 17/19] arm/gicv4: Handle doorbells
Thread-Index: AQHclF8LXR7D59Si0UektoGS0vWAtA==
Date: Mon, 2 Feb 2026 16:14:44 +0000
Message-ID:
 <f5a6642772da0736e28511ec92f71146ce443294.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10299:EE_
x-ms-office365-filtering-correlation-id: 689dedab-d6a9-43c8-b3c0-08de62762e9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Q0HwBAu6soaanqE9SFUhT/r7XG5lj2R70nHR+v+i0BhKPxmKfYisGZHBmV?=
 =?iso-8859-1?Q?Em7+1Z90fEe1TV9EO8BlWal29C3fo1uKOG9O3o2MsiXbdEodsGJ6bS5+Bx?=
 =?iso-8859-1?Q?+lPPBNUZLaD1Ea4ZWM96XWD1q9rCgr088dqNpE2+OdffmfsDQWdiWJaadg?=
 =?iso-8859-1?Q?TMzF61pS9zdtltuvjbULpe/n0TNqLoVebKlCLERtoRd90e9EvDdBTRpRiW?=
 =?iso-8859-1?Q?p2dCGjaVnpvIZNKhQduS5nwb2E7IcHSE0Og1snn+D2cQKv5mI+6j/Hs/PS?=
 =?iso-8859-1?Q?GbiY7Ndh46VmrxPiYGXUxbBjyBoyNEtIMAqCf0ofEml+otvtzrPgOEN6SC?=
 =?iso-8859-1?Q?WKpC06jNTJSNtqa0A10L3xRsFTW84KENNekvtt+7aOLIwAaX7OPjRhhC3W?=
 =?iso-8859-1?Q?VxxSDx7EXaHvlq/BKqnn2VMWMFnWkFZQ1yLhCqpW6ttQIZYjRXviqYi2Q4?=
 =?iso-8859-1?Q?0YeVmshR0crzWDWzZOkDqlMEWDpUefp1D4GLYRCi+j5n6fieQHfeS/rbhi?=
 =?iso-8859-1?Q?wxbY4EUcryyNLO+cHtag46svcZh+gpU5b0E/nVEtFoURqQFKe1U4AI88Ko?=
 =?iso-8859-1?Q?Iuv56KBlcQFLutD6nR0CZjD++lWOmzeEBRHXvk6d9nTzaCO2WtSWbZNMRr?=
 =?iso-8859-1?Q?mTCj2LL6EFK9GSWRlcJFcwnqvSarh/kYKAlUqJFxk5vXu50G29K6XW90oD?=
 =?iso-8859-1?Q?18M3pMy5TR+pFJo7w3i7mFfcfSavYadKfcWrf1uZ7UPf8ha1KtgrkRZ3mN?=
 =?iso-8859-1?Q?jc8wDJmoK9mV3bWMG7Is5foxxAvwxXDx6ZK0N79HHVaLJsRFOF269dgG8A?=
 =?iso-8859-1?Q?ka9KHQx9V2dpR+rsUct7m4yTp/c9cLzb9/+m/7O5kk8h+HYx4LL9mroqw7?=
 =?iso-8859-1?Q?WX2S4fHOogTVKIp3gGavHSKvVXCFvODziQEWQAY+UkQDqOBKll6bqzwxqa?=
 =?iso-8859-1?Q?odhmvLSg/Cb4I9zYhOPNns2qj1iJl2ybHDCryVohVK7M6n/i6VZ9esKh59?=
 =?iso-8859-1?Q?dasitGD4a0Xm9NqBzQOlgYKwt2XVr6HswC9bvU5WEB9rxj6sLf7qZ7FHCc?=
 =?iso-8859-1?Q?CDb0aiKlq5AttswrAO4zx20Sc2my+YC56JKOUEynY1Cl8+lwlRMPraU7JN?=
 =?iso-8859-1?Q?w1+wzi0MGjR2sA0EIhvXhtRGRUG89M/g+HdoJsGrKCK+5BYGjUEiwlKszP?=
 =?iso-8859-1?Q?eqAGDpRsjqsFI9B5wqoQggzG7KdqXTON5yhF3mRdYZtuCvlVnXhCwjaQIT?=
 =?iso-8859-1?Q?oaBk2EO5raMPOfK85FhPDnDIS0Rw5ViREbM9qGGEKqVoNR1tIpzFdx26j1?=
 =?iso-8859-1?Q?crMpOqI2x2BfcdPbc7PmOwP4ppvhdKPXIAsfpnqu7HBw/OPx7YjiK4ypmy?=
 =?iso-8859-1?Q?6O3fYZBrE3eX88bExKe1A1vOpj39mYA1F9PaEHTpiq9M0nVv3bZc3CuglM?=
 =?iso-8859-1?Q?C2yuTvjd2L6hBHtryLQHpZAZXeF3LflqxRkh2m96Decwh8Zn04UKwuwGqp?=
 =?iso-8859-1?Q?OWy5ywQBEuS6LE8FTSAj3gZ4CtjSSduj3K+sw+vVLHkB1nxU8xyCavdZXu?=
 =?iso-8859-1?Q?Zj5kwCc3lCyJlcBKpQ75tUdl6CGSDpZZY3rlxiYm0e5JbKjPTwFmgcnzi5?=
 =?iso-8859-1?Q?kuujgZw5QLt4Odm6HVzdNFRsO1En8/9KzYwTzhlRFIduZjNwBDT1sAxAkG?=
 =?iso-8859-1?Q?SBf10z161hHwJLNM9jY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VBD6mLpSdM3NLqa65BSmwoc00Zaafaw75r+oTTgl7NpIzzJzAKByR7Kwff?=
 =?iso-8859-1?Q?RCEYxVYxZqzJtmnkysW/eVKuiCdXERViCBanCqnBND3qVekSSgz5FdxN+5?=
 =?iso-8859-1?Q?I/IK1dkKVd6dlJNrcFge+qUoi21kMpWoIOJ4UY2IC60DQ+j7OYNQriNhXX?=
 =?iso-8859-1?Q?4IY6nxHotM6NaQ7A6sTK4GesItSs2aZvP4wnIPCY0RjKSf7Nxd+6CnUpEP?=
 =?iso-8859-1?Q?xwFilG4PYMsprWxNxbc42imbqtcNSLvpo+GwCta6xYM0CjoPlbI19WbC3d?=
 =?iso-8859-1?Q?YhLipSnagfAOthf1WbPflxDSDfsPnws1tn7x5MpWDgqFMaHvkjX+gtxHhz?=
 =?iso-8859-1?Q?6BlLnj9Dmbr1wmPDs2SdkygAfEXez0kf1IKDF9ADBglm3xG1qBLcDP3qWj?=
 =?iso-8859-1?Q?idFZFZaV4CctMEi8nIXdooekW8mCgL90BHMGz/fRIZ3fgfazmIrZqlDqT3?=
 =?iso-8859-1?Q?exmG2YwnBpoK1DOQ1+exgmGXU2r7F470MBfR//7ZboDNV1SQ+mUDQm9pVF?=
 =?iso-8859-1?Q?2hCRyrCk87/b4iz1jLo1kCjgObQU6Z+vTCdyQewT6mxGBvTpZh/qz83D4O?=
 =?iso-8859-1?Q?zMoUdxYCkjo9XdnV3Qs1RxKOCnksZb1bA5isyavCeJlBZ7yXcPH7A5vQ0A?=
 =?iso-8859-1?Q?ziJNsxKCEby+82EHmIbLPZ58gZnMZDkpO7HhBkMvnNEe3ZKBSLnWvJB1mq?=
 =?iso-8859-1?Q?L1fcEaatFjdnOo1jzVv/O8JAkO7HPnMnjvrEVNbS0H/vJXf+A4yYE+5Ok7?=
 =?iso-8859-1?Q?14FASPmSEBQJIwy002u416zlgxlZe3kovPbZXwzXGgJ8HtEhI4yLBDIDZZ?=
 =?iso-8859-1?Q?/HwHNF7FHjUt40LmyFOjSGJzviCQV82kobYQv+CtL3J6swzp9oea+O4d7H?=
 =?iso-8859-1?Q?ah34WMgpA2pDSqPQjtCRESzw5gUiBg0M4PfKHeHme/gcClVpWpxgqUNlEa?=
 =?iso-8859-1?Q?nzhJNUEcT1yiuZ8CqSqTUlqYfxZF9BzNTTeVknLuDDPU57h32Z3SSd+WdK?=
 =?iso-8859-1?Q?FnLQBrzGewia0M8Qtga8HXtxhvG26GcEdM+7WG9DfgtvJ41+CgqLr9/4VU?=
 =?iso-8859-1?Q?u1LLy8T0mJ2b1cZOmarWdoNyYt4r+1E+/Gk5j7irNapRllVju5ufaMEONb?=
 =?iso-8859-1?Q?H49KHMvasWKbWTzgT8g28CqG8vaoLRKUUjWor7bFD+6scu2TQ7yPAxZinx?=
 =?iso-8859-1?Q?GsPQXRP3z3DHpZAVolS0shrnW2pBcmI9mjsNtIujJVIHOLaq8yj9Me2l+Y?=
 =?iso-8859-1?Q?e2PqwbHpcxeHzeyPe/5jls0NWHjC9mbK29Ylqb7RMFWTy3lgDvnqGn4yiX?=
 =?iso-8859-1?Q?BF6Rsd65tnPom14UjSPleVUCtKyD4hxCV1dKImP//XqtZJ94AzhpW/OBDw?=
 =?iso-8859-1?Q?jqZ8kFFo9cOB0khJ6vyu10cAm25oLGes9QZG3N67PbkSAnN+OOjCNXvOWb?=
 =?iso-8859-1?Q?SrWQFlYLdlBU9nnJyPn8sv+FCZolnx6fq5eaeBkdhGbe+OokNCbrPE5TGI?=
 =?iso-8859-1?Q?o1U8Q9RfrT8FEyoh7ZKE+uTeHjBd5Jr4+g56Yyut4SwBXPDNiq2vJSpDA3?=
 =?iso-8859-1?Q?WQHCc9lKgMPYRhSsZ2xrWyZKIUfxuKmhYKRte+29J9awbdZhs5BWqMvg83?=
 =?iso-8859-1?Q?cdK8GliK+xlYEv9rV+lndVYsV6fDvWstnWrrl+17vVmu7t6O5CB6F9bVGy?=
 =?iso-8859-1?Q?vmUk1bTiA58Zga+St99oCZBtyUMXJ2h+jln9M2XbM0X13xjuhq8upkgc9H?=
 =?iso-8859-1?Q?TwnwVFHc+5Q0Vzhh3Lxay/wee9vd+TmQpxcAHkvgc+tK+ta64stHsOPri0?=
 =?iso-8859-1?Q?wGrpvyvvXHtW07M/5VUg0Tl90wCqeho=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689dedab-d6a9-43c8-b3c0-08de62762e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:44.3048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lb0TkOsaab7wIH+NuoEm5FC5ABMA44F0rWi0Sd6V41LsFYQb5vnirB6C3ZsjtEgf9RS6jcqApZhphSqrjhGaAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 33E03CECF4
X-Rspamd-Action: no action

When GIC wants to inject a virtual interrupt to a VCPU that is not
currently scheduled, it sends a kick for a hypervisor to schedule it. To
receive such kicks, we need to set up a doorbell interrupt for each VPE.

Add changes necessary to allocate, mask/unmask and handle doorbell
interrupts for each VPE. When a doorbell interrupt is received, set the
pending_last flag for the corresponding VPE and kick it, so that the
hypervisor schedules the VCPU to handle pending VLPIs.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             |  13 ++-
 xen/arch/arm/gic-v3-lpi.c             |  69 ++++++++++----
 xen/arch/arm/gic-v4-its.c             | 127 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic_v3_its.h |   6 +-
 xen/arch/arm/vgic-v3-its.c            |  14 ++-
 5 files changed, 203 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index be840fbc8f..fa5c1eb6d1 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -1016,8 +1016,11 @@ int gicv3_its_map_guest_device(struct domain *d,
=20
     dev->guest_doorbell =3D guest_doorbell;
     dev->guest_devid =3D guest_devid;
-    dev->host_devid =3D host_devid;
-    dev->eventids =3D nr_events;
+
+    #ifdef CONFIG_GICV4
+       spin_lock_init(&dev->event_map.vlpi_lock);
+       dev->event_map.nr_lpis =3D nr_events;
+    #endif
=20
     rb_link_node(&dev->rbnode, parent, new);
     rb_insert_color(&dev->rbnode, &d->arch.vgic.its_devices);
@@ -1142,7 +1145,8 @@ int gicv3_remove_guest_event(struct domain *d, paddr_=
t vdoorbell_address,
     if ( host_lpi =3D=3D INVALID_LPI )
         return -EINVAL;
=20
-    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI);
+    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, INVALID_LPI,
+                                false, INVALID_VCPU_ID);
=20
     return 0;
 }
@@ -1169,7 +1173,8 @@ struct pending_irq *gicv3_assign_guest_event(struct d=
omain *d,
     if ( !pirq )
         return NULL;
=20
-    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, virt_lpi);
+    gicv3_lpi_update_host_entry(host_lpi, d->domain_id, virt_lpi,
+                                false, INVALID_VCPU_ID);
=20
     return pirq;
 }
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 3c2649b695..37f1aa1064 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -39,7 +39,7 @@ union host_lpi {
     struct {
         uint32_t virt_lpi;
         uint16_t dom_id;
-        uint16_t pad;
+        uint16_t db_vcpu_id;
     };
 };
=20
@@ -161,24 +161,48 @@ void gicv3_do_LPI(unsigned int lpi)
      * ignore them, as they have no further state and no-one can expect
      * to see them if they have not been mapped.
      */
-    if ( hlpi.virt_lpi =3D=3D INVALID_LPI )
+    if ( hlpi.virt_lpi =3D=3D INVALID_LPI && hlpi.db_vcpu_id =3D=3D INVALI=
D_VCPU_ID )
         goto out;
=20
     d =3D rcu_lock_domain_by_id(hlpi.dom_id);
     if ( !d )
         goto out;
=20
-    /*
-     * TODO: Investigate what to do here for potential interrupt storms.
-     * As we keep all host LPIs enabled, for disabling LPIs we would need
-     * to queue a ITS host command, which we avoid so far during a guest's
-     * runtime. Also re-enabling would trigger a host command upon the
-     * guest sending a command, which could be an attack vector for
-     * hogging the host command queue.
-     * See the thread around here for some background:
-     * https://lists.xen.org/archives/html/xen-devel/2016-12/msg00003.html
-     */
-    vgic_vcpu_inject_lpi(d, hlpi.virt_lpi);
+    /* It is a doorbell interrupt. */
+    if ( hlpi.db_vcpu_id !=3D INVALID_VCPU_ID )
+    {
+#ifdef CONFIG_GICV4
+        struct vcpu *v =3D d->vcpu[hlpi.db_vcpu_id];
+
+        /* We got the message, no need to fire again */
+        its_vpe_mask_db(v->arch.vgic.its_vpe);
+
+        /*
+         * Update the pending_last flag that indicates that VLPIs are pend=
ing.
+         * And the corresponding vcpu is also kicked into action.
+         */
+        v->arch.vgic.its_vpe->pending_last =3D true;
+
+        vcpu_kick(v);
+#else
+        printk(XENLOG_WARNING
+               "Doorbell LPI is only suooprted on GICV4\n");
+#endif
+    }
+    else
+    {
+        /*
+         * TODO: Investigate what to do here for potential interrupt storm=
s.
+         * As we keep all host LPIs enabled, for disabling LPIs we would n=
eed
+         * to queue a ITS host command, which we avoid so far during a gue=
st's
+         * runtime. Also re-enabling would trigger a host command upon the
+         * guest sending a command, which could be an attack vector for
+         * hogging the host command queue.
+         * See the thread around here for some background:
+         * https://lists.xen.org/archives/html/xen-devel/2016-12/msg00003.=
html
+         */
+        vgic_vcpu_inject_lpi(d, hlpi.virt_lpi);
+    }
=20
     rcu_unlock_domain(d);
=20
@@ -187,7 +211,8 @@ out:
 }
=20
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
-                                 uint32_t virt_lpi)
+                                 uint32_t virt_lpi, bool is_db,
+                                 uint16_t db_vcpu_id)
 {
     union host_lpi *hlpip, hlpi;
=20
@@ -197,8 +222,16 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, in=
t domain_id,
=20
     hlpip =3D &lpi_data.host_lpis[host_lpi / HOST_LPIS_PER_PAGE][host_lpi =
% HOST_LPIS_PER_PAGE];
=20
-    hlpi.virt_lpi =3D virt_lpi;
-    hlpi.dom_id =3D domain_id;
+    if ( !is_db )
+    {
+        hlpi.virt_lpi =3D virt_lpi;
+        hlpi.dom_id =3D domain_id;
+    }
+    else
+    {
+        hlpi.dom_id =3D domain_id;
+        hlpi.db_vcpu_id =3D db_vcpu_id;
+    }
=20
     write_u64_atomic(&hlpip->data, hlpi.data);
 }
@@ -595,6 +628,7 @@ int gicv3_allocate_host_lpi_block(struct domain *d, uin=
t32_t *first_lpi)
          */
         hlpi.virt_lpi =3D INVALID_LPI;
         hlpi.dom_id =3D d->domain_id;
+        hlpi.db_vcpu_id =3D INVALID_VCPU_ID;
         write_u64_atomic(&lpi_data.host_lpis[chunk][lpi_idx + i].data,
                          hlpi.data);
=20
@@ -602,7 +636,8 @@ int gicv3_allocate_host_lpi_block(struct domain *d, uin=
t32_t *first_lpi)
          * Enable this host LPI, so we don't have to do this during the
          * guest's runtime.
          */
-        lpi_data.lpi_property[lpi + i] |=3D LPI_PROP_ENABLED;
+        lpi_write_config(lpi_data.lpi_property, lpi + i + LPI_OFFSET, 0xff=
,
+                         LPI_PROP_ENABLED);
     }
=20
     lpi_data.next_free_lpi =3D lpi + LPI_BLOCK;
diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
index 175fda7acb..0462976b93 100644
--- a/xen/arch/arm/gic-v4-its.c
+++ b/xen/arch/arm/gic-v4-its.c
@@ -157,6 +157,9 @@ static int its_send_cmd_vmapp(struct host_its *its, str=
uct its_vpe *vpe,
     cmd[3] =3D (vpt_addr & GENMASK(51, 16)) |
              ((HOST_LPIS_NRBITS - 1) & GENMASK(4, 0));
=20
+    /* Default doorbell interrupt */
+    cmd[1] |=3D (uint64_t)vpe->vpe_db_lpi;
+
  out:
     ret =3D its_send_command(its, cmd);
=20
@@ -296,6 +299,37 @@ static int its_send_cmd_vmovp(struct its_vpe *vpe)
     return 0;
 }
=20
+
+static void its_vpe_send_inv_db(struct its_vpe *vpe)
+{
+    // struct its_device *dev =3D vpe_proxy.dev;
+    // unsigned long flags;
+
+    // spin_lock_irqsave(&vpe_proxy.lock, flags);
+    // gicv4_vpe_db_proxy_map_locked(vpe);
+    // its_send_cmd_inv(dev->hw_its, dev->host_devid, vpe->vpe_proxy_event=
);
+    // spin_unlock_irqrestore(&vpe_proxy.lock, flags);
+}
+
+static void its_vpe_inv_db(struct its_vpe *vpe)
+{
+    its_vpe_send_inv_db(vpe);
+}
+
+void its_vpe_mask_db(struct its_vpe *vpe)
+{
+    /* Only clear enable bit. */
+    lpi_write_config(lpi_data.lpi_property, vpe->vpe_db_lpi, LPI_PROP_ENAB=
LED, 0);
+    its_vpe_inv_db(vpe);
+}
+
+static void its_vpe_unmask_db(struct its_vpe *vpe)
+{
+    /* Only set enable bit. */
+    lpi_write_config(lpi_data.lpi_property, vpe->vpe_db_lpi, 0, LPI_PROP_E=
NABLED);
+    its_vpe_inv_db(vpe);
+}
+
 static void __init its_vpe_teardown(struct its_vpe *vpe)
 {
     unsigned int order;
@@ -309,6 +343,8 @@ static void __init its_vpe_teardown(struct its_vpe *vpe=
)
 int vgic_v4_its_vm_init(struct domain *d)
 {
     unsigned int nr_vcpus =3D d->max_vcpus;
+    unsigned int nr_db_lpis, nr_chunks, i =3D 0;
+    uint32_t *db_lpi_bases;
     int ret =3D -ENOMEM;
=20
     if ( !gicv3_its_host_has_its() )
@@ -326,9 +362,31 @@ int vgic_v4_its_vm_init(struct domain *d)
     d->arch.vgic.its_vm->vproptable =3D lpi_allocate_proptable();
     if ( !d->arch.vgic.its_vm->vproptable )
         goto fail_vprop;
+    /* Allocate a doorbell interrupt for each VPE. */
+    nr_db_lpis =3D d->arch.vgic.its_vm->nr_vpes;
+    nr_chunks =3D DIV_ROUND_UP(nr_db_lpis, LPI_BLOCK);
+    db_lpi_bases =3D xzalloc_array(uint32_t, nr_chunks);
+    if ( !db_lpi_bases )
+        goto fail_db_bases;
+
+    do {
+        /* Allocate doorbell interrupts in chunks of LPI_BLOCK (=3D32). */
+        ret =3D gicv3_allocate_host_lpi_block(d, &db_lpi_bases[i]);
+        if ( ret )
+            goto fail_db;
+    } while ( ++i < nr_chunks );
+
+    d->arch.vgic.its_vm->db_lpi_bases =3D db_lpi_bases;
+    d->arch.vgic.its_vm->nr_db_lpis =3D nr_db_lpis;
=20
     return 0;
=20
+fail_db:
+    while ( --i >=3D 0 )
+        gicv3_free_host_lpi_block(d->arch.vgic.its_vm->db_lpi_bases[i]);
+    xfree(db_lpi_bases);
+fail_db_bases:
+    lpi_free_proptable(d->arch.vgic.its_vm->vproptable);
 fail_vprop:
     xfree(d->arch.vgic.its_vm->vpes);
  fail_vpes:
@@ -340,8 +398,13 @@ fail_vprop:
 void vgic_v4_free_its_vm(struct domain *d)
 {
     struct its_vm *its_vm =3D d->arch.vgic.its_vm;
+    int nr_chunks =3D DIV_ROUND_UP(its_vm->nr_db_lpis, LPI_BLOCK);
     if ( its_vm->vpes )
         xfree(its_vm->vpes);
+    while ( --nr_chunks >=3D 0 )
+        gicv3_free_host_lpi_block(its_vm->db_lpi_bases[nr_chunks]);
+    if ( its_vm->db_lpi_bases )
+        xfree(its_vm->db_lpi_bases);
     if ( its_vm->vproptable )
         lpi_free_proptable(its_vm);
 }
@@ -357,14 +420,29 @@ int vgic_v4_its_vpe_init(struct vcpu *vcpu)
         return -ENOMEM;
=20
     its_vm->vpes[vcpuid] =3D vcpu->arch.vgic.its_vpe;
+    vcpu->arch.vgic.its_vpe =3D vcpu->arch.vgic.its_vpe;
+    vcpu->arch.vgic.its_vpe->vpe_db_lpi =3D its_vm->db_lpi_bases[vcpuid/32=
] + (vcpuid % 32);
+    /*
+     * Sometimes vlpi gets firstly mapped before associated vpe
+     * becoming resident, so in case missing the interrupt, we intend to
+     * enable doorbell at the initialization stage
+     */
+
     vcpu->arch.vgic.its_vpe->its_vm =3D its_vm;
=20
+    gicv3_lpi_update_host_entry(vcpu->arch.vgic.its_vpe->vpe_db_lpi,
+                                vcpu->domain->domain_id, INVALID_LPI, true=
,
+                                vcpu->vcpu_id);
+
+
     ret =3D its_vpe_init(vcpu->arch.vgic.its_vpe);
     if ( ret )
     {
         its_vpe_teardown(vcpu->arch.vgic.its_vpe);
         return ret;
     }
+    its_vpe_unmask_db(vcpu->arch.vgic.its_vpe);
+
     return 0;
 }
=20
@@ -800,6 +878,7 @@ void vgic_v4_load(struct vcpu *vcpu)
      * corresponding to our current CPU expects us here
      */
     WARN_ON(gicv4_vpe_set_affinity(vcpu));
+    its_vpe_mask_db(vpe);
     its_make_vpe_resident(vpe, vcpu->processor);
     vpe->resident =3D true;
 }
@@ -812,5 +891,53 @@ void vgic_v4_put(struct vcpu *vcpu, bool need_db)
         return;
=20
     its_make_vpe_non_resident(vpe, vcpu->processor);
+    if ( need_db )
+        /* Enable the doorbell, as the guest is going to block */
+        its_vpe_unmask_db(vpe);
     vpe->resident =3D false;
 }
+
+static int its_vlpi_set_doorbell(struct its_vlpi_map *map, bool enable)
+{
+    if (map->db_enabled =3D=3D enable)
+        return 0;
+
+    map->db_enabled =3D enable;
+
+    /*
+     * Ideally, we'd issue a VMAPTI to set the doorbell to its LPI
+     * value or to 1023, depending on the enable bit. But that
+     * would be issuing a mapping for an /existing/ DevID+EventID
+     * pair, which is UNPREDICTABLE. Instead, let's issue a VMOVI
+     * to the /same/ vPE, using this opportunity to adjust the doorbell.
+     */
+    return its_send_cmd_vmovi(map->dev->hw_its, map);
+}
+
+int its_vlpi_prop_update(struct pending_irq *pirq, uint8_t property,
+                         bool needs_inv)
+{
+    struct its_vlpi_map *map;
+    unsigned int cpu;
+    int ret;
+
+    if ( !pirq->vlpi_map )
+        return -EINVAL;
+
+    map =3D pirq->vlpi_map;
+
+    /* Cache the updated property and update the vproptable. */
+    map->properties =3D property;
+    lpi_write_config(map->vm->vproptable, pirq->irq, 0xff, property);
+
+    if ( needs_inv )
+    {
+        cpu =3D map->vm->vpes[map->vpe_idx]->col_idx;
+        ret =3D its_inv_lpi(map->dev->hw_its, map->dev, map->eventid, cpu)=
;
+        if ( ret )
+            return ret;
+    }
+
+    return its_vlpi_set_doorbell(map, property & LPI_PROP_ENABLED);
+}
+
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index f03a8fad47..dababe97cd 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -295,7 +295,9 @@ struct pending_irq *gicv3_assign_guest_event(struct dom=
ain *d,
                                              uint32_t vdevid, uint32_t eve=
ntid,
                                              uint32_t virt_lpi);
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
-                                 uint32_t virt_lpi);
+                                 uint32_t virt_lpi, bool is_db,
+                                 uint16_t db_vcpu_id);
+
 struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type);
 bool its_alloc_table_entry(struct its_baser *baser, uint32_t id);
 struct page_info *lpi_allocate_pendtable(void);
@@ -322,6 +324,8 @@ bool event_is_forwarded_to_vcpu(struct its_device *dev,=
 uint32_t eventid);
 void its_vpe_mask_db(struct its_vpe *vpe);
 #endif
 int gicv4_its_vlpi_unmap(struct pending_irq *pirq);
+int its_vlpi_prop_update(struct pending_irq *pirq, uint8_t property,
+                         bool needs_inv);
=20
 /* ITS quirks handling. */
 uint64_t gicv3_its_get_cacheability(void);
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 94f7dd7d90..0a740ad68f 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -387,7 +387,7 @@ out_unlock:
  * property table and update the virtual IRQ's state in the given pending_=
irq.
  * Must be called with the respective VGIC VCPU lock held.
  */
-static int update_lpi_property(struct domain *d, struct pending_irq *p)
+int update_lpi_property(struct domain *d, struct pending_irq *p, bool need=
s_inv)
 {
     paddr_t addr;
     uint8_t property;
@@ -417,6 +417,9 @@ static int update_lpi_property(struct domain *d, struct=
 pending_irq *p)
     else
         clear_bit(GIC_IRQ_GUEST_ENABLED, &p->status);
=20
+    if ( pirq_is_tied_to_hw(p) )
+        return its_vlpi_prop_update(p, property, needs_inv);
+
     return 0;
 }
=20
@@ -430,6 +433,9 @@ static int update_lpi_property(struct domain *d, struct=
 pending_irq *p)
  */
 static void update_lpi_vgic_status(struct vcpu *v, struct pending_irq *p)
 {
+    if ( pirq_is_tied_to_hw(p) )
+        return;
+
     ASSERT(spin_is_locked(&v->arch.vgic.lock));
=20
     if ( test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
@@ -479,7 +485,7 @@ static int its_handle_inv(struct virt_its *its, uint64_=
t *cmdptr)
     spin_lock_irqsave(&vcpu->arch.vgic.lock, flags);
=20
     /* Read the property table and update our cached status. */
-    if ( update_lpi_property(d, p) )
+    if ( update_lpi_property(d, p, true) )
         goto out_unlock;
=20
     /* Check whether the LPI needs to go on a VCPU. */
@@ -552,7 +558,7 @@ static int its_handle_invall(struct virt_its *its, uint=
64_t *cmdptr)
=20
             vlpi =3D pirqs[i]->irq;
             /* If that fails for a single LPI, carry on to handle the rest=
. */
-            err =3D update_lpi_property(its->d, pirqs[i]);
+            err =3D update_lpi_property(its->d, pirqs[i], false);
             if ( !err )
                 update_lpi_vgic_status(vcpu, pirqs[i]);
             else
@@ -785,7 +791,7 @@ static int its_handle_mapti(struct virt_its *its, uint6=
4_t *cmdptr)
      * We don't need the VGIC VCPU lock here, because the pending_irq isn'=
t
      * in the radix tree yet.
      */
-    ret =3D update_lpi_property(its->d, pirq);
+    ret =3D update_lpi_property(its->d, pirq, true);
     if ( ret )
         goto out_remove_host_entry;
=20
--=20
2.51.2

