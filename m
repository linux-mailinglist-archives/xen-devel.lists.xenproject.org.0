Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6AFA6DAD1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925476.1328347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhVc-0008N4-N2; Mon, 24 Mar 2025 13:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925476.1328347; Mon, 24 Mar 2025 13:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhVc-0008Ko-KA; Mon, 24 Mar 2025 13:06:28 +0000
Received: by outflank-mailman (input) for mailman id 925476;
 Mon, 24 Mar 2025 13:06:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDgH=WL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1twhVb-000892-0p
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:06:27 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca93292f-08b0-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:06:25 +0100 (CET)
Received: from AM4PR0302CA0024.eurprd03.prod.outlook.com (2603:10a6:205:2::37)
 by DU0PR08MB9632.eurprd08.prod.outlook.com (2603:10a6:10:447::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:06:23 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::b1) by AM4PR0302CA0024.outlook.office365.com
 (2603:10a6:205:2::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Mon,
 24 Mar 2025 13:06:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 24 Mar 2025 13:06:21 +0000
Received: ("Tessian outbound 24542e2cd8fc:v601");
 Mon, 24 Mar 2025 13:06:21 +0000
Received: from Lf77ac7e9b439.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 083FE6CA-B6D4-4638-A72D-E0C0E89AC9DE.1; 
 Mon, 24 Mar 2025 13:06:15 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf77ac7e9b439.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Mar 2025 13:06:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:06:13 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 13:06:12 +0000
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
X-Inumbo-ID: ca93292f-08b0-11f0-9ea2-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SDDHbR72k7lDtorM8cJ3XAPitgI+ITVNHIH5/UdT2d7boc1YJryXbhq+aEIUiRxLW3F2BcaO/MpY3asFuj6R5SIc7DKdG9UyEDPHFgDjBhy6voC3xArzKcx/hhXZQul4uscmHyNu5Kxt/t/Wu/u8SkAbMv+n0qgfzK8nK7aHBzG+Sic6nzV0oqta1MUcZ1FzqMoJtIjSwL2Vcci6sw6PO9+NHbKxHYb9d88RVN7UikfZhD1Ur/JukVNL/38VCFN1/TGvJZW5e/M9ci9Ip5/ur20t9M4lmoQFX9hXeeix0WDmyb/NWxkiMn6qwWVY6fVk2rAWRYJmAnenPYwSCmEYYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRbY7W6nBDQ/BsFocM18S6UTOukzomdPJfz7upo31T8=;
 b=Fd/1r/sqKbD4y3cf2Y8Cpey9RT0hVLqajESeDtQEBokqZvsprP8XSJiwfx9VfZRs5739NzS8eHY5OqLsktJ2TxFlymi2blMd9vLMQT6A44wo0ZjKanNZ8/sT3lugOJ3e4g/U4JWZiVZGcmwZdGrSqBXRxPWjxW2fYgqCrSO5bujILoAq8MViYDj0NJWGBmnGocKzeyY1tz8ifUDhNMH0oUNEj274W9jsh8jBgZwRT5S4kMyJTqwNaD9EMQbd7Uz3Mqj8wI3sZyhb3qkrMc42rGNaLC9LAunN0rJWM0ypKnz93tIDAejltP4qyLxWOxgVz6GeV24WDob+yTgJo9wI4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRbY7W6nBDQ/BsFocM18S6UTOukzomdPJfz7upo31T8=;
 b=IBCryQ9SOWsuebBDmAALpfgPBQD+kJz62l/zgGvFFylkLTVeinAatglIuHy6Xoi6eXSH8qX+UyTAvBbPgm/jsvyb19Ugfy7cEzZ7pdlsHdG+NYPj96CJWFtwsvUaYHG2F/fWmMl/o8HEYVWQAAIaeRm6gZ0WpJcwqKlnAoz0ZVc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31db31af8a15b78e
X-TessianGatewayMetadata: 4WIRV7BcSb7P5aNT1FysEvmlLjPAli8iSfi/aSZ88jJfZqdBjmE8A7ZqBWec6Yha/bGZKuvzSuq7q9dPztOAP6D3IsWOqprZlueK4KIq2TreO7ONIgo5XeOCYwP5AjIrjweVcSTpL4vvk8an7xO0mndDgUJj+wi88k+7fFyE0ZU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqoeJpvFxVFT48KU2SU3dVM9TVLYaE1fYcHMOoy39fBIk2euyi6ptvUjSfYj/A0Ox4tgt3iap/ww2q3BH3ox/Mb1XRQgZrrzC+89uUQUgkf5gZytUrjIlYjzYKhyquaolIEgL/7MxDrV34PnIEYQMxPKmMjz2yCBEzHN0k1ak5aw5zINotZuMD15feqNl8ASfypaMFt/eGD7BnJh4GFBgFHNYmNiWQVTGljy5EXDbd/VNtLZ9Hy7wJvVjnb+wji6ISrqJ8OZ2/03MzLHdRvyFad+CBvV8EGunpASVTQ0mhPfx+HDu4c6JhWTn6ZZ5beuDxP1qD0482bkB6X0EkzW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRbY7W6nBDQ/BsFocM18S6UTOukzomdPJfz7upo31T8=;
 b=hp/KPZ53uXkHmHOy2yuMkSokpqm6RLz9g0Mho3EmYIfINKYT1fj2x+RoHKIpZHdsgFF3EOU1wi7JFzGqu7N/9YlcE4vJcN7NN5jq+kfOQCiZH3noFe4+6DnuAVJTKEZ+R1UuYJgbD0P1z5nu1FWp+ZrJIE3qU7oW9Bcp766PMrIjEDM+RGLHjaQQ0dn6aC4dj5StP6RcqSWSJM2P2WVdosC5Ozs0+Zf+rh/pP0zLAKPa6AErIAi2bP7CZwP0nfbOGgLJxJqyGOiYnV/7FJqYT0gZcDVnN0/c0L3fusFv9NtyfI6nN446zb2eycsfNzDC0srRzTG7IXqiRkJFkQjCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRbY7W6nBDQ/BsFocM18S6UTOukzomdPJfz7upo31T8=;
 b=IBCryQ9SOWsuebBDmAALpfgPBQD+kJz62l/zgGvFFylkLTVeinAatglIuHy6Xoi6eXSH8qX+UyTAvBbPgm/jsvyb19Ugfy7cEzZ7pdlsHdG+NYPj96CJWFtwsvUaYHG2F/fWmMl/o8HEYVWQAAIaeRm6gZ0WpJcwqKlnAoz0ZVc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v3 4/5] xen/arm: ffa: Add indirect message between VM
Thread-Topic: [PATCH v3 4/5] xen/arm: ffa: Add indirect message between VM
Thread-Index: AQHbnJ1O44fIyxP5wE6DoPXuGC0lfrOCGXgAgAAoSgA=
Date: Mon, 24 Mar 2025 13:06:12 +0000
Message-ID: <2DC4DC8F-D484-4380-AE5D-A030E3DA8515@arm.com>
References: <cover.1742570590.git.bertrand.marquis@arm.com>
 <4a9867855093453eaad4f548df8e92162176eed9.1742570590.git.bertrand.marquis@arm.com>
 <CAHUa44HZ6rDL3t3p+SwJLencKLks5XfV6krHnKohL7owzaMBUw@mail.gmail.com>
In-Reply-To:
 <CAHUa44HZ6rDL3t3p+SwJLencKLks5XfV6krHnKohL7owzaMBUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB6351:EE_|AMS0EPF000001AE:EE_|DU0PR08MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ffc4c1-9bf8-48ae-8e30-08dd6ad4acb5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?amw5L2pxbFVrTnFpTUpOL3VEc3V4THF5Z25lNzN3YU0rNzhSRmNFTUtHU1pD?=
 =?utf-8?B?dW5OY0c3ZUZmOVRqbGZOVGpmNDY2NHdHdHFHUnRZTExzNHpySTZVbDJCc3Zi?=
 =?utf-8?B?TVV4cElodEw1NHdIUlpUaHhYVGlVQTZNWGt6b0gyanJVL3R3LytXRjNYRmRQ?=
 =?utf-8?B?a3JtMmxBR211Qm0wT1o0Szk0MjdCM2o1dHIzdkZZL2VOSkNGUC80U0l1VmVl?=
 =?utf-8?B?ZENua3Fta09vT1VOMWsvOXJJZXpFZW0vVFRVeENaRW5xUit6bXViNWY4UTFW?=
 =?utf-8?B?VXloMU41Y3g1b3NHT3ZHQ0FrbUJwOGw4WUp1UVBvVm0yMG9yZzVIOWFLN09T?=
 =?utf-8?B?dXRnOGxveGJCWWcvRUI2aUxEOTJvbG1hZDFYdTlITWs4N3NZMDI3KzBweGJI?=
 =?utf-8?B?RTBNdUFGWmE1MkdObzdKS2Q5NmFzTlhsOXFxaGlLeVk0dUtjV3BrTGZIQVpq?=
 =?utf-8?B?TkRKNDZ4SW41d3plOGFWWi9XOWJIcEhJcGtYZzA2K0E3dVdtUGRqRGhEOUl4?=
 =?utf-8?B?UmRyczUxUGluSTdGMnArSEVjT3Yvb0JvaVpUUGYrYWRLK094UkVGelcxWVhT?=
 =?utf-8?B?WFhWUGtFcGw4WFhZVVREeHVHWUNiQ3dmMGJWTk5Za0pIaWwzTWRyUmhvcFl5?=
 =?utf-8?B?eWhudjJDajNSYmVSZVBsV2g5c2hORXFJNE5LNklaUERzK09PV2dTeVpubjhX?=
 =?utf-8?B?ZmJyZHRqWDRxWXUyV2M3UVorN1VDK0VZSUdpMG5oUjBlL0QxU0xlbkhpUjN1?=
 =?utf-8?B?SitsS1Fxc1gvYW8vSU1pSlhWcWIyRTJKTUZTSzZPQmxRMTdXZmJLdGM5cmxm?=
 =?utf-8?B?Smx1elRXR0lsbTl5RXNKdzNXODhKYW1KRVRjaS9PSHZWN3RPWS9nMjRId3U4?=
 =?utf-8?B?WjVvSTZsL2hRaUxWMUhxUGhtMHBoVStQUUR3TU9NbXdVSndNWTdFajc0Q2xJ?=
 =?utf-8?B?b1djK09Mby9LMi9GUEdUblJUTEh2RFo5QUFuZVkxejYvNlBIUHJ4em90ak1j?=
 =?utf-8?B?QkFYMExlQmUrTTFTU0FNQU5ZVUJHd0FYTlVQdFpCVGFJemwzTEdubVBQYURE?=
 =?utf-8?B?akpiR0RPVUZWQS80bDU0QU81WFJPSmo2bkFzazRzWDlobkhqWEYxR3VNeHRW?=
 =?utf-8?B?N2xGT2pmZS96Vm5pcWVKMG9CQklzYnh3OTFIVnFFQlVjc0VkZnA1VEVINVZU?=
 =?utf-8?B?L3ZjY1pGa0lMMWFPZG5FcWdYd3hEZTJlVUI5bStxTGZaZWxMRHlUUTdpL3lh?=
 =?utf-8?B?L3dmYzcxYUxjbTJlaU9sQ1dzODM0UHpzeFR0dEdMcXZWazZtNm9EMHFmT0hv?=
 =?utf-8?B?S2RiWE9EMENPdDc3QU1Uc2hIYkhFcGhMcFhKeUJvZHhtN0tzNzZFQzFSM1Zu?=
 =?utf-8?B?b29uMHZwb25QeHhjb2Q3b01ndm02ZXdiS083OUx1QmJsR1luSWExZ1NtT0pH?=
 =?utf-8?B?M1p1ZTZLNytGTU8rOEhoTjI1UU44bmREdEV3NGJrdGRPdHhVb1FBU2VYemUr?=
 =?utf-8?B?SVRySUpqMTBERGUreHJaTkpTZVFLUUd0WUc2aDZHeVorVTg4eUFxdnpJYU90?=
 =?utf-8?B?S0ZaTldTdDdCMFJOV3BDTGpDSXE3Rk9FbHBhd3JKWnRhZ3dNenlFM0dqTmpk?=
 =?utf-8?B?cDhDb2VVSldWbTVHZ01ic1E4VXJQNEVSYjFlV05OUElaRHZscVJ6MTJHVjQ4?=
 =?utf-8?B?dnNIWmJOZXZzb0dubVhSVGVnc2Y2dWFKQXNybDJXR1VneFlHZDQyRGxSejFv?=
 =?utf-8?B?Vk0zZFhDTFBTOXBZQnMrcUp6WHEvclJZcGhHakRYa05lby9oeHkxWHpOVTR3?=
 =?utf-8?B?M3RIRmo2WVVpMDZoeDd2UllOTjFiMjlTNmVWd3lxSktTUkc0NjJEanozMXpN?=
 =?utf-8?B?VEZpVG1HeWpXY0RnYk1aVEplN0FzUjZmRlNhZlBUYStTSTQ0NjZ3RVd0VnV2?=
 =?utf-8?Q?RnqO0P0er4yHyGFf6jTP6/LR7lG5PPPM?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9C75D5AB66CA44A8E7A21267871BF06@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c209130-8c02-4bf4-8cbc-08dd6ad4a741
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700013|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mi95SGplMisvWloxaTh1Qi9VNE9lT2ZKYUJ0cmhrenVpV3EvWWh2MXI4amVY?=
 =?utf-8?B?N2dydTVuU3ZRN1BMMFVFQ0pJVkZyeGxyME1ZSzhKckp6UG9PRlhMYmZLcVBu?=
 =?utf-8?B?ekZwc0l6RE14Q0lTSXBMR2JQb01xWkdRT0JnUm8zMmowSnpqZ0g3RjZoWTRG?=
 =?utf-8?B?U2k4ZFY5U2lwL0h2VFRnT1NDa3ZXMFNiNVJmZU85Ti8wZ01mU3BFa2VtRitH?=
 =?utf-8?B?dEljdlFNMDA4SXNkT2hZUlhTdEtkakZVZkhTb2MyR3ZzZmZhVGtFYlk1Uzli?=
 =?utf-8?B?a0VSOXI3SWttQkQ4UzdqOENHWHg0TnFLR1JkQk5HYnBxcWZUVVdBc1pZWkxB?=
 =?utf-8?B?OXhodTFQRm5acHBrd2VqeHlQVmRaWTVmV1Z4Mkt5TUJjNS9KSFZ3K0NIRkpu?=
 =?utf-8?B?cVpHTFl2clkyWGFOaXJhcVpmZDdwNmYvTExMWjZKZUJObEVxRlhGdmNFalpL?=
 =?utf-8?B?QyttZXNyQ1FObndBNlNleThpYW1qblFYRmptVEhqWFhFaW9QdDBoMWxFakZN?=
 =?utf-8?B?RlZCaUlqaE1IUE9nV2NObCsraVZxNzkvZmY3WVRtaHd0NlZmMVpRMUxTUllr?=
 =?utf-8?B?NHRER3ZKV1gxRDNCdnVMUzh4WEhWcEFIMWtxMCtwVU0vamhOTkZJUy9IZis5?=
 =?utf-8?B?YkpPbDArbklxVStLbEovZ0ZiNGFJUjFqYnRZdFB6Mzgyc1pEcVJUVmJwcGpm?=
 =?utf-8?B?RGN0ZUxRLzIzMEpiWXpENFAzQUZray9aajB5L3E3SUNaZERLTEFaalE0aGUx?=
 =?utf-8?B?bklDNCtydXVaSjgzclluZTlDMUhRSG5qNkNVelhXb3Y0Rk5MWkNiNWtPcUlY?=
 =?utf-8?B?YmFzbEFoQ2ZPNlB5TFJ1OHd4anpER1RhbjhSc3Y5UHBjR1lLQk5DMFl4QkVk?=
 =?utf-8?B?cTMvbENFUktyM1ovSUx2UXFKU0FZTzBDRC8wb0Q0RCt5L204VGJJa0J0Wi8z?=
 =?utf-8?B?MTY1T3VWSVJvWmRGckNFUmpCNG56Mm9YMkpLKzh1eHNjTVdSTFo1L00yUUQ4?=
 =?utf-8?B?L09BdlduTDNXVHhVUC9rdE5lMXN1MGdrY0UvSkg1QVl0L2FFR05NM0c3bEUr?=
 =?utf-8?B?NG1MOFVmc1FaZEcvSUw4bGVLYTcvVngyYnlMU3QxeFdsdWpRWnVGTDhuWDdD?=
 =?utf-8?B?R0hucVFOTTNLeTRYOFNCVVo4OXA0c0lqMHdxN1BLTkxnYVJWRzYxcks0OGdx?=
 =?utf-8?B?QTRvT3JNeFJjRnlPbU1SSmtzbmthL2hHZWszZUx0RWtmbVZ0Nk1wK1Uxa09O?=
 =?utf-8?B?Q3JUMlViZ3V4bUJFT0JHOUg3SVdwV1gyYUVqd1NjT0lQSXFjT3F3anp5VHFG?=
 =?utf-8?B?WXlNRGJEU0hKVGRzcWlydUFHdEdLZmJrMDQxeDNoa0R6WnF5VVNmdDczOTBr?=
 =?utf-8?B?aUpDTkcwS3Z3NDVOeWNKZFk4dmxiY2ZyL1lpZFYwRnJ2M0R0R2dUd2hTckk3?=
 =?utf-8?B?dmVYN0x2RDR5KytmUzQ0cmNmQnNqSll6RUxtckdlUjdmOHpVVlgvd2ZYNEty?=
 =?utf-8?B?MGI0OFczUkQ2VUpzaFFUdWZqeXNvSGwxUVJOVDNMajBwVXR1TlhjMmlBUDMv?=
 =?utf-8?B?VkFtbzlzbncrSmxsMHJoc0pvWjNBd2E4QlR0dHYzOWUvWExkNnlRcnh1VFAy?=
 =?utf-8?B?LzR3YXd4M2w0amVsWk9rWFRaM3diVFgwcVJIcy80ckxVOFBKMkU5TTJXYW11?=
 =?utf-8?B?dTRQZlYyRVQ4dlRLM3FXMWk5Z2hudW0ySjBteFBCQklKd0JGV2xSRTRNT1BN?=
 =?utf-8?B?RGd1c3g3U2FSMy96TlpiY2MyL1RqOUdyc09wQjAyam9jb0ZYbEp2cUtnWFRV?=
 =?utf-8?B?NkpJOWcwNkNzMHBTdzJtY3RhMkhNdCtOd3hzZ2hnS2pmWUlBVWdBdEJqWjBi?=
 =?utf-8?B?anFHMWFQRGJiQ3ljdEp5bTFTYS9xZC81SGg1Q21QRks0QnJFS2k0aHA4SEt1?=
 =?utf-8?B?ZUM5azVuSWlGRzQxd2RpeXB1dTd1clhEMGU0UU5IVGkwVTBjR3N5ZGVkc3pG?=
 =?utf-8?B?bnVzVjQ3Mmkva0Y2eS93b3NqZE9yZDdFaktVaXhmcDlWMUtOUHN2bER3aFZs?=
 =?utf-8?Q?FuRNyS?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700013)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 13:06:21.9044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ffc4c1-9bf8-48ae-8e30-08dd6ad4acb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9632

SGkgSmVucywNCg0KPiBPbiAyNCBNYXIgMjAyNSwgYXQgMTE6NDEsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgMTA6MTXigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBBZGQgc3VwcG9ydCBm
b3IgaW5kaXJlY3QgbWVzc2FnZXMgYmV0d2VlbiBWTXMuDQo+PiBUaGlzIGlzIG9ubHkgZW5hYmxl
ZCBpZiBDT05GSUdfRkZBX1ZNX1RPX1ZNIGlzIHNlbGVjdGVkLg0KPj4gDQo+PiBTaWduZWQtb2Zm
LWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0N
Cj4+IENoYW5nZXMgaW4gdjM6DQo+PiAtIE1vdmUgdm0gdG8gdm0gaW5kaXJlY3QgbWVzc2FnZSBo
YW5kbGluZyBpbiBhIHN1YiBmdW5jdGlvbiB0byBzaW1wbGlmeQ0KPj4gIGxvY2sgaGFuZGxpbmcg
YW5kIG1ha2UgaW1wbGVtZW50YXRpb24gZWFzaWVyIHRvIHJlYWQNCj4+IENoYW5nZXMgaW4gdjI6
DQo+PiAtIFN3aXRjaCBpZmRlZiB0byBJU19FTkFCTEVEDQo+PiAtLS0NCj4+IHhlbi9hcmNoL2Fy
bS90ZWUvZmZhX21zZy5jIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0K
Pj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMgYi94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9tc2cuYw0KPj4gaW5kZXggZWU1OTRlNzM3ZmM3Li5jMjEwODNiNWU2OGYg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYw0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMNCj4+IEBAIC04OCw2ICs4OCw3MiBAQCBvdXQ6DQo+PiAg
ICAgICAgICAgICAgICAgIHJlc3AuYTcgJiBtYXNrKTsNCj4+IH0NCj4+IA0KPj4gK3N0YXRpYyBp
bnQzMl90IGZmYV9tc2dfc2VuZDJfdm0odWludDE2X3QgZHN0X2lkLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4ICpzcmNf
bXNnKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZHN0X2Q7DQo+PiArICAgIHN0cnVj
dCBmZmFfY3R4ICpkc3RfY3R4Ow0KPj4gKyAgICBzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHggKmRz
dF9tc2c7DQo+PiArICAgIGludCBlcnI7DQo+PiArICAgIGludDMyX3QgcmV0Ow0KPj4gKw0KPj4g
KyAgICBpZiAoIGRzdF9pZCA9PSAwICkNCj4+ICsgICAgICAgIC8qIEZGLUEgSUQgMCBpcyB0aGUg
aHlwZXJ2aXNvciwgdGhpcyBpcyBub3QgdmFsaWQgKi8NCj4+ICsgICAgICAgIHJldHVybiBGRkFf
UkVUX0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+ICsNCj4+ICsgICAgLyogVGhpcyBpcyBhbHNvIGNo
ZWNraW5nIHRoYXQgZGVzdCBpcyBub3Qgc3JjICovDQo+PiArICAgIGVyciA9IHJjdV9sb2NrX2xp
dmVfcmVtb3RlX2RvbWFpbl9ieV9pZChkc3RfaWQgLSAxLCAmZHN0X2QpOw0KPj4gKyAgICBpZiAo
IGVyciApDQo+PiArICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+
PiArDQo+PiArICAgIGlmICggZHN0X2QtPmFyY2gudGVlID09IE5VTEwgKQ0KPj4gKyAgICB7DQo+
PiArICAgICAgICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+ICsgICAgICAg
IGdvdG8gb3V0X3VubG9jazsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBkc3RfY3R4ID0gZHN0
X2QtPmFyY2gudGVlOw0KPj4gKyAgICBpZiAoICFkc3RfY3R4LT5ndWVzdF92ZXJzICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+PiAr
ICAgICAgICBnb3RvIG91dF91bmxvY2s7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgLyogd2Ug
bmVlZCB0byBoYXZlIGVub3VnaCBzcGFjZSBpbiB0aGUgZGVzdGluYXRpb24gYnVmZmVyICovDQo+
PiArICAgIGlmICggZHN0X2N0eC0+cGFnZV9jb3VudCAqIEZGQV9QQUdFX1NJWkUgPA0KPj4gKyAg
ICAgICAgICAgIChzaXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KSArIHNyY19tc2ctPm1z
Z19zaXplKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfTk9fTUVNT1JZ
Ow0KPj4gKyAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAg
IC8qIFRoaXMgYWxzbyBjaGVja3MgdGhhdCBkZXN0aW5hdGlvbiBoYXMgc2V0IGEgUnggYnVmZmVy
ICovDQo+PiArICAgIHJldCA9IGZmYV9yeF9hY3F1aXJlKGRzdF9kKTsNCj4+ICsgICAgaWYgKCBy
ZXQgKQ0KPj4gKyAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gKw0KPj4gKyAgICBkc3RfbXNn
ID0gZHN0X2N0eC0+cng7DQo+PiArDQo+PiArICAgIC8qIHByZXBhcmUgZGVzdGluYXRpb24gaGVh
ZGVyICovDQo+PiArICAgIGRzdF9tc2ctPmZsYWdzID0gMDsNCj4+ICsgICAgZHN0X21zZy0+cmVz
ZXJ2ZWQgPSAwOw0KPj4gKyAgICBkc3RfbXNnLT5tc2dfb2Zmc2V0ID0gc2l6ZW9mKHN0cnVjdCBm
ZmFfcGFydF9tc2dfcnh0eCk7DQo+PiArICAgIGRzdF9tc2ctPnNlbmRfcmVjdl9pZCA9IHNyY19t
c2ctPnNlbmRfcmVjdl9pZDsNCj4+ICsgICAgZHN0X21zZy0+bXNnX3NpemUgPSBzcmNfbXNnLT5t
c2dfc2l6ZTsNCj4+ICsNCj4+ICsgICAgbWVtY3B5KGRzdF9jdHgtPnJ4ICsgc2l6ZW9mKHN0cnVj
dCBmZmFfcGFydF9tc2dfcnh0eCksDQo+PiArICAgICAgICAgICAoKHZvaWQgKilzcmNfbXNnKSAr
IHNyY19tc2ctPm1zZ19vZmZzZXQsIHNyY19tc2ctPm1zZ19zaXplKTsNCj4gDQo+IElzIGl0IHBv
c3NpYmxlIGZvciBhbm90aGVyIGNvcmUgaW4gdGhlIFZNIHRvIG1vZGlmeQ0KPiBzcmNfbXNnLT5t
c2dfb2Zmc2V0IG9yIHNyY19tc2ctPm1zZ19zaXplIGFmdGVyIHdlIGNoZWNrIHRoZW0gYnV0DQo+
IGJlZm9yZSB3ZSB1c2UgdGhlbSBoZXJlIChUT0MvVE9VKT8NCg0KWWVzIHRoZXJlIGNvdWxkIGJl
IGEgcG9zc2liaWxpdHkuDQpJIHdpbGwgc3dpdGNoIHRvIGEgbG9jYWwgY29weSBvZiB0aGUgaGVh
ZGVyIHRvIHByZXZlbnQgdGhpcy4NCg0KTmljZSBmaW5kaW5nLg0KDQpDaGVlcnMNCkJlcnRyYW5k
DQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+ICsNCj4+ICsgICAgLyogcmVjZWl2ZXIg
cnggYnVmZmVyIHdpbGwgYmUgcmVsZWFzZWQgYnkgdGhlIHJlY2VpdmVyKi8NCj4+ICsNCj4+ICtv
dXRfdW5sb2NrOg0KPj4gKyAgICByY3VfdW5sb2NrX2RvbWFpbihkc3RfZCk7DQo+PiArICAgIGlm
ICggIXJldCApDQo+PiArICAgICAgICBmZmFfcmFpc2VfcnhfYnVmZmVyX2Z1bGwoZHN0X2QpOw0K
Pj4gKw0KPj4gKyAgICByZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+IGludDMyX3QgZmZhX2hh
bmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiB7DQo+PiAgICAg
c3RydWN0IGRvbWFpbiAqc3JjX2QgPSBjdXJyZW50LT5kb21haW47DQo+PiBAQCAtOTYsOSArMTYy
LDYgQEAgaW50MzJfdCBmZmFfaGFuZGxlX21zZ19zZW5kMihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncykNCj4+ICAgICB1aW50MTZfdCBkc3RfaWQsIHNyY19pZDsNCj4+ICAgICBpbnQzMl90IHJl
dDsNCj4+IA0KPj4gLSAgICBpZiAoICFmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9NU0dfU0VORDIp
ICkNCj4+IC0gICAgICAgIHJldHVybiBGRkFfUkVUX05PVF9TVVBQT1JURUQ7DQo+PiAtDQo+PiAg
ICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZzcmNfY3R4LT50eF9sb2NrKSApDQo+PiAgICAgICAgIHJl
dHVybiBGRkFfUkVUX0JVU1k7DQo+PiANCj4+IEBAIC0xMDYsMTAgKzE2OSwxMCBAQCBpbnQzMl90
IGZmYV9oYW5kbGVfbXNnX3NlbmQyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAg
IHNyY19pZCA9IHNyY19tc2ctPnNlbmRfcmVjdl9pZCA+PiAxNjsNCj4+ICAgICBkc3RfaWQgPSBz
cmNfbXNnLT5zZW5kX3JlY3ZfaWQgJiBHRU5NQVNLKDE1LDApOw0KPj4gDQo+PiAtICAgIGlmICgg
c3JjX2lkICE9IGZmYV9nZXRfdm1faWQoc3JjX2QpIHx8ICFGRkFfSURfSVNfU0VDVVJFKGRzdF9p
ZCkgKQ0KPj4gKyAgICBpZiAoIHNyY19pZCAhPSBmZmFfZ2V0X3ZtX2lkKHNyY19kKSApDQo+PiAg
ICAgew0KPj4gICAgICAgICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+IC0g
ICAgICAgIGdvdG8gb3V0X3VubG9ja190eDsNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gICAg
IH0NCj4+IA0KPj4gICAgIC8qIGNoZWNrIHNvdXJjZSBtZXNzYWdlIGZpdHMgaW4gYnVmZmVyICov
DQo+PiBAQCAtMTE4LDEzICsxODEsMzAgQEAgaW50MzJfdCBmZmFfaGFuZGxlX21zZ19zZW5kMihz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgIHNyY19tc2ctPm1zZ19vZmZz
ZXQgPCBzaXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4KSApDQo+PiAgICAgew0KPj4gICAg
ICAgICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+IC0gICAgICAgIGdvdG8g
b3V0X3VubG9ja190eDsNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gICAgIH0NCj4+IA0KPj4g
LSAgICByZXQgPSBmZmFfc2ltcGxlX2NhbGwoRkZBX01TR19TRU5EMiwNCj4+ICsgICAgaWYgKCBG
RkFfSURfSVNfU0VDVVJFKGRzdF9pZCkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICAvKiBNZXNz
YWdlIGZvciBhIHNlY3VyZSBwYXJ0aXRpb24gKi8NCj4+ICsgICAgICAgIGlmICggIWZmYV9md19z
dXBwb3J0c19maWQoRkZBX01TR19TRU5EMikgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAg
ICAgIHJldCA9IEZGQV9SRVRfTk9UX1NVUFBPUlRFRDsNCj4+ICsgICAgICAgICAgICBnb3RvIG91
dDsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IGZmYV9zaW1wbGVfY2Fs
bChGRkFfTVNHX1NFTkQyLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAoKHVpbnQzMl90
KWZmYV9nZXRfdm1faWQoc3JjX2QpKSA8PCAxNiwgMCwgMCwgMCk7DQo+PiArICAgIH0NCj4+ICsg
ICAgZWxzZSBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICAvKiBNZXNzYWdlIGZvciBhIFZNICovDQo+PiArICAgICAgICByZXQgPSBm
ZmFfbXNnX3NlbmQyX3ZtKGRzdF9pZCwgc3JjX21zZyk7DQo+PiArICAgIH0NCj4+ICsgICAgZWxz
ZQ0KPj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7DQo+PiANCj4+
IC1vdXRfdW5sb2NrX3R4Og0KPj4gK291dDoNCj4+ICAgICBzcGluX3VubG9jaygmc3JjX2N0eC0+
dHhfbG9jayk7DQo+PiAgICAgcmV0dXJuIHJldDsNCj4+IH0NCj4+IC0tDQo+PiAyLjQ3LjENCg0K
DQo=

