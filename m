Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBFD0E4D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:06:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIAgX-0002rK-16; Wed, 09 Oct 2019 12:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIAgV-0002rF-75
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 12:03:15 +0000
X-Inumbo-ID: c4af1d02-ea8c-11e9-97ee-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4af1d02-ea8c-11e9-97ee-12813bfff9fa;
 Wed, 09 Oct 2019 12:03:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23A18B117;
 Wed,  9 Oct 2019 12:03:12 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
 <67e9bc2c-82dc-5fd7-9b8c-29d564a30ddb@suse.com>
 <20191009101116.GA1389@Air-de-Roger.citrite.net>
 <dd2b5da6-e1fc-a490-9276-8ad44721fa9e@suse.com>
 <20191009112927.GC1389@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a7fb887-84cf-cc1d-011d-f2adab4083fa@suse.com>
Date: Wed, 9 Oct 2019 14:03:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009112927.GC1389@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] HPET interrupt remapping during boot
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxMzoyOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgMDksIDIwMTkgYXQgMTI6NDE6MDVQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA5LjEwLjIwMTkgMTI6MTEsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gQW5kIGl0IGRv
ZXMgcHJpbnQgdGhlIGZvbGxvd2luZyB3aGVuIHNldHRpbmcgdXAgdGhlIGlvbW11Ogo+Pj4KPj4+
IChYRU4pIGlvYXBpYyAwIHBpbiAwIG5vdCBtYXNrZWQKPj4+IChYRU4pIHZlYz0wMCBkZWxpdmVy
eT1FeElOVCBkZXN0PVAgc3RhdHVzPTAgcG9sYXJpdHk9MCBpcnI9MCB0cmlnPUUgbWFzaz0wIGRl
c3RfaWQ6MDAwMTAwMDAKPj4+Cj4+PiBJIHdvbmRlciwgc2hvdWxkbid0IGFsbCBwaW5zIG9mIGFs
bCB0aGUgaW8tYXBpY3MgYmUgbWFza2VkIGF0IGJvb3Q/Cj4+Cj4+IEkgdGhpbmsgeW91IG1pZ2h0
IGdldCBkaWZmZXJlbnQgYW5zd2VycyBoZXJlIGRlcGVuZGluZyBvbiB3aGV0aGVyCj4+IHlvdSBh
c2sgZmlybXdhcmUgb3IgT1MgcGVvcGxlLiBJbiBmYWN0IHRoZXJlIGFyZSBjYXNlcyB3aGVyZSB0
aGUKPj4gSU8tQVBJQyBuZWVkcyB0byBiZSBsZWZ0IGluIHRoaXMgc3RhdGUsIEkgdGhpbmssIGJ1
dCBzdWNoIHdvdWxkCj4+IGxpa2VseSBuZWVkIHByb3Blcmx5IHJlZmxlY3RpbmcgaW4gQUNQSSB0
YWJsZXMgKGFsYmVpdCBJIGRvbid0Cj4+IGtub3cvcmVjYWxsIGhvdyB0aGlzIHdvdWxkIGJlIGRv
bmU7IGxvb2tpbmcgYXQgdGhlIGNvZGUgKS4gVGhpcyBnb2VzIGJhY2sgdG8gdGltZXMKPj4gd2hl
biBJTy1BUElDcyB3ZXJlIG5ldyBhbmQgT1NlcyB3b3VsZCBub3QgZXZlbiBrbm93IGFib3V0IHRo
ZW0sCj4+IHlldCB0aGV5IHdvdWxkbid0IGdldCBhbnkgaW50ZXJydXB0cyB0byB3b3JrIGlmIGZp
ZGRsaW5nIHdpdGgKPj4gb25seSB0aGUgUElDIChzaXR0aW5nIGJlaGluZCBJTy1BUElDIHBpbiAw
KS4KPj4KPj4gU2VlIGVuYWJsZV9JT19BUElDKCksIHdoZXJlIHdlIGFjdHVhbGx5IHVzZSB0aGlz
IHByb3BlcnR5IHRvCj4+IGRldGVybWluZSB0aGUgcGluIGJlaGluZCB3aGljaCB0aGUgODI1OSBz
aXRzLgo+Pgo+PiBJJ3ZlIHNlZW4gcXVpdGUgbWFueSBzeXN0ZW1zIHdoZXJlIGluIHRoZSBCSU9T
IHNldHVwIHlvdSBoYXZlIGFuCj4+IG9wdGlvbiB0byBzZWxlY3Qgd2hldGhlciB5b3UgaGF2ZSBh
biAiQUNQSSBPUyIgKHdvcmRpbmcgb2YgY291cnNlCj4+IHZhcmllcykuIEkndmUgbmV2ZXIgY2hl
Y2tlZCB3aGV0aGVyIHRoaXMgbWF5IGUuZy4gcmVmbGVjdCBpdHNlbGYKPj4gaW4gdGhlIGhhbmRv
dmVyIHN0YXRlIG9mIHRoZSBHU0kgMCBSVEUuCj4+Cj4+IEluIHlvdXIgdGVzdGluZyBwYXRjaCwg
Y291bGQgeW91IGFsc28gbG9nIHRoZSBQSUMgbWFzayBieXRlcz8KPj4gVGhlcmUgb3VnaHQgdG8g
YmUgYXQgbGVhc3Qgb25lIHVubWFza2VkOyBvciB3YWl0IC0gdGhlcmUgYWN0dWFsbHkKPj4gaXMg
YSBzcHVyaW91cyBpbnRlcnJ1cHQgdGhlcmUgKHJpZ2h0IGJlZm9yZSBJT01NVSBpbml0aWFsaXph
dGlvbik6Cj4+Cj4+IChYRU4pIHNwdXJpb3VzIDgyNTlBIGludGVycnVwdDogSVJRNy4KPiAKPiBT
byBJJ3ZlIGFkZGVkIGEgbG9nIG9mIHRoZSBQSUMgbWFza3MganVzdCBiZWZvcmUgY2hlY2tpbmcg
dGhlIGlvYXBpYwo+IG1hc2tzOgo+IAo+IChYRU4pIDgyNTlBLTEgbWFzazogZmUgODI1OUEtMiBt
YXNrOiBmZgo+IAo+IEFGQUlDVCBJUlE3IHNlZW1zIHRvIGJlIHVubWFza2VkPyBTb3JyeSBteSBr
bm93bGVkZ2Ugb2YgUElDcyBpcyBxdWl0ZQo+IGxpbWl0ZWQgc2luY2UgSSd2ZSBuZXZlciBoYWQg
dG8gZGVhbCB3aXRoIHRoZW0uCgpUaGF0J3MgSVJRMCB0aGVuIHdoaWNoIGlzIHVubWFza2VkLiBB
cyBzYWlkIHRoZSBzcHVyaW91cyBvbmUKKElSUTcpIGNhbid0IGJlIG1hc2tlZCAoYXQgdGhlIFBJ
Qyk7IG9ubHkgdGhlICJub3JtYWwiIElSUTcgY2FuCmJlLgoKPiBUaGUgbGluZSBJJ3ZlIGFkZGVk
IGlzOgo+IAo+IHByaW50aygiODI1OUEtMSBtYXNrOiAleCA4MjU5QS0yIG1hc2s6ICV4XG4iLCBp
bmIoMHgyMSksIGluYigweEExKSk7Cj4gCj4gSSB3b25kZXIgd2h5IGRvZXMgWGVuIGV2ZW4gaGFz
IGFueSBjb2RlIHRvIGRlYWwgd2l0aCB0aGUgUElDcywKPiBzaG91bGRuJ3Qgd2UgcmVseSBvbiBp
by1hcGljcyBvbmx5IGZvciBsZWdhY3kgZGVsaXZlcnk/CgpUaGVyZSBhcmUgKHdlcmU/KSBzeXN0
ZW1zIHdoZXJlIHRoaW5ncyB3b3VsZG4ndCB3b3JrIHdpdGhvdXQuCgo+PiBIZW5jZSBJIHdvbmRl
ciBpZiB0aGVyZSdzIG5vdCBwb3NzaWJseSBhIDJuZCBvbmUgb25jZSB0aGUgSU9NTVUKPj4gaGFz
IGJlZW4gc2V0IHVwLgo+IAo+IFJpZ2h0LCB0aGVuIEkgZ3Vlc3Mgd2UgZWl0aGVyIG1hc2sgYWxs
IHRoZSBpby1hcGljIHBpbnMgb3Igd2Ugc2V0dXAKPiBwcm9wZXIgcmVtYXBwaW5nIGVudHJpZXMg
Zm9yIG5vbi1tYXNrZWQgcGlucz8gKGluIG9yZGVyIHRvIGF2b2lkIGlvbW11Cj4gZmF1bHRzKQoK
TWFraW5nIHRoZSBFeHRJbnQgZW50cnkgaXMgYXQgbGVhc3Qgd29ydGggYW4gZXhwZXJpbWVudCwg
dG8KKGhvcGVmdWxseSkgY29uZmlybSB0aGF0IHRoaXMgd291bGQgdGFrZSBjYXJlIG9mIHRoZSBJ
T01NVQpmYXVsdC4gQnV0IEknbSBhZnJhaWQgKGFzIHBlciBhYm92ZSkgaXQncyBub3QgYW4gb3B0
aW9uIGluCmdlbmVyYWwuIFdoYXQgSSBjb3VsZCBzZWUgdXMgZG9pbmcgaXMgbWFzayB0aGUgZW50
cnkgaWYgYWxsCmxlZ2FjeSBJUlFzIGFyZSBoYW5kbGVkIHRocm91Z2ggdGhlIElPLUFQSUMuIFRo
aXMgd291bGQgdGFrZQpjYXJlIG9mIHNwdXJpb3VzIGludGVycnVwdHMsIGFzIHRoZXNlIGFyZSB0
aGUgb25seSBvbmVzCndoaWNoIGNhbiBtYWtlIGl0IHRocm91Z2ggd2hlbiB0aGUgUElDIG1hc2sg
Yml0cyBhcmUgYWxsIHNldC4KSG93ZXZlciwgbWF5YmUgaXQgaXMgbGVnaXRpbWF0ZSB0byBtYXNr
IHRoZSBFeHRJbnQgZW50cnkKd2hlbiBhbiBJT01NVSBjb21lcyBpbnRvIHBsYXkuCgpBcyB0byAi
cHJvcGVyIiByZW1hcHBpbmcgZW50cmllczogSSdsbCBoYXZlIHRvIGxvb2sgYXQgdGhlCnNwZWMg
d2hhdCB0aGV5IHNheSBhYm91dCB0aGlzLiBUaGVyZSdzIG9ubHkgb25lIElSVCBpbmRleAp0aGF0
IHdlIGNhbiBwdXQgaW4gdGhlIFJURSwgeWV0IHRoaXMgd291bGQgbmVlZCB0byBzZXJ2ZSBhbGwK
MTUgSVJRcyBwb3RlbnRpYWxseSBjb21pbmcgdGhyb3VnaCB0aGUgUElDLiBSZWNhbGwgdGhhdCB0
aGUKdmVjdG9yIGdldHMgc3VwcGxpZWQgYnkgdGhlIFBJQyBpbiB0aGUgRXh0SW50IGNhc2UsIG5v
dCBieQp0aGUgSU8tQVBJQyBSVEUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
