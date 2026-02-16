Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLrNAjlRk2nA3QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 18:17:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3C6146A4F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 18:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234452.1537720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs2Ds-0004ex-0l; Mon, 16 Feb 2026 17:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234452.1537720; Mon, 16 Feb 2026 17:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs2Dr-0004cy-U6; Mon, 16 Feb 2026 17:17:23 +0000
Received: by outflank-mailman (input) for mailman id 1234452;
 Mon, 16 Feb 2026 17:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vs2Dr-0004cb-6p
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 17:17:23 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 584182dd-0b5b-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 18:17:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6556.namprd03.prod.outlook.com (2603:10b6:303:127::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 17:17:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 17:17:14 +0000
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
X-Inumbo-ID: 584182dd-0b5b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xW3Qod58U5NPvJGZG/P0wYotnT5h+P5v1n+jpxX86g9Ql1OB8HSqcEUxXr2Ck2lOmDH3BqHJfJuXL0Y9iGtgAeUeS5xGjjUL/vtvJWG0/LKoyulgK7zpgL/WIO/2fV1ff2Evm5tFnIzZhIskYPcuKQ1zX3HsUo39TDMG3oH23xl3ra5gU/zLLXl5VJchZnXKrR9j22ip0nGDlKV3dRe5P3v6bWEtY3MLgli/REu5ZcuNkf6AZQt+2PzOqr4a8P20D/ad8QphAKNcP6gYVcw3hJiRW3YVSLIFrHd93nCXw2IfzrmUdxPWKtSFpxj+nfm68UiFk0nwG1bsJvdHujE0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8v7YWmhWIamdMqlza1rHuYAV9Gi3X3n48TiklmYYUk=;
 b=PzEgX6FHE4rHBE/3Jz46WWLG2oRYTv4mxDhEa5hwERnylJKRBcHLUQWzLxxL01Q/ZduKrxHXmOeZZGvH7YnaaUc/2lU63noKcb4W75H6hGZGOcSA2Ken5PfLCdxk9NwsIDZJzwxm5K0jMNuGJsXasrUZscPZHirVKJl3RvwinCpFN62rfntE6bqChHWAafoAUl89sjYB41I06TNRXr76PwDiblK/17361qVPEk2oEzLwJCVB+p0CpNrk94LNJoMSl3DA8fCv3WbHD0nr/9LOeHeFm8rw/FvG2ybn4wj8CnM6kjyEGc3Wv0zjl2VuIOkx51UHZKrYsS0vgSF7wmQNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8v7YWmhWIamdMqlza1rHuYAV9Gi3X3n48TiklmYYUk=;
 b=VCTYuMwcYMkqkpCeF/OLeRHe6XQ2TngPQHgrngNcS7CfEcILXuHeey7+zg0s+Su8INiu+0aOaqihgbTQH8x9lN3AQHwP9B4MRPEVDqEacX6ZicpcpJcw6ysSou0cazaEPQgQ6Ll97bL2xH/okq5vpuSplM8nysVxgmkDmxJieS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <33498e90-dc3c-4763-a953-3ff9eccd2594@citrix.com>
Date: Mon, 16 Feb 2026 17:17:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] domain: move vmtrace_alloc_buffer() invocation in
 vcpu_create()
To: Jan Beulich <jbeulich@suse.com>
References: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
 <50c79874-d07e-479d-80c2-7c0694a0828e@citrix.com>
 <871a5922-9d7d-455b-8257-d583e3e47bc2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <871a5922-9d7d-455b-8257-d583e3e47bc2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 750037b5-b36f-4154-9ca9-08de6d7f3a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm5RMThRSkVOb1Q1eUorckxVMmZsTCsxRkRCM3ZTcUZ6UGFiZ0VxV3Jld3kw?=
 =?utf-8?B?VUpUK0JLM1JRL3JlNTJnemxHNnNNSGR4WUZRTHY2b2RPMURnelZSU0NDOXBs?=
 =?utf-8?B?dHFZNGhtV1dSVXhkVWJiTUJna1JKaUFLMzdJSkJ2Q0NVcGhnV3RadGNRMU8z?=
 =?utf-8?B?bGlXT0k1ZmJXVUI3NzBjYUV2bThJVGN3RzJDNGZiMmxTalpUUklWdVQreUlL?=
 =?utf-8?B?NlpaR1FzcklLVE0yeUtrQk1nSCt2MTE5NmNVRnU3U3NtZ1oxUzIyRDMvYkNq?=
 =?utf-8?B?SHIzM2JjK2JGV2trZWt6eS9iWDUyaGJPWUhtYTM0Vytvdk05UHZoV2VJOEdV?=
 =?utf-8?B?N0UwZlRNNmgrQ2p5VjF6THBtRHN3Mk5MZDVUTGFiTzZUeWdyRURjejJQMDVH?=
 =?utf-8?B?RXFJeXA0T05xZE5xSXpCWmRVZmRsUjNZMG9aalVtR0xNNTJnT2l5ZU1RTGlR?=
 =?utf-8?B?VU84azBIdmdpbVJrUmkya3g5clhWRGZDVEY2eldhK3pkeWRUWDFQZE5wZmhp?=
 =?utf-8?B?TjdPK2RmbjJrWVp2WEJWL2dTdjBXNzVsQVYrZ0xDTWNNNHZFL25TRnpwZDVi?=
 =?utf-8?B?cGY5VjhtMm1jTmp1VG5tYnVDT0x3M0t6aW04aDlya3NXcDJXSWlSWmYzVDQ5?=
 =?utf-8?B?emt1bXlTYTNKU0lYbHdETzk3b2c3WUFBNUJpbWI0cjNzd05HaUN1Wk9TemRU?=
 =?utf-8?B?L01PbUVUK2kwVlR2RE1sNzc2MWZJR3B6VTlGUnBtamRuNlJFUWNhWUFVRkNR?=
 =?utf-8?B?OHVuWTFPMFBNRkh0NGpqMVNXODNjckFuMXNrOERrcXk5ODB2cHdiNFlsZWNJ?=
 =?utf-8?B?ZXNXSTRCM0NSUHVSdFBGbmNZc2UzYk9qQmhWb3YvMnFjNi9LcncxZmgxRWxK?=
 =?utf-8?B?VVpkZHp0V0N1WkxGMll6TGVBYmJudG1aQk9JOFExNjZLc1Z0aFFHTDRzUXFy?=
 =?utf-8?B?bWRDSWI0VHBRcm9NazN4UVdiTTNSRDY3alZ5Tml3ZkN2ZWV2NTBlbi9tZFJE?=
 =?utf-8?B?bys4RlRRdUFmQjNUY3djM1Z3cGlBSmwrMUN5bUlaUk9STEw4YUtGUFVKUFVn?=
 =?utf-8?B?UEZYaGFKMU5HVTFLM1h0Sy9pcDI3d3NWaU5sWVFIVHZMazUyTmJ0SWNjOWk3?=
 =?utf-8?B?TTBORlFvVkJOaC9qUTlaeTVqZGFUK3hsdjUrRllMR2FoWTVBV0VobG1lQk1F?=
 =?utf-8?B?YjZ0OURyT0F0MDQ2ODZUS09yWGZrU29Rd2h2R0QrQzlEejBwS09taE94UFVx?=
 =?utf-8?B?dmV3TnhaZjlqWldxSm5ka1hSQkxGWjNDck9SMGZsckhoRGVMRisyd1JpRnN2?=
 =?utf-8?B?QkJPUkdMaWxzT3RVRG1uNkFrbExmRFRReEt6V2tPazNrTnhNajd5UDlwV1U1?=
 =?utf-8?B?bm5ZMzFIYlJqUkZPbXR5b2o2cWZZSWRtQ1hHais2Wkc3c2FNdE5CeVU5OWdq?=
 =?utf-8?B?dHZ2TWF4UTFBemxXOTlhMzcrK09HbFBMa041TEdzaUtLK1VyUTVHRGF1S01v?=
 =?utf-8?B?R2hMT0l3R2FuWi9mK3dCemhmdUszMWExbGdud3k1dE9kMWx5QUlLTElqZ0I3?=
 =?utf-8?B?eFd0dkhFU2pSaHhqQ1FmNW04RWZpMlVFM0dLZi9FNTF1V1NhOERiLy9uTXR0?=
 =?utf-8?B?TUMvZndjV0xMd0QwbFFuczZQMXdUWjVUazdaaldzaVptL0JVdHRmT0x2Yjkw?=
 =?utf-8?B?WjRyelozdysxYnBUQyt3ZGN4MXVqU25JWFpLNVdWZ0RKMUJia25MOE5tVnJ0?=
 =?utf-8?B?SkFZN0tTbnJYNHFpSFhjb213SDVsNGdvSXhHMEZrZFZsQURCZ1ZkOTVnNVNM?=
 =?utf-8?B?dDc4MnI4UFo0MmNDZUZlRFh1eTJhc05iNTE3R0tjcDV4RTlzaXNpUzdZQmw0?=
 =?utf-8?B?SjZhNTk2ek9jN3drZGxjU3AxSlBmZ0ltNnBCRE9zM2xZWitUS1ZCRVd6cHBU?=
 =?utf-8?B?ZU9XaGUvRUgwN2tmOGNzc2VhYzRML3c3MVEzM3VvYm9XSmQ1WlUrcDZZMEdW?=
 =?utf-8?B?ZE5keUFwTUVUVjByWm9MUzJvazR1RmdvQmp5RXRwdUhSUWYyajBHWWErK0Vm?=
 =?utf-8?B?UUMxdDNOSVR4L0pLbHpGb0JxMGRPNlArWUEvN1JoMVNOWXdVNll5Tzh5OUF0?=
 =?utf-8?Q?V1aE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2MzMUQvdWpwR2ErYmwweE16R3NDNE0vM2RFMDFkajBCbVRqVnhxTnZVUXVU?=
 =?utf-8?B?KzZOWUpMQnR0ZjFJdit1MVFmRzYySlFLdHJmbUFGbytzZkxId1ViUUtqSHlE?=
 =?utf-8?B?clhUOGlKK1puNnBoczluTkl2SGQwSW0rRXdIQXZLVDNKY3RYajNWL1BpelVJ?=
 =?utf-8?B?MnpCZldHWDVKQ0gzSHBST0tENTA2bGtqbmIyNFJLdjNUNkNuMzdPOFpRYW4r?=
 =?utf-8?B?UTM1WDJTd2c1bjNxVlhMK2UzTkZKVlJucG1PRU1iaG1Ic1JqWUhGYUZ5ZVQx?=
 =?utf-8?B?YlBXSDlYaXF2d0xoNGhpR1BtUmorRkpwejN3QTBQUUx3T0hNNEpoc2VWWncz?=
 =?utf-8?B?aUw5M0lpM1NySkljbVNFYjBIc0RicVFQL25DcllzNjh1MUJReUFoWlM1STZo?=
 =?utf-8?B?a1JjUUNYYnJQUUpMbUpMMS8rZFVzdGhBVE1YWnhwRUdTM0JPNlV1TzJVOG95?=
 =?utf-8?B?b2tla0lhNmxkVEk5emFFVWNidXlSczlablVJa1dOSDVPSDF0ak5BeVczdmlC?=
 =?utf-8?B?RGZFUlpyWkxoMHVVa2wzT1ZiWUtkMHZJeDJBL3B4ZzJxVXRDN1JqSDdUL0Ny?=
 =?utf-8?B?eSsvejlaRnBsb1JlWjJVT0FDay9JVVdSQVZYbU9lWmRLVDcyeUswckcybEt2?=
 =?utf-8?B?TDhjczNHaEY3MTRKL2tSZkhUeHpWVGk2V0sxN1F3T1EyMWdNSG5YL3hmdFpP?=
 =?utf-8?B?UGphWW1abTJMUzNXaFFyMGJTaSthbzBwUkpWWjVjZGg1cHlKVm5lU3lNTXdl?=
 =?utf-8?B?Yml2ZHU2OFZGeGQwMmk5VG1aeFhOa0dFb0Q1T014SVZaVGhDbU52TVBleDgw?=
 =?utf-8?B?aFFkVVh0WVliYm5WSHg4Rm5WYjlkNUl0RWFkb21qd0d2emRDZmRQVmxWOGFr?=
 =?utf-8?B?K2RBQmVPTDl6S2N4QmwyWGgwTENFbWJpendBNTFUK0xuTjZSL09tNmYwOWpr?=
 =?utf-8?B?VmdyVHZlMTV6dE5ZWkowelpjRWNyUWJnWnpsNm1Jb2M4UDZIR0IvZ3VUR3lK?=
 =?utf-8?B?aFIzK2NBMkpOZHdPcm1ENVpVbEJlRXBVdTRJV2NJbGtHdDYrdnc3dUNjVXlP?=
 =?utf-8?B?b1BJdm1kRlNuR0FaSHVWQWdERVhkb1Fhc2ZzdklpaXpnSzJaejVRcmdDVk5P?=
 =?utf-8?B?WHVDS05JbTZpaXMwdzdYVUpjOUk4RlI4R2swd3YwRFpaZ3B4UDE2cmc4M1pn?=
 =?utf-8?B?UTAwRG5iKzlCTGpScTJ3RHJKU0l5L3hPM0FEcDdXQTI3eGMvdVJzSlI3MG80?=
 =?utf-8?B?SVlYd2xIcUtDV3plbGZIS2JMekRLa3pMRUJ4VDVSdHdvVWlhNlEzZUJQcm1B?=
 =?utf-8?B?dEVRanJUSjc0bGpRdWZFUHA2dTBMUWIxTlp4cXlmQUtKOUNDbHpKeFNwTkh4?=
 =?utf-8?B?K28rMmRKQnlUWUJtVUErMEJaRkZxYUpkTGMzM0pZcGxTNldUZFkyWnJnQTdq?=
 =?utf-8?B?b0FBQ1RPWnNvMXNQZzNmL2gxK2dpQXBObEVaV2FSbXVuM0xuWUlVZXRRWVA4?=
 =?utf-8?B?NUNGbytMc0txZ3dneFo0Wm5xakttN2pPWWNlcWdMVFF2Szg4M3VLellJNkJ3?=
 =?utf-8?B?U0RCOWF2V0pERTVsdGsvY2JvbnBiaW5IN2swc0tFc3d1UVR0QmgxVFA3Vm5h?=
 =?utf-8?B?K1lXZlRIM0hZRm1TMm02aGdwVThLZkF5T0NYbUJiWHovb21rcVBtcHFwVWhF?=
 =?utf-8?B?OEhLMDl2N2dmOW1jaG55L1VWUFRvdTVoZDBOajhSYmhOQ2txZjByQkRDODh6?=
 =?utf-8?B?dE0zMzlRY1lreVlNT3FuRFU1MG1KZjRIOFBGbTVWTEFzWkJ6QndQUzVNUUY2?=
 =?utf-8?B?Zzh6OEVvOE1scXBpYkZhWXBrUVVWcS9pWDBpQUtWS1YwREtINlBRaTNnTXdK?=
 =?utf-8?B?ek9LTWFIY1F3Qy9JL1RKOXhUei8rZDBLUFk3dlZxOXdiMDRQemd3Nk9ORjlO?=
 =?utf-8?B?aGZ2MGZ5NUhBS3BVQXFLb0dCbnd2REw0clZzTHBUQzc3Z1BvbkpxSExGRjlI?=
 =?utf-8?B?QlBvWlp1UFVIZE9QeXJYU042cW1qdG1Vc004SGNQcDJUeFliMGlTRXNZampO?=
 =?utf-8?B?K2tOZitQZVZLTVRBSU9COXNjOXFnZ3ZKUG5mUDRvM2hkakEzMHk0dDdsOXpI?=
 =?utf-8?B?ekxiMFE3dmI2bFZodzFjRjhEN2NQYkZXNHB3dXBjWnZPK3kyQ1dBcGF3MFhH?=
 =?utf-8?B?bXUzTmJDdEFjSk94S2JuUWlpZWRaU29OMWc3TVFialZTbythWk5Qd2ozb0dU?=
 =?utf-8?B?OFFUQ3VhUUovdjdwMEtjWHBtT1hhUkEvNUwvblNETm9WOHRjc1JxQWkwRFZJ?=
 =?utf-8?B?U0xtZVRCdUgreXJPcDFGYTBuQnZOeEtxZEJiVlhMR3M0Z2syeVNUZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750037b5-b36f-4154-9ca9-08de6d7f3a60
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 17:17:14.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/LtC2BXCalFQase+G2B6xAimdxSN7HlLGAQDIao0C23ontuVglp1MYO6RIxmfqCf7kPyVRhIgkmQ6J3562G+NdnZpO+aPNtbNCStxRH2EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6556
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5C3C6146A4F
X-Rspamd-Action: no action

On 16/02/2026 4:39 pm, Jan Beulich wrote:
> On 16.02.2026 17:29, Andrew Cooper wrote:
>> On 16/02/2026 3:51 pm, Jan Beulich wrote:
>>> The label used upon the function failing is wrong.
>> Is it?  Which label do you think it ought to be?
> fail_sched, as Roger did point out in reply to the original other patch.
> After all ...
>
>>>  Instead of correcting
>>> the label, move the invocation up a little, to also avoid it altogether
>>> for the idle domain (where ->vmtrace_size would be zero, and hence the
>>> function would bail right away anyway).
>>>
>>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -493,14 +493,14 @@ struct vcpu *vcpu_create(struct domain *
>>>          set_bit(_VPF_down, &v->pause_flags);
>>>          vcpu_info_reset(v);
>>>          init_waitqueue_vcpu(v);
>>> +
>>> +        if ( vmtrace_alloc_buffer(v) != 0 )
>>> +            goto fail_wq;
>>>      }
>>>  
>>>      if ( sched_init_vcpu(v) != 0 )
>>>          goto fail_wq;
> ... this comes first, and ...
>
>>> -    if ( vmtrace_alloc_buffer(v) != 0 )
>>> -        goto fail_wq;
>>> -
>>>      if ( arch_vcpu_create(v) != 0 )
>>>          goto fail_sched;
> ... here the correct label is used.

Eww, yes.  So multiple observations.

1) This only functions in the first place because
destroy_waitqueue_vcpu() is idempotent to v->waitqueue_vcpu being NULL
which covers the idle case where init_waitqueue_vcpu() was never called.

2) sched_destroy_vcpu() can be made idempotent against v->sched_unit.

Then we don't need multiple labels and this all gets a lot easier to
untangle.

~Andrew

