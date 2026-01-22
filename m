Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLskNs0xcmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8F67D07
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211130.1522661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivWA-0004UU-Ct; Thu, 22 Jan 2026 14:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211130.1522661; Thu, 22 Jan 2026 14:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivWA-0004S1-9Z; Thu, 22 Jan 2026 14:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1211130;
 Thu, 22 Jan 2026 14:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lo+0=73=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vivW9-00049z-Gw
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:18:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d814ce1-f79d-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 15:18:36 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6A3034EE3C11;
 Thu, 22 Jan 2026 15:18:35 +0100 (CET)
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
X-Inumbo-ID: 3d814ce1-f79d-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1769091515;
	b=U6c53olXA5TCoCcp5wu3MuNKA69TufPb4JyVyYSBJynx0unGkzIL4OePIRVc92ldLHb+
	 yEwkGs7+u9J6YygRtasAEBkjx3rJoW55bXnY4Bx88YYMAYvc4+T2dH7afIV9MERb6LTgg
	 gFEgTmfm/K+8KuFCSyNrb5vvygt2PSnu0FBfRlavBcH1s4onYFtvOJnOait4nGhlZGxGg
	 TzXMXvZFSO2gTYK1iUWOAZYy9t15/gmUjWDhwKbhWbJ93WBLvm1gHK5dBHJ5prUcAHn9j
	 qIYgYOYnOnyiHXe1FcvAp6IYmBkolyh+ugWq93R56kMN3horRAFe4ZcvP/euU6sKPMQGz
	 VJBHPSrK42p3LNiixi1takbDUhOYMgcUIAi2/U8Y+99pG41gdAYQVA+4mQCrxJFFB4680
	 2PEdHTZygMZGDKTK4YOj6XWlQr6CX9/3iE3W7/YgsiNhPmOc/uyRhnh3INSY55idJhGvX
	 p7lk4kYmzXMuVHRxGfmPR2/mQ8fgoOTaGUmThuNkQBp1lbJzpc6GxYuAaA6LKiBfPuI5F
	 qbkk5HMsc9rWBUcy/00pEqvtkIX5FZ4nVCr6Zy/jRQOT1YGEgbSUdkXpY+LxvUN6epT06
	 ICdqA7cTBgsaBLSXrLOcrVsFWqZo7MmW+Y0COtIdeeumKsKzxPHlp/wk58EKiio=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1769091515;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=rZgi7txDtcK8WRlhPaJZ0sQJZAUgCPUk3UvQylM6vao=;
	b=SMYusmknzl05yyYV7I5elQxIv3SNtdZIbbwLjY6M1hV3GGkk5puwcoWVQUgOT7l4tEiT
	 UBqmuRGI9GRIznHHguyu6suhQsWrhAwNMlAnt+crqLWM+5vQdXtETqaI0N3ZCI29+1Apy
	 ZCtImZjcr/bTXXtQ0yQKbQTZvaQYJaAnHJdxMbgvSrXb72Mf7eI3dEOTyQC+fCSsfLcXe
	 aTSZECrMgocFfy8mLtGEsA2FjZjCdzlMRtYItdxJdb0s5tdCY9GScPa1bhwcmK/IIcKTW
	 /7qYayMToYNn5TXqX/twgaIKpS5khsHOW9cW+LMuNYX1+rZnyCPg93f0xrXnhnJY9ZPWB
	 ENKaGp45LVmzMlvT5P8m1ZKntWG/zC13pN/ZV3Fx8QFwUh3+090fkTXCq34P7+hP5Bw9G
	 FWwU2loql8YIfhB5kuRi8DMIAeFoIfabqtR1MGCZlCnr/WWox2jbGftKosQjQLNF9RqCt
	 UOJkaSm+hcUTgKYprRwHahqEDebY9RbN889sezIxkiT1K3Jqn2Kcx3aANIEC45951KMi/
	 vv2JX4dAI6uHqCF/IFPMe6C1UQikOClukzuCb+iuaki2BlWHPCMLx3CqW4fs5ff7OpR0W
	 yOvXV+YHty4BdM798SbhkKZw2zVczSSk2L7PrE+CCNKkXA1LG+Q0mspErRar6/4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 15:18:35 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo
 <alejandro.garciavallejo@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/2] earlycpio: lib-ify earlycpio.c
In-Reply-To: <947a4230-4a1e-4178-b7f0-ae5618f4303d@citrix.com>
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-3-alejandro.garciavallejo@amd.com>
 <5948da25-0b4d-48a5-983f-0fc9424774b3@suse.com>
 <947a4230-4a1e-4178-b7f0-ae5618f4303d@citrix.com>
Message-ID: <02004b6ee5ddb57f4b834163a955d29b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:alejandro.garciavallejo@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FC8F67D07
X-Rspamd-Action: no action

On 2026-01-22 13:50, Andrew Cooper wrote:
> On 22/01/2026 8:27 am, Jan Beulich wrote:
>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>> --- a/docs/misra/exclude-list.json
>>> +++ b/docs/misra/exclude-list.json
>>> @@ -121,10 +121,6 @@
>>>              "rel_path": "common/bunzip2.c",
>>>              "comment": "Imported from Linux, ignore for now"
>>>          },
>>> -        {
>>> -            "rel_path": "common/earlycpio.c",
>>> -            "comment": "Imported from Linux, ignore for now"
>>> -        },
>>>          {
>>>              "rel_path": "common/gzip/*",
>>>              "comment": "Imported from Linux, ignore for now"
>> Judging from Andrew's
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2277362625
>> this doesn't quite work. As I had expected, since the file is compiled
>> unconditionally now in its new location, some violations are now also
>> unconditionally reported. (Some, checked for at linking time only, may 
>> not
>> be reported anymore for the *-amd analysis jobs.)
> 
> Yeah, in hindsight this seems obvious, given that we're compiling then
> discarding.
> 
> There are two options:
> 
> 1. Use an earlier form which adds the new location to the exclude list 
> (Still needs to be in this patch for bisectibility.)
> 2. Fix up the violations first (only 6 in total)
> 
> Two of the violations look easy to fix, two need the deviation for 
> octal
> numbers, but two essentially-char violations look to be hard.  The 
> logic
> is doing ASCII manipulation in what I would consider to be the
> appropriate/canonical way, but Eclair does not like the mixture of ints
> and character literals.
> 
> I dislike option 1, but as (contrary to my expectations) this is
> interfering with the *-amd build, I'll tolerate it.
> 

I agree that Solution 1 is the easiest to implement. An alternative 
could be to fix the regressions for R7.1 and R20.7 (they're trivial) 
regardless and add casts to sidestep MISRA for R10.2.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

