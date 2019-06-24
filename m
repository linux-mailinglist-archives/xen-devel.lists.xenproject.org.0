Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9533510A5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 17:36:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfQy3-00025b-FT; Mon, 24 Jun 2019 15:33:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EXrY=UX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hfQy0-00024o-Tm
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 15:33:12 +0000
X-Inumbo-ID: 6035229e-9695-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6035229e-9695-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 15:33:12 +0000 (UTC)
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
IronPort-SDR: 8a/f3n8FrzsCNMdKRAJOtwsqjTiA0a4FLq3A2XI0xZ1DlDQZvuVaC/p1tV6/EnLfA1kf33mOz5
 1uslDhMrijaO7GqLdogyXwL6HQZwIV+qmYliRtpRp1Xzb4W8cLVNbQH+uJJ0v7EqfB4j06/kBt
 bVklUXfDvjjFgkLrvN3FMPmByYOg8KBRgluadUaH9LXz5HeI0+2GdEvQKYpuvue96rDucnQdko
 8Rle0HnjzCkMnvZQx0971bA7WoNY8ngDjF0HenocJ33ZIhzxLQd6uagwUxZW5G0LrYEqmOxPne
 g+Y=
X-SBRS: 2.7
X-MesageID: 2148104
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2148104"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 24 Jun 2019 16:32:56 +0100
Message-ID: <20190624153257.20163-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624153257.20163-1-anthony.perard@citrix.com>
References: <20190624153257.20163-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 7/8] Revert xen/io/ring.h of "Clean up a few
 header guard symbols"
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

VGhpcyByZXZlcnRzIGNoYW5nZXMgdG8gaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oIGZyb20gY29t
bWl0CjM3Njc3ZDdkYjM5YTNjMjUwYWQ2NjFkMDBmYjdjM2I1OWQwNDdiMWYuCgpGb2xsb3dpbmcg
Mzc2NzdkN2RiMyAiQ2xlYW4gdXAgYSBmZXcgaGVhZGVyIGd1YXJkIHN5bWJvbHMiLCBRRU1VIHN0
YXJ0CnRvIGZhaWwgdG8gYnVpbGQ6CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gfi94ZW4vdG9vbHMv
Li4vdG9vbHMvaW5jbHVkZS94ZW4vaW8vYmxraWYuaDozMTowLAogICAgICAgICAgICAgICAgIGZy
b20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbl9ibGtpZi5oOjUsCiAgICAg
ICAgICAgICAgICAgZnJvbSB+L3hlbi90b29scy9xZW11LXhlbi1kaXIvaHcvYmxvY2sveGVuLWJs
b2NrLmM6MjI6Cn4veGVuL3Rvb2xzLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2lvL3JpbmcuaDo2ODow
OiBlcnJvcjogIl9fQ09OU1RfUklOR19TSVpFIiByZWRlZmluZWQgWy1XZXJyb3JdCiAjZGVmaW5l
IF9fQ09OU1RfUklOR19TSVpFKF9zLCBfc3opIFwKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSB+L3hl
bi90b29scy9xZW11LXhlbi1kaXIvaHcvYmxvY2sveGVuX2Jsa2lmLmg6NDowLAogICAgICAgICAg
ICAgICAgIGZyb20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbi1ibG9jay5j
OjIyOgp+L3hlbi90b29scy9xZW11LXhlbi1kaXIvaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oOjY2
OjA6IG5vdGU6IHRoaXMgaXMgdGhlIGxvY2F0aW9uIG9mIHRoZSBwcmV2aW91cyBkZWZpbml0aW9u
CiAjZGVmaW5lIF9fQ09OU1RfUklOR19TSVpFKF9zLCBfc3opIFwKClRoZSBpc3N1ZSBpcyB0aGF0
IHNvbWUgcHVibGljIHhlbiBoZWFkZXJzIGhhdmUgYmVlbiBpbXBvcnRlZCAoYnkKZjY1ZWFkYjYz
OSAieGVuOiBpbXBvcnQgcmluZy5oIGZyb20geGVuIikgYnV0IG5vdCBhbGwuIFdpdGggdGhlIGNo
YW5nZQppbiB0aGUgZ3VhcmRzIHN5bWJvbGUsIHRoZSByaW5nLmggaGVhZGVyIHN0YXJ0IHRvIGJl
IGltcG9ydGVkIHR3aWNlLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJy
YW5nZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KTWVzc2FnZS1JZDogPDIwMTkwNjIxMTA1NDQxLjMwMjUtMi1hbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgotLS0KIGluY2x1ZGUvaHcveGVuL2lvL3JpbmcuaCB8IDYgKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcveGVuL2lvL3JpbmcuaCBiL2luY2x1ZGUvaHcveGVuL2lvL3Jpbmcu
aAppbmRleCA2MmFiZmQ3YTZlLi4xYWRhY2YwOWY5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3hl
bi9pby9yaW5nLmgKKysrIGIvaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oCkBAIC0yNCw4ICsyNCw4
IEBACiAgKiBUaW0gRGVlZ2FuIGFuZCBBbmRyZXcgV2FyZmllbGQgTm92ZW1iZXIgMjAwNC4KICAq
LwogCi0jaWZuZGVmIFhFTl9QVUJMSUNfSU9fUklOR19ICi0jZGVmaW5lIFhFTl9QVUJMSUNfSU9f
UklOR19ICisjaWZuZGVmIF9fWEVOX1BVQkxJQ19JT19SSU5HX0hfXworI2RlZmluZSBfX1hFTl9Q
VUJMSUNfSU9fUklOR19IX18KIAogLyoKICAqIFdoZW4gI2luY2x1ZGUnaW5nIHRoaXMgaGVhZGVy
LCB5b3UgbmVlZCB0byBwcm92aWRlIHRoZSBmb2xsb3dpbmcKQEAgLTQ2OSw3ICs0NjksNyBAQCBz
dHJ1Y3QgbmFtZSMjX2RhdGFfaW50ZiB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCiB9OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiBERUZJTkVfWEVO
X0ZMRVhfUklORyhuYW1lKQogCi0jZW5kaWYgLyogWEVOX1BVQkxJQ19JT19SSU5HX0ggKi8KKyNl
bmRpZiAvKiBfX1hFTl9QVUJMSUNfSU9fUklOR19IX18gKi8KIAogLyoKICAqIExvY2FsIHZhcmlh
YmxlczoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
