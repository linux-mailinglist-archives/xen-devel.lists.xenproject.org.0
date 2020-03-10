Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F26180081
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 15:45:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBg5P-0002ky-E2; Tue, 10 Mar 2020 14:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBg5O-0002kt-Gz
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 14:42:22 +0000
X-Inumbo-ID: 5673a956-62dd-11ea-adba-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5673a956-62dd-11ea-adba-12813bfff9fa;
 Tue, 10 Mar 2020 14:42:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34623B1E4;
 Tue, 10 Mar 2020 14:42:16 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <f41f32ae-597e-cb1f-8acc-685cee4263ac@suse.com>
Date: Tue, 10 Mar 2020 15:42:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] memaccess: reduce include dependencies
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbW1vbiBoZWFkZXIgZG9lc24ndCBpdHNlbGYgbmVlZCB0byBpbmNsdWRlIHB1YmxpYy92
bV9ldmVudC5oIG5vcgpwdWJsaWMvbWVtb3J5LmguIERyb3AgdGhlaXIgaW5jbHVzaW9uLiBUaGlz
IHJlcXVpcmVzIHVzaW5nIHRoZSBub24tCnR5cGVkZWYgbmFtZXMgaW4gdHdvIHByb3RvdHlwZXMg
YW5kIGFuIGlubGluZSBmdW5jdGlvbjsgYnkgbm90IGNoYW5naW5nCnRoZSBjYWxsZXJzIGFuZCBm
dW5jdGlvbiBkZWZpbml0aW9ucyBhdCB0aGUgc2FtZSB0aW1lIGl0J2xsIHJlbWFpbgpjZXJ0YWlu
IHRoYXQgdGhlIGJ1aWxkIHdvdWxkIGZhaWwgaWYgdGhlIHR5cGVkZWYgaXRzZWxmIHdhcyBjaGFu
Z2VkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0K
djI6IE1vdmUgc3RydWN0IGZvcndhcmQgZGVjbCB0byB4ZW4vbWVtX2FjY2Vzcy5oLiBBZGQgY29t
bWVudCB0aGVyZS4KCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbWVtX2FjY2Vzcy5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vbWVtX2FjY2Vzcy5oCkBAIC0xOSw3ICsxOSw3IEBACiAKIHN0
YXRpYyBpbmxpbmUKIGJvb2wgcDJtX21lbV9hY2Nlc3NfZW11bGF0ZV9jaGVjayhzdHJ1Y3QgdmNw
dSAqdiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2bV9ldmVudF9y
ZXNwb25zZV90ICpyc3ApCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IHZtX2V2ZW50X3N0ICpyc3ApCiB7CiAgICAgLyogTm90IHN1cHBvcnRlZCBvbiBBUk0u
ICovCiAgICAgcmV0dXJuIGZhbHNlOwotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9hY2Nl
c3MuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9hY2Nlc3MuaApAQCAtMzYsMTIgKzM2
LDEyIEBACiAgKi8KIGJvb2wgcDJtX21lbV9hY2Nlc3NfY2hlY2socGFkZHJfdCBncGEsIHVuc2ln
bmVkIGxvbmcgZ2xhLAogICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbnBmZWMgbnBm
ZWMsCi0gICAgICAgICAgICAgICAgICAgICAgICAgIHZtX2V2ZW50X3JlcXVlc3RfdCAqKnJlcV9w
dHIpOworICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfc3QgKipyZXFf
cHRyKTsKIAogLyogQ2hlY2sgZm9yIGVtdWxhdGlvbiBhbmQgbWFyayB2Y3B1IGZvciBza2lwcGlu
ZyBvbmUgaW5zdHJ1Y3Rpb24KICAqIHVwb24gcmVzY2hlZHVsaW5nIGlmIHJlcXVpcmVkLiAqLwog
Ym9vbCBwMm1fbWVtX2FjY2Vzc19lbXVsYXRlX2NoZWNrKHN0cnVjdCB2Y3B1ICp2LAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZtX2V2ZW50X3Jlc3BvbnNlX3QgKnJz
cCk7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHZtX2V2
ZW50X3N0ICpyc3ApOwogCiAvKiBTYW5pdHkgY2hlY2sgZm9yIG1lbV9hY2Nlc3MgaGFyZHdhcmUg
c3VwcG9ydCAqLwogYm9vbCBwMm1fbWVtX2FjY2Vzc19zYW5pdHlfY2hlY2soY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCk7Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmgKKysrIGIveGVu
L2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaApAQCAtMjQsOCArMjQsMTUgQEAKIAogI2luY2x1ZGUg
PHhlbi90eXBlcy5oPgogI2luY2x1ZGUgPHhlbi9tbS5oPgotI2luY2x1ZGUgPHB1YmxpYy9tZW1v
cnkuaD4KLSNpbmNsdWRlIDxwdWJsaWMvdm1fZXZlbnQuaD4KKworLyoKKyAqIGFzbS9tZW1fYWNj
ZXNzLmggaGFzIGZ1bmN0aW9ucyB0YWtpbmcgcG9pbnRlcnMgdG8gdGhpcyBhcyBhcmd1bWVudHMs
CisgKiBhbmQgd2Ugd2FudCB0byBhdm9pZCBoYXZpbmcgdG8gaW5jbHVkZSBwdWJsaWMvdm1fZXZl
bnQuaCBoZXJlICh3aGljaAorICogd291bGQgcHJvdmlkZSB0aGUgZnVsbCBzdHJ1Y3QgZGVmaW5p
dGlvbiBhcyB3ZWxsIGFzIGl0cworICogdm1fZXZlbnRfe3JlcXVlc3QscmVzcG9uc2V9X3QgdHlw
ZWRlZnMuCisgKi8KK3N0cnVjdCB2bV9ldmVudF9zdDsKKwogI2luY2x1ZGUgPGFzbS9tZW1fYWNj
ZXNzLmg+CiAKIC8qCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
