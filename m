Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8A8F1CD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 19:15:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyJIS-00058a-0y; Thu, 15 Aug 2019 17:12:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pnYX=WL=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hyJIQ-00058V-Mm
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 17:12:18 +0000
X-Inumbo-ID: d5768914-bf7f-11e9-b90c-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5768914-bf7f-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 17:12:17 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyJIO-00044F-2I; Thu, 15 Aug 2019 17:12:16 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyJIN-0007ak-Qs; Thu, 15 Aug 2019 17:12:15 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 18:11:58 +0100
Message-Id: <20190815171158.33884-1-lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH] Allow get_maintainer.pl / add_maintainers.pl
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
IHwgIDkgKysrKysrLS0tCiBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsICB8IDEzICsrKysrKysr
KysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCBiL3NjcmlwdHMvYWRkX21h
aW50YWluZXJzLnBsCmluZGV4IDA5ZTlmNjYwOWYuLjdmOThkZGU4NzQgMTAwNzU1Ci0tLSBhL3Nj
cmlwdHMvYWRkX21haW50YWluZXJzLnBsCisrKyBiL3NjcmlwdHMvYWRkX21haW50YWluZXJzLnBs
CkBAIC0yNSwxMCArMjUsMTMgQEAgc3ViIG5vcm1hbGl6ZSAoJCQpOwogc3ViIGluc2VydCAoJCQk
JCk7CiBzdWIgaGFzdGFnICgkJCk7CiAKLSMgVG9vbCBWYXJpYWJsZXMKLW15ICRnZXRfbWFpbnRh
aW5lciAgICAgID0gIi4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCI7Ci0KKyMgVG9vbCBWYXJp
YWJsZXMgCiBteSAkdG9vbCA9ICQwOworbXkgJGdldF9tYWludGFpbmVyID0gJHRvb2w7IAorJGdl
dF9tYWludGFpbmVyID1+IHMvYWRkX21haW50YWluZXJzL2dldF9tYWludGFpbmVyLzsgCisKK3By
aW50ICRnZXRfbWFpbnRhaW5lci4iXG4iOworCiBteSAkdXNhZ2UgPSA8PEVPVDsKIE9QVElPTlM6
CiAtLS0tLS0tLQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3Njcmlw
dHMvZ2V0X21haW50YWluZXIucGwKaW5kZXggMTc0ZGZiN2U0MC4uOGJjOTAxMmNkYiAxMDA3NTUK
LS0tIGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbAorKysgYi9zY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsCkBAIC0yNjYsOCArMjY2LDE3IEBAIGlmICgkZW1haWwgJiYKIH0KIAogaWYgKCF0b3Bf
b2ZfdHJlZSgkeGVuX3BhdGgpKSB7Ci0gICAgZGllICIkUDogVGhlIGN1cnJlbnQgZGlyZWN0b3J5
IGRvZXMgbm90IGFwcGVhciB0byBiZSAiCi0JLiAiYSBYZW4gc291cmNlIHRyZWUuXG4iOworICAg
ICMgRG8gbm90IGV4aXQsIGJ1dCBwcmludCBhbiBlcnJvciBtZXNzYWdlIHRvIFNUREVSUiB0byBh
bGxvdyBjYWxsaW5nIAorICAgICMgdGhlIHRvb2wgZnJvbSB4ZW4tcmVsYXRlZCByZXBvcyBzdWNo
IGFzIG1pbmktb3MuZ2l0LCAKKyAgICAjIGxpdmUgcGF0Y2gtYnVpbGQtdG9vbHMuZ2l0LCBldGMK
KyAgICBwcmludCBTVERFUlIgIiRQOlxuIi4KKyAgICAgICAgICAiPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT1cbiIuCisgICAgICAgICAgIldBUk5J
Tkc6IFRoZSBjdXJyZW50IGRpcmVjdG9yeSBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgXG4iLgorCSAg
InRoZSB4ZW4uZ2l0IHNvdXJjZSB0cmVlLlxuXG4iLgorICAgICAgICAgICJUaGUgdG9vbCB3b3Jr
cyBvdXRzaWRlIG9mIHRoZSB4ZW4uZ2l0IHRyZWUsIGlmIHRoZVxuIi4KKyAgICAgICAgICAiTUFJ
TlRBSU5FUlMgZmlsZSBmb2xsb3dzIHRoZSBzYW1lIGZvcm1hdCBhcyB0aGF0IG9mXG4iLgorICAg
ICAgICAgICJ4ZW4uZ2l0LiBVc2UgYXQgeW91ciBvd24gcGVyaWwuXG4iLgorICAgICAgICAgICI9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PVxuIjsK
IH0KIAogIyMgUmVhZCBNQUlOVEFJTkVSUyBmb3IgdHlwZS92YWx1ZSBwYWlycwotLSAKMi4xMy4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
