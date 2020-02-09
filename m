Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2164156B54
	for <lists+xen-devel@lfdr.de>; Sun,  9 Feb 2020 17:23:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0pJM-0003mq-JL; Sun, 09 Feb 2020 16:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PJJO=35=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j0pJL-0003ml-9U
 for xen-devel@lists.xenproject.org; Sun, 09 Feb 2020 16:19:55 +0000
X-Inumbo-ID: fe749cb6-4b57-11ea-a759-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe749cb6-4b57-11ea-a759-bc764e2007e4;
 Sun, 09 Feb 2020 16:19:49 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j0pJE-0000ny-LQ; Sun, 09 Feb 2020 16:19:48 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j0pJE-0001sv-Bl; Sun, 09 Feb 2020 16:19:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j0pJE-00040Z-AQ; Sun, 09 Feb 2020 16:19:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-146819-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:<job
 status>:broken:regression
 xen-unstable-coverity:coverity-amd64:host-install(4):broken:regression
X-Osstest-Versions-This: xen=72dbcf0c065037dddb591a072c4f8f16fe888ea8
X-Osstest-Versions-That: xen=f7fb9a0aa9fbb81292e1626ce40340d3f6d8d505
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 09 Feb 2020 16:19:48 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 146819: trouble: broken
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

ZmxpZ2h0IDE0NjgxOSB4ZW4tdW5zdGFibGUtY292ZXJpdHkgcmVhbCBbcmVhbF0KaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NjgxOS8KCkZhaWx1cmVz
IGFuZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVk
IGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVu
OgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAg
ICAgICAgIGJyb2tlbgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgNCBob3N0LWluc3Rh
bGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTQ2NzM5Cgp2ZXJzaW9uIHRhcmdldGVkIGZv
ciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAgNzJkYmNmMGMwNjUwMzdkZGRiNTkxYTA3
MmM0ZjhmMTZmZTg4OGVhOApiYXNlbGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAgICAgICAg
ZjdmYjlhMGFhOWZiYjgxMjkyZTE2MjZjZTQwMzQwZDNmNmQ4ZDUwNQoKTGFzdCB0ZXN0IG9mIGJh
c2lzICAgMTQ2NzM5ICAyMDIwLTAyLTA1IDA5OjE4OjQ0IFogICAgNCBkYXlzClRlc3Rpbmcgc2Ft
ZSBzaW5jZSAgIDE0NjgxOSAgMjAyMC0wMi0wOSAwOToxODoyMCBaICAgIDAgZGF5cyAgICAxIGF0
dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CiAgQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgogIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CiAgUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgogIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgogIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+CiAgV2VpIExpdSA8
bGl1d2VAbWljcm9zb2Z0LmNvbT4KICBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKam9iczoKIGNvdmVy
aXR5LWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
cm9rZW4gIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJv
amVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMK
CkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9n
cy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRo
ZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1h
aWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0
LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUg
Zm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7
YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSA0
MzQgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
