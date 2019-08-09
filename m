Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3ED87499
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 10:53:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw0ab-00028o-Ml; Fri, 09 Aug 2019 08:49:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw0aa-00028j-AU
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 08:49:32 +0000
X-Inumbo-ID: 99e79c3a-ba82-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 99e79c3a-ba82-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 08:49:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8E1DAF56;
 Fri,  9 Aug 2019 08:49:29 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <20190809083831.GA30839@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6e17b65-3d91-84fa-1831-571676503e2c@suse.com>
Date: Fri, 9 Aug 2019 10:49:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809083831.GA30839@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] Reset pass-thru devices in a VM
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxMDozOCwgQ2hhbyBHYW8gd3JvdGU6Cj4gSSBoYXZlIGEgZGV2aWNlIHdo
aWNoIG9ubHkgc3VwcG9ydHMgc2Vjb25kYXJ5IGJ1cyByZXNldC4gQWZ0ZXIgYmVpbmcKPiBhc3Np
Z25lZCB0byBhIFZNLCBpdCB3b3VsZCBiZSBwbGFjZWQgdW5kZXIgaG9zdCBicmlkZ2UuIEZvciBk
ZXZpY2VzCj4gdW5kZXIgaG9zdCBicmlkZ2UsIHNlY29uZGFyeSBidXMgcmVzZXQgaXMgbm90IGFw
cGxpY2FibGUuIFRodXMsIGEgVk0KPiBoYXMgbm8gd2F5IHRvIHJlc2V0IHRoaXMgZGV2aWNlLgo+
IAo+IFRoaXMgZGV2aWNlJ3MgdXNhZ2Ugd291bGQgYmUgbGltaXRlZCB3aXRob3V0IFBDSSByZXNl
dCAoZm9yIGV4YW1wbGUsIGl0cwo+IGRyaXZlciBjYW5ub3QgcmUtaW5pdGlhbGl6ZSB0aGUgZGV2
aWNlIHByb3Blcmx5IHdpdGhvdXQgUENJIHJlc2V0LCB3aGljaAo+IG1lYW5zIGluIFZNIGRldmlj
ZSB3b24ndCBiZSB1c2FibGUgYWZ0ZXIgdW5sb2FkaW5nIHRoZSBkcml2ZXIpLCBpdCB3b3VsZAo+
IGJlIG11Y2ggYmV0dGVyIGlmIHRoZXJlIGlzIGEgd2F5IGF2YWlsYWJsZSB0byBWTXMgdG8gcmVz
ZXQgdGhlIGRldmljZS4KPiAKPiBJbiBteSBtaW5kLCBhIHN0cmFpZ2h0Zm93YXJkIHNvbHV0aW9u
IGlzIHRvIGNyZWF0ZSBhIHZpcnR1YWwgYnJpZGdlCj4gZm9yIGEgVk0gYW5kIHBsYWNlIHRoZSBw
YXNzLXRocnUgZGV2aWNlIHVuZGVyIGEgdmlydHVhbCBicmlkZ2UuIEJ1dCBpdAo+IGlzbid0IHN1
cHBvcnRlZCBpbiBYZW4gKEtWTS9RRU1VIHN1cHBvcnRzKSBhbmQgZW5hYmxpbmcgaXQgbG9va3Mg
bmVlZAo+IGEgbG90IG9mIGVmZm9ydHMuCgpNZWFud2hpbGUgSSB0aGluayBhIGNvdXBsZSBvZiB5
ZWFycyBhZ28gdGhlcmUgd2FzIHNvbWUgaW5pdGlhbCBlZmZvcnQKdG8gZ2V0IGEgbmV3ZXIgY2hp
cHNldCAoUTM1IGlpcmMpIGVtdWxhdGVkIGZvciBIVk0gZ3Vlc3RzLgoKPiBBbHRlcm5hdGl2ZWx5
LCBlbXVsYXRpbmcgRkxSIChGdW5jdGlvbiBMZXZlbCBSZXNldCkKPiBjYXBhYmlsaXR5IGZvciB0
aGlzIGRldmljZSBtaWdodCBiZSBhIGZlYXNpYmxlIHdheSBhbmQgb25seSBuZWVkcwo+IHJlbGF0
aXZlbHkgZmV3IGNoYW5nZXMuIEkgYW0gcGxhbm5pbmcgdG8gZW5hYmxlIGFuIG9wdC1pbiBmZWF0
dXJlCj4gKGxpa2UgJ3Blcm1pc3NpdmUnKSB0byBhbGxvdyBxZW11IHRvIGV4cG9zZSBGTFIgY2Fw
YWJpbGl0eSB0byBndWVzdCBmb3IKPiBwYXNzLXRocnUgZGV2aWNlcyBhcyBsb25nIGFzIHRoaXMg
ZGV2aWNlIGlzIHJlc2V0YWJsZSBvbiBkb20wIChpLmUuIHRoZQo+IGRldmljZSBoYXMgJ3Jlc2V0
JyBhdHRyaWJ1dGUgdW5kZXIgaXRzIHN5c2ZzKS4gQW5kIHdoZW4gZ3Vlc3QgaW5pdGlhdGVzCj4g
YW4gRkxSLCBxZW11IGp1c3QgZWNobyAxIHRvIHRoZSAncmVzZXQnIGF0dHJpYnV0ZSBvbiBkb20w
Lgo+IAo+IERvIHlvdSB0aGluayBlbXVsYXRpbmcgRkxSIGNhcGFiaWxpdHkgaXMgZG9hYmxlPwoK
V291bGRuJ3QgYSBzdWNoIGVtdWxhdGVkIGd1ZXN0IGluaXRpYXRlZCByZXNldCBhZmZlY3Qgb3Ro
ZXIgZGV2aWNlcwoobGlrZWx5IG5vdCB1bmRlciBjb250cm9sIG9mIHRoaXMgZ3Vlc3QpIGFzIHdl
bGw/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
