Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PSKIggZGGoBdQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 12:29:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D415F0931
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 12:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321083.1588094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSXzD-0005z7-Co; Thu, 28 May 2026 10:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321083.1588094; Thu, 28 May 2026 10:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSXzD-0005wi-9W; Thu, 28 May 2026 10:29:11 +0000
Received: by outflank-mailman (input) for mailman id 1321083;
 Thu, 28 May 2026 10:29:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wSXzC-0005wc-7V
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 10:29:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSXzB-000ALS-Gu
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 12:29:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1818f0-e002-0a2a0a5209dd-0a2a450bcd1a-24
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 12:29:08 +0200
Received: from [40.107.162.57]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a1818f3-212f-0a2a450b0019-286ba239d20c-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 12:29:08 +0200
Received: from CWLP265CA0490.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::14)
 by DB9PR08MB11363.eurprd08.prod.outlook.com (2603:10a6:10:60f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 10:29:05 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:400:18a:cafe::d3) by CWLP265CA0490.outlook.office365.com
 (2603:10a6:400:18a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 10:29:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 28 May 2026 10:29:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM9PR08MB6242.eurprd08.prod.outlook.com (2603:10a6:20b:283::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 10:28:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 10:28:00 +0000
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
 b=f3WXVKrwNM7p2lwJof5uXEd9QmAER9YWPWIHrnWKmLzi8LWP0EWm3cVbT3gthiQWYc/qAQiFmiRGgTi99qoXr5Gn5Irid3rM3VNNA+BFktO6BFoR+wCWc9zKY0KSXdLOiroz41vXnJDqVnajCJuDMRm3L0GMAhhaaijoKZiil3+HBErRLty8oR4Pv7jVCr/D9cxsXdYLnfjvnCCW/WqmRLk/BMLkTRpz0I5oZ9CsFdKXvYNbxTzsMUWfDYwc21uG91nAw03YCccH/DWebrELbifcRANql+M6GUbYk/ae02g0YLk28E9qvDwX0ZLqtMn8hbGaWnpT17RIqjkPJvNmOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLJHdgtBPP5p5Su7M3tbMnf/2rHNHjwaKDLqNNThezA=;
 b=gEfXSOFMwHttACYU06Oz6g0B8HvETTRfmagsxwVLCVwP5SLyyA3OzlEokKuCyU+BaDREmyNrdIwn2Mnx9hwzUjc7g2QugX8fq3wFQWs6tB814uktDnqQ9xcrrrCfo6DKVwwxdBvIM1mthTRaWL6PoMaw3YqAvXxOh6hAnjnPNSyvma6YpoUYWScdchXVqcDA6EtLjDB1GdqCqCi9njNnpj29MgduXWH+/BC4XOp/t85cwYEW2PTAZVlTajT06mwCpT5j6KW5D44BdFH5HzIFUObPD6lMfx4RLzGVavbGUKBwYxc4bILF5l0Gq/YZW07Rt/cuBgbgUoKc4+HYI+E4Jg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLJHdgtBPP5p5Su7M3tbMnf/2rHNHjwaKDLqNNThezA=;
 b=WI9AhdUVaR/PGGjZsIMvfLeemEIrF5FkbfRLj0eS41Hp1iBqmvH2ShCwfbTRNvx4i0tKfgCln+x29d2nvkUbAM6mRc1Uy02Gd0PWMW/PMbbm9hAtDQcx8AtVr+qmY7Sq7lNJMDzt64fp6/oC2PD2Dw0afTiCoCCq61x4OtyPD2k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZghzT3y69586wzbTvWIy1syUGoqKWqNYBPjBFig58ZAZWTEBk8GWVBo42FnJhCoV1Xc7BZ6st1L8xZUAHsLluAD7KRoOHDPoZUuUgk6JMW9SAjY/kl+0JeLkkgX/9DMROD9NOInKOilVmmxR4gafDmZaZm9Yq3NP9pgO7Os/LbefLTAem9pWXp5f3XM0NBLIyaOuDyQcPIxxNf4NcktIJuH5QCH2cLLqrlAHa1eCSSgsaMh086acTTMYbsDIncCTYKUz7ApLOeuwCwXZ1mGdDjDfukeewHIjss4zDOf2tfmhC9SoLsznbcSHzBlw14YD3Kh7u1TmOW9uCtp2z3U5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLJHdgtBPP5p5Su7M3tbMnf/2rHNHjwaKDLqNNThezA=;
 b=V3BK55hmpFMrgQBpSNbPa2bT/He9hQVJvqfQ66OkYtbqjSo3bFPUqFDM4TyW7hCjSPpZnNieagPoK+SeifjXCXEAJg3Hnf0zZOsmJq2AjJAt0kL2wb6kgpjlq3qzJX2aqIVT+LglOi+0QloTr/qVdn+BsaOckb/diMT8Nxd2o4Klmi1umgPIOzj4iCGVcBiQx2UCWx07WdUt6xeZQDEIQOc+PYf2SNROaWsvzUkd22OtoK8sYAie4zDQORC9Hw7kRR6sU3lmCYMRzh4dA8Hcyo+rPi45k/74nlRlju0gt30TOlsLoHiBjqjFGeE+j8fdXnV3GCa6tZjYGnCAF33ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLJHdgtBPP5p5Su7M3tbMnf/2rHNHjwaKDLqNNThezA=;
 b=WI9AhdUVaR/PGGjZsIMvfLeemEIrF5FkbfRLj0eS41Hp1iBqmvH2ShCwfbTRNvx4i0tKfgCln+x29d2nvkUbAM6mRc1Uy02Gd0PWMW/PMbbm9hAtDQcx8AtVr+qmY7Sq7lNJMDzt64fp6/oC2PD2Dw0afTiCoCCq61x4OtyPD2k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v10 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v10 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHc6UoE70SYZf5YZEqpY7ivb9NizbYjRpeA
Date: Thu, 28 May 2026 10:27:59 +0000
Message-ID: <E7305E13-6327-4463-BC80-D87154E13108@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <ae553923955259dae7d680d427fca36824657ecf.1779385072.git.mykola_kvach@epam.com>
In-Reply-To:
 <ae553923955259dae7d680d427fca36824657ecf.1779385072.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM9PR08MB6242:EE_|AM4PEPF00027A60:EE_|DB9PR08MB11363:EE_
X-MS-Office365-Filtering-Correlation-Id: 776e3aea-3a6d-46c6-2b2c-08debca3f1b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 JKyfZWfpdrlTzB3XyDELHVVV7Z1MIWPLV8HdVv2uo7/bsqBqFvkQs03InyWvAGXWcGGs7CfjLHFUw2cLYP1nrFqLybWsUNefnFuXog4nSetfk5pzqdM123id71GKddT6EhpKGliMMejw+YbF3C7UZa/cocw3CvTDhH8dz39jBODe4eHqxL24BxtDaSAiD1/Es/ZHstaJhfcjZ/vhC0AQmdgBY358EhYKKkQ+BPkWH+LtSHLNuPA0rzFWwmnDecnGfteSO+KJjT2Ha03MEdXxrN8grvzRHDVIqPqbEZXvtawrDZW3YZ1MKiciT8MecyY+zQR7TCDiL0a0F8AyCr9D4aAZy9+e0BMYnPqrNZ3H6dA7BN3t6mlCHVEuRvnFytpasv7nF7I5U1nUvZSNGjV/FX4Dfxn9Tp2dvS4X7gGZN3tOVD2fBJPMRj5vVAG3pGVoA6mo6TCFNCtOHZUn1/uJohJc4kXSs4drfJ/0+Yh8+O19qBfTZ/ChdNSfuLzDLAmR7DA1KC6DZgum8IZcC5Q7R/ZzwnClxjQoIYHKbRfa0AfXL01/lfUU/Jdur9FdP3h7uBW//r18Tl6JzTAOtfnMYHKDaVtR7FmshYZVA6AJYikJAHqpGde4TQOOSde/MAPpuV2TTdQ6tD2PV7ZbSvoNlgE/ktLdoAgyM6e+LdmG7TiD62P/9XqceaBnT1znnviMLwCYUyOGl8a4IsDCkhaLM5/sppCMScN/qJPoFrJ51NpdXG0kB0hk1Gn0AK64nYAV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E257EAF61845D44CB3D8AFC72A42358A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ekkGYdzRDlZoeopH4VPbH7CAHXumf7xlg+dkH2D+Lgw6HewSeuCCTouPWyTX6uRWqx3NTGRLWK0tFN4GFlLnIWmsbJ5OdcvAnBzT1kuQsTCxtEqLAxv7JA1OK4efkeZRx3cfDYw8Y8Ha9vvHAdCT7DCwE6bfPriAEf3DDpYru+ueDLqIHOm/CK7UvlUtIKiFZyEIWOqLSgkJ3skBFpAa3t+dDRLhrmwZLWhp/AgKmOrQOeHBhPAnaUOr+wZLiYGqkBkuFAcA53wma3YsrgmNXQWYV+pM+2ktvcZyRO9BmG9Vq2CpVgxlEO18H/20gyII4wxgT9G2A19O7kkAsSGevA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6242
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9161ccf9-a370-4748-caf7-08debca3caad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|14060799003|1800799024|35042699022|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	n98H+Dt1IJuZ5sRA4IaT1obbcqdEyk8ni72Fw+lo3+73+LEQf66DxbjaTXpfFzzCeACunkIXWHmptAgJkGvAgEZSXYyUjSpGzfJJKAoBJhAZYCP4W0qU1Hqn25Eyw67wVe06sto7fhk4INS3kK00tbeAeLKEt6rznW7V46vasLTuKbYHA62tcePCBfmEe3rhWHT2mebSif2nU++wH9UVCTtyKVXPwpVtlEgSIxKwe/aq7prjvk74Fdjm3/TWsSxcZuR9XAZomGE1rcAxO/HxQ3m6/QLs7Q9ibpfFT80GQBZUkE5E4l81+5UDQYmUGZNITAIZfxpX/Q7Pxqyx5fwPhBld4rOsZJ3dZOe0RGgP8hY+Y8Dn042kmG9RtAdMdaixKzvnZ9RPR3sF8+rWrViJwWQKcaM6gtjhYgdODvc0DvMllR26IxpDp5S0l9SUUouyTWEnO8vq9CdaawAzq6ukHXviLEjHAauLnPAHOO7s02H17q4hEfKAUaTVw2tsB6YOiN+PXreIBC3xuq1MqZ7aVXB6kWlgXhXEL4MGieVXjIYPRMPAKBcrlI+FPMeWrMDrTQesGBt5sSUfIgqlZ5fEG8k1mSBKhsN6ZFWD18LbGrGR6BHEf4rV4duy8XBhBXqyJ9cB/muJddPyp3he6AriBhUfLyDYVVbC9IFfWEOMlfPtQgj8E5mOGZJKtAmUY5NWmApMNWdBhIgpGro75u8jmr3QpZfNtAodEXGAIIL871Y=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(14060799003)(1800799024)(35042699022)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AN4lQsS1EjrH37Xc4hRCainQNU7nyJxWxMZ0V9JPgPxtiPpYxgvZZVXViJjdLLBn6DYm6UurAO5SlniFrR3br5KVq85uAQJY1wvizzIJ7lrDnL08Kdjym0UjapoybcIIBgSCXP8AZfhFJ4LkoLfd6ryrVV8nhquy31oZHqTh+eFGDsvOvChb5s20aN1iXXu4VirKhUu7outqJeCvaFCgp5QdldGqYVXBAcBd8LD3DNh2jgY1slQPHc6P9WZq3bCQ48uGIkw9t8ls9f3+BzyuCnSet/bL2bSXOxiXnuQ78zZbqdeu+caQ3PNtEHTs3bGwZjFwAaUZgjY4OvgUfMQ4oppSIV5NN5U9wGkruREPmMZ+JIBFCDSoRo9yWKcaom80LLfiS2EjOmv3ngrgwCFK+YArJDrddcCClKbDrMXSrmAQlPtOt4bsuDODznhqguJ7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:29:05.2901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 776e3aea-3a6d-46c6-2b2c-08debca3f1b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11363
X-purgate-ID: tlsNG-42698a/1779964148-2007BF3B-52DBB575/0/0
X-purgate-type: clean
X-purgate-size: 1750
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aggios.com:email]
X-Rspamd-Queue-Id: E5D415F0931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 21 May 2026, at 18:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>=20
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>=20
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
>=20
> Transient physical SGI pending state (GICD_CPENDSGIRn/GICD_SPENDSGIRn)
> is intentionally excluded. CPU-interface active-priority state is also
> not restored across suspend/resume. Xen reaches the final suspend path
> at a quiescent point, so there is no active-priority execution context
> to replay after resume. Enforce this with a runtime check after
> disabling the CPU interface: if any implemented GICC_APRn word is still
> non-zero, restore GICC_CTLR and abort suspend with -EBUSY.
>=20
> This does not apply to distributor active state. With GICv2 EOImode=3D=3D=
1,
> EOIR only drops the interrupt priority; final deactivation is a separate
> step. For guest-routed interrupts, Xen can have already EOIed the physica=
l
> IRQ while deactivation is still pending on the vGIC/GICV path. Therefore
> GICD_ISACTIVER is preserved as architectural in-flight interrupt state.
>=20
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---

looks ok to me:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



