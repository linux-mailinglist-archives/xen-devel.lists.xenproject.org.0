Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMPZH7FKqGmvsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:07:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3C2023D7
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245568.1544928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnog-0007qh-5x; Wed, 04 Mar 2026 15:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245568.1544928; Wed, 04 Mar 2026 15:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnog-0007oH-2J; Wed, 04 Mar 2026 15:07:14 +0000
Received: by outflank-mailman (input) for mailman id 1245568;
 Wed, 04 Mar 2026 15:07:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxnof-0007oB-2g
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:07:13 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceefa75a-17db-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 16:07:07 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5907.namprd03.prod.outlook.com (2603:10b6:303:6e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:07:01 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:07:01 +0000
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
X-Inumbo-ID: ceefa75a-17db-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTSsdKySWC6+lF+heAi56WpZltXcvfwjYCwZEWdxiUfgpbiSRlJjhh+eZzYt0USZ7h1P9CIlMxBWKmWgvzLY/IJdQULJcNPDfTn2hjlvN0r9pcevBJKrXKAsxhOW73iK0P4NVdyNMd6ugaCRbWvGaTTKTLUEJWy/MkJZz30JMqlB2iUGchkty41Hcg/M+t/BEple0DGb0cPROqrGuJHS0a8JWULmB5JG8RhB4TKGb7P35DeCYihAR/Dun/vkeM9xGab+3Fldiz0SpwceeXVvrqYFfF7RulgyI49NdsdrzYOH/gp8K9Mj9kETjK2giI/03n1i+orItgyHtsUWQ7dK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maYv6YMM0hf8D0RaHXdIXUzwWjEs/blJ6dpfrYIT3xM=;
 b=hNpHLNTcr60W0kiPOhziPX0C8lQK5VVEBctY/twYHCDL3+UB5wfS+qlnmTrs4lHthJ5jRH3AH0IeH0tNTnu4FhG3oBS9LpLWCaRTOVhFDLuzS5CMd2cv7EFdMPYkHZBGJV8Kh+8U3Hh/5pV/r/JZDEBrySJ65XxJKkezmBgwZWBARsUMrEQrg9pDN8sFxM8lvvkDTT1ALLkjYZ0MdAQBWn6P3S5zPDf0E5uVL9FLIAG4f4Ac8K/y3afrzTF9xBN4gX3kmO2XySQzx6tyNERgfmq8wLodUMbiEsN3E2vVNdnqgBnv7gp8PpreVjPYZ7Th792AaVzPTdlhkKLuBtX/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maYv6YMM0hf8D0RaHXdIXUzwWjEs/blJ6dpfrYIT3xM=;
 b=XWBn2QcQIxOKxDT9VD2tT2YYvordUZCBkqbt8LU2MkXtcaHg7UBHVb9ZM2pGkQ3oqEvkSAt179Ws8zK3e8QRHBD++vWdifFsPboZ+i4NPvSA/rUfKjJbJyOXcktf6bHqBcIPLTn7hGlZh2itHULVXT3rl73JxqooyWJt6XK8/TU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 16:06:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aahKkV2csf28Y0YC@macbook.local>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
X-ClientProxiedBy: MR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a9bcdc-ea74-4573-41d1-08de79ffb003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	lzXGMbW3nyY85Gg2XW9D6Xq5FVh8OYdd8YPR4vtfidRBWNsiTc4/eAJtqBNk7PeLX7zcJPuJ5wLLH23AeQ8SQBQGh6WgEVQXu5PcVkeVxnv9R12TNMhmEk+Urwj5w+ytJM7nRGh1LHfMhRjUoVFdEO9dIALatn9z9Zij4CIODyYNyOB8xlRYHsRSUlkERd7ydcKwJLNzQjwR+SuT8tRwW6C0BWMxg4wFMpefRIpJboYkA5TDYAPM0bFC8W/AYmlr/bJdEzu2MicW4ePlCHS9jfKoGFm3sCZNtsXrTzN96xLahLL6QRxgMoKl/qHGyhdtYFMLV5obUt2uox3GciEMg75efeKHNQlovORxuGpwZnVcP59D1sK7eB4CU46PYM9+ff1JpVp6XoKFrKJpS3EDyY5uTCeLCj+iBrnUQ0yfbbtaJER7oFsaA9Ws9kuzI3HaFN6bNDfUw4dAzPScVnolp0UZhPqNAkdvX7Uh0UFzmLW5HWO8kiJI3+L04y3807apKizb1vIIKMRUpKGeIbv5UigwPsArZSQRwYTA4QXRwTNAtUleYfPrTmfDSI8VW0LhO0wlIMDZWNThJbEaSybKzUMXPUucPZc7aJrNKEmnVKHuk8Yshay2cSdxvVVs/Vcy5SkKW+IXD72/xQLLmOMF1g+JcvBhbTw3WuSh33wDJNvUaNa7/cGKKh/BWWS8nMpdxlweDs+glGbJOkSTrlXwOPJ0ktCMYmr9uIken+i6PTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2FHWGloTjZUQ0FGMUpMT3p6Z21kV3RqQkRrWmVibHd4Q3RpNVM1TGhqRkUy?=
 =?utf-8?B?a0ZaNVg2NlprZUN1TjVMNmF3c2g2UC9KeXRvaXhJOCs2cGpDTGMwbXNpck9m?=
 =?utf-8?B?bld4Z1JTZUpoay9ZYzZ5WEoyajl3Q011SWp6cHlrVEViYWl3UnVTcDJ0MXQv?=
 =?utf-8?B?ZGVtY3Q3eHQzNkxqVVBJS0d2czJTQ3pDTGJjYmJqdy9xQXNnMDI3Z0NtQndi?=
 =?utf-8?B?Y0d4NXBtWkdkVjJxcnJXek1VRUNwMU1pSzA4Z0NsdUFWcEh3YjN5Z0FLUHQ2?=
 =?utf-8?B?T29DSmtrTW5YRndyeDR5clhmZ000ajVCUEoyOHR6Qy9MTXFOSG5GWkxHWmdF?=
 =?utf-8?B?S2hFc0lHS0ZOdjBKa0J3Z243bVZucW9ucFZ5TDF4aTNyNWtqYkVWWjZFRjEx?=
 =?utf-8?B?aGp0Q2t4YnVKZGcrMnRHT3h4amg5eXlGZnQ4RmszejZuL3F5eVBvMVE1ZmJt?=
 =?utf-8?B?bnorUWlia2N3aGh0V010RVJrNXR3U2w2K2V2b1ZWMUJiNkZxQXRKY3ZhaVA4?=
 =?utf-8?B?a3cvbDAyMlBmS0lJQUJQQzlvd2hpM3FiYU5YUGhtcEhxY2EwRFNncG9WbVNr?=
 =?utf-8?B?WmNTb0pBbFpCU0ZFcU9Ha056cjlnU0tmRWNubWJXTzRvWkdrTjVqaExEZ0U4?=
 =?utf-8?B?OHJnS1dYSE16dEVkNUJGeVNrU0x0VDZnNDlGNXNFUHRjYThtUXlqK3pSNldv?=
 =?utf-8?B?KzdxNXNlcEVUNWRuTVZQMHBmUWVzSUh0cENyd3gwSU0yMllFS0hhSmJobnl2?=
 =?utf-8?B?QTJQTXNXMFRBYWZyNDkxRDdvQ09lZmdFMnR1ZzNLWGg1TFZna085OWdlcU5o?=
 =?utf-8?B?N0FVc1ZDeGR6NUlqS1JTU2x2VEJ5TjR0Rytxdm85MGh4bDRCMFNoUXE1dVZp?=
 =?utf-8?B?UUh4V1krSGtNd21xTVA2ZGVYVE5Yd3FkL3NiWEkxMWpMeUVOdGsvV1JEdkVZ?=
 =?utf-8?B?T3BhQWhLSGNRQ2E0TnFWZkpqN1FERHVuSUsrUDVLTXpIcmxaV21pcXR3SHJy?=
 =?utf-8?B?cTZPaWtKSUNXQWJSdUhrR2V5RVVqNzc2WkJiVmljclliZnVBZFNoZStQMHJX?=
 =?utf-8?B?RWtxNEtXcm5FbGpYaTE1am1wRFV0a0VGbXJ5QUs3aCtiRkphL0xOdnJJM3Nz?=
 =?utf-8?B?aFFNaVNwVlVIcjNERnYvTytjemlwQU9LeVR4VEtEMFE1UDQwdkQyTmpZMDdz?=
 =?utf-8?B?Q2FQSlowcUFLVnViWFFLODRPR1ZaV1grcnNqSFQva2c0Q2g4YmkrUDNyNVl2?=
 =?utf-8?B?YWhWNWxFdEZaSk1BWS9lU0xYQVF0d0J3ZTlMS2tMR1dOYnVBcytrMFViMHpw?=
 =?utf-8?B?NmNkUE8zeTdSSy8ySnlLZkNPbVQ5bExReUxXd3ZJVlQwd25mWlhUSGxDQlk4?=
 =?utf-8?B?ZFV2NEl4RmdxNDUwZ0plZjJYTkc2WGlEd3crcGpvdmdyTFo4Y1M3am5hWS9R?=
 =?utf-8?B?d3kxSGRuWGlRYXJtZnEvdGpXWHpRTzQyYTdjVUFrZkx6WGdKVFBLN1UwVW54?=
 =?utf-8?B?cXlHWDN5TkdqOGs3YWxFdXBqOFFUV1BIRitHRmlNL2tHYkFodmtHQTkrNGhq?=
 =?utf-8?B?U2FkTEpleitHZGt0bjZzaTdGaDFIMFlTUngvQzExNEx3NXNsRktvdG9lKzBu?=
 =?utf-8?B?Z1pHaHpjWiswTmxNU3lYTmpnSmpURG13Vi9jZ21VdER0eG9SQ1ZhSWthVFI2?=
 =?utf-8?B?SHBHLzRpRGJhT2dOOHdlbkRwZjNrYXhkS0tlU1Z2cG12MXUxUHVQZkxpZVV5?=
 =?utf-8?B?eFdEYldRa1k4S2YvcW42MmIzZ2p1cFY4bDNpUEs5Zi9RdDMrWk1QOTRORzhP?=
 =?utf-8?B?VHhlQTVYbEQxa3NqdFFtcHVITTVLclhsbE5aT2dtT2IwK29lNnBrZDNXd1RK?=
 =?utf-8?B?c0tYUUFzREFGcy9PSUFBNVRGbFhDQU9na2VZU3A4YmRkTjM2UHBWc1FYUUl2?=
 =?utf-8?B?M0hpZXFHTWU1a3VXVGV6Q1VHTlREYmxacjc1bUw5QnA5ZGN5ZkI4U01PL1ZZ?=
 =?utf-8?B?cnpyTmVmOEtpeEdrTldjN1VOQW1haFR5TXdQLzFITXZLNTNHUFVuZzdZUm5p?=
 =?utf-8?B?bCtpVEE4S20rQTdRQ3hxZTlVNU8zMVU1QTIrNFcrdlJONTFSUDE5TXlCeVFX?=
 =?utf-8?B?ZmhjdUplSmxvN09zNnltZXp6bTMzeUlWTkUxK0FnOEpWNFZJejRlRlZIc1dr?=
 =?utf-8?B?SGJOak5TdDlObHRseDA1QlFLZFBVOXlFcmtSSkdZMDlxMFg0ZGgrTTA1T0c1?=
 =?utf-8?B?NThiSnNxRFJLeDMrSDRHRW5FWUh1OUdCUFdFa3JyQTRHMnl4enlUTGdmaDkz?=
 =?utf-8?B?WEFaQWhwVXQyY0tGa1JLTmJScEh5QXVmWGM2WERWZ1h3dHU1ZWJBdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a9bcdc-ea74-4573-41d1-08de79ffb003
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:07:01.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnCOOEyqtK3nwJjLN0/C0TeVODocJmMeOZe1373ye39oNVUm0KP7lh+ETkI+zaWzrI+cXAMdGMlZrTMjWdSflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5907
X-Rspamd-Queue-Id: C8A3C2023D7
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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

On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
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
> ---
> vpci_reinit_ext_capabilities()'es return value is checked only to log an
> error; it doesn't feel quite right to fail the hypercall because of this.
> Roger brought up the idea of de-assigning the device in such a case, but
> if a driver doesn't use extended capabilities the device would likely
> continue to work fine, for Dom0 this probably wouldn't be quite right
> anyway, and it's also unclear whether calling deassign_device() could be
> done from this context. Something like what pci_check_disable_device()
> does may be an option, if we really think we need to "break" the device.

We may want to add a note there, stating that we have considered all
possible options, and hiding the capability and hoping the owner
domain would continue to work as expected seems the less bad of all of
them?

> The use of is_hardware_domain() in vpci_cleanup_capabilities() was
> uncommented and hence is left so. Shouldn't there be a DomU-related TODO
> or FIXME?

Hm, yes, possibly.  I think limiting extended space availability to
the hardware domain only has been done "just" because we have no
extended capabilities to expose to domUs so far, and I don't think we
even setup the extended capability list in the domU case.

> ---
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
> @@ -169,8 +171,17 @@ int cf_check physdev_check_pci_extcfg(st
>  
>      ASSERT(pdev->seg == info->segment);
>      if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
> +    {
> +        int rc;
> +
>          pci_check_extcfg(pdev);
>  
> +        rc = vpci_reinit_ext_capabilities(pdev);
> +        if ( rc )
> +            gprintk(XENLOG_ERR, "%pp(%pd): vPCI extcap reinit failed: %d\n",
> +                    &pdev->sbdf, pdev->domain, rc);
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
>      int rc;
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
> @@ -349,22 +352,23 @@ int vpci_init_capabilities(struct pci_de
>      return 0;
>  }
>  
> -void vpci_cleanup_capabilities(struct pci_dev *pdev)
> +void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
>  {

You could short-circuit the function here, ie:

if ( ext_only && !is_hardware_domain(pdev->domain) )
    return;

But I'm not sure that would simplify the code of the function much?
Likewise for vpci_init_capabilities().

>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
>      {
>          const vpci_capability_t *capability = &__start_vpci_array[i];
>          const unsigned int cap = capability->id;
> -        unsigned int pos = 0;
>  
>          if ( !capability->cleanup )
>              continue;
>  
> -        if ( !capability->is_ext )
> -            pos = pci_find_cap_offset(pdev->sbdf, cap);
> -        else if ( is_hardware_domain(pdev->domain) )
> -            pos = pci_find_ext_capability(pdev, cap);
> -        if ( pos )
> +        /*
> +         * Cannot call pci_find_ext_capability() here, as extended config
> +         * space may (no longer) be accessible.
> +         */
> +        if ( capability->is_ext
> +             ? is_hardware_domain(pdev->domain)
> +             : !ext_only && pci_find_cap_offset(pdev->sbdf, cap) )

Given the changes you have done to the reBAR cleanup function, we
could even call capability->cleanup() on domUs, as the handler has to
deal with uninitialized capabilities either way?

>          {
>              int rc = capability->cleanup(pdev, false);
>  
> @@ -376,6 +380,28 @@ void vpci_cleanup_capabilities(struct pc
>      }
>  }
>  
> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
> +{
> +    if ( !pdev->vpci )
> +        return 0;
> +
> +    /*
> +     * FIXME: DomU support is missing.  For already running domains we may
> +     * need to pause them around the entire re-evaluation of extended config
> +     * space accessibility.
> +     */
> +    if ( pdev->domain )
> +        ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_io);

Is this to cope around races?  I don't think it's a valid state to
have pdev->vpci != NULL and pdev->domain == NULL?

Neither you can have pdev->domain == dom_io and pdev->vpci != NULL?

> +
> +    vpci_cleanup_capabilities(pdev, true);
> +
> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
> +        ASSERT_UNREACHABLE();

Ideally this would better be done the other way around.  We first
remove the handlers, and the cleanup the capabilities.  Just to ensure
no stray handler could end up having cached references to data that's
been freed by vpci_cleanup_capabilities().

And we should take the write_lock(&pdev->domain->pci_lock).

Thanks, Roger.

