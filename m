Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM5CLWi9eGn6sgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:28:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DDC94E5A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214712.1524954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkj6b-00035v-4f; Tue, 27 Jan 2026 13:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214712.1524954; Tue, 27 Jan 2026 13:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkj6b-00034Q-1d; Tue, 27 Jan 2026 13:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1214712;
 Tue, 27 Jan 2026 13:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkj6Z-00034K-3E
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:27:39 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef8a6665-fb83-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 14:27:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5219.namprd03.prod.outlook.com (2603:10b6:a03:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 27 Jan
 2026 13:27:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 13:27:28 +0000
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
X-Inumbo-ID: ef8a6665-fb83-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3zz+yb2deUigyXxVsBl0kV7IwFBIvmaFt7ulGiD2XdzXxkWoX5pki6L/uv9hFwvUQm+q/YwBrISpXX3CDeUmjtjAGKrLY/cSnqtfSDKzA9ACbgNG3dmt4jj4tzfJsrxMEhtTO852EPOuinghLnCiWGOg83j63nCHRX79FLAvZM6ri1EX/hUHPyf5sAfnW/7hsV1plnRET6VwI/Z1SeYQo6F7kgw17vMFO0Jl3sKQjT2h36i7dz9Ht75y5gmEzDTvOpgMU4CTxIB3u4+6wnGTPNaWjxNHp8MQg9hb2EUx0c177H1IiCk80FzQdoKuDW9LihzzJA9if67kIyzPvnoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzmbWFcOR0CUdgqSlkOltoVh8M1pgRE2X0Bloc+Ob/Y=;
 b=ixc747SylPexmVIkcl5+9gPb5RDS3E54hR1wqtBRDekfyTn6cVDXBFocLsvyW0/QW+LffGxUthNGKRb2wgHxqILRj+2tCyb2Ix9rcctgNE0JZgldEC+toTVSMuX29DdRkmPcZFpRLP6K/v3FhdeQhdhlN/T/6HqwpA0TkLxCTEsLRgF9UhOsZ+z2Fj8c3oPS2BytH+Jc9z2y1nXWfPz930acOfW7F2h/rADqQAUlUEtOXuELie5uYsR4TAoBB7287hctNwUq1JEugXJhilHG3RAAmuI4jS85X63mdZhu7kRM14TxPHrMzABl6Hp+lG4ByOEWfJ2/SGRLkkqBOWmE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzmbWFcOR0CUdgqSlkOltoVh8M1pgRE2X0Bloc+Ob/Y=;
 b=WwL3knM8Yu0cko/nBSlkkmnUUEdYUrGwWUpeQN+04gPeluOXcC1TS8bqbsxYR+4OI+lS+T5rVuBO2s/EDqJJXuOYO9gvmQq9zTAJrC/rAc1/Ix2FA0XwS363GjHHF+5iEOuSP6hm6xifqNsrYEMSzk7SOCDXGn6XSqEjgft9HdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <48cca311-328e-46bf-b5e5-e22dd9264b84@citrix.com>
Date: Tue, 27 Jan 2026 13:27:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: suppress trace_emul_write_val hook when
 !TRACEBUFFER
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7982a813-0fda-447e-a0f1-c9357b85f264@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7982a813-0fda-447e-a0f1-c9357b85f264@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0021.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4d0993-bacf-45f2-8ded-08de5da7d10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUgwZC9rOW5PeVd5bW1uY25SOXNHSUxsMnZhVXdkTWUxM2I0VlRmLzRiZUpi?=
 =?utf-8?B?YlVwdXF6TytjWmlsZWw2WVc3bzRKblMxZUM5YXVCTVVMTkhrSFc1TkZSYTk4?=
 =?utf-8?B?ZHhxMWl3T01zY3h6b2RidTFuUlh5M0Q2Uy8xL0hQdzQ4emp5SitJWEJMVjU2?=
 =?utf-8?B?RlVXTlltNjhwSHNEVDRmMFp4eXVweU82TWJXT1M3Vkk3V0REM3hOeG5NN2U1?=
 =?utf-8?B?Y1dpSnR2REtTK0toblNaTE4yZXA2Z3BaQlo0cHA2eWFJdCs1c3FkbSsxSHNS?=
 =?utf-8?B?bkdMNUlBU01sZy9xMWppYTZCclZFWjNlaE9hUXd6U2lPV0ovRnBvQWpvTDdv?=
 =?utf-8?B?SzlNZlE4K2pLNXBJTWkxOXF1b25HRDFRWmpKUW1RUFhxYTRkRDJnbk1KdXNs?=
 =?utf-8?B?TW92N0FZTUR6ZGZQYXRGNDAxWlhSWDhnTHoxMEpUaGQraUNEMUlJaStRRks1?=
 =?utf-8?B?UE1RQ0g0TC9HcVVrNnY1UjUwdDRzUHBDZVFvbGxaU3RkckVnQ1poaC9pajJ2?=
 =?utf-8?B?ZisyUml6ZHBLZFBlbmtHRjJCcFlPbW9uNWtnSEZhZ0lzK1gycDNFR3dXbExY?=
 =?utf-8?B?NC9vZ2NNZDk0TjgxYyszNjYwcXdld0xMaWV6TGRVTGRKZUFSZXRqb2Uzd3ZB?=
 =?utf-8?B?M0xpaDB1N0g2RzNGR1Z1aUZGUEFPeWVsQW43M2J5cjJvbWxnNGRMOHRFZDdJ?=
 =?utf-8?B?MmpCWllIQ0JjOE1VOGh3WmhQSmZyYk1oQ2YvdlVNZ2xIc1JLQlBDY29SeWZ3?=
 =?utf-8?B?MUZSN1pjM2NqdFpBMGNHeXZpSGQ4TlZjcE5jcGR5cDFUNWM0TTRGL0J4ZmlY?=
 =?utf-8?B?YlpPQkNjL0RWaUVhM1ZZbWpOWXIvY3phMTJvdzZoUytnLzVpbGhWMy93VU9s?=
 =?utf-8?B?SG96L2hERVUwTitGSEpHbVhmeUZENG9yOEhCV2JXa0RnZEF3bnhyUTFNTCti?=
 =?utf-8?B?NjZkV2Q1Wmltc3UvM09Wc0V0dG9qZlZ4c3NuU0dDWFg3a2tpY1dBK1dEMHJ4?=
 =?utf-8?B?OWx6MGgyYTBUTW5aWThQSHNSUHpFL0IwZEg0dDRHM2tNWHNZMkM4NFFCY1ZL?=
 =?utf-8?B?T2R2N05ieTZUYytDa09pY2J3MER3L3Y2by93MWo0bEY4MXNlM3VHUXZSTXU4?=
 =?utf-8?B?a2xlWnVkQXc0a3JIWXVuNGlqMWtZY3lHckVkeUMwUDAvQmFBNTlFbHllWExH?=
 =?utf-8?B?VERBbGV1TkpldmF0VlJ4OEhUdkhZUW54VkZKZTVvazN0WVdPS1BybEY4TW53?=
 =?utf-8?B?QnNLSVFaelFkM0JDazZmQ3RGeUZSMFd1aWtWamt3bXRqVVB1WUV1L3gvR1d3?=
 =?utf-8?B?dXRvZmJYZGpJTTFYd0todlFzZ01FcTd0eUxabkZYNDUxNERVUWFabDdLRjdv?=
 =?utf-8?B?RWRSZHdCODhWcG1EaWtGcmlackNIUXRnYTRVYmtGMXRWUDczN0JlbVBTWVpm?=
 =?utf-8?B?dm5jRnR4MDFERzlMOTJJZWx6VEliOU1nSGVJaTJYb0xEcjZVOUQvb1BvamhJ?=
 =?utf-8?B?MzZVSGVxb1RLOUhpdEo3WnFhcC90c2JKNFU0RHJEbklUbUJoVGNBSEpMZ05J?=
 =?utf-8?B?Q0U2NHVsN2dtdDBsWDN3OWVFUEMzaTRaMmVuRG1XbXF5MnRoVEYzOGRkdFhp?=
 =?utf-8?B?OUJ6cmNyQkR0MDVpVDBSSjVFSlZsc2xHSmx0bUltSWY2NjU0NWJpeVBocWd2?=
 =?utf-8?B?OU9jbWl0cVVEN3NhNnZKZ3p0bDdlUHptOGcwYktGWW15OTcrSzBncUUxRkxk?=
 =?utf-8?B?MUhpNHh0VUJxVEFWaHBUbURTeVJHN1BTc3RSRHMvWHNET2dYbVdsU3ROVlZP?=
 =?utf-8?B?aXVqUXJQUldQUG8xSnZZRm05REU5R2xFWDFTZVBLMWN6QWovT25tT2tXQkdo?=
 =?utf-8?B?WHMyMW1VeGh4amk4NkFieEY0SDNDeDk4UTFIRWRNbUVvOHNBa0ZOVFhhdVo5?=
 =?utf-8?B?ZWpHRGIzYTJjV1ZpMHB6cTFMcXZ5NGlrajFlaFQ1WVp2Vk0rOUdVcEZydXpC?=
 =?utf-8?B?VVV6TDA5WUlSUU1hY2VySmZ4Q3YxMTlwZW83QlhsMUNNbU5jZEhiWVIwQXl0?=
 =?utf-8?B?anFWUmtJRmJ4bzQ1SVE2bml2dmR2TTdDekk5Rml2eFAyRFBrNEtnOStyR002?=
 =?utf-8?Q?yDzw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uy9WNnZacW1GelV0TTNvYnZ1VEdKbUpOSXZ5UU1qQTUwMHpLL2dDb2tPdUxz?=
 =?utf-8?B?WktBRDJPamRwUjhjR1NOQWp3bGJHdExrL1ZPK2duZlhETC9BbEN6c2ZvWEZ0?=
 =?utf-8?B?WnRwSVJrdzB1VzczT3RsMVVrSlZOMTJIc1JJU1c2aTUxMjc3MHZGRGZGeUFN?=
 =?utf-8?B?M25DcXRaSkduUXpVbXM5OUJiT3V0L3ZETVV3d3ZKNmdXSXlxQ1Q4RXAyWkJE?=
 =?utf-8?B?QmpVbnBYYVRXc1JqcGJJN042d1kydjVWZVFDYXpaWk96WUFlZE44T2VZcEta?=
 =?utf-8?B?aW1EaWxYMnlDSjdBbmhqWG14ZDNWN2VCUGVwUHgyQ3VrL29vQS9oYzNzL2hM?=
 =?utf-8?B?dWJoOHBqMUVEU1JJTVI2OTlpdDNmZFM1M0tXVXVzRndZRmp3Q21KYlJjSjFl?=
 =?utf-8?B?VnNIcXBIWkZSeFF6SEwrQkJxTGVJOFF3Qm1yeTZsdXQvbVc4SVZ1NGtuSCs1?=
 =?utf-8?B?S1ptV1V6UU5NNy9NUThaT1AzWkVHVHZKZnFtcUJQdmk3dEZRai9JYngxajFa?=
 =?utf-8?B?SDJ3QkxSZkptZ1N1WVl5L1luS0I0enV4LzdQbVkrekNLTThQMC91dkFwQnNL?=
 =?utf-8?B?dnI4M05hTFlHWjdpcHpHWlZBNGlwRWt3anA3ZVM2UzFaQ0dpU3NacG83QkJU?=
 =?utf-8?B?OGE5MVB1Njh0aktPRFlpUktvM0paRXQrOUdLVG9PM0JkZzE4QzVzcVdwdXhY?=
 =?utf-8?B?R29oOFB6Zi8vTGw3dGNvdUkrUTNtSHZ1a0tXemVKdDJvN3NWcnJrSXFsR1pW?=
 =?utf-8?B?ZUFYZnZvcDNGdVMwRm96Ykx0VjdLdHA0QnVtbGYyRTU2ZUV2MGMvdU1PVUNF?=
 =?utf-8?B?UnY2Z2xYa2prL29mSkM0aDV0U00vL25MTXJEWklka2VpU1RjVlM1VlMybDNC?=
 =?utf-8?B?cUFVQzBHRlVOTzN2VWdtZyttNDdJbDBMb0pPeERvUGRNelI2NU03THpkMTVX?=
 =?utf-8?B?U2xCZlptYTVpUE9iUUIxdEgxRTBhaU5lUlZHOTh3dWlHVGllMm1yOGpQWFVN?=
 =?utf-8?B?QzJzVFVDME84WnR0MDRURjFvN0dMcVBiTkxSWXRqeVRnVGtxY2l0MjhFckVh?=
 =?utf-8?B?TUtIK0J2dGZBcHRaQk96VGhqdWM2ejlUam9OVDRISGZkK1BORGtNWE5iMmUr?=
 =?utf-8?B?Q1pNMmJmUjR0N214V2w1TmVLNTFjTlhCMlY3SDRPRk9MdGdGUlhyT2VSNnY4?=
 =?utf-8?B?NjlSbGh3b3hQUjNQQlVyL0RYaUlqT1FETld5cm40NERhai90K1M3RWlFRm1t?=
 =?utf-8?B?bUE0T0FZNlVaZ0c2YnNodjZmMXZqSWllUmVFZ1hha3R2S0YxZm5pdjZPVDIz?=
 =?utf-8?B?WllMUWF3cHdHQUd0QnlOSW5qMjRtMjB4bXZXYitxZVdzclJsa3F1OVpHSEkv?=
 =?utf-8?B?VC8xZEN4NGpLZDB1aE9MZDJsQ0NnZ2JNcHdpcTlSS3dHbktkdVc3Uk9BYU45?=
 =?utf-8?B?UHYzWlA5V1czOVJpWFQ5UGQya0JOWU1ZWXdkUzFqL0F2bmFRZWRDYVovODVZ?=
 =?utf-8?B?b3doUVFhbitNVCtaMUx1Si9rZzI3RG9mL09uTzkvQjZ2SVozOGRNWEFldU45?=
 =?utf-8?B?b1IxcEQxOUF3eWE5Q2s2dzhjZTFaZE5xc3FFMndoY2c0L0dGdEE1WFhaNStr?=
 =?utf-8?B?Zmt1eTZxRTRickVpa0RYemh3Ym00NWtTelJJaFZDWngxS1U3UEVpYlVUMXBP?=
 =?utf-8?B?UTlraURtS2xVZHpjVVM2Yk5md1lvUTUveUJYUTdrN0YvSTA1K1hieGlsNjZG?=
 =?utf-8?B?KzVGd2dSNSt1eDdiMlQwTVRlVTdWWmdmNFFBOUFES0xvRWFlbWprOVRITVBJ?=
 =?utf-8?B?T3QwMjdTem8wN2JiTUc3dHpBdldTTzlLODRFOTRLdnZ6YWlEc1RCT2w1akJX?=
 =?utf-8?B?U0s2bDgxc3RQSjU1SEVGSlRaQkhXbHBHUVU5S0lMZ1RwYTlLVzdVTlMrelBX?=
 =?utf-8?B?L3FwR29FajZlV1VzaFUyN25KNWorQjk4akllVXpGc24zcHUrYlFvcHYwbmJL?=
 =?utf-8?B?L0xrejdsMHpGWnZYRjBMZE1TZ3hJWlRBL1l2UzJMZHRMNEEvN1NGeUNTYVJH?=
 =?utf-8?B?SU5vb2dJZDZsVm1DaEg0OXpSaTRxSE9sRzh5ZFlEUzc0aHd3Y2l1VmoxTStj?=
 =?utf-8?B?K2RGTnVRSmM1RkFWTGJlMVBQU21jUGpnWERFZmw3Ym5jYUw1ckVuQk1udDdN?=
 =?utf-8?B?N0oyV2ZvL05idnJjMTVld0V6cFFPeE1xcm1HUmRwNEZ5VjZJMHYzNHF6Rkxu?=
 =?utf-8?B?ZXJ6eXNwUlpTVUp2SHh2VHVWVDZ2NW1uRGxDTmsrSml6bFhwQ1J3WFBXSGNn?=
 =?utf-8?B?elpwdmdPOXBjSnlOWXhENE0zL0IxSDRxVWlRZTVScis1Y1FoR2xydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4d0993-bacf-45f2-8ded-08de5da7d10a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:27:28.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKmqSwJbZbuSZExe6Ll5sLOwt4pwJOjqADef+8pMsEKnOiZl3Us7xvjEk6xg40FOJdFTEQXfcJNkPuKPQspeKYdWgcwQt3+dyeUTR43u+Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5219
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,citrix.com:server fail,suse.com:server fail];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 19DDC94E5A
X-Rspamd-Action: no action

On 27/01/2026 1:20 pm, Jan Beulich wrote:
> The hook is never invoked in that case, and hence needlessly offers an
> extra valid indirect call target. With the hook suppressed, no consumer
> of the three local per-CPU variables exists either, so they're
> suppressed as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -90,10 +90,12 @@ struct shadow_paging_mode {
>      int           (*guess_wrmap           )(struct vcpu *v, 
>                                              unsigned long vaddr, mfn_t gmfn);
>      void          (*pagetable_dying       )(paddr_t gpa);
> +#ifdef CONFIG_TRACEBUFFER
>      void          (*trace_emul_write_val  )(const void *ptr, unsigned long vaddr,
>                                              const void *src, unsigned int bytes);
>  #endif
>  #endif
> +#endif

Can we get some comments on these endifs, and ...

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -4130,7 +4142,9 @@ const struct paging_mode sh_paging_mode
>      .shadow.guess_wrmap            = sh_guess_wrmap,
>  #endif
>      .shadow.pagetable_dying        = sh_pagetable_dying,
> +#ifdef CONFIG_TRACEBUFFER
>      .shadow.trace_emul_write_val   = trace_emulate_write_val,
> +#endif
>  #endif /* CONFIG_HVM */

... this one too.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

