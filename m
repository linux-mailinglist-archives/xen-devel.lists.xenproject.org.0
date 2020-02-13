Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D3615BCD6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:31:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BjS-0000Bp-K4; Thu, 13 Feb 2020 10:28:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2BjQ-0000Bk-Tw
 for xen-devel@lists.xen.org; Thu, 13 Feb 2020 10:28:28 +0000
X-Inumbo-ID: 9280d032-4e4b-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9280d032-4e4b-11ea-b0fd-bc764e2007e4;
 Thu, 13 Feb 2020 10:28:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3C01AC0C;
 Thu, 13 Feb 2020 10:28:26 +0000 (UTC)
To: Olaf Hering <olaf@aepfle.de>
References: <20200212115325.12f2efc4.olaf@aepfle.de>
 <20200212152219.38d1a43c.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08abe0b1-3735-d987-1ad7-b608331e564a@suse.com>
Date: Thu, 13 Feb 2020 11:28:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212152219.38d1a43c.olaf@aepfle.de>
Content-Language: en-US
Subject: Re: [Xen-devel] reported memory usage does not match real memory
 usage
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDIuMjAyMCAxNToyMiwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gV2VkLCAxMiBGZWIg
MjAyMCAxMTo1MzoyNSArMDEwMAo+IHNjaHJpZWIgT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRl
PjoKPiAKPj4gSXMgdGhlcmUgYSBmb3JtdWxhIHRvIGNhbGN1bGF0ZSB0aGF0IGFtb3VudCBvZiBl
eHRyYSBtZW1vcnksIGlzIHRoaXMgYmVoYXZpb3IgZG9jdW1lbnRlZCBzb21ld2hlcmU/CgpTZWUg
ZS5nLiBzaF9taW5fYWxsb2NhdGlvbigpIGFuZCB3aGF0ZXZlciBpdHMgSEFQIGNvdW50ZXJwYXJ0
IGlzLiBCdXQKdGhpcyBhbmQgaGVuY2UgLi4uCgo+IFdpdGggdGhlIHNjcmlwdCBiZWxvdywgdGhl
IGZvcm11bGEgbWF5IGxvb2sgbGlrZSB0aGlzOgo+IC0gZWFjaCB2Y3B1IG5lZWRzIDFNQiBleHRy
YSBtZW1vcnkKPiAtIGVhY2ggR0Igb2YgYSBIVk0gZG9tVSBtZW1vcnkgbmVlZHMgOE1CIGV4dHJh
IG1lbW9yeQo+IC0gZWFjaCBIVk0gZG9tVSBuZWVkcyAyTUIgZXh0cmEgbWVtb3J5CgouLi4gdGhp
cyBpcyByZWFsbHkgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlscy4KCj4gSSBhc3N1bWUgdGhlc2Ug
OE1CIHBlciBHQiBpcyBuZWVkZWQgZm9yIHRoZSBFUFQgcGFnZSB0YWJsZXMuCj4gCj4gSW4gY2Fz
ZSB0aGlzIGV4dHJhIG1lbW9yeSBpcyBpbmRlZWQgc29tZSBvYnZpb3VzIHN0YXRpYyB2YWx1ZSwK
PiBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYWxsb2NhdGUgaXQgZnJvbSB0aGUgdmFsdWUgc3BlY2lm
aWVkIGluCj4gJ21lbW9yeT0nIHRvIG1ha2Ugc3VyZSBhIGRvbVUgdXNlcyAoYWxtb3N0KSBleGFj
dGx5IHRoZSB2YWx1ZQo+IHRoYXQgd2FzIGNvbmZpZ3VyZWQuCgpXZWxsLCB0aGUgIm1lbW9yeT0i
IGlzLCBhZmFpaywgc3VwcG9zZWQgdG8gKGxhcmdlbHkpIHJlcHJlc2VudAp3aGF0IHRoZSBndWVz
dCBpcyBnb2luZyB0byAic2VlIiAobm90IGFsbCBvZiBpdCBtYXkgaW4gZmFjdCBiZQp2aXNpYmxl
IHRocm91Z2ggdGhlIEU4MjAgbWFwIHRoZSBndWVzdCBzZWVzIGF0IGJvb3QsIGJ1dCB0aGF0J3MK
YSBkaWZmZXJlbnQgYXNwZWN0KS4gQWxvbmcgd2l0aCBpdCB0aGVyZSBhbHNvIGlzCiJzaGFkb3df
bWVtb3J5PSIsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaGFzIGFsd2F5cyBiZWVuIGdyb3dpbmcK
dGhpcyB2YWx1ZSBpZiBpdCB3YXMgdG9vIHNtYWxsLCB0byBhdm9pZCByZW5kZXJpbmcgZ3Vlc3Rz
CnVuc3RhYmxlLiBTbyBzd2l0Y2hpbmcgdG8gYSBtb2RlbCBsaWtlIHlvdSBwcm9wb3NlIHdvdWxk
IGxpa2VseQpyZXF1aXJlIGEgbmV3IGd1ZXN0IGNvbmZpZyBvcHRpb24gKGFuZCB0aGVuIGhvdyB0
byBkZWFsIHdpdGgKY29uZmxpY3RzIGJldHdlZW4gb2xkIGFuZCBuZXcgb3B0aW9ucyB3b3VsZCBu
ZWVkIHRvIGJlIHNwZWxsZWQKb3V0KS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
