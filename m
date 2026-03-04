Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEyzLJhfqGmduAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:36:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A572046A0
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:36:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245780.1545169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxpD2-0004GF-66; Wed, 04 Mar 2026 16:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245780.1545169; Wed, 04 Mar 2026 16:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxpD2-0004D8-2Z; Wed, 04 Mar 2026 16:36:28 +0000
Received: by outflank-mailman (input) for mailman id 1245780;
 Wed, 04 Mar 2026 16:36:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxpD0-0004D2-5e
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 16:36:26 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4866cd05-17e8-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 17:36:25 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7273.namprd03.prod.outlook.com (2603:10b6:806:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:36:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 16:36:19 +0000
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
X-Inumbo-ID: 4866cd05-17e8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKcYAA+D8JUD5AHwq7nRbGmB1s+whJBWBlhlNVSThmmzPS3bAOdj0RZhw0Zi8iG1CexOqipy1n+W4tkAD9l8FnjOBdJSxDT+qkKTssdmjJGeGBsI607C81i8gTI5jFfUD3PPwqIa/pd7MjK4tftnlgA5lcZuIIWiDgV5amuxMFAAoAO2e7kcqTs9e8IfGsgYGodNUyrgahv4wseGbs2f/pzcWW5InjyFkKHNO+qFGNY+jDc4M3LtQUqFLIPCgBQ4oWI2Dc1XTd/1JEl3KXpAqTG6Dc7kRSalHDy6cXJ1DxwC7v77v4hISizeUL5idXwNbciOROAQTCR9l3246KgQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SWCLNezxbk11hmU1qh7DwEJLZHtpZYGIKiOyFAD5Gw=;
 b=UQBcuycomfcIDcbli509qePiv5soibYPov6TWs5amsW5oBlIJFi5TQA0cGIfwAYRKmAhsNR77sQ3HPFGraT6l7QD9YMpKDyI4/jeQM0E0HMkYBLGSQ3lwrJblhRcE2+OtgJ6UTLKgUZFDLa06v9Fceij2H8iC3goF4yBoL+UDxaD6mhhh2CFt+PGGaNbQsrwQa4NjuEdYw7kMKgTYreaNzUYAtJ1jZUHusVqi7l8UNG3Q7+eJXZ9UpLEku5Rywx8SnXMc1Zvgu5x3NagZtV9LIRoB1Z5odykpEbrIlDoCMp/WgKHDD5KkOFziqrxxApelloAewC9vZ/kK1VhAFbYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SWCLNezxbk11hmU1qh7DwEJLZHtpZYGIKiOyFAD5Gw=;
 b=ZcrnmMYh4lRQEFexwn0U+HVjkh/O66Ly6nUe2yRNNEz4OL6qcItLjSSnbWjWhkPufZjdnv+aCxySWAb2uHYU/Wdq0eMfnKXmxLw/e7+BdoMNJEkY8umHBV1iKNRoveYGw8UYEs9ip6wsaCNJtUGI5fcDpU6oXJSxz1s6UKdSGqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 17:36:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
Message-ID: <aahfgDDNVwJPa-jF@macbook.local>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
X-ClientProxiedBy: MA3P292CA0069.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e47eac8-9b1a-48a4-fef5-08de7a0c299a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	jDmISeA4FiRzJq6CFzWI+1iJ0FDPtRctmyqMbv9oSh4oJ5A77pq/OsrYgiMkwQe3UQjYVZTro8M+8g7yQ66zlcYXkzhRIzK/s2cNIGfdz2vKX81Vbj6AIS/7yaEw/PyZ8zUrequSzZao+3L+HAsJ2bblnl0mI9+Ks5MDS+btO91JLgugZbbS2xYsTFjDsvKuzlQWZqq4EOUieqI8tlq+P29eayoSAeXHPq+m9kcy/yAVLqQ3JzDGP1rA9j7vh1ngjmbFu8mP3qz8axQx5oG3FqPa6YzNtgZUOJTtO7Y4TMqK4sVzHUKPNXFpXmq3y8D/mcP3uyKWOQDnQ6Iq2XjYG2N6OoBm9zGLrkOM0tCDILDdXj2qYOhFPobUrXfyWvHlucbtotoNgFc1DJeJhKiKdtSok1gUmEauk5cgfg5TH6ZVV2fM7w4gunmMTAJ4kuHFBcyK71mBtEOYdif9Rjxk22/nxP4Pm5QJ+6lJ/VhFyNctI+BLwMdByv4mJtRyJHZn5/rZ0TxQTGgZFSXHvIhC3VifDauqzhsAU+cY57G1qYE8gqmX9B0Xo5+bZ+yxgsWaNU2g0lVQhU6Uad1SHqn2YoAQ5/5nIaU11S7Zk5bA9eJ/zZinpBowdC4ucs/5P+VjWa/ertAy109P4tnLaL1kZye/4kM03+jj7NN5ASJVUTpcdE8TCh3kjRmPZ+w3nZ4eTP9S6TrPTc9aQtTxZSkYkpBLQ78h97bJXrwUXDWzqBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxUSVB3RzhxRHIyUEpRdU1nK09id21sNDBGeG1VL2NCdVluZjlGeE9QNEVL?=
 =?utf-8?B?ZUZRWWd5dHFoUVBsM2UwM29WZGFZWEZWS0loM1MyWHJYSmJVSUtkcGxjRkNO?=
 =?utf-8?B?Y2NrNFpQTENkcUUvQll2MkUxSGxYV0N6bTNEWmR0MUhTY3VvaDdRek1KQzJn?=
 =?utf-8?B?R0pXS0kxdzNwdk9UcWFFYnkwdEhaT1VpaGcwWVpac2I1a08zeHJJd2ovaUQ2?=
 =?utf-8?B?OUJyRU50dGNSOWtFeFl1NSs1MnhLd0c3YUhVanBxdmpNY2JzWC9GL1FmNGZR?=
 =?utf-8?B?bzNpeWJCbzBINnE5NTk1SnNSTVBvOTlWQXBRZEhtRVVlVi9pMHR3OVBGMnZL?=
 =?utf-8?B?eCtleTFRM0lKZ2huMWpLK3lkZVpXQnBIOWZFMzRIR0JyNUIrelRqYWJJeDdF?=
 =?utf-8?B?OE82YzUzaS9tU25vbG1jTGFZMXZhcGVTTDB0TnlQUTNGeEY2T1hySWJuWnlO?=
 =?utf-8?B?ZEtrNXp0ZWIzaFFkb25iN3owTlVTK3VTMVp2emc0cEJLR0QyZ2RqQnlZU0Ew?=
 =?utf-8?B?eVhGek4xUEZnNXhHblNFTGxqdS9iZ2YrbzE0NTdHbzltVzJFRU9TYmRFeDJ0?=
 =?utf-8?B?NzJCYm9nMTVGUEE5WmJ0MTY1VXlUL3UvWVByQ3lyS3g3c0UrSFRrMHFXRlNT?=
 =?utf-8?B?d015dWtIRWdEaFJXOUJQREhSdnRmeTVWeHN5Rmk0V0E5SmVCSnBORGorNkx6?=
 =?utf-8?B?SThvSTJ6TW5BSVNzQjZVejBhdmErNVI3RzV1ZGRXSDRvNjU3QkVhQnFJeGtN?=
 =?utf-8?B?NnkzZ3NZSTRhTCtRcGN4NW01em54Y3orYWxMZkpzTEZRc1hJbHNFQ2k0ZlZY?=
 =?utf-8?B?R29TTFBBbzVoSUhyb04zekI1RVk0SnBLL2NxaS95Qko0L2gzTklQUGE3VlJl?=
 =?utf-8?B?RTN2TXJPTlQ0dVFkSUtqN3pUV250YjdJN0IyUGpndFZpdGwzZi9UWUE5cjBF?=
 =?utf-8?B?bHY4cDVFL2xkeFQzMVhrZUtYUlBINWZXWFg3cHkxWlpCYmZITlVDK3J2NExE?=
 =?utf-8?B?M2VYY3ZoVTZTeXdUMTJxbk5CR0xjY2gyTFVmWlZyekVuamZWRXptYUhVV0N1?=
 =?utf-8?B?MFZINmNuSC8xT2xOQ1pCczNhQmFvbjZielNUTFRBZ29Ha01DaHEzMjdYRGF1?=
 =?utf-8?B?QzVIWisrMkN2N0tkZ2d5K1NBS29XR0t4TU1IQWpyR1doUGluK0ZpK2hGbEdr?=
 =?utf-8?B?SzdIcy9wRmxQK09NSEwzdmZ6Mk80T2F3ZXNPc3pWa0JrNjJ3Nm1ma2F2U2di?=
 =?utf-8?B?MTJieVFIeTMyeERKZ1F5WGdXcDJ0VmQ0Qlp2L2E2TEYwbE1GUFVrQzR3cnha?=
 =?utf-8?B?b1hhOG5odURQWGluUFAzZVE5K1F4T1FSdzk5SEJBWWg3eVNlOGkxWHArSW1k?=
 =?utf-8?B?OFRtMG81eVFOb2psWERWbmVFUkJZZHVzYWtyUnVaR0svbEtJRFBxTk5OQ1Ru?=
 =?utf-8?B?ZnNPVWNuU3NuSHdBNktaeWNDdzN5anJ6TXhic2dLMk1ueDJqREEyZjlWdjdI?=
 =?utf-8?B?OXBiMitoM05PajRSRzZTdlEzR1pUdzhuMWtBUzhHd3NMdVd3cllxZ2FidEwy?=
 =?utf-8?B?TDJDekk5SnkvdU9JTDdDN0dKZFJSMHc2WktBS2UvYmJ4dFFjUU8yRkR3Umo4?=
 =?utf-8?B?TzF2RHlLNEp2V1hndHRlMStiN0xFbjczT2V2ZVJ4ZTRzeEZQL3FwdXpWVTRn?=
 =?utf-8?B?djJsU0NWK0l4bEgrVWxycC9wUU9YanNFWXJDdmZzN0pwM0ZjZGQ5TW83MDRE?=
 =?utf-8?B?KzJ1Wk5jT2JCRll0RE9HclBmZUlYbFpGdlEzU0VTNDZBZ2orLzNVZWlzTS9O?=
 =?utf-8?B?QW9YMUNldHdQV01INitYa2piSml6UE1xaGIyd0VWMWozajJJVWhMR3I4MWNH?=
 =?utf-8?B?K3UwcEQyZnZETmcrWURSakpya0EvaGwvaGhtNitnZStyZnFDcUd2OGlqOUxn?=
 =?utf-8?B?UE9FMVU5bCtOTlJVajRKUHViNjVKZ29yMkhaRzlMSjhVRnlQeGdBTFAvTzRv?=
 =?utf-8?B?M3FSeVE5eCtDOWszbVFqemVkc2FqQlNmTkJUTXdsWHVqek1GbkRJSldlQjRI?=
 =?utf-8?B?WnpQMVV1c2g5QXR1bUFVMWtjS1pkWkdzWTcvUmJBdndpTnZDUkdWZFUrTisx?=
 =?utf-8?B?NDlMK0F5bXI3bC9aU0IzWDkwUU1NWDJ4YUlRcnZYYi9Sdm96MEhqbjdZY3Jj?=
 =?utf-8?B?NjA2RWgyVzA4Y2FQSTlpT1JLNkMyS2ZLUS9oNjkzMFFqREFmemVRZ2lhZStl?=
 =?utf-8?B?MTZ4dzg0bzAyYlRIQkJlb3QxQ3RRSXJ5eFI4MXBTeTNKckhoNmJUWitnQ0Fh?=
 =?utf-8?B?WlBHMEptakRvU3BoRmdxSEpGRWJMcFNoZHJMdGFncnpTVG5KbHBqUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e47eac8-9b1a-48a4-fef5-08de7a0c299a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:36:19.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /40Lrc5lOmIYe9Qn6kSDZcoupmzxYaAzM055FcgG+RUQubzIwAcwhEC/RgVHNkNpEt7hcni4ZuFkGP/uqACp+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7273
X-Rspamd-Queue-Id: 27A572046A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,xen.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 03:37:25PM +0100, Jan Beulich wrote:
> The treatment of ACPI_PDC_CPPC_NATIVE_INTR should follow that of other P-
> state related bits. Add the bit to ACPI_PDC_P_MASK and apply "mask" in
> arch_acpi_set_pdc_bits() when setting that bit. Move this next to the
> other P-state related logic.
> 
> Further apply ACPI_PDC_P_MASK also when the amd-cppc driver is in use.
> 
> Also leave a comment regarding the clearing of bits and add a couple of
> blank lines.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Including XEN_PROCESSOR_PM_CPPC may need accompanying with some change to
> arch_acpi_set_pdc_bits(), but it's entirely unclear to me what to do
> there. I'm unaware of an AMD counterpart of Intel's "Intel® Processor
> Vendor-Specific ACPI". Plus even when the powernow driver is in use, we
> never set any bits, as EIST is an Intel-only feature.

We possibly never need to set any bits there for AMD, as those _PDC
Processor bits are Intel specific?

> acpi_set_pdc_bits() having moved to the cpufreq driver looks to have been
> a mistake. It covers not only P-state related bits, but also C-state and
> T-state ones. (This is only a latent issue as long as
> https://lists.xen.org/archives/html/xen-devel/2026-02/msg00875.html
> wouldn't land.)
> 
> --- a/xen/arch/x86/acpi/lib.c
> +++ b/xen/arch/x86/acpi/lib.c
> @@ -124,6 +124,9 @@ int arch_acpi_set_pdc_bits(u32 acpi_id,
>  	if (cpu_has(c, X86_FEATURE_EIST))
>  		pdc[2] |= ACPI_PDC_EST_CAPABILITY_SWSMP & mask;
>  
> +	if (hwp_active())
> +		pdc[2] |= ACPI_PDC_CPPC_NATIVE_INTR & mask;
> +
>  	if (cpu_has(c, X86_FEATURE_ACPI))
>  		pdc[2] |= ACPI_PDC_T_FFH & mask;
>  
> @@ -142,8 +145,5 @@ int arch_acpi_set_pdc_bits(u32 acpi_id,
>  	    !(ecx & CPUID5_ECX_INTERRUPT_BREAK))
>  		pdc[2] &= ~(ACPI_PDC_C_C1_FFH | ACPI_PDC_C_C2C3_FFH);
>  
> -	if (hwp_active())
> -		pdc[2] |= ACPI_PDC_CPPC_NATIVE_INTR;
> -
>  	return 0;
>  }
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -694,14 +694,23 @@ int acpi_set_pdc_bits(unsigned int acpi_
>      {
>          uint32_t mask = 0;
>  
> +        /*
> +         * Accumulate all the bits under Xen's control, to mask them off, for
> +         * arch_acpi_set_pdc_bits() to then set those we want set.
> +         */
>          if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
>              mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
> +
> +        if ( xen_processor_pmbits &
> +             (XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC) )

Currently the CPPC driver is AMD only, and hence when using it we
don't care about filtering the _PDC bits, because the ones Xen knows
about are Intel-only?

As you say, we likely need some clarification about whether there's
_PDC bits AMD care about?

Linux seems to unconditionally set bits in _PDC, so some of those
might actually be parsed by AMD.

I think we might want to split the setting of XEN_PROCESSOR_PM_CPPC
here from the addition of ACPI_PDC_CPPC_NATIVE_INTR into
ACPI_PDC_P_MASK.  The latter we can possibly untie from the questions
we have about AMD usage of _PDC.

Thanks, Roger.

