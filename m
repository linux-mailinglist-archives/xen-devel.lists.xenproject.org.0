Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOf8KNJlymll8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB1E35AB77
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267449.1556939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHf-0000JM-FY; Mon, 30 Mar 2026 11:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267449.1556939; Mon, 30 Mar 2026 11:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHf-0000Hm-C7; Mon, 30 Mar 2026 11:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1267449;
 Mon, 30 Mar 2026 11:59:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7BHc-0000F4-WF
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:59:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BHc-003QIn-8F
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:59:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65a8-2eae-0a2a0a5409dd-0a2a4509bac8-40
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:52 +0200
Received: from [52.101.66.84]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65b7-e484-0a2a45090019-34654254c0bd-4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:52 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6847.eurprd03.prod.outlook.com
 (2603:10a6:102:eb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:59:50 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:59:50 +0000
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
 b=IXKq9730CIG8FDs14n6+zIQP3QWBKuUeE9//gOy6VPERJ47vRa6VCMJ4fPuWbPXtCT3XHGIO2KHfvOMho2d8dXf1qHfbG8DmefpI8y0HCIE55Pjvc95n06AMPyy8TI8xxgGg89L/tiXimI307krVDafL2YeC5++G605zg6AWiMz7bbB7xgZtcihblLX+UZLNF6uJ/CdOoR1TaEXG73iKSqRI8kS9enclgKutv0sGOcdnSSFP/5UuUEy8GuGS+3DJ8juHOlW+zys5ra5KT8n8tZn7W+szyYu//ouyaob1agGQtIpk8C1bSZYk+vt8HAc7a5RSH3mIkth3CGLZYvXZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1iQlWpWUlX2W69fYSmCagQKGYvJZO6E1KFm/axIUUg=;
 b=g8ov3+pshNY746ORxGglTCSQNSJXjM7mwsVFK9EUrb5p8EDd6919GA3u7P+ULvEaQm6uAv774O/fyP5DMTEzR/VTFT1lof3g9NxMdpbMftfNzAF+lysxqiuaZAGLLpYPt0RyKuBxRQvcwML5WrAt8TnSYYoxvwrrp/0tkn2kXX/LgwQ4eWFj0I4tNhn5cIpwDR0a7Nrb9VrDZh+sBFIkHbsnrACJuFUgw4DDQIQkvhAzNs8+NxkYEt01qcpGk+/Bt0Wwm1x2BVgswpMZ1VlKdg575TtV5H4kPluK9VkjZoEoW3y5a4Z6X7yy5WLE1JIcdEaOvMC5+Xt5YDdxuz/7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1iQlWpWUlX2W69fYSmCagQKGYvJZO6E1KFm/axIUUg=;
 b=DvL2aOqrRNw73RDbq7Q/Sx5ZJCzV33PWcpajV+fIi9Q6VzbzmKBggdkWlVvwVrCtsfYsvyL/Ekh6H3laI68IPxWeYVi6BWjmyfCxXFL6oeCI3kj6s2BYjVTV289Yx5JM14/gNkm0imJ5NXuPzjvQvJBaxvjFY3+0p1nM0fHOvsEqJ62FS2KOhqetEyR4YYYket9YqVEWfXD6KTIweFotVw6JssyDAnKWf2XXLfBGFa3J0z5R8AEMf4EP/O5lp0YH1khV37qcje3p60aay345F6Br0mX0amMYOVF5r8z3H6E6angVLAREJOrRUw63kwbF0hVvk+wEor3Q0iU+BqLmMg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 1/6] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v7 1/6] arm/irq: Keep track of irq affinities
Thread-Index: AQHcwDy2nbDObKGCpEa2H43UsrK34Q==
Date: Mon, 30 Mar 2026 11:59:50 +0000
Message-ID:
 <0ff697dc791aeb6c2a44db93b862ec381a1e7468.1774871881.git.mykyta_poturai@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1774871881.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6847:EE_
x-ms-office365-filtering-correlation-id: be2a7249-5093-41c6-186a-08de8e53d8b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 gnBdlEtCEzoZajGMVs650NqjZddKBJRCPWOQvPVytpSzXPrPDTU9ePLwMSF+3vzD3LGVAM9QGG3yYcVHJY7+b7h/gclyAWW2ZBG5kKtkIAo/EXRwBwttgBSLO8cqKHWGsUvJlwwWWWgs9AqjJbk4qyjykjyHpmPlNv30fC63T9jb46MaPhBZ09EM55WZwxDe8OjliL3tYMc5vnA3pwCbtADLNaWGG+sx7WC0f48FTaG/K2ocDXH4DtmpSHBL2oKEUqEVRCaLPHLYIwiIN2FHp2d5iGFMlci7WT37isH/dQWnjHh0FQG2My5Y85LApPZBmfwspmlsfNxaQmI9JiWryAaRmgvsMp5LYLkCouUs5k6QN8Frm2D3misxTDYg0cvDmsaN2O+/S3QS/ZhGxmZ7Ap/YrIEAvscof5JSzAme/p4tXy/SRpwP79hXNEdsQM4TDrfu45QWYbJds16ktFli0wb6cWDdZ2/T1XEc+c3RBveLGlyOnet9m+ojBWM9pAb6CGtpVbnbvLhmveN5gLu8QUviwTO3ddV3q84bO9nr+QUMstkfvUyBVeRBWN9tTs3JeVpge/LofTxNl/XOo8fTbOxGm0aPQJ599AE0TdpkSK9/HFUtOX+P339NW3G3nnByQ0MOZaHlJZl7iMXdG7ow043snTUzgIXfwEIe+omNTJ10yhKCPnoL8v1nEMUNdtGNa9xclAPISpUKS0RRQnVpq6e7JmbeOKF8MIswCXLsJkyCVusxuuxXK6wrnuCz/8Yd46M7998xter9Sk3hQpdG1fpQkXMQanDedDuVgR/pFds=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TuSvTM3f6ViM80kTjl/9Z+e29tfyMPyps358Ahtc7FnNYkwcqav+kcro3c?=
 =?iso-8859-1?Q?AgIZER/z1ALKyCTCfQINEBoRPE36CtD3FOxdkRFJKLnagHHKWqxyFJNIaP?=
 =?iso-8859-1?Q?9DacwkpS1Zg7+RfaxE2yEjM9oEwwCEV9BybTckx+SBF+EgkfJ8c7PThTsX?=
 =?iso-8859-1?Q?R5yMPldfPRLzkQ+RYsJEvIWP7aOzuAOoAf41R3Zhw4pGpMbf+5JrTj54uc?=
 =?iso-8859-1?Q?EiM/fxN4GZhuueJRfWJJNu9dueup+xMOWtP7IxqJuz18bNJ9gpzp6Ho7sa?=
 =?iso-8859-1?Q?HqJ/vxtyPpZL4jSP0c7sefkD4cQx03trFZx7D7242qQlgrButyow3iRXBU?=
 =?iso-8859-1?Q?+CAs7CpBhwgLCj40jka+xjk4w+aX4QMIDHPnB3eZQLYBdXuz7gvY8l49IQ?=
 =?iso-8859-1?Q?CAC4lXtW77+2025USmeXZheaNeTdlzzahjyyRbqsRF7pav9PFuqRVS1jKN?=
 =?iso-8859-1?Q?KMni4NCxMg/Iek+5CHnRuTzMgr3+eEuclNC8XntzjQrgZyRZ5JOk6Vu2y0?=
 =?iso-8859-1?Q?90/aBIgQ/ItgzdMFiz/ETw/MFUimS2gOO8Qxa3rYoxxtp9eySKhKaRhTdt?=
 =?iso-8859-1?Q?qUhOCJ4vOfSC96qoOBAl1o8HAsEkF1G0mpz47sBfhTvVdyjZezs/c0IxDS?=
 =?iso-8859-1?Q?NJXCOj196UrBVebNX8g0S+IKNN/6b/IYsUpEnNEPO+pnKOwWf7cf/jND17?=
 =?iso-8859-1?Q?PKw8aAua63VXYb+ZEJnsvBC7t8clr5aXItG9xZQKFAgY86np3bXTxkbsoA?=
 =?iso-8859-1?Q?SYrwLY4bN1sE52HdnJdW2QjE2Ikc929LMyp494Rdnsx2DGvFo2Yi+uQYe+?=
 =?iso-8859-1?Q?xqmBqv56kNfDmeMIcLfKZR1e0gJ9h6Wx/Sd//qLpv8j9YhbTWBOaWd8fR2?=
 =?iso-8859-1?Q?rZZ61EWLiSyv805IixHA0xoOEkI5Y0AghoQ6F7/j9FSRPEAdfX9426285w?=
 =?iso-8859-1?Q?n05JaP8CP8dfpY0rr6P3fosEQK2JxACZCfTuf6GAPnl2FxRCp/DVn/cMlN?=
 =?iso-8859-1?Q?czmVvAPqkv2kiwlARGVW1kMJQOcpJ3wdiUbDT/OVQEnzooC1Ct87zvpbwF?=
 =?iso-8859-1?Q?affhfLqn01PFxbKORiEBUYqwHVmHc0EZ0P2qr+4dDpIpliLL+pE0L8qgYF?=
 =?iso-8859-1?Q?umN4C94DEP73IdXY7wp+W29Z+QMJYyV24ztGAfXfCb6wPa6Uo1LUnI3fAf?=
 =?iso-8859-1?Q?wxTc5ne0aBxXLg5fAIY2/xPbBIAt3YmE3MS/JNaUbWJhumCxWl4yW+62IY?=
 =?iso-8859-1?Q?5JoMbKKBccDtpb/JHWtCmQ5JPdmKmf4RyDkx724NWh6ku2WNx5abEe2tox?=
 =?iso-8859-1?Q?AlqEu8zpjetaSnwpnCJY6GTgoGN/1N6gWE0rQ0LfAqRmOU90OZk3QeLdHJ?=
 =?iso-8859-1?Q?faWjpQ6DCqvac4l/0MRcxd8JcTcsUHvBI8cJNHYANMFPJgKbuO15eoQdaP?=
 =?iso-8859-1?Q?cX3w3eWzPhEPsqn+sTweKbsAkwUrJG2jiaQjBpdv0foTfpwy9Mu0ZzpzI4?=
 =?iso-8859-1?Q?S6oCCnc4psfe9kZcmU7NL10v9HMj3eYOw/3zmY+TLPKVNp5/gf0UcHXXP/?=
 =?iso-8859-1?Q?u2UBLaWhIfOG3LqWXYSlCv6q6cTy34aiDLVrU2WNL20eti4OstNkqT6pmS?=
 =?iso-8859-1?Q?jR2KKbFPy4ivyll2t20xteGcnc+w8YcUA6psT73QVLpVRaQOAMoV/aiYTj?=
 =?iso-8859-1?Q?p6NceTLZ+Sk7M//7crq9oS61CDz+F1lAZUnoqIZjUPD9lodUZ9BBjlOFel?=
 =?iso-8859-1?Q?qv+m+gWRIopca3IAKDISjfKlrlICsl8jsPc0Xw5joHwadIelMz75maFibs?=
 =?iso-8859-1?Q?/FkeU+YdUw5cK+WTr1pIgBYtCgTIfDw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2a7249-5093-41c6-186a-08de8e53d8b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:59:50.2131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTQ6777rsV0tXglTjQKIm//O4hlULHrdbL8t16ASMvrV4G+rhd+2JhZL83A3bvIYUePA1C6olV28loJqq4O45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6847
X-purgate-ID: tlsNG-bad1c0/1774871992-69D44A73-30B83DD5/0/0
X-purgate-type: clean
X-purgate-size: 7495
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1CB1E35AB77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index ea48c5375a..5253caf002 100644
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

