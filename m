Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7916BDE04
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:20:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6EH-0002js-6n; Wed, 25 Sep 2019 12:17:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5mKa=XU=gmail.com=festevam@srs-us1.protection.inumbo.net>)
 id 1iD69T-0002eO-JN
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:12:11 +0000
X-Inumbo-ID: b326493e-df8d-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by localhost (Halon) with ESMTPS
 id b326493e-df8d-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 12:12:10 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m7so5398890lji.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUmVUwvSY/aeCErtOWtkiU7kxhgjU/DkZwXUVKfeXYI=;
 b=e0naPQpnh4JE/4pzdBeJlRoIgqUi6C/PmOHgsKHfsCSmwrfN9C/j9k46bbLakdQgtK
 NzyyALh2M4uqHkB4On8gEHIrvbwKUNNiu3zZ2lOeoXUiFudrKwoaCTbU97PgilT1l5iG
 BNvpNxJ3L2WwmKsrub8I/gHS221tUzLfviv94tbG+vMGMDoFLa5u8CB7VOGTEKPYce1l
 Cf3u6sYzxHRkaIjp/6i4jUz79T0kliSiD1RIQYnsEdRcWu0lLuAcfKmvxGsweCWvJ0nX
 0eOjvMQ1r+HHshdYbA3cDvsghoueNpOxeniug7pMPTULgl1lMmy+tRc55+GZxrbOt31A
 IWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUmVUwvSY/aeCErtOWtkiU7kxhgjU/DkZwXUVKfeXYI=;
 b=hRjbYG29BhVGwyAwsRAdCs/1glWp1fSCqjlGufTQvQEruo2OwYNDopdmMR5J0YfOAB
 FEavl0bMrl+UXjXD6CypV/HQmTQpqojb+m+KgPOKnfe0ddSc4OQBlC7OLpKQJBQINIUS
 9n0e7WFkpPDTx8aZvWYBgRxxElYjnbHV8LZFbYAxOs4MyoHUcXxSaE6BFxTjstRU+MEZ
 9EOZ52/3Zz+yJmyNdOaaCwJ9lxhzzB/I9ysYkFtfXW+aLxDSu9A0IawF0q3N5xV+JxFM
 CqTyLvoHbpDdJLta+1avDRVi8SttXMxafucHw0+SJa+2CINxU2dHKvQZjcDEPgdvT3r9
 jvjQ==
X-Gm-Message-State: APjAAAWCn4fgPW3zsXxy13KyoHYHvDSGkrNpk2oz+QrJl0DkQolW3web
 0Gq6b7cNTeDFGAjFiLTZsSG1zpUEkvzUnmkZ+4k=
X-Google-Smtp-Source: APXvYqyQ9DDK1T7Dnq+bpI71Ik4P0Io7FbZdAq9brFueaElkRY2A7GJR4saQwrvMTiDWN1ujjgcBluE//8NebHfr57o=
X-Received: by 2002:a2e:a316:: with SMTP id l22mr6207823lje.211.1569413529490; 
 Wed, 25 Sep 2019 05:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
In-Reply-To: <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Sep 2019 09:12:18 -0300
Message-ID: <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
X-Mailman-Approved-At: Wed, 25 Sep 2019 12:17:08 +0000
Subject: Re: [Xen-devel] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWRhbSwKCk9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDY6MzggQU0gQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+IHdyb3RlOgoKPiBJIGtub3cgaXQncyByYXRoZXIgbGF0ZSwgYnV0IHRo
aXMgcGF0Y2ggYnJva2UgdGhlIEV0bmF2aXYgM0QgZ3JhcGhpY3MKPiBpbiBteSBpLk1YNlEuCj4K
PiBXaGVuIEkgdHJ5IHRvIHVzZSB0aGUgM0QsIGl0IHJldHVybnMgc29tZSBlcnJvcnMgYW5kIHRo
ZSBkbWVzZyBsb2cKPiBzaG93cyBzb21lIG1lbW9yeSBhbGxvY2F0aW9uIGVycm9ycyB0b286Cj4g
WyAgICAzLjY4MjM0N10gZXRuYXZpdiBldG5hdml2OiBib3VuZCAxMzAwMDAuZ3B1IChvcHMgZ3B1
X29wcykKPiBbICAgIDMuNjg4NjY5XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEzNDAwMC5ncHUg
KG9wcyBncHVfb3BzKQo+IFsgICAgMy42OTUwOTldIGV0bmF2aXYgZXRuYXZpdjogYm91bmQgMjIw
NDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+IFsgICAgMy43MDA4MDBdIGV0bmF2aXYtZ3B1IDEzMDAw
MC5ncHU6IG1vZGVsOiBHQzIwMDAsIHJldmlzaW9uOiA1MTA4Cj4gWyAgICAzLjcyMzAxM10gZXRu
YXZpdi1ncHUgMTMwMDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+IG1lbW9y
eSB3aW5kb3cKPiBbICAgIDMuNzMxMzA4XSBldG5hdml2LWdwdSAxMzQwMDAuZ3B1OiBtb2RlbDog
R0MzMjAsIHJldmlzaW9uOiA1MDA3Cj4gWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0MDAw
LmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+IG1lbW9yeSB3aW5kb3cKClRoaXMg
bG9va3Mgc2ltaWxhciB0byB3aGF0IHdhcyByZXBvcnRlZCBhdDoKaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNzg5CgpEb2VzIGl0IGhlbHAgaWYgeW91IHVz
ZSB0aGUgc2FtZSBzdWdnZXN0aW9uIGFuZCBwYXNzIGNtYT0yNTZNIGluIHlvdXIKa2VybmVsIGNv
bW1hbmQgbGluZT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
