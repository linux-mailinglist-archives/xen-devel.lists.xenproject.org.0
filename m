Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591FB8F21F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 19:25:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyJSt-000678-Gi; Thu, 15 Aug 2019 17:23:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pnYX=WL=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hyJSs-000673-AJ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 17:23:06 +0000
X-Inumbo-ID: 57ba8410-bf81-11e9-a661-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57ba8410-bf81-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 17:23:05 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyJSq-0004HF-Bs; Thu, 15 Aug 2019 17:23:04 +0000
Received: from localhost ([127.0.0.1] helo=UNKNOWN.Home)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyJSq-000803-4Y; Thu, 15 Aug 2019 17:23:04 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 18:22:56 +0100
Message-Id: <20190815172256.34363-1-lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH v2] Allow get_maintainer.pl / add_maintainers.pl
 scripts to be called outside of xen.git
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlLWNhc2U6IEFsbG93IHVzaW5nIGJvdGggc2NyaXB0cyBvbiB4ZW4gcmVwb3NpdG9yaWVzIHN1
Y2ggYXMKbWluaS1vcy5naXQsIG9zc3Rlc3QuZ2l0LAoKVG9vbCBjaGFuZ2VzOgoqIGFkZF9tYWlu
dGFpbmVycy5wbDogJGdldF9tYWludGFpbmVyIGluaGVyaXRzIHBhdGggZnJvbSAkMAoqIGdldF9t
YWludGFpbmVyLnBsOiB3YXJuIChpbnN0ZWFkIGZvIGRpZSkgd2hlbiBjYWxsZWQKICBmcm9tIGEg
ZGlmZmVyZW50IHRyZWUKCkFzc3VtcHRpb25zOiB0aGUgcmVwb3NpdG9yeSBjb250YWlucyBhIE1B
SU5UQUlORVJTIGZpbGUgdGhhdApmb2xsb3dzIHRoZSBzYW1lIGNvbnZlbnRpb25zIGFzIHRoZSBm
aWxlIGluIHhlbi5naXQKCkEgc3VnZ2VzdGVkIHRlbXBsYXRlCgo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpUaGlzIGZpbGUgZm9sbG93cyB0
aGUgc2FtZSBjb252ZW50aW9ucyBhcyBvdXRsaW5lZCBpbgp4ZW4uZ2l0Ok1BSU5UQUlORVJTLiBQ
bGVhc2UgcmVmZXIgdG8gdGhlIGZpbGUgaW4geGVuLmdpdApmb3IgbW9yZSBpbmZvcm1hdGlvbi4K
ClRIRSBSRVNUCk06CU1BSU5UQUlORVIxIDxtYWludGFpbmVyMUBlbWFpbC5jb20+Ck06ICAgICAg
TUFJTlRBSU5FUjIgPG1haW50YWluZXIyQGVtYWlsLmNvbT4KTDoJeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnClM6CVN1cHBvcnRlZApGOgkqLwo9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0
aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgotLS0KIHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBs
IHwgIDQgKystLQogc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAgfCAxMyArKysrKysrKysrKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwgYi9zY3JpcHRzL2FkZF9tYWludGFp
bmVycy5wbAppbmRleCAwOWU5ZjY2MDlmLi41YTZkMGY2MzFiIDEwMDc1NQotLS0gYS9zY3JpcHRz
L2FkZF9tYWludGFpbmVycy5wbAorKysgYi9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbApAQCAt
MjYsOSArMjYsOSBAQCBzdWIgaW5zZXJ0ICgkJCQkKTsKIHN1YiBoYXN0YWcgKCQkKTsKIAogIyBU
b29sIFZhcmlhYmxlcwotbXkgJGdldF9tYWludGFpbmVyICAgICAgPSAiLi9zY3JpcHRzL2dldF9t
YWludGFpbmVyLnBsIjsKLQogbXkgJHRvb2wgPSAkMDsKK215ICRnZXRfbWFpbnRhaW5lciA9ICR0
b29sOworJGdldF9tYWludGFpbmVyID1+IHMvYWRkX21haW50YWluZXJzL2dldF9tYWludGFpbmVy
LzsKIG15ICR1c2FnZSA9IDw8RU9UOwogT1BUSU9OUzoKIC0tLS0tLS0tCmRpZmYgLS1naXQgYS9z
Y3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGIvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbAppbmRl
eCAxNzRkZmI3ZTQwLi5mMWU5YzkwNGVlIDEwMDc1NQotLS0gYS9zY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsCisrKyBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKQEAgLTI2Niw4ICsyNjYsMTcg
QEAgaWYgKCRlbWFpbCAmJgogfQogCiBpZiAoIXRvcF9vZl90cmVlKCR4ZW5fcGF0aCkpIHsKLSAg
ICBkaWUgIiRQOiBUaGUgY3VycmVudCBkaXJlY3RvcnkgZG9lcyBub3QgYXBwZWFyIHRvIGJlICIK
LQkuICJhIFhlbiBzb3VyY2UgdHJlZS5cbiI7CisgICAgIyBEbyBub3QgZXhpdCwgYnV0IHByaW50
IGFuIGVycm9yIG1lc3NhZ2UgdG8gU1RERVJSIHRvIGFsbG93IGNhbGxpbmcKKyAgICAjIHRoZSB0
b29sIGZyb20geGVuLXJlbGF0ZWQgcmVwb3Mgc3VjaCBhcyBtaW5pLW9zLmdpdCwKKyAgICAjIGxp
dmUgcGF0Y2gtYnVpbGQtdG9vbHMuZ2l0LCBldGMKKyAgICBwcmludCBTVERFUlIgIiRQOlxuIi4K
KyAgICAgICAgICAiPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT1cbiIuCisgICAgICAgICAgIldBUk5JTkc6IFRoZSBjdXJyZW50IGRpcmVjdG9yeSBk
b2VzIG5vdCBhcHBlYXIgdG8gYmUgXG4iLgorCSAgInRoZSB4ZW4uZ2l0IHNvdXJjZSB0cmVlLlxu
XG4iLgorICAgICAgICAgICJUaGUgdG9vbCB3b3JrcyBvdXRzaWRlIG9mIHRoZSB4ZW4uZ2l0IHRy
ZWUsIGlmIHRoZVxuIi4KKyAgICAgICAgICAiTUFJTlRBSU5FUlMgZmlsZSBmb2xsb3dzIHRoZSBz
YW1lIGZvcm1hdCBhcyB0aGF0IG9mXG4iLgorICAgICAgICAgICJ4ZW4uZ2l0LiBVc2UgYXQgeW91
ciBvd24gcGVyaWwuXG4iLgorICAgICAgICAgICI9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PVxuIjsKIH0KIAogIyMgUmVhZCBNQUlOVEFJTkVSUyBm
b3IgdHlwZS92YWx1ZSBwYWlycwotLSAKMi4xMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
