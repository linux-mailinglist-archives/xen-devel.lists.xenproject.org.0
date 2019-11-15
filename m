Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D392DFE158
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:34:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdav-00061O-Hm; Fri, 15 Nov 2019 15:33:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVdau-00061E-OD
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:33:08 +0000
X-Inumbo-ID: 38d729d4-07bd-11ea-a276-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38d729d4-07bd-11ea-a276-12813bfff9fa;
 Fri, 15 Nov 2019 15:33:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA304B9F4;
 Fri, 15 Nov 2019 15:33:06 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
 <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
 <0f27d518-e6c4-a728-e59d-237acc92d493@suse.com>
 <0ec711d3-90d4-5fa0-7f16-8bf1ac8dc0ca@citrix.com>
 <f6c3a7dc-e42f-36ab-7905-75e34c5158bf@suse.com>
 <69319c0a-b064-5cb9-664c-7e7fe7eb1c3e@citrix.com>
 <b06aa658-7dea-bc6e-1488-362403f42790@citrix.com>
 <e059f1dd-aa03-ad7e-9306-3627e0949057@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7470a0d0-eba4-15b0-b0b9-7439349ba441@suse.com>
Date: Fri, 15 Nov 2019 16:33:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e059f1dd-aa03-ad7e-9306-3627e0949057@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, IanJackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxNjoyMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAy
OjU5IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNS8xMS8yMDE5IDE0OjU1LCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+PiArICAgICAgICAgICAgcC0+YmFzaWMuaHR0ID0gZmFsc2U7
Cj4+Pj4gSSB0aGluayBldmVyeXRoaW5nIGJlbG93IGhlcmUgaW5kZWVkIHNpbXBseSB1bmRvZXMg
d2hhdCBzYWlkIG9sZAo+Pj4+IGNvbW1pdCBkaWQsIGJ1dCBJIGNhbid0IG1hdGNoIHVwIHRoaXMg
b25lLiBBbmQgdG9nZXRoZXIgd2l0aCB0aGUKPj4+PiBxdWVzdGlvbiBvZiB3aGV0aGVyIGluc3Rl
YWQgbGVhdmluZyBpdCBhbG9uZSwgY21wX2xlZ2FjeSB0aGVuCj4+Pj4gd291bGQgaGF2ZSB0aGUg
c2FtZSBxdWVzdGlvbiByYWlzZWQuCj4+PiBUaGlzIGlzIGJhc2VkIG9uIGEgWGVuU2VydmVyIHBh
dGNoIHdoaWNoIHJldmVydHMgdGhlIGVudGlyZSBjb21taXQsIGFuZAo+Pj4gaGFzIGJlZW4gbWFp
bnRhaW5lZCBpbiB0aGUgcGF0Y2hxdWV1ZSBzaW5jZSB0aGUgY29tbWl0IG1hZGUgaXQgdXBzdHJl
YW0sCj4+PiBBRkFJQ1QuICBTbyBJJ2xsIGxldCBzb21lb25lIGZyb20gdGhhdCB0ZWFtIGNvbW1l
bnQgb24gdGhlIHdoZXJlZm9yZXM7Cj4+PiBidXQgYXMgSSBzYWlkLCBpdCdzIGJ5IGZhciB0aGUg
YmVzdCB0ZXN0ZWQgb3B0aW9uIHdlJ3JlIGdvaW5nIHRvIGdldC4KPj4KPj4gWWVzLsKgIEl0IGlz
IGEgcmV2ZXJ0IG9mIGMvcyBjYTJlZWU5MmRmNDQgKFhlbiAzLjQsIGFuZCBtYWludGFpbmVkCj4+
IGZvcndhcmRzIHVudGlsIG5vdykgYmVjYXVzZSBpdCBicm9rZSBtaWdyYXRpb24gYWNyb3NzIHRo
YXQgY2hhbmdlc2V0Lgo+Pgo+PiBJdCBpcyBhbHNvIHRoaXMgZXhhY3QgdmVyc2lvbiBvZiB0aGUg
cmV2ZXJ0IHdoaWNoIGhhcyBiZWVuIHRlc3RlZCBhbmQKPj4gY29uZmlybWVkIHRvIGZpeCB0aGUg
Unl6ZW4gM3h4eCBmaXhlcy4KPj4KPj4gQSBzZXBhcmF0ZSBleHBlcmltZW50IHRyaWVkIHBsYXlp
bmcgd2l0aCBvbmx5IHRoZSBmbGFncywgdmlhCj4+IGNwdWlkPSJob3N0Omh0dD0wLGNtcF9sZWdh
Y3k9MSIgYW5kIHRoaXMgZGlkIG5vdCByZXNvbHZlIHRoZSBjcmFzaGVzLgo+IAo+IElzIHRoYXQg
YmVjYXVzZSB0aGUgInJldmVydCIgIHN0aWxsIGNsZWFycyBjbXBfbGVnYWN5LCByYXRoZXIgdGhh
bgo+IHNldHRpbmcgaXQgdG8gMT8KPiAKPiBJIHRoaW5rIHdoYXQgSmFuIHdhcyBnZXR0aW5nIGF0
IHdhcyB0aGF0IGNhMmVlZTkyZGY0NCAqc2V0cyogaHR0IGFuZAo+ICpjbGVhcnMqIGNtcF9sZWdh
Y3ksIGJ1dCBwcmV2aW91cyB0byB0aGF0IGNvbW1pdCwgaHR0IGFuZCBjbXBfbGVnYWN5Cj4gd2Vy
ZW4ndCBjaGFuZ2VkLCB0aGV5IHdlcmUgc2ltcGx5IGxlZnQgYWxvbmUuICBXaGVuIHJldmVydGlu
ZyB0aGlzCj4gcGF0Y2gsIHdoeSBkbyB3ZSBub3Qgc2ltcGx5IGxlYXZlIGl0IGFsb25lLCBhcyB3
YXMgZG9uZSBiZWZvcmUsIHJhdGhlcgo+IHRoYW4gYWN0aXZlbHkgY2xlYXJpbmcgdGhlbT8KCkFj
dHVhbGx5IG5vLCBJIHdhc24ndCBsb29raW5nIHByb3Blcmx5IC0gSFRUIHVzZWQgdG8gYmUgY2xl
YXJlZCBhcyBtdWNoCmFzIENNUF9MRUdBQ1kgYmVmb3JlIHRoYXQgY2hhbmdlLiBTb21laG93IEkg
ZGlkbid0IHNwb3QgdGhlIGZvcm1lciB3aGVuCnB1dHRpbmcgdG9nZXRoZXIgbXkgZWFybGllciBy
ZXBseSAobWF5YmUgSSBsb29rZWQgZm9yIEhUVCB3aGVuIGl0cyBvbmx5CkhUIHRoZXJlKS4gU28g
SSdtIHNvcnJ5IGZvciB0aGUgZXh0cmEgbm9pc2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
