Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F030D78BE6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:40:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4sV-0001Fa-Ev; Mon, 29 Jul 2019 12:35:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l3zY=V2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hs4sT-0001FV-Lo
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:35:45 +0000
X-Inumbo-ID: 621c843f-b1fd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 621c843f-b1fd-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 12:35:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E41F528;
 Mon, 29 Jul 2019 05:35:43 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BBB43F575;
 Mon, 29 Jul 2019 05:35:42 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
 <CAOcoXZYw0uC+2c5KAVMhvXRukYomAuhSVW=jWU3HH1sX6zgkaQ@mail.gmail.com>
 <685e081c-b374-7d66-4645-d6ee7a02f655@arm.com>
 <CAOcoXZZ5HWYrDEy966BN-Esaci2XD=H98kn1JNwjAU_DUW_Egg@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d5e1b66e-4d94-6ec5-96e4-54fb77c44eaa@arm.com>
Date: Mon, 29 Jul 2019 13:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZZ5HWYrDEy966BN-Esaci2XD=H98kn1JNwjAU_DUW_Egg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Lars Kurth <lars.kurth.xen@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gNy8yOS8xOSAxOjIxIFBNLCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4gT24g
TW9uLCBKdWwgMjksIDIwMTkgYXQgMTo0OSBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPiB3cm90ZToKPj4gT24gNy8yOS8xOSAxMDoxMyBBTSwgVmlrdG9yIE1pdGluIHdyb3Rl
Ogo+Pj4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMzo1MCBQTSBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4KPj4+IEl0IGlzIHVua25vd24gaG93IGRpZmZpY3Vs
dCBpdCB3b3VsZCBiZSB0byBpbXBsZW1lbnQgdGhhdCB3aXRoCj4+PiBjbGFuZy1mb3JtYXQsIGhv
d2V2ZXIsIGl0IGNhbiBiZSBhbmFseXplZC4KPj4KPj4gLi4uICBidXQgdGhlIGdvYWwgb2YgdGhp
cyBkaXNjdXNzaW9uIGlzIHRvIHVuZGVyc3RhbmQgdGhlIGxpbWl0YXRpb25zIG9mCj4+IENsYW5n
LWZvcm1hdCBhbmQgd2hldGhlciBhIENvZGluZyBTdHlsZSBjaGFuZ2UgbWF5IGJlIGVhc2llci4K
PiAKPiBJdCBpcyBub3Qgc28gZWFzeSB0byBkbywgc28gaXQgbWF5IHRha2UgYSB0aW1lIHRvIGlu
dmVzdGlnYXRlIGV2ZXJ5IHRoZSBjYXNlLgoKVGhlcmUgbXVzdCBiZSBhIGRvY3VtZW50YXRpb24g
Zm9yIGNsYW5nLWZvcm1hdCB0byBleHBsYWluIHRoZSBkZWZhdWx0IApjb2Rpbmcgc3R5bGUgYW5k
IHdheSB0byB0d2VhayBpdCwgcmlnaHQ/IENvdWxkIHdlIGdldCBhIHBvaW50ZXIgdG8gaXQ/Cgo+
Pj4+Cj4+Pj4gKioqKioKPj4+Pgo+Pj4+IC0gICAgLyogU2VlIGxpbnV4Cj4+Pj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybSxnaWMudHh0
ICovCj4+Pj4gKyAgICAvKiBTZWUgbGludXgKPj4+PiArICAgICAqIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0sZ2ljLnR4dCAqLwo+Pj4+
Cj4+Pj4gTXVsdGktbGluZXMgY29tbWVudCBvbiBYZW4gYXJlIHVzaW5nCj4+Pj4gLyoKPj4+PiAg
ICAgKiBGb28KPj4+PiAgICAgKiBCYXIKPj4+PiAgICAgKi8KPj4+Cj4+PiBTZWUgbXkgY29tbWVu
dCBhYm91dCBjbGFuZy1mb3JtYXQgc3VwcG9ydHMgb25seSBjb21tZW50cyBpbmRlbnRhdGlvbiBm
b3Igbm93Lgo+Pgo+PiBJIHNhdyBpdCBhbmQgSSB3aWxsIHJlcGx5IGhlcmUgZm9yIHNpbXBsaWNp
dHkuIEhhdmluZyBhIGF1dG9tYXRpYwo+PiBjaGVja2VyIHRoYXQgd2lsbCBkbyB0aGUgd3Jvbmcg
dGhpbmdzIGlzIG5vdCBpZGVhbC4KPj4KPj4gSW1hZ2luZSB3ZSBkZWNpZGUgdG8gdXNlIHRoaXMg
Y2hlY2tlciBhcyBhIHBhcnQgb2YgdGhlIGNvbW1pdCBwcm9jZXNzLgo+PiBUaGlzIG1lYW5zIHRo
YXQgdGhlIGNvZGUgd2lsbCBiZSBtb2RpZmllZCB0byBjaGVja2VyIGNvZGluZyBzdHlsZSBhbmQK
Pj4gbm90IFhlbiBvbmUuCj4gCj4gV2VsbCwgeW91IGFyZSByaWdodC4gRXZlbiBtb3JlLCB1bmZv
cnR1bmF0ZWx5LCB0aGVyZSBpcyBubyBzdWNoIGNvZGluZwo+IHN0eWxlIGFzICdic2QnIGluIGNs
YW5nLWZvcm1hdC4KPiBTbyAneGVuJyBjbGFuZy1mb3JtYXQgc3R5bGUgaXMgYmFzZWQgb24gdGhl
ICdsbHZtJyBzdHlsZS4KCkRvIHlvdSBoYXZlIGEgcG9pbnRlciB0byB0aGUgTExWTSBzdHlsZT8K
CkFzIEkgcG9pbnRlZCBvdXQgaW4gYSBkaWZmZXJlbnQgdGhyZWFkLCBpdCB3b3VkbCBiZSBlYXNp
ZXIgdG8gc3RhcnQgZnJvbSAKYW4gZXhpc3RpbmcgY29kaW5nIHN0eWxlIChMTFZNLCBCU0QuLi4p
IGFuZCBkZWNpZGUgd2hldGhlciB5b3Ugd2FudCB0byAKZnVsbHkgYWRvcHQgaXQgb3IgbWFrZSBj
aGFuZ2VzLgoKU28gc29tZW9uZSBuZWVkcyB0byBiZSBwaWNrIG9uZSBhbmQgbG9vayBhdCB0aGUg
ZGlmZmVyZW5jZSBpbiBzdHlsZSB3aXRoIApYZW4uIEl0IHNlZW1zIHlvdSBhbHJlYWR5IGRvbmUg
dGhhdCBqb2IgYXMgeW91IHR3ZWFrIGl0IGZvciBYZW4uIERvIHlvdSAKaGF2ZSBhIHdyaXRlLXVw
IG9mIHRoZSBkaWZmZXJlbmNlcz8KCj4+Pj4gSSBhbSBub3Qgc3VyZSB3aHkgY2xhbmctZm9ybWF0
IGRlY2lkZWQgdG8gZm9ybWF0IGxpa2UgdGhhdC4gRG8geW91IGtub3cgd2h5Pwo+Pj4KPj4+IFRo
ZSByZWFzb24gaXMgdGhhdCB0aGVyZSBhcmUgdHdvIHN0cmluZ3MgaW4gb25lIGxpbmUuIEl0IHdv
dWxkIG5vdAo+Pj4gY2hhbmdlIGl0IGlmIGl0IHdlcmUKPj4+IG5vdCAiYXJtLHBzY2ktMS4wIiJc
MCIsIGJ1dCAiYXJtLHBzY2ktMS4wXDAiLgo+Pgo+PiBJIHdvdWxkIGxpa2UgdG8gc2VlIHRoZSBl
eGFjdCBwYXJ0IG9mIHRoZSBjbGFuZy1mb3JtYXQgY29kaW5nIHN0eWxlCj4+IGRvY3VtZW50YXRp
b24gdGhhdCBtZW50aW9uIHRoaXMgcmVxdWlyZW1lbnRzLi4uIFRoZSBtb3JlIHRoYXQgaW4gYW4K
Pj4gZXhhbXBsZSBhYm92ZSAoY29waWVkIGJlbG93IGZvciBzaW1wbGljaXR5KSwgdGhlcmUgYXJl
IHR3byBzdHJpbmdzIGluIG9uCj4+IGxpbmUuCj4gCj4gVGhlIGNsb3Nlc3QgZm91bmQgc2VlbXMg
QmluUGFja1BhcmFtZXRlcnMgQmluUGFja0FyZ3VtZW50cywKPiBob3dldmVyLCBpdCBpcyBhYm91
dCBmdW5jdGlvbiBjYWxscyBhY2NvcmRpbmcgdG8gbWFudWFsLi4uCgpBYm92ZSwgeW91IG1lbnRp
b24gdGhlIHdvcmsgaXMgYmFzZWQgb24gdGhlIExMVk0gY29kaW5nIHN0eWxlLiBJcyB0aGVyZSAK
YW55dGhpbmcgaW4gdGhhdCBjb2Rpbmcgc3R5bGUgYWJvdXQgdGhlIHN0cmluZz8KCj4gCj4+Cj4+
ICAgPj4gKyAgICBEMTFQUklOVCgiQWxsb2NhdGVkICUjIiBQUklwYWRkciAiLSUjIiBQUklwYWRk
cgo+Pgo+Pgo+Pj4KPj4+Pgo+Pj4+ICoqKioqCj4+Pj4KPj4+PiAtICAgIGNsb2NrX3ZhbGlkID0g
ZHRfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAiY2xvY2stZnJlcXVlbmN5IiwKPj4+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNsb2NrX2ZyZXF1ZW5jeSk7Cj4+Pj4g
KyAgICBjbG9ja192YWxpZCA9Cj4+Pj4gKyAgICAgICAgZHRfcHJvcGVydHlfcmVhZF91MzIoZGV2
LCAiY2xvY2stZnJlcXVlbmN5IiwgJmNsb2NrX2ZyZXF1ZW5jeSk7Cj4+Pj4KPj4+PiBJIGFtIG5v
dCBzdXJlIHdoeSBjbGFuZy1mb3JtYXQgZGVjaWRlIHRvIGZvcm1hdCBsaWtlIHRoYXQuIFRoZSBj
dXJyZW50IHZlcnNpb24KPj4+PiBpcyBkZWZpbml0ZWx5IHZhbGlkLgo+Pj4KPj4+IFRoZSBjdXJy
ZW50IHZlcnNpb24gaXMgbm90IHZhbGlkIGFzIGl0IHRha2VzIDgxIGNoYXJzLCB3aGlsZSA3OSBp
cwo+Pj4gYWxsb3dlZCBhY2NvcmRpbmcgdG8gY29kaW5nIHN0eWxlLgo+Pgo+PiBSZWFsbHk/IEkg
bG9va2VkIGF0IHRoZSBjb2RlIGFuZCB0aGlzIGlzIDYyIGNoYXJhY3RlcnMuLi4gSXQgd291bGQg
YmUgODEKPj4gY2hhcmFjdGVycyBpZiAiJmNsb2NrX2ZyZXF1ZW5jeSk7IiB3ZXJlIG9uIHRoZSBz
YW1lIGxpbmUuIEJ1dCBzZWUgaG93IGl0Cj4+IGlzIHNwbGl0IGluIDIgbGluZXMuCj4gCj4gWW91
IGFyZSByaWdodCwgdGhlcmUgYXJlIHR3byBsaW5lcy4gU28gaXQgbmVlZHMgdG8gZmluZCBvdXQg
aG93IHRvCj4gY29uZmlndXJlIG9yIGltcGxlbWVudCBzdWNoIGEgZmVhdHVyZSB0byBpZ25vcmUg
c3VjaCBjYXNlcy4KCldoYXQncyB0aGUgTExWTSBjb2Rpbmcgc3R5bGUgcG9saWN5IGFib3V0IHRo
aXM/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
