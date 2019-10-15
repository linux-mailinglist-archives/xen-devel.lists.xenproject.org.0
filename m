Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356DCD7685
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 14:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKLtx-00079X-Cn; Tue, 15 Oct 2019 12:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6rh4=YI=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iKLtv-00079H-6M
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 12:26:07 +0000
X-Inumbo-ID: f57cf4ea-ef46-11e9-beca-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f57cf4ea-ef46-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 12:26:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id j19so20058160lja.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IyQ4ZIFqgZbe6yP9buZulrvvA8VOvjByFro2J53oPIY=;
 b=ubiBAwKOx9d1WtJZSSpdQsqHimADhwfiqyUQjzdHwwAlnk5ThPIt/uxFpUgDfGnbkP
 SUCmKnG/cW+fS04HLlttXMX8DwdaqxzVt2CAYEOThISe9mzgamMem3zjVsaCjh4yKOgb
 PV54QUvHdPolX1VHz0I+Zex87OZvL/rd6ceXQu/dnBACVm8FZq4DQ/9fK6G6yiw/O6tu
 VSuX1zRpYb6iQXtBZAAoPobdakkWd1u6gPSR75cq23V/zKEevMJOrL58ZDlAdgdunU9d
 jA8vlLpsAKKn0ECPho5DyIMYxeL/LN5RNW3Jcb7S1t1+WG8laNd1m1wCQSe4R6+a5xW2
 x1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IyQ4ZIFqgZbe6yP9buZulrvvA8VOvjByFro2J53oPIY=;
 b=M+PVcJPU3U8Jz4LbOHQeR05+Mcpbet3SS56YEFk/GXpTfKF/sbGb2QWL30OE5Y0+Hm
 EhbAS7cNgFWUY9gyvjWO1QaX2WuCq2qWrvyc2UzXkFYEQmksc3lgsD2xrekGnmNv4E4F
 yavN7lFy7/UD8dgI9iwi7Wbjcn1q9Akvyu9Y2ABGWaZEXdyI6d2VirgkJaht8a/GJ7Ex
 pgJKsO3FUUQmzCHFaRULx9bE9q3MIbhGZXvE/GfEW9JsXo4301yGYkqb+lmo8Wg+gS79
 RAqXCxsED7+QiQV16YXpo8UcAGNqmg87QnKyRvwMLUn2zBLrwvJzQNoZmGJQSf+12T87
 tDfQ==
X-Gm-Message-State: APjAAAV8EDVpJ8Xxkd558i8agmBHqJirmaCpcZxPbDkho68dEXPqh1CW
 i51adtoEARKtg2d9Za1Ik0NRKFPKxj1MccPvx1w=
X-Google-Smtp-Source: APXvYqx7kgnZCslWo2RQXdOI7G2Ub2QQt6Of4/qWmpMDcnE+3nO5dIDhwMEJ3RYAl9IR0fKrYIWVFQOwwRtJEkfM6Xg=
X-Received: by 2002:a2e:2b91:: with SMTP id r17mr22451243ljr.1.1571142365171; 
 Tue, 15 Oct 2019 05:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 15 Oct 2019 08:25:54 -0400
Message-ID: <CAKf6xpsFj_8b9nDWLU2iYdHJTFmYQ-vy2YTwhiPQSDNoa79j6A@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v3 0/2] Optionally call EFI
 SetVirtualAddressMap()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgNjoxMSBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gV29ya2Fyb3Vu
ZCBidWdneSBVRUZJIGFjY2Vzc2luZyBib290IHNlcnZpY2VzIG1lbW9yeSBhZnRlciBFeGl0Qm9v
dFNlcnZpY2VzKCkuCj4gUGF0Y2hlcyBkaXNjdXNzZWQgaGVyZToKPiBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDA3MDEuaHRt
bAo+Cj4gSW4gYWRkaXRpb24gdG8gdGhlIHRlc3RzIGJlbG93LCBJJ3ZlIHRlc3RlZCBrZXhlYyBv
biB4ZW4uZWZpIHdpdGggdGhpcyBvcHRpb24KPiBlbmFibGVkIGFuZCBpdCAoc3RpbGwpIHdvcmtz
Lgo+Cj4gVGVzdCByZXN1bHRzIG9uIGZldyBsYXB0b3BzOgo+Cj4gVGhpbmtwYWQgeDIzMCwgZmly
bXdhcmUgdmVyc2lvbiAyLjc3Ogo+ICAtIHdpdGhvdXQgdGhlIHBhdGNoOiBjcmFzaGVzIG9uIFJT
IGNhbGwgKG1hcGJzIGhlbHBzKQo+ICAtIHdpdGggcGF0Y2g6IHdvcmtzCj4gIC0gc2FtZSB3aXRo
IHhlbi5lZmkgYW5kIE1CMgo+Cj4gTGlicmVtIDE0IHYxLCBmaXJtd2FyZSB2ZXJzaW9uIChBTUkp
IEFSVUQwMjYgKDA2LzE4LzIwMTUpOgo+ICAtIHdpdGhvdXQgdGhlIHBhdGNoOiB3b3Jrcwo+ICAt
IHdpdGggdGhlIHBhdGNoOiB3b3Jrcwo+ICAtIHNhbWUgd2l0aCB4ZW4uZWZpIGFuZCBNQjIKPgo+
IERlbGwgTGF0aXR1ZGUgRTY0MjAsIGZpcm13YXJlIHZlcnNpb24gQTIxOgo+ICB0aGlzIG1hY2hp
bmUgcmVxdWlyZXMgZWZpPWF0dHI9dWMgd29ya2Fyb3VuZAo+ICAtIHdpdGhvdXQgdGhlIHBhdGNo
OiBkb20wIGhhbmdzIGJlZm9yZSBzZW5kaW5nIGFueSBtZXNzYWdlIHRvIHRoZSBjb25zb2xlIChl
dmVuIHdpdGggZWFybHlwcmludGs9eGVuIGV0YykKPiAgLSB3aXRoIHRoZSBwYXRjaDogY3Jhc2hl
cyBiZWZvcmUgZG9tMCBwcmludHMgYW55dGhpbmc6IG1tLmM6ODk2OmQwdjAgbm9uLXByaXZpbGVn
ZWQgYXR0ZW1wdCB0byBtYXAgTU1JTyBzcGFjZSAyYzJjMmMyYzJjCj4gIC0gc2FtZSB3aXRoIHhl
bi5lZmkgYW5kIE1CMgo+Cj4gVGhpbmtwYWQgVzU0MDoKPiAgLSB3aXRob3V0IHRoZSBwYXRjaDog
Y3Jhc2hlcyBvbiBSUyBjYWxsIChvbmx5IGVmaT1uby1ycyBoZWxwcykKPiAgLSB3aXRoIHBhdGNo
OiB3b3Jrcwo+ICAtIHRlc3RlZCBvbmx5IHdpdGggTUIyCj4KPiBUaGlua3BhZCBYMSBDYXJib24g
Z2VuNSwgZmlybXdhcmUgdmVyc2lvbiAxLjIyICgyMDE3LTA3LTA0KToKPiAgLSB3aXRob3V0IHRo
ZSBwYXRjaDogd29ya3MKPiAgLSB3aXRoIHBhdGNoOiB3b3Jrcwo+ICAtIHRlc3RlZCBvbmx5IHhl
bi5lZmkKPgo+IFRoaW5rcGFkIFA1MiwgZmlybXdhcmUgdmVyc2lvbiAxLjI1ICgyMDE4LTA0LTE1
KToKPiAgLSB3aXRob3V0IHRoZSBwYXRjaCAoTUIyKTogaGFuZ3Mgb24gUlMgY2FsbCAobWFwYnMg
aGVscHMpCj4gIC0gd2l0aG91dCB0aGUgcGF0Y2ggKHhlbi5lZmkpOiB3b3Jrcyg/ISkKPiAgLSB3
aXRoIHRoZSBwYXRjaDogd29ya3MKPiAgLSB0ZXN0ZWQgd2l0aCB4ZW4uZWZpIGFuZCBNQjIKPgo+
IENoYW5nZXMgaW4gdjI6Cj4gIC0gZml4IGJvb3Qgd2l0aCB4ZW4uZWZpIChlZmlfbWVtbWFwIGF0
IHRoaXMgcG9pbnQgc3RpbGwgbmVlZHMgdG8gYmUgYWNjZXNzZWQKPiAgICB2aWEgcGh5c2ljYWwg
YWRkcmVzcykuIFRCSCwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBwcmV2aW91cyB2ZXJzaW9uIHdv
cmtlZAo+ICAgIHdpdGggTUIyIC0gaXMgZGlyZWN0bWFwIG1hcHBlZCBhdCB0aGlzIHBvaW50PwoK
djEgZmFpbGVkIHRvIGJvb3QgZm9yIG1lLgoKRm9yIHYzOgpEZWxsIExhdGl0dWRlIDU1ODAsIGZp
cm13YXJlIDEuMTYuMAogLSB3aXRob3V0IHRoZSBwYXRjaDogd29ya3MKIC0gd2l0aCBwYXRjaDog
d29ya3MKIC0gdGVzdGVkIG9ubHkgeGVuLmVmaQoKVGVzdGVkLWJ5OiBKYXNvbiBBbmRyeXVrIDxq
YW5kcnl1a0BnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
