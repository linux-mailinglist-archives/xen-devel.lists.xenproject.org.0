Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3319CDE14
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837435.1253364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvCQ-00009L-2t; Fri, 15 Nov 2024 12:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837435.1253364; Fri, 15 Nov 2024 12:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvCP-00006i-Vl; Fri, 15 Nov 2024 12:13:17 +0000
Received: by outflank-mailman (input) for mailman id 837435;
 Fri, 15 Nov 2024 12:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBvCN-00006c-Ig
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:13:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f403:2613::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb3b54c7-a34a-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 13:13:11 +0100 (CET)
Received: from DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) by PA4PR08MB6111.eurprd08.prod.outlook.com
 (2603:10a6:102:e3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 12:13:07 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::aa) by DUZPR01CA0295.outlook.office365.com
 (2603:10a6:10:4b7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 12:13:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Fri, 15 Nov 2024 12:13:06 +0000
Received: ("Tessian outbound 6a0f5b372c2e:v490");
 Fri, 15 Nov 2024 12:13:06 +0000
Received: from Lbfcceb09e866.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E1A9BDC-76C6-47DA-8BD0-D715C77DD5B1.1; 
 Fri, 15 Nov 2024 12:13:00 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbfcceb09e866.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 Nov 2024 12:13:00 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PA6PR08MB10708.eurprd08.prod.outlook.com (2603:10a6:102:3c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Fri, 15 Nov
 2024 12:12:57 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 12:12:57 +0000
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
X-Inumbo-ID: fb3b54c7-a34a-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjE4IiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImZiM2I1NGM3LWEzNGEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcyNzkxLjU0NTE1OSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CiMW0lhiCeCLdvSZ3jNNM6dGTnIHqCwpb49bb+B1ZBK8ZXyBnt286Y8dvCDsgZdDKvKtympFe+jlZHLOKmK2bs1GoMkYG2lnH0vKZfm3sea+1Fx4crHuQSn/oRTdyT+eOYVeIgxNiTDZjHwcVeN3qVs1B3FYh3qmPdZJCCEOCdq1Ptul+B0YKR3tqaKSIxz9r/EY69jgtCEp4Ql8y5CU0k4VcWaUbeCLWuVIDjOxNNnVDTK+524UD9HiwakRHio2TE5FK0i4q0EKJhnq0n5AvTCOP2Nr0RBFTM8YMuY/sBDXAFQRMOsUitCWssiFYzPDa/lPPpzVHCcGJMNtyMh9AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka+6tg+d0UjMzOGfzNZxhXIIG8Kxi6GwB/TwiHXq1oo=;
 b=bx6KaU2cAIJTupiDWI3UgRBkHwsHjKILMCR41qbQ7vHKjR519dtTbRURdzKDWPMaDCoA+Y8aJ64IyEnsQ5XSAnXuo55StjZZ++6oqd7kdpB4FUWhf6+TS/5qsYd192uo3Z+KsMtUN727FAV3gzR2gsld1E1GhE97K2/mtxN2MXiG4HpODOZ1ccQLchzgXwziFZoeFrqU0sfUiCS1zVPNT7lpCaoukVDxYSrzIlL6MkpEcpZUdjLGaHO474lVgGu6WgCj/turSvhlS2jJDoSkO++pIrT3brACI1uDxX8zjg5LOHZxjdXxZe57mHPFZJo+Ejn1XSHGz8yi7A1+dCODeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka+6tg+d0UjMzOGfzNZxhXIIG8Kxi6GwB/TwiHXq1oo=;
 b=h3BOn7a8Kd/Xd8IzEn/tq3APlg5UYrCnhS5sI7dk5Nga6wv4GOshfOzfn+dJLYySDmZm6iARzy+GT2AmzfAKtj8FO45tLfDabWS2DjwGpf84ppG4aAPSVYDRo18q9N3wUa9YckKhEvircMNffI+cPxcjUwWRkUk7GVN0v4vQXA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf5133756de9ec09
X-TessianGatewayMetadata: m3H+/51AUpjHADgtLpU+BMCzF520wFeKFnk3h5n3odjDTkPkMf0HDTpec8Uh7i/7Q15hvEyakJ8eZP5frtX1VN1TXFiaMw1WT18qCCpS3X/RfxBmASfZlvKaD0kUB7U/QlkTZkOAT2MhdKfOUWAIpIQAFN6uTYUZNKM2j1qe5tI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdT4CKUcJhzC3C0kNbhV3oYyq4j1BAERdJQEBF+cx+R97sbctmwa5BRfcZP3thS3opNS8hg06Bb/jGr7ZFjKwAMHtbmAQzqlMW3qzrqiBJDKPlviEYqS/sFfYu33idF0VzoMki73vAnCeb/tc2G2d+hPrj2/rDJpDiYUttPqEAv+DJyGzY/+k4Qu0mCEhNtxIJFa0kucajJUJqkYJb2955LDYV82cNjScKiLGiJ8LucCcTJisxucPIDFexcWTkMJW5YanCbHownn4tDDxrf6IKVpUM/17Lk8vOOVHNsREAkLtr56FMr03noMETtzNxim2jRz658aVj3EvldaGGRu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka+6tg+d0UjMzOGfzNZxhXIIG8Kxi6GwB/TwiHXq1oo=;
 b=vSGJ4pyrawQq0bdtBx8OD/xRbkIVK8r5eOR6bXy+cfjV/DIWUTtEymkG4GnaIKuRoznlvgWRLDTMagCRKoq58ymtx/EqkF10VR3wu/95QSf2+vOyQBM8g4OTrHIV2yxj/6dafUYeXvSoV0A9hktoC+Hela/znr55VCIfGSV3H3ezdkO0PmQDFR8Dogr2mAmwm0fH5ZwQQhQa2GvoiIZj0O+DM2aPpPVUmCgVYAglvQvD1Dihcr2H4sjcPjQxiwUIXGBlgOP+8AHd7+8NtskxsrwbVtzpLA4oCN2g4dl20bARZUloFb22VQ5TJyeWmJqYVmxGFqHAxs7Dd1Uy1h7ViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka+6tg+d0UjMzOGfzNZxhXIIG8Kxi6GwB/TwiHXq1oo=;
 b=h3BOn7a8Kd/Xd8IzEn/tq3APlg5UYrCnhS5sI7dk5Nga6wv4GOshfOzfn+dJLYySDmZm6iARzy+GT2AmzfAKtj8FO45tLfDabWS2DjwGpf84ppG4aAPSVYDRo18q9N3wUa9YckKhEvircMNffI+cPxcjUwWRkUk7GVN0v4vQXA0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbN0xEMVIvN3HbzEuhbXugN/BCZLK4PUmAgAADYgA=
Date: Fri, 15 Nov 2024 12:12:57 +0000
Message-ID: <5A329553-F3E0-4C4E-8E84-2ACDF3C69756@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
 <2b13f12c-905d-478c-b525-a3a8c69d5ac7@citrix.com>
In-Reply-To: <2b13f12c-905d-478c-b525-a3a8c69d5ac7@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PA6PR08MB10708:EE_|DB5PEPF00014B99:EE_|PA4PR08MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 786d4fb5-dea0-46fa-a5b6-08dd056edd0f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Sm05VEdWQm1QMVJrL28wLysvUDlORndpTEhPMHVMSC9PWUlMQ1RCbG9FeFN5?=
 =?utf-8?B?VDhhNEJrNXpoNUUxdVZKWlJUalNKZFNmOGZ4OFdONC96d0tJVHhCai9FMWIw?=
 =?utf-8?B?bGE5VFVtMWhFQXRwNHJ2MWhTVzdlSTZyT1hNM0JIaXlrSDVEQlRuTTJ0KzlK?=
 =?utf-8?B?ZDJYaXFJenZWUVlFQUllRm5pSHpJME5XcmNONTh6aXA1QkllQ2lCVW9mWlhv?=
 =?utf-8?B?NytkenJBK0RRUjhCYWNSVC9tS0xqOHR3L1g0bEhnNG1HM2ZrQllUT0RML0Ji?=
 =?utf-8?B?MkFHTXlVUkdnbnI2cit3NTZRcnZCV2FCak9ZMFFVTCtRalk0NnRwLzFHcDdM?=
 =?utf-8?B?cGE5azkwWDZWVElucVQ3OGFDbmFya0I0c1ZjTzJJSXZCRitkenM0MVBaUDcz?=
 =?utf-8?B?R3FkamFuWThwaDkxM0VWbG9iODFmVlcrUGVYMVd5eS9vcXpSVUN1dTFXY2ll?=
 =?utf-8?B?MFNDb1hHTzc0NjUxWWpVNFMzcitkOHRGZGtoN24xN05MT1FmZ2RsTVYzRTkr?=
 =?utf-8?B?bk50czd5TGRtOWhFTFB3WjNNSzhYMEFRTkh2VDBjTE9KNWRjc3lnUGxzK3lE?=
 =?utf-8?B?NElzeFZ5am11Zmh5ak00Ym5ZbDNLLzhmWjRjdGl3SVZZNDR6RzhPZlJMczVl?=
 =?utf-8?B?cFJBK3VWemJnYVRHU1E0QWwyS0hYSFR0anQyOFd3NytqUzdFdW92YjZnemFl?=
 =?utf-8?B?Wmx3YVFzK0FxZDkzeXdNaU5MMXQ1NWJMS3lUQ0ZYNFd2Sk1lRXI0ZGVuaUEv?=
 =?utf-8?B?VU1GZ3I2OVRXL3hiOThQMCsxQkIxbVRFcmQ4RU1jY2dFL2FqckUyWWtjU2pG?=
 =?utf-8?B?TFFhV0ZKa00zRnBDMmNkNVFacVNKUlNnbDA5ZXo3cEo1cUxKMDB3VFlBNkFK?=
 =?utf-8?B?SzBTNXh6NkZvenduYlM5YnBoelNCd2hvZGhTMGphSDFRbzk0RWp4TTBKZ29D?=
 =?utf-8?B?YkN1ZXdnanY0WExzWjRBaGlmRUJJWjBjb20wN1pTZmRqSFdqbys0NU50ejlC?=
 =?utf-8?B?dHAyRmw2Yloza2ZQM29kSmsrWkdxUUZlZTNVcjRhaFZHd2RVNDNCaEhNTjdI?=
 =?utf-8?B?ZjVWZFRwblBJKzVEektXSDBqSnk5aDJSek5VZDltWVdXN1N5aEEyVS9XcDU2?=
 =?utf-8?B?NXN5NzlYZXBteVp3cXhNbTlLZHA2Q1cvV3UwK28rTVBrUDJRZTNYMm1oZGVQ?=
 =?utf-8?B?c245ODROdDB4NERWMWxibmF6U1lEb0tJMmVDbXdGdS9uNk9LMjh2SmJ4c0tv?=
 =?utf-8?B?ZStaVklBMzU5a21lOTJCaWxTcTM0MThPMmNtLzRmL1d3OW1EL0JoelJmSHg5?=
 =?utf-8?B?NjAwcTQwZ05VcGM1OG80Wng2aW9vc29xOXdHQmh3QXlBL2NnckdTbEVoUnBV?=
 =?utf-8?B?ZGdXQkcrQ3VuTWNleFlWS2o0MzZBZnJxajRnSjhkNmdpVDcwc3BIeUNrUTBy?=
 =?utf-8?B?d2NnWFpJOWVsZEJYNEZRblJpU2pyWjB3VmFIRWd0Z0d5K29mb3NncjhEa0pE?=
 =?utf-8?B?aVg2d25VQWJvU0pCYTkwVU9zUngwdStENTNPTmpjWWQ3WGRJRHFFeHRUc21z?=
 =?utf-8?B?V3YyNGxuaXNXazM2ZENxdy9xYjVCazV6cWVGaTdGN2JBRmtvZ1RTUXlQY2FR?=
 =?utf-8?B?VTVwWVc5SUp1UC9WdHo2S294Ty9ORHQ4Y2hXc0dBc1I1a3N1eXN0TG13MEpM?=
 =?utf-8?B?aU00aEh2UGEzckk1WGw4Wmd0NmlkN0dvbGFoT1JmSUk0ellhYzFPNTdtaEJ5?=
 =?utf-8?B?WlNEbDdMSEg3N3JjdVFIRURZL3VObmZFTE1JL3k5TlpXYXloVGN0U0pFVGsw?=
 =?utf-8?Q?URgPjEyT1UFc2SwF8YjrRHU/UA9VbvPjFLeNg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF4E2306C79E6340BA53D30A9847C8EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dda107d5-93a9-494b-5180-08dd056ed773
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STRBOGt3KzZFT0ZDZFliT2k1RXJHRHJJSUlZb2h0NzJWTklCNG9ISCtoelF0?=
 =?utf-8?B?VjRHQlFBUjgrNnkxZzVZREVSbzVndkoxSk45UXJVY014anNpMXZrRGFFRVlq?=
 =?utf-8?B?Syt0elE4ZWR0VXJNWEU5UTBUMnB3V1d5V2NKU2RIN3JDMWkyNG9yUlBIemMx?=
 =?utf-8?B?Z2pqSkMyWjFteGp2eEhmU2ptM1RvQUhGbU14SWxyZnQzYUNDRndIMFp0UTRF?=
 =?utf-8?B?WXlqRDczSHBPOE00ZTA3S1U0b1E2QmkwQkIrOWVRc09QTGh1Q3RlVU5hUHhV?=
 =?utf-8?B?WkJ0eG11cTd1N1ovQWk0L0JYMUEreVo2OWYzMjZlZ0JZTEZGZnJYNllOaUJo?=
 =?utf-8?B?MXE3cjlydWJPb1hRRHQxSGgrd1NnRlV2MkFiTUZTSkhqdGhGaXlabmsrbUNL?=
 =?utf-8?B?Tm5ud2ZoUERuaFRaMkowbEdXd0Qvd0tzSUNySVp5SXRuVEszdEQySTBoWkI0?=
 =?utf-8?B?Y0xLUHArZjdXNkZpa2FXRktwZ2swNWlkNGhLQ0szamo4YWRWdGpIaU9tSlk1?=
 =?utf-8?B?RWhkaXVjekI4NU5zREV2czJCaFN2QjFtb0FPYjJVTFFXSkNvOUVDQjJsMjB5?=
 =?utf-8?B?NE8renpPZnJTaEFRZm5vR0lXNHJuRzF6aUgwZVJReEtaYkM2dzJMOXA4eXk1?=
 =?utf-8?B?QU5GZG51ZUJMQUtkdTFGWjJUai9DZE9WRmtHUlRRL3RacEtCTGhhZ3lQYTZh?=
 =?utf-8?B?aXk0R2w1OW15Sm1vZmFoL3gzaXBZakRrYTF2T1dDZlBUdHJCbWwzSEs5NkdE?=
 =?utf-8?B?aEhEcDlmQ2hXQWZ6SGF6Y2lRdkxsaHYxdi9zR3JUaG9OSWpjY0psSEZOcXZI?=
 =?utf-8?B?NzdBNS9ZSStVVVdWV2FEM3kxQkRvL0d4SUVrNmZQVkd4T0F4NzNmQXRFOVlO?=
 =?utf-8?B?RXVFL0hiTlA1RVYxdytKT2lDNm9MYWMveEFPZlVldHFHRFBEK0RFSzNXa3Rx?=
 =?utf-8?B?ekZuWk5HV3BJc2k0dkhsRU00NENvamxsTmxLeUtZMkllQUR4bFJzd0I3dzVS?=
 =?utf-8?B?VDBCZHA1Nm1QQlF3SnlkMjhma3ZnemdmZ3RRU1BUNXorMWxUU3NmbG81N3dV?=
 =?utf-8?B?R2RqMUx1NTYzTFB3RlZRQkFYNjZNd1l3QnRzUVZyTkd5UmJOa0pJOUdoeXFN?=
 =?utf-8?B?MUJJdlp5M1ZQakpkaU90YWxvb1k0aFZ3MGYxMFA5QzI0a015dmdVUGF4WFB4?=
 =?utf-8?B?OTN1L1ZTcjhYaGNVQy9xeWhFcmZSMTdnclh1SXdER2RhRTFpMVlvWG9pL1Nq?=
 =?utf-8?B?UmE1Z25TRmZmVEQwOWl1WUs0MU5KN3JyblZIR0VONlhFQk9rNzROdDF4YUNB?=
 =?utf-8?B?ZDVoWUNHUExKaE1NVDYxMTV0c283Tkx4ZHlHb1ZJTWZvb2lzd1FwRkVIb21j?=
 =?utf-8?B?Vi9JNlh2YjhiemdSZWptc3BSdHRydjJoRGtEaXBvTWNmUzl5T3ZLVThkbHhx?=
 =?utf-8?B?MUxtcHhDSXozVVE3RXRoWmRUVTlHWHFmYjNHSloxMkhDRkczL2xBdzQ5d1BH?=
 =?utf-8?B?ZWQ0T2FDU1BLTmR2TUtHRnh5YUM5My9LQWhTd0ZSdDBXSktMbHUzbDJvdzhS?=
 =?utf-8?B?c3Z0VSt6VlZGeUtwN3pkMU9OZStKNnJVMHNXdVlVTW9xUjhVQUlqaWdVcjIw?=
 =?utf-8?B?Y1VpMnBtdWNNbi9pdWN6RjA2Skl2QVpDTHF4WER1dDV2Qnd0VHBZQVNKSldr?=
 =?utf-8?B?bko2bXVFOUtsMjdkZzNxMkpNYVg2MzNQdXBEUndON0FkdFB3ZVAwb2hpM1Ez?=
 =?utf-8?B?akJwNjFIMlpOR2NlYjhEcjRBdm54SnVxWFlUTmVQZWh5WEZYRVRQSFk2K1Ft?=
 =?utf-8?B?R2xiV0RNNGl1aDBRZXBGNU5SQWRESUJIWmkvalcxRExTWUV2ZzA4eW16VXNj?=
 =?utf-8?B?SlYxcndZMTVkMUVrU1hNeDJIZzZ5K2ZSNmRHYjRraTc5ekE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:13:06.9810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 786d4fb5-dea0-46fa-a5b6-08dd056edd0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111

DQoNCj4gT24gMTUgTm92IDIwMjQsIGF0IDEyOjAwLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDE1LzExLzIwMjQgMTA6NTAgYW0sIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3h2bWFs
bG9jLmggYi94ZW4vaW5jbHVkZS94ZW4veHZtYWxsb2MuaA0KPj4gaW5kZXggNDQwZDg1YTI4NGJi
Li44MDJiZTY2ODcwODUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4veHZtYWxsb2Mu
aA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3h2bWFsbG9jLmgNCj4+IEBAIC00MCwyMCArNDAs
NDYgQEANCj4+ICAgICAoKHR5cGVvZihwdHIpKV94dnJlYWxsb2MocHRyLCBvZmZzZXRvZih0eXBl
b2YoKihwdHIpKSwgZmllbGRbbnJdKSwgXA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX2FsaWdub2ZfXyh0eXBlb2YoKihwdHIpKSkpKQ0KPj4gDQo+PiArI2lmIGRlZmluZWQoQ09O
RklHX0hBU19WTUFQKQ0KPj4gKw0KPj4gLyogRnJlZSBhbnkgb2YgdGhlIGFib3ZlLiAqLw0KPj4g
dm9pZCB4dmZyZWUodm9pZCAqdmEpOw0KPj4gDQo+PiArLyogVW5kZXJseWluZyBmdW5jdGlvbnMg
Ki8NCj4+ICt2b2lkICpfeHZtYWxsb2Moc2l6ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbik7
DQo+PiArdm9pZCAqX3h2emFsbG9jKHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxpZ24pOw0K
Pj4gK3ZvaWQgKl94dnJlYWxsb2Modm9pZCAqdmEsIHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQg
YWxpZ24pOw0KPj4gKw0KPj4gKyNlbHNlDQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHh2
ZnJlZSh2b2lkICp2YSkNCj4+ICt7DQo+PiArICAgIHhmcmVlKHZhKTsNCj4+ICt9DQo+PiArDQo+
PiArdm9pZCAqX3h2bWFsbG9jKHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxpZ24pDQo+PiAr
ew0KPj4gKyAgICByZXR1cm4gX3htYWxsb2Moc2l6ZSwgYWxpZ24pOw0KPj4gK30NCj4+ICsNCj4+
ICt2b2lkICpfeHZ6YWxsb2Moc2l6ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbikNCj4+ICt7
DQo+PiArICAgIHJldHVybiBfeHphbGxvYyhzaXplLCBhbGlnbik7DQo+PiArfQ0KPj4gKw0KPj4g
K3ZvaWQgKl94dnJlYWxsb2Modm9pZCAqdmEsIHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxp
Z24pDQo+PiArew0KPj4gKyAgICByZXR1cm4gX3hyZWFsbG9jKHZhLCBzaXplLCBhbGlnbik7DQo+
PiArfQ0KPj4gKw0KPj4gKyNlbmRpZg0KPiANCj4gRG9lcyB0aGlzIHJlYWxseSBjb21waWxlIHdp
dGggdGhlIHdyYXBwZXJzIG5vdCBiZWluZyBzdGF0aWMgaW5saW5lID8NCg0Kd293LCB5ZXMgaXQg
aXMgY29tcGlsaW5nIGFuZCBJ4oCZbSBzdXJwcmlzZWQgYWJvdXQgdGhhdCwgdGhpcyB3YXMgY2xl
YXJseSBhIG1pc3Rha2UsIEnigJlsbCBmaXgNCg0KPiANCj4gVGhhdCBhc2lkZSwgY291bGQgd2Ug
bm90IGRvIHRoaXMgdXNpbmcgY29uZGl0aW9uYWwgYWxpYXNlcywgcmF0aGVyIHRoYW4NCj4gd3Jh
cHBpbmcgdGhlIGZ1bmN0aW9ucz8gIEl0IHdvdWxkIGNlcnRhaW5seSBiZSBzaG9ydGVyLCBjb2Rl
IHdpc2UuDQoNCknigJlsbCBwaW5nIHlvdSB0byB1bmRlcnN0YW5kIGJldHRlciB3aGF0IHlvdSBt
ZWFuIGhlcmUNCg0KDQo+IA0KPiB+QW5kcmV3DQoNCg==

