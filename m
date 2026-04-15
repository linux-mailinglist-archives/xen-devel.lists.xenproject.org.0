Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABJsLAmj32miXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 16:39:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE54405676
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 16:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282576.1565138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1OB-00064l-0i; Wed, 15 Apr 2026 14:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282576.1565138; Wed, 15 Apr 2026 14:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1OA-00062V-UE; Wed, 15 Apr 2026 14:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1282576;
 Wed, 15 Apr 2026 14:38:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD1O8-00062P-SM
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 14:38:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD1O8-00DRci-0b
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 16:38:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa2f2-e002-0a2a0a5209dd-0a2a4509ddb8-10
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 16:38:43 +0200
Received: from [52.101.69.63]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa2f3-bf79-0a2a45090019-3465453f7fb8-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 16:38:43 +0200
Received: from AS9PR06CA0159.eurprd06.prod.outlook.com (2603:10a6:20b:45c::26)
 by GVXPR08MB10476.eurprd08.prod.outlook.com (2603:10a6:150:155::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 14:38:40 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::b0) by AS9PR06CA0159.outlook.office365.com
 (2603:10a6:20b:45c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 14:38:40 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 14:38:39 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB8068.eurprd08.prod.outlook.com (2603:10a6:10:3eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 14:37:33 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 14:37:33 +0000
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
 b=R8pYzF9LXXWUsEFJFvu5jgZDnvVj6gSuYKdPFxUa3kXLl7wKJvxQISIRkllzCBVR+oHXh/ARYhrbUGUThN1Z4r2AxSCrHTU7y9MdgKDlUlODg95oSwC+AyBDQfgXUXNP9NMcvJJrJC6Y9us14F058F4BtLaShAdjPhK0edywKLnBx6uUu//s7xyQQTbRL4J8DNXMPYmxIZ8+I17NfvOMIs60te4uxtCmvy9BuFtkymwAOR8XnYiULjfrIEN+cUKSoJviWitUM2xtqXrIEGdLkgjzeu+5YX5gzW4GGVmWwAZ7zskmpK2oiQherm47P/jzvioB9+sND1yWEszQ2kbnVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIjIk0BIWkQiU0lB0x4GGC4TSeNBWSaXMuHu4P0Zo6o=;
 b=VskQSJNCF+CgrKRSqKKw6M5o7EY3ZUyb441VI139nfKgK0jWQP3WXbJxRoUVTmhnMOCKqez5sWr+HKh8h/ENlryxR1kJ9Xybczdh9KK1x28f8wkOej9z7O1iX5BPsQ/0ieFF/7qReWCdO9iaIveforXTYZFfcC3vu9gyRxN/SPB50mK3Rd2xdYZupOwB1mA2j6bcYHi/XStwL5nifTNRSbdwtJega/WImPksIcruk3CMDfBwmNL1LgKy/BYQFZKfPFjAvxgREdGeWvZlmTNDgZVJNeSmI2jziuB51cdzG3yQx6fW1Wt/TReq37JNzTiaXuGJN1dTV7FUZ+1VxE/oqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIjIk0BIWkQiU0lB0x4GGC4TSeNBWSaXMuHu4P0Zo6o=;
 b=g7sWPSwa/cdjliI5MxbiRkC7NYU5pbVTpb6M2mxv2G1kvM7+Mwkvwu/kxEyWKs0+90X9oBvAtp3BAJx/9NGGKz1HhS8ygaN4OAomWb71UU/r7C4la2tnq7RrsKNPdxmv8DK+osRFvRAeqMhTZFvL+5eZD0YzLh8BLyw6mAIKFmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U28r+XVociOAtmMMOQhmyy8EirPqW2kLX97Ul32tf2/s3WEaK0HZvNmyEEcS7cDkMIObW/SjVqB2imtCfbwPAvb8REZ+csyfJ3KXehA7f7jFbHwyUhRRh8SaIoJSrueDgblkuEf566wiiaFiOASXcUVQxLS5wk+/ipTdSdKrZlA1ttZxsQEPnWkD/npVyCpToikx2NbmThrhBGRQz9WruTFM3TMkrVu97GXNeT6Yg3jfKEECK+WUNcG0WVh/KI3q7peCl5PIlynEw+ePnAXIE0K/ea9yIzwiwzkSDzVHXOPTxgWhyhVU6x7ij8KUKsxGgE+lLmf/uRjbgNs3dhwKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIjIk0BIWkQiU0lB0x4GGC4TSeNBWSaXMuHu4P0Zo6o=;
 b=cHm2BZb6vJgslavzgWAK8NZh+OOchvkjwKz09qy9fXFxEdQjeDq8vhLdq9hxDCP3kwpubltUFAwkVQCOn0mPaK+/d2ofhfwJh98yn1nvlYtauk+FUnTDJcD8cVg3Mi3+WdHBwvfeQiEHA5LblURpVBMs8XO3HH3lO98mzJBXI8dJUcpqSqyBTptEptOWaxnxpP/h3F2G1pyk10zPlHj4rLZ86luPt78fMbEs9uSvpPb6gEFdZkFfH/VtyH6yYgyd6AP6SkWzIvGVuAISg4JqEbdK5Cbe2ZWIyO7IRSbA6RWPjpiJ8WEDI37YAjqdFB34to/1C7qDxFl3r9uZC2frEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIjIk0BIWkQiU0lB0x4GGC4TSeNBWSaXMuHu4P0Zo6o=;
 b=g7sWPSwa/cdjliI5MxbiRkC7NYU5pbVTpb6M2mxv2G1kvM7+Mwkvwu/kxEyWKs0+90X9oBvAtp3BAJx/9NGGKz1HhS8ygaN4OAomWb71UU/r7C4la2tnq7RrsKNPdxmv8DK+osRFvRAeqMhTZFvL+5eZD0YzLh8BLyw6mAIKFmE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Gyujeong Jin <wlsrbwjd7232@gmail.com>
Subject: Re: [PATCH 1/6] xen/dt-overlay: fix double-free of rangesets on
 attach failure
Thread-Topic: [PATCH 1/6] xen/dt-overlay: fix double-free of rangesets on
 attach failure
Thread-Index: AQHczMxJvMmkK2xs/ECWEgYirLYt+bXgMQwA
Date: Wed, 15 Apr 2026 14:37:32 +0000
Message-ID: <A0CD5D33-67D7-4A69-A5C3-C7C37F72830C@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-2-michal.orzel@amd.com>
In-Reply-To: <20260415113700.107915-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB8068:EE_|AMS0EPF00000194:EE_|GVXPR08MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac87782-f327-4847-bf28-08de9afcaf1b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 ILBYC9GDO0tudyMkoe7FYgzT1IBWGQdbzfz6e0C324OjXWAfkQva3dTy2M00cmHeKWveZqQ5orr3/1CWHhYMEKkn4rBXwlHujUES/XyTV8xupEsI8jenqcRqfsJilHSW09WCdmFWo87a63Btkc2RQN8Ajyvm5EpftvdZJz9YBY8i8+e3YQTt00K6jLRmR4+7V4oG29ifeCe35Ui5oXPrli/F2jUrsTTB8FaDFzSSFamOQ/EDM5Cz+EOw77w50wBNZ3sQBWe4157qbdVCSa72CCp7VDCPz/8QmF+V97UvY9eTGNIwMA1tSNKdnkScxSuOv91XyG0RohL5SX7FufmnecuyWK29LdVzucXk4vkXmJceUXeevvDZzvrmEkEUumKX4C1UPeau+ZNiWaRckL6tScv6dc0nhnCj1OMyqAEI8fcNreeXx/H+3dqasP+RIWgHBjTj8EAMJPqPKMyBRjkApUiWbRd8mOXUrNuhUZM+rLk5wjSG+isKUvzLwjozLjJOb8zNCysoVsCjyz4kExmiUvYD378AeR4PdqI1IPwkqtSYVyC5urxq1wH05DY7YDLPevwXse4GCci0a+j+J70V47yZ3uQ9Nj1Rav4Prj+3RQrff9As/rYVHezfXKm0ejope/zICij1jJkRWE+nly6TOOQOovwTmYZOoquuFRCuxF5COELguBBW/zpfpqX7lqZtIKMgkNaHhfFmnZ1fz81J6lt7BgoF8qq6wrcHep9z0mRdn76kyQAWe5IrTl/GX6HTXTjtDQOGCWPm7C/FLA6PqU+GNtVWNea4dG0B3tL/p3E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <790E5A00B5947F4EA0118C69335D0219@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 W078W8iIITmNh5zxDDR2P716Z2rury0w7w4nJgY7cqE1upUUgJDzzPQnO0v5cNsiRXshjlhXcOZgQzjqtq2woF2QOpq6D4se0kp0OVazv4SokbjEvuKoH9w5j0+mc8OCd0UVPQSlkuHGOeZhIMlJ5zXeHXvHChWPMYkLXVnL6HRRxNH86EWpnAUowwo22TugPthKJL5IbODH2IUf0pPz9m5hGYUYJSioxlBPIY8pfWXnBqeeN89gDSDIC8+FpWRYZtUNpwSDisaGqHWwLago3pZoi8RdyWmvBufjUesVaOmIsQXW6IoswwkfpMmdQTb1ybBYHTk4Zsh7YpqL2rVPUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8068
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe36b5a8-36a2-4ffa-7e17-08de9afc8796
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700016|35042699022|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r92DbuJ9B7LQMqLrXasnOsAMw4NqWBRPEabxgaqu9mE4fm4FllON1OtaR1GzStI81FsJkbDTWrLk0HEa2EWb1gBLWXk6uaWosbnlBqTIcxLztkmRQQDyWdpOtr0rMuL/LmNAZuVyBhZOjtHFzeabP//5hJLuGm9ecu5SMfCsLDIrLMKz08uEDEOSWK5rlnlK2t822oJwdub2neDIx8jKFAs80eHM9Kp5Pj2AqEkuscOaXXS3sFgAdY1P+WV93eutnCafSVtHy48TTTefVf0LJ7zYHWR/WQAgtYuxxcleBQjrk3Cl5mUarr7YCn5bORzfE2dQ8fxYmW7CDa7cmLaB0O/eyYP7O7jLoSBazZltKD4gja2R3uCV8BDEGO9HiUE4dRIFpHD4Bl4m1InhHMEl2sbCN5u7/aasYM5dGlHDNguK8UkHSv9Ym63KjW8f3O5Uj08T37PGYsbkcRzQCL007BlObXicHXPLXtpigi7WA1L0Mll6DE0ibMOJw4juYYDnUbxO79o+2hfaLz0Tio2iCTxnDEnNoB2uJMd2eAufQhU4wXzXcGMaoCMMe1bA+rnXVNln6tjvdgy/VtHUhNOkS+iHo9WgxjoihwEKo0LqWKbaU2iC7CE9QXAKO0Yx0FvqgM/SZp9ZfU2+6W6ohhKkmFB3mPp8zbNLW1pngCt1sGkiahauIVDfTBg4pO+ux773ms5OLY3Dhw4XkyWHvLdLAlB3EDh2MOvNmrKJ5doTMEGd2uCZrK0brrvnZ9UEgLVNRz5XeX4b0+Wkr5rszYm/Nw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700016)(35042699022)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VzAB+HkPpan2PdiB1sY067kQtTTIWqpZdFXMz807mh5PMoorBs2h2hc6GUPTK09yR8WLlxdB4qENgs1Dh9Ru/1FImUMh0KK3S50lqCC5pS0nR76waXkbNNjJCkiJXrbtfiIUCXURZlMZagwAyqU0H/eYnEyuozogJRl8J1GQwMwhcp+1rpCrDZQZleqrD7WbnxnRfCJl08ACBXNze0IXr95xFBoqx8G55cOOhb3Ut+mG2kdxQGiJuW7YLDsBcQHbegSZ0AvJqUYwZUdyaYvwJ4sr0H/A2n59dXO0/lYcEqfYx4jjVURZtRFcwL4olybrPpcDUzdK5nMA9DOPLdJjuUEcw60CVU5Z0rIcKtkF1xl0xVm4kob2yYiw2Sprf16N8F9FQlZfdwsioF+GGbarf7nSnM5LqrEy9oTylwYo5tPT2O+fMnp0BcL5DUThVoY/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:38:39.2537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac87782-f327-4847-bf28-08de9afcaf1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10476
X-purgate-ID: tlsNG-bad1c0/1776263923-2E74A152-F1BC5B7F/0/0
X-purgate-type: clean
X-purgate-size: 888
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:wlsrbwjd7232@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,arm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 0BE54405676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> handle_attach_overlay_nodes() destroys the IRQ and IOMEM rangesets on
> failure but leaves the pointers dangling in the tracker entry. A
> subsequent handle_remove_overlay_nodes() for the same overlay will call
> rangeset_consume_ranges() on freed memory followed by a second
> rangeset_destroy(), resulting in use-after-free and double-free.
>=20
> NULL the pointers after rangeset_destroy() so that remove_nodes() and
> handle_remove_overlay_nodes() skip the stale entries.
>=20
> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attac=
hment to domains")
> Reported-by: Gyujeong Jin <wlsrbwjd7232@gmail.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


