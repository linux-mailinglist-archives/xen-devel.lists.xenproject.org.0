Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEIkCDRXcmkpiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:58:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1946A83C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211505.1523068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy07-0001Yk-UX; Thu, 22 Jan 2026 16:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211505.1523068; Thu, 22 Jan 2026 16:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy07-0001WH-Rk; Thu, 22 Jan 2026 16:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1211505;
 Thu, 22 Jan 2026 16:57:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viy06-0001WB-3M
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:57:42 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7528a3d5-f7b3-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:57:39 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7354.namprd03.prod.outlook.com (2603:10b6:a03:567::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 16:57:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 16:57:35 +0000
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
X-Inumbo-ID: 7528a3d5-f7b3-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJKcjGMHCqMg1ZmvRiOdbgHlHwmyqhfvPAd+hKhe+3oDyg73BBJJFMyr8K34eXaulXIUcgNY796LxXAhJyVcwlSwmS7Z8x1LK+J/9BOHXT9e9PYj2SmmtNw5h91h3Sbs3BErvdxCxZ+K6JB8606nleZF3kbjJcxVfB2DuPcaX32PsU/pBUI267G3P2IQNBceHaPGZpB58sCso+ah2s6wV3dNIb1rUc/Gk/rcsNR8xZtNffx5QA0kd5fMlXffZWQxUsLvUY/hbPCnNdoObfMm0d4N91zInwjYe1ucGkD0+SE4nF7nGeWhlAju7tcesuarjgG9OKl3MXdNmzuOyhovGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOzTUmvMTBwsX3Zo0Iow0xAo0xoyleaeLKb81rG3G4o=;
 b=WiY/G7TIAjAJIZbtZ/WTG4zTaOXymS8mJCTfnVLjGRT7/m1aGxsem/M0pAxzJQfBndr3Je0oKuaopu+7gb8SFlQHagrG0yK0dzXMVhr8uwzRZWbgLdU8k25wkj/P3McuB/7Ht1T5OPDMvzd2+LgCx9ZF8JG7SYGYWt6QQXoJdj8uhxLUcxz0VMGipt43khNBgN5N5f3ccqnjbG1OlIu3dubMbBHckmjtxwIhJlPc2YOm5kw50Jo5ErmP1y322yzD4AolqcsN2S6s7cE2gGEd/FehstB/6Zm10qHbcqAxE+OzqWnrJ9yvfjNfK/PJgNPdIxNmFeOczLmnSzxuoSrTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOzTUmvMTBwsX3Zo0Iow0xAo0xoyleaeLKb81rG3G4o=;
 b=rdZnNP2LyC6PUAz7Sc+JkrzOVLX3+GIBAgQdsVd95nYSs25aqmeqnnhF7ydWDn/uZBIpke4MXKW1crJpmqNA6EzQxASSKLuVkkt5dcbENyMyj0/8l+4OLQpDQdQdfl8W+dwB+3YAROjWuydYpRxwGOAithhkscZ5euFvoUw4TK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 17:57:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	James Dingwall <james@dingwall.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
Message-ID: <aXJW-9Ken2pbkCsm@Mac.lan>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com>
 <aXC1sFjIRUEB7qOW@Mac.lan>
 <d6e91265-b045-4257-8a41-6cb77a785924@amd.com>
 <aXERjdPS3KlcD3C-@Mac.lan>
 <a72553d1-3d79-4314-aa41-11a09dc60089@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a72553d1-3d79-4314-aa41-11a09dc60089@amd.com>
X-ClientProxiedBy: MR1P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: a3630fc0-e33f-4181-57bb-08de59d75772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REdrQ3JJcDkrVkc5dERJaElPbGZBY3VuakFSQ0RjbCt3VkNpYnZHNWdFRnZ3?=
 =?utf-8?B?KzBtRTUrTG1XMU5oVGw5b0I2UVdrOXNhcy9aeERkdTJ2TDZqMGJFOTZGTFVM?=
 =?utf-8?B?TEo0bitrRW43cGduQytCc3VWWU52WVgwZ1JIMHJvVmtDeXVsWkw5TzIxeUZr?=
 =?utf-8?B?ZnN1OFNxUGM3SnhFY0J1UkUvWGxnczZDSjJsYUxEYitpUlhIVzlPNDJ0SEZa?=
 =?utf-8?B?Wkk2Zmx4aUNGaC84ZVZ1Wm9nZDZuRzFHZ3ZZbmc4Tkd5Ylp4bmVZZVR1QWI2?=
 =?utf-8?B?QUVRTnV0Y0YvMXU5MWl4bkFhbzZZd2YveHJ0cVFraWxYdVpYQUtGWUhpOTdn?=
 =?utf-8?B?WE1wTlQ2MXVraE8zYStOUklhTU9XNGR4NUdZcERQZU5aKzZYUWlTcEFjS1dI?=
 =?utf-8?B?RHVXa09qNHExRDhtN1dzZmNKV0NMVmpUZ0FzcERqYUhqQ1pQNlNENytqVllG?=
 =?utf-8?B?ZTBkSVpSK2kzRzVNczR5UWRTdjBSWm5zUG4xRG1lS1J5M2R1YzNRUEdwWXp1?=
 =?utf-8?B?U25MVm5PR0M3ekdueHRFM0dZSnBGemM5QVlnSExrQWZFUnlMY25LZCtiVWNx?=
 =?utf-8?B?bk9JamMyNWUwRFcxWlQvazk1VE95elU2V3NFODJ1MExLWFJjcWtrZ2dOYWsv?=
 =?utf-8?B?Qk9uSDR0Y2Jjb3I2aWZGY0FocldDeERHK3NLYTFvVENmcjJINGZnNEMxYWVs?=
 =?utf-8?B?SHJOVVRDcktMMmhkeDZubWwrQXlHT2R5ZEQ0bFE5dmh0YjZTYlJwemVMS00v?=
 =?utf-8?B?T2pQM2RkVFpjYkhjaWxWNkF0YzRmZlFCNzA3c2puR293ajdBOFovVFh0b0Fv?=
 =?utf-8?B?M21NeUM2RzdybWMvRkxnQTRlVll1WHlDdGswVFJrSjNhVkFWb2pmYk9nbHMr?=
 =?utf-8?B?em5LR1FpVC9JVFRlV0t4NVJZVXFmTTk2WDJxT3hBaVp4d2RvMWloTC83REQ3?=
 =?utf-8?B?dndiNHYvdjN2aXAzRUJyUDJHY3U4czhWcEc3SkwxU2FaYlgwNmtRc0NNOXJq?=
 =?utf-8?B?Y2REOElzelNSV2RZUGJsTDZEL3hFcEp3N0VqQXpOQ0tmZVRGd1hGaHl3Y2hH?=
 =?utf-8?B?RDYxWHE3Mit3VXEvVlJSRFdqSUVLVVp1NHdYeUczVkRSLzhwYmc5aVJ3RVly?=
 =?utf-8?B?S1NVT3JXcURGcDh1ckFtbUVlYkNaMkdpenFiUFhGZ0RzdllBMTVuK0NkSUZW?=
 =?utf-8?B?RzNSQ3pmdU9yUjlPL3hsMDlGblRDa0YzUUZURmZWejk2YUxsY1NQdnlmVDM1?=
 =?utf-8?B?akZ0R0trWFQ0VFcvd0VUNzQxWks2R2VROHF1MWpuTjFKT1A3VlBNbjVPUU5D?=
 =?utf-8?B?QzEreHBYREo2ZEUwaml6YnIrbmNNZSttN3V0TzhQeG5JOUI1eTZWTVYyV3pk?=
 =?utf-8?B?TzJzRG9nd0R2bFFJRSsrZW9hcFlxOXIyMzkyUWNwZFZIeTR5VHVjcGNkVDFF?=
 =?utf-8?B?NnozbXR2a1hBN2tYTERxZjhXY1pHNzFWNmFyUGpocDFmYXFXNk1yQUFrMk9a?=
 =?utf-8?B?V0VTVklJSHlhWkV3dG5aYStBM0JySzJxT1MweHJ6VFB4Wmo1dE1BYWRZem1T?=
 =?utf-8?B?WitCaVVnZHNpTURjYmpNb2pTVzc5SXRyallCVzg0bVJjcTQxR25oaG55VDY3?=
 =?utf-8?B?QzFRS211TEFoOWg0Y3FCM2ZCSDdnTlpJRzFvMGFuUmI1djVHdVZNRTFBNmxQ?=
 =?utf-8?B?Sk95WERvZE5pbk1uemxpTHhpd2xvWVFLRVlPYmVFamJjaEdnU1ZvOUFXM00w?=
 =?utf-8?B?V2MyK1pRdlkrNndqb3FpUnA3TDB2L2t5dlIwblkrbE1mRXYzbXZzQnE4cTlq?=
 =?utf-8?B?WDZ3RDlQQXJWdDZLeHFsSFpWdEdTR25BV1BZNWg2N1RiaHQxUGIvQU5GVm9T?=
 =?utf-8?B?Tk9XUWtsZFZSZzJvUm11RkJhWlZFRVdKS2RVTGFYYnB5empLcFA5Tk1Gd2dp?=
 =?utf-8?B?ZUNValBPR3gydXA4T3V1bE9RQ1ltVlRYSUI1WkNORGc5c1FlT3ptOFoxSHF1?=
 =?utf-8?B?ejd6dzFibDNWK2lQdTJIUlVpUm9JUlF4MVZ5M0tiNW5McFFSTmg1eFFvWFF6?=
 =?utf-8?B?cnpIVDFMckR3RnVVd2RNd0FhSmcreEpObnF4dnNQRDVhODcvOUxta3c3VWlB?=
 =?utf-8?Q?L6+k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N21FOTZnWHV0TDFVS0FkekRlMUJMa0duekoyamJ0U241Qm1ZZFpSeDdqejVC?=
 =?utf-8?B?bnNwcTB2OWRyRTNDYjc4bUlMZFpoQi9FYXhBbTJ1NENnOXY0TjNZOUdtTkhU?=
 =?utf-8?B?QlFCTmsrWUJ2TStERWlYVE1aU1hwZVgySEdzZW1IVE1pY0xqMDZlU1RMdk0w?=
 =?utf-8?B?Tmo5WjljaEJMYWplNTVNdmo0bEprajBYVGg1bzhrd0dPM1YveU93THZqSzNH?=
 =?utf-8?B?MmppcjNRRG9nVmQzRFFUSVFqRmtEL3A3d0paSTBBZlFuR3JpckJoMm9yNlJN?=
 =?utf-8?B?TjJDb2UvTUtNQUJmNlQ2WVZoUUhodmFnb3dRc2JCWUNta09sR050VzJYaE02?=
 =?utf-8?B?L0RJdHlWdHJSTnhiNWd5NUlNekxZVDVqWWo1ZUZqRjdZL0xkOXVoUnZ1K3ZC?=
 =?utf-8?B?Y1BSRXJ1MzArWkgrM0h1M3hWbDhackYwZFVZellTOVRTYVVkSnNwZjNFSEZh?=
 =?utf-8?B?OXp2VzJPM1pGR3VyK2lSd3JPaEdNZnF5VnFmOWFSSlc0WnE3SE4vNGR1bnBY?=
 =?utf-8?B?d2lPbmJuQkoySkxaQkJZWjBCbW44Qjh3QU5DLzdkRG5PL1RkQzE1YVJCdEV5?=
 =?utf-8?B?YVZ4bHN1NGZBRjFHSmthNXdjYjB6Qmdid1h4Zmo4Q0U5TjFUelpqNjg4NlRF?=
 =?utf-8?B?cTNSUTBHbHVicEYwWktEYnNLSThrU2dYRCswa01GS0hNOW0vK09CVGV4dzlZ?=
 =?utf-8?B?VWkwanlMMU1KQkN3anBCYkVHNCtaUms5djFLdmNncE1qcG5QakNJNzVHUThO?=
 =?utf-8?B?Tm5RK1FFZXhuYXZOVzgzNCtobDZKeGxOUXJhVHhZdUZsMmRKejRXVVRxRDB5?=
 =?utf-8?B?RWZDSmtoZ2tabExrSXpwK1dBZmtML3J5SUthbU9UNUlFSTU2SnZQb0ErOXZE?=
 =?utf-8?B?d0VpNmZMSE5vaVg0bHI2TEk4dW03TnZyWG50Wm5xanExVmlSMW9ua3ZIZSs1?=
 =?utf-8?B?Q0NhOGVadXhTTkpmWUlEclpyUjg4SlZSRGVsMExrdmgvSGRRTGc3Tm9iRkFy?=
 =?utf-8?B?SkNZTW0ybWcwcG5nWENPMStRMENLWU1LQ2F5VkYyVVg1MEVsR2svR25MQ1cy?=
 =?utf-8?B?dHJpRVh4blZRTWlxQndYeFBGSXNiR2pRSjd4RDN0M0p2OWVKc05DY21jeG1t?=
 =?utf-8?B?NzJISVBDZGwwU0hzcFhrNEJuS01DZFMzVS9VSkNzdHRQb1FDaUJWZG4rbFBa?=
 =?utf-8?B?b3N6U09mY1Z0QzNJcDZuNGZUbmhLMHBDdmVxb01kRUxsTlFmQ3pCWUgrWjRj?=
 =?utf-8?B?U1NxeG5kT0xmRi9vVTVyNHdscmN3S2NTVzJXdjN0NmEzczAxdFJVYUcwRy9q?=
 =?utf-8?B?bkJxVEdhQ0IyVGVudlpwbFlSWjZRYWVJaGtoRFVhQnNBWnJaTW9YN3YzcWZB?=
 =?utf-8?B?RjhOWkRMcTlVWlBXWkV0Y0huT2hZdGxyQ2NwTXBuOXd4YmNsTkdJcGdXQlMw?=
 =?utf-8?B?QjdUdmUvMHlHc1lSSWZyMWNkZnFpQm1LNTYrOXhSWU1RSzgvTWpPSjN0TktQ?=
 =?utf-8?B?RGJ5dTZGNkFNUGJqa1Z0U0dOTnhjOUhBOGtMaEQ5RXNxK1phcFZTRWxDdnl6?=
 =?utf-8?B?Y0ZXcTlvRXNnMkNmcUhWTE9LaUw0TEN2SmRaMzNtNXgxWi9LaVlUaGVlMmdw?=
 =?utf-8?B?TzJ6NHF3ZXN6eTBHTEIvRjUzQXZla2ZNbFZvTGRxOEdiRGl3YWVoNENWbnht?=
 =?utf-8?B?K3FtanJkU3A0ZlZQZWJsTUxMVDAvRU1wZXpyWFN3N3Y0U3lYcW1RMlZIdHVz?=
 =?utf-8?B?VXhBRHRZWkViTTVZa0pjRXNidHZBTXZwNlRHdUxkdkJFOVFtNEdTZm55dzlP?=
 =?utf-8?B?ZnByZlJrVGxIMjlNeEN2QVlHNTgvQUJDS3NqNDdQYUdnK2JBYTJpVWR0RVkx?=
 =?utf-8?B?c1VOWHZmWUFzenpSanV1TGw0RmJ2SUVaemxzR2lpNjhJbG9Yd01hYXV6RFVv?=
 =?utf-8?B?NlhxcjVJeURNVVh4WEczU3hLL3grVTlyS2NlYm9DL3BOU1pMV2lSZ0NoTmxw?=
 =?utf-8?B?Z2ZGaFdTaEhpQXdJU2JpOVNVcEhKVFhueUM2b1VkcFVwSTVJeEp6WVlCYVhK?=
 =?utf-8?B?QzVNVG1CKzFqOXRIbURtSi91UlZSaE5HMVdzZVhVRzQrZVpFdmJ6OUQ1NVp4?=
 =?utf-8?B?OVovV01VbXhQU04zWTNoVEFLMFlrVDZOeHJjUlRieHRnenF2aHNCbzRHRk52?=
 =?utf-8?B?UE1yb1ZZR0RJbWNaa0plWkhOQnFhY2F6djZDWHdFNnJRdWxEUVVScjgvb1FV?=
 =?utf-8?B?SENuSE5SQ3F3ZEQ4cmpkQWttWVJ3UHBoajNyK3ZWakV3MTM4Z1hnZDNORDdL?=
 =?utf-8?B?MTlDaytncUZlbWhrK2lUc1JneGIzMkRaNExrdjZnMlIyaENVdmozdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3630fc0-e33f-4181-57bb-08de59d75772
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:57:35.5473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWVb+Zy2N9wRB1OnqoWyNJpUf83cI7gIx6UErjUEeSGEcNgcGLpAUKTYVjb0TVQMhi87L5jZqHwOfJQ/pnokSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7354
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D1946A83C
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:40:01AM -0500, Jason Andryuk wrote:
> On 2026-01-21 12:49, Roger Pau Monné wrote:
> > I haven't tested it yet to see whether that's OK to do on PV, I would
> > think PV and PVH would be the same here, since the setting of the
> > xenstore target value is based in the return of
> > XENMEM_current_reservation for both.
> 
> On a system with 32GB and dom0=pvh dom0_mem=7G:
> 
> [    0.295201] xen:balloon: current_pages: 1835007 get_num_physpages 8220126
> xen_released_pages 6385120
> [    0.295201] ------------[ cut here ]------------
> [    0.295201] Released pages underflow current target
> 
> 8220126 - 6385120 = 1835006
> 
> And also for PV:
> 
> [    1.406923] xen:balloon: current_pages: 1835008 get_num_physpages 8220127
> xen_released_pages 6385120
> [    1.406928] ------------[ cut here ]------------
> [    1.406931] Released pages underflow current target
> 
> 
> So we don't want to subtract xen_released_pages for dom0.  Is
> xen_released_pages expected to be non-zero for a domU?

Oh, yes.  In fact I think the patch here is wrong for PV dom0, as it
shouldn't subtract xen_released_pages from xen_start_info->nr_pages.
I will need to send v2.

> IIRC, for a domU, xl writes the xenstore nodes as the ~build time memory
> value, which doesn't include video ram.  Later QEMU populates the videoram,
> which increases current reservation.  Then the two values don't match when
> the domU initializes the balloon values.

Yeah, the modifications done to the physmap by QEMU skew the target,
so what's in xenstore doesn't match what `XENMEM_current_reservation`
returns.  However is very hard to fix this.  We could attempt to make
the toolstack write the xenstore node based on the return of
XENMEM_current_reservation once QEMU has started.  Sadly a domU would
have no way to know whether the xenstore value accounts for the QEMU
consumed memory or not.  We would need to introduce a new target
xenstore node, which is equally messy.

Thanks for the testing.

Roger.

