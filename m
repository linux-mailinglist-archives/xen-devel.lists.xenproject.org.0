Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKi/DIyrBWrtZQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 13:01:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94E540B97
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 13:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308804.1580147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNToN-0004Ve-5n; Thu, 14 May 2026 11:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308804.1580147; Thu, 14 May 2026 11:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNToN-0004TQ-2j; Thu, 14 May 2026 11:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1308804;
 Thu, 14 May 2026 11:01:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNToL-0004TK-Ov
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 11:01:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNToJ-00EpDi-KA
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 13:01:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a05ab69-bab6-0a2a0a5309dd-0a2a4503d834-6
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 13:01:00 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a05ab6c-672d-0a2a45030019-a237832faf26-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 13:01:00 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 58F8D4EE3CE8;
 Thu, 14 May 2026 13:01:00 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778756460;
	b=H4x0u1M9tDXeYElNzOQZMagbtThZjRMQhg7WNxksOsvzSDNt1puMzAO5j8eKp583raYW
	 3/d8Fxy65ZnA57zNvmhx8mLqKxo5ELNSISKPvHE/SJp3E0nXU3HdcZ5h0JSTT/sq3rJSt
	 sIeiGpKmG8vtpjHHSS3Yed8vyLf1cWmqbqRcz3YtVcKgieLa99b1n++IKHe92pPWik+uZ
	 tSYli/zZ0TrCWMGf8GLwyvmYq8wlyBFdCX1M02Ao1cIT9o16VW9eCOmRMA8eemboy7u88
	 jzDJrjrnSRRTv6l2T+gzpWOnwYUHC8jFfivWJfdmnws3zbfc/eEFtpny3vh/QaYJ6gsOU
	 Q5nSkE/FdBcNJLhRxOq4sXYwx8unlHtQhkwARJzeiQuPCkA5V1IxBVQv9xsocizO32E/q
	 sN3IJDomX1ckhQqUzu+N7FMkO9YOPTh4IW0q6tSNV2wffLcAurf+eZM3MCxPnXzusr9t6
	 incGSYogPbJsCYHL54m7moL1FZ/51VxTf82L/f39/pazX9unyBVhe/MZh5ryit9T/+EEm
	 /sAGV9I4RU5y6N+lsyWjuCPkj78wXQYSoX8XirkhuoE9bEhmpJ0DxoCPl++GHRdkZmfqv
	 CDhc8s+3KglE/hsxaHQdKYHs7rR1iBQkmwKfWxIy+97Pds4iqwjl4wzDof+UPZ8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778756460;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=tfMIkDemM21Bsz0R+H4Mx1AnYK7jBKKPtAey5obr0c0=;
	b=ZbfG55/QOjCronYXqzW5IOrhx3iNhBHnYZHJYDWGZmoRycmN1VX+0AeGlSwahb5kDE1Z
	 jqnQAjdNvQ9o7eevCNIv0rp/5goNoS/pgsNW7Rez1QiwWLC8w8wTVmBWQlHOaFfGLd2OQ
	 cIdVSorXwZoD3xjkRvS/x1NLM7wFZXNkGcjTeILnOI6q9uZBwY0ddvYDeW1cUdairA63y
	 oCaxCIG8O561GT4gdoAoj4Yw+a01h9pyUBE8nKy+Vpw/6kkhV/rf9jU9Ns1BMn9Y/c3rC
	 KMIy9wY7M5/5ppEqv87nP6IsRyLnjwNRD1qln9maNvVwKjgJGEiuUIPpyUMGynCO+T/fE
	 ZLl5QQZm/VHVOqXGtQ1WKppBdPVpa+XOa2vdz5oeJO+fpjvwyn/cNYXKva9fjkewpkhPN
	 QXeE2+zu+sS4KurHyOnJVy2hR50ewQMQ1qA/gjvpeFkCfYnBINm88hbify5NaAJ2w31zh
	 aaqpJiA5KEs+pXzgjB9QsxZ6eMRqZ10YqhIG5Z0AXxO4qRzJU4JIq20JoVFSB3u3RkQBZ
	 xU7PARbH5XVfHQcA6P7M64SHSYLugee8hHa5GRSepfxA5OE8Oytw59k0m9VSu0TML5+dH
	 4bgOQk16tryq2XGKwiogKFy43s3O1UXtZS2vNWQyGxJEkOMpLgZTc95zMJzJU5c=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 14 May 2026 13:01:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@gmail.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] ci: ECLAIR: avoid intercepting intermediate linking steps
In-Reply-To: <fbd3768e-1245-409b-b1d4-b27978367a7e@citrix.com>
References: <edd4d992a269dc45b4a41f1c8277ff0d04995dc6.1778753597.git.nicola.vetrini@bugseng.com>
 <fbd3768e-1245-409b-b1d4-b27978367a7e@citrix.com>
Message-ID: <bbe533dcaee879df50bdf00cefde87cf@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778756460-38776938-885D0E8C/0/0
X-purgate-type: clean
X-purgate-size: 2289
X-Rspamd-Queue-Id: AF94E540B97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,bugseng.com,cardoe.com,kernel.org,suse.com];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:nicola.vetrini@gmail.com,m:xen-devel@lists.xenproject.org,m:consulting@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:nicolavetrini@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,suse.com:email,bugseng.com:email,bugseng.com:mid,bugseng.com:url,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

On 2026-05-14 12:38, Andrew Cooper wrote:
> On 14/05/2026 11:16 am, Nicola Vetrini wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> These do not add any value to the analysis other than duplicating some 
>> reports
>> in whole-program analysis, as the intermediate linking steps are only 
>> used to
>> build the symbol table.
>> 
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Pipeline: 
>> https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2524548198
>> 
>> A significant reduction in wallclock time can be seen for both arm64 
>> and x86_64 jobs,
>> with no impact on correctness as far as I'm aware.
> 
> Yes, a very nice improvement.  I suspect this wants backporting to
> stable trees too?
> 

Perhaps. Is the rate of analysis significant there?

>> ---
>>  automation/eclair_analysis/ECLAIR/analysis.ecl | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl 
>> b/automation/eclair_analysis/ECLAIR/analysis.ecl
>> index 399099938f..ec37f7eff5 100644
>> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
>> @@ -34,6 +34,13 @@ their Standard Library equivalents."
>> 
>>  -doc_end
>> 
>> +-doc_begin="Do not analyze intermediate linking artifacts, as they do 
>> not differ from their final
>> +counterparts for the purposes of MISRA C static analysis."
>> +-file_tag+={xen_efi, "^xen/\\.xen\\.efi\\..*$"}
>> +-file_tag+={xen_syms, "^xen/\\.xen-syms\\.[0-9]+$"}
>> +-frames+={hide, "kind(program)&&target(xen_syms||xen_efi)"}
>> +-doc_end
> 
> Why the difference in suffix in the regex?  Slightly rhetorical because
> it's the full link address so includes an x for 0x.
> 
> But, the two regexs for suffixes really ought to be the same, so I
> suppose we should exclude .* for xen_syms too?
> 

Fine with me.

> For the sake of clarity, do the names xen_efi and xen_syms want a _tmp
> or _intermediate suffix, just to make things a bit clearer?
> 

Ack

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

