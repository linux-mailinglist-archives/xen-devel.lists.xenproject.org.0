Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C617A8AB
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:18:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9sAs-0005sx-UV; Thu, 05 Mar 2020 15:12:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9sAr-0005so-Jw
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:12:33 +0000
X-Inumbo-ID: bca675a2-5ef3-11ea-b74d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bca675a2-5ef3-11ea-b74d-bc764e2007e4;
 Thu, 05 Mar 2020 15:12:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 703A1B028;
 Thu,  5 Mar 2020 15:12:31 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-24-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12dea9ae-4610-0b1b-fe87-141221d61d71@suse.com>
Date: Thu, 5 Mar 2020 16:12:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-24-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 23/23] xen/build: use if_changed to
 build guest_%.o
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL1J1
bGVzLm1rCj4gKysrIGIveGVuL1J1bGVzLm1rCj4gQEAgLTExNSw2ICsxMTUsOSBAQCBlbmRpZgo+
ICAjIEZJWE1FIExUTyBicm9rZW4sIGJ1dCB3ZSB3b3VsZCBuZWVkIGEgZGlmZmVyZW50IHdheSB0
byBmaWx0ZXIgLWZsdG8gb3V0Cj4gICMgJChvYmotYmluLXkpOiBDRkxBR1MgOj0gJChmaWx0ZXIt
b3V0IC1mbHRvLCQoQ0ZMQUdTKSkKPiAgCj4gKyMgdGFyZ2V0IHdpdGggaXRzIHN1ZmZpeCBzdHJp
cHBlZAo+ICt0YXJnZXQtc3RlbSA9ICQoYmFzZW5hbWUgJEApCgpJJ2QgYXBwcmVjaWF0ZSBpZiB0
aGUgd29yZCAic3RlbSIgd2FzIHVzZWQgaW4gYSBtYWtlZmlsZSBvbmx5IGZvcgp3aGF0IG1ha2Ug
ZG9jIHVzZXMgaXQgZm9yIC0gdGhlIHBhcnQgb2YgdGhlIHRhcmdldCBvZiBhIHBhdHRlcm4KcnVs
ZSB0aGF0ICUgbWF0Y2hlcy4gSS5lLiBoZXJlIHBlcmhhcHMgbmFtZSB0aGUgdmFyaWFibGUKdGFy
Z2V0LWJhc2VuYW1lPyAoQnV0IHNlZSBiZWxvdywgbWF5YmUgdGhpcyBpc24ndCBuZWVkZWQuKQoK
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUKPiArKysgYi94ZW4vYXJjaC94ODYvbW0v
TWFrZWZpbGUKPiBAQCAtMTEsMTEgKzExLDE0IEBAIG9iai15ICs9IHAybS5vIHAybS1wdC5vCj4g
IG9iai0kKENPTkZJR19IVk0pICs9IHAybS1lcHQubyBwMm0tcG9kLm8KPiAgb2JqLXkgKz0gcGFn
aW5nLm8KPiAgCj4gLWd1ZXN0X3dhbGtfJS5vOiBndWVzdF93YWxrLmMgTWFrZWZpbGUKPiAtCSQo
Q0MpICQoY19mbGFncykgLURHVUVTVF9QQUdJTkdfTEVWRUxTPSQqIC1jICQ8IC1vICRACj4gKyQo
Zm9yZWFjaCBndywkKGZpbHRlciBndWVzdF93YWxrXyUubywkKG9iai15KSksXAo+ICsgICAgJChl
dmFsIENGTEFHU18kKGd3KSA9IC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kJCopKQoKU28gdGhlICQk
KiBoZXJlIG1hdGNoZXMgLi4uCgo+IC1ndWVzdF93YWxrXyUuaTogZ3Vlc3Rfd2Fsay5jIE1ha2Vm
aWxlCj4gLQkkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSwkKGNfZmxhZ3MpKSAtREdV
RVNUX1BBR0lOR19MRVZFTFM9JCogLWMgJDwgLW8gJEAKPiArZ3Vlc3Rfd2Fsa18lLm86IGd1ZXN0
X3dhbGsuYyBGT1JDRQo+ICsJJChjYWxsIGlmX2NoYW5nZWRfcnVsZSxjY19vX2MpCgouLi4gdGhl
IHN0ZW0gb2YgdGhlIHRhcmdldCBvZiB0aGlzIHJ1bGUuIFRoaXMgaXMgbm90IGdvb2QuIENhbid0
CnlvdSBoYXZlIHNvbWV0aGluZyBsaWtlCgpndWVzdF93YWxrXyUubyBndWVzdF93YWxrXyUuaSBn
dWVzdF93YWxrXyUuczogQ0ZMQUdTXyQodGFyZ2V0LXN0ZW0pLm8gPSAtREdVRVNUX1BBR0lOR19M
RVZFTFM9JCoKCm9uIGEgbGluZSBpbW1lZGlhdGVseSBhaGVhZCBvZiB0aGUgcnVsZSwgc28gdGhh
dCB0aGVtIGhhdmluZyB0bwptYXRjaCB1cCB3aWxsIGJlIHZlcnkgb2J2aW91cywgYW5kIGJyZWFr
YWdlIG9mIHRoZSBjb25uZWN0aW9uCnZlcnkgbm90aWNhYmxlPwoKKE9mIGNvdXJzZSB0aGlzIGFs
c28gZGVtb25zdHJhdGVzIHRoYXQgdHlpbmcgdGhlIENGTEFHUyBtb2RpZmllcgp0byB0aGUgb2Jq
ZWN0IGZpbGUgbmFtZSBtYXkgYmUgc2xpZ2h0bHkgY29uZnVzaW5nLiBCdXQgSSBkb24ndApoYXZl
IGEgYmV0dGVyIHN1Z2dlc3Rpb24uIFF1ZXN0aW9uIGlzIHdoZXRoZXIgaGVyZSB1c2Ugb2YgYW4K
b2JqZWN0IFtvciB3aGF0ZXZlciBlbHNlXSBmaWxlIHNwZWNpZmljIHZhcmlhYmxlIGlzIGhlbHBm
dWwgYXQKYWxsLCB3aGVuIG1ha2UgYWxyZWFkeSBvZmZlcnMgcGVyLXRhcmdldCB2YXJpYWJsZSBj
dXN0b21pemF0aW9uLgpJcyB0aGVyZSBhIHNwZWNpZmljIHJlYXNvbiB0aGUgYWJvdmUgY291bGRu
J3QgZS5nLiBiZQoKZ3Vlc3Rfd2Fsa18lLm8gZ3Vlc3Rfd2Fsa18lLmkgZ3Vlc3Rfd2Fsa18lLnM6
IENGTEFHUy15ICs9IC1ER1VFU1RfUEFHSU5HX0xFVkVMUz0kKgoKPykKCklmIHRoaXMgYWx0ZXJu
YXRpdmUgd29ya2VkLCB0aGVyZSdkIGJlIHRoZSBwb3NpdGl2ZSBzaWRlIGVmZmVjdApvZiB1cyBh
dm9pZGluZyB0aGUgdXNlIG9mICQoZXZhbCApIGhlcmUgLSBJU1RSIGl0IG5vdCB3b3JraW5nCnZl
cnkgcmVsaWFibHkgaW4gbWFrZSAzLjgwLCB3aGljaCB3ZSBzdGlsbCBkb2N1bWVudCBhcyBhY2Nl
cHRhYmxlCmZvciBidWlsZGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
