Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865D612F8D
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 15:49:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMYX4-0001wR-VQ; Fri, 03 May 2019 13:47:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQLm=TD=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMYX3-0001wK-IE
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:47:21 +0000
X-Inumbo-ID: f6ff7488-6da9-11e9-a333-17ee35cb3101
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6ff7488-6da9-11e9-a333-17ee35cb3101;
 Fri, 03 May 2019 13:47:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556891237; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=1M++zJgG+a2Kreegqm0YldmgMUFB0hmEDiErKbKVsYI=;
 b=jbKuRXjknNbWgyxswdjSRMMM3kzecPJk8NZG9WnAMr5pIu/kqURzXh1sSoWtq6VPCD9kidFm
 Be0Jt69Mqd2hxxdPnEkhdi00R8F83+SYJjAJSDf1EP3L/YRzQbGbFDsSjDsT2FZEZt8j6Clv
 VxLSb1MAkmHPYXqY06lSILhtAog=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mxa.mailgun.org with ESMTP id 5ccc4663.7ff74b3b6a70-smtp-out-n01;
 Fri, 03 May 2019 13:47:15 -0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c12so7974730wrt.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 06:47:14 -0700 (PDT)
X-Gm-Message-State: APjAAAXCPEfiKWj5W42vt1oiz9jTdIXbzRmmWB8RLxi7DHSopRSGz5+8
 CxT51GB65oXO8+7XQuYgmCB7irVHK+xzbh2HdB0=
X-Google-Smtp-Source: APXvYqyAI2iurgUUbj6fAuDTeYDw9CY6YLRPt7LzhkXvKxWoKJHlXWxCUd6qGlAnkweucfOqJxeM2nHwSXuZpZzfuws=
X-Received: by 2002:a5d:6988:: with SMTP id g8mr7369986wru.117.1556891233803; 
 Fri, 03 May 2019 06:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <20190502221345.18459-4-tamas@tklengyel.com>
 <5CCBF963020000780022B865@prv1-mh.provo.novell.com>
In-Reply-To: <5CCBF963020000780022B865@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 3 May 2019 07:46:36 -0600
X-Gmail-Original-Message-ID: <CABfawh=XGK1Eo1ceA8Ooskc4jywAY7BUJ_GvsSeU+=fmdX9RzQ@mail.gmail.com>
Message-ID: <CABfawh=XGK1Eo1ceA8Ooskc4jywAY7BUJ_GvsSeU+=fmdX9RzQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAyOjE4IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDMuMDUuMTkgYXQgMDA6MTMsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPiArKysgYi94ZW4v
YXJjaC94ODYvbW0uYwo+ID4gQEAgLTM2OCw3ICszNjgsOSBAQCB2b2lkIF9faW5pdCBhcmNoX2lu
aXRfbWVtb3J5KHZvaWQpCj4gPgo+ID4gICAgICBlZmlfaW5pdF9tZW1vcnkoKTsKPiA+Cj4gPiAr
I2lmZGVmIENPTkZJR19NRU1fU0hBUklORwo+ID4gICAgICBtZW1fc2hhcmluZ19pbml0KCk7Cj4g
PiArI2VuZGlmCj4KPiBXaGlsZSBmb3IgZG9tY3RsIGNvZGUgYW5kIGFsaWtlIHVzaW5nICNpZmRl
ZiBtYXkgaW5kZWVkIGJlIHRoZQo+IGJldHRlciBjaG9pY2UsIEkgdGhpbmsgaGVyZSBhbiBpbmxp
bmUgc3R1YiB0byBhdm9pZCB0aGUgI2lmZGVmCj4gd291bGQgYmUgcHJlZmVyYWJsZS4gVGhlbiBh
Z2FpbiAtIHJlY2FsbCB5b3UndmUgYWxyZWFkeSBhY2stZWQKPiBteSBwYXRjaCB0byBkcm9wIHRo
ZSBmdW5jdGlvbiBhbHRvZ2V0aGVyPyBQZXJoYXBzIHlvdSBzaG91bGQKPiBiYXNlIHlvdXIgcGF0
Y2ggb24gbWluZSAob3IgQW5kcmV3IGNvdWxkIHB1bGwgdGhhdCBvdGhlciBwYXRjaAo+IGludG8g
eDg2LW5leHQpPyBJbiB0aGF0IGNhc2UgKHdpdGggdGhlIGh1bmsgYWJvdmUgc2ltcGx5Cj4gZHJv
cHBlZCkKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKWWVzLCB0
aGF0IGh1bmsgY2FuIGJlIHNpbXBseSBkcm9wcGVkIGlmIHlvdXIgcGF0Y2ggbWFrZXMgaXQgaW4g
YmVmb3JlCnRoaXMgZG9lcy4gVGhhdCB3b3VsZCBiZSB0aGUgb3B0aW1hbCByb3V0ZS4KClRoYW5r
cywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
