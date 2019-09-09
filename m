Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13107AD159
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 02:12:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i77F4-000770-Sf; Mon, 09 Sep 2019 00:09:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1apQ=XE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i77F2-00076v-HN
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 00:09:12 +0000
X-Inumbo-ID: 0bc632e9-d296-11e9-ac07-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bc632e9-d296-11e9-ac07-12813bfff9fa;
 Mon, 09 Sep 2019 00:09:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i77Ez-0002J6-HA; Mon, 09 Sep 2019 00:09:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i77Ez-0000AM-98; Mon, 09 Sep 2019 00:09:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i77Ez-0007T2-8Y; Mon, 09 Sep 2019 00:09:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141123-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:<job status>:broken:regression
 xen-unstable-smoke:build-amd64:<job status>:broken:regression
 xen-unstable-smoke:build-amd64:host-install(4):broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:test-armhf-armhf-xl:host-install(4):broken:regression
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=6fa1798b2d7066f53f310f05e86b82c713e3bc42
X-Osstest-Versions-That: xen=74791511067aaff67efbd2555a5f635246264453
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2019 00:09:09 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141123: trouble:
 blocked/broken/pass
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

ZmxpZ2h0IDE0MTEyMyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTEyMy8KCkZhaWx1cmVzIGFu
ZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFu
ZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgog
YnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAg
ICAgIGJyb2tlbgogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAgICA8am9iIHN0YXR1cz4g
ICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICA8
am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYW1kNjQgICAgICAgICAg
ICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQxMDk3
CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAg
YnJva2VuIFJFR1IuIHZzLiAxNDEwOTcKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgIDQg
aG9zdC1pbnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4gdnMuIDE0MTA5NwoKVGVzdHMgd2hp
Y2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYXJtNjQtYXJt
NjQteGwteHNtICAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBu
L2EKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0ICAxIGJ1aWxkLWNo
ZWNrKDEpICAgICAgICBibG9ja2VkIG4vYQogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAg
MSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hbWQ2NC1h
bWQ2NC1saWJ2aXJ0ICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQg
IG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAgICAg
IDZmYTE3OThiMmQ3MDY2ZjUzZjMxMGYwNWU4NmI4MmM3MTNlM2JjNDIKYmFzZWxpbmUgdmVyc2lv
bjoKIHhlbiAgICAgICAgICAgICAgICAgIDc0NzkxNTExMDY3YWFmZjY3ZWZiZDI1NTVhNWY2MzUy
NDYyNjQ0NTMKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0MTA5NyAgMjAxOS0wOS0wNiAxNzowMDo1
NyBaICAgIDIgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDExMTQgIDIwMTktMDktMDcgMTI6
MDE6MjAgWiAgICAxIGRheXMgICAgMiBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgogIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCmpvYnM6CiBi
dWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYnJva2VuICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBicm9rZW4gIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRl
c3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBicm9rZW4gIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlh
bmh2bS1hbWQ2NCAgICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYW1kNjQtYW1kNjQt
bGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAoKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9n
czogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZp
ZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54
ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMs
IGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVy
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7
Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5Cgpi
cm9rZW4tam9iIGJ1aWxkLWFybTY0LXhzbSBicm9rZW4KYnJva2VuLWpvYiB0ZXN0LWFybWhmLWFy
bWhmLXhsIGJyb2tlbgpicm9rZW4tam9iIGJ1aWxkLWFtZDY0IGJyb2tlbgpicm9rZW4tc3RlcCBi
dWlsZC1hbWQ2NCBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQtYXJtNjQteHNtIGhv
c3QtaW5zdGFsbCg0KQpicm9rZW4tc3RlcCB0ZXN0LWFybWhmLWFybWhmLXhsIGhvc3QtaW5zdGFs
bCg0KQoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSAzMzEgbGlu
ZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
