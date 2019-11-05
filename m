Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA608EFF16
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 14:57:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRzFa-0006eF-Mi; Tue, 05 Nov 2019 13:52:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C/+H=Y5=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iRzFZ-0006eA-A5
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 13:52:01 +0000
X-Inumbo-ID: 6f9d8c34-ffd3-11e9-9631-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6f9d8c34-ffd3-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 13:52:00 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 5 Nov 2019 08:51:52 -0500
Message-ID: <20191105135152.5168-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH v2] MAINTAINERS: ARINC 653 scheduler
 maintainer updates
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIERvcm5lcldvcmtzIGludGVybmFsIGxpc3QuIFRoaXMgd2lsbCBmb3J3YXJkIHRvIHJlbGV2
YW50IHBlb3BsZQp3aXRoaW4gRG9ybmVyV29ya3MuCgpBZGQgbXlzZWxmIHRvIE1BSU5UQUlORVJT
IGZvciBBUklOQzY1MyBzY2hlZHVsZXIuCgpSZW1vdmUgUm9iYmllIGZyb20gTUFJTlRBSU5FUlMg
Zm9yIEFSSU5DNjUzIHNjaGVkdWxlci4KCi0tLQoKTm90ZSB0aGF0IGdldF9tYWludGFpbmVycy5w
bC9hZGRfbWFpbnRhaW5lcnMucGwgZG8gbm90IGN1cnJlbnRseSBhZGQKdGhlIERvcm5lcldvcmtz
IGxpc3QgZW1haWwgYWRkcmVzcyBpbiBDQy4gSSB0ZXN0ZWQgYWRkX21haW50YWluZXJzLnBsCm9u
IGEgcGF0Y2ggbW9kaWZ5aW5nIHNjaGVkX2FyaW5jNjUzLmMsIGFuZCBJIGRpZCBub3Qgc2VlIHRo
ZQpEb3JuZXJXb3JrcyBsaXN0IGFwcGVhciBpbiBDQy4KCnYxOgpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDIyMTcuaHRtbAoK
djI6ClVzZSBMOiBkZXNpZ25hdGlvbiBmb3IgRG9ybmVyV29ya3MgaW50ZXJuYWwgbGlzdApBZGQg
bXlzZWxmIGFuZCByZW1vdmUgUm9iYmllIGFzIG1haW50YWluZXIKLS0tCiBNQUlOVEFJTkVSUyB8
IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBkY2Q1YWNiMzZhLi4y
OGU3ZWI1NTRlIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAt
MTcxLDggKzE3MSw5IEBAIEY6CXhlbi9jb21tb24vYXJnby5jCiAKIEFSSU5DNjUzIFNDSEVEVUxF
UgogTToJSm9zaCBXaGl0ZWhlYWQgPGpvc2gud2hpdGVoZWFkQGRvcm5lcndvcmtzLmNvbT4KLU06
CVJvYmVydCBWYW5Wb3NzZW4gPHJvYmVydC52YW52b3NzZW5AZG9ybmVyd29ya3MuY29tPgorTToJ
U3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgog
UzoJU3VwcG9ydGVkCitMOglEb3JuZXJXb3JrcyBYZW4tRGV2ZWwgPHhlbi1kZXZlbEBkb3JuZXJ3
b3Jrcy5jb20+CiBGOgl4ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKIEY6CXRvb2xzL2xpYnhj
L3hjX2FyaW5jNjUzLmMKIAotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
