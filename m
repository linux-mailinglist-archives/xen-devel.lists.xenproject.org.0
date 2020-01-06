Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C72A131B17
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 23:12:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioaZF-0005pS-8w; Mon, 06 Jan 2020 22:09:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ioaZE-0005pN-3t
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 22:09:44 +0000
X-Inumbo-ID: 3df88010-30d1-11ea-88e7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3df88010-30d1-11ea-88e7-bc764e2007e4;
 Mon, 06 Jan 2020 22:09:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D40B0207FD;
 Mon,  6 Jan 2020 22:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578348583;
 bh=CGMvGO5qgbyvjluic0OFn2wgjI5LWbFB35zrYsNEprg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2tKevtVcnSrGqh+J4RGATBz/awyb47vRgZz93Lwp7B9d5RSYO6huB/m4K6VQglobe
 WoJ8AHdtPZOTFJhbxFtdCuFQY0d7R2/Cy2NB2N60XqQhRaEZjxEa4OrzmQERG9jBr5
 0mnOO7RxSDUTCmhar5mDc1N35R0Kkbskbl5DIp1w=
Date: Mon, 6 Jan 2020 14:09:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <0BDF4017-822C-45E2-9374-6ED3B7424787@citrix.com>
Message-ID: <alpine.DEB.2.21.2001061408050.732@sstabellini-ThinkPad-T480s>
References: <0BDF4017-822C-45E2-9374-6ED3B7424787@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-894946919-1578348583=:732"
Subject: Re: [Xen-devel] [RFC] Integrate CoC, Governance,
 Security Policy and other key documents into sphinx docs
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
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-894946919-1578348583=:732
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 18 Dec 2019, Lars Kurth wrote:
> Hi all,
> 
> now that 4.13 is out of the way I wanted to get the CoC discussion closed - see https://lists.xenproject.org/archives/html/xen-devel/2019-12/threads.html#00926, which means I need ACKs or final suggestions. The next step would be to publish it on the website.
> 
> However, I have also been thinking about keeping some documents in multiple places and defining a *master* copy somewhere in a tree. Right now, these are a few personal repos that I own, which seems unnecessary, given that we have the sphinx docs. In the interest of improving the docs, we also need more useful content in the docs to guide people to them.
> 
> My proposal would be to move the master sources for a number of key process docs to xen.git:/docs maybe under a "Working with the Xen Project community" in a process-guide directory. 
> This would then include content from
> • http://xenbits.xen.org/gitweb/?p=people/larsk/governance.git;a=summary
> • http://xenbits.xen.org/gitweb/?p=people/larsk/security-process.git;a=summary
> • http://xenbits.xen.org/gitweb/?p=people/larsk/code-of-conduct.git;a=summary
> 
> and we could also consider including some of the wiki pages related to contribution workflow and re-direct the pages.
> 
> We would need to answer some questions, such as
> a) Are we OK with these staying in markdown - I don’t mind converting

As it looks like we are standardizing on RST we might as well use it. I
expect very little conversions should be required from the dialect of
markdown we are currently using.


> b) Are we OK with some of the documents needing project wide agreement before they can be changed, specifically this would cover
> - governance.git
> - code-of-conduct.git:code-of-conduct.md
> - code-of-conduct.git:communication-guide.md

Yes, of course, as it is already the case today (although the docs are
not stored in xen.git)
--8323329-894946919-1578348583=:732
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-894946919-1578348583=:732--

