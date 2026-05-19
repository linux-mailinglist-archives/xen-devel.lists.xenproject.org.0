Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEeEKuTzDGqPqQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 01:36:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A358610B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 01:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313448.1583578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPTyE-0007q5-4s; Tue, 19 May 2026 23:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313448.1583578; Tue, 19 May 2026 23:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPTyE-0007oP-0s; Tue, 19 May 2026 23:35:30 +0000
Received: by outflank-mailman (input) for mailman id 1313448;
 Tue, 19 May 2026 23:35:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dongli.zhang@oracle.com>) id 1wPTyC-0007oH-3K
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 23:35:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPTyB-001z9q-Fa
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 01:35:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0cf38d-5cb7-0a2a0a5109dd-0a2a450391ec-38
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 01:35:26 +0200
Received: from [205.220.177.32] (helo=mx0b-00069f02.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dongli.zhang@oracle.com>)
 id 6a0cf3bd-672d-0a2a45030019-cddcb1205c02-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 01:35:26 +0200
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64JNPQwi3362833; Tue, 19 May 2026 23:34:58 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e6h1swwhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 23:34:58 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 64JNTqI7029364; Tue, 19 May 2026 23:34:57 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4e84ecx4d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2026 23:34:57 +0000 (GMT)
Received: from BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23)
 by MW5PR10MB5714.namprd10.prod.outlook.com (2603:10b6:303:19b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 23:34:52 +0000
Received: from BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83]) by BN0PR10MB5109.namprd10.prod.outlook.com
 ([fe80::d9fa:7ad2:804b:bb83%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 23:34:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-oracle-onmicrosoft-com header.d=oracle.onmicrosoft.com header.i="@oracle.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pHI1IYp6ddLBZA3tX/Wz5bpMoCHlqHpiPcKyYqfwPTs=; b=
	n0zWZcKd0M7EUYIy/IFjbuyhpn419OGMexQb4LmeIjfB7mPsrZQBKdTYz5EI9Cqh
	GWHg6bNHcxG4xTgGuBxu6gTpGIzhZsQQpYi12SarQb2stPW8gZ87WeWgszaTMUU7
	M/zmSfxwnBBIHwQqQigz7bMf5YBsRjri3jdxPGeiNU47wwZ5WiRBEblO5C/WkYxL
	tLnvcyHN3E5NIZyPULXoTXAwzR3kiIiFvRlbsAzZyCg9efH9VKrAxsPoksWdTJFw
	c+SQiBVGsJHPR01IhMKFKwYPre7KOxbrmJYkj8cvf4MaQxxMjEFjK1CdzYiRxJx5
	ENfCh5L41U9B4LSArSR2aw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX3oQ+8DXRsbadh3mwZZK89ace4b6jueMDsR/wC1mRAu04zPnFGnwH6UgQfj1a8BPDE+/10NPnybnwSRD7XvcaYfwU6fQM5KnM54IeGFDPuB9gOIHDC/NIRMdF3heGm0xR1T4BEvDRbPZZLqtVRAA4uBnVvwGmB68mGoJpW2dB4X+yfCIh8UveV40XC0xuVGDYQm90r446e5Sr0n66ToSyohKn2Hr9epfX5bmm471/HTn+Wd9NLSGj8/nfwtOoHM15LK1dGvw1+0FMb3iopactiomRFEjQvFgKK/YjTENuy+/YiP8zCzGATTeRc0fewj71fGn2rwNRyMbbS0Cc9bwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHI1IYp6ddLBZA3tX/Wz5bpMoCHlqHpiPcKyYqfwPTs=;
 b=FpdPHvkPZS7E4jJd0giF5N6+1XPZj9E2XVql+gvq9TgwI0ZFc+GK3PdSqQJTMip9TfiXbHW4kowjxia1gWJNgHQsDMzwvAQ4rAeaRG37DNYtppULx8LvRWWd6w937R2eOEPC0ArtuUCg29/jWs9iTPayxwYnsHcu4rfYvnMJZkNagsz3iFbpLZw/Ggq15WeIOMvr1SZJRjkqn4YoeeQcp6ZQ3nBmR7tWbyz1pDXkq/dwp08Q0+qEeuB+CpmNYolTxGoBaPq1yJQqRkxtbrdx7dNXd1AfnHVoJf0IPtu2vStQAu/l4TRXfTbgSGR5do8Bw+AOsKQN5UPYo8K99jxbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHI1IYp6ddLBZA3tX/Wz5bpMoCHlqHpiPcKyYqfwPTs=;
 b=nijXpo0KhCXcy9RGIOCDX3EaWq4ixZNshhCm0Aoc7tMHAUDyjJWq695+v73K3Ba+OLRFyYr4mj7L9ZkksAYvgc36ywwXeBbNEn9BDRAlpetDRc5FFF0xSSGrF5P/cd6ZfKP3vwxigPkIIyqQ/ZaxXV+SBDs9JXeqUjcprjopJ0w=
Message-ID: <08a64760-a431-4d0a-9480-562f8f38c908@oracle.com>
Date: Tue, 19 May 2026 16:34:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/30] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>, x86@kernel.org,
        Marc Zyngier <maz@kernel.org>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Paul Durrant <paul@xen.org>, Jonathan Cameron <jic23@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        Jack Allister <jalliste@amazon.com>, Joey Gouly <joey.gouly@arm.com>,
        joe.jin@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-kselftest@vger.kernel.org
References: <20260509224824.3264567-1-dwmw2@infradead.org>
 <20260509224824.3264567-5-dwmw2@infradead.org>
 <0ae8e471-db7a-4842-aca4-8ef643acde8b@oracle.com>
 <d3c461415e05345a9b82e6f995828c1ae64a4e61.camel@infradead.org>
 <935312be-9a86-49fd-8bb4-2c998a68e2df@oracle.com>
 <b9980333f3a310bf05e170e79c40cb2f46485caf.camel@infradead.org>
 <aa68ed10-15da-4368-a986-6864843a3c44@oracle.com>
 <32ca0a8da4bfb1e92013a7f75e0ff7541ebcd6a6.camel@infradead.org>
Content-Language: en-US
From: Dongli Zhang <dongli.zhang@oracle.com>
In-Reply-To: <32ca0a8da4bfb1e92013a7f75e0ff7541ebcd6a6.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0312.namprd03.prod.outlook.com
 (2603:10b6:610:118::21) To BN0PR10MB5109.namprd10.prod.outlook.com
 (2603:10b6:408:124::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5109:EE_|MW5PR10MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b93a29f-1af6-4b16-c75f-08deb5ff3972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|5023799004|13003099007|22082099003|56012099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Erv8FgNpAGPqcjHm9og7Fgvkn1msKmwUc1ZsAplt3goaaeGE3taL66TyRLiIApU+AV03Oek2QPAlJsuxldr2uK9/Sob0EyBN7x5TCrcQK3V1gup8Yw/pqIgb3h88dm0CA2o6z/9NtzE/dzGsXYnhf9DCqYLsJ0dn9sxDCJF0SUxz9/5YYBx2yo35rlqluvUcYG0zs39yg7/huvxuXllEOrHDODyZLBcTvMxrTA5vy2OzrjpxfnCz93Me9ZilPUS5k6ESYblxhHqF2AVRt46eDJyZwhWImLh9n9teW21d4WtQEP3cdlITUIbxGWp8Rj2/smHBY4K5TKCjEQzv0FnBJnvQqAQq+xkR3pbB2tFR/I88z3NxzLZqFjrkFY46UU6YVN0igdXZlU4hZ95xiJRpIBI8WPYMQuROktQv2AtIvfOt4SMqhofOd+1VRFISW+XZ+Yl3a16n8vTkOzB8Iq06hAFYBCFn9JKTlDDHTbfk92b0AVt6XNiHbEenRVsf/79xqzlJlSRw+H/6dZ0QV4nZeYQuvnot37ZS6DfZtL7jZsFRaGfHv2Dj2BjmPvLOza3SaM0iIV8BN9Ttk+OZtHHlcPypKoYCV1hsiQL5Ugac5FPHYj7hC1/J1Q8scjgY2eyTVx8ew5Oq7yBoePPutvxK49DAzlncmPhCpsNWVW1rgff/wZEJkwYRnxSrDrGe4aXCSvBnk+Kynv16pczx2sSuuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5109.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(5023799004)(13003099007)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1hCcnZnTEJzaUpNVmMzcmYyZURzb0svTnM2SUtzRkVPaWg2dU1NMFlPRnVT?=
 =?utf-8?B?ek1vQUxLbjFmK2Q3SXNackNlcTFBYlFhQnEwaTF6VTVzZDFiTGNNdUNUaFBu?=
 =?utf-8?B?OGFqZEJCS1pmWEtZRXFUSUQ3aThWYkdFQWJ1Wk9TNzRDR0hlRmVpTEVjTDRo?=
 =?utf-8?B?cDVMTlkwVy9KZ1licElTMGE1TjlrNHVQUmhRdFpyZThjTyt3aXlQa3RIZEFR?=
 =?utf-8?B?cGsxbVE4OE45TzhsRFZqY2xOZ210NUdSTGEvZGlsMll5d25MdnV0dEt6QnBv?=
 =?utf-8?B?K0N4MTV4SmNxa0VpTFd1Y3dyc29sRHdCa3NTRGtRZUI1WjlPMmdVeEFlQ3lL?=
 =?utf-8?B?Y1FhQ3hyZDNhSmI3ZlJiL3AvM0ZGaU1VeExWdTE1eW55aGtoVWlSa2tvd0k1?=
 =?utf-8?B?bDR2Rlhoa2dvRi95cjJJNnhzcDJ3UXYrT2xUcXVlNWRzcThmU2tvd3FiS0hP?=
 =?utf-8?B?a1VYMkxRT3R6ZElMcUIxY3VrbzdZL3o5aG5Zcm11cE9VdmxmMEZWR3RnMzY5?=
 =?utf-8?B?dkx5OURnWGNiY01HWVhwbVBjQlJSSnRLVUN2T0ZqenZwQ09HOWpUdkxrdUtJ?=
 =?utf-8?B?UXp3Q0N5OWNSVFMzaWdrZGUvTlBXeHRyNXNXWld2SFBVTmM1QVgyTFBTM3JL?=
 =?utf-8?B?MHp0d21NeEtxeGFwQ3lCRU1FZVpGWisrSlRFelJmQmRDOFFjS053OGE3MkJq?=
 =?utf-8?B?VFBzMGdwQnA5WnhianlwZE9lUlNLODBNa1BjTTlXWnQwazV0UGdOK3IzbWli?=
 =?utf-8?B?TXUvV1dKZC9XbWNlK1dyM1M3SlExUWlBVXJTdWVwL09ncG5sNkU2K09jM1R4?=
 =?utf-8?B?L3NnenBYYmw3SWllTVJlaWIvQjdGaTFmL1JpWjJ1cFVmNVNlVjRYNDBLcEEx?=
 =?utf-8?B?VkVZQUUwZk1YZytqTTNaNkoyWWxFUlVNeWlObTdxbVAxOS96THJ6eHJuYStJ?=
 =?utf-8?B?UzBFbjltanY2WlZCeVlraVJSdDVrSkJ3dUlRazlLUHJnMlJPVnZvcWxtMTFo?=
 =?utf-8?B?MVB0R0xYQWViL0Y2Nlkwak04TGZVdisxdFpwRkpyM01YTHlDSWVPcW04WVlJ?=
 =?utf-8?B?N3NMdlQ0SGg4UVhvYldOWU1Za0ZJUzViazY2N1hxMHd5dXB6WTlvYTQzSkd4?=
 =?utf-8?B?ZGl5bktnRjdUd3RnS1RESmNaUUFxbEFPMG1YMzdrcVAxb05ock9TdktwSGNk?=
 =?utf-8?B?ZjQzVWJDZkx0UlRSUHFjQ2tLdXlYcDJad1dMbW5rOEQzcXROZ2RCbnFqNjZr?=
 =?utf-8?B?bmxqTFdPbVhHU0lqODVpWHBzS3Q1RGp6UWt4VVc0WTNMaVM2dXEyRnRsSFB2?=
 =?utf-8?B?YW1yajNhQm1uYmFITXNFU3dGTUtrOWNGKy9XM28xY01aWFY4MTdCQk44TGJV?=
 =?utf-8?B?RDN0VDV3WE5ydVd2Mzl2RTNveWJoSGZmOGJtYXY3QjFaRndrUk56OHduUCtS?=
 =?utf-8?B?aDdXcmo1TmR2ZlliVUlUT282c0pMR2IrZDg1YndTK3VudDltdmJwM2hMQzZa?=
 =?utf-8?B?aVNoMkJpYlpGN2RwN3FPR0YwRTlibVc3R2R3eXlrbGRLRG02eHMwQWxpaUt5?=
 =?utf-8?B?Z2NDYi8xNjVtdnFlblk4ZkVUcWNVRXZqZmpaYzdHekRNWnhNVUhQdE9pS2JC?=
 =?utf-8?B?dWRDaVM0VlVwZ1ZuaklPcWhudUxMYnc3TGlwbU1wUTZSTnNJRjd3UEhZazZ0?=
 =?utf-8?B?dEU2YjNPdFhKclhoMVhMTTlWS1FaRHdBM2FMNGZNZUwrcDlleVF1b0FMdHhK?=
 =?utf-8?B?dkRGSnY2MTNMRVlPV2g4Wkg2WFBlTjdtN1JXTjMvSkxYc3M1c0QvSkZsV2xY?=
 =?utf-8?B?aTFlYUlSTU9RdnpORUJaVmMva0pKVXB0VmJnMy9UOHQ0OXJtNXhCUjU2c1hx?=
 =?utf-8?B?aDNZNjNndUVObWR6QTNXZm9HNEdRbGxWNlJjKzF5VmZKdkhHYVorWkFjL1NF?=
 =?utf-8?B?VWJwZmVxRkdURm5qTGVSdDd5cDN1MFhMTGk4VDlxQ0xyMi9VVlBQT1hHdk0x?=
 =?utf-8?B?TFRXL2swYzZFeVFKR2hYRURRMC90dFpaNnAxTzRTZzN1Y1VQSnh1OWVqVlF5?=
 =?utf-8?B?aldqL0w4OS9zYkRSZFUwRmRiMlp6dlFIY3REeHZiYTBPVWRLM2VvYXpOUWdu?=
 =?utf-8?B?QjExbHpxYlhaWktVb01NTkN6UENBYU40K0hwUTlxaTFsd1VHSUJqL2F2bUFC?=
 =?utf-8?B?cmRhKzBUS2FkWW16a2t0VVV0dGkrM2prckxxRFI5YXZKTzhOcE5CU0M1bmNE?=
 =?utf-8?B?OUE4TXBITlgvRWs5OUVuZkVSZThpY1EvQWZlOCthRjZyTmJjNXE2TFN4ejYv?=
 =?utf-8?B?eFFYS1lIQWdyOXlQb0hGcStwTC9laW1EaUd6QzUvTytNRXhwaGdNZz09?=
X-Exchange-RoutingPolicyChecked:
	Uor6c8jtF8h2aaBejnDYejM+7VWDzwjd+kEJ9jkOE2vsj6JzJBfa+TvF5G6OnMAZhrXdO+gR0fyysu79dGTQAjDuZ500pLwqkv07wqbBFXx7bOzC168USLRQ1fdKJdRS7dUa7bcdpScXkFKC+vIcASjp2PuqBmpgr97xw5VUla5l9mfIvgoLGaILkjNAm1goRHpFNq4k4GbqkqEGvgv5NnTLF8J700w4xm+jJA6V3eUUNO71fPQlypel+vOxw8KYnlC//N/5m1wD1tewvfU82k55EUkCf4ya/c64gLo7t5zWk2RNDpHIWYn4MyIEGi59bOZSE8KJxfyAaNyNsoPi4g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WQWdvuqxgCDEYBIDHPP8FI3VSQSnoSB60x6wb0pRpy1da5dTXq1COUrZd3T2XaGfJ14VtjuSwGdKV9vH+RsxjodnCBLS/+WVCs4tl0v1NUjK9xzAn7yq7fmagtm6F6KX8q2GeE9rB5lFeET8iaoyFobgqqJMVIcmxZCVH4zMKUvPx7LbDU2i7DNb0bfIPb/ANddNTn8LoS+khu+khu+Gw9Ar33iHhJxJnp3GyadbYR55QkH+5fNurcdmvT2A0FKceFax3dqJD6wvHRhd3DT4dFP2j5NtPNs+Ua3jBfI6p1zZB6yD794wf1RhYMpPOHvN8etg1+7cZC/ou0Qkw8KOFXbNp25KKacA2rzmy8PcVz7Nq2vA9UqDmM4XtNFvTODaQ249xm+dlkiQFpodeQwQ9gA+h+a9LhIl5YiXwNGZIyfNS/ft9CoWccWJxYLc8DeumWwGb2AVNTjOoguOi57nqaL9t1wL7EVGRB2RrpENgmHidhYYR059nBCrS9/uVgzpybCkqeO60TjwmcWrIvApF+p/RF0sfuGKspA3eoGz62ML9RpK3x+bCYvpKYWS8DYRZpSQR9RgOUpKyJ3801aAXrBs4s2Jie/10g9cWaCYPtA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b93a29f-1af6-4b16-c75f-08deb5ff3972
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5109.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 23:34:51.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mqZef0S6doLd1S9rVoSWnIRBGQ3BfyIO46ToKMMkCRs+VneLz/L9iNHbU5ckbNZqenzR7MC1PYica3/vk5I0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605190235
X-Proofpoint-ORIG-GUID: 1On2-jH6s1HTS5W4K0QeBUWrqYw4DWEN
X-Authority-Analysis: v=2.4 cv=aoKCzyZV c=1 sm=1 tr=0 ts=6a0cf3a2 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=UsYC2ujuzK4GPOI29i0A:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:13839
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIzNSBTYWx0ZWRfXzBIo1c2W/gqI
 nhqhVx1svmXEqRCiKtPLq+LnFMGeqVv6BPqyqgl3a9OM0REZD5w+OMylwPTlVEKWLpRc4nMFrNW
 5CqFIQiUBcyGwAob79X4ArKXB32gaerm15y0qyexH5QRqONmLNB9MYEXzehkujeBLMexLTl/dVk
 RY8Bu8n+RGjTRdnyRn7IfXooisnRbKO1N+F+zR0c9kzEVqtio2wm5fL5eXpmO3UdAjaoCNXhcXL
 24XCk5Y0FRsJFWyYG26mDUW6yfKKpb8cmOuVPh+dKJsOi4MQgOt0WGInlpQ6YvSBLUomAzvv/QT
 z5+dOyvBZ1HgQr1Zurxb505DePtWPyD/aNewe7mbVtNkRQnz15xtYMdrVui5ztOHUohMLI+ftuc
 LAjfGbyegdrDhU5OQoCdU/4EeDsHKchcLxa49w/VX2SN2f0Z7T2TlK+yQ8T6s3v2jNHoD+m5ix6
 lRdJssS23/O+mSOXrs1S01lS1bqzN6q8JXZhxJOU=
X-Proofpoint-GUID: 1On2-jH6s1HTS5W4K0QeBUWrqYw4DWEN
X-purgate-ID: tlsNG-33051d/1779233726-38D73938-809F779F/0/0
X-purgate-type: clean
X-purgate-size: 5246
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:dave.hansen@linux.intel.com,m:vkuznets@redhat.com,m:x86@kernel.org,m:maz@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:jalliste@amazon.com,m:joey.gouly@arm.com,m:joe.jin@oracle.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongli.zhang@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:dkim,oracle.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: E41A358610B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026-05-19 3:43 PM, David Woodhouse wrote:
> On Tue, 2026-05-19 at 14:23 -0700, Dongli Zhang wrote:
>> I think I now understand why I feel like I am always asking weird questions. I
>> have been thinking about how to account for downtime, so I see
>> KVM_SET_CLOCK_GUEST as a supplement to KVM_SET_CLOCK.
> 
> I do not believe in "downtime". There is no such thing.
> There is only "steal time".

Or "leap seconds" as used in the document?

https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org


> 
> If I recall correctly what we described in
> https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org/
> I don't think we actually needed KVM_SET_CLOCK at all, did we?

Here I partially copied the content from the link.

The 2nd step of destination VMM is to invoke KVM_SET_CLOCK ioctl.

---
 From the destination VMM process:

-4. Invoke the KVM_SET_CLOCK ioctl, providing the source nanoseconds from
-   kvmclock (guest_src) and CLOCK_REALTIME (host_src) in their respective
+4. Before creating the vCPUs, invoke the KVM_SET_TSC_KHZ ioctl on the VM, to
+   set the scaled frequency of the guest's TSC (freq).
+
+5. Invoke the KVM_SET_CLOCK ioctl, providing the source nanoseconds from
+   kvmclock (guest_src) and CLOCK_REALTIME (time_src) in their respective
    fields.  Ensure that the KVM_CLOCK_REALTIME flag is set in the provided
    structure.

-   KVM will advance the VM's kvmclock to account for elapsed time since
-   recording the clock values.  Note that this will cause problems in
+   KVM will restore the VM's kvmclock, accounting for elapsed time since
+   the clock values were recorded.  Note that this will cause problems in
    the guest (e.g., timeouts) unless CLOCK_REALTIME is synchronized
    between the source and destination, and a reasonably short time passes
-   between the source pausing the VMs and the destination executing
-   steps 4-7.
+   between the source pausing the VMs and the destination resuming them.
+   Due to the KVM_[SG]ET_CLOCK API using CLOCK_REALTIME instead of
+   CLOCK_TAI, leap seconds during the migration may also introduce errors.
--


>>>
>>> So your "MASTERCLOCK_UPDATE is pending and there is no pending
>>> CLOCK_UPDATE" doesn't make much sense to me. If MASTERCLOCK_UPDATE is
>>> pending, then there *will* be a CLOCK_UPDATE pending.
>>
>> Suppose the VM is stopped and the master clock is active.
> 
> I don't know what it means for a VM to be 'stopped'. Do you mean that
> all vCPUs happen to be experiencing steal time at the present moment?

Taking QEMU as an example, all vCPU threads remain asleep in host userspace
without having a chance to invoke KVM_RUN. As a result, none of the vCPUs can
enter KVM kernel mode to process any pending requests.

This is the state before QEMU resumes from live migration or live update.

(qemu) stop

(qemu) info status
VM status: paused


According to my understanding, older KVM versions even required the userspace
VMM to keep vCPUs in userspace to avoid racing with KVM_RUN.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kvm/x86.c?h=v5.15#n6090

	case KVM_SET_CLOCK: {
... ...
		/*
		 * TODO: userspace has to take care of races with VCPU_RUN, so
		 * kvm_gen_update_masterclock() can be cut down to locked
		 * pvclock_update_vm_gtod_copy().
		 */

> 
>> Suddenly, we change the host clocksource from TSC to HPET. pvclock_gtod_notify()
>> may call pvclock_gtod_update_fn() to set a pending KVM_REQ_MASTERCLOCK_UPDATE
>> for all vCPUs. Unless the pending KVM_REQ_MASTERCLOCK_UPDATE is processed by
>> kvm_update_masterclock(), kvm_end_pvclock_update() will not set a pending
>> KVM_REQ_CLOCK_UPDATE.
> 
> You say 'Unless'... do you mean 'Until'?

Until.

> 
>> Therefore, this is a scenario in which only KVM_REQ_MASTERCLOCK_UPDATE is pending.
>>
>> I do not think this scenario is important. I am just curious about the expected
>> way to implement similar code in the future :)
> 
> I think that's working correctly. Until the master clock has *actually*
> been updated, there's no point in setting CLOCK_UPDATE for each vCPU to
> disseminate the new information to its own pvclock?

Thank you very much for helping confirm this.


> 
>> For the live migration scenario, the current QEMU implementation not only fails
>> to account for downtime, but also has a drift issue. That is what I would like
>> to address in QEMU.
> 
> Again, restore the gTSC as accurately as possible. Probably by working
> out for *yourself* the relationships of the source and destination host
> TSCs to real time, and then reconstituting on the destination using TSC
> offset just as for live migration.
> 
> And then use KVM_SET_CLOCK_GUEST too.
> 
> That's what I attempted to document in
> https://lore.kernel.org/all/20240522001817.619072-8-dwmw2@infradead.org/
> and should probably revive.

I would really appreciate it if this document could be revived. I don't see it
in your most recent v4 PATCH 7. It is very helpful as a guideline for how
userspace VMMs should take advantage of these APIs.

Thank you very much!

Dongli Zhang


