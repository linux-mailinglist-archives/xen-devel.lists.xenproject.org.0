Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55B994CE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:21:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0mzj-0001QC-9L; Thu, 22 Aug 2019 13:19:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=08Xs=WS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i0mzh-0001Pw-I0
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 13:19:13 +0000
X-Inumbo-ID: 6ab5811a-c4df-11e9-add7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ab5811a-c4df-11e9-add7-12813bfff9fa;
 Thu, 22 Aug 2019 13:19:06 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0mzZ-00012v-Cq; Thu, 22 Aug 2019 13:19:05 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i0mzY-0006iX-Rf; Thu, 22 Aug 2019 13:19:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i0mzY-0006wD-R1; Thu, 22 Aug 2019 13:19:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140487-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-amd64-xsm:xen-build:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
X-Osstest-Versions-This: ovmf=1237517b21305ad96834f9a0514a8365dd8a1c41
X-Osstest-Versions-That: ovmf=9c90d39b600bd33c7e0600865e6d860d46ce95f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Aug 2019 13:19:04 +0000
Subject: [Xen-devel] [ovmf test] 140487: regressions - FAIL
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

ZmxpZ2h0IDE0MDQ4NyBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDA0ODcvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgIDYgeGVu
LWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE0MDQ0OAogdGVzdC1hbWQ2NC1p
Mzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgMTggZ3Vlc3Qtc3RhcnQvZGViaWFuaHZtLnJlcGVhdCBm
YWlsIFJFR1IuIHZzLiAxNDA0NDgKCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rpbmc6CiBvdm1m
ICAgICAgICAgICAgICAgICAxMjM3NTE3YjIxMzA1YWQ5NjgzNGY5YTA1MTRhODM2NWRkOGExYzQx
CmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICA5YzkwZDM5YjYwMGJkMzNj
N2UwNjAwODY1ZTZkODYwZDQ2Y2U5NWYzCgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAxNDA0NDggIDIw
MTktMDgtMjEgMDI6MDY6MDcgWiAgICAxIGRheXMKVGVzdGluZyBzYW1lIHNpbmNlICAgMTQwNDg3
ICAyMDE5LTA4LTIxIDE3OjM5OjIxIFogICAgMCBkYXlzICAgIDEgYXR0ZW1wdHMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQZW9w
bGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiAgRG9uYWxkIEt1byA8ZG9uYWxkLmt1b0BpbnRlbC5j
b20+CiAgTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2
NC14c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAg
ICAKIGJ1aWxkLWkzODYteHNtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0
LWxpYnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1h
bWQ2NC14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAg
ICAgICAgZmFpbCAgICAKCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFi
LnhlbnByb2plY3Qub3JnCmxvZ3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3Mv
aW1hZ2VzCgpMb2dzLCBjb25maWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0
cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlv
biBvZiB0aGVzZSByZXBvcnRzLCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAg
aHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVB
RE1FLmVtYWlsO2hiPW1hc3RlcgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUg
Y2FuIGJlIGZvdW5kIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rl
c3QuZ2l0O2E9c3VtbWFyeQoKCk5vdCBwdXNoaW5nLgoKKE5vIHJldmlzaW9uIGxvZzsgaXQgd291
bGQgYmUgNjg4IGxpbmVzIGxvbmcuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
