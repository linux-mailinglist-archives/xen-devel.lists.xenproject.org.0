Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CA6C9333
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 23:00:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFlf3-0002r3-6T; Wed, 02 Oct 2019 20:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=whiU=X3=prgmr.com=cmb@srs-us1.protection.inumbo.net>)
 id 1iFlf1-0002qy-NC
 for xen-devel@lists.xen.org; Wed, 02 Oct 2019 20:55:47 +0000
X-Inumbo-ID: 01482582-e557-11e9-b588-bc764e2007e4
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by localhost (Halon) with ESMTPS
 id 01482582-e557-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 20:55:46 +0000 (UTC)
Received: from localhost (97-115-96-182.ptld.qwest.net [97.115.96.182])
 (Authenticated sender: cmb)
 by mail.prgmr.com (Postfix) with ESMTPSA id 49006720087;
 Wed,  2 Oct 2019 21:50:45 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 49006720087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1570067445;
 bh=Rxx0DG70SBXjABlHlGHU5ANey9hBmxXgZTNQdE6vObo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=otcmSdACfSt2CiN67KqyJHJmOPqXnACrr19fMmVvk3nHZOON+mb5TWMNmQ6ttFXp8
 PbMVfjGiX0EZu6tHYiTve8U03XBHh1HZfpokfU4iaF26hVio/id5UjOT8j+umCRO7d
 TcPKqQs2YWwj/fcy147ymB1zBm0nKexXwQTH9H3I=
From: Chris Brannon <cmb@prgmr.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <aecc7e18-40ff-8bb8-467c-24bfe99ee8f1@prgmr.com>
 <470f5ce1-d43f-a5dd-a00d-e2ec339b06c0@suse.com>
 <8736gb5by4.fsf@cmbmachine.messageid.invalid>
 <e05593f6-f223-2c7d-d607-ea76c9204f17@citrix.com>
Date: Wed, 02 Oct 2019 13:55:44 -0700
In-Reply-To: <e05593f6-f223-2c7d-d607-ea76c9204f17@citrix.com> (Andrew
 Cooper's message of "Wed, 2 Oct 2019 18:41:32 +0100")
Message-ID: <87pnje50kv.fsf@cmbmachine.messageid.invalid>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Crash with nested HVM and Linux v5.1+
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
Cc: Sarah Newman <srn@prgmr.com>, Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JpdGVzOgoKPiAoWEVO
KSB0cmFwcy5jOjE1NzY6IEdQRiAoMDAwMCk6IGZmZmY4MmQwODAzMWE4MGYgW3ZteC5jI3ZteF9t
c3JfcmVhZF9pbnRlcmNlcHQrMHgzODcvMHgzZmRdIC0+IGZmZmY4MmQwODAzN2M5ZjIKPiAoWEVO
KSB0cmFwcy5jOjE1NzY6IEdQRiAoMDAwMCk6IGZmZmY4MmQwODAzMWE4MGYgW3ZteC5jI3ZteF9t
c3JfcmVhZF9pbnRlcmNlcHQrMHgzODcvMHgzZmRdIC0+IGZmZmY4MmQwODAzN2M5ZjIKPiAoZDIp
IHhzX3dyaXRlKC92bS85NWYxMWZjMC1iOWU3LTQ3ZmYtODUyMy1iYWNhYjM1Yjk2YjYvcnRjL3Rp
bWVvZmZzZXQpOiBFQUNDRVMKPiAoWEVOKSBkMXYxIFVuaGFuZGxlZCBuZXN0ZWQgdm1leGl0OiBy
ZWFzb24gNTEKPiAoWEVOKSBkb21haW5fY3Jhc2ggY2FsbGVkIGZyb20gdnZteC5jOjI2NzEKPiAo
WEVOKSBEb21haW4gMSAodmNwdSMxKSBjcmFzaGVkIG9uIGNwdSMyOgo+Cj4gNTEgaXMgdGhlIFJE
VFNDUCBpbnRlcmNlcHQuICBJdCBzZWVtcyB0aGF0IG5vb25lIGhhcyBldmVyIHRyaWVkIGV4ZWN1
dGluZyBhCj4gUkRUU0NQIGluc3RydWN0aW9uIGluIG5lc3RlZCB2aXJ0IHlldC4uLiB3aGljaCBn
b2VzIHRvIHNob3cgaG93IHVudGVzdGVkIHRoaXMKPiBhbGwgaXMuCj4KPiBDYW4geW91IHNlZSBh
Ym91dCBnaXZpbmcgdGhpcyBwYXRjaCBhIHNwaW4/Cj4KPiB+QW5kcmV3Cj4KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jCj4gaW5kZXggZmRmNDQ5YmZkMS4uNjY5NmJkNjI0MCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMK
PiBAQCAtMjQ5MSw2ICsyNDkxLDcgQEAgaW50IG52bXhfbjJfdm1leGl0X2hhbmRsZXIoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gICAgICAgICAgICAgIG52Y3B1LT5udl92bWV4aXRfcGVu
ZGluZyA9IDE7Cj4gICAgICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIEVYSVRfUkVBU09OX1JEVFND
Ogo+ICsgICAgY2FzZSBFWElUX1JFQVNPTl9SRFRTQ1A6Cj4gICAgICAgICAgY3RybCA9IF9fbjJf
ZXhlY19jb250cm9sKHYpOwo+ICAgICAgICAgIGlmICggY3RybCAmIENQVV9CQVNFRF9SRFRTQ19F
WElUSU5HICkKPiAgICAgICAgICAgICAgbnZjcHUtPm52X3ZtZXhpdF9wZW5kaW5nID0gMTsKPiBA
QCAtMjUwMSw2ICsyNTAyLDggQEAgaW50IG52bXhfbjJfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MsCj4gICAgICAgICAgICAgICAqIGF2b2lkaW5nIGNoYW5naW5nIGd1
ZXN0X3RzYyBhbmQgbWVzc2luZyB1cCB0aW1la2VlcGluZyBpbiBMMQo+ICAgICAgICAgICAgICAg
Ki8KPiAgICAgICAgICAgICAgbXNyX3NwbGl0KHJlZ3MsIGh2bV9nZXRfZ3Vlc3RfdHNjKHYpICsg
Z2V0X3Z2bWNzKHYsCj4gVFNDX09GRlNFVCkpOwo+ICsgICAgICAgICAgICBpZiAoIGV4aXRfcmVh
c29uID09IEVYSVRfUkVBU09OX1JEVFNDUCApCj4gKyAgICAgICAgICAgICAgICByZWdzLT5yY3gg
PSB2LT5hcmNoLm1zcnMtPnRzY19hdXg7Cj4gICAgICAgICAgICAgIHVwZGF0ZV9ndWVzdF9laXAo
KTsKPiAgCj4gICAgICAgICAgICAgIHJldHVybiAxOwoKSGkgQW5kcmV3LApUaGlzIHBhdGNoIHdv
cmtzIGZvciBtZS4gIFRoZSBMMiBkb21VIGJvb3RzIHN1Y2Nlc3NmdWxseS4KClRoYW5rIHlvdSEK
Ci0tIENocmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
