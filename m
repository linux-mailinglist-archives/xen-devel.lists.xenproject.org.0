Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2136084F12
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:48:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNCF-0002Ul-2m; Wed, 07 Aug 2019 14:45:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvNCD-0002Ug-N2
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:45:45 +0000
X-Inumbo-ID: 08779c10-b922-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08779c10-b922-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 14:45:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 045DFB12E;
 Wed,  7 Aug 2019 14:45:42 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190807132657.GA2852@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
Date: Wed, 7 Aug 2019 16:45:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807132657.GA2852@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNToyNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBIaSwKPiAKPiBYZW4gNC4xMiBjcmFzaGVzIHdoZW4gYm9vdGluZyBvbiBVRUZJICh3aXRoIG11
bHRpYm9vdDIpIHVubGVzcyBJIGRpc2FibGUKPiBydW50aW1lIHNlcnZpY2VzLiBUaGUgY3Jhc2gg
aGFwcGVucyBzaG9ydGx5IGFmdGVyIHN0YXJ0aW5nIGRvbTAga2VybmVsLgo+IFVuZm9ydHVuYXRl
bHkgSSBkb24ndCBoYXZlIHNlcmlhbCBjb25zb2xlIHRoZXJlLCBzbyB0aGUgb25seSBsb2cgSSBo
YXZlCj4gaXMgYSBwaG90byBvZiBWR0EgY29uc29sZSAoYXR0YWNoZWQpLiBCZWxvdyBJIHJldHlw
ZSBwYXJ0IG9mIHRoZSBtZXNzYWdlOgo+IAo+IChYRU4pIC0tLS1bIFhlbi00LjEyLjAtMy5mYzI5
ICB4ODZfNjQgIGRlYnVnPW4gICBOb3QgdGFpbnRlZCBdLS0tLQo+IChYRU4pIENQVTogICAgMAo+
IChYRU4pIFJJUDogICAgZTAwODpbPDAwMDAwMDAwMDAwMDAwZjY+XSAwMDAwMDAwMDAwMDAwMGY2
Cj4gKFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMjg3ICAgQ09OVEVYVDogaHlwZXJ2aXNvciAo
ZDB2MCkKPiAuLi4KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToKPiAoWEVOKSAgICBbPDAwMDAwMDAw
MDAwMDAwZjY+XSAwMDAwMDAwMDAwMDAwMGY2Cj4gKFhFTikgICAgWzxmZmZmODJkMDgwMjZjNmFk
Pl0gZmx1c2h0bGIuYyNwcmVfZmx1c2grMHgzZC8weDgwCj4gKFhFTikgICAgWyAgICAgICAgICAg
ICAgICAgIF0gZWZpX3J1bnRpbWVfY2FsbCsweDQ5My8weGJkMAo+IChYRU4pICAgIFsgICAgICAg
ICAgICAgICAgICBdIGVmaV9ydW50aW1lX2NhbGwrMHg0NDEvMHhiZDAKPiAoWEVOKSAgICBbICAg
ICAgICAgICAgICAgICAgXSB2Y3B1X3Jlc3RvcmVfZnB1X25vbmxhenkrMHhlNy8weDE4MAo+IChY
RU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGRvX3BsYXRmb3JtX29wKzAvMHgxODgwCj4gKFhF
TikgICAgWyAgICAgICAgICAgICAgICAgIF0gZG9fcGxhdGZvcm1fb3ArMHhiOWMvMHgxODgwCj4g
KFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gZG9fcGxhdGZvcm1fb3ArMHhiOWMvMHgxODgw
Cj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gc2NoZWRfY3JlZGl0Mi5jI2NzY2hlZDJf
c2NoZWR1bGUrMHhjZDAvMHgxM2EwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0
YXJfZW50ZXIrMHhhZS8weDEyMAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGRvX3Bs
YXRmb3JtX29wKzAvMHgxODgwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gcHZfaHlw
ZXJjYWxsKzB4MTUyLzB4MjIwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJf
ZW50ZXIrMHhhZS8weDEyMAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2Vu
dGVyKzB4YTIvMHgxMjAKPiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRl
cisweGFlLzB4MTIwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJfZW50ZXIr
MHhhMi8weDEyMAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2VudGVyKzB4
YWUvMHgxMjAKPiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRlcisweGEy
LzB4MTIwCj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJfZW50ZXIrMHhhZS8w
eDEyMAo+IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2VudGVyKzB4YTIvMHgx
MjAKPiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRlcisweGFlLzB4MTIw
Cj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gbHN0YXJfZW50ZXIrMHhhMi8weDEyMAo+
IChYRU4pICAgIFsgICAgICAgICAgICAgICAgICBdIGxzdGFyX2VudGVyKzB4YWUvMHgxMjAKPiAo
WEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9lbnRlcisweDEwYy8weDEyMAo+IChY
RU4pCj4gKFhFTikKPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgo+IChYRU4pIFBhbmljIG9uIENQVSAwOgo+IChYRU4pIEZBVEFMIFRSQVA6IHZlY3RvciA9
IDAgKGRpdmlkZSBlcnJvcikKPiAoWEVOKSBbZXJyb3JfY29kZT0wMDAwXQo+IChYRU4pICoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gCj4gQW55IGlkZWE/IExhY2sg
b2Ygc2VyaWFsIGNvbnNvbGUgZG9lc24ndCBoZWxwIHdpdGggY29sbGVjdGluZyBsb2dzLi4uCgpN
YXkgSSBzdWdnZXN0IHRoYXQgeW91IHJlcGVhdCB0aGlzIHdpdGggYSBkZWJ1ZyBoeXBlcnZpc29y
LCBzdWNoIHRoYXQKdGhlIGNhbGwgdHJhY2UgYmVjb21lcyBtb3JlIHVzYWJsZS9zZW5zaWJsZT8g
SSB0aGluaywgZm9yIGV4YW1wbGUsCnRoYXQgdGhlIHByZV9mbHVzaCgpIHRoYXQgY2F1Z2h0IEFu
ZHJldydzIGV5ZSBpcyBhIHJlZCBoZXJyaW5nLCBhbmQKdGhhdCBpbnN0ZWFkIGEgY2FsbCB0aHJv
dWdoIE5VTEwgaGFzIGhhcHBlbmVkIGluIGUuZy4KZWZpX3J1bnRpbWVfY2FsbCgpLgoKT2YgY291
cnNlIHRyeWluZyB0byBjYXB0dXJlIG1vcmUgb2YgWGVuJ3MgYm9vdCBsb2cgKGluIHBhcnRpY3Vs
YXIKdGhlIEVGSSBtZW1vcnkgbWFwKSBtYXkgYmUgaGVscGZ1bCwgdG9vLCBpZiB5b3UgY291bGQg
bWFuYWdlIHRvIGRvCnNvLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
