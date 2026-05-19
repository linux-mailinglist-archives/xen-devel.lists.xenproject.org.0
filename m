Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDRtLwFFDGqLcgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:09:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3D57D3C1
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312786.1582884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIKM-0000OB-LI; Tue, 19 May 2026 11:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312786.1582884; Tue, 19 May 2026 11:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIKM-0000Ln-IA; Tue, 19 May 2026 11:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1312786;
 Tue, 19 May 2026 11:09:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wPIKK-0000Lh-Ri
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIKK-0098AI-3g
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:09:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0c44eb-bab6-0a2a0a5309dd-0a2a45019ae0-2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:09:32 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0c44eb-c1f2-0a2a45010019-a237832f8384-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:09:31 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B06084EE3CB1;
 Tue, 19 May 2026 13:09:31 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779188971;
	b=06S3+tc0mbeQVpuns0w1x9Vf1eDx13KgntpG0RTrUB3d9Hji28ggfED6Q0TFi4gYrNGp
	 mOjm2mgoyUzd5Lrvc1kv7bSx8KDw+xyESuDP520+b4i2WMY4gY/hRHg3jQsUilVfTl5rl
	 L4KPgeEYT95yeF0rjTEPvUhl5RlvgreBsR9fQJFlguGpgV80oUN6Oj9hru07uw3kbXDH2
	 iaooUuha/3M1mBQZb2eky9mrgLMdmFgk4dRdaV/MSQBPchMmlZSmNQfvH/u9pZMpFnPMw
	 VR+6a25hNnG9vHLZLHhI+8HdrCziDs3xz/8PZ7pKoDXemepEsiAtzNPW+ESarWa2xdj7F
	 YpF5+W/SEt7p0bu7DKJxtgRRPcQKiwI+kaYhgibfGSpZC3izWasajZs8/j/pX0cEz+P6A
	 inV4ytMa/LmOWiA4yGtyhNN/gjasAni1Ieh/uet5n1+QFVLHCGHQ/hSDuMRxQB+uEhOry
	 CYmOH61WsQKcVfuQs/fw0otmFAHVxR5SHpl8U414VJzsG/4pwV8pGExrmQhiqOvXlefYL
	 V14bKHcbY86vI/BzAcv++QTi7w0wLsw7D7DYcR3Ndn68ZqJAIUID19alO+orZG8CZtqLl
	 3qmjdYL9PLxPuaR3zpbptcrS8Qsoqo2jDlbWjEFHbgpsu6sZ7D/02y3Lcpot+wc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779188971;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ARXqPp9NirDiaMmgJPdBfuv/CUClwWWJ8uBW5c1zmZc=;
	b=5Kl9TY0jMe9k5pBLZuOnV/LNteUKg4L15zb4H+06xy0i6To5AjixPOJsHcH6hg0JePBU
	 /t/ThLcTWwraOaq+0VYdYIDA6cNEbkBESk0ElnOnLFwZYICHvLNI+kn4cv5+7cftlCXK3
	 taswyvhO5cSKQerOBVjL07yRimY6LGuUSiniGEfjwQASCpSsPqy9kNjLnoQqHIljyucOC
	 CA0W2KYj7KNO6s5LmFDEiTJrElxDaRXTVw72suBV6qgdSYnBt9+ccg6rzClizIvkFyg2K
	 /YyqgakPyp/T55k+Wq3Cp7dqVuFMGg3If2xl6UqeAMUgIa3b0iSvRG43v2THTCYS1ePhi
	 34/u4lbhMkP+qOlKbCDN2uc6/6j2vSJq2tIO7P/XqLq8oiaofa4RNsMPoLGbNR+C16r4p
	 i1HPU6dIX0dmX6+eYEqVeu25TNWhAxScdbe7DrgYd0u0k80SLJnXaG0C55QTe74xWsWG0
	 H/b8WU2YbY6k9aHP6WV5QxgE4osiHvqgOvNTQBqHaVY/ry49SWwkKlRnmyWaiqng9kkWE
	 x6EDrI8PqRT3qqYsJMpwSAmhqmWBhGq9D2aF3kaKwcb5baIPQ+uPDutTpl20eGFAEiSvL
	 PKHKSGFRyZxkTuZYJRYu7xPaJO/0Zs/g4mlTGXXk/kaE52Eif2kwmSN29aUckYg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 19 May 2026 13:09:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/eclair: export XEN_TARGET_ARCH during
 assignment
In-Reply-To: <50f31733-3048-4512-af12-50dd9ba3cf8c@epam.com>
References: <8b3120f7302e591b2828cb77c5f903c84149d498.1779186401.git.dmytro_prokopchuk1@epam.com>
 <0700a54389d4071c7308b8eb3a52c9ab@bugseng.com>
 <50f31733-3048-4512-af12-50dd9ba3cf8c@epam.com>
Message-ID: <40a468313da350be8b60df32a7c58083@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779188972-B474CFF4-FD1ED1B9/0/0
X-purgate-type: clean
X-purgate-size: 2002
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b.sc:url,bugseng.com:url,bugseng.com:mid,epam.com:email,linkedin.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6FC3D57D3C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-19 13:03, Dmytro Prokopchuk1 wrote:
> Hello Nicola,
> 
> On 5/19/26 13:45, Nicola Vetrini wrote:
>> On 2026-05-19 12:27, Dmytro Prokopchuk1 wrote:
>>> Move XEN_TARGET_ARCH export into the architecture selection
>>> branches instead of exporting the variable before assignment.
>>> This ensures the selected architecture value is correctly
>>> propagated.
>>> 
>> 
>> Did you see a case where this is not correctly propagated? As far as I
> I didn't see a case.
>> understand, the value of XEN_TARGET_ARCH seen by subprocesses is the
>> last value set for the variable, regardless of where the export 
>> command
>> is placed.
> Yes, you are right. It works in that way.
> IMO, exporting empty variable looks strange...
> 
> Anyway up to you to judge if this patch is needed or not.
> 

Indeed it is a bit strange. To avoid this we should perhaps move the 
export after the if, so that it is obvious that it contains the correct 
value

> BR, Dmytro.
>>> No functional changes.
>>> 
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> ---
>>>  automation/eclair_analysis/prepare.sh | 6 ++----
>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>> 
>>> diff --git a/automation/eclair_analysis/prepare.sh b/automation/
>>> eclair_analysis/prepare.sh
>>> index e941e6edc4..fde83c2d2d 100755
>>> --- a/automation/eclair_analysis/prepare.sh
>>> +++ b/automation/eclair_analysis/prepare.sh
>>> @@ -22,12 +22,10 @@ if [ $# -ne 1 ]; then
>>>    exit 1
>>>  fi
>>> 
>>> -export XEN_TARGET_ARCH
>>> -
>>>  if [ "$1" = "X86_64" ]; then
>>> -  XEN_TARGET_ARCH=x86_64
>>> +  export XEN_TARGET_ARCH=x86_64
>>>  elif [ "$1" = "ARM64" ]; then
>>> -  XEN_TARGET_ARCH=arm64
>>> +  export XEN_TARGET_ARCH=arm64
>>>  else
>>>    fatal "Unknown configuration: $1"
>>>  fi
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

