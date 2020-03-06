Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC917B941
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:30:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA9HN-00047M-R0; Fri, 06 Mar 2020 09:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jA9HM-00047G-SA
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:28:24 +0000
X-Inumbo-ID: d2fb1d99-5f8c-11ea-a77d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2fb1d99-5f8c-11ea-a77d-12813bfff9fa;
 Fri, 06 Mar 2020 09:28:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D355AD27;
 Fri,  6 Mar 2020 09:28:23 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200303172046.50569-1-roger.pau@citrix.com>
 <20200303172046.50569-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0ab8906-e2a2-d3d6-24cc-824d5cbf711a@suse.com>
Date: Fri, 6 Mar 2020 10:28:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303172046.50569-5-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 4/6] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxODoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEludHJvZHVjZSBh
IHNwZWNpZmljIGZsYWcgdG8gcmVxdWVzdCBhIEhWTSBndWVzdCBUTEIgZmx1c2gsIHdoaWNoIGlz
Cj4gYW4gQVNJRC9WUElEIHRpY2tsZSB0aGF0IGZvcmNlcyBhIGd1ZXN0IGxpbmVhciB0byBndWVz
dCBwaHlzaWNhbCBUTEIKPiBmbHVzaCBmb3IgYWxsIEhWTSBndWVzdHMuCj4gCj4gVGhpcyB3YXMg
cHJldmlvdXNseSB1bmNvbmRpdGlvbmFsbHkgZG9uZSBpbiBlYWNoIHByZV9mbHVzaCBjYWxsLCBi
dXQKPiB0aGF0J3Mgbm90IHJlcXVpcmVkOiBIVk0gZ3Vlc3RzIG5vdCB1c2luZyBzaGFkb3cgZG9u
J3QgcmVxdWlyZSBsaW5lYXIKPiBUTEIgZmx1c2hlcyBhcyBYZW4gZG9lc24ndCBtb2RpZnkgdGhl
IGd1ZXN0IHBhZ2UgdGFibGVzIGluIHRoYXQgY2FzZQo+IChpZTogd2hlbiB1c2luZyBIQVApLiBO
b3RlIHRoYXQgc2hhZG93IHBhZ2luZyBjb2RlIGFscmVhZHkgdGFrZXMgY2FyZQo+IG9mIGlzc3Vp
bmcgdGhlIG5lY2Vzc2FyeSBmbHVzaGVzIHdoZW4gdGhlIHNoYWRvdyBwYWdlIHRhYmxlcyBhcmUK
PiBtb2RpZmllZC4KPiAKPiBJbiBvcmRlciB0byBrZWVwIHRoZSBwcmV2aW91cyBiZWhhdmlvciBt
b2RpZnkgYWxsIHNoYWRvdyBjb2RlIFRMQgo+IGZsdXNoZXMgdG8gYWxzbyBmbHVzaCB0aGUgZ3Vl
c3QgbGluZWFyIHRvIHBoeXNpY2FsIFRMQiwgaW4gb3JkZXIgdG8KPiBrZWVwIHRoZSBwcmV2aW91
cyBiZWhhdmlvci4gSSBoYXZlbid0IGxvb2tlZCBhdCBlYWNoIHNwZWNpZmljIHNoYWRvdwo+IGNv
ZGUgVExCIGZsdXNoIGluIG9yZGVyIHRvIGZpZ3VyZSBvdXQgd2hldGhlciBpdCBhY3R1YWxseSBy
ZXF1aXJlcyBhCj4gZ3Vlc3QgVExCIGZsdXNoIG9yIG5vdCwgc28gdGhlcmUgbWlnaHQgYmUgcm9v
bSBmb3IgaW1wcm92ZW1lbnQgaW4gdGhhdAo+IHJlZ2FyZC4KCkknbSBzdGlsbCBtaXNzaW5nIGEg
ZGlzY3Vzc2lvbiBvZiB0aGUgc2FmZXR5IG9mIHRoZSByZW1vdmFsIG9mIHRoZQp0aWNrbGUgZnJv
bSB0aGUgc3dpdGNoX2NyM19jcjQoKSBwYXRoOiBJIGRvbid0IHRoaW5rIGl0IGNhbiBiZQpleGNs
dWRlZCBvZmZoYW5kIHRoYXQgc2hhZG93IGNvZGUgc29tZXdoZXJlIHJlbGllcyBvbiB0aGlzIGhh
cHBlbmluZwphcyBhIHNpZGUgZWZmZWN0IG9mIHdyaXRlX3B0YmFzZSgpLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
