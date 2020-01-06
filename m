Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5A1313D8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:39:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTW7-0004J9-Eu; Mon, 06 Jan 2020 14:38:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioTW6-0004J1-EZ
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:38:02 +0000
X-Inumbo-ID: 236e91ec-3092-11ea-ab12-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 236e91ec-3092-11ea-ab12-12813bfff9fa;
 Mon, 06 Jan 2020 14:38:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 567C8AD18;
 Mon,  6 Jan 2020 14:38:00 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200104010759.GA2507@mail-itl>
 <b40c6f0d-374e-b771-1463-74c40bf4a340@suse.com>
 <20200106140418.GH1314@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a044a991-0a28-6b64-8046-2338b40172d6@suse.com>
Date: Mon, 6 Jan 2020 15:38:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200106140418.GH1314@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNTowNCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDA2LCAyMDIwIGF0IDEyOjE4OjMxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBPbiAwNC4wMS4yMDIwIDAyOjA3LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
IHdyb3RlOgo+Pj4gSSBoYXZlIGEgbXVsdGktZnVuY3Rpb24gUENJIGRldmljZSwgYmVoaW5kIGEg
UENJIGJyaWRnZSwgdGhhdCBub3JtYWxseQo+Pj4gSSBhc3NpZ24gdG8gYSBzaW5nbGUgZG9tYWlu
LiBCdXQgbm93IGl0IGZhaWxzIHdpdGg6Cj4+Pgo+Pj4gKFhFTikgW1ZULURdZDE0OiAwMDAwOjA0
OjAwLjAgb3duZWQgYnkgZDAhPEc+PDA+YXNzaWduIDAwMDA6MDU6MDAuMCB0byBkb20xNCBmYWls
ZWQgKC0yMikKPj4KPj4gSXMgdGhpcyBvbiB0aGUgMXN0IGF0dGVtcHQsIG9yIGFmdGVyIHRoZSBk
ZXZpY2UgaGFkIGFscmVhZHkgYmVlbgo+PiBhc3NpZ25lZCB0byBzb21lIChzYW1lIG9yIG90aGVy
KSBndWVzdD8gQWZ0ZXIgcXVpdGUgYSBiaXQgb2YKPj4gc3RhcmluZyBhdCB0aGUgY29kZSBJIGNh
bid0IHNlZW0gdG8gYmUgYWJsZSB0byBzcG90IGEgZGlmZmVyZW5jZQo+PiBpbiBiZWhhdmlvciBm
b3IgdGhlIDFzdCBhdHRlbXB0LCBidXQgeW91IG5vdCBzYXlpbmcgZXhwbGljaXRseQo+PiB0aGF0
IGl0IHdvdWxkIG9ubHkgaGFwcGVuIG9uIHN1YnNlcXVlbnQgb25lcyBtYWtlcyBtZSBhc3N1bWUg
eW91Cj4+IHJ1biBpbnRvIHRoZSBpc3N1ZSByaWdodCBhd2F5Lgo+IAo+IFllcywgaXQgd2FzIHRo
ZSBmaXJzdCB0cnkuCj4gCj4+PiBUaGlzIGlzIFhlbiA0LjguNSArIFhTQSBwYXRjaGVzLiBJdCBz
dGFydGVkIGhhcHBlbmluZyBhZnRlciBzb21lIHVwZGF0ZQo+Pj4gZHVyaW5nIGxhc3QgZmV3IG1v
bnRocywgbm90IHJlYWxseSBzdXJlIHdoaWNoIG9uZS4KPj4KPj4gSGF2aW5nIGEgc21hbGxlciB3
aW5kb3cgd291bGQgb2YgY291cnNlIGhlbHAsIGFzIHdvdWxkIC4uLgo+IAo+IFRoZSB3b3JraW5n
IHZlcnNpb24gd2FzIGp1c3QgYmVmb3JlIFhTQXMgb2YgMjAxOS0xMC0zMSAgKHdoaWNoIGluY2x1
ZGUKPiBYU0EtMzAyKS4KPiBCdXQgYXQgdGhpcyBwb2ludCwgSSdtIG5vdCBzdXJlIGlmIG5vIG90
aGVyIGNvbmZpZ3VyYXRpb24gY2hhbmdlcyB3ZXJlCj4gbWFkZSAoc2VlIGJlbG93KS4KPiAKPj4+
IEkgZ3Vlc3MgaXQgaXMgYmVjYXVzZSBxdWFyYW50aW5lIGZlYXR1cmUsIHNvIGluaXRpYWwgb3du
ZXJzaGlwIG9mCj4+PiAwMDAwOjA1OjAwLjAgaXMgZGlmZmVyZW50IHRoYW4gdGhlIGJyaWRnZSBp
dCBpcyBjb25uZWN0ZWQgdG8uCj4+PiBJJ20gbm90IHN1cmUgaWYgcmVsZXZhbnQgZm9yIHRoaXMg
Y2FzZSwgYnV0IEkgYWxzbyBzZXQKPj4+IHBjaWRldi0+cmRtX3BvbGljeSA9IExJQlhMX1JETV9S
RVNFUlZFX1BPTElDWV9SRUxBWEVELgo+Pj4KPj4+IEJvb3Rpbmcgd2l0aCBpb21tdT1uby1xdWFy
YW50aW5lIGhlbHBzLiBOb3RlIEkgZG8gbm90IHVzZSBgeGwKPj4+IHBjaS1hc3NpZ25hYmxlLWFk
ZGAgY29tbWFuZCwgb25seSBiaW5kIHRoZSBkZXZpY2UgdG8gdGhlIHBjaWJhY2sgZHJpdmVyCj4+
PiBpbiBkb20wLgo+Pgo+PiAuLi4ga25vd2luZyB3aGV0aGVyIGJlaGF2aW9yIGRpZmZlcnMgd2hl
biB1c2luZyB0aGlzIHByZXBhcmF0b3J5Cj4+IHN0ZXAuCj4gCj4geGwgcGNpLWFzc2lnbmFibGUt
YWRkIGRvZXNuJ3QgbWFrZSBhIGRpZmZlcmVuY2Ugd2l0aCBYU0EtMzA2IGFwcGxpZWQuCj4gQnV0
IEkndmUgdHJpZWQgeGwgcGNpLWFzc2lnbmFibGUtcmVtb3ZlIHdpdGggaW50ZXJlc3RpbmcgcmVz
dWx0Ogo+IEl0IHN1Y2NlZWRlZCBmb3IgMDAwMDowNTowMC4wIGFuZCAwMDAwOjA1OjAwLjIsIGJ1
dCBmYWlsZWQgZm9yCj4gMDAwMDowNTowMC4xIHdpdGggdGhpcyBtZXNzYWdlOgo+IAo+IChYRU4p
IFtWVC1EXWQwOiAwMDAwOjA1OjAwLjEgb3duZWQgYnkgZDMyNzUzITxHPjwwPmRlYXNzaWduIDAw
MDA6MDU6MDAuMQo+IGZyb20gZG9tMzI3NTMgZmFpbGVkICgtMjIpCj4gCj4gQW55d2F5LCBJIHRo
aW5rIG15IHByZXZpb3VzIHRlc3Rpbmcgd2FzIGluYWNjdXJhdGU6Cj4gTG9va3MgbGlrZSB0aGUg
aXNzdWUgaXMgY2F1c2VkIGJ5IG1lIGZhaWxpbmcgdG8gc2V0IHJkbV9wb2xpY3ksIGNvbnRyYXJ5
Cj4gdG8gdGhlIGFib3ZlIG1lc3NhZ2UuIEkgZ2V0IHRoZSBhYm92ZSBlcnJvciBvbmx5IHdpdGhv
dXQKPiBMSUJYTF9SRE1fUkVTRVJWRV9QT0xJQ1lfUkVMQVhFRCBzZXQuIFdoZW4gSSBzZXQgaXQg
cHJvcGVybHksIGRvbWFpbgo+IHN0YXJ0cyBldmVuIHdpdGhvdXQgaW9tbXU9bm8tcXVhcmFudGlu
ZS4gSSBzdGlsbCBoYXZlIHNvbWUgaXNzdWVzIHdpdGgKPiB0aGUgZGV2aWNlIHdpdGhpbiB0aGUg
ZG9tYWluLCBidXQgbm90IHN1cmUgaWYgcmVsZXZhbnQgdG8gdGhpcyBvcgo+IHNvbWV0aGluZyBl
bHNlLgo+IAo+IERvZXMgaXQgbWFrZSBzZW5zZSBub3c/CgpXZWxsLCBoYXJkIHRvIHRlbGwgLSBJ
IHN0aWxsIGNhbid0IHNlZSB3aGF0IG1pZ2h0IGJlIHdyb25nLCBiZXlvbmQgLi4uCgo+IElzIHRo
ZSBwYXRjaCBmcm9tIHlvdXIgb3RoZXIgbWVzc2FnZSBzdGlsbCByZWxldmFudD8KCi4uLiB3aGF0
IHRoaXMgcGF0Y2ggZGVhbHMgd2l0aC4gVGhlIGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uIGlzICJ5
ZXMiLAphbHNvIGluIGxpZ2h0IG9mIHlvdXIgc3Vic2VxdWVudCByZXBsaWVzLCBhbGJlaXQgSSBz
dGlsbCB3b3VsZG4ndCBiZQphYmxlIHRvIHRlbGwgd2h5IHRoaW5ncyBkaWQgd29yayBmb3IgeW91
IGJlZm9yZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
