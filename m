Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGo2BAPXBmpjoQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:19:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC654B2F4
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309716.1580771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNnkg-0001kk-A3; Fri, 15 May 2026 08:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309716.1580771; Fri, 15 May 2026 08:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNnkg-0001ig-6i; Fri, 15 May 2026 08:18:34 +0000
Received: by outflank-mailman (input) for mailman id 1309716;
 Fri, 15 May 2026 08:18:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNnke-0001iV-ED
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:18:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNnkd-007mzf-Nb
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 10:18:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06d6d3-2eae-0a2a0a5409dd-0a2a4505e1ac-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:18:30 +0200
Received: from [52.101.66.56]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06d6d6-aaa8-0a2a45050019-34654238479b-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:18:30 +0200
Received: from DU7PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::12) by DB9PR08MB8339.eurprd08.prod.outlook.com
 (2603:10a6:10:3dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 08:18:26 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::cd) by DU7PR01CA0018.outlook.office365.com
 (2603:10a6:10:50f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 08:18:26 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Fri, 15 May 2026 08:18:25 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAXPR08MB6669.eurprd08.prod.outlook.com (2603:10a6:102:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:17:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:17:21 +0000
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
 b=C0v+zah5sym6RqmCYnsPjVM3Cb8im42IGWWdMOK6o60tJjA8/qvnCqGQp7+A1hCHpkMikdX2bz+aAchKfC+OEZezU0qn1o2kgd7+67cZNEG25mQODKtw7Au+stknN8ta09oX+GF2um6tvBlj0x84QHTe59MzxZ4xKJajPP1+4k5WxMkaY/ZwkGwr72i/8dbxfmUsh2Cb0SAlZUy0foa6gmyR/xe1iTHlvsAXG0JGBCBAWfkurY0ENN+4p2JLCrCvkFQnbHOENIH6f46b2+lgGEf2XTfNUHFFw92RiMobS4PxQgPHFdGGp1AcN3YkP535bE7hxf03Lx0CUkZvHlQ5vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBJ1CBqWZ6QP29mG2UV2XsRVElOjeAkGM5wBc84baSA=;
 b=WNTsyesyxLehph8OnNbk0JrCkvlXN8hVawQF2rpePElwQUYTIWPI7enYahD+THG/xDu9OCEZOLet8BNKdupepI1aJO31dzHL4ZvxAnhm/hfVRnN+uGGiyhadZemzq6x2/k2IA6poN6/KobYu8jo8jYjIcta5NfBReT742bppdEYfE3O2yx5Gq1vS82pGPiUKhvDIfYVYBB+0KDptL79+YrC88L1e8m90qAxT/P68gfkBPj6FHt2AKxS6ySvEqxHNe/3V9E+fEWV5pRkxwcnbk8LyX4lYsIGqPC/iLjLydRPQu5FvMyjZlsXIlzwtYoLYGdybD26p3N4PQfmW7WkzHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBJ1CBqWZ6QP29mG2UV2XsRVElOjeAkGM5wBc84baSA=;
 b=kYI/K8eA9tgQJEDz7CHCNBcfoRT9BYVEZo21KoFxVECdw4IdkPDI6BEju305LYofXOtJEMXx3FfaAjiUMTLtprLaMX8PxmBXXwBc7MhE0QUysxodxWFD+VtGOlcvVByY7Li1oiYRfdxo/fiyTZ53g7oplc0sg9a80tLlvGFGRss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1ViQGnIg2Lm8eLGQrsg9eU4TnTh0gnES3IqM7zQm5k1OCII479WdScBulfqlVOBdxNMJ5B2/Ar60zmwhY2gwPbR1N8CxAzRHvY4GhDQXWLbTeLkoE8N86WRqhhlzOr6U1F/lHJfgXgMZIa+dGsC0cgO8u5+ESjM5zlaENZsrhi1OeF0KeztwG0G6bnXUi8N32QNi0h3NhXVfnb5GuKL/VK9eeKA8Zn9Eh08fCen73q4LvQJhGyqO1xUUd9E2nU3L6XKwLFnZVjhw1WiA+rniyTymk5Lff4SyCXaD+UGmVZa0454JgebSfxuyVlOU8imEfd5dOOGmWuYD55nuw1New==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBJ1CBqWZ6QP29mG2UV2XsRVElOjeAkGM5wBc84baSA=;
 b=Gf8oRLpTHXLUiOezthXxtYesmc2okZo228qy68aErQ9XlZNv7K6/Fv7sj+jdEr2ZcKHwFXYqLUpYess+iHHU99do+ZZExwO2IsaP6+HBwCcuJbDg2XTivKBLLN1AEWw7XnxJrV6my02wn63Cv2tlVKovXWat+LGkUZY31Wg05q6B+n551FPrXkyCx1+zN8B8iM7HH/C58ssa8wz+6kUKZUT8H/foThChaoWYL3vH9uQwLaCHD5hZPzp/T5deZfkA3t/kfsdaSnjpY8nKMqya9jdWsToQQOflmTW45AcY078FU3FVNIJ5D2vKq0K/wmFWHcOhlS9SPxKAD2PVkO+W3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBJ1CBqWZ6QP29mG2UV2XsRVElOjeAkGM5wBc84baSA=;
 b=kYI/K8eA9tgQJEDz7CHCNBcfoRT9BYVEZo21KoFxVECdw4IdkPDI6BEju305LYofXOtJEMXx3FfaAjiUMTLtprLaMX8PxmBXXwBc7MhE0QUysxodxWFD+VtGOlcvVByY7Li1oiYRfdxo/fiyTZ53g7oplc0sg9a80tLlvGFGRss=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v9 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Thread-Topic: [PATCH v9 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Thread-Index: AQHc5ENAW2MQeYfyn0+JFGvrwQ6/UA==
Date: Fri, 15 May 2026 08:17:21 +0000
Message-ID: <D25C699A-60F5-4B08-9BE9-823625082FDB@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <06448a30ef6694a55ac85d4c8c78ca2d71342430.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAXPR08MB6669:EE_|DB1PEPF000509EC:EE_|DB9PR08MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: b911fc9d-d722-467b-0bc6-08deb25a89b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|18002099003|22082099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 OAF96NgAX995URo5ITzT/kwm1xee6zCEsu3TxDzz44psBwjWTPqOXBaoUR4lJ7tqDGzlU+MKZHMloLLbhE2+hXPzF8s79u6qTvr81Fq2Uo/iuj8h9/WeZ1R5QIPSJw1xrAiWCjX1n6vBBN+XKj35H5Dg2hCm0tAMQldGTY1LSFq6b3vxKSHf3Ppx+zD/FQakpMdSG9CWI2K09El0xq49LK1MuaxUDT/mu/OXSUYdSS/pvObWLRSt9uSvMqxiMu8+WuI4/JOM2H9Tw7ecmyXR6kK3hnazg/nn926tIK8AwPTfI8RCDrsrH9uiQcTmhMCL5wQMcygddUrOYcrzTXEnTywbb7b3rUi2JRALV+GyQCxRmPMK7/SW7Qz6FcgXfdsqw++TSNs1kwWtdNv/pu4+SFSTLTQWxumTBXZ33E4ak56+WJ0xwc0CO3CXnEE3cn834UJHkrWxwMhRjUEZvCra8fwNkHyprJz90poZ05UfS6KTSAd+hu0N9GRhMmPnE8NiRlqRCYX+TCan/gh0uOKkKKySGOPNe7kAfu2BiAQwqnNHWvEzjtod9MxWRXovkxgEmkCmKnzkyijuoDe7HAWliRS1BWDxa4M0kiEIp7SGsUMJfV5gbSnv0yRhpjma8kLn5hygFMAZUy7XmuOTmiICczFpMclf/CNZELPx+l58OlQxu1lNqnUwv17JMAL/MyQxFJ9B3b57Ia6XAci4N+YIbPiEroNnCncfuSqr+zddXujRbclLXMiuTln8MjgHToxF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9993FD59980614FBE6E37EB854A053A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nGxRkczUlsa0TBNPBHIhYmScjPRfxkGh704lYYjj0BKt3xFouPRU85jbgQFC/yw3dRtFga1btYn8UwWyekmjKwnB35HcjBqqBsNfUmTSSru3xDkXhSfQFurYWVBiwA9DWGCbe68QM4ub9Kbo89G2RpLUgUF6XX1QFDTKcMmJZq80Lokacqkj8ccKY6CS6YecY9RT4NIzEOQFHVF5QKoypw7/bH4KkzZ35Ec04jwXViHa+GE2J/Fb2nqJEE+i6agd9UlaMcJoD5DGQ9LG9UNErmk6HsioOI5Qtr+8Er+cDDOE8wn4HIbz0m06zbGpdMSvIoh37jCCFIPiElLi2OANOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6669
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	344c607e-403c-492e-e08c-08deb25a6341
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700016|7416014|376014|18002099003|56012099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	lRNbIAiwH1TcHpoWA0/qugkVHabTD+34r3qWPsEJ4Ky5PKXZ8gym9a7kqsacxTTfc5lmscqIg0uoXnvKWbXiYZ76BZPEgSKrjPMk+QF3P1qrkIwCpQOge27Q5e/eXDKsPRYrvHK9pe4jqzdya+6AIkTVeB+jZVm/JTsM16BEAqaHPsVemGhANAWdqTl0U/WJUEfso8vujBUI8+FRJ7LOMyM0ZuVyHcn87ipOoPCHFnZE5dNukFknP5v7/iswh+4cOzrOjUOYAC+ojqdHcc1MR0gqrftGSsX93Kj8l5oYqk+8SHEKY/zqwQBoO5mDcsKS3PAydavioB2dSNQfun0vrbaBZL3REPpQyMxkOb+4988fV2aO/1gXdoWrVo8tXG/t9MC4Uv8tEAGj2mjGmr0H+Jmttdv612tNo8lkkInuzENH9bxeMqACb/PAdPjzSlyBJMXV4spmrABAivxc1C/SeiZPb5hmixAHox6boeUkJtfS/CQdeOdXXbQe/YBRCKsHMYaMvLvFNMe0lXIn3FkJ1sp2bktAEmlCRYdlcK9Ss+3A0FBy4Iemy/Z72sGnXoIL6eYvkvgaIlLwrSu2WtROnJwOSMAQrFldjlaCDxZP5sO3rfWYwp2oBGUc35aHcu1PXgi0V4zcRcVrtIOotElAkF4LgUS5te8FkJXazUDP3nmmc1OUQJaKuH5kCBL7KvzloKfLcZYHMg1mbg+AfXeNKCF+9QfOVp/pd6QFBcxU82E=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700016)(7416014)(376014)(18002099003)(56012099003)(22082099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	peBj/9bZ4h3akNrNw5fXWLoM0t2/6M0/zghq9ech3KP0fPeYFa5c563WBbDREaayYnxm8w+QdXp4e6mr2Oz1+0Tgbr7V/uXuIEB5Hm6nRtBqfHlKxFX7BE+gqgxrEhnIWTnwWeN6mOoeoMHc5DjBr4ch19TWWnkb6dCxZGbi0u0Xm+pv7yL/GeWQU3wvCrO4ohdiV1HVS4s7x5vNWDz/ef/agfWiuYDSiIvtXJSGidDTMpU3S7HNxbwbf24NnekyrZFSxvDDgHNUFvTTOLkIxMIElebZWh9FdA/4mj3ZMKP7xkbUvz3tswk046EFBRyDDJyDYsDAIeNMDeaYhSsWebCSYTR6Z1hwvXsA2qi/OhDEwjAU2qyKSPsCBMaTt68BiErCfSAusE59+8n2HiQ/D+ojq+TE3lzAcc68DvAc2qlAXc8rLQ2GKuKbm4AYk0sL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:18:25.9407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b911fc9d-d722-467b-0bc6-08deb25a89b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8339
X-purgate-ID: tlsNG-c201ff/1778833110-DA175443-DB90CA65/0/0
X-purgate-type: clean
X-purgate-size: 846
X-Rspamd-Queue-Id: 9CAC654B2F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Rahul.Singh@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQphcGFydCBmcm9tIEphbuKAmXMgZmluZGluZ3MgdGhpcyBsb29rcyBvayB0
byBtZQ0KDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc3VzcGVuZC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3N1c3BlbmQuaA0KPiBpbmRleCA2Zjk0ZmQ1M2IwLi5hOTQxMzMxMDM1IDEwMDY0
NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3VzcGVuZC5oDQo+ICsrKyBiL3hlbi9pbmNsdWRl
L3hlbi9zdXNwZW5kLmgNCj4gQEAgLTYsNiArNiw4IEBADQo+ICNpZiBfX2hhc19pbmNsdWRlKDxh
c20vc3VzcGVuZC5oPikNCj4gI2luY2x1ZGUgPGFzbS9zdXNwZW5kLmg+DQo+ICNlbHNlDQo+ICtz
dHJ1Y3QgZG9tYWluOw0KPiArDQoNCkp1c3QgdGhpcyBvbmUgaXNu4oCZdCBtZW50aW9uZWQgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpXaXRoIEphbuKAmXMgcG9pbnQgYW5kIGFib3ZlIGZpeGVk
Og0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
DQoNCj4gc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZG9tYWluX3Jlc3VtZShzdHJ1Y3QgZG9tYWlu
ICpkKSB7fQ0KPiAjZW5kaWYNCj4gDQo+IA0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

