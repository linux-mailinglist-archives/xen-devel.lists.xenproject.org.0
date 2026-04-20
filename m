Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLncH0125mlBwwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 20:54:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E649A4331BF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 20:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286434.1567493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEtkl-0006Kd-4U; Mon, 20 Apr 2026 18:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286434.1567493; Mon, 20 Apr 2026 18:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEtkl-0006Ie-1G; Mon, 20 Apr 2026 18:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1286434;
 Mon, 20 Apr 2026 18:53:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Christian.Koenig@amd.com>) id 1wEtkj-0006IY-GS
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 18:53:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEtkg-0017XN-SK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 20:53:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Christian.Koenig@amd.com>)
 id 69e67610-2eae-0a2a0a5409dd-0a2a450ce528-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 20:53:46 +0200
Received: from [40.93.194.32]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Christian.Koenig@amd.com>)
 id 69e67638-62f1-0a2a450c0019-285dc220e6fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 20:53:45 +0200
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 18:53:40 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 18:53:40 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJhv2c/kpKmOF0+njUgCWBAI+gfK9e1/f6+53pSQqEJRYeLR7pC8f+qbJWiZfGQLVODp0Y2DTIWJHhJMzNhoseW1c1ZSG2+odjrfHuCwu4I7tYPxAxZDuFzQAYHQ5PaoJKBcf61h4uYZCS4ZyEmj8YGa6B168KC1hzYSw0IHbtJ4veG3QGOQ2/QY8B6x9mlz9wSQtF/x6YKIfsRrPM16znF4ljdB9N9Rj3P+Ei7uh4fOcXihyAElPp9adek/xok0ppN44U6H2hoeAxtqsGHc0nrl1OBJlIJkRCm5uW0uAVgcglxkQNiBfVJfWU+nOgQCjtLnGEq9Y9e2NLFvMMtFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/E1rN6FBTu1IPtIqp6jH0ZVrrJjFMJ6WstAbl3f5GI=;
 b=g0oz8vXuZ483TIsEKt2uJK0c+bUde6v0EjjRT5vF5cl6v1GTWFWgjaiklODA9NLj3oV0PHPtE1iQtia+n+fmA949hX4CmVVtcgg0IemO6PrT5yCr8ZDii2wXLJ5N+Uy3Ceuoq2Kcm7oehxjZuMpv607Rhvm9gUq5YOzGKRL7UH7eHCbtpx7TaeBE5/OssjODKiDGxELn/c7nsPkP2rSlRYbDftFe8KD79ZT3xwLriO5BoXwDaVhivSU7Q4C0NlBu9Bf7cZoGqkTUQ1K7qsM+Y5OKyinZ/Ltu14SoRKfb82JCgPmxVl5BD/bz13H725tdLsxBgF0ZQ7VO9U5s1F595w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/E1rN6FBTu1IPtIqp6jH0ZVrrJjFMJ6WstAbl3f5GI=;
 b=p+FqZcemmkvQOGndJtiywYTGT1BTap/M4GexZ/fh/PuThjG07Y2hHntu4gmn7JCU7pSGNM++hhQSrONiBb8BNcbay1wnuuFQ9m5PCenPWXyGixZuYfQz819gHCzNtIbWrOQ28DB10+uvzDrzBAVbiTSoDrtodqrisBsbz0sambc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e5c00f2c-0819-48b4-b66e-71b9a40a7235@amd.com>
Date: Mon, 20 Apr 2026 20:53:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Demi Marie Obenour <demiobenour@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 linux-media@vger.kernel.org
Cc: Val Packett <val@invisiblethingslab.com>,
 Suwit Semal <sumit.semwal@linaro.org>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
 <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com>
 <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
 <4751cf03-d3c1-4d5d-af8e-39ad7c8ffb84@amd.com>
 <7472bfcf-8c22-4ac7-b903-a883cdb8f1c6@gmail.com>
 <8fe8b78b-5294-4319-af92-a4fb00527417@amd.com>
 <8846bac5-77ff-4439-ac5c-c33cdb4a94e3@gmail.com>
 <964c3670-fad3-44ce-bd93-2057bca2dcb8@amd.com>
 <08ad2301-3163-4497-8869-fa4cea30b384@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <08ad2301-3163-4497-8869-fa4cea30b384@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0382.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::27) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 922fa92f-3899-47ed-2dd5-08de9f0e231d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18096099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q1WPCjxdZ8D7V6kNZHOELY16u2dYFaJNaA2VOODgCAyN75bK/0Y9fE5mqwGIr3+vi/OfP3OsKXLpgRqZtxre/mX/lTu5Ar68suxa6fsjICSziUoMLPbHKjH1X0kiqQ9Bte48V2p0wPV1DzjSFq65yN7gdxlzOMRHBfNeMvMHhu9eO2Q9QmDL+VZ56IN400ejzShZESP4gzrP5+dAFFCR2sd6T7NyR/2ZEkfcsQGiphv7IYR98vIqmmxT60Ka7BiIIqnNbVI2HtCZzvdS9BRnVRQ2TokeG/o8sKweZkaB74lRZ9sFo09sENEe6gteJ2jtXuWnBChoRPkmdK7q3DBLt8K7JWZxCU3hFgQO/48rU6iPLwBZsjMP8MUJCYlYeCSnx+zDcFWZogAIgAqFCuzm1SWepRtbdGYpJgIG8oLY3/MF/OrIcnNu7HQDsxaYslglAPpbPhNvfwSdWHwtQb1TNa2lS1DOK5nWyRehlQgvAcPHDrHHHZXGaLUdN3FVenW6CPO5yvlb14sJKUFC03pA6Y2hjoONB9HuQvDerhDcUM2Go5TqqlxHwkRg3pXssPrl+LvL7XfyWRtbbHGu+Sl5B7eStNilDKSKIpwJXfGaqNuUvA75z1JqVyCqLSQVa4i54corij3vx57TbR80E3vTb8CveDI+ri+zKbN22XWueP6dNiI3z+Jy6Ng5Jy6Y8TUQ2IKYoivv0P6QH73NsnE1WRb3PAZBdmQhH6zBnu6SzWE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5673.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18096099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDU5bnJLRHNvODg4bk1OTUhDa2NBV1B2UGFyczJwdjRhc3A4a1krbnFUOU15?=
 =?utf-8?B?bkdla1g4ekw4VGxDcXgraHVqZ1U1alBCRHVWYlgwOFp4L1NodER1cGpGTys1?=
 =?utf-8?B?bDVYdG9zbXdMMVMvVEYrVDlpV1FvMFRVcU1pYU9BcXpDd1o1RWN0RCtsS2E4?=
 =?utf-8?B?USt2ekxtTGdnRVBOSksrdVdrYkRmdTZvZGlOcktpd2NBS0tEb1M5elNCdFAx?=
 =?utf-8?B?MjVEa1RPZzZSWTNtcXd5elR3SWJyUmwvUjd1V2dFR1ovWnhxY0RJWHErZlVN?=
 =?utf-8?B?STAxVFRaSHpRa2cwTnpJOEVkSkNCRnE4SHYrSFVnSStTZUlGQUQwT0ZNM0ht?=
 =?utf-8?B?d0pWMnNoWDM5MHZSUm5LUmVqcEdFV1J6UFU0Z1FrV2JBbjlMUXRmZEFvZ2VL?=
 =?utf-8?B?TGIwYno5TkxvS3hkS0o3R1BvS0R2eFlvd2pLMk1FellYOWpvUTBWb1ROQUhu?=
 =?utf-8?B?cGdlcXJiWmlWZjBMZDJHR0Q2cks2cUhuR0l0UkU2cEMvdnpXaTMvSWJUTERz?=
 =?utf-8?B?Y3Z1S0hnVTN4YXM1NmhKMG40Y0w3cm5wMjZLWi85dEpnZG5vWG8xbnpMMGlE?=
 =?utf-8?B?NjRINWpIWkJqVlp3MkhFTml1NFFEL2VqRXhPaGh0YkVueTRDVWhsa1p0elY0?=
 =?utf-8?B?UFF6ckpkdWFmV3JEbWtjNVRqdStuVW8weHBhSWJnQWNPK0hZSVo5cGoyb3pr?=
 =?utf-8?B?TjdFVEFzdEk1bWVqQVlJc2YyOHZaQktkL2lVM2I2NGcxTDZWNCtCL1k4bzJo?=
 =?utf-8?B?Mys4dFJ2c2FKTGtNMkRyeW9RQTYwaDBETTNTdG1TQlhaam9ZNXJ3NlpPb09N?=
 =?utf-8?B?QUwyWjZyc0diVFJhbjJ1ZCtnZCs2WFlPMDZDVmN0VFljQ2NVaHYvMWFqQUdT?=
 =?utf-8?B?NVhGNnlPN3g0RDhrKzZwamZ0VVNNaHVIeWhZTnI1YmZnampUSDFSbW5zU0Jj?=
 =?utf-8?B?MnBxb0lJYTVDQlhMbDJybk80bFN0TWMyRnhBVVBzUHdaMEtBWDJLcVc2bzRr?=
 =?utf-8?B?MzRYMnhLeklrTExNZEoxb0IwaWNKVGJQbkpLOEF3eHlUYVY3U0JoVUE5MDJE?=
 =?utf-8?B?aG1ZbTV3Y2NCR0pIUExiQzJYRHJaUTlhMHJLWGJQMVZhSjQzNk9zbzRvTUxS?=
 =?utf-8?B?bXltdjlVaEMvVlUvSFZNK3FqSjBDdjBvVnZyQ0o3NExPRTAreWdrSTZhZDhr?=
 =?utf-8?B?SG8wbnRIMTJFSDRFVy9aejJpQ0hhOXhlNjlCa0ROVWRtcDZpeFE2RjUrRzh3?=
 =?utf-8?B?ODBFenN1b3ZCR0Nzc0ZGaTIzNGNXUmxtenBVV3JmZTQxT1pQSzV5NTRHcVJS?=
 =?utf-8?B?SEkxZXgzK0IyTm9MdGlCY093WGpEaTB0eEx0aVJrSDJ4akZiZlIxQWE1TlJY?=
 =?utf-8?B?NUVWa3l3RUE5VjhvTjdTNGdxclpMZDVlQW5Kb3p6cUJZMXRmWm5zV2tqTUhZ?=
 =?utf-8?B?RCs5ZlUyVllKRjlOdk5GN0Q4ZlN4QjU4ejVyUkIzOVNjdGczNkdyZGtlVHBr?=
 =?utf-8?B?RUduQVJrNm9EU2s1djlNN2ZCZ1NsRStRM3VITUw4ZTZDMFQ0dldWQk9nS3I5?=
 =?utf-8?B?c3JkWFo4YW5yVDY5a05jMVZ3Mi9samhRSEFQM0U2Si9wejExZTliN0RNVUIv?=
 =?utf-8?B?ZUJQeTY0VHFFMkdPOEVUVThyaVlrR084enFobmFlRTFPZTY3cG1xZlcrZWw3?=
 =?utf-8?B?eXJKejByT0xUSUNXRm5NN245TStDNjR6MzBCVDRZOFZEb1NrVkdSaG96L2Jm?=
 =?utf-8?B?NVphNVd6cS8rUVFpeEZ4a09pYjJOYXZEWW9ibU83bHRnbWtvd3B6bEcwWHJk?=
 =?utf-8?B?V1FmbnVSekhITDY5Zm1mVEFtYk9aN2JqdlhIVTNlUXZTMm43WmdZL2hxa0l5?=
 =?utf-8?B?Y3g2MVJDZjErc0RWTUcyRjVZRFVQWjZDR0NtQi9CZTh2Syt0MlE2Q1RyeWtt?=
 =?utf-8?B?L2Z5MGIwZWc3UU9zWEo2SzBjNHo5UGh1V0hLZmhMUXVjS0RWcC9RdEkrS1NF?=
 =?utf-8?B?R0ZyUVFNeHdrbWxQOFJJQlkwU2pMcmtWemZFUEpyclJibkF0bG1xa3JPRDNj?=
 =?utf-8?B?QlpLYUhWck5UUk8rSnJ2VkY0aG8vU0hvNHZvZ2ZyeUVJNGtPNHJ4VXBZRVkw?=
 =?utf-8?B?M0FLZ3IwVlIyV3lQQ09hZndMNjExUnFNTjhjajRNdUZCZW5wUVNVMFdPUmNO?=
 =?utf-8?B?ZEl6eFh5NU8rcWVZYXFaOXJnZ21Ta0tnTklONWt4YmNlRW41YzBPWVhNVWtz?=
 =?utf-8?B?eEpYMGE2aVYzWDNxc2ZQQ25tb3lHVURUT1BLWERqRlFVdCtoYUVSNEQ2U295?=
 =?utf-8?Q?0Buo6JuN30zntctF3X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922fa92f-3899-47ed-2dd5-08de9f0e231d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 18:53:40.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +di6Bn9I6UXD0kCiHLOPtysKfD2cfSwDHnB+offhKO/XSRWJcJxPY9AUbSCR+lA0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
X-purgate-ID: tlsNG-d25034/1776711226-F6809CF5-04E2B309/0/0
X-purgate-type: clean
X-purgate-size: 4130
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,lists.xenproject.org,vger.kernel.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:dri-devel@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-media@vger.kernel.org,m:val@invisiblethingslab.com,m:sumit.semwal@linaro.org,m:Pierre-eric.Pelloux-prayer@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E649A4331BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 20:46, Demi Marie Obenour wrote:
> On 4/20/26 13:58, Christian König wrote:
>> On 4/20/26 19:03, Demi Marie Obenour wrote:
>>> On 4/20/26 04:49, Christian König wrote:
>>>> On 4/17/26 21:35, Demi Marie Obenour wrote:
>> ...
>>>>> Are any of the following reasonable options?
>>>>>
>>>>> 1. Change the guest kernel to only map (and thus pin) a small subset
>>>>>    of VRAM at any given time.  If unmapped VRAM is accessed the guest
>>>>>    traps the page fault, evicts an old VRAM mapping, and creates a
>>>>>    new one.
>>>>
>>>> Yeah, that could potentially work.
>>>>
>>>> This is basically what we do on the host kernel driver when we can't resize the BAR for some reason. In that use case VRAM buffers are shuffled in and out of the CPU accessible window of VRAM on demand.
>>>
>>> How much is this going to hurt performance?
>>
>> Hard to say, resizing the BAR can easily give you 10-15% more performance on some use cases.
>>
>> But that involves physically transferring the data using a DMA. For this solution we basically only have to we basically only have to transfer a few messages between host and guest.
>>
>> No idea how performant that is.
> 
> In this use-case, 20-30% performance penalties are likely to be
> "business as usual".

Well that is quite a bit.

> Close to native performance would be ideal, but
> to be useful it just needs to beat software rendering by a wide margin,
> and not cause data corruption or vulnerabilities.

That should still easily be the case, even trivial use cases are multiple magnitudes faster on GPUs compared to software rendering.

>>>
>>>> But I have one question: When XEN has a problem handling faults from the guest on the host then how does that work for system memory mappings?
>>>>
>>>> There is really no difference between VRAM and system memory in the handling for the GPU driver stack.
>>>>
>>>> Regards,
>>>> Christian.
>>>
>>> Generally, Xen makes the frontend (usually an unprivileged VM)
>>> responsible for providing mappings to the backend (usually the host).
>>> That is possible with system RAM but not with VRAM, because Xen has
>>> no awareness of VRAM.  To Xen, VRAM is just a PCI BAR.
>>
>> No, that doesn't work with system memory allocations of GPU drivers either.
>>
>> We already had it multiple times that people tried to be clever and incremented the page reference counter on driver allocated system memory and were totally surprised that this can result in security issues and data corruption.
>>
>> I seriously hope that this isn't the case here again. As far as I know XEN already has support for accessing VMAs with VM_PFN or otherwise I don't know how driver allocated system memory access could potentially work.
>>
>> Accessing VRAM is pretty much the same use case as far as I can see.
>>
>> Regards,
>> Christian.
> 
> The Xen-native approach would be for system memory allocations to
> be made using the Xen driver and then imported into the virtio-GPU
> driver via dmabuf.  Is there any chance this could be made to happen?

That could be. Adding Pierre-Eric to comment since he knows that use much better than I do.

> If it's a lost cause, then how much is the memory overhead of pinning
> everything ever used in a dmabuf?  It should be possible to account
> pinned host memory against a guest's quota, but if that leads to an
> unusable system it isn't going to be good.

That won't work at all.

We have use cases where you *must* migrate a DMA-buf to VRAM or otherwise the GPU can't use it.

A simple scanout to a monitor is such an use case for example, that is usually not possible from system memory.

> Is supporting page faults in Xen the only solution that will be viable
> long-term, considering the tolerance for very substantial performance
> overheads compared to native?  AAA gaming isn't the initial goal here.
> Qubes OS already supports PCI passthrough for that.

We have AAA gaming working on XEN through native context working for quite a while.

Pierre-Eric can tell you more about that.

Regards,
Christian.

