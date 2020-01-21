Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3701442B4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:01:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwsA-0007tA-Gn; Tue, 21 Jan 2020 16:59:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aiGB=3K=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itws9-0007t2-8M
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 16:59:25 +0000
X-Inumbo-ID: 606704ce-3c6f-11ea-8e9a-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 606704ce-3c6f-11ea-8e9a-bc764e2007e4;
 Tue, 21 Jan 2020 16:59:24 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y8so1567979pll.13
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 08:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKEZ+rFgh1FXDkP8cH00GpTaydprdQJ7DPFD5gprERY=;
 b=RqRr+tCbOQ8WPX3stp52RVDkId//sCDJf9CO5sfgfRdLJabtk/wtA/I+5CohyNqFCM
 sESVIsO45yJDbUfUzJwGvO4soEqXyDNQvmKYv2KekJjMT+sJA8ZGb1/zDJxW0jHAcphZ
 elfg2ABbGho/RZGdVKbC7gc4XUqgj4TycaibpIGYNMR6khmF3N72ElZIP5P7bDMCP0qR
 Dh8saLSxKjQe04U8ywMDMegf+0nJqzajqP8ReOcFEy5vBdeCgWzSS3oil58GO9Rw46td
 uYGHfsd0DPW4RrpiXkaMOyxLBIOW+aEseGbj6invbd7DnvPALN459pFGPtao15wzENxm
 D2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKEZ+rFgh1FXDkP8cH00GpTaydprdQJ7DPFD5gprERY=;
 b=PHYJ3hh8zGLVcL+nIwwYONIg0qdaF4eu0H2SwrK7jY2YOqEe2nOqzaZpCNGLkgFX1Y
 vmCNULFVH2tc68Nv4EttYWc6gD75ubloQ/Td+XMMZFoUPtZIkwy10ZxW+y+lVp7CDme9
 ClEEfXvBPpyCWA9pxDDVauvZron0uZYSEUUzrylBjoj0CdeQopjKUFqvHxnoiz0K2Cky
 gwuApAOxgJF2iKeN9xIMBD2PYMFMItwjpo+TcsrHHn75C/g+uQKixhXA8q3XXsFfdMxG
 p12rDzFe7r05Gf+Tq5y6vL91ZgOboSCZqAMEqb9hlA2HRDgu4O+WnMuS2jpDcIbs/qTL
 R04g==
X-Gm-Message-State: APjAAAXHHiMjkdgsmgGftWVlrh03ca+tp3JeqnOHUG+y/ae7kXhHjwfx
 BBGEaNUHNuSrl0itfaxpX3zKfBYrKry5HyWAmrQ=
X-Google-Smtp-Source: APXvYqzQ7V/yjk2IB3+IOt/dUJUCw7xy1gibPalzPgdG/hOiHo5q/OkxOXQelyvuJRpYuQHd5F8vi13aOFCNWWBUicc=
X-Received: by 2002:a17:902:7291:: with SMTP id
 d17mr6233137pll.227.1579625963940; 
 Tue, 21 Jan 2020 08:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20200121161747.10569-1-thuth@redhat.com>
In-Reply-To: <20200121161747.10569-1-thuth@redhat.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Tue, 21 Jan 2020 16:59:12 +0000
Message-ID: <CACCGGhCZeb1-OQ0XJsRYiYC2EUSZxoeH=Q8FFortE7UnXXJuwg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH] trivial: Remove xenfb_enabled
 from sysemu.h
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
Cc: Anthony Perard <anthony.perard@citrix.com>, qemu-trivial@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMSBKYW4gMjAyMCBhdCAxNjoxOCwgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5j
b20+IHdyb3RlOgo+Cj4gVGhlIGRlZmluZSBpcyBvbmx5IHVzZWQgaW4gb25lIG90aGVyIHBsYWNl
LiBNb3ZlIHRoZSBjb2RlIHRoZXJlCj4gaW5zdGVhZCBvZiBrZWVwaW5nIHRoaXMgeGVuLXNwZWNp
ZmljIGRlZmluZSBpbiBzeXNlbXUuaC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIdXRoIDx0
aHV0aEByZWRoYXQuY29tPgoKQWNrZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
