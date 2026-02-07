Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AD4BJeJhmmOOgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 07 Feb 2026 01:38:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD1104591
	for <lists+xen-devel@lfdr.de>; Sat, 07 Feb 2026 01:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1224049.1531352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voWKa-0007qZ-TH; Sat, 07 Feb 2026 00:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224049.1531352; Sat, 07 Feb 2026 00:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voWKa-0007nm-Pp; Sat, 07 Feb 2026 00:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1224049;
 Sat, 07 Feb 2026 00:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wspJ=AL=intel.com=sohil.mehta@srs-se1.protection.inumbo.net>)
 id 1voWKU-0007ng-Rh
 for xen-devel@lists.xenproject.org; Sat, 07 Feb 2026 00:37:46 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 321b6f6d-03bd-11f1-b161-2bf370ae4941;
 Sat, 07 Feb 2026 01:37:36 +0100 (CET)
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 16:37:34 -0800
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 16:37:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 16:37:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 16:37:33 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 16:37:33 -0800
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Sat, 7 Feb
 2026 00:37:29 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9587.010; Sat, 7 Feb 2026
 00:37:29 +0000
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
X-Inumbo-ID: 321b6f6d-03bd-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770424657; x=1801960657;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zNSkSTahWoRNSo/iSDo76F6cClLlavuEpCmaKOlEdKs=;
  b=KVu137S401pAcbIWCITRQrP7AlCQmWBDEncQF52Uy/EgteuBALZcmjDu
   mpaUdpZCRq/zkXWY4i0Xn8+GSXbpvF8QtoT8dV7+tJe9a29pVmEk42azv
   +iFOThohH3FYm+xpOZUu7Y83JJ0mv8jdJekUufEy3D3c0U0N85n5c/8wL
   uat57HrTaZwC27vvUw3fb1bMRkaHbLSEwTcBAoSui/nFQPQjj4U+G789h
   ruB+v9lRxDR5XOc+1TBMzgYGgCc7CnPZdjavI6j5rE4wzoBeStmcfIbjh
   XKpK36JE2+3oNOd8LDifB6rZiIrEhznduc/mLOAni4DvKItmqn4lIwmpv
   w==;
X-CSE-ConnectionGUID: d8QmFPKAR3q9fPGQZQfJ4g==
X-CSE-MsgGUID: +L9BoR9tRziv9lkiio7z9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71536925"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71536925"
X-CSE-ConnectionGUID: Oe/yXzCtR9ayFQjvTB820A==
X-CSE-MsgGUID: 3YLLhuDGSu6a+Irw8GEIhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="241395661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBl+ZuEfVO87KAC2dBSE2G+7DSrDqMcvwe0xGKQrU9tu84rp3BROy8PS0gWXQeTR9e0B72eu0bWUJIRlTzgeCJMSy9llVaZ24+kHwY/FYen2lLan9CszokXwkHfT9HkZrQhTcy0WX7VmlRAFWBXYWYX/Yj7cNcZU5vFHlMPvG6Lwrbkw6Z+AJmRwvo0LdZ2j3eyJWcXHLK7Xg/5w9Cm8/GzVaqKCQCPBtQHlkjpEySj0L+FpJxdIe3q/ntqTYB4ZJvh9X2q5/NFF8E4SVxjIcy2QML64XsO5VJsghffv8JvKSFJwvN613BpFPT3VJeJZS9a2vCtFGQds2NnKTbClKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9CZL3CkEkb3f0oMDkwW7ENiSMqLkOjG9Ju6lugk40Q=;
 b=OgCjFGXmdCdk8/F08ynhCOaTXUOhobqvtJ90aGFuuBIxTsPvHRbAoRvROWlXy2LwY51+KmMdxDZbEr7tKrLyx/iID1Q5X0bdRM0RoGu7HdvX1G0wfUjrmCf5gaCvN8R3L4JuujCycaoYsXRmTcq/ds4ObWIQBse1c1crgg45cLjiFS6DmW+OqAp0sTBEobef6Quy9X1txfd0RNPweJCIJz0rYnNM2ernGg7Ewy1OjSLH9loDuBDiANQejuRv+T0ZQUOJ2kisJB3Z7KXdTJn+aEIIseGcb8oFrH2rOn5TSs3VhmccBJs0DEhuhiNfUhbWvEqdgQJs/C3vpAa8/MZNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <cd6b866c-f871-472e-9c00-3228a2f06c25@intel.com>
Date: Fri, 6 Feb 2026 16:37:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel
 expects so
Content-Language: en-US
To: Shashank Balaji <shashank.mahadasyam@sony.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Suresh Siddha
	<suresh.b.siddha@intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, "Haiyang
 Zhang" <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
	<decui@microsoft.com>, Long Li <longli@microsoft.com>, Ajay Kaher
	<ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@elte.hu>,
	<linux-kernel@vger.kernel.org>, <linux-hyperv@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <jailhouse-dev@googlegroups.com>,
	<kvm@vger.kernel.org>, <xen-devel@lists.xenproject.org>, Rahul Bukte
	<rahul.bukte@sony.com>, Daniel Palmer <daniel.palmer@sony.com>, Tim Bird
	<tim.bird@sony.com>, <stable@vger.kernel.org>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
 <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
 <0149c37d-7065-4c72-ab56-4cea1a6c15d0@intel.com>
 <aYMOqXTYMJ_IlEFA@JPC00244420>
 <722b53a7-7560-4a1b-ab26-73eeed3dffa5@intel.com>
 <aYQzhRN83rJx6DSb@JPC00244420>
 <e5ac3272-795b-488c-b767-290fd50f2105@intel.com>
 <aYWs-wvDuS53BHMe@JPC00244420>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <aYWs-wvDuS53BHMe@JPC00244420>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|IA3PR11MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 102c622a-490f-4cd8-9e31-08de65e112ec
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek9uT1V2YjV2N004MGF2eG5SSng5WjNxNXY5eld1OUNMVUtNQjRNTzEwYWFO?=
 =?utf-8?B?K0dnY3lSQ3F3NitZQWl6QkJvTWpBdmlSUkxjWDhYVnIzL3d4dGs0b3JCamVj?=
 =?utf-8?B?TCtYME9GVDdrbWtURzhPRzd3b1pZK2xwMTk0Z2dHcmJrZ1ZqTUNpRUh0WHVR?=
 =?utf-8?B?T3orVEZRc3phNk9zcFBuZkE1VHFIRy9sNXRKZkRaaUd6dFNqRFNKNkpZWndD?=
 =?utf-8?B?R3BHZTJvYkJXRmZUc1Q5VWFudytqR2R1Um9rSVAvaG9oYTVCOE9oNUZQOVJl?=
 =?utf-8?B?QVRMQ3RyTFIyZ3lKNGpYSE5UZWltRFErckQyaDJTaHJ0ZmJidW9md3NkTVNy?=
 =?utf-8?B?a21pMGtWeThoNTdtajdSRG5rUk5qWGlFRmhFMFZCcWVRVlk5ZDRCTnp4YXFR?=
 =?utf-8?B?QmZ1OWY4NFkzMXhiRGFYckNrVndSSjFiZnVESTV3dFZmWFc5OXZnL2lNNGZT?=
 =?utf-8?B?OG9zV2VBNEoxU3ZDVEYzVFFSajlma1pZWnoxRGZhMWtOTVljZ0o3RFFiOEdS?=
 =?utf-8?B?bTZvVU1rbnJOK3o2cktaQnNQa28wWk9IRHEzOGVkUHFUYjl2ZjE0emVLZ2hE?=
 =?utf-8?B?NWJnemhNZ0xHRWtmQzZROFZTb3Q3YVNxWkxhNEY0TlYvSEFwRTBqeTIwZWdl?=
 =?utf-8?B?WmtTcVllTFRxbmwxOXUrVXgrSG0zTGZvdUN5L0tyRUkwTGNkdmx4L0ExbFNq?=
 =?utf-8?B?MmRjVXJaOFJyZysrazRzeE8wa0VTclhqaDRKclVFa2o3VVNTOEhyVWliaHo1?=
 =?utf-8?B?ZnFycGRza3JDdno3akhzM2ZMT0ZoaTZ0azQ0N0E5eVBXNXBlWEdTVXIwRWJ4?=
 =?utf-8?B?Yi9ZRWd4MDJWVUw4SEF1TkM4T0ZLVDU3Y1Q4bkJCc2s1dzFPbHFZSHVBT01w?=
 =?utf-8?B?d3N6VEtxRXNyT2hhRE9yV29oMU1Qb0d5Q1EvSWF4RnN0ckE5ZTJ0WDJJS1dJ?=
 =?utf-8?B?ZXFyODlpZ2libzdCNU5kek41Ym9LdUF3RnJWNVhnd0x3dmZqZ2FtclFDQmpI?=
 =?utf-8?B?cEg2eEE1bzFaejl2VkJtSXNVbXQ3QUF3cXBhZkhXUFgyVUl3MEpSdWcxWWZD?=
 =?utf-8?B?YWt4Wm5DSVpiZ3lkeEpuT0h0c2JJeHZEWnFUNk9kTlRNc3QvSlBZUHE1SWtW?=
 =?utf-8?B?YVFjK0dYcWtncjFYZlQ4OXhvNWhIeDhzVUx5QjRGck9WSWZ3cnllQ1hodWYx?=
 =?utf-8?B?cWltbGpPQlNrVmM3S3NERnhBRUgvNmtkZ0EzRjNQS0k0NTR2TTFodytaaC8v?=
 =?utf-8?B?ZXJCRjFIaXVYSUdkZXBVRHBTM3NWMDlQZUxzYVJpbHFXVEU0QVRkR1gxRkgr?=
 =?utf-8?B?T2dxeitMRnZHbThjYXJVYTZ5SW5mQkVVVnJ6RWJ0Y0MveFNJcWg1N1BHMGJs?=
 =?utf-8?B?a29UQ29iYitDeld0V1hKNWtqQ2RFRGNMM2RFQ2cxVHVtL3pKUWVaOUxyN2pE?=
 =?utf-8?B?NWhJMmI4bk9oczl4Yk9hWDZaNGcxck5vNUFLcS9QdkVtWHVndTkzZDZpYkp0?=
 =?utf-8?B?VnFkNXM1MnBTOHdLaVZLMUVXeUJUc2RCY2UyTVJ6OFEvaXdhQUllN2o1SzFW?=
 =?utf-8?B?cVZvVW5peFNsN3RuSW8wVG05T2FmMTZwU25jUGIyVWU1SG9BZW9tWHFQelk4?=
 =?utf-8?B?TjVjcVFNQjVZdzVPZmc3bTRvRGQzTEEvQXVXSG9UM2ZrcmY4YWFaTDZQWkZB?=
 =?utf-8?B?WVZzM2ROVGhUMHA3TmZwbWxHZm81N0ZSN3JPMG03OFExRWFaZVQ5cUhOSGxC?=
 =?utf-8?B?cDNhTlc0WjJNRlREdWE4YUNVcHVrUStYT1gyaXArd2tzNjBlN0t3Q0g0RVRK?=
 =?utf-8?B?RytoUkNnRjB1SmxiTTVTc3pocXExT29aOUcvVEdzVUpra28raGEyVjBvZk5B?=
 =?utf-8?B?MTFZNXFFUy84K2o4QkdwdkhrMkRua0dQM0dRSDBvdUlKajNIY2JOY3MwTDFj?=
 =?utf-8?B?N0hjMHJJajhnYW1JL0JmY09BQ1VKS1hEalRkNFo1K2IwS3FuWWY2eXE0ZjJz?=
 =?utf-8?B?UDlOZWpYRURwUk1pWWkvVjlDazZSYjNKdXN5QytuZDVDNlRCMGFxREhOLzVO?=
 =?utf-8?B?bS9ZV1ZReXdpSEFxcXFGb2p3amJFTEVjVDhEaGxCWkJHZS93eXFZVDdZanlu?=
 =?utf-8?Q?bSJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUUzZGI1aWd0RmpYMWtlelAveDZ1bk1jYVhueTlNUTMvL05zTEZIVlNDOTE2?=
 =?utf-8?B?a25LTkVEeGcrQ2tLNllFb2ZLQ21hRnY4TURWcDhVRXZvUjBrYUY3ZXdUTUFh?=
 =?utf-8?B?eHVqT3hWOWVVbE5qQ2lZYUhoZWZ3dG8rMU9yTGl4TVBrWlFrYkhORlhIaHMy?=
 =?utf-8?B?RmNBUFlwM3g4SHR6RmpNa205T0M4R1N2U3kwNU52UUkzZS9UUDZSaVNqVFhR?=
 =?utf-8?B?dFoyUEZnZGdnZDl3cUtmUVU5R0FDcXowNzhLZmlldGtzVVhNVHk3VUdRSG1N?=
 =?utf-8?B?V1d3a1JSVEFhcTJJd0YxUzArS3F6TkRra21mR20ycUJLOWxpbFBOVHAySklt?=
 =?utf-8?B?Vm96Slcrb0wvUFFyL2FpMTNNRHVxekR5bngyYUdSRmwyT0FBa1dIQmZ0NjUy?=
 =?utf-8?B?Mis2M1BuQ2g1aUYvOFhIL3JzdytVVC9oUjVxTFEvcWg3aXNMVVN0Q0NmL3Fs?=
 =?utf-8?B?VEtHajBFdkpMQ1JqdlJHbGxjdnVpM2VKbXp4VFdlYTJGZVFoYXo3NUI3aWZ0?=
 =?utf-8?B?aTYwak92NUtJWEQwTkFUSkx1S01EV0YvN0VDS3NpRVJmWXNtcmlpd2NlMDhp?=
 =?utf-8?B?Sm84VHgvaUlIRXZHSDR6dDc2VThsWHFoSkU5WmplQzRQTWZPc3ZWSEZHSnNt?=
 =?utf-8?B?TDU4YXE3MmZsdnE0ekRoUjY5OURxeG1YTFJEMWgrdytqd0xsZHI2V3A1OFZo?=
 =?utf-8?B?QkJPUUFIOWlxOGxuL3psY2t1RjBUWFZxTFZEWTdubTZsMDJaQTdhSUd5dnFR?=
 =?utf-8?B?MG03LzJoY1EyRXJHeFM5azVPUmUwcTVCUGdZckJkdXFrb1NsOWc1NnVnaklU?=
 =?utf-8?B?SkhaT1d6aFNQRjFzVC9wWUNvU1NqNG5NdjVXMUhMWnN3Ukl5dm1DdXZEaGsw?=
 =?utf-8?B?ekVBOEJMU3gvK1hCTTBZelZ5enlTYy9WMURsUzJBUWVFTU9HTS9YTzRRbytw?=
 =?utf-8?B?Ti9HOGI0aVd5dzhGNS9WTzZtQlJWSmljM1NJYkFtM012L0oyU2VOZGg5QVBq?=
 =?utf-8?B?SG1kYnRYM0ZLOEQ2WFVWZ3BNcHVoZERQTnN3SS9MUm1rREVlVGJ6VnRGNlBj?=
 =?utf-8?B?QkdxQU5nMTVpYm1CUXBIRFlsZkhwTzBiV0JDNklhT3JUSVlIbVlLYkh0NkVa?=
 =?utf-8?B?cjlCMWgzbGlyWE83c0haV1VqNjkrN21ZZjRMTWZiOVNLZUVqdGZPa1lkMGUw?=
 =?utf-8?B?eEJlZmo2eUN1NWRNd0xmaHR0RTE5SlNsQjR0OVZSWVN0MmRNeElwQkZPUDZO?=
 =?utf-8?B?a3M0YVBiT1FLQnlKaUJrWStFbkpqZkFJSVg3Wk1Jelp4Q3FmdWZmMWN2TW4w?=
 =?utf-8?B?aGViK0FzdUp2aGtPcko0cHUwOXRjbFlFb2JzWXdLV1VuVVFvcUtVdjkzakxL?=
 =?utf-8?B?VVg3amFRZC9taDVsY1hyRzBiMjIxeVRqdU1KdXBGVUlwa1lGeVYyRm9VYlhF?=
 =?utf-8?B?clFlUnlGaW9FMWovbjMyNTlBelV4clhTRjB6ZEJJVExyTUdERUo2aEo2ckZK?=
 =?utf-8?B?UFRwNDVpci9Xb1BtU0JpVy9jV1NQL1g3a0RpbWdlWHZYTk9hM0NHOG44bHQ0?=
 =?utf-8?B?QU8xTGJtU0p2UnJRQXVkTE5lZWlHSmN6SHF4K1dMem5OQUVVM3dYU1NCMHA4?=
 =?utf-8?B?dGRZVTJleGMxMGo0RStHMmFqVTVoRXpzeWtrYnpPMUhIN245aG52T2VHbmNN?=
 =?utf-8?B?UVdlWFFQeHpsU2hrbXFIa3BtSE9sLzVodGF2akNQT2MzV203NngrTHlsSmRt?=
 =?utf-8?B?R05NaVRtN1Fmbmh6NmJRSS9CQVBMbUpQbyszSXpmeVVjRi82MUtWemNadXhZ?=
 =?utf-8?B?OE9CSG1pYkVLVFI1RVk5Q2lGR3NZQ2M1WGNPZkRvWjROWjROWXNiSkdEalJj?=
 =?utf-8?B?U1k5bHlPRTRFak8zUDh4S3JtQ05XVGszQ1ZFWWtwSHBqaEJ2bEJzZC96MWUx?=
 =?utf-8?B?WHVnQzd6NHdtVU5IanlzVGkyNEE4WGxsK2JaTHM0ektJQTFqVTBDQVNIWnlE?=
 =?utf-8?B?Y2JBT2JFU3FyM3llbmc0b0x5RlJFRzZwZ2lqZFh1SW1OT2FVdkl2TWNweUtR?=
 =?utf-8?B?SjMvbHhwdEVTalh1bXZCaHBVc3lZT3hMSklzU25Ydko0eUYvNWZaeFU2K2d1?=
 =?utf-8?B?bHpmd2VBaVFUUjkyYVAxYWZMcUZLaXFlMDNYMWZOZ1NNdlJrUjcyWFBpRHVD?=
 =?utf-8?B?UTdkNk1Hc3NYa3RWNktqRlRXdUE5WGJmdVAzUCtVUG9HVWZHMkRRU256V21o?=
 =?utf-8?B?dTRwbWNYMFJxWnRidW94Ym1MQTljS2FsdFNZaVU0SGdpKzZGYmxiK2U1cGlY?=
 =?utf-8?B?dmtjSVA2Z0NKdGtvK0xJSnBWcm9EcEwvSXgzNzRaYkp5T3oyWitzQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 102c622a-490f-4cd8-9e31-08de65e112ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 00:37:29.4584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCeQcFNLjroZjEpSnA5O3LegZ6mXkjYoDmLCqMR6szkEcYZ6tOsUCuQGcsvyTL9H2AnTEQBNDGzX1UCxPv9qTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 48DD1104591
X-Rspamd-Action: no action

On 2/6/2026 12:57 AM, Shashank Balaji wrote:
> On Thu, Feb 05, 2026 at 03:18:58PM -0800, Sohil Mehta wrote:
>> On 2/4/2026 10:07 PM, Shashank Balaji wrote:
>>> On Wed, Feb 04, 2026 at 10:53:28AM -0800, Sohil Mehta wrote:
>>
>>>> It's a bit odd then that the firmware chooses to enable x2apic without
>>>> the OS requesting it.
>>>
>>> Well, the firmware has a setting saying "Enable x2apic", which was
>>> enabled. So it did what the setting says
>>>
>>

I still think the firmware behavior is flawed. Some confusion
originates from the option "Enable x2apic". Based on just these two
words, the behavior seems highly ambiguous. I interpret it to mean "Make
the x2apic feature available to the kernel". Then it is up to the kernel
whether it decides to use it.

If the intention of the BIOS option is to automatically/always enable
x2apic then there is an architectural way to do it. It can set the bits
that track to x2apic_hw_locked(). But, doing it this way during resume
(behind OS's back) is unexpected.

>>
>> pr_warn_once("x2apic unexpectedly re-enabled by the firmware during
>> resume.\n");
> 
> At least as per the spec, it's not something the firmware needs to fix,
> and it's not unexpected re-enablement.
> 
> Am I missing something?
> 
> But it _is_ surprising that this bug went unnoticed for so long :)


Maybe this BIOS option isn't typically found in a production firmware. I
think it would be preferable to have the pr_warn_once() but I won't push
super hard for it due to the unclear information.

Whatever you choose for v2, can you please briefly describe the
ambiguity in the commit message? It would help other reviewers provide
better insight and be handy if we ever need to come back to this.




