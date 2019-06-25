Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B352853
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 11:42:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfhuW-0002V0-LV; Tue, 25 Jun 2019 09:38:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfhuW-0002Uv-1w
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 09:38:44 +0000
X-Inumbo-ID: 026e7a38-972d-11e9-b350-5766fb309a4c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 026e7a38-972d-11e9-b350-5766fb309a4c;
 Tue, 25 Jun 2019 09:38:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 03:38:37 -0600
Message-Id: <5D11EB9A020000780023ADEF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 03:38:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <a6616d8c-af45-c3d7-24e7-f4b513fdc008@citrix.com>
In-Reply-To: <a6616d8c-af45-c3d7-24e7-f4b513fdc008@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] UBSAN report in find_next_bit()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA2LjE5IGF0IDE4OjI0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4+IGVsc2UgaWYgKCAobm9kZSA9IG5leHRfbm9kZShub2RlLCBub2RlbWFzaykpID49IE1B
WF9OVU1OT0RFUyApCj4+ICAgICBub2RlID0gZmlyc3Rfbm9kZShub2RlbWFzayk7Cj4gCj4gT24g
eDg2LCBNQVhfTlVNTk9ERVMgaXMgNjQsIGFuZCB0aGlzIHBhcnQgb2YgZ2V0X2ZyZWVfYnVkZHko
KSBsb29wcyBvdmVyCj4gbm9kZXMgezAuLjYzfS4gIG5leHRfbm9kZSgpIGV4cGFuZHMgdG8gZmlu
ZF9uZXh0X2JpdCguLi4sIG5vZGUrMSkgd2hpY2gKPiBwYXNzZXMgb2Zmc2V0ID09IHNpemUgb24g
dGhlIGZpbmFsIGl0ZXJhdGlvbi4KPiAKPiBmaW5kX25leHRfYml0KCkgaGFzIGFuIG9wdGltaXNh
dGlvbiBmb3IgYml0bWFwcyBvZiA2NCBvciBmZXdlciBiaXRzCj4gd2hpY2ggZG9lczoKPiAKPj4g
ZWxzZSBpZiAoIF9fYnVpbHRpbl9jb25zdGFudF9wKHNpemUpICYmIHNfXyA8PSBCSVRTX1BFUl9M
T05HICkKPj4gICAgIHJfXyA9IG9fXyArIF9fc2NhbmJpdCgqKGNvbnN0IHVuc2lnbmVkIGxvbmcg
KikoYV9fKSA+PiBvX18sIHNfXyk7Cj4gCj4gVUJTQU4gdGFrZXMgb2JqZWN0aW9uIHRvIHRoZSBz
aGlmdCwgd2hpY2ggaW4gdGhpcyBjYXNlIGlzIGEgc2hpZnQgYnkgNjQuCj4gCj4gVGhlIGNvZGUg
aW4gX19maW5kX25leHRfYml0KCkgbWFrZXMgaXQgY2xlYXIgdGhhdCBvZmZzZXQgPT0gc2l6ZSBp
cyBhCj4gdmFsaWQgY29uZGl0aW9uLCB3aGljaCB3b3VsZCBzdWdnZXN0IHRoYXQgdGhlIGJ1ZyBp
cyB3aXRoIHRoZSBvcHRpbWlzYXRpb24uCgpPaCwgaW4gcGFydGljdWxhciB0aGUgQVNTRVJUKCkg
dGhlcmUgaXMgaW5kZWVkIHZlcnkgY2xlYXIuCgo+IEhvd2V2ZXIsIHRoaXMgY29uY2x1c2lvbiBj
b250cmFkaWN0cyB0aGUgdmlld3Mgb2YgYy9zIGIyMDA3OWRhOSB3aGljaAo+IGRlY2lkZWQgdGhh
dCBvZmZzZXQgPT0gc2l6ZSBpcyBub3QgYSB2YWxpZCBjb25kaXRpb24uCgpBbmQgdGhhdCB3YXMg
YmFzZWQgb24gaG93IHg4NidlcyBmaW5kX25leHR7LF96ZXJvfV9iaXQoKSBhcyB3ZWxsCmFzIC4u
LgoKPiBBUk02NCdzIGZpbmRfbmV4dF9iaXQoKSBleHBsaWNpdGx5IGNvcGVzIHdpdGggb2Zmc2V0
ID49IHNpemUsIGFuZCB3aGlsZQo+IEkgZG9uJ3Qgc3BlYWsgQVJNIGFzbSB3ZWxsIGVub3VnaCB0
byB3b3JrIG91dCB3aGV0aGVyCj4gX2ZpbmRfZmlyc3RfYml0X2xlKCkgY29wZXMgd2l0aCBvZmZz
ZXQgPT0gc2l6ZSwgdGhlIHZnaWMuYyBjb2RlCj4gZGVmaW5pdGVseSBleHBlY3RzIGl0IHRvIGZ1
bmN0aW9uIGluIHRoaXMgd2F5LgoKLi4uIEFybTMyJ3MgX2ZpbmRfbmV4dHssX3plcm99X2JpdF9s
ZS4gWW91J3ZlIG5hbWVkIHRoZSBpc3N1ZSB0aGUgeDg2CmxvZ2ljIGhhcy4gQXJtMzIncywgYWZh
aWN0LCB3aWxsIHJlYWQgb25lIGJ5dGUgcGFzdCB0aGUgYXJyYXkgd2hlbiBvZmZzZXQKYW5kIHNp
emUgbWF0Y2ggYW5kIGFyZSBhIG11bHRpcGxlIG9mIDguCgo+IEFzIGEgcmVzdWx0LCBJIHRoaW5r
IHRoZSByZWFzb25pbmcgaW4gYy9zIGIyMDA3OWRhOSBpcyBmYWxzZSwgYW5kIHRoYXQKPiBjaGFu
Z2UgbmVlZHMgcmUtYWRqdXN0aW5nLiAgSSBhbHNvIHRoaW5rIHRoYXQgeDg2J3Mgb3B0aW1pc2F0
aW9uIGZvcgo+IHNpemUgPT0gNjQgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYnVnZ3kgYW5kIGZpeGVk
LiAgVEJILCBJJ20gbm90IHN1cmUgdGhlCj4gb3B0aW1pc2F0aW9uIGlzIHdvcnRod2hpbGUgaGF2
aW5nIGluIHRoZSBmaXJzdCBwbGFjZS4KClRoZSBxdWVzdGlvbiB0aG91Z2ggaXMgd2hldGhlciwg
YWxvbmdzaWRlIG9mZnNldCA9PSBzaXplIHBvdGVudGlhbGx5CmJlaW5nIG1lYW50IHRvIGJlIHZh
bGlkLCBvZmZzZXQgPiBzaXplIGlzIHRvIGJlIHRyZWF0ZWQgbGlrZSBzdWNoLCB0b28uCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
