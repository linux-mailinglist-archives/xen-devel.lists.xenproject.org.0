Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403EE151C0C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 15:20:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyz2X-0002I9-R7; Tue, 04 Feb 2020 14:18:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4ZTP=3Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iyz2W-0002I4-Ae
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 14:18:56 +0000
X-Inumbo-ID: 46b8ec3c-4759-11ea-8f58-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46b8ec3c-4759-11ea-8f58-12813bfff9fa;
 Tue, 04 Feb 2020 14:18:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AAB82AE52;
 Tue,  4 Feb 2020 14:18:54 +0000 (UTC)
To: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
 <3936e4e4-f424-20b9-07d2-3a16433f65ae@citrix.com>
 <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2c7f8172-b2c9-4831-f91d-d5b83a668527@suse.com>
Date: Tue, 4 Feb 2020 15:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
Content-Language: en-US
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAgMTU6MDcsIERpZXRtYXIgSGFobiB3cm90ZToKPiBBbSBGcmVpdGFnLCAzMS4g
SmFudWFyIDIwMjAsIDIyOjU5OjE5IENFVCBzY2hyaWViIElnb3IgRHJ1emhpbmluOgo+PiBPbiAz
MC8wMS8yMDIwIDEzOjAzLCBEaWV0bWFyIEhhaG4gd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiB3ZSB1
c2UgU0xFUzEyIHdpdGgga2VybmVsLWRlZmF1bHQtNC4xMi4xNC05NS40NS4xLng4Nl82NCBhbmQK
Pj4+IHhlbi00LjExLjNfMDItMi4yMC4xLng4Nl82NAo+Pj4KPj4+IFRoZSBkdW1wIGtlcm5lbCBk
b2Vzbid0IHN0YXJ0IGFmdGVyICJlY2hvIGMgPiAvcHJvYy9zeXNycV90cmlnZ2VyIi4KPj4+IExh
c3QgbWVzc2FnZXMgb24gY29uc29sZSBhcmU6Cj4+PiBbICAzODUuNzE3NTMyXSBLZXJuZWwgcGFu
aWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uCj4+PiBbICAzODUuNzM0NTY1XSBLZXJu
ZWwgT2Zmc2V0OiBkaXNhYmxlZAo+Pj4gKFhFTikgSGFyZHdhcmUgRG9tMCBjcmFzaGVkOiBFeGVj
dXRpbmcga2V4ZWMgaW1hZ2Ugb24gY3B1NTgKPj4+IChYRU4pIFNob3QgZG93biBhbGwgQ1BVcwo+
Pj4KPj4+IEFmdGVyIGEgc2hvcnQgdGltZSBhIHJlYm9vdCBpcyBpbml0aWF0ZWQuCj4+PiBXaXRo
b3V0IHhlbiB0aGUga2R1bXAgd29ya3MuCj4+Pgo+Pj4gV2Ugc2VlIHRoaXMgYmVoYXZpb3VyIG9u
bHkgb24gbmV3ZXIgaGFyZHdhcmUsIGZvciBleGFtcGxlIGEgc2VydmVyIHdpdGgKPj4+IEludGVs
KFIpIFhlb24oUikgR29sZCA2MjQyIENQVSBAIDIuODBHSHoKPj4+Cj4+PiBJIGJ1aWx0IHRoZSBm
cmVzaCByZWxlYXNlZCB4ZW4tNC4xMyBteXNlbGYgYW5kIHRyaWVkIGl0IGJ1dCB0aGlzIGRvZXNu
J3QgaGVscC4KPj4+Cj4+PiBJIHRyaWVkIHgyYXBpYz1vZmYgb24gdGhlIHhlbiBzaWRlIGFuZCBu
b3gyYXBpYyBvbiB0aGUgbGludXggc2lkZSBidXQgbm8gc3VjY2Vzcy4KPj4KPj4gU3RhcnRpbmcg
ZnJvbSBYZW4gNC4xMiB3ZSBrZWVwIElPTU1VIGVuYWJsZWQgZHVyaW5nIGtleGVjIHRyYW5zaXRp
b24KPj4gd2hpY2ggcmVzb2x2ZWQgdGhlIHByb2JsZW0geW91J3JlIGRlc2NyaWJpbmcuIEJ1dCB5
b3UgYWxzbyBuZWVkIHRvIG1ha2UKPj4gc3VyZSBJT01NVSBpcyBlbmFibGVkIGluIHlvdXIga2V4
ZWMga2VybmVsICh3aGljaCBJIHRoaW5rIGlzIG5vdyB0aGUKPj4gZGVmYXVsdCBmb3IgbW9zdCBk
aXN0cm9zKS4gWW91IGNhbiBzdGlsbCB0cnkgdG8gd29ya2Fyb3VuZCB0aGUgaXNzdWUKPj4geW91
J3JlIHNlZWluZyBvbiA0LjExIGJ5IHVzaW5nICJpb21tdT1kb20wLXBhc3N0aG91Z2giIFhlbiBv
cHRpb24uCj4gCj4gSSBhZGRlZCAiaW9tbXU9ZG9tMC1wYXNzdGhyb3VnaCIgdG8gdGhlIHhlbi00
LjExIGNvbW1hbmQgbGluZSBidXQgbm8gc3VjY2Vzcy4KPiBGdXJ0aGVyIEkgYWRkZWQgZWFybHlw
cmludGs9Li4uIHRvIHRoZSB0aGUga2R1bXAga2VybmVsIGFuZCBJIGNvdWxkIHNlZSB0aGUKPiBk
dW1wIGtlcm5lbCBzdGFydGVkIGFuZCBvbmx5IG9uZSBtZXNzYWdlIGZyb20gZXh0cmFjdF9rZXJu
ZWwoKQo+IHdhcyBwcmludGVkLiBUaGVuIHRoZSByZWJvb3QgZm9sbG93ZWQuCgpXaGljaCBtZXNz
YWdlPwoKQW55IGNoYW5jZSB5b3UgY2FuIGJ1aWxkIHRoZSBrZHVtcCBrZXJuZWwgd2l0aCBDT05G
SUdfWDg2X1ZFUkJPU0VfQk9PVFVQCmVuYWJsZWQ/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
