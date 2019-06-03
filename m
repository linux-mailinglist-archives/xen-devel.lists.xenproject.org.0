Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B496933B2C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:26:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXvM9-0005ih-Vm; Mon, 03 Jun 2019 22:23:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mem4=UC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXvM8-0005ic-Pv
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:23:04 +0000
X-Inumbo-ID: 249d739c-864e-11e9-854c-07e41638f583
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 249d739c-864e-11e9-854c-07e41638f583;
 Mon, 03 Jun 2019 22:22:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559600579; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=zfQpwYbYsO9gKZOwKtFvA+7O7vfxFmNQTPCAJP3Sj2I=;
 b=ParjUoA3p1BeQX4Uv6Jjjgw7h8JfigN9EaVKGGu8QZQ7W7KGE55szreNFCinaiLYroSBUrIu
 hCql9S4gV1jyXWhP///tNsg/bTpw92DQWEvd6lv+TvyvpuJN7LDVFMH+Kytymlx8q6xrn0sF
 cd5GVT6GveMlr7ufmEzO9ERaP7Y=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mxa.mailgun.org with ESMTP id 5cf59dc2.7f9083fad770-smtp-out-n01;
 Mon, 03 Jun 2019 22:22:58 -0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b18so13692481wrq.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2019 15:22:58 -0700 (PDT)
X-Gm-Message-State: APjAAAU4F1tGIdoMeC6lbwLQKGF5krkvZZlC2+SxjwWI5zYmL5yC4neI
 INxnc5yYCS4F90BXoBYYOOMmuBWcSUGztRN5xIY=
X-Google-Smtp-Source: APXvYqwHWf3mwUAHIMeL5vPXyJGt0RWFEwlO9XHbzWiN7QMwddCfYCyk+Uw16F9f0ppYWf8ZizBO5vRa7qfflu3AY70=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr3941610wro.60.1559600576988; 
 Mon, 03 Jun 2019 15:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
 <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
In-Reply-To: <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 3 Jun 2019 16:22:19 -0600
X-Gmail-Original-Message-ID: <CABfawhns6-ghAhv=qiDvQ2POWnxbUhbnjkvsaD0xwwsnzUgzyA@mail.gmail.com>
Message-ID: <CABfawhns6-ghAhv=qiDvQ2POWnxbUhbnjkvsaD0xwwsnzUgzyA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/9] vm_event: Define VM_EVENT type
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ICAvKiBYRU5fRE9NQ1RMX21lbV9zaGFyaW5nX29wLgo+ID4gLSAqIFRoZSBDT05UUk9MIHN1
Yi1kb21jdGwgaXMgdXNlZCBmb3IgYnJpbmd1cC90ZWFyZG93bi4gKi8KPiA+ICsgKiBUaGUgQ09O
VFJPTCBzdWItZG9tY3RsIGlzIHVzZWQgZm9yIGJyaW5ndXAvdGVhcmRvd24uCj4gPiArICogUGxl
YXNlIG5vdGUgdGhhdCBtZW0gc2hhcmluZyBjYW4gYmUgdHVybmVkIG9uICp3aXRob3V0KiBzZXR0
aW5nLXVwIHRoZQo+ID4gKyAqIGNvcnJlc3BvbmRpbiByaW5nCj4gPiArICovCj4KPiBBcyBhIHRh
bmdlbnQsIGl0IGNhbj8gaG93PyAgKEknbSBlbnRpcmVseSBwcmVwYXJlZCB0byBiZWxpZXZlIHRo
YXQgdGhpcwo+IGlzIGhvdyB0aGUgY29kZSBjdXJyZW50bHkgd29ya3MsIGJ1dCBJIGNhbid0IHNl
ZSBob3cgc3VjaCBhIHNldHVwIHdvdWxkCj4gcGxhdXNpYmx5IHdvcmsuKQoKVGhlIHZtX2V2ZW50
IHJpbmcgZm9yIG1lbV9zaGFyaW5nIGlzIG9ubHkgdXNlZCB0byBjb21tdW5pY2F0ZQpvdXQtb2Yt
bWVtb3J5IGNvbmRpdGlvbiB0byBhbiBleHRlcm5hbCBsaXN0ZW5lci4gSSB0aGluayBpdCdzIG9u
bHkKdXNlZnVsIGZvciBsb2dnaW5nIHNpbmNlIHRoZSBsaXN0ZW5lciB3b3VsZG4ndCByZWFsbHkg
YmUgaW4gYSBwb3NpdGlvbgp0byB0cnkgdG8gIm1ha2Ugc3BhY2UiIGZvciB0aGUgZmF1bHRpbmcg
ZG9tYWluIGFuZCBpdCB3b3VsZCBnZXQKZGVzdHJveWVkIGFmdGVyIHRoZSBtZXNzYWdlIGlzIHNl
bnQuIEluIGFueSBjYXNlLCB0aGVyZSBpc24ndCBhbnkKZG9jdW1lbnRhdGlvbiBmb3IgaG93IGl0
IHdhcyBpbnRlbmRlZCB0byBiZSB1c2VkIHNvIHRoaXMgaXMganVzdCBteQpndWVzcy4KClRhbWFz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
