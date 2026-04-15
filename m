Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILasGO2w32lCXwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:38:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E0406006
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282643.1565192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD2Io-0008Be-Eh; Wed, 15 Apr 2026 15:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282643.1565192; Wed, 15 Apr 2026 15:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD2Io-00089m-Ba; Wed, 15 Apr 2026 15:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1282643;
 Wed, 15 Apr 2026 15:37:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD2In-00089g-7y
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD2Im-00A2VS-Ds
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:37:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfb096-e002-0a2a0a5209dd-0a2a45098fb2-26
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:37:16 +0200
Received: from [52.101.69.52]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfb0ab-bf79-0a2a45090019-34654534b354-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:37:16 +0200
Received: from DB9PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:10:1d9::16)
 by PAWPR08MB10974.eurprd08.prod.outlook.com (2603:10a6:102:46b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:37:09 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::7b) by DB9PR02CA0011.outlook.office365.com
 (2603:10a6:10:1d9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 15:37:09 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 15:37:09 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA6PR08MB10595.eurprd08.prod.outlook.com (2603:10a6:102:3d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:36:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:36:03 +0000
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
 b=ei5P0W6U2WHq2t1SjuYItEMXYguP5Q3ymWws7Fkd1VSIwvU3+Snw7dLws7482u2/99ORBEGG+Y6J5YUNQ4p+Ql2i7DOm5+A5nn8TfRDjlo1XDMpXBUXQAJpjfRcqLs4uMRpRhSJafVO4OWAGJ2ctpRoBVpO/jMmZu4bRqMxQlsTnkHGNkZEEH2LAPzgB5YZwx5z8r2x+1uJh3dxFE4AWUQ6xeqcPwy/Nm+oLM0D6d6uRBCtBpS5Oe7Y65xNrEWLP7NSpuyt9NNUAm6BWADzLBn9ciEO4YMV2Aqcs557Rlos+JxfJQxZi5LNH0V7QBNuIlA/ljL+z9RmT/kLhKeEmyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V30waawHWtz8KtOq537okWU7QDZkzMvpmsGajsBBg08=;
 b=q8W44l22SHK8BxtmmaSzXoJ8EgRdiH/fOS6b/FrfpXBvDlWBiwe8LmKQsHcvw7hcHG01Nf2y4/W9RVssW6ZQuu1T9srjEGJqqI2m+WTETtI7PS54FSIejVlmBVCnvf4Y5lzLMd7YqlsAMK8SfurGKayvqmKcCVzMoUNTm+lOgdMcAd575fgYGX9arGqdapluLyAU7qlUkB0SfvFeNAeK8SUYppPpG55WpS9oA7QJj91zOSPWMTswIS89BDUaQ7aGSEwYQ2D1z2K4bUi8+dyN+Gj1EQFwQp0JDEoCz8zbXy6xHk6tP0Ttl0MDXgyZ6vTxWR6iAnEdKxkzih/87nHy2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V30waawHWtz8KtOq537okWU7QDZkzMvpmsGajsBBg08=;
 b=S+eHRSiLa5Ie28WQGSrMc2ijb/kp2Ew1gzf2LLSr1A0wVGsBMS+d5j/kzRB7eHnng0f4Se78WNol1WBaeu2bB6X3FZZoA12pUA6SuWFY84seseRS7NHDXYZHtMNyghtTXZuA9xkg3iqIgproNDKnLZ/dYZ2L22eZjWTmeF3LTfA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwNIiXcghd6Cl/99F7YsYgDVN8IYiiGPoGZbQFoAx7bnbqQ8eHRJ09CcAuDG6oHjSspnUasAoBGiONVwBqNWuYfMSpN/FNWXeYa6BqhFuy3gXca3MsTFeLqpewcjDVPNHQ8rGZCrssIqL4SLV+08nCtkSVT4dGbxa1Z2ztccV3zJt2U2WAEZSw2OzY244BUbV5ChWNUPeNHywZxSvogG8AJFa9Hby6vLjYjSNQrHYY8lh+irFRGLfgPldASgKQJrDtORzO5T6j50UWWKcF8ze09tTJBZVq7MExIcW5QqqEKn7dJwi9QTksiCBUIcVA2iLQ5LoXndtcPQfZ5EJBA7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V30waawHWtz8KtOq537okWU7QDZkzMvpmsGajsBBg08=;
 b=rxnKH1kJe9JMCQ1Dek7e0hC4RZKS5mPAKf4di8drdk5MSv9dYR8vx8Dc/+EBGBAK+KPi3r+4q2X702grjc53bq56zjmozCq4N+pehHEjh8xHhbjmLwqMgilxOl3/u9JnqY6v9Byv97kOwmAfRrAQ4GBDiKxIElSEa9u01SxHYui6PvdE0Uw1CuZMS0Kor6DVpjOkaEnqwPQ7U9WmirItoKjYuKRoZNH8em0xFFb2q+/Z4iBcuzxVfWefn9JOgaIiFyYUXVnoESoZW74z48Xazvc58LEZjw+mMtFiajlO5LMzSYGaQNr6mFRvV0YQXJoqUhe/KG/it2UW9F1wnGw+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V30waawHWtz8KtOq537okWU7QDZkzMvpmsGajsBBg08=;
 b=S+eHRSiLa5Ie28WQGSrMc2ijb/kp2Ew1gzf2LLSr1A0wVGsBMS+d5j/kzRB7eHnng0f4Se78WNol1WBaeu2bB6X3FZZoA12pUA6SuWFY84seseRS7NHDXYZHtMNyghtTXZuA9xkg3iqIgproNDKnLZ/dYZ2L22eZjWTmeF3LTfA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Topic: [PATCH 5/6] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Index: AQHczMxJn1pwTu5+sUmN2MgYtFAQK7XgQWaA
Date: Wed, 15 Apr 2026 15:36:03 +0000
Message-ID: <519E2133-12B9-4E51-A7A5-FDBADF82159E@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-6-michal.orzel@amd.com>
In-Reply-To: <20260415113700.107915-6-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA6PR08MB10595:EE_|DB1PEPF00039231:EE_|PAWPR08MB10974:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2436c4-433a-4763-9a3d-08de9b04db77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 kM9GRW3OafS1J3vXITUDiqebPMQldCaS+a4nqEC1F8tKr3VinjN487f0cbGpD0rSY2i9gS/gTicV/rr8WChxw3rHVb5YsMcT4vMTZGRUfREthaEJERIWNV5jO6WEi3zUOf8cj/rSGa2+Wu2XQ8HNVEH6LP6YFqMPVup3Ix3RtBT3jyiLQslzkIKLmJvznnDQiMoCKWq8TNWrpnVUVQWqD395T1R+LRvS2jGB8Iqt4zvXAYYEPl6rwDcyenBPMWqecw3jjiAlY3UUR/8V1U1fGPYUQRHg5VQvVjogAdIgKZcRxglj7Ms8kvpuRimo8Vn97F0TuctY3NKSU2kO14z3b0aL8Ny4VCcnWP8KosE0G5OGjEQcsXv4E6zcKvW9bu5prFTCVf0Ne8V1W4trtFDkaKOdxQAcckqjs9ZiUQlC3xmxzTRByN9d7NYiY0mCsGA8Lx1vuZml4MMv0wKeCn5xawbnu+Jat2HTTlR8c/2NjJv91Xt8l/U0gpYh5Yr2jNv6q/P+kCtzqAEnr588xMhrQtjnRzHfj1D/FNCSXO2JXNOeTEGenZuzXPb2f2+Ho6DfHELwixIGQbzmwXzTZkPDK+x+vdZpH15GaPabIL442HrbY4UPLqJk4UH34YRWAH8nk5E4w2aW72/wxzoOTrp6iI0fTCiZWqTSmgq9k1WheqGJ8q9dsBdf6S2N+5yzL5gnSfny7YZY7Rh32w7mNiu6jr9fsHMdzimMOzuUPwDj//W5fDHwJpDZcRqUUSbrm0TI+rAuMhlYZJipJOWGZHPoRpMYsU5+keQhH9zwWs4MbA4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF8D78B940BF4347A53BA1F2CA07BD1D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nSYuB5xMpUxeN5gY3tj1C5wnyTJH4bfHYMQLLV99BEtlipshxpawPRLFrfftTchR5fifUy6quGGT0HkmdvOwEVikab7U0P1zARoRYBDvw++PIjpHIWQAJ5EFJ5SM1zhBD2H37EJ/htJRj85b785VJNHNBxW84dmc6jdz2YuWIZaQHudhLgqU8kxrKnRJLMT4oOBmGsWG7bDoP7MhhNvqeNjUVDGYjsxWF4CiagsQEHmwhXZ+S4K2+0+P2xZF7CgIijrmuc1vf0aH6u08BuFG4hbSZ6ICH96gZJdobAjL/Kp6E74Uy0TJzMaE47Tbc4eGfv6o8+0w6BUHgN2L3lFSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10595
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a0d91dc-a462-4573-540e-08de9b04b42c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nSncK29kLySZYImA+IBU7xnWonaRjdOZ457WeQfbjOvR7JcTbmDjUA9E97YCvJuCmJmNeJCrWsVI1OuO9zn7CK0LKXAK/ME+VUm3snyIeCoTdikfhs50ngQalnxh2ZxtuSotIlfsBb3Q9jU30+LQLi1VCdHOMBkjj6jfUEy2Z8nk7upe/jgcvEfdGp0s4jyL8FihivhDCsIsBQGSkleja7KSlKsAGu0nrTrozUb1PnNDnsYfJJtDudtJ6jg2UFgLqQlUQ9wFCiMtZJ2rdkMCO3bkVPcHBQpVn5+H+Bo5AIlji56OMVAxOe68yN9fwrVeCv8TiZC7Nwoqy/oO1Z1yJASIbRSKWIyHqAFaVRoh3/OSjC3Uv2zlXRfVf1RhoYsbnwzKixRt5SapL/mdcGrlCGqDSAH4ZhOquzY+xxjqJzHLXpzipFwjuqa3TUddbhI+iOyn/20Cc20STGSqkkDS/K7f8oq6W54xksh0aQDyv77TnEVQlfdE0DV9Pd8gn0GQS1wStLDcOCODLhP6gnHHQ5Uv+3rLmoAgISxpx36y8JwSzfdBjuQAoYAdM/Up/NkgGH1UQWwyGEZmmMM0Sg8JA88d59NZ3OzkGXLUJXmTgtWB1SDtdHgn/GLicRd3uI2ErKN3EhbDcGn55KB9FyYBL5OC5AU1HFA8j06WA/wELfjVwSxCXGxYi/RekonRxC4C6YYcoNv6hHFikLr1MfMgBInru2Z10RY45DXFYnCmmqB1T1gbRyhfTnM1Y9BlwUnOTwPyMCVnMbWl/irxa2pLEw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nCq/u2LFqRsswlbdHi83VeHeTxfRNRNTg65EbGHz6utUMMaDit9givSV28zjpgUgm+4ZG6COjMnBTurmf5nQ4HXgV7nX8SBZqeXbHH1OmlFyxfDlQa/ZNaFeAcUGzD5Z2dEEmzjtezC12DsrdslVmM6vPum8m3tj/ujQpZ6vOlfv39TGqulykw3lD1+F9HXCs3k5/CDS21wNK7L3MP5hq2kpkCwyIOxxJ7sGISztjImffMow+JlDYY6d2PqSIzi0RUVqZ3ezXYEq7myKeS+cWEXF53CNS6e+CrZoSvvEv25Db59QElYGBAdkZ9Xd3TsCHX151EPb4NyEWQfyVWm39fNkmdlaJo7kvnIhVq7L5xGAP+ihS7JM0iRHMIIVrJaWBY5DkmoQKaiwEaLYkO1Ko5ESSaz5ngpYWVJ4WbT3X5q/BZNUSSeg3oHAg8G7nRr1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:37:09.6349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2436c4-433a-4763-9a3d-08de9b04db77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10974
X-purgate-ID: tlsNG-bad1c0/1776267436-5674A152-07F72940/0/0
X-purgate-type: clean
X-purgate-size: 5099
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 899E0406006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> overlay_get_nodes_info() is called before fdt_overlay_apply() to extract
> target paths from the overlay. This fails for overlays using phandle-base=
d
> targeting (target =3D <&label>) because DTC compiles these as unresolved
> fixups (target =3D <0xffffffff>), causing fdt_overlay_target_offset() to
> return -FDT_ERR_BADPHANDLE. Prior to this change users were forced to
> manually modify the dtbo (even for hwdom) to switch from target to
> target-phandle by manually inspecting also the host DTB.
>=20
> Introduce overlay_get_target_path() which directly handles the two
> targeting cases that occur before fixup resolution:
> - target-path: the string property is returned directly.
> - target =3D <&label>: the label is found in the overlay's __fixups__
>   node, then resolved to a path via the base DTB's __symbols__ node.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> xen/common/device-tree/dt-overlay.c | 65 ++++++++++++++++++++++++++---
> 1 file changed, 59 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree=
/dt-overlay.c
> index d3d4669718ac..a0dee7edb7e5 100644
> --- a/xen/common/device-tree/dt-overlay.c
> +++ b/xen/common/device-tree/dt-overlay.c
> @@ -286,6 +286,63 @@ static unsigned int overlay_node_count(const void *o=
verlay_fdt)
>     return num_overlay_nodes;
> }
>=20
> +/*
> + * Resolve the target path for an overlay fragment.
> + *
> + * This is called before fdt_overlay_apply(), so phandle-based targets
> + * (target =3D <&label>) are still unresolved (compiled as 0xffffffff by=
 DTC).
> + * Handle the two cases that actually occur:
> + *  - target-path property: the path string is used directly,
> + *  - target =3D <&label>: the label is looked up in the overlay's __fix=
ups__
> + *    node, then resolved to a path via the base DTB's __symbols__ node.
> + *
> + * Returns a pointer into the FDT on success, NULL on failure.
> + */
> +static const char *overlay_get_target_path(const void *fdt, const void *=
fdto,
> +                                           int fragment)
> +{
> +    const char *path, *fragment_name;
> +    int fixups_off, symbols_off, property;
> +    int fragment_name_len;
> +
> +    /* Try target-path first (string-based targeting) */
> +    path =3D fdt_getprop(fdto, fragment, "target-path", NULL);
> +    if ( path )
> +        return path;
> +
> +    /* Phandle-based target: resolve via __fixups__ and __symbols__ */
> +    fixups_off =3D fdt_path_offset(fdto, "/__fixups__");
> +    if ( fixups_off < 0 )
> +        return NULL;
> +
> +    symbols_off =3D fdt_path_offset(fdt, "/__symbols__");
> +    if ( symbols_off < 0 )
> +        return NULL;
> +
> +    fragment_name =3D fdt_get_name(fdto, fragment, &fragment_name_len);
> +    if ( !fragment_name )
> +        return NULL;
> +
> +    fdt_for_each_property_offset(property, fdto, fixups_off)
> +    {
> +        const char *val, *label, *p;
> +        int val_len;
> +
> +        val =3D fdt_getprop_by_offset(fdto, property, &label, &val_len);
> +        if ( !val )
> +            continue;
> +
> +        /* Match entries of the form "/<fragment_name>:target:0" */
> +        for ( p =3D val; p < (val + val_len); p +=3D (strlen(p) + 1) )

what guarantees us that p will be null terminated, if a malformed overlay
is passed this strlen can read past the string, we can use strnlen having a=
s
upper bound a counter=3Dval_len? decreasing counter each iteration.

Or do you think it can never happen?

> +            if ( p[0] =3D=3D '/' &&
> +                 !strncmp(p + 1, fragment_name, fragment_name_len) &&
> +                 !strcmp(p + 1 + fragment_name_len, ":target:0") )
> +                return fdt_getprop(fdt, symbols_off, label, NULL);
> +    }
> +
> +    return NULL;
> +}
> +
> /*
>  * overlay_get_nodes_info gets full name with path for all the nodes whic=
h
>  * are in one level of __overlay__ tag. This is useful when checking node=
 for
> @@ -298,7 +355,6 @@ static int overlay_get_nodes_info(const void *fdto, c=
har **nodes_full_path)
>=20
>     fdt_for_each_subnode(fragment, fdto, 0)
>     {
> -        int target;
>         int overlay;
>         int subnode;
>         const char *target_path;
> @@ -307,11 +363,8 @@ static int overlay_get_nodes_info(const void *fdto, =
char **nodes_full_path)
>         if ( overlay < 0 )
>             continue;
>=20
> -        target =3D fdt_overlay_target_offset(device_tree_flattened, fdto=
,
> -                                           fragment, &target_path);
> -        if ( target < 0 )
> -            return target;
> -
> +        target_path =3D overlay_get_target_path(device_tree_flattened, f=
dto,
> +                                              fragment);
>         if ( target_path =3D=3D NULL )
>             return -EINVAL;
>=20
> --=20
> 2.43.0
>=20
>=20

Cheers,
Luca



