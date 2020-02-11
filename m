Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2833D158722
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 01:57:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Jni-0003aC-4H; Tue, 11 Feb 2020 00:53:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z05d=37=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j1Jng-0003a7-Tm
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 00:53:16 +0000
X-Inumbo-ID: e01e4278-4c68-11ea-852a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e01e4278-4c68-11ea-852a-bc764e2007e4;
 Tue, 11 Feb 2020 00:53:11 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j1Jna-00032K-IQ; Tue, 11 Feb 2020 00:53:10 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j1JnZ-0001vI-Oj; Tue, 11 Feb 2020 00:53:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j1JnZ-0005l5-Nw; Tue, 11 Feb 2020 00:53:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146838-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=3dd724dff085e13ad520f8e35aea717db2ff07d0
X-Osstest-Versions-That: xen=640330d41e83af8f1b6fbe09a91712e50c411616
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 11 Feb 2020 00:53:09 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 146838: tolerable all pass -
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

ZmxpZ2h0IDE0NjgzOCB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NjgzOC8KCkZhaWx1cmVzIDot
LyBidXQgbm8gcmVncmVzc2lvbnMuCgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBh
cmUgbm90IGJsb2NraW5nOgogdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRl
LXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybTY0LWFybTY0
LXhsLXhzbSAgICAgIDEzIG1pZ3JhdGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVy
IHBhc3MKIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9y
dC1jaGVjayAgICBmYWlsICAgbmV2ZXIgcGFzcwogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAg
ICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAgIGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0
LWFybWhmLWFybWhmLXhsICAgICAgICAgIDE0IHNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgICAg
ZmFpbCAgIG5ldmVyIHBhc3MKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiB4ZW4gICAg
ICAgICAgICAgICAgICAzZGQ3MjRkZmYwODVlMTNhZDUyMGY4ZTM1YWVhNzE3ZGIyZmYwN2QwCmJh
c2VsaW5lIHZlcnNpb246CiB4ZW4gICAgICAgICAgICAgICAgICA2NDAzMzBkNDFlODNhZjhmMWI2
ZmJlMDlhOTE3MTJlNTBjNDExNjE2CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxNDY4MzUgIDIwMjAt
MDItMTAgMTk6MDA6NTMgWiAgICAwIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTQ2ODM4ICAy
MDIwLTAyLTEwIDIyOjAwOjM1IFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUg
d2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CiAgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KICBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CiAgV2VpIExpdSA8d2xAeGVuLm9yZz4KCmpv
YnM6CiBidWlsZC1hcm02NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYXJtaGYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2
NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAg
ICAKIHRlc3QtYXJtaGYtYXJtaGYteGwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogdGVzdC1hcm02NC1hcm02NC14bC14c20gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1
LWRlYmlhbmh2bS1hbWQ2NCAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQt
YW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5v
cmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3Ms
IGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJl
cG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9
bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDth
PWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQg
YXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1t
YXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6L2hvbWUveGVuL2dp
dC94ZW4uZ2l0CiAgIDY0MDMzMGQ0MWUuLjNkZDcyNGRmZjAgIDNkZDcyNGRmZjA4NWUxM2FkNTIw
ZjhlMzVhZWE3MTdkYjJmZjA3ZDAgLT4gc21va2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
