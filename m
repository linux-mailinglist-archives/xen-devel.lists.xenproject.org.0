Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A28C0FA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 20:46:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxbm2-0003MC-Vc; Tue, 13 Aug 2019 18:43:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxbm2-0003M7-7v
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 18:43:58 +0000
X-Inumbo-ID: 4d75bb1a-bdfa-11e9-8f77-5f1b60b4d947
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4d75bb1a-bdfa-11e9-8f77-5f1b60b4d947;
 Tue, 13 Aug 2019 18:43:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD1061570;
 Tue, 13 Aug 2019 11:43:54 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAF5A3F706;
 Tue, 13 Aug 2019 11:43:53 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <bfcd8473-a73b-932c-3cdf-7ad41c14e4c0@arm.com>
 <6f44856f428c936f9c1913f3f35196dff6044509.camel@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fdbf9a17-acbf-3402-6b69-d1af0193df53@arm.com>
Date: Tue, 13 Aug 2019 19:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6f44856f428c936f9c1913f3f35196dff6044509.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA4LzEzLzE5IDY6MzQgUE0sIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFR1ZSwgMjAx
OS0wOC0xMyBhdCAxNzo1MiArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBEYXJpbywK
Pj4KPiBIZWxsbyEKPiAKPj4gT24gOC8xMy8xOSA0OjI3IFBNLCBEYXJpbyBGYWdnaW9saSB3cm90
ZToKPj4+IE9uIEZyaSwgMjAxOS0wOC0wOSBhdCAxMTozMCAtMDcwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+Pj4+Cj4+PiBJbiBteSAoeDg2IGFuZCAiZG9tMGZ1bGwiKSB0ZXN0Ym94LCB0
aGlzIHNlZW1zIHRvIGNvbWUgZnJvbQo+Pj4gZG9tYWluX3VucGF1c2VfYnlfc3lzdGVtY29udHJv
bGxlcihkb20wKSBjYWxsZWQgYnkKPj4+IHhlbi9hcmNoL3g4Ni9zZXR1cC5jOmluaXRfZG9uZSgp
LCBhdCB0aGUgdmVyeSBlbmQgb2YgX19zdGFydF94ZW4oKS4KPj4+Cj4+PiBJIGRvbid0IGtub3cg
aWYgZG9tYWluIGNvbnN0cnVjdGlvbiBpbiBhbiBBUk0gZG9tMGxlc3Mgc3lzdGVtIHdvcmtzCj4+
PiBzaW1pbGFybHksIHRob3VnaC4gV2hhdCB3ZSB3YW50LCBpcyBzb21lb25lIGNhbGxpbmcgZWl0
aGVyCj4+PiB2Y3B1X3dha2UoKQo+Pj4gb3IgdmNwdV91bnBhdXNlKCksIGFmdGVyIGhhdmluZyBj
bGVhcmVkIF9WUEZfZG93biBmcm9tIHBhdXNlX2ZsYWdzLgo+Pgo+PiBMb29raW5nIGF0IGNyZWF0
ZV9kb21VcygpIHRoZXJlIGlzIGEgY2FsbCB0bwo+PiBkb21haW5fdW5wYXVzZV9ieV9jb250cm9s
bGVyIGZvciBlYWNoIGRvbVVzLgo+Pgo+IFllcywgSSBzYXcgdGhhdC4gQW5kIEkndmUgc2VlbiB0
aGUgb25lIGRvbmUgZG9uIGRvbTAsIGF0IHRoZSBlbmQgb2YKPiB4ZW4vYXJjaC9hcm0vc2V0dXAu
YzpzdGFydF94ZW4oKSwgYXMgd2VsbC4KPiAKPiBBbHNvLCBib3RoIGNvbnN0cnVjdF9kb20wKCkg
KHN0aWxsIGZyb20gc3RhcnRfeGVuKCkpIGFuZAo+IGNvbnN0cnVjdF9kb21VKCkgKGNhbGxlZCBm
cm9tIGNyZWF0ZV9kb21VcygpKSBjYWxsIGNvbnN0cnVjdF9kb21haW4oKSwKPiB3aGljaCBkb2Vz
IGNsZWFyX2JpdChfVlBGX2Rvd24pLCBzZXR0aW5nIHRoZSBkb21haW4gdG8gb25saW5lLgo+IAo+
IFNvLCB1bmxlc3MgdGhlIGZsYWcgZ2V0cyBjbGVhcmVkIGFnYWluLCBvciBzb21ldGhpbmcgZWxz
ZSBoYXBwZW5zIHRoYXQKPiBtYWtlcyB0aGUgdkNQVShzKSBmYWlsIHRoZSB2Y3B1X3J1bm5hYmxl
KCkgY2hlY2sgaW4KPiBkb21haW5fdW5wYXVzZSgpLT52Y3B1X3dha2UoKSwgSSBkb24ndCBzZWUg
d2h5IHRoZSB3YWtldXAgdGhhdCBsZXQgdGhlCj4gbnVsbCBzY2hlZHVsZXIgc3RhcnQgc2NoZWR1
bGluZyB0aGUgdkNQVSBkb2Vzbid0IGhhcHBlbi4uLiBhcyBpdAo+IGluc3RlYWQgZG9lcyBvbiB4
ODYgb3IgIWRvbTBsZXNzIEFSTSAoYmVjYXVzZSwgYXMgZmFyIGFzIEkndmUKPiB1bmRlcnN0b29k
LCBpdCdzIG9ubHkgZG9tMGxlc3MgdGhhdCBkb2Vzbid0IHdvcmssIGl0IHRoaXMgY29ycmVjdD8p
CgpZZXMsIEkgcXVpY2tseSB0cmllZCB0byB1c2UgTlVMTCBzY2hlZHVsZXIgd2l0aCBqdXN0IGRv
bTAgYW5kIGl0IGJvb3RzLgoKSW50ZXJlc3RpbmdseSwgSSBjYW4ndCBzZWUgdGhlIGxvZzoKCihY
RU4pIEZyZWVkIDMyOGtCIGluaXQgbWVtb3J5LgoKVGhpcyBpcyBjYWxsZWQgYXMgcGFydCBvZiBp
bml0X2RvbmUgYmVmb3JlIENQVTAgZ29lcyBpbnRvIHRoZSBpZGxlIGxvb3AuCgpBZGRpbmcgbW9y
ZSBkZWJ1ZywgaXQgaXMgZ2V0dGluZyBzdHVjayB3aGVuIGNhbGxpbmcgCmRvbWFpbl91bnBhdXNl
X2J5X2NvbnRyb2xsZXIgZm9yIGRvbTAuIFNwZWNpZmljYWxseSB2Y3B1X3dha2Ugb24gZG9tMHYw
LgoKVGhlIGxvb3AgdG8gYXNzaWduIGEgcENQVSBpbiBudWxsX3ZjcHVfd2FrZSgpIGlzIHR1cm5p
bmcgaW50byBhbiAKaW5maW5pdGUgbG9vcC4gSW5kZWVkIHRoZSBsb29wIGlzIHRyeWluZyB0byBw
aWNrIENQVTAgZm9yIGRvbTB2MCB0aGF0IGlzIAphbHJlYWR5IHVzZWQgYnkgZG9tMXYwLiBTbyB0
aGUgcHJvYmxlbSBpcyBpbiBwaWNrX2NwdSgpIG9yIHRoZSBkYXRhIHVzZWQgCmJ5IGl0LgoKSXQg
ZmVlbHMgdG8gbWUgdGhpcyBpcyBhbiBhZmZpbml0eSBwcm9ibGVtLiBOb3RlIHRoYXQgSSBkaWRu
J3QgcmVxdWVzdCAKdG8gcGluIGRvbTAgdkNQVXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
