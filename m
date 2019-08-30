Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA3A3ED5
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 22:13:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3nDl-00051w-Tn; Fri, 30 Aug 2019 20:10:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=69lB=W2=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i3nDk-00051h-BE
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 20:10:08 +0000
X-Inumbo-ID: 278d51a4-cb62-11e9-b95f-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 278d51a4-cb62-11e9-b95f-bc764e2007e4;
 Fri, 30 Aug 2019 20:10:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDe-0007hr-Va; Fri, 30 Aug 2019 20:10:02 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDe-0003Pk-PI; Fri, 30 Aug 2019 20:10:02 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 30 Aug 2019 21:09:52 +0100
Message-Id: <84a9fed12bc752498bb90a7db3fdb46912736d6a.1567195654.git-series.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
In-Reply-To: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v3 2/3] Add V section entry to allow
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
Z25lZC1vZmYtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KLS0tCiBNQUlO
VEFJTkVSUyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNzc0MTNlMC4uYmIzZGE0MyAx
MDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTk3LDYgKzk3LDkg
QEAgRGVzY3JpcHRpb25zIG9mIHNlY3Rpb24gZW50cmllczoKIAkgICAgICBtYXRjaGVzIHBhdGNo
ZXMgb3IgZmlsZXMgdGhhdCBjb250YWluIG9uZSBvciBtb3JlIG9mIHRoZSB3b3JkcwogCSAgICAg
IHByaW50aywgcHJfaW5mbyBvciBwcl9lcnIKIAkgICBPbmUgcmVnZXggcGF0dGVybiBwZXIgbGlu
ZS4gIE11bHRpcGxlIEs6IGxpbmVzIGFjY2VwdGFibGUuCisJVjogVmVyc2lvbiBpZGVudGlmaWVy
IHRoYXQgbXVzdCBiZSB1bmRlciBUSEUgUkVTVCBhbmQgZm9sbG93cworCSAgIHRoZSBmb3JtYXQ6
CisJICAgeGVuLW1haW50YWluZXJzLTx2ZXJzaW9uIGZvcm1hdCBudW1iZXIgb2YgdGhpcyBmaWxl
PgogCiAKIFRoZSBtZWFuaW5nIG9mIG5lc3Rpbmc6CkBAIC01NDEsMyArNTQ0LDQgQEAgTDoJeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCiBTOglTdXBwb3J0ZWQKIEY6CSoKIEY6CSovCitW
Ogl4ZW4tbWFpbnRhaW5lcnMtMQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
