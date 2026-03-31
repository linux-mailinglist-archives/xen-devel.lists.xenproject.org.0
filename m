Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBLNIvIoy2n8EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C63632FB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268286.1557697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHQ-0005HY-OM; Tue, 31 Mar 2026 01:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268286.1557697; Tue, 31 Mar 2026 01:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHP-00052P-GM; Tue, 31 Mar 2026 01:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1268286;
 Tue, 31 Mar 2026 01:52:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHH-0003YT-NE
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHH-00HCrd-1P
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c4-e002-0a2a0a5209dd-0a2a450a9b40-34
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:23 +0200
Received: from [52.101.69.85]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28d6-1772-0a2a450a0019-34654555e707-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:22 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:20 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:20 +0000
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
 b=BIFWHB3ZCevP2vCJ7Zx/l13S6DekrmIv/gZ4tatIlXPTFcJ/Le1fvBOr+LUNIhrpEM9MQ70MykbW3OxBT9QYt67rvDB+Nb5XVxhAuGvYv9Q7iTE44Ze+5KiNGy+3l3YYnT5LKd5UThz0CCZ4//3/qHH80GlBsauYYxC6keSBP9kJl7Pf2VN6zhywN/uhd/K8NvdZnZsaffV2RGNKRxvNcVM0kB1twvYHIS0gGe99VlX0UF/1J900LcFD2axLnqTdrp3vAWyuYoCpVIFp9R+di3eeKakdI80ISGoeybpe1H+Efl4SFFer460si+ulhbiqSs4fOJaEetBRqkpnLtdlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qhI/HJzVHJyUR0jXe4Qr4tERuQMzXlXKtvxCd/jHZQ=;
 b=vnVUQhwf1MQgC4m1UPQuQFFIkOkIDsDQwlBI0OF1CXiw3Rh9dk82PTmIaDcz64z2AxUiKi0eC8kZy3SriiWwpoiVSHV43H7TzCLFwOF1My9G3CiMiOmz9yz0ebftPLyVUhb5ncWGNaKcEy69YkF7gL5nFZbNCq/Va7h9UY/mqm5i237qfKUSgcwOQjyp2BpToM8KFkfLQbo58e8jF+65p5EPdYVZB1WHKQgVj0TSA20l2q+l4MCNPYRJDPD3lxbgJpM6DDTdtmCNpbDpXb3HxCdt/jJopi2qgMme/o0U9pAwDV2+5/nf6GMQ3JWAKRG0MjChGhlbzoriofhSyFdfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qhI/HJzVHJyUR0jXe4Qr4tERuQMzXlXKtvxCd/jHZQ=;
 b=ECWPSJBgeDJqNWdLI6jl3EVteFk+UMTd7mWFtOjF07sg7NbPt1yu2LnkUbSHVbksmLbjYhEVn6bVi2RVn5RyMp6qXkhYj/nxjDbOTvvvEjYL5ObnuMMUlLImhNnpnWCZ9nnUU47/WhP/hnHGHzw+aYcFDWqa1Zwvxg2Ym5lHPlCtdt/wpCB8zCfk/mBXngy0ybNSVRoqa+G2H6XgebdDuvYN+zw6Ki5Itci0RTP1QB1sr6ypGdkNJtlFUtIjkYZi11NqOwYkPSy818twLFVv1jfRr5KbfXwkhQLIkmHiDVAceC4u/MQfN3WeEmUAYzwHIWbPYCYshoUfpZyjXX8okA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 21/23] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Topic: [PATCH v3 21/23] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Index: AQHcwLEDSSFL4iGYcUG/ncRvg0wnFA==
Date: Tue, 31 Mar 2026 01:52:20 +0000
Message-ID:
 <2105eb0cf298e1e8b1ec826516cb094d5f8ee2eb.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: d8f481fb-2df4-401c-8da6-08de8ec82588
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 7kWAsnzZvcam/KNUcu8rpix+U2QRPtNQ19poQOkFJkCf/qx/HuAGlFOQvNkKN4z8K7N9fcY1GngIGSrHmU+4VqAVn/MqPsJ0lT7VEua+S0excPTyqmT2Mj5UmpSGQOWYQn7R4nizZpVc9chyLLXAeMbx5T+PxmJJ8BBs6RdMXYdtHKjUq16+hIH8YsUtEuuZAfL+TD/ZeqL9PUnBfFbwCJlgdJ76mHHGOV4VocJxM8aG5Y/sSPZQ/2aG1BQB+9p9qQCBCTRfjSkVmGLEABlnXExXp3oJOJwHAYc9TUvYTdm7Xh58eyT2PnakDGdmOjLQUOFeS6mYsvz4gcJINEECxl28LjgRjh9oqtYebHdEP/vicYYUDS11s2q9BUpREtOWBShUBnlvbLZZm28Mnos9CFk1SV/Ax4yss/S4Op6Hdm9KZDAsk4SghKA6/2QLHecI44YkwplIwfvXWrtLVBH6ZFzyfm1YAcXmCF11r8LamyL8rs4FFlSbzOARGa9anVMin+L57ZP4h6df6wR5CJKa7ZafPgnv9ZSSblPTjeUn4rgBh9rIAC0bGjwXLd4XmbfrcNySOah0FU//C9dXw1j0swlr7cvlxWPYjf1GFyu9r1lHg2o+tD1TBVup9IpmuiguHN7GlLfxW9PKD9hs6wctkD+Zp7mRBxNLIsHLuF5C87O1ici8av6omeS58qpS8wJ7DoOdW24QHeNCnX1pAkEo1hLq0kRptwDn4j8SaMO6LvLPG/+Jx6ZkKdgfhYFxI7He+HZRAfuDRsZuWCdhgItMi4pM5M0Xjyo+g3rn6HO82pE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?X/JlmMOYEp4M6w1tGrklz4A30J+KnWNWjWgozVZXWa/IqH1Q9m50asAQnj?=
 =?iso-8859-1?Q?zrigosSjMRh1LsmnqC5lWWG6LfXnGhv8FqK/T6Cf/gCKBCMdY48KPlSi8I?=
 =?iso-8859-1?Q?PyE7EkRfThEu5thtShHpYmpyimaXkUCCWghHKKIHWx9QhEm+hEkO3UxVZs?=
 =?iso-8859-1?Q?ibCHIbRC8ZScg6/hhmpHwQzbcuRRW74pCodX+6HZ+tVfOIIYR10g2+YDkG?=
 =?iso-8859-1?Q?5n/R0wZdpCpcb+aI1n3pyyX/vWmN9r2Zlv6tWUu98VVZicxviwUxo+x5Zj?=
 =?iso-8859-1?Q?MToNF8S0Ys6bO6yn+RdNXkzfqWCuT3fE5VzSIRjFsj2lBalXSb6s1ERd+S?=
 =?iso-8859-1?Q?A1x8xH3x/fo1bmVBLD5+GYJ20cpwfuCsKR7MCTRv6UTWzY3NZGVXf+AX0K?=
 =?iso-8859-1?Q?DUJF48d9nwQbEFF2JfW4BPhBgeZodvrmhwoq7bq+HpZItOhFdPcHJ08lFp?=
 =?iso-8859-1?Q?A14H4reLg7mUHOHkZS3RjCuw5cJgIxdl8REPFnBAQ6FeWQXMASDqSulxeV?=
 =?iso-8859-1?Q?VG1lmi0tO0/xvCDMR+3Ux5gfqh/jfVdNp0hWkHYfTK5OzFmCldp9rA4qr6?=
 =?iso-8859-1?Q?eaWD9rQ/JuS8Gv4hHxIRuLgmjtEP6Cg1FrNWoB1FfNaOf2pvGvW0AuoVUH?=
 =?iso-8859-1?Q?QvVruE/fgnlFpBAnqMv6t6NALVZWpfHmpEzOenswD+CMqBeCsYQjPQ7EpA?=
 =?iso-8859-1?Q?lA1Z1n7RK2C4vSJzCjewRMqA8umhTVmklSFA1k/Dctxq6lkSXj7qLwtXZ+?=
 =?iso-8859-1?Q?Q8Ipi4BD6Yr+VAQYlNmzNxYqFaBe8po/ddYLU9ixY7PlADN70ocgbLP/Wg?=
 =?iso-8859-1?Q?zX22Ezf1hbAzScR87thQnekASfYWHJGEwfL+4TBj+MkpTf/AVP4IHStoVJ?=
 =?iso-8859-1?Q?Wj6Gxtqr6yLShcj6Q5aJW61z0Z6PhJAJpsdR5iAcAwyNgSZpvibOa4OcpX?=
 =?iso-8859-1?Q?9/CDGesaNJqAyVge0/ukx9WeeUQdIk0+D1Phzzv4vwGcLpbutmsQwocBtU?=
 =?iso-8859-1?Q?YXy8PrGQIuCJLuWPVTVMeqd7Xd/ccVFkJ7w/IsxApsfxJLrJgZRQr2CYre?=
 =?iso-8859-1?Q?C1GEUL9gI8PBrQufAhKymnEhujJt8nBp9tq7w6YQNt36TjYYw9GcloM6Th?=
 =?iso-8859-1?Q?EpcWOlpHeosOmzdC4xv4Tpp6vBgCb2UE4CYN+FUyTBt5EOdB0i5XVfAHdL?=
 =?iso-8859-1?Q?uqDkTIh1Z6yN7eFFjfxqXXh9TmBMZtCpUGzdP79Zlo9GA1ssAb5sNKleul?=
 =?iso-8859-1?Q?+gDg3k5wajBZXIjCmKP7gFm4iYnyPO1EPCweYqX67AdwpW7eCWARQak65T?=
 =?iso-8859-1?Q?tMwgPjhYXdRxxo+JoD4/L0UcUTBzM8JiX9IkWXhnP6lUH7JrnwjjWbtNhs?=
 =?iso-8859-1?Q?Bk3Wt5nyk4LTRj+GlDQCa7NX0jLA8PsbRH9h1rTkqpYjf+4spCx4ytByyq?=
 =?iso-8859-1?Q?sl2i+iuvWWY+kZAj7QNkWnO8mhyD1Lh9WUb1lY1vj9ADVYHpMtIkaE84ns?=
 =?iso-8859-1?Q?239l8dIhQapfKCu5yxxA6FK+y27q/d3A57s9JjQjdV3woTb2HEVWgatLM1?=
 =?iso-8859-1?Q?LVe9M0a+dW0X0OEI6uP1SbW67hO7rIYdpxqXRZIXxSNRDaeraCS/g2xeG9?=
 =?iso-8859-1?Q?kAR2LnqGB9VOw/+cPqiA4jBxez8rnaTrn4zA/IRfo00NAxbyK4YXcD52gT?=
 =?iso-8859-1?Q?FuovKDIqmjLYLNKnUFY7yJeRB4ZU8apKxKbv500OCPXnaiY6la6eEUAsYd?=
 =?iso-8859-1?Q?yaZvN44aUSll1YgDAaT6b7Sn0UfkVSi48NZl+NJrdVRyerLWrGrrLCfi4k?=
 =?iso-8859-1?Q?X7+AAIxrv7w1n5W9i0MIYaFpb98rGxg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f481fb-2df4-401c-8da6-08de8ec82588
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:20.7411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1Bn5NeV/9HVgbC5gdWT05RFPxC4b0FaSROZQ3QHsXCpy0PPdoY/p5l5mTkgVB/WoS+a1Xr0KS5giwehoeOopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-4011c0/1774921943-BFA9B900-A65C1F7E/0/0
X-purgate-type: clean
X-purgate-size: 11158
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 227C63632FB
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
index 01d4d0dfef..6a2fc56e38 100644
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
index 4b74d2f705..f5afdf381c 100644
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
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
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

