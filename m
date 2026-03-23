Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAPBKAXEwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D2F2FE8E0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259647.1553057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7O-00013G-GO; Mon, 23 Mar 2026 22:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259647.1553057; Mon, 23 Mar 2026 22:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7O-0000zU-9J; Mon, 23 Mar 2026 22:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1259647;
 Mon, 23 Mar 2026 22:51:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7M-0000YY-Ia
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7L-004fuD-Uz
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:27 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c36c-bab6-0a2a0a5309dd-0a2a450cb8d6-42
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:27 +0100
Received: from [52.101.65.107]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3ef-f93d-0a2a450c0019-3465416b464b-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:27 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:26 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:26 +0000
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
 b=PneSxAPmX9AC0TJOdHpLsxyACMSyqwaKRLxNiEKK6RLAm3x+82Q0kjor2yY87bhNdA+g/OPROD/cOV69vgycrFZ8jN9CCqTYZdaC4ffE62wPiyhGThGtQPT/Q9VkUn10GcPr2p8A7MBkKcu6RjP5mF78bNo8fE+SEPlDfYyQIict4Fy+sbot5bRvwgReC4vVD9U2Ff9f02yByRt+U10s1hyTak4nS6SSYYFW9gFd67IuFbV0aG2ZelIhbaJ3IyfG0CXrT3TnEJDmC+IgEYnZ2xRLluAXau4Zhw3bgYpKQZXKimDwn7/Inp93dnRzl6eaqO9pU2Yz2ViLIR4AyeogWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9jWrlUaHZapt3O5ynx/NVtTbPKS9eli1IbAE7tSe/A=;
 b=vx4XfO7+uz6x42n5+bA9PDGFMJcEiY2eRfNgNFjG2dqfYMUS9J83WWSoFBPYQwJCRp1u1FQx32uqZTd7A96r5LlDiUhBgcUrwVUoasxWIVX/ZCoKS5Gm1DJJProv40oPyF73lO8QTuq3FeEWPedBr4RN6qv653QYg8534eV+mpaqBmRkn/F1Bp04yfC2E/QVb2vN6TGVOoLXhGqD9nWk76dmy3IfO78dA7obXZISiREnwku56VqhbXWOIVePSztvDxFXY00SY05efaBWpS1iHMbMqVWCxDrR0OzUpKWuanNhF1rBGjPNDGfpbB0jHALs7vnNfw7+5f8Qr/1mtNG0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9jWrlUaHZapt3O5ynx/NVtTbPKS9eli1IbAE7tSe/A=;
 b=Xn4ose7RiA4zNNLkZDWZp06xLhr00Icobgd1ENTct5P/sZ+bpj6taez72HVBPLnzXhzL8jMpO5Azav1jODLjzh4LaRjB1NK040x8N2R2CNYWikBy3eFevZjGLVUnDNvakXbysaTg+pi0tyM1bXyQTp/rX8vv09KqzGmFs0RBhtdxnyjzrxcwEzswX2yySDkg8vllRy1uN9a9l7tqgwTvZcmMvkZqVqHyvZrj75pD2/wUyOjewVMzB1MQuevzyiMLXIyFdSKydnJe+roBg3Gm63dt6/s0FnyPAS1S0WdZoYINj9Q48NEqSxbpAAhg7DELPEyobuyoyxRfet9rsEhf1A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 09/23] xen/arm: vsmmuv3: Add support for cmdqueue handling
Thread-Topic: [PATCH v2 09/23] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Thread-Index: AQHcuxeU1Q8QMtGmy02igRjRvzbMGg==
Date: Mon, 23 Mar 2026 22:51:26 +0000
Message-ID:
 <359a88c117af4d3eaedc6a762313a9cf54e250f6.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: a7b12062-1724-4647-a040-08de892eb6db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 RRW1korzKyvDd7vjnMQ6xmm9zqnWpdpWJ9typkKjHrLgFYD+1O++cA8pxbohyfoqi3MWQ+31hETn0CgNjNLop4tKaVLp2/v1EKxrz7qvo2nDAfV/UqUZOVOQXeuaXOcc0GEZTk5MpeqbEI4XbRT6UKd4icY7OiEeiVswRaj/2lE1DdooEz+zXoPuI/1eh5hHUjHG8GfTJhioCCKzbcDVzBnZsLvwGPIXFu5TPp4/kw160G/4CCTxzfud9R96T2GTubtjjII0HQGDWxjukTfj44PdIoed6MY67krZMtiYVu6F5TwOHA7qn3/LQMd+bIrTQhMVwo5YOnR4HdoO4fUP50k4mzgjjtaHpc8sHk8s2ZnXPbT8VKa48aPq4cVgP+XCYSibzopuvvoi/Bz4ZhxvnnvT7zVK0edDhQiMRx32d4FB5FaoNy3HyB6rih7OmzCMSDTpM/+7QrjNDQmHvstJL/2qtv149iTYrz+ivjgTVREkRgRT9hx0brwAYJomC8zmndC+RRxqlPM7NV8osGmngYVDFi6SVfPWwgAPO1dirSOuwSTfUOzop92Q5wX5E0Xw4WmzMFeO8dWCAdEOVcPHzoWaJmM0WE4kjmBPsWjUdFHddMtqW/s2/FFfccLLaBeIHGSw6fcRDPPM2goYouU6nndLi5oZb2UMTueCD6USrMWcD1Wg1XUpwqixoZREl1ZbODGCWiLP0B5fkfvox1qUWIOXApiK11pmbt6NlTY0ipTs0RgOmccuXr8iKEt51ap0Ny/UcwzY2h3P53StQ5WPdcpPsFHaYkqNLI11/X9htLI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3tQBjzxmsLdyn2LSunKhxnYOKV1VYPC4q78RCE8o4sD+l3svHYsNPRdIT2?=
 =?iso-8859-1?Q?UXcBZP6eN8clgDFzDGleccUB3FNy3rh52ePzGA7D1WuZTy/gGs2yIrHIrC?=
 =?iso-8859-1?Q?S9hN2EqEIPChQ3jURhg2aDmbYpRoFphCisvY225z3rWSAuSQJS3i0lmErL?=
 =?iso-8859-1?Q?Anm2jRw28ODzGVTg71svBQjiLCpfUJ0jqLx8eMXYGn4psXFoJHFtj6rms2?=
 =?iso-8859-1?Q?e3qbeMcygX7+F00YhIfZ7Jm2+5fIZ3WpY/IbdRMKJEL04ulhOZum/uSSOT?=
 =?iso-8859-1?Q?XPRw6B8gea5qGyOyehZnspRkvua8KgvP3/iDEr+sDTNBPNBM49HJ7682Xw?=
 =?iso-8859-1?Q?W9qXv/RUEofXfzMYpYet0508Td5+xt7pmZiOz+p3dT9v9xrbbdU9eWCrBJ?=
 =?iso-8859-1?Q?XIJrzZ9mNJM8QqKn0f69PqNJILFiVa20EtXtgimuZMKhcC3uX6rHZa/OFy?=
 =?iso-8859-1?Q?E/wcwH+kIZAsHycZTmHcAv1/IzQpxTxnMROiDK7H4B+7fJKzJngBZU34WC?=
 =?iso-8859-1?Q?3W8YQeErctGtZ8RL7/ycoLyegjK2ADfXzwd9WxEtfcEOmxV6RcTNSmZE7s?=
 =?iso-8859-1?Q?zMeH/RO1eF57WzNZIoZz4HL/rOLmX3KE/L9msYyDMWUtMrmn5P246l9a4m?=
 =?iso-8859-1?Q?cVYtF5CLp7xqr2dYESA89rGZFawMuF/QFBZrr3B84rdqtoVlfEZddqDVkM?=
 =?iso-8859-1?Q?PXL38YIGrXeJV+yVf+kMh8gx0UGpnsKM6eUyPOV9uD7sarK5zAXsEMV4od?=
 =?iso-8859-1?Q?iqDGRIockUXfEU/CAk7CoOqVCqdtC2pKCBWsOVdlN2QJWwKvO1jZgXXpUS?=
 =?iso-8859-1?Q?YUDR5qqZ97tbkG4kzx1q7eePgmtgam24g0fhXUC6rocm/PwXqyfCLTLu54?=
 =?iso-8859-1?Q?e734SFa5CVzN0jmLqHv1D6fETwEbgfKKOQjxsCZdWfiGtPyGcbfny23YnH?=
 =?iso-8859-1?Q?wB4UR8F92mniYi2Q8lxfSHW7iZahn5D1TgcyLHzJGELk9WF0OnJ1w+3xwb?=
 =?iso-8859-1?Q?NcfzlkTt7IjdYC8vuL30aUID3Je1hQbZtUXl/4FXis9m4HEx/OWy48WzBU?=
 =?iso-8859-1?Q?wlbDEjTA7Xh11NJ8QGf5SXNSV7FDweEPivhVxmX6ba3QG9hcEFA6s1Adtq?=
 =?iso-8859-1?Q?7eJY6M/12XdhwdcXK8qaoKMzQQF7tpujwscTsFthZumixr+z4zAdvwAnFw?=
 =?iso-8859-1?Q?tX3fxa22F+EW9gJbuhjQITHEbFf9ijOGqTGt4VFJk5minRW8JwGtQKuQmM?=
 =?iso-8859-1?Q?1Vo36rVOQ5Pg0s73IaKOP3Sfn/PqH3bPL4a4qcQh2nwW6ZhX4jO9dzzApW?=
 =?iso-8859-1?Q?H06jgaulKFyhg2UEPX/f9S2CC94qtZl34H7oj2/X/ox7hD+6cHkT5Af4jg?=
 =?iso-8859-1?Q?QPX84HIxeDLPOG8cI1jZHORYqjcMxhRpylzi5LF/KALqjULqvrZQocXyyy?=
 =?iso-8859-1?Q?UVRkhqOw7K1hrdKMLP1kyHhwCj+hTWNPJ/1uTPaQVeK/BOwKkDcHHZXOGN?=
 =?iso-8859-1?Q?0jSJSjohUvGGBk2qGhCrSSkcqMzEskEwAyvBSRJWx/s306fPqO7SYdIicr?=
 =?iso-8859-1?Q?7eOVRD4x0QTM36qqd6WljBhtuZpx0zTQxuaR9oXXbMY4MZAN5kI44ozDaG?=
 =?iso-8859-1?Q?E6DfQY6RoEQ4S+d1cymKwfPAOtvWG6sLXjdYp2B++eDylqZ6FlbB4xogc1?=
 =?iso-8859-1?Q?EuvoZHkSEYUFwSpbRyymFpOUOkhURcVS3j/Om941xdhOAVsvq5XQAS7kQC?=
 =?iso-8859-1?Q?Y2lwilCG9TxgJHUxNEwS71//BYjW4P6rtrWjXKKc38MzURD/9bBYKoxO/A?=
 =?iso-8859-1?Q?YvRdzBis4LacZa8zV6TAaMi/QHeMIdw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b12062-1724-4647-a040-08de892eb6db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:26.2274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fepw+xRoXy2y49jfBMjG0jK7UYgrfkkBmqZSR9tYE+nnw95C8+zlsIRpESw+xm0UssvFyL7Ur4eIR/pX/VVkAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-d25034/1774306287-F66AF734-8FBCC3C1/0/0
X-purgate-type: clean
X-purgate-size: 5197
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
X-Rspamd-Queue-Id: 54D2F2FE8E0
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

