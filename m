Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF071779F
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 13:32:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOKkw-0005iO-Ik; Wed, 08 May 2019 11:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AgcW=TI=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hOKkv-0005i9-Ca
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 11:29:01 +0000
X-Inumbo-ID: 76a437d6-7184-11e9-94fc-b74f9388bd12
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76a437d6-7184-11e9-94fc-b74f9388bd12;
 Wed, 08 May 2019 11:28:55 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hOKko-0001S3-7B; Wed, 08 May 2019 11:28:54 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hOKkn-0000Us-Vw; Wed, 08 May 2019 11:28:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hOKkn-0001XI-VL; Wed, 08 May 2019 11:28:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135897-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:coverity-upload:fail:regression
X-Osstest-Versions-This: xen=e83077a3d11072708a5c38fa09fa9d011914e2a1
X-Osstest-Versions-That: xen=eeb31ee522c7bb8541eb4c037be2c42bfcf0a3c3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 May 2019 11:28:53 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 135897: regressions - ALL
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

ZmxpZ2h0IDEzNTg5NyB4ZW4tdW5zdGFibGUtY292ZXJpdHkgcmVhbCBbcmVhbF0KaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTg5Ny8KClJlZ3Jlc3Np
b25zIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCmlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgogY292ZXJpdHktYW1kNjQgICAg
ICAgICAgICAgICAgNyBjb3Zlcml0eS11cGxvYWQgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMz
NjE1Cgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAg
ZTgzMDc3YTNkMTEwNzI3MDhhNWMzOGZhMDlmYTlkMDExOTE0ZTJhMQpiYXNlbGluZSB2ZXJzaW9u
OgogeGVuICAgICAgICAgICAgICAgICAgZWViMzFlZTUyMmM3YmI4NTQxZWI0YzAzN2JlMmM0MmJm
Y2YwYTNjMwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTMzNjE1ICAyMDE5LTAzLTA2IDA5OjE4OjUx
IFogICA2MyBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAgIDEzMzY4MiAgMjAxOS0wMy0xMCAwOTox
ODoyOSBaICAgNTkgZGF5cyAgIDE4IGF0dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNTg5
NyAgMjAxOS0wNS0wOCAwOToxODoyNCBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVv
cGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0ZXN0OgogIEFsZXhhbmRydSBJc2FpbGEg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgogIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4KICBBbWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFp
bC5jb20+CiAgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KICBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgogIEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgogIEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29t
PgogIENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CiAgQ2hyaXN0aWFuIExpbmRpZyA8Y2hy
aXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgogIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9l
LmNvbT4KICBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CiAgSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CiAgSWdvciBEcnV6aGluaW4gPGlnb3Iu
ZHJ1emhpbmluQGNpdHJpeC5jb20+CiAgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tCiAg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgogIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KICBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgogIEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgogIEx1a2FzIEp1ZW5nZXIgPGp1ZW5nZXJAaWNlLnJ3
dGgtYWFjaGVuLmRlPgogIE0gQSBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KICBOb3Ji
ZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KICBPbGFmIEhlcmluZyA8b2xhZkBhZXBm
bGUuZGU+CiAgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtv
QGVwYW0uY29tPgogIFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAgUGF3
ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgogIFBldHJlIFBpcmNhbGFidSA8
cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CiAgUHJpdGhhIFNyaXZhc3RhdmEgPHByaXRoYS5z
cml2YXN0YXZhQGNpdHJpeC5jb20+CiAgUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPgogIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgogIFJv
bmFuIEFiaGFtb24gPHJvbmFuLmFiaGFtb25AdmF0ZXMuZnI+CiAgU2VyZ2V5IER5YXNsaSA8c2Vy
Z2V5LmR5YXNsaUBjaXRyaXguY29tPgogIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVs
LmNvbT4KICBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KICBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgogIFhpYW9jaGVuIFdhbmcgPHdhbmd4aWFvY2hlbjBAZ21haWwuY29tPgogIFhpbiBM
aSA8eGluLmxpQGNpdHJpeC5jb20+Cgpqb2JzOgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9y
dC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9s
b2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBl
dGMuIGFyZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9z
c3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTto
Yj1tYXN0ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGlu
Zy4KCihObyByZXZpc2lvbiBsb2c7IGl0IHdvdWxkIGJlIDMzNDMgbGluZXMgbG9uZy4pCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
