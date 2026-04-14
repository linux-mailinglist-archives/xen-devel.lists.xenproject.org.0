Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJXVFQc+3mn6pgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:15:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97463FA62A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281749.1564625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdbq-0007GM-Eu; Tue, 14 Apr 2026 13:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281749.1564625; Tue, 14 Apr 2026 13:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdbq-0007Ek-BG; Tue, 14 Apr 2026 13:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1281749;
 Tue, 14 Apr 2026 13:15:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wCdbp-0007Ed-6H
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:15:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCdbo-00Gb5n-Ir
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 15:15:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69de3ddb-2eae-0a2a0a5409dd-0a2a4506e278-34
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:15:16 +0200
Received: from [52.101.66.131]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69de3de3-0df0-0a2a45060019-34654283cf67-4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:15:16 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA6PR03MB10362.eurprd03.prod.outlook.com
 (2603:10a6:102:3c9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:15:12 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 13:15:12 +0000
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
 b=vMfjnYpvUVNWaqzDn+esEaZ/6/0h1NcteXl2Vwal8EDmMO33ROBUwz0sKSgJLBfXxQeUtCCCtbE86c3F1Upl9Eg+JxZTMIimIYZnf4ZqO64mVGcywEE8/QSREXQ/5RxlefxJr/na621LBQ1RUu6bAHjI86xWh2qx4xz+zG/iK0xpGYZdp+3nWnm6kI3AgJFSwbr+DmXo/tk+urZnclVGhVk87S1wpB4TTNQEjCoak1OPoEVsUwmSpRj8UFgmOK3nVsl0fNOjJqNGScojpbO/3w4ZL4I4Vevvdq48R638jv2BuI06fD2fb1PGBgT4lONTxofuKBwfPX72ZF479d3slA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qs5eBLnzDjr4kf7mQODZBSZ6PkjvoPt+M64D6wbMWaQ=;
 b=eBVYh5g78PkLIzSbVvfB5uLkvEcv+RNCUl0SaXXeTyYfSLrMgcWArU7GhuRtFxwady4u0cQBFoaRwPqKSvJEN10TUTCoreHVKIyrVe+LoB2silH51ZdsPGUM79DHxbziPV3O3T0UzyY187KjJhPjE4QsRlgj58+kaBFo6c3XF/TGKDj/QIqGZwA/haOkq9IMDc62xF+Ux9a0AsL8e8+Il3lhL6A1fsxu8CpqRKzd3s8kz7wzKrMD2Xf0nMvwGyHdiEYDSpKfC4EibfuQNCAww40V6R9FPTaAgBFpyKyjmMQgGlmCm1MmuCWFhJprxcleA9l8Bt1xtlvK5PNl1ay9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs5eBLnzDjr4kf7mQODZBSZ6PkjvoPt+M64D6wbMWaQ=;
 b=QTrq3iH1BqPikEoAyTeqxDTXVmEiJqeYh1MBlB/M896WFeDc38HAXXIU+SDhkAjAAvwFhUrbuh018e/GNDPa0ZDz4Bxo69jXXMiMDdt7yeJN8aHC0Tzf4XplPMlFBxdOEdUl2egLnMDnzCZc1PTShilUpfu5Fq7rq53ORjUGPBJnlsyLws6x+PH8RLNF8UxR3L/Y6tXCsv4TYTyoAHld/Of5o8p/2ZrOn60W4JnN5mWMpA3JwLcxrGqx6bYOQyBonvD78ctqXEUCBDTvtJcXYedz8TGxJiMUkuVQS6dcJ2/OrTnXYTs9Kx6fCRpKfCY/yUUsfFrKu6aYXrlBB6demg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v2] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v2] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHczBC6OGp5DbFlyEyismnWkcVdqA==
Date: Tue, 14 Apr 2026 13:15:12 +0000
Message-ID:
 <da128e8fb41add9efc30860612786cd62f21addc.1776168699.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA6PR03MB10362:EE_
x-ms-office365-filtering-correlation-id: 4a07abd4-df28-4f4a-e4d1-08de9a27dc8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 umcfbcw1gcLsBz+TdKy3wkLRv3itsO2VL9V3xiHgdDCMDICFGZnZm+CO60gg9xCsEoVMZJZJN4yJpORJ4EZjTocJSe/WVRYCD9uvhpBL41SkamurJCjH18i9kTeCt1o7cTl1wZ/1guFATLpRXTc/vOrKQD0quufhGlb9YRz5g4T0PCgTUdcMQvIpJveivyIoC4PaqFBFGo5XM6xLik3GSwIbee1bg3BHNi5uJNNq5GU9zBE7R7N3+JYv1C5Z26SZQcq5MV8sH7TmdFNtrIDntnBNAFL4h6Aw6DbT5glVIN6clEwE27hoqs5PJVXbosBDkiL9+6+3ZalJ4Dj2UQu8QC521mzP8Nlhszx87Vddn19/jwaBJBSK5U5/zPSihNSb5CNzWtAmdEiDJNTRHfkVXXAf706FhRm7ysVpBnlVeeQj7lTFUYK0dwZYTmWPjUdNQc/hPW507jd0plj3QVj0cna92cP6Gj9pfRyw5OZh0MZPIHvHPe5YowkVrVqi+qjHJQcKGhcFiyBXzcOZttOY0+oJJcsx6G2EpFgb6zMA+tXsrU66z+GhPMaKOygj+u4AK1uf3hc+l78skQSfEmZxb7Gkn5KML3lTMau3c1BnO1BejmN9Eo0scY0gq03ezn43NS60pFElD+xwL+Hue0pPpfRmEvZ17yLAeTavpsaowaQFZqTLj8QLAp5gbdFxJjPwOI4vCZ53KxNyVf/i3UJCaqpjMJwdndW65P7Bb53x/mYbZfTisd/LTeEvJBwNhCil
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?80zq/OCZlxv/ePzuZmEuZCGmlZ+opf27uwzMo4tLkFOJvy2SabCYY/Uq/h?=
 =?iso-8859-1?Q?wG+6F5HgeqtSRys+8wzIyT2HfJYRwwFRtwY2fjFT0RsKyu2Ynuw8AJz+a+?=
 =?iso-8859-1?Q?Jex5m+XwPisj35EDeb+ak6x99ci0qgH2Dlts4VFOx7/Sf755PJNc5w98ig?=
 =?iso-8859-1?Q?M+pcqVolPunKeRc4xTEzFVrelqgESpE+OAeVLb0sXRNJL0tfL2FqyC3PYM?=
 =?iso-8859-1?Q?ddcrJGbKhTruRFEVhQVgpHnzqjKxbYrLtUkpdiRyjBG49wN51MOPhDpDpD?=
 =?iso-8859-1?Q?8v4WaBeRvFhtVGdRTzNtP9uknhmntbE+gkwWO5pE1prToKKyFgelTR4vhx?=
 =?iso-8859-1?Q?F/Kq5ru3rsav7hBtyv7GLaMYMvWlLXFQmF0NMx6WcIgxLu+8Qrv/oxViKW?=
 =?iso-8859-1?Q?wLU6PcX5LNbYOPHJhmIcIdV9NAZ4H0zAc+sDrk1npWFI1f8hbpxvAW2EyR?=
 =?iso-8859-1?Q?/US1u7eCtRQxlAzSyBkP2HUJ7U84BwJteNIidjMEF3Z8K9iNdBIW6vKLLG?=
 =?iso-8859-1?Q?EhUG89eS9namRRA6JkIe/5rw1oE2dkJ8QDyqL1FKZNbD6LoOEv33zbcZ4G?=
 =?iso-8859-1?Q?sAe+rzZQRzPBGEtYBkjPHYPuYF32VzzMsvw8DWH31vuRm4HlxNI/cnniDq?=
 =?iso-8859-1?Q?U1NdP0dTvPW55GtgwDuNfV4bwAmz2wCckBZe8Kw5/1H3AC14lhd3ucNji7?=
 =?iso-8859-1?Q?GqzQKoehqbZd8CsaHIcansIh2ZUPUDsCnoGSbhVvoWJWiZLJX7kc5Q/E5S?=
 =?iso-8859-1?Q?+9+YWzZUWtxVSwqmMLfjQJN1K05hnOiSyDAQZatqaLqV+UMG46CIKe7O8q?=
 =?iso-8859-1?Q?WYLxB7/VTr28vmWBDTn2CmTpRCfva41sDVDo8Z4gEUvMP3XWJZ91YONvXb?=
 =?iso-8859-1?Q?6Dueeug+0H0OlHA4PVnQRMimXoT0quL4l8LJ0aMEp3txZ5wJIxfut5hhY6?=
 =?iso-8859-1?Q?CQ08x0Xwr+G3WOHA6C6iJxNXzmB2hvgtNr6JTFsw2jODm2djy3uJUTeqT9?=
 =?iso-8859-1?Q?9fbfPfbsQVQUZlKpTy7BxjclaBhhnMz9gZzL/xmRJZISJ4Ag5KLHPL33DP?=
 =?iso-8859-1?Q?CHEeM5H7rF+fm/yj6DZo6FEOUl/QPuiZWzt3mjAhmYgLUgpQQh+PYdclue?=
 =?iso-8859-1?Q?ydbOfUhHfNG/L9F0JVqg2Q1nSQsFP+a+PzZjSOBXAUJLTppEwvoVHWyfaz?=
 =?iso-8859-1?Q?KQU/eMtqBOpYG/kP9kmyQ2SJUnK0rQ9Icoy2rgHKHEr6PxGSFymHIJR23t?=
 =?iso-8859-1?Q?dyMa1Tz1c+aR4di6y+NsOZP5NRMWoGyPsJ6qLCcvhHJLBF55/wOUwL1/E4?=
 =?iso-8859-1?Q?3Buc2fnpd3GXoKhD+2ZVCVYKmUjfxv55hPN9d722tsyU3gveaLafimLIjl?=
 =?iso-8859-1?Q?f973YeMdcLwrki5c6qDbtu1eQNyxyj97vQqBF2WZWHd+lkWjeKDuCSVOGO?=
 =?iso-8859-1?Q?hZ6vJLNQ1G3YL3Hd1V1yPYlIYvHBFq7TD9fP6DjIOui4YDE0cr1m4CXluy?=
 =?iso-8859-1?Q?kZ3fD7YFVEsnuCAdvf4O1fwZT2fwW0xAylnCWQ4kgRXHGhrjQrTCPlUp1Y?=
 =?iso-8859-1?Q?fahyo1EvzCL0pHq297dGMF/Aua1fITEnlk8j63whye63dYUEHiLTofQr/d?=
 =?iso-8859-1?Q?EjbSXwqEMgHpFgMei9gr2XY5VReKqQ4r+FyJbLs/FITl4+/pHLq/KG3aJR?=
 =?iso-8859-1?Q?u9XUJdDdEgwYJymmJ9asdbP60y5vqssESDym7do4e0SxpkiSCH/bJBSc3S?=
 =?iso-8859-1?Q?Gzg44ZA1cY1OgNn3gBgMHETqaVZtIBO7qaIEkb7QFtp/6T9PL7dTNbq6SW?=
 =?iso-8859-1?Q?v6OTYlEDmyY8lLoXehr9gYhc2HCG11U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a07abd4-df28-4f4a-e4d1-08de9a27dc8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 13:15:12.7335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKgu/Bf8Zy2kOPQi/ipex+d2mKen255zwhysMC0MNXo4pEWc8A9uYXhPeiGIuHhJl8yihGjW9i8swKu/hQjHhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10362
X-purgate-ID: tlsNG-16d1c6/1776172516-6484B3D8-2F745132/0/0
X-purgate-type: clean
X-purgate-size: 5618
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A97463FA62A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
most of the work by disabling ATS and zeroing STEs. Additionally, unset
the dt_device_is_protected flag and free no longer needed smmu_master.

Rework dt_device_set_protected to accept a boolean parameter, update
callsites.

Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
VFs.

[1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.co=
m/

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
V1-V2:
* check for phantom functions
* simplify pci/dt device split
* improve error handling
* don't try to free master for unprotected devices
* rework dt_device_set_protected
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    | 57 +++++++++++++++++++++++-
 xen/drivers/passthrough/arm/smmu.c       |  4 +-
 xen/include/xen/device_tree.h            |  5 ++-
 4 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index fa9ab9cb13..0648f9b407 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1367,7 +1367,7 @@ static int ipmmu_add_device(u8 devfn, struct device *=
dev)
         }
=20
         /* Let Xen know that the master device is protected by an IOMMU. *=
/
-        dt_device_set_protected(dev_to_dt(dev));
+        dt_device_set_protected(dev_to_dt(dev), true);
     }
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227db..8e080cd7d0 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1493,6 +1493,60 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn, struct device *dev,
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev);
=20
+static int arm_smmu_remove_device(u8 devfn, struct device *dev)
+{
+	struct arm_smmu_master *master;
+	struct iommu_fwspec *fwspec;
+	struct domain *d =3D NULL;
+
+	fwspec =3D dev_iommu_fwspec_get(dev);
+	if ( !fwspec )
+		return -ENODEV;
+
+	master =3D dev_iommu_priv_get(dev);
+	if ( !master )
+		return -ENODEV;
+
+	if ( IS_ENABLED(CONFIG_HAS_PCI) && dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		d =3D pdev->domain;
+	}
+	else
+	{
+		if ( !dt_device_is_protected(dev_to_dt(dev)) )
+		{
+			dev_err(dev, "Not added to SMMUv3\n");
+			return -ENODEV;
+		}
+
+		dt_device_set_protected(dev_to_dt(dev), false);
+		if ( master->domain && master->domain->d )
+			d =3D master->domain->d;
+	}
+
+	if ( d )
+	{
+		int ret =3D arm_smmu_deassign_dev(d, devfn, dev);
+		/* This should never fail because we already checked the domain */
+		ASSERT(!ret);
+	}
+
+	arm_smmu_disable_pasid(master);
+
+	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
+		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
+
+	xfree(master);
+	dev_iommu_priv_set(dev, NULL);
+	return 0;
+}
+
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
@@ -1571,7 +1625,7 @@ static int arm_smmu_add_device(u8 devfn, struct devic=
e *dev)
 		}
=20
 		/* Let Xen know that the master device is protected by an IOMMU. */
-		dt_device_set_protected(dev_to_dt(dev));
+		dt_device_set_protected(dev_to_dt(dev), true);
 	}
=20
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
@@ -2867,6 +2921,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.unmap_page		=3D arm_iommu_unmap_page,
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
+	.remove_device		=3D arm_smmu_remove_device,
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index d63c901551..4d2f71f152 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -825,7 +825,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smm=
u_device *smmu,
 	if ( !dev_is_pci(dev) )
 	{
 		/* Xen: Let Xen know that the device is protected by an SMMU */
-		dt_device_set_protected(dev_node);
+		dt_device_set_protected(dev_node, true);
 	}
=20
 	for (i =3D 0; i < fwspec->num_ids; ++i) {
@@ -862,7 +862,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
=20
 	if ( !dev_is_pci(dev) )
 		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks=
. */
-		dev_node->is_protected =3D false;
+		dt_device_set_protected(dev_node, false);
=20
 	kfree(master);
 	return 0;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..76ae1e674a 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -300,9 +300,10 @@ static inline domid_t dt_device_used_by(const struct d=
t_device_node *device)
     return device->used_by;
 }
=20
-static inline void dt_device_set_protected(struct dt_device_node *device)
+static inline void dt_device_set_protected(struct dt_device_node *device,
+                                           bool protected)
 {
-    device->is_protected =3D true;
+    device->is_protected =3D protected;
 }
=20
 static inline bool dt_device_is_protected(const struct dt_device_node *dev=
ice)
--=20
2.51.2

