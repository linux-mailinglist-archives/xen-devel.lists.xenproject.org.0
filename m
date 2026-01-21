Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKfrNIgecWmodQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0585B744
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 19:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210167.1522010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBg-0000dr-Ps; Wed, 21 Jan 2026 18:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210167.1522010; Wed, 21 Jan 2026 18:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vidBg-0000aH-L6; Wed, 21 Jan 2026 18:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1210167;
 Wed, 21 Jan 2026 18:44:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4jW=72=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vidBf-00083G-Pl
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 18:44:15 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 267dabec-f6f9-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 19:44:00 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAVPR03MB8945.eurprd03.prod.outlook.com (2603:10a6:102:322::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:43:54 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 18:43:54 +0000
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
X-Inumbo-ID: 267dabec-f6f9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVUJqrvO/NYDXN1+VZ5D09D6JCX46NffDGr0Mf7VAzeUI/V+Gn0JL2akZii5k8YbprPxPMAVrPfiPrk+QttNG184RtZUJWlBdTC3ZJtPVu2BwZvGNbXQJf3AlMgx5v5wIn6zvXMlXGDegsyp2aEkrClTtCKg1wERyIV6z+h3PDRYT40M3Q5pL37mPbtdyXY4Y/Fe91Er6nVSIfYVbwLgdVEOt83W3NuPNBQ0OSFwJVj8aNzsX42Ppev29tdxuZ2ALlZyKXEiM7ybXrG1/ZbkxFahzAY+sFuKoi5k3/d98DozCL1R0wKk863Qc4ppjdDttjnCjQUXpcaNmOFJSTKdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOobHsh0E9gHuvqfUlo0ZCNmxQatFISIpahpkrH2p3o=;
 b=KbfAFXNKN52oElkRhIVX44+9D+qAWbx8/orlkBszjXMshx21n/swOSYh+En9V6uoxlFbqwcXKOKWTC7GDGEAope/EopuzieNFP+PU10ARFs1J/bcKamdWl1njh+PQ3admg9WH/CGUjXYcbjht/ZTHQRNygtLqBk561sBqYSoxgw+iJaZ1NBlphU89C0gi/1UhBhccd/47qDU5oYLjv8uL2PUgV/R6y8nn2OeN1KwziklrjImZMF41vH/JS5UuOXYZC8U5W0mZOit5nEQKSc0o1E6CaV/p46cPHI9Ccd81rVB0qWUEWFxCXNGdq+VhHvu1xgixtMNuj1N9QH1wc1iZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOobHsh0E9gHuvqfUlo0ZCNmxQatFISIpahpkrH2p3o=;
 b=GFdSadp2Jb1pMNTFoGznnRa5T5gTxWrIKb+hRvVhOJpzhQAQLG5k9OiAxA0FVyi/lBGroTKQcqKuZb0p6wbrmYM6sXgau0uIrjSShj02wb0ex0eJQoQ5dTQjdo9mLaIzlk/EUyX4RRGX8wBBRT7dsUvcuGoN20US8x9EAhLHchYYpxiF1nY2ztt7nQzmpumPXH8XQtC5Q1d0ptteG8QJX/yObqI9nC3TGF58Xcyw6AxHFxt6ZpDAdulxZPTzmpffq4XX3wxQxsQG+I8KZ1WJHiEjZa6bNZevJh2r9SBqcUq2q7sFyTncrAQsGYqUabogKBpzuvczfB9fo9sA5XCatg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v8 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Topic: [PATCH v8 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
Thread-Index: AQHciwXk/uoXY0zPp0qUEySvGl6zVA==
Date: Wed, 21 Jan 2026 18:43:54 +0000
Message-ID:
 <8482f823e945060d1a36469f14f94aa6251e3f71.1769020872.git.oleksii_moisieiev@epam.com>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769020872.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAVPR03MB8945:EE_
x-ms-office365-filtering-correlation-id: e31b9f11-b8b0-42fa-b271-08de591d073a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Sk1Gb3RnV1c2eEdYV1FXUjk3blpSUUFuSVZEOGpreDdjSkhndGo2em03ZHhQ?=
 =?utf-8?B?MXZmWWp6aDJ1ZG9wenZ4djNGWnh1djc4dFBiQlI1d0FBYU9QcnFOTXlCY2RP?=
 =?utf-8?B?VXVCZkJCWDhqQi95TDhCV0QvOWNFMUo0RE9GbzhuMUxrR1U4eXo2ZDhKbjhT?=
 =?utf-8?B?QzNqVjExcGw4dDk0ZWZ5a1htU2k2SEVLYUVCc1lEeDU0QkRySnhqWDZjSXg0?=
 =?utf-8?B?MmQ3SG9YU2QybnRCT2RaU2g5WW1SWlJ1Zmswd0xLUktqa0t4RG1Rd1BvQXlM?=
 =?utf-8?B?dlF5NWRYRmlQV0hFODJSQjBrbGluclJHS2oxckNOK1k5WDVBZTZJdVh4NFV6?=
 =?utf-8?B?bkdOWUZpRXhvTk1yb2tXWisxeG1yY2dYaUt2aUxOVU1LYkEyNEdZWkZVVUJP?=
 =?utf-8?B?bjY4WEN6VHRwSjNkaEwxeTJLcC9hWnVIUTFqTHY0ZDBkWVEzUUxyVzF6N0dp?=
 =?utf-8?B?cEF4VGpEYlZBbS82MFNkY2VKVGtEeGdDWjllNkJJeUxlYms2MzRFZW9zcitj?=
 =?utf-8?B?WHhYS0plSUdTRGpuYnZLcGxrV1VXempUUkZ6cCtSTEZsOEdXSEk4R2xrR3pt?=
 =?utf-8?B?MU84UWhLQW1IUGdSYTNWZG0vU1lVYWo2c0ZxWkVnTDdpdWFLemo0UUU0b29S?=
 =?utf-8?B?dVV3ZkxiWjhYUlFPMmp6cnVZdXBKMG5wa2JDSjg1NWFPcFZUOVBsa3ZqMjRO?=
 =?utf-8?B?dFdPRlMzSHc0Y1hrc0RkN3dvaDd3WmxJVitzamxEOUtHQ0JaT0xiUzV2bk1V?=
 =?utf-8?B?ZU45NkpYUmRoYmVmSzFVT09HOXRDVHRkMW1KT29YWnhCQmswRDVVdDFPelZO?=
 =?utf-8?B?dTRReURuaGpmNVMxT2JDNElCV3Nvd0dsY1p2VzAzTXcxL1BPeXowVnNNU0Zy?=
 =?utf-8?B?Rld6QnljY0VJc3p1TWRUeFplYmJnY0JYZCtjVWhqOVA2S3l5VkVpWitmakNL?=
 =?utf-8?B?dkJQZWMxSDV2RnBiT3hmVWM4bmFtL3R5QkF0bjFzMDVoaHVKaFRJVFl1STdn?=
 =?utf-8?B?K2NWaG5SdDY1UCtFMWJkbmFVQ0QxclV3eCtoeUZFYVFZYjI2NUZMZmdKQmo0?=
 =?utf-8?B?amxiczd6dFVCZUhYaE9haEdQNnFuRURXREp4bjNTTWFCaDlEZUJ2cjJxRFBz?=
 =?utf-8?B?eFFiRG52REt3eHBVakJsQUtHQUxWL3pjRUtEV2NxWVJaRTF1ZFovVWUyL3Nx?=
 =?utf-8?B?WS9rejlHRnViQUFEUnhnbFRvZEYvcTd2eDdUMFBlai9rYWMzaDIwV0EwMGt4?=
 =?utf-8?B?cWplN0J4K1I5UG5SUjUwdUlmdUVKYVhKNzVKRHdWT0U4dVdHY3RueTkxdEJp?=
 =?utf-8?B?czQyRnovRkpVbzNLWlBJS0pGN0VUYTVCUUU5M2R0cVNZNXNrUUpCeGhnOWo0?=
 =?utf-8?B?U2Z2Nlo5QWJNVGd5QzZIRFQ0L0NHWlgzVTJXRzB0ZkZjaUNNVnBiWk13R3Fl?=
 =?utf-8?B?S3JIeTVzM2FaUktEN2xpdFRqRFFFNzh6dklscy9WdFRFWUFlVmpBVHZMQ1JX?=
 =?utf-8?B?dmJ1M3NCMVJ5MERyRnVicDYrVWo2anpaQ292VjhYTk1xMDEyYVowZndUYzhw?=
 =?utf-8?B?MDRpY3RaZ1daSUZjNGdWZktYOC9FcmhqeEM5SUZUY3U1R00yUkY4cXU3QjVm?=
 =?utf-8?B?b01SQ2d1Mk5sY0ViQzZ2dFFVTFpxbXNPend0d2p5UVFYd3dRVG0xVjZVYjlR?=
 =?utf-8?B?Y3owQm1sdm84UERKQ3k3V3g5SUViVXFQdHBPZjNMV3JmVlNpa2RIK3V4MWpk?=
 =?utf-8?B?QzRQTHZrM2w0UjdCN1Nza29SeGlIZ29tdTlER1lCcTloRHFtOUV6dVBSelAr?=
 =?utf-8?B?OFZ0bFJZTkdheEtHY3kyN3cyanFSd29OVGVRRkdCdVZBMXZHTm5YMHU3QWNH?=
 =?utf-8?B?RkRvdGNmbFJzZllsQ09KK0lEd3dna3ppb253UWZJMm9Ua0t5NkVnN2RCcm9L?=
 =?utf-8?B?N01LcUxlODRpaVFJbkhFVEZuT3hoMGF1N1lUUHZXV3JPbll3dWtpdVU2NE9l?=
 =?utf-8?B?c2ZpSU1zc0NKaGFZVllTMFQ5OEtIRTBmUy83Y29xSjdZTm5oOXh3aDdmN1Z5?=
 =?utf-8?B?SEpxSzhvLzRNVjVVM0pmTHBXNVhtQ1ZYWmZ0aVZOVzcrYWZXWDFnUnU3OUlF?=
 =?utf-8?B?RjA5TlBTREZwSVh0L1ZqQURFQllaa2NHTms5YnM5TTJLeGxSbDFjRDZMaXN3?=
 =?utf-8?Q?xXfhS7X3YkZ2yvr9PbW1Z+E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wnl5NmlZaXUwbGtmWDdPNE5CYzIzdkJ4YXV4ZDZUblpwYzRqLzlEVDlFYjZl?=
 =?utf-8?B?VkxlaTg3NFJ3OFdsWXRUa0JTZm5lazJnZ1BBdVpXTlJGYjJVY0NmaEUvazZS?=
 =?utf-8?B?VWZ6SlFURjczM1hZd0RmMUJxb2ptOFRlS2d6Z3BzRDZYdlJuMHJVUEl0clR2?=
 =?utf-8?B?d3djNk1Kc3dHZjJ5dEFmMTM3OVJYa1RnTWo1TnpMdUNscWcrVzFhUFJzYVZN?=
 =?utf-8?B?dXdkeDNhckNocFJ4UFMrOU9Ld0JXQS96bXNJRHFNYnA5VExYY0RuVG1NVDB3?=
 =?utf-8?B?TXRFZHNqSm5jd0dxaHZnc2lnc05mcCt2eXhyZmZ2QXU3U0dwZTN4NmpVY1lT?=
 =?utf-8?B?WXhnNlhtemR6ejlBS01YWUZMTDEzSWRXTitSMEluc2lSeDU4aldlTEJxZGcw?=
 =?utf-8?B?dnJ6WUtnK2RSQ3d6cEltMTJ3MXIwak0xNGhJSjJ5bFdqaW1OeHkwYlYxZkFa?=
 =?utf-8?B?Q2lmb2NpdEpFbFhlYjRHbUxRc1VtQU9DNTh3OFVsKzU1WUxPd05XbmEyNEZN?=
 =?utf-8?B?YjhtWGFPUUNKc2RCWCthNmpuVE10TVJuOTZUaEtFU1VTNmExMWpTdmZQdEZQ?=
 =?utf-8?B?ZFQ3UlBES0NsVWk3SWFNMGZEV2dLTE9CMXNKZmhtcmMxZlV5M05hQWdOTUNU?=
 =?utf-8?B?Yi9sSS9xbHgxNFhOaHlLR1Q3SHpIQ2RYbXQxWTRaa2xnc3JmeDJxWFNJVEFM?=
 =?utf-8?B?anlYOGRnVnpFdjVUeS9JZk9zRjNLNEtpK1NzeEVpV1BlNVVaZ1IvVWpHQ2ha?=
 =?utf-8?B?Znk3dmNmRENwbzIwZlk3TmYwRzZBZWM2anRUMG1ZdVIwS1N5cGRzTUcvaWZh?=
 =?utf-8?B?Y2JlTkI5eDdvT0ZHdjJyTjh5ckQwQXdic2RmU0Q2WGI5SUlWMEM0UVlaM1Zr?=
 =?utf-8?B?RTVNb1h1clpzQ2w0V05WSTd3akszWnBtZ0dFOVF3WWpXOG94bnkxdXBsTWwv?=
 =?utf-8?B?NFJUU29qQzh6ejIrb25kaWg4bTZFT3lnZVRVeE9YRkp3SUVmaDZCTW9CS2JE?=
 =?utf-8?B?dnBwN3JndzVNOS95L04yUW5GY3lvMCtqVjFTT2Z6b3I0Y0FwbzZJNDNGRW45?=
 =?utf-8?B?RDUrSk5JU09ic1Z0Y1ZoQlRRNTFFc3BZZkx5SzQ2OVl5bTVYcEJhTHkrS2lV?=
 =?utf-8?B?RytyN2FmeWJFZjR4bEREY2V2cG9hREJsWjA0WW1Eb2E4RFkwR3hLNVltTjdF?=
 =?utf-8?B?d0VQN0NBUHhUSFRFdUpGRkx6ejhWcWI3czlHR3pjRzBzcThZVG5WUUk2bE9s?=
 =?utf-8?B?ZEcvM0MvMVdZUVpPalA1dnFIZU82VHBCNHJJRlh2ZDFmcGhhMkJMSWEzWFpC?=
 =?utf-8?B?YzhNVHc1dm1qSzVGRnRqWWhjaW56T3J3ZHMvRUZRSkpZNVN5b2laUEdqWE40?=
 =?utf-8?B?NDcvTU1RL1VyZU1hN3ZJQmRLbGkwK2s0akZ0aXV6RFoyZDd1ZTVyOFBvWFNo?=
 =?utf-8?B?Z1RkQStHcTBBSzNTVGFLUjc3aUJidVBWbDhKaGJVenVhamlFWUt1QWt4RWpk?=
 =?utf-8?B?WFY0NEtyN3NpVDE2T1lMU283NFhBT25pekNZeGgxZzcvbngxSzIzVmhWNXI2?=
 =?utf-8?B?azRIWHQ4WnFFUG85YTY3SlYrY1JJczRodDJxTXRsZjM2L016Y240N29IdDY2?=
 =?utf-8?B?K3Y3Sks3OUFVeWhkd0NrU0wxTjJ0QXkxOUtzd3ptbWN5Y3RudEhzbmpNWlhD?=
 =?utf-8?B?WG84ZEJ1WEJyZmNMK1BZOGhvTTd3RnFHUVd1aHRhWEdXWjF0U2lqOU5IN1Zr?=
 =?utf-8?B?enFodEFzWmxvenh6MXB5T25GSVZaM1VmTlE5UkR2WlJESTlJQ1VwUGF0WWFm?=
 =?utf-8?B?Kysra0NzQ0JlbFpGZ3R2S3RTYkpVdlBsRWJzYVJ0SWNtTVAvSUs0MEhuaUk2?=
 =?utf-8?B?WXZEaWtKSWQwckRubXdzSEwxWm1oWFZtNjRlcHdNYkFZSkZTSUhtb0s4U0pk?=
 =?utf-8?B?WEJGWXRybGNBTDFUcEJ0azgwYWkrcWR1L2N3NlhTRU15Y2xiVFlTWm03ZGRZ?=
 =?utf-8?B?TXRVaEgvNDRWUEhCVTFNM0NBSXhUSnNUWnlTdGZKYUZRUVhPQUxqSWtIQ0hK?=
 =?utf-8?B?dkRrK2JCdEdFbmJyTXdxSXA3c2xRS0RKdzJLb3lzYzBUdjBnTUs0V0dOWDhj?=
 =?utf-8?B?NWZIZ2IyYm56bXVFb2FhUU1XcXNJYmZTT0hWUzQ3N2I4T2ZkNXVlWjN1Z2lS?=
 =?utf-8?B?U1kwam1uY0hsbjRKeStBREhyMzdaK1dTeXhLWU5WQzV5SXo3dFp0aEQrYXJt?=
 =?utf-8?B?Q3kwOE1RNnQwYlNOYktGSG5OQmtyemFyMWhGaHhFaGhVb1p1eUZnWXNCTUxH?=
 =?utf-8?B?UjBFTVd2S0UwOE1GMVJKZnJjbXJwYit3aUdIbFVFZDdWQUxDTmEwQU5lYll3?=
 =?utf-8?Q?GbE7WpNq08JTchN8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3135C440941BC145810BD9B21C77EEB6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31b9f11-b8b0-42fa-b271-08de591d073a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 18:43:54.2837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CqAEWV69xiC0Azdiw83VoPm8Vubqo/8eJS+0cLaSA+7tm6XsIQH4cCcUr9qbffTpWC3PHvtu/jMCYMfE74i/9ncmywiU8QZOgVcD6xcMSCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8945
X-Spamd-Result: default: False [-1.08 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2D0585B744
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KDQpB
ZGQgY2hhaW5lZCBoYW5kbGluZyBvZiBhc3NpZ25lZCBEVCBkZXZpY2VzIHRvIHN1cHBvcnQgYWNj
ZXNzLWNvbnRyb2xsZXINCmZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3b3JrLCBzbyBh
IERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUNCnBhc3NlZCB0byBmaXJtd2FyZSBmb3Ig
cHJvY2Vzc2luZyBhbmQgZW5hYmxpbmcgVk0gYWNjZXNzIHRvIHRoZSByZXF1ZXN0ZWQNCmRldmlj
ZSAoZm9yIGV4YW1wbGUsIGRldmljZSBwb3dlciBtYW5hZ2VtZW50IHRocm91Z2ggU0NNSSkuDQoN
ClRoZSBTQ0kgYWNjZXNzLWNvbnRyb2xsZXIgRFQgZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2FsbGVk
IGJlZm9yZSB0aGUgSU9NTVUNCnBhdGguIEl0IHJ1bnMgZm9yIGFueSBEVC1kZXNjcmliZWQgZGV2
aWNlIChwcm90ZWN0ZWQgb3Igbm90LCBhbmQgZXZlbiB3aGVuDQp0aGUgSU9NTVUgaXMgZGlzYWJs
ZWQpLiBUaGUgSU9NTVUgcGF0aCByZW1haW5zIHVuY2hhbmdlZCBmb3IgUENJIGRldmljZXM7DQpv
bmx5IHRoZSBEVCBwYXRoIGlzIHJlbGF4ZWQgdG8gcGVybWl0IG5vbi1JT01NVSBkZXZpY2VzLg0K
DQpUaGlzIGxldHMgeGwuY2ZnOiJkdGRldiIgbGlzdCBib3RoIElPTU1VLXByb3RlY3RlZCBhbmQg
bm9uLXByb3RlY3RlZCBEVA0KZGV2aWNlczoNCg0KZHRkZXYgPSBbDQogICAgIi9zb2MvdmlkZW9A
ZTZlZjAwMDAiLCA8LSBJT01NVSBwcm90ZWN0ZWQgZGV2aWNlDQogICAgIi9zb2MvaTJjQGU2NTA4
MDAwIiwgPC0gbm90IElPTU1VIHByb3RlY3RlZCBkZXZpY2UNCl0NCg0KVGhlIGNoYW5nZSBpcyBk
b25lIGluIHR3byBwYXJ0czoNCjEpIGNhbGwgc2NpX2RvX2RvbWN0bCgpIGluIGRvX2RvbWN0bCgp
IGJlZm9yZSBJT01NVSBwcm9jZXNzaW5nIGFuZA0KcHJvcGFnYXRlIGl0cyBlcnJvciBpZiBpdCBm
YWlscyB3aGlsZSB0aGUgSU9NTVUgcGF0aCBzdWNjZWVkcyAodW5oYW5kbGVkDQpjYXNlcyByZXR1
cm4gLUVOWElPIGFuZCBhcmUgaWdub3JlZCk7DQoyKSB1cGRhdGUgaW9tbXVfZG9fZHRfZG9tY3Rs
KCkgdG8gY2hlY2sgZm9yIGR0X2RldmljZV9pc19wcm90ZWN0ZWQoKSBhbmQNCm5vdCBmYWlsIGlm
IERUIGRldmljZSBpcyBub3QgcHJvdGVjdGVkIGJ5IElPTU1VLiBpb21tdV9kb19wY2lfZG9tY3Rs
DQpkb2Vzbid0IG5lZWQgdG8gYmUgdXBkYXRlZCBiZWNhdXNlIGlvbW11X2RvX2RvbWN0bCBmaXJz
dCB0cmllcw0KaW9tbXVfZG9fcGNpX2RvbWN0bCAod2hlbiBDT05GSUdfSEFTX1BDSSkgYW5kIGZh
bGxzIGJhY2sgdG8NCmlvbW11X2RvX2R0X2RvbWN0bCBvbmx5IGlmIFBDSSByZXR1cm5zIC1FTk9E
RVYuDQoNClRoZSBuZXcgZHRfZGV2aWNlX2lzX3Byb3RlY3RlZCgpIGJ5cGFzcyBpbiBpb21tdV9k
b19kdF9kb21jdGwgb25seQ0KYXBwbGllcyB0byBEVC1kZXNjcmliZWQgZGV2aWNlczsgU0NJIHBh
cmFtZXRlcnMgYXJlIGNhcnJpZWQgdmlhIERUDQpub2Rlcy4gUENJIGRldmljZXMgaGFuZGxlZCBi
eSBpb21tdV9kb19wY2lfZG9tY3RsIGRvIG5vdCBjYXJyeSBEVC9TQ0kNCm1ldGFkYXRhIGluIHRo
aXMgcGF0aCwgc28gdGhlcmUgaXMgbm8gbm90aW9uIG9mIOKAnFNDSSBwYXJhbWV0ZXJzIG9uIGEN
Cm5vbi1JT01NVS1wcm90ZWN0ZWQgUENJIGRldmljZeKAnSBmb3IgaXQgdG8gaW50ZXJwcmV0IG9y
IHRvIHNraXAuIFRoZSBQQ0kNCnBhdGggc2hvdWxkIGNvbnRpbnVlIHRvIHJlcG9ydCBlcnJvcnMg
aWYgYXNzaWdubWVudCBjYW5ub3QgYmUgcGVyZm9ybWVkDQpieSB0aGUgSU9NTVUgbGF5ZXIuIFNv
IHdlIHNob3VsZCBsZWF2ZSBpb21tdV9kb19wY2lfZG9tY3RsIHVuY2hhbmdlZDsgdGhlDQpTQ0kv
RFQtc3BlY2lmaWMgcmVsYXhhdGlvbnMgYmVsb25nIG9ubHkgaW4gdGhlIERUIHBhdGguIEFsc28g
U0NJIGhhbmRsaW5nDQpvbmx5IGV4aXN0cyB3aGVuIERUIGlzIHByZXNlbnQuDQoNClNpZ25lZC1v
ZmYtYnk6IEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NClNp
Z25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2IDxvbGVrc2lpX21vaXNpZWlldkBlcGFtLmNv
bT4NCi0tLQ0KDQpDaGFuZ2VzIGluIHY4Og0KLSBjaGVjayBmb3IgQ09ORklHX0FSTV9TQ0kgdG8g
YmUgZWJhYmxlZCBpbnN0ZWFkIG9mIENPTUZJR19BUk0gYmVmb3JlDQpjYWxsaW5nIHNjaV9kb19k
b21jdGwNCi0gcmV3b3JrIHNjaV9kb19kb21jdGwgY2FsbCB0byBhdm9pZCBleHRyYSBjaGVja3Ms
IGltcHJvdmVkIGVycm9yDQpoYW5kbGluZy4NCi0gZG8gbm90IHByb3BhZ2F0ZSByZXQxIGlmIHNj
aV9kb19kb21jdGwgcmV0dXJuZWQgcG9zaXRpdmUgcmV0DQotIHVwZGF0ZWQgY29tbWVudCBpbiBk
b21jdGwuYyBjb2RlDQoNCkNoYW5nZXMgaW4gdjc6DQotIHVwZGF0ZSBkb21jdGwgdG8gYnVpbGQg
b24gYm90aCBBcm0gYW5kIHg4NiBwbGF0Zm9ybXMNCi0gbW92ZSByZXQxIGRlY2xhcmF0aW9uIHRv
IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uIGFzIHJlcXVpcmVkIGJ5IGNvZGUNCnN0eWxlDQoNCkNo
YW5nZXMgaW4gdjY6DQotIGNoYW5nZSBpb21tdV9kb19kb21jdGwgYW5kIHNjaV9kb19kb21jdGwg
Y29tbWFuZCBvcmRlciBhbmQNCmNhbGwgc2NpX2RvX2RvbWN0bCBmaXJzdCB3aGljaCB3aWxsIHBy
b2R1Y2UgY2xlYW5lciBjb2RlIHBhdGguDQpBbHNvIGRyb3BwZWQgY2hhbmdpbmcgcmV0dXJuIGNv
ZGUgd2hlbiBpb21tdSB3YXMgZGlzYWJsZWQgaW4NCmlvbW11X2RvX2RvbWN0bC4NCg0KQ2hhbmdl
cyBpbiB2NToNCi0gcmV0dXJuIC1FSU5WQUwgaWYgbWVkaWF0b3Igd2l0aG91dCBhc3NpZ25fZHRf
ZGV2aWNlIHdhcyBwcm92aWRlZA0KLSBpbnZlcnQgcmV0dXJuIGNvZGUgY2hlY2sgZm9yIGlvbW11
X2RvX2RvbWN0bCBpbg0KWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlIGRvbWN0bCBwcm9jZXNzaW5n
IHRvIG1ha2UgY2xlYW5lciBjb2RlDQotIGNoYW5nZSAtRU5PVFNVUFAgZXJyb3IgY29kZSB0byAt
RU5YSU8gaW4gc2NpX2RvX2RvbWN0bA0KLSBoYW5kbGUgLUVOWElPIHJldHVybiBjb21kZSBvZiBp
b21tdV9kb19kb21jdGwNCi0gbGVhdmUgIWR0X2RldmljZV9pc19wcm90ZWN0ZWQgY2hlY2sgaW4g
aW9tbXVfZG9fZHRfZG9tY3RsIHRvIG1ha2UNCmNvZGUgd29yayB0aGUgc2FtZSB3YXkgaXQncyBk
b25lIGluICJoYW5kbGVfZGV2aWNlIiBjYWxsIHdoaWxlDQpjcmVhdGluZyBod2RvbShkb20wKSBh
bmQgImhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wIiBjYWxsIGZvciBkb20wbGVzcw0KY3JlYXRpb24N
Ci0gZHJvcCByZXR1cm4gY2hlY2sgZnJvbSBzY2lfYXNzaWduX2R0X2RldmljZSBjYWxsIGFzIG5v
dCBuZWVkZWQNCi0gZG8gbm90IHJldHVybiBFSU5WQUwgd2hlbiBhZGRpZ25fZHRfZGV2aWNlIGlz
IG5vdCBzZXQuIFRoYXQgaXMNCmJlY2F1c2UgdGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbCBhbmQg
bm90IGltcGxlbWVudGVkIGluIHNpbmdsZS1hZ2VudCBkcml2ZXINCg0KIHhlbi9hcmNoL2FybS9m
aXJtd2FyZS9zY2kuYyAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysN
CiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZmlybXdhcmUvc2NpLmggfCAxNCArKysrKysrKysr
DQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgIHwgMjYgKysrKysrKysr
KysrKysrKystDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYyAgIHwgIDYg
KysrKysNCiA0IGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYyBiL3hlbi9hcmNoL2Fy
bS9maXJtd2FyZS9zY2kuYw0KaW5kZXggYWE5M2NkYTdmMC4uMzFhN2U1YzI4YiAxMDA2NDQNCi0t
LSBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9zY2kuYw0KKysrIGIveGVuL2FyY2gvYXJtL2Zpcm13
YXJlL3NjaS5jDQpAQCAtMTI2LDYgKzEyNiw0MSBAQCBpbnQgc2NpX2Fzc2lnbl9kdF9kZXZpY2Uo
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYpDQogICAgIHJldHVy
biAwOw0KIH0NCiANCitpbnQgc2NpX2RvX2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3Rs
LCBzdHJ1Y3QgZG9tYWluICpkLA0KKyAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVf
UEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCit7DQorICAgIHN0cnVjdCBkdF9kZXZpY2Vf
bm9kZSAqZGV2Ow0KKyAgICBpbnQgcmV0ID0gMDsNCisNCisgICAgc3dpdGNoICggZG9tY3RsLT5j
bWQgKQ0KKyAgICB7DQorICAgIGNhc2UgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlOg0KKyAgICAg
ICAgcmV0ID0gLUVOWElPOw0KKyAgICAgICAgaWYgKCBkb21jdGwtPnUuYXNzaWduX2RldmljZS5k
ZXYgIT0gWEVOX0RPTUNUTF9ERVZfRFQgKQ0KKyAgICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAg
ICAgaWYgKCAhY3VyX21lZGlhdG9yICkNCisgICAgICAgICAgICBicmVhazsNCisNCisgICAgICAg
IGlmICggIWN1cl9tZWRpYXRvci0+YXNzaWduX2R0X2RldmljZSApDQorICAgICAgICAgICAgYnJl
YWs7DQorDQorICAgICAgICByZXQgPSBkdF9maW5kX25vZGVfYnlfZ3BhdGgoZG9tY3RsLT51LmFz
c2lnbl9kZXZpY2UudS5kdC5wYXRoLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRvbWN0bC0+dS5hc3NpZ25fZGV2aWNlLnUuZHQuc2l6ZSwgJmRldik7DQorICAgICAgICBp
ZiAoIHJldCApDQorICAgICAgICAgICAgcmV0dXJuIHJldDsNCisNCisgICAgICAgIHJldCA9IHNj
aV9hc3NpZ25fZHRfZGV2aWNlKGQsIGRldik7DQorDQorICAgICAgICBicmVhazsNCisgICAgZGVm
YXVsdDoNCisgICAgICAgIC8qIGRvIG5vdCBmYWlsIGhlcmUgYXMgY2FsbCBpcyBjaGFpbmVkIHdp
dGggaW9tbXUgaGFuZGxpbmcgKi8NCisgICAgICAgIGJyZWFrOw0KKyAgICB9DQorDQorICAgIHJl
dHVybiByZXQ7DQorfQ0KKw0KIHN0YXRpYyBpbnQgX19pbml0IHNjaV9pbml0KHZvaWQpDQogew0K
ICAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wOw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9maXJtd2FyZS9zY2kuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9m
aXJtd2FyZS9zY2kuaA0KaW5kZXggMzUwMDIxNmJjMi4uYTJkMzE0ZTYyNyAxMDA2NDQNCi0tLSBh
L3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXJtd2FyZS9zY2kuaA0KKysrIGIveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2Zpcm13YXJlL3NjaS5oDQpAQCAtMTQ2LDYgKzE0NiwxNCBAQCBpbnQg
c2NpX2R0X2ZpbmFsaXplKHN0cnVjdCBkb21haW4gKmQsIHZvaWQgKmZkdCk7DQogICogY29udHJv
bCIgZnVuY3Rpb25hbGl0eS4NCiAgKi8NCiBpbnQgc2NpX2Fzc2lnbl9kdF9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYpOw0KKw0KKy8qDQorICogU0NJ
IGRvbWN0bCBoYW5kbGVyDQorICoNCisgKiBPbmx5IFhFTl9ET01DVExfYXNzaWduX2RldmljZSBp
cyBoYW5kbGVkIGZvciBub3cuDQorICovDQoraW50IHNjaV9kb19kb21jdGwoc3RydWN0IHhlbl9k
b21jdGwgKmRvbWN0bCwgc3RydWN0IGRvbWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpOw0KICNlbHNlDQogDQog
c3RhdGljIGlubGluZSBib29sIHNjaV9kb21haW5faXNfZW5hYmxlZChzdHJ1Y3QgZG9tYWluICpk
KQ0KQEAgLTE5NSw2ICsyMDMsMTIgQEAgc3RhdGljIGlubGluZSBpbnQgc2NpX2Fzc2lnbl9kdF9k
ZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwNCiAgICAgcmV0dXJuIDA7DQogfQ0KIA0KK3N0YXRpYyBp
bmxpbmUgaW50IHNjaV9kb19kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0
IGRvbWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCit7DQorICAgIHJldHVybiAwOw0K
K30NCisNCiAjZW5kaWYgLyogQ09ORklHX0FSTV9TQ0kgKi8NCiANCiAjZW5kaWYgLyogX19BU01f
QVJNX1NDSV9IICovDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9jb21t
b24vZG9tY3RsLmMNCmluZGV4IDI5YTc3MjZkMzIuLmNkODdjMTVmZTYgMTAwNjQ0DQotLS0gYS94
ZW4vY29tbW9uL2RvbWN0bC5jDQorKysgYi94ZW4vY29tbW9uL2RvbWN0bC5jDQpAQCAtMjksNiAr
MjksOSBAQA0KICNpbmNsdWRlIDx4ZW4veHZtYWxsb2MuaD4NCiANCiAjaW5jbHVkZSA8YXNtL2N1
cnJlbnQuaD4NCisjaWZkZWYgQ09ORklHX0FSTQ0KKyNpbmNsdWRlIDxhc20vZmlybXdhcmUvc2Np
Lmg+DQorI2VuZGlmDQogI2luY2x1ZGUgPGFzbS9pcnEuaD4NCiAjaW5jbHVkZSA8YXNtL3BhZ2Uu
aD4NCiAjaW5jbHVkZSA8YXNtL3AybS5oPg0KQEAgLTI3NCw3ICsyNzcsNyBAQCBzdGF0aWMgYm9v
bCBpc19zdGFibGVfZG9tY3RsKHVpbnQzMl90IGNtZCkNCiANCiBsb25nIGRvX2RvbWN0bChYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQogew0KLSAgICBsb25n
IHJldCA9IDA7DQorICAgIGxvbmcgcmV0ID0gMCwgcmV0MSA9IDA7DQogICAgIGJvb2wgY29weWJh
Y2sgPSBmYWxzZTsNCiAgICAgc3RydWN0IHhlbl9kb21jdGwgY3Vyb3AsICpvcCA9ICZjdXJvcDsN
CiAgICAgc3RydWN0IGRvbWFpbiAqZDsNCkBAIC04MzMsNyArODM2LDI4IEBAIGxvbmcgZG9fZG9t
Y3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCiAgICAg
Y2FzZSBYRU5fRE9NQ1RMX3Rlc3RfYXNzaWduX2RldmljZToNCiAgICAgY2FzZSBYRU5fRE9NQ1RM
X2RlYXNzaWduX2RldmljZToNCiAgICAgY2FzZSBYRU5fRE9NQ1RMX2dldF9kZXZpY2VfZ3JvdXA6
DQorICAgICAgICAvKg0KKyAgICAgICAgICogQ2hhaW4gU0NJIERUIGhhbmRsaW5nIGFoZWFkIG9m
IHRoZSBJT01NVSBwYXRoIHNvIGFuIFNDSSBtZWRpYXRvcg0KKyAgICAgICAgICogY2FuIGF1dGhv
cmlzZSBhY2Nlc3MtY29udHJvbGxlZCBEVCBkZXZpY2VzLiBVbmhhbmRsZWQgY2FzZXMgcmVwb3J0
DQorICAgICAgICAgKiAtRU5YSU8sIHdoaWNoIGlzIGlnbm9yZWQuDQorICAgICAgICAgKi8NCisg
ICAgICAgIHJldDEgPSAtRU5YSU87DQorICAgICNpZiBJU19FTkFCTEVEKENPTkZJR19BUk1fU0NJ
KQ0KKyAgICAgICAgcmV0MSA9IHNjaV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3RsKTsNCisgICAg
I2VuZGlmDQorDQogICAgICAgICByZXQgPSBpb21tdV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3Rs
KTsNCisgICAgICAgIGlmICggcmV0IDwgMCApDQorICAgICAgICAgICAgcmV0dXJuIHJldDsNCisN
CisgICAgICAgIC8qDQorICAgICAgICAgKiBJZiBJT01NVSBwcm9jZXNzaW5nIHdhcyBzdWNjZXNz
ZnVsLCBjaGVjayBmb3IgU0NJIHByb2Nlc3NpbmcgcmV0dXJuDQorICAgICAgICAgKiBjb2RlIGFu
ZCBpZiBpdCBmYWlsZWQgdGhlbiBvdmVyd3JpdGUgdGhlIHJldHVybiBjb2RlIHRvIHByb3BhZ2F0
ZQ0KKyAgICAgICAgICogU0NJIGZhaWx1cmUgYmFjayB0byBjYWxsZXIuDQorICAgICAgICAgKi8N
CisgICAgICAgIGlmICggcmV0MSAhPSAtRU5YSU8gJiYgcmV0MSA8IDAgKQ0KKyAgICAgICAgICAg
IHJldCA9IHJldDE7DQorDQogICAgICAgICBicmVhazsNCiANCiAgICAgY2FzZSBYRU5fRE9NQ1RM
X2dldF9wYWdpbmdfbWVtcG9vbF9zaXplOg0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2RldmljZV90cmVlLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJl
ZS5jDQppbmRleCBmNTg1MGEyNjA3Li4yOWE0NGRjNzczIDEwMDY0NA0KLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvZGV2aWNlX3RyZWUuYw0KQEAgLTM3OSw2ICszNzksMTIgQEAgaW50IGlvbW11X2RvX2R0X2Rv
bWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLA0KICAgICAg
ICAgICAgIGJyZWFrOw0KICAgICAgICAgfQ0KIA0KKyAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lz
X3Byb3RlY3RlZChkZXYpICkNCisgICAgICAgIHsNCisgICAgICAgICAgICByZXQgPSAwOw0KKyAg
ICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgfQ0KKw0KICAgICAgICAgcmV0ID0gaW9tbXVfYXNz
aWduX2R0X2RldmljZShkLCBkZXYpOw0KIA0KICAgICAgICAgaWYgKCByZXQgKQ0KLS0gDQoyLjM0
LjENCg==

