Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE6A9F00
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 11:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5oRl-0007xa-B5; Thu, 05 Sep 2019 09:52:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5oRk-0007xV-C4
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 09:52:56 +0000
X-Inumbo-ID: ee30806a-cfc2-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee30806a-cfc2-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 09:52:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4EE4ADBB;
 Thu,  5 Sep 2019 09:52:52 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190905093416.2955-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7464a0e-c730-d506-d8f6-76804953e2a1@suse.com>
Date: Thu, 5 Sep 2019 11:52:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905093416.2955-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxMTozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgbGli
eGwgY29kZSB3aWxsIGFsd2F5cyBlbmFibGUgSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVAp
LAo+IGV4cGVjdGluZyB0aGF0IHRoZSBoeXBlcnZpc29yIHdpbGwgZmFsbGJhY2sgdG8gc2hhZG93
IGlmIEhBUCBpcyBub3QKPiBhdmFpbGFibGUuIFdpdGggdGhlIGNoYW5nZXMgdG8gdGhlIGRvbWFp
biBidWlsZGVyIHRoYXQncyBub3QgdGhlIGNhc2UKPiBhbnkgbG9uZ2VyLCBhbmQgdGhlIGh5cGVy
dmlzb3Igd2lsbCByYWlzZSBhbiBlcnJvciBpZiBIQVAgaXMgbm90Cj4gYXZhaWxhYmxlIGluc3Rl
YWQgb2Ygc2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIHNoYWRvdy4KCldvdWxkIGl0IHJlYWxseSBi
ZSBtdWNoIG1vcmUgaW52b2x2ZWQgdGhhbiB0aGUgY2hhbmdlIGhlcmUgdG8gcmVzdG9yZQpzaWxl
bnQgZGVmYXVsdGluZyB0byBzaGFkb3c/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNj
dGwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+IEBAIC05MCw2ICs5MCwx
MCBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF90YnVmX29wIHsKPiAgIC8qICh4ODYpIFRoZSBwbGF0Zm9y
bSBzdXBwb3J0cyBkaXJlY3QgYWNjZXNzIHRvIEkvTyBkZXZpY2VzIHdpdGggSU9NTVUuICovCj4g
ICNkZWZpbmUgX1hFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbyAgICAgMgo+ICAjZGVmaW5lIFhF
Tl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbyAgKDF1PDxfWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVj
dGlvKQo+ICsvKiAoeDg2KSBUaGUgcGxhdGZvcm0gc3VwcG9ydHMgSGFyZHdhcmUgQXNzaXN0ZWQg
UGFnaW5nLiAqLwo+ICsjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfaGFwICAgICAgICAgIDMK
PiArI2RlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBfaGFwICAgICAgICAgICAoMXU8PF9YRU5fU1lT
Q1RMX1BIWVNDQVBfaGFwKQoKSSB0aGluayB0aGlzIGJpdCB3YW50cyB0byBiZSB1bml2ZXJzYWwg
KGkuZS4gIih4ODYpIiBkcm9wcGVkKSwgYW5kCmJlIHNldCB1bmNvbmRpdGlvbmFsbHkgb24gQXJt
LiBJcnJlc3BlY3RpdmUgb2YgdGhlIHF1ZXN0aW9uIHJlZ2FyZGluZwphbiBhbHRlcm5hdGl2ZSBz
b2x1dGlvbiBJIHRoaW5rIGl0IGlzIHF1aXRlIHNlbnNpYmxlIHRvIGV4cG9zZQphdmFpbGFiaWxp
dHkgb2YgSEFQIHRvIHRoZSB0b29scy4gSW4gZmFjdCBJIHRoaW5rICJ4bCBpbmZvIiBzaG91bGQK
c2hvdyB0aGlzIGFsb25nc2lkZSBvdGhlciBwcm9wZXJ0aWVzLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
