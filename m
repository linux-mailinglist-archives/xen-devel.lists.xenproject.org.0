Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F12503AD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 18:49:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAFeZ-0003qo-2p; Mon, 24 Aug 2020 16:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61pB=CC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kAFeX-0003qj-LM
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 16:49:01 +0000
X-Inumbo-ID: 3ab36c0c-daa7-4f3d-bcda-9ea053508398
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ab36c0c-daa7-4f3d-bcda-9ea053508398;
 Mon, 24 Aug 2020 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598287741;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sh3tpI1RzetkHG3duJyPtOZmqJx+UAZMfjei9utDUlE=;
 b=cREGunoOEUOYh6T7fCi8lnbdCE/7rMtYr9pDUBMdQMzi7snzI+uWPbfu
 7ERok0UbAemrGeXBLe9NGzFOzOMGlzMHRRsQmf3cA8HQPqXPXNZPmqyuU
 NPRxQ1PpyrunXSxRokKe3Y7417U8jAyru13taLCEOZ2VmDwt2Mx559Ufn Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0Z9gk8VzyHkPi8FO5/NuQGJ2TXaU6ry6IDZv0efcX67Vxn2j4t+ot9oOuz+MGk1sYW9aH67IWH
 OBN0O02AE1br5yDrdxi9QHxAQST1q/Y6KSPdLZ0lLeaQihEXzqMgaG6ldwoK23zk6RMxqTB25y
 GGMuAmupLayl3pasSL6MDSYz/3RJBHmfAR91sZIwYkCCGh9PrDQMkRFkPiD+qTw+m9sYoZRM/U
 ieMKx25vOm8YygzpIALdDRlEK5EU34BXmCzDLtbpYDz5iiYcw2Ly8gUisx+/1SfGPUXOZrePrL
 hLs=
X-SBRS: 2.7
X-MesageID: 25183494
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,349,1592884800"; d="scan'208";a="25183494"
Date: Mon, 24 Aug 2020 18:48:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>, osstest service owner <osstest-admin@xenproject.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [linux-linus test] 152672: regressions - FAIL
Message-ID: <20200824164853.GF1587@Air-de-Roger>
References: <osstest-152672-mainreport@xen.org>
 <93d94ca3-1a87-a11a-daef-11ec183d9a2f@suse.com>
 <d8fb302b-8dae-a0fe-7617-dc9d3b0ec6fa@suse.com>
 <0061138a-749f-4702-2dbc-084690062976@suse.com>
 <28c918a3-7290-b3c3-4e10-009e5ea48aa0@suse.com>
 <7b8fd84b-a0bb-9976-ff57-3e104b57ffcc@suse.com>
 <ae261da3-162b-12e6-60c9-a5b9fdf30d6d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae261da3-162b-12e6-60c9-a5b9fdf30d6d@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 24, 2020 at 11:21:20AM +0100, Andrew Cooper wrote:
> On 24/08/2020 09:00, Jürgen Groß wrote:
> > On 24.08.20 09:51, Jan Beulich wrote:
> >> On 24.08.2020 09:23, Jürgen Groß wrote:
> >>> On 24.08.20 08:44, Jan Beulich wrote:
> >>>> On 23.08.2020 07:52, Jürgen Groß wrote:
> >>>>> On 23.08.20 07:24, osstest service owner wrote:
> >>>>>> flight 152672 linux-linus real [real]
> >>>>>> http://logs.test-lab.xenproject.org/osstest/logs/152672/
> >>>>>>
> >>>>>> Regressions :-(
> >>>>>
> >>>>> With 32-bit pv support now removed from the kernel the associated
> >>>>> tests
> >>>>> should be removed for the upstream kernel, too.
> >>>>
> >>>> Not exactly sure how things are organized, but isn't the 2nd
> >>>> <arch> in the test identifier currently specifying "Dom0
> >>>> bitness" as a whole? If so, shouldn't testing a 32-bit tool
> >>>> stack build continue to be done (under this same name perhaps),
> >>>> just with a 64-bit kernel now? In which case the next question
> >>>
> >>> Only the linux-linus tests are affected right now. "Old" kernels can
> >>> still be used for 32-bit tests. And PVH ones, of course.
> >>>
> >>>> is whether the 64-bit kernel is actually fully ready to be used
> >>>> this way. I'm afraid it isn't, as there's still no privcmd
> >>>> compat ioctl handling afaict, which I would say should have
> >>>> been a prereq for removing PV support from 32-bit kernels.
> >>>
> >>> No, I don't think so.
> >>>
> >>> 32-bit pv linux kernels are missing Meltdown mitigation and using a
> >>> 32-bit toolstack on a 64-bit kernel is no feature I'd like to
> >>> encourage.
> >>
> >> Where else do you propose to test the 32-bit tool stack then?
> >
> > Right now stable kernels, later PVH only.
> >
> >> Even if right now only linux-linus is really affected, sooner
> >> or later the stable Linux tree will also be switched to one
> >> which doesn't have 32-bit PV support anymore.
> >
> > Yes.
> >
> >> I also have trouble seeing why it should be use to dictate what
> >> bitness a user space people are running. Even more so that we've
> >
> > We are not talking about some random user programs, but the tools
> > we are providing and which are running in dom0 only.
> >
> > And I don't think running a 32-bit toolstack on a 64-bit kernel is
> > supported right now (in case it is, then we don't need to worry as
> > it should continue to work). I don't think we should start supporting
> > that just for being able to test it.
> 
> 32bit toolstack on a 64bit kernel doesn't remotely work, due to pointers
> embedded in structures which privcmd passes through unmodified.
> 
> It will actually start working again after the tools ABI stability work,
> because this is just one of the many ABI mistakes which will be corrected.
> 
> 
> That said, 32bit toolstacks are not a useful or sensible thing these
> days.  I strongly suspect it gets 0 use outside of OSSTest.

We still have the armhf tests on osstest, so a 32bit toolstack is
still getting exercised (albeit not exactly the same code paths as
x86-32).

Right now the PVH dom0 tests are amd64 only, but I could add a 32bit
one if that's found to be useful.

FWIW, on FreeBSD PVH is only implemented for amd64 (and so is dom0).
IIRC at some point we figured out that no one was using the 32bit
images provided for AWS so while there's still support for FreeBSD
running on Xen in 32bit mode I don't think anyone uses it (the more
that I tend to find 32bit specific issues whenever I test the images
myself, that no one seems to care about).

Roger.

