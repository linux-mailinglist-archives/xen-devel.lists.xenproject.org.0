Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26731A811B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5TUX-0006VO-NR; Wed, 04 Sep 2019 11:30:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WgxQ=W7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5TUW-0006Uw-9j
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:30:24 +0000
X-Inumbo-ID: 604baa06-cf07-11e9-978d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 604baa06-cf07-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 11:30:20 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i5TUQ-0005cF-QR; Wed, 04 Sep 2019 11:30:18 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i5TUQ-0004TJ-KZ; Wed, 04 Sep 2019 11:30:18 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Sep 2019 12:30:10 +0100
Message-Id: <0b543489f930ab966d916e47a738d77de793b8c4.1567596460.git-series.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
In-Reply-To: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v4 3/3] Add logic to use V section entry in THE
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
RmFpbCB3aXRoIGV4dGVuZGVkIGVycm9yIG1lc3NhZ2Ugd2hlbiB1c2VkIG91dCBvZiB0cmVlCgpT
aWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Ci0tLQogc2Ny
aXB0cy9nZXRfbWFpbnRhaW5lci5wbCB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGIvc2NyaXB0cy9n
ZXRfbWFpbnRhaW5lci5wbAppbmRleCAxNzRkZmI3Li4yZTY2MWY0IDEwMDc1NQotLS0gYS9zY3Jp
cHRzL2dldF9tYWludGFpbmVyLnBsCisrKyBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKQEAg
LTI2NSwxMSArMjY1LDYgQEAgaWYgKCRlbWFpbCAmJgogICAgIGRpZSAiJFA6IFBsZWFzZSBzZWxl
Y3QgYXQgbGVhc3QgMSBlbWFpbCBvcHRpb25cbiI7CiB9CiAKLWlmICghdG9wX29mX3RyZWUoJHhl
bl9wYXRoKSkgewotICAgIGRpZSAiJFA6IFRoZSBjdXJyZW50IGRpcmVjdG9yeSBkb2VzIG5vdCBh
cHBlYXIgdG8gYmUgIgotCS4gImEgWGVuIHNvdXJjZSB0cmVlLlxuIjsKLX0KLQogIyMgUmVhZCBN
QUlOVEFJTkVSUyBmb3IgdHlwZS92YWx1ZSBwYWlycwogCiBteSBAdHlwZXZhbHVlID0gKCk7CkBA
IC0zMTEsNiArMzA2LDE2IEBAIHdoaWxlICg8JG1haW50PikgewogfQogY2xvc2UoJG1haW50KTsK
IAorIyBDaGVjayB3aGV0aGVyIHdlIGhhdmUgYSBWIGVudHJ5IHVuZGVyIHRoZSBSRVNUCisjIGFu
ZCB1c2UgaXQgdG8gZ2V0IHRoZSBmaWxlJ3MgdmVyc2lvbiBudW1iZXIKK215ICRtYWludGFpbmVy
c19maWxlX3ZlcnNpb24gPSBnZXRfeGVuX21haW50YWluZXJzX2ZpbGVfdmVyc2lvbigpOworaWYg
KCEkbWFpbnRhaW5lcnNfZmlsZV92ZXJzaW9uKSB7CisgICAgZGllICIkUDogdGhlIE1BSU5UQUlO
RVJTIGZpbGUgIi4KKyAgICAgICAgICJpbiB0aGUgY3VycmVudCBkaXJlY3RvcnkgZG9lcyBub3Qg
YXBwZWFyIHRvIGJlIGZyb20gIi4KKyAgICAgICAgICJ0aGUgeGVuLmdpdCBzb3VyY2UgdHJlZSBv
ciBhIHNpc3RlciB0cmVlLlxuXG4iLgorICAgICAgICAgIkEgJ1Y6IHhlbi1tYWludGFpbmVycy08
dmVyc2lvbj4nIGVudHJ5IHVuZGVyIFRIRSBSRVNUICIuCisgICAgICAgICAiaXMgbmVlZGVkIHRv
IGlkZW50aWZ5IGEgWGVuIE1BSU5UQUlORVJTIGZpbGUuXG5cbiI7Cit9CiAKICMKICMgUmVhZCBt
YWlsIGFkZHJlc3MgbWFwCkBAIC01NjQsNiArNTY5LDMxIEBAIHN1YiByYW5nZV9oYXNfbWFpbnRh
aW5lciB7CiAgICAgcmV0dXJuIDA7CiB9CiAKK3N1YiBnZXRfeGVuX21haW50YWluZXJzX2ZpbGVf
dmVyc2lvbiB7CisgICAgbXkgJHR2aSA9IGZpbmRfZmlyc3Rfc2VjdGlvbigpOworCisgICAgd2hp
bGUgKCR0dmkgPCBAdHlwZXZhbHVlKSB7CisgICAgICAgIG15ICRzdGFydCA9IGZpbmRfc3RhcnRp
bmdfaW5kZXgoJHR2aSk7CisgICAgICAgIG15ICRlbmQgPSBmaW5kX2VuZGluZ19pbmRleCgkdHZp
KTsKKyAgICAgICAgbXkgJGk7CisKKyAgICAgICAgZm9yICgkaSA9ICRzdGFydDsgJGkgPCAkZW5k
OyAkaSsrKSB7CisgICAgICAgICAgICBteSAkbGluZSA9ICR0eXBldmFsdWVbJGldOworICAgICAg
ICAgICAgaWYgKCRsaW5lID1+IG0vXlY6XHMqKC4qKS8pIHsKKyAgICAgICAgICAgICAgICAjIE5v
dGUgdGhhdCBnZXRfbWFpbnRhaW5lcl9yb2xlKCkgcmVxdWlyZXMgcHJvY2Vzc2luZworICAgICAg
ICAgICAgICAgICMgb2YgbW9yZSBvZiB0aGUgZmlsZS4gU28gZG8gaXQgZGlyZWN0bHkKKyAgICAg
ICAgICAgICAgICBpZiAoJHR5cGV2YWx1ZVskc3RhcnRdIGVxICJUSEUgUkVTVCIpIHsKKyAgICAg
ICAgICAgICAgICAgICAgaWYgKCRsaW5lID1+IG0veGVuLW1haW50YWluZXJzLSguKikvKSB7Cisg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gJDE7CisgICAgICAgICAgICAgICAgICAgIH0K
KyAgICAgICAgICAgICAgICB9CisJICAgIH0KKyAgICAgICAgfQorICAgICAgICAkdHZpID0gJGVu
ZCArIDE7CisgICAgfQorICAgIHJldHVybiAwOworfQorCiBzdWIgZ2V0X21haW50YWluZXJzIHsK
ICAgICAlZW1haWxfaGFzaF9uYW1lID0gKCk7CiAgICAgJWVtYWlsX2hhc2hfYWRkcmVzcyA9ICgp
OwpAQCAtODY3LDIzICs4OTcsNiBAQCBOb3RlczoKIEVPVAogfQogCi1zdWIgdG9wX29mX3RyZWUg
ewotICAgIG15ICgkeGVuX3BhdGgpID0gQF87Ci0KLSAgICBpZiAoJHhlbl9wYXRoIG5lICIiICYm
IHN1YnN0cigkeGVuX3BhdGgsbGVuZ3RoKCR4ZW5fcGF0aCktMSwxKSBuZSAiLyIpIHsKLQkkeGVu
X3BhdGggLj0gIi8iOwotICAgIH0KLSAgICBpZiAoICAgICgtZiAiJHt4ZW5fcGF0aH1DT1BZSU5H
IikKLSAgICAgICAgJiYgKC1mICIke3hlbl9wYXRofU1BSU5UQUlORVJTIikKLSAgICAgICAgJiYg
KC1mICIke3hlbl9wYXRofU1ha2VmaWxlIikKLSAgICAgICAgJiYgKC1kICIke3hlbl9wYXRofWRv
Y3MiKQotICAgICAgICAmJiAoLWYgIiR7eGVuX3BhdGh9Q09ESU5HX1NUWUxFIikKLSAgICAgICAg
JiYgKC1kICIke3hlbl9wYXRofXhlbiIpKSB7Ci0JcmV0dXJuIDE7Ci0gICAgfQotICAgIHJldHVy
biAwOwotfQotCiBzdWIgcGFyc2VfZW1haWwgewogICAgIG15ICgkZm9ybWF0dGVkX2VtYWlsKSA9
IEBfOwogCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
