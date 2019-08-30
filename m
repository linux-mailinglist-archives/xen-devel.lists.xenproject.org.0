Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACDA3EDA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 22:13:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3nDq-00056v-7H; Fri, 30 Aug 2019 20:10:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=69lB=W2=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i3nDp-00056h-Cp
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 20:10:13 +0000
X-Inumbo-ID: 299afaa0-cb62-11e9-951b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 299afaa0-cb62-11e9-951b-bc764e2007e4;
 Fri, 30 Aug 2019 20:10:07 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDi-0007i7-At; Fri, 30 Aug 2019 20:10:06 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDi-0003Pk-1a; Fri, 30 Aug 2019 20:10:06 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 30 Aug 2019 21:09:53 +0100
Message-Id: <b074bb1de3366dddbdde8e34703e35d9e6e1eab8.1567195654.git-series.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
In-Reply-To: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v3 3/3] Add logic to use V section entry in THE
 REST for identifying xen trees
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

U3BlY2lmaWNhbGx5OgoqIE1vdmUgY2hlY2sgdW50aWwgYWZ0ZXIgdGhlIE1BSU5UQUlORVJTIGZp
bGUgaGFzIGJlZW4gcmVhZAoqIEFkZCBnZXRfeGVuX21haW50YWluZXJzX2ZpbGVfdmVyc2lvbigp
IGZvciBjaGVjawoqIFJlbW92ZSB0b3Bfb2ZfdHJlZSBhcyBub3QgbmVlZGVkIGFueSBtb3JlCiog
RmFpdWwgd2l0aCBleHRlbmRlZCBlcnJvciBtZXNzYWdlIHdoZW4gdXNlZCBvdXQgb2YgdHJlZQoK
U2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgotLS0KIHNj
cmlwdHMvZ2V0X21haW50YWluZXIucGwgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMv
Z2V0X21haW50YWluZXIucGwKaW5kZXggMTc0ZGZiNy4uZmU4NGExMiAxMDA3NTUKLS0tIGEvc2Ny
aXB0cy9nZXRfbWFpbnRhaW5lci5wbAorKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCkBA
IC0yNjUsMTEgKzI2NSw2IEBAIGlmICgkZW1haWwgJiYKICAgICBkaWUgIiRQOiBQbGVhc2Ugc2Vs
ZWN0IGF0IGxlYXN0IDEgZW1haWwgb3B0aW9uXG4iOwogfQogCi1pZiAoIXRvcF9vZl90cmVlKCR4
ZW5fcGF0aCkpIHsKLSAgICBkaWUgIiRQOiBUaGUgY3VycmVudCBkaXJlY3RvcnkgZG9lcyBub3Qg
YXBwZWFyIHRvIGJlICIKLQkuICJhIFhlbiBzb3VyY2UgdHJlZS5cbiI7Ci19Ci0KICMjIFJlYWQg
TUFJTlRBSU5FUlMgZm9yIHR5cGUvdmFsdWUgcGFpcnMKIAogbXkgQHR5cGV2YWx1ZSA9ICgpOwpA
QCAtMzExLDYgKzMwNiwxNiBAQCB3aGlsZSAoPCRtYWludD4pIHsKIH0KIGNsb3NlKCRtYWludCk7
CiAKKyMgQ2hlY2sgd2hldGhlciB3ZSBoYXZlIGEgViBlbnRyeSB1bmRlciB0aGUgUkVTVAorIyBo
bmQgdXNlIGl0IHRvIGdldCB0aGUgZmlsZSdzIHZlcnNpb24gbnVtYmVyCitteSAkbWFpbnRhaW5l
cnNfZmlsZV92ZXJzaW9uID0gZ2V0X3hlbl9tYWludGFpbmVyc19maWxlX3ZlcnNpb24oKTsKK2lm
ICghJG1haW50YWluZXJzX2ZpbGVfdmVyc2lvbikgeworICAgIGRpZSAiJFA6IHRoZSBNQUlOVEFJ
TkVSUyBmaWxlICIuCisgICAgICAgICAiaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5IGRvZXMgbm90
IGFwcGVhciB0byBiZSBmcm9tICIuCisgICAgICAgICAidGhlIHhlbi5naXQgc291cmNlIHRyZWUg
b3IgYSBzaXN0ZXIgdHJlZS5cblxuIi4KKyAgICAgICAgICJBICdWOiB4ZW4tbWFpbnRhaW5lcnMt
PHZlcnNpb24+JyBlbnRyeSB1bmRlciBUSEUgUkVTVCAiLgorICAgICAgICAgImlzIG5lZWRlZCB0
byBpZGVudGlmeSBhIFhlbiBNQUlOVEFJTkVSUyBmaWxlLlxuXG4iOworfQogCiAjCiAjIFJlYWQg
bWFpbCBhZGRyZXNzIG1hcApAQCAtNTY0LDYgKzU2OSwzMiBAQCBzdWIgcmFuZ2VfaGFzX21haW50
YWluZXIgewogICAgIHJldHVybiAwOwogfQogCitzdWIgZ2V0X3hlbl9tYWludGFpbmVyc19maWxl
X3ZlcnNpb24geworICAgIG15ICR0dmkgPSBmaW5kX2ZpcnN0X3NlY3Rpb24oKTsKKworICAgIHdo
aWxlICgkdHZpIDwgQHR5cGV2YWx1ZSkgeworICAgICAgICBteSAkc3RhcnQgPSBmaW5kX3N0YXJ0
aW5nX2luZGV4KCR0dmkpOworICAgICAgICBteSAkZW5kID0gZmluZF9lbmRpbmdfaW5kZXgoJHR2
aSk7CisgICAgICAgIG15ICRpOworCisgICAgICAgIGZvciAoJGkgPSAkc3RhcnQ7ICRpIDwgJGVu
ZDsgJGkrKykgeworICAgICAgICAgICAgbXkgJGxpbmUgPSAkdHlwZXZhbHVlWyRpXTsKKwkgICAg
aWYgKCRsaW5lID1+IG0vXlY6XHMqKC4qKS8pIHsKKyAgICAgICAgICAgICAgICBteSAkdHlwZSA9
ICQxOworICAgICAgICAgICAgICAgICMgTm90ZSB0aGF0IGdldF9tYWludGFpbmVyX3JvbGUoKSBy
ZXF1aXJlcyBwcm9jZXNzaW5nCisgICAgICAgICAgICAgICAgIyBvZiBtb3JlIG9mIHRoZSBmaWxl
LiBTbyBkbyBpdCBkaXJlY3RseQorICAgICAgICAgICAgICAgIGlmICgkdHlwZXZhbHVlWyRzdGFy
dF0gZXEgIlRIRSBSRVNUIikgeworICAgICAgICAgICAgICAgICAgICBpZiAoJGxpbmUgPX4gbS94
ZW4tbWFpbnRhaW5lcnMtKC4qKS8pIHsKKyAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAk
MTsKKyAgICAgICAgICAgICAgICAgICAgfQorICAgICAgICAgICAgICAgIH0KKwkgICAgfQorICAg
ICAgICB9CisgICAgICAgICR0dmkgPSAkZW5kICsgMTsKKyAgICB9CisgICAgcmV0dXJuIDA7Cit9
CisKIHN1YiBnZXRfbWFpbnRhaW5lcnMgewogICAgICVlbWFpbF9oYXNoX25hbWUgPSAoKTsKICAg
ICAlZW1haWxfaGFzaF9hZGRyZXNzID0gKCk7CkBAIC04NjcsMjMgKzg5OCw2IEBAIE5vdGVzOgog
RU9UCiB9CiAKLXN1YiB0b3Bfb2ZfdHJlZSB7Ci0gICAgbXkgKCR4ZW5fcGF0aCkgPSBAXzsKLQot
ICAgIGlmICgkeGVuX3BhdGggbmUgIiIgJiYgc3Vic3RyKCR4ZW5fcGF0aCxsZW5ndGgoJHhlbl9w
YXRoKS0xLDEpIG5lICIvIikgewotCSR4ZW5fcGF0aCAuPSAiLyI7Ci0gICAgfQotICAgIGlmICgg
ICAgKC1mICIke3hlbl9wYXRofUNPUFlJTkciKQotICAgICAgICAmJiAoLWYgIiR7eGVuX3BhdGh9
TUFJTlRBSU5FUlMiKQotICAgICAgICAmJiAoLWYgIiR7eGVuX3BhdGh9TWFrZWZpbGUiKQotICAg
ICAgICAmJiAoLWQgIiR7eGVuX3BhdGh9ZG9jcyIpCi0gICAgICAgICYmICgtZiAiJHt4ZW5fcGF0
aH1DT0RJTkdfU1RZTEUiKQotICAgICAgICAmJiAoLWQgIiR7eGVuX3BhdGh9eGVuIikpIHsKLQly
ZXR1cm4gMTsKLSAgICB9Ci0gICAgcmV0dXJuIDA7Ci19Ci0KIHN1YiBwYXJzZV9lbWFpbCB7CiAg
ICAgbXkgKCRmb3JtYXR0ZWRfZW1haWwpID0gQF87CiAKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
