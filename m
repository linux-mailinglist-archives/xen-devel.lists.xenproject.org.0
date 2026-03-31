Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDZGDOkoy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D63632A7
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268225.1557550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGy-0008M9-H1; Tue, 31 Mar 2026 01:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268225.1557550; Tue, 31 Mar 2026 01:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGy-0008Ih-D2; Tue, 31 Mar 2026 01:52:04 +0000
Received: by outflank-mailman (input) for mailman id 1268225;
 Tue, 31 Mar 2026 01:52:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OGx-0008FY-JT
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OGw-00HCrd-Vn
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb288a-e002-0a2a0a5209dd-0a2a4506a066-36
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:02 +0200
Received: from [52.101.70.107]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c2-3034-0a2a45060019-3465466b342c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:02 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:00 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:00 +0000
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
 b=Tdf9XitBkI14H2tsU4N1QD8g4ryqgC6y+oZzmsrAL7We3SshCEJb7rqkQbFb+qCVTW8ZXq4UfC7Rnu3uFPnaGyszvEYmkJ2fbWTjeOyLQUqif9ZbDTP1+bfsokEsH6xPUJ9vsSgBVyEoNvEU1tAx2PBjLuOVC8WbO6yCPVGk9pIglzZMELjOQrhbvUOtEHBfH70iefj7M1YoImNnfEbTO8u40JIczigCgBgZ3vlZitRw99f1BeFBmwdaDaNDpQdE8MFXmCIT8jZywSdjBLKLuAPIC0zakUGFRxu5GLjdLi6+wAzOuYDv6lJxkIHDguiexEgBG9ti5i0fKTwDkguozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU8GoKCw1duoKn68Ez7JxNbztNRn7RHZZ1LI+M+VqSU=;
 b=kJJrePJJcvO6sB/jKOiYqoqoeYrM3s/HSM88hpYK26NUWHHeTJhZA2fOj5Ei+RM3GUKAg8SoAjrblRooZiCEWzcRBXZJgO2ypj+ctuNJssynwpOHc2gW+RUZ0NfdlSoggLROfxGpcW+OLEgJtt1r4jDl+sgYLXrmhUFruEOVrKcT7eiVz3aNhMCeH+ea9onxKTLcQkn2JP8rL8LGl9ZZwHOO9iEfKJ+Z8Uy2Ud6N8NarM0DsARHaQlk6nHpiIa/uFLZNWIc+V0WKOECa68YdpqAnL8P7pWdBwR8wVSw868EvNxYD1kckBjd6gqeEwIEAeKdOrXyuyUo2tbwF5Qdb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU8GoKCw1duoKn68Ez7JxNbztNRn7RHZZ1LI+M+VqSU=;
 b=YJoizQ8plWYFJXHSs57K4I4xLrhnxv4U1ivNzp9yi/dnOF0nQL5TUkqImDD6K5e0RuOVAF1IMcrjPjZf4ppZX96nZIU29Wnzx1ZJsHhe/W3UnbJ+4DkeGDreRpbXO6pFFgXIUqxzgiqGZ9oJIVEHUjKB2usKu4kwvVSZcI5aPlYbYV4uPN+V2DxheIZMLx2UtRVdfJI/ughOMSfsoEoIHNtCXrHQ9AfjDBG59RNtWUJ0jEJlr/VNKnulXXQOPzV8BUWv/aURV+//P88bhEvaUYhm6nlR2+XBRPAw3xeiwUEnBelJlF7kQYZhuGQr8F2huzZIAMDJi/b+cSVN/ycpeQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 03/23] xen/arm: smmuv3: Alloc io_domain for each device
Thread-Topic: [PATCH v3 03/23] xen/arm: smmuv3: Alloc io_domain for each
 device
Thread-Index: AQHcwLD3sw7v0KnmckSgDcemNoDsCA==
Date: Tue, 31 Mar 2026 01:52:00 +0000
Message-ID:
 <78e4f2e2c68cdb75aa1c0dd7e8b456c03aa2fe6f.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 6399de50-5434-4554-d200-08de8ec819ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 PoirOyn4NVsexMnEfVij2wls5JJGvjdtCyxiqzFZNWye8Ryfxtgrufg4Zyi8rRhnD5LazJKpPMRdOxdOhxum5ylk0982XYW01GkhFia2hJU09Zh9Oi+eiYibcTZt/UD8NvwL53y8vkUhYfE+tiPu5yaKhxP8X9ruKPCI2aOtzqhXCT+lZESKoSR5Xwh0CwAnYjMbDIK6lLHsqFC4zION3R1UtARIbNe/qcZVrm1v/tvwgq7QxV2EkJyLPH3XaoUx13FX9dKdsoIZDOBF6HmGKyakQUeC7r4vi47eJCtwdJr9Yb6/NPHZTkKmmqYEBJttDgESODUbR0cFN05AYoZ35p6Ty5l4KXDaFA4nHUnbWN/PPSqSgpO9i2JOhh/mUD5nQ97zm/XMFVirUfOvQ6RaJGDBhJ6n5N//uKfRXUGouzF2a9gp2uYx/X2jkaYZ9z11LsLYGxkM7stPs6wNEmhyYeDUvzo9vgA8P5V/N8LZsdGyRfCRv4S7ivsJwjts3sfu1Xum/3Kylp5JeNM+5GIJixg6eqlWNfqC3NuwoAMhiLobLlAYyHuTJxf75wwj/4/Pr21lBYliwcdKfzUuMwzy6Qk52FKzwOcCEQDCg7PqSFR4tWUpq5wr2CoNe6rQ6xeyWaPbjCZj/XIcilCtZOgLOSQDFvjfO+A9aMupKtscaS3H4Gl+o6CKehSS0LiyW3kiDAhs6gXdtr3nxR2BlOZYdWKPiReOAN9TjzW48N7l4H4K1DeLV01ZNsWTo19U+ZB2qy8CBGCYHgGkURfO9SCPPkfIgQaRjzTSwmMtXE9Ip8s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?URmOYvyxG4CNLWla79U1QpbxlQmAwBE20J0h294SA75c5rM15BI7BQ7DR5?=
 =?iso-8859-1?Q?+YwoXK45033+hL1wCEBXlZT+nA3uyiKN2M/di035c+KIlhCkk9iMlxXbk6?=
 =?iso-8859-1?Q?7X16H12hbRBJ0m2Q+2CN+Oh9uMGibXsGIkSesLkHVnYdfQzn545IR40QHo?=
 =?iso-8859-1?Q?jue04nmLt4nEMLewcXSOq+YtBIeE5Tx7GGJB9qfM0L21nju/jeFz3XQr9F?=
 =?iso-8859-1?Q?n9oD99fGX3/mzvsnMmjgBRIoLP/6QoYhGUDO/OFxZabKGziEgD/rKGJK+m?=
 =?iso-8859-1?Q?q5exDQq24PlNjEtMbcSO4agBobObyMO5WeysDOTcNnYODEPxWIHSmuQKda?=
 =?iso-8859-1?Q?9Ebb8mdins4M3KljARaD93mrgaP0j3uTRLMoVflweK3/L8Jl87iTSYHVkH?=
 =?iso-8859-1?Q?qJzM1cB2cl+TOZdT5r7Sah7E6FhS8UL3m2HGAdmkbNTdqsBG6kn1L1cdk3?=
 =?iso-8859-1?Q?LVOVRadJnQmFNPBWpRd6dAn4i7pjC7igg2bCDWX3T9bpHmcLevzIj3k7KY?=
 =?iso-8859-1?Q?monrGK4oPGIEjg5zZAA1V9F0LSwI9PsKWJNwP2HC8fq7DCln3E/tZfZfrk?=
 =?iso-8859-1?Q?fGMPdr7AoKkTzN+AJ9zNqnPP8HkZdGP1q5E2RETaP9LdkJDkIpzniWeR2Z?=
 =?iso-8859-1?Q?PKdSJDjSDxrmig/Wj/9Mh09306JWXhzYimVjr2ORyhY8fgrgzWK3GVKOcF?=
 =?iso-8859-1?Q?ZgDT6qyuM6DetnVp/bgPzp/bbmERrBGxq8DDIYBbkqzTA9V0iK5FsWgQgd?=
 =?iso-8859-1?Q?PG3Fl/3+0+gylhIxJ40cQTU3R9D5y+dihKNBMXIpjZ/50hLKDVxr6BwES7?=
 =?iso-8859-1?Q?JCs2VMQtof6ORCwWMu9PQLImURydzegp1gpzK4rzrmB0ziZaoG4PSoonN6?=
 =?iso-8859-1?Q?cXEJitCw1uLmpgW48Xm3AhgReua+MllWhaKYW4A6Rna16fKigaaUNFe2CB?=
 =?iso-8859-1?Q?Iqpv6Kt39oTxh3S9skLe0+EDY0gQH9SfXa4VWq3jLuAWfykMLMKXKNrn/W?=
 =?iso-8859-1?Q?Cx+KAxRIhhLt54ur7bCD8bmRvPr3J7+8FZyd13+GSy/mHEJjF5HQdR+jZN?=
 =?iso-8859-1?Q?9IQckH2me/5snJAeMWPTyfadAhPYmROSUdjeY+Eagt8U+/L2qkIOa2TIvT?=
 =?iso-8859-1?Q?zPNUEvv6Nuj9iiCaFjzwPppCSxe936Yay2fhqMXdlVkIB4tMP1V3VFUs3n?=
 =?iso-8859-1?Q?J4HXVOiRRCrlh1CqJXoKgthByc+GW+ilqhITiMrP35y4m6lRWR/1vD++mo?=
 =?iso-8859-1?Q?/6mAjB0x7UiH9q5slaJS3oc35YGw9Yfb9xqdjQ1x7YApAcerhg1xxlFJJp?=
 =?iso-8859-1?Q?PjV/hJ7EhYzQ8PAZOMixPmuiPw8iuko8JvcVuu+aJbUc1bykjRKuY/WjV0?=
 =?iso-8859-1?Q?ut/NTzH3uBMfzf8wP1mN91QmhioKnjqtutzmJX71e6zvYDruRG+Z0rZGJO?=
 =?iso-8859-1?Q?6ngRmUzY2+JAfOKW7unxqMOhjKAg6GTRsw3W96PMCwQYLZpzqgkGKcJqBY?=
 =?iso-8859-1?Q?NLRLNQ5vjPaesQD6woeBu8gB1iIHoXDBm2BMoKpGfWtKbdSUzkbxX97gZR?=
 =?iso-8859-1?Q?ciubp+8VOAo7mWl50zmiKASxPel28Pkmi1guT5m0UEXPdfTtQagXfAG42L?=
 =?iso-8859-1?Q?5bhiivxKANftLh9JhLcw5Fhlau/TsfsxvHEz5SqFqZpMZwezqD6YjtwWfJ?=
 =?iso-8859-1?Q?MaRJHhmV3+0v5F0J6tyUxnjt1e34KtyAE7OWxpIMC2UssjcXbLczcEtNwA?=
 =?iso-8859-1?Q?PDmTixCXHSI2kgLodshlZCNT6XDD5Qqad9HF6Fk3FKX4hG4OBLSpynhb20?=
 =?iso-8859-1?Q?My+2YyqDAx78761TZsONecRs+DyLcJg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6399de50-5434-4554-d200-08de8ec819ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:00.8449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkekH/FYSPKw3mBw63YW1jTp2WcV7aL2iuMwWfeS9UaMcUxJxid3Tkntv5q+uR7DaZtmzLoAcJ5oA9KqkMUwYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-16d1c6/1774921922-817881C2-7B777B61/0/0
X-purgate-type: clean
X-purgate-size: 2159
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: D85D63632A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

In current implementation io_domain is allocated once for each xen
domain as Stage2 translation is common for all devices in same xen
domain.

Nested stage supports S1 and S2 configuration at the same time. Stage1
translation will be different for each device as linux kernel will
allocate page-table for each device.

Alloc io_domain for each device so that each device can have different
Stage-1 and Stage-2 configuration structure.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index f9c6837919..19e55b6c9b 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2809,11 +2809,13 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(=
const struct device *dev)
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
+	unsigned long flags;
 	struct iommu_domain *io_domain;
 	struct arm_smmu_domain *smmu_domain;
 	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
 	struct arm_smmu_device *smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev);
+	struct arm_smmu_master *master;
=20
 	if (!smmu)
 		return NULL;
@@ -2824,8 +2826,15 @@ static struct iommu_domain *arm_smmu_get_domain(stru=
ct domain *d,
 	 */
 	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
 		smmu_domain =3D to_smmu_domain(io_domain);
-		if (smmu_domain->smmu =3D=3D smmu)
-			return io_domain;
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			if (master->dev =3D=3D dev) {
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 	}
 	return NULL;
 }
--=20
2.43.0

