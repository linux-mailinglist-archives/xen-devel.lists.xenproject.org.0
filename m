Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJxiAremcGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 11:13:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC45501D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 11:13:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209558.1521531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVCr-0000IW-G7; Wed, 21 Jan 2026 10:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209558.1521531; Wed, 21 Jan 2026 10:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viVCr-0000Fb-CT; Wed, 21 Jan 2026 10:12:57 +0000
Received: by outflank-mailman (input) for mailman id 1209558;
 Wed, 21 Jan 2026 10:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qw9H=72=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1viVCp-0000FV-HR
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 10:12:55 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfd934a7-f6b1-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 11:12:53 +0100 (CET)
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by AS2PR03MB8772.eurprd03.prod.outlook.com
 (2603:10a6:20b:553::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:12:50 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb%4]) with mapi id 15.20.9520.006; Wed, 21 Jan 2026
 10:12:45 +0000
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
X-Inumbo-ID: bfd934a7-f6b1-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vgl+hc4/FuBLefjGA53Ho2eunNAVWZiHGP0lUyXooh1+bTErtoBHHQsptc4sCkdaE06542bM88lLZ+4pmKFrE/Xrc2MmScrMHlKSw3zbDPVtj3tVvojuzuKsuvl4fJZINIoS6ZKM1pS2JWlFhOApqYtDztlcF8t8ix2yjxUPJpaJAt/FiLbvh/ZFUIslhtRhfoWiyCl3/rVf2k5KcoBX2iDF+YspkKrdui9rtqNPQAdyFtQGGy2nMEBhlpVdy8MsRlTYlG99IjFrYV8zhH0zlEnWi2ZaXtc22BopRAaX0anUuMm2LhpiFCIZ85oykwo+Y5zb8lRyNJzb04DwH/WE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Jjdh5X98Iwpaq5E6u5s/W4d3SPNINX+DlilZ/kV/7Y=;
 b=JNyxerMe9wQWlgVQ/xLknhFnQCwu40Cc9EOcnX0cF4gdMvF/vnkwjESy5oMConrrBuBdN5Tt4ZPveOc7rwfQbBWNn6sfbOuOxARFS8sUpZFDPnN0N2aFX1NWs7k/XpePHc9p0sysF1DU0+gub8UWbFuDinMKoAlZ6sKvaZZgq2pkUEtayznZ5qiAAafr3n5UxNNqMnLeaZ8BnWqNXWCBgzGiHaAdcMUtiGyWvcF8q32iCT8J4dt/c6XD3fKJpNo+1XeNxrgIYh0+LuqyT4CQfFBDhV3iYXkN1GI5forphOE59zrFi0c1psn79QkHSwkY+ElmaFpoll0pRkAczdR94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Jjdh5X98Iwpaq5E6u5s/W4d3SPNINX+DlilZ/kV/7Y=;
 b=XqOv07ezLfeSltA7kwia+SwlK8T2Wlx844hWMVqXwU3EyhQgkV7KijPq9xZihG0bozgUPoSwSq8xL85UxMbzvK2kEJBDj/32+WWxJitPxNdKpurQ8XdYIfOacvKW4HG6VI5WJpUR04k1xLH6ggPmxb0wWEG5x5ShsDRm/Z+4p0z/nIGthFAas2u1qxWjxH+z6DpKlP03lUHNqzYzj3FAHggdHuOak2ys9Xi2L6sc/36rbAI++FH2J1LCVRovDDtBinqT4Hpf+jN/gvIp3bMrkUBRUS2fHE5tpH2fDKW7kPE1W4tP1EV4nw511rndqg1x1dpU9V/5az+u1IvXDrGO8Q==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "Halder, Ayan Kumar" <ayankuma@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [ImageBuilder][PATCH] uboot-script-gen: Add support for
 specifying domain P2M pool size
Thread-Topic: [ImageBuilder][PATCH] uboot-script-gen: Add support for
 specifying domain P2M pool size
Thread-Index: AQHcijnrd0sgeuOEFUiPnDmCo+f/yrVbY7wAgAEEwYA=
Date: Wed, 21 Jan 2026 10:12:45 +0000
Message-ID: <f81fe96f-73f4-4121-9336-11e56c8813f4@epam.com>
References: <20260120182346.114435-1-oleksandr_tyshchenko@epam.com>
 <7dfe66e7-73ae-4420-8e3e-e7acf814ddf0@amd.com>
In-Reply-To: <7dfe66e7-73ae-4420-8e3e-e7acf814ddf0@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|AS2PR03MB8772:EE_
x-ms-office365-filtering-correlation-id: 64ad7a35-8771-4a63-e52d-08de58d59f62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OWhXZTMwVk9UaDE0NFNsaS9pUFMzcHBjb0RkRmtCT1hoRGJjNnhJa25jSU12?=
 =?utf-8?B?MFMxbWdER212N2REOER0SzR2OC9MOXpOK1RRNDdsZExEay84U2FXcVVZWGZk?=
 =?utf-8?B?ZkxZNjU0RFVvTkxmUGIxZTNIVXNnZDY5QWlhcUZEVzBCcyt4MGxvK3AwT3ow?=
 =?utf-8?B?aVFyK0JDRnhWaElxcldLaU92NHdJZTFKa3ZtZnl6Nis3YUhaNVVYaUJPNFhk?=
 =?utf-8?B?U2dvZzcyYmtDNGdUd05jMXZIdHRHdnQ0bEhqSWp0aTJlR2lqUFUyTzNCNGRT?=
 =?utf-8?B?SXFQNWxlZ1FRVnBVQ1BqUWZvb3hNUXJQbFFZMG5nQnRxbElNbHhVVG9MYzVi?=
 =?utf-8?B?Tk93UUY1aUdQM1JVc011VGNWbkRyL1FXY21rREZTUkZsb0VFN1U0dUw5ekpi?=
 =?utf-8?B?OUNHT0g4UFdQRzc0OHJlWVFWb2p0cmpYYmFpYlN3dG14ZjF6ZHVMR1hIQ0U5?=
 =?utf-8?B?MXQ4YVlmb1FuOHlRcEorRnUwRWJ6ZDJCM3c4OEpwUzhYRVFVZHdIWXRJb3Rl?=
 =?utf-8?B?bHF0ZVR6eXJYeHMyelhaWWhUMDNGdXBQTFN3MS9Xbm1td2RadVQyWHBVc21K?=
 =?utf-8?B?RFRkeDd4dzBPM2RSem1oOGoxWnNSd1JIUDRObjJaTkN0Y24vQ0oxd0FGSzJ1?=
 =?utf-8?B?SzlqUHUvSllrUXpQbEdLN1NlWmc5Z2YxU0VUUzc3R0hjTk9ycVN3NHB3U1Fa?=
 =?utf-8?B?K2hiTHNXQWdnZG9HSFNDdjJUbHZ5MDFrSDdJWEhIcjhUR0dFWFZtVGtPVmxi?=
 =?utf-8?B?N29ub1VXcVZKQUg2NUNWdURkU1VVQ09iUFVEOWRpZFA3SDVsTkJudXptZW55?=
 =?utf-8?B?YWdqMEpGaHhqc1VDc21zTzdSMUFBWk92eit2UDhUVkRsR1JXT3BhNGRlNGZa?=
 =?utf-8?B?OXhxYmE4NWtHRWhSRm52NXoxREF1N1ZrTXlOalBXNUFZRjdNQzRyaGZnN1Yr?=
 =?utf-8?B?aHlGMlB5REZVdndOOEY0V1VnWjZHS09YVEExU2VKMjIxZmxrNmZjUlV6cldr?=
 =?utf-8?B?Z3lpbEFOQTR0ZEVrYXpSbHNXYkNVTWdJbjExS2JIRGJhbW5WaVZZWFkwclNn?=
 =?utf-8?B?VDVHOW9odEpIZXp1QksySmsySktOcVFGYU52MTZLcHAzWGd5d2RIUkRnTkJN?=
 =?utf-8?B?NEJ0d2toeGgxU0NyRCt6S09ySDVmT1RFb1lkb0RDd2V4UFJuZThLYWhXZnVX?=
 =?utf-8?B?N01EMUhaYTRtVEMyRnJVNUp4U3FFWER0eld5UUtrSFlUdlhndUpFQW9FNTMw?=
 =?utf-8?B?cWZNdStnaXhjSlk0aVg0S2JwbHJKcHZBdmpaQTdsZElGR2NxR3VGN0poeGhx?=
 =?utf-8?B?UDV0bDRuL2IvcWJVdnZIcjhYbkE3Q3JMSXRrbFN2dEhGWlF2UStPRXQ2ZTM5?=
 =?utf-8?B?SGduQVg2WlIrOVRiZTdycHNsRXhadE1SNENZYllaOWdaVnlQMEFGaFM3VkpZ?=
 =?utf-8?B?MTBWYjhhaVJ6cFVFbnNxbEVFdEJkaFpuR2RIV2RxNjg5MWErREV4ZUZnMU9h?=
 =?utf-8?B?dmhPMmI3U25GcHZ2TXQ5YW5WV050UllqMkFSOGxTbk1FbXpsd0lDa3lqeENi?=
 =?utf-8?B?QjRHV2VrbVozeWxsUWVscGJHZ2VYM3lqenJpd05rU3pDdmpUSURTWlFzSzJU?=
 =?utf-8?B?VHM4ODJTaCtPUGg4UmV4NWE4S0liRDFVRGhqTlZrNGtjWG83SlZxeHNMQUhy?=
 =?utf-8?B?ZUhLU2QxM1FBdldEeFlVNUNWUU9qaGpJUjFrSlZWdHpSUm5jUjRqRDhBZmJQ?=
 =?utf-8?B?OVcray93V2NGRS82a3NpVGpISXg0NXNaaFR5dDlBNG9LNGpCek9COGE2Tmly?=
 =?utf-8?B?RXFKT3dONHZnRk9RNVdwMmZ3WWxvaWxxa3lHdFE0R2tIVVgyZ1BUNW5yY1li?=
 =?utf-8?B?NjMrb3l6eTZwMU5NUnFnTitja1ZZemVlMHZLYmhWOHFHeTc3eUtmV2FIS2VQ?=
 =?utf-8?B?c2IySTRWVTBrT3ZqWHlBZmt3Q3VyQlc3ZzY4bHptSVBkZTlKRXg0bEdKNFda?=
 =?utf-8?B?VnN4bi9oU0VtTTBEbmtucFZFTVZvQWtsdFlJcjlMTXJGdHB2MGdGamwyNWI0?=
 =?utf-8?B?YVVMbkgzeFlmcHdKSlhRcHc0am01VnNuWkZ5TmZ2WGpNNXo5K3J5eWZYVFBL?=
 =?utf-8?B?cHorTnFOeGlFdUZXSy80ZTFGUEJ4UUtZbWlqK2c2cGNyMHdKYmVvMGV0eWJk?=
 =?utf-8?Q?5x/yrvnhNPCQgxe4jXfGf20=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1N1NStYU2k0dUMrcUN0aTBuamJ5QXd1cTJuVUpQcjRMWnhibG42aFNhVCs2?=
 =?utf-8?B?bG5XK05na2N6Q0NLQWdXcXIrRm5BeVFZQ0NEODNYaGJQVjZBZVc1bnF3bVFY?=
 =?utf-8?B?YUt4TEplblVOem8zV0FIZC9Nb29ITUpKWnl3OWtxZW1vQk5qYmo5eWsxaHlt?=
 =?utf-8?B?RHBNdHlBK24zWjdGUmFkNjNjNCswS2FpQStmeCthSjE0WEw2OTVyN2Iwb3lz?=
 =?utf-8?B?bTBCbEl3aHBpbGI3M05wU3F2QndzK3NUL1phdjRGM1lxL3RNL2JxRHp0Zm1S?=
 =?utf-8?B?WnZZYXluUTloMlpTdkczR1NmMHhBWHNFRDhLdHdxUm1JbXE2OXV1MWoxdDVq?=
 =?utf-8?B?eHNMRkt1RkhqYVU1bDhJL3FjVXlXSXRrQ29TQ09IbEFSUDJFR2FadDR4eTI1?=
 =?utf-8?B?QXExQUdMb2pERTIrcGRWL0twSXpuaVdHbDYxbjN2b0t4S2pseUZKaXNITXV5?=
 =?utf-8?B?cTJQM1BCQWNmM1ZRTjFVYmxtZTFiZXpKWkd2QmNIZytJYlZ3QXBvRDcwdlVn?=
 =?utf-8?B?VDhwRXB2ZkNQL2RpWVFFeVQxdVRoL1J3NUpvNCtRbWZZRVE3cnJ3SG5WK1Y3?=
 =?utf-8?B?aDJJVVFTRSttTnNpRnFocXU4SXE1SDN6YTNOS0YrY09mYklaYnlOUVJuU2U0?=
 =?utf-8?B?cm8ySDZ1OUpJQkorMkpnbFRDb1BNZXd2bHJZak5VN3dtMkRaUDN2OGRwNmxL?=
 =?utf-8?B?VFhhejNFMDFUSHVEanBtR0tNNnR6dXgrM3EyVjFTSHdEc1VpYnVvYWppMWhI?=
 =?utf-8?B?SEgzVWxOay9jYi95bVBMUi9tQy9tTSsvM1RXcWcrMVJrbzlCcmYwRGlXTlhG?=
 =?utf-8?B?akZLL1lkcWo3SnkzRWwzSUZvelBpQ1BrRE1rSjM1YjF0ZEh3bTY4cWtXMEgw?=
 =?utf-8?B?cDBCZTg3eGlCNjlUS0FwTkdPd3AxWWEyMjhnQkM2Wm9ZbXRFUnVPTDJ0SkxX?=
 =?utf-8?B?aEpsdXFKeGYxSVFoU0lZNTNaWTVHWnlHTG9IQVU4QzU0L3RTTGR3RDFmT3F5?=
 =?utf-8?B?LzBPYkFGQ01Yd3liMUp1b1FMOEhXQmp6TzlieCtnMjJsZWJlMjU0bm5Td3cv?=
 =?utf-8?B?Tmh5WGVxTkpXRGU1TEVwOWY1bEZ5NkpFOEJITjlqemh4TlpabGxrWkZnTTl4?=
 =?utf-8?B?cFQ5dEJPemV2UjFPeXVwRTlCYmh6SG91cytyU3dybTdTK0hMRm43N0llSGRq?=
 =?utf-8?B?QmxnbEsxbHl3dDVxTzljVDN2YmJmL2M5RkhjajBIRXdUdHZJd1M3NGtjNmlh?=
 =?utf-8?B?ZWx2KzFReWxEYm82NEdxWkJrR2xIdTNYWlBjaUd0d2R6ZytOc3dmclpPZ0pH?=
 =?utf-8?B?a21VOTdQRHQ1WnA2K0xpUVdHK3Rvd1JSdVduYmxJczk1bDFUTWt4RkNSVXdH?=
 =?utf-8?B?TDU5TkcxWDR2Z3o2QVc0d2JJaGwrSkErdHoxQ0VvSFhxZDF0ZDJ1NkRwZnlt?=
 =?utf-8?B?bUpTS2FSeW02SjI0MDZnd1IyTXFKd004STlZWU9Ra09vWExuU1BWMUkyZ01s?=
 =?utf-8?B?clNDRXQ4cXBkZERGN1dTcXV5WFpQNmp2Q0R2dUxNUk90SUhXZFp3WlBZdW82?=
 =?utf-8?B?ODdqNTNMSXY0eHIySTRlZWkzZzREUU9kQzhUWmQvc2dPMytnMUwxRDN2emZV?=
 =?utf-8?B?dytNbEVQaU1zRk9tVnNYSU1UWmFla0hmVGN2R3Qvc3V6a1JaYkVQYWZkTnpo?=
 =?utf-8?B?ZndPRktEaEcxRkRRdkxoajRxUVVaMVFscXJ1M3oxRmpvL3c5cnN0MlA2emo3?=
 =?utf-8?B?SVhwTHMxak12VlBNNnQrRkpVR3JZMXh6U216eEVzdFV6U29nY21xV3FYWW5i?=
 =?utf-8?B?NzNkMUtPM1BKeVBJMmRMSFhvUnlsMHlwUjRjL3FsckVsNlpudDhuRFhFYzZx?=
 =?utf-8?B?Z1VqcTBvcWdBSCt6SDI3RVhmb3dlY0lmUThYYlM1MlQreUtkYm5UUG5LYzlu?=
 =?utf-8?B?ZkdRWXNjNzRLVGd1NUNVZldPRTMyc0VGVzRhOGRwdlVxZDNJaWVpdlBJU0R5?=
 =?utf-8?B?V29VYWZlN0FFV0p3WFFlUlBvcHdPbjlQM1oxRVNIc1pGbW9WYm1OT0VIS2xa?=
 =?utf-8?B?bzdtaHBwYnA0R3ArRnJXbHNXMzZ3MFZpcG9YclZ4RG0yMWkraWtLQ3l6eXdK?=
 =?utf-8?B?MEtJSTBRekFnUEdSeVE2dmNXMWFLTWNpODBJMHV3aGRESjVUdUVPWS95RzJN?=
 =?utf-8?B?SDJQU2g2b0tndWN4a05vdUJ1Y09NUEhTUmpWeGprME5kd1lQOHFZSm5Ceitl?=
 =?utf-8?B?ZWIrVFA4S0lyZlM5SGN4N0hUZ3FkYk01OHMxNzFMTHZUbUpydlYxckUrbE5R?=
 =?utf-8?B?SzlUSGJkbkJFZ2VhRUV0WlB5dWlHMEw0cEtxb3FCU0hFVU93amtRQkFpQ3Jv?=
 =?utf-8?Q?v9NSTVSvSZnSpA87hzlQbQXPsXHsIjl6CoOzK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CDCA8B98599914B87B95D60F57B6E36@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ad7a35-8771-4a63-e52d-08de58d59f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 10:12:45.8218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fB0jUBAZe0f6ot2/bShox5Ycf6Cwsf6B6IepWU7C4kmQJvMjA10j28nHkjKuAxVapbLZFBCc7L43zu+Iqo5FhdehAvIXoqLUELL5PiYPvBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8772
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
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,epam.com:email,epam.com:dkim,epam.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 61DC45501D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDIwLjAxLjI2IDIwOjM5LCBIYWxkZXIsIEF5YW4gS3VtYXIgd3JvdGU6DQo+IEhpIE9s
ZWtzYW5kciwNCg0KSGVsbG8gQXlhbg0KDQo+IA0KPiBPbiAyMC8wMS8yMDI2IDE4OjIzLCBPbGVr
c2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+IFRoZSBET01VX1AyTV9NRU1fTUIgY29uZmlndXJh
dGlvbiBvcHRpb24gaXMgdXNlZCB0byBzcGVjaWZ5DQo+PiB0aGUgYW1vdW50IG9mIG1lZ2FieXRl
cyBvZiBSQU0gdXNlZCBmb3IgdGhlIGRvbWFpbiBQMk0gcG9vbC4NCj4+IEl0IGFsbG93cyB1c2Vy
cyB0byBtYW51YWxseSBkZWZpbmUgdGhlIG1lbW9yeSBzaXplIHJlc2VydmVkIGZvcg0KPj4gUDJN
IHN0cnVjdHVyZXMgaW4gbm9uLWhhcmR3YXJlIGRvbWFpbnMsIG92ZXJyaWRpbmcgdGhlIGRlZmF1
bHQNCj4+IHZhbHVlIGNhbGN1bGF0ZWQgYnkgWGVuLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4gDQo+
IFJldmlld2VkLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5oYWxkZXJAYW1kLmNv
bT4NCg0KdGhhbmtzDQoNCg0KPiANCj4gd2l0aCBhIHF1ZXN0aW9uDQo+IA0KPj4gLS0tDQo+PiDC
oCBSRUFETUUubWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA3ICsrKysrKysNCj4+
IMKgIHNjcmlwdHMvdWJvb3Qtc2NyaXB0LWdlbiB8IDUgKysrKysNCj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9SRUFETUUubWQgYi9S
RUFETUUubWQNCj4+IGluZGV4IDk4M2NiYmMuLmM3YWU5OGUgMTAwNjQ0DQo+PiAtLS0gYS9SRUFE
TUUubWQNCj4+ICsrKyBiL1JFQURNRS5tZA0KPj4gQEAgLTIwMyw2ICsyMDMsMTMgQEAgV2hlcmU6
DQo+PiDCoMKgwqAgTk9URSB0aGF0IHdpdGggdGhpcyBvcHRpb24sIHVzZXIgbmVlZHMgdG8gbWFu
dWFsbHkgc2V0IA0KPj4geGVuLHBhc3N0aHJvdWdoDQo+PiDCoMKgwqAgaW4geGVuLmR0Yi4NCj4+
ICstIERPTVVfUDJNX01FTV9NQltudW1iZXJdIGlzIG9wdGlvbmFsIDMyLWJpdCBpbnRlZ2VyIHNw
ZWNpZnlpbmcgdGhlIA0KPj4gYW1vdW50DQo+PiArwqAgb2YgbWVnYWJ5dGVzIG9mIFJBTSB1c2Vk
IGZvciB0aGUgZG9tYWluIFAyTSBwb29sLiBJZiBub3Qgc2V0LCB0aGUgDQo+PiBkZWZhdWx0DQo+
PiArwqAgc2l6ZSBpcyBjYWxjdWxhdGVkIGJ5IFhlbi4NCj4+ICvCoCBOb3RlIHRoYXQgdGhlIFAy
TSBwb29sIGlzIHVzZWQgdG8gYWxsb2NhdGUgcGFnZXMgZm9yIFAyTSBzdHJ1Y3R1cmVzIA0KPj4g
Zm9yDQo+PiArwqAgbm9uLWhhcmR3YXJlIGRvbWFpbnMuIEZvciB0aGUgaGFyZHdhcmUgZG9tYWlu
LCBQMk0gcGFnZXMgYXJlIGFsbG9jYXRlZA0KPj4gK8KgIGRpcmVjdGx5IGZyb20gdGhlIGhlYXAu
DQo+PiArDQo+PiDCoCAtIERPTVVfTUVNW251bWJlcl0gaXMgdGhlIGFtb3VudCBvZiBtZW1vcnkg
Zm9yIHRoZSBWTSBpbiBNQiwgZGVmYXVsdCANCj4+IDUxMk1CDQo+PiDCoCAtIERPTVVfVkNQVVNb
bnVtYmVyXSBpcyB0aGUgbnVtYmVyIG9mIHZjcHVzIGZvciB0aGUgVk0sIGRlZmF1bHQgMQ0KPj4g
ZGlmZiAtLWdpdCBhL3NjcmlwdHMvdWJvb3Qtc2NyaXB0LWdlbiBiL3NjcmlwdHMvdWJvb3Qtc2Ny
aXB0LWdlbg0KPj4gaW5kZXggZDE4YWM1NS4uMGM4NmMyZCAxMDA3NTUNCj4+IC0tLSBhL3Njcmlw
dHMvdWJvb3Qtc2NyaXB0LWdlbg0KPj4gKysrIGIvc2NyaXB0cy91Ym9vdC1zY3JpcHQtZ2VuDQo+
PiBAQCAtNTE0LDYgKzUxNCwxMSBAQCBmdW5jdGlvbiB4ZW5fZGV2aWNlX3RyZWVfZWRpdGluZygp
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkdF9zZXQgIi9jaG9zZW4vZG9tVSRpIiAi
cGFzc3Rocm91Z2giICJzdHIiICJlbmFibGVkIg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZpDQo+
PiArwqDCoMKgwqDCoMKgwqAgaWYgdGVzdCAtbiAiJHtET01VX1AyTV9NRU1fTUJbJGldfSINCj4+
ICvCoMKgwqDCoMKgwqDCoCB0aGVuDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkdF9zZXQg
Ii9jaG9zZW4vZG9tVSRpIiAieGVuLGRvbWFpbi1wMm0tbWVtLW1iIg0KPiANCj4gV2FzIHRoaXMg
cHJvcGVydHkgcmVjZW50bHkgaW50cm9kdWNlZCBpbiBYZW4gPw0KDQpOby4gSXQgd2FzIGludHJv
ZHVjZWQgbW9yZSB0aGFuIDMgeWVhcnMgYWdvIGJ5IHRoZSBmb2xsb3dpbmcgY29tbWl0IA0KY2Jl
YTVhMTE0OWNhN2ZkNGI3Y2RiZmEzZWMyZTRmMTA5YjYwMWZmNyDigJx4ZW4vYXJtOiBBbGxvY2F0
ZSBhbmQgZnJlZSBQMk0gDQpwYWdlcyBmcm9tIHRoZSBQMk0gcG9vbOKAnS4NCg0KDQogIElmIHNv
LCBpdCBtYXkgYmUgZ29vZCB0bw0KPiByZWZlciBYZW4ncyBjb21taXQgaWQuDQo+IA0KPiAtIEF5
YW4NCj4gDQo=

