Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF4E1C73
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:25:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGac-0000K7-NZ; Wed, 23 Oct 2019 13:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNGab-0000K2-5y
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:22:13 +0000
X-Inumbo-ID: 1e666916-f598-11e9-947c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e666916-f598-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 13:22:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F35BFB647;
 Wed, 23 Oct 2019 13:22:09 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-9-liuwe@microsoft.com>
 <20191021100038.GG17494@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7ccb379-a0c6-a282-8e03-dc577b4d34ed@suse.com>
Date: Wed, 23 Oct 2019 15:22:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021100038.GG17494@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next v2 8/9] x86: be more verbose when
 running on a hypervisor
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMjAxOSAxMjowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIFNl
cCAzMCwgMjAxOSBhdCAwNDowMDo0MlBNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+PiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAo+PiArKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAo+PiBAQCAtMzYsNiArMzYsNyBAQCBib29sIGh5
cGVydmlzb3JfcHJvYmUodm9pZCk7Cj4+ICB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7Cj4+
ICB2b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCk7Cj4+ICB2b2lkIGh5cGVydmlzb3JfcmVz
dW1lKHZvaWQpOwo+PiArY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9uYW1lKHZvaWQpOwo+PiAgCj4+
ICAjZWxzZQo+PiAgCj4+IEBAIC00NSw2ICs0Niw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoeXBl
cnZpc29yX3Byb2JlKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4+ICBzdGF0aWMgaW5saW5lIHZv
aWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKSB7fQo+PiAgc3RhdGljIGlubGluZSB2b2lkIGh5cGVy
dmlzb3JfYXBfc2V0dXAodm9pZCkge30KPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29y
X3Jlc3VtZSh2b2lkKSB7fQo+PiArc3RhdGljIGlubGluZSBjaGFyICpoeXBlcnZpc29yX25hbWUo
dm9pZCkgeyByZXR1cm4gTlVMTDsgfQo+IAo+IEkgdGhpbmsgeW91IHdhbnQgYW4gQVNTRVJUX1VO
UkVBQ0hBQkxFIGhlcmUsIHNpbmNlIGh5cGVydmlzb3JfbmFtZQo+IHNob3VsZG4ndCBiZSBjYWxs
ZWQgdW5sZXNzIFhlbiBoYXMgZGV0ZWN0ZWQgdGhhdCdzIHJ1bm5pbmcgYXMgYSBndWVzdCwKPiB3
aGljaCBjYW4gb25seSBoYXBwZW4gaWYgQ09ORklHX0dVRVNUIGlzIHNlbGVjdGVkLgoKQW5kIHBs
ZWFzZSBicmluZyBwcm90b3R5cGUgYW5kIHN0dWIgaW4gc3luYyByZXR1cm4tdHlwZS13aXNlLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
