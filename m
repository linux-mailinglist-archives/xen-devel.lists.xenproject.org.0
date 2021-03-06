Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B032F78D
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 02:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94109.177573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lILw7-0002Go-Jm; Sat, 06 Mar 2021 01:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94109.177573; Sat, 06 Mar 2021 01:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lILw7-0002GW-DS; Sat, 06 Mar 2021 01:40:55 +0000
Received: by outflank-mailman (input) for mailman id 94109;
 Sat, 06 Mar 2021 01:40:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ndT5=IE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lILw5-0002GR-RQ
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 01:40:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89551446-9c03-428f-b62b-66d3811d5b51;
 Sat, 06 Mar 2021 01:40:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2EF764FEE;
 Sat,  6 Mar 2021 01:40:51 +0000 (UTC)
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
X-Inumbo-ID: 89551446-9c03-428f-b62b-66d3811d5b51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614994852;
	bh=VwVZDWV1nSdGBwWMZFS5HrRiJom7YCQaAQfnELq9yQw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bnYxafH4OZkv5sI7WKXT3rAh86FeWv89b6SVrZoOMmJG7bzVRFQySuw3eHLPI8qG+
	 am8u/bwIG2MaR9jOR3E0QnIbBb24bSs2k/MPXz8aa5uEGowLJc3jBro8F5a/BNDKgq
	 RhlKS4K8/aFzH98LfQncp1UvQNldSpYcui0bINkD75RwOHYD48RQsWWewCeYttDAdA
	 mMuOf1TmRP5Wvl0a/6ePlFWZtyEC0zf1ctwtvRwUN2oPZ/vmnVQAf/oAWDJRuaP0X7
	 naEtxVOI6mCYB1UBc521ctIcuG4z4zKgVSapkP1rESLTEx8B9dX1qg15+hY1AtjcX1
	 Mkb4cELWNtpaA==
Date: Fri, 5 Mar 2021 17:40:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Ian Jackson <iwj@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build
 depends
In-Reply-To: <alpine.DEB.2.21.2103021139380.2682@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2103051739350.14213@sstabellini-ThinkPad-T480s>
References: <20210301095806.68518-1-roger.pau@citrix.com> <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com> <27ec9db0-69bc-df9a-8511-109f57972046@citrix.com> <YD3z9LNpzbOfqmpu@Air-de-Roger> <b3912fde-165c-b404-bf1c-46189d0ce766@suse.com> <YD4HM9+IEZKIq/SQ@Air-de-Roger>
 <77e7004f-8a73-e868-1ccd-318de5886f4a@suse.com> <alpine.DEB.2.21.2103021139380.2682@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-802107187-1614994852=:14213"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-802107187-1614994852=:14213
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 2 Mar 2021, Stefano Stabellini wrote:
> On Tue, 2 Mar 2021, Jan Beulich wrote:
> > On 02.03.2021 10:36, Roger Pau Monné wrote:
> > > On Tue, Mar 02, 2021 at 09:53:41AM +0100, Jan Beulich wrote:
> > >> On 02.03.2021 09:14, Roger Pau Monné wrote:
> > >>> On Mon, Mar 01, 2021 at 06:01:36PM +0000, Andrew Cooper wrote:
> > >>>> On 01/03/2021 17:59, Andrew Cooper wrote:
> > >>>>> On 01/03/2021 09:58, Roger Pau Monne wrote:
> > >>>>>> clang++ relies on the C++ headers installed by g++, or else a clang
> > >>>>>> build will hit the following error:
> > >>>>>>
> > >>>>>> <built-in>:3:10: fatal error: 'cstring' file not found
> > >>>>>> #include "cstring"
> > >>>>>>          ^~~~~~~~~
> > >>>>>> 1 error generated.
> > >>>>>> make[10]: *** [Makefile:120: headers++.chk] Error 1
> > >>>>>>
> > >>>>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> > >>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > >>>>>> ---
> > >>>>>> Cc: Ian Jackson <iwj@xenproject.org>
> > >>>>>> No real risk here from a release PoV, it's just pulling a package
> > >>>>>> required for the Alpine clang build. Worse that cold happen is that
> > >>>>>> the Alpine clang build broke, but it's already broken.
> > >>>>> Shouldn't this be fixed upstream in Alpine?  Its clearly a packaging bug.
> > >>>>
> > >>>> Or (thinking about it), we've got a build system bug using g++ when it
> > >>>> should be using clang++.
> > >>>
> > >>> No, the check is using clang++, the issue is that clang++ doesn't
> > >>> install the standard c++ headers, and thus trying to use them (cstring
> > >>> in this case) fails. Installing the g++ package solves the issue
> > >>> because it installs the headers.
> > >>
> > >> I have to admit that I consider this odd. The g++ package should
> > >> neither provide nor depend on the headers. It may recommend their
> > >> installation. On my distro (SLES) the headers come from the
> > >> libstdc++-devel package, as I would have expected. There
> > >> additionally is a dependency of libclang5 (no -devel suffix!) on
> > >> libstdc++-devel (I suppose this is an indication that things
> > >> aren't quite right here either; I haven't checked an up-to-date
> > >> version of the distro yet, though).
> > > 
> > > Yes, that was indeed my first attempt as I've tried to install
> > > libstdc++, but there's no -devel counterpart for the package, and it
> > > only installs the libraries but not the headers.
> > > 
> > > Then if I list the contents of the g++ package, I do see:
> > > 
> > > ...
> > > usr/include/c++/10.2.1/cstring
> > > ...
> > > 
> > > And clang++'s include path is:
> > > 
> > > #include <...> search starts here:
> > >  /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1
> > >  /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/x86_64-alpine-linux-musl
> > >  /usr/bin/../lib/gcc/x86_64-alpine-linux-musl/10.2.1/../../../../include/c++/10.2.1/backward
> > >  /usr/include
> > >  /usr/lib/clang/10.0.1/include
> > > 
> > > So it does seem clang depends on the gcc c++ headers, I assume this is
> > > done in order to avoid having a duplicate set of c++ headers for clang
> > > and gcc? I really have no idea, but I do think clang package should
> > > depend on g++.
> > 
> > As long as the g++ package is what provides the headers (i.e. if that's
> > their concept), I agree.
> 
> That makes sense to me too.
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

If nobody speaks up, I'll commit this patch and this patch:

https://marc.info/?l=xen-devel&m=161433737432684

(both of them already acked by Ian and only affecting automation/)
within the next day or two.
--8323329-802107187-1614994852=:14213--

