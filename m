Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EpMOFax12kORggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B13CBB51
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277474.1562677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwx-0004ku-4m; Thu, 09 Apr 2026 14:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277474.1562677; Thu, 09 Apr 2026 14:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApww-0004gj-VJ; Thu, 09 Apr 2026 14:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1277474;
 Thu, 09 Apr 2026 14:01:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wApwu-0004KR-O9
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApwu-009p7l-3q
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13f-2eae-0a2a0a5409dd-0a2a450ad274-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:36 +0200
Received: from [52.101.66.132]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13e-ee98-0a2a450a0019-34654284bb10-6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:36 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA3PR03MB10964.eurprd03.prod.outlook.com
 (2603:10a6:102:4b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 14:01:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:01:34 +0000
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
 b=YQBSlquJ6sLIH1AEM91IajT/fKlV2joG6xtONqoofW7hfR9beDMMyGK784np027mSb94greTncRDPWeg3gtjymF3HVRCMkbUej2y19y66JXfN6qYsgVxNLu3df37Utmx5HIG0SzAFAD5JuH7dYOg0noY2AmUI6IdRL+Aka7vPkV2UkZE8LqYv7oh3rVwNxLNd0qLeGHI3p68gvafqineG/aGyJJ7EKjGoLtAl2dsSgMLO7x2DxvwNtxVpjFsChHnGanhFpFPSSQuBDw801G4pJz60Jdd4xLqQI4NiLxtMZnRP17AyevfRcEZbtvvTkvUKsQZNgj5EQo/K7tzE9ZbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQwkJTTGndgcvnqVacB6LNy0pUr21sbFJFr9TW4FdOQ=;
 b=TyYh4qTGh277DuIJBcyWUCEnjeBdb/wr/w6MVeV/vDOezL39av4RW871IorNnd1yMv6ahzl0a0WWenTVQWw2I6cZN9RNvOYX2OyHk102OQAJlqQPSWCSYwYokFeB2wzE+zRztdeklAlWCDoJzeb5SHlchkMJCjp+PykdT7pcsaNt2t4MY4TIk5TYwakB+A0kuQMY4AdQZ2443cZ1uomjGtXNiGnOc+ntZxm16HZxrdxgPLnp9uv+dM1eessT+WKRQIozpQOV6BbjaX1Bd46QmVHEcItA29DIVGtUd3a6ETHCOAC8ZYHtxBkAfhm8pA+umpfx+U998OVx2I7hksSUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQwkJTTGndgcvnqVacB6LNy0pUr21sbFJFr9TW4FdOQ=;
 b=ctNEyAYDDI7BRjMx7wY67oi4Gdxs/5MpU6Nqf6nJfa4T7isstI1GV4picuuEqM/PcqXyY12IIXPLd9AM0UnPRHrWX7FEvz+pNdeXdvM1n7HhaeKk/QqwBKiLXA4TVEyY8zlrTo/qG8raaBkNRAW8LBwvWlLNynVw8lNmPpPj3Q1vC1lOHmo7zt9ZdzGZZrbrTeW2Nq+ow1Lw3rPm3mrW8rlX9wA5hShcukfNt0ws4vWVZddGgqBhhpTNxZdO9vd6m3EL/8W0EKZByRrme2Y7sSMAQX5Wz+j81uH7bBdkZszLsgq4BfX7tlTfubJqn4XGlZ6s0rDKUPRORoFlh0icNQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/7] vpci: allow queueing of mapping operations
Thread-Topic: [PATCH v3 4/7] vpci: allow queueing of mapping operations
Thread-Index: AQHcyClfiKiYHZL9uEi4zPN+JRCyeQ==
Date: Thu, 9 Apr 2026 14:01:33 +0000
Message-ID:
 <97e3323363ab442ccb21a00d5ed0488b6672870a.1775742115.git.mykyta_poturai@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1775742115.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA3PR03MB10964:EE_
x-ms-office365-filtering-correlation-id: f79b1c04-2a35-405e-ba38-08de96408235
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 iQvUuNBanfGZTTbVzRyDDw7WoMfEoNUtRKK5mZCE6dvSmYLgMNLJNmOPeuDwvAEKTtxXCcxVpA7yngP4csDp6DFqV4roBce7k7OPEpb+VNV7QliHv2tmUrpp3YG73sWKXBgKt2UQsV8wYTKf/rknX1JVgTq2r8jPuj4Lqt4LbPEwoMq6NgNHYsa3mR7PmdBcw7mtRprpXw7iPyWBBIclImOn8yre1n+EC1zy/bKxaGPoAu7nW1lUOeJoG9NYAyGn5dtVQVeZ0XXuwFXk3RXzUdRc3ntV/Briutl4XdHjdQSJMG3hMszLOwgQJRiWA5QWKWTcu+d4Q51OT/ZjwluHEE/HI2tJo9ffdxowxkZ+Ey+G9ZIPqjwWIMHMFGt7OOhl49aRTsmC/+kMmrkKwRi8IoTpamkT4rFX9FFf36D+0KU7pt27/VFzTGMnHdd7DUMucDbOMp3DNS613F2DCUknBkyq2j1u2U+tVEBBzrQ4sjn4+pJwLysdU2tDvjOkwf5AHnr5dOin6adjN4JdVsSBlRcGyP+2v8Rq0nctTba6oOH5sICB+widaIakEFSQJZtu2RHgfcyDW7Cjeetil890NEymSNG8EgYnkv5S9chzmzzRKG6NKZ7od8COR5YXydSYypDyP+0VPiPkZuU6+gzny8aubdsB+R0+TPJ4vCWU48PGaBhmPNgYxC/vdDu6rn6KoaPTFNOeNCoNRT7YlnH0y2hBRrHFcJ1yrzzQyuolW3P/pIz2WGvMXANwQqWs1X/7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hh5FNQkgfqw0j7HEStPyn11p2OHckYJuOZ6/LVra2fnF7JQLycHwX1/v1n?=
 =?iso-8859-1?Q?pxCyJdeNsr2o31xsO6LJ5jx+9QHmb7a80Xoy5hxzjrS5nkOvedT0mebB4p?=
 =?iso-8859-1?Q?nVkWBP36pIHjAafo1Z8o65Rp02gO1UAcyy7p4LwWviMJw+999vcIM9qUzc?=
 =?iso-8859-1?Q?OU0DoPOlVtMV2FTw+7NjZylJFZzIMn2QaJwQ49Lqjqcr9svp2KktLGO4Bp?=
 =?iso-8859-1?Q?Kbeu55+29yvqirA4xk1bKaFi4RWLPU0idwEjbYJ8EhJSdbc8EmhN6Z1dKX?=
 =?iso-8859-1?Q?5Ky0e0CVmGzJGuBThP6/8E9fB0HZNYJ/vdqHOtMuy0o/YGH1edSf7sp5UX?=
 =?iso-8859-1?Q?q5SJNQKpvEnLkrKqVyrU1aU/usC7LNttmReIH314mMebViBZxUZ8/lgzEt?=
 =?iso-8859-1?Q?12N2Z4rONBvcK5Ra5f982KEF/NEtKPMy2YvcGG0x5+sSow95GO9kNadq5P?=
 =?iso-8859-1?Q?0jVKmlg6W7fv4S3lt+SPsxwklbDVzA/VIp5zUH9IP0fReu5oNxJQkValK6?=
 =?iso-8859-1?Q?Ge635FOjjn8jyFtLe5aTWiDbB5WFi46QbzZIeJZHMwI+BkwXotAlX4XOuh?=
 =?iso-8859-1?Q?Guei6dczzpdzBv/VI7fRT46/CJhtEnMqWbafq0oRkd5EB+PuCS0PUQjtmv?=
 =?iso-8859-1?Q?g1KhuuymGrRK8buZ9wrU0Dx2zCAhTNvWblHE/Sq5O0EzYo0HsFNU7K/olg?=
 =?iso-8859-1?Q?ETVlFBQmAdostPhgeJpyddzc74m4WbFXcJpJgX9WJ8ffHO3pWYWPdQEGrE?=
 =?iso-8859-1?Q?3LOSNVrH+k/D0vYXX2BVkp3RpOhfRtPukOIvWiAz8lnE4b6DHIGeeq2uQ9?=
 =?iso-8859-1?Q?5pORdGQor4BphCwrRY3zW3oZr/cNH9PMNhZ28GH+LrxdbDWhV9YQfdXtsx?=
 =?iso-8859-1?Q?dhmKlM0L/Sg8AXsXEvCTMT5F4f3tWQurM7pZPzXDzMCxD9FHue/Kf8Odhy?=
 =?iso-8859-1?Q?vjrJxOl4Uk9oOj155M0pIvNprX5zlLgwS6OnfR7CZPVeohrUArs5HFxbTg?=
 =?iso-8859-1?Q?qfQZn6V9wSF4N69GHVKFcyxxlB5h2NBOrICmTgk9Au3msllAilZhgU+XXP?=
 =?iso-8859-1?Q?pvRbbOy6zBUNW2uZoGO163tawsHIynmRGFeOxI7IupU9iaK6ObJ4AV9NU5?=
 =?iso-8859-1?Q?q1uYBAMo3CxzyeL1bVOhz1x0U8rcouWculPspxT0rY2M1KaEdbqZrUn8Wb?=
 =?iso-8859-1?Q?q+0tvaO9TXhc8/SGn44W439cp/acfVrvMWOqYi+uQmY5rkNU70JA68e9yx?=
 =?iso-8859-1?Q?h5rfTQp0Gg6XNr5BRqYu4hkWZjuCGC+oVSyoMVsMg1vNQZ8yH/wQ3pw7He?=
 =?iso-8859-1?Q?IkMpo5qF23GjafQtzAS1SASfmL04vJxb7pHaf6WHvEkCYwpnAaUDHZTgie?=
 =?iso-8859-1?Q?RfORFrJGT+4lWmW0UqVJ0i0MArZsfUb+r2wJTErqbLdh5d3/7gIJIhs7sf?=
 =?iso-8859-1?Q?AjIo/TSPjJhPIZXhWQNdfXvsz1+PU2B4+m02Q3tL2sjdw6STgErvPOryYS?=
 =?iso-8859-1?Q?bxMY7yMU42+RuYFSXHjUPxQcouZSRfy1X8z3uZiI2fJVzwIFBmbWrvotTw?=
 =?iso-8859-1?Q?vPvTtwZ1DWDMkDe0/yEquMVO81/YMfZf4wPx6mDnqTtM3aHEZ9xfYx3Fpi?=
 =?iso-8859-1?Q?sDXS6cHVH61AYOMcS+l9tYnr7hsL6PTc4A5k/UVbdU7dFk3cx278tN3zeN?=
 =?iso-8859-1?Q?zVhl3IC5OSDh6pP7C79UPoAbEaYFTB6V27C15DnS6/0epZ0byFLzORGyP6?=
 =?iso-8859-1?Q?WdUSCeJVWRAwPTck72cilaDtMQNXZrbh6LClsBWnm0ybesu6EEa1KRGm8N?=
 =?iso-8859-1?Q?1e4xZkrJLcaZv9H9MKhTx0RjLOqXwPU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79b1c04-2a35-405e-ba38-08de96408235
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:01:33.9435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8FagHfZBkVLGjLgkd2H5Gcl/wqByHWonaQBgqqvHo7Z4tFjCcUSLgou8oy1FS1IVQTONipQp7xr102DnTpHVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10964
X-purgate-ID: tlsNG-4011c0/1775743296-0E74F0B1-B148B212/0/0
X-purgate-type: clean
X-purgate-size: 19628
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0F5B13CBB51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Introduce vPCI BAR mapping task queue. Store information needed to
map/unmap BARs in struct vpci_map_task. Allow queueing of BAR map/unmap
operations in a list, thus making it possible to perform multiple p2m
operations associated with single PCI device.

This is preparatory work for further changes that need to perform
multiple unmap/map operations before returning to guest.

At the moment, only a single operation will be queued. However, when
multiple operations are queued, there is a check in modify_bars() to
skip BARs already in the requested state that will no longer be
accurate. Remove this check in preparation of upcoming changes.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Message-ID: <20260406191203.97662-3-stewart.hildebrand@amd.com>
---
v2->v3:
* new patch in this series, borrowed from [1]

[1]: https://patchew.org/Xen/20260406191203.97662-1-stewart.hildebrand@amd.=
com/20260406191203.97662-3-stewart.hildebrand@amd.com/
---
 xen/common/domain.c        |   5 +-
 xen/drivers/vpci/header.c  | 227 ++++++++++++++++++++++++++-----------
 xen/drivers/vpci/vpci.c    |  28 +----
 xen/include/xen/rangeset.h |   7 --
 xen/include/xen/vpci.h     |  21 ++--
 5 files changed, 179 insertions(+), 109 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5ef7db8f09..b1931be987 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -455,8 +455,6 @@ static int vcpu_teardown(struct vcpu *v)
  */
 static void vcpu_destroy(struct vcpu *v)
 {
-    vpci_vcpu_destroy(v);
-
     free_vcpu_struct(v);
 }
=20
@@ -514,8 +512,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int=
 vcpu_id)
     if ( arch_vcpu_create(v) !=3D 0 )
         goto fail_sched;
=20
-    if ( vpci_vcpu_init(v) )
-        goto fail_sched;
+    vpci_vcpu_init(v);
=20
     d->vcpu[vcpu_id] =3D v;
     if ( vcpu_id !=3D 0 )
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5bfb541b6a..451cdd3a6f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -23,6 +23,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#include <xen/xvmalloc.h>
=20
 #include <xsm/xsm.h>
=20
@@ -35,7 +36,7 @@
=20
 struct map_data {
     struct domain *d;
-    const struct vpci_bar *bar;
+    const struct vpci_bar_map *bar;
     bool map;
 };
=20
@@ -174,32 +175,20 @@ static void modify_decoding(const struct pci_dev *pde=
v, uint16_t cmd,
         ASSERT_UNREACHABLE();
 }
=20
-bool vpci_process_pending(struct vcpu *v)
+static int vpci_process_map_task(const struct pci_dev *pdev,
+                                 struct vpci_map_task *task)
 {
-    const struct pci_dev *pdev =3D v->vpci.pdev;
-    struct vpci_header *header =3D NULL;
     unsigned int i;
=20
-    if ( !pdev )
-        return false;
-
-    read_lock(&v->domain->pci_lock);
-
-    if ( !pdev->vpci || (v->domain !=3D pdev->domain) )
-    {
-        v->vpci.pdev =3D NULL;
-        read_unlock(&v->domain->pci_lock);
-        return false;
-    }
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
=20
-    header =3D &pdev->vpci->header;
-    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar =3D &header->bars[i];
-        struct rangeset *mem =3D v->vpci.mem[i];
+        struct vpci_bar_map *bar =3D &task->bars[i];
+        struct rangeset *mem =3D bar->mem;
         struct map_data data =3D {
-            .d =3D v->domain,
-            .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .d =3D pdev->domain,
+            .map =3D task->cmd & PCI_COMMAND_MEMORY,
             .bar =3D bar,
         };
         int rc;
@@ -210,58 +199,116 @@ bool vpci_process_pending(struct vcpu *v)
         rc =3D rangeset_consume_ranges(mem, map_range, &data);
=20
         if ( rc =3D=3D -ERESTART )
-        {
-            read_unlock(&v->domain->pci_lock);
-            return true;
-        }
+            return rc;
=20
         if ( rc )
         {
             spin_lock(&pdev->vpci->lock);
             /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
-                            false);
+            modify_decoding(pdev, task->cmd & ~PCI_COMMAND_MEMORY, false);
             spin_unlock(&pdev->vpci->lock);
=20
-            /* Clean all the rangesets */
-            for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(v->vpci.mem[i]) )
-                     rangeset_purge(v->vpci.mem[i]);
+            if ( !is_hardware_domain(pdev->domain) )
+                domain_crash(pdev->domain);
+
+            return rc;
+        }
+    }
+
+    spin_lock(&pdev->vpci->lock);
+    modify_decoding(pdev, task->cmd, task->rom_only);
+    spin_unlock(&pdev->vpci->lock);
+
+    return 0;
+}
+
+static void destroy_map_task(struct vpci_map_task *task)
+{
+    unsigned int i;
+
+    if ( !task )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
+        rangeset_destroy(task->bars[i].mem);
+
+    xvfree(task);
+}
+
+static void clear_map_queue(struct vcpu *v)
+{
+    struct vpci_map_task *task;
+
+    while ( (task =3D list_first_entry_or_null(&v->vpci.task_queue,
+                                             struct vpci_map_task,
+                                             next)) !=3D NULL )
+    {
+        list_del(&task->next);
+        destroy_map_task(task);
+    }
+}
+
+bool vpci_process_pending(struct vcpu *v)
+{
+    const struct pci_dev *pdev =3D v->vpci.pdev;
+    struct vpci_map_task *task;
=20
-            v->vpci.pdev =3D NULL;
+    if ( !pdev )
+        return false;
=20
+    read_lock(&v->domain->pci_lock);
+
+    if ( !pdev->vpci || (v->domain !=3D pdev->domain) )
+    {
+        clear_map_queue(v);
+        v->vpci.pdev =3D NULL;
+        read_unlock(&v->domain->pci_lock);
+        return false;
+    }
+
+    while ( (task =3D list_first_entry_or_null(&v->vpci.task_queue,
+                                             struct vpci_map_task,
+                                             next)) !=3D NULL )
+    {
+        int rc =3D vpci_process_map_task(pdev, task);
+
+        if ( rc =3D=3D -ERESTART )
+        {
             read_unlock(&v->domain->pci_lock);
+            return true;
+        }
=20
-            if ( !is_hardware_domain(v->domain) )
-                domain_crash(v->domain);
+        list_del(&task->next);
+        destroy_map_task(task);
=20
-            return false;
+        if ( rc )
+        {
+            clear_map_queue(v);
+            break;
         }
     }
     v->vpci.pdev =3D NULL;
=20
-    spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
-    spin_unlock(&pdev->vpci->lock);
-
     read_unlock(&v->domain->pci_lock);
=20
     return false;
 }
=20
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-                            uint16_t cmd)
+                            struct vpci_map_task *task)
 {
-    struct vpci_header *header =3D &pdev->vpci->header;
     int rc =3D 0;
     unsigned int i;
=20
     ASSERT(rw_is_write_locked(&d->pci_lock));
=20
-    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar =3D &header->bars[i];
-        struct rangeset *mem =3D current->vpci.mem[i];
+        struct vpci_bar_map *bar =3D &task->bars[i];
+        struct rangeset *mem =3D bar->mem;
         struct map_data data =3D { .d =3D d, .map =3D true, .bar =3D bar }=
;
=20
         if ( rangeset_is_empty(mem) )
@@ -281,15 +328,52 @@ static int __init apply_map(struct domain *d, const s=
truct pci_dev *pdev,
         }
     }
     if ( !rc )
-        modify_decoding(pdev, cmd, false);
+        modify_decoding(pdev, task->cmd, false);
=20
     return rc;
 }
=20
-static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_o=
nly)
+static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
+                                            uint16_t cmd, bool rom_only)
+{
+    struct vpci_map_task *task;
+    unsigned int i;
+
+    task =3D xvzalloc(struct vpci_map_task);
+
+    if ( !task )
+        return NULL;
+
+    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
+    {
+        if ( !MAPPABLE_BAR(&pdev->vpci->header.bars[i]) )
+            continue;
+
+        task->bars[i].mem =3D rangeset_new(pdev->domain, NULL,
+                                         RANGESETF_no_print);
+
+        if ( !task->bars[i].mem )
+        {
+            destroy_map_task(task);
+            return NULL;
+        }
+
+        task->bars[i].addr =3D pdev->vpci->header.bars[i].addr;
+        task->bars[i].guest_addr =3D pdev->vpci->header.bars[i].guest_addr=
;
+    }
+
+    task->cmd =3D cmd;
+    task->rom_only =3D rom_only;
+
+    return task;
+}
+
+static void defer_map(const struct pci_dev *pdev, struct vpci_map_task *ta=
sk)
 {
     struct vcpu *curr =3D current;
=20
+    ASSERT(!curr->vpci.pdev || curr->vpci.pdev =3D=3D pdev);
+
     /*
      * FIXME: when deferring the {un}map the state of the device should no=
t
      * be trusted. For example the enable bit is toggled after the device
@@ -297,8 +381,8 @@ static void defer_map(const struct pci_dev *pdev, uint1=
6_t cmd, bool rom_only)
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev =3D pdev;
-    curr->vpci.cmd =3D cmd;
-    curr->vpci.rom_only =3D rom_only;
+    list_add_tail(&task->next, &curr->vpci.task_queue);
+
     /*
      * Raise a scheduler softirq in order to prevent the guest from resumi=
ng
      * execution with pending mapping operations, to trigger the invocatio=
n
@@ -313,11 +397,17 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
     struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix =3D pdev->vpci->msix;
+    struct vpci_map_task *task;
     unsigned int i, j;
     int rc;
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
+    task =3D alloc_map_task(pdev, cmd, rom_only);
+
+    if ( !task )
+        return -ENOMEM;
+
     /*
      * Create a rangeset per BAR that represents the current device memory
      * region and compare it against all the currently active BAR memory
@@ -333,19 +423,18 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
-        struct rangeset *mem =3D current->vpci.mem[i];
+        struct rangeset *mem =3D task->bars[i].mem;
         unsigned long start =3D PFN_DOWN(bar->addr);
         unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest =3D PFN_DOWN(bar->guest_addr);
         unsigned long end_guest =3D PFN_DOWN(bar->guest_addr + bar->size -=
 1);
=20
-        ASSERT(mem);
+        if ( !mem )
+            continue;
=20
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type !=3D VPCI_BAR_ROM
-                       : (bar->type =3D=3D VPCI_BAR_ROM && !header->rom_en=
abled)) ||
-             /* Skip BARs already in the requested state. */
-             bar->enabled =3D=3D !!(cmd & PCI_COMMAND_MEMORY) )
+                       : (bar->type =3D=3D VPCI_BAR_ROM && !header->rom_en=
abled)) )
             continue;
=20
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
@@ -368,7 +457,8 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             gprintk(XENLOG_G_WARNING,
                     "%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\=
n",
                     &pdev->sbdf, i, bar->guest_addr, bar->addr);
-            return -EINVAL;
+            rc =3D -EINVAL;
+            goto fail;
         }
=20
         rc =3D rangeset_add_range(mem, start_guest, end_guest);
@@ -376,13 +466,13 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start_guest, end_guest, rc);
-            return rc;
+            goto fail;
         }
=20
         /* Check for overlap with the already setup BAR ranges. */
         for ( j =3D 0; j < i; j++ )
         {
-            struct rangeset *prev_mem =3D current->vpci.mem[j];
+            struct rangeset *prev_mem =3D task->bars[j].mem;
=20
             if ( rangeset_is_empty(prev_mem) )
                 continue;
@@ -393,7 +483,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]=
: %d\n",
                         &pdev->sbdf, start_guest, end_guest, rc);
-                return rc;
+                goto fail;
             }
         }
=20
@@ -403,7 +493,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
             gprintk(XENLOG_WARNING,
                     "%pp: failed to sanitize BAR#%u memory: %d\n",
                     &pdev->sbdf, i, rc);
-            return rc;
+            goto fail;
         }
     }
=20
@@ -414,9 +504,9 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
         unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
=20
-        for ( j =3D 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
+        for ( j =3D 0; j < ARRAY_SIZE(task->bars); j++ )
         {
-            struct rangeset *mem =3D current->vpci.mem[j];
+            struct rangeset *mem =3D task->bars[j].mem;
=20
             if ( rangeset_is_empty(mem) )
                 continue;
@@ -427,7 +517,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove MSIX table [%lx, %lx]: %d\n"=
,
                         &pdev->sbdf, start, end, rc);
-                return rc;
+                goto fail;
             }
         }
     }
@@ -471,7 +561,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                 for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar =3D &header->bars[j];
-                    struct rangeset *mem =3D current->vpci.mem[j];
+                    struct rangeset *mem =3D task->bars[j].mem;
=20
                     if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
@@ -490,7 +580,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only)
                         gprintk(XENLOG_WARNING,
                                 "%pp: failed to remove [%lx, %lx]: %d\n",
                                 &pdev->sbdf, start, end, rc);
-                        return rc;
+                        goto fail;
                     }
                 }
             }
@@ -513,12 +603,19 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, cmd);
+        rc =3D apply_map(pdev->domain, pdev, task);
+        destroy_map_task(task);
+        return rc;
     }
=20
-    defer_map(pdev, cmd, rom_only);
+    defer_map(pdev, task);
=20
     return 0;
+
+ fail:
+    destroy_map_task(task);
+
+    return rc;
 }
=20
 static void cf_check cmd_write(
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d069ca6d9c..ce9fb5b357 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -24,33 +24,9 @@
=20
 #ifdef __XEN__
=20
-void vpci_vcpu_destroy(struct vcpu *v)
+void vpci_vcpu_init(struct vcpu *v)
 {
-    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
-        return;
-
-    for ( unsigned int i =3D 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
-        RANGESET_DESTROY(v->vpci.mem[i]);
-}
-
-int vpci_vcpu_init(struct vcpu *v)
-{
-    unsigned int i;
-
-    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
-        return 0;
-
-    for ( i =3D 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
-    {
-        char str[32];
-
-        snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
-        v->vpci.mem[i] =3D rangeset_new(v->domain, str, RANGESETF_no_print=
);
-        if ( !v->vpci.mem[i] )
-            return -ENOMEM;
-    }
-
-    return 0;
+    INIT_LIST_HEAD(&v->vpci.task_queue);
 }
=20
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index f01e00ec92..817505badf 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -40,13 +40,6 @@ struct rangeset *rangeset_new(
 void rangeset_destroy(
     struct rangeset *r);
=20
-/* Destroy a rangeset, and zero the pointer to it. */
-#define RANGESET_DESTROY(r)  \
-    ({                       \
-        rangeset_destroy(r); \
-        (r) =3D NULL;          \
-    })
-
 /*
  * Set a limit on the number of ranges that may exist in set @r.
  * NOTE: This must be called while @r is empty.
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b55bacbe6e..e34f7abe6d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -19,8 +19,7 @@
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
=20
-void vpci_vcpu_destroy(struct vcpu *v);
-int vpci_vcpu_init(struct vcpu *v);
+void vpci_vcpu_init(struct vcpu *v);
=20
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
@@ -155,14 +154,23 @@ struct vpci {
 };
=20
 #ifdef __XEN__
-struct vpci_vcpu {
+struct vpci_map_task {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    const struct pci_dev *pdev;
-    struct rangeset *mem[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
+    struct list_head next;
+    struct vpci_bar_map {
+        uint64_t addr;
+        uint64_t guest_addr;
+        struct rangeset *mem;
+    } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
     uint16_t cmd;
     bool rom_only : 1;
 };
=20
+struct vpci_vcpu {
+    const struct pci_dev *pdev;
+    struct list_head task_queue;
+};
+
 void vpci_dump_msi(void);
=20
 /* Arch-specific vPCI MSI helpers. */
@@ -207,8 +215,7 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, =
unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
=20
-static inline void vpci_vcpu_destroy(struct vcpu *v) { }
-static inline int vpci_vcpu_init(struct vcpu *v) { return 0; }
+static inline void vpci_vcpu_init(struct vcpu *v) { }
=20
 static inline int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
 {
--=20
2.51.2

