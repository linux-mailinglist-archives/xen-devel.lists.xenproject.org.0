Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C4116A3E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:53:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFhE-0004gb-Kh; Mon, 09 Dec 2019 09:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3VR8=Z7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ieFhD-0004g8-3a
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:51:15 +0000
X-Inumbo-ID: 704cba1e-1a69-11ea-a914-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 704cba1e-1a69-11ea-a914-bc764e2007e4;
 Mon, 09 Dec 2019 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyTRNBIq6COiBd2fUeZp5zZWcFeEuRMkF4nfuRBiSRw=;
 b=cvY3ccTvyWjHZkBcrv17ASvPGEMR8baKsfU/sZsMnzuY/UsiXgDAJWlTLi1J+N0FmPekyl
 MLfkOEmEz7Jr8Dp5hrBVXwPTNbDd3a7E7eQbX7ni0YN7KzDpeyKjiLlmgCe8/K8XHi+R/e
 yWqrKJvwYKsYXRFHH5jHUEelLBD9OLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-LSW49e5NNvasJ4mh1-Fhgw-1; Mon, 09 Dec 2019 04:51:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47580800C74;
 Mon,  9 Dec 2019 09:51:02 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-142.brq.redhat.com [10.40.205.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72AB919C5B;
 Mon,  9 Dec 2019 09:50:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Dec 2019 10:50:02 +0100
Message-Id: <20191209095002.32194-7-philmd@redhat.com>
In-Reply-To: <20191209095002.32194-1-philmd@redhat.com>
References: <20191209095002.32194-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: LSW49e5NNvasJ4mh1-Fhgw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH-for-5.0 v3 6/6] hw/pci-host: Add Kconfig entry
 to select the IGD Passthrough Host Bridge
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHRoZSBYRU5fSUdEX1BBU1NUSFJPVUdIIEtjb25maWcgb3B0aW9uLgoKWGVuIGJ1aWxkIGhh
cyB0aGF0IG9wdGlvbiBzZWxlY3RlZCBieSBkZWZhdWx0LiBOb24tWGVuIGJ1aWxkcyBub3cKaGF2
ZSB0byBzZWxlY3QgdGhpcyBmZWF0dXJlIG1hbnVhbGx5LgoKU2lnbmVkLW9mZi1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KdjM6IE9ubHkgZGVmYXVs
dCB3aXRoIFhlbiAoQWxleCBXaWxsaWFtc29uKQoKSSBkaWQgbm90IHVzZWQgJ2RlcGVuZHMgb24g
WEVOJyBhcyBzdWdnZXN0ZWQgYnkgQWxleCBidXQKJ2RlZmF1bHQgeSBpZiBYRU4nLCBzbyBvbmUg
Y2FuIGJ1aWxkIFhFTiB3aXRob3V0IHRoaXMgZmVhdHVyZQooZm9yIGV4YW1wbGUsIG9uIG90aGVy
IEFSQ0ggdGhhbiBYODYpLgotLS0KIGh3L3BjaS1ob3N0L0tjb25maWcgICAgICAgfCA1ICsrKysr
CiBody9wY2ktaG9zdC9NYWtlZmlsZS5vYmpzIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9LY29u
ZmlnIGIvaHcvcGNpLWhvc3QvS2NvbmZpZwppbmRleCBiMGFhODM1MWM0Li4yNGJhOGVhMDQ2IDEw
MDY0NAotLS0gYS9ody9wY2ktaG9zdC9LY29uZmlnCisrKyBiL2h3L3BjaS1ob3N0L0tjb25maWcK
QEAgLTEsNiArMSwxMSBAQAogY29uZmlnIFBBTQogICAgIGJvb2wKIAorY29uZmlnIFhFTl9JR0Rf
UEFTU1RIUk9VR0gKKyAgICBib29sCisgICAgZGVmYXVsdCB5IGlmIFhFTgorICAgIHNlbGVjdCBQ
Q0lfSTQ0MEZYCisKIGNvbmZpZyBQUkVQX1BDSQogICAgIGJvb2wKICAgICBzZWxlY3QgUENJCmRp
ZmYgLS1naXQgYS9ody9wY2ktaG9zdC9NYWtlZmlsZS5vYmpzIGIvaHcvcGNpLWhvc3QvTWFrZWZp
bGUub2JqcwppbmRleCBmYTZkMTU1NmMwLi45YzQ2NmZhYjAxIDEwMDY0NAotLS0gYS9ody9wY2kt
aG9zdC9NYWtlZmlsZS5vYmpzCisrKyBiL2h3L3BjaS1ob3N0L01ha2VmaWxlLm9ianMKQEAgLTE0
LDcgKzE0LDcgQEAgY29tbW9uLW9iai0kKENPTkZJR19WRVJTQVRJTEVfUENJKSArPSB2ZXJzYXRp
bGUubwogY29tbW9uLW9iai0kKENPTkZJR19QQ0lfU0FCUkUpICs9IHNhYnJlLm8KIGNvbW1vbi1v
YmotJChDT05GSUdfRlVMT05HKSArPSBib25pdG8ubwogY29tbW9uLW9iai0kKENPTkZJR19QQ0lf
STQ0MEZYKSArPSBpNDQwZngubwotY29tbW9uLW9iai0kKENPTkZJR19QQ0lfSTQ0MEZYKSArPSB4
ZW5faWdkX3B0Lm8KK2NvbW1vbi1vYmotJChDT05GSUdfWEVOX0lHRF9QQVNTVEhST1VHSCkgKz0g
eGVuX2lnZF9wdC5vCiBjb21tb24tb2JqLSQoQ09ORklHX1BDSV9FWFBSRVNTX1EzNSkgKz0gcTM1
Lm8KIGNvbW1vbi1vYmotJChDT05GSUdfUENJX0VYUFJFU1NfR0VORVJJQ19CUklER0UpICs9IGdw
ZXgubwogY29tbW9uLW9iai0kKENPTkZJR19QQ0lfRVhQUkVTU19YSUxJTlgpICs9IHhpbGlueC1w
Y2llLm8KLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
