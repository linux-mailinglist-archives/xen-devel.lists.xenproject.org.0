Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA6E17B926
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:23:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA99c-0003Wd-MI; Fri, 06 Mar 2020 09:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D+BG=4X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jA99b-0003WX-Ux
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:20:23 +0000
X-Inumbo-ID: b46fc33c-5f8b-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b46fc33c-5f8b-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 09:20:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B01AAC1E;
 Fri,  6 Mar 2020 09:20:21 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
 <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
 <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
 <1c86f9c7-c2fd-e2d9-67ef-ceefa95a9851@suse.com>
 <9d239e78-49bd-43be-1096-8cdfa7a29e5a@suse.com>
 <a593f09f-1e79-8b87-7399-0c03161a5ad6@suse.com>
 <0b6e7f36-786c-f788-0c13-7e0ed41d77df@suse.com>
 <ca0ee3e7-bd09-bdeb-da6a-f4acaa96f27a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <01015fd9-61bf-99a9-8e83-a87ddf4ed6b4@suse.com>
Date: Fri, 6 Mar 2020 10:20:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ca0ee3e7-bd09-bdeb-da6a-f4acaa96f27a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAgMTA6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA2LjAzLjIwMjAgMDk6
NDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA2LjAzLjIwIDA5OjIwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA2LjAzLjIwMjAgMDc6NDIsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMDUuMDMuMjAgMDk6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNS4wMy4y
MDIwIDA3OjAxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDMuMjAgMTc6NTYs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA0LjAzLjIwMjAgMTc6MzEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+Pj4+Pj4+IE9uIDA0LjAzLjIwIDE2OjE5LCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4+Pj4+IE9uIDA0LjAzLjIwMjAgMTY6MDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4+Pj4+Pj4gT24gMDQuMDMuMjAgMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4+
PiBPbiAyNi4wMi4yMDIwIDEzOjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4g
K3N0YXRpYyB2b2lkIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKGNvbnN0IGNoYXIgKnN0ciwgaW50
IHZhbCkKPj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+PiArICAgIGNoYXIgKnBvcyA9IG9wdF9l
cHRfc2V0dGluZyArIHN0cmxlbihvcHRfZXB0X3NldHRpbmcpOwo+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+
Pj4+Pj4+Pj4gKyAgICBzbnByaW50Zihwb3MsIHNpemVvZihvcHRfZXB0X3NldHRpbmcpIC0gKHBv
cyAtIG9wdF9lcHRfc2V0dGluZyksCj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgICIsJXM9JWQi
LCBzdHIsIHZhbCk7Cj4+Pj4+Pj4+Pj4+PiArfQo+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+Pj4g
K3N0YXRpYyB2b2lkIHVwZGF0ZV9lcHRfcGFyYW0odm9pZCkKPj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+
Pj4+Pj4+PiArICAgIHNucHJpbnRmKG9wdF9lcHRfc2V0dGluZywgc2l6ZW9mKG9wdF9lcHRfc2V0
dGluZyksICJwbWw9JWQiLCBvcHRfZXB0X3BtbCk7Cj4+Pj4+Pj4+Pj4+PiArICAgIGlmICggb3B0
X2VwdF9hZCA+PSAwICkKPj4+Pj4+Pj4+Pj4+ICsgICAgICAgIHVwZGF0ZV9lcHRfcGFyYW1fYXBw
ZW5kKCJhZCIsIG9wdF9lcHRfYWQpOwo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBUaGlzIHdvbid0
IGNvcnJlY3RseSByZWZsZWN0IHJlYWxpdHk6IElmIHlvdSBsb29rIGF0Cj4+Pj4+Pj4+Pj4+IHZt
eF9pbml0X3ZtY3NfY29uZmlnKCksIGV2ZW4gYSBuZWdhdGl2ZSB2YWx1ZSBtZWFucyAidHJ1ZSIg
aGVyZSwKPj4+Pj4+Pj4+Pj4gdW5sZXNzIG9uIGEgc3BlY2lmaWMgQXRvbSBtb2RlbC4gSSB0aGlu
ayBpbml0X2VwdF9wYXJhbSgpIHdhbnRzCj4+Pj4+Pj4+Pj4+IHRvIGhhdmUgdGhhdCBlcnJhdHVt
IHdvcmthcm91bmQgbG9naWMgbW92ZWQgdGhlcmUsIHN1Y2ggdGhhdAo+Pj4+Pj4+Pj4+PiB5b3Ug
Y2FuIHRoZW4gYXNzbWUgdGhlIHZhbHVlIHRvIGJlIG5vbi1uZWdhdGl2ZSBoZXJlLgo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4gQnV0IGlzbid0IG5vdCBtZW50aW9uaW5nIGl0IGluIHRoZSAtMSBjYXNl
IGNvcnJlY3Q/IC0xIG1lYW5zOiBkbyB0aGUKPj4+Pj4+Pj4+PiBjb3JyZWN0IHRoaW5nIG9uIHRo
ZSBjdXJyZW50IGhhcmR3YXJlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdlbGwsIEkgdGhpbmsgdGhl
IG91dHB1dCBoZXJlIHNob3VsZCByZXByZXNlbnQgZWZmZWN0aXZlIHNldHRpbmdzLAo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBUaGUgbWluaW11bSByZXF1aXJlbWVudCBpcyB0byByZWZsZWN0IHRoZSBlZmZl
Y3RpdmUgcGFyYW1ldGVycywgbGlrZQo+Pj4+Pj4+PiBjbWRsaW5lIGlzIGRvaW5nIGZvciBib290
LXRpbWUgb25seSBwYXJhbWV0ZXJzLiBXaXRoIHJ1bnRpbWUgcGFyYW1ldGVycwo+Pj4+Pj4+PiB3
ZSBoYWQgbm8gd2F5IG9mIHRlbGxpbmcgd2hhdCB3YXMgc2V0LCBhbmQgdGhpcyBpcyBub3cgcG9z
c2libGUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBhbmQgYSBzdWItaXRlbSBzaG91bGQgYmUgc3VwcHJl
c3NlZCBvbmx5IGlmIGEgc2V0dGluZyBoYXMgbm8gZWZmZWN0Cj4+Pj4+Pj4+PiBhdCBhbGwgaW4g
dGhlIGN1cnJlbnQgc2V0dXAsIGxpa2UgLi4uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gKyAgICBp
ZiAoIG9wdF9lcHRfZXhlY19zcCA+PSAwICkKPj4+Pj4+Pj4+Pj4+ICsgICAgICAgIHVwZGF0ZV9l
cHRfcGFyYW1fYXBwZW5kKCJleGVjLXNwIiwgb3B0X2VwdF9leGVjX3NwKTsKPj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4gSSBhZ3JlZSBmb3IgdGhpcyBvbmUgLSBpZiB0aGUgdmFsdWUgaXMgc3RpbGwg
LTEsIGl0IGhhcyBuZWl0aGVyCj4+Pj4+Pj4+Pj4+IGJlZW4gc2V0IG5vciBpcyBpdHMgdmFsdWUg
b2YgYW55IGludGVyZXN0Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IC4uLiBoZXJlLgo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBub3QgbWl4IHVwIHNwZWNpZmllZCBwYXJhbWV0ZXJz
IGFuZCBlZmZlY3RpdmUKPj4+Pj4+Pj4gc2V0dGluZ3MuIEluIGNhc2UgYW4gZWZmZWN0aXZlIHNl
dHRpbmcgaXMgb2YgY29tbW9uIGludGVyZXN0IGl0IHNob3VsZAo+Pj4+Pj4+PiBiZSByZXBvcnRl
ZCB2aWEgYSBzcGVjaWZpYyBub2RlIChsaWtlIGUuZy4gc3BlY2lmaWMgbWl0aWdhdGlvbiBzZXR0
aW5ncwo+Pj4+Pj4+PiB3aGVyZSB0aGUgY21kbGluZSBpcyBub3QgcHJvdmlkaW5nIGVub3VnaCBk
ZXRhaWxzKS4KPj4+Pj4+Pgo+Pj4+Pj4+IEJ1dCB0aGVuIGEgYm9vbGVhbiBvcHRpb24gdGhhdCB3
YXNuJ3Qgc3BlY2lmaWVkIG9uIHRoZSBjb21tYW5kIGxpbmUKPj4+Pj4+PiBzaG91bGQgcHJvZHVj
ZSBubyBvdXRwdXQgYXQgYWxsLiBBbmQgaGVuY2Ugd2UnZCBuZWVkIGEgd2F5IHRvIHRlbGwKPj4+
Pj4+PiB3aGV0aGVyIGFuIG9wdGlvbiB3YXMgc2V0IGZyb20gY29tbWFuZCBsaW5lIGZvciBfYWxs
XyBvZiB0aGVtLiBJCj4+Pj4+Pj4gZG9uJ3QgdGhpbmsgdGhpcyB3b3VsZCBiZSB2ZXJ5IGhlbHBm
dWwuCj4+Pj4+Pgo+Pj4+Pj4gSSBkaXNhZ3JlZSBoZXJlLgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgaXMg
aW1wb3J0YW50IG9ubHkgZm9yIGNhc2VzIHdoZXJlIHRoZSBoeXBlcnZpc29yIHRyZWF0cyB0aGUK
Pj4+Pj4+IHBhcmFtZXRlciBhcyBhIHRyaXN0YXRlOiB0cnVlL2ZhbHNlL3Vuc3BlY2lmaWVkLiBJ
biBhbGwgY2FzZXMgd2hlcmUKPj4+Pj4+IHRoZSBib29sIHZhbHVlIGlzIHJlYWxseSB0cnVlIG9y
IGZhbHNlIGl0IGNhbiBiZSByZXBvcnRlZCBhcyBzdWNoLgo+Pj4+Pgo+Pj4+PiBUaGUgcHJvYmxl
bSBJJ20gaGF2aW5nIHdpdGggdGhpcyBpcyB0aGUgcmVzdWx0aW5nIGluY29uc2lzdGVuY3k6Cj4+
Pj4+IFdoZW4gd2Ugd3JpdGUgdGhlIHZhcmlhYmxlIHdpdGggMCBvciAxIGluIGNhc2Ugd2UgZmlu
ZCBpdCB0byBiZQo+Pj4+PiAtMSBhZnRlciBjb21tYW5kIGxpbmUgcGFyc2luZywgdGhlIGV4dGVy
bmFsbHkgdmlzaWJsZSBlZmZlY3Qgd2lsbAo+Pj4+PiBiZSBkaWZmZXJlbnQgZnJvbSB0aGUgY2Fz
ZSB3aGVyZSB3ZSBsZWF2ZSBpdCB0byBiZSAtMSB5ZXQgc3RpbGwKPj4+Pj4gdHJlYXQgaXQgYXMg
KHBzZXVkby0pYm9vbGVhbi4gVGhpcywgaG93ZXZlciwgaXMgYW4gaW1wbGVtZW50YXRpb24KPj4+
Pj4gZGV0YWlsLCB3aGlsZSBpbW8gdGhlIGh5cGZzIHByZXNlbnRhdGlvbiBzaG91bGQgbm90IGRl
cGVuZCBvbgo+Pj4+PiBzdWNoIGltcGxlbWVudGF0aW9uIGRldGFpbHMuCj4+Pj4+Cj4+Pj4+PiBS
ZXBvcnRpbmcgMC8xIGZvciBlLmcuICJhZCIgaWYgb3B0X2VwdF9hZD09LTEgd291bGQgYWRkIGEg
bGF0ZW50IHByb2JsZW0KPj4+Pj4+IGlmIGFueSBvdGhlciBhY3Rpb24gd291bGQgYmUgZGVyaXZl
ZCBmcm9tIHRoZSBwYXJhbWV0ZXIgdmFyaWFibGUgYmVpbmcKPj4+Pj4+IC0xLgo+Pj4+Pj4KPj4+
Pj4+IFNvIGVpdGhlciBvcHRfZXB0X2FkIHNob3VsZCBiZSBtb2RpZmllZCB0byBjaGFuZ2UgaXQg
dG8gMC8xIGluc3RlYWQgb2YKPj4+Pj4+IG9ubHkgc2V0dGluZyB0aGUgVkNNUyBmbGFnLAo+Pj4+
Pgo+Pj4+PiBUaGF0J3Mgd2hhdCBJIGRpZCBzdWdnZXN0Lgo+Pj4+Pgo+Pj4+Pj4gb3IgdGhlIGxv
Z2ljIHNob3VsZCBiZSBrZXB0IGFzIGlzIGluIHRoaXMKPj4+Pj4+IHBhdGNoLiBJTU8gY2hhbmdp
bmcgdGhlIHNldHRpbmcgb2Ygb3B0X2VwdF9hZCBzaG91bGQgYmUgZG9uZSBpbiBhbm90aGVyCj4+
Pj4+PiBwYXRjaCBpZiB0aGlzIGlzIHJlYWxseSB3YW50ZWQuCj4+Pj4+Cj4+Pj4+IEFuZCBvZiBj
b3Vyc2UgSSBkb24ndCBtaW5kIGF0IGFsbCBkb2luZyBzbyBpbiBhIHByZXJlcSBwYXRjaC4KPj4+
Pj4gSXQncyBqdXN0IHRoYXQgdGhlIHBhdGNoIGhlcmUgcHJvdmlkZXMgYSBnb29kIHBsYWNlIF93
aGVyZV8gdG8KPj4+Pj4gYWN0dWFsbHkgZG8gc3VjaCBhbiBhZGp1c3RtZW50Lgo+Pj4+Cj4+Pj4g
SSB3YXMgdGhpbmtpbmcgb2Ygc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Pgo+Pj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14
L3ZtY3MuYwo+Pj4+IEBAIC0zMTMsMTIgKzMxMywxMiBAQCBzdGF0aWMgaW50IHZteF9pbml0X3Zt
Y3NfY29uZmlnKHZvaWQpCj4+Pj4gICAgICAgICB7Cj4+Pj4gICAgICAgICAgICAgcmRtc3JsKE1T
Ul9JQTMyX1ZNWF9FUFRfVlBJRF9DQVAsIF92bXhfZXB0X3ZwaWRfY2FwKTsKPj4+Pgo+Pj4+ICsg
ICAgICAgIGlmICggLyogV29yayBhcm91bmQgRXJyYXR1bSBBVlI0MSBvbiBBdm90b24gcHJvY2Vz
c29ycy4gKi8KPj4+PiArICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2ID09IDYgJiYgYm9v
dF9jcHVfZGF0YS54ODZfbW9kZWwgPT0gMHg0ZCAmJgo+Pj4+ICsgICAgICAgICAgICAgb3B0X2Vw
dF9hZCA8IDAgKQo+Pj4+ICsgICAgICAgICAgICBvcHRfZXB0X2FkID0gMDsKPj4+PiAgICAgICAg
ICAgICBpZiAoICFvcHRfZXB0X2FkICkKPj4+PiAgICAgICAgICAgICAgICAgX3ZteF9lcHRfdnBp
ZF9jYXAgJj0gflZNWF9FUFRfQURfQklUOwo+Pj4+IC0gICAgICAgIGVsc2UgaWYgKCAvKiBXb3Jr
IGFyb3VuZCBFcnJhdHVtIEFWUjQxIG9uIEF2b3RvbiBwcm9jZXNzb3JzLiAqLwo+Pj4+IC0gICAg
ICAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4NiA9PSA2ICYmIGJvb3RfY3B1X2RhdGEueDg2
X21vZGVsID09IDB4NGQgJiYKPj4+PiAtICAgICAgICAgICAgICAgICAgb3B0X2VwdF9hZCA8IDAg
KQo+Pj4+IC0gICAgICAgICAgICBfdm14X2VwdF92cGlkX2NhcCAmPSB+Vk1YX0VQVF9BRF9CSVQ7
Cj4+Pj4KPj4+PiAgICAgICAgICAgICAvKgo+Pj4+ICAgICAgICAgICAgICAqIEFkZGl0aW9uYWwg
c2FuaXR5IGNoZWNraW5nIGJlZm9yZSB1c2luZyBFUFQ6Cj4+Pgo+Pj4gQW5kIEkgd2FzIHNwZWNp
ZmljYWxseSBob3BpbmcgdG8gYXZvaWQgZG9pbmcgdGhpcyBpbiBhIG5vbi1fX2luaXQKPj4+IGZ1
bmN0aW9uLgo+Pgo+PiBTaG91bGQgYmUgZmFpcmx5IGVhc3kgKHNlZSBhdHRhY2hlZCBwYXRjaCku
Cj4gCj4gV2h5IG5vdCBwdXQgdGhlIG9wdF9lcHRfYWQgYWRqdXN0bWVudCByaWdodCBpbnRvIHN0
YXJ0X3ZteCgpLAo+IGp1c3QgbGlrZSBlLmcuIHRoZSBvcHRfZXB0X2V4ZWNfc3AgZ2V0cyBhbHNv
IGRvbmUgdGhlcmU/IFB1bGxpbmcKPiB0aGUgc2V0dGluZyB1cCBvZiB0aGUgJ3YnIGtleSBoYW5k
bGVyIHJpc2tzIGluc3RhbGxpbmcgaXQgYWhlYWQKPiBvZiBhIHBvdGVudGlhbCBmdXR1cmUgbGF0
ZXIgZXJyb3IgZXhpdCBmcm9tIHN0YXJ0X3ZteCgpLiBCdXQgSSdtCgpJcyB0aGlzIHJlYWxseSBw
cm9ibGVtYXRpYz8KCkhvdyBwcm9iYWJsZSBpcyBpdCB0byBoYXZlIGEgSFZNIGRvbWFpbiBydW5u
aW5nIHdoZW4gYW4gZWFybHkgZXJyb3IKZXhpdCBmcm9tIHN0YXJ0X3ZteCgpIGhhcHBlbmVkICho
aW50OiBodm1fZW5hYmxlZCB3aWxsIGJlIDAgaW4gdGhpcwpjYXNlKSA/Cgo+IG5vdCBlbnRpcmVs
eSBvcHBvc2VkIHRvIHRoZSBjaG9zZW4gYXBwcm9hY2ggZWl0aGVyIC0gaXQnbGwgYmUgdXAKPiB0
byBLZXZpbiB0byBqdWRnZSwgSSBndWVzcy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
