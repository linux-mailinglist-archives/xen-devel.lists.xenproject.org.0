Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C0A0867
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 19:29:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i31iB-000682-QC; Wed, 28 Aug 2019 17:26:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9kWA=WY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i31iA-00067x-6Z
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 17:26:22 +0000
X-Inumbo-ID: f1e48626-c9b8-11e9-ae49-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1e48626-c9b8-11e9-ae49-12813bfff9fa;
 Wed, 28 Aug 2019 17:26:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i31i5-0003Ux-Kd; Wed, 28 Aug 2019 17:26:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i31i5-0003q3-AB; Wed, 28 Aug 2019 17:26:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i31i5-0004Wy-9E; Wed, 28 Aug 2019 17:26:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140766-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:xen-boot:fail:regression
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=d0c0ba7d3de63c40058e0e28882faa5daa68edc1
X-Osstest-Versions-That: xen=10279e35609ba590b86308a83400b3161f5c7157
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2019 17:26:17 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 140766: regressions - FAIL
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

ZmxpZ2h0IDE0MDc2NiB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MDc2Ni8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0ICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQwNzI3
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVz
dC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAg
IGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IHNhdmVy
ZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtNjQtYXJt
NjQteGwteHNtICAgICAgMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2
ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAxNCBzYXZlcmVzdG9yZS1zdXBw
b3J0LWNoZWNrICAgIGZhaWwgICBuZXZlciBwYXNzCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0
aW5nOgogeGVuICAgICAgICAgICAgICAgICAgZDBjMGJhN2QzZGU2M2M0MDA1OGUwZTI4ODgyZmFh
NWRhYTY4ZWRjMQpiYXNlbGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAgICAgICAgMTAyNzll
MzU2MDliYTU5MGI4NjMwOGE4MzQwMGIzMTYxZjVjNzE1NwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAg
MTQwNzI3ICAyMDE5LTA4LTI3IDIxOjAxOjAxIFogICAgMCBkYXlzClRlc3Rpbmcgc2FtZSBzaW5j
ZSAgIDE0MDc2NiAgMjAxOS0wOC0yOCAxNTowMDo1OSBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIENoYW8gR2Fv
IDxjaGFvLmdhb0BpbnRlbC5jb20+CiAgUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KICBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCmpvYnM6CiBi
dWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRl
c3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXNzICAgIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlh
bmh2bS1hbWQ2NCAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQt
bGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWlsICAgIAoKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9n
czogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZp
ZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54
ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMs
IGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVy
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7
Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAg
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoK
Tm90IHB1c2hpbmcuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KY29tbWl0IGQwYzBiYTdkM2RlNjNjNDAwNThlMGUyODg4MmZhYTVk
YWE2OGVkYzEKQXV0aG9yOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpE
YXRlOiAgIFdlZCBBdWcgMjggMTY6NTg6NDUgMjAxOSArMDIwMAoKICAgIHg4Ni9odm0vZG9tYWlu
OiByZW1vdmUgdGhlICdoYXBfZW5hYmxlZCcgZmxhZwogICAgCiAgICBUaGUgaGFwX2VuYWJsZWQo
KSBtYWNybyBjYW4gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGZlYXR1cmUgaXMgYXZhaWxhYmxlCiAg
ICB1c2luZyB0aGUgZG9tYWluICdvcHRpb25zJzsgdGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBzZXBh
cmF0ZSBmbGFnLgogICAgCiAgICBOT1RFOiBGdXJ0aGVybW9yZSwgYnkgZXh0ZW5kaW5nIHNhbml0
aXppbmcgb2YgdGhlIGRvbWFpbiAnb3B0aW9ucycsIHRoZQogICAgICAgICAgbWFjcm8gY2FuIGJl
IHRyYW5zZm9ybWVkIGludG8gYW4gaW5saW5lIGZ1bmN0aW9uIGFuZCByZS1sb2NhdGVkIHRvCiAg
ICAgICAgICB4ZW4vc2NoZWQuaC4gVGhpcyBhbHNvIG1ha2VzIGhhcF9lbmFibGVkKCkgY29tbW9u
LCB0aHVzIGFsbG93aW5nCiAgICAgICAgICByZW1vdmFsIG9mIGFuIHVnbHkgaWZkZWYgQ09ORklH
X1g4NiBmcm9tIHRoZSBjb21tb24gaW9tbXUgY29kZS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KICAgIFJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KICAgIFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgpjb21taXQgYjgwNmM5MTI3NWZiMWFiNzY5
NmViZjAzM2I1NjYzMTY5MzA1NmM5MApBdXRob3I6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgpEYXRlOiAgIFdlZCBBdWcgMjggMTY6NTc6MzYgMjAxOSArMDIwMAoKICAg
IHAybS9lcHQ6IHBhc3MgY29ycmVjdCBsZXZlbCB0byBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IGlu
IGVwdF9pbnZhbGlkYXRlX2VtdAogICAgCiAgICBUaGUgbGV2ZWwgcGFzc2VkIHRvIGVwdF9pbnZh
bGlkYXRlX2VtdCBjb3JyZXNwb25kcyB0byB0aGUgRVBUIGVudHJ5CiAgICBwYXNzZWQgYXMgdGhl
IG1mbiBwYXJhbWV0ZXIsIHdoaWNoIGlzIGEgcG9pbnRlciB0byBhbiBFUFQgcGFnZSB0YWJsZSwK
ICAgIGhlbmNlIHRoZSBlbnRyaWVzIGluIHRoYXQgcGFnZSB0YWJsZSB3aWxsIGhhdmUgb25lIGxl
dmVsIGxlc3MgdGhhbiB0aGUKICAgIHBhcmVudC4KICAgIAogICAgRml4IHRoZSBjYWxsIHRvIGF0
b21pY193cml0ZV9lcHRfZW50cnkgdG8gcGFzcyB0aGUgY29ycmVjdCBsZXZlbCwgaWU6CiAgICBv
bmUgbGV2ZWwgbGVzcyB0aGFuIHRoZSBwYXJlbnQuCiAgICAKICAgIEZpeGVzOiA1MGZlNmU3Mzcw
NSAoJ3B2aCBkb20wOiBhZGQgYW5kIHJlbW92ZSBmb3JlaWduIHBhZ2VzJykKICAgIFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgogICAgUmV2aWV3
ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPi4KCmNvbW1pdCBkZTQ1ZTNm
ZjM3YmIxNjAyNzk2MDU0YWZhYmZhNjI2ZWE1NjYxYzQ1CkF1dGhvcjogQ2hhbyBHYW8gPGNoYW8u
Z2FvQGludGVsLmNvbT4KRGF0ZTogICBXZWQgQXVnIDI4IDE2OjUyOjE4IDIwMTkgKzAyMDAKCiAg
ICBtaWNyb2NvZGUvYW1kOiBmaXggbWVtb3J5IGxlYWsKICAgIAogICAgVHdvIGJ1ZmZlcnMsICct
PmVxdWl2X2NwdV90YWJsZScgYW5kICctPm1wYicsICBpbnNpZGUgJ21jX2FtZCcgbWlnaHQgYmUK
ICAgIGFsbG9jYXRlZCBhbmQgaW4gdGhlIGVycm9yLWhhbmRpbmcgcGF0aCB0aGV5IGFyZSBub3Qg
ZnJlZWQgcHJvcGVybHkuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdh
b0BpbnRlbC5jb20+CiAgICBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoocWVtdSBjaGFuZ2VzIG5vdCBpbmNsdWRlZCkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
