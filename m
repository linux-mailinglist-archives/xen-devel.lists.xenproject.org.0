Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFm9G+uZhGmh3gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 14:23:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F56F3324
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 14:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221941.1530046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnzKU-0006Ec-EO; Thu, 05 Feb 2026 13:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221941.1530046; Thu, 05 Feb 2026 13:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnzKU-0006C8-Bj; Thu, 05 Feb 2026 13:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1221941;
 Thu, 05 Feb 2026 13:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WZD=AJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vnzKS-0006C2-PW
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 13:23:28 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d82820c2-0295-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 14:23:22 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB10509.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 13:23:18 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 13:23:18 +0000
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
X-Inumbo-ID: d82820c2-0295-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVK3HiX35zOsKBqOmiNfRFvCyPaWtmPJ4UHhDpY4WPauXUCvge8KN/QLyiuy80zmxnoh4206tuj6U9eHiMqx/QtqWYrapMPpBHEIIFRvXfqSqNNLRbWv4YRF5zScO87V9sxekmWPK+b2Kq2s0PNbCcXvTIYluuWN9hmytZMRYmpbwt8krHQn8Dl73AU9Z1iYkpqH0O5P4ABpGp6nKIXuv1rreYAFFQiJ6tMMzBuPLK4dgxIvyeyXe9h+WkorwCIs2dDqD7byC5qxxb/f+5EpuTSymuTa2HrqUO/vV2LdBF5RHCbX2/7Ow+UV4SlHo+G8DxGmG88tte077UCvKX1RKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+424zYTCbnK39QLAxSdBNBAsjGebba3u9+iyXnJXYk=;
 b=HaghmbzYUROuoHgOwLtiKmS2cDXqIb4t2qbG2nRQwyVeesiQhWtKGhZSZGJKLTg1GTxPA20iHk/EPzy5Stw5DZKAk2NWVi0nFE0KQCcsAycnrjEfbyaHDVv7FXsZHfglW+VTHeyEJWOdEkw0cr5mx4bWGxIHTQH3xxBEq/HZCb45O8dA90jr41LCx48sCc0V228UOz1jU9xDG0/ZDROJdBUCqlez0LRrVyPzRpqVii8tvNPibEza+fDnDbWnjIVsAhzDnHavtVl0NO8zupXoDRgH65M/tJ0XHEFFrs0IBRPr0tnAWPCuspnBJEAzWTJ/BcfEnbeukpJp9J667I0Geg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+424zYTCbnK39QLAxSdBNBAsjGebba3u9+iyXnJXYk=;
 b=sw9yV+5YMAyIEUC+XOsunZ+N8S7VuLHgsefyqNtH4t+f49XKGpddBadN6txJKxEclsR5432W+CR2S6U+AZHkBADCNrFowCicBf6RjX1CItoWBHLiLNlq47mxkRW8mUhwuPeiIFaGt5XK/1dSysflDfE0FtDvbzN1pO6ey5o3Q4fCnjxUIkIKJ+BOJILcHXzAG3E0Ch0clcLyHiE+7SpLBEBKB4Ev/xaP9ncwZE6xUG/BvXK92HkjKBG5PstxASOZZ9e4ykC2bOkaoyn8EiA9wnCB/yKWnSknI3OFFj54eUmeGe/gCAOxodrzK8CmxAmUmIFTZSPL/Bee6M/EVW55KQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Topic: [PATCH v5 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHchGj73A4kTs3O/EWyR3N/eFmlXrVyue0AgAGCbQA=
Date: Thu, 5 Feb 2026 13:23:18 +0000
Message-ID: <48a84d44-def9-4181-ac67-5aeb31ffb529@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <63892f56f227fae75d78e2ef2ee63887e74c523a.1768293759.git.mykyta_poturai@epam.com>
 <6080438F-DB60-4A50-8264-1CD04761B196@arm.com>
In-Reply-To: <6080438F-DB60-4A50-8264-1CD04761B196@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB10509:EE_
x-ms-office365-filtering-correlation-id: 06901a8d-1468-4595-23f8-08de64b9b9f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dERmUWs3SUlCM1JUN0JyZHlRYWIzZUl0dXhodFdxSzBsVVpsa2R2M0JUWDZJ?=
 =?utf-8?B?bjdRRkNyU1VWQUFqcHJhWkl6N1hnWldFY0ZoQzRNQWpMQmdEdlFYTjJ1b2hG?=
 =?utf-8?B?bFY5NEV4QnBlbUZxZWV2akFrMG5Qb1R5WGw3R2RSTnd4SzRHS0diNW5iOFY5?=
 =?utf-8?B?aHZpTzg5bnRPTG5EdjhPWHVyNG1OQkxEQWlHZllCRVJYRmdTTFJxMHl3QTln?=
 =?utf-8?B?dndsemRQWEs3V09ja0UzbkU4OFFYeS92eHc3QjZpZDgyMDF5VlFwVmtGMEJF?=
 =?utf-8?B?d1EyTW1IOEhKTWt5c1RXRTZqcnkyYlpMT21xYVFiTmQyR0d4WWc0VVplSkZz?=
 =?utf-8?B?cmJ5QTJURFJ2S0ljbFVtTTNvcnI4Rjd0Y2hxd0QweVkvaTB0OFZZMURlRWlm?=
 =?utf-8?B?d0xIV2tla1JubXl4NmsvZCt2eGNlaG51c1pQZkRnRFdyOHlXOGZiVU5Ya3p1?=
 =?utf-8?B?ZVNBZTVkdFMrc1M5SlIxS1M5R0NhTXoxcGVLN0VYdm9aZS9lL3ErNitJQ3pQ?=
 =?utf-8?B?R01KUW45VGNxWHRQdHEwS25GL2t1K2hJTkNScVVsd1hWOGpUS3RHUTlnQ1Ar?=
 =?utf-8?B?dzV3NlpQZndVTkVacko1bnRCdG1xRHhsY2htTXpHdU1Fc1VyaHNrYzN5cWdS?=
 =?utf-8?B?aE50cHIvcjhNTG1JNWhoMVMwT3AvQVdtbXJ2QUxPM1lIcmRlQ3FuRTZrUGpz?=
 =?utf-8?B?WnRnM2RJOXNuUmZWV3RvZ3FVYndHbjFzSytvZEJrZXJGaFVrVm8zd25mVHVr?=
 =?utf-8?B?bUxjbkRGa2xsUUI4UnUrVjNiMm4yVlVacGo5c1F5bWs4Q1lwazJSYm5FbXhJ?=
 =?utf-8?B?UkQ2VytSRlJmK200UWZ2eWlOSXVwcmpCLzF6NDNubzJmWllmeUF5dlF4dkdv?=
 =?utf-8?B?aGY1RzFyYU1xVmU5bVo0MVE4VWdKTkFqWll4MHIwZHN0VWJFSjVtUWp3b3Uv?=
 =?utf-8?B?SGFRc2NsOWpPcnRZcFdOd2NuY1J6RWlmRVRZT3l4TmgrYlovM2pMa3htR0tD?=
 =?utf-8?B?MDVISGR3SXZpYkJ4TWNRKzZzZnFqZTRKNUdEVHk2ak04WUk1bE9YZmthYlh5?=
 =?utf-8?B?WjJDZFpCT25SUDN1RXNaQzIyOVZKUTlGSnpoYnhINllFbHd5K1BIZTNvMDZN?=
 =?utf-8?B?SWdwc0NwWmZ6enJCd3dBRFBPelI1UUt4cUM3VUIwWWkzOHdpbHZlbGhsb29n?=
 =?utf-8?B?d0NVT3pxLzkxT1FTT3FSOTQ2bHNtWGtOL1VrUlVINlg5eFlRSElIWlU2RzNV?=
 =?utf-8?B?NW5sVXVBUEpWVTZQai9MNFVjN1l6aUo4cytNZFNkSWNyR1N1cVgrL2lQdnRT?=
 =?utf-8?B?WW5jSXpORE5BT05WTnBkK3VqVWdhZFQ1ODUyWnN0c3dOaWgzYU9IZEU4L0hs?=
 =?utf-8?B?eFhQR2ErRkx3eU0xVFRONFdJMGxXOEdIb0M3Q2VYRkdZUDZUTmxZcTRaNVdZ?=
 =?utf-8?B?cXRQU0FEVXNuMUQ2WTkzMnlibFhMQm5ENUtnb1Y5eFlMRTNHTjJzQmZrdXpx?=
 =?utf-8?B?ZmpZMVJBa28reVBwbTRITkpJYlBMcklseTcwSm1OWHMxcjRzaFcxc2dtT3pO?=
 =?utf-8?B?azg5K254c1NwWklOVnN6aFIzQ0xTakpFaytLSWVYTkkzUjU5TGY3Q1lLN01Z?=
 =?utf-8?B?cXBtY01DelMwZUFtR0cwTEtJWDJpNjNSaDVGRzFWWjBuMnQ1RUYxYmQ0TlRF?=
 =?utf-8?B?ajJ3YUR5Q2ZVdG8rVGFMeWlpaUROQ3A4Q3d5WEVmaVVCYVNsM3ZQekIzNUJH?=
 =?utf-8?B?Ykk5Mlk5SHF3V3JmVTV5U00zQzBxQStWTDJSV1pMTXp1ZjhGZXJ6WTRFRTR3?=
 =?utf-8?B?VGxoTjhiUURlMlJDR21jdjJ4SnY5SUY1UzZLeUxvV0JLY1V6MzdVRFg0eEhG?=
 =?utf-8?B?Uy9kelJ6NllSOSt2Um42REJHMUg3dHNtdXdJeFV0NDBjN0tUSm55ZERCTUJC?=
 =?utf-8?B?ZU5MODZBNGh4TFM0QWUzYmVma2lrNk5jWVhnc1ZNNFpHZkRwMm1WV1QvV2x5?=
 =?utf-8?B?NnBxK0R6elh0VzB4NnlTVEJwMFlwTVpxaFlKRG1uRmdvV3FaMDc1UjU3MzM4?=
 =?utf-8?B?N3lQaHRXdERNTWRPMDJDTmJ5bHhad3JscC9yaWN5dzBYTjBLYlI4NWp4bHFt?=
 =?utf-8?B?UjloSjVDWGFsekJGQjNxblBWM0g5ZnVHNTRqZ3dtZHEyRCtyQlk3R0RXNldx?=
 =?utf-8?Q?aYtTGzxWEndy4frUQaEeEp4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWN2TEd6REp0UE85TkM0MEhXTGovYlZkckZYMXltbHVnYjVSYkprZ0tKYUp3?=
 =?utf-8?B?TWhka3hQMVhwNzB6a0pMaEl5bzJEVEgzNzFpQzJVbWFzald4bDNZMTJvRU0v?=
 =?utf-8?B?VXRUOVluNElBbnVlby81bmdtbGdYSzBLblVXM3FlcWZOcFFlR1VtTE1uY2xE?=
 =?utf-8?B?Q01DRjdyVTBMa25FUjFwU0pkYmtUT2hmSWNlNWszSk1XUnd4aCtrOFZ1NGwr?=
 =?utf-8?B?eGtIRlJ0TUUwV05wVmE4UnlpSWpreFJuQTNGRlJvOWZGMGtzZ1ZXeHN1dzdF?=
 =?utf-8?B?WWhtaGwwVW1jWi9MaWw0dmRDUXlCdEExZVhzb1hjZ1VEcTBha0JuUlB2R3VV?=
 =?utf-8?B?cVVSQUJHRk80K00yRGMzNE94UE4vU3l4NUFobG84N21vb3Q4OEpHS3FwT1BK?=
 =?utf-8?B?aTk3OWliektiR044UFR4cThzYlQ1MU41MEt1NkdjbVY1Z1Rpd3l6dTdkU2lv?=
 =?utf-8?B?aXVoOE1ROTNtMmRESm9pd09BQ29DQUxKSUxYU29vUXA0QlNLVjY1aitTZHNx?=
 =?utf-8?B?WU9nRDNXbFBWSi8zVVlMMzd4RE9GOUh0b3JMcHJDc0VuL1YxYVljL2tSays3?=
 =?utf-8?B?bVVrVHdNaDl5L3d3eGJuWWMrcXQraHdPSDliMlFUQUxXcnpidjE4Skl3WUtP?=
 =?utf-8?B?T2Rmc1ZaOFRXOWkxY1ZUUTF6OGd3N3JGR2tad1dZRWlpWmRwYi9NOWdGZlQr?=
 =?utf-8?B?aVJwdXZDMGxVZjVUNDNRQnZiVnBuZ0oxV3c4UVZVTytGWm1FM0xDVlZmeDZ0?=
 =?utf-8?B?Uk85WFVMaVNFSW1xODgyUFNDa1lJTlpYeGIyWlM0U2xnZm12dkVHTTZJTDBl?=
 =?utf-8?B?TVM0dkkzNGQwZ09UWGN5QUJxYzQ2K2k2dkt3UjdqR3g1Rm5kRHZERnJBS0Vl?=
 =?utf-8?B?S0xxNWhaWjUrempOLzVPZVo2Sms1QjVnR2ZGbTlXdVZtVEVmMnc1cGM2d3RO?=
 =?utf-8?B?NzJWM0pKbTF4WTFPdFY0eXR5dFNyb0t3cTBYS1p4dyswaXJCaFk5U1pQVlB1?=
 =?utf-8?B?cWRRdGhmeFpQdzlBU2Fpemw3eFl3SnplR0g2STAwL2lldEowS3gxaDVuYnhL?=
 =?utf-8?B?RGhnTnJiSHVVM3A0ekRRc2tIMmxRWnM0Q1BpVlUzSTR2UkJRSUkzeHZQYlNn?=
 =?utf-8?B?VHg3c2d5MmIvRFJ0cU5KQnNkSjVmeWd3dThDWmVuWE9Makl1a0ppa3NaNU90?=
 =?utf-8?B?dThhL2RaTE5XaG4rc1ZnSE5UaVVjMXFuejJINHU4bGZXZ3RVenRsUlNwWmFh?=
 =?utf-8?B?Mzc3Rk9zZTJQMDA3Zks4TnU4a1hvMFFhTVNnWllxekRnakNQZnd4b2ZCZm9q?=
 =?utf-8?B?RXFZNkJvTjM0NHAwT3BBNWJ0a2RBNld0OGlCQWRrOU4vSGgzL0UzcnBZMlhF?=
 =?utf-8?B?dC9xalBTSmVOYjRmbFg1MHUzMG9IRmhJL1Q1NmZWKzE4Nlp6ZkpOZ3YrUVRS?=
 =?utf-8?B?Q3FmMUdxWndxb1FGbThXS0RZSVdIOUZoaXV0ajVCOVc3SWphOHlOVmR1ZTVE?=
 =?utf-8?B?aVNkM0RBd1UvMklGQlFYakxnSEpHL05KWlFpaW5lYVVYb1BYbFhFMGl1bmFY?=
 =?utf-8?B?eFNsVlVGQWw3TS8vT00rOEFKbkxRQ1djQ1FwUUxiTVM3ais1TGQvUFpRYklX?=
 =?utf-8?B?WHpOejUwdFRWTGxhS0M1K0NKT0h1SkQ4eXJQcWZSeVFGbFV4cTd0TUJjSU1y?=
 =?utf-8?B?YVlaSTVoTzg2RGZheVFkaVVPSERSZ2psMGlnSnFvcFNRVm42d0ZNRGp1bGFs?=
 =?utf-8?B?OFVTdHUrZUVXZ3pGWS91UEJqVUltdG5WVUVFVkFFYi9uMjFxR3pTbjY0REpZ?=
 =?utf-8?B?U3FETGVPTnJLamd0ZnhncDVhWXUwL2JVNFd0bmJ1M1VDRVFSUnNTTFp4Ymx5?=
 =?utf-8?B?aHlJN3FTVGpWSlovVmsyRUw1YnlHdWpSTUwzMGp0bTlhaUEvK0JVUGgrTHo0?=
 =?utf-8?B?WFFlZWlOdk54VGk5Q29hZS9BWlJDZHJSbVcwZlBWWTU4QXQ2Q0RNVyt6bHpa?=
 =?utf-8?B?em9rYU5MK0dRU0VJUHBGSmdvemFQcmU3Y0dBaDRST1NNRGlJTE8zajJBbXRB?=
 =?utf-8?B?SU5QY3BnemRjajFDaW5zMS9mZWlVL25JdTZPU0U5UDBRRTlEVTFqSWdnUjYw?=
 =?utf-8?B?ZUNmS01iemh5c2hkTElEejlLcVlQYXZUOGhTV2dheFl2MWVKMWswcStwN24w?=
 =?utf-8?B?VE9LTERQUitCcTBaY3NVTzFNNDRYQU9kN2dhVzRPc3JLMXppOWN3cExNblVu?=
 =?utf-8?B?Q3hyRk1ldjdxMHVtbWNNRys0N1Z6dmFMRUpOMytFRld2YXhGNkFYRTZINGlw?=
 =?utf-8?B?ZHlzV3BJQWNXWThQdVJkSmZvdnV6REJNNnJOZWRBOE1HZzErS0tScFlUalRN?=
 =?utf-8?Q?atGEi6Rz1i2WbW8Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C2D9F4EE0D6084493D1519F82583040@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06901a8d-1468-4595-23f8-08de64b9b9f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 13:23:18.4472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RqZmIkryEykZS1X0ECG1FPBezyrXSiJAWhpV3bicBCP7XvuMqSTQZhthusvJ+Pky12tJPkePP5tFYEocaVepjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A0F56F3324
X-Rspamd-Action: no action

T24gMDQuMDIuMjYgMTY6MjAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+IEhpIE15a3l0YS4N
Cj4gDQo+PiBPbiAxMyBKYW4gMjAyNiwgYXQgMDk6NDUsIE15a3l0YSBQb3R1cmFpIDxNeWt5dGFf
UG90dXJhaUBlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gTW92ZSBJUlFzIGZyb20gZHlpbmcgQ1BV
IHRvIHRoZSBvbmxpbmUgb25lcyB3aGVuIGEgQ1BVIGlzIGdldHRpbmcNCj4+IG9mZmxpbmVkLiBX
aGVuIG9ubGluaW5nLCByZWJhbGFuY2UgYWxsIElSUXMgaW4gYSByb3VuZC1yb2JpbiBmYXNoaW9u
Lg0KPj4gR3Vlc3QtYm91bmQgSVJRcyBhcmUgYWxyZWFkeSBoYW5kbGVkIGJ5IHNjaGVkdWxlciBp
biB0aGUgcHJvY2VzcyBvZg0KPj4gbW92aW5nIHZDUFVzIHRvIGFjdGl2ZSBwQ1BVcywgc28gd2Ug
b25seSBuZWVkIHRvIGhhbmRsZSBJUlFzIHVzZWQgYnkgWGVuDQo+PiBpdHNlbGYuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0K
Pj4gLS0tDQo+PiB2NC0+djU6DQo+PiAqIGhhbmRsZSBDUFUgb25saW5pbmcgYXMgd2VsbA0KPj4g
KiBtb3JlIGNvbW1lbnRzDQo+PiAqIGZpeCBjcmFzaCB3aGVuIEVTUEkgaXMgZGlzYWJsZWQNCj4+
ICogZG9uJ3QgYXNzdW1lIENQVSAwIGlzIGEgYm9vdCBDUFUNCj4+ICogdXNlIGluc2lnbmVkIGlu
dCBmb3IgaXJxIG51bWJlcg0KPj4gKiByZW1vdmUgYXNzdW1wdGlvbiB0aGF0IGFsbCBpcnFzIGEg
Ym91bmQgdG8gQ1BVIDAgYnkgZGVmYXVsdCBmcm9tIHRoZQ0KPj4gICBjb21taXQgbWVzc2FnZQ0K
Pj4NCj4+IHYzLT52NDoNCj4+ICogcGF0Y2ggaW50cm9kdWNlZA0KPj4gLS0tDQo+PiB4ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vaXJxLmggfCAgMiArKw0KPj4geGVuL2FyY2gvYXJtL2lycS5jICAg
ICAgICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4geGVu
L2FyY2gvYXJtL3NtcGJvb3QuYyAgICAgICAgIHwgIDYgKysrKw0KPj4gMyBmaWxlcyBjaGFuZ2Vk
LCA2MiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9pcnEuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pcnEuaA0KPj4gaW5kZXgg
MDk3ODhkYmZlYi4uYTAyNTBiYWM4NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9pcnEuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lycS5oDQo+
PiBAQCAtMTI2LDYgKzEyNiw4IEBAIGJvb2wgaXJxX3R5cGVfc2V0X2J5X2RvbWFpbihjb25zdCBz
dHJ1Y3QgZG9tYWluICpkKTsNCj4+IHZvaWQgaXJxX2VuZF9ub25lKHN0cnVjdCBpcnFfZGVzYyAq
aXJxKTsNCj4+ICNkZWZpbmUgaXJxX2VuZF9ub25lIGlycV9lbmRfbm9uZQ0KPj4NCj4+ICt2b2lk
IHJlYmFsYW5jZV9pcnFzKHVuc2lnbmVkIGludCBmcm9tLCBib29sIHVwKTsNCj4+ICsNCj4+ICNl
bmRpZiAvKiBfQVNNX0hXX0lSUV9IICovDQo+PiAvKg0KPj4gICAqIExvY2FsIHZhcmlhYmxlczoN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMN
Cj4+IGluZGV4IDcyMDRiYzJiNjguLmEzMmRjNzI5ZjggMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vaXJxLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4gQEAgLTE1OCw2ICsx
NTgsNTggQEAgc3RhdGljIGludCBpbml0X2xvY2FsX2lycV9kYXRhKHVuc2lnbmVkIGludCBjcHUp
DQo+PiAgICAgIHJldHVybiAwOw0KPj4gfQ0KPj4NCj4+ICtzdGF0aWMgaW50IGNwdV9uZXh0Ow0K
Pj4gKw0KPj4gK3N0YXRpYyB2b2lkIGJhbGFuY2VfaXJxKGludCBpcnEsIHVuc2lnbmVkIGludCBm
cm9tLCBib29sIHVwKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gaXJx
X3RvX2Rlc2MoaXJxKTsNCj4+ICsgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+ICsNCj4+ICsg
ICAgQVNTRVJUKCFjcHVtYXNrX2VtcHR5KCZjcHVfb25saW5lX21hcCkpOw0KPj4gKw0KPj4gKyAg
ICBzcGluX2xvY2tfaXJxc2F2ZSgmZGVzYy0+bG9jaywgZmxhZ3MpOw0KPj4gKyAgICBpZiAoIGxp
a2VseSghZGVzYy0+YWN0aW9uKSApDQo+PiArICAgICAgICBnb3RvIG91dDsNCj4+ICsNCj4+ICsg
ICAgaWYgKCBsaWtlbHkodGVzdF9iaXQoX0lSUV9HVUVTVCwgJmRlc2MtPnN0YXR1cykgfHwNCj4+
ICsgICAgICAgICAgICAgICAgdGVzdF9iaXQoX0lSUV9NT1ZFX1BFTkRJTkcsICZkZXNjLT5zdGF0
dXMpKSApDQo+PiArICAgICAgICBnb3RvIG91dDsNCj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAg
ICogU2V0dGluZyBhZmZpbml0eSB0byBhIG1hc2sgb2YgbXVsdGlwbGUgQ1BVcyBjYXVzZXMgdGhl
IEdJQyBkcml2ZXJzIHRvDQo+PiArICAgICAqIHNlbGVjdCBvbmUgQ1BVIGZyb20gdGhhdCBtYXNr
LiBJZiB0aGUgZHlpbmcgQ1BVIHdhcyBpbmNsdWRlZCBpbiB0aGUgSVJRJ3MNCj4+ICsgICAgICog
YWZmaW5pdHkgbWFzaywgd2UgY2Fubm90IGRldGVybWluZSBleGFjdGx5IHdoaWNoIENQVSB0aGUg
aW50ZXJydXB0IGlzDQo+PiArICAgICAqIGN1cnJlbnRseSByb3V0ZWQgdG8sIGFzIEdJQyBkcml2
ZXJzIGxhY2sgYSBjb25jcmV0ZSBnZXRfYWZmaW5pdHkgQVBJLiBTbw0KPj4gKyAgICAgKiB0byBi
ZSBzYWZlIHdlIG11c3QgcmVyb3V0ZSBpdCB0byBhIG5ldywgZGVmaW5pdGVseSBvbmxpbmUsIENQ
VS4gSW4gdGhlDQo+PiArICAgICAqIGNhc2Ugb2YgQ1BVIGdvaW5nIGRvd24sIHdlIG1vdmUgb25s
eSB0aGUgaW50ZXJydXB0IHRoYXQgY291bGQgcmVzaWRlIG9uDQo+PiArICAgICAqIGl0LiBPdGhl
cndpc2UsIHdlIHJlYXJyYW5nZSBhbGwgaW50ZXJydXB0cyBpbiBhIHJvdW5kLXJvYmluIGZhc2hp
b24uDQo+PiArICAgICAqLw0KPj4gKyAgICBpZiAoICF1cCAmJiAhY3B1bWFza190ZXN0X2NwdShm
cm9tLCBkZXNjLT5hZmZpbml0eSkgKQ0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+IA0KPiBJIGFt
IGEgYml0IGxvc3QgaGVyZSBvbiB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGRvIGluIHRoZSBjYXNl
IHdoZXJlDQo+IGEgY3B1IGlzIGNvbWluZyB1cCBoZXJlLCBpdCBmZWVscyBsaWtlIHlvdSBhcmUg
dHJ5aW5nIHRvIGNoYW5nZSB0aGUNCj4gYWZmaW5pdHkgb2YgYWxsIGludGVycnVwdHMgaW4gdGhp
cyBjYXNlIHRvIGN5Y2xlIGV2ZXJ5dGhpbmcuDQo+IElzIGl0IHJlYWxseSB3aGF0IGlzIGV4cGVj
dGVkID8NCj4gSWYgYWZmaW5pdHkgd2FzIHNldCBieSBhIFZNIG9uIGl0cyBpbnRlcnJ1cHRzLCBJ
IHdvdWxkIG5vdCBleHBlY3QNCj4gWGVuIHRvIHJvdW5kLXJvYmluIGV2ZXJ5dGhpbmcgZWFjaCB0
aW1lIGEgY3B1IGNvbWVzIHVwLg0KPiANCg0KVGhlIGlkZWEgaXMgdG8gZXZlbmx5IHNwcmVhZCBp
bnRlcnJ1cHRzIGJldHdlZW4gQ1BVcyB3aGVuIHRoZSBuZXcgb25lcyANCmFyZSBiZWluZyBicm91
Z2h0IG9ubGluZS4gVGhpcyBpcyBuZWVkZWQgdG8gcHJldmVudCBYZW4tYm91bmQgSVJRcyBmcm9t
IA0KcGlsaW5nIHVwIG9uIENQVSAwIHdoZW4gb3RoZXIgY29yZXMgYXJlIGJlaW5nIG9mZmxpbmVk
IGFuZCB0aGVuIG9ubGluZWQgDQpiYWNrLiBJdCBzaG91bGRu4oCZdCBtZXNzIHdpdGggZ3Vlc3Qg
YWZmaW5pdGllcywgYXMgdGhlIGNvZGUgc2tpcHMgDQpldmVyeXRoaW5nIHRoYXQgaXMgYXNzaWdu
ZWQgdG8gZ3Vlc3RzIGFuZCBsZWF2ZXMgaXQgdG8gYmUgaGFuZGxlZCBieSB0aGUgDQpzY2hlZHVs
ZXIvdmdpYy4gUGVyZm9ybWFuY2Utd2lzZSwgaXQgc2hvdWxkIGFsc28gYmUgb2theSwgYXMgZnJv
bSB3aGF0IA0KSeKAmXZlIHNlZW4sIHRoZXJlIGFyZSBub3QgbWFueSBpbnRlcnJ1cHRzIHVzZWQg
YnkgWGVuLCBhbmQgSSBleHBlY3QgQ1BVIA0KaG90cGx1ZyBvcGVyYXRpb25zIHRvIGJlIGZhaXJs
eSBpbmZyZXF1ZW50Lg0KDQo+PiArDQo+PiArICAgIGNwdV9uZXh0ID0gY3B1bWFza19jeWNsZShj
cHVfbmV4dCwgJmNwdV9vbmxpbmVfbWFwKTsNCj4+ICsgICAgaXJxX3NldF9hZmZpbml0eShkZXNj
LCBjcHVtYXNrX29mKGNwdV9uZXh0KSk7DQo+PiArDQo+PiArb3V0Og0KPj4gKyAgICBzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZkZXNjLT5sb2NrLCBmbGFncyk7DQo+PiArfQ0KPj4gKw0KPj4gK3Zv
aWQgcmViYWxhbmNlX2lycXModW5zaWduZWQgaW50IGZyb20sIGJvb2wgdXApDQo+PiArew0KPj4g
KyAgICBpbnQgaXJxOw0KPj4gKw0KPj4gKyAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJmNwdV9vbmxp
bmVfbWFwKSApDQo+PiArICAgICAgICByZXR1cm47DQo+PiArDQo+PiArICAgIGZvciAoIGlycSA9
IE5SX0xPQ0FMX0lSUVM7IGlycSA8IE5SX0lSUVM7IGlycSsrICkNCj4+ICsgICAgICAgIGJhbGFu
Y2VfaXJxKGlycSwgZnJvbSwgdXApOw0KPj4gKw0KPj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQ
SQ0KPj4gKyAgICBmb3IgKCBpcnEgPSBFU1BJX0JBU0VfSU5USUQ7IGlycSA8IEVTUElfTUFYX0lO
VElEOyBpcnErKyApDQo+PiArICAgICAgICBiYWxhbmNlX2lycShpcnEsIGZyb20sIHVwKTsNCj4+
ICsjZW5kaWYNCj4+ICt9DQo+PiArDQo+PiBzdGF0aWMgaW50IGNwdV9jYWxsYmFjayhzdHJ1Y3Qg
bm90aWZpZXJfYmxvY2sgKm5mYiwgdW5zaWduZWQgbG9uZyBhY3Rpb24sDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgdm9pZCAqaGNwdSkNCj4+IHsNCj4+IEBAIC0xNzIsNiArMjI0LDggQEAg
c3RhdGljIGludCBjcHVfY2FsbGJhY2soc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuZmIsIHVuc2ln
bmVkIGxvbmcgYWN0aW9uLA0KPj4gICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJVbmFi
bGUgdG8gYWxsb2NhdGUgbG9jYWwgSVJRIGZvciBDUFUldVxuIiwNCj4+ICAgICAgICAgICAgICAg
ICAgICAgY3B1KTsNCj4+ICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICBjYXNlIENQVV9PTkxJTkU6
DQo+PiArICAgICAgICByZWJhbGFuY2VfaXJxcyhjcHUsIHRydWUpOw0KPj4gICAgICB9DQo+Pg0K
Pj4gICAgICByZXR1cm4gbm90aWZpZXJfZnJvbV9lcnJubyhyYyk7DQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4+IGluZGV4
IDdmM2NmYTgxMmUuLmUxYjlmOTQ0NTggMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc21w
Ym9vdC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jDQo+PiBAQCAtNDI1LDYgKzQy
NSwxMiBAQCB2b2lkIF9fY3B1X2Rpc2FibGUodm9pZCkNCj4+DQo+PiAgICAgIHNtcF9tYigpOw0K
Pj4NCj4+ICsgICAgLyoNCj4+ICsgICAgICogTm93IHRoYXQgdGhlIGludGVycnVwdHMgYXJlIGNs
ZWFyZWQgYW5kIHRoZSBDUFUgbWFya2VkIGFzIG9mZmxpbmUsDQo+PiArICAgICAqIG1vdmUgaW50
ZXJydXB0cyBvdXQgb2YgaXQNCj4+ICsgICAgICovDQo+PiArICAgIHJlYmFsYW5jZV9pcnFzKGNw
dSwgZmFsc2UpOw0KPj4gKw0KPiANCj4gSSB3b3VsZCBleHBlY3QgdGhpcyB0byBvbmx5IGJlIHVz
ZWZ1bCB3aGVuIEhPVFBMVUcgaXMgZW5hYmxlZCwgbWF5YmUNCj4gd2UgY291bGQgaGF2ZSBhIHN0
YXRpYyBpbmxpbmUgZG9pbmcgbm90aGluZyB3aGVuIEhPVFBMVUcgaXMgbm90IG9uDQo+IGFuZCBv
bmx5IGRvIHNvbWV0aGluZyBpZiBIT1RQTFVHIGlzIGVuYWJsZWQgaGVyZSA/DQo+IA0KDQpZZXMg
SSB3aWxsIGFkZCB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCj4gQ2hlZXJzDQo+IEJlcnRy
YW5kDQo+IA0KPj4gICAgICAvKiBSZXR1cm4gdG8gY2FsbGVyOyBldmVudHVhbGx5IHRoZSBJUEkg
bWVjaGFuaXNtIHdpbGwgdW53aW5kIGFuZCB0aGUNCj4+ICAgICAgICogc2NoZWR1bGVyIHdpbGwg
ZHJvcCB0byB0aGUgaWRsZSBsb29wLCB3aGljaCB3aWxsIGNhbGwgc3RvcF9jcHUoKS4gKi8NCj4+
IH0NCj4+IC0tIA0KPj4gMi41MS4yDQo+IA0KDQotLSANCk15a3l0YQ==

