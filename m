Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B488714F087
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:17:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixYwu-0005fe-VF; Fri, 31 Jan 2020 16:15:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixYwt-0005fZ-EB
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:15:15 +0000
X-Inumbo-ID: dd15877a-4444-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd15877a-4444-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 16:15:14 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYwq-0006uB-Uf; Fri, 31 Jan 2020 16:15:12 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixYwq-0006xl-Kf; Fri, 31 Jan 2020 16:15:12 +0000
Date: Fri, 31 Jan 2020 16:15:09 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200131161509.mjw2pvzjgv4zhdzc@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <6afc369b-a93e-1512-d6ea-f9260fb83c7c@suse.com>
 <20200131143716.gtdb5wwoagxpb223@debian>
 <c08b3b1d-3d88-98c4-b175-ab5e1d2ec8c4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c08b3b1d-3d88-98c4-b175-ab5e1d2ec8c4@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDQ6MzU6MjNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAxNTozNywgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgSmFu
IDMxLCAyMDIwIGF0IDAzOjI0OjA3UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDI5LjAxLjIwMjAgMjE6MjAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IEkgdHJpZWQgdXNpbmcgdGhl
IGFzbSgiLmVxdSAuLiIpIHRyaWNrIGJ1dCBoaXQgYSBwcm9ibGVtIHdpdGggJWMgYWdhaW4uCj4g
Pj4+Cj4gPj4+IG1tLmM6NTczNjo1OiBlcnJvcjogaW52YWxpZCAnYXNtJzogb3BlcmFuZCBpcyBu
b3QgYSBjb25kaXRpb24gY29kZSwgaW52YWxpZCBvcGVyYW5kIGNvZGUgJ2MnCj4gPj4+ICAgICAg
ICAgICAgICAgIGFzbSAoICIuZXF1IEhWX0hDQUxMX1BBR0UsICVjMDsgLmdsb2JhbCBIVl9IQ0FM
TF9QQUdFIgo+ID4+Cj4gPj4gV291bGQgeW91IG1pbmQgYWxzbyBpbmRpY2F0aW5nIHdoYXQgdGhl
IGlucHV0IG9wZXJhbmQgYWN0dWFsbHkKPiA+PiB3YXM/IEFjY29yZGluZyB0byBteSBsb29raW5n
IGF0IGdjYyBzb3VyY2VzIHdoZW4geW91IGZpcnN0Cj4gPj4gbWVudGlvbmVkIHRoaXMgKG9uIGly
YyBpaXJjKSwgbXVjaCBkZXBlbmRzIG9uIGl0IGFjdHVhbGx5IGJlCj4gPj4gcmVjb2duaXphYmxl
IGFzIGEgY29uc3RhbnQgYnkgdGhlIGNvbXBpbGVyLgo+ID4gCj4gPiBTb21ldGhpbmcgYWxvbmcg
dGhlIGxpbmU6Cj4gPiAKPiA+ICAgYXNtICggIi5lcXUgSFZfSENBTExfUEFHRSwgJWMwOyAuZ2xv
YmFsIEhWX0hDQUxMX1BBR0UiCj4gPiAgICAgICAgOjogImkiIChfX2ZpeF94X3RvX3ZpcnQoRklY
X1hfSFYuLi4pKQo+IAo+IFF1aXRlIGEgYml0IG9mIHBsYXlpbmcgbGF0ZXIsICVQMCBpcyBkb2N1
bWVudGVkLCBzdXBwb3J0ZWQKPiBhbHJlYWR5IGluIGdjYyA0LjEueCwgYW5kIGFsc28gdXNlZCBp
biBhIGZldyBjYXNlcyBieSBMaW51eC4KPiAlcDAgd291bGQgYmUgYW5vdGhlciBkb2N1bWVudGVk
IGFsdGVybmF0aXZlLCBidXQgc3VwcG9ydCBmb3IKPiB0aGlzIGxvb2tzIHRvIGhhdmUgYmVlbiBp
bnRyb2R1Y2VkIGxhdGVyLiBOb3QgYmVpbmcgYWJsZSB0byB1c2UKPiAlYzAgaGVyZSBzdGlsbCBz
bWVsbHMgbGlrZSBhIGJ1ZyAoYW5kIEkgZ3Vlc3MgSSdsbCBlbnRlciBvbmUuKQoKT0suIExldCBt
ZSB0cnkgdGhhdC4KCklmIHRoYXQgdHVybnMgb3V0IHN1Y2Nlc3NmdWwsIGRvIHlvdSB3YW50IG1l
IHRvIGNoYW5nZSB0aGUgb3RoZXIKaW5zdGFuY2UgdG8gJVAwIHRvbz8KCldlaS4KCj4gCj4gSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
