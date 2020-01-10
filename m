Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B782B137A41
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2020 00:32:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iq3ib-00060G-Id; Fri, 10 Jan 2020 23:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JBTo=27=gmail.com=xumengpanda@srs-us1.protection.inumbo.net>)
 id 1iq3ia-00060B-B9
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 23:29:28 +0000
X-Inumbo-ID: 0ac6444c-3401-11ea-a985-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ac6444c-3401-11ea-a985-bc764e2007e4;
 Fri, 10 Jan 2020 23:29:27 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id cy15so3139096edb.4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2020 15:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BqjyTogSrtCLKOcqywKTvv1mek0C0Fd6CQsMXMz3bqE=;
 b=qFLZk+RhWlvPMhBZ/SaUxVFwp5InzR1jqrvJtla0geCaPx/YCRpH6KcTKTWKF+GYoD
 KnCpaa8+4oiPyZFT3Jh28zKhO8GRhM8Gv5YpgWR0qbFRGHwxM2d7sODERLKLnnPVLN2C
 nvMpl24OL5DCVe2cLZ7TMRWJqRkq99UZePyaRskXbJ7bLXYkij9twI4dAkFsaidyZqLb
 vii0n5zmj+Ip7GViCJR12Pw65xC/pSgau/ZkzF7ZU5G9XL+GWvIY3jfu6p38L2M0eNId
 BRAMxrelw26bhUNJl9bT5J+MTgVGv4Hk9naG6nCP+rs5h9AlVBhs7vaybHZLx8FAUSLo
 y/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BqjyTogSrtCLKOcqywKTvv1mek0C0Fd6CQsMXMz3bqE=;
 b=KV7mFyQdYuHhgufdvqTWZE/3vKLYurI4ePmq5tZV+DJMLo9OTp6K7jGLgv6dfmXnXQ
 riremMXjMQ6gefaoHqqJLrcx9oHkt4hfKUonoqx+FjEN6KaAZR+VJ2nzlNjJSYQhUUbQ
 dE+FoVGgUGvyMoXzx6sOdejzk/PfxaaU2pcnR0/Ahiuz6LbsBrfVX+4gLE1BLE0C/h0L
 a7LFWLXlGPkau5/pPHF98F9nruhlJJXS/HG+0vRgrsB1zuSqfOVtg0maGDrg3P3Vn4aO
 HX9HiKi/2MdcIMWhhpeZ/GJsc/pdQJ0tooEW4l72w91hAUW6X7LgaddLegeJI+FDTyuC
 xRGA==
X-Gm-Message-State: APjAAAXvE8HVLJGErVESrfTYXrh0WutJmcFxu5VJfxUzAfhUiTigX5c9
 DlzN9NTNfVP2NRcAZWSAfc1hG4E0UbCXvlgWpw==
X-Google-Smtp-Source: APXvYqxTnzTqR/tyUP/6n1/0TyLb0WKQ7fLrVlIdRCK50evwh47R5CN5LUZDftBZpJ5p4dmDdcIP4IHvRZCs61URCHc=
X-Received: by 2002:a17:906:538c:: with SMTP id
 g12mr5661087ejo.101.1578698966385; 
 Fri, 10 Jan 2020 15:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20200110222344.66071-1-julien@xen.org>
In-Reply-To: <20200110222344.66071-1-julien@xen.org>
From: Meng Xu <xumengpanda@gmail.com>
Date: Fri, 10 Jan 2020 15:28:49 -0800
Message-ID: <CAENZ-+n0mUzjjFLo=DK5EtcdR1dW5xgS_0FefW8VOdGOCOvg8g@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH] xen/sched: rt: Fix typo in a comment
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMjoyMyBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+Cj4gLS0tCj4gIHhlbi9jb21tb24vc2NoZWRfcnQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9zY2hlZF9ydC5jIGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCj4gaW5kZXggYjJiMjk0ODFm
My4uYzQwYTdlNDk5MCAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkX3J0LmMKPiArKysg
Yi94ZW4vY29tbW9uL3NjaGVkX3J0LmMKPiBAQCAtMTIyLDcgKzEyMiw3IEBACj4gICAqLwo+ICAv
Kgo+ICAgKiBSVERTX3NjaGVkdWxlZDogSXMgdGhpcyB1bml0IGVpdGhlciBydW5uaW5nIG9uLCBv
ciBjb250ZXh0LXN3aXRjaGluZyBvZmYsCj4gLSAqIGEgcGh5aXNjYWwgY3B1Pwo+ICsgKiBhIHBo
eXNpY2FsIGNwdT8KPiAgICogKyBBY2Nlc3NlZCBvbmx5IHdpdGggZ2xvYmFsIGxvY2sgaGVsZC4K
PiAgICogKyBTZXQgd2hlbiBjaG9zZW4gYXMgbmV4dCBpbiBydF9zY2hlZHVsZSgpLgo+ICAgKiAr
IENsZWFyZWQgYWZ0ZXIgY29udGV4dCBzd2l0Y2ggaGFzIGJlZW4gc2F2ZWQgaW4gcnRfY29udGV4
dF9zYXZlZCgpCj4gLS0KPiAyLjI0LjAKPgoKUmV2aWV3ZWQtYnk6IE1lbmcgWHUgPG1lbmd4dUBj
aXMudXBlbm4uZWR1PgoKQ2hlZXJzLAoKTWVuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
