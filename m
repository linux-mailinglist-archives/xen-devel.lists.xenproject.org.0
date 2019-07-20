Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17166ECF2
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jul 2019 02:12:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hocw6-0003sZ-Vh; Sat, 20 Jul 2019 00:09:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Ldd=VR=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hocw5-0003sU-QR
 for xen-devel@lists.xenproject.org; Sat, 20 Jul 2019 00:09:13 +0000
X-Inumbo-ID: 99ba54b6-aa82-11e9-8980-bc764e045a96
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 99ba54b6-aa82-11e9-8980-bc764e045a96;
 Sat, 20 Jul 2019 00:09:12 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r9so32295850ljg.5
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 17:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6u+6TZNmsJCLvposSEQoVlRgUQMwAQxFxZCW9TCUaZQ=;
 b=l8/09XFZBiJXTh37Kt9bbZmdsM8t4N5s54CK/1NXlUzHqm/mTczyPBy1G/WKm4eXFl
 hT71/JdKCmNup7TBiChi3aM7a0s0psPp/izp92POeqVu7X5f8ROrLVjBbn+zab9RD9If
 Ep721v0J3O1iYb88UvKvyCL/nt2bKywx3iKREmYWDCLI5sA3+os2qlyu3u+OegEXExtA
 1+EgrKynI9DznZfNZLSj718DEZp4mid+Uk3ailON5TaoQLk3NzAaldSjvekBnVdTCJs+
 yttQJTstMHyrSXdp6uRECD25XbfEC7aoBl4nluRxwcriLL3vx+dl/X4AMv/XGYN6xlgm
 N3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6u+6TZNmsJCLvposSEQoVlRgUQMwAQxFxZCW9TCUaZQ=;
 b=n90/6PNCUcNGBpaT46eyPDGtnwdVP/wu7fZxmk/xKFpegk6Mb7uStQfinY6hM/qh0+
 6rLHPxo2WxnBFXTbxsjmB4rGypEKegnZANXxtUoNLpgDwDdL7qJabrIhvdp4cd+qff8n
 GHHUmmEwpFX0iiAcEOOJpFuq4INfc5jjyxVbzSx/mVEHsiwv6bt3Sdrbta+is3A07Var
 NBXWHnNFmgfk0edt36W9BNhb8E6EIuckrqLBi8IToL6NG5hQ/nD55DCxNWmKVJf/6Pxd
 ZDKZVj9aRX+Ti4Ba/L5stSOOl2jHLxzoN9THK3ctwi3Vi4ZEgAO2JwZnOCfjxXta5SJQ
 UgYQ==
X-Gm-Message-State: APjAAAWh23gOKnKt0isate9WlnkYpMzUCqJHqRYuvGptEMOp96gXuW8+
 TGWraC0unKL/gRS6cJ21gMISadtmXYcbDBHZG5k=
X-Google-Smtp-Source: APXvYqwvoOlVKBG68lnNrmA0j0wUsHoA4i4k54IRgGFLTnFZBb97fBt2kUfYYyCCrpVal3enYoVlQw73rP+7o+7YSTM=
X-Received: by 2002:a2e:8801:: with SMTP id x1mr28448905ljh.1.1563581350815;
 Fri, 19 Jul 2019 17:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
In-Reply-To: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 19 Jul 2019 17:08:58 -0700
Message-ID: <CACMJ4Gb723LMigs6buySxfvZOe7J27mvJ+DDL_JT_M8xLpjQJg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoyNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gQWxsLAo+Cj4gdGhlIHJlbGVhc2UgaXMgZHVlIGluIGVhcmx5IEF1
Z3VzdC4gUGxlYXNlIHBvaW50IG91dCBiYWNrcG9ydHMgeW91Cj4gZmluZCBtaXNzaW5nIGZyb20g
dGhlIHJlc3BlY3RpdmUgc3RhZ2luZyBicmFuY2gsIGJ1dCB3aGljaCB5b3UKPiBjb25zaWRlciBy
ZWxldmFudC4KClBsZWFzZSBjYW4gdGhlIGZvbGxvd2luZyBiZSBhZGRlZCB0byB0aGUgYnJhbmNo
OgoKNDgwODAwYzc2OQphcmdvOiB3YXJuIHNlbmR2KCkgY2FsbGVyIHdoZW4gcmluZyBpcyBmdWxs
Cgo4OTY2YTNlOWFiCmFyZ286IGNvcnJlY3RseSByZXBvcnQgcGVuZGluZyBtZXNzYWdlIGxlbmd0
aAoKN2FiZDdjMjFiOQphcmdvOiBzdXBwcmVzcyBzZWxlY3QgbG9nZ2luZyBtZXNzYWdlcwoKVGhh
bmtzLAoKQ2hyaXN0b3BoZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
