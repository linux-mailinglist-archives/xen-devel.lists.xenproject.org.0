Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD350116A3B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:53:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFgT-0004O5-ST; Mon, 09 Dec 2019 09:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3VR8=Z7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ieFgS-0004No-5R
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:50:28 +0000
X-Inumbo-ID: 5395896e-1a69-11ea-87af-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5395896e-1a69-11ea-87af-12813bfff9fa;
 Mon, 09 Dec 2019 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQT1twDpLbPdu5i3g7UASwR5tJqP0VI32dQgZGzQBd4=;
 b=NXqvT18Ugsnf+aN8CNzmJzGkRCBTlWlmWMD2oS2bFczMcX8VhwTkh9Ypi5FqXnBXIVFF38
 aozIErpotH56pHxOynFQOj4idpUbn7bfAZcya2KYcKFh/R3TQ/g2PTdsD1SGAMyyFT3F9G
 iAAg6m5BlNB92Bup0MS3Hd1Q4tY0/Hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-0HquLGLpPjifq5N-al5RAA-1; Mon, 09 Dec 2019 04:50:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 995EA107ACC4;
 Mon,  9 Dec 2019 09:50:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-142.brq.redhat.com [10.40.205.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D1819C5B;
 Mon,  9 Dec 2019 09:50:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Dec 2019 10:49:57 +0100
Message-Id: <20191209095002.32194-2-philmd@redhat.com>
In-Reply-To: <20191209095002.32194-1-philmd@redhat.com>
References: <20191209095002.32194-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0HquLGLpPjifq5N-al5RAA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH-for-5.0 v3 1/6] hw/pci-host/i440fx: Correct the
 header description
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

TWlzc2VkIGR1cmluZyB0aGUgcmVmYWN0b3IgaW4gY29tbWl0cyAxNGEwMjZkZDU4IGFuZCAwZjI1
ZDg2NWEsCnRoaXMgZmlsZSBpcyBub3cgb25seSBhYm91dCB0aGUgaTQ0MEZYIGNoaXBzZXQuCgpT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+
Ci0tLQogaHcvcGNpLWhvc3QvaTQ0MGZ4LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9pNDQwZngu
YyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCmluZGV4IGYyNzEzMTEwMmQuLjNmYzk0NDI2ZWEgMTAw
NjQ0Ci0tLSBhL2h3L3BjaS1ob3N0L2k0NDBmeC5jCisrKyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5j
CkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqIFFFTVUgaTQ0MEZYL1BJSVgzIFBDSSBCcmlkZ2UgRW11
bGF0aW9uCisgKiBRRU1VIGk0NDBGWCBQQ0kgQnJpZGdlIEVtdWxhdGlvbgogICoKICAqIENvcHly
aWdodCAoYykgMjAwNiBGYWJyaWNlIEJlbGxhcmQKICAqCi0tIAoyLjIxLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
