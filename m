Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2E136BC1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 12:12:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipsAk-0006uG-W8; Fri, 10 Jan 2020 11:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipsAj-0006u9-NH
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 11:09:45 +0000
X-Inumbo-ID: b00838f6-3399-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b00838f6-3399-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 11:09:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57507AB9D;
 Fri, 10 Jan 2020 11:09:35 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6086e6b5-167e-dd53-e179-27c5dfda6e09@suse.com>
Date: Fri, 10 Jan 2020 12:09:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200110103723.29538-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDEuMjAyMCAxMTozNywgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiAtLS0gYS90b29scy9m
aXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jCj4gKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVy
L3V0aWwuYwo+IEBAIC05OTUsNiArOTk1LDEyIEBAIHZvaWQgaHZtbG9hZGVyX2FjcGlfYnVpbGRf
dGFibGVzKHN0cnVjdCBhY3BpX2NvbmZpZyAqY29uZmlnLAo+ICAgICAgaHZtX3BhcmFtX3NldChI
Vk1fUEFSQU1fVk1fR0VORVJBVElPTl9JRF9BRERSLCBjb25maWctPnZtX2dpZF9hZGRyKTsKPiAg
fQo+ICAKPiArdm9pZCB4c21fZmlsdGVyX2RlbmllZChjaGFyICpzdHIsIHNpemVfdCBsZW4pCj4g
K3sKPiArICAgIGlmICggc3RyY21wKHN0ciwgIjxkZW5pZWQ+IikgPT0gMCApCj4gKyAgICAgICAg
bWVtc2V0KHN0ciwgMCwgbGVuKTsKPiArfQoKSSB0aGluayB5b3UgY2FuIGdldCBhd2F5IHdpdGhv
dXQgcGFzc2luZyBpbiAibGVuIjoKCnZvaWQgeHNtX2ZpbHRlcl9kZW5pZWQoY2hhciAqc3RyLCBz
aXplX3QgbGVuKQp7CiAgICBpZiAoIHN0cmNtcChzdHIsICI8ZGVuaWVkPiIpID09IDAgKQogICAg
ICAgICpzdHIgPSAwOwp9CgpBbnkgcmVhc29uIHlvdSB0aGluayB5b3UgbmVlZCB0byB6YXAgdGhl
IGVudGlyZSBidWZmZXI/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oCj4gKysrIGIv
eGVuL2luY2x1ZGUveHNtL2R1bW15LmgKPiBAQCAtNzUwLDE0ICs3NTAsMTcgQEAgc3RhdGljIFhT
TV9JTkxJTkUgaW50IHhzbV94ZW5fdmVyc2lvbiAoWFNNX0RFRkFVTFRfQVJHIHVpbnQzMl90IG9w
KQo+ICAgICAgY2FzZSBYRU5WRVJfZ2V0X2ZlYXR1cmVzOgo+ICAgICAgICAgIC8qIFRoZXNlIHN1
Yi1vcHMgaWdub3JlIHRoZSBwZXJtaXNzaW9uIGNoZWNrcyBhbmQgcmV0dXJuIGRhdGEuICovCj4g
ICAgICAgICAgcmV0dXJuIDA7Cj4gLSAgICBjYXNlIFhFTlZFUl9leHRyYXZlcnNpb246CgpDb3Vs
ZCB5b3UgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gYWRkIHRoZSBtaXNzaW5nIGJsYW5r
CmxpbmUgaGVyZSwganVzdCBsaWtlIHlvdSBkbyBiZWxvdz8KCj4gLSAgICBjYXNlIFhFTlZFUl9j
b21waWxlX2luZm86Cj4gICAgICBjYXNlIFhFTlZFUl9jYXBhYmlsaXRpZXM6Cj4gLSAgICBjYXNl
IFhFTlZFUl9jaGFuZ2VzZXQ6Cj4gICAgICBjYXNlIFhFTlZFUl9wYWdlc2l6ZToKPiAgICAgIGNh
c2UgWEVOVkVSX2d1ZXN0X2hhbmRsZToKPiAgICAgICAgICAvKiBUaGVzZSBNVVNUIGFsd2F5cyBi
ZSBhY2Nlc3NpYmxlIHRvIGFueSBndWVzdCBieSBkZWZhdWx0LiAqLwo+ICAgICAgICAgIHJldHVy
biB4c21fZGVmYXVsdF9hY3Rpb24oWFNNX0hPT0ssIGN1cnJlbnQtPmRvbWFpbiwgTlVMTCk7Cj4g
Kwo+ICsgICAgY2FzZSBYRU5WRVJfZXh0cmF2ZXJzaW9uOgo+ICsgICAgY2FzZSBYRU5WRVJfY29t
cGlsZV9pbmZvOgo+ICsgICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0Ogo+ICsgICAgY2FzZSBYRU5W
RVJfY29tbWFuZGxpbmU6Cj4gKyAgICBjYXNlIFhFTlZFUl9idWlsZF9pZDoKPiAgICAgIGRlZmF1
bHQ6Cj4gICAgICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihYU01fUFJJViwgY3VycmVu
dC0+ZG9tYWluLCBOVUxMKTsKCkkgY29udGludWUgdG8gbm90IHNlZSB0aGUgbmVlZCB0byBoYXZl
ICJkZWZhdWx0OiIgYWNjb21wYW5pZWQgYnkKdmFyaW91cyBzcGVjaWZpYyBjYXNlIGxhYmVscy4g
SSBkb24ndCB0aGluayB3ZSBkbyBzbyBlbHNld2hlcmUuCkFuZCBpZiB5b3UgZG8sICJkZWZhdWx0
OiIgc2hvdWxkIGdhaW4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgaW1vLiBJCmFsc28gcmVtYWluIHVu
Y29udmluY2VkIG9mIHRoZSB2ZXJ5IGJyaWVmIHJlYXNvbmluZyAtIGFzIGluZGljYXRlZApiZWZv
cmUsIGl0IHdvdWxkIHNlZW0gYXQgbGVhc3QgZGVzaXJhYmxlIHRvIG1lIHRvIGRpc2N1c3Mgd2h5
IHRoZQpwcmV2aW91cyBkZWNpc2lvbiB3YXMgd3JvbmcgKGlpcmMgdGhlIGltcGxpY2F0aW9uIGJh
Y2sgdGhlbiB3YXMKdGhhdCBhbnlvbmUgd2FudGluZyB0byB0aWdodGVuIHRoaXMgd291bGQgYmUg
c3VwcG9zZWQgdG8gdXNlIGEKcmVzcGVjdGl2ZSBYU00gcG9saWN5KS4KCkluIGFueSBldmVudCAt
IGlmIHRoZSBodm1sb2FkZXIgY2hhbmdlIHdhcyBzdWJtaXR0ZWQgYXMgYSBzZXBhcmF0ZQpwYXRj
aCwgSSdkIGFjayBpdCB3aXRoIHRoZSBjaGFuZ2Ugc3VnZ2VzdGVkIChvciBhIHN1aXRhYmxlIHZl
cmJhbApjbGFyaWZpY2F0aW9uIGluIHJlcGx5IHRvIG15IHJlbWFyayBhYm92ZSkuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
