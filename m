Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC4CL/Moy2n/EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C12B36330E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268276.1557675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHL-0004BF-FW; Tue, 31 Mar 2026 01:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268276.1557675; Tue, 31 Mar 2026 01:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHK-0003zT-CH; Tue, 31 Mar 2026 01:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1268276;
 Tue, 31 Mar 2026 01:52:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHG-0003Cq-1d
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHF-00HCrd-Ae
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c4-e002-0a2a0a5209dd-0a2a450a9b40-24
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:21 +0200
Received: from [52.101.69.85]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28d4-1772-0a2a450a0019-34654555cfcb-4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:21 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:17 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:17 +0000
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
 b=y9XVFj5IeyYpkeKxZqajSVYSmjKa16sAjq+hQIxaZvu+8iGknJRaXFxz1QCe8Nw61S4DHvNkgcORk+QNdHeJ9o4g4RwW/viPzIt1q5MSe2uLHNp9LXoUHaF5k/+Jf+rhsNsRoe61nYtVPl1tqnOWgduUeIOX6UZrCcVsNCoiAFeTK9LtDteyYbWI8X/eh7x+X+ezJGh8xE1Ginud42cVEPowvVxGYNsNhGTHoRLo7/30NijicniwFONjs6ru98jJS6/JstPx3xTgrI/gjfA/IOxhZIAdJ7uRxlDbm90biD6nVyDpxbw44GaBv+tiCzSyBr1PLNGujEOYdc89zGtlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lisQP+TLfEQnpO/kQ1D6SirUFzjk70NyNV3O+NFZVg=;
 b=tCPLOMlkfiRdwA0LpdN0+Vj4nyE3NSIn36+/K9g4Gink5kN5tyGcw73vD9KydkqubvfMJe0UVPVYpHJZasj4Af62Rv3V3JIjy4DAEZjXZOwVS4ddGR18Izzh4mtU36MODHb/sigWXfxYblFFeCjCMQwQn3bjZG8bMoBquI8ceu1lZCSqMlUsHiU5+szWqr5WDa0+4ny1CS24Ry2FUuZwIRHljakdd6Ky+u6HnwR82GxsYDtKweiJ0xAQNao25wWLAc+/arM72BUzQYkmToTZazcbU0Z2vpgUYLfGpVYlIRj5tjihF1lARt0AMrFmnsbQIy+EJSgmQXz5LL/43Y5fKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lisQP+TLfEQnpO/kQ1D6SirUFzjk70NyNV3O+NFZVg=;
 b=qXhxn11un5nxvO4SwPbeLSIGPNKzlxC4YUKZUOCp8qq3EJ6ncY9Bsj5F7l8QM21n17TCLbH0oq+cBQLfGHAxt/jmSEo226qFLLLTaf0RqTjxz98A3Qxzthe0A2yaggDofqzvaD6YtpjtKqzQ9iKnYV6UkJFb2/V4WaQHjACu/3x8C0YDveF4WA8Q49sNS4NVG9sxw17fBCgFq27OEA0J7C0tA7L1klz0jJ5QLAhKFPdxqiQzNdcNNAXIauiM0Au67ar3J0OPqQyuGOHqo6hTdqtljuqOjwkOTu1Mro1ApKHgGqYb5azLYUBfKbsrkCyyUd55ahqvpOKEYkQ9o2mW2w==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 18/23] xen/arm: vsmmuv3: Add support to send stage-1 event
 to guest
Thread-Topic: [PATCH v3 18/23] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
Thread-Index: AQHcwLEA0bNvFoMK9kCOcLN/fsy07w==
Date: Tue, 31 Mar 2026 01:52:17 +0000
Message-ID:
 <51e727a521f25c3eb83b374529c8632fb8b2f314.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 11912b27-d409-46d1-362f-08de8ec82365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 32FG1xp4wR3vht2/Zdd1VfsuE7h1wzn7zejv8RDgNo6Q3oUluRidqSfNbia9K+Nq3KHfVvkAfYvA3BU4qU3m6euhh0picfZv2X+Omm1V3Mp8Ng+BVLueIoemG9TwOVXhbpSUibgTEBOd17M1hr90vRRIm1sry/zMKTkqdx+bFUEDGh9/enrlde8ZUYc3tWrvv30xxj8yTihsG0F1w966lwx38eG7iX26ylUknoXocY2emD6CaeYu6+8pSunsIIRULmZQeK2QNK4FfpkjgFzA0guhLmYRHOGYkTpOa5LSQrKzuzU7qKXUT+LzJ8LyB+ErB+9ftQo0WukQKzS60DG6CYRF/vYKKlQSIBQrwg8ithxUmD+CDoHgSKcwNJ86R8H22npdz2eJ+0Xm4NsfyZO+xOQlciwMpikk5sdD5Awy+FHJ9bhe7aIP2bxB4twx2t3Cbl7sEG5mUxLw+qujzfuilpCwGWGXwvYn/VguD+sH05gl9vxa/7f1q/S3f0qVLdp4SlRuAMqG2vEE1JXgEZp2nITDQfuDGI3OLtX/IU/9drPtTsjbbSu/B4GqmittndjdFY2FUdK+0rg+3N7ZIPT/PHfFCfJX1CrClqIrCpZf31EKWsbn++XageX7gcbJtanUmCI19t7fAaV9z17AeIZM4YRo8dbH+L06XPnEvOd2m2eRcGvgY/av1uhx0QZfBfoUCS3/c8ho3Kg+UhnJL7HwlJ19ZPP5Ihj9lrXu7H4c+mkCwvvtDLLIUV7M5HtXNQuaOiOIi5pVmr9E/Hk0x8ShfThQgRW2h1w0m3E3WMqbpvQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?y0uITYCjOl8v71ZAFvfHzqmM426YA5IQ4CFsY3h7PUmKTfmHjgzKlW0tm8?=
 =?iso-8859-1?Q?3Xyvh1+k+pgUXOIAr249WAeE48kbiiuglfbGNYQCdBpDzHt1sf/W4Mw2Yw?=
 =?iso-8859-1?Q?bVGgwW5KClzjqw1Okp3CiwO9v0Eg0/E/0Bax1ToIzX7H9WtUwsfyTFlorQ?=
 =?iso-8859-1?Q?guk+tCj66kJKi8YOrChZtih2BNb7rMrWJEgFs7wQexA9CUw0KvpG4sUHJU?=
 =?iso-8859-1?Q?xWK9NK0s2cDM2Px4LnwYspvANQP5i/uTP7AHvk4/4cYgsl/gfHJ+bLbPfL?=
 =?iso-8859-1?Q?XQSQf+hrM1PqBxoHGJqid3v99cSVLSsSiF7P5+iapZbGV/UPHFXEseuMQM?=
 =?iso-8859-1?Q?JCMHaVPn9okxl2xGkBEpePJet1j7K24GC7an2QH8rcvd1vqYlwkSSNcZ6T?=
 =?iso-8859-1?Q?916KKV8p+zLX2Tn/OntfkVjQ0p+FkHtGP0blKljaT89c7C6Q4kwlvDRc4z?=
 =?iso-8859-1?Q?e751V7Cc/2vRLm0w5Abddce3DfPzfZSM964/iOgRYba/QpTAcmZFdsixQS?=
 =?iso-8859-1?Q?luRLmxKCjASF8s+ZgL8wYbddpBTr9OXC1CAnnyxsHuxSg2/IEX+12PLCy6?=
 =?iso-8859-1?Q?QmBMXK8WNG5EBN77Q2vjHWbGAtXXJPxjGP/toew403BAa4Z3zmoOQHxAAS?=
 =?iso-8859-1?Q?JpW02ynUBGnyxkaooou02fLEJ5i7UQXa49hY+wJXHCRtQ7V6a2+VuwwB7V?=
 =?iso-8859-1?Q?Ci5pcgHSOB9QzYEl2BZRp/ypp+lUDQXIwz/NJFaKOjxgj/KpATVaXbRn5W?=
 =?iso-8859-1?Q?7uEHyyIuDe4vFKzrp7cmpkqKrOFAuiaUGThufJqAGE5DPA6Ia8rmO941FB?=
 =?iso-8859-1?Q?Sqtvb2WpwCMBVB5XXNQheESk5D+DVTYzJk/G7tjSPXwVr4XwI5DttN2aXN?=
 =?iso-8859-1?Q?7KImKu57p8wO2utcB776vGYWoiqb6cGEw5zH/Svh8CLKyBYj4TNYhyl8Ba?=
 =?iso-8859-1?Q?GXeURbYr290jAFHhqq4813oh7oDxezCLw7oDLDWv8l5nLUmxrTP1fwQ/Sj?=
 =?iso-8859-1?Q?2el7bQW3O6HJUW1hLJ47Y93M6p9fv/puerI7pUiIgOLNmil1XfU2fi3QyS?=
 =?iso-8859-1?Q?zrsb0arqLGVEB0ucpRdcxhsvloFn3Icwas2dht5GIyWtZFBEqEnpAOZggI?=
 =?iso-8859-1?Q?omFKtCbs0DOIUcmE73C5X0D5HIIT3xKzZeGj7lNS4ft0zMUga9+v3vmuBh?=
 =?iso-8859-1?Q?W1IKKygFKlCpjqNk9STtelBxMzWauTtJHRWYZglbbomKgqVWxOc7v3XWES?=
 =?iso-8859-1?Q?b+TEMkntPKA5dPbAYM1eIS8W5ATE7A51zzbfJoK6d4N1/SaALUx6qFZ8Oq?=
 =?iso-8859-1?Q?VToTW2FwigZ3zBWGi0Pbmf3qG+Aig1m7JVyuUjzzf9bAwbxq3MSMYV5Id0?=
 =?iso-8859-1?Q?asORaVA4D5Janolx4mZpq4+yFVDT90/kFJVUdeaPllFbG6KeQrv0ryZzAR?=
 =?iso-8859-1?Q?JxK+0JBjii2Qx81Vl+zdOIrvukSXpBCtMJNTYlLbK+ljJhGnkvFixgKD4i?=
 =?iso-8859-1?Q?2L18zgRNh2X7MJp9VftsBYMlvW9R1WlicrjWLbxLm9QnmoHce6zjNQ3pqK?=
 =?iso-8859-1?Q?uTsgI6O12cWbylhlEEKM3JwOuAeNFVcMNnS/3fc/PNo7TcWTgyLfXebyNw?=
 =?iso-8859-1?Q?jS8ipwjTtnPC/+gZytnu/vFdFRZp7RPkA4N4ghkDXkrjyQFaox9FhDx1pM?=
 =?iso-8859-1?Q?1rF0Wsm/hjIXkQ2qkcwoKn7wQ7x96lCkwI1LgSs9iVtaN3AkPUpGk4CHca?=
 =?iso-8859-1?Q?R0vQPCFE3WHg5U5bWKrbxcGuHq4VRyw2dbKGFgA2HQOyChtP3TRteuUCif?=
 =?iso-8859-1?Q?gQ2k+FU2dogK1DHTktPNjC+NN0REXME=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11912b27-d409-46d1-362f-08de8ec82365
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:17.1468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BnLu16az8+QHAcaHNv40c072Pq5BvSRmtqABWR83taOUnYGCAqH8915erjPTqhHBDbS+ecpMSatSFZ/uAytGWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-4011c0/1774921941-53E9D900-67EF7A69/0/0
X-purgate-type: clean
X-purgate-size: 5552
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 4C12B36330E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Stage-1 translation is handled by guest, therefore stage-1 fault has to
be forwarded to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c  | 48 ++++++++++++++++++++++++--
 xen/drivers/passthrough/arm/vsmmu-v3.c | 45 ++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.h | 12 +++++++
 3 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index cf8f638a49..4c1951d753 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -869,7 +869,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_devi=
ce *smmu, u32 sid)
 	return 0;
 }
=20
-__maybe_unused
 static struct arm_smmu_master *
 arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 {
@@ -890,10 +889,51 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u3=
2 sid)
 	return NULL;
 }
=20
+static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
+{
+	int ret;
+	struct arm_smmu_master *master;
+	u32 sid =3D FIELD_GET(EVTQ_0_SID, evt[0]);
+
+	switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
+	case EVT_ID_TRANSLATION_FAULT:
+		break;
+	case EVT_ID_ADDR_SIZE_FAULT:
+		break;
+	case EVT_ID_ACCESS_FAULT:
+		break;
+	case EVT_ID_PERMISSION_FAULT:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Stage-2 event */
+	if (evt[1] & EVTQ_1_S2)
+		return -EFAULT;
+
+	mutex_lock(&smmu->streams_mutex);
+	master =3D arm_smmu_find_master(smmu, sid);
+	if (!master) {
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+	ret =3D arm_vsmmu_handle_evt(master->domain->d, smmu->dev, evt);
+	if (ret) {
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&smmu->streams_mutex);
+	return ret;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
-	int i;
+	int i, ret;
 	struct arm_smmu_device *smmu =3D dev;
 	struct arm_smmu_queue *q =3D &smmu->evtq.q;
 	struct arm_smmu_ll_queue *llq =3D &q->llq;
@@ -903,6 +943,10 @@ static void arm_smmu_evtq_tasklet(void *dev)
 		while (!queue_remove_raw(q, evt)) {
 			u8 id =3D FIELD_GET(EVTQ_0_ID, evt[0]);
=20
+			ret =3D arm_smmu_handle_evt(smmu, evt);
+			if (!ret)
+				continue;
+
 			dev_info(smmu->dev, "event 0x%02x received:\n", id);
 			for (i =3D 0; i < ARRAY_SIZE(evt); ++i)
 				dev_info(smmu->dev, "\t0x%016llx\n",
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index a5b9700369..5d0dabd2b2 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -103,6 +103,7 @@ struct arm_vsmmu_queue {
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    paddr_t     addr;
     uint8_t     sid_split;
     uint32_t    features;
     uint32_t    cr[3];
@@ -237,6 +238,49 @@ void arm_vsmmu_send_event(struct virt_smmu *smmu,
     return;
 }
=20
+static struct virt_smmu *vsmmuv3_find_by_addr(struct domain *d, paddr_t pa=
ddr)
+{
+    struct virt_smmu *smmu;
+
+    list_for_each_entry( smmu, &d->arch.viommu_list, viommu_list )
+    {
+        if ( smmu->addr =3D=3D paddr )
+            return smmu;
+    }
+
+    return NULL;
+}
+
+int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *e=
vt)
+{
+    int ret;
+    struct virt_smmu *smmu;
+
+    if ( is_hardware_domain(d) )
+    {
+        paddr_t paddr;
+        /* Base address */
+        ret =3D dt_device_get_address(dev_to_dt(dev), 0, &paddr, NULL);
+        if ( ret )
+            return -EINVAL;
+
+        smmu =3D vsmmuv3_find_by_addr(d, paddr);
+        if ( !smmu )
+            return -ENODEV;
+    }
+    else
+    {
+        smmu =3D list_entry(d->arch.viommu_list.next,
+                          struct virt_smmu, viommu_list);
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return 0;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -742,6 +786,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr,
=20
     smmu->d =3D d;
     smmu->virq =3D virq;
+    smmu->addr =3D addr;
     smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.h
index e11f85b431..c7bfd3fb59 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.h
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
@@ -8,6 +8,12 @@
=20
 void vsmmuv3_set_type(void);
=20
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #else
=20
 static inline void vsmmuv3_set_type(void)
@@ -15,6 +21,12 @@ static inline void vsmmuv3_set_type(void)
     return;
 }
=20
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
=20
 #endif /* __ARCH_ARM_VSMMU_V3_H__ */
--=20
2.43.0

