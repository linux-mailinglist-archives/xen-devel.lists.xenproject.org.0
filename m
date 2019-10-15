Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E473D7C4E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:50:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPyX-00084l-Q4; Tue, 15 Oct 2019 16:47:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yms0=YI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKPyW-00084e-Kg
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:47:08 +0000
X-Inumbo-ID: 6cd06ca6-ef6b-11e9-9397-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cd06ca6-ef6b-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:47:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE9E420650;
 Tue, 15 Oct 2019 16:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571158027;
 bh=OT7EnrwvsJi6MnauT5H2rR7lCdTcDL4ICNwl6vVvPXc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZPgdFRFP0OhSv64hQFn/cLw3AWuRzPKWX4a5ii0hnf03yOOA7nNg4qP+Y/gJUd1wn
 BkTuMlzx6WImcQMXs1dbyaTHvUKiNwhpZaRaPI72OlK0umkAa8z7shQbnsqy1ybtU2
 6z/Aroj8FiEDkG1S9I/xtF/jKUfMV/3n4y3uNgYw=
Date: Tue, 15 Oct 2019 09:47:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <5ba2ce4b-4fa4-9650-7428-ee09f27dbff0@arm.com>
Message-ID: <alpine.DEB.2.21.1910150947000.30080@sstabellini-ThinkPad-T480s>
References: <20190924143515.8810-1-julien.grall@arm.com>
 <20190924143515.8810-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011757190.2943@sstabellini-ThinkPad-T480s>
 <5e058d03-d854-efe6-56d2-ca99852a8397@arm.com> <87pnjd4ye0.fsf@epam.com>
 <b563f72e-cf4f-dfb3-9342-fdc144124b44@arm.com>
 <5ba2ce4b-4fa4-9650-7428-ee09f27dbff0@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-102232116-1571158027=:30080"
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/2] docs: Replace all instance
 of ARM by Arm
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-102232116-1571158027=:30080
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

I am OK switching to "Arm", however I would do it post-4.13: this is not
the kind of thing we should worry about it now I think.

On Tue, 15 Oct 2019, Julien Grall wrote:
> Hi,
> 
> Gentle, ping. I don't think there are any conclusion here.
> 
> Should we stick to ARM or move to Arm?
> 
> Cheers,
> 
> On 10/3/19 5:02 PM, Julien Grall wrote:
> > Hi,
> > 
> > On 03/10/2019 16:55, Volodymyr Babchuk wrote:
> > > Julien Grall writes:
> > > 
> > > > Hi Stefano,
> > > > 
> > > > On 10/2/19 2:05 AM, Stefano Stabellini wrote:
> > > > > On Tue, 24 Sep 2019, Julien Grall wrote:
> > > > > > The documentation is using a mix of ARM (old) and Arm (new). To stay
> > > > > > consistent, use only the new name.
> > > > > 
> > > > > Thank you for the patch, it must have been "not fun" to write this
> > > > > patch.
> > > > > 
> > > > > However, let me suggest a radical maybe controversial idea. What about
> > > > > keeping "ARM" instead of switching? There are several advantages: it
> > > > > is
> > > > > easier to grep, no need to worry about case-sensitivity. It is what
> > > > > people are used to, and what still use (in my experience at conference
> > > > > and at work.) Would it make sense to ignore Arm's marketing and keep
> > > > > the
> > > > > old "ARM" nomenclature?
> > > > 
> > > > Pretty much all the new documentation on Arm website are now using Arm
> > > > (the spec is now called Arm Arm).
> > > This confuses me, because I believed that second "Arm" stands for
> > > Architecture Reference Manual.
> > Sorry it is Arm ARM. But they tend to use the longer name Arm Architecture
> > Reference Manual.
> > 
> > > 
> > > > > 
> > > > > If not, I'd suggest to also replace "arm" with "Arm" so that at least
> > > > > with have consistent cases everywhere. But then the pathnames would
> > > > > remain xen/arch/arm, leading to sentences such as:
> > > > > 
> > > > >    (non-zImage)" protocol described in arm/Booting.
> > > > >       There are no exception on 64-bit Arm.
> > > > > 
> > > > > With "arm" and "ARM" the distinction was clear between pathnames and
> > > > > text (at least to me.) With "arm" and "Arm", I know it is silly but it
> > > > > kind of bothers me :-)
> > > > 
> > > > How do you deal with Xilinx then? ;)
> > > > 
> > > > > 
> > > > > I am not going to insist on this one though.
> > > > 
> > > > This is quite similar to a company renaming itself (or got acquired
> > > > and the name completely disappear) but in a less radical way. Would
> > > > you still keep the old name company in your documentation and/or
> > > > mixing the both?
> > > BTW, this if what happened with Freescale/NXP. Linux and U-Boot still
> > > use "freescale" even for i.MX8 chips.
> > 
> > Maybe because nobody bothered to do it? I would like some consistency in the
> > documentation and hence using the new name makes sense. But I am not
> > bothered enough to argue whether we should stay in the past.
> > 
> > Cheers,
> > 
> 
> -- 
> Julien Grall
> 
--8323329-102232116-1571158027=:30080
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-102232116-1571158027=:30080--

