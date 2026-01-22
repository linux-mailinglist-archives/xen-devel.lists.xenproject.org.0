Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF0NE7X3cWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:11:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F53650BC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210705.1522331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vireJ-00012F-Qi; Thu, 22 Jan 2026 10:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210705.1522331; Thu, 22 Jan 2026 10:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vireJ-00011L-JW; Thu, 22 Jan 2026 10:10:47 +0000
Received: by outflank-mailman (input) for mailman id 1210705;
 Thu, 22 Jan 2026 10:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vireI-00011F-4M
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 10:10:46 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c6e5bb7-f77a-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 11:10:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB6123.namprd03.prod.outlook.com (2603:10b6:408:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 10:10:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 10:10:41 +0000
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
X-Inumbo-ID: 9c6e5bb7-f77a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQGABl65XVTxAxWnuhVcS5Niia+PHrwJhni50a1OVqs+esAxwD9uz1frUo4NFnoJ/xtgMEpUozAmOdvS2tRA7rlPaHssSVf9hUDYskYgJ7aJtpAjvbPQG9exeJdpTSlUUl+J/89nZq8S4hfgnctRrn1T98w+V2cp/RXUp8d27iYdteAj9qrCKp1YuSruaAe4RvlROQ9nu9hxiBlrTKK5lubg08BaMs8MQUJ8WS1z/zI5plf9Qh2WL/b7e0hXZIoH5aqjq6Nu3kRYYo68CUREh73MpK356fXdEDCGGAZ2ucytDoe5wkbSpc/VO/FYct0Cc4AtvwEs8CYkTvmY3ctxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxwn6ez9iCqgQgbEK9PUYb4V9q+oTsOG9wl4sbnLa1Q=;
 b=eV3Q8mqF+bEFwY1KnUp4WyxXHyMN/JmcrbPkASBB18Ql/LKqOfZ0ttza3JA12oKGWqK625ZaXCp7r+mcFsID4Re1dw5rYMNHRaBpoxhF0TfDFG3qHBp9jfm8E1v5N1E5suSHBDCILxefQcHCBHF3okkDxZFzOkoNPJyDByuAeeLyNSChMgCC7a2iHjshFfZABtdTmtE8y6ilxbK3oxMbZ1Po6GW1WJixNI3tw2FSrDVlIQG7t282ILLBqf0/7GJva0Wc1zv9cRL5bD9xiMpNF7UJ1kQvxDZatfw94af7C1+XUGoVfTVVlQnZETiNHkNEAnQdrWJZtzMdMOKdXxxTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jxwn6ez9iCqgQgbEK9PUYb4V9q+oTsOG9wl4sbnLa1Q=;
 b=CCZ5MWIl/ywtPacKZXH8imLq1KjwCwIDWhv5Xlv9pAtnuqg79DDpCgBdumDUU1diOjev7PEH833MG6gsD57lCVkjMevxKY+ndF6zz4sVDWtAGFE2pB60QtEWX1XApzcohwrFcUKXPHhXMDpfkBD1KjGxioKDIgbkyajZSCEHwnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 11:10:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 6/8] x86/HPET: simplify "expire" check a little in
 reprogram_hpet_evt_channel()
Message-ID: <aXH3nocF6a8z3ZHn@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <0bc920e2-2e32-4b3d-9ed0-a2c2b34e9591@suse.com>
 <aXHrgwifS3PDzdfa@Mac.lan>
 <f87d523c-def4-408f-9626-a268c636e582@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f87d523c-def4-408f-9626-a268c636e582@suse.com>
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: de53e53e-d51c-472f-e391-08de599e7f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDVuMW9zL3BMUFp3M3gzeCtUTUE1cWxZbVUxWGNnVEtBclNjZERBQmlqRFJT?=
 =?utf-8?B?c2lWdXhuakRYTndPM0c0WlppV2gvTXlTdkI3SXpDZXdrSXZuVHhjYkVEbnRD?=
 =?utf-8?B?R1c0V014ZUQrL2c4MkorZDBLN255ZGsrQUxxZUdhOWIzbWVpQXRiMUI3U2dH?=
 =?utf-8?B?TlE2MnJNajBNTDFzZFJVMWg0TTdVN256Z1d2a2phSCtZTVd2SEFLbjFyTmc1?=
 =?utf-8?B?ZDI5N1E1ZWZGMXhuUFBTaTQrYWM0UXQreHNON3Q1d1BQYnlVMTVXb1ljQVJu?=
 =?utf-8?B?SU9nRWVEYnVZWG1FemYrdytXNU5KaVAvNWxDTnpvZ1ZuSWNWbWd6QXNCOUNF?=
 =?utf-8?B?TUtJODdHTGpnSmVITmh0UjJnQmJnUy9XUmZNQmlGRWhXNzVoMStPRWZuaTN2?=
 =?utf-8?B?M294WE1LejErczVSU2wyUHlrZS8wc3owSGh2VHg4Q2gwSW8vaHQ5b3JrWVR5?=
 =?utf-8?B?NFd2MjVNVi9tMG5IVUZLYmsyS1dLUkhtSXJuTTVQSHFKOFBHdFVsaEJraWxX?=
 =?utf-8?B?N01rckVjWC9wTDQwcTI1Vm81V042QUJpZCtXOWlNYm93RThNUFZVbzd1d2JH?=
 =?utf-8?B?VDR2cjgvT0ZMVFlLRnYyR0J2bUJnRDRQbGVDY2JFN1lycTFWcDJaMEtwSjZG?=
 =?utf-8?B?Z1RXeUFpc0JKMTFJdk1WTC9vMjFoNnY0bjAzMW5lRFNZSTRIV0RBYXZhT2Zp?=
 =?utf-8?B?a3I0dWFGMHJEN0MzV2xzRXVVeG1zU05rYVlTYnN2V3d3Z1FXMityTU9DRm1D?=
 =?utf-8?B?ZkZ0eHRpWVdPU0VmaXBYd0tDYWUzYXBCTDFJR09WYW45ZHNNRmdScm1BNE1E?=
 =?utf-8?B?ZWNMZ1N5dmRQUDFpRkdPOW9zN24rVlh4ZU5PeGtkMytOOXJJampjbktTVjdz?=
 =?utf-8?B?eHF6cnpNbEcxbVExMDNmbmNCQ28wZ3hWd0FsVHBkRkpjcytLbzArZ01GZWpM?=
 =?utf-8?B?Q3ZmRDRXdExqM1pFQXFKbHBvMFdpQ01tb0JRL2FoNU4zalNWTjE4YkFia2tv?=
 =?utf-8?B?TlFTUHBMd0R2MC90VlZ6cEJZS2RBem54ZEZEU1VKWVQzTkFKTFJlaUxkS2pN?=
 =?utf-8?B?eXZHR0dZaW5jS0RuVHdpRUU5emoydmkza0loN0tOTmVKY0k0aXlvWkhkdU1u?=
 =?utf-8?B?TkRqRnZqVGdQRCtZQUdYYlNZL2t0MHNQRytlaG1IaHFOUXBQcStLYmJKbWRV?=
 =?utf-8?B?bWJwbTVCWVpxc0UybGs1b2h6WE9GRUNncXk3RnRkb3dQd3pVYkNoVGRJRTJ0?=
 =?utf-8?B?dld6aDdLMjhyVjQrSzNBSTJwN0x6YVNHUm9yQVNxR05pcWtuT1lxdTVUdEZi?=
 =?utf-8?B?RHZ4MllLM0RJQmlaLytwR0FzN1BsNDJ6bE5jSzRVVjF1WnZnekxrcFgwRWs5?=
 =?utf-8?B?ajlPT2ltb3ZVak1Cb0FwMEt3cndjdWl1cmtqdmpGUktROC9JSldSaGNLYklh?=
 =?utf-8?B?ME1LQXpmRFN1dTUvc0ZjSXlSYk4xL2ZRYlJuTTVpNHJ4Q2wvcldubVRkdnc0?=
 =?utf-8?B?YTlOVnpWWVM0bGo3TmxBTHFSZU83dTRYVWViSXl2djZjMlN0SjQxbytRamk0?=
 =?utf-8?B?RERBMlNBMzNyQUUxYjR6aG9ic0xIWk9kdDdpcm9DZmxVNEN0M2tzTkU5WlY3?=
 =?utf-8?B?a0h2ajJQelVCL3JYTmJpcTUrSFNWYVJCZFNWOUpzb0pKT25La2dyTWxhSEx0?=
 =?utf-8?B?eXhvRm5sSFZqRFlxOXZENlJDaVZkWW1QcEYvYkNMU3hPTklRVERpNmRNQ1do?=
 =?utf-8?B?MCtXNlBUcHlOREovSUF2QjFpd1FYL2hXTDVOVURkSzdmRmZsYWxoTFAybmpC?=
 =?utf-8?B?ODd6MFF5aEJMdFJTTHloQmxVc2IzQ0N6OFhHU1F0Q05aK2RFcE41Ui94MklR?=
 =?utf-8?B?cGhkT0V6Mi9FTEoydFR5MGVhOGdzS2NsdGxOdWFVWGJ2Y0FsbHBmYXdBSmFp?=
 =?utf-8?B?dnMzc3p5ZUVaQXVyK2N1VUNuUjlJZHpNaU1ORXpNV3AvcjFGR1dpT1dDQVls?=
 =?utf-8?B?VWdZQ29QYjB2ZXI0c3o2ZmVTWUZjdG8wclZodFRNV3FEcDZqcFZMc010ZXVB?=
 =?utf-8?B?VEJXb1ppVnBLUGx3WHhOdEQrYnNNL3B4UkJjVWI0RkpCdWVrbXZVTUxjSzQv?=
 =?utf-8?Q?nX5A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0VTdTdHSlZOUmZ6TWptY0JSUCt1NUpwUHArZE80NW1mbVhLSU9wazdONEFM?=
 =?utf-8?B?Tzlzb2dWUGp4Q1UyUzJjSTIrc3N6ZmJmWW5tVTI1Sk5DRXVqNkR0VGxuNlJz?=
 =?utf-8?B?TkF6enRRRFMyeG15MjVlaTM4NlgwUFJ1d0FPOWRGbVJyMXBPekdKSTljZmhG?=
 =?utf-8?B?aUVFdEpKaHE5L2J4bDduUW9pV1pETFM0MHdTWGNCbEYzbjgrNytTMWF0OGZ0?=
 =?utf-8?B?YUlYdk1yd0R0eDkvVVpGem5jUkRhelIzaWVaTVZhSDZCeTMyTHBiT0s1Y3F2?=
 =?utf-8?B?Z1h3dFFiVm4vL2hTT0tPak1vVnZsbnZMNDg4QWp3RElMTW11clNkNkp1cklF?=
 =?utf-8?B?K3BraFRrUlNPUVRyV3lZUHlESkVXRzRpb1R3eG1UaDRwKzdDSU85NzR5QWFy?=
 =?utf-8?B?TVlOZWpiNnh1VXVLZmd1ejBCOGVRRXcybno2NEpzN0hqbnM1Z0JOMkJHWnVy?=
 =?utf-8?B?ZGFyako0UEN0MGZ4YTIrK3lHSGJwcTZLY1hrQjhlUG5hbVgvb1lLMVYzTnN5?=
 =?utf-8?B?QVIvYk5jQjdkT0NDNWN5ZEs3alBqNGJiaGJkeml6eEpyZUZxSmJOZk5Xd01Y?=
 =?utf-8?B?UU5iZ21uRHRvWHZSc0tzcWZWbFlMbjJpQUtkUmg0ZXhpNGpDNURyVUtXeGJL?=
 =?utf-8?B?OGh5VTNITitZTm8xKzVKaGkwR3VYaUJ3SHUxUXhkVUtCc2NoSzRxeEo0UldG?=
 =?utf-8?B?TmRqVzBFOVZZb0ZBZitKMDNBZWJkbEtZSTR5Q24yZFpiZXpsVzEwd2xhdXhS?=
 =?utf-8?B?Ynp1LzUvWWlnRGhMTFdxRjJMWnpkRUNIdFRnckovVEhFZm5NN1lVVFZZUVQz?=
 =?utf-8?B?TngrYTBmb1lGQUlOYlJRSXZkVVlyR1ZMaUJYUlhPSC93NUlWWU1DUWJQWmFr?=
 =?utf-8?B?MFZzdWJtZTdKWk9SS0ozc2dpWFV5VGwyNlVONmg0NlFCTzFVSGF5dGRYMmxG?=
 =?utf-8?B?WmNLMmN6bnU1OExBeGsvUXRrOUVHTzQ4WWJFc3NXUVB6UllheXJKNlBqZXM5?=
 =?utf-8?B?QXpyU3U3Y2lTREFBVS8vbUZ3TlJ3dFdET0tySlNGTDVHbDI0MjFQdU1YRjNw?=
 =?utf-8?B?ZnU0Nm5QYWQzWW9RaUJqUWVQdjBiNDdxY1F2M3pkQzE5cGZsZ1N4bU5zamlV?=
 =?utf-8?B?SFNmaWh2amgvbzVMN1dlYmtOdktHclVFQzF4RFVEcUJWN0xQVjNsNUE1SGhx?=
 =?utf-8?B?ZDhOWDVVV0Nqb05Vb3U4NWJFZmFVYjAxWnBxbHV4bWM3Qm94WTJiVzQ2MEor?=
 =?utf-8?B?eFVVcDNicDYvR2xobWVZWmp4UTJCdzRpZnpCd2lZcy9waEZyZFpZS202Yy9S?=
 =?utf-8?B?RE00RC96KzA1MzhIdjVTSHUwQUVLSXNtcEFzT2x0OXdBMHFPVzhiZkVuZXFX?=
 =?utf-8?B?Rzg1WG9Ibmp3K0I1QmREUXFvRGRkcEV3bkNrWnFxRlpHUTRZR1BFSkRvS1g1?=
 =?utf-8?B?R1BEL1k1aUJsRGxRWU5Hb1EvMzJ5Q0czeEEydUYyUFRMLzRXYTlpbEdBUGlX?=
 =?utf-8?B?dzlrNzUySjF4UlZQLzBOVk54MVJucFdlQ2pIekU1bWVQMWdwTm5pbDJ0VVBm?=
 =?utf-8?B?amJtYVU1UFhtT0tSREhWY3R3Ky9lOUxkQVpWQTMrVGRGTk5zclpBeElDY0xT?=
 =?utf-8?B?ajk3RGV0TnUzK05ZYzM3enZnSGpUQ2ovQnNIbmc4M0wwSTJibkVncE5GMWQx?=
 =?utf-8?B?cHVzaXRYNUIxMUlMMTRuSHh3a2x5MnhLYkVGSHc4QmVDcllLdXVTUS9DWWVI?=
 =?utf-8?B?dG8xdmFiTnFPTEliekxnYUovTjBlL1ZhbjdrbEMxeFRnQ0RteTl2WmRvdE1H?=
 =?utf-8?B?Y293cURtUUhGa2hDc3ZVUlJSWmgwdzdDOVgvNUVSVFhKZm9VdUF3bndFTVVG?=
 =?utf-8?B?R1BlaS83QXZvRHRvS2NwbVRVak9hNE9YejB3OUdTZTd0TTRMOWZqb05vVHRz?=
 =?utf-8?B?aFlDb1Q4RldYdVlFbTdRTkt3dEltRjhaTW51dCtGMUFLNU1NYitURTdQOGt3?=
 =?utf-8?B?UERISi9UY3ZvTitRRkl0aEtnWUtjRHEzTWZaeHpwQ1FtVlNtdTNKQ2JhNnN6?=
 =?utf-8?B?QUVYWkU1Uy84OEdNdkkwcFg0RG0yOFhaMnk3R1E5ZkRpM1hqMzFzckg5TUky?=
 =?utf-8?B?c2tFSFp4VmNlcEttamVuRnhxVEZwWkJ5a2N3ck9SUTFRc1lsWWUxWW9oWk5V?=
 =?utf-8?B?YXgzclkzZjNNVThoSVpZdU85ZHBRWXlyKzRkZnY0VkxDcXQwdy9NQzNyN3hT?=
 =?utf-8?B?WVZWeGxOSjY1clhlS3V3WFdiSU1LT3VSaFpHWGJGQUNGZ1FuRmR0NSs3ckhX?=
 =?utf-8?B?c1hmMmM0UkVKUjMvN3VkeEFzRVFJSHJ3OWx4QVBCZ0hPcS93Rkw4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de53e53e-d51c-472f-e391-08de599e7f51
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:10:41.0942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +msJ9dB8gi2w8WOL+0Mue5VTeBgB0Wys8Wfu8POIsOEZ95erzqysHKav16bssAXqKY5x6o0uP6YcZ5XS6ts/Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D2F53650BC
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 10:28:51AM +0100, Jan Beulich wrote:
> On 22.01.2026 10:18, Roger Pau Monné wrote:
> > On Mon, Nov 17, 2025 at 03:39:30PM +0100, Jan Beulich wrote:
> >> When this was added, the log message was updated correctly, but the zero
> >> case was needlessly checked separately: hpet_broadcast_enter() had a zero
> >> check added at the same time, while handle_hpet_broadcast() can't possibly
> >> pass 0 here anyway.
> >>
> >> Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > Similar to the previous commit, I wonder whether it would make sense
> > to add an ASSERT_UNREACHABLE() if that error path is not reachable
> > given the logic in the callers.
> 
> That would mean
> 
>     if ( unlikely(expire < 0) )
>     {
>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
>         return -ETIME;
>     }
> 
>     if ( unlikely(expire == 0) )
>     {
>         ASSERT_UNREACHABLE();
>         return -ETIME;
>     }
> 
> which I fear I don't like (for going too far). Even
> 
>     if ( unlikely(expire <= 0) )
>     {
>         printk(KERN_DEBUG "reprogram: expire <= 0\n");
>         ASSERT(expire);
>         return -ETIME;
>     }
> 
> I'd be uncertain about, as that needlessly gives 0 a meaning that isn't
> required anymore in this function.

Hm, OK, I was under the impression that both < 0 and 0 should never be
passed by the callers.  If expire == 0 is a possible input then I
don't think the ASSERT() is that helpful.

Thanks, Roger.

