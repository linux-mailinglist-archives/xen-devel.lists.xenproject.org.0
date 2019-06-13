Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F247143AD6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 17:24:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbRXy-0004Lu-Ev; Thu, 13 Jun 2019 15:21:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Dga=UM=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hbRXw-0004Lo-RJ
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 15:21:48 +0000
X-Inumbo-ID: f3fed930-8dee-11e9-87f9-af146744344d
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3fed930-8dee-11e9-87f9-af146744344d;
 Thu, 13 Jun 2019 15:21:45 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 63CBE305FFB2; Thu, 13 Jun 2019 18:21:44 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4573C306E4AC;
 Thu, 13 Jun 2019 18:21:44 +0300 (EEST)
To: Tamas Lengyel <tamas.lengyel@zentific.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <20180926164741.13405-2-george.dunlap@citrix.com>
 <CABfawh=+ufjv--79mJMJ685TYvDDh-O6v-rgw7hTcNXf8adXZQ@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <878f9367-467a-1ee3-ed2c-8ab14d77a3eb@bitdefender.com>
Date: Thu, 13 Jun 2019 18:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=+ufjv--79mJMJ685TYvDDh-O6v-rgw7hTcNXf8adXZQ@mail.gmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Isaila Alexandru <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xMy8xOSA2OjE5IFBNLCBUYW1hcyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgU2VwIDI2
LCAyMDE4IGF0IDEwOjQ5IEFNIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+Cj4+IEZyb206IElzYWlsYSBBbGV4YW5kcnUgPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgYWNjZXNzIGNvbnRyb2wgZm9yIE5QVCBtb2Rl
Lgo+Pgo+PiBUaGVyZSBhcmVu4oCZdCBlbm91Z2ggZXh0cmEgYml0cyB0byBzdG9yZSB0aGUgYWNj
ZXNzIHJpZ2h0cyBpbiB0aGUgTlBUIHAybQo+PiB0YWJsZSwgc28gd2UgYWRkIGEgcmFkaXggdHJl
ZSB0byBzdG9yZSBleHRyYSBpbmZvcm1hdGlvbi4KPj4KPj4gRm9yIGVmZmljaWVuY3k6Cj4+ICAg
LSBPbmx5IGFsbG9jYXRlIHRoaXMgcmFkaXggdHJlZSB3aGVuIHdlIGZpcnN0IHN0b3JlICJub24t
ZGVmYXVsdCIKPj4gICAgIGV4dHJhIGluZm9ybWF0aW9uCj4+Cj4+ICAgLSBSZW1vdmUgZW50aXJl
cyB3aGljaCBtYXRjaCB0aGUgZGVmYXVsdCBleHRyYSBpbmZvcm1hdGlvbiByYXRoZXIKPj4gICAg
IHRoYW4gY29udGludWluZyB0byBzdG9yZSB0aGVtCj4+Cj4+ICAgLSBGb3Igc3VwZXJwYWdlcywg
b25seSBzdG9yZSBhbiBlbnRyeSBmb3IgdGhlIGZpcnN0IGdmbiBpbiB0aGUKPj4gICAgIHN1cGVy
cGFnZS4gIFVzZSB0aGUgb3JkZXIgb2YgdGhlIHAybSBlbnRyeSBiZWluZyByZWFkIHRvIGRldGVy
bWluZQo+PiAgICAgdGhlIHByb3BlciBwbGFjZSB0byBsb29rIGluIHRoZSByYWRpeCB0YWJsZS4K
Pj4KPj4gTW9kaWZ5IHAybV90eXBlX3RvX2ZsYWdzKCkgdG8gYWNjZXB0IGFuZCBpbnRlcnByZXQg
YW4gYWNjZXNzIHZhbHVlLAo+PiBwYXJhbGxlbCB0byB0aGUgZXB0IGNvZGUuCj4+Cj4+IEFkZCBh
IHNldF9kZWZhdWx0X2FjY2VzcygpIG1ldGhvZCB0byB0aGUgcDJtLXB0IGFuZCBwMm0tZXB0IHZl
cnNpb25zCj4+IG9mIHRoZSBwMm0gcmF0aGVyIHRoYW4gc2V0dGluZyBpdCBkaXJlY3RseSwgdG8g
ZGVhbCB3aXRoIGRpZmZlcmVudAo+PiBkZWZhdWx0IHBlcm1pdHRlZCBhY2Nlc3MgdmFsdWVzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVy
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgo+IAo+IFRoZSBtZW1fYWNjZXNzL21vbml0b3IgYml0cyBhcmUgZmFpcmx5IHRyaXZp
YWw6Cj4gCj4gQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4K
PiAKPj4gLS0tCj4+IE5CLCB0aGlzIGlzIGNvbXBpbGUtdGVzdGVkIG9ubHkuCj4gCj4gQXJlIHlv
dSBwbGFubmluZyB0byBkbyBzb21lIGFjdHVhbCB0ZXN0aW5nPyBJIHdvdWxkIGhpZ2hseSByZWNv
bW1lbmQKPiB0aGF0IHdlIHNlZSByZWFsIHRlc3QgcmVzdWx0cyBiZWZvcmUgdGhpcyBpcyBtZXJn
ZWQgdG8gdmVyaWZ5Cj4gZnVuY3Rpb25hbGl0eS4KCldlIGRpZCBkbyBzb21lIHRlc3Rpbmcgd2l0
aCB4ZW4tYWNjZXNzIGF0IHRoZSB0aW1lLCBidXQgbGltaXRlZCB0ZXN0aW5nIAp3aXRoIHRoZSBh
Y3R1YWwgZnVsbC1ibG93biBpbnRyb3NwZWN0aW9uIGFnZW50IChiZWNhdXNlIG5vdCBhbGwgdGhl
IApuZWVkZWQgcGllY2VzIGFsaWduIHlldCkuCgpUaGluZ3MgZGlkIGFwcGVhciB0byB3b3JrIGFz
IGludGVuZGVkLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
