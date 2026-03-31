Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Nf0LvYoy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56057363322
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268227.1557564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH0-0000LD-PV; Tue, 31 Mar 2026 01:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268227.1557564; Tue, 31 Mar 2026 01:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH0-0000Hy-LV; Tue, 31 Mar 2026 01:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1268227;
 Tue, 31 Mar 2026 01:52:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OGy-0008Qm-Q1
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OGy-00HCrd-6D
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c4-e002-0a2a0a5209dd-0a2a450a9b40-2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:04 +0200
Received: from [52.101.70.95]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c3-1772-0a2a450a0019-3465465f3097-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:04 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:02 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:02 +0000
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
 b=lE2ETyQAUIPMd00zF88eFjI6u7YhpxcAzpMEQIc0UykKQpxYqdvwadZYU8JgADJNPfKwjMLeq6NsTh8TncaykXcCI5Dv2du2beicSkluGqdGfZhhVcqe4/pyE+bQe1csfgQzxt/yp6WfCK+1lC8hSdxM6ZUsutvnTHB4+PvSbmilQ0X3cN0p0eE0fSf7qXDnyF6zRElFrNSYfuafmEhiTUevDWN2CDVXbn93ztDg2puE6ZNq8eyHmmLa62mRXwf/0LQTDYPCmDRvnaBxvxAirDqqVMceVOgpudiT2bOC9mPOF6cLbJtBIHhBlZi3YFJqXAIwYuoRWrLNAKhIgyWrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4rNFUKhYH8C33Pp5LApkC1awPW5UGLmwXipdM/Yt3k=;
 b=Q6w4iqiyfNloKKJ29dybLJE+1mLEFqpjKeBNmY4X98Z5MCGpt1IfYKl8Djn1HiU/2AAouYzc9yMQAkwE85ITSd2xJiPA5nD605QeF+LWCbIU1r58OFgKi1kbyPkxfzupyNf2JvOLhKYiQ7M56gyw+if3qYrpyXfPxQ5gDTI4Gtck6/D4TuZNp9qnIbeaqoDD0leHzn9LmqDJGJ3mxfoIvccaJtH5vm/yp6fviCBUETM6ysSuTSKH7+qb6EC+/E6mxc1XnpgPt9L0puUUJ2Ed3+PhXqF95IfMKZ8g14v9b/zQeAonqV/AtI+yvqIXspRPjnHFBX3dtSMOkmI5w5JBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4rNFUKhYH8C33Pp5LApkC1awPW5UGLmwXipdM/Yt3k=;
 b=lgywjOsrSs1/yfSocyTlS/KbyBmDHg6SJSqGk5zMAMTAjpqyv8P8Nv2kWvKgrHHFLc+MNUvyPcRQrPyxoqeq+AmLtw5a4Y4bIXqlFPz41JrpdRyH6VOg8X2mxDQ/m3HCYMpNjneRFyvNyOh/RQtcIt4r5ui06YJrOEeHUQy2nFrlhvp74+m8RBlPQFxmniaKOtr0eSViS1tNJYxJFBhadXLXYLGj2gJIRdJt8FlTJnmj+Ws6zWNzJJRXKMWNKBVmVLc5T6qqQyyXQUh9b4da7/tYeub6HgZyB4IC4oUhowZuSuZFr6rNm7CJffENSji+Jl3np4dlz2BTc42aemT/dw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHcwLD37i4zgjynW0G6WbAFhYTvDg==
Date: Tue, 31 Mar 2026 01:52:02 +0000
Message-ID:
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: aa0318e8-23f0-4138-80c0-08de8ec81a77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 RXodID7U8Ef0OZBGVJgDqGKn8CXMVXsOXBa9PO1CxBCsceqvdCnvqXouGczi5WGUw0Bghtl0BjogtbRdpW0+5xCujeoWP+kSuz+agi8hbHp4KgbLxFOsG2XnCHhjPXtoeB6gc8WZt+qL1t+cXOa8GxB4PoaewkzhhMFbLjNd4jbifAFlkexNRPfCC/LgZkTlYiRI1lwqhcMR6TSmQGTIwGB57REbCLOh8TFbd3+v/p9ggwD17YNwfnp0gWAU7Q3EU6ImOIrojVo16kpDNHL0yao5pz8Fsj7yzUOdkb02ApBm8S/f0+8h6v4zop+lV1p21u6krfKSu+NELEdjM/bPseIHGd8CEMMnzvdiGs2+esDbxzFA1uBV+7Soo80oQ77L1oxzWhMRY7bdzuu0LqR33fkJVak0y2D7ncuqvvZjbJA3XsoBlANbDhHjpePDKaGj2Z0Hg4Sgv8BZTPvp1mo0v12uosuntxzNprWeXr3dJH8f+0axveR14vutkFY838tCJY/fGdb6J1PbWqKoO9Ylsq1keKE7i8y9g8v+QvyKDB0BWwh/0LMPAJ1bS28KTfpeFMjOZD1WHu51EG+PC3FL/cKXt+MBVcK13NvCUxBnVO7IS0u12ujQ6XtXwxVPSqt6S7UwEASEzTVnn/o1PUHsdC2W2UGMsvDtNlm8ykE+4V1GXtZd209T3aJ3vbRlnO4CgjS2Nw1n6taoNkG8xLl6ddR8rcUbvlhfcR7LiGsYG6iMdsR0l5Zwj+YUH69SXayaGJYU0YdK7mqs4RAmuDAsJxii1txgaPDgPPaE5T4VSKk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HV8+8wwAljb6tjimzAlxPkUlD0t04ezMX+geJI6lqcscQ9edaV4VaS5X15?=
 =?iso-8859-1?Q?kACMmSJnc4WlIPgl5OzZzcXerZwkr4rSZXQ2UYeIHIFSPqYHoPejxJJKUH?=
 =?iso-8859-1?Q?D8iFtgkckGL6gjgrmQ2KsIuee3GVKitJjzMbowrI8mXv0zPSDDI/rYm5ZC?=
 =?iso-8859-1?Q?/R4d5xY+xA9VZR83Z27LoFPlXSudl8SZxo70DAuMEu/z6E0i8HDLEoMxb1?=
 =?iso-8859-1?Q?UvkqxcoethJclNCWiZYppCNE2ZQNu5arO3CExFLVFp81+RobKDdHoZIT1P?=
 =?iso-8859-1?Q?sv8S3MioPDBI0FZawZxYlaL3zOXpi5ADmljXhJuXDn4dYnYyP22gjG5WdI?=
 =?iso-8859-1?Q?LiS97QQbDueu1ygyUu7XDZbi9xHXemtesZ5DUHatHH9ofDJlDelDJqyPXQ?=
 =?iso-8859-1?Q?FPYgGjenv6K4PTC2Rx57oNberlUx9+s+0nPIdYNeAa+qtOfZWpdckXHIdG?=
 =?iso-8859-1?Q?1v6MrmR6YJIZghkLaEp+k6rjERtRTzItGUUMoycxCdkV3RELrpiGqp4Ut9?=
 =?iso-8859-1?Q?3VJp3bpBq4M4kRfr2Anh+WxPM5GvzbOja1wuMoQ+m0bzTr2TaRyW2MztIh?=
 =?iso-8859-1?Q?F08AQXO3sROHm3XWcEhPzyQ+t+CT63wa/QlZ8LlCGnuJrS0Nf24Hs6SSIK?=
 =?iso-8859-1?Q?5aZBf0ofLfW17mdWACNvMt2urFmppcoSxtirnOPGw52KAoLDNPzAN61xTd?=
 =?iso-8859-1?Q?YToSszsslGDIUyi/zoNlz/Y0dRcQ9GIMm3LAdAYcWGhsxABtZOmFk8JUe1?=
 =?iso-8859-1?Q?78bLyV9icSR8371i+uGxl/wMEQBVc4Wryuzbb1eLfyEeyxrkJFxPRq+kwl?=
 =?iso-8859-1?Q?b79ZO4hj8w1tFtqrfitSgqXndjahAeMpKBIKQIfpyGuVL+J36zXidkl2MC?=
 =?iso-8859-1?Q?fdGnmFMxhLOXdYEyZrppOQQnYBmgygmFpRiAZZx3ad5UI0gFGvYFXLXgV9?=
 =?iso-8859-1?Q?RJC1ej/sgkd+Cq9yEhgGS/xZCg9tYck7zQlQroZG8F9Itd0HYOYz5rY3Zt?=
 =?iso-8859-1?Q?GeYz7yGOMivV5xOUqlRJpMUEKrXsDQ0EvsboXoZFDuGjnL2kSlnOU9hGol?=
 =?iso-8859-1?Q?iRTEYiIEc8H29ODjzTU2Od0XOoKsEIbFVPhXUy62u0Z/WMb0QiqyBx272D?=
 =?iso-8859-1?Q?0aoOSB/E2OstXspFgI8r3PrNOEKmnbv9l2mRWLq2We5y6BxJgoKWDg0zEn?=
 =?iso-8859-1?Q?w5VUtk+dujhuTlCNWOTpgeCReB/FsmkhS7y+gm3bGnioY3srpG1CB4+m38?=
 =?iso-8859-1?Q?tsGw5fuBveBhbGdscEyluVpNfLUnZfpqh3VLs3NFqVLTC7442wkAJptT2b?=
 =?iso-8859-1?Q?FonEcgaregtTw+6Z2gLDHPduX6Q3wli2CTt4ecXOV/sGaTdJlA2EmXmFyE?=
 =?iso-8859-1?Q?FhlIKdd6eQ0b03F+fv6Q6Y5OxY7FVaC3OnXuZtDW7y3ia94QaQO4xrS5ue?=
 =?iso-8859-1?Q?rlCt6WNdwjkAykUVgw3FcSuf2InAJf7Ic5nSBWlEC3e7omXmDhPHC3xGlV?=
 =?iso-8859-1?Q?nVcwRVaK4UysPOpb3/maFcLNPuZzk/qhiDODeYp53lpAbt2ey6zWqf5gCd?=
 =?iso-8859-1?Q?ZwksoY9XcjAp/j8dEml9578yUNcwIL1L/pp3d9cn6Ck8l0vx9IMgT+2Nzp?=
 =?iso-8859-1?Q?HhBRDJN6w6p9ETC99tCX6fatl+AQeax02+CR4X6sz0JvlAnqOhBE1/ZM3r?=
 =?iso-8859-1?Q?voGQbfOEhKD35/zEv74cGVYp0xAz/vZqDv1gU2Zz0ahVIaWYeQm9sccHYL?=
 =?iso-8859-1?Q?qrkpaYH9WwqYByf+GDVkib49Ra8TDsAX+YvFpU6H0DRUobQ2Gw+gNW8NYk?=
 =?iso-8859-1?Q?nXjlw8o/iKpydGphh643aqIZXkDnU/I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0318e8-23f0-4138-80c0-08de8ec81a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:02.1335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twyCft1yOhQYZTRLmib5xS9VxIxdFKwlUjTBHVxjg/hGqdl3Jv6M3lVlQRGHFZm2lEY0fKhXt/xyOrU6qGpcpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-4011c0/1774921924-BCE85900-8A5723D5/0/0
X-purgate-type: clean
X-purgate-size: 10013
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 56057363322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

This patch adds basic framework for vIOMMU.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c        |  2 +
 xen/arch/arm/domain.c                | 33 +++++++++++++
 xen/arch/arm/domain_build.c          |  2 +
 xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
 xen/drivers/passthrough/Kconfig      |  5 ++
 xen/drivers/passthrough/arm/Makefile |  1 +
 xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
 xen/include/public/arch-arm.h        |  5 ++
 xen/include/public/domctl.h          |  4 +-
 9 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/viommu.h
 create mode 100644 xen/drivers/passthrough/arm/viommu.c

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c10538..067835e5d0 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -23,6 +23,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/domain_build.h>
 #include <asm/firmware/sci.h>
+#include <asm/viommu.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -317,6 +318,7 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
     uint32_t val;
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    d_cfg->arch.viommu_type =3D viommu_get_type();
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
=20
     if ( domu_dt_sci_parse(node, d_cfg) )
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 94b9858ad2..241f87386b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -28,6 +28,7 @@
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/viommu.h>
 #include <asm/vtimer.h>
=20
 #include "vpci.h"
@@ -550,6 +551,14 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
         return -EINVAL;
     }
=20
+    /* Check config structure padding */
+    if ( config->arch.pad )
+    {
+        dprintk(XENLOG_INFO,
+            "Invalid input config, padding must be zero\n");
+        return -EINVAL;
+    }
+
     /* Check feature flags */
     if ( sve_vl_bits > 0 )
     {
@@ -626,6 +635,21 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
         return -EINVAL;
     }
=20
+    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
+         config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU requested while iommu not enabled for domain\n");
+        return -EINVAL;
+    }
+
+    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU type requested not supported by the platform or Xe=
n\n");
+        return -EINVAL;
+    }
+
     return sci_domain_sanitise_config(config);
 }
=20
@@ -721,6 +745,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
         goto fail;
=20
+    if ( (rc =3D domain_viommu_init(d, config->arch.viommu_type)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -965,6 +992,7 @@ enum {
     PROG_pci =3D 1,
     PROG_sci,
     PROG_tee,
+    PROG_viommu,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1021,6 +1049,11 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
=20
+    PROGRESS(viommu):
+        ret =3D viommu_relinquish_resources(d);
+        if (ret )
+            return ret;
+
     PROGRESS(xen):
         ret =3D relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e8795745dd..a51563ee3d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -35,6 +35,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <asm/viommu.h>
 #include <xen/event.h>
=20
 #include <xen/irq.h>
@@ -1946,6 +1947,7 @@ void __init create_dom0(void)
     dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
+    dom0_cfg.arch.viommu_type =3D viommu_get_type();
=20
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
new file mode 100644
index 0000000000..4598f543b8
--- /dev/null
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __ARCH_ARM_VIOMMU_H__
+#define __ARCH_ARM_VIOMMU_H__
+
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <public/xen.h>
+
+struct viommu_ops {
+    /*
+     * Called during domain construction if toolstack requests to enable
+     * vIOMMU support.
+     */
+    int (*domain_init)(struct domain *d);
+
+    /*
+     * Called during domain destruction to free resources used by vIOMMU.
+     */
+    int (*relinquish_resources)(struct domain *d);
+};
+
+struct viommu_desc {
+    /* vIOMMU domains init/free operations described above. */
+    const struct viommu_ops *ops;
+
+    /*
+     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
+     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
+     */
+    uint16_t viommu_type;
+};
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type);
+int viommu_relinquish_resources(struct domain *d);
+uint16_t viommu_get_type(void);
+
+#else
+
+static inline uint8_t viommu_get_type(void)
+{
+    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+}
+
+static inline int domain_viommu_init(struct domain *d, uint16_t viommu_typ=
e)
+{
+    if ( likely(viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
+        return 0;
+
+    return -ENODEV;
+}
+
+static inline int viommu_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_VIRTUAL_IOMMU */
+
+#endif /* __ARCH_ARM_VIOMMU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kcon=
fig
index b413c33a4c..3c174bc87b 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -35,6 +35,11 @@ config IPMMU_VMSA
 	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage=
 2
 	  translation table format and is able to use CPU's P2M table as is.
=20
+config ARM_VIRTUAL_IOMMU
+	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
+	help
+	 Support virtual IOMMU infrastructure to implement vIOMMU.
+
 endif
=20
 config AMD_IOMMU
diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough=
/arm/Makefile
index c5fb3b58a5..c3783188e3 100644
--- a/xen/drivers/passthrough/arm/Makefile
+++ b/xen/drivers/passthrough/arm/Makefile
@@ -2,3 +2,4 @@ obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
 obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
 obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
 obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
+obj-$(CONFIG_ARM_VIRTUAL_IOMMU) +=3D viommu.o
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
new file mode 100644
index 0000000000..7ab6061e34
--- /dev/null
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/types.h>
+
+#include <asm/viommu.h>
+
+const struct viommu_desc __read_mostly *cur_viommu;
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type)
+{
+    if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+        return 0;
+
+    if ( !cur_viommu )
+        return -ENODEV;
+
+    if ( cur_viommu->viommu_type !=3D viommu_type )
+        return -EINVAL;
+
+    return cur_viommu->ops->domain_init(d);
+}
+
+int viommu_relinquish_resources(struct domain *d)
+{
+    if ( !cur_viommu )
+        return 0;
+
+    return cur_viommu->ops->relinquish_resources(d);
+}
+
+uint16_t viommu_get_type(void)
+{
+    if ( !cur_viommu )
+        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+
+    return cur_viommu->viommu_type;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index cd563cf706..d4953d40fd 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -330,6 +330,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
=20
+#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -355,6 +357,9 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t viommu_type;
+    uint16_t pad;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7..23124547f3 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -30,9 +30,9 @@
  * fields) don't require a change of the version.
  * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
  *
- * Last version bump: Xen 4.19
+ * Last version bump: Xen 4.22
  */
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
=20
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
--=20
2.43.0

