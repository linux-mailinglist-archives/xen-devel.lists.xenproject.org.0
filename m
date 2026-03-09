Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GBEFkWqrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B023798D
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249282.1546815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTd-0005cZ-VG; Mon, 09 Mar 2026 11:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249282.1546815; Mon, 09 Mar 2026 11:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTd-0005Y4-OI; Mon, 09 Mar 2026 11:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1249282;
 Mon, 09 Mar 2026 11:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTb-0003iR-Ui
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:44 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54167cf5-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:40 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9695.eurprd03.prod.outlook.com
 (2603:10a6:20b:60d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:08:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:30 +0000
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
X-Inumbo-ID: 54167cf5-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufKkM76nCFoPrt5Nn8II0vupQM7nW/336xjv7ote/dWX1jCAEb+FUlBOww6D/nRnlSP9tgza5euNjWkJy7SuCPHBC42g+hZ+rVVzaafrdSd3aXlAlR9JY2LwVSpE4jST4vo0hGZ1uCWNWQL9qqOB+hPBfcG3c4evtbG1g6TelD9k/Iy+QvRmG7cQB6eaWs0N7T5KUcuj/M0ThNe1+IIkAlg8jKN1hheOBznmnK5ONJWfUdNLW5lX4DXq9/IoVoXm0a6i0LDmSXMjlW27vmYZs2bIR+kZ/QdP86YW+0Yh35B3eaK2CQGeq3j7unaPM+mA9r480SOPc9yEv9CzUYD8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcvxHQYqTk81Exw11I8k3Jy5Hv2/V72aWoUK5BU4wB4=;
 b=mN8JHW05k2jAsw76jSA4mNSFSLtzHXVfoOrkLgaugGJipBe18LPeGUGmhazMaCP0zC9sHb4/ZY7JNldSCMDKXXGz0/UbQUb7EMTo2A1NzeZ+/qZ/UDl1Y4kVug23m7chgT0/Cbiehq0MuXsAn3g+ZNkyQ7kWZzFmHB6XZyEzPJlJbeT/yQmtj0obZA5WQds3dpQLsL84k94076O1N3s6obHNS0qpdu5FdSlyrKCi3Nu4/nstkovJRgWwxS+HpcdDXFtx+ubc47ZUSAFQGXDJRp1zPfHiJOGbp8YdvauvRwxjEimAI+wbzCrVVQlNI06Wi8w2kFZ8uyyp/YzIIUh8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcvxHQYqTk81Exw11I8k3Jy5Hv2/V72aWoUK5BU4wB4=;
 b=AclPR2nCcBzYHoAcRYSokkEwWghc+D66VDw0SrktIt1283aZ0eQT8Ii41ZfanK6NlKBrqOJIgt+i7n7s8Y/HpuI0SMRUlfIIALMFEih8kMl2lI+OLfkhaWFhcRCQimkBGYCkEoCBEnNlV2MZvOkdIxQm1o+khaLHSaz2rAfmmbXKeh+YAFBJzwUvtVW0O1NB9vrBh1Nam/HaB16jqhBDwQ3PkAH50sGp5KWtLzf5Zv40OuTcIJ8pRpWW4jLjU8zlG+3zaDpJzMpFqHGXMCjRyRazMVL2lkky2OWhEQKnVptd5JT1Ml8tqsVaX3a6FEfLOkSrOsBl9xe92EtlEohEQg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v2 3/8] vpci: Use pervcpu ranges for BAR mapping
Thread-Topic: [PATCH v2 3/8] vpci: Use pervcpu ranges for BAR mapping
Thread-Index: AQHcr7UNO3bwYqCdZkmfzVSjd86SfA==
Date: Mon, 9 Mar 2026 11:08:26 +0000
Message-ID:
 <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1772806036.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB9695:EE_
x-ms-office365-filtering-correlation-id: c0ae7012-27d0-4fa2-b807-08de7dcc3252
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 VNTL2Y5weYB5w5gs2pnkOUmxLsZO4RZe41Or3CD8FPQYOdnQrT9c1YD88R+lbtnFX43mKxY9N2OTA66yE5HJ1KsB8MeUdwFYSRRVnSKuAYm3l3UoCgr4iQLF33HHldNqV7hOvqH7eZov+YW2LA7ZklXea/DpO0PPqHSE8UXTAOFE01JRTHJmyzP6qxcclQq6ltClMc72JQ1GmrhJlwdl6Tz1yglC2lOEcpEyxCbYUy+KLnSztlz4TI5lf3aExlZSHB01eGg70GreP76bGGAEr+KAa4HoJ1ATWetF1ppiMRBqR3KbF1SPCSKIuQY3Ck9NqlvKhOPmEjJq6+3uiAtSV56VS5eoBsf/GwA3Uy6vrjTjNQBMSMSB221+thbqKBKZ3zj1RmzDryx4RcpDSEQoEqqn7a7VXAK633FwHXnj28wPwiJknMWmaYuOtHiKk08a9+KyJV1bjt8uEKWmTIRIm3cLFsRe6JrjSDaUl9LukexVYfWizc6V5RGp8w3J64yQb5ptDP+4jjMq1gTwpO0tGODZfj9yZaDq7H79hgyG5BITA8Hbpts7dNnKNz0b9eTmb9QDC9IYhvFuCJMCe6Kq0zZ2dem2sJ50c18duICIN7pSuoFPjrsmzYjHPKub6dhlmZlKCOy/MMynFWYTraeBKCM5DL1b3lPmfZa9aG8WQ8xpRozzstDdBSWFwvrdfOlV6oraSBvOsKZLBTXFn+U98TPAX92Yo5dRa9PMZT9HAqzYiYRelCNFhhGjKeNmJbFJIED6wWS/+S8SXm1+TO9u5CQDTTofWtXblNBWn4UOvrk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?q2DbLmAQC1qUooapjiJkp0rfFBwH97vOEOJyEtZPwGq1gBvbvYdDmNi9PE?=
 =?iso-8859-1?Q?plJ99S5TfoEuejISpnhV5QdnxKcQqXGpI4cHb3MvqP9ZKnAnbc27R83x5A?=
 =?iso-8859-1?Q?7FdLNRlL2NpOuxQ4gTwnGE2VgH3+WKH63AprLfO1/lVVSDAJLd/pr7LC1W?=
 =?iso-8859-1?Q?Jrvz7d6QKuEDJOoyUsjkJf7C0qzK3f4npZgXfo0pofEvV00Z/jzCqSoulK?=
 =?iso-8859-1?Q?hDTC8yUgVYn74yLgNDpOg3XHt20qlvJKFFibfAS3BW48Z3T0jOQPfIcpRO?=
 =?iso-8859-1?Q?+/5gQQkgI/3My+84ljsDG+toI9vIXLkhzcM/X432gUOYu7q/MjnzSSsppx?=
 =?iso-8859-1?Q?WsCEV/h/BQAWXisIevHQ1ImBfWnDX2RSBSovCCsPfNEfSwNy93zwuCCTnq?=
 =?iso-8859-1?Q?2/uLEmJVk02WoCZPZ00kgI7GCEI2wAM+ne2FhY4GkOffkM0T2mIXzh1arp?=
 =?iso-8859-1?Q?IjLbr//8FZGj+B5VgWAHklR/wEghmj1xJ4vC9r76tb6pYwu7fwMN6f4GZ2?=
 =?iso-8859-1?Q?iXO01l7Jp8sODHhGPylBy12UJLRkkQbAeCYCE747y6zxabvEpMIUccIDSq?=
 =?iso-8859-1?Q?OfIIcW7h69HqqOF1CVyXWT8fFdNGknMiB1cUXFiUzMDihJWxi05p0wDkLN?=
 =?iso-8859-1?Q?SEbgYzrf3eXQj5TbQk4S8FhnTuZBoSCNgQb1wgKuiuJ1Zew+PhE0c37BqT?=
 =?iso-8859-1?Q?IuoaN9oV4Rf2z87Ly7aztX2Mst+5irxniuXWbI2wNSvL8qn0Tt+KLy+J6a?=
 =?iso-8859-1?Q?kNxV1TW/npgxeUPbFfRp7DzBfAgEwmlGSwVmakoLfX3m2X8A9Pv5N+MxXh?=
 =?iso-8859-1?Q?VZ7WNcuw3dGqX7YUYsRgnmH0VIbwa7O1XqbM7FJ8UbGfnsW+CHrikXF9kY?=
 =?iso-8859-1?Q?RxqFURv976dRhbwLSOIpeH9HOgTfRrVl4lzoNPK8NKg2XvWazDmoqMkgM9?=
 =?iso-8859-1?Q?cL+E+O1ym/WqdjKx563zIkte6UA3dM+fmKmBJvr6H+zgl5TvXVSwRXr5kt?=
 =?iso-8859-1?Q?owjotReVRy0l9EqmbHDFlVKRAL2BJQYcKw/mdQBoWJc9DNzopbJvKTIM+g?=
 =?iso-8859-1?Q?atmj3IuvITbOEf+bZj5DRbdfn/HQxqOOcV16JHJT/sJcfgF+j3ef57rSf4?=
 =?iso-8859-1?Q?VPND6G+6+xLh4Q9ytOfquQMgtPTDhLrZzJ07fNxLlThYdigpCHpVG2Cimi?=
 =?iso-8859-1?Q?0PfTVo8pHIBSjNBTsFMw2bTgUPHgE43CGVP4qbFsTI0rIv+h0RKmaPWdsq?=
 =?iso-8859-1?Q?E72GJBzDOWr8p5AyViPrCuHFGChRCNOq3AmtPDWZ/4hiAnMEvO7/52syP1?=
 =?iso-8859-1?Q?/TlwoBvaSn9N+qmbnTmJBNAptIdh55s4/pTYP4Hn0Pz4Ik167kz4AGjxFe?=
 =?iso-8859-1?Q?LVivL4uj97Sm0XKbPulbuM4R8yS3YqsIWg2L9sxxcH13blM2ZvUhlWuK7z?=
 =?iso-8859-1?Q?vtZg7wbNoQXGeNscN38eGMdKNRHIexQ7vFTjKKeub6E0WqkWI3mGpZA1zJ?=
 =?iso-8859-1?Q?pQ/bDZdB5Ystzpnumq3C5jLH/R+kja+TSyvWddR84qnOrAd9EB4t4L2+hJ?=
 =?iso-8859-1?Q?0MNQ+ZBmrrE+0mzAeJJaXDv+OCqP1xAy/Vo/q+8G2w4IZuNEExUyTEJtTZ?=
 =?iso-8859-1?Q?ZyDrZr/ZIXRzt7c7QCvLsDBFDaebAFJqMxwJ3058FHSN78m7CxcLufSIRM?=
 =?iso-8859-1?Q?X+6MS35BBDJ8lySTo3hxSbuJqN3Udc0xkG6EMb2ZImVXuP9z5tGFcHaF/Z?=
 =?iso-8859-1?Q?DPnF3uHd0/P3toJg5TfjjOVoHBjYbI/1d//7tjqVQZV8NDR+pr72AgS2Ky?=
 =?iso-8859-1?Q?EyGtafCu53X38MKgDep3Pn1p8XVBRK4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ae7012-27d0-4fa2-b807-08de7dcc3252
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:26.5055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLbz4qPsJRc/HbrUPT1Xz/A5Ny+whi4Npp/OF4pyateOeuH6YOUVL/gICYaDdbjIINrbqlxJNDwLsmU3mBtL4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9695
X-Rspamd-Queue-Id: DB0B023798D
X-Rspamd-Server: lfdr
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
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

There is no need to store ranges for each PCI device, as they are only
used during the mapping/unmapping process and can be reused for each
device. This also allows to avoid the need to allocate and destroy
rangesets for each device.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* new patch
---
 xen/common/domain.c       | 24 ++++++++++++++
 xen/drivers/vpci/header.c | 66 ++++++++++++++-------------------------
 xen/drivers/vpci/vpci.c   |  3 --
 xen/include/xen/vpci.h    |  4 ++-
 4 files changed, 51 insertions(+), 46 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index e06174fca7..76b0163616 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -454,6 +454,14 @@ static int vcpu_teardown(struct vcpu *v)
  */
 static void vcpu_destroy(struct vcpu *v)
 {
+#ifdef CONFIG_HAS_VPCI
+    int i;
+
+    for ( i =3D 0; i < ARRAY_SIZE(v->vpci.bar_mem); i++ )
+        if ( v->vpci.bar_mem[i] )
+            rangeset_destroy(v->vpci.bar_mem[i]);
+
+#endif
     free_vcpu_struct(v);
 }
=20
@@ -511,6 +519,22 @@ struct vcpu *vcpu_create(struct domain *d, unsigned in=
t vcpu_id)
     if ( arch_vcpu_create(v) !=3D 0 )
         goto fail_sched;
=20
+#ifdef CONFIG_HAS_VPCI
+    {
+        int i;
+
+        for ( i =3D 0; i < ARRAY_SIZE(v->vpci.bar_mem); i++ )
+        {
+            char str[32];
+
+            snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
+            v->vpci.bar_mem[i] =3D rangeset_new(d, str, RANGESETF_no_print=
);
+            if ( !v->vpci.bar_mem[i] )
+                goto fail_sched;
+        }
+    }
+#endif
+
     d->vcpu[vcpu_id] =3D v;
     if ( vcpu_id !=3D 0 )
     {
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 07ec991a12..cb64d9b9fc 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -195,6 +195,7 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct rangeset *mem =3D v->vpci.bar_mem[i];
         struct map_data data =3D {
             .d =3D v->domain,
             .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
@@ -202,10 +203,10 @@ bool vpci_process_pending(struct vcpu *v)
         };
         int rc;
=20
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
=20
-        rc =3D rangeset_consume_ranges(bar->mem, map_range, &data);
+        rc =3D rangeset_consume_ranges(mem, map_range, &data);
=20
         if ( rc =3D=3D -ERESTART )
         {
@@ -223,8 +224,8 @@ bool vpci_process_pending(struct vcpu *v)
=20
             /* Clean all the rangesets */
             for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(header->bars[i].mem) )
-                     rangeset_purge(header->bars[i].mem);
+                if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
+                     rangeset_purge(v->vpci.bar_mem[i]);
=20
             v->vpci.pdev =3D NULL;
=20
@@ -259,13 +260,14 @@ static int __init apply_map(struct domain *d, const s=
truct pci_dev *pdev,
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct rangeset *mem =3D current->vpci.bar_mem[i];
         struct map_data data =3D { .d =3D d, .map =3D true, .bar =3D bar }=
;
=20
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
=20
-        while ( (rc =3D rangeset_consume_ranges(bar->mem, map_range,
-                                              &data)) =3D=3D -ERESTART )
+        while ( (rc =3D rangeset_consume_ranges(mem, map_range, &data)) =
=3D=3D
+                -ERESTART )
         {
             /*
              * It's safe to drop and reacquire the lock in this context
@@ -330,12 +332,13 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct rangeset *mem =3D current->vpci.bar_mem[i];
         unsigned long start =3D PFN_DOWN(bar->addr);
         unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest =3D PFN_DOWN(bar->guest_addr);
         unsigned long end_guest =3D PFN_DOWN(bar->guest_addr + bar->size -=
 1);
=20
-        if ( !bar->mem )
+        if ( !mem )
             continue;
=20
         if ( !MAPPABLE_BAR(bar) ||
@@ -353,7 +356,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             continue;
         }
=20
-        ASSERT(rangeset_is_empty(bar->mem));
+        ASSERT(rangeset_is_empty(mem));
=20
         /*
          * Make sure that the guest set address has the same page offset
@@ -368,7 +371,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             return -EINVAL;
         }
=20
-        rc =3D rangeset_add_range(bar->mem, start_guest, end_guest);
+        rc =3D rangeset_add_range(mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
@@ -379,12 +382,12 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
         /* Check for overlap with the already setup BAR ranges. */
         for ( j =3D 0; j < i; j++ )
         {
-            struct vpci_bar *prev_bar =3D &header->bars[j];
+            struct rangeset *prev_mem =3D current->vpci.bar_mem[j];
=20
-            if ( rangeset_is_empty(prev_bar->mem) )
+            if ( rangeset_is_empty(prev_mem) )
                 continue;
=20
-            rc =3D rangeset_remove_range(prev_bar->mem, start_guest, end_g=
uest);
+            rc =3D rangeset_remove_range(prev_mem, start_guest, end_guest)=
;
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -394,7 +397,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             }
         }
=20
-        rc =3D pci_sanitize_bar_memory(bar->mem);
+        rc =3D pci_sanitize_bar_memory(mem);
         if ( rc )
         {
             gprintk(XENLOG_WARNING,
@@ -411,14 +414,14 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
         unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
=20
-        for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++ )
+        for ( j =3D 0; j < ARRAY_SIZE(current->vpci.bar_mem); j++ )
         {
-            const struct vpci_bar *bar =3D &header->bars[j];
+            struct rangeset *mem =3D current->vpci.bar_mem[j];
=20
-            if ( rangeset_is_empty(bar->mem) )
+            if ( rangeset_is_empty(mem) )
                 continue;
=20
-            rc =3D rangeset_remove_range(bar->mem, start, end);
+            rc =3D rangeset_remove_range(mem, start, end);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -468,8 +471,9 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                 for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar =3D &header->bars[j];
+                    struct rangeset *mem =3D current->vpci.bar_mem[j];
=20
-                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                    if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
                           * If only the ROM enable bit is toggled check ag=
ainst
                           * other BARs in the same device for overlaps, bu=
t not
@@ -480,7 +484,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                           bar->type =3D=3D VPCI_BAR_ROM) )
                         continue;
=20
-                    rc =3D rangeset_remove_range(bar->mem, start, end);
+                    rc =3D rangeset_remove_range(mem, start, end);
                     if ( rc )
                     {
                         gprintk(XENLOG_WARNING,
@@ -733,18 +737,6 @@ static void cf_check rom_write(
     }
 }
=20
-static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *b=
ar,
-                            unsigned int i)
-{
-    char str[32];
-
-    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
-
-    bar->mem =3D rangeset_new(pdev->domain, str, RANGESETF_no_print);
-
-    return !bar->mem ? -ENOMEM : 0;
-}
-
 static int vpci_init_capability_list(struct pci_dev *pdev)
 {
     int rc;
@@ -989,10 +981,6 @@ int vpci_init_header(struct pci_dev *pdev)
         else
             bars[i].type =3D VPCI_BAR_MEM32;
=20
-        rc =3D bar_add_rangeset(pdev, &bars[i], i);
-        if ( rc )
-            goto fail;
-
         rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -1046,12 +1034,6 @@ int vpci_init_header(struct pci_dev *pdev)
                                4, rom);
         if ( rc )
             rom->type =3D VPCI_BAR_EMPTY;
-        else
-        {
-            rc =3D bar_add_rangeset(pdev, rom, num_bars);
-            if ( rc )
-                goto fail;
-        }
     }
     else if ( !is_hwdom )
     {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f66f50c8ba..af61b521b0 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -357,9 +357,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
     }
     spin_unlock(&pdev->vpci->lock);
=20
-    for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
-        rangeset_destroy(pdev->vpci->header.bars[i].mem);
-
     xfree(pdev->vpci);
     pdev->vpci =3D NULL;
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index dd233b8b03..fa654545e5 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -118,7 +118,6 @@ struct vpci {
             uint64_t guest_addr;
             uint64_t size;
             uint64_t resizable_sizes;
-            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -212,6 +211,9 @@ struct vpci {
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
     const struct pci_dev *pdev;
+#ifdef __XEN__
+    struct rangeset *bar_mem[PCI_HEADER_NORMAL_NR_BARS + 1];
+#endif
     uint16_t cmd;
     bool rom_only : 1;
 };
--=20
2.51.2

