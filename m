Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07678E8B39
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:52:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSok-0001SB-GX; Tue, 29 Oct 2019 14:49:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPSoi-0001S6-MN
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:49:52 +0000
X-Inumbo-ID: 5c7a2f9a-fa5b-11e9-9515-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c7a2f9a-fa5b-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 14:49:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7DB2B4B6;
 Tue, 29 Oct 2019 14:49:50 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
 <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
 <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
 <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf0bcc92-7ac9-1cc1-0440-04a2c97a7fd1@suse.com>
Date: Tue, 29 Oct 2019 15:49:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMjAxOSAxNTozMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDI4LzEw
LzIwMTkgMjE6NDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gTW9uLCAyOCBPY3Qg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMjUvMTAvMjAxOSAx
MTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gQWxsLAo+Pj4+Cj4+Pj4gdGhlIDQuMTEuMyBz
dGFibGUgcmVsZWFzZSBpcyBkdWUuIEkgaW50ZW5kIHRvIHdhaXQgZm9yIHRoZSBYU0EgZml4ZXMK
Pj4+PiBnb2luZyBwdWJsaWMgb24gdGhlIDMxc3QsIGJ1dCBub3QgKG11Y2gpIGxvbmdlci4gUGxl
YXNlIHBvaW50IG91dAo+Pj4+IGJhY2twb3J0aW5nIGNhbmRpZGF0ZXMgdGhhdCB5b3UgZmluZCBt
aXNzaW5nIGZyb20gdGhlIHJlc3BlY3RpdmUKPj4+PiBzdGFibGUgdHJlZXMuIEkgaGF2ZSB0aHJl
ZSBvbmVzIHF1ZXVlZCB3aGljaCBoYXZlbid0IHBhc3NlZCB0aGUgcHVzaAo+Pj4+IGdhdGUgdG8g
dGhlIG1hc3RlciBicmFuY2ggeWV0Ogo+Pj4+Cj4+Pj4gOTI1N2MyMThlNQl4ODYvdnZteDogRml4
IHRoZSB1c2Ugb2YgUkRUU0NQIHdoZW4gaXQgaXMgaW50ZXJjZXB0ZWQgYXQgTDAKPj4+PiA3ZWVl
OWMxNmQ2CXg4Ni90c2M6IHVwZGF0ZSB2Y3B1IHRpbWUgaW5mbyBvbiBndWVzdCBUU0MgYWRqdXN0
bWVudHMKPj4+PiA5NjMzOTI5ODI0CXg4NjogZml4IG9mZi1ieS1vbmUgaW4gaXNfeGVuX2ZpeGVk
X21mbigpCj4+Pgo+Pj4gV2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGJhY2twb3J0ZWQgcGF0Y2hlcyBm
b3IgcXVpdGUgYSB3aGlsZSBvbiBBcm0uIFNvbWUgb2YgbXkKPj4+IHBhdGNoZXMgaGF2ZSBiZWVu
IG1hcmtlZCBhcyB0byBiZSBiYWNrcG9ydGVkIGZyb20gdGhlIGJlZ2lubmluZyBbMV0uIEkgYW0K
Pj4+IHNwZWNpZmljYWxseSB0aGlua2luZyB0bzoKPj4+IAkKPj4+IGUwNDgxOGI0NmQgeGVuL2Fy
bTogdHJhcHM6IEF2b2lkIHVzaW5nIEJVR19PTigpIHRvIGNoZWNrIGd1ZXN0IHN0YXRlIGluCj4+
PiBhZHZhbmNlX3BjKCkKPiAKPiBVcmdoLCBJIGdhdmUgdGhlIGNvcnJlY3QgdGl0bGUgYnV0IHRo
ZSB3cm9uZyBjb21taXQgc2hhMS4gSXQgc2hvdWxkIGJlIAo+IAo+IDcyNjE1ZjJlNmI5OGU4NjFj
MDhhYmIxZDJiMTk0MTI2MDEzZDU0ZmUKPiAKPj4KPj4gSSBoYXZlIGUwNDgxOGI0NmQsIHBsdXMg
dGhlIGZvbGxvd2luZyBtYXJrZWQgZm9yIGJhY2twb3J0Ogo+Pgo+PiBlOThlZGNjYjk0NGE4MGRi
NzgyZTU1MWYzMDkwNjI4ZTY2YzdmYjUyIHhlbi9hcm06IFNDVExSX0VMMSBpcyBhIDY0LWJpdCBy
ZWdpc3RlciBvbiBBcm02NAo+IAo+IFRoZXJlIGFyZSBtb3JlIHRoYW4gdGhhdCB0byBiYWNrcG9y
dDoKPiAKPiAzMGY1MDQ3YjJjNGU1Nzc0MzZiNTA1YmE3NjI3ZjM0YzNiZTAyMDE0ICAgIHhlbi9h
cm06IGdpYzogTWFrZSBzdXJlIHRoZSBudW1iZXIgb2YgaW50ZXJydXB0IGxpbmVzIGlzIHZhbGlk
IGJlZm9yZSB1c2luZyBpdCAgWzQuMTFdCj4gOGFhMjc2MjM1YjkzZWViNGY4MTA5NWM2Mzg5NzA5
MDBlMTliMzFlNSAgICB4ZW4vYXJtOiBpcnE6IEVuZCBjbGVhbmx5IHNwdXJpb3VzIGludGVycnVw
dCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFs0LjExXQo+IGI0ZGY3M2RlNDkz
OTU0YzQ0ZjI0MGY3ODc3OWM5YmQzNzgyZTE1NzIgICAgeGVuL2FybTogZ2ljLXYyOiBkZWFjdGl2
YXRlIGludGVycnVwdHMgZHVyaW5nIGluaXRpYWxpemF0aW9uICAgICAgICAgICAgICAgICAgICBb
NC4xMV0KPiAwMzIyZTBkYjViMjlhMGQxY2U0YjQ1Mjg4NWUzNDAyM2UzYTRiMDBlICAgIGFybTog
Z2ljLXYzOiBkZWFjdGl2YXRlIGludGVycnVwdHMgZHVyaW5nIGluaXRpYWxpemF0aW9uICAgICAg
ICAgICAgICAgICAgICAgICAgWzQuMTFdCj4gCj4gNWJhMWM1ZDA2NDFjZjYzMDg2YjMwNThlNTQ3
ZmNkMjhjM2M0YTAxMSAgICB4ZW4vYXJtOiBtZW1hY2Nlc3M6IEluaXRpYWxpemUgY29ycmVjdGx5
ICphY2Nlc3MgaW4gX19wMm1fZ2V0X21lbV9hY2Nlc3MgICAgICAgIFs0LjEyXQo+IDA3ZTQ0YjNk
MWJlMzJmYTIxNjVjMjM2N2FlM2VmOWM2YzhiMzllMWUgICAgeGVuL2FybTogSW1wbGVtZW50IHdv
cmthcm91bmQgZm9yIENvcnRleCBBLTU3IGFuZCBDb3J0ZXggQTcyIEFUIHNwZWN1bGF0ZSAgICAg
ICBbNC4xMl0KPiAKPiAwOGUyMDU5ZmFjZDc4ZDVmZmFmMjA2YmEwNmFjMjAxN2M0YWRlZWQ0ICAg
IHhlbi9hcm06IHNldHVwOiBDYWxjdWxhdGUgY29ycmVjdGx5IHRoZSBzaXplIG9mIFhlbiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTErXQo+IDhkYmE5YTgxZTdjNjJiOGE3ZGJlMDIz
ZmZmZWNkMmUxNmNjMjA0ODYgICAgeGVuL2FybTogRG9uJ3QgdXNlIF9lbmQgaW4gaXNfeGVuX2Zp
eGVkX21mbigpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbNC4xMStdCj4gNjcx
ODc4Nzc5NzQxYjM4YzVmMjM2M2FkY2VlZjhkZTJjZTBiMzk0NSAgICB4ZW4vYXJtOiBwMm06IEZy
ZWUgdGhlIHAybSBlbnRyeSBhZnRlciBmbHVzaGluZyB0aGUgSU9NTVUgVExCcyAgICAgICAgICAg
ICAgICAgIFs0LjExK10KPiA3ZjQyMTdjYzYwNTc0ODY2Y2I5MGQ2N2Q5NzUwMjI4YzZiODZjOTFl
ICAgIHhlbi9hcm06IHZzbWM6IFRoZSBmdW5jdGlvbiBpZGVudGlmaWVyIGlzIGFsd2F5cyAzMi1i
aXQgICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTErXQo+IDYxMmQ0NzZlNzRhMzE0YmU1MTRl
ZTZhOTc0NGVlYThkYjA5ZDMyZTUgICAgeGVuL2FybTY0OiBDb3JyZWN0bHkgY29tcHV0ZSB0aGUg
dmlydHVhbCBhZGRyZXNzIGluIG1hZGRyX3RvX3ZpcnQoKSAgICAgICAgICAgICBbNC4xMStdCj4g
ZjUxMDI3YmUwNjg4NTQwYWFhYjYxNTEzYjA2YTg2OTNhMzdlNGMwMCAgICB4ZW4vYXJtOiBmaXgg
bnJfcGR4cyBjYWxjdWxhdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFs0LjExK10KPiBhMTg5ZWYwMjdkYmI3YTNjMGRmZTU2NjEzN2YwNWMwNmQ2Njg1
ZmI5ICAgIHhlbi9hcm06IG1tOiBGbHVzaCB0aGUgVExCcyBldmVuIGlmIGEgbWFwcGluZyBmYWls
ZWQgaW4gY3JlYXRlX3hlbl9lbnRyaWVzICAgICAgWzQuMTErXQoKVGhpcyBpcyBxdWl0ZSBsb25n
IGEgbGlzdCBmb3IgYSByZWxlYXNlIGFib3V0IHRvIGJlIGN1dC4gTG9va2luZwphdCB0aGUgYnJh
bmNoIEkgZG9uJ3Qgc2VlIGFueSBBcm0gYmFja3BvcnRzIG90aGVyIHRoYW4gdGhlIG9uZXMKZG9u
ZSB5ZXN0ZXJkYXkgcG9zdC00LjExLjIuIEknbSBmaW5lIHdpdGggYmF0Y2hpbmcsIGJ1dCBtYXkg
SQphc2sgZm9yIHN1Y2ggYmF0Y2hlcyB0byBub3QgYmUgcG9zdHBvbmVkIHVudGlsIHRoZSBsYXN0
IG1pbnV0ZT8KClRoYW5rcywgSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
