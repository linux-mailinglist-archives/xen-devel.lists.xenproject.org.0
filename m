Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOIHBt8ln2mPZAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:39:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8219ACCD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240956.1542187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHvO-0006oS-86; Wed, 25 Feb 2026 16:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240956.1542187; Wed, 25 Feb 2026 16:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHvO-0006lo-4y; Wed, 25 Feb 2026 16:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1240956;
 Wed, 25 Feb 2026 16:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9A=A5=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvHvM-0006ld-G3
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 16:39:44 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95a5e455-1268-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 17:39:42 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5409.namprd03.prod.outlook.com (2603:10b6:208:290::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 16:39:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 16:39:39 +0000
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
X-Inumbo-ID: 95a5e455-1268-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auUwfmrmS33BBQlob4JDxIcYyVbwcrXBcHJMjgHJUYVoA/5KJllv9/aTepNpfm4vw1dhqZwxzkdwg9eFpFYzPeUgJNUHJID2QU8NQOeaTa332PjLEGDkUKpk+zw4VrgqUXqnyx2MK1aX9FOXHR+uK3HMqGwXF4Tap0hkVWyJzOtvfCZw4wBDCprejE/oFlAd3aiOE4pL/Tf8WjJ7yQw2/VeX0YHZhby8j9U8TXpp3I0Jgyhg8lDqNij9kSwX3aejhlYTE1BCdz1CNB1X9HT3MSw/VC2f4LplYDNJz3EICi2Z530fToQiAlkNs1RH/LCMODgdT0bYq5a6ceaT3mKM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJ9FlLJ8rkesoG3m4cechJW+m1JGhnszbopXNOLmvr4=;
 b=BYB00zMCKhg5JQ53wMfStt9syuZE4vAWk+2A9g/UuOxbTP2jhpO2qaXfNBCEAJttSHvEnbNV+A/EOhyTjfMzfkSeTdkvi7CUZb2altC7bRpmLdX2I+WaVFEBohL/znlBgadU6/kHQL8ykxQAhCBoMcO90loS9FmAhYC1be5yjbCwKAnfpjtjwcKCcjPCGYR9HX7g8OWIumbpn+Skp4vY0pgadB/xWCW3xqlLfcxxZiSEA7lOraJKGSlJ1csOYxKClWwu+2vuKFQh6Bc5gKUMK2hHL/pl/wv/brusl8cM8q3dlOnQiXG3zS1RT4OzS3i3kisPlpxF5Xn9tLWpLuzigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJ9FlLJ8rkesoG3m4cechJW+m1JGhnszbopXNOLmvr4=;
 b=h68oAF1+Oes7LVwru1rbKWj3i4TxlrdHmYHWmVu8rmsXwM9Rftx8oMi5ZzG3/01NBB6fGpr9Jj65aoUAxwBMHU6YIQetOQf6bhPtnUxhMHrgvFKP1GKV5q0tSFPLgZHGblQKa9KRYVoUFidYirzPJLygnhhzyPuLb8hmRszXzX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f296cd52-04eb-47bb-ba4a-29dbf1834bb3@citrix.com>
Date: Wed, 25 Feb 2026 16:39:35 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 11/12] xen: Bracket uses of macro parameters
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-12-andrew.cooper3@citrix.com>
 <a917dc27a7fba87a8f829558444545bb@bugseng.com>
 <82bbccff-fca6-4256-b228-88fc326cf5d6@citrix.com>
 <5f1dfb0a9a17e06309427726c4525a41@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5f1dfb0a9a17e06309427726c4525a41@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0243.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac57325-7b7b-4a63-bfae-08de748c7824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	SyRXDc+HzGfmNt7ar32MOQGxaXKhAQ0yRVH/uoSTuwux0lNMjDzAQasqvQIzbP/aYiist3FA7pLWl+mjjII/jrW6HuEQncG39uMSTljmPlBR7ILTtlkwQ3J+FwMhWZ4e5pScl2yHbhmAUA5cwnBPyLQxGeDnNlslyJxldXZlAUcSqYIEbecg2D3HyA9rB5ukALNHkRsfBHwFC3DtHbecNJ4uHqDsunHzFLl3G1XM0dmLQfVFLW9eU8oUQ7ZkQvokO+TCc/GTTqilVCFH+TD9NevJ/Ot9hJZhNcTZSv3f4yjmY7GKleqSmLRF+6y2fAMTg5w/xe98rrRnpq/K991Vd4Jce9iw0kh86EUR6g7d7Bh0giHg2EE6F2CUq6pSsTM80Vr6a5e1z64n1XyOAWifQ/kSLqSQqHc/yW1OLkyTw8mtFVoH+cXxrSjVwXNnSVWRUTfNbeD+GY42iBHq+gY8JB8o/8Ov6MZQa7UE70ZQ1O9i6ly/hfKHjmSmq7nkBb2btXNXUKOL1TR+2Fvk1gJryG3BbN6HHidW7UEa8lhF7b1iAnhGkayFThhrl4v5M902ROHov+SjedIzTsVZmdbwgqKJGrMYu6H8g5n7XsKQ2tFOykoXSah28qY8Xclw2qIfYIJFuT2v7iL7JMLpi6PCt2apkuzVU23Qwjce8g+nUJDvkJtFpNQG0/eNDXUjMuiBnkhRzTP2o5EVLJKHtTi3rRUevM+mWoYU0cf5OYXjCto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTdnNmsyUUN4bVdsd0pBVzhrYzdrcVpVbzF6b01iVVljckdjNEl4S2dXYWZB?=
 =?utf-8?B?YzZFUmZrR1BOMnB0a2tpMmwvbHZxUEM2dVFUU2JyaDRmSTdFN1ptYjJHWnVu?=
 =?utf-8?B?SjJaK0dtVlpsWWNyaGFxTk8yVDZzUi91akhjNlQ4MGRTeEVNQzQ1R0hPeXNZ?=
 =?utf-8?B?Wkw1VGFWaXAyMGpOb2NYdllCODRubFNtUlJuZFdYakp5ai9uZjNxbStNSG5i?=
 =?utf-8?B?Uk1zVGhOSlF3UXhEaUVLNmNrVkFUSUM2ZnhjaUViTDVtZE1YOHJrY2JHdFM3?=
 =?utf-8?B?YW0yaTl0dFB0OHE3WkEzSXIyazlwWUl1eEhYNlNKUUt0RkdDWC9ubm9wcTM2?=
 =?utf-8?B?VFR1dDA4Z3NZamRnSFZCN3B2RFdiYTlUa2E5Z1RkWnZpQlBKMzM0U2NjVFR5?=
 =?utf-8?B?VGtOVHhMWW4rV3YvaHpOQktpcUxTWTR3WnFpblBpMmh1MzdzUFRmWEZBN3Nt?=
 =?utf-8?B?ZXRBc1dreGp0d2Z2NjRRaTlQMEk0RzlXeEVsMlg4dWxwVFVrSWovejljR0xN?=
 =?utf-8?B?RlNMandCTnJaRXdmNmQ3b1pJMGNNZEtqZlhvOXI2eGFNMEhDcU9tdWZOMkVC?=
 =?utf-8?B?VGpnNHRMaGd2Nk9TaG9kRVRGL2c4MmNPZ05ZK2ZHbXNkcDJuc09jUmllYXBv?=
 =?utf-8?B?WkZiSHNJSWRYeWdPOHhISVowSkF3c0lPMHBQUFNGZWlrT3hWOHI4SUxvRFpY?=
 =?utf-8?B?eVJDd3hBbzQzZlNRVjNLdUgxUlhoVWo2VEVTSVUvb1BBbUFlQUhmN2ZGd0k0?=
 =?utf-8?B?R3lVQWRJcGYzU3d6a1pudE9EZEx3ZXpvWkd0b2R3V2tFRm5zQXlWN2JCdlo5?=
 =?utf-8?B?ajg1dDZnek1HSkZnTVpYaVpVOW44bzFCQldMRngvY2NLY2lOc3JJbVVwREFh?=
 =?utf-8?B?dGZYam1sVmhacVNhN2hCN1pqMGMxLysrSlZmZFkreFY3NmdWYmVnWXhDTXdL?=
 =?utf-8?B?TWZod29QR3hDQnBlcmpkVWpiOWx1aEJ1QzJRc1poaERwRzduQUw1TEdPZDI2?=
 =?utf-8?B?RHlKYUFjem9rM0lFTklsZTRmUE81ZUtPbGdWaTFGMk81U3pNRDhZYmRNOG5h?=
 =?utf-8?B?RW9CSlZvVktsMTMxYmhZUXJJeG9GRFFBZnlZSUlYTjBvMCtjVDFJSUM0YkEz?=
 =?utf-8?B?TjVDdkNtY200a3FSbzhrWFZGTGtsME5UZmpiZitveWx6L0o1aVRkUGluVHov?=
 =?utf-8?B?eStjMjBRa3JFZ0EwUW9zaGdGamxJZmx6ZWx3SkFYZzVFU3lWdkFkNXVWZTFB?=
 =?utf-8?B?dHRtYU9FWlF3WnArcUhocW1KdVFLdEN1U1g1UEtQRTVGZVoyY3I4VHVHNEZB?=
 =?utf-8?B?RmQvQXhtZHk0Ym9abTM3dUI1cjUySTFZRWJLOHZvZVIxbkdYQmlYUTNLZTBh?=
 =?utf-8?B?cEFtdkZqU0VRQXdNeW5makpEdUxKalhCOTYvbGN5NDVKVmdrSFdnaXdzcllx?=
 =?utf-8?B?eFpLdU4vdzZOc0lieDJvZHE3dG9YZmdqcnBiTVVMdmFOdHFXa0wyQXhETFBj?=
 =?utf-8?B?Tmk5UTJ4WE51b0hrZ2dlMmxIT0NWMzI1bG1SOGdNaUdablg3dzc5ZS9mQkpl?=
 =?utf-8?B?eVVySTQ5ZWpnM1dvb216Wms0Rk9nYWxnYmVQUVk3NDdJR1FKM1U0QmNTWFdT?=
 =?utf-8?B?TlBCS2hQbEd6ZlY5UldVU3hYOUxxak1kMEtjOFlYR0Q1MXR3SWNpREREbytm?=
 =?utf-8?B?R2ZDaE5jWXZoQ0FyZG10NElrbkFnbDFrV1Vqd2lHcmp1d2JvYTY2a2xhbXdw?=
 =?utf-8?B?L2l6M1dSRkx2YSs0czV5d1pNMGxaQVpQREJlTWJiQkhJR0tEazhvazdJRWdO?=
 =?utf-8?B?NjlWcmoraGRNVHlLYmxJanVoQ08zSm5GNVl2d2lueHU3T2RhYkZhMmt4d0hp?=
 =?utf-8?B?TW9NNzFYTWxYQmh1Z0JkY0lxZDNqb3NIaEVyNThxVnR0YWM4ZDJrUlVUTTR3?=
 =?utf-8?B?Ymk2Sit0RVZ6Vzh6ZWJHWjloOVVxeG9uU0psNHl5NlB4Qis3ZU0reGtLZHFB?=
 =?utf-8?B?ekM2Q3k1UnVpTlc0ZUpZdUlXNmpnd1dXOTRLUVhGM1o3QmNzc0hhOHRWL1Zy?=
 =?utf-8?B?SHYzaWw2UmhaMjNpVDFZUUZ2bEdJMG1vcTlvTzB5RWFkTndZbUN6TkphNzdm?=
 =?utf-8?B?Wm9OQ29VYnBNYjg4TXVGUkZERE5VbXBiWmd3QjU5VkRYbkdheUp5cUpRbVRi?=
 =?utf-8?B?U0pIL3oxYTVvZVJsQ1cxZnhMaUdxZmR3N1d6NFR1VlgvV1k3b1FxbUo0Vml2?=
 =?utf-8?B?VzFubjhvUEFmeGF2MDhwaG5XelY5QkhOblpKeDh3RHA4UFpVZENDb3BvemVV?=
 =?utf-8?B?WjFYdTcxbFV4LzBQa0R0c0cyMS9QZngzOWt5RUdjcDVpd0Q4UExldz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac57325-7b7b-4a63-bfae-08de748c7824
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 16:39:39.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfnFkdhmVmuxTF7BGYK9Cf0y3844r6Izn2xJGMAiUew6lgRdqPLubXL33WuQV0TqaoMlSUUzG/BEk+3Tm9PgnlVxEKyNX/EMZVXgeSs4qLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5409
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bugseng.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7EA8219ACCD
X-Rspamd-Action: no action

On 25/02/2026 4:34 pm, Nicola Vetrini wrote:
> On 2026-02-25 17:05, Andrew Cooper wrote:
>> On 20/02/2026 10:45 pm, Nicola Vetrini wrote:
>>> On 2026-02-20 22:46, Andrew Cooper wrote:
>>>> Fixing Rule 20.7 violations.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Thanks.
>>
>>>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
>>>> index 7446533c8cfb..63473925cafb 100644
>>>> --- a/xen/common/livepatch.c
>>>> +++ b/xen/common/livepatch.c
>>>> @@ -664,9 +664,10 @@ static inline int
>>>> livepatch_check_expectations(const struct payload *payload)
>>>>      const struct livepatch_elf_sec *__sec =
>>>> livepatch_elf_sec_by_name(elf, section_name); \
>>>>      if ( !__sec
>>>> )                                                     
>>>>                    \
>>>>         
>>>> break;                                                        
>>>>                    \
>>>> -    if ( !section_ok(elf, __sec, sizeof(*hook)) ||
>>>> __sec->sec->sh_size != sizeof(*hook) ) \
>>>> +    if ( !section_ok(elf, __sec, sizeof(*(hook)))
>>>> ||                                      \
>>>> +         __sec->sec->sh_size != sizeof(*(hook))
>>>> )                                         \
>>>>          return
>>>> -EINVAL;                                               
>>>>                    \
>>>> -    hook =
>>>> __sec->addr;                                               
>>>>                    \
>>>> +    (hook) =
>>>> __sec->addr;                                             
>>>>                    \
>>>
>>> This is not strictly needed, if not for consistency.
>>
>> That explains why my first try didn't succeed.  But, why is it that only
>> MISRA only cares about bracketing for rvalues, not lvalues ?
>>
>
> It was actually asked by Xen maintainers to introduce this special
> case on the grounds that it is extremely unlikely to result in an
> operator precedence mishap that leads to incorrect expansion. See below:
>
> -doc_begin="Code violating Rule 20.7 is safe when macro parameters are
> used: (1)
> as function arguments; (2) as macro arguments; (3) as array indices;
> (4) as lhs
> in assignments; (5) as initializers, possibly designated, in
> initalizer lists;
> (6) as the constant expression in a switch clause label."
> -config=MC3A2.R20.7,expansion_context=
> [...] 

Oh ok.  I'll make it match what was agreed then.

Thanks,

~Andrew



