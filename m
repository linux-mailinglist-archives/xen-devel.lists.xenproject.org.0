Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AFB4DDE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 14:33:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iACdb-0001fp-1C; Tue, 17 Sep 2019 12:31:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iACdZ-0001fY-IO
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 12:31:17 +0000
X-Inumbo-ID: 0a87dec5-d947-11e9-960a-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a87dec5-d947-11e9-960a-12813bfff9fa;
 Tue, 17 Sep 2019 12:31:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F0FE1000;
 Tue, 17 Sep 2019 05:31:15 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CD693F59C;
 Tue, 17 Sep 2019 05:31:12 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <osstest-141333-mainreport@xen.org>
 <5f71588b-274a-bdb7-d324-5ff9177a0490@arm.com>
 <ecb6672c-18e0-d949-9e2d-c340413c2c96@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9b1607d1-773a-f93c-a5fc-1f2ba2e74e84@arm.com>
Date: Tue, 17 Sep 2019 13:31:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ecb6672c-18e0-d949-9e2d-c340413c2c96@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] dom/xen heap and boot allocator (WAS Re:
 [xen-unstable-smoke test] 141333: regressions - FAIL)
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgSnVlcmdlbikKCkhpLAoKT24gOS8xNi8xOSA5OjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToK
PiBPbiAxNS4wOS4yMDE5IDE5OjUxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBP
biA5LzE1LzE5IDM6MDkgUE0sIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPj4+IGZsaWdo
dCAxNDEzMzMgeGVuLXVuc3RhYmxlLXNtb2tlIHJlYWwgW3JlYWxdCj4+PiBodHRwOi8vbG9ncy50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxMzMzLwo+Pj4KPj4+IFJlZ3Jl
c3Npb25zIDotKAo+Pj4KPj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJs
b2NraW5nLAo+Pj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4+PiAg
ICB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAg
ICBmYWlsIFJFR1IuIHZzLiAxNDEyNTMKPj4KPj4gT3NzdGVzdCBkb2VzIG5vdCBwcm92aWRlIHRo
ZSBzdGFjayB0cmFjZSBhcyB0aGUgY3Jhc2ggaGFwcGVuIGJlZm9yZSB0aGUKPj4gY29uc29sZSBp
cyBzZXR1cCwgYnV0IEkgbWFuYWdlZCB0byByZXByb2R1Y2UgaXQgbG9jYWxseToKPj4KPj4gKFhF
TikgQXNzZXJ0aW9uICdpc194ZW5faGVhcF9tZm4obWFkZHJfdG9fbWZuKG1hKSknIGZhaWxlZCBh
dAo+PiAvaG9tZS9qdWxpZW5nL3dvcmtzL3hlbi94ZW4vaW5jbHVkZS9hc20vbW0uaDoyNTAKPj4g
KFhFTikgLS0tLVsgWGVuLTQuMTMtdW5zdGFibGUgIGFybTMyICBkZWJ1Zz15ICAgTm90IHRhaW50
ZWQgXS0tLS0KPj4KPj4gWy4uLl0KPj4KPj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6Cj4+IChYRU4p
ICAgIFs8MDAyOTkyYzA+XSBwYWdlX2FsbG9jLmMjYm9vdG1lbV9yZWdpb25fYWRkKzB4ZjgvMHgx
N2MgKFBDKQo+PiAoWEVOKSAgICBbPDAwMjk5NWFjPl0gaW5pdF9ib290X3BhZ2VzKzB4OGMvMHgx
YTAgKExSKQo+PiAoWEVOKSAgICBbPDAwMjk5NWFjPl0gaW5pdF9ib290X3BhZ2VzKzB4OGMvMHgx
YTAKPj4gKFhFTikgICAgWzwwMDJhY2MyYz5dIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucysweDI2OC8w
eDI4NAo+PiAoWEVOKSAgICBbPDAwMmFkOGUwPl0gc3RhcnRfeGVuKzB4NWM4LzB4ZTkwCj4+IChY
RU4pICAgIFs8MDAyMDAwOTg+XSBhcm0zMi9oZWFkLm8jcHJpbWFyeV9zd2l0Y2hlZCsweDQvMHgx
MAo+Pgo+PiBUaGlzIGlzIGhhcHBlbmluZyBiZWNhdXNlIG9mIGNvbW1pdCA2ZTNlNzcxMjAzICJ4
ZW4vYXJtOiBzZXR1cDogUmVsb2NhdGUKPj4gdGhlIERldmljZS1UcmVlIGxhdGVyIG9uIGluIHRo
ZSBib290Ii4gU2luY2UgdGhpcyBwYXRjaCwgbm9uZSBvZiB4ZW5oZWFwCj4+IG1lbW9yeSBpcyBn
aXZlbiB0byB0aGUgYm9vdCBhbGxvY2F0b3IuCj4gCj4gU28gdGhpcyBjaGFuZ2Ugd2Fzbid0IHRl
c3RlZCBvbiAzMi1iaXQgQXJtIGF0IGFsbCB0aGVuIGJlZm9yZQo+IGNvbW1pdHRpbmc/CgpJIGZv
cmdvdCB0byB0ZXN0IGl0IGJlZm9yZSBzZW5kaW5nIHRoZSBwYXRjaCBvbiB0aGUgTUwgOiguCgo+
IAo+PiBUaGUgYm9vdCBhbGxvY2F0b3IgaXMgYm9vdHN0cmFwcGluZyBpdHNlbGYgYW5kIHJlLXVz
ZSBhIHBhZ2UgZnJvbSB0aGUKPj4gZmlyc3QgYWRkZWQgcmVnaW9uLiBJZiB0aGlzIHJlZ2lvbiBp
cyBub3QgYSB4ZW5oZWFwIHJlZ2lvbiwgdGhlbiBpdCB3aWxsCj4+IGNyYXNoIHdoZW4gY2FsbGlu
ZyBtZm5fdG9fdmlydCgpIG9yIGxhdGVyIG9uIGJlY2F1c2UgdGhlIHZpcnR1YWwgYWRkcmVzcwo+
PiBpcyBub3QgbWFwcGVkIGluIG1lbW9yeS4KPj4KPj4gVGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBi
b290IGFsbG9jYXRvciBpbiBwYWdlX2FsbG9jLmMgbGVhZHMgdG8gdGhpbmsKPj4gdGhhdCBvbmx5
IGRvbWhlYXAgbWVtb3J5IG1heSBiZSBnaXZlbiB0byB0aGUgYm9vdCBhbGxvY2F0b3IuCj4+Cj4+
IEZ1cnRoZXJtb3JlLCBhcyB0aGUgYm9vdCBhbGxvY2F0b3IgbWF5IGhhdmUgZG9taGVhcCBwYWdl
LCBpdCBtZWFucyB0aGF0Cj4+IGNhbGxpbmcgbWZuX3RvX3ZpcnQobWZuX3goYWxsb2NfYm9vdF9w
YWdlcyguLi4pKSBtYXkgbm90IHdvcmsgd2hlbgo+PiBDT05GSUdfU0VQQVJBVEVfWEVOSEVBUD15
Lgo+Pgo+PiBJdCBmZWVscyB0byBtZSB0aGF0IGltcG9zaW5nIHRvIGdpdmUgYSB4ZW5oZWFwIHBh
Z2UgdG8gdGhlIGJvb3QKPj4gYWxsb2NhdG9yIGlzIHF1aXRlIHVnbHkuIEFzIHRoZSBib290IGFs
bG9jYXRvciB3aWxsIGJlIHVzZWQgaW4gbW9zdCBvZgo+PiB0aGUgY2FzZSwgc3RhdGljYWxseSBh
bGxvY2F0aW5nIGJvb3RtZW1fcmVnaW9uX2xpc3QgbWF5YmUgdGhlIGJlc3QuIEFueQo+PiB0aG91
Z2h0cz8KPiAKPiBJJ3ZlIGdvbmUgYmFjayB0byA0LjIgY29kZSwgd2hlcmUgMzItYml0IHg4NiB3
YXMgc3RpbGwgc3VwcG9ydGVkLiBUaGVyZQo+IHdlIGhhZAo+IAo+ICNpZiBkZWZpbmVkKENPTkZJ
R19YODZfMzIpCj4gICAgICB4ZW5oZWFwX2luaXRpYWxfcGh5c19zdGFydCA9IChQRk5fVVAoX19w
YSgmX2VuZCkpICsgMSkgPDwgUEFHRV9TSElGVDsKPiAgICAgIC8qIE11c3QgcGFzcyBhIHNpbmds
ZSBtYXBwZWQgcGFnZSBmb3IgcG9wdWxhdGluZyBib290bWVtX3JlZ2lvbl9saXN0LiAqLwo+ICAg
ICAgaW5pdF9ib290X3BhZ2VzKF9fcGEoJl9lbmQpLCB4ZW5oZWFwX2luaXRpYWxfcGh5c19zdGFy
dCk7Cj4gICAgICB4ZW5oZWFwX3BoeXNfZW5kID0gRElSRUNUTUFQX01CWVRFUyA8PCAyMDsKPiAj
ZWxzZQoKSSBrbm93IHJlYWxpemUgd2UgaGFkIHNpbWlsYXIgY29tbWVudCBpbiB0aGUgYXJtMzIg
Y29kZToKCiJOZWVkIGEgc2luZ2xlIG1hcHBlZCBwYWdlIGZvciBwb3B1bGF0aW5nIGJvb3RtZW1f
cmVnaW9uX2xpc3QiCgo+IAo+IGkuZS4gaXQgd2FzIGNsZWFybHkgaW50ZW5kZWQgZm9yIHRoZSBm
aXJzdCB0aGluZyBnaXZlbiB0byB0aGUgYm9vdAo+IGFsbG9jYXRvciB0byBiZSBhIFhlbiBoZWFw
IHBhZ2UuCj4gCj4gQmV5b25kIHRoaXMgbm8geDg2IGNvZGUgdGhhdCB3YXNuJ3QgeDg2LTY0IHNw
ZWNpZmljIGRlcGVuZGVkIG9uIHRoZXJlCj4gb25seSBjb21pbmcgZGlyZWN0LW1hcHBlZCBtZW1v
cnkgYmFjayBvdXQgb2YgYWxsb2NfYm9vdF9wYWdlcygpLgo+IAo+IEJ1dCB5ZXMsIGEgc3RhdGlj
IGFsbG9jYXRpb24gbWF5IG1ha2Ugc2Vuc2UgKGFuZCB0aGVuIGFyZ3VhYmx5IGl0IG1heQo+IG5v
dCBldmVuIG5lZWQgdG8gYmUgYSBmdWxsIHBhZ2UpIC0gY29tbWl0IDA0MDllMjllMmIsIHdoaWNo
IGlzIHdoYXQKPiBoYWQgaW50cm9kdWNlZCBib290bWVtX3JlZ2lvbl9saXN0LCBkb2Vzbid0IChh
cyB3YXMgdGhlIGNvbW1vbiBjYXNlCj4gYmFjayB0aGVuKSBoYXZlIGFueSBkZXNjcmlwdGlvbiBh
dCBhbGwsIGkuZS4gdGhlcmUncyBubyB3YXkgdG8ga25vdwo+IHdoeSBpdCB3YXNuJ3QgZG9uZSB0
aGlzIHdheSBpbiB0aGUgZmlyc3QgcGxhY2UuCgpJdCBpcyBwcm9iYWJseSB0b28gbGF0ZSBmb3Ig
WGVuIDQuMTMgdG8gbW92ZSB0byBhIHN0YXRpYyBsaXN0IGZvciAKYm9vdG1lbV9yZWdpb25fbGlz
dCAoSnVlcmdlbj8pLCBzbyBJIGFtIHRoaW5raW5nIHRvIGZpeCB1cCB0aGUgYXJtMzIKY29kZSBp
bnN0ZWFkLgoKSSBjYW4gYWRkIHRoZSBjaGFuZ2UgZm9yIGJvb3RtZW1fcmVnaW9uX2xpc3QgaW4g
bXkgdG9kbyBsaXN0IGZvciBYZW4gNC4xNC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
