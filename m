Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG3+Kec+j2llOAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 16:10:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76041376E6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 16:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231181.1536454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vquo4-0003Ti-Oo; Fri, 13 Feb 2026 15:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231181.1536454; Fri, 13 Feb 2026 15:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vquo4-0003S4-Lz; Fri, 13 Feb 2026 15:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1231181;
 Fri, 13 Feb 2026 15:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vquo3-0003GY-WE
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 15:10:08 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10de676e-08ee-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 16:10:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 15:09:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 15:09:57 +0000
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
X-Inumbo-ID: 10de676e-08ee-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXqx2K0mm67dkkUsNiYDyTwflynGJPxw6IUl8Qb5iMUWcJtsoNcKlPk9d5B5ru+bWEW7YaB2eVLqD15Osv5L1Oen/9sjQhJes1/+CZNwkQuL3gGhLIHdSfreL3Qauj1dgUjZuLCbYlDUx4PG/0pHMJ41nRlKSRHBjpWEi7YeiFrocj+AwcKRBAjhaQLtd4M/s4U3kZC9jQX+ivEAbhkvLfE86CBl/9AtphbctQcGw0oOu0ct0QeyZCV7pMHIqKDpLTaxGMMb2naaZYJ/dbDNG6FZLfOkkXUhB1+DDEBcmS7ctJh6c9wW+LLRZGDxgb71QonhYdACKaD2iKZ25iQXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKH977B7CzSSp9TTA9fJYskNi8ipOeBhUZbgOJo514k=;
 b=GPwcRmXWtq0JVwBGgoDmHGdic3+qYlhgaMi9GNdqtMUNbwfRfoNUaz403W1oz37iD1/mlnlshAGTedIMwAZjHuPrSrTdo105B4chH4K8vDV/Cw8rj1W+Ds2A8bJK4hsALLsSN2Qp/6VSQVxaOeujLiwyeLVnOkyYUqZWjDhs27kpH5akkIHbtKxLC0SFTgJXKnhnFoxzPfvc0KS1KvsxqcfBmNjbsLMui158O1L2FHclKZ6ENAOSPuVhbjclWq5upTotDXXn89dppMNi7TQzV4XypWiSbH/+b9gf+SIVOfDCwP8ZJZy7HnzBS7717G9PatHY2C3a+eRRj+LkvlhMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKH977B7CzSSp9TTA9fJYskNi8ipOeBhUZbgOJo514k=;
 b=aKWrlPGzuA8OIqZVji7jO8kXtUTIgThfiUbyfUm3eNLuVFAKb1XOhOeJHi838eF9Pyu+FygKw4pbmDNB7PU21L6sx2KwS6NHKp3+bil2/z44FXaO4feMYfTOhKzWONiCD+H1fq/w1eWSs2yMuBUdzKNhjCrKm1QT3SVLJ0xtDWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 16:09:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86: Force HAP to be enabled when PV and shadow
 paging are compiled out
Message-ID: <aY8-wlXW6Y90vvOv@Mac.lan>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213133732.132326-3-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA4P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 9341f54a-e3e3-47a2-284b-08de6b11f349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkRkSzZwb3FSYU5yOFhtblpINytDV2hHNmtDT1d6bndFN2RvVVdiYyt1eEhK?=
 =?utf-8?B?c3VZS1VGSVdPYU5obDFwZTQ3UURNT0M3czNBWW5sbndGTi9KVDc4ZFpYdnVX?=
 =?utf-8?B?T3BCWWJHODRpWGJLVXk3ZFBJK2lLZVN5cFhhY0gyUmVpUTBDemdPYVNOL3U4?=
 =?utf-8?B?bzZ4ZEQ4ci9nZFJXc2dPNktXdzBjNUp5SWk5UENnLy9lK1VhOXN2NGp5TU40?=
 =?utf-8?B?WGFjcEpBb3ZOSTN6Znd3YlRONlFab3dpQzIwQU5nL2l2TkpHTUtmdVhKa0VF?=
 =?utf-8?B?TFRZK2x3aldKOW5uUjg1cXltb05SbzMvVjRsUmtCZkhKbi9yYW9rZ3NvRVVW?=
 =?utf-8?B?TXFJQkdxc3dMa1JIeDh5TWVaNjZKL2EwOHhpa2l4clgwUDZkQlZQQ0F4SERl?=
 =?utf-8?B?WVFLOWo4ek5zRlhoRHQ1dFZjcnBhNWNNdXYxWWNNQWplWVllcTYybHpLcFhW?=
 =?utf-8?B?aDZXSTZ3TmhzdzNUdWUvdmxsL01uS3FXTUJSejJQNWhtUm1RakFzcXg1OUdo?=
 =?utf-8?B?NzMvY3NGU3crcm9JNlZPMXlUcUFMc1dMUVJiMjVFMmlkUjhIRklRcFFtY2hl?=
 =?utf-8?B?dW1uV0IyQWV4TzdMMFhDVHZGWW04cGY5bXl5R1ZzVk1EeW8xL1JTOEhDNmUz?=
 =?utf-8?B?ZnFWZ1hqcGxWM1BQWDY3cU4ycGFBeWF4c1d5ZFp6akgwL1N5L0RhSk1EbFdB?=
 =?utf-8?B?dEFLSE4wYittUmd2dW9iMVpQbjh2NDJFWUdlb29Da2JOenNpbDJJRlJCRkIv?=
 =?utf-8?B?VFJ0bERsakc2RHpkc3ZTUXlCZi82Y3pMa1Q2aVppYklkWVBCRVBTY1RjQTht?=
 =?utf-8?B?dUdBMDlCSHFLUHJxbTVyVzk4cFB1UGN1M2FrS0l5REswS2NJOWZEdDVOV3Y3?=
 =?utf-8?B?M3FjVXY4OUFUcFN6Y29ZeUd0TDkvODVVZCtJajQxcEJEb0x4ZFhIS3RPdDRO?=
 =?utf-8?B?aVREb2JNY3NuRUxQZjZvdWhLVGR2emJ2ckE0WDkrclFib2hHNmJjR2VjeGhO?=
 =?utf-8?B?TzkzSWN1b3dQWnI1THhJWVhhZllRdHFRL0h0SjdQakJvWHR3K1FmVlprUnBs?=
 =?utf-8?B?aU9iZk00SnNaZktjdHBCcUJHWjlXSERyaXUvS2R5Tkp4SnN0dWY0clFDMU9x?=
 =?utf-8?B?T3lsOFIxeDcwWkZySGxORTg4YTV3bW16dVc1SWFkSEgwQVVvZlhPMU9NbGhq?=
 =?utf-8?B?YW1MeXpLdzRNaExQOFdUVS9OUjhiOGdjaU9HTU4xNlMxd3l5SlNqWVpOOVFP?=
 =?utf-8?B?QTFCNUpKRWFxdy9GSzJVS0wwR1ZnWEJiQTA1eUNXdTZCVjNDZ1BsOG9pK1VG?=
 =?utf-8?B?Uk00cElGWlJZcWIzN3VXbEdoVVllTC9Sd1lzUEd1Wm1IVVA4WHppMXFxazBr?=
 =?utf-8?B?QzduSXdwaitpeXlBd2ZoUVVZSGNRczlJODdGQnM5TVdSSHNHZGFlMi9wTWJH?=
 =?utf-8?B?eGM4SUlvWXRwcG96TjUxL0xydmZkUzJnVUViZzJyVG0vN2kzdmR2ZjlVRnpG?=
 =?utf-8?B?Y1NEVUpsemRpOVdXMndaRmxNNk1ya1pWY1ljaU14a0ZBaVh6Vnc4d1VVVEpp?=
 =?utf-8?B?Mkw2Yml2eWF6bjNTQ1d6TkhWM0VTcXVJaTNWLzdxZG1OOU55SjByYlR4UWxr?=
 =?utf-8?B?bGFHNkppS0lrZ08zODVFRTNMTU9IYUhIM3hmRHZtc2hkQSs4WDJ5MlBjZjlN?=
 =?utf-8?B?NUtNNitKZ2VaQmpFRUNBZmIxU3UwUS80Rlk0dTY2L3ExRm9SL25kQWIxSlYx?=
 =?utf-8?B?dm91dUVqU2JqRXZRWUhTWjk4NnlCSG80Mit6cFFGb2MrTDIzV3hHVjczSCtK?=
 =?utf-8?B?QUwydkFPbzErWnRaaHFIM3p0cWF3YVVEM2I5WnpGWHE1N0hhaVN0YXUyREZS?=
 =?utf-8?B?NnVkM0NyNmJ6MCtYckhjN3JoSUd3djdJaDBnUlFuR0VRc2hjRDJYdExGYVFD?=
 =?utf-8?B?WnFkcmlTblpVa1B3Vkk2VEE5blEzUFU1enhtMUNZNTdHNURhOHdKbm54dGsx?=
 =?utf-8?B?LzYxZDdZV3pkeUd4Mk02cnh1NmpNb3hzVjhZbzZWUDVOMkE2Q0kxR1dBbXd4?=
 =?utf-8?B?Mzl1aU9DR1FsU3RWU2ZpQThkRm9RUkNqMHMzUzFaaGZDSHJqU3Z3VnRpNHJP?=
 =?utf-8?Q?cIFw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUtSR0Z2TVg4U0wyNjJzdnNPaG4zNG5EeVRvVitkRzNrZGMxaEJoRlNYSFRK?=
 =?utf-8?B?YjBzcXVZOUduUWNyRmJPRERSdC9sVVBjMTVFRWhxb1RxaW1HNXZOU3lDL3FI?=
 =?utf-8?B?eFRRMnlQVWVGcTJLeklYaklpcU5TMEtxUzFqbUhQNHN4aEpCZUgvTWt1T3dn?=
 =?utf-8?B?d0l0b0kyV2hveVlxc2tRdHA5V0EvTWdmZDV1V2N6ZXZza1ZaQlloY0VRR0cy?=
 =?utf-8?B?ZWU4SmN5bTRUL1VlamRQeURaSXBoNDdlcnA0MThLSVFGWkFMQ3RQVkVhaDZh?=
 =?utf-8?B?VS9NVnpLUXlUT3lzSkV6bTBLNTJZdjBCWWxaRWw0SnArd1NWTVZYYmdhZklq?=
 =?utf-8?B?SURlZXVEK0NtcHMzTVduWG5zcnVRMW5aYWpEOG4zRTh3bEFZSndVL2NlMHlo?=
 =?utf-8?B?aENSMkNjNGFOVlhzR01PNVBpYnFVUWR0MnhmbkJTYlNtY0tqZS9LbnJpOWZS?=
 =?utf-8?B?UVd5d0RjU2U2ejJnaFh1dWl6S0huL1VGZ3JMcnVFeVhvVjNqZVJsdWlobXRH?=
 =?utf-8?B?cGxXVGtHUGZlOERSTnBWTXZ2YjBLaXVrWVRBSms4OFlQbGhkZXJ6aitpODVI?=
 =?utf-8?B?alpJRnl2OG16cDZSa05COGVoUitFUk1MZXYrMjBrME1JZWEyOXkzVzJXeXpy?=
 =?utf-8?B?Wklxc2tnaldHYVc4U1BpZUsvWmp6Wk02M1ZHTUp6a2xheDJiSmtZWDhNeWdP?=
 =?utf-8?B?bS95Q01xVjJpamU2RkRoSWhCUTZzWVJsb1lIZWl0YjBObWN0RHExdENCaFNE?=
 =?utf-8?B?MVUrUlVCcjRxYjdFeng2YjFHQUo1ZVdVaHFTajUxZFJndXZ2aDJnSU0zRmEx?=
 =?utf-8?B?ZDFlLzMzdUpWMFNLVmpXUlZsMnFmTHdrRXlqOFBWRWM2UEpRZzlaY2dETkI3?=
 =?utf-8?B?V2FQUENJVHZSRkhXR3RWVGZONEQvQlVHREt1NFhRZFJ2RVZucUM4QjVTcUdj?=
 =?utf-8?B?WUxYS09pMTFsMEN4bm5UdHVkd1ExTUlySWJNWk9CTFJHdXJtVTk5TDhxUEtv?=
 =?utf-8?B?Z3ZickJ0Ym5vQmxiR2Z3Zk4zSDNhdTJSR3RGTUNmakxETER5QUFaT1BNTFZY?=
 =?utf-8?B?QnpqQld4REdoMk5lU1RFQm1PUWhZeUxmY1F1VDVHSDZEOG80eUREckdoYlQw?=
 =?utf-8?B?eWdwWW1kZVVwblJjOXdLZW5vU2xESUJlck0yRGVLcEtKWVdjYUZGZDNCYjZm?=
 =?utf-8?B?M2xqWU1UQzJhcGxMRDYrRVBuZThBZE04K2taekVMLzRHYVhqZm1OQTBmSTkz?=
 =?utf-8?B?Rml3YThMbk50eXlLcGVJZmsydXZmNDE2MG5CL2dZbGFXMDlybVF1OGlMMDRy?=
 =?utf-8?B?eVVBREg0anhJclJDdHJnNThqVnp5T3doYjdleVlmWUVLVVFOZGtuMk5hbHVH?=
 =?utf-8?B?WTBQYkUzdkJGOW5ZRHlJWGF5TFpZTjVvakRrNll0MEJSQkw2b3ZQMGx2RElN?=
 =?utf-8?B?MEZIVVlrZnJmZnBZVHF6d2N5ZlVPNUhnWVAzR1g1YU5YMG1NM2YyeCt0MDFr?=
 =?utf-8?B?dnVCek9KNm1LUmlycWF6a3dmaDZkSnNwdUVKRFdORU91RjBzQ0psZEE5elJi?=
 =?utf-8?B?SDlVVlZ0b3ljeDJNV3BCblFodFNQT2FNby9yMzI3MlRRYllEcWd1dWlXc1Ri?=
 =?utf-8?B?eGhQd2J6SXBWbXYyTjVNQXNWT2dKdXNZajRlbG9hNG85c2lmbGI0SG11ZGto?=
 =?utf-8?B?SjlyZXZ2NzNlc0VnUUNlSVJXTDN1QUE2aDlHSStPU21CRGRNWWZsU2pURlQ4?=
 =?utf-8?B?Uy81MmRKcXY0bDJLbSs5ZmdOTit1OUNuOUl5Zkd5amlmVGltcy9XSlNha2Ja?=
 =?utf-8?B?NEIvQXYvNlJndGJmd3EzZzhYRUQ5WDNBZnhPSjE3Q0x0bElOUkk3VC9GNGpt?=
 =?utf-8?B?anFNa01wblNUSTFBV0l3TnFtTnRmdWtiMEVvWXBMSldkUkZoc3c2b2dvdmtx?=
 =?utf-8?B?cWVKZlVYblNrNkN2T1VXd2hDN2xVenM0a2F4emp4bDU3ZDc0RWpCV012YXo5?=
 =?utf-8?B?OGttNm83bjVrZUlKYlhkREYrMkltNVg3MnNkVkswU2gvdUZKbUxyRHQwTkQx?=
 =?utf-8?B?U0Q0bVFJNGg5MVA3VWNmWGU4Q2hyRHlmM21yN0RvZUpEZ1ZpQUlFU281NFEv?=
 =?utf-8?B?ZTY2OTV2anM5dlJRNXhqYjc5VnhPRUJPU3JLdzhqcEVjZ2swSW00RXFBRHhO?=
 =?utf-8?B?Z3ZndkxMQXNGaW9FZkgxWnU3eU9DWGIrcUdoQUp6VmtIQWZ3RytBQTE4dTVN?=
 =?utf-8?B?eG1WSHZYcUJuSGJqdUEvTkNqTG9INkNIVkhRSStIREZGY2xPWkU2WUk2M240?=
 =?utf-8?B?cG9jMEpBZWEzQXdNNEhBd29BRmd1c281bCtVdUd1cXJXcnFhaHN3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9341f54a-e3e3-47a2-284b-08de6b11f349
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 15:09:57.5820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwCN2fz0cPdFtAoG1kBy8Bt3N4O+6lKR/mz2VYp+yPHO86QPHUIvNc9G29qi7xio1xZgTNGDvhL4HpB3r2p8UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E76041376E6
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 02:37:30PM +0100, Alejandro Vallejo wrote:
> Makes hap_enabled() a compile-time constant. This removes a number
> of hooks that normally go reach onto shadow paging code, clears
> many branches in a number of places and generally improves codegen
> throughout.
> 
> Take the chance to fully remove the shadow/ folder as it's now fully
> compiled out.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> bloat-o-meter against prior commit (defconfig:-pv,-shadow on both):
> 
>   add/remove: 0/12 grow/shrink: 2/31 up/down: 67/-1609 (-1542)
>   Function                                     old     new   delta
>   unmap_mmio_regions                          1340    1374     +34
>   map_mmio_regions                             211     244     +33
>   opt_hap_enabled                                1       -      -1
>   shadow_vcpu_init                               2       -      -2
>   __setup_str_opt_hap_enabled                    4       -      -4
>   _update_paging_modes                           6       -      -6
>   _toggle_log_dirty                              6       -      -6
>   _clean_dirty_bitmap                            6       -      -6
>   cpuid_viridian_leaves                        728     714     -14
>   iommu_domain_init                            291     276     -15
>   p2m_pt_change_entry_type_global              214     198     -16
>   paging_teardown                               91      74     -17
>   paging_set_allocation                        384     367     -17
>   paging_enable                                 76      59     -17
>   p2m_init_one                                 295     278     -17
>   ept_sync_domain                              201     184     -17
>   arch_set_paging_mempool_size                 437     420     -17
>   p2m_free_one                                  78      59     -19
>   paging_vcpu_teardown                          36      15     -21
>   p2m_pt_init                                  125     104     -21
>   p2m_pt_change_entry_type_range               218     197     -21
>   arch_do_physinfo                              76      53     -23
>   sh_none_ops                                   24       -     -24
>   paging_final_teardown                        134     110     -24
>   __setup_opt_hap_enabled                       24       -     -24
>   paging_vcpu_init                              41      15     -26
>   paging_domain_init                           167     141     -26
>   p2m_mem_access_sanity_check                   71      42     -29
>   hvm_enable                                   449     419     -30
>   init_guest_cpu_policies                     1247    1213     -34
>   paging_domctl                               3357    3318     -39
>   __start_xen                                 9456    9416     -40
>   arch_sanitise_domain_config                  794     747     -47
>   symbols_offsets                            29636   29588     -48
>   p2m_set_entry                                305     247     -58
>   guest_cpuid                                 1919    1858     -61
>   ept_dump_p2m_table                           817     751     -66
>   recalculate_cpuid_policy                     874     806     -68
>   shadow_domain_init                            71       -     -71
>   mmio_order                                    73       -     -73
>   hvm_shadow_max_featuremask                    76       -     -76
>   hvm_shadow_def_featuremask                    76       -     -76
>   dm_op                                       3594    3510     -84
>   symbols_sorted_offsets                     58464   58368     -96
>   symbols_names                             103425  103213    -212
>   Total: Before=3644618, After=3643076, chg -0.04%
> ---
>  xen/arch/x86/Kconfig               | 2 ++
>  xen/arch/x86/hvm/Kconfig           | 3 +++
>  xen/arch/x86/hvm/hvm.c             | 8 ++++++++
>  xen/arch/x86/include/asm/hvm/hvm.h | 2 +-
>  xen/arch/x86/mm/Makefile           | 2 +-
>  xen/include/xen/sched.h            | 3 +++
>  6 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 2ce4747f6e..190f419720 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -67,6 +67,7 @@ source "arch/Kconfig"
>  config PV
>  	def_bool y
>  	prompt "PV support"
> +	select OPT_HAP
>  	help
>  	  Interfaces to support PV domains. These require guest kernel support
>  	  to run as a PV guest, but don't require any specific hardware support.
> @@ -147,6 +148,7 @@ config SHADOW_PAGING
>  	bool "Shadow Paging"
>  	default !PV_SHIM_EXCLUSIVE
>  	depends on PV || HVM
> +	select OPT_HAP
>  	help
>  	  Shadow paging is a software alternative to hardware paging support
>  	  (Intel EPT, AMD NPT).
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index f32bf5cbb7..310e09847b 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,7 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
>  
> +config OPT_HAP
> +	bool

Can't you define this outside of Kconfig, like:

#define HAP_ONLY_BUILD (!IS_ENABLED(CONFIG_PV) && !IS_ENABLED(CONFIG_SHADOW_PAGING))

HAP_ONLY_BUILD is likely not the best name.  Maybe CONFIG_HAP_REQUIRED
or some such?  (Seeing the usage below)

FWIW, with the current naming I've assume this was supposed to mean
"Option HAP" or some such, when is "HAP is Optional".  We usually use
"opt" as a shortcut for "option" in several places on the Xen code
base, like "opt_hap_enabled".  I also think using it in the positive
for so the variable meaning "required" instead of "optional" makes
some of the logic easier to follow below.

>  endif
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index da56944e74..ce58632b02 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -91,9 +91,11 @@ struct hvm_function_table __ro_after_init hvm_funcs;
>  unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>      hvm_io_bitmap[HVM_IOBITMAP_SIZE / BYTES_PER_LONG];
>  
> +#ifdef CONFIG_OPT_HAP
>  /* Xen command-line option to enable HAP */
>  static bool __initdata opt_hap_enabled = true;
>  boolean_param("hap", opt_hap_enabled);
> +#endif /* CONFIG_OPT_HAP */

Hm, if you nuke the option like that, it needs to be reflected in
xen-command-line.pandoc document.

>  
>  #ifndef opt_hvm_fep
>  /* Permit use of the Forced Emulation Prefix in HVM guests */
> @@ -144,15 +146,21 @@ static bool __init hap_supported(struct hvm_function_table *fns)
>      if ( !fns->caps.hap )
>      {
>          printk("HVM: Hardware Assisted Paging (HAP) not detected\n");
> +
> +        if ( !IS_ENABLED(CONFIG_OPT_HAP) )
> +            panic("HAP is compile-time mandatory\n");

From a user perspective, it's a weird error message IMO.  I would
rather say:

"HVM: Hardware Assisted Paging (HAP) is mandatory but not detected\n".

Not fully convinced about that wording, but I would certainly drop the
"compile-time" part of yours.  A user is not likely to care/know about
compile-time subtlety of the error message.

> +
>          return false;
>      }
>  
> +#ifdef CONFIG_OPT_HAP
>      if ( !opt_hap_enabled )

You could possibly do:

#ifdef CONFIG_OPT_HAP
/* Xen command-line option to enable HAP */
static bool __initdata opt_hap_enabled = true;
boolean_param("hap", opt_hap_enabled);
#else /* CONFIG_OPT_HAP */
# define opt_hap_enabled true
#endif /* !CONFIG_OPT_HAP */

Above, and avoid the ifdefs here?

>      {
>          fns->caps.hap = false;
>          printk("HVM: Hardware Assisted Paging (HAP) detected but disabled\n");
>          return false;
>      }
> +#endif /* CONFIG_OPT_HAP */
>  
>      return true;
>  }
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index dc609bf4cb..b330d65d6d 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -703,7 +703,7 @@ static inline bool hvm_is_singlestep_supported(void)
>  
>  static inline bool hvm_hap_supported(void)
>  {
> -    return hvm_funcs.caps.hap;
> +    return !IS_ENABLED(CONFIG_OPT_HAP) ?: hvm_funcs.caps.hap;

return CONFIG_HAP_REQUIRED ?: hvm_funcs.caps.hap;

IMO is easier to read (same below for the hap_enabled() early return).

>  }
>  
>  /* returns true if hardware supports alternate p2m's */
> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> index 960f6e8409..64fde82c50 100644
> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -1,4 +1,4 @@
> -obj-y += shadow/
> +obj-$(CONFIG_OPT_HAP) += shadow/

I think you can use:

obj-$(findstring y,$(CONFIG_PV) $(CONFIG_SHADOW_PAGING)) += ...

Thanks, Roger.

