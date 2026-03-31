Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPBNL+ooy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E43632C9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268231.1557589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH5-0000tl-Gg; Tue, 31 Mar 2026 01:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268231.1557589; Tue, 31 Mar 2026 01:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH5-0000ni-4C; Tue, 31 Mar 2026 01:52:11 +0000
Received: by outflank-mailman (input) for mailman id 1268231;
 Tue, 31 Mar 2026 01:52:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH2-0000a1-RQ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH2-00CyDl-7T
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb2851-5cb7-0a2a0a5109dd-0a2a450ce0c0-46
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:08 +0200
Received: from [52.101.66.116]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c7-f93d-0a2a450c0019-34654274e50f-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:08 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:06 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:06 +0000
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
 b=t7PgGh9060MxH3nAmbKr7cCxI8gfyi8tWyM96JGu6kS4OHb9vAx63YoUb0esMhlf2cwFpM3BKldcbYJka+p5VaDGWlk/Xwb8Tf4eBRI84Qk8khb3AHND9qjHeZ/yi+kz4/HJst7zHS5GkVVmHGpLSWCslU6fvX9vJN+Mm8GiSFXpJT8vhp/ygPdhzsL6JAHqq7208eSa8KomuoP7bGS9ziG7/1+jDkUxW9vjTZiN2JfCP97HxxcojGl0pQle7mjhT6bbL/JlwJnMti1XhDcPoG2VFbf2hxF/qKVREZuLT5goDd7hRyBpabyiNFjkjYOaiKB1pzLtMn94NA+U0RvJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0wTnJYqnknl+EFQ6EApvgx2yijg5oFENe59EsVpe3Q=;
 b=UmZCRFbNHSwNiaCLZpWbiUGW9htnIGFEEg98gCHGKSyH9NQSiQP/7KUe/SFyIYtDVJ9GOSjSRNswpudUkedHx3VridzcEdtl3AQ+EAL65rgai2YL3Q3SWITb+IAx3vxzIobnccRDeoUKek7vPrhaY/dz8GMWImaHh7KWJ1DKrxgqnVycSEu87yhoYca26MBk4xi9DeQnBvb07PPjaTTy3oxyxkrXDgrXBDcbsRbehRpCj6esmKtlNCa6JqVUn0RHCTMotGXJ6JSTNxRj9X8xMYjMw5zpTFsM+T3vOLjK7LlSrUjN2IuR0MRmcOU5mGcdc9bYYVZ0XNCyx8x63Ry4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0wTnJYqnknl+EFQ6EApvgx2yijg5oFENe59EsVpe3Q=;
 b=amPN8jgQxnU7pOU6C6ZqTjoKHfTjL6eaUXWJxv9psdqZN6gzVVPBD0STPIhtrV+vsa3AWDLdYBzLl3KKZLif1vdNlla4CVNN90CIU41ke279IFCHEKBP/UM3lbjQCjLX3GsRJUaAsidMQizYn2r30P6dwowsq8YgDABYqbZK7pMRntfYXBs6NgyBBqpE+9cPsjWOW4Vuh11mNDi9BwcNnmkKa2fVB3yTlhZEYGBJOtmuiTvh0VBsc27Tmr1pEOd3+RomP1YyUTJsI2PjmnzDOlBAApdDFqzuI/uCd4kmSB0P097uIxTzpfAaBBmepI2C6jfth9pDV5xf4iESuKgirQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Topic: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Index: AQHcwLD6roDhpzKvfUK5dtMCNddjVQ==
Date: Tue, 31 Mar 2026 01:52:06 +0000
Message-ID:
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|PAWPR03MB9202:EE_
x-ms-office365-filtering-correlation-id: 327efae3-b2f1-4d50-cfb0-08de8ec81cdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 udSCqRR+VMk9Gk6GABZtZkkBGNpBtePpGq1FDCIh6rPZNcqwwR5dXiaZ/k4FCrH30cxOHtWfUycMgVGRPjZ1HcetWHI8kUcCMagDwqNKpIzKCQYvdnzJ8kKfX9V9nJXabMf6eQFiV2SeDJzBbbPqNFReFiywsEmxEydAAwUOafCrUEDxvtgb5cNLT6hvKWTWBEDldX0jcsWHXpBWuEKGKNHvxTmE8dNCU/ZinHio9TaFrfrEOfss5C+6jOaKFrvOp6SfoFVIBVh3b8AnobaLbTlbu6QbOQpaB0gMRLiHDJyjMrUjBZZbONaDFF0Xc/xj89OSS0JbUX7HkVwP8zbzI8UtrELARQvA8bLxwFFhStHVipPa0rk6r8K5E1rcrBGqgCxCL1CKXj2cxVSw1KfAaUlnTY/osjMztm0Yi8aGddYIIgvpTv2aC3uSlayqGK7kS62vGQtlGbDjINa/HEuXT4qg5zCp8t5YdX0LjD13V68dYOatLNGyaSiDYymeY7z6dLa1NnGO0pTnfVEOeYi2E9fhoZOsp9PjiI0tGeGo1DClfDde+bcqq+E0SJl1LibYwe+jkCH8ItsLQ077j6YilmczHOFf/zhEX14tBFkLDexeACTHYtiKWSkcLHHmf08swKjVp4IHMWmuJ56b8d95OrkSOZ50H25HBNmIkUTttbS/xJMQplpWJylofP/iZRJi6g5sb4HvkiZ/lSoTj5O2aZNIbS3ITKy6OvtCBxqUX2Ctg4/6MEs7GQ9VLEwKETDcgVK6VvDaVHvjUsAzqsVWzPRYTsxaPgktPagaGosMNaw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zZMNNFwUOUddFy4gBa7ong6Qvomb2IZOmsJ0XV0riyOPOpr4NfqrV6nbWK?=
 =?iso-8859-1?Q?V8e4EdrSSzopUHNumd2RycEW1kkkaDOndVNK/WCK04C0HeseSSrlf6u2GK?=
 =?iso-8859-1?Q?kymiDRj1uhQgwbc0JNiCRx3MSE4/YwVFAKITGHzUUczur0YwxSycXv33fV?=
 =?iso-8859-1?Q?UrVGkNYmjp25fY7iHY2pEv+PmzHJLqdAX0ajtv83pf9h9DITPFEgRm0gYN?=
 =?iso-8859-1?Q?qclvJmFZ8XYKVT20tbQDE/Nve5xuKPz3cb+0KPffEXblOdEawargaQPlTA?=
 =?iso-8859-1?Q?HbWvColp/Iu6yOh+cZwxsp0lR9O1fUq5TJh/HTD611kjy1/N8yzZburnPi?=
 =?iso-8859-1?Q?dpPsZHjVUMR+BeFLj8nKpEM5yztFuOupJnc9Rw9pb5YIRiV3XLX8GivWwH?=
 =?iso-8859-1?Q?2C7rcV2b2hm9z+jQ6V3uzFzJdqj/vdqzkFwTm5BrjtDyxAx4YUO/CcbFma?=
 =?iso-8859-1?Q?VSJtvqV6TlNAj6PsyrcsaifH7zdLWfMpYlsWzXccGNIL3jZ8Rd84tf2BNU?=
 =?iso-8859-1?Q?Zu8U4xxxnoBI03QTDOTxPq0hkPBPBU/Qzbt3K3AV4POnZNzp0KBcJO2HPv?=
 =?iso-8859-1?Q?QRxIomDl/6mDvxloWWkPXipsFIIylIWh4QsyFrnoH0gIEIXIAAOXuiC6r/?=
 =?iso-8859-1?Q?sMY/aag5I5TXekJGs457lTHeT2YHKtz6/ZPw8Ni+NmcqNgBJD9afSnMN4K?=
 =?iso-8859-1?Q?A8KLY+alJgHaEI5GIkZTjO0x2wYlF3bT+oxcHG3KNr60CyyniIaTRJufA3?=
 =?iso-8859-1?Q?xJS7TLjfWcdB9YDjk0tSacXkSz+anb66F/JWRhT+9lpdTbCoiaWMHt+5eg?=
 =?iso-8859-1?Q?1hqMlLycJPh6ujpKlMGonUX4pI2xl7f9oEqL51fIs44EahpTFEX/jkAxAo?=
 =?iso-8859-1?Q?tcy7oEBi2ujNih/8dTYqGmBjLacPD2FqGq2M0K4o86cLNC2CNBwwaFPW1e?=
 =?iso-8859-1?Q?j0P5nOQPFsuo4cTuSJxhwvVCDwPa3+9hpjfHst4TRf1+rILvl3d5aK+Srl?=
 =?iso-8859-1?Q?HM7BcG55fG+7zJORra2izUi528/3SPymLifpmhee7Oe+XHVCIWbuNw2qBw?=
 =?iso-8859-1?Q?aifrCMc2DjC3QX0tdNU2ThUPQOH4D6gb6zu/y8RVXu5hRxEJmMVxW1sqjf?=
 =?iso-8859-1?Q?M5qhPjd9YpwArpSqmL5IIvEIbrbu4wmIbiNgw8boynVn2nbkEJ48p/ts1+?=
 =?iso-8859-1?Q?ihE0KCo0x+rapDSFngSp+w/K+NPbphHiw+/1omvWkHsnQ7TykKpANhZt6v?=
 =?iso-8859-1?Q?5xy2I7Pxwn5jYM/gY4GjUAu2TrQn+cV308c/evMhxy3fRNG+87MPUHWaSc?=
 =?iso-8859-1?Q?6Sqcre6hNZmaVFwRfDSztKspN9PM30qPlbxFV3cho9NwaqvcuFkDZVL0s4?=
 =?iso-8859-1?Q?coYVRzwJEwlvjccP7CNLGk4BaHfzJNpfsjCxg3AEANf40RO7s6eV17YSfM?=
 =?iso-8859-1?Q?ma/pFgwNUfR+yakmZ3l03ZyQS2/jyzDVO1fl92RcFlx3oa+KdTDiBQE8uj?=
 =?iso-8859-1?Q?gVCGeFILAqNBdDGFOYmDNv04HrNAcrTxQeirFdq3jP20zBEU89BC9QVI8g?=
 =?iso-8859-1?Q?9MZDBJ/nF/OMLHbPBnhLxDsCRIJlkFOWJibIdyV3RVFBymV9y5mKLAu5QC?=
 =?iso-8859-1?Q?GU7ObsIV0yifYga9wCKY7hpNdoEJbqa/XRGOZIvR9ghZzukZADfMagEf2L?=
 =?iso-8859-1?Q?Dq23BWHy7om/5nHSMGHoyC6Kjs41UmVi9jSiz1MEkYj2Bt/WPyAViFngUw?=
 =?iso-8859-1?Q?p39zZ11qcZDt+9Ut1Rz3IfWaU/qE4cJcQGlCYF5XMW10uoVkNAVE/7kDhy?=
 =?iso-8859-1?Q?K6UtfTzs8VzogYilLGnkXzntKufuXAs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327efae3-b2f1-4d50-cfb0-08de8ec81cdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:06.1534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ssrluwS1qSIoCqo5EGvewI3xzsCFVBV1Ajrp1RAHji5v59GT9Ap+C8BNJlzGKeaLgy8ygJWONslanKb0iE6e8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-d25034/1774921928-F7EA3734-293B3C77/0/0
X-purgate-type: clean
X-purgate-size: 11293
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
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 561E43632C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Add initial support for various emulated registers for virtual SMMUv3
for guests and also add support for virtual cmdq and eventq.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h  |   6 +
 xen/drivers/passthrough/arm/vsmmu-v3.c | 286 +++++++++++++++++++++++++
 2 files changed, 292 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index 3fb13b7e21..fab4fd5a26 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -60,6 +60,12 @@
 #define IDR5_VAX			GENMASK(11, 10)
 #define IDR5_VAX_52_BIT			1
=20
+#define ARM_SMMU_IIDR			0x18
+#define IIDR_PRODUCTID			GENMASK(31, 20)
+#define IIDR_VARIANT			GENMASK(19, 16)
+#define IIDR_REVISION			GENMASK(15, 12)
+#define IIDR_IMPLEMENTER		GENMASK(11, 0)
+
 #define ARM_SMMU_CR0			0x20
 #define CR0_ATSCHK			(1 << 4)
 #define CR0_CMDQEN			(1 << 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index e36f200ba5..3ae1e62a50 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -3,25 +3,307 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <asm/mmio.h>
+#include <asm/vgic-emul.h>
 #include <asm/viommu.h>
+#include <asm/vreg.h>
+
+#include "smmu-v3.h"
+
+/* Register Definition */
+#define ARM_SMMU_IDR2       0x8
+#define ARM_SMMU_IDR3       0xc
+#define ARM_SMMU_IDR4       0x10
+#define IDR0_TERM_MODEL     (1 << 26)
+#define IDR3_RIL            (1 << 10)
+#define CR0_RESERVED        0xFFFFFC20
+#define SMMU_IDR1_SIDSIZE   16
+#define SMMU_CMDQS          19
+#define SMMU_EVTQS          19
+#define DWORDS_BYTES        8
+#define ARM_SMMU_IIDR_VAL   0x12
=20
 /* Struct to hold the vIOMMU ops and vIOMMU type */
 extern const struct viommu_desc __read_mostly *cur_viommu;
=20
+/* virtual smmu queue */
+struct arm_vsmmu_queue {
+    uint64_t    q_base; /* base register */
+    uint32_t    prod;
+    uint32_t    cons;
+    uint8_t     ent_size;
+    uint8_t     max_n_shift;
+};
+
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    uint8_t     sid_split;
+    uint32_t    features;
+    uint32_t    cr[3];
+    uint32_t    cr0ack;
+    uint32_t    gerror;
+    uint32_t    gerrorn;
+    uint32_t    strtab_base_cfg;
+    uint64_t    strtab_base;
+    uint32_t    irq_ctrl;
+    uint64_t    gerror_irq_cfg0;
+    uint64_t    evtq_irq_cfg0;
+    struct      arm_vsmmu_queue evtq, cmdq;
 };
=20
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
                               register_t r, void *priv)
 {
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+    uint32_t reg32;
+
+    switch ( info->gpa & 0xffff )
+    {
+    case VREG32(ARM_SMMU_CR0):
+        reg32 =3D smmu->cr[0];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[0] =3D reg32;
+        smmu->cr0ack =3D reg32 & ~CR0_RESERVED;
+        break;
+
+    case VREG32(ARM_SMMU_CR1):
+        reg32 =3D smmu->cr[1];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[1] =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_CR2):
+        reg32 =3D smmu->cr[2];
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cr[2] =3D reg32;
+        break;
+
+    case VREG64(ARM_SMMU_STRTAB_BASE):
+        reg =3D smmu->strtab_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->strtab_base =3D reg;
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+        reg32 =3D smmu->strtab_base_cfg;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->strtab_base_cfg =3D reg32;
+
+        smmu->sid_split =3D FIELD_GET(STRTAB_BASE_CFG_SPLIT, reg32);
+        smmu->features |=3D STRTAB_BASE_CFG_FMT_2LVL;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_BASE):
+        reg =3D smmu->cmdq.q_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->cmdq.q_base =3D reg;
+        smmu->cmdq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->cmdq.q=
_base);
+        if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
+            smmu->cmdq.max_n_shift =3D SMMU_CMDQS;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_PROD):
+        reg32 =3D smmu->cmdq.prod;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cmdq.prod =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_CONS):
+        reg32 =3D smmu->cmdq.cons;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->cmdq.cons =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_BASE):
+        reg =3D smmu->evtq.q_base;
+        vreg_reg64_update(&reg, r, info);
+        smmu->evtq.q_base =3D reg;
+        smmu->evtq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->evtq.q=
_base);
+        if ( smmu->cmdq.max_n_shift > SMMU_EVTQS )
+            smmu->cmdq.max_n_shift =3D SMMU_EVTQS;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_PROD):
+        reg32 =3D smmu->evtq.prod;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->evtq.prod =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_CONS):
+        reg32 =3D smmu->evtq.cons;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->evtq.cons =3D reg32;
+        break;
+
+    case VREG32(ARM_SMMU_IRQ_CTRL):
+        reg32 =3D smmu->irq_ctrl;
+        vreg_reg32_update(&reg32, r, info);
+        smmu->irq_ctrl =3D reg32;
+        break;
+
+    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+        reg =3D smmu->gerror_irq_cfg0;
+        vreg_reg64_update(&reg, r, info);
+        smmu->gerror_irq_cfg0 =3D reg;
+        break;
+
+    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+        reg =3D smmu->evtq_irq_cfg0;
+        vreg_reg64_update(&reg, r, info);
+        smmu->evtq_irq_cfg0 =3D reg;
+        break;
+
+    case VREG32(ARM_SMMU_GERRORN):
+        reg =3D smmu->gerrorn;
+        vreg_reg64_update(&reg, r, info);
+        smmu->gerrorn =3D reg;
+        break;
+
+    default:
+        printk(XENLOG_G_ERR
+               "%pv: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
+               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
+        return IO_ABORT;
+    }
+
     return IO_HANDLED;
 }
=20
 static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
                              register_t *r, void *priv)
 {
+    struct virt_smmu *smmu =3D priv;
+    uint64_t reg;
+
+    switch ( info->gpa & 0xffff )
+    {
+    case VREG32(ARM_SMMU_IDR0):
+        reg  =3D FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
+            FIELD_PREP(IDR0_COHACC, 0) | FIELD_PREP(IDR0_ASID16, 1) |
+            FIELD_PREP(IDR0_TTENDIAN, 0) | FIELD_PREP(IDR0_STALL_MODEL, 1)=
 |
+            FIELD_PREP(IDR0_ST_LVL, 1) | FIELD_PREP(IDR0_TERM_MODEL, 1);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR1):
+        reg  =3D FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
+            FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
+            FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR2):
+        goto read_reserved;
+
+    case VREG32(ARM_SMMU_IDR3):
+        reg  =3D FIELD_PREP(IDR3_RIL, 0);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IDR4):
+        goto read_impl_defined;
+
+    case VREG32(ARM_SMMU_IDR5):
+        reg  =3D FIELD_PREP(IDR5_GRAN4K, 1) | FIELD_PREP(IDR5_GRAN16K, 1) =
|
+            FIELD_PREP(IDR5_GRAN64K, 1) | FIELD_PREP(IDR5_OAS, IDR5_OAS_48=
_BIT);
+        *r =3D vreg_reg32_extract(reg, info);
+        break;
+
+    case VREG32(ARM_SMMU_IIDR):
+        *r =3D vreg_reg32_extract(ARM_SMMU_IIDR_VAL, info);
+        break;
+
+    case VREG32(ARM_SMMU_CR0):
+        *r =3D vreg_reg32_extract(smmu->cr[0], info);
+        break;
+
+    case VREG32(ARM_SMMU_CR0ACK):
+        *r =3D vreg_reg32_extract(smmu->cr0ack, info);
+        break;
+
+    case VREG32(ARM_SMMU_CR1):
+        *r =3D vreg_reg32_extract(smmu->cr[1], info);
+        break;
+
+    case VREG32(ARM_SMMU_CR2):
+        *r =3D vreg_reg32_extract(smmu->cr[2], info);
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE):
+        *r =3D vreg_reg64_extract(smmu->strtab_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
+        *r =3D vreg_reg32_extract(smmu->strtab_base_cfg, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_BASE):
+        *r =3D vreg_reg64_extract(smmu->cmdq.q_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_PROD):
+        *r =3D vreg_reg32_extract(smmu->cmdq.prod, info);
+        break;
+
+    case VREG32(ARM_SMMU_CMDQ_CONS):
+        *r =3D vreg_reg32_extract(smmu->cmdq.cons, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_BASE):
+        *r =3D vreg_reg64_extract(smmu->evtq.q_base, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_PROD):
+        *r =3D vreg_reg32_extract(smmu->evtq.prod, info);
+        break;
+
+    case VREG32(ARM_SMMU_EVTQ_CONS):
+        *r =3D vreg_reg32_extract(smmu->evtq.cons, info);
+        break;
+
+    case VREG32(ARM_SMMU_IRQ_CTRL):
+    case VREG32(ARM_SMMU_IRQ_CTRLACK):
+        *r =3D vreg_reg32_extract(smmu->irq_ctrl, info);
+        break;
+
+    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
+        *r =3D vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
+        break;
+
+    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
+        *r =3D vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
+        break;
+
+    case VREG32(ARM_SMMU_GERROR):
+        *r =3D vreg_reg64_extract(smmu->gerror, info);
+        break;
+
+    case VREG32(ARM_SMMU_GERRORN):
+        *r =3D vreg_reg64_extract(smmu->gerrorn, info);
+        break;
+
+    default:
+        printk(XENLOG_G_ERR
+               "%pv: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
+               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
+        return IO_ABORT;
+    }
+
+    return IO_HANDLED;
+
+ read_impl_defined:
+    printk(XENLOG_G_DEBUG
+           "%pv: vSMMUv3: RAZ on implementation defined register offset %"=
PRIpaddr"\n",
+           v, info->gpa & 0xffff);
+    *r =3D 0;
+    return IO_HANDLED;
+
+ read_reserved:
+    printk(XENLOG_G_DEBUG
+           "%pv: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n",
+           v, info->gpa & 0xffff);
+    *r =3D 0;
     return IO_HANDLED;
 }
=20
@@ -39,6 +321,10 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
         return -ENOMEM;
=20
     smmu->d =3D d;
+    smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
+    smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
+    smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
+    smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
--=20
2.43.0

