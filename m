Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F479B350F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826663.1241002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Rof-0004q6-R0; Mon, 28 Oct 2024 15:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826663.1241002; Mon, 28 Oct 2024 15:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Rof-0004nt-NO; Mon, 28 Oct 2024 15:38:01 +0000
Received: by outflank-mailman (input) for mailman id 826663;
 Mon, 28 Oct 2024 15:38:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MlZD=RY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5Roe-0004nn-3x
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:38:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2608::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b06d85f-9542-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:37:57 +0100 (CET)
Received: from AS9PR04CA0098.eurprd04.prod.outlook.com (2603:10a6:20b:50e::29)
 by AS2PR08MB8999.eurprd08.prod.outlook.com (2603:10a6:20b:5fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 15:37:55 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:50e:cafe::2f) by AS9PR04CA0098.outlook.office365.com
 (2603:10a6:20b:50e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 15:37:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Mon, 28 Oct 2024 15:37:52 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490");
 Mon, 28 Oct 2024 15:37:52 +0000
Received: from Lbd71698a7ddd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 01F1C30A-C40D-47AA-807C-B78EB2D99BC9.1; 
 Mon, 28 Oct 2024 15:37:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbd71698a7ddd.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Oct 2024 15:37:41 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAWPR08MB9100.eurprd08.prod.outlook.com (2603:10a6:102:341::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 15:37:39 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 15:37:39 +0000
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
X-Inumbo-ID: 9b06d85f-9542-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FJR9cXPQkEpBJ5SGvW3jy4KBqq/6POlhKuDLp+4YXegc+RykaDkMQgMiK3SLUB+zJFCnVYzZxPlm4MXAjNz5O4Ef0jpYPBlqv3XSYbhabw7wdGw/jO0TKWx9pvcpdziZ3GUOvWvHHD4PNBMsYfoOa5IH8bPlzZy2/lj4KMDgrKvV1YbZaC2Rnv5+h0r7u7FSQ3wQ3EnSoQ1S+XDUa3R12HEGe0OD7qLhNo1fvMH3D12xC/AM0/+eDEjuIHbQiBtbd3rx8BxmQrucFET80MwItOc7g4umz3chTXjh9XSndcHfxkoZFei6Xm9nOq/55K2sdvubn2/P7w3waQeTklaeUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqfAwqdnG8KYpUzcLVgdgjshztk5TvK+L1SxgKq1Nr0=;
 b=QlihNiiGMJ79/5be3U6xbdym+TImUUykPx0Zsy3Ap89veTh+EWsG2dyujFg5nmZJo/nu59oFXkhWb7Rc9MdBpiv6/DyDwlLYmGYoOdrNbPfGlGaY3tLQ+P5lr8h6RPUQRkFA38dSuXJJyjamLbqsNBHNvx/1y98Hn3FDFH+oMf/PUdTlWV+Sh3XDPywxD04g5u+mVg8fgM9U/9ceJlAoh8R8twEL+M9fuZotFUwxXaqhP3nsku6csQ9XQQqhwezMQl2pIUmBMWXV/vgWDiQLsRPB8/kuPC4O7s1TEAk6RIjP3zC0bl1nJfSJhdIsf3bVFvrEUx1VR9seDxXN/nWAmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqfAwqdnG8KYpUzcLVgdgjshztk5TvK+L1SxgKq1Nr0=;
 b=BCupYI4XimexzEPdWSybMef3gMD+/9jaNaLqm8ih/N4L41VCWiojdGneh/fVn/8u9ToAMdAEX1FLqRwIHZRokyBUA7Q3l6uxReXZlYCaPDZ3U+o4Y1omLZlfLk3l5RzmbSmuUNTquQDWVLcT5XjK9CJ8G8X1tiOKPrIeK1XO5WE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28c5fc9c9b1d86c1
X-TessianGatewayMetadata: 2L2oLYwxs7rBsrf91My4pOzR4F4/LT4JOn9kDeDSAbaywv0wctBqzWSOl/GkUlI0oOkYWrOhPMJthjAKa0JOg105Eg2YEdH+Ej0g//1G0e+oadhVjqboio6022+f0g8FRfcJAeb88Ux8fgVuW0kk8gRcvsE3d/WBjZs1mY5zwPE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAzV96h3EdEjv8xyRaGv1mMXZc0H14NtFXyA5QXF+tFpYfQbBXBQhAoixIDPiz+BRm6ys3CVtkHCjwrXdIYrNorqg23AVIl0Nz5qO9B+9OX5N5wudsOFXAktMpC8gijZf08QDB/O6sdWauL+9PgK7cs7hGytdUoRF9xHwqRqnYBHB7aq+Zr6flItQoNTkKJYAvXE9oS0PxyvxM6vA/5L5LxmbYlA6BQ2sidRkhV/BT9mFy/xUkaixma4mvDJoZYgec4PzbGlvdK6n8E4ql6YkKVSmWd/w4lhRuDJUO67yEcLd07c5Y7XF6xmeB6ppvsDNpXUjz6HDzv9+173SMEZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqfAwqdnG8KYpUzcLVgdgjshztk5TvK+L1SxgKq1Nr0=;
 b=yHuPuTel1XHXjhTnG3cP0fJyPx1sHlYziIFXQht8DjYQUtxEsSAw99tcHjrAtQ+QMVR6l0wHqj8JmozuBCbNXQotPH0GzeDq6LBP2m2KzC0Z6s/ar1P0rm/BL2vnElBp2KVeHwdFRQbr6DdsyyJg7RNaPsw2k38BTy8k8Op0TaJiEbW1y2Ay8K8mTWTiij/kNQyMm9QB7kkVPDwAniJgp0U3W0vu8Iv9y6nefMXuM9+UqcB133dLCZVmo0K9aZvMneZ44hhSASnNvF2kNJhz+uC8kQXG0AtpCmOOWV4d5zR1j1KqL/n3UJ8KRvXARVXAaB+x3Mw3JX1ajyWkNh5o+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqfAwqdnG8KYpUzcLVgdgjshztk5TvK+L1SxgKq1Nr0=;
 b=BCupYI4XimexzEPdWSybMef3gMD+/9jaNaLqm8ih/N4L41VCWiojdGneh/fVn/8u9ToAMdAEX1FLqRwIHZRokyBUA7Q3l6uxReXZlYCaPDZ3U+o4Y1omLZlfLk3l5RzmbSmuUNTquQDWVLcT5XjK9CJ8G8X1tiOKPrIeK1XO5WE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHbKTd3r9ds8GMpC0a1KoGz65CsELKcRboAgAAGbQA=
Date: Mon, 28 Oct 2024 15:37:39 +0000
Message-ID: <9DC23DFF-91FB-4769-8EAF-38150EE192F7@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <DE7DF8D0-2843-4572-A53E-E65D8CB8358B@arm.com>
In-Reply-To: <DE7DF8D0-2843-4572-A53E-E65D8CB8358B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAWPR08MB9100:EE_|AMS0EPF000001A9:EE_|AS2PR08MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b6b865-5bdb-434e-e7c2-08dcf7667caf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?b1dCMytpd2NKR1NZWFEzTmpBcURQSUhubm5pT3JYNmtGaVU0Q0hpRzhOWEJK?=
 =?utf-8?B?YldRWlVsVHlVeGlvdkZqV1JHZEJ3ako4RXlHbEtrT0NERHA4dnQ1U2EvUGt6?=
 =?utf-8?B?S0JWQTg5dGdNRVA0OVE1REdDZmMyZzFDalF6K2U5NUU3cmVFdUd0SVQwSEg5?=
 =?utf-8?B?U2J3bXRzQitHVzZNd1ZOVUUxU2ZrOTNqVm5TV3I1bm9mQUdoYnJvYzIvUUZn?=
 =?utf-8?B?VUdrVURmckI0aW9iL2M0cWtyNUJoQmZoN25mOHMxa0VGMGhiSTVXeXdESWZs?=
 =?utf-8?B?N0VQNkFFYWE0VjVKa3BGRE9WK1lrVFJ5Y2xsdGpFc2NjVExHZ2p4ZDE2ZEt5?=
 =?utf-8?B?aU5rY2tCT1ZZeDJ3MzZIUEtmR1pJc1FzWlJ1aTVVM2lGeE16YWdoQnF4M1ZQ?=
 =?utf-8?B?TXJxY09TaUVGdnU2bDZRdzZyTnkxTUxYS1hWOWtjT3dKUjlxR04waXVUVVhi?=
 =?utf-8?B?Tkc1UWNzWnlYUGs0Ulo5cm5UaGJIekJUSEZqa3EreURGK0NtdklNNmk2ditx?=
 =?utf-8?B?aU4yWHAvODRNaFpJZUoyWldNVG9SRUtKUVU2KzJCVS9YY3U2SVAvdlpHNzMy?=
 =?utf-8?B?V2xJYW9YVisxbVVROHA1Z0pNSWp2elh2d1llZUR1MC9zbk1IekZ3RE14VUxE?=
 =?utf-8?B?ck5jdUI0Q1ZDd1g4WFI4OW8zSTFyZWVFNm1LSHVIZzFWR1RnU2hIL3NXU2Nv?=
 =?utf-8?B?UVh6a2dqQ2hkZno5OTA3dHo1Wk1lbEpwZlNSMFJjcWFjY3BmeitJUU5yVmc0?=
 =?utf-8?B?dmxsZjZaalE5aU14TEJ4RTBwd0dJTkJaNzNvcXYyQXRjMWVJemgvc2JuZVR2?=
 =?utf-8?B?WDloQTREU1N2NVBiaTBEYjRoL1BuemRiRlF4c2hleFVXRnJhM2pZNVYxL2FQ?=
 =?utf-8?B?dy9rTVNPSjY5UDdhaUVPbm1id3FHZDhjVWg3azliODFiNFdXWnJ1UFVoYXZz?=
 =?utf-8?B?a1RiRlRIY1VVMTZnWDVwRVphbHdUcUVjd2krT1MwZHVHSmJTeEVBcXpTK0lH?=
 =?utf-8?B?Nko0Y2srUjRDaTMzY2JZNERnMTJSbG1sUmhPRmpucEJ5RS80b3B1TVY1cFR4?=
 =?utf-8?B?bVpVaVVDRmh4Rk16SW1zWGdPWVhaQkx6eEdoRE9Zc3NtMk45a0diNGdCL2pt?=
 =?utf-8?B?bHBGYkZVSmMvZkJKQStEbGljaXNFS1BBTlIwd29sUVZWeDJhVHRRRFZKaHVv?=
 =?utf-8?B?Tm1BbXQvYjNaYmxNdjZtMFJZMkV4dmpoR3JJZmYvdXZzZkRRN1MyUG9pUmhk?=
 =?utf-8?B?aCtBOHM1RU15cy9JMzIyU1BnV3picm5TOFhPb040ajFaTlNFWHB0R0pmMU41?=
 =?utf-8?B?QnB4WFNYSnFXRWEyMFpPSklCNE5YdVM3eHplaFRKdTA5WWtlTlR5TXRyRHJZ?=
 =?utf-8?B?N1B3aCtkKzM2S2I0NnJBTmNNb1dnUVhNUlE4Q0RBZDVZdkNSclAyMXd6RGh6?=
 =?utf-8?B?S3BwQ1Z4cVQvMit6dWI0S3doa1A2M0ZwY3ZXZGFMWVZnQnU3ellrSElaY0JP?=
 =?utf-8?B?L2h6d1lhK2Y1K1NxMlFBM3ZBcS9pQkZDN0p6ekZkOGRaSTRTWjNpZDlSQ0JM?=
 =?utf-8?B?NXVTazlBWXI0eGloUG85ZFNqMmpLQ0laV1ltb3dlc1FlanRTVW4wancwREg0?=
 =?utf-8?B?L2pPWUNhK1QwQXNYQmV3aStzajlMcFM4M3Rub3Z2bFAyU1hMWHpVUnN6Ym56?=
 =?utf-8?B?amNDK3drWW0vVFEzUFI2S3Y5TzBBWXRlRDZxUmdCS2E0NEZYRUxUQWFNNjdO?=
 =?utf-8?B?ZnBLelFRYm5yQ2JHbVY1c3F0ZHpnb3VHUFR1SFM4T0lMSkU3NkRMZ2VJRlpE?=
 =?utf-8?Q?t9IKye0UXovpMLJZRNEZq8g5bNpcqKWq5rj10=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B22986C2080E154AB8AC5C388C1A1B6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9100
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f880f2c-8956-4b57-f3d0-08dcf7667468
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWVZWncvU0JwVnVuS2pHT0ZYTkVzK09hVURxUS9IVEdUZHJPSi92QWh5ZUpL?=
 =?utf-8?B?cDc4Um9rOHMvc1NSTnlaOTVlQ0dhYkVaaUJQU0NrSk5LdlZFUU5QZ1YweXNM?=
 =?utf-8?B?cDQ0ZUtmQWxIbk5LWkN3eXZRVTBXRzV2QWtCcGtlVXlwbUoyTythemVkU3lY?=
 =?utf-8?B?aGZ2V0JaV05vWERyUERVeW4vN2d1TlNjSm13Qkh0aWJvN0hEc2pScVFHMmI4?=
 =?utf-8?B?Y0dPdVdscjhGNVVPemNDaC9ybDJscitvUTFGRzByUXpuVlJKNW51SDhrMm5S?=
 =?utf-8?B?SEo0OURYMlp2aThEVVZIdmpWa0F2L0VHRkd5OE9MOTdDV3RlMkhPWXBzeFQx?=
 =?utf-8?B?TUxTTHJVQms2Rzl3UkZZWVNnRWM4WDVULzQweVo0YlNJWDBZbkw1bkdFUkFL?=
 =?utf-8?B?eFB3SnZaUjhRWWhRbTBEbTZtUnR1TVB4MHpCUDJ1MFl0WXBBOC9HRHhCNEpJ?=
 =?utf-8?B?RzJlM24zMWdPYytjQk4wNWVDOWJuVkhPMExjQ1pzVVV6Z2NnSStZeFdMc2tW?=
 =?utf-8?B?elBFRWVDRklBS1lHVTl6YVJrV3duZWdpVmlKZWUyV3J1UE1Ed1RWSXRnblhz?=
 =?utf-8?B?VUFWdElYVGVGT3BRaFdVV2FFZzdtSmlDMEVPQUtkeUw4VFQ4UWttaVo3NU8w?=
 =?utf-8?B?NDBBdHBlcC8vKzZJa0hXSmMvYVRyL25OTUlHQUxvVFJpN2JBdWZENWw2REJW?=
 =?utf-8?B?Z1U3TU85YzF5UzE1K2FWTTVjdEFqRmVnOXY5MU14T3djd1FVRjJUdlFZUVVs?=
 =?utf-8?B?a296d0s3SFpVc3BCOTJUcWNXdThxQ2twYlRXT1d5djNMKzVubm03amNROXNM?=
 =?utf-8?B?ZHdlU0NncTZ4YjFrZmlpUU5oanR3YysxK0F2TkJDTzN0UURlT3pIQktvUHdP?=
 =?utf-8?B?S2x5bktBWEpFWGVySzNWZmVSRmk5RitDQXhxU05RZkFGQlFPdE52b3pzamF1?=
 =?utf-8?B?T0s5aFM2UGp3WE9UWjBqOE91T3VlWW96Q0ZRRTJ0R1cxK0NFSzVnWjQrdDU4?=
 =?utf-8?B?ejI2b3VUZ1FKTEs1YVJCK01UNy9uUkJBa29ObHB6UCthaVhqVkpDdGpvNExU?=
 =?utf-8?B?QStzZXo0WC92MFp6aDcwdTBmWWFsZHd5eGlXWkVWbllYSWFmRkp5Qk1xRmtE?=
 =?utf-8?B?U0d2WlBWREJDMVFJTnljL3d4RUxZS1NxaGVHZlpaYUdzMEZaK04wUVhidjI0?=
 =?utf-8?B?TnpXL3A5ekJkalZ1ZUltMVRKWkhqeFBQZ0dCaURXbUkvVmIzVXJ2b0x5S0cy?=
 =?utf-8?B?ekV4UzNpQnA4M1kzVkp4dW0yNk96dTRkaVRDQWU2SmVxa3hkUHlWTHhHUHlV?=
 =?utf-8?B?MGIvcHB5REZBdEJ6OXpYRjRnTDM0eDFKOVZoNlRUMWdRWWl0TFRLdzhQOUVn?=
 =?utf-8?B?MGFVbTIzK3o0UWVvb1ZXQkZHcm94UGNQV3RmNkE1MnM2R2VGRUU1V0hGNnRK?=
 =?utf-8?B?dkRnTy9LL0x6cjhORDAxRk80SlJVc2E1SWVvOTFoUU5CUzQvOVRYNnlQb1pX?=
 =?utf-8?B?NjdaWi9ZZW9xZVMvVklKU21PWm92OUsxUHh2TlFJWGMvU2VjeTVxVU9LMXRG?=
 =?utf-8?B?TWhQWjhPK2pERCtlS1JZeEdoQS95Sjc1ZkRkeGZyTWtYdTd3akJBc2NXYXhX?=
 =?utf-8?B?ck54NDRoSnpySTJ6cVZjalN0dFRnQ2t6djBkM1lxcTdOOUdVTlVWelVjQzZQ?=
 =?utf-8?B?cHM4MHd6YWpTVkdKVERVRlVyTlBQbmozbHN4blgrY3dVa1V1UzZ1eXp4aEt5?=
 =?utf-8?B?dmlUZHBjRVU2L1E4UE9KaVpVSFM5bUQrSDNkbThrT1FRMXVqekxhR3c2bzg4?=
 =?utf-8?B?OCtmbDZZc2lHN250dzg4M1NaaUE3dUtmelRGZk9FTXZwRTlkVnRJUmpDV3pJ?=
 =?utf-8?B?MmFzYkdpMUJpa0QwOU00NnA5NmVGa0hTcXR4MzZlU0k4Mmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 15:37:52.9770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b6b865-5bdb-434e-e7c2-08dcf7667caf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8999

SHkgQXlhbiwNCg0KPj4gKw0KPj4gKyNkZWZpbmUgUkVHSU9OX1RFWFRfUFJCQVIgICAgICAgMHgz
OCAgICAvKiBTSD0xMSBBUD0xMCBYTj0wMCAqLw0KPj4gKyNkZWZpbmUgUkVHSU9OX1JPX1BSQkFS
ICAgICAgICAgMHgzQSAgICAvKiBTSD0xMSBBUD0xMCBYTj0xMCAqLw0KPj4gKyNkZWZpbmUgUkVH
SU9OX0RBVEFfUFJCQVIgICAgICAgMHgzMiAgICAvKiBTSD0xMSBBUD0wMCBYTj0xMCAqLw0KPiAN
Cj4gTklUOiBhbGlnbm1lbnQNCj4gDQo+PiArDQo+PiArI2RlZmluZSBSRUdJT05fTk9STUFMX1BS
TEFSICAgICAweDBmICAgIC8qIE5TPTAgQVRUUj0xMTEgRU49MSAqLw0KPj4gKw0KPj4gKy8qDQo+
PiArICogTWFjcm8gdG8gcHJlcGFyZSBhbmQgc2V0IGEgRUwyIE1QVSBtZW1vcnkgcmVnaW9uLg0K
Pj4gKyAqIFdlIHdpbGwgYWxzbyBjcmVhdGUgYW4gYWNjb3JkaW5nIE1QVSBtZW1vcnkgcmVnaW9u
IGVudHJ5LCB3aGljaA0KPj4gKyAqIGlzIGEgc3RydWN0dXJlIG9mIHByX3QsICBpbiB0YWJsZSBc
cHJtYXAuDQo+PiArICoNCj4+ICsgKiBJbnB1dHM6DQo+PiArICogc2VsOiAgICAgICAgIHJlZ2lv
biBzZWxlY3Rvcg0KPj4gKyAqIGJhc2U6ICAgICAgICByZWcgc3RvcmluZyBiYXNlIGFkZHJlc3Mg
KHNob3VsZCBiZSBwYWdlLWFsaWduZWQpDQo+PiArICogbGltaXQ6ICAgICAgIHJlZyBzdG9yaW5n
IGxpbWl0IGFkZHJlc3MNCj4+ICsgKiBwcmJhcjogICAgICAgc3RvcmUgY29tcHV0ZWQgUFJCQVJf
RUwyIHZhbHVlDQo+PiArICogcHJsYXI6ICAgICAgIHN0b3JlIGNvbXB1dGVkIFBSTEFSX0VMMiB2
YWx1ZQ0KPj4gKyAqIG1heGNvdW50OiAgICBtYXhpbXVtIG51bWJlciBvZiBFTDIgcmVnaW9ucyBz
dXBwb3J0ZWQNCj4+ICsgKiBhdHRyX3ByYmFyOiAgUFJCQVJfRUwyLXJlbGF0ZWQgbWVtb3J5IGF0
dHJpYnV0ZXMuIElmIG5vdCBzcGVjaWZpZWQgaXQgd2lsbCBiZQ0KPj4gKyAqICAgICAgICAgICAg
ICBSRUdJT05fREFUQV9QUkJBUg0KPj4gKyAqIGF0dHJfcHJsYXI6ICBQUkxBUl9FTDItcmVsYXRl
ZCBtZW1vcnkgYXR0cmlidXRlcy4gSWYgbm90IHNwZWNpZmllZCBpdCB3aWxsIGJlDQo+PiArICog
ICAgICAgICAgICAgIFJFR0lPTl9OT1JNQUxfUFJMQVINCj4gDQo+IE5JVDogc2hhbGwgd2UgYWxz
byBhbGlnbiB0aGUgdGV4dCBhZnRlciB0aGUgY29sb24/DQo+IA0KDQpQbGVhc2UgZm9yZ2V0IGFi
b3V0IHRoZXNlIGNvbW1lbnRzLCBJ4oCZdmUgYXBwbGllZCB5b3VyIHBhdGNoZXMgYW5kIGV2ZXJ5
dGhpbmcgbG9va3MgZ29vZCBpbiB0ZXJtcyBvZiBhbGlnbm1lbnQsDQpJIHdhcyBtaXNsZWQgYnkg
bXkgbWFpbCBjbGllbnQuDQoNCkNoZWVycywNCkx1Y2EgDQoNCg==

