Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377F2709BE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 21:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpdyz-0000zN-KJ; Mon, 22 Jul 2019 19:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V0js=VT=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hpdyz-0000z2-1Q
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 19:28:25 +0000
X-Inumbo-ID: deb8683e-acb6-11e9-9d83-b704bb96f5e1
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deb8683e-acb6-11e9-9d83-b704bb96f5e1;
 Mon, 22 Jul 2019 19:28:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7FA43DD47;
 Mon, 22 Jul 2019 19:28:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-23.ams2.redhat.com
 [10.36.117.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 208765B681;
 Mon, 22 Jul 2019 19:28:20 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-10-anthony.perard@citrix.com>
 <20190715142219.m2t67v2dcyabqp2p@MacBook-Air-de-Roger.local>
 <20190722134912.GF1208@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7bb00665-784b-e8d5-42cd-b34e22ada1eb@redhat.com>
Date: Mon, 22 Jul 2019 21:28:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190722134912.GF1208@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 22 Jul 2019 19:28:22 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 09/35] OvmfPkg/OvmfXen: use a TimerLib
 instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjIvMTkgMTU6NDksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDE1
LCAyMDE5IGF0IDA0OjIyOjE5UE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9u
IFRodSwgSnVsIDA0LCAyMDE5IGF0IDAzOjQyOjA3UE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdy
b3RlOgo+Pj4gQUNQSSBUaW1lciBkb2VzIG5vdCB3b3JrIGluIGEgUFZIIGd1ZXN0LCBidXQgbG9j
YWwgQVBJQyB3b3JrcyBvbiBib3RoCj4+Cj4+IFRoaXMgaXMgbm90IGFjY3VyYXRlLiBJdCdzIG5v
dCB0aGF0IHRoZSBBQ1BJIHRpbWVyIGRvZXNuJ3Qgd29yaywgaXQncwo+PiBqdXN0IHRoYXQgaXQn
cyBub3QgcHJlc2VudC4gVGhlIFBNX1RNUl9CTEsgc2hvdWxkIGJlIHNldCB0byAwIHRvCj4+IGlu
ZGljYXRlIHRoZSBsYWNrIG9mIFBNIHRpbWVyIHN1cHBvcnQsIG9yIGVsc2UgdGhlcmUncyBzb21l
dGhpbmcKPj4gYnJva2VuLgo+IAo+IEknbGwgcmV3b3JkIHRoYXQgZmlyc3Qgc2VudGVuY2UuCj4g
Cj4gT1ZNRiBkb2Vzbid0IGxvb2sgYXQgdGhlIFBNX1RNUl9CTEsgdmFsdWUgd2hlbiBpbml0aWFs
aXppbmcgdGhhdCB0aW1lciwKPiBpdCBvbmx5IGxvb2tzIGF0IHRoZSBQQ0kgaG9zdCBicmlkZ2Ug
ZGV2aWNlIElEIGJlY2F1c2UgT1ZNRiBpcyBidWlsdAo+IHdpdGggUUVNVSBpbiBtaW5kIGFuZCB0
aGVyZSBhcmUgb25seSB0d28gcG9zc2libGVzIGNob2ljZXMsIFFFTVUgaXMKPiBydW5uaW5nIHdp
dGggYSBwaWl4IG9yIHEzNSBtYWNoaW5lIHR5cGUsIEkgdGhpbmsuCgpXZSBzaG91bGQgc3BsaXQg
dGhpcyBzdGF0ZW1lbnQgaW4gdHdvLiA6KQoKT1ZNRiBkb2Vzbid0IGxvb2sgYXQgQUNQSSBwYXls
b2FkIGJlY2F1c2UgaXQgaXMgYSBkZXNpZ24gZ29hbCB0byBrZWVwCnRoZSBndWVzdCBmaXJtd2Fy
ZSB1bi1lbmxpZ2h0ZW5lZCBhYm91dCBzdWNoIEFDUEkgY29udGVudHMgdGhhdCBhcnJpdmUKZnJv
bSB0aGUgaHlwZXJ2aXNvci4gUGFyc2luZyBBQ1BJIGluIGZpcm13YXJlIGFsd2F5cyBsb29rcyBh
dHRyYWN0aXZlCnVudGlsIHNvbWVvbmUgYWN0dWFsbHkgd3JpdGVzIHRoZSBjb2RlLCBhbmQgdGhl
biBpdCBhbHdheXMgZW5kcyBpbgptaXNlcnkgLS0gYXQgdGhlIGxhdGVzdCB3aGVuIHBlb3BsZSBy
ZWFsaXplIHRoZXkgaGF2ZSB0byBwYXJzZSBBTUwuClBhcnNpbmcgQUNQSSBpcyBvbmx5IGZlYXNp
YmxlIHdoZW4geW91IGhhdmUgYSBmdWxsLWJsb3duIEFDUElDQSAob3IKc2ltaWxhcikgc3Vic3lz
dGVtLCBhbmQgZWRrMiBkb2Vzbid0LiBUaGVyZWZvcmUsIE9WTUYgbG9va3MgYXQgZWl0aGVyCmhh
cmR3YXJlLCBvciBzcGVjaWFsaXplZCBwYXJhdmlydCBpbmZvcm1hdGlvbiBjaGFubmVscyBzdWNo
IGFzIGZ3X2NmZwpmaWxlcywgdGhhdCBhcmUgZWFzeSB0byBwYXJzZSBieSBkZXNpZ24uCgpTZWNv
bmQsIHdpdGhpbiB0aGUgYWJvdmUgZGVzaWduIGd1aWRlbGluZXMgKGkuZS4gImRvbid0IHRyeSB0
byBwYXJzZQpBQ1BJIiwgYW5kICJjb29rIHlvdXIgcGFyYXZpcnQgaW5mbyBpZiB5b3Ugd2FudCB0
aGUgZmlybXdhcmUgdG8gZWF0Cml0IiksIE9WTUYgbG9va3MgYXQgc3VjaCBhcnRpZmFjdHMgdG8g
c3RlZXIgaXRzIGJlaGF2aW9yIGZvciB3aGljaApwYXRjaGVzIGhhdmUgYmVlbiBzdWJtaXR0ZWQg
JiBtZXJnZWQuIE9WTUYgaXMgaW50ZWdyYXRlZCB3aXRoIFhlbiB0byB0aGUKZXh0ZW50IG9mIHBh
dGNoZXMgbWVyZ2VkIGZyb20gdGhlIFhlbiBjb21tdW5pdHkuIFRodXMsIGluIG15IG9waW5pb24s
CiJPVk1GIGlzIGJ1aWx0IHdpdGggUUVNVSBpbiBtaW5kIiBpcyBhIHN0cmV0Y2ggLS0gcGVyaGFw
cyBpdCBpcyBzbyBpbgoqbXkqIG1pbmQgcGVyc29uYWxseSwgYnV0IHRoYXQncyBqdXN0IG1lLiBX
ZSBoYXZlIGRlc2lnbmF0ZWQgcmV2aWV3ZXJzCmZvciBYZW4tcmVsYXRlZCBjb2RlLCBhbmQgdGhp
cyBzZXJpZXMgY2VydGFpbmx5IGJ1aWxkcyBPVk1GIHdpdGggWGVuIGluCm1pbmQuIDopCgpJZiB3
ZSByZXdvcmRlZCB0aGUgc3RhdGVtZW50LCBlLmcuIGFzICJ0aGUgcHJlc2VudCBjb2RlIHRhcmdl
dHMgUUVNVSBhbmQKaXMgdW5zdWl0YWJsZSB3aGVuIHJ1bm5pbmcgb24gWGVuIiwgdGhlbiBJIHdv
dWxkIG5vdCBvYmplY3QuCgpUaGFua3MhCkxhc3psbwoKPj4+IFBWSCBhbmQgSFZNLgo+Pj4KPj4+
IE5vdGUgdGhhdCB0aGUgdXNlIG9mIFNlY1BlaUR4ZVRpbWVyTGliQ3B1IG1pZ2h0IGJlIGFuIGlz
c3VlIHdpdGggYQo+Pj4gZHJpdmVyIG9mIHR5cGUgRFhFX1JVTlRJTUVfRFJJVkVSLiBJJ3ZlIGF0
dGVtcHRkZSB0byBmaW5kIG91dCB3aGljaCBvZgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeIGF0dGVtcHRlZAo+Pj4gdGhlIERYRV9SVU5USU1FX0RSSVZFUiB1
c2VzIHRoZSBUaW1lckxpYiBhdCBydW50aW1lLiBJJ3ZlIGRvbmUgdGhhdCBieQo+Pj4gcmVwbGFj
aW5nIHRoZSBUaW1lckxpYiBldmFsdWF0aW9uIGluCj4+PiBbTGlicmFyeUNsYXNzZXMuY29tbW9u
LkRYRV9SVU5USU1FX0RSSVZFUl0gYnkgYSBkaWZmZXJlbnQgb25lIGFuZAo+Pj4gY2hlY2sgZXZl
cnkgbW9kdWxlIHRoYXQgdXNlcyBpdCAod2l0aCB0aGUgLS1yZXBvcnQtZmlsZT1yZXBvcnQgYnVp
bGQKPj4gICBeIGNoZWNraW5nCj4+PiBvcHRpb24pLgo+Pj4KPj4+IFJlc2V0U3lzdGVtUnVudGlt
ZUR4ZSBpcyBjYWxsaW5nIHRoZSBUaW1lckxpYiBBUEkgYXQgcnVudGltZSB0byBkbyB0aGUKPj4+
IG9wZXJhdGlvbiAiRWZpUmVzZXRDb2xkIiwgc28gdGhpcyBtYXkgbmV2ZXIgY29tcGxldGUgaWYg
dGhlIE9TIGhhdmUKPj4+IGRpc2FibGVkIHRoZSBMb2NhbCBBUElDIFRpbWVyLgo+Pgo+PiBUaGFu
a3MsIFJvZ2VyLgo+IAo+IFRoYW5rcywKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
