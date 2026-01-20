Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHuLDQS0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2182481AE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209057.1521177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCar-0004Kh-Mp; Tue, 20 Jan 2026 14:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209057.1521177; Tue, 20 Jan 2026 14:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCar-0004Il-K8; Tue, 20 Jan 2026 14:20:29 +0000
Received: by outflank-mailman (input) for mailman id 1209057;
 Tue, 20 Jan 2026 14:20:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfLJ=7Z=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1viCaq-0004IG-5J
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:20:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2911cec6-f60b-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 15:20:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8A7694EE3BF1;
 Tue, 20 Jan 2026 15:20:23 +0100 (CET)
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
X-Inumbo-ID: 2911cec6-f60b-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768918823;
	b=CB55ofH04DEjlVEofm4qEM0P2XnqAo7KmX7qq2xqP7FFRkqY19mKui3Ys2iTElMAUi3t
	 L6wlJwmcnZ7fn3tjlA/bQvjqmKBG13i7dBZExzS0/DdxqYy3nEZ2hrt+CIfY9iOuijQ10
	 BjRGUWXJ2+zrZ/pVuuK4o+k1FAASlP7GZJsftAVudYRZhhiPvt3LQfGBrrKwuLyUnT8yw
	 lsVXiTbMumns4cWzIoZLtzbDx3RBFdOuFBZuvOgnNRi/qP8WSmhOPz1oiJNGJaI0okedb
	 j/zs5qI90nYdD7hb3TXtBraX/uIwklSeF5YLLLUcEm2OId7KnNKTlZLlkjq6fvsnjxa7M
	 NDjTZC6x4ge/pt/bcXfO6oYxzY73brpIaECUUPEMyn1teJp4J/D0yFFyLJBRM6c1dHGdP
	 u/ADPqpG8dkQOBNPzLFH0lqt0kuV3qvXRkr7Ee+O+4sHSq4g2ecLqsl9L8snN/ixxt9Nw
	 Vx70a8wp/T/vHswSrJedENUgqSJ6UVlgcx5c5dB88lqKdefl7ZOylBBD23bM0+xSmbGQf
	 sbB6bZAl84aMA+/I+c7JZnu9g3VYzffk09r5fV37uLEOcCtvbhrt+vSi/F9xOyG7Q+SD+
	 MAxDxozY815K1sQ2bU1ZH1ZPxB3BkQAPAG9dCmR2vnXwAAaFlbmMnbJX95bXnkE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768918823;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=qt+S6uyW/K0pgpTSAzdgtw0W1RwId9+iIyB8zzdbrfI=;
	b=E6OPlXr1amIxx3qVVkbBP08WaN5hFEODpnAOBbzMqC1Vu+dUEEANwfcbA6tIdmr6BtCv
	 7l8xgL2EOZC9HTOFwTd8zMOkSrt8rzYmHBz1HUOhmBsI0NwkRGIX0ibA6EfBgSaK0uDmC
	 jikTzshw6vsRp4kiYowUmTXuBy0i9SjTBZfmUNK6wH1gdSubi0TmyfelYrXTBfdsBBM5v
	 2qxZJlNSh/dW6X5ZYE044VIbIEI7iKgArDZ6PogQ1rJ+p7EigfYycQQ3beYhTkdYohAZk
	 l1v1fKDQEeOStY9bwaA1QanOeOQe0E9YmBIZwsbhzOqbrAIio2d9cagYdF9WLiGWdaJF/
	 51pWLosHtsENxoDv1js03+lwmBrlL/PbNWTWWvWB3Fb5gy1S2v5YJ5vHn1aeLfctmeJW5
	 GiDPWHr3DTf+JyQK3dsG2hP9WT5vcp/Zkavw3tnWv0jE6AKkfBYyjXphoH50tV+/fy/F9
	 9Xz6QSS3FQru0mwOLCaOLhFMIOMXFGlgnC0TaeMr6XCJSdNZKEYxX0cuGfaGKXTbbr4BM
	 3V6CoLrhs2CtuREpfJ8pZqjiqKY5U0m7guZK83GsgGj5h8OD28y3lBRuOtLGJPCSECIKb
	 BV6vEpQXCnH2KmekJTRGdztjW4YzyEKdTC0iNg1trK25fGH5aXp6Xl6s6jYh0JE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 15:20:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>, Jbeulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
In-Reply-To: <DFTELY2QHKPN.P7317UWE8QZR@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
 <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
 <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
 <DFTE7R78R78U.2T09MMJU7F0CF@amd.com> <DFTELY2QHKPN.P7317UWE8QZR@amd.com>
Message-ID: <0a6eca6eb344e9829ed9e0b381f26e95@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo,xenproject.org:url,b.sc:url]
X-Rspamd-Queue-Id: F2182481AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 13:09, Alejandro Vallejo wrote:
> On Tue Jan 20, 2026 at 12:51 PM CET, Alejandro Vallejo wrote:
>> On Tue Jan 20, 2026 at 12:41 PM CET, Nicola Vetrini wrote:
>>> On 2026-01-20 12:27, Alejandro Vallejo wrote:
>>>> On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
>>>>> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>>>>>> It's clean.
>>>>>> 
>>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>>> ---
>>>>>>  docs/misra/exclude-list.json | 4 ----
>>>>>>  1 file changed, 4 deletions(-)
>>>>>> 
>>>>> 
>>>>> Hi. Do you have a link to a pipeline?
>>>> 
>>>> In the cover letter. I only run it on allcode.
>>>> 
>>> 
>>> I see. I can spot these additional violations from earlycpio.c. It 
>>> does
>>> not result in a failure, but only because x86_64-allcode has also 
>>> other
>>> non-clean guidelines and is thus allowed to fail. Ideally in some
>>> copious free time I'd send a patch to create a subset of clean
>>> guidelines for the *-allcode analysis that is failing, so that the
>>> "allow_fail: true" can be removed.
>>> 
>>> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html
>> 
>> The web interface doesn't allow to search?! Sigh... thanks for the 
>> pointer.
> 
> It's your usual mess of miscasting, enum-as-int, etc.
> 
> Would you rather keep the exclusion and deal with it later or let it 
> pile up?
> I just don't have the time to go into it myself.
> 

Well, including more stuff in the scan doesn't hurt and it's only a 
handful of reports that could be fixed, but the maintainers will have 
the final say. This file is not really inside my area as a reviewer, but 
if it helps:

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

