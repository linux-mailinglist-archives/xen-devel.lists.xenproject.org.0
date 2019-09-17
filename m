Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B888B4745
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:18:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6nI-0001EK-Ao; Tue, 17 Sep 2019 06:16:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6nG-0001E6-Fs
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:16:54 +0000
X-Inumbo-ID: bdf88e66-d912-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdf88e66-d912-11e9-9601-12813bfff9fa;
 Tue, 17 Sep 2019 06:16:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9FCAAC93;
 Tue, 17 Sep 2019 06:16:52 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Message-ID: <b3c9a7a7-b47e-b582-a8ce-1608b7f2c850@suse.com>
Date: Tue, 17 Sep 2019 08:16:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 7/9] x86/HVM: cosmetics to hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWxpbWluYXRlIHRoZSBub3QgcmVhbGx5IHVzZWZ1bCBsb2NhbCB2YXJpYWJsZSAib2xkIi4gUmVk
dWNlIHRoZSBzY29wZQpvZiAicGFnZSIuIFJlbmFtZSB0aGUgbGF0Y2hlZCAiY3VycmVudCIuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCnYyOiBSZS1iYXNl
IG92ZXIgY2hhbmdlIGVhcmxpZXIgaW4gdGhlIHNlcmllcy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMjI5NiwxMCArMjI5Niw4
IEBAIGludCBodm1fc2V0X2NyMCh1bnNpZ25lZCBsb25nIHZhbHVlLCBib28KIAogaW50IGh2bV9z
ZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbm9mbHVzaCwgYm9vbCBtYXlfZGVmZXIp
CiB7Ci0gICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50OwotICAgIHN0cnVjdCBkb21haW4gKmN1
cnJkID0gdi0+ZG9tYWluOwotICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7Ci0gICAgdW5zaWdu
ZWQgbG9uZyBvbGQgPSB2LT5hcmNoLmh2bS5ndWVzdF9jclszXTsKKyAgICBzdHJ1Y3QgdmNwdSAq
Y3VyciA9IGN1cnJlbnQ7CisgICAgc3RydWN0IGRvbWFpbiAqY3VycmQgPSBjdXJyLT5kb21haW47
CiAKICAgICBpZiAoIHZhbHVlID4+IGN1cnJkLT5hcmNoLmNwdWlkLT5leHRkLm1heHBoeXNhZGRy
ICkKICAgICB7CkBAIC0yMzExLDM2ICsyMzA5LDM4IEBAIGludCBodm1fc2V0X2NyMyh1bnNpZ25l
ZCBsb25nIHZhbHVlLCBib28KICAgICBpZiAoIG1heV9kZWZlciAmJiB1bmxpa2VseShjdXJyZC0+
YXJjaC5tb25pdG9yLndyaXRlX2N0cmxyZWdfZW5hYmxlZCAmCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbW9uaXRvcl9jdHJscmVnX2JpdG1hc2soVk1fRVZFTlRfWDg2X0NSMykpICkK
ICAgICB7Ci0gICAgICAgIEFTU0VSVCh2LT5hcmNoLnZtX2V2ZW50KTsKKyAgICAgICAgQVNTRVJU
KGN1cnItPmFyY2gudm1fZXZlbnQpOwogCi0gICAgICAgIGlmICggaHZtX21vbml0b3JfY3JYKENS
MywgdmFsdWUsIG9sZCkgKQorICAgICAgICBpZiAoIGh2bV9tb25pdG9yX2NyWChDUjMsIHZhbHVl
LCBjdXJyLT5hcmNoLmh2bS5ndWVzdF9jclszXSkgKQogICAgICAgICB7CiAgICAgICAgICAgICAv
KiBUaGUgYWN0dWFsIHdyaXRlIHdpbGwgb2NjdXIgaW4gaHZtX2RvX3Jlc3VtZSgpLCBpZiBwZXJt
aXR0ZWQuICovCi0gICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT53cml0ZV9kYXRhLmRvX3dy
aXRlLmNyMyA9IDE7Ci0gICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT53cml0ZV9kYXRhLmNy
MyA9IHZhbHVlOwotICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+d3JpdGVfZGF0YS5jcjNf
bm9mbHVzaCA9IG5vZmx1c2g7CisgICAgICAgICAgICBjdXJyLT5hcmNoLnZtX2V2ZW50LT53cml0
ZV9kYXRhLmRvX3dyaXRlLmNyMyA9IDE7CisgICAgICAgICAgICBjdXJyLT5hcmNoLnZtX2V2ZW50
LT53cml0ZV9kYXRhLmNyMyA9IHZhbHVlOworICAgICAgICAgICAgY3Vyci0+YXJjaC52bV9ldmVu
dC0+d3JpdGVfZGF0YS5jcjNfbm9mbHVzaCA9IG5vZmx1c2g7CiAKICAgICAgICAgICAgIHJldHVy
biBYODZFTVVMX09LQVk7CiAgICAgICAgIH0KICAgICB9CiAKLSAgICBpZiAoIGh2bV9wYWdpbmdf
ZW5hYmxlZCh2KSAmJiAhcGFnaW5nX21vZGVfaGFwKGN1cnJkKSAmJgotICAgICAgICAgKCh2YWx1
ZSBeIHYtPmFyY2guaHZtLmd1ZXN0X2NyWzNdKSA+PiBQQUdFX1NISUZUKSApCisgICAgaWYgKCBo
dm1fcGFnaW5nX2VuYWJsZWQoY3VycikgJiYgIXBhZ2luZ19tb2RlX2hhcChjdXJyZCkgJiYKKyAg
ICAgICAgICgodmFsdWUgXiBjdXJyLT5hcmNoLmh2bS5ndWVzdF9jclszXSkgPj4gUEFHRV9TSElG
VCkgKQogICAgIHsKICAgICAgICAgLyogU2hhZG93LW1vZGUgQ1IzIGNoYW5nZS4gQ2hlY2sgUERC
UiBhbmQgdXBkYXRlIHJlZmNvdW50cy4gKi8KKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZTsKKwogICAgICAgICBIVk1fREJHX0xPRyhEQkdfTEVWRUxfVk1NVSwgIkNSMyB2YWx1ZSA9ICVs
eCIsIHZhbHVlKTsKICAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGN1cnJkLCB2YWx1
ZSA+PiBQQUdFX1NISUZULCBOVUxMLCBQMk1fQUxMT0MpOwogICAgICAgICBpZiAoICFwYWdlICkK
ICAgICAgICAgICAgIGdvdG8gYmFkX2NyMzsKIAotICAgICAgICBwdXRfcGFnZShwYWdldGFibGVf
Z2V0X3BhZ2Uodi0+YXJjaC5ndWVzdF90YWJsZSkpOwotICAgICAgICB2LT5hcmNoLmd1ZXN0X3Rh
YmxlID0gcGFnZXRhYmxlX2Zyb21fcGFnZShwYWdlKTsKKyAgICAgICAgcHV0X3BhZ2UocGFnZXRh
YmxlX2dldF9wYWdlKGN1cnItPmFyY2guZ3Vlc3RfdGFibGUpKTsKKyAgICAgICAgY3Vyci0+YXJj
aC5ndWVzdF90YWJsZSA9IHBhZ2V0YWJsZV9mcm9tX3BhZ2UocGFnZSk7CiAKICAgICAgICAgSFZN
X0RCR19MT0coREJHX0xFVkVMX1ZNTVUsICJVcGRhdGUgQ1IzIHZhbHVlID0gJWx4IiwgdmFsdWUp
OwogICAgIH0KIAotICAgIHYtPmFyY2guaHZtLmd1ZXN0X2NyWzNdID0gdmFsdWU7Ci0gICAgcGFn
aW5nX3VwZGF0ZV9jcjModiwgbm9mbHVzaCk7CisgICAgY3Vyci0+YXJjaC5odm0uZ3Vlc3RfY3Jb
M10gPSB2YWx1ZTsKKyAgICBwYWdpbmdfdXBkYXRlX2NyMyhjdXJyLCBub2ZsdXNoKTsKICAgICBy
ZXR1cm4gWDg2RU1VTF9PS0FZOwogCiAgYmFkX2NyMzoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
