Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKitJqbIHWpPeQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 20:00:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330D6239EF
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 20:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324080.1589762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6vb-0007L5-25; Mon, 01 Jun 2026 17:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324080.1589762; Mon, 01 Jun 2026 17:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU6va-0007Ic-V5; Mon, 01 Jun 2026 17:59:54 +0000
Received: by outflank-mailman (input) for mailman id 1324080;
 Mon, 01 Jun 2026 17:59:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wU6vZ-0007IM-6D
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:59:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU6vY-00BbZW-JK
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 19:59:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1dc895-e002-0a2a0a5209dd-0a2a450aa912-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:59:52 +0200
Received: from [52.101.69.54]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1dc898-56b3-0a2a450a0019-34654536517d-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:59:52 +0200
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by DBBPR08MB6075.eurprd08.prod.outlook.com
 (2603:10a6:10:207::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 17:59:49 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::f) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 17:59:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 1 Jun 2026 17:59:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VI0PR08MB11750.eurprd08.prod.outlook.com (2603:10a6:800:324::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 17:58:45 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:58:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t/OIqDz+garGRmZksE2+HGvNf8FOjafAhGK/O07zS3spNlIGpcyaYE54bO3RhQWAFlat5QqTxaBFZLv1J9a3QbjD43g53a9Cz3rpErTiJCpop9B/9tNI5Cer2gyYtO43hKRDlRzKSm6ihre72IoYvXVyCkLVywlJQnLHTUoRxDvwuf2pTnyonzLUC3MREUhlzkAmLWHlffrE2vhaOiZDD8Ijy4z5e1bgDaYKhSsJmb8AKL0485RZ/vXDeK6vdMrWuPlY+ZBD9PkHQE3a1g6zkR8wr4X9zLH9LC0+1ng2NJcnHAJlD6Ei4IxorSUj5rDYrkw6R8t/B120rYxTfuZLTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOAkbjw/97cFMPKBMWQnA3cSk4m7XxzWDSoxBQmqVeo=;
 b=JObaVKx+dKQLc4nP9xh8Mpe/GaL1MR6FtzCavbmjw5QNnR9UcUhqZNjyLtlpj7Rv1Iq6qXVNVwDl367iOGnGWc7AN/vIk+ClyBLE2COVAB99pFUVjc15HtUp/9BF3DANHc3hF9q930CIFx5HcJljKoD3QW8xcXWDlh9GPWf2VUTZQpdHR9CIocEs/c09vYWKqEs0jMZmLxV4+Cy+JbrSes6F55UiMAER5fkIgT2ZUq54OMzx9jUUh3Chnf0uK0NpIyUKIpI3yD+CHR/pi0NRis00qA6x6w97yAjLvMBk2VvI/Y/yIPo48G0D1cq1lSdq7nOwEA8nq1XXJSreD9RwgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOAkbjw/97cFMPKBMWQnA3cSk4m7XxzWDSoxBQmqVeo=;
 b=H8dTJkPAyzicFxkjpi3xwgBAtif1FrH+b5NeF/S0mv+fe6friQ9lMSd6erfk/3tJ8IxjnvGi+cQ+eTqS7vqZJS+GzaoOA3WGRHTyA4YCUSW0hw3qZ/kEOQTakobQyy4+WDIxuHmpafbaegY5NQ1SjRPgiQAd8YbQJxHiZ59skPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nz45iuFmrRSkA2cixckZn5VNTXGMgz94Xdrm0DS9/SFysuFSE9dPkXPOTqQwwMW3M2P76WA0QzKibB5PcJsifiqAl+yQtjy8KkwAhCfO9/xzOEkS4/t1t46nY23UPMOo8FzH0iL0XxXw0pUILzAXSsEYrQz/M8PaLAYG2hUmo2wizC1XT1Cc+30Vi5x1dzI7y0pcEYLbZbvCdj4NahBUHNRo+jS/d73SfoDwwJ2HYky2Gj5rWCLBcIlHOz4lseSBgZs/6MGPWHHDIzzzurkiDhsx+jKyiGOqJoRHEamx5YNHK+M0lQVppcnOnlbuaWy7yRVzQj/y7kt7UKNQIBLXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOAkbjw/97cFMPKBMWQnA3cSk4m7XxzWDSoxBQmqVeo=;
 b=HP94+TLWrK7cAvSb+61DNb/dBpdB7G/UJRGmvE+eHz4ivINve3PBJrDbFhFlZBuZmt7p1wCi0rG7dPUOqJxkdMNx64xDtJ2upKRf3pWyrKD2yNPD7+dB3Lg8HDBoykkM+hCJp1JVrnt353QVqlOM+CazEFsXLKBnuxqWRQJwMOlvfgM66YwOzl5poEe9aQAS6J4FHlkuoruO6ZC2741l/YaopbKKv8EB44WMuJlwYB+qS1CGMDEzIS0G5t0lUnIjh0EW3egFoeZXGsPWRCtA3bA0qY4PMwDsVrr9o4UM2ksAZZqe71QX2GE0dYri/tXtBk6nKZ9Pq2u4jQ+U6nLgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOAkbjw/97cFMPKBMWQnA3cSk4m7XxzWDSoxBQmqVeo=;
 b=H8dTJkPAyzicFxkjpi3xwgBAtif1FrH+b5NeF/S0mv+fe6friQ9lMSd6erfk/3tJ8IxjnvGi+cQ+eTqS7vqZJS+GzaoOA3WGRHTyA4YCUSW0hw3qZ/kEOQTakobQyy4+WDIxuHmpafbaegY5NQ1SjRPgiQAd8YbQJxHiZ59skPQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v10 10/13] xen/arm64: Save/restore CPU context across
 SYSTEM_SUSPEND
Thread-Topic: [PATCH v10 10/13] xen/arm64: Save/restore CPU context across
 SYSTEM_SUSPEND
Thread-Index: AQHc6UoJDjVka9AN20eljtAAqxiA5LYqDdoA
Date: Mon, 1 Jun 2026 17:58:45 +0000
Message-ID: <C9393733-6AB8-479E-B77F-7626CD88A509@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <f8f6c8c3ee4f8c4f9f528094ec289554ac9c05f9.1779385072.git.mykola_kvach@epam.com>
In-Reply-To:
 <f8f6c8c3ee4f8c4f9f528094ec289554ac9c05f9.1779385072.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VI0PR08MB11750:EE_|DB3PEPF0000885E:EE_|DBBPR08MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ac94fb-d051-4d3d-4b30-08dec00792dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|5023799004|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 bV22GOlfDeW/YvvUq0D1NpKPmoGpfaJhRg4O0uC8q4tbTEJEI8yO69Qry3S0H8cCw7mn/mSeeh0c4ABupz8VajBBNv8+sRSnLLsJGBtGt8BgLGbOUXwcbsFRkfP/oC6bHrB2FdQbdTErtmPD9c5rCa8YrCPjJyarFF/bWnAttx0kMJ5z6g15oqzu7FLZLRfJ/xqa/NHf9SXSlwpVZwMMAOGsoqxpM1FFv4aWK3G621Ihn9n/hbh0PPxPX+lC8gWRdEqDntT4tC3IiqJzqjs1jcHDo7WK3ECLBEgb2Vl7ngZpoAEkZEjikVEq66TOFaE6C0aCu5kwzlN+Fmr1MA5fbK6/Ed1UmbBm4aK+q/KeX1R9WoJabSqDQNnjZperE1ZM5zvU6SlNtyx+UqbaaE1FAQ9jcz91yHKWhcPSdtOphWI+iB5kVxl/SXNN1vldFD0FE3AlrK3vLBJspMd+szC6TN0X4rz+OY/ER73gnTDTXDeyMO051KMo1AuJX/jwaGM/EDy2DWh1p7iOVLx8CqlpcQPyVriDEZDAIlO7xqKsh6PPI0+WUGBu8+NIZx3Jb30OejpObIYt699PGtExeSwH4lBetNfOuTqaMnvwHaHEQickEHl1RehpSg7lnl6kAHoxgSyLbdRrNCRYhJPULggnfaE/X+CV4y+FP+LiPCVn/5E570bHtQoFmYEGLKAOcgc3OIgTuDWWe0zsiaSlTArZiUdDBC5pJIxxWIlNIudVbxZP1KfdOj2m+8b1DAtWZD50
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(5023799004)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <581C59751FEC814AAA6D6DD04B8B09E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 b80B0hm2/z4UzEc7Hgd0G7sAyiVd9bjtkLdTnF3IoK6Sz/XK3SEU++8B4TN38k0cHfWDpoNGdWnlMxuTcNmqyPZDTm8yAH8Y/4Ix1EVLC5uusjt8EsjD3Lg3Y+jcfBoSaAzBqi8QQ6pr5/eyf5v8IZUJbsq6IOGQAtXenRYE1fqnW9LkGSam2xWOCnhhMY7+aphV0CZ6Bw3xbUb3zCpk0/Ip0On5yVSbq0jp3ZjgUGT9t8E2/1BW5W0i5DnNC+Y3T90xmef/sDykkNQ9L3sk4Qy5pLdsBb5pmXdgfKrmxinOh08sji5Q+OZNy1O/VM53u26H/G91oyxLanX2vyVzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11750
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	766529d7-dd04-459f-0524-08dec0076cc8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|14060799003|82310400026|35042699022|376014|22082099003|6133799003|18002099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	CYiz0g/ufk9TGX+SVOYkYcW+65KcR+w7VNREciij1ZAXEkWzwmAYqb1wMTkjtSTxuwByTqOV+clD+YtDv6XNPKxtbk1LMC1JWKh4fCNefjcM7QEFUfyDdRGQhwU8WKH0G1+QPYlIiAEKCBbjTRvsgohcGcP4IvC1dsK6FYT/E1KQUkMgeaZcQnFAnu5wShaKDPMpE6eL2xYl/aTfoUsSQJcRqBDsKwQL5yrGmNGZJYpsHlLwEI8KS9HQf6ecT5sNUEZqR1Klj/McMO+IswlQRREqftwvBHjY0TkyfWEWKBf4g3/pQOMRuVBxOAUpkZK2AJ+ZyDmbbkYkR+2hjk3V/A/Ba8cXloCXjWUDnyvxMWfDeRQ60IgfDW5/aiRcBmJCygaJAmccUS8uCIP+U7XfFjBJOu7/BvKHMJMRFxplTa9imn2dqanTaLX2hkk908W60bmoKjzlC/Ll+kmwqaHlrqBcgkxEPZ/naEbn00A8fCbzPHE3dS77KDRj6Kf7WLsgJLAgOfyAsgL8AfO1FRmTO3u06jpW4RYMA0oKGkL4gs4lEkqZJ7k17NPi+oRxe4p3pVp6Sz5kdK20oA/AKr4Fxjb/+kzUrwUK7bBJP+V/6A4mbzRPJjfUm+J0CpAccwsCwMdU33nmD4Ik3IH25V5oFG95GbtGOVV1slOzJQBpEkq71iCbvxeODd6DPrAAPqsDgzUKs+BZKb2xaaKBd1cy7QJvIDgCuQqBpS/yJOYaxtE=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(82310400026)(35042699022)(376014)(22082099003)(6133799003)(18002099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1g/htBd6m7MmeGhxsuBVO4+TWfcTkpipgVvl0J0jtYPnm+mcNbF5miURGt8l4QeMjUBd9KiGe74niLtSl+8juQEfKwcW3kkVOrdUQBVIZqo7AOMD7iAz+FQLW53/xGn0am6edcoRikfWJVioDIv7J2G1LWUxc57XgDWncuKzgI22yJeODcaXuJWhjJGUTJ6Sw548ugqMZeMzBqItIOpHMOIjMaMG6lfx5+TJpTTI0/5Ah5SRfgvNNC19CBzrDEh06Z4c3SA3UsoSO5olThLUOLYZj/W6Ak9RU9/AO+qjMsf6vW9mSFfONVr9+MO8mC/14FF3WEbWuWKn/o/1QN6fSZKQZ/sx6F3pa0oHnOZROQ+wJtbUEpQ1D/zFyCvlbFBa28YooLAKgcoTPFI2t6pURNDdAyqmvUQnEWq9VzZlDDL1jsTtKhxFDHsR4iZZ/7uB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:59:49.3498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ac94fb-d051-4d3d-4b30-08dec00792dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6075
X-purgate-ID: tlsNG-4011c0/1780336792-7E78F8B7-FF76BCF1/0/0
X-purgate-type: clean
X-purgate-size: 1939
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksandr_tyshchenko@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,arm.com:mid,arm.com:dkim,xilinx.com:email]
X-Rspamd-Queue-Id: 1330D6239EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 21 May 2026, at 18:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> On wakeup from PSCI SYSTEM_SUSPEND, Xen re-enters EL2 with the MMU and
> data cache disabled. The resume path must first switch back to Xen's
> runtime page tables before it can access the saved CPU context using
> virtual addresses.
>=20
> Add an arm64 hyp_resume trampoline that reuses enable_secondary_cpu_mm()
> to enable the data cache and MMU, switch to init_ttbr, and resume in the
> runtime virtual mapping. The trampoline then restores the saved CPU
> general-purpose and system-control register context.
>=20
> prepare_resume_ctx() must be invoked just before the PSCI system suspend
> call is issued to the platform firmware. It saves the current CPU context
> and returns a non-zero value so that the caller enters the physical
> SYSTEM_SUSPEND call.
>=20
> On resume, hyp_resume restores the saved context, including the saved lin=
k
> register. Control therefore returns to the place where prepare_resume_ctx=
()
> was called. To avoid re-entering the suspend path, the restored path sees
> prepare_resume_ctx() return zero.
>=20
> The assembly save/restore code uses offsets generated by asm-offsets.c
> from struct resume_cpu_context, keeping the assembly memory accesses in
> sync with the C structure layout.
>=20
> Support for ARM32 is not implemented. Instead, compilation fails with a
> build-time error if suspend is enabled for ARM32.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


