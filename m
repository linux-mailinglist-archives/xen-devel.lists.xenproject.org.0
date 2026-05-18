Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF3SFWbBCmoI7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:36:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD4567BF9
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311592.1581707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsVy-0001DR-Pm; Mon, 18 May 2026 07:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311592.1581707; Mon, 18 May 2026 07:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsVy-0001AX-MN; Mon, 18 May 2026 07:35:50 +0000
Received: by outflank-mailman (input) for mailman id 1311592;
 Mon, 18 May 2026 07:35:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wOsVx-0001AR-6P
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:35:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsVw-00EtmZ-BF
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:35:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a0ac14b-e002-0a2a0a5209dd-0a2a4506b362-38
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:35:48 +0200
Received: from [52.101.70.102]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a0ac153-7371-0a2a45060019-3465466674fa-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:35:48 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9437.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 07:35:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 07:35:43 +0000
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
 b=imSmn0aBAa4MY1d8Xlkj+kbKVhJIwekOcwI+UtvQyKyk8dHrPY49oQVMfM9PQ465U4z2zcXXmE/4xXBaFeOfHJXZngRPc2A2ZpBrgSJheLb6X2pyiLBLSjDb2my2zs8kTxunZUswgLWyzplsuIkf30lZtDzqUStJvyppxN7MUZXIoPMQ5aqtGGGN8O7eJz6B/qbufaPr7WlCjDMe4/wSQ9AQnVyemxH4XthzoKlcGnykfI4KEcVmjgaN3JLmKuD8MzoS3bkypptdAL+c0ikuaOPOCTeH5wBSjBkI61FKfcLf0xvMYVJ7v1Ek+2YbxiwUPuSClpKm+XbCcEgtaCgOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDy8M6NJWv0EsXFI4wgiUumdAxlEbJiRXMcEKRjhk68=;
 b=kPYpyv6lsr+EppGwlftuCP0RNkFkTQZOGNdgre/3XbRw58Cvtn7RBOHUCtyOtc7yR6JV6/KDqVeW65jm1lLHC9IFRNCzN7ScJCvra15aNbss/V4uY/Dsn35Yns3FdkDEGDx6qrVClqfYg9kwAjKf06acZDJlzvc7MR4HKCQD6zTjoafe7w2OR6AeSN1fSeh+x5CWfE4m0QvsgEng2jGdZ0eBe4WGFhhHvzkrhM2hz7s7crP1jBvlavsvogh6GRkrr9r3y7IPNEjG21ZKY3KOiqBrOhL1dgqnvU7/sDxqeEeenjCI6+JAgTdlSfsWFDoNLk6H1htoZ9iJ4zyuk/eVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDy8M6NJWv0EsXFI4wgiUumdAxlEbJiRXMcEKRjhk68=;
 b=dxwn/Ekj5PFVA8TAZzELlsrBiS6EvsA5wFugseZk3lK51sh43GR8CrIkMNY7KgLyzUV9SYfkgNcuvhnOHV25YbkHKJaYaNGeDz2dmmZbwMZNps6kHDQScO98IK+hY3/JL02Sl/I2AqgkDaUWUW+YU24dY2DUD7fG1Q0K8mt8PYDCuSmpIxqjgRjfguoXtgOBHO04kL8xdvM3S9DgDbuwRT4jCCKYsPVuO7xAVWCWr+Rv+K3HGPKQ9c3v9Vsn296QsbQbZ/RRToBO10+rBb8GwmqbJu9IBfhHPJf7reFbKYQuN23MZkjjSWoI8dx/HVhlZDs85flOJwXDSFPbEvipUg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH] tools: Fix helpers build
Thread-Topic: [PATCH] tools: Fix helpers build
Thread-Index: AQHc5pjvZr31VHZpA0e03PtkmtpKMw==
Date: Mon, 18 May 2026 07:35:43 +0000
Message-ID:
 <7c5cdad207571e98ad324f07c7c754f79e8ce044.1779089580.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9437:EE_
x-ms-office365-filtering-correlation-id: cf85fec4-c2ba-4fc7-214a-08deb4b0119f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|11063799003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 1793cNklzbGCLy5y5OOPOmaenZ2BJ8pAzmrdlmATaLm4L4ZZyRy+DejCS+NWq6qgALBYm0S9D6z3zIItr81EWGbbyFL+GxPdelZMTVHUqaa7JRRK7ADSKIoTwQ6wNWHcXooQ4KqEWDhEfeRd5/oLNE2lXrGqFKv4jEwVq4nhl2rqKMdi71EJO2ibOlfIVI4MHT/84vBBb8U6zOZYRNQdTPlaUOwJCd1qIhYFMxRxMDzp++VambqbntbNFOQwfaUIidJj0o4S56l11iImDXRuEkTERagz50Fx3LCizMT/3rNr3l2fDieYodcJKmV2EKDuAvXG1JgMaqt2AqmU9mPjcZpGXdQvWCqatyZFaLKihFgIgLQ2eXOxiFZoD9eG2vKmhfbhl7Wjjvz16QMzDF8n5bme37JImfS2eDVP1NyxyRQvbW+/NeQegXuV1l/DWbxvfJ0Mwrgc59JT299qHMavzBSHPpUzIrZneMyMi+4rLAb9gVjfB92MgOic9Dm47lWSwbkbix9ZCceiyRu5zi9YigGMhfL7Tcamgq83TKwaEhwzsd6mOKMJAbqMiRxZBBxbGEIjj163Nqmw23gQqY5MHmQyRe3Q4O2zocxw/MwzgzFZqQzbWL0gk/CMeTE/hL/Bie5ZCOb1ccilfC6bbtXcKa3Ng1CAEt2MukPhb3/kD6pMOLarQpMSOwB83PTOMOp72cwl88X0PHcG6R4pOxTJ92U8qJkI54srX58baWKO3xot4Zq3epBFqW7SoNtww1gv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mZw22Dauz0m3b03bgKDSinxOIaPz6GYIftdVHgvQ2lUNw3qTf+GBbIzJ32?=
 =?iso-8859-1?Q?4R/afCnn4cV8oXkLx5J5C9LGIMAO3dkx15En31lxK2n1KMeswlddl3HKmk?=
 =?iso-8859-1?Q?fgU+r9C0lx5Jdfi6rANIKn1s8bn7FwJ0onQAGq85qwiNaWPTlACitp0/o2?=
 =?iso-8859-1?Q?28lG5Y8kicQn7F963yjmhPugE6Tie2JlAlqSyKprC/e0YVyRSW0//Jv5/J?=
 =?iso-8859-1?Q?nplEEO9Ikk9bWk4v7/FIaR6W8h5rIQ/FdWTnUzLL0dteez7zNLUsoaNRc6?=
 =?iso-8859-1?Q?YFL9V3IlI0QnY1CCOiFHbpJiaMNmZXxTYkf4M64smOBzLDS/u56Ftg2h7g?=
 =?iso-8859-1?Q?YIrVin1tveJYSqGMHjVoY6LGLLBMV3tDH8ZemYUgio5WhO7a2y5tAo4hqJ?=
 =?iso-8859-1?Q?hPI7xzHH2/KIY8vn4QszqEVPYZWwNCOGQMpQb0NzPhDeGyqMAgodpAS4Xc?=
 =?iso-8859-1?Q?j+DfSETznSiRSGoMXI3s3/PYAxoih+53GkF6z0eO4mUHz3e6eZX48rOusE?=
 =?iso-8859-1?Q?4Oj4wmXCLpp/GuaDgzAeMFxPFgYPPqqFfrvaYZtP79inv6uXtJ6pxJPaBo?=
 =?iso-8859-1?Q?5tsJTaokOz1q7+X/HnB406C7kj8RdmlKmXAWHuQFCv3bx09/Prp2H/0fgn?=
 =?iso-8859-1?Q?LKISZRNqQrkQMqqWPm1FxeFOBT0lzibdTREgiVw0Nk0ucIODdRW/6NRX8W?=
 =?iso-8859-1?Q?0Wxs/juHhAId/kk73bFjsKPXwFd16MrGKC/hyrfXIqtoEXMzvYKjIzeY73?=
 =?iso-8859-1?Q?skjAtQdsALEnNu/0vfyjZvxDDjnq0brVsLW5CE/2Az+DbxmDbQl2hH/Wy2?=
 =?iso-8859-1?Q?6KPD6prnHvIZq9xJVVOgAjTqdGquKzDnpZzxSUj85Fm3IGCFnF5afeHMYc?=
 =?iso-8859-1?Q?VnQTAvefq3hrfeXsRkt3q70gfK0GWcDGQiW4NpflxvqWG5wXXyMBwMk5ff?=
 =?iso-8859-1?Q?clzwyQ/WWIkatsbyJeBR7YRpeVUUGmpObwANay/z4TqlQU2m4EWSt2Ng3o?=
 =?iso-8859-1?Q?qU/QjgcyfUgNfIjbbKSmUFbhH+8J/EDnEWlqnEtT+dFbScjqCkMxpZCypt?=
 =?iso-8859-1?Q?jqRAgPIZUPeeDtyTBO5FEvReQV0Imql9f+Lci21s0qja/21TouKO9lT+Dj?=
 =?iso-8859-1?Q?5hq39FeOmhp4Iid3N5/lsOLp4K78/hbCBIu1nI71AvQJsn70bZDrbmBcAK?=
 =?iso-8859-1?Q?YXllCccQ4urOHwta+g0/V1HTHnQskpCId+u0WLsWawp/yieI6Cdsb/yTYc?=
 =?iso-8859-1?Q?bLfywugIpY2O4YTbrNnJEd23UKxNhDskUyIRF8FoHuJLR8Ss8SqaxKR+M4?=
 =?iso-8859-1?Q?/B7H6+pmvQeMP2l2P0lNaVxdDbRU73f+F/nlTf5R5YGZSbIY1RRDiLvnBj?=
 =?iso-8859-1?Q?et2UJlTGUniKUr0LPJn1wPPa78NFTvNnA/UD4zB6M8B8pLn3oyI+n+JdpP?=
 =?iso-8859-1?Q?yT8j6M6EXfijlikXqZ80aQsct7lgIm9vnPw5g8S8ZsaAkhOZkmkVOyz55J?=
 =?iso-8859-1?Q?Zg6l4ceJk/Q3OOpc96vwbmAjtTAI/Zp3c+wyjcVlY7bK0tP/WzvQz5lCZ1?=
 =?iso-8859-1?Q?nBR43EfY8z/dbGXWprkHBFA7KZyELALhNJDw0MDAghnft9fEG1qu4oojKh?=
 =?iso-8859-1?Q?5s9Ry5iKCLIzOjh1m8+r1FJbXxlmoDY4E250TFruTXH+8h0tktdUq6TO21?=
 =?iso-8859-1?Q?kUgT4J0/f792huuIovxy0SWARC/R6lCn/07QE4+hWVybkuwNGVWhSj2wEX?=
 =?iso-8859-1?Q?fX7JwZSU5xOScJEq+GTnevg3QzRBhs4GwFSIX9nnpjdjSGHRx/dudHF8OT?=
 =?iso-8859-1?Q?yBMhD5X0uhfh8xDxMaEAh5fxguMhvms=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf85fec4-c2ba-4fc7-214a-08deb4b0119f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 07:35:43.5685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEuAqv6UBiA1stwYNIba0/ovrjY107sxvNtVZD87XYnNSOrYYSFqONVWAbVFRccNfndk1/84IsDGc9Rftn7Kcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9437
X-purgate-ID: tlsNG-16d1c6/1779089748-86369D75-06FA5243/0/0
X-purgate-type: clean
X-purgate-size: 581
X-Rspamd-Queue-Id: BDDD4567BF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,epam.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Init helpers sometimes fail to rebuild after switching branches,
which results in runtime faults.

Fix this by adding missing DEPS_INCLUDE to the Makefile.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 tools/helpers/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 8262d9e75a..11db7d8982 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -64,3 +64,5 @@ clean:
 	$(RM) *.o $(TARGETS) $(DEPS_RM)
=20
 distclean: clean
+
+-include $(DEPS_INCLUDE)
--=20
2.51.2

