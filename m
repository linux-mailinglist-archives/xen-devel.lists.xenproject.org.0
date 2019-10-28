Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07CE6F01
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 10:24:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP1D2-0002mL-A5; Mon, 28 Oct 2019 09:21:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP1D0-0002mG-Ga
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 09:21:06 +0000
X-Inumbo-ID: 44055c67-f964-11e9-94f1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44055c67-f964-11e9-94f1-12813bfff9fa;
 Mon, 28 Oct 2019 09:21:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80A55B234;
 Mon, 28 Oct 2019 09:21:03 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1571918276.2606.0@crc.id.au>
 <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7333496f-48e7-c659-5314-54feffde0273@suse.com>
Date: Mon, 28 Oct 2019 10:21:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Juergen Gross <JGross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Paul Durrant <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxOTowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNC8xMC8yMDE5
IDEyOjU3LCBTdGV2ZW4gSGFpZ2ggd3JvdGU6Cj4+IEhpIGFsbCwKPj4KPj4gSSd2ZSBtYW5hZ2Vk
IHRvIGdldCB0aGUgZ2l0IG1hc3RlciB2ZXJzaW9uIG9mIFhlbiBvbiB0aGlzIGFmZmVjdGVkCj4+
IHN5c3RlbSBhbmQgdHJpZXMgdG8gYm9vdCBhIFdpbmRvd3MgU2VydmVyIDIwMTYgc3lzdGVtLiBJ
dCBjcmFzaGVzIGFzCj4+IHBlciBub3JtYWwuCj4+Cj4+IEkgbWFuYWdlZCB0byBnZXQgdGhlc2Ug
bG9ncywgYnV0IEknbSBub3QgcXVpdGUgc3VyZSB3aGF0IGVsc2UgdG8gZG8gdG8KPj4gZGVidWcg
dGhpcyBpc3N1ZSBmdXJ0aGVyLgo+IAo+IEFmdGVyIGEgY29sbGFib3JhdGl2ZSBkZWJ1Z2dpbmcg
c2Vzc2lvbiBvbiBJUkMsIHdlJ3ZlIGlkZW50aWZpZWQgdGhlCj4gcHJvYmxlbS7CoCBIZXJlIGlz
IGEgc3VtbWFyeS4KPiAKPiBodHRwczovL3d3dy5yZWRkaXQuY29tL3IvQW1kL2NvbW1lbnRzL2Nr
cjVmNC9hbWRfcnl6ZW5fMzAwMF9zZXJpZXNfbGludXhfc3VwcG9ydF9hbmQvCj4gaXMgY29uY2Vy
bmluZyBLVk0sIGJ1dCBpdCBpZGVudGlmaWVkIHRoYXQgdGhlIFRPUE9FWFQgZmVhdHVyZSB3YXMK
PiBpbXBvcnRhbnQgdG8gZ2V0dGluZyB3aW5kb3dzIHRvIGJvb3QuCj4gCj4gWGVuIGRvZXNuJ3Qg
Y3VycmVudGx5IG9mZmVyIFRPUE9FWFQgdG8gZ3Vlc3RzIGF0IGFsbC7CoCBGaXhpbmcgdGhpcyBp
cyBvbgo+IHRoZSBUT0RPIGxpc3QgYWxvbmcgd2l0aCB0aGUgcmVzdCBvZiB0aGUgdG9wb2xvZ3kg
cmVwcmVzZW50YXRpb24gc3dhbXAuCj4gCj4gT24gYSBodW5jaCwgSSBvZmZlcmVkIHVwIGEgWGVu
U2VydmVyIHBhdGNoIHdoaWNoIHdlIGFyZSBzdGlsbCB1c2luZywgaW4KPiBsaWV1IG9mIGZpeGlu
ZyB0b3BvbG9neSBwcm9wZXJseS7CoCBJdCBpcyBsb2dpY2FsbHkgYSByZXZlcnQgb2YKPiBjYTJl
ZWU5MmRmNDQgYXMgdGhhdCBjaGFuZ2Ugd2Fzbid0IG1pZ3JhdGlvbiBzYWZlLgoKV291bGQgeW91
IG1pbmQgaGVscGluZyBtZSB1bmRlcnN0YW5kIGhvdyB0aGlzIHJldmVydCBtYXRjaGVzIHVwIHdp
dGgKeW91IHNheWluZyBhYm92ZSB0aGF0IFRPUE9FWFQgaXMgbmVlZGVkIGZvciBXaW5kb3dzIHRv
IGJvb3QgaGVyZT8gSQpkb24ndCB0aGluayBJIGNhbiBjb25jbHVkZSBhbnl0aGluZyBpbiB0aGlz
IGRpcmVjdGlvbiBmcm9tIHRoZSBhcnRpY2xlCnlvdSd2ZSBwcm92aWRlZCB0aGUgbGluayBvZi4K
Cj4gV2l0aCB0aGlzIHBhdGNoIGluIHBsYWNlLCB3aW5kb3dzIHdvcmtzIGZpbmUuwqAgSG93ZXZl
ciwgSSBkb24ndCB0aGluawo+IHRoZSBwYXRjaCBpcyBhcHByb3ByaWF0ZSB0byB0YWtlIGludG8g
NC4xMy4KPiAKPiBGdXJ0aGVybW9yZSwgdGhlcmUgaXMgbm8gY2hhbmNlIG9mIGdldHRpbmcgdGhl
IHRvcG9sb2d5IHdvcmsgc29ydGVkIGluCj4gdGhlIHJlbWFpbmluZyA0LjEzIHRpbWVmcmFtZS4K
PiAKPiBJJ20gYXQgYSBsb3NzIGZvciBpZGVhcywgb3RoZXIgdGhhbiByZWxlYXNlIG5vdGUgaXQg
YXMgYnJva2VuIGFuZCBtYWtlCj4gZml4aW5nIGl0IGEgYmxvY2tlciBmb3IgNC4xNC4KCldvdWxk
IG1ha2luZyBjb25kaXRpb25hbCB0aGUgY3VycmVudGx5IHVuY29uZGl0aW9uYWwgc2V0dGluZyBv
ZiBIVCBpbgp0aGUgZ3Vlc3QgQ1BVSUQgdmlldyB0b2dldGhlciB3aXRoIHRoZSBkb3VibGluZyBv
ZiBjZXJ0YWluIG90aGVyIGZpZWxkcycKdmFsdWVzIHBlcmhhcHMgc2ltaWxhcmx5IGhlbHA/IFNl
ZWluZyBKw7xyZ2VuJ3MgcmVwbHkgSSByZWFsaXplIGhlJ3MKZWZmZWN0aXZlbHkgc3VnZ2VzdGlu
ZyB0aGUgc2FtZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
