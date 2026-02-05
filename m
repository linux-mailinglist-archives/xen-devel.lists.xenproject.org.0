Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHMqF5HjhGlC6QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 19:38:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE32F6796
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 19:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222404.1530347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo4Ei-0001Lp-J9; Thu, 05 Feb 2026 18:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222404.1530347; Thu, 05 Feb 2026 18:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo4Ei-0001KI-Fy; Thu, 05 Feb 2026 18:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1222404;
 Thu, 05 Feb 2026 18:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqXU=AJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vo4Eg-0001K8-VZ
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 18:37:50 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49a795b-02c1-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 19:37:48 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7499.namprd03.prod.outlook.com (2603:10b6:a03:556::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 18:37:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 18:37:44 +0000
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
X-Inumbo-ID: c49a795b-02c1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZo5Dro6s46edGVxFMMy7nFF72MRftPhLD3h/vxRbno0ZF9H3P6jiueO8GkPS7ORZczpAoSeJGC+7SjIYJLtf9nniQWTTyHI7eb09x6yhRcCHSRoAuku5VZWo+OFPeLsHuw3ux+krQPLgzmH87vYvohqA5v7dIemHRdvu1KlcBbODZpLs7EAubleGaiAK0HPB8Ub/f0Ojw4u7XsJllUREhv/fbnzmLC0hjP8nMaegvHDf+TE7unSMh8Rrx0Nhvvj76/3pIB2Gok8N9XDfXbIWJtpMGl61HOCE4bLo3t3fosZJCap2nK7LTHniddrUp9cBEBv/n2Accs5Kftt/n4J/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFQYl0Y5OkRfjuc7gvQp0cFLG9spXPKgUMOz33RxD3I=;
 b=rfCv2UrpZgP6g1+13tprW1ud0ZGnk/asd14Ews43RX1yHtz04hZXh2bF1NfVi0pAYnUEVzvgaxS2pWnXwhqRK/MVV86h/BHm2AR8QNdELcq9VcTdbZyIqf+YUU9JMSU3r+Ejq6o9bDtjwJ76XeltLwaN2bvWopWliBbAkm/DZIZAnesSdoOOxAa8P4l1Y5NoIidqBY6/hQvlVeH4bfJeFvhKaNGvd1J8+aynMP/m8AgkuPYgOvXZ/TftSv+YAR2ckW+QxYQ8rbjL2vFsvJQK+R245i0rIF31fPKwhaw16mgZHLQFq+4hacTRwg1apLkMS7w8cUAqXzgcWJpbkVlW4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFQYl0Y5OkRfjuc7gvQp0cFLG9spXPKgUMOz33RxD3I=;
 b=i5BVV9JcXMN6jJgFQY1kEkQSd/eBxgpn/am5uC/JVDWHxtH96iBt4+iMB+q3K5iLz7xgeoOKJNByLio5NQp5iGlsgHGSov0OdaV6af5zsrBFXNaMGSA1NouvmlgSvjNna18et+8jTrYe5VKcI345G/GPQi7Jz755Z0+9h7Mo97s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Feb 2026 19:37:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] x86/domain: adjust limitation on shared_info
 allocation below 4G
Message-ID: <aYTjdULkU2fCSR9Q@Mac.lan>
References: <20260205080308.91057-1-roger.pau@citrix.com>
 <5397aef0-2103-4775-af45-49a100be7ab6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5397aef0-2103-4775-af45-49a100be7ab6@citrix.com>
X-ClientProxiedBy: MA2P292CA0020.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::10)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: dac4faed-fa5c-4bee-d281-08de64e5a6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTB4Nmh4dGR4T1FGRFc2bWNCandMemt2dzNkWnlvelhJejFibThjclduaVZV?=
 =?utf-8?B?QWdhaHUvZjVseGk1a2pKcEJKNFplUk14R2xhQ0RYUGpYeEZXZHlOcG1hR2M5?=
 =?utf-8?B?QnJMMFh1TzZBS25mMUpHTEdkdEV1ZWd6ek9tNjh1cm9adFpxZFdnVFd2ajI4?=
 =?utf-8?B?Y2tUdURpczNWdElRWmdoSzV3dGtLVEQ2ak1IZzQ5Qk9zK0xXMXYzWS91OTNE?=
 =?utf-8?B?RG9mTHV2enpralJEeXNqRVBaUGVIWXlPL1dFcWZlNFFla0wxRXh2L01YMjFU?=
 =?utf-8?B?VGIyRmZ6czBVWE1kRFFicDZlWWxDUTNyUWk2dWtXQkVzNEQ0ZXp1R2pWcUEy?=
 =?utf-8?B?QXhLUW4rZ2FBcWZnbTZhMUxQeUV6aTlodllxTnZzTkZXbGZjU0VrdTJ3ZEJD?=
 =?utf-8?B?SEpPQ2NkL1krdnRLU1dLblFXUHZJUXU2Y3hjWDRsZHJaaDNNSjYySklOSURO?=
 =?utf-8?B?emxUWEZObHpVQXRPSVZPUUtmSWgzL21LbjNVUFdpUE1pRW00SUVHOWtBektI?=
 =?utf-8?B?aSswRVBZbW4zUHlkazVvRTdtTDBzNXE5M3lsNlBYOHJ2NjBnN0Y5T24vYzFK?=
 =?utf-8?B?dU5RZGJzK29XOWR3VHZuY2F6dTRmR1lCM1ZmV1lpbHFkWE5PRDhTNm9kY1BV?=
 =?utf-8?B?N2VCMGF0elhteHdWTkpYMWo3aFhwR3hkeGRMMmpTM3VCN0JyNHVBZlRGVkU3?=
 =?utf-8?B?cERsUmhlblJHRGdodnQ3aTNtWjlDU0VLTHBoOW1qcDJzZk03WXZoSEYwSE5r?=
 =?utf-8?B?QmtsMGRNNTZoSnpXMkRkNlZ4cFJpb21GclZOQmttakdhMnlQREJKclJvMFB6?=
 =?utf-8?B?OU5jTVAvd3AyRjlnbHc4RWJKa212VWo1ZHhlVWhmQWFZUGo1Skp1a2d3aWVp?=
 =?utf-8?B?RG8vWWlOQ2JDMFZQL2NwblBoZHpxYkhrZHBJUDhCb2pmdVlid3dYbFNtczdZ?=
 =?utf-8?B?TUxrdndOL1I3bFhqb3FnanNzc0M1K2hQUDgwR001aU10Z0ZLd2NjRXlPKzE1?=
 =?utf-8?B?Wk9zb1FWUlhGSmNreU1LS1M0THIyejhreUZwcFVOcGVOSitnZExZZkFJVWFO?=
 =?utf-8?B?VlEyVlZZK1hmWk9lTnZSR0tpTDh1WkVVYWg0RTNZUk1ZQUIveTZuZkQvWkhx?=
 =?utf-8?B?bEhkcEQ0UVFicG9iTVBDQTVMdTRvV3pjanhWZTdINTZxODVKOXNKZmRHd0Jj?=
 =?utf-8?B?cUhWWkRjZ3lBKzNXUW1BbUd4N25IVm1GNnFoRlNGTy8vWHhxSG1iWHRtOThp?=
 =?utf-8?B?VEM1NlBzb0NjUzQzQzQ5TVdVbFE2ZnhPSkdBbEZlMDZCaFREZWpVSmhoRUU2?=
 =?utf-8?B?d2JEenIycUczTEN1bUlyT0NpeWVDcy9ZUHpveFZxNVBsdXVMazQ4dXBkWUIr?=
 =?utf-8?B?U0lkblU5dGV6L0tseERLYVNqUW5aNmxaODBwaEFVMEgrOW5YUGp3UktZdjFY?=
 =?utf-8?B?S05hTHIreGo1dm5hZTJVakkyUXFQQUg0UEQwWS81RDRxTkwrM1h3K2JSQk9W?=
 =?utf-8?B?dG5xVFVISWxBSDZCYVBGc1J6akJ4QkZpVFJNbnBNQ0VTRmg1eWNleE9wMmJT?=
 =?utf-8?B?ZU1CblgxNkw0VjN0YjFuYUs3MkdnWHBGVlE4Q1lwTWZ1TVl1Qmw3a2Rqa0JU?=
 =?utf-8?B?d0w2TFk1OWZ3RmZuSmVlSjUwc0c4Mm1xQ0l2akFiNjgvT01IMlVlbUU2TkF3?=
 =?utf-8?B?ek9YSW9qSlpLM2FIYjNNb2lVN1NqQWtUTFVHV1pjSEhRaXF1Zks0cTI2S2M2?=
 =?utf-8?B?RUU2WlhaYXlQYXUxTUtrRWw0cUMwUXhsUWlDcWxhY2NXaENaRm9nWEYwSlg4?=
 =?utf-8?B?UWtWakRMOElUR3cwbHdnTzBWL3RwTjRPUU5LQUJ1MzBEWm9xdzRQUER5ZC80?=
 =?utf-8?B?WlFvTjdZaERsUm9BbWpNR3R2SFdjQ2ZKejIzcWJrajVjUFRTY1VNSnJpL1Vo?=
 =?utf-8?B?S0RtUTVqTlRGQjZkd0lRc0J0QkZHMy9zVlhRdS84bUs0OWNtOVpBU3pCVHJi?=
 =?utf-8?B?Sm56TG1iUEFIbnFKNStkVWJCdERDRmhoUmo0Mm9oYkJweFVWQ3kxTkRGczlI?=
 =?utf-8?B?UmtWMStlNEt1QnIzUEEwK21tUDA5bm9DUENjMHBJL0syZk1sL0RiODZsZU1B?=
 =?utf-8?Q?rBEA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1BoMWZZN2hxZGtjaDJjYUNEcnlldHJjSnFnMlVsR0VreUdYS2plaVVkeDZ1?=
 =?utf-8?B?eTc0djFITnVic2k1UXhXQ0dxb0dsOUs4djlqM0JleUZoeHdQSmF0Rm82WHg3?=
 =?utf-8?B?V1orWlJoRkozVEdNdyt6VmVPdFBWU1BSV0R0cFVqa1J6ZldRQWFONkJuRStr?=
 =?utf-8?B?dXU2aEEvWHprVXlrVmdETnlsNFArSkNuR3BxS1liaG8vTHN3UlN2OVY3YWNz?=
 =?utf-8?B?ZmFtUmlXSEJTK2R3cVk2ZXFuNVMrTUtxb1BRakxLdGxoak0xL1NBUEIyODl2?=
 =?utf-8?B?RW84czRIc2dzS29NaDFhQTFvWHB1a3NEaldxY3pPaURmYzZlYVlJcmNMZERD?=
 =?utf-8?B?bzJjNmtLbWRsUjdVUHhMSTZSS0FySFFjQzNveFpCcFlTK1RHTHZiWHM3TzlD?=
 =?utf-8?B?eWc4N1pVM2FiZGhqei9BQUtPT3FjazNScVhPejNzYlN3cGZ1eUpyY05ONzZW?=
 =?utf-8?B?VU1hZ0tQaFRJaUJ0M25pOExlbXlza05FcUZaT2czamU5V1ZkV3RDTG55T21s?=
 =?utf-8?B?eGRaaDVOMmVFZzRRT3Z1ak1DQVJQMW9XK1JGZEhCYW5yYjlvdmdUT3daQjdH?=
 =?utf-8?B?TUh4M2Z3L1JSRFFzbUFaYzQ0b1M3RUxuamVpRmRPd0lCa01FcGhHL3lpcm8v?=
 =?utf-8?B?cm5vRTRraHFPWUZsN3hxdlphSjdzQUk1dkJ0dGQvSUhDR1lpQURVa1VNQ2Nh?=
 =?utf-8?B?VlRMUGh5YTF4dVMzeDZ0b24xVERpSCt0Z3Q2Vi9nYUNEcU5UclpIaUg3c3k5?=
 =?utf-8?B?ZFlSNUxWaU1URk5EUzhXMDdUd3JpMEw2ZGFtalZ3TkVkdFBrUGw0K2dCMTdx?=
 =?utf-8?B?MFZGY0VJZ3NHZE84djI5N1NBQzUzelpQVTd3WDFiOWtuQkNRNDdkZ1NTRXFG?=
 =?utf-8?B?VmhiK0RnMy9zbHV1RFN3alJHNzRvYnhNMG1RQWxnZk5NcmlKcktOUlhScVZB?=
 =?utf-8?B?Yk9BZmZkK3o0eHVBUVBkM3E2RFdoY2czVjM1MlRSY0k0M1MvZDhLNk4wOXZ4?=
 =?utf-8?B?SHV2NUwvNDBnZkM5NlFYSXdlYnB3Zy9UT1ZRZlpvdURwV1psYThHUUV2N2pI?=
 =?utf-8?B?emwyRjRlRGFFZDlnamdhSFFxclhNeS9qdHRaTlhNZFcrSE5jM0ljRlNLUitY?=
 =?utf-8?B?a2FKaXpPaml6NnprUW1Va2w3a05xaGU0WGRpNEZMRmk1VzlNQXAvQ0N4ZHNS?=
 =?utf-8?B?NTJMK094ay9qVVEwYTZydVY3VmVMYXpMc2xYZTJjUEQ0UWRESnRIaUtldFdG?=
 =?utf-8?B?UFVQTS9XUjJ5K1pFalpYQVNSdDd5RnFkZnF0K0VscEVUUXEzNXMwc3lsS3gz?=
 =?utf-8?B?ZnZGU29mTkhYU1prZ2UwN0k4VXhxWFV4cWtkVWFUaHVJeG81N1BSRlFvaE5q?=
 =?utf-8?B?SzljT0V6cm4zVk9LN1laSVZ3SFNUbUlGcmpPb2E3V2NQTFhiTzBGY29JNGNH?=
 =?utf-8?B?eERRMnlZZW9hWEVLV1FBZUZMM0ZxOFQ1aEdzSW5UbUdHcHlQQzAwM1lEaGhD?=
 =?utf-8?B?Wjd5b2dmWFBCZldZd0lDZGpNUVp1RHlPdGxuNXo5N29veUFELytCbVp6OGFR?=
 =?utf-8?B?ekV6ajgyTktNMVFSSzUvd3U4aC82UFArb2hILzNmMUh6REkxVlYyOVlzVlVu?=
 =?utf-8?B?R3ZwN1dvSGcvbmlwOTBCZVNKTHNUWGdTVW1IV3liaXd1UnlVR1Z0UHFDaEtR?=
 =?utf-8?B?bHJiZ0ZrNzd0MzNlQjA1ZDVYbWRxN3JDVGloVUdzdnMxRUhVeld3MHh6ZGFK?=
 =?utf-8?B?NEk4Vk9FanhPN3d5bFEvejd6RVNkdVlTZ3hvQm5rUlRIOXNDeDNKYWNVR2l6?=
 =?utf-8?B?alBqeG56WFJDWi8rTGh3dE1HbmxCY3NPZnJ5VXFsdHUxdE9VVTRQYW1mK2Vs?=
 =?utf-8?B?cEFuL2t3dWE0NEswM1ZYa3p3WklYYlBGaFRjKzE4TXFZalBwUnAwaWo0Z0dD?=
 =?utf-8?B?d3Nyc1JUQVRyTk5LaXJOL3lBVWphd25rS01WUUY2RlQvVGNiZ2xOTko3dmtn?=
 =?utf-8?B?Y2ZaZERRbC8vUVFwQ09DRDlnYUFDMXMzd2JhbUNLZzV0WkNQaGt0bVRwN3la?=
 =?utf-8?B?SEZQcnVjWWQxY3IrOURBMGV3OG9MMXlGQW83TnF2V2pBOTZZcUZSd3grUWZJ?=
 =?utf-8?B?cjRIbHIwUFp2UjZZZkkzQ0d3Qmwwd1lQanY0UEE0SEMrMWtpaEoxaUxMY1dm?=
 =?utf-8?B?NUpOcUtDSC9xeGU1THNmWmFuQkRwVi9Kay9rRVR5TE85blRsWXpoZ0JxNzJk?=
 =?utf-8?B?UDlESFJWTjNVQ0lRRmVzdzNaYXQ1T0NIdmczSTVSdVlKUnZVRVdpemFYVHk0?=
 =?utf-8?B?eHFGK2lBZEFJRjB3dnhUdng2V0pxOEt5UVluRmdWNmMvVVhFRktMUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac4faed-fa5c-4bee-d281-08de64e5a6e8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 18:37:44.6012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzkG0OEvmw25skSQnXI6h61wRt3H0aJq80iJi3LY3/8oiVipTzWrUWryhtefj/z7w+k4rC6oFTCd4FdtYwiPTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7499
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ADE32F6796
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 06:31:04PM +0000, Andrew Cooper wrote:
> On 05/02/2026 8:03 am, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> > index 01499582d2d6..e3273b49269d 100644
> > --- a/xen/arch/x86/pv/domain.c
> > +++ b/xen/arch/x86/pv/domain.c
> > @@ -247,6 +247,34 @@ int switch_compat(struct domain *d)
> >      d->arch.has_32bit_shinfo = 1;
> >      d->arch.pv.is_32bit = true;
> >  
> > +    /*
> > +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
> > +     * field within the guest's start_info structure.  We might need to free
> > +     * the current page and allocate a new one that fulfills this requirement.
> > +     */
> > +    if ( virt_to_maddr(d->shared_info) >> 32 )
> > +    {
> > +        shared_info_t *prev = d->shared_info;
> > +
> > +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
> > +        if ( !d->shared_info )
> > +        {
> > +            d->shared_info = prev;
> > +            rc = -ENOMEM;
> > +            goto undo_and_fail;
> > +        }
> > +        put_page(virt_to_page(prev));
> > +        clear_page(d->shared_info);
> > +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> > +        /*
> > +         * Ensure all pointers to the old shared_info page are replaced.  vCPUs
> > +         * below XEN_LEGACY_MAX_VCPUS will stash a pointer to
> > +         * shared_info->vcpu_info[id].
> > +         */
> > +        for_each_vcpu ( d, v )
> > +            vcpu_info_reset(v);
> 
> Sorry, I missed something.  Reading this in full, there's an obvious
> (risk of) UAF.
> 
> put_page(virt_to_page(prev)) needs to be no earlier than here, or we've
> freed a page that we still have pointers pointing at.
> 
> In practice, I expect that the global domctl lock protects us from
> anything actually going wrong.
> 
> Nevertheless, for the sake of reordering the actions in this block, lets
> just fix it.

Yeah, I've already made that change.  At this point in the domain life
cycle and with d->tot_pages == 0 and the domctl lock held, the vcpu
info area shouldn't be updated in parallel to the bitnewss being
changed, but better make this in the right order.

Thanks for spotting, Roger.

