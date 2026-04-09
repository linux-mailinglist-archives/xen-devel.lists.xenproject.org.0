Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2+3dOVax12mxRggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7B3CBB50
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277477.1562699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwy-0005G6-Ft; Thu, 09 Apr 2026 14:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277477.1562699; Thu, 09 Apr 2026 14:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwy-00052q-8N; Thu, 09 Apr 2026 14:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1277477;
 Thu, 09 Apr 2026 14:01:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wApwv-0004Ke-Ig
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApwt-009WCF-D3
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13b-5cb7-0a2a0a5109dd-0a2a4506a7c2-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:36 +0200
Received: from [52.101.72.96]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b140-0df0-0a2a45060019-34654860c82b-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:36 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA1PR03MB10891.eurprd03.prod.outlook.com
 (2603:10a6:102:485::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 14:01:35 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:01:35 +0000
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
 b=zDcspnHtD0t6rcRazJsEqn96hgJYwZgh+3ublOeRHQCWKi1ZuHi4wPMRk7VHQrjky1IhE+lCEiBIedNGDRTRM/YbRvCI0yJalyeL80ZeHO/HhRPCFVjnn6coaDuMSSXQmGdpBip4F+Kkg+kPqDSiapKkMLh26gNkie1525/qjDxcmmcPF9ue6zw7z1k7oZlD1tUvJIxRGXamzcobMy80WHU1+cGyb6R4SMMnoqgmGHdF89zZgF2+Yb5LXTJx8+i2YF34ChozhhBdW5KyDhdcWhBIrTtjLJ+IfW6WKFzhC4bjjTjVfJwTIe8ABXtaIWZqQcKkIu3d6K2jLBUZCKfMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f70IjTJoiAVqBQXBTEXDcxwBCzPT88lJf79t7jB0WvY=;
 b=vI/quOwnWQovnX0iyHQR+29YBGdzpu/ZHqH3xA9Rdu/WenXFoaeampnax/ai50h4dgjgNceGtWLQjehDHTxREeA1WVUvkdwtOjkLqfoXsN8f1eqcl8Gcp4m9GxdKtL0Nep28N6ls9v4Jh0QCttawFBo5u1MkdgCinHDpvW4DKeiD6gy4cqL4TIU9RANpzJzvEVi/YwiJal4As5Ptx+O8M2KjHNs7WltvVXghXEHB4wk0Z0g2OzQwTxTQ/Z0DKa26IwjURVuyoS5lOm+fwBi563TpUlBkS7OVytVzbTEEdJx5nEDnYZEetrT8Hofzub8GO60HFiV/Z11sVMfLrqJr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f70IjTJoiAVqBQXBTEXDcxwBCzPT88lJf79t7jB0WvY=;
 b=FGEC1OqSEpDl8CY1GgZz6xQ8SDzKPTg8PtRT2UBFYKPg7qkxAZ1ygw8gU7h4AJ6KK/ioeKCHTC1W1HlmX1YnD95gm5IAUaQtVIaZjJiZIHCaI8/bZh8LKVvG3hej2yJqa3t53jyQuNbdmfzkckv56TcLAlb0lsHUVUXEZ4EH7G0lF15ZUy+xYMU844PH012SSxXB67/jwiHfifXlvcHC/VhFWulIWfFgQwXehsIFCjqZdGZoO5RjWWNjTMpa9bZJbEdJyC3tSmBVWPoSbedTkVSaeyzfNBOG3uR6K2HxjcPyG8Bdo3Ul7BArn6nvh0E65ngExQ2NrO8nPgeulQIVow==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 7/7] docs: Update SR-IOV support status
Thread-Topic: [PATCH v3 7/7] docs: Update SR-IOV support status
Thread-Index: AQHcyClg09tySmMX7kuYzB1RJC8nOg==
Date: Thu, 9 Apr 2026 14:01:35 +0000
Message-ID:
 <65100dbbd16c10a76d2b1847f8fd77850f134559.1775742115.git.mykyta_poturai@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1775742115.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA1PR03MB10891:EE_
x-ms-office365-filtering-correlation-id: e19cb274-e032-43e2-2710-08de964082e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 zofA668mf5mzZYJKhTEEet4fl1NrKWk96cFfyG8vQrJ02Bd7KqLNiBpfda4OBW3MJXareLNwsw1YkI2ce5Q5x8Zm5ITCyFBZqf8SLl6etwCEBon7H2X0Y1XBmDPeQ2Wxm6TJ2XL/DXoHxPAoC2E56vryfldzvemXYGknFwRFBv7pAlZTTNje2cal3g2OBQguf85Boioy7Atcp+0RXl5rwYGjL8Y08AH+MjHlHZ4/ZpZ+AgkzDVzUGqFntbEOaR+cZujyhXK3Fz902sLPGzUkMpvBlggCfO4fNu6BbDCncADJasGh8rcav09oDriS9hdbWu/GGJ4N72r5Ke5hWcoPdR9r5DfKHXp2QuXC56iPwPvg42p2n3Cxm9dj5XGRcJHZ+Of1cM8jtsZOPrzJunDnv7HirivogENTtNY/SgURIWV4gud42H9YSR8r34KmDKqsTKBlulnDug9wNTexi6f83lfYY/c0x7y73DY66U7Hvv1PbFHiwjaUx8TehLk1wtzxEUEQpDYTP+/+fm/AlUQv8HFYb58I2ZRM7Qs7VLzwK0dxCiQ2OJlA3J/ZHJyb9593A2eINZMJCJyGWcvuQzEwaVnvn//Xmcn0xdZ+xHmVm1DZnIH+Ybh4d8+VaM/MyENMD5EoUhhRwe7Kb4vstaH33q95oZQ46zJsv76Z7pdIUoFBVNu9gOiGago0fNUL/qZTb+2v2In0MLILUR+IwOGIrRpvBT8zQJkMppdaJYzMIA5CRlmVTLA0U67BTy2meTC9GzFhc+k/3pKOEliPYXHVgCotB8qEzBO9q80kIZMnFEQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OCFWbFILKgi/W863FPP64Sp9A18FphvqxIeOZS5xGfvfKDmHtC0RL5k5T6?=
 =?iso-8859-1?Q?GRO+gxeeCod7C7Uacb+clc7y9cuqOoEKWEUEdUgkXwQUesSJJlp1A44YsT?=
 =?iso-8859-1?Q?4WrIRtFKWisYkFmzv8ebmYro8BlcQBTq4PMlsCPBHNMmMtHEYQSpKaaf74?=
 =?iso-8859-1?Q?2gMv8f+4aQV6POMImPf9AHHVO55PbQXZuqgz03jWLNA9aPsN71MSQxkIEb?=
 =?iso-8859-1?Q?wbyx3P8jaD40LI3A6vKVK+wdfbaRwCkL0tPnyn+Vp8CDncLo0zk90P23f4?=
 =?iso-8859-1?Q?lMRv6eoXGpAyB2uZ3D8NI4ayKzpNeAOeVRSQ7qsr63Pk2EHRjuxqZM3hBB?=
 =?iso-8859-1?Q?LZMQ6zvFCO0Y1tjF2M+ypa+EPdzwrrPputF0nommej6xMHpijSeBjNYjbb?=
 =?iso-8859-1?Q?JUDqbE9wgGi2h7gVF+oH5QSMfhbTGdNDcooOjbAxA9mtDZbSmQMFXKTDrr?=
 =?iso-8859-1?Q?b62ylrjD7gJEFLFdMrRlMoZmj3HmqihSXejzxgu4BhQTbH3K0cDISe4Fpx?=
 =?iso-8859-1?Q?iYI5xpRwc2ZK1iQ1IJyGaWmod0lBee+KzSdx9dCUkE6lvLtlx92P+Oofuf?=
 =?iso-8859-1?Q?2UGnLYGNpByAyxwcHWzfkVXd2D4lkCmJUVoaVCxQf8z4YHcy4McKSXWJA1?=
 =?iso-8859-1?Q?rlM9FTX8kOW27hZ1kyRP4t8hghLawkmi8JV8qfgbSMYzJp1Onrfutzm21m?=
 =?iso-8859-1?Q?4fxjFlnYjTelMOQ5EkkdYVBxdBaB/n7Mcpa22k3KDfK9HktzVbEruAKlDR?=
 =?iso-8859-1?Q?hSynAP39G/aaj2f2LcvAFRtz2OSo3BFQeYLsx+DsxYPVNwi34URfizdFiu?=
 =?iso-8859-1?Q?rwQNbkzKkgz0FqaRRL6hXa1/aPWLrKH5/RjL8fYXNhEkINToSTOkn3fc3u?=
 =?iso-8859-1?Q?gIgyiJnW58ALGzck1rJtQiCaRVUGxbPC8spofiMb+0zEDXPJKaVm3vILUl?=
 =?iso-8859-1?Q?XzmEKI1okWMCo8A9BPENtfshiyKgWJIaJ2cOVvHhMpP8MWW/fZIjFwSdxm?=
 =?iso-8859-1?Q?pHSeiVkLiQ1slvhkMJE9zUmsI+k97OIooFtHf80gsPXy1fAWO8n/M3mOLZ?=
 =?iso-8859-1?Q?AVfcgPFGs342ofyQtKuuyjt2U6nO9wwjAFZbEIJ3nc4xRKO4/hdGXcN8b0?=
 =?iso-8859-1?Q?AvvDLfSurYTNJG4WuqqFb3/KrZC2eL0FV7HSNkz8HNetBOQfa7oBTo5sfE?=
 =?iso-8859-1?Q?iHnekTCEDQ2/vlnV3ZYTAEm9tby7UL8+p/VmTrG1l0F9X/0FXzs1yr9X9p?=
 =?iso-8859-1?Q?bdFLMAVkeNiOwPWWPTK+EV5u1fseMskQI8u7UHYxHLIAXxjU+8lmJ0Rdsc?=
 =?iso-8859-1?Q?XAVwbnhew3FJNF0i5sK5Io1EZOW9Abwx3J6Nu9sOMAhZEPdd/WZfHLIxHs?=
 =?iso-8859-1?Q?uzHQ4w1vWE/CuCdNr+4Ow5LVU2yMZv+t3ViNETKSMfsBwikc+9XYPwp/+4?=
 =?iso-8859-1?Q?4kX/hG767QfuiDXr+QQM08mrML0aNmdVfLac+/hmgHmZUfOp1z2JQnjtsS?=
 =?iso-8859-1?Q?Y/H+hKtKLMz1Ln3RSMgDJyit/1wP7N4MMYPJoiZvGd6nkq8NqqKZy6ob3i?=
 =?iso-8859-1?Q?FIz818GiD8KFN6DjmSsB2NQRZTXpAvABPzj2Hm59zQsSP4smAWZObNJ/A8?=
 =?iso-8859-1?Q?QtufH31VlxxGe0JF+xido4sT0TgYDK0GkpfW/r2R/Xeqx+s1XBMNC4KSG3?=
 =?iso-8859-1?Q?wJXO1ACCP8kg6wM/N/gnVTDKVfRedTpY60NT+20aRRoTCoLKwoS2DybzNu?=
 =?iso-8859-1?Q?3axsbg34s1RW1SQzuiKth08bOfZ+Ulsm6VAVEFz/RfUhpWmXpy1uMy1S2r?=
 =?iso-8859-1?Q?jLSqOP6PmHD1gZpFAu3AMjeh0g1t52U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19cb274-e032-43e2-2710-08de964082e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:01:35.0400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gVSbm8SQc4MsAT7Akf1xfX/sc/mTAAq+Rm/MnSEU5LnpMTfFzp3Qmnrmjc99Gfg8MyICw16nF87N+greGIDr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10891
X-purgate-ID: tlsNG-16d1c6/1775743296-64E4E3D8-0D41CD8F/0/0
X-purgate-type: clean
X-purgate-size: 518
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[support.md:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C5B7B3CBB50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* new patch
---
 SUPPORT.md | 2 --
 1 file changed, 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 8e7ab7cb3e..f4f1458bbb 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -170,8 +170,6 @@ unexpected behavior or issues on some hardware.
=20
 At least the following features are missing on a PVH dom0:
=20
-  * PCI SR-IOV.
-
   * Native NMI forwarding (nmi=3Ddom0 command line option).
=20
   * MCE handling.
--=20
2.51.2

