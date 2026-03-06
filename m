Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKqwJeatqmluVQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:35:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C1E21ED76
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247593.1546154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySWS-0004ed-TA; Fri, 06 Mar 2026 10:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247593.1546154; Fri, 06 Mar 2026 10:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySWS-0004br-QH; Fri, 06 Mar 2026 10:35:08 +0000
Received: by outflank-mailman (input) for mailman id 1247593;
 Fri, 06 Mar 2026 10:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vySWR-0004aY-38
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 10:35:07 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210814a9-1948-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 11:35:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5587.namprd03.prod.outlook.com (2603:10b6:208:286::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 10:34:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:34:58 +0000
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
X-Inumbo-ID: 210814a9-1948-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqp6VyCrefGK5gIKZgPwOzkRUP0zKSM6+oMlQtWtiW4sckfn5WcD5M0wpU9moYLOSMdOLyANrZcwf32FxAO0a1iFrENsZv3mPx2/s9A8tvkdx92XL5iPPoGlqVnqeespN0e6n1fqhzdFRW3072Yf6G/aK5Y4bkPMGF+aDFE37jXHB/8Ji8h9ynw6d4Bxn4tC+IGCLY32Y5ZDoleEMBj+ywf37bBTlkFEEsUxizpTmvq5c4tEbi3gguaO7Wf/n0T3CzeF64SEr3kLtqGaDkNYVNKfY/5uFCtedxUoDCoE1kWIInorEVcxBfhJdYh0ONT+AI9XT7kDrK+ualGXV2QTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tci2VgEwyEMN52AZpLCVUTxgEFw2cVuPR8ixW2m7yk=;
 b=BmEwWNX0ypULMy1HH7O6EpKJM9AtLo4KpsEOh439hcVpHjr/U0W2Yxlb5hiT6gAZviURaT0MCy7E35/0WpflJaAVvpuKNjsTCRekVZo+Q/CrqvFlqzBeEMfd2+Eov98NUx7LsvvU4IQWr106ReffkHq31ScyKP4VrUq4/qADlJJcBPQQuGJvU7cf3HG37/40E9r4czR/iAoRH17n6u1FVHbzpOS2lu9cmY0zdnsYwip0X3R0RdF5zC8hXmc3ESW+vrgd7vublj3M/tp4B/I0WAT+ZAGZStaC2Bsqw33RqccYic7DESXceydjWLUcH6tyfYMMC6Gz1Tjdx1PZKUKg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Tci2VgEwyEMN52AZpLCVUTxgEFw2cVuPR8ixW2m7yk=;
 b=naEOYMlAuT7Hf8SYvLLnYZ3/OYO/W2wjW1+S1AHCaqgef1T78V2bNeDZ0xL0i1BNgmc+12cBawGnqXZvsR7IUJfP5RWzEPUKsfVx5ZShEObio8fgWvbynKDrFwg7ezIj5cL35yJd4mNlMUvKFnSFwgjpgNTqtnfD+55hWYKZbrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Mar 2026 11:34:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v6] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aaqtz-fL3bl1wS8P@macbook.local>
References: <689dae19-f83d-463f-95d9-c39c15a4e45c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <689dae19-f83d-463f-95d9-c39c15a4e45c@suse.com>
X-ClientProxiedBy: MN2PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:23a::34) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 6106dc19-98d6-4955-55c4-08de7b6c0397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	Lin1PyZLksNR6wA6NTU0WuFy4XXA3/zpZKQF2EEv/4fd4h93GYvvEoO7BSdg6uNBQXW0rdTSFRBY1M6HplEmtDJ0errh0rPbOc9s3H9tGJFVcMz4tAMHjaa4tdUYLs5h5Rj5Tb5fSKFj/ehWQ2nctDcDl/RAMf5AtDxC25qqligR8hzfgSdDu6m4KfbixI5ykFtz/ty7IxQczcpFsZrAMFTfYWPICPJ5M6oVWjF1h+moKeHO3AfOqfySfZXO6Dmv864N4bjVwNxu6TmR7sGesJ/c/cOK3KOLKfF+kMzRI7UTved47enW3jl6QLJkqAvPfHLgx5FwUfXmlPc3pjpHVQvE3uMGM8d8EW0YHEtSlbPR9ip9p49pOad5o1/3ClHQikXHvUJWvGPP3afJyHaxEchPwNjahlqskvtIfDxT4mnXxP6Lvp6BGlnmBjXtSP9keAIFDqibprkUmXt4UcfVlkyxFVmvfPTfhdOqzhPfyvRAr6UzotkkVpQWhDHIRhhWHrnaE4omBFph/C0KppwbWG6qSUfa6EF7O7iDPkg8sx/acmQBjFGX6sB23ldGxbVsVSGn+aor9zE3O49JAC0Ln33xkGJXJ+5+8TSLBBJyzzn07a6w18ahrumoD29BYf/UNbbmzMZ9tto+BQ94XBIKc8ykQY5yWVBj1EaQl2MRmuAWCYw/62t2GUQvxrWi9rDdP5DMf9WHcErg57SadWnnVAJ2/w9N/5vNb1mkjQ+klIs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3MwNDFVVVFPQ1h6YXNmbnNSQTlkWU1TQ21MbnlGeFBka25zalN4SzRVY0Rz?=
 =?utf-8?B?TjltcGh1Kys5RnZ2ZitVNnI3anFMa3BxZ1VvQ2tCb1prNmpxTVFWb3cwa1Ri?=
 =?utf-8?B?UXZZL2ZaUklmQWpGWFg1c0ozWjQxa01PSGJzOVQvZEVzYjlkQXk3KzdVZU5s?=
 =?utf-8?B?U1JROXR3QzB2Nm1HWXVLQ2RuK254QWNpUjNjbXdCMUg0ZXNPeE1UVjN6NkF1?=
 =?utf-8?B?dU01NGJoTFA5aGJTcjl6WTRQd1FWSWhOL3hRTFArTnlTYmFHckNXaWduSEZN?=
 =?utf-8?B?UTlrZnA2YlU5dzJHUCttSzNpRGVHaExqTGI3SXdhRFJ5L2RuZG5CUU13c1pV?=
 =?utf-8?B?OEtmMlFMd2pCalRVRUtoY0l2dDZZK1IwcGhIcTAyZFYya2lXMi90RWwxcHd2?=
 =?utf-8?B?dEV3bHBtSVdYNy92Y1VZVkFVY2dMTE9lZEkyWkJyYk9xTVRsNU5lcDlIWENT?=
 =?utf-8?B?RGJVbW8vbXplVGpqa3dkOCtEVnlSNFFscHVtMUJXM3BrMmQ5eDFGWUVKNi83?=
 =?utf-8?B?a3lVdzJMQXArVmwrQzd3aHlPbEZiRzcvOWM0cW9QbHBmZVFKemlXSzIvVldZ?=
 =?utf-8?B?c05DMWRob1d4STBxazFqT00yeW1RTkRyL2lobk95SThDUDFxbmErVGFMTjF1?=
 =?utf-8?B?ODVSbExEeTdVUG4rUmpCQjdtT1c3T2FsTjIxeUdOSTNUMmpSc0dIS0xseXFE?=
 =?utf-8?B?NjBuaHFpWjExWlFWQWk3ajQ0QkV4MERJcjVNTTcxOTF3S2VReGxKZXhqMlpr?=
 =?utf-8?B?Z0pPR0hpRFVZRCtlamJGTndENHhreWY2eElxbUNrNERaMlM5TWVMdjF3YVpJ?=
 =?utf-8?B?Qis4TEQ4QUk0ak9IMFBVUUV2Q3NWcWdPM1dHYkRHRlNQcHpXYUozNVZvUGI3?=
 =?utf-8?B?SUliZ0plU1NqckliY1M2RWJPQnR3dS9mZ2E4SklIQnN3NExQN0hQWjFiUHh3?=
 =?utf-8?B?QUZoT1VRMXJjZGcxTFAyZzJTTjIzMG5YSHIyaGVpZHZLU3ZvdTRhRFBaR0E2?=
 =?utf-8?B?RGdNY05QN2dvQXB4MFBlY3RmRVIyZzEvNUhRT2ttZ3pEN2tUajFPeVVZV0NE?=
 =?utf-8?B?NzlKTDZNbVk3S1diV1ZPbEhUY1crSE5nL3N2SkN5WFdlOU1pd3d0T29vNmx5?=
 =?utf-8?B?WkYrYy9CNEVINDJadWFibHBneXA2Z0xHQXAvTHJySkJFbzdoNldPTVQ5MjRx?=
 =?utf-8?B?OTlKNzd4ZlN2cUZWazZLbjFGRnFyekl6ZWdFTXA4WXpDdUN2Y2RpT1VicGgx?=
 =?utf-8?B?aXRyNmVpb2xHUDJscDBzakNOMENuMkVXb0ZkSVhSa3RBYWVOR0JFZklheW1n?=
 =?utf-8?B?aDFiZGNFRGRob3RLR0hRbG1nR0RXVG85TEVWTE5UVzdjUFNZei9uL3RuMTly?=
 =?utf-8?B?dnErTnRWL2ZEbGg0aVZyU3dtSitxT2JUWkgzalg3RmViekx0MnpCZktzaUUy?=
 =?utf-8?B?cHp0SmpqSFF4L1AzRE1uT1dhc0xKSUFibWJXbGkrNGFscW50Q1E5MXAyWVFs?=
 =?utf-8?B?N3pXSGhzQ1grU29MRk1SdXpYNHVEbkk0TlZwTzQvUlgvOVg0eTIyKzU0c2VS?=
 =?utf-8?B?K1A3bEJ1WUdsaTJOYWF1eFkwbmFsMDRMTnRCZWQ2cVpFRk9Mbkk0TGJqT3ky?=
 =?utf-8?B?dTJaK3lOTnU3Y2k2Vlp1eFVkYjBhdlNtbTZtT1ZJYzNjNzZnTWJNcE53ZjEr?=
 =?utf-8?B?TTFXaGE3Yi9lWVpIQTBzT29GQmREeTR2NFgwcE5jVTZQdDgvQ2p2MDVMOEc5?=
 =?utf-8?B?aGU4UUlwSkljMzd2REN1Y3FJakFQUVFBbTBNdDlHU2RTdmVTZ1hRMys5em5I?=
 =?utf-8?B?WU5KYlFxQkw2TU9zYnZlVkxMcGVjTUdxMzZHaUtWTXU4bDhtdXRjL211ak1t?=
 =?utf-8?B?K0VBV1gvRlJHV3NMRis5RDFOeVJxZWJmSnZPYm5tOFZLbjNhaTNMU3FvOXJO?=
 =?utf-8?B?NXR6dTNRQlZCcGtmTUcra0lHR1F6OEFxV25UM0tKNEFhQzJndWlCMWRVY0Zx?=
 =?utf-8?B?ck5FWFJQaFVYek12UlRSNlpxenBaODNlZS91UHJPdTU0akVEcmw0SEl5TGlC?=
 =?utf-8?B?bEM3SVZ2aW1WL282QXF4WVdFQUNnUENzbk9IY3RONzljYmJReWRsVXp5eVR3?=
 =?utf-8?B?cW5VSysrKzJPemdxb2FsV2lPWHkraHZqZ21TK05ra3hWenZZalZDMzgyb3hP?=
 =?utf-8?B?K3hQM2p2U1ZIS2JyanJIZk1vNDAzaUM2NTQzc0ptQm5HUE5CL0NsOTJ1ZHU2?=
 =?utf-8?B?WUVSaWZ6ZWlJclJkVCs1NzdBL2tmL0hxTEJaRjBnQ1Nrc1Q3NmQ5MjR6SlBN?=
 =?utf-8?B?Z2x5Ti9XNUhpQjNBallyQzZCdUdXNlhvU012TE0vRXhtSTIxS2FKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6106dc19-98d6-4955-55c4-08de7b6c0397
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:34:58.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQqQ2aGXdbeBBWhqNxh5oEkKZf/QVHoypM+3FzvEXIW62C82lKH4DY7teFkS1dgDxzRh0U7ZyD62PN/NQ57omQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5587
X-Rspamd-Queue-Id: 09C1E21ED76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 02:56:32PM +0100, Jan Beulich wrote:
> When Dom0 informs us about MMCFG usability, this may change whether
> extended capabilities are available (accessible) for devices. Zap what
> might be on record, and re-initialize things.
> 
> No synchronization is added for the case where devices may already be in
> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
> 
> vpci_cleanup_capabilities() also shouldn't have used
> pci_find_ext_capability(), as already when the function was introduced
> extended config space may not have been (properly) accessible anymore,
> no matter whether it was during init. Extended capability cleanup hooks
> need to cope with being called when the respective capability doesn't
> exist (and hence the corresponding ->init() hook was never called).
> 
> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One comment below.

> ---
> v6: Add comment in physdev_check_pci_extcfg(), while dropping the logging
>     of a(nother) message there. Drop hwdom restriction from
>     vpci_cleanup_capabilities(). In the re-init case don't bail early from
>     vpci_init_capabilities(). Simplify assertion and re-order actions in
>     vpci_reinit_ext_capabilities().
> v5: Don't use pci_find_ext_capability() in vpci_cleanup_capabilities().
>     Add assertion in vpci_reinit_ext_capabilities().
> v4: Make sure ->cleanup() and ->init() are invoked.
> v3: New.
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -8,6 +8,8 @@
>  #include <xen/guest_access.h>
>  #include <xen/iocap.h>
>  #include <xen/serial.h>
> +#include <xen/vpci.h>
> +
>  #include <asm/current.h>
>  #include <asm/io_apic.h>
>  #include <asm/msi.h>
> @@ -169,8 +171,19 @@ int cf_check physdev_check_pci_extcfg(st
>  
>      ASSERT(pdev->seg == info->segment);
>      if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
> +    {
>          pci_check_extcfg(pdev);
>  
> +        /*
> +         * The re-init failing doesn't mean the device becomes entirely non-
> +         * functional.  In case of failure, a message was already logged.
> +         * Hence don't otherwise act upon failure.
> +         *
> +         * FIXME: Re-visit when DomU support is added to vPCI.
> +         */
> +        vpci_reinit_ext_capabilities(pdev);
> +    }
> +
>      return 0;
>  }
>  #endif /* COMPAT */
> --- a/xen/drivers/vpci/cap.c
> +++ b/xen/drivers/vpci/cap.c
> @@ -285,13 +285,16 @@ static int vpci_init_ext_capability_list
>      return 0;
>  }
>  
> -int vpci_init_capabilities(struct pci_dev *pdev)
> +int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only)
>  {
> -    int rc;
> +    int rc, accum_rc = 0;
>  
> -    rc = vpci_init_capability_list(pdev);
> -    if ( rc )
> -        return rc;
> +    if ( !ext_only )
> +    {
> +        rc = vpci_init_capability_list(pdev);
> +        if ( rc )
> +            return rc;
> +    }
>  
>      rc = vpci_init_ext_capability_list(pdev);
>      if ( rc )
> @@ -305,7 +308,7 @@ int vpci_init_capabilities(struct pci_de
>          unsigned int pos = 0;
>  
>          if ( !is_ext )
> -            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +            pos = !ext_only ? pci_find_cap_offset(pdev->sbdf, cap) : 0;
>          else if ( is_hardware_domain(pdev->domain) )
>              pos = pci_find_ext_capability(pdev, cap);
>  
> @@ -341,30 +344,40 @@ int vpci_init_capabilities(struct pci_de
>              {
>                  printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
>                         pdev->domain, &pdev->sbdf, type, cap, rc);
> -                return rc;
> +
> +                /* Best effort for the re-init case. */
> +                if ( !ext_only )
> +                    return rc;
> +
> +                if ( !accum_rc )
> +                    accum_rc = rc;

I've been wondering about this, for the hardware domain case we might
as well do best effort for the init case also.  The other option for
the hardware domain is to allow unmediated access to the device, which
is likely worse than allowing it to work in a possibly degraded
mediated mode.  We already special-case the hardware domain for
failures of capability->cleanup(), and we should likely do the same
here.

Thanks, Roger.

