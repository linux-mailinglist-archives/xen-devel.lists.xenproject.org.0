Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CACF114531
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 17:54:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icuL3-0007HG-CO; Thu, 05 Dec 2019 16:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icuL2-0007HB-9w
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 16:50:48 +0000
X-Inumbo-ID: 61234c3f-177f-11ea-8232-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61234c3f-177f-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 16:50:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C50BEAE44;
 Thu,  5 Dec 2019 16:50:44 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
Date: Thu, 5 Dec 2019 17:50:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAxNzoyNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA1LzEyLzIwMTkg
MTU6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL2tlcm5lbC5jCj4+
ICsrKyBiL3hlbi9jb21tb24va2VybmVsLmMKPj4gQEAgLTIzLDYgKzIzLDQ5IEBAIGVudW0gc3lz
dGVtX3N0YXRlIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEEKPj4gICB4ZW5fY29tbWFuZGxpbmVfdCBz
YXZlZF9jbWRsaW5lOwo+PiAgIHN0YXRpYyBjb25zdCBjaGFyIF9faW5pdGNvbnN0IG9wdF9idWls
dGluX2NtZGxpbmVbXSA9IENPTkZJR19DTURMSU5FOwo+PiAgIAo+PiArc3RhdGljIGludCBjZGlm
Zih1bnNpZ25lZCBjaGFyIGMxLCB1bnNpZ25lZCBjaGFyIGMyKQo+IAo+IFRoaXMgaXMgbm90IG9i
dmlvdXMgZnJvbSB0aGUgbmFtZSBhbmQgdGhlIGltcGxlbWVudGF0aW9uIHdoYXQgaXQgZG9lcyAK
PiAoaXQgdG9vayBtZSBhIGZldyBtaW51dGVzIHRvIGZpZ3VyZSBpdCBvdXQpLiBTbyBJIHRoaW5r
IHlvdSB3YW50IHRvIGFkZCAKPiBhIGNvbW1lbnQuCgpTdXJlLCBkb25lLgoKPj4gK3sKPj4gKyAg
ICBpbnQgcmVzID0gYzEgLSBjMjsKPj4gKwo+PiArICAgIGlmICggcmVzICYmIChjMSBeIGMyKSA9
PSAoJy0nIF4gJ18nKSAmJgo+PiArICAgICAgICAgKGMxID09ICctJyB8fCBjMSA9PSAnXycpICkK
Pj4gKyAgICAgICAgcmVzID0gMDsKPj4gKwo+PiArICAgIHJldHVybiByZXM7Cj4+ICt9Cj4+ICsK
Pj4gKy8qCj4+ICsgKiBTdHJpbmcgY29tcGFyaXNvbiBmdW5jdGlvbnMgbW9zdGx5IG1hdGNoaW5n
IHN0cmNtcCgpIC8gc3RybmNtcCgpLAo+PiArICogZXhjZXB0IHRoYXQgdGhleSB0cmVhdCAnLScg
YW5kICdfJyBhcyBtYXRjaGluZyBvbmUgYW5vdGhlci4KPj4gKyAqLwo+PiArc3RhdGljIGludCBf
c3RyY21wKGNvbnN0IGNoYXIgKnMxLCBjb25zdCBjaGFyICpzMikKPiAKPiBJIHRob3VnaHQgd2Ug
d2VyZSB0cnlpbmcgdG8gYXZvaWQgbmV3IGZ1bmN0aW9uIG5hbWUgd2l0aCBsZWFkaW5nIF8/CgpX
ZSdyZSB0cnlpbmcgdG8gYXZvaWQgbmV3IG5hbWUgc3BhY2UgdmlvbGF0aW9ucy4gU3VjaCBhcmUK
LSBpZGVudGlmaWVycyBzdGFydGluZyB3aXRoIHR3byB1bmRlcnNjb3JlcywKLSBpZGVudGlmaWVy
cyBzdGFydGluZyB3aXRoIGFuIHVuZGVyc2NvcmUgYW5kIGFuIHVwcGVyIGNhc2UgbGV0dGVyLAot
IGlkZW50aWZpZXJzIG9mIG5vbi1zdGF0aWMgc3ltYm9scyBzdGFydGluZyB3aXRoIGFuIHVuZGVy
c2NvcmUuCgo+IEJ1dCBpdCBpcyByZWFsbHkgd29ydGggdG8gaW1wbGVtZW50IGJvdGggc3RyY21w
IGFuZCBzdHJuY21wIHJhdGhlciB0aGFuIAo+IHVzaW5nIHRoZSBsYXR0ZXIgdG8gaW1wbGVtZW50
IHRoZSBmb3JtZXI/Cj4gCj4gSSBrbm93IHRoaXMgaW52b2x2ZSB1c2luZyBzdHJsZW4sIGJ1dCBJ
IGFtIG5vdCBjb252aW5jZWQgdGhpcyB3aWxsIGJlIAo+IG5vdGljZWFibGUgYXQgYm9vdC4KClRv
IGJlIGhvbmVzdCAtIGl0IGRpZG4ndCBldmVuIG9jY3VyIHRvIG1lLiBUaGUgZnVuY3Rpb25zIHNl
ZW1lZApzaW1wbGUgZW5vdWdoIHRvIG5vdCBoYXZlIG9uZSB1c2UgdGhlIG90aGVyLiBJZiBvdGhl
cnMgYWdyZWUKd2l0aCB5b3UsIEknZCBiZSBmaW5lIGRvaW5nIGFzIHlvdSBzdWdnZXN0LgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
