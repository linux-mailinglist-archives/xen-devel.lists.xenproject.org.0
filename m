Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB9WN4fAgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:19:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921ECE190
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218696.1527538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvhU-0004BL-Mk; Mon, 02 Feb 2026 15:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218696.1527538; Mon, 02 Feb 2026 15:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvhU-00049r-JT; Mon, 02 Feb 2026 15:18:52 +0000
Received: by outflank-mailman (input) for mailman id 1218696;
 Mon, 02 Feb 2026 15:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmvhT-00049l-JW
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 15:18:51 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 782d5865-004a-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 16:18:48 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB6108.namprd03.prod.outlook.com (2603:10b6:408:11d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:18:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:18:44 +0000
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
X-Inumbo-ID: 782d5865-004a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvhTlS3rjv85Mr30U7Jc4+MrKVZ6Ay/H5AHaQAuumj59esKStmwfTI/ZO0Hd3xa1A3EZow/Y5AWcy7HU/cJlQo1oJL5XIWLMHav5r7t5N1axcc6jBCYUk5gBEGSibVeTB4/5BCeCgN0qsxOg/lHDxJVKqpXrbbR9fqY1IykkRUMdD+s/5LYF+SGbiOpqW6F/aGZkSQaKk4eE65W/dA+CkhUpJpv2NXPoM8x4se1JvBQxd745yaJoKUwBlaPh5mOLm1FGe7rsRdglf68gYViPFbCDzBUfA07kmT6l/YwvnMDpFYkGPld0qdcLemEEYjfvfR8vAOFt1+JuKNPPH77IXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTCf1s19dQa2QQm1tQwLDxuwlEm+dg3ONfdc9jx7KwE=;
 b=f77cMJ48w4KJrCfHs9G67tQFxrJ+VJI/OHmFm3+VX7KD+k3fZU34qWXO+vgxozbqAt2QU2jGEndHYZppFA+yf3jri5Grr5fVoidWaDUG4OgQSs227Cb+9q+AUR4LuZRjIlL5EQ957XWP2XEvq9VDYVy064qPd4AMSKcqQnt20VPPXN667uHBomTvb3X+1IFTp0obyJKUQNo0KoGce5jdKeE2FIAlDmwjH2f3UWaRC2iPh+pCqVgys3BqhTteXQCrRlVJfF5BB3NkFMBc1YYczt+D0FOF2LaEn2ptHyhQNXNGSx8fYsCLJ/Np1AAmzWFF6g94j8eccGhktDcFvnX5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTCf1s19dQa2QQm1tQwLDxuwlEm+dg3ONfdc9jx7KwE=;
 b=QPGsl4dgO7d3/zqBSgQ1kGqafTmNE2SJBP0usLkzpoOaJELuRkX46rt3oHO2NZdSWabYfiZQ4ack031UWQJ3meYlse565rHfIsVTj9C6roiGpLoK0E1n7XFnN40GiiNSZRCp9NBVQCrGDZr4lb+2KUrmLMOr6IgV8GgDsx1zhuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 16:18:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
Message-ID: <aYDAUCVdk_2qGa-r@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
 <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com>
 <aYBq2EoeP_TGv_sK@Mac.lan>
 <1bcdd2dd-9b2b-4eb2-a569-e28b03c1e1fb@suse.com>
 <aYB4z8CSA590Ytpo@Mac.lan>
 <da490e92-c8b1-40b3-83ca-ad77dc2defe8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da490e92-c8b1-40b3-83ca-ad77dc2defe8@suse.com>
X-ClientProxiedBy: MR1P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::33) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 16368669-75b2-4e13-fbc0-08de626e5afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWowQzZ0Vzl2emE2V3haR1BjVEtwZkszemUwRTBDblJZYmVsY0sxcko2ZlNY?=
 =?utf-8?B?RW1jYjdXSkhHRGpvZlBVLyt5dmFUNU80OUVUeDgxM0xUYW9FSHViVXJ5WkNk?=
 =?utf-8?B?d3JvMlI4OGhiNDI4QXIvYmphTHNwZzlJTHRzbzhUcmVvdlRzNkdLRW10SDd5?=
 =?utf-8?B?RElaei9jaG5EWmxwQ0d5U3RnTFR2ckVyazUrNnNZT1BNZ3VFK0tuVFR3Zjlq?=
 =?utf-8?B?b3RmSGUrRXJCUWpWamQxUGZHbGVpOTE2SHdnUDgwY2drK0tPamlUUnp1WWZS?=
 =?utf-8?B?Q3VwbWNwOFM0SmlQMi94cUgyVnBuS1ViZDVtcC9XK2Y0M1l2dzJUR3lIRGFN?=
 =?utf-8?B?WnljM0FSMWNnWGpHSkxwaGc4TzJEdUxzTFBLU3hNdzdta1p4MkhFa0t3NDln?=
 =?utf-8?B?UFlUQ1oxbzZyTzJUZ0ZNNlZSbENKUXdCZGgySlhTN3FhaWxzWVhOblJtMUlZ?=
 =?utf-8?B?aXJMYlRsUnFhc0h1Y1M2Y0NWZlVSRlI2dUEvR2dheHVEMTFnVGtSeG1FWlg0?=
 =?utf-8?B?RnlqMlVUUTFIYTc0dmxXb3ZSMDArWTRoaCtYbG5hTkhBTGNLdmQ4cUVaVG1v?=
 =?utf-8?B?TkVkSXFmQm9OMFdWcXFocmZhMHdVTU15bFRHSTdtVU14SktHbmtmNndsVmJV?=
 =?utf-8?B?Qk9Nc2dYUFF1ekVMSmFwcmlpc09oc04xd25CcXZBdmNOdnU0bi9VNVQ1c1Mx?=
 =?utf-8?B?WUEwektVdHZLRWtDVW1NNUJGd2xUSmp2MFZmZXFobHVwUVFOais1WHd6QlBV?=
 =?utf-8?B?S09UTldMNFJOR0FtZW5hYnNncC9jQ3BsT2p0QkZaUFJJaW13VWxhVlBpeTc2?=
 =?utf-8?B?Q25KRXlaTnNJRHV5NHc0ZTVXK2dMZXpUYk1kbFdHajM2SU9kOUhjeittKzFj?=
 =?utf-8?B?RWlpQnpGRWdGR3drV3Jzd3pkSkdpQkF1a0tNNVQrQ1RVb0t1UjYzcTZSeGhz?=
 =?utf-8?B?N1ByRVdzNFpTMHJaVmt4aHBhSzE5anp3akdvWllSRHlmLysyL1BoK0k3Y2tu?=
 =?utf-8?B?WW5Id0NqekhKNnpRZm00SThjNzR2Ykx5MHJBME9ORTl2QXI3ZXUzSkRQclVR?=
 =?utf-8?B?Q3g0dGg5b2ViZnlqWDl6Q3dHS1JWbnJ6ZkhGWFJqazhVM3VueFRKMlU4ZFNs?=
 =?utf-8?B?eVdOdk94aDJLS1dmbFczNlNLbmxmQ296R2N1aEMzb0djRzRkTFBxaklucUxB?=
 =?utf-8?B?bFFINW5PbjFXM3UvcUovVkxJVWR1ZnNDSTRpaFBMSkFQNlRxRVRBQ1BiUXo5?=
 =?utf-8?B?aGdrZ0tISVhvOGZLUmRCTERNdG5tb3VYaU5ZT05oTWtNUWZQaFBkR0p5YVNN?=
 =?utf-8?B?SFFZU3hPM05nMFRidUtPdmxJRmRJUEFyK0tjUWNyS1pGNmhhUGlPMGc2MEtI?=
 =?utf-8?B?U0t5WnQ0ajVtVml2a0RsemI2ZFhzaWVjbjlodXVrVS9aSWZOVkV0YkM3VjVx?=
 =?utf-8?B?akVOZDF1aVExcEpleHY5VEYwYWExbGk5MHJRNnRLZ0V3eEVVWGtYNEszdGlt?=
 =?utf-8?B?M3JVNEZHRSttQ3ZBajA3V3NsRW1LT0tOeWVkY1hNRmMrRFhGVFZPa1hCYTMy?=
 =?utf-8?B?Y3JPRmNZSUJnU092WGYwSk5qcy8reEZ0VzkweEtsSGN6dEk2Y0JxeHRFeHIz?=
 =?utf-8?B?ZzdaTUlxNWJGYkl4R25VcytLTDNBU3VhNmZmZTdCQWFPeFhUdE56VTVHK09F?=
 =?utf-8?B?NUhOSWUxTkFhQmhFbXhkRWdBajV2TW0zdngvUHJHWmQ4bmdLQytMcnN5OHVD?=
 =?utf-8?B?MWNoUkVJUHhPZ2tMVEtyQ3VZa0h0dzVkM0k5Q0x0T0dSbTNvV0lCalZHenNZ?=
 =?utf-8?B?M1FqQkVpU0N4dUVsUjhsNjVPNlZUQUFKa2drRFRJeitUd0NISUxGQVUybm5D?=
 =?utf-8?B?SWhTaXB1WEs4bGN4T1djZ21KN0lZRVJJVzIrWEhleExkaXFmSXVMSjBLQ3pU?=
 =?utf-8?B?bUxBMXJoNjhGbFdKUmp5WVJXU3hERGJHRmpCZUpJbVdSMlM3aUQ2cytZRmpn?=
 =?utf-8?B?K2JZRHRvalJsZndWeWJCalB0WENNVVpQNHVNRFRPNGFnZVlMdkg1Tzlqc1FC?=
 =?utf-8?B?bGd5cTcyK0pVV0l3V1p0WGVibTRHcjBJdzJzL0NPdXdwUXBlYStLZGl5NG9w?=
 =?utf-8?Q?c62A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJrRE9heHpyMlVxeDRTcS9WdWM5WkJLZlFYRVMzT2owZ1B2K2NBLzlaMHNY?=
 =?utf-8?B?TlNVbXJ0V0tOTXdINjRVVTh4OWN5dlpINXNsK2ZTRUFSSldVaHlCOEVRYWt6?=
 =?utf-8?B?c0JxYVdUaC9ibXZmSUdlUnIrQTJQZG9vMWZqN1kyam00RkZnWnlqYllyeXZY?=
 =?utf-8?B?SXpxa1ZtK3NuelZocUxFVnJEQ3dNc2FYcnpOR0dPZEFuY01ydk9DZG1NcGRO?=
 =?utf-8?B?WVgvQk1tb0NURmNRbW1NYXVlNTJpcjRXUHU1bGtaaERORXprdjN4RHpRS1gw?=
 =?utf-8?B?b1U2TmNOMmlqWkdzVGVIWU0zakpYL0pmUWNodlVySkhiK25ZY1FIcURTajJ4?=
 =?utf-8?B?Ylg5YStGcVV5MHBGTTI4VlhSN2JVTDIrZXFSTUM3TVhPN3pnZVNmamdJMFly?=
 =?utf-8?B?eVEvM3N1NDA2Q1FTN0k0Njg1dXRjY3pWL1hiY3BNdXBoc2VIWEFYVXJ2YVNj?=
 =?utf-8?B?L3g1U2xQK3ZVRjkxdDBxdXp0aWJNMlE1eE1WTDdGc0FmWmNwRGo4cHdMdWl2?=
 =?utf-8?B?dU9xZmdaWEI0cy96NWdUMXM0RzNVR1JWcEVrUjh3OGl6eGtvb0FWOUNXc25S?=
 =?utf-8?B?aUd6WFI1SW1KZjM3a2VmMi9xbzd1eno2eXRZZTNKZUd3RUZndnhJKzlZY3Bk?=
 =?utf-8?B?ZXluMExseUJYUkVDTUFjbUxqY0tJMVhRMWVibXpOV0ljTWI4Q2NWVStHL3Bm?=
 =?utf-8?B?VVpOTXdSKzlnUzMwU1dKQ2NqK3FWQXhjU3JUaCs5WUJUQ0I1YlhFTk9EajNn?=
 =?utf-8?B?VjE1SjJFbE9HUzZvWFJmeGtSWURKaC8xUlE0ditpcWVScHFXck1US2dyTEdH?=
 =?utf-8?B?VkowVWFtQVdxY3NkWUUxYytPdFdZdDE2bUtCaEF4Y3k1TisrSzJoV2s3UXlM?=
 =?utf-8?B?Rms4R1BQNmJmOExHcmxMMHR5WmJKaVFrc2MyVnMwMk9hWVExUjhXTlMyMGtZ?=
 =?utf-8?B?elhxWWZ0aTZ1OEpzTDZnQXhZbUs1aVNWcm5KSzQ5cDR6Nnp4MjlvbnNYMExE?=
 =?utf-8?B?NDRaQ0pzam5WK0RsR1JBdDlRZzY4bVFLSXNwMzRkNW9LYXlHRzJjc2l1OE5S?=
 =?utf-8?B?VjNpb0tINUE0Rk1wYWZGaFVCbXhhSGpTN1VwWTFRVVBPdVJaay90Q1lSNWdO?=
 =?utf-8?B?dUtKZkVKb1VveEFaNHdJcE1pVGl2UU90ZXJXZVhvb1B0Um1TN3NzMTZ2cDcv?=
 =?utf-8?B?WVlzb3k1UlRKMDhRT3BxK2dMLzRybVh4dlptVXRBYnlKZUxCaDZYbkZHa0g2?=
 =?utf-8?B?OVZiMWNEV0xjSEZocWVJU0RDbnFXV2pPVUxpU3p5NTQzL0Y1YVV2WmV4OGdk?=
 =?utf-8?B?WU5UTUdxY3h6Q3dQdTN6bzAyUnVFbWNqa0M1U01wNllmanJuZDh2VEorWGNW?=
 =?utf-8?B?SUhhbE1CUlppWGtRMy9FR0E5dU9Nb0hpbE83VnJFZThmamZIVEs1Y2Y2d0lT?=
 =?utf-8?B?cHJOTmtPMXFZTmFIVCtTaFhhalRYa3BqbktKWWNBMEpPSlhIdzRWbkduQ2R1?=
 =?utf-8?B?a21rQ3lqUS8vRVBRY2N3Y1dzQmtHZU9kVC9lSTBpRGRoNzlXTExSbVlnWkU4?=
 =?utf-8?B?VFo3YWlyVUNicXptT2pvMzJMMmhZRVJYVE85bkt2TGRMSTE3eno0RlI0V2Jt?=
 =?utf-8?B?UjQvM3lPRHBGdEtpeU51RXdPbVJIOW9wMmUrSFA3WHFGaDFYbnJHYmZkb3Jh?=
 =?utf-8?B?cHJyRnUxQXQxdnMxRVBjMStrMjNPMmg1SExDQ0dPRFc0cktCZERsdk9zVW5l?=
 =?utf-8?B?MXkyOElzTWFMelFRMlN1ejl4VFBJMXF6UkVDV0xvaXVVbEgxUVFaZG01alJ0?=
 =?utf-8?B?UGI4K3ovYS9SR0xqdkFXUTVvYklGeDJEQzNSZld4eG01OXFTVk1lMWhKajZw?=
 =?utf-8?B?YzBqUVM0R2g0dUNMZFdrUDBEMnlHLzRybnZuNGgwWmI2bDN2aENLcXoxM2hY?=
 =?utf-8?B?VFRTdit5Wlh5cmlwZys0Wm1TUmo0ZnBybHZWZURWWFoydGdJdEFadjl1Y2sr?=
 =?utf-8?B?dUZueDY2U3hpYTF3RGZXTkNlQlovSHRlUnphZVZRejByckhUTE14WW95OURn?=
 =?utf-8?B?T3J4VzZlNWg2QTlPeTYxSmp0cmNCOVBCZjlrNlpwMXRseFRGcU43YWRON3lH?=
 =?utf-8?B?aC9PVWVoZGpWYnRpNnU2Qk1tUU9yb0VkWXU1dWhZMGF0ZkhqK3c3aHBTM2lN?=
 =?utf-8?B?aDFmakM2WXAzRE1HM3hzVmpuWU5BZ3dETDJ4VVNRVEo2OFJ4T3AzZnZReTRV?=
 =?utf-8?B?VGpvZisrUnE3T3NtazI3aGlzVmpnTEdJUWc0Q0R2dWJPVjJRZkphY1F3Znp0?=
 =?utf-8?B?djl0TWFiQnltT0loZ0pKeFpGckczUlpoUnZvT2lDUmNvQ29TQ1lJQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16368669-75b2-4e13-fbc0-08de626e5afd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:18:44.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJeWcw3LtHzpFmuOrEVhIATZavAeZiOg3+E31JvWCUS2wP6sKBY4JZMKaeVTyyPtODYIui3neSu9Vz5Nna7fcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6108
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3921ECE190
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:40:39PM +0100, Jan Beulich wrote:
> On 02.02.2026 11:13, Roger Pau Monné wrote:
> > On Mon, Feb 02, 2026 at 10:30:29AM +0100, Jan Beulich wrote:
> >> On 02.02.2026 10:14, Roger Pau Monné wrote:
> >>> On Mon, Feb 02, 2026 at 09:51:18AM +0100, Jan Beulich wrote:
> >>>> On 29.01.2026 14:10, Jan Beulich wrote:
> >>>>> @@ -160,10 +161,13 @@ int pci_mmcfg_arch_enable(unsigned int i
> >>>>>      return 0;
> >>>>>  }
> >>>>>  
> >>>>> -void pci_mmcfg_arch_disable(unsigned int idx)
> >>>>> +int pci_mmcfg_arch_disable(unsigned int idx)
> >>>>>  {
> >>>>>      const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
> >>>>>  
> >>>>> +    if ( !pci_mmcfg_virt[idx].virt )
> >>>>> +        return 1;
> >>>>
> >>>> Afaict this is what causes CI (adl-*) to say no here:
> >>>>
> >>>> (XEN) [    4.132689] PCI: Using MCFG for segment 0000 bus 00-ff
> >>>> (XEN) [    4.132697] ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> >>>> (XEN) [    4.132700] CPU:    12
> >>>> (XEN) [    4.132702] RIP:    e008:[<ffff82d0405779bd>] pci_mmcfg_read+0x19e/0x1c7
> >>>> (XEN) [    4.132708] RFLAGS: 0000000000010286   CONTEXT: hypervisor (d0v0)
> >>>> (XEN) [    4.132711] rax: 0000000000300000   rbx: ffff808000300100   rcx: 0000000000000000
> >>>> (XEN) [    4.132714] rdx: ffff808000300100   rsi: 0000000000000000   rdi: ffff8304959ffcec
> >>>> (XEN) [    4.132716] rbp: ffff8304959ffd18   rsp: ffff8304959ffce8   r8:  0000000000000004
> >>>> (XEN) [    4.132718] r9:  ffff8304959ffd2c   r10: 0000000000000000   r11: 0000000000000000
> >>>> (XEN) [    4.132720] r12: 0000000000000100   r13: 0000000000000004   r14: ffff8304959ffd2c
> >>>> (XEN) [    4.132723] r15: ffff808000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
> >>>> (XEN) [    4.132725] cr3: 0000000492a30000   cr2: ffff808000300100
> >>>> (XEN) [    4.132727] fsb: 0000000000000000   gsb: ffff8881b9a00000   gss: 0000000000000000
> >>>> (XEN) [    4.132729] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> >>>> (XEN) [    4.132733] Xen code around <ffff82d0405779bd> (pci_mmcfg_read+0x19e/0x1c7):
> >>>> (XEN) [    4.132734]  48 39 d3 72 ea 4c 01 e3 <8b> 03 89 c3 4d 85 f6 74 0d 41 89 1e b8 00 00 00
> >>>> (XEN) [    4.132744] Xen stack trace from rsp=ffff8304959ffce8:
> >>>> (XEN) [    4.132745]    0000000300000286 ffff830495bd8010 0000000000000003 ffff830495bd8010
> >>>> (XEN) [    4.132749]    ffff8304959ffdd0 ffff82d0405fa7ef ffff8304959ffd30 ffff82d040576877
> >>>> (XEN) [    4.132753]    000000000000000c ffff8304959ffd58 ffff82d04039b81d ffff8304959ffe28
> >>>> (XEN) [    4.132756]    0000000000000003 ffff830495bd8010 ffff8304959ffd80 ffff82d0405fa90b
> >>>> (XEN) [    4.132760]    ffff8304959ffdc8 ffff830495bd8010 ffff830498019650 ffff8304959ffdb8
> >>>> (XEN) [    4.132764]    ffff82d0403983e0 ffff830498019650 ffff8304959ffe28 ffff82d0405fa7ef
> >>>> (XEN) [    4.132767]    0000000000000018 ffffc9004002b900 ffff8304959ffdf8 ffff82d04039feba
> >>>> (XEN) [    4.132771]    ffff82d0405fa7ef ffff8304959ffe28 0000000000000000 ffffc9004002b900
> >>>> (XEN) [    4.132774]    0000000000000000 ffff8304959bb000 ffff8304959ffe78 ffff82d0405ff666
> >>>> (XEN) [    4.132778]    ffff82d0405713b8 00000000ffffffff 00a0fb0081f456e0 ffff8304959b3010
> >>>> (XEN) [    4.132782]    00000000c0000000 00000001ff000000 ffff8304959fff08 0000000000000040
> >>>> (XEN) [    4.132785]    000000ec00000001 ffff8304959fff08 ffff8304959a4000 0000000000000021
> >>>> (XEN) [    4.132789]    0000000000000000 ffffc9004002b900 ffff8304959ffef8 ffff82d0405711b2
> >>>> (XEN) [    4.132792]    0000000000000000 ffff888100456938 ffff8881001470b8 0000000000000018
> >>>> (XEN) [    4.132795]    0000000000000000 ffff8304959ffef8 ffff82d0406213f9 ffff8304959a4000
> >>>> (XEN) [    4.132799]    0000000000000000 ffff8304959a4000 0000000000000000 0000000000000000
> >>>> (XEN) [    4.132802]    ffff8304959fffff 0000000000000000 00007cfb6a6000d7 ffff82d0402012d3
> >>>> (XEN) [    4.132806]    0000000000000000 00000000ffffffff ffff8881001470b8 ffff888100b88900
> >>>> (XEN) [    4.132809]    ffffc9004002b900 ffff8881001470b8 0000000000000283 ffff888100456938
> >>>> (XEN) [    4.132813]    ffff888100065410 0000000000000000 0000000000000021 ffffffff81f7842a
> >>>> (XEN) [    4.132816] Xen call trace:
> >>>> (XEN) [    4.132819]    [<ffff82d0405779bd>] R pci_mmcfg_read+0x19e/0x1c7
> >>>> (XEN) [    4.132822]    [<ffff82d040576877>] F pci_conf_read32+0x55/0x5e
> >>>> (XEN) [    4.132826]    [<ffff82d04039b81d>] F pci_check_extcfg+0xb1/0x13b
> >>>> (XEN) [    4.132831]    [<ffff82d0405fa90b>] F physdev_check_pci_extcfg+0x11c/0x121
> >>>> (XEN) [    4.132833]    [<ffff82d0403983e0>] F drivers/passthrough/pci.c#iterate_all+0xa2/0xe2
> >>>> (XEN) [    4.132836]    [<ffff82d04039feba>] F pci_segment_iterate+0x4e/0x74
> >>>> (XEN) [    4.132839]    [<ffff82d0405ff666>] F do_physdev_op+0x362a/0x4161
> >>>> (XEN) [    4.132842]    [<ffff82d0405711b2>] F pv_hypercall+0x6be/0x838
> >>>> (XEN) [    4.132845]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x148
> >>>> (XEN) [    4.132847] 
> >>>> (XEN) [    4.132848] Pagetable walk from ffff808000300100:
> >>>> (XEN) [    4.132851]  L4[0x101] = 0000000000000000 ffffffffffffffff
> >>>>
> >>>> There is an important comment in pci_mmcfg_arch_disable():
> >>>>
> >>>>     /*
> >>>>      * Don't use destroy_xen_mappings() here, or make sure that at least
> >>>>      * the necessary L4 entries get populated (so that they get properly
> >>>>      * propagated to guest domains' page tables).
> >>>>      */
> >>>>
> >>>> Hence it is wrong to bypass
> >>>>
> >>>>     mcfg_ioremap(cfg, idx, 0);
> >>>
> >>> Hm, I see.  The L4 slot must be unconditionally populated before we
> >>> clone the idle page-table, otherwise the mappings won't propagate.
> >>>
> >>> What about unconditionally populating the L4 slot in
> >>> subarch_init_memory()?  That seems less fragile than doing it in
> >>> pci_mmcfg_arch_disable().
> >>
> >> Less fragile - perhaps. Yet I don't see why we should populate the field if
> >> we wouldn't ever need it. Of course with violating layering some, we could
> >> know in subarch_init_memory(), as pci_setup() runs earlier.
> > 
> > How can Xen be sure at setup time that the slot will never be used?
> > The MMCFG could be empty initially when parsed by Xen, but MMCFG
> > regions might appear as a result of AML method execution (_CBA and
> > _CRS methods in hotplug host bridges).
> 
> Their usability may change, but how many of them there are (going to be) we
> need to know at boot time. See how pci_mmcfg_config_num, pci_mmcfg_config[],
> and pci_mmcfg_virt[] are initialized (all by __init functions). If regions
> could truly appear "out of the blue", we'd have a bigger problem.

My copy of the PCI Firmware Spec v3.3 contains:

"4.1.2. MCFG Table Description

The MCFG table is an ACPI table that is used to communicate the base
addresses corresponding to the non-hot removable PCI Segment Groups
range within a PCI Segment Group available to the operating system at
boot.

[...]

4.1.3. The _CBA Method

Some systems may support hot plug of host bridges that introduce
either a range of buses within an existing PCI Segment Group or
introduce a new PCI Segment Group. For example, each I/O chip in a
multi-chip PCI Express root complex implementation could start a new
PCI Segment Group."

Together with this:

"The MCFG table format allows for more than one memory mapped base
address entry provided each entry (memory mapped configuration space
base address allocation structure) corresponds to a unique PCI Segment
Group consisting of 256 PCI buses. Multiple entries corresponding to a
single PCI Segment Group is not allowed."

Given that each segment group can only appear once in the MCFG, and
that the _CBA method can introduce new segment groups, it would seem
to me the spec does allow for new segments appearing exclusively as
the return of _CBA method?  It does read as if hot-removable segment
groups must not appear in the MCFG table.  I'm not finding any clear
statement in the spec that says that ECAM areas must previously appear
in the MCFG table.

I'm not sure how common that is, but it doesn't seem impossible given
my reading of the spec.

Thanks, Roger.

