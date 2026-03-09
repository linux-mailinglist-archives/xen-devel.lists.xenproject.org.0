Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLa2NkWqrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C7237994
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249281.1546809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTd-0005VN-BP; Mon, 09 Mar 2026 11:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249281.1546809; Mon, 09 Mar 2026 11:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTd-0005Ra-3Y; Mon, 09 Mar 2026 11:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1249281;
 Mon, 09 Mar 2026 11:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTa-0003iR-UV
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:42 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53e0db43-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:40 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9695.eurprd03.prod.outlook.com
 (2603:10a6:20b:60d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:08:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:33 +0000
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
X-Inumbo-ID: 53e0db43-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxWOtq7Ket8+vHZ1LjOEdZw9ahGNiYEpdifGh/lgGsUS4A8LYZ6UyoUgvBfDY+nKtGDHKAaq+t74o3p6LTvwZiMZGOMXd3DHTIp7/4RlWv8a8e9a5IouEnxbBLX6d/JJJoEUCHgjuv3yRQXwNm5XUl7zOFGiFfETR6YEqMgl4w0QZZmgjuX+zoNpWw+5E6xEeEMb9C5YWSNFhwD3pF7Sr7nLSUKaJnE9Z1JmbbB8g16OnU4SWBQUtSGgs9U1UlJOhyz32wc5kknmnYpClkNQBU3YmcgLahKn+FX/g6GNiXOKdJAKmBHClZD7R5z95XCum4ShWsvLd0LFyY6vmFPXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqQ9wzGtIwcLcpHstce4KsP+TKXKqpd4rz2ohRjKgNM=;
 b=vuo3GlXuAraeL20W61I3y0pWNfChfYlqv2AAyxDMJ4Dm25cc5CS5Eej3ByFoU2LiLSk4Iu79ECM113/dH82A94SFD24G4yquCWvrPMOiAybFKf3tXUuqOj0wh2JbhzCQLL9ROJuK9s/qU7uvQwsMBjfy/4sK+mn0i216YaaYBiKhB7Z/sQ9mW9f32xF5XDw7EeRsf6hv81nhOiBK0uN0loYz6CKH3WMok+AOpjLU7KzYyo8kPCNgXd9zj+KcolxrIyhSK+6Axz/RAaLyMhrnlefC9pMhwR93GOO5YSMqJsyw3eyuAbGIqqf4pInmIMhnbud16M2ckBKrXY2d52U1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqQ9wzGtIwcLcpHstce4KsP+TKXKqpd4rz2ohRjKgNM=;
 b=W57iWa9SEqPzaCtzjOuEnb6OKBC9o4weC9pzbAs12ZPhL4MF1AetZONY4T1zJGW3MG1PX2VLeIjINM9AAdS0ryoLb3nqg4wCPnXZbvEbPhUX+/vaau8Tl30OHQx8W8gd/7KdVdEQ6ge1TEpX3jWEdd9Q+SMHGcFCaM1XGCmjhshbQCMk797F/GxNmYo6S3uPDUOhbezbmP0sSrT/yXTIDmgJo7dDf23IX9rW7vKvR5yCa8LmyCuYzS/v9ewBSyZMySOe4dTwGJbeba2X1+FgDg0Tc40cr8J1hxP5ODFEthMob+j+iI3K4EaJVxIfwsqgvSdeynzEE+tRK9Z8LTSIrQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 8/8] docs: Update SR-IOV support status
Thread-Topic: [PATCH v2 8/8] docs: Update SR-IOV support status
Thread-Index: AQHcr7UOSOcW7ORQ4E6npAgqHkuyvg==
Date: Mon, 9 Mar 2026 11:08:28 +0000
Message-ID:
 <955759c5a770a8be54b6e7ae020915c78576005a.1772806036.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: ab6758fb-bd77-4c08-7f76-08de7dcc346d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 U8BY+OVTyQQHbwJSV5kZ3zhS0KgozOBhG5hs6OoiV7pTvl8C/SL4VyXljcZlhMDHFJd8Xtly3eqirOudMscRKCLGPcnX4tOb6gM8l/A66m29DHSyJj/WYZXrSDN52aLyxCRCKKrqT0pZ8BbMLfukPU9HQovHxPzpoyLL2zs3tZMRGAL8Zcp0Es3AhJ5K5D8TSAeGE7Ngs0C/eukTJPTyQc7U+4ypgu+wIWkXYk3UdnbxI/uP6WnExvBtazZlg5o1n2FdZzqphrordaSiMPD+1aX23py7cHEcW9ncEQPprAbTgQ2c/m9c/NMBHEfdaE9Z5Y2c+j2pbOY/e12b5MnJKzB6alYTV0Bm6YI8+LxjiNS+ik/jPJFUdH6OAUucf3DD8gFb86Fce6KnJiwUdNBS4wHmJ/Ig2xswAk62JRz+xusJfwMCr5ddpGfsjQyP4UvQ3wh37t+P3tM9/62N+tF2O7dR075AKLbKaMJD/hTEsSjvceATTYavyDK21arUU7PPL+BRKYFoN1QQ3Hnjl8DWPMJxeAFR8FDXtzzxSjMm75hm82zArBgmPAxy+Q9iZho6e0m22VyeoJhCsJhs6dbTrQaIQE3z6j3bdUsMnKFIa2rzH0IFFL7iauv58Mw1xMUzWiPqveU4J+Qeb31D548jXPxDyxRcrFnsWTxC9CDGwYoGUrbrqkIxSBQWFtg4ZERre6pZWUjN4cJfxkvVUPe5TVIyw/y2GAwebgjMeIRVocOf16VOxtZG+B5Zf5PtruqIn9N707JxQ+YnAvqL5mjtIFS3KItTcTDWtmvW39W4Cl0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HpRAy9xWLFZhyTlImjxTAzMMHIaBc80VZlvSia/5WdWvi7aokfQXm5bzbk?=
 =?iso-8859-1?Q?mX1pHzSi5qK7IYWu2/BTTLhYawBkZBQFWDUHRMmU8aubobClzC7X5DS/eU?=
 =?iso-8859-1?Q?NkrOX9wzznBwlyJv2qENWdrZSN5Q61qf9SM3kE99760RbGQi2cmMOFpTnU?=
 =?iso-8859-1?Q?OnsgGUBkB/7Cnr1sNVMRhvbdFsUrlJ34v6GB6k5K0w8TngbeTazN8pRfwC?=
 =?iso-8859-1?Q?tfktw3t4rYbdpuyrVEnh5J6RUZkHB3U56SLwRPop4qRIOkukgm/H1Rb6Qt?=
 =?iso-8859-1?Q?VfcG9Vk6+UZuzaolEfQTSlfGQNTlH3s0Z/e4+9pdTGt651ODAeObXg3pSk?=
 =?iso-8859-1?Q?b+U9aAttoOZo+ZnAN3Rz05RaNep8EPsl45BONFd8nOCurOfGbolRcwN6FE?=
 =?iso-8859-1?Q?bn7/a0YVDe4011MCX4D/CLeA6TLpuyhGX9GOQoLsMZ/hJ1QGIM55LpVvdi?=
 =?iso-8859-1?Q?i7Fnyni2XwBf4cRiRCzAZhYoI1pTxMmbv1CSp4QU4+iCsJys62NF8POrxC?=
 =?iso-8859-1?Q?/d30JZr3U3e3OWe4tCvkpdmQxXw3xtjihnoS1OD5zkEdoMXESgFtuBgoDp?=
 =?iso-8859-1?Q?PbPMvwqqY5uNOANMI5U0bYlYZOcyiWKmnvLJQimNfBegdcMaUeo35FpxDo?=
 =?iso-8859-1?Q?5DW0GnN/TxxGtpp5RCksonRZLM/khe377X9L89wdUYsemS3/8GIL4sb2jZ?=
 =?iso-8859-1?Q?eBXaeaKBUhmewrS5hKWOgBT3WgR+JTyXny+I0pQ9lN4398B8FI+4ZuszjP?=
 =?iso-8859-1?Q?d5mL1mFITlED6k/nIjaskR4dRmuIlUprzO9MVd7htz9x3LrBxiujlgM/iV?=
 =?iso-8859-1?Q?DF1GH4JtQPFj0JcpeSUM9Hg7wZSlbPLl/gtvUZMKh4r9fT3DIiSqO37Con?=
 =?iso-8859-1?Q?+wLZrdvhaV9HRWb2rRM1nosv6kJoLpMiyMroKjglxFWsJv0SkLziLq9/sX?=
 =?iso-8859-1?Q?xnmfIcPNcUN6dks3+eNBVQIpLhSXgeY2OABVI8jlp+j6rBURttTx7vdtQA?=
 =?iso-8859-1?Q?49LrPBY/hqmbQiAuhYlt1Tyd+J34AxXS3e41Wzw7YuGLcvu4ZmXRKOcRNB?=
 =?iso-8859-1?Q?i6pBhlVQEa/q88m+JhN/cauOTJHcrxdV2FDf/YdHpYjtwM6rnlaW8bpYfx?=
 =?iso-8859-1?Q?R+rN5XvDd5VmmjLTZ5q42P3FvW09nO/z0ZQt7fVY2Baa5hahVNBuX8uK8Z?=
 =?iso-8859-1?Q?Z7owXDQ0pMs89cxf2PBoV0gglbJUyyuqZsrSRCQ4edB2eLe9IdMytw+K/D?=
 =?iso-8859-1?Q?evcdepVrvGMgGt+anrlCMheBSuogwsDcIKvGjxsLUg0XVHqho8Skd8zb+C?=
 =?iso-8859-1?Q?JhSkxow8NaWiRpR5gh77MBIn67zqN2VNH0Cbjw85rmXa0LoSYxmfNeC5kP?=
 =?iso-8859-1?Q?SGMdT3DB+flWDt17koFHv0gPpIME8wTTDxosNS20mALu3zZU92OsCKtqCk?=
 =?iso-8859-1?Q?YRg7BQgfWsmeNK0X3pbe/iY/GULWMyIPSp0N6e5TEzSng8HRXNEhQNJDNE?=
 =?iso-8859-1?Q?YJ64IftVlSBEW6HX120IAwbyj9yzWSVzQOka0gpQTikiTgAVss2nBfurE+?=
 =?iso-8859-1?Q?1N9463YE+b2h+P6rgonBEO3K86+gtCOSojkINcrDwe4JJvaLSPjK7/oCZG?=
 =?iso-8859-1?Q?8QdD+r/yv6/C18LO8qKzV62s1TknsPHMkeQGqLJQkrHd2dIRgM0X86QAPW?=
 =?iso-8859-1?Q?42IFBfmiOUlhowJZ8l1d8sobbmhYxGhhJZAAb/q8dC1mx30iy5kyAxDEg+?=
 =?iso-8859-1?Q?+nxaMQvEUgo3PFYZJnDsX12cSQA//2Pugj2NLKiJyN1Y6XttYn/sVLpnsY?=
 =?iso-8859-1?Q?1nyPqHG70vv9qdIJjf+DAKK+0LbY8c0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6758fb-bd77-4c08-7f76-08de7dcc346d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:28.6501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwmSREvtmI4/tGJs/xbNq0uQQsHq9KAnOQHmoE5+rJon2T7bonKvu3Hduy/Wg+LE9nNH7KuT7FJRQHQ+bqFyvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9695
X-Rspamd-Queue-Id: 5F6C7237994
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,support.md:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* new patch
---
 SUPPORT.md | 2 --
 1 file changed, 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..c01853fe7e 100644
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

