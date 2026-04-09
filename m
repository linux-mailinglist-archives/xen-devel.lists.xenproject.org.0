Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HDxLlix12kORggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:02:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755053CBB71
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277471.1562657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwv-0004Mr-TK; Thu, 09 Apr 2026 14:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277471.1562657; Thu, 09 Apr 2026 14:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwv-0004Kg-NM; Thu, 09 Apr 2026 14:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1277471;
 Thu, 09 Apr 2026 14:01:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wApwu-0004KE-00
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApwt-005jok-67
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b12b-e002-0a2a0a5209dd-0a2a450ab160-46
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:35 +0200
Received: from [52.101.66.132]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13e-ee98-0a2a450a0019-34654284bb10-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:35 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA3PR03MB10964.eurprd03.prod.outlook.com
 (2603:10a6:102:4b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 14:01:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:01:32 +0000
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
 b=u0Gw3SG0rG+rXP57aIcJs3FSDlAyKTjN3tdfPjprLSCm8zrgPKnXXC6++meAUHL9MiEebo0+340debtDOaQiE/N44/AmJZXwjHldOASTlerpnYDWWj/6Da6HsSaPd2xS9hxEk26F79EqBRbLRxLDfL/p+QzXB0td3FkKaUNxZqVMyoEbqlOlB1wivYi6FnrhKXf/oE+PVNpomT6imBnAXV7nu9S3sjDhC3/0B8gMa3d8zpqt0ixnK3t/XCRP/jz7SYyK7hrAlkr7yLABq1+qx1cGbS8VCJjnOzrQ+vs7lhEGIH017cUXwM0XOuK2GY2bJhOibyRWIddepvBGMqezWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjlKN+hVcv4fDStYjwfvo9IU/5C6OQvkDnHA+mRGcfQ=;
 b=qCJ3AG8WyTUCF2ZECa0OxRN33HXfRDKgbfOJ5mYocoa+ZUYakF09SSRgUqJg96OcEYS3wU7vCh4ROdXjT1mXCPqwF9UmsQs0gs8D5+3T3JYzvCooll05carOKcnSJdvMC6lAns1xq1AGpziwuwx1pwxe7YhHoT/5y2DCLAc9vFQkt9/6QJaycwGSbg0GaC5h66fWCPsLyh15bHFfomgcsctS1v/TLgkfcx0K0y6XLnE8hDV44oesCPJHbiEUPiHpKTD+4cvfUuQ57SzWUDhyeUX8V/VkhIweEWBBTIIIHku+DdjDV5Mp2eMoqjIK1OcO1GjX48R1CeYM96FiL3LDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjlKN+hVcv4fDStYjwfvo9IU/5C6OQvkDnHA+mRGcfQ=;
 b=m5ywkjmTMVQJQnLgtY96eGgqWJUQl73IcCUNs03AJz1zC8bpWnmRXyogBXg4oZjAB4fhnA3TYyfhetDNNhexP5uJsdO+tE1buAL0WmaqHmWd0CqHw/dsaJrzsPeUrkSp0Ira7SaMNJ0APh9B47+ME8CfckBy6yQUxocpo+MYhV4GQSn8FCg5dGo6Evo73ajbw+BH/Rw/xuPyu5yVtXx+DrEPSyW8LkuiwzqpBdO4mlZr4FsdfWLkc8DOx8ATHiLduZzcoLFVplmdaOU9+2eWlujqylSjXYFvEH7GUeUzXe3trP659oPG75JmR1Cs/KKon3WDNapD1BRrI+M0o9tkaw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 1/7] vpci: rename and export vpci_modify_bars
Thread-Topic: [PATCH v3 1/7] vpci: rename and export vpci_modify_bars
Thread-Index: AQHcyCle4fajjYJKo0m49i60rboCMg==
Date: Thu, 9 Apr 2026 14:01:32 +0000
Message-ID:
 <f9857f13c9dc7c1e0a0c93cb0651f797292b04fa.1775742115.git.mykyta_poturai@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1775742115.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA3PR03MB10964:EE_
x-ms-office365-filtering-correlation-id: 938b6f27-9ff3-4b7f-7e16-08de96408180
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 tFrts46u86fOoVp/bZdws/HCAbhkAP6gV83dx7bXJO9dYbGSowu7lvv0cDn6y4Hrly/3BXgAFmcPp5SLx6m8rdm7Kt0eiU241U2JPRdRSErwxU/AxkURoa9ZEz7CufFQ1qtXIDdrOjEUuKdM44CPFMBDlr03ED/1ie3Z/oeErjQGadIpmc1IcfItCPhum9CdkomsPgCsgzUNz0DKoIvlN9yu/hJ7ohcX3lRvusoWGRh12k+LRH6uKWScgpyGjV+zTaiZuh3ozLSK9nc3ZPoM0ApPw6kO06zwsA4RuYamLLI1/eg+Pa0qrxzFflQsrgRgfaVaoGtnqVEEKDl4msq/op4X0AHPXfgUnJ7V7pINnLItNUPPJLWJ+LgBpKHhUD7JMDjq0I/h0ubHlaVyBX4Mc9hj/SA+5bypIK+db4KVLi4QnmCKkphRc4d9rjjz83fCdJr0BWuuUQO4XYZ7xiQtkwqr0u8NZKDCtKhXsY9qkjRKKlEdnHLYpE0Zssmn2r9+EZPkCDTI++VvCVJbVnXSrwRWEOxoB29uWaN9Bsw5j42S0bYvSCUtDbhLyzmCLck3tR6f4HML8fZLFZ9+FtU2e2W2xhow34SJ1QEl/EDKR6sFagaf1XgDAQNmH4ZhbPsw9U0t3w5g6GwU1erpjJSZ5Trx3ABOp7UCPEMczKyG/9DUr5JvdhiWzJjShHriAuDrVbg3eQcC27QSn9aj64lbVgk85oNZuu+mz3+TqaIUqXjTIt9o6Y9wr+YoRnCy60kw95bUgt6Mb3IrAHPhPKXtyVAp55EVSP/ypszIcJLLkGE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ttVsidU+SWgFJIAjA3FaBuobvfVGnTL2D1JpNwpDNMKs5NgLy5aDIm1K7H?=
 =?iso-8859-1?Q?3aSc0mND6p3YZJF/fKrvWRLL1SbbVZi8j5ekovsCAWVDg0QDfaDk7g4u4f?=
 =?iso-8859-1?Q?5hoGCaIe0sXArrLHXcGTgun2vtHorsHVGP0VxeRoGOxLBZCN2st/C6GQCg?=
 =?iso-8859-1?Q?0I9BpleskydoW8vAkgcJeUqZuEgjMZhVvJoEm3WkXMKRyCuk+D4n2IW1yw?=
 =?iso-8859-1?Q?gTlJOzxpgUOQo3ad9rJ8KOVSUwAA+WAsDF946jGjP6Z/Xm/6LyrsBclLSd?=
 =?iso-8859-1?Q?JzO8QcUlHFgefZ9IrxK68IhLrYVlOOCblU7666tZHvStk+cfSwQEXr79yc?=
 =?iso-8859-1?Q?+cguIDbhFXKqTdfrKwzpZmqaDZIlBOvvAq50bsccj4DaFL2Iy+mrB6PP5G?=
 =?iso-8859-1?Q?Rm0DwMuBB+OcpSRbUsC1P919XWBBx+GVUiOiBSKcpC3+bFN91i5mEUVfJh?=
 =?iso-8859-1?Q?IYt/4UbMWu+6eVUv+nTsZC2i5U4b/rshJvePAzGLt3uHpLy4lzF4mRUCJQ?=
 =?iso-8859-1?Q?sAmuxAoykbY5pWiIEGCahIhMm4M0tAmlLLp3FUwimfEIClMHb38TIVE1NA?=
 =?iso-8859-1?Q?xnWYyqA/lawelw8AjpCV+b7TmIbfpcH/bkOETmWP2RdcWAJZlLcQyZZ6hV?=
 =?iso-8859-1?Q?osCfGQsIXBL9d0zVc1IP6I5IAAay4gWyXXO7GExuXKZKoq8DNH+MLcQnO6?=
 =?iso-8859-1?Q?NMYA0nNG4XrTr+f2XgLTKUxEBcIite0zyOmt4HwojXlkdoKwsE/AOeeiPR?=
 =?iso-8859-1?Q?G+xpUSMZE64OGYHRhKG0e4K7v1PGM0GF6NeMpLJDLlwNJdOM97Tel7Edik?=
 =?iso-8859-1?Q?NgbC2ar+OYjRZP69NWPVUP0xpiNgeq3tNKkRMX0wlDEKLqOTq3mRgwo8XI?=
 =?iso-8859-1?Q?JjwBRqXmBHFKPaYb2BymOAOm3FzpVhpzBswn0osl3CJc9fXwd0lEC159R0?=
 =?iso-8859-1?Q?mwEgzrqdEYxy7ejtEeNz698IG3Rs/x5BcfyRiO1CbBfjTFLW774WyKRVi6?=
 =?iso-8859-1?Q?M9MeyzTxuNHUgNLmVsGhRwjrOigO4J2VpVPCv9uDVgf/AwghUbq+kzllRO?=
 =?iso-8859-1?Q?tb536O1teAAaf6GQjVzcVGmIeHW8JUhx/mv8WHdmygXEhC002yIdgy3tBu?=
 =?iso-8859-1?Q?NwvhCSp5MmQJfI2BKJFXhTl2cOILirgOwfwtHnUSstuX3xaDfu8+nvx7JA?=
 =?iso-8859-1?Q?SWE4XFZyJ8C14j3IZtPfV+aJIGbxab5MzMHv4RgDxSe8b8DhRkdJuJJecc?=
 =?iso-8859-1?Q?zW0hAnhb36EczzQKZMTTEzlzR7iRARw0Htc29msgcZnVLuizOj2icPWy21?=
 =?iso-8859-1?Q?sDJNx4Oe0Hi9nn8/S8s32wp8PVOTzjbY08zlL15RWUx4S1I9hqDsHLPEMc?=
 =?iso-8859-1?Q?lppqYLBYL2F1kjA0GAi4dOwget78bVDPGutiO6dd+ST4avore3eTGHFy74?=
 =?iso-8859-1?Q?kBYXPS5P4MSjWYMWjrXlmPrb+oTPuhiUyDX9pGYhnCaPQJY4FaV6U+VHFJ?=
 =?iso-8859-1?Q?YyNqvDl43w5k1vr8ArtV7gcbgXmADIaVpLZJDdA6qBxa2CFP3x1AYavoRf?=
 =?iso-8859-1?Q?gUkmKCdcZZxuwoPX9KLq00taB95l03HweXpuMxKIjXouZVu8S5ASGe7ATT?=
 =?iso-8859-1?Q?i8b09+Av3IxwtNgOLWLxmqPRt6TGfKpl0I0sAFitehgMmewnWUuB/rOMks?=
 =?iso-8859-1?Q?nGLvteGKWOGTAFHUirJVYvA0Uy+2QInE/+zEwDLiY+/Vq/7cFwShGm4S0L?=
 =?iso-8859-1?Q?MIOHhwm7VMoklopvFqsYOkn0TvLG1e4QmxlHhuGvsc7pxckk2sUKhl1R27?=
 =?iso-8859-1?Q?/V3ziYn1LfKSE78PX+nvxBA1c1oyk4c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938b6f27-9ff3-4b7f-7e16-08de96408180
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:01:32.5739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ia4w88aADiQ0w7lukqEt9lYZ7t0WeJF6yq21Z0LKg2N7fSdTkPVP5/Cbs8XBdhvLGWKbb8LAHV8Hy2wyVipKtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10964
X-purgate-ID: tlsNG-4011c0/1775743295-BFB450B1-5FA90408/0/0
X-purgate-type: clean
X-purgate-size: 3963
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 755053CBB71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Export functions required for SR-IOV support.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

---
v2->v3:
* move declaration to private.h

v1->v2
* Collect RBs
---
 xen/drivers/vpci/header.c  | 16 +++++++++-------
 xen/drivers/vpci/private.h |  3 +++
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a760d8c32f..96995e098b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -305,7 +305,7 @@ static void defer_map(const struct pci_dev *pdev, uint1=
6_t cmd, bool rom_only)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
=20
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_=
only)
+int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly)
 {
     struct vpci_header *header =3D &pdev->vpci->header;
     struct pci_dev *tmp;
@@ -546,7 +546,7 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything a=
s-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
+        vpci_modify_bars(pdev, cmd, false);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -714,13 +714,15 @@ static void cf_check rom_write(
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note th=
at
      * this fabricated command is never going to be written to the registe=
r.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true=
) )
+    else if ( vpci_modify_bars(pdev,
+                               new_enabled ? PCI_COMMAND_MEMORY : 0,
+                               true) )
         /*
          * No memory has been added or removed from the p2m (because the a=
ctual
          * p2m changes are deferred in defer_map) and the ROM enable bit h=
as
          * not been changed, so leave everything as-is, hoping the guest w=
ill
          * realize and try again. It's important to not update rom->addr i=
n the
-         * unmap case if modify_bars has failed, or future attempts would
+         * unmap case if vpci_modify_bars has failed, or future attempts w=
ould
          * attempt to unmap the wrong address.
          */
         return;
@@ -800,8 +802,8 @@ int vpci_init_header(struct pci_dev *pdev)
     /*
      * For DomUs, clear PCI_COMMAND_{MASTER,MEMORY,IO} and other
      * DomU-controllable bits in PCI_COMMAND. Devices assigned to DomUs wi=
ll
-     * start with memory decoding disabled, and modify_bars() will not be =
called
-     * at the end of this function.
+     * start with memory decoding disabled, and vpci_modify_bars() will no=
t be
+     * called at the end of this function.
      */
     if ( !is_hwdom )
         cmd &=3D ~(PCI_COMMAND_VGA_PALETTE | PCI_COMMAND_INVALIDATE |
@@ -926,7 +928,7 @@ int vpci_init_header(struct pci_dev *pdev)
             goto fail;
     }
=20
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY) ? vpci_modify_bars(pdev, cmd, false)=
 : 0;
=20
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/drivers/vpci/private.h b/xen/drivers/vpci/private.h
index 2907f6b40f..6fdf8a20d9 100644
--- a/xen/drivers/vpci/private.h
+++ b/xen/drivers/vpci/private.h
@@ -138,6 +138,9 @@ static inline size_t vmsix_table_size(const struct vpci=
 *vpci, unsigned int nr)
                                                        8), 8);
 }
=20
+/* Map/unmap the BARs of a vPCI device. */
+int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly);
+
 #endif /* __XEN__ */
=20
 #endif /* VPCI_PRIVATE_H */
--=20
2.51.2

