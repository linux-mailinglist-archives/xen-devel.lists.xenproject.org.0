Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7621F9939
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 15:45:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpPj-0004ZR-88; Mon, 15 Jun 2020 13:44:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkpPh-0004ZM-PG
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 13:44:37 +0000
X-Inumbo-ID: 59edc9f4-af0e-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59edc9f4-af0e-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 13:44:36 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gR2qyDqKKdvLukNS3333WdjMUNCY5Qx8IyMuFOQvmE7Y736g2SI7Vt4sYAOoyBFZcA15Xbc/Se
 MtZ51YV5EekUQdKumefw5rktkLMsiUhdK18MXdEl8uNKzzLi+3uSqtATi8f/Zj0ufF9GaCw7gr
 LTdNRyfJa9TQC7vBGIKIz8SFpwcBMKms2HyhY4WdvWsTJMwbpm0H9D/u9XHBiWWoJUqG0aOjMv
 DRQ2zOkg6VODx8uIdYyldUn2BUhGX86Oqc9tE5celOhbWOsAT1gG27niVLU0LEZKGeYVJliKWV
 mWY=
X-SBRS: 2.7
X-MesageID: 20835255
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20835255"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24295.31551.406528.629952@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 14:44:31 +0100
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved) [and 1 more
 messages]
In-Reply-To: <becfad2d-01fd-2559-7fb4-837a9d71eb42@citrix.com>,
 <3c68a609-a069-f7e1-3c99-291da372df96@suse.com>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
 <24291.45488.423085.940252@mariner.uk.xensource.com>
 <3c68a609-a069-f7e1-3c99-291da372df96@suse.com>
 <becfad2d-01fd-2559-7fb4-837a9d71eb42@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved)"):
> On 12/06/2020 17:47, Ian Jackson wrote:
> > Ian Jackson writes ("Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved)"):
> > I think that's
> >
> >    lz4: fix system halt at boot kernel on x86_64
> >    14b62ab3e5a79816edfc6dd3afce1bb68c106ac5
> >    master commit: 5d90ff79542ab9c6eebe5c315c68c196bcf353b9
> >
> >    lz4: refine commit 9143a6c55ef7 for the 64-bit case
> >    6561994b87af3e9cd28ee99c42e8b2697621687d
> >    master commit: 2d7572cdfa4d481c1ca246aa1ce5239ccae7eb59
> >
> > Anyone have any objection to me sending those to 4.10 and maybe 4.9 ?
> > They apply cleanly in both cases.
> 
> Ah - you found them faster than I did.  Yes - these were the ones I was
> thinking of.
> 
> No objections.

Thanks.

Jan Beulich writes ("Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved)"):
> Seeing the other pieces that have been put onto these old branches
> recently, it's probably fine to add the two ones here as well. In
> general, as mentioned before, I view it as wrong to put non-
> security fixes onto the security-only branches.

Yes.  I can see why this is not ideal.

> But since I can see why changes to address newer compilers' changed
> behavior may be wanted/needed, I guess the ones here fall into a
> pretty similar group.

However, as a practical matter, I think it is probably a good idea to
enable (i) us to test these branches with an up-to-date CI setup (ii)
people to be able to build it with modern compilers.

So I think in general I am saying that narrow and low-risk build fixes
are reasonable backport candidates.

Thanks to both for your opinions.  I have pushed those two to 4.10 and
will see how things go.  I may send them to 4.9 too.

Ian.

