Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE911E81E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:22:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnfO-0000J8-V7; Fri, 13 Dec 2019 16:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifnfM-0000IR-S0
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:19:44 +0000
X-Inumbo-ID: 5fa49e12-1dc4-11ea-8f70-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5fa49e12-1dc4-11ea-8f70-12813bfff9fa;
 Fri, 13 Dec 2019 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDPjG3bzf4auKjid69BMILX9vi363Mf6WYlN4QfXbhI=;
 b=MX5ZbxZwNcbTOc7VUp6R/4kmnKdUNAqg7cr701D4x76Sc07ErQzfRCYsxNLee15ceYKsev
 qAEQB0xgRujj7sk0UO4I7vMar2u0vSBXwxDKUSKDu9DPubyaJeYClcIqGOkCe5Mu+UGaEq
 gJVX385mLgX/lwMUsHP1SmoypxA0UIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-JGYk5EipN_i0mWuUmywLaw-1; Fri, 13 Dec 2019 11:19:40 -0500
X-MC-Unique: JGYk5EipN_i0mWuUmywLaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70F3F102C8BB;
 Fri, 13 Dec 2019 16:19:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C8B19C4F;
 Fri, 13 Dec 2019 16:19:26 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:48 +0100
Message-Id: <20191213161753.8051-8-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 07/12] hw/ide/piix: Remove superfluous DEVICE()
 cast
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDAyYTk1OTRiNGYwIGFscmVhZHkgY29udmVydGVkICdkZXYnIHRvIERldmljZVN0YXRl
LgpTaW5jZSB0aGUgY2FzdCBpcyBzdXBlcmZsdW91cywgcmVtb3ZlIGl0LgoKU2lnbmVkLW9mZi1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2lk
ZS9waWl4LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2h3L2lkZS9waWl4LmMgYi9ody9pZGUvcGlpeC5jCmluZGV4
IGRiMzEzZGQzYjEuLmZmZWZmNGUwOTUgMTAwNjQ0Ci0tLSBhL2h3L2lkZS9waWl4LmMKKysrIGIv
aHcvaWRlL3BpaXguYwpAQCAtMTkzLDcgKzE5Myw4IEBAIGludCBwY2lfcGlpeDNfeGVuX2lkZV91
bnBsdWcoRGV2aWNlU3RhdGUgKmRldiwgYm9vbCBhdXgpCiAgICAgICAgICAgICBibGtfdW5yZWYo
YmxrKTsKICAgICAgICAgfQogICAgIH0KLSAgICBxZGV2X3Jlc2V0X2FsbChERVZJQ0UoZGV2KSk7
CisgICAgcWRldl9yZXNldF9hbGwoZGV2KTsKKwogICAgIHJldHVybiAwOwogfQogCi0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
