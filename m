Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMxLEJ9OqGmvsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:24:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A426D20296B
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245613.1544968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxo4m-000494-BC; Wed, 04 Mar 2026 15:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245613.1544968; Wed, 04 Mar 2026 15:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxo4m-00046M-8H; Wed, 04 Mar 2026 15:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1245613;
 Wed, 04 Mar 2026 15:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxo4l-00046D-DI
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:23:51 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 221c5a84-17de-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 16:23:46 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6576.namprd03.prod.outlook.com (2603:10b6:510:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:23:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:23:41 +0000
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
X-Inumbo-ID: 221c5a84-17de-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbkyTNPSRCM52UNnz/RrbYSaHcfDseT0h4UVDzqlBeLiE/jRvGIUjzi3W4AB/bej9pARRsrn85qk2yt65wUv8bNDxoxUU4BN7sRkRpb3uSSQBmjnLrHZZjibddaUw+ndnJiOrcR0fk+1L9YG/3VQ19ZV08+q//CRKOGn0lT/ifMkqeFldgYg5iCRcxpWU0g6C+Yf+A29MncbCbzvdCKG8Zk8t3Wcy0WEZ0f/Uaj0ovXllJ2EMGHz8qcgx7kMGmBMPsdJSaIK5zmbwGrzFG825u5u7IQ7WYsz7psqVmQP+sfdG4bACByn1PaNZQgnfZ5J4+SMOK6JMQ6v4+5LsHpVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eDQGeM3BN14L0eXKMI26nHxKJwZ35+HWJqpeczVuNs=;
 b=F9gLIdhDtwfUT1Uzge/WVHuqwEeHmKhKOPVTI3hwF33jyNzL8sRDYS2MGyA7mY7hbIpw9Gnc+Wb1EGfHcM1XsKurKZ5jDAl+DEl3XmBjzwqZn5dYoXGj4/SRhAMwP7z7cYRgYCDgcDZbgHCptdRZ/VeyWlcf9X44OKEk9NJp9YZ+xYTFblhUzVoxalGhIE722ICPCoEg3xIhtG1u9/iMVMDA6U9UNkqs/XkeLzq0wqRDnetYQcxGSPxV5hgYuNCTwTtETIbmFDFsFdjUJQ36GbpXjpaC7rjMTuNqppoKZMEAgIXSqwsF0t/FgFkyg1wNCUyc6UMOAsmQzsl4FHHr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eDQGeM3BN14L0eXKMI26nHxKJwZ35+HWJqpeczVuNs=;
 b=k+OmL9sv/Y42pP11/v3Fkzx1hmhM/oDEelTnRPN2Y8YS0rAva7+lFatbEcBhI0q3f7PznsAv9nYmwpGtf1K+tNrSr6LPGAH2CUt9N/2vuCGTRvVFOAQYnI48QBmfLmpbESFrcXy5alX76BeccttiB/mms00DeOhzQZ/TEQoQGds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 16:23:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
Message-ID: <aahOeefbhHq7IZZx@macbook.local>
References: <20260226025740.71673-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226025740.71673-1-stewart.hildebrand@amd.com>
X-ClientProxiedBy: MR1P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::23) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1e8f29-b2ac-4667-ab49-08de7a020447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	abt1ytA/XxOt+FKuA/79G7jI3yUXFQzuyu4/JSK8ID+FYI+bX7vGw0jhdIxiwr5vV9GXSf9nySGlKJnH04pO+IQe9revmIUqmnm/bxZsgvAIfxjCWWEZFhFUsbeqMWpMdplTEpMibIvAYhEoCtpCT2215zm06zzfUIkbL5j64ZwivtdpUKUt3jdRXSkTUGNhuXw3B7R47rKrWuqDuTWymlbagJY4HGjnHDq/dufOS793WhDccjy3AyX8xoz64A5WlRpm3xbaH/mOehzsp6WUXrkVVIUUY+1LmTKOlTv7oPieVI55xATnmt2zgx8BaS1npUxM60+YkE0y2VEI9A6BMC9hv/joE7TKgyz8hHkjqmzIlPDJHEvIwSI/eLhH5yJE5Ew93fvjwTJ33zxqoqxL5YM68+MJJp1ld0mU8JAWEN2KS1HE8yHxzmNT61sWuj1ySolVjHEwjA1tZ7NbdAuj+0TdVgx1/RvjLg2nzcduaNrDJL0GYrKTpki8vxnsbqYWfCfu4q5FEXuO7TZpuYn2WG5ioUDpLFfp4vydiGMRPpmZ/F8tOjXJq2quNkgBLfSPS7aRSqNNXY5xIOx2xt4ewWW//VZ24gQ3EgwUn5FzyGWiyzgaZ7x0g1bVYVVm/TTL58AQOGNThpS4awiIdQTdMkBLKWwWgiceR+608fpSaXP/0Hi75oR4Q0B6BJSNtNRVxl4vB/rCevZl7UOOiFh5upfcIVA0QScglnruha/m6JM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3lmb2ZhOFRkRUJPMWlCTUJsS1k0YUE2K1BYajh3Vk9zVlVsRk1sYVVscWo1?=
 =?utf-8?B?ckFkWitxc3loblFmTWFEeXZNTXBHYm5SZDVMSEpkVWNET3grMFYxNHNXUWNl?=
 =?utf-8?B?S2RwQWppTW9yZGNGcmhDWTVwSUlndzdxZ1RXUUYyOWtQZGhoNi85VFBOLzIw?=
 =?utf-8?B?TENVWEhJYytYcnhVNEhSQzA5NXVVY3RkRS9yUC9jQU9PRm1TbFkvRE1kL1BH?=
 =?utf-8?B?cGxtS2Q5ZzdPdXVRNXFVTWo1ZjMwZDI4bmpFL1JxTlplRjdHV1h3VXBUcXpm?=
 =?utf-8?B?K3UwU1o5Rk8rMExGNGJLMm1POTliSUJGVWdKWG1vdFdSWDFnaytYOE5Ib0xZ?=
 =?utf-8?B?WFU3aEdnaWFobTNxeGtRSHVKRXc4MGY4emtxM2xyUUxtZlJvQngweWpIb0kw?=
 =?utf-8?B?OWpPQVh3NW4xTW5oS0Irb0doZVQ5NTFtZDFUeXFobVUwcWFnSXVjSTZuMG5v?=
 =?utf-8?B?dDAwdEhlc3dTZitKa3p3TlliZDljR1pDUVJSSlV2cFVyK2cxaUwyOEo0R1ZD?=
 =?utf-8?B?bktKWDZYRzZMSnA3NWtIZG1LMWM1LzRiK0k2UkFDSFE3YnlSaE5YWUFqbkdt?=
 =?utf-8?B?MEplUFppQS9RUUFZbjV4bk8rWndiT1JMaHEzbmhUQ3Q4RVBqM3llNmFpZkxn?=
 =?utf-8?B?MFBBeGZQK2xudTl3NVM0eTRrdC91WFNUcnl5UHN1bjBVS3IyeW1jL2g2dVFM?=
 =?utf-8?B?QThCUWRTOFhxL3BHbTRIM1prVmxwZ2FlUFRLVUVSVUMvOXNVZFc2WEQxcUFV?=
 =?utf-8?B?L0RPRG1Uck1OclU0dmVBdVUxcFlVR25RVm9NeDBwR3ErR0RCU3FORXdSd0Jh?=
 =?utf-8?B?WG00bU45ZkJ2WG5XSzVYbUZXQzZmWm1PVGRkN2FibTJUK3ZpMTJYWEpSbTkx?=
 =?utf-8?B?QUhXeXgzVHY4d0w3U2c3L0x6aHZOdXN5akx0cDJvTTAvLzdOZEhaSXBDY056?=
 =?utf-8?B?bTY3NWY4V2REN0QyYnhXOUhKRHhLZ3ZCZUJWdERORjhSMFVuZmowQXNJTG9l?=
 =?utf-8?B?ejhHNmdzZWtmL1NMV1BxSFVyVnFQaTMxMVV2QTJTcmF1ODM3NlRBaXFZMlk5?=
 =?utf-8?B?aWx0dHhWelpvcGVWU2llQkJYZU5INnJnVTBXblRYdGtyWUk1T1F4S2ZQVDhW?=
 =?utf-8?B?QkZycTR3WlpGZWRxY29JUWxsRy8xTEcrei9aREY1M0tmTXhMajB2US9meHJ1?=
 =?utf-8?B?VHoxazVWRkFNaUpZc0haREFaSFVxT0pkR2NTWVI2ckNwYXFnUlpVU0tDS0pW?=
 =?utf-8?B?SEEvM2hxT0tJbEpjeVkybmI1MEdNZnVWN0lkUTNBcUlmODh4V3NrTHQ2MlVQ?=
 =?utf-8?B?ZW1xQWJuZlV5ZFl1OTRMSHpwNFJlS1lQOE5Wa3dUYmpmT0VUNzBneUpROUNK?=
 =?utf-8?B?VG1VTzFDdFpFRkhXZDNrb1F6Zys0RjZCLzZ6SDE0TXZGOWo0QkZjK1BlQmVy?=
 =?utf-8?B?V3djWThSNnVuRm5JRksxWlFKQWFOVEhiL0JCOTloZzBhSFpnbXErNzMxT2wv?=
 =?utf-8?B?MkV1UmRsbXhQbTRCT2h3RXBZZWNBRlJlemNaS3BrRXNEbWFTSllBVU9qTDQr?=
 =?utf-8?B?UVh3SlFUYWxWT3FWR3FyTUc4bXdzNlJQOGtCVWFrYngxVll0OFh3cHgraVFh?=
 =?utf-8?B?dnlHaVJqQzVXN3dRWUR1K3QyV0Qza3N4RjVWTFVoY0NoS3VpR1YzcW1hQnhl?=
 =?utf-8?B?amZPbG8wV2F6TnM5WmdZeXlmRXJEN0lOMUtSL1RIY0Rka1l1elpZbG9iQjIr?=
 =?utf-8?B?NXJNdkI4VDNMREMwSnVQZ0Q1d3ltUi82endiblhJMnFPY2Z0ZHZwNFVpRFdM?=
 =?utf-8?B?T3Nvc0NqbXJ0aXFYV1ROUXFGcElSTUpIbGwrbkl3ZGJrZUhQazd4S1Yyem9L?=
 =?utf-8?B?OWtySkF3Tzh5b2VaZ2xDOG9jYWRDM0tjRE9tTWlQdUMyLzArQ2p0SjJEQUsr?=
 =?utf-8?B?aElKNnF2MEpoVjZCcWFqeUJwNnZPUnZ4VVpLMC9HYjZudSs3SnQ1T1RHRG9L?=
 =?utf-8?B?K1M2NE9NU2RKWEV2c2JCNjlPeHpCOTFXQU9DQXo3Z3F0Y0RBOHJrSkNqek5n?=
 =?utf-8?B?OVp2NWlPWjBuRGpOd3R2eXZKdFdkOVB3Q0x1dTdNcGVFeUdpL3VHbmxJa3J4?=
 =?utf-8?B?Ykc0Z3BuL1JiN1FEbmNGdDA1OENBWkRtOURRLzVRdHpXSzBaYjQwN0JUeDhR?=
 =?utf-8?B?cko4dzV3dzhVK0JjeW1UK2VNK0hJaEh6clQwdGhIRDc4eWlkblE5eHRYWmE4?=
 =?utf-8?B?cTZsZ3d3MkpHS0VaajZmbnQ2WXo3Mk5RZmt2SmFHcWR5dmZ3M3IwVTYwMnA4?=
 =?utf-8?B?NFkwTHltUEZmZU43WnY2QVJEblNDRWc3bGxIYXJMd21BOUdMb3RXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1e8f29-b2ac-4667-ab49-08de7a020447
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:23:41.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Sj5o31KoHTkf1GQQM3ipVJuuVuQr7ScFd8NIBv72ejXP+IAOeV61AJ9LvxdZXEYZMVKxnb2KI47iNkoSvfwWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6576
X-Rspamd-Queue-Id: A426D20296B
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,macbook.local:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 09:57:38PM -0500, Stewart Hildebrand wrote:
> A hotplugged PCI device may be added uninitialized. In particular,
> memory decoding might be disabled and the BARs might be zeroed. In this
> case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
> unconditionally attempts to punch holes in p2m, leading to init_msix()
> failing:
> 
> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
> 
> vpci_make_msix_hole() should only attempt to punch holes if the BARs
> containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
> for checking if a BAR is enabled, and add a check for the situation
> inside vpci_make_msix_hole().
> 
> As a result of the newly introduced checks in vpci_make_msix_hole(),
> move the call to vpci_make_msix_hole() within modify_decoding() to after
> setting ->enabled.
> 
> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

