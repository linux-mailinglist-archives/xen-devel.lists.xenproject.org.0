Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I9EH/wkn2mPZAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:36:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5F719AC18
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240940.1542176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHrk-0005wK-Lf; Wed, 25 Feb 2026 16:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240940.1542176; Wed, 25 Feb 2026 16:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHrk-0005tn-Ig; Wed, 25 Feb 2026 16:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1240940;
 Wed, 25 Feb 2026 16:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9A=A5=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvHrj-0004wB-RX
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 16:35:59 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d868ced-1268-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 17:35:55 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5409.namprd03.prod.outlook.com (2603:10b6:208:290::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 16:35:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 16:35:51 +0000
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
X-Inumbo-ID: 0d868ced-1268-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=intaMP0SKUklSmhmeZghzwnwDD55hihskJiJezk9JSMdQMZZTTv1NnXAUGnaB0vR0CtrU+drEOE1nHSc2HaRyliF18UI16MKIfkxnr7/1oHGhkzEuyV/YiKDda1lnTRhdJzbpQOFLKiquTqxdqrrxJ4vhJeL2+EXp1t29R4bpavtmmsRDje+8k+FgW+d988RtoqOl8s9aV7yL1O/ajm0HOHMv3SzpBTciU7y70q4c4BTUtzOvPtSA+cbBD1mq5INQ/dootpwe0ePYLSCOEF2xgFIrzH6fY4x9B3JbqtQdt/qqyqlbF0O3jop5WIcsb7a6Tzyt4uDIWOE8iWmEAnABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPJVgF7rbAxnethkzzJ4tlojtoPfMuwx9dLhByowQZU=;
 b=OErAdCDT6+lG/gaiMOdPukdzIw2KU/J8r0k0MZYG9c+jYDb+/Zzln+DBaS305pZbLuvaBaRhE/JsW6I57ZZ1Kts6teuX4Kbp/kJ2Ue36iMv8Z9FnpJboicrZxOWjjzGxovICjZdf8on0av4NhubkcqnVvdP7I5YIYBjBvWZsK8WKiu4qQSP55Z5Q2oIdphSdS4FzKcOneHK2LKD4e16/nSHMyRRS4C+UikC4uuZVy1NQGr/G91Af+7HWFwlo8AMClQOYF7W3rL4h6PO47cJGsS7isqBkOf7itxH8ly6fmw/DldOBk9PwevnRwIFiZjRd1rI/tiwexqL9ODRzDsN2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPJVgF7rbAxnethkzzJ4tlojtoPfMuwx9dLhByowQZU=;
 b=g3duEhKPA+PlHDbxxUPauY+usyW+UFcCGYIAwe/D2ZMCpA1gUiUzXNQ8EVGiXAmGrZN2BOECUzc+2SRsIJf4WQaZ941JwdvTAfXup1CRaooQ64HRsPGREjcFf6/xnNtoUppWxs6cePBI33rLLyfLRfSTpP8EqxyxTPrVvzLp2LE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <63ee91a5-914c-4a09-9ef7-1e55beedb3e3@citrix.com>
Date: Wed, 25 Feb 2026 16:35:47 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/mm: Remove claim that INVALID_{MFN,GFN}_INITIALIZER
 is for older toolchains
To: Jan Beulich <jbeulich@suse.com>
References: <20260225125940.3804137-1-andrew.cooper3@citrix.com>
 <46a711cb-1853-44f6-a9a5-4d6252a8a995@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <46a711cb-1853-44f6-a9a5-4d6252a8a995@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0443.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc56bb0-3124-40ca-a4f3-08de748bf018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	3mbhVZZ26pHqJG6uE36nJfkwOkHlSYOgk58Sv8ENur2lsHxomJ+7w/mUcRbRe/kUnVwEd33FxONAcXubW58rQOKa0MS4qVc/DfBUm7U1+pHLyvNrD7r+ZA5EdDjG576cs1BFiUcYZLqA4RgC58fFg7qvOzywoerx7XJ8i3U881jK5HBNtW/NlAF1qgDY/hLQIXBVJh9FOcAdVdOgezkZsEB3Sp6AOdcLU/a4BY73Bj1+MEjQH23tZfYZz/BapUK5e2asTZLARVclBG8oOmHidAZrDejXfvBNQYpu6dsT2Q0Moiyy8jnZPmXw13E4WJqndwCmTAlxrpIihvPrDeDY7cBnkwz3tVR2u4mXYjEpLqdbLBq5lpsN4hIJ4gsEVIkjUV0UtFrtTKXobrBOwgTBWhof+4kKYkvLkN1WvCpiKiNr3G2MWYUVjcIONbg1q8DQH/NxkZ6mU32wpqicgkgNNFkQ8FPz+TxQE8H6SX3IRQCuTwpjL2N5DiNnHSw7s8E0rZviZktD3xaMSI+WitUo+bNYVOtCZltQT2gIR79ae1Ewu2mEBk6sNOv0hY5Hc/pLEELwZJOVigYegY134EMj2JL4Y/47R+PqSpqlmFhIwvhtKgG2HM3O3eLxDzKHF4eEeB25Hb4RCI0HyEYJ7BXdlg28EKF09TG/saCBK/Aa+/aAEXgwq1c3FW7qRRWYPLBFgfJR8x6nS023e6+uMxe3QISERuq2aSbN9UPpNgaPbwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWV4ajlPc09mQ0NMd2NtMlZ2TUhuTzFaeG51blBIRndoRmhWSmhjbVplVm9W?=
 =?utf-8?B?azNwUEprMDk5V2M5MlcxaEZHNkxJd3FFd3FHRE5EUjV0ZlZaL2ZOMGxqdW1H?=
 =?utf-8?B?dnVSUWdONWcwZ1ZSdmowVU5oZThHSEprRGVYbGM1c3JqZHQ4cFdMTlN0R0pU?=
 =?utf-8?B?c001MDA5dnRKeFdFM1dhTXh6SndGa3FsRFVTSExha1JvdTh0VTRKamRyUkh0?=
 =?utf-8?B?TkhYbFRiNkdkWHBRL09JRHhWbDBBZEowSmM4N3hRdnZIa1pyZWt1d1hacUFW?=
 =?utf-8?B?aFBOZ2NYbHZaaEFwUzNFUDZDK3NMbkpyUzhZbDRPQXE3dzZxb1pvQ3B3amxm?=
 =?utf-8?B?Z2E4d2pxeEJSdWNvMnFRTVNVVEZVQmM5SHA1SDZ1UkZiZHJOYjVsWGdPL3N1?=
 =?utf-8?B?azB0RXZjRndDOFRWVi94bHlTaGRXM0M2eVcvSFpKMm1PZjllQitFcXNGU21t?=
 =?utf-8?B?RmYwYVZSalJhdzhxK1pqaTdQZmZZSGtLUnRCZlJHVjBsSERvSEhRT21hNWRV?=
 =?utf-8?B?TitMQkdIMmdOREJtWmk1MlM1TXIrTnE5bk1sZzFMY3JiYitDVVBjeW8yQkZV?=
 =?utf-8?B?RDdQQ3gvY1NIZklwL0VuYUpYNzlnZE5udG5Od1VMS2dXWC9GQXJSbVhxZ08x?=
 =?utf-8?B?R1N1Q0E0WHp1NUNhK2Z2ZEU5cGk2c0xtZjdYQ0JrTGl2UjVPbUVzWStpNkcy?=
 =?utf-8?B?VXNnQ0syemtEYWRUd2p3RGp0cDBMS0Q4K2RYelFTOThQZ3gySUpZOWFlM0lV?=
 =?utf-8?B?SnExM2F5ZnM1cDB0UnRjNGRJZGVGZGJ0d0tzTU9PTDUzd1JXY0NXTGFnZWxi?=
 =?utf-8?B?V3dxUEYybUFXWXFyYVhXdktETzdxSUFQMDdmRXZuTjlGcnk4RFoxT21LRDVC?=
 =?utf-8?B?WU1ucmZydW51U1BqWmZXRHdnRVhVZWdVcU1Wb0dFOStGTHpMT3VYR1hWR3RX?=
 =?utf-8?B?Yi92dDJndDg1dFRYaGdJMWFGWUhTTTRQNmFrS2o2V1lzck12cy9BQkFIdG9N?=
 =?utf-8?B?bURDYkRQMnIzK0g1ZjF3YytMb1BlZEpxZkU0dUptR3pFcms5Y2YwRTN4WnNM?=
 =?utf-8?B?a2xzTEV0STNGVmZRaHlXS0RlRlFTSmlWWmVjczhxZGkwSEhSLytHZzljR2c5?=
 =?utf-8?B?Q1ZuREVXakVIRm1kV3BoZ0Y5RnYzZUFlL3N3dFVxd3ozU3dZdXd5bTZEaFJW?=
 =?utf-8?B?NUg5U3FKWDIvdlpIK3FsajVDdENEMXpTdW9iUktvWEhPTTdSZjNmTE50bkxv?=
 =?utf-8?B?WlVwVU1FOVlzbFl1RDQ1RUJlNVFubUY3bjBTN2pSbStWbzM1UzQwelhFWHdz?=
 =?utf-8?B?MDVpTEpqeC9ZQ3J2N0E0RSsya1JkaDJ4VWlLM25nSVR3TXg0bHI5djRVNjls?=
 =?utf-8?B?b1U1K0xKT1FqTVcwbHNvRHc5OVhraTk5Wm5UWURBeFF5NWRoYkpYblpCNTZh?=
 =?utf-8?B?ekUzSmoxYmtPQTlVYU9YQXJvd2NaL21EaEpaOXdDRnhqcStyVnNMN3JablNp?=
 =?utf-8?B?bFVaV1E1ZDg3ZHhCMjcwUkVMVCtVQ1NhSnZUTjF5L1NjMUJXTm1LQmNpM3lh?=
 =?utf-8?B?OW16UVBERkNocHJwSGo4bFhEZ1haak9JOTBFQVlrVGxsNmVYVUJRdXNodG1o?=
 =?utf-8?B?TG1lMWxvckhSblh0NHJ6UnFXS2RzQWtsQmRSZDE2eVNycTREam5TMzBZZitk?=
 =?utf-8?B?WnZndUhwUmhEYVVtM0l6ZlUvbXNlQ3p4MjZqYWRWcnVnWXYxSnJaZWp6ZVR6?=
 =?utf-8?B?YXliaDBFdmxVbGJmcWxQZ2R0UjN0WjU0Q01TWUVQdVAxNkxIaEk1Y1ZiOGJD?=
 =?utf-8?B?N2YySmNGWERpRlJ3VmwrY3FTUDBlTElYWEI5WkNrQXFjWTh3NXZpaW15bzRl?=
 =?utf-8?B?dFB2bnJaME9HTEFiSUtEMkMwRC9lQklmekxCWTBjY0tmeXJkSGFMU3NvSVNz?=
 =?utf-8?B?cEI5M2FvNG5XSExySWNYT0ttRTl4UUZEUTlvZzlHTHpCSXQ3b0lvR1lVOE9N?=
 =?utf-8?B?REhHQWNnZUcwNXdMSHdJa2RlNXQwVVRac3ZlMkhydEx4RUpYOUM5VThFTzMz?=
 =?utf-8?B?MGRBRXorckFCdzJKejVNMnNoaHNBbXgrMEZLQUU3d0VZM1l0Y0dHTHU4azdm?=
 =?utf-8?B?NUxLVmV6cDhCb1NPNkFBb0NkU0N6OU8zSDJKY1lMeE5ETlNLR2ZWbEhCMVBJ?=
 =?utf-8?B?L01HejA3Wm5ZZEZ2QTZKZHlXdjlTTjNaTmFMeGhUbm9EdUJXL2NiQzVEaTVj?=
 =?utf-8?B?Z3dCQjRuekNFUjV3eHBkcVRSS3hQT0hBbjcyc05KSSs4NHltMzhabnZZMHRZ?=
 =?utf-8?B?MVgwS01OVE5kVUJ2b200eEE1NTE3a2dIWTNQM25zcU5HSi9DdVRMZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc56bb0-3124-40ca-a4f3-08de748bf018
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 16:35:51.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqEKiYNyf5eziKIhzUeca+2gMqOgtxrsHWOhgj5g0Vm2qA3tI6ufD/XvvlLpsFAk+My5ey5DxzZSK/Zw+NLnfRSO1GGqR8LJBwHCB+m/2NI=
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DF5F719AC18
X-Rspamd-Action: no action

On 25/02/2026 2:34 pm, Jan Beulich wrote:
> On 25.02.2026 13:59, Andrew Cooper wrote:
>> This was never because of a bug in GCC.
>>
>> C requires that static objects are initialised with constant expressions;
>> _mfn(), as a static inline, is not and cannot be made to be.
> Of course, and I think the comments were meant differently. What wasn't possible
> to use (with -std=gnu99) due to the referenced bug is apparently
>
> #define INVALID_GFN ((gfn_t){ ~0UL })
>
> Now that gcc5 is our baseline, do we perhaps want to use that and do away with
> INVALID_GFN_INITIALIZER?

Oh.  Yeah that's very much not what the comment suggested.

Changing like that almost works, but there's one snag.  common/memory.c has

    BUILD_BUG_ON(INVALID_GFN_RAW + 1);

and with the _RAW constant wanting to go, the obvious:

    BUILD_BUG_ON(gfn_x(INVALID_GFN) + 1);

doesn't compile as it's no longer a constant expression.

It's not clear what to do here.  I don't think we want to keep
INVALID_GFN_RAW around for just this, but nor am I completely happy
dropping the BUILD_BUG_ON() either.

Thoughts?

~Andrew

