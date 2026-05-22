Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BhNMGCUEGpSZwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:37:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38C5B85D0
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 19:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317186.1586426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTo8-0007wm-PL; Fri, 22 May 2026 17:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317186.1586426; Fri, 22 May 2026 17:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQTo8-0007uB-JZ; Fri, 22 May 2026 17:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1317186;
 Fri, 22 May 2026 17:37:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQTo7-0007sm-9X
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:37:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQTo6-0033VM-Lb
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 19:37:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a109446-bab6-0a2a0a5309dd-0a2a450abc5a-0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:37:10 +0200
Received: from [209.85.208.172] (helo=mail-lj1-f172.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a109446-56b3-0a2a450a0019-d155d0aca581-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 19:37:10 +0200
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-392445f11c5so80296411fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 10:37:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779471430; cv=none;
        d=google.com; s=arc-20240605;
        b=c/ldT4wml59Cd/gJmYbcdT9apHRmLxmNdrGCZ4JPzp6UVfHRM0sOYD0IWVkdrjhYNR
         EhhT//5y2gpQ4SHUSmaLha0GTwNkCy/fO8hCBtcykkID7Vty93pXCf1L4ou8fTgT7odj
         lddF8wWob0NSAzmBXTR1guNxP7rK5YAVOj/oiV22ab7I/EPS0Eq7oopzYNL+wj2wJFZ3
         aYH2h2i+UoxIzOOXQILJPeJ/TevQe7AD9licxaMEKygLU9sEvS/NiXvPpzH+rc8XFjTd
         zXUJ8CXgHsvoe04tDGwaH8bf4eGTU6paB6xEP5oogwi1JUH/5FQ7hDUvmtoOF95OvBPV
         R+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EH6PVOFaeewIUJtcezD92lpwIOONoCbbNYsaM3c1dWk=;
        fh=074dSOZR2TjZuH9KX7pMcX1QOxphcb/LlKcediamujk=;
        b=bleB0azL1ce0KW8UDjCjkuNXxsyqyhMtw4K4d3rwtDWt6xLqrub+xTaSN/qD+chSbV
         ndF7pQ15wFr8r4poC6LvxPBwnTjk5vYZn9Cqk++097yv9/kW5dXz322XBKxUVieTd7o3
         n/NSkaaTfQJkNHwmJSM9q+05seoDtxlNzH9rgLXENUsQ6eadPQiV/q+VsLadBtJ2kg+a
         wTvNnPuK5moiKfdvC4y6rToocRByurPbhSE0UoU1hEG8ggtzR55A/ckkWyPDZc9CjDDn
         CV18w0qrUQFmCrT3lECSVykxd/J5Z8KomxABE3INYBzUWtoRMA4gQtxuzqQiHPoBc+ZH
         uwag==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779471430; x=1780076230; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EH6PVOFaeewIUJtcezD92lpwIOONoCbbNYsaM3c1dWk=;
        b=SHsJxDnLwtXDdHoWpEQF7cA2GK2hXYOqNvRfg+AwZHG4K17i+ELW7NLZVqmwnCQyQv
         zs70K1V+2NMMzoB7sVGdmRIVa62b/o7hMTlugTuccf3q4at7Fdit0VwAq9wSM/+mEnbp
         KvdMPj8bOMFcVDSNo5i+LoFdmuySuB1BqgElMD6t73dExVv7XX/UruU2WJnMhMCBIjOZ
         O1AGgpt/ffUlWgQ3UUgzVNn2cZzbgWtdrH4ePMhsYh8atwPvOAxPo1noYuLc7BzpRKAL
         CdSZpTCLteEitRnBIe09hEUqoIU02OQQUQnIT9QcuBshDUkwO8QS6BMhitHjyHtdX3bS
         XYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471430; x=1780076230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EH6PVOFaeewIUJtcezD92lpwIOONoCbbNYsaM3c1dWk=;
        b=F7X8/bU5aZ6AaENwDJpKYKDUJna8MnFi40/cZdRT5U90s5ULkQLJpgfyLTHd1VoXaH
         3GgErKY+/ASSa4lRfZPxi47Pj9uhnuULQ7wU4H8NCFu0nljC9icH/FR2rYZUSIfMOXPQ
         culq+PkQfIFGk3Xx2X4W6mZ70Ee8cu3ElUWUmzOsWV/tZKUvSxNEE1Ir5hielANhXNX+
         4T8GmqtdDXF4pfEOYNHaslQBv36bkKkspbp71OMrX9Zwq0O7vq+XjxjM8qnLKJt8yWb/
         Z46rgX6bWODtdPpn/gCTq9aQFQEl6/GynoUPPS620qc5iweR9qcxd4chrIwIZbpIplr0
         bN8w==
X-Gm-Message-State: AOJu0Yw/aJ5qISA9bExnlMnWX9CSr/BbVvBbOK102kxJZFAYTIB2Zs05
	q3A3Cn9HPE9W9u3ieA5izShThcojW/0XFPm1yMCxDkdX+Jna44v2a56PSgNNne1UR78IbCxr6tH
	8+4V1PM3/0Qs5sf2xCi1tuEdFckPgIho=
X-Gm-Gg: Acq92OEGJefSt6cxfc884AfVcVqfYN2Jzx6+HFmnKOVZBObHH1+WRsGmmYbou+rk4Lc
	R0fCBi5P67RA9W1E6xTMR+rW3qKwyMBPi3/5WeDiMiII2uGhdsZwAx6WI1XucBRPw2tmc82Twpx
	KIaEBpFRNPKyrmwISMC9cv1/XDqFRWE9lom0ozjw7SlfaFIJXflULiTLZTQ9r48BbpdhP+BY6Qa
	B1GurkLZiuphgaiESFGqe6cBqvv86K2ZJmTP5V5s7GOFpdEwMEgkAidT4ks5n4RZPNUEmjjXbQc
	ogu+
X-Received: by 2002:a05:651c:1606:b0:393:d582:b62a with SMTP id
 38308e7fff4ca-395ca18cb1fmr30060171fa.5.1779471429776; Fri, 22 May 2026
 10:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260522165238.844649-1-dmukhin@ford.com> <20260522165238.844649-2-dmukhin@ford.com>
In-Reply-To: <20260522165238.844649-2-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 22 May 2026 20:36:58 +0300
X-Gm-Features: AVHnY4I98UlnjtuyWib8rAZ7GCDQN1axv_MUpaY87z1V9yZj4pMHj-T2JCI1SGk
Message-ID: <CAGeoDV9Q=+qujawck1CBtvAgT7hNxFgy2uLdVyJXrCwNEAsD8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] argo: lower level of noisy connection-refused log
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1779471430-7D1848B7-62FD9FA7/0/0
X-purgate-type: clean
X-purgate-size: 2111
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2E38C5B85D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Denis,

Just one follow-up after sending my Reviewed-by.

The patches look fine to me and my tag still stands, but there are a
couple of side effects worth considering here.

On Fri, May 22, 2026 at 7:53=E2=80=AFPM <dmukhin@ford.com> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Lower the log level of the "connection refused" log line, as it can
> spam the logs when a dom0 service using the Argo hypercall tries to
> communicate with a domain that is still starting up.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - dropped duplicate "argo: " prefix
> ---
>  xen/common/argo.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 28626e00a8cb..98a3db7fd070 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_a=
ddr,
>                                          src_id.domain_id);
>      if ( !ring_info )
>      {
> -        gprintk(XENLOG_ERR,
> -                "argo: vm%u connection refused, src (vm%u:%x) dst (vm%u:=
%x)\n",
> -                current->domain->domain_id, src_id.domain_id, src_id.apo=
rt,
> -                dst_addr->domain_id, dst_addr->aport);
> +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst (vm%u:%=
x)\n",

First, switching from gprintk() to argo_dprintk() means the message will
no longer include the "%pv" context printed by gprintk(), i.e. the
current vCPU/domain context. If that context is still useful for this
message, it may need to be added explicitly.

Second, this also changes when the message is printed. gprintk() is a
regular printk() wrapper with a guest prefix and the requested log level,
while argo_dprintk() is compiled as a no-op unless ARGO_DEBUG is enabled.
So the change is not only lowering the log level from error to debug, but
also making the message depend on ARGO_DEBUG.

This may be intended, but in that case it might be worth mentioning this
in the commit message.

~Mykola

