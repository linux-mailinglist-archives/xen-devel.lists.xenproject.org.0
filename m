Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B80013A74
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2019 15:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMv2T-0000Bz-9p; Sat, 04 May 2019 13:49:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbrx=TE=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hMv2R-0000Bp-Hy
 for xen-devel@lists.xenproject.org; Sat, 04 May 2019 13:49:15 +0000
X-Inumbo-ID: 5eb174d6-6e73-11e9-8c29-ab2978f0632d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eb174d6-6e73-11e9-8c29-ab2978f0632d;
 Sat, 04 May 2019 13:49:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hMv2B-0007ik-IG; Sat, 04 May 2019 13:48:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hMv2B-0006TV-9a; Sat, 04 May 2019 13:48:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hMv2B-0003Bv-8u; Sat, 04 May 2019 13:48:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135530-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=d027412258875cee485977fad39b1801beb50074
X-Osstest-Versions-That: ovmf=20029ca22baaeb9418c1fd9df88d12d32d585cb6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 May 2019 13:48:59 +0000
Subject: [Xen-devel] [ovmf test] 135530: all pass - PUSHED
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

ZmxpZ2h0IDEzNTUzMCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzU1MzAvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBkMDI3NDEyMjU4ODc1Y2VlNDg1OTc3ZmFkMzliMTgw
MWJlYjUwMDc0CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICAyMDAyOWNh
MjJiYWFlYjk0MThjMWZkOWRmODhkMTJkMzJkNTg1Y2I2CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzUzMTggIDIwMTktMDQtMjYgMTA6NDE6MjMgWiAgICA4IGRheXMKRmFpbGluZyBzaW5jZSAgICAg
ICAgMTM1MzcxICAyMDE5LTA0LTI4IDAwOjQxOjI0IFogICAgNiBkYXlzICAgIDQgYXR0ZW1wdHMK
VGVzdGluZyBzYW1lIHNpbmNlICAgMTM1NTMwICAyMDE5LTA1LTAyIDA3OjIyOjM0IFogICAgMiBk
YXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVy
IHRlc3Q6CiAgIlRpZW4gSG9jaywgTG9oIiA8dGllbi5ob2NrLmxvaEBpbnRlbC5jb20+CiAgQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQXJkIEJpZXNoZXV2ZWwg
PGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+CiAgQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwu
Y29tPgogIEJyZXQgQmFya2VsZXcgPEJyZXQuQmFya2VsZXdAbWljcm9zb2Z0LmNvbT4KICBEYW5k
YW4gQmkgPGRhbmRhbi5iaUBpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpoaWp1eC5mYW5AaW50
ZWwuY29tPgogIEZlbmcsIEJvYiBDIDxib2IuYy5mZW5nQGludGVsLmNvbT4KICBIYW8gV3UgPGhh
by5hLnd1QGludGVsLmNvbT4KICBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4
LmNvbT4KICBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgogIE1hcmNpbiBXb2p0YXMg
PG13QHNlbWloYWxmLmNvbT4KICBNaWNoYWVsIEQgS2lubmV5IDxtaWNoYWVsLmQua2lubmV5QGlu
dGVsLmNvbT4KICBTaGVuZ2xlaSBaaGFuZyA8c2hlbmdsZWkuemhhbmdAaW50ZWwuY29tPgogIFRp
ZW4gSG9jaywgTG9oIDx0aWVuLmhvY2subG9oQGludGVsLmNvbT4KICBXYW5nIEZhbiA8ZmFuLndh
bmdAaW50ZWwuY29tPgogIFdhbmcsIEZhbiA8ZmFuLndhbmdAaW50ZWwuY29tPgogIFh1ZSBTaGVu
Z2ZlbmdYIDxzaGVuZ2Zlbmd4Lnh1ZUBpbnRlbC5jb20+CiAgWHVlLCBTaGVuZ2ZlbmdYIDxzaGVu
Z2Zlbmd4Lnh1ZUBpbnRlbC5jb20+CiAgWmhpY2hhbyBHYW8gPHpoaWNoYW8uZ2FvQGludGVsLmNv
bT4KICBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0
LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQt
bGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWFt
ZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAK
IHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9p
bWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRw
Oi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9u
IG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFE
TUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1v
c3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBj
YW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVz
dC5naXQ7YT1zdW1tYXJ5CgoKUHVzaGluZyByZXZpc2lvbiA6CgpUbyB4ZW5iaXRzLnhlbi5vcmc6
L2hvbWUveGVuL2dpdC9vc3N0ZXN0L292bWYuZ2l0CiAgIDIwMDI5Y2EyMmIuLmQwMjc0MTIyNTgg
IGQwMjc0MTIyNTg4NzVjZWU0ODU5NzdmYWQzOWIxODAxYmViNTAwNzQgLT4geGVuLXRlc3RlZC1t
YXN0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
