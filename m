Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CBZBIXM6WkKkgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:38:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013C44E0BA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291660.1570522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFodk-0006Vr-65; Thu, 23 Apr 2026 07:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291660.1570522; Thu, 23 Apr 2026 07:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFodk-0006T6-37; Thu, 23 Apr 2026 07:38:24 +0000
Received: by outflank-mailman (input) for mailman id 1291660;
 Thu, 23 Apr 2026 07:38:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wFodi-0006T0-Nu
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 07:38:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFodi-000nXx-4C
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:38:22 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9cc63-5cb7-0a2a0a5109dd-0a2a4504db3c-22
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:38:21 +0200
Received: from [52.101.72.12]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9cc6b-1dec-0a2a45040019-3465480cb6fb-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:38:19 +0200
Received: from AM9P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::25)
 by GV2PR08MB11372.eurprd08.prod.outlook.com (2603:10a6:150:2b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Thu, 23 Apr
 2026 07:38:15 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::85) by AM9P195CA0020.outlook.office365.com
 (2603:10a6:20b:21f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 07:38:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 23 Apr 2026 07:38:14 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB8397.eurprd08.prod.outlook.com (2603:10a6:10:407::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 07:37:10 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Thu, 23 Apr 2026
 07:37:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fBfbvL8WElHladD60ZhiqEc3tKNTCD7XPHCf11q2AFqb0Ks8J4+e5AARJ4KPU6ym4CTHgpYzdb/gSKfuo+NF1Gwe275wP7qtBmeZwaR+SbPk33bLcYEkQlIzdwsVVvs0NTaDrXrRD+CE4wZV4VLU2PtOzzdNHiDGDrH72ZDjvhJAJYLfpP35VbBIgy56BRNgcRrkQDpN8QkTx1uqYgI+gkq7XquLPLoFQFGY/mSSfWMBKXdTEfcsTerSH4uvlZd+4+SmsSyu9t2P/2nLrE88GkL+5klompKbKonWuLg/WUN/CW5ut0bhh2hAbukf/e5lhbTdhSMVEHVICFpb/QRKYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOEyCtVTDiTHP6KYDLe6GNrDm6269DXbzWkQrDASJlk=;
 b=cFB4dHsPZZe64SdOxwFvsCU0GiU8KODoEiO+zLD58Vlaw0Rt75Eh8Ge4zxsJCQ+JISMsPav2oy0Jh8QPVIx4rePVn8ygG5zwCN1lCoytlwk86U+fN3lyNLbEnEL5q+f38sm2RyV2+ARR9cdIETDZOLaHVCM8tx7oe3Zcfa1r2bJhCOnhUBtlIMNYRAyLk5eWi51NPNgIfx232lX/XOXaXMbhWwpilgbTNC+04SSUeYLnMQuMfAFj8u9TxRyhwT/VFOxdcl90PAYXp1aN5sZdrXPvmQC2zWY2t+48yD5GWYMfjf9+iTjV6hesUHg/gkxFG8mMliSrYr0Lw00P5Iy1wA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOEyCtVTDiTHP6KYDLe6GNrDm6269DXbzWkQrDASJlk=;
 b=Bt5er/AQeUjaceTtKiKEllI78ve8bp7oRRWoi0Uhh4ZQk8X8YJ7/0SX4LWmTM5/tvZdRT3Ol0u1g1cHTVHtafj0APrJq51wJJmLmtSP5kcwrfY/Ol90sTwMFVW56VZnMwZx+bSd2MHD5ShPIREsVYIBhDVhyawyBCzNIq7Hk1Zo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLKBBtUhFRqpf26BFlYL4J3jUdlCUHy/VpvXY54cA8IUQmXLbsidIAGQ5tQqwWpejqgJVAAygT0gcVhsyF6zH6wVNzjfb7yCZmklrfes85/8DcNwkTqlNooP5FuGqCLo3XhoZ2UVH19MfoBFF0aIArDhEsYuQuk4fDKiE419Mz+6QmB3upwiQIPk3sCHddG+Fqi2qowxcxFSQCo0nV7FXwyNso8CISeCm+29piX3r5FO9H8gXXfn/HpcaLjZP8pa28uemmJKu7yjKDmxhbzvzextil8geln4uNY4h9hsc4VZDnZDY1nrMKbVxZoxZOFt3g4NbI6muWaHbdXRqth97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOEyCtVTDiTHP6KYDLe6GNrDm6269DXbzWkQrDASJlk=;
 b=bDPyYXfRB34jjVm5uBt/f5oMvDhrylQe9/SwtWJmqDG58dpf2vFP5zqyGpJHqAmb0YhZtaquP+Z3whaG6yKL0DjI28NUDXVm8vrLRiGfOSLSaNkE0MrKew6UdmJIO2FJgtg1ao86Jz+jDEfI/FLgzBoYsPGdPUCjMm/6upGgKF9I4m9AmyYSrjyPbeTE6WlDqeIsblVpLkGf4yyMliN5cEqhNI9EhWNR9u5SwebwHvQ+AZ3KL7+2X+UyPZpX7d6BHdp9UrBm9TPQkUotzMVN5bYIPOpnb6Fzv2sriED+ZIb8P5+0YRjaBn0VZ5jSeD8Ht4epLsFDgZnyuFt8c9FmVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOEyCtVTDiTHP6KYDLe6GNrDm6269DXbzWkQrDASJlk=;
 b=Bt5er/AQeUjaceTtKiKEllI78ve8bp7oRRWoi0Uhh4ZQk8X8YJ7/0SX4LWmTM5/tvZdRT3Ol0u1g1cHTVHtafj0APrJq51wJJmLmtSP5kcwrfY/Ol90sTwMFVW56VZnMwZx+bSd2MHD5ShPIREsVYIBhDVhyawyBCzNIq7Hk1Zo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 4/6] xen/arm: ffa: Preserve secure notification state when
 polling SPMC
Thread-Topic: [PATCH 4/6] xen/arm: ffa: Preserve secure notification state
 when polling SPMC
Thread-Index: AQHcznAPe0xl1K1kNkahcHWHCVllLLXrDvkAgAE8FwA=
Date: Thu, 23 Apr 2026 07:37:10 +0000
Message-ID: <9422D87F-8E49-46BF-8335-F425DD669C19@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <5b9ce4a4a3927ce2287ec4db7f864174f53b8f17.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44FnKKpZOZ_oVKXZdaznmAcPC5Y3iF2MJ_o2o3i5M1+mFw@mail.gmail.com>
In-Reply-To:
 <CAHUa44FnKKpZOZ_oVKXZdaznmAcPC5Y3iF2MJ_o2o3i5M1+mFw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB8397:EE_|AM3PEPF0000A79B:EE_|GV2PR08MB11372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2dc686-b215-4682-d569-08dea10b4738
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|38070700021|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 I3xQOOuThpt7SR4oCfyBrkrtMcopnNXxVnzSGWr/AgsM1pbRuCFG1gI9YvpZiWId7rMJApfe357J2OPDI+fYgClH6jAvMrcPgiXlrAND//fEqcB7ywzPhBMP/WwIwBijx4rvCF0epz7hSxdIP8OGEeu7yC3KGT5OBL8VQwb6zfZg3+AXBG+HC8iIN/Nh8F8GBbM7Yq3eoz/7SgLrd5foZv7wFAT+gO2OlG4dne47U3AXrx0Beou6pGC80IKuyNqszic+pYTGkJlAZ3Lj91Cb+GSM420Yauz9zo3qLRXBVIkRBtvbeJMp6FS8FgkVkxQLpqucMhENLU/aQMcs4h8odcgEn0Ha7GuOyiy0dXdZt6HRBCkzPh0/y/y6fsmbYdlyf+H63P9T+i6FPdnv8Mxey1mzF1WtsS1+H91tYPShqDqffrAfJpY9Irq5AguHP9d72L8Zp+Fc0q3koKKSQocYztuGK9XfBQrL62h/hllCq8FPphTSm2Pn92oLvNq/+AbEFVubzeG0qcNQZtKbMsFMcFNx4fUVNl8FOan5gtjjZ0BzDU9UE5WjO0PY8BrTYEcbCQu3mA0XjvpKDoiFA1gZRESewvpylPJt7eZyVIN7h4TBXsctlYx9APEH71cJRfNRYWj0Z34AwAfqtbXxvPut2rwn8eJVHFbjZoI/WD252C5PAIS9TKzg1qSgdsI1z7iaJo0MYj+oqZwwFy06eSf27MXQA5H+JjvIxEASu0O35T3yeHzlPuqnBF02SbJuJ53hmNdXYybVv/KLnWIPdpvaTElUEe2Q5/Aai5Uro8k0k2w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F385DC9F03EE04BB28208E40FC2FCFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 WXit3GodzCmgHDfRIgq4ZUe+qHSfIOGSe6jal7vD+dNtVuzk1xvMw9hpY9fIdQW1QkzzWgnDAFebOsuaog/VVJWzwcMa5BuEzXmi3iMBEP9X3SN9Bj5Wvn0UtFlvrEHf98XMn/ei2ug8NBSiK1hxd+QOTlJnam4MEDDhY2iaTcL3nKDABL492igv5IrQQ9C/+VU1iezm7rF6t5xjAqyu0Mfa2CVesvdy69gSQMgCaH7VBsvVqdt9vMHPZhhgoh9fw58wQ/mpcBZeL+5xkVcC7xUOBC5cYJMzEx/IBAB5qU4I+OJ58xwNsq6Iv268NzNgkeHP2E3Tv6/iOwKhULfywg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8397
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eef55975-a355-4e51-d57f-08dea10b212f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|1800799024|376014|35042699022|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qVFPBZhCZ8PU/VFg34paslUQGsfIey3n2adv9BkzZd05glb5hYTFU4MuLGyMTjX8LXGQLIkA7AwB2uyO54RBEM1OBTNea8eG9c4BYm275sZI+nMi+UukDp9UoZvgni90EL7eTPqOuGDuTcBSMpqP8cDk7TmprXGBxeZyyhsRpIoKacov7aED+gbicHsJl3Q+XrT5Y+mtziTRIFqgd4OffK2GwPqRQjfwOfOwjnxtI/1dSrbQrC9C2R87ifF+2NjKwXK2TWZD3LWS9TaXjVCaHDA18U1H98nyxzqbcZn9oLjdYA6MRWn5LiF6y94qfc2H4LgcQzUFQml0ptwlQy4QLMvdiamEpV1wH9/pYNxtOO3a+X6Uwc20fYdM7fxKpAN2i1Pku4LQd/fYqefzwaOWpu+I7RUVwSfWCsBxQ3aUhpzFP5IuD8ZQIvfYiPDG4LISnFKlrtTAJu99pz7R3JgYkb7t+ERsQ4UeiF/HvYcmmRxXvt1frq9UFqHg8+Y7L1DCeEKwGnH2ld0JmjoQToLyAU2UGAKHX0SNGil3QR/vf/g976VQVsFE618LmhDt0cP2kmBFj22l9Y1FJToCQkC5PF7mN1A25ozVUXhlXAWOeqvck6379ajGDEptHHJbNDjvKTEXCwzn2M5hi7heJTRGQMYOQwvSXrBZkJZdarDSGuOxtH+jQVJk7lTwBZt2J8Iwcq64puGtl7RrUKLVdbArdt5dFbWsQCcErtI/GbSU06K8U0ArfQi2CVk/ajIBBbf4FY2URcmjK8UCWngA3M2J0g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(1800799024)(376014)(35042699022)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XXaz704pX/9zIcF9hTkNtH9gEkUFjQprymV7mE3zSZie8j2MQLEiWCIpd/C4vZ5LzIg1xiwxsccHs7/X3UbKvpvjHKBsOB/m6bccQ1ytSeWt4Km62j4GjBdx8U5AwkD8fnkGxdkWFqXhoU20r6k9g+1dqHNW/2zqtU/V2KgPV7hHkJGCYQOj1JoWWd7gsLEBg+suPrM1lbukzc2GvS4IBGAZZps0hh/58Bpks3nbfJQ6RU2ZwHbGa2N28TaoHbWx9gCz0y3Cc7ziKyi6jsyoLbFpQ9spY/vwVKMu5Zi309Y5DK2PRsmjwTOWGh3EhvwbJvtVXOjHS38CAuhTXA4KoAvECnIXiMdl3kwO0AszhpREiPpvEPULdSyAK9kEb0jgO2Fg/omJiA72MrO+6kq3SRnmDLqH1PEmCnpPZSdcm+Zoc9oGs9pFmAnrXs5KLS3b
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:38:14.3821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2dc686-b215-4682-d569-08dea10b4738
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11372
X-purgate-ID: tlsNG-ebf023/1776929899-2A9623FF-14552335/0/0
X-purgate-type: clean
X-purgate-size: 8540
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,arm.com:email,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 5013C44E0BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SEkgSmVucywNCg0KPiBPbiAyMiBBcHIgMjAyNiwgYXQgMTQ6NDUsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gRnJpLCBBcHIgMTcsIDIwMjYgYXQgMzo0MeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IFNlY3VyZSBwZW5kaW5n
IHN0YXRlIGlzIGxhdGNoZWQgd2hlbiB0aGUgU1BNQyByYWlzZXMgdGhlIHNjaGVkdWxlDQo+PiBy
ZWNlaXZlciBpbnRlcnJ1cHQsIGJ1dCBYZW4gY3VycmVudGx5IGNsZWFycyB0aGF0IGxhdGNoIHRv
byBhZ2dyZXNzaXZlbHkuDQo+PiBHdWVzdCBGRkFfTk9USUZJQ0FUSU9OX0lORk9fR0VUIGNvbnN1
bWVzIHNlY3VyZV9wZW5kaW5nIGV2ZW4gdGhvdWdoIGl0DQo+PiBvbmx5IHJlcG9ydHMgcGVuZGlu
ZyBzdGF0ZSwgYW5kIHNlY3VyZSBGRkFfTk9USUZJQ0FUSU9OX0dFVCBvbmx5IGNsZWFycw0KPj4g
dGhlIGxhdGNoIHdoZW4gYm90aCBTUCBhbmQgU1BNIGJpdG1hcHMgYXJlIHJlcXVlc3RlZCB0b2dl
dGhlci4gVGhpcyBjYW4NCj4+IGRyb3AgYSBwZW5kaW5nIGluZGljYXRpb24gYmVmb3JlIHRoZSBy
ZWNlaXZlciByZXRyaWV2ZXMgc2VjdXJlDQo+PiBub3RpZmljYXRpb25zLCBvciBrZWVwIElORk9f
R0VUIHJlcG9ydGluZyBzdGFsZSBzZWN1cmUgcGVuZGluZyBzdGF0ZQ0KPj4gYWZ0ZXIgYSBzdWNj
ZXNzZnVsIEdFVC4NCj4+IA0KPj4gS2VlcCBzZWN1cmVfcGVuZGluZyBhcyBhIGxhdGNoZWQgaW5k
aWNhdGlvbiB1bnRpbCBzZWN1cmUgbm90aWZpY2F0aW9ucw0KPj4gYXJlIGFjdHVhbGx5IHJldHJp
ZXZlZC4gR3Vlc3QgRkZBX05PVElGSUNBVElPTl9JTkZPX0dFVCBub3cgcmVwb3J0cyB0aGUNCj4+
IGxhdGNoZWQgc3RhdGUgd2l0aG91dCBjbGVhcmluZyBpdCwgd2hpbGUgYSBzdWNjZXNzZnVsIHNl
Y3VyZQ0KPj4gRkZBX05PVElGSUNBVElPTl9HRVQgY2xlYXJzIHRoZSBsYXRjaCByZWdhcmRsZXNz
IG9mIHdoaWNoIHNlY3VyZSBiaXRtYXANCj4+IGZsYWdzIHdlcmUgcmVxdWVzdGVkLiBBbHNvIHBy
b3RlY3Qgc2VjdXJlX3BlbmRpbmcgd2l0aCBub3RpZl9sb2NrLA0KPj4gc2VyaWFsaXplIFNQTUMg
SU5GT19HRVQgcG9sbGluZyBiZWhpbmQgbm90aWZfaW5mb19sb2NrLCBhbmQgcHJlc2VydmUgdGhl
DQo+PiBjYWxsZXItdmlzaWJsZSBJTkZPX0dFVCBzdWNjZXNzIHdpZHRoLg0KPj4gDQo+PiBGdW5j
dGlvbmFsIGltcGFjdDogZ3Vlc3QgSU5GT19HRVQgcHJlc2VydmVzIHRoZSBzZWN1cmUgcGVuZGlu
Zw0KPj4gaW5kaWNhdGlvbiB1bnRpbCBzZWN1cmUgbm90aWZpY2F0aW9ucyBhcmUgcmV0cmlldmVk
LCBhbmQgc3VjY2Vzc2Z1bA0KPj4gc2VjdXJlIEdFVCBjbGVhcnMgdGhlIGd1ZXN0LXZpc2libGUg
cGVuZGluZyBsYXRjaC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2Zm
YV9ub3RpZi5jIHwgNTQgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+PiAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+PiANCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jIGIveGVuL2FyY2gvYXJt
L3RlZS9mZmFfbm90aWYuYw0KPj4gaW5kZXggNDkxZGIzYjA0ZGY1Li5mZmYwMGNhMmJhZWMgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiArKysgYi94ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiBAQCAtMTgsNiArMTgsNyBAQA0KPj4gDQo+PiBz
dGF0aWMgYm9vbCBfX3JvX2FmdGVyX2luaXQgZndfbm90aWZfZW5hYmxlZDsNCj4+IHN0YXRpYyB1
bnNpZ25lZCBpbnQgX19yb19hZnRlcl9pbml0IG5vdGlmX3NyaV9pcnE7DQo+PiArc3RhdGljIERF
RklORV9TUElOTE9DSyhub3RpZl9pbmZvX2xvY2spOw0KPj4gDQo+PiBzdGF0aWMgdm9pZCBpbmpl
Y3Rfbm90aWZfcGVuZGluZyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gew0KPj4gQEAgLTEwOSw2ICsx
MTAsNyBAQCB2b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2luZm9fZ2V0KHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQ0KPj4gew0KPj4gICAgIHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50
LT5kb21haW47DQo+PiAgICAgc3RydWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4g
KyAgICB1aW50MzJfdCBmaWQgPSBnZXRfdXNlcl9yZWcocmVncywgMCk7DQo+PiAgICAgYm9vbCBu
b3RpZl9wZW5kaW5nOw0KPj4gDQo+PiAgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZN
X1RPX1ZNKSAmJiAhZndfbm90aWZfZW5hYmxlZCApDQo+PiBAQCAtMTE3LDcgKzExOSwxMCBAQCB2
b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2luZm9fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKQ0KPj4gICAgICAgICByZXR1cm47DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIG5vdGlm
X3BlbmRpbmcgPSB0ZXN0X2FuZF9jbGVhcl9ib29sKGN0eC0+bm90aWYuc2VjdXJlX3BlbmRpbmcp
Ow0KPj4gKyAgICBzcGluX2xvY2soJmN0eC0+bm90aWYubm90aWZfbG9jayk7DQo+PiArICAgIG5v
dGlmX3BlbmRpbmcgPSBjdHgtPm5vdGlmLnNlY3VyZV9wZW5kaW5nOw0KPj4gKyAgICBzcGluX3Vu
bG9jaygmY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+ICsNCj4+ICAgICBpZiAoIElTX0VOQUJM
RUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgbm90aWZfcGVu
ZGluZyB8PSB0ZXN0X2FuZF9jbGVhcl9ib29sKGN0eC0+bm90aWYudm1fcGVuZGluZyk7DQo+PiBA
QCAtMTMxLDcgKzEzNiw5IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25faW5mb19nZXQo
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgaWYgKCBub3RpZl9wZW5kaW5nICkN
Cj4+ICAgICB7DQo+PiAgICAgICAgIC8qIEEgcGVuZGluZyBnbG9iYWwgbm90aWZpY2F0aW9uIGZv
ciB0aGUgZ3Vlc3QgKi8NCj4+IC0gICAgICAgIGZmYV9zZXRfcmVncyhyZWdzLCBGRkFfU1VDQ0VT
U182NCwgMCwNCj4+ICsgICAgICAgIGZmYV9zZXRfcmVncyhyZWdzLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgIHNtY2NjX2lzX2NvbnZfNjQoZmlkKSA/IEZGQV9TVUNDRVNTXzY0IDogRkZBX1NV
Q0NFU1NfMzIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgMCwNCj4+ICAgICAgICAgICAgICAg
ICAgICAgIDFVIDw8IEZGQV9OT1RJRl9JTkZPX0dFVF9JRF9DT1VOVF9TSElGVCwgZmZhX2dldF92
bV9pZChkKSwNCj4+ICAgICAgICAgICAgICAgICAgICAgIDAsIDAsIDAsIDApOw0KPj4gICAgIH0N
Cj4+IEBAIC0xNTQsNiArMTYxLDggQEAgdm9pZCBmZmFfaGFuZGxlX25vdGlmaWNhdGlvbl9nZXQo
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgdWludDMyX3QgdzUgPSAwOw0KPj4g
ICAgIHVpbnQzMl90IHc2ID0gMDsNCj4+ICAgICB1aW50MzJfdCB3NyA9IDA7DQo+PiArICAgIHVp
bnQzMl90IHNlY3VyZV9mbGFncyA9IGZsYWdzICYgKCBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1Ag
fA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRkZBX05PVElGX0ZM
QUdfQklUTUFQX1NQTSApOw0KPj4gDQo+PiAgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfRkZB
X1ZNX1RPX1ZNKSAmJiAhZndfbm90aWZfZW5hYmxlZCApDQo+PiAgICAgew0KPj4gQEAgLTE3Mywy
NyArMTgyLDE2IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fZ2V0KHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgICAgICByZXR1cm47DQo+PiAgICAgfQ0KPj4gDQo+PiAt
ICAgIGlmICggZndfbm90aWZfZW5hYmxlZCAmJiAoZmxhZ3MgJiAoIEZGQV9OT1RJRl9GTEFHX0JJ
VE1BUF9TUCB8DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZG
QV9OT1RJRl9GTEFHX0JJVE1BUF9TUE0gKSkgKQ0KPj4gKyAgICBpZiAoIGZ3X25vdGlmX2VuYWJs
ZWQgJiYgc2VjdXJlX2ZsYWdzICkNCj4+ICAgICB7DQo+PiAgICAgICAgIHN0cnVjdCBhcm1fc21j
Y2NfMV8yX3JlZ3MgYXJnID0gew0KPj4gICAgICAgICAgICAgLmEwID0gRkZBX05PVElGSUNBVElP
Tl9HRVQsDQo+PiAgICAgICAgICAgICAuYTEgPSByZWN2LA0KPj4gLSAgICAgICAgICAgIC5hMiA9
IGZsYWdzICYgKCBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1AgfA0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1BNICksDQo+PiArICAgICAgICAg
ICAgLmEyID0gc2VjdXJlX2ZsYWdzLA0KPj4gICAgICAgICB9Ow0KPj4gICAgICAgICBzdHJ1Y3Qg
YXJtX3NtY2NjXzFfMl9yZWdzIHJlc3A7DQo+PiAgICAgICAgIGludDMyX3QgZTsNCj4+IA0KPj4g
LSAgICAgICAgLyoNCj4+IC0gICAgICAgICAqIENsZWFyIHNlY3VyZSBwZW5kaW5nIGlmIGJvdGgg
RkZBX05PVElGX0ZMQUdfQklUTUFQX1NQIGFuZA0KPj4gLSAgICAgICAgICogRkZBX05PVElGX0ZM
QUdfQklUTUFQX1NQTSBhcmUgc2V0IHNpbmNlIHNlY3VyZSB3b3JsZCBjYW4ndCBoYXZlDQo+PiAt
ICAgICAgICAgKiBhbnkgbW9yZSBwZW5kaW5nIG5vdGlmaWNhdGlvbnMuDQo+PiAtICAgICAgICAg
Ki8NCj4+IC0gICAgICAgIGlmICggKCBmbGFncyAgJiBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1Ag
KSAmJg0KPj4gLSAgICAgICAgICAgICAoIGZsYWdzICYgRkZBX05PVElGX0ZMQUdfQklUTUFQX1NQ
TSApICkNCj4+IC0gICAgICAgICAgICBBQ0NFU1NfT05DRShjdHgtPm5vdGlmLnNlY3VyZV9wZW5k
aW5nKSA9IGZhbHNlOw0KPj4gLQ0KPj4gICAgICAgICBhcm1fc21jY2NfMV8yX3NtYygmYXJnLCAm
cmVzcCk7DQo+PiAgICAgICAgIGUgPSBmZmFfZ2V0X3JldF9jb2RlKCZyZXNwKTsNCj4+ICAgICAg
ICAgaWYgKCBlICkNCj4+IEBAIC0yMTAsNiArMjA4LDEwIEBAIHZvaWQgZmZhX2hhbmRsZV9ub3Rp
ZmljYXRpb25fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gDQo+PiAgICAgICAg
IGlmICggZmxhZ3MgJiBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1BNICkNCj4+ICAgICAgICAgICAg
IHc2ID0gcmVzcC5hNjsNCj4+ICsNCj4+ICsgICAgICAgIHNwaW5fbG9jaygmY3R4LT5ub3RpZi5u
b3RpZl9sb2NrKTsNCj4+ICsgICAgICAgIGN0eC0+bm90aWYuc2VjdXJlX3BlbmRpbmcgPSBmYWxz
ZTsNCj4+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZjdHgtPm5vdGlmLm5vdGlmX2xvY2spOw0KPj4g
ICAgIH0NCj4+IA0KPj4gICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSAp
DQo+PiBAQCAtMzU0LDcgKzM1NiwxMCBAQCBzdGF0aWMgdm9pZCBub3RpZl92bV9wZW5kX2ludHIo
dWludDE2X3Qgdm1faWQpDQo+PiAgICAgICogZ3VhcmFudGVlcyB0aGF0IHRoZSBkYXRhIHN0cnVj
dHVyZSBpc24ndCBmcmVlZCB3aGlsZSB3ZSdyZSBhY2Nlc3NpbmcNCj4+ICAgICAgKiBpdC4NCj4+
ICAgICAgKi8NCj4+IC0gICAgQUNDRVNTX09OQ0UoY3R4LT5ub3RpZi5zZWN1cmVfcGVuZGluZykg
PSB0cnVlOw0KPj4gKyAgICBzcGluX2xvY2soJmN0eC0+bm90aWYubm90aWZfbG9jayk7DQo+PiAr
ICAgIGN0eC0+bm90aWYuc2VjdXJlX3BlbmRpbmcgPSB0cnVlOw0KPj4gKyAgICBzcGluX3VubG9j
aygmY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+ICsNCj4+ICAgICBpbmplY3Rfbm90aWZfcGVu
ZGluZyhkKTsNCj4+IA0KPj4gb3V0X3VubG9jazoNCj4+IEBAIC0zNzMsMTEgKzM3OCwxOCBAQCBz
dGF0aWMgdm9pZCBub3RpZl9zcmlfYWN0aW9uKHZvaWQgKnVudXNlZCkNCj4+ICAgICB1bnNpZ25l
ZCBpbnQgbjsNCj4+ICAgICBpbnQzMl90IHJlczsNCj4+IA0KPj4gLSAgICBkbyB7DQo+PiArICAg
IGlmICggIWZ3X25vdGlmX2VuYWJsZWQgKQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPiANCj4gQ2Fu
IHRoaXMgZXZlciBoYXBwZW4/IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNCk5vIGluIGZhY3Qg
aXQgY2Fubm90IHlvdSBhcmUgcmlnaHQsIHdlIHdpbGwgbmV2ZXIgZ2V0DQphbiBTUkkgaWYgZmly
bXdhcmUgbm90aWZpY2F0aW9ucyBhcmUgbm90IGVuYWJsZWQgc28NCkkgd2lsbCByZW1vdmUgdGhh
dC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

