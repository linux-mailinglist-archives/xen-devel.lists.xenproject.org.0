Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91E9B5E7
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2019 13:33:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKhzI-0003AS-94; Sun, 28 Apr 2019 11:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vf0z=S6=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hKhzH-0003AG-KU
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2019 11:28:51 +0000
X-Inumbo-ID: ca6d008e-69a8-11e9-a121-033d79f49bd5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca6d008e-69a8-11e9-a121-033d79f49bd5;
 Sun, 28 Apr 2019 11:28:48 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hKhzD-0001jr-OG; Sun, 28 Apr 2019 11:28:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hKhzC-0001rj-M5; Sun, 28 Apr 2019 11:28:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hKhzC-0002FD-LT; Sun, 28 Apr 2019 11:28:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135380-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:<job
 status>:broken:regression
 xen-unstable-coverity:coverity-amd64:host-install(4):broken:regression
X-Osstest-Versions-This: xen=dc497635d93f6672f82727ad97a55205177be2aa
X-Osstest-Versions-That: xen=eeb31ee522c7bb8541eb4c037be2c42bfcf0a3c3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Apr 2019 11:28:46 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 135380: trouble: broken
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

ZmxpZ2h0IDEzNTM4MCB4ZW4tdW5zdGFibGUtY292ZXJpdHkgcmVhbCBbcmVhbF0KaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTM4MC8KCkZhaWx1cmVz
IGFuZCBwcm9ibGVtcyB3aXRoIHRlc3RzIDotKAoKVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVk
IGFuZCBhcmUgYmxvY2tpbmcsCmluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVu
OgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgICA8am9iIHN0YXR1cz4gICAgICAgICAg
ICAgICAgIGJyb2tlbgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgNCBob3N0LWluc3Rh
bGwoNCkgICAgICAgIGJyb2tlbiBSRUdSLiB2cy4gMTMzNjE1Cgp2ZXJzaW9uIHRhcmdldGVkIGZv
ciB0ZXN0aW5nOgogeGVuICAgICAgICAgICAgICAgICAgZGM0OTc2MzVkOTNmNjY3MmY4MjcyN2Fk
OTdhNTUyMDUxNzdiZTJhYQpiYXNlbGluZSB2ZXJzaW9uOgogeGVuICAgICAgICAgICAgICAgICAg
ZWViMzFlZTUyMmM3YmI4NTQxZWI0YzAzN2JlMmM0MmJmY2YwYTNjMwoKTGFzdCB0ZXN0IG9mIGJh
c2lzICAgMTMzNjE1ICAyMDE5LTAzLTA2IDA5OjE4OjUxIFogICA1MyBkYXlzCkZhaWxpbmcgc2lu
Y2UgICAgICAgIDEzMzY4MiAgMjAxOS0wMy0xMCAwOToxODoyOSBaICAgNDkgZGF5cyAgIDE1IGF0
dGVtcHRzClRlc3Rpbmcgc2FtZSBzaW5jZSAgIDEzNTM4MCAgMjAxOS0wNC0yOCAwOToxODoyMyBa
ICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9u
cyB1bmRlciB0ZXN0OgogIEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
PgogIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KICBB
bWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+CiAgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KICBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292
QGVwYW0uY29tPgogIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgog
IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgogIENoYW8gR2FvIDxjaGFvLmdhb0Bp
bnRlbC5jb20+CiAgQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29t
PgogIERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KICBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CiAgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+CiAgSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CiAg
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tCiAgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgogIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KICBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgogIEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
PgogIEx1a2FzIEp1ZW5nZXIgPGp1ZW5nZXJAaWNlLnJ3dGgtYWFjaGVuLmRlPgogIE0gQSBZb3Vu
ZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KICBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFt
YXpvbi5kZT4KICBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CiAgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgogIFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiAgUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3
ZWxAYW1hem9uLmRlPgogIFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+CiAgUHJpdGhhIFNyaXZhc3RhdmEgPHByaXRoYS5zcml2YXN0YXZhQGNpdHJpeC5jb20+CiAg
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgogIFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgogIFJvbmFuIEFiaGFtb24gPHJvbmFuLmFiaGFt
b25AdmF0ZXMuZnI+CiAgU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgog
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KICBUaW0gRGVlZ2FuIDx0aW1A
eGVuLm9yZz4KICBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgogIFhpYW9jaGVuIFdhbmcg
PHdhbmd4aWFvY2hlbjBAZ21haWwuY29tPgogIFhpbiBMaSA8eGluLmxpQGNpdHJpeC5jb20+Cgpq
b2JzOgogY292ZXJpdHktYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyb2tlbiAgCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGlnaHQgb24gb3NzdGVzdC50ZXN0
LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xvZ3MKaW1hZ2VzOiAvaG9tZS9s
b2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFyZSBhdmFpbGFibGUgYXQKICAg
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncwoKRXhwbGFu
YXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3QgaW4gZ2VuZXJhbCwgaXMgYXQK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtm
PVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0ZXIKClRlc3QgaGFybmVzcyBj
b2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWI/cD1v
c3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpOb3QgcHVzaGluZy4KCihObyByZXZpc2lvbiBsb2c7IGl0
IHdvdWxkIGJlIDMzMjggbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
