Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPBTHOgt52lg5AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:57:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DCB437E69
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288515.1568793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5yx-0001vq-62; Tue, 21 Apr 2026 07:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288515.1568793; Tue, 21 Apr 2026 07:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5yx-0001tw-2i; Tue, 21 Apr 2026 07:57:19 +0000
Received: by outflank-mailman (input) for mailman id 1288515;
 Tue, 21 Apr 2026 07:57:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wF5yv-0001ti-Fy
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:57:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5yu-002iV5-Ou
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:57:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e72dd8-5cb7-0a2a0a5109dd-0a2a450ca6fe-10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:57:16 +0200
Received: from [52.101.72.122]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e72ddc-62f1-0a2a450c0019-3465487ab259-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:57:16 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11567.eurprd03.prod.outlook.com
 (2603:10a6:20b:724::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 07:57:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 07:57:14 +0000
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
 b=YaykhUmpeGWO2VnvDmySEFxB0GuT+84t1jEisRho3PIxAUaedNsB3kxXJyijVFhvx9BcXln3q/3JQuw1rfww7ui6IWaA6N1UmIxiUxYDL9/zBVb3tr6n+cj6nXwqsmtZkzG6TYROH9bPLBQwzAmi9G5jgmlB+pf3ly+B6K9aZClePS6Vk6aG+VgRnXuMleZRWo+/eaEiQ9yiv/6XcyBJwT+Zb7QQb5XDuig9/XOBPZBeqKbkgOCp0lwyAJmeKUHVvS11q+d82HcZbxNNekFPRgVOulNrz9b0vsLyD2rMoXcnwo6QeHNIUqcJLJELeM0bTWD9NK7ZQHL0CAo86wy1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRPRcgh1FVGOsAWnaXs0RoOu6QcTP9Fjyh01V3xCn/I=;
 b=KDoryF2igz2q91Qf4GpgeCyyMI3vUkibosxEF7CqilZUpoVancOn28Bx0cC98fK/qWyBts8iZi3CoX4p9huJX3u4letT23PW1SBaAgKpH8Wih588iyM5x5EJjryjFcvj4BqAdOJq9kUt9OqJdAXRrmDllSMVWXrg4GnlqwEbBcDLGbQeD214m0ylcguQunHT5p0zkEdp0dzAgWQQd+MmykOta76YddBdtolmCJZysR2QzFDsRaq9EzIEpUuKYDXy/Bgo6z5oMLU3sZnznPXXp1HZ155iMdrK7Of31cWGoW/uqIYBA7KlVjwtNT5a/iUyblht4wgv0EYtKEUidPPgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRPRcgh1FVGOsAWnaXs0RoOu6QcTP9Fjyh01V3xCn/I=;
 b=Pz+2LVMd5/vYar77FN7JyauUk7ichkCljauQNJ3rQ/HqldIYKSbkgqLZZJhNNvBJbvtjnyFzqlNh5Edfef6EZT11tZ9drms0dfjqsYV5RYZK1hP99ISknN5Kql0JGgb/UQL8XR91LD2Cdj09Kje5h9ZeCZak7yMHihlK6wcZ0ncG9sIsPD3MPy8YLhUJLubDct2vCi4hKTdojoNF0nk8qZbAEez6gBDvJIc7nh+T4JoT05mB6nPmYs9PNxCWGlxjgKhaPekH48BHTJ71HR2OSBxMZhm/x7M/7p02WhAy5YC9tZGknSzwrJWDGeen4/VI2j/cjMO+8zzaK87UPcpOTA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>
Subject: [RFC PATCH 0/2] Add region id support for PCI
Thread-Topic: [RFC PATCH 0/2] Add region id support for PCI
Thread-Index: AQHc0WR20glHFzpSrUS4wumyIAn/dw==
Date: Tue, 21 Apr 2026 07:57:13 +0000
Message-ID: <cover.1776756291.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11567:EE_
x-ms-office365-filtering-correlation-id: 6525d359-4782-4269-596d-08de9f7b9964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 6/RD1nSUol+CsWdpDDrHSWDik9QByes3wLi8017cY59bb0yUtujq6sdZM8PQnyZUPu0vWN146enqKFmCTfa04/pIfCckK1//rXyVcV0hG3CoBGJjV5Ia3fwvx5rqOXNQQ/pxqM93YFodL8xmZXitPwZ559jIOYk7E6VtSUapJPucoS7DVF0dXmE9/9X3AFn3OReqChiX4A8alEbtwQ3YJ3WrXoN3wqBJkKIfA1uFLMO5utI2E0qM6iTU0WA+wKs6xzpd0o1wF1W/BL6K7t+Uh1+7OYmJnd8rUGlxjRVY2I0t/MfoxiEtE+jRwtAkqBU4E9aY+tz1rssu7l1SRyGbjW6j3R/GctzkJGw1fQiPajHedoLxk102P0A9XG2pxD7FTpXbJr+DQSF2Lb9MGNZOADOGAC80roryWolpBJgRYJo5v2Kwq8CzOsXksvhgy3g/5RuZqnzo3CCUDSefvHTwrLPnNpP6cbFIhWg2GzkTmd1NW9QWnMa+8LcYQozpVtD4SBH0zFIVVBpG1Evuep5x1KC/J1RtgJ4eEuKdAB8QYa/d309SDTLVYrO1LcAWciDbmpTAjHDAfhFnMwM/nkr2y3yA4fbkq/jtByp1rgZoq7+nTFOlxh3YtsGdy8JRDuDEvhjoHzw08reUhRq3at40BTSC6AKaARnk4U2LoNfRroP3ZE5i/8Ld+Qy8zg1pJjnSlNxR94SZkcV0FIPPXOjuFppMsZ3/e/3alPunbNsma7PVi4Ww+OuzS1OawPIc3dOnA+Bfx3AtC4nZblPC19JoDiLheUOimOpGK08+cDmz5zs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pwImHPtAQnxQrvPJ/i+4pacbAXhxKb/ir0IW5MO1joj8CsRsuNXfQEKPnD?=
 =?iso-8859-1?Q?i0ga16BAyGbrVnn0AcI/CpDegkSbar9SSEhFi/jmFVjH+pwYF+qb/THsyj?=
 =?iso-8859-1?Q?4sht+Dph63tNVJm+BcKWT358A5/EZyiNvAaQTccTbk4ild2o7dW+a7S+ZC?=
 =?iso-8859-1?Q?vP2yMA1DLgasJ7eAzVRfCThUN0CWoCkUrcFg/P+db/0R+zVe+bJbH4ypKL?=
 =?iso-8859-1?Q?BI8febpFC241cw2XFBgT69oAVGDnTVVnqYMF+kmutpD0tqGW+9WbIcFTtE?=
 =?iso-8859-1?Q?sNeUbqa322Bw+bzDl6joD17G4f9w8PjyZP9DRAY1zB99vox/73BPQliY5x?=
 =?iso-8859-1?Q?LnQhw4geP49PclVVMlW6TuJkoZdnvrmu7Z9KdMTPZfxjiuaEZJ0QE6rxfo?=
 =?iso-8859-1?Q?MhYAS2g0nmwYPaZl3CWxFIo+BjhC/HNDODc+ZgpWmYgL69AlWFJNFaYpmF?=
 =?iso-8859-1?Q?YHNTW8pAWTCBg9ScB23CsjeHMqgUqoev69rleSy1gukSbhTUAw5ux/Zvpi?=
 =?iso-8859-1?Q?8yEKqVqSMBSo8fL7YVdUXFZEzBl/OSYMp+e0+g5oLAfWRXtmHZVY6OzFxk?=
 =?iso-8859-1?Q?afUQsPrpkvELQiHQycfG0TZ7s2s3KzT0X/suFiGoPnIlF7wT+eX1QwQhtY?=
 =?iso-8859-1?Q?bYr9XSzaUXQRb2MQNIY83t8p0kMvet82qKD0Qu/7LTKjY95qlTCv7ClnYP?=
 =?iso-8859-1?Q?wCisA5qlq0tsbuya1U2Z+aU66L6MViFNiIHYWyljI+8d7M2bnp6IYPBNyk?=
 =?iso-8859-1?Q?xAHE7+PZRUuoK3//kbZacyJkAz5TGNyyEaLeYbF+o6RcfW6FMULEXdRmaL?=
 =?iso-8859-1?Q?sxUaFgFm+2ITHXmeH0/z6mehbUMNLj1FBBCtdlCPEb6SNIP3wXHnIvbqLo?=
 =?iso-8859-1?Q?pAjtra7ZrluVDvfrz+j81Yyi6/rJjwsvtz0crFk15rA1tou1wPmHrHgd1t?=
 =?iso-8859-1?Q?xE2iWh/b4clRj3R+me69qbwATRjtnbGpglxtteemz2Iu28fxUYeET/Llbi?=
 =?iso-8859-1?Q?RTUMUTS4eOdVzxxnTvueVca6mZeNa6yQfBdwObJ/dOgCOuSwVWs7/VX5nF?=
 =?iso-8859-1?Q?oQOfU9nua7QrRBRTwI1xrgRc3bHLWML7m4vfAo9tkPrIfe+3AeVQIARGTu?=
 =?iso-8859-1?Q?09LxZ49Ge2IS/CWlgYNYS5N9TUhiDtIfdGxbSGuP80D9pMYrpL/F+uMCnZ?=
 =?iso-8859-1?Q?Pa8PIrB6jd+DQ0A0LJuz6SXASHzWO8YyHVAaqeGJoXnz4pN62jfaFTxUCW?=
 =?iso-8859-1?Q?1nKob5xpxasE2GxOvFdGeYVEqJl9aJBl+W5wVyz/AmNFgx4eaUVM58+hBH?=
 =?iso-8859-1?Q?OrhG3JnC3UtBLGVme4P4tNuQ+/2VI+jJ/CJkusB08ebvuArseN58ZkV/6B?=
 =?iso-8859-1?Q?jimkAWPFZEJA+qubIQ25Sq8WqXeszwfiyyNNXNrm1Usdyf1rO4o+lovKgz?=
 =?iso-8859-1?Q?JIFSKM/MBcodBpzRdG13H2apgdnxYsrcPPcOodZYVmbQhN/9ivzGwjfsbX?=
 =?iso-8859-1?Q?vRB42qlzebeuAmVqs0XTPesuTOuepBsYkPGD1CGlDK3+heS0XtwDKIKpEQ?=
 =?iso-8859-1?Q?fl1Mh0v/HQXOhkn1ILqbZ5uvYZejIxZX/MxdDZq24PNOkX40WfDlxOvrGH?=
 =?iso-8859-1?Q?HBZocLyikQliYD662tMVjXfP7uoN28iKBbqe/i56kcg3YkPdPM7BJJpVHp?=
 =?iso-8859-1?Q?5SKjChcspmJIxOtm3rJX0ahmXmcZGsQjV3m3Wpdg0wWntH1XWWROfbQziL?=
 =?iso-8859-1?Q?9Wy2Ru5azipVka5QDKLP4hguLRdCVOXmqSY8H/1h+fpy3eBDlXSVxGRWdL?=
 =?iso-8859-1?Q?PO2YGL3rJq7hgAZOxI8kJMiWr7S8EO4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6525d359-4782-4269-596d-08de9f7b9964
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 07:57:13.5587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5QRfrmnKft++ehWsXLRcGhixIbzglZlV0oeBMnlnpr7TOGefnWVkAA8e2E7Bga98Z6z9REt+GwKEr3MStlCXew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11567
X-purgate-ID: tlsNG-d25034/1776758236-F6809CF5-358DCFBE/0/0
X-purgate-type: clean
X-purgate-size: 1305
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D2DCB437E69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Renesas R-Car platforms, the Region ID (RGID) feature encodes an
identifier into the upper bits of the physical address for every CPU memory
access. This address manipulations can mostly be done via system and domain
congirutaion, but for PCI bar it is not possible as some BARs are 32bit onl=
y.

This series introduces a platform hook that lets the PCI host
bridge driver rewrite BAR addresses at vPCI init time, and provides the
R-Car Gen4 implementation that adds the configured RGID into each
address.

This is sent as RFC to get early feedback on the approach:=20
- Is a pci_ops callback the right place for this kind of address fixup?
- Is platform Kconfig a good place for RGID related options or is it better=
 to
  put them in some other place.

Mykyta Poturai (2):
  pci: Allow platforms to modify BAR adresses
  plat/rcar: Add region id support for PCI

 xen/arch/arm/include/asm/pci.h    |  3 +++
 xen/arch/arm/include/asm/vpci.h   |  9 +++++++++
 xen/arch/arm/pci/pci-host-rcar4.c | 15 +++++++++++++++
 xen/arch/arm/platforms/Kconfig    | 21 +++++++++++++++++++++
 xen/arch/arm/vpci.c               | 12 ++++++++++++
 xen/arch/x86/include/asm/vpci.h   |  6 ++++++
 xen/drivers/vpci/header.c         |  2 ++
 7 files changed, 68 insertions(+)

--=20
2.51.2

