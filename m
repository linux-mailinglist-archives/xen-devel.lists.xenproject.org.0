Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qITvLldf/mmppwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 00:10:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB74FC2F2
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 00:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304337.1577410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLTOT-0007Pl-V8; Fri, 08 May 2026 22:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304337.1577410; Fri, 08 May 2026 22:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLTOT-0007Mj-RF; Fri, 08 May 2026 22:10:01 +0000
Received: by outflank-mailman (input) for mailman id 1304337;
 Fri, 08 May 2026 22:10:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wLTOS-0007Ec-K9
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:10:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLTOS-008ItA-0y
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 00:10:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fe5f34-2eae-0a2a0a5409dd-0a2a450c9ac2-4
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:09:59 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fe5f36-62f1-0a2a450c0019-ac6904feecee-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 00:09:59 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 28D5860181;
 Fri,  8 May 2026 22:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB865C2BCB0;
 Fri,  8 May 2026 22:09:57 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778278197;
	bh=kHdcgmqC5b2xNkh8ZM37T9xVRgnh1ZpkO/c85/rTw8M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VmUyuDEXWQ96wivWfgCTxptNpYwWfn2fwr4uIPSEVD/0d85lkXdPwjm7+fRmJNfvK
	 FIV0WVKd9onTZkRzLq7Upf4sb1Y3pSaK6MR0QS6AC6NnnPyHVgl6CNKH67M+LTlTS4
	 Il7IeQ5Xbf/2w75qiERGZ+Ba0MjmwnLyf1P1TU+ZTlZnCC7gtLsAIFiYqAvjxlarK7
	 SaywCoc3aCzcIZHAUOOlm+Lxc6a1RhGO1/TZ8X0Q91d20RxVCAy5UyPa53KduCrUfx
	 xc+csJVJIeplKjmEzdfJhqycu/6pKAufjVVj9I4xyOxnrZ+rtduhh05s8GL2jTjCmt
	 HAyjR9zYAtWzw==
Date: Fri, 8 May 2026 15:09:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: collect certain intermediate files as artifacts
In-Reply-To: <84e74842-9a2e-42ce-9ec9-2892156353b1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605081508520.1779943@ubuntu-linux-20-04-desktop>
References: <6d9345e7-7ad9-48f4-8447-3a955305430a@suse.com> <alpine.DEB.2.22.394.2605061748080.1744448@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2605061753050.1744448@ubuntu-linux-20-04-desktop> <540ef3bd-6fc6-4cf1-a1fe-3def9cfcc114@suse.com>
 <alpine.DEB.2.22.394.2605071441490.1779943@ubuntu-linux-20-04-desktop> <84e74842-9a2e-42ce-9ec9-2892156353b1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1778278199-E0D63CF5-3DBB9276/0/0
X-purgate-type: clean
X-purgate-size: 3694
X-Rspamd-Queue-Id: 26AB74FC2F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, 8 May 2026, Jan Beulich wrote:
> On 07.05.2026 23:44, Stefano Stabellini wrote:
> > On Thu, 7 May 2026, Jan Beulich wrote:
> >> On 07.05.2026 02:54, Stefano Stabellini wrote:
> >>> On Wed, 6 May 2026, Stefano Stabellini wrote:
> >>>> On Wed, 6 May 2026, Jan Beulich wrote:
> >>>>> When one of the linking passes fails, additional intermediate files are
> >>>>> still in place. Having them available for analysis of the underlying
> >>>>> problem can be pretty helpful. Collect some into a new intermediates/
> >>>>> directory. (Nothing new will be collected if linking succeeds.)
> >>>>>
> >>>>> While there also make sure xen-syms is collected (into binaries/). This
> >>>>> is rather more useful for analysis of possible problems than its stripped
> >>>>> counterpart.
> >>>>>
> >>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>> ---
> >>>>> As the issue this is meant to help with didn't re-occur with this in
> >>>>> place, the new logic wasn't really tested yet.
> >>>>
> >>>> It looks OK but please provide a link to a successful pipeline
> >>
> >> Well, I had it in use in
> >> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2503967215
> >> but does that count, when the issue the change is for didn't really occur?
> >> For now I can't test the additions without having a way to trigger that
> >> symbol table issue (or any other problem at one of the linking stages).
> >> Short of artificially breaking things, that is.
> > 
> > Please break it on purpose. Just push to a temporary branch.
> > 
> > 
> >>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> Thanks, but the above wants clarifying first, and the below suggests you
> >> actually meant to take back the R-b.
> >>
> >>> Actually, I see that the build script is run with bash -ex so I wonder
> >>> if collect_xen_artefacts would even run if make fails. I think we need: 
> >>>
> >>> trap collect_xen_artefacts EXIT
> >>
> >> I don't feel comfortable making such a change. Furthermore it's unrelated,
> >> as it would mean that on other build failures successfully created final
> >> binaries wouldn't be collected either (after all on x86 it may be only one
> >> of the two links that failed). Plus then it would likely want doing
> >> differently, by making the EXIT hook invoke a new
> >> collect_xen_intermediates(), leaving collect_xen_artefacts() unaltered
> >> (except for the xen-syms addition there)?
> > 
> > "trap collect_xen_artefacts EXIT" was just a quick suggestion to explain
> > the type of change that would be needed to make this work, because as I
> > understand it, it does not work now.
> > 
> > From your comment I don't understand if you think that the patch as is
> > would work as intended or you agree with my comment that it would not
> > work.
> 
> Given the -e passed to bash, I don't expect it to work as is. However, I
> question this behavior. Exiting on error may be okay for any of the
> preparatory commands, but exiting on failure of make feels dubious [1].
> Hence I'm unsure which way to deal with that aspect (i.e. I'd prefer to
> latch the main make's status, collect artifacts, and then exit the
> script with make's status).

I am OK with your preference.


> Somewhat related: Why is it that collect_xen_artefacts is invoked three
> times, rather than just once at the very bottom of the script? At which
> point it wouldn't even need to be a function.

There doesn't seem to be a good reason



> Jan
> 
> [1] E.g. a failed tools build may also be easier to analyze if the
> already built components (libraries in particular) were collected.
> 

