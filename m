Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9A4F71A
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 18:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hej1b-0006Fq-T6; Sat, 22 Jun 2019 16:37:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/HPt=UV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hej1Z-0006F2-Ql
 for xen-devel@lists.xenproject.org; Sat, 22 Jun 2019 16:37:57 +0000
X-Inumbo-ID: 13ac2c64-950c-11e9-b604-5f0c0cd5dddd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13ac2c64-950c-11e9-b604-5f0c0cd5dddd;
 Sat, 22 Jun 2019 16:37:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hej1S-0008NM-US; Sat, 22 Jun 2019 16:37:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hej1S-0001yY-MT; Sat, 22 Jun 2019 16:37:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hej1S-0006it-Lt; Sat, 22 Jun 2019 16:37:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-138317-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=11911563610786615c2b3a01cdcaaf09a6f9e38d
X-Osstest-Versions-That: xen=f3d8eef9091747e70c505094f63514b43329a922
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 22 Jun 2019 16:37:50 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 138317: regressions - FAIL
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

ZmxpZ2h0IDEzODMxNyB4ZW4tdW5zdGFibGUtc21va2UgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzODMxNy8KClJlZ3Jlc3Npb25z
IDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1
ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogdGVzdC1hcm02NC1hcm02NC14bC14
c20gICAgICAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM4MjI4
CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2NraW5nOgogdGVz
dC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0ICAgICAxMyBtaWdyYXRlLXN1cHBvcnQtY2hlY2sgICAgICAg
IGZhaWwgICBuZXZlciBwYXNzCiB0ZXN0LWFybWhmLWFybWhmLXhsICAgICAgICAgIDEzIG1pZ3Jh
dGUtc3VwcG9ydC1jaGVjayAgICAgICAgZmFpbCAgIG5ldmVyIHBhc3MKIHRlc3QtYXJtaGYtYXJt
aGYteGwgICAgICAgICAgMTQgc2F2ZXJlc3RvcmUtc3VwcG9ydC1jaGVjayAgICBmYWlsICAgbmV2
ZXIgcGFzcwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGluZzoKIHhlbiAgICAgICAgICAgICAg
ICAgIDExOTExNTYzNjEwNzg2NjE1YzJiM2EwMWNkY2FhZjA5YTZmOWUzOGQKYmFzZWxpbmUgdmVy
c2lvbjoKIHhlbiAgICAgICAgICAgICAgICAgIGYzZDhlZWY5MDkxNzQ3ZTcwYzUwNTA5NGY2MzUx
NGI0MzMyOWE5MjIKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEzODIyOCAgMjAxOS0wNi0yMSAyMDow
MDozOSBaICAgIDAgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzgyNDIgIDIwMTktMDYtMjEg
MjM6MDE6NDggWiAgICAwIGRheXMgICAgNSBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hl
ZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CiAganVsaWVuLmdyYWxsQGFybS5jb20KICBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CiAgU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoK
am9iczoKIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hcm1oZiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFt
ZDY0LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogdGVzdC1hcm1oZi1hcm1oZi14bCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVt
dXUtZGViaWFuaHZtLWFtZDY0ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2
NC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9n
cywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2Ug
cmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDto
Yj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0
O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3Vu
ZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1
bW1hcnkKCgpOb3QgcHVzaGluZy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpjb21taXQgMTE5MTE1NjM2MTA3ODY2MTVjMmIzYTAx
Y2RjYWFmMDlhNmY5ZTM4ZApBdXRob3I6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KRGF0ZTogICBGcmkgSnVuIDIxIDEzOjIwOjI1IDIwMTkgLTA3MDAKCiAgICB4
ZW4vYXJtOiBmaXggbWFzayBjYWxjdWxhdGlvbiBpbiBwZHhfaW5pdF9tYXNrCiAgICAKICAgIFRo
ZSBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sgaXMgd3Jvbmcgd2hlbiB0aGUgZmly
c3QgYmFuawogICAgc3RhcnRzIGF0IGFkZHJlc3MgMHgwLiBUaGUgcmVhc29uIGlzIHRoYXQgcGR4
X2luaXRfbWFzayB3aWxsIGRvICcwIC0gMScKICAgIGNhdXNpbmcgYW4gdW5kZXJmbG93LiBBcyBh
IHJlc3VsdCwgdGhlIG1hc2sgYmVjb21lcyAweGZmZmZmZmZmZmZmZmZmZmYKICAgIHdoaWNoIGlz
IHRoZSBiaWdnZXN0IHBvc3NpYmxlIG1hc2sgYW5kIGVuZHMgdXAgY2F1c2luZyBhIHNpZ25pZmlj
YW50CiAgICBtZW1vcnkgd2FzdGUgaW4gdGhlIGZyYW1ldGFibGUgc2l6ZSBjb21wdXRhdGlvbi4K
ICAgIAogICAgRm9yIGluc3RhbmNlLCBvbiBwbGF0Zm9ybXMgdGhhdCBoYXZlIGEgbG93IG1lbW9y
eSBiYW5rIHN0YXJ0aW5nIGF0IDB4MAogICAgYW5kIGEgaGlnaCBtZW1vcnkgYmFuaywgdGhlIGZy
YW1ldGFibGUgd2lsbCBlbmQgdXAgY292ZXJpbmcgYWxsIHRoZQogICAgaG9sZXMgaW4gYmV0d2Vl
bi4KICAgIAogICAgVGhlIHB1cnBvc2Ugb2YgdGhlIG1hc2sgaXMgdG8gYmUgcGFzc2VkIGFzIGEg
cGFyYW1ldGVyIHRvCiAgICBwZm5fcGR4X2hvbGVfc2V0dXAsIHdoaWNoIGJhc2VkIG9uIHRoZSBt
YXNrIHBhcmFtZXRlciBjYWxjdWxhdGVzCiAgICBwZm5fcGR4X2hvbGVfc2hpZnQsIHBmbl9wZHhf
Ym90dG9tX21hc2ssIGV0Yy4gd2hpY2ggYXJlIGFjdHVhbGx5IHRoZQogICAgaW1wb3J0YW50IG1h
c2tzIGZvciBmcmFtZXRhYmxlIGluaXRpYWxpemF0aW9uIGxhdGVyIG9uLgogICAgCiAgICBwZm5f
cGR4X2hvbGVfc2V0dXAgbmV2ZXIgY29tcHJlc3NlcyBhZGRyZXNzZXMgYmVsb3cgTUFYX09SREVS
IGJpdHMgKDFHQgogICAgb24gQVJNKS4gVGh1cywgaXQgaXMgc2FmZSB0byBpbml0aWFsaXplIG1h
c2sgcGFzc2luZyAxVUxMIDw8IChNQVhfT1JERVIKICAgICsgUEFHRV9TSElGVCkgYXMgc3RhcnQg
YWRkcmVzcyB0byBwZHhfaW5pdF9tYXNrLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CiAgICBSZXZpZXdlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KICAgIEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cgpjb21taXQgZWI2M2UxMjI1YWJhMDRjOTU5ZWViNjhlZGE5OWU0
MjI5MzljMzdkZQpBdXRob3I6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KRGF0ZTogICBGcmkgSnVuIDIxIDEzOjE5OjMxIDIwMTkgLTA3MDAKCiAgICB4ZW46IFJl
cGxhY2UgdTY0IHdpdGggdWludDY0X3QgaW4gcGR4X2luaXRfbWFzaygpIGFuZCBjYWxsZXJzCiAg
ICAKICAgIFhlbiBpcyBwaGFzaW5nIG91dCB0aGUgdXNlIG9mIHU2NCBpbiBmYXZvciBvZiB1aW50
NjRfdC4gVGhlcmVmb3JlLCB0aGUKICAgIGluc3RhbmNlIG9mIHU2NCBpbiB0aGUgcGR4X2luaXRf
bWFzaygpIChhbmQgdGhlIGNhbGxlcnMpIGFyZSBub3cKICAgIHJlcGxhY2VkIHdpdGggdWludDY0
X3QuIFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGFsc28gbW9kaWZ5CiAgICBzcmF0X3JlZ2lvbl9t
YXNrIGFzIHRoaXMgaXMgdXNlZCB0byBzdG9yZSB0aGUgcmVzdWx0IG9mIHBkeF9pbml0X21hc2so
KS4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4
aWxpbnguY29tPgogICAgQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ICAgIEFja2VkLWJ5OiBqdWxpZW4uZ3JhbGxAYXJtLmNvbQoocWVtdSBjaGFuZ2VzIG5vdCBpbmNs
dWRlZCkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
