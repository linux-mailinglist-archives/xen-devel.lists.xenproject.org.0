Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836D1BC57
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 19:54:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQF64-0004iS-JD; Mon, 13 May 2019 17:50:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=armk=TN=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hQF62-0004iI-JZ
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 17:50:42 +0000
X-Inumbo-ID: 9fe53cdb-75a7-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9fe53cdb-75a7-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 17:50:41 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hQF60-0004KC-SN; Mon, 13 May 2019 17:50:40 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hQF60-0006Cq-Kk; Mon, 13 May 2019 17:50:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hQF60-0000ig-K5; Mon, 13 May 2019 17:50:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-136056-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=f684c3f5eef4be691e137ae64e7d00521ec201de
X-Osstest-Versions-That: ovmf=cd5147734cbe82f0c1665eb232608d75643944b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 May 2019 17:50:40 +0000
Subject: [Xen-devel] [ovmf test] 136056: all pass - PUSHED
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZmxpZ2h0IDEzNjA1NiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzYwNTYvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBmNjg0YzNmNWVlZjRiZTY5MWUxMzdhZTY0ZTdkMDA1
MjFlYzIwMWRlCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBjZDUxNDc3
MzRjYmU4MmYwYzE2NjVlYjIzMjYwOGQ3NTY0Mzk0NGIwCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzU5NzggIDIwMTktMDUtMTAgMDQ6MjE6MjYgWiAgICAzIGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM2MDU2ICAyMDE5LTA1LTEyIDAyOjEyOjM0IFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgIlRpZW4gSG9j
aywgTG9oIiA8dGllbi5ob2NrLmxvaEBpbnRlbC5jb20+CiAgQm9iIEZlbmcgPGJvYi5jLmZlbmdA
aW50ZWwuY29tPgogIEZhbiwgWmhpanVYIDx6aGlqdXguZmFuQGludGVsLmNvbT4KICBHdW8gRG9u
ZyA8Z3VvLmRvbmdAaW50ZWwuY29tPgogIExpdSwgWmhpZ3VhbmcgPHpoaWd1YW5nLmxpdUBpbnRl
bC5jb20+CiAgTWF1cmljZSBNYSA8bWF1cmljZS5tYUBpbnRlbC5jb20+CiAgVGllbiBIb2NrLCBM
b2ggPHRpZW4uaG9jay5sb2hAaW50ZWwuY29tPgogIFpoaWd1YW5nIExpdSA8emhpZ3VhbmcubGl1
QGludGVsLmNvbT4KICBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgoKam9iczoKIGJ1
aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3Qu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hv
bWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0
CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4
cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlz
IGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5l
c3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
P3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRz
Lnhlbi5vcmc6L2hvbWUveGVuL2dpdC9vc3N0ZXN0L292bWYuZ2l0CiAgIGNkNTE0NzczNGMuLmY2
ODRjM2Y1ZWUgIGY2ODRjM2Y1ZWVmNGJlNjkxZTEzN2FlNjRlN2QwMDUyMWVjMjAxZGUgLT4geGVu
LXRlc3RlZC1tYXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
