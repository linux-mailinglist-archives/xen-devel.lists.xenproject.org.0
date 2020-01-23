Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AD14691A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 14:30:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iucWR-0004k2-B0; Thu, 23 Jan 2020 13:27:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iucWP-0004jx-F8
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 13:27:45 +0000
X-Inumbo-ID: 1e4434ce-3de4-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e4434ce-3de4-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 13:27:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 332CBAC92;
 Thu, 23 Jan 2020 13:27:35 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <63d1bdfc-9000-7471-f4f2-7c7f2e931bfe@suse.com>
 <ed7e3960a25447c5b262666db346c05c@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfeb4c67-1338-9871-794b-8645e3158f46@suse.com>
Date: Thu, 23 Jan 2020 14:27:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ed7e3960a25447c5b262666db346c05c@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] cmdline: treat hyphens and underscores
 the same
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxMzoxMSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDIz
IEphbnVhcnkgMjAyMCAxMTo0Mwo+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxp
ZW4gR3JhbGwKPj4gPGp1bGllbkB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJh
ZCBXaWxrCj4+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPjsKPj4gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT47IElhbiBKYWNrc29uCj4+IDxpYW4uamFja3NvbkBjaXRyaXguY29tPgo+PiBT
dWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjJdIGNtZGxpbmU6IHRyZWF0IGh5cGhlbnMgYW5k
IHVuZGVyc2NvcmVzIHRoZQo+PiBzYW1lCj4+Cj4+IEluIG9yZGVyIHRvIGF2b2lkIHBlcm1hbmVu
dGx5IGhhdmluZyB0byBhc2sgdGhhdCBubyBuZXcgY29tbWFuZCBsaW5lCj4+IG9wdGlvbnMgdXNp
bmcgdW5kZXJzY29yZXMgYmUgaW50cm9kdWNlZCAoYWxiZWl0IEknbSBsaWtlbHkgdG8gc3RpbGwg
bWFrZQo+PiByZW1hcmtzKSwgYW5kIGluIG9yZGVyIHRvIGFsc28gYWxsb3cgZXh0ZW5kaW5nIHRo
ZSB1c2Ugb2YgaHlwaGVucyB0bwo+PiBwcmUtZXhpc3Rpbmcgb25lcywgaW50cm9kdWNlIGN1c3Rv
bSBjb21wYXJpc29uIGZ1bmN0aW9ucyB0cmVhdGluZyBib3RoCj4+IGNoYXJhY3RlcnMgYXMgbWF0
Y2hpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPj4gLS0tCj4+IHYyOiBSZW5hbWUgdG8gb3B0X3N0cnssbn1jbXAoKS4gRG9uJ3QgdXNlIHRo
ZSBuZXcgZnVuY3Rpb24gZm9yIGNvbWFwcmluZwo+PiAgICAgYWdhaW5zdCAibm8tIiBpbiBwYXJz
ZV9wYXJhbXMoKS4gQWRkIGNvbW1lbnQgdG8gY2RpZmYoKS4KPj4KPj4gLS0tIGEvZG9jcy9taXNj
L3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4+ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1s
aW5lLnBhbmRvYwo+PiBAQCAtNzIsNiArNzIsMTEgQEAgU29tZSBvcHRpb25zIHRha2UgYSBjb21t
YSBzZXBhcmF0ZWQgbGlzdAo+PiAgU29tZSBwYXJhbWV0ZXJzIGFjdCBhcyBjb21iaW5hdGlvbnMg
b2YgdGhlIGFib3ZlLCBtb3N0IGNvbW1vbmx5IGEgbWl4Cj4+ICBvZiBCb29sZWFuIGFuZCBTdHJp
bmcuICBUaGVzZSBhcmUgbm90ZWQgaW4gdGhlIHJlbGV2YW50IHNlY3Rpb25zLgo+Pgo+PiArIyMj
IFNwZWxsaW5nCj4+ICsKPj4gK1BhcmFtZXRlciBuYW1lcyBtYXkgaW5jbHVkZSBoeXBoZW5zIG9y
IHVuZGVyc2NvcmVzLiAgVGhlc2UgYXJlCj4+ICtnZW5lcmFsbHkgYmVpbmcgdHJlYXRlZCBhcyBt
YXRjaGluZyBvbmUgYW5vdGhlciBieSB0aGUgcGFyc2luZyBsb2dpYy4KPj4gKwo+PiAgIyMgUGFy
YW1ldGVyIGRldGFpbHMKPj4KPj4gICMjIyBhY3BpCj4+IC0tLSBhL3hlbi9jb21tb24va2VybmVs
LmMKPj4gKysrIGIveGVuL2NvbW1vbi9rZXJuZWwuYwo+PiBAQCAtMjMsNiArMjMsNTMgQEAgZW51
bSBzeXN0ZW1fc3RhdGUgc3lzdGVtX3N0YXRlID0gU1lTX1NUQQo+PiAgeGVuX2NvbW1hbmRsaW5l
X3Qgc2F2ZWRfY21kbGluZTsKPj4gIHN0YXRpYyBjb25zdCBjaGFyIF9faW5pdGNvbnN0IG9wdF9i
dWlsdGluX2NtZGxpbmVbXSA9IENPTkZJR19DTURMSU5FOwo+Pgo+PiArLyoKPj4gKyAqIENhbGN1
bGF0ZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHR3byBjaGFyYWN0ZXJzIGZvciBjb21tYW5kIGxp
bmUKPj4gcGFyc2luZwo+PiArICogcHVycG9zZXMsIGkuZS4gdHJlYXRpbmcgJy0nIGFuZCAnXycg
dGhlIHNhbWUuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgY2RpZmYodW5zaWduZWQgY2hhciBjMSwg
dW5zaWduZWQgY2hhciBjMikKPj4gK3sKPj4gKyAgICBpbnQgcmVzID0gYzEgLSBjMjsKPj4gKwo+
PiArICAgIGlmICggcmVzICYmIChjMSBeIGMyKSA9PSAoJy0nIF4gJ18nKSAmJgo+PiArICAgICAg
ICAgKGMxID09ICctJyB8fCBjMSA9PSAnXycpICkKPj4gKyAgICAgICAgcmVzID0gMDsKPj4gKwo+
IAo+IFdvdyEgVGhhdCBtYWtlcyBteSBoZWFkIGh1cnQuIEhvdyBhYm91dDoKPiAKPiBzdGF0aWMg
aW50IGNkaWZmKHVuc2lnbmVkIGNoYXIgYzEsIHVuc2lnbmVkIGNoYXIgYzIpCj4gewo+ICAgICBp
ZiAoIGMxID09ICctJyApCj4gICAgICAgICBjMSA9ICdfJzsKPiAKPiAgICAgaWYgKCBjMiA9PSAn
LScgKQo+ICAgICAgICAgYzIgPSAnXyc7Cj4gCj4gICAgIHJldHVybiBjMSAtIGMyOwo+IH0KPiAK
PiA/CgpUaGlzIHdvdWxkIHdvcmsgZm9yIHRoZSBjdXJyZW50IHVzZXMgd2hlcmUgdWx0aW1hdGVs
eSB0aGUKcmVzdWx0IGlzIG9ubHkgZXZhbHVhdGVkIGZvciBiZWluZyAobm9uLSl6ZXJvLCBidXQg
d291bGRuJ3QKYmUgY29ycmVjdCB3aGVuIHVzZWQgZm9yIGFjdHVhbCBjb2xsYXRpb24uCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
