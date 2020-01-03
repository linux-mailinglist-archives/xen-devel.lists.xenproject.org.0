Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A712F952
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:46:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inOAn-0005Lm-Ql; Fri, 03 Jan 2020 14:43:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inOAm-0005Lh-Iq
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:43:32 +0000
X-Inumbo-ID: 647cad84-2e37-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 647cad84-2e37-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 14:43:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9FAC2B052;
 Fri,  3 Jan 2020 14:43:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f3803fa1-fc4f-8754-f654-0c93193f69e7@suse.com>
Date: Fri, 3 Jan 2020 15:44:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224151932.6304-7-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/12] docs/migration Specify migration v3
 and STATIC_DATA_END
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTIuMjAxOSAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBNaWdyYXRpb24gZGF0
YSBjYW4gYmUgc3BsaXQgaW50byB0d28gcGFydHMgLSB0aGF0IHdoaWNoIGlzIGludmFyaWFudCBv
Zgo+IGd1ZXN0IGV4ZWN1dGlvbiwgYW5kIHRoYXQgd2hpY2ggaXMgbm90LiAgU2VwYXJhdGUgdGhl
c2UgdHdvIHdpdGggdGhlCj4gU1RBVElDX0RBVEFfRU5EIHJlY29yZC4KPiAKPiBUaGUgc2hvcnQg
dGVybSwgd2Ugd2FudCB0byBtb3ZlIHRoZSB4ODYgQ1BVIFBvbGljeSBkYXRhIGludG8gdGhlIHN0
cmVhbS4KPiBJbiB0aGUgbG9uZ2VyIHRlcm0sIHdlIHdhbnQgdG8gcHJvdmlzaW9uYWxseSBzZW5k
IHRoZSBzdGF0aWMgZGF0YSBvbmx5Cj4gdG8gdGhlIGRlc3RpbmF0aW9uIGFzIGEgbW9yZSByb2J1
c3QgY29tcGF0aWJpbGl0eSBjaGVjay4gIEluIGJvdGggY2FzZXMsCj4gd2Ugd2lsbCB3YW50IGEg
Y2FsbGJhY2sgaW50byB0aGUgaGlnaGVyIGxldmVsIHRvb2xzdGFjay4KPiAKPiBNYW5kYXRlIHRo
ZSBwcmVzZW5jZSBvZiB0aGUgU1RBVElDX0RBVEFfRU5EIHJlY29yZCwgYW5kIGRlY2xhcmUgdGhp
cyB2MywKPiBhbG9uZyB3aXRoIGluc3RydWN0aW9ucyBmb3IgaG93IHRvIGNvbXBhdGlibHkgaW50
ZXJwcmV0IGEgdjIgc3RyZWFtLgoKV2hhdCBkb2Vzbid0IGJlY29tZSBjbGVhciAodG8gbWUpIGZy
b20gYWxsIG9mIHRoZSBhYm92ZSBpcyB3aHkgdGhpcwpyZWNvcmQgaXMgbmVlZGVkICh3YW50ZWQp
LCBhbmQgaGVuY2Ugd2h5IGl0IGlzIHRvIGJlIG1hbmRhdG9yeS4KQWZ0ZXIgYWxsIC4uLgoKPiBA
QCAtNjc1LDkgKzY5NCwyMyBAQCBBIHR5cGljYWwgc2F2ZSByZWNvcmQgZm9yIGFuIHg4NiBIVk0g
Z3Vlc3QgaW1hZ2Ugd291bGQgbG9vayBsaWtlOgo+ICBIVk1fUEFSQU1TIG11c3QgcHJlY2VkZSBI
Vk1fQ09OVEVYVCwgYXMgY2VydGFpbiBwYXJhbWV0ZXJzIGNhbiBhZmZlY3QKPiAgdGhlIHZhbGlk
aXR5IG9mIGFyY2hpdGVjdHVyYWwgc3RhdGUgaW4gdGhlIGNvbnRleHQuCj4gIAo+ICtDb21wYXRp
YmlsaXR5IHdpdGggb2xkZXIgdmVyc2lvbnMKPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4gKwo+ICt2MyBjb21wYXQgd2l0aCB2Mgo+ICstLS0tLS0tLS0tLS0tLS0tLQo+ICsK
PiArQSB2MyBzdHJlYW0gaXMgY29tcGF0aWJsZSB3aXRoIGEgdjIgc3RyZWFtLCBidXQgbWFuZGF0
ZXMgdGhlIHByZXNlbnNlIG9mIGEKPiArU1RBVElDX0RBVEFfRU5EIHJlY29yZCBhaGVhZCBvZiBh
bnkgbWVtb3J5L3JlZ2lzdGVyIGNvbnRlbnQuICBUaGlzIGlzIHRvIGVhc2UKPiArdGhlIGludHJv
ZHVjdGlvbiBvZiBuZXcgc3RhdGljIGNvbmZpZ3VyYXRpb24gcmVjb3JkcyBvdmVyIHRpbWUuCj4g
Kwo+ICtBIHYzLWNvbXBhdGlibGUgcmVjaWV2ZXIgaW50ZXJwcmV0aW5nIGEgdjIgc3RyZWFtIHNo
b3VsZCBpbmZlciB0aGUgcG9zaXRpb24gb2YKPiArU1RBVElDX0RBVEFfRU5EIGJhc2VkIG9uIGZp
bmRpbmcgdGhlIGZpcnN0IFg4Nl9QVl9QMk1fRlJBTUVTIHJlY29yZCAoZm9yIFBWCj4gK2d1ZXN0
cyksIG9yIFBBR0VfREFUQSByZWNvcmQgKGZvciBIVk0gZ3Vlc3RzKSBhbmQgYmVoYXZlIGFzIGlm
IFNUQVRJQ19EQVRBX0VORAo+ICtoYWQgYmVlbiBzZW50LgoKLi4uIHlvdSBhbHJlYWR5IGltcGx5
IGEgdjMgcmVjZWl2ZXIgY2FuIGRlYWwgd2l0aCBpdHMgYWJzZW5jZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
