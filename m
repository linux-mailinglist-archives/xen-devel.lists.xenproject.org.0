Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E69A3EC8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 22:09:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3nAd-0004K1-MZ; Fri, 30 Aug 2019 20:06:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Ebn=W2=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1i3nAb-0004Jw-9b
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 20:06:53 +0000
X-Inumbo-ID: b3bb2968-cb61-11e9-ae8f-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3bb2968-cb61-11e9-ae8f-12813bfff9fa;
 Fri, 30 Aug 2019 20:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N4ccjV6Uz2stxahLFBBdCcZTdAQW4BCk7Vkhx5WuN3U=; b=f/dloJBTcxF2z22i2uHyhLqxCX
 Nnwziw9uGurqPppWwIH1lLrdT0vsYWj4C/c7eJ++/sMx4gBAxIkpYdcKhs4KGS+bpd1mWiQY/o9Li
 YhASjT/2rIRIfFl1FA43njZc9Fxqfu3qjIkPgZk0zaa56k+bJg/JhrIDz9wqHo5Su9WU=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:43948
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1i3nAe-0002Sk-NH; Fri, 30 Aug 2019 22:06:56 +0200
To: Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <e184002b-f1f9-c1a1-4c58-1d4623538bd0@eikelenboom.it>
 <20190830020934.GA31575@gao-cwp>
 <9afe2162-da04-0291-a0bb-ced61871599e@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <f98ecb0c-0ac7-fc73-a472-d0eb2a5b41d9@eikelenboom.it>
Date: Fri, 30 Aug 2019 22:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9afe2162-da04-0291-a0bb-ced61871599e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Xen-unstable] boot crash while loading AMD
 microcode due to commit "microcode/amd: fix memory leak"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDgvMjAxOSAwOTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDguMjAxOSAw
NDowOSwgQ2hhbyBHYW8gd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDMwLCAyMDE5IGF0IDAxOjA0OjU0
QU0gKzAyMDAsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IEwuUy4sCj4+Pgo+Pj4gV2hp
bGUgdGVzdGluZyB4ZW4tdW5zdGFibGUsIG15IEFNRCBzeXN0ZW0gY3Jhc2hlcyBkdXJpbmcgZWFy
bHkgYm9vdCB3aGlsZSBsb2FkaW5nIG1pY3JvY29kZSB3aXRoIGFuICJFYXJseSBmYXRhbCBwYWdl
IGZhdWx0Ii4KPj4+IFJldmVydGluZyBjb21taXQgZGU0NWUzZmYzN2JiMTYwMjc5NjA1NGFmYWJm
YTYyNmVhNTY2MWM0NSAibWljcm9jb2RlL2FtZDogZml4IG1lbW9yeSBsZWFrIiBmaXhlcyB0aGUg
Ym9vdCBpc3N1ZS4KPj4KPj4gU29ycnkgZm9yIHRoaXMgaW5jb252ZW5pZW5jZS4KPj4KPj4gQ291
bGQgeW91IGFwcGx5IHRoZSBwYXRjaCBhdHRhY2hlZCBhbmQgdHJ5IGl0IGFnYWluPwo+IAo+IEkn
bSBpbmNsaW5lZCB0byB0YWtlIHRoaXMgZml4IGV2ZW4gd2l0aG91dCB3YWl0aW5nIGZvciBTYW5k
ZXIncwo+IGZlZWRiYWNrIChhbmQgc2ltcGx5IGltcGx5aW5nIHlvdXIgUy1vLWIpLiBBbmRyZXcg
LSB3aGF0IGRvIHlvdQo+IHRoaW5rPwo+IAo+IEphbgo+IAoKSnVzdCB0ZXN0ZWQgYW5kIGl0IHdv
cmtzIGZvciBtZSwgdGhhbmtzIQoKLS0KU2FuZGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
