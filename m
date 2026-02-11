Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBMeHFrUi2njbgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 01:59:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B719B12066C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 01:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226930.1533301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpyYy-0006nX-Kj; Wed, 11 Feb 2026 00:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226930.1533301; Wed, 11 Feb 2026 00:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpyYy-0006ld-H7; Wed, 11 Feb 2026 00:58:40 +0000
Received: by outflank-mailman (input) for mailman id 1226930;
 Wed, 11 Feb 2026 00:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Yav=AP=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpyYw-0006lX-Lw
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 00:58:38 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c85779a6-06e4-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 01:58:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5064.namprd03.prod.outlook.com (2603:10b6:a03:1e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 00:58:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 00:58:28 +0000
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
X-Inumbo-ID: c85779a6-06e4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISoZcR//QdhEifX33laPmPu8aHkpX6q7E8JOyC1dKNt/ViyR1OK+vdlivyQad+m0JjYd97KLg+QhIbwBZeOTGdggV5IXDQ+T5CXQ3brMF9/nqGPDwMUQSzjEsAMHYm1rZfrjm9/YEaBtCVM/tCVLoQjqQNi+t/YZuLCXyWS0aIDiwui0Xh90oXr0X/2RgTy214DDzjoBRpUw0myk7p7sS2SGv2H/038y82xal2y45+SZCBVbks/I6kZcNEJdDsk63YheTwFc5C6HQetY6qSpPmNiZcyOwAaXJTlTnh7WBaiThYbEhrOdbE2wGa71QurMAqHyfIrt94z7T8g+HQuy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLLcyqarVogVOK/76OmWLICUXJWTpS84dyt6ewkbiBw=;
 b=shdPgfsFtoupsanpNUFhJXnlwk4Dc9VYhQPBs//M/KzOFKhTitLGKU24aJrJ+s95KpgqVh/fHREp7jfPL6xUur8hqrbQr1YR3x5svbgX1n2EimsMBhMVbKnBI7iyQG4nC4A6HFUUIYw0HvtOimz60nxfGFe2nmGqZbZyUqTjUzfK2JtswzSHJN/osNS2r3Tp9kEI4wQ9SHqyTyD3EkYPfjReHzNCOirp4i713hUZxaVWcCe3mWeuAJbHBslrlV3RenaXiIJ4KRqMsGPjTr2qiL2gOSi20f9R9ZvWNzE/6447ExnC2jREZ3r2lmILvihjkk1CIyskmE1OiHu/LmE7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLLcyqarVogVOK/76OmWLICUXJWTpS84dyt6ewkbiBw=;
 b=plTI1Tavf/HX8D14iMhooX5mdJFMRFUuMyiGOrIf+lVpeGAUQZh/S2aD9xe5aEAhHwZUv/VkoZ4SYobuAks5vBPszSL2cN229y/BR51RX6WRRRN9a/QI9wew13HOt2QmP5A5CLYH2rXv7GW7kggfY7GHyhnjgNInV6KMt01GlyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <33667892-789a-4e94-ae0d-d240f7062b81@citrix.com>
Date: Wed, 11 Feb 2026 00:58:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] EFI: Fix relocating ESRT for dom0
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260211001650.1592239-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260211001650.1592239-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: cb644ef3-f38e-4fab-18a0-08de6908ab0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG93QkwxV1dWS0Z0MHBEQ2Z5dmpNQlpnakVUS2JCY1IxYnV3S0Fmc3VUYmlU?=
 =?utf-8?B?K3RObHM5K3p2M014cjRVcExTYm9yendMZzJwUUJqcllmeFhBYUNSZk9ZWUxX?=
 =?utf-8?B?YVZ1VlhvVzVPZ0tNaXlIcm9tYTkxWWxFNVdVejZlK0dlZU5kMXB1ZnpFV0h6?=
 =?utf-8?B?UE1QUGRaRXpwdlNnZWp3UUxBeDI2bHhDNDdoZXBScE9ibGRpQnpqUzJXdTNT?=
 =?utf-8?B?RDJuTFp5WjRSZW5uU0N6UkNYdWJvWnd5dTdXZGZHNThFMUlTMjZTM3FzbVFB?=
 =?utf-8?B?N0loUmhmYUNZbUJEK0ZjMGFzWEV3MWZsdE44NENwL0pqdTNHcUl5U1NJQlQx?=
 =?utf-8?B?aWJVcEE0ZUoxMWk5dlNJbEdzNHp4VlBXSWd0N2JONW5yOTgyRDk2SFNRYVNi?=
 =?utf-8?B?eTFOakp5MmFOZDE2THRsbzdBZE1BMGZKWVB3NjMzeWE0WmlGZjJ4YmNWZDY3?=
 =?utf-8?B?VGNZdEpWMGRwb0V5SDVpRWROL2F3NjhRaTJtc2M5OXFlL0Vaa0tyRFdUQjh4?=
 =?utf-8?B?azh6WS9nR0JCMlJZbFlSeU1ZOVQ1SCt3UkdsQnFIS28wR3htTy91WHFvUkFz?=
 =?utf-8?B?M0YrSEtOcGFWcUJmMXdQVDRrOXpUNW5mSm10ZUFjQzFGaE9kMlRnSDFhTksr?=
 =?utf-8?B?TzZYUmFBT0NXTk1OamJvOGZvOVRKaUNJSGdEd3ZKY0syblZSTnpLYXRicWFS?=
 =?utf-8?B?VE5lWG16a2NGR0tNTzUrOWFyaGdTUVQxVTZTU3FYWXJzc0ltbXNDQ0t3bFdx?=
 =?utf-8?B?NFZnMEJIYk9vQS8rbHNKNCtVL3NzRHVXNEFiUDJHYXBrVFJVWnNwMUMvRUUy?=
 =?utf-8?B?Mi90ZDNOZGJMMnRlT09OeUd3T1hTREhqQ2ZwbXd2VkxybWE0a0dCQTN6dHN5?=
 =?utf-8?B?ek5WeFdsN1NmVURBQ0tLak40YnVzZjJORGVZblY0OTk0c004djd1M2hlY1JH?=
 =?utf-8?B?YzVTMlZkYVNmUm1KeDN3Z0ViUmh3TXNSWGQyRk5kdThxaURicUlFZFpDVnFZ?=
 =?utf-8?B?dzIxWkR4L09lVmUxbUs4ejUrUmRKZW4wVC9XV202VmRXMjkyVzVjRmFRWmJt?=
 =?utf-8?B?cjVyR044UkIybmlBTkdsSWtwTDA4aXBFUmV4ZzhyRXBEdlhjOXVvL1ZvM2Iv?=
 =?utf-8?B?Q3Y1aktsOThmNm1iSzVYM29VMXNxMWpuQTNlS1UvNEk5WTZUR1V5NEcraVF4?=
 =?utf-8?B?dmlvd3U1Z2JWSTlOSllvN1hvVFVJUDM3OURGb3lTa3V4eU5ucDNxdm90WWlI?=
 =?utf-8?B?WVBWTS9PWmkvSGoxV3gzMERGRnRHVUhySVRSTmR1S3dsUkRCaHRvMldWZG45?=
 =?utf-8?B?NE1JUEdLUVE0NWE4Znk1dE9nUHFLNWt6OGhzZ2F6aDJEWGFZQlNJUEJKVTA2?=
 =?utf-8?B?bXFyMFlkQTRqM2hOL0FUV0R1SVBNVEU3N2dvT215ZmVCakM5TUVEVHJjR3ho?=
 =?utf-8?B?WGxuZ2szWFdMTkdHS003ZDByMHVjYlArRmJZa3c3K1JKTlNtVTZBSHFNR3pH?=
 =?utf-8?B?N1JzYWl3SFRZOVRReFFWb2tRNmRJQVVMU1pDZ2NhUTFpNVVlc3FNM3p6RURa?=
 =?utf-8?B?NWVLZy96TzJLWGEyQ2tYZ2pWM3lxbUQxZVE2YjZVQytBa09wN00zeEQ0YTNF?=
 =?utf-8?B?VlpiT2lucUM1cVR5ZDR2QjdmZDBORnErZDNueTJJclFTMlI2ekZ2VnNRcldG?=
 =?utf-8?B?c3VObS9oRkpDVGREeXZrZzgzNmdrZlFvTUY2N3prNVhlZE1DWTd4Y0lFYzBV?=
 =?utf-8?B?ODBGZlZtWXhrNjQ4YUdSaks4Z3hWd3NvSk1lM3VOa0xIeHdkS1ZWOG4rVEJ0?=
 =?utf-8?B?aUhBOFZXYXFXSnIzSEdDbDJnVExzaE1YNVFuRG5lTzdVMzhtOEtNdmlZSWw1?=
 =?utf-8?B?QTJuNlgxSU5qNG1pZ0NRZzhFU1BpQ2RsaEt4SDRRb0VaRDVVelVHWkFsQ3Zr?=
 =?utf-8?B?cXNjWFdMVE5iN09US2RvWkUxTmlCbGk4WlJ6Nm5RQlYvdjQ5K2Q0SVA4T2tx?=
 =?utf-8?B?WnJRSmNoTHVySzRkTkh1UUVWU2hBbTA1cWJCN0JGb0VMZnFBWVpRaFdyT3o0?=
 =?utf-8?B?ZUtNR2luUStDMTJpU3kxMDZEU2FGR2NNak16YWJ6NjNHdkRsWGVnQWEyOXMw?=
 =?utf-8?Q?eygs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2ZuS2J3dU92NTRsN1ZoQ2JyWFpnUk55S3dFUlkxUThWaDJOSUhqWjltd3k2?=
 =?utf-8?B?TkxrSnBhUTd5K3pwZmVrblBPaU12TnMra29aYmZPY1NLdVdmaEkwM3ZWVmNv?=
 =?utf-8?B?VDRkN2wyTW9zaHdwc1FnQWpxS1d5ZStuejJpY0N3SndoTnVzUllxMGtrMSth?=
 =?utf-8?B?TlFBNjRhZnBFa2lnR01nYUVnbFBLQjViTWJDRVh2dnAxamdOYnl0SUF5OHdS?=
 =?utf-8?B?UGIyN0xOMEQxck1QUGJaMVlkV3lTUkF5Kzg1Z2NJVFpBdjJHV1lqbVBuZXdI?=
 =?utf-8?B?Tzh4aHd1Y0hHcTl0OGxqSVdNZlQza2V6aDQ5VmkrRVF0bGhON2d6VXBiWnRh?=
 =?utf-8?B?RWRlNUNHdlhscWZtTVR5c3ExQm1MUVE4aW0xR3VQYXNTNkkrS2JtaFZRaU9R?=
 =?utf-8?B?YWd0TVhVRUJWU1Y3NXhUS0VhRkg3TW14V3RGSG5zMXkyQjlVR0FOTXc1cEN5?=
 =?utf-8?B?bXhxb0xKMm9zNzB0ekZEckdFdU1idFRodEc1U1NjVEkzdTNHVVZtV0pUSkxw?=
 =?utf-8?B?ZUNqN01RUWlPMk1nbHRLWU1rOHVwN1pGRC9qWllkZzdGOTZjMVp6MGl4YjJI?=
 =?utf-8?B?RW82Y3JCbzVOWXFYWFF2NDNWZ1NqSUpvWlladjFSSFhiTXE4T0ZHeEkzRm0x?=
 =?utf-8?B?L0h1a2NVTXVsZGUvZ2J3NTM4dEVPTHZZN3FoZXZMMUtKM0c3ZURVbUVxdEdn?=
 =?utf-8?B?YWoxdXVwQUlYOFZGK0pvWE9kSFlodXBCdmdqaS9IOEU1V243bFRtUGdVR3Ja?=
 =?utf-8?B?OTJOR3FCZ0J0VmpPUEt4T2N1bkN2T2MxVjNJSGxKbzV5Mmh4NndLdGJCSCt1?=
 =?utf-8?B?dzJ0RWp3NDRTd3hFaW9xTjVQR0U2VXJlaG8vYXozOEowY0ZWcXdNUTMvUVFs?=
 =?utf-8?B?Zm96cEZFMndjQnN0VVlnMURtb3QyQzRCMGN6b2E1RUVrU29oYXhndStyb3F6?=
 =?utf-8?B?WEF1eWlQbkhRWEhVTFU4bThNZWIzMFVnT3V4TGRWTXdEdlE4NHMyb21GSGty?=
 =?utf-8?B?bEFXTHM2K0JxRFJMdWJoTmFDZjIxTzZRN05nbnpFdVhSalNWVEFMN2UzNHBw?=
 =?utf-8?B?aEllbENyUW1SeG91YnNsdVMxR29hK2FVbWNCbG5zMXlMT0VhSTQ2eWR5WTNR?=
 =?utf-8?B?aEJxT05VUSsvQnBDZ29QTVZYWG9jajA0amd3NHdyeU43Nklhd2pRSUI1TzZo?=
 =?utf-8?B?aUpGTnVFYjRyM3U4dG1JWEgrRXg2YWtGc1QxbGRSZ1JYWjdGdG9aTFN0WTk1?=
 =?utf-8?B?OGNNTEVMbU5FQVF0TkwyRTJjRFFXM1RxKzJoMjByNmhrTE15WVpoUEtYYXdF?=
 =?utf-8?B?VE1qMUs5bDlZamYzS2Rzb3lEWHI2MmtrVVdhWXduU0Y5YjdkUEl6eWxmOFZk?=
 =?utf-8?B?bzJNSWdXUldMazFJNEJRbXFrVGxPNkJDd0MvZEc1UXkvV0VhVEc3b3E3SE9o?=
 =?utf-8?B?Mkw0SE5RQTNEK1hYZ0JmYlpCNmlESWlpbi9YL1ZSZ2wxTGQybnI4UjVNZDUr?=
 =?utf-8?B?L2NXeUR2TldWUVF6SG1Wc1RObTZDTDl0VDBhK1lZb2JwbTJKN0pIV05lUUFW?=
 =?utf-8?B?d3FzaS9Bd0VXMDFZRDUwYy82OUQxeldqengza1ZHT3lDdmVLZlNnYktGODJI?=
 =?utf-8?B?cGRpOUhyYkNhdXJ1aE1YN2g4cENxL0l0UGo2bFd6aVlQd1Zvdm02ckwwck15?=
 =?utf-8?B?RDVoYnZONklUeW9aVUNsRWFSYUdxRnRKaFlEVkFvcTRkMHlMMGNiQ3ovUUsr?=
 =?utf-8?B?Qlk3NjJMb2tYY1JuS09wb3p1ZG9QSERuN0FHd3VEQWdaOVZuT2tsNm1HcVF5?=
 =?utf-8?B?Z0hBSUdhN0w4QnpTQ29VZkpyTzZWK1hNQ0M1UEduWXZFUzZVQzJUbWxnT05u?=
 =?utf-8?B?SjdxRGtrZWNtSENNeHVVY0hWUlkzNi9kREpadkd6WkJ2SXVkanRsOGZIMTB0?=
 =?utf-8?B?cC9FUG9GYy82MnNBZXRBNUlzejBBQ29CMG93T3Y5TkZDNWdsOUNreTJ1MW4w?=
 =?utf-8?B?d0djeUpWWGg0THdkWVhjMmRaVlAycGhxaml6NHN4TDJMaEpIOGs1ZEZFclNo?=
 =?utf-8?B?WXo4Z3NXTTdwVTZ1RG5SQzF1NGlDZ2E3QllqT2loUHhVVklSeVJMT0c0S1c4?=
 =?utf-8?B?MVVvakp2T1lRcnV5Q0lDWWRDaCt2ZndNeHFjWUpMNWpQb203b3hvK3h1SVVo?=
 =?utf-8?B?RUZ3Qld0Nm8zVGRsRmdKSFIxenNWbFhwejlpa2gxZmVxVE82QWJnSXFrT2l0?=
 =?utf-8?B?UlVvSkVmNEJjRWpQcXBYa3VjdTB2RXRhUGJQMjdVeDJJTmk0bG1oTUhreE5O?=
 =?utf-8?B?ZlIyVlRHQTdJWWJVQUI1enYzMlc4ek5hblNKVzljZmVTZWlLU0tEQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb644ef3-f38e-4fab-18a0-08de6908ab0a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:58:28.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4MQ68t63o75arjaD5upJDx2ACIaZUkiij4lQzs/82ScA4ahUhhzo7MDtDUawYiu2UewGKMc7Z7MH05mIU1p4yjLpz+IFST4nsiw0wGbZM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B719B12066C
X-Rspamd-Action: no action

On 11/02/2026 12:16 am, Marek Marczykowski-Górecki wrote:
> Fix calculating the table size - it consists of a header + entries, not
> just entries.
> This bug caused the last entry to have garbage in its final fields,
> including LowestSupportedFwVersion and CapsuleFlags, which (usually)
> made fwupd to detect firmware update availability, but refuse actually

"made fwupd able to"

> installing it.
>
> Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  xen/common/efi/boot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 5b84dbf26e5e..45015a0dd583 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -675,7 +675,8 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
>      if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->Entries[0]) )
>          return 0;
>  
> -    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
> +    return offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) +
> +        esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);

offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries[esrt_ptr->FwResourceCount])

is a shorter expression with the same answer, and a pattern we use
elsewhere.  I can fix on commit if you're happy.

~Andrew

