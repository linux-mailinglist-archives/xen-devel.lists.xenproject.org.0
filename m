Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L6DIGfZqmkZXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:40:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0403221EBA
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247764.1546225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVPv-00057J-Pj; Fri, 06 Mar 2026 13:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247764.1546225; Fri, 06 Mar 2026 13:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVPv-00055V-Mo; Fri, 06 Mar 2026 13:40:35 +0000
Received: by outflank-mailman (input) for mailman id 1247764;
 Fri, 06 Mar 2026 13:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vyVPt-00055P-Kl
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 13:40:33 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0acf83d7-1962-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 14:40:31 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 13:40:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 13:40:27 +0000
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
X-Inumbo-ID: 0acf83d7-1962-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6J/HvQrEX545xgGVxuN2GhZnMMGrAgzho9FqJF35x/IcDrmgknNIwmY0OlJjX3U8+gifIBCwrUqau8choEyvp4n/I54Oc7nxPLz6aMUXXpvuLWBHKBVLnCH0MWYEF7iptLRP5XRl5sxt17Ms3FoNnf+iX2UIiR9LOOTdr74NOufekP9/aZvrP36eZ9lL/MoTcf06rXjh3xGfn6yD1gYp3MkJOhJf4xnL9uVUn5Nso3p0zXCjE2blbXJ1Ruum3oeSKPKkUCusb8AUIgguTgqAIGMczS5639xh+f+sseMKuI/usP81TFmW+OdqilJhA+A7wRGJETVfpgUBzKcLyJ20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls2j1H9MEcE+FCeSzwwR0GbbmO14BTVpAOo+CYkzJ6U=;
 b=NbfAdS8m8zerWcg4gXzVQOG6K/y/S3uHf7h/o8UrP4jjT+nZ1wJQEnEoQg8FAv+JIyrfoYiNNu5olObU8QduSc9sup/S+6xatUrIwz7j/1e3lv9JLBpZX3q6UMk9sGyUb797On6kc7TR4opfXFuX2WnKXyl4JewhiY4c6XStW3fWSZfOma2nCcblMbCrY7lWPb2gkr6ON9LV+SciwzR6puL12Ub8sjPHkI6tUziiXyvpcJtgmKLsShKlD9t4yciS8JRc3cx1r7P4ltzyawLV75T6QeBhDzLmaWitxq9c6u5hfJdTsTKW81eq9asdzYz8miZTYTgRRv/w0INQlsJZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls2j1H9MEcE+FCeSzwwR0GbbmO14BTVpAOo+CYkzJ6U=;
 b=SvjjwkKBH+8fBdmgGxa6ZfgfYFFXYpP7qTJyfjXAUc7Clgq65L0raUGIPcqcqDMiZ6Vp9jEEuitZISp4lQq9uG3AW+lUb/DjImC30NCXPL2Ca/43Y0r+Ij+TS3YXQaV4syXH7m1aKLxe/qaz+gAzhDogHca/oaryB12KWXhX5go=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Mar 2026 14:40:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Advertise and support extended destination IDs
 for MSI/IO-APIC
Message-ID: <aarZRxNKjhimnHgl@macbook.local>
References: <20260209113412.2603088-1-julian.vetter@vates.tech>
 <aYneEnAa-LqQt8Gm@Mac.lan>
 <993fafc6-330b-4680-8284-983efb7694f8@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <993fafc6-330b-4680-8284-983efb7694f8@vates.tech>
X-ClientProxiedBy: MR1P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 7becf6c4-3fc5-41ff-48ed-08de7b85ecf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	Z0s7KWYyk0EzOXyta/69WTm38Uew7v90CEcuzJyCqSoaqxE+kRmccmlGXPdg1DDdoE/JKlg49wWNLqhpgF+UJNC3q69nwuL17r4vK4iBR6xphT8PrFyxPK5Qvgwn4bdj7yIeQbCMu7DBEsAqi8mmN0nZPdxw44wY19Isewhz6MGWG+UHkFtQEyVpNoCZ0z6etzu8f64CpSblf+3xW8Yz3GjiphQ0q4dPki6S4Anp6Ptu5QKXfut3XZH+q5RXTtxEMAsqeC8wzU/axa5o60vX+QYZ6pOV6KxMnc+biKRR7JmFP2dOsFNquP/Ah51G8ixTnMaXQE/QRR0S4rRKVtQKTQote+LcsVhwa1GfT0trLPqb+326rJnsE1QHNV3rUm9AwrUAV/T93Plx/6HmwWNU2oI2T26zWn/066zGt6ahh5h+pSmyagJBbUi65boWU0AsYwZrOosn4eCPIT3TopN47lZ08oOAdUGRF7Q6Sx6WypYbuykVt82Jp2pb8Qq74n1HKNMNG3hkbxfTF6DwHnz9zsRUz2Egmj1lgbQjPb6M/JIloyKMYTCCBY9NPEPREeiK0QBTU6RurqWQEXITuWQKKozek4yrjwIDDbJURL8FJKvv0mM0BiaC26nPXdG0UwKKXTotlY3CdAsKcAqFexmVuoYzj/ukhfKmb4rOUsQ0A77hf8NR42ay1/EES6o9xgImyifPh5+QyKLKMRyHsuK/WRGU5rhZOqXBH8IzihyVsdA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUNRODlMNkpTVmdOZHNjREtqbGx3eWlTaXFxWHZnU2JPZzV5UzNpeXVNUUpS?=
 =?utf-8?B?UlA5SVVxdittMld1akpQRWtuRmJTbm5DbmxwYU1Oa1RQbEVIcXRvaTI1dnZF?=
 =?utf-8?B?THh1d0hKVGxCdTVZbHZ4czdCYlZ1NVNLc3BQYlB0b0U5bFNqYTlYRUY3WG8z?=
 =?utf-8?B?SERtQVdRMmdRaVA1a0NMSlZpNWY0SWxYa2dnQmd0RjI3TTF5cUpXZ0EyeTlI?=
 =?utf-8?B?MXROSDdJaGlXbThienFGSWtkRjhjbDBqRUJBaUhjMkNnN2toMUh4bi9yWC9N?=
 =?utf-8?B?WWZhZ1RMSHZsUE9QRjVSZXNTOHZ5R2NPT2praWpYdmZYdkZ0bDdQdEFtVWtN?=
 =?utf-8?B?OGc1OE5QTTNINXJ4dmtXUis3TEkrTlEzV21jbXd3dlBvQXk4SXRjYkFCQjRo?=
 =?utf-8?B?YjhvYjNEMnFiWkVlYzJVb1ROeGYxeDNQYzB3K1BYVkJleXFYOFRhOEROd3Uz?=
 =?utf-8?B?SEdKd3MzUXNsYS9JbEdJbTNlN09GSGtNOG5RWGlRNlFsSmcyUU1kWnhyK0Mr?=
 =?utf-8?B?SE83cGU3ZHFwMEZ6a0J0ZkZKaVZKRktaaExlcGMxTjgvS1gvM0RMcTcwbXB3?=
 =?utf-8?B?NWdFcHROcHQwZ3FDQnVPQjFVTlVSd2g4WHJqSlRQMDNHRGxOcFQvL0xVZS9K?=
 =?utf-8?B?b2JHSW5URUZOV0QzMW5SYmYxUE9QOFdrWlR4MVRtRUdNa0NOckZoNzlyWXl4?=
 =?utf-8?B?MzQvZllrQjUzTEJJWEhDeUsrWWlBTngwNlF3L0EyenlIQ3h5SmtwbFNPZWhq?=
 =?utf-8?B?WGZ5S2VsR2o1c1JzVXhCc05CVEVzd2oyL05XWUFFRHJaSnhaR2w3SXMzNkp0?=
 =?utf-8?B?dkJBbVI2aUtYVkJQNzRDTHk3S2FVUGxWbTBoRGR0WmI5Y3BZdnpCRy9Wb1Ax?=
 =?utf-8?B?UC9NUnZtc3Z2WXplemxWazFXNHpkRDZoQU15WVN3cGU0Wk5yalpSNmlkanNt?=
 =?utf-8?B?UmxlTFVYb1FlODlrWEd2WnoraXM0a0V3Y3RFUTE0NE9wYzJBWlo2SnZGU2cx?=
 =?utf-8?B?dWJvU2pmMlVPQjJoSElwaFlHZDFmNUdVVytCSGNsQjlYS3ZrWFBQdWpqQ3Zt?=
 =?utf-8?B?Q3crU29BRmwzTi9tOW40Uy8vVXlia3Q5R0NMOXp3b0ljb2VsVVhZM0pHTWtC?=
 =?utf-8?B?bTlFWnd6YkFnVjNtWllyeXQ1TGZneW9hY1JBejZmMDhBOHRXRmVYd00rQkNv?=
 =?utf-8?B?aVNPUnBjZVVxb1Btbmc2SHZlaFZ3WUJ5d21FaWl4cTY5cXJpMXlGS0tIMDNk?=
 =?utf-8?B?QmxJVUtJWXZMOW5YM042T1k4M3RHbW9zT2YyS3VFeFZGOE9oMGRxcXdyb2g2?=
 =?utf-8?B?cjhBWTJNQ3V5K24yeTFSMGlveVRpazdob0JoRWRRZnhOVmcxb3BZQVZrNCtT?=
 =?utf-8?B?aHE5aWZCMTRuU0NmRTlFVEFobG1zTVRjemRLMnM3Ly9IWExpVXBZLzdTWEd6?=
 =?utf-8?B?bUZqcllqTXEvbFNsMW15UDl4dmEyNzRTd1grSkY2OVpNN2RhdnJRa1ZYVjFW?=
 =?utf-8?B?ekxMc0JhR1Ric3JZYWZHbEcwTzRqMGxiclVycm9PN0g3Rno5bFpVVVJHTkRE?=
 =?utf-8?B?dlZ4a09Eb1dVN0NMeDUvWTYyV3hIQmZDc25uV29CaitPQVhaOWdidmJGeXBy?=
 =?utf-8?B?VExydURWVUdteG9GNGZPTm02a1EwTVdqNzFuTnc5TWprNWdsQjVSNWE5eGEr?=
 =?utf-8?B?V21tWk0xd0RBNVF5WDZEVVpxaE45ek9uR21oNTVrWDY4TUkxWHhXSzEwTEJq?=
 =?utf-8?B?Z2tvUk9BbXFWeDZLTkYrbDJpUU1aczRvaU4rdFFQRUpDSlQ5bTllYkkvTXNH?=
 =?utf-8?B?N2FHbnVpZW43Q05WY0RyWSsrQm1ZellJRmtUM3FIYlZCZEJweXd2ODhsYUVp?=
 =?utf-8?B?OStVcVJDbzArbUF1azlDT3FkTSsyOEhNYUFSL0hVZlFwRFRtblUvcnhPOGU3?=
 =?utf-8?B?d0V0SVYyVXRDRElxdUJoa0x2ZVBrMEtEdTVwbjBvUnhIbUpaRUdkVTRxVzdZ?=
 =?utf-8?B?VFBIM1NCeUxQSnpvUnhhTDJ3ODlKdGdTV2ZLZ0VENHNvVUtWTitSVEF6dXRO?=
 =?utf-8?B?MFduYjR0N25ITTl4ZWRYWVArdHlqR2IzV01LMDVoN3F6cC9iMXBkaE4zRGgy?=
 =?utf-8?B?ZXlHanpxbjF6YXhWdUdnRVc3bW40R080S3piWlI5MXJ5LzZCbWd1SnFVN2RC?=
 =?utf-8?B?Z1pmVGhxeE9PempuNFlqbjRPZ2RGa2FPS0Z3cjlVc1RkcTVYaEVTR0dMQmVh?=
 =?utf-8?B?NzZqV3Z3b3RUa2VTN0ZHS3JJTmt1VVRoOW56VmdtdHNCRmN6YjVzSDNyUXQ2?=
 =?utf-8?B?TkEwbnVlT3BvdzBNSnYzZ1AzTVNheDkwSlp2SDB5d0lGakRvSlhGUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7becf6c4-3fc5-41ff-48ed-08de7b85ecf4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:40:27.1235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUdS/PfFtcuIR2jwS0AB/b0I/Tvphbi/R4H9kK5b6H4TFseRkOlWgIs0Asmx7/YmRGZb8EEq8OPt2MYW3Ij8ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5196
X-Rspamd-Queue-Id: D0403221EBA
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:44:47PM +0000, Julian Vetter wrote:
> 
> 
> On 2/9/26 14:16, Roger Pau Monné wrote:
> > On Mon, Feb 09, 2026 at 11:34:18AM +0000, Julian Vetter wrote:
> >> x2APIC guests with more than 128 vCPUs have APIC IDs above 255, but MSI
> >> addresses and IO-APIC RTEs only provide an 8-bit destination field.
> >> Without extended destination ID support, Linux limits the maximum usable
> >> APIC ID to 255, refusing to bring up vCPUs beyond that limit. So,
> >> advertise XEN_HVM_CPUID_EXT_DEST_ID in the HVM hypervisor CPUID leaf,
> >> signalling that guests may use MSI address bits 11:5 and IO-APIC RTE
> >> bits 55:49 as additional high destination ID bits. This expands the
> >> destination ID from 8 to 15 bits.
> >>
> >> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> >> ---
> >>   xen/arch/x86/cpuid.c                   |  9 +++++++++
> >>   xen/arch/x86/hvm/irq.c                 | 11 ++++++++++-
> >>   xen/arch/x86/hvm/vioapic.c             |  2 +-
> >>   xen/arch/x86/hvm/vmsi.c                |  4 ++--
> >>   xen/arch/x86/include/asm/hvm/hvm.h     |  4 ++--
> >>   xen/arch/x86/include/asm/hvm/vioapic.h | 13 +++++++++++++
> >>   xen/arch/x86/include/asm/msi.h         |  3 +++
> >>   7 files changed, 40 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> >> index d85be20d86..fb17c71d74 100644
> >> --- a/xen/arch/x86/cpuid.c
> >> +++ b/xen/arch/x86/cpuid.c
> >> @@ -148,6 +148,15 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>           res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
> >>           res->c = d->domain_id;
> >>   
> >> +        /*
> >> +         * Advertise extended destination ID support. This allows guests to use
> >> +         * bits 11:5 of the MSI address and bits 55:49 of the IO-APIC RTE for
> >> +         * additional destination ID bits, expanding the addressable APIC ID
> >> +         * range from 8 to 15 bits. This is required for x2APIC guests with
> >> +         * APIC IDs > 255.
> >> +         */
> >> +        res->a |= XEN_HVM_CPUID_EXT_DEST_ID;
> > 
> > This cannot be unilaterally advertised: you need a QEMU (or in general
> > any device model that manages PCI passthrough) to understand the
> > extended destination mode.  This requires the introduction of
> > a new XEN_DOMCTL_bind_pt_irq equivalent hypercall, that can take an
> > extended destination ID not limited to 256 values:
> > 
> > struct xen_domctl_bind_pt_irq {
> > [...]
> >               uint32_t gflags;
> > #define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK 0x0000ff
> > 
> > When doing PCI passthrough it's QEMU the entity that decodes the MSI
> > address and data fields, and hence would need expanding (and
> > negotiation with Xen) about whether the Extended ID feature can be
> > advertised.
> > 
> > It would be good to introduce a new XEN_DMOP_* set of hypercalls that
> > support Extended ID to do the PCI passthrough interrupt binding.
> 
> Thank you for your feedback. But wouldn't it be enough if QEMU extracts 
> the additional bits from the gflags and pass it on to XEN?

Possibly, you need to use the still unused 7 bits at the top of the
flags field AFAICT.

> In 
> pt_irq_create_bind I already extract the additional bits. In QEMU the 
> function msi_dest_id would just need to extract the additional bits 
> before calling xc_domain_update_msi_irq. The gflags argument in 
> xc_domain_update_msi_irq is 32Bits, so there is enough room to pass the 
> additional bits. What do you think?

It's possible.  However there's still a question of how does QEMU
signal Xen that it implements the extended destination logic?? QMEU
and Xen are two separate components, and Xen cannot unilaterally
advertise support for Extended IDs if QEMU doesn't actually implement
it.  You need some kind of negotiation between the device model and
Xen.

It would IMO be way better if we could simply avoid having to parse
the MSI address and data fields in QEMU, and just forward them to Xen.
Then Xen could interpret them in whatever format it wants, and there
would be no negotiation needed between QEMU and Xen.

XEN_DOMCTL_{un}bind_pt_irq hypercalls have no reason to be domctls, it
would be much better if we introduced equivalent DM ops, as that would
remove toe usage of two unstable hypercalls from QEMU and would
bring us closer to QEMU not being tied to running Xen version.  Hence
my recommendation to take this opportinity to introduce a new pair of
DM ops to replace those domctls.

Thanks, Roger.

