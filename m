Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852BC2089F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:53:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGnQ-0001eL-MV; Thu, 16 May 2019 13:51:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRGnO-0001e8-VK
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:51:42 +0000
X-Inumbo-ID: baf85d1e-77e1-11e9-8861-7f404827fb57
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baf85d1e-77e1-11e9-8861-7f404827fb57;
 Thu, 16 May 2019 13:51:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67E7DAD9F;
 Thu, 16 May 2019 13:51:39 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-43-jgross@suse.com> <5CDD6005020000780022FA9A@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <074965f8-b20f-9dc3-2729-7f3c4793b38d@suse.com>
Date: Thu, 16 May 2019 15:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD6005020000780022FA9A@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 42/45] xen/sched: add fall back to
 idle vcpu when scheduling item
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxNTowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
ZG9tYWluLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+IEBAIC0xNTQsNiArMTU0
LDI0IEBAIHN0YXRpYyB2b2lkIGlkbGVfbG9vcCh2b2lkKQo+PiAgICAgIH0KPj4gIH0KPj4gIAo+
PiArLyoKPj4gKyAqIElkbGUgbG9vcCBmb3Igc2libGluZ3Mgb2YgYWN0aXZlIHNjaGVkdWxlIGl0
ZW1zLgo+PiArICogV2UgZG9uJ3QgZG8gYW55IHN0YW5kYXJkIGlkbGUgd29yayBsaWtlIHRhc2ts
ZXRzLCBwYWdlIHNjcnViYmluZyBvcgo+PiArICogbGl2ZXBhdGNoaW5nLgo+PiArICogVXNlIGRl
ZmF1bHRfaWRsZSgpIGluIG9yZGVyIHRvIHNpbXVsYXRlIHYtPmlzX3VyZ2VudC4KPiAKPiBJIGd1
ZXNzIEknbSBtaXNzaW5nIGEgcGFydCBvZiB0aGUgZGVzY3JpcHRpb24gd2hpY2ggZXhwbGFpbnMg
YWxsIHRoaXM6Cj4gV2hhdCdzIHdyb25nIHdpdGggZG9pbmcgc2NydWJiaW5nIHdvcmssIGZvciBl
eGFtcGxlPyBXaHkgaXMKPiBkb2luZyB0YXNrbGV0IHdvcmsgbm90IG9rYXksIGJ1dCBzb2Z0aXJx
cyBhcmU/IFdoYXQgaXMgdGhlIGRlYWwgd2l0aAo+IHYtPmlzX3VyZ2VudCwgaS5lLiB3aGF0IGp1
c3RpZmllcyBub3QgZW50ZXJpbmcgYSBkZWNlbnQgcG93ZXIKPiBzYXZpbmcgbW9kZSBoZXJlIG9u
IEludGVsLCBidXQgZG9pbmcgc28gb24gQU1EPwoKT25lIG9mIHRoZSByZWFzb25zIGZvciB1c2lu
ZyBjb3JlIHNjaGVkdWxpbmcgaXMgdG8gYXZvaWQgcnVubmluZyB2Y3B1cwpvZiBkaWZmZXJlbnQg
ZG9tYWlucyBvbiB0aGUgc2FtZSBjb3JlIGluIG9yZGVyIHRvIG1pbmltaXplIHRoZSBjaGFuY2Vz
CmZvciBzaWRlIGNoYW5uZWwgYXR0YWNrcyB0byBkYXRhIG9mIG90aGVyIGRvbWFpbnMuIE5vdCBh
bGxvd2luZwpzY3J1YmJpbmcgb3IgdGFza2xldHMgaGVyZSBpcyBkdWUgdG8gYXZvaWQgYWNjZXNz
aW5nIGRhdGEgb2Ygb3RoZXIKZG9tYWlucy4KCkFzIHdpdGggY29yZSBzY2hlZHVsaW5nIHdlIGNh
biBiZSBzdXJlIHRoZSBvdGhlciB0aHJlYWQgaXMgYWN0aXZlCihvdGhlcndpc2Ugd2Ugd291bGQg
c2NoZWR1bGUgdGhlIGlkbGUgaXRlbSkgYW5kIGhvcGluZyBmb3Igc2F2aW5nIHBvd2VyCmJ5IHVz
aW5nIG13YWl0IGlzIG1vb3QuCgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5o
Cj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKPj4gQEAgLTc2LDYgKzc2LDkgQEAg
dm9pZCBzZXRfbnJfc29ja2V0cyh2b2lkKTsKPj4gIC8qIFJlcHJlc2VudGluZyBIVCBhbmQgY29y
ZSBzaWJsaW5ncyBpbiBlYWNoIHNvY2tldC4gKi8KPj4gIGV4dGVybiBjcHVtYXNrX3QgKipzb2Nr
ZXRfY3B1bWFzazsKPj4gIAo+PiArI2RlZmluZSBnZXRfY3B1X2N1cnJlbnQoY3B1KSBcCj4+ICsg
ICAgKGdldF9jcHVfaW5mb19mcm9tX3N0YWNrKCh1bnNpZ25lZCBsb25nKXN0YWNrX2Jhc2VbY3B1
XSktPmN1cnJlbnRfdmNwdSkKPiAKPiBZZXQgYW5vdGhlciwgc2xpZ2h0bHkgZGlmZmVyZW50IG5v
dGlvbiBvZiAiY3VycmVudCIuIElmICJjdXJyZW50Igo+IGl0c2VsZiBpcyBub3Qgc3VpdGFibGUg
KEkgY2FuJ3QgaW1tZWRpYXRlbHkgc2VlIHdoeSB0aGF0IHdvdWxkIGJlLAo+IGJ1dCBJIGFsc28g
ZGlkbid0IGxvb2sgYXQgYWxsIHRoZSBzY2hlZHVsZXIgc3BlY2lmaWMgY2hhbmdlcyBlYXJsaWVy
Cj4gaW4gdGhpcyBzZXJpZXMpLCB3aHkgaXNuJ3QgcGVyX2NwdShjdXJyX3ZjcHUsIGNwdSkgZWl0
aGVyPwoKY3VycmVudCBpcyBhbHdheXMgdGhlIHZjcHUgcnVubmluZyBvbiB0aGUgY3VycmVudCBw
aHlzaWNhbCBjcHUuCmN1cnJfdmNwdSBpcyB0aGUgdmNwdSB3aGljaCB3YXMgdGhlIG9uZSBydW5u
aW5nIGluIGd1ZXN0IG1vZGUgbGFzdAoodGhpcyBhdm9pZHMgdGhlIG5lZWQgdG8gc2F2ZS9yZXN0
b3JlIGNvbnRleHQgaW4gY2FzZSBhIHZjcHUgaXMKYmxvY2tlZCBmb3IgYSBzaG9ydCB0aW1lIHdp
dGhvdXQgYW5vdGhlciBndWVzdCB2Y3B1IHJ1bm5pbmcgb24gdGhlCnBoeXNpY2FsIGNwdSBpbiBi
ZXR3ZWVuKSwgc28gd2l0aCBjdXJyZW50IGJlaW5nIGlkbGUgdGhlIHR3byBjYW4KZGlmZmVyLgoK
SGVyZSBJIG5lZWQgImN1cnJlbnQiIGZyb20gYW5vdGhlciBwaHlzaWNhbCBjcHUgd2hpY2ggaXMg
bm90IGVhc2lseQphdmFpbGFibGUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
