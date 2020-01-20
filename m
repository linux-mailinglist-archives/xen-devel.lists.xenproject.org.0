Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB814260B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 09:45:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itSdQ-0006TF-UJ; Mon, 20 Jan 2020 08:42:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itSdP-0006T9-O4
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 08:42:11 +0000
X-Inumbo-ID: baf849d0-3b60-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baf849d0-3b60-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 08:42:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A630AD20;
 Mon, 20 Jan 2020 08:42:02 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
 <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
 <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
 <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c26e9510-9a32-dfde-e786-f005ef66e019@suse.com>
Date: Mon, 20 Jan 2020 09:42:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAyMDowNiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMjAuMTIuMTkg
MTA6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxOS4xMi4yMDE5IDIyOjA4LCBFc2xhbSBF
bG5pa2V0eSB3cm90ZToKPj4+IE9uIDE4LjEyLjE5IDEyOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAxOC4xMi4yMDE5IDAyOjMyLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4+Pj4gRGVj
b3VwbGUgdGhlIG1pY3JvY29kZSByZWZlcmVuY2luZyBtZWNoYW5pc20gd2hlbiB1c2luZyBHUlVC
IHRvIHRoYXQKPj4+Pj4gd2hlbiB1c2luZyBFRkkuIFRoaXMgYWxsb3dzIHVzIHRvIGF2b2lkIHRo
ZSAidW5zcGVjaWZpZWQgZWZmZWN0IiBvZgo+Pj4+PiB1c2luZyBgPGludGVnZXI+IHwgc2NhbmAg
YWxvbmcgeGVuLmVmaS4KPj4+Pgo+Pj4+IEkgZ3Vlc3MgInVuc3BlY2lmaWVkIGVmZmVjdCIgaW4g
dGhlIGRvYyB3YXMgcHJldHR5IHBvaW50bGVzcyAtIHN1Y2gKPj4+PiBvcHRpb25zIGhhdmUgYmVl
biBpZ25vcmVkIGJlZm9yZTsgaW4gZmFjdCAuLi4KPj4+Pgo+Pj4+PiBXaXRoIHRoYXQsIFhlbiBj
YW4gZXhwbGljaXRseQo+Pj4+PiBpZ25vcmUgdGhvc2UgbmFtZWQgb3B0aW9ucyB3aGVuIHVzaW5n
IEVGSS4KPj4+Pgo+Pj4+IC4uLiBJIGRvbid0IHNlZSB0aGluZ3MgYmVjb21pbmcgYW55IG1vcmUg
ZXhwbGljaXQgKG5vdCBldmVuIHBhcnNpbmcKPj4+PiB0aGUgb3B0aW9ucyB3YXMgcXVpdGUgZXhw
bGljaXQgdG8gbWUpLgo+Pj4+Cj4+Pgo+Pj4gSSBhZ3JlZSB0aGF0IHRob3NlIG9wdGlvbnMgaGF2
ZSBiZWVuIGlnbm9yZWQgc28gZmFyIGluIHRoZSBjYXNlIG9mIEVGSS4KPj4+IFRoZSBkb2N1bWVu
dGF0aW9uIGNvbnRyYWRpY3RzIHRoYXQgaG93ZXZlci4gVGhlIGRvY3VtZW50YXRpb246Cj4+PiAq
IHNheXMgPGludGVnZXI+IGhhcyB1bnNwZWNpZmllZCBlZmZlY3QuCj4+PiAqIGRvZXMgbm90IG1l
bnRpb24gYW55dGhpbmcgYWJvdXQgc2NhbiBiZWluZyBpZ25vcmVkLgo+Pj4KPj4+IFdpdGggdGhp
cyBwYXRjaCwgaXQgaXMgZXhwbGljaXQgaW4gY29kZSBhbmQgaW4gZG9jdW1lbnRhdGlvbiB0aGF0
IGJvdGgKPj4+IG9wdGlvbnMgYXJlIGlnbm9yZWQgaW4gY2FzZSBvZiBFRkkuCj4+Cj4+IEJ1dCBp
c24ndCBpdCByYXRoZXIgdGhhdCB1Y29kZT1zY2FuIGNvdWxkIChhbmQgaGVuY2UgcGVyaGFwcyBz
aG91bGQpCj4+IGFsc28gaGF2ZSBpdHMgdmFsdWUgb24gRUZJPwo+Pgo+IAo+IEkgZG8gbm90IHNl
ZSAidWNvZGU9c2NhbiIgYXBwbGljYWJsZSBpbiBhbnl3YXkgaW4gdGhlIGNhc2Ugb2YgRUZJLiBJ
biAKPiBFRkksIHRoZXJlIGFyZSBub3QgIm1vZHVsZXMiIHRvIHNjYW4gdGhyb3VnaCwgYnV0IHJh
dGhlciB0aGUgZWZpIGNvbmZpZyAKPiBwb2ludHMgZXhhY3RseSB0byB0aGUgbWljcm9jb2RlIGJs
b2IuCgpXaGF0IHdvdWxkIGJlIHdyb25nIHdpdGggdGhlIEVGSSBjb2RlIHRvIGFsc28gaW5zcGVj
dCB3aGF0ZXZlciBoYXMgYmVlbgpzcGVjaWZpZWQgd2l0aCByYW1kaXNrPSBpZiB0aGVyZSB3YXMg
bm8gdWNvZGU9ID8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
