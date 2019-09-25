Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5A8BDBEC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD4HX-0000fY-1u; Wed, 25 Sep 2019 10:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aQ9e=XU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iD4HV-0000fT-II
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:12:21 +0000
X-Inumbo-ID: f5f2bd94-df7c-11e9-b588-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by localhost (Halon) with ESMTPS
 id f5f2bd94-df7c-11e9-b588-bc764e2007e4;
 Wed, 25 Sep 2019 10:12:20 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iD4HU-0004RP-Dd; Wed, 25 Sep 2019 10:12:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iD4HU-00050E-1J; Wed, 25 Sep 2019 10:12:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iD4HU-0006ov-0f; Wed, 25 Sep 2019 10:12:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-141810-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:coverity-upload:fail:regression
X-Osstest-Versions-This: xen=f93abf0315efef861270c25d83c8047fd6a54ec4
X-Osstest-Versions-That: xen=1014f47c7a808e025b8920ab80bfe73a2888b3e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Sep 2019 10:12:20 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 141810: regressions - ALL
 FAIL
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

ZmxpZ2h0IDE0MTgxMCB4ZW4tdW5zdGFibGUtY292ZXJpdHkgcmVhbCBbcmVhbF0KaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MTgxMC8KClJlZ3Jlc3Np
b25zIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogY292ZXJpdHktYW1kNjQgICAg
ICAgICAgICAgICAgNyBjb3Zlcml0eS11cGxvYWQgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQx
MzMxCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAg
ZjkzYWJmMDMxNWVmZWY4NjEyNzBjMjVkODNjODA0N2ZkNmE1NGVjNApiYXNlbGluZSB2ZXJzaW9u
OgogeGVuICAgICAgICAgICAgICAgICAgMTAxNGY0N2M3YTgwOGUwMjViODkyMGFiODBiZmU3M2Ey
ODg4YjNlNQoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTQxMzMxICAyMDE5LTA5LTE1IDA5OjE4OjQy
IFogICAxMCBkYXlzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDE0MTgxMCAgMjAxOS0wOS0yNSAwOToy
MDozNyBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJl
dmlzaW9ucyB1bmRlciB0ZXN0OgogIEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPgogIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CiAgQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgQ2hhbyBHYW8gPGNoYW8u
Z2FvQGludGVsLmNvbT4KICBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJp
eC5jb20+CiAgRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CiAgRGFyaW8g
RmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KICBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CiAgSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgogIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CiAgT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0u
Y29tPgogIFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAgUGF1bCBEdXJy
YW50IDxwYXVsQHhlbi5vcmc+CiAgUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9u
LmRlPgogIFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KICBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KICBSb3NzIExhZ2Vyd2FsbCA8cm9z
cy5sYWdlcndhbGxAY2l0cml4LmNvbT4KICBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CiAgU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGls
aW54LmNvbT4KICBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+
CiAgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KICBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoK
am9iczoKIGNvdmVyaXR5LWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmYWlsICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVz
dC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUv
bG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAg
ICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxh
bmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0
CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7
Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3Mg
Y29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9
b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBp
dCB3b3VsZCBiZSAyMDc2IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
