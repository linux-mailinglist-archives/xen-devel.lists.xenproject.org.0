Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35751A9FC
	for <lists+xen-devel@lfdr.de>; Sun, 12 May 2019 04:14:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPdwj-0000RS-Ci; Sun, 12 May 2019 02:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jfTj=TM=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hPdwi-0000RG-Bj
 for xen-devel@lists.xenproject.org; Sun, 12 May 2019 02:10:36 +0000
X-Inumbo-ID: 1f621144-745b-11e9-88e1-4b75b45840c5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f621144-745b-11e9-88e1-4b75b45840c5;
 Sun, 12 May 2019 02:10:33 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hPdwe-0004Ki-5u; Sun, 12 May 2019 02:10:32 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hPdwd-0001rl-LQ; Sun, 12 May 2019 02:10:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hPdwd-0003Xq-Kj; Sun, 12 May 2019 02:10:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135978-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: ovmf=cd5147734cbe82f0c1665eb232608d75643944b0
X-Osstest-Versions-That: ovmf=f5245a1db144be95046deaed71a99b64362595b6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 May 2019 02:10:31 +0000
Subject: [Xen-devel] [ovmf test] 135978: all pass - PUSHED
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

ZmxpZ2h0IDEzNTk3OCBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzU5NzgvCgpQZXJmZWN0IDotKQpBbGwgdGVzdHMgaW4g
dGhpcyBmbGlnaHQgcGFzc2VkIGFzIHJlcXVpcmVkCnZlcnNpb24gdGFyZ2V0ZWQgZm9yIHRlc3Rp
bmc6CiBvdm1mICAgICAgICAgICAgICAgICBjZDUxNDc3MzRjYmU4MmYwYzE2NjVlYjIzMjYwOGQ3
NTY0Mzk0NGIwCmJhc2VsaW5lIHZlcnNpb246CiBvdm1mICAgICAgICAgICAgICAgICBmNTI0NWEx
ZGIxNDRiZTk1MDQ2ZGVhZWQ3MWE5OWI2NDM2MjU5NWI2CgpMYXN0IHRlc3Qgb2YgYmFzaXMgICAx
MzU4ODUgIDIwMTktMDUtMDggMDE6NDE6MzAgWiAgICA0IGRheXMKVGVzdGluZyBzYW1lIHNpbmNl
ICAgMTM1OTc4ICAyMDE5LTA1LTEwIDA0OjIxOjI2IFogICAgMSBkYXlzICAgIDEgYXR0ZW1wdHMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpQZW9wbGUgd2hvIHRvdWNoZWQgcmV2aXNpb25zIHVuZGVyIHRlc3Q6CiAgQm9iIEZlbmcg
PGJvYi5jLmZlbmdAaW50ZWwuY29tPgogIERhbmRhbiBCaSA8ZGFuZGFuLmJpQGludGVsLmNvbT4K
ICBFcmljIERvbmcgPGVyaWMuZG9uZ0BpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpoaWp1eC5m
YW5AaW50ZWwuY29tPgogIEZ1IFNpeXVhbiA8c2l5dWFuLmZ1QGludGVsLmNvbT4KICBIYW8gQSBX
dSA8aGFvLmEud3VAaW50ZWwuY29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+
CiAgTGltaW5nIEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+CiAgTWljaGFlbCBEIEtpbm5leSA8
bWRraW5uZXlAbWRraW5uZXktZGVzay5hbXIuY29ycC5pbnRlbC5jb20+CiAgTWljaGFlbCBEIEtp
bm5leSA8bWljaGFlbC5kLmtpbm5leUBpbnRlbC5jb20+CiAgU2hlbmdsZWkgWmhhbmcgPHNoZW5n
bGVpLnpoYW5nQGludGVsLmNvbT4KICBXZWk2IFh1IDx3ZWk2Lnh1QGludGVsLmNvbT4KICB4dXdl
aTYgPHdlaTYueHVAaW50ZWwuY29tPgogIFpoYW5nLCBTaGVuZ2xlaSA8c2hlbmdsZWkuemhhbmdA
aW50ZWwuY29tPgogIFpoaWNoYW8gR2FvIDx6aGljaGFvLmdhb0BpbnRlbC5jb20+CiAgWmhpZ3Vh
bmcgTGl1IDx6aGlndWFuZy5saXVAaW50ZWwuY29tPgogIFpoaWp1LkZhbiA8emhpanV4LmZhbkBp
bnRlbC5jb20+Cgpqb2JzOgogYnVpbGQtYW1kNjQteHNtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LXhzbSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWFtZDY0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAg
IAogYnVpbGQtaTM4NiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NC1saWJ2aXJ0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQt
cHZvcHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1pMzg2LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtb3ZtZi1hbWQ2NCAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92
bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9y
dC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9s
b2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBl
dGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9z
c3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTto
Yj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJl
dmlzaW9uIDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L29zc3Rlc3Qvb3ZtZi5n
aXQKICAgZjUyNDVhMWRiMS4uY2Q1MTQ3NzM0YyAgY2Q1MTQ3NzM0Y2JlODJmMGMxNjY1ZWIyMzI2
MDhkNzU2NDM5NDRiMCAtPiB4ZW4tdGVzdGVkLW1hc3RlcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
