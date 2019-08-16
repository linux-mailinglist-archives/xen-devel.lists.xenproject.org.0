Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F63790036
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:46:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyZhE-0000M9-H0; Fri, 16 Aug 2019 10:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4MO=WM=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hyZhC-0000M4-On
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 10:42:58 +0000
X-Inumbo-ID: 9b1192d0-c012-11e9-8bb4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b1192d0-c012-11e9-8bb4-12813bfff9fa;
 Fri, 16 Aug 2019 10:42:55 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyZh6-0001Jb-GT; Fri, 16 Aug 2019 10:42:52 +0000
Received: from localhost ([127.0.0.1] helo=MacBook-Pro.Home)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hyZh6-0007vB-8x; Fri, 16 Aug 2019 10:42:52 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 16 Aug 2019 11:42:48 +0100
Message-Id: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the script
 on unikraft repos
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
Cc: Felipe Huici <felipe.huici@neclab.eu>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Florian Schmidt <florian.schmidt@neclab.eu>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VW5pa3JhZnQgcmVwb3MgZm9sbG93IHRoZSBzYW1lIHN5bnRheCBhcyB4ZW4uZ2l0IHdpdGggdGhl
CmZvbGxvd2luZyBleGNlcHRpb25zOgoqIE1BSU5UQUlORVJTIGZpbGVzIGFyZSBjYWxsZWQgTUFJ
TlRBSU5FUlMubWQKKiBNOiAuLi4gZXRjIGJsb2NrcyBhcmUgcHJlY2VkZWQgYnkgd2hpdGVzcGFj
ZXMgZm9yIHJlbmRlcmluZyBhcwogIG1hcmt1cCBmaWxlcwoKVGhpcyBjaGFuZ2Ugd2lsbAotIGxv
YWQgTUFJTlRBSU5FUlMubWQgaWYgTUFJTlRBSU5FUlMgaXMgbm90IHByZXNlbnQKLSBkZWFsIHdp
dGggaW5kZW50ZWQgTTogLi4uIGJsb2NrcwoKU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFy
cy5rdXJ0aEBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5j
b20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBU
aW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpDQzogU2lt
b24gS3VlbnplciA8c2ltb24ua3VlbnplckBuZWNsYWIuZXU+CkNDOiBGbG9yaWFuIFNjaG1pZHQg
PGZsb3JpYW4uc2NobWlkdEBuZWNsYWIuZXU+CkNDOiBGZWxpcGUgSHVpY2kgPGZlbGlwZS5odWlj
aUBuZWNsYWIuZXU+Ci0tLQogc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCB8IDE0ICsrKysrKysr
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGIvc2NyaXB0cy9nZXRfbWFp
bnRhaW5lci5wbAppbmRleCBmMWU5YzkwNGVlLi5iZGIwOWY4ZjY1IDEwMDc1NQotLS0gYS9zY3Jp
cHRzL2dldF9tYWludGFpbmVyLnBsCisrKyBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKQEAg
LTI4NCwxMiArMjg0LDE4IEBAIGlmICghdG9wX29mX3RyZWUoJHhlbl9wYXRoKSkgewogbXkgQHR5
cGV2YWx1ZSA9ICgpOwogbXkgJWtleXdvcmRfaGFzaDsKIAotb3BlbiAobXkgJG1haW50LCAnPCcs
ICIke3hlbl9wYXRofU1BSU5UQUlORVJTIikKLSAgICBvciBkaWUgIiRQOiBDYW4ndCBvcGVuIE1B
SU5UQUlORVJTOiAkIVxuIjsKK215ICRtYWludDsKK215ICRtYWludGFpbmVyc19maWxlID0gIk1B
SU5UQUlORVJTIjsKK2lmICghIG9wZW4gKCRtYWludCwgJzwnLCAke3hlbl9wYXRofS4kbWFpbnRh
aW5lcnNfZmlsZSkpIHsKKyAgICAkbWFpbnRhaW5lcnNfZmlsZSA9ICJNQUlOVEFJTkVSUy5tZCI7
CisgICAgb3BlbiAoJG1haW50LCAnPCcsICR7eGVuX3BhdGh9LiRtYWludGFpbmVyc19maWxlKQor
ICAgICAgICBvciBkaWUgIiRQOiBDYW4ndCBvcGVuIE1BSU5UQUlORVJTIG9yIE1BSU5UQUlORVJT
Lm1kOiAkIVxuIjsKK30KKwogd2hpbGUgKDwkbWFpbnQ+KSB7CiAgICAgbXkgJGxpbmUgPSAkXzsK
IAotICAgIGlmICgkbGluZSA9fiBtL14oW0EtWl0pOlxzKiguKikvKSB7CisgICAgaWYgKCRsaW5l
ID1+IG0vXlxzKihbQS1aXSk6XHMqKC4qKS8pIHsKIAlteSAkdHlwZSA9ICQxOwogCW15ICR2YWx1
ZSA9ICQyOwogCkBAIC00MjEsNyArNDI3LDcgQEAgZm9yZWFjaCBteSAkZmlsZSAoQEFSR1YpIHsK
ICAgICB9CiAgICAgaWYgKCRmcm9tX2ZpbGVuYW1lKSB7CiAJcHVzaChAZmlsZXMsICRmaWxlKTsK
LQlpZiAoJGZpbGUgbmUgIk1BSU5UQUlORVJTIiAmJiAtZiAkZmlsZSAmJiAoJGtleXdvcmRzIHx8
ICRmaWxlX2VtYWlscykpIHsKKwlpZiAoJGZpbGUgbmUgJG1haW50YWluZXJzX2ZpbGUgJiYgLWYg
JGZpbGUgJiYgKCRrZXl3b3JkcyB8fCAkZmlsZV9lbWFpbHMpKSB7CiAJICAgIG9wZW4obXkgJGYs
ICc8JywgJGZpbGUpCiAJCW9yIGRpZSAiJFA6IENhbid0IG9wZW4gJGZpbGU6ICQhXG4iOwogCSAg
ICBteSAkdGV4dCA9IGRvIHsgbG9jYWwoJC8pIDsgPCRmPiB9OwotLSAKMi4xMy4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
