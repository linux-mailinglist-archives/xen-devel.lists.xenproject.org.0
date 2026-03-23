Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBq6EBLEwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F52FE953
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259684.1553152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7m-0005fU-D1; Mon, 23 Mar 2026 22:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259684.1553152; Mon, 23 Mar 2026 22:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7l-0005N9-Rs; Mon, 23 Mar 2026 22:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1259684;
 Mon, 23 Mar 2026 22:51:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7b-0003K9-Hp
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7a-00AsDj-Tr
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:42 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c39c-e002-0a2a0a5209dd-0a2a4508b60e-24
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:42 +0100
Received: from [52.101.72.91]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3fe-1950-0a2a45080019-3465485b8eea-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:42 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:41 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:41 +0000
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
 b=rLhL/ht8HiVwLEAnbUvYYtDuwkJDNlvEUM2mb5fP8baQkaTdAdzOLl1WguM2GXYAvX8WSOQjRGR/W6wpGgkQF/yIqhJPWFBfLuVqKEz6QCQn1Twj3vvNEBaZkmFSCUeCyh4Y4wjzfTuIqFO66BZiCrqOykhTiqxzAX1pKslR7Hkh6zmyZlQ93I80GBeNujG8SVEKH2fb39nWZ8EkMSMXMfsD3OUeUAxqiriCs0wBq+NmphXWHDkcj0yFb3fbvwRK4fRmRxU1zngq36eIaOFDiENa8LoJvw4QtN1Y9M++Ni2lbOrDnjZjdbQ6kDznSFaIMq4PQx4aO4A9e0F3yq1dJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgkkRirHRVyTQVWPba86Y6DJai1Ro1LG/1mHtQ/Gduc=;
 b=GZyKPT5J463seXfgLEoT4NkcFQXK+VeAm0rEd5mnNkbe5cV8oWhwSPbEMwpzi2BAVN05bRLzA9EvNI9EUCBlVKPVfatF1mS1uTI9qrjUwW49PCLhsAXCQJFUyDtPVGwQ7D+cCyWjkkZ95DMslSzoeJ1LxS6PO17tt3aJNYozY62bvmOZnNLOLdN10kyggokmnQe7o2iGTTCs7GEgtO1CfwLAhW2J1JK8hLnNneIVTGSRAod53ZgzqU5f34AXlw+xVp2m7IwQNfKwFWnZUYdJUA5ekZ+qmolfmwPDjkvUlsfk+pQOzKYD2b4S1QsukTGFoTemNcHJDcjHdxk7nJw1LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgkkRirHRVyTQVWPba86Y6DJai1Ro1LG/1mHtQ/Gduc=;
 b=Vww+9oMcYKwdk4+m4ieGATviHFvlUVVW55c26pntSF8HCPaM/b9vp6iZM+lSkah27fSI4QKe5BP7VOycag0HbcE46I7B41Ndb9oLUTCBn6NH+AlRE8I2rsGEVyJFvdrtcVNzPHUhpef/B8BECLwGvLK1XMdtUgOTdmdHkZzPGjl3mYHb3I4Jgilr61EAcwNSqeqkDL88q6FL/hOsAMdKVZr8KdCFkbxN7a5sXdPNirCEwRuNLglmgIJmK/umRl4O7LEy9rjwdnlozaeiqHCAztJxDlNPiU4dtqcwd+3utyhk5h4QAnE6pISgiS31UsSvlmYWW7jfJELRgMmuPZ8BQQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 21/23] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Topic: [PATCH v2 21/23] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Index: AQHcuxedPA9PfL7sD0CgwT84cLTN7Q==
Date: Mon, 23 Mar 2026 22:51:41 +0000
Message-ID:
 <fd09246c0c9eb0ec369c180a2993ed47aa73a29f.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 697fc848-7071-4394-5e41-08de892ebfc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Q89CLKd+j4x9tOVVkjFPNrHRSlc8yiDt7EDwMoO879aIH81EHyHucLSsXvQfrZT516kMUvUb7fUS7nA9PppGkxuo4trJuYhshhY7/utqqlG473HhO7m0M1SYuyMBz+K6e8pH9TUpOhKtYbVbOj/4cG+GTig/4CvMCxNo3KlDQZnvSvxAXxVfl73tppeS1F6UUAlfwTJgorw9QjgDV1uGGDpE/QteSOAth24ooX8B4AuqFUCRIxkNiYepJbhzZ39Y6gFn6/lIlWhE9v76rquN3S/Id8r2mW0vTd9t3OjxJz0SGD00yGmGS0zjYvyV/u6fYfTaVP7ByDsVmeMdr8Z+rqzKnbsKLAdujTB5qoU6cZFz2k+clpt1J7AsWu+q7528mtIaJvkkQXIm+2Yrl9B40DzIaou1AEnuK32tKQLjk3A7m31NHllUrmzoibE5cbG5anC6oQn6mdBrglNCZ7TmqGVNPuII0QfOkwSS3OFvFarEx17c5bbvFaYDNy0mp/bZCfmjUpzk25GwxmFsx92Rm3ZWuSHBtZb5QdOvsrkdvALAlpRudT+rBWdrjwsVp4FbVIaddK7Tr+t216Ri50/cLzS1aFlBDfZFEJpZG2Chorj26yNfylTS/XrP//8UPIOEYF6qapMPUp4FFeYV3UXNT+9x/m4Y0Ek/0m//xa2by7tlHO+xhFCbdphgxgHdW0AalpVCXSPs6aAgxDUJ18x5IXXOlLPf7n7w5QGZyKd+JX2clqcZmmCt0G6bKzFO58VnuEb+pP8YUPesk6HGZzkweLPc+No3AqitV2RnUoyT7tw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cPpSzXLOw5NT1OQnJjncxz1eidy/m55yMlpBEE/3XscZuVF2TPK1P0zbNC?=
 =?iso-8859-1?Q?tLeDGWfwHzy7wqRAG7DHyNJOh1GnmC7Vap366NnRcVDjZErymrFCu6F9Oh?=
 =?iso-8859-1?Q?BwQkeG6KQfetY0E5yttEXfCcfAIfil0WolmbdVUZWozua8vrsX5diWBO8e?=
 =?iso-8859-1?Q?iAQbp2aIDigt2Wm8GiIx33e6V76hHZJnvLskV689rxjlIVVgKz/qpOE+hV?=
 =?iso-8859-1?Q?YPrddHSE2dIDV8+S+7t8L1pfr01EPRAql3A9YM8L1PcdmbdQQhzWi9V7Vp?=
 =?iso-8859-1?Q?23YwtUwf9Sz3jeJNYNX4XVydUy0lNNiNf2bQST7clGVY3YtFNxgl6DTR71?=
 =?iso-8859-1?Q?39yDKyMrVqN0v5vN14EV93bdwvfxFsgNfu7M8zGTMVlI/k/67u7maEdiSp?=
 =?iso-8859-1?Q?XSqMW+v7LySWbodREUYiBIcFp7M52LIBSPVBgbVWQAxpnTdN1ieis9OUvl?=
 =?iso-8859-1?Q?NXnk44NZnRS4ipXFfulDj0Fo4YeRbcdf599g+p2e9stVUCBkWYYq6pS6qt?=
 =?iso-8859-1?Q?OMKXvR3ltsX1wFHmQgLn8TwTqst3nfvfsOXmArcV0PTKq+PX2yTD261Y95?=
 =?iso-8859-1?Q?f5+tNL9Ddx97XxMrY9HJCUNxwicTFr+zr+PIdn2g5Hp40WwpI6puAQPouU?=
 =?iso-8859-1?Q?eo9frybNvBON3ANNZ7Vj49U2HCRApD72l/SqQ8rN/zGoQKmkOLLeKN3gG4?=
 =?iso-8859-1?Q?vwqSc6U9jTzbfUYQxhRxWmIQJ8cdpKcoFrtSIKtUpgKypYcPJTFlLoqhWH?=
 =?iso-8859-1?Q?ccFRbDYBVF4enJS1rnUOs+PuJga3Oy/3dOuBANM0gfIs8DShTCWi5L2ai9?=
 =?iso-8859-1?Q?uhIsioUWjEu1jzlg3xg6Slhultm05jM2ebd0+RQi8aopqVXILFAcFv6Vq4?=
 =?iso-8859-1?Q?i+951LVAZ/rdi+3taIbeq4lkxLfHP8oLqTHUqJPbSvAEhRLl7eNLoups87?=
 =?iso-8859-1?Q?QqYMtl35eHQlUCNgbyf3b/4RnXJdYOv3PRE0kONrn9qS6dV6Tg4235nOPs?=
 =?iso-8859-1?Q?eeTRKxsXoDwomTYBg+QxfIlNccK7K9nopzim3EuYoAUCKeE3dKsvX1UrT6?=
 =?iso-8859-1?Q?kkPHFe5xhgmYG+An0QFqz2OQEK9DPP6c9WTwxUK2GBLlygi/KnJ42xjhW8?=
 =?iso-8859-1?Q?Iq6wKWhrfm7tYTpSLFI+udWJyemm6F3ofTHzg9SkK6SZVz85vPqtmjm14x?=
 =?iso-8859-1?Q?hNXpdI8Gx1d972Sp5xR57UQ/W9b5YzDhlpbWGc595Fj+XM7oW4TOKZre9y?=
 =?iso-8859-1?Q?6rxXo21aGcsud6/AqT9687y7GBYjkLftaXs30IJOXD+83kLse0cKhXaiCx?=
 =?iso-8859-1?Q?QxXA/dOCr+W1wDZi6LypuhaPuL6wc9CGL6wQp6gAALf0Abqw9eWgp+2tzC?=
 =?iso-8859-1?Q?cE1EXaa+tcyMaDbF4eM0XWuWSvzUlA/+ym0vB7LvkuEumc24lAwaqQF0r/?=
 =?iso-8859-1?Q?jzXiNarPEbZlrHkhQxuz66Ue8EU41rVOQ17feugQtEZV5z56FFolyf5jju?=
 =?iso-8859-1?Q?BVI0uvrV3CuCO2Dk9N7SGDSDGZVsHmV3wA24cro1UrGASa4addCQPoYVAE?=
 =?iso-8859-1?Q?eM3c/KZvmJdJeLZolq2Y6OUVha4Ek5w/opzyWjaw3S7dYXRtiHDNcloS5Z?=
 =?iso-8859-1?Q?cZr2msi8LBoP+MzstVXEbtYAC7MxunwU9KBfUz2rhiS4Wg49Q0cprOvotg?=
 =?iso-8859-1?Q?b62mbLcVpZ0T7sqJtkNPLWW+trONieynK0lZZNHMoUByZuzJeXbpOwbboJ?=
 =?iso-8859-1?Q?s5zeYzsbXmUjBaSoNd7HXkIwZYZiMVfgygUAAhFvmW/ZV/P42tUKLF82Jr?=
 =?iso-8859-1?Q?uwgPgDr52dGYiofgp+gcDIcFQFL/cXc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697fc848-7071-4394-5e41-08de892ebfc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:41.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9f+0ebhXoTWuGdLuXToa5Ytb/kup5BgNXH/CaxZJCICeTUSfqd4UVE03PcCo893PtxDnCUJfoH9PcewDy30og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-purgate-ID: tlsNG-c1860d/1774306302-EBC9C726-C97B1BC3/0/0
X-purgate-type: clean
X-purgate-size: 11154
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C94F52FE953
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce vIOMMU mapping layer in order to support passthrough of IOMMU
devices attached to different physical IOMMUs (e.g. devices with the same s=
treamID).
New generic vIOMMU API is added: viommu_allocate_free_vid().
This function will allocate a new guest vSID and map it to input pSID.
Once mapping is established, guest will use vSID for stage-1 commands
and xen will translate vSID->pSID and propagate it towards stage-2.
Introduced naming is generic (vID/pID), since this API could be used
for other IOMMU types in the future.
Implemented usage of the new API for dom0less guests. vSIDs are allocated
on guest device tree creation and the original pSID is
replaced with vSID which shall be used by the guest driver.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/include/asm/viommu.h       | 10 ++++
 xen/common/device-tree/dom0less-build.c | 32 +++++++++---
 xen/drivers/passthrough/arm/viommu.c    |  7 +++
 xen/drivers/passthrough/arm/vsmmu-v3.c  | 67 ++++++++++++++++++++++++-
 4 files changed, 106 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index b519a73d4d..4cf8664ba3 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -33,6 +33,15 @@ struct viommu_ops {
      * Called during domain destruction to free resources used by vIOMMU.
      */
     int (*relinquish_resources)(struct domain *d);
+
+    /*
+     * Allocate free vSID/vRID for the guest device and establish vID->pID=
 mapping
+     * Called during domain device assignment.
+     * Returns 0 on success and sets vid argument to newly allocated vSID/=
vRID
+     * mapped to physical ID (id argument).
+     * Negative error code returned if allocation fails.
+     */
+    int (*allocate_free_vid)(struct domain *d, uint32_t id, uint32_t *vid)=
;
 };
=20
 struct viommu_desc {
@@ -48,6 +57,7 @@ struct viommu_desc {
=20
 int domain_viommu_init(struct domain *d, uint16_t viommu_type);
 int viommu_relinquish_resources(struct domain *d);
+int viommu_allocate_free_vid(struct domain *d, uint32_t id, uint32_t *vid)=
;
 uint16_t viommu_get_type(void);
 void add_to_host_iommu_list(paddr_t addr, paddr_t size,
                             const struct dt_device_node *node);
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 4b74d2f705..2bf09637b6 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -31,6 +31,8 @@
 #include <xen/static-memory.h>
 #include <xen/static-shmem.h>
=20
+#include <asm/viommu.h>
+
 #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
=20
 static domid_t __initdata xs_domid =3D DOMID_INVALID;
@@ -318,22 +320,33 @@ static int __init handle_prop_pfdt(struct kernel_info=
 *kinfo,
     return ( propoff !=3D -FDT_ERR_NOTFOUND ) ? propoff : 0;
 }
=20
-static void modify_pfdt_node(void *pfdt, int nodeoff)
+#ifdef CONFIG_VIRTUAL_IOMMU
+static void modify_pfdt_node(void *pfdt, int nodeoff, struct domain *d)
 {
     int proplen, i, rc;
     const fdt32_t *prop;
     fdt32_t *prop_c;
+    uint32_t vsid;
=20
-    prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+    prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);=20
     if ( !prop )
         return;
=20
     prop_c =3D xzalloc_bytes(proplen);
=20
+    /*=20
+     * Assign <vIOMMU vSID> pairs to iommus property and establish
+     * vSID->pSID mappings
+    */
     for ( i =3D 0; i < proplen / 8; ++i )
     {
         prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
-        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        rc =3D viommu_allocate_free_vid(d, fdt32_to_cpu(prop[i * 2 + 1]), =
&vsid);
+        if( rc ) {
+            dprintk(XENLOG_ERR, "Failed to allocate new vSID for iommu dev=
ice");
+            return;
+        }
+        prop_c[i * 2 + 1] =3D cpu_to_fdt32(vsid);
     }
=20
     rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
@@ -345,11 +358,14 @@ static void modify_pfdt_node(void *pfdt, int nodeoff)
=20
     return;
 }
+#else
+    static void modify_pfdt_node(void *pfdt, int nodeoff, struct domain *d=
) {}
+#endif
=20
 static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cel=
ls,
-                                 bool scan_passthrough_prop)
+                                 bool scan_passthrough_prop, struct domain=
 *d)
 {
     int rc =3D 0;
     void *fdt =3D kinfo->fdt;
@@ -372,9 +388,9 @@ static int __init scan_pfdt_node(struct kernel_info *ki=
nfo, void *pfdt,
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
-        modify_pfdt_node(pfdt, node_next);
+        modify_pfdt_node(pfdt, node_next, d);
         rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_=
cells,
-                            scan_passthrough_prop);
+                            scan_passthrough_prop, d);
         if ( rc )
             return rc;
=20
@@ -443,7 +459,7 @@ static int __init domain_handle_dtb_boot_module(struct =
domain *d,
             res =3D scan_pfdt_node(kinfo, pfdt, node_next,
                                  DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 false);
+                                 false, d);
             if ( res )
                 goto out;
             continue;
@@ -453,7 +469,7 @@ static int __init domain_handle_dtb_boot_module(struct =
domain *d,
             res =3D scan_pfdt_node(kinfo, pfdt, node_next,
                                  DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
                                  DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 true);
+                                 true, d);
             if ( res )
                 goto out;
             continue;
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
index 5f5892fbb2..4b7837a91f 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -71,6 +71,13 @@ int viommu_relinquish_resources(struct domain *d)
     return cur_viommu->ops->relinquish_resources(d);
 }
=20
+int viommu_allocate_free_vid(struct domain *d, uint32_t id, uint32_t *vid)=
 {
+    if ( !cur_viommu )
+        return -ENODEV;
+
+    return cur_viommu->ops->allocate_free_vid(d, id, vid);
+}
+
 uint16_t viommu_get_type(void)
 {
     if ( !cur_viommu )
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 5d0dabd2b2..604f09e980 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -53,6 +53,8 @@ extern const struct viommu_desc __read_mostly *cur_viommu=
;
 #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
                                     FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
=20
+#define MAX_VSID   (1 << SMMU_IDR1_SIDSIZE)
+
 /* event queue entry */
 struct arm_smmu_evtq_ent {
     /* Common fields */
@@ -100,6 +102,14 @@ struct arm_vsmmu_queue {
     uint8_t     max_n_shift;
 };
=20
+/* vSID->pSID mapping entry */
+struct vsid_entry {
+    bool        valid;
+    uint32_t    vsid;
+    struct host_iommu *phys_smmu;
+    uint32_t    psid;
+};
+
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
@@ -118,6 +128,7 @@ struct virt_smmu {
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
     spinlock_t  cmd_queue_lock;
+    struct vsid_entry *vsids;
 };
=20
 /* Queue manipulation functions */
@@ -426,6 +437,29 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
     struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
     uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
     struct iommu_guest_config guest_cfg =3D {0};
+    uint32_t psid;
+    struct arm_smmu_evtq_ent ent =3D {
+        .opcode =3D EVT_ID_BAD_STE,
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
+
+    /* SIDs identity mapped for HW domain */
+    if ( is_hardware_domain(d) )
+        psid =3D sid;
+    else {
+        /* vSID out of range or not mapped to pSID */
+        if ( sid >=3D MAX_VSID || !smmu->vsids[sid].valid )
+        {
+            arm_vsmmu_send_event(smmu, &ent);
+            return -EINVAL;
+        }
+
+        psid =3D smmu->vsids[sid].psid;
+    }
=20
     ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
     if ( ret )
@@ -446,7 +480,7 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *=
smmu, uint64_t *cmdptr)
     else
         guest_cfg.config =3D ARM_SMMU_DOMAIN_NESTED;
=20
-    ret =3D hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
+    ret =3D hd->platform_ops->attach_guest_config(d, psid, &guest_cfg);
     if ( ret )
         return ret;
=20
@@ -791,6 +825,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr,
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
     smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
+    smmu->vsids =3D xzalloc_array(struct vsid_entry, MAX_VSID);
=20
     spin_lock_init(&smmu->cmd_queue_lock);
=20
@@ -850,8 +885,9 @@ int vsmmuv3_relinquish_resources(struct domain *d)
     if ( list_head_is_null(&d->arch.viommu_list) )
         return 0;
=20
-    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list =
)
+    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list)
     {
+        xfree(pos->vsids);
         list_del(&pos->viommu_list);
         xfree(pos);
     }
@@ -859,8 +895,35 @@ int vsmmuv3_relinquish_resources(struct domain *d)
     return 0;
 }
=20
+int vsmmuv3_allocate_free_vid(struct domain *d, uint32_t id, uint32_t *vid=
) {
+    uint16_t i =3D 0;
+    struct virt_smmu *smmu;
+
+    if ( list_head_is_null(&d->arch.viommu_list) )
+        return -ENODEV;
+
+    smmu =3D list_first_entry(&d->arch.viommu_list, struct virt_smmu, viom=
mu_list);
+
+    /* Get first free vSID index */
+    while ( smmu->vsids[i].valid && i++ < MAX_VSID );
+
+    /* Max number of vSIDs already allocated? */
+    if ( i =3D=3D MAX_VSID) {
+        return -ENOMEM;
+    }
+
+    /* Establish vSID->pSID mapping */
+    smmu->vsids[i].valid =3D true;
+    smmu->vsids[i].vsid =3D i;
+    smmu->vsids[i].psid =3D id;
+    *vid =3D smmu->vsids[i].vsid;
+
+    return 0;
+}
+
 static const struct viommu_ops vsmmuv3_ops =3D {
     .domain_init =3D domain_vsmmuv3_init,
+    .allocate_free_vid =3D vsmmuv3_allocate_free_vid,
     .relinquish_resources =3D vsmmuv3_relinquish_resources,
 };
=20
--=20
2.43.0

