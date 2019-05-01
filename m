Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B8A10E91
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 23:28:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLwk4-0006bM-Py; Wed, 01 May 2019 21:26:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xAd2=TB=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hLwk3-0006bC-HW
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 21:26:15 +0000
X-Inumbo-ID: bf513927-6c57-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bf513927-6c57-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 21:26:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hLwk1-0004wI-Fo; Wed, 01 May 2019 21:26:13 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hLwk1-00029F-81; Wed, 01 May 2019 21:26:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hLwk1-0000Ra-7J; Wed, 01 May 2019 21:26:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-135442-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Versions-This: xtf=1c9db326a7108203d5cfd706aa2c0a8818e9cccf
X-Osstest-Versions-That: xtf=55b53286e669cc27119f5b4323a7e4db2aeae91f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 May 2019 21:26:13 +0000
Subject: [Xen-devel] [xtf test] 135442: all pass - PUSHED
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

ZmxpZ2h0IDEzNTQ0MiB4dGYgcmVhbCBbcmVhbF0KaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTQ0Mi8KClBlcmZlY3QgOi0pCkFsbCB0ZXN0cyBpbiB0
aGlzIGZsaWdodCBwYXNzZWQgYXMgcmVxdWlyZWQKdmVyc2lvbiB0YXJnZXRlZCBmb3IgdGVzdGlu
ZzoKIHh0ZiAgICAgICAgICAgICAgICAgIDFjOWRiMzI2YTcxMDgyMDNkNWNmZDcwNmFhMmMwYTg4
MThlOWNjY2YKYmFzZWxpbmUgdmVyc2lvbjoKIHh0ZiAgICAgICAgICAgICAgICAgIDU1YjUzMjg2
ZTY2OWNjMjcxMTlmNWI0MzIzYTdlNGRiMmFlYWU5MWYKCkxhc3QgdGVzdCBvZiBiYXNpcyAgIDEz
NTI2OCAgMjAxOS0wNC0yNCAxOToxMToyMSBaICAgIDcgZGF5cwpUZXN0aW5nIHNhbWUgc2luY2Ug
ICAxMzU0NDIgIDIwMTktMDQtMzAgMTg6MTE6NDMgWiAgICAxIGRheXMgICAgMSBhdHRlbXB0cwoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tClBlb3BsZSB3aG8gdG91Y2hlZCByZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXh0ZiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVp
bGQtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhc3MgICAgCiBidWlsZC1hbWQ2NC1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QteHRmLWFtZDY0LWFtZDY0LTEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC14dGYtYW1kNjQtYW1k
NjQtMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiB0ZXN0
LXh0Zi1hbWQ2NC1hbWQ2NC0zICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGFzcyAgICAKIHRlc3QteHRmLWFtZDY0LWFtZDY0LTQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXNzICAgIAogdGVzdC14dGYtYW1kNjQtYW1kNjQtNSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnNnLXJlcG9ydC1mbGln
aHQgb24gb3NzdGVzdC50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZwpsb2dzOiAvaG9tZS9sb2dzL2xv
Z3MKaW1hZ2VzOiAvaG9tZS9sb2dzL2ltYWdlcwoKTG9ncywgY29uZmlnIGZpbGVzLCBldGMuIGFy
ZSBhdmFpbGFibGUgYXQKICAgIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncwoKRXhwbGFuYXRpb24gb2YgdGhlc2UgcmVwb3J0cywgYW5kIG9mIG9zc3Rlc3Qg
aW4gZ2VuZXJhbCwgaXMgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9z
c3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRS5lbWFpbDtoYj1tYXN0ZXIKICAgIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPW9zc3Rlc3QuZ2l0O2E9YmxvYjtmPVJFQURNRTtoYj1tYXN0
ZXIKClRlc3QgaGFybmVzcyBjb2RlIGNhbiBiZSBmb3VuZCBhdAogICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWI/cD1vc3N0ZXN0LmdpdDthPXN1bW1hcnkKCgpQdXNoaW5nIHJldmlzaW9u
IDoKClRvIHhlbmJpdHMueGVuLm9yZzovaG9tZS94ZW4vZ2l0L3h0Zi5naXQKICAgNTViNTMyOC4u
MWM5ZGIzMiAgMWM5ZGIzMjZhNzEwODIwM2Q1Y2ZkNzA2YWEyYzBhODgxOGU5Y2NjZiAtPiB4ZW4t
dGVzdGVkLW1hc3RlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
