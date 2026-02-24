Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHc/DIvbnWmuSQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 18:10:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C618A59E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 18:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240213.1541683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuvvJ-00059P-0t; Tue, 24 Feb 2026 17:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240213.1541683; Tue, 24 Feb 2026 17:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuvvI-00056M-UJ; Tue, 24 Feb 2026 17:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1240213;
 Tue, 24 Feb 2026 17:10:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCRR=A4=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vuvvG-00056G-Na
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 17:10:10 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3d29ca-11a3-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 18:10:09 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7585.namprd03.prod.outlook.com (2603:10b6:408:28c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:10:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:10:04 +0000
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
X-Inumbo-ID: ab3d29ca-11a3-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAFuwMhZeIjUVD2m2N5nC6+Uux33d4cNxpmHHH/Cge08ZeZaVq3JREX1xvcv5SRkHZDWYO3s0BK2mTcYESFfUV41xoMkt5qK0zc+IADEwMh/AT1XQr1E5lZEcbkW2l1Ws/2+E8/iGiorTNMIIzZQo90D6v+AQUadnyzw3mNs/glPszc7rmRVEou1f6lMjbo5RWIj7KuRSLM8MItZgDvQJHvuXSd9J2OtBcdCmPqPQE6QKhzpGqpIlzn9tw1qp4uMLbGZ3b41fEy7Zg6gZYiJD86qfQGvoxm+Gzt5c0TSgHzDzQCfC62RjMct9/1uKB77bs7bJCL1wUztvJkBM9sqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJRA6mIJs0flmJtp3knxTSkZbCXND5BJUCKXBSfEPBw=;
 b=FkN7DYgoFdolcoQm2TYrKccAft7qDLPucuqJILmFFum6GTeMbI1syepnb01I58hWbx6T2wpM/HnnA+K23jXWwQEOXTXAucjmm0rWhZyVLLmuHjJPmmVTmxFGTCK8suDdiuo0qH2ZsKHxHgZ91Je9sair9AzDlfx5EhoKXK50RrS5ouniKLkOmx1GMigTqNJDVvF37MfV6dp4BvJawWWO3QXigOkpFcN56mTXSFCM7OSje217XqpMNkp4jtdh1XFK10J8aDthU5yMI9wJO3RcRD1IFXthWWNx6t0nttjtgRrHOq4jbOsa9oyNsETZng2Qa90A38khT3EjEtminwFdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJRA6mIJs0flmJtp3knxTSkZbCXND5BJUCKXBSfEPBw=;
 b=0qronFArfQ+bgWr+zCD98aLW5S185xjzeK15TeJm7nNZfAg8oebycOoS48Xhv7hWL2wHn4z+47Jtms/E3BaNx1Bc5YwwaKNhnpMPFBIV3ZvPYtdwX4mJ8/7PwuXgZS3dR5dVMExrYwCJ7QOi/gFHNwShB0OS73UCPSQ4u3jRV9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d550ae3d-02bf-43eb-a96c-b7cc946f79a9@citrix.com>
Date: Tue, 24 Feb 2026 17:10:00 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 2/2] xen/arm: Simplify type handling for SMCCC
 declarations
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
 <20260224124558.3675278-3-andrew.cooper3@citrix.com>
 <261af40e-db79-477a-b67d-1af7428782d4@amd.com>
 <f8a0d742-18f1-48bd-841b-1943fcb632d5@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f8a0d742-18f1-48bd-841b-1943fcb632d5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: cddb651a-7f59-454b-a56c-08de73c78d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M29jbVR2SldYMFZ2RGVvR0hKMEp0ZXZhVldvOHhPRER5ZGF2dmtya3hQTDdv?=
 =?utf-8?B?Y2tMeFR3TUNLc3ErOHZQSkNMTUY1Q09ROVQ0N2VPc3l0NVFLVE1pRkpNT05B?=
 =?utf-8?B?a053cUk4MDducXV3WTBXQmU5cjZzVkJZUnpXSDNXTWRwSWM0NzBHdHJGeEpG?=
 =?utf-8?B?Qms3aU15NnEvQXhWUUg5Wk1DQWF6UGpXdExWYmJtWWJscklPYjMvZSt0aXRI?=
 =?utf-8?B?TUFpSDhzSG5jQzNQZStob0p5WHlLeUFlTnJpOVRySzR4aE9LN05nMTl2MjM1?=
 =?utf-8?B?SWI1bmpOdHRnR2R6cFk3UlRseU0zOXpDeTBBbDJYbjNKTkZBbEg2V0lqbXNu?=
 =?utf-8?B?VnFWNytQSE1nRkVQZ2t3Z0ROVUk5NzQ0bnBWc3gzV3dReUtHR1BzcytFbkRX?=
 =?utf-8?B?R3BqT3JLQlo1RXdNTUZmdE11Ti96Nkh6ckx4MEI3UXlXNS9DZStWTDlzZFZp?=
 =?utf-8?B?N2l3ZUluU1J2L21yaTN4M3VUT0FhbHN3TVN0TElSeGVoc1Q0dzFDZVZsQ2pv?=
 =?utf-8?B?VjRQWXpiN3J2anNZYmwzekVKUVd0emVQWHQvei85UGZtdkVJR1hIaCtGZ082?=
 =?utf-8?B?OG05cGlUYXl3MVliUzFGdTFVL3BETnBVYmY2NlhvaGNTMXRCOXdOYkNqSERW?=
 =?utf-8?B?TTFoblRmN2E3SWRucFRyM2hZT2JLeDlFaXA1YWxvaEpDZDR1dVpaaityY01z?=
 =?utf-8?B?MTJLaHRVRVNzNUFPSUhHVHh2eFRYM2Y0RG9nUXpFNXhHOUxEVWFhVFVMTGE2?=
 =?utf-8?B?M1pydVQ0Tm9LZk9JUU9WOGJESGVCc0JId05ZbDVHeWpkak1aUFg3TUdZd1Bu?=
 =?utf-8?B?a1o4MUpRU1pDUTA2dVY2aXFIdlRvQU8zUkZHa1cxMEYrT2czSHk1bW9sd2t0?=
 =?utf-8?B?TWFVU0VNV1JucDk5QzJYbVQyT0tBVnpXZkVFMHAyTGR2K1VZdnRCbXFxQnI5?=
 =?utf-8?B?VHc0QXpXOVRoRytxbGdXaEJ1akQ3QzBocTk2RWJYMVg4N1JMN0NuN25KWHhL?=
 =?utf-8?B?WDJmNmpzQm0zWmoxM295RVlzV1F0TnlzSVB4MUZzcjZJMWMzbE9BL05jYWRG?=
 =?utf-8?B?dEtBWTFLTHp1aXhad3dCMHVaQ29yeWlNUHlOb2JLQjRlcVlWbVBBcnJKbnow?=
 =?utf-8?B?ZkpKd2VvQkJDR3YrRzN2MzVXams5aEgvV3lvRlhxYXZpM05kZk1oZjE5SDBJ?=
 =?utf-8?B?OVp0ZHdQZDRtdUtmSGpjdEhCSStKMk9pN3A4Z203WnNlOHlxTDdzRW9rNURB?=
 =?utf-8?B?TmFCSVhFbkpZdXc0M2pNbFcyV251ZHYvcUpnaC9ZSEk1amdXcTdRVzcwUlUr?=
 =?utf-8?B?c3FSc1RUSEZubmRBZXBLenRsclB6SjdWKysxcXc5Zno2dStWaElBVDRndTlF?=
 =?utf-8?B?WnhtVG1admVMajhoOGJ2WEdhODNEQ29nUFppNTB1VGg1WkY2VEhNS08yV3g3?=
 =?utf-8?B?a2FaRmpwZ3cxU3U5RkYwZlkxUWVzbThpZjVialZMKy9IREpyNzNZNGFaZS9i?=
 =?utf-8?B?V2Vic3JPVlhpMTBmditSbHc5eHJ0b0FYcXVwRHovbE5QcG94MzJMYmlZRFZr?=
 =?utf-8?B?VThoTDNDZ3ErVDA5VHFIZkpsNlIrb3NZOHhhM0pCZDRDbFZFeEpJR1doTnNP?=
 =?utf-8?B?RHM4ZmtyM21WbGM0OHVJQUpTbjUxT3FYeE8zVEFoRXNpWEk5Y3FGOU9iSGk4?=
 =?utf-8?B?UHlYZU52clB5L1phYWJEZFZrd0w0eElTcVFjQk5hejVlbWZOTThQTi9GUWlx?=
 =?utf-8?B?WWNZdi92NzltekJiYTBrN0NsRllKV2wzQVA5TDRGNEVzcmlRd0VhY0cxV1B4?=
 =?utf-8?B?RGRIR2pXOHRVVGVQVUdhRTQxZnZPRE41MDZXWHJzK0JLRXlnVzVyclUxTUlu?=
 =?utf-8?B?VkFCWXMxR1hMUkFCS3U5UlgrdVd3TkxhYVhXQ1pBdUQyMkNxUmw0STluMmpO?=
 =?utf-8?B?ck9yZXMyNUdpdGxmai9sQnpJWHdnR01rNXZ5VDQrTUxjTjlTeVpzQTJhcDkw?=
 =?utf-8?B?UzZjYTBOT2JLRVYyMjNOMWFmUU1reTd6SUR6THZYSWRpVkI3QnVJMEdlV3Fp?=
 =?utf-8?B?UXYyS3ZQa1dHWlo3K3R6aklPTkhoRlFvY3BHUE5EekJQMWJaU2hHQ3ZBNDZD?=
 =?utf-8?Q?nFoY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWhuK2VETWw2OVFjSXpkeTRLVHp5MVVWc2hWZmQ0NzlvT1JZdkdNUjZGRkdT?=
 =?utf-8?B?ak1mNk5TY0Y4ZGY2MEFveFFrWGoxY3lMcUN3Qnoxd2RydVl3QnpxMUVXZ3Ns?=
 =?utf-8?B?c1pFc3RnYnV6QzBYcDN6QmlBQkhNRStwMkRNVHlzU3RsdkVqVkN4aE9jVjlr?=
 =?utf-8?B?eDBrbHo5N2U3ME5QQ2NNRUpER3U2UWM4ZG1jSjlKUXlSRERwS0tYbSs5T05I?=
 =?utf-8?B?WERydncxUTF3cVA4WWpTN0g5andqa1RKRURCQUlHSldtZ24wZTU5UEtzVFZs?=
 =?utf-8?B?ak1rMGdJOXRyZzdQYXhPQmRxdjZRNy9TRGZDMHNrc1lrZHM0UWdiTkJ6WUVR?=
 =?utf-8?B?QmFPTnBSVEc4UFM5cTh6L2hpWU5mUGh1eDFVSDc4ZmNobXlNb0Q3OFBHeDFm?=
 =?utf-8?B?R2w1ZzA2ZFhJb2RxQVpKc05Ra0ErWW5YVHNOTFR1SVdaZmF2TFZOYk5VV3NY?=
 =?utf-8?B?MTgzNjBxYWM5SE9lL0pvWkYraUM2WEhIVEE3TlFHTGIzZk5SWEJweXVTNDBB?=
 =?utf-8?B?bzEzVktRdHZXOGc1T081R2NFSU1pLzFRNVJMMHh5aE00MWRDQ2Z0aUVJYVVp?=
 =?utf-8?B?THFvZHd3azBobnpQM1hDUS9kd1ZQcTl2NzF2Vnp3dTZCN0kxQnFoN2Zrc2Vu?=
 =?utf-8?B?WTg3T0o2U3NiOXFRbHY1TlhrYm5aNDFyd3FWZjFWRVdoL0gwcFN3TGJzWlFm?=
 =?utf-8?B?SFVpZkt4cU5ZamhPbE5yNitkMWxvMEx2bk1Dc09rdjU2N3dRZ1hUTWYzWndv?=
 =?utf-8?B?cWdoT2sxOU82QzluU01lS0RRWCtsTk12OWFyQ2NsOTlBY3E1bkpKSHFxRmtY?=
 =?utf-8?B?SGFzWFFUNGZJd2hRQUFUUHVtMklod2RyS0ExS2JlMEN5LyttQ3E5VUZUeDFw?=
 =?utf-8?B?OFZiODVMbDBmODIxSzN1QmFUNjRxL0YyWDdTZjJKcU04dmFCNmRPcTNoNjFV?=
 =?utf-8?B?d1Z5NlpVUGQzUHZ5RzJjMThBWkZjRnZudFNqdm5sa0FhNSs1WWZ6WisyWDEz?=
 =?utf-8?B?aldyQ2VnNjBSZWhuMU9xOUE0b3ZOdHZsNkdkMmFhTVFnYWtWSHd2TjhPU2k5?=
 =?utf-8?B?WUMwd2lCMy9ZUHdNaFBCNDJva3ZKVjNMc0R3Sis4Zm9QSzdhOGhWRTAvZDk2?=
 =?utf-8?B?NEtYelRMcUh2am1icTdCTExkVm9NM1Y3MEF0TVpsUlAza0hmcmpabDE2ZXIz?=
 =?utf-8?B?amxvY3FxV0RCeHZTQjluZjZYTmFaNjR6RHY0Q2RPb2F3YXpGazdhbVRqdko1?=
 =?utf-8?B?c242cVBrSHpSQ28yWVUzWUk4aU04UkVYaHAvSWR0cDBpWFQ4YUpMSWgrcUpQ?=
 =?utf-8?B?NGNXakNBOVI3cmpUOGcwUmhlc2UxNVhXbWprZUtGV2FrNmlVSUlHeFRTanhH?=
 =?utf-8?B?WVBtQTdZN1ZLMzdoeTQrRXozVVJDNGJNcXdEdU1ZMkliK29SaEp4N2FFdmRi?=
 =?utf-8?B?MDA4NEtDd0lmNENpMFVtN2NkM0NJcFBKK0RQRzNFaDdFdU1INUc2bkU0L3Jy?=
 =?utf-8?B?dkQxbmpldEJ1a2FrVy84aUtrS2s5dVJoc1FVbytQcXlySWpIZGhDdWFrS1BZ?=
 =?utf-8?B?WDlzdnA0ckx2YnBCczM2LytWVkl2Z21jbmdLSC9jQXFxWnM3S0c4NVNLUndI?=
 =?utf-8?B?TGtWdG53T1h6ZzZ6dExxVklSa1FEcldweWtid3V2UTAzam5HS1ZxNndIREl5?=
 =?utf-8?B?UFE5eEdCM1U2ZWJoZEpueXBmZUxFT05pbE9SMDRCSTZHTFo1WVJOelZnT0Vn?=
 =?utf-8?B?UXhuYUdNaHIra0JUYjBhY25yOFVXbEVDeWZ4RW9VL0lNU1JKaVdQREpqaFBw?=
 =?utf-8?B?bFpUYmtSRG91Q0NDNmYyeFZmTS9IWk91MGVyamcwTHM3NjY2OGhkVGs0MEVJ?=
 =?utf-8?B?d3U2RFg4OE5VZ0ZqZHdieWMyYkMyL3BaVkIyNjRBMnhCNERoNzRFMndrd0Nx?=
 =?utf-8?B?N3AvTUZLcGVzWXdEY3JNZVJGVE11Z1hDR04vdmNOZmpYR0NZYW5oSS9VcGw3?=
 =?utf-8?B?STd2QTNvaHN0UHE5VlRSTi90RUdYaDZhSVhScExWOURoM0FtRnJQK3BKTFoz?=
 =?utf-8?B?N3YxN1JMMHRtWFZKTzdoUjF6WU9QcVZYaUR0SWtBRW9zU3Bla3BLdGZySHFD?=
 =?utf-8?B?bDB2OWlaY0l0NnVMV3doUTcvY004aUlyNmhjMlVuRitIMko0Sk9EM0V5bTQ3?=
 =?utf-8?B?R3l0N3JIempvcStSWC92eGdKSjNPMzJCWEZVMVBIZEUwRVVRZzdMVkRGUFIw?=
 =?utf-8?B?N3pVSVdlWmRBQ21UZmRHbGNFNnM3d2M5ZmxLeDRuR1pDNzlLRG1OZXJkV3Ba?=
 =?utf-8?B?VzFrMWNHamhENEU5bDZackhIL3MxVkRNS2tDMFh4bThXd2UxTkw2OUVQeUVS?=
 =?utf-8?Q?aq8AjMdHVprsxAwI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cddb651a-7f59-454b-a56c-08de73c78d60
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:10:04.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5TjATuUdyzzci3rpaHvvCMBUnUYvxNZ0kGnboMrgUXCPORZptAp2KtU0DvgSgHtA6aY59qhp8i80OmbGFupb7NSg30S6JTuq9p/dO997xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7585
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,arm.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email,amd.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 958C618A59E
X-Rspamd-Action: no action

On 24/02/2026 4:02 pm, Andrew Cooper wrote:
> On 24/02/2026 2:18 pm, Orzel, Michal wrote:
>> On 24/02/2026 13:45, Andrew Cooper wrote:
>>> There's no use creating a typed copy of a macro argument, simply to use it to
>>> create a second typed copy.  Remove the indirection, halving the number of
>>> local variables created in scope.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>
>>> This also makes them clearly elliglbe for converstion to auto, where they
>>> weren't before (typeof expression not being that of the RHS).
>>> ---
>>>  xen/arch/arm/include/asm/smccc.h | 21 +++++++--------------
>>>  1 file changed, 7 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
>>> index 347c4526d12a..7e90b0b56550 100644
>>> --- a/xen/arch/arm/include/asm/smccc.h
>>> +++ b/xen/arch/arm/include/asm/smccc.h
>>> @@ -113,39 +113,32 @@ struct arm_smccc_res {
>>>      register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
>>>  
>>>  #define __declare_arg_1(a0, a1, res)                        \
>>> -    typeof(a1) __a1 = (a1);                                 \
>>>      __declare_arg_0(a0, res);                               \
>>> -    register typeof(a1)     arg1 ASM_REG(1) = __a1
>>> +    register typeof(a1)     arg1 ASM_REG(1) = a1
>>>  
>>>  #define __declare_arg_2(a0, a1, a2, res)                    \
>>> -    typeof(a1) __a1 = (a1);                                 \
>>>      __declare_arg_1(a0, a1, res);                           \
>>> -    register typeof(a2)     arg2 ASM_REG(2) = __a2
>>> +    register typeof(a2)     arg2 ASM_REG(2) = a2
>> Here you fix the issue introduced in patch 1/2 :) You drop typeof(a1) and
>> replace it with correct typeof(a2).
>>
>> Provided this patch is rebased on fixed 1/2:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Thanks.  Sadly, ECLAIR rejects this change.  I need to retain the
> brackets around the macro parameter after move, so this kind of
> incremental diff:
>
>> @@ -114,7 +114,7 @@ struct arm_smccc_res {
>>  
>>  #define __declare_arg_1(a0, a1, res)                        \
>>      __declare_arg_0(a0, res);                               \
>> -    register typeof(a1)     arg1 ASM_REG(1) = a1
>> +    register typeof(a1)     arg1 ASM_REG(1) = (a1)
>>  
>>  #define __declare_arg_2(a0, a1, a2, res)                    \
>>      __declare_arg_1(a0, a1, res);                           \

Passing pipeline:

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/13244194836

~Andrew

