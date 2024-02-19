Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B185A773
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683003.1062302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5ew-0000qO-KM; Mon, 19 Feb 2024 15:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683003.1062302; Mon, 19 Feb 2024 15:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5ew-0000od-HU; Mon, 19 Feb 2024 15:34:22 +0000
Received: by outflank-mailman (input) for mailman id 683003;
 Mon, 19 Feb 2024 15:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wBJ7=J4=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rc5ev-0000oV-J1
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 15:34:21 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57e6896f-cf3c-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 16:34:19 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 41JFY2sT024254
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Feb 2024 10:34:08 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 41JFY2r5024253;
 Mon, 19 Feb 2024 07:34:02 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 57e6896f-cf3c-11ee-8a52-1f161083a0e0
Date: Mon, 19 Feb 2024 07:34:02 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
        Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Stats on Xen tarball downloads
Message-ID: <ZdN06v1k3E8xarLY@mattapan.m5p.com>
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, Feb 19, 2024 at 06:01:54PM +0800, George Dunlap wrote:
> 
> Looking at the *non*-4.18 downloads, nearly all of them have user
> agents that make it clear they're part of automated build systems:
> user agents like curl and wget, but also "Go-http-client", "libfetch",
                   ^^^^     ^^^^

I reject this claim.  `curl` or `wget` could be part of an interactive
operation.  Telling a browser to copy a URL into the paste buffer, then
using `wget`/`curl` is entirely possible.  I may be the outlier, but I
routinely do this.

I don't know whether Gentoo's `emerge` uses `wget`/`curl`, but that could
be semi-interactive.


> It's not really clear to me why we'd be getting 300-ish people
> downloading the Xen 4.18.0 tarball, 2/3 of which are on Windows.  But
> then I'm also not sure why someone would *fake* hundreds of downloads
> a week from unique IP addresses; and in particular, if you were going
> to fake hundreds of downloads a week, I'm not sure why you'd only fake
> the most recent release.

Remember the browser wars?  At one point many sites were looking for
IE/Windows and sending back error messages without those.  Getting the
tarball on Windows doesn't seem too likely, faking the browser was
pretty common for a while.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



