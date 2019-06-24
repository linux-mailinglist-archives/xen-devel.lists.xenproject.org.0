Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915CC510A6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 17:36:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfQy0-00024j-Ty; Mon, 24 Jun 2019 15:33:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EXrY=UX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hfQxz-00024I-Bi
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 15:33:11 +0000
X-Inumbo-ID: 5dc9bf3c-9695-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5dc9bf3c-9695-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 15:33:10 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w5lZWeFNe0Mt5GGtO6902sMa5nS1nV2xADuKuRQrGBgAgx31QkWiqGQGMdacZW9phAMfUm4Igl
 VQ/s9CQ17PbJ//+BE+ma5u8bgbEkNykZamyaiR/otO1OIOv/zsrJmFZ3ulhFI99vBlEuzIMBxT
 eHF0PBSjMjLE+7dKSKxBxQxLeHBVcOdp0ZOgSywvs5ALd/nd6BzDaIt0i4PibR3ivjWcOKn4+T
 lSjhuICS/xIdcNcEI0rSAEJzZtZ7wPq1VIsV8u9r2DGszoHxXG4+FN6LR3Zo/4MehbVzUyiWYq
 G5g=
X-SBRS: 2.7
X-MesageID: 2148093
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2148093"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 24 Jun 2019 16:32:49 +0100
Message-ID: <20190624153257.20163-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 0/8] xen queue 2019-06-24
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0NzRmMzkzOGQ3OWFiMzZiOTIzMWM5
YWQzYjVhOTMxNGMyYWVhY2RlOgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL2FtYXJrb3ZpYy90YWdzL21pcHMtcXVldWUtanVuLTIxLTIwMTknIGludG8gc3RhZ2luZyAo
MjAxOS0wNi0yMSAxNTo0MDo1MCArMDEwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0OgoKICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBl
cmFyZC9xZW11LWRtLmdpdCB0YWdzL3B1bGwteGVuLTIwMTkwNjI0Cgpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gYTM0MzRhMmQ1NmFlZTMwMThmNGEwZjU1YzdlMGYwY2RhMTFmM2Q5ZToK
CiAgeGVuOiBJbXBvcnQgb3RoZXIgeGVuL2lvLyouaCAoMjAxOS0wNi0yNCAxMDo0MjozMCArMDEw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KWGVuIHF1ZXVlCgoqIEZpeCBidWlsZAoqIHhlbi1ibG9jazogc3VwcG9ydCBm
ZWF0dXJlLWxhcmdlLXNlY3Rvci1zaXplCiogeGVuLWJsb2NrOiBTdXBwb3J0IElPVGhyZWFkIHBv
bGxpbmcgZm9yIFBWIHNoYXJlZCByaW5ncwoqIEF2b2lkIHVzYWdlIG9mIGEgVkxBCiogQ2xlYW51
cCBYZW4gaGVhZGVycyB1c2FnZQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbnRob255IFBFUkFSRCAoNCk6CiAgICAgIHhl
bjogQXZvaWQgVkxBCiAgICAgIHhlbjogRHJvcCBpbmNsdWRlcyBvZiB4ZW4vaHZtL3BhcmFtcy5o
CiAgICAgIFJldmVydCB4ZW4vaW8vcmluZy5oIG9mICJDbGVhbiB1cCBhIGZldyBoZWFkZXIgZ3Vh
cmQgc3ltYm9scyIKICAgICAgeGVuOiBJbXBvcnQgb3RoZXIgeGVuL2lvLyouaAoKUGF1bCBEdXJy
YW50ICg0KToKICAgICAgeGVuLWJsb2NrOiBzdXBwb3J0IGZlYXR1cmUtbGFyZ2Utc2VjdG9yLXNp
emUKICAgICAgeGVuLWJ1czogdXNlIGEgc2VwYXJhdGUgZmQgZm9yIGVhY2ggZXZlbnQgY2hhbm5l
bAogICAgICB4ZW4tYnVzOiBhbGxvdyBBaW9Db250ZXh0IHRvIGJlIHNwZWNpZmllZCBmb3IgZWFj
aCBldmVudCBjaGFubmVsCiAgICAgIHhlbi1idXMgLyB4ZW4tYmxvY2s6IGFkZCBzdXBwb3J0IGZv
ciBldmVudCBjaGFubmVsIHBvbGxpbmcKCiBody85cGZzL3hlbi05cGZzLmggICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgNCArLQogaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jICAgICAg
ICAgICB8ICAgNDQgKy0KIGh3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2suaCAgICAgICAgICAg
fCAgICAzICstCiBody9ibG9jay94ZW4tYmxvY2suYyAgICAgICAgICAgICAgICAgICAgIHwgICAz
OCArLQogaHcvYmxvY2sveGVuX2Jsa2lmLmggICAgICAgICAgICAgICAgICAgICB8ICAgIDUgKy0K
IGh3L2NoYXIveGVuX2NvbnNvbGUuYyAgICAgICAgICAgICAgICAgICAgfCAgICAyICstCiBody9k
aXNwbGF5L3hlbmZiLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArLQogaHcvaTM4Ni94
ZW4veGVuLWh2bS5jICAgICAgICAgICAgICAgICAgICB8ICAgMTYgKy0KIGh3L2kzODYveGVuL3hl
bi1tYXBjYWNoZS5jICAgICAgICAgICAgICAgfCAgICAyIC0KIGh3L25ldC94ZW5fbmljLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgICAyICstCiBody91c2IveGVuLXVzYi5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgMyArLQogaHcveGVuL3hlbi1idXMuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgOTIgKy0tCiBody94ZW4veGVuLWxlZ2FjeS1iYWNrZW5kLmMgICAgICAg
ICAgICAgIHwgICAgMiAtCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvZ3JhbnRfdGFibGUuaCAg
IHwgICAzNiArKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2Jsa2lmLmggICAgICB8ICA3
MTIgKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vY29u
c29sZS5oICAgIHwgICA0NiArKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2ZiaWYuaCAg
ICAgICB8ICAxNTYgKysrKysKIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9rYmRpZi5oICAg
ICAgfCAgNTY2ICsrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8v
bmV0aWYuaCAgICAgIHwgMTAxMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1
ZGUvaHcveGVuL2ludGVyZmFjZS9pby9wcm90b2NvbHMuaCAgfCAgIDQyICsrCiBpbmNsdWRlL2h3
L3hlbi97ID0+IGludGVyZmFjZX0vaW8vcmluZy5oIHwgICAgNiArLQogaW5jbHVkZS9ody94ZW4v
aW50ZXJmYWNlL2lvL3VzYmlmLmggICAgICB8ICAyNTQgKysrKysrKysKIGluY2x1ZGUvaHcveGVu
L2ludGVyZmFjZS9pby94ZW5idXMuaCAgICAgfCAgIDcwICsrKwogaW5jbHVkZS9ody94ZW4veGVu
LWJ1cy5oICAgICAgICAgICAgICAgICB8ICAgIDkgKy0KIGluY2x1ZGUvaHcveGVuL3hlbl9jb21t
b24uaCAgICAgICAgICAgICAgfCAgICAyICstCiAyNSBmaWxlcyBjaGFuZ2VkLCAzMDIzIGluc2Vy
dGlvbnMoKyksIDEwNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3
L3hlbi9pbnRlcmZhY2UvZ3JhbnRfdGFibGUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
aHcveGVuL2ludGVyZmFjZS9pby9ibGtpZi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9o
dy94ZW4vaW50ZXJmYWNlL2lvL2NvbnNvbGUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
aHcveGVuL2ludGVyZmFjZS9pby9mYmlmLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3
L3hlbi9pbnRlcmZhY2UvaW8va2JkaWYuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcv
eGVuL2ludGVyZmFjZS9pby9uZXRpZi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94
ZW4vaW50ZXJmYWNlL2lvL3Byb3RvY29scy5oCiByZW5hbWUgaW5jbHVkZS9ody94ZW4veyA9PiBp
bnRlcmZhY2V9L2lvL3JpbmcuaCAoOTklKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcv
eGVuL2ludGVyZmFjZS9pby91c2JpZi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94
ZW4vaW50ZXJmYWNlL2lvL3hlbmJ1cy5oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
