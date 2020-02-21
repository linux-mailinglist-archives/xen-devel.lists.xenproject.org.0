Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC51682BE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:05:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Alg-0005VP-8t; Fri, 21 Feb 2020 16:03:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5Alf-0005VK-I0
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:03:07 +0000
X-Inumbo-ID: a4a62ce0-54c3-11ea-86a3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4a62ce0-54c3-11ea-86a3-12813bfff9fa;
 Fri, 21 Feb 2020 16:03:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 61541AF39;
 Fri, 21 Feb 2020 16:03:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200221151948.6209-1-andrew.cooper3@citrix.com>
 <6b37fba9-bea3-0368-890d-f4ce042336a6@suse.com>
 <cdda8070-8339-d541-e55e-d3bca1dd98c6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad701eb9-abed-65f0-e7db-8582aeb928e5@suse.com>
Date: Fri, 21 Feb 2020 17:03:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cdda8070-8339-d541-e55e-d3bca1dd98c6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/msr: Start cleaning up msr-index.h
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNjo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMS8wMi8yMDIw
IDE1OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjEuMDIuMjAyMCAxNjoxOSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgK
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgKPj4+IEBAIC0xLDcgKzEs
NzQgQEAKPj4+ICAjaWZuZGVmIF9fQVNNX01TUl9JTkRFWF9ICj4+PiAgI2RlZmluZSBfX0FTTV9N
U1JfSU5ERVhfSAo+Pj4gIAo+Pj4gLS8qIENQVSBtb2RlbCBzcGVjaWZpYyByZWdpc3RlciAoTVNS
KSBudW1iZXJzICovCj4+PiArLyoKPj4+ICsgKiBDUFUgbW9kZWwgc3BlY2lmaWMgcmVnaXN0ZXIg
KE1TUikgbnVtYmVycwo+Pj4gKyAqCj4+PiArICogRGVmaW5pdGlvbnMgZm9yIGFuIE1TUiBzaG91
bGQgZm9sbG93IHRoaXMgc3R5bGU6Cj4+PiArICoKPj4+ICsgKiAjZGVmaW5lIE1TUl8kTkFNRSAg
ICAgICAgICAgICAgICAgICAgICAgIDB4JElOREVYCj4+PiArICogI2RlZmluZSAgJE5BTUVfJEJJ
VDEgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgJFBPUzEpCj4+PiArICogI2Rl
ZmluZSAgJE5BTUVfJEJJVDIgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMTCkgPDwgJFBP
UzIpCj4+PiArICoKPj4+ICsgKiBCbG9ja3Mgb2YgcmVsYXRlZCBjb25zdGFudHMgc2hvdWxkIGJl
IHNvcnRlZCBieSBNU1IgaW5kZXguICBUaGUgY29uc3RhbnQKPj4+ICsgKiBuYW1lcyBzaG91bGQg
YmUgYXMgY29uY2lzZSBhcyBwb3NzaWJsZSwgYW5kIHRoZSBiaXQgbmFtZXMgbWF5IGhhdmUgYW4K
Pj4+ICsgKiBhYmJyZXZpYXRlZCBuYW1lLgo+Pj4gKyAqLwo+PiBIbW0sIHdoaWxlICJCbG9ja3Mg
b2YgcmVsYXRlZCBjb25zdGFudHMiIGNhdGVycyBmb3IgZS5nLiBBTUQncwo+PiBNU1JfQU1ENjRf
RFI8bj5fQUREUkVTU19NQVNLLCBJIHRoaW5rIGZvciBlYXNlIG9mIGxvb2t1cCB3ZQo+PiBtYXkg
d2FudCB0byBiZSBzbGlnaHRseSBtb3JlIHN0cmljdCwgd2l0aG91dCByZXF1aXJpbmcgc3Ryb25n
Cj4+IG9yZGVyaW5nLiBFLmcuIGJ5IGFsc28gc3RhdGluZyB0aGF0IG11bHRpcGxlIHN1Y2ggYmxv
Y2tzIHNob3VsZAo+PiBiZSBvcmRlcmVkIHJlbGF0aXZlIHRvIG9uZSBhbm90aGVyIGFsc28gbnVt
ZXJpY2FsbHkgKG11Y2ggbGlrZQo+PiB3ZSB0cnkgdG8gZG8gaW4gdGhlIGluc24gZW11bGF0b3In
cyBodWdlIHN3aXRjaCgpIHN0YXRlbWVudCksCj4+IGJhc2VkIG9uIHRoZWlyIGxvd2VzdCBudW1i
ZXJlZCBNU1IuCj4gCj4gIkV4Y2VwdGlvbnMgd2lsbCBiZSBjb25zaWRlcmVkIG9uIGEgY2FzZS1i
eS1jYXNlIGJhc2lzIiA/CgpTb3VuZHMgZ29vZC4KCj4gSXQgaXMgbm90IGFzIGlmIHdlJ2xsIGV2
ZXIgYmUgYWJsZSB0byB3cml0ZSBkb3duIHJ1bGVzIHdoaWNoIHdpbGwgYXBwbHkKPiB1bmlmb3Jt
bHkgdG8gdGhlIHdob2xlIGZpbGUuCj4gCj4+IChBcyBhIG5pdCwgdGhlIGV4YW1wbGUga2luZCBv
ZiBpbXBsaWVzIHRoYXQgb25seSBzaW5nbGUgYml0Cj4+IGZpZWxkcyB3b3VsZCBldmVyIG9jY3Vy
LiBJdCBtaWdodCBhdm9pZCBxdWVzdGlvbnMgaWYgeW91IGdhdmUKPj4gYSBtdWx0aS1iaXQgZXhh
bXBsZS4pCj4gCj4gU2luZ2xlIGJpdCBmaWVsZHMgYXJlIHRoZSBvdmVyd2hlbG1pbmdseSBjb21t
b24gZXhhbXBsZS7CoCBXb3VsZAo+IHMvQklUL0ZJRUxELyByZWFkIGFueSBiZXR0ZXIsIHBlcmhh
cHMgd2l0aCAkWCBhbmQgJFkgaW5zdGVhZCBvZiAxJ3MgaW4KPiB0aGUgX0FDKCkgPwoKWWVzLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
