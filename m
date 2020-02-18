Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC1162684
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 13:55:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j42MR-0001HY-Hu; Tue, 18 Feb 2020 12:52:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cz2h=4G=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j42MP-0001HT-W3
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 12:52:22 +0000
X-Inumbo-ID: 80c3e234-524d-11ea-bc8e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c3e234-524d-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 12:52:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j42MO-0003yg-Ou; Tue, 18 Feb 2020 12:52:20 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j42MO-0004VX-FQ; Tue, 18 Feb 2020 12:52:20 +0000
Date: Tue, 18 Feb 2020 12:52:17 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200218125217.vlxtzcpxt2okhptc@debian>
References: <20200217135517.5826-1-liuwe@microsoft.com>
 <20200217135517.5826-4-liuwe@microsoft.com>
 <20200217173412.GM4679@Air-de-Roger>
 <20200218104029.mhrc546yszqvu3io@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218104029.mhrc546yszqvu3io@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86/hyperv: L0 assisted TLB flush
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

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTA6NDA6MjlBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA+IAo+ID4gPiArICAgIHVpbnQ2NF90IHJldDsKPiA+ID4gKwo+ID4gPiArICAgIGlmICggIWZs
dXNoIHx8IGNwdW1hc2tfZW1wdHkobWFzaykgKQo+ID4gPiArICAgIHsKPiA+ID4gKyAgICAgICAg
QVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4g
PiArICAgIH0KPiA+ID4gKwo+ID4gPiArICAgIGxvY2FsX2lycV9zYXZlKGlycV9mbGFncyk7Cj4g
PiAKPiA+IEkgdGhpbmsgeW91IGRpc2FibGUgaW50ZXJydXB0cyBpbiBvcmRlciB0byBwcmV2ZW50
IHJlLWVudGVyaW5nIHRoaXMKPiA+IGZ1bmN0aW9uLCBhbmQgaGVuY2UgYXZvaWQgYW4gaW50ZXJy
dXB0IGZyb20gdHJpZ2dlcmluZyBpbiB0aGUgbWlkZGxlCj4gPiBhbmQgYWxzbyBhdHRlbXB0aW5n
IHRvIGRvIGEgVExCIGZsdXNoIHVzaW5nIHRoZSBzYW1lIHBlci1DUFUgaW5wdXQKPiA+IHBhZ2Uu
Cj4gPiAKPiA+IEFzIHBvaW50ZWQgb3V0IHRvIG1lIGJ5IEphbiwgd2UgY2FuIGFsc28gZ2V0ICNN
QyBhbmQgI05NSSB3aGljaCB3aWxsCj4gPiBzdGlsbCBoYXBwZW4gZGVzcGl0ZSBpbnRlcnJ1cHRz
IGJlaW5nIGRpc2FibGVkLCBhbmQgaGVuY2UgeW91IG1pZ2h0Cj4gPiB3YW50IHRvIGFzc2VydCB0
aGF0IHlvdSBhcmUgbm90IGluICNNQyBvciAjTk1JIGNvbnRleHQgYmVmb3JlCj4gPiBhY2Nlc3Np
bmcgdGhlIHBlci1DUFUgaHZfaW5wdXRfcGFnZSAob3IgZWxzZSBqdXN0IHJldHVybiBhbiBlcnJv
cgo+ID4gYW5kIGF2b2lkIHVzaW5nIHRoZSBhc3Npc3RlZCBmbHVzaCkuIEkgaGF2ZSBhIHBhdGNo
IHRoYXQgd2lsbAo+ID4gaG9wZWZ1bGx5IGJlIGFibGUgdG8gc2lnbmFsIHdoZW4gaW4gI01DIG9y
ICNOTUkgY29udGV4dC4KPiA+IAo+IAo+IFRoaXMgZnVuY3Rpb24gc2hvdWxkIHJldHVybiBhbiBl
cnJvciBpbiB0aGF0IGNhc2UuIEl0IGlzIGJldHRlciB0byBmYWxsCj4gYmFjayB0byBuYXRpdmUg
cGF0aCB0aGFuIGNyYXNoaW5nLgo+IAoKSSBicmllZmx5IHJlYWQgdGhyb3VnaCB0aGUgb3RoZXIg
dGhyZWFkIGFib3V0IHdoYXQgaXMgYWxsb3dlZCBpbiAjTk1JIG9yCiNNQyBjb250ZXh0LiBUaGUg
ZGlzY3Vzc2lvbiBjZW50cmVkIGFyb3VuZCBpZiBzb21lIG9wZXJhdGlvbiBzaG91bGQgYmUKYWxs
b3dlZCB0byBoYXBwZW4gaW4gdGhvc2UgY29udGV4dHMgaW4gdGhlIGZpcnN0IHBsYWNlLgoKRm9y
IG5vdyBJIHdpbGwganVzdCBhZGQgYSBjb21tZW50IGluIHRoZSBIeXBlci1WIGNvZGUuIE9uY2Ug
dGhhdApkaXNjdXNzaW9uIGlzIHJlc29sdmVkLCBIeXBlci1WIGNvZGUgY2FuIGZvbGxvdyBzdWl0
ZSB3aGVyZSBhcHBsaWNhYmxlLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
