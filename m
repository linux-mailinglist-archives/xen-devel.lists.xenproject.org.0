Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83444CB80
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 12:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdtsJ-0004d2-B2; Thu, 20 Jun 2019 10:00:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Q6/=UT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdtsI-0004cv-68
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 10:00:58 +0000
X-Inumbo-ID: 49538ca2-9342-11e9-856a-f37022c63da5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 49538ca2-9342-11e9-856a-f37022c63da5;
 Thu, 20 Jun 2019 10:00:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC5B0360;
 Thu, 20 Jun 2019 03:00:51 -0700 (PDT)
Received: from [10.37.9.222] (unknown [10.37.9.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FDD83F246;
 Thu, 20 Jun 2019 03:00:50 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906191422170.2072@sstabellini-ThinkPad-T480s>
 <a29aa125-bb95-d178-0f74-0804d8ad6f91@arm.com>
 <alpine.DEB.2.21.1906191446280.2072@sstabellini-ThinkPad-T480s>
 <ff241dfa-fb0e-63d6-f345-f80afb6a6035@arm.com>
 <alpine.DEB.2.21.1906191458230.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8e46a72a-de53-48d2-6801-d561a40bddce@arm.com>
Date: Thu, 20 Jun 2019 11:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906191458230.2072@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: fix build after 2e35cdf
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
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 JBeulich@suse.com, andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMTkvMTkgMTE6MDQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDE5IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDYvMTkv
MTkgMTA6NDcgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFdlZCwgMTkgSnVu
IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSBTdGVmYW5vLAo+Pj4+Cj4+Pj4gVGl0
bGU6IFlvdSBzaG91bGQgYXQgbGVhc3QgbWVudGlvbiB0aGlzIGlzIGZvciBvcC10ZWUuCj4+Pj4K
Pj4+PiBBbHNvLCBtb3N0bHkgbGlrZWx5IHRoZSBzaGExIGlzIHRvbyBzbWFsbCBhbmQgbGlrZWx5
IHRvIG1hdGNoIG11bHRpcGxlCj4+Pj4gY29tbWl0Cj4+Pj4gaW4gdGhlIGZ1dHVyZS4gU28geW91
IHdhbnQgdG8gc3BlY2lmeSB0aGUgdGl0bGUgb2YgdGhlIGNvbW1pdC4KPj4+Pgo+Pj4+IE9uIDYv
MTkvMTkgMTA6MjQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4gT3B0ZWUgYnJl
YWtzIHRoZSBidWlsZCB3aXRoOgo+Pj4+Pgo+Pj4+PiBvcHRlZS5jOiBJbiBmdW5jdGlvbiDigJh0
cmFuc2xhdGVfbm9uY29udGlnLmlzcmEuNOKAmToKPj4+Pj4gb3B0ZWUuYzo3NDM6Mzg6IGVycm9y
OiDigJh4ZW5fZGF0YeKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMKPj4+Pj4g
ZnVuY3Rpb24KPj4+Pj4gWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZF0KPj4+Pj4gICAgICAg
ICAgICAgICAgIHhlbl9kYXRhLT5uZXh0X3BhZ2VfZGF0YSA9IHBhZ2VfdG9fbWFkZHIoeGVuX3Bn
cyArIDEpOwo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
Pj4+Pj4gb3B0ZWUuYzo3MzI6NzE6IGVycm9yOiDigJhndWVzdF9kYXRh4oCZIG1heSBiZSB1c2Vk
IHVuaW5pdGlhbGl6ZWQgaW4gdGhpcwo+Pj4+PiBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmlu
aXRpYWxpemVkXQo+Pj4+PiAgICAgICAgICAgICBwYWdlID0KPj4+Pj4gZ2V0X2RvbWFpbl9yYW1f
cGFnZShnYWRkcl90b19nZm4oZ3Vlc3RfZGF0YS0+cGFnZXNfbGlzdFtpZHhdKSk7Cj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXgo+Pj4+PiBvcHRlZS5jOjc1MDoyMTogZXJyb3I6IOKAmGd1ZXN0X3Bn
4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcwo+Pj4+PiBmdW5jdGlvbgo+Pj4+
PiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQo+Pj4+PiAgICAgICAgICAgICAgICAgcHV0
X3BhZ2UoZ3Vlc3RfcGcpOwo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBeCj4+Pj4+IGNj
MTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4+Pj4+Cj4+Pj4+IEZpeCBp
dCBieSBpbml0aWFsaXppbmcgeGVuX2RhdGEsIGd1ZXN0X2RhdGEsIGd1ZXN0X3BnIHRvIE5VTEwu
IEFsc28gc2V0Cj4+Pj4+IHhlbl9wZ3MgdG8gTlVMTCBmb3IgY29uc2lzdGVuY3kuCj4+Pj4KPj4+
PiBXaXRob3V0IG1vcmUgZXhwbGFuYXRpb24gSSB0aGluayB0aGlzIGlzIGFuIHVud2lzZSBjaG9p
Y2UuIElmIEdDQyB0aGlua3MKPj4+PiBpdCBpcwo+Pj4+IGdvaW5nIHRvIGJlIHVzZWQgdW5pdGlh
bGl6ZWQsIHRoZW4gbW9zdGx5IGxpa2VseSB5b3Ugc2lsZW50IGFuIGVycm9yIHRoYXQKPj4+PiBj
b3VsZCBlbmQgdXAgdG8gZGVyZWZlcmVuY2UgTlVMTC4KPj4+Pgo+Pj4+IEFsc28sIHNldHRpbmcg
eGVuX3BncyBmb3IgY29uc2lzdGVuY3kgd2lsbCBvbmx5IGRlZmVhdCB0aGUgY29tcGlsZXIuCj4+
Pj4gTGVhZGluZwo+Pj4+IHRvIGRlcmVmZXJlbmNpbmcgTlVMTCBhbmQgY3Jhc2ggWGVuLi4uCj4+
Pj4KPj4+PiBGb3IgeGVuX3BncywgdGhpcyBzaG91bGQgZGVmaW5pdGVseSBub3QgYmUgTlVMTC4g
Rm9yIHRoZSB0d28gb3RoZXJzLCB5b3UKPj4+PiBuZWVkCj4+Pj4gdG8gZXhwbGFpbiB3aHkgdGhp
cyBpcyBmaW5lIChpZiB0aGlzIGlzIGp1c3QgYmVjYXVzZSB0aGUgY29tcGlsZXIgY2FuJ3QKPj4+
PiBmaW5kCj4+Pj4gdGhlIHJlYXNvbiwgdGhlbiB5b3Ugc2hvdWxkIGFkZCBhIGNvbW1lbnQgaW4g
dGhlIGNvZGUgdG8gZXhwbGFpbiBpdCkuCj4+Pgo+Pj4gSSB3YXMgb25seSB0cnlpbmcgdG8gdW5i
bG9jayB0aGUgYnVpbGQuCj4+Cj4+IFNvPyBXZSBkb24ndCBzaWxlbmNlIGEgY29tcGlsZXIgd2Fy
bmluZyBqdXN0IGZvciB1bmJsb2NraW5nIHRoZSBidWlsZCB3aXRob3V0Cj4+IGFueSBwcm9wZXIg
aW52ZXN0aWdhdGlvbi4gRGlkbid0IHlvdSBkbyB0aGF0IGJlZm9yZSBhZGRpbmcgdGhlIE5VTEw/
Cj4gCj4gTm8gSSBkaWRuJ3QuIEJ1dCBhY3R1YWxseSwgSSB0aG91Z2h0IHdlIGRpZCB1bmJyZWFr
IGEgYnVpbGQgYXMgcXVpY2tseQo+IGFzIHBvc3NpYmxlIGV2ZW4gd2l0aG91dCBhIGZ1bGwgZml4
IGluIHRoZSBwYXN0LiAKCkFuZCB3aG8gaXMgZ29pbmcgdG8gZG8gdGhlIGZvbGxvdy11cD8gQUZB
SUNULCB5b3Ugd2lsbCBub3QgYmUgdGhlIG9uZSAKYW5kIHRoZXJlZm9yZSB0aGF0J3MgYSBjYWxs
IGZvciB0aGlzIHRvIHN0YXkgYXMgaXQgaXMgaW4gWGVuLgoKPiBJbiBmYWN0LCBJIHNlZW0gdG8K
PiByZWNvbGxlY3QgdGhhdCB3ZSBkaWQgdGhhdCBldmVuIHdpdGhvdXQgY29sbGVjdGluZyBhbGwg
bmVjZXNzYXJ5IGFja3MuCgpDb2xsZWN0aW5nIHRoZSBuZWNlc3NhcnkgYWNrcyBhbmQgbm90IGlu
dmVzdGlnYXRpbmcgYXJlIHNvbWV0aGluZyAKdG90YWxseSBkaWZmZXJlbnQuIFRoZXJlIGFyZSBh
IGNvdXBsZSBvZiBpbnN0YW5jZSB3aGVyZSBwYXRjaCB3ZW50IAp3aXRob3V0IHRoZSBuZWNlc3Nh
cnkgYWNrcyB0byB1bmJsb2NrIGJ1aWxkL3Rlc3QgKHNlZSBKYW4ncyBzZXJpZXMgZm9yIAo0LjEw
IGFuZCA0LjExKS4KCkhvd2V2ZXIgSmFuIHN0aWxsIGludmVzdGlnYXRlZCB0aGUgcHJvYmxlbS4K
Cj4gTWF5YmUgbXkgbWVtb3J5IGlzIGZhaWxpbmcgbWU/IEJ1dCBJIHdvdWxkIGhhdmUgc3dvcm4g
aXQgaGFwcGVuZWQgYQo+IGNvdXBsZSBvZiB0aW1lcyBpbiB0aGUgbGFzdCAxMiBtb250aHMuIE9y
IG1heWJlIHRoaXMgY2FzZSBpcyBkaWZmZXJlbnQKPiBiZWNhdXNlIGl0IGRvZXNuJ3QgYnJlYWsg
dGhlIGJ1aWxkIHdpdGggdGhlIGRlZmF1bHQga2NvbmZpZz8gSW4gYW55Cj4gY2FzZSwgbGV0J3Mg
YWdyZWUgb24gYSBwb2xpY3kgYW5kIEkgYW0gaGFwcHkgdG8gZm9sbG93IGl0LgoKVGhpcyBjYW4n
dCBiZSByZWFjaGVkIHdpdGggb3NzdGVzdCAoYXMgaXQgaXMgcHJvdGVjdGVkIGJ5IEVYUEVSVCks
IGJ1dCBJIApkaWRuJ3QgYmFzZSBteSBqdWRnbWVudCBvbiB0aGF0LgoKSSBiYXNlZCBteSBqdWRn
bWVudCBvbiB0aGUgY29tcGlsZXIgcmVwb3J0aW5nIGEgcG90ZW50aWFsIGVycm9yIGFuZCB0aGUg
CmNvbW1pdCBtZXNzYWdlIG5vdCBleHBsYWluaW5nIHdoeSBzZXR0aW5nIHRvIE5VTEwgd291bGQg
YmUgb2suCgpJIGFtIGhhcHB5IHRvIGhhdmUgYnVpbGQgZml4IGdvaW5nIHdpdGhvdXQgYW55IGFj
a3MgKHRvIGNlcnRhaW4gZXh0ZW5kKSwgCmhvd2V2ZXIgd2Ugc2hvdWxkIG5vdCBsb3dlciBkb3du
IHRoZSBxdWFsaXR5IG9mIHRoZSBjb21taXQgZm9yIHRoYXQuCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
