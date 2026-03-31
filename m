Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJIvJ/goy2n8EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA2363329
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268277.1557680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHM-0004VB-Oi; Tue, 31 Mar 2026 01:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268277.1557680; Tue, 31 Mar 2026 01:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHL-0004C3-RF; Tue, 31 Mar 2026 01:52:27 +0000
Received: by outflank-mailman (input) for mailman id 1268277;
 Tue, 31 Mar 2026 01:52:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHG-0003GL-7O
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHF-00HCrd-Il
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c4-e002-0a2a0a5209dd-0a2a450a9b40-26
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:21 +0200
Received: from [52.101.69.85]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28d4-1772-0a2a450a0019-34654555cfcb-5
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:21 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:19 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:18 +0000
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
 b=ANVGf2u7+TEta5lzXUQH/LMhZdZFJsqoqmhmgNpnAwXShNYmKUY9uMc1XPvrUsn6mSeKPJgePIkK/DBfgNVue2l7CbKj+wpccQyNQ1U9ew3hd0ytbHbWCWNrzEK7HTtsIX1Yr6bY+rYuFEwHOuNblmtM/mM2Q3gsUE6/VpK+UP3elyNQVAM50qAgtP85EjzS9OkUqGzRDTnNikYKN4dGmjt2iFOsJU8Ok9Sa5DsAZH0PeF2sQ1QKQPzXrxJTfV4vl2rm2FxVt/wqivFx/W6egP5uscGAhXjjJnpp5scirX/7XhRWvpGuyh3oVTSf3wLgOE6hLsE/4y3Vwn9X08fslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O46ZCtqqAtKuVVyR61YNPzdDBAuzXaUE5Bb7qosufwc=;
 b=ldGB6fx+lmnA8RF644BllAEqxqiU5HFhbAWxCXUr00N91uaL/FoUG1I2YB8hYrm+gUStynK7UVc0YVAwGs5vMRqjzvgWvfKrQdAUpmznlALc3qyq7BQpUDI2qturzuv8XUEqATL4DAYmzp8ISRmDBgv9Wikbg3h02h4lRsbPSJxBbsM9BcyajGHq/90+AhVXQ2iOl5Wz5gfBbGHipalK/DzKGluI463snZR/AtrLHeBHFnnQ4cjqMX/xTN62dvAnROeZdeTLPfH4+EfH6mYbgLrydO2enbSV2Zx3uivDtLlpOSQd3/TyFJYMC04v1KbWmn+b9SwtT57B1qOtNDKQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O46ZCtqqAtKuVVyR61YNPzdDBAuzXaUE5Bb7qosufwc=;
 b=I9/Baizy/iYSiHQfaoYscrHsXHDnKVK9CBSK5A9e6mHyZevDUc0342eMO3VpuStdQnEyspYvSZZKvszdEmBf3+/NeXQz2svn2xabmXEo6dNszDBb9h296nLDwekTJpUBomRck+yPoWgj6zKnw5dPzbyfIJSLggjZwqhUBhUArCGsPfv/8cpu9a8CKoDX55ibUCBWTR1y6N7yjJuY5pYCRkhqdffEghj5GyFpYWCJA0LiAPJ3i21igtmSOvE9zNO24lcGQRqa5LofSxiTnZQcKCUtSQoexbpACx/tFxRJ966whzdMBDWSlfuBjWaKdUuBnWMI5+SW7/JxnF7fDsKK/w==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v3 19/23] libxl/arm: vIOMMU: Modify the partial device tree
 for iommus
Thread-Topic: [PATCH v3 19/23] libxl/arm: vIOMMU: Modify the partial device
 tree for iommus
Thread-Index: AQHcwLEB/xiiQuayWE24oh8VONmQUA==
Date: Tue, 31 Mar 2026 01:52:18 +0000
Message-ID:
 <801f1c90347d66ce4427b9c5986809a781d94081.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: b42f4085-fa59-4352-a184-08de8ec82408
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 QFBnQV2BK4VDv9eUgO38nlXPwyMxfZjGHHbhZs31dA+Xy3RHAPFoZUranIhE7iCHXB5s183EqoMiAAFN4WKqryy+fyIEZryJSZkQcwJ/6j+saNPIIkHpxQ0YBJWl/bmQO8RWJTNEN7/diofrYScqdKudv0iXj1ItuxA6+34hS18AZFnTodzz2xkChfBEVcZ6vVMEbtgUWzgotbU06pW4aLodF17CfBKbKlYx270qaqqwafdu/A5lhDUNE2EnJi5hVbJFhyjsdtUkgNnp5rTiO7fykrU6eTXBEdrCXDRs0gbuVHL0aP2E6ehBjgnZ1sEeNJHXtwMai+KQqWX0U04i8TR3p2/nAATnFPKuqzb5nZ+5tIyUdZiuUkJFXiWvGzwatR2aOY7/tJgRmeQru7jXjKJrvTJYkY6kXoK7gA1IBeNmW+eiTNyGH41P1WMF0f+SNjOWVsucVMLXHYh1UhmesfsUpf4DtHxT634vyo3z5vOXsV4ug8GXTLkmRxkvTmTq+kdlJhGXcJ6iDr2EEEVH3Xy4zDbp+vau2u5MdQ5JLgjDFXxGGz8sEArokYofixQrckr1iDpuPAwV2zarFmcAOBJ3XSfhj/7dRIdfPN1dG6YKFcJ0IqGFQbJfMSpwtOW0dnmbRdEDu5yW6BmT5wWbVXkgBAIpPvzO5XWjTBGYjwHhNKlru+bMCUWhqZqqA0GQo7fmvFoS9GVyy/TTVfiovQjocQfjJJXCnu25emDFTG0OH6RXOPkaotLFs9GnxbYsOsmrvh8QsB0Nr4d2u61zRq9n1nsZxCicPlt6v5rZOeY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vE6+OL9eFoGhPzmgIBVJ66cdpQyq5ZpAhS/Xik0H2C48/WX5uf6W78gBzq?=
 =?iso-8859-1?Q?BaKsnKvIf6IawyTSKtABjJ0W0haYhrQZtaMXbJj2FJjvQ9tnD+RWsKeOqr?=
 =?iso-8859-1?Q?JC78ta7aUp11Xz3kWCXZDWNWwvSwLsBaMVuo8DymoDcrJnPG9UzJ2GQbZY?=
 =?iso-8859-1?Q?1mYLZl46WtpTvE1oJOypRoaMkVfZipaKl2gmHAWaHWwBkiGGz+jIIiHOOs?=
 =?iso-8859-1?Q?tjtrUIAkj8m3p/MGAkNa6h56M28LFL60yPcepKAPpURRjUi94S1QOtb7W4?=
 =?iso-8859-1?Q?WirOUFTf/Nj2GzDD4s6B/3rzU5cw96dxbqXWpSxXR+08e2JWJyv8w2Lo7S?=
 =?iso-8859-1?Q?K7VvNaYQNfj88jhs+s8pfa1/4WoNWCbqY/grSJBP6Z0LXDDCnyWFa/yRET?=
 =?iso-8859-1?Q?h56fSU304lDgdbBAaG1sF3QKkomSx/o816hKtjv76/zD6TNu1+P45XmfGx?=
 =?iso-8859-1?Q?i/e5LTgH809KOf5LWByfXBs4HEfFSrjV9tgwo9XWBnRdt7vOX1BhsgNNzd?=
 =?iso-8859-1?Q?msQPPD+HL0gTwe9L9tv67HVrVov+7RmAPZS/a5hwUt6xobEHnHIPnfRr3K?=
 =?iso-8859-1?Q?OfOd+QQzt/lzpUS4GHsGLB4C+5BNFlyqDqUtz5eKTOUuSZ86LPHX1k8hbz?=
 =?iso-8859-1?Q?s+CGb45D3bVCRbqp0y3jOBYd/7JC9wHYc+hic8d3eTOYcQTimYesBHkIga?=
 =?iso-8859-1?Q?qG4Zl8UiuEPv3srrnQAVlNdK89u8WwC5gnJvGrBDtxs4U4iBiiDPo76mRb?=
 =?iso-8859-1?Q?PJuW7J80CS4KG4HoMg0P3YxKO2Tcqy/updy24SxR8bIYZQOKhjxSmruIuH?=
 =?iso-8859-1?Q?l1/KzIq+0iNQQCGrFWloeijF3wo1Y/Jkv4ZMbZhWWF7LVIf3hlmAYAFrDW?=
 =?iso-8859-1?Q?Hn7kTcTfOV23995b6spRL0wfbyzw4nsOpRG1ZwaEbI0XTS6WD3LAhPDngz?=
 =?iso-8859-1?Q?6ON9xbLTg9MLDQmJHHtyEYq52QaQh9MJ/DywKEz0jHWQXwMuNgINfvV1hG?=
 =?iso-8859-1?Q?AnknThRjfMOttCdgxXdaLR0pF5p4XdPXMS1HRRjEvSe4yt+DcOhqwskrw8?=
 =?iso-8859-1?Q?QgqlCsY1WOW0sXwYfS/aGhhujPc1uS1JM9wPSRGa9xKL+9eEpDZhANr3dN?=
 =?iso-8859-1?Q?a8Eo23ntwKg4DOUC0dyancaoRXijVTililmfL2ysWOwLpHmZWgRXXKcjEH?=
 =?iso-8859-1?Q?LAxWNai6pHQIjPZPxHtzvsJFXghwzeJ3BkeDwRhZdG7A1Jj10trwjkoeOc?=
 =?iso-8859-1?Q?0UhLw88g/CdJDnqHYnCYi/+dEQNwbRZ8QGgHeQ0l9fusovbn29xSFtNA6j?=
 =?iso-8859-1?Q?KVBrm3YJVBJ7+uIiJNuYxG+ZBRpJvMvWOGIQcfqgYf8WA3+obn49FvI13g?=
 =?iso-8859-1?Q?7eSzwkfm5gpi/e/bLwpxxR3tGGByhGopFpj0aMgL6g2Y9gboK0qtoqO9G3?=
 =?iso-8859-1?Q?sxgpMBgx+Het362FBtYP8jkNGQs2mCEmjar6ZhH1GK7VCRJIFmkPdLa21Z?=
 =?iso-8859-1?Q?Nd/zIGktQJgeTmW8lCr05C8C+VHRs+63XaQmCwLZWGQq8xGmDcvjZ7x55A?=
 =?iso-8859-1?Q?kIpdl+a0G01JDRMJViO/n1d1d72EApiw3QBzDmmZxIohvoN8ihpN9u4fAD?=
 =?iso-8859-1?Q?nk99zZzIPCw18cr94v5CuTy6We94W9VVpE4qEXLvT2Gv/onQgG6DR6uyi4?=
 =?iso-8859-1?Q?URp6LrRGWWg/qVPWCIEOAmHKENi7X3BUSk14mbpYJ5rqLPCqvrIKOWHKtO?=
 =?iso-8859-1?Q?/stxXlPGIdKxWaj+gU0wp4f122qpQ5krmtUa1fvAywBkxYuRLfrQKMcoV2?=
 =?iso-8859-1?Q?qWRjOJIYHE4dJm7cxj81qfMAwtukceA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42f4085-fa59-4352-a184-08de8ec82408
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:18.1911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayV0zFszs6dZ0mJ3BEZjVS1pjgPi1IxqlpPNJtvt2/HYVPbvLsQHpcXjuW6GaY1IC3MX/BMayZw1KG2PWsxFAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-4011c0/1774921941-50882900-9AC19C57/0/0
X-purgate-type: clean
X-purgate-size: 2920
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 45EA2363329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to confiure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Singed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c | 47 +++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 803c3b39b7..7b887898bb 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1326,6 +1326,41 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return 0;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    int nodeoff, proplen, i, r;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    nodeoff =3D fdt_path_offset(pfdt, "/passthrough");
+    if (nodeoff < 0)
+        return nodeoff;
+
+    for (nodeoff =3D fdt_first_subnode(pfdt, nodeoff);
+         nodeoff >=3D 0;
+         nodeoff =3D fdt_next_subnode(pfdt, nodeoff)) {
+
+        prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+        if (!prop)
+            continue;
+
+        prop_c =3D libxl__zalloc(gc, proplen);
+
+        for (i =3D 0; i < proplen / 8; ++i) {
+            prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+            prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        }
+
+        r =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+        if (r) {
+            LOG(ERROR, "Can't set the iommus property in partial FDT");
+            return r;
+        }
+    }
+
+    return 0;
+}
+
 #else
=20
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1344,6 +1379,13 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    LOG(ERROR, "partial device tree not supported");
+
+    return ERROR_FAIL;
+}
+
 #endif /* ENABLE_PARTIAL_DEVICE_TREE */
=20
 #define FDT_MAX_SIZE (1<<20)
@@ -1466,8 +1508,11 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
-        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+            if (pfdt)
+                FDT( modify_partial_fdt(gc, pfdt) );
+        }
=20
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
--=20
2.43.0

