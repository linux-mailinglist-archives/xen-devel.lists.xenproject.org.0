Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9977ABFDF4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 06:21:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDhiO-0003Cn-78; Fri, 27 Sep 2019 04:18:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OzHR=XV=xenproject.org=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iDZcK-0000iw-Ll
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 19:39:56 +0000
X-Inumbo-ID: 5d97f6bc-e095-11e9-965e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by localhost (Halon) with ESMTPS
 id 5d97f6bc-e095-11e9-965e-12813bfff9fa;
 Thu, 26 Sep 2019 19:39:34 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1iDZbt-0002GG-Dz; Thu, 26 Sep 2019 19:39:29 +0000
Received: from localhost ([127.0.0.1] helo=MacBook-Pro-2.Home)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1iDZbt-0007uS-4v; Thu, 26 Sep 2019 19:39:29 +0000
From: Lars Kurth <lars.kurth@xenproject.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 20:39:18 +0100
Message-Id: <cover.1569525222.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 04:18:43 +0000
Subject: [Xen-devel] [PATCH v2 0/6] Code of Conduct + Extra Guides and Best
 Practices
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
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgoKVGhpcyBzZXJpZXMgcHJv
cG9zZXMgYSBjb25jcmV0ZSB2ZXJzaW9uIG9mIHRoZSBYZW4gUHJvamVjdApDb0MgYmFzZWQgb24g
djEuNCBvZiB0aGUgQ29udHJpYnV0b3IgQ292ZW5hbnQuIFNlZSBbMV0KCkl0IGNvbnRhaW5zICpB
TEwqIHRoZSBwb3J0aW9ucyBJIHdhcyBzdGlsbCBnb2luZyB0byBhZGQuCkkgc3BlbnQgYSBiaXQg
b2YgdGltZSBvbiB3b3JkLXNtaXRoaW5nLCBidXQgSSBhbSBub3QgYSBuYXRpdmUgRW5nbGlzaCBz
cGVha2VyClNvIHRoZXJlIGlzIHByb2JhYmx5IHRpbWUgZm9yIGltcHJvdmVtZW50CgpUaGUgc2Vy
aWVzIGFsc28gcmVmbGVjdHMgdGhlIGRpc2N1c3Npb24gaW4gWzJdIGFuZCBzb21lIHByaXZhdGUK
ZGlzY3Vzc2lvbnMgb24gSVJDIHRvIGlkZW50aWZ5IGluaXRpYWwgbWVtYmVycyBvZiB0aGUgWGVu
ClByb2plY3TigJlzIENvQyB0ZWFtLgoKRm9yIGNvbnZlbmllbmNlIG9mIHJldmlldyBhbmQgaW4g
bGluZSB3aXRoIG90aGVyIHBvbGljeSBkb2N1bWVudHMKSSBjcmVhdGVkIGEgZ2l0IHJlcG9zaXRv
cnkgYXQgWzNdLiBUaGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQgWzVdLgoKWzFdIGh0dHBzOi8v
d3d3LmNvbnRyaWJ1dG9yLWNvdmVuYW50Lm9yZy92ZXJzaW9uLzEvNC9jb2RlLW9mLWNvbmR1Y3Qu
bWQKWzJdIGh0dHBzOi8veGVuLm1hcmttYWlsLm9yZy90aHJlYWQvNTZhbzJneWhwbHRxbXJldyAK
WzNdIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9m
LWNvbmR1Y3QuZ2l0O2E9c3VtbWFyeQpbNF0gaHR0cHM6Ly93d3cuc2xpZGVzaGFyZS5uZXQveGVu
X2NvbV9tZ3IveHBkZHMxOS1rZXlub3RlLXBhdGNoLXJldmlldy1mb3Itbm9ubWFpbnRhaW5lcnMt
Z2VvcmdlLWR1bmxhcC1jaXRyaXgtc3lzdGVtcy11ay1sdGQKWzVdIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1Y3QuZ2l0O2E9c2hvcnRs
b2c7aD1yZWZzL2hlYWRzL0NvQy12MgoKQ2hhbmdlcyBzaW5jZSB2MQoqIENvZGUgb2YgQ29uZHVj
dCAKICBPbmx5IHdoaXRlc3BhY2UgY2hhbmdlcwoKKiBBZGRlZCBDb21tdW5pY2F0aW9uIEd1aWRl
CiAgQ29udGFpbnMgdmFsdWVzIGFuZCBhIHByb2Nlc3MgYmFzZWQgb24gYWR2aWNlIGFuZCBtZWRp
YXRpb24gaW4gY2FzZSBvZiBpc3N1ZXMKICBUaGlzIGlzIHRoZSBwcmltYXJ5IHBvcnRhbCBmb3Ig
CgoqIEFkZGVkIENvZGUgUmV2aWV3IEd1aWRlCiAgV2hpY2ggaXMgYmFzZWQgb24gWzRdIHdpdGgg
c29tZSBhZGRpdGlvbnMgZm9yIGNvbXBsZXRlbmVzcwogIEl0IHByaW1hcmlseSBzZXRzIGV4cGVj
dGF0aW9ucyBhbmQgYW55dGhpbmcgY29tbXVuaWNhdGlvbiByZWxhdGVkIGlzIHJlbW92ZWQKCiog
QWRkZWQgZ3VpZGUgb24gQ29tbXVuaWNhdGlvbiBCZXN0IFByYWN0aWNlCiAgVGFrZXMgdGhlIGNv
bW11bmljYXRpb24gc2VjdGlvbiBmcm9tIFs0XSBhbmQgZXhwYW5kcyBvbiBpdCB3aXRoIG1vcmUg
ZXhhbXBsZXMKICBhbmQgY2FzZXMuIFRoaXMgaXMgcHJvYmFibHkgd2hlcmUgd2UgbWF5IG5lZWQg
c29tZSBkaXNjdXNzaW9uCgoqIEFkZGVkIGRvY3VtZW50IG9uIFJlc29sdmluZyBEaXNhZ3JlZW1l
bnQKICBBIHRpbnkgYml0IG9mIHRoZW9yeSB0byBzZXQgdGhlIHNjZW5lCiAgSXQgY292ZXJzIHNv
bWUgY29tbW9uIGNhc2VzIG9mIGRpc2FncmVlbWVudHMgYW5kIGhvdyB3ZSBtYXkgYXBwcm9hY2gg
dGhlbQogIEFnYWluLCB0aGlzIHByb2JhYmx5IG5lZWRzIHNvbWUgZGlzY3Vzc2lvbgoKQ2M6IG1p
bmlvcy1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDYzogeGVuLWFwaUBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpDYzogd2luLXB2LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBtaXJhZ2Vv
cy1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDYzogY29tbWl0dGVyc0B4ZW5wcm9qZWN0Lm9y
ZwoKTGFycyBLdXJ0aCAoNik6CiAgSW1wb3J0IHYxLjQgb2YgQ29udHJpYnV0b3IgQ292ZW5hbnQg
Q29DCiAgWGVuIFByb2plY3QgQ29kZSBvZiBDb25kdWN0CiAgQWRkIENvbW11bmljYXRpb24gR3Vp
ZGUKICBBZGQgQ29kZSBSZXZpZXcgR3VpZGUKICBBZGQgZ3VpZGUgb24gQ29tbXVuaWNhdGlvbiBC
ZXN0IFByYWN0aWNlCiAgQWRkZWQgUmVzb2x2aW5nIERpc2FncmVlbWVudAoKLS0gCjIuMTMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
