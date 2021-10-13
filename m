Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755D42BCF6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 12:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208207.364252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabcn-0003ik-16; Wed, 13 Oct 2021 10:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208207.364252; Wed, 13 Oct 2021 10:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabcm-0003h0-U2; Wed, 13 Oct 2021 10:36:40 +0000
Received: by outflank-mailman (input) for mailman id 208207;
 Wed, 13 Oct 2021 10:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVjq=PB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mabcl-0003gs-SQ
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 10:36:39 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71d17df0-2c11-11ec-816a-12813bfff9fa;
 Wed, 13 Oct 2021 10:36:38 +0000 (UTC)
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
X-Inumbo-ID: 71d17df0-2c11-11ec-816a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634121398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5u5BEcgaPBBpZnTc6KcywShDLysumq7kVv4GBGzllhE=;
  b=bmwlNxCKglcC/UnKCQz/QCKY4VieOqmZGJiHnSR8IvW9v5OyJjLkl/14
   WWJhSI4EdchurZNN7TuVw7INuUqa5GWHL8Mw6qOs0yjag9iqWmdpIeJVf
   ZDKEnLzE4H8OFMk0I41VikCJG4ydkAdiZk5WuSruAHz04DaUAegdfs+gu
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xOFO/qPGQcgcxIx7jQQQM1Q5hFk0xET3o7oYDMGAOueRU96O0gHsYMtxhbVJsCq6rrd4IbZIel
 8QejCeUHimKb/7f2U/4Dn8Dcu5+dA90M/4oRJcGSjs6lMX6EcoCha3iz7zMU13Ps0/QIo4Twg4
 XTq/OA/46BJA27OyGrl51XAXc92OeXUcHLj7PllQrkSGyDU4C+sWUHD+wMIAWgZ3WPTkps1bpH
 hxqmg2++j8uBTS/gM9o9W+PYRoGc3tIB/EoLeu721bKMJ6U5GKLeDARVG0yVTnZqEjl0+p2KNN
 vh+MBdaX7wChLiugObx77mGm
X-SBRS: 5.1
X-MesageID: 55058912
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wTjlW6qiThC7sGEke7XN0n24dt9eBmKVYhIvgKrLsJaIsI4StFCzt
 garIBmAM/qIZjb8L98nbo2390tQuZPcx4NqSAM+pHo0FyNA85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHiW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbe7Rzp5BI6Qo9o+diZ3PxtMZfEc3oaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 pdBNGo+NU6ojxtnZVtLWc88ke6UrVbdSxRYkRGKm5h02j2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3E6hQ8T5Xha4iGWZpRNaUN1Ve8U79wOl2qfS+xyeBGUPUnhGctNOnM0rQT0n0
 HeZktWvAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHIq48O3ijsEu1dM4uKofHPK2msm
 Raz+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiO9b7P93ABUzzqK8adt7AHwbpU
 G0swpDGtIgz4YexeDthqQnnNIqi4OqZK3XiiFprEohJG9+FqiP7I944DN2TIi5U3ic4ld3BP
 BG7VeB5vsY70J6WgUlfON3Z5yMCl/mIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj3US5EVf4/lmbtG4/xNIPHIAhlmgs/orihnnyaPUe2PibJGd/pznPfBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07djg3wYwALcmu8aR/L7fbSiI/QT1JI6KBkNsJJt0+94wIx7igw
 51IchIBoLYJrSacclvih7EKQO6HYKuTWlpiZXZyYg3yhyR6CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtJa1s29xDFWbK/Sozd574oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdTFR5/CMv2ae60yw/jt3Yqh+8vDVDDJcNeeRuw/dEyeTDxlPI+P+oFNQ7HmmmBz
 w+TDBpB/bvNroY5/cPnn6eBq4v1QeJyElADRzvQ7KqsNDmc9W2mmNcSXOGNdDHbdWX15KT9O
 rkFk6CiaKUKxQ8YvZB9HrBnybMFy+Hu/7IKnB55GHjrbkiwDu8yKHexwsQS5LZGwaVUuFXqV
 xvXqMVaI7iAJOjsDEUVeFg+du2G2PwZxmvS4PAyLBmo7SN75uPaA0BbPh3Kgy1BNrpldogix
 L556sIR7gW+jDssM8qH0X8IpzjdcCRYXvV1rIweDa/qlhEvmwNLbpHrAyPr5I2CNodXOU4wL
 z7I3KfPitywHKYZn6bfwZQV4ddguA==
IronPort-HdrOrdr: A9a23:a9eIE631wSiFxpBpzwZ6QAqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="55058912"
Date: Wed, 13 Oct 2021 11:36:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 22/51] build: clean common temporary files from
 root makefile
Message-ID: <YWa2neA0zQSvkqn2@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-23-anthony.perard@citrix.com>
 <dd760c79-e761-3547-726a-4d7ee092d10f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dd760c79-e761-3547-726a-4d7ee092d10f@suse.com>

On Mon, Oct 11, 2021 at 01:41:16PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Trying to synthesize a description:
> 
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -382,6 +382,7 @@ _clean:
> >  	$(MAKE) $(clean) test
> >  	$(MAKE) $(kconfig) clean
> >  	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
> 
> This was effectively redundant with ...
> 
> > +		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
> >  		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
> >  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
> >  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> > diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
> > index 027c200c0efc..b6df9e861e6e 100644
> > --- a/xen/scripts/Makefile.clean
> > +++ b/xen/scripts/Makefile.clean
> > @@ -14,10 +14,8 @@ include Makefile
> >  subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
> >                $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
> >  
> > -DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
> 
> ... this and its use below.
> 
> >  .PHONY: clean
> >  clean:: $(subdir-all)
> > -	rm -f *.o .*.o.tmp *~ core $(DEPS_RM)
> 
> With the command gone, I think the :: should also be converted (back) to
> just : then. Then

"clean" has been a double-column rule for a long time. If we convert
this rule to a single-column we need to convert all "clean" target to
use single-column which would make this patch more complicated. So I
don't think we should make this change.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Assuming the patch is independent of the earlier still uncommitted ones
> (please confirm), I'd be happy to make the adjustment while committing
> - as long as you agree, of course.

The patch is independent of earlier one, although the context is changed
in one patch so wouldn't apply cleaning without git helps.
(context is changed in "xen: move include/asm-* to arch/*/include/asm")

Thanks,

-- 
Anthony PERARD

