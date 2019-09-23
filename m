Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685DBB192
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:42:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKoL-0003Qk-0J; Mon, 23 Sep 2019 09:39:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCKoJ-0003QX-Fq
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:39:11 +0000
X-Inumbo-ID: fe3d880a-dde5-11e9-95f7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe3d880a-dde5-11e9-95f7-12813bfff9fa;
 Mon, 23 Sep 2019 09:39:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9EA7ADAA;
 Mon, 23 Sep 2019 09:39:08 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190920121636.2573-1-aisaila@bitdefender.com>
 <8ea5be2f-289f-a291-074a-63f731f2de57@suse.com>
 <a2beaebb-d1ef-9267-0167-65c62b5ab190@bitdefender.com>
 <87157d30-1f99-9fb7-72d0-537d331f7ba1@suse.com>
 <c78f3791-3afe-2143-2ab8-75e3a4c1b1a4@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4f69d31-b1b4-f17e-dc85-50b817a8d0c1@suse.com>
Date: Mon, 23 Sep 2019 11:39:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c78f3791-3afe-2143-2ab8-75e3a4c1b1a4@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v12] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxMTowMCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT2ss
IGp1c3QgdG8gbWFrZSBzdXJlIHRoaXMgaXMgd2hhdCBpcyBuZWVkZWQgYW5kIGxpbWl0IHRoZSBw
YXRjaCAKPiB2ZXJzaW9ucywgcmVwX21vdnMgLyByZXBfc3RvcyBzaG91bGQgaGF2ZSBhIHN3aXRj
aCBsaWtlIHRoaXM6Cj4gCj4gICAgICAgICAgc3dpdGNoICggcmMgKQo+ICAgICAgICAgIHsKPiAg
ICAgICAgICBjYXNlIEhWTVRSQU5TX29rYXk6Cj4gICAgICAgICAgICAgIHJldHVybiBYODZFTVVM
X09LQVk7Cj4gICAgICAgICAgY2FzZSBIVk1UUkFOU19uZWVkX3JldHJ5Ogo+ICAgICAgICAgICAg
ICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiAgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICov
Cj4gICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Ogo+ICAgICAgICAgIGNhc2Ug
SFZNVFJBTlNfZ2ZuX3NoYXJlZDoKPiAgICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfUkVUUlk7
Cj4gICAgICAgICAgfQo+IAo+IFRoZW4gaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKSBzaG91bGQg
aGF2ZToKPiAKPiAgICAgICAgICBjYXNlIEhWTVRSQU5TX25lZWRfcmV0cnk6Cj4gICAgICAgICAg
ICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+ICAgICAgICAgICAgICAvKiBmYWxsIHRocm91Z2gg
Ki8KPiAgICAgICAgICBjYXNlIEhWTVRSQU5TX2dmbl9zaGFyZWQ6Cj4gICAgICAgICAgY2FzZSBI
Vk1UUkFOU19nZm5fcGFnZWRfb3V0Ogo+ICAgICAgICAgICAgICBlcnIgPSBFUlJfUFRSKH5YODZF
TVVMX1JFVFJZKTsKPiAKClJpZ2h0LCBwbHVzIGEgYnJpZWYgY29tbWVudCBvbiB0aGUgYXNzZXJ0
aW9ucyBhcyB0byB3aHkgdGhleSdyZQp0aGVyZSAodG8gY2xhcmlmeSB1bmRlciB3aGF0IGNvbmRp
dGlvbiBpdCB3b3VsZCBiZSBmaW5lIHRvIGRyb3AKdGhlbSkuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
