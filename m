Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F034307
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 11:20:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY5ZU-0007Eq-5T; Tue, 04 Jun 2019 09:17:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY5ZS-0007El-FT
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 09:17:30 +0000
X-Inumbo-ID: 930a9834-86a9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 930a9834-86a9-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 09:17:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 03:17:28 -0600
Message-Id: <5CF637250200007800234EFB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 03:17:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
In-Reply-To: <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDExOjAxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvNC8xOSA4OjA2IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDMuMDYuMTkg
YXQgMTk6MTUsIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90ZToKPj4+IEl0IHR1cm5z
IG91dCB0aGF0IHRoZSBmaXJzdCBjb21taXQgdGhhdCBmYWlscyB0byBib290IG9uIHJvY2hlc3Rl
ciBpcwo+Pj4gICAgZTIwMmZlYjcxMyB4ZW4vY21kbGluZTogRml4IGJ1Z2d5IHN0cm5jbXAocywg
TElURVJBTCwgc3MgLSBzKSBjb25zdHJ1Y3QKPj4+IChldmVuIHdpdGggdGhlICJlYjhhY2JhODJh
IHhlbjogRml4IGJhY2twb3J0IG9mIC4uIiBhcHBsaWVkKQo+PiAKPj4gTm93IHRoYXQncyBwYXJ0
aWN1bGFybHkgb2RkIGEgcmVncmVzc2lvbiBjYW5kaWRhdGUuIEl0IGRvZXNuJ3QKPj4gdG91Y2gg
YW55IEFybSBjb2RlIGF0IGFsbCAobm9yIGRvZXMgdGhlIGZpeHVwIGNvbW1pdCkuIEFuZCB0aGUK
Pj4gY29tbW9uIGNvZGUgY2hhbmdlcyBkb24ndCBsb29rICJyaXNreSIgZWl0aGVyOyB0aGUgb25l
IHRoaW5nIHRoYXQKPj4ganVtcHMgb3V0IGFzIHRoZSBtb3N0IGxpa2VseSBvZiBhbGwgdGhlIHVu
bGlrZWx5IGNhbmRpZGF0ZXMgd291bGQKPj4gc2VlbSB0byBiZSB0aGUgeGVuL2NvbW1vbi9lZmkv
Ym9vdC5jIGNoYW5nZSwgYnV0IGlmIHRoZXJlIHdhcwo+PiBhIHByb2JsZW0gdGhlcmUgdGhlbiB0
aGUgRUZJIGJvb3Qgb24gQXJtIHdvdWxkIGJlIGxhdGVudGx5Cj4+IGJyb2tlbiBpbiBvdGhlciB3
YXlzIGFzIHdlbGwuIFBsdXMsIG9mIGNvdXJzZSwgeW91IHNheSB0aGF0IHRoZQo+PiBzYW1lIGNo
YW5nZSBpcyBubyBwcm9ibGVtIG9uIDQuMTIuCj4+IAo+PiBPZiBjb3Vyc2UgdGhlIGNvbW1pdCBp
dHNlbGYgY291bGQgYmUgZnVydGhlciAiYmlzZWN0ZWQiIC0gYWxsCj4+IGNoYW5nZXMgb3RoZXIg
dGhhbiB0aGUgaW50cm9kdWN0aW9uIG9mIGNtZGxpbmVfc3RyY21wKCkgYXJlCj4+IGNvbXBsZXRl
bHkgaW5kZXBlbmRlbnQgb2Ygb25lIGFub3RoZXIuCj4gCj4gSSB0aGluayB0aGlzIGlzIGp1c3Qg
YSByZWQtaGVycmluZy4gVGhlIGNvbW1pdCBpcyBwcm9iYWJseSBtb2RpZnlpbmcgCj4gZW5vdWdo
IHRoZSBsYXlvdXQgb2YgWGVuIHRoYXQgVExCIGNvbmZsaWN0IHdpbGwgYXBwZWFyLgo+IAo+IEFu
dGhvbnkgc2FpZCBiYWNrcG9ydGluZyAwMGM5NmQ3NzQyICJ4ZW4vYXJtOiBtbTogU2V0LXVwIHBh
Z2UgcGVybWlzc2lvbiAKPiBmb3IgWGVuIG1hcHBpbmdzIGVhcmxpZXIgb24iIG1ha2VzIHN0YWdp
bmctNC4xMSBib290cy4gVGhpcyBwYXRjaCAKPiByZW1vdmVzIHNvbWUgb2YgdGhlIHBvdGVudGlh
bCBjYXVzZSBvZiBUTEIgY29uZmxpY3QuCj4gCj4gSSBoYXZlbid0IHN1Z2dlc3RlZCBhIGJhY2tw
b3J0IG9mIHRoaXMgcGF0Y2ggc28gZmFyLCBiZWNhdXNlIHRoZXJlIGFyZSAKPiBzdGlsbCBUTEIg
Y29uZmxpY3QgcG9zc2libGUgd2l0aGluIHRoZSBmdW5jdGlvbiBtb2RpZmllZC4gSXQgbWlnaHQg
YWxzbyAKPiBiZSBwb3NzaWJsZSB0aGF0IGl0IGV4cG9zZXMgbW9yZSBvZiBUTEIgY29uZmxpY3Qg
YXMgbW9yZSB3b3JrIGluIFhlbiBpcyAKPiBuZWVkZWQgKHNlZSBteSBNTS1QQVJUbiBzZXJpZXMp
Lgo+IAo+IEkgZG9uJ3Qga25vdyB3aGV0aGVyIGJhY2twb3J0aW5nIHRoaXMgcGF0Y2ggaXMgd29y
dGggaXQgY29tcGFyZSB0byB0aGUgCj4gcmlzayBpdCBpbnRyb2R1Y2VzLgoKV2VsbCwgaWYgeW91
IGRvbid0IGJhY2twb3J0IHRoaXMsIHdoYXQncyB0aGUgYWx0ZXJuYXRpdmUgcm9hZCB0b3dhcmRz
IGEKc29sdXRpb24gaGVyZT8gSSdtIGFmcmFpZCB0aGUgdHdvIG9mIHlvdSB3aWxsIG5lZWQgdG8g
ZGVjaWRlIG9uZSB3YXkgb3IKYW5vdGhlci4KCkluIGFueSBldmVudCB0aGlzIHNvdW5kcyB0byBt
ZSBhcyBpZiBhIHNpbWlsYXIgcHJvYmxlbSBjb3VsZCBhcHBlYXIgYXQKYW55IHRpbWUgb24gYW55
IGJyYW5jaC4gTm90IGEgdmVyeSBuaWNlIHN0YXRlIHRvIGJlIGluIC4uLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
