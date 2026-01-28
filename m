Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFHSKNYcemlS2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:27:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE7A2C22
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215717.1525835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6Vu-0006D9-Fm; Wed, 28 Jan 2026 14:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215717.1525835; Wed, 28 Jan 2026 14:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6Vu-0006AL-D3; Wed, 28 Jan 2026 14:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1215717;
 Wed, 28 Jan 2026 14:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl6Vs-000694-N3
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 14:27:20 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71250511-fc55-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 15:27:15 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6955.namprd03.prod.outlook.com (2603:10b6:510:172::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:27:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:27:08 +0000
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
X-Inumbo-ID: 71250511-fc55-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTD3nKxNQaDNC8mbfuFe25rdWPLme94FrViiCMNS9u+rgXIcNxafbtkmazadDd6d40BCTYyCQoa/nq/1Q+dn6Fe9t4HdT/RCHBvOtguG/n5FGiWYdDGDFMSdJacTaZb/9KIQBJQoGnt/n8+QwOm7YTaGP6yp+6fmqcYKgUXHkOGwqT1CbYN0AKLOZe2bCA4AGN/QVQ3xjZxXOgtzMh3Ji+I8d7nWPX5Zm71LwtKq66WnX8KfFc+cZI/nrCBTkU4y7tqNupl5ZJSZ2A99U9tau8N0zWmdMKleWk6RUQAMrGIQIswhkwmmrI37fxJRW5hwYddScR84EeJ1D2Yav7nfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u78nobaCvUCArTFwsKt7etI6MU4zht5CUARIhXzl3Uw=;
 b=H3x4z6AaA65ME+XF1PcGRScQYT1QYIMYmtCRm2XflhmaX0DRk5BG4VKP2MeOny7ROXHDUMWLRgDOs4P3MRarTHbaPy+P0kFyCNSdUoV4xUW3/VmZ10QSF8RxXJCZpaJKKxZTXoEqTpYqqspg737GxssgTdTXa3cdBnMPyXy/mpVZ/0mAf2RUkIfcAXJLmxofi/onI6Svt6Y72mI2OREoNyZgrYO67LPvAXkCRakcVPikw4cAilMwnHwMllVIv8lgzNg460zNUpiXjHzgT5Fbhkp8b8bVrSjFub08ZkrYp5geKb9mRTkVj6igHNvyAS174ks2jm9n+RBLTz9Ij/QdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u78nobaCvUCArTFwsKt7etI6MU4zht5CUARIhXzl3Uw=;
 b=z4BXqckWC9ExBqaZkxdqmBL55F+33+sUKIfUW9Jfe95swb5D2G1F7R6xvoxvgUlN4CfmhtvwpJOCJCl6M9tWbYnGeVw9yXV+tuSDnf3G4W5QI4CT1EEcE7EGT8XRiWQgKcY9sJa0BIRfmIUkxGEN1DS827O649Q0mm2x0Hpn1BQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 15:27:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 1/4] PCI: handle PCI->PCIe bridges as well in
 alloc_pdev()
Message-ID: <aXocuE0KXQG9gZr6@Mac.lan>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <f2dbd694-5e20-4560-9933-12cd98b23e20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2dbd694-5e20-4560-9933-12cd98b23e20@suse.com>
X-ClientProxiedBy: PR1P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ce::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d2fdd3-e7f9-4e5b-34f1-08de5e795185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzcxUy9DWnNqY09uNFE5TFA5YnVMUTdIek4zV1dWek0rcldUeGIzTGlOVHhB?=
 =?utf-8?B?Rnp0Mm84NWp1enpCekFxelgzZXArRHBNRFZrblNMdU12aDIwR1AwajFLZm93?=
 =?utf-8?B?ZExHUWUrMHhWYmhHT2EzWEF4R2l0TTRMMU5mVU5kSmZhVEdYTkw1T09ydUt0?=
 =?utf-8?B?dXRXYUIxaCtkdWppZmx1aUcxM016VytNWVhoN0lKL2NqV00xUGQwV2laYUJC?=
 =?utf-8?B?YzB3RlpWcU5UNm1YbldXaW1kM2cxN0NQTjlGN1ozN3hJWjhVaW13WE4zWE9t?=
 =?utf-8?B?MjRLWC9lbHFXaUIyQ1RMK2NzT2VESnA0dHQ0dlAxaWNMTFpwTm4xTGg5Nk84?=
 =?utf-8?B?czROU3FVRWY5LzNpbTN0UVZFRCtvSmNaT0RXOVJUbEJFYnVzMkNPQW1BRVJ0?=
 =?utf-8?B?cHBzSEFqNDhnUGFRUUZVWXBreXVjeVlIOWhFTGxmTjN4VkcxNE14a2N5all0?=
 =?utf-8?B?Q01nekx6N2Q1WElsWEVwejYrRkk1ZisvVmN4emVoTnNON1Myb1pkdmVmaTNV?=
 =?utf-8?B?YnBGRFp2QVZYMlJYT0Vwcmx2OXgwM1QyejNESXFjeEptNlVGVURPVTR4LytW?=
 =?utf-8?B?NDRDTVBqYmFRcVBQNyt2NVFxYlJlSzBxWHpnT1VzS3d2Q0RDU3BKWXEzR1Rl?=
 =?utf-8?B?SWI4MFdzR055OGJrSlUzdSttdHluRXhHUElCTEFtb0w4ZHlBd2c5Y1FlcDhX?=
 =?utf-8?B?VndhRUNnWW15Z0kvS0ltWVRZOTY5WXJrRXpNSnhJTmdEVXRFenJCWXdBK2FJ?=
 =?utf-8?B?b3RkNU1XWW9kY1BzWkxRckU0VlFwWnI0WHBTNjVZTkFZdlpiL1o5QytwVjRQ?=
 =?utf-8?B?c01QcSt2eWtOdElZR0tJUTIvWE5RUmo0eHc1YjR1L094WDRSQ0ZHaFNjWXdz?=
 =?utf-8?B?VEppOW82RnA0UFNiSjhQYXlTUklCMmVHcWNTYTBRQllkdVNLUmo3REZWdlVk?=
 =?utf-8?B?L0Y2ekxiSWsvekpneDZTMFVSSmtyaERvTENxd1NaMG9iUXNyRk1HWTVieFdO?=
 =?utf-8?B?dkc2T3p3MXh5ZU1uOGU5aTZpbEk3amNUSWl5VGsxWXhtVVNhQVJ5UVh2VHR5?=
 =?utf-8?B?a2lNR1NvZ3J2K1hGQ0doTDdJTDBZRFkrbkx2WmtaL0Y5UklYOHBEdHBuS0ZD?=
 =?utf-8?B?c0hzakVyUDFoUkNVcXlrT2tpd0hCRjBlbTJNOHhjNzVDUDlTNW5JRy8zUUUx?=
 =?utf-8?B?UThVd1E3TTlUbG1mcGdQUnB5Snh3UTNvU2U3UWxya2pPQ0crRS9BMG9tSHdO?=
 =?utf-8?B?WFZGWWk4cS9ORXlNZkdOeTArNTZWaWVCdGRVbno4SXlHNks5aExWTUhPMjRM?=
 =?utf-8?B?dnVNcG5xVnByR2FyMVQ1S1p3TUlPVS91eEFUYzJHM0I0cEc0ZnVvSmFoaWhM?=
 =?utf-8?B?TzYrbkkzRVIvT0ZaUUJGelErZkpWZ2xMZEdlMjdld2prUVNSb1NwVHhlV08r?=
 =?utf-8?B?aUZKSUd0ZEJEOHVyZzdWZ2h0VWxaNyszbENvSkNDb09VM2g5RndWdTd5eUtB?=
 =?utf-8?B?MEp6ZXR4K3Y5NDR5SXJYOWFTVmdLRVl1RXVTVmpISWo3Yk81QXQvSDFwV0hi?=
 =?utf-8?B?ekJwdE91VncydnU2SFRVSFZqWnFFaDhjbVJ6VHhRMmlrckZCblhOVjdSRjBN?=
 =?utf-8?B?UTBBakRRRWE2U1VtZGRRdDhhM3NGVDJtZ2VRLzVXUlBOOEVQVTA5SFM0amY2?=
 =?utf-8?B?TWYvYlordWNEV21sY0kyUVhoUU9rZXZuVnhnSlFuRVBrSkNSRlVGSG91SXZn?=
 =?utf-8?B?dnltQjNMck9LWTczUldVNGJPNVlMQkZyUitUUTVkUVhTMnhNUmFXeG5KcmVR?=
 =?utf-8?B?N1M4TUY3bTFNTERaTU8vU0VDSUk4RU9HOGdjUytZcXpCWTEyc3JsdGtqeHNm?=
 =?utf-8?B?OXN0aXVIOSsraU41ck5yMFhNTzJXZmEydWh4YzdwVTZXeG1GbDhCV2hVckY1?=
 =?utf-8?B?SlU5Z1RZNFI0cDNidVJ4Rnd4a2k0VkxIVVBOYnhNSkdTcThWNGxTNG1ER012?=
 =?utf-8?B?ZFdidFQxVXlMNS9pREtSb1hjR3diNFQrZ1MwSXg4RllTbHY5eE1BV0JpT2hh?=
 =?utf-8?B?MUhOQ3ErWTYyREtvc2JGdHE0TjBKTklCUEtmVnJEdUtRVExleXRvanFhcXR5?=
 =?utf-8?Q?Ise4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWx5LzlYN1Z2bUc1VWdzd2k2eXhPUlFnYmpKYXM0Y2VQbWlZVFZQYlJZbzJp?=
 =?utf-8?B?aUt4VFd6TTFvNW5oa09EU1MvMXlmOHVaUjJpQ0JTSFB3K3VqQjE1THJwZnJL?=
 =?utf-8?B?ZnIrbnMzTEFJOFdiQmxrWUJqQVFzZFNBWHB6Y09oR29GNDdId3hlTmFVZGlU?=
 =?utf-8?B?VWNZbFNiMjBzSkhPVHdwM0xqQnljZ3lHNEVjdmpXTHVTOG9sYk1MVHlvVVN2?=
 =?utf-8?B?YVI1L01WY0YvSnFTK2RNQmREbFJnT0FEN2cvSVp5bUVzK2txbGJvMjhob1Bx?=
 =?utf-8?B?Uk5TZDNudVhWbVQvYmlkdExXTjNwdVJBTlM2bnorTHp5dHNDbFJWV3E5SkN1?=
 =?utf-8?B?K0pFbk1ROEs4akZYN2JZbG1XU2pITE5XSHpuUUxIM3Rjc1pZQkpsV3MxOTc5?=
 =?utf-8?B?Q3czQWZjY1MwZzVDVnp5eG9mb3B2OGZMMXkySVBBMUhnN0dRV1lHM0hwU0pI?=
 =?utf-8?B?bGlHbFhSWXNKNytTMW13bTJCT0wyckFmdlNqUjFrMEdLK29DeklDYmRUR2FR?=
 =?utf-8?B?NXV1V3B5YWtEakQyWVJ5Y1BXajZweGJGbkttNFZLZndmMDJhbUNDL0hHS2VH?=
 =?utf-8?B?ZE9UNEsrQitLVlZpRnBWQWpLaXlTUUtvT04yMkJrK21pTHEzR0VmWnIzT2JN?=
 =?utf-8?B?aUtTeXJtU2RPQkowNkU0VnQ1amFyZ3k4aDJIWGRBRTg5ZytNUk1oWnh3cGtF?=
 =?utf-8?B?a0JKMkF4eUNoL2lQYnJ4SHA3WFRCaVBHRXRWaHhoa09lanZxRFRKcXdaUGZs?=
 =?utf-8?B?cVgrLzV5TVI1emRacVZXUnAyaHE0SmlYWWdaSm9oYmFwakxkQU5iVmhtV3dQ?=
 =?utf-8?B?T1pKME1hNjlUR0RaRmIxTGozdjVyR0M5V1d1K0V5d1RnUU9Sd1EzbTl5SUht?=
 =?utf-8?B?MEs0bmZGUDVDc3VSNXNwNkx0bEpGSi9Gb2JwN01Edjh2QkpQVFFmR0crbldK?=
 =?utf-8?B?aXh2TkhxdWk4cUpJYUVDNUVnRjdBdkU4azd5NjN5d2NONXJZdTNXK1Rud1pj?=
 =?utf-8?B?a2MwVmZjVFJOTzc3ZE1SVTdUNk4vOVUzY25UcU92TTRFdzU3RFNjaTd1N2xK?=
 =?utf-8?B?c3dIWEFicDh0OWpYWjhyQlBPaDVsb1NGMmJsektGSmNnVUVCU2JaS3NPWlBx?=
 =?utf-8?B?d1FRNGg2NWRjNVNUbWp5U2FaRjMvL3d5a2hOQjBXSnF4YlQzeUY5bjdVOUJ1?=
 =?utf-8?B?K21vNlVLbnBDbVZpelA1TC83SWxYS0UwK0hyMHFhbEhHRDVsVEJUSDJ0cXpn?=
 =?utf-8?B?QStldDl6akE3RVFMTFdtNUhlRWRHQWtCTDhIRnlZU25yb0RJbXRha0xWcDRs?=
 =?utf-8?B?V0IvRHlpY2tvZk1WNTJBcy9RZnQyUXhVd0xxVytLMWJSTDFldFBEdVBMaGRP?=
 =?utf-8?B?b0FJaWNkQ2VpRzErOFBwUmtzSmFnVXJET0RxeUp1aWFSNUtwbzhCTUt2S2xt?=
 =?utf-8?B?cXdJUi8rYUZnYXNUVStneXJQU2FFNXJLZllIK3JxL3RVcysydHVMaTA1eDN6?=
 =?utf-8?B?MDZjL0IzMG53V2lLNFlTUnB2VWdhcWd5WEZaWnppdHF4K09PbXBtbWhsWHlN?=
 =?utf-8?B?bVFjNlg0M1l1eUlGZS8xUlZSY2o1WXBxN1NyZitCeHJJdGppc0VMbGVSa1JZ?=
 =?utf-8?B?Q0FLL1Y0NFBPOERQaTRSbXhwc0VLRkQ2RkhTUGtUUEk1SXZSam92WGMrRXNv?=
 =?utf-8?B?TEdlWnRCZFBESGQrWksxYnd0VnRjNTNUVGlQUS9LWGV0NGZ3cm52djZLM3ZH?=
 =?utf-8?B?NjMwbk0vQkJSeFlKTFU2MFVTUEo2NEdpK1hXU3ZhanRaajhrZEhpYmM4YU1o?=
 =?utf-8?B?OVZKODlON3BiWnc4UVhrUS9rZXdWM3hxVEE1bVJNU0RoNmZzVnEvcXVLSTBj?=
 =?utf-8?B?dW5hVHNtd2ZSQzk2eEZFa2oxR0NGZjQwL29KTUNoTFRZeDZmOW9TQzJxck9l?=
 =?utf-8?B?cmRSV1U5Rjc4Y3dkYk5jVWdYRlJnK2JtRzRmZFNWWjZma0FuT3RWSnIyTkYz?=
 =?utf-8?B?N2lnOUNXQ1JOcnExZ1lFK05CaWNTeUhzVGhhQmQ1RUE2NFh5dVJRRjk0MlRm?=
 =?utf-8?B?NzE1YUJZdWFsTFM4cTZ6b0hoUEJiS21LNFAwWFdETkY4RFJWTk5GQUU1dkJN?=
 =?utf-8?B?b3F2RVlWblN5bjNvcEl1eVZJdUlHUFdSQjcxaUhyNFVTZG12Z3NTeTlsVVc4?=
 =?utf-8?B?T0FHTzVHWisrK3Rid1dKTlNJamJyN3Vaczd2YlhoWVlOZlBFbExMQU1qa1RE?=
 =?utf-8?B?MFI1ZFdpUjBydGFjNGprRlZ0V0RKTjhaNnRvRjRMaHNkYkwxejErQld1akxm?=
 =?utf-8?B?MmhUWWxYMyttTUhCV1pub1p1UTIxaTIrNjZlVFFHS3RhVEZ1bHpjUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d2fdd3-e7f9-4e5b-34f1-08de5e795185
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:27:08.6719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/iJO9JEMSWsUxZNJIVTLXpLyryTGIostKYogQP3+vm50KD8jCvFcH9U3eHFbooep0VHXWBOfIMjPgR5vnVPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6955
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F2CE7A2C22
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 03:46:31PM +0100, Jan Beulich wrote:
> It's not clear why the enumerator was omitted, as these clearly shouldn't
> take the "default" path (issuing a warning). Handle them the same as
> legacy and PCIe->PCI bridges.
> 
> Fixes: e7e08d86ad2f ("IOMMU/PCI: consolidate pdev_type() and cache its result for a given device")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

