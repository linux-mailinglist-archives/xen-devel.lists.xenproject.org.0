Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4594C3A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:00:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlup-0000xe-Uu; Mon, 19 Aug 2019 17:57:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hiS5=WP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hzluo-0000xO-Rl
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:57:58 +0000
X-Inumbo-ID: df3e18d0-c2aa-11e9-8bf0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df3e18d0-c2aa-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 17:57:55 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hzlul-00086B-3a; Mon, 19 Aug 2019 17:57:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hzluk-0000jH-IM; Mon, 19 Aug 2019 17:57:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hzluk-0003ou-HZ; Mon, 19 Aug 2019 17:57:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140332-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
X-Osstest-Versions-This: ovmf=5726bdd9a2dfd188a96129e8c00721f34cf3906e
X-Osstest-Versions-That: ovmf=501de8146d4fda1d423cd935316661746bdb750b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Aug 2019 17:57:54 +0000
Subject: [Xen-devel] [ovmf test] 140332: regressions - FAIL
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

ZmxpZ2h0IDE0MDMzMiBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDAzMzIvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2
NCAxOCBndWVzdC1zdGFydC9kZWJpYW5odm0ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDE0MDIwMAoK
dmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIDU3MjZi
ZGQ5YTJkZmQxODhhOTYxMjllOGMwMDcyMWYzNGNmMzkwNmUKYmFzZWxpbmUgdmVyc2lvbjoKIG92
bWYgICAgICAgICAgICAgICAgIDUwMWRlODE0NmQ0ZmRhMWQ0MjNjZDkzNTMxNjY2MTc0NmJkYjc1
MGIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDE0MDIwMCAgMjAxOS0wOC0xNiAxMTozOTo1NSBaICAg
IDMgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxNDAzMzIgIDIwMTktMDgtMTkgMDE6MTE6MDgg
WiAgICAwIGRheXMgICAgMSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lv
bnMgdW5kZXIgdGVzdDoKICBTaGVuZ2xlaSBaaGFuZyA8c2hlbmdsZWkuemhhbmdAaW50ZWwuY29t
PgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxk
LWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQt
aTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
c3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAg
ICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0
IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dz
CmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUg
YXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0
ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGlu
IGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0
ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVy
CgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Y29tbWl0IDU3MjZiZGQ5YTJkZmQxODhhOTYxMjllOGMwMDcyMWYzNGNmMzkwNmUKQXV0aG9yOiBT
aGVuZ2xlaSBaaGFuZyA8c2hlbmdsZWkuemhhbmdAaW50ZWwuY29tPgpEYXRlOiAgIFRodSBBdWcg
MTUgMTU6MzI6NTkgMjAxOSArMDgwMAoKICAgIFNoZWxsUGtnL1VlZmlTaGVsbEFjcGlWaWV3Q29t
bWFuZExpYjogUmVwbGFjZSBzaGlmdCBsb2dpY2FsIGxlZnQKICAgIAogICAgUmVwbGFjZSB0aGUg
b3BlcmF0aW9uIHRvIHNoaWZ0IGxvZ2ljYWwgbGVmdCB3aXRoIHRoZSBmdW5jdGlvbgogICAgTFNo
aWZ0VTY0LCB3aGljaCBoYXMgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eS4KICAgIFRoZSBvcmlnaW5h
bCBjb2RlIGNhdXNlcyBTaGVsbFBrZyBidWlsZCBmYWlsdXJlIHdpdGggYnVpbGQKICAgIHRhcmdl
dCItYiBOT09QVCIuCiAgICAKICAgIENjOiBKYWJlbiBDYXJzZXkgPGphYmVuLmNhcnNleUBpbnRl
bC5jb20+CiAgICBDYzogUmF5IE5pIDxyYXkubmlAaW50ZWwuY29tPgogICAgQ2M6IFpoaWNoYW8g
R2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBTaGVuZ2xlaSBa
aGFuZyA8c2hlbmdsZWkuemhhbmdAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IFpoaWNoYW8g
R2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+Cgpjb21taXQgOTQ0YmQ1Y2YxZDY5NzQxZjM3MDU5
ODNmNjUwZjZhZGFkNjk2YTdkMQpBdXRob3I6IFNoZW5nbGVpIFpoYW5nIDxzaGVuZ2xlaS56aGFu
Z0BpbnRlbC5jb20+CkRhdGU6ICAgRnJpIEF1ZyAxNiAxNDo1MDozNSAyMDE5ICswODAwCgogICAg
Q3J5cHRvUGtnOiBGaXggY29kaW5nIHN0eWxlCiAgICAKICAgIFVwZGF0ZSBhdHRyaWJ1dGUgIk91
dCIgdG8gIm91dCIuCiAgICBUaGUgb3JpZ2luYWwgIk91dCIgY2FuIG5vdCBwYXNzIEVDQyBjaGVj
ay4KICAgIAogICAgQ2M6IEppYW4gV2FuZyA8amlhbi5qLndhbmdAaW50ZWwuY29tPgogICAgQ2M6
IFRpbmcgWWUgPHRpbmcueWVAaW50ZWwuY29tPgogICAgU2lnbmVkLW9mZi1ieTogU2hlbmdsZWkg
WmhhbmcgPHNoZW5nbGVpLnpoYW5nQGludGVsLmNvbT4KICAgIFJldmlld2VkLWJ5OiBKaWFuIEog
V2FuZyA8amlhbi5qLndhbmdAaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
