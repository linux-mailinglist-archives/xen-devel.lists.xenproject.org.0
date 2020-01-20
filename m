Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89D14305D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 18:01:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itaNa-00012o-3I; Mon, 20 Jan 2020 16:58:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itaNY-00012j-0C
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:58:20 +0000
X-Inumbo-ID: 0c66e908-3ba6-11ea-b9a3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c66e908-3ba6-11ea-b9a3-12813bfff9fa;
 Mon, 20 Jan 2020 16:58:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 22961ABEA;
 Mon, 20 Jan 2020 16:58:14 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <20200108172500.1419665-1-dwmw2@infradead.org>
 <20200108172500.1419665-2-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ba7ecbc-a079-2dda-beed-d2bde4c9d646@suse.com>
Date: Mon, 20 Jan 2020 17:58:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108172500.1419665-2-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 2/3] x86/boot: Reserve live update boot
 memory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoyNCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEBAIC05ODAsNiAr
MTAxNSwyMiBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25n
IG1iaV9wKQo+ICAgICAgc2V0X2tleGVjX2NyYXNoX2FyZWFfc2l6ZSgodTY0KW5yX3BhZ2VzIDw8
IFBBR0VfU0hJRlQpOwo+ICAgICAga2V4ZWNfcmVzZXJ2ZV9hcmVhKCZib290X2U4MjApOwo+ICAK
PiArICAgIGlmICggbHVfYm9vdG1lbV9zdGFydCApCj4gKyAgICB7Cj4gKyAgICAgICAgLyogWFg6
IENoZWNrIGl0J3MgaW4gdXNhYmxlIG1lbW9yeSBmaXJzdCAqLwo+ICsgICAgICAgIHJlc2VydmVf
ZTgyMF9yYW0oJmJvb3RfZTgyMCwgbHVfYm9vdG1lbV9zdGFydCwgbHVfYm9vdG1lbV9zdGFydCAr
IGx1X2Jvb3RtZW1fc2l6ZSk7Cj4gKwo+ICsgICAgICAgIC8qIFNpbmNlIGl0IHdpbGwgYWxyZWFk
eSBiZSBvdXQgb2YgdGhlIGU4MjAgbWFwIGJ5IHRoZSB0aW1lIHRoZSBmaXJzdAo+ICsgICAgICAg
ICAqIGxvb3Agb3ZlciBwaHlzaWNhbCBtZW1vcnksIG1hcCBpdCBtYW51YWxseSBhbHJlYWR5LiAq
Lwo+ICsgICAgICAgIHNldF9wZHhfcmFuZ2UobHVfYm9vdG1lbV9zdGFydCA+PiBQQUdFX1NISUZU
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgKGx1X2Jvb3RtZW1fc3RhcnQgKyBsdV9ib290bWVt
X3NpemUpID4+IFBBR0VfU0hJRlQpOwo+ICsgICAgICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2ln
bmVkIGxvbmcpX192YShsdV9ib290bWVtX3N0YXJ0KSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIG1hZGRyX3RvX21mbihsdV9ib290bWVtX3N0YXJ0KSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgIFBGTl9ET1dOKGx1X2Jvb3RtZW1fc2l6ZSksIFBBR0VfSFlQRVJWSVNPUik7CgpEb2Vz
bid0IHRoaXMgcmVxdWlyZSB0aGUgcmFuZ2UgdG8gYmUgYSBtdWx0aXBsZSBvZiAyTWIgYW5kIGJl
bG93CjRHYj8gSSBkb24ndCBzZWUgdGhpcyBlbmZvcmNlZCBhbnl3aGVyZS4KCj4gQEAgLTEyNzgs
OCArMTM0OCw4IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxv
bmcgbWJpX3ApCj4gICAgICAgICAgeGVuaGVhcF9tYXhfbWZuKFBGTl9ET1dOKGhpZ2htZW1fc3Rh
cnQgLSAxKSk7Cj4gIAo+ICAgICAgLyoKPiAtICAgICAqIFdhbGsgZXZlcnkgUkFNIHJlZ2lvbiBh
bmQgbWFwIGl0IGluIGl0cyBlbnRpcmV0eSAob24geDg2LzY0LCBhdCBsZWFzdCkKPiAtICAgICAq
IGFuZCBub3RpZnkgaXQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLgo+ICsgICAgICogV2FsayBldmVy
eSBSQU0gcmVnaW9uIGFuZCBtYXAgaXQgaW4gaXRzIGVudGlyZXR5IGFuZCAodW5sZXNzIGluCj4g
KyAgICAgKiBsaXZlIHVwZGF0ZSBtb2RlKSBub3RpZnkgaXQgdG8gdGhlIGJvb3QgYWxsb2NhdG9y
Lgo+ICAgICAgICovCj4gICAgICBmb3IgKCBpID0gMDsgaSA8IGJvb3RfZTgyMC5ucl9tYXA7IGkr
KyApCj4gICAgICB7Cj4gQEAgLTEzMjksNiArMTM5OSw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJu
IF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAgICAgICAgICAgICAgICBwcmlu
dGsoWEVOTE9HX1dBUk5JTkcgIklnbm9yaW5nIGluYWNjZXNzaWJsZSBtZW1vcnkgcmFuZ2UiCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAlMDEzIlBSSXg2NCItJTAx
MyJQUkl4NjQiXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHMsIGUpOwo+ICsgICAgICAg
ICAgICAgICAgcmVzZXJ2ZV9lODIwX3JhbSgmYm9vdF9lODIwLCBzLCBlKTsKPiAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgIG1hcF9lID0g
ZTsKPiBAQCAtMTMzNiw2ICsxNDA3LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94
ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJO
SU5HICJJZ25vcmluZyBpbmFjY2Vzc2libGUgbWVtb3J5IHJhbmdlIgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIiAlMDEzIlBSSXg2NCItJTAxMyJQUkl4NjQiXG4iLAo+ICAg
ICAgICAgICAgICAgICAgICAgZSwgbWFwX2UpOwo+ICsgICAgICAgICAgICByZXNlcnZlX2U4MjBf
cmFtKCZib290X2U4MjAsIGUsIG1hcF9lKTsKPiAgICAgICAgICB9Cj4gIAo+ICAgICAgICAgIHNl
dF9wZHhfcmFuZ2UocyA+PiBQQUdFX1NISUZULCBlID4+IFBBR0VfU0hJRlQpOwoKV2hhdCBhcmUg
dGhlc2UgdHdvIGh1bmtzIG5lZWRlZCBmb3I/IFRoZSBjb21tZW50IHlvdSBjaGFuZ2UgZnVydGhl
ciB1cApyZWxhdGVzIHRvIC4uLgoKPiBAQCAtMTM0Niw3ICsxNDE4LDkgQEAgdm9pZCBfX2luaXQg
bm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgICAgICAgICAg
ICAgICAgICAgIEFSUkFZX1NJWkUobDJfaWRlbnRtYXApIDw8IEwyX1BBR0VUQUJMRV9TSElGVCk7
Cj4gIAo+ICAgICAgICAgIC8qIFBhc3MgbWFwcGVkIG1lbW9yeSB0byBhbGxvY2F0b3IgL2JlZm9y
ZS8gY3JlYXRpbmcgbmV3IG1hcHBpbmdzLiAqLwo+IC0gICAgICAgIGluaXRfYm9vdF9wYWdlcyhz
LCBtaW4obWFwX3MsIGUpKTsKPiArICAgICAgICBpZiAoICFsdV9yZXNlcnZlZCkKPiArICAgICAg
ICAgICAgaW5pdF9ib290X3BhZ2VzKHMsIG1pbihtYXBfcywgZSkpOwoKLi4uIHRoaXMgYWZhaWN0
LgoKQXBhcnQgZnJvbSB0aGlzLCBhbHNvIGFwcGxpY2FibGUgdG8gcGF0Y2ggMyAtIHdoZXJlIEkg
aGF2ZSBubyBvdGhlcgpjb21tZW50cyAtIHRoZXJlJ3MgcXVpdGUgYSBiaXQgb2Ygc3R5bGUgY2xl
YW51cCB0byBiIGRvbmUgaGVyZS4gQW5kCm9mIGNvdXJzZSB0aGUgbmV3IGNvbW1hbmQgbGluZSBv
cHRpb24gd2FudHMgZG9jdW1lbnRpbmcuIEkgY2FuJ3QKZS5nLiBndWVzcyB5ZXQgd2hhdCBsdV9k
YXRhIGlzIGFib3V0LCBhbmQgaGVuY2Ugd2h5IHRoaXMgaXMKYXBwYXJlbnRseSBhbiBhZGRyZXNz
IHdpdGhvdXQgYW4gYWNjb21wYW55aW5nIHNpemUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
