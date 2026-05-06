Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCfWGPQ4+2nUXwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 14:49:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA1C4DA808
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 14:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301701.1575919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKbgj-00033Z-MP; Wed, 06 May 2026 12:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301701.1575919; Wed, 06 May 2026 12:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKbgj-00030g-Je; Wed, 06 May 2026 12:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1301701;
 Wed, 06 May 2026 12:49:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKbgi-00030a-RB
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:49:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKbgi-005iqf-19
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 14:49:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb38c7-bab6-0a2a0a5309dd-0a2a450bb2e4-16
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 14:49:15 +0200
Received: from [40.107.208.37]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb38ca-212f-0a2a450b0019-286bd0253f82-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 14:49:15 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5370.namprd03.prod.outlook.com (2603:10b6:5:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 12:49:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 12:49:12 +0000
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
 b=Zce5obDVb7BOKQiek8IK4/80KHRYrPUP6FYmSt+SnJcLSi/zQuP0zNdKlSgrKm3jD3iBwP9FucngVaAKxhZTs+jMgRAByrhqcRKUpSuu8Lkwdi2QdDNIuLX1GIsu7m70KfkAiA49NsFMkRBuCQrVW6wY10uqcQuxDXMGQGtl2JLaEstTnJOkxZ287aoHOPjqZRNtiS5mhC2zyJOgn+H5zWxT05rY1Y5x/dpxNkn5F2bs9RIIPtqWrgE1jaZD59oCAus5z3uLjUTeLk1a2PQSdSQUwBKrkiI18mtTXIUoqlPjW6NmO8ukcQj1jFrqmA4p/Zc1CLPCDR7jAUnGisKGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDicd49Bi7mNEZF2t4kXtHfLAn3d1oe0eoQaCDIB1nA=;
 b=QwNK0akZeuAGPHtMClcv54UV5zhLu8ZzMK8GArrQuSrNRPhGZOgD3cPav3hyAxQ3DCNNASmVhL1ktI1uYtmGoiUDksE154WFhtjjCaG1+PdU/lReYotz00jhV4v2oN++b3WRAX6oeFWvvZxJW1X8bjslZIP8t9YF1bd4+nBLGaY3xwPQJeOmq8OE8oTWb8ldgaKCi+7JWZc9FN2TB5m4aNOSbcMV/iUtEmEOQ8r2DDlZp317iQlpmdxUdCsR3Xyyzy9D4igTcTd5yuNXLQ0e/GbIGTlSaPK2I6LogWRk8hcFsgDcwvyvMdCaTfHDNkI6CydaO2PVX9Vdb2c9Na4dJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDicd49Bi7mNEZF2t4kXtHfLAn3d1oe0eoQaCDIB1nA=;
 b=pxJnyt1+jN+/Y+nmmolCwbqW8sANfQBtEbYO//wmdiwZNaOaq0yUIWg1HBFqQq6eUEKaex1SH6Kl/Hb7gdYQYboLsRfbM2JkZ4nYNiFAN01SDv3hy90q0Bw23SzukA/OPYSGE+9MCoYNSjdZxQkUUjV604ReoCSrvyroV22PBtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 14:49:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/time: make do_settime() uses more accurate
Message-ID: <afs4xBWPRtR2vkI5@macbook.local>
References: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
 <afsi29_wLi_P7G4t@macbook.local>
 <8bd8e079-f3af-404e-adc5-1542422f39b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bd8e079-f3af-404e-adc5-1542422f39b5@suse.com>
X-ClientProxiedBy: MR1P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 8536ecf5-e86b-4990-6fa8-08deab6ddf30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JM/6+i9sPqa2h+pOjpcEWONwnrwXNuwW0WQQ1SPiZlonefZ9FrIHLK7SjwoPCk1l5LOMGxSXkg2iY7i6LxuM5MwEZA6M6rdbWWr1pVN6Q7k0olcRa4QJI7p+xxT/Z6Ssj6mubwX0IQVlcLniq96ODXEJk58Yu1Q6LRMoupmRpl5C/lD7y+x0Qh3gvpkpbaZPt6U2KfR6mc3akpwvmvdQUE4xVciIzuVHe7u8rWmxd5tHVmbsq7Y1HjXkXFMlxD6DYhH9fuXin2ehQxca0Aioo0BM2RicULG9pxR5UqlqyKLK1+dKd2O4osQU8DlyDa248R32f9ZblFyDzl22rvlPFZSvR5In6az9s3RDEN7TGhX7S6JiqwEBgA4rCQkX9QlX3p/1E+Fifb2HTtxpoiwWhs5yM9EuBQwsBQLGGqfJsI+FlWWsGlx4TUfxHNlBJfA/Dd8zh/NlbnhqQcZrRbvWTcacljw7HDsLVNAE+z4oxSq/cjv4BYWxXa+OHeRdzW1zOJJbCX/uUvp2Vg6FnHPqRYSGrqdVcE99WZDPzWboSpPlSoDwaMNsmez7ENbqh5Ac4JdObOru22axCoH4rOnHAWTnYnuGc5VlxxFFPEoO9O/oQeYlINuKFgIVCHJsLH7LgFe9Et0uz+SBildzuowRyrS2lmKO3H5lCdqD7NtYs4lwR6Vld0Yk9qnRHqY9ZXF6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNiM0NjMlRORElUZnA2bWZIWVExYVV6UUdvRzJhSTNWQlp6Q0w1aWRCQ0Jk?=
 =?utf-8?B?TXBNMnBRb0wxLytveUw0ZytDallpc1JwcjZUVTlqeG82eXBCeGYyREp3SmpR?=
 =?utf-8?B?RTUyYUtrVWNCYnlaUFRFMTA2UzV3RElOSVdaOEJpQ3k4MWxGNjdjeGFNaC80?=
 =?utf-8?B?ZTZPUkdqWm9xYjNWcjRvR2pNa0wycU9wbEFBdTd3MU9RakdmVVBaTGRTWUY2?=
 =?utf-8?B?c0czV2ZBMlBSdnNJSiswSXFpaUJ0QlRFOHlpZlBkL0x5MVVvNDhFM3hXM1FN?=
 =?utf-8?B?UXo2ZkI5enpwTWFXQzg5dHpFUU1wUENEUjNCZG5HeWFrdncyOU1aWWE1Yzds?=
 =?utf-8?B?c25adldKU0tTMW82MDJ3VGJjNjRrZWp6cDkrRGwwdzdPZjZRcVV6M1VPTUwy?=
 =?utf-8?B?NW95dkZQaVhGWXFGeHAvWlRQc0ZZQkxmT3B0MThmZGxiVjJIUXgyS1h6ZUtJ?=
 =?utf-8?B?bXp5SUxRRlhkTk1rL3BrTGZOMU1LM2NDUWdmNlp0bVpKZzk3UHo3bk1LR0Zo?=
 =?utf-8?B?N3ZDcUJ5UGMvR1U4clEvSUhHYUhtQ3BkdytmQk05Z2wyQWtOaERvTjlJVmRD?=
 =?utf-8?B?b2dBdHlwekdDZk0wZDM4RDlRbEF4Ti8zd3pLbXN2Um9yb29IclBlbzVPRzNv?=
 =?utf-8?B?NlE2cDZKSStjckl4OGYzeHFJUjdNa0tKcmFRUjkvbHdmRHArelYyWEFPdCtk?=
 =?utf-8?B?WnNoOHlYZ3Z2cHRBWk1CM3R3T2VSenMyQlBUL2V1YW4yMGpQSXdJZ3Y1Tzlo?=
 =?utf-8?B?T2dkcy8vNFJvUW9NN2I1NXpnWmdTTGhXM09EbThobW1rNGlIdThkL0QvbjJl?=
 =?utf-8?B?YkdUQ1hkVFA0dkpORE4xUmMvKzJ6ZnpQUmhXSDlXZW9KQTBFYVN1dkJmTVdl?=
 =?utf-8?B?UFA4a1JKaUpodFZIRjVLaE93NzM3Y0s0eDdxa1hUdVR6N2prckFwZTNZendt?=
 =?utf-8?B?dEttZDJrby9uSlZibWtGU1hLbFFGbkNUR2JDRjJxVmM0WW93VE9NNUkzMmFM?=
 =?utf-8?B?eVFpTkNqSXorb3NTaUxmdEkreTk4WFp6cjFhM01nblVSVUI4YTh3QVFFV0hD?=
 =?utf-8?B?eGZKRXQ2REUrT0JOdDFKaVlCUlEyRCsrRlltaFdPdDFxc3d4b3h6L09XUm8r?=
 =?utf-8?B?eWMzUjR5U1VqVVYyVjM5NHE2UjdjWU9MTWtxYnJpa0s4bTRoQW1JUkR4T0x4?=
 =?utf-8?B?M0tDMnpQaTlHWkNJYmROYjNmbk9VQnZpY2tQUU1ITjdHYlhkL1cxb2lmMEN1?=
 =?utf-8?B?ditlM0NVc1ViNHpBb1V1M203aFVUSTg5cHZEd1pDSlR3M1p1dE9sc0dGUENB?=
 =?utf-8?B?SkpvOHNMOExvNzZmaGkvcUVxWlBWVW80OWYzUE43Zkl2SHllMXRFWjlDeTVW?=
 =?utf-8?B?VzZ4c0FEOW9pWFBUS0ZYMVdlVEU4MEp3OGcrbGJaNzlXRHhnTGpBUVRvSWda?=
 =?utf-8?B?ZDFZejFMbVRHVlVUeE5sLzhxL3Y4Q2ZXMGNPSVl2UWRJVnI4RXVjelFON0tx?=
 =?utf-8?B?b3FmMUpOdEJ0Z2NpYldqU0NYUW5rbjV1YTVydjdwYlo5d0dFNkZmd2JHZVBG?=
 =?utf-8?B?YXA4TW5sb1dTQXMvTHdnZWNjZEdkN2VaYU9zeExVY1JkKy9MUzR6ZFFEYUFz?=
 =?utf-8?B?RGZ2cGZKVTlUSzlBbVhYNWFCdzVFSnJ2dlpBNlllRnNJaVFzQUFOQmVWSUE0?=
 =?utf-8?B?U2dLSXpTMzJEeWxoNmE1NElud2E2K0JlSEJRVE1BYjc4bEpGR001c2tEUmhn?=
 =?utf-8?B?Y2RJd3BSNXB6UTlIcDN5WDdZb1JIYzVma2tkSjE5UzYzcUlpRlBkTnM1NDZJ?=
 =?utf-8?B?WlF6S2JLcE9WS2hndlpEdWxtUTBManRFdDI0UXR4NWpmbUlyKzBOVlFBeWdR?=
 =?utf-8?B?WHF3UEhDeXFXMFVPK2laV2RFUWtSWkUyK1ViZ040VnA1ck9aRGhMQVpscW5o?=
 =?utf-8?B?b0I3SVdUNUVjbVNEcUgrUUpXenR1dG4xbkE0cVJiZTFiazkvRU1qbDFwRk5u?=
 =?utf-8?B?V1RMTGZVclVtN1JYTU45VEpPbkx5NDk3aXIxSmo5ZGptR2k5bU4wbUV3Zkp6?=
 =?utf-8?B?Y1pQRVNyVUlRZzhOellCajdtdnBuMExiYy9idWVZcXR0TDNGWVpXaTdkQnEy?=
 =?utf-8?B?dDNHOVNUZ0ZhOTNHSG5OS1NVeFB5M1Z4d1Fad25JOUd4dXdzdVIwcVdqOGp3?=
 =?utf-8?B?MjN0LytsOHNrbTVucjlnYS9vVjdVVnRLa1F6ZUlJOTFMTkJ3azlxeTM5S2ls?=
 =?utf-8?B?YmxWaWhBclZwVkk5N1BhT2plOSs5UW5pZ09lbERxVUFrd0RIQy9pdVE5cndw?=
 =?utf-8?B?bmQ4NEtqRjhMTFUvbU13RXJxLzdhblBlYnRZRytWR1ZrdTF2bnZYQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8536ecf5-e86b-4990-6fa8-08deab6ddf30
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 12:49:12.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJpHXUiunI045sB2aQfnjtUywAPftp0dkYmgOtQlPyKa/CasR+HJFbZRKWQcKsEN1baN77RFThJtZaYOI2TdLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5370
X-purgate-ID: tlsNG-42698a/1778071755-1A16DF3B-B2DD88C3/0/0
X-purgate-type: clean
X-purgate-size: 2679
X-Rspamd-Queue-Id: CEA1C4DA808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 01:45:36PM +0200, Jan Beulich wrote:
> On 06.05.2026 13:15, Roger Pau Monné wrote:
> > On Wed, May 06, 2026 at 11:35:45AM +0200, Jan Beulich wrote:
> >> As a comment next to one of the invocations states, get_wallclock_time()
> >> can take over a second. The order of evaluation of function arguments is
> >> in principle unspecified; in practice at least gcc looks to be evaluating
> >> them from last to first. Hence with NOW() invoked first, the respective
> >> value passed to do_settime() can be off by over a second (which is in
> >> contrast to __get_cmos_time() attempting to get the time exactly after an
> >> update, i.e. [pretty] precisely at a seconds boundary).
> >>
> >> This also addresses a Misra C:2012 rule 13.2 ("The value of an expression
> >> and its persistent side-effects shall be the same under all permitted
> >> evaluation orders") violation each.
> >>
> >> Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of wallclock change")
> >> Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Of course the time it takes to do all the CMOS reads (or whichever else
> >> wallclock time source is in use) also results in an inaccuracy. For
> >> __get_cmos_time() this might be solvable by having it latch NOW() before
> >> doing the 6 reads, but in particular for efi_get_time() there's hardly
> >> anything we can do.
> >>
> >> As to Misra rule 13.2: tagging.ecl lists the rule as clean. I also can't
> >> find any deviation for the two instances fixed here. What am I missing?
> >>
> >> For __get_cmos_time(), tangentially: Wouldn't we better use the
> >> century byte if available? As it stands, things will break in 2070. Which
> >> is a long way out, yes, but still. (Of course this would mean a 7th slow
> >> I/O port write/read pair.)
> > 
> > Seems fine to me.
> 
> I'll make a patch, provided I can figure out under what conditions the byte
> is present / valid (hopefully that won't involve ACPI AML).

It's in the ACPI FADT table AFAIK.

> > One further note: in __get_cmos_time() I think we want to read
> > backwards, so start with century then year and so on, so the last read
> > is seconds, as to avoid extra skew.
> 
> I don't think this matters. It would be awkward if those reads took over a
> second. Plus if it did, the UIP flag would transiently be set, in which
> case doing the reads wouldn't be valid in the first place. Arguably this
> can in principle happen if a SMI hits in the middle, and its handling
> takes excessively long.

Oh, I see, indeed.

Thanks, Roger.

