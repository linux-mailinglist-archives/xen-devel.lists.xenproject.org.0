Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH8uG8cixWmC7AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:12:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DCE335085
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263878.1555685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jZJ-0007F4-50; Thu, 26 Mar 2026 12:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263878.1555685; Thu, 26 Mar 2026 12:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jZJ-0007Cu-2A; Thu, 26 Mar 2026 12:12:09 +0000
Received: by outflank-mailman (input) for mailman id 1263878;
 Thu, 26 Mar 2026 12:12:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5jZG-0007Co-UE
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:12:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5jZG-009UPg-9l
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:12:06 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c52279-5cb7-0a2a0a5109dd-0a2a45049fae-42
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:12:06 +0100
Received: from [52.101.46.37]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c52294-c823-0a2a45040019-34652e25ffa7-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:12:06 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6947.namprd03.prod.outlook.com (2603:10b6:303:1be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 12:12:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 12:12:02 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWyIBZsxidXZeNybSV8gv+TK/Lri0LajBo8CG8InvjNg1jlufcRv98WONgF6Yf5ag9IU14XGwWT5LxNDNhAfnx5vdCei6xgtpRIHRg+LuY2TMQonHqhss7Ue5F/GSQx2v2oSg/LXUitjyRvingCosIwirhsXZMfE2TwO/5mpD0p/Ki576vlDFlrdDXtFKKLaAaHqzYMBvoJnMiG2Bood85MPzMK0IJ6kuRlI68k7hH63p7i5Y8D+HLDGjf6FwgBdcTnzsdJGeamAzZNVZNCoQA8waGkRLCwxUTKcJBBCPzo/Y+SXTwKOcAiGy/UOPzlIGwigqiEcvwhgpMXZgYVAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OneWa1mTlOjw1igtSMmYu+pf/1N4Ajczen9Lk17MhiE=;
 b=zT1xKhLlN7hXdB2dYg3DV9AWAtZg1fCxuJJCSnG2mW5E6Aw8u54tKHOlzH/4mwx/mRtQVLWd8nZ53jVBTKO1KCsIjslu/YX/gBrjs2D/viMceFo2eqHkhtZoUaeAfAKIHYljf5EBYpBAs9veUBIist7t3hPCQmJ7m1YPU3SlvgsbNwlDvcCbCMqaD3FUnSuwZ+KgvU7cxKjcEbiGNQ/oXOZ4c2q58vHTCAfoaLP4Q7xI7kmg4VuyvCJKutmCaKkKxwaH2CtnXTqz8dEkpvngLO4Vei4pavm89LFJiAdmoGR4DBFzN81HBvjMtBOizuerbShdQyk+wlheMTI9rbzV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OneWa1mTlOjw1igtSMmYu+pf/1N4Ajczen9Lk17MhiE=;
 b=kWVdEAzHGm6CZXlW9UAlBO6t+QrZWdUYGiMuJAJb5keWOm6DRDzMAoaDbbNL83zMiMGJ4uAm/MLAdGhNTzqkeDM21gq0e6nLstvihxzfNMeaYYYM2LpC9MnQoX1LbsI2GU1RYtU2VO3rSWtvz+5NRbdwtIuvfvOzMafXwbA2C3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c930ee22-4cab-4bb4-b8fd-fa5e77f7505b@citrix.com>
Date: Thu, 26 Mar 2026 12:11:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/4] xen/uart: enable parsing ACPI SPCR on x86
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260325145824.31601-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0633.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce736a8-66a4-42d5-8f29-08de8b30e348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tCkdh1PHY1sDRDr4v0DACPbRMIkre6r41snvrYfUeluMBJRhkui4sBSgtVHQoGt0K/2NqdIv9Kf8HCffn82ueOc8yKOipXyt7jrZUTgkmkAsnZwnG9lLjeDCPZ1Js5A3/j4xVNk/F7GM9adTiztGIETY4RcKbU6EFH9Ms6wxLMfxvmotzwW2wRkVAFVU531dOjhfU1OSVuXkXvuPkWUkl8VWRW+y+8zSwfMEUwjot6I80DGcfMpCPZQvs/bT1ES2agX95QoaG262od2C+xKRkhpCQrgyXG2lqYLHsZAKLKbkYRdm95H8LbpClPGRRDjxiTsYhzqyNEcOtsETVkHbXGEHS688QDVGpTWrWpxWCuaB9AYrl2d3RdtKLifmXePDhS77EgasIoVpm7h2uZas1MijFPtmwsU4xtQ24DyWBwTi8tNNlvcxp+P0n4D3SxbYzyxZtcFr4hdlWptGClMhT8Re7JALp2kKpRMdd72748FYjxXvRKdR+fSFqyKv4qI2/zCKQwIQa91aiurrI1eHSPJ0lmh+llOskVFIn0LChz/qL4f/4KikB1aAXEJnl5qa17Pg3R2uCqGXGbclzWStinLQO3rUD0nEzQUo+eWl+O80e80aEfCr91NifxpvFFADnU6EDktJdWsTSAcm5dBL/gJFzEQygozQ6mC8bJHWjTuJk2RhzqkWoBmxrHpzYxV0Umouti6LKBFyO3jxda540NenBrgzVPcgBb+d5hILy+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXE0aXd0WDI2c1huTzVKUDQxZ3NKYjFjZFlhVkJDTWpodjdnVUVDcUZIclFU?=
 =?utf-8?B?QVZCNDMzcXVZMmFDU0U3M29wOXo3TzlUWU5HMFBJVFcyWXFwREFUOEYrQkpy?=
 =?utf-8?B?K0EyOTZUMWlYVjdNSlNOVXlJQTBnOFN4RUNWYURVRU8yR0I0SW1WOW51bk5Q?=
 =?utf-8?B?MGZTcEk4TXJWQ1hZaVl3Ym9TVUUwQ3VvMUlJelh0TWI5WmxGVnA5RE1hcmQy?=
 =?utf-8?B?RFFnZEFveXViYVRkRGlqaTZBVW9FZ0k3d3dvV2hTNkh4eWswSVozY3dONGZI?=
 =?utf-8?B?T2R0ZmdiblJ3ZWlmZVNCc1M4WXhsdzhZSEIrb0VCYzdOUXBJejJLWGw2YXFP?=
 =?utf-8?B?U2VqUzlBd3JhQStlY3I4cXQwbDhTczVTZytPZGltQW9JY1dqL2NaeUxNNVo2?=
 =?utf-8?B?RjNYRlRGZVNnYms1ZGx3RnM4M05SSGFvaGp1cFRXZi9Eak5qL1JmVStHVW9i?=
 =?utf-8?B?QjNZU2lPTitpNVdSbzNsMWt2bnBoVXQ5UWpaazZUWVpTQW1meVhsQy9Tczky?=
 =?utf-8?B?NVNYdldUc25zU0RJMWxVbXozMTRNSGk4NlVIWjRHb0ZlS0hqRXZYL1NzTjlv?=
 =?utf-8?B?SGpZTDNXVCtaMFJCQmRUWE05Y29kQlNBSlhsVlJmaGw3eDBCMTJYTmYrc0NB?=
 =?utf-8?B?UVJxTDZKYUNGeGdMVUZidlE1MGxmbzFtVit1S0MvRk11UWtVdTZDSDNoQ1pn?=
 =?utf-8?B?NEhSVGJFeisrVlNuNUdWYnFtanlvRTNpcGZ3WWovQzR6REdiSUh4RW1lRkgw?=
 =?utf-8?B?LzN6SEtYd2l6STA1YVpRSmZPUklZQ3M5RDdQMnV5dzl3emJNendycFN4Q3NC?=
 =?utf-8?B?YkZPanRWclpxdTJ2QVRiY3A1eWRyN0R6VTRLb3ZUOU03QjY1UFdlUDIxMThI?=
 =?utf-8?B?WE1OYmdVVXoyNDNpNk4zL0RUQ29kQy9aNWdJQnFlbmNMaG5mWWZwTnF6Z1ZL?=
 =?utf-8?B?ZkdjTHZlVlZwZVhaaFdCZ21VL1VoZjlwbVEwMkdNRjdGdXgwc0ZkUURIRWVN?=
 =?utf-8?B?Y3ZZZkg2NlJzbVJQdTZtN1BDZmJpNU1FRGlXdUVLTEFveEJBd3dsTEcydTFI?=
 =?utf-8?B?UUR0dG9KTHZ6bmd6TnM1UDZNWHJ0Qmt4Y1prSnFBcGJmS094M3RRUG9xR3U2?=
 =?utf-8?B?NkZ1dWhkSnV1VEh3Q3JzQldvNXMzT01uUXNwamF2MmlyK0dBNGdzL1NwYXVB?=
 =?utf-8?B?V2RxSzJlbzlCU0VSc3BPT2cwVGtZcnlQeW5ud01pTFJkeWF0UWhBK3Nyck9i?=
 =?utf-8?B?VHRZL3U5NHIrUEorR08zWFBCMGRsUng1WDM4S2VPNk1EeHo3SnF5WGRWekhE?=
 =?utf-8?B?LytJQ2dJNmxEc0tnR2ZQZmRWWGxHcFZ6WXZibmtlSy9XOElVTGNUM0dZeTBC?=
 =?utf-8?B?cGNwM3B6aVVBN2I1RjRINm1mL0NSSTIvVjNGOGp3ME9VNFRyakJWcTJocExF?=
 =?utf-8?B?NU1ycnk3eVJML1VxQlczVjJMYzRPWkpBeXZtUytBdFE3UHVFaTM2TDBNMnMx?=
 =?utf-8?B?V0pHdkFYS0Nrekw1TXlZUnhXcXMydTZ1R1RjZnd0ZWlqaCt5MGNBdVd6bUhL?=
 =?utf-8?B?Z0M0RkFTU2NQRSt6NzhEYzZYREx1cTIxdm9ONXRUeWl2L2ErUDJhU0tvR3A5?=
 =?utf-8?B?SDcwN0Y2N0l0aGV1cVZqakdDR3NHUkczTEtMMkJaVjN1QjVzcWRJM3VnY3da?=
 =?utf-8?B?L202SXh2blFYbmV5ZnZaYzZyZ3dML0hnbXdwRzlvbVl6bTRBZFcvUjdDN0ZL?=
 =?utf-8?B?RTNFRW9TeEFlRWNrVUZjak55NnNEMEF5YmFnbjI4UWxaR2M0blQyOGcwUlJO?=
 =?utf-8?B?Q0sxOFpzWHZyTkNTb2NHRjVMczhNVlgrb04zYU9KQ3FHR0NQMlZsYXBvVndu?=
 =?utf-8?B?TFU5UUxWL1MrbHZ4SFpvRUdFUmMxbjNJdmpKMTRQUU4zRjBadzdqQ1JUUmdM?=
 =?utf-8?B?T2dVR2JpTDl3aHdzcFVrL3JGZWVOVDFvT2JWMjBINmh0WW5xbFZhUFovaXZT?=
 =?utf-8?B?YmpZSUlxdkJrTzM1SjhoWmxmVVczT3FNbVQ0dlNnajRGQlhRMDBUL1FUQ01T?=
 =?utf-8?B?VXlsWVpQc012UDY0T3dBSmpRZzZHUk5QcVB6TWNHY29iSHQwa2pSZUI5ZEcz?=
 =?utf-8?B?T0pjdEdvT0NwbTdlNXEzMFJHc3ZPVkk4SHpvdk9ZRDZzS2NtT2JrV0NwdkNH?=
 =?utf-8?B?VjZYdEFJTHQ2QU9qYzl3aG9Yd0RDZmhXQWtTeFEzenk2WldXRHA2eVhYS0Zp?=
 =?utf-8?B?YkZCTmkzZTNWdnE2Mzd6NWxYMXowTk9QWFUrUU5GVWkxYVBwVTRSUUdLRXBP?=
 =?utf-8?B?Mk9rSm93cTd4VkJvTnJDOHFrbCtBTnpTQmpCZ2ROK1c3eU5mZ2FpUkFBMGZr?=
 =?utf-8?Q?9BD2dkgmV6U1F234=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce736a8-66a4-42d5-8f29-08de8b30e348
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:12:02.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgy7jV8KoHu5E7CvLYMjGaspo1Om7tyWV1y0/d/dzVFjKFgZ0Mnpql8OYFS0T2n6vc8bTP5UIlmEQGlpyRyoIK+Ukx7JE4/14qgvolaZtfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6947
X-purgate-ID: tlsNG-ebf023/1774527126-1147E9D1-9E689CDE/0/0
X-purgate-type: clean
X-purgate-size: 1635
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D3DCE335085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 2:58 pm, Roger Pau Monne wrote:
> Introduce extra logic to allow parsing ACPI tables extra early, and use it
> to parse the ACPI SPCR table and obtain the serial configuration.
>
> This is gated to the "acpi" device type being set in "com1" on the Xen
> command line.  Note that there can only be one serial device described in
> the SPCR, so limit it's usage to com1 exclusively for the time being.
>
> I can't test the interrupt information parsing on my system, as the
> interrupt is set to GSI with a value of 0xff, which is outside of the range
> of GSIs available on the system.  I've also assumed that the interrupt
> being 0xff is used to signal not interrupt setup (just like the Interrupt
> Pin register on PCI headers).
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> WIP/RFC, not sure whether there's interest in attempting to pursue this
> further on x86.  So far the device I have is also exposed on the PCI bus
> aside from SPCR, so using com1=device=amt also works to detect it.
>
> Posting it kind of early to know whether I should try to polish it for
> submission or we are happy with not having this on x86.

I think we should be using SPCR/DBG2 when available.  Getting serial
configuration right is always tricky, and we might as well use the help
that Microsoft have forced the OEM/firmware world to provide.

But, I think it should be automatic when the user asked for any kind of
serial.  e.g. console=com1 with no com1 configuration.  The point of
these tables is to provide an enumeration mechanism where none
previously existed.

~Andrew

