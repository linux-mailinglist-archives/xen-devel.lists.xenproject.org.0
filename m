Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD/bAqWr+Wky+wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:34:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0124C8B82
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300328.1574852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBEa-00020x-BI; Tue, 05 May 2026 08:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300328.1574852; Tue, 05 May 2026 08:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBEa-0001z3-8b; Tue, 05 May 2026 08:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1300328;
 Tue, 05 May 2026 08:34:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKBEY-0001yx-0T
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:34:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKBEX-008muR-57
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:34:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9ab89-2eae-0a2a0a5409dd-0a2a4504d07c-32
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:34:24 +0200
Received: from [52.101.61.53]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9ab8f-1dec-0a2a45040019-34653d35181b-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:34:24 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5557.namprd03.prod.outlook.com (2603:10b6:5:2d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:34:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:34:22 +0000
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
 b=aZ4wRp2256WGh8Pgm/KR8d2qx3luhM19Q+Nyj4J4oV7St9tn7B4fDxOWnFNq2qWxKLJeU4hNUIztuHM6uGfjCq5zFk+ciI1RwrYzRnCEKiT/YIY6kQlnjvtXD4P3hkHrlpMOoqGvGbrWgU1nm6CiwahJeCSjg1/s59PSnkShGeL4y2P17rc+zD0pAGzlHrqAFZ/yxn/fbFMkjuemZxeht8JnUQE9Ov+DnoiKBx7gzOnpUm1AzKVqjlhKgqZoXzB15lhDoTB0Ngdey9GLxnSokCxYCGOjuhDm7zyybX9tTGZ5015nTd6HgtftL/eje2WJxE/DFdN5PMBxFjx08znsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pk3n9BBrrz940PS1Weg4RwHQn4IQ6ftkRLGqvtv9UJ8=;
 b=nhBZeFs8ELRDY0cglcY9nTN6uXFbRjb5Hu4Ck9s/SPOUtx3qCqDNWDLc+cuGr8GZpDqm0dR7gbu2VW3E4lFrCsWEXa5zvezrAWW/WlWWzBIcMjQ5kJY3M31SvCdJJfhNEQuH6TCNWAL+Zpat3GSs1Ck0fD+S6IMhucQpyUsb1JGM47jDtk3Vq+15dGLTCIdiAKjFbkMEpFWea/YnyKVOygKPcP02HzGQ3r2aj9UmtsTo1TjuFqd0yq4J+3wuAQouFxf1NG0YuixT2kE83VLzKfog3hL0VKArzEajN1XAQxLEGfZi4bk0sVpEY69aYmc/HpdWgYOuhWlnIAflwnT5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pk3n9BBrrz940PS1Weg4RwHQn4IQ6ftkRLGqvtv9UJ8=;
 b=DCBTlhiTBgb3li5zj9RBxxbSd8RCWePZgZnouNnJ6ZoK8z09LGEo0MAqDKtnqrroRZXB990k1Dj08u/xt9xB2HBefFQt9C2MgNV60ymlkN2+VTKjdsItXP0AsI73CBSNJbYwv1CrC5S3fHp2SduCwLCLBbSNHqq7Fb7IjB4zr5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 May 2026 10:34:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
Message-ID: <afmrizI1osLJLqqh@macbook.local>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
 <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
X-ClientProxiedBy: MA3P292CA0020.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d519f52-a8f3-4945-ea2a-08deaa811b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zmwEhmJQ5IpIiUp7ZXCYSnOu3HdphoqvFkoNI57dVZveoeYKNlUuIuzahCQVvAVpFEl5kgoYbFZDg2SENbCmHMaYRwJlrnlj5gZpFMGbsykH8vAvpnAMARFqJA9q4saC96Xz3LMv4fFQCodkaL5e3Wgp4LzlT2oXlR+ZbDc0WZQ9fB6ySfrskzjm+kMXZycNz+obOuHJxPH4D1flIXeqBGedzU2XSdDMGQqQbzMxx4G+c0Ok2x6MjrECKg31F1RWexxDW3V8qO/gGFK2LOy+WV7Z1HebhVjZd9SPZX9EQmrKYc08SffP2XLC7Lc60+Z+Qx8CqlzXpHr7znwWfqXcCGtmiuWdNxwpcYF9LLdGVtwcD4AgCjE+UAeXLMGDuTt/jIL0SanjRFxAJoohUans63TaWx3I0CZwN3BggF6vxmSEj5m7Cjx39weMmkpserZHIsovW7PbZ9qAXMowDFe982Xm0erycGLD4EB+OoTfBb0901i94gPekIPAoJPeJ6MCVgtLrBgVmIvKHYwu3Sf0gE3MN3qlhjYo5ftG1N6x3UT/pSX4Z4ihBHQx7dC4NcAeVZ+4lJnhJFwqeJ/BG0rOCPCSX0ddDV/EXX50Sv7f+KG/H/Q2FI5BQh2Yx9ZAIOAm+3ljls7rGGZFF7nxpI3lPVasi9RFYnXWUt56m2P/I8oYeQQEH/TC5YSW0fY+U8gu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmYyOHV4ZnVmSDlPVjVWU2ZyamdZTWIwM1FSK05ISVZKSWpuZE5UN0hNOFVh?=
 =?utf-8?B?OGlFT0lxWjYvZldWSnBNSWRKYXNEcUJBY0pvS1ZXczFBQ1hkLzF6Tk0rYWtZ?=
 =?utf-8?B?d2llYVFJcEVQbktMUThCRktaZjlqa3hiTTQxbTBMZDR3YXhCN0szRGd1WHNS?=
 =?utf-8?B?bkxKQnhyMmViYnZQaWpiYjFzbWg4NGt4YTA5VW5HRVJ1MHpIdVljaEUvb1Zn?=
 =?utf-8?B?ZXJlYis5WDd0SmpYTXc1a2x6U2czYUZuZ2NVMEp6bUI2VVlxMW55Qjg0dXFr?=
 =?utf-8?B?VzVKOG05eldPa3I5OFBPY2pwaEFkdEo0a2J1dFIvdERLS1dyZHczNzZuRmN3?=
 =?utf-8?B?ekV2MW9FejRWa1I4RUc5Ly84V0w2dS9tQTczWWx1c0dWc0ZPZWJGMy9hVEpD?=
 =?utf-8?B?Q1lLSzdxYURldlNjMW05Z25mQXR0ZU5MeTNWZU9mVnVDNWorRkozTnB3WlB3?=
 =?utf-8?B?WnZ5Qk5nbUh4Umt4SDdjRHkrNUFPT21LWTN3RE54RHQwZ3NpU3pMcmhKYVNn?=
 =?utf-8?B?OFhMMnZ2Z0tIMmVmMzBoMVVxY292eFB3S3hNcjNlUUtWbUR4WFZ2U1ZQNWhy?=
 =?utf-8?B?clZoOU5PZU9iYkE2cmFFNnJwOUh4R0xwdUhQcjV2N29FT3FqaWlLUloyRTRr?=
 =?utf-8?B?cXcrK3RPSG12eW40bmQ5cE91MnZmb3p5dDhIRFZMdjdIeEwwREx1ZkI1RUFk?=
 =?utf-8?B?bnNEeHlSVWZOZDVlR2IwejRMUE5FMGxnL0ZkKzdwL2ljRmNEZWdXU2lEaFZD?=
 =?utf-8?B?dmgwd3E3ZjJKdDdOMGhBM0RGU0FKMStIdDN6ZzJiNmNNRnFjUDhrYXBMNzlU?=
 =?utf-8?B?Q29aeUMrQVkyOVlNTWtPU2p3aXZkYURnNGhFVUZNRm03RXNwYit6aWc2STFO?=
 =?utf-8?B?SkRiTDVWRVZOYmFNcE03VVBwMzM0U25LMkZyMVgzd25FUzhjZDJIcEplUXN1?=
 =?utf-8?B?c25pdjRMbzVXd0JoK2hMUE5Nb05BeU84U3hFa3phNThiSUJzVXJ6VlFmRk1J?=
 =?utf-8?B?SXdXOWpYWDlOaGRpNkRnd2lwNktmNXc5RVd6Q2xueS9QUlp1OGR4UWNPSkli?=
 =?utf-8?B?MkN6K21zV0oxOEU2SVhOL3V1UVpuR3B4Y0dZVFFyd2NWVWhGTjRvN2tlclFT?=
 =?utf-8?B?STRRUHRpUitzeExoVGZ6Vmx5RDBUU2pQNHhmQU5Ya2ZjODduaHJRbUhNSjho?=
 =?utf-8?B?VndMWEpqWUZndVF1b0hTZkx6aTIralBUNVBhMXhnd3IvcTBVaW5kZkNlc2J0?=
 =?utf-8?B?Q2d3SWdFMGFmQUVpaHVjWGJxUEh3THNXNEFvYm4xUUhHT1dMVmdTUHpxSWhO?=
 =?utf-8?B?VmlCUWtjR2ZMa25ScHNWVTJVMkJFa3FrMGQ0NnpDeXJxeUNmK0FVYVRvelRZ?=
 =?utf-8?B?Q2JEVEx1WTFEdUY2akpaRkg3REN2WWtFSjcySTZNVU13TytpNVVxUVo3TW02?=
 =?utf-8?B?WTlEbXd1NW81aXA0TldRL0E0a1VQcVFtVnBrVHNJbUJjdlIwcGR4dkVtMUFU?=
 =?utf-8?B?LytFZ2hYbjVRR3R3S3lBM1pvZGhkNXBoU3lhandkZXRvTjdDT29mYXpJUnUy?=
 =?utf-8?B?TjBPdWptSEdubzVHNW9IcXlOb0Erem03c2hGdklwNzQ1dWhsS0UwYm5YaVRX?=
 =?utf-8?B?ZUpWeEQ4WGxkMEZYclZMYUk2bWdFcXFnMW9ySVhVVHpPWmFhZnNzeXg0N3Zl?=
 =?utf-8?B?NG5jNVg1Z2cxN0kzMms4VWQ0K0E0N3RMMXREVjY3M0V4TUZZSzNteERyNlhs?=
 =?utf-8?B?UmtHTGZzSHFtbWNZSjFjSGdFaGlPUmE0WVBienJZMjNQbDBxTk1kcGlMaUp3?=
 =?utf-8?B?OEhXR3JPN2JpOWYybkhWT0phRjEzWnhsMzROR1gwU2FhSTVVdUpQaUNhNnZt?=
 =?utf-8?B?THV5RDhDUGtzR0lxb0djUGRyeERzOFVpSDNjTDVBNzR5NkFmR3JSQjBmVEh5?=
 =?utf-8?B?YXRyUkpqTXJublhsZllQODNJVFpHYzgxc0NWWFlKbGJzdWNUQjBaQVhEdCtB?=
 =?utf-8?B?cS9SclNRN0NZSTFndWtVMlZsbGVQeW80SE1oTG42ZUJaMHdSM01hTXkwRFZJ?=
 =?utf-8?B?QUtYRUszaVBTL1NaY2hkTHRuTzcwazZxTm41ZFpjTnVUM2pxazBrMkZSaUFR?=
 =?utf-8?B?VzNzMHVzNGxJbzBBNnd6MG1aK0E2aFNZOXdqUW5RZ2FjYVlvc3EvRGpRaThH?=
 =?utf-8?B?SW1VbWdhQ1dWMDdacktFeXZ4cjUzQU5xQjdjQXFlUEdEQm1SLytFODIzeDZB?=
 =?utf-8?B?cStuTjlXQlNYZStISEl0YVc0ZTFlN2JZV2IwUEZ5TlJyNXJScHRXVGV2b0Za?=
 =?utf-8?B?T0Rva01oRjZDeWROcVBCdGY3VnBWcUYwOHRBODN2TjMxRG9UNHduZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d519f52-a8f3-4945-ea2a-08deaa811b64
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:34:22.2189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVViFm+B9Mwqc4DzBpgBKv72xy5gL17TqDFTbNn2cE/lFmajQPp8cNGVM6mgfblNyaz5mMPVkLkAYY+pAyLrtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5557
X-purgate-ID: tlsNG-ebf023/1777970064-2A5603FF-E8A580F7/0/0
X-purgate-type: clean
X-purgate-size: 4637
X-Rspamd-Queue-Id: 6B0124C8B82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, May 05, 2026 at 09:35:05AM +0200, Orzel, Michal wrote:
> 
> 
> On 05-May-26 09:13, Roger Pau Monné wrote:
> > On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
> >>
> >>
> >> On 04-May-26 17:28, Roger Pau Monné wrote:
> >>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
> >>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
> >>>> the frame table starts at PDX 0, which is only true on x86. ARM
> >>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
> >>>> defines it).
> >>>>
> >>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
> >>>> to 0 when the arch does not define it. This makes the generic macros
> >>>> correct for all architectures, even though they are only used on x86
> >>>> today.
> >>>
> >>> Hm, I assume this offset was added because the original mask PDX
> >>> compression won't (usually) compress the gap between 0 and the start
> >>> of RAM.  However the newish offset PDX compression should be able to
> >>> compress from 0 to start of RAM, and hence you don't need to apply
> >>> an extra PDX offset there?
> >>>
> >>> If that's indeed the case it might be better to integrate
> >>> frametable_base_pdx into the mask compression algorithm itself, so
> >>> that on some arches it's a mask plus a decrease.
> >> The offset is needed regardless of whether compression is used. With
> >> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
> >> 0x80000000, the first valid PDX is 0x80000.
> > 
> > OK, so you are doing some (kind of) address space compression (removing
> > the leading empty range to the first RAM region) even when PDX is
> > disabled.
> > 
> >> Without frametable_base_pdx
> >> the frame table would have to be indexed from 0, wasting
> >> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
> > 
> > But you don't really "waste" memory, just address space?  Oh, maybe
> > not on ARM as it doesn't use pdx_group_valid?  And so you
> > unconditionally populate the frametable from PDX 0 to max PDX.
> With pdx_group_valid (which this series adds) we wouldn't waste
> physical memory for the leading gap. But we'd still waste virtual address
> space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
> because the full range from PDX 0 must fit. For example with RAM starting at 5TB
> the virtual offset before the first usable entry would be ~70GB — more than the
> entire 32GB FRAMETABLE_SIZE on ARM64.

Right, you need to use a PDX compression to fit.  My preference IMO
would be to add the leading offset into the PDX mask compression
algorithm if that's what ARM uses by default now.  The generic case
really means no compression, and that's a 1:1 map between physical
addresses and PDX.  Anything that's not an identity mapping between
those two address spaces implies some kind of compression.

> > 
> >> So frametable_base_pdx is really a frame table indexing offset, not
> >> something tied to the compression algorithm.
> > 
> > Right, it just seems odd to do that extra subtraction when using
> > offset compression, as in that case the compression logic itself
> > should remove that leading gap when RAM doesn't start at 0.
> > 
> > Instead of generalizing and expanding the usage of frametable_base_pdx
> > it might be better to implement support for pdx_group_valid when
> > populating the frame table, and switch by default to the offset
> > compression method that will already remove any leading unpopulated
> > spaces?
> Switching the compression method would be a bigger change, and with feature
> freeze on Friday I'd prefer not to get into that now. The current approach
> is minimal and self-contained and works with mask and no-pdx which is what we
> use nowadays: frametable_base_pdx already existed on ARM and PPC, we're just
> making the generic macros aware of it as Julien requested (in v1 I just
> overwrote the macro in local file). We can revisit the compression strategy as a
> follow-up next release.

Right, I'm not going to oppose to this, but I also don't think it's
the right way to go.  This seems like a bodge on the side of PDX
compression, when it should have instead been integrated into it.  The
more that the offset compression logic will already do that removal of
the leading empty space up to the first RAM region, and hence such
adjustment of PDX values in that case is redundant at best.

Also, you only do this PDX adjustment for the frametable, but not the
direct map?

Thanks, Roger.

