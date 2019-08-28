Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA0A0657
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:31:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2zsF-00046h-Lk; Wed, 28 Aug 2019 15:28:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=835Q=WY=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1i2zsE-00046c-NI
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:28:38 +0000
X-Inumbo-ID: 81830458-c9a8-11e9-8980-bc764e2007e4
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81830458-c9a8-11e9-8980-bc764e2007e4;
 Wed, 28 Aug 2019 15:28:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o184so504293wme.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2019 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hYnLDraw8u1ib3/dbHTi5zXjLZ2+RYJEj7c1YBJrbJs=;
 b=sl6iIv6ietRbAeCBJWGCKFDp0VnB0IaPkphk5J22XS92tCQtFHsk11u1NUYQCWbfsi
 Xu/xkGX2g62nQ6vHhae/NDZuKTLu0etC984ToSnDmWReWafP4qr24nHG1y147qEuqlfu
 CFSiqsalFfP13ly/CZCDAeJ2G+MYWPBNAGkp7flaHXpW2pqDckiZtcj+5xVKK88LboNX
 1cQJ/jV37pKLiyvFg5y057KMCtFDXNQkPLcdtP5Jye1lW2lt6g+Jpyy+5WbokhpLjrE/
 HlQT1M2dTyIwvHUm67M9UX+p8k0wVNgJrp/uTJ/kJQFzqWk2X0rpKjrn6QINs121xK6w
 MWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hYnLDraw8u1ib3/dbHTi5zXjLZ2+RYJEj7c1YBJrbJs=;
 b=C2wVoh8wWuMPitvPBrtk8dZPBjhB0bVIvpLEvbPboLEBgZCo3k+3ufns/M/Y7KJWwG
 iA/xi2hRsVj1mwx882h+4DD8xHe0ietf/ny699Y1WaI8gQnDVcgt7RpX748YjKnCbc0d
 vOKET8JdrtLWvMkNM7zjAj1Ts3fHLQgjDuzc30PcBqmtQCQyLLhtfnx3pT2L4kg8mzN9
 Co6YDEJNaSJhP72TRQQWT184TP9e1a9LvTVGeYXisIpVQErCSuQploCODGsg1C1S8TMj
 JoA69UKJCwZCqf62HOaGEPgcnsHwG8BqRQRR/wFs8gajUcKS8fRoTua7E+4f7qlrEwi+
 nYog==
X-Gm-Message-State: APjAAAUioOnXsKMAut+ACA6Of0PMS6C8DM7TJmcaa+jEJAXlIupvH2LJ
 ZesFAjkvRE9c0uyhT0JbF3ZtLTeM5gRHoCoEohW11h4w
X-Google-Smtp-Source: APXvYqxgw0cuYOhDC0qXaPSyQlFTxKeBaRZz+7e1AVSjDudChkDppuVWif/urkDh6u+8/59ZJz9Q2c7uNXE6UgQ/Fv8=
X-Received: by 2002:a1c:6782:: with SMTP id b124mr5914633wmc.143.1567006116960; 
 Wed, 28 Aug 2019 08:28:36 -0700 (PDT)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 28 Aug 2019 09:28:00 -0600
Message-ID: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] Question about xenpage_list
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

SGkgYWxsLApJJ20gdHJ5aW5nIHRvIHRyYWNrIGRvd24gaG93IGEgY2FsbCBpbiBjb21tb24vZ3Jh
bnRfdGFibGUuYyB0bwpzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0IHdpbGwgYWN0dWFsbHkgcG9w
dWxhdGUgdGhhdCBwYWdlIGludG8gdGhlCmd1ZXN0J3MgcGh5c21hcC4gSW1tZWRpYXRlbHkgYWZ0
ZXIgdGhlIGNhbGwgdGhlIHBhZ2UgZG9lc24ndCBzZWVtIHRvCmJlIHByZXNlbnQgaW4gdGhlIHBo
eXNtYXAsIGFzIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qgd2lsbCBqdXN0IGFkZAp0aGUgcGFn
ZSB0byB0aGUgZG9tYWluJ3MgeGVucGFnZV9saXN0IGxpbmtlZC1saXN0OgoKICAgICAgICB1bnNp
Z25lZCBsb25nIG1mbjsKICAgICAgICB1bnNpZ25lZCBsb25nIGdmbjsKCiAgICAgICAgc2hhcmVf
eGVuX3BhZ2Vfd2l0aF9ndWVzdCh2aXJ0X3RvX3BhZ2UoZ3QtPnNoYXJlZF9yYXdbaV0pLCBkLCBT
SEFSRV9ydyk7CgogICAgICAgIG1mbiA9IHZpcnRfdG9fbWZuKGd0LT5zaGFyZWRfcmF3W2ldKTsK
ICAgICAgICBnZm4gPSBtZm5fdG9fZ21mbihkLCBtZm4pOwoKICAgICAgICBnZHByaW50ayhYRU5M
T0dfSU5GTywgIlNoYXJpbmcgJWx4IC0+ICVseCB3aXRoIGRvbWFpbiAldVxuIiwKZ2ZuLCBtZm4s
IGQtPmRvbWFpbl9pZCk7CgpUaGlzIHJlc3VsdHMgaW4gdGhlIGZvbGxvd2luZzoKCihYRU4pIGdy
YW50X3RhYmxlLmM6MTgyMDpkMHYwIFNoYXJpbmcgZmZmZmZmZmZmZmZmZmZmZiAtPiA0MmM3MWUg
d2l0aCBkb21haW4gMQoKQUZBSUNUIHRoZSBwYWdlIG9ubHkgZ2V0cyBwb3B1bGF0ZWQgaW50byB0
aGUgcGh5c21hcCBvbmNlIHRoZSBkb21haW4KZ2V0cyB1bnBhdXNlZC4gSWYgSSBsZXQgdGhlIGRv
bWFpbiBydW4gYW5kIHRoZW4gcGF1c2UgaXQgSSBjYW4gc2VlCnRoYXQgdGhlIHBhZ2UgaXMgaW4g
dGhlIGd1ZXN0J3MgcGh5c21hcCAoYnkgbG9vcGluZyB0aHJvdWdoIGFsbCB0aGUKZW50cmllcyBp
biBpdHMgRVBUKToKCihYRU4pIG1lbV9zaGFyaW5nLmM6MTYzNjpkMHYwIDB4ZjIwMDAgLT4gMHg0
MmM3MWUgaXMgYSBncmFudCBtYXBwaW5nCnNoYXJlZCB3aXRoIHRoZSBndWVzdAoKR3JlcHBpbmcg
Zm9yIHhlbnBhZ2VfbGlzdCBpbiB0aGUgY29kZWJhc2UgZG9lc24ndCBzZWVtIHRvIHJldmVhbCB3
aGVyZQppdCBnZXRzIHBsdWdnZWQgaW4gdG8gdGhlIHBoeXNtYXAuIEkgd291bGQgbmVlZCB0byBm
aW5kIHRoZSBHRk4gd2hlcmUKdGhlIHBhZ2Ugd2lsbCBnZXQgcGx1Z2dlZCBpbnRvIHRoZSBndWVz
dCBiZWZvcmUgaXQncyB1bnBhdXNlZC4gQW55b25lCmhhcyBhbiBpbnNpZ2h0IG9uIGhvdyBJIGNv
dWxkIGRvIHRoYXQ/CgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
