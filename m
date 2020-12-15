Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D02DA4FF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 01:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52769.92100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koyPj-0006je-Rq; Tue, 15 Dec 2020 00:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52769.92100; Tue, 15 Dec 2020 00:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koyPj-0006jF-OH; Tue, 15 Dec 2020 00:42:03 +0000
Received: by outflank-mailman (input) for mailman id 52769;
 Tue, 15 Dec 2020 00:42:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0G7T=FT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1koyPi-0006jA-85
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 00:42:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04669d94-49b6-45ff-8187-df3ccd557880;
 Tue, 15 Dec 2020 00:42:01 +0000 (UTC)
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
X-Inumbo-ID: 04669d94-49b6-45ff-8187-df3ccd557880
Date: Mon, 14 Dec 2020 16:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607992920;
	bh=T8CNXlo77Y0QR1I+LGgqPsErHuBpnB0uR8H9yqE0Kbk=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=VQGpDX17bPkFVRl6ftvtU6SGSVGP/Gn3mcfMYSFMPni3Th4hTMKMR0lMWt+3HWjE2
	 BqMMOG7vbmN3SjLlJxTfDtw0uto3a8iRHvNwVmXCNaLSA/erSzxHMGRl4ivFDIuEeJ
	 lRET5bdqmEHazpOhtID11yfnb5mGx779HgpKThUn9Inh27S+CdSJ9ZWMDg9Yyec+Oi
	 zzQ6wy4ZiVZcgL62LZGiW/p1s21sH8QEJppZQaGcODlbIKWRjwGsTDGu2gOHLVJQIG
	 HGYjA/Zrac40EkS6X+9+kDSsCriXqGjEEpHpz+A/5w+P7bLJh7iXFuwnLy2cayYo37
	 V8lVYyINhEsQQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rich Persaud <persaur@gmail.com>
cc: openxt <openxt@googlegroups.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Olivier Lambert <olivier.lambert@vates.fr>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Chris Rogers <crogers122@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, 
    wl@xen.org, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com
Subject: Re: [openxt-dev] Re: Follow up on libxl-fix-reboot.patch
In-Reply-To: <3ACCFEC6-A8B7-48E6-AA3F-48D4CDE75FA4@gmail.com>
Message-ID: <alpine.DEB.2.21.2012141632020.4040@sstabellini-ThinkPad-T480s>
References: <CAKf6xps-nM13E19SVS3NJwq6LwOJLUwN+FC6k_Sp9-_YaRt-EA@mail.gmail.com> <3ACCFEC6-A8B7-48E6-AA3F-48D4CDE75FA4@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-754717913-1607992920=:4040"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-754717913-1607992920=:4040
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 14 Dec 2020, Rich Persaud wrote:
> (adding xen-devel & toolstack devs)
> 
> On Dec 14, 2020, at 16:12, Jason Andryuk <jandryuk@gmail.com> wrote:
> > 
> > ﻿On Fri, Dec 11, 2020 at 3:56 PM Chris Rogers <crogers122@gmail.com> wrote:
> >> 
> >> This is a follow up to a request during our roadmapping meeting to clarify the purpose of libxl-fix-reboot.patch on the current version of Xen in OpenXT (4.12).  It's pretty simple.  While the domctl API does define a trigger for reset in xen/include/public/domctl.h:
> >> 
> > 
> >> The call stack looks like this:
> >>> libxl_send_trigger(ctx, domid, LIBXL_TRIGGER_RESET, 0);
> >>> xc_domain_send_trigger(ctx->xch, domid, XEN_DOMCTL_SENDTRIGGER_RESET, vcupid);
> >>> do_domctl()
> >>> arch_do_domctl()
> >> and reaching the case statement in arch_do_domctl() for XEN_DOMCTL_sendtrigger, with RESET, we get -ENOSYS as illustrated above.
> > 
> > Thanks, Chris.  It's surprising that xl trigger reset exists, but
> > isn't wired through to do anything.  And that reboot has a fallback
> > command to something that doesn't work.

I miss some of the context of this thread -- let me try to understand
the issue properly.

It looks like HVM reboot doesn't work properly, or is it HVM reset
(in-guest reset)? It looks like it is implemented by calling "xl trigger
reset", which is implemented by libxl_send_trigger. The call chain leads
to a XEN_DOMCTL_sendtrigger domctl with XEN_DOMCTL_SENDTRIGGER_RESET as
a parameter that is not implemented on x86.

That looks like a pretty serious bug :-)


I imagine the reason why it is in that state is that the main way to
reboot would be to call "xl reboot" which is implemented with the PV
protocol "reboot" write to xenstore?  Either way, the bug should be
fixed.

What does your libxl-fix-reboot.patch patch do? Does it add an
implementation of XEN_DOMCTL_SENDTRIGGER_RESET?
--8323329-754717913-1607992920=:4040--

