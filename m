Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E36179FC1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 07:05:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9jZj-0005H8-Ti; Thu, 05 Mar 2020 06:01:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9jZj-0005H3-2c
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 06:01:39 +0000
X-Inumbo-ID: c69fa080-5ea6-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c69fa080-5ea6-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 06:01:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 23666B1AD;
 Thu,  5 Mar 2020 06:01:37 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
 <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
Date: Thu, 5 Mar 2020 07:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
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

T24gMDQuMDMuMjAgMTc6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjAzLjIwMjAgMTc6
MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA0LjAzLjIwIDE2OjE5LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA0LjAzLjIwMjAgMTY6MDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMDQuMDMuMjAgMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNi4wMi4y
MDIwIDEzOjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gK3N0YXRpYyB2b2lkIHVwZGF0
ZV9lcHRfcGFyYW1fYXBwZW5kKGNvbnN0IGNoYXIgKnN0ciwgaW50IHZhbCkKPj4+Pj4+ICt7Cj4+
Pj4+PiArICAgIGNoYXIgKnBvcyA9IG9wdF9lcHRfc2V0dGluZyArIHN0cmxlbihvcHRfZXB0X3Nl
dHRpbmcpOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICBzbnByaW50Zihwb3MsIHNpemVvZihvcHRfZXB0
X3NldHRpbmcpIC0gKHBvcyAtIG9wdF9lcHRfc2V0dGluZyksCj4+Pj4+PiArICAgICAgICAgICAg
ICIsJXM9JWQiLCBzdHIsIHZhbCk7Cj4+Pj4+PiArfQo+Pj4+Pj4gKwo+Pj4+Pj4gK3N0YXRpYyB2
b2lkIHVwZGF0ZV9lcHRfcGFyYW0odm9pZCkKPj4+Pj4+ICt7Cj4+Pj4+PiArICAgIHNucHJpbnRm
KG9wdF9lcHRfc2V0dGluZywgc2l6ZW9mKG9wdF9lcHRfc2V0dGluZyksICJwbWw9JWQiLCBvcHRf
ZXB0X3BtbCk7Cj4+Pj4+PiArICAgIGlmICggb3B0X2VwdF9hZCA+PSAwICkKPj4+Pj4+ICsgICAg
ICAgIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKCJhZCIsIG9wdF9lcHRfYWQpOwo+Pj4+Pgo+Pj4+
PiBUaGlzIHdvbid0IGNvcnJlY3RseSByZWZsZWN0IHJlYWxpdHk6IElmIHlvdSBsb29rIGF0Cj4+
Pj4+IHZteF9pbml0X3ZtY3NfY29uZmlnKCksIGV2ZW4gYSBuZWdhdGl2ZSB2YWx1ZSBtZWFucyAi
dHJ1ZSIgaGVyZSwKPj4+Pj4gdW5sZXNzIG9uIGEgc3BlY2lmaWMgQXRvbSBtb2RlbC4gSSB0aGlu
ayBpbml0X2VwdF9wYXJhbSgpIHdhbnRzCj4+Pj4+IHRvIGhhdmUgdGhhdCBlcnJhdHVtIHdvcmth
cm91bmQgbG9naWMgbW92ZWQgdGhlcmUsIHN1Y2ggdGhhdAo+Pj4+PiB5b3UgY2FuIHRoZW4gYXNz
bWUgdGhlIHZhbHVlIHRvIGJlIG5vbi1uZWdhdGl2ZSBoZXJlLgo+Pj4+Cj4+Pj4gQnV0IGlzbid0
IG5vdCBtZW50aW9uaW5nIGl0IGluIHRoZSAtMSBjYXNlIGNvcnJlY3Q/IC0xIG1lYW5zOiBkbyB0
aGUKPj4+PiBjb3JyZWN0IHRoaW5nIG9uIHRoZSBjdXJyZW50IGhhcmR3YXJlLgo+Pj4KPj4+IFdl
bGwsIEkgdGhpbmsgdGhlIG91dHB1dCBoZXJlIHNob3VsZCByZXByZXNlbnQgZWZmZWN0aXZlIHNl
dHRpbmdzLAo+Pgo+PiBUaGUgbWluaW11bSByZXF1aXJlbWVudCBpcyB0byByZWZsZWN0IHRoZSBl
ZmZlY3RpdmUgcGFyYW1ldGVycywgbGlrZQo+PiBjbWRsaW5lIGlzIGRvaW5nIGZvciBib290LXRp
bWUgb25seSBwYXJhbWV0ZXJzLiBXaXRoIHJ1bnRpbWUgcGFyYW1ldGVycwo+PiB3ZSBoYWQgbm8g
d2F5IG9mIHRlbGxpbmcgd2hhdCB3YXMgc2V0LCBhbmQgdGhpcyBpcyBub3cgcG9zc2libGUuCj4+
Cj4+PiBhbmQgYSBzdWItaXRlbSBzaG91bGQgYmUgc3VwcHJlc3NlZCBvbmx5IGlmIGEgc2V0dGlu
ZyBoYXMgbm8gZWZmZWN0Cj4+PiBhdCBhbGwgaW4gdGhlIGN1cnJlbnQgc2V0dXAsIGxpa2UgLi4u
Cj4+Pgo+Pj4+Pj4gKyAgICBpZiAoIG9wdF9lcHRfZXhlY19zcCA+PSAwICkKPj4+Pj4+ICsgICAg
ICAgIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKCJleGVjLXNwIiwgb3B0X2VwdF9leGVjX3NwKTsK
Pj4+Pj4KPj4+Pj4gSSBhZ3JlZSBmb3IgdGhpcyBvbmUgLSBpZiB0aGUgdmFsdWUgaXMgc3RpbGwg
LTEsIGl0IGhhcyBuZWl0aGVyCj4+Pj4+IGJlZW4gc2V0IG5vciBpcyBpdHMgdmFsdWUgb2YgYW55
IGludGVyZXN0Lgo+Pj4KPj4+IC4uLiBoZXJlLgo+Pgo+PiBJIHRoaW5rIHdlIHNob3VsZCBub3Qg
bWl4IHVwIHNwZWNpZmllZCBwYXJhbWV0ZXJzIGFuZCBlZmZlY3RpdmUKPj4gc2V0dGluZ3MuIElu
IGNhc2UgYW4gZWZmZWN0aXZlIHNldHRpbmcgaXMgb2YgY29tbW9uIGludGVyZXN0IGl0IHNob3Vs
ZAo+PiBiZSByZXBvcnRlZCB2aWEgYSBzcGVjaWZpYyBub2RlIChsaWtlIGUuZy4gc3BlY2lmaWMg
bWl0aWdhdGlvbiBzZXR0aW5ncwo+PiB3aGVyZSB0aGUgY21kbGluZSBpcyBub3QgcHJvdmlkaW5n
IGVub3VnaCBkZXRhaWxzKS4KPiAKPiBCdXQgdGhlbiBhIGJvb2xlYW4gb3B0aW9uIHRoYXQgd2Fz
bid0IHNwZWNpZmllZCBvbiB0aGUgY29tbWFuZCBsaW5lCj4gc2hvdWxkIHByb2R1Y2Ugbm8gb3V0
cHV0IGF0IGFsbC4gQW5kIGhlbmNlIHdlJ2QgbmVlZCBhIHdheSB0byB0ZWxsCj4gd2hldGhlciBh
biBvcHRpb24gd2FzIHNldCBmcm9tIGNvbW1hbmQgbGluZSBmb3IgX2FsbF8gb2YgdGhlbS4gSQo+
IGRvbid0IHRoaW5rIHRoaXMgd291bGQgYmUgdmVyeSBoZWxwZnVsLgoKSSBkaXNhZ3JlZSBoZXJl
LgoKVGhpcyBpcyBpbXBvcnRhbnQgb25seSBmb3IgY2FzZXMgd2hlcmUgdGhlIGh5cGVydmlzb3Ig
dHJlYXRzIHRoZQpwYXJhbWV0ZXIgYXMgYSB0cmlzdGF0ZTogdHJ1ZS9mYWxzZS91bnNwZWNpZmll
ZC4gSW4gYWxsIGNhc2VzIHdoZXJlCnRoZSBib29sIHZhbHVlIGlzIHJlYWxseSB0cnVlIG9yIGZh
bHNlIGl0IGNhbiBiZSByZXBvcnRlZCBhcyBzdWNoLgoKUmVwb3J0aW5nIDAvMSBmb3IgZS5nLiAi
YWQiIGlmIG9wdF9lcHRfYWQ9PS0xIHdvdWxkIGFkZCBhIGxhdGVudCBwcm9ibGVtCmlmIGFueSBv
dGhlciBhY3Rpb24gd291bGQgYmUgZGVyaXZlZCBmcm9tIHRoZSBwYXJhbWV0ZXIgdmFyaWFibGUg
YmVpbmcKLTEuCgpTbyBlaXRoZXIgb3B0X2VwdF9hZCBzaG91bGQgYmUgbW9kaWZpZWQgdG8gY2hh
bmdlIGl0IHRvIDAvMSBpbnN0ZWFkIG9mCm9ubHkgc2V0dGluZyB0aGUgVkNNUyBmbGFnLCBvciB0
aGUgbG9naWMgc2hvdWxkIGJlIGtlcHQgYXMgaXMgaW4gdGhpcwpwYXRjaC4gSU1PIGNoYW5naW5n
IHRoZSBzZXR0aW5nIG9mIG9wdF9lcHRfYWQgc2hvdWxkIGJlIGRvbmUgaW4gYW5vdGhlcgpwYXRj
aCBpZiB0aGlzIGlzIHJlYWxseSB3YW50ZWQuCgo+IAo+IEknbSBjdXJpb3VzIGlmIGFueW9uZSBl
bHNlIGhhcyBhbnkgb3BpbmlvbiBlaXRoZXIgd2F5IChvciB5ZXQKPiBhbm90aGVyIG9uZSkgaGVy
ZToKCk1lIHRvby4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
