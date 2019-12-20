Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753FA12830D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 21:11:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOZO-00071z-IK; Fri, 20 Dec 2019 20:08:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wCP3=2K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iiOZM-00071t-Lg
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 20:08:16 +0000
X-Inumbo-ID: 689fead0-2364-11ea-a1e1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 689fead0-2364-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 20:07:54 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iiOZ0-0002UP-Dw; Fri, 20 Dec 2019 20:07:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iiOZ0-0003HP-4n; Fri, 20 Dec 2019 20:07:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iiOZ0-000208-47; Fri, 20 Dec 2019 20:07:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-145033-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:build-arm64-xsm:xen-build/dist-test:fail:regression
 xen-unstable-smoke:build-amd64:xen-build/dist-test:fail:regression
 xen-unstable-smoke:build-armhf:xen-build/dist-test:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=f3186354513bd8b4d2e4c86d34d2c120601362ba
X-Osstest-Versions-That: xen=0cd791c499bdc698d14a24050ec56d60b45732e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Dec 2019 20:07:54 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 145033: regressions - all pass
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

ZmxpZ2h0IDE0NTAzMyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NTAzMy8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogYnVpbGQtYXJtNjQteHNtICAgICAg
ICAgICAgICAgNyB4ZW4tYnVpbGQvZGlzdC10ZXN0ICAgICAgZmFpbCBSRUdSLiB2cy4gMTQ0OTgz
CiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICA3IHhlbi1idWlsZC9kaXN0LXRlc3QgICAg
ICBmYWlsIFJFR1IuIHZzLiAxNDQ5ODMKIGJ1aWxkLWFybWhmICAgICAgICAgICAgICAgICAgIDcg
eGVuLWJ1aWxkL2Rpc3QtdGVzdCAgICAgIGZhaWwgUkVHUi4gdnMuIDE0NDk4MwoKVGVzdHMgd2hp
Y2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2luZzoKIHRlc3QtYW1kNjQtYW1k
NjQtbGlidmlydCAgICAgMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAgICBmYWlsICAgbmV2
ZXIgcGFzcwogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAxMyBtaWdyYXRlLXN1cHBvcnQt
Y2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAg
ICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRl
c3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgMTMgbWlncmF0ZS1zdXBwb3J0LWNoZWNrICAgICAg
ICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAxNCBzYXZl
cmVzdG9yZS1zdXBwb3J0LWNoZWNrICAgIGZhaWwgICBuZXZlciBwYXNzCgp2ZXJzaW9uIHRhcmdl
dGVkIGZvciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAgZjMxODYzNTQ1MTNiZDhiNGQy
ZTRjODZkMzRkMmMxMjA2MDEzNjJiYQpiYXNlbGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAg
ICAgICAgMGNkNzkxYzQ5OWJkYzY5OGQxNGEyNDA1MGVjNTZkNjBiNDU3MzJlMAoKTGFzdCB0ZXN0
IG9mIGJhc2lzICAgMTQ0OTgzICAyMDE5LTEyLTE5IDE5OjA4OjQyIFogICAgMSBkYXlzCkZhaWxp
bmcgc2luY2UgICAgICAgIDE0NDk5MSAgMjAxOS0xMi0yMCAwMjowMTowMSBaICAgIDAgZGF5cyAg
ICA1IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDE0NTAzMyAgMjAxOS0xMi0yMCAxNzow
MToyMiBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJl
dmlzaW9ucyB1bmRlciB0ZXN0OgogIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CiAgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CiAgSWdvciBE
cnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CiAgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgogIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiAgS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgogIE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KICBQYXdl
bCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+CiAgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CiAgU2VyZ2V5IEtvdmFsZXYgPHZhbG9yQGxpc3QucnU+CiAg
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgogIFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cgpqb2JzOgogYnVpbGQtYXJtNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFybWhmICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14
bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LWFtZDY0LWFtZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2Vz
CgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0
aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVt
YWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVz
dC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJl
IGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0
O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291bGQgYmUg
Njk4IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
