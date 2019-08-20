Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9764D95E21
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 14:10:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i02vN-0004oy-1n; Tue, 20 Aug 2019 12:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xv/m=WQ=amazon.de=prvs=128763efb=wipawel@srs-us1.protection.inumbo.net>)
 id 1i02vM-0004ot-7y
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 12:07:40 +0000
X-Inumbo-ID: 1b16f884-c343-11e9-b90c-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b16f884-c343-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566302859; x=1597838859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HAXsjhTLWwcLFeLtiLgEL4pHnbKqXmrZ3SbE96+6/UM=;
 b=Y+mI0CbQ3ERXvYcOLRLalKTgSIqZMow0dAN+PLCJ5bMGEMrx7rmo7W8o
 0AYsQdcIGkh/pclzOWx/5gcM6zKhTNSDRtWN+8VK5v4e+Ksnq4Db8QZUA
 DFzwd4eqLnn+vT0OOnEjw+f4KqykACPhX58LnQhF61JpKBePqyShmwk22 0=;
X-IronPort-AV: E=Sophos;i="5.64,408,1559520000"; d="scan'208";a="410458113"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 20 Aug 2019 12:07:32 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6EA7B141534; Tue, 20 Aug 2019 12:07:31 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 12:07:31 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 12:07:29 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 20 Aug 2019 12:07:27 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Tue, 20 Aug 2019 12:07:21 +0000
Message-ID: <20190820120721.88445-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190808123527.8340-1-wipawel@amazon.de>
References: <20190808123527.8340-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part2 v3 5/6]
 create-diff-object: Add new entries to special sections array
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com, wipawel@amazon.de,
 konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGFuZGxlIC5saXZlcGF0Y2guaG9va3MqIGFuZCAuYWx0aW5zdHJfcmVwbGFjZW1lbnQgc2VjdGlv
bnMgYXMgdGhlCnNwZWNpYWwgc2VjdGlvbnMgd2l0aCBhc3NpZ25lZCBncm91cF9zaXplIHJlc29s
dXRpb24gZnVuY3Rpb24uCkJ5IGRlZmF1bHQgZWFjaCAubGl2ZXBhdGNoLmhvb2tzKiBzZWN0aW9u
cycgZW50cnkgaXMgOCBieXRlcyBsb25nIChhCnBvaW50ZXIpLiBUaGUgLmFsdGluc3RyX3JlcGxh
Y2VtZW50IHNlY3Rpb24gaGFzIHVuZGVmaW5lZCBncm91cF9zaXplLgoKQWxsb3cgdG8gc3BlY2lm
eSBkaWZmZXJlbnQgLmxpdmVwYXRjaC5ob29rcyogc2VjdGlvbiBlbnRyeSBzaXplIHVzaW5nCnNo
ZWxsIGVudmlyb25tZW50IHZhcmlhYmxlIEhPT0tfU1RSVUNUX1NJWkUuCgpBZGQgYW4gZXhwbGlj
aXQgY2hlY2sgdG8ga3BhdGNoX3JlZ2VuZXJhdGVfc3BlY2lhbF9zZWN0aW9uKCkgc2tpcHBpbmcK
cmVnZW5lcmF0aW9uIG9mIHNwZWNpYWwgc2VjdGlvbnMsIHdob3NlIGdyb3VwX3NpemUgaXMgMC4K
ClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4K
UmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4K
UmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5
OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KLS0tCnYzOgoqIEFkZGVkIGFu
IGV4cGxpY2l0IGNoZWNrIHRvIGtwYXRjaF9yZWdlbmVyYXRlX3NwZWNpYWxfc2VjdGlvbigpCiBz
a2lwcGluZyByZWdlbmVyYXRpb24gb2Ygc3BlY2lhbCBzZWN0aW9ucywgd2hvc2UgZ3JvdXBfc2l6
ZSBpcyAwLgp2MjoKKiBBcHBsaWVkIHN1Z2dlc3Rpb25zIGZyb20gUm9zcyBhbmQgbmVjY2Vzc2Fy
eSBjaGFuZ2VzIGVuZm9yY2VkIGJ5CiBwcmV2aW91cyBwYXRjaCBvZiB0aGUgc2VyaWVzOgogLSBm
aXhlZCBpbmRlbnRhdGlvbgogLSB1c2VkIGxvZ19kZWJ1ZygpIGluc3RlYWQgb2YgcHJpbnRmKCkK
IC0gYWRkZWQgYXV4LiBmdW5jdGlvbiB1bmRlZmluZWRfZ3JvdXBfc2l6ZSgpIHJldHVybmluZyAw
IGZvciBhCiAgIHVuZGVmaW5lZCBncm91cF9zaXplCiAtIGFkZGVkIC5hbHRpbnN0cl9yZXBsYWNl
bWVudCB0byB0aGUgc3BlY2lhbF9zZWN0aW9ucyBhcnJheSBhbmQKICAgZml4ZWQgaXRzIGdyb3Vw
X3NpemUgdG8gdW5kZWZpbmVkICgwKS4KLS0tCiBjcmVhdGUtZGlmZi1vYmplY3QuYyB8IDQyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDM5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRp
ZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCBjNjE4M2MzLi4wZDIzMWQ1
IDEwMDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9jcmVhdGUtZGlmZi1vYmpl
Y3QuYwpAQCAtOTk1LDYgKzk5NSwyNCBAQCBzdGF0aWMgaW50IGFsdGluc3RydWN0aW9uc19ncm91
cF9zaXplKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLCBpbnQgb2Zmc2V0KQogCXJldHVybiBzaXpl
OwogfQogCitzdGF0aWMgaW50IGxpdmVwYXRjaF9ob29rc19ncm91cF9zaXplKHN0cnVjdCBrcGF0
Y2hfZWxmICprZWxmLCBpbnQgb2Zmc2V0KQoreworCXN0YXRpYyBpbnQgc2l6ZSA9IDA7CisJY2hh
ciAqc3RyOworCWlmICghc2l6ZSkgeworCQlzdHIgPSBnZXRlbnYoIkhPT0tfU1RSVUNUX1NJWkUi
KTsKKwkJc2l6ZSA9IHN0ciA/IGF0b2koc3RyKSA6IDg7CisJfQorCisJbG9nX2RlYnVnKCJsaXZl
cGF0Y2hfaG9va3Nfc2l6ZT0lZFxuIiwgc2l6ZSk7CisJcmV0dXJuIHNpemU7Cit9CisKK3N0YXRp
YyBpbnQgdW5kZWZpbmVkX2dyb3VwX3NpemUoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsIGludCBv
ZmZzZXQpCit7CisJcmV0dXJuIDA7Cit9CisKIC8qCiAgKiBUaGUgcmVsYSBncm91cHMgaW4gdGhl
IC5maXh1cCBzZWN0aW9uIHZhcnkgaW4gc2l6ZS4gIFRoZSBiZWdpbm5pbmcgb2YgZWFjaAogICog
LmZpeHVwIHJlbGEgZ3JvdXAgaXMgcmVmZXJlbmNlZCBieSB0aGUgLmV4X3RhYmxlIHNlY3Rpb24u
IFRvIGZpbmQgdGhlIHNpemUKQEAgLTEwNzIsNiArMTA5MCwxOCBAQCBzdGF0aWMgc3RydWN0IHNw
ZWNpYWxfc2VjdGlvbiBzcGVjaWFsX3NlY3Rpb25zW10gPSB7CiAJCS5uYW1lCQk9ICIuYWx0aW5z
dHJ1Y3Rpb25zIiwKIAkJLmdyb3VwX3NpemUJPSBhbHRpbnN0cnVjdGlvbnNfZ3JvdXBfc2l6ZSwK
IAl9LAorCXsKKwkJLm5hbWUJCT0gIi5hbHRpbnN0cl9yZXBsYWNlbWVudCIsCisJCS5ncm91cF9z
aXplCT0gdW5kZWZpbmVkX2dyb3VwX3NpemUsCisJfSwKKwl7CisJCS5uYW1lCQk9ICIubGl2ZXBh
dGNoLmhvb2tzLmxvYWQiLAorCQkuZ3JvdXBfc2l6ZQk9IGxpdmVwYXRjaF9ob29rc19ncm91cF9z
aXplLAorCX0sCisJeworCQkubmFtZQkJPSAiLmxpdmVwYXRjaC5ob29rcy51bmxvYWQiLAorCQku
Z3JvdXBfc2l6ZQk9IGxpdmVwYXRjaF9ob29rc19ncm91cF9zaXplLAorCX0sCiAJe30sCiB9Owog
CkBAIC0xMTQyLDYgKzExNzIsMTUgQEAgc3RhdGljIHZvaWQga3BhdGNoX3JlZ2VuZXJhdGVfc3Bl
Y2lhbF9zZWN0aW9uKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLAogCiAJTElTVF9IRUFEKG5ld3Jl
bGFzKTsKIAorCXNyY19vZmZzZXQgPSAwOworCWRlc3Rfb2Zmc2V0ID0gMDsKKwlncm91cF9zaXpl
ID0gc3BlY2lhbC0+Z3JvdXBfc2l6ZShrZWxmLCBzcmNfb2Zmc2V0KTsKKwlpZiAoZ3JvdXBfc2l6
ZSA9PSAwKSB7CisJCWxvZ19ub3JtYWwoIlNraXBwaW5nIHJlZ2VuZXJhdGlvbiBvZiBhIHNwZWNp
YWwgc2VjdGlvbjogJXNcbiIsCisJCQkgICBzcGVjaWFsLT5uYW1lKTsKKwkJcmV0dXJuOworCX0K
KwogCXNyYyA9IHNlYy0+YmFzZS0+ZGF0YS0+ZF9idWY7CiAJLyogYWxsb2MgYnVmZmVyIGZvciBu
ZXcgYmFzZSBzZWN0aW9uICovCiAJZGVzdCA9IG1hbGxvYyhzZWMtPmJhc2UtPnNoLnNoX3NpemUp
OwpAQCAtMTE1Niw5ICsxMTk1LDYgQEAgc3RhdGljIHZvaWQga3BhdGNoX3JlZ2VuZXJhdGVfc3Bl
Y2lhbF9zZWN0aW9uKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLAogCQl9CiAJfQogCi0JZ3JvdXBf
c2l6ZSA9IDA7Ci0Jc3JjX29mZnNldCA9IDA7Ci0JZGVzdF9vZmZzZXQgPSAwOwogCWZvciAoIDsg
c3JjX29mZnNldCA8IHNlYy0+YmFzZS0+c2guc2hfc2l6ZTsgc3JjX29mZnNldCArPSBncm91cF9z
aXplKSB7CiAKIAkJZ3JvdXBfc2l6ZSA9IHNwZWNpYWwtPmdyb3VwX3NpemUoa2VsZiwgc3JjX29m
ZnNldCk7Ci0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBH
bWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlz
dGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQg
Q2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERF
IDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
