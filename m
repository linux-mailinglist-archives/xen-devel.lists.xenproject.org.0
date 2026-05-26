Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM0jMfHFFWqxawcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 18:10:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9D5D9626
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 18:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320092.1587493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRuLE-0001Wt-AV; Tue, 26 May 2026 16:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320092.1587493; Tue, 26 May 2026 16:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRuLE-0001V7-7o; Tue, 26 May 2026 16:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1320092;
 Tue, 26 May 2026 16:09:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wRuLB-0001Uy-Nq
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 16:09:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRuLA-001cZm-MO
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 18:09:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a15c598-2eae-0a2a0a5409dd-0a2a45049c90-22
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 18:09:12 +0200
Received: from [40.93.194.42]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a15c5a6-1dec-0a2a45040019-285dc22a6991-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 18:09:12 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5559.namprd03.prod.outlook.com (2603:10b6:5:2ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 16:09:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 16:09:09 +0000
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
 b=SQ3rGhPyxm1G4l1/7OSR4DKjLLblEL0b2VT8YG2zC+igvLRmLFyJAp8bE1SoFNzLxjisMGTISDUnLycFJReoEfYCafe1+l2/Y4kvxWTqlKPuqkdQPaUGXKTa5Hh3THA3gK3PQ6RkH01mIaJdn5JYJphZGHSJ3BmWb0lCFBl9ZQZNVWHUhGulAEamCbiBv7O9x3vBwdw7avsNpbRw2lgcrngQIS5EDHKKkpoQp3epHbTc+fWp8vBkt3+g18BuIGAnPIWctQ35n0MT/kl/oxh7uAyl2SI6Fz2j6BXHJpC2ZlORDwDfA1A8J/1kuln//3LHLZH4PXLZYIvhX7QGoznXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sInLTc/aPgwpmJZvcgdHUtVMRmmNxORdCc4jyIkWjM4=;
 b=KGPI4mInQELNDjC1isKlhsOzFFp8JOA3/qW040jcbVDfO8yvPo9utwVXGtfH7c4wFMe1SMhGkF/V4jQZNl8Npttefjj+BKgZsmBZkEMFvyPjCDh2fGWWBbkEwEYUlgdmDthr711kFTFONQOuWS5EbzpNeA658rSpLrvEuM7CIXWbfEsddwbWjsRjlnzb2LkY0tWfCHtWSZWPhFSn/5cCeUizEsaNwun4IqsROQBen/n+Br9ZaX4MObkH6zTHr9IaEQfIr8oHw9xLsGZdy+RXkyKJNIdl+IngUu9sa1/vIb3YuW7VOdlAw2XMHVYr0Turbz9iXDyGC4lZ0xQpBbgCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sInLTc/aPgwpmJZvcgdHUtVMRmmNxORdCc4jyIkWjM4=;
 b=LsZK2hsRBeH8DYy/s/VbwMwUkhnqaOLiw13hFN4L/SucFd7ejOYP/hDSlsy3NhlQQNOCFd/4vsqXqfX/TjM4n+uP238EG1346VHKfh/B7MUJSbZOhEkfUgYZfbSoNfu9gj1waehrDh8LKO2FafeYiiEjmwzD8yxbzxTOCayPegA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 May 2026 18:09:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Cody Zuschlag <cody.zuschlag@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
	sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/process: document AI-assisted patch tags
Message-ID: <ahXFodLdshZozUCD@macbook.local>
References: <20260519142011.30276-2-cody.zuschlag@gmail.com>
 <3e2ad5b9-ef65-41fd-87bf-823b98fa0c3d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e2ad5b9-ef65-41fd-87bf-823b98fa0c3d@suse.com>
X-ClientProxiedBy: MR1P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 92588519-af19-4882-a55e-08debb411e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|20052099010|3023799007|4143699003|5023799004|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LpZ8w70ct98ChkP5dINWyacPj1B3i/xdt8/rdF5XGoOGVkW6X8re7MUl7jXrSjeYm8OihShXkiSBB4HTt2ZlI12AGaLe1+M/EiKqwOvOYRp994aMz9HCeKOE37U7kvH61bJoAWhEFgj0djvYrxgirVVBHuNCBx/TYJjKn8fzaS+28srzbNdY3iMqu13H67xfa2suVl1FJs/pH/B25INXFrMfkqfoaF67xUe4tUrUxCzr5z+0eTpdIV2DmMPEBuseKSSfMEK0kMTJDP+/Pfqrz/OBeclRqB+aBEKX4HHgfSiSTd4yav1G2QRydvUH8mx3JSz0aMDlkwFRvV1zGQedyLLICaO/o822tm9Ps5rHi9q0CPZXKVj/5MaHskIyswVtwUoxS42AUSmb++jxCjAH5UAREewRRcR9LWFM7V6u1CXu0pT3qCUv3W8aY82vABsU0hGLrf3TNyT1A4GTqn/rFQrhFmEs3lv+gGDtMGGknyhEDpt3RusnweY1lW23PtJnoADC78FhyJw7s4WRM5hzcR7dpgknmgG9lXlsHe21h2/jla+VbMCUNFkHfCxifNs/IHOxrRauC4TdQp7RLxLQct0aBa6s6I5xYPdiMoUTvnRPl82tRSx/wl/LwPTN+eZwhKDynbJ0atbDaiXLy16jtnIVAUc9lLQA+E6XOjq9kl/LlceSOwOjEq4iw4MU63ju
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(20052099010)(3023799007)(4143699003)(5023799004)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUZYT2txbVNaRUMzdi96QmJBSlBkZ3dyaVBvM0ZVQnJDVzRNdkRrUjFOWURL?=
 =?utf-8?B?Tk44MStTeVRUOHgwT1JocnQ5M3R4b1h5Tm9QTjBWak5QUWFVb2h3MTN2Q0dm?=
 =?utf-8?B?Vmg5QWtwMEpqN2ZTUlRiTGlxWTZCd0xZd0JVWlNENHMzdXlqMGhOR0ZPeTJv?=
 =?utf-8?B?SzFZKzBvSXc0dFZ5OWNjM1BRVGxVVTBZU1VBV0s4U0sxYW1jdzNZRFVrVXhB?=
 =?utf-8?B?eUdRS0pQYWhzSXc1akwwMm9TMjQzcUYyODhTLytDblhKM1VLWkI1d2tnaWNh?=
 =?utf-8?B?RHhjUlVzdXRKSEZDYWdKYnZxcVFFVnZUbk5XREVqREYwSEZNYUJ0Nk4zL0dK?=
 =?utf-8?B?NFVlelFmYjRxUklzUDhXUGdWc05EWThjckhmbW80ekZGQmZMRjlEaVU4MjBr?=
 =?utf-8?B?QmRpTXhUL0lMSUlDRjdZOW9DMi9MQWdwNEtZbk41RXVXSThNSFh5enlKOFM4?=
 =?utf-8?B?Um02UmFrT2JOaE0yUm1keGJ4eVZQbWlBNFJIdEFGdkNHWitsblB2cUVzQ005?=
 =?utf-8?B?UllpV3k0VFlqWnFFWmtLcjdrd3p5RWlGYUx1YTZNWXczc083SExHMGdFbVhp?=
 =?utf-8?B?bU5Jb1pkZEhvRGFhSlRVWHgwVkVEVWFUSHNKWXpmNDU3NkNoQzlGZ01jUU9T?=
 =?utf-8?B?Qms4SU80UmVlTVZEUkRuMTBGb0VvUG91T0hvMmJHa3duL25jeTNkbXhlQWRo?=
 =?utf-8?B?RU9NWU1jYmVZZU8zSFB2Z0tCaDE3MVZOendQMkF5UFVjUlVQUDZDRFhCUU1h?=
 =?utf-8?B?bThSOCtJVHVQMUJuR3Vta1kvcUxHaCtrclNHY2lQdGZjOGd6QVJQTkhhdWN4?=
 =?utf-8?B?cEZkUFlXU1ErK0VsYS85S0w0U0UzY2ttQ2MrUmUrTmZBYWRXeGpTcFBRVGRO?=
 =?utf-8?B?bnJBT2NrSXlqWlJ4a3RRemRiV092WVd6dzd3Sm9UWUcwQVZBSitRU3ZPSEQw?=
 =?utf-8?B?V1ZpbktwUlFramZEV2hkcGhYZkFVTUlLQUVRdC9rNGU3T2RTTnBaMjRPdURX?=
 =?utf-8?B?elFCVWFTWFIwcFVPSTZIRlpOa2JaeUNSNUpINWFVWHhkNkt5cENJT09XNlhU?=
 =?utf-8?B?NFNQMkVuemFFUnBDRmZGMGJxN2lYQVpIQ0wrZkhMQ3V2TThwZmhhdDRDWWVR?=
 =?utf-8?B?MkwxdTF6dlNYcVVYVmhldlNzdTc3NUdUTDhyVUNQQ1BrT1QxZGNmQWZQL0ln?=
 =?utf-8?B?RTA2cnpsb1NUeVVzN3NPYUcwdzNyK00zS05Ud3k1SHRoQTREWUFkL0M3MUw3?=
 =?utf-8?B?dE13VXR5NTVLcEl6WEFlZXBVaTBPb1oyam5vdjdua1BHc2FWMjFhYlBSZWNR?=
 =?utf-8?B?U1Jyd01IRm41MGJnd3E2QmxVV3AzOUxNZ1dZRDB2ak9tT1N0cmw5VnNxbU1u?=
 =?utf-8?B?a2V4NEZ1SjVtMHNuU3VaVjZEODkyVjJwTm5ha1RranY5TXA5cmpaT0xsYTZq?=
 =?utf-8?B?SGNxRjZkWGJ5eW1STWUyUjFvQURKSzlQNlRBOUFnQytEZnJvVlZIT0lBeFo4?=
 =?utf-8?B?ZXpvWHBoUmYzNVE5SGMxU204VGw4NWJKbEpWblZZYWlyUEVubzhmZGZ5RWpZ?=
 =?utf-8?B?M1RvT0E2NVM5NStXcEc3ak0zWDFIczlnTnZrOUZBWWExd3JLYWZCeEI3RUM3?=
 =?utf-8?B?dHZZVGpyejJuK1NSTnNxeEJQb2FMT2lETVlKM1VVMHA5My9TeUlCUmV5VDQ0?=
 =?utf-8?B?R1lNRE5kU2RRdnJxSGllTUdYYURmVlBZS2cvdmRoK0tlWXczazh6L0dGZncx?=
 =?utf-8?B?aHRnWlBUYkhsbUwwd0tHZ21nWkg2Vk54K1lLRTZSbmZTd3pWM3cwT2RNTUVi?=
 =?utf-8?B?WWw4ai83NHhCdzVFcmNTOFRkeVpGMEZISFFtdnN6N3hYZS8rUDQyRU9oUktI?=
 =?utf-8?B?ZnpLelB3TjIrOEFiMmh5blBEK1YzS3l0eUw3YkJIdFpKcG0wVlZCNms3aFZ2?=
 =?utf-8?B?bVJJKzNvTnl4OU83amRSd2lqVE1oNGNScy9nM3ZYTjhVNXFtemtCVG4zSGJt?=
 =?utf-8?B?MmdtVHhrMElYQmdnNDQ5ZDlDZ0JZKzFNVDV0ckN2cGs1YWVPQ2JyU0ZvT3Fp?=
 =?utf-8?B?dWlIUE10U0ZXaHpSZXdQckVOeHdmdkdvM0FXM1gyZXY3UEE1TnRvKzBIcXZC?=
 =?utf-8?B?Mlh4VFJZZ3lOQTVOUXlCbmJxMHB6ZnJQekpIYVZqNFluMlU3Y0MrNkVORHl1?=
 =?utf-8?B?T091YzJkU2lhMGNyQTBmckVGZWNlbXBSU2x5b1B4aGQ0VUIvUHV6bmNmYk5F?=
 =?utf-8?B?NW5vdHd3dVVLWnlodVZrdzhPTUlyNnJyTk91VWFtaUhXeWt0dy9Gay9kSG4y?=
 =?utf-8?B?UXRmbWNpRC9NWUFFQ2ZHa0NGdm5TZmV2dVpydXJSbGN3b3BBai9MQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92588519-af19-4882-a55e-08debb411e31
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 16:09:08.9130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwTDEfW9fBdSVGaQIJAbTgWytMZ8Bru5SIW6cU8W4X+LAitNQQOpUkF60E1uKibcEwrE5v7TNBA5ktpwGhZvsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5559
X-purgate-ID: tlsNG-ebf023/1779811752-4217E3FF-D69C084A/0/0
X-purgate-type: clean
X-purgate-size: 2021
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:cody.zuschlag@gmail.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.940];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 29F9D5D9626
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 05:46:18PM +0200, Jan Beulich wrote:
> On 19.05.2026 16:20, Cody Zuschlag wrote:
> > --- a/docs/process/sending-patches.pandoc
> > +++ b/docs/process/sending-patches.pandoc
> > @@ -195,6 +195,25 @@ E.g.:
> >  
> >      Requested-by: Jane Doe <jane.doe@example.org>
> >  
> > +### Assisted-by:
> > +
> > +This optional tag can be used when AI-assisted tooling contributed to the
> > +preparation of a patch.
> 
> Noticed only while reading your other email, plus checking the Linux
> wording: s/can/should/ at the very least? (Personally I'd make it a
> requirement.)
> 
> > It is in the format:
> > +
> > +    Assisted-by: <tool-name>[:<model-version>] [tool...]
> > +
> > +E.g.:
> > +
> > +    Assisted-by: Claude:claude-3-opus coccinelle sparse
> > +    Assisted-by: ChatGPT:gpt-5.5
> > +
> > +Basic development tools, such as git, compilers, make, and editors, should
> > +not be listed.
> > +
> > +The person submitting the patch remains responsible for reviewing any
> > +AI-generated content and ensuring the contribution is correct, appropriate,
> > +and compliant with Xen's contribution and licensing requirements.
> > +
> >  ### Signed-off-by:
> >  
> >  This mandatory tag specifies the author(s) of a patch (for each author a
> > @@ -209,6 +228,9 @@ E.g.:
> >  The author must be a natural person (not a team or just a company) and the
> >  `Signed-off-by:` tag must include the real name of the author (no pseudonym).
> >  
> > +AI tools must not add `Signed-off-by:` tags, as only natural
> > +persons can certify the `Developer's Certificate of Origin`.
> 
> Linux emphasizes "MUST NOT". I think that's advisable for us as well. I
> also wonder whether some of their other wording might be worth taking
> verbatim, rather than making our own, slightly different variant.
> 
> Nit: Wrap differently to make better use of line length?

With the proposed changes:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

