Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C102BA811C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:32:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5TUT-0006TG-Dd; Wed, 04 Sep 2019 11:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WgxQ=W7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5TUS-0006SN-0d
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:30:20 +0000
X-Inumbo-ID: 60088bae-cf07-11e9-b299-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60088bae-cf07-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 11:30:19 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i5TUP-0005c8-GV; Wed, 04 Sep 2019 11:30:17 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i5TUP-0004TJ-AI; Wed, 04 Sep 2019 11:30:17 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Sep 2019 12:30:09 +0100
Message-Id: <c3c41841ac809b600241b41400f18e12971aad8f.1567596460.git-series.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
In-Reply-To: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v4 2/3] Add V section entry to allow
 identification of Xen MAINTAINERS file
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

VGhpcyBjaGFuZ2UgcHJvdmlkZXMgc3VmZmljaWVudCBpbmZvcm1hdGlvbiB0byBhbGxvdyBnZXRf
bWFpbnRhaW5lci5wbCAvCmFkZF9tYWludGFpbmVycy5wbCBzY3JpcHRzIHRvIGJlIHJ1biBvbiB4
ZW4gc2lzdGVyIHJlcG9zaXRvcmllcyBzdWNoIGFzCm1pbmktb3MuZ2l0LCBvc3N0ZXN0LmdpdCwg
ZXRjCgpBIHN1Z2dlc3RlZCB0ZW1wbGF0ZSBmb3Igc2lzdGVyIHJlcG9zaXRvcmllcyBvZiBYZW4g
aXMKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09ClRoaXMgZmlsZSBmb2xsb3dzIHRoZSBzYW1lIGNvbnZlbnRpb25zIGFzIG91dGxpbmVkIGlu
Cnhlbi5naXQ6TUFJTlRBSU5FUlMuIFBsZWFzZSByZWZlciB0byB0aGUgZmlsZSBpbiB4ZW4uZ2l0
CmZvciBtb3JlIGluZm9ybWF0aW9uLgoKVEhFIFJFU1QKTTogICAgICBNQUlOVEFJTkVSMSA8bWFp
bnRhaW5lcjFAZW1haWwuY29tPgpNOiAgICAgIE1BSU5UQUlORVIyIDxtYWludGFpbmVyMkBlbWFp
bC5jb20+Ckw6ICAgICAgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnClM6ICAgICAgU3Vw
cG9ydGVkCkY6ICAgICAgKgpGOiAgICAgICovClY6ICAgICAgeGVuLW1haW50YWluZXJzLTEKPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KClNp
Z25lZC1vZmYtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNzc0MTNlMC4uYmIzZGE0MyAxMDA2NDQKLS0tIGEvTUFJ
TlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTk3LDYgKzk3LDkgQEAgRGVzY3JpcHRpb25z
IG9mIHNlY3Rpb24gZW50cmllczoKIAkgICAgICBtYXRjaGVzIHBhdGNoZXMgb3IgZmlsZXMgdGhh
dCBjb250YWluIG9uZSBvciBtb3JlIG9mIHRoZSB3b3JkcwogCSAgICAgIHByaW50aywgcHJfaW5m
byBvciBwcl9lcnIKIAkgICBPbmUgcmVnZXggcGF0dGVybiBwZXIgbGluZS4gIE11bHRpcGxlIEs6
IGxpbmVzIGFjY2VwdGFibGUuCisJVjogVmVyc2lvbiBpZGVudGlmaWVyIHRoYXQgbXVzdCBiZSB1
bmRlciBUSEUgUkVTVCBhbmQgZm9sbG93cworCSAgIHRoZSBmb3JtYXQ6CisJICAgeGVuLW1haW50
YWluZXJzLTx2ZXJzaW9uIGZvcm1hdCBudW1iZXIgb2YgdGhpcyBmaWxlPgogCiAKIFRoZSBtZWFu
aW5nIG9mIG5lc3Rpbmc6CkBAIC01NDEsMyArNTQ0LDQgQEAgTDoJeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCiBTOglTdXBwb3J0ZWQKIEY6CSoKIEY6CSovCitWOgl4ZW4tbWFpbnRhaW5l
cnMtMQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
