Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53028AD1A4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 03:42:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i78dT-0008K2-Bk; Mon, 09 Sep 2019 01:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1apQ=XE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i78dS-0008Jx-Gm
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 01:38:30 +0000
X-Inumbo-ID: 8558752e-d2a2-11e9-ac07-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8558752e-d2a2-11e9-ac07-12813bfff9fa;
 Mon, 09 Sep 2019 01:38:27 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i78dO-00028f-Vl; Mon, 09 Sep 2019 01:38:27 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i78dO-000272-D2; Mon, 09 Sep 2019 01:38:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i78dO-0007Ib-CQ; Mon, 09 Sep 2019 01:38:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141143-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:<job
 status>:broken:regression
 xen-unstable-coverity:coverity-amd64:host-install(4):broken:regression
X-Osstest-Versions-This: xen=74791511067aaff67efbd2555a5f635246264453
X-Osstest-Versions-That: xen=a342900d4835c127c1466c5abc1323a666e8cebd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2019 01:38:26 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 141143: trouble: broken
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

ZmxpZ2h0IDE0MTE0MyB4ZW4tdW5zdGFibGUtY292ZXJpdHkgcmVhbCBbcmVhbF0KaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTE0My8KCkZhaWx1cmVz
IGFuZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVk
IGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVu
OgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAg
ICAgICAgIGJyb2tlbgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgNCBob3N0LWluc3Rh
bGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQxMDAyCgp2ZXJzaW9uIHRhcmdldGVkIGZv
ciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAgNzQ3OTE1MTEwNjdhYWZmNjdlZmJkMjU1
NWE1ZjYzNTI0NjI2NDQ1MwpiYXNlbGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAgICAgICAg
YTM0MjkwMGQ0ODM1YzEyN2MxNDY2YzVhYmMxMzIzYTY2NmU4Y2ViZAoKTGFzdCB0ZXN0IG9mIGJh
c2lzICAgMTQxMDAyICAyMDE5LTA5LTA0IDA5OjE5OjI4IFogICAgNCBkYXlzClRlc3Rpbmcgc2Ft
ZSBzaW5jZSAgIDE0MTE0MyAgMjAxOS0wOS0wOCAwOToxODoyMiBaICAgIDAgZGF5cyAgICAxIGF0
dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFs
ZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgogIEFsZXhhbmRydSBTdGVm
YW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KICBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgogIEJhbmRhbiBEYXMgPGJzZEByZWRoYXQuY29tPgogIEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KICBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CiAgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CiAgUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CiAgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CiAg
WmhhbmcgUnVpIDxydWkuemhhbmdAaW50ZWwuY29tPgoKam9iczoKIGNvdmVyaXR5LWFtZDY0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicm9rZW4gIAoKCi0t
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
Tm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSAzOTYgbGluZXMgbG9u
Zy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
