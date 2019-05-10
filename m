Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E477197D4
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 06:55:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOxW7-0003hL-CZ; Fri, 10 May 2019 04:52:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOxW6-0003hB-98
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 04:52:18 +0000
X-Inumbo-ID: 600bbe02-72df-11e9-ba73-f313d60a0478
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 600bbe02-72df-11e9-ba73-f313d60a0478;
 Fri, 10 May 2019 04:52:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E115BAE4E;
 Fri, 10 May 2019 04:52:11 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
 <706a1e5f87ae789197fba3a268b18183fd4b8e5b.1557431250.git-series.marmarek@invisiblethingslab.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ddcf231a-6871-348b-0e2e-b601e5607ca7@suse.com>
Date: Fri, 10 May 2019 06:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <706a1e5f87ae789197fba3a268b18183fd4b8e5b.1557431250.git-series.marmarek@invisiblethingslab.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 4/5] xen: fix handling framebuffer
 located above 4GB
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAyMTo0OCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIHNvbWUgbWFjaGluZXMgKGZvciBleGFtcGxlIFRoaW5rcGFkIFA1MiksIFVFRkkgR09QIHJl
cG9ydHMKPiBmcmFtZWJ1ZmZlciBsb2NhdGVkIGFib3ZlIDRHQiAoMHg0MDAwMDAwMDAwIG9uIHRo
YXQgbWFjaGluZSkuIFRoaXMKPiBhZGRyZXNzIGRvZXMgbm90IGZpdCBpbiB7eGVuLGRvbTB9X3Zn
YV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5sZmJfYmFzZQo+IGZpZWxkLCB3aGljaCBpcyAzMmJp
dC4gVGhlIG92ZXJmbG93IGhlcmUgY2F1c2UgYWxsIGtpbmQgb2YgbWVtb3J5Cj4gY29ycnVwdGlv
biB3aGVuIGFueXRoaW5nIHRyaWVzIHRvIHdyaXRlIHNvbWV0aGluZyBvbiB0aGUgc2NyZWVuLAo+
IHN0YXJ0aW5nIHdpdGggemVyb2luZyB0aGUgd2hvbGUgZnJhbWVidWZmZXIgaW4gdmVzYV9pbml0
KCkuCj4gCj4gRml4IHRoaXMgc2ltaWxhciB0byBob3cgaXQncyBkb25lIGluIExpbnV4OiBhZGQg
ZXh0X2xmYl9iYXNlIGZpZWxkIGF0Cj4gdGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlLCB0byBob2xk
IHVwcGVyIDMyYml0cyBvZiB0aGUgYWRkcmVzcy4gU2luY2UgdGhlCj4gZmllbGQgaXMgYWRkZWQg
YXQgdGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlLCBpdCB3aWxsIHdvcmsgd2l0aCBvbGRlcgo+IExp
bnV4IHZlcnNpb25zIHRvbyAob3RoZXIgdGhhbiB1c2luZyBwb3NzaWJseSB0cnVuY2F0ZWQgYWRk
cmVzcyAtIG5vCj4gd29yc2UgdGhhbiB3aXRob3V0IHRoaXMgY2hhbmdlKS4gVGhhbmtzIHRvIEFC
SSBjb250YWluaW5nIHNpemUgb2YgdGhlCj4gc3RydWN0dXJlIChzdGFydF9pbmZvLmNvbnNvbGUu
ZG9tMC5pbmZvX3NpemUpLCBMaW51eCBjYW4gZGV0ZWN0IHdoZW4KPiB0aGlzIGZpZWxkIGlzIHBy
ZXNlbnQgYW5kIHVzZSBpdCBhcHByb3ByaWF0ZWx5IHRoZW4uCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIu
Y29tPgoKUHVibGljIGludGVyZmFjZSBwYXJ0OgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
