Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C5E9F28
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 16:35:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPpxz-0006Ps-VT; Wed, 30 Oct 2019 15:32:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPpxy-0006Pn-Gi
 for xen-devel@lists.xen.org; Wed, 30 Oct 2019 15:32:58 +0000
X-Inumbo-ID: 8bcf94f4-fb2a-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bcf94f4-fb2a-11e9-bbab-bc764e2007e4;
 Wed, 30 Oct 2019 15:32:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE0B1B33A;
 Wed, 30 Oct 2019 15:32:55 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191030145447.11122-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6856c427-0b9a-8e77-b087-9d0751472a36@suse.com>
Date: Wed, 30 Oct 2019 16:32:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030145447.11122-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 for 4.13 1/2] x86/boot: allow early usage
 of cpu_has_hypervisor
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMjAxOSAxNTo1NCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBAQCAtMzE3LDExICsz
MTYsNiBAQCB2b2lkIF9faW5pdCBlYXJseV9jcHVfaW5pdCh2b2lkKQo+ICAJYy0+eDg2X2NhcGFi
aWxpdHlbY3B1ZmVhdF93b3JkKFg4Nl9GRUFUVVJFX0ZQVSldID0gZWR4Owo+ICAJYy0+eDg2X2Nh
cGFiaWxpdHlbY3B1ZmVhdF93b3JkKFg4Nl9GRUFUVVJFX1NTRTMpXSA9IGVjeDsKPiAgCj4gLQlw
cmludGsoWEVOTE9HX0lORk8KPiAtCSAgICAgICAiQ1BVIFZlbmRvcjogJXMsIEZhbWlseSAldSAo
JSN4KSwgTW9kZWwgJXUgKCUjeCksIFN0ZXBwaW5nICV1IChyYXcgJTA4eClcbiIsCj4gLQkgICAg
ICAgeDg2X2NwdWlkX3ZlbmRvcl90b19zdHIoYy0+eDg2X3ZlbmRvciksIGMtPng4NiwgYy0+eDg2
LAo+IC0JICAgICAgIGMtPng4Nl9tb2RlbCwgYy0+eDg2X21vZGVsLCBjLT54ODZfbWFzaywgZWF4
KTsKCkknbSBzbGlnaHRseSBjb25jZXJuZWQgb2YgdGhlIGNvZGUgaW1tZWRpYXRlbHkgYWhlYWQg
b2YgdGhpcwpwcmludGsoKSBub3cgcnVubmluZyBfbXVjaF8gZWFybGllci4gRGlkIHlvdSBpbnNw
ZWN0IHRoYXQgdGhlcmUncwpubyBjaGFuZ2Ugb2YgdGhlIHJlbGV2YW50IGNsZWFyZWRfY2Fwc1td
IGVudHJpZXMgYmV0d2VlbiB0aGUgbmV3CmFuZCB0aGUgb2xkIGNhbGwgcG9zaXRpb24gaW4gc2V0
dXAuYz8KCj4gQEAgLTM0Miw2ICszMzYsMjEgQEAgdm9pZCBfX2luaXQgZWFybHlfY3B1X2luaXQo
dm9pZCkKPiAgCWluaXRpYWxpemVfY3B1X2RhdGEoMCk7Cj4gIH0KPiAgCj4gK3ZvaWQgX19pbml0
IGVhcmx5X2NwdV9wcmludF9pbmZvKHZvaWQpCj4gK3sKPiArCXN0cnVjdCBjcHVpbmZvX3g4NiAq
YyA9ICZib290X2NwdV9kYXRhOwoKY29uc3QKCj4gKwlpZiAodW5yZWNvZ25pc2VkX2NwdSkKPiAr
CQlwcmludGsoWEVOTE9HX0VSUgo+ICsJCSAgICAgICAiVW5yZWNvZ25pc2VkIG9yIHVuc3VwcG9y
dGVkIENQVSB2ZW5kb3IgJyUuMTJzJ1xuIiwKPiArCQkgICAgICAgYy0+eDg2X3ZlbmRvcl9pZCk7
Cj4gKwo+ICsJcHJpbnRrKFhFTkxPR19JTkZPICJDUFUgVmVuZG9yOiAlcywgRmFtaWx5ICV1ICgl
I3gpLCBNb2RlbCAldSAoJSN4KSwgIgo+ICsJCQkgICAiU3RlcHBpbmcgJXUgKHJhdyAlMDh4KVxu
IiwKPiArCSAgICAgICB4ODZfY3B1aWRfdmVuZG9yX3RvX3N0cihjLT54ODZfdmVuZG9yKSwgYy0+
eDg2LCBjLT54ODYsCj4gKwkgICAgICAgYy0+eDg2X21vZGVsLCBjLT54ODZfbW9kZWwsIGMtPng4
Nl9tYXNrLCBjcHVpZF9lYXgoMHgwMDAwMDAwMSkpOwoKTWF5IEkgc3VnZ2VzdCB0byB1c2UgdGhl
IHNob3J0ZXIgIjEiIGhlcmU/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gKysrIGIv
eGVuL2FyY2gveDg2L3NldHVwLmMKPiBAQCAtNzIzLDYgKzcyMyw4IEBAIHZvaWQgX19pbml0IG5v
cmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAgICAvKiBFbmFibGUg
Tk1Jcy4gIE91ciBsb2FkZXIgKGUuZy4gVGJvb3QpIG1heSBoYXZlIGxlZnQgdGhlbSBkaXNhYmxl
ZC4gKi8KPiAgICAgIGVuYWJsZV9ubWlzKCk7Cj4gIAo+ICsgICAgZWFybHlfY3B1X2luaXQoKTsK
PiArCj4gICAgICBpZiAoIHB2aF9ib290ICkKPiAgICAgIHsKPiAgICAgICAgICAvKgo+IEBAIC0x
NTE5LDcgKzE1MjEsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25l
ZCBsb25nIG1iaV9wKQo+ICAgICAgc29mdGlycV9pbml0KCk7Cj4gICAgICB0YXNrbGV0X3N1YnN5
c19pbml0KCk7Cj4gIAo+IC0gICAgZWFybHlfY3B1X2luaXQoKTsKPiArICAgIGVhcmx5X2NwdV9w
cmludF9pbmZvKCk7CgpJIGFncmVlIHdpdGggc3BsaXR0aW5nIHRoZSBmdW5jdGlvbiwgYnV0IEkg
Z3Vlc3MgdGhpcyBjb3VsZCBzdGlsbApiZSBtb3ZlZCB1cCBieSBxdWl0ZSBhIGJpdCwgbmV4dCB0
byB0aGUgcHJpbnRrKCktcyByaWdodCBhZnRlcgpjb25zb2xlX2luaXRfcHJlaXJxKCkuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
