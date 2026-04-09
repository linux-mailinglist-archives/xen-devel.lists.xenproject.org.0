Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOwsKTKr12kMRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:35:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD23CB515
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277358.1562583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApXX-0003mk-Mu; Thu, 09 Apr 2026 13:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277358.1562583; Thu, 09 Apr 2026 13:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApXX-0003ks-Jd; Thu, 09 Apr 2026 13:35:23 +0000
Received: by outflank-mailman (input) for mailman id 1277358;
 Thu, 09 Apr 2026 13:35:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wApXW-0003kb-Oo
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:35:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApXW-001sG6-4m
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:35:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7ab16-e002-0a2a0a5209dd-0a2a45058ee0-22
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:35:22 +0200
Received: from [40.107.130.38]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7ab19-3760-0a2a45050019-286b82260415-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:35:21 +0200
Received: from DU2PR04CA0347.eurprd04.prod.outlook.com (2603:10a6:10:2b4::27)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 13:35:18 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::c4) by DU2PR04CA0347.outlook.office365.com
 (2603:10a6:10:2b4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 13:35:18 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 13:35:18 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM9PR08MB6003.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 13:34:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 13:34:15 +0000
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
 b=ZN3eC187UApebdY9DknF2Ks7kCsmymWsY1XdMWO5PVTaoax0NlbLq3D1NuClVxIW6yC6o13ph5Pg/Ldz6E+5ecwCy8CfGk/vWSy5/liMxeMxVltlHIBD/HW8rrgvkC+msemrbUUsWJ9g3gGBZEE6Kv9CO0MI1Xip5EotpXJsf0gVqt0UJgP7Yjfto4LQ0rA8TG0P/LbPyB6nqEUuPRCRjz5mSNk35nytxXD11K2YhMyAr8BnubaRX0CJAuHJsm3CllhxS2jprhx/EUv/Ubq6Lqa5jHLDYFuHVyiNPeJHb1lKyYXPt2Dix9BBp6crYvnsMEwtwqxk5acq4BNMTgf2kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUUirdYv3qlVQmlxhfpr4M8OF6ecU94LNQgny7wegC0=;
 b=j7qT0uQyv6QuOyJd74RRGL+hsamVbTnXoYnQVSyt9GdZQEK/lZAH+eitu2C3qokMDjluv9Tw1ViDWMzqr1BTbeqYBUx+qbmuoGnIu4fVMtvQyUpXQbN7xiTq5CCl7zPPK5tJ9cE/WN8G5Xq1nXUz27LmcvhZc1XUCu8EdDPmOLH892Wo8KjvTuY/Hf7lxIO8alTt6maI/+xLpRdEueJjEFr1r+bPjnOq3xxb05H6IPcR5mqhPeDej79HWZKVpeypIY1sB7Ud0VUw1E9cwtIUBm22LmASSoZDM4MDOXYvfn8hZzfbBfIATtjNKeu8K+UnOqgxQUiKMt4tJxhWWzRzrA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUUirdYv3qlVQmlxhfpr4M8OF6ecU94LNQgny7wegC0=;
 b=bnxfAXqT4DUz3mzEtVL9f0LImXxPzJ5SdGsKK+5D10+tt+1gM5qorGkfZdP7uTJWllTZxhUMctM2hzJJ52DMu9LGrVT79dwjnAYcbf40q5Ws0wqWYBVg803qbURHZ2vlmyq46XjxXgHnrk3hRTvGztuEu5ZO6A3JoxP4DZz6unM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpAVx41Z46KRSNQJ3HL6Cmmd5r+1QoIIgdN1pcRqrU1tn19PfXHn25vTkjig7ZdXk2oxzoTpRxtLWhUMOKOyaGby4Li5WkDcZIoHNVbVqLP39/zpJazBHTMm1ivfZSoE9JK+mu4ATGN3ml3bcuQpyENYtwRmte/YU0QUY+iURIRU9PcQSM7m+uKUtFOswwqiR2foIzfdXJOwO3I/6d9oprtCRoH9kzoy/Dx2FO2EdoWcuFWl1FC33O6J0qEHUOr1CfMPo5SE/NzPupgA2ZwdXB/qsKRUpzwtxsBDn02HCnB3GEPSzrCyPg8y4zD3DsENTL5jgRwG43/pjT5ozMBOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUUirdYv3qlVQmlxhfpr4M8OF6ecU94LNQgny7wegC0=;
 b=oQ8dfitK2QCplEc7kzQy7qqPUTJiYw1U4lIwWxOHtD1Pzq8TDBLNsdFUYE5KaZN950zaoCnZz+uDL2R3qjLdO2Xn9gnLHBVt4TIvyEJ8LicYzUPlbMUQjJ5UsY/F/iIs/chp6Wlwy0lZXpsUlaQTQm3YRMZYodhDol23SZRn7iJK43+SYyY9MaV+SaJ1EnRwEGoOhoH1MMntEBGP4xkQTl37F3geBVP0et7iiYIgKdkDXT6h4q7Kn9MNhh4WKTqryWwoDL1ttcglXS+PMdpS7Ca4A7IW9SEPjSAo/N5CqYVQbGmhEXm0DV6BZpp+WHXj7Ng3QF1SqiWJD0WnJDAHJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUUirdYv3qlVQmlxhfpr4M8OF6ecU94LNQgny7wegC0=;
 b=bnxfAXqT4DUz3mzEtVL9f0LImXxPzJ5SdGsKK+5D10+tt+1gM5qorGkfZdP7uTJWllTZxhUMctM2hzJJ52DMu9LGrVT79dwjnAYcbf40q5Ws0wqWYBVg803qbURHZ2vlmyq46XjxXgHnrk3hRTvGztuEu5ZO6A3JoxP4DZz6unM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Fix off-by-one in iomem_deny_access() calls
Thread-Topic: [PATCH 1/3] xen/arm: Fix off-by-one in iomem_deny_access() calls
Thread-Index: AQHcyBWemfhBb1SSBU2NDn/Cp3Sjk7XWus6A
Date: Thu, 9 Apr 2026 13:34:15 +0000
Message-ID: <1D67F18E-0A2E-4A58-8FD7-FC5FD6BE2C6B@arm.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-2-michal.orzel@amd.com>
In-Reply-To: <20260409113934.197619-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM9PR08MB6003:EE_|DB1PEPF000509E8:EE_|DB9PR08MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ed53d0-6ac2-4e92-1e6e-08de963cd749
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 uXBNnPabQK4eXQYEjBYbyjEV2oDr2lhidfQyplTJMbaHh6AQZ4uOdGrNnPA9ejcXTtY/h7YWe/7HNHinaEOyS93S5EAce/A11UEjKFhOGZbby2U+m6SQtd5GOwiZMCtNLknvD28qEHRT77drNLt2IAxDBInjH07M8EYydffyx2t1NphJyxNNJbKg6tFRDDPdCbTmdWmQOYwhoKtUN6ZcFb/vcaU5A1D0JYx70WrFO63FrnQL5PnaLrJM6ONpo0arqJuse49Pays/STCJAof/n8oQQn9Y33ibD2Y88I3uK3FF9yBYRW+eJFSnTr2it+5jhxYly+DvtbcPCsf0R4S6V5LoNcWElWI7KJGmMpsdh2xriGkD3fCjOtpJHiVZXAq2ik4UrDtc5HFqRngqWxOpJFBiyC/4RE7wsK4I8INTY9uM3A1QU0caLbBKuGzTeCRfFTZGw8QeCO0hjMmF6XjNU4FbZ4Zh/uQlz5VpX/xg1W1nClLo8ihkyZ1rf8ZcF5QvBQCCY4txKjVoZ6FzDAOdx54yjWgnoXCxQlBiztNXnrND8U2KwEwCgsvweX1gGywt2h30G1CaPjAKshGBXgU9Hl10oXYzXxe1F7DsarTlLtooVSfWegltKCzXMswxjleOvTXyCwg6YnfI/85djnuWnuOY0oDArVsgsNz9eyOaRG4owdVFG4zXHFxJfIC+ReVsa60/LgjvXW5c0mkpGKk21/TfdyLLp/FDr7ytZdxzL0HkPXsCh+owIQux6RS6SXj8EPNDverPFpjjV+KyQQi2ak8UzkYSsDQ/yC9snFkoecQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FFDB5F007A58EB49B7C12B6EC7789B22@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 m7diMEUN5o1n1b39VpDQJ+iwfqEAgt9yAjTtCHEjTqpCCDYCUNu8bMkfI+mQpmlKzecRQRxca+60reIzRS4WZgLMsYrMMsqAf4ssJCkvxaatO2bh6EWrGMx/4AhNYKd6DLXDDjBU52rqL3wS97MAJRgYV58f4pqjTMfu0+gsdJJcic9QnMl6b77VaeLNlClWC8mn4fvoRk+DK+QFV0Vt7jV1qg6WPevSvNljhF9TukXeXPZN3M7y5ZTK684b8wGWeVaeJ6ajk4NJ0ENk4Q72vWv296U3f1b7diBxupc4+GyiEgZcWP/XWgjAkAyAQGkzOOpBvELDi6rl/77SQyJlmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6003
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa47972c-53c9-43c3-458d-08de963cb182
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700016|82310400026|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+Z5nMV5JpYzySD9TGY8Iq24pwihCRxwX6JLjn5eRjvUnK2eiI1Pgj0Zxs+DG7jgklW9QZMUhA1P+RRLRYWIFKsvcABCBKGpBhaoTV95YmjbBaRZ4Q8E3g+z+5SpOksa/cgI5YkR/T8qsvhXiDVrovOD8v4rmDtbvNZvefMSyTfIQKqmO/RppUjDyd/WrKTo0Us4gGE6lgDLvsdQ5XlgK3MPbIE+PmrEpCVc+Y/tEtIFB8gz2s59AMMZb6ty3FjQLvaKe92q6lU1N3eQal20zLJ7ZlOIVvNs9lNbmjnc9cSO+cbb5Pvhyq3AAgfgWGlOZrf2akpOIaKyLLPvI/xQ97o2oQuOre54BXqSnLwB2eonbUcDB7PkPEx1pOD+kFcOZ7GqiK/KHgc9RKxT6z+E2Y9bGcAGP+s3HBP46eDdQBPlSUHMMPu7AU1Mbe9npMt6+L2XGHZoNhNpvb6j36psektqzBvf9zuricJgaP9DllTa4zBSoPAjJLpyKo+r7c2D4jpf/5Eea1YQwtxCuE6aoB2wTz1C4hY/J9bWye92cXwZJQv7q0nQOCnQXI/YEuSZ/xg9wvW8PQPWL5AClmeOvifrlYTJPzuyc6MJNT81mVH4tVBn0y74xjP/GAoh7GxVH/lc0dx4ALgRYdC5I8uYU+n6J6taKcD2kKVhZSsRjl0Q+Q1ioCEmk+tsZK40KkljV7/rzujFWJrWE8gPmKfIh0NfdPjrgYqXohEXNPJv8Ril31IGL5uakA9UvlAb5KB+ZphcdI4TkWfZA/0ttcAOqgA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700016)(82310400026)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uQXojR9KvrLnfYL4saifDFMj4rlf0KRLtGzwaSGuPVS8za6t5UUa25Qqo/OaaiV3UTTxY33EUjHObD78vI9tKGnEf6lOry7f5Gc2YEypeCsIVGp4DMro8kgOdieK/4Uv6oaqtpJtw4AxFoQkDCM7S3ILB4bHVEd6cQCTBrCvCTmUBTjlfC+AbB5W1Yp4b2bJZNFS+Th40kU/HBmqf+beOL/scm8lkEP4MabdkBKBJJ0zr+HxrYzu4F6r/8dvdwa4muVPTCN/HGofnL/XgOoTUGqeDjiNXrJiLN+face0vBol7awzC6eq90hBK5cIBfHpOXIt0Z7/En/EagwSH2PqgqjqsRRHPo7/lrIS/Gf4MKrg0EuV5WDuuek8Iweb8R5wBEvtNcHabMuc+OhK20Fn0DcqzP8t50lSsWCycfTDkHbSRVBkgTVTAxF2hLp+StAS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:35:18.6228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed53d0-6ac2-4e92-1e6e-08de963cd749
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
X-purgate-ID: tlsNG-c201ff/1775741722-23D2F96F-72181A4F/0/0
X-purgate-type: clean
X-purgate-size: 996
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 19CD23CB515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> iomem_deny_access() wraps rangeset_remove_range() which takes inclusive
> endpoints.  All call sites in the GIC and ACPI code pass 'mfn + nr' (or
> 'mfn + 1' for single-page regions) as the end parameter, which causes
> one extra page beyond each region to be denied.
>=20
> For single-page regions, use 'mfn' as the end (denying exactly one page).
> For all multi-page regions, use 'mfn + nr - 1'.
>=20
> This matches the correct pattern used elsewhere, e.g. in device.c.
>=20
> Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GI=
C regions")
> Fixes: 66158be465 ("ARM: ITS: Deny hardware domain access to ITS")
> Fixes: 97e9875646 ("arm/acpi: Permit MMIO access of Xen unused devices fo=
r Dom0")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>=20

This looks ok to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



