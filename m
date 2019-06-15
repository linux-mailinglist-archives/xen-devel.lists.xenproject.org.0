Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E756471E0
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2019 21:14:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcE4S-000156-1m; Sat, 15 Jun 2019 19:10:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZUrs=UO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcE4R-000151-1e
 for xen-devel@lists.xenproject.org; Sat, 15 Jun 2019 19:10:35 +0000
X-Inumbo-ID: 3f88bc09-8fa1-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3f88bc09-8fa1-11e9-8980-bc764e045a96;
 Sat, 15 Jun 2019 19:10:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D17C528;
 Sat, 15 Jun 2019 12:10:32 -0700 (PDT)
Received: from [10.37.12.2] (unknown [10.37.12.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69DF33F246;
 Sat, 15 Jun 2019 12:10:31 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-10-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com>
Date: Sat, 15 Jun 2019 20:10:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611184541.7281-10-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gNi8xMS8xOSA3OjQ2IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiBUaGlzIGVudW1lcmF0aW9uIGNvbnRyb2xzIFRFRSB0eXBlIGZvciBhIGRvbWFpbi4gQ3Vy
cmVudGx5IHRoZXJlIGlzCj4gdHdvIHBvc3NpYmxlIG9wdGlvbnM6IGVpdGhlciAnbm9uZScgb3Ig
J29wdGVlJy4KPiAKPiAnbm9uZScgaXMgdGhlIGRlZmF1bHQgdmFsdWUgYW5kIGl0IGJhc2ljYWxs
eSBkaXNhYmxlcyBURUUgc3VwcG9ydCBhdAo+IGFsbC4KPiAKPiAnb3B0ZWUnIGVuYWJsZXMgYWNj
ZXNzIHRvIHRoZSBPUC1URUUgcnVubmluZyBvbiBhIGhvc3QgbWFjaGluZS4gVGhpcwo+IHJlcXVp
cmVzIHNwZWNpYWwgT1AtVEVFIGJ1aWxkIHdpdGggdmlydHVhbGl6YXRpb24gc3VwcG9ydCBlbmFi
bGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFi
Y2h1a0BlcGFtLmNvbT4KPiAKPiAtLS0KPiAgIEFsbCB0aGUgcGF0Y2hlcyB0byBvcHRlZS5jIHNo
b3VsZCBiZSBtZXJnZWQgdG9nZXRoZXIuIFRoZXkgd2VyZQo+ICAgc3BsaXQgdG8gZWFzZSB1cCBy
ZXZpZXcuIEJ1dCB0aGV5IGRlcGVuZCBoZWF2aWx5IG9uIGVhY2ggb3RoZXIuCj4gCj4gICBDaGFu
Z2VzIGZyb20gdjU6Cj4gICAgLSBSZXBsYWNlZCAibmF0aXZlIiB3aXRoICJvcHRlZSIgaW4gdGhl
IGNvbW1pdCBkZXNjcmlwdGlvbi4KPiAgICAtIFVwZGF0ZWQgYW5kIGV4dGVuZGVkIGRvY3VtZW50
YXRpb24gYmFzZWQgb24gSnVsaWVuIEdyYWxsJ3MKPiAgICAgIGFuZCBJYW4gSmFja3NvbidzIHN1
Z2dlc3Rpb25zLgo+IAo+ICAgQ2hhbmdlcyBmcm9tIHY0Ogo+ICAgIC0gIm5hdGl2ZSIgb3B0aW9u
IHdhcyByZXBsYWNlZCB3aXRoICJvcHRlZSIKPiAgICAtICJ0ZWUiIHByb3BlcnR5IHdhcyBtb3Zl
ZCBmcm9tIGFyY2gtc3BlY2lmaWMgc2VjdGlvbiB0byB0aGUKPiAgICAgICBnbG9iYWwgb25lLiBE
b2N1bWVudGF0aW9uIG1vdmVkIGluc2lkZSAiRGV2aWNlcyIgc2VjdGlvbi4KPiAKPiAgIENoYW5n
ZXMgZnJvbSB2MzoKPiAgICAtIHRlZV9lbmFibGVkIHJlbmFtZWQgdG8gdGVlX3R5cGUuIEN1cnJl
bnRseSB0d28gdHlwZXMgYXJlIHN1cHBvcnRlZAo+ICAgICAgYXMgZGVzY3JpYmVkIGluIHRoZSBj
b21taXQgbWVzc2FnZQo+ICAgIC0gQWRkIExJQlhMX0hBVkVfQlVJTERJTkZPX0FSQ0hfQVJNX1RF
RSBkZWZpbml0aW9uCj4gCj4gICBDaGFuZ2VzIGZyb20gdjI6Cj4gICAgLSBVc2UgYXJjaC50ZWVf
ZW5hYmxlZCBpbnN0ZWFkIG9mIHNlcGFyYXRlIGRvbWN0bAo+IC0tLQo+ICAgZG9jcy9tYW4veGwu
Y2ZnLjUucG9kLmluICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gICB0b29scy9saWJ4
bC9saWJ4bC5oICAgICAgICAgfCAgNSArKysrKwo+ICAgdG9vbHMvbGlieGwvbGlieGxfYXJtLmMg
ICAgIHwgMTMgKysrKysrKysrKysrKwo+ICAgdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwg
IDYgKysrKysrCj4gICB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgfCAgOSArKysrKysrKysK
PiAgIDUgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
b2NzL21hbi94bC5jZmcuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPiBpbmRl
eCBjOTlkNDAzMDdlLi5lNjVhYjYxMTFmIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy41
LnBvZC5pbgo+ICsrKyBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbgo+IEBAIC0xNTQ0LDYgKzE1
NDQsMjcgQEAgU2V0IG1heGltdW0gaGVpZ2h0IGZvciBwb2ludGVyIGRldmljZS4KPiAgIAo+ICAg
PWJhY2sKPiAgIAo+ICs9aXRlbSBCPHRlZT0iU1RSSU5HIj4KPiArCj4gK0I8QXJtIG9ubHkuPiBT
ZXQgVEVFIHR5cGUgZm9yIHRoZSBndWVzdC4gVEVFIGlzIGEgVHJ1c3RlZCBFeGVjdXRpb24KPiAr
RW52aXJvbm1lbnQgLS0gc2VwYXJhdGUgc2VjdXJlIE9TIGZvdW5kIG9uIHNvbWUgcGxhdGZvcm1z
LiBCPFNUUklORz4gY2FuIGJlIG9uZSBvZiB0aGU6Cj4gKwo+ICs9b3ZlciA0Cj4gKwo+ICs9aXRl
bSBCPG5vbmU+Cj4gKwo+ICtEaXNhYmxlIFRFRSBzdXBwb3J0IGF0IGFsbC4gVGhpcyBpcyB0aGUg
ZGVmYXVsdCB2YWx1ZS4KSG93IGFib3V0ICJEb24ndCBhbGxvdyB0aGUgZ3Vlc3QgdG8gdXNlIFRF
RSBpZiBwcmVzZW50IG9uIHRoZSBwbGF0Zm9ybS4gClRoaXMgaXMgdGhlIGRlZmF1bHQgdmFsdWUu
Ii4KCj4gKwo+ICs9aXRlbSBCPG9wdGVlPgo+ICsKPiArQWxsb3cgYSBndWVzdCB0byB1c2UgT1At
VEVFLiBOb3RlIHRoYXQgYSB2aXJ0dWFsaXphdGlvbi1hd2FyZSBPUC1URUUKPiAraXMgcmVxdWly
ZWQgZm9yIHRoaXMuIElmIHRoaXMgb3B0aW9uIGlzIHNlbGVjdGVkLCBndWVzdCB3aWxsIGJlIGFi
bGUKCk9PSSwgd2hhdCBoYXBwZW4gaWYgT1AtVEVFIGRvZXMgbm90IHN1cHBvcnQgdmlydHVhbGl6
YXRpb24uIFdpbGwgWGVuIApmb3JiaWQgdG8gdXNlIGl0PwoKPiArdG8gYWNjZXNzIHRvIHRoZSBy
ZWFsIE9QLVRFRSBPUyBydW5uaW5nIG9uIHRoZSBob3N0LiBHdWVzdCBjcmVhdGlvbgoKcy9yZWFs
Ly8gaXQgaXMgcmVkdW5kYW50IHdpdGggdGhlIHJlc3Qgb2YgdGhlIHNlbnRlbmNlLiBIb3dldmVy
LCBpdCBkb2VzIApub3QgcmVhbGx5IGFuc3dlciB0byB0aGUgcXVlc3Rpb24gcmVnYXJkaW5nIGlz
b2xhdGlvbi4KCj4gK3dpbGwgZmFpbCBpZiBPUC1URUUgaGF2ZSBubyByZXNvdXJjZXMgZm9yIGEg
bmV3IGd1ZXN0LiBOdW1iZXIgb2Ygc3VwcG9ydGVkCj4gK2d1ZXN0cyBkZXBlbmRzIG9uIE9QLVRF
RSBjb25maWd1cmF0aW9uLgoKSG93IGFib3V0IHRoZSBmb2xsb3dpbmcgZGVzY3JpcHRpb24gKGNv
cnJlY3QgbWUgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyAKd3JvbmcpOgoKIkFsbG93IGEgZ3Vlc3Qg
dG8gYWNjZXNzIHRoZSBob3N0IE9QLVRFRSBPUy4gWGVuIHdpbGwgbWVkaWF0ZSB0aGUgYWNjZXNz
IAp0byBPUC1URUUgYW5kIHRoZSByZXNvdXJjZSBpc29sYXRpb24gd2lsbCBiZSBwcm92aWRlZCBk
aXJlY3RseSBieSAKT1AtVEVFLiBPUC1URUUgaXRzZWxmIG1heSBsaW1pdCB0aGUgbnVtYmVyIG9m
IGd1ZXN0cyB0aGF0IGNhbiAKY29uY3VycmVudGx5IHVzZSBpdC4gVGhpcyByZXF1aXJlcyBhIHZp
cnR1YWxpemF0aW9uLWF3YXJlIE9QLVRFRSBmb3IgCnRoaXMgdG8gd29yay4KClRoaXMgZmVhdHVy
ZSBpcyBhIEI8dGVjaG5vbG9neSBwcmV2aWV3Pi4iCgpIb3cgY2FuIGEgdXNlciBrbm93IHdoZXRo
ZXIgT1AtVEVFIHN1cHBvcnRzIHZpcnR1YWxpemF0aW9uPyBJcyBpdCAKY29uZmlndXJhYmxlIGF0
IGJ1aWxkPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
