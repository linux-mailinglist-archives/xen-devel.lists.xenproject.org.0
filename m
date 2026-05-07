Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOnsMgKi/GkSSQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 16:30:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76E4EA37C
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 16:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302802.1576548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKzjJ-0002BY-5l; Thu, 07 May 2026 14:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302802.1576548; Thu, 07 May 2026 14:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKzjJ-00028a-2a; Thu, 07 May 2026 14:29:33 +0000
Received: by outflank-mailman (input) for mailman id 1302802;
 Thu, 07 May 2026 14:29:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKzjG-00028U-V7
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 14:29:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKzjE-00BS8G-Nj
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 16:29:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fca1c8-bab6-0a2a0a5309dd-0a2a450293e2-8
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 16:29:30 +0200
Received: from [52.101.85.10]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fca1c7-af86-0a2a45020019-3465550aea52-4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 16:29:29 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7260.namprd03.prod.outlook.com (2603:10b6:806:2dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:29:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 14:29:25 +0000
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
 b=mrIHrvkbj2rYmKF4DpdgMugf/jdx6bD+V8tqFGHn1MvMVfnsEC4cQFjcWV7UWgTkBBGRD6co51jOoygX6W0RmgGNEm46OiU43Iuz8mtXP3tAvN+r0L3QmUNaQ70ErE8Cxleudqay+EasLOeAure4YrI8uPnCKg5S/HmMlOdAVW7xy/PKmkLh8jcKwjzrQNX5Ep307glFrA1bd8rJ1RHelDeMJVIAGkvUzFOUAb+XOe3q+/Xcrmt4tZS3OFGsqQX6r+vagAJUeb8tZx7rCyU4Exk9awnED+CVNzMowvcibjZBKvLgoDrdTjW4020PRr9qgrl7qTHtH/huM7q/eqBeaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdPTQ9unoLl/SWMfTiuv5+Xuu2a9/2HGK8L4AkArAoU=;
 b=YvNjz7HAAMcc2qHsENTUv1t9MvO5kZhQ3O9oSoP9yKhUXpC2khE1Ms9A87iKvdKkAvs+AjOli8jASmVT1olvfg7d5gJSabi9+x8V7VoPzN4m9tez2plpAgRH12XQ3ldFDUEojOjqKmgPqIB80RUZADKua2UQZp4LeLlqI/rtFPbLNOzW+Nc2nMGICrAWqLPnETtXsBAvsKn9Og8gcqkgah5WV1o5xCM6cBxtpuy8fYmLZUcBHRY3aJHwSDhVoaflUTga4R08ZLI6+UL0sjrtRX2UGKf7DK9lwfNkymMuj/vw41O/N3dKbTSlv3wNxqaiMoHGWWvfaH8/6viwdebuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdPTQ9unoLl/SWMfTiuv5+Xuu2a9/2HGK8L4AkArAoU=;
 b=t0cB5acaGm600XwxOpN2tktsQem6BzIwKP7wMIFYatHv9hVM6eQRHxdJLHHKP0iVy3vUCj/TzM9W+cdfehP98NXq7fdl6OZ1qPLM+Q62JxI9XP03FtaTbqR933DodOZjLkh2YiL5pRyT5X6kII5jTaSF+7UKnCs796Z6TgeoZvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 7 May 2026 16:29:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] iommu/amd-vi: do not zero IOMMU MMIO region
Message-ID: <afyhwREFMQlHmqMF@macbook.local>
References: <20260506165157.68567-1-roger.pau@citrix.com>
 <b5d9ea51-5fef-4bae-b124-f4dbde93dbdc@suse.com>
 <afxRZtm-L1ZA8jF1@macbook.local>
 <b0d460d6-5828-41d5-9168-394fb54f80bf@suse.com>
 <afxnq3kXflTvz4P-@macbook.local>
 <6d6f4862-0e57-47f3-a87b-2180c7f8e895@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d6f4862-0e57-47f3-a87b-2180c7f8e895@suse.com>
X-ClientProxiedBy: BN0PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:408:143::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4256a6-8ea6-4832-b876-08deac450989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	q5cg2qWLXQNqGvehn8DH77sfN8O1uoSzw/R4eKa5fGtZent4sfD+hv9mmkn0Z9Kvr7rpAU8YdFxY7hN4FC9WFv69m50b46aV44If5KC9cgRAQQ9zCKHf9CYyqH+HssjKT/7fJHk0SJl4luUHIJK/agAuGfn7obPkTXVF2zh9LepgaVJ7pxp0RSZ36bbz5NwGC7ENX9gdzjs5MAFNqj0HbPSZqXLnbX/Esgr/+02JuOvkH01BazrB+D6QmpCTAvGcvvkkp/1CYAhWMbQOkUiw6w5awPAiFdVsP9Ut4FP3RYqy+uFiTL7gIS9G/bNOkn9cpoVYzCkkuTp2S44BdwuHAAy91R3yX5XMyd1lqXiw8qGNIsxYFhXN0zDeTv09fVNQ7/24MBCwmzHkhqKVPr7L4hs8LtRVbCC0JdXAdoN4n7hPGYJlskSYdHB117GZS+JzKgvBdRfs1MfMFhd3QHDW0cdR8u96IfYLU/PMJnCHJE7pDcjgkEiL0o4oXOylyl51KATFYQJNEaL4zlfZ/ReM5dNqhqR3OMCduNRNWDy63rswp71fIyYxUhwAhSeZsynxyD4sGeI68ikgT24kCSes8qYNYLwUzBH+thKHsLi+jNzHZFg8t/fE3NoYGRHL+46nEysE1B+WMOv8TSXGNaaOZjSWcQLsJW9oPzBJHh6KvghCvfl/3Z3RYJLkBiUF9Ql8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGVtdDJjanpNSWxSVHpGV2tOVUdMdkJEZU8zRnRDOGZWTXJqOURzK25CZ3g3?=
 =?utf-8?B?amRrdS9OVVZBNGRZNVdKNEJ0cDJielYyaEhwdzZvZEtubytSVmJBa1BsdTR3?=
 =?utf-8?B?WWZQU0RjUXFoa1J5RG5ZeGEvSStYVXg4cUNJZFNmRXlYcVNxYzd6TFBtZUs0?=
 =?utf-8?B?dDRBRnhEQ0RaaEpGYW1ITVhNRjdjSXR6a3I5RWo1dENRR1I5MWtRVk1LK1Vz?=
 =?utf-8?B?YXZhZURwbkpONUpmVVMycWM1eGtYUEMyMDRiRmdJVnNOSGVJM3VEMDV5clMy?=
 =?utf-8?B?YnFDR1o3TkkyU21VUHdaaDA1K2hJSC9OSU9RSnlhSjJNaytXbTduQzc2WkpL?=
 =?utf-8?B?L0JkaTdwNldCUVg3bVF1SkhKNkxGNUZPYXlkdTluT3FxL290S25QMDgrT1VC?=
 =?utf-8?B?elJReDdDSUxiNVdrekJtTXVrQ0dsblB1c0ZjN1NsYzlUend2Q0pVcGw1NmNz?=
 =?utf-8?B?bzcySzJEOHBVZE4wSDcweWVZUWFBOGx0VnRSQzdzS0h2Q3JacDUyeUFJU0pV?=
 =?utf-8?B?VFdEcFlidmplS1B6U0F3SWd3MnNaRDc1cXMvaDNwOXRCZnV4Y0o1TUF0azZT?=
 =?utf-8?B?b25VTEtyV1NRWlExQk5oVlBvU1h2ZllaKzk3NlRycTFQbGhocXBrbCt1bG9I?=
 =?utf-8?B?bFdLanZSNHI5L3dpU1dOekN3TE1XT2cyM2s0SmdkVmFkV0RDNDZmK0lkL2JF?=
 =?utf-8?B?MzRCSlB2WWRPOThNQlQ5NElvRXVKVlJIenV1azVPOWs5MzhnTjQ5eVV2N3Rq?=
 =?utf-8?B?UVRZV1FFZUV5OHo2enNhelNEUURub2RyaGIzQ0RKZHQ4UFVHZkgwckRKTFYr?=
 =?utf-8?B?UCtyd2JrQVFQNGs5L0ZwZDBBY3M1aXFBSDdOUjlMNzdnUTNiY3NOL3FMakRG?=
 =?utf-8?B?aWM5N0dKQU50aUZlVS8wWUUwNHZCa3JXMWJXWHpKSnkrNTN2R0hEZTRRbG9w?=
 =?utf-8?B?SWovemtRNGQvZ2dDdVNLZEFmWm9wK0E2cXhzdHVkVzdoNDh6L2lXREorZU8w?=
 =?utf-8?B?RWNrTW1MTTh6WVhlM1ZpMWNiZitXSkZSa29UQWdMa3FhMWRYUHorK252VWhq?=
 =?utf-8?B?bkYvWkowRzYwSDB0MkNNd013N2VyZlNqUEhnNDFPQ0FFck13dlZNYnJyTlh4?=
 =?utf-8?B?Uy9qb3dNckRIUllBUjl4bVJXWDFJQldndVdNWFpLZG1SQ1UvekVtMjdDVHVI?=
 =?utf-8?B?OG00K0U4OW1PQ3ZLS2lOYzhIR1pwYmJZaEZXRzBReWxxTUlOWUdOT09URDlG?=
 =?utf-8?B?RURtbFlUdXVHdnhwd29jc21FU1VpVEVxMVRScXRGeWhKNzZCY1VBdy8rWWN5?=
 =?utf-8?B?ZE94RVliUTRNSEVsMjBYV04xUUN6OS9rQ1ZvcFY3V01mODRMUFJGL25ncFBK?=
 =?utf-8?B?Nm1seDQ2VDVuYnpYcEVUYzQyT3Q5YWhoM0JIYTJuZ2luVHppNkpUdW11cHd3?=
 =?utf-8?B?N3hIRmJoOEJvcjI4dFM2VjE4dHpVSWUzQ3pBTUhESkdtd1hCczNWYklqc09D?=
 =?utf-8?B?Mkg5ZkRMek1rRjNIMUIzK21mOEd2bDZ3NmdEMGIwcjZ5dENoSlBvTVNkTG1B?=
 =?utf-8?B?aTBNdS9YMHN0TDhPem00QW4waEcxTnZ3dzVwSHo2bU8xRXpRYkFjZWpqVXAz?=
 =?utf-8?B?RURpMHlFdlVQOXJkRTJCVm1oUFpVOU9oYy9HUHpLNFU5ekFrNzc2Ty8wM0RD?=
 =?utf-8?B?YjVBM0ZJMDdrNWgxUEpJNytQWGFOVktjVjNpQVo5QXdTYVZ1ZmNOYjBrSGI2?=
 =?utf-8?B?WkxURFowd1hodnZzUUM1aS9QQlNjUDFndUYxZ2VoZVMyblJwbUs4eTdBTTZ1?=
 =?utf-8?B?eUswcUtpQkNDVXgrVSs3L20weXNkZHFROU5yUGVnU1d6WTI3Y3lBWnplaFBZ?=
 =?utf-8?B?WFlUdTlTR0U2OUdndk8xK0lBZFA2OGtwVFJQaXB2M3V3MU5WeVZZbUxiQnQz?=
 =?utf-8?B?U1RUak1uNWlMWDc1eUV4R1V0UE9TUTIxWnJ6RjJUbWVteGhQek1lL0ZOVHJM?=
 =?utf-8?B?aDE0UzliMGhYejBNNi9zRWwwYTk0ZVZWYlVBR0MyU0hmdlJWZGxBT09HWEtV?=
 =?utf-8?B?TmlBZk9iVlgwT08rY083NUt5UnVYajlIZGFtbnQ2N1NuUHJjQ1JNZEM4RXlj?=
 =?utf-8?B?OFJCamdLVmVtOXVyUXg4c252aU9nQ2hTQ01FVHNRTXJVWjY0RVNCOHNVRThL?=
 =?utf-8?B?WEVsL2tGYS93Q1pPVkFKc1lmTDJ0UDJnbDdpSU56S2hWalEzNkdmQ0dUT3h2?=
 =?utf-8?B?WmtvNy94dWRsTU12TGNEdjJLMCtxMXNuQmcyMkxFOTFoQkU5NnpEZWp2enVY?=
 =?utf-8?B?Rlk1TXdTMVlPS0ZOcVB6R0xLbG5Pek9VYWFqYjBhMjNpamFHNGNaUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4256a6-8ea6-4832-b876-08deac450989
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:29:24.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jgyZmMGCwLNvqY8+ID59517N7bMAKKKnun4VBbL6Ds+uuB13ap8qJu+J0bdBbt5lX0Pbgk9tM4zfRGgdiqMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7260
X-purgate-ID: tlsNG-720697/1778164169-A917D161-1EE5E37B/0/0
X-purgate-type: clean
X-purgate-size: 5553
X-Rspamd-Queue-Id: 0B76E4EA37C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:20:25PM +0200, Jan Beulich wrote:
> On 07.05.2026 12:21, Roger Pau Monné wrote:
> > On Thu, May 07, 2026 at 10:51:18AM +0200, Jan Beulich wrote:
> >> On 07.05.2026 10:46, Roger Pau Monné wrote:
> >>> On Thu, May 07, 2026 at 10:03:05AM +0200, Jan Beulich wrote:
> >>>> On 06.05.2026 18:51, Roger Pau Monne wrote:
> >>>>> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
> >>>>> say the least.  We don't know what registers might be there, nor which
> >>>>> values might be safe for those registers.  On a forthcoming platform doing
> >>>>> the zeroing of the MMIO region does put the IOMMU in a broken state, which
> >>>>> is not recoverable by the IOMMU initialization procedure in Xen.
> >>>>>
> >>>>> Instead just zero the control register, which mimics the current behavior
> >>>>> with regards to how the control register is handled, and ensures the IOMU
> >>>>> setup is done with the unit disabled.  This approach will need revisiting
> >>>>> in order to support Preboot DMA Protection.
> >>>>>
> >>>>> Fold map_iommu_mmio_region() into its only caller, as the function body is
> >>>>> just an ioremap() call after the removal of the memset().
> >>>>>
> >>>>> Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>
> >>>> While you got Andrew's R-b, I don't view that as enough to commit it. My
> >>>> prior concern towards ...
> >>>>
> >>>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
> >>>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> >>>>> @@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
> >>>>>      return iommu->ht_flags & mask;
> >>>>>  }
> >>>>>  
> >>>>> -static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
> >>>>> -{
> >>>>> -    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
> >>>>> -                               IOMMU_MMIO_REGION_LENGTH);
> >>>>> -    if ( !iommu->mmio_base )
> >>>>> -        return -ENOMEM;
> >>>>> -
> >>>>> -    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
> >>>>> -
> >>>>> -    return 0;
> >>>>> -}
> >>>>
> >>>> ... this part of the change wasn't addressed, neither verbally nor by an
> >>>> adjustment to the description of what was committed. As previously stated,
> >>>> blindly memset()-ing the entire area may not be the best of all options,
> >>>> but the downsides of not doing this need to somehow be addressed. As
> >>>> indicated, once they run out of bits in the main control register, they
> >>>> likely will add a 2nd one. That'll then also need clearing, yet we have
> >>>> no code to do so anymore.
> >>>
> >>> I could introduce an opt-in command line option that forces the
> >>> zeroing of the MMIO region (to have the option to resort to the
> >>> previous behavior),
> >>
> >> But we don't want to fully go back to this. We'd need a form that zeroes
> >> what may be zeroed, without causing the issue you're trying to address.
> > 
> > But how do we know what needs to be zeroed?  We are then in the same
> > position where the introduction of a new control register would cause
> > the zeroing to no longer be accurate.
> 
> An option may be to zero everything we don't know about (plus perhaps
> everything we know about, but don't otherwise use), on the assumption
> that new (writable) registers added are okay to zero.

I don't know, I wouldn't feel very comfortable in zeroing everything
we don't know about - there's a risk of zeroing hidden registers set
up by the firmware.

> >>> but I was (wrongly) under the impression that we
> >>> have agreement the proposed approach was the least bad of the ones
> >>> available, sorry.
> >>>
> >>> Note how VT-d also doesn't zero the IOMMU registers MMIO page either,
> >>> neither does it seems to zero the Global Command Register either,
> >>> which I'm not saying it's correct, but is at least a (possibly wrong)
> >>> precedent.  I don't think there's much we can do with the handling of
> >>> enabled bits in possibly registers not know/handled by Xen.  Like on
> >>> VT-d, we possibly need to rely on the firmware to handle the IOMMU in
> >>> a half-sane configuration, with no enabled features on registers Xen
> >>> doesn't know about.
> >>
> >> As indicated before, for firmware we can likely rely on that. Pre-boot
> >> non-firmware environments and especially Xen being kexec-ed (or being
> >> run past something which was kexec-ed) may be of more concern.
> > 
> > Do we really support booting from such environments?  We would need
> > much more careful handling of enabled features IMO, as blindly zeroing
> > the whole MMIO register area is likely to not make the IOMMU happy if
> > it was in an enabled state.
> > 
> > Note for example how Xen was zeroing the command and log buffer
> > pointers ahead of disabling the features in the control register, just
> > because those register are ahead of the control register in the MMIO
> > space.
> 
> Hmm, yes, such ordering issues could also appear with new registers.
> Then again, with the IOMMU as a whole disabled (which we would still
> want to do up front), perhaps the order of other stores can be assumed
> to not matter?

I would assume so, yes, but for the issue here the order of the writes
did matter, even when the IOMMU was fully disabled.

I've inquired to see if there's a recommended way to clear any
previous state from an IOMMU.

Thanks, Roger.

