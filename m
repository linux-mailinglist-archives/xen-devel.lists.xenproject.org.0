Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C882C9A6F5F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 18:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823833.1237906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vDN-0004o0-3g; Mon, 21 Oct 2024 16:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823833.1237906; Mon, 21 Oct 2024 16:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vDN-0004lY-0w; Mon, 21 Oct 2024 16:25:05 +0000
Received: by outflank-mailman (input) for mailman id 823833;
 Mon, 21 Oct 2024 16:25:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lolC=RR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t2vDL-0004lS-Ee
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 16:25:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f403:260d::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 033fc663-8fc9-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 18:24:58 +0200 (CEST)
Received: from DU2PR04CA0346.eurprd04.prod.outlook.com (2603:10a6:10:2b4::33)
 by AS8PR08MB8923.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:24:57 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::33) by DU2PR04CA0346.outlook.office365.com
 (2603:10a6:10:2b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 16:24:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Mon, 21 Oct 2024 16:24:56 +0000
Received: ("Tessian outbound 40ef283ec771:v473");
 Mon, 21 Oct 2024 16:24:55 +0000
Received: from L8cf413ebdb2e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72B8D149-FA91-426A-990B-E0399C9A4BED.1; 
 Mon, 21 Oct 2024 16:24:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L8cf413ebdb2e.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2024 16:24:45 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS2PR08MB8806.eurprd08.prod.outlook.com (2603:10a6:20b:5f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:24:41 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 16:24:41 +0000
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
X-Inumbo-ID: 033fc663-8fc9-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PjwwPgKG2+WnRLoZNtQiEx4v4VhNllxsSy/73F9snJfyVnzo8vMnjSmRmCuqa3s7Vs33HaeS1h19gvBJx1gxObxqe1hig41rQPl5insmV3NHLpyJRfBmbjBveXssQKDlU0CZhQ5qkAe4bwlF6nD2HSJMQ8WHO8dRPplyUbUoztknIQTCNeeAZm+c4udbNzz0j9Mbu7wjysj4p9O39cntD8TsWksvYCQ7dEdN4d3k1Ge2uPkIupQJwPRr0yX5OouveZyfQvOkTa2Wi0or2BtWWBwFg4IwzQZaJOKmXMuKotM4Da5FCTR1UWrvivh56fZy7lAMQoImm8miKyaQSeRS+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDnD/43S0t9dyaAndg3CRk1IIb+YgmQLM873xTrWWZ8=;
 b=bcZaUhFCUtBYDcF9VX75qrKzEDetel3q4sJkR+1/49zZ/M2JC6L4VtlrDg3U3uw6SlbXOSy7NU/M7zCtk8h2XURY5YxELGmItuGaQddxIWT/DEbvOFY4Omp7uy2AROhImvVdxkapRBv4EU0VaGBMs90BRCXp5l0urOIwm7r99aCDxx/O8G3+7Pn9xLgUdAHMWa2GH5acXlYfDZbJ2H9i9hTZdc1VCzsc6jZYvbGr0kYc/kvhFmAvx4WXs44+PxwYYHpL58VwKO1hz/nvthvE2Dr6G8wqmZmt3kSOk7Lnhp2p3T/j6qeLTJHZou0xQptBmX8OSZcmlrCpsI/10Jfdmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDnD/43S0t9dyaAndg3CRk1IIb+YgmQLM873xTrWWZ8=;
 b=BGg8Oml8c6wP4FFlMjFaX/QO7jGc6QHJg2EB3td9+BP7NHWYjTEGT7vacqgQCkrJFdzAu4ovB/Ilua2riLZAjcro8yHzFc1/jALRimbsgjLhIunoc/kXzincn26E2zPQFInzYJA1mV+f/8/1F7iKeNVY6iOhOZEHmRhcIJL30S0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20094811b254a8d2
X-TessianGatewayMetadata: P6A2Z1o3jp6qui2tJHXAUZCxukUWYOrDM42jDXNR38PQcWwByZQNlJy7xRF2GSd5xdbaROlqBXHHxW8lTLLhksOa4E+kytLL5Kv4eUalktH1xUwyLs661Y/TQKQCbg1DwsLcHya1qF2Ld4yQ/aAR9FGfiTTtohLIFacGBjb3UBE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqPt8sio7Rk7GYcf4/Q1VY6PBX4dasBO8wwPjTYDWwzmiUn4sRTOGmaUAivYNpqXZxiZ8wbdOeW4aatLi8kT13wmrJORYn3FK3wQcI5jznhQUJJuvmopYBOaEzRg5ykmAgIwAzD1tiufXK2YqzyNV9FL3Mk8WOVSMrPJ0y6E8moyVMEI7FP2RDioRbzrLkEf0VK3lC0LLx4nw/CMz8hDb4ojP2BDNpK1K/LpM0RRmSpEn/gjwDv68LlArB6Lb4l0F6SiEKgIEHmFU/6ZdgrCC5hDMN2wnWYXWgyhW/j1++xvppeyLRd8u55EoUx/0c6bW2KJ0HxXCtbDrgYlgzPrbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDnD/43S0t9dyaAndg3CRk1IIb+YgmQLM873xTrWWZ8=;
 b=NVhwCwU72KivbitDcWoZHpHGyYQGWlsKYJ1BbnjTkqc9YYWxNtH3lXkgFUQswGTqTeK2WioNSwGt22vcy6Kckkgvl8SaQ9hGRTxMlth6t6aGl36oEm5a0oZIWm1YuWt+bNltuG//wrn/Lf51uAskDpIgf81dnCUmkAQIW6AX6eYLZS3HCgP9HXeZEjr+2+pcuxCBoYEfCNM9gix5I/4wpcqnICkV0jKMdBeA6wnF/2fv7mOgGqMMI3PCbRR3fPGBPigBKZeMln6irVoTtA/MVVKS3jPfxFLnhHumTfm75KMbbTrnaBR1mQTChuOQcSiCrfae9XNND4aBleSlXwwTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDnD/43S0t9dyaAndg3CRk1IIb+YgmQLM873xTrWWZ8=;
 b=BGg8Oml8c6wP4FFlMjFaX/QO7jGc6QHJg2EB3td9+BP7NHWYjTEGT7vacqgQCkrJFdzAu4ovB/Ilua2riLZAjcro8yHzFc1/jALRimbsgjLhIunoc/kXzincn26E2zPQFInzYJA1mV+f/8/1F7iKeNVY6iOhOZEHmRhcIJL30S0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Topic: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Index: AQHbGx2Ge9N55hTx/U2iD9lYiTVQprKNIysAgARC6gCAAA8agA==
Date: Mon, 21 Oct 2024 16:24:41 +0000
Message-ID: <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
In-Reply-To: <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS2PR08MB8806:EE_|DB5PEPF00014B90:EE_|AS8PR08MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: e383b9c0-3a89-4cb5-ed54-08dcf1ece67f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?A02jDODr8K4fiPIojShK4mhsovbn7DPKchGPRZgQRMbGcN+yNNY+5vmkNBq8?=
 =?us-ascii?Q?Y48WmosfhKQYaCxbcfpxG2H139Q2ZkbvIv0I9BAQ4juLsAQVh0niJOhwq8LC?=
 =?us-ascii?Q?VdqrLH7Jv6y9MJYm9BeG2L8x0D27V1LxBg/GeKScNhSeBBqZhuL/G+L1dmmI?=
 =?us-ascii?Q?ACG94WOtO2Vm2X0Y9h/U74snppAdsHZmIOJGSGkuLqr6URADsmOYpTmApUzz?=
 =?us-ascii?Q?FGQTc909wiXzQrAQKL7EEtK6P7auIVyf5rYVV4Mwx8ixlPEZo1YIPhEEBQbx?=
 =?us-ascii?Q?K8m2992+5sJOaaTbu+4OD2c3F/eWirSsmlQImgL5J0OAis8jaTwYZwygzlPF?=
 =?us-ascii?Q?T6NEk5fH6EF7SqvkvkkMuNDa5lMFWZ7XcO/8d3k94UaEJqLLRY7NSXO6XCEc?=
 =?us-ascii?Q?6/eu/c17NatmoymoGehs8r3oAreELc+jzhTSwppyNRgG7t6tZuq9dZC42EQr?=
 =?us-ascii?Q?m3QLyX48Au/XNRaNzc7B2HhnunWS3LyFmbnxnjs60fNKt7NHcWbreg5cNMKF?=
 =?us-ascii?Q?PdVLkj177aiwozM3WHZhbno+OrpYRd6cTKacMvkG/nNwO0Gi3lGMJyIsILFF?=
 =?us-ascii?Q?LulhCu5U2TJAr7YavsUZjTp+ecxfOz0z84SmgU6jav5rMBlx4l8MPaDgfqwO?=
 =?us-ascii?Q?nQh6IZ+jvg1+Z3Bc9bqOOaMDM8jXqlO67tLYaLbQDCI1t7sfcI/Wo9P2KTf4?=
 =?us-ascii?Q?yt8jH89qro37af0+uGIyZgPI0ilcZPZ2qoyevXdJDFfGmUsPbnrFmq6PCq7D?=
 =?us-ascii?Q?0wHUSSCRQ/3htTU+OzMscdpFlH09RCw/HHOMnnXFkhF0nS1JF/GUCzxmIkjY?=
 =?us-ascii?Q?57/tY8MLH1z2nOQZpt6tXAf9aca4Z3w5Mxy5mR1ODohMy4hWKQoRTVSU91nK?=
 =?us-ascii?Q?En70hkfQva2xeyZK65gXE9HfsMy5c/iBYfyToacTe2EvcEBgF0lIq4/Eos4i?=
 =?us-ascii?Q?hwip+gAnxkg2YjMegAUy0nofWEG/YpD2dXBHw4LMDVlb3ZHFkC3sCc4xGTEU?=
 =?us-ascii?Q?IX0zIjbMprBpgW6CqQEpIJw/6xJ8Sx8srvNB5uiUnLVIY666Z62WvTTS3TaQ?=
 =?us-ascii?Q?CXnejNwmCjcvmtXtxvasYfSC1Q6t+941q6CH8e4meu+ZRCe87yWKl+L8+dhR?=
 =?us-ascii?Q?LMIzSlrfQ6NnqejkY4PttwcwC9A+3wz6wse5WVYqANny8Og8g86zjk/6jylU?=
 =?us-ascii?Q?3WK8TDi2k8aqueBw3qneAhuRAxzOib4l4p13+utGqiCiHyzd3G038s0wGfkL?=
 =?us-ascii?Q?1oPDfq44M6RjpgN1ryK9oqlrYCa2Nus96vCpVCJDOkNuQuZuVWCSURgH+zOp?=
 =?us-ascii?Q?PozF9V5UEn1VvNO18A4elz35vYEvkMFOEXGt0uwnoKSXFTAMCFkC9f3Bfv1D?=
 =?us-ascii?Q?D79OrSofhwThW4ccOiMRvie0Xpi5?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AF8BF2327E8CC247BBD181DACD756110@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8806
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6ae8ace-788a-4c05-3645-08dcf1ecddfa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FGJt/acHTtLLxOQ1r8fySAPfoMGHJP/eFIjmrauuJHwKMURCAyJObbm0W38T?=
 =?us-ascii?Q?YdhDZj3V7WbnwMMGY3KY5YwjTVPsVsoc4ARK98Rkh8ElA/4nXWK32vc4rgN9?=
 =?us-ascii?Q?UprNeUpNd0dVDVmJk5RBcVBOUdS1oDcbwOopTbzJRMHdTTYc0KBHCHhtLR8o?=
 =?us-ascii?Q?xM6Z8VN4J94DdN7q+I4kq43J83f3iV3vpp4FeBQ0/yEPTsx2bQNBPfbXelL+?=
 =?us-ascii?Q?9QR7RBtJdjKhZSew43OkYXevVE1mZi8o/BlLUnhpkQBnm6KgszJXDhLPGzjJ?=
 =?us-ascii?Q?jTzwzJm25Fs7IZ9s8r79CNReD5OE78Ks/Gsf5mLcfiiXRRhx6rzTseBE6gHY?=
 =?us-ascii?Q?qhqL+FubzrOc5kDHQhDvj7BgwOtSTT28neR0bv8yb3ID2isQDd4DE3M2V0zd?=
 =?us-ascii?Q?gOBrMKuV4zMsdincm4uysSp8RVSqiAJJAuO0lr52TS+LnOzglqK+pkaOO/Q5?=
 =?us-ascii?Q?3GtnTiHWbtZIhnZBec5FVBHoGVV5HM/kRqyefWDe4BwtvmCuUvGSkLY2S1ve?=
 =?us-ascii?Q?hTIeQhitRyBIqXW1UGYsQGNaG0oAIDlN1yGgyhxbV97hM2pLntvkD6qNEEE8?=
 =?us-ascii?Q?Z29C5kwpyuXTB2kFR05wt4B6sQZJ6d/Zg/qQ3IOu9CQZ1eefaFbntmD9gu2Z?=
 =?us-ascii?Q?eKK0epbR0ch9tVrSYAzqpb5PtGBbBV5FEUoSDvQJNwyZVFrTeBT2ZfJSumDo?=
 =?us-ascii?Q?jDiDwEKG9BsiGow0BXH+R3XQigIpZwQeL6zuT9GMQol5jlPpo/fJVo9niQNB?=
 =?us-ascii?Q?wU8SLfFdM/QzBx12ifZGgHjAlO91m1IWS8rvXVaHJrpRodlhLI9N6Za+qzRY?=
 =?us-ascii?Q?FDUX7EQMNTSLac3VtRFhxrrzQ1b5az93PjrYeRQwsfq7OfNhjefFHgBCjNyy?=
 =?us-ascii?Q?+lEuhv7f5+i9eqM1WfB8eYu0KycVTH0jMdZXlqt9a2xj6q4GL/P6XRku0i4+?=
 =?us-ascii?Q?iw4GvNtSrTRLI3jrnR+EWll2fPaX4kVAjwJtRjTLIHfkEg80bJO3M7ddbylv?=
 =?us-ascii?Q?vi3HZaalwHTCi6EOXrC+o9DeuvHchb+FAEWd4xSvLO4Ntupr296SqGaGBn8L?=
 =?us-ascii?Q?ruAzM5BEmWTqdofMd08h+/D3RYa2jah00BrgBMfi3qDBr9R+UjbkEw+7Qgvt?=
 =?us-ascii?Q?fyxsUcvYM7kh8udvQVbTcUmddWcifwTpS3gze+mJR28Zj9y6hjpfZA/FD9hv?=
 =?us-ascii?Q?Bv1rW0yzyh+smT+zew1A1x/jEonmmLx8cEuDfkvuvbVKfrs3l06aLRN3Ebqy?=
 =?us-ascii?Q?QbzKXV0XfjlLZCuYLbC5CJdmuyOvkgiPSe0a+bDbZxwjlNUEd0BiuvMKZRI0?=
 =?us-ascii?Q?IziZ3jOpXmjlIM9J9mDIbkZ1inUkr97G/2va7Y6Vc1DUQkxxO9lbUcaIjW27?=
 =?us-ascii?Q?tFjXP2b9UlhfmJQatF6Uv2Uz6pswVuOseBHepVbceFYVlKsjyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:24:56.1487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e383b9c0-3a89-4cb5-ed54-08dcf1ece67f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8923

Hi Ayan,

>>> + */
>>> +FUNC_LOCAL(enable_mpu)
>>> +    mrs   x0, SCTLR_EL2
>>> +    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>=20
>> NIT: Can't we have a single "orr" instruction to set all the flags?
> Yes, I will change this.
>>=20
>>> +    dsb   sy
>>=20
>> I still question this use of "dsb sy"...
>=20
> Actually I kept this to ensure that all outstanding memory access are com=
pleted before MPU is enabled.
>=20
> However, prepare_xen_region() is invoked before this and it has a 'dsb sy=
' at the end.
>=20
> So we can drop this barrier.

I suggest to keep the barrier here and drop the one in prepare_xen_region i=
nstead,
have a look in my branch: https://gitlab.com/xen-project/xen/-/merge_reques=
ts/7/diffs?commit_id=3Df42a2816f9bd95f2f6957887be910cb9acd140b5

During my testing I was having trouble without this barrier.

Cheers,
Luca


