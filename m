Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF1128931
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2019 14:24:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iieff-0004P5-Tm; Sat, 21 Dec 2019 13:19:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iiefe-0004P0-LL
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2019 13:19:50 +0000
X-Inumbo-ID: 8ea98819-23f4-11ea-94b6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ea98819-23f4-11ea-94b6-12813bfff9fa;
 Sat, 21 Dec 2019 13:19:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78058AD11;
 Sat, 21 Dec 2019 13:19:47 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Sat, 21 Dec 2019 14:19:46 +0100
Message-Id: <20191221131946.27017-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: branch for v5.5-rc3
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjViLXJjMy10YWcKCnhlbjogYnJhbmNoIGZvciB2NS41LXJjMwoKSXQgY29udGFpbnMgMiBjbGVh
bnVwIHBhdGNoZXMgYW5kIGEgc21hbGwgc2VyaWVzIGZvciBzdXBwb3J0aW5nCnJlbG9hZGluZyB0
aGUgWGVuIGJsb2NrIGJhY2tlbmQgZHJpdmVyLgoKVGhhbmtzLgoKSnVlcmdlbgoKIGRyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLQogZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyAgICAgICAgICAgICAg
IHwgIDQgKy0tCiBkcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jICAgICAgICAgICAgICAgICAgfCAg
NCAtLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXMuaCAgICAgICAgICAgICAgICB8ICAyIC0t
CiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgICAgICAgICAgfCAzNSArKysrKyst
LS0tLS0tLS0tLS0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyAg
fCAgMSAtCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Zyb250ZW5kLmMgfCAyNCAr
KysrKysrKysrKystCiBpbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5oICAgICAgICAgICAg
fCAyOSArKysrKy0tLS0tLS0tLS0tCiBpbmNsdWRlL3hlbi94ZW5idXMuaCAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCiA5IGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDczIGRl
bGV0aW9ucygtKQoKQWRpdHlhIFBha2tpICgxKToKICAgICAgeGVuL2dyYW50LXRhYmxlOiByZW1v
dmUgbXVsdGlwbGUgQlVHX09OIG9uIGdudHRhYl9pbnRlcmZhY2UKCk5hdGhhbiBDaGFuY2VsbG9y
ICgxKToKICAgICAgeGVuL2Jsa2Zyb250OiBBZGp1c3QgaW5kZW50YXRpb24gaW4geGx2YmRfYWxs
b2NfZ2VuZGlzawoKUGF1bCBEdXJyYW50ICg0KToKICAgICAgeGVuYnVzOiBtb3ZlIHhlbmJ1c19k
ZXZfc2h1dGRvd24oKSBpbnRvIGZyb250ZW5kIGNvZGUuLi4KICAgICAgeGVuYnVzOiBsaW1pdCB3
aGVuIHN0YXRlIGlzIGZvcmNlZCB0byBjbG9zZWQKICAgICAgeGVuL2ludGVyZmFjZTogcmUtZGVm
aW5lIEZST05UL0JBQ0tfUklOR19BVFRBQ0goKQogICAgICB4ZW4tYmxrYmFjazogc3VwcG9ydCBk
eW5hbWljIHVuYmluZC9iaW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
