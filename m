Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02411BA31
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:37:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCyu-0000vZ-OW; Mon, 13 May 2019 15:35:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=armk=TN=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hQCyt-0000vJ-H0
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:35:11 +0000
X-Inumbo-ID: b145b4ea-7594-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b145b4ea-7594-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:35:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hQCyr-0001D5-Ir; Mon, 13 May 2019 15:35:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hQCyr-0006K4-7M; Mon, 13 May 2019 15:35:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hQCyr-0005jl-6b; Mon, 13 May 2019 15:35:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-136178-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=004299fba49747ccd614c9abcae9772ec8845e20
X-Osstest-Versions-That: xen=1e31c150f6b0efac59df1824e9881b3eb00b01b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 May 2019 15:35:09 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 136178: tolerable all pass -
 PUSHED
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

ZmxpZ2h0IDEzNjE3OCB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNjE3OC8KCkZhaWx1cmVzIDot
LyBidXQgbm8gcmVncmVzc2lvbnMuCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBh
cmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRl
LXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0
LXhsLXhzbSAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVy
IHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAg
ICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0
LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAg
ICAgICAgICAgICAgICAwMDQyOTlmYmE0OTc0N2NjZDYxNGM5YWJjYWU5NzcyZWM4ODQ1ZTIwCmJh
c2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICAxZTMxYzE1MGY2YjBlZmFjNTlk
ZjE4MjRlOTg4MWIzZWIwMGIwMWI1CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxMzYxNzAgIDIwMTkt
MDUtMTMgMDk6MDA6MzQgWiAgICAwIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTM2MTc4ICAy
MDE5LTA1LTEzIDEzOjAwOjQ4IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUg
d2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQW1pdCBTaW5naCBUb21hciA8YW1p
dHRvbWVyMjVAZ21haWwuY29tPgogIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CiAgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQnJp
YW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CiAgRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3Jh
QHR5Y2hvLm5zYS5nb3Y+CiAgRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KICBE
YXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgogIERvdWcgR29sZHN0ZWluIDxjYXJk
b2VAY2FyZG9lLmNvbT4KICBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KICBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KICBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KICBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgogIEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgogIEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KICBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJs
ZXRoaW5nc2xhYi5jb20+CiAgT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgogIE9sZWtzYW5k
ciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KICBSb2dlciBQYXUg
TW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgogIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgogIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KICBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CiAgVGltIERlZWdhbiA8
dGltQHhlbi5vcmc+CiAgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCmpvYnM6CiBidWls
ZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3Qt
YXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YXNzICAgIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2
bS1hbWQ2NCAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQtbGli
dmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpz
Zy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczog
L2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBm
aWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFu
ZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1S
RUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0
dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKUHVz
aGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dpdC94ZW4uZ2l0
CiAgIDFlMzFjMTUwZjYuLjAwNDI5OWZiYTQgIDAwNDI5OWZiYTQ5NzQ3Y2NkNjE0YzlhYmNhZTk3
NzJlYzg4NDVlMjAgLT4gc21va2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
