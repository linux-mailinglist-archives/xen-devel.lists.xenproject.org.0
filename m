Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB25AEBF6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:48:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gSj-0001y2-Si; Tue, 10 Sep 2019 13:45:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rcue=XF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i7gSi-0001xw-Jd
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:45:40 +0000
X-Inumbo-ID: 4611007d-d3d1-11e9-ac1f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4611007d-d3d1-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 13:45:39 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7gSh-0007xr-0w; Tue, 10 Sep 2019 13:45:39 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i7gSg-0003hh-F9; Tue, 10 Sep 2019 13:45:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i7gSg-00088x-ER; Tue, 10 Sep 2019 13:45:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141176-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:<job
 status>:broken:regression
 xen-unstable-smoke:build-amd64:<job status>:broken:regression
 xen-unstable-smoke:build-armhf:<job status>:broken:regression
 xen-unstable-smoke:build-arm64-xsm:host-install(4):broken:regression
 xen-unstable-smoke:build-amd64:host-install(4):broken:regression
 xen-unstable-smoke:build-armhf:host-install(4):broken:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=af5793cac20cff6f60fb2f8ed19c5af1201943be
X-Osstest-Versions-That: xen=74791511067aaff67efbd2555a5f635246264453
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Sep 2019 13:45:38 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 141176: trouble:
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

ZmxpZ2h0IDE0MTE3NiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTE3Ni8KCkZhaWx1cmVzIGFu
ZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFu
ZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgog
YnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAgICAg
ICAgIGJyb2tlbgogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4g
ICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICA8
am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgNCBob3N0LWluc3RhbGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQxMDk3
CiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAg
YnJva2VuIFJFR1IuIHZzLiAxNDEwOTcKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDQg
aG9zdC1pbnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4gdnMuIDE0MTA5NwoKVGVzdHMgd2hp
Y2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYW1kNjQtYW1k
NjQtbGlidmlydCAgICAgIDEgYnVpbGQtY2hlY2soMSkgICAgICAgICAgICAgICBibG9ja2VkICBu
L2EKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0ICAxIGJ1aWxkLWNo
ZWNrKDEpICAgICAgICBibG9ja2VkIG4vYQogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAg
MSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQgIG4vYQogdGVzdC1hcm1oZi1h
cm1oZi14bCAgICAgICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAgICAgICAgICAgIGJsb2NrZWQg
IG4vYQogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgMSBidWlsZC1jaGVjaygxKSAgICAg
ICAgICAgICAgIGJsb2NrZWQgIG4vYQoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhl
biAgICAgICAgICAgICAgICAgIGFmNTc5M2NhYzIwY2ZmNmY2MGZiMmY4ZWQxOWM1YWYxMjAxOTQz
YmUKYmFzZWxpbmUgdmVyc2lvbjoKIHhlbiAgICAgICAgICAgICAgICAgIDc0NzkxNTExMDY3YWFm
ZjY3ZWZiZDI1NTVhNWY2MzUyNDYyNjQ0NTMKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0MTA5NyAg
MjAxOS0wOS0wNiAxNzowMDo1NyBaICAgIDMgZGF5cwpGYWlsaW5nIHNpbmNlICAgICAgICAxNDEx
MTQgIDIwMTktMDktMDcgMTI6MDE6MjAgWiAgICAzIGRheXMgICAgNSBhdHRlbXB0cwpUZXN0aW5n
IHNhbWUgc2luY2UgICAxNDExNjkgIDIwMTktMDktMDkgMjE6MDA6MjUgWiAgICAwIGRheXMgICAg
MiBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoK
ICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgogIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiAgUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KICBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KICBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJyb2tlbiAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJva2VuICAKIGJ1aWxkLWFybWhmICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAog
YnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJsb2NrZWQgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tlZCAKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAogdGVzdC1hbWQ2NC1hbWQ2
NC14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgICAgICAgICAgICAgICAgICAgIGJsb2NrZWQgCiB0
ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmxvY2tlZCAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1h
Z2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDov
L2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBv
ZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0
cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1F
LmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3Nz
dGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2Fu
IGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3Qu
Z2l0O2E9c3VtbWFyeQoKYnJva2VuLWpvYiBidWlsZC1hcm02NC14c20gYnJva2VuCmJyb2tlbi1q
b2IgYnVpbGQtYW1kNjQgYnJva2VuCmJyb2tlbi1qb2IgYnVpbGQtYXJtaGYgYnJva2VuCmJyb2tl
bi1zdGVwIGJ1aWxkLWFybTY0LXhzbSBob3N0LWluc3RhbGwoNCkKYnJva2VuLXN0ZXAgYnVpbGQt
YW1kNjQgaG9zdC1pbnN0YWxsKDQpCmJyb2tlbi1zdGVwIGJ1aWxkLWFybWhmIGhvc3QtaW5zdGFs
bCg0KQoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSA0MDEgbGlu
ZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
