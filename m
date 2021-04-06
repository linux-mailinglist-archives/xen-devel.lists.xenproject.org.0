Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D671355DDF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 23:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106307.203316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTtBv-0006bE-Vv; Tue, 06 Apr 2021 21:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106307.203316; Tue, 06 Apr 2021 21:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTtBv-0006an-SZ; Tue, 06 Apr 2021 21:24:55 +0000
Received: by outflank-mailman (input) for mailman id 106307;
 Tue, 06 Apr 2021 21:24:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uncx=JD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lTtBu-0006ai-Aq
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 21:24:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31548986-699d-460f-96da-b1d3b419f200;
 Tue, 06 Apr 2021 21:24:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2DB461396;
 Tue,  6 Apr 2021 21:24:52 +0000 (UTC)
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
X-Inumbo-ID: 31548986-699d-460f-96da-b1d3b419f200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617744293;
	bh=H2NAWP4Xi7y6EV5xHX1I9+POqLpf99goDaZ8lVmFaUY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y5Pg0fHm1ZX8R7Chj0E/JZOkd2eoNizyOWV7mtVOYMw4aUS5YsPh95t223j9oOYUU
	 DoVow/TjAx6cn9PumcJFQLfx8+aoqFbzdArT8CXcv07La3+k/CVSBA0XPrdddQ5NP6
	 pY5uXFzhq0+4I+OOzHnKpeO2BOx+I8Q0iCEVTmofhXcWs0AXRjK5Mu4WNsDLBEDwJv
	 TeCKtnupt5H6JfVLwh0QuatqnTwcFUXIh6DvRaC43QC3eBdVVT50g6AXaz/qOoeesB
	 qCcJQqyl4tN/UUGT9nX5Wh3fwDrv8yV8WV9Um/8cvkT0E4LGaF18vYUzSI6aAWfgHf
	 bd8O5VlCZMfmg==
Date: Tue, 6 Apr 2021 14:24:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, wei.chen@arm.com, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/3] Use Doxygen and sphinx for html documentation
In-Reply-To: <225d7e0a-c5c6-a954-9141-ba1d859f400a@citrix.com>
Message-ID: <alpine.DEB.2.21.2104061418360.31460@sstabellini-ThinkPad-T480s>
References: <20210406103603.8530-1-luca.fancellu@arm.com> <225d7e0a-c5c6-a954-9141-ba1d859f400a@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-285525972-1617744292=:31460"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-285525972-1617744292=:31460
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 6 Apr 2021, Andrew Cooper wrote:
> On 06/04/2021 11:36, Luca Fancellu wrote:
> > This serie introduce doxygen in the sphinx html docs generation.
> > One benefit is to keep most of the documentation in the source
> > files of xen so that it's more maintainable, on the other hand
> > there are some limitation of doxygen that must be addressed
> > modifying the current codebase (for example doxygen can't parse
> > anonymous structure/union).
> >
> > To reproduce the documentation xen must be compiled because
> > most of the headers are generated on compilation time from
> > the makefiles.
> >
> > Here follows the steps to generate the sphinx html docs, some
> > package may be required on your machine, everything is suggested
> > by the autoconf script.
> > Here I'm building the arm64 docs (the only introduced for now by
> > this serie):
> >
> > ./configure
> > make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-" menuconfig
> > make -C xen XEN_TARGET_ARCH="arm64" CROSS_COMPILE="aarch64-linux-gnu-"
> > make -C docs XEN_TARGET_ARCH="arm64" sphinx-html
> >
> > now in docs/sphinx/html/ we have the generated docs starting
> > from the index.html page.
> 
> Do you have a sample rendered output?
> 
> The plan was to try and use Linux's kernel-doc plugin for Sphinx, which
> is very doxygen-like.  Did you experiment with this option?

As you probably know the end goal for Luca (and the Xen FuSa SIG as a
whole) is to generate all FuSa documents, including requirements docs,
interface docs, etc.

FuSa requires us to follow the famous V model, where the high level
requirements are linked to the lower level requirements, which are
linked to the interface docs, which are linked all the way down to the
code.

Maintaining the linking is difficult and typically done with expensive
proprietary FuSa tools.

Fortunately, an engineer working with the Zephyr project developed a set
of scripts for Doxygen that are able to generate the required FuSa docs
and also links from in-code comments and markdown/rst docs in the tree.

This is great work, and in the FuSa SIG we thought it would be best to
align ourselves with Zephyr to be able to pull our efforts together on
the tooling side instead of doing the same thing again on our own.

This is the reason why we ended up with Doxygen.
--8323329-285525972-1617744292=:31460--

