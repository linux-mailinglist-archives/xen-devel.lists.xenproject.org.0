Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKxhGzZkgmkATgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 22:10:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E55DEBF2
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 22:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219710.1528598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnNdw-0000fm-O9; Tue, 03 Feb 2026 21:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219710.1528598; Tue, 03 Feb 2026 21:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnNdw-0000dk-LV; Tue, 03 Feb 2026 21:09:04 +0000
Received: by outflank-mailman (input) for mailman id 1219710;
 Tue, 03 Feb 2026 21:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uuvN=AH=intel.com=sohil.mehta@srs-se1.protection.inumbo.net>)
 id 1vnNdv-0000de-9y
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 21:09:03 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b044540-0144-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 22:08:54 +0100 (CET)
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:08:52 -0800
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:08:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 13:08:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 13:08:49 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 13:08:48 -0800
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 21:08:43 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 21:08:43 +0000
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
X-Inumbo-ID: 8b044540-0144-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770152935; x=1801688935;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qY1T3W5FyVljOdyzSZZJlCwbWMnAtLdxMvJwaQWvtv8=;
  b=eX9W27d/4IAinXu1+z0yS1hsisZdivGS+k+0xP2NzOFqIIXRfsTY/Ojs
   nFqNYANawhDSG2K937SqETPWXuqcfgcQy01ASrqamx+fqUs77fHXJS22x
   o4o/ozs9sIMYSCgVxT5BnTP5A/crcUTPkqGsknhh9TJNsCHQcEmfQRSdc
   QJEgJNmL3r17Mb643sWq2q4QFsJSdg2EsDDWY83t0mn/1mLFtpWPwZVYm
   4MGS1OqNUBPmODPhE61bOqqeonYNnKTSn6843Q8oB2dx9sfQtFpFpDPI2
   u65G0Xk+6+jTfdvJ6i/vX2Gu2Itijj2+j39ZKtCXorX04hVjPXIkaawfC
   A==;
X-CSE-ConnectionGUID: I+nnhj8GTECajdZL1SyV6Q==
X-CSE-MsgGUID: UE2V2SsGR5+XOPycT3zHxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71233925"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71233925"
X-CSE-ConnectionGUID: AIu4Bu7bRHmCN8w6PpNQgQ==
X-CSE-MsgGUID: 1zC3yfojTc6HH6P4vGGrGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209071141"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBDzqIUeDTf59gn4wD4SI98TY88DBozbvs4GiraMwQaEb4yJok/ZZrVLxYySn+yae3nX7n4lIGuziA38BDi94Ds08fe6hCSUZfnk5It53TJdNumxqRTW/med9jmVprVS1j9NWLT/FQM4xvQ03uGcUP48eKja/DvY1A4DU4V/oEGMoBz3ZA/fSX1Wgq+LIrRmjOlkgIZl1zb/q8PWbQGekySpwxcvfP8RcLy7PYzIAehQGFzk9bwMfmUPlKJSt/83rdcp57CXIkD1Z/uPfUlgku10jOIGgbegNE2jiCaABw/eR6QwIjZNV7+3/TfotLGmjvczwnxjN8qg5pnOhmC+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGlKOzbPKaZ81XQ6QuEHoOFQ+jjciNTqRTj25RwHY50=;
 b=yyKeOqEZNWbc9JAYo9Q3EboS0liQvxZtn9RHS6+a7eto7qCi/Rnbh1eTJtnwtl2V8N1Ob6h60Ae51TJJ5FPQZV109rsgy40Z/KvvhYeFnvvosJH8nUbu6I/g23bh7xG71HIGPlJhoBSfwhw52fM2QSgSh/phOZ0mAzNzg9wkNuRkOgnecqLpXcf09tohx/jeV9ErYiogit/5vAd2/NeYPEf3PY+OLT7qO3dBJRibCP7RA7CyEIP9r8+5mAf7I5xPonF6VBQSephHFXdIAg5RYiEVCqpkMzOnashmlKTYyj7KTyKUpxHVDFn5/rctfKAq3X/BuA9IV40awvj1/Hdmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <0149c37d-7065-4c72-ab56-4cea1a6c15d0@intel.com>
Date: Tue, 3 Feb 2026 13:08:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel
 expects so
Content-Language: en-US
To: Shashank Balaji <shashank.mahadasyam@sony.com>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Suresh Siddha <suresh.b.siddha@intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
	<haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
	<decui@microsoft.com>, Long Li <longli@microsoft.com>, Ajay Kaher
	<ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Ingo Molnar <mingo@elte.hu>, <linux-kernel@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<jailhouse-dev@googlegroups.com>, <kvm@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, Rahul Bukte <rahul.bukte@sony.com>, "Daniel
 Palmer" <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>,
	<stable@vger.kernel.org>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
 <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|SA3PR11MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a565a4-48c6-461e-47dd-08de636869a7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk9HQjdXd280MWMyOHBVbHZ3cCtVRENJWmI0YjY1S3RVRFZNOTRhSy9HVHVT?=
 =?utf-8?B?Y0dYdXhXRWZzUG5KK0FFcmJmdDlCVm1qOUNhMUR6bERvY1FONTMvTDFPaERG?=
 =?utf-8?B?OERjaFlUWVZOMmdUUFF6eVZxSjliV0FqZ3J4NW5LNjdWMURFWUlBL3dGZ0cw?=
 =?utf-8?B?ditLMWRRNjQzZ0o2UjZNdm1KQWFkVC9QeE4wa1M5MXhkeEZ2MEIzNHFNSTVq?=
 =?utf-8?B?US95SmRtOCtIMW9nOVdQTVVrOXlQeVhjeEdVdnZDNkdtUGZCdkthSFZNODBx?=
 =?utf-8?B?b1hKSG1mMUxRR2NzZks5ZDFRV1RDNUJYbTVyR3cyUnhncE51ZDFWR3B0Y2s0?=
 =?utf-8?B?T0xLcGJjZXozTkkzeTlacGFZWEI3S3IydjVsMTF4aWxEcm5iZ21paHZncmVF?=
 =?utf-8?B?TDEwNFF3NUtxMjAwNFROOVZyRWhJLytMSDVUbjJlM0NtdzBWaFduOHBucTRH?=
 =?utf-8?B?MXBvRzkxNkcwa2hDTTBZZHZPeTBRR1E0aU4zUmtXWFlZUzcyQmdpUFN1ZlQ3?=
 =?utf-8?B?VkU2ZHZyN2k2UXk2c0lzcCs4UFJZK0dqa2Fldnd5dzdGUTFOaW9idjdlbjdn?=
 =?utf-8?B?ZVh4Z04zYlMyaEp0aHB3RVc0TkN0Z25lNlRyUUtPQjBQV1pSdk5TcVI4b3ZB?=
 =?utf-8?B?cS9qUHllSEZlS0FuOGNteFhvanllSDYwb0FDbHFMcklFU2l3LzNnS3lnZncw?=
 =?utf-8?B?eiszRytLeU1JZG9OWjV5ZGNDY0p4NHJyaFZwaER4angzOTlzbnVXdlVuRkx4?=
 =?utf-8?B?dENEVWdkRmIxa0ZBa2FEUWtScDdtYVdGU2RMcWF5a2ZraXFWTHBWbXEweUxj?=
 =?utf-8?B?ckhpM0gwR1E1b3J2MFFrU1E2cUwxU0VmNXVueTJVWG50b1YzUEtZOURjU2g0?=
 =?utf-8?B?L3FwWFp6VVBYaHgrNmh0MVV0Q0R1WVpkWHdDL3FiTXFQN0ZKb1NQcDJLd1ly?=
 =?utf-8?B?MFNpU0VXbFVhOFZHc3IvdkV2T1J5VmZPK0R2SFFzQjVFSEpOazQybGVTdFFm?=
 =?utf-8?B?Z3BHa0ZQQStkZis1a3ZWL3BPbGY2KzEzLzZhRVlyalhFTldJenVyd3JNSWd2?=
 =?utf-8?B?a0xPRzVFWjlaeTZ3b0tLNlpnNzU2dml0bkZyS1dvRGtMaGdHanAxYU9hRkNU?=
 =?utf-8?B?dGNMb2I0QUxmRER1Mms4aTdYejZmUGI0aFZRNzdUUXpJRUNtUW5iK3hkUzcr?=
 =?utf-8?B?dGtXMERRY0RiVWRhSUJoK2xnb0I4NTNweEdKblBJTzN6bGx1c2Rwcys1UnJl?=
 =?utf-8?B?QndkUEh0bm1DQlo4azExWUc4TFhGamc3dFhCVjM0UVZKaGcvQi9ObGtlNmpP?=
 =?utf-8?B?T1hQdkdmYS9lRndrZTRsOHNHbkRzTjRBeS9FMUFtUm1BYkhPSlBQSzljWDJz?=
 =?utf-8?B?UEhsc3Bub2lPVGpMWjhCLzlxT0p0SmZqNTZKa0lHa2NTbkV4Y3kzNk9PSnBK?=
 =?utf-8?B?RThIWWhTOGJtQU5WbUhCVk5TWFR4eFE0NGVCRmI1UGJweC9wQks5clVxbHVV?=
 =?utf-8?B?eXJVQjFBWlBXdUM4ZjZXU2hRYUNzNXNJUkJIU2hZS2trS3JtS3RzTUVXcDVD?=
 =?utf-8?B?aVhXTnZqRzNxYzlYeUIwTUdNTzhpY0ltVmJiekNreHlDbml5cmRpVklGM1pF?=
 =?utf-8?B?c2NTdDlISUFrNFRBd3M0R2xCeXVDR3AxSm02a3MyVDdJVU9RRUFzTVVKcXRM?=
 =?utf-8?B?Qk1nUEUrL2xMbVlRcW9EdEY5UTN6aU1tWTFQMFJpM2s2WUFNS01NNDAvZWhF?=
 =?utf-8?B?NXp1dDdsRFp0YUowb3RVaW1uL0xrR1UrR0UwWDhhUHIzWmdSYzkxTmVxUWVk?=
 =?utf-8?B?QkEvYXA4MGZUbCswbmJ1eFlYQVhFblM2bnErVHAwamJZOG5US3BTNVRzOTda?=
 =?utf-8?B?WmNEZWhHUmliUVEzRVI3QTVxV3NZeWF2SHJ4UDBjS1BSdXR1Ni9nc1ZId2hX?=
 =?utf-8?B?WEMvaWVkb1AreU05ckc2cHVDQmgxa1V1aFdxOGNlalZLWjM3VTlvUnRTdUFn?=
 =?utf-8?B?N00wOWh1RDdMWitiQ2pKbDRXblJDMHFwSVJUczFCYWM1WmYzb0lWZUJTTXVl?=
 =?utf-8?B?TEFncnpndVhicDVFMTBrUDBqclZUbU5CZmhYcE5CbldxRGowN2JvMzA0b05T?=
 =?utf-8?B?V2p0NU5rNFJ0bW5MK25mMytvdGlSR3NQdDFPVVVPQ25obU85aFF0YkQ2cFps?=
 =?utf-8?B?R1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNhN2JlS0NtVkRpVXRIeTJlTnpOQmRQcDZuWVczaTJOa2NrUEVEZnIzVlZz?=
 =?utf-8?B?UWtSR3krdXJDb0FGc3hFRlFMNXJxaUl6Sk44d3FUN09iRmRrN0VRRlQ2MVNk?=
 =?utf-8?B?UEtEN1EyRmJsL1BHWDQxZFpyc0ZWQThRdTBBeHJCMHFLRTR0Qk5mdkxyWUI2?=
 =?utf-8?B?eEJtdFdYRUJWUzFhaWcvOGdweC8yMHp6UUszRkNySzFRYW1UMXd0dlFPMm5h?=
 =?utf-8?B?TGtLYURua1hmL0t3NGRJR2ZYQ1hGQUs2MTlobzVueTFLUnY3aXFuR1VFZUdZ?=
 =?utf-8?B?VHYveHk2Z2RTSm1SUS9YSzlTeUhBZHYwa21IZGZpMUt2SjYrYUMvM2hDc1J5?=
 =?utf-8?B?c2wveEtVZ3M5ZzVCZTB3M1A5STVzVkRWWXMrRlVpK2EyL1pHelRic0hsUzhy?=
 =?utf-8?B?NVdPRUozZWZvK2hGUTV6dlREOHgvWWhsU1pQWEQzTGZLR3AvdTNIRjl2UWla?=
 =?utf-8?B?OEtwS3NtV1FZeW9HYTZhMjcrTkdtelFBS2JiZGVGM1NRVE8rMXZmb2swelRV?=
 =?utf-8?B?d1owVW9XcDVNRU94V3V3N0o2djc3aytmUXc1WTZQR0ZXWHVqZnJpdFRFU0RQ?=
 =?utf-8?B?R3A2RU9EQnIrRitKRWxGaW1MdTgySjhRTW5yRStoYk12OVVxVWdhZEtNKzNp?=
 =?utf-8?B?MmZtNEx4QldWSitqMWh1VW84Y1FPOEJUVWJPa1g2TXU4VTNBMTgyOWVrZHpp?=
 =?utf-8?B?UXBWemRVOERmazBjeUlLK0xIeFZySEgwelVObFhqNlNzN0pML1JFaGNzMnla?=
 =?utf-8?B?U1YrTUl6cXl6aE5Ibkt4TUY1VkhEaFBJbGM5OEtnMmFmMzNYRURMU1poS2x5?=
 =?utf-8?B?MTRNUit0VFJ1ZlRQYjBQc3JDcmc4Mk12VnZJY3hpS2twekFnZWpUV0hYS1R4?=
 =?utf-8?B?TCtObEExZ3ZLdm1TcHBIRitUUTExRlk0cDdFNHVOVVhjTTRuaXdoREIwaGRK?=
 =?utf-8?B?T1cvRXI5cDZsTy9CYjdpdGJpd1FUb204NkN3eGl6MXFNd3lJc1ZwNjc2U0Qw?=
 =?utf-8?B?QjFvWW5jUEdWRVhhMEdIUC9BaExiYVRRVE5keWVXYmxMU2Z4Z1pPcElZT2dR?=
 =?utf-8?B?bGN6akg5Wm9aWFpRcGg0b3lKSkVhRDZjUkoxN04xcDE1TWNLM2NqVlgwYm9H?=
 =?utf-8?B?OUw3bXZkZ1NndGNwVXZnZ1p0SzdkTktlbDduZnE3ZjVpanRoRU81NVF5cit1?=
 =?utf-8?B?NlVqM1c1aFdiUFJxVzgxdDlLWEQyY2VGKzk4TmVzeEFNVXRWZlhmZVJXd1k2?=
 =?utf-8?B?ZXBaMjVFNHprQ2p2R1ltckxDSEdlN2JiM3UweEpkL2JSN2pOV3JYY1hab0FQ?=
 =?utf-8?B?N1d0ZCthUzFleFV6TUJLcU9PY1BoSVBrdmFpR3ExWUJUdzRmTHJZRUhjL2M0?=
 =?utf-8?B?SXJKMUdoUVJlYXExSjJrc2N3NjNwSFI0TGRuMitYTVZTUytJNVFLNnl6RFM3?=
 =?utf-8?B?RllIN1JpNEVCb1hPQjk5VjJEWS9rMWJGWDJER2ZQUC95SE84NUJOdnFkY2k2?=
 =?utf-8?B?K3I1WGFPREQ5dy9lL0xOUmp2V2F5TEVOTUVNUnQ0U2hQRWhqSGxmR1RMcmdK?=
 =?utf-8?B?bXlUbU4yVVQ0VCtuQU9ucHFsa3paZFUxQW9UYVNZUklFWjhPRTArb1pWdDU1?=
 =?utf-8?B?WXFNWXBMcGJyRG4xYVFhMmNwVDBaaFBnZG9ITzhSeUNYUVdseWJUY0grQTBB?=
 =?utf-8?B?dnZPVUlnVXFVbnJEK3puRVpuTE9CY3M0d0pDZmlEU3R3NEt2L0J6VlJuQm1x?=
 =?utf-8?B?ZExNMVh4aDFreW1LRVIwM0xhNlZHVk5rUkFveGRMZExhbUM1T1RzT0pnSTR2?=
 =?utf-8?B?eld4WlRjWFFWaWZKTEtYNWhzbUZzUmh0NUJGdlh3TmZGNlRXMGZpSldyNnlE?=
 =?utf-8?B?OHI3ZzdsNzV0US9TWXh2NVBRdWFTYnBOdVo1NFFLMVd6VC9GWFZSMUtiV09P?=
 =?utf-8?B?VlVLTnBxMUVwaGphUk53WmxrbC9UNkxzTDZiZ2Z0V2lzc1N6bnFSZDYydVc0?=
 =?utf-8?B?OEl4YjU1eHhJeE1NcnlEMW1hV00vRVRBUFdwVjVMcU9ieGR6MVNYNWFrc2pT?=
 =?utf-8?B?aHoyRnlxN0RDRmdIRmZBK1o2ZVY5a0hWOWgxc2gvWFExUlVlbG93QmhUTmp1?=
 =?utf-8?B?WFlGL0x0RXNFK29FU3FVblRpbmZScGFHSGRiMHRrUEdTR3hWOU4raVVxVWVm?=
 =?utf-8?B?V1ZnM1BTaTZkRWMzWFRpdWU0TmZGYVpHTXFjVjNUWkk2WDNVSVgwQmtMQUlr?=
 =?utf-8?B?T3ZsZThvUjQrYXRyQk51dGhGdDgrMXhxMDd4c3oycWNpK1BvYUY2K0F0VkYx?=
 =?utf-8?B?WFhyR0VsaDBKL1F3Lzd5WVpGMzdOeFM5dWMvL1VMTjVwYU9KWjRDUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a565a4-48c6-461e-47dd-08de636869a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 21:08:43.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0GBOo+93wnOaNuqkVvRwziwBDEd8ODdMRtPBWPjn5wCQtBYxfC+ltSVaofvGcz4fE/H1Jwd3l0s+a2XbDSXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
X-OriginatorOrg: intel.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shashank.mahadasyam@sony.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:suresh.b.siddha@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:mingo@elte.hu,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sohil.mehta@intel.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sohil.mehta@intel.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: C5E55DEBF2
X-Rspamd-Action: no action

> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index d93f87f29d03..cc64d61f82cf 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -2456,6 +2456,12 @@ static void lapic_resume(void *data)
>  	if (x2apic_mode) {
>  		__x2apic_enable();
>  	} else {
> +		/*
> +		 * x2apic may have been re-enabled by the
> +		 * firmware on resuming from s2ram
> +		 */
> +		__x2apic_disable();
> +

We should likely only disable x2apic on platforms that support it and
need the disabling. How about?

...
} else {
	/*
	 *
	 */
	if (x2apic_enabled())
		__x2apic_disable();

I considered if an error message should be printed along with this. But,
I am not sure if it can really be called a firmware issue. It's probably
just that newer CPUs might have started defaulting to x2apic on.

Can you specify what platform you are encountering this?



