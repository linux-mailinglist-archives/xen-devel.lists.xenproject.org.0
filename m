Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPVuL8Ad8mm/oAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:03:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5549679F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297474.1573486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6RD-0005lH-QZ; Wed, 29 Apr 2026 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297474.1573486; Wed, 29 Apr 2026 15:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6RD-0005iG-Mx; Wed, 29 Apr 2026 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 1297474;
 Wed, 29 Apr 2026 15:02:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wI6RB-0005iA-Ir
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 15:02:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI6R9-003Ihf-07
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 17:02:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f21d93-5cb7-0a2a0a5109dd-0a2a45079914-20
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:02:51 +0200
Received: from [52.101.65.43]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f21d9b-229c-0a2a45070019-3465412b8ab2-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:02:51 +0200
Received: from DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) by DB8PR08MB5322.eurprd08.prod.outlook.com
 (2603:10a6:10:114::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:02:47 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::a5) by DUZPR01CA0030.outlook.office365.com
 (2603:10a6:10:46b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 15:02:47 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 15:02:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB3PR08MB8986.eurprd08.prod.outlook.com (2603:10a6:10:42b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:01:42 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 15:01:42 +0000
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
 b=KDCUOSmfmIOAftBI2DrnNnlfjbQJ8MSPEbbvdqHPIKy+Na/pbXVgPSkuqLXQoDaVjJimZC86G+LVAvzwXb4aSCAmW18LU43/VrsI1O63iyu3oLg9Ffl9QmxGPDaGgLbvmWp3ECe8KC9uq28wqFu3209D6NAJwHOWig/2BL9D8nYJJiJVzyncp9gIj71kyrLiwxwaERhJnpv+Vc3SLVd0gAFGXZYon8jfoLmxDFKrnX5XKoS8/O3FtUtnjdq9FNUj1rGKmaU3W1nhuzqxy3EVoFoGfk4GJxs9SkfWNGSSfvsG6kOJQS97momQaxU2h6dkWc4s/BZbUqMQyU41Vwqgzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9g9N2GMis8fI6Tuw4uPKtWmeSCOQQl1uVZlMUHpOi/o=;
 b=oOE7I1na09nUZG10icFiWYm/SXFfw/aqcPAv6b4fL9rv0dmMtZOuNKGApMooxr/KjyT8jtebdH2cMWXBL9wahjJRLB15bW9vG0Uq1JV6DKc1OXVUGMz/WkgXW0RYSxEKq2OSr22Ta4UVxkNgx5CkUrborCzC35Dpp9EjavZGuyu8NoaQw63frWy3WRkXAb6lKh2Cd/+jxoDgmvICW93Sv6ZpPKwONkkXJHGqZIi8/bmddsPfg/ALh5OFxIkzDtZM/RxUKJXlTjgDloupxfRAFy0hae8zORrPIFZxPiXIDSsEyHpTcyZZU94YPEwPbNLp50MVId6N4eY1rxsVZX4etg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g9N2GMis8fI6Tuw4uPKtWmeSCOQQl1uVZlMUHpOi/o=;
 b=WWIXyGnYA6S35tkLwcvbL635ni5p14Db/ciKDW80M8yDAB1+W/56UVCf77O8j9IxhROHl6QShqvvWO0jLhbimB6X+j0oEbqx53Y8zpA3vdgqchVrlJMnPkL478vA5Ruqqt7CtygML0esWS17s+6b0s2NZMOcxOVSMQGiM2Jfb9Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8FN1wUDR1Bw/lXiyLBQhdjLIfRezfKtWtaxxj2Sg9NAnU+oZtvw1K4YpYqstHgZRIu+MmoxUoVhKxRaaqujEse2qRXsbw0M5I/U8J3wSSwEq+/+UoQZYPH+juEdJzhhOtp3L7G1tlRaZ7+RmoikBWI9Z7lrfMwW6n7vLZAILRymlp3j8zfU0jr4ONOA+tJHrEBj/I5WuQj730oUoOmfAM7/96FzTzPch+UZimD4OWyikxqDb9RTrE2ihHO/M7e/YHbVHGV377WhkT1e3ga2sY8L+1rSaz2GEBZcTBeRGIwsQa4LzDRFbMhlUDj5JyRF4sDwDcmqU3O3ckITAn+AKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9g9N2GMis8fI6Tuw4uPKtWmeSCOQQl1uVZlMUHpOi/o=;
 b=y3Sc/ld3wYNF6AhUcndndfFPo/ix4E6eL9yDxSsmlhG8ix5iHZRFwPKI4YbtOswASR3Yc+82GDlKMqJikThs/MySiSE7UsCS6JV9Qni1UWRJhvviJUBi1r3CAjuPc4kzNg9JgmiJkhwmBNNuytvTPu0OxH5sRaHFN5BcTTHhbaxiKlVkkWSS5Go7504dwZq/LeK+Q2T5w22AuG40R8UPRoWqRpdr0OPT38oNUr+Oma632oXgHcfm6+S7iNkY1RsoKffQz2/S1iGd2vDSKEsce72ci8CfnxpZSzPjeYUO87ZwhnsYEeCWUl6TxmYolOUOAkK6Aq5IIwO/hcYeLjC56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g9N2GMis8fI6Tuw4uPKtWmeSCOQQl1uVZlMUHpOi/o=;
 b=WWIXyGnYA6S35tkLwcvbL635ni5p14Db/ciKDW80M8yDAB1+W/56UVCf77O8j9IxhROHl6QShqvvWO0jLhbimB6X+j0oEbqx53Y8zpA3vdgqchVrlJMnPkL478vA5Ruqqt7CtygML0esWS17s+6b0s2NZMOcxOVSMQGiM2Jfb9Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4 03/11] xen: move declaration of fw_unreserved_regions()
 to common header
Thread-Topic: [PATCH v4 03/11] xen: move declaration of
 fw_unreserved_regions() to common header
Thread-Index: AQHc1xwVjOxLpqMzhEOO6rs5XF40z7X2I8+A
Date: Wed, 29 Apr 2026 15:01:41 +0000
Message-ID: <3C789DAA-D1EB-4EA0-AFC3-3BC225BACACC@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <2c26370460f0380bed128cbb59de4eacd77a8456.1777303844.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <2c26370460f0380bed128cbb59de4eacd77a8456.1777303844.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB3PR08MB8986:EE_|DU6PEPF0000B61B:EE_|DB8PR08MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: 955788ae-f57f-41e6-94a4-08dea6006029
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 UvkQGqm7DZuSWGPlig4Ee9BdqiTDj5XKWVI2uIwE8VQIV8vG0U1UzB1hMFjJwQFDEfTGpR3/D0Rp+uNTmCRv292lZhrllyVPMMzEDOzvP+F/cT7K7mwJkIczBXus5u5TB24xunagYWrxZQ90os9y9RGStb11mipCb0uOsWTsmTVsg36usD1bSLnURNKJWSIhKVJE6UX0CvNG0ciLunXgDBvONe5DP5HiwvEZZHBS5zDpmbS3i70jCpAVu6BqFHfmkZQvxI3kPIeffXaGdQP65rjBcCCxdudqYS5pURmhnU3nJxp7tUAhdzv80ji8T4W9X9I4TqeLbJGJaPIaO9X2CN8h+GamjUC9+1Gedn7QJ8s36/rYIU7HDWYcDDMPd+joxUcIzXisgqNfESLMD/phAKvnNbNr2YLJIlrg4Hkf08FgxxVPdaPKVdT8GRy1Q4fOqIkYMvKe5+l9UT+6X4BaWIktKScn+yvyCj0CgRL75j5nbFocTF8g/bce2a0muSVWRaTnZ2PDd3lwI8Ndcrnv6l8B41EQIrqiLJ2lAO3vxIHRRnWsmTu5CibHXeBmktRpnbH+QYvOLFllpeGxGzSWh1T5+XA9ujfE+TcgSNHUkWbMKxhThjwNy29472VuDvKBAP1glloXMqyMa6zc/S4tPAyiIpOZK6bP926UnboGv5W34onGybXkZTomulpHVEBpFZyWovwcA/jFFX/Tojr3eQtp9y2NmBOqOZgOM79eqgUKtNZ5L2IRZ28w4yBPCEcBd7IcwbFwZuRgYY8PCr30Yu3qEQW/gd0akOPlawQII1g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DDEB8C2394A3A44F9FCBA03C706228E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 PJLtewidKDcMDr72GtLjJp71/pEXez64NhI5/xfJnKSjq8UEDozs1WKiu0t2XjdU1uNmXxqJTv2b8KN88QBPtfA2/rmvIHDd3S0A6oeCGKJUSPhdwL+8tdCbXIw41NSTXUH1IN3/m7Pkb8tonvAgwit0LdTlgIMcFS6XliWS7Wd154emZD05D/fXJlBxbWA557ykIIcHdoF5Kpnw5UVbvMCCu5re2eqKrVxUwB7JAuWeR70jZLp3NlzQoQT76FOdxeCGsERkP6EM63Ld2piJm/IDm5Ha2YU+fnxb7JWjws+s3lTt/0MmU6Rfsy7jD9F+yNQhi4f5n3V//vycWkfDBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8986
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa3cb5c4-ab76-453d-0f73-08dea60038f6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|14060799003|376014|7416014|35042699022|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jngf5z0k1T8s1kUCA1zz9l6V05Od8C2aXH5A3i5dSZrnU5W9qmgnWS6dMBcca2zmJANp1FRB4iBycOVS1K09PuAyUuqPy7WzC9tySHVdPMK68xDDha5aSriV0WG7gi4IM8m9ojb+XSeB9DPF4C+HUKFl79yHA8Pg/TKm4C+wS5vIzfd6wHaYGXU+exTCLE4ciDUN4iyhZYRSgrH9fle+UwdwzK4BE1BTrhPzlX1QqKlsZFPIePII5pwJT6N9aToTy2qWzqWia/D7J1eNb9mIJCh8iHUNcJP3WIrE5UYfKgoYgh4TcFhEUWyoZUIqAKTkD5PbjCJmtBhwzzHJBYjP8ZsTUmDvfJtwWExfoFroeKhSoFjrS1gzw+Iq69WGSVVaYFPeA28ikg9Wah6ytGE7XeNDMFlo11WTB4PvVp6AeCQsusytoA2d1HcuhoJmFMp2p7dJKjCh9pQWt2ucpJUg1XbXwLX/3sUYrb6wPVQJOC9rLpf51lHpGg47+3ZP3zZqiXVcK7E8tY8RbJxg4WJ6hys1CL/Lg3aiUFVy22mKC8krwAnG0nyArq8UdTMIDwGh0DCi/HjNldA8V9Xa/JHOqgGFWBZ4MZKr5ihudLcmDdpwFbquhrz+r9Xa1qQGlCzUrhaavyWCXRzp9IEKBU9Ql3d5P0QGTM6uJXf2m3+9jptQxwwEIiZYp1TYrjLSpEY566rqyE8H2qYnsoltHAdVDvmc/nV4BTVdeHzXH+GgLWFsVszdaHzHl0+GywS6YYjs60qTvIyMA8wkavynHdSqmg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(376014)(7416014)(35042699022)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sqA9rM47fKbWVj/99x9ay9aNg086u39YB5W7xRE2rLx1cXLtAJ8KSFaCXw2c5l03vPhyCCq80d4cEFHepsEnb8rsFrH7n/kRIAe5+yp691uIAbiJ6l+v1iElU7AONYV24EC5LS90U5OR/5RWL9zSFK50tE6JDc6WpTGX4B7zwYBG663bLaydYitgcg2t1SACNkG7f5MH0Y0YAdhk6rnnH2essLXTAmOHF1w/ITbpzqpCgwl2LrE87ZBNVlgkNQdbb5OqcVhKrCw17tTlpHDanEA7+gcIbRpePF7SbMNEaLseP0AGpMtH3E/UCfppBv7Nzng+j2KJJLd2z0BZpXWNI47xY2duO/KnEFSUDOcvy0jFpCHSQEw5+QdVtHsIEdG8GtUE4HhgsnnZx803Yfvgxxj851mPDmehe8nXkSZo4Nv64YKBh26ReT6zVIHkU0Pa
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:02:47.5694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 955788ae-f57f-41e6-94a4-08dea6006029
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
X-purgate-ID: tlsNG-ef75cf/1777474971-AC563C48-8C408DDE/10/73395122804
X-purgate-type: spam
X-purgate-size: 467
X-Rspamd-Queue-Id: AAA5549679F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.68 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

Hi Oleksii,

> On 28 Apr 2026, at 15:33, Oleksii Kurochko <oleksii.kurochko@gmail.com> w=
rote:
>=20
> Since the implementation of fw_unreserved_regions() is in common code, mo=
ve
> its declaration to xen/bootinfo.h.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2-v4:
> - Nothing changed. Only rebase.
> ---
> ---

looks ok to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



