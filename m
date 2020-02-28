Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AB173958
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 15:02:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7gA0-0001BG-UL; Fri, 28 Feb 2020 13:58:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7g9z-0001BB-4J
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:58:35 +0000
X-Inumbo-ID: 686b0dce-5a32-11ea-b472-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 686b0dce-5a32-11ea-b472-bc764e2007e4;
 Fri, 28 Feb 2020 13:58:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C153EAFA9;
 Fri, 28 Feb 2020 13:58:32 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50f937d7-dceb-e7a1-5e0d-9f239d49dd5c@suse.com>
Date: Fri, 28 Feb 2020 14:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219174354.84726-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/7] x86/hap: improve hypervisor assisted
 guest TLB flush
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9oYXAvaGFwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCj4g
QEAgLTY2OSwzMiArNjY5LDI4IEBAIHN0YXRpYyB2b2lkIGhhcF91cGRhdGVfY3IzKHN0cnVjdCB2
Y3B1ICp2LCBpbnQgZG9fbG9ja2luZywgYm9vbCBub2ZsdXNoKQo+ICAgICAgaHZtX3VwZGF0ZV9n
dWVzdF9jcjModiwgbm9mbHVzaCk7Cj4gIH0KPiAgCj4gKy8qCj4gKyAqIE5COiBkb2Vzbid0IGFj
dHVhbGx5IHBlcmZvcm0gYW55IGZsdXNoLCB1c2VkIGp1c3QgdG8gY2xlYXIgdGhlIENQVSBmcm9t
IHRoZQo+ICsgKiBtYXNrIGFuZCBoZW5jZSBzaWduYWwgdGhhdCB0aGUgZ3Vlc3QgVExCIGZsdXNo
IGhhcyBiZWVuIGRvbmUuCj4gKyAqLwoKImhhcyBiZWVuIGRvbmUiIGlzbid0IGNvcnJlY3QsIGFz
IHRoZSBmbHVzaCBtYXkgaGFwcGVuIG9ubHkgbGF0ZXIKb24gKHVwb24gbmV4dCBWTSBlbnRyeSku
IEkgdGhpbmsgd29yZGluZyBoZXJlIG5lZWRzIHRvIGJlIGFzCnByZWNpc2UgYXMgcG9zc2libGUs
IGhvd2V2ZXIgdGhlIGNvbW1lbnQgbWF5IHR1cm4gb3V0IHVubmVjZXNzYXJ5CmFsdG9nZXRoZXI6
Cgo+IEBAIC03MDUsMjAgKzcwMSwyMiBAQCBib29sIGhhcF9mbHVzaF90bGIoYm9vbCAoKmZsdXNo
X3ZjcHUpKHZvaWQgKmN0eHQsIHN0cnVjdCB2Y3B1ICp2KSwKPiAgICAgICAgICBpZiAoICFmbHVz
aF92Y3B1KGN0eHQsIHYpICkKPiAgICAgICAgICAgICAgY29udGludWU7Cj4gIAo+IC0gICAgICAg
IHBhZ2luZ191cGRhdGVfY3IzKHYsIGZhbHNlKTsKPiArICAgICAgICBodm1fYXNpZF9mbHVzaF92
Y3B1KHYpOwo+ICAKPiAgICAgICAgICBjcHUgPSByZWFkX2F0b21pYygmdi0+ZGlydHlfY3B1KTsK
PiAtICAgICAgICBpZiAoIGlzX3ZjcHVfZGlydHlfY3B1KGNwdSkgKQo+ICsgICAgICAgIGlmICgg
Y3B1ICE9IHRoaXNfY3B1ICYmIGlzX3ZjcHVfZGlydHlfY3B1KGNwdSkgKQo+ICAgICAgICAgICAg
ICBfX2NwdW1hc2tfc2V0X2NwdShjcHUsIG1hc2spOwo+ICAgICAgfQo+ICAKPiAtICAgIC8qIEZs
dXNoIFRMQnMgb24gYWxsIENQVXMgd2l0aCBkaXJ0eSB2Y3B1IHN0YXRlLiAqLwo+IC0gICAgZmx1
c2hfdGxiX21hc2sobWFzayk7Cj4gLQo+IC0gICAgLyogRG9uZS4gKi8KPiAtICAgIGZvcl9lYWNo
X3ZjcHUgKCBkLCB2ICkKPiAtICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1
KGN0eHQsIHYpICkKPiAtICAgICAgICAgICAgdmNwdV91bnBhdXNlKHYpOwo+ICsgICAgLyoKPiAr
ICAgICAqIFRyaWdnZXIgYSB2bWV4aXQgb24gYWxsIHBDUFVzIHdpdGggZGlydHkgdkNQVSBzdGF0
ZSBpbiBvcmRlciB0byBmb3JjZSBhbgo+ICsgICAgICogQVNJRC9WUElEIGNoYW5nZSBhbmQgaGVu
Y2UgYWNjb21wbGlzaCBhIGd1ZXN0IFRMQiBmbHVzaC4gTm90ZSB0aGF0IHZDUFVzCj4gKyAgICAg
KiBub3QgY3VycmVudGx5IHJ1bm5pbmcgd2lsbCBhbHJlYWR5IGJlIGZsdXNoZWQgd2hlbiBzY2hl
ZHVsZWQgYmVjYXVzZSBvZgo+ICsgICAgICogdGhlIEFTSUQgdGlja2xlIGRvbmUgaW4gdGhlIGxv
b3AgYWJvdmUuCj4gKyAgICAgKi8KPiArICAgIG9uX3NlbGVjdGVkX2NwdXMobWFzaywgaGFuZGxl
X2ZsdXNoLCBtYXNrLCAwKTsKPiArICAgIHdoaWxlICggIWNwdW1hc2tfZW1wdHkobWFzaykgKQo+
ICsgICAgICAgIGNwdV9yZWxheCgpOwoKV2h5IGRvIHlvdSBwYXNzIDAgYXMgbGFzdCBhcmd1bWVu
dD8gSWYgeW91IHBhc3NlZCAxLCB5b3Ugd291bGRuJ3QKbmVlZCB0aGUgd2hpbGUoKSBoZXJlLCBo
YW5kbGVfZmx1c2goKSBjb3VsZCBiZSBlbXB0eSwgYW5kIHlvdSdkCnNhdmUgYSBwZXJoYXBzIGxh
cmdlIGFtb3VudCBvZiBDUFVzIHRvIGFsbCB0cnkgdG8gbW9kaWZ5IHR3bwpjYWNoZSBsaW5lcyAo
dGhlIG9uZSB1c2VkIGJ5IG9uX3NlbGVjdGVkX2NwdXMoKSBpdHNlbGYgYW5kIHRoZQpvbmUgaGVy
ZSkgaW5zdGVhZCBvZiBqdXN0IG9uZS4gWWVzLCBsYXRlbmN5IGZyb20gdGhlIGxhc3QgQ1BVCmNs
ZWFyaW5nIGl0cyBiaXQgdG8geW91IGJlaW5nIGFibGUgdG8gZXhpdCBmcm9tIGhlcmUgbWF5IGJl
IGEKbGl0dGxlIGxhcmdlciB0aGlzIHdheSwgYnV0IG92ZXJhbGwgbGF0ZW5jeSBtYXkgc2hyaW5r
IHdpdGggdGhlCmN1dCBieSBoYWxmIGFtb3VudCBvZiBhdG9taWMgb3BzIGlzc3VlZCB0byB0aGUg
YnVzLgoKKEZvcmNpbmcgYW4gZW1wdHkgZnVuY3Rpb24gdG8gYmUgY2FsbGVkIG1heSBzZWVtIG9k
ZCwgYnV0IHNlbmRpbmcKIGp1c3Qgc29tZSBJUEkgW2xpa2UgdGhlIGV2ZW50IGNoZWNrIG9uZV0g
d291bGRuJ3QgYmUgZW5vdWdoLCBhcwogeW91IHdhbnQgdG8gYmUgc3VyZSB0aGUgb3RoZXIgc2lk
ZSBoYXMgYWN0dWFsbHkgcmVjZWl2ZWQgdGhlCiByZXF1ZXN0LikKCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
