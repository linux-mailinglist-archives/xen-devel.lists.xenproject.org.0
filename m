Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOk2IjG9u2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:09:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D12C860A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256807.1551283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39N5-0003n9-5V; Thu, 19 Mar 2026 09:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256807.1551283; Thu, 19 Mar 2026 09:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39N5-0003kp-1w; Thu, 19 Mar 2026 09:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1256807;
 Thu, 19 Mar 2026 09:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbsH=BT=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w39N4-0003kj-1R
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:08:50 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3db279c4-2373-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 10:08:49 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA6PR03MB7663.namprd03.prod.outlook.com (2603:10b6:806:436::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:08:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:08:45 +0000
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
X-Inumbo-ID: 3db279c4-2373-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkUk2jrs2tnnNLC6QBVAlt26wEnq6CR+qObIfKDh3ZH6IT5AYlViJ1hWMHKS4PXeWa3HYRXD4QkCsm7zT5qF2p/wHdZwHHhtrHBdI4Vn+VnGgVB/2r52ETeEmWTLr+2gT2PcyYsqv7HFXZSxvQOnP8fvpH5vzsPKzkowjOGKqilJOYCSQa3Aqx3UI1AqkwdfPZ2x/u6vIpnI2oWo1v90uDcnnE42AqV4EZFy/A55UKWzvOM4WqwwdBHzD4ucHw16ISkhWnYnhNCgbVFbuebN5UBxP0VgtZlKveW9dDM9jsZw1W3AVeuById9I7AXi9qSJOB4pVJX6jSFm18zZuOtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I/PDk8ghjn+CiK62ovORrPQlqhmJqQdCmbc/U8ZdqE=;
 b=iycYcfwUGgQM7bxP9pB1wVcYMrMGNU0KUI4u31R++TPfrmg26KJA5JAnedZuXxhFxZV0Ppys5UsgV2egpb2m7zVHksUcvj/cDqhI9Bk4EQGkW/t61SFiW7reiXzHTKoTK+heQOR6F2StnGvBTY5wvKMuPYcSwr9SRCFHg3nvFnLrXUeY9+DUh9vSRxiUzAYDGVD0tUBItYFBbOtH7Qql7RjAPSHxl76SUHQ6mMyJ8YLJHPLaEWk+qZyah7Yx32FIJkY3GG1+RGROvlCyVpz7PQP3ueEfIhvziu+dQcnXZuf2wktk7FeQT59M7bRqD2bgkn0AeAImQ5ZZfIOSCvPKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I/PDk8ghjn+CiK62ovORrPQlqhmJqQdCmbc/U8ZdqE=;
 b=ylUNPvCW3u7brHJYA1G7HxqWp91DoPKax37HPxwoVPWgUGr/xvoP6xuDfcgUNwUQBa5aKZnfgEnIpOp0NTZu+53cG/C8Es7cp5vMCxZVc35dyRUsENdYK4O+2gNueopLfUMgVwPR+dp9deoESkU+7AkxgzNiAgHruPMAV1qONrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 Mar 2026 10:08:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hap: Defer P2M TLB flushes
Message-ID: <abu9GpEm_z-7762N@macbook.local>
References: <20260318171324.1362219-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318171324.1362219-1-ross.lagerwall@citrix.com>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA6PR03MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b189720-0ad0-4ef1-473b-08de85971fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DMbiTi5xxLly42Q4kg3v+RiRjJN9a4UgJOXDceAKo0NHr65D3AegBrI3lpEjiy+Xp4OqBQZWKwe/2tB5RPMUIIlUg+x8WqIc4H8tzIW2nxPBaZgVcJzZyClOVePYvLlA+HyU2RfXYkZ7HWKKglMKTk9RIE16fgJp4Zd1nzyFnkEUDCx8OjRGO+IzQ42NxbQO/PmDoV5htsUTloSFWkoJvhT068aD9X7vvB6KA7cTzxQWWY69ZhkLToOb3JmtF9uctGHbIx05D9iWYu5MVw9kCfzOJt0dlkssSgz1KvWolS1TcxlbpapAP3XLZSW8QWgUOp4hw0RngYM4iOYhIxlC/59XK9W346cPLiEsLKQGfAFTHPso8jTUwjLH4Np07ONBvZaWYvonbFPJNcDXs7nPbDwtRZFg+WjwPHHUBoazTv3HBSM+UTgPwWZuaaUzDWkxf5Iv//iWBd5T+v6WyWQhIGCemxVk84ZcI40oQnwxsl5hTSAKeIwQIMQN5Hgiwl8tAgzOZ+GfJK9dbPkmfvsk2to2hbIeoJLRJOWBg90VGyUEKjqfS+VL95GhzSTlyYeBSSgwjkzFdm6/5jlX/gVVuE1zcWlF97TzZugWKEojrBoqyVUfvYZj8Lnu7smyuyxHZLWJh6VEEBVwDGVlSVcSEBEpFgFeRG4dOXihppNr4h2wjIkWKQp8dRQ6JddBVoEzATtBmh3dpBen/UNbQKQxyQWUTvXExPOceeKvEDnNzBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXJ2K1IzOHg3NmI2Q20rdFdIMjNuNFB3MHlVRjhtVUUrc1N1OE9aYmNzVklo?=
 =?utf-8?B?dlMvOTZnVlQvL1RTRjU5NXk3L0xSS1BUT0pvKzNyNi9sZm5acFJITTFNb2Fp?=
 =?utf-8?B?UlJpUTR4N3F0clJKTEIzY0JWZFVpbUdnTXRURFFMVVpZUXVvdml4ZFJsNEZY?=
 =?utf-8?B?UUlXWHVuUmEvZCtzM21TTDlVWkR4QTVHaHY4U2NpZitvQ2hBZHhiejJPcTZt?=
 =?utf-8?B?cVJaUmdaZHE2Z2tHOHdienhBU25qQmhCVkxIQXdIdkNmS3ZtMjgraWhCSmVp?=
 =?utf-8?B?SjJ0NFR3cGQvaGtrRmJMenNOQmVDRHRSNk00R0hIYy8vcnBzYmhEOHh0Y0hQ?=
 =?utf-8?B?eUZ2MUt1SUx3eTE3YXhjVktCdG9pUEUxYzU0blVoc3FLcllNRDRBZlFXODVV?=
 =?utf-8?B?QU9tanRvRWxUcCtYY29LeDc5SjNTK0NUZERSdUliakpqOWxXd1VIRHRTNXRZ?=
 =?utf-8?B?eDlOU2lYenkxeGh0ZkZXSmtFT1NscHNYSDczb09YNDRVQmlwUGNPZXZ6RlZ4?=
 =?utf-8?B?NGV4VTBlb1lBOXZLN0lsVzZiYmUwdXVUbTErQ1kyNVdCU056d21nN0J6S1RY?=
 =?utf-8?B?dUQxN0IwbzhRZjZReXI5RGlvU0psREdoRjFhQ1dYVHBZR3ZvdTRGQTA0ZGpw?=
 =?utf-8?B?d25VcVA4TkxVZlJRRlJST1NkNjljOTlHYnRUQW1PTkR0OFVvT203aWZ5MmpC?=
 =?utf-8?B?WHY1eUtaTkZlRUxmcXJySnhkcFFTZmR5bnp3VUJYR2FHdWlhL3hpSmFLYWww?=
 =?utf-8?B?OVpReW03T3BCbkFKalFUa3U4QkpQcWdwaXMraGEyV1RUZnNxNGlSY25KMzJI?=
 =?utf-8?B?MURpY2hhQm5zOXRVdXVERlZ6REUvb2RUWGRZL3lZSlJoZkUwSkdlMmxUTUxZ?=
 =?utf-8?B?clVBWXpYN2QzY3lZS25wNzV4SStvVHBNMHkrNFhlMExmd3hYWlRSUkdzcnRR?=
 =?utf-8?B?ZENuRTBQUWlyZEx3dzdCb0Z2T2VqN002Y0RPWENOWlp0THY0WXZ6N2NiTDk5?=
 =?utf-8?B?RWo2MldRSktOb0tIaXNjTEl1K1kwQlBSaEhhanh0NlBWby9OT0ZjaHZtTzZ2?=
 =?utf-8?B?dmVpcFJNKzc5QWRZbjh2NUdMQjU5dkhsNXhZd1NFNlhMaGZaTWFtT1FJaE5K?=
 =?utf-8?B?enU4RVdVQkRYV01rWm5qcEJ2SXQ3Yml3N09UOURXKzhNZEEvMkxMemF1bFlt?=
 =?utf-8?B?b1RQT1BCOFEzV0VtbTA5N3VJRHRMVEx0MFhwTXA1UjJyNVk1Q2JrRDgwSk80?=
 =?utf-8?B?VEJiVEw2a2ZiSmxSR1h4cVloWk1oNU43YjBNWnZmcTFYUExVTDd0MkZxamJS?=
 =?utf-8?B?dERXZWN0NlBTem9Eb1g1SDJRVjVVUG9vckc2QWNqWGV2SXJ5MTNuc2lnWERW?=
 =?utf-8?B?L2hITG9GZUhpMHk0VnlLOWp2VFlhRXQ3M3cyWTRBL0hsaC9iY1JUQ1AwTTAr?=
 =?utf-8?B?UDl5SldzcE9OSW9iYkRoQWlDM2JOYVVkdVdNT1I5NHNDNkVTQW8yTlgraGNT?=
 =?utf-8?B?QWliM3JZampkQ1N5QXU3SktPd3prV0g2QW9pNVhqcW1TQTZobDMxSlVZVXI2?=
 =?utf-8?B?cEttZXFhUVF6TE9QRlJHSFNHZTR2M3VTZWNWSWIzbzRJbXd2anZndVVsMys0?=
 =?utf-8?B?MUFLeU0wUVNYUGx5UjFXRXE5d2wrekZuc09nNWUwVXZibTF6dzlKbjIva1hl?=
 =?utf-8?B?SVR0WVUwc2VkU1daSGwxUjE2LzNEK1R2SGlBcm5KSnU4R2hOZHBvUHNMbkVq?=
 =?utf-8?B?dEFPNlUya0NFNTZEMitDUDFwQ3hGSXdKQTNiRVRSYnBwQlBsNzJJZHU4YXFo?=
 =?utf-8?B?Mmd3WCtlL3hsRVlLUWlYQ0F3a0luT25GOUxOdngvYzBsZlBCMGYrc2xmMzBX?=
 =?utf-8?B?bTMvSSsyZWxseCtIaWJLdGdYR0VkV2xkdzdRSWRKL1I3WGp5MkFoWFRzTjVt?=
 =?utf-8?B?cnZNaithZm9ZblJ1OE9NV3hUYlNoejREZGN5TlR1dTRDdzJsVVBsdmVFcDUr?=
 =?utf-8?B?RER3ZzViOGJpdmJaRXVKeHZJRFd1OE10V1pucmF5a0FIZHpBMzFmdmJ1c0h6?=
 =?utf-8?B?Z1lWbjVpS01SVFhlRWViQy9TT1FmcFlhWUg1RWJqV0lMVXlrNVg0ZjhCc0hB?=
 =?utf-8?B?ckt5UWY2QkdjQldKbVU0SXoyU3RxNFc4Ry80d1RSZGh0bWVRdjNwZFp3ZnB1?=
 =?utf-8?B?ZUtpd0JMTE9GWDNHWkRKNGo3SUNUcFg2NzZTMVl4YkVpbSt0clJxVjNBMjBj?=
 =?utf-8?B?YmZVUjZUNEhBSXVoNnhhRlZ1MUZQQ3pObkdLUXFPSkVNM2dBakkwcjA4V3pR?=
 =?utf-8?B?QkozMXp1Q09nNkpibU82TVI5SVZBbDZJL2xEVm94L3h4Mm4zWS91UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b189720-0ad0-4ef1-473b-08de85971fe8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:08:45.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll3PVp4lohC14iJAuhTo9/OGH4i4dGbQm9my4XZSAKcez8p9BDzm3OoJmVh3Xlwks4ZeLUXEervjLd8UUFPBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7663
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F28D12C860A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The subject should possibly mention NPT, as reading HAP one would
assume it applies to both EPT and NPT (and the EPT side is already
done here):

x86/hap: Defer NPT P2M TLB flushes

On Wed, Mar 18, 2026 at 05:13:24PM +0000, Ross Lagerwall wrote:
> Like the EPT code, defer TLB flushes to reduce the number of flushes and
> avoid holding the P2M lock while flushing. This can substantially
> improve performance in some scenarios.
> 
> The cases where the TLB needs to be flushed without deferring are
> already handled by the call to p2m_tlb_flush_sync() in p2m_free_ptp().
> 
> Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/mm/hap/hap.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index a337752bf488..1eba995c7b39 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -813,16 +813,26 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
>  
>  static void cf_check
>  hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
> +{
> +    if ( oflags & _PAGE_PRESENT )
> +    {
> +        ASSERT(p2m->defer_flush);

Here I'm unsure whether we might want to do:

if ( !p2m->defer_flush )
{
    ASSERT_UNREACHABLE();
    guest_flush_tlb_mask(d, d->dirty_cpumask);
}

Instead of just asserting that the defer_flush field is set, to be on
the safe(r) side.

Thanks, Roger.

