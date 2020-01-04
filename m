Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1CF1303DE
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 19:29:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ino73-0006d9-Kt; Sat, 04 Jan 2020 18:25:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1ino71-0006d4-Iz
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 18:25:23 +0000
X-Inumbo-ID: 919572cc-2f1f-11ea-a1e1-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 919572cc-2f1f-11ea-a1e1-bc764e2007e4;
 Sat, 04 Jan 2020 18:25:22 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so24946670ljh.5
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JviGzENapEeR3/dm8W8TU987jty65iS4rHlELZR9FVw=;
 b=qUfr2Ki+mvkXL9XGPyt8Qx0Jscb79/SBLaIg1ynMkchU2mGg//ySHRAqgBT5zRKSud
 H2BBctumO+8lll//Jt98skHW0BCOlAiuRZ0po1B4/JVubK/nZuRwFAQChTnAcLnS0+1w
 4byawBpiz2PYQvimxgl+x6VrsTAF2pV8LRKWyX5l2PFzDx75lqupEPI1O4vQi4S60jCQ
 muRX4cloNGwa7dP7OCki984cddcAJWWWJHu0a/UgoqWmFEXYuB/sZmqnfqSWq+tKXPb/
 F+9eVXiVhQWmQ6R5AzW7x0T6IlsMIAwZzgPB36/po+Hw87bgW/7GHJntgIzMJON5yift
 X1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JviGzENapEeR3/dm8W8TU987jty65iS4rHlELZR9FVw=;
 b=k9dRXG2kE39VP+AIcJg4TwIfunzz9NJssv3OfpfWoZec6PB1qa8itlxoJhv0M9Cntw
 VQgFxTCvGvw8kuZgJdylIowf0Pk+vhUZuZfns4OLQ/N0MDnzXEgTYYBlU9FEBk3p8G5B
 014Z/qPv2z0x2Cq7zzGVg/v40kBgak3ykmCZr3eJaLddabEUeheqmOkAC8EeZQpJmtej
 ST0m/TrEAYW3nKh/sGpC1L9atYwd+VHl7Mxm3UCadQsfHF3nCeteeeqHPOhwZc3SlANS
 5gAEieSBJRv8pid5lrmmOv/UO5XhTvfk/ttSM4HE85+tlLIsxnWQ15lb36FUL3Hm0gFN
 w8qQ==
X-Gm-Message-State: APjAAAXBpkfbTAkJeoADyyYxKDUuxU6ZgLD/Aheo/+IipmLgRaWHRd5i
 eBJ/RO5sSTbRQJp0NXMr1nqeawsTOOe6uVsWmSA=
X-Google-Smtp-Source: APXvYqzoqPMdWxgp/Wcmb/zssaw6NlC9JL/CMSRQ2owFRZGuJc6X4ktId70lyodSRyRklEkdRDFya0sEcgQe4iStI1M=
X-Received: by 2002:a2e:8916:: with SMTP id d22mr55502980lji.19.1578162321776; 
 Sat, 04 Jan 2020 10:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
 <20191227163224.4113837-3-george.dunlap@citrix.com>
In-Reply-To: <20191227163224.4113837-3-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 4 Jan 2020 13:25:10 -0500
Message-ID: <CAEBZRScX8m38yNj5cYmR6NXTpZFFjziFfjZR=NmxdDiqWDuLoA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 3/9] golang/xenlight: Convert "" to NULL
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBDLkdvU3RyaW5nIHdpbGwgaGFuZGxlIE5VTEwgQyBzdHJpbmdzIHByb3Blcmx5LCBieSBwYXNz
aW5nIGJhY2sgIiIuCj4gQnV0IEMuQ1N0cmluZyB3aWxsIHRha2UgYW4gZW1wdHkgR28gc3RyaW5n
IGFuZCBhY3R1YWxseSBnZW5lcmF0ZSBhCj4gJ1wwJy10ZXJtaW5hdGVkIGVtcHR5IHN0cmluZy4g
IFRoaXMgY29uZnVzZXMgbGlieGwsIHdoaWNoIGlzIGV4cGVjdGluZwo+IG5vbi12YWx1ZXMgdG8g
YmUgTlVMTCwgbm90ICIiLgo+Cj4gT25seSBjYWxsIEMuQ1N0cmluZyBpZiB0aGUgR28gc3RyaW5n
IGlzIG5vbi1lbXB0eS4KCkdvb2QgY2F0Y2gsIHRoYW5rcy4gVGhpcyBzaG91bGQgZ28gaW4gdjUg
b2YgbXkgc2VyaWVzIHRob3VnaCwgcmlnaHQ/ClRoZSB0b0MgY29kZSBoYXNuJ3QgYmVlbiBjaGVj
a2VkLWluIHlldC4KCi1OUgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
