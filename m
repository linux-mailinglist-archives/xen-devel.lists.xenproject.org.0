Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBQfJgfEwWlUWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3460E2FE920
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259646.1553051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7N-0000uB-V6; Mon, 23 Mar 2026 22:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259646.1553051; Mon, 23 Mar 2026 22:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7N-0000nr-Ma; Mon, 23 Mar 2026 22:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1259646;
 Mon, 23 Mar 2026 22:51:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7L-0000ML-Mw
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7L-004fuD-2c
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:27 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3ee-bab6-0a2a0a5309dd-0a2a4502edf0-2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:27 +0100
Received: from [52.101.65.89]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3ee-63bb-0a2a45020019-346541596237-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:26 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:25 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:25 +0000
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
 b=OVbCtXF35eRRjN7FJ22OzfMI6LocvVzdhWGT8ebYtbLrjBPtxoRfMSWtPBkrWOlDfmZySiT3tCUZ8wtToeKkFEG8W1Eb+r2jP8hbx8ILRW2hGFqNjJUOVNmQXJbGYUMevH0HDP93H1GDLc4z1kr0bMgSYTt9ZWaQjcjWJHPhm1zCxCambu77XFbNoLngzJrUegnTrljuKUxv/2P3RpNJ/edy/IeL8sbT896gzOOuFCavJgpIMf3JucitsG3NIA4b9FOVa8ga2Kihd9eRE05TcE6VXF6FUKyuxee/4CF9KcslO8b9L15DerIX6jHNM8g94qNnYJ+CV67fuRMtjX0FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0wTnJYqnknl+EFQ6EApvgx2yijg5oFENe59EsVpe3Q=;
 b=bxs7/Xh1iKJ4l3exNFVkst11wqdTrL/UnkVlielY3V+CL0oWWXXGIcRTBPqqQwlAZz6sXe6HyDcbJbYuXAZ8lduRR+ln9fw7LOI2InS/gwcUZrxAlF1kYlbeRmaRbTlvk3zb+gQ0aqOzWz8LQtdGrXu4ca03nByj//PUYWtcr56Gro3uwNQzPHZf1/E93ltqATRTaMtXJf8zguTRz9la6PLbc4+WIShCHFsYJs/K+iWVwgfB5WX18iLPec1tl4HhCMujrnhgIOV62j7DC1SP4//Sb48Rourm0FlbZaH0TCFWiTrYd4j8iKyZmh7Cw6LBuHGR7OIlArMEiljdmDYRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0wTnJYqnknl+EFQ6EApvgx2yijg5oFENe59EsVpe3Q=;
 b=kwJiu00eYORjyXWmD8TFqSfvj6gnovLtO07GcxelMhps4HCASdSrCjkUyEoxP9kBs1miufJQ3vOBiOwRFT1opcTDaitSuMGVrTUFEMD3dnf7EWm8GqiUtQBO4A1KG63lzFlieMcZZEWWUk5b+eyYNdE4ErHNVFoP1V4qXhdor+auXz8AW4Bqcpx7fnmI4/u0BOHByC2hdwFUE9usPtVtxduuT/STRe61DweABOTfmLwDNkh6MSEVmQH0bCCx616gRWtUthowWu3tgDd7xw4wdu3RASyRZ1lWnzr7Ixpx60Pc595hXyKoWk8xuq7YQnXBbnGJtN9/VD4M4sjximB5WA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Topic: [PATCH v2 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Index: AQHcuxeTe46TvARpy0KQtl5Gqzj+Bw==
Date: Mon, 23 Mar 2026 22:51:25 +0000
Message-ID:
 <8e451d3d507625bd8d6fadaef68aa40a1cd05e8b.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: a129a0b4-799c-4a11-bfae-08de892eb64a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 +20zHQqdX6rubHthxRlh26lVEa5jls1Vl386g8CnytxGnWBf/0GfLa31W37ckIxissvY6WaB3W8eI2y8NwRNwjN1QWsdp6Wm6tFQXkrQN6VC7PYRAxwR+RpiSp1KbG/n17f+aS3U45nZQbO27l0RYZChgiHeNZOnYri+WWBLG4K1VFPxO4rykY/Vew6rF/ljNBoFQuJuiQeuHfz/UT8ODic7LUsq70A18W/Y3qDLZasl060cjj6wPiMSfQiBw0pTjtX8akcil9+1+ig+lLPHH2fvldcukY8GX1adetilZO09jaQ8vMB6Vy9RnsIEOo63m9V8Rv6B5fwbZdnp0o+orkTR5d6Fv+m3YLKyVTgtsToB/TZTp5Kd/L/gl3P9ZAYpEcCrrXBZpcdSk0yh/mDWjqCQ+iQ7ifQ75cw5J5rdWovVFKjGmkSen+Q0jtpwFvPBU10cTESkM6Xj4HFqrxoe+5epNQ/E650bQ6/Rp+blcsqW0Od6Iej61+59strd120VBt5shwBk1E6TZAMBSHzUkKvhaczoyPZJvdKpH0bT3SW2FHIMzHJYeLgThqVgTBGOMKl8qTrFsErEj1D6E8piIS2lkwAazgj44mZRQXOl4Oh127ucfUbrFChPbZHhGsjnU8LQz8XhqmcQ0H5G2NkYS7r4J+wo7vWWaWADXDKGjmrtpw9RNkewpo/nuWKimEnlWndy81G69uYv0roD02OZn+lautvZTyNVShzUD7DiOo4vhvCU3eJkwHk5/75Vo8V1sGbqQOLPBChYbuMGQtzvRIpOgCC4VGaJQDwj83C4dz0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OR+oy1cKmzFTDdoql0xF9wsZUBWboNt+YMhqqI1ubo72ndS1ob3fIchrbX?=
 =?iso-8859-1?Q?FK5xgG4DkV2sgQP7VlDz51J6cie12B66nLzm1E3h5XzHmYZgbhwv2AXSO8?=
 =?iso-8859-1?Q?84jNNtaW4YGZTUL8v40I7fS6i4azo5Eia3sX0jdFD/C1c5RskUeReCG4ej?=
 =?iso-8859-1?Q?MK4jgCRrgVoiOplMKufN6z+ZSfyGJoE4RTZJ9XpK1lhn15K9YhZ4FAvY67?=
 =?iso-8859-1?Q?0jFhh6+rWdx0sDkydVrBPbobass8OBR9sViPm+X9XS7jbPkL6mFpfHbMUB?=
 =?iso-8859-1?Q?uT5wZC3mx2xM+zx4D4LoQOOfCha6OaqnUQem0DcPAKdogdV7mAHTKeWxOj?=
 =?iso-8859-1?Q?FrZvthPG7vEQMF5EhpmQIz+9eloRA1PS3pcXt9Hs74rgsc/vdw+OgmXiAT?=
 =?iso-8859-1?Q?o4c1+cNoxplWl0NIp5iX+vKw2KtuncE14c4HDxZtWeNPVE4+oYDskhb6/H?=
 =?iso-8859-1?Q?gQjJJkonrASUmvKzS11x1MYLubYhm8BBzYbWR4O1nHqiF1WBgjLrNCSJOE?=
 =?iso-8859-1?Q?phnBjomS4o/NNJ78ghDp1j+ff3ffxlt4vMZw2gp6nIewPUAu07Bblqq7uG?=
 =?iso-8859-1?Q?+ZkoveJdTZhRV316lV12f0rtKjjLqwCoQdLE0FP/Km1eCr6rckrF8Ov8kG?=
 =?iso-8859-1?Q?NUJFVei4+xtpbuzMnO2Wx3Nm7bU683QUUTZbCx9B8ORnJFMpkMRvDhi2cV?=
 =?iso-8859-1?Q?ePZqe9LpAGgrQjZ55Mha7zfPQPAVRkrFUJ6NwAJXF8bGJhxpERYVWLLpgF?=
 =?iso-8859-1?Q?eHDU9MEZt4SYPUfqgB26e3KioqSUoax7iJLIof6xysmDJObUkR6Su9o5I5?=
 =?iso-8859-1?Q?GBR7Z4dfJ/rd2GvNcn1o4qkNjF9iOjztwNcVMOpCZov2QKyzPQvSIINhhc?=
 =?iso-8859-1?Q?DDjgLY3eFnE3P3xJklIAm/nQKC/ioLKrKvR0Jct4AtCxClL8vAz++nrbja?=
 =?iso-8859-1?Q?b5dSmoqhVi7uiyiht5bN9cRYuXISgO/pl9bEK1RhSVq63dGbjSnq2+GHKk?=
 =?iso-8859-1?Q?EJPPYSDzq/mrwPfMnlXVDJq/IwzjcbJIuS7cCHtgx8W3e8sBjIeNIn0wOV?=
 =?iso-8859-1?Q?ypP4OtCIJDVD1VJg475jyftmfuljAl0AeoWwjRtJqt31n9O1RuxLtEz9ox?=
 =?iso-8859-1?Q?xWNxqwpnOMcRLU0sWGB/aZkXxmHAlNezxtCFRUzpLmjOwzwX6tJ+FLzj34?=
 =?iso-8859-1?Q?p2je/jjN/Xq3IVrAxtLrS2n4v2dLtnaADtpAuXrSrdggaBEfQvOZG2GNO1?=
 =?iso-8859-1?Q?VEqw/uOnN2Qi75uPaa7uaHYjq+NByHUOTI4LWeFrtp46IlN6H7wHCwzufn?=
 =?iso-8859-1?Q?IlsQ7nxXKAoGqilZLljbfo3B56whfm41V2xFBmoGx6jW4KHG/ut871Vw7F?=
 =?iso-8859-1?Q?Cs4/S/VTKIwAIy3ckPzx9UKeBEQIZHPbVx/RBV06lC6Ld1nzfd+M7aqW2D?=
 =?iso-8859-1?Q?jAQRZQflYfwbAshwLWWdTe9GIl1f+q/z42iD5LLej8J5Uin9TckP/D4Cfb?=
 =?iso-8859-1?Q?877p2LSQ7MS0bP5mR41RvtQ3+lsaXQXgH1w5OAUa1nS10gCjmnNkY5WHDe?=
 =?iso-8859-1?Q?qw9NyAtpBelLxZfNpd6Z9TykLydonIQM2Gn1tUj782KtcXHx9oPFTf5fKk?=
 =?iso-8859-1?Q?5qt5ushHipKEN7CzXqICsd9R71C0AnXnRW/yAe6Tx7DB4lcvqQLleNwN6c?=
 =?iso-8859-1?Q?dpXc0bg72nGCLhroEiqHdVTcP8afdB8WpXMSurtZjiab98CITFFdg6nAik?=
 =?iso-8859-1?Q?gSMO1DMGJUvMevmlpRySRo521vBlZExTTafHjbaQJMDRYQFF7HU7ryNWhx?=
 =?iso-8859-1?Q?7lXnkyZ99V2fqiOyrx9nIDfuOZ0UTvE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a129a0b4-799c-4a11-bfae-08de892eb64a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:25.2756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5yxok8ltPleLwDcWwrWRp0hyc8fRJ6MJraNhn5o86PvcJpLrobfmJB1IDQ5Q2jjCxlfKYboKhNrhlCXfeUpeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-720697/1774306287-68176DB8-E2804FDC/0/0
X-purgate-type: clean
X-purgate-size: 11293
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,epam.com:dkim,epam.com:email,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3460E2FE920
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Add initial support for various emulated registers for virtual SMMUv3
for guests and also add support for virtual cmdq and eventq.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h  |   6 +
 xen/drivers/passthrough/arm/vsmmu-v3.c | 286 +++++++++++++++++++++++++
 2 files changed, 292 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index 3fb13b7e21..fab4fd5a26 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -60,6 +60,12 @@
 #define IDR5_VAX			GENMASK(11, 10)
 #define IDR5_VAX_52_BIT			1
=20
+#define ARM_SMMU_IIDR			0x18
+#define IIDR_PRODUCTID			GENMASK(31, 20)
+#define IIDR_VARIANT			GENMASK(19, 16)
+#define IIDR_REVISION			GENMASK(15, 12)
+#define IIDR_IMPLEMENTER		GENMASK(11, 0)
+
 #define ARM_SMMU_CR0			0x20
 #define CR0_ATSCHK			(1 << 4)
 #define CR0_CMDQEN			(1 << 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index e36f200ba5..3ae1e62a50 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -3,25 +3,307 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <asm/mmio.h>
+#include <asm/vgic-emul.h>
 #include <asm/viommu.h>
+#include <asm/vreg.h>
+
+#include "smmu-v3.h"
+
+/* Register Definition */
+#define ARM_SMMU_IDR2       0x8
+#define ARM_SMMU_IDR3       0xc
+#define ARM_SMMU_IDR4       0x10
+#define IDR0_TERM_MODEL     (1 << 26)
+#define IDR3_RIL            (1 << 10)
+#define CR0_RESERVED        0xFFFFFC20
+#define SMMU_IDR1_SIDSIZE   16
+#define SMMU_CMDQS          19
+#define SMMU_EVTQS          19
+#define DWORDS_BYTES        8
+#define ARM_SMMU_IIDR_VAL   0x12
=20
 /* Struct to hold the vIOMMU ops and vIOMMU type */
 extern const struct viommu_desc __read_mostly *cur_viommu;
=20
+/* virtual smmu queue */
+struct arm_vsmmu_queue {
+    uint64_t    q_base; /* base register */
+    uint32_t    prod;
+    uint32_t    cons;
+    uint8_t     ent_size;
+    uint8_t     max_n_shift;
+};
+
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    uint8_t     sid_split;
+    uint32_t    features;
+    uint32_t    cr[3];
+    uint32_t    cr0ack;
+    uint32_t    gerror;
+    uint32_t    gerrorn;
+    uint32_t    strtab_base_cfg;
+    uint64_t    strtab_base;
+    uint32_t    irq_ctrl;
+    uint64_t    gerror_irq_cfg0;
+    uint64_t    evtq_irq_cfg0;
+    struct      arm_vsmmu_queue evtq, cmdq;
 };
=20
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
                               register_t r, void *priv)
 {
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+    uint32_t reg32;
+
+    switch ( info->gpa & 0xffff )
+    {
+    case VREG32(ARM_SMMU_CR0):
+        reg32 =3D smmu->cr[0];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[0] =3D reg32;
+        smmu->cr0ack =3D reg32 & ~CR0_RESERVED;
+        break;
+
+    case VREG32(ARM_SMMU_CR1):
+        reg32 =3D smmu->cr[1];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[1] =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_CR2):
+        reg32 =3D smmu->cr[2];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[2] =3D reg32;
+        break;
+
+    case VREG64(ARM_SMMU_STRTAB_BASE):
+        reg =3D smmu->strtab_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->strtab_base =3D reg;
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+        reg32 =3D smmu->strtab_base_cfg;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->strtab_base_cfg =3D reg32;
+
+        smmu->sid_split =3D FIELD_GET(STRTAB_BASE_CFG_SPLIT, reg32);
+        smmu->features |=3D STRTAB_BASE_CFG_FMT_2LVL;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_BASE):
+        reg =3D smmu->cmdq.q_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->cmdq.q_base =3D reg;
+        smmu->cmdq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->cmdq.q=
_base);
+        if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
+            smmu->cmdq.max_n_shift =3D SMMU_CMDQS;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_PROD):
+        reg32 =3D smmu->cmdq.prod;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cmdq.prod =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_CONS):
+        reg32 =3D smmu->cmdq.cons;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cmdq.cons =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_BASE):
+        reg =3D smmu->evtq.q_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->evtq.q_base =3D reg;
+        smmu->evtq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->evtq.q=
_base);
+        if ( smmu->cmdq.max_n_shift > SMMU_EVTQS )
+            smmu->cmdq.max_n_shift =3D SMMU_EVTQS;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_PROD):
+        reg32 =3D smmu->evtq.prod;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->evtq.prod =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_CONS):
+        reg32 =3D smmu->evtq.cons;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->evtq.cons =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_IRQ_CTRL):
+        reg32 =3D smmu->irq_ctrl;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->irq_ctrl =3D reg32;
+        break;
+
+    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+        reg =3D smmu->gerror_irq_cfg0;
+        vreg_reg64_update(&reg, r, info);
+        smmu->gerror_irq_cfg0 =3D reg;
+        break;
+
+    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+        reg =3D smmu->evtq_irq_cfg0;
+        vreg_reg64_update(&reg, r, info);
+        smmu->evtq_irq_cfg0 =3D reg;
+        break;
+
+    case VREG32(ARM_SMMU_GERRORN):
+        reg =3D smmu->gerrorn;
+        vreg_reg64_update(&reg, r, info);
+        smmu->gerrorn =3D reg;
+        break;
+
+    default:
+        printk(XENLOG_G_ERR
+               "%pv: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
+               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
+        return IO_ABORT;
+    }
+
     return IO_HANDLED;
 }
=20
 static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
                              register_t *r, void *priv)
 {
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+
+    switch ( info->gpa & 0xffff )
+    {
+    case VREG32(ARM_SMMU_IDR0):
+        reg  =3D FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
+            FIELD_PREP(IDR0_COHACC, 0) | FIELD_PREP(IDR0_ASID16, 1) |
+            FIELD_PREP(IDR0_TTENDIAN, 0) | FIELD_PREP(IDR0_STALL_MODEL, 1)=
 |
+            FIELD_PREP(IDR0_ST_LVL, 1) | FIELD_PREP(IDR0_TERM_MODEL, 1);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR1):
+        reg  =3D FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
+            FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
+            FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR2):
+        goto read_reserved;
+
+    case VREG32(ARM_SMMU_IDR3):
+        reg  =3D FIELD_PREP(IDR3_RIL, 0);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR4):
+        goto read_impl_defined;
+
+    case VREG32(ARM_SMMU_IDR5):
+        reg  =3D FIELD_PREP(IDR5_GRAN4K, 1) | FIELD_PREP(IDR5_GRAN16K, 1) =
|
+            FIELD_PREP(IDR5_GRAN64K, 1) | FIELD_PREP(IDR5_OAS, IDR5_OAS_48=
_BIT);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IIDR):
+        *r =3D vreg_reg32_extract(ARM_SMMU_IIDR_VAL, info);
+        break;
+
+    case VREG32(ARM_SMMU_CR0):
+        *r =3D vreg_reg32_extract(smmu->cr[0], info);
+        break;
+
+    case VREG32(ARM_SMMU_CR0ACK):
+        *r =3D vreg_reg32_extract(smmu->cr0ack, info);
+        break;
+
+    case VREG32(ARM_SMMU_CR1):
+        *r =3D vreg_reg32_extract(smmu->cr[1], info);
+        break;
+
+    case VREG32(ARM_SMMU_CR2):
+        *r =3D vreg_reg32_extract(smmu->cr[2], info);
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE):
+        *r =3D vreg_reg64_extract(smmu->strtab_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+        *r =3D vreg_reg32_extract(smmu->strtab_base_cfg, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_BASE):
+        *r =3D vreg_reg64_extract(smmu->cmdq.q_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_PROD):
+        *r =3D vreg_reg32_extract(smmu->cmdq.prod, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_CONS):
+        *r =3D vreg_reg32_extract(smmu->cmdq.cons, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_BASE):
+        *r =3D vreg_reg64_extract(smmu->evtq.q_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_PROD):
+        *r =3D vreg_reg32_extract(smmu->evtq.prod, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_CONS):
+        *r =3D vreg_reg32_extract(smmu->evtq.cons, info);
+        break;
+
+    case VREG32(ARM_SMMU_IRQ_CTRL):
+    case VREG32(ARM_SMMU_IRQ_CTRLACK):
+        *r =3D vreg_reg32_extract(smmu->irq_ctrl, info);
+        break;
+
+    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+        *r =3D vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
+        break;
+
+    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+        *r =3D vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
+        break;
+
+    case VREG32(ARM_SMMU_GERROR):
+        *r =3D vreg_reg64_extract(smmu->gerror, info);
+        break;
+
+    case VREG32(ARM_SMMU_GERRORN):
+        *r =3D vreg_reg64_extract(smmu->gerrorn, info);
+        break;
+
+    default:
+        printk(XENLOG_G_ERR
+               "%pv: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
+               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
+        return IO_ABORT;
+    }
+
+    return IO_HANDLED;
+
+ read_impl_defined:
+    printk(XENLOG_G_DEBUG
+           "%pv: vSMMUv3: RAZ on implementation defined register offset %"=
PRIpaddr"\n",
+           v, info->gpa & 0xffff);
+    *r =3D 0;
+    return IO_HANDLED;
+
+ read_reserved:
+    printk(XENLOG_G_DEBUG
+           "%pv: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n",
+           v, info->gpa & 0xffff);
+    *r =3D 0;
     return IO_HANDLED;
 }
=20
@@ -39,6 +321,10 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
         return -ENOMEM;
=20
     smmu->d =3D d;
+    smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
+    smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
+    smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
+    smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
--=20
2.43.0

