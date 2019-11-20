Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDC103900
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 12:44:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXONH-0002vD-Iq; Wed, 20 Nov 2019 11:42:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXONG-0002v8-IL
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 11:42:18 +0000
X-Inumbo-ID: cd650870-0b8a-11ea-a310-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd650870-0b8a-11ea-a310-12813bfff9fa;
 Wed, 20 Nov 2019 11:42:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 400C6BAA2;
 Wed, 20 Nov 2019 11:42:16 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
 <20191120100627.GP72134@Air-de-Roger>
 <c823656633fc4cde9fb232809c31c8a2@EX13D32EUC003.ant.amazon.com>
 <a821dd08-3afb-350d-dded-26b7e07df4b1@suse.com>
 <a78709323d7b429c97cdeb652375d601@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f2af109-d372-ee94-8930-251acdb64402@suse.com>
Date: Wed, 20 Nov 2019 12:42:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a78709323d7b429c97cdeb652375d601@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] grant table size
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAxMjoxOCwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMTkgMTI6MDkKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBk
dXJyYW50QGFtYXpvbi5jb20+Cj4+IENjOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBTdWJqZWN0OiBSZTog
W1hlbi1kZXZlbF0gZ3JhbnQgdGFibGUgc2l6ZQo+Pgo+PiBPbiAyMC4xMS4yMDE5IDExOjQ5LCAg
RHVycmFudCwgUGF1bCAgd3JvdGU6Cj4+Pj4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4+Pj4gU2VudDogMjAgTm92ZW1iZXIgMjAxOSAxMTowNgo+Pj4+Cj4+
Pj4gRG8geW91IGhhdmUgaW4gbWluZCB0byBzaWduYWwgdGhpcyBzb21laG93IHRvIGd1ZXN0cywg
b3IgdGhlCj4+Pj4gZXhwZWN0YXRpb24gaXMgdGhhdCB0aGUgZ3Vlc3Qgd2lsbCBoYXZlIHRvIHBv
bGwgR05UVEFCT1BfcXVlcnlfc2l6ZQo+Pj4+IGFuZCBhdCBzb21lIHBvaW50IHRoZSBzaXplIHdp
bGwgaW5jcmVhc2U/Cj4+Pgo+Pj4gSSBkb24ndCB0aGluayB0aGUgZ3Vlc3QgbmVlZCBjYXJlIHVu
dGlsIGl0cyBncmFudCB0YWJsZSBncm93cyB0byB0aGUKPj4+IG1heC4gQXQgdGhhdCBwb2ludCwg
cmF0aGVyIHRoYW4gZ2l2aW5nIHVwLCB0aGUgZ3Vlc3Qgd291bGQgcmUtcXVlcnkKPj4+IHRoZSBt
YXggdmFsdWUgdG8gc2VlIGlmIHRoZXJlIGlzIG5vdyBtb3JlIGhlYWRyb29tIGFuZCB0aGVuIHJl
LXNpemUKPj4+IGl0cyBpbnRlcm5hbCBkYXRhIHN0cnVjdHVyZXMgYWNjb3JkaW5nbHkuCj4+Cj4+
IElmIHdlIGNvbnNpZGVyIGR5bmFtaWMgYWRqdXN0bWVudHMsIHdoYXQgYWJvdXQgc2hyaW5raW5n
IG9mIHRoZQo+PiB0YWJsZT8gVGhpcyB3b3VsZCBvZiBjb3Vyc2UgcmVxdWlyZSBzb21lIGZvcm0g
b2YgZ3Vlc3QgY29uc2VudCwKPj4gYnV0IGl0IHdvdWxkIGJlIG5pY2UgaWYgdGhlIG9wdGlvbiB3
b3VsZCBhdCBsZWFzdCBiZSBhY2NvdW50ZWQKPj4gZm9yIHdoZW4gd29ya2luZyBvdXQgaG93IGFs
bCBvZiB0aGlzIHNob3VsZCBiZWhhdmUsIGV2ZW4gaWYgdGhlCj4+IGNhc2UgbWF5IG5vdCBnZXQg
aGFuZGxlZCByaWdodCBub3cuCj4+Cj4gCj4gV2VsbCwgcGVyaGFwcyB3ZSBjb3VsZCBoYXZlIGEg
c2V0X3NpemUgZ250dGFiIG9wIHdoZXJlIGEgZ3Vlc3Qgd291bGQKPiBiZSBhbGxvd2VkIHRvIGNh
bGwgaXQgd2l0aCBhIHZhbHVlIGxlc3MgdGhhbiAob3IgZXF1YWwgdG8pIGl0cyBjdXJyZW50Cj4g
bWF4LCBzbyB0aGF0IGl0IGNhbiB2b2x1bnRhcmlseSB5aWVsZCBpdHMgaGVhZHJvb20sIGJ1dCBv
bmx5IGEKPiBwcml2aWxlZ2VkIGd1ZXN0IHdvdWxkIGJlIGFsbG93ZWQgdG8gY2FsbCBpdCB3aXRo
IGFuIGluY3JlYXNlZCBtYXgKPiB2YWx1ZT8KCkFoIHllcywgdGhpcyBzb3VuZHMgZ29vZC4KCj4g
SSdtIG5vdCBzdXJlIHdoYXQgbWVjaGFuaXNtIHdvdWxkIGJlIGJlc3QgZm9yIHJlcXVlc3Rpbmcg
YSBndWVzdAo+IHJlZHVjdGlvbiB0aG91Z2gsIEkgZ3Vlc3MgcHJvYmFibHkgeGVuc3RvcmUuLi4g
c29tZXRoaW5nIGFraW4gdG8KPiBiYWxsb29uIHRhcmdldCBwYWdlcz8KClBlcmhhcHMuCgo+IEEg
Z3Vlc3QgcmVkdWN0aW9uIG9mIG1heCBpcyBvZiBwcmV0dHkgbGltaXRlZCB2YWx1ZSB0aG91Z2gg
QUZBSUNUIGFzCj4gb25seSBpbi11c2UgZnJhbWVzIHJlYWxseSB1c2UgYW55IG1lbW9yeS4gVGhl
IChhY3RpdmUvc2hhcmVkL3N0YXR1cykKPiBhcnJheXMgY291bGQsIG9mIGNvdXJzZSwgYmUgcmVk
dWNlZCBpbiBzaXplIGJ1dCB0aGF0IG9ubHkgZ2V0cyB5b3UgYQo+IGZldyBieXRlcyBiYWNrLgoK
V2VsbCwgaWYgdGhpcyByZWFsbHkgd2FzIGFib3V0IGp1c3QgImEgZmV3IGJ5dGVzIiwgd2h5IHdv
dWxkbid0IHdlCmFsbG93IGFyYml0cmFyeSBzaXplIGdyYW50IHRhYmxlcyB0byBiZWdpbiB3aXRo
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
