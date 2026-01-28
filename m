Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cORcJq3veWnG1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:14:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC712A020F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215465.1525644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3VQ-0006Ax-Rg; Wed, 28 Jan 2026 11:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215465.1525644; Wed, 28 Jan 2026 11:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3VQ-00069V-OU; Wed, 28 Jan 2026 11:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1215465;
 Wed, 28 Jan 2026 11:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl3VP-00069J-DA
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:14:39 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 879c3a1e-fc3a-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:14:37 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV4PR03MB8188.namprd03.prod.outlook.com (2603:10b6:408:2d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 11:14:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:14:33 +0000
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
X-Inumbo-ID: 879c3a1e-fc3a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx24+zPFj3InlBkd2mcCHAULJmGEcrJwygNKM6XwvHA3UiBJCPr1W13aGZx1L7qpEadOexYu5t9wd4lPKYE+vYr+fUg0mAFpuMz8u37RbVO6We1JCWTWMB7eZTdLWKKnxOEreTjvgRrJoR7WkwHknxFxtjRkjm34DKbwO+rwxghOhuzLTSY3498A5CaIMKrw0Ox644Pu9udwGo4C0mjlsQRE20Xb5JCy2f/rNy3E1GFuLk1KufP5tWwN0iuYv01QGjIiJVxs6AN+cXLC3Fvuozu6Uxbf8ebzsYroJlMPtj92UIDefopqilo8+wY1tD8pqsl+FITl2lxJaQDCc/S2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUQ6H63oXfjU5OU+v6AEd+oY85vTZo7mT+SDAiGQkuE=;
 b=PRTAKmP9gsbmbhXOgtkp8VfHZalMuvP0icqmXJPTcw6ulaem4dzwtrmtPQCVSgvMfJGGB7BcLtSuUkTemWKsn18Ofz9jGKDMv4pIGaLq18WZIb+mSeafvwwxBGUICNeCIV/quBZNVpMKwCQeb0g72DZxHd8+p+OzyOclfBzId/DpxJ6dNUNCH2S8V+f2yr111PZuS/hlvYUj9kJeaYgDLVyBO/f9pbCTLiUqDZujracmV7ROjONvEx9+z1aYVq2PMggJkVtdPU+g3m3iZWxsVhtmH765/93WvxxHcWBJ9UkiYfB36+sKqdCATEVg7Ep1eFyDT35FLcp/HnwD9qIPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUQ6H63oXfjU5OU+v6AEd+oY85vTZo7mT+SDAiGQkuE=;
 b=IM2x1ji3rZp+mEHBsZobZPEPugMw3YAmbuMb3oYgu3hB6SsvMEdcgCkelqZCU2BHkM63iaMRowlNmFf3aacedtYXdbXRejIAe+qfgPTXRxuH45GivBGkcdxmB6pgbJca6VwoQJwjVjW57Cm7IyZM1cpqvxSe719uQ4fSuE7C8a0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 12:14:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: (auto-)ballooning issue
Message-ID: <aXnvl46pk_Wnd9bi@Mac.lan>
References: <a8a61b98-0798-44c1-8426-0fb18a77a6ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8a61b98-0798-44c1-8426-0fb18a77a6ca@suse.com>
X-ClientProxiedBy: MA3P292CA0006.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV4PR03MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de19304-362c-4e55-abc7-08de5e5e6a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkRMOG50Y1U5L2hncnliYlpKR0dJNXpnT0sycEZ1NmhXdExhM2QwdmZjRHJk?=
 =?utf-8?B?VG4rWGszMWh5dHZWd0lqZENZNzAvN0ZjQVJ3VmtVSDVESUFGMVFXWC9sYU90?=
 =?utf-8?B?L0NqOVEzVnZiN2ZCVlN0MnVucnFpbnlCK3ZuSGxIQ1Y4SXo4QlVmeGpTbnNZ?=
 =?utf-8?B?Rmc0QmF0K2o3cllldTg4K3hjTmxmcEdRY2J2OHJpT0R3Nmt4WnBHMEUwZCs0?=
 =?utf-8?B?dDE5bWZFNHJzSmF1NDFEa1UvR1hMVVhWN0FjTXorTEZ6UktCd0trRk9ydmNC?=
 =?utf-8?B?bDN0Mm1La1gyNDdWT09xUlBiUkJ5MjNXc3prYkxNdi9PRXcvYnpveXZIR0Rp?=
 =?utf-8?B?UXRUY0xneHpjSE0xL0pHL0FLRG1oNFhLQmE1UXRHSjZEd2U0Q0FndmJDdWU1?=
 =?utf-8?B?VC83L09jV0ptSHJzMldOWHFNSmNtKzRnQm1mUW5wdGFsWTRQdDhUWWpDUjM5?=
 =?utf-8?B?VkxoNi9idmNSdHdzRHd5RnQwZ3N6alEra1NxNDNtWUowNFlqRUluQ1lBSnlD?=
 =?utf-8?B?VE5Tdy8vc01yTFUxUjlWM3JIeHNoY3IyMFRlaHVLTDc4eGhpZzR1YkltNGk5?=
 =?utf-8?B?bU05enVHNTZRR3A3Q2lVUTBaajdLVjlvYWVQaHZzRDZXaFlnUXAvMzkyMXhh?=
 =?utf-8?B?YVI1d0tuU1gxRWpycHhtNGpTTk11dDM4T0ZKMjNlb3NpOWRFSnBSL1Rlazhp?=
 =?utf-8?B?SElWNnE3VVZoYUpwM3NvenRKeVRmSmh0TkQ3ODQ3eDBRUHRNb0RpK3RTM1Yx?=
 =?utf-8?B?aWtEc0k2VmVWK0d3U1RhRHFrZ2NzN0l3Y0xCYzUrc1pNcTNpdkhrMHoxMFlC?=
 =?utf-8?B?V2VvOFNQSG14QmJ3MGZyN2tEUWtEbFN5aDA3czFyZFkrMXlpeWZxREVKY05y?=
 =?utf-8?B?aWxoWEZsY2J5aHcvbFZpand6bXVEYlhIYlAyL2pjbnRYSlpxb0tCKytDenhG?=
 =?utf-8?B?eXpDR0gzSTR5VnNtaXM0KytvWG9mbVhscHkveElMeWZwTERrYW44T1gvaVc5?=
 =?utf-8?B?bU5zTjRJYnhnZXlrOUUzNU90UFZNTGd3L1FJTDV3VFg0YzBnS2NpVWJ4S3pP?=
 =?utf-8?B?K2xQQ01VL3J0bXROYzJNYURsNW5leUN5Ylg5U2VxclNqU1Z4Y3d0US95UzRk?=
 =?utf-8?B?SVZld3pudDFseTJVWnBzbVUwMkxxanhFcG05MUZHRGNOckFNVjdOTkV5bVNF?=
 =?utf-8?B?NHBEV01aVk1KU3FpcnFpYXFON2JVaStRNlhrSmMvNldtVk9yNWVpajlqYjAr?=
 =?utf-8?B?QXAwUUw4ME5HODVuckh2SG9sdHhTTlRlZ3JqUkNLaGhUWnR0a3gzTDdzQmJj?=
 =?utf-8?B?THcrSHNBK2tSNGNZek1kOU04TUFucXRTWDBycWl3VkhrNmdwbHgxd1MvVXEw?=
 =?utf-8?B?eE9TVWVDOUh1bVdwT2hLYlJhUk12K2VRTkJRcm1sYXlFTG9MQWNRVWcxQjlH?=
 =?utf-8?B?U2IyczQrYkdpODVlR1g5ZmYrMmQ2ZGZiTkp0dzlWYUlmeDhXK0w2aWhDV292?=
 =?utf-8?B?QWZpREZMSmNiTEZZMXRUWEliMEwwWU5hRk8yV29HblFoY01jbm02ZE9LUGVI?=
 =?utf-8?B?QjVhdVJJVnhVZ2RWcGpURzV0ZzMvb2N3bnFtQmYzOU84MGZDeUUweFVaZHYx?=
 =?utf-8?B?YU9jdDUvbnE1emtlc0JMc050T0pnSnQwRzFEY05oUGMvQnRmb0lCT0JtQnh5?=
 =?utf-8?B?ZWFxT3FZZ0UvdXZOb2txb1NDZFRsdlMraitZNmRjK1lZRld5TXAwWmI0UG81?=
 =?utf-8?B?TzVuZ1pETVk4OHpocXhYQnpuMU1qWXErbksveWRmL1pPcXR0OGFoQU9TQUpV?=
 =?utf-8?B?NHFBaitMOFROVkVhRncxSnMxcG5jbWpGNlhBWDhkY09XbVNmWmhrRWV0RXpD?=
 =?utf-8?B?bHRGdUxXdlhHQXlSaGozRmdLK3ZXOGpyN3ptOVJoTmwyMEFGNTlTczN0MGM3?=
 =?utf-8?B?Yk44VlJPQ09yL1kwUE9FYWN1bi9BVUI5K3hrVjhRYnVTbkJYUk1COXhnck9G?=
 =?utf-8?B?d3VCdnVsV2RVWUtWS2dQVGdjZTQ2ZVBPZUVtOXc0NFJGVkFESWQxeVprQ2xY?=
 =?utf-8?B?RDhYV3JRYk0yOWlFbnpld2xVNGN2a0dHMlNaVEt4Wm9xaWNyNmVvMEcyZ3Fo?=
 =?utf-8?Q?8rrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NExiSUlUUXJTT0l5UFhWa1g5OEVhMFhiNDJycnVzVmJuZjRmbVhETEZBQXVz?=
 =?utf-8?B?d0MydTcxYUhSdHR0UVk3UE8zR0FkTTVhQjNweHUvOXlXczFMYmRCMDBkTFVD?=
 =?utf-8?B?a1VuVHhHL1NRWWdpWjZQa3BmVllSTW5zY05pVHNkdGJLdGVFNmNGK2dHTlZD?=
 =?utf-8?B?eWxKUmVEMHd0R1lsekVXQlUrcFc0NmtDWEt5UjRmUEl3cTViS2U5TFd1SUZS?=
 =?utf-8?B?K3ZQT3ZvTGVYTU1GMkR4MURiUFo2Ymkxd0JSaDZVTWJZeEd2WGw5YmQ1RGI0?=
 =?utf-8?B?VzlsejNscFhsUlg1NGE2TDJTd2lQR3B4RGt3ZmZoeHcreGtWbEJFMEJweFpM?=
 =?utf-8?B?US9jSStZYU5UbUFFZkgrQjgvYXN6T2FySFc0Ny9ubXpGemFPd3VDankzclhS?=
 =?utf-8?B?bE1HbFBNcTk1OExGbG12ZEgwUU1Bc2pqTUFqeDFBN2tRckxGdXY5NU55OGdk?=
 =?utf-8?B?V0FpRml3VWJBSWd4cFZ4aFltMFZ0OEFSZktZVkZac2UwVURNSkNHV1JMTHhM?=
 =?utf-8?B?T0wxNGtXVHdZUzh1TkhkTFNhamZCQWNyTmp4cENFTEF6UTh0K0ZoSzcvNnB1?=
 =?utf-8?B?bGN4QUJWMFUyVVJHZHR1N1RxdnRsQ2NMTHF0MUhxbk5JT0x1ZFNhNGNRVS9W?=
 =?utf-8?B?anFOSkwzVEdtTldVcXVURkgxUVhTWWNHaEhRYk4rZ09mT1RQdCtpd3F6eHZ4?=
 =?utf-8?B?bjZmaDRzQU1ZYVYvSmd5MDhBandRcWZVcW1WUzBvZzgzQVNyM0d4RkVMKzZZ?=
 =?utf-8?B?MFA5SFdQbENoYk40bU9CTXYzZnhBWGR4Tk94TVZEL2NwSGdyTWtPVjFlVEZh?=
 =?utf-8?B?S0czdDMxTGM4WSt3VXBQOEJYODdzTmZyTGxDZFdVQWNvWURmanVWU0x0anVy?=
 =?utf-8?B?STBOZHhRZTJqWmRzQ1hBbmtqVUplR3FVckRmWG9VRVlDUUFVajlzbWNKTDZD?=
 =?utf-8?B?QUxJcTZHZUZMdnIrYVRNSkxSdjk1LzdNUDd2a0hsUzJyY3FNMWJLV2lhdXUv?=
 =?utf-8?B?Ymt4cFowc0M2aUxZSm9xRXFscERmTmloc3RhcHpBZ2RUNTZkN2cwME5iQ01o?=
 =?utf-8?B?cEViTmVrUURVWEVyTysrUUFHWndwM0Z4NTFwbUFzUzJweVNWT2VGbDZSdjBE?=
 =?utf-8?B?aDd4MnNFbG9lRHFLUlhmNUZOdzhrMkhSOE5FMUl2RXd0WHIxTDJXb0JEVmZw?=
 =?utf-8?B?bkpOUW8rYUpkOWM1TVppWS9LdUR1QWtVNDlSOWl5YzBsQWl0aEMwNjA0Zkdt?=
 =?utf-8?B?bGtWYjRNZ3NveXUxVWpmcGVER1diWXI3S1JBVUJla1RQcGxTMTF4WnRvOE54?=
 =?utf-8?B?NUdvVHh5TmJEQUVpVkRROFMvdlZHUkRaRm1vQlR1N2QrYjV5VDJUMVlGYlBi?=
 =?utf-8?B?US92eU1keis2RTRlR3hJU0tXTXhJV1RpNnMzZ0l1bndiNWF4aUVMdkpZMk1h?=
 =?utf-8?B?UFlvOFlCYVVsYXdpNm9hV2VyVGFqU2NIbWhLcmZYTWNEYWxvUTJ0QmIvVjhJ?=
 =?utf-8?B?QnRXTXRibTNXT0hlL2ZoVTdob3B4eHY3a3AxUGtJRHZiOW9SZ29UZWRSQkF4?=
 =?utf-8?B?aC8yNEUvK2JwaVVvdHAxQ042VHRJc3VzM0c4TktrQnhYZGY0dDdrZTNDV0Jj?=
 =?utf-8?B?M0l1WnEzRS9CRU9RcTJXM0llaWUxOGdDQlBQNmZKdkEyci82dDdkZVpjNDJz?=
 =?utf-8?B?RjU0U1dWMlNQR05ubS9hNXE3dEVQdU5YdkgwSXlwWk4zL0w2MnJKZm1peGdQ?=
 =?utf-8?B?dW0vVmtzTExFNG5vVE10SWRWSUR1VTZaV2owZ3pzWE5HbEluWW9GbFdQZDg2?=
 =?utf-8?B?a2hwcVU5MjM1OVdyZXJZRWlIRm5WamVaT1J1V0UvREtib0RySTZVNlZWM25H?=
 =?utf-8?B?MmdqbXA1UVg5MTQzYm9SK2ZVN25hWFVFdkc1dUlrelhVdGlJcUpXd25ZUGZi?=
 =?utf-8?B?d1lKMXFKOVQxLzBISWc5eEt0TzRhcVlpNXJoNWlWZDZHWFVUazJTNFBCclVF?=
 =?utf-8?B?OHZVUkRzZng5TnpYRnpTVmNKd2h5UVliR21BTnVkU01KNk9UbW12Q0FUbWJV?=
 =?utf-8?B?Z1UyeXlBRmhEWENrM1JYbVZaemhkVUc5WVRXbk5Dc0gvV3ZVSnVJYTY2Y01p?=
 =?utf-8?B?a0k5OU9HOW4xazBHa0xSYWM3SGJGVG5KTDBSanZscnVvY1JjS091SUFFdjRE?=
 =?utf-8?B?L2FZalh3Q2h6WVJJWFZZR0pmL0VidmRPYXIrTXhoc0RvVlJidU0zS1RZRU5p?=
 =?utf-8?B?Sk0wQjkvbWZLd3pqZy9PRWpmV0ZtOGwxRUtHaWhOaURiN01zUGxkZ1p5UkZT?=
 =?utf-8?B?aGxtYTYrTnl2cnRrWjBBMnY5UUlBbUdyUVhTWFFWY0hqY3Y3WEIwUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de19304-362c-4e55-abc7-08de5e5e6a58
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:14:33.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhuETDSqSYppmCo0tU8RYGi+upQNf3cAJjghnVwgyMQyMjVEDVACLm3T4LsOFpBGaznDP3fr7c+DkNw63hiqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,Mac.lan:mid];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DC712A020F
X-Rspamd-Action: no action

On Tue, Aug 26, 2025 at 05:28:29PM +0200, Jan Beulich wrote:
> Hello,
> 
> the other day I observed a strange issue with XTF's selftest failing to
> have its VMs created, when running all flavors in a group. (Other tests
> look to be similarly affected, it's just the selftest that I run most
> frequently.) Originally I suspected a PVH-specific issue, but the
> problem surfacing only there is because with PVH Dom0 I have less free
> memory left after boot than with PV Dom0. Beyond that, both
> configurations use the same hypervisor, with built-in DOM0_MEM="-255M".
> 
> The issue looks to be further affected (but not caused) by domain
> cleanup being quite a bit slower under PVH Dom0, compared to PV. I.e.
> by the time the 2nd test is started, memory from the 1st one still
> wasn't completely freed. The result is that randomly one of the latter
> (batched) tests fails at domain creation ("failed to free memory for
> the domain").
> 
> xl's freemem() calls libxl_set_memory_target() followed by
> libxl_wait_for_memory_target(). The latter function expects the domain
> to balloon down enough for its ->tot_pages (in the hypervisor) to be
> at or below the previously set target. However, already immediately
> after boot "xl list -l" and "xs ls /" show target values which are 1
> page below the hypervisor's record. With libxl_set_memory_target()
> requesting relative adjustment, the Dom0 kernel will balloon out the
> requested number of pages, but ->tot_pages going down by as many pages
> isn't enough to please libxl_wait_for_memory_target().
> 
> I'm not even close to having an opinion as to where the problem is: It
> could be that the kernel's balloon driver is off by a page. I'm more
> inclined though to think that it is entirely unrealistic to expect the
> kernel's balloon driver and Xen to have an exactly matching view of
> the memory owned by the domain. Yet then it is simply invalid to
> compare values taken from Xenstore against values taken from Xen. While
> problematic for absolute requests, for relative ones it should be
> possible apply the decrement to the source later used to compare
> against while waiting.

Little late, sorry.  I think:

xen/balloon: improve accuracy of initial balloon target for dom0
https://lore.kernel.org/xen-devel/20260128110510.46425-3-roger.pau@citrix.com/

Might improve the situation here, as it should make the dom0 initial
balloon target match what the toolstack expects, and then
(auto-)ballooning targets should also be accurate w.r.t. the memory
freed by dom0.

Regards, Roger.

