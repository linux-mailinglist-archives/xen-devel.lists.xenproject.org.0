Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPMEKPMoy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4558E36330C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268271.1557666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHK-0003zf-8h; Tue, 31 Mar 2026 01:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268271.1557666; Tue, 31 Mar 2026 01:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHJ-0003l8-BF; Tue, 31 Mar 2026 01:52:25 +0000
Received: by outflank-mailman (input) for mailman id 1268271;
 Tue, 31 Mar 2026 01:52:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHF-00036o-JI
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHE-00HCrd-Uz
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c4-e002-0a2a0a5209dd-0a2a450a9b40-20
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:20 +0200
Received: from [52.101.69.85]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28d4-1772-0a2a450a0019-34654555cfcb-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:20 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:15 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:15 +0000
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
 b=BNzAri/5Z+kDRPswJMqBn7FXz54NvyoI5lqhxlfxsKF4hN/skFjJzdslZCvSCTARFSDJSm8nebJQOYWS1t6CzT60X35JsfrnH2fiJQTZxi4W1L3OgTQ70FTqqYin9Uj79yn7uUQwBahM4o8wlkzsu1WB3FQdZQUWe/5+Mu8isHEBbczS9KZIDHIIgvbzZGpf8VvtNj2kDxyYydy2B8kKJ8LCEqar5/eLf/VuCIho3fKa/yRl066ChvPrPA5FwgSCuBbdZdU6/pBdyDE6bmtzZDl9GBUn8DJYdv6RMpBSBh7rA7i1C7pruZQqDqpDxs1tQgVUwYUUe6Q+ih80oUt+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2Gp9ycmYctygUv4VGro3ykM2qKvLae9Koft7uwdj+w=;
 b=Y+wVa6jRsOQdv5GlfzI8KU5uXf4WZy59jsZjhzjxE0OY/PztHdP+7byt1Tio9cGiiP5snFw+6q9WITNFTmHSr83EtdBn5zv6OY8k5RA6ak0HMdJVGLxOg5+FbRSlJeLwuQT6Z2MvF2SZrNrujrebuvN680PUry3CrS6tW+ydusVF9qz8fZ4EyA8R1FfVHUmI0NmC2D/pE7mowx0qZFkuuDv5uTvj0MISVfjkE4iJFXucJGwJY1wZNtiuwOEocDqpvvFQozYL9OfInGZmCCFh1V5imPjqKRL5nRP1Tk9Faowu1hRjMZBivrYpSLKfTZ8u/cihmxpnHCvl1ZVOTKPaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2Gp9ycmYctygUv4VGro3ykM2qKvLae9Koft7uwdj+w=;
 b=YVQYL0pGFQvzQpIAsVi2ywAfCMQ3XTclUGqZd7bfR2hsGtqHiXKa8D2ZKfqa2E9M0TlbjTkQweIAboWnxPy5JcnTfC9e3bCRJxdLF2ZnKjU+NYxebOX5ftt0/oqZf+/kNbxXewkX9jwFDBu9MYBan4mX5sACZHlJrAgfk0XmSasrdeKOnJAoIHTgbYWxZFZAa4ARdiOBVy6XswtUU7MvndUIZrfshYFo1VPHcxnvoC9+iUbIzMYafoKhw5ZOykqmU1NH4s8O4jOLXrTtpM/h+TDTOmBBh35f3XJvZBdwHHtzM8nc0D+Qdhx0Hw+sqTIAXZ93xmcUoNjaO6Y7WlqT0A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v3 17/23] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Topic: [PATCH v3 17/23] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Index: AQHcwLEAWcQmV2Z+ZEu7R9S6mbl5yg==
Date: Tue, 31 Mar 2026 01:52:15 +0000
Message-ID:
 <f06cb7dce5ae69de77164cef365ba659a077348f.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: b9d0b3ab-b334-4321-be98-08de8ec82291
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 iFP+CNMJB6ReTOYpTxHb8nr9hQGmVKVDFS+tKiciPiqY1HjQmbxKkg0rvzCM72Y+mt8TBgCwAuWXgWfyUhOYkpcwF46Xt2eL1K/5Sf5+qKhnl5leeMxqB/eAKZ/6qYSdih/WfutS4BCRCbdQBcdLOE1BbGl7AYnrTOO/Zf6UjVn7na3Hrkm/jK9Owgmzzzp0TyqmxVk9TQJWQJ5srkutJuMTW0Y7MHh5PIpgaqvU9oyDHbLaMDYeKLydHNljoorN4CFUlLF8JQpuNJ5Ou1X1Td2TXT3YEhZTX1gFw1BcV98NjbeiOiUy0lVqMV1YMwp7SgBYFD0oTSCyB21S1Cs5/GyjBOSqFtgzHKqhyClrJXpQqmyMNsFbt3R4wojHTIlx2TBsEaA/W1+BhAqTE+T4jFmFHKKiDxf5meQIYFufSEt2OspiW+aI6uhcEvc7XrSCaTezLLA5z4hZ7ztWYtMuRMFjcfYKXE2W+ITUXuwIjXWaimNnFBip0OvMtNP3Qx+gI3VxUUyJe1XUIalKKZs4r8m9Y2kk17tFbrX6rDytDXpE7zaaZ29szYJXVZq9B8t9wqHcXL+PVh50EidxqkeFFcTpkX31OUCIPz/mgswamenX6YLkEF/CDxCCwDAg+CO9eekQxR7yFLjw8gTVT8raikCUsYEmkxiTirkZSv4v0otyggAv13e9ES9QqLunP+jdE8u5N2urKDqLqpfLaaTxM4IityTm0AmNQGIykz7VKfFUM6zd0Y5E9uy9NPCQxRpmAL2fqngMr+ca7utH2oiNfyZ7YFg3tTVNLeZ25wpTBow=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UcLEW46plBSol9PN6atgARvEtQ1kg7dtpcz13q2y+CwAJQi5PeOHxcdSzM?=
 =?iso-8859-1?Q?mXakKv7rA097lM9micvFHiHZWVl0+aRcgi693E3nGpcKy5e15uSBtVMRLu?=
 =?iso-8859-1?Q?xbSzprKgG8fLRXGT9AV/f5xLnXP1DoVgQxno962SWLE9Pn6wJV1SUDOBav?=
 =?iso-8859-1?Q?DNM0eS179xeuBAgSYtWXkFBZa6MHLS3lyLapYhwjoyDPWrfmpQ6odiALm6?=
 =?iso-8859-1?Q?iZ+ydE8LYIrlIiLox22JzmG400MfWwOlBYP/9J21U7ifOE8PBIa8AtI8f/?=
 =?iso-8859-1?Q?gRVUEN0ePSWugYKHhNnUaSRMAM1ONYk7n/hKinZRaTE+3zn9wYM1j9MyeJ?=
 =?iso-8859-1?Q?c1EgTxVRblSLi1bjVUSzP6AjrypNeiYCIjdXGlLm/02kL23HGTohFCxvXN?=
 =?iso-8859-1?Q?GDG0vzxGKpCFMcwe9CF+NwpOMFxJ7AzF0U/wG4BrCM96FhsUmtCUCnx8CF?=
 =?iso-8859-1?Q?p6Qv68n7PpCi0oupoaHL3QpfP/CdNG0ZRxCWMfV4jU97cFyTcvOWDmi2R0?=
 =?iso-8859-1?Q?WRl+uK8xO5R7MeSHQH8ZfzwzBLl7EhE+zhWzKZyv52v4tp87xy9B22qioF?=
 =?iso-8859-1?Q?PumByGQ8ZsuF2PKNOe3WQLXQfV8c05vevy6hDNcXWcn4l++nhvPl/5xrNB?=
 =?iso-8859-1?Q?qE10GwZXVs7/WSpKunsQLaHVw6jfBkv3ZplTv4bnqUoE/hZ+BgsPcR/zMG?=
 =?iso-8859-1?Q?Ew9XEqpyvpkXfJkDsfugxR72MEiK2mb9R4CImm6LmmrBBjJEbI66FJEdvk?=
 =?iso-8859-1?Q?O3iNGRiU+Dp+FdEDCaVNt29YGEUGn+2KQn5om8s2++uBvoFKM84BNlbCOn?=
 =?iso-8859-1?Q?3hOqiVtTYvdDpiD1dumKIdc38vOxmg0ExaO2sYtifXpH6jgBPJDNQoMC+q?=
 =?iso-8859-1?Q?fdPDZn+aJQOmhvteJK66nG/p3AzZWcvL37e+jNa7mPofaDszFQAXOPPEo0?=
 =?iso-8859-1?Q?GUqz1eBEhJZdIu68X2PKSaBT2fcF+GxgwpDRqxeP9+vAHRlAB+tOJeClTH?=
 =?iso-8859-1?Q?Kt5QoVIlopoEoPlfG4PT+d2pIO8b1ZyiEvGg5zBK+oL/oUyt7s/rSgIwQv?=
 =?iso-8859-1?Q?2Fl+jGnhDvHni/8Lk+Rxps48/4cfhIYlAtKFt/lkP30QuAcvu/mTvwuJQ/?=
 =?iso-8859-1?Q?VCLlD6UoHVY/5WLZUPDI2ugm+tijPWh52QDzqq8FQyKGIfOBi78TDn0Rjn?=
 =?iso-8859-1?Q?sYd9bgOqsvB9oLxzObMr9gr6HCTbwWeNWqtyM02+LagK1ACD6G+9RpKNTl?=
 =?iso-8859-1?Q?C96lyk0rXAoA+pWGD278+sPL8z8IAE+bDd/2Y671AsNNp0BFLj10v/SSwf?=
 =?iso-8859-1?Q?CRY4sxhdDkNc8GlpW2Tzh3/eXAtHj4l1ACJMv+mCqSM3wA40dRzaWYqUhC?=
 =?iso-8859-1?Q?d6nwwo7bNYgYeMkWNjzWBHo4kNWbQQHlx7Xv+U5kJv2cvnb2s8487VzEVM?=
 =?iso-8859-1?Q?JdsAgzl1e66okW1TK2o7CEYrZkYbq8p8b9pNDsl2nCznFYOSr9Wbu+QIEG?=
 =?iso-8859-1?Q?VlhScvk/g81IsmQHv6NgQ1ghTehPRFusvSxwaGJBUYDkYoipwzLCdYpzqG?=
 =?iso-8859-1?Q?FZJyzaZa6s9Qv2DlHANz8OJlSQJW/tThMYq2dnijVpWSBETCVfYH1wnL/n?=
 =?iso-8859-1?Q?ph1DD5fI0k8EX2souCjrZH4L/ODhG0iY1gcosYJVtxUKbG8mGI/uTqOJ/m?=
 =?iso-8859-1?Q?hed8Y33DqyQgcRA2PyDVKEHXTbPs7zZOht/RheofFk8cOmDeBmfeoOStch?=
 =?iso-8859-1?Q?bTHKq9Ifd8r51wmTkquLOqh/o5AUQuJNjjvZn5POgYJeD7/2eDz6Vx5hk3?=
 =?iso-8859-1?Q?NrGnOT0GfgETUMy0GRvmd/9BSaZ7uGY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d0b3ab-b334-4321-be98-08de8ec82291
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:15.7499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oe711C1N6GET4z2LuBTQPKWcMRZ2722fcRquR6gM6wHJBKO7EUEqL3zEDWuEhzW8HRI+Bux4cl3kk6r9jN+xYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-4011c0/1774921940-BEE95900-7B82EB4C/0/0
X-purgate-type: clean
X-purgate-size: 5412
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4558E36330C
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

