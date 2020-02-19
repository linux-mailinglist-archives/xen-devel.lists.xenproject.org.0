Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40641647F2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:12:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4QyX-0000l7-KW; Wed, 19 Feb 2020 15:09:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4QyW-0000l2-K5
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:09:20 +0000
X-Inumbo-ID: cd2a1c56-5329-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd2a1c56-5329-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 15:09:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63D42B077;
 Wed, 19 Feb 2020 15:09:18 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-6-jgross@suse.com>
 <d7959af74649ea04ba0236b47f23ac4c561b8506.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <68e44914-27fd-76a5-6f8b-4d99fe45a360@suse.com>
Date: Wed, 19 Feb 2020 16:09:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d7959af74649ea04ba0236b47f23ac4c561b8506.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/8] xen/sched: use keyhandler locks when
 dumping data to console
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTU6MzEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFRodSwgMjAyMC0w
Mi0xMyBhdCAxMzo1NCArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW5zdGVhZCBvZiB1
c2luZyB0aGUgbm9ybWFsIGxvY2tzIHVzZSB0aGUga2V5aGFuZGxlciBwcm92aWRlZAo+PiB0cnls
b2Nrcwo+PiB3aXRoIHRpbWVvdXRzLiBUaGlzIHJlcXVpcmVzIGEgc3BlY2lhbCBwcmltaXRpdmUg
Zm9yIHRoZSBzY2hlZHVsZXIKPj4gbG9jay4KPj4KPiBTbywgRldJVywgSSB0ZW5kIHRvIGFncmVl
IHdpdGggQW5kcmV3IG9uIHRoZSBnZW5lcmFsIGFzcGVjdHMgb2YgdGhpcy4KPiBJLmUuLCBJIHBl
cnNvbmFsbHkgZG9uJ3QgdGhpbmsgdGhhdCB0aGUgYWRkZWQgY29tcGxleGl0eSwgaG93ZXZlciBz
bWFsbAo+IG9uZSBtYXkganVkZ2UgaXQgdG8gYmUsIGlzIHdvcnRoIGl0Li4uIEknbSBub3QgZXZl
biBzdXJlIG5vdCB1c2luZwo+IHJlZ3VsYXIgbG9ja3MgaXMgcmVhbGx5IGFuIGltcHJvdmVtZW50
Lgo+IAo+IFdoZW4geW91IG1lbnRpb25lZCwgaW4geW91ciBvdGhlciBtYWlsLCB0aGF0IGhhdmlu
ZyBzb21ldGhpbmcgbGlrZSB0aGlzCj4gd291bGQgaGF2ZSBzYXZlZCBhIGxvdCBvZiByZWJvb3Rz
IGR1cmluZyB0aGUgZGV2ZWxvcG1lbnQgb2YgY29yZS0KPiBzY2hlZHVsaW5nLCB3b3VsZCBfanVz
dF8gZGlzYWJsaW5nIHRoZSB3YXRjaGRvZyBoYXZlIGFjaGlldmVkIHRoZSBzYW1lPwoKTm8uCgpJ
IHdhcyBoaXQgYnkgdGhlIGtleWhhbmRsZXIganVzdCB3YWl0aW5nIGZvciBhIGxvY2sgd2hpY2gg
d291bGQgbmV2ZXIKYmUgZnJlZWQuIFRoaXMgYmxvY2tlZCBwcmludGluZyBpbmZvcm1hdGlvbiBm
b3IgY3B1cyBJIHdvdWxkIGhhdmUKbGlrZWQgdG8gc2VlIChjaGFuY2VzIHdlcmUgYWJvdXQgNTAl
IGluIG15IGNhc2UgdGhhdCB0aGUgImludGVyZXN0aW5nIgpjcHUgaGFkIGEgaGlnaGVyIGNwdSBu
dW1iZXIgdGhhbiB0aGUgbG9ja2VkIG9uZSkuCgo+IAo+IEFueXdheSwgSSd2ZSBoYWQgYSBsb29r
IGF0IHRoaXMgcGF0Y2guIF9JZl8gd2UgZ28gd2l0aCB0aGlzIG5ldyBsb2NrCj4gdGhpbmcsIHRo
ZSBtb2RpZmljYXRpb25zIHRvIHRoZSBzY2hlZHVsZXIgY29kZSBkb25lIGhlcmUgc2VlbXMgZmlu
ZSB0bwo+IG1lLgoKVGhhbmtzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
