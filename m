Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iv7sNuji+2ncHAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 02:55:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5184E1C91
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 02:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302123.1576145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKn0s-0007pl-A6; Thu, 07 May 2026 00:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302123.1576145; Thu, 07 May 2026 00:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKn0s-0007my-7F; Thu, 07 May 2026 00:54:50 +0000
Received: by outflank-mailman (input) for mailman id 1302123;
 Thu, 07 May 2026 00:54:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wKn0r-0007mp-7v
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 00:54:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKn0q-0007Jm-5b
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 02:54:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fbe21c-5cb7-0a2a0a5109dd-0a2a4503b7a2-38
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 02:54:48 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fbe2d7-672d-0a2a45030019-ac6904fed348-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 02:54:48 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B19356015B;
 Thu,  7 May 2026 00:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472D7C2BCB0;
 Thu,  7 May 2026 00:54:46 +0000 (UTC)
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
	s=k20201202; t=1778115286;
	bh=Ek9bTwceeuiXv/WjhJvVjjRg1bG1EaP6Qb0v8Nf8Pyk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J3aCLhxPyF3J2dzgx6oGACMc+1Fwtxm+TPhkmZic7491Rhyk+39pfpUO9BPCyQUEt
	 h7JzaxjhI0eFbs3q39hKF8kSDTS3ncdetI21UFDTzFy9f6EXy/sOGWTumk9I2PTJ6P
	 c+uKWTbb1FyOqz2MiCHGvOST+tdotsA2irfABDGM4iYmXBGEn/qZ9AeTEY/2G5EJSO
	 oqQCpYw8dJ27osvfgjTcVnZ6ERHSyokADzHVEiP54sI7MGDMOLOb6ocdBIGwRhsNLE
	 zgkPyPwA4tKQpR23dztRwUjSXGABYmj4Wbh6T3yLr6p1rCRb4fENv6vLwZMh8iiYYG
	 EMe1bbqpBwv4g==
Date: Wed, 6 May 2026 17:54:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: collect certain intermediate files as artifacts
In-Reply-To: <alpine.DEB.2.22.394.2605061748080.1744448@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2605061753050.1744448@ubuntu-linux-20-04-desktop>
References: <6d9345e7-7ad9-48f4-8447-3a955305430a@suse.com> <alpine.DEB.2.22.394.2605061748080.1744448@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1778115288-3B96D938-4AB74556/0/0
X-purgate-type: clean
X-purgate-size: 2254
X-Rspamd-Queue-Id: 7D5184E1C91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, 6 May 2026, Stefano Stabellini wrote:
> On Wed, 6 May 2026, Jan Beulich wrote:
> > When one of the linking passes fails, additional intermediate files are
> > still in place. Having them available for analysis of the underlying
> > problem can be pretty helpful. Collect some into a new intermediates/
> > directory. (Nothing new will be collected if linking succeeds.)
> > 
> > While there also make sure xen-syms is collected (into binaries/). This
> > is rather more useful for analysis of possible problems than its stripped
> > counterpart.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > As the issue this is meant to help with didn't re-occur with this in
> > place, the new logic wasn't really tested yet.
> 
> It looks OK but please provide a link to a successful pipeline
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Actually, I see that the build script is run with bash -ex so I wonder
if collect_xen_artefacts would even run if make fails. I think we need: 

trap collect_xen_artefacts EXIT


> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -6,6 +6,7 @@
> >    artifacts:
> >      paths:
> >        - binaries/
> > +      - intermediates/
> >        - xen-config
> >        - xen-cppcheck.txt
> >        - '*.log'
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -41,18 +41,24 @@ fi
> >  # to exit early -- bash is invoked with -e.
> >  cp xen/.config xen-config
> >  
> > -# Directory for the artefacts to be dumped into
> > -mkdir -p binaries
> > +# Directories for the artefacts to be dumped into
> > +mkdir -p binaries intermediates
> >  
> >  collect_xen_artefacts()
> >  {
> >      local f
> >  
> > -    for f in xen/xen xen/xen.efi; do
> > +    for f in xen/xen xen/xen-syms xen/xen.efi; do
> >          if [[ -f $f ]]; then
> >              cp $f binaries/
> >          fi
> >      done
> > +
> > +    for f in xen/.xen-syms.* xen/.xen.efi.*; do
> > +        if [[ -f $f ]]; then
> > +            cp $f intermediates/
> > +        fi
> > +    done
> >  }
> >  
> >  if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> > 
> 

