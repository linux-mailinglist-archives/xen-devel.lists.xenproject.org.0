Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGlQJg/EwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A692FE94C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259675.1553126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7g-000486-Af; Mon, 23 Mar 2026 22:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259675.1553126; Mon, 23 Mar 2026 22:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7f-0003k3-1l; Mon, 23 Mar 2026 22:51:47 +0000
Received: by outflank-mailman (input) for mailman id 1259675;
 Mon, 23 Mar 2026 22:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7Z-0007Yi-KZ
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:41 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9596067-270a-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 23:51:37 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:34 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:34 +0000
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
X-Inumbo-ID: d9596067-270a-11f1-b166-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWhVMEBhMndRrPJCB9BWO4yZ2BTKFybybnIUKExxphTwMVelCAcPUJ9tASHGAqsHurOMa3L67a1SF168Jd6FyakKlmPCpx5AGz6ciiQe1A0tKrNtrT631Qg4T47+F6TQLTJ2EbFQQg9EdCkeRz9v2iH5HwcETkwSWuI1ZVbvEMRZxIuKqFzXqJiLDgRfFl0PPBlyqaEsHKMY79q9NNi16sl7Snbc1pIUskYF/pCpdiJH48rSPVzwl7Uswxz0ys/eCzca9qVzf+MpOI4KAmSf9ETu93sVVK/l7uuov+f8b6aL3kgTj1Br7ja08/aQ6R2dgu+3hJ4ptrtfM0dAp2rNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2Gp9ycmYctygUv4VGro3ykM2qKvLae9Koft7uwdj+w=;
 b=MMIB24+kE6nh/aUKfMTOBDb6B9Uo8Nkvk4uqne+gvPnYfWm5vakCHe/BixwcvDBR5F1jHfTJupD5bdjhEzyEUbKzRiAzb3A6MauzqNRxJOeOhQv3aolrT/NvV3gMvjYz3fFP1grYcmQndpWsX4T6E7fCRE04Fma6v/FPCH1Kcmd4rPz3gMSlKZ9VGaf9rE/6ctc9QJMPda6jt9uqz0YkQfSkSDa0i/03Dd7TT3ifakWFLHa+5yHJlU/5CFmIlv7FXmv3H4ltRUD/JnsR5ndGqz0nXG5VQDabu/83c4Nx4+j7yvHviCCUQGzIWLE9l4/brsQwU2do2aM6xu8jkd4Uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2Gp9ycmYctygUv4VGro3ykM2qKvLae9Koft7uwdj+w=;
 b=Y3NYfHzkBAfZKKNeFvcs0gfpTg60uMLxwSd69tCQvEdkH62QtDIiNgvghUvnhFTCoynI20p8SYYPQoH5hZaSj4EzDOmUGx0Ax+UnkHOkHeRHDT9zPfu4FRibGfQrPiyXkp0QvMdwuk/RMUbD4jzV9P5rH6KIqdNd0dw0b9LTb6Wy6zhXowJ5qLt/CkM106y98kINY3WixFcykurawYWq0CRlZI8fWEv4A0QNvki7bEE3tvN4n8ZUkOZ25xpy7WIGSNmqfaT+EhFD2rRGW4jFhYp84vvO2T+wxW11hqO9nAmU04bntBLbKInqNUikgIw6c4Xq3ATDK/2/hY7/EcTpxA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v2 17/23] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Topic: [PATCH v2 17/23] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Index: AQHcuxeZKb7qiGK1V0uwUNCbLZ7/Dg==
Date: Mon, 23 Mar 2026 22:51:34 +0000
Message-ID:
 <f5f131e113a1a9b28ecf746515f57134bd0e1bee.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: a715f908-80c1-4e02-dd88-08de892ebc03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 M3p4aAYZQfN4yv8xBleICa6nfVluMoDVVPZzmgFkGu8IKVrhQbQ31KCg1/xvpNJk6u+clsz2++rsmST4yojiwhJ0ixRsZDnzcXX6SAx+Gw1S85fqLntW+JhijuxsoPC7dvXTNbethLuVdSOEoxEQ9nO/g699RGzkDPpaDDHFO/936tKJLV2PVWlTqp0PSZXe3bqGCCGYIMyP9EkWK3vR8jw/i65pb/UrjMgZX+6q/JZEW5MO06yQj2OV74KiHMy9a87yGQDE6nqldMA3GGZsRNzqaw+v1alww+Zz9FUJd2mnEdx6hNQH4SZiPVtDGDrZyvZkZaOY4B5Z3DlqZxK4AEMbT/Dg5k8xHTfLDrNNBvWSjFDGlsuhU5sC5LlMqNvLp+ofj3iAPSeFOZBbfpNcEJfQR5/m56daipG+Lw5h+WDIcefMxrZxUjUYnuj/AmuNaLi2nHdSsWIE+d9u7P2fBTZU0bhWkF9FY7eeUHm7P9TNuMLmGo1xamYYj5pFRyXVsE9kEiq9OTwzdC/RFzm8/H0JflaEgs5SDNW4+0Ac6PiLdl9DKP1tgW+/VReMBkk8QxUNoCQ1RaY0m6R1ez8I5vyZjDURKscfVIpTtzDtl456LLD9VudnKwSrruS1/BnsXU42i1lsC1M6uqv6SXe8dY+xmu9ruuUWh5SujBDEec+7tCwMQPm/PjAESg+kSDak9fg4xRkAPXjaonACGV/bb5Hu44zCmgBeSQS+uovEdrb7D7X3KoDkgjS6YzVSk8utnKHcKenRUFEi3E5lKf8pysl3KIrJA2jiR7IjUBatMo8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MSXBgEx8YyvGwthdsqlR/VzxyvUL3Yyvb560qXUo++ShxEhd6+Dx5n3LCr?=
 =?iso-8859-1?Q?qx3hqxlpSgzKadiv6P+zSm+Ybxn9xm1bguXqfty696JvEhNoIBQOprKdye?=
 =?iso-8859-1?Q?hdUUwug4oNvlx2ZDqE+KOJE4gbO+zKo0Pn3Y0/qFERuBw3SWCyEuZd5XIn?=
 =?iso-8859-1?Q?iuSF9cmRVHJnRkNuQ2fURVyKDy54SZPTSSpuz7kS4tjT2Zho+bFotLlXKz?=
 =?iso-8859-1?Q?Wiph//W0lWjR9NAgeREfHw8fxWwChe2buo2E5xyQTFjj33wvh1ruUNNmXk?=
 =?iso-8859-1?Q?7cHZPcmGYapggBM509gzpEAMkLWaYLIdJoL2PKPTqtmjrkY8jPwA7JoW8H?=
 =?iso-8859-1?Q?XBuUlW/+URCn/ADN0+nMSQ6g0o+Zw1n59frGN110d0UaH3mtVGZj7AHdVV?=
 =?iso-8859-1?Q?15zA8j/bbjoo/3WMm7PHQE+yB1oZDbMYhV87Lhdhmw47jJxZIoMejYVtZO?=
 =?iso-8859-1?Q?wf2LbindTi9dZmFaQ8TKs6V6hMZWp7y4Dbf4Jzbt+0+ZSphFrbzk/xHF+j?=
 =?iso-8859-1?Q?2NAKPls4kriFYE0ZzO5vVBpZ46sDXHjogiXtEZuzR+u2qzJG2OhYaQrCmb?=
 =?iso-8859-1?Q?QZVf3B1eQbouaQoRfRg3gVelhteV6X44b5bDJo7iyZjzzWxPRix9hiS8pl?=
 =?iso-8859-1?Q?XJsJILiAuKg7UqT/uzmPGRH6nXsN8KyoPICB27yhjrs57kKtlaUhGOxIYf?=
 =?iso-8859-1?Q?fFcZP8cqR5RSnfxqphYdQB6N5yglLgaVihbWuLfJBIEN/nO6CF+eZxQCpY?=
 =?iso-8859-1?Q?XzJ5aKtGVClwhkvzTzXzFDmET7gWE6lZUZ0vIGzLv3KbrPlGho+xrGyU9k?=
 =?iso-8859-1?Q?8pDuapNU1E+FqH5CiTUnyu1oPj8olytUDmdVmpZ8IE37+9iU+dvIQgFrSG?=
 =?iso-8859-1?Q?6NPTRAHzXPoQsraWSMtW1DeiSPqJi6GUIVhyBWFeenmqF1BYC3dYL7u9u2?=
 =?iso-8859-1?Q?sP5KayqvOefyISDMlEvdzchT+9/AXGadbggrHGhxkKvJt0WQl3n6+rrsIW?=
 =?iso-8859-1?Q?wucuchT3VJSsjV1Jpf8cxASmIt08vkh/jK/Rk4f87wDXEBYgt6Pr5v2IFN?=
 =?iso-8859-1?Q?HZJq7mmVyNJ9NhiBUTJotMcgk1+akl5z3woVf0Xeyn5cpZDnjp6Dr8aQFO?=
 =?iso-8859-1?Q?mr6t5Ld9ZLJYyVS4JWUOoX09wqfchNZG9w+OeYjfxgSVxpTS782y/BXNiM?=
 =?iso-8859-1?Q?H7CZsT3sFe+/caIDnmx7wIFP4iLUXriqUdj2hc4acXRwQ9RCkSm938i878?=
 =?iso-8859-1?Q?MfXOShXIL1UUdhz0692omPCm4Z/qlYPwbhB8K+NDMLyajnzsQVJ/y/4NGh?=
 =?iso-8859-1?Q?eY/C/UOIr8pJ61b2KkXdKvy4pD08CZrk9wCiYUYxmCg5T/m85IzyOY4Y5B?=
 =?iso-8859-1?Q?+GwJaTHDT9HggYf6wnj5XFKwak0tXbIK3GnU195hmLxlsCQe9kb2guEHVC?=
 =?iso-8859-1?Q?gTs9jAMyJm+G7ifYcZU3c6T22zwMqBthkBeBmplPEbQSGGWI9dbQ7ZvaNv?=
 =?iso-8859-1?Q?QtUbRztzBVsJRWoov//lD1dnJZY2uBUAIkajpO5VG+k0qct2ffGh7aBGXe?=
 =?iso-8859-1?Q?/PRQu6wYqphfHWPoHy/V6Glr5h3bGci0duQ0PPb4+1muQJIZ6hOsL6fxR9?=
 =?iso-8859-1?Q?Xbnc0WVrWcYXU7AAxs/4K4kfBYVoFOP0geFYSGonziVf+j2OkNdDKurqn5?=
 =?iso-8859-1?Q?+jlmUMW9HL3jXlSVDcIRtLttM/TsqyoUNe89pT6OHIjAnzQRtmh3f+r6K2?=
 =?iso-8859-1?Q?kC5XmOidbAMRmUKvS0fYYvrqABu43AvrB37CU02G14GNsxjSCAIp0Zu+1R?=
 =?iso-8859-1?Q?OalWECHnxbCsFU6pP+Rz5ROzG9KUNGs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a715f908-80c1-4e02-dd88-08de892ebc03
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:34.8817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SlEXf9XkD4C97iyTLoMQrdZ8FCPqcr3us2Yw2HQ298sfff2sUbKfNsrnxqwBAs1X1U6chAi6tChiTI0fQbywQ==
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 51A692FE94C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Alloc and reserve virq for event queue and global error to send event to
guests. Also Modify the libxl to accomadate the new define virq.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c           | 28 ++++++++++++++++++++++++--
 xen/arch/arm/dom0less-build.c          | 17 ++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 13 ++++++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eb879473f5..803c3b39b7 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -86,8 +86,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis =3D 0, cfg_nr_spis =3D d_config->b_info.arch_arm.nr_s=
pis;
     unsigned int i;
-    uint32_t vuart_irq, virtio_irq =3D 0;
-    bool vuart_enabled =3D false, virtio_enabled =3D false;
+    uint32_t vuart_irq, virtio_irq =3D 0, vsmmu_irq =3D 0;
+    bool vuart_enabled =3D false, virtio_enabled =3D false, vsmmu_enabled =
=3D false;
     uint64_t virtio_mmio_base =3D GUEST_VIRTIO_MMIO_BASE;
     uint32_t virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;
     int rc;
@@ -102,6 +102,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled =3D true;
     }
=20
+    /*
+     * If smmuv3 viommu is enabled then increment the nr_spis to allow all=
ocation
+     * of SPI VIRQ for VSMMU.
+     */
+    if (d_config->b_info.arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMM=
UV3) {
+        nr_spis +=3D (GUEST_VSMMU_SPI - 32) + 1;
+        vsmmu_irq =3D GUEST_VSMMU_SPI;
+        vsmmu_enabled =3D true;
+    }
+
     for (i =3D 0; i < d_config->num_disks; i++) {
         libxl_device_disk *disk =3D &d_config->disks[i];
=20
@@ -170,6 +180,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
=20
+        if (vsmmu_enabled && irq =3D=3D vsmmu_irq) {
+            LOG(ERROR, "Physical IRQ %u conflicting with vSMMUv3 SPI\n", i=
rq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
=20
@@ -907,6 +922,7 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
 {
     int res;
     const char *name =3D GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+    gic_interrupt intr;
=20
     res =3D fdt_begin_node(fdt, name);
     if (res) return res;
@@ -925,6 +941,14 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
     res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
     if (res) return res;
=20
+    res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+    if (res) return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res =3D fdt_property_interrupts(gc, fdt, &intr, 1);
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a48edb9568..7380753fa2 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -225,6 +225,7 @@ static int __init make_vsmmuv3_node(const struct kernel=
_info *kinfo)
     char buf[24];
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    gic_interrupt_t intr;
     void *fdt =3D kinfo->fdt;
=20
     snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
@@ -255,6 +256,22 @@ static int __init make_vsmmuv3_node(const struct kerne=
l_info *kinfo)
     if ( res )
         return res;
=20
+    res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+    if ( res )
+        return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res =3D fdt_property(kinfo->fdt, "interrupts",
+                       intr, sizeof(intr));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(kinfo->fdt, "interrupt-parent",
+                            kinfo->phandle_intc);
+    if ( res )
+        return res;
+
     res =3D fdt_end_node(fdt);
=20
     return res;
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 7a6c18df53..a5b9700369 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -733,6 +733,7 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handl=
er =3D {
 static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
                                paddr_t size, uint32_t virq)
 {
+    int ret;
     struct virt_smmu *smmu;
=20
     smmu =3D xzalloc(struct virt_smmu);
@@ -748,12 +749,24 @@ static int vsmmuv3_init_single(struct domain *d, padd=
r_t addr,
=20
     spin_lock_init(&smmu->cmd_queue_lock);
=20
+    ret =3D vgic_reserve_virq(d, virq);
+    if ( !ret )
+    {
+        ret =3D -EINVAL;
+        goto out;
+    }
+
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
     /* Register the vIOMMU to be able to clean it up later. */
     list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
=20
     return 0;
+
+out:
+    xfree(smmu);
+    vgic_free_virq(d, virq);
+    return ret;
 }
=20
 int domain_vsmmuv3_init(struct domain *d)
--=20
2.43.0

