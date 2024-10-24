Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C429AE16D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 11:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825071.1239269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uU1-0002a1-S9; Thu, 24 Oct 2024 09:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825071.1239269; Thu, 24 Oct 2024 09:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uU1-0002Y7-P9; Thu, 24 Oct 2024 09:50:21 +0000
Received: by outflank-mailman (input) for mailman id 825071;
 Thu, 24 Oct 2024 09:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sutq=RU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t3uU0-0002Y1-KN
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 09:50:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2612::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6039b2f0-91ed-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 11:50:18 +0200 (CEST)
Received: from DU2PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:10:232::28)
 by GVXPR08MB10938.eurprd08.prod.outlook.com (2603:10a6:150:1f8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 09:50:14 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::e9) by DU2PR04CA0083.outlook.office365.com
 (2603:10a6:10:232::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 09:50:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14 via
 Frontend Transport; Thu, 24 Oct 2024 09:50:13 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490");
 Thu, 24 Oct 2024 09:50:13 +0000
Received: from La831237157ba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 028D6688-2177-43F2-A9EE-186CF672DB4B.1; 
 Thu, 24 Oct 2024 09:50:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La831237157ba.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 09:50:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DBBPR08MB10627.eurprd08.prod.outlook.com (2603:10a6:10:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 09:50:00 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 09:50:00 +0000
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
X-Inumbo-ID: 6039b2f0-91ed-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kdK8+CXUNd3aSnL1nWkkO5GP4JJKfuTu8zb+YnFrH5Ps7ziDA83ZTJL4egyfcy/tGty2Z6Fn+xNqS4nSZKcUoUboW7FQ6IdhSOTZCG6h6cUHroWhIg386LhC+oN6Yh/SA71K9uduRoqpJlihuCvbFviW9mRyAiyGfhDsL5RfNEasRvujcC6CZ47f2scW1NGIaHkFEjRuLXqE1K179PKAFKeWgRbwz/95nsxyiIFuPXT5eDCJqE+e4gR8rFHtNf7SnC9w/xYTizwJwR0xuqlJGmkzI9WeMIWdhedHYCtatqLRs4kDpTDTsgMID7i/JplV5LUK/nBcf3qtNCJPIxDLJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlRGwJT+rD7l7665ekGMvaU8C2r/qkHRox7JWDXLyHM=;
 b=Qr9S5x0+7SFl3IKXzZyLLCCxheOpQGk8Ql6R1fotUq1q59P0v7RxUI3HMwJDGKm1orJNE03AaT7F2nAFAUylp0CTjSGRDj2cGfmtiJywnHbX/Mhqope0uWwsGw+dzcgJZXtQt/xlZdkidRBfuiFKMD7lx4pZbe4KhERu0CiScrjz7IYc6EKH8Ma1Sp9llKjMCLq64VNtOhK/435MPfX/oYAaBWxcZABuF9I2ahy7/Jl94w2045xFCxvXUzsTP6sxJAwYztgxtnLTwa4S7HbcVSAegHBqYjY8q3y1YOT5Q0nido442KBfcEZXqy+T4hivx9UQqtYIQoJw2l9TXf+hsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlRGwJT+rD7l7665ekGMvaU8C2r/qkHRox7JWDXLyHM=;
 b=mKCosUUXW+bFr9qrsc/WNjB7HYlq6VpTCBLYsQaWkMlCwfn0V/uIjKA2uS2WucWNjr6EndHRSeLTTYzhjr9Vks9EhTDmiZy/5iUHrCWOVWI3PZoq/v5rUZmcvlbKvKNoFo/eL4q0Dwbh3rODrCk/aagQEV94zw1PR6Wi4j0rifk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9df1945686708875
X-TessianGatewayMetadata: SwkzCCUnhY15m7Monoy2SgjsaI1Co7dC28n25TJTngtgIab95EP9g0YcpPKEmTtoj6Y+CZH0NZijDAapX9pKfSW9Pa6QnHn9gPx6O7TA38UD3ecsUOYNH4X2hNuJSY6f1KhPAfhHDOHOPNeSWGTfMt4zicuy7SWMdT0bwdgpxAs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOOurbgPCGOcZY1w3iFXg0+/s+4k/4xWVO0fdyZLwCY2LupfAfWjJ2G+TWT+1DKSeY3dh3lQa+i+Q07pG6gjdZdpFlZkuqXAsHk7c1ITsnuF2SO/9g4usD7AG9BFJYHP0tCQGVSz4QT/81cYwghcS2S1tX7OyNIAchw50D7yRkm9OYTarvykYc0zaROACWquRq6aB2kygbwwpgHQOYOI61nqIhANdKFcX7oMBRkqMhqaeyaAqdk3qvxyKK7iRcjEE/HlZ6iQ1MSeRzd0RpFEM52YSbL+3vt7b8Glr3Vgtn5elVehpY6lcYz/ToNgZt2qdL6NyBpB4LKp5q0pBZ8UKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlRGwJT+rD7l7665ekGMvaU8C2r/qkHRox7JWDXLyHM=;
 b=afuIkLnNrwjzRbxaibGcNWT1dlWUdSUTwm4nbuI1zgYJSjY7bDUGIrkap9dhBK2wZ7f3TovqNLV1UpFRdvt9sD3D89a2wb2HmgOR51WJ0RCW1mGrx6C9n5YKb/xnRkNKjqYjioqoL/Jyrk2pD/nFtcILFp9q1p60l0QXZhcAo6s+pgowmn/bp9WMltPWQc2eVOhJPv9RzrIJVvP8emrXqZ7tiXTB6fSFRR57qzcpq3LsxSB2ppBZqZ4xI4UVgWpDnMCnreLQa6r4Wtj63OkV10JQcZ/U2cw3c1t8t97Avo5rk5VYkpWIaN8Ss8FPWMpI4sqEuJGK6Ve92NHspogOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlRGwJT+rD7l7665ekGMvaU8C2r/qkHRox7JWDXLyHM=;
 b=mKCosUUXW+bFr9qrsc/WNjB7HYlq6VpTCBLYsQaWkMlCwfn0V/uIjKA2uS2WucWNjr6EndHRSeLTTYzhjr9Vks9EhTDmiZy/5iUHrCWOVWI3PZoq/v5rUZmcvlbKvKNoFo/eL4q0Dwbh3rODrCk/aagQEV94zw1PR6Wi4j0rifk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 09/10] xen/arm: ffa: Remove per VM notif_enabled
Thread-Topic: [PATCH v2 09/10] xen/arm: ffa: Remove per VM notif_enabled
Thread-Index: AQHbH6X8AtOvQ/RSPk6sVqh3nksYqrKVkNiAgAAj/YA=
Date: Thu, 24 Oct 2024 09:50:00 +0000
Message-ID: <678C4205-89C3-48D6-B5EF-9A16624B9E9D@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <b23ad93b876267fb48a5a398e394e60fdf52d33d.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44ESfSimrf6coDmurQSfuCQyytsi2gJh_kePer2p3zotug@mail.gmail.com>
In-Reply-To:
 <CAHUa44ESfSimrf6coDmurQSfuCQyytsi2gJh_kePer2p3zotug@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DBBPR08MB10627:EE_|DU6PEPF0000A7DE:EE_|GVXPR08MB10938:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e591ae8-09f2-4828-9032-08dcf41141ca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y0FKUnEzM3ZsZVhabDJWWC9LOUVQY1JRZjNFVFZuQ1NKL1NFdUIvTzlNcWVV?=
 =?utf-8?B?RHhmSWdGTzdkUTFqZldIYnhNbUtRZENiUjVMeDAvbDJaVzIxVlJta0FFczZS?=
 =?utf-8?B?eW9uV0dGZmhIeFVib3JBcmQ3UDNqZy9PVG1NYTZEMHBJd1BicGM3dUZZUUdh?=
 =?utf-8?B?NXZtY0ttVktMQ0tmSU85TjZHRzh5ckZmSmgvak04S0t1Q3BNRFM3eGVORGZk?=
 =?utf-8?B?ZzREUmRhOVdlREJHSi85RXliTThFUzMvaVI3YVRFcHJTVjlFaHFMTFMwdGtJ?=
 =?utf-8?B?V1RjMHZsSUJLanpOdDEyRkJNR0Jwcy91bnFrWEFPYzBXTi9iRmZhSmRrMDhp?=
 =?utf-8?B?MnZ5QU9Eby9XbWxRc0k2L3hUWFBaMjF4aU1PMjBreWpXNGNQWDRSM1BZd3Aw?=
 =?utf-8?B?QU1sUlNjbk1wMXk5NkpZNmFwblBqOGpJU2JlbUoyQnVwSS9RRnpreG13MzJI?=
 =?utf-8?B?bE9UOFgrRE8ramJGdVpzczg1bWRmazJXd0wwSzNZcUt5alhHd2xJVWFVSFRJ?=
 =?utf-8?B?a3YzRG0xVHZwdWtETjRWUjRmZWlrMmE0bTlENWJ2eCs0VGFISVFZVmNleU1Q?=
 =?utf-8?B?Zk1HVittakUrTmJHOHZGc1A0Zk1IeUxOU1JUVWVXb3ErYjlKZ0pRWk1iZWZ2?=
 =?utf-8?B?aDFuTlRPc1JVbG4wNUdZbno1UURleENwZVBSU2x1OVFqRXVYYnlLRk5YS0ZU?=
 =?utf-8?B?TG11TUUzQWxYb3dpdmE1NGJlRG5xLzlKTy90RUNBMjlQWVBqSzlHS243bFZD?=
 =?utf-8?B?aWtUWENzQmVoU3ppWFQ4a1ZPYXAzSlBIVnlPVUJmWldNSjU2T2o0Tkh3MW44?=
 =?utf-8?B?UXkvL2pmT0pScTNiTlpIL012czR2YnIvNkQya25KYWg4bWd5S0kzdVpxQWpp?=
 =?utf-8?B?Rk13NXkvSnB1bm8vVU02akFabkR6Nlo3c0Z1U1pDNVlJKzF3aWMyMWR1N2ds?=
 =?utf-8?B?d09VUWtIZCtsTklCUlUzRFRkamFSZkZIWGVKLzk2K2dZMGszL3ZsZWtIWStw?=
 =?utf-8?B?K2NqWEh0VlJGYXVKcW1GL01xUmdDcGprcUhvcUxqcUtWNVZWVkdSeW5wakNF?=
 =?utf-8?B?eE5kbEJKQnBqQkd4RVhHT0hmd3Z5Y3pjSmMrNCswR1NHc2VVOHRqYlBIOHFP?=
 =?utf-8?B?b010S3BJL3NtUm1RM1BYcHlVekNJNzllZUxJbi9FeUw1a0NPZ2NiOFY4UFhE?=
 =?utf-8?B?bUk4dHlDOEU5YUMyVmMvNUNCQm1NdnlTMFpLWkRBNHJKeUdCbTRZSkJnZDRT?=
 =?utf-8?B?RmNXd01selNqdDhpbDh2Ujkvd0Zka0pnZGp5Smk3eHpkWVpCNkFRV1BNaWZN?=
 =?utf-8?B?MmNqQ3Y0RituU0hCWGtrRkxiMXF4OHBna2NUYitYMi94eEZQQzVRTUtLalow?=
 =?utf-8?B?dmJUYXNRMldyQ09mMnQ5eis4bVJNYXVHbjhpVDRZQzQzRWpvNjZ2eGpWYTF2?=
 =?utf-8?B?ZnloL21TK0dKdHNRZjJuU2ZkcFpuU2p5ZDc2VHJvMjUvVmZhdXFabmFlTDNm?=
 =?utf-8?B?MmV6WGlFK3k2ZDh2WC9IRnFhc2tvYWJ5TmN5ZzdwenZlVFkyZ2RJNC9NTWNl?=
 =?utf-8?B?WExySWdkdWZNM1ZDRXo2eHRlbEpOUmZGRFVDUEhET0hDTDBSN2ZUdXc4OWR5?=
 =?utf-8?B?VEZpa09ZUnpETlFEazJGaHBZd3lMaE5GY3VBSGJPcUxBYWtaUDJRZ0d6bC9O?=
 =?utf-8?B?cFRIMFRsaWZVLyt2U294L0t0dFRvRlI3a0xWRk9oODU3Y0ZyVzRnci9nd29j?=
 =?utf-8?B?QmplWkUzRzRKby8vVk5JTU5sM1Z4Y1hWd0gvMExYM3k5OWNLM1RneFhWT05p?=
 =?utf-8?Q?LkWqNFgRAPdfmo5yPJkMDdFMkGlt5P/tWCPug=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEB3FDEEFBAEF747BC6F46049A989AD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10627
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa877fcb-64f5-48a2-0ecf-08dcf41139c4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXdzbk9JeWxaVlphODdkZnNOUnBhNXFidmI4TEZBSmpSclNMWlg0T1kvOGFo?=
 =?utf-8?B?b2drajZ6YmduUTBOUVozeGoyRG9vMjRVOGtrelJPN1psM2RpQjAya1FDTXhV?=
 =?utf-8?B?V3FVRHlIbTYzb25sNWk3bWlNMlBNeHF0MVRNK3hJK2lFVE9qSVV6cm1OZGVu?=
 =?utf-8?B?VDFsbVBqSkdDOGZwNVAvdmlBVmNnMmo1T3pnR2dMOEt2YXhzUlZ6UUw0ZjVo?=
 =?utf-8?B?ZEZVdStUK2JVNEdVK0o4MStRYUxLM2xWYmZuRkpTYUdOdlA4aWkvd0ljYXZB?=
 =?utf-8?B?eDVRWDFtaUVGVHFEck5LZFZNTUVKTDk1SE1lRGdtWnFmSXZzOENlLzVyaThP?=
 =?utf-8?B?L3pNdWRvdWFTaGNHR0l6OEU0VVJKNytwUVZleGo4a2Z2VmFxb1UrbmtUajBr?=
 =?utf-8?B?OU91ZzZkQ1BILzIwVWd1aGpkd3JMRktZcmFnY2NtdlhxRVNDNnJoREE1RVgw?=
 =?utf-8?B?NkhNcGlnenptOTIvaEd5bnN3YlYzT09LaUhZK21iZU1TeG1IUmIzaWJid3dp?=
 =?utf-8?B?NnFyYkMzK3ZTamRwTkgva2EyV2NTWUVCSkd0dkVHVU5nSi9RWDBkSkRSVjFa?=
 =?utf-8?B?Z2cydFFza3ljaTlMOTZzNmZnMTQrenhxakhCa25WV2RyS1pYOXBpU2kraWg3?=
 =?utf-8?B?US9EWWFXenV5K3FRMU1Sbzh6ank2akVNSlZMN0ExNlZ4ZFI0R3l1N2lWejRE?=
 =?utf-8?B?WHhwZjZRWVgvSWU3ZkhhK1p6K0pCbnU0RmJWRzNENHpPWndpZ21ialdJem96?=
 =?utf-8?B?RW9rY2VFNThYZnFNZ0VldGNUY1JvcVF1YjJDelgzS0U2aGtIWjJlOEJ2Ykk5?=
 =?utf-8?B?V2pSKzFwK2gxNmpmWHlZOEtoSUJET3BhblJLVUtzdUxxRWh1R0lhSzJnOVV0?=
 =?utf-8?B?ZzdDeGozQTNYN3pHTktyeWtnWFFPZCtEcHk1b2c5YXRSNHI4amppREovS2ht?=
 =?utf-8?B?U2tJdUIzVks5NXdmN05pd2tiOHJmdldYU3lhODNwQkFSQzNEQ2dmTkdMQmpQ?=
 =?utf-8?B?aGFiNngzOFZvRDNxTjdVQktDamRuaWEwbjdvVmxoSDA1ZWdsbkJwdjl3QjZv?=
 =?utf-8?B?Rm9veW9wMlVrV0xaNnBjWDZubU5JNngyU1V5YVhPZmtMbW1VcmNBc1NKRVp2?=
 =?utf-8?B?ZXppWHFSeVRiSHBMekd5Z1VqUXZwUXQ0S21mZjZ2dDlqdW5hWUxPZm1jZE9U?=
 =?utf-8?B?b2l5SG9ldnRibnd4TlZwNS9DbitnaHBuQVpNbFQzNE9TeWxaYWZKODlDRVJB?=
 =?utf-8?B?bXREUUtOM0FwUFg5RnMxMmF6bHU0MEZYRFUxY2Y4bkowTEVnMWFvR2dMZWJ0?=
 =?utf-8?B?enpOOEI1V05RVGkzL1hGQnQzMHY5L1NLMmR0aTdQMHJGYUcxOWFFWk1EM0R3?=
 =?utf-8?B?aVlMTXV0NWRuaThjWUMrcjR2WVBMU1ZCWGxLWEZISE1RV2J1Yk1vT1NpMzVw?=
 =?utf-8?B?bUliK3NQK29EczBFdHdvYTFOdHlPbHVXR2xpbWExV2FuRWlnQTlIOThyNUFT?=
 =?utf-8?B?MGlqdndtMUR5NVBwZXd3eXcvK3lGekNIY2duUkhha0k4MDdXL1BwSXBEZnhY?=
 =?utf-8?B?M2UrZS8zTzJsSDc4UXhTbnNQNlR5VUlvcUYxRGlsZm9BazBENklUK2JDQnFh?=
 =?utf-8?B?SFJKR2FPb0lJYzBUSC90TnhFZ3ZsMDRGQTlhUStCRDV0Z2NpVTkxd1pKRGNU?=
 =?utf-8?B?QWZuN05GZXViVzA5T3d6Z3c2aUNiaWxFY1UwdnI4dmxFMjR0M0k2NXNuTkxq?=
 =?utf-8?B?a1gxZlR6UU9EbHBNd0lPbWdYYTNFd2dFeE91MGZZa09XOUFJQnNVMEc3cDcv?=
 =?utf-8?B?a1pZSUxYdmFpa1gvZ1pMTmk5b0p0UDRZbEF3dXlIN3dRU2lMampmdlhTRnEv?=
 =?utf-8?B?cUkxV1EyL2FqeG9Mak50cXk4SU5zcDZRSkVsNzNzazJlcFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:50:13.4402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e591ae8-09f2-4828-9032-08dcf41141ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10938

SGkgSmVucywNCg0KPiBPbiAyNCBPY3QgMjAyNCwgYXQgMDk6NDEsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6MzLigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBSZW1vdmUgdGhlIHBl
ciBWTSBmbGFnIHRvIHN0b3JlIGlmIG5vdGlmaWNhdGlvbnMgYXJlIGVuYWJsZWQgb3Igbm90IGFz
DQo+PiB0aGUgb25seSBjYXNlIHdoZXJlIHRoZXkgYXJlIG5vdCwgaWYgbm90aWZpY2F0aW9ucyBh
cmUgZW5hYmxlZCBnbG9iYWxseSwNCj4+IHdpbGwgbWFrZSB0aGUgVk0gY3JlYXRpb24gZmFpbC4N
Cj4+IEFsc28gdXNlIHRoZSBvcHBvcnR1bml0eSB0byBhbHdheXMgZ2l2ZSB0aGUgbm90aWZpY2F0
aW9ucyBpbnRlcnJ1cHRzIElEcw0KPj4gdG8gVk0uIElmIHRoZSBmaXJtd2FyZSBkb2VzIG5vdCBz
dXBwb3J0IG5vdGlmaWNhdGlvbnMsIHRoZXJlIHdvbid0IGJlDQo+PiBhbnkgZ2VuZXJhdGVkIGFu
ZCBzZXR0aW5nIG9uZSB3aWxsIGdpdmUgYmFjayBhIE5PVF9TVVBQT1JURUQuDQo+PiANCj4+IFNp
Z25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4N
Cj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gcmViYXNlDQo+PiAtLS0NCj4+IHhlbi9h
cmNoL2FybS90ZWUvZmZhLmMgICAgICAgICB8IDE3ICsrKy0tLS0tLS0tLS0tLS0tDQo+PiB4ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jICAgfCAxMCArLS0tLS0tLS0tDQo+PiB4ZW4vYXJjaC9h
cm0vdGVlL2ZmYV9wcml2YXRlLmggfCAgMiAtLQ0KPj4gMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3RlZS9mZmEuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IGluZGV4IDcyODI2YjQ5
ZDJhYS4uM2E5NTI1YWE0NTk4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmEu
Yw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gQEAgLTE2OSw4ICsxNjksNiBA
QCBzdGF0aWMgdm9pZCBoYW5kbGVfdmVyc2lvbihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykN
Cj4+IA0KPj4gc3RhdGljIHZvaWQgaGFuZGxlX2ZlYXR1cmVzKHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKQ0KPj4gew0KPj4gLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWlu
Ow0KPj4gLSAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiAgICAgdWlu
dDMyX3QgYTEgPSBnZXRfdXNlcl9yZWcocmVncywgMSk7DQo+PiAgICAgdW5zaWduZWQgaW50IG47
DQo+PiANCj4+IEBAIC0yMTgsMTYgKzIxNiwxMCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfZmVhdHVy
ZXMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgIGZmYV9zZXRfcmVnc19z
dWNjZXNzKHJlZ3MsIDAsIDApOw0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9G
RUFUVVJFX05PVElGX1BFTkRfSU5UUjoNCj4+IC0gICAgICAgIGlmICggY3R4LT5ub3RpZi5lbmFi
bGVkICkNCj4+IC0gICAgICAgICAgICBmZmFfc2V0X3JlZ3Nfc3VjY2VzcyhyZWdzLCBHVUVTVF9G
RkFfTk9USUZfUEVORF9JTlRSX0lELCAwKTsNCj4+IC0gICAgICAgIGVsc2UNCj4+IC0gICAgICAg
ICAgICBmZmFfc2V0X3JlZ3NfZXJyb3IocmVncywgRkZBX1JFVF9OT1RfU1VQUE9SVEVEKTsNCj4+
ICsgICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIEdVRVNUX0ZGQV9OT1RJRl9QRU5E
X0lOVFJfSUQsIDApOw0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9GRUFUVVJF
X1NDSEVEVUxFX1JFQ1ZfSU5UUjoNCj4+IC0gICAgICAgIGlmICggY3R4LT5ub3RpZi5lbmFibGVk
ICkNCj4+IC0gICAgICAgICAgICBmZmFfc2V0X3JlZ3Nfc3VjY2VzcyhyZWdzLCBHVUVTVF9GRkFf
U0NIRURVTEVfUkVDVl9JTlRSX0lELCAwKTsNCj4+IC0gICAgICAgIGVsc2UNCj4+IC0gICAgICAg
ICAgICBmZmFfc2V0X3JlZ3NfZXJyb3IocmVncywgRkZBX1JFVF9OT1RfU1VQUE9SVEVEKTsNCj4+
ICsgICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIEdVRVNUX0ZGQV9TQ0hFRFVMRV9S
RUNWX0lOVFJfSUQsIDApOw0KPj4gICAgICAgICBicmVhazsNCj4+IA0KPj4gICAgIGNhc2UgRkZB
X05PVElGSUNBVElPTl9CSU5EOg0KPj4gQEAgLTIzNiwxMCArMjI4LDcgQEAgc3RhdGljIHZvaWQg
aGFuZGxlX2ZlYXR1cmVzKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgIGNhc2Ug
RkZBX05PVElGSUNBVElPTl9TRVQ6DQo+PiAgICAgY2FzZSBGRkFfTk9USUZJQ0FUSU9OX0lORk9f
R0VUXzMyOg0KPj4gICAgIGNhc2UgRkZBX05PVElGSUNBVElPTl9JTkZPX0dFVF82NDoNCj4+IC0g
ICAgICAgIGlmICggY3R4LT5ub3RpZi5lbmFibGVkICkNCj4+IC0gICAgICAgICAgICBmZmFfc2V0
X3JlZ3Nfc3VjY2VzcyhyZWdzLCAwLCAwKTsNCj4+IC0gICAgICAgIGVsc2UNCj4+IC0gICAgICAg
ICAgICBmZmFfc2V0X3JlZ3NfZXJyb3IocmVncywgRkZBX1JFVF9OT1RfU1VQUE9SVEVEKTsNCj4+
ICsgICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIDAsIDApOw0KPj4gICAgICAgICBi
cmVhazsNCj4+ICAgICBkZWZhdWx0Og0KPj4gICAgICAgICBmZmFfc2V0X3JlZ3NfZXJyb3IocmVn
cywgRkZBX1JFVF9OT1RfU1VQUE9SVEVEKTsNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
dGVlL2ZmYV9ub3RpZi5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYw0KPj4gaW5kZXgg
NGIzZTQ2MzE4ZjRiLi4zYzY0MThlNjJlMmIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
dGVlL2ZmYV9ub3RpZi5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+
PiBAQCAtNDA1LDcgKzQwNSw2IEBAIHZvaWQgZmZhX25vdGlmX2luaXQodm9pZCkNCj4+IA0KPj4g
aW50IGZmYV9ub3RpZl9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gew0KPj4gLSAg
ICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiAgICAgaW50MzJfdCByZXM7
DQo+PiANCj4+ICAgICBpZiAoICFub3RpZl9lbmFibGVkICkNCj4+IEBAIC00MTUsMTggKzQxNCwx
MSBAQCBpbnQgZmZhX25vdGlmX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+PiAgICAg
aWYgKCByZXMgKQ0KPj4gICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+IA0KPj4gLSAgICBjdHgt
Pm5vdGlmLmVuYWJsZWQgPSB0cnVlOw0KPj4gLQ0KPj4gICAgIHJldHVybiAwOw0KPj4gfQ0KPj4g
DQo+PiB2b2lkIGZmYV9ub3RpZl9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4g
ew0KPj4gLSAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiAtDQo+PiAt
ICAgIGlmICggY3R4LT5ub3RpZi5lbmFibGVkICkNCj4+IC0gICAgew0KPj4gKyAgICBpZiAoIG5v
dGlmX2VuYWJsZWQgKQ0KPj4gICAgICAgICBmZmFfbm90aWZpY2F0aW9uX2JpdG1hcF9kZXN0cm95
KGZmYV9nZXRfdm1faWQoZCkpOw0KPiANCj4gVGhpcyBjYWxsIG1heSBub3cgYmUgZG9uZSBldmVu
IGlmIHRoZXJlIGhhc24ndCBiZWVuIGEgc3VjY2Vzc2Z1bCBjYWxsDQo+IHRvIGZmYV9ub3RpZmlj
YXRpb25fYml0bWFwX2NyZWF0ZSgpLg0KPiBBIGNvbW1lbnQgbWVudGlvbmluZyB0aGlzIGFuZCB0
aGF0IGl0J3MgaGFybWxlc3MgKGlmIHdlIGNhbiBiZSBzdXJlIGl0DQo+IGlzKSB3b3VsZCBiZSBu
aWNlLg0KPiANCg0KWW91IG1lYW4gaW4gdGhlIGNhc2Ugd2hlcmUgaXQgZmFpbGVkIGR1cmluZyBk
b21haW5faW5pdCA/DQoNCkkgY2FuIGFkZCB0aGUgZm9sbG93aW5nIGNvbW1lbnQ6DQogQ2FsbCBi
aXRtYXBfZGVzdHJveSBldmVuIGlmIGJpdG1hcCBjcmVhdGUgZmFpbGVkIGFzIHRoZSBTUE1DIHNo
b3VsZCByZXR1cm4gYW4gZXJyb3IgdGhhdCB3ZSB3aWxsIGlnbm9yZQ0KDQpXb3VsZCB0aGF0IGJl
IG9rID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCj4gQ2hlZXJzLA0KPiBKZW5zDQo+IA0KPj4g
LSAgICAgICAgY3R4LT5ub3RpZi5lbmFibGVkID0gZmFsc2U7DQo+PiAtICAgIH0NCj4+IH0NCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmggYi94ZW4vYXJjaC9h
cm0vdGVlL2ZmYV9wcml2YXRlLmgNCj4+IGluZGV4IDAyMTYyZTBlZTRjNy4uOTczZWU1NWJlMDli
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmgNCj4+IEBAIC0yODEsOCArMjgxLDYgQEAg
c3RydWN0IGZmYV9tZW1fcmVnaW9uIHsNCj4+IH07DQo+PiANCj4+IHN0cnVjdCBmZmFfY3R4X25v
dGlmIHsNCj4+IC0gICAgYm9vbCBlbmFibGVkOw0KPj4gLQ0KPj4gICAgIC8qDQo+PiAgICAgICog
VHJ1ZSBpZiBkb21haW4gaXMgcmVwb3J0ZWQgYnkgRkZBX05PVElGSUNBVElPTl9JTkZPX0dFVCB0
byBoYXZlDQo+PiAgICAgICogcGVuZGluZyBnbG9iYWwgbm90aWZpY2F0aW9ucy4NCj4+IC0tDQo+
PiAyLjQ3LjANCg0KDQo=

