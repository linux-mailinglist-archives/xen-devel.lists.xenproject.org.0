Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2224DDFD7D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 08:04:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMnD7-0007Sy-2y; Tue, 22 Oct 2019 06:00:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jyZJ=YP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iMnD5-0007St-Ha
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 05:59:59 +0000
X-Inumbo-ID: 2bd3670a-f491-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bd3670a-f491-11e9-a531-bc764e2007e4;
 Tue, 22 Oct 2019 05:59:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF9FAB15F;
 Tue, 22 Oct 2019 05:59:54 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bef241e9-fdae-bb1d-506b-57c2a51d8577@suse.com>
Date: Tue, 22 Oct 2019 07:59:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMTkgMTE6NTEsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gV2hp
bGUgdGVzdGluZyBwdi1zaGltIGZyb20gYSBzbmFwc2hvdCBvZiBzdGFnaW5nIDQuMTMgYnJhbmNo
ICh3aXRoIGNvcmUtCj4gc2NoZWR1bGluZyBwYXRjaGVzIGFwcGxpZWQpLCBzb21lIHNvcnQgb2Yg
c2NoZWR1bGluZyBpc3N1ZXMgd2VyZSB1bmNvdmVyZWQKPiB3aGljaCB1c3VhbGx5IGxlYWRzIHRv
IGEgZ3Vlc3QgbG9ja3VwIChzb21ldGltZXMgd2l0aCBzb2Z0IGxvY2t1cCBtZXNzYWdlcwo+IGZy
b20gTGludXgga2VybmVsKS4KPiAKPiBUaGlzIGhhcHBlbnMgbW9yZSBmcmVxdWVudGx5IG9uIFNh
bmR5QnJpZGdlIENQVXMuIEFmdGVyIGVuYWJsaW5nCj4gQ09ORklHX0RFQlVHIGluIHB2LXNoaW0s
IHRoZSBmb2xsb3dpbmcgYXNzZXJ0aW9ucyBmYWlsZWQ6Cj4gCj4gTnVsbCBzY2hlZHVsZXI6Cj4g
Cj4gICAgICBBc3NlcnRpb24gJ2xvY2sgPT0gZ2V0X3NjaGVkX3JlcyhpLT5yZXMtPm1hc3Rlcl9j
cHUpLT5zY2hlZHVsZV9sb2NrJyBmYWlsZWQgYXQgLi4uYXJlL3hlbi1kaXIveGVuLXJvb3QveGVu
L2luY2x1ZGUveGVuL3NjaGVkLWlmLmg6Mjc4Cj4gICAgICAoZnVsbCBjcmFzaCBsb2c6IGh0dHBz
Oi8vcGFzdGUuZGViaWFuLm5ldC8xMTA4ODYxLyApCgpJIGd1ZXNzIHRoaXMgaXMgdGhlIGtub3du
IG51bGwgc2NoZWR1bGVyIGhvdHBsdWcgcHJvYmxlbT8KCj4gCj4gQ3JlZGl0MSBzY2hlZHVsZXI6
Cj4gCj4gICAgICBBc3NlcnRpb24gJ2NwdW1hc2tfY3ljbGUoY3B1LCB1bml0LT5jcHVfaGFyZF9h
ZmZpbml0eSkgPT0gY3B1JyBmYWlsZWQgYXQgc2NoZWRfY3JlZGl0LmM6MzgzCj4gICAgICAoZnVs
bCBjcmFzaCBsb2c6IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMTA4ODYyLyApCgpJIHRoaW5r
IHRoaXMgaXMgYSBidWcgaW4gY3JlZGl0IHNjaGVkdWxlcjoKCkluIGNzY2hlZF9hZmZfY250bCgp
IENTQ0hFRF9GTEFHX1VOSVRfUElOTkVEIHNob3VsZCBiZSBzZXQgb25seSBpbiBjYXNlCnRoZSBj
cHUgdGhlIGFmZmluaXR5IGlzIHNldCB0byBpcyBvbmxpbmUuIEFuIGFsdGVybmF0aXZlIG1pZ2h0
IGJlIHRvCmFkZCB0aGUgY29uZGl0aW9uIG9mIGFib3ZlIEFTU0VSVCgpIHRvIHRoZSBpZiAoKSBz
dGF0ZW1lbnQgZ3VhcmRpbmcgaXQKYW5kIGRyb3BwaW5nIHRoZSBBU1NFUlQoKS4KCkRhcmlvLCBH
ZW9yZ2U/CgpCZWZvcmUgbXkgcGF0Y2ggInhlbjogbGV0IHZjcHVfY3JlYXRlKCkgc2VsZWN0IHBy
b2Nlc3NvciIgaW4gcHYtc2hpbQp0aGUgaW5pdGlhbCBjcHUgb2YgYSB2Y3B1IHdvdWxkIGJlIHNl
dCB0byBhIG5vdCB5ZXQgb25saW5lIGNwdSwgd2hpY2gKZGlkIHdvcmsganVzdCBieSBjaGFuY2Uu
CgpTbyBhbm90aGVyIHBvc3NpYmlsaXR5IHdvdWxkIGJlIHRvIG1vZGlmeSBwdl9zaGltX2NwdV91
cCgpIHRvIGNhbGwgYSBuZXcKc2NoZWR1bGVyIGZ1bmN0aW9uIGRvaW5nIGFub3RoZXIgY3B1IGFz
c2lnbm1lbnQgYW5kIHRoZSB2Y3B1X3dha2UoKSBpZgpuZWVkZWQuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
