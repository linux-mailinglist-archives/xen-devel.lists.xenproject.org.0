Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5DF8B85BD
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 08:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715242.1116754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s23rN-0006CG-2M; Wed, 01 May 2024 06:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715242.1116754; Wed, 01 May 2024 06:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s23rM-00069r-VX; Wed, 01 May 2024 06:54:32 +0000
Received: by outflank-mailman (input) for mailman id 715242;
 Wed, 01 May 2024 06:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UTMh=ME=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s23rK-00069l-Kh
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 06:54:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260e::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a732249e-0787-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 08:54:28 +0200 (CEST)
Received: from AM0PR02CA0116.eurprd02.prod.outlook.com (2603:10a6:20b:28c::13)
 by FRZPR08MB10997.eurprd08.prod.outlook.com (2603:10a6:d10:136::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Wed, 1 May
 2024 06:54:24 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::3e) by AM0PR02CA0116.outlook.office365.com
 (2603:10a6:20b:28c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28 via Frontend
 Transport; Wed, 1 May 2024 06:54:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Wed, 1 May 2024 06:54:23 +0000
Received: ("Tessian outbound af213ececc3d:v315");
 Wed, 01 May 2024 06:54:23 +0000
Received: from 01be3ca9c208.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3251D331-81D3-4D21-8DA4-2E54B2FA1F23.1; 
 Wed, 01 May 2024 06:54:17 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01be3ca9c208.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 May 2024 06:54:17 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by GV1PR08MB10854.eurprd08.prod.outlook.com (2603:10a6:150:161::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 06:54:12 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda%6]) with mapi id 15.20.7519.035; Wed, 1 May 2024
 06:54:12 +0000
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
X-Inumbo-ID: a732249e-0787-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NKW6VNwYg3nJs7JnHe5TrE0sqaE4r2/D1UlM0wQM+Nla4K05JyGYuSm5Uqc/520pVHCo+wVWhr8V0YSOYUljA/Pm07k6yak9bdljKRyVqhQlGw3JG3cRt5cBZJiP6PcQ5x+dXyNqisfvP3HxH57fYXcX1tU3rVgiFLiyp/dD3wHCDZe3Jt/m8qy2iIzPZG7cMXa9JNJe8qd1uRVaeTX4Mr60X0/qJ8s/CgLdyE8dnhpC5RxoQR8zF33DtJYUUGerpkYX3h+n825a3uIXU7tqP1LgovfAC5+oHoedJpflBZvHgSqEwEkVGj4HBVaITJNZOS8w3GkRonbW/Ix0y2sc8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6wnQxmYQEs6x1K3g2n0Y17L5Gq9s/LAONIJZAEUtJE=;
 b=VYPMZX3t6nDxK+16m/v+OtKtJ0s80tQYDRSnL5pukHah8HacDGsKHdqLuFyQWMmiTt3146QA7tW2rqwJJQAscWpL8An7JwE7n1e1t2OwV2qewKeaIguHYmBQE+MsqVTwNZ410m17olXVs1mNfbJ8b3n5RhBOoS7U+aPlN6UeWppbKTrfMXNV0Qimw/rLuciPewiqCkYRk23ubkQ1OlULcnU3XRlKroOjfd165FMvISC5X+lYJNXPrjqdKC0RsVDT/fsMuvWDwuIoB8RVwjmZj0R7Z8rb2YmYtKp9vYSVgnIlLD99mHKFxo0aYQBjCIwbfETcmxQbh+M4HJCSbjjzBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6wnQxmYQEs6x1K3g2n0Y17L5Gq9s/LAONIJZAEUtJE=;
 b=igOFEGp4QcjcQyGEBTRz+ncbYVUGzUFU1PLfCPo4sJclwoUDsIBEkcgnQ+WybYvPf182laZscypfgsr+UAYIttdCiEqLZf6zqDSNDFbpOuIqW9GPev1jlN3akIeY2284AMtbFtc0J1bt7e761lymmg+KxLHfoksRVjVXiSGKh3w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9d8f8adfb55b057
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxJZH8gapmQ0MCh6OVhFu7ZXlNn1Jm0/SozpvRNxeeYegg/DWVbKUumsoeT8hshgFYJCPyIymZ0u4qcNsNG1itbIJSD2ehTMMrX1wZ8oXhH+apwkycxk3bQihHgpi6qqlDWXl4+ol+Q3mNuuqKFe2yBWS/pAUi1EaV3ll2M+bmu97N9qraAhDmwMjMLz80U922tFxBAK9iSHe3VIh5a/qxaINPbw9u1cw5vIyq/l7xBuktQQC12jyG4Hwnh64RRvhXGyLUtZwcvCR3mkuV6C+es/YP+39RonaVl31rJllHrWtgnPvH+jCU95HxiQLjet6Qvj6Be2OKaFjOlNqlXDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6wnQxmYQEs6x1K3g2n0Y17L5Gq9s/LAONIJZAEUtJE=;
 b=AA4vTXtAL5sbIt5axdYnlf3YohyZWfLrKd+aqt+wvJ5xyhTLDdaESAZk6C06upvj9RBWpoxLYeA1J5rsIFdzpeBsuS1KKxYXm8bNCKDjRbZMjiC7bQNL050ywRh/XdeIkZl0iL3Ho+RCHFRdB5ed6alW+eJltHTb/20LUiLNe+mcMhwpS2bSnUp8xDMSi3g4nTCsvsdZPhXorZyEljVdBSCFOPn3EUbbzOq1q4ZSZR8h8QjBCMhfam/uTR/o6T0DnpvDb4rtRqRiOe0Js5udAgbW7W2AsH002/frR/8ly3ytrcoI3uGP4WLsAfZxzTSKzesbY8HweI6ACm9I//weYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6wnQxmYQEs6x1K3g2n0Y17L5Gq9s/LAONIJZAEUtJE=;
 b=igOFEGp4QcjcQyGEBTRz+ncbYVUGzUFU1PLfCPo4sJclwoUDsIBEkcgnQ+WybYvPf182laZscypfgsr+UAYIttdCiEqLZf6zqDSNDFbpOuIqW9GPev1jlN3akIeY2284AMtbFtc0J1bt7e761lymmg+KxLHfoksRVjVXiSGKh3w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Thread-Topic: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Thread-Index: AQHamu7vn3o+gufgI0eDMZNP6vgeorGAsTwAgAFBl4A=
Date: Wed, 1 May 2024 06:54:12 +0000
Message-ID: <2AB02E85-2746-4DD6-A821-B858E52A6954@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-2-luca.fancellu@arm.com>
 <cd2352aa-e94b-43ef-b3fc-359cc1f43fb0@suse.com>
In-Reply-To: <cd2352aa-e94b-43ef-b3fc-359cc1f43fb0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|GV1PR08MB10854:EE_|AMS1EPF00000047:EE_|FRZPR08MB10997:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fd1e70-8969-400c-d00a-08dc69ab8902
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S2ZNK09rb1l6bS9BWEFLelRkTGpJUEQxbjRLaEZoS0doUlYzYmxHVTV1NytV?=
 =?utf-8?B?M283em5SNTNMUWFhOHFMUGd5SjNOWmR3Z2dDSHgremZBWUJhS2s5RXJ0akow?=
 =?utf-8?B?U1B1V0trSitnNEp3SHNXdEJ0N1NRZHpuejhra1lKWGVVNCtWMThROXcrMmF2?=
 =?utf-8?B?a1VreVpxOWpLc0hnWVNQNTJNb3poaDRyd1BGNnJWMEVyOUk5TWwwR3ZSaHJH?=
 =?utf-8?B?eUVqeTU0SDVpaXVNb3J5OFpFRnNkUmpkaGhiRXhQRWs3UVpkUTdERG1wSkJB?=
 =?utf-8?B?UUVpYWVYS3pSVkZZNFduaEEydFB0N2hIVWpWcG1kT2s0NmVqVHlQdE0rT0dr?=
 =?utf-8?B?eVRrY1FFUVNIN1hnZi9BbS9OZnQ0cTIzOHoyN0V5T2s0ZFhZNk9pY2t2UFU2?=
 =?utf-8?B?RlVBbGtLamVHdmdHYmZ3UWEwanVaY2llYjZzWUwyRWRSU2dQeEcxL2xadTNh?=
 =?utf-8?B?eUxJdUJ3ZnkzLzFOMUtNR1RiN2RBYklJS3JacSs1cFdmVG42QUh2SzUzdFA1?=
 =?utf-8?B?blJPbytURmNHU25QcUlPMDEwbDc4THJVMzRESEtGdkJBZTVpbzhseUNaQitQ?=
 =?utf-8?B?MGdiU01pR3JyaW1DcVZwaWhkRjZxaWlsL21rU2tOb3dKemVmNGVhSm50SmtC?=
 =?utf-8?B?cVJqa1cxc1Fud1dvOEI3K0dsSzgwRHdyeCtxaUJyRXFZTHRrWVQ5UWRoNDJF?=
 =?utf-8?B?UTJiZnZYKzRqbXpKZDNJYThQYUx6R2ErYVAvMmNnSmdpUzY3VEJiMWlyRS9J?=
 =?utf-8?B?MmhDS3YrbElHWkFkbUlGYXN4eGQvZzhFTjk3Rmpxa3d1bGdOeEdjeDhRTGRs?=
 =?utf-8?B?Vk9jS3QzNGljUEs5ZlVUeXlWWlk2d092SnFab2drZGFxdHUwZkZvY2FydFdl?=
 =?utf-8?B?bWJzbWV0dUNSdkNmM1pXcCtvYTBBVFRsOHIrSUZWM2RiUFJCNXFNVHdpL1JK?=
 =?utf-8?B?S3ZLMERFaFNPeGZxcmt2Ty9DMm1XdDFORmMvOTNGWVJ1VTZ2U2RFUm0zaUly?=
 =?utf-8?B?TjZmdStCeGpZYnZWM0xCUlhaNmtJNVdnc2tPN2NnTFJ1VWpwSFNPTnlveUVS?=
 =?utf-8?B?Yi81WkVBb1BJMFRGbVYzVU5NSkxFbUEwRmsybG9pUXVEOUJLdjl5WXlkTmpP?=
 =?utf-8?B?WWpIY2ZjNmVrK2krSVc3aFVxZUdGQTlrWWkwT1NyQ05nVEo1a0dhRExYVHQ3?=
 =?utf-8?B?bksvWHUyYzVHZExYMFdFTkc1UDBWSXdQbEpsbGR1YmNtakZ5eUcwREF6R2hw?=
 =?utf-8?B?MTZ1WXdScC9weWNPUFlsZ3Q0Q0J2NG1ONjFvMzZQdDdlN0FOa3kzQjJaNUh5?=
 =?utf-8?B?Q2VjeW1nbTNYNGtHa2E1RUdaa3YzbVgwc0t2OEQrajd4WnpWbkd3QS84eTJW?=
 =?utf-8?B?ZDRUNVhRSG9QcU16bjZYdjdMRHUramZIVGQ0akdjb0RSbWRNS1pTWUozMzFV?=
 =?utf-8?B?cE54RTZDTzZmSC94NytYUnc5aG0za1ZNRVRLUDI2K0JUczhjVVdTNUhoVHVJ?=
 =?utf-8?B?dmY5NW9jSDlscXYwWTFuRmRjWUZRMjJWZlJOOUoxTHFTZUNUUk9haU8xYnVt?=
 =?utf-8?B?VytSdkg0MENCckRQRDdoeDNMa2tWOUk0dnFZc2wza1F2K3o4d0piVGFEUVVF?=
 =?utf-8?B?dVQ2Uk9VSlJQZFFLdFBCZURkaW5HeVljcGlVeUZIZWhxUy9sODgxaU1WajRu?=
 =?utf-8?B?VG5IZEtqTVNJVm5hRUVNRng2bXhzb2RuNzRONEJwanhEQUdzWGxOZ21nPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD6A70CA13D48E4DAABBF57EA3D64557@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10854
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e534cc95-a711-4097-2447-08dc69ab8215
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|35042699010|82310400014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUNiZG0raGdhS1cvek5LYzk5aE5ma0NmTVgyRDJqVjBrWU9adkdCckdnOEJD?=
 =?utf-8?B?VEhzbUZnUDFGSnc2Y29xTGcyTUorWHlva1hHU3h5eFBqbXpSbFpFbnJsenZZ?=
 =?utf-8?B?ZGtsTm8yT2VtRkc3d0hiQXpKN0FEYmJLY2c0MnBXV0w1d3FQQWxoWGsxQnA3?=
 =?utf-8?B?bStpTU5pWTYrQmV1SGQ0STFRVXlDU1FiNGRLdU1WaUJCUlEzcnk3QjJsdmxh?=
 =?utf-8?B?VHZOYjhJT3FrZnFwNXdFTXBzaFlsTDRJSGlTVUVRSitwSkhPK2JDTkgrNkxq?=
 =?utf-8?B?VXlURFA1OEdTaWtkb3NwZGR4Rnp3UFcycGlDUGEwVW1QanlCV0RtZ1JiVEVo?=
 =?utf-8?B?YVFtcWVBMDZCV2pzRjBlb2FwUEg0bE5jcS8rRXBDbSswaUlkRGlhOVVpT3lR?=
 =?utf-8?B?ZXVCVjd3aitVVlB2K2pEK2dadFMxQU02YzlpcUlicHlnS0N6MGdCcjFYSUI5?=
 =?utf-8?B?VDgrV2drY1NqNkp6Z3BFN1BrUmd3YVJrYkZGcUxqcWRnRVVzc2RuTzRjN0JV?=
 =?utf-8?B?M2RNRi94elp3OUptK091RXphcE9HWFhpYnluZjNTS0lqRXBBRTM0SjdEQ2V4?=
 =?utf-8?B?OXZwTmdYcUhManpkcW1CVmF4UXNHRVNzWk5jY3hxWlZ6OUdNVmFhMXBQTkdD?=
 =?utf-8?B?ZXJkckZTaEFsUlNSdExCV2J3d0ltSm5wSXFuMWtRWnhPZyt0TGhhUCtNQ2pF?=
 =?utf-8?B?ODZWOEIwSFpsZXMzdTcrelR3UFo3MjFKUjRqVEZwS3pDSFltQ3dhZVBwMitW?=
 =?utf-8?B?UlZLRGhkUTQxOW1DT2NyVzdoM3hGV1ozSWw4cTJPeTlhcGNQMGVTNUlNUnhR?=
 =?utf-8?B?eFFUWTBCcDhwektwSG5CQnpJZmlPMHpqQ3g5WVVBNmhnTWxJVmt5VGZQRTlt?=
 =?utf-8?B?WEdHdUxqNHhUVTYraWlQZFRuV2p3QlNFajRYd2dJQklObTRoa1RUb29wT3kr?=
 =?utf-8?B?Z1YyYXZGSWJDWGM4cEhTRFQ1RWd3Rk43b0FHRkROZFVLNkFva2ZzVS9OQWFh?=
 =?utf-8?B?a1c3WG94ZnNhTWFkNmkvZzBFYjBvdnVyTWtrL2N6VTdiVEgwZ2N3TSt3RzI2?=
 =?utf-8?B?cS9WM1NWTmgySW05N0oveVcva044MkwxS3NGdy96cUV3R2owUTFOQXBJeHQ0?=
 =?utf-8?B?bVg2bDlRTEdZS3A3bndpR1VEY0N3akJ2MUFVK1hPRzB3ZFhxTHp6UDA3cUFr?=
 =?utf-8?B?RDBsd0x1N090NlREY3VUWXR0RXhEeEtOWXpjT0dIRUZBZlovRlNCOXZpMUQr?=
 =?utf-8?B?VVhENzZycXpGYS9IcXFEeWZuenJvM0x6Vi9Hc2pZWlgwdlA4RUFLWjBReU42?=
 =?utf-8?B?WW5hR3JDWi83M0R1VllCNWxrVFdoYi9XSWpZMTNTK0ZpSkRpa3cyZWJvbVNX?=
 =?utf-8?B?TEZPdGp2c2s0OWU0T3RNdXVpTm1odFkzeTBIOUkrNU1WenlTYklqYTJxaklR?=
 =?utf-8?B?cVNwZWVrZlROcmdDOUx3QTYyL3VRQTRaRzFhVW9BUjRvcFJrclB6ekk2SnNs?=
 =?utf-8?B?MWhqT1BEMnFHN0RFQmxlMUtrMjl0Y05tcGVDMlZmMlBLV2RvQXFGdG5KTjVN?=
 =?utf-8?B?UTc1SU8wazk3cFJxSFpWSTJ2d0g5aWlaNVNoc2lUS2tlL005V2dTek9DWHN5?=
 =?utf-8?B?Y2J2NUdtL09rYjZuRUNVa3prOU4ybEI4SGVScW1rdnR4Y3pDQStYdlZJS2V6?=
 =?utf-8?B?VnBSWnJlY3VGZjh4L1QrOFpFc0l3RWdUNHdrRU5qZzhIV0w3bzdUWTlaT21M?=
 =?utf-8?Q?qXCdBzMh9D9jk2W56/GbaA4brBzmgCG0LEcsbWJ?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(35042699010)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 06:54:23.8129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fd1e70-8969-400c-d00a-08dc69ab8902
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10997

DQpIaSBKYW4sDQoNCj4gT24gMzAgQXByIDIwMjQsIGF0IDEyOjQzLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAuMDQuMjAyNCAxMzowOSwgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaA0KPj4gKysr
IGIveGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oDQo+PiBAQCAtNTQsNiArNTQsMjcgQEANCj4+ICAg
ICAgICAgdHlwZW9mX2ZpZWxkKHR5cGUsIG1lbWJlcikgKl9fbXB0ciA9IChwdHIpOyAgICAgICAg
ICAgICBcDQo+PiAgICAgICAgICh0eXBlICopKCAoY2hhciAqKV9fbXB0ciAtIG9mZnNldG9mKHR5
cGUsbWVtYmVyKSApO30pDQo+PiANCj4+ICsvKioNCj4+ICsgKiBfX3N0cnVjdF9ncm91cCgpIC0g
Q3JlYXRlIGEgbWlycm9yZWQgbmFtZWQgYW5kIGFub255b21vdXMgc3RydWN0DQo+PiArICoNCj4+
ICsgKiBAVEFHOiBUaGUgdGFnIG5hbWUgZm9yIHRoZSBuYW1lZCBzdWItc3RydWN0ICh1c3VhbGx5
IGVtcHR5KQ0KPj4gKyAqIEBOQU1FOiBUaGUgaWRlbnRpZmllciBuYW1lIG9mIHRoZSBtaXJyb3Jl
ZCBzdWItc3RydWN0DQo+PiArICogQEFUVFJTOiBBbnkgc3RydWN0IGF0dHJpYnV0ZXMgKHVzdWFs
bHkgZW1wdHkpDQo+PiArICogQE1FTUJFUlM6IFRoZSBtZW1iZXIgZGVjbGFyYXRpb25zIGZvciB0
aGUgbWlycm9yZWQgc3RydWN0cw0KPj4gKyAqDQo+PiArICogVXNlZCB0byBjcmVhdGUgYW4gYW5v
bnltb3VzIHVuaW9uIG9mIHR3byBzdHJ1Y3RzIHdpdGggaWRlbnRpY2FsIGxheW91dA0KPj4gKyAq
IGFuZCBzaXplOiBvbmUgYW5vbnltb3VzIGFuZCBvbmUgbmFtZWQuIFRoZSBmb3JtZXIncyBtZW1i
ZXJzIGNhbiBiZSB1c2VkDQo+PiArICogbm9ybWFsbHkgd2l0aG91dCBzdWItc3RydWN0IG5hbWlu
ZywgYW5kIHRoZSBsYXR0ZXIgY2FuIGJlIHVzZWQgdG8NCj4+ICsgKiByZWFzb24gYWJvdXQgdGhl
IHN0YXJ0LCBlbmQsIGFuZCBzaXplIG9mIHRoZSBncm91cCBvZiBzdHJ1Y3QgbWVtYmVycy4NCj4+
ICsgKiBUaGUgbmFtZWQgc3RydWN0IGNhbiBhbHNvIGJlIGV4cGxpY2l0bHkgdGFnZ2VkIGZvciBs
YXllciByZXVzZSwgYXMgd2VsbA0KPj4gKyAqIGFzIGJvdGggaGF2aW5nIHN0cnVjdCBhdHRyaWJ1
dGVzIGFwcGVuZGVkLg0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgX19zdHJ1Y3RfZ3JvdXAoVEFHLCBO
QU1FLCBBVFRSUywgTUVNQkVSUy4uLikgXA0KPj4gKyAgICB1bmlvbiB7IFwNCj4+ICsgICAgICAg
IHN0cnVjdCB7IE1FTUJFUlMgfSBBVFRSUzsgXA0KPj4gKyAgICAgICAgc3RydWN0IFRBRyB7IE1F
TUJFUlMgfSBBVFRSUyBOQU1FOyBcDQo+PiArICAgIH0gQVRUUlMNCj4gDQo+IEJlc2lkZXMgbXkg
aGVzaXRhbmNlIHRvd2FyZHMgaGF2aW5nIHRoaXMgY29uc3RydWN0LCBjYW4geW91IGV4cGxhaW4g
d2h5DQo+IEFUVFIgbmVlZHMgdXNpbmcgMyB0aW1lcywgaS5lLiBhbHNvIG9uIHRoZSB3cmFwcGlu
ZyB1bmlvbj8NCg0KVGhlIG9yaWdpbmFsIGNvbW1pdCBkaWRu4oCZdCBoYXZlIHRoZSB0aGlyZCBB
VFRSUywgYnV0IGFmdGVyd2FyZHMgaXQgd2FzIGludHJvZHVjZWQgZHVlIHRvDQp0aGlzOg0KDQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gv
MjAyMzExMjAxMTA2MDcuOTg5NTYtMS1kbWFudGlwb3ZAeWFuZGV4LnJ1LyMyNTYxMDA0NQ0KDQpO
b3csIEkgaGF2ZSB0byBzYXkgdGhhdCBmb3IgdGhlIE9yaWdpbiB0YWcgSSB1c2VkIHRoZSBTSEEg
b2YgdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyB0aGUgbWFjcm8NCmFuZCB0aGUgU0hBIGRvaW5nIHRo
aXMgbW9kaWZpY2F0aW9uIGlzIGRpZmZlcmVudCwgaG93IGFyZSB0aGVzZSBjYXNlcyBoYW5kbGVk
Pw0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

