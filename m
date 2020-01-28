Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3314BD29
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:43:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSww-0001Vy-K6; Tue, 28 Jan 2020 15:38:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwSwu-0001Vt-Ut
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:38:44 +0000
X-Inumbo-ID: 43c5423e-41e4-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43c5423e-41e4-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 15:38:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ABA6FABED;
 Tue, 28 Jan 2020 15:38:42 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-2-liuwe@microsoft.com>
 <da7d04bd-b2cf-996b-df83-49d928040ae1@suse.com>
 <20200128151520.al3xp7yxntdpq5el@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <345b5392-2f89-0a37-bac8-e88b0714028c@suse.com>
Date: Tue, 28 Jan 2020 16:38:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128151520.al3xp7yxntdpq5el@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/7] x86: provide executable fixmap
 facility
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNjoxNSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAyMywgMjAy
MCBhdCAxMjowNDowMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMDEuMjAy
MCAyMToyMywgV2VpIExpdSB3cm90ZToKPj4+IFRoaXMgYWxsb3dzIHVzIHRvIHNldCBhc2lkZSBz
b21lIGFkZHJlc3Mgc3BhY2UgZm9yIGV4ZWN1dGFibGUgbWFwcGluZy4KPj4+IFRoaXMgZml4ZWQg
bWFwIHJhbmdlIHN0YXJ0cyBmcm9tIFhFTl9WSVJUX0VORCBzbyB0aGF0IGl0IGlzIHdpdGhpbiBy
ZWFjaAo+Pj4gb2YgdGhlIC50ZXh0IHNlY3Rpb24uCj4+Pgo+Pj4gU2hpZnQgdGhlIHBlcmNwdSBz
dHViIHJhbmdlIGFuZCBsaXZlcGF0Y2ggcmFuZ2UgYWNjb3JkaW5nbHkuCj4+Cj4+IEhtbSwgdGhl
IGxpdmVwYXRjaCByYW5nZSBnZXRzIHNocnVuaywgbm90IHNoaWZ0ZWQsIGJ1dCB5ZXMuIElzIHRo
ZXJlCj4+IGEgcGFydGljdWxhciByZWFzb24gd2h5IHlvdSBtb3ZlIHRoZSBzdHVicyBhcmVhIGRv
d24/IEl0IGxvb2tzIGFzIGlmCj4+IHRoZSBwYXRjaCB3b3VsZCBiZSBzbWFsbGVyIG92ZXJhbGwg
aWYgeW91IGRpZG4ndC4gKFBvc3NpYmx5IGRvd24KPj4gdGhlIHJvYWQgdGhlIHN0dWJzIGFyZWEg
Y291bGQgYmUgbWFkZSBwYXJ0IG9mIHRoZSBGSVhBRERSX1ggcmFuZ2UKPj4gYW55d2F5LikKPiAK
PiBJIHRoaW5rIGhhdmluZyBhIHdlbGwta25vd24gZml4ZWQgYWRkcmVzcyBpcyBtb3JlIHVzZWZ1
bCBmb3IgZGVidWdnaW5nLgo+IAo+IEdvaW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kIHdvdWxkIG1l
YW4gdGhlIGh5cGVyY2FsbCBwYWdlIGxvY2F0aW9uCj4gYmVjb21lcyBkZXBlbmRlbnQgb24gdGhl
IG51bWJlciBvZiBDUFVzIGNvbmZpZ3VyZWQuCgpEZXBlbmRpbmcgb24gaG93IGZ1dHVyZSBpbnNl
cnRpb25zIGFyZSBkb25lIGludG8KZW51bSBmaXhlZF9hZGRyZXNzZXNfeCwgdGhlIGFkZHJlc3Mg
YWxzbyB3b24ndCBiZSAid2VsbC1rbm93biBmaXhlZCIuCgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9maXhtYXAuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9maXhtYXAuaAo+
Pj4gQEAgLTE1LDYgKzE1LDkgQEAKPj4+ICAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KPj4+ICAKPj4+
ICAjZGVmaW5lIEZJWEFERFJfVE9QIChWTUFQX1ZJUlRfRU5EIC0gUEFHRV9TSVpFKQo+Pj4gKyNk
ZWZpbmUgRklYQUREUl9YX1RPUCAoWEVOX1ZJUlRfRU5EIC0gUEFHRV9TSVpFKQo+Pj4gKy8qIFRo
aXMgY29uc3RhbnQgaXMgZGVyaXZlZCBmcm9tIGVudW0gZml4ZWRfYWRkcmVzc2VzX3ggYmVsb3cg
Ki8KPj4+ICsjZGVmaW5lIE1BWF9GSVhBRERSX1hfU0laRSAoMiA8PCBQQUdFX1NISUZUKQo+Pgo+
PiBJZiB0aGlzIGNhbid0IGJlIHByb3Blcmx5IGRlcml2ZWQsIHRoZW4gYSBCVUlMRF9CVUdfT04o
KSBpcyBuZWVkZWQuCj4+IEJ1dCBkaWRuJ3Qgd2UgZGlzY3VzcyBvbiBpcmMgYWxyZWFkeSBwb3Nz
aWJsZSBhcHByb2FjaGVzIG9mIGhvdyB0bwo+PiBkZXJpdmUgaXQgZnJvbSB0aGUgZW51bT8gRGlk
IG5vbmUgb2YgdGhpcyB3b3JrPwo+IAo+IFRoZSBvbmx5IG9wdGlvbiBJIHJlbWVtYmVyIGRpc2N1
c3Npbmcgd2FzIHRvIGRlZmluZSBtYWNyb3MgaW5zdGVhZCBvZgo+IHVzaW5nIGVudW0uIEkgc2Fp
ZCBhdCB0aGUgdGltZSBhdCB3b3VsZCBtYWtlIHVzIGxvc2UgdGhlIGFiaWxpdHkgdG8KPiBkeW5h
bWljYWxseSBzaXplIHRoaXMgYXJlYS4KPiAKPiBJZiB0aGVyZSBhcmUgb3RoZXIgd2F5cyB0aGF0
IEkgbWlzc2VkLCBsZXQgbWUga25vdy4KCkkgc2VlbSB0byByZWNhbGwgcmVjb21tZW5kaW5nIHRv
IGV4cG9ydCBhYnNvbHV0ZSBzeW1ib2xzIGZyb20KYXNzZW1ibHkgY29kZS4gVGhlIHF1ZXN0aW9u
IGlzIGhvdyBlYXNpbHkgdXNhYmxlIHRoZXkgd291bGQKYmUgZnJvbSBDLCBvciBob3cgY2x1bXN5
IHRoZSByZXN1bHRpbmcgY29kZSB3b3VsZCBsb29rLgoKPj4+IEBAIC04OSw2ICs5MiwzMSBAQCBz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgdmlydF90b19maXgoY29uc3QgdW5zaWduZWQgbG9u
ZyB2YWRkcikKPj4+ICAgICAgcmV0dXJuIF9fdmlydF90b19maXgodmFkZHIpOwo+Pj4gIH0KPj4+
ICAKPj4+ICtlbnVtIGZpeGVkX2FkZHJlc3Nlc194IHsKPj4+ICsgICAgLyogSW5kZXggMCBpcyBy
ZXNlcnZlZCBzaW5jZSBmaXhfeF90b192aXJ0KDApID09IEZJWEFERFJfWF9UT1AuICovCj4+PiAr
ICAgIEZJWF9YX1JFU0VSVkVELAo+Pj4gKyNpZmRlZiBDT05GSUdfSFlQRVJWX0dVRVNUCj4+PiAr
ICAgIEZJWF9YX0hZUEVSVl9IQ0FMTCwKPj4+ICsjZW5kaWYKPj4+ICsgICAgX19lbmRfb2ZfZml4
ZWRfYWRkcmVzc2VzX3gKPj4+ICt9Owo+Pj4gKwo+Pj4gKyNkZWZpbmUgRklYQUREUl9YX1NJWkUg
IChfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXNfeCA8PCBQQUdFX1NISUZUKQo+Pj4gKyNkZWZpbmUg
RklYQUREUl9YX1NUQVJUIChGSVhBRERSX1hfVE9QIC0gRklYQUREUl9YX1NJWkUpCj4+PiArCj4+
PiArZXh0ZXJuIHZvaWQgX19zZXRfZml4bWFwX3goCj4+PiArICAgIGVudW0gZml4ZWRfYWRkcmVz
c2VzX3ggaWR4LCB1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4+PiAr
Cj4+PiArI2RlZmluZSBzZXRfZml4bWFwX3goaWR4LCBwaHlzKSBcCj4+PiArICAgIF9fc2V0X2Zp
eG1hcF94KGlkeCwgKHBoeXMpPj5QQUdFX1NISUZULCBQQUdFX0hZUEVSVklTT1JfUlggfCBNQVBf
U01BTExfUEFHRVMpCj4+Cj4+IENhbid0IF9fc2V0X2ZpeG1hcCgpIGJlIHVzZWQgaGVyZSwgbWFr
aW5nIGl0cyBpbXBsZW1lbnRhdGlvbiBkZXJpdmUKPj4gd2hpY2ggb25lIGlzIG1lYW4gZnJvbSB3
aGV0aGVyIF9QQUdFX05YIGlzIHNldCBpbiB0aGUgcGFzc2VkIGluIGZsYWdzPwo+IAo+IF9fc2V0
X2ZpeG1hcCBhbmQgX19zZXRfZml4bWFwX3ggdGFrZSBkaWZmZXJlbnQgZW51bSB0eXBlcyBmb3Ig
dGhlaXIKPiBmaXJzdCBhcmd1bWVudC4gSSB3b3VsZCBwcmVmZXIgdHlwZSBzYWZldHkgYW5kIGV4
cGxpY2l0bmVzcyBoZXJlLgoKV2VsbCwgb2theSB0aGVuLiBEdXBsaWNhdGlvbiBsaWtlIHRoaXMg
c2ltcGx5IG1ha2VzIG1lIGEgbGl0dGxlCm5lcnZvdXMsIGFuZCBldmVuIG1vcmUgc28gd2hlbiBp
dCBleHRlbmRzIG91ciBzZXQgb2YgbmFtZSBzcGFjZQp2aW9sYXRpb25zLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
