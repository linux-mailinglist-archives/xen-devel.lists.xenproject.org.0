Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839281628DE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 15:49:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j449U-000343-UM; Tue, 18 Feb 2020 14:47:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j449T-00033u-Jc
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 14:47:07 +0000
X-Inumbo-ID: 8842297a-525d-11ea-8199-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8842297a-525d-11ea-8199-12813bfff9fa;
 Tue, 18 Feb 2020 14:47:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C25DBD79;
 Tue, 18 Feb 2020 14:47:05 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200130130649.14538-1-aisaila@bitdefender.com>
 <e20d6574-0e76-acf8-8b33-fb5a4fce7908@suse.com>
 <695f304c-2968-66fe-5a33-14c81d980d18@bitdefender.com>
 <1fd4b6fc-f380-ac8e-4b3d-394d48885fb7@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2a782b23-1ee3-1a3a-7455-51ccbf04cb35@suse.com>
Date: Tue, 18 Feb 2020 15:47:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1fd4b6fc-f380-ac8e-4b3d-394d48885fb7@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAyMCAxNTo0MiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4+
Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9oYXAvaGFwLmMKPj4+PiBAQCAtNDg4LDggKzQ4OCwxNyBAQCBpbnQgaGFwX2VuYWJsZShz
dHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKPj4+PiAgICAgICAgICAgICAgICBnb3RvIG91dDsK
Pj4+PiAgICAgICAgICAgIH0KPj4+PiAgICAKPj4+PiArICAgICAgICBpZiAoIChkLT5hcmNoLmFs
dHAybV93b3JraW5nX2VwdHAgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKSkgPT0gTlVMTCApCj4+Pj4g
KyAgICAgICAgewo+Pj4+ICsgICAgICAgICAgICBydiA9IC1FTk9NRU07Cj4+Pj4gKyAgICAgICAg
ICAgIGdvdG8gb3V0Owo+Pj4+ICsgICAgICAgIH0KPj4+Cj4+PiBJc24ndCB0aGVyZSBhIHByZS1l
eGlzdGluZyBlcnJvciBoYW5kbGluZyBpc3N1ZSBoZXJlIHdoaWNoIHlvdQo+Pj4gd2lkZW4sIGlu
IHRoYXQgbGF0ZXIgZW5jb3VudGVyZWQgZXJyb3JzIGRvbid0IGNhdXNlIGNsZWFuIHVwCj4+PiBv
ZiB3aGF0IGhhZCBhbHJlYWR5IHN1Y2NlZWRlZCBiZWZvcmU/Cj4+Cj4+IEl0IHNlZW1zIG5vbiBv
ZiB0aGUgZXJyb3JzIHBlcmZvcm0gYSBjbGVhbnVwLiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gaGF2
ZQo+PiBhIGdlbmVyYWwgY2xlYW51cCBkb25lIGF0ICJvdXQ6IiBpZiAoICFydiApIGFuZCB0aGVu
IGNoZWNrIHdoYXQgc2hvdWxkCj4+IGJlICJwMm1fdGVhcmRvd24oKSIgb3IgImZyZWVfeGVuaGVh
cF9wYWdlKCkiLgo+Pgo+IAo+IEkndmUgbG9va2VkIGFyb3VuZCBmb3IgdGhpcyBhbmQgaXQgaXMg
aGFuZGxlZCBpbiBhcmNoX2RvbWFpbl9jcmVhdGUoKS4KPiBJZiBodm1fZG9tYWluX2luaXRpYWxp
c2UoKSBmYWlscyB0aGVuIHBhZ2luZ19maW5hbF90ZWFyZG93bigpIGlzIGNhbGxlZCAKPiBhbmQg
aW4gdGhlIGVuZCBoYXBfZmluYWxfdGVhcmRvd24oKSB0YWtlcyBjYXJlIG9mIGNsZWFuaW5nIHVw
LgoKQWgsIGdvb2QgLSB0aGFua3MgZm9yIGNoZWNraW5nLiBUaGlzIGNvZGUgY291bGQgYmUgbW9y
ZSBvYnZpb3VzbHkKY29ycmVjdCwgdGhvdWdoLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
