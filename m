Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEx1FoLNgGkfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05591CEC7B
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218799.1527732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZf-0002iY-CO; Mon, 02 Feb 2026 16:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218799.1527732; Mon, 02 Feb 2026 16:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZe-0002aF-Ul; Mon, 02 Feb 2026 16:14:50 +0000
Received: by outflank-mailman (input) for mailman id 1218799;
 Mon, 02 Feb 2026 16:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZd-0000fY-1t
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:49 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49125299-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:43 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:41 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:41 +0000
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
X-Inumbo-ID: 49125299-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7AFB2EXmZwlfkDnOEU48M0PgyHZMLikUNlBjTgX+8XxbQDGoQsw+OCPAiUGPPH97G5QhGRmCPo6v7+eEvXGREiZUbEvqYlLNfiHSIOumByvAw1gCRRirMSGofFriE1+dQSfFMBDNUxjTuyFIV67HXzy5ho03v+8Nc3Z3iJxX/MleDODTFsUWbrGIGZxcEvkL/viOmWvEiKGbCwpVGy2uvxBquIIIqHs5MhjuFAQXqC6Ocusqh278ey/Q1R4hkjOMwCCrMylYZO/zO2CHZiyLkXbpGzMrHC2CpEAr6HbZKUi0/g4lUeC5WkjOzfCYQ7KCpj1df7YVhYkDfoZ+HT+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg8OEojnUM8CObLxhY04E59bfbesTSuUDg9HarbRfsg=;
 b=oJX7evKguxWVRLj7e5JzUErHxJnnehgmFB6jI/jt6nGowYFf6RDPeDpKolVm1u7Dp1yyKIUGer2LSE6ZlvnXKT1kygzQUcj0vUbB3aTYWhrS6J63qJf9bUm1MiGvrsgh3tEjCC8jL2lYoHzYDdddXkgjNNiUkGlbRVFS3dlZU/Blez972U+WSfqu1s5lH+2Yt8ve2BD4EeVr43gEgqRSHHjwlx/VAHwW/Qg2WrBCO9ViqOZj0DYnbWHKAH4CBenafIzhp7TEVvF6e+wZB9fIpA/9zej6WwynH0AUqTghUin6f6aB2g9UMMVEWFTwYE9Ta61KDbDoEPKuXbxNJK2KwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fg8OEojnUM8CObLxhY04E59bfbesTSuUDg9HarbRfsg=;
 b=tRSXn26CEPpQTd7C1dNo91Bp1JzMwpXv3Udml7z/DNBgYzD9gMmG2zM8fdmW74P8mua+0LE3yLCYee0tUqY0YDsB5WPlCWJ/GvotOBrFS61Qr6pnmKGjwUxhGMsvJJyheNxqazT5uYjYpUTSuN8WmsrogTjPULxOlK0B0r+8YmePAPoTuMxMLciBLKWEw3dJDRPdiiYIJnzKr0+W1PAYYr7YwfLSw6YcHRuJE5wfrpmB0VlE7BenjQ/HnSO3g7bIe/SWW/VSHkYTf+Qy9Pbe72VTrX8Xup2Yy5zIoNF4F+l03B7VJn3p2tnOrIaKIjsT2mPXOVQb6lG2GqWfjkx9jQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 09/19] arm/its: Implement LPI invalidation
Thread-Topic: [RFC PATCH 09/19] arm/its: Implement LPI invalidation
Thread-Index: AQHclF8IgoXxoZafSki7XLKILtwKow==
Date: Mon, 2 Feb 2026 16:14:40 +0000
Message-ID:
 <60272047f4da8cb962f1bde7074992fc2053ecf3.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: 5b51ea9f-7cae-4c1f-99b6-08de62762ba4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?B9jfEjvv0u7AbFU+XA9CoA2qBOBTbqVKvCMfU9HRK/l6Zi+NpUzKKMjsWl?=
 =?iso-8859-1?Q?OwlZiXmZLKxTixwDIepYEtBy/FE5p4yzHLf9Gev7PitiI7WpwsiCJpNiAF?=
 =?iso-8859-1?Q?07fo+wr6hbhQBAXkcC+DSTT5nrurRjwZJqPzMmInbS0dSF9kDQOEeUEDFS?=
 =?iso-8859-1?Q?n19zePRZvRBHc24pt50kk4v5YC9KeMGaNsxIfbNh7PmQE+ATorDxWanHP4?=
 =?iso-8859-1?Q?/5+wrRICDfWv5YZQr2JYtPU7e4iEQ+NSdeALK566JAeASgwWyw2KjKj4PD?=
 =?iso-8859-1?Q?d4qu+BE7RA58hU4wy0lvwJvA4fo/e7+vCXNra2GgtoNgq6ioWY9FEQkHCA?=
 =?iso-8859-1?Q?G9NDj2wxyj01GmoyfBgGAt4fZGOPirbWzHlv9Q8IIFMXgKMfZGCny1VnUQ?=
 =?iso-8859-1?Q?NUFnb4FhYjUCrJL6aI+E8MlGOqYTgOdytwNTBiSKRYNlS3NLoU11d7tsvU?=
 =?iso-8859-1?Q?szxfqBpd1YpjEQo/6F90XN4ukPjH+Gme70HtipSxr0R71cuOP2HqtwuVpw?=
 =?iso-8859-1?Q?R1i0IIJZqHHYxgC0LVSQEWjmymUn5kGsYo38P1rbuvh6Jhn0GJhHxnqz1w?=
 =?iso-8859-1?Q?4fF8VmF/40WtB3ECn6XQy5hzbxmhUBSjcG5KA2u0NoOFyMa9lekP09t8IO?=
 =?iso-8859-1?Q?WC5fAg0VrKUyR9SP4XV8lZdgs/dUMK4B3VLPbPYaHoAnFA7dTw2oDeKxqz?=
 =?iso-8859-1?Q?F3MLyQxIpodrNA1MM7VCXb0Sj+XcwZjRT/iJZsf0x/bSyJ6GTdtVVRNlAb?=
 =?iso-8859-1?Q?Ii5gdaMfOdlIy9qpXv5YH0NzL9YbiZlOqQ7Cc5UZEnOKtCMGY1Ku2C8map?=
 =?iso-8859-1?Q?f2s1hmTnvw4UO1c6d5NqtLSLF78Gplgq06UU3h2ZFWtP0Dq06O7zRqzs3a?=
 =?iso-8859-1?Q?O/WmGvXgwLqSdjOrcxjnhkrWcwegwxlfW3kanR3pL4InrmaB59eC3dv1Sf?=
 =?iso-8859-1?Q?Wd0EVIYDnXAiSr6TyflgrjH/XVhmckvDt1NXdXKsC5ceLLAiFhkRTq5uXq?=
 =?iso-8859-1?Q?B3+Vxvezuuna+cFRlTECiNASnF4ShfCZdGl192SSbm6ovGdGBZvSsjfWGL?=
 =?iso-8859-1?Q?+jA6J1MfjvY0qC16Dg44I2m+7FXDsHOO4O1n/O8xt04Vxaf7LWsDS+Y6RK?=
 =?iso-8859-1?Q?OdTBK2lB8wt4z/YFwqsFZDzBnneFmwOXXYbQaossplpeZ23S5HMopKxbGg?=
 =?iso-8859-1?Q?X7pOScaCMFtjfBKYM3xojVDzKhtl7bqFaQc3tvmuSFibnmHdgj6YoGP3vB?=
 =?iso-8859-1?Q?cGh7L47Uq5r2VzjaiasTypKxjBNQEwR+qwHaRhwQhZ4Px2QJCGk2gRPYrf?=
 =?iso-8859-1?Q?+yZJbqqLeWbZ27eGZS2APWi5jh7Ro57lUX6D0qf37KrIhYx7RVXY/U0ktW?=
 =?iso-8859-1?Q?z8YG4nUlERJL8+EXMZZQrY0vo8ou08kCKjMeFkHdmkVfHBiepd0PHsIGe0?=
 =?iso-8859-1?Q?Sqki/iJGkHxQYu+vNWzRBvDRf2/gxKAMHYBde99WUKBqxw6Sk6Fh5n/0TD?=
 =?iso-8859-1?Q?E6L27wXdpdrh2PGyqbdEemJiV5HtxhGOGtSgpl8rXg4BwEwmzJ83bGFHwr?=
 =?iso-8859-1?Q?su8/KZsuwM+7PkEAVWSiKJMYvZ5ZE/ApAei4j71GXXm9Fbv/5IUH50U37s?=
 =?iso-8859-1?Q?LiH5mPFozir+1yauP9BZCQmbjXE0obo3FVRWa7p6lBvJgBXH96e/G+WGHJ?=
 =?iso-8859-1?Q?pXJd2GZdspGLBYWaT1E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ndHFpPPUwIU/5tx3K958UkzEGfpSVHMx5ukHvb9FbDW5Q6r+pt2th7RJjw?=
 =?iso-8859-1?Q?gLTlRcDWfYorXtCdC2zSMhcHfLr0rkuIu7VV5cSjpDc8I091k5z6I7RWCl?=
 =?iso-8859-1?Q?u3Ywau+KVCehGT1odBC0gQHQS+g62q3mPs1VojE/mIl3+ba1ODmk6msshb?=
 =?iso-8859-1?Q?gmRxG/LiBYx1QkEPXh1HW0xRMyKUKZdD/a4Oq3CCv45uyz3HY270aDXwgu?=
 =?iso-8859-1?Q?a8QabV4P3cK0qtmy6PVMuGhbLyiPduPkgqPwMTLN0uGySjowTMxxtKdLrg?=
 =?iso-8859-1?Q?aFTE40ixT8f/+ZP0cbX7V4F5rwgF98IPQ+9FxZlq1QcpYBykPfmD2zpZ17?=
 =?iso-8859-1?Q?9RNZ+n6kL6iaLBoF09wAmIU/EdCJJ2OJ0wJdUJzOxksGak06+M2Eklgo5k?=
 =?iso-8859-1?Q?pyquCG8wiUMaeaqoTWOiCUyH1d5n/pv8VH6WeG2PASXUcw/z7dcNoINkjG?=
 =?iso-8859-1?Q?aEhDPyrhhMUI2RwJQk0luLArjgwuNXVKr0b5qZgKiNZ07g2h0sr1Qngqh5?=
 =?iso-8859-1?Q?S6JcYGM2JwpmqXqVb3wSGU7OdSdj6lKwd/BS10h3OdcCjT0g+PQ4FeSVz/?=
 =?iso-8859-1?Q?he5nuYRvPIBYh3EHwXFy//UK2iMfWajNg86MJt4SJkCLpDNMotQ8m1dELY?=
 =?iso-8859-1?Q?bFv1Oae37+c7PAjaGPHn2kYh9ErNLgqrmkWrHyct9ubZ/sj7hpmC7NHkDc?=
 =?iso-8859-1?Q?gnyie3Z8tz6v/SePxcwG5HvW4dD0JD0yItNFP0UFbqV00ChELFonXb5VtY?=
 =?iso-8859-1?Q?8sFFbzOgLkUUCqvCPl1oDltGXhVxEEBBTX4Gb8NsPuRbdsLOqKvsxNhUdK?=
 =?iso-8859-1?Q?SF4Yaq1v/H5zxJB/7x2gH7EGBOA+UePS0w2LsJgMhEfr4LLtzsQje8gQi6?=
 =?iso-8859-1?Q?zVW1pAWZ6ClblvmPZVNiqU2+C+b3KL3mfNEN1aYzD5Iz1trQRAeA6TITji?=
 =?iso-8859-1?Q?emKzEbDBBqT2aqXtCiB5/1ejLf48S3APcOZXvLhh4pc15p+fooRaad9NKm?=
 =?iso-8859-1?Q?02Qy4vCCFFb4awnDXKwhUBdRjhI/9vUSjXufNO2qKFbe1ByVAtW37pxb1z?=
 =?iso-8859-1?Q?AYcjSG3ziZQ7zrb/wqnwIitiDGmcqWX1OCKBCbbdx9aH+5WFqhpA+bZRDR?=
 =?iso-8859-1?Q?StN3LkanFnN9HeMgK5lnCukQ+t/+cC/rYnaDnCVbkqFEHG8KJXA8YO8opV?=
 =?iso-8859-1?Q?aAip3hj5iU8TELmvmxv7jvVd3fcpHu8z1QCcA8EcjW5JvXRsMCsADaq7IB?=
 =?iso-8859-1?Q?cgbJ+HGHCD0X6LCBQllYZWs8Xo2zenwlgNe3aY4lNkC8tQXaW5UZBoHWm0?=
 =?iso-8859-1?Q?h+p28samKifyrFxiFLqDfjvyMBtIyxlIyL0Mql5Q+dvD+71AZ4vd1filq7?=
 =?iso-8859-1?Q?iiprhttIY0W/bXQbC0YqeLTjDdMGAzOFworLW1TmPCLxdm6rBayiaT3XNs?=
 =?iso-8859-1?Q?4JpnZ0Y4bqRpJrzxi4opgDeRbAC/zqYISaxmoGQdIpHRuq/WrSxctrUYJu?=
 =?iso-8859-1?Q?9uIogiETEvILXzT8u2NJWKf3nLf2xuUMRtDBJl1KEHq/rVSIGuLGiDu4bI?=
 =?iso-8859-1?Q?QgFLAMwgr6RKcA/3lEynJ5Z2zUZcgj6mr6SyT+fFiGEe0aPQ3ynLmtbzlF?=
 =?iso-8859-1?Q?08TUmkQyHNb7tGZ6Jd2i+HPCt2a1SA59l6p4METgggei6wdSNPXzYQPfg5?=
 =?iso-8859-1?Q?XDfBFExLmeqimS26hlniEo5ipx8AGDI6ic8fy+eJbPgm1EwuJw0CMmReWV?=
 =?iso-8859-1?Q?rznTmKKNsN2oyHMRwJFE9qsOCPrAgea14oc0/9ZNedJi2XY2oLKQEtYP7u?=
 =?iso-8859-1?Q?Stkb+Hgp+siKsurMnE+nEVg+pvgdq5M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b51ea9f-7cae-4c1f-99b6-08de62762ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:40.7526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoPhKKZ4BWUM6fIiB/9xPnzM3sjD78IfmmIV7gf2qB/qCDZD7TRkllHOHkzWOyT4d4jryFMsq/ducCxZznQD3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 05591CEC7B
X-Rspamd-Action: no action

Add helpers for LPI invalidation.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             | 21 ++++++++++++++++++++-
 xen/arch/arm/gic-v4-its.c             | 22 ++++++++++++++++++++++
 xen/arch/arm/include/asm/gic_v3_its.h |  5 +++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 25889445f5..c628959f42 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -201,7 +201,7 @@ int its_send_command(struct host_its *hw_its, const voi=
d *its_cmd)
 }
=20
 /* Wait for an ITS to finish processing all commands. */
-static int gicv3_its_wait_commands(struct host_its *hw_its)
+int gicv3_its_wait_commands(struct host_its *hw_its)
 {
     /*
      * As there could be quite a number of commands in a queue, we will
@@ -672,6 +672,25 @@ static int compare_its_guest_devices(struct its_device=
 *dev,
     return 0;
 }
=20
+int its_inv_lpi(struct host_its *its, struct its_device *dev,
+                uint32_t eventid, unsigned int cpu)
+{
+    int ret;
+
+    if ( event_is_forwarded_to_vcpu(dev, eventid) )
+        return its_send_cmd_vinv(its, dev, eventid);
+
+    ret =3D its_send_cmd_inv(its, dev->host_devid, eventid);
+    if ( ret )
+        return ret;
+
+    ret =3D its_send_cmd_sync(its, cpu);
+    if ( ret )
+        return ret;
+
+    return gicv3_its_wait_commands(its);
+}
+
 /*
  * On the host ITS @its, map @nr_events consecutive LPIs.
  * The mapping connects a device @devid and event @eventid pair to LPI @lp=
i,
diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
index 9bbd0d96b7..358d0bffb9 100644
--- a/xen/arch/arm/gic-v4-its.c
+++ b/xen/arch/arm/gic-v4-its.c
@@ -290,3 +290,25 @@ int gicv4_its_vlpi_move(struct pending_irq *pirq, stru=
ct vcpu *vcpu)
     map->vpe_idx =3D vcpu->vcpu_id;
     return gicv4_its_vlpi_map(map);
 }
+
+/*
+ * There is no real VINV command.
+ * We do a normal INV, with a VSYNC instead of a SYNC.
+ */
+int its_send_cmd_vinv(struct host_its *its, struct its_device *dev,
+                      uint32_t eventid)
+{
+    int ret;
+    struct its_vlpi_map *map =3D &dev->event_map.vlpi_maps[eventid];
+    uint16_t vpeid =3D map->vm->vpes[map->vpe_idx]->vpe_id;
+
+    ret =3D its_send_cmd_inv(its, dev->host_devid, eventid);
+    if ( ret )
+        return ret;
+
+    ret =3D its_send_cmd_vsync(its, vpeid);
+    if ( ret )
+        return ret;
+
+    return gicv3_its_wait_commands(its);
+}
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index 75c91c0426..973ca6acdd 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -194,6 +194,9 @@ int its_send_cmd_discard(struct host_its *its, struct i=
ts_device *dev,
                          uint32_t eventid);
 int its_send_cmd_inv(struct host_its *its, uint32_t deviceid, uint32_t eve=
ntid);
 int its_send_cmd_clear(struct host_its *its, uint32_t deviceid, uint32_t e=
ventid);
+int gicv3_its_wait_commands(struct host_its *hw_its);
+int its_inv_lpi(struct host_its *its, struct its_device *dev,
+                uint32_t eventid, unsigned int cpu);
 int its_send_cmd_mapti(struct host_its *its, uint32_t deviceid,
                        uint32_t eventid, uint32_t pintid, uint16_t icid);
 #ifdef CONFIG_ACPI
@@ -267,6 +270,8 @@ int gicv4_assign_guest_event(struct domain *d, paddr_t =
vdoorbell_address,
                              uint32_t vdevid, uint32_t eventid,
                              struct pending_irq *pirq);
 int gicv4_its_vlpi_move(struct pending_irq *pirq, struct vcpu *vcpu);
+int its_send_cmd_vinv(struct host_its *its, struct its_device *dev,
+                      uint32_t eventid);
 #ifndef CONFIG_GICV4
 #define event_is_forwarded_to_vcpu(dev, eventid) ((void)dev, (void)eventid=
, false)
 #else
--=20
2.51.2

