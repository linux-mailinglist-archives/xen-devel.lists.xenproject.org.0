Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB416955
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 19:37:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO3yY-0006wM-6I; Tue, 07 May 2019 17:33:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eprW=TH=citrix.com=prvs=0232d1aa4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hO3yW-0006wH-4w
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 17:33:56 +0000
X-Inumbo-ID: 48fc4ac5-70ee-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48fc4ac5-70ee-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 17:33:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,442,1549929600"; d="scan'208";a="85230819"
To: Jan Beulich <JBeulich@suse.com>
References: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
 <6c98dadd-748f-0d84-6937-62b6e126678f@citrix.com>
 <5C8215B602000078001500F6@prv1-mh.provo.novell.com>
 <372489A5-EBBA-4D8D-B986-EB159213C833@citrix.com>
 <5C825CC1020000780021CA3E@prv1-mh.provo.novell.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <f152a40d-9d9e-8256-3cfa-a92c3fa17854@citrix.com>
Date: Tue, 7 May 2019 18:33:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5C825CC1020000780021CA3E@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] trace: fix build with gcc9
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMy84LzE5IDEyOjE0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwOC4wMy4xOSBh
dCAxMjo1OCwgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4+Cj4+PiBPbiBN
YXIgOCwgMjAxOSwgYXQgNzoxMSBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToKPj4+Cj4+Pj4+PiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
IDAzLzA3LzE5IDE6MDIgUE0gPj4+Cj4+Pj4gT24gMy83LzE5IDEwOjM0IEFNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4gV2hpbGUgSSd2ZSBub3Qgb2JzZXJ2ZWQgdGhpcyBteXNlbGYsIGdjYyA5
IChpbW8gdmFsaWRseSkgcmVwb3J0ZWRseSBtYXkKPj4+Pj4gY29tcGxhaW4KPj4+Pj4KPj4+Pj4g
dHJhY2UuYzogSW4gZnVuY3Rpb24gJ19fdHJhY2VfaHlwZXJjYWxsJzoKPj4+Pj4gdHJhY2UuYzo4
MjY6MTk6IGVycm9yOiB0YWtpbmcgYWRkcmVzcyBvZiBwYWNrZWQgbWVtYmVyIG9mICdzdHJ1Y3Qg
PGFub255bW91cz4nIAo+PiBtYXkgcmVzdWx0IGluIGFuIHVuYWxpZ25lZCBwb2ludGVyIHZhbHVl
Cj4+Pj4+IFstV2Vycm9yPWFkZHJlc3Mtb2YtcGFja2VkLW1lbWJlcl0KPj4+Pj4gIDgyNiB8ICAg
ICB1aW50MzJfdCAqYSA9IGQuYXJnczsKPj4+Pgo+Pj4+IFdhaXQsIGlzIHRoaXMgc2F5aW5nIHRo
YXQgaW4gdGhpcyBjYXNlIChpLmUuLCB3aXRoIGEgc2luZ2xlIHVpbnQzMl90Cj4+Pj4gYmVmb3Jl
IGFyZ3MpLCB5b3UgKmRvKiBnZXQgYW4gdW5hbGlnbmVkIHBvaW50ZXIgdmFsdWUsIG9yIGp1c3Qg
dGhhdCBpZgo+Pj4+IHRoZSBzdHJ1Y3QgY2hhbmdlcyBpbiB0aGUgZnV0dXJlIHRoYXQgdGhlIHBv
aW50ZXIgdmFsdWUgbWF5IGJlY29tZQo+Pj4+IHVuLWFsaWduZWQ/Cj4+Pgo+Pj4gV2l0aCB0aGUg
X19wYWNrZWQgYXR0cmlidXRlLCB0aGUgY29tcGlsZXIgX2NvdWxkXyBwbGFjZSB0aGUgc3RydWN0
dXJlIGF0Cj4+PiBhIG1pc2FsaWduZWQgc2xvdCBvbiB0aGUgc3RhY2suIEl0IGhhcyBnb3Qgbm90
aGluZyB0byBkbyB3aXRoIHN0cnVjdCBsYXlvdXQKPj4+IGFmYWljdC4gTm90ZSBob3cgdGhlIGRp
YWdub3N0aWMgc2F5cyAibWF5Iiwgbm90ICJkb2Vz4oCdLgo+Pgo+PiBUaGF04oCZcyBpbnRlcmVz
dGluZyDigJQgc28gaXMgdGhlcmUgbm8gd2F5IHRvIHNwZWNpZnkgdGhhdCB0aGUgc3RydWN0IHNo
b3VsZCBiZSAKPj4gYWxpZ25lZCBidXQgdGhlIGluZGl2aWR1YWwgZWxlbWVudHMgbm90Pwo+IAo+
IEkgdGhpbmsgdGhlcmUgaXMgKG1hcmtpbmcgdGhlIGZpZWxkcyBfX3BhY2tlZCBhbmQgdGhlIHN0
cnVjdCBfX2FsaWduZWQoKSksCj4gYnV0IHRoYXQgd291bGRuJ3QgbmVjZXNzYXJpbHkgaGVscCAo
ZGVwZW5kaW5nIG9uIGhvdyB0aGUgY2hlY2tpbmcgZ2V0cwo+IGRvbiBpbnRlcm5hbCB0byB0aGUg
Y29tcGlsZXIpLgo+IAo+PiBJZiB0aGF04oCZcyB0aGUgY2FzZSwgd2hhdCBhYm91dCBkb2luZyBz
b21ldGhpbmcgbGlrZSB0aGUgYXR0YWNoZWQgaW5zdGVhZD8gIAo+PiBJdCBhdm9pZHMgaW50cm9k
dWNpbmcgYSBub3QtdmVyeS1vYnZpb3VzIEJVSUxEX0JVR19PTigpLCBhbmQgYWxzbyBJIHRoaW5r
IAo+PiBtYWtlcyB0aGUgYWxnb3JpdGhtIGEgKHRpbnkpIGJpdCBlYXNpZXIgdG8gZm9sbG93LiAg
KEFuZCBpZiB0aGUgCj4+IEJVSUxEX0JVR19PTigpIGV2ZXIgdHJpZ2dlcmVkLCB3ZeKAmWQgcHJv
YmFibHkgZW5kIHVwIGhhdmluZyB0byBkbyBzb21ldGhpbmcgCj4+IGxpa2UgdGhpcyBhbnl3YXku
KQo+IAo+IFRoYXQncyBhbiBvcHRpb24uIFlldCBkb24ndCBmb3JnZXQgdGhhdCB0aGUgY29tcGls
ZXIgbm90aWNpbmcgdGhlIGlzc3VlCj4gKGFuZCBzcGl0dGluZyBvdXQgdGhlIHdhcm5pbmcpIGxp
a2VseSBtZWFucyB0aGF0IGl0IHdvdWxkIHN0aWxsIHNwb3QgdGhlCj4gaXNzdWUsIGJ1dCBqdXN0
IGhhdmUgbm8gcmVhc29uIHRvIHdhcm4gYW55bW9yZS4gSXQgc3BvdHRpbmcgdGhlIGlzc3VlCj4g
d291bGQgbWVhbiB0aG91Z2ggdGhhdCBvbiBhcmNoaXRlY3R1cmVzIHdoZXJlIG1pcy1hbGlnbmVk
IGFjY2Vzc2VzCj4gbWF5IGZhdWx0LCBpdCBtYXkgdGhlbiBwcm9kdWNlIHByZXR0eSBpbmVmZmlj
aWVudCBjb2RlIGZvciBhIGNhc2Ugd2hlcmUKPiBzaW1wbGUgYWxpZ25lZCBhY2Nlc3NlcyB3b3Vs
ZCBiZSBmaW5lLgo+IAo+IElPVyBJIHByZWZlciBteSB2YXJpYW50IG9mIHRoZSB3b3JrYXJvdW5k
LCBidXQgeW91J3JlIHRoZSBtYWludGFpbmVyCj4gb2YgdGhpcyBjb2RlLCBzbyB5b3UndmUgZ290
IHRvIGRlY2lkZS4KClNvcnJ5LCBjb21pbmcgYmFjayB0byB0aGlzIHF1aXRlIGxhdGUuCgpTbyBt
eSBtYWluIHF1ZXN0aW9uIHdpdGggdGhlIEJVR19PTigpIGlzLCBzdXBwb3NlIGl0IHRyaWdnZXJz
OiB3aGF0IHdpbGwKdGhlIGZpeCBiZT8KCk15IG9yaWdpbmFsIGlkZWEgd2FzIHRoYXQgd2UnZCBl
bmQgdXAgZG9pbmcgYSBmaXggbGlrZSBvbmUgSSBzZW50CmFueXdheTsgaS5lLiwgcHV0dGluZyBi
YWNrIHRoZSBfX3BhY2tlZCBhdHRyaWJ1dGUgYnV0IGF2b2lkaW5nIHRha2luZyBhCnBvaW50ZXIg
Zm9yIGl0LiAgSW4gdGhhdCBjYXNlLCB3ZSBtaWdodCBhcyB3ZWxsIGRvIHRoZSBmaW5hbCBmaXgK
aW1tZWRpYXRlbHkgYW5kIHNhdmUgcGVvcGxlIHRoZSBoYXNzbGUuCgpCdXQgb2YgY291cnNlLCBp
ZiB0aGF0IHdvdWxkIGNhdXNlIGluZWZmaWNpZW50IG1pcy1hbGlnbmVkIGFjY2Vzc2VzLAp0aGVu
IG1heWJlIHdoYXQgd2UnZCBkbyBpcyBjaGFuZ2UgdGhlIGxheW91dCBvZiB0aGUgc3RydWN0dXJl
IHN1Y2ggdGhhdAppdCB3YXMgbmF0dXJhbGx5IHBhY2tlZCBhZ2FpbiAoZm9yIGluc3RhbmNlLCBi
eSBjaGFuZ2luZyBgb3BgIHRvIGJlaW5nCnVpbnQ2NF90IGluc3RlYWQpLiAgSW4gdGhhdCBjYXNl
LCB0aGVuIG1heWJlIGEgQlVHX09OKCkgd291bGQgYmUgYmV0dGVyLApmb3IgdGhlIHJlYXNvbnMg
eW91IGRlc2NyaWJlLgoKVGhvdWdodHM/CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
