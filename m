Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF/6IwXEwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550C2FE8DF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259662.1553100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7Y-0002ht-Hf; Mon, 23 Mar 2026 22:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259662.1553100; Mon, 23 Mar 2026 22:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7X-0002Zt-UD; Mon, 23 Mar 2026 22:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1259662;
 Mon, 23 Mar 2026 22:51:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7V-0007Yi-JJ
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:37 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8bbe2bd-270a-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 23:51:36 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:31 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:31 +0000
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
X-Inumbo-ID: d8bbe2bd-270a-11f1-b166-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXMPtxyhKlbH1Uc3xsZWI8Xji5fsaYVovgt1iss/YuRhZIBydIwChlaeOWT28yV6lx1un34UzaXqLOfkIig6uJfh+ZcP3TIlgpmPFBS85ZhqYVQz3sCrKyH53lwjOdyPK/mjRY9qNZR5NstriFJrVcqFT/CH3klfVlo3hsZgfYqlLD5WGw1Ava/afdnXyBx5x4oDWNhkGzEGQTYvvAqln7IUGFXmKJQPffE4SuuNQi9FIVg6vMPfWt8Ok+CbPO9GdDWuCf5lpyc7aGllM0D5OhGPEh7ZM/FLIKP7wWcgGoGOCbLidEu63/Xg8LMpYFrEs6H+LOhC1jalrwwI3wjE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO9PYUtKOX8lJokW8oBzBREFFpjQfyQhUx0oRWXCi0s=;
 b=KIFa1DLfHw4mnGxaHisZNiMb2pimdnCwdJm/X/3zKmAaKYq9as+EBkkxiaxuECnRJKJfDTcTCGUuE6eEGpk6OlOkw3Z/kiNO7yj8FFn8WbdNXsKY43CULhcJXyICAJlKgjZ33qOtwri4G3L8f7EGUxyCR2mNc35jMNGv0BiaKJQigdS7yjkzXFpZkuVG/ospygbJ+nRYnlFMdIm/0zvT9I2WZDpoiG1c4vX+b+htKFrLb/aHDsXW0GkoOoPHMhqli75Wq9cY4EixyiV7cRNkcRWTOy0n4GeBvo+5yeCOkAVGFTVZ3ohXwUIRoRxaE0107rBr8ed0NbQykJgEOdsUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO9PYUtKOX8lJokW8oBzBREFFpjQfyQhUx0oRWXCi0s=;
 b=WVgGum3eeZiiUzukZlGhdUxUN5KVhnEolPHENqIYUmOaftHBEEiXsUnwF+dTjid4jmnh/aZBn3RLDY9I5qtXCCriput4JyVP83U7c6qwRWZVrHAyhrSnorZOmtZVEJJtAwlXX1LpkATpGUK2bzsBn8alwGfp2MVgSkYdiOSnHXw8DpsYgGmiPb+mzseZbiixEWVSvDZmYzAWR/XLWR7zifJFPo9RlpmrjeteHoK7e47TBMQrmu+pRjmCXeju595PKQng6R86FElb3Uqu68IarbCMDcczI65FY1qLU+oAUOfSY9crmOlcHNzcYPAY8FGQqoBX+ENn9FcMNzAwvAjujA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 14/23] xen/arm: vIOMMU: IOMMU device tree node for dom0
Thread-Topic: [PATCH v2 14/23] xen/arm: vIOMMU: IOMMU device tree node for
 dom0
Thread-Index: AQHcuxeXC624ZoldckuU0V7x0Et1dw==
Date: Mon, 23 Mar 2026 22:51:31 +0000
Message-ID:
 <4e8d67c8b643145fe05b978f8c765e52550276e4.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB9699:EE_
x-ms-office365-filtering-correlation-id: 2f8f6f82-a7a3-406d-41cc-08de892eb9e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 W1wEeKG/cq2JjagtaUtQgDSqWf/KQGz/FHNXO0GgSUS7riCIPHdrco/dP8kKM8sTCIHjETsf8CGC9PFfkCBJjiADqJb+c7YgrMgMGenXqRZqWLZu1+5GJo6LFHqfTO3FB8g7B5P0eDIf1svJ/Qx01c7dejdjcfMNFeMSpZwXZ2Cx6gauBbjUjb6IVcexMYGTCowf/MWkaXvRksX+RHijhMP9rIfEEKUAmQqDeuyKAekp2TH2Mq8o0Pfm8N4WPEvpmj02va4K7Piqhjnd18/b+qvT4kRhGmn1zcxg7vhgBAcIkcoYijtPlX5Ao5pChRDs23cB3J7FxakVBP7PEw8g7yUxLkwN3NElWl8i7irD84K+gudWQAExbjt0Hl8Z21tJX+lCq3/jzWNOhtneDDRzWj+PBqu7UjvjfH403DRd0QXo5MhouVUBgU2oJ2YN5PmbV7AIhEFOrQwIQCef9nCaxbRlmOCRxo7hcEzHvzKcNVCCCi2djbipDuLp1QB39C0Qj+fhKlNDbHozaDa0CvWxLo+ygTCEmCAo+MO/YvS2dUVkaHSiXKxry+IT/3iNRnjKJptg/UQSpo+9/ORFKRbqAwgpxz0TRQsCYznNY7F693ObMo/tMys3pkdVYxD97kRGQoj+eckKPVBTNyP8G9SRLsCh75uaMIy+iYWft9oCrJpN1ULu1k05I+X8oV9ZQqcWCYdgyjMMuGVM1neymt9ASl7XHqzHj6H+JpMUDseUVGp/9tKTGSOe2fLyvmtzU1aN/NYa/wqRTZKV/33xu9PcLnUVAwT/6wp/7kucDrlyktA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UQTkLi9tQsUNsbDp7eacQqcaHjoRSBd746KBq02mn5e44iC+LcpcYH4Nyu?=
 =?iso-8859-1?Q?7E/X0g/gmwiQXbr+IHyQ+AWPCKJeZ8OMZBQOnzUJy9GLHBjFqnALLL+s6C?=
 =?iso-8859-1?Q?iGQEOmZ6kimCMrLB01GiuFEV9LVMbhUEhETxnafJVXfcBMlDI9291jYKpQ?=
 =?iso-8859-1?Q?4XzkBwXU54WQSDr8WUl0BJCaP1gTMqdEGMNBP6X0RR12nxS93xQdFAgQ10?=
 =?iso-8859-1?Q?JMOj/sr/YaZcz8qUD0rSV6bkW9/oNiOm/rqnWdq9eHKMntvbtUFOUto58L?=
 =?iso-8859-1?Q?rZafbf37hPn/v2sXqbo9/yrGz7dVtrIOO0TE/HAeolQdMpicmeaOTQubuP?=
 =?iso-8859-1?Q?/XbAGk1U/YDMVrunDV4maAb9nY0OHzJlQOgZZLeZQTgZnZuJBXkdGF0km7?=
 =?iso-8859-1?Q?WK+2dbPl5foDCaLf1pus0vVTKixNU1vg1o0LbhbXwW1aQwAiss9xgC26xh?=
 =?iso-8859-1?Q?cMQs8O0sgYMaepBhdA7sNx+npnLf5BUuA/wQzx6IWzNnZFjUV57ZRX9xHQ?=
 =?iso-8859-1?Q?j451GNO/tJGnOUdb7314D3uH2l4yB/ArVAZIuIUEIGxvbvQEyr9ak4Xki6?=
 =?iso-8859-1?Q?50YL70JW2OGHRb6vqXE8syx9CfJle/AP14oiK5sTkYjTgBO4VgKypyUCcZ?=
 =?iso-8859-1?Q?xETHYQJ/FjdrA4s/eFDXtMRdOaONl2RBuS0DRG+W/KRT93It630KKJxSkg?=
 =?iso-8859-1?Q?lU/IYoKUqBecGikv/JEkPqttK59egHNjb/BmvIiiSWLw0Jwn4kDWf3hwdM?=
 =?iso-8859-1?Q?eaqa0jJAF+hbDg/FJbDzGVwtlx6Ers9O4yh0JDJ0jiSSmwG3JyBvc4YzRF?=
 =?iso-8859-1?Q?fJNZPPEB+g37zWRl6HwFBlqfzYdWIxB+k0N+3yGGwTb/Kdynl/S6E0vNFk?=
 =?iso-8859-1?Q?RIUbTHj2Ivgosr1zYxtJOJJyendqdDGhKGjk8yVPGc3aDj5fuEtAxUKQA5?=
 =?iso-8859-1?Q?bMPwwU4IlAanavBGem9ewxPCjj4c3zRUtP76mCrr3KaSyjYoe/QboQtCRs?=
 =?iso-8859-1?Q?O0eWQSz29m25O9z6ArSNvkjpfNyfgKbGLQbGmEeUcWZxsdHPhR7JwD4mXo?=
 =?iso-8859-1?Q?t6V42feuirdfRdNcA824llnZ3ocAsXjgOMCsOrsYC4LRhZrBPn4HNGGRLp?=
 =?iso-8859-1?Q?J+gIWAVjWXbBk+qMm5QcCH6fvxuNAEsbzV3mynmChIaCbqnB93iRLXNSdt?=
 =?iso-8859-1?Q?EcIzyxtkSPUqnlLwaH3+3lqPnPC7e+6ahK328WaizI1vLXNnckn52W0xkW?=
 =?iso-8859-1?Q?aAL4Y+zMY85lpyuv6cf+D8M9KLSMnWk6QREQr3j1DzR7CqF81qD2qgceEr?=
 =?iso-8859-1?Q?irURJ7KfKO8BWLhJMezOa8Sd9F+Xn/hNCp61I8ddtVxlJ2Q111gJ5JjH9u?=
 =?iso-8859-1?Q?niahIcC7QZmVoCPy10HQf+gEdGPQO+Gno/5lSjYvnpK0vhdiIRnH+vvXoQ?=
 =?iso-8859-1?Q?Y2sfIeEvwtYCE7OWhUnNw6zLZrt0nnSUZRzHDipH57WmhMkrKPhL3Ms7xV?=
 =?iso-8859-1?Q?9ATX79q3Ep2oCrtwMNuQgPUuORxfl4zNzliMSkyFDY1S+3N7X5bnqBcR+U?=
 =?iso-8859-1?Q?1ZnIJ2nRA+MzN1rjkRixjvVMrJdbI3sS9jeKL+cAT9umpI+Cz8LJJCVMjX?=
 =?iso-8859-1?Q?mIz9MXV+Z0yJTY0zaLdyVsObYbuLGSPloib1x1Hz4hHBirJwk2TNdRlvnh?=
 =?iso-8859-1?Q?tWcsHJg4rCDZOs++eznmxMwdfw6HqdJ3t8lr0+fjfAquGyiRFxMlIxiUSP?=
 =?iso-8859-1?Q?1bz9S2rCd9QAWYNyA8gsexWCZVCcKv0kA8GiqUeS99aXRjWO12wGEn1aWJ?=
 =?iso-8859-1?Q?yMnMHohvPFraMiurVofvdkiSQ2Ty58M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8f6f82-a7a3-406d-41cc-08de892eb9e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:31.2676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccyXwTDka1hkJBMzWYl0yRqQ+famoqTNVSBH1Ssa/3LDG8izGjKry/cC7NvjGkX8rWpt4ZvRuUVgdbVQ6mc1Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
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
X-Rspamd-Queue-Id: 4550C2FE8DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an IOMMU device tree node in the device tree
to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
IOMMU device tree node will only be created when cmdline option viommu
is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/domain_build.c       | 94 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/viommu.h |  1 +
 2 files changed, 95 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 30a4f1fd09..57072686f9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1440,6 +1440,95 @@ int __init make_timer_node(const struct kernel_info =
*kinfo)
     return res;
 }
=20
+#ifdef CONFIG_VIRTUAL_IOMMU
+static int make_hwdom_viommu_node(const struct kernel_info *kinfo)
+{
+    uint32_t len;
+    int res;
+    char buf[24];
+    void *fdt =3D kinfo->fdt;
+    const void *prop =3D NULL;
+    const struct dt_device_node *iommu =3D NULL;
+    struct host_iommu *iommu_data;
+    gic_interrupt_t intr;
+
+    if ( list_empty(&host_iommu_list) )
+        return 0;
+
+    list_for_each_entry( iommu_data, &host_iommu_list, entry )
+    {
+        if ( iommu_data->hwdom_node_created )
+            return 0;
+
+        iommu =3D iommu_data->dt_node;
+
+        snprintf(buf, sizeof(buf), "iommu@%"PRIx64, iommu_data->addr);
+
+        res =3D fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "compatible", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "compatible", prop, len);
+        if ( res )
+            return res;
+
+        if ( iommu->phandle )
+        {
+            res =3D fdt_property_cell(fdt, "phandle", iommu->phandle);
+            if ( res )
+                return res;
+        }
+
+        /* Use the same reg regions as the IOMMU node in host DTB. */
+        prop =3D dt_get_property(iommu, "reg", &len);
+        if ( !prop )
+        {
+            printk(XENLOG_ERR "vIOMMU: Can't find IOMMU reg property.\n");
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "reg", prop, len);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "#iommu-cells", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "#iommu-cells", prop, len);
+        if ( res )
+            return res;
+
+        res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+        if ( res )
+            return res;
+
+        set_interrupt(intr, iommu_data->irq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+        res =3D fdt_property_interrupts(kinfo, &intr, 1);
+        if ( res )
+            return res;
+
+        iommu_data->hwdom_node_created =3D true;
+
+        fdt_end_node(fdt);
+    }
+
+    return res;
+}
+#endif
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -1508,6 +1597,11 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
     if ( dt_match_node(timer_matches, node) )
         return make_timer_node(kinfo);
=20
+#ifdef CONFIG_VIRTUAL_IOMMU
+    if ( device_get_class(node) =3D=3D DEVICE_IOMMU && is_viommu_enabled()=
 )
+        return make_hwdom_viommu_node(kinfo);
+#endif
+
     /* Skip nodes used by Xen */
     if ( dt_device_used_by(node) =3D=3D DOMID_XEN )
     {
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 811e9312d5..b519a73d4d 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -19,6 +19,7 @@ struct host_iommu {
     paddr_t addr;
     paddr_t size;
     uint32_t irq;
+    bool hwdom_node_created;
 };
=20
 struct viommu_ops {
--=20
2.43.0

