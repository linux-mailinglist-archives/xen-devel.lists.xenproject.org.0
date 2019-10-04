Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B6CB417
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 07:09:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGFmP-0006Yf-I8; Fri, 04 Oct 2019 05:05:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGFmN-0006Ya-My
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 05:05:23 +0000
X-Inumbo-ID: 916236ea-e664-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 916236ea-e664-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 05:05:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C50DDB06B;
 Fri,  4 Oct 2019 05:05:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Fri,  4 Oct 2019 07:05:20 +0200
Message-Id: <20191004050520.7270-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fixes and cleanups for 5.4-rc2
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
LjQtcmMyLXRhZwoKeGVuOiBmaXhlcyBhbmQgY2xlYW51cHMgZm9yIDUuNC1yYzIKCkl0IGNvbnRh
aW5zIHRoZSBmb2xsb3dpbmcgcGF0Y2hlczoKCi0gYSBmaXggaW4gdGhlIFhlbiBiYWxsb29uIGRy
aXZlciBhdm9pZGluZyBoaXR0aW5nIGEgQlVHX09OKCkgaW4gc29tZQogIGNhc2VzLCBwbHVzIGEg
Zm9sbG93LW9uIGNsZWFudXAgc2VyaWVzIGZvciB0aGF0IGRyaXZlcgoKLSBhIHBhdGNoIGZvciBp
bnRyb2R1Y2luZyBub24tYmxvY2tpbmcgRUZJIGNhbGxiYWNrcyBpbiBYZW4ncyBFRkkgZHJpdmVy
LAogIHBsdSBhIGNsZWFudXAgcGF0Y2ggZm9yIFhlbiBFRkkgaGFuZGxpbmcgbWVyZ2luZyB0aGUg
eDg2IGFuZCBBUk0gYXJjaAogIHNwZWNpZmljIGluaXRpYWxpemF0aW9uIGludG8gdGhlIFhlbiBF
RkkgZHJpdmVyCgotIGEgZml4IG9mIHRoZSBYZW4geGVuYnVzIGRyaXZlciBhdm9pZGluZyBhIHNl
bGYtZGVhZGxvY2sgd2hlbiBjbGVhbmluZwogIHVwIGFmdGVyIGEgdXNlciBwcm9jZXNzIGhhcyBk
aWVkCgotIGEgZml4IGZvciBYZW4gb24gQVJNIGFmdGVyIHJlbW92YWwgb2YgWk9ORV9ETUEKCi0g
YSBjbGVhbnVwIHBhdGNoIGZvciBhdm9pZGluZyBidWlsZCB3YXJuaW5ncyBmb3IgWGVuIG9uIEFS
TQoKClRoYW5rcy4KCkp1ZXJnZW4KCiBhcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4veGVuLW9wcy5o
ICAgICAgIHwgIDYgLS0tCiBhcmNoL2FybS94ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
IHwgIDEgLQogYXJjaC9hcm0veGVuL2VmaS5jICAgICAgICAgICAgICAgICAgICAgICB8IDI4IC0t
LS0tLS0tLS0tCiBhcmNoL2FybS94ZW4vZW5saWdodGVuLmMgICAgICAgICAgICAgICAgIHwgIDMg
Ky0KIGFyY2gvYXJtL3hlbi9tbS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArLQogYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS94ZW4veGVuLW9wcy5oICAgICB8ICA3IC0tLQogYXJjaC9hcm02
NC94ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAxIC0KIGFyY2gveDg2L3hlbi9lZmku
YyAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArLS0tLS0KIGRyaXZlcnMveGVuL2JhbGxvb24u
YyAgICAgICAgICAgICAgICAgICAgfCAyNCArKystLS0tLS0KIGRyaXZlcnMveGVuL2VmaS5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCA4NCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19kZXZfZnJvbnRlbmQuYyB8IDIwICsrKysrKyst
CiBpbmNsdWRlL3hlbi94ZW4tb3BzLmggICAgICAgICAgICAgICAgICAgIHwgMjUgKy0tLS0tLS0t
LQogMTIgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwgMTM5IGRlbGV0aW9ucygtKQoK
RGF2aWQgSGlsZGVuYnJhbmQgKDQpOgogICAgICB4ZW4vYmFsbG9vbjogU2V0IHBhZ2VzIFBhZ2VP
ZmZsaW5lKCkgaW4gYmFsbG9vbl9hZGRfcmVnaW9uKCkKICAgICAgeGVuL2JhbGxvb246IERyb3Ag
X19iYWxsb29uX2FwcGVuZCgpCiAgICAgIHhlbi9iYWxsb29uOiBNYXJrIHBhZ2VzIFBHX29mZmxp
bmUgaW4gYmFsbG9vbl9hcHBlbmQoKQogICAgICB4ZW4vYmFsbG9vbjogQ2xlYXIgUEdfb2ZmbGlu
ZSBpbiBiYWxsb29uX3JldHJpZXZlKCkKCkp1ZXJnZW4gR3Jvc3MgKDIpOgogICAgICB4ZW4vZWZp
OiBoYXZlIGEgY29tbW9uIHJ1bnRpbWUgc2V0dXAgZnVuY3Rpb24KICAgICAgeGVuL3hlbmJ1czog
Zml4IHNlbGYtZGVhZGxvY2sgYWZ0ZXIga2lsbGluZyB1c2VyIHByb2Nlc3MKClBlbmcgRmFuICgx
KToKICAgICAgYXJtOiB4ZW46IG1tOiB1c2UgX19HUEZfRE1BMzIgZm9yIGFybTY0CgpSb3NzIExh
Z2Vyd2FsbCAoMSk6CiAgICAgIHhlbi9lZmk6IFNldCBub25ibG9ja2luZyBjYWxsYmFja3MKClN0
ZWZhbm8gU3RhYmVsbGluaSAoMSk6CiAgICAgIEFSTTogeGVuOiB1bmV4cG9ydCBIWVBFUlZJU09S
X3BsYXRmb3JtX29wIGZ1bmN0aW9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
