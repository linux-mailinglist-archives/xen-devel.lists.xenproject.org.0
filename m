Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE370B20C17
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 16:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077708.1438735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulTer-0007qu-Ek; Mon, 11 Aug 2025 14:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077708.1438735; Mon, 11 Aug 2025 14:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulTer-0007oX-Bx; Mon, 11 Aug 2025 14:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1077708;
 Mon, 11 Aug 2025 14:37:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ulTep-0007oR-Sh
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 14:37:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ulTeo-00072X-0l;
 Mon, 11 Aug 2025 14:37:50 +0000
Received: from [2a01:cb15:80df:da00:c70a:43d:5717:e951] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ulTeo-000Dfp-0m;
 Mon, 11 Aug 2025 14:37:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=pUvTOK7d21O0RFicswGWQ0GbYd+15lKWkdu6ppvKHpo=; b=5wOqFEDbqb5Cb1jPgNe0arN0a1
	KgHFc4xsTJc1RHRPDDZZXQp7ivUafeC+H6hgmFYCW2XbX4LjHTc5ErnhAejQbbvpk99SKXYgXr5yk
	NWDzmuNaC8dfv4Jw0SBSDD8n4Kegn7m6JbVzHKzm82byydfCMhF9qcy3Fy0hiymOZ+Hc=;
Date: Mon, 11 Aug 2025 16:37:47 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 11/11] Update CHANGELOG and README with dependency on
 json-c
Message-ID: <aJoAO2NOLtIxBbAf@l14>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-12-anthony@xenproject.org>
 <2f073fa0-5064-4cd2-b332-c3a6ceaf537a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f073fa0-5064-4cd2-b332-c3a6ceaf537a@citrix.com>

On Mon, Aug 11, 2025 at 11:55:04AM +0100, Andrew Cooper wrote:
> On 08/08/2025 3:56 pm, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> > ---
> >  CHANGELOG.md | 2 ++
> >  README       | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 5f31ca08fe..83195e2dae 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >     - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
> >     - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
> >   - Linux based device model stubdomains are now fully supported.
> > + - New dependency on library json-c, the toolstack will prefer it to `YAJL`
> > +   when available.
> >  
> >   - On x86:
> >     - Restrict the cache flushing done as a result of guest physical memory map
> > diff --git a/README b/README
> > index 6ee58f7b35..9329f30e13 100644
> > --- a/README
> > +++ b/README
> > @@ -53,7 +53,7 @@ provided by your OS distributor:
> >      * Development install of Python 2.7 or later (e.g., python-dev)
> >      * Development install of curses (e.g., libncurses-dev)
> >      * Development install of uuid (e.g. uuid-dev)
> > -    * Development install of yajl (e.g. libyajl-dev)
> > +    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)
> >      * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
> >        greater.
> >      * Development install of GLib v2.0 (e.g. libglib2.0-dev)
> 
> What are we going to do about testing this?
> 
> We should add libjson-c to some build containers.  We need to annotate #
> Xen < 4.21 in the existing containers so we can drop it in due course.

archlinux container already have `json-c` so the CI already do some
build jobs with it. (no *-dev needed for this one container). It even
notice an issue with `debug=n` builds, I had to replace `strncpy` by
`memcpy`.

> Also, for a container we don't intend to backport to stable trees, we
> should have libjson-c only and no yajl.  Probably best to do this in the
> Alpine update which is long overdue.

Doing this on alpine container would allow to actually do some runtime
tests with json-c instead of yajl, so yes.

-- 
Anthony PERARD

