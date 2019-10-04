Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FCCBB26
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 15:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGNBo-0005M0-RV; Fri, 04 Oct 2019 13:00:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGNBn-0005Lv-A1
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 13:00:07 +0000
X-Inumbo-ID: e282c30e-e6a6-11e9-9753-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e282c30e-e6a6-11e9-9753-12813bfff9fa;
 Fri, 04 Oct 2019 13:00:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96DA3B1AD;
 Fri,  4 Oct 2019 13:00:04 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-2-git-send-email-igor.druzhinin@citrix.com>
 <dde9c6fd-8043-cbc5-ab06-d6e238ad0e38@suse.com>
 <a19291d4-1eb0-e479-f9a7-bd442a1649dc@citrix.com>
 <ebd2f8e6-42ed-d1b6-8a2d-e7f07848d5b1@suse.com>
 <d810a9eb-2736-787a-652d-b2417876eac9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49dc1b9c-bd30-0b4f-af8f-b4be9f14b04f@suse.com>
Date: Fri, 4 Oct 2019 15:00:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d810a9eb-2736-787a-652d-b2417876eac9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] efi/boot: fix set_color function
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMjAxOSAxMzoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDQvMTAvMjAx
OSAxMjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjEwLjIwMTkgMTI6NTQsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMDQvMTAvMjAxOSAxMTozNCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMDMuMTAuMjAxOSAxNTo0OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+
IC0gMCBpcyBhIHBvc3NpYmxlIGFuZCBhbGxvd2VkIHZhbHVlIGZvciBhIGNvbG9yIG1hc2sgYWNj
cm9kaW5nIHRvCj4+Pj4+ICAgVUVGSSBTcGVjIDIuNiAoMTEuOSkgZXNwZWNpYWxseSBmb3IgcmVz
ZXJ2ZWQgbWFzawo+Pj4+Cj4+Pj4gSG1tLCBsb29raW5nIGF0IDIuOCAod2hlcmUgaXQncyBzZWN0
aW9uIDEyLjksIHdoaWNoIGluIHR1cm4gaXMgd2h5Cj4+Pj4gc2VjdGlvbiB0aXRsZXMgd291bGQg
YmUgbW9yZSBoZWxwZnVsIGluIHN1Y2ggcmVmZXJlbmNlcykgSSBjYW4ndAo+Pj4+IHNlZSB0aGUg
Y2FzZSBiZWluZyBtZW50aW9uZWQgZXhwbGljaXRseS4gSSBjYW4gYWNjZXB0IHRoYXQKPj4+PiBS
ZXNlcnZlZE1hc2sgbWlnaHQgYmUgemVybywgYnV0IHRoZW4gSSdkIHByZWZlciB0byBoYW5kbGUg
dGhhdAo+Pj4+IGNhc2UgaW4gdGhlIGNhbGxlciwgcmF0aGVyIHRoYW4gYWxsb3dpbmcgemVybyBh
bHNvIGZvciB0aGUgdGhyZWUKPj4+PiBjb2xvcnMuCj4+Pgo+Pj4gIklmIGEgYml0IGlzIHNldCBp
biBSZWRNYXNrLCBHcmVlbk1hc2ssIG9yIEJsdWVNYXNrIHRoZW4gdGhvc2UgYml0cyBvZgo+Pj4g
dGhlIHBpeGVsIHJlcHJlc2VudCB0aGUgY29ycmVzcG9uZGluZyBjb2xvci4iIC0gIklmIGEgYml0
IGlzIHNldC4uLiIKPj4+IGltcGxpZXMgaXQgbWlnaHQgbm90IGJlIHNldC4KPj4KPj4gVGhpcyB0
YWxrcyBhYm91dCB0aGUgZnVuY3Rpb24gb2YgaW5kaXZpZHVhbCBiaXRzLiBUaGVyZSdzIG5vdGhp
bmcgc2FpZAo+PiBhYm91dCBub3QgYml0IGF0IGFsbCBiZWluZyBzZXQgZm9yIGEgcGFydGljdWxh
ciBjb2xvci4KPj4KPiAKPiBJIGtub3cgY2VydGFpbmx5IHRoYXQgaXQncyBub3Qgb25seSBtZSB3
aG8gcmVhZHMgdGhpcyBzZW50ZW5jZSB0aGUgc2FtZQo+IHdheSAtIGZpcm13YXJlIGRldmVsb3Bl
cnMgYXMgd2VsbC4gQnV0IGlmIHlvdSBpbnNpc3QgSSB3aWxsIHJlc3RyaWN0Cj4gdGhpcyBjaGFu
Z2UgdG8gcmVzZXJ2ZWQgbWFzayBvbmx5LgoKUGxlYXNlIGRvLCB1bmxlc3MgeW91IGNhbiBwcm92
aWRlIGEgcGxhdXNpYmxlIChub24tYnJva2VuKSBzY2VuYXJpbwp3aGVyZSBvbmUgb2YgdGhlIHRo
cmVlIGNvbG9yIG1hc2tzIGNvdWxkIGJlIHplcm8uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
