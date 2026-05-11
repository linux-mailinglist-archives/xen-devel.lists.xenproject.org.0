Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCrtL5y1AWr2igEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:55:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A150C51F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306029.1578130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOI7-0006Sr-Q0; Mon, 11 May 2026 10:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306029.1578130; Mon, 11 May 2026 10:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOI7-0006QM-N8; Mon, 11 May 2026 10:55:15 +0000
Received: by outflank-mailman (input) for mailman id 1306029;
 Mon, 11 May 2026 10:55:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMOI5-0006QG-Hj
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:55:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMOI3-004Kg4-9C
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:55:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b58d-2eae-0a2a0a5409dd-0a2a450683a0-16
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:55:12 +0200
Received: from [52.101.69.53]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b590-7371-0a2a45060019-34654535d277-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:55:12 +0200
Received: from DUZPR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::8) by AS2PR08MB8312.eurprd08.prod.outlook.com
 (2603:10a6:20b:557::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:55:09 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::48) by DUZPR01CA0065.outlook.office365.com
 (2603:10a6:10:3c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:55:09 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13 via
 Frontend Transport; Mon, 11 May 2026 10:55:09 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VI0PR08MB10620.eurprd08.prod.outlook.com (2603:10a6:800:1b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:53:58 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:53:57 +0000
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
 b=OrFtmLx1/X9IwDslsFEECEVhHfIK6V/14nXaTix41F+ND7QSX+0qeWtqJPuGDoCnPxLCYktB0IpNCuc5/DjpbL2mHrOoPsQMUwfDklW0OcdNh6TNFYaVYx418QS1ANm0Vz/hVY9dqXC/giTa7CGTdIrwZe09Cq//4rrwqyImAFTYgDl4kEffwbR2cVlBHcWYkgOz3F0bL9lzIuuvUJgmIDCE42Lea+eeyvV9q74Hpb5PF1jK0lWhPDyqwpmiJ1EKyR9z98pSGAyg3/xOR0oee8Uv1vTvOpUnurkMOUtVjf1YFXbjYjHzMM6ku4YSvVrtRbRH2YlxjHTAQfboVrnl8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BngnCWkypmX6r8VHDDEVwfpGPAPJFtqfXcW2ZXtgsPA=;
 b=PI0Fh/eoohoJH9nWL/g1qrrtrARTUb5B8KSznZ2pzuCtf8p2R+Fb4lenP6HVe6qRtxpQrJlYfblUgbHVRJDn5nsStAeJHByVslvN6YpKONJlbwG0aQP0zAO5LFifxpJXJuIQ5tIWgBuBNt8Go6fQCOT/Nwq/YvkDyDAVCbSxbVzQzJ2B06b+OEeNuKu61glVJft0TeuOvhQ72K90HTJr4/xJ0dhWq13wXp6ZuwR1atltpShE4PklTdsESBOJaB9BuYODTGpHsVFBUVUlpqImEyhOidls+qPuhtX1OHktgmx6LPabIKgCOeZIV9RiRg3BcZK+zyKsRfvCthQ/1va2iA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BngnCWkypmX6r8VHDDEVwfpGPAPJFtqfXcW2ZXtgsPA=;
 b=ixyZwSGNeuFmZXjoVXvtlsJr7qdOL6sHhKAUfW8zoYg8BoHYGmnPR3z/nKgtKe9ky2lqikisBnQjhvySPpLFaXWmgf01CjtJs7Xfhk7YA0VpUYFIvuoXCCwx3tWJ5rbYanOO4Gur12Fc92Hx61u2bnC5FvAaZymDyVtGZDQp0AY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCC4jsv4s+s6fNtfmGQH57Z3JqF+npion4puqaDKNEc2temY/N1I6BdaLeWRuQPZj7IVfpKopLNwhvNhVG0/+rcZnglZoFX3i3mLDxMYmxNQOnDCPjmZSA2BuBF1Crd6z8G/lTQVXw8AYtNz0VvIlMwXbZlJZSWn52z1DlGI2v6gAjGqfqRqXh/8pevb1v4rHzUcyUW1tVMQFz54WEqAnUudrJhZwPNv6/Gysoyf/f80T73meMJdOm5fax06NXwGIsiepun4YoJy0+nVPg6LbVzl+7d3S4/2d86+RQfwvQHZYk7j7J33IcGk7EloHYzuFzBVK/LCa75i0CtOMkHAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BngnCWkypmX6r8VHDDEVwfpGPAPJFtqfXcW2ZXtgsPA=;
 b=w/KY0LgeTlgR7GTg4l0OCCd1924F7aapa0Ymlano4yR2vqlOmLIIDnQSvnaN1L3MojKxjFzXtQQg4rvJWFaCLiv6GoTA21Pt/wwoskYIP0IKtuVsykGGrjNNniEcg/b0P9QyOcoAzLrY9AfkVC6IogZnyeA2yvT/QJNERH5BlxD4aGrbD6WU6rmCBj6N162wLC8HtMzz6It5x60R1bYK9vSYKndb7IninvaEPdzbUvogZsxboHM8cGeAbAnbO+xkL4qUR01cZ6ALQdIPrQiq6UxFKMICkskZCfgky6ciH8VPsFvE6qAlEUlEUCEGW1CeBDmgIjfpKbydgATWCrHXmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BngnCWkypmX6r8VHDDEVwfpGPAPJFtqfXcW2ZXtgsPA=;
 b=ixyZwSGNeuFmZXjoVXvtlsJr7qdOL6sHhKAUfW8zoYg8BoHYGmnPR3z/nKgtKe9ky2lqikisBnQjhvySPpLFaXWmgf01CjtJs7Xfhk7YA0VpUYFIvuoXCCwx3tWJ5rbYanOO4Gur12Fc92Hx61u2bnC5FvAaZymDyVtGZDQp0AY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Topic: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index: AQHc3vfGpFkxMscyakiMWMN4gJbZfLYIoFeAgAAH44CAAAHaAIAAAMeA
Date: Mon, 11 May 2026 10:53:57 +0000
Message-ID: <A3D4B900-2A5B-4398-A914-C1635E34C8C3@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
 <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
 <4372B93E-1AC7-4BF5-93A7-D1AD8FCE42FE@arm.com>
 <ce38f845-42ac-491b-98c2-eb2bd90f00c1@amd.com>
In-Reply-To: <ce38f845-42ac-491b-98c2-eb2bd90f00c1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VI0PR08MB10620:EE_|DU6PEPF0000952A:EE_|AS2PR08MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b3a831-88f5-4b78-f1d1-08deaf4bc4e2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|38070700021|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 MoRGJ6+iBwYjtdnmjHovqNaYv7M9OoozlkVcvEYPj+g2tTWtzzyjGYgAPH2v1OsPC8aJlhCDzt8DivoWrfxDRE+d4MurkJ//Zo/sbIORToLSwf/E+hDoZ51WujODcHaxdo12oYAomEah8ycwGdhGdNg6r4fW0IYrkHVh55gpqyrF6lwsKE6Hi0Bi+Wq+tuum9ZhHLQPpJFe2c4XylpYyDMKxCVcOhPFAY8MT2KoQQ0F969WHr9n3uyldu1/wkFLsUzaUnR+5BlTixAl75P07fG5kIqj//U0vHmE+xa9QqnZ7RItVF7FjHa/Qks37szcVNuiXGDoz5NKz4VWaFWLGs0Z/oebVV83ZsTiury3do9dp4wgd7iFAdT701eu1PZPHIf2PyWbEXc80+Dn04o2ThNwgUotgU4EqUw3boThTltDrwjlXj2N35pXU3CMmNBBnwprHIyiwaTXlcg7eLgmopECfX7H2Bec3rHMXOytIDJm4EbA6vARKQF9zKHIW7FWxIQPxrJiuzJyhkG9VXA+i9DEz4uzfKSFJBs3LAvV9slkQmMXX3Qk2avTluGwVoaoFRybdzv643LiBmCr4NBUasKds6GsHCl2wsumUB4GHK72diWn6sfUUvhwQIxM8ol5iSvp6z0JPvanE+05ECC4kv2uEtfMm0LIrwDPztOT6876jKGk49cJnuCR3K4DIfBnm8P+vqzga1P70o9iOcbrPSpUeWdXkhkGaMTkctQxsimqvsbglxm4C5vRCE/Cn5ikc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A63605161AF08E459CABC5EC2C608DED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 jp36vj8z+CdlnwuO6MWQSxpuuUQ8tL7JjRPzyI0t1SeRXiZMswgAO+D2Uqbtm9OUlfFVLB2LRFACbX8uiuNdIhMpzUPFWIJNDXNL0j0lYeRPHjtGgd7zkIFr0OhJ3UPxjHBWfgeKX3LHUh62stD8blmBKpCUWKnrQUG66VFbhzARvUHF/+FY3EDzZNCWMOonqQhmTgwBVb679Z2pzTGfXpD/LqRjg3TubmhU+Mqzuz+A0ezbWU5s1Ov4nAgBX6sPKA260CyjwxPBFuvYcVEXU9hrmvZvFUZlBtqmw1rPr9bQo9yajHQ8Srkwl5hhfe/Hu2WSD6Omp2jGdAdg3kdsoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10620
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	12cb8bd6-4c01-4202-e3e5-08deaf4b9a36
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700016|1800799024|35042699022|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tW13uoG1XFJVM381OZI8tAwPn6BH3d8s+PvwHewCB4sTYDbMZN/AbWdWinj4uPKqvQzByWRqpMuIajYsrXkZzLI/qPYgOpODyJfXn/ZdoZfo+qfplgAKmuUqOAmhVDsY48EpHETkhC8Ji1xIOlVjssgmTChBBQhCEn16edVCZQuUZhI/mIII5KAHWbeQBcRYx3lfmfSZIZ91k9Wy04h4V0j6Aubkc34dCVPDmmWNutVca0ZR3ImrtwkpCY66bRrIHnUEQQcTY+AcyWkrS8JiOAmEXTwREtN6g9y8pt8U7Td7bVBJCGHo2xyiCbtSVNG7R2EsU9mWTfVsTHHa6aqMjlRerrTZ/01YhlVDJTyIIKk8OFRLLnleNQ390lA28ld1rGVJbVboINYnpm4RHhxhK5zBkTej2hvCHx0vtKL+BFWUmNBxR0Osrh9czoIfLKqGl3T+0XQA/89mrG82m/B4gk1WEEyOWINJxTDnN5DuPKlf3zBCb/l84O22OkZE1KHVvoZl3WuXGfuQ4vpmF1ZO6C3fCP1zpKHxmqEunOv/hleS8T5Fhlt0STtVeAQpqVbzY4iSDSJwGU7Rlf52CofpbWfWf3+bhdvhHx3GGfnGio7lDcfTKTlG++1me6kFUEPOFHAp0Aoucw8cDuzbSyew0HAjfPHBqUbUg/tspzrJ/FhoYHVR1u+hy5vc5R8RRSK+Y5FTuFwAVOHYZqGjCm1q3ZCRMdFpwQP6tQbm/wvULYw=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(1800799024)(35042699022)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vgrhQewiVT9ued8NF0+33I3R56cmnV43kMG8xDpGv6CoNtmwtY+Y36qsAESxoQ1gszlR02V8EfiBM/Vl9cEcOz2IzY9X5ANsGLpEtjjSnPBPyZW7R75hhqXMPh0d/+rbCPQBOb6R9oIlW9GXGSdE7ziLe6iop2D5rpl42fcHdjMFvk0GMXsG6TfKr/fXFN4ncnMF3GrqjwEPtobXfFedSm1umVjxy1pjxlJrKJS95apKocWmL/yvF1jgNUP67GZ3sJPQHVyBSvRkQM3s4qvxNRiGTgOV+6vg4b3fsek6DlWTYQJmoxC+Cgi9FQyuhluMbtj6CclCD/+6/AM4gkFaUwChgkRpsUGeRaOZkOZ2FG+Q+a8d+h/3UuV8DPwNtJqqpr8nBNOxOaYXJmOeNxTAALx2KU5aJqEVXtQJCVdUhFVzWMqS0HOFyg/Cbms5tAil
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:55:09.2761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b3a831-88f5-4b78-f1d1-08deaf4bc4e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8312
X-purgate-ID: tlsNG-16d1c6/1778496912-86168D75-5626FBD7/0/0
X-purgate-type: clean
X-purgate-size: 1020
X-Rspamd-Queue-Id: 321A150C51F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

Hi Michal,

>>>> +
>>>> +static inline bool v8r_el1_msa_domain_sanitise_config(
>>>> +    const struct xen_domctl_createdomain *config)
>>> Why can't this function be common? I can see 3 definitions (Arm64 MPU, =
Arm32
>>> MPU, MMU) but they do not have anything that would prevent from general=
izing
>>> them in a single function.
>>=20
>> I can do a common one I think, just to be aligned, should the common one=
 behaves as the current implementation?
>>=20
>> Arm64/32 MMU: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_=
NONE allowed
>> Arm64: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,P=
MSA,VMSA}  allowed
>> Arm32: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,P=
MSA}  allowed
> What's the reason for allowing NONE for MPU here? None denotes property n=
ot
> specified but at this point it should be set to a default.

We treat NONE as PMSA on Armv8-R, so either NONE and PMSA are valid and lea=
d to PMSA at EL1

Cheers,
Luca


