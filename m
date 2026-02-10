Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B4KFu9ai2ljUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:21:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0611D118
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226634.1533141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqTh-0005KW-Ih; Tue, 10 Feb 2026 16:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226634.1533141; Tue, 10 Feb 2026 16:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqTh-0005IF-Fv; Tue, 10 Feb 2026 16:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1226634;
 Tue, 10 Feb 2026 16:20:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KCy=AO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpqTg-0005I9-9d
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:20:40 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bd06fc1-069c-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:20:32 +0100 (CET)
Received: from DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) by DB9PR08MB8673.eurprd08.prod.outlook.com
 (2603:10a6:10:3d3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:20:26 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::e6) by DUZPR01CA0309.outlook.office365.com
 (2603:10a6:10:4ba::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 16:20:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via
 Frontend Transport; Tue, 10 Feb 2026 16:20:26 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBBPR08MB10842.eurprd08.prod.outlook.com (2603:10a6:10:533::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 16:19:22 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:19:22 +0000
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
X-Inumbo-ID: 6bd06fc1-069c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D6MiqnvQfmJGpWM6vXUf8OLaTbe3GNA/RKwIcakRU026BudyqCqh8x/ucqA+D7d6vRQBHBWgcsHfcBiDqBWDNQQGQZH9yVFqssfIxUfDs+a+aTXIkqgp9E54/xqHJ29UGh0NWF0u2pzYW4Tb/jj6fTTqQk8nHA33F3SqPmhEWvSG3wbE1XwuNOIw732W4L6MPzThrkN4zhjY2sKbTpAMxBmhwMShIkprq7loft4gSWS3LDBLo9AjudWvzwZGOcpjsfywnbJaj99iH75JcwkGM3UTq0AGYckMsf5S4HVxsOafi1CoJFeFaCa+If0IgGUVXd58MGRUouGbuzpB42ysrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuES9yc2kGEuLr8wj2cvtaI/4i6YVtbc9iDdEMJS0u0=;
 b=VHEga9XzI37sEsooTOzg4VRtDt7Ycp9xdyLI32rYS624wR70cUpgrXHEu74ToJTW9fy2EhMnM59tRkFKKvELIEsYMs5wubjpoSYmop6C1S5FBuWzQBIBC4z4UyW/nckFQQS8J+BBGqsKez38+Jp/6EIEiwMeCBMFhqEy+kqL+3jkRyFlSyvYxIz8wI42QB3NF13VHD9Z2t7XQ1ybeOBUsXl5mnnB15v8moAyaynfT8t2n6YVGXvaJpz5NlQGmJvCfTfvXVVudLTgP3f0xHdjmSJsLCztkdJyK38E0raMmdxyJ7scoUS5lRhcWZm8ucdcKBocjYbziQOIZFvhyXmVOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuES9yc2kGEuLr8wj2cvtaI/4i6YVtbc9iDdEMJS0u0=;
 b=Gg7bBT4rbRonWdoMsY2JO+sQ5R0z9KoFSTrmXFJboxNnBFb2uJ4yMAwu+y39us81zD/pRB7C5UAnojRH32jq3qgDixlySNhbYegp2qXaCqK6M621D/KPuXv1M+mtBMZktbuCO+YPgAPiuvyeLNIq7U2QnCypaITeZNaxjVUWxY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egINlBbaBtTGoYvnMtR889JOLWj4cnMFDNyzAvFahXsGJmAMQwkEEIGEJrdi+2Y2SzCArTjXrAa22GL6L+/i3gumDmKC+WrhPGqx8L1pWsRXqDwvxjy1czs/VpuabMRuDqX7cR6R2N2A1ktRT9tI8RIzvTRR+5jVLv+ZhI1ZSggHDFnB1tNqGCVpajsxbv0ZjO4CrBCRS2ASEldIomD+n6h94yxRr5UUSs1ULmsLoc5TYZNWCaUfbGQz7+ihHQic+hPdnkp5wSdygm1ra1eSoi2h1nHzZD03AObER52JZ5ihl5jF0UpknmxmTCGIZAMPotfsSfhT/zu+XOgcNMFuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuES9yc2kGEuLr8wj2cvtaI/4i6YVtbc9iDdEMJS0u0=;
 b=Il8BkqtqCihbm4+71G+GR4Rujb0wGUc5CyfvbEvp0X+1fsnYXBxx5pDSm+lTT1+kSwQvRcaaudccmQLdOOzCXa3KGyfLK3R3SZHcfgLkGvFIE3gAppGby9zOrDK5g3X9EVbaBbli8MRNJCXVbh0li7/7ad8+nC8EQmVbV62ttexOQTYJmV/4wF5jm+48smwK+CHO/rJaD9vvHaB4eMNRL/lz1jdjgllCJXFb1c6umgMMtxXI+CVtXtZoXwbAvjOr2UJjSbF2lyRmjb9r1LmioXd76VJN7t+bviU+g2XmeJ+xg9WWtB5rCbekEQlLL/yJLYNvmmsNJC/5Acd/7Ckxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuES9yc2kGEuLr8wj2cvtaI/4i6YVtbc9iDdEMJS0u0=;
 b=Gg7bBT4rbRonWdoMsY2JO+sQ5R0z9KoFSTrmXFJboxNnBFb2uJ4yMAwu+y39us81zD/pRB7C5UAnojRH32jq3qgDixlySNhbYegp2qXaCqK6M621D/KPuXv1M+mtBMZktbuCO+YPgAPiuvyeLNIq7U2QnCypaITeZNaxjVUWxY4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
Thread-Topic: [PATCH] xen: always consider '/' as a division in assembly
Thread-Index:
 AQHcmp+J15vvFrxtUEGxE7lRiZXN1rV8EwEAgAADNACAAABcgIAAA2IAgAABnQCAAAEsAA==
Date: Tue, 10 Feb 2026 16:19:22 +0000
Message-ID: <686F47A1-44EC-40C9-A766-909D90CD6356@arm.com>
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com> <aYtVBuHVcfZE-L-a@Mac.lan>
 <1115BE16-FE3E-4F9D-BB32-77064580D5E3@arm.com> <aYtYKlcoVAFvn8jh@Mac.lan>
 <5d656a16-467e-4603-b5c6-e388303ecd38@suse.com>
In-Reply-To: <5d656a16-467e-4603-b5c6-e388303ecd38@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBBPR08MB10842:EE_|DU6PEPF0000A7DE:EE_|DB9PR08MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: f20d036f-ab32-495f-2775-08de68c04cc2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dzFmanVvcEt5d3pBRi90LzdZSGt1OHBrRG0vajdCZmhtQ3VHeHMzQUNoMDFh?=
 =?utf-8?B?ZmIvSmdyVGM4ZUF4YXpHS3lZNjFqUlZOTEcvK0xmWURDcGRYazBpTWxoakR3?=
 =?utf-8?B?OWdWMU8ydDlLTU1pcmY2N1VTZkpGd1orR2pzbE1HQXNCMjczSnZVOUduRDRm?=
 =?utf-8?B?dmYzNHBjeWh4N2F3ZDI4cjdjR0JUdnpoQ2pBQUZJTUl6L1lNQ0NONEpwYkVW?=
 =?utf-8?B?TjhlenJLRHVaN1A1WTM0OG15bG52cWNQVG1DcDI1TlV4cUc0ZVZ6SFRhOW1F?=
 =?utf-8?B?bXpJR29sZis5Zy82c21qdjFyME9OaTZEekNNUmlqVmVBYW1GT1JQTTREV242?=
 =?utf-8?B?UW1iWU4wUFJQMUlOM3dzTHR4U3Z3THQweFNGaXh4Y1pmbEVkOUlwTnVOdU9X?=
 =?utf-8?B?QVpDUU1vNjJTL254andTL0dsWllHVm1iMzdYem5MMzV3L05wSVFDZjdSb1E3?=
 =?utf-8?B?ZExvTG52dHo2NnR4YzMvSTVESmlyZGJyNGNVdnBCYXE4TGlSV0tGNFFmdUtK?=
 =?utf-8?B?M2Z5V25md2ZOdzBGV2NIKzNteExZSHFXSVcrRXJUSFptQXV6QjdDcHI0ZWxn?=
 =?utf-8?B?Mmk1eWcvc3pJY2lFV3Z0b0tSSng5V1hGWjBLOG9RUWE1a1FXY0NxVHRHeTlx?=
 =?utf-8?B?MG5UQ0ZLU09ac1BMWExkQ2lqTXgrcVNDczZaV2ozMEVublh3VG0zcHd2WUlE?=
 =?utf-8?B?MGJmZjBvOG01TkF4Q3BDcEFMNUFqcGQwVGxyTDRSbmZqWUIwNmZUT2hNODFp?=
 =?utf-8?B?MlU3WVVjcHQvZVppVmJxUS93dzgvaXpyRGF3SXd5TmZ5ejdCTU5VRDBFVm5O?=
 =?utf-8?B?TG5zUnhJQ3I1WWx3NWlLdE5ta1A4a0xpb2NROVhZK085THJHek1jRStaL2do?=
 =?utf-8?B?MWFwNHlGZkphTzlWa0hiRitJc28wUGxLUDdWbENCaUtZN29MU0NZL2ltSnRa?=
 =?utf-8?B?bGJmeThtdDh3RUZYN0pqSmMxaVU0UXJMS0E3K2JKSUd2c3daRjJZNTRqa203?=
 =?utf-8?B?TGh6RHNoS0g2elZBOXNMd09MOWFPc0FOOHExeTNWN25hcDZqNlhCZlkyWFdI?=
 =?utf-8?B?eVpYbEE3ZTBHQmFMdWFzU2VMNzRjTSsvYjlZRlZ5Q1VaQkZKd2J1MmlzUGZF?=
 =?utf-8?B?MTZrT2dCazk1MkpoN3ZBbFpXZW9YWjNDUndhYVFiajlNZys5T2VGeFZtYWpv?=
 =?utf-8?B?UEZRdkw1d2RMa1Y0Mncxd2o2bzlXbTBVeFZaSWU3dEJyR2F4REtubk4vS2RN?=
 =?utf-8?B?TDlvTit3VFN0eExSVzR1ekt0ZG9yZTRWTC9QL0ZGTys3M0RyVnA1OHNOa0N0?=
 =?utf-8?B?QmxkSGltazhDYUVJTFJQNE5DaStwVWJaU1JEMm5mRFB4cjU3ZGJBMWRLYUlY?=
 =?utf-8?B?ZmxtTUp3Mk83YllVQ255NGc3d2Ftc1dyb2ZYQWdHaGJXeURTRlcwc0YzVUV5?=
 =?utf-8?B?QW9jWHJqd3BlQi9DNHA5bzlqZExnRXNZYWV3OWNHa0M1OHdibmlCSngzWHl6?=
 =?utf-8?B?YlAyZCtOZEEwMG12SWYxWFRTVDJrKzR5bVNKZUtjeDlJMjBWS3lDVUdmVEhn?=
 =?utf-8?B?cXQ5NXVHWTVscWNBR2xEdDRSdnRpa3hPSWlKc2hyUGlTQU94L1llNW1DOGZY?=
 =?utf-8?B?aXpUcGlkcXFtQU5odEg2eTBtY2pBby9oUC91THM4Y0ZQYnNleHhINWlMRmdr?=
 =?utf-8?B?anBVbS9lYWNrOC9EdTFndVhQMzI2NkxNQ1o4N253ZEIyRlJPOE5VWHZrWmV3?=
 =?utf-8?B?T0J0QXBONEFnWTM5aHZ0dlJtOVBpR1dYTVZLaFdtM1dCbDJGamNFODMwWWs0?=
 =?utf-8?B?eWxGSW1tRWgvR2VQa2hlN3pob2xldGRyb0xZdUZ2dmJjM0NKc0FHR25EWmJI?=
 =?utf-8?B?MkZHbkowM044dTNySHRhSUREU3RLRzdxNkRqNlFYakJNNUJQK0VTb3YwUlFJ?=
 =?utf-8?B?S1c5TzRXejZobWtwUlUvNG1wM09iWjdDT0EyUG5JcUwwU2FEMWJBbnNpcmRm?=
 =?utf-8?B?TVdUZ01KWWVUVm9Na3hZVk1OUzRLWkdvVHIrSHJjK0kxcnNRMjJrbU9PS3Ry?=
 =?utf-8?B?V1RwTURaUGF6Q0t1Z2tXMDlDNEhWTkVqc2ZIc2NlV1Z4MzVDaHl4VWpyOTZs?=
 =?utf-8?B?N0lXVHZpTFBaUDN2ZGY1TGVZTHVoUlBJV0RRT0I4dWkyZTQxSTBIR1dkNXNL?=
 =?utf-8?Q?t1Kb8S8Njrc8RUuA5Io3UQM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <921F515FF8C40F4EBCCE866B5673A503@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10842
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74758086-9ee1-4289-367d-08de68c026a9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|14060799003|1800799024|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXlhYlB2aytHOTBTOG9pMXhpOUN0N1BHMHhvSWRBRTk3UWNGaUZES3ZMTkZu?=
 =?utf-8?B?Z1AvMERENFNzOFI5bzY0VGUzaTRTMjVsZ3p4czEvUkZ3eWdvQ1AwL250Ty9p?=
 =?utf-8?B?RVczZnNLSjJidE5NclBiVU1ENFlKTUMzWi9kNTVMa09nT2hSZXMra0UvM0hu?=
 =?utf-8?B?dDY4TG9BQU0rSlJZZ0hsQnVSRWtqNDMxa0dQSlh4Sy9HV1RoekRsRVR0WERw?=
 =?utf-8?B?SUZscE9aS2RiWVFZQmlCc3hNVitNTnA3MWc4U3JrNUMyemwzbk5ENjMxWEE2?=
 =?utf-8?B?czNtSWpoV0R5SWMzMWRsbFM2enNNUjlNRmZNa2t6dFp6Mlc5MWtja25JalBj?=
 =?utf-8?B?QWl1SnV5RDE2bENxUFNNc012cVNwSXE1cElwVnJsUjFNT0xIRFMvY0R3aitC?=
 =?utf-8?B?S0twbWdhVFZDVDQ1R3JTUWRHMm8vYm9zUEF6NGtEb0R5RVpVSDZPa1BXTVdq?=
 =?utf-8?B?ZVZqbll2ZlJtK3RLOExMQWVlV3hMaE9ZOTlwSTNPY20wQWVoeDFtT1U1UE9i?=
 =?utf-8?B?NnpieEZjeTlNK3o2WlJMSUF1NVFsVnFMYlZZVDhvOS9qdFVpbyttU1o2bGF5?=
 =?utf-8?B?WHJ4U2VFcmVQT3FaVlpSK0Q5TkhXaGIzZGY2VlVaelVjeHI5bW9IQm9GeDhk?=
 =?utf-8?B?M0dPd3lKaEVzU0lnWXU2S2NnNjNTZkZpQjhQUlZYd1dFY1lnbm5mb2xld1p2?=
 =?utf-8?B?K1FPazRaMk1LdElSYjFzWWVERThHRTVJRElrNWhCaFN2bjlvSU8wRTVBTW1H?=
 =?utf-8?B?TzJHWDNaZjdNVXphYkVoaUhyUFRQd0w3QWp1dHdVT0Z6enZPcXd5VU5YZnFW?=
 =?utf-8?B?SHp2dzBEdEl0Yk1aS3p1c09Zckg1eGRuYlFEMEV4VVlUQVhZU2dybHRkcWZW?=
 =?utf-8?B?bW13UExKNktZbzRGNzh1MEpEVDEveE1FZFFHWVI5TGpQbmRLWTBKaGdrSHNI?=
 =?utf-8?B?WGFuUE44V1NQc3cwczBJQzIrNUJDd0ZCM0lyS2JxbFgwalZScFpPSGNpcFpB?=
 =?utf-8?B?K0FBT2hxbzg2aDAyQUx0aHFNRFA0ZXlsSEQrMnZxSElZZDRYek9LSFM5a1g3?=
 =?utf-8?B?b3Nhc29RSlpEQ1NTOEloK25ra2h1UUl4YzE5Nml0aUFRYk0vemxYSm5qY2dj?=
 =?utf-8?B?Y05LR3Z1QzdRY0FwZklZSStGTVNZTk1YSFM4aWFKVjNvdUNwNW9FZ0ZpTW9M?=
 =?utf-8?B?eHVnbU1lL3V2T2kxeENYSFVJSHFySDlSM1QwM1JuSkFqOGJFb3E0d0RaQVR3?=
 =?utf-8?B?ZGRIZEtLWkxhb1FVY3BXRXh2eTA5a3lVb0gvUjNqRVltdEpHamF2SHpuZlh6?=
 =?utf-8?B?Ty84bFZOMmxJWWRRdFhWdmFsclBUWXJKY2dieWd3SnAwWmdtSWRqaHVIMDIz?=
 =?utf-8?B?cUd6T3NMeHFoSHhzWi9od2d2OExhYzBJTU8zalhwVGFpQUUwbkhvdytIbTFM?=
 =?utf-8?B?VmwzYmhqWjAzZE5hVFpQcjduV3hCblpqYkViSkE5UWhQWXFTUUpCR3VDdjZI?=
 =?utf-8?B?TnQzUkdLcTRoMExyR3M5WU0rQkJhdGVWZ2dSNG9HSTdrSDVycnBib1E3Ni9V?=
 =?utf-8?B?d2JFMTZLeXpWUEF4QU5aMzgzaGNNbU92dGRSSnIvMk9iK0NlY2t6WXk2ZXpJ?=
 =?utf-8?B?dlRGTG12SVZRdjdWbWJUZk9jNk9KR3I3bUtTbEJZMUpGVG9JM08rdC9HcGV3?=
 =?utf-8?B?UFFIUGJHdEFIK2w3NmI4QUZWWDU3RU40ZjFyNnNvblJHMHZhWTh1NWdQekpX?=
 =?utf-8?B?L0ErQ2hTa3FuVVZoTXRxZ0EwdmN0MHlpQzhvWE15ZGdvdGM2TGhReDJFdVN6?=
 =?utf-8?B?UUJJd3Q5QW0xSXdWNGdFT20rRWUwYndWdHZYaGhZWDMvRCs1ZU9QZWZwc21G?=
 =?utf-8?B?ZjF1SEcxRC9yRXNtcnpROUdHSmNzUWVTNE1hN2N4eDlDcWJLeXNEUHlGc0M5?=
 =?utf-8?B?N0JUTmEvd1IyYnkrK0M5SEY3OFZONlV0Ukt0a0RFcFYrQkdhb215Z1hxVi9s?=
 =?utf-8?B?NmpHVWNLTCtGbXlFQ2RGZFh2MXBKcXZQMDlETTdOc1Y5SStpWXE0UjhLNHpF?=
 =?utf-8?B?QUhlVTRXWFh4NkoyS0dJNXJEMTZvalREc1hLaE1WK0tuUlpKbEhtY0pGeW56?=
 =?utf-8?B?VHlmN3hjRTBMc1dialVxclZPYlJPNCtIWEx1NThka1o2RGwyMDYwZkRYOFJm?=
 =?utf-8?B?RGZnMGxhbGlINjl4RmRtMmNKMlFpeGoxUS8ra0FOWlBnbGVBa2d5RThhemlV?=
 =?utf-8?B?aStKQlQ1dU9CejU1bk9ENDZXOCtRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(1800799024)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1jtpxYQ8Ea355HVALZOnxXfvfyNrnr6hdWwqtUP23fQ/AyTBVYVfU86sfcaEyspiYk1CufLyCciJSsIyFeQ9uWDlX9xOmo3TC2AlhJPhymc2tdIyQTfhFxxwdxHk8H9+3oG/YVVqB71hkL0QgGlL2LMf9wuacgubO2RmwIm3PEV1Zj9euvkAIt2XC3595p8MT7KqH/umsmYEgbA+lM4ECNXjd9q5lIKDR1moSAHUI1vKxbUGHpO2syYiOrdBuKjAuFUlhCaktY6dt9Xv65fBDgXWlQtIzo33P2c3CQe2rtnuWMdUDpMKeRIe/eiQzhctRrtNsbi6WMFlulH4CHP/mfbq+64FwEZHIOo1DpNEq9IfutYB2SyzjI5x//8L1MOT2tAo/eWXnf1h2TBWl82VyrafEKWFzEv7Lj5mrArGXqmocfmh9DgAwO3GfDdHnIIe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:20:26.3013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f20d036f-ab32-495f-2775-08de68c04cc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8673
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:email,arm.com:mid,arm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 93C0611D118
X-Rspamd-Action: no action

SGksDQoNCj4gT24gMTAgRmViIDIwMjYsIGF0IDE3OjE1LCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTAuMDIuMjAyNiAxNzowOSwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToNCj4+IE9uIFR1ZSwgRmViIDEwLCAyMDI2IGF0IDAzOjU3OjE3UE0gKzAwMDAs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gSGkgUm9nZXINCj4+PiANCj4+Pj4gT24gMTAg
RmViIDIwMjYsIGF0IDE2OjU1LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBPbiBUdWUsIEZlYiAxMCwgMjAyNiBhdCAwMzo0NDozM1BN
ICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gSGkgUm9nZXIsDQo+Pj4+PiAN
Cj4+Pj4+PiBPbiAxMCBGZWIgMjAyNiwgYXQgMTY6MTEsIFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IEdOVSBhc3NlbWJsZXIgd2ls
bCBjb25zaWRlciAnLycgYXMgdGhlIHN0YXJ0IG9mIGNvbW1lbnQgbWFya2VyIG9uIHNvbWUNCj4+
Pj4+PiBwbGF0Zm9ybXMuICBUaGlzIGlzIGluY29ycmVjdCB3aXRoIFhlbidzIHVzYWdlLCB3aGlj
aCBkb2VzIHVzZSAnLycgaW4NCj4+Pj4+PiBhc3NlbWJseSBmaWxlcyBhcyBhIG1hdGhlbWF0aWNh
bCBvcGVyYXRvci4NCj4+Pj4+PiANCj4+Pj4+PiBUaGUgYmVoYXZpb3Igb2YgdGhlIGFzc2VtYmxl
ciBjYW4gYmUgYWx0ZXJlZCBieSBwYXNzaW5nIHRoZSAtLWRpdmlkZQ0KPj4+Pj4+IG9wdGlvbjsg
dW5jb25kaXRpb25hbGx5IHBhc3MgdGhpcyBvcHRpb24gd2hlbiBhdmFpbGFibGUgdG8gZm9yY2Ug
dGhlDQo+Pj4+Pj4gZXhwZWN0ZWQgYmVoYXZpb3IuDQo+Pj4+PiANCj4+Pj4+IFRoaXMgaXMgc29s
dmluZyB0aGUgaXNzdWUgYW5kIEkgY2FuIGJ1aWxkIGZvciBhcm0gd2l0aCB3aGF0IGFuZCBmdXJ0
aGVyDQo+Pj4+PiBmb3IgeDg2IG9uIG1hYyBvcyBidXQgaXQgZmFpbHMgb24gY2hlY2stZW5kYnIu
c2g6DQo+Pj4+PiANCj4+Pj4+IC9iaW4vc2ggLi4vdG9vbHMvY2hlY2stZW5kYnIuc2ggeGVuLXN5
bXMNCj4+Pj4+IHN0YXQ6IGlsbGVnYWwgb3B0aW9uIC0tIGMNCj4+Pj4gDQo+Pj4+IFllYWgsIEkg
a25vdy4gIEkndmUgZml4ZWQgdGhlIHN0YXQgaXNzdWUsIGJ1dCB0aGVyZSdzIGEgZnVydGhlciBv
bmUNCj4+Pj4gYWJvdXQgYW4gaWxsZWdhbCBiaXQgc2VxdWVuY2UgaW4gZ3JlcC4gIEknbSBsb29r
aW5nIGludG8gdGhhdC4NCj4+PiANCj4+PiBMQ19BTEw9QyBncmVwIGlzIGZpeGluZyB0aGF0IG9u
ZSBvbiBteSBzaWRlDQo+PiANCj4+IEkgaGF2ZW4ndCB0ZXN0ZWQgdGhhdCBvbmUgeWV0LCBidXQg
eWVzLCBtaWdodCBiZSBhIHdheSB0byBzb2x2ZS4NCj4+IFdvdWxkIHlvdSBsaWtlIHRvIHNlbmQg
dGhlIGZpeCBmb3IgZ3JlcD8NCj4+IA0KPj4+IHdpdGggdGhhdCBhbmQgc3RhdCAtYyByZXBsYWNl
ZCB3aXRoIHdjIC1jIDwgeHggSSBjYW4gZnVsbHkgY29tcGlsZSB4ODYgb24gTWFjIG9zLg0KPj4g
DQo+PiBZZWFoLCB0aGUgcHJvYmxlbSB3aXRoIHVzaW5nIHdjIGlzIHRoYXQgeW91IGhhdmUgdG8g
cmVhZCB0aGUgZmlsZS4gIEkNCj4+IHByZWZlciAkKCgkKGR1IDxmaWxlPiB8Y3V0IC13IC1mMSkg
PDwgOSkpIGJlY2F1c2UgdGhhdCBhdm9pZHMgcmVhZGluZw0KPj4gdGhlIGFjdHVhbCBkYXRhIHRv
IGNvdW50Lg0KPiANCj4gQnV0IHNoaWZ0aW5nIGJ5IGhhcmRjb2RlZCA5IGRvZXNuJ3QgbG9vayB2
ZXJ5IHBvcnRhYmxlLiBUaGUgc2l6ZSBub3QgYmVpbmcNCj4gZXhhY3QgbWF5IGJlIG9rYXkgZm9y
IHRoZSBwdXJwb3NlcyBoZXJlLCBidXQgd291bGRuJ3QgaXQgdGhlbiBiZSBiZXR0ZXIgdG8NCj4g
dXNlIChzdGFuZGFyZGl6ZWQpIGxzIG91dHB1dD8NCg0KU3VnZ2VzdGluZyB0aGlzOg0Kd2MgLWMg
PCAiJFRFWFRfQklOIg0KDQpCZXJ0cmFuZA0KDQo=

