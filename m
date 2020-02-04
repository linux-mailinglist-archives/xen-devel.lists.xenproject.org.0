Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E415210E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 20:29:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz3pM-0006F1-33; Tue, 04 Feb 2020 19:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Fs=3Y=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1iz3pK-0006Ew-KS
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 19:25:38 +0000
X-Inumbo-ID: 1ec870dc-4784-11ea-8fff-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1ec870dc-4784-11ea-8fff-12813bfff9fa;
 Tue, 04 Feb 2020 19:25:37 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200131201046.44996-1-jeff.kubascik@dornerworks.com>
 <3dc228b7-79a5-b91c-58ee-f13b238dfd86@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <911fc6f8-3553-11f5-a857-aceddd52af87@dornerworks.com>
Date: Tue, 4 Feb 2020 14:26:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3dc228b7-79a5-b91c-58ee-f13b238dfd86@xen.org>
Content-Language: en-US
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Handle unimplemented VGICv3
 dist registers as RAZ/WI
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5IEp1bGllbiwKCk9uIDIvMS8yMDIwIDY6NDUgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBI
aSwKPiAKPiBPbiAzMS8wMS8yMDIwIDIwOjEwLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+PiBQZXIg
dGhlIEFSTSBHZW5lcmljIEludGVycnVwdCBDb250cm9sbGVyIEFyY2hpdGVjdHVyZSBTcGVjaWZp
Y2F0aW9uIChBUk0KPj4gSUhJIDAwNjlFKSwgcmVzZXJ2ZWQgcmVnaXN0ZXJzIHNob3VsZCBnZW5l
cmFsbHkgYmUgdHJlYXRlZCBhcyBSQVovV0kuCj4+IFRvIHNpbXBsaWZ5IHRoZSBWR0lDdjMgZGVz
aWduIGFuZCBpbXByb3ZlIGd1ZXN0IGNvbXBhdGFiaWxpdHksIHRyZWF0IHRoZQo+IAo+IFR5cG86
IGNvbXBhdGliaWxpdHkKCkdvb2QgY2F0Y2gsIEkgd2lsbCBjb3JyZWN0LgoKPj4gZGVmYXVsdCBj
YXNlIGZvciBHSUNEIHJlZ2lzdGVycyBhcyByZWFkX2FzX3plcm8vd3JpdGVfaWdub3JlLgo+IAo+
IEkgd291bGQgcHJlZmVyIGlmIHdlIHRyeSB0byBrZWVwIHRoZSBlbXVsYXRpb24gb2YgYWxsIHRo
ZSByZWdpc3RlcnMgdGhlCj4gc2FtZSB3YXkuIEkuZSBpZiBHSUNEIGRlZmF1bHQgY2FzZSBpcyBu
b3cgUkFaL1dJLCB0aGVuIGFsbCB0aGUgb3RoZXIKPiByZWdpb25zIChlLmcgR0lDUikgc2hvdWxk
IGRvIHRoZSBzYW1lLgoKU2hvdWxkIGJlIGVhc3kgZW5vdWdoIHRvIG1ha2UgdGhlIHNhbWUgY2hh
bmdlIGZvciB0aGUgcmVkaXN0LgoKPiBJIHdpbGwgbG9vayB0byB3cml0ZSBhIHBhdGNoIHNpbWls
YXIgZm9yIEdJQ3YyIGFzIHdlbGwuCgpHcmVhdCEKCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEplZmYg
S3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPgo+PiAtLS0KPj4gICB4ZW4v
YXJjaC9hcm0vdmdpYy12My5jIHwgMTMgKysrKysrLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vdmdpYy12My5jIGIveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYwo+PiBpbmRleCA0MjJi
OTRmOTAyLi44ZDA4NTZhYzMzIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy12My5j
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKPj4gQEAgLTEyNTAsOSArMTI1MCw5IEBA
IHN0YXRpYyBpbnQgdmdpY192M19kaXN0cl9tbWlvX3JlYWQoc3RydWN0IHZjcHUgKnYsIG1taW9f
aW5mb190ICppbmZvLAo+PiAgICAgICAgICAgIGdvdG8gcmVhZF9pbXBsX2RlZmluZWQ7Cj4+Cj4+
ICAgICAgIGRlZmF1bHQ6Cj4+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIiVwdjogdkdJ
Q0Q6IHVuaGFuZGxlZCByZWFkIHIlZCBvZmZzZXQgJSMwOHhcbiIsCj4+IC0gICAgICAgICAgICAg
ICB2LCBkYWJ0LnJlZywgZ2ljZF9yZWcpOwo+PiAtICAgICAgICByZXR1cm4gMDsKPj4gKyAgICAg
ICAgLyogU2luY2UgcmVzZXJ2ZWQgcmVnaXN0ZXJzIHNob3VsZCBiZSByZWFkLWFzLXplcm8sIG1h
a2UgdGhpcyB0aGUKPj4gKyAgICAgICAgICogZGVmYXVsdCBjYXNlICovCj4gCj4gVGhpcyBjb21t
ZW50IGlzIG1pc2xlYWRpbmcgYmVjYXVzZSB0aGUgZGVmYXVsdCBjYXNlIGRvZXNuJ3Qgb25seSBo
YW5kbGUKPiByZXNlcnZlZCByZWdpc3RlcnMuIEEgZ29vZCBleGFtcGxlIGlzIEdJQ0RfSUdSUE1P
RFIgd2lsbCB1c2UgdGhlIGRlZmF1bHQKPiBsYWJlbC4gWWV0IGl0IGlzIG5vdCBhIHJlc2VydmVk
IHJlZ2lzdGVycy4gU29tZSBvZiB0aGUgcmVzZXJ2ZWQKPiByZWdpc3RlcnMgbWF5IGFsc28gYmUg
YWxsb2NhdGVkIGluIHRoZSBmdXR1cmUgKGkuZSB3aXRoIEdJQ3Y0KS4gU28gSQo+IHdvdWxkIGRy
b3AgdGhlIGNvbW1lbnQgaGVyZS4KClN1cmUgdGhpbmcsIEknbGwgZHJvcCB0aGUgY29tbWVudC4K
Cj4gSSB3b3VsZCBhbHNvIGxpa2UgdG8ga2VlcCBhIHByaW50IChhdCBsZWFzdCBpbiBkZWJ1ZyBi
dWlsZCkgYXMgaXQgY291bGQKPiBiZSBoZWxwZnVsIGZvciBhbiBPUyBkZXZlbG9wcGVyIChvciBl
dmVuIFhlbiBvbmUpIHRvIGRldGVjdCBhbnkgcmVnaXN0ZXIKPiB3ZSBpbXBsZW1lbnQgYXMgUkFa
L1dJIGJ1dCBzaG91bGQgbm90LgoKSSdsbCBhZGQgdGhlIHByaW50ayBiYWNrIGluLgoKPiBBcyBh
biBhc2lkZSwgdGhlIGNvZGluZyBzdHlsZSBmb3IgbXVsdGktbGluZXMgY29tbWVudCBvbiBYZW4g
aXM6Cj4gCj4gLyoKPiAgICogRm9vCj4gICAqIEJhcgo+ICAgKi8KClRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhpcyBvdXQuCgo+PiArICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsKPj4gICAgICAgfQo+
Pgo+PiAgIGJhZF93aWR0aDoKPj4gQEAgLTE0MzUsMTAgKzE0MzUsOSBAQCBzdGF0aWMgaW50IHZn
aWNfdjNfZGlzdHJfbW1pb193cml0ZShzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZvX3QgKmluZm8s
Cj4+ICAgICAgICAgICAgZ290byB3cml0ZV9pbXBsX2RlZmluZWQ7Cj4+Cj4+ICAgICAgIGRlZmF1
bHQ6Cj4+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIKPj4gLSAgICAgICAgICAgICAgICIl
cHY6IHZHSUNEOiB1bmhhbmRsZWQgd3JpdGUgciVkPSUiUFJJcmVnaXN0ZXIiIG9mZnNldCAlIzA4
eFxuIiwKPj4gLSAgICAgICAgICAgICAgIHYsIGRhYnQucmVnLCByLCBnaWNkX3JlZyk7Cj4+IC0g
ICAgICAgIHJldHVybiAwOwo+PiArICAgICAgICAvKiBTaW5jZSByZXNlcnZlZCByZWdpc3RlcnMg
c2hvdWxkIGJlIHdyaXRlLWlnbm9yZSwgbWFrZSB0aGlzIHRoZQo+PiArICAgICAgICAgKiBkZWZh
dWx0IGNhc2UgKi8KPj4gKyAgICAgICAgZ290byB3cml0ZV9pZ25vcmU7Cj4gCj4gU2FtZSBjb21t
ZW50cy4KClVuZGVyc3Rvb2QgOikKCj4+ICAgICAgIH0KPj4KPj4gICBiYWRfd2lkdGg6Cj4+Cj4g
Cj4gLS0KPiBKdWxpZW4gR3JhbGwKPiAKClNpbmNlcmVseSwKSmVmZiBLdWJhc2NpawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
