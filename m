Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D20976E53
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 18:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797679.1207708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1somEa-0005F6-Cf; Thu, 12 Sep 2024 15:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797679.1207708; Thu, 12 Sep 2024 15:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1somEa-0005DL-94; Thu, 12 Sep 2024 15:59:52 +0000
Received: by outflank-mailman (input) for mailman id 797679;
 Thu, 12 Sep 2024 15:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP8Y=QK=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1somEY-0005DF-S6
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:59:51 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2608::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09a988e2-7120-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:59:49 +0200 (CEST)
Received: from DU2PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:10:2b0::7)
 by AS2PR08MB9764.eurprd08.prod.outlook.com (2603:10a6:20b:603::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Thu, 12 Sep
 2024 15:59:44 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::58) by DU2PR04CA0152.outlook.office365.com
 (2603:10a6:10:2b0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 15:59:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 12 Sep 2024 15:59:42 +0000
Received: ("Tessian outbound b109797c3965:v441");
 Thu, 12 Sep 2024 15:59:42 +0000
Received: from L1770df8969e3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63DF73FD-A448-40F8-BCBC-6AF81A4AC5CF.1; 
 Thu, 12 Sep 2024 15:59:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1770df8969e3.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Sep 2024 15:59:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR08MB9982.eurprd08.prod.outlook.com (2603:10a6:800:1c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Thu, 12 Sep
 2024 15:59:26 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a62b:3664:9e7e:6fb2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a62b:3664:9e7e:6fb2%4]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 15:59:26 +0000
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
X-Inumbo-ID: 09a988e2-7120-11ef-a0b5-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IPKvHRaaQagJb5GeaXSQc7EHNYOOpGpKm7IGM/WCj7Mu6UZ6hKWLF7KcieIvR1/fkyeBAfxYhVgqqX4DHXEZB6lGqdjMoYvg3yowbzzEuJ6dR1/gU5XWLo/il2icEdvME5BQRCYLuJKHpOJGKfn6tVFKUI95YdatvUG41RsiYWTvF35xe1+4YDkzIDTQ6pb+smTrqJklKEcMZFY6Iz11+1sxHH/yKZH+r8ZmsEdzbBmVr5r/c5bfn/opvhsXBj4CLnTvuddT8dKHAxf/PentHSKKdQ3/MpZYtFtjlHvzAkc7f86DmuRQ5N8lqVhUBHZDVo5rFPxOS3uELb3t2ID1kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KcpM2rGC6e/1zKMkkuAjzgZ40IaEzS9F0fv4HAySOo=;
 b=w8JPDYqxAZuxaJ1juMrXI92tYEtU74pT88wiNKm9L15zoIB4lh9CA9ZgOHto/Lzf7L5Oo099XK6IrxRBI5C7ukHCca4UVSC8L1G31fYH72LAff7bI37UCdIDFwTcFFrqv5ghHM4+nY3GKQF8SFPVVyQas7q5yLXPPEFzbqgp30JZRoxHhhinuK66Hfoh8fFKEJIcQJQU/XcgYGUwuxdNE7mGVDE+4z+HTnx8rJqDYmvyGUTY9YUICUOQYAasgKksOAvgen7pBxjLxzHDeOqNFbYzJlnO9kU/QthQNg3UcwNf/P0TNqJkR2P32CuiRBcLs5HMekyHwyWvjWM9C0nOPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KcpM2rGC6e/1zKMkkuAjzgZ40IaEzS9F0fv4HAySOo=;
 b=K7S0CfYPV7U0OOxfalVHzqhG/0/VDhnoQBCgWjW+7yu/1GIDC/OFX+IH3uQ2nY+YXkRLT3qq1s2nwLQ/HhtIjM7j8FNxqiwtL4JB0BZKKHzEJaJgkzOzYb1Ej9BkbeCTrWPeqlTgqw9xY45h05VRztYuCa67fv55qvhUimQJrzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: abdceade0933faf2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFJaOP61cqzU7cmx57L6h3Zd5RtKxar3EYHdMZm9fz3dERg83K9QAxwtBsp9sfJa08g1bof49siVBhicY0g4RFIaMZ3ghUSrOQO6yO6Uj1+xKa+lU28hjzLSDol0A6386whCDkVX6huUkVqdlK0dIK7/d6MX4O+whCOTIzSSNIl3xXGlTpzrfS/qFbwF3Xp1jvbgbkNChqMSwmXeowB1kaWbjtvGIAwEnm9guzZeQhlprKXKwrbUOwTNvBJfr7ESj4MRvOKFawqA3Or/BIOvITjdBShWQpbVOqaZx5yCX9XUsYw5zTNLVLvYJhIEAWLw2JNsjpIWFJF1e/+mT3QiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KcpM2rGC6e/1zKMkkuAjzgZ40IaEzS9F0fv4HAySOo=;
 b=eF/LOX7Yf0796R7Mc2Qudj4E6M1C7RUiEuc7l5S+t0c124GPDAuw+ETTuK9l8t5SfSrDIeTc8aKNFnaTfRXliNsmVTcUz6kXdFRm8trqUh1eWpd3bQILpPv4uv4CihpYq6nVU7Ub5Se2LGAMmhoajE0vuPxWhETwprHTswKpm98cTu7AGu/GS7AquiFu9UkgYDkrkAjCKdN82kOS8b7nJXPrL9VakH8P8aaJuad+VcLg0fyNLWTn0Wx4W6kUqFnOG+nZ4xI3WmeyPhMIlm5Egge4BSaeXLr71zqoqMpbhr5i6vnSq+lOT7j/hD1SSb9ESO8bOlzWfGwKAbfOYzynsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KcpM2rGC6e/1zKMkkuAjzgZ40IaEzS9F0fv4HAySOo=;
 b=K7S0CfYPV7U0OOxfalVHzqhG/0/VDhnoQBCgWjW+7yu/1GIDC/OFX+IH3uQ2nY+YXkRLT3qq1s2nwLQ/HhtIjM7j8FNxqiwtL4JB0BZKKHzEJaJgkzOzYb1Ej9BkbeCTrWPeqlTgqw9xY45h05VRztYuCa67fv55qvhUimQJrzk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/smmu: Complete SMR masking support
Thread-Topic: [PATCH] arm/smmu: Complete SMR masking support
Thread-Index: AQHa/sgroXTHOnPTlE6Mlgy4MozhabJUW8aA
Date: Thu, 12 Sep 2024 15:59:25 +0000
Message-ID: <ECEB5067-7661-457C-B13B-E8E2643FDB1E@arm.com>
References: <20240904124349.2058947-1-michal.orzel@amd.com>
In-Reply-To: <20240904124349.2058947-1-michal.orzel@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|VI1PR08MB9982:EE_|DB1PEPF000509E8:EE_|AS2PR08MB9764:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b3b974-1350-458a-8064-08dcd343ea7a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TzBlcFZ2dTg4ZmREQlAzYk91QzMvU2ZPUFpsK0FzZTJDbGRiSkdRRjY0QUdl?=
 =?utf-8?B?cXYxRmxZcENtNDBRVVEybVY4WGlUVWpGaDc1aU0xSmVtUjcyNm43MWJyZHFL?=
 =?utf-8?B?TElaMFJXL0xhT0R3NENMSjdPTFhTK3FXWk5hSXRaVmYrNGtpazJJTXo3VkhH?=
 =?utf-8?B?bmc3ekhXL1BiVVQ2aXJielJyOVE4TXcwcy9vbENtR3U5M0x5WXBrYUlsUHhH?=
 =?utf-8?B?d1JGK1pRV0JBZDl0MElwVVBJNmIwQ0FWZklXTjQ2b0I5c3E3bEZzOVkzWjBt?=
 =?utf-8?B?dDUvcE9zZkEycTBYdzl5U3dBdGRIaE9DVEhHWDE3K21DVFFSN1ZpZmhITitO?=
 =?utf-8?B?YnlOWnU4dUthbi9OclhXSjJJNWQ5MFArV0t4MTB6REJWa1FCeUlUOTl0VDdq?=
 =?utf-8?B?Rm1IWWhVNDVmWEFzTnJRNVM4RGRkeXIwWFBRTVJYeEtaYWEram1xZjhlaWhy?=
 =?utf-8?B?VjYxdis2Qm9MQWpsZHU1R0ZzVWVXeEd6OVVKVktDcGRGN1JoMWdBUlJ2RXl1?=
 =?utf-8?B?MmFkU0pMV3JwR3dobzF5SExiL0twaFlPcHFYY2NZWmVLYUFxU1VXdEFyYnI0?=
 =?utf-8?B?YXBvRGtKdFdBSnJzUVhxQXgvL1YvMkZDWm9RQzhXVTR6aDc0OEh4Q014M2ND?=
 =?utf-8?B?eVB1VXcwcUZJSVI4R0dENkZQT2hWUVBxN09XRmZYM0FCSVlKYm1RZnFhRWNi?=
 =?utf-8?B?UjJoTTdaYkVQOHlKaytNU2NIVjIxd0pqSFVwRzhNdFlNRHVDRDIrRDVNZkli?=
 =?utf-8?B?SllPRkhWcWJwN1JKQlJGZ0RxbmdDKzUvb1Y3c1RiNmRiREpwMThZMXFpejZt?=
 =?utf-8?B?TXZrcWhPdGVIQjlFUGZpS0I5c1VoRFlWSFFPa2VDb0MzbHcwaUZTRzVJSExG?=
 =?utf-8?B?bmN4U29lNUl2Zm1ab0tjLzBQWmxGMUU3TWVnVjhXTVpUSFV0UVBlRlpBUUt2?=
 =?utf-8?B?emtjYVlwUmJ1dXh6dWdlZUx1Wm13ZkV5VkVNT3F5ZDJCaFErOENpK0E3RzdZ?=
 =?utf-8?B?L0NiS3FBK054ekZHR2FYMzdxTzNQN1Z0YmFhcUx2Yi9ITGpEcWtnVlM5Uk4v?=
 =?utf-8?B?N2M3VzNmMmNKWWJzZDlDSXBpTU8xNGFPd1VScUVGa3haZ2YyTHRGcVF3Nk45?=
 =?utf-8?B?TDY3Zks5QlFWbXY4bk5HT0xEOUU3b0ZEUTVJZ21uVW14enlDL0tPRzBzclov?=
 =?utf-8?B?MFRnbGNkR0xWZlBZRmloaUZpOGhOYnFoSmhSWTN4T2dlRTljNzdDMytHcWJ6?=
 =?utf-8?B?dGowbGpUZW44MlJkVWxqOTZBVjhZWXdrWkIzeC9DNnFudDlLTXUwR0hROFFE?=
 =?utf-8?B?RE4rbTQrcGV1ZmV5UFJZcGFiZUhmUmpmT1MzT0M0WG94Vk5CMEUzKzhwZ3hm?=
 =?utf-8?B?LzA0bzFqc0c1TTlKTGtuYi9HanVDcFpQbzI4NWorYU9pNU9FY2ZUb1MzaVlL?=
 =?utf-8?B?QkdJQzgySjVHZWFBTDZtaUhyQ2QrYUVUWW1Eb3RGL2FIRURuT0EyVjhyamFM?=
 =?utf-8?B?a1AzMmY5OHFQdzliYmNMN1d5TVZpallWMTV5cnFUNVZSS1BkaHU2bGJKanc1?=
 =?utf-8?B?MkVVNm1MRllVNGo1NWI4OUtmSE9HTkJ3cUM2a0JKc3NWMDhhNGM4L3FrU2Ns?=
 =?utf-8?B?eUwzcEVkc09vMHk2eE9GL3MxSjZESWpaWkZmemVlWkF0Wnd2aGFtalBjY0F6?=
 =?utf-8?B?UVNOMXk1UEtaRy9sMU1BNmtJS3d1am53KzBWYkswS3hzL1ZQM2ovSTF1elYr?=
 =?utf-8?B?SGlVVi8yc0w2Y1MvWlBwUlE3Ky9SdU5WWDc5ZjBnRERibXJ3c3VZaEYzelFV?=
 =?utf-8?B?ZmFtQmF1ZkFCK3UrVUhPOWRlR1pxNEJ4SmxMamhNU252dTAwQ3d2NHpTR2k2?=
 =?utf-8?B?RHc5a3BTTlZpdk85dHJKOGVhMDdnRXpGL2xUZEZrWGZaN3c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <20B7A42CAA79D140AE4ECC4BD7983DA6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9982
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:404::24];domain=AS8PR08MB7158.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27b2bf2a-3c70-428a-4ebb-08dcd343e054
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0Q3aXNSd2xFU1Z3KzNQZHdFeGd2aks0YjZrQTBsQnU4SDlsYWpXSEkyb0xm?=
 =?utf-8?B?akNIR2JjWlFyVmNpaUVSUUxyZjJxc1FLMEtDOXM1TDJUcUVScWRUMzliZXY1?=
 =?utf-8?B?bTMzSjJ3dTB2c2c1S0lha2tybnkwVTRRMW43c1hyWkI5ZlhaOVkzcFJBM0pJ?=
 =?utf-8?B?QjZKaVhreGZCdzlkanZ4QkxMZFNQKzUzRGFUOHV3OFR4MTFkYmFUd1pwZkFB?=
 =?utf-8?B?V1kxaEVVUHJDdURPODQrVUtTYUtRUU1UQXY3REFOdC8rZUtvNGRFdnNnYmRy?=
 =?utf-8?B?TmREd25aQmVacFRvUXJSK1U4OVBrSS8xQnp0SkUvMlRxeUx1Q2cvRXNwUzBw?=
 =?utf-8?B?YWxHZmZtd0tSUmNFeFl3NVRudzlPRUQxZFh0Q3kwZmRXdW9PNlh3ZmgveWh6?=
 =?utf-8?B?WjA3ai8rZ3h3eHYvK3NhWnpsL3VOeFpuY3lEVTBpWE9Bd2JQYjJVd2hTOEVI?=
 =?utf-8?B?YThYN0FIWVppWmQyQUFkUThBeDRkRFltZDl1aVFUWGp2YnVkR2dxaWtMNXNz?=
 =?utf-8?B?NXlUVGlGT2lMeUtiSk1xaWlFV1VmSzBoemEyYzhaVkNLbHpHMGdwUjh1Rk16?=
 =?utf-8?B?NitZeDhXd09jQ3RNbXZobExpUzZQZ0o1dVAzWTBXUnBSZ1Q3MGNuVHUySFYw?=
 =?utf-8?B?YUtaTHJSY2hSMGNIRmtxUXF2VTNoZ3VnZkVyV2FyQTBrT3lmZmg1SWdobWhp?=
 =?utf-8?B?OHhOeWZGWUI1c2dqbFFXdkxRc3hQOE1iY08xdHFoSE5EWjZiWitvU0FKSjdt?=
 =?utf-8?B?d1lraTlSa3lISzc2a2dLRmkzQWNvK2x0MjNuaEk0NVNPVHd6SU84dS81Z1Js?=
 =?utf-8?B?NVZhQWk3bjZxdE5qNFo1ZFEyM0h0Z2V5TE05Q3dpdGpncmEzNmR6UDJTVDFP?=
 =?utf-8?B?eEpNMVJ6eTZXbmpqeG1wMWtQTXE2TEtURHpNTWNzMEZwYW94aTZhQWtTRXNQ?=
 =?utf-8?B?eStnZ1JVM2RJbFU4R09BUVpHaFRMdlhQU2llZlZTN2xWUFN0YzJQbWNweHB2?=
 =?utf-8?B?aDRLUjFaemJCNjNzZEo5bDJzRzJ6SjM0L3lyUVZDekxISGwxU1Z3NUllR2pE?=
 =?utf-8?B?L2pTYVRtUFI2V1ZYVituYnMyZnZwYURJRWNPR3h2dzhndnFwU0U2N2V3VkdB?=
 =?utf-8?B?aGlPOXEyM2hOdFI4cUk1Y1lPNC9vUHR2TGJQbnRBUS95NmEwdi8zVXFYemNh?=
 =?utf-8?B?TEtoOUozb09JUVV6RDZ4SWVTZGc3b3hLaGZGQnYwbXpIWHg4MVZzUnA3UTJq?=
 =?utf-8?B?OWRRRmNHWG5NOGd1c2lwWWp6d3Y4Z3lpUW4wN2lnbkJoRlJXbFVMd3ZCSm14?=
 =?utf-8?B?VFVoQTdoaysrM1l4eEpaMkg1MnRmb2lvUlVZNWpqaDVEZmZ0MnNKQ1dpMll6?=
 =?utf-8?B?YkR2RHBqQjQyeGJEZHhhWFFjMSsySXVVQlVjKzJJR1htWFc2aEQrK0VqSGpa?=
 =?utf-8?B?SXVSbW4rVDZlUmt2V01EQ0dTOGFZTm45dmFNUzgwS3Y2U1YrM1NxUzgyN2k0?=
 =?utf-8?B?TFFCbXpwYVd3a3V0NHN0dEZaM042WHY5YjNKU1A0dlZiYmFpZ1Q2WDNRdloy?=
 =?utf-8?B?QjloQUJzeTRYc3U5NGx1cTdEc1RCS2FDeE8wb1dUWXhtS2t6bkkwSTBGMU9w?=
 =?utf-8?B?RzlGWkpTZWF2b1ozOVhxQnduYnFkZnFzbHR2clFSQWloTXdpQUkzb3EzalJ2?=
 =?utf-8?B?YjJOYjFQRW5wUG40V0FLaUJ3ekswczE4MTY3bGdTSGM4US9WWjY4N1lNYmlK?=
 =?utf-8?B?UW1pYWdWTS85U0MwN2txejBGaERJbGhvZ241dVJZUE1BTmRYSmg5SERWekVD?=
 =?utf-8?B?ZnhCdVAxYUZBZ1dUcUgrOVBRMHhWSHhpdUttMHQyT3huL215b2N4cUNkRjJy?=
 =?utf-8?B?V1NrUGlic0hoZjFkOHJsenNnbW9SZnZkOUZNWGRrYytLcVhMZU5SY1o0UnF5?=
 =?utf-8?Q?IPCiYKEzViwlO3RewpRqGhpkvNquM/v2?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 15:59:42.8840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b3b974-1350-458a-8064-08dcd343ea7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9764

SGkgTWljaGFsLA0KDQoNCj4gT24gNCBTZXAgMjAyNCwgYXQgMTo0M+KAr1BNLCBNaWNoYWwgT3J6
ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IFNNUiBtYXNraW5nIHN1cHBv
cnQgYWxsb3dzIGRlcml2aW5nIGEgbWFzayBlaXRoZXIgdXNpbmcgYSAyLWNlbGwgaW9tbXUNCj4g
c3BlY2lmaWVyIChwZXIgbWFzdGVyKSBvciBzdHJlYW0tbWF0Y2gtbWFzayBTTU1VIGR0IHByb3Bl
cnR5IChnbG9iYWwNCj4gY29uZmlnKS4gRXZlbiB0aG91Z2ggdGhlIG1hc2sgaXMgc3RvcmVkIGlu
IHRoZSBmd2lkIHdoZW4gYWRkaW5nIGENCj4gZGV2aWNlIChpbiBhcm1fc21tdV9kdF94bGF0ZV9n
ZW5lcmljKCkpLCB3ZSBzdGlsbCBzZXQgaXQgdG8gMCB3aGVuDQo+IGFsbG9jYXRpbmcgU01FcyAo
aW4gYXJtX3NtbXVfbWFzdGVyX2FsbG9jX3NtZXMoKSkuIFNvIGF0IHRoZSBlbmQsIHdlDQo+IGFs
d2F5cyBpZ25vcmUgdGhlIG1hc2sgd2hlbiBwcm9ncmFtbWluZyBTTVJuIHJlZ2lzdGVycy4gVGhp
cyBsZWFkcyB0bw0KPiBTTU1VIGZhaWx1cmVzLiBGaXggaXQgYnkgY29tcGxldGluZyB0aGUgc3Vw
cG9ydC4NCj4gDQo+IEEgYml0IG9mIGhpc3Rvcnk6DQo+IExpbnV4IHN1cHBvcnQgZm9yIFNNUiBh
bGxvY2F0aW9uIHdhcyBtYWlubHkgZG9uZSB3aXRoOg0KPiA1ODg4ODhhNzM5OWQgKCJpb21tdS9h
cm0tc21tdTogSW50ZWxsaWdlbnQgU01SIGFsbG9jYXRpb24iKQ0KPiAwMjFiYjg0MjBkNDQgKCJp
b21tdS9hcm0tc21tdTogV2lyZSB1cCBnZW5lcmljIGNvbmZpZ3VyYXRpb24gc3VwcG9ydCIpDQo+
IA0KPiBUYWtpbmcgdGhlIG1hc2sgaW50byBhY2NvdW50IGluIGFybV9zbW11X21hc3Rlcl9hbGxv
Y19zbWVzKCkgd2FzIGFkZGVkDQo+IGFzIHBhcnQgb2YgdGhlIHNlY29uZCBjb21taXQsIGFsdGhv
dWdoIHF1aXRlIGhpZGRlbiBpbiB0aGUgdGhpY2tldCBvZg0KPiBvdGhlciBjaGFuZ2VzLiBXZSBi
YWNrcG9ydGVkIG9ubHkgdGhlIGZpcnN0IHBhdGNoIHdpdGg6IDA0MzU3ODRjYzc1ZA0KPiAoInhl
bi9hcm06IHNtbXV2MTogSW50ZWxsaWdlbnQgU01SIGFsbG9jYXRpb24iKSBidXQgdGhlIGNoYW5n
ZXMgdG8gdGFrZQ0KPiB0aGUgbWFzayBpbnRvIGFjY291bnQgd2VyZSBtaXNzZWQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpSZXZp
ZXdlZC1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNClJlZ2FyZHMsDQpS
YWh1bA0KDQo+IC0tLQ0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIHwgNiAr
KysrLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYw0KPiBpbmRleCBmMmNlZTgyZjU1M2Eu
LjRjOGE0NDY3NTRjYyAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L3NtbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQo+IEBA
IC0xNjE5LDE5ICsxNjE5LDIxIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfbWFzdGVyX2FsbG9jX3Nt
ZXMoc3RydWN0IGRldmljZSAqZGV2KQ0KPiBzcGluX2xvY2soJnNtbXUtPnN0cmVhbV9tYXBfbG9j
ayk7DQo+IC8qIEZpZ3VyZSBvdXQgYSB2aWFibGUgc3RyZWFtIG1hcCBlbnRyeSBhbGxvY2F0aW9u
ICovDQo+IGZvcl9lYWNoX2NmZ19zbWUoY2ZnLCBpLCBpZHgsIGZ3c3BlYy0+bnVtX2lkcykgew0K
PiArIHVpbnQxNl90IG1hc2sgPSAoZndzcGVjLT5pZHNbaV0gPj4gU01SX01BU0tfU0hJRlQpICYg
U01SX01BU0tfTUFTSzsNCj4gKw0KPiBpZiAoaWR4ICE9IElOVkFMSURfU01FTkRYKSB7DQo+IHJl
dCA9IC1FRVhJU1Q7DQo+IGdvdG8gb3V0X2VycjsNCj4gfQ0KPiANCj4gLSByZXQgPSBhcm1fc21t
dV9maW5kX3NtZShzbW11LCBmd3NwZWMtPmlkc1tpXSwgMCk7DQo+ICsgcmV0ID0gYXJtX3NtbXVf
ZmluZF9zbWUoc21tdSwgZndzcGVjLT5pZHNbaV0sIG1hc2spOw0KPiBpZiAocmV0IDwgMCkNCj4g
Z290byBvdXRfZXJyOw0KPiANCj4gaWR4ID0gcmV0Ow0KPiBpZiAoc21ycyAmJiBzbW11LT5zMmNy
c1tpZHhdLmNvdW50ID09IDApIHsNCj4gc21yc1tpZHhdLmlkID0gZndzcGVjLT5pZHNbaV07DQo+
IC0gc21yc1tpZHhdLm1hc2sgPSAwOyAvKiBXZSBkb24ndCBjdXJyZW50bHkgc2hhcmUgU01ScyAq
Lw0KPiArIHNtcnNbaWR4XS5tYXNrID0gbWFzazsNCj4gc21yc1tpZHhdLnZhbGlkID0gdHJ1ZTsN
Cj4gfQ0KPiBzbW11LT5zMmNyc1tpZHhdLmNvdW50Kys7DQo+IC0tIA0KPiAyLjI1LjENCj4gDQoN
Cg==

