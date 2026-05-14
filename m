Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PqJFDfxBWq3dgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:58:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98167544624
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309040.1580235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNYSK-0007nR-U8; Thu, 14 May 2026 15:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309040.1580235; Thu, 14 May 2026 15:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNYSK-0007lt-QX; Thu, 14 May 2026 15:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1309040;
 Thu, 14 May 2026 15:58:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNYSI-0007lb-JZ
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 15:58:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNYSI-00DUIM-0F
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 17:58:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a05f129-5cb7-0a2a0a5109dd-0a2a4508a5a8-0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:58:33 +0200
Received: from [40.107.159.3]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a05f128-63b5-0a2a45080019-286b9f03dd2f-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:58:33 +0200
Received: from CWLP265CA0535.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::7)
 by AM8PR08MB6419.eurprd08.prod.outlook.com (2603:10a6:20b:316::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 15:58:28 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::22) by CWLP265CA0535.outlook.office365.com
 (2603:10a6:400:18d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 15:58:28 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 15:58:28 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB10642.eurprd08.prod.outlook.com (2603:10a6:150:167::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 15:57:22 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 15:57:22 +0000
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
 b=hCAN/GcUV2jkX3bBHKN+J/o7IEGF/vMtxO6xPWzt4qsSKhxkQOo5zG+SgaYSgG4HLZdHGO+PuSLZs3CvMBcZ7tXtxg4jFTv6s8pTHbJpC5l+iOBuKfGS3VozDa0fg025xa3LuHYFx3+4HxDgI3lj/R+ZW22mWjgebc9jXOfXTXmAdRNeGATqAevpaYJxDwI1YGCNtUVP7i4hjvfeA+YROQkSkfLfIF+iGBbCPtmnDX/PYtOyJ37OkCKod3u+iXaWW9rSoagmwHcy3DlbQEavraLf9owilkyZvxaq6DyjnbBWaYmDUK50PaZ7FJ9Hlf9EWU6h7csdiWsEnyy0zsJv8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciRlN6asEmFIavj5GiXh91TQSSOXozk9gGrur0OGMmk=;
 b=UgC/lMxdPyaN19sm1ScgtnJY2YbX/e3GJQ1ZH3fpiGwFxT4Bdc0pl/tJgSi5IEL4iBHo91Nb+92cCafixsK/7k96qeBEniUl9UPkwOBIYaCb/CIa0WQVbXa7g1mFeVk5M3W00yr/a1EVV4uGRPjNhsvL0y1i+h8vjim0dnDuqQjFQe9TZWiorNnqPuiVEyRpTlOym9dtnZe80tmSX8KZS98YlwEY3kt7rw2tCrdKcIysrXsLMSBdyuSC1TsPMSzjwTCE6MWUmJywrd27vo6NZ8SjEkiokBeAdm6FnvzUX55J2ah16bw/Hd3Uo9aH9zIpdgWPGdBWzeYgSm8kEPci8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciRlN6asEmFIavj5GiXh91TQSSOXozk9gGrur0OGMmk=;
 b=QL3sjXCyejHSf/Zt16CXC5S909ZreoajO1rPsBu8bOF+pm43H+aESm0Y74yT7Imn07mzqf1sG1WzYbrVaMK35BLlpdEzRQ315JgcTHND7aTZ12R9NPtQs1rY0yfC0zZIucCliUCEVdWyLtQPu42oAPqaEBma/qRzxYU4ucfVt4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI3KZzEybp2TkTUz9AmqwGDTA4Ml8Xo4EI2aZH/HT3Xh6ncVelO0vpLI6OrxjV5v7DDg4OUvz1w4HwJUwmkDCRAIk7uRmttW4iSB1/WSyuW4/Rhk8JJJXZfav92qUwIcN4bJ9/LGTV+MZNaSLRcvasNpagGUGj0NRCmMlcIMamSb4Aqr3Kc5q+bMMIt7ihjThsi8WoQ+HFA2ph1NVJ3rRgCKo7Gatv0B8ezt3UdJUvrDNaXUADwcDSQ0Naj3CDxEnLivhAO1rU+o+nEFg11xpajRvusBU8SXmcMO2nN90HlTE5cA6IwezpyuJ88OVkcGHtS1/LYz4z1p3FFPMgk8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciRlN6asEmFIavj5GiXh91TQSSOXozk9gGrur0OGMmk=;
 b=OJDnMUhsiRMqJ3VvaccldcblGuHsuMApu5PtOBE1C5doDKQOR6j3a/Lozgik4MssYz0dyUjXJgSWWSHE+S0GTUlIv3O7AxQQQjMChzpLbKYycX0wgK7OavYF/XVbVReaXDTOIpr39FKAQwSBRanWrHJ4QJZM8OnFmR8wv3cIP+aM6JBVd5RK8tiCR2l/kVaO+lDflQR7lh5Sgx9N+JfNCi6pQmcrJcwTgwSUtnP93rzkPH3Rs/EyyfDhOepD4diyFQGOMgrr+kODS6lR7VtnvrQai5dOdku1VXam3D8RUuGtJIchxWyxpPqxiLFUBbD7a29NHWAh/GiyIAPqOXMn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciRlN6asEmFIavj5GiXh91TQSSOXozk9gGrur0OGMmk=;
 b=QL3sjXCyejHSf/Zt16CXC5S909ZreoajO1rPsBu8bOF+pm43H+aESm0Y74yT7Imn07mzqf1sG1WzYbrVaMK35BLlpdEzRQ315JgcTHND7aTZ12R9NPtQs1rY0yfC0zZIucCliUCEVdWyLtQPu42oAPqaEBma/qRzxYU4ucfVt4Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Topic: [PATCH v9 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Index: AQHc4jI0ue/pVmX78UiKnsCn9gvTibYNsCmA
Date: Thu, 14 May 2026 15:57:22 +0000
Message-ID: <28587F96-D8A1-46FA-91B0-D9A30E55EFC9@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <4162aa58c351677a4a267fe85989c6d4e07487d8.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <4162aa58c351677a4a267fe85989c6d4e07487d8.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB10642:EE_|AMS0EPF000001A7:EE_|AM8PR08MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe94917-b55f-469b-74ad-08deb1d1a3a7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|4143699003|38070700021|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 N293/+BHEJpb6OQcKDTMn6ebqWS1KMZXacOe5Qa71iV4+KLsKs7eZHLhiVY6/Gmw4A3gUIoIdpPejnE8zNAfVLhCYEGdFbEaIlVMl3wEq1ubOxOZ54AZM0OKQMAxUWY5IJyuQuHUZGNGWD3X1u0zH64uw43B7enOHLQgEAY3wo04Xxhs0Fm8dgi41X8+G1r1Ef/FthWzXUv8w2Uj8MghVpPbF3WPo2Euee0iRFXuJQnYLxd/H2zGapyW8jJ9KKrB/LRGxzrI2GtsoMPWueyD5hb4T9Iw7yv7aftMqckdwmccbssmGXAnTYiw+stWeXk9UtqG3FNS163+1887rvK/4dJNQrd7lmt9qsqqDfoTAYZMj96QORH/DqJdzNl4+qhKpAeQsoY7jW4u/J+ymC34++hdp0fr5BzEKAIzIeacLYb82ny0SN+M5ZQfxTaz+/8bsrO49GxsY7BH6iFzhz8Miinnvs5t04NGtYNTfjszeKYTKjbJfeZRI9E9DCD/fDDQ48KNKrExh/p3TwO4fU9X67R1uwl/GIB6JDE/1gAQa+GRrDWqdGYz6A3kUXK7zxiT6vAxTk0PRtGK+6jJg0/WAisaByx2An02hPLefBRShJvb9j3CjI2ICc/dGJWv21/P2kqOvoE99+01x+fS0VZNukNOwu3oU0XMUqbWSObCV38c6KzocGgOEPmwy/5TFaBKOBqORku1PzZs+K5zu1CK63drT3dDtZiUuNSJv+/TX9QVfz90Qo+BxaBnetqTxIpL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4143699003)(38070700021)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <00AE0B921920E04283ED6B287C72C1B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 g5R0uAQ62xVQSxq0kj/aVwjFq9sBmnn+9xPMWwS1z6sJ90fJ5K1Ms46+Mw02r2ZBp/fQ+vO0mSWkYoJPTC/8xiRGeXJFs9UHTJh/q2oaIg/2HbgQkKuVH0JXaUXvrqBqYKYS+baA6JwbgeUOiNBu39yGe3U/OhWPpLPgAuWHSQ7R5yO2zA45xclu1+aCU63UZUPNTks/HxoeX8SqARuJuiZxkqTR/lKpBWRG4YT1AAbXE9u7DskPerg4R0WusiReRmPmwm4L3CpHZj2wamtfLS4MPcJ6pCUlSHmEbYeBcBTfOBe9By7fF359+2iGgt8HGa/1K9yEoVjzzvcH0jKNtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10642
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d1c1f4d-7a3f-4c17-e4d6-08deb1d17c18
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|14060799003|1800799024|82310400026|35042699022|18002099003|22082099003|4143699003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WU8NVxi1WouKLw9zJpOUcn6vPvdRKmUkw0DoyK6YrTnE0XhqM00ShsNTiUMar2o1RV/hQIzc+cM4eNMrhDFGwJvHQZcopVW1l08EN+yc2jANmhohzv8Rv/Ad1lvsOCUuQGhHe8GV3SrfmsUdTbghUzDnbs5Tujr3brYeRTS/jom+eFljKzSJ/dPE62CvSHyh2wEslbxQyi8meEHxtNR8fTMhuUoqiknSfgHMv17OIAa78q9r7fgVk7Xmi/rJagOwtcHBvNu6QvqCHXgw3O7hcHK4sz1FPn6ukG2zkmK1C/uAjVAnFc2muhrkRytaMDjKX5x3wkGbO2teXsJeQpmtKuADeyYutoB+rSoa1MoqhsWKKWp96z8dB3GB0j7S3VymgHJkMHQ9tvr8HBlXqH6a9pbAGk1iw4hrDSwnd5ewoa66VJRQBrhogMSR7rxJ3Q0hXtCv5YKmOoAaqe3O+FJQfkyQUzuB1lZgNugrlO+K9LD2EYHgG0BVdwH1MSAHX0/qV1v/Ur4R9wrVMurHVbP2Nwi0le/9UI0Ycqk0ToDx6oMsqLUaapPM1iCKZxX9X6ALFLxXtznNNmpBRstyMftwQCgi3co/I3E4mSQNwXtEGzdG402dokjvY68jJRfUF4KuxxWemLrhyrI5DD2/7luCZsMgo1BP5dXsl/dZFbIfoKMBV/OlhbdHYXIV3WReJ9lYlFho/J0CMTSt0OjJI635nuaub3YNgyyNWGDuYTL3XbU=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(1800799024)(82310400026)(35042699022)(18002099003)(22082099003)(4143699003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0kxidKem/lyxEleGlrhlCWI1Pk2Ra7MunUdd/lOMZA96A5gaB4BjTHcj4s4GDUMkiXSxuOaGVaARjIXDq9lU95fP7y8WgoUYbheAjHyAjSK8y+UC2nQ+Ip+xqQoGjBMrqwqXPHhKn5l2ZhRscf906iAJRnOCU+Xag5M8PQY5wD1ni8dL8buRe68V61hifRIR+64VY/InCMsgnwod+7iDsyGo9zXJaq7FbYWYwTthfK7qO0Dfzt967pw6aC5QvBZEr58iqtraQjGxZ1K2bb2iNktPHEpNxGXKw+riPcEyoVL+1JAHBLZc9UxoPvVBR8UCi70e43iRV1vkIwBZaRZ07kdEw3VyFsPKWXE4JeHLRrCv7rW9MH4RyBnkg4DEuoWMlAmu5OK0PyJG1hMPpb/8Lwz/dOQpp44kcxhk7BuulU31lv4P03sa97f+HVrtuoyh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 15:58:28.4155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe94917-b55f-469b-74ad-08deb1d1a3a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6419
X-purgate-ID: tlsNG-c1860d/1778774313-B6B74DB1-C138B942/0/0
X-purgate-type: clean
X-purgate-size: 6981
X-Rspamd-Queue-Id: 98167544624
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Mykola,

>=20
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index fa9ab9cb13..e1b47a5824 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -71,6 +71,8 @@
> })
> #endif
>=20
> +#define dev_dbg(dev, fmt, ...)    \
> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
> #define dev_info(dev, fmt, ...)    \
>     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> #define dev_warn(dev, fmt, ...)    \
> @@ -130,6 +132,24 @@ struct ipmmu_features {
>     unsigned int imuctr_ttsel_mask;
> };
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +struct ipmmu_reg_ctx {
> +    unsigned int imttlbr0;
> +    unsigned int imttubr0;
> +    unsigned int imttbcr;
> +    unsigned int imctr;
> +};
> +
> +struct ipmmu_vmsa_backup {
> +    struct device *dev;
> +    unsigned int *utlbs_val;
> +    unsigned int *asids_val;
> +    struct list_head list;
> +};
> +
> +#endif
> +
> /* Root/Cache IPMMU device's information */
> struct ipmmu_vmsa_device {
>     struct device *dev;
> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>     const struct ipmmu_features *features;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
> +#endif
> };
>=20
> /*
> @@ -547,6 +570,245 @@ static void ipmmu_domain_free_context(struct ipmmu_=
vmsa_device *mmu,
>     spin_unlock_irqrestore(&mmu->lock, flags);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> +static LIST_HEAD(ipmmu_devices_backup);
> +
> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
> +
> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
> +                                   unsigned int utlb)
> +{
> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
> +}
> +
> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            backup_data->asids_val[i] =3D ipmmu_imuasid_read(mmu, utlb);
> +            backup_data->utlbs_val[i] =3D ipmmu_imuctr_read(mmu, utlb);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_data=
->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> +            continue;
> +
> +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb =3D fwspec->ids[i];
> +
> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain=
)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs =3D mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->conte=
xt_id);
> +
> +    regs->imttlbr0 =3D ipmmu_ctx_read_root(domain, IMTTLBR0);
> +    regs->imttubr0 =3D ipmmu_ctx_read_root(domain, IMTTUBR0);
> +    regs->imttbcr  =3D ipmmu_ctx_read_root(domain, IMTTBCR);
> +    regs->imctr    =3D ipmmu_ctx_read_root(domain, IMCTR);
> +}
> +
> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domai=
n)
> +{
> +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs  =3D mmu->reg_backup[domain->context_id];

NIT: There is a double space before the `=3D`

> +
> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->cont=
ext_id);
> +
> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);

I see in ipmmu_tlb_invalidate() we do:
dsb(sy);
ipmmu_tlb_sync(domain);

Is it safe to omit them here?

> +}
> +
> +/*
> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resu=
me
> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
> + * through all registered IPMMUs performing required actions.
> + *
> + * Also take care of restoring special settings, such as translation
> + * table format, etc.
> + */
> +static int __must_check ipmmu_suspend(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_backup_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_backup(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +
> +    return 0;
> +}
> +
> +static void ipmmu_resume(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )

This loop has an ordering problem because we can run ipmmu_utlbs_restore() =
before
the root ipmmu is restored (ipmmu_probe() uses `list_add()`).
Maybe going twice on the list, restoring first the root and in the second r=
ound the rest
should work.

Cheers,
Luca


