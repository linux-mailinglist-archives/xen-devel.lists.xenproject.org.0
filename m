Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCl7FdhtqGkkugAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 18:37:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2452053D9
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 18:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245860.1545220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxq9i-0005wU-EK; Wed, 04 Mar 2026 17:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245860.1545220; Wed, 04 Mar 2026 17:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxq9i-0005ud-Bk; Wed, 04 Mar 2026 17:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1245860;
 Wed, 04 Mar 2026 17:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxq9g-0005uL-E1
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 17:37:04 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1c1dffc-17f0-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 18:37:03 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7963.namprd03.prod.outlook.com (2603:10b6:303:270::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:36:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:36:58 +0000
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
X-Inumbo-ID: c1c1dffc-17f0-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3kf0YcMg7PPQ1M4XhDPFfUO7xubTg+qUIzhFOFYiYfS6S92cnkjMET69eSnq7tZAIDYJ1ie1dyE9Cy3gxsasWkqmGhKZXW71TtUmFSLLjveXWGzd4S3PFcDZvDM39i0VsDpxhsiNvFmAlem2QwQbrLkSxfV6e5OrRlNlIfc+0JzyynJ8lglk9dURJ/MTgkPXOpnoFSd4aZxY9d7sXLnN55OXfFB7vQSd6RwQloqrsaoTRKv0zsKKPnLbm/rAWrG0kYktg02SzM+x6PDJ9r3/7rVRRX9ch8QNESv0H6mY6wTe/OHadmC1NIFZQN7WCDrzHZr1rtYdqaNgNNlSBV1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYj4Aq4H/z18cpo/OR/vwiWEXB53aTYcBr5skHnHH2g=;
 b=cCGCZIDC9hCq5/uQcOHGd94PIUlE9wS9sfKGpIOJd5qvOtqdbCuxLGOwy2ce91ySukKQZFKf4AIWS0Vs63jis2NWudhQ25LWLvOAIjy3SlqJFZxuGPUl1PRYlHWbUJIiiDOuScMwJzJFcPww3cfkZZ2MYPATlnlgGDmBcHBUITbm+FOy2YQwnpXuii/GthUfA/5B7aNvmmyd7LQE62fnQEQW3QX76CMGXzRHijNAOp9HysGgiC4a3x+Ik/sI+tuoqMOYGbG75lB0PJwHggIfv+qeZRgjEqEFXL1TNvoOEBlT7OtxbPTMXPHDpPNekYRZJLX79LtRJaFvhDMy7o3q2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYj4Aq4H/z18cpo/OR/vwiWEXB53aTYcBr5skHnHH2g=;
 b=JOLoIB8tJtm5cbGHjKafIC+lyMdGnwiRhSDd8jbVli87sA9cwaSUVaEul76Q7tpoPYhxOqTsiHsvZuzi+JhlO91uojKwxUpA7rcg73+FQjZtHbqnvxNXAAmU1xSypJ1jO+KrsIBv3Q1GhOy4pjxUQzgrqgjCIH61J86+C3dqx3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 18:36:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] domain: use unsigned loop induction variable in
 complete_domain_destroy()
Message-ID: <aahtt0zo0nCb1eSt@macbook.local>
References: <7af56fa6-4254-4704-9843-a0d099e6bb0b@suse.com>
 <aahSBk--J_xqEzOq@macbook.local>
 <80129c3a-77cb-4cb1-b3fd-128454e3db0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80129c3a-77cb-4cb1-b3fd-128454e3db0b@suse.com>
X-ClientProxiedBy: MA3P292CA0053.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 934d6cfd-2c7d-408e-5bb2-08de7a14a280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	cSj44eIUBwT3yyjxQ8vDTTeTFmFarL2IzGYRM8+z88lE3urk5ReUmAr701BLSwOhQ/2OeE2f7b82puZ9uOM4fdWZ1lZXJ9I5lpJeXXPOGCxULsTR5HPqNMiINScbEAUZxON0TnLWmhizbEe4sqmgHo8IDXDIWVkXFHOVtkWeupy/pyZTOV0Zbh8Iozh6BBx7IVLwDn5KDFBQ0wveiHT8V/9QXZDW8wZ0J54I4UxplvQI2bk7iHrUcg1p4EMTGPpKM63kZpRzRRuRGezLulNEz7aqvvTbRM7Q1Y3qDbYIYUdcWSI/H2y/5j4uz90NVPM31RyOZ3KbkQgecxumzXIhwnBCLHZlHOJLAO+UAIImpBy4bb/DEVx+pk0lHUNyPs1a/deX+Gq63d3VA9bsWgMeFl7y3brvKvZC54TNplMMydq/6Z9udLQDKUN+I+xOYFqb4uhuDXdRL/JDgoYP8762NOyxf9cDL+LgSKJizlQxD8ESGn74T4Q/Ie03KnJEn7RDmXha/9nkavCoSxADoWdcTc9jVOexr+aBcaXME81EpPA6ywdwFuxNDGehGGP4tLBIfMkaO/bbRpVRbvo540JLGOltOaaA7DUWMHg4SdPQFkXyeH/5Pz6xUEJKkY47w3URwL0IwMFQ4sDpaF8mEChc/CXB5vtTrackZhtbFlGgiW6ye6rjGl4fhl7OrGO5BQLmD2ujjsCWwN2XXbgCfuQdP1C96z/d40EgGNvnRY7tHNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGZGT2M3QTFXald1ZFRXbm1WNXFpQk5ESWJjVzA4TGpIZnZHY0NNS3BlWTZj?=
 =?utf-8?B?MitnSnVVNTR6WmZJN3ZHSzc2Qm5BSGFTOFJQTTlVSldLNWdLVldDb1MzTW0r?=
 =?utf-8?B?WHJvMXgySlV3M1QvV1ZueVFkK0JmdFQ0bmxTcEw2c0llVllGRjNKakQ2ME9Q?=
 =?utf-8?B?MG1Ud0ZkWmxzOHVvWnJmOFBhNkhhTU0yK01uQllZWmhDR01tU2ZzNGFUOEx5?=
 =?utf-8?B?K1FOd2x1OUE1dGlwQ2ZOeDNvQmxZUXgwNVhtTnhrak5aUmZRUEN0QnBKeVYw?=
 =?utf-8?B?K3pLdU1EUHRpMjV5MUxzOUxPMEhJcmtPVmFRcEJqbVVBVW0rakVrY0NWMkls?=
 =?utf-8?B?UFBKYVIrQ1BNaHVTZTlkQkhmQzV6elUzcjlPb0s5OXoyNHo0bnpEd2JrNEd5?=
 =?utf-8?B?bGpnY3BuckIrV2dGTUM3VWxlUnVDZzhJOE1rcFFlVkVwOGxVK0lWR25EVzlk?=
 =?utf-8?B?ekp0ZFVFaXg5NTZvTFhNZ2FlSGRCMWJBNlA4UWpqeU16VWM0TnFrRzV6QUJj?=
 =?utf-8?B?WDhIOU9uYUdqVElaTzB1VlR6ZENpbUxQc3pVV0pFUEhXMTR1VG00M2xQRzJl?=
 =?utf-8?B?K240UWhCL1hQRGJuK0drWUo4dDJwKzJMTHV4ZGRaTW1NbDkyNVVsRXp3NkVl?=
 =?utf-8?B?Vjg4VEU3TGIzVURaSDI1Z0EzOW1tTmd3SFJzcnhPOS90QlNKb2RHRlhTOXQ2?=
 =?utf-8?B?eGYrbmxueEYwYUM5VVR3czY5TnVuenQzanYyS0dFTlRmQlBJczRCNFNzbVhL?=
 =?utf-8?B?RUZFeWluanZSbWJHQUJOeVVJY3NxK0tiRTNqaUVITnd3MFRzdTdoYnpFYjFH?=
 =?utf-8?B?cjlIeEFEQkhjMkU4NFlYQ2w5NFJZTmxzeXQ2U2pRTnhFR0phc0w0eVVXRzZM?=
 =?utf-8?B?Z2JXN2JXZFlRajBTMFlQaDJLa0dKdHJRZFhPRGcrM1dhN1hXazF3KzB1MlhO?=
 =?utf-8?B?N0t2M1VROGQ0NVdLcEpQRFRGSkVicFRGamN2THRBcWZkbWdzTVEwUWQweEZr?=
 =?utf-8?B?eEJCNzZmOVpRZTh0YjhLM25VZ0E1c2VLekhXZ3JQYkJpaGptWkticWJPcXJZ?=
 =?utf-8?B?MU5rbGFqSVlXSFA2aThJVnd3R21EaHlPYnRvRHR3UGRaV1orMnY5WmZGYWZB?=
 =?utf-8?B?VURZUlVHWkpmSHRLN3hxd0xmTnRNKzVlMUdIL0E0TWk2aDBIcDUrZ09GbnNH?=
 =?utf-8?B?Sk1UTWgrL01POXZjYWVjM20xN2tMdHdqYmNVT01CTmRmU2F1WGFQcWRxbW92?=
 =?utf-8?B?THNEajlubi9ja29JYVBkck1SMDdldlZEeVdwYXFVbGpIWW8zZFZHWXhWUE5w?=
 =?utf-8?B?S2o0cFhGUUtqTGVMR1g4SFoxRVFIUWpEVmxvcGVKamFRQ1JnUlFRbExqYnVS?=
 =?utf-8?B?bDFPcmtzNmNwSmk3NC93WkpmdUwwSXZ0YUhPRHZWV0k3MzRWc3oyTXkvTTNQ?=
 =?utf-8?B?Nm44b3NrWVlKSE83Z1lkdjl6NVVKL3poV2QwQ1JTbnFvcFRDbmc1VjVkT2pp?=
 =?utf-8?B?WUFqaG9pdmIxZFp1NVFLNG9DcUIxc2ZDajdXTEM5UmEzMVA5MHpwdUpFcFUy?=
 =?utf-8?B?M1RnUmxUUThMeENUMkZLdnR5R1Q3a1A1RjlNRnIwN1Nucm4wc2hWQnlua1ZP?=
 =?utf-8?B?Ty9BUkp3S0toYWVpalVaR2QwWUlubEkxZWhOT2MwZlJ5Z3V5TG9KVUYwTThH?=
 =?utf-8?B?SDQ3bXRyUGZWcW8yVzk4eG5Cck93Vk9tL0R6ZCtDY0ZaOWlrSWd1WHhTS0lz?=
 =?utf-8?B?Y2lrTTlqWEkzUWl6T2U4bS9BQUdzSXBOdU51K1FyT0dyVjh1UU9tRVdVTGxy?=
 =?utf-8?B?L2NHYXFVTGFmTUw2c1dRazgvejE5RFJZUWx6TGdhRStOZUI5cTA2REp2MDUy?=
 =?utf-8?B?ekt5b09nczdxcGloRjc0S2xnZDkwZjF1VVdOd0UrTkVCR1dKcHlXNksreE0v?=
 =?utf-8?B?RGxKTFh6c2w1ZTUwSVFKK3dvRWxOcDdoSXFYUHJQUkdzbHYwUDc2Q0MxOE4x?=
 =?utf-8?B?TEI4cVluTGFla0l5NWdXMXNrYjNWZmZQRnhzaFU2R1hlSzY0b21oenJ3TnRC?=
 =?utf-8?B?bDhTdGhmd3drY3RTV3NnSW5QZXJzNFRZRjVUdVpKS3JCZXBJWEVUZWY2Mndx?=
 =?utf-8?B?dVMyWnlOeEJnRXhueTA3U2JFbW1Nd0FpSGI0UnZ4ZGVsdTk5OW5UWlZ0SmZQ?=
 =?utf-8?B?UEJTN2RVR0t3UjJiN2FoM0d2Vk9wdDZKLzdPemtNcHU2QjVRV0FKbUVLaVJv?=
 =?utf-8?B?UWhGTHlSazduMlJQa2dyckowSkg3UHlIVG1WTTNWMzVoOFY1NTE2eXZJRmlJ?=
 =?utf-8?B?azF1K3dZbWdONTVaZ1ExeFYzeDVWbVVrOHVBUGNZLzQ1emFnYmpKQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934d6cfd-2c7d-408e-5bb2-08de7a14a280
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:36:57.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjnCk8NaK9wW1h5rdOpI6MEgSspme8QVo4qOaf9Zgk6d7NxOCr5caPD3lYPwuY7W4hSLCAokkUGPpy/83ot2rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7963
X-Rspamd-Queue-Id: AC2452053D9
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:48:07PM +0100, Jan Beulich wrote:
> On 04.03.2026 16:38, Roger Pau Monné wrote:
> > On Thu, Feb 26, 2026 at 10:01:45AM +0100, Jan Beulich wrote:
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -1475,7 +1475,7 @@ static void cf_check complete_domain_des
> >>  {
> >>      struct domain *d = container_of(head, struct domain, rcu);
> >>      struct vcpu *v;
> >> -    int i;
> >> +    unsigned int i;
> >>  
> >>      /*
> >>       * Flush all state for the vCPU previously having run on the current CPU.
> >> @@ -1485,7 +1485,7 @@ static void cf_check complete_domain_des
> >>       */
> >>      sync_local_execstate();
> >>  
> >> -    for ( i = d->max_vcpus - 1; i >= 0; i-- )
> >> +    for ( i = d->max_vcpus; i-- > 0; )
> > 
> > Is there any reason we need to do those loops backwards?
> > 
> > I would rather do:
> > 
> > for ( i = 0; i < d->max_vcpus; i++ )
> > 
> > ?
> 
> I think it's better to keep like this. The latter of the loops would better
> clear d->vcpu[i] (to not leave a dangling pointer), and there may be code
> which assumes that for ordinary domains d->vcpu[] is populated contiguously.
> Hardly any code should touch the vCPU-s of a domain destructed this far, but
> still better safe than sorry, I guess.

Yes, you are right.  sched_destroy_vcpu() relies on this specific
top-down calling.

Since you are adjusting the code anyway, it might be worth writing
down that some functions (like sched_destroy_vcpu()) expect to be
called with a top-down order of vCPUs.

For the change itself:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

