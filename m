Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BEDE5E7C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:07:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQR0-0006IJ-S6; Sat, 26 Oct 2019 18:05:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQQy-0006H3-Fa
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:05:04 +0000
X-Inumbo-ID: 1f69b3a7-f81b-11e9-94d7-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1f69b3a7-f81b-11e9-94d7-12813bfff9fa;
 Sat, 26 Oct 2019 18:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCTIRdFiH4uf08N1aCQiObLT3mS4637DLQTQTbUuYyw=;
 b=Aab+nFTO0cBn/KghP2YikRsDvfjbfSd9t+Iu6aUGQxkORgIOFHszIFW5xoR++5xh3Xt7OE
 3zuyV/DuKJd52Ddubb8oAUrMQJWB61f0Y8Md0z8NvlVUF6iND/YuFXUoMgHHKa6D0CxxID
 YF3QLFE4vIlg/oSSVJXFTI92vSKqmK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-f5EgBfXaOa-DEHWA8rl4gg-1; Sat, 26 Oct 2019 14:04:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A948A100550E;
 Sat, 26 Oct 2019 18:04:53 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF16760F82;
 Sat, 26 Oct 2019 18:04:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:40 +0200
Message-Id: <20191026180143.7369-18-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: f5EgBfXaOa-DEHWA8rl4gg-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 17/20] hw/pci-host/piix: Fix code style issues
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugd2lsbCBtb3ZlIHRoaXMgY29kZSwgZml4IGl0cyBzdHlsZSBmaXJzdC4KClJldmlld2VkLWJ5
OiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29tPgpSZXZpZXdlZC1i
eTogRXN0ZWJhbiBCb3NzZSA8ZXN0ZWJhbmJvc3NlQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L3BjaS1o
b3N0L3BpaXguYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9waWl4LmMgYi9ody9wY2kt
aG9zdC9waWl4LmMKaW5kZXggOTViMDQxMjJmYS4uMTU0NGM0NzI2YiAxMDA2NDQKLS0tIGEvaHcv
cGNpLWhvc3QvcGlpeC5jCisrKyBiL2h3L3BjaS1ob3N0L3BpaXguYwpAQCAtMTMzLDkgKzEzMywx
MCBAQCBzdGF0aWMgUENJSU5UeFJvdXRlIHBpaXgzX3JvdXRlX2ludHhfcGluX3RvX2lycSh2b2lk
ICpvcGFxdWUsIGludCBwY2lfaW50eCk7CiBzdGF0aWMgdm9pZCBwaWl4M193cml0ZV9jb25maWdf
eGVuKFBDSURldmljZSAqZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IGFkZHJlc3MsIHVpbnQzMl90IHZhbCwgaW50IGxlbik7CiAKLS8qIHJldHVybiB0aGUgZ2xv
YmFsIGlycSBudW1iZXIgY29ycmVzcG9uZGluZyB0byBhIGdpdmVuIGRldmljZSBpcnEKLSAgIHBp
bi4gV2UgY291bGQgYWxzbyB1c2UgdGhlIGJ1cyBudW1iZXIgdG8gaGF2ZSBhIG1vcmUgcHJlY2lz
ZQotICAgbWFwcGluZy4gKi8KKy8qCisgKiBSZXR1cm4gdGhlIGdsb2JhbCBpcnEgbnVtYmVyIGNv
cnJlc3BvbmRpbmcgdG8gYSBnaXZlbiBkZXZpY2UgaXJxCisgKiBwaW4uIFdlIGNvdWxkIGFsc28g
dXNlIHRoZSBidXMgbnVtYmVyIHRvIGhhdmUgYSBtb3JlIHByZWNpc2UgbWFwcGluZy4KKyAqLwog
c3RhdGljIGludCBwY2lfc2xvdF9nZXRfcGlycShQQ0lEZXZpY2UgKnBjaV9kZXYsIGludCBwY2lf
aW50eCkKIHsKICAgICBpbnQgc2xvdF9hZGRlbmQ7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
