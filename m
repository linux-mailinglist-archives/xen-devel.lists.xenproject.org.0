Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB0215D5
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 11:00:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRYgX-0004Ki-Be; Fri, 17 May 2019 08:57:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dmq+=TR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRYgV-0004Kd-8Q
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 08:57:47 +0000
X-Inumbo-ID: d5f2d8c9-7881-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5f2d8c9-7881-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 08:57:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1265EAC2E;
 Fri, 17 May 2019 08:57:44 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: =?UTF-8?B?PDIwMTkwNTA2MDY1NjQ0Ljc0MTXvv73vv73vv73vv73vv73vv70=?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+9Me+/ve+/ve+/ve+/ve+/vQ==?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?B?PiA8MjAxOTA1MDYwNjU2NDQuNzQxNe+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/vQ==?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+9NDPvv73vv73vv73vv73vv73vv73vv70=?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+9amdyb3NzQHN1c2UuY29tPiA8NUNE?=
 =?UTF-8?B?RDYwMDUwMjAwMDA3ODAwMjJGQTlBQHN1c2UuY29tPiA8MDc0OTY1Zjjvv73vv70=?=
 =?UTF-8?B?77+977+9YjIwZu+/ve+/ve+/ve+/vTlkYzPvv73vv73vv73vv70yNzI577+977+9?=
 =?UTF-8?B?77+977+9N2YzYzQ3OTNiMzhkQHN1c2UuY29tPiA8NUNERDc2OTMwMjAwMDA3ODAw?=
 =?UTF-8?B?MjJGQzU5QHN1c2UuY29tPiA8N2JmYTRjOTTvv71jY2Yx77+9MGIzY++/vTZmOTI=?=
 =?UTF-8?Q?=ef=bf=bdd4f87b591961=40suse=2ecom=3e_=3c5CDE5B4E020000780022FEFC?=
 =?UTF-8?Q?=40suse=2ecom=3e_=3c8bd2ca73-c9a7-beab-e067-956dfa9d0948=40suse?=
 =?UTF-8?Q?=2ecom=3e_=3c5CDE6F29020000780022FF9B=40suse=2ecom=3e?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bc563f26-082e-bf9b-a9fd-c7403696e8d7@suse.com>
Date: Fri, 17 May 2019 10:57:43 +0200
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

T24gMTcvMDUvMjAxOSAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTcuMDUuMTkg
YXQgMDk6NDgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAxNy8wNS8yMDE5IDA4OjU3
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE3LjA1LjE5IGF0IDA3OjEzLCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAxNi8wNS8yMDE5IDE2OjQxLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+Pj4+Pj4gT24gMTYuMDUuMTkgYXQgMTU6NTEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdy
b3RlOgo+Pj4+Pj4gQXMgd2l0aCBjb3JlIHNjaGVkdWxpbmcgd2UgY2FuIGJlIHN1cmUgdGhlIG90
aGVyIHRocmVhZCBpcyBhY3RpdmUKPj4+Pj4+IChvdGhlcndpc2Ugd2Ugd291bGQgc2NoZWR1bGUg
dGhlIGlkbGUgaXRlbSkgYW5kIGhvcGluZyBmb3Igc2F2aW5nIHBvd2VyCj4+Pj4+PiBieSB1c2lu
ZyBtd2FpdCBpcyBtb290Lgo+Pj4+Pgo+Pj4+PiBTYXZpbmcgcG93ZXIgbWF5IGJlIGluZGlyZWN0
LCBieSB0aGUgQ1BVIHJlLWFycmFuZ2luZwo+Pj4+PiByZXNvdXJjZSBhc3NpZ25tZW50IGJldHdl
ZW4gdGhyZWFkcyB3aGVuIG9uZSBnb2VzIGlkbGUuCj4+Pj4+IEkgaGF2ZSBubyBpZGVhIHdoZXRo
ZXIgdGhleSBkbyB0aGlzIHdoZW4gZW50ZXJpbmcgQzEsIG9yCj4+Pj4+IG9ubHkgd2hlbiBlbnRl
cmluZyBkZWVwZXIgQyBzdGF0ZXMuCj4+Pj4KPj4+PiBTRE0gVm9sLiAzIGNoYXB0ZXIgOC4xMC4x
ICJITFQgaW5zdHJ1Y3Rpb24iOgo+Pj4+Cj4+Pj4gIkhlcmUgc2hhcmVkIHJlc291cmNlcyB0aGF0
IHdlcmUgYmVpbmcgdXNlZCBieSB0aGUgaGFsdGVkIGxvZ2ljYWwKPj4+PiBwcm9jZXNzb3IgYmVj
b21lIGF2YWlsYWJsZSB0byBhY3RpdmUgbG9naWNhbCBwcm9jZXNzb3JzLCBhbGxvd2luZyB0aGVt
Cj4+Pj4gdG8gZXhlY3V0ZSBhdCBncmVhdGVyIGVmZmljaWVuY3kuIgo+Pj4KPj4+IFRvIGJlIGhv
bmVzdCwgdGhpcyBpcyB0byBicm9hZC9nZW5lcmljIGEgc3RhdGVtZW50IHRvIGZ1bGx5Cj4+PiB0
cnVzdCBpdCwganVkZ2luZyBmcm9tIG90aGVyIGFyZWFzIG9mIHRoZSBTRE0uIEFuZCB0aGVuLCBh
cwo+Pj4gcGVyIGFib3ZlLCB3aGF0IGFib3V0IHRoZSBzb2NrZXQgZ3JhbnVsYXJpdHkgY2FzZT8g
UHV0dGluZwo+Pj4gZW50aXJlbHkgaWRsZSBjb3JlcyB0byBzbGVlcCBpcyBzdXJlbHkgd29ydGh3
aGlsZT8KPj4KPj4gWWVzLCBJIGFzc3VtZSBpdCBpcy4gT1RPSCB0aGlzIG1pZ2h0IGFmZmVjdCBj
b250ZXh0IHN3aXRjaGVzIGJhZGx5Cj4+IGFzIHRoZSByZWFjdGlvbiB0aW1lIGZvciB0aGUgY29v
cmRpbmF0ZWQgc3dpdGNoIHdpbGwgcmlzZS4gTWF5YmUgYQo+PiBnb29kIHJlYXNvbiBmb3IgYW5v
dGhlciBzdWItb3B0aW9uPwo+IAo+IFdoaWxlIEkgYWdyZWUgdGhhdCBmaW5lIGdyYWluZWQgY29u
dHJvbCBpcyB1c2VmdWwsIEknbSBzZWVpbmcgYW4KPiBpbmNyZWFzaW5nIHJpc2sgb2YgdGhlcmUg
Z29pbmcgdG8gYmUgdG9vIG1hbnkgY29udHJvbHMgdG8gYWN0dWFsbHkKPiBiZSBjZXJ0YWluIGlu
IHRoZSBlbmQgdGhhdCBhbGwgcG9zc2libGUgY29tYmluYXRpb25zIHdvcmsKPiBjb3JyZWN0bHku
CgpPa2F5LCBJIHRoaW5rIEknbGwgbGVhdmUgaXQgYXMgaXMgZm9yIHRoZSBtb21lbnQgYW5kIGRv
IHNvbWUKcGVyZm9ybWFuY2UgdGVzdHMgbGF0ZXIuIERlcGVuZGluZyBvbiB0aGUgcmVzdWx0cyB3
ZSBjYW4gdGhlbgpkZWNpZGUgaG93IHRvIHByb2NlZWQuCgo+IAo+Pj4+PiBBbmQgYW55d2F5IC0g
SSdtIHN0aWxsIG5vbmUgdGhlIHdpc2VyIGFzIHRvIHRoZSB2LT5pc191cmdlbnQKPj4+Pj4gcmVs
YXRpb25zaGlwLgo+Pj4+Cj4+Pj4gV2l0aCB2LT5pc191cmdlbnQgc2V0IHRvZGF5J3MgaWRsZSBs
b29wIHdpbGwgZHJvcCBpbnRvIGRlZmF1bHRfaWRsZSgpLgo+Pj4+IEkgY2FuIHJlbW92ZSB0aGlz
IHNlbnRlbmNlIGluIGNhc2UgaXQgaXMganVzdCBjb25mdXNpbmcuCj4+Pgo+Pj4gSSdkIHByZWZl
ciBpZiB0aGUgY29ubmVjdGlvbiB3b3VsZCBiZWNvbWUgbW9yZSBvYnZpb3VzLiBPbmUKPj4+IG5l
ZWRzIHRvIGdvIGZyb20gLT5pc191cmdlbnQgdmlhIC0+dXJnZW50X2NvdW50IHRvCj4+PiBzY2hl
ZF9oYXNfdXJnZW50X3ZjcHUoKSB0byBmaW5kIHdoZXJlIHRoZSBkZXNjcmliZWQKPj4+IGJlaGF2
aW9yIHJlYWxseSBsaXZlcy4KPj4+Cj4+PiBXaGF0J3Mgd29yc2UgdGhvdWdoOiBUaGlzIHdvbid0
IHdvcmsgYXMgaW50ZW5kZWQgb24gQU1ECj4+PiBhdCBhbGwuIEkgZG9uJ3QgdGhpbmsgaXQncyBj
b3JyZWN0IHRvIGZhbGwgYmFjayB0byBkZWZhdWx0X2lkbGUoKSBpbgo+Pj4gdGhpcyBjYXNlLiBJ
bnN0ZWFkIHNjaGVkX2hhc191cmdlbnRfdmNwdSgpIHJldHVybmluZyB0cnVlCj4+PiBzaG91bGQg
YW1vdW50IHRvIHRoZSBzYW1lIGVmZmVjdCBhcyBtYXhfY3N0YXRlIGJlaW5nIHNldAo+Pj4gdG8g
MS4gVGhlcmUncwo+Pj4gKGEpIG5vIHJlYXNvbiBub3QgdG8gdXNlIE1XQUlUIG9uIEludGVsIENQ
VXMgaW4gdGhpcyBjYXNlLAo+Pj4gaWYgTVdBSVQgY2FuIGVudGVyIEMxLCBhbmQKPj4+IChiKSBh
IHN0cm9uZyBuZWVkIHRvIHVzZSBNV0FJVCBvbiAoYXQgbGVhc3QpIEFNRCBGYW0xNywKPj4+IG9y
IGVsc2UgaXQgd29uJ3QgYmUgQzEgdGhhdCBnZXRzIGVudGVyZWQuCj4+PiBJJ2xsIHNlZSBhYm91
dCBtYWtpbmcgYSBwYXRjaCBpbiBkdWUgY291cnNlLgo+Pgo+PiBUaGFua3MuIFdvdWxkIHlvdSBt
aW5kIGRvaW5nIGl0IGluIGEgd2F5IHRoYXQgdGhlIGNhbGxlciBjYW4gc3BlY2lmeQo+PiBtYXhf
Y3N0YXRlPyBUaGlzIHdvdWxkIHJlbW92ZSB0aGUgbmVlZCB0byBjYWxsIHNjaGVkX2hhc191cmdl
bnRfdmNwdSgpCj4+IGRlZXAgZG93biB0aGUgaWRsZSBoYW5kbGluZyBhbmQgSSBjb3VsZCByZS11
c2UgaXQgZm9yIG15IHB1cnBvc2UuCj4gCj4gSG1tLCB0byBiZSBob25lc3QgSSdtIG5vdCBmYW5j
eWluZyBnaXZpbmcgYSBwYXJhbWV0ZXIgdG8KPiBkZWZhdWx0X2lkbGUoKSwgcG1faWRsZSgpLCBh
bmQgZnJpZW5kcy4gQ29uY2VwdHVhbGx5IGl0IGlzIG5vdAo+IHRoZSBidXNpbmVzcyBvZiB0aGUg
Y2FsbGVycyB0byBjb250cm9sIHRoZSBDIHN0YXRlcyB0byBiZSB1c2VkLgo+IAo+IFdoYXQgYWJv
dXQgdGhlIG9wcG9zaXRlOiBZb3Ugc2ltcGx5IG1hcmsgaWRsZSAodilDUFVzIGluCj4gcXVlc3Rp
b24gYXMgInVyZ2VudCIsIHRodXMgYWNoaWV2aW5nIHRoZSBpbnRlbmRlZCBlZmZlY3QgYXMKPiB3
ZWxsLgoKSSBjYW4gZG8gdGhhdCwgb2YgY291cnNlLiBJTU8gbGV0dGluZyB0aGUgY2FsbGVyIHNw
ZWNpZnkgaG93IGhlIHdhbnRzCmlkbGUgdG8gYmVoYXZlIGlzIGNsZWFuZXIgdGhhbiBidXJ5aW5n
IHN1Y2ggYW4gaW1wbGljaXQgZGVwZW5kZW5jeSBkZWVwCmRvd24gdGhlIGNvZGUsIGJ1dCB5b3Ug
YXJlIHRoZSBtYWludGFpbmVyIG9mIHRoYXQgcGFydC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
