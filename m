Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAcDI8vh02m0ngcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CCA3A55F1
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 18:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274258.1560446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myi-0002nX-0z; Mon, 06 Apr 2026 16:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274258.1560446; Mon, 06 Apr 2026 16:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9myh-0002fw-QJ; Mon, 06 Apr 2026 16:39:07 +0000
Received: by outflank-mailman (input) for mailman id 1274258;
 Mon, 06 Apr 2026 16:39:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w9myg-0002Dw-1M
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 16:39:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9myf-001MTX-DK
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 18:39:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a7-bab6-0a2a0a5309dd-0a2a4506d52e-12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:05 +0200
Received: from [52.101.66.107]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d3e1a8-0df0-0a2a45060019-3465426b20b6-5
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 18:39:05 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB6817.eurprd03.prod.outlook.com (2603:10a6:20b:2df::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 16:39:03 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 16:39:03 +0000
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
 b=nL3NSZvWd+paMNUcVCnOoIyD9dHpUcXJyOruZzMtyq4vEcH98bgpID1QndQSUCWm/V+RjLVPkwiRWBuTfRDK5NOsQADazHpC3roqA1OYfFHE6MqCp5QgrEZnq99T5ZyCKdNOi9jkmkQbIhLUKctHuKyQToEbHZ+mJKZuTXj+NXopKHOQsk4tzLSkn52o1lrszdfuRkI6La5f9tubXu+96Y9iH1nB/y0qUZBpS8M5hzHfBtXnTtulhwNzoPIR6EigVfo+byZosOY/QU/jJZlgRep2pxt4Je8emXEP6m0IBJ6GS16Nz6245YgN0Rw4SLKg5vDVuz+suWaqFNx4ytNQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLVEemqovOu2DliBxYy5M+VX2WQ7JcG7NJ+b2t4yQ0E=;
 b=XLXtgMIi98bcwE79RQaeCWvTe2Zzr98CJ6A9JLj8tq/ZC+Tg+aShOA5IFY7Acz0UOq44PjejTSlp4I8C56EQtetxIm97Ich+f9fV3jN9iCqQnj0qlUtxfdmZor8dxsw8UMIiqXifGRKhtQdKNBwp7vIxGcXsgE4rZZAp438htjepuFHDakPJ28ZZgfM/pZgGQezOxrPK99c82ZMsBtph9AepzTk4XN0fDfGKtj0pJ3J0Y60uiN8odA7yOyzTGtPrnnxc8PHZ68Kd9mQ8txgFVb4n18deZaMEQlXZmdn2eNatC7d9gVBYNJ+kD3p5f/uLHG/nn01vxAx5LDlPIRmaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLVEemqovOu2DliBxYy5M+VX2WQ7JcG7NJ+b2t4yQ0E=;
 b=YNh8M6zv/jwEB98LKw5OMOWWCzpm2OgWeVtV8GbdAK1pf8gtZ0d13Lw7P54jUyGC6rHLkkf52MTJ/5S8ZA+hJSRnKGX51ITzteE5ncCzN6LJTmYy7HpLeAMrLKUIKCbPREmbUX+Tfbq8WuGyLpyhfhRR1Lhdrp//nPJy3zahvRfjRTgp3lMQweYHWyRrcoAQn3lM6vRxlWmIfZ9a3DUQT30jcs7yM1ej3Bfy7NdpGotKYmbSXZVp2j6IxikahqtxEQPrC+D4KUzcac02BkQ11zCtjjLiOcqMqIevWvRKqgwDCwdryJqYuWks6YD8u2DJnj8cDZpK3qY72cApaZU6wA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v11 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Topic: [PATCH v11 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
Thread-Index: AQHcxePgoYX5wHyqiEi/h1nBRfSR5g==
Date: Mon, 6 Apr 2026 16:39:02 +0000
Message-ID:
 <34173027f83b00181688d33a5adf4b6a1f0e031a.1775493499.git.oleksii_moisieiev@epam.com>
References: <cover.1775493499.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775493499.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB6817:EE_
x-ms-office365-filtering-correlation-id: 3f01544f-a4c2-4cb4-548c-08de93fb0374
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|38070700021|22082099003|56012099003;
x-microsoft-antispam-message-info:
 cHvVKPwfuMYge+RrzDO2oFk0dlfJg6mE+7XPokAXkVcHX3VOoYNy4uch/74tvjWDoOROVXhDVZzErmDpkarRyLr+cUBzvANry3TyZh3LBWgh3pDNxpxFuUxYLqBQ9qN06u93gDGMaVFmuw7hJYc3OOVsMvSmW70dSpcaBp7I8x38IkpIVTsiI3cVcXAr3SUTSf4jpL7QZTrzi9PDgKlLUpJhJV5I3PsFmMxqh3VkyMSQN81Yq0V/ykNHwJNwSECRWbOBJ1EkCkRntt4guUUmKsWos7mDX+Uz3l3SBIekocbKWkKiB5wIFH/+jRiZ2N+qK9RfW4MrQQKBOInczlKDgk5UbId3lANFRr0d0TwZQkdXVSh3DZ2SGfbjprK0LyrmSCqWyv4K2n2hlU7Ry4RkJG7EWW9Wmey0bqw10D+UbhqcS+zhHJjF3HYVJGCEm78YSfRdOx2egGwmhSWk3X0Rcy/1mf456V8v3ReMpcq7PMoZZA0ZTNKoJdRQ6yxMFHyUGN0kc3TITc+BMefCRkWCfiiuL4gzEwsGzaW226822fSW9doJ2qZg+i7zBBPfh474OqWiQdkZGPa3nN7HLoLfi0sbmw0KXmmDHJerISlr5sOUw++Cx23qxlWj1nxiZqiMQep5VyFGfHXdkE5Nf67/E55R8qH+SD5iO30VcuuCezXqXQo8mGN+57miyC1JKJSNw5Amas6693EuWn50J13CjcFXafEIOY8VZng42aRTdjdKPgjOo0rNq8WHH7yU4N3mvWNIwliHnNNX6HTADSVLtOJrD6lIW7QjFFft/LyMey4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?//A4nQP4iuDwKnIv6DFkzDJrtHjiE5hNVnVDTLChP5MX0mf7jBMYqcFaj7?=
 =?iso-8859-1?Q?om+mZxA4y8bNSxrjBTo9U2DOleHgJVeHgF6Iv+CZ8KYRnz5dh/0tRFIpTC?=
 =?iso-8859-1?Q?62vHr8EVbvKsDaFPD6WNjGyXNKk8PLFESBVV3farc5E1kWJlHvgy9gAU9M?=
 =?iso-8859-1?Q?Idw3+z5mbj7IuVbdavkamR0XNEdSF56PUPfIVjCkbEX6aSEEmUdZGQzV9e?=
 =?iso-8859-1?Q?jdf7PWtJKv31E0kdppMtTzYBJk+TXQqboA7nOnI5ixnKgDgtWWKq5SsLHE?=
 =?iso-8859-1?Q?ONKnAhH2OyJ4NgWqg74fjBg5ZAy92kZQC7pfp9EsbCMGOsYroYh+pJr1c5?=
 =?iso-8859-1?Q?iLlqHVQIsI6KoLApDXC85dlpdc1ypXydNQ0hh+lnbu5YB9WLUiTzAadokZ?=
 =?iso-8859-1?Q?rVLlq9FyWTAgkvqRe1ys8QKcmfPZCptL69Gai4k1PCbwyTejIYDdzMk2V0?=
 =?iso-8859-1?Q?bLll85djET4DUQhG+RL+UCI/hwGTp4VfhDAr4UlEL5t5w94+UC6pvGCf3E?=
 =?iso-8859-1?Q?oT5BM7D4fvm6i4oX9nH+B1WzocqhSsl1JDU8p5LFe+m4gwMFZRl+g8NepC?=
 =?iso-8859-1?Q?pkbKg0T3FIqM1/ZV6gETMZmC1B0nMi0hTt6vhXy1X/0FOxzQs+skilbLuO?=
 =?iso-8859-1?Q?UVlYoh25T+y544h5x5Vob4bn6/xywr2CGwe13OwXL2zlGlzHTTrC5sVcqd?=
 =?iso-8859-1?Q?8aceyiCQj0DpWlq4xkeM5GaMjT75mB4JUillyY5StBXwHdVYNpVnsuv6tT?=
 =?iso-8859-1?Q?oRSQ6f+mdC2QiwV2e0betrugF91WrECRXkTCtSm6YOV8q2i1Xmr/MDxA5/?=
 =?iso-8859-1?Q?Jk91duH7IxfhUSGL75DsUwyAvDs1/RgayxPxazt3UugpEHTOX+B9yAsgFs?=
 =?iso-8859-1?Q?oQY4fFf1Z4u4a8TAZZaFyjOkaCTuxVcSwsikbYOeH8lsclL3YGEjKQmoYe?=
 =?iso-8859-1?Q?Epz1kNBslFXEomshcN75UpLxewzJP1ih0u8JJpdxMCjyhYmUQEBmWxHfQN?=
 =?iso-8859-1?Q?kRfL2GbbIL0eQrVjyymM56nd2RYwUTGHXiXcDeWsxhVAdg72gC0dbe+fYi?=
 =?iso-8859-1?Q?vfkK4Kq5a6wiqFU5ON1by6FGRbO1DkJ8CYAPYLIEjFLRh/HN0i1Cz716aO?=
 =?iso-8859-1?Q?W6NqrSvrLWCxO2mC+l/1tNGhRMRgCx3PyMI1G4ftXzScEXAOv+P4uO9Uqk?=
 =?iso-8859-1?Q?0iLkQ64HOeaNj2r+2jhfzGgdNQy9e3nEaexCmKechIP0tVv635/CctJhZd?=
 =?iso-8859-1?Q?lMeztxW5rQp4k3/KJKwN2mkhncmlAmpWteDqsVVdb8Lsb2XpCzIsVW04ZT?=
 =?iso-8859-1?Q?DiW6iMfE0KKrEDZV2JIMoc3VIqeiAcCSjx5mhHEy3n6qthe1yOPTEDAtZN?=
 =?iso-8859-1?Q?nU7XOvc/mwaqUa4I4iWbN+vVWE0L/Ep+e2K1XsPUiuUDpaDT2XpcqmafMs?=
 =?iso-8859-1?Q?YvxNuOt8/pjWCsOtcwZ2Lo2sbRGbwVFpck6TaqQeAxrk71114f8F6nOyya?=
 =?iso-8859-1?Q?BGU0wJG5NgJeUVfHwFIL3xpT3hLyqEiCnbiSZZU5L5DsWyHmPxlCO4g5hL?=
 =?iso-8859-1?Q?rKFmmHjtIbK4McX1OTgAW2cgMyS2JgYfU3+GlIL7SDRF/aeMCoGM53mrg7?=
 =?iso-8859-1?Q?Icig/OJaZ+9WLH5bJKSVq7crrvuQewt/KKsyEA52E2qCle6cGg+jHyH8PO?=
 =?iso-8859-1?Q?mrn0ONvPzVXrWB1a0YS3lYBjLi2C9JPwg0U8O1riNdGUxS0OANb6FKmEuC?=
 =?iso-8859-1?Q?+w36fNgq6aDwul0JUmNHlezyIyteT0g9AEDgAvW/voGkDUq2Z/hMk9jalJ?=
 =?iso-8859-1?Q?lAuaDHGCIGN/4sO0NY4UXaqrrP2U9dU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f01544f-a4c2-4cb4-548c-08de93fb0374
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 16:39:02.8147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+T6ILgFiPZcq8QGPHZEArH8ZYKRUqb/ZZ5Tk9l1TvC70OfSArMYhyz1eGiJGPmxr3wBH5jGIVxQAFbPC9Ds8hLTNaOApo0SdGGwUiZduew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6817
X-purgate-ID: tlsNG-16d1c6/1775493545-5E9323D8-ECE35C10/0/0
X-purgate-type: clean
X-purgate-size: 6139
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 05CCA3A55F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Plumb the SCMI SMC multi-agent type through the toolstack:

- Extend libxl_arm_sci_type enumeration with scmi_smc_multiagent (value 2)
- Add agent_id field to libxl_arm_sci structure for per-domain agent assign=
ment
- Update libxl_arm.c to translate libxl config to XEN_DOMCTL_CONFIG_ARM_SCI=
_SCMI_SMC_MA
  and pass agent_id to the hypervisor via xen_domctl_createdomain
- Add xl.cfg parsing for arm_sci=3D"type=3Dscmi_smc_multiagent,agent_id=3DN=
"
- Document the new xl.cfg options in xl.cfg.5.pod.in

This completes the userspace side of multi-agent SCMI, allowing xl create
and dom0less configurations to assign unique agent_id values to domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v11:
- Fix agent_id documentation: clarify it applies to SCMI SMC
multi-agent support only, not plain SCMI SMC (reviewer feedback)
- Remove "non-zero" from agent_id description to match accepted
range [0..254]
- Remove "UINT8_MAX (255) is treated as invalid" from user
documentation as unnecessary implementation detail
- Add LIBXL_HAVE_SCMI_SMC_MULTIAGENT feature macro in libxl.h to
advertise the new scmi_smc_multiagent type and agent_id field
- Add agent_id validation in
libxl__arch_domain_build_info_setdefault() to reject invalid values at
the libxl level, not only in xl

Changes in v10:
- Split hypervisor and toolstack changes into separate commits

 docs/man/xl.cfg.5.pod.in         | 13 +++++++++++++
 tools/include/libxl.h            |  8 ++++++++
 tools/libs/light/libxl_arm.c     | 13 +++++++++++++
 tools/libs/light/libxl_types.idl |  4 +++-
 tools/xl/xl_parse.c              | 12 ++++++++++++
 5 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 27c455210b..f642558892 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3156,8 +3156,21 @@ single SCMI OSPM agent support.
 Should be used together with B<scmi-smc-passthrough> Xen command line
 option.
=20
+=3Ditem B<scmi_smc_multiagent>
+
+Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI ov=
er
+SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmwar=
e-A)
+with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
+specified for the guest.
+
 =3Dback
=20
+=3Ditem B<agent_id=3DNUMBER>
+
+Specifies an ARM SCI agent id for the guest. This option is mandatory
+if the SCMI SMC multi-agent support is enabled for the guest. The agent id=
s of
+domains existing on a single host must be unique and in the range [0..254]=
.
+
 =3Dback
=20
 =3Dback
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bc35e412da..99f2734447 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -318,6 +318,14 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
=20
+/*
+ * LIBXL_HAVE_SCMI_SMC_MULTIAGENT indicates that the
+ * LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT value is available in the
+ * libxl_arm_sci_type enumeration and the agent_id field is available
+ * in the libxl_arm_sci structure.
+ */
+#define LIBXL_HAVE_SCMI_SMC_MULTIAGENT 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e4407d6e3f..3adb90c286 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -240,6 +240,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
         config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
         break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_M=
A;
+        config->arch.arm_sci_agent_id =3D d_config->b_info.arch_arm.arm_sc=
i.agent_id;
+        break;
     default:
         LOG(ERROR, "Unknown ARM_SCI type %d",
             d_config->b_info.arch_arm.arm_sci.type);
@@ -1837,6 +1841,15 @@ int libxl__arch_domain_build_info_setdefault(libxl__=
gc *gc,
         }
     }
=20
+    /* Sanitise ARM SCI agent_id parameter */
+    if (b_info->arch_arm.arm_sci.type =3D=3D LIBXL_ARM_SCI_TYPE_SCMI_SMC_M=
ULTIAGENT &&
+        b_info->arch_arm.arm_sci.agent_id >=3D UINT8_MAX) {
+        LOG(ERROR,
+            "Invalid ARM SCI agent_id: %u. Valid range is [0..254]",
+            b_info->arch_arm.arm_sci.agent_id);
+        return ERROR_FAIL;
+    }
+
     if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
         return 0;
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 4a958f69f4..9bfbf09145 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -554,11 +554,13 @@ libxl_sve_type =3D Enumeration("sve_type", [
=20
 libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
     (0, "none"),
-    (1, "scmi_smc")
+    (1, "scmi_smc"),
+    (2, "scmi_smc_multiagent")
     ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
=20
 libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
+    ("agent_id", uint8)
     ])
=20
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1cc41f1bff..2f1b475022 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, lib=
xl_arm_sci *arm_sci,
             }
         }
=20
+        if (MATCH_OPTION("agent_id", ptr, oparg)) {
+            unsigned long val =3D parse_ulong(oparg);
+
+            if ( val >=3D UINT8_MAX ) {
+                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%l=
u). Valid range [0..254]\n",
+                        val);
+                ret =3D ERROR_INVAL;
+                goto out;
+            }
+            arm_sci->agent_id =3D val;
+        }
+
         ptr =3D strtok(NULL, ",");
     }
=20
--=20
2.43.0

