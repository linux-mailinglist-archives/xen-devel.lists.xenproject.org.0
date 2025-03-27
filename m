Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54AA72B9A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928677.1331353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txijn-0006Hx-A2; Thu, 27 Mar 2025 08:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928677.1331353; Thu, 27 Mar 2025 08:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txijn-0006Fy-6c; Thu, 27 Mar 2025 08:37:19 +0000
Received: by outflank-mailman (input) for mailman id 928677;
 Thu, 27 Mar 2025 08:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yWE1=WO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1txijl-0006Fq-8I
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:37:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2613::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af4a6f75-0ae6-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 09:37:15 +0100 (CET)
Received: from AS4P189CA0068.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::23)
 by VI1PR08MB10076.eurprd08.prod.outlook.com (2603:10a6:800:1bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:37:11 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::97) by AS4P189CA0068.outlook.office365.com
 (2603:10a6:20b:659::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 08:37:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:37:10 +0000
Received: ("Tessian outbound d933a9851b56:v604");
 Thu, 27 Mar 2025 08:37:09 +0000
Received: from L80ddd225d425.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A22862E3-4892-4495-8738-FC8A1918B29A.1; 
 Thu, 27 Mar 2025 08:37:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L80ddd225d425.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Mar 2025 08:37:04 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9975.eurprd08.prod.outlook.com (2603:10a6:20b:62c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:37:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:37:01 +0000
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
X-Inumbo-ID: af4a6f75-0ae6-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pLl/m+/vETEnEtI3Y1nXgSKEdNve8eHeay7y9OMqfNZQWtL3IgLmdIrw2D0c1DPgGwLASBTFUwU9tzcmMyILIY8AXZ+wCftVpE0ORdznI3ogss2Slj64vXpcaps4Xs7U0snE7GL80x7vFEqo25E7uOOpiIjfu0ATtiwRlTXOQbIx7njA5pCiTbvPw3n8JTjD4O7wWvqXrcHA/AlDsyJdOtwSF+/0A5a6/1uVytgy3Uvc6SJ0cV21vNbh8Wyhv50qU2yBGtrdWoYtGHNSztAGZvhVvn/xJbi/vvqGgpcA5NyjN+TfUmslduYQmEqTXGCoGIF7K2VmN7THSFpn7LgBkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmkhyCtEOEhLBaybFLIZ4HYsv7SNKTd41UY4xdvR9Jg=;
 b=pFIxAkJu+0EeN3AFNWO+10kuXYlQ/wugh7m8WBxOain80dIM8LtikNHwjYtk6HyC78GwcvplHQ7+2TCr8iSc859GODsvYKsBJu2CM5lhKZmKFDZtc0disk0paqtf9JxxmGrWC7NlyNPL5720Du+C6T0eeQpDHvV933o99c9Z4AkC3x1nBbZTFzjsmI69KIRUV0mO65RAjrUljrZZBP4kW9nrXtzeecdKwDIGLCtrdZIVJvYvELVa+w5OJTqEXsGlseTAe0I1EObJuZl40Tcoh1kdXqhi7t1OHAawdyqV5SRm7wqib8ksktCWUrPc/N7XJbVWWNDXNVsoBAmMg34nJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmkhyCtEOEhLBaybFLIZ4HYsv7SNKTd41UY4xdvR9Jg=;
 b=fLwdcxYmqp3qDi3IEm5Pmojc8NptgBLaj4e3vzJCyZtwkekt0hkj/KRQTCbdFzVHq9HCYSoL/OMXAJ4Qcy30JHvR3yZgUTemEXxWVKjAwxwdsijjwOsOkbn6/3/GlqCPvxYXW2jC3L9GFbDLw4FOMPRQJAqwEih4r5AC5OpB6s4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9dd22a9587c78bdf
X-TessianGatewayMetadata: t8VbQh+CzfATGhViFjBASE53oaIa6n/gdVVnFNBt7/Hc2LmwFGxKGAT37g6iHlQzB9Qf57KBif/9Ni3dTmQykwbf8Mx7PrUkoy13abgbeezMAdU7VTN8pUe7enuDKRZ3AgKtxG+1hGXzgFVRLnuYtR4Nevhgv/PXg2o/2Cv6nuw=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDLJjxnj8zptLmZ8T+tmmgBrLlm1xxNhiETScdf+G821hiL5NcoeH0K6giFVnXUrKMt2FoiIX2HXP8cCZN5nur25M81eGdh2h4K8cWOHHgrhq1srq8HjQrJlJTMmLNiyQDMik0qUkssFh2xE018MEKD6Jysor6yPdHoC4SNkOca6updsfv5vPDRbYyKyqMt+SjSuA0LiGy+Y7JiLqd+s+PoHeUWadrSMcJ7YYWjvudb+9Oa29fIEEZMjb7kReUHBryzgtm6NxpBiSJPja4QZv1h5GOisLjU4Rdgg5qWroCFW3qV4bXaPXsYX1J+Nv6TxVz/05x3+8VZMoWubi/72oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmkhyCtEOEhLBaybFLIZ4HYsv7SNKTd41UY4xdvR9Jg=;
 b=kdI0HDUdkg8fHmPdWClVJE7Glx0CMhTKnDqrwoiMPAxmKgjfwKfypuJx2WHbDoPPmFdrc21fxb9gAinpRcDbxWwPLKrAkFI1/RuezXWYPqE3zVJAO1Zr7YnKjnsZ/KwnZRcMOqaFCxu6fnMtats8oHu47AKr/mnvLvFYfwTjz7DhT7ZpU4YlHrmXbA4Y6pY4RQaWV17U6QviiWJFP5yWvA2TGAp3Lvv9TO2ZSz/jS7m0RVpI6fVn0DacOaK2VPLEed1KCJhOw7zqBn3nWdf8SCK44pdUxbgOip40I8bhtyE5RfAm6W7NKR8IBMW2SG0mYqthz8QnApZBnJ3jq7DJaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmkhyCtEOEhLBaybFLIZ4HYsv7SNKTd41UY4xdvR9Jg=;
 b=fLwdcxYmqp3qDi3IEm5Pmojc8NptgBLaj4e3vzJCyZtwkekt0hkj/KRQTCbdFzVHq9HCYSoL/OMXAJ4Qcy30JHvR3yZgUTemEXxWVKjAwxwdsijjwOsOkbn6/3/GlqCPvxYXW2jC3L9GFbDLw4FOMPRQJAqwEih4r5AC5OpB6s4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Topic: [PATCH v4 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Index: AQHbnMQpJ/OSxu9MyEmYd5oQRaZ927OGF78AgACVfQA=
Date: Thu, 27 Mar 2025 08:37:01 +0000
Message-ID: <8742853A-E32D-4BA5-AA4D-C69A2FCAEE85@arm.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <0f5cf498c3c511ed192e8b7b7d0f4987e00e5c0d.1742824138.git.bertrand.marquis@arm.com>
 <6727ece4-d589-4ab4-9172-07dd6a7f2b44@xen.org>
In-Reply-To: <6727ece4-d589-4ab4-9172-07dd6a7f2b44@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9975:EE_|AMS0EPF000001AE:EE_|VI1PR08MB10076:EE_
X-MS-Office365-Filtering-Correlation-Id: adcfeac2-e8c6-46ae-ec4d-08dd6d0a90ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?HAnEJwrqdRmN/gP84qJLuidvhaKbQ7jFDhZSFsgioaXPUKy1KqSGlvp7TalY?=
 =?us-ascii?Q?tqY1IF1G4nsvnizlKroaNINiMnxwg86hLNXMzMlPca6HrXuj/er86NIurlrp?=
 =?us-ascii?Q?5mQNaCOHcw3TMf+jQlWN+sumpjb27jcUd8+oiF2G1iuXwEipU9pGGSSbKxzO?=
 =?us-ascii?Q?XK1iYR2/McoVslWV0Kf/OG8ZzRuWNP6+JoE1WxMv9NuCCL3z82b0Xfyd9LV5?=
 =?us-ascii?Q?j80CHeXgkUi7C+Ry7BPMTo3XW9brX8BaDtuuqpqg4VNLusvB09DbEmCHKg7x?=
 =?us-ascii?Q?UFrEze9WJsL+kMu6QZk3XGKogQchZe3ChSVXBw1h4L1Bd51IFJtSqrX0JsTm?=
 =?us-ascii?Q?tSIfxtwsQ/eOS7LBln8wtdru9yMmApEVY+bnEjxr47Hgd2jJ6uxbW6G2LirY?=
 =?us-ascii?Q?Q35t02XDmyduELd3sqqYT6ZUnAuI3Fa+TDsTDfnHTtYPSosn8z7hp7QSk/hh?=
 =?us-ascii?Q?WrmK1ctwrCV0Junx5qa/CMs5q47rQQ1iRWy0TpR/S7TPzfHDh/mvu6O3Ad2T?=
 =?us-ascii?Q?T477nEup9TJ9TzK22oo3H+ilO+QcQP7b07XA88ou+fUU9YUVA9MwTNLpxKPB?=
 =?us-ascii?Q?q7pqqpe1kFMHdYqQdOlaxgu8zvShit22JzFhKdoMW46TMkbyKVaNhs2KKckO?=
 =?us-ascii?Q?7CTemx3evpeAY8tPabeZ+J3sU9Pwv60u6EEehEggCERqraBptdR09lZM8ctb?=
 =?us-ascii?Q?Is/Jl4LfsUfTNMB6mvGAv+2w1OocL7wFz8FcSch5WrQYAf2GzhTxvigHv7DR?=
 =?us-ascii?Q?VlatZLLFtdYIuuPrwtSGzeMbXGHyFsovbeesV1yrjup3tXM0YthoLGdDEnYq?=
 =?us-ascii?Q?yfjRZU1CoQUj1J17MLYKfhE0Qqwooqg1IWdhA0oH9jgzNbREnfVI51wYyvEo?=
 =?us-ascii?Q?x8xlgo0ip6CY7JS37p2unJ3vqRsEj2Tq9tipmWSDdrMKBW7zdgA2aapatFc3?=
 =?us-ascii?Q?SAw1p+90Rk8N+7ijbDOfwrxGrH022m6Yj8coup6/nUZEC4XJCSwXORqHWGDm?=
 =?us-ascii?Q?tsgUgDlPI96lTQdQ1bwAV06DXM6WbE25mkpgicdc1oyS7jdFE2+xOwEKQJCT?=
 =?us-ascii?Q?m5Ye8T7TFEsPcLLdE+ECE4sFiPVaRZLU9LsNuxpKY5+b8XYn37ezeApuXGwg?=
 =?us-ascii?Q?fGiZXnl5mKCFuz4VaGn52YVwTH/cnoVpvXPwSrnZjVMDzyp9iA/sgmMYJkTI?=
 =?us-ascii?Q?Axdp4IhwXNGSSOcdVsCrm4LRKMZqVPHQ/2CWFyTzFbX/vmi0F/XbeH4Il+X5?=
 =?us-ascii?Q?l9pjYpDj6x11iHEBAr/gzrC6+rbINSdUWu6dhmh8/ArHFWmy7nq9ltDA3rUH?=
 =?us-ascii?Q?cd0lCMRHu+wguULV9rQRwO9ElSxuDYdMkfI6MndklGTiONTHBeFcfErolC1w?=
 =?us-ascii?Q?kbGP0Y/n9HaSU92YnF690caOlfzzrb0Kxyptb/LYMb/pFnWs3aK7VS9SwSvi?=
 =?us-ascii?Q?BGtrwqP8k/LUbjfZ6q0ZKlWOrC36J0iY?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9F007AD0F61C3746914F475CEDCCCE2E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9975
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	876f0d17-22e6-410f-f01d-08dd6d0a8b7d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dJpciHAmvkg8WN9Ca4jNs3aq36hsy5OTO5ZC/8JJr/+XgCGsSksK/XauZqgR?=
 =?us-ascii?Q?vuUYq2CvbRdfTq2lWK4QfeywEGclNQayORmypwy3yokRPF3eWYvphKhMNdIE?=
 =?us-ascii?Q?BO4E1Yca2W2MDiUfXeDI4U/F0VFT6DmM5X284fXAd/KHM1mRaz/ULSLZwWH6?=
 =?us-ascii?Q?1T5KBy+L2SR6SLOGulTadddRuFtrXtwwPNY+sNc4yrL5RONSbBHjA04+gJ1E?=
 =?us-ascii?Q?fSoOM0UXJNHxTEI1lj+NDxxpVSG42iqDxwNE2Y4O+JVzSaWvSkV1iLzn/iY/?=
 =?us-ascii?Q?pNf5hOQaaB9LrJqN+mQBSvRcbpsyg4dkQypIMkCOFxPEC1qF8eDOPUQkxWUK?=
 =?us-ascii?Q?TOEMTTGpHcw9c3OtjJYAKNTlDhG2A3nMfTzwhNQ45W8PFpsYQLQICxxlGNlH?=
 =?us-ascii?Q?pleLnKpBqbcg/8m97KqoW6Gy4QIbU2LFO3IlaSp4w4MtJg0rOLoOFngsk5dv?=
 =?us-ascii?Q?ZWL4UUYT6c3+K0tgbCf57lDwBIhnZLpnxKh7skkXuZRiXAQKaVDWYqsyjNJD?=
 =?us-ascii?Q?ODLM8bG1Fel9xTVOvJCzOCSJW0IBAurl8CU9lr/Rck8V+owo/HYTQNtCVAvY?=
 =?us-ascii?Q?9qwyR686L99W0kpmZNNFicUE26hFUeVYDbtlvrI9FTB+y8Aqzm0bWYmkPmiY?=
 =?us-ascii?Q?G6rZ1P6Dazkly0D87JDoQg7gmAv6ovPE9K3Dme2IMKtyIKO9yDVHE367+TL4?=
 =?us-ascii?Q?G7r0fjvkZbPvuSFnSjdsLZYXWkNWeoRDjhzAIWt5mxnO57vmcOvFKCb3/sid?=
 =?us-ascii?Q?3JmWT94KSEkLxE17IVOtc5fQIIvJPbGVl6ubD2+KxDkc2ZIy+F7yifKCx4bW?=
 =?us-ascii?Q?S0yMn+RSPb8mvGrpLBjraq5oW/6iGuGKBypi+Si++DIoKjNMDsf0yKR8Pjre?=
 =?us-ascii?Q?tcjKeXrOop+93NkS+l4jhMBaAdstoLQXlUsJ5mOjBnBPKMHvw0DMJAqB5HXn?=
 =?us-ascii?Q?1OhjxsuJDKbym/bJ1R0zGLlTxkabKOYT6SwkgammQfyH2w9Kod2PkdbCNGcm?=
 =?us-ascii?Q?WOYqrkyBM/l9Tov/AEICKLSIthIwkZ5MutpoETiLD2bmryb4JPxKN1TLM1OE?=
 =?us-ascii?Q?5eaPhshz36T4soSd4PDCk2irl1kEmdQOoRsCsaaxz+65589V8hPDTRdXdtPS?=
 =?us-ascii?Q?OuXegcnaFvKYdYJ2lVuIl7pg2t45pRQdnKyCccmsAgFRpZMVKeta4MMabDUU?=
 =?us-ascii?Q?Zv+znH9c0pQUkjmRddlQieUzm3EENImGAUb94j/lpAU81iaWPQsKQonaDhqS?=
 =?us-ascii?Q?U61qYz3YkYBgci1VSsnolf4SLo0A8VITJNn5suhKFb//QATBgUkLvwZvYYK+?=
 =?us-ascii?Q?gIvyNyVjc07WDH6WKgxPvGI5zUskZm0z19AUHP/XeteOOZXdHqRl9QOB80lv?=
 =?us-ascii?Q?f6iAE3L3RiHPT6KjUTIk0CJ4iQssa6Oz2JDGYktPmic56+p5Zl2l3Cnnc1Nu?=
 =?us-ascii?Q?wd/mPMeFaRTML2BWkJDsIj1I+9YR1uaVfvDgYpwfMrUCXkv65DHFdeTPkwxG?=
 =?us-ascii?Q?43DwxourituZMF8=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:37:10.0024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adcfeac2-e8c6-46ae-ec4d-08dd6d0a90ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10076

Hi Julien,

> On 27 Mar 2025, at 00:41, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 24/03/2025 13:53, Bertrand Marquis wrote:
>> When VM to VM support is activated and there is no suitable FF-A support
>> in the firmware, enable FF-A support for VMs to allow using it for VM to
>> VM communications.
>=20
> tee/ and the callbacks associated are meant to be used for mediatiors. My=
 current interpretation ist this is only meant to interpose between a guest=
 and physical resources. Here you are extending the meaning to "virtual TEE=
". I am sort of ok with that but ...

I see what you mean but FF-A will not only be used to communicate with TEE =
(even if the primary use case right now is this one, including have it in a=
 VM instead of the secure world).

>=20
>> If there is OP-TEE running in the secure world and using the non FF-A
>> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
>> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
>> probed first) so it is not recommended to activate the configuration
>> option for such systems.
>=20
> ... this part is concerning me. You should be able to build with CONFIG_F=
FA_VM_TO_VM and still boot when OP-TEE is present on the system. This is no=
t too critical now as this is tech preview but this is definitely a blocker=
 for making FFA supported. Can this be mentioned at the top of the ffa.c fi=
le (which already contains existing blocker)?

OP-TEE supports FF-A and in fact should be switched to using it by default =
as it allows it to run in parallel of other TEEs in the secure world or hav=
e FF-A compliant SPs running on top of OP-TEE.
More and more you will see FF-A popping up as a recommended (or required) p=
art of the firmware features.

So the only reason to use OP-TEE without FF-A is if you have an old OP-TEE =
in which case your firmware will not support FF-A and using it between VMs =
is probably not required.

>=20
> Also, given this would expose a fully virtual TEE, we should be able to h=
ave a system where you have some VMs talking FFA and some using the physica=
l OPTEE (or another TEE). Whether we want to support it is a different ques=
tion but this design would prevent it. Is this intended?

Right now i would say this is definitely not something we need as part of t=
he tech preview as anybody using this feature in Xen would use an OP-TEE wi=
th FF-A support.
But from Xen point of view, we should (if we can) support running on old sy=
stems with an existing OP-TEE but still use FF-A between VMs.
This has some consequences on how the tee mediator and FF-A support is desi=
gned and I will definitely give it some thoughts (primary idea would be to =
decouple FF-A with secure as mediator to FF-A between VMs somehow).

For the review side of things, am I right to understand from your comments =
that this ok for now as tech-preview ?

Cheers
Bertrand


>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


