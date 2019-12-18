Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B5124561
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:09:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihX9P-0007Hs-0G; Wed, 18 Dec 2019 11:05:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihX9N-0007Hk-OV
 for xen-devel@lists.xen.org; Wed, 18 Dec 2019 11:05:53 +0000
X-Inumbo-ID: 5aafa81e-2186-11ea-905e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5aafa81e-2186-11ea-905e-12813bfff9fa;
 Wed, 18 Dec 2019 11:05:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E176AE57;
 Wed, 18 Dec 2019 11:05:51 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
Date: Wed, 18 Dec 2019 12:06:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217154625.31561-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMjAxOSAxNjo0NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBIaWRlIHRoZSBmb2xs
b3dpbmcgaW5mb3JtYXRpb24gdGhhdCBjYW4gaGVscCBpZGVudGlmeSB0aGUgcnVubmluZyBYZW4K
PiBiaW5hcnkgdmVyc2lvbjoKPiAKPiAgICAgWEVOVkVSX2V4dHJhdmVyc2lvbgo+ICAgICBYRU5W
RVJfY29tcGlsZV9pbmZvCj4gICAgIFhFTlZFUl9jYXBhYmlsaXRpZXMKCldoYXQncyB3cm9uZyB3
aXRoIGV4cG9zaW5nIHRoaXMgb25lPwoKPiAgICAgWEVOVkVSX2NoYW5nZXNldAo+ICAgICBYRU5W
RVJfY29tbWFuZGxpbmUKPiAgICAgWEVOVkVSX2J1aWxkX2lkCj4gCj4gUmV0dXJuIGEgbW9yZSBj
dXN0b21lciBmcmllbmRseSBlbXB0eSBzdHJpbmcgaW5zdGVhZCBvZiAiPGRlbmllZD4iCj4gd2hp
Y2ggd291bGQgYmUgc2hvd24gaW4gdG9vbHMgbGlrZSBkbWlkZWNvZGUuCgpJIHRoaW5rICI8ZGVu
aWVkPiIgaXMgcXVpdGUgZmluZSBmb3IgbWFueSBvZiB0aGUgb3JpZ2luYWwgcHVycG9zZXMuCk1h
eWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBmaWx0ZXIgZm9yIHRoaXMgd2hlbiBwb3B1bGF0aW5n
IGd1ZXN0CkRNSSB0YWJsZXM/Cgo+IEJ1dCBhbGxvdyBndWVzdHMgdG8gc2VlIHRoaXMgaW5mb3Jt
YXRpb24gaW4gRGVidWcgYnVpbGRzIG9mIFhlbi4KCkJlaGF2aW9yIGxpa2UgdGhpcyB3b3VsZCBp
bW8gYmV0dGVyIG5vdCBkaWZmZXIgYmV0d2VlbiBkZWJ1ZyBhbmQKcmVsZWFzZSBidWlsZHMsIG9y
IGVsc2UgZ3Vlc3Qgc29mdHdhcmUgbWF5IGJlaGF2ZSBlbnRpcmVseQpkaWZmZXJlbnRseSBvbmNl
IHlvdSBwdXQgaXQgb24gYSBwcm9kdWN0aW9uIGJ1aWxkLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS94
c20vZHVtbXkuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oCj4gQEAgLTc1MCwxNiAr
NzUwLDIxIEBAIHN0YXRpYyBYU01fSU5MSU5FIGludCB4c21feGVuX3ZlcnNpb24gKFhTTV9ERUZB
VUxUX0FSRyB1aW50MzJfdCBvcCkKPiAgICAgIGNhc2UgWEVOVkVSX2dldF9mZWF0dXJlczoKPiAg
ICAgICAgICAvKiBUaGVzZSBzdWItb3BzIGlnbm9yZSB0aGUgcGVybWlzc2lvbiBjaGVja3MgYW5k
IHJldHVybiBkYXRhLiAqLwo+ICAgICAgICAgIHJldHVybiAwOwo+IC0gICAgY2FzZSBYRU5WRVJf
ZXh0cmF2ZXJzaW9uOgo+IC0gICAgY2FzZSBYRU5WRVJfY29tcGlsZV9pbmZvOgo+IC0gICAgY2Fz
ZSBYRU5WRVJfY2FwYWJpbGl0aWVzOgo+IC0gICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0Ogo+ICAg
ICAgY2FzZSBYRU5WRVJfcGFnZXNpemU6Cj4gICAgICBjYXNlIFhFTlZFUl9ndWVzdF9oYW5kbGU6
Cj4gICAgICAgICAgLyogVGhlc2UgTVVTVCBhbHdheXMgYmUgYWNjZXNzaWJsZSB0byBhbnkgZ3Vl
c3QgYnkgZGVmYXVsdC4gKi8KClRoaXMgY29tbWVudCwgbm90IHRoZSBsZWFzdCBiZWNhdXNlIG9m
IGl0cyB1c2Ugb2YgY2FwaXRhbHMsCnN1Z2dlc3RzIHRvIG1lIHRoYXQgdGhlcmUncyBmdXJ0aGVy
IGp1c3RpZmljYXRpb24gbmVlZGVkIGZvcgp5b3VyIGNoYW5nZSwgaW5jbHVkaW5nIGRpc2N1c3Np
b24gb2Ygd2h5IHRoZXJlJ3Mgbm8gcmlzayBvZgpicmVha2luZyBleGlzdGluZyBndWVzdHMuCgo+
ICAgICAgICAgIHJldHVybiB4c21fZGVmYXVsdF9hY3Rpb24oWFNNX0hPT0ssIGN1cnJlbnQtPmRv
bWFpbiwgTlVMTCk7Cj4gKwo+ICsgICAgY2FzZSBYRU5WRVJfZXh0cmF2ZXJzaW9uOgo+ICsgICAg
Y2FzZSBYRU5WRVJfY29tcGlsZV9pbmZvOgo+ICsgICAgY2FzZSBYRU5WRVJfY2FwYWJpbGl0aWVz
Ogo+ICsgICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0Ogo+ICsgICAgY2FzZSBYRU5WRVJfY29tbWFu
ZGxpbmU6Cj4gKyAgICBjYXNlIFhFTlZFUl9idWlsZF9pZDoKPiAgICAgIGRlZmF1bHQ6CgpUaGVy
ZSdzIG5vIG5lZWQgdG8gYWRkIGFsbCBvZiB0aGVzZSBuZXh0IHRvIHRoZSBkZWZhdWx0IGNhc2Uu
Ck5vdGUgaG93IGNvbW1hbmRsaW5lIGFuZCBidWlsZF9pZCBoYXZlIGJlZW4gY29taW5nIGhlcmUg
YWxyZWFkeQooYW5kIHRoZXJlIHdvdWxkIG5lZWQgdG8gYmUgZnVydGhlciBqdXN0aWZpY2F0aW9u
IGZvciBleHBvc2luZwp0aGVtIG9uIGRlYnVnIGJ1aWxkcywgc2hvdWxkIHRoaXMgcXVlc3Rpb25h
YmxlIGJlaGF2aW9yIC0gc2VlCmFib3ZlIC0gYmUgcmV0YWluZWQpLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
