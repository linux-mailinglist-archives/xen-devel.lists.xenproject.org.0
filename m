Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPkgBRXEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635B2FE961
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259702.1553170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7p-0006S2-Mn; Mon, 23 Mar 2026 22:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259702.1553170; Mon, 23 Mar 2026 22:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7o-00068K-UF; Mon, 23 Mar 2026 22:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1259702;
 Mon, 23 Mar 2026 22:51:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7g-0004HV-6b
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7f-0000yw-HR
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:47 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3f6-5cb7-0a2a0a5109dd-0a2a4507ed86-12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:47 +0100
Received: from [52.101.66.73]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c403-fd74-0a2a45070019-346542491a4b-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:47 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:45 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:45 +0000
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
 b=dv/OdZsDOHRKEwphdq+LnJhqaJXwp3BELETrdPgQi+bK1vWTziLdjkzR/370D7dMwVTp9YnYhp0blJKyhjkXIoeDOZNUwqS8HU2ZF/VTdBqcR5FnlFR0q9eoSkyHmSsRUe7+akOFLsYE+KdGEWyHjG8XlY6PKduqI6SISVaK2i+KfAC8be+Dk+YEZlIfvjXAO5FJqkvIFD0CgxfE6fPA+i5WZwX26FiTjDotFSIMqPd1WmOks6HueQDG9HUzOVcVyuSfjhjXV3NNQJYYd3blrnjuDXRPTyYXnB7N+OoSgvOTSHMiJZA9PmnAN3itFdcltUwe4FST7imnX2Hzke4vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU495AuzUzpRveBfZL0AfrVfHDlzI5EUc4PMo712Ifw=;
 b=afU7bX5t99Mo2VwfVYdcFyBthMW8bfmOCMKf1BGwxXANDc+VIro/CtNYUOb53XHz/oRQBIDTqe/4O+6UjcmWH3ckdFCbDZPKUjjuVvAZLMmYuMhR+05uu/Jt8fjozujsn/xH545bKKPMF4Nm20CxIf2sJIVx01+LE1w3Q4gQyZ/y91NYTR2qNTwhKvUWOKYNej74Zo2SxQbBR+H5rg9uryxW8aLibm2PKCxsYT/v6qBrQLQcoK+9/jGBAi1ICIxTzfsxOlZSbKA6YJv99QYMfizvxKyznX/rTa72KirGYEoMaBHBavaLgCKXS26XigrewCO8al4CbT9ue/eXrCfuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU495AuzUzpRveBfZL0AfrVfHDlzI5EUc4PMo712Ifw=;
 b=nX5tn18stuTpjT1YuTHatFy58Ewzb1LfwzvnFLu8kyI/vpM1vJuxymubZm7+GXdNUz5Xp/pZFmBbEnwKw+7H3M5I9zb7QnGXYRoe5dWeoJQmdpgMSHJL3JfR7wgLuwlj+nh7rBLPX8FANX2yPbAtNNA4q0lVpauM6SwKpA5nB4JwOzi5c/2A14Ao+xX3trzrHq9BmG26nkq7GtvfCOF1K3/LLlS2WNasf/V2KLPOWdfzBsstJom58UtDXqyQkrluUROkkGyR2FRfuzEKUoAayLFsqkFMN3uW39+Ve81uCA0Kiq7xjfUGEQdMCJocC5bz5XwVXcjKxZvha1vMSzRLbQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 23/23] doc/arm: vIOMMU design document
Thread-Topic: [PATCH v2 23/23] doc/arm: vIOMMU design document
Thread-Index: AQHcuxefTxSXDTaOykmtNDe4oPsoZQ==
Date: Mon, 23 Mar 2026 22:51:45 +0000
Message-ID:
 <49d070a544492530d8c861fec03c90ea136c989e.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: a77d32f9-3c05-4f86-80a8-08de892ec237
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003|3122999024;
x-microsoft-antispam-message-info:
 WetPzcdkMqEPenCigwBrTjXI0J/qqOgoNQwezZ3TTCh7iNt++1Z9oCsKm6X0KmokIImydaeBqloEkZNOrb0Yr7LI7WC/NHTlgIHPXxRZZeBnfUW0yGWDslLEwaLYI6t6BzaSVADppb/VPK3mkRWsYv8/d2YiNijk1AUE9rByrwNDkIgEgOl6QTeJsSDHaQRoZ+VvhN9AJEX7HbXx0KQvCLg5XbvJROjlBcLfP2ztxb4nYhLZEhs1wRXynkSxJjeld92imj9IiAOyVrb7RwXx9HqQyCfuCdv6aTL7rWGhQqZW3BjSGYTr84tBPNEzynZpV/oP1ru5leM8gnxZKI1f+udTkISKX93J92IkTGGUQFLaO0c2otH4Rtg0ps/2vA+sbyQwoCZzKUgzVs6pLKPCTQvmtyObRANTpiHYZMLL4yC9khqnP0u59lkrQnCjJ3d+1zwQFbu+Asw4lVuvQvGbj9D8iytnhAgWJ9usYUkqaa6zsDyIgaAL/49SjBlep1OdLHoJcGXqTJE7xVtiO8NjkheHTLiNjkqZQ0r8m9tUb9oKIQN2mAWszu/vocg1QatIwRVOcgIbajBTyi7F8dRsJroi0D5thh3c1Wf6IbCJ9dQ9LyklgjSPbQsc3g17WlAZ7LVBI3yUh5pUfyGkenuNERrj7vfeEm9zkUxXr5wV0gFgztiXVZW+RadlYrI7TmH0wK1gE1MVDb1btikHyxQsjASEoyUgsKErB+ojYL5LaPXy2zxgy+zKCy/TBFjeDJfV49H9z1n01ggFLfYFyRsYg9IKwGobrbIbtsgwZdhmvDc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003)(3122999024);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vWL+aUSKS0kMK5YLVLY47VSyyqG+o6znswVWx3Pq6R5uB74Cb6yGJ//3+F?=
 =?iso-8859-1?Q?ubH9bMLdFGYx+gqxCDOhtBOMG8XalxPGDUOCOcbsODieKKhQ4Zf4N3IJUk?=
 =?iso-8859-1?Q?R3Qd5DfvuJ4ZZ8ih4ohwtuqaCXJFD7hH3Xb5sqPfqQCxuRL6dy2BrCAtyj?=
 =?iso-8859-1?Q?ZIFC/h0biJfM6d5U4TaaV/xknSWkCiJrcMGnrtd06LdLL8kd5C3KZ4tPuk?=
 =?iso-8859-1?Q?C2lBzmFu/0Hyy27ak0h+znIe7kFqkO7rNYsVHHU16R2kt31RDiBlC7p7PL?=
 =?iso-8859-1?Q?IFuFq2mLgcJIUw8+unpbOp28mWvmh0Im63uJlm/emh2+CENBelhn8URxW0?=
 =?iso-8859-1?Q?H7YISQR02YJSoxtCXHIb8QOD5UEegZ5/Omhd9JQ9IAYik8tvkX23JArirz?=
 =?iso-8859-1?Q?+6CLSpXD++5/59PSw6KWC4OLUtpu0A7CUSLyH/NBVjfP10pxDVIq6oNgm5?=
 =?iso-8859-1?Q?ehZx5QAVf0kNxBFp/bhGyCNZ0MSYSQtFS96h8Aw/CMJez84B/gvDo0c/It?=
 =?iso-8859-1?Q?AiQqOVbDBtRgyUuPH+rcWC7sap3BMRZrGS8lMmByty3SyyvlwEK+aG+f5X?=
 =?iso-8859-1?Q?8eaaqdtcXv30wYYVrRGtI4dMPMPDwigOR7WV34F7FW5XGfKfjxEQaQUMRN?=
 =?iso-8859-1?Q?b7N2HQvNOTwFj8TGhYYx2wGThF5DP+XPO/7c2pURTT9ZUbol6lLUUh4rrI?=
 =?iso-8859-1?Q?Oq3dyWDg0DP9WyJbJc/HS+OEF2LwMO/dExbYreFpzxlT1tI5a5HkyFxnRz?=
 =?iso-8859-1?Q?dWba0fBygZptF9eu8J9B4JeeMHgIBjeFis/Q46cMl1q1ZtPRVDnnAvcIFe?=
 =?iso-8859-1?Q?Z9wQJpQu5cY1IfucR3Dt0c0+EQfrRKs1jT5BlnDBOiEZY6h1iPffJcO024?=
 =?iso-8859-1?Q?CR9rdt3UfqiY40302VsMeiwMp2OY4hK5OWSul23QA4WX2zGA+d/ScRULqx?=
 =?iso-8859-1?Q?4LoKM8DB0HzLTvRXWi9VVInco2PO1M3Shk60RA1WUKmNVOojztACWw+AQx?=
 =?iso-8859-1?Q?7NSp5gMrDY4KCT06jIQhzRWN7K5cy1CGlqVdyiKwAo+LKdX2tKrM4IeHkY?=
 =?iso-8859-1?Q?K8fdkGnq+0Nd5VFII73f22hy6kxiTTZf+yaBKBpMG7Cj7vFq6tkKomliMV?=
 =?iso-8859-1?Q?kzA0PD3FmnkjDBfuJsEV6NqaKCTtTgzrUOEWRVHmeaPe90yqe2C42LKIaZ?=
 =?iso-8859-1?Q?aQVaI0P7Ec0j++AE+fd2SwI3Wk+T59+sFTXQgq5DbKqceqWY1ocRGY18Qk?=
 =?iso-8859-1?Q?7DfEPZUTSmFuh4VcQfPQWOrlq+S/rJ6UGPC1cD9A46Culrykduy9X85/SC?=
 =?iso-8859-1?Q?/caNXGCoHxwboeGdgsghboOtoxFS+uL6EdQYK8VYUBwwapoqENv8DWvrDd?=
 =?iso-8859-1?Q?HehUkI7hMiuoMWmzX5tpU8sx+cqh7JcSD6jWlMP817o8V5d7UpjWFP7Kr+?=
 =?iso-8859-1?Q?PdjfxagTCibyQUuofdwd5KKmLCsDyEy/4eLZ0F7JkNVti7j9ZXKnf6xPeR?=
 =?iso-8859-1?Q?jL9Had2E8rB70GXJ359YqbioF1m8VO36OQ/WoSOR72IVp6XCnQ71uf5Mdx?=
 =?iso-8859-1?Q?6QedibWUG2+DBt+qMThNCfK5oHAzm116o43ZWbdLZMaZ8aO6GRPTe35UkS?=
 =?iso-8859-1?Q?lnlX2PbV/ZCTkkWz83MSnk2dR9fNoZUpVDETDbIgt9S9vfC79aYvzIv9g1?=
 =?iso-8859-1?Q?v8P+0NJ41R16PjFVHTCfmIEvksG0DPadLo2qLKl3v6zEQqKtv9tKHGUU1A?=
 =?iso-8859-1?Q?ZBfsL5MlHtxcRAmpLRrBy50kDk+126nAIk8ZpWe5UkUWAY/TdUbkiEuhHm?=
 =?iso-8859-1?Q?c7It7yQ5X/4HvcYu/QjSeVPei9omZ4c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77d32f9-3c05-4f86-80a8-08de892ec237
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:45.3043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+lVWAcPiwlejLl6CHohvUNLM6AqtTALF615SjgG6iYqGR+unemghSDrJL3vNlFdL1VQ5bFrqF3qcNH8CaxA0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-purgate-ID: tlsNG-ef75cf/1774306307-4DEB3303-71D9D92F/0/0
X-purgate-type: clean
X-purgate-size: 16557
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9635B2FE961
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

