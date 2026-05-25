Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDwvCxk7FGpDLAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F25CA43C
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 14:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319203.1586903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3V-00047E-4o; Mon, 25 May 2026 12:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319203.1586903; Mon, 25 May 2026 12:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRU3V-00044L-0r; Mon, 25 May 2026 12:05:13 +0000
Received: by outflank-mailman (input) for mailman id 1319203;
 Mon, 25 May 2026 12:05:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wRU3T-000448-5W
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:05:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRU3S-009ZL5-E2
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 14:05:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143ad0-e002-0a2a0a5209dd-0a2a45018c26-40
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:10 +0200
Received: from [40.107.159.87]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a143af5-c1f2-0a2a45010019-286b9f57a41b-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 14:05:10 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AM9PR03MB7026.eurprd03.prod.outlook.com (2603:10a6:20b:280::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 12:05:08 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 12:05:08 +0000
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
 b=AxPuD/8Di5j9acSKcZFO+8hpv2C0yAQxkFzlWkZM6iG6G1cROQFOIs55vN0Ci4fYEMB6ZOglK0RHg894mwtDyoEpZ4MKvxxym2eM7vdVKbGm4NE0v61cPWjn0WcJg6h4bm7I3mDwdOZnRNAAhhQKc8uqS3Man86uU1aqz1shuBgcNGyGUg+uYJ1uBfk4LOqP2Ru3XZ5zSKQRyQ5fNA15Q0qiYpLO9H0YJ+wNbnbHuDUKI4dryGP4M10DtHBDadJPB7M/spnpEP5NH7M6lTaNhwKGHM+3mKw86oE7oesM+F8Bm30itVQiC9eKuZZxbZv1v2vS6aFvXzCc2zQ5+EWlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xT93su+GvrQoMibkXDU/nROpFa/p02/vvtcZhLRfyA=;
 b=bdom5pE6s+lN/1U1tAQtuZyK3nbnYE4UTA7CuaxA80Pn+Bt4bedkxjMkaIALxwOn1P+qCrdhQgH67NdANdKpYGNJhG08jnzLvQvVH53bFClhyP5TzZ08+JvWF//qaOfkP3H2gCF79uD4WncW6F3USbvnuzPcz6ThMUCWF2S6mpmnYBkYQdM8AaiPM9m1QdA21+kAvdKc02lrykhHjBdagRbmm0Y38/Hd/lnmK1cYIhN9LoIlRyBzfX2v30WgU29Bc4bG8MWU+wp1u25uCXZf8QrRhk/h6pZTYMuF5Bckq+LWzx5inavyj7U3w579ODh5HisZDW0NR/S/12y+RL2vNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xT93su+GvrQoMibkXDU/nROpFa/p02/vvtcZhLRfyA=;
 b=mg+TX05vEaZIHExhLjp5/mXOD8nidRtw/xDsz5GXDM4QkobD1/qLqro4ZPegRBmKoaxnO5AETNcnAufiS0w0GHzeqLi2T9vYayW0Odg5dLj0L+YxQCwQxbqZGf/cYZnylEeHuP5xhW07DTtB0jlsRCowNg3rCoHrJcjw7yZFPlbUuuaHcUR4uhjrz8ILv+fKyEVD3l+liu2Dz/W7tGuLNyRgOE0RreA6AX8mKqKjWgboYFc3JwrTBXHGvFtE8or8E1dpdntngSGto4a76UhRoUhzpIq9EO/hBfn/Q+2+7LtrZvx0rDgHFu3M5naNSSaaa4c9JdDhZq/CTzSXvVHNUg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH 0/3] misra: add Rule 5.5 deviations for intentional macro
 clashes
Thread-Topic: [PATCH 0/3] misra: add Rule 5.5 deviations for intentional macro
 clashes
Thread-Index: AQHc7D6650ZgUP24f0WL24fn/edbYQ==
Date: Mon, 25 May 2026 12:05:07 +0000
Message-ID: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AM9PR03MB7026:EE_
x-ms-office365-filtering-correlation-id: de24bf3d-2f72-4b89-fc87-08deba55dd40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|18002099003|11063799006|56012099003|38070700021;
x-microsoft-antispam-message-info:
 3fJVTe9RLex6BRIQcPyrl6Ac27RNwQefprV2xJdMDSLzDmdNz5ZCoxUgRy0kzQUG4dLb7UbW3/XXsj6CdkRqijWRmP5irEgNC8IJl9vadA7NsrJ/10m5172rS6EpOASKTegRbSyQiU+22pwFCn23x15QiTYYNQJgoMi5PvEiC4Srnwnm32L87U6zMP1Vc4Ef4tcgsRgDT6cvvYgppt6LN2/8DQPPpPDRf1bfvJIt34ENZi7PUN7n8iuiobgUlLOwFeF85EX6NuYFdKhwfoCrHjo5ry9l1GkALCezPB0C+TxT42VJgIyRE5B8qENtt38eyh92N2T3HqGx1ctV2WhL+hMykBMrKqCCB99Qv5jaXemwKbN0Dl8+mnChWJYKKgc7zyuGOLRmaLPKeMpaRQG/SByVWXh0r7I26jMAOPReZP7GyG5d/TCJ7BcgjZl/5UlVD/P3Na7+96+2Dsj2T8zhldhBxaemr2WCfruRod5jn8C/7wqiaHqHL3a+K5dnZAJPPmdgcbpVWx7XojOsBvn//bBHkvzbpJsTegScIWIDJZJbujaAWoxDRZLdvCUhcKVg80mHSI4w8vwQ4dCvK8yQHqY56NDSaUxV+mIfpnUwF/SZ8M0/wQDoU3Au3hXXaROhAdzoBM6+tAYSKIRXiQE/3lkDOnw3dxlaa0PBjwPGeF62CUTQ83wL3IMP/26qPT47fSkG94kn0jGlRPnnABhjWoJJ+lcY34RZxz+PjuVn2NYuPrQIWM2wgtf7r6yGHqEA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(18002099003)(11063799006)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4hkcIw0zRquMNa+AAxQSXOEF1pBB+I+RUORwG4Y8x6m2hpxc+k55TmKVAZ?=
 =?iso-8859-1?Q?tAgvsDLa44GD3gkYZV5bKOg4SI51qlSMcI8/2Z/EaWZo9dGcjIWfUjc8eK?=
 =?iso-8859-1?Q?d2IASY9++XUdpvtdu3nconuIpDVl0ORzl2ycW3m+T+uU2X1Huqe5vn0Yry?=
 =?iso-8859-1?Q?fNfP/lNeK7is5mJwJltJve961voR86umBqEn/f8IeGXxkkRIHONjoKUpIQ?=
 =?iso-8859-1?Q?TyDcki4UdkhF4eAuWSE9hIW6B4/yYxTsGqCaoxsN+Kb6/939Jblenyo8hY?=
 =?iso-8859-1?Q?TeP82heLi2AdP4Y6jj5ZlqM8pDdzqXIqVg4Nh0ttdPdp984iOrOAhEJxqV?=
 =?iso-8859-1?Q?y48sm4ND8ec6sHxBSU6ntXjR5h8SvR/X2GDGFTxQ4SK3OGnlEwo3OCGPkq?=
 =?iso-8859-1?Q?q+XwctRFa093HLylM+cA3Rt8ujlFGdXo1c/R8XlqQfxG9bolTCeaTkPDEN?=
 =?iso-8859-1?Q?lFtzdwIEtOWCt5enk9RkMie4FKHEU6KWwswIbRANSU2Tk9zKW4xvhqYdVU?=
 =?iso-8859-1?Q?78A0ZJe/mXKTDa1Jv6AEFKTGUUGvbTSa8Kj3rWEgGlOrn30vgAmDr7zmtn?=
 =?iso-8859-1?Q?yNNCHgOu/jT2B09Pdaowl6SC8XRMDp0UcWlDoLOMDEmfr/NM1IiF2q993m?=
 =?iso-8859-1?Q?yR091XRcvK532fpWE9yKlOZikiE0BNSF1bjJBF5atWI9vJgZzCvFdOorAi?=
 =?iso-8859-1?Q?DITBrHQzssypjpZJI+Q/ZkpZJj9YPphVBycxucJe5Y9+OU9IlnU1FwTLUS?=
 =?iso-8859-1?Q?2OJ46CCau+zXR9GLlqo0DtKvnVVhpC94c36Udc4lE0MNLA7I1st93Nq0WL?=
 =?iso-8859-1?Q?XcnRNxp+z4VGuVOSn52tKjoBi9YwemPZlChqAXJx9obKg/JlRmDPivyXIP?=
 =?iso-8859-1?Q?ogcuzy3niAhSEWODcPL8w1Ked3CKR9H3lP70B3fqRucFezKEWC7bdhL6JU?=
 =?iso-8859-1?Q?TfBUqqAsA7Z1c7B/ed+Sc5kzNPYT68kBEiZXuAppYM9WiiBreXDqzrKp4F?=
 =?iso-8859-1?Q?Vy57+TD4M/3mdBvrg3QToRq99GmBuoiAsLRfpPSMxpROYTer7fUFRLPOzh?=
 =?iso-8859-1?Q?OGb+FaSxGFNKFWbXBVLRRzXoEGgwIAvyAHbNWZ6FVB79lxZ/P8A72XKZVa?=
 =?iso-8859-1?Q?9otYMMpcFC9vXSjPeabfKUzRsJocU69vRlVSXeV+RSLva4+0wmqIi+xKBs?=
 =?iso-8859-1?Q?PiFrOQ65ZtB4vMSSzRrWtAp3XneScJIdJE05LWSwSLcor2mPfO0K2gVDDl?=
 =?iso-8859-1?Q?ojFqErB4GyNfIxvZ6W++JoXUcFd1sAYmfi8ypjaM/HNaNxL0wL8CEVbmTS?=
 =?iso-8859-1?Q?VQFdoYdotAbU7+nNkecTtmgoabBQ2Ve49UX6aAKPhlTR0QdJnvBRP7UVsv?=
 =?iso-8859-1?Q?2IVE3WXlosxzLESvpvmM0ogNSew85O4wcVQObjEFCBB8OywX8zR8AdY7KX?=
 =?iso-8859-1?Q?i1wnayNLjgzcVwd1GbE2ujR5PU1K1nOi3cnCj1kuTP6Ke8g7oIXjIJorP1?=
 =?iso-8859-1?Q?TnlY6EbT4RdXUgtN1uJqfeLh06QiXBZpT+CFJioaU+h3thYNf5MWmeYhR+?=
 =?iso-8859-1?Q?x8TPTmAkkjhwXuxzSdr1OddCj/83Bm/ar87f/SGZsVuZgufeZS4zz2+CPL?=
 =?iso-8859-1?Q?mCWuhDPbv1mULcBgzKr6eF2qGwRG4xsYiFqmlDaJYsowr+so2rPi69i7Oi?=
 =?iso-8859-1?Q?VyWiGJfa4vB3h6DE2sxyaD8vduFzKsR5nqZ8wFx0CJLcBcYLgX1C5Tx3vJ?=
 =?iso-8859-1?Q?BeyGKH7mvsSZGM+gwpQdTfz/26H2RKOkdUuL2eLshSSlxx4XiyI9Ixriiy?=
 =?iso-8859-1?Q?zZ2JElv8gAc2aDTnEAN1b/rxrWuBJ0k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de24bf3d-2f72-4b89-fc87-08deba55dd40
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 12:05:08.0035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLE9Xv8+qsTLot2IUqDf+OVIZ6xDwM8COIeKM9AqGDPJx7Qd7RHbG3LK+qDmeDWz/68yPF5NcHRadmy0kLpuub3jjSnZEDb1nvDD8SzP/d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7026
X-purgate-ID: tlsNG-d62444/1779710710-AC656FF4-026D83A8/0/0
X-purgate-type: clean
X-purgate-size: 710
X-Spamd-Result: default: False [0.81 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 824F25CA43C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds deviations for intentional function/macro name clashes whe=
re
the macro is used as a wrapper around an existing function name.

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2550931948

Dmytro Prokopchuk (3):
  misra: deviate MISRA C Rule 5.5 for 'hypfs_alloc_dyndata'
  misra: deviate MISRA C Rule 5.5 for 'request_irq'
  misra: deviate MISRA C Rule 5.5 for ARM SMMU fault handlers

 .../eclair_analysis/ECLAIR/deviations.ecl     | 18 +++++++++++++++
 docs/misra/deviations.rst                     | 23 +++++++++++++++++++
 docs/misra/rules.rst                          | 12 ++++++++++
 3 files changed, 53 insertions(+)

--=20
2.43.0

