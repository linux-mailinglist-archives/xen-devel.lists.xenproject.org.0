Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B69B801
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 23:05:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1Ggl-00055X-Ty; Fri, 23 Aug 2019 21:01:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ArCC=WT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1i1Ggk-00055S-DJ
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 21:01:38 +0000
X-Inumbo-ID: 2f29290c-c5e9-11e9-8980-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f29290c-c5e9-11e9-8980-bc764e2007e4;
 Fri, 23 Aug 2019 21:01:32 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i1Ggd-0007TE-QF; Fri, 23 Aug 2019 21:01:31 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1i1Ggd-0004mz-75; Fri, 23 Aug 2019 21:01:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1i1Ggd-0007JO-5q; Fri, 23 Aug 2019 21:01:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-140559-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:nonblocking
X-Osstest-Versions-This: ovmf=abc0155b034230128ad4aaa51ac05a315acfa7c1
X-Osstest-Versions-That: ovmf=1237517b21305ad96834f9a0514a8365dd8a1c41
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Aug 2019 21:01:31 +0000
Subject: [Xen-devel] [ovmf test] 140559: tolerable FAIL - PUSHED
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

ZmxpZ2h0IDE0MDU1OSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDA1NTkvCgpGYWlsdXJlcyA6LS8gYnV0IG5vIHJlZ3Jl
c3Npb25zLgoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkLCBidXQgYXJlIG5vdCBibG9ja2lu
ZzoKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0IDE4IGd1ZXN0LXN0YXJ0L2Rl
Ymlhbmh2bS5yZXBlYXQgZmFpbCBsaWtlIDE0MDQ4NwoKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVz
dGluZzoKIG92bWYgICAgICAgICAgICAgICAgIGFiYzAxNTViMDM0MjMwMTI4YWQ0YWFhNTFhYzA1
YTMxNWFjZmE3YzEKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAgICAgICAgIDEyMzc1
MTdiMjEzMDVhZDk2ODM0ZjlhMDUxNGE4MzY1ZGQ4YTFjNDEKCkxhc3QgdGVzdCBvZiBiYXNpcyAg
IDE0MDUyNyAgMjAxOS0wOC0yMiAxMzoyMzowOSBaICAgIDEgZGF5cwpUZXN0aW5nIHNhbWUgc2lu
Y2UgICAxNDA1NTkgIDIwMTktMDgtMjMgMDQ6NTI6MTMgWiAgICAwIGRheXMgICAgMSBhdHRlbXB0
cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBCb2IgRmVu
ZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+CiAgRmVuZywgQm9iIEMgPGJvYi5jLmZlbmdAaW50ZWwu
Y29tPgogIFNoaSwgU3RldmVuIDxzdGV2ZW4uc2hpQGludGVsLmNvbT4KICBTdGV2ZW4gU2hpIDxz
dGV2ZW4uc2hpQGludGVsLmNvbT4KCmpvYnM6CiBidWlsZC1hbWQ2NC14c20gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYteHNt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAog
YnVpbGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhc3MgICAgCiBidWlsZC1pMzg2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0LWxpYnZpcnQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1saWJ2
aXJ0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBi
dWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtcHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1vdm1m
LWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0LWFtZDY0LWkzODYt
eGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0Kc2ctcmVwb3J0LWZsaWdodCBvbiBvc3N0ZXN0LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnCmxv
Z3M6IC9ob21lL2xvZ3MvbG9ncwppbWFnZXM6IC9ob21lL2xvZ3MvaW1hZ2VzCgpMb2dzLCBjb25m
aWcgZmlsZXMsIGV0Yy4gYXJlIGF2YWlsYWJsZSBhdAogICAgaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzCgpFeHBsYW5hdGlvbiBvZiB0aGVzZSByZXBvcnRz
LCBhbmQgb2Ygb3NzdGVzdCBpbiBnZW5lcmFsLCBpcyBhdAogICAgaHR0cDovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9iO2Y9UkVBRE1FLmVtYWlsO2hiPW1hc3Rl
cgogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9b3NzdGVzdC5naXQ7YT1ibG9i
O2Y9UkVBRE1FO2hiPW1hc3RlcgoKVGVzdCBoYXJuZXNzIGNvZGUgY2FuIGJlIGZvdW5kIGF0CiAg
ICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYj9wPW9zc3Rlc3QuZ2l0O2E9c3VtbWFyeQoK
ClB1c2hpbmcgcmV2aXNpb24gOgoKVG8geGVuYml0cy54ZW4ub3JnOi9ob21lL3hlbi9naXQvb3Nz
dGVzdC9vdm1mLmdpdAogICAxMjM3NTE3YjIxLi5hYmMwMTU1YjAzICBhYmMwMTU1YjAzNDIzMDEy
OGFkNGFhYTUxYWMwNWEzMTVhY2ZhN2MxIC0+IHhlbi10ZXN0ZWQtbWFzdGVyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
