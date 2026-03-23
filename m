Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAsPEwTEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C32FE8C3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259644.1553038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7M-0000Yx-G8; Mon, 23 Mar 2026 22:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259644.1553038; Mon, 23 Mar 2026 22:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7M-0000UD-AC; Mon, 23 Mar 2026 22:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1259644;
 Mon, 23 Mar 2026 22:51:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7K-0008Sp-Lb
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7K-004fuD-1g
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:26 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3ee-bab6-0a2a0a5309dd-0a2a4502edf0-0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:26 +0100
Received: from [52.101.65.126]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3ed-63bb-0a2a45020019-3465417e0873-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:25 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:24 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:24 +0000
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
 b=EV5jU6WPfhKfedu+pKtqoEO2cZ2z3nY3nEjSVP2Rto5tcnLY/DpxRaliCwiVUdaryY6nT9BWGufwczgDe9VVsvxuX9ns1PlmtL65pdSmB0y3/eXHHeZg4dS4zVPWt42fWS1iXqIIqKxyhnyJw+LHv5NvvfNDp14hmGViEdQaTJHPnqq2Cm2RYQrQWc0aT9MxCAiy2KMZxHwwS2i43kMYR56E3nNL89SRj+O0GuubPQbbMWGRIfa8gUyjC3mznF2UgAd+ErUGavmbIRZyfrT0iEy4njVs7AjlN/fvaOz/TdnC0JgCavR/n/aSUICyp9bHzbjrFjCI6InRsp0WAk+MDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd5qnmJ7Wh0r99wMI0fZEOIGXmYSQVC8hc9mmzhO4to=;
 b=R9Oxdn6J1AksGJ3iEOItzNY0P1tJnU7bu7XCDUDl+JNWfnikOWazucDjR18OKyK5lsFKBf8Je58xeFvjxCIEjbDpaxWvU8GiUkgrjpaWYCztev1Pae/FhfwTzeX5TuWKdf2WlUDYNOvgrcc2u7Vz0nBH+Od+O3+N0+wQAAut30Dq7mDAWYu9xgmEzu3RJfd42luVGtb6Se34URckvtbUIwEmd9do/n2SeYMeo5BiRdOe870z227G7zkg8Nl5aOs1F46tmqCU9+UdzzwfRtul7XDkyHf8E0zEqyrza+lA4ATMsZj86rhcplRiZpg33bGPdgqlU2Oy9F/fHIIHCDVpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd5qnmJ7Wh0r99wMI0fZEOIGXmYSQVC8hc9mmzhO4to=;
 b=Gu9mnd/OGEcQ8Rp7k180FPKZaCEyWZDkrTY/QIrUYfznZi/Uaw6PSMpOsIrIdiYQJnsPxZLLjF/jRTR2r8W8oZnPd/qibl3voZHs06oENB09tZmCggichmN33rr2ILxQI4ix2XG00b9iXiw9H9wWna6+83la1opWKGovs4Wujqhmtvy19CXRVqKU+1t7poOBpT5h1Ta23IKkb6BGzxiLAy6XDZDJdydN4iw8+qZDqZ6JkjfUvD2Xr+fYGNTgONRZzeioF2yVY8lNLXb5bn6kgZhhx1Vuo2677xKAgKrLOSYzQN1he//tzwOQhQFUw6Znpo0qTmLV0EQsZ9iJQ/xqXg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 07/23] xen/arm: vIOMMU: Add cmdline boot option "viommu =
 <string>"
Thread-Topic: [PATCH v2 07/23] xen/arm: vIOMMU: Add cmdline boot option
 "viommu = <string>"
Thread-Index: AQHcuxeTokJK1XhSWEexAuBtof/9HQ==
Date: Mon, 23 Mar 2026 22:51:24 +0000
Message-ID:
 <6cd2601041902f380fba6ec8b87d7248f117b23f.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB7653:EE_
x-ms-office365-filtering-correlation-id: bc55ac85-4fb5-4374-a97e-08de892eb5a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 6rD2ELPer2y6djnZBAhpb83woUjoVeeKD4LuDNQ4vEiaO4YJyy5CL5Tll6c8Yls0J3sbrBAMF5GN12WfJ2WiaJazAxUHEmObowrNfcl+KAzfGPXdeTNwo29izBz7X0vH+3KEn1l2an1HRgD9pADuZZ/2bx/m4rTa7Gr2b00VrH/M+u+t6el6/rDJ/Hllrf+fVUeRx5S/MQXFI1SxBWPAId9RDqBwDUkHY1VEEAMO0QyaHIJLQ96OZmysXwV7DAboWlQ9Ne2j0EGE0g8wnKRkjYO+n8pfmjTFKq3mp7pKVRPUnjoWccpA8Cucg76pPk0wUMBeGivGdGlqQFT/xJipaZcjYwmHToc0BLgVk4HyIGydjFUv+LI/A8u8+Ac371oRaf6xFGeD6bpNNHSAas4BFRgySpaeugBtoj8EKNzdPNI4+Xon4Caf+qM6Bgw083H+XYIQocaB2NJTQnnVSm/3sk5Ro5lS86e3xxs+XKRqgG8XSwOKBkVR96W73WWy87i5NXrUioSQYCwZhsj2ToVSwut7kD9Gr3X6NjsIxSGT1GotDF7oTDhVJlDTdCyGJqNVPXufbR71rQEqYPGEXHisKq0KLPE2TiJ3wpCqhAU+z0ILcRSpbAANdcYObAQUEoJMk4pgnybBxuc1UsMXdUWf+K9x4l7q66q7IxDV7xR0m6mqDHBYFt0H6Lo+Y+6PjVWP9qQqo6uMuauX3GNJBzBMhEpF6OfMs0ybxPHXUjv5dxZGLjg2sMP/tO84rl5dGOw7Kz/YiFkO16Kw6vxsHhof3t80dq3MzmcZYtTuQFdpoH8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nD6OXIdUIsyyCz8/JST1bfeJskFNV2RjG+1Jg6XPsEqCY+UYn47RHTAC+z?=
 =?iso-8859-1?Q?Dw/O8QVXEE3JQdqqNP+YyPCJbZtXbGaCpakVupOzTQjDfrhGy5pC4x33V+?=
 =?iso-8859-1?Q?x0he3DwZaocVQbVbsZASpzPDEHnZjKgpg0jkKSu6BUgl/i6OOg9JsLxG3C?=
 =?iso-8859-1?Q?ITAOtrs31uqVW0lQWiDT+PwKJajFUzyNMgmy9bKn56KCmz7aVyZ3f9BVRS?=
 =?iso-8859-1?Q?C7w7pOyd4RR6O4kPZCEtZsJP6UU9kyh5LtBr2BsKMmrbbk4/rrzWuhHLC2?=
 =?iso-8859-1?Q?fi4lIOCRga3zPaecjwbpaod9kLpQHk3jbDhhfOB1tih5I3FpeTUsbN5nQ3?=
 =?iso-8859-1?Q?Ut/LqWRkrQBXtK8urQ4CP9QqdXpPhGiRgxICbvrz1sZnk8vqCjBinL+phS?=
 =?iso-8859-1?Q?uBCWxP2x0L8Kq1IA5HzsSx0x1ckd0oZ0v7ntjVLDenkPBGXCh2MDxiXH/Y?=
 =?iso-8859-1?Q?PZEyXiUzQvQRPz4ANtds4U/j2K/+FRTdnpBTHuixq+c3vfcQWctw/K+UbF?=
 =?iso-8859-1?Q?K6dbgYhqxtsHRNgJ44odA5TOuFbZ+LUFs0rgDsN8zCr/t/bFjzFz0WU/xq?=
 =?iso-8859-1?Q?+vAPf4VT8S0mE1nJDP/HJ76ynl4pw1ZUvK8D6O9q+tSO7MXFZtxl08BLVQ?=
 =?iso-8859-1?Q?2cJHMKeZiMCNFIqNckUp7PygCnABevPg0vPvMtLMSn2cyML46tp2y7XHoK?=
 =?iso-8859-1?Q?1Hn23e8S33A37PLXKVF6HuN0Mh/GyDFKg3ESm7BAykoACUv3xkuS7pqXPK?=
 =?iso-8859-1?Q?9/BoHkUpTVHzN/b6kOAym4Dn6YFOym35kTsbaRYH4PliP876S6flTv9czm?=
 =?iso-8859-1?Q?lCwrcHaLyWbuAj6KFyO06Wto+NhZ+UrftFbV6gUUS0jt8cRBMKPdateYBb?=
 =?iso-8859-1?Q?NOOqXd0H8yGBK+lfgWaDNzC1ZD06IagVstNS7STLTHAmMuorv2No6TzslO?=
 =?iso-8859-1?Q?BxMJNQYnXJEnRyCRd3E86UoHqomRrDUgZcewULBadvQw/fOCFZzdjQqUR6?=
 =?iso-8859-1?Q?HvmQM6PxJBtxy/V48+Ndn71FxC6mQR4nBU6mGx2LrBDlBo7KWitDIIXJ+3?=
 =?iso-8859-1?Q?8N/xcRMZRTMVaJN0QIcZyCjPWLDG68s82OY45u89aPrGazOTY6lXFrn/p7?=
 =?iso-8859-1?Q?Kf0iAnX7esXieZsN8GtvXJ4+K12DDzRBxaS1nV6vWJYygBZe86hQne/Qec?=
 =?iso-8859-1?Q?xxBUeIXce8vKiT5Xk5xFmxBvxX636xyU10ylFV6jDDoHXVEMiE9V1k4vv7?=
 =?iso-8859-1?Q?aq73tRHqrxwW8P+jKiLSd1dgJ3FFqXM58MLcq1jKkvFRqq/l0X75d29T3m?=
 =?iso-8859-1?Q?mNoo5DmJq+X+f5pUsbX9ve3Q7VqpAaGFtNMtlBwcz93rQ/DJeABNlSoSEV?=
 =?iso-8859-1?Q?ere9LrTw6RKVaVy5DGKMG36M3TMQSiYKtPK2A38ETz5nnsTcCiR79QxsQo?=
 =?iso-8859-1?Q?x9nC11cZAigQaKvcv3+m6b/UxAT+JjTv7f6qAcheZNj3jNXmJvPsHon5wr?=
 =?iso-8859-1?Q?yEncva2Kf6OOQ3guH9PraAfjZWKTLTTR96irej6ZDER9EylhqvqRTYv1qZ?=
 =?iso-8859-1?Q?OAFxEwesFJCTIhT4ttVA18boT1Cet3J6pI9BGsdEAhJsgBnrSIviwoxX3+?=
 =?iso-8859-1?Q?T8MUuVdPtSXgtmuQubtYLGdFu5Um+OjjA51Gtt1Ump5/tX2iyK+i8Qvx27?=
 =?iso-8859-1?Q?xI9hJBlzQ5pyGsYKrwF+uwPxzInWIYCdNtmACUpIAuIkTicxr3PajS45wT?=
 =?iso-8859-1?Q?X3W8DBPQAlttQNZlaxtf0Zvys6vLq2yg7AYfipmMwieNVEdkuLx/sf2/bE?=
 =?iso-8859-1?Q?joQ1XSZdh6yKHkYwn2e+MwWUoKoTCyM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc55ac85-4fb5-4374-a97e-08de892eb5a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:24.1734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDjQ9IOu5Ym6Lg+RpTqHroqYfMTUuIfWWmX/nMhzsWPKl3Suvh+VXK7wgSdTWLOB0ADHWxEAj31i8p6kfmo8XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-720697/1774306286-BD69EDB8-47756CCB/0/0
X-purgate-type: clean
X-purgate-size: 3980
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 886C32FE8C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Add cmdline boot option "viommu =3D <string>" to enable or disable the
virtual iommu support for guests on ARM (only viommu=3D"smmuv3" supported
for now).

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/misc/xen-command-line.pandoc      |  9 +++++++++
 xen/arch/arm/include/asm/viommu.h      | 12 ++++++++++++
 xen/drivers/passthrough/arm/viommu.c   | 11 +++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c |  3 +++
 4 files changed, 35 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index ebdca007d2..3a1cc562c4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2855,6 +2855,15 @@ The optional `keep` parameter causes Xen to continue=
 using the vga
 console even after dom0 has been started.  The default behaviour is to
 relinquish control to dom0.
=20
+### viommu (arm)
+> `=3D <string>`
+
+> Default: ``
+
+Flag to enable or disable support for the virtual IOMMU for guests. Disabl=
ed by
+default. Enable by specifying target IOMMU type (if supported). Only "smmu=
v3"
+IOMMU emulation supported at this point.
+
 ### viridian-spinlock-retry-count (x86)
 > `=3D <integer>`
=20
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 4785877e2a..811e9312d5 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -10,6 +10,7 @@
 #include <public/xen.h>
=20
 extern struct list_head host_iommu_list;
+extern char viommu[];
=20
 /* data structure for each hardware IOMMU */
 struct host_iommu {
@@ -50,6 +51,12 @@ uint16_t viommu_get_type(void);
 void add_to_host_iommu_list(paddr_t addr, paddr_t size,
                             const struct dt_device_node *node);
=20
+static always_inline bool is_viommu_enabled(void)
+{
+    /* only smmuv3 emulation supported */
+    return !strcmp(viommu, "smmuv3");
+}
+
 #else
=20
 static inline uint8_t viommu_get_type(void)
@@ -76,6 +83,11 @@ static inline void add_to_host_iommu_list(paddr_t addr, =
paddr_t size,
     return;
 }
=20
+static always_inline bool is_viommu_enabled(void)
+{
+    return false;
+}
+
 #endif /* CONFIG_VIRTUAL_IOMMU */
=20
 #endif /* __ARCH_ARM_VIOMMU_H__ */
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
index 53ae46349a..5f5892fbb2 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -3,6 +3,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/param.h>
 #include <xen/types.h>
=20
 #include <asm/viommu.h>
@@ -38,8 +39,18 @@ void add_to_host_iommu_list(paddr_t addr, paddr_t size,
     list_add_tail(&iommu_data->entry, &host_iommu_list);
 }
=20
+/* By default viommu is disabled.
+ * If enabled, 'viommu' param indicates type (smmuv3 is only supported typ=
e atm)
+ */
+char __read_mostly viommu[10] =3D "";
+string_param("viommu", viommu);
+
 int domain_viommu_init(struct domain *d, uint16_t viommu_type)
 {
+    /* Enable viommu when it has been enabled explicitly (viommu=3D"smmuv3=
"). */
+    if ( !is_viommu_enabled() )
+        return 0;
+
     if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
         return 0;
=20
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 6b4009e5ef..e36f200ba5 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -105,6 +105,9 @@ void __init vsmmuv3_set_type(void)
 {
     const struct viommu_desc *desc =3D &vsmmuv3_desc;
=20
+    if ( !is_viommu_enabled() )
+        return;
+
     if ( cur_viommu && (cur_viommu !=3D desc) )
     {
         printk("WARNING: Cannot set vIOMMU, already set to a different val=
ue\n");
--=20
2.43.0

