Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JDbBwbEwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5D2FE8EA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259655.1553084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7U-0001zz-0Q; Mon, 23 Mar 2026 22:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259655.1553084; Mon, 23 Mar 2026 22:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7T-0001rP-NZ; Mon, 23 Mar 2026 22:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1259655;
 Mon, 23 Mar 2026 22:51:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7S-0001IP-Bi
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:34 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021140.outbound.protection.outlook.com
 [40.107.130.140]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6779518-270a-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 23:51:32 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:29 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:29 +0000
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
X-Inumbo-ID: d6779518-270a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNG0DYpsJpeo5vreegOauu5uEKgGwQzIFf2OAb27zz4f4w5b5EIi1Jed0+0mfMBr6Ajhk+uzLRnN38cggS4eh05vYYdU7Xc/Eu9TBjvrWNVRHJ3hwsHjjmZVahGnOfSddslBsFWmxvmcbIaKPOhfjJAlP/08pRjiR6uSd+/iVFI9hyJ84JlIlHWYT9yLMKRYc8MP/zmUQYtc7z/3U3WFx0IqoGTEYZNeTyqe2JmSODnYmjqCH+SVmrM50zZSUxnea653s6hIlcEeMM4Ru4qr/Eqbh2WBB0GO/G4X3ZfUx0YWonInvEd0pFcVAUGorUb9bzmo4gBJ+OqKahRnnb+3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99Wu1RBHzZt/ZpsbMLK51koxBJTJ0OyMLOfeto3SXOE=;
 b=mfCnRQwJq5C1RCdsJt3kjTsAJv0XDV/2h4Me401pNPLgYsv59oAQ7T5KWERlJxyw4eRii7Kew2ze8YYAB4kbkiL44rEsEY1204UCT7jcW/50uYUO35851M0xh7tgYYJ2Y+Sekq/m+IIOcaEIaS8RdLrO+CCF/AKaOHMvYsmvTDYq3bBCqi8X4WyEv5C8LzyhNBgYA1wFb7bPhofBLWMRPK/p1gXjWEpBE9z5HACriwWS3eLXjjhZO/M7UL9vTbFh/d8HHiXx6KMg6SHsFnADx6ya+7LuvhpUpvaQdLx4XIScM2ka86TGqT+AhRle+bdEUUI/rm8qnDPPqAwnCzL6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99Wu1RBHzZt/ZpsbMLK51koxBJTJ0OyMLOfeto3SXOE=;
 b=jzCM29LZz2mhFF8oHFR/6gODomdIa5xvaHzlBOIthw0i7TcWVYpulQQuD478jmKPHaefFBGsC942VYIHa7pt/Lvg60lh/3cSR2rGpCp6KOlB0agszTueQXE6/YL9yNbEpp6TKOa3G4daZaz02o7BX5KzPgti3h5+xUDK2gYVneypbd4BBrASHPqA2zqPUcTVrex/XjsaDG0/fatznZn2UlN4MZiL/DZ3eA9/1zdwcxsZrztGaK3bRnocMPAR2cKDNn1WjCvki7qlEFiz1eXhZJGXwfNlmAXNa1jkYn70c/GNdGtkngwDue5MITlfwfvm5PdEw7CR8lyhH3ycf2MuBw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 12/23] xen/arm: vsmmuv3: Add support for event queue and
 global error
Thread-Topic: [PATCH v2 12/23] xen/arm: vsmmuv3: Add support for event queue
 and global error
Thread-Index: AQHcuxeWgbP4hcgwQ0ahadVDpvCGvA==
Date: Mon, 23 Mar 2026 22:51:29 +0000
Message-ID:
 <6d1ae9343a2a0ad323845fd5c8d56ba6c4a57eef.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB7653:EE_
x-ms-office365-filtering-correlation-id: f682da19-8e8b-4693-31aa-08de892eb88d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 3zq8093fVNibVd3hhjZCYffKH+xxTEtBCiElb1Uvo4oRkJvQy7jpbxmaS/j7QiMnL/7xEFM1xCyGU32BF9suLsl+9Ei7FAUPHoXZBdDlR9n3IVMzZ3eDYyhAFedzi7XEgcK05KoQFyS+DI4k6qOVDDYbX375x++ZEWArM0I+gAY81SfesbkIT3JqeqxNBbwAm+CeSx0cX/KbRcy/DhkLVR8l3+5iqIVg68K93KW5KBSzOEf4ia3K4oFizYJ3d1brUeT+GjaoMuCd4pIY+eTcc0baQWGF2QB9doXqVhpuIJ9gMFc8XJtCmvn757sPuHPVR/WFoEwiVWTBbrfHTf/5qqi2Q+qVUNf4VK4bLoJq/eHCQJa9hcLftn2D3sSjNDAupLO5uAMF38CTe7xA934z6Mupnk0nVr6/Ldued45niWnBg77rBn9P6x3h5Y8IfuRuhQLwV3/2A+nnkDs5gYvNo8caMi4p8AxJUTmdiO7R4c99+SjSo73xlYKMFnjqYPgDKDmitWnO/OHf8RrFSKWdqft/8BBFBFDvG3aa7mRAK1Ig51q6tDVoLVDEoeiXw7UD1/o47jSUvIu5v92osZ1PQw58xD8mFnKz6SkFtyZceECyYxd1Cog6g6/c7Wqog8ORCXMvdvRVhaCv5YFh9w/Dj8wzCdq4AoKHU5OG+ZMcgDYJcn7dencG6MzGzgROGKX+TkTSardQtDwo9rQIb1+fWA1fHNu4BwreGQO5g8xt1fTHpfd2BDCHMmi0ma87p6VqU6TEE5Hl/WMt/XHSa1G5XoWtb1MFKauKe+1JTy3AVFw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3Y4F0nsoDuJqaHIQxGbQbMV0RuZZYI9hGbBPNlE/3DiORxCDPZAu1YPJov?=
 =?iso-8859-1?Q?StIiJjU+6JijmSeEoqsnkiGL+w++pPqAIH7IdKViFbvQoGeE8k4auEDYYs?=
 =?iso-8859-1?Q?1DVia1fiN3AYCfY7IOrBYMvR1pD0c6jh3ELJWx9ovZ8n4AAaGIWQ0GK4iM?=
 =?iso-8859-1?Q?uoZcZoJIz9QvCm8C7S1dKUwAlN8lRVXAhJZ45D0Zy9mcGtftekFlxRF5Lv?=
 =?iso-8859-1?Q?TfpnizzlF4SMbENFUparI3exTEzzW+Jv2bumuKU2g8SCWW0hqeJ8LbFvqt?=
 =?iso-8859-1?Q?Ih7tvtt31QZ88mBmR1AQFW7pRwmiCHlpjbCZufkLyFFLFGBuDV3PtwpHfF?=
 =?iso-8859-1?Q?XkGJwcabHhBYZ7cu8eWdsvwMuM9PghEIn2xLUDo66/U08Fb/HD6co22PB2?=
 =?iso-8859-1?Q?N19GH6Q5HoZFdPhieiQdqhrEI2YNIQoW027SZI5sJ8CTl3zWEcFjd+ZWm5?=
 =?iso-8859-1?Q?EKzVCRkFvl2VrufYAvzVxailmuNE94QCrye2cBM+YfoQYhYATWWfTkvdKL?=
 =?iso-8859-1?Q?98Eg4BBZ6W2f2+1rxCA2DOx/7jSXH799i6kkGZTf477ankPRO4bpoHdecJ?=
 =?iso-8859-1?Q?zr68dfxB7My8xS5/kzC9hHPbVMl+rfsS3nKQSSGXVCYGD9NANT1OANOI7w?=
 =?iso-8859-1?Q?CaH5hp65jUV1qZtUBSfge5fxKDG6DTFNWzumytmKJpBYmnOsqWTgkvfFNE?=
 =?iso-8859-1?Q?UOrtfW+5Q9+jA8uhzieiGZc9sWVYERwJ7PSIPOpKTlGHg6vSTwzNYO7rib?=
 =?iso-8859-1?Q?BM5A1Mx3Exr+vmIAbB+2wiV2cZ5Y8TnhDaltYeLyBp35RbF4H05cE9R5dB?=
 =?iso-8859-1?Q?etSQLpRDMNWnf5bJlXRe40U+PD0xN8hBl7+4jgoCvPJWSZElYBqVmjqVxv?=
 =?iso-8859-1?Q?L7htHii2Zk5aBjpCp8MKyeBdfM2R1OrxTJ7/mWunTyoOsGp43Onpxtxhjd?=
 =?iso-8859-1?Q?Sdq8coldfOJrSpQIhjHz8+hNwFBliTuYLQuHRqmcfueRneX6jNqiSJY2NE?=
 =?iso-8859-1?Q?izNZFAkIMFd2l33QJQMN6xqTdeOPHMXLWNBhoJSAmDvTct7vc1nQdYhz42?=
 =?iso-8859-1?Q?kJ4LWiedscH5wu6IcZybek9G+CxJ8mGElNvaqZejNsgcMn/1akRUEx55W6?=
 =?iso-8859-1?Q?uQuVROB413hCtkkxEm7necbqCWQDeltfpVzu526acw/HFZgGtHhhLhB3Rf?=
 =?iso-8859-1?Q?a/vWkHZPFXsMiuLUHitpFX9NK+ctdyUqifZa7FBbRgDXfX30JyXuHDe+Uc?=
 =?iso-8859-1?Q?xYQ5E1ORonFmphz5LxOBWIZPWrvpx3t9Zi+BEhTT4GyvCHHeEHXuhvmqyg?=
 =?iso-8859-1?Q?xy1Ney2wVnvO8TyTroBGa9G11yaMeTbYhqDpTIEFh5MgESbbEVSc0ZqzyH?=
 =?iso-8859-1?Q?ATPyH1xLe1r7ozpnTqciP3Ud9KvyywErDLBKXtUrFGuymo+15tj9DXUklw?=
 =?iso-8859-1?Q?8MNPEwYzQEFRkdf1YmcJagwaqCGyZKZA4JQRPGB8ujA1O8PGGtOCpPEs63?=
 =?iso-8859-1?Q?5/wH0MQGplgY5lDufooJCM1sbYIJu2lN4k1rAF/A1eu71zbUMxUfFuy263?=
 =?iso-8859-1?Q?t1WCrfkq9cCGxEXvrREMwX9ZCiEh4loensQG3qKYHFDPPzc5VrtEjOVuoR?=
 =?iso-8859-1?Q?3lXhuMK6HeCEABMBeAvVd8yTElx7IlbxPpvYF/Kj0m7g+praruanMg61Yi?=
 =?iso-8859-1?Q?7tX3LX16uw91y50MpZxnEXMneZsgZmgkQhnA6xZ8reS051z/4znR+w0AY5?=
 =?iso-8859-1?Q?0x/78NOhVkeOwfmay3iK2mJ8tMnnjCJlm3wWoXSrD65ubR9Jqv5Rnzzp3j?=
 =?iso-8859-1?Q?qxuXaWkgZcHu6sGgiFudUkWg+FZUWB8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f682da19-8e8b-4693-31aa-08de892eb88d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:29.0337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSAMZNb4QbCKgCWfFFaR7JmuI9ypN9EoZl3tHZ/xUBuO3RbI1DDK9eCCBrtKSc5cFUlbryGSj72emMZMUF7ohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
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
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A9C5D2FE8EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Event queue is used to send the events to guest when there is an events/
faults. Add support for event queue to send events to guest.

Global error in SMMUv3 hw will be updated in smmu_gerror and
smmu_gerrorn register. Add support for global error registers to send
global error to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h  |  20 +++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 163 ++++++++++++++++++++++++-
 xen/include/public/arch-arm.h          |   5 +-
 3 files changed, 183 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index df3b7ec1b5..8d3e1877aa 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -354,6 +354,26 @@
=20
 #define EVTQ_0_ID			GENMASK_ULL(7, 0)
=20
+#define EVT_ID_BAD_STREAMID		0x02
+#define EVT_ID_BAD_STE		    	0x04
+#define EVT_ID_TRANSLATION_FAULT	0x10
+#define EVT_ID_ADDR_SIZE_FAULT		0x11
+#define EVT_ID_ACCESS_FAULT		0x12
+#define EVT_ID_PERMISSION_FAULT		0x13
+
+#define EVTQ_0_SSV			(1UL << 11)
+#define EVTQ_0_SSID			GENMASK_ULL(31, 12)
+#define EVTQ_0_SID			GENMASK_ULL(63, 32)
+#define EVTQ_1_STAG			GENMASK_ULL(15, 0)
+#define EVTQ_1_STALL			(1UL << 31)
+#define EVTQ_1_PnU			(1UL << 33)
+#define EVTQ_1_InD			(1UL << 34)
+#define EVTQ_1_RnW			(1UL << 35)
+#define EVTQ_1_S2			(1UL << 39)
+#define EVTQ_1_CLASS			GENMASK_ULL(41, 40)
+#define EVTQ_1_TT_READ			(1UL << 44)
+#define EVTQ_2_ADDR			GENMASK_ULL(63, 0)
+#define EVTQ_3_IPA			GENMASK_ULL(51, 12)
 /* PRI queue */
 #define PRIQ_ENT_SZ_SHIFT		4
 #define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 6d3636b18b..7a6c18df53 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -44,6 +44,7 @@ extern const struct viommu_desc __read_mostly *cur_viommu=
;
=20
 /* Helper Macros */
 #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
+#define smmu_get_evtq_enabled(x)    FIELD_GET(CR0_EVTQEN, x)
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
 #define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
 #define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
@@ -52,6 +53,35 @@ extern const struct viommu_desc __read_mostly *cur_viomm=
u;
 #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
                                     FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
=20
+/* event queue entry */
+struct arm_smmu_evtq_ent {
+    /* Common fields */
+    uint8_t     opcode;
+    uint32_t    sid;
+
+    /* Event-specific fields */
+    union {
+        struct {
+            uint32_t ssid;
+            bool ssv;
+        } c_bad_ste_streamid;
+
+        struct {
+            bool stall;
+            uint16_t stag;
+            uint32_t ssid;
+            bool ssv;
+            bool s2;
+            uint64_t addr;
+            bool rnw;
+            bool pnu;
+            bool ind;
+            uint8_t class;
+            uint64_t addr2;
+        } f_translation;
+    };
+};
+
 /* stage-1 translation configuration */
 struct arm_vsmmu_s1_trans_cfg {
     paddr_t s1ctxptr;
@@ -82,6 +112,7 @@ struct virt_smmu {
     uint32_t    strtab_base_cfg;
     uint64_t    strtab_base;
     uint32_t    irq_ctrl;
+    uint32_t    virq;
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
@@ -89,6 +120,12 @@ struct virt_smmu {
 };
=20
 /* Queue manipulation functions */
+static bool queue_full(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) !=3D Q_WRP(q, q->cons);
+}
+
 static bool queue_empty(struct arm_vsmmu_queue *q)
 {
     return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
@@ -101,11 +138,105 @@ static void queue_inc_cons(struct arm_vsmmu_queue *q=
)
     q->cons =3D Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
 }
=20
+static void queue_inc_prod(struct arm_vsmmu_queue *q)
+{
+    u32 prod =3D (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
+    q->prod =3D Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+}
+
 static void dump_smmu_command(uint64_t *command)
 {
     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+
+static void arm_vsmmu_inject_irq(struct virt_smmu *smmu, bool is_gerror,
+                                uint32_t gerror_err)
+{
+    uint32_t new_gerrors, pending;
+
+    if ( is_gerror )
+    {
+        /* trigger global error irq to guest */
+        pending =3D smmu->gerror ^ smmu->gerrorn;
+        new_gerrors =3D ~pending & gerror_err;
+
+        /* only toggle non pending errors */
+        if (!new_gerrors)
+            return;
+
+        smmu->gerror ^=3D new_gerrors;
+    }
+
+    vgic_inject_irq(smmu->d, NULL, smmu->virq, true);
+}
+
+static int arm_vsmmu_write_evtq(struct virt_smmu *smmu, uint64_t *evt)
+{
+    struct arm_vsmmu_queue *q =3D &smmu->evtq;
+    struct domain *d =3D smmu->d;
+    paddr_t addr;
+    int ret;
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return -EINVAL;
+
+    if ( queue_full(q) )
+        return -EINVAL;
+
+    addr =3D Q_PROD_ENT(q);
+    ret =3D access_guest_memory_by_gpa(d, addr, evt,
+                                     sizeof(*evt) * EVTQ_ENT_DWORDS, true)=
;
+    if ( ret )
+        return ret;
+
+    queue_inc_prod(q);
+
+    /* trigger eventq irq to guest */
+    if ( !queue_empty(q) )
+        arm_vsmmu_inject_irq(smmu, false, 0);
+
+    return 0;
+}
+
+void arm_vsmmu_send_event(struct virt_smmu *smmu,
+                          struct arm_smmu_evtq_ent *ent)
+{
+    uint64_t evt[EVTQ_ENT_DWORDS];
+    int ret;
+
+    memset(evt, 0, 1 << EVTQ_ENT_SZ_SHIFT);
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return;
+
+    evt[0] |=3D FIELD_PREP(EVTQ_0_ID, ent->opcode);
+    evt[0] |=3D FIELD_PREP(EVTQ_0_SID, ent->sid);
+
+    switch (ent->opcode)
+    {
+    case EVT_ID_BAD_STREAMID:
+    case EVT_ID_BAD_STE:
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSID, ent->c_bad_ste_streamid.ssid);
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSV, ent->c_bad_ste_streamid.ssv);
+        break;
+    case EVT_ID_TRANSLATION_FAULT:
+    case EVT_ID_ADDR_SIZE_FAULT:
+    case EVT_ID_ACCESS_FAULT:
+    case EVT_ID_PERMISSION_FAULT:
+        break;
+    default:
+        gdprintk(XENLOG_WARNING, "vSMMUv3: event opcode is bad\n");
+        break;
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -114,11 +245,22 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu,=
 uint32_t sid,
     uint32_t log2size;
     int strtab_size_shift;
     int ret;
+    struct arm_smmu_evtq_ent ent =3D {
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     log2size =3D FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg=
);
=20
     if ( sid >=3D (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
+    {
+        ent.opcode =3D EVT_ID_BAD_STE;
+        arm_vsmmu_send_event(smmu, &ent);
         return -EINVAL;
+    }
=20
     if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
     {
@@ -156,6 +298,8 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, u=
int32_t sid,
         {
             gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
                      idx, max_l2_ste);
+            ent.opcode =3D EVT_ID_BAD_STREAMID;
+            arm_vsmmu_send_event(smmu, &ent);
             return -EINVAL;
         }
         addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
@@ -183,6 +327,14 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu=
, uint32_t sid,
                                 uint64_t *ste)
 {
     uint64_t val =3D ste[0];
+    struct arm_smmu_evtq_ent ent =3D {
+        .opcode =3D EVT_ID_BAD_STE,
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     if ( !(val & STRTAB_STE_0_V) )
         return -EAGAIN;
@@ -217,6 +369,7 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu,=
 uint32_t sid,
     return 0;
=20
 bad_ste:
+    arm_vsmmu_send_event(smmu, &ent);
     return -EINVAL;
 }
=20
@@ -577,7 +730,8 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handl=
er =3D {
     .write =3D vsmmuv3_mmio_write,
 };
=20
-static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t siz=
e)
+static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
+                               paddr_t size, uint32_t virq)
 {
     struct virt_smmu *smmu;
=20
@@ -586,6 +740,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
         return -ENOMEM;
=20
     smmu->d =3D d;
+    smmu->virq =3D virq;
     smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
@@ -612,14 +767,16 @@ int domain_vsmmuv3_init(struct domain *d)
=20
         list_for_each_entry(hw_iommu, &host_iommu_list, entry)
         {
-            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size)=
;
+            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
+                                      hw_iommu->irq);
             if ( ret )
                 return ret;
         }
     }
     else
     {
-        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE);
+        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE,
+                                  GUEST_VSMMU_SPI);
         if ( ret )
             return ret;
     }
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 9371c163c4..c7fd2ee132 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -526,9 +526,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_EVTCHN_PPI        31
=20
 #define GUEST_VPL011_SPI        32
+#define GUEST_VSMMU_SPI         33
=20
-#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
-#define GUEST_VIRTIO_MMIO_SPI_LAST    43
+#define GUEST_VIRTIO_MMIO_SPI_FIRST   34
+#define GUEST_VIRTIO_MMIO_SPI_LAST    44
=20
 /*
  * SGI is the preferred delivery mechanism of FF-A pending notifications o=
r
--=20
2.43.0

