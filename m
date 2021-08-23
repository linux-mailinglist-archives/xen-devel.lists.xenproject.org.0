Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E663F4AA4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 14:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170411.311212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI92O-0004TG-2s; Mon, 23 Aug 2021 12:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170411.311212; Mon, 23 Aug 2021 12:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI92N-0004Q4-V8; Mon, 23 Aug 2021 12:26:47 +0000
Received: by outflank-mailman (input) for mailman id 170411;
 Mon, 23 Aug 2021 12:26:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkzG=NO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mI92M-0004Py-Fd
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 12:26:46 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e75f474-040d-11ec-a872-12813bfff9fa;
 Mon, 23 Aug 2021 12:26:41 +0000 (UTC)
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
X-Inumbo-ID: 5e75f474-040d-11ec-a872-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629721601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4mCfKHaxbQNKo/26kGmar3/UwAh/wLJ/ByyIRamOFA=;
  b=ZzE3xVd2XaE3bmaVK2AuwYAeiH/uPRWoXvA18u0h+SDJUlHF9r6vR57E
   HPx9s4cRRhB4PUcoFHBkky4ZbqVugPqDOSG8o05ex+d2H1C6GvpmUHjFj
   NwBt87PDs6KmyyT7w6mLy68lRaDJGa5OgAxSp6oA8IngHy/EGLixXRGC8
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jlTcOXLEnhy5z77bB9bI6fnjPoFB040OKPX5TbVRir39z+0uHnc+CyhlFHOumhcG5T3iXWHpX7
 zTSngEvDOpT1KvDCPUtkhY+wDH7JB4IqLhxdKhp20dFp1iyCVktZDIHCxGy08MBTb9HP0+NNhc
 gQGwqiu5hwUXWYDRD0kRzaHHioztbuuy71R5t8nTQwQRYdBlq23obL7w3qJVZsatlG0oD9tfKJ
 ZrA8Z17yJdNf1th7dyoxj/gkrWC6YGE2YXCefztvua4+MFDCXB2ZSSMz2bWmvm5Rr7zi1etMmG
 tgJg5DIpESw/jLJmPMWVJ5/H
X-SBRS: 5.1
X-MesageID: 51064148
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:n8LLvauV0HZZZaowjNjGqh3Z7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.84,344,1620705600"; 
   d="scan'208";a="51064148"
Date: Mon, 23 Aug 2021 13:26:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, osstest service owner
	<osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [xen-4.12-testing bisection] complete
 test-amd64-i386-xl-qemuu-ovmf-amd64
Message-ID: <YSOT/TVwPNxUI+pb@perard>
References: <E1mHy0c-00059n-HR@osstest.test-lab.xenproject.org>
 <9e009e5d-41cf-71de-fed4-88a962b4ab66@suse.com>
 <YSNrZfjGJzdKUlvV@perard>
 <3700f293-001c-c01c-c443-86be60e5601f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3700f293-001c-c01c-c443-86be60e5601f@suse.com>

On Mon, Aug 23, 2021 at 12:07:44PM +0200, Jan Beulich wrote:
> On 23.08.2021 11:33, Anthony PERARD wrote:
> > On Mon, Aug 23, 2021 at 09:07:32AM +0200, Jan Beulich wrote:
> >> On 23.08.2021 02:40, osstest service owner wrote:
> >>>   commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
> >>>   Author: Laszlo Ersek <lersek@redhat.com>
> >>>   Date:   Wed May 26 22:14:24 2021 +0200
> >>>   
> >>>       OvmfPkg/PlatformPei: remove Xen support
> >>
> >> Uniformly from 4.15 through to 4.12 (the latter of which shouldn't have
> >> been affected by whatever has been pulled in in the first place, given
> >> it's a security-only branch, but with the OVMF commit to use being
> >> hardcoded in ./Config.mk I don't really understand how a possible
> >> change to the OVMF tree could have affected this version) tests are
> >> now failing, everywhere with the above bisection result. Given that we
> >> want to get out releases from the 4.15 and 4.13 branches right after
> >> the batch of XSAs going public on Wednesday, something needs to be
> >> done about this pretty soon.
> >>
> >> Does osstest override ./Config.mk's choice? Albeit I guess even if it
> >> does that's not outright wrong, and instead it would be bad if the
> >> older versions wouldn't work anymore with an updated OVMF.
> > 
> > Yes, osstest uses "xen-tested-master" branch since c9d1e5896fe2
> > ("cr-daily-branch: ovmf: "usually" use xen-tested-master") for stable
> > branches.
> > 
> > We are going to need to backport a commit from unstable. Either
> >     aad7b5c11d51 ("tools/firmware/ovmf: Use OvmfXen platform file is exist")
> >         (but has been reverted)
> > or
> >     81f291420238 ("tools/firmware/ovmf: Use OvmfXen platform file if exist and update OVMF")
> >         (but it also changes the version of ovmf pulled by default,
> >          which we probably don't want to change)
> > 
> > So I would suggest backporting aad7b5c11d51.
> 
> Anthony - thanks for the quick reply.
> 
> Ian - that's largely your call then I guess.
> 
> Overall I'm not convinced though that backporting either of these
> changes is the way to go. But I say this without knowing what the
> background is for osstest's overriding of Config.mk. Plus it's not
> immediately clear to me whether backporting is perhaps the only
> approach to keeping older Xen versions working with up-to-date
> OVMF; I'm getting the impression that it might be.

Well, a better approach would be for osstest to do a separate build for
OVMF, but in the meantime we are stuck with xen.git having to build
everything.

-- 
Anthony PERARD

