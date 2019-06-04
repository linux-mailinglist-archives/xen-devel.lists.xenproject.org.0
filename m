Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0D34294
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 11:04:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY5Jj-00060J-2D; Tue, 04 Jun 2019 09:01:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY5Jg-0005zm-Rs
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 09:01:12 +0000
X-Inumbo-ID: 4c8d2c80-86a7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4c8d2c80-86a7-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 09:01:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29CCBA78;
 Tue,  4 Jun 2019 02:01:11 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5E3F3F246;
 Tue,  4 Jun 2019 02:01:08 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
Date: Tue, 4 Jun 2019 10:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNi80LzE5IDg6MDYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAz
LjA2LjE5IGF0IDE5OjE1LCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9u
IFR1ZSwgTWF5IDIxLCAyMDE5IGF0IDA1OjUyOjEyUE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4+IFRoZSBzYW1lIGVycm9yIGNhbm5vdCBiZSByZXByb2R1Y2VkIG9uIGxheHRvbiouIExv
b2tpbmcgYXQgdGhlIHRlc3QgaGlzdG9yeSwKPj4+IGl0IGxvb2tzIGxpa2UgcWVtdS11cHN0cmVh
bS00LjEyLXRlc3RpbmcgZmxpZ2h0IGhhcyBydW4gc3VjY2Vzc2Z1bGx5IGEgZmV3Cj4+PiB0aW1l
cyBvbiByb2NoZXN0ZXIqLiBTbyB3ZSBtYXkgaGF2ZSBmaXhlZCB0aGUgZXJyb3IgaW4gWGVuIDQu
MTIuCj4+Pgo+Pj4gUG90ZW50aWFsIGNhbmRpZGF0ZXMgd291bGQgYmU6Cj4+PiAgICAgLSAwMGM5
NmQ3NzQyICJ4ZW4vYXJtOiBtbTogU2V0LXVwIHBhZ2UgcGVybWlzc2lvbiBmb3IgWGVuIG1hcHBp
bmdzIGVhcmxpZXIgb24iCj4+PiAgICAgLSBmNjA2NThjNmFlICJ4ZW4vYXJtOiBTdG9wIHJlbG9j
YXRpbmcgWGVuIgo+Pj4KPj4+IElhbiwgaXMgaXQgc29tZXRoaW5nIHRoZSBiaXNlY3RvciBjb3Vs
ZCBhdXRvbWF0aWNhbGx5IGxvb2sgYXQ/Cj4+PiBJZiBub3QsIEkgd2lsbCBuZWVkIHRvIGZpbmQg
c29tZSB0aW1lIGFuZCBib3Jyb3cgdGhlIGJvYXJkIHRvIGJpc2VjdCB0aGUKPj4+IGlzc3Vlcy4K
Pj4KPj4gSSBhdHRlbXB0ZWQgdG8gZG8gdGhhdCBiaXNlY3Rpb24gbXlzZWxmLCBhbmQgdGhlIGZp
cnN0IGNvbW1pdCB0aGF0IGdpdAo+PiB3YW50ZWQgdG8gdHJ5LCBhIGNvbW1vbiBjb21taXQgdG8g
Ym90aCBicmFuY2hlcywgYm9vdHMganVzdCBmaW5lLgo+IAo+IFRoYW5rcyBmb3IgZG9pbmcgdGhp
cyEKPiAKPiBPbmUgdGhpbmcgdGhhdCwgZm9yIG5vdywgY29tcGxldGVseSBlc2NhcGVzIG1lOiBI
b3cgY29tZSB0aGUKPiBtYWluIDQuMTEgYnJhbmNoIGhhcyBwcm9ncmVzc2VkIGZpbmUsIGJ1dCB0
aGUgcWVtdXUgb25lIGhhcwo+IGdvdCBzdGFsbGVkIGxpa2UgdGhpcz8KCkJlY2F1c2UgWGVuIG9u
IEFybSB0b2RheSBkb2VzIG5vdCBmdWxseSByZXNwZWN0IHRoZSBBcm0gQXJtIHdoZW4gCm1vZGlm
eWluZyB0aGUgcGFnZS10YWJsZXMuIFRoaXMgbWF5IHJlc3VsdCB0byBUTEIgY29uZmxpY3QgYW5k
IGJyZWFrIG9mIApjb2hlcmVuY3kuCgo+IAo+PiBJdCB0dXJucyBvdXQgdGhhdCB0aGUgZmlyc3Qg
Y29tbWl0IHRoYXQgZmFpbHMgdG8gYm9vdCBvbiByb2NoZXN0ZXIgaXMKPj4gICAgZTIwMmZlYjcx
MyB4ZW4vY21kbGluZTogRml4IGJ1Z2d5IHN0cm5jbXAocywgTElURVJBTCwgc3MgLSBzKSBjb25z
dHJ1Y3QKPj4gKGV2ZW4gd2l0aCB0aGUgImViOGFjYmE4MmEgeGVuOiBGaXggYmFja3BvcnQgb2Yg
Li4iIGFwcGxpZWQpCj4gCj4gTm93IHRoYXQncyBwYXJ0aWN1bGFybHkgb2RkIGEgcmVncmVzc2lv
biBjYW5kaWRhdGUuIEl0IGRvZXNuJ3QKPiB0b3VjaCBhbnkgQXJtIGNvZGUgYXQgYWxsIChub3Ig
ZG9lcyB0aGUgZml4dXAgY29tbWl0KS4gQW5kIHRoZQo+IGNvbW1vbiBjb2RlIGNoYW5nZXMgZG9u
J3QgbG9vayAicmlza3kiIGVpdGhlcjsgdGhlIG9uZSB0aGluZyB0aGF0Cj4ganVtcHMgb3V0IGFz
IHRoZSBtb3N0IGxpa2VseSBvZiBhbGwgdGhlIHVubGlrZWx5IGNhbmRpZGF0ZXMgd291bGQKPiBz
ZWVtIHRvIGJlIHRoZSB4ZW4vY29tbW9uL2VmaS9ib290LmMgY2hhbmdlLCBidXQgaWYgdGhlcmUg
d2FzCj4gYSBwcm9ibGVtIHRoZXJlIHRoZW4gdGhlIEVGSSBib290IG9uIEFybSB3b3VsZCBiZSBs
YXRlbnRseQo+IGJyb2tlbiBpbiBvdGhlciB3YXlzIGFzIHdlbGwuIFBsdXMsIG9mIGNvdXJzZSwg
eW91IHNheSB0aGF0IHRoZQo+IHNhbWUgY2hhbmdlIGlzIG5vIHByb2JsZW0gb24gNC4xMi4KPiAK
PiBPZiBjb3Vyc2UgdGhlIGNvbW1pdCBpdHNlbGYgY291bGQgYmUgZnVydGhlciAiYmlzZWN0ZWQi
IC0gYWxsCj4gY2hhbmdlcyBvdGhlciB0aGFuIHRoZSBpbnRyb2R1Y3Rpb24gb2YgY21kbGluZV9z
dHJjbXAoKSBhcmUKPiBjb21wbGV0ZWx5IGluZGVwZW5kZW50IG9mIG9uZSBhbm90aGVyLgoKSSB0
aGluayB0aGlzIGlzIGp1c3QgYSByZWQtaGVycmluZy4gVGhlIGNvbW1pdCBpcyBwcm9iYWJseSBt
b2RpZnlpbmcgCmVub3VnaCB0aGUgbGF5b3V0IG9mIFhlbiB0aGF0IFRMQiBjb25mbGljdCB3aWxs
IGFwcGVhci4KCkFudGhvbnkgc2FpZCBiYWNrcG9ydGluZyAwMGM5NmQ3NzQyICJ4ZW4vYXJtOiBt
bTogU2V0LXVwIHBhZ2UgcGVybWlzc2lvbiAKZm9yIFhlbiBtYXBwaW5ncyBlYXJsaWVyIG9uIiBt
YWtlcyBzdGFnaW5nLTQuMTEgYm9vdHMuIFRoaXMgcGF0Y2ggCnJlbW92ZXMgc29tZSBvZiB0aGUg
cG90ZW50aWFsIGNhdXNlIG9mIFRMQiBjb25mbGljdC4KCkkgaGF2ZW4ndCBzdWdnZXN0ZWQgYSBi
YWNrcG9ydCBvZiB0aGlzIHBhdGNoIHNvIGZhciwgYmVjYXVzZSB0aGVyZSBhcmUgCnN0aWxsIFRM
QiBjb25mbGljdCBwb3NzaWJsZSB3aXRoaW4gdGhlIGZ1bmN0aW9uIG1vZGlmaWVkLiBJdCBtaWdo
dCBhbHNvIApiZSBwb3NzaWJsZSB0aGF0IGl0IGV4cG9zZXMgbW9yZSBvZiBUTEIgY29uZmxpY3Qg
YXMgbW9yZSB3b3JrIGluIFhlbiBpcyAKbmVlZGVkIChzZWUgbXkgTU0tUEFSVG4gc2VyaWVzKS4K
CkkgZG9uJ3Qga25vdyB3aGV0aGVyIGJhY2twb3J0aW5nIHRoaXMgcGF0Y2ggaXMgd29ydGggaXQg
Y29tcGFyZSB0byB0aGUgCnJpc2sgaXQgaW50cm9kdWNlcy4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
