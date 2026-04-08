Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOXiGCgs1mkUBggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:21:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ADE3BA736
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275628.1561395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQ21-0001Gj-OS; Wed, 08 Apr 2026 10:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275628.1561395; Wed, 08 Apr 2026 10:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQ21-0001FH-Lg; Wed, 08 Apr 2026 10:21:09 +0000
Received: by outflank-mailman (input) for mailman id 1275628;
 Wed, 08 Apr 2026 10:21:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wAQ20-0001FB-WC
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:21:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQ20-008Eim-8J
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:21:08 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69d62bf9-5cb7-0a2a0a5109dd-0a2a4506d04a-40
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:21:08 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 69d62c14-0df0-0a2a45060019-a237832fe162-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:21:08 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9F56D4EE0750;
 Wed,  8 Apr 2026 12:21:07 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1775643668;
	b=DJTyujdeAsNX+NGzb6I5ZMeILL/I8afTuz1OuchBcQiPlahKwVEiAU3ic3Bj+02Iw8xv
	 oh8DOYcynQ3PuRPAZFpW8XEqGf3KBiXjxnf4T3fB6/MM0dDtvn3x3YenFMD18D2Zesv/r
	 Yev2gtcaAF3cdluZacrblP7cI4xXFZD5MYK7VMLicg1Ke6A/JM6mRNInnbF3RnVEN22xe
	 riO+W4IpNaLajo54fzLkoK+vhPUJzSnWAA8j6ZsBWuFZpQRDYmHrdLKL72LTIsDqzYdq/
	 619PfjjxWJwdRBa/SMKnsedbLiIo+HpZ9BERuQXDT0gcXGlAXBrEYfoeOZH8EmJqXhsxW
	 ucZgAaawsqHTt5PKIZQnle5gbc5oGBbizo1rNaz+6h78Elirty5KKcIO0RUuSxuN5bmq8
	 M8i+rSqDLXyaDHBI4OsaA1vs8VzRrFWR4EcKnOeVkrtwP48Fu56MfLtAlrySc2gqb9gVV
	 QEquF6MmwnHaSPbOSKq6ZQP/2+Y17G7VO343Gv6NmKozp2JllBEyp43+LvPPtCxpbryDm
	 r7xUK0lJ36YZQrwKuYmNxKSdOfEVyFjPKBk0Dm92jcM/xGjFNwafeKDg6YokVYYkHYUmU
	 Ue2QUs9Z7GCMYSUJu/k2tEEV7pK4zAHQVpP7P69YGcrvBsmDYk7RocyD2jBEHfA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1775643668;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=4FUg+w0vR/wmXVAH7tfUoQGtkITJK7oPT0+fyci1VLA=;
	b=bAppOejTj7EXSCVypa4PQ7y9cPNoOGZvLyI6l6Z5Ns3pTzAtLt0Ts2VACyc0R+mgU7QY
	 ia0I3a1rDGOdI/lXbOhd1P3uLT8E/nycUBWiBld/J4LpWCeAMQPbYeZ7ZJ363sTyN2OsV
	 wf/KOIkLIOc7G2kuy/ZyCL7xkiEnMTTpL28wBruImux76zoEgkqA2K+S5AX8qUYJ1Rc32
	 Yf91Q6VKXeFy4+ymg7D7MCMaH72bveI4R1foM8RmG4yRzqAKZrPF8m0vSScvnN0c1T6vt
	 YAiiMnzJwcD0Q5YcSyHlaKVrvm1dRUN/TpjdfrRxCBQ3Nlwyzvo1GAlm1TSS5BThttc+i
	 dsoH0lPPshhTx9Sp0t1PJCCXdHr2xqtNAyxpJGU75Jis4sJGBbX0qk5JuySaN0bZR9/Oh
	 kq++vXVTGEBMyrfMrequDuKFY1m1Mith7DfQycvgI54tU00LuqDfsSKZVOW2Qg2GuDjZq
	 ZvHB8FH9XzYwOnYCaYBfz4+18d6y9RjPFHpOuDKio9HhieroNx//ptxE6uiiQIGZAT2Ht
	 jiqHLdT83HTMl/S/ysdUYrIK/R5yt0df4vBhUAuqK39YWh0T1oxWGIphWPbkg0d8M/lfU
	 RSLsWgmJOcIlNl8w0tpFIRedf9ysBOC5rl1YM0YZZNr4j/LkVsKAExT4OSyGQ3Q=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 12:21:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/2] Final series to make Arm MISRA allcode green
In-Reply-To: <14185c87-84c0-4019-a3f6-50587b941350@citrix.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
 <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
 <bdb8e991bbd200de2f0af5991304dffb@bugseng.com>
 <14185c87-84c0-4019-a3f6-50587b941350@citrix.com>
Message-ID: <7fbcb3d1ccdcf6fabb45f5805b504096@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775643668-5C9223D8-D77379F1/0/0
X-purgate-type: clean
X-purgate-size: 1751
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.123];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,bugseng.com:mid,bugseng.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 11ADE3BA736
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-08 11:51, Andrew Cooper wrote:
> On 08/04/2026 10:46 am, Nicola Vetrini wrote:
>> On 2026-04-08 11:22, Andrew Cooper wrote:
>>> On 07/04/2026 11:34 am, Michal Orzel wrote:
>>>> No more regressions for clean guidelines:
>>>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072
>>>> 
>>>> Michal Orzel (2):
>>>>   iommu/arm: smmu: Fix variable shadowing
>>>>   iommu/arm: ipmmu-vmsa: Fix variable shadowing
>>>> 
>>>>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>>>>  xen/drivers/passthrough/arm/smmu.c       | 7 +++----
>>>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>> 
>>> If all the violations are fixed, should this test be made blocking?
>>> 
>>> ~Andrew
>> 
>> Only if they are also clean on x86; otherwise an arm-specific list of
>> clean rules should be made (probably better). @Michal what do you 
>> prefer?
>> 
> 
> All I'm suggesting is this:
> 
> xen.git/xen$ git diff
> diff --git a/automation/gitlab-ci/analyze.yaml 
> b/automation/gitlab-ci/analyze.yaml
> index 4e9af9d60224..f01798c5dee6 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -149,7 +149,7 @@ eclair-ARM64-allcode:
>        CONFIG_STACK_PROTECTOR=y
>        CONFIG_UNSUPPORTED=y
>        CONFIG_VM_EVENT=y
> -  allow_failure: true
> +  allow_failure: false
>  
>  eclair-ARM64-testing:
>    extends: eclair-ARM64-allcode
> 
> 
> so regressions become blocking.
> 
> ~Andrew

Ah, yes, indeed. I didn't look at the patches but given the diff it 
makes sense

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

