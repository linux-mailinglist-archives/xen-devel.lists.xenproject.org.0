Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C291686201
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:38:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhdu-0004cU-6Z; Thu, 08 Aug 2019 12:35:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHrm=WE=amazon.de=prvs=1160688d3=wipawel@srs-us1.protection.inumbo.net>)
 id 1hvhds-0004cP-IK
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 12:35:40 +0000
X-Inumbo-ID: 06d939c3-b9d9-11e9-8980-bc764e045a96
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 06d939c3-b9d9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565267739; x=1596803739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Js6PJE3UjOii59BEYIZ3mRhXNeH19b11JmWgtEHXC/o=;
 b=SQBeSQ+Dzj0gW/noMjGkwsBfwdBPfQhnxh6Qr/tB9Cf9Oa5MTa/OA9Eb
 PtVQygiGB6um8dlPNWC9IeKbfNtLFxvC05EVBNIH1+JbyNcE3QSF5ombl
 BiHwAl/njqwTyw2N4m+M0p1ZDNcipYQZ5/vqpeqcHRvJ9cVTJW+eLnncg 8=;
X-IronPort-AV: E=Sophos;i="5.64,361,1559520000"; d="scan'208";a="692034115"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 08 Aug 2019 12:35:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3117CA211B; Thu,  8 Aug 2019 12:35:37 +0000 (UTC)
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:35:36 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:35:35 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Thu, 8 Aug 2019 12:35:33 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Thu, 8 Aug 2019 12:35:27 +0000
Message-ID: <20190808123527.8340-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190416120716.26269-5-wipawel@amazon.de>
References: <20190416120716.26269-5-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part2 v2 5/6]
 create-diff-object: Add new entries to special sections array array
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, konrad.wilk@oracle.com
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
ZWxsIGVudmlyb25tZW50IHZhcmlhYmxlIEhPT0tfU1RSVUNUX1NJWkUuCgpTaWduZWQtb2ZmLWJ5
OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBB
bmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBC
am9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50
aGV5IDxubWFudGhleUBhbWF6b24uZGU+Ci0tLQp2MjoKKiBBcHBsaWVkIHN1Z2dlc3Rpb25zIGZy
b20gUm9zcyBhbmQgbmVjY2Vzc2FyeSBjaGFuZ2VzIGVuZm9yY2VkIGJ5CiAgcHJldmlvdXMgcGF0
Y2ggb2YgdGhlIHNlcmllczoKICAtIGZpeGVkIGluZGVudGF0aW9uCiAgLSB1c2VkIGxvZ19kZWJ1
ZygpIGluc3RlYWQgb2YgcHJpbnRmKCkKICAtIGFkZGVkIGF1eC4gZnVuY3Rpb24gdW5kZWZpbmVk
X2dyb3VwX3NpemUoKSByZXR1cm5pbmcgMCBmb3IgYQogICAgdW5kZWZpbmVkIGdyb3VwX3NpemUK
ICAtIGFkZGVkIC5hbHRpbnN0cl9yZXBsYWNlbWVudCB0byB0aGUgc3BlY2lhbF9zZWN0aW9ucyBh
cnJheSBhbmQKICAgIGZpeGVkIGl0cyBncm91cF9zaXplIHRvIHVuZGVmaW5lZCAoMCkuCi0tLQog
Y3JlYXRlLWRpZmYtb2JqZWN0LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRp
ZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCBjNjE4M2MzLi44MzY1YWYw
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
Ci0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkty
YXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBT
Y2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxv
dHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAy
MzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
