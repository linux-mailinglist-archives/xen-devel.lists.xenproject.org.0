Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1838168DF94
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 19:05:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491376.760448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPSKf-0005VO-Sj; Tue, 07 Feb 2023 18:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491376.760448; Tue, 07 Feb 2023 18:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPSKf-0005T2-Ot; Tue, 07 Feb 2023 18:04:41 +0000
Received: by outflank-mailman (input) for mailman id 491376;
 Tue, 07 Feb 2023 18:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if6N=6D=citrix.com=prvs=3954b4a48=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pPSKe-0005Sw-IA
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 18:04:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd269882-a711-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 19:04:18 +0100 (CET)
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
X-Inumbo-ID: bd269882-a711-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675793058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UyUpBNePlzlW5g9E0XocfkD0UG+yFrziX5U4b0VfFHk=;
  b=et/9zT80Tond+PG+FhbZMwyprjpIWXS6dabmD0alX6oejYc8Q8XwUMKK
   Ika+z/IlJCaxwv06GoJPA3t9F4FXpZjtDJRv9JAYo97UoIAUt7ywLrNBw
   993HjXDvjcRphs7T6OhjEvJYeEUBRyctBk2WR0kcZDZP8TpC6EMIMFOlq
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94917444
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BfHsj6IeTj948OSpFE+R7JUlxSXFcZb7ZxGr2PjKsXjdYENSgzYDy
 GIaC2nXPvmJYGvyfNwgbYvlpE4AscDVzt9hQANlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5ARhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GQnsVr
 PEICQwLSSGgm8SGwfGfFsNz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbGZQMwRrE+
 goq+UzSWCsdK/qFxwGm737vqP3Gkjr5e6MrQejQGvlC3wTImz175ActfVmxrOS9i0W+c8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yFaGsQQbQMF4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq1/6+ZtzqoNQAJLGUJYmkPSg5t3jX4iNht1FSVFI8lSfPryISvQlkc3
 gxmsgAPxK9I1MMb9pm92mHknxScp9vtEiQqs1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZUZxCIUvIT46NuhXogj1mPPBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbhAjud7mnhhmTmJLXwe8/hA+ePPDEN5tJ9faAfeBgzHxPPsTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBiba0aX/d/L7bZSiI/QTFJNhMk6e95E2CTt/gPx7igE
 7DUchMw9WcTclWddljXNC44Nem/NXu9xFpiVRER0Z+T8yBLSe6SAG03LsNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:FjDRfa/yDN0LIMd4Maxuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.97,278,1669093200"; 
   d="scan'208";a="94917444"
Date: Tue, 7 Feb 2023 18:02:45 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] tools: Have flex and bison mandatory
Message-ID: <Y+KSRY+5SmrNYpJ/@perard.uk.xensource.com>
References: <20230207160948.3169-1-anthony.perard@citrix.com>
 <a11b962e-7422-a197-4ff4-fcac9963364d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a11b962e-7422-a197-4ff4-fcac9963364d@suse.com>

On Tue, Feb 07, 2023 at 06:03:12PM +0100, Jan Beulich wrote:
> On 07.02.2023 17:09, Anthony PERARD wrote:
> > Both are already mandatory to build the hypervisor.
> 
> I'm not sure this is sufficient as a justification. From all we can
> tell even pretty old tool versions are okay for kconfig's purposes.
> However, pretty recently I've learned that some linker script language
> construct used for GNU ld runs into a bug in certain (old) versions of
> flex. Use of that construct will then cause an (almost?) infinite loop
> in ld. Therefore the question is whether libxlu's uses are immune to
> such issues (along the lines of kconfig apparently being).
> 
> That said - I'm happy about the change in principle; if so desired we
> could simply see if anyone ever runs into an issue, and revert if need
> be. Nevertheless I'm not convinced it'll address the problem Andrew
> had noticed in CI (and where the consideration to remove the generated

Indeed, it won't fix the issue.

> files originated). It is likely to mask the issue in CI (simply
> because, aiui, there are no incremental builds done there), but that
> won't prevent people running into it on other occasions.


> > This will help avoid cases where the *.y or *.l files are been updated
> > but flex and bison aren't available.
> 
> This is odd: How will this "help"? Right now the build ought to fail
> (it doesn't, there's merely a warning, which might be easily missed).
> With your change configure will fail when the tools aren't there.

The scenario I was thinking about is when someone edit the *.l source
file, and try to rebuild without flex been installed. It might take
sometime to find-out that the reason change aren't taken into account is
because flex is missing. At least there's a warning, but it is buried
within the rest of the build log.

> > This also remove the way the missing binaries are been handled, with
> > double-column-rules, which might be an issue sometime.
> 
> These double-colon rules should never have been introduced. Double
> colons have a different meaning ("terminal rule") for pattern rules.
> In fact they were my initial suspects when looking into that odd build
> failure in CI.

After some more investigation, I don't think anymore the double-colon
rules here is an issue.

I think the issue that Andrew saw in the CI with "libxlu_cfg_y.o"
failing to build while "libxlu_cfg_l.[ch]" are been regenerated is
probably because make doesn't consider "libxlu_cfg_l.[ch]" as a group of
targets.

If for some reason we have:
    libxlu_cfg_l.h newer than libxlu_cfg_l.l newer than libxlu_cfg_l.c

Then make seems to take two parallel decision:
    When building libxlu_cfg_y.o:
        libxlu_cfg_l.h is newer than libxlu_cfg_l.l
        -> libxlu_cfg_l.h is up-to-date, start building libxlu_cfg_y.o
    When building libxlu_cfg_l.o:
        libxlu_cfg_l.c is older than libxlu_cfg_l.l
        -> we need to generate libxlu_cfg_l.c first
Then, libxlu_cfg_y.o fails to build because libxlu_cfg_l.h is been
updated do to the parallel build of libxlu_cfg_l.o.

I can easily reproduce the issue with:
    touch libxlu_cfg_l.c; sleep .1; touch libxlu_cfg_l.l; sleep .1;
    touch libxlu_cfg_l.h; sleep .1; make -j
And having "sleep 1" in "%.c %.h: %.l" recipe, between `rm` and `flex`.

I don't know how to properly fix this yet.
Event writing "%.c %.h &: %.l" doesn't work, with make 4.3, which is
supposed to be grouped targets. But that's is maybe fixed in 4.4.


> > Adding ".SECONDARY:" to avoid "libxlu_cfg_y.c" been deleted by make
> > when building the library, and regenerating the file on the first
> > incremental build.
> 
> While probably okay here, I'd still like to ask: Are you sure you
> don't want to specify the files we care about, rather than applying it
> to everything (by leaving blank the right side of the colon)?

I guess it would be better to specify each targets.

Thanks,

-- 
Anthony PERARD

