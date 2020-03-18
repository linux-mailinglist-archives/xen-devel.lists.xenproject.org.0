Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49A189DA9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 15:16:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEZRQ-0005sZ-UJ; Wed, 18 Mar 2020 14:13:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEZRQ-0005sU-00
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 14:13:04 +0000
X-Inumbo-ID: 940d37dc-6922-11ea-baef-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 940d37dc-6922-11ea-baef-12813bfff9fa;
 Wed, 18 Mar 2020 14:13:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C133B1C9;
 Wed, 18 Mar 2020 14:13:01 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1582914997.git.tamas.lengyel@intel.com>
 <b76a2a71bdbb26e57088dab8f7c3966432aed729.1582914998.git.tamas.lengyel@intel.com>
 <6b7ffead-d2b9-13de-2b24-e3707f045118@suse.com>
 <CABfawhmf6KbHkrZHxt879R8Vw9RyGMAi9OO77PLknfNwQyK2MQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b2924a5-4193-f8fd-4f64-2a9eeafcbb99@suse.com>
Date: Wed, 18 Mar 2020 15:12:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmf6KbHkrZHxt879R8Vw9RyGMAi9OO77PLknfNwQyK2MQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 2/3] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxNTowMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgTWFy
IDE4LCAyMDIwIGF0IDU6MzYgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4gT24gMjguMDIuMjAyMCAxOTo0MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4gKyAg
ICAgICAgbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4+PiArICAgICAgICBpZiAoIG1mbl92YWxp
ZChtZm4pICkKPj4KPj4gQWxsIHBhZ2VzIG9uIGEgZG9tYWluJ3MgbGlzdCBzaG91bGQgaGF2ZSBh
IHZhbGlkIE1GTiAtIHdoYXQgYXJlIHlvdQo+PiB0cnlpbmcgdG8gcHJvdGVjdCBhZ2FpbnN0IGhl
cmU/Cj4gCj4gSSBzYXcgbm8gZG9jdW1lbnRhdGlvbiBzdGF0aW5nIHdoYXQgeW91IHN0YXRlZCBh
Ym92ZS4gSWYgdGhhdCdzIHRoZQo+IGNhc2UgaXQgY2FuIGJlIGRyb3BwZWQuCgpPbmx5IHBhZ2Vz
IGNvbWluZyBmcm9tIHRoZSBhbGxvY2F0b3IgKG9yLCBpbiBzb21lIHNwZWNpYWwgY2FzZXMsCm90
aGVyd2lzZSB2YWxpZCkgZ2V0IHB1dCBvbiBhIGRvbWFpbidzIHBhZ2UgbGlzdC4gQnkgY29taW5n
IGZyb20KdGhlIGFsbG9jYXRvciB0aGVpciBNRk5zIGFyZSBpbXBpY2l0bHkgdmFsaWQuCgo+Pj4g
KyAgICAgICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhwMm0sIGdmbl94KGdmbiks
ICZwMm10LCAmcDJtYSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMCwgTlVMTCwgZmFsc2UpOwo+Pj4gKwo+Pj4gKyAgICAgICAgICAgIGlmICggcDJtX2lzX3Jh
bShwMm10KSAmJiAhcDJtX2lzX3NoYXJlZChwMm10KSApCj4+PiArICAgICAgICAgICAgewo+Pj4g
KyAgICAgICAgICAgICAgICAvKiB0YWtlIGFuIGV4dHJhIHJlZmVyZW5jZSwgbXVzdCB3b3JrIGZv
ciBhIHNoYXJlZCBwYWdlICovCj4+Cj4+IFRoZSBjb21tZW50IChhbmQgYWxzbyB0aGUgbmV4dCBv
bmUgZnVydGhlciBkb3duKSBsb29rcyBjb250cmFkaWN0b3J5Cj4+IHRvIHRoZSBpZigpIGltbWVk
aWF0ZWx5IGFoZWFkLCBhdCBsZWFzdCB0byBtZS4gQ291bGQgeW91IGNsYXJpZnkgdGhlCj4+IHNp
dHVhdGlvbiwgcGxlYXNlPwo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIHF1ZXN0aW9uLiAg
VGhlIGNvbW1lbnQgZXhwbGFpbnMgZXhhY3RseSB3aGF0Cj4gaGFwcGVucy4gVGFraW5nIGFuIGV4
dHJhIHJlZmVyZW5jZSBtdXN0IHdvcmsuIElmIGl0IGRpZG4ndCwgdHJpZ2dlciBhbgo+IEFTU0VS
VF9VTlJFQUNIQUJMRS4gV2hpY2ggcGFydCBpcyBjb25mdXNpbmc/CgpUaGUgY29tbWVudCBzYXlz
ICJhIHNoYXJlZCBwYWdlIiB3aGVyZWFzIHRoZSBjb25kaXRpb24gaW5jbHVkZXMKIiFwMm1faXNf
c2hhcmVkKHAybXQpIiwgd2hpY2ggSSB1bmRlcnN0YW5kIHRvIG1lYW4gYSBwYWdlIHdoaWNoIGlz
Cm5vdCBzaGFyZWQuCgpBcyB0byB5b3UgZHJvcHBpbmcgY29udGludWF0aW9ucyBhZ2FpbiAtIHBs
ZWFzZSBoYXZlIGF0IGxlYXN0IGEKYm9sZCBjb21tZW50IGNsYXJpZnlpbmcgdGhhdCB0aGVpciBh
ZGRpdGlvbiBpcyBhIHJlcXVpcmVtZW50IGZvcgp0aGUgY29kZSB0byBldmVyIHJlYWNoICJzdXBw
b3J0ZWQiIHN0YXR1cy4gKEFueSBvdGhlciBvYnZpb3VzIGJ1dAppbnRlbnRpb25hbCBvbWlzc2lv
bnMgY291bGQgYWxzbyBiZSBuYW1lZCB0aGVyZS4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
