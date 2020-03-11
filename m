Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6D1814D4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:29:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxe2-00052Y-MM; Wed, 11 Mar 2020 09:27:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBxe1-00052D-3j
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:27:17 +0000
X-Inumbo-ID: 7f1e9404-637a-11ea-af48-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f1e9404-637a-11ea-af48-12813bfff9fa;
 Wed, 11 Mar 2020 09:27:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A821B3B6;
 Wed, 11 Mar 2020 09:27:15 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
 <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
 <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
 <8ea39077-c616-c0b4-52b6-3c511ca4f064@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2b7b572e-1349-4661-b64e-38ae5ae9723f@suse.com>
Date: Wed, 11 Mar 2020 10:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8ea39077-c616-c0b4-52b6-3c511ca4f064@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/6] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAgMTA6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjAzLjIwMjAgMDc6
MDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEwLjAzLjIwIDE4OjAyLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEwLjAzLjIwMjAgMDg6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+Pj4+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKPj4+PiBA
QCAtNTg3LDcgKzU4Nyw3IEBAIHN0YXRpYyB2b2lkIGFtZF9kdW1wX3AybV90YWJsZV9sZXZlbChz
dHJ1Y3QgcGFnZV9pbmZvKiBwZywgaW50IGxldmVsLAo+Pj4+ICAgICAgICAgICAgc3RydWN0IGFt
ZF9pb21tdV9wdGUgKnBkZSA9ICZ0YWJsZV92YWRkcltpbmRleF07Cj4+Pj4gICAgCj4+Pj4gICAg
ICAgICAgICBpZiAoICEoaW5kZXggJSAyKSApCj4+Pj4gLSAgICAgICAgICAgIHByb2Nlc3NfcGVu
ZGluZ19zb2Z0aXJxcygpOwo+Pj4+ICsgICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGly
cXNfbm9yY3UoKTsKPj4+Cj4+PiBBdCB0aGUgZXhhbXBsZSBvZiB0aGlzIC0gdGhlIHByb3BlcnR5
IG9mIGhvbGRpbmcgYW4gUkNVIGxvY2sgaXMKPj4+IGVudGlyZWx5IGludmlzaWJsZSBoZXJlLCBh
cyBpdCdzIHRoZSBnZW5lcmljCj4+PiBpb21tdV9kdW1wX3AybV90YWJsZSgpIHdoaWNoIGFjcXVp
cmVzIGl0LiBUaGlzIHN1Z2dlc3QgdG8gbWUgdGhhdAo+Pj4gZ29pbmcgZm9yd2FyZCBicmVha2lu
ZyB0aGlzIGlzIGdvaW5nIHRvIGJlIHZlcnkgbGlrZWx5LiBDb3VsZG4ndAo+Pj4gcHJvY2Vzc19w
ZW5kaW5nX3NvZnRpcnFzKCkgZXhjbHVkZSBSQ1UgaGFuZGxpbmcgd2hlbiBmaW5kaW5nCj4+PiBw
cmVlbXB0X2NvdW50KCkgdG8gcmV0dXJuIG5vbi16ZXJvPwo+Pgo+PiBUaGlzIGNhbiBiZSBkb25l
LCBidXQgdGhlbiB0aGUgbm9uLWRlYnVnIGJ1aWxkIHdvdWxkIHJlcXVpcmUgdG8gaGF2ZQo+PiBu
b24tZW1wdHkgcmN1IGxvY2sgZnVuY3Rpb25zLgo+IAo+IEkgZ3Vlc3MgSSBkb24ndCB1bmRlcnN0
YW5kIC0gSSBzZWUgb25seSBvbmUgdmVyc2lvbiBvZiB0aGVtOgo+IAo+ICNkZWZpbmUgcmN1X3Jl
YWRfbG9jayh4KSAgICAgICAoeyAoKHZvaWQpKHgpKTsgcHJlZW1wdF9kaXNhYmxlKCk7IH0pCj4g
I2RlZmluZSByY3VfcmVhZF91bmxvY2soeCkgICAgICh7ICgodm9pZCkoeCkpOyBwcmVlbXB0X2Vu
YWJsZSgpOyB9KQo+IAo+IFNhbWUgZm9yIHRoZSBwcmVlbXB0IGNvdW50IGFkanVzdG1lbnQgb3Bl
cmF0aW9ucy4KClNlZSBwYXRjaCA1LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
