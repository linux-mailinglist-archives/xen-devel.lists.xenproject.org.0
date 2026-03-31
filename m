Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJVjCO4oy2n8EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F263632ED
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268302.1557715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHV-0006Kx-6l; Tue, 31 Mar 2026 01:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268302.1557715; Tue, 31 Mar 2026 01:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHU-00067R-0Z; Tue, 31 Mar 2026 01:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1268302;
 Tue, 31 Mar 2026 01:52:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHM-0004eW-Tq
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHM-00EbSb-8G
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c1-2eae-0a2a0a5409dd-0a2a4501906e-30
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:28 +0200
Received: from [52.101.83.106]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28db-6400-0a2a45010019-3465536aceae-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:28 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:25 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:25 +0000
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
 b=NC/61llCGtq9vLa+tsmLmjl3bi9tGMzYA7X+1hBGENzVu7Gfcu31bYsKpcTxX/QxCwuDMfqI6/FUxf0n67y3mrJLNk69ctdJkQRFpqwoyT8VczeUQwxV4VFD1jUz8WD56h0N9AdqZmQmZgTvK+6ehm0zTYD4a8Co7GSvZGHFet1HPUQyNusWDmxyvv9vz7qgi9iKh/NHJjBmz9502GJLMf+tet3g/xMiyrh1yXyZwPEZxXDepD+fMVQMRbjT1gH7lcTqgsXRbjgRTFgLmc6oE3iK8GbaKZ1g482MLgG8otpcoIkVFAxLcdh7gmi7uGVAJm9utEIzW9euTFVIdjs30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POdIWiyq3zK2RST8fX5c8KWOFnxRtRBhHZSCrNKk+HM=;
 b=apR314B8h83ujfWVb8lkwR2rRvGT6VRc3AS6+hWpTDkpJjec4ubVGIKEDLil+1o8t8DTdbYar44bmSqqh5oT3KU/j9VqpJ6uISLUwXiM+uCf4/GpoOZWJLSMKAqprfuAzgxycEBadTd11qcTICemKdc92cMxcLfXwma9aoI35oeK9WbFfUHDquKvTk0lnCnIf6qsjwrGDrWjYA425qqSOdqjyvZOZmZkA1QrP6Wlyr1qf2Y07WpFxtH1VB1s6czoynv02/9Gn1L25SUTiXb9hGKTMt0cucPF8Sy977PWmm41sbLh8rxw1l4OhwG54ct/OM+j7FWQzaVcBpptY6XFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POdIWiyq3zK2RST8fX5c8KWOFnxRtRBhHZSCrNKk+HM=;
 b=sKCPwGxkL9M262F1Xf4VAmWJONo+Nz/MNMyfD7MFWq3xjs5ao03W22byFCG8uMbR1p/4mOJlQ+8J7xotFKHrYRh2F7SJ7+GjHr40AQT9yHLcqHDwChY/E0sKTBUxYzLMJEsnsA9LhxBfWX+sKfZmjL/Md2eWvl6DJ2MWTUzZ9YC966vMiGqyVROmTQuc/KOFICNFmTigyILl2MM95noAYmgP/C3dpaQEyBPgYoiYt59gx8oNwzZ5jp83piDCR6dQ8/NvUrhK8RU4dhF4maYQvTB49kfB8RRuTQJDWqkTZWdKjiU2E9ZfargbOj72pfgEoyldkeK83zMUX7kRnRXmlQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 23/23] doc/arm: vIOMMU design document
Thread-Topic: [PATCH v3 23/23] doc/arm: vIOMMU design document
Thread-Index: AQHcwLEF/MF3mCsLfEau6Nk62vBvCw==
Date: Tue, 31 Mar 2026 01:52:25 +0000
Message-ID:
 <06d3f9dd178c40b9b2360c24cc2ed55f9559eba6.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 62dfcb1f-9599-4e47-06ff-08de8ec82854
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|3122999024|38070700021;
x-microsoft-antispam-message-info:
 sJInYFNifUqVb6/1col1mHFHR01oGpaEFG9GWgB/Pyo2TlAFByd+uG8WUtsGUy8i0QV7Te7DF+0asMq7pre166HAXUbYW06N43e3BaTgrrd3SC75+xPW6dlyifhlSZLKS3aMrKV9xSU9M2YLx9B02l34HBsgoM8hst5N5IMY6SSumvVsJZcEh45zbQvKGwnv3vG6bCY04uVxYse8q2+bDvX43L7Jo80ZZXghKOW4+1V1x7ykEENZf+9CG/B7XVkScG+FGkGZbm9XRi0OaAl1Rffsb6KN9/HPAL0rzIq20a/KmfLK/Ygs96dfk0vqbrApg3wH+5C2cHV4vlYn1B1G4dsigXyVdCn6stiMPCswqzgPz7cNRLXu/W3q//6miFX952NhBGY8M6hCw+i5syXsK7W3x/4osCQNro6cofsrY1ML/Fe0SEpVqR7253L3QaNZT81cm/7/omvmwqAwra6KomxzJHFNSdW0+G7UZ8enGD6pG2ltLxtoh5R2jd4RaE2ZtJ09jm7o6gq7IBd9zylRmwENYDQm7VIX0YvFhcQK8fooKQXeDOC+xjXYrBLzMjHzk39xP7gCxJk8UlvKZNS9oocL77L8msnwMrH8MRNpXNe5fUyrpoXZXr3XTWXTxrpKuBafNo3quK/dmErH/Mc9M0F2ot9tn2LXub9pUDypmqFAlHVAy8mo3A8wnwA3kUJ01lqnmD/V9HGD08AwB5YKNXMr5BpPCblzHr1YwrwNDAvuKRpRdqyt9jJ/4aOKAyHvTA8msN/wiabTP1IcG/3MHdCgIczK7Re0f8lpd48H43k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(3122999024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SCcK2yqU8STACJbqomU5IYSnJCp7Ek2RNMCA/VwSlvZn4PdXaIDkwaIw6z?=
 =?iso-8859-1?Q?ggkZlTCprCpoK3Odn5uG5B2IVFuAnepUerJ38vYVFSfe8q3HqJOwgMdF/2?=
 =?iso-8859-1?Q?3yxT3eMM2Sv+BzM9gg7zhB+oJBkXI41KXJBH+n775hxZHrQ7vczvz/JssX?=
 =?iso-8859-1?Q?XyeW8HWL8c1Skoxo0f5xC8In6bWFh82CeAK+3InplpEIQLMCiJl+3gD8S1?=
 =?iso-8859-1?Q?7P91jDf4l/0k5kS+InzyzwpXVrMqmOGmC7bikjfe2XYnE43nJyJz2Mw2F1?=
 =?iso-8859-1?Q?a6elSfybIu1QimkCJYUmJn11OwedxAU1c9Pli+VMFbxeavukIb9kjZECBU?=
 =?iso-8859-1?Q?GoiSXvdZTnWTZiJAeF24lfASCvLFVO2AHAG5dh7FpX+5kyYN5+h9SAuxUQ?=
 =?iso-8859-1?Q?vqE2JediexOHH9wVi7mVrqZ93O1VcNL8phxTwxXKrx9WMckRLfSPQNMrNG?=
 =?iso-8859-1?Q?9P3h91o4vXquCDT0gma4RixySLt95DYS3z0SqjJcyFB1Q3wcCqDClgibCs?=
 =?iso-8859-1?Q?SSqpxABo/oYSFIacR+XdwgM1v32+hnvTz0NNvPouaSdf1rLIJTvdywOLT9?=
 =?iso-8859-1?Q?mQgZXvzTHpwRAJBFfoMoPmZKvyltMZ4+twNCXJnwdLZ37kaNg/Rt5xlzC8?=
 =?iso-8859-1?Q?tErrgYWo9SwbHnFhIgnTC9XQOR+Lu22qLJpBCuc5AQUOqv9WYKiC3KW3CF?=
 =?iso-8859-1?Q?4ZkaPFh5AgTYupT1KbfY2msyCT/ekUHVnCdFfFmlkBcrxv35MNrAKV/ehY?=
 =?iso-8859-1?Q?1dk+hZk5Mu5MJqLsIGs6Ajv2qKsCIgftIfJUSj6pEpHKq6oY1oh+1okN5Q?=
 =?iso-8859-1?Q?H+SOXLpi5bgP3l5svDY/MeZDsZOA3YJ/eM6uhVzv/wWM5oAKGsHMPm+1C2?=
 =?iso-8859-1?Q?odL+e1ANtGIuoKwMh5RLQUALq4DnkQzPR5OKtWpT6DZJ+BZA4ZFk3NUvHN?=
 =?iso-8859-1?Q?ZPFZ3/tvi5n0HcclRO/MefIRSHD6Pehx+1rdemw26maqJxpsl2to4IdUPr?=
 =?iso-8859-1?Q?xKzWeHYH1lipErTyrU79Z2KDx40O/ILQgkuHOinneK3aQoDY9TMxSaQsWh?=
 =?iso-8859-1?Q?63S8+WbJ1oimJ7Rn0j+0m4K9R9+QTntjeOWIQwD5sIfx4Ixf8p5aMK74Gu?=
 =?iso-8859-1?Q?r96uxTKi9QDq3BEMZ7HWL2HaDIB+BSyu4B0KoYhiNtGrqpylLSjYc3mKOC?=
 =?iso-8859-1?Q?LNV7GHSnF3kN9u1Jmc1NI+TPx0YCWGPkMglQRRL/DHD7+kI+AusekUSIVb?=
 =?iso-8859-1?Q?ca+dPjl3ZvdcOLmDmHWboJw6BdBb3UyaY9bKXQ675NlaWw9UU8hsewVucB?=
 =?iso-8859-1?Q?KgI5AAs41m4AvQ2odEBJvrP31aI0upQrll/MKuhy7+QgzjcazwB45wagBe?=
 =?iso-8859-1?Q?bDu0vu1ALoWoXchc2FlbZHJrdQeLKjqeVAR0b0fNbEOzinhoIufVtTbAe4?=
 =?iso-8859-1?Q?sL6YRBy9ak7t5FxqlwlFp+ItCr0DLRWTAp8viqtm4KjVjUPyKofnIljtFY?=
 =?iso-8859-1?Q?uSJY+FFbiBe3ai0rVma0ZwTZg3i5DXQVGijFr27A2fJgPahIfPT6AANrez?=
 =?iso-8859-1?Q?/3qH6W2QqkwTs0K8S7RG2lRlT6C4HrCsK1Fh8Y1rALw3saD+vmzG+NS8JE?=
 =?iso-8859-1?Q?wSPqRVPmd9S+7XivgHqwShwAz6D5BhcY39Tyrpfo6yJDd8CNfBWDlbHV9w?=
 =?iso-8859-1?Q?N2BtACMwpnIGobUBCYb4VQv8PnqnCrlaCQcZhnnHnOaHVAtspaU3QKHsAH?=
 =?iso-8859-1?Q?+seGkcFrfyGVKpFwq4TzT3f9NxAUg/+13OHXY/fTReX/VCdm6PFwdmB2BB?=
 =?iso-8859-1?Q?A5AwVwmOwl77/j6hrJHTjKyWE9JmIX4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dfcb1f-9599-4e47-06ff-08de8ec82854
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:25.4274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ovr8rekdWniPGrfsEo1bQA87nDcch8aOhadWadoMqZC59lkaXPI1cflpyVES43u1ohEpg0aqo9fWIF6R7g8AKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-d62444/1774921948-49011DF3-D7ED07B8/0/0
X-purgate-type: clean
X-purgate-size: 16730
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 91F263632ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This document outlines the design of the emulated IOMMU,
including security considerations and future improvements.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/designs/arm-viommu.rst | 390 ++++++++++++++++++++++++++++++++++++
 1 file changed, 390 insertions(+)
 create mode 100644 docs/designs/arm-viommu.rst

diff --git a/docs/designs/arm-viommu.rst b/docs/designs/arm-viommu.rst
new file mode 100644
index 0000000000..0cf55d7108
--- /dev/null
+++ b/docs/designs/arm-viommu.rst
@@ -0,0 +1,390 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+:Author:     Milan Djokic <milan_djokic@epam.com>
+:Date:       2026-02-13
+:Status:     Draft
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The SMMUv3 supports two stages of translation. Each stage of translation=20
+can be
+independently enabled. An incoming address is logically translated from=20
+VA to
+IPA in stage 1, then the IPA is input to stage 2 which translates the IPA =
to
+the output PA. Stage 1 translation support is required to provide=20
+isolation between different
+devices within OS. XEN already supports Stage 2 translation but there is n=
o
+support for Stage 1 translation.
+This design proposal outlines the introduction of Stage-1 SMMUv3 support=20
+in Xen for ARM guests.
+
+Motivation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+ARM systems utilizing SMMUv3 require stage-1 address translation to=20
+ensure secure DMA and
+guest managed I/O memory mappings.
+With stage-1 enabled, guest manages IOVA to IPA mappings through its own=20
+IOMMU driver.
+
+This feature enables:
+
+- Stage-1 translation for the guest domain
+- Device passthrough with per-device I/O address space
+
+Design Overview
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+These changes provide emulated SMMUv3 support:
+
+- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support
+  in SMMUv3 driver.
+- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
+  handling.
+- **Register/Command Emulation**: SMMUv3 register emulation and command
+  queue handling.
+- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to
+  device trees for dom0 and dom0less scenarios.
+- **Runtime Configuration**: Introduces a `viommu` boot parameter for
+  dynamic enablement.
+
+A single vIOMMU device is exposed to the guest and mapped to one or more
+physical IOMMUs through a Xen-managed translation layer.
+The vIOMMU feature provides a generic framework together with a backend
+implementation specific to the target IOMMU type. The backend is responsib=
le
+for implementing the hardware-specific data structures and command handlin=
g
+logic (currently only SMMUv3 is supported).
+
+This modular design allows the stage-1 support to be reused
+for other IOMMU architectures in the future.
+
+vIOMMU architecture
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Responsibilities:
+
+Guest:
+ - Configures stage-1 via vIOMMU commands.
+ - Handles stage-1 faults received from Xen.
+
+Xen:
+ - Emulates the IOMMU interface (registers, commands, events).
+ - Provides vSID->pSID mappings.
+ - Programs stage-1/stage-2 configuration in the physical IOMMU.
+ - Propagate stage-1 faults to guest.
+
+vIOMMU commands and faults are transmitted between guest and Xen via
+command and event queues (one command/event queue created per guest).
+
+vIOMMU command Flow:
+
+::
+
+    Guest:
+        smmu_cmd(vSID, IOVA -> IPA)
+
+    Xen:
+        trap MMIO read/write
+        translate vSID->pSID
+        store stage-1 state
+        program pIOMMU for (pSID, IPA -> PA)
+
+All hardware programming of the physical IOMMU is performed exclusively by=
 Xen.
+
+vIOMMU Stage-1 fault handling flow:
+
+::
+
+    Xen:
+        receives stage-1 fault
+        triggers vIOMMU callback
+        injects virtual fault
+
+    Guest:
+        receives and handles fault
+
+vSID Mapping Layer
+------------------
+
+Each guest-visible Stream ID (vSID) is mapped by Xen to a physical Stream =
ID
+(pSID). The mapping is maintained per-domain. The allocation policy guaran=
tees
+vSID uniqueness within a domain while allowing reuse of pSIDs for differen=
t
+pIOMMUs.
+
+* Platform devices receive individually allocated vSIDs.
+* PCI devices receive a contiguous vSID range derived from RID space.
+
+
+Supported Device Model
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Currently, the vIOMMU framework supports only devices described via the
+Device Tree (DT) model. This includes platform devices and basic PCI
+devices support instantiated through the vPCI DT node. ACPI-described
+devices are not supported.
+
+Guest assigned platform devices are mapped via `iommus` property:
+
+::
+
+    <&pIOMMU pSID> -> <&vIOMMU vSID>
+
+PCI devices use RID-based mapping via the root complex `iommu-map`:
+
+::
+
+    <RID-base &viommu vSID-base length>
+
+PCI Topology Assumptions and Constraints:
+
+- RID space must be contiguous
+- Pre-defined continuous pSID space (0-0x1000)
+- No runtime PCI reconfiguration
+- Single root complex assumed
+- Mapping is fixed at guest DT construction
+
+Constraints for PCI devices will be addressed as part of the future work o=
n
+this feature.
+
+Security Considerations
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Stage-1 translation provides isolation between guest devices by
+enforcing a per-device I/O address space, preventing unauthorized DMA.
+With the introduction of emulated IOMMU, additional protection
+mechanisms are required to minimize security risks.
+
+1. Observation:
+---------------
+Support for Stage-1 translation in SMMUv3 introduces new data structures=20
+(`s1_cfg` alongside `s2_cfg`)
+and logic to write both Stage-1 and Stage-2 entries in the Stream Table=20
+Entry (STE), including an `abort`
+field to handle partial configuration states.
+
+**Risk:**
+Without proper handling, a partially applied configuration
+might leave guest DMA mappings in an inconsistent state, potentially
+enabling unauthorized access or causing cross-domain interference.
+
+**Mitigation:** *(Handled by design)*
+This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to
+STE and manages the `abort` field - only considering
+configuration if fully attached. This ensures  incomplete or invalid
+device configurations are safely ignored by the hypervisor.
+
+2. Observation:
+---------------
+Guests can now invalidate Stage-1 caches; invalidation needs forwarding
+to SMMUv3 hardware to maintain coherence.
+
+**Risk:**
+Failing to propagate cache invalidation could allow stale mappings,
+enabling access to old mappings and possibly
+data leakage or misrouting between devices assigned to the same guest.
+
+**Mitigation:**
+The guest must issue appropriate invalidation commands whenever
+its stage-1 I/O mappings are modified to ensure that translation caches
+remain coherent.
+
+3. Observation:
+---------------
+Introducing optional per-guest enabled features (`viommu` argument in xl=20
+guest config) means some guests
+may opt-out.
+
+**Risk:**
+Guests without vIOMMU enabled (stage-2 only) could potentially dominate
+access to the physical command and event queues, since they bypass the
+emulation layer and processing is faster comparing to vIOMMU-enabled guest=
s.
+
+**Mitigation:**
+Audit the impact of emulation overhead effect on IOMMU processing fairness
+in a multi-guest environment.
+Consider enabling/disabling stage-1 on a system level, instead of per-doma=
in.
+
+4. Observation:
+---------------
+Guests have the ability to issue Stage-1 IOMMU commands like cache=20
+invalidation, stream table entries
+configuration, etc. An adversarial guest may issue a high volume of=20
+commands in rapid succession.
+
+**Risk:**
+Excessive commands requests can cause high hypervisor CPU consumption=20
+and disrupt scheduling,
+leading to degraded system responsiveness and potential=20
+denial-of-service scenarios.
+
+**Mitigation:**
+
+- Implement vIOMMU commands execution restart and continuation support:
+
+  - Introduce processing budget with only a limited amount of commands
+    handled per invocation.
+  - If additional commands remain pending after the budget is exhausted,
+    defer further processing and resume it asynchronously, e.g. via a
+    per-domain tasklet.
+
+- Batch multiple commands of same type to reduce emulation overhead:
+
+  - Inspect the command queue and group commands that can be processed
+    together (e.g. multiple successive invalidation requests or STE
+    updates for the same SID).
+  - Execute the entire batch in one go, reducing repeated accesses to
+    guest memory and emulation overhead per command.
+  - This reduces CPU time spent in the vIOMMU command processing loop.
+    The optimization is applicable only when consecutive commands of the
+    same type operate on the same SID/context.
+
+5. Observation:
+---------------
+Some guest commands issued towards vIOMMU are propagated to pIOMMU=20
+command queue (e.g. TLB invalidate).
+
+**Risk:**
+Excessive commands requests from abusive guest can cause flooding of=20
+physical IOMMU command queue,
+leading to degraded pIOMMU responsiveness on commands issued from other=20
+guests.
+
+**Mitigation:**
+
+- Batch commands that are propagated to the pIOMMU command queue and
+  implement batch execution pause/continuation.
+  Rely on the same mechanisms as in the previous observation
+  (command continuation and batching of pIOMMU-related commands of the sam=
e
+  type and context).
+- If possible, implement domain penalization by adding a per-domain budget
+  for vIOMMU/pIOMMU usage:
+
+  - Apply per-domain dynamic budgeting of allowed IOMMU commands to
+    execute per invocation, reducing the budget for guests with
+    excessive command requests over a longer period of time
+  - Combine with command continuation mechanism
+
+6. Observation:
+---------------
+The vIOMMU feature includes an event queue used to forward IOMMU events
+to the guest (e.g. translation faults, invalid Stream IDs, permission erro=
rs).
+A malicious guest may misconfigure its IOMMU state or intentionally trigge=
r
+faults at a high rate.
+
+**Risk:**
+Occurrence of IOMMU events with high frequency can cause Xen to flood the
+event queue and disrupt scheduling with
+high hypervisor CPU load for events handling.
+
+**Mitigation:**
+
+- Implement fail-safe state by disabling events forwarding when faults=20
+  are occurred with high frequency and
+  not processed by guest:
+
+  - Introduce a per-domain pending event counter.
+  - Stop forwarding events to the guest once the number of unprocessed
+    events reaches a predefined threshold.
+
+- Consider disabling the emulated event queue for untrusted guests.
+- Note that this risk is more general and may also apply to stage-2-only
+  guests. This section addresses mitigations in the emulated IOMMU layer
+  only. Mitigation of physical event queue flooding should also be conside=
red
+  in the target pIOMMU driver.
+
+Performance Impact
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+With iommu stage-1 and nested translation inclusion, performance=20
+overhead is introduced comparing to existing,
+stage-2 only usage in Xen. Once mappings are established, translations=20
+should not introduce significant overhead.
+Emulated paths may introduce moderate overhead, primarily affecting=20
+device initialization and event/command handling.
+Testing is performed on Renesas R-Car platform.
+Performance is mostly impacted by emulated vIOMMU operations, results=20
+shown in the following table.
+
++-------------------------------+---------------------------------+
+| vIOMMU Operation              | Execution time in guest         |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+| Reg read                      | median: 645ns, worst-case: 2us  |
++-------------------------------+---------------------------------+
+| Reg write                     | median: 630ns, worst-case: 1us  |
++-------------------------------+---------------------------------+
+| Invalidate TLB                | median: 2us, worst-case: 10us   |
++-------------------------------+---------------------------------+
+| Invalidate STE                | median: 5us worst_case: 100us   |
++-------------------------------+---------------------------------+
+
+With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
+and configure stage-1 mappings for the devices
+attached to it.
+Following table shows initialization stages which impact stage-1 enabled=20
+guest boot time and compares it with
+stage-1 disabled guest.
+
+NOTE: Device probe execution time varies depending on device complexity.
+A USB host controller was selected as the test device in this case.
+
++---------------------+-----------------------+------------------------+
+| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+| IOMMU Init          | ~10ms                 | /                      |
++---------------------+-----------------------+------------------------+
+| Dev Attach / Mapping| ~100ms                | ~90ms                  |
++---------------------+-----------------------+------------------------+
+
+For devices configured with dynamic DMA mappings, DMA allocate/map/unmap=20
+operations performance is
+also impacted on stage-1 enabled guests.
+Dynamic DMA mapping operation trigger emulated IOMMU functions like mmio=20
+write/read and TLB invalidations.
+
++---------------+---------------------------+--------------------------+
+| DMA Op        | Stage-1 Enabled Guest     | Stage-1 Disabled Guest   |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+| dma_alloc     | median: 20us, worst: 5ms  | median: 8us, worst: 60us |
++---------------+---------------------------+--------------------------+
+| dma_free      | median: 500us, worst: 10ms| median: 6us, worst: 30us |
++---------------+---------------------------+--------------------------+
+| dma_map       | median: 12us, worst: 60us | median: 3us, worst: 20us |
++---------------+---------------------------+--------------------------+
+| dma_unmap     | median: 400us, worst: 5ms | median: 5us, worst: 20us |
++---------------+---------------------------+--------------------------+
+
+Testing
+=3D=3D=3D=3D=3D=3D=3D
+
+- QEMU-based ARM system tests for Stage-1 translation.
+- Actual hardware validation to ensure compatibility with real SMMUv3=20
+implementations.
+- Unit/Functional tests validating correct translations (not implemented).
+
+Migration and Compatibility
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+This optional feature defaults to disabled (`viommu=3D""`) for backward=20
+compatibility.
+
+Future improvements
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+- Implement the proposed mitigations to address security risks that are=20
+  not covered by the current design
+  (events batching, commands execution continuation)
+- PCI support
+- Support for other IOMMU HW (Renesas, RISC-V, etc.)
+
+References
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+- Original feature implemented by Rahul Singh:
+ =20
+https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.=
rahul.singh@arm.com/=20
+
+- SMMUv3 architecture documentation
+- Existing vIOMMU code patterns (KVM, QEMU)
\ No newline at end of file
--=20
2.43.0

