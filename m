Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XlU0Ougoy2n8EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722D3632A4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268233.1557604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH7-0001PF-LX; Tue, 31 Mar 2026 01:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268233.1557604; Tue, 31 Mar 2026 01:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH7-0001M8-4W; Tue, 31 Mar 2026 01:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1268233;
 Tue, 31 Mar 2026 01:52:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH4-0000cY-3u
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH3-00CyDl-Fr
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c8-5cb7-0a2a0a5109dd-0a2a45089e38-2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:09 +0200
Received: from [40.107.162.75]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c9-1950-0a2a45080019-286ba24bfb1c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:09 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:07 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:07 +0000
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
 b=kmu0DQm1VfvzNkd2eYS2AP1M9C9na6XWTjBfeijTjXEkoWAqInaz9VxJz6hcBRe9CG1iaAdy7EWzvEOCDA/H6vm8vZmWw/JypDugBD/qo8OGgQUjRMKeGsKlaR0dqEwUR+H+4/o+BCMZnljqRz8eFrsSvh+W18bE3R4uDDxARDQFUnhrVlcqr1n0I/kzRNpfyjAyhrlzDbRsxFKje1uqzpocRbHYxL8ElCjtpz+I5PvN1kRCmuU+Acrpy/wHpnnQJoPxRb07GcOwwqbP9GVrFGAIySXDh5ddXZqxYdsHGNHzTiyjz2s7zRAk/ciZZzBGKSNR9C6iQyU5Z0r3CUJMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9jWrlUaHZapt3O5ynx/NVtTbPKS9eli1IbAE7tSe/A=;
 b=tdAYRmdDnSeYb/flZRHXZndf152D/eAXsWWlb473dLfjT+26UZuy568YWjaJEQtDqjWpe00hHRQjWMWcmljIALgbkdny64YReDzIksxEHEUMOjRgBC1zrhhJV8ABeW3V1PuYe9PxAGHuyEsz5PNGid98bUMLg7B09nyROOrozHcrycSc/66xisowuTabHOGv7xHmPEYnN/LINr0Vmes3qGlP4hR7Jl8n5jsu3mrr953VCBeY6PkvFsOYDKupjqqPhmPjOFFI3Cv9xC5WQ29LTDUYSrcVSwJEkAjQ9Pm6GyL4PBO4JiQx0y/5Opr2PPANIUUQOJtTyFz46i+EuBAkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9jWrlUaHZapt3O5ynx/NVtTbPKS9eli1IbAE7tSe/A=;
 b=arBCLGcilKeWt9ojrfvsWWja18+1wvJialPbLqRwUGXgqfN/LxBt0EoVQfgy3M/6ZzA84CWela/hMofGP5J2jfYkvGK2rnBg3zeva7GeEtWHK6I8VTcuVSNMi2AkLkLi8IEAR/nopimN0+uodsxU3uXQ90UKwmN5RdoFHXMQaFVgUW7cVxsgIdwdIkh7OhJdntceM5arhsa1ODggs8HAZaok5RF4Q3hU9nMRIXU7LXJR9rWHKpkkped/02oHeN/m62Qc4m1ZdS6wCtC1jxeVu8XefNqSaITP6B8Ptt+12PlMqkLEVnVniGVV0LHHm3tdNc4KuMx8DeHRisJxzgoMcA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 09/23] xen/arm: vsmmuv3: Add support for cmdqueue handling
Thread-Topic: [PATCH v3 09/23] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Thread-Index: AQHcwLD6ic3rtwSs7kyHtmKLMe6w0Q==
Date: Tue, 31 Mar 2026 01:52:06 +0000
Message-ID:
 <b223a8bb3e4d8771fc643c324a692a2639a91c12.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 476082b5-8096-41b6-aa0f-08de8ec81d5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 k+7CQgekP2YRlru+lvAEv2CgKJZfZTpczZKfAEEZHVGE9y3XPLu4LQhWb49Z2djqEow8mlGS0DwmWZmA4ZdnVEINybtXCOSUlM7da0gI6v+rJMUY/+CelKCUCUo9O3nTBcumK3h9roJ69GHTp7L9G1WtQY9g2SG0Icop7QybZsBgxfMw/aWJ9KPY29AVI8dNngJII3gdgxaaHJVuUlKrg30kDFWBinKM8H2D1SKIj4jZpRo1rCTibhbNkSwhpRg6kkKF5Uu7xGUbfnFBRRNcA16NPBzquHoY8kYE5zfQ7egnE4kIMoS2IdVU4+CBslEbLuQt/oezygsvC+BD4M0HcfPNezMkiv94oQtFsKgQtVnxNKOadufq9GO2Uq89BEXlnZr7n2R+taeUGkYq7T2TxJgZoLhoGeTtsJ50mZXz5wPrgtdM0N422CH6Go+DkjqlnsDxJsfcqSG32bXKEC6qChlxvpjG9UETY05lneOPAhphvLH5CEPcVX1AYomtTnopBQdKtkwVM8eJ01majlK4BaNHzgdLiHQfFxORVT4pFuVM5LnkFu3lEV0+CUOr4ltf1H+0ry+taeEzTIYYIIb2SkOVeEAuqnjgNaCnEh1kdeR/JddlWDOu5Q6K9NEihqwA8OlPuYc1UQ1nmv/BaMZFwQIQ1EJdR1tBtggsAXuxTBzzHwzP9KvsCmD+5wtkRMVsWrNf+vI5WfTpf1RVyCBvYl0ZNPs/2H/sQ55KEU65dickoIp7o09NidEwXTNbuIXNfV4AkjOAIPK/PFRrA6PHXdI7XGFhdbKeVTkOtY+ICl4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?B6wvMKJfNn2sK/4zgW6pkTJ2qtcxUdiIuaHjhHOQ9anpE6hJpby1dZRm+S?=
 =?iso-8859-1?Q?9gxfW5iuzwvPaIEEKrPM60teUjn+4E4a3sv9WTcc6lKVHojGUYPmosm9Nz?=
 =?iso-8859-1?Q?pxUkAGM1cphKcN65EYK01aP3YaDb3gUXO5tLGPcXNOH1PS+4esnLDxEMNC?=
 =?iso-8859-1?Q?WCacdS6JzrnMewSWZLK1QKoOmnKGWYE+qMwtWNtYPkpFRg1sLqonPFdeAN?=
 =?iso-8859-1?Q?9PDS6em6pVMYAFA90ugN/kLYIVRDGFulbxCKcL00BGgFqnH9zSQC0DLHpZ?=
 =?iso-8859-1?Q?S6qYdzYvAzC5ytDVUPavLC0+txsLhDHbCYA6zqmI1ZcJq+GLfG1ftPIGI4?=
 =?iso-8859-1?Q?qcDIUzhRRyoRiYN5OTuBKwiuYFzB3w6FGEQT2KlCucVhWHlK5hq0YWLbS8?=
 =?iso-8859-1?Q?P2yNoZFo9hwe/JVOfOM+w7g7XbMCj2dQ0Dh0aTWGB/WRwo5z+7Q/8cgTQ+?=
 =?iso-8859-1?Q?OA3qNmK3tri6HdOeC5wmQxtoItjY4NIUrwpdmw17aWJf4Y1NkeP/XGqU3a?=
 =?iso-8859-1?Q?qQ/Qix8asYYEmQ2p7Je7ZKjTFzzgI0YVJRrwCwQhoIcze+xj61Ux8JcgYw?=
 =?iso-8859-1?Q?MuhkzR8hKhdZx1MtYMqkqxjVyqwJ+8YobAcSZmzFqM/GYsKeCA6kdmcnow?=
 =?iso-8859-1?Q?vH8+TgF3n67/qbHe2QJ7tW37z58ls72wXy0x3x5Qip2wtnq0rPifAY+Wk+?=
 =?iso-8859-1?Q?YqCP5/8IA9Qtwp0kak0AKGmCMC1uI5KgF/DAC/38Sk+PspNg2MILooTwAO?=
 =?iso-8859-1?Q?yWIkWxNi4RObz/nMAbZdO0O42pal3K0/mudSzUW2JYP3aivA4fSSDKGh1h?=
 =?iso-8859-1?Q?HOiF8bXC0tk6XzwoHWxTFbckHKaEZc5OgT3qvgWS9MvD7Jt2PemgaOvarG?=
 =?iso-8859-1?Q?z29JNv0bSYA2mmmqYsX1knJmxM+9JOaG2eLel0Q0YdCtxZjtRZuI9D+gqb?=
 =?iso-8859-1?Q?bUy+ot7ryuA+EolFbo8wOJAZKPasSXxxjmzEP5jafytKgfuQW3ZdXsDYF7?=
 =?iso-8859-1?Q?tAsbwcyn7MptLzFRDuuuSFPBlYcQHZJz4kFpF2Zxbk04MKQp40xgqGgBCI?=
 =?iso-8859-1?Q?RP3EMKRr2hfeltocQPUVlJ69bkY5EZNnyVMN2qorS6gZeTATFioEUi+5ZQ?=
 =?iso-8859-1?Q?StbkXFkLi6sfU3lb/mK2hfr5WQxYdVLZh15fwOugYaT0a7ndfEB0FNimgW?=
 =?iso-8859-1?Q?lRaNWU/PMOrtgG4pEDwpwQcqjg2U89CiAacoiahEMSrQB1nQnLHbh8ba/J?=
 =?iso-8859-1?Q?VgziMztiNH2DKSIu6iHZt8BHuZmNAU69Bvv5Sq2otOJGjjBbcVIrYVZH6t?=
 =?iso-8859-1?Q?VqpIt4fx8BefwMd40y9kbFOsBBs0g0sSlg5Ab+eesVCqaq4ZfC2sFGbMr2?=
 =?iso-8859-1?Q?ykB4+k6YCb8nq6yaziyiuker2/HyYQy4XvATHVmZrJ3tLK1hqX+5995H1j?=
 =?iso-8859-1?Q?n4iZi54xkPgzArbkjGZ0J31kUH/GIeUDWZzMAsnSMDysCRdoOkNUIKbKCC?=
 =?iso-8859-1?Q?XEvMwUY4+wGgrzn1/qHm6ETZA3tEopyx+Z6jQNnw5sIkw9QbotnYGfTPco?=
 =?iso-8859-1?Q?j+VfzmEZpyFYr1+aDMlz+Xq2YTvjhx1u+HRz0pYLRCYISsqxeTluGkAHb2?=
 =?iso-8859-1?Q?X+5Lrr3zL7zkWDhSyd84nJLi4/5FfkswQki9QSCrmQ6gyRvKUUQ4xAk4KU?=
 =?iso-8859-1?Q?NCA6hV7XXFlKPefQMop7idNSuoll3mwpTQ+RpFJkX/jj0S501fkZFMwshM?=
 =?iso-8859-1?Q?UP7NeE8D7Bu6sFnlcXto3UhIXV54VW+VYWJ/daOXZ4fdmLOiKeWX8ZjrWa?=
 =?iso-8859-1?Q?B078qS51QOFzu/GtIRz5UGLgcrO/ScQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476082b5-8096-41b6-aa0f-08de8ec81d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:07.0007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +okX5OjZNRQEoq2pjMBDXXrKdcjWuEKOWi0dal2EsMolFujK3TA9blmZ4YsFL4WIf5/0X3dq3S8jrlw1g3A4rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-c1860d/1774921929-F2AE9726-4B878DBC/0/0
X-purgate-type: clean
X-purgate-size: 5197
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3722D3632A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Add support for virtual cmdqueue handling for guests

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 3ae1e62a50..02fe6a4422 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
=20
+#include <xen/guest_access.h>
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <asm/mmio.h>
@@ -25,6 +26,26 @@
 /* Struct to hold the vIOMMU ops and vIOMMU type */
 extern const struct viommu_desc __read_mostly *cur_viommu;
=20
+/* SMMUv3 command definitions */
+#define CMDQ_OP_PREFETCH_CFG    0x1
+#define CMDQ_OP_CFGI_STE        0x3
+#define CMDQ_OP_CFGI_ALL        0x4
+#define CMDQ_OP_CFGI_CD         0x5
+#define CMDQ_OP_CFGI_CD_ALL     0x6
+#define CMDQ_OP_TLBI_NH_ASID    0x11
+#define CMDQ_OP_TLBI_NH_VA      0x12
+#define CMDQ_OP_TLBI_NSNH_ALL   0x30
+#define CMDQ_OP_CMD_SYNC        0x46
+
+/* Queue Handling */
+#define Q_BASE(q)       ((q)->q_base & Q_BASE_ADDR_MASK)
+#define Q_CONS_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->cons) * (q)->ent_size)
+#define Q_PROD_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->prod) * (q)->ent_size)
+
+/* Helper Macros */
+#define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
+#define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
     uint64_t    q_base; /* base register */
@@ -49,8 +70,80 @@ struct virt_smmu {
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
+    spinlock_t  cmd_queue_lock;
 };
=20
+/* Queue manipulation functions */
+static bool queue_empty(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) =3D=3D Q_WRP(q, q->cons);
+}
+
+static void queue_inc_cons(struct arm_vsmmu_queue *q)
+{
+    uint32_t cons =3D (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
+    q->cons =3D Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+}
+
+static void dump_smmu_command(uint64_t *command)
+{
+    gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
+             smmu_cmd_get_command(command[0]), command[0], command[1]);
+}
+static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
+{
+    struct arm_vsmmu_queue *q =3D &smmu->cmdq;
+    struct domain *d =3D smmu->d;
+    uint64_t command[CMDQ_ENT_DWORDS];
+    paddr_t addr;
+
+    if ( !smmu_get_cmdq_enabled(smmu->cr[0]) )
+        return 0;
+
+    while ( !queue_empty(q) )
+    {
+        int ret;
+
+        addr =3D Q_CONS_ENT(q);
+        ret =3D access_guest_memory_by_gpa(d, addr, command,
+                                         sizeof(command), false);
+        if ( ret )
+            return ret;
+
+        switch ( smmu_cmd_get_command(command[0]) )
+        {
+        case CMDQ_OP_CFGI_STE:
+            break;
+        case CMDQ_OP_PREFETCH_CFG:
+        case CMDQ_OP_CFGI_CD:
+        case CMDQ_OP_CFGI_CD_ALL:
+        case CMDQ_OP_CFGI_ALL:
+        case CMDQ_OP_CMD_SYNC:
+            break;
+        case CMDQ_OP_TLBI_NH_ASID:
+        case CMDQ_OP_TLBI_NSNH_ALL:
+        case CMDQ_OP_TLBI_NH_VA:
+            if ( !iommu_iotlb_flush_all(smmu->d, 1) )
+                break;
+        default:
+            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
+            dump_smmu_command(command);
+            break;
+        }
+
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "vSMMUv3: command error %d while handling command\n",
+                     ret);
+            dump_smmu_command(command);
+        }
+        queue_inc_cons(q);
+    }
+    return 0;
+}
+
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
                               register_t r, void *priv)
 {
@@ -104,9 +197,15 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_inf=
o_t *info,
         break;
=20
     case VREG32(ARM_SMMU_CMDQ_PROD):
+        spin_lock(&smmu->cmd_queue_lock);
         reg32 =3D smmu->cmdq.prod;
         vreg_reg32_update(&reg32, r, info);
         smmu->cmdq.prod =3D reg32;
+
+        if ( arm_vsmmu_handle_cmds(smmu) )
+            gdprintk(XENLOG_ERR, "error handling vSMMUv3 commands\n");
+
+        spin_unlock(&smmu->cmd_queue_lock);
         break;
=20
     case VREG32(ARM_SMMU_CMDQ_CONS):
@@ -326,6 +425,8 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
     smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
+    spin_lock_init(&smmu->cmd_queue_lock);
+
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
     /* Register the vIOMMU to be able to clean it up later. */
--=20
2.43.0

