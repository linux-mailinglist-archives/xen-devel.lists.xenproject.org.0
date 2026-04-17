Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB5vKC4g4mlX1wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:57:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FE41AFB0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284195.1566059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDhoK-0006h7-OD; Fri, 17 Apr 2026 11:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284195.1566059; Fri, 17 Apr 2026 11:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDhoK-0006eY-Kq; Fri, 17 Apr 2026 11:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1284195;
 Fri, 17 Apr 2026 11:56:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wDhoI-0006eS-Mm
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:56:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDhoH-00HSOq-Mj
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:56:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e21fe7-2eae-0a2a0a5409dd-0a2a4504a4e2-36
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:56:33 +0200
Received: from [52.101.70.44]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e21ff0-1dec-0a2a45040019-3465462c2681-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:56:33 +0200
Received: from AS9PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:20b:530::21)
 by PAWPR08MB10898.eurprd08.prod.outlook.com (2603:10a6:102:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:56:26 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:530:cafe::45) by AS9PR04CA0179.outlook.office365.com
 (2603:10a6:20b:530::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 11:56:26 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 17 Apr 2026 11:56:26 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU4PR08MB11575.eurprd08.prod.outlook.com (2603:10a6:10:61f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:55:22 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:55:22 +0000
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
 b=zDWU/K5C1An2wjctgfujg6OqnlbUUOnPRWCRsPctFIkXoC/fX+Z15yTv2pyKVdnkUCWG4JOPkkQBRbprkFom0Qdkauq6DsG5tN+ifh+0qE8lQt5Vj3yCz8B+ShnjuatAmA/kZ9bLaFKwCEeEEzT7DE7BMLXhw7fwbjV6lKhKY+vdfi1gwpE7XJtVTJMk6OuPPeFvEI9SNmoW8HdYG+L8jpWDnjqqsfOtzq51rleJtKLv6p0BCQdvn0q8Jxw5T+Wf5FlA+pU/NNdXyxbAi6pfwzsl9yfp/O4LINPNGEmaQXGK7pzgV9ZYRlcAlHiN8tLvR8KnHcpmK4eGJbtZLSiP/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wuiRfqQ1aXL2n5kYPkCePV2+WdRyQfsmU2KIWQBVf0=;
 b=FnsqHHYfQkLa7kX3sle3sohMxYSStvy331KitDYNYIO+IMQxXyns0avV7qIB3SMmOLtfjULkH+xNPn/ZCONotY/K1SYM9rFbbCCAPtCLfyTeFi04v+9YQSXxoKp9hPaP5RN6TwTIgn9AnUWgQUEhnDw7CMohysvpMpAPp3c3b50uojUmE+F3qf6TWI4rXGlia3bIrTSV+V+6e+eRkuGAuIwNalskrYiaYb172+6Sp66pT0B5WRWuZZeryCO8TYJvyPLqSkglywq4P/gu3hkcrO1Dvkju8pKqpa8kgChhmkso1lUpYG9N0n1C6hX4h0e9wCrzgifIYDMNnqzhLD/Vhg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wuiRfqQ1aXL2n5kYPkCePV2+WdRyQfsmU2KIWQBVf0=;
 b=Bl0Jf9ScV+MW9gj86nDHAV3YLItqhkHwLou6zwY4tFCE9Q1Vxda5klOfdMlK0e0m0ZGb2L76QpaCnTmUlvCETIzifb5RzuZ2xpIIeFlSaaKBrfNlAMEcQPuws3w0WHM9EkAgGJLmuxjBKVHz9Ub0VrnNGT36So3Tk8llkReBOL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF28EOF8ozUgsn29i0tLJ3VC9JB1whpplsxGJVqbuNKY0m1gbYNTxVtVZSkNPdtr7jPkMsAoTEKPY72GsjEW9kr1bo/ULQHQC5BKHwh7BhC34LOpH6VZPUk0MM+mao4mgh3lhrmuRu073OOgzkJyTTyei+jmqEQhPHgbfLK3S+ZzCjo7C927JuKE9VMdUmyPbcmMTOhn7dNXPRHYaaMDxpQgAqk2UXkf2sQjIHOWbTi87INRYG+vs7+erIgHSOQuFVlRU6B583lc7Y44+Blbdclzycp8jlCtUU1N7zKrdmMCB5ZAeRThcxyhjsmsPVwAnW5HsEKR/mqiw2SH8L6Ijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wuiRfqQ1aXL2n5kYPkCePV2+WdRyQfsmU2KIWQBVf0=;
 b=frhguPguJUCygNtRbKsv0+Am3VV5SoQHRuFJFxFN1C1jFRoPZjNsikhTHbDFxpf0mQ8tpP4i4kz+zAQ9A7W2/846PalsOwdlukSIZ51nleGxfk7AsefC31crVzipuQ1r5uwqU5YnaSs1EDXKfngDfDFa1oPzUbnC5PR6hZq9qhTL/UpANmArHLvIjGig8mdKNtY95dhK3KNl0VI9fPnU0XHjSFSkmuyamRhNH3CW+ESQOz/7SxGd8sJ9suvNlflUD1e6HRVME7fG9Nu5CzBkop8rw89VdWj4Aiu1k4lkq66OjDjICkIHSRmAlDd5GVthz9iybkbhxCcAYP7/rpFCCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wuiRfqQ1aXL2n5kYPkCePV2+WdRyQfsmU2KIWQBVf0=;
 b=Bl0Jf9ScV+MW9gj86nDHAV3YLItqhkHwLou6zwY4tFCE9Q1Vxda5klOfdMlK0e0m0ZGb2L76QpaCnTmUlvCETIzifb5RzuZ2xpIIeFlSaaKBrfNlAMEcQPuws3w0WHM9EkAgGJLmuxjBKVHz9Ub0VrnNGT36So3Tk8llkReBOL4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Topic: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Index: AQHczko4909b0LdR6E6hEGKgM2/tzrXjJWsA
Date: Fri, 17 Apr 2026 11:55:22 +0000
Message-ID: <DB4CBEA0-B901-466E-80AE-483FE00A1282@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
In-Reply-To: <20260417091124.39552-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU4PR08MB11575:EE_|AMS0EPF00000197:EE_|PAWPR08MB10898:EE_
X-MS-Office365-Filtering-Correlation-Id: 56309858-cc2b-49c0-93d6-08de9c785aa7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|18096099003|22082099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 KpixDX2nCVeMn0IiKOsao00qNswRZqVJmVtn6VFNCfHAkOW8VSg/68m8YMdEc+dfcCSIv/YVJYxnErElhw3buNfPKzZkn53lFnasprv2ir4Y2OddazlSf0JddbYs5xre4ahYkj5Hn6h6xO5VA7NyksGqlOXgTusr0MUx+0qF1endZVCDCNj0IEa78fydwIK2G8iaK6ZhUQwWA+wFmVSFlS8K+TJ/d8HOZjtFyptQogJhs8zJsWrLaaR6LXGKolzZ+qAPHhdxnJ9uR7mkrapTP7FvaSxA7+2CPkUrzVq+Ifa44NvvzM3U/8Z0jYzYRSKN2dzDLopZP40sCFtbLho4JV40uTOO2NiYtf9PvOdcjfEc79yCLPl2M+dNj+ka8MM2qHzBsxRq9FaIatTj3uSpVwSxJDX08uWORj+pVn//vwZsQYvDpi3Ha5c0C1h8gphvcxCb3DOaeFQze9FMRPcNYIf2etYtuyP+7b4X0WZosoKnCqU0kFjJPIyqjL0Xd4908T8U+n6o8/IouvVLQqIlnJMc5DXnsLClTXraoQJRw7DM5BSTN0L0X+GFHQXDTz66MCTyOXDQGx1wwcVGmBomJP235aVxYPfHwrY8NorPR7XdS3UZyFBxuSjOYtUcqSA236usHNmG7q9kVNS3N6U7KXVFlR0bzaFC6vintP367nuHVDTTCUCcPeB7ETl+ysGg/J6vbEMV0GjL04d1I+KxRrt3nFC8wD5opx/3CJBomK7b3pV+HKS+eJUhAsN2isAYxESjWrskyi4y2xHgc9pYF6CFQo+s9UYndz43w0aEzxI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(18096099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F96CC863FCA9DD47B4316FCCDDBF011A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ts2rQvHgSiAgbsSLePehzs2C2Y5fHmdfBctJHLazlsL6cF8YhywwGgwYmNzc7R8vW9jGIIxt+NTDeDYeQbizHnndihzOlKf5t6zLD+3f8TiwqQ97jqSib2A21D7VvQr0k6PZFCHhNthfaKUMTadVZ4xbgHMd+g2di+/IOet03cvk6XVCIh2CfQB6Ykbqc6UA7sSkT6doIzxsF5/5+KK8mxkaOQbjiVx8IQ8eDp0ZXaUVJna+r3OtFdkID8O6OgncE3CIRkfl7rNM67tz+/hNDqDK3P1JwOmlZ3TlWcex7PeVwWvstQ3VE5hGcBO9nAZye3S1V7ErmLpRwhs8xaL3XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11575
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45eea7b3-7469-48b9-59d6-08de9c7834b3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|14060799003|36860700016|56012099003|18002099003|18096099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y9RaDFUvm0Mjt1cuJlX1JYm81GFxari4eJ9Rz1i86BcZ8/N3mVfwffc5nUePthR+MOn8vCAZ02RcZ0WO7UhVBZTbXny+Ka2XbEDYoge4gT+YwH7A3Ohr/J/qkLQ+MH95etaiStz3vP/1VSR8TRx63naY2V0z3kF+G+AVZAOeBEseVAv/yjowLxP0G6sWpdiTuHB+GmYCtSSioK5ZMZrKqfpnDzfKUAb4ibs79GjEfTdygvrf+6v9DBeDp9YJdi2hdPJzFBLZe++cOGe9HMwbq6yZD0ZE/B0p4flvIAb887/fLzKGCpp8/YLPV1uYCxLgBIQ1zZrKmujsoHvE8fdO18cZTWJ7glKHX9j9acNHLIlnhJBJdbpKat1kynl5Dd6Y6EvuetwY3i5NPi1WzzIraIY/wFR6SMhsjGnVL7tgIVxbqOomD8R2Zos2jNnj2b95fWm3AnLgtqa1Fv7SkLKK55dq1m8SSwSovRDg4ZKHL3QWc6Amg8EkJMFYUJQeSqxwOoIEZYd3XMoF8TEHB/oz+vh105UPFEaEYUD/6w9xXry2EX0EiJiFMmFYFsQyJWbrY+ZEwF9n3Zr0/r2csVBUy0wYxAD5vbWckCWugIYVv374eCi1t5MROfGFl1cc9kw+5pT70GubnrH+yqMeR1uSPRcmmKYwZS8NbA4z5uekpz4XevKJRiXja71KCiNeQIWoEy23gGCs6TXTUMe3ZmsVdDGFobEmYhdae8i4cVHBr2n53BejnHghC5FzXKd8pq3LPkLxxz/NunldpTt4E7YUBA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(36860700016)(56012099003)(18002099003)(18096099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fmJHCDHuj0I2EK+QF9HWE3ksnDBgpclet8sc0zuFsMINNI+UEjlmmMuzA8Dr+r8qq4SNQUQUuVlP4X1R1Hqibe2LGbrTIxdfqORdaVEXUPan6rLXwojcDll+6uQ6mTK4H7X0m0G9j05ijNWudk9IrrqQ8e9tOb0uZGxQ85GYXsE9boyCKF+iN41ChvV1vtDWG9NxbCzo2WPajAgm5H2ZRUFlD7iJoILOQjHtaw2A9+CDi7Ombc34gHv2WU8ZMRnqHFIuvL5siwzw8cXWBexC43OsPWPzI6xyJ7sDqXs8HZ5BsQQUwuQbk6Nl4m1Y+KrD7XsD3WAAAgdzYWkJSA0vMmk6kRpgsInKAobJzgb8pHjONssQVYLEWhGkgqq7XBgvWE/Dd8/WB1rWrgkW2gCdtVVssnZHLUxYJpSwzOSxAVxu26EoHUBtlVLp/J9OqjeE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:56:26.3064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56309858-cc2b-49c0-93d6-08de9c785aa7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10898
X-purgate-ID: tlsNG-ebf023/1776426993-30E443FF-9A178883/0/0
X-purgate-type: clean
X-purgate-size: 10780
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 1B0FE41AFB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HI Michal,

> On 17 Apr 2026, at 10:11, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Refactor setup_frametable_mappings() into init_frametable(), modeled
> after x86's implementation. Instead of mapping one contiguous frametable
> covering ram_start to ram_end (including holes), iterate the
> pdx_group_valid bitmap to allocate and map frametable memory only for
> valid PDX groups, skipping gaps in the physical address space. At the
> moment we don't really take into account pdx_group_valid bitmap.
>=20
> This reduces memory consumption on systems with sparse RAM layouts by
> not allocating frametable entries for non-existent memory regions.
>=20
> A file-local pdx_to_page() override is needed because the generic macro
> in xen/include/xen/pdx.h does not account for ARM's non-zero
> frametable_base_pdx.
>=20
> Update the MPU implementation to match the new init_frametable()
> signature. Since MPU has no virtual address translation (ma =3D=3D va),
> hole-skipping is not possible and the frametable remains a single
> contiguous allocation.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> We've been using this approach at AMD for a while now. Without this we wo=
uld not
> be able to boot some of our boards that have huge holes in the PA space, =
so I
> consider this patch a great improvement.
>=20
> Two things to consider as a follow-up in the future:
> - change generic pdx_to_page, page_to_pdx to take into account offset tha=
t
>   on x86 is zero but on other arches it is not. The page list code is
>   for now unaffected because the offset cancels out,
> - use the same on RISCV.
> ---
> xen/arch/arm/arm32/mmu/mm.c   |  3 +-
> xen/arch/arm/include/asm/mm.h |  4 +-
> xen/arch/arm/mm.c             |  2 +-
> xen/arch/arm/mmu/mm.c         | 77 ++++++++++++++++++++++++-----------
> xen/arch/arm/mpu/mm.c         | 23 ++++++-----
> 5 files changed, 70 insertions(+), 39 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> index 5e4766ddcf65..0b595baa11b3 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -178,8 +178,7 @@ void __init setup_mm(void)
>=20
>     setup_directmap_mappings(mfn_x(directmap_mfn_start), xenheap_pages);
>=20
> -    /* Frame table covers all of RAM region, including holes */
> -    setup_frametable_mappings(ram_start, ram_end);
> +    init_frametable(ram_start);
>=20
>     /*
>      * The allocators may need to use map_domain_page() (such as for
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.=
h
> index 72a692862420..2eb8465aa904 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -196,8 +196,8 @@ extern void *early_fdt_map(paddr_t fdt_paddr);
> extern void remove_early_mappings(void);
> /* Prepare the memory subystem to bring-up the given secondary CPU */
> extern int prepare_secondary_mm(int cpu);
> -/* Map a frame table to cover physical addresses ps through pe */
> -extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
> +/* Map a frame table */

NIT: Would /* Initialize the frame table */ fit better the new helper descr=
iption?

> +void init_frametable(paddr_t ram_start);
> /* Helper function to setup memory management */
> void setup_mm_helper(void);
> /* map a physical range in virtual memory */
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 6df8b616e464..e6b651956927 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -62,7 +62,7 @@ void __init setup_mm(void)
>=20
>     setup_mm_helper();
>=20
> -    setup_frametable_mappings(ram_start, ram_end);
> +    init_frametable(ram_start);
>=20
>     init_staticmem_pages();
>     init_sharedmem_pages();
> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
> index 6604f3bf4e6a..4b4da349c16c 100644
> --- a/xen/arch/arm/mmu/mm.c
> +++ b/xen/arch/arm/mmu/mm.c
> @@ -8,16 +8,37 @@
> #include <xen/pdx.h>
> #include <xen/string.h>
>=20
> -/* Map a frame table to cover physical addresses ps through pe */
> -void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +#undef pdx_to_page
> +#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_ba=
se_pdx))
> +
> +static void __init
> +init_frametable_chunk(unsigned long pdx_s, unsigned long pdx_e)
> {
> -    unsigned long nr_pdxs =3D mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) =
-
> -                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
> -    unsigned long frametable_size =3D nr_pdxs * sizeof(struct page_info)=
;
> -    mfn_t base_mfn;
> -    const unsigned long mapping_size =3D frametable_size < MB(32) ? MB(2=
)
> -                                                                : MB(32)=
;
> +    unsigned long nr_pdxs =3D pdx_e - pdx_s;
> +    unsigned long chunk_size =3D nr_pdxs * sizeof(struct page_info);
> +    const unsigned long mapping_size =3D chunk_size < MB(32) ? MB(2) : M=
B(32);
> +    unsigned long virt;
>     int rc;
> +    mfn_t base_mfn;
> +
> +    /* Round up to 2M or 32M boundary, as appropriate. */
> +    chunk_size =3D ROUNDUP(chunk_size, mapping_size);
> +    base_mfn =3D alloc_boot_pages(chunk_size >> PAGE_SHIFT, 32 << (20 - =
12));
> +
> +    virt =3D (unsigned long)pdx_to_page(pdx_s);
> +    rc =3D map_pages_to_xen(virt, base_mfn, chunk_size >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the frametable mappings\n");
> +
> +    memset(pdx_to_page(pdx_s), 0, nr_pdxs * sizeof(struct page_info));
> +    memset(pdx_to_page(pdx_e), -1,
> +           chunk_size - nr_pdxs * sizeof(struct page_info));
> +}
> +
> +void __init init_frametable(paddr_t ram_start)
> +{
> +    unsigned int sidx, nidx, max_idx;
>=20
>     /*
>      * The size of paddr_t should be sufficient for the complete range of
> @@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, pad=
dr_t pe)
>     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>     BUILD_BUG_ON(sizeof(struct page_info) !=3D PAGE_INFO_SIZE);
>=20
> -    if ( frametable_size > FRAMETABLE_SIZE )
> -        panic("The frametable cannot cover the physical region %#"PRIpad=
dr" - %#"PRIpaddr"\n",
> -              ps, pe);
> +    max_idx =3D DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
> +    frametable_base_pdx =3D mfn_to_pdx(maddr_to_mfn(ram_start));
>=20
> -    frametable_base_pdx =3D mfn_to_pdx(maddr_to_mfn(ps));
> -    /* Round up to 2M or 32M boundary, as appropriate. */
> -    frametable_size =3D ROUNDUP(frametable_size, mapping_size);
> -    base_mfn =3D alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20=
-12));
> +    /*
> +     * pdx_to_page(pdx_s) in init_frametable_chunk must be page-aligned
> +     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees th=
is
> +     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple =
of
> +     * PAGE_SIZE by construction.
> +     */
> +    frametable_base_pdx =3D ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COU=
NT);

We are now rounding down frametable_base_pdx which before this patch it was=
 the start of the ram,
but in xen/xen/arch/arm/include/asm/mm.h, mfn_valid(mfn) is using frametabl=
e_base_pdx to check for
mfn validity, this means that we could pass an mfn before the start of the =
ram and if __mfn_valid is happy,
we are getting a regression.

Can this happen or am I missing something?

>=20
> -    rc =3D map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> -                          frametable_size >> PAGE_SHIFT,
> -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> -    if ( rc )
> -        panic("Unable to setup the frametable mappings.\n");
> +    if ( (max_pdx - frametable_base_pdx) > FRAMETABLE_NR )
> +        panic("Frametable too small\n");
> +
> +    for ( sidx =3D (frametable_base_pdx / PDX_GROUP_COUNT); ; sidx =3D n=
idx )
> +    {
> +        unsigned int eidx;
> +
> +        eidx =3D find_next_zero_bit(pdx_group_valid, max_idx, sidx);
> +        nidx =3D find_next_bit(pdx_group_valid, max_idx, eidx);
> +
> +        if ( nidx >=3D max_idx )
> +            break;
> +
> +        init_frametable_chunk(sidx * PDX_GROUP_COUNT, eidx * PDX_GROUP_C=
OUNT);
> +    }
>=20
> -    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
> -    memset(&frame_table[nr_pdxs], -1,
> -           frametable_size - (nr_pdxs * sizeof(struct page_info)));
> +    init_frametable_chunk(sidx * PDX_GROUP_COUNT, max_pdx);
> }
>=20
> /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index aff88bd3a9c1..9c568831c128 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -186,16 +186,15 @@ static int is_mm_attr_match(pr_t *region, unsigned =
int attributes)
>     return 0;
> }
>=20
> -/* Map a frame table to cover physical addresses ps through pe */
> -void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +/*
> + * Allocate a contiguous frame table covering ram_start through max_pdx.
> + * Unlike the MMU version, MPU cannot skip holes because there is no vir=
tual
> + * address translation (ma =3D=3D va).
> + */
> +void __init init_frametable(paddr_t ram_start)
> {
> +    unsigned long nr_pdxs, frametable_size;
>     mfn_t base_mfn;
> -    paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
> -    paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE);
> -
> -    unsigned long nr_pdxs =3D mfn_to_pdx(mfn_add(maddr_to_mfn(aligned_pe=
), -1)) -
> -                            mfn_to_pdx(maddr_to_mfn(aligned_ps)) + 1;
> -    unsigned long frametable_size =3D nr_pdxs * sizeof(struct page_info)=
;
>=20
>     /*
>      * The size of paddr_t should be sufficient for the complete range of
> @@ -204,11 +203,13 @@ void __init setup_frametable_mappings(paddr_t ps, p=
addr_t pe)
>     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>     BUILD_BUG_ON(sizeof(struct page_info) !=3D PAGE_INFO_SIZE);
>=20
> +    frametable_base_pdx =3D mfn_to_pdx(maddr_to_mfn(ram_start));
> +    nr_pdxs =3D max_pdx - frametable_base_pdx;
> +    frametable_size =3D nr_pdxs * sizeof(struct page_info);
> +
>     if ( frametable_size > FRAMETABLE_SIZE )
> -        panic("The frametable cannot cover the physical region %#"PRIpad=
dr" - %#"PRIpaddr"\n",
> -              ps, pe);
> +        panic("Frametable too small\n");
>=20
> -    frametable_base_pdx =3D paddr_to_pdx(aligned_ps);
>     frametable_size =3D ROUNDUP(frametable_size, PAGE_SIZE);
>=20
>     base_mfn =3D alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
> --=20
> 2.43.0
>=20


