Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBO/KBLEwWlTWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48C2FE95A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259682.1553144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7l-0005Iv-Do; Mon, 23 Mar 2026 22:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259682.1553144; Mon, 23 Mar 2026 22:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7k-00050n-NP; Mon, 23 Mar 2026 22:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1259682;
 Mon, 23 Mar 2026 22:51:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7a-0003Ca-W8
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7a-004fuD-AZ
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:42 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3f6-bab6-0a2a0a5309dd-0a2a450c8c80-14
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:42 +0100
Received: from [52.101.72.86]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3fe-f93d-0a2a450c0019-34654856a993-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:42 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:40 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:40 +0000
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
 b=G+/xDdecTU4La3kAS+vG70tdGKrMz/9sbC/xJG/dCW7AFKW/1hG9Amb6nuaxF8w9DD+ohqSNMfMerKJuA+TClW44pphsZVp4OPHKO/dZH9I8VxZ9gWg6QqfnsEa2uJXQF7FRSIHTQRm2tkyKrnXVBZvyJEqcSMOP0X8PQW6q89sO1a4vRQZVHdlDZ5rUPj2y3b8n//0fUY/euBxTQhkb+6++Nf9S+vNkx5mtj5ZieVJdAkw4f0kdQbHBZyMOPuIo7wcneEaPh2JkOY9ixWXpXeL2YBXlMZZAYFdD8ZFDFKIAVo+9z1z6GkpHps9anayeIhRS6pKMsgwCg4TMVxW+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5LU7iG+kNVwY/pJJXqeYx+mIUucgqu7L1cZI7G6HOQ=;
 b=PIDush4P0W42I9T31EgcBj3ftJVQMfefsce/VJ/jmlrBrw6QxsEfeZ+KhlfYVWaf8S+dOTwur7J+jDItlJERXKmVvYazD61hD8gxP8MfJIbIbsb+YNnHMkiX6kMm45Xt2k5lagUmfsbzy0wjWYGKGDtEi71rz3dqcqMC73qMDTqAno1dgKmUSFDx9+TVPc1B0zfllO2a+c0jPj6pfo3uneVYQou0zRIBVRA56e5WXkILLy3B3vF+cip1rnKhRvkwZfByk4TKzvJycKEJXwclDasdb3dQhQfr11De5QhJ73y6oqYyWUHFEPvJ70Qr+An6ahOD37Sxi7N2bBRQzHLRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5LU7iG+kNVwY/pJJXqeYx+mIUucgqu7L1cZI7G6HOQ=;
 b=tZMBebjTClt6CVddTGcfHD/LmlQ6vVYhoiivlU39aWNkFNErK7Ix1fhjco9Y9j0/nlExPIpA9OBMksjtpVgTRRHSsGAoxcu9Q76m/8sjjmaHY4U7DcG82PoTTi7L2bEyQ5TGixKairmP5Y/LWQk0JX31nOcKzoIKukSRgrNvSkVBjfdZH1Am19m1hxBOCDqO0/L2Jt/56LzMSqgxREFL5jkPyRwF3P5glGCA5LxBv/EG+VVud1aC63juyszybU0vHuogW+DWI6D9tSYsQzV3dO3BeY/rTdLB33+rOHr8V0nnXN47nvpAn8spiYs1zKD8UlXL080d2lIcZg6DNrYN+A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v2 20/23] xen/arm: vIOMMU: Modify the partial device tree for
 dom0less
Thread-Topic: [PATCH v2 20/23] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Thread-Index: AQHcuxec5MNcut7RDUyyvj+xtxMWaA==
Date: Mon, 23 Mar 2026 22:51:39 +0000
Message-ID:
 <4089ffb6b1679bea0b1c3c0d7ef0e88461e67645.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 65783eb8-7652-481e-a803-08de892ebf0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 f9nhS01O7joLhJuwcf3kMC9XWFfdoLSChM/ejz2HcLICsto6J/uVlAlpJnrxNiA1yRRXmxF0IXEvCHisG7jm62gte/mk/4fO3bPPlFASE7AcFlNj/6mWAMZIFz7iwF2rDFVq0gYBNnfOq42fgoLITV7+ofl6scOlwIEJKXc9TmZ1ehaGMc8cBwH/fV/cPRGcXfCaNT0ellrUQxvJJPUhutcLzGrfWf1llYN6UMI0rbk44hxfTGs6ygcPSswJpTxB4FblWBvf4/4csFlMBPYR7XvnHJwYE7z6hFMHRm36CfN9ojifzmMHpwV0O/IK+l2aM6Q5VW9ZQ3lk3X9XtXgmSl4fiKJZmRzhz8i8USX7fPN/bWBf0sE0y0LoBNTo19oIlrNu997nk3zGGipWB1x6/6nu8SQz59JeuDdus7aSTvIWNVedCr1DdZ1guJYht9vv/sSwsaNb/Z5ZGydPveiEHdT3/oP/XkeO3lKWRs6oz0TDsaJdq9b6+WfHER9X8EjjcamoTbMQ3JUjVJNu/VSOXcu7mBwXXm+Hdtj8aYyLOjAPMpWXTzRUYYBEURW43Bx6wPNH5XmzdvdMFDnQLw59MYIGoqJhgYYkP4SdETUhUwIeEYFIUvvcGNQxEBm3M/xJ5OIshrGdj6TZQbnjI06YHbIB7htnV755YXJWPuJBOKVEuVoxQKWrCpieIqfjoce9VhmIkEEfFb6e+jmirNCjlZbd2p0ZsGTtsAQkpzLs6XkSwP0NKOfgJlbFm6EJ2X3UzG8G6VtFzRuUBMtFqegyfdOK6omQeHJueFyhBaUIVFI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kKvNy16csB5N9lKzJyofkh8ldb2jop59uvHPb7sCm5j/u2f/X45BwQIoFj?=
 =?iso-8859-1?Q?ZPoHGVS5e1Hnh75xV5vl2A8F9kiw+w6jYT/FhBKJ9bS6IPrc/TguttEX96?=
 =?iso-8859-1?Q?KCNyN5xKM1yVg1mKigFRZ66NxzwowTH7nMHTQ43Zx062+vXYMPYkDm8rSI?=
 =?iso-8859-1?Q?K4ocTuM80nadkujEe8oMlbhjyrUreosp6vn/rJTgtl/1UDoJRVhWUKsvof?=
 =?iso-8859-1?Q?jmhNFghkplBCQ6+KNjSjCqwAp/TjiEJkE3blJkb3i2SrFSUnVptZIuCCid?=
 =?iso-8859-1?Q?wOrgnIyt2J1+TCG0y9+0hbj3l9YtDANVj96/F11DQFodwfAvoql7nhbmhO?=
 =?iso-8859-1?Q?ujBnw0oIXE+Injc3MivxJzc9cWkDsUSuK/obL1kIRpxEMs6fwepf4m+yBm?=
 =?iso-8859-1?Q?YydaKFYEjwyGmrMjFundwoEWMyTB1AT11L476GSMKP2KHDLuUmh+7T/a4I?=
 =?iso-8859-1?Q?92j48JlTimDDW7Xr43aht0L1q01PrREqmKXwvLgpr4Fho6ab9BIaFTmuus?=
 =?iso-8859-1?Q?Sxoc4l78Pb2tLQzZ8JcQlMDyEjmfIpwdNhe9T6+YTUarku+PdOErypccdt?=
 =?iso-8859-1?Q?CXNRxK8HCxGT5hy6BX5utXoCSsXKo08RMSas/9n4tC3GCwvKV8nBMMD3R0?=
 =?iso-8859-1?Q?ebAY3Z8WQQO/504whXMujLptomI2RGdSoL3CjNKj3/Qw9jOUtjF+XnR4DL?=
 =?iso-8859-1?Q?oFHj+Esh1Hxz+G/Lb6SMSX3YiSMQ4vzd06J01E5D+VFiy5J+pz6XjVDnMj?=
 =?iso-8859-1?Q?aRHq9us7QwEYpCS8TrGrOEVTkAup8ss0FSu6HbZeBZSgj0ScgpvI6GIp3A?=
 =?iso-8859-1?Q?9+E6CgUhkKmWG2N2CqmlpLBykFll/Xr45PlEAsn2EBLi89xzaA4g0hmLaU?=
 =?iso-8859-1?Q?yosOCPavy4CZesILfRmFqAcRRNyx50lb3GEaqvSEVDl1PaN8h06VYBtMrl?=
 =?iso-8859-1?Q?Fwn2OZweadnwQZ41Yn5YDZejFoes+4BhyF9ecVAoSpcmOrkCIFYSqOWxGy?=
 =?iso-8859-1?Q?HgF4KMaiJw0ujsIGKACAJWmZuQlBUAkxHAWJjyjJNvf3e67EseMJln/P0Z?=
 =?iso-8859-1?Q?ebW9F5uWVRVJtVsC/CrcZzyeohvmE3ELnVP2oazR3WUjA2GIB6ux/b035q?=
 =?iso-8859-1?Q?oMhFZ3tOf6iy4kwTApKZY09vmLrTZdqCtl4Lqn0a1GRaDsNJ7H+ozHVQPA?=
 =?iso-8859-1?Q?EzWnRwxcUZXzOhHlOGUJwPb4/no9CBLxUTrq67vlngVVUiV3bsD4dXeNrk?=
 =?iso-8859-1?Q?Q/f7ihZ1qnVBHt8yiDsIXDeZVXat++mikFDFDG79EFY4pWoad7XNA9Fdai?=
 =?iso-8859-1?Q?FQsrmU/F8L++hC7FSX2B00bcTk/iVoJG57SbGRhZbfEhiDaf56GwAQMi71?=
 =?iso-8859-1?Q?1opoV0Npr/oyNEFlmjSUJAu/+SabFQGCUhE2ylr9Guvw4LRNxX6OWG1utn?=
 =?iso-8859-1?Q?h7x8aez7AscAFNp0ls6hgiGOI2fj43dPuTLxfOZXRYCA4nBWUGNTy4lDFH?=
 =?iso-8859-1?Q?a1mXLzKfJXvL8m3yWUysRvHHVCcinUWHUiCagzW/GHCWGQIyPT9pv13ays?=
 =?iso-8859-1?Q?ETtCbtYD5HEiMGkQO1vd3ToF2x9ZA98XVosX+0IqqESUJoTYeI316H48wq?=
 =?iso-8859-1?Q?x5TQ2d0QDZrNJSxb57RjjC22SNELo9Ga//Xzdt7nTZO8huTHYfg1OSFVdj?=
 =?iso-8859-1?Q?HpWczeg56Mp7ZXS3dD9FMroUwvV4fmc7x7OVMce6JLXkE8XxZKhcAQXabC?=
 =?iso-8859-1?Q?tuih7ZWg1bKRGg9DOl4b1K32H6EY5yGDYhZbMkI8HmBNbRh91xqRdKBHPi?=
 =?iso-8859-1?Q?/f1YR/WWGVGvA63E4Y8w5Ze7YU8az+Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65783eb8-7652-481e-a803-08de892ebf0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:39.9512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYXSHPxQC87fCVgnMcaeNbw9Km1w6X/qTVQLCmjd14KnFU61DuWqAb042VPZuDlhy90ON3u/JEIXoh4rwD74mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-purgate-ID: tlsNG-d25034/1774306302-F5CB2734-8FFDABB4/0/0
X-purgate-type: clean
X-purgate-size: 2444
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 5D48C2FE95A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to confiure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/common/device-tree/dom0less-build.c | 31 ++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 840d14419d..4b74d2f705 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -318,7 +318,35 @@ static int __init handle_prop_pfdt(struct kernel_info =
*kinfo,
     return ( propoff !=3D -FDT_ERR_NOTFOUND ) ? propoff : 0;
 }
=20
-static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pf=
dt,
+static void modify_pfdt_node(void *pfdt, int nodeoff)
+{
+    int proplen, i, rc;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+    if ( !prop )
+        return;
+
+    prop_c =3D xzalloc_bytes(proplen);
+
+    for ( i =3D 0; i < proplen / 8; ++i )
+    {
+        prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+    }
+
+    rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT"=
);
+        return;
+    }
+
+    return;
+}
+
+static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cel=
ls,
                                  bool scan_passthrough_prop)
@@ -344,6 +372,7 @@ static int __init scan_pfdt_node(struct kernel_info *ki=
nfo, const void *pfdt,
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
+        modify_pfdt_node(pfdt, node_next);
         rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_=
cells,
                             scan_passthrough_prop);
         if ( rc )
--=20
2.43.0

