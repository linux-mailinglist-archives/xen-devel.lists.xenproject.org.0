Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DEC1E8F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:00:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEsQN-0002uV-Dr; Mon, 30 Sep 2019 09:56:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEsQM-0002uQ-Gu
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:56:58 +0000
X-Inumbo-ID: a33c55c0-e368-11e9-96cb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a33c55c0-e368-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 09:56:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43F04AEAE;
 Mon, 30 Sep 2019 09:56:56 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
Date: Mon, 30 Sep 2019 11:57:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDkuMjAxOSAwNTowNywgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBUaHUsIFNl
cCAyNiwgMjAxOSBhdCAxMjo0NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAyNi4wOS4yMDE5IDAwOjMxLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+
Pj4gSmFuLCBSb2dlciwgdGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSBpbml0aWFsIGlkZWFzLiBJ
IHRyaWVkIGEgZmV3IG9mCj4+PiB0aG9zZSBhbmQgaGVyZSdzIHdoZXJlIEkgYW0uCj4+Pgo+Pj4g
Rmlyc3Qgb2YgYWxsLCBpdCBpcyBkZWZpbml0ZWx5IHJlbGF0ZWQgdG8gQ1BVIGJyaW5nIHVwLiBB
ZGRpbmcKPj4+IGNwdWlkbGU9MCB0byB4ZW4gY29tbWFuZCBsaW5lIG1hZGUgWGVuIGJvb3QuCj4+
Pgo+Pj4gVGhlbiwgYSBnb29kIGZyaWVuZCBvZiBtaW5lICh3aG8geW91IG1heSBrbm93IGZyb20g
YW5jaWVudCBYZW4gZGF5cwo+Pj4gOy0pKSBzdWdnZXN0ZWQgdGhhdCB0aGlzIGNvdWxkIGJlIHJl
bGF0ZWQgdG8gdGhpczoKPj4+ICAgICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kv
WGVuX3Bvd2VyX21hbmFnZW1lbnQKPj4+IHNvIEkgd2VudCB0byB0aGUgQklPUyBzZXR0aW5ncyBh
bmQgcXVpdGUgdG8gbXkgc3VycHJpc2UgYWxsIG9mIHRoZW0KPj4+IHdlcmUgZ3JheWVkIG91dCAo
bm90IHR3ZWFrYWJsZSkuCj4+Pgo+Pj4gVGhlIG9ubHkgb25lIHRoYXQgd2Fzbid0IHdhcyAyeEFQ
SUMgc3VwcG9ydC4gU28ganVzdCBmb3Iga2lja3MgLS0gSQo+Pj4gZGlzYWJsZWQgdGhhdC4KPj4+
Cj4+PiBUaGF0LCBpbiB0dXJuLCBtYWRlIFhlbiBib290IGV2ZW4gd2l0aG91dCBjcHVpZGxlPTAu
IEknbSBhdHRhY2hpbmcgdGhhdCBsb2cuCj4+Cj4+IEludGVyZXN0aW5nLCBidXQgdW5mb3J0dW5h
dGVseSB0aGlzIHBhcnRpY3VsYXIgbG9nIGlzIG9mIG5vIHJlYWwgdXNlCj4+IGZvciBpbnZlc3Rp
Z2F0aW9uIG9mIHRoZSBpc3N1ZSAob3RoZXIgdGhhbiBrbm93aW5nIHRoZSBDUFUgbW9kZWwpLiBJ
Cj4+IGFsc28gbm90aWNlIGl0J3MgYSA0LjEyLjAgbG9nLCB3aGVuIHlvdXIgb3JpZ2luYWwgcmVw
b3J0IHdhcyBhZ2FpbnN0Cj4+IGxhdGVzdCBtYXN0ZXIuCj4+Cj4+PiBTbyBJIGd1ZXNzIGF0IHRo
aXMgcG9pbnQsIHlvdSBjb3VsZCBzYXkgdGhhdCBJIGhhdmUgYSBmdW5jdGlvbmFsCj4+PiBzeXN0
ZW0sIGJ1dCBJJ20gY3VyaW91cyB3aGV0aGVyIHlvdSBndXlzIHdvdWxkIGJlIGludGVyZXN0ZWQg
dG8gbG9vawo+Pj4gaW50byAyeEFQSUMgc2l0dWF0aW9uLgo+Pgo+PiBPZiBjb3Vyc2Ugd2UgZG8u
IEFzIGEgbmV4dCBzdGVwIEknZCBzdWdnZXN0IHJldmVydGluZyB0aGUgQklPUyBzZXR0aW5ncwo+
PiBjaGFuZ2UgeW91IGRpZCwgYW5kIGluc3RlYWQgdXNpbmcgdGhlICJ4MmFwaWM9MCIgWGVuIGNv
bW1hbmQgbGluZSBvcHRpb24uCj4gCj4gSW50ZXJlc3RpbmdseSBlbm91Z2gsIHRoaXMgZG9lc24n
dCByZWFsbHkgc29sdmUgdGhlIHByb2JsZW0gY29tcGxldGVseS4KPiBTcGVjaWZ5aW5nIHgyYXBp
Yz0wIGNlcnRhaW5seSBtYWtlcyBYZW4gZ28gbXVjaCBmdXJ0aGVyIHRvIGEgcG9pbnQKPiB3aGVy
ZSBpdCB0cmllcyB0byBsb2FkIERvbTAgYW5kIHRoZW4gdGhlIGNvbnNvbGUgVkdBIHNjcmVlbiBn
b2VzCj4gYmxhbmsgKHRoaXMgaXMgd2hlcmUgdGhhdCBzZXJpYWwgZGVidWcgb3V0cHV0IHdvdWxk
IGJlIHZlcnkgdXNlZnVsIDotKCkuCgpOb3cgdGhhdCdzIGFnYWluIHVuZXhwZWN0ZWQuIEluIGFu
eSBldmVudCB5b3UgY291bGQgdHJ5ICJ2Z2E9a2VlcCIuCgo+PiBBbmQgdGhlbiB3ZSBvZiBjb3Vy
c2UgbmVlZCBhIGNvbXBsZXRlIGJvb3QgbG9nIChhcyByZXF1ZXN0ZWQgZWFybGllcikgb2YKPj4g
YSBwcm9ibGVtIGNhc2UuCj4+Cj4+IEZ1cnRoZXIgSSdkIHN1Z2dlc3QgbW92aW5nIGF3YXkgZnJv
bSB0aGUgYmxhY2stYW5kLXdoaXRlICJjcHVpZGxlPSIKPj4gb3B0aW9uLCBhbmQgaW5zdGVhZCBs
aW1pdGluZyB1c2Ugb2YgZGVlcCBDIHN0YXRlcyAoIm1heF9jc3RhdGU9IikuIEkKPj4gd291bGRu
J3QgYmUgc3VycHJpc2VkIGlmIHRoaXMgd2FzIHRoZSBpc3N1ZTsgd2UnZCB0aGVuIGhhdmUgdG8g
Zmlyc3QKPj4gb2YgYWxsIGdvIHRocm91Z2ggZXJyYXRhIGZvciB0aGUgcGFydCB5b3VyIHN5c3Rl
bSBpcyB1c2luZy4KPiAKPiBZdXAuIG1heF9jc3RhdGU9MSBtYWtlcyBpdCBib290IGZpbmUuIG1h
eF9jc3RhdGU9MiB0aG91Z2ggaGFuZ3MKPiB0aGUgc3lzdGVtICpleGFjdGx5KiBpbiB0aGUgc2Ft
ZSB3YXkgYXMgc3BlY2lmeWluZyB4MmFwaWM9MAo+ICh3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSB0
aGUgb3JpZ2luYWwgcHJvYmxlbSBhcyBJJ3ZlIGRlc2NyaWJlZCBhYm92ZSkuCgoibWF4X2NzdGF0
ZT0yIiBpcyBtdWNoIGxlc3Mgb2YgYSAiZGVlcCIgQyBzdGF0ZSB0aGFuIEkgaGFkIGV4cGVjdGVk
LApidXQgd2VsbCwgc28gYmUgaXQgdGhlbi4gQXMgdG8gdGhlIGhhbmcgLSBkaWQgeW91IG1lYW53
aGlsZSBmaWd1cmUKd2hldGhlciBfYW55XyBudW1iZXIgb2YgQ1BVcyBhYm92ZSAxIHdvdWxkIHJl
c3VsdCBpbiBhIGhhbmcsIG9yCndoZXRoZXIgaW5zdGVhZCB0aGVyZSdzIGEgY2VydGFpbiBhbW91
bnQgb2YgdGhlbSB0aGF0IHdvdWxkIGFsbG93CmJvb3QgdG8gcHJvZ3Jlc3MgZmluZS4KCj4gQ2Fu
IHlvdSBwbGVhc2UgZWxhYm9yYXRlIG9uICJ3ZSdkIHRoZW4gaGF2ZSB0byBmaXJzdCBvZiBhbGwg
Z28gdGhyb3VnaAo+IGVycmF0YSBmb3IgdGhlIHBhcnQgeW91ciBzeXN0ZW0gaXMgdXNpbmciCgpX
ZWxsLCBpdCB3b3VsZG4ndCBiZSB0aGUgZmlyc3QgdGltZSB0aGF0IGhhcmR3YXJlIGhhZCBpc3N1
ZXMgd2l0aCBDCnN0YXRlIGhhbmRsaW5nLiBUaGVyZWZvcmUgd2UnZCBuZWVkIHRvIChhKSBiZSBz
dXJlIHlvdSB1c2UgdXAtdG8tZGF0ZQptaWNyb2NvZGUgYW5kIChiKSB0aGVyZSBhcmUgbm8gZXJy
YXRhIGRvY3VtZW50ZWQgZm9yIHlvdXIgQ1BVIG1vZGVsCndvcmthcm91bmRzIGZvciB3aGljaCBi
YXNpY2FsbHkgc3VnZ2VzdCB0byBhdm9pZCB1c2Ugb2YgZGVlcCBDIHN0YXRlcy4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
