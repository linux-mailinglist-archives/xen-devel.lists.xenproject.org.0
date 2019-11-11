Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1032F76EC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 15:47:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAwe-0003Et-3T; Mon, 11 Nov 2019 14:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUAwc-0003Ej-Bi
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:45:30 +0000
X-Inumbo-ID: e7c26ad2-0491-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7c26ad2-0491-11ea-b678-bc764e2007e4;
 Mon, 11 Nov 2019 14:45:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14105ACB7;
 Mon, 11 Nov 2019 14:45:29 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Message-ID: <ce1a10f7-ecd1-e4ee-72c3-bc29d914c0e0@suse.com>
Date: Mon, 11 Nov 2019 15:45:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/3] xen/mcelog: drop __MC_MSR_MCGCAP
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaGFzIG5ldmVyIGJlZW4gcGFydCBvZiBYZW4ncyBwdWJsaWMgaW50ZXJmYWNlLCBhbmQgdGhl
cmUncyB0aGVyZWZvcmUKbm8gZ3VhcmFudGVlIGZvciBNQ0dfQ0FQJ3MgdmFsdWUgdG8gYWx3YXlz
IGJlIHByZXNlbnQgaW4gYXJyYXkgZW50cnkgMC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL2RyaXZlcnMveGVuL21jZWxvZy5jCisrKyBiL2Ry
aXZlcnMveGVuL21jZWxvZy5jCkBAIC0yMjIsNyArMjIyLDcgQEAgc3RhdGljIGludCBjb252ZXJ0
X2xvZyhzdHJ1Y3QgbWNfaW5mbyAqbQogCXN0cnVjdCBtY2luZm9fZ2xvYmFsICptY19nbG9iYWw7
CiAJc3RydWN0IG1jaW5mb19iYW5rICptY19iYW5rOwogCXN0cnVjdCB4ZW5fbWNlIG07Ci0JdWlu
dDMyX3QgaTsKKwl1bnNpZ25lZCBpbnQgaSwgajsKIAogCW1pYyA9IE5VTEw7CiAJeDg2X21jaW5m
b19sb29rdXAoJm1pYywgbWksIE1DX1RZUEVfR0xPQkFMKTsKQEAgLTI0OCw3ICsyNDgsMTIgQEAg
c3RhdGljIGludCBjb252ZXJ0X2xvZyhzdHJ1Y3QgbWNfaW5mbyAqbQogCW0uc29ja2V0aWQgPSBn
X3BoeXNpbmZvW2ldLm1jX2NoaXBpZDsKIAltLmNwdSA9IG0uZXh0Y3B1ID0gZ19waHlzaW5mb1tp
XS5tY19jcHVucjsKIAltLmNwdXZlbmRvciA9IChfX3U4KWdfcGh5c2luZm9baV0ubWNfdmVuZG9y
OwotCW0ubWNnY2FwID0gZ19waHlzaW5mb1tpXS5tY19tc3J2YWx1ZXNbX19NQ19NU1JfTUNHQ0FQ
XS52YWx1ZTsKKwlmb3IgKGogPSAwOyBqIDwgZ19waHlzaW5mb1tpXS5tY19ubXNydmFsczsgKytq
KQorCQlzd2l0Y2ggKGdfcGh5c2luZm9baV0ubWNfbXNydmFsdWVzW2pdLnJlZykgeworCQljYXNl
IE1TUl9JQTMyX01DR19DQVA6CisJCQltLm1jZ2NhcCA9IGdfcGh5c2luZm9baV0ubWNfbXNydmFs
dWVzW2pdLnZhbHVlOworCQkJYnJlYWs7CisJCX0KIAogCW1pYyA9IE5VTEw7CiAJeDg2X21jaW5m
b19sb29rdXAoJm1pYywgbWksIE1DX1RZUEVfQkFOSyk7Ci0tLSBhL2luY2x1ZGUveGVuL2ludGVy
ZmFjZS94ZW4tbWNhLmgKKysrIGIvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL3hlbi1tY2EuaApAQCAt
MTgzLDcgKzE4Myw2IEBAIHN0cnVjdCBtY19pbmZvIHsKIERFRklORV9HVUVTVF9IQU5ETEVfU1RS
VUNUKG1jX2luZm8pOwogCiAjZGVmaW5lIF9fTUNfTVNSX0FSUkFZU0laRSA4Ci0jZGVmaW5lIF9f
TUNfTVNSX01DR0NBUCAwCiAjZGVmaW5lIF9fTUNfTk1TUlMgMQogI2RlZmluZSBNQ19OQ0FQUyA3
CiBzdHJ1Y3QgbWNpbmZvX2xvZ2ljYWxfY3B1IHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
