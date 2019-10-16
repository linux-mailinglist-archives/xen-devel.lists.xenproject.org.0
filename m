Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C6D8EAB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:54:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgui-0002i2-5d; Wed, 16 Oct 2019 10:52:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKgug-0002hx-QW
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:52:18 +0000
X-Inumbo-ID: 052cbfd0-f003-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 052cbfd0-f003-11e9-bbab-bc764e2007e4;
 Wed, 16 Oct 2019 10:52:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3525228;
 Wed, 16 Oct 2019 03:52:17 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715503F6C4;
 Wed, 16 Oct 2019 03:52:15 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
 <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
 <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
 <23974.61064.928585.36020@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e17fdf19-35f5-b1b5-d07d-7437d52198d0@arm.com>
Date: Wed, 16 Oct 2019 11:52:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23974.61064.928585.36020@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: "jgross@suse.com" <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNi8xMC8yMDE5IDExOjE4LCBJYW4gSmFja3NvbiB3cm90ZToKPiBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JpdGVzICgiUmU6IFtQQVRDSCBmb3ItNC4xM10geGVuL2FybTogRG9uJ3QgdXNl
IF9lbmQgaW4gaXNfeGVuX2ZpeGVkX21mbigpIik6Cj4+IE15IHN1Z2dlc3Rpb24gaXMgZ29pbmcg
dG8gd29yazogInRoZSBjb21waWxlciBzZWVzIHRocm91Z2ggY2FzdHMiCj4+IHJlZmVycmVkIHRv
IGNvbXBhcmlzb25zIGJldHdlZW4gcG9pbnRlcnMsIHdoZXJlIHdlIHRlbXBvcmFyaWx5IGNhc3Rl
ZAo+PiBib3RoIHBvaW50ZXJzIHRvIGludGVnZXJzIGFuZCBiYWNrIHRvIHBvaW50ZXJzIHZpYSBh
IE1BQ1JPLiBUaGF0IGNhc2UKPj4gd2FzIGlmZnkgYmVjYXVzZSB0aGUgTUFDUk8gd2FzIGNsZWFy
bHkgYSB3b3JrYXJvdW5kIHRoZSBzcGVjLgo+Pgo+PiBIZXJlIHRoZSBzaXR1YXRpb24gaXMgZGlm
ZmVyZW50LiBGb3Igb25lLCB3ZSBhcmUgZG9pbmcgYXJpdGhtZXRpYy4gQWxzbwo+PiB2aXJ0X3Rv
X21hZGRyIGFscmVhZHkgdGFrZXMgYSB2YWRkcl90IGFzIGFyZ3VtZW50LiBTbyBpbnN0ZWFkIG9m
IGRvaW5nCj4+IHBvaW50ZXJzIGFyaXRobWV0aWMsIHRoZW4gY29udmVydGluZyB0byB2YWRkcl90
LCB3ZSBhcmUgY29udmVydGluZyB0bwo+PiB2YWRkcl90IGZpcnN0LCB0aGVuIGRvaW5nIGFyaXRo
bWV0aWNzLCB3aGljaCBpcyBmaW5lIGJvdGggZnJvbSBhIEM5OQo+PiBwb2ludCBvZiB2aWV3IGFu
ZCBldmVuIGEgTUlTUkEgQyBwb2ludCBvZiB2aWV3LiBJIGNhbid0IHNlZSBhIHByb2JsZW0KPj4g
d2l0aCB0aGF0LiBJIGFtIHN1cmUgYXMgSSByZWFzb25hYmxlIGNhbiBiZSA6LSkKPiAKPiBGVEFP
RCBJIHRoaW5rIHlvdSBhcmUgc3VnZ2VzdGluZyB0aGlzOgo+ICAgLSArICAgICAobWZuX3RvX21h
ZGRyKG1mbikgPD0gdmlydF90b19tYWRkcihfZW5kIC0gMSkpKQo+ICAgKyArICAgICAobWZuX3Rv
X21hZGRyKG1mbikgPD0gdmlydF90b19tYWRkcigoKHZhZGRyX3QpX2VuZCAtIDEpKSkKPiAKPiB2
aXJ0X3RvX21hZGRyKHZhKSBpcyBhIG1hY3JvIHdoaWNoIGV4cGFuZHMgdG8KPiAgICAgX192aXJ0
X3RvX21hZGRyKCh2YWRkcl90KSh2YSkpCj4gCj4gU28gd2hhdCBpcyBoYXBwZW5pbmcgaGVyZSBp
cyB0aGF0IHRoZSBjYXN0IHRvIGFuIGludGVnZXIgdHlwZSBpcyBiZWluZwo+IGRvbmUgYmVmb3Jl
IHRoZSBzdWJ0cmFjdGlvbi4KPiAKPiBXaXRob3V0IHRoZSBjYXN0LCB5b3UgYXJlIGNhbGN1bGF0
aW5nIHRoZSBwb2ludGVyIHZhbHVlIF9lbmQtMSBmcm9tCj4gdGhlIHZhbHVlIF9lbmQsIHdoaWNo
IGlzIFVCLiAgV2l0aCB0aGUgY2FzdCB5b3UgYXJlIGNhbGN1bGF0aW5nIGFuCj4gaW50ZWdlciB2
YWx1ZS4gIHZhZGRyX3QgaXMgdW5zaWduZWQsIHNvIGFsbCBhcml0aG1ldGljIG9wZXJhdGlvbnMg
YXJlCj4gZGVmaW5lZC4gIE5vdGhpbmcgY2FzdHMgdGhlIHJlc3VsdCBiYWNrIHRvIHRoZSAiZm9y
YmlkZGVuIiAod2l0aCB0aGlzCj4gcHJvdmVuYW5jZSkgcG9pbnRlciB2YWx1ZSwgc28gYWxsIGlz
IHdlbGwuCj4gCj4gKFdpdGggdGhlIG1hY3JvIGV4cGFuc2lvbiB0aGUgY2FzdCBoYXBwZW5zIHR3
aWNlLiAgVGhpcyBpcyBwcm9iYWJseQo+IGJldHRlciB0aGFuIHVzaW5nIF9fdmlydF90b19tYWRk
ciBoZXJlLikKPiAKPiBJZSwgaW4gdGhpcyBjYXNlIEkgYWdyZWUgd2l0aCBTdGVmYW5vLiAgVGhl
IGNhc3QgaXMgYm90aCBuZWNlc3NhcnkgYW5kCj4gc3VmZmljaWVudC4KClRoYW5rIHlvdSBib3Ro
IGZvciB0aGUgZXhwbGFuYXRpb24uIEkgd2lsbCB1cGRhdGUgdGhlIHBhdGNoIGFuZCByZXNlbmQg
aXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
