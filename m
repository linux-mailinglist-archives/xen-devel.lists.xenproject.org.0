Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70035419D4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 03:08:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hariV-0004OF-CV; Wed, 12 Jun 2019 01:06:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v58P=UL=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hariT-0004OA-Md
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 01:06:17 +0000
X-Inumbo-ID: 454af4aa-8cae-11e9-a500-b346e9a45c3e
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 454af4aa-8cae-11e9-a500-b346e9a45c3e;
 Wed, 12 Jun 2019 01:06:14 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 12 Jun
 2019 09:03:00 +0800
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <413f19014c77952216ac32ed595f61e0@sslemail.net>
 <28ad7e86-d724-0fcc-85fa-3289dc485c1a@suse.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <02a1c122-0b2e-4ab6-f0d4-34634529c224@mxnavi.com>
Date: Wed, 12 Jun 2019 09:05:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <28ad7e86-d724-0fcc-85fa-3289dc485c1a@suse.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: superficial clean-ups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTEvMTkgMTg6MjksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTEuMDYuMTkgMTI6
MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDExLzA2LzIwMTkgMTE6MjUsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxMS4wNi4xOSAxMjoxOCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4+PiBPbiA2LzExLzE5IDEwOjIwIEFNLCBCYW9kb25nIENoZW4gd3JvdGU6Cj4+Pj4+ICogUmVt
b3ZlIHJlZHVuZGFudCBzZXQgJ0RPTURZSU5HX2RlYWQnCj4+Pj4+IGRvbWFpbl9jcmVhdGUoKSB3
aWxsIHNldCB0aGlzIHdoZW4gZmFpbCwgdGh1cyBubyBuZWVkCj4+Pj4+IHNldCBpbiBhcmNoX2Rv
bWFpbl9jcmVhdGUoKS4KPj4+Pj4KPj4+Pj4gKiBTZXQgZXJyb3Igd2hlbiByZWFsbHkgaGFwcGVu
ZWQKPj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2Nv
bW1vbi9zY2hlZHVsZS5jCj4+Pj4+IGluZGV4IDg2MzQxYmMuLmQ2Y2RjZjggMTAwNjQ0Cj4+Pj4+
IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+Pj4+PiArKysgYi94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKPj4+Pj4gQEAgLTE4OTQsOSArMTg5NCwxMSBAQCBzdHJ1Y3Qgc2NoZWR1bGVyICpzY2hl
ZHVsZXJfYWxsb2ModW5zaWduZWQKPj4+Pj4gaW50IHNjaGVkX2lkLCBpbnQgKnBlcnIpCj4+Pj4+
IMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4+Pj4gwqDCoCDCoMKgIGZvdW5kOgo+Pj4+PiAt
wqDCoMKgICpwZXJyID0gLUVOT01FTTsKPj4+Pj4gwqDCoMKgwqDCoMKgIGlmICggKHNjaGVkID0g
eG1hbGxvYyhzdHJ1Y3Qgc2NoZWR1bGVyKSkgPT0gTlVMTCApCj4+Pj4+ICvCoMKgwqAgewo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgKnBlcnIgPSAtRU5PTUVNOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gTlVMTDsKPj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+IMKgwqDCoMKgwqDCoCBtZW1j
cHkoc2NoZWQsIHNjaGVkdWxlcnNbaV0sIHNpemVvZigqc2NoZWQpKTsKPj4+Pj4gwqDCoMKgwqDC
oMKgIGlmICggKCpwZXJyID0gU0NIRURfT1Aoc2NoZWQsIGluaXQpKSAhPSAwICkKPj4+Pgo+Pj4+
IEkgd2FzIGdvaW5nIHRvIHNheSwgdGhpcyBpcyBhIGNvbW1vbiBpZGlvbSBpbiB0aGUgWGVuIGNv
ZGUsIGFuZCB0aGUKPj4+PiBjb21waWxlciB3aWxsIGVuZCB1cCByZS1vcmdhbml6aW5nIHRoaW5n
cyBzdWNoIHRoYXQgdGhlIHdyaXRlIGRvZXNuJ3QKPj4+PiBoYXBwZW4gYW55d2F5LsKgIEJ1dCBp
biB0aGlzIGNhc2UsIGl0cycgYWN0dWFsbHkgd3JpdGluZyB0aHJvdWdoIGEKPj4+PiBwb2ludGVy
IGJlZm9yZSBhbmQgYWZ0ZXIgYSBmdW5jdGlvbiBjYWxsOyBJIGRvbid0IHRoaW5rIHRoZSBjb21w
aWxlcgo+Pj4+IHdvdWxkIGFjdHVhbGx5IGJlIGFsbG93ZWQgdG8gb3B0aW1pemUgdGhpcyB3cml0
ZSBhd2F5Lgo+Pj4+Cj4+Pj4gU28sIEkgZ3Vlc3MgSSdkIGJlIE9LIHdpdGggdGhpcyBwYXJ0aWN1
bGFyIGh1bmsuwqAgRGFyaW8sIGFueSBvcGluaW9ucz8KPj4+Cj4+PiBJJ2QgcmF0aGVyIHN3aXRj
aCB0byBQVFJfRVJSKCkgaGVyZSBkcm9wcGluZyB0aGUgcGVyciBwYXJhbWV0ZXIuCj4+Cj4+ICsy
IGZvciB0aGlzLCBidXQgSSB3YXMgZ29pbmcgdG8gd2FpdCB1bnRpbCBjb3JlIHNjaGVkdWxpbmcg
aGFkIGdvdHRlbiBhCj4+IGJpdCBmdXJ0aGVyIGJlZm9yZSBzdWdnZXN0aW5nIGNsZWFudXAgd2hp
Y2ggaXMgZ3VhcmFudGVlZCB0byBjb2xsaWRlLgo+Pgo+PiBTYWRseSwgaXQncyBmYWlybHkgaW50
cnVzaXZlIGluIHRoZSBjcHVwb29sIGNvZGUgYXMgd2VsbC4KPgo+IEkgY2FuIGFkZCB0aGlzIHRv
IG15IGxpc3Qgb2Ygc2NoZWR1bGVyIGNsZWFudXBzIHRvIGRvLgpDb3B5IHRoYXQuCj4KPgo+IEp1
ZXJnZW4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
