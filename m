Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055CE13D65B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:04:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is11i-00040Y-6x; Thu, 16 Jan 2020 09:01:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is11g-00040S-W1
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:01:17 +0000
X-Inumbo-ID: bdb3982a-383e-11ea-86c8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdb3982a-383e-11ea-86c8-12813bfff9fa;
 Thu, 16 Jan 2020 09:01:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9507ACB8;
 Thu, 16 Jan 2020 09:01:10 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa791c4d-2078-0280-4730-83fa4782d0ec@suse.com>
Date: Thu, 16 Jan 2020 10:01:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: adjust EFI-related build message
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgb2YgY29tbWl0IDkzMjQ5ZjdmYzE3YyAoIng4Ni9lZmk6IHNwbGl0IGNvbXBpbGVyIHZzIGxp
bmtlciBzdXBwb3J0IiksCkVGSSBzdXBwb3J0IGluIHhlbi5neiBtYXkgYmUgYXZhaWxhYmxlIGV2
ZW4gaWYgbm8geGVuLmVmaSBnZXRzCmdlbmVyYXRlZC4gRGlzdGluZ3Vpc2ggdGhlIGNhc2VzIHdo
ZW4gZW1pdHRpbmcgdGhlIG1lc3NhZ2UuCgpBbHNvIGRyb3AgdGhlIHBvaW50bGVzc2x5IChhZmFp
Y3QpIGxlZnQgdXNlIG9mICQoZmlsdGVyIC4uLikgKG5lZWRlZApvbmx5IHdoZW4gdXNlZCBpbiAk
KGlmIC4uLikpLCBmcm9tIHRoZSBpZmVxKCkgaW50cm9kdWNlZCBieSA3MDU5YWZiMjAyZmYKKCJ4
ODYvTWFrZWZpbGU6IHJlbW92ZSAkKGd1YXJkKSB1c2UgZnJvbSAkKFRBUkdFVCkuZWZpIHRhcmdl
dCIpLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2FyY2gveDg2L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAt
MTk1LDcgKzE5NSw3IEBAIG5vdGVfZmlsZSA6PQogZW5kaWYKIG5vdGVfZmlsZV9vcHRpb24gPz0g
JChub3RlX2ZpbGUpCiAKLWlmZXEgKCQoZmlsdGVyIHksJChYRU5fQlVJTERfUEUpKSx5KQoraWZl
cSAoJChYRU5fQlVJTERfUEUpLHkpCiAkKFRBUkdFVCkuZWZpOiBwcmVsaW5rLWVmaS5vICQobm90
ZV9maWxlKSBlZmkubGRzIGVmaS9yZWxvY3MtZHVtbXkubyBlZmkvbWtyZWxvYwogCSQoZm9yZWFj
aCBiYXNlLCAkKFZJUlRfQkFTRSkgJChBTFRfQkFTRSksIFwKIAkgICAgICAgICAgJChMRCkgJChj
YWxsIEVGSV9MREZMQUdTLCQoYmFzZSkpIC1UIGVmaS5sZHMgLU4gJDwgZWZpL3JlbG9jcy1kdW1t
eS5vIFwKQEAgLTIxOCw3ICsyMTgsOCBAQCAkKFRBUkdFVCkuZWZpOiBwcmVsaW5rLWVmaS5vICQo
bm90ZV9maWxlCiAJcm0gLWYgJChARCkvLiQoQEYpLlswLTldKiAkKEBEKS8uLiQoQEYpLlswLTld
KgogZWxzZQogJChUQVJHRVQpLmVmaTogRk9SQ0UKLQlybSAtZiAkQDsgZWNobyAnRUZJIHN1cHBv
cnQgZGlzYWJsZWQnCisJcm0gLWYgJEAKKwllY2hvICckKGlmICQoZmlsdGVyIHksJChYRU5fQlVJ
TERfRUZJKSkseGVuLmVmaSBnZW5lcmF0aW9uLEVGSSBzdXBwb3J0KSBkaXNhYmxlZCcKIGVuZGlm
CiAKIGVmaS9ib290LmluaXQubyBlZmkvcnVudGltZS5vIGVmaS9jb21wYXQubyBlZmkvYnVpbGRp
ZC5vIGVmaS9yZWxvY3MtZHVtbXkubzogJChCQVNFRElSKS9hcmNoL3g4Ni9lZmkvYnVpbHRfaW4u
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
