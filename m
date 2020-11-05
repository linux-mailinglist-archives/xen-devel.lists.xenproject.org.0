Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222F2A8895
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 22:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20180.45871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kamY2-0003Nh-9p; Thu, 05 Nov 2020 21:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20180.45871; Thu, 05 Nov 2020 21:11:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kamY2-0003NG-5I; Thu, 05 Nov 2020 21:11:58 +0000
Received: by outflank-mailman (input) for mailman id 20180;
 Thu, 05 Nov 2020 21:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kamY0-0003NB-JZ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 21:11:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18768c3d-33d3-4548-99ac-325cf4fad5e6;
 Thu, 05 Nov 2020 21:11:55 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C858B20724;
 Thu,  5 Nov 2020 21:11:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kamY0-0003NB-JZ
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 21:11:56 +0000
X-Inumbo-ID: 18768c3d-33d3-4548-99ac-325cf4fad5e6
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 18768c3d-33d3-4548-99ac-325cf4fad5e6;
	Thu, 05 Nov 2020 21:11:55 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C858B20724;
	Thu,  5 Nov 2020 21:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604610715;
	bh=zdjGWlZF5+w7QEov4WVg9sEtcjr9gG2zt7rm6H9u/HA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Cn4ylwHfRpks84ZmTRHKfKmcbgCRsMloy3+93lAPKL7CQnb0dafUVh9BMIuUATWff
	 KTSEcoJOqL0cfqZ9GeIt4vFROkGVrpZwBENRuNdSBCb/7O7JD4FH3lVxbzi4+h/f4P
	 vlIsa4mlFu5rplTh+J09TCjeqbVSdlDhzcHpd4Us=
Date: Thu, 5 Nov 2020 13:11:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Takahiro Akashi <takahiro.akashi@linaro.org>, 
    Alex Benn??e <alex.bennee@linaro.org>, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, ian.jackson@eu.citrix.com, 
    wl@xen.org, xen-devel@lists.xenproject.org
Subject: Re: BUG: libxl vuart build order
In-Reply-To: <20201105175637.GL2214@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2011051309200.2323@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s> <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa> <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s> <20201029114705.GA291577@laputa>
 <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s> <20201030025157.GA18567@laputa> <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s> <20201105154147.GJ2214@perard.uk.xensource.com> <alpine.DEB.2.21.2011050826510.2323@sstabellini-ThinkPad-T480s>
 <20201105175637.GL2214@perard.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Nov 2020, Anthony PERARD wrote:
> On Thu, Nov 05, 2020 at 08:29:20AM -0800, Stefano Stabellini wrote:
> > On Thu, 5 Nov 2020, Anthony PERARD wrote:
> > > On Fri, Oct 30, 2020 at 10:46:37AM -0700, Stefano Stabellini wrote:
> > > > On Fri, 30 Oct 2020, Takahiro Akashi wrote:
> > > > > === after "xl console -t vuart" ===
> > > > > U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest
> > > > > 
> > > > > Xen virtual CPU
> > > > > Model: XENVM-4.15
> > > > > DRAM:  128 MiB
> > > > > 
> > > > > In:    sbsa-pl011
> > > > > Out:   sbsa-pl011
> > > > > Err:   sbsa-pl011
> > > > > ===
> > > > > 
> > > > > If possible, I hope that "xl create -c" command would accept "-t vuart"
> > > > > option (or it should automatically selects uart type from the config).
> > > > 
> > > > I think a patch to add the "-t" option to "xl create" would be
> > > > acceptable, right Anthony?
> > > 
> > > I don't know. Why `xl' isn't able to select the vuart as the default one?
> > 
> > Because both consoles are still valid: when the emulated uart is
> > enabled, the normal PV console is also enabled.
> > 
> > 
> > > Maybe a long option would be better in the cases where we would like to
> > > connect to a "secondary" console? I could see `xl create --console=vuart'
> > > been fine, I don't know if that's possible.
> > 
> > That's OK for me but keep in mind that xl console already takes -t
> > vuart. In other words:
> 
> I don't know why we would need the same exact option, `xl console` and
> `xl create` are two different commands. Also, I usually prefer long
> option for less used options as it makes it a bit easier to figure out
> what a command is supposed to do (without checking the man; and when
> there is both long and short options available).

That is true. I don't have a strong opinion if it should be "-t" or
something longer like "--console". Either one works. I tend to like "-t"
a bit more because it would make it more consident, but I don't think it
matters much.


> > 1) xl console -t vuart    -> WORKS
> 
> -t for `xl console` kind of works well, -t could be a shortcut of "type"
> of console".
> 
> > 2) xl create -c -t vuart  -> DOESN'T WORK
> 
> But here, -t would not be a "type" of console since we are creating a
> VM. Also `xl create -t vuart` without -c would do nothing, right?
> (create a vm but ignoring the -t).

Yes, it would do nothing


> Anyway, an option to auto-connect to a different console would be
> useful.

Yeah


> > P.S.
> > 
> > Could you also take a quick look at the patch I appended to the previous
> > email? Or would you prefer me to send it out separately as its own
> > patch?
> 
> It's probably better to have a patch on its own when it's ready for
> review rather that been embedded in an email in a long
> discussion/debugging thread. That leave a better chance for others to
> spot that a patch exist and review.

All right, I'll resend reparately.

