Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C4A68CC3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920578.1324710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusVM-0001GQ-Pr; Wed, 19 Mar 2025 12:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920578.1324710; Wed, 19 Mar 2025 12:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusVM-0001Dg-MP; Wed, 19 Mar 2025 12:26:40 +0000
Received: by outflank-mailman (input) for mailman id 920578;
 Wed, 19 Mar 2025 12:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abOv=WG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tusVK-0001Ck-Gb
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:26:38 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6619285b-04bd-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:26:36 +0100 (CET)
Received: from DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) by AM0PR08MB5313.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 12:26:33 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::f9) by DUZPR01CA0040.outlook.office365.com
 (2603:10a6:10:468::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Wed,
 19 Mar 2025 12:26:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via
 Frontend Transport; Wed, 19 Mar 2025 12:26:33 +0000
Received: ("Tessian outbound 77cd431de54d:v597");
 Wed, 19 Mar 2025 12:26:33 +0000
Received: from Lcd358135d35a.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6435240B-5C18-4755-9E6A-6FA5B0CF999D.1; 
 Wed, 19 Mar 2025 12:26:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcd358135d35a.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 19 Mar 2025 12:26:23 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB9502.eurprd08.prod.outlook.com (2603:10a6:20b:61e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 12:26:18 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 12:26:18 +0000
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
X-Inumbo-ID: 6619285b-04bd-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=L+ZddJJzFFU+uvk4DJbEnZEBdNQkTIqLGoDPHOcT+j/JlojAyDAaRw/UGKQgd1RLD98FF82NIFAffPvgpcwKmtWlwoeco6nJwwa2mwkZblg2Q9NwhinmOfjcMUUes06g3rgzqYjYCvsmvo7m3ZewEDPpqKVRwwoFHeXstklgwYK1FpipCelfw9VIDQiX0AnvTlkp9WOrdRHpcGwV7Vwaic1qsN7L5IRy6gtxNWpXxOZ/SnuX2ZFkxB+YjywOGm8iR9ny3VyQb4G50zEdQ508XM0OfeNYLgQTcdNGzw5HMiGEXKhj0+Dlyw84Vxal8PL6drNVM3gIKRgJymHE+KOXzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=SRD6mjLFM+tjiVkfgnWNZ9GOH9S+yLRD2KE/5zMqgOg2jwp/RiBn1ssPKd+aTAnYx7LljVD5eClJJUUV5LPEYMWwNPD4g/Q/b2qwHjUXkPEi7cohZvDt21Ri+y5PIuynRb2vZKz1XhCViOiMUyvfNGGaGmlVgWYdtt1vDFoMVcu6LeOhKr+fCjoz0fN7Fwl/FBh6HTqaHpEoMbMIDND8hIgo4MTvmwf24/5boSM/itUsBj4FJdQZV4dCpslb22Lb9Mpe3G2b31yvs6ejaHwce6Mry6FxxhzLQwLK/KHUx0g+B8T6SxFEbH5yPXxfSKwBB/XlqsXmvgtmU5Gl2sHsgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=Dom1RWLGRhihuwK5f0fwqzRnpJZMSWOwCTChQYTJiKRWSSi3JhIUyUps2fDabmnNwoAc4/WYdtb7F8+vseE+pRJ80ChAom+D5V5dsD1LYcPVqiBfC6wZuoIrb2AMEh9bdwv/xJ1FnjxFKJfI6IrEAn4ksyIZEZJv0t3CcbWj7do=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58596a145cf13af7
X-TessianGatewayMetadata: l1JZ4VhRn70cJpXE2a4ju8D9gtIMrI6nF8T1wT46lmGIZzV3nv4lVo22gVqmVx/+JRrp1F6WlTU7nBpTk677zi/O1sgAyyknXVN9MLnSC96tRBCB7qT9pCeVdmgwszPegxumhN3+o7q0rDuYfuVrGDhh3HZLS5fwIt/cY2d+CW4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+MDFX47nsKRBSba8yabLngGWBvqBSjZreFTXbW+hUMFYighqzrlE7Kf+YHR1yQ3n5SocjxalgRqXQ/6x/14o96c3vQuv69r8+pwa3brJHICBtEBI7Bw4xlBal/+e2VXpWeI/dBgCK4bBCtkUAOGVKj85XcZEO6uvGNJNMaV9exdGf5khcOwbmw69egMBQsRzoeFfis6Wkw9ZMx58LsohsQ2xZAaDn1r3+ovEnKYm0nlnu6RHFjBn07/L0dDfENa5WTwBT3z02n9AraKJvrj4yTjqjKtZp6df/mFyYUDAoda+GYZKOBm2Qg28RhJeHHdgXKy5s5vDgVz9HR/24y25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=yuXb5/auRhnnUG79xO+swBpdE/MwRrji80oPU71Xd/zV1zGwLxK+FXq20PwQ3Q3A0et/08QxTTn4DplHWlk3H3hftCudQX1QH4f/Pj5B/sSpwzIs5BhaEbfIdBn4fypNzRAnHfSNneKJfcJn0t8c/oDfJHiR3LHMK4VRKquCxscMUk0aAZlwinizmH62QKWfyT7iWBcXxg+43NmpsZaxYuybSNv6ODmsBEvl3rZffvzV8lfsqWKgFZhRsVvppr7KUMTDWTcCEgaxGU9qEjvdurRM8B3c6nG3hNbeMXmwZTZVEfGqzankER/cfjDLMwtmluCjXAU5MsFZKLIV94z6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=Dom1RWLGRhihuwK5f0fwqzRnpJZMSWOwCTChQYTJiKRWSSi3JhIUyUps2fDabmnNwoAc4/WYdtb7F8+vseE+pRJ80ChAom+D5V5dsD1LYcPVqiBfC6wZuoIrb2AMEh9bdwv/xJ1FnjxFKJfI6IrEAn4ksyIZEZJv0t3CcbWj7do=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Wei
 Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
Thread-Topic: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
Thread-Index: AQHbl3hIuq5Ui4sTKky0PpKNFdMoBrN43e6AgAF5B4CAAAvlgIAAAkwA
Date: Wed, 19 Mar 2025 12:26:18 +0000
Message-ID: <EC9AB048-7C56-44F1-85B9-30837F4FC6E6@arm.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
 <D86D58F5-1EDD-4362-B163-5AD25C5DCC51@arm.com>
In-Reply-To: <D86D58F5-1EDD-4362-B163-5AD25C5DCC51@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB9502:EE_|DU6PEPF00009523:EE_|AM0PR08MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 164e7122-e7b0-4284-87a4-08dd66e1490c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c3BBMDJoZElLOTg5ckdOcVNMSGtlSEhVS1hEUTRxM1o5Y3BrQmpnbSsxbUxm?=
 =?utf-8?B?dUY4Z1M0ckFzOUNPQld5K2xObnlhcjRSY3BreVdtZ0dIclRsSVFvNFMwb0VG?=
 =?utf-8?B?M1pBVmxEdTV1M0Z3b09MVkJwZkIvR21qWFBud2NEenlTRVBhN2hJWTlSY3NF?=
 =?utf-8?B?bjFQTjhBVVFuNEZ1ankwL3JCOU9pUndQT3hpOVNIc3l2VjlKaW0ybjIrbmg0?=
 =?utf-8?B?ZlBmOW8xRWlPS1lSWm9rR09HZGNrMUs3d0xaVFAvTnBHMGFKUUV1Z1hmbDI3?=
 =?utf-8?B?bHdIN2w3ZXBlb1lsYTdVVzFVMmlhY2JYUHFuOTZLZlh1MTNweG9kSzhURnY2?=
 =?utf-8?B?UFR0bGZsOHQzbFRkMWk1dUplQ3JDbjRQRWV6YjQrR1ZoYzNXbEpBSnZtUHE1?=
 =?utf-8?B?MjJGUWtHVGVkZFg0TTI5alZONW9KNkRJVllZd3RaNDRvWk55SzJNSnlxS1JU?=
 =?utf-8?B?WCtiQ0FSeGFGUktWUnRvYnVnYStOZHdvdEtRcWRhZTBhUG5FcEFSazIrUjdB?=
 =?utf-8?B?WllFTmhiN3pOWDljemt1dDduM3IrUStwQ280eG9yRWZ5YzdKdngrNzBsOFVj?=
 =?utf-8?B?RXNPcldqOWFIbnByTGZYTzNDZWpvRXJoM0RoREE2bHhQaWg2RzF2NUo1THVT?=
 =?utf-8?B?bVhWQkhXNWNhYkdGVEw1NVBvdmdNM1lXZnVielAzQ254WU5lRmdZaHQzMUJi?=
 =?utf-8?B?RWpLcUFXZm9xem1RbDkyVGhib3E2QzRHeXR3UFZldkVrYU1vV2k5b1FxUmo1?=
 =?utf-8?B?TXh1c2RpNEtFYlNVRGlzOXpnODhzMUdhYVRKa2M0UjliK3NxMjY3UUxhVkpE?=
 =?utf-8?B?bWkyZnMveUFIRnFUcVY4QUt2V2JzcEV6M0h6dXdaZ1RsU1hLSGs5QldpUWIy?=
 =?utf-8?B?TnVwL2Z1d001LzdheVVoMUh4N1ZqaFBkYUR4cGJPSVE5VHJSWTFMckkrb1hP?=
 =?utf-8?B?aVl6OW53U2JobTBLZ1JjSWt6ZDNSR1IySkFlc0wydTNNZ0FqbDVCTklnUmtk?=
 =?utf-8?B?eTkxUVZxc0x1ajlVQnRKOFdhTG9IZ3g5b0YwRGpPaXdnWmV6Y2hnNFM2bkZ3?=
 =?utf-8?B?bSsvWUs4TVREZEsvK2hEemVtcXhMVVZnRjJTbmZtVURYUUVxTHVyUkFVNGVY?=
 =?utf-8?B?RlJCUjJVYysvUFN0ZTdvTTJvOWFYQXZQY3lLNXBaUStwMkpIUHlUdFczV0dj?=
 =?utf-8?B?aFBhL1o4bjBBSkJMNFl4MmZlWWcrU0l5dGtYZ2FPQ2hDMWRRcWpiODkwUnlM?=
 =?utf-8?B?OEQ1U0tISnl5aHErczZjUkNlZjAzSTdnZ0JjUkVRZk9XWWxzZmsrSmNtaE5j?=
 =?utf-8?B?eW5sNEFVZUxHdEtmRTNXL3hteGhVSEU3akk4eUI4YU9uSWVCeFVUTDZseUY5?=
 =?utf-8?B?bE13YjhoU3gwMS9RdUh3S20vREZOeFFvdGpwTks4bS9OcmwycC94TGprQitO?=
 =?utf-8?B?Z3c4M1BoMVloaTdXb2tiUlpWTUNqTDJ5OFlCaEJmS2pCYXF0aTZXQkFia1Rq?=
 =?utf-8?B?c3VyaklpWkRnaDJYQnpoc3RXRklEOW1ERy9wR2R4NmJnVytrN3ZsQWtoNjI4?=
 =?utf-8?B?VVdtNUJCZzJNam1RbWk4QXNJMFFnQktJR0syVzg1NXI3cUlERlh1QjhKRmZT?=
 =?utf-8?B?UTNUV1ZzUDRXcXA1cFpwdFl3Q0MxN3dkTWxxcnNYd01SL2lmanh6RTF3akhw?=
 =?utf-8?B?V041TXRtNW5lVC9ZUnVNUVRMakJ6VjR1My9QRVZSWVAyUnlvRWtyb0FCdWR5?=
 =?utf-8?B?S2U0SDFZZlJ4dktPMHZ4NlBSamtrVy9XRGVZY1UrNkpZRkdiMG5ZbVhwOWxV?=
 =?utf-8?B?RStmZmpnQTRDK1FPekhRbmNPSTBNOVVWTURMa3UwOEhDbG9kU1gxcTdIRnho?=
 =?utf-8?B?SmNyVkdKOTdZaHIrWm5jUVlnYjJlbkIvcGFDa1J0MXJFenlJTlBYVzRpaHdw?=
 =?utf-8?Q?QD72ynhi9YW2Oqd5Jwfvq6oMEd1uKnWY?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <041FB4069B67E941A287FD8E1A6F7082@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6dc497e9-1639-4458-ae64-08dd66e1400a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTZFZVp6dFc4RUtiZ3A2eWYxYmRYS1ZTN0pCTS9WTzcvR1lCckM2cUQ1Tnpo?=
 =?utf-8?B?YW1abkFMcEZ0TzhBM0taTHRubnlKRU5ZWXNkcWhkejN1QTFuNWRGNy9xaEN1?=
 =?utf-8?B?QU13RHk0RllCZGxDY0NvdGpMZDFpWXhqSUo5bzFuUDhOdzBWVGxkZmtaN2ZS?=
 =?utf-8?B?UTY5UVJySytXYklZMXZZMWlKOVhqNUo5MWxaY1FHQXNOblpWQUZibk1SYjNv?=
 =?utf-8?B?Wi82S0F2QzFMb2d1TUlaL0poTGwvemNFWjNTak83M3RlOHB0em9PeTlqU1RF?=
 =?utf-8?B?Z1kvbVV3ajd6eG5JbzRXMnJFMVFqNkpvbDhLUlNJa0ppbmFQV3psRnlVY2tY?=
 =?utf-8?B?Z0wzVVI5WXc0bGVneWZ6N3owOUFXSmFtSjJTdXF4MUgyWGxoVWswZFlXaVVC?=
 =?utf-8?B?OEhoWDZuM3VOQkxJdlFvK0xZZnBxREI4T3JzWUJzMFdTcW96bTAwZXExMFA3?=
 =?utf-8?B?dGxYdTNkR0dpTTBBNFZMcG1HYWMzWmplUms1L3F0YS9wL1A3MCtnV2ZSNkti?=
 =?utf-8?B?Z0w0ZEJ5VzNPUFVWN0szcjZaOG4wUm1Tc3orMTBvaEZtNUs0KzFiRlRzSHhK?=
 =?utf-8?B?TFZLRE1La1IwWFd3Q1pZb1JuNTNrVlJpYlJlR3VMN09POUZ3Y3NlVnMvcENH?=
 =?utf-8?B?eXB1eXI5MXJmK1RBRHVySFR0dEJ4L2Mveld0M3hhSTRjeWluZzduOEsxdDNw?=
 =?utf-8?B?SGZyTm9yQmlBaitub09BU0J3bUwrbXl1M2MvWlUwWUd3WDN6L0hxMGhlZ08r?=
 =?utf-8?B?YTJqWXhUdzZkcEMyalVPaWhSMnZKTVVCWjF4c1J6S2lsL1BUblc4WXIrWWht?=
 =?utf-8?B?QXcxYTFIUjhjTmZIOTZtOTl6NzIrckhONTE0bk95bTkrQlVDcnBQWTVwcGJS?=
 =?utf-8?B?eGl0VlpqQ04xd0RudVh1TWRKRWJZeGUxTmJwNVhrTllaMlRKMEtZaUpXdnAv?=
 =?utf-8?B?THRTS0FzWE1uaXdtWjJqZFd0SWRwRDhyM3NiZUpyNVB4VmErN0Z4bGhlMSts?=
 =?utf-8?B?NWlXRk81WnBpWXlNZVl6M2VJRFhzbmhSN21ZOFlra3NjNGVXeVVvd3N3emNM?=
 =?utf-8?B?am82N1NmWkJLaFhRYmM1WnlYMHN3SVlUQmNpV2xmWWMyaHpUNCt4Z3dnNFdS?=
 =?utf-8?B?YXp5NVpsTUVZNWF2cmFlMFlDMmcxWlc3d25KYjZ2SzhDUDZVVEJ0aTFwaWow?=
 =?utf-8?B?b1RKbTljVE1FallKSHRuUjhleitzclF0aVU0NkdIaVcremFSdWRBaDNONHpB?=
 =?utf-8?B?VkZmS2xlTzZkYU5yTko3ZVVsSmJENDh5ZEZpaHh5bEZ0UnBCeEo5QW8yd1M3?=
 =?utf-8?B?R0V5MnFsVFJPL2JBNkQrM1M5UmF3dHdmazdLVHVQL2ExZm5OcEMrYkh3RHpm?=
 =?utf-8?B?RUFDZXVCZFJqOGFJUmtkZTFpZzBnb1FTYnZVWTFtT2VnREZ0ZlRDL1FPVGs5?=
 =?utf-8?B?bE5tWjM0N0VnNU0vcUFVU0xHRFRLT3Eyai9DcEZPc1JHQVBYV1ZXYldkcTZO?=
 =?utf-8?B?ekw4TXV4djloWnJLU2h4ZnM0Sk5OVUJMRVJhczBYbFFjQXp1Y2Z0bU5FZGVh?=
 =?utf-8?B?YjhoVGVCZHNQSTJoN0IzUlRFd1UwczdZekFlMjU3VFZvNUxiWkQ5SjkzdXQ3?=
 =?utf-8?B?Uk9tVUh6MzdPVnh0SVJ3cXFMNllqQmRrQy95UE9oMDJIbHVWYjFZVW9JaTBh?=
 =?utf-8?B?NTJ1YjdkemRYamRNM295TDJNMHVNOGRpM0xtbGUrQk9vQWFuS1drd2ZYeXUy?=
 =?utf-8?B?OEtXTzZHKzFaM2V6UWlYQkw5dEFBcnVMS0lJM2FjZ3BXT3JwSTZyZTJ3enl2?=
 =?utf-8?B?bmhtOHBhUHdoNFFGUmMwYzFtZEl3VGRFLys1dEpMek9rYWthMHUzc1Rjam9N?=
 =?utf-8?B?dit0REZMN056TU1kaHluVHJNYWplWUEzWjR6MEJoTlNPRmp5NWpxN2REM3FK?=
 =?utf-8?B?YnJuMFRVSkFSU2N6UDBHcWF3WDNFbnNXOWFTQ1oxc3JjNWs1c0x1akF2eWpt?=
 =?utf-8?Q?BKRk8EzofME0M+YLV9SjgcIGAJAFyg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 12:26:33.5554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164e7122-e7b0-4284-87a4-08dd66e1490c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5313

DQoNCj4gT24gMTkgTWFyIDIwMjUsIGF0IDEyOjE4LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgSmFuLA0KPiANCj4+IE9uIDE5IE1hciAyMDI1
LCBhdCAxMTozNSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+IA0K
Pj4gT24gMTguMDMuMjAyNSAxNDowNSwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4+PiANCj4+
PiBPbiAzLzE3LzI1IDk6MDcgUE0sIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IEZyb206IFBl
bm55IFpoZW5nPFBlbm55LlpoZW5nQGFybS5jb20+DQo+Pj4+IA0KPj4+PiBBUk0gTVBVIHN5c3Rl
bSBkb2Vzbid0IG5lZWQgdG8gdXNlIHBhZ2luZyBtZW1vcnkgcG9vbCwgYXMgTVBVIG1lbW9yeQ0K
Pj4+PiBtYXBwaW5nIHRhYmxlIGF0IG1vc3QgdGFrZXMgb25seSBvbmUgNEtCIHBhZ2UsIHdoaWNo
IGlzIGVub3VnaCB0bw0KPj4+PiBtYW5hZ2UgdGhlIG1heGltdW0gMjU1IE1QVSBtZW1vcnkgcmVn
aW9ucywgZm9yIGFsbCBFTDIgc3RhZ2UgMQ0KPj4+PiB0cmFuc2xhdGlvbiBhbmQgRUwxIHN0YWdl
IDIgdHJhbnNsYXRpb24uDQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgQVJDSF9QQUdJTkdfTUVNUE9P
TCBLY29uZmlnIGNvbW1vbiBzeW1ib2wsIHNlbGVjdGVkIGZvciBBcm0NCj4+Pj4gTU1VIHN5c3Rl
bXMsIHg4NiBhbmQgUklTQy1WLg0KPj4+PiANCj4+Pj4gV3JhcCB0aGUgY29kZSBpbnNpZGUgJ2Nv
bnN0cnVjdF9kb21VJyB0aGF0IGRlYWwgd2l0aCBwMm0gcGFnaW5nDQo+Pj4+IGFsbG9jYXRpb24g
aW4gYSBuZXcgZnVuY3Rpb24gJ2RvbWFpbl9wMm1fc2V0X2FsbG9jYXRpb24nLCBwcm90ZWN0ZWQN
Cj4+Pj4gYnkgQVJDSF9QQUdJTkdfTUVNUE9PTCwgdGhpcyBpcyBkb25lIGluIHRoaXMgd2F5IHRv
IHByZXZlbnQgcG9sbHV0aW5nDQo+Pj4+IHRoZSBmb3JtZXIgZnVuY3Rpb24gd2l0aCAjaWZkZWZz
IGFuZCBpbXByb3ZlIHJlYWRhYmlsaXR5DQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgYXJjaF97Z2V0
LHNldH1fcGFnaW5nX21lbXBvb2xfc2l6ZSBzdHVicyBmb3IgYXJjaGl0ZWN0dXJlDQo+Pj4+IHdp
dGggIUFSQ0hfUEFHSU5HX01FTVBPT0wuDQo+Pj4+IA0KPj4+PiBSZW1vdmUgJ3N0cnVjdCBwYWdp
bmdfZG9tYWluJyBmcm9tIEFybSAnc3RydWN0IGFyY2hfZG9tYWluJyB3aGVuIHRoZQ0KPj4+PiBm
aWVsZCBpcyBub3QgcmVxdWlyZWQuDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZzxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbjx3
ZWkuY2hlbkBhcm0uY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1PGx1Y2Eu
ZmFuY2VsbHVAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHYzIGNoYW5nZXM6DQo+Pj4+IC0gSW50
cm9kdWNlZCBBUkNIX1BBR0lOR19NRU1QT09MIGluc3RlYWQgb2YgSEFTX1BBR0lOR19NRU1QT09M
DQo+Pj4+IHYyIGNoYW5nZXM6DQo+Pj4+IC0gbWFrZSBLY29uZmlnIEhBU19QQUdJTkdfTUVNUE9P
TCBjb21tb24NCj4+Pj4gLSBwcm90ZWN0IGFsc28gInhlbixkb21haW4tcDJtLW1lbS1tYiIgcmVh
ZGluZyB3aXRoIEhBU19QQUdJTkdfTUVNUE9PTA0KPj4+PiAtIGRvIG5vdCBkZWZpbmUgcDJtX3Rl
YXJkb3due19hbGxvY2F0aW9ufSBpbiB0aGlzIHBhdGNoDQo+Pj4+IC0gY2hhbmdlIGNvbW1pdCBt
ZXNzYWdlDQo+Pj4+IC0tLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAg
fCAgMSArDQo+Pj4+IHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jICAgICB8IDc0ICsrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4+Pj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2RvbWFpbi5oIHwgIDIgKw0KPj4+PiB4ZW4vYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAg
fCAgMSArDQo+Pj4+IHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsNCj4+
Pj4geGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDMgKysNCj4+Pj4geGVuL2lu
Y2x1ZGUveGVuL2RvbWFpbi5oICAgICAgICAgIHwgMTcgKysrKysrKw0KPj4+PiA3IGZpbGVzIGNo
YW5nZWQsIDczIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQ0KPj4+IA0KPj4+IEZvciBS
SVNDLVY6DQo+Pj4gUmV2aWV3ZWQtYnk6IE9sZWtzaWkgS3Vyb2Noa288b2xla3NpaS5rdXJvY2hr
b0BnbWFpbC5jb20+DQo+PiANCj4+IE1pbmQgbWUgYXNraW5nIHRoZW4gd2h5IFJJU0MtViBuZWVk
cyB0aGlzIGF0IHRoaXMgcG9pbnQ/IFRoZSBzdHVicyBzdXJlbHkNCj4+IHdlcmUgYWRkZWQgdG8g
YWRkcmVzcyBzb21lIGJ1aWxkIGlzc3VlLCBub3QgYmVjYXVzZSB0aGV5IGFyZSBhY3RpdmVseQ0K
Pj4gbWVhbmluZ2Z1bD8NCj4gDQo+IHNvcnJ5IEnigJltIG5vdCBhIFJJU0MtViBleHBlcnQsIEkg
c2F3IHRoZSBzdHViIGFuZCBJIHRob3VnaHQgdGhlIGFyY2hpdGVjdHVyZSB3YW50ZWQgdG8gaGF2
ZSB0aGVtIGltcGxlbWVudGVkLg0KPiANCj4gSWYgbm90LCBpcyBpdCBwb3NzaWJsZSB0byBsZXQg
dGhlIFJJU0MtViBwZW9wbGUgaGFuZGxlIHRoYXQgc2VwYXJhdGVseT8gSeKAmWxsIGJlIG9mZiB1
bnRpbCAzMXN0IG9mIE1hcmNoIGFuZCB0aGlzIHBhdGNoIGlzDQo+IHVzZWZ1bCBmb3IgQXlhbiB0
byBpbnRyb2R1Y2UgYSBidWlsZGluZyBzdGF0dXMgZm9yIGFybTMyLg0KDQpPaCwgYXBvbG9naWVz
IEkgZGlkbuKAmXQgc2VlIHlvdSB3ZXJlIHJlcGx5aW5nIHRvIE9sZWtzaWksIGFueXdheSBpZiBw
b3NzaWJsZSBhbmQgeW91IGFyZSBvayB3aXRoIHRoaXMgcGF0Y2gsDQpJIHdvdWxkIGFzayB0aGUg
YWJvdmUuDQoNCj4gDQo+IENoZWVycywNCj4gTHVjYQ0KPiANCj4+IA0KPj4gSmFuDQo+IA0KDQo=

