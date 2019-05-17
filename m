Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F592135D
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 07:16:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRVB7-0002FD-3X; Fri, 17 May 2019 05:13:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dmq+=TR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRVB5-0002F8-TD
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 05:13:07 +0000
X-Inumbo-ID: 7385ff89-7862-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7385ff89-7862-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 05:13:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EFCEAC11;
 Fri, 17 May 2019 05:13:04 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: =?UTF-8?B?PDIwMTkwNTA2MDY1NjQ0Ljc0MTXvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?B?Y29tPiA8MjAxOTA1MDYwNjU2NDQuNzQxNe+/vTQz77+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?Q?=3e_=3c5CDD6005020000780022FA9A=40suse=2ecom=3e_=3c074965f8-b20f-?=
 =?UTF-8?Q?9dc3-2729-7f3c4793b38d=40suse=2ecom=3e_=3c5CDD7693020000780022FC5?=
 =?UTF-8?B?OUBzdXNlLmNvbT4=?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7bfa4c94-ccf1-0b3c-6f92-d4f87b591961@suse.com>
Date: Fri, 17 May 2019 07:13:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
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

T24gMTYvMDUvMjAxOSAxNjo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDUuMTkg
YXQgMTU6NTEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAxNi8wNS8yMDE5IDE1OjA1
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+PiBAQCAtMTU0LDYgKzE1NCwyNCBAQCBzdGF0
aWMgdm9pZCBpZGxlX2xvb3Aodm9pZCkKPj4+PiAgICAgIH0KPj4+PiAgfQo+Pj4+ICAKPj4+PiAr
LyoKPj4+PiArICogSWRsZSBsb29wIGZvciBzaWJsaW5ncyBvZiBhY3RpdmUgc2NoZWR1bGUgaXRl
bXMuCj4+Pj4gKyAqIFdlIGRvbid0IGRvIGFueSBzdGFuZGFyZCBpZGxlIHdvcmsgbGlrZSB0YXNr
bGV0cywgcGFnZSBzY3J1YmJpbmcgb3IKPj4+PiArICogbGl2ZXBhdGNoaW5nLgo+Pj4+ICsgKiBV
c2UgZGVmYXVsdF9pZGxlKCkgaW4gb3JkZXIgdG8gc2ltdWxhdGUgdi0+aXNfdXJnZW50Lgo+Pj4K
Pj4+IEkgZ3Vlc3MgSSdtIG1pc3NpbmcgYSBwYXJ0IG9mIHRoZSBkZXNjcmlwdGlvbiB3aGljaCBl
eHBsYWlucyBhbGwgdGhpczoKPj4+IFdoYXQncyB3cm9uZyB3aXRoIGRvaW5nIHNjcnViYmluZyB3
b3JrLCBmb3IgZXhhbXBsZT8gV2h5IGlzCj4+PiBkb2luZyB0YXNrbGV0IHdvcmsgbm90IG9rYXks
IGJ1dCBzb2Z0aXJxcyBhcmU/IFdoYXQgaXMgdGhlIGRlYWwgd2l0aAo+Pj4gdi0+aXNfdXJnZW50
LCBpLmUuIHdoYXQganVzdGlmaWVzIG5vdCBlbnRlcmluZyBhIGRlY2VudCBwb3dlcgo+Pj4gc2F2
aW5nIG1vZGUgaGVyZSBvbiBJbnRlbCwgYnV0IGRvaW5nIHNvIG9uIEFNRD8KPj4KPj4gT25lIG9m
IHRoZSByZWFzb25zIGZvciB1c2luZyBjb3JlIHNjaGVkdWxpbmcgaXMgdG8gYXZvaWQgcnVubmlu
ZyB2Y3B1cwo+PiBvZiBkaWZmZXJlbnQgZG9tYWlucyBvbiB0aGUgc2FtZSBjb3JlIGluIG9yZGVy
IHRvIG1pbmltaXplIHRoZSBjaGFuY2VzCj4+IGZvciBzaWRlIGNoYW5uZWwgYXR0YWNrcyB0byBk
YXRhIG9mIG90aGVyIGRvbWFpbnMuIE5vdCBhbGxvd2luZwo+PiBzY3J1YmJpbmcgb3IgdGFza2xl
dHMgaGVyZSBpcyBkdWUgdG8gYXZvaWQgYWNjZXNzaW5nIGRhdGEgb2Ygb3RoZXIKPj4gZG9tYWlu
cy4KPiAKPiBTbyBob3cgaXMgcnVubmluZyBzb2Z0aXJxcyBva2F5IHRoZW4/IEFuZCBob3cgaXMg
c2NydWJiaW5nIGFjY2Vzc2luZwo+IG90aGVyIGRvbWFpbnMnIGRhdGE/CgpSaWdodCBub3cgSSdt
IG5vdCBzdXJlIHdoZXRoZXIgaXQgaXMgYSBnb29kIGlkZWEgdG8gYmxvY2sgYW55IHNvZnRpcnFz
LgpXZSBkZWZpbml0ZWx5IG5lZWQgdG8gcHJvY2VzcyBzY2hlZHVsaW5nIHJlcXVlc3RzIGFuZCBJ
IGJlbGlldmUgUkNVIGFuZAp0YXNrbGV0cywgdG9vLiBUaGUgdGxiZmx1c2ggb25lIHNob3VsZCBi
ZSB1bmNyaXRpY2FsLCBzbyB0aW1lcnMgaXMgdGhlCnJlbWFpbmluZyBvbmUgd2hpY2ggbWlnaHQg
YmUgcXVlc3Rpb25hYmxlLiBUaGlzIGNhbiBiZSBmaW5lLXR1bmVkIGxhdGVyCklNTyBlLmcuIGJ5
IGRlZmluaW5nIGEgc29mdGlycSBtYXNrIG9mIGNyaXRpY2FsIHNvZnRpcnFzIHRvIGJsb2NrIGFu
ZApldmVudHVhbGx5IHNwbGl0dGluZyB1cCBlLmcuIHRpbWVyIGFuZCB0YXNrbGV0IHNvZnRpcnFz
IGludG8gY3JpdGljYWwKYW5kIHVuY3JpdGljYWwgb25lcy4KClNjcnViYmluZyB3aWxsIHByb2Jh
Ymx5IHB1bGwgdGhlIGNhY2hlIGxpbmVzIG9mIHRoZSBkaXJ0eSBwYWdlcyBpbnRvCnRoZSBMMSBj
YWNoZSBvZiB0aGUgY3B1LiBGb3IgbWUgdGhpcyBzb3VuZHMgcHJvYmxlbWF0aWMuIEluIGNhc2Ug
d2UKYXJlIGZpbmUgdG8gZG8gc2NydWJiaW5nIGFzIHRoZXJlIGlzIG5vIHJpc2sgYXNzb2NpYXRl
ZCBJJ20gZmluZSB0byBhZGQKaXQgYmFjayBpbi4KCj4+IEFzIHdpdGggY29yZSBzY2hlZHVsaW5n
IHdlIGNhbiBiZSBzdXJlIHRoZSBvdGhlciB0aHJlYWQgaXMgYWN0aXZlCj4+IChvdGhlcndpc2Ug
d2Ugd291bGQgc2NoZWR1bGUgdGhlIGlkbGUgaXRlbSkgYW5kIGhvcGluZyBmb3Igc2F2aW5nIHBv
d2VyCj4+IGJ5IHVzaW5nIG13YWl0IGlzIG1vb3QuCj4gCj4gU2F2aW5nIHBvd2VyIG1heSBiZSBp
bmRpcmVjdCwgYnkgdGhlIENQVSByZS1hcnJhbmdpbmcKPiByZXNvdXJjZSBhc3NpZ25tZW50IGJl
dHdlZW4gdGhyZWFkcyB3aGVuIG9uZSBnb2VzIGlkbGUuCj4gSSBoYXZlIG5vIGlkZWEgd2hldGhl
ciB0aGV5IGRvIHRoaXMgd2hlbiBlbnRlcmluZyBDMSwgb3IKPiBvbmx5IHdoZW4gZW50ZXJpbmcg
ZGVlcGVyIEMgc3RhdGVzLgoKU0RNIFZvbC4gMyBjaGFwdGVyIDguMTAuMSAiSExUIGluc3RydWN0
aW9uIjoKCiJIZXJlIHNoYXJlZCByZXNvdXJjZXMgdGhhdCB3ZXJlIGJlaW5nIHVzZWQgYnkgdGhl
IGhhbHRlZCBsb2dpY2FsCnByb2Nlc3NvciBiZWNvbWUgYXZhaWxhYmxlIHRvIGFjdGl2ZSBsb2dp
Y2FsIHByb2Nlc3NvcnMsIGFsbG93aW5nIHRoZW0KdG8gZXhlY3V0ZSBhdCBncmVhdGVyIGVmZmlj
aWVuY3kuIgoKPiBBbmQgYW55d2F5IC0gSSdtIHN0aWxsIG5vbmUgdGhlIHdpc2VyIGFzIHRvIHRo
ZSB2LT5pc191cmdlbnQKPiByZWxhdGlvbnNoaXAuCgpXaXRoIHYtPmlzX3VyZ2VudCBzZXQgdG9k
YXkncyBpZGxlIGxvb3Agd2lsbCBkcm9wIGludG8gZGVmYXVsdF9pZGxlKCkuCkkgY2FuIHJlbW92
ZSB0aGlzIHNlbnRlbmNlIGluIGNhc2UgaXQgaXMganVzdCBjb25mdXNpbmcuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
