Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C514CB08
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:01:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmwk-0003pU-Rb; Wed, 29 Jan 2020 12:59:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GwGO=3S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwmwi-0003pA-Sa
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:59:52 +0000
X-Inumbo-ID: 3cec1a9c-4297-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cec1a9c-4297-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 12:59:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 74B06AEFF;
 Wed, 29 Jan 2020 12:59:51 +0000 (UTC)
To: xen-devel@lists.xenproject.org, pdurrant@amazon.com
References: <20200129123618.1202-1-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cb107859-944e-cdf8-e22f-e10aa2a8b613@suse.com>
Date: Wed, 29 Jan 2020 13:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200129123618.1202-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
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
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, luwei.kang@intel.com,
 marmarek@invisiblethingslab.com, dwmw@amazon.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAgMTM6MzYsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlzIGVtYWlsIG9ubHkg
dHJhY2tzIGJpZyBpdGVtcyBmb3IgeGVuLmdpdCB0cmVlLiBQbGVhc2UgcmVwbHkgZm9yIGl0ZW1z
Cj4geW91IHdvdWxkIGxpa2UgdG8gc2VlIGluIDQuMTQgc28gdGhhdCBwZW9wbGUgaGF2ZSBhbiBp
ZGVhIHdoYXQKPiBpcyBnb2luZyBvbiBhbmQgcHJpb3JpdGlzZSBhY2NvcmRpbmdseS4KPiAKPiBZ
b3UncmUgd2VsY29tZSB0byBwcm92aWRlIGRlc2NyaXB0aW9uIGFuZCB1c2UgY2FzZXMgb2YgdGhl
IGZlYXR1cmUgeW91J3JlCj4gd29ya2luZyBvbi4KPiAKPiA9IFRpbWVsaW5lID0KPiAKPiBXZSBu
b3cgYWRvcHQgYSBmaXhlZCBjdXQtb2ZmIGRhdGUgc2NoZW1lLiBXZSB3aWxsIHJlbGVhc2UgYWJv
dXQgZXZlcnkgOAo+ICAgbW9udGhzLgo+IFRoZSBjcml0aWNhbCBkYXRlcyBmb3IgWGVuIDQuMTQg
YXJlIGFzIGZvbGxvd3M6Cj4gCj4gLS0tPiBXZSBhcmUgaGVyZQo+ICogTGFzdCBwb3N0aW5nIGRh
dGU6IE1heSAxc3QsIDIwMjAKPiAqIEhhcmQgY29kZSBmcmVlemU6IE1heSAyMm5kLCAyMDIwCj4g
KiBSZWxlYXNlOiBKdW5lIDI2dGgsIDIwMjAKPiAKPiBOb3RlIHRoYXQgd2UgZG9uJ3QgaGF2ZSBh
IGZyZWV6ZSBleGNlcHRpb24gc2NoZW1lIGFueW1vcmUuIEFsbCBwYXRjaGVzCj4gdGhhdCB3aXNo
IHRvIGdvIGludG8gNC4xNCBtdXN0IGJlIHBvc3RlZCBpbml0aWFsbHkgbm8gbGF0ZXIgdGhhbiB0
aGUKPiBsYXN0IHBvc3RpbmcgZGF0ZSBhbmQgZmluYWxseSBubyBsYXRlciB0aGFuIHRoZSBoYXJk
IGNvZGUgZnJlZXplLgo+IEFsbCBwYXRjaGVzIHBvc3RlZCBhZnRlciB0aGF0IGRhdGUgd2lsbCBi
ZSBhdXRvbWF0aWNhbGx5IHF1ZXVlZCBpbnRvIG5leHQKPiByZWxlYXNlLgo+IAo+IFJDcyB3aWxs
IGJlIGFycmFuZ2VkIGltbWVkaWF0ZWx5IGFmdGVyIGZyZWV6ZS4KPiAKPiBUaGVyZSBpcyBhbHNv
IGEgamlyYSBpbnN0YW5jZSB0byB0cmFjayBhbGwgdGhlIHRhc2tzIChub3Qgb25seSBiaWcpCj4g
Zm9yIHRoZSBwcm9qZWN0LiBTZWU6IGh0dHBzOi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3By
b2plY3RzL1hFTi9pc3N1ZXMuCj4gCj4gU29tZSBvZiB0aGUgdGFza3MgdHJhY2tlZCBieSB0aGlz
IGUtbWFpbCBhbHNvIGhhdmUgYSBjb3JyZXNwb25kaW5nIGppcmEgdGFzawo+IHJlZmVycmVkIGJ5
IFhFTi1OLgo+IAo+IFRoZXJlIGlzIGEgdmVyc2lvbiBudW1iZXIgZm9yIHBhdGNoIHNlcmllcyBh
c3NvY2lhdGVkIHRvIGVhY2ggZmVhdHVyZS4KPiBDYW4gZWFjaCBvd25lciBzZW5kIGFuIHVwZGF0
ZSBnaXZpbmcgdGhlIGxhdGVzdCB2ZXJzaW9uIG51bWJlciBpZiB0aGUKPiBzZXJpZXMgaGFzIGJl
ZW4gcmUtcG9zdGVkPyBBbHNvLCBjYW4gdGhlIG93bmVycyBvZiBhbnkgY29tcGxldGVkIGl0ZW1z
Cj4gcGxlYXNlIHJlc3BvbmQgc28gdGhhdCB0aGUgaXRlbSBjYW4gYmUgbW92ZWQgaW50byB0aGUg
J0NvbXBsZXRlZCcgc2VjdGlvbi4KPiAKPiA9IFByb2plY3RzID0KPiAKPiA9PSBIeXBlcnZpc29y
ID09Cj4gCj4gKiAgTGl2ZS1VcGRhdGluZyBYZW4KPiAgICAtICBEYXZpZCBXb29kaG91c2UKPiAK
PiAqICBOb24tQ29vcGVyYXRpdmUgTGl2ZSBNaWdyYXRpb24KPiAgICAtICBQYXVsIER1cnJhbnQK
Ckh5cGVydmlzb3IgZmlsZSBzeXN0ZW0gKHYzKQotIEp1ZXJnZW4gR3Jvc3MKCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
