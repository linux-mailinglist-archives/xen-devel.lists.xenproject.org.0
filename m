Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9E1AAA1E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:39:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOjBV-00039I-Cp; Wed, 15 Apr 2020 14:38:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NCA0=57=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jOjBU-00039D-G0
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:38:36 +0000
X-Inumbo-ID: c8d7f050-7f26-11ea-8a66-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8d7f050-7f26-11ea-8a66-12813bfff9fa;
 Wed, 15 Apr 2020 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586961515;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W/vEx8KsduErsNlL8PiwbvayjZsx229DOAm8s5Tgb2Y=;
 b=Fa5dwHvhbTBjTq1HnQxce0d5kSWnvkN6hCdteHPaGcPkhgNbcQdC0Ud5
 XiFP+3x+1zgu2tsBciunk2HF3ytUKz1N1UE+5to9zZGeTjS4pH8uzur2f
 GH/ZiCnFIYCAJVo/ikl+b+ixYiZRD70rMi78R3spM1QYoLI7Zyv9ikqIB k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: haw2DRn+qNmt+yZNhDqHIt/lb4B8PLWH9PF3hQo3gsFZ6vssf3YfwZxXks4UfojIxGMXYQoJhh
 Mp0DaCd15JnjljiZeQGtaJf5QtfC5olTRQR7Mbpuekd2K+CjKamnhvJkXFPn/1q6MVd43RWTlG
 I1eyNvd/auZLi0O2a+5AB1MDqLuuwfiIo2ddSqA+arDhwt1XgZKDmwkc0OgSYicKv6YhYzBeYB
 DddYpFy+wEKMVZcUegtBSnQefbCp5Wg42/xh7PPPW5y3h7BS4Pl/n6V8mSs/0t6eKhQf3XWcum
 a10=
X-SBRS: 2.7
X-MesageID: 15733450
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="15733450"
Date: Wed, 15 Apr 2020 15:38:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 07/18] build: Introduce documentation for xen
 Makefiles
Message-ID: <20200415143828.GC4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-8-anthony.perard@citrix.com>
 <0a5f89d5-de77-c548-972f-231061419e51@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a5f89d5-de77-c548-972f-231061419e51@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 02:00:43PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:30, Anthony PERARD wrote:
> > This start explainning the variables that can be used in the many
> > Makefiles in xen/.
> > 
> > Most of the document copies and modifies text from Linux v5.4 document
> > linux.git/Documentation/kbuild/makefiles.rst. Modification are mostly
> > to avoid mentioning kbuild. Thus I've added the SPDX tag which was
> > only in index.rst in linux.git.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one question:
> 
> > +Compilation flags
> > +-----------------
> > +
> > +    CFLAGS-y and AFLAGS-y
> > +	These two flags apply only to the makefile in which they
> > +	are assigned. They are used for all the normal cc, as and ld
> > +	invocations happening during a recursive build.
> > +
> > +	$(CFLAGS-y) is necessary because the top Makefile owns the
> > +	variable $(XEN_CFLAGS) and uses it for compilation flags for the
> > +	entire tree. And the variable $(CFLAGS) is modified by Config.mk
> > +	which evaluated in every subdirs.
> > +
> > +	CFLAGS-y specifies options for compiling with $(CC).
> > +	AFLAGS-y specifies assembler options.
> 
> Is it perhaps worth mentioning that c_flags and a_flags should
> not be fiddled with by individual Makefile-s?

No, I don't think that's needed. Outside of Rules.mk-s nothing modifies
c_flags, so there isn't a good reason to modify CFLAGS via c_flags
after looking for other examples.
If they do change c_flags anyway, I don't think they would have read
that new documentation.

Thanks,

-- 
Anthony PERARD

