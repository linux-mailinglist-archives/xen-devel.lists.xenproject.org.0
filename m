Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FrpGxXXnWk0SQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 17:51:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C293C18A145
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 17:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240200.1541673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuvcF-00027y-LF; Tue, 24 Feb 2026 16:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240200.1541673; Tue, 24 Feb 2026 16:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuvcF-000257-Hj; Tue, 24 Feb 2026 16:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1240200;
 Tue, 24 Feb 2026 16:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vuvcD-000251-RF
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 16:50:29 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e92a7051-11a0-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 17:50:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS4PR03MB8155.namprd03.prod.outlook.com (2603:10b6:8:280::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:50:20 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:50:20 +0000
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
X-Inumbo-ID: e92a7051-11a0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsHvxBEtV4kN6pFw3fxKscTDnpK0nLeyqitaoMtnfg+QKsT8T9okzxOOrJW6t6DFWvcaBm/C2tZ1WmEaQIUT+gTp2iLD0rmCl7Kjdu/HTTPZnZtb7P3+I1sQLxVGlZ1gMFRoplOVK3JxRtVJ4+F4aT1aAuf70G0H3DTpfICbsGQ8wH6QE2DAtvvyl781YZCyquXWH6VS/twK8RqHormaxix3V2/1J65P/pL4wVDwZmVT5P4FMr2Go9qNrfuVI9Xv5qUH8YE2R8iTlk57UTWNfYb47xbHYhgNmyRnLnlGa3nn+TDfvEneTXoWpfZ1aRS3t+8Y+5+H6EZeoPwc6VAfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEdFHD/VQHi8H7CBQ0VuwqAFOocG93JTfG2Mt5YjRyI=;
 b=McXp6XcWIQA/4o2/rTzi2xXy4Il9sl9mnC+zr8EROWKYj3pMCfcpSDqL3RJQVoKlD3aPkIJJuvP6pk3QzERnjGnwO5WbfzbjoKCS5DuHZK6Wlr2vuyZKoIsXAObf5ySID4eCVfzCT5nLlN2/+kfxKkWHjUG9sXGuqNfGzx+xyFZteFemFdYx8dhriUbGx8cSRdOjXdDDQpNq8ZJSjgtRt8mmocnfO7o6Mi3jPEt1LNu6xZIzsr5a7FRYP72Bb8KaVtIU2ZBjQuaTGRMqaqyrSVqbQAiX637dskg1xFGDVAW5l5Ipt7GrCWOdH8J6DvGHMLBKnOFDScbYfHwhp7i4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEdFHD/VQHi8H7CBQ0VuwqAFOocG93JTfG2Mt5YjRyI=;
 b=oRrwu2RRR2jfXsEDx9SWgj01WvavyKeIpNEJwHzkxWJdobjtKy88jQZo8vraYEWxSRd7hSoUY+44O/sOxbU67ukZV4CRgy6v22BHbMRam6pduhIMxNuQ675xy0IsF89ac4xVRkw0xouo0zjggiDzOUf2EAQwTJdA1Ddpv4P5OyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Feb 2026 17:50:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: SecureBoot requirements regarding Dom0
Message-ID: <aZ3WyMobpVj_o9IQ@macbook.local>
References: <99bb08a4-0872-46e4-b945-3687ca3ebc27@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99bb08a4-0872-46e4-b945-3687ca3ebc27@vates.tech>
X-ClientProxiedBy: MR1P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS4PR03MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e88b857-b08c-4917-51df-08de73c4cb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHptOGIyVHpPK1Awa1d3OVM3d1BXVlNWaHRRVG5hVWI0a2RxUHJlVi9qc1p1?=
 =?utf-8?B?UmVFWDkvdmpCcnJGVmV2N05DT1N5Ym9JRCtsT3AvVnVVWGxraXpCSGZyMjIr?=
 =?utf-8?B?cndsSk4zd1BIU3d2YjBXYnV0czZVZWkvTVJ3NTV5NmVnM3pIcXUrWkVkZDZy?=
 =?utf-8?B?T1dScHMrb2drQ3BMZmJ5TXJzMTh1RXdSRW5EbG90T1h4OFlNTmdSTW9yWHI4?=
 =?utf-8?B?Mzd2dTV6bUZFNi9jNHN0YmJSZ0RuOHovRVdXSnVLRlFBcjNtekxrTVlPUTJl?=
 =?utf-8?B?TURCVkVQWEdjOFBEQnFDcEMwV29Ec0Rub2p5dU1FakJEcGw2Y3ZON1RZTytM?=
 =?utf-8?B?Qk5pUFV2bEROR0dNM3o2azRZVWYvQlEvN1VvMFhFendScWdTdmRvSnJocEg5?=
 =?utf-8?B?T1RjRWppWHFVcFMvQkxWRHJlcklYYzJmczIrWUpQbUE1Y21NdDcyUEt5VjZm?=
 =?utf-8?B?eW85b2owYWJSK2pUWm4xYjhnRUtTeGRGZDFVYi93SkhxYmcwVVU3Yi96SVo5?=
 =?utf-8?B?YldHbVRJQ3FSWVo0aFRJRHJIdi9mTjk1NWpaSDlLb3dpcnM0MTlZNG9RNjJD?=
 =?utf-8?B?bFYveUs1eUpxaGhPS0orczlUaG5SNUpSUmFwNGRLemtWVE41d01Sc0E2MkZs?=
 =?utf-8?B?TFFKWkFVd0tVRDVLUFo0QnRCRE5sbW50OVJoeGlaUk1XamFpaENRWG9Va1Ar?=
 =?utf-8?B?MzdsUFNoWStjaWhhQkRTaldJUTYrOTYxd1BCcEswS1I3SDBLQitnOUNBZzJt?=
 =?utf-8?B?L2d1UlREeEVGK1FvenB2L2YwRUxNZGZLbnBzZXM5YkVOZ2VxRW5DNXp1bUV1?=
 =?utf-8?B?TjdmK2d6dVNSK004OFNrMWpnSDZBRlUxeTNYYnBGZ3M0bWJONGdhNEFCblFM?=
 =?utf-8?B?bDZkQlAxREJCczF1QjVFM1JsTlJzQXQ0RXo3SnhUYkgzVElqaUpNTlRKWGRw?=
 =?utf-8?B?V0s1UHozWkhjeUNMeHUwMmNHZVROMkU2aWpsU243OTRNcERRV3ZrbkY0VGV6?=
 =?utf-8?B?VG9IdDFyb3NLQ3NqZWpIQkhUUWRmMFM3amhjejBuWm43T05LTDN4aTc3SGpH?=
 =?utf-8?B?akVWdmUyQzNYa21haDAydEhLLzhsOWZ1cW8xUFo1NVZSZ3V6Qis1cDF3UDVp?=
 =?utf-8?B?WWhoQmpBUEx5amZSdEtDOGxETG5qRVRnbUdkNGdoeFphcHJlRjJZeVpSVUJW?=
 =?utf-8?B?dDZCTzJtR2JZVlExWktXNjhmK2hNWStTY2VPUE15VmJKWGh6NFJpZko5dDUw?=
 =?utf-8?B?L3djazBkeE1zQXpvRUMvaW5CelpvbU1VVVlhTy9OSmorM3ludTZqUUlGVzRX?=
 =?utf-8?B?ckRCRVJDemI2c1RaSXJXR25QbmpGRTBBaHBlUVdOeHhJamRGcWl4YlRWcE5L?=
 =?utf-8?B?TDUvN3BPckZrMCtzUG5nVXJRamxWK0UvY0pGbUxSbWRTdklpWVpWQzZjcThN?=
 =?utf-8?B?TUpWdWZicnFiamZralVKUUpxd3BxZ0VMUENmaVdUOVRoZXpEWTZ3RFl3Z2Fu?=
 =?utf-8?B?SUF3ZjRGNmpsTFlnbUtma1FJWDYzNU94YklrQ2hiVDVBZnhmdkVydng4Rmtn?=
 =?utf-8?B?Sm5mN0x3bTBROHg3WDdyYTFuTEVWd2pJOStrNnY2L2ZEWGhGUjNiOHpjTTEv?=
 =?utf-8?B?QTExYkxBSkl1WHZkYXB2bnBIVFl2aWRkbDN2ZFBWMFh0NVRrSDZsUFZiS0NS?=
 =?utf-8?B?R2ZVbnpPc2I1VlZCQmhlazNaem1ScnQ1NzhTQ0V2d2U5cjJ2N2tDZDk1by9M?=
 =?utf-8?B?dUVJUkF1VlZueXNra0c1cFhyTWQrOWU1TkpGVkpXWTJkM0JxdkFlWnRabDZh?=
 =?utf-8?B?ZDZqejdTVU8vckdsLzlZZmszbkZjVUluRmc4MU5UOVkzWmFySnZqanB0Zits?=
 =?utf-8?B?TzZ4V29yWnBOUWN2M1hVQXFlUlNibVUzM2xhZDVwR2NwYTNtZExMb0ZoanMw?=
 =?utf-8?B?NnY3NmM5MkNRVmE2WmlRdWxaMFk4TE5hVytOT1AzNklwTHJBWFRFcnB6Z2RB?=
 =?utf-8?B?NXBnQU9yT1hCUE5pUnVVUlNDSVVOd3NqdHl1YTUwQ2ZiWnNBRG1ibmR0ODhL?=
 =?utf-8?Q?TW7yzv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGFiTG1XQjJLRzVYUHBYYVJCekIvVTc2MWIvVGEwY0tYb3pWMjNLRWJIb0Mz?=
 =?utf-8?B?ZXBjYjhyZEVpUGFqMFVDRjlDZTdUMU5zdzZOWVJCYlIvaE1BL0tGTUwyN0RS?=
 =?utf-8?B?K3ExQ1VJVXptUnRTNVllcUgwdzNjelFGbnR0Nk5sYmkvTEJoV3IrSzY3bGlh?=
 =?utf-8?B?dGtwOC84bk5BUG9XRzA5dlhNMjhTT2JPK1c0cnNmUk5YWWlweUk4dmhJSWZM?=
 =?utf-8?B?REhIQ0t6VnErRHh0ZmdhYkcxMXAzNlVlQWRpb2pkWDhzUzh2VVQ4bVNSejZr?=
 =?utf-8?B?cklxWU5CS2ZtYXVSY09rVjlxallqTGMvRVlCdUxMQWFodS9VZU9DYy9zb3pD?=
 =?utf-8?B?dEVYeCtsSWlhYklTRlpYelNNV2hlNW1GN2o1WHUvK2RTa1l6SThFV0JrYUo3?=
 =?utf-8?B?d3dRazhWK2RLZ0RhNUcrV0dXY2g1SlBtK1p4TXB0dEl6a1k5bVkzRG1heDla?=
 =?utf-8?B?WlRGNGh4bHlEN01MU0NlUGJsN2R6SmUxSlN2b2FtNGxodHBQOEhQR3NuYklH?=
 =?utf-8?B?NmEwK2tpV3dHaVVNUnBLQkxUYVdxUnJSa1gwVzdIdGFpRWlEczEyalU4OTZq?=
 =?utf-8?B?TnoxMDBXNFNWbkxOSm8xYzB3SXJNQWZOa09rUUd4Sm9POGgwV1YzejFreUlu?=
 =?utf-8?B?UGV5WWEwWmc2bVFhOEZlQTBZZW1Wdjc2TEFpNWEyM1IyZzRIb1V5eGQ2TGRt?=
 =?utf-8?B?c1l0aWk0M2kxc3dpUnU4VTBuN2VyQ3Z6Y0pjdHhKeWs3OWNEdlBtMHQzTW11?=
 =?utf-8?B?LzNiL29GMzdubXVHV0c1Ry9jRDREQys2THJHQVNzN040azBjNFJqcEN4d3hs?=
 =?utf-8?B?NDdvam8xMDIwSklYZk9TVVZaOVR4aUhpU0ppeVJPWlplczB3ZWpsVWpHMi9I?=
 =?utf-8?B?TGRZQUxkcEN6Tys3L1ZyZjFIQ29sNitTcTlxQVlCZVVyRCt1UTZrLzFDMzRp?=
 =?utf-8?B?cEg4eUZKMGZwVFpUaVRGTlgyKzdSNERCeHZ6QjVkTkFFR21WanJTa2l2QzFp?=
 =?utf-8?B?a2RVY3hwVlZVelBicFVIR3o1Q3hUcUNtOE5KNnBKQXJhUHh1bE9Tb2JWYmJB?=
 =?utf-8?B?SHB0RjQydUJ6V2NPSGllTHhIdTdpTW8zZHI2MkJldmhKMWhBMFd1YXlGS1Fu?=
 =?utf-8?B?M1h5dElDTzVSdnpMSkZpTW1TK3FVcmcxTHM4akltQ3U0RG1XWnVLYkRFSWVN?=
 =?utf-8?B?VnJwRFhSNDM4ZW9DV0dLZUoxbWdlZDFmeWcyVUFWR3Bpb0tVNUJHTU1QS0J5?=
 =?utf-8?B?cUM5THp5aXIrVjBnK0pCOWlRd0tncFdtUVFXVXFxMk54ZWRYK0dBRm9RSC9W?=
 =?utf-8?B?R21FRHRSblBPMkNCOGpiTGNWOTJ2VEhvbHZLSzkwWnQrM1dXZ3M0MmM3R0pN?=
 =?utf-8?B?VVRVVGlXaHcydWF6NDZtWnB3U0psbXdNa1hGQVQvQkJWLzkwdFJMckowRGdY?=
 =?utf-8?B?Q1ZVZW5NanY0TEVoVWQydXVuckg3b1RqMGZnOHdKRTRNSzllQnZmTEpiYy9E?=
 =?utf-8?B?YjZqWVV4QW00eW55TlJUK3ZwMittVDlrWFNvSFg0TW1lQU44WXJ3dzZZMGZv?=
 =?utf-8?B?UGU5dURUdjFKNnlCUStJYzZZM3ZodlBjOXlScmJ4d3ZjYTlEZkJzcTBpSC9L?=
 =?utf-8?B?MERMNldkaTZtV0tmbGM5bG56bVI3MnNUbGdIUTh5d2VYSDFxaTJUT1pIU1Rl?=
 =?utf-8?B?TTFoSGZrR3Z0VXBJRTZORWhBV3ZHQ1FEMisxdFpITEFjMHA5MW5IZ0Yvd255?=
 =?utf-8?B?K1ZzS3ZBQlduRjFlejVORXlGdDdRS0x0cDFyVzBVOHNHL0h1bnlsV2pTalRQ?=
 =?utf-8?B?UlF0NW1QbkZ1RklWOFFKMkdBUUx2Vm1CZjR4eXRiNzQxYitBQzJSaDhHaW9r?=
 =?utf-8?B?blc3aXVWM0d5UkJXZVdjMWNmMksyMmoyMGZCR1dEbkpiMjdpdnBNNmNoaEtT?=
 =?utf-8?B?YmdKQTBJQmVaVG8vR2VpMTJDeC80YUxvb0t6QlZZZThhK2VVTm1yaWp0ZHlw?=
 =?utf-8?B?SUp5UUR6KzBzbDhkMmVhSUhrQlJRazVIVXA5QTRIamcxakZ0YnJVYncrbEN4?=
 =?utf-8?B?T0xIWnZySWtESzRHWTVHekYwMGRvVm1jTmlMTmpVMk1DOFdWU1ZHMUovVjgx?=
 =?utf-8?B?QkJFWkhYS05LM3FQUDlmY3kzY0R6N0dLTEwrazF1R01UbW93NGlWQkFRMDR6?=
 =?utf-8?B?NkZrbDd2R0dMK1M5c0loUTVTRVhFY2F5Wmh1VzlESFF0OC9VMkk4eXB6YkI3?=
 =?utf-8?B?Z1FKZXY4RFNrZVhWN0VOTXVMNVdzLzVUR3gwdWhuM2h0b2xiNGRVeFNSVzg4?=
 =?utf-8?B?T0FId05yWnRsL2hMaFNoNTdEY2VUYnBNcDFZeVNnZEh5ZDgyUTBHUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e88b857-b08c-4917-51df-08de73c4cb8b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:50:20.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAgx8DTgFA5UkFLwFUcYH+uGxiKE7+K9pDSx92Q66+vmjn69TxzDVLAbUSD+wvFzRG3X7bwgLAsSK3PCJHEHQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.63 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,andrewcoop-xen.readthedocs.io:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C293C18A145
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:42:39PM +0000, Teddy Astie wrote:
> I have some questions regarding SecureBoot and Xen.
> The only document that appears to define some sort of policy between Xen 
> and SecureBoot is this one 
> https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/uefi-secure-boot.html.
> That is also similar to discussions made in SecureBoot-related talks.
> 
>  > Within the Xen architecture, Xen, the control domain and hardware 
> domain share responsibility for running and administering the platform. 
> This makes their kernels privileged as far as Secure Boot is concerned.
> 
> Why does SecureBoot needs to expand to Dom0 kernel ? If you e.g restrict 
> DMA through IOMMU and restrict some key hypercalls like kexec (among 
> some others), Dom0 shouldn't be able to compromise Xen (in principle); 
> hence can't escape SecureBoot boundaries.
> 
> SecureBoot doesn't appears to require preventing device access from 
> "unprivileged code" otherwise VFIO wouldn't be allowed under SecureBoot. 
> But such device access still needs to be contained (e.g through IOMMU 
> enforcement), that's something Xen already supports (e.g 
> dom0-iommu=strict / PVH Dom0).

What about the platform operations that deal with runtime services?
Those could mess up with the firmware, and are available to dom0.  Not
allowing dom0 to use those might result in a crippled dom0, for
example not being able to change the boot entries.

dom0 also gets access to (almost) all the IO ports and IO mem space,
plus also unmediated access to almost all the PCI config space, which
includes access to the root complex registers.

Or another example, the low 1M is accessible by a PV dom0 as IO memory
IIRC.  That's also where Xen places the AP startup trampoline.  Dom0
could modify that region and thus inject malicious code directly into
the AP startup path.  Then doing CPU unplug and hotplug would execute
that injected code.  We should probably adjust that in
dom0_setup_permissions() so dom0 cannot map the trampilone page, but
this is just an example of possibly many places dom0 has traditionally
been considered trusted, and that would likely be against a sane
Secure Boot policy.

> In that case, devices are only allowed to access Dom0, but can't access 
> outside of it.
> 
>  From a technical standpoint, PVH Dom0 setups (and also PV Dom0 
> depending on configuration) acts very similarly to a SecureBoot-able 
> Linux kernel which runs a KVM virtual machine with all host devices 
> passed-through it (using vfio-pci).

As said above - there's a bit more to it.

I'm not saying it can be done, but we are certainly not there yet.
And we don't even know exactly what would need limiting, due to the
assumption always been made about dom0 being trusted.

Regards, Roger.

