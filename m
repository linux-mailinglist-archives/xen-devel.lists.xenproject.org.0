Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08782AF8F5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 11:32:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ywd-000245-Kv; Wed, 11 Sep 2019 09:29:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7ywc-00023w-As
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 09:29:46 +0000
X-Inumbo-ID: b0b5d9b6-d476-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0b5d9b6-d476-11e9-b76c-bc764e2007e4;
 Wed, 11 Sep 2019 09:29:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1658CAD0F;
 Wed, 11 Sep 2019 09:29:44 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-2-jgross@suse.com>
 <4a2380f3-d318-1086-74ba-8f133db440b4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <aa13061d-2cb2-ef79-de19-f304a1ee12ca@suse.com>
Date: Wed, 11 Sep 2019 11:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a2380f3-d318-1086-74ba-8f133db440b4@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 1/5] docs: add feature document for Xen
 hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTE6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMDg6
MTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+ICsjIE92ZXJ2aWV3Cj4+ICsKPj4gK1RoZSBIeXBl
cnZpc29yIEZTIGlzIGEgaGllcmFyY2hpY2FsIG5hbWUtdmFsdWUgc3RvcmUgZm9yIHJlcG9ydGlu
Zwo+PiAraW5mb3JtYXRpb24gdG8gZ3Vlc3RzLCBlc3BlY2lhbGx5IGRvbTAuICBJdCBpcyBzaW1p
bGFyIHRvIHRoZSBMaW51eAo+PiAra2VybmVsJ3Mgc3lzZnMsIGJ1dCB3aXRob3V0IHRoZSBmdW5j
dGlvbmFsaXR5IHRvIGRpcmVjdGx5IGFsdGVyCj4+ICtlbnRyaWVzIHZhbHVlcy4gRW50cmllcyBh
bmQgZGlyZWN0b3JpZXMgYXJlIGNyZWF0ZWQgYnkgdGhlIGh5cGVydmlzb3IsCj4+ICt3aGlsZSB0
aGUgdG9vbHN0YWNrIGlzIGFibGUgdG8gdXNlIGEgaHlwZXJjYWxsIHRvIHF1ZXJ5IHRoZSBlbnRy
eQo+PiArdmFsdWVzLgo+PiArCj4+ICsjIFVzZXIgZGV0YWlscwo+PiArCj4+ICtXaXRoOgo+PiAr
Cj4+ICsgICAgeGVuZnMgLS1scyA8cGF0aD4KPj4gKwo+PiArdGhlIHVzZXIgY2FuIGxpc3QgdGhl
IGVudHJpZXMgb2YgYSBzcGVjaWZpYyBwYXRoIG9mIHRoZSBGUy4gVXNpbmc6Cj4+ICsKPj4gKyAg
ICB4ZW5mcyAtLWNhdCA8cGF0aD4KPj4gKwo+PiArdGhlIGNvbnRlbnQgb2YgYW4gZW50cnkgY2Fu
IGJlIHJldHJpZXZlZC4KPiAKPiBKdXN0IG9uZSBpbml0aWFsIHJlbWFyazogSSB0aGluayB0aGUg
LS0gcHJlZml4IHRvIHRoZSBjb21tYW5kcwo+IHNob3VsZCBiZSBvbWl0dGVkOyB0aGV5IHNob3Vs
ZCBiZSB1c2VkIGZvciBvcHRpb24tbGlrZSBhcmd1bWVudHMKPiBvbmx5LgoKRmluZSB3aXRoIG1l
LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
