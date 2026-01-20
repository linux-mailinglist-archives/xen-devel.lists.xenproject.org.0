Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPYgHzO0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D74825D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209021.1521147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCQW-0000Mt-9E; Tue, 20 Jan 2026 14:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209021.1521147; Tue, 20 Jan 2026 14:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCQW-0000KO-6P; Tue, 20 Jan 2026 14:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1209021;
 Tue, 20 Jan 2026 14:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viCQV-0000KI-7f
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:09:47 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab681d62-f609-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 15:09:45 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5632.namprd03.prod.outlook.com (2603:10b6:a03:28a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:09:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 14:09:41 +0000
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
X-Inumbo-ID: ab681d62-f609-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpzqQd4/wPiXgNxUGv91N/L+1g2Yn5cVD1gd/Ir6x7SGszO32/+HaWp5X+qVME8DD1fWYdJwzdzjzPdghV09mg8phmqUChb4XrQP9FB5X3Cn80yyCdjUescXtMLBy8qk9tCTzymZtHRN8yd4EY6c0KP6cdZyHNIgW1MSJBNeqyLBHmKk1p8wMG4QGRhLSyaSQda7y/ouYiN/UuNp675EN10c3Ty8ia3GRQEGvhI5HTtgF5xb6DurrhZ32zYGKmJvo9ln6KmZHMH0FTB8mrCK8w59OCrobHEpfQ5IfU0cnRzTEu/GcHFu1ahmnkx9xc1p+ZsW6u6wJUSG/jouMxBRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UruohLUsRKdrKxS02n9udW8OL+3E2mfwtuJ1S5dpTs=;
 b=Eq3CzoAhqEZG4zAVCYCHE2AeUL5VQtHLlm80lG18t1Bqkgy3bTqoUU1YlDpgL6jSqXMLUU7dLdNMNWyITXogg6W14XsHm88OpnQ2XM5dvkSir8+x78/8dbnGWpmwK06mfi+NyjmfK69hrDFOIzXyztOPz2gabX2lZ51NjRjI1U4CvWYNovOzdqd2s6ZD47ZGGlHWj1ZAvzN6o/pu9deCaLUc6k8ODACF4L3yZbFkmdkYHMWiOohr/bcDP6fzLC9lOGt0AsbEUvXn/H+H4KOldibt8NWs9YLr2VdhdVpjqAxo/+dLQk9QJcUiEz//GGuiVnM606OhgJQQC5yrYIvLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UruohLUsRKdrKxS02n9udW8OL+3E2mfwtuJ1S5dpTs=;
 b=BXTBPFN1fy5IAYId8pBVQMTnjlVbFsZ42pxA5PB1d7XjL7ZfQTwQWxcuQ37ip4qWGnwrSZWXFrARR05Y1LH6i5+n54Z4mDaWsL4Pak6OWNYxr4NtDRQB5m6hskn5VD+4x9q+PehLW5K53XHZWvmypEpUtIdDPP+HwdoHgPT73W4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bbc462d5-0db4-45a4-9217-893159cc2975@citrix.com>
Date: Tue, 20 Jan 2026 14:09:37 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 1/5] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260120093852.2380-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: b860b654-740b-482c-4b99-08de582d8df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkUvSDZQTjd1NGE1S3lhbnFUelZjTzFQd2pxZi95NE81dHRTbjNFcDZ6Vngy?=
 =?utf-8?B?SXJuVWFPaFNVNU9EaGFJV3YzUkhQdGZXOFFRaW1mS0JQWmFrTGdneXFkT0tx?=
 =?utf-8?B?K2RMdVpiL3pOeHZUZzhZWlB1Ukc5YUMrQkdkQzhrM1pFOU9PY2ZYOGpkNlNP?=
 =?utf-8?B?dVVFM3E4aGxEbFluVW5SSUJvZXJKRmFnSXBzb01KQkxiWXJub3hSMytSUUxo?=
 =?utf-8?B?V0NiV28xV3YrOGlrMDhoNzFSVGl6K0thS3RoTDIxTGt1aW9SZW5wb0J4QXMw?=
 =?utf-8?B?UjNlUnpoNW10aFI0SlBNVzFTYlozUkM3bktQdXFhdVZMSEVPc1pYc3MwL1ZQ?=
 =?utf-8?B?V2hKRDE2LzY2M1RGanlWNXY3eXlnc1F6MTBYb1hNSUtaNmE0MHl6RXBaTEZp?=
 =?utf-8?B?Zm8reTJLUWtCSEJnaVFsQThIWmloai9tbmhlQjFjbzM1d0ltZnVERkNuTHRQ?=
 =?utf-8?B?MFU1aWhvd2VzdnVnUGpCTTlFOVZSSWtHMTcvVSt1VHJFYnJaMFk0NUc4UWI1?=
 =?utf-8?B?Z2VCdy9DM0RzTlhsN0NjNmhVbGNTTWJKSTJobjBaejZmSUZSeEdiTENDUG03?=
 =?utf-8?B?NUtlcEMyaUhiV1ArZFMxcGhOeXFSSUJFeG1yU25lN0xhd3B0cWFaenJuL1pV?=
 =?utf-8?B?WGVXQXd6TDZhSUhVZXFaenNONGk0ZTB6QjY1M3hJbWY1VDJRZlM5VnhYNUd3?=
 =?utf-8?B?dlBudDNTZllPRTVsN0U2QUhmcFdJUWNnYzNScGluWHhLMWlhZEkrZmdDNzJE?=
 =?utf-8?B?NHkxNXp4NFplQm1TZEl1TXA2aTQ2YnlNU1lzNndrdmQvSDN3YmxMWW9TOEt5?=
 =?utf-8?B?dUV1UkhkeVpLbS92VFY4eXl1Rkd4eHFzUmdkb0N4NmczWXB6M1B2YWRyU0Z0?=
 =?utf-8?B?YjZGb3pkTWREL0lZSUdRZmpKY2k2ZW9UaTNTK1Vnbkp5NVF0R212K25DRURH?=
 =?utf-8?B?cVBVL25JaTR5TkRzd2hMNjVSczFHbFV1d0tkRzRtWUZRNU42WjM0MWNzYjNi?=
 =?utf-8?B?QzN0MktPQ1JVMkRpendIVTVsb09oVEpBSmZoN0VPTm01WmxwWExwZTR5NTFX?=
 =?utf-8?B?eXJOTzEvckdHRE9RS3RSWU1wVFAyZWp0dWZvUW95cTdPRkpKVDhsRXRNNXRv?=
 =?utf-8?B?bzdFOHFUajBIdFNTbndXUVdpOE1oSEl0TnMwN0VyMk5jZi9CU2M5QTFQM0RZ?=
 =?utf-8?B?OHh2ZHdDalg1OTlGd2V4eDF6T0dtd2wwV2wyNzZxaWdLRlNKdmlNSFNmRmVp?=
 =?utf-8?B?NEFwSnhMdEhoZytCbnlIeUc3N2lGQUh5QWQ5cjNHNSs5MWljTlRQcjM3MUFt?=
 =?utf-8?B?a204VlZzdmZHZzM1ckwrNEJzQTJVVnRGUUJXOS9hZlZvUHpRc2xyR2RTRGEz?=
 =?utf-8?B?ck5GZ1hvVC94ZW93eWQzU1puMjZLVktkQ2dOc0xZNW1tSUIyb0wvY2svc1Fn?=
 =?utf-8?B?a2dJblZneWlYODlNSWduVzFCaDhIOUVrdURzWU1PbGZKYlBGWHVkWHVJbWFp?=
 =?utf-8?B?NjJkaE9ORmdsT2xZWXlFeC9ISy9wem5Fd1ZPZXU3MWZYSW0yMjFaS3k3cXZn?=
 =?utf-8?B?aCthUHhxYlRNYTcvTk1SZ0pXZVJTbFZwNFR5WE9NMERKRWIvSm1sV2lIVGZN?=
 =?utf-8?B?ZXMwTy9nd3dLU1NxSHdodkhYN1c4eU1yTE9wemxEazVGT0prSFFKblRQOTBS?=
 =?utf-8?B?c3VzK25BOFZheFN0TnZTaHE0eTZBTzlmTGFhTjAxQWs5L0YxcHFkQktCNHRu?=
 =?utf-8?B?SFZzS1o5VlZFQStHbzllMjZKZys4S0hjamVna2tyOXNsazVqWkEveDJ0YW81?=
 =?utf-8?B?YjFiNmpvL3ZieVdvWlYyc0w3NjFKV2V2aFFmdFZPUjRsSEdwTWdLMnlpdVNT?=
 =?utf-8?B?Tnp6MzMvOWdDQmdiaUhIUWhVZzFwRm55M1ViZjY1eUU2Ymprc2ZKTlZWR3Qy?=
 =?utf-8?B?RFB3T2l2bG1lV3dWNUM0RUlHUVJiS0hGa29pZTh2NHpOS2RxQ0Z2a1U3RmNM?=
 =?utf-8?B?UmJQd0QwNkZ6U1k5Ui9HV1FGZ1FhK0hndCtwbkxnaFNkTG9VSmE5K1l5K2U5?=
 =?utf-8?B?Ym9aTEs5N3czQnhqZ2JPcTNWY05aL3hvQ1oyMXg3NDRyVmpmSlBxTnVMTENn?=
 =?utf-8?Q?GjdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGZWZ2JEWjl0QldlQWp3ZGRSNFJNV3NDUlJtSXJjQ016K21xamoyekI0Qkta?=
 =?utf-8?B?c2pQVjZRaVBNYVdjZzFOTFZOTjBvMTYrckc2TElUNVZSS3FLSHMzL3d6WmIz?=
 =?utf-8?B?K1g5TkdxeGNWaVVKQ2hMaTFFc2pVNDBZQkVFelE2d0tINmFyOXlrYWdZbFVO?=
 =?utf-8?B?MFRNKzlMRU0yNjYyNDJqNzFYazZrK2FQSnkvSFdlTElXT1ZPeG5xemsrbFBK?=
 =?utf-8?B?bkhjdGk2N0Ryb3ZxMjVhNVFSL0JpeVRENTd1UGVlZmVBdHNrZU1FUWFBOTNZ?=
 =?utf-8?B?MDlCOVlUNG1tMkpKSDE5ZXZJQUlwelIzUjZ3Wnc0c01YdDF1Z21Rc1dzcDNp?=
 =?utf-8?B?MXZYbmcxUFFiTHhqbXM3WWZ6Rk4yeVJJU1JyKzBzUEs5Rmc4aE8zSGlLR1Q5?=
 =?utf-8?B?VXgyR2tDVnNDaEtBWWo1M0lKVFdIUzdraVQ1bFJBUWJSNm5BL0YwTVZoWmJk?=
 =?utf-8?B?TDcvRDUvV1JhZXhzZVhxWVhpWG9mNGRSWlF3b2wrSXFBWERKVGV2YWQxeXdF?=
 =?utf-8?B?T1FUR1l5aWNHQjBHdUVmZFExdm5Sc29CNlNGK2JyNEVCUlVZckFvUEpBaFhG?=
 =?utf-8?B?bnVQWmtCUmwrYjhvMGlBUWllVFFhS3FsRlFlNjlaV0RTNnE5L3NvaE82dU1C?=
 =?utf-8?B?MFd5N2tLM0kxYVpGUnBBVVpkUlJNa3FyRGhOa2h6Y2FzNGtsMDkzUlVWRFRp?=
 =?utf-8?B?OElFSnpkUW1SamhTK1NFUjF5NWR2RmtwZHJmb1dnSWhPMmhtbHJSR3hyZ1VK?=
 =?utf-8?B?ajRoUmRkM2I4OWQ5ZCtJZGlvbnJKTGZsT0FQZHBjTFByemVoUVAzc0lTVEI4?=
 =?utf-8?B?UTU0djlCeXdSUXcwR1M4UEprT1A1M05SUUQrT2F4ckgybVlSOGExS2dCai8x?=
 =?utf-8?B?b2VHZUQ1RnNscEJSOEZOUnE4QXM2ek52NkEzZmJKNlFZQWRkTHBCZ3dNRVYx?=
 =?utf-8?B?ZjZBb2Y3Tk9XcUNzYlNOeFVPS0ZRVFNFcnZ2MDl4dmFOMlphOCtGT0h6bDRF?=
 =?utf-8?B?SUNMRWdxOStmcDhLOS9XV3lKSDVEMHh5d2E3eEI3OUppS0IyR2hzRTR1MmxV?=
 =?utf-8?B?bWt4N1htVitwb3RKRU82RXpiR0hXR0tweDVtaWY2alR3SU5HTHFOMTVBUW5p?=
 =?utf-8?B?cmJUcEhhdWNmZkRQYTgwOW10RVYrSXhLNEdqWCtQb1BVZDc5b25yRjEvRncr?=
 =?utf-8?B?cytsUnhlNTBMTk5XNW1FQjZ0WC85ZHR6MFBOTnlYb284Z2owMWRhQ0d2UDhM?=
 =?utf-8?B?ZVpOanBzbzcyMm1Dbi9VMWY5dTM2OFNrYWJxR01yVTlFNTIvVXZnSWVIWVdE?=
 =?utf-8?B?eHdXaTBOMGR2N0VRdHlUakduMWF5V1AwOEFyeXZVbUdGc2JEYy9McDVwUzV6?=
 =?utf-8?B?VlBxK3E1N2pnNWYzaDZxUCt4am9KMENKQ1ZNRFpNbUx0R3FGeWhHQmxnZ3k4?=
 =?utf-8?B?RU5mejhwcjlvWEl0Rjc3ZkJoY0Z0U0J3NkNUdVNoa29uR1lEZVFKd2c0c1J1?=
 =?utf-8?B?L1E3M1d1U2Q0Q0dqL1VXbXpLL0VjU0w0VmtQMStFOFJSWTNxWU9iY0x6RlN6?=
 =?utf-8?B?YXBzRzRvaVpXWXdZTCtCajdtUW9OWFBia3BNdXU4dlkyUHRyREdDdnhMbWJY?=
 =?utf-8?B?ckk4THZvYVlWQkI0VVdnNVhSeDJkZUR5bmlHS2gxcGVhdHI0aGdiQmY4Nnlu?=
 =?utf-8?B?dGIxa3NjTGRJMnNrQU5ScHFxbEszYXJYVU9VeXVzd2gvV3NGZW1UaUw0ZEFI?=
 =?utf-8?B?cldNSFZ4dEZkckNZY2QvTGdpemt4NnRwcUdPS3JGdVc5ODlJRFNra0NkTTc2?=
 =?utf-8?B?Y1ZlWVlNalcwRkRTOUdWVHhzRXZnV1FkbFFFcXlraHgzL3ZVZ0FRc0xET2dS?=
 =?utf-8?B?TVArQm1tV1BiRDU2TUdGbXNGcEN3NjRwWDc1YklDVTdGMGZJbFV2UHBzZDBi?=
 =?utf-8?B?S2g0TTNRL1RWbE1TRFcySzNLc0U3SUoxTnU3UGFIRkVFL3JEWDlEMmtvaHpM?=
 =?utf-8?B?OThnYzhuOTBRZmlranpsQWJUeTlFVFpLcEV2VnZLWC9rZzYvT3FuZ084OVNt?=
 =?utf-8?B?a0VKOHExK015aHhkNVA3M1dHcFhOZ0FwRmxiT0dUL2h5REcxejZsRm5WL1By?=
 =?utf-8?B?RGprK1VZKzJuUVByZTcvRFdPWndiOHI4NlJMVlB2UTNtQk1nUG9qeExOMXNY?=
 =?utf-8?B?cFhONGlWVCtwYzNySEYrUDZmWlJUU25XcFBOOUdVUnVXdk1vRzR0ZFVjcHZL?=
 =?utf-8?B?bjdIYzFJSkNUanpaVmIzdUsrQ0Y5aFBReDUzQ3FBbExaVEpRTlJFejlVVWJE?=
 =?utf-8?B?ak9BVG04MGdXbmMxeGJ3QUNNSlN2cWNuajhmblpRSjBxTXFiZHI2Y2VrdjhF?=
 =?utf-8?Q?xMhO95PjqZPtv60I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b860b654-740b-482c-4b99-08de582d8df6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:09:41.3154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEJV+cTbzCnEND9grcjlbfEbAl9ey3nLbYgjf+hh3h/pJSVAR7F+yuF14VXLvae44bPFi5Fn2d9zVKrEc088Q0efg1OOHtb+/+W87ceDO9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5632
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1A0D74825D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 9:38 am, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> index f8eca48170..2ac9fc2d96 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -317,8 +317,11 @@ ret_t do_platform_op(
>      {
>          XEN_GUEST_HANDLE(const_void) data;
>  
> -        guest_from_compat_handle(data, op->u.microcode.data);
> +        ret = -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
> +            break;
>  
> +        guest_from_compat_handle(data, op->u.microcode.data);
>          ret = ucode_update_hcall(data, op->u.microcode.length, 0);
>          break;
>      }
> @@ -327,8 +330,11 @@ ret_t do_platform_op(
>      {
>          XEN_GUEST_HANDLE(const_void) data;
>  
> -        guest_from_compat_handle(data, op->u.microcode2.data);
> +        ret = -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) )
> +            break;
>  
> +        guest_from_compat_handle(data, op->u.microcode2.data);
>          ret = ucode_update_hcall(data, op->u.microcode2.length,
>                                   op->u.microcode2.flags);
>          break;

Very minor.  This diff looks like this because you've dropped the blank
line between guest_from_compat_handle() and ucode_update_hcall().  That
can also be fixed up on commit.

~Andrew

