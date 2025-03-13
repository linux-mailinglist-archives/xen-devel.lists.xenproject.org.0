Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92467A5F0FB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 11:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911864.1318240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfrz-0000gE-MP; Thu, 13 Mar 2025 10:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911864.1318240; Thu, 13 Mar 2025 10:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfrz-0000e0-Jd; Thu, 13 Mar 2025 10:32:55 +0000
Received: by outflank-mailman (input) for mailman id 911864;
 Thu, 13 Mar 2025 10:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkET=WA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tsfry-0000du-Hd
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 10:32:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f403:2613::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8428e5e2-fff6-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 11:32:52 +0100 (CET)
Received: from DU2PR04CA0326.eurprd04.prod.outlook.com (2603:10a6:10:2b5::31)
 by AS4PR08MB8168.eurprd08.prod.outlook.com (2603:10a6:20b:58f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 10:32:47 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::c8) by DU2PR04CA0326.outlook.office365.com
 (2603:10a6:10:2b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Thu,
 13 Mar 2025 10:32:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 13 Mar 2025 10:32:45 +0000
Received: ("Tessian outbound 8a1969cea684:v585");
 Thu, 13 Mar 2025 10:32:45 +0000
Received: from L1b6a79a412c9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A45BDBC-BFA8-48C5-B40F-2BBD413E0FAE.1; 
 Thu, 13 Mar 2025 10:32:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1b6a79a412c9.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Mar 2025 10:32:33 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com (2603:10a6:803:4d::31)
 by VI1PR08MB5437.eurprd08.prod.outlook.com (2603:10a6:803:13d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 10:32:31 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8]) by VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 10:32:30 +0000
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
X-Inumbo-ID: 8428e5e2-fff6-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cycF9ywvVlAUL2zG8xjlJ5kfViXlKiAz8Bha716YeJNFr5zSwvjvVrXoS2e/UrOkZdZuPiLhWGAmc5dmMPqF8Ds925VfdwyOkfo0Q0hZOe9DGcb8Szym3zavHJUqQ1y8Vj5yRLNSChzTYC/LhdJqcyD/u3mqWNf4dJkSF4fbXndzQBzRAc/xSxJ/bqzF4kLN708AzIcsUzVp2d1tqPN0lr7CiMJ9TU7o9lb11DhU9DzCsO/ZYrO2l/ijbZw1aE+m241ivItxY4jk6r6Fik+MN+zVJBOfU6CiCVN2rz7GSm0CofFQ0QZyDm+BTM4Xwy2u0jywdcuZRAx0+1+iJdbRZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+apW+JahIzA5UMmxjlG8FWvelPkTMusEsUPz1RNmBec=;
 b=IX5Lj5XBHGglpcl9llxqJWy7O+RB6IZg8w+Qzm+MpjjeFgSy7Bm9LYf8y6DwGsqKSjDDR2UoUJZwcPLx3y82BoDYK7AhfbHA3kfYOJY90HgHAlm8DsCAWmzZJnU+5Lk5ZOl6uJYfjBv08RxPqFQ1El3qTGLjKyoYuPNTwbBEtz2/2AnjtOB/W5OzxaAixhF2RRFcdPXnm2nS2lRqFM+8bGmFfmgLjVn31kIbA4BA5+v1z/y+U5V14r//WNaIzh8HwCnUddD8UZNhtKn9UT7+I4LQ6BOSuVHECYFts2DpqSKt6qmGL6W3rD0WvPlSYF1bqHdtYf5P6ZnVrWOp6XIwrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+apW+JahIzA5UMmxjlG8FWvelPkTMusEsUPz1RNmBec=;
 b=FkiGAkT7dqR3unlLZEk70eMsdtdRLRqPoJ34V+LBqTsAmi2TnX7vZ3b03NKzNyvvxZibvnXtpTL69eUY3bQodu7bjLKc7TcXqctpPA9/X5dUNr7/os80HmOX2j/QjBMuGCQju+hPon6IlZgHIgvWkQeE0kqxAnpCoGHh9a3nWdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba639f01778acf39
X-TessianGatewayMetadata: YRegExSjeYGUageuhNhhmB+EzsymDFLJqjGb9POv8s7akTdGFpobMwUGFOaTAfikruyKXEKqucXPt3t9nYbTZZiwKTe5MC8DqFyXcNyRs4+cNY/k3wbkItXvxSYYOMyTdhzf1P7/uEmVnxtneFz37oog55s31Ee90SY2HK/MGIc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6waT0v2wC4DR/RkkOuKwGCAACxdG8QjBi+9Vv/BdGXqwnwJRWWfrryVOB0nqEhAqH0n5a6/aZ4pZgkuh6PcfGtCNP6fpkEHf6gg5Zyj5GgEdRojmlBrX9S4DF2RNwNOiCI+m4c62iSz2svhiUjiku8eNU78IBUY6yu+kjyvdEEe8Ei9bMOoLOCPfbdCqQYdMlscqTb9JL4FOoQOdAV3N5nIZYLhbz/XFKW52bgk9w16viBs9O+xyV6GGmyaQUq30de5j8GHU+Ptp7dCByWnY3ZLTiX/19cWS9Ih1FlyPIj39wIWzS5pQe9I/kCTSTlVP8zVeExkJoqtnBS+3xMcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+apW+JahIzA5UMmxjlG8FWvelPkTMusEsUPz1RNmBec=;
 b=cpi4+HOWC6k5224UYYirCfzv9NEA3o3jp9fxq1WQI7wZqe2Qvnoswjt9MY5gQKA4mlIDDgMlmTExy29UubV3rBCSPv5UH1rRL9yxNVfTqTibrYMoAQb8pubId/1QBqd47Z4ODsO1DV62jDxNLiEvkBYJtGJYluk5zr5ext3IZXOTdFLFsiECJjn2o5csIRzvSXuFfvnm4boBqyy1BPxqXHdd/yI+r2bVmhtEfiFCNxGvn/u6Ritool8Hm1L6AcI9K0m+5wxMa3/kNQOLNeSedQV8bCp73w+wvSvqQPTEQVqRn3enlmrS7sexCJHJ1B67ofDiqS+3/+MHcF25jRGMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+apW+JahIzA5UMmxjlG8FWvelPkTMusEsUPz1RNmBec=;
 b=FkiGAkT7dqR3unlLZEk70eMsdtdRLRqPoJ34V+LBqTsAmi2TnX7vZ3b03NKzNyvvxZibvnXtpTL69eUY3bQodu7bjLKc7TcXqctpPA9/X5dUNr7/os80HmOX2j/QjBMuGCQju+hPon6IlZgHIgvWkQeE0kqxAnpCoGHh9a3nWdg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 08/10] xen/arm: Rename setup_pagetables with a more
 generic name
Thread-Topic: [PATCH 08/10] xen/arm: Rename setup_pagetables with a more
 generic name
Thread-Index: AQHbk1Yo0cmyjZFeTUSq869Hx0J/E7Nw3DiAgAADaQA=
Date: Thu, 13 Mar 2025 10:32:30 +0000
Message-ID: <ACE7CE6B-ED78-4EB1-85EB-DA2A98CEB83A@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-9-luca.fancellu@arm.com>
 <ada28315-0cfc-4be0-a543-31b589729044@amd.com>
In-Reply-To: <ada28315-0cfc-4be0-a543-31b589729044@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VI1PR08MB2989:EE_|VI1PR08MB5437:EE_|DB3PEPF0000885D:EE_|AS4PR08MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: d904234f-9331-43d3-4879-08dd621a64c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?THgxQjlNbXdSMExSd1lFSWhCOENMNWo0NGlJK1RibW5nM2l0K3NUQWxiTDVG?=
 =?utf-8?B?Z3VsSlVab3hOM3FtMFB5S3pvdndQV010SkNrWUdXOERUQnNBQVRoL3dOV1FS?=
 =?utf-8?B?NVFVa3BsM0psaERPN3VFUHN4b2VmUVMxemVERjZCdHBoRzRrOTlFTGZ3NkpW?=
 =?utf-8?B?TENBUVIrTzloZWltakRhYkd1RWY2VVFwR1BhUS9Za0xCZ0ZqRGZFYU15a1dp?=
 =?utf-8?B?aHhLd25sbVNBSzNCbzdaZG1kSFkwOGRDOC9IN2pRelBQRFVsN0RnOTUyOHQx?=
 =?utf-8?B?YmZUL1dtWVpPVXNPU3pYeXd2R1lDNGViMkxMYTdaRS9mT2s3djgwN1JsY0xP?=
 =?utf-8?B?U3hWOVZBb3JldEdtdERGSkJiSU1pTUdCQ3ptd3R1T2hIQXZxSDRrOWlZUGJN?=
 =?utf-8?B?a1FNQXpDOTJKVkFzL21paWpZQzVZVUdwTjFLbDAyNmNKKzNHZ3B5S0VDNTlu?=
 =?utf-8?B?eFJ2a0xLTTNJNWtHZ25MQ1htcDdLbDlZL29ycS9EaFBTZUNwUjNuMGtmeE1N?=
 =?utf-8?B?VUIxVytaR1dzWU5TaHZjVVoyZU01TzZ5a0lDNTNKdFdJRWZtcWFocEZLVG5X?=
 =?utf-8?B?MWhOQXNzRStnNlZnKzEyUnRwZjE2SkQyVGZPVGh1V1lDVzdTR3Nud2ZHbS9B?=
 =?utf-8?B?bndleW11a0x0REYvZ0ZoVW1aQXBQMFJ3dEZUMk12VlRqdHo1RThCNVoxU0w0?=
 =?utf-8?B?V05SOVFtd0tFTG42dTNaQmlBKzc0RGxuWU9NVDdjUm1ZL2VINGFOZHRDYWVI?=
 =?utf-8?B?N1VQYWloV1RqNkhNNWpPTWVVUGhScEhzd0NnMHB3bHU5dDlzaGd0NWhtUEVy?=
 =?utf-8?B?U21GNlJuNHE4V3JLbU5ZQnZVdWJvam5Fd0E1ZFlhSDdoemxIQitleHZadlB5?=
 =?utf-8?B?WmExUE15N0pScU50aWFzSTR6Q3lvOTdpLzBvajQxSllEOTBXSi9MdXJ2dzEy?=
 =?utf-8?B?Z0gyZno3SmgvNXRoUmVhVnVQNVN4dGxJUm1saDU2akVoTXdhd2JUSUdpYW5i?=
 =?utf-8?B?ekhndnRHTXNMUUw3R1ZwRmZJc3duZkUyeW9XdHJzRDFHYmdDZjVCbjROYllj?=
 =?utf-8?B?ZnE0d0xDZE1KRFV4T09ha1NaWVFwVXluSUFlR0VvNThJZ0NCMWJMNDFBaDRi?=
 =?utf-8?B?VUNhUkdubWFLRGNOVWpuRHZub0NxbVFDd2tKd0RvcDVCeDNZVlpQbmZ5SlE3?=
 =?utf-8?B?R3RzSEQrelVqTVBSTFVFS2tZYUxEWmllem52aTFTcXJQRGVNY05Zcnp5Vnl2?=
 =?utf-8?B?bnVXb29SL1BuYnVLZkdMQTBQKzdkYTcreU1uU2ora1NlcTVaWmdyY1FVYUV3?=
 =?utf-8?B?WVg0Y3NPWGh3bjVtVHc5NzdvZ0lBZDhpVUs2Z1NTSXhaREd2NStRdTk2eWk1?=
 =?utf-8?B?TnhEQ1hDbzZ4NHVULzB3Vkg0bzNhd092RXNFaExKQlZaSnJaUkhkMXlRbjJY?=
 =?utf-8?B?SGRjd05Kc08xWTcyeStRL0NNbzNMdkdGVDVOZ1Byb2RhL1l5SHcyU3UzREUv?=
 =?utf-8?B?RUpTOThUQ2Y0SkJuVHBDZGJrZkhRWGJybXBqaGFYcldyUVBwRTZhb0lxSy9S?=
 =?utf-8?B?OFZRZlNFQ0lMSzdHdzN0VDFxZkMrTUk5cUpWLzBnbG5KN2Y4UlJkRGhQRFZa?=
 =?utf-8?B?QitSQUpCeDU1bkkyNFN1RklLODVDdWtVQmJETGkyWmtVTnBsV09tRkJVbkxM?=
 =?utf-8?B?bjRtYW84S1JDYU5xOUY0dG5KL0srVWdEM3g3NWVwWDcvelhzdHFRSGNhMlNL?=
 =?utf-8?B?Z1VMaXVMUFRHbWJqdWZ0YXhkWnNUQXBPZEZWcTlRQlNISUcwRzJhaHZURHNo?=
 =?utf-8?B?R21YODNHWDlJYmhZdGFKUmxFVUZyODI3QkR6YWJqL3AveTExM1p0RXUyOG4w?=
 =?utf-8?B?TDY0N2RyYXh0WFpXb3M4eDBva01xbndJTEs2OTJjTzEwVDU4UEdhVmV4MU1T?=
 =?utf-8?Q?ElP6u2c2wdCc57F/J0aoR8iQFRs9oL3p?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB2989.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D9F6FECCAE3814D95B82B8D925B6689@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5437
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:803:4d::31];domain=VI1PR08MB2989.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a96e43b6-0dd1-4aae-74c9-08dd621a5bea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sy9Dc3hXUDVGRTFIWGdHTGRPaUNOT0M3TW04Zys5QWJuOTB6RFM1ajcxaWZm?=
 =?utf-8?B?bnZHTkMyYVFpNHpTZ1d6RG9iOWNTdmo1UnQ2VEd6K0RscVVpSWQ1UWt1bTFG?=
 =?utf-8?B?UVVqVFZBVHJ6KzVxZS9Vc3grTTRiOE53dWtnY2FSbEtmMllwL2g5UVF3MFZm?=
 =?utf-8?B?ZkdDem80MGR6V0xmZzJHWUdGbkRIajdueStvWDQxWXd2dmVXNXVVbDdOSmhI?=
 =?utf-8?B?UHUxeUM1RFF3ZkpoU1hLK2FWaU5zd2RXQzNTL3pCS3NhOXZmcTkvL09sUkt2?=
 =?utf-8?B?NWdyMWIzTE9kbW1LSDhzejRacHZzK09obit4bUIvOEZOb292UGZLUGdxQUZE?=
 =?utf-8?B?cW9QcVgraDlDTE5MMmcwd2JNRmthekFGWWtPTjU2ZHY1WHpFWmErRXBiNldz?=
 =?utf-8?B?cUp0YkhKaVRPdHhIYjl6SnFtRjh2aHlNWUExcG05T3NEYXZDY2ZUelpEcmpN?=
 =?utf-8?B?cXpCZkl5WVJuVlpXVXB5M2dub0FzM3B3ajdUcDdBb0dPbTRHQXBxWjZDckpC?=
 =?utf-8?B?eWl2K1BWSVF4K0tnMUxKbXlqZTY5cjUyV0dzQ2hSZENsc09vL3RQWHZpMHJO?=
 =?utf-8?B?bUhkT3gzdWRwMG10dXdlemtNRkhpUWZuemZ0T21oaVFjbWVyMFh4QlVsMUF5?=
 =?utf-8?B?L0RFK1BNWWpXNUtPK1VMSEluN0Z4blFFcmtOM0svQzZPbnNjZHdLNWtpQmJ4?=
 =?utf-8?B?S25YN1duMTBOWWRHMWRWWEZmVXVNeEI5Ukh5bTd5Z2VzNXlYM2RPUFhyWFFj?=
 =?utf-8?B?ZDFjb240RUp6QS9YVUJlWTZDTHZ1ZmlnQk8vVWx4VFpLdVRHdnlZbTBXZzIx?=
 =?utf-8?B?UFA0TGtkcVpCTE8vNWZ0Smk3UEhYYnhkYmZ3NlZXVFE2aUpxTTRkcGd3Q1RS?=
 =?utf-8?B?ZVM3UlNyVGdEVGtXTytINGE2bmNTQ1FWWmZLNCtNQ2NvNEhRYzdwdEJESGEz?=
 =?utf-8?B?RWg3SlhNVXQzK2RxUm13cXphTmZFUzNzSlBqVWt0RzFGeVdkcTVWWUU0TGNj?=
 =?utf-8?B?UHZCc28yVE05cXRIaERJbGR2b2RoOUlJaTVzV3lCYS9FekEwWWIxZE5wOEFJ?=
 =?utf-8?B?OFpISUVQTXdDWlBHc3NpOTJoUlhVT1lPUHYyY3VIK0hqVkhCSHJKeUZoWTl3?=
 =?utf-8?B?ZXpoaXRrYmo4UDVUeFNQK3lNM0hTZWtRelhmeVhETUxSZmNYbm1pWnB4YVNn?=
 =?utf-8?B?RjYxTHJPMS9MeW9teW4rckl3Y2NQMlpiVC9rOUV0a3YzNnROSmxQNXd6cWtr?=
 =?utf-8?B?L2NVcVQ1VWF2UWY0K2NjUnpqMHltT3BZZjF5Ti9NTUxCOEdPMkZudlNLTlhT?=
 =?utf-8?B?c3NTKy9NWWFLczAzU0tzYUc2OEdsaGxiVUZ3R0V6TnNSaGFsWWE1NmlhZDhJ?=
 =?utf-8?B?MDdPeFZaME81T3g5NitSYkR4bGpTMmFuUG1iWWY2YUtwZm5zVkdsSTZIdWVl?=
 =?utf-8?B?VFhnKzh6SXNidmQ5b0YrOXFXbVlZUVl1MUxCcUJWM3FMcGFrdnVvalg2V3JQ?=
 =?utf-8?B?OGxOOW0reUhhMjhVZXMvVGU5VTZQNlpHNGk2SmlnYzBzMjJmNFRCdTBVZExh?=
 =?utf-8?B?UStmd2U1SlR2NEdGRzJ6TmdxamJwWThGU0hpRkxCY2ZFQjNkK3BRVEFLQnJ1?=
 =?utf-8?B?dnY0eExLV1FSeDkxN1pmcnZmUnlxRFFaS1pXaG5heVZOTkNNdzA3VDBPNHlW?=
 =?utf-8?B?SDhzb1A0RHh3aEk3V2F2TXZ3UXF1OTdZZWlsRTJ5eWJJT1lEekdzZmozM2pW?=
 =?utf-8?B?eDRnSWk5Um9zV1EzNVdMSHl4Vmp0am9Sb2xCcm4xb0ZGQSsvMWxHdmFPY0ZM?=
 =?utf-8?B?VFlyd2E3YUlYUzU3MzJqS2xmSnBoakgxS2x0Lzk5L08zdUFVcnVpbkcvSHJQ?=
 =?utf-8?B?c3I0U0ZIdjhPYjgveXk5RHpWRVU3RjI2WDNJQjgyTUlEdzJqQ0FsaG9VUW5t?=
 =?utf-8?B?SGIyVHo3cHdQU21qV21DZVhJL2pCU0E5Zm85TlBXUlQzRG1BbVp5OEtRdGp1?=
 =?utf-8?B?NklWSGRSVmhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:32:45.5841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d904234f-9331-43d3-4879-08dd621a64c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8168

SGkgTWljaGFsLA0KDQo+IE9uIDEzIE1hciAyMDI1LCBhdCAxMDoxOSwgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxMi8wMy8yMDI1
IDE0OjUyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IFJlbmFtZSB0aGUgc2V0
dXBfcGFnZXRhYmxlcyBmdW5jdGlvbiB0byBzZXR1cF9tYXBwaW5ncyBpbg0KPj4gb3JkZXIgdG8g
YmUgaW1wbGVtZW50ZWQgYWxzbyBmb3IgTVBVIHN5c3RlbSB0aGF0IGRvZXMgbm90DQo+PiBoYXZl
IHBhZ2UgdGFibGVzLg0KPiANCj4gbWFwcGluZ3MgaXMgYmV0dGVyIHRoYW4gcGFnZXRhYmxlcywg
c286DQo+IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0K
PiANCj4gYnV0IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2hhdCB3aWxsIGJlIGltcGxlbWVudGF0
aW9uIG9mIHNldHVwX21hcHBpbmdzIGZvcg0KPiBNUFUuIEkgc3VwcG9zZSByZWdpb25zIHNldHVw
IHN1Y2ggdGhhdCB0aGUgZm9sbG93aW5nIGNhbGwgdG8gZWFybHlfZmR0X21hcCBjYW4NCj4gc3Vj
Y2VlZCBhbmQgZG9pbmcgdGhpcyBpbiBzZXR1cF9tbSBpcyBhbHJlYWR5IHRvbyBsYXRlPw0KDQpT
byBvbiB0aGUgTVBVIHNpZGUsIG1hcHBpbmdzIGFyZSB3ZWxsIGRlZmluZWQgaW4gSFcgYnkgcmVn
aXN0ZXJzLCBzbyB3ZSBkb27igJl0IG5lZWQgdG8NCmFsbG9jYXRlIHBhZ2V0YWJsZXMsIHNvIHNl
dHVwX21hcHBpbmdzIGluIHJlYWxpdHkgd2lsbCBvbmx5IHByZXBhcmUgb3VyIGxvZ2ljYWwgZGF0
YSBzdHJ1Y3R1cmUNCnRoYXQgdHJhY2tzIHRoZSBNUFUgcmVnaW9uIHN0YXRlIChmZXcgcmVnaW9u
cyBhcmUgYWxyZWFkeSB3cml0dGVuIGJ5IHRoZSBhc20gZWFybHkgY29kZSBhbmQNCm5lZWRzIHRv
IGJlIHRyYWNrZWQpLg0KDQplYXJseV9mZHRfbWFwIHdvbuKAmXQgdXNlIHRoaXMgbG9naWNhbCB2
aWV3IG9mIHRoZSBNUFUgKGFzIGl04oCZcyBjYWxsZWQgZWFybHkpLCBpdCB3aWxsIHVzZSBsb3cg
bGV2ZWwNCkFQSSB0byBhY2Nlc3MgdGhlIE1QVSByZWdpc3RlcnMsIGxpa2UgdGhlIGVhcmx5IGFz
bSBjb2RlIGRpZCwgYmFzaWNhbGx5IHRvIG1hcCB0aGUgRFRCLg0KDQpEb2luZyB0aGF0LCB3ZSBl
bnN1cmUgdGhhdCB0aGUgY3VycmVudCBjb2RlIGZsb3cgaW4gc3RhcnRfeGVuIGNhbiBiZSByZXVz
ZWQgYXMgaXQuDQoNCkNoZWVycywNCkx1Y2ENCg0K

