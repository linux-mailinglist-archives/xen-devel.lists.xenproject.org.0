Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONCmLdQtzWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:38:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAC037C405
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270460.1559122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7whi-00057B-8X; Wed, 01 Apr 2026 14:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270460.1559122; Wed, 01 Apr 2026 14:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7whi-00054C-5g; Wed, 01 Apr 2026 14:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1270460;
 Wed, 01 Apr 2026 14:37:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w7whh-0004zx-0i
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:37:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7whg-003J74-2Y
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:37:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cd2db3-2eae-0a2a0a5409dd-0a2a4506c824-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:37:56 +0200
Received: from [52.101.84.132]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cd2dc3-0df0-0a2a45060019-34655484b1eb-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:37:55 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DU5PR03MB10326.eurprd03.prod.outlook.com (2603:10a6:10:527::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 14:37:53 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 14:37:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn2AdhOVN0I3ENJgKZcTPH1ZRoi4XnRkzaNDloenjZ7CYBmtaZIDcOB/BbWm183iRmeolxuFgA1CigAVFBN7F0akwQMw4ySPM43yJdv+O3DsU/+9u6XmsTdTiafXArA5pTI3wLE2wJDOuZh+bQw3hua976xGlcdu6cwbxLmq7lyZuNjXy9MSFP/9lJwd2OWsjBWkszo9PwOOLEjDFfEr5usK4lnrLLeOQbKz3t6epNXj8gNVCeFLXrngJqWkGHP5ynBV8TLKPz7zyM9Ty/a25dzJGZQ7+1Gop4o0Q70LAWBcUvCw0nhpiUCtLpcbWMMZ2E+wGw2DJFHEPw1E2Zskrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nC86ZtymT+iTFCiexayQuOfNvhH+tl0LE0fjBfesSY=;
 b=Dz+2RIuTkM8oyP+KLX+x8FR6XuWQ4uB/VGtuF2uQ0LrLSm0w3gUMKzc29yOHYKwH+ZTeGxdFodHtm0yiTXcM7YxeOIamP6hxD04bePQBfWrfCe6fkkHQ5uUZ4w1yR1WarkpB0swpVNQpdGzwqatE3GUlchWqUoeAYjSkrQyQuzvk/DXzLwJ/RM1A6DchLKTn1Xbdiy0uDO3Fw24+pX90ERsKcPrFNT7D2BTfNP2B7s6gbmXk9f6lwl6KbpDEfaQxVG/omVE2cbOYANFi1TxESa0bhMN1eEc3DqMs/YoDPEXoGZequ2yMzSWL1j/DBhoITLTY8tUjRgihH4FiHgd7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nC86ZtymT+iTFCiexayQuOfNvhH+tl0LE0fjBfesSY=;
 b=vCzCL22uCtTzeb2FDafkGJqNJeaPsfMo6Y3FbkGbcusb+EhMZ2b2tPIw7+zXzg5TmvLNtp/Tm++iPSj39BN+GFY2e8WUf+ceBaGrahVI+iJACb34LzHy4rFxt5HpKFTllTk8WC0tUvHHDVopUGOJdTYO/0637pBse6jk+rF2yHbfkmb5hpXnl3ex42BtzDNUq7ssKZApIDXVdC1MB+dNLv7FfAFHTwLnwwIvZ88M6Ab3FCet0ZLvPaNPBcYs+iicdB5dEkJrP/Rabbed8XHnNtn7VdLSnx7O4ImLckr/hzO3C2C2iLQ1Y6bKNFw6viDRzakwSV5sfxSiYB4biFcVwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <85028c54-2349-41f1-a2a2-f859c9d07776@epam.com>
Date: Wed, 1 Apr 2026 17:37:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fcb3a80f93ab16b880ed31e82bc61180f3586efd.1775053454.git.oleksii_moisieiev@epam.com>
 <eb89d0de-bf24-47fb-888d-31efffd28a09@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <eb89d0de-bf24-47fb-888d-31efffd28a09@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|DU5PR03MB10326:EE_
X-MS-Office365-Filtering-Correlation-Id: e447dbde-3ca3-49ec-c4c9-08de8ffc4220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Vy9+eIRcii+XzJH1fHDN/IeLkN+k+yzYvraSvoQh9NlaEHLo9zei+l7XKBVaOLP9A7QJcLB6ugvWd3mfI4I/60doCu5aL33PYe+PaWGLu6wG9gZrRNP4QW/GdMpExsszgyru16TArPC7j/ndzpiPw858xb1gaI9zR6/zLpelxsUeASk/FIde+7q4yw/sDyrsks6Apq3Bl8WaYfJTXcl6qBeNDjajTbya5pizyRgeZgLHeXNbvN10BrJqX1MGJVguCCLoyL/j2Wxa32qAFXBY0yaboV6pZOlBZ2v6xhAgZLYoi+SFT6xRgHoXEYLaIFWiN6jOTktJ803+//JNhqqrnu14374TgtaNrIZ8xGRY98CLLOm8hTlg5XK/kKsFoviPhQQUc0oEIAIniDYSReyCamoAiZznJGeHgofwr0z17gF1geFUA18WUG4KEe1bvtfxux3zP6rJKF2p4jTfSW/1v8u2Brd3u+7DvdmNbcKvg9nKUiVzlCAyzeq1caFd6U8g/0uoS8MXAT7cqT5UGoWc/f79eFTWB+X7/bRxc/k3YEMFNifMUdLrFmqaaGrg9FGrkACGykve0mtzKEgqaYZtzrgxp2zqIbu/QRyJrLHX+JTUt5lvbEVpM21yK5y4YVPmrxgc4t8JgJtcu2XfC0NzQx/G8VJMIt+6/Mn9UguNvnrG2Cn8g2O7b/RrgzXra2UezulYDszJ4NP8D0M97PahggE8uIATZWs2n1vAIyC3Xog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alVPYkRmcXJ2cXlSM3lBbHk1Q3Bha3RCTEZXN243ekhxbHYveDN4WnEvZ1FI?=
 =?utf-8?B?bjZMbjFlandqbHNmZ3VMbklqMUxYeGJBU0hYU1Q1TDNSaVU0aHJtRHkzdUhR?=
 =?utf-8?B?V2NxZElwck1WajJoVjFSR1Eza2VqS1hvUCt0VllEUkdXN3ZnSmVkZEZSUko2?=
 =?utf-8?B?OENFcjRBK3lrREhaMHY2R0t2R21MNDAzUnRsMTFMNEtSVzRjdUd5a0ZWSE0x?=
 =?utf-8?B?ZGd6VG1mV3pjeVNGOVNNdXVrZGp5UXo4WmM2S2hJbmJEYmkrc2lmZFB1STBw?=
 =?utf-8?B?NVRoZVZvM1JiVE5iLzV2U0h3RGk2ZGxmbTJ3UXBRelhBTFUrUzZlcTV3ZVJu?=
 =?utf-8?B?R291RGVyeERqWEJlT1AzWVUrbHpraEVQVTRxOXhBNG5FZmhqTDhjdVV3TTFM?=
 =?utf-8?B?L3BTSlNmVm9YdUF6OWJlczJiVlhaS2pDWXp5VTFNSTJGejdRbURtT2xobEM2?=
 =?utf-8?B?WmNLaVJlMmZvVHVRdlROR2NtejkzL2FFQ2Zza1lmQmFkcW5EdFRscW1Bcllt?=
 =?utf-8?B?ZTdxa291cUpqRXo5ZHBaNG1LbnNuOU1XNEt4bS92a1ZiTUx4akZDYzlUbG5n?=
 =?utf-8?B?YTFnTE03Uk0xcUhqZE1wMnpyM3FWalhzaURqN1Rhdm1hcVZLVGR4aEROaklq?=
 =?utf-8?B?dmJnaEIwSllLeVlxUEEzaHZ4M3lVYUw4cDhEODUxMzA0NWIzU0t5eHBEOWs0?=
 =?utf-8?B?VG9EdDk5L2Q1REE4Z2VHcEtzY25UUEorVjZaTkpxUDU5dXhGbzRnNW1OM2lO?=
 =?utf-8?B?akhRSHZlcGlrUDBVZkZJUEZPaEJ6dlZmOEF2TkxUd08zNFBrZFF0WUpuRnBY?=
 =?utf-8?B?ME51NlZjdGdGdTlYcWVBYTlkWnJCUmFLUUk4c2hTNjJ1aDBDeWFOTnUyWVd4?=
 =?utf-8?B?UWt1MnRMSmtDUk51d2lkc1hneUtYSzN3QTJwUllVMTI0SGUxYlpidW1pRk5a?=
 =?utf-8?B?cktkU2xkZ3M4bHRDRG4yWXNuaTRDUVlEbHJSeENtVjhBZklsYUwydUJjdEt1?=
 =?utf-8?B?SmdsdndzYzNDSGtKUHR3M3pzdnVKRzZ2cDlkRG5nTnN6Ukk2V2xEald3QW9L?=
 =?utf-8?B?eXhpYll6bDlHUFEwaTVqUzlpcnRCSnN6R2RJaTJlV2xSbHJWWTFkRGZ4bXNP?=
 =?utf-8?B?NGpwQ1B4MXhud1BPZkZGR3lyTm13MHBPemErNmtzRjNBaWNadDRCNFpaWktL?=
 =?utf-8?B?WkRZamdjUmptbWoyWC9KUDMvMDNlMG9YQzBIWEI4SHpXRi9QZ3NCK29Gc0xh?=
 =?utf-8?B?cDJ2RnJPdTFaVVV1VGp1NG1VU002TWZaQWRlc2FOR0dsSkxpU256MDYvVGo5?=
 =?utf-8?B?d0NRYzhMYkt1LzlnQUR2ZDBYSU5GYlZMVDFSS0R4OFRXSS96bDMvMTZrT09E?=
 =?utf-8?B?M2o2MndldXIwdVIvc0xrV08wR1FCY2d0c0lGZEIwSEtHcCtUL2RRZWR5MWt4?=
 =?utf-8?B?aGZpdGVrU2RpNUQ2bERvRVZQNDk1ZUN2MHpob00wcysrRDZzcFR6bG9NOU1n?=
 =?utf-8?B?Zi9NNFF1bDlWUVk5TGsvL2UybW8xOFArL05KTlkwQ1IydzBEWklMQUYrRGhK?=
 =?utf-8?B?MEI1eEVBWDFhSWdMZGlEM3pvRXc2a001bkFyS2kxMzVkUXZKenJuVlJjd0dG?=
 =?utf-8?B?bmJ6clBnL3E0bXNLeC92eUFjM2daaVVCZFdCeENUUHFGY2tpeHFvd1lNZWph?=
 =?utf-8?B?VmNYSFpUZ3diMGYvaHRKdncyRXNvYU5XbVBZcWJJdUk3a2d2aEsyYkNDaGNL?=
 =?utf-8?B?dXdHWnlEK2o4ck9sOGJlWnhwK3FscGxmZFBIM3JKQ2lpM0cwdVhGU0ZDaFJ1?=
 =?utf-8?B?cUVVYjBjZEhLdjFITXdlSnBJMW9EOWc4SFZ6eHdYNWcrZlRyZlYrcFNHcVhJ?=
 =?utf-8?B?QThucmcwTldTd2JWT01xWDVkZE0zd3lkSmV5QnJSRHFiL2NkSkM1MnNIU0tl?=
 =?utf-8?B?RWNRaFpxYVZFS0IwWkJNWWlRVHlLSlVpZXZPZ3dKYmExTEYzc1Mvc2dRRFd5?=
 =?utf-8?B?ODFlMHZBald0L2tDRHNtU1RXeGFZL00reGwxS0JCa3NJbm9EUG10SFBjVVRK?=
 =?utf-8?B?b1dSNkdkYXZtMGVMKzdKS0pmVVZ0a1o5YXUxVEhpSFBEOUx6bnlXWWF1dzEz?=
 =?utf-8?B?dDFrQzJubk02M01jVmlsemMwY2NSejJad3Z3R3dkNFdleHVJODBzUjhzSFVH?=
 =?utf-8?B?OC95MGJ5YmVPbWdVVXdHNVd5ZElSRkRqUWd0QTU0ekpNcXZZRzV5RStueC9I?=
 =?utf-8?B?aHF1QmJ3Zk1ZOHl6d0ZQOWVxRzYydFRocEZ6Q0xGVkkvWEZUWVRiRnQ1elIv?=
 =?utf-8?B?U3B5d1hlbG54d1ZMd3hBSkdxYThvWC9JdTlPaTBSYWp5MXNzN0N5TDYvUFRY?=
 =?utf-8?Q?i8qNR+LQlHX8jVDM=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e447dbde-3ca3-49ec-c4c9-08de8ffc4220
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:37:53.8294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+GuAn6Ipd80uq4WvwFBz+vloVdhuTfPyaiVcvR3bQvnVZujUYt7j4r8uwWiPqOpM5YR7sGv48z2GCZ0LXFyPF5SEICvxjG5IzIODasyyoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10326
X-purgate-ID: tlsNG-16d1c6/1775054276-5C5203D8-904AD78E/0/0
X-purgate-type: clean
X-purgate-size: 1275
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1CAC037C405
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 01/04/2026 17:31, Jan Beulich wrote:
> On 01.04.2026 16:28, Oleksii Moisieiev wrote:
>> In RTDS, removing the last eligible pCPU can kill repl_timer.
>> When a pCPU is later re-added, rt_switch_sched() reinitializes the
>> timer object, but pending entries may already exist in replq.
>>
>> Without re-arming from replq head, replenishment can remain inactive
>> until some unrelated event programs the timer again. This may stall
>> budget replenishment for non-extratime units.
>>
>> Fix this by re-arming repl_timer in rt_switch_sched() immediately after
>> init_timer() when replq is non-empty, using the earliest pending
>> deadline.
>>
>> This keeps behavior unchanged when replq is empty.
>>
>> Add a lightweight regression script,
>> test_rtds_repl_timer_rearm.sh, to verify source-level guards and model
>> the expected re-arm decision logic.
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> What is this last (improperly separated from the S-o-b) paragraph about?
> No ...
>
Sry for that. this leftover from squashing... Will remove. Made a unit 
tests to check the behavior.
>> ---
>>
>>   xen/common/sched/rt.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
> ... new script is being introduced.
>
> Jan

