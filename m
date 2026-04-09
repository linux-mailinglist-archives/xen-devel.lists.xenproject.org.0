Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFiEGlix12kORggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:02:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B453CBB53
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277472.1562662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApww-0004Oy-40; Thu, 09 Apr 2026 14:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277472.1562662; Thu, 09 Apr 2026 14:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwv-0004N3-Tm; Thu, 09 Apr 2026 14:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1277472;
 Thu, 09 Apr 2026 14:01:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wApwu-0004KF-5G
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApwt-005jok-Gb
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b12b-e002-0a2a0a5209dd-0a2a450ab160-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:35 +0200
Received: from [52.101.66.132]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13e-ee98-0a2a450a0019-34654284bb10-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:35 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA3PR03MB10964.eurprd03.prod.outlook.com
 (2603:10a6:102:4b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 14:01:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:01:33 +0000
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
 b=t6ZuL5lWSKjJXPrhTkdjSsJxOlGTtcu2zp5aLeBbuQRgHlLmTQU9ODON78y0ift/ClfkFw5jlMgWxpJXApdS3BBWI8+1JXSlyMe0/9QxoONp5FLvMftB3ttWKuj1U4RRS4lBC4MJyK5HcrbZpOVd/UYf+HVHuI/v1fGaXf6Bwgyd4AiO6ABqjbPybJ07zkVMl/XSvuDWbwJUVHHb0kpbLlBq5yRRJ5QpX24azV3oinsQwKHPFT1KXkDtu/g1+s5+j9PEsXsu1DAqEAPaHk1G31gscxb9rg4z0v2k2enp/oBVYrjWT4uN0Z0kxmqlv0vgSBNSIr0xm22kw08MR7L4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3SAb+kYfSsy1lFT5wonZU9aNWITJ9HEs9KeGn0w/fc=;
 b=ggQRi8mNGlk636FfIDZJcc9heJdjGbbuY2ZypC99ACFocIQUQgdg0HO/w4wo+2A+q0VBmdUZSkNthyXGHPlbiMVUTMGQXS49Hl5Gdc4hFyhLOt9tUwArTURd/H7vygTij47yimWM2tpHgsoTEbPQKRxOLfRIQk6+zln2ZkB9EQJ0mg6cmGCMUGwC6kr1D3vJwMUsj3amyF8KFGxQ1DtJYNteHcpTZfQbpAYklsUMO1j10zAHoru96Ql91JtqUVkdJBob1oGgwzXHgr3hhbZLqAMta953mwcKmtFJj6+bSeJdKAjETNlaaDFDzwYMUGpNJxYn6zcFQi1xifZOrZJy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3SAb+kYfSsy1lFT5wonZU9aNWITJ9HEs9KeGn0w/fc=;
 b=ZhZCDs/Igstpa06XmNRBxKB15x7fox0bzCmx9a+KhwnI9MBU7BLTPtxHMp4xwb5hWVNiXqQX+/LwPdawVeI5KLqpOi5h0U8o6/yYkI4bxyOvOBQazkuCVheqBMiorjxC7NQJjm3ps7HZ9eI0rM9Q/5umqwW+PLbu5NOKOMOx6LMqcykRsm/q833yAoe4fM07BqUJ8dKkZ0SVirWv/zyzpBms/cmOswBOgrIf7duPi3Rlf8isy8pm+csCAFbA7ROn7uz63OOqFv6pxhuVlpifxQFeGwMsOwTEPsthzei9ETd++CN2IvGF7r0xIYG8JnxX2ZaGjwSDhtRD9fSq9wrKEw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 2/7] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
Thread-Topic: [PATCH v3 2/7] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
Thread-Index: AQHcyClf7FuYJla3xES25istczeK4w==
Date: Thu, 9 Apr 2026 14:01:32 +0000
Message-ID:
 <904786c642136845234f94fb522a0a0d0fc8a1d5.1775742115.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 7a9190c5-fb42-4786-14a5-08de964081b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Oz+vbxW19ExR25hUJXDzJkojb5xg7+54niddpISXmBS2J09F3kHIqiODXyBJeVnZxXSyjeW6tzRDI5YO9Q0RBlVFksHpn58QTsYXYmmCOJsssiJ6ek2j6JF/nWpcl74+7bdnXYrJHGhbWD6uYfTxNEiy7fOa9OBKOGDF4K2IJQHVrkrasjFjjRRBMrtWbRsAxhW6eMTWD6OXwIYHM2iGsJsezsTp1GZAG9lk41OpxoUwL8HNamYMAB1AbaqzDZKfiokSqGtMtXw9HwDcLUUCy4jDNjexXEsJpKWqbJIpkTusikwhdh0WvpctMtZV3K1CTV9rKmS75U2hG6wN1D7nrUq11R4u8Eyv2APbpQ8ACi+Y1cfs0NN2IWLRYhUffYfQPxmgRM2/zwrE/Y5wrLO4rhctcd23O90DDFk/rvTQ8m44RmoyjZrIbpeU0DGffopNlpXP0w8WjeZywbuJ9U3dT9opvXojr09M0KI5iwWDlMYqR/TC2Ob4xPmtD4wcd+ykvu/SEULfOHZHzE4nter+dexJxz5BB8G+551hzNgWVCf2YI9emMfyvPCP9sdant4N7JPdBBYG9sIYIqYy7rUXba84yoRj36qZf3Ppc15HIsKYUsFwrpvTJeBHf29QRorOziJo8QZd58hsQjZhqnRNd4pO4NQqRR+Csxrxc31eRJSGjgREe0VS23nx9HX2m29z2tIebwWRcXNtV7yXlsrkT3G2W2amQyn3afK3wjtn6JcYwGItMAMeqxzNmbD5+/L9fnFblHDIwRsyDmPKbK3BCjl7jUw2cvj+3ofvpvdGL4g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IgYWygkOyGjqUH/Z9pz4AKIUm6VLdG2bUOdHTvZPJhthy4nLLjgf0HAEuB?=
 =?iso-8859-1?Q?6t9Y/zAihPniasAIqeNWzOaqnM+6q9q1ae4V8joN6oEZhCuq5Y8KxFczFg?=
 =?iso-8859-1?Q?HNHbYmZfeb9KxF8y/qCjvBwaTWwEvSOIiSvPZDUrDgCQxukNtuZPTCjfgM?=
 =?iso-8859-1?Q?tBq/emNxr/88jLDArAgxTS44b1wAepSxtMC6FyiQf/7OEObFoZLiyHfz0N?=
 =?iso-8859-1?Q?OS8jQGlUpV39E4ocX1Y0UM2mpDJehX3ERozgps1cBj/P0EXkEF1MQ461Gv?=
 =?iso-8859-1?Q?QPTS5JDc6XKcoz+xTl88rxH/CsgxHmChjqU4NLUY7CEk4NJqxEQlHpl4gK?=
 =?iso-8859-1?Q?t2S233nChixGKRxwOlQoh8PhWvHK3wwz4guDOoUspxmvPSyr2vHP2zr865?=
 =?iso-8859-1?Q?1VXz6WJFIIHh5ngcZo1Vn8jqXW4/fi7c1OnWnyJCN2sMhvlwzmsR4n5VUw?=
 =?iso-8859-1?Q?+7Jtin8nFID2oDEci9qvHmehjl5ZSBxq1DTVgVsYtSuS6bUuwBRtmd7ZP7?=
 =?iso-8859-1?Q?xRUXIS7Bz4t+J8yRABgjHjrpv6sQFi4oICrFNsTujoiECO3PBJ/42UirAB?=
 =?iso-8859-1?Q?Nwjmgy5O78HxWe5xbla8bD6Y0XcpsUaI6qJjCXDgtPGha+TyTQ9RXxX3ON?=
 =?iso-8859-1?Q?fylnqJOVDK89VcKW6PprAl/uc7kdkDLEsGdTotRdX33Kisew1uqJPL3cqv?=
 =?iso-8859-1?Q?Fhz/15lUhVV3NUZUWpJC7qId1ziogO3qqQdpO6PC/SzX0TlLZjAS6kJ62B?=
 =?iso-8859-1?Q?VHFdYq6Wok/1CSoVbIyohgIAYNhfbEUttjwHHE4XwzyXbpfgLnmWT9VXgH?=
 =?iso-8859-1?Q?I38A6aJaRP6cnoTkZ0ouJ1grRlAVFqdc9XA5ZqBdUBBiFBpqB8GJRV+fqb?=
 =?iso-8859-1?Q?VqMX9DZWEzgo4jyBe2IJ+AT2mFqJx9DmR7H7UaI09o3Ri7H5hYaLK3DnWB?=
 =?iso-8859-1?Q?OuRqcso5r6WsNgnBkm/VoaH5BDAHpqcWqgsq4CpGF2kvkLVyfHwDf2uHXd?=
 =?iso-8859-1?Q?UB+YjMTKCkDeAJK3THag6ZGdqR7Pg+rwBJ5Wzn5gVJocfduetAtxu9clK2?=
 =?iso-8859-1?Q?pp7We+rQsrdXcrsZfu3LRPj6Dr4m7QXe9q/12nF65hha1nRoeiVbOpsC6d?=
 =?iso-8859-1?Q?K9DOMQOMbQMYbgJvX3RrU1jzhIiHH1e4ABZbyL3qTSanEJXfOF3PsTvsbJ?=
 =?iso-8859-1?Q?0I/682M/GhtK2IKabjq1sgT/M2lFZ8P6ZDnUM692Zx/ypR/V017U7KM6VX?=
 =?iso-8859-1?Q?EeI0WFT3d52nSDW+vOcXRS6my+OKv0Npmc9+w535R6D2ZeMjkiQkcrnb6J?=
 =?iso-8859-1?Q?HjkvTqNUI4pQYSQ+Evj7oJ0LH6lnhthKQ0Nf1rzo6vc0NtCG5CJXCX/8Pn?=
 =?iso-8859-1?Q?aCKXMl/Y+LjNbCDG6FGkZuMBbbmHcGhmLFhfBCSK2K6VhvgaLGSvr6X92B?=
 =?iso-8859-1?Q?kSoFwCNtV/o1DGyMO8JzITywT4BysgkGu53NHEJj5PnQLX/FYSXrqCasX4?=
 =?iso-8859-1?Q?xbaLqBmirrJ9VUhjMOlmlMBHnK6fycGZ34wzIvOLJtOa+abbjp9PS9zBtt?=
 =?iso-8859-1?Q?pLVxUAcAtblC/NFMzDa+xcsQ+sLwVX5y2XBaOOvPPJNhFSds/mwPVsSRS0?=
 =?iso-8859-1?Q?Gky5PzOmY8M3do1RayvpDr0xd2H8HaVbDnW01pMRWSOe4vX0KnMsBXqSAe?=
 =?iso-8859-1?Q?ISp2up6ICbmSj1hhirt9SN1Z62kjLKSh+yLIdWT3lM/gdJuNvTWp6dX5+v?=
 =?iso-8859-1?Q?nDvEOq6dT7xr1066haz3LURvU0C5WhIoE0ixSYCnaFcq0faR7pTfHhMDB7?=
 =?iso-8859-1?Q?8qWEarBpjhVXP1X0qQ7RD0KQanS7Eu8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9190c5-fb42-4786-14a5-08de964081b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:01:32.9857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQSTdgcsnpCTFuBrISQgYJunRGnSzhjr49oHoa2BfOc67D68uv55RIUjs/ULILU2BlsZlm94ce2EQ+X6brIYgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10964
X-purgate-ID: tlsNG-4011c0/1775743295-BC75F0B1-F72DEF5F/0/0
X-purgate-type: clean
X-purgate-size: 3941
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,epam.com:dkim,epam.com:email,epam.com:mid,vates.tech:email];
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
X-Rspamd-Queue-Id: C0B453CBB53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Export functions required for SR-IOV support.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
v2->v3:
* move declarations to private.h

v1->v2:
* collect RBs
---
 xen/drivers/vpci/header.c  | 20 +++++++++++---------
 xen/drivers/vpci/private.h |  6 ++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 96995e098b..5d5ba5c016 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -611,9 +611,9 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
-static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
-                                         unsigned int reg, uint32_t val,
-                                         void *data)
+void cf_check vpci_guest_mem_bar_write(const struct pci_dev *pdev,
+                                       unsigned int reg, uint32_t val,
+                                       void *data)
 {
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
@@ -653,8 +653,8 @@ static void cf_check guest_mem_bar_write(const struct p=
ci_dev *pdev,
     bar->guest_addr =3D guest_addr;
 }
=20
-static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
-                                            unsigned int reg, void *data)
+uint32_t cf_check vpci_guest_mem_bar_read(const struct pci_dev *pdev,
+                                          unsigned int reg, void *data)
 {
     const struct vpci_bar *bar =3D data;
     uint32_t reg_val;
@@ -826,8 +826,9 @@ int vpci_init_header(struct pci_dev *pdev)
             bars[i].type =3D VPCI_BAR_MEM64_HI;
             rc =3D vpci_add_register(pdev->vpci,
                                    is_hwdom ? vpci_hw_read32
-                                            : guest_mem_bar_read,
-                                   is_hwdom ? bar_write : guest_mem_bar_wr=
ite,
+                                            : vpci_guest_mem_bar_read,
+                                   is_hwdom ? bar_write
+                                            : vpci_guest_mem_bar_write,
                                    reg, 4, &bars[i]);
             if ( rc )
                 goto fail;
@@ -885,8 +886,9 @@ int vpci_init_header(struct pci_dev *pdev)
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
         rc =3D vpci_add_register(pdev->vpci,
-                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_r=
ead,
-                               is_hwdom ? bar_write : guest_mem_bar_write,
+                               is_hwdom ? vpci_hw_read32
+                                        : vpci_guest_mem_bar_read,
+                               is_hwdom ? bar_write : vpci_guest_mem_bar_w=
rite,
                                reg, 4, &bars[i]);
         if ( rc )
             goto fail;
diff --git a/xen/drivers/vpci/private.h b/xen/drivers/vpci/private.h
index 6fdf8a20d9..f012fd160d 100644
--- a/xen/drivers/vpci/private.h
+++ b/xen/drivers/vpci/private.h
@@ -141,6 +141,12 @@ static inline size_t vmsix_table_size(const struct vpc=
i *vpci, unsigned int nr)
 /* Map/unmap the BARs of a vPCI device. */
 int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly);
=20
+void cf_check vpci_guest_mem_bar_write(const struct pci_dev *pdev,
+                                       unsigned int reg, uint32_t val,
+                                       void *data);
+
+uint32_t cf_check vpci_guest_mem_bar_read(const struct pci_dev *pdev,
+                                          unsigned int reg, void *data);
 #endif /* __XEN__ */
=20
 #endif /* VPCI_PRIVATE_H */
--=20
2.51.2

