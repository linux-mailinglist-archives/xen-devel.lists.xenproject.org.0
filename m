Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCAA3BF893
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 12:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152990.282632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Rdb-0005TV-SQ; Thu, 08 Jul 2021 10:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152990.282632; Thu, 08 Jul 2021 10:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Rdb-0005Qk-P6; Thu, 08 Jul 2021 10:52:11 +0000
Received: by outflank-mailman (input) for mailman id 152990;
 Thu, 08 Jul 2021 10:52:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mEkc=MA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m1Rda-0005Qe-9F
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 10:52:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2eebbe15-09cd-4348-84ed-2edcc1f9c49f;
 Thu, 08 Jul 2021 10:52:09 +0000 (UTC)
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
X-Inumbo-ID: 2eebbe15-09cd-4348-84ed-2edcc1f9c49f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625741529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3HBLD4vlwTbkOgi6R/w1pduAtFCNCy+QJS7RYM7kHlE=;
  b=f6NXYpdDU9RZ4gFBwXYDU+K63ZMCxGoZv9nVSpQpYox2bu1K+5J+Bstr
   5Hhwhh/eHQiZG9XkaZspxB0uqsyK8ECDF8FG2mIrcs6SDz5ERJZAY+4Vm
   8U2+uirUfD1Mdl051NAaWsoNBqPHn6VB5CneQ4T4N9gDDG1ZYRIVBf5z4
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3KdEPvKP31zCDsRBC1io33jvNVVAyRFP1gC6FYboLFiKb4cWH27ZkJIfEGz4hFlKgYWQJ2l/R8
 QklRZvAOQ9HmJhEA5llTy/k9VKXmAPvqXJp1lU6b3ZUduvQl/q9trZuAEBBrgnB7uKITAMel4l
 ixLep7nk9jT1M01MYIUCbjinDhfP0wfmgbEH/airAfej3HUyPJPzRUMB3cK7zDhkXVBk68hK2e
 dJV/o19calk5xgKlvpOaSv0ou3i/UbrQHw9iVewB7tsUZsxulCYDnpiQksBNib4NcLdEhWkUos
 iFs=
X-SBRS: 5.1
X-MesageID: 47827284
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rQahdqHO+6k5S+VopLqE0MeALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZMgpHnJYVcqKRUdcL+7VJVoLUmyyXcx2/hpAV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyJMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47827284"
Date: Thu, 8 Jul 2021 11:52:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <YObY02T0Mhnw82DS@perard>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
 <20210707164001.894805-3-anthony.perard@citrix.com>
 <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>

On Wed, Jul 07, 2021 at 06:46:03PM +0100, Andrew Cooper wrote:
> On 07/07/2021 17:40, Anthony PERARD wrote:
> > ninja is now required to build the latest version of QEMU, some
> > container still don't have ninja and attempting to add it breaks the
> > build for different reasons, so QEMU will be skip on those containers.
> >
> > Failures:
> > - ubuntu/xenial:
> >     fatal: ninja version (1.5.1) incompatible with build file ninja_required_version version (1.7.1).
> > - debian/unstable-i386: (debian-unstable-32)
> >     /build/tools/flask/policy/Makefile.common:115: *** target pattern contains no '%'.  Stop.
> > - suse/opensuse-tumbleweed:
> >     failed to build iPXE
> > - debian/unstable:
> >     update of the container fails with:
> >         The following packages have unmet dependencies:
> >          clang-8 : Depends: libstdc++-8-dev but it is not installable
> >                    Depends: libgcc-8-dev but it is not installable
> >                    Depends: libobjc-8-dev but it is not installable
> >                    Recommends: llvm-8-dev but it is not going to be installed
> >                    Recommends: libomp-8-dev but it is not going to be installed
> 
> Only the first failure seems to be related to ninja.
> 
> The second is a known bug which still needs addressing.  Our build
> system's logic to cope with `checkpolicy` being absent doesn't work.
> 
> Tumbleweed is generally broken and fails at ./configure due to missing
> compression libraries.  It is quite possible that the iPXE failure is
> related.
> 
> The final one is probably because unstable has dropped clang-8.  The
> container hasn't been rebuilt in a while because we still haven't got
> auto-rebuild sorted.


So those containers are ones that I've noticed needed ninja (as found
out by looking at a single pipeline), but one which trying to install
ninja and thus rebuilding the container mean that the build was broken.
I just didn't want to spend time trying to fix issues that should have
been found out by a regular rebuild of the containers. So I've just
listed the reason there and moved on.

-- 
Anthony PERARD

