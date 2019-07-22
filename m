Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2670A0F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 21:48:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpeFz-0002Yi-S1; Mon, 22 Jul 2019 19:45:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V0js=VT=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hpeFy-0002Yb-7L
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 19:45:58 +0000
X-Inumbo-ID: 527fdbb1-acb9-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 527fdbb1-acb9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 19:45:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36B5DC036744;
 Mon, 22 Jul 2019 19:45:56 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-23.ams2.redhat.com
 [10.36.117.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E5775C220;
 Mon, 22 Jul 2019 19:45:53 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-25-anthony.perard@citrix.com>
 <20190715141521.aqmpchgzyleoergc@MacBook-Air-de-Roger.local>
 <20190722145319.GG1208@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8b9cb231-e9e5-8f92-f8d4-a6f05efaa888@redhat.com>
Date: Mon, 22 Jul 2019 21:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190722145319.GG1208@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 22 Jul 2019 19:45:56 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 24/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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

T24gMDcvMjIvMTkgMTY6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDE1
LCAyMDE5IGF0IDA0OjE1OjIxUE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9u
IFRodSwgSnVsIDA0LCAyMDE5IGF0IDAzOjQyOjIyUE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdy
b3RlOgo+Pj4gV2hlbiBydW5uaW5nIGFzIGEgWGVuIFBWSCBndWVzdCwgdGhlcmUgaXMgbm8gQ01P
UyB0byByZWFkIHRoZSBtZW1vcnkKPj4+IHNpemUgZnJvbS4gIFJld29yayBHZXRTeXN0ZW1NZW1v
cnlTaXplKEJlbG93fEFib3ZlKTRnYigpIHNvIHRoZXkgY2FuCj4+PiB3b3JrcyB3aXRob3V0IENN
T1MgYnkgcmVhZGluZyB0aGUgZTgyMCB0YWJsZS4KPj4+Cj4+PiBSZXdvcmsgWGVuUHVibGlzaFJh
bVJlZ2lvbnMgZm9yIFBWSCwgaGFuZGxlIHRoZSBSZXNlcnZlIHR5cGUgYW5kIGV4cGxhaW4KPj4+
IGFib3V0IHRoZSBBQ1BJIHR5cGUuIE1UUlIgc2V0dGluZ3MgYXJlbid0IG1vZGlmaWVkIGFueW1v
cmUsIG9uIEhWTSwgaXQncwo+Pj4gYWxyZWFkeSBkb25lIGJ5IGh2bWxvYWRlciwgb24gUFZIIGl0
IGlzIHN1cHBvc2VkIHRvIGhhdmUgc2FuZSBkZWZhdWx0Lgo+Pj4KPj4+IFJlZjogaHR0cHM6Ly9i
dWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+IEFja2Vk
LWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gTm90
ZXM6Cj4+PiAgICAgQ29tbWVudCBmb3IgWGVuIHBlb3BsZToKPj4+ICAgICBBYm91dCBNVFJSLCBz
aG91bGQgd2UgcmVkbyB0aGUgc2V0dGluZyBpbiBPVk1GPyBFdmVuIGlmIGluIGJvdGggY2FzZSBv
Zgo+Pj4gICAgIFBWSCBhbmQgSFZNLCBzb21ldGhpbmcgd291bGQgaGF2ZSBzZXR1cCB0aGUgZGVm
YXVsdCB0eXBlIHRvIHdyaXRlIGJhY2sKPj4+ICAgICBhbmQgaGFuZGxlIGEgZmV3IG90aGVyIHJh
bmdlcyBsaWtlIFBDSSBob2xlLCBodm1sb2FkZXIgZm9yIEhWTSBvciBhbmQKPj4+ICAgICBsaWJ4
YyBJIHRoaW5rIGZvciBQVkguCj4+Cj4+IFRoYXQncyBhIHRyaWNreSBxdWVzdGlvbi4gSWRlYWxs
eSB3ZSB3b3VsZCBsaWtlIHRoZSBmaXJtd2FyZSAoT1ZNRikgdG8KPj4gdGFrZSBjYXJlIG9mIHRo
YXQsIGJlY2F1c2UgaXQgYWxyZWFkeSBoYXMgY29kZSB0byBkbyBzby4gUHJvYmxlbSBoZXJlCj4+
IGlzIHRoYXQgUFZIIGNhbiBhbHNvIGJlIGJvb3RlZCB3aXRob3V0IGZpcm13YXJlLCBpbiB3aGlj
aCBjYXNlIGl0Cj4+IG5lZWRzIHRoZSBoeXBlcnZpc29yIHRvIGhhdmUgc2V0dXAgc29tZSBzYW5l
IGluaXRpYWwgTVRSUiBzdGF0ZS4KPj4KPj4gVGhlIHN0YXRlbWVudCBpbiB0aGUgUFZIIGRvY3Vt
ZW50IGFib3V0IGluaXRpYWwgTVRSUiBzdGF0ZSBpcyB2YWd1ZQo+PiBlbm91Z2ggdGhhdCBhbGxv
d3MgWGVuIHRvIGJvb3QgaW50byB0aGUgZ3Vlc3Qgd2l0aCBhIG1pbmltYWwgTVRSUgo+PiBzdGF0
ZSwgdGhhdCBjYW4gZm9yIGV4YW1wbGUgbm90IGNvbnRhaW4gVUMgcmVnaW9ucyBmb3IgdGhlIE1N
SU8KPj4gcmVnaW9ucyBvZiBwYXNzZWQgdGhyb3VnaCBkZXZpY2VzLCBoZW5jZSBJIHRoaW5rIE9W
TUYgc2hvdWxkIGJlIGluCj4+IGNoYXJnZSBvZiBjcmVhdGluZyBhIG1vcmUgY29tcGxldGUgTVRS
UiBzdGF0ZSBpZiBwb3NzaWJsZS4KPj4KPj4gSXMgdGhpcyBzb21ldGhpbmcgT1ZNRiBhbHJlYWR5
IGhhcyBsb2dpYyBmb3I/Cj4gCj4gV2VsbCwgdGhlcmUgYXJlIHNvbWUgbG9naWMgYnV0IGl0J3Mg
Zm9yIFFFTVUgKGFuZCB1c2VzIGFuIGludGVyZmFjZSB0aGF0Cj4gaXNuJ3QgYXZhaWxhYmxlIHdo
ZW4gcnVubmluZyBvbiBYZW4sIGZ3Y2ZnKS4KPiAKPiBUaGUgbG9naWMgdGhhdCB3YXMgdGhlcmUg
Zm9yIFhlbiBIVk0gd2FzIHZlcnkgc2ltcGxlLCBhIHNpbmdsZSBzZXQKPiBjYWNoZS13cml0ZS1i
YWNrIGZvciB0aGUgUkFNLCB0aGF0J3Mgd2h5IEkgcmVtb3ZlIGl0IChhbmQgYmVjYXVzZSBJJ20K
PiBub3Qgc3VyZSB5ZXQgSSBmaWd1cmVkIG91dCBob3cgdG8gcnVuIHRoZSBtdHJyIGZ1bmN0aW9u
cyBjb3JyZWN0bHkgaW4KPiBPVk1GKS4KPiAKPiBJIHByb2JhYmx5IGdvaW5nIHRvIGhhdmUgdG8g
d3JpdGUgYSBuZXcgbG9naWMgd2hpY2ggd291bGQgcmV3cml0ZSB0aGUKPiBNVFJSIGZyb20gc2Ny
YXRjaCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gdGhlIGV4aXN0aW5nIHNldHVwLgoKTVRSUiBzZXR1
cCBpcyBjb21wbGV4IGluIE9WTUYsIGluIGNvbXBhcmlzb24gdG8gZmlybXdhcmUgdGhhdCBydW5z
IG9uCnBoeXNpY2FsIG1hY2hpbmVzLCBiZWNhdXNlOgoKLSB0aGUgcGh5c2ljYWwgUkFNIHNpemUg
Y2FuIGNoYW5nZSBmcm9tIGJvb3QgdG8gYm9vdCwgd2l0aCBhbG1vc3QgdG90YWwKZnJlZWRvbSwg
YW5kIHRoYXQgY2FuIGluY3VyIHNvbWUgdW5leHBlY3RlZCBjaGFuZ2VzIGluIHRoZSBwaHlzaWNh
bCBSQU0KbWFwIHRvbyAoaS5lLiBhZmZlY3Qgbm90IGp1c3QgdGhlIGVuZCwgYnV0IGhvbGVzKQoK
LSB0aGUgbnVtYmVyIG9mIHZhcmlhYmxlIE1UUlJzIGlzIHNldmVyZWx5IGxpbWl0ZWQgYW5kIGNh
bid0IGNvdmVyIGFuCmFyYml0cmFyeSBwaHlzaWNhbCBSQU0gbWFwLiBBbmQsIHNvbWUgcGxhdGZv
cm0taW5kZXBlbmRlbnQgbW9kdWxlcyBpbgplZGsyIGNvbnN1bWUgdmFyaWFibGUgTVRSUnMgdG9v
LCB2aWEgZ0RTLT5TZXRNZW1vcnlTcGFjZUF0dHJpYnV0ZXMoKSwgc28Kd2UgaGF2ZSB0byBiZSB2
ZXJ5IGNvbnNlcnZhdGl2ZSB3aXRoIGV2ZW4gdGhvc2UgdmFyaWFibGUgTVRSUnMgdGhhdCBleGlz
dC4KCkV2ZW4gb24gUUVNVSBpNDQwZnggJiBwYywgd2UndmUgKmp1c3QqIG1hZGUgT1ZNRiBjb3Bl
IHdpdGggYW4gYXJiaXRyYXJ5Cmd1ZXN0IFJBTSBzaXplICh0aGF0IGlzLCBiZXlvbmQgMTI4TUIp
LCBhbmQgdGhhdCBsb2dpYyByZWxpZXMgb24gc29tZQpvcGVuLWNvZGVkIGJvYXJkLXNwZWNpZmlj
IGtub3dsZWRnZSBhYm91dCBsb3cgKDw0RykgUkFNIHNpemUuIFNvIG11Y2ggc28KdGhhdCwgb24g
aTQ0MGZ4LCB3ZSBwbGFjZSB0aGUgMzItYml0IFBDSSBJT01NVSBhcGVydHVyZSBiYXNlZCBvbiB3
aGF0IHdlCmNhbiBjb25maWd1cmUgd2l0aCBhIG1pbmltYWwgYW1vdW50IG9mIHZhcmlhYmxlIE1U
UlJzLCBhbmQgbm90IHZpY2UKdmVyc2EgKGkuZS4gd2UgZG9uJ3QgZmlyc3Qgc2V0IHRoZSAzMi1i
aXQgTU1JTyBhcGVydHVyZSBhbmQgdGhlbiBhdHRlbXB0CnRvIG1hcmsgaXQgYXMgdW5jYWNoZWQp
LiBQbGVhc2Ugc2VlOgoKICBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcu
Y2dpP2lkPTE4MTQKClRoaXMgaXMgb25lIG9mIHRoZSBuYXN0aWVzdCBwYXJ0cyBvZiBPVk1GLiAo
UGxhdGZvcm1QZWkgaXMsIGluIGdlbmVyYWwuKQoKVGhhbmtzCkxhc3psbwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
