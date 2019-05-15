Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB851EC26
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 12:34:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQrCf-0006wR-5v; Wed, 15 May 2019 10:32:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E9wX=TP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQrCd-0006wM-EQ
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:32:03 +0000
X-Inumbo-ID: ace34f62-76fc-11e9-aadb-636c2dedfba7
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ace34f62-76fc-11e9-aadb-636c2dedfba7;
 Wed, 15 May 2019 10:32:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C10580D;
 Wed, 15 May 2019 03:32:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 538F03F703;
 Wed, 15 May 2019 03:31:58 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
 <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
 <8f1d8d76-b2a6-7443-a38b-201058b6e84d@arm.com>
 <c58b5000-623d-766e-eba8-a4df1fbe1a44@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a59d8d2e-0858-dc9c-466e-860657727698@arm.com>
Date: Wed, 15 May 2019 11:31:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c58b5000-623d-766e-eba8-a4df1fbe1a44@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMTUvMDUvMjAxOSAxMDowNCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiAKPiBPbiAxNC4wNS4xOSAxNjo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBZb3UgaGF2ZSB0
byBrZWVwIGluIG1pbmQgdGhhdCBleGlzdGluZyBPUyBoYXZlIHRvIHJ1biBvbiBuZXdlciBYZW4g
d2l0aG91dCBhbnkgCj4+IG1vZGlmaWNhdGlvbi4KPiAKPiBBcyBJIGp1c3Qgd3JpdHRlbiB0byBK
YW4sIGl0IGlzIG9uZSBtb3JlIHJlYXNvbiB0byBrZWVwIHRob3NlIGludGVyZmFjZXMgbGl2aW5n
IAo+IGluIHBhcmFsbGVsIGFuZCBkbyBub3QgbWl4IHRoZWlyIGltcGxlbWVudGF0aW9uLgpUaGVy
ZSBhcmUgYWN0dWFsbHkgbm8gZ29vZCByZWFzb24gZm9yIGEgZ3Vlc3QgdG8gcmVnaXN0ZXIgdmlh
IHRoZSB0d28gaW50ZXJmYWNlcyAKYXQgdGhlIHNhbWUgdGltZS4gVGhlIG1vcmUgd2Ugd2FudCB0
byBlbmNvdXJhZ2UgdGhlIE9TIGRldmVsb3BlciB0byBzd2l0Y2ggdG8gCnRoZSBuZXcgaW50ZXJm
YWNlLgoKSSBhbHNvIHByb3ZpZGVkIGluIG15IHByZXZpb3VzIGUtbWFpbHMgd2F5IHRvIG1ha2Ug
dGhlIHR3byB3b3JraW5nIHRvZ2V0aGVyIAp3aXRob3V0IG11Y2ggdHJvdWJsZS4KCj4gCj4+IFRo
ZSBleGlzdGluZyBoeXBlcmNhbGwgYWxsb3dzIHlvdSB0bzoKPj4gwqDCoMKgIDEpIERlLXJlZ2lz
dGVyIGFuIGludGVyZmFjZSB1c2luZyB0aGUgdmFsdWUgMC4KPiAKPiBNeSBjdXJyZW50IGltcGxl
bWVudGF0aW9uIGNhbiBlYXNpbHkgYmUgdXBkYXRlZCB3aXRoIHRoZSBzYW1lIGJlaGF2aW9yLgo+
IAo+PiDCoMKgwqAgMikgUmVwbGFjaW5nIGEgY3VycmVudCBleGlzdGluZyBpbnRlcmZhY2UKPiAK
Pj4gWW91IHByb2JhYmx5IGNhbid0IHVzZSAyKSBmb3IgYSBib290bG9hZGVyIC0+IGtlcm5lbCBo
YW5kb3ZlciBiZWNhdXNlIHdlIGFyZSAKPj4gZGVhbGluZyB3aXRoIGd1ZXN0IHZpcnR1YWwgYWRk
cmVzcy4gVGhlcmUgaXMgYW4gaGlnaCBjaGFuY2UgdGhlIHZpcnR1YWwgCj4+IGFkZHJlc3Mgc3Bh
Y2UgbGF5b3V0IGlzIGdvaW5nIHRvIGJlIGRpZmZlcmVudCBvciBldmVuIHR1cm5pbmcgb2ZmIE1N
VSBmb3IgYSAKPj4gYml0IChkb25lIG9uIEFybSkuIFNvIHlvdSBoYXZlIHRvIHVzZSAxKSBvdGhl
cndpc2UgeW91IG1pZ2h0IHdyaXRlIGluIGEgcmFuZG9tIAo+PiBwbGFjZSBpbiBtZW1vcnkuCj4g
Cj4gVGhpcyBkZWZpbml0ZWx5IG5vdCB0aGUgd2F5IHRvIGhhbmRsZSB0cmFuc2l0aW9ucyBiZXR3
ZWVuIHN5c3RlbXMgaW4gYSBndWVzdCAKPiBkb21haW4uCj4gCj4+IEkgYW0gbm90IGVudGlyZWx5
IHN1cmUgd2hldGhlciB0aGVyZSBhcmUgYWN0dWFsIHZhbHVlIGZvciAyKS4gVGhlIG9ubHkgcmVh
c29uIAo+PiBJIGNhbiB0aGluayBvZiBpcyBpZiB5b3Ugd2FudCB0byBtb3ZlIGFyb3VuZCB0aGUg
cnVuc3RhdGUgaW4geW91ciB2aXJ0dWFsIAo+PiBhZGRyZXNzIHNwYWNlLiBCdXQgdGhhdCdzIHNv
dW5kcyBhIGJpdCB3ZWlyZCBhdCBsZWFzdCBvbiBBcm0uCj4+IEZvciB0aGUgbmV3IGh5cGVyY2Fs
bCwgSSB0aGluayB3ZSBhdCBsZWFzdCB3YW50IDEpICh3aXRoIGEgbWFnaWMgdmFsdWUgVEJEKS4g
Cj4gCj4gVGhlIG1hZ2ljIHZhbHVlIDB4MCBjYW4gZWFzaWx5IGJlIGludHJvZHVjZWQuCgoweDAg
aXMgbm90IGFuIG9wdGlvbi4gSXQgY291bGQgYmUgYSB2YWxpZCBwaHlzaWNhbCBhZGRyZXNzLiBX
ZSBuZWVkIGEgdmFsdWUgdGhhdCAKY2Fubm90IGJlIHVzZWQgYnkgYW55b25lLgoKPiAKPj4gwqAy
KSBtaWdodCBiZSBoZWxwZnVsIGluIHRoZSBjYXNlIHRoZSBib290bG9hZGVyIGRpZG4ndCBkbyB0
aGUgcmlnaHQgdGhpbmcgb3IgCj4+IHdlIGFyZSB1c2luZyBLZXhlYyB0byBib290IGEgbmV3IGtl
cm5lbC4gVGhpcyB3b3VsZCBhbHNvIGJlIHNhZmVyIGFzIHBoeXNpY2FsIAo+PiBhZGRyZXNzIGNv
dWxkIGJlIGV4Y2x1ZGVkIG1vcmUgZWFzaWx5Lgo+IAo+IEJ1dCB0aGUgbmV3IHN5c3RlbSBoYXZl
IHRvIGdldCBzb21lIGtub3dsZWRnZSBhYm91dCB0aGUgcHJldmlvdXMgcGh5cyBhZGRyIGlzIAo+
IHJlc2VydmVkICh1c2VkIGJ5IGh5cGVydmlzb3IpLCBhbmQgZG8gbm90IHVzZSBpdCBwcmlvciB0
byByZWdpc3RlcmluZyBuZXcgCj4gcnVuc3RhdGUgYXJlYS4KPiBQcm92aWRpbmcgc3VjaCBhIGtu
b3dsZWRnZSBpcyBzb21ldGhpbmcgKGUuZy4pIHRoZSBib290bG9hZGVyIHNob3VsZCB0YWtlIGNh
cmUgCj4gb2YuIEJ1dCwgSU1PLCBpdCBpcyBiZXR0ZXIgdG8gcmVxdWlyZSBmcm9tIChlLmcuKSB0
aGUgYm9vdGxvYWRlciB0byB1bnJlZ2lzdGVyIAo+IGl0cyBydW5zdGF0ZSBhcmVhIHByaW9yIHRv
IHN3aXRjaGluZyB0byB0aGUgbmV3IHN5c3RlbS4KCldlbGwsIGlmIGEgYm9vdGxvYWRlciBrZWVw
IHNvbWUgcGFydCBpbiBtZW1vcnkgKHN1Y2ggYXMgZm9yIGhhbmRsaW5nIHJ1bnRpbWUgCnNlcnZp
Y2VzKSwgaXQgd2lsbCB1c3VhbGx5IG1hcmsgdGhvc2UgcGFnZXMgYXJlIHJlc2VydmVkLiBTbyBp
dCBjYW4ndCBiZSB1c2VkIGJ5IAp0aGUga2VybmVsLgoKQnV0IGhlcmUsIHRoZSBwb2ludCBpcyBp
dCB3b3VsZCBub3QgYmUgZGlmZmljdWx0IHRvIGhhbmRsZSAyKS4gU28gd2h5IHdvdWxkIHlvdSAK
dHJ5IHRvIGZvcmJpZCBpdD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
