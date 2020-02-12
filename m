Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACD15B462
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 00:04:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j210I-0006O6-DY; Wed, 12 Feb 2020 23:01:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mx/G=4A=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j210G-0006O1-S4
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 23:01:08 +0000
X-Inumbo-ID: 8d5ea62a-4deb-11ea-b807-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d5ea62a-4deb-11ea-b807-12813bfff9fa;
 Wed, 12 Feb 2020 23:01:07 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j210E-0002Ep-K1; Wed, 12 Feb 2020 23:01:06 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j210E-0001Fl-AZ; Wed, 12 Feb 2020 23:01:06 +0000
Date: Wed, 12 Feb 2020 23:01:03 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200212230103.sh5srggijwa2j7wu@debian>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-4-liuwe@microsoft.com>
 <20200212170924.GT4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212170924.GT4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 3/4] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDY6MDk6MjRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEZlYiAxMiwgMjAyMCBhdCAwNDowOToxN1BNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gSW1wbGVtZW50IGEgYmFzaWMgaG9vayBmb3IgTDAgYXNzaXN0ZWQgVExC
IGZsdXNoLiBUaGUgaG9vayBuZWVkcyB0bwo+ID4gY2hlY2sgaWYgcHJlcmVxdWlzaXRlcyBhcmUg
bWV0LiBJZiB0aGV5IGFyZSBub3QgbWV0LCBpdCByZXR1cm5zIGFuIGVycm9yCj4gPiBudW1iZXIg
dG8gZmFsbCBiYWNrIHRvIG5hdGl2ZSBmbHVzaGVzLgo+ID4gCj4gPiBJbnRyb2R1Y2UgYSBuZXcg
dmFyaWFibGUgdG8gaW5kaWNhdGUgaWYgaHlwZXJjYWxsIHBhZ2UgaXMgcmVhZHkuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAtLS0KPiA+
ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlICB8ICAxICsKPiA+ICB4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICB8IDE3ICsrKysrKysrKysrKwo+ID4gIHhlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwgIDQgKysrCj4gPiAgeGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gaW5kZXggNjgxNzAxMDlhOS4uMTg5MDJjMzNlOSAxMDA2
NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+IEBAIC0xICsxLDIgQEAKPiA+
ICBvYmoteSArPSBoeXBlcnYubwo+ID4gK29iai15ICs9IHRsYi5vCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJ2LmMKPiA+IGluZGV4IGI3MDQ0ZjcxOTMuLjFjZGM4OGUyN2MgMTAwNjQ0Cj4g
PiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiArKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiBAQCAtMzMsNiArMzMsOCBAQCBERUZJ
TkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X2lucHV0X3BhZ2UpOwo+ID4gIERFRklO
RV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKPiA+ICBERUZJTkVf
UEVSX0NQVV9SRUFEX01PU1RMWSh1aW50MzJfdCwgaHZfdnBfaW5kZXgpOwo+ID4gIAo+ID4gK3N0
YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgaHZfaGNhbGxfcGFnZV9yZWFkeTsKPiA+ICsKPiA+ICBz
dGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPiA+ICB7Cj4gPiAgICAgIHVu
aW9uIGh2X2d1ZXN0X29zX2lkIGlkID0ge307Cj4gPiBAQCAtMTE5LDYgKzEyMSw4IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQo+ID4gICAgICBCVUdfT04o
IWh5cGVyY2FsbF9tc3IuZW5hYmxlKTsKPiA+ICAKPiA+ICAgICAgc2V0X2ZpeG1hcF94KEZJWF9Y
X0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBBR0VfU0hJRlQpOwo+ID4gKwo+ID4gKyAgICBodl9oY2Fs
bF9wYWdlX3JlYWR5ID0gdHJ1ZTsKPiAKPiBJIGd1ZXNzIGZpbGxpbmcgdGhlIGh5cGVyY2FsbCBw
YWdlIGluIHRoZSBwcm9iZSBmdW5jdGlvbiBsaWtlIGl0J3MKPiBkb25lIGZvciBYZW4gaXMgdG9v
IGVhcmx5IGZvciBIeXBlclYsIGFuZCBoZW5jZSB5b3UgbmVlZCB0aGlzCj4gc2FmZWd1YXJkPwoK
WWVzIHRoYXQncyB0b28gZWFybHkuCgpLZWVwIGluIG1pbmQgdGhhdCBIeXBlci1WJ3MgaHlwZXJj
YWxsIHBhZ2UgaXMgYW4gb3ZlcmxheSBwYWdlIHdoaWNoIGlzCm5vdCBiYWNrZWQgYnkgcmVhbCBt
ZW1vcnkgZnJvbSBYZW4ncyBQb1YuIFhlbiBjYW4ndCBmaWxsIGluIGEgc3R1Ygp0aGVyZS4gWGVu
IG5lZWRzIHRvIHdhaXQgdW50aWwgb3RoZXIgaW5mcmFzdHJ1Y3R1cmVzIHRvIGdvIGxpdmUgYmVm
b3JlCnNldHRpbmcgdXAgYSBoeXBlcmNhbGwgcGFnZSwgd2hpbGUgaW4gdGhlIG1lYW4gdGltZSwg
aXQgd2lsbCAvIG1heSBuZWVkCnRvIGZsdXNoIFRMQi4KCj4gCj4gVEJILCBtYXliZSBpdCB3b3Vs
ZCBiZSBiZXN0IChhbmQgc2FmZXIpIHRvIHByZXZlbnQgdXNpbmcgYW55IGhvb2tzCj4gdW50aWwg
c2V0dXAgaGFzIGJlZW4gY2FsbGVkLCBhbmQgaGVuY2UgdGhpcyBjaGVjayBjb3VsZCBiZSBwdWxs
ZWQgaW50bwo+IHRoZSBnZW5lcmljIGhvb2s/CgoiUHJldmVudCIgaXMgdG9vIHZhZ3VlIGEgdGVy
bSBoZXJlLiBXZSBjYW4ndCBzdG9wIGNvZGUgZnJvbSBleGVjdXRpbmcgaW4KcGFyYWxsZWwuIElu
IHNvbWUgc2l0dWF0aW9uIHRoZXJlIGlzIG5vIHdheSB0byBmYWlsIGdyYWNlZnVsbHkuCgpUaGVy
ZSBpcyBvbmx5IHRoaXMgaG9vayBhdCB0aGUgbW9tZW50IHRoYXQgcmVxdWlyZXMgc3VjaCBzcGVj
aWFsIGNhcmUKYWZhaWN0LCBhbmQgdGhpcyBpcyBsYXJnZWx5IGR1ZSB0byBIeXBlci1WJ3MgaWRp
b3N5bmNyYXN5LiBPdGhlcnMgYXJlCmNhbGxlZCBvbmx5IGluIHNldHVwIC8gdGVhcmRvd24gcGF0
aCB3aGljaCBjYW4gZWFzaWx5IGJlIHJlYXNvbmVkIGFib3V0LgoKV2VpLgoKPiAKPiBUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
