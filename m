Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EBE9BF15B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 16:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831215.1246414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hlh-0000VY-OE; Wed, 06 Nov 2024 15:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831215.1246414; Wed, 06 Nov 2024 15:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hlh-0000TH-KX; Wed, 06 Nov 2024 15:16:25 +0000
Received: by outflank-mailman (input) for mailman id 831215;
 Wed, 06 Nov 2024 15:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC+v=SB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t8hlg-0000T2-OS
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 15:16:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f403:260d::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13e4ad9a-9c52-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 16:16:21 +0100 (CET)
Received: from DUZP191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::22)
 by AS2PR08MB9497.eurprd08.prod.outlook.com (2603:10a6:20b:60f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:16:18 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::3e) by DUZP191CA0038.outlook.office365.com
 (2603:10a6:10:4f8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 15:16:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Wed, 6 Nov 2024 15:16:17 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490");
 Wed, 06 Nov 2024 15:16:17 +0000
Received: from Le28f87d258bf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C28A3136-794A-4B43-B235-D162164CAE34.1; 
 Wed, 06 Nov 2024 15:16:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le28f87d258bf.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Nov 2024 15:16:06 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GVXPR08MB10864.eurprd08.prod.outlook.com (2603:10a6:150:154::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:16:03 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 15:16:03 +0000
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
X-Inumbo-ID: 13e4ad9a-9c52-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwZDo6NjAyIiwiaGVsbyI6IkVVUjAzLURCQS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjEzZTRhZDlhLTljNTItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA2MTgxLjEwMjMwOCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bXhDzUyh9YKXoFg91T0zOFDFjmdpdtK3RXDGsTqdUEBqZc6wgG8QPPvihQjKt59DKzSa5G9oymmt9cK5YwUTXlB4LvM0a4tQNWvhaIA9MZW5mfwxRQGHr3/xePyU+Dlc6suorkkE2uJ+s3ZdPrqwe9bLfAJsWp1xa0DhjMp2iTTdOvHVykZBEKREx6DtUWZob2T6w/+Ad3J+1hNvqn+ztES0BUBGc7kZ+RTDLM9vMt0XQdOkLfnhaB1iq6CAVofrS8q9FUHTxW8tEaLmwbqxA1mbQHhvEi/Y46MvWCifGQ3iH39JyHys23B5D4Huwnz6dm+up6oLzG6prH1Ky0gaZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/pjgpsfRcPJYNsV8CBJvA2QeU9Wg8xy+5+rH2Ywsec=;
 b=F2OoOvzjaXFke4MwH5B0Uwf2nsFSkWkC0rKTNrP1J++7og2n3sB4JTbXR65eoBoW+HM4fywbHASyTGYzoHVnVfw4t1BBk8IiGlV0TJIBX1GExpN8jR1lt55YzQ2+h3l/mjvEjlgaMOOeo8cBOMYNVf604vJHKat8Xslj7+uSVeaasSFOmAQwzwoRxtwETnSfrY1eExFihfNxjrkQWNhoqgaCbZnnpdBO7sFUx+HEGgRP+YtIoos3m80XKxvE0DkebYQ8VKYiowT34dnNyAR/b6X03/4XT2DcjiacsbvTlIxK0C918CQ6vUBWIwaiT67r7ZTG9J2kqq8dg/Q9Viwg1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/pjgpsfRcPJYNsV8CBJvA2QeU9Wg8xy+5+rH2Ywsec=;
 b=aP8ZDispyNoXpNHjEyPgVzg94hv+ZzVhOe6DKxcrFzmqz/D+npcAxIZibrQOw7Rz0053fYXsG94fL2zA6ll/K1rrb5mKOrwWsO4VP7TYDbqayHpl7UX1+6J+lBYkN0o0MVqQOd95IebQhwlwDlcyNc5LMjcaIveLuOOHfN4CxvY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9eae788475530d32
X-TessianGatewayMetadata: 6q5RTYDpzHKSdmw/sokLD3E0QU8ept8Hn8/XeEfOMKVy1/Lg6xTM2ItlbuScTG5cZVDjUrQ+D6GuWLuK0BX788P3oZx9QunPWLaI49wJ8/GYC8c6UWDId0jH4BUj2AQ+S9lcMojsBV6z//W6KPQIO+nYQX5pyk3ZGrLYI7psFIE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZ+ovt54Q+xzt1EkSuMIoxdcmO8DxWatAOh1FS7lFekFV7mwxXXGLvy6L07c9RsCHLG02YKAEk6J8KaDNMVn+sbmLKom4c4NNeDSRsGiHej3OJFvL/aOaoFOUuaIrSs8Drs731jubqkkbavcUEH9LBc9KWjpmvqr/nDbZHHOLjZYSE2ssLOWsH/7zs4UAWga/KduLHcaS7eWkNbbmZk3YnqUMPKmJAQxTea3R0Xcm5gYV4/qgu6CIxkXYE8Uf4pN339rv40TeRUjRC+bs+HWtqqqOWQ4PxRDAe/57F1nEsszSHlcdA1LmAV8I4jRxUyM36C8+yvB0AFpTGl2ry/S/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/pjgpsfRcPJYNsV8CBJvA2QeU9Wg8xy+5+rH2Ywsec=;
 b=EAC0WTdk/lk7HlPmNESqOHk5HgVTEKuVTLM2CIt+yCQoBGLoVncMtk78UYXVku0oswQL8A/yrBlyDz7YX6LZ/9RJTWr0v3uVEFbLcB7rpXOEUzPXaYLWqJCf3IDnYyShXKkurcGkvDTYBLwJzvA9sKmJxQbDXxP4fYhTEGHEe5HZQ5a9hUzIHD3HQ2cXciU2mAKK1gCiLhInkRwu35nKyEaNRABOjb5Bp5vq/iuqOlTyNRC/t+QQZQVBE7FeG8oTQRsC8pNe81fFAn8rf0z5VpTWjluW4oCQaMv/7VVO4z9hoTsf8BaJWB73HK6h7JGl/G6CgKdJRh6X740M+qDDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/pjgpsfRcPJYNsV8CBJvA2QeU9Wg8xy+5+rH2Ywsec=;
 b=aP8ZDispyNoXpNHjEyPgVzg94hv+ZzVhOe6DKxcrFzmqz/D+npcAxIZibrQOw7Rz0053fYXsG94fL2zA6ll/K1rrb5mKOrwWsO4VP7TYDbqayHpl7UX1+6J+lBYkN0o0MVqQOd95IebQhwlwDlcyNc5LMjcaIveLuOOHfN4CxvY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Thread-Topic: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Thread-Index: AQHbMFGwb2V2aTQ740yGxnKF6IdbXLKqWowAgAACWoA=
Date: Wed, 6 Nov 2024 15:16:03 +0000
Message-ID: <FA4FF581-69EA-46C0-A0D4-D327B167A4D6@arm.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
In-Reply-To: <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GVXPR08MB10864:EE_|DB5PEPF00014B9A:EE_|AS2PR08MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 01942754-a6d6-423b-86d8-08dcfe75f64f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d2NvM3psZmxPZEYwMy81bTREZ08xUThLb01JOWJCQlg1VUtWdVZNT25UY0RQ?=
 =?utf-8?B?eTVpOWx5Z0ZaeGN6MXZuMk4xU2dWZ3NwM2FFcFZyWXdaMCtXSUJUT3k3aVNl?=
 =?utf-8?B?bmhMQndkZnRidUZ1ZUlqQ1B2RWZiOUFYQzBwUjFYOFFUN2dMU0t4cG1QeWdm?=
 =?utf-8?B?dDVCcjRFakU1NjhycmRoZmhxL3EvM0NnNXlzb21acDBDQ2VCTWpOY29XUWYz?=
 =?utf-8?B?MTVxQXdRNGJYemtEVnA3ZjhtbkwzbGhtUUN5dFFwNTNmRmMxRnVrZjQycHlP?=
 =?utf-8?B?T3ZXTW5ncHZlVnBjNTlaQlAzU1dNQUdudmZZS1IwZFRuVjMvRFZCQSttMjFr?=
 =?utf-8?B?YWhjaWJPeE8rUFpkUThBWUMybGJoWktvYW03VTZyZlpmWnkxbXh3S1FGY0Va?=
 =?utf-8?B?ZE5TNFBGc2VMUDhCNEpjTFFnaUFqdk1HRXdkd29FK3hxVk9TWmZFUDJ0QldH?=
 =?utf-8?B?bnQxVVpKamJNL0hwbG5xYWE0M0FWTFk2aExtUDdoVVpiWkpFT284NldLV2N6?=
 =?utf-8?B?cHZWNDNFaGMveG01cGVKc1RBWWx2ZWZ2MG1ETUJQajdGSWQ3d2FPQk1CTVYv?=
 =?utf-8?B?QzhHalZBVFNiSDNma1haUGNTN1U3TUhWS21iVkFOd2hvOWRVMTFidVdxeHFT?=
 =?utf-8?B?QmpNbVZWWFRValdxNFpFUFFlQkd3VmhiMWR6RnBhWWVWK1QrQWwxNEZCQVJP?=
 =?utf-8?B?VUcrOHdaOWJYK25mYzNKQTF1SnpXaEFDYTNLdTQ2MHBTWm9sMi9LSVVNRzk2?=
 =?utf-8?B?S3RIY2hoUk1VZTIrOTNWOTZud1NZMnlhWFZlQVp4dHBMcHZJbnFLa25FY1gw?=
 =?utf-8?B?aU9LMEVTQ2dpK0w4TGRhY1ZmdGt5REVlOHJUcS9pSFhTSWtXSmdrSXhsVDdo?=
 =?utf-8?B?Q21JdXY4QjRxelQ2Z2MzMm1hQkdIbkgxQnpBUEpGc3F0dlNnSnlkRmZvQndG?=
 =?utf-8?B?UEdLalFwSjZaSVE5WG9PUUVuY0dXdXd3YWtVbHVqMytqM1duc3FsOGhqYXZw?=
 =?utf-8?B?WTJmQXJYSDFTSXhralpnVmo5Q1dMajZOYjdWSGFYSlNDOHJrZ2pnSW1qVVMy?=
 =?utf-8?B?QytoL2hsSHNNOWNka2MzQTVma241bFpnNCtpRzJyL1dWdlI5Q1dacTZPL29F?=
 =?utf-8?B?RjdQTkhyMlNtVkl2ckw3WWVodktPRG1NdGJKYzlRNkJ0S2lGbExndlp3cXlE?=
 =?utf-8?B?WGIySFpaaVRJaVBqa2dQYWxZWWsrT1lYb0FzRzY2R0tFZ29qWW9RKzJGWEdX?=
 =?utf-8?B?TFV4dmdVNG43WHlNdzV4eTkrVklMR053a0U3czFETWpkbmZTZU5jcE9nanM1?=
 =?utf-8?B?MDFaaW8ySmQzVmNDTVFvQldHY2pXRkNuUHJEUjdLaEd0aXl6SFFZc2tJcW13?=
 =?utf-8?B?MVp6SFhWa05oRzdKd2dIMHpuZUtrSC9KVnBiNWRGQkxYWkVVdzJzcVJHWWFj?=
 =?utf-8?B?TTVZL1lEeE9leEtqUStFQzVVcDk0UGZuMVBqclE0QVlzelZ0MkJpVThQMGtK?=
 =?utf-8?B?dDFHc0F4anZFWXlDQjRmMlVEUENLN1lVVDdjSE5xMzhQY0dJWjlFUW4zM1hn?=
 =?utf-8?B?eENleUh0Tmo5ck9sYTduMktYOVlYSklkOTBSWDB2aW5DRXJFa1BSZlNjMlAz?=
 =?utf-8?B?SnNwWGI1Q1ZER1JtajJieDl6QnR3dmpFalBUWWhJQzNmR01tTzIwRGFaODBa?=
 =?utf-8?B?WkgyL0Jhc0Q1NHpwL2tsUlVGcUp4bmxaQXBweFBhSTMwUjc5UGlqUHdsdVV4?=
 =?utf-8?B?cWlCSHlvWnh1RGVVSHJTNWpTMnFlMmFLRWpyb290eURIaUozL0pWYVJ6Sm44?=
 =?utf-8?Q?V7Qb1RaU1RIicfelbPanKBW2Pa3ly3AlXOU+k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <064EF56B40F1E748B97B0BD7C6FAD622@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10864
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87e533de-e7c7-4ca1-2281-08dcfe75edd0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTN2ZVB1ZjBuNEc0Zm95Z0pDdnRSaUJDTk1vTThSS3Y5a1Flazg1cDdXcFdv?=
 =?utf-8?B?MU44T2tRdTVvMEt5RDZ2Qkh5MHc1eHB2YXIwNkpNakR5clYzRkZuZWRlVElZ?=
 =?utf-8?B?bUJrSGcvS0UxVTZNR1pBejYxQ0NSQ2tiQVFYcDBIeEE0WWVuNUEzN2hvdzdG?=
 =?utf-8?B?a1h1aXB2OHFVZnMvWmpoVHdsRTVrVnUrNWM2dHVGcFdDdlNpa0E2ajZDakZI?=
 =?utf-8?B?ZE9Ob3B3ZW1QV2tWRU1TbUsza29VV3NlOTN0K0doWHJwaHJvUTgraU85ekdG?=
 =?utf-8?B?enlwUHlvOHIxM0JTZ3lQdTBoSVFNVGR6MTBDSFZsVzlSNXZqOWo0dmpDQ29G?=
 =?utf-8?B?TTBpeS8rSUJCVHBRSUEzdXhhajNiQXdHMDQ3Q2NvZUgzdDJ0N0xjUTJpZFlL?=
 =?utf-8?B?N0p4U1RpelYwK3FiRFcvMlZnK2FhOTdqYW5aekpLYUJIRUk4SVYrOS9vTjZ1?=
 =?utf-8?B?NnpSZkxyUWYwQ2w4MVd4VEU4QjYwU3p1UkREaEtRTnlWR2hWbitaTkZTZ2xi?=
 =?utf-8?B?Y2xuOGtDTThnMUxpaDY0NEpGaUxSUG1NTGpDM3FRcmhHOTVOYnZSamYxUXFm?=
 =?utf-8?B?cHR4eUorSVRsd3NVTWRwS3pMVG5URnN1M1lUMGF1REYwb01NbWhGd0xJZTBB?=
 =?utf-8?B?VFJMVVlHdEdlWnlEcFVuN3p5OGJQZjlma01OMHJmTnMwNHZ2N2FtVEp4NlE3?=
 =?utf-8?B?RkJQbVF6akIxWkFsbS9EL3ZTWjBXVUt4bXYxRG1pT0lDa2VuOGZOUHMvaEhp?=
 =?utf-8?B?eGc4ZlpNR1MvZ0l4cytCVSt3a1Iva0tWOC9vM2o5Vzc4SHM3WE1pZXYzRjJ0?=
 =?utf-8?B?cklvaXhjb1MxOXlUSytDMlJxZHBtZTJ3U2w5VnpEU3dDelFWNnM5WDdlVWdF?=
 =?utf-8?B?YzBhaERQb2JaVXRQMmYwd0dxeTJOb1ROZXpVUWd0TjR4dHYyMHFHenlOS2ti?=
 =?utf-8?B?eEY1cGJ3ZVJHK0VsdnVyaHhLSmRBRXFqRXVjeTYvSGpkb3JMVW5uaHVJc2xh?=
 =?utf-8?B?cXJHbVBHVnh5ejh6OVVlODBFelg0R2p2YXdLT1JyN2tNMVhRQmJwQkdSaDBK?=
 =?utf-8?B?UnpWQS9rK0l2WkZmYTJ3UWRXSEM3QjVqNit0MUtjMTQ5Y0lwbmZzSkFDRzdk?=
 =?utf-8?B?bzVkeEJIaWFZdXZTOFoxdTBkSmxJcExoejhsOXlpb1hzSndXV2pkWE5EZzBV?=
 =?utf-8?B?UERtRGtySTNhS3ErV3NMVGl0S2VDUUwzTWJKWDVUam9IR3MvSUtBRWVSTEdr?=
 =?utf-8?B?c0FJOXFjVlRNU0VWeXJaNVhOK2hBZ1JIVlVkcENESGN0NDJCODZxN2s5aGRU?=
 =?utf-8?B?NzFmdjVEdWdHYzBGaHh6WFZManhjSWhzNEp2VitvSlRZamJxYjRjZ0MxWVZy?=
 =?utf-8?B?QW9Yam9kNnR5UmJyRlA3M1g0WUdraVA5eTd2eklrNm92R2ZxblVIcnVNNDJI?=
 =?utf-8?B?N1RXRVp1N3Mra0dBMUpSTTZIV0V5enJESVMxTU1Pc0Z1dHN3NHliWS9OYWRy?=
 =?utf-8?B?TkFJelZBd0pheHFuMDZhaFp3bjByZ3ZZVFRid1BMMWF4RGZxVGJkWFM4RUJK?=
 =?utf-8?B?aXdiaVh5L0hVQnNwUFB3SUJSYWxkNE51S0VEMzhzTVpRb0hKT2s0S1hBWUxj?=
 =?utf-8?B?WnF5TXE2MitpMkdQOUt3ckRkQ0ZEd3BMYnB1eDJWZU1mbUpBZHdtb2Ivdnor?=
 =?utf-8?B?M2xXYnE5Tk5UUS93NkRwdXEzTEN1eC9hUlc4aDBNYkdrNmlVZnBCZXZrUlFy?=
 =?utf-8?B?d0ErWUgzcUJGblYwTUlLWDJ4Y0g1TThHTGZkcUxCbU9tOUJRYitGRFhOemRx?=
 =?utf-8?B?WGtGbWsxMTZJSkJ6amVoUnRNbW5memdwNG12MVUxWmdaQThkZnVqY1l5UUEy?=
 =?utf-8?B?eUpGNk9uYThLY1lJSkt5NFZJSU9mbzRIMnZjNmw3WDlIUHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:16:17.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01942754-a6d6-423b-86d8-08dcfe75f64f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9497

SGkgTWljaGFsLA0KDQo+IFNvIHdlIGhhdmUgMiBzZXBhcmF0ZSBpc3N1ZXMuIEkgZG9uJ3QgcGFy
dGljdWxhcmx5IGxpa2UgdGhlIGNvbmNlcHQgb2YgaW50cm9kdWNpbmcgTUVNQkFOS19OT05FDQo+
IGFuZCB0aGUgY2hhbmdlcyBiZWxvdyBsb29rIGEgYml0IHRvbyBtdWNoIGZvciBtZSwgZ2l2ZW4g
dGhhdCBmb3IgYm9vdCBtb2R1bGVzIHdlIGNhbiBvbmx5IGhhdmUNCj4gL21lbXJlc2VydmUvIG1h
dGNoaW5nIGluaXRyZC4NCj4gDQo+IFNoYXduIHBhdGNoIGZpeGVzIHRoZSBmaXJzdCBpc3N1ZS4g
QUZBSUNUIHRoZSBzZWNvbmQgaXNzdWUgY2FuIGJlIGZpeGVkIGJ5IGJlbG93IHNpbXBsZSBwYXRj
aDoNCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvYm9vdGZkdC5jIGIveGVu
L2NvbW1vbi9kZXZpY2UtdHJlZS9ib290ZmR0LmMNCj4gaW5kZXggOTI3ZjU5YzY0YjBkLi5kOGJk
OGM0NGJkMzUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvYm9vdGZkdC5j
DQo+ICsrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvYm9vdGZkdC5jDQo+IEBAIC01ODYsNiAr
NTg2LDEwIEBAIHNpemVfdCBfX2luaXQgYm9vdF9mZHRfaW5mbyhjb25zdCB2b2lkICpmZHQsIHBh
ZGRyX3QgcGFkZHIpDQo+IA0KPiAgICAgYWRkX2Jvb3RfbW9kdWxlKEJPT1RNT0RfRkRULCBwYWRk
ciwgZmR0X3RvdGFsc2l6ZShmZHQpLCBmYWxzZSk7DQo+IA0KPiArICAgIHJldCA9IGRldmljZV90
cmVlX2Zvcl9lYWNoX25vZGUoZmR0LCAwLCBlYXJseV9zY2FuX25vZGUsIE5VTEwpOw0KPiArICAg
IGlmICggcmV0ICkNCj4gKyAgICAgICAgcGFuaWMoIkVhcmx5IEZEVCBwYXJzaW5nIGZhaWxlZCAo
JWQpXG4iLCByZXQpOw0KPiArDQo+ICAgICBucl9yc3ZkID0gZmR0X251bV9tZW1fcnN2KGZkdCk7
DQo+ICAgICBpZiAoIG5yX3JzdmQgPCAwICkNCj4gICAgICAgICBwYW5pYygiUGFyc2luZyBGRFQg
bWVtb3J5IHJlc2VydmUgbWFwIGZhaWxlZCAoJWQpXG4iLCBucl9yc3ZkKTsNCj4gQEAgLTU5NCwx
MCArNTk4LDE0IEBAIHNpemVfdCBfX2luaXQgYm9vdF9mZHRfaW5mbyhjb25zdCB2b2lkICpmZHQs
IHBhZGRyX3QgcGFkZHIpDQo+ICAgICB7DQo+ICAgICAgICAgc3RydWN0IG1lbWJhbmsgKmJhbms7
DQo+ICAgICAgICAgcGFkZHJfdCBzLCBzejsNCj4gKyAgICAgICAgY29uc3Qgc3RydWN0IGJvb3Rt
b2R1bGUgKm1vZCA9IGJvb3RfbW9kdWxlX2ZpbmRfYnlfa2luZChCT09UTU9EX1JBTURJU0spOw0K
PiANCj4gICAgICAgICBpZiAoIGZkdF9nZXRfbWVtX3Jzdl9wYWRkcihkZXZpY2VfdHJlZV9mbGF0
dGVuZWQsIGksICZzLCAmc3opIDwgMCApDQo+ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiANCj4g
KyAgICAgICAgaWYgKCBtb2QgJiYgKG1vZC0+c3RhcnQgPT0gcykgJiYgKG1vZC0+c2l6ZSA9PSBz
eikgKQ0KPiArICAgICAgICAgICAgY29udGludWU7DQoNCk9rIEkgc2VlLCB3ZSBza2lwIHRoZSAv
bWVtcmVzZXJ2ZS8gZW50cnkgaWYgaXQgbWF0Y2hlcyB0aGUgcmFtZGlzaywgZmFpciBlbm91Z2gs
IEkgZG9u4oCZdCBoYXZlDQphIHN0cm9uZyBvcGluaW9uIG9uIGhvdyB3ZSBkbyB0aGF0LCB0aGUg
aW1wb3J0YW50IHRoaW5nIGlzIGp1c3QgdG8gdW5ibG9jayB0aGUgdXNlcnMgZXhwZXJpZW5jaW5n
DQp0aGlzIGlzc3VlLg0KDQpDaGVlcnMsDQpMdWNh

