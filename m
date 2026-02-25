Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJYuDZ7snmk/XwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 13:35:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41A219771C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 13:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240702.1541987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvE6q-0003A9-0Z; Wed, 25 Feb 2026 12:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240702.1541987; Wed, 25 Feb 2026 12:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvE6p-00038N-TP; Wed, 25 Feb 2026 12:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1240702;
 Wed, 25 Feb 2026 12:35:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5m4=A5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vvE6o-00038H-Sr
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 12:35:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67f385fe-1246-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 13:35:03 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 072494EE781C;
 Wed, 25 Feb 2026 13:35:02 +0100 (CET)
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
X-Inumbo-ID: 67f385fe-1246-11f1-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1772022902;
	b=z78SpsQta1Q96z6M+sWz48bqMi6Zik8KG8fXOUE1uE7L5c0YBlwdlyb+B2epNwPY4EZn
	 R7vak7FVR1YUYo8W/3yloDkR8CZQNWxS0XDgQP2KCjZbui1v7Gbja7nAgUAehsq89S//F
	 0QiQsjLTRSMEUX+WsH1x3CGRVVs6bFkjFOZbCQSfUh20kGzVTY0mn3jHRCnxJkq30uEXM
	 VO/auXcE4YckwosD22vDRUBuQrqepzwFmWzVoebNytjrDKRJkAklA1Jqxfp34MIQJ+dvw
	 3/jGRD9BcnqalQ2O2RxyXHnLwXDu4iBw9QQelGNXiHByYr5WU7LSi2h3HK6ylh1ABIjFJ
	 +qWy/aLRJY2B/VNq2Ue9mg6fN6dJo5ax75AZb1niNpPSFzC3P0IFbZJqM/QZavoCxj5cv
	 VWJpBB27WICgXCs5mKkc/wDRZaVC30YaYeCaFPTxBCJvrC+xe0ZrfEnYUINe7KriR+hQa
	 ZiC7CVBOghX3YEbHpWFYxCOAxcxMVV3JOeTWermAWGGHFcZ00UYJeHNwKVESNUu5wy7FI
	 i7AIKhRsFmPTpVqEBG5r4S2dmDnnVYDZ/PBwcocMQEbOJNuhR/sTed9GRRiDy77T7qIBv
	 j24fTY72RBF0bYwZUn9iKB0bNUtdtW+iQYC1hGWp/uinTPQbdDu4FTuJKua7gAM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1772022902;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=znqnJrtIOyr/QtKkKeAfBwT9ebqzScXUuCOsjJDtjg4=;
	b=IQJ/B/1KjusLYznG8b8HBfIf38+8fGNX/B7nPL/FSJzcTWKYy7QNuuyh3y93ixzVncz/
	 E0iDD768t9zFj1Ica4/dFKzmjs1ENh0sIB1w6mRKmcblFfzN3S9MEcgqP8KYVb8Eiq7HE
	 1UMI/oO6l4+hKQEhhxDhRITuGKPiMmNix3dPR30X6IoMd8QOtsOiWj+QqIxVQO4fPKr/8
	 I9NK7g0+9indW3ADpVEqsS/FnOmZmHXh7VszrlQRFjk0xLnquVQxui3f4LELI+JjqiGvM
	 Onl/BQpWJr2yQki4txR1CoIFpx8WWnfOO7trfX1+XpK9L8BLyuHtz7ZPboP3YmcQRmWvM
	 Edij146cxiC8KFOyRpiK83WHMcCiVN+b9OeKAt2etEHISdaO1KYNOw9zpBFfsXRocSTO2
	 /FkpxbcRkJwq/Gb4lBmgcVOhiN7ZtNWRV8jXNvfuvPaQcl8FBEmWcmeJF2aXUJwVlAJiN
	 LM2W9S5aw8Mz5h0QXJYIMVv+grtZgIcaGiVz3Qsx0MUb8eQhl7bpsSp2mJp7eIOcvp1Ow
	 W9Kv2AMOW9XhzuaCK8vqbr2wj2sVkSXsZY8JmNideqFsFv44iYvZP9VC5tmJKIhb2c5TQ
	 OJ7PB6ZAXDBTjPIcN0pvUaSjEcuCBHuQieKrc2ginxBxpLuEDDT4HA9wKzmwvXw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 13:35:01 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 09/12] x86/shadow: Rework write_atomic() call in
 shadow_write_entries()
In-Reply-To: <278f711d-7c61-4a47-868e-ab05b9426e40@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-10-andrew.cooper3@citrix.com>
 <0148ea9f-6486-44a1-b4dd-47af7c978351@bugseng.com>
 <278f711d-7c61-4a47-868e-ab05b9426e40@citrix.com>
Message-ID: <678f1a67603d4b37d717dc84565db044@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roberto.bagnara@bugseng.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b.sc:url,linkedin.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,bugseng.com:url,bugseng.com:mid]
X-Rspamd-Queue-Id: D41A219771C
X-Rspamd-Action: no action

On 2026-02-25 13:14, Andrew Cooper wrote:
> On 23/02/2026 7:26 am, Roberto Bagnara wrote:
>> On 20/02/26 22:46, Andrew Cooper wrote:
>>> Eclair complains of a side effect in a sizeof() expression (R13.6).
>> 
>> I disagree with comments of the form "Eclair complains"
> 
> We use the same phrasing with other tools too, but I can change it to
> "reports" which I suppose is a more neutral term.
> 
>> 
>> Note that in recent versions of MISRA C that rule is no longer
>> mandatory.  More generally, note also that, IMHO, switching to
>> a more modern version of MISRA C would simplify compliance.
> 
> Ok.  Making things simpler for compliance sounds like a good thing. 
> What would this entail?
> 
> Presumably we've got to adapt to all changes in this newer revision of
> MISRA C.
> 
> ~Andrew

Most likely new violations on new non-clean guidelines, generally rules 
for features that were standardized in C11/C18 and were previously 
widely available extensions (e.g. _Noreturn, _Alignof, threads, ...), 
alongside some minor changes in existing ones, such as the 
classification change mentioned by Roberto. The exact impact depends on 
the target MISRA revision, however. Making an experiment should be only 
a matter of s/MC3A2/MC4/ (or whichever MISRA revision is chosen: MC4 in 
ECLAIR refers to the latest published MISRA revision, that is, MISRA 
C:2025. Perhaps also a few regressions (as in newly introduced 
violations) on clean ones, but I do not expect the results to be 
radically different.

Side note here: are the efforts to make Xen compile with -stc=c11/gnu11 
still ongoing? I say this because any MISRA revision other than the one 
currently used by Xen by default is based on C11, as it introduces 
guidelines for C11/C18 features. Not that this would matter a whole lot 
for Xen, but it is something to consider in the broader picture.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

