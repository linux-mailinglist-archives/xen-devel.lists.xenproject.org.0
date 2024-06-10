Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145690261C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737414.1143713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhLZ-0007mg-Fv; Mon, 10 Jun 2024 15:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737414.1143713; Mon, 10 Jun 2024 15:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhLZ-0007jy-D8; Mon, 10 Jun 2024 15:54:13 +0000
Received: by outflank-mailman (input) for mailman id 737414;
 Mon, 10 Jun 2024 15:54:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2do=NM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sGhLX-0007js-GM
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:54:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acc5592c-2741-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 17:54:09 +0200 (CEST)
Received: from AM5PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:206:14::44) by DB9PR08MB7793.eurprd08.prod.outlook.com
 (2603:10a6:10:398::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 15:53:37 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:206:14:cafe::f2) by AM5PR0301CA0031.outlook.office365.com
 (2603:10a6:206:14::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.24 via Frontend
 Transport; Mon, 10 Jun 2024 15:53:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 10 Jun 2024 15:53:37 +0000
Received: ("Tessian outbound 5a0abdb578b5:v332");
 Mon, 10 Jun 2024 15:53:36 +0000
Received: from cdbf5670d108.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A45A2202-4EC6-454D-B0A9-C2DF70337AB0.1; 
 Mon, 10 Jun 2024 15:53:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cdbf5670d108.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 10 Jun 2024 15:53:30 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VE1PR08MB5632.eurprd08.prod.outlook.com (2603:10a6:800:1b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 15:53:27 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 15:53:27 +0000
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
X-Inumbo-ID: acc5592c-2741-11ef-90a2-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bguY1naO9uxwsBxtxJPOVQRzY2ffOBAQZYfB7Pg2PRZoJUGF0WNEKtvUaK44aK6mYD/cqEi0JuMjbfKETdNfraKdXQt+ECOnlJdIiyv0xZX4cIAMd5HPBYci/pOvdRyHP5SYiMHBxUg3nO9uETvu1kqFi4RHM6ajI4ET92Q8bZ+GFU+XrFYwYVsg30bdJGVY8hFDKBjBiOKWs/YDHZHw7K+1eCZZVbxn8ne315TO5Kcr4jycBXl39oX2WKntNoC8AyRjw+Ltpx6yd1C29rnzHsQzOAIDFOpUZ8jryt7YOGZalGZJWKeS62kJSP0TZYGh6V6+pn0c6ahStBv1hragdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSWHpE7p/xuYoSd4qe9eLkhU+IRQkqKwz1qAwZKCEY4=;
 b=nxZ13340E/xLjyWUhHJQYU0fRrGhY3yzlRVdfb7xlY7eLMXaOoD+X/5uPg0KO3iIiYI8Nw/Hq4KsJOOrrxfzSWatJmt3vnfFF/SKuOMdxyyfsXppXSCX2uGeyGq2kMSWRjAhTvtHsivlua6vUSpJMt0Nuob/l52B3TaFHnlGZaODMGt6hflTV3Q43FsHI6pftLnkFXPw6XN4ZVfqZhJu1qNH5/9Rf9PdEf3BV0SqfMbK2V6ycH0xDXur/wNGqGLr+mCM5As3ydaVwj9P/njZH762GaXZPwNasxMeDI0HWlZGJ5SOmay+rbHPrV+Rczfx36b5MnUX2nM/IRulZEJR1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSWHpE7p/xuYoSd4qe9eLkhU+IRQkqKwz1qAwZKCEY4=;
 b=krSVCiLNjkeLX4GLPdx/AX4QWQNwx1ISRl+QzkHsSbqx2y17RgA0ky/r9KaVo2EzwDD0tcdPJ7ng8rTgInRoTU0RY7k2y80vmvh6UU23HuLtLxWjiyMNbQA+kFyb+YBDROWmxXnD3eJQQbpYrusBuTv7xdYFtBugIsnW3bq9+z4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d2b30a75b036435
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vk1yzlBoi9XbseqQ2qO1KlygbbLMBpJV0NHwwuQdBZyeWc7cFys4vGGcTYWu8t2/81ITrQaNwsEMcGbCmAfEqZk7z5tO1Nmr5GIVTH3SSOjklP6pV7ekpMahdNgmZXXsk2izLqJHwv7EpTJTX6uG3ZzDf0vGxlqoUPYedMkCQ0GdwOt+FHJ72P9yeWwdkcnOZlTlNeqDITTlgVYHqfkWIJznDg5P5jjCnfs3fnWzSxTTut55lbEUIIvyBHTm7+ZHX1dlALJOQwK3EJotbZQ156Rg7PMQjxBdwA6Dr7GXHf4qYCUy3CHBekZ+g35uYgXx8jPQzBzLCZ8GuGgp4OkEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSWHpE7p/xuYoSd4qe9eLkhU+IRQkqKwz1qAwZKCEY4=;
 b=lnc+B4yH6kjcHj9/sX874G9Ev1Z8tJf8Xaf60y6YuHAHkYixKGefcmlsxL27ljWDriSrsMLa6TAGZxXnaBvaO+7ecXhX2iGUZM0kKSdJ3PWtwoG+dehrdtDz2/ZLZtRYAdCb/LxoQao/7b/fzXvseIPHQrKjshjwP2EzawxG+j1ODdir3X9/H+iwXdPjMG5Aduz1/rZev+uIf6QhRMRwJUZCWV21d1O2dFBJQV1k6oLX00CaJw+0bQ6jM4KpAMwFybtwl/DCDPzv+hDBAyvuwlPzrKMIE5mcOqZlzypPV0lbjJJc4ezViJvJUyONhHrVPlSTYSjWWJA5u8bw+ZGkig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSWHpE7p/xuYoSd4qe9eLkhU+IRQkqKwz1qAwZKCEY4=;
 b=krSVCiLNjkeLX4GLPdx/AX4QWQNwx1ISRl+QzkHsSbqx2y17RgA0ky/r9KaVo2EzwDD0tcdPJ7ng8rTgInRoTU0RY7k2y80vmvh6UU23HuLtLxWjiyMNbQA+kFyb+YBDROWmxXnD3eJQQbpYrusBuTv7xdYFtBugIsnW3bq9+z4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v6 7/7] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v6 7/7] xen/arm: ffa: support notification
Thread-Index: AQHauwMDaP+bX9VAx0y24WgBW6XzArHBJpiA
Date: Mon, 10 Jun 2024 15:53:27 +0000
Message-ID: <AD483AD3-CE42-41A8-87AB-5793F6CFE16D@arm.com>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
 <20240610065343.2594943-8-jens.wiklander@linaro.org>
In-Reply-To: <20240610065343.2594943-8-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VE1PR08MB5632:EE_|AMS0EPF00000195:EE_|DB9PR08MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: f0741e98-413e-41bf-2ca6-08dc89657dae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?9PQEM/rMn7eumsqvs5ybZc1e+tAqgiVAPIp2gutuk+H3J8EkfDJC7o2rtAPj?=
 =?us-ascii?Q?CBBdWM5tVkn7Zvscrqfo+gvkQcU7fZXCF0dmHZbIY3TiGH6bswl2YKmEBAqT?=
 =?us-ascii?Q?hgOVuGxhTia5oLV2/JP6X9ITb0sxGtgqVXr96D6fR6uitfaGyvg0dF8MKPFF?=
 =?us-ascii?Q?pCz/t4WDMohrdWXxqslk7i80KS5j8qXv/vYqzgacqz0Mz9ZY9AhZe9JTiIs7?=
 =?us-ascii?Q?gX7Gt6wyZXIcMFdzDe9geK09OsVcldYltfWgWNkjvzfPiUe9Vg2qncg6OOKq?=
 =?us-ascii?Q?QfwL2c8PEcQzRlM+FeoTObAqt9H6Q4nHiME5AsnFesQmajYvXXiLlTtSGPDi?=
 =?us-ascii?Q?AN0hrlDyOVGlYi2IE024AFXguuRPWLaAFmCcJW/uQdv1pBM3y5jN9GkSDf5Q?=
 =?us-ascii?Q?rhFLqZuGMvoOpFnUk+mtKUTQppfeDIWB2xIVzmg67owBMeaasqkXZt9B4ksO?=
 =?us-ascii?Q?scIfLOxDRMs6gQ9ebrchmco+RFZ/26tSXDG1A2jlV7D2O9ZJaS+Icn2Ie1++?=
 =?us-ascii?Q?SkPeASkskRTGJKtCC2IpIy9Un7+8aL4519wH2dVSjIEQBRo+moBLSPOCEitB?=
 =?us-ascii?Q?eyB7c7q6+5b0BNFlST/SoT9iN9MAd6JLg+zU0We9l5qJQE3svuwMesiPZ/pQ?=
 =?us-ascii?Q?lDAdhMoSodxKH2MUr8M5ZXqsjtvI7N8cEU9L8+s+it9w7rENEKvV5KlrAPUg?=
 =?us-ascii?Q?FFiMmA4Yv4BIV+LQkGZlNXql9JfG8VeClLg4Q4BM4rzxwqFEJTyCisPmLpHc?=
 =?us-ascii?Q?wwYrxtvhX5H07kVRDBb/kpsMuY/rIQZl4bt+DRx4y2T37pyOuFkSd6ccG8ru?=
 =?us-ascii?Q?0Jg9CBCpgMK8HOsrS0SUqZx70Q+/TSwCX1mJzEAhlkR01RCP++Wkego14/KK?=
 =?us-ascii?Q?3KHrjIRQII06XwegpMBmxUez/LtLDnxUp/GgWmAiHmwH4YW+o/MGeLoXPEUx?=
 =?us-ascii?Q?PXuvbPiWIAAD8amCj2268ATGEu6eBOLmPJFlzSEjqPbRJyfiSm5ZcBtemaQ1?=
 =?us-ascii?Q?OYgziSm8uZJ+OJ63Fhwc00yDr/GOM5bMCPQ5CbxEFPQNkyDFndAxojg4b/vF?=
 =?us-ascii?Q?VdYIbgT3m+p9BxLz3QhHHvdNC5ooXq+tYqhKMr86Iu4JpiDkaBzNke9/fJTC?=
 =?us-ascii?Q?BU/1m3Fvb1tfItTZJPaJoad7j8Zu2BOz40oU1T2052QMDOWG1qrZrKmanbo6?=
 =?us-ascii?Q?6MZ/sWDHeVv8c0TwmyiGWzuII5aSvGt7X6Wh6WqP+hLPv4A57mjGh93UaXnC?=
 =?us-ascii?Q?b6VD4KF6yXH1dOH4tJuie7DObHzfiEXoC52pExb81FtHAiqPhC8zoW0GIMa/?=
 =?us-ascii?Q?jQzFuNsM13iVZsNsDc/Brn2JEoqlFNE6AZ1a2kcNGs8juA3dB0qd1pUwpadn?=
 =?us-ascii?Q?XAFg/fI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E483D945B42A5E44809F0B5A71EA08A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebb49d8b-3b4b-4a90-45a1-08dc896577da
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0hhTPs/lPW3Cd2hMj2GV++cMWbLYlE6usVLgcuZnsHF/KufE9CumpBph9xcu?=
 =?us-ascii?Q?kLabxi68jKcAD9pK7+ccUygT8dJYQRKo2zOh009ehOMlBRP/hIMQZh6qg+pj?=
 =?us-ascii?Q?E+Sb6sa/BFs8GonmymjqvXFSB3sscQLlbyT5hXsZHszET0Kle+L4Bo/Y5bZO?=
 =?us-ascii?Q?kYWmtFJhjTpCFs2+Xy40hmAbZjdeNAYtj4NFXMwvOBbnJqoJEyYVJHGghBHe?=
 =?us-ascii?Q?bd53vtorpTY2oWIbGggrg6fOsYUYY2IYEQsCekK6wOEJZ5NX3iima2nLrnSn?=
 =?us-ascii?Q?Yg+yaYdQ6YzUNAcZ5SZFN2R6FTch/0+hVclG+846ufCauxoz63KAOY041+9V?=
 =?us-ascii?Q?a8qla6T16tbXNCKg5Hj8utzHt/OTU/RsRnCkwYQzj4CYFChTpSost/C37VE8?=
 =?us-ascii?Q?7BxXFzFBPsAkRPweTKCSXrJzNmDutd0kVo9963Arjd+6zbkBtktwF8UvgQ/x?=
 =?us-ascii?Q?MgYI/XanW7Ge0ewurxtCBAjU1c5Tsc+ixF7sOeFWXX7W3WoADdoMgCgNbo5w?=
 =?us-ascii?Q?5BOL2mwBJCWpky0QBuPuMb1eHYEflYQRy1Phu00jp4hxqYBNoeuX3wtMOJY6?=
 =?us-ascii?Q?X2X+eC3f1dx8KTKHoTNBZwslZ6gGmOp45N8+sf/rzhunmm5QYH/vl/DT2Yer?=
 =?us-ascii?Q?E40TQzlZoHQ422rLqKgLQyt8QttvEBxuJkx/P//2/Eb7jKtQdXwlVoSryneM?=
 =?us-ascii?Q?E6OTtKDHqdOwiwzJZ/OmIGoG/bwQt7IkfKwicGkwVDRFBaU9PzonXzuuj5CP?=
 =?us-ascii?Q?Gm1X6GhwvJjBZRcKwP5ImLCpCVvVDJZTP9BwStCxdOjIB4haoPNaGpUinFOW?=
 =?us-ascii?Q?XUGjh7ucVuWaqTKlFCtf3Nm4dN53TMut5F+65HBrJSy7gdeA1UGJp0bsMS3O?=
 =?us-ascii?Q?uYHg8qzvN+6dE+gK15jUnhKnZIjFkHx5+T40PdVNsnT1ga47m0Ipu7Keh9uU?=
 =?us-ascii?Q?a9/Yqgp1WY3HLXkNwIGFbFxCEc33Z6mNlh66n+gWvpX8g9TcckBHhroYDRAJ?=
 =?us-ascii?Q?zjS4kwY27llRGJjCgmOgYgHqRIXnegogMqpkYr8j60OAWiu3tRjqhnUTOGiQ?=
 =?us-ascii?Q?sdnKb3SLn85svhe+M0WcQUXP7F7WkD263r73MhoWEEghNnAFQ57gyTLr/0Vd?=
 =?us-ascii?Q?ZGNTBbsgB6+zk8NNdDOl1TpESvuDN4Nh0zvDwhkl6pJOLBsJ+onBFR8LydT5?=
 =?us-ascii?Q?nqqajoufMCWT518YZnMvqbd6HE4N1UvU75+CXMyOwj51SdkiU1KsB7IQcrcL?=
 =?us-ascii?Q?dTbljzyeBsraze6ywgQkqT+NATWEtZ2tZH6VBwMdq+3cuNrfyL4ZxuiTVnuJ?=
 =?us-ascii?Q?OYxk+ABmku2uly2b9bUwK5i1p0/H4T9IJHFCx8zht5Xnhp91IbrqHIq9hblB?=
 =?us-ascii?Q?Xgrc/HWlYMjRQdXfvmYuNpltay3yygn8q4EmvT3i8Irrs22cnw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 15:53:37.2567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0741e98-413e-41bf-2ca6-08dc89657dae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7793

Hi Jens,

> On 10 Jun 2024, at 08:53, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Add support for FF-A notifications, currently limited to an SP (Secure
> Partition) sending an asynchronous notification to a guest.
>=20
> Guests and Xen itself are made aware of pending notifications with an
> interrupt. The interrupt handler triggers a tasklet to retrieve the
> notifications using the FF-A ABI and deliver them to their destinations.
>=20
> Update ffa_partinfo_domain_init() to return error code like
> ffa_notif_domain_init().
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks for the fixes.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


