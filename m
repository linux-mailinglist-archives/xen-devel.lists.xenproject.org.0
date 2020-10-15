Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DEA28EBE7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 06:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7082.18551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSuUZ-0002uI-W2; Thu, 15 Oct 2020 04:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7082.18551; Thu, 15 Oct 2020 04:03:51 +0000
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
	id 1kSuUZ-0002tt-TA; Thu, 15 Oct 2020 04:03:51 +0000
Received: by outflank-mailman (input) for mailman id 7082;
 Thu, 15 Oct 2020 04:03:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jCZ5=DW=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kSuUY-0002tn-Ma
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 04:03:50 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a64a43c-88ac-4e1e-9c8b-dbdfa0cb3424;
 Thu, 15 Oct 2020 04:03:49 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09F43dP5007398
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 15 Oct 2020 00:03:45 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09F43d4B007397;
 Wed, 14 Oct 2020 21:03:39 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jCZ5=DW=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kSuUY-0002tn-Ma
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 04:03:50 +0000
X-Inumbo-ID: 2a64a43c-88ac-4e1e-9c8b-dbdfa0cb3424
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2a64a43c-88ac-4e1e-9c8b-dbdfa0cb3424;
	Thu, 15 Oct 2020 04:03:49 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09F43dP5007398
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 15 Oct 2020 00:03:45 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09F43d4B007397;
	Wed, 14 Oct 2020 21:03:39 -0700 (PDT)
	(envelope-from ehem)
Date: Wed, 14 Oct 2020 21:03:39 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
        Ian Jackson <iwj@xenproject.org>
Subject: Re: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python
 build process
Message-ID: <20201015040339.GB5803@mattapan.m5p.com>
References: <20201012011139.GA82449@mattapan.m5p.com>
 <20201013132606.7ff35mmpesklbmcx@liuwe-devbox-debian-v2>
 <20201015010259.GR151766@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015010259.GR151766@mail-itl>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Oct 15, 2020 at 03:02:59AM +0200, Marek Marczykowski-G??recki wrote:
> On Tue, Oct 13, 2020 at 01:26:06PM +0000, Wei Liu wrote:
> > On Sun, Oct 11, 2020 at 06:11:39PM -0700, Elliott Mitchell wrote:
> > > Having looked around a bit, I believe this is a Python 2/3 compatibility
> > > issue.  "distutils" for Python 2 likely lacked a separate $LDSHARED or
> > > $LD variable, whereas Python 3 does have this.  Alas this is pointless
> > > due to the above (unless you can cause distutils.py to do the final link
> > > step separately).
> > 
> > I think this is well-reasoned but I don't have time to figure out and
> > verify the details.
> 
> Yes, it looks like distutils in Python 2 was even more limited than
> the one in Python 3.

Actually feels like two steps forward, one step back.  Separate
$LDSHARED, yet $CFLAGS is appended to $LDFLAGS during invocation.

Architecture name is included the output Python extension filename, yet
the only way to override requires writing Python code.  I've got ideas
to workaround this, but they're rather gross.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



