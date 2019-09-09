Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C817EADFDB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 22:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Q3o-0005At-7J; Mon, 09 Sep 2019 20:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1apQ=XE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i7Q3m-0005Ao-2k
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 20:14:50 +0000
X-Inumbo-ID: 793a9dc0-d33e-11e9-b299-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 793a9dc0-d33e-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 20:14:49 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Q3k-0006fl-AJ; Mon, 09 Sep 2019 20:14:48 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Q3j-0000zA-QI; Mon, 09 Sep 2019 20:14:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i7Q3j-0007q1-Pf; Mon, 09 Sep 2019 20:14:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141153-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-amd64:<job
 status>:broken:regression
 xen-unstable-smoke:build-armhf:<job status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:<job status>:broken:regression
 xen-unstable-smoke:build-amd64:host-install(4):broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-armhf:host-install(4):broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=6fa1798b2d7066f53f310f05e86b82c713e3bc42
X-Osstest-Versions-That: xen=74791511067aaff67efbd2555a5f635246264453
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2019 20:14:47 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141153: trouble:
 blocked/broken
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

ZmxpZ2h0IDE0MTE1MyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTE1My8KCkZhaWx1cmVzIGFu
ZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFu
ZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgog
YnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAg
ICAgIGJyb2tlbgogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4g
ICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICA8
am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYW1kNjQgICAgICAgICAg
ICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQxMDk3
CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAg
YnJva2VuIFJFR1IuIHZzLiAxNDEwOTcKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDQg
aG9zdC1pbnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4gdnMuIDE0MTA5NwoKVGVzdHMgd2hp
Y2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYXJtaGYtYXJt
aGYteGwgICAgICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBu
L2EKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0ICAxIGJ1aWxkLWNo
ZWNrKDEpICAgICAgICBibG9ja2VkIG4vYQogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAg
MSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogYnVpbGQtYW1kNjQt
bGlidmlydCAgICAgICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQg
IG4vYQogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAg
ICAgICAgICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhl
biAgICAgICAgICAgICAgICAgIDZmYTE3OThiMmQ3MDY2ZjUzZjMxMGYwNWU4NmI4MmM3MTNlM2Jj
NDIKYmFzZWxpbmUgdmVyc2lvbjoKIHhlbiAgICAgICAgICAgICAgICAgIDc0NzkxNTExMDY3YWFm
ZjY3ZWZiZDI1NTVhNWY2MzUyNDYyNjQ0NTMKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0MTA5NyAg
MjAxOS0wOS0wNiAxNzowMDo1NyBaICAgIDMgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDEx
MTQgIDIwMTktMDktMDcgMTI6MDE6MjAgWiAgICAyIGRheXMgICAgMyBhdHRlbXB0cwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBl
b3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgogIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KCmpvYnM6CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYXJtaGYg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbiAg
CiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFt
ZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NCAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAK
IHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBibG9ja2VkIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9p
bWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRw
Oi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9u
IG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFE
TUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1v
c3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBj
YW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVz
dC5naXQ7YT1zdW1tYXJ5Cgpicm9rZW4tam9iIGJ1aWxkLWFtZDY0IGJyb2tlbgpicm9rZW4tam9i
IGJ1aWxkLWFybWhmIGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWFybTY0LXhzbSBicm9rZW4KYnJv
a2VuLXN0ZXAgYnVpbGQtYW1kNjQgaG9zdC1pbnN0YWxsKDQpCmJyb2tlbi1zdGVwIGJ1aWxkLWFy
bTY0LXhzbSBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtYXJtaGYgaG9zdC1pbnN0
YWxsKDQpCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDMzMSBs
aW5lcyBsb25nLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
