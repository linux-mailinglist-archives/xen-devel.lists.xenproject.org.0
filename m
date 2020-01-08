Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC21346B4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:51:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDaZ-00085q-MA; Wed, 08 Jan 2020 15:49:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipDaY-000856-GW
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:49:42 +0000
X-Inumbo-ID: 7b3e205c-322e-11ea-b839-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b3e205c-322e-11ea-b839-12813bfff9fa;
 Wed, 08 Jan 2020 15:49:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u2so3016713wmc.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 07:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Ede3+acHg5EvxJoy5SGcQzAUEwNVFjGhjMVjND8+M58=;
 b=pqxSC1890XwO86rKQHotSrErspQopiB12TtHDGOK7fltp/AN6Vr1PeTw4HInBzjPjn
 KjVbUHMaX9B8cz9Q+zQj/fjjbEWulsjBPpsouQN+1u8uhFxu5r/fzDBHTyDTbOHWLvC/
 5f6MurBkTKyG6l43StETCzgr22z5zhJYlsoX51Py2C94hfWd2XFB+y9sLqgPLXQqHZVI
 rT/HHCOllmenVfhgpvkIv9PLLjESs7Nw+58FYpn3BGEkgpOBC6NqtZOexA6kJZ9xJIxD
 S0MH+laPiQ5UNNuF841Blrq84GIaubhihK8HGoeViBhGaipvm84tkOMz1vI8q6QaD7O5
 jfOg==
X-Gm-Message-State: APjAAAWt4OlKTu/EVYCfZajEN+XF8R9qhPWSA+xnr10C8wQm+vTQ4/Rj
 CWZVQBkWnCi3MIrTU7Da5o0=
X-Google-Smtp-Source: APXvYqwwzRfShGHJwrLh5NXG+ZMa5YCVFaIQFezuBqrhCXIVv68SAg4wRLHB9lH/kLpJ4fDcpgNv9Q==
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr4869950wmm.77.1578498580280; 
 Wed, 08 Jan 2020 07:49:40 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id l3sm4597103wrt.29.2020.01.08.07.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 07:49:39 -0800 (PST)
Date: Wed, 8 Jan 2020 15:49:38 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200108154938.r74v4yn6orpyjot2@debian>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108103857.77236-3-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/2] Revert "tools/libxc: disable x2APIC
 when using nested virtualization"
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTE6Mzg6NTdBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgN2IzYzViNzBhMzIzMDNiNDZkMGQwNTFlNjk1
ZjE4ZDcyY2NlNWVkMCBhbmQKPiByZS1lbmFibGVzIHRoZSB1c2FnZSBvZiB4MkFQSUMgd2l0aCBu
ZXN0ZWQgdmlydHVhbGl6YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4K
CihzdWJqZWN0IHRvIGFjY2VwdGFuY2Ugb2YgcGF0Y2ggMSwgb2YgY291cnNlKQoKPiAtLS0KPiAg
dG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgfCAxMSAtLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2Nw
dWlkX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKPiBpbmRleCBhYzM4YzE0MDZl
Li4yNTQwYWExZTFjIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4g
KysrIGIvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKPiBAQCAtNjUzLDE3ICs2NTMsNiBAQCBp
bnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21p
ZCwKPiAgICAgICAgICBwLT5leHRkLml0c2MgPSB0cnVlOwo+ICAgICAgICAgIHAtPmJhc2ljLnZt
eCA9IHRydWU7Cj4gICAgICAgICAgcC0+ZXh0ZC5zdm0gPSB0cnVlOwo+IC0KPiAtICAgICAgICAv
Kgo+IC0gICAgICAgICAqIEJPREdFOiBkb24ndCBhbm5vdW5jZSB4MkFQSUMgbW9kZSB3aGVuIHVz
aW5nIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiwKPiAtICAgICAgICAgKiBhcyBpdCBkb2Vzbid0IHdv
cmsgcHJvcGVybHkuIFRoaXMgc2hvdWxkIGJlIHJlbW92ZWQgb25jZSB0aGUKPiAtICAgICAgICAg
KiB1bmRlcmx5aW5nIGJ1ZyhzKSBhcmUgZml4ZWQuCj4gLSAgICAgICAgICovCj4gLSAgICAgICAg
cmMgPSB4Y19odm1fcGFyYW1fZ2V0KHhjaCwgZG9taWQsIEhWTV9QQVJBTV9ORVNURURIVk0sICZ2
YWwpOwo+IC0gICAgICAgIGlmICggcmMgKQo+IC0gICAgICAgICAgICBnb3RvIG91dDsKPiAtICAg
ICAgICBpZiAoIHZhbCApCj4gLSAgICAgICAgICAgIHAtPmJhc2ljLngyYXBpYyA9IGZhbHNlOwo+
ICAgICAgfQo+ICAKPiAgICAgIHJjID0geDg2X2NwdWlkX2NvcHlfdG9fYnVmZmVyKHAsIGxlYXZl
cywgJm5yX2xlYXZlcyk7Cj4gLS0gCj4gMi4yNC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
