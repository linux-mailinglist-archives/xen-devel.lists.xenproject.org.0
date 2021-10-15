Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952342F870
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 18:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210906.367934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQFl-0002uc-Th; Fri, 15 Oct 2021 16:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210906.367934; Fri, 15 Oct 2021 16:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQFl-0002rQ-Pv; Fri, 15 Oct 2021 16:40:17 +0000
Received: by outflank-mailman (input) for mailman id 210906;
 Fri, 15 Oct 2021 16:40:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHjW=PD=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mbQFk-0002rK-H5
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 16:40:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec234d89-e7e0-48f2-a531-038a75bd7c66;
 Fri, 15 Oct 2021 16:40:15 +0000 (UTC)
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
X-Inumbo-ID: ec234d89-e7e0-48f2-a531-038a75bd7c66
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634316015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7EuQzF1NmHI5sC5AWUR4MvnHSVxNTDge7GmFe8zrq/Y=;
  b=PZGFo2wcDv95n9GjSRgwozct06AUmuFF42Pcq5VNyib7/qBq6AbJE8+d
   Ma/a1/r9lgfRxhnTHpSXpZpEGk3VCjZoBllO7NjjRbWrGkdl6oZfA9Csm
   04YIC7Yn3kSOWduO/8oxxnEpzyEXUlM2Ib0on6NQEaKCB/LBAij4LlK53
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2HOaOchfJ5rM1R9ndb9Gv9yjZHXxL2MSWDlL8X+mv7o0dLtWnZBYJI4Fau1QBanBE0cooSk4ML
 gF5sikEbBeRZU5n9z5o8QJimU5ml1sydAch2JIodzk1hRFQGfgX+NkVwUooRG016xQ3SQcBNYD
 4MZvEnZ8kwua8evGndFpYIxXfbMNnUgUuM8bbLqm0iDAjL7KsmgKCFIiV8jegPgngKQMcTIxEh
 trE6F9g14Nx2+8dT4Vg+Pe/xA1tv/6P+Yaz1Hm0ENhUdC5ZjOo5u4MUHpW+QIDKV+pu4b30K1P
 Y9kO6p1p+B2LN2nGKa0zCnL3
X-SBRS: 5.1
X-MesageID: 55336042
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VCDINaAEm+GtbBVW/13lw5YqxClBgxIJ4kV8jS/XYbTApG4n0jZWx
 2ZJXDqGP/6IZWKge991boq+pEpSscKGzdVgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550E87wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/2x+Qx4phy
 sd36aOVcQIXJqPmxMBeakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFgWxr2JgSR54yY
 eIHMWMoMwjHUiZAHUU8WLNi37aag1DWJmgwRFW9+vNsvjm7IBZK+LvqNsDcdpqVRMFWtkGCr
 2nC8iLyBRRyHOKYzT2J43e9nNjllCnwWJ8RPLCg//ssi1qWrkQfBxEbWkGyieWogU65HdREI
 gob/TRGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xCnAfSz9daPQvrMIsWSExz
 ViNgs/oAjp09raSTBq196iWhSO/PzAPKm0PbjNCShEKi/HhqowuihPETv54DbW4yNbyHFnYw
 S2OrSU4r6Uei4gMzarT1U/DqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxc7Wal
 CFawY7EtrlIVMzT0nzWKAkQIF23z6avKWWGkVx9JcUe0gyoxWatV9x0owgrcS+FLf04UTPuZ
 UbSvyZY65lSIGamYMdLXm6hNyg55fO/TYq9B5g4evILO8IrLFbWo0mCcGbJhzi1+HXAh53TL
 ntynSyENn0dFbh8hAS/Q+MQwNfHLQhvmDuNG/gXI/mhuIdyhUJ5q59ZbzNijchjtctoRTk5F
 f4EaqNmLD0FAYXDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4Jdc5xf8PzbqRr
 ivjMqO99LYZrSaaQeltQis7AI4DoL4l9S5rVcDSFQfAN4cfjXaHs/5EKspfkUgP/+1/1/9kJ
 8TpiO3basmjvg/vomxHBbGk9dQKXE3y2WqmYnr0CBBiLsUIb1GYpbfZkv7HqXBm4tyf7pBl/
 dVNF2rzHPI+euiVJJ2INaz1lgjv4CF1dSAbdxKgH+S/sX7EqOBCQxEdRNdtSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:22qOq6k/IWs/N9GlT7UynaOib3DpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.85,376,1624334400"; 
   d="scan'208";a="55336042"
Date: Fri, 15 Oct 2021 17:40:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Daniel
 De Graaf" <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 47/51] build: Rework "clean" to clean from the
 root dir
Message-ID: <YWmu4/3VpvAXoG30@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-48-anthony.perard@citrix.com>
 <f29750b5-7028-3ec5-5bef-4c4480032a18@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f29750b5-7028-3ec5-5bef-4c4480032a18@suse.com>

On Thu, Oct 14, 2021 at 11:44:00AM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > This will allow "clean" to work from an out-of-tree build when
> > it will be available.
> > 
> > Some of the file been removed in current "clean" target aren't added
> > to $(clean-files) because they are already listed in $(extra-) or
> > $(extra-y).
> > 
> > Also clean files in "arch/x86/boot" from that directory by allowing
> > "clean" to descend into the subdir by adding "boot" into $(subdir-).
> 
> "descend into" (also used in a respective comment) looks contrary to
> doing everything from the root now, at least to me.

That's the language that Kbuild uses. While it is true that we don't
change directory, we still do the build of one directory at a time, and
the build system as its own understanding of what the current directory
is, even if it is different from $(CURDIR).

> > --- a/xen/scripts/Kbuild.include
> > +++ b/xen/scripts/Kbuild.include
> > @@ -98,7 +98,7 @@ build := -f $(srctree)/Rules.mk obj
> >  # Shorthand for $(MAKE) clean
> >  # Usage:
> >  # $(MAKE) $(clean) dir
> > -clean := -f $(abs_srctree)/scripts/Makefile.clean clean -C
> > +clean := -f $(srctree)/scripts/Makefile.clean obj
> 
> Doesn't the comment want changing as well?

Indeed,

Thanks,

-- 
Anthony PERARD

