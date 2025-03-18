Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F4A66F93
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918795.1323435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT9m-0006jP-6h; Tue, 18 Mar 2025 09:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918795.1323435; Tue, 18 Mar 2025 09:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT9m-0006ia-1y; Tue, 18 Mar 2025 09:22:42 +0000
Received: by outflank-mailman (input) for mailman id 918795;
 Tue, 18 Mar 2025 09:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuSS=WF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tuT9j-0006iU-RX
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:22:40 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2607::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860aa4a6-03da-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 10:22:33 +0100 (CET)
Received: from AS9PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:20b:46c::34)
 by VI1PR08MB10147.eurprd08.prod.outlook.com (2603:10a6:800:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:22:27 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:46c:cafe::34) by AS9PR07CA0022.outlook.office365.com
 (2603:10a6:20b:46c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Tue,
 18 Mar 2025 09:22:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 18 Mar 2025 09:22:25 +0000
Received: ("Tessian outbound 17f7e587bbed:v594");
 Tue, 18 Mar 2025 09:22:24 +0000
Received: from Lb234a114b17d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F585D9AD-79E1-4ADF-A6F4-A319B553A1FD.1; 
 Tue, 18 Mar 2025 09:22:13 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb234a114b17d.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Mar 2025 09:22:13 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS4PR08MB7805.eurprd08.prod.outlook.com (2603:10a6:20b:518::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:22:10 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 09:22:10 +0000
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
X-Inumbo-ID: 860aa4a6-03da-11f0-9899-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qRgZgXI97NrBYhOgYApSDz4CcM/5vAzRZ8G/vJoGFEkrNCeb/7gn7x186qZiOfvkOLWDg5rfTZ2zdVQytl7gnRFBz3ysaa+hjjSYgrEvp0RIRFBh20yvgloZIeJ8frXz87zUc9LhvrRvrXfJaT0I+w+YktjqxNwkEwvIjKFHZPDnafO6q0wgV8Q/OrQTwH6UIfIqfoCgzS0nd/ZUkBxC1d+y76CytxT0iIXZEVVRXO+P+bSLeZO/lvrGUyUSj4mOG8RLen3/m0hPwu9fy12PvulRjE3eUfBtfgOGFcPOlPOPpD+UHrQk191dtW5OaJq/7u0ijaL7xyj8VWXtu2NATQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmXGDEHYQNvfkQO23uSpbV4xL70VbloqjkpQnbKVHfs=;
 b=u5xTL5ANmP+uQvMakChR1e8lRPosEHqXi5+On5DyAeCzf1wx7sC+A74LQGleH8CE2Cd8vg6FxYRohiKAG2RXBR4GTXalOMU1bLMB9BqTQ79gWFBAQAZfhHFHs6vN7F03xjRzwFbsinue4PjoWHLy4xXeKbQfbgXReCEgpStU33pl4BSE+BVBvIxlIElW4Z4WwOVQQCVNYV7N07e8KgWnp81NuMc8B4HkeJDb9JLVpKgb9jYBueXlKEvOb9h0Wkt0ryWOX0DAX7V2z73wDuEz48+JCI1W1imRsUiEN8qp/MHCZw+RuDiSDm8EfC1HVy1nWZEcrz8bvdgY9MQgXWljHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmXGDEHYQNvfkQO23uSpbV4xL70VbloqjkpQnbKVHfs=;
 b=iuJr4stz7LVoC8kAWJWI4yGCOYyzr+fudYL1CjlDpaBXzgrDXrrrnCnTXu9bhrTjn5Vq3EbT7czfncrTuYnJB4nmpA88X66h+DKNj3CaLVo7Me1jbP6VdJZrndovTUy4zXNxosYeOUprjHVF+iDCHonP5k3kxHK6OlIe3HXbPlM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18c15adf81d82e27
X-TessianGatewayMetadata: xvgaXhDMtRt/ydvZfxrp2HRCs4rbsWR4sIRoG6rJiD+O9ceiacSs50Ifx6vsz17YxeNUsV0P3IySOx+rc8psgXZ4Bx9hIaFdJPDKr5oe4npEMLa+JSFSqahI0/einhWLuv0L+gav+hK9wG1EoUrtnczN+yIZZPPg9GBoeo97+rE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkkTb3yt0ZDRRGbxX/+YNh4jqkAWfjDp1M1VO9y9Tq6FEV2oG2PwZJLtuoig9zwkvG1+0hnkJiGRafJquWApH6u3TS3ods19jJBLRe9HhcXK0AhMKQF0j+Z+FbdGd817VPEoRGnWBsjws+gaVRa6IGGoVNw0dTlKnqit4QkcTeWahHAoxr7qAy0EXeioJuvYi9NT+SLHBdtUIOSgHH7BB0TNNJUu5sFaBJ+P+uh75XhFC9oqvdpEpmTZZXJ2HA//Pf2j6mhd+O3dAaeoxUoU9GP1jCynCbTDCOS+Ad/WAnVotQ3ZgMSXl4U8LDxOMfouFmyyQg/3Zj9C26lSbGTMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmXGDEHYQNvfkQO23uSpbV4xL70VbloqjkpQnbKVHfs=;
 b=bIlTjrGq6au6wpA4W9jgc6osZAA80PMQxY0xq1zyV3HHuv9HE80R//5ben6ETdL7U9+U7M8FHhLU+DUE6jMvvu5SLuRkxi00CUIEiwY1fbM0ki1mCsKNeygAqeB3bNkM5EntezOoiF4vMZFq9CQ3ytnIxCu1h2DImw7FdOr4Opdp8+VDwrl61aF4vI/ZA5BET0N/7MH08yjfobtaN+TSsrCmX34nbHpFeqY2ScjcgnTBA7drJ+sDpLM224S20Oa0zlTGdySiE1E+O3nlmQ+77ZOcY7D85v0/d/N+JyDVmwNuN/BzJHjLMGlnTgi42nJ/0Kn8qH5Pa6Nem0OacnwC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmXGDEHYQNvfkQO23uSpbV4xL70VbloqjkpQnbKVHfs=;
 b=iuJr4stz7LVoC8kAWJWI4yGCOYyzr+fudYL1CjlDpaBXzgrDXrrrnCnTXu9bhrTjn5Vq3EbT7czfncrTuYnJB4nmpA88X66h+DKNj3CaLVo7Me1jbP6VdJZrndovTUy4zXNxosYeOUprjHVF+iDCHonP5k3kxHK6OlIe3HXbPlM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
Thread-Topic: [PATCH] tools/arm: Fix nr_spis handling v2
Thread-Index: AQHbl+Q4jNpuw47SOEWRO7HfAgkt77N4noaA
Date: Tue, 18 Mar 2025 09:22:09 +0000
Message-ID: <8E493E7A-B108-4510-874A-FEA703013DBE@arm.com>
References: <20250318090013.100823-1-michal.orzel@amd.com>
In-Reply-To: <20250318090013.100823-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS4PR08MB7805:EE_|AM4PEPF00027A67:EE_|VI1PR08MB10147:EE_
X-MS-Office365-Filtering-Correlation-Id: 035dc3cf-50ff-4f4b-f519-08dd65fe6581
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VWJ6VUp6bnFCR0ZGc05VM2N4WGFQRWRFcEFET0QxeVl1bjJYTEFLWjYxR1d2?=
 =?utf-8?B?RC9TT2VGMldZbzFvNXhPRGd6S3JaTFBJdldqMjBmU1l6RlJIaUszR2hWKy9O?=
 =?utf-8?B?TXBFRzlsc3lPQXlBM0VBRnNkMTFVdDU4MHQvS1FBeUJaT2RGbldKamxCcG1s?=
 =?utf-8?B?WUtNZlEyYjdINkx0ZU0xR2UxeGV5b0NvdFEwcGtKMGJUSitBcnNPbDFKMWlo?=
 =?utf-8?B?Q1BLNEVMN05raXo4WTd3MzF6dEFGdjFlOHFybmRBNUJKQUlHRXNaNjZmQk1o?=
 =?utf-8?B?M3FzTlo3UUNuaXRTdUVYL2ZDN0o3T3RlM2ZwcTNDWkhOYkFKOWNDeUpDd0xq?=
 =?utf-8?B?VU5mVmlkakNQOS85cDROdnBqTWQ2cXNpeWlkaDR1eTIyWEU2THpmdlYxTUV2?=
 =?utf-8?B?Nm1HeXVUekxoTitwSTR2Z0FkdG03TmZOeVFKa1A4K3NBQVJqNExYY25nazE4?=
 =?utf-8?B?TVB4WEQyMU14ZHN2OFp5a1NiZmttbVVHbExZNDUvejFGTFJCTi94ZVllc2FU?=
 =?utf-8?B?ZlJCc0NSUDdqS2xkMkpZcVV0UDdLdisxeCtRVkdXQmhsMXB0SWF3TmhGYjF1?=
 =?utf-8?B?TlkrK0ppczNqVkltcExZbE0rY1BnL3ZlV0xSVnVFZ1RpTUdONXlUZ0U0RzBw?=
 =?utf-8?B?VmRMVjJTWlFpYUxYMmVZMFhjRnhaMW9PSEhKZzZiTVJGMEplemc1c3hxNmZV?=
 =?utf-8?B?RW9uTVBwSTc4S2dSaXBNMjFoQkgxckpyb2N5QTNuTm4zK0p1aWVtc2lXMHU5?=
 =?utf-8?B?bWtMUyt0a3VVeEh5QmNvTHJBUVc1QXUxMERPVUdKazg4ZU5INCtmZlROc2FH?=
 =?utf-8?B?SWNMMUNCcGlHRSszM0M4bW1IRWlPWnNuK2NuQVc0WW83UVlUTm1OMm44dDVl?=
 =?utf-8?B?SnAzZWs2OTdMRVRKTFVydEU3RGVZK3hOb2I2VmtxcGlueEc4cHExSFFzeUNT?=
 =?utf-8?B?aGlzNklIWEdQWDFMQnJHSDNiZ1hNYU03b0hybENOVU1Wc2hhWUFYQ1BQQWZo?=
 =?utf-8?B?T1NId2FnNE1sOFBCMlJmVUFQTXNVWmd3K2N1R2k3ODFUV1VwTzJGOGQ4R2xm?=
 =?utf-8?B?djJDL25RcTRxZGkrTzJxK2pzRHZMclY5OWRJSmw2RFM0UzZsWmI1YVRkaWsx?=
 =?utf-8?B?NU54c3ZsdldXeGZwYmF3OEFuYkRpV3ord2JFQ1V6Qmg4MUlHTGpBcXhna0hO?=
 =?utf-8?B?ZVF6MWI0K0VBdFBzd0VzTlg4Y2tmc1MzKytmeWI0d3VQbUZZNHQvakFhVmxw?=
 =?utf-8?B?UWZTa3RybklvdFcycTF4T2VpdFhsMDI0M0MxWnh0UUFrdFA1U1o3Z3o2cXdp?=
 =?utf-8?B?WEk2NmIzS0FmZHRQTHpyQmhpcmU1U2RsbDBSUHhubElKcEZMWWl3WUpHWmpD?=
 =?utf-8?B?OUt0Y21XR09aTmNtOXY3RXI4M05PeWl6L294Sm5TZk9NS1gxSERtQXNXUERL?=
 =?utf-8?B?UFpodHFMc0NEdlNEaVNPZldKM3JEdUNDMGNOUEFMTUZSQ3gzejBMVFc0eHRR?=
 =?utf-8?B?SGV1MXM4eFdzYm1ibjJQdmxLb1NKd0xFNStKcG9Fc0hYRlZMYXppODR2MVRV?=
 =?utf-8?B?ZFp4SlVCYk9veWlYYTI2YXlicDhCVUZmdkN3MW0xTm9HTVNDTytWNEQ0dloz?=
 =?utf-8?B?b1BEamtaa1F4WjhMaitoMlUxdWx3cTBDNC9zOG4wS0E1TTN5aHZDRmpQR0ZB?=
 =?utf-8?B?REFMWnErbDZJczBRTjVlMURkRkIvblM4WWFpVXo3TGtmVGRQWkJ6ZmpIOEUy?=
 =?utf-8?B?NUJKMFUzbWErUUtMSGhjYnpZdWluY1VRL3h2dExHYVNWTDA5ZDRiMklTNFVz?=
 =?utf-8?B?NnJwQ1NBWjFCNVFvVmdsaDEwYmFVL1k0ZmowSzY0VVRCUFljWGhwbExNa1pv?=
 =?utf-8?B?YzBLOWI1ckkyVWRrdGhLSjF0UEpzK2NUQUNBeStJbnIzUS9KbGdXYXpsczVz?=
 =?utf-8?Q?2e0BsNclT9jzJziPniu4ub0b6IDYasf8?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA62EDCD6864F9489530329D4505F981@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7805
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f063845-af9d-48cd-ea36-08dd65fe5c40
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzJVanA3SEU1TkYrZVZjN3dqcW1nbk5VWDdaVEU2dzY5amptK2U0UTJiUXhl?=
 =?utf-8?B?KzQ2RDk3eHp0SDJmY2ZwOWFBeU50c1hVdUJHd1hzRkdtbk1hSXJ1aTFPM3pF?=
 =?utf-8?B?UUlRWlovZmZWVldKS3llaDZmcm1MVFBoUWZVbnJjTmNnS2RZeGJaQVY0ak5s?=
 =?utf-8?B?cUQzckRnT1lBOE1tK3lTWHVJclZVNzBZbFJHWTJwYUZ5RUZOM0kzMzhJNE9D?=
 =?utf-8?B?TUR3ejRQbUNQdjNaYktFMTBYRGhhaFhrd09UUnpZSklPM3J5ZG1BS2xwd0JT?=
 =?utf-8?B?UlJTN1dkc0ZNOGtxdVlyUXBmMktYd1R6MVRnZ1NDUDhkVjZ3emZuUGM2RUVI?=
 =?utf-8?B?bDh0OURsWkJwVHNqWTczeC9JMU94ZS8yYnlGa1I1eFAralZ5VzdWVkxyRncr?=
 =?utf-8?B?QVlxR2lRa09ubWdEeUk0RjBrdE9ybEpQcDFsWWZlWjBDdDJEMVFzRnd1MDFT?=
 =?utf-8?B?dlIwRGZLNVR1bnlpckpGZERwU0twN0FxdjhQc1hEWW9LRElvbU9JV1gzRlhL?=
 =?utf-8?B?Mkw3MXphOHUwaVJ3SkozcWRXLzQ2bEZDZ3UxMmIrdzJJRVlaVFlxc0xsc3Ev?=
 =?utf-8?B?b1hYb2RoK0NrQzZ4UW00c2lGeE41RGtqUVVkS0xDWG1Xbk1MRDM1ZjYyZnVR?=
 =?utf-8?B?Yk9ZaXVseTd0bU5rL1IyajRJblRmcktrYlNzcEthaU95R3hNSHM5d3dOMWRK?=
 =?utf-8?B?MHliYk5uekZTRi9ndnlIdkNTdXpYMENtaVpVcThWNDBXSlhsL0ZkelRCZ3R0?=
 =?utf-8?B?RklpR0FRamRWWHNzMjFmVzMyN0FEMWhJNHo5T0JLU0RMaWJoMjNDQngyQnM1?=
 =?utf-8?B?RDJzK0hyeTAyR1FRWTJwbmRYazFWRU5uSzQrYnpjUWxsRURBdXlQMHBLYnlV?=
 =?utf-8?B?eXg5cnlLSzBhQzdiL0xqL291eWdWTzlEL2hwS0txTGsvUy9vaFBYTHVKSlZX?=
 =?utf-8?B?L0hBQnZRRjRPa0pJbkcyVGpDZFBzTnJqZUVsZkRFUytkNHlidmNMSmVteEZ4?=
 =?utf-8?B?OWllb25pYVNHV25hT1JBVzUxY1hCRWpOeDJra0QzUWRrM3hBTDRDTkw1YzZR?=
 =?utf-8?B?cGdhckdpYVVaWk9PZk14c29yWVQyM1B1MG0wL2NhV2pCb2thK2Qvak5oWktm?=
 =?utf-8?B?ODJZck9EbzNGR2ZNTk9PQ3JzMzJaTXBFdWFKSXVsbkFPOVFCZ1p0Ulg2Qk1N?=
 =?utf-8?B?M3VRalNabnVmejFqK0dBa3lFQ3hYQThNb0VVRnVyaW91UEdyNlc4cUVrSmdV?=
 =?utf-8?B?N3M3UytGZGRVSGZnRmhIOWt3VjFDK29xeTBHMmNRNmVENTlBWStaOWNncVZt?=
 =?utf-8?B?KzcrSmZmZ2ZUdDlHc3R0Z0g3WjhyanZjT2dSa3daZ00rMXlYRDJGM3pTbTRX?=
 =?utf-8?B?OEdKSHpQRzBxL2ZFb3dRclM3dGtIaDJlbit1MHdQeHdmUHhJekxoMkFMVmht?=
 =?utf-8?B?YVhmVEY2ZUFkd21iYStmQnRNTUFXRjUrQTdCbzY5alBCUUd0ZkZaNXZnVmY1?=
 =?utf-8?B?dGdTaklWTUhoUE9UQjFoNUJBZ0ZmNENZK1psNkE5MU9xMW5UcUVMRDc4ZE82?=
 =?utf-8?B?bno5UzN5Wkhrc09mVVhpYmE1WUlSQkR5VUVONlRNamJoNmR5YW9EY3lUN2FE?=
 =?utf-8?B?YkpkYkJET0NMREs4YzZRV3hBVXh5aDBvUTJuKzZ2aXpwcmE5Rmp6UG9qeHMr?=
 =?utf-8?B?M1hMc1lyYWlhUFQxOFBiMEdrNHlOL2VKN0FGNCt5RkdMd3BwdGk0L3hWOVFo?=
 =?utf-8?B?MUtObFVkSU9qWXgxZWplNFFha2J6SzJwMzIzM3ZERU5HVjJsNk1VRkJoSmJn?=
 =?utf-8?B?SEl5T3B0L3o1ak90SGVpV0EyS3VBMHJVZlM4czFhaXd1NDJEdTZYRmhpNTl4?=
 =?utf-8?B?RTRtT1JHa2d2NmpLRjhQQVU0RVJKOHNrVUdiMkxKblN2Tk1oaHY4ZnNVZkQr?=
 =?utf-8?B?TUVhUGVTOEVaMUNyRzVzSmJIYzZoY25ESmFXdFEwenZEMGpmaHQ4cnc1U3I2?=
 =?utf-8?Q?iD+zDXQuzZqGwyR3rLY73AYKCt1Bbk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 09:22:25.5124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 035dc3cf-50ff-4f4b-f519-08dd65fe6581
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10147

SGkgTWljaGFsLA0KDQo+IE9uIDE4IE1hciAyMDI1LCBhdCAwOTowMCwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBXZSBhcmUgbWlzc2luZyBhIHdheSB0
byBkZXRlY3Qgd2hldGhlciBhIHVzZXIgcHJvdmlkZWQgYSB2YWx1ZSBmb3INCj4gbnJfc3BpcyBl
cXVhbCB0byAwIG9yIGRpZCBub3QgcHJvdmlkZSBhbnkgdmFsdWUgKGRlZmF1bHQgaXMgYWxzbyAw
KSB3aGljaA0KPiBjYW4gY2F1c2UgaXNzdWVzIHdoZW4gY2FsY3VsYXRlZCBucl9zcGlzIGlzID4g
MCBhbmQgdGhlIHZhbHVlIGZyb20gZG9tYWluDQo+IGNvbmZpZyBpcyAwLiBGaXggaXQgYnkgc2V0
dGluZyBkZWZhdWx0IHZhbHVlIGZvciBucl9zcGlzIHRvIFVJTlQzMl9NQVgNCj4gKG1heCBzdXBw
b3J0ZWQgbnIgb2YgU1BJcyBpcyA5NjAgYW55d2F5KS4NCj4gDQo+IEZpeGVzOiA1NWQ2MmI4ZDQ2
MzYgKCJ0b29scy9hcm06IFJlamVjdCBjb25maWd1cmF0aW9uIHdpdGggaW5jb3JyZWN0IG5yX3Nw
aXMgdmFsdWUiKQ0KPiBSZXBvcnRlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQu
Y29tPg0KPiAtLS0NCg0KSeKAmXZlIHRlc3RlZCB0aGlzIGZpeCB1c2luZyBvdXIgdGVzdCB0aGF0
IG1vdW50cyBhIHZpcnRpbyBtbWlvIGRpc2sgb24gdGhlIGRvbWFpbiwNCmV2ZXJ5dGhpbmcgd29y
a3MgZmluZS4NCg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5j
b20+DQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
DQoNCg==

