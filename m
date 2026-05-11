Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK5gN2azAWppigEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:45:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AD50C21F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306005.1578102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO8u-0003cU-E7; Mon, 11 May 2026 10:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306005.1578102; Mon, 11 May 2026 10:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO8u-0003b4-BK; Mon, 11 May 2026 10:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1306005;
 Mon, 11 May 2026 10:45:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMO8t-0003ay-Bg
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:45:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMO8s-00EYui-Oq
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:45:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b351-5cb7-0a2a0a5109dd-0a2a4506d142-24
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:45:42 +0200
Received: from [40.107.162.52]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b356-7371-0a2a45060019-286ba2341fe5-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:45:42 +0200
Received: from DB9PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:10:1da::6)
 by AS8PR08MB6327.eurprd08.prod.outlook.com (2603:10a6:20b:31a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:45:38 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::84) by DB9PR05CA0001.outlook.office365.com
 (2603:10a6:10:1da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:45:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 10:45:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB11941.eurprd08.prod.outlook.com (2603:10a6:150:341::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:44:33 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:44:33 +0000
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
 b=mrjktAf/+WtNaIbd3hZvScts17RzVIAR5x8OhtLkOo84eeaqLqyw+cNrDbu+6OnvWio/8HXDr7pXfVq+2+upzW9DXS8WfjfonHhJ9X6tMFkyjFM+Z82RpVLe+FOXOZmBKJ2yDI2m2oRPPnjGynQYF/HUn7vbYjAr01N+p2jsrvMBVjY3AmDYEUMQ1JNBqzurOqULc8XiSVxCMs5pOAIbQOLwQsM9+fEWltpcg+ZNnKLhFtNzDTfFtKUr5dq5BxjRLy4KU1mCVURS3J2GLmygvOCyyeNNprrChJgnUgmRjbGq9UDU1DubgbBc0TrjcqGau1tdJOqgguu5Iz0YCYUYKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nxr9pLZSiMWqsWhbZB/mQXbRf/uUqO+o48bL0WzCyM=;
 b=jrohP2vgNO1ScSabIO+VdpJrHrATc6qXDX0iGSBpw2bf6jKvkrmJdXOQ/hZPv/ZO3qtU4arMYgWkD3/yINlwDlKTZNnCmFQ3VxMDx9oQrRDzsb/VsrWEzmE134bRTdSvKklHuRyL1aB2biYQU7AhUp1HrRp/VZNYUPwlwqAR2nZTrzg48EX9w376iAZaIo2diK51OQWd1widmTGltyp16cLcWc2B8nNOZtdfmW7XqVSJdfJcNyTHZhxJlSCR+afJEL+F3/UjVsT7e4T+AkNJeI9mo5gkuxAHJX406UopZ8xKmJ4twN03tTbEgl7/sor2HBfnYwspIDRSS8P6Q1Nfyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nxr9pLZSiMWqsWhbZB/mQXbRf/uUqO+o48bL0WzCyM=;
 b=j0gcpAiJUNh2xOXVFTfxr+iufDYULSuoUDZW8Eewo2vUxT4xU2/FUILMTfgAKdbwQm2Bz5AhAkEf1GR8U2c8xITaGoMKkCVGuwLknVAjGQ0JVphGpTPuPpc+0IHYGPZnamAqZ8MzdiUrhHHDW/4Wur5Sfr7EvCZP79zjbXlAgnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl0oEmtEy3Y7q78MDGvgW0URlty4Ya9vB249zy9MLykBOHj/j37QokiG/1isFZgqvmMfrTaSorc12iVuKJcy37qASeMV+Ib6FVg5gwThDoAoFgkC0DfCTDeKIUL8BgI5Z0L+OME4YfNaY7fVXM0ypbWnkVko0MZ2a4ttZQoZkCMqBvNiHmsnQKmFxvFcM4/p4bE9Go2u50FMuzvRBgFXtEjulFM2smkh3CHemzBZM77Vx4Gg35NQeIxam1+UqxJGjBUu3TAqVc6zBXDNNxCw7uxrrK+1pe+IeHhRhRDxXsG71NjYNkC0BmTlFalQFJeSH7Z03Bz38FsxagFsO7obng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nxr9pLZSiMWqsWhbZB/mQXbRf/uUqO+o48bL0WzCyM=;
 b=W4qY0wUfM3lmFr0i/C6vodGsI74KrvVBxUWjUbspJ/4QVud1ilhlWrUp1K8nD+nBtONC9cnKCjLX52sirhW/wCdfO0WP6y1/viwqz8pbIDvbsZZVX1UpGmHboK9ar7us38bs7LSSx970ceGFoa1RgSJwps2p4u6LR+wDflYvOXha7OWT1vak0wdcggh31rvNZvQRjYPbU/xC545RyP1m49sknBPsyKhxWEGzIMkh4Cf/kcAI4/TQyYSXzUbSXZybx0hEbpJ7d7mbvKYJNul8P+byI0UwS6GsQLm6YKPVPo7KGpwhmQfiY7fy3PZcTz/tAkLNRof4KoS+iQOkSC/lyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nxr9pLZSiMWqsWhbZB/mQXbRf/uUqO+o48bL0WzCyM=;
 b=j0gcpAiJUNh2xOXVFTfxr+iufDYULSuoUDZW8Eewo2vUxT4xU2/FUILMTfgAKdbwQm2Bz5AhAkEf1GR8U2c8xITaGoMKkCVGuwLknVAjGQ0JVphGpTPuPpc+0IHYGPZnamAqZ8MzdiUrhHHDW/4Wur5Sfr7EvCZP79zjbXlAgnQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Topic: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index: AQHc3vfGpFkxMscyakiMWMN4gJbZfLYIoFeAgAAH44A=
Date: Mon, 11 May 2026 10:44:33 +0000
Message-ID: <4372B93E-1AC7-4BF5-93A7-D1AD8FCE42FE@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
 <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
In-Reply-To: <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB11941:EE_|DB1PEPF000509F7:EE_|AS8PR08MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 878965f2-0c0a-407f-9ce4-08deaf4a704c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 rBgpKpwahqanc6u4mqxkR9bwoo+aGeHCPsDys9SmkRJJYMy7trzyw7zValCvg/IB4nFu+YB2wMxv/ZrHbi8P9Ti9NfrzHo2DS9AZbP22ihgFgzoZR4wazG5IXn4kVfilRwWnU6p7Q15w4LmhQwDaubjSbwDJIWYtLKetK0M0XB548A9fIlmBf33iDzc0F3KiKwHEtRt9J1cMkrzE4+xtPBfY+EGV3uleMHuLtctBUsoxVj9nJCiNulEh7U+LuJj3ramni4DV4hCqqNv189v+uxdsKHNZz+ddYiHh5rI7vwsEdU60pS/Fjcoq9rfUXhxnqryn3KI2rLM6rms4T2ZuSAHFaDukxRN4rsZmPGEnxpVzbhrCmU/AcnNE3RIa6bwneQHt+AerQGUux9ptuIiaOvm8uIg0KekIVTcLeWo4U2DUltILURuRMdjoOQEhgHgKAH88jDw0iwlfa3AsAT14+DHG4qghNU949vpgXFTvUdUBmAAKS73V4BE6OLU3UN3I4JBs+j03ZreXjMz1I89nDdDVrRN6hO4wH/5BM7XRSwOluXRFgRZTW1Lkok3Hin6NmZy6fUW+FBg1XiMRADbICVrOU3ewc+o4WVJX83PBkJr+0oeHBcqBj30jI/1pOwtKPCtqbTx2XMQM8Ahhx7tgkme1vkYUnFrjp2m6Tyt4wplAEHh7Pi/qgSNm3FfqGzwL9cx48zGiy87usEdAToIUJ1lddm602jnaYa4xXrXZVyviDow/XTz3MmxzBiBJsFFT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <034414B75A1E0E4BB7A5D8F4DC26B6A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 v1l+5YsukzEBkOqNmkhjPKlTQ0bgCevSY/BGUlzn9PILbK/+KnoNVR/sXMjhMUAAdR19TkHCd3D6GFcSQV0d3CVkQisy9MoWKS+b8c0Ztnfl31H2gNAGGjfKGvjGbMTtk7bM8Hhm22JmNiPe2KYMOR5Vu9vpp23tchrWA50qfSJUNAMD5cu1Er3SUhhW31WleIQgaxfQoDv0dpGFPXhgRErrzCEM5aQzJPeywacldryc12iaa0tzw/7XBXQpUaJref9LorfcgbDY7s4LufoUqvwUNKZNyvBsUlC8FNw3xZtfyTHAbbPP8lBJYzDDo4kQYWCYZ7sYtMDNVdKvPS+3Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11941
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f2008690-cf7f-4bfe-5edc-08deaf4a4a05
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|35042699022|82310400026|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EsAisNQnEMluac0DxtTFGb48/efU5AqrAIdbNtYXHccv+BaHegwY5ikgYNzcksOWEi4G0/o3Dp6ZkTxWKUc8BcjmhDf6auxAWzqZ+a9thSdhQ1k9mYASEgYqnfDCjlYA21p6N6SBj+/1l1n7DkRFICH2Pt6VrwLCVl1F339YxzkcV0G3inFa9a5PL7MIBmC+SseJXSq7Nv+hXIxWADogbyOZvThmk+1yyd5HlurQ0NSqov3Iw5sz7wZue85C+TBEH+8TMV5r8hIgi6tdRgK2EDRtD/m1a8h9rkTmrzu2Z4VZ6h+0zJj6kVPOiAIi9CWlKfaItbCvoq527RtDZMsgWnBZcV44fQGpaLzzz3avKxqhuumvKh/rxOszv2zBeVoTBoLg2mrS5rnb4RRwDBovRPVZQiPfa31rtDfHPEe7tHtVS96dZmwAoEjhljcviFZlK2GmBx1KDgt5zJeDMzA7UglET1aEyWJVPFD/e53awIfb+CgRR42QkCkOra3X40fTJMovTdPWmH34/aW4mfQl89iJp/tX0wlwC9n074iFcAdPVLbns9PyQtWe5V0LckJCta6LcrVVPXZQAlhnYBXznpcbbx7srGEW2aREu4dzVK92aZmA5grJfIBiuUxIt3sDD50/22wI8+h8RByKMvPCWhjIfIRDMRPyKkBfkJQHqmCTU0EC+ercyRngn54lDTPvGbjBLPn0rmloZMu3XnwjMG/OdpHrVKlRVFKnT+ZqmSQ=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(35042699022)(82310400026)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gqbPBZ3liHykjHK1bxBrBnebTEzQPFCQvVpsAiSyj3wq74ic20dq7BiY8GMbPsKGtm+G3POYSbs2McOjsAo9AFkVmV6yqdYTwIe/fVsAqouvEqQMoWK21Xs1S6H9dy1ekPv7W5oVjb+6W0GrAFg1OWxS0Y1F8pvRGtWTcu4Omw3+7PXiZCbXB4SxrLXKQ6bjpOJj++zC6arfDta+YXlpcUQQ/K47NDmkCaweNAmECklZjpu11VBUFTyyvA+ZvUxJWsHRGjKdy/JIUmSicvC37JS8cS3q9IfHwbCILCPg4Ulk1dU6yD62loNbldVY/OyTIqZ3w7E0+cIJwqEwVnjQKuh5HuemUledhFukm7TLhK6HYJC0DIG1WxTDght9N3pJ2rWET0fOQs/s11rPoWScY5qktkIW9HlrHfJ7AWywPBraxiRhi7IgpYZvfJQENCeg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:45:37.8616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 878965f2-0c0a-407f-9ce4-08deaf4a704c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6327
X-purgate-ID: tlsNG-16d1c6/1778496342-87D7AD75-79813524/0/0
X-purgate-type: clean
X-purgate-size: 2160
X-Rspamd-Queue-Id: 376AD50C21F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgTWljaGFsLA0KDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Rv
bWFpbl9idWlsZC5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbl9idWlsZC5oDQo+
PiBpbmRleCA2Njc0ZGFjNWUyZjguLjUwZGRjMDUxMWU3ZSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW5fYnVpbGQuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2RvbWFpbl9idWlsZC5oDQo+PiBAQCAtMTksNiArMTksMjcgQEAgaW50IHBy
ZXBhcmVfYWNwaShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKTsN
Cj4+IA0KPj4gaW50IGFkZF9leHRfcmVnaW9ucyh1bnNpZ25lZCBsb25nIHNfZ2ZuLCB1bnNpZ25l
ZCBsb25nIGVfZ2ZuLCB2b2lkICpkYXRhKTsNCj4+IA0KPj4gKyNpZmRlZiBDT05GSUdfTVBVDQo+
PiArLyogVXRpbGl0eSBmdW5jdGlvbiB0byBkZXRlcm1pbmUgaWYgYW4gQXJtdjgtUiBwcm9jZXNz
b3Igc3VwcG9ydHMgVk1TQS4gKi8NCj4+ICtib29sIGhhc192OHJfdm1zYV9zdXBwb3J0KHZvaWQp
Ow0KPj4gK2Jvb2wgdjhyX2VsMV9tc2FfZG9tYWluX3Nhbml0aXNlX2NvbmZpZygNCj4+ICsgICAg
Y29uc3Qgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpOw0KPj4gKyNlbHNl
DQo+PiArc3RhdGljIGlubGluZSBib29sIGhhc192OHJfdm1zYV9zdXBwb3J0KHZvaWQpDQo+PiAr
ew0KPj4gKyAgICByZXR1cm4gZmFsc2U7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCB2OHJfZWwxX21zYV9kb21haW5fc2FuaXRpc2VfY29uZmlnKA0KPj4gKyAgICBjb25zdCBz
dHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykNCj4gV2h5IGNhbid0IHRoaXMg
ZnVuY3Rpb24gYmUgY29tbW9uPyBJIGNhbiBzZWUgMyBkZWZpbml0aW9ucyAoQXJtNjQgTVBVLCBB
cm0zMg0KPiBNUFUsIE1NVSkgYnV0IHRoZXkgZG8gbm90IGhhdmUgYW55dGhpbmcgdGhhdCB3b3Vs
ZCBwcmV2ZW50IGZyb20gZ2VuZXJhbGl6aW5nDQo+IHRoZW0gaW4gYSBzaW5nbGUgZnVuY3Rpb24u
DQoNCkkgY2FuIGRvIGEgY29tbW9uIG9uZSBJIHRoaW5rLCBqdXN0IHRvIGJlIGFsaWduZWQsIHNo
b3VsZCB0aGUgY29tbW9uIG9uZSBiZWhhdmVzIGFzIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
Pw0KDQpBcm02NC8zMiBNTVU6IE9ubHkgdjhyX2VsMV9tc2EgPT0gWEVOX0RPTUNUTF9DT05GSUdf
QVJNX1Y4Ul9FTDFfTVNBX05PTkUgYWxsb3dlZA0KQXJtNjQ6IE9ubHkgdjhyX2VsMV9tc2EgPT0g
WEVOX0RPTUNUTF9DT05GSUdfQVJNX1Y4Ul9FTDFfTVNBX3tOT05FLFBNU0EsVk1TQX0gIGFsbG93
ZWQNCkFybTMyOiBPbmx5IHY4cl9lbDFfbXNhID09IFhFTl9ET01DVExfQ09ORklHX0FSTV9WOFJf
RUwxX01TQV97Tk9ORSxQTVNBfSAgYWxsb3dlZA0KDQoNCknigJlsbCBmaXggYWxsIHlvdXIgb3Ro
ZXIgZmluZGluZ3MgYW5kIEnigJlsbCBhZGRyZXNzIEphbiBjb21tZW50IG9uIHRoZSBleHBsaWNp
dCBwYWRkaW5nICsgY2hlY2suDQoNCkNoZWVycywNCkx1Y2ENCg0K

