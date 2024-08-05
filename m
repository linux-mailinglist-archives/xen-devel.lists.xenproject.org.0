Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DE947A21
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 13:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772025.1182465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savRi-0003SZ-MC; Mon, 05 Aug 2024 11:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772025.1182465; Mon, 05 Aug 2024 11:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savRi-0003PN-J0; Mon, 05 Aug 2024 11:00:10 +0000
Received: by outflank-mailman (input) for mailman id 772025;
 Mon, 05 Aug 2024 11:00:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTh2=PE=epam.com=prvs=4947b23bd1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1savRh-0003PC-TP
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 11:00:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dffcca44-5319-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 13:00:07 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4757Z2TE005410;
 Mon, 5 Aug 2024 10:59:53 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 40scfpcb0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 10:59:52 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB9PR03MB8351.eurprd03.prod.outlook.com (2603:10a6:10:392::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Mon, 5 Aug
 2024 10:59:48 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 10:59:48 +0000
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
X-Inumbo-ID: dffcca44-5319-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSbvP6Jj+xhRTeoilSLFdW8d8zXPJrXRQ1BNvo9LqbF2LK5+pr6rPUTsz98OKfWlc5OQ9uthCxAFOPh+1W1TItQ1bwxJ9ttjFWmwJL0EXKkZDtA3Gs9yjX/KsF+A5R8JYAHre4BTzKC/crk3Vey5HrJA3mGy1Oase2qsZ3ZVsvISFdJzBadrH+F9OnwPd9x+7O8dC3JZXqDbJq9c1oi0EtLqjeJD2h1ZcarRejQJp9a/CL4GeFLUVLFjSebKH1f5DUolVFqr6l4q5A5lRRQHiOWhEZUz9rQHZ4+48rc36MsyVa1OccpNz179hLum9eVlQgswVb1cfC+g3cLvKB5yhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs7a3c0/s4ohRRs/H44R8yUhVxmz3B4BO3u+mNif0g0=;
 b=WGxZZe+hwiBE+8QqeAtm8W+KGk1DlmPqS7+fhGT2TrxqX92EKwOAz2OnZ5dS3AUMAJ5jMCv89y7v/043Xb63LMn1pP1XcoerZoabdD3JIPaxkNiFmt11DWRFTwnsKAz9R7gYigi6xC6wlWzKcVNCUKmGkz2bu5/8uL75WcTIQdmm5gqFRb51cOpVRcFaWtI5yeguRuj5SJppRTnMMtuLo/WpA6qxrVSyskpoDa3g4se+RAbAGz0uoIraRCPqF2n52BEVhN/c2nPKnoyDMfxqOo+klQN1bJOhqV0CiLoDFyrr0PZPR/Wz8/KZl/HPhGf+3nXWc7Nv34F/gKBXb+v1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs7a3c0/s4ohRRs/H44R8yUhVxmz3B4BO3u+mNif0g0=;
 b=MRSBIbdRf+Ut+R6Hurpjs6+1/kGswpSNu4wpMUGfsytdVd0Tae4Q7EQxsY8c8CKr4hwEVLp5rQdfICqJs5+ajVbwVvGvuv03PHzeT2cqiqTTwLDhcN1ECcI2W4CF7s/eo61g+cLctpIc2mWz92QnNwXu2gkAq9x5tgPWAEpEXqmdOJYt7H2lxlXLg0B7KCpEtCksyLA1ECY3trgljpur/bWm6ygtM6TaAozwI25hxt+utZbE9Ygn2RtTYdoqEZ67RrEv9OrbGbapkAkfavLML9rkkuc/E12fDI6AoX7AwrfiMioJW8sx98fbitiA1akmtq6zR/yxO8V3jDKBD85mHw==
Message-ID: <479bc6f4-1b7f-4a62-a155-52268ef6824e@epam.com>
Date: Mon, 5 Aug 2024 13:59:44 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 11/13] ioreq: do not build
 arch_vcpu_ioreq_completion() for non-VMX configurations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <67f143c15bece937d7b5c0739b14cc53b0c8c13d.1722333634.git.Sergiy_Kibrik@epam.com>
 <19f3a14c-33ab-4381-8b6c-707db41b48fb@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <19f3a14c-33ab-4381-8b6c-707db41b48fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB9PR03MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 77231f58-c936-4536-29e6-08dcb53db940
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWtmUDdZQ2dBZzdmK1diakpabjVwblErUVQ4bDFlMXUybXNveFZLd052STV0?=
 =?utf-8?B?a2RRcnFaZjlDU2NoS1RtN2lmbnpCZVVqWXdFRTAybHg3dFNwczdFcVRpNXBz?=
 =?utf-8?B?ZWJlN0tpUUpSYmVhZSt5cENTVitOOXd0QlRmS3AxU1doVWhSTjFpaDJLckEx?=
 =?utf-8?B?TE5ESlBLQk96NmhnODdTSkdxSlhnL2xvTWNRTENHL1VRY1pPdzJQL3RqTXZY?=
 =?utf-8?B?UXVJL1lnTzl3VEVGN2RZZm4rR252djFWSVpvVmtRcGdtQ2QwNytmZVF4Zjdp?=
 =?utf-8?B?THEyYkkxZkwwQjlXSGJESWJPOXNETjdFdUM0TVdreURKYVFXQVgyYUo1dUVX?=
 =?utf-8?B?K2c1QlNzVHA4dEhXOXEzNWhHRm12cHNaQmwxR0IzemhkakpPS0FubkZQVFhv?=
 =?utf-8?B?ZkNrQ1lUYWtCZk83VmxQbFE3S2dPWGV2MEc1d2QyMklMTHdWVlJJaVIvM1Jt?=
 =?utf-8?B?NkE2WTVRejgwZXFldThTenlwN3czYm1LdElwREpBSDFRZG5JMmFZNmJuaVdR?=
 =?utf-8?B?T21MbHZPL0NrdUFodlhFQXlCMklRNzd0L0pVbU1NSUJWVzZJb1VPcGVIeWd5?=
 =?utf-8?B?TEwzZUJFR2lNcjEvNTE4MkRmRlI3NnUzWHQ5UUNXYXM5L1c2NHIxNUZ4eGpJ?=
 =?utf-8?B?U21YcGdRQUJkS1g5TUp6TjRDR3VuMnBzM3JXTXVrazVQdVVqQXFRUVh0UUlp?=
 =?utf-8?B?WTFTdUhpMFZ3bFMrNm5CRnRseWtZWHl2TFl5amxnNERNeXhnTU5tSHpWT1BM?=
 =?utf-8?B?eGpoVjdHREVHck9FZGcvaEJwQSsrOVp3TWh5TkxiOUlxMjZpSlMya0pSZDhk?=
 =?utf-8?B?dENDVVBWYVUrTE15SytJSXVyK0QvTldZY2xTVFRGSndwTDdhRFJMbWg1b3Bz?=
 =?utf-8?B?R1VMeEN0a0tPaThqanNMMGFJbW0wcEJVNGNwaGJtaWt3dVFWMHdqRWxnRlR4?=
 =?utf-8?B?Uk5TbmljM3QrdnZHS1I4MDUvVDJiblRENWczR3VjTG1taHBGS0pkVS9WeUMz?=
 =?utf-8?B?V0RKNzV2M3h2NldxZmcvcTNORTYzdWRxTGF5enhJNXZwWVhXU0ZjdTVFT1lM?=
 =?utf-8?B?OERpdHlRNkxzUzhMYVJKQlh5c3FqVVBGK1MrV2VHUTI3ZEpKRDJkUWJzWWhR?=
 =?utf-8?B?cEZHMXZ5ODVnNXA0OWd1YzVYbnhweWdpSVU0aG01azMwOUcyenFwemJ4TTNp?=
 =?utf-8?B?NFVkckhmT3d0dW54Vkl0cjBKVi9aUUdSc1kzMG9CZjF3MkZudkt0N2pZb1o2?=
 =?utf-8?B?OWJYQi90Ri9UQmdCbnd0czE2K1FINEQ4N0IzRnd2b3RLb0lqWmdmMERNbHlT?=
 =?utf-8?B?bnBuK0VSQkVYRS9GUWVTSzJwQTROcHNqdEZLaFRBa3R6M1A1U3RQeGFCMEZM?=
 =?utf-8?B?TXpjT243UUhiT3BLdHc1RWtueFFNTUtTTnUzUEJrbDg1WXNrZE53TnhVd0hj?=
 =?utf-8?B?WTJnQWFZVUVVeVZBRDRQSDBCdWEwdnhaNG95WEtXbHAxSTkzcTNpcHVrb25l?=
 =?utf-8?B?UWFNOFRVYXFzb283Q1JNQ0IyUzFYSzNGODRwYWxORS92WVNCL0R2emlCVkhu?=
 =?utf-8?B?K0JmZkwzZ3I1dy9DZllvOU5RL0hqSThoY0EwZXYzRkN3ZHQvZEY2WHZmMGlv?=
 =?utf-8?B?Mk5KcFNhbzNYemhuaVNaQnBONmU1RS81MkVCZndMRmcvRk5hYTlGQnV5aUU2?=
 =?utf-8?B?Qk5JMU02MzhobUJ5aEI4ZnFMdDdwc3JvMWEveWN4ZW9FWkJQTFlkdWdEMXJS?=
 =?utf-8?B?RFpsMXViT1Q1MUJmTmZvYXhUTWJkeUlXWXFCNXkxMDNNUUh4cGZqUXMxWTg1?=
 =?utf-8?B?Um5aOG5YTUVSRFdvL081UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDJZYmg1UElNR3pmemlTQ05XS0g0Lzk4T21MOVozb0FzNldDdkFBUnA3anF1?=
 =?utf-8?B?Y3BKOWM0OUhNejA0aE5MYXF5VzZ1YWphZXBVMVVORDhFNzh2TC8zRHpxeWwy?=
 =?utf-8?B?NkQ5SEtQR09NdkFWZmI5ejlHQk5INXdQaEhDM2hRRlBPUVA2cXB6WitXNzR6?=
 =?utf-8?B?UU9mb0NIWHpnbXcrZUF5YkIwMmNFbUt1UTRkcjIzUkFkdzlXUTh5eW44VDhs?=
 =?utf-8?B?d0h1U0xJbWFURWFLZllYalZUY3p3bGE0NHYwNTljWkY4ODJTKzFueTVWM0to?=
 =?utf-8?B?N3BzRTRhQXNNd1NxVml5Y1lVeUVXbjlEOWJXbXpMYVIxQ1ZvdHdoWnhzQzk4?=
 =?utf-8?B?bFlWeHpHSmRGaTRLU1diUGZkMTVHNzZwZVZhcHZvbG0vL2lMUjhjcnZpdndO?=
 =?utf-8?B?Rk5zbmJzT3BqQm5vNFdKVXFyTTlQZHg3bVBYend5Q0xFdi9JcmdtaVY4VnVR?=
 =?utf-8?B?WWJaa2FvS05zUHRUcHJScGNaS1MrRFhYQWx5K1FmcXEzc1M0TlcrQXZERnJn?=
 =?utf-8?B?UCt1VmJIWUcxdWUrbnBra05kUUdyVzY2YnNEcjd5NVh6ZW8zUldnVmdockNp?=
 =?utf-8?B?aWk3KzdtcXdHVTBYQ0FUTVhXYUxEN0JsRkpFZEdyekxhZ3Y0QUhKL2VoRm9l?=
 =?utf-8?B?a1ArcWtQSUJLLzREVDBlbjM3eVZlWjhaclpKYk1Ga204YnhIR1VOSTkwek1V?=
 =?utf-8?B?QVFZem0rWWxHZlVJUVFEcGtJTGRqQ3EycXNDWU5VbjdpSC8ycUFXOEMrMjYr?=
 =?utf-8?B?QjJYR2RqbFdtaVRDWWVuQXJsSXRMbm5NSVd3Yk0yODhiTWlTbW12Q2xPYjFv?=
 =?utf-8?B?V21Ca1I4aTZiNW5SOXhEMXNlYmNOQW9uYTBUdkNWLzMwU2VGQy9vNHJWNURY?=
 =?utf-8?B?N2N3MWJvc2RranBUdzkvQXBXN2tuQi84aE9yNGxsQ1FrYWIweG51U0t4ZktN?=
 =?utf-8?B?M1BVenVlODBEY2wvb2xSc21weENQMUlMQ3YyK3lYNlhwOHQ5V2hIOWh2djVM?=
 =?utf-8?B?eVZDQitHVTFrYmt5WlF6ekIzWU13a3MwOFRwU0RRMG5pZ2ZsR2JaK2ZoME85?=
 =?utf-8?B?UFBCOFFwYzBVdVBLcUx6NXBXTlFYS2ZOZHkxZXlWaEUweE00WmNWTitYU3RP?=
 =?utf-8?B?a29pdkNIN1lMaFJoeWg4UFEwbVVHOW54ZXVQSjh3VS9obE9Jblh5TzRUaUFO?=
 =?utf-8?B?c3NMRGhWTDZkUzM3a3JOc1JiU3NEa3FTWkZTS1BYRUVJOFhrKzdzbkpSVWdm?=
 =?utf-8?B?UDkxWkFaSUt3YWxLMkZVWC9Lbzl0a2piRyt1NXJLdXFFdEF2TG5IWnBzT1p3?=
 =?utf-8?B?RHNQeExlZFpNZEhVNURQb1g5SWQrclp1VXVrRkZQUC9BN3k2dWVmRVVOdEJL?=
 =?utf-8?B?a05PKzdkdWQ5aS9pSTA5QjZuZEJPQWsxZWF3WTJkczhER0JFVEhMRmt5N013?=
 =?utf-8?B?QjkvTVlGaHJ1QnFpSjNSdFBzdUV3SCt5NzZkUVZGQ3RxTmtBUFVmZG16b3No?=
 =?utf-8?B?dFY1clRFY1ptL0N4Qk14aHNXUm9nV0ErWVJRbDRQamdlQSsxTCtSb3dUWjZh?=
 =?utf-8?B?VXhnMldwYkJ0Ui9DZCtreGRLL042YVZ2bXRjdUZGY0J5Sjhxc2V1ajUyUXcx?=
 =?utf-8?B?RVd2WmxHSjNCUHhyZCs1VU9mWWZidWN1cVBZVEhBYnVFbUNmUk9CRkROblYw?=
 =?utf-8?B?U0IwOGdrbHd6RGNKemhPazIwQ21EMXZIaW1NWGJrNEoxUXIzcjgvdnVubTJ4?=
 =?utf-8?B?a2crb2c3bngzNnVFRFYzTFFpQ1Z3SFNYZUUzM1k3RExHNVZvbkRhQk9aQmF1?=
 =?utf-8?B?SjBsM1VGUjdUSDFQQWRWaGFtNTNRZEd6OHU0Zy91K0tZbXRXaEcvWW5iazR4?=
 =?utf-8?B?KzkrUmV0S3o3YnFuNkU2YkFuN0lHWlJmVE5aMmZZZVc5aWtKY2dVRVNQWTFt?=
 =?utf-8?B?M25tUzFJMkRmYlFGUFhmOWhnSDgxNm9ITU9NQ1RHTzNUMnYzcTMyREpzL1JS?=
 =?utf-8?B?bTVmdDVkVGliNzF3bEZ4U25hMFhod2JuYWtQak8xYlBXSDNZS3I4c2tlTnZ0?=
 =?utf-8?B?cXBrcnZCdmtKRzJoMW9CcFBCd01XZUxPVTdPcng2YVVlU3QwK1F0dnZ4TWlD?=
 =?utf-8?Q?G14aF0MatM6LIj5fJX8RNlTuk?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77231f58-c936-4536-29e6-08dcb53db940
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 10:59:48.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUFRa98QEbL0mVOBikBn0KDdbB/iOFmc3D4XZcWe7aN/SlxWK8ARyxNnEPo6Ws2Hj6crijwDz6+B2nspw/C5VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8351
X-Proofpoint-GUID: 9wwGDx1pmikFu0U_r8slUbEX0Q0THZXs
X-Proofpoint-ORIG-GUID: 9wwGDx1pmikFu0U_r8slUbEX0Q0THZXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=987
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050078

31.07.24 15:39, Jan Beulich:
[..]
>> ---
>> changes in v5:
>>   - introduce ARCH_IOREQ_COMPLETION option & put arch_vcpu_ioreq_completion() under it
>>   - description changed
> 
> I'm worried by this naming inconsistency: We also have arch_ioreq_complete_mmio(),
> and who know what else we'll gain. I think the Kconfig identifier wants to equally
> include VCPU.
> 

sure, I'll make it ARCH_VCPU_IOREQ_COMPLETION

[..]
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -111,7 +111,17 @@ void ioreq_domain_init(struct domain *d);
>>   int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>>   
>>   bool arch_ioreq_complete_mmio(void);
>> +
>> +#ifdef CONFIG_ARCH_IOREQ_COMPLETION
>>   bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>> +#else
>> +static inline bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return true;
>> +}
> 
> I understand this is how the Arm stub had it, but is "true" really appropriate
> here? Looking at the sole vcpu_ioreq_handle_completion() call site in x86 code,
> I'm inclined to say "false" would be better: We shouldn't resume a vCPU when
> such an (internal) error has been encountered.
> 

not just Arm stub, both x86 & Arm variants of 
arch_vcpu_ioreq_completion() return true unconditionally, so there must 
be a reason for this.

   -Sergiy

