Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C9011E813
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:21:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifneY-0008Sc-Or; Fri, 13 Dec 2019 16:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifneX-0008S8-BU
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:18:53 +0000
X-Inumbo-ID: 3d339cfc-1dc4-11ea-88e7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3d339cfc-1dc4-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVWQa/Zo1x2m8LGgxk7TW+9fJim2zfZM8M5wdoCqM3g=;
 b=DzbLDecS98DTMSni0Va706qkqnXVDTEt0fyNdxJdUUTZw0e1XAyipwdI9DdldG6w/dQt92
 3N4YsxIh4RTL8oaLlYfhDUAxrsQEr4RAVVUczuMVwF39UFy97memvn7/4e7QdYPPaz9akM
 srPp26IV5SSylzKBru/+xLKmQ9+xZdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-eDjHLZxKONO5C1zmGmqY7Q-1; Fri, 13 Dec 2019 11:18:45 -0500
X-MC-Unique: eDjHLZxKONO5C1zmGmqY7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBEE2800D41;
 Fri, 13 Dec 2019 16:18:42 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57CD819C4F;
 Fri, 13 Dec 2019 16:18:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:44 +0100
Message-Id: <20191213161753.8051-4-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 03/12] hw/i386/pc: Remove obsolete
 pc_pci_device_init() declaration
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

SW4gY29tbWl0IDE0NTQ1MDk3MjYgd2UgcmVtb3ZlZCB0aGUgcGNfcGNpX2RldmljZV9pbml0KCkK
ZGVwcmVjYXRlZCBmdW5jdGlvbiBhbmQgaXRzIGNhbGxzLCBidXQgd2UgZm9yZ290IHRvIHJlbW92
ZQppdHMgcHJvdG90eXBlLiBEbyB0aGF0IG5vdy4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2h3L2kzODYvcGMu
aCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2h3L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCmluZGV4IDk4NjZkZmJkNjAu
LmJjN2Q4NTVhYWEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCisrKyBiL2luY2x1
ZGUvaHcvaTM4Ni9wYy5oCkBAIC0yMTEsNyArMjExLDYgQEAgdm9pZCBwY19jbW9zX2luaXQoUENN
YWNoaW5lU3RhdGUgKnBjbXMsCiAgICAgICAgICAgICAgICAgICBCdXNTdGF0ZSAqaWRlMCwgQnVz
U3RhdGUgKmlkZTEsCiAgICAgICAgICAgICAgICAgICBJU0FEZXZpY2UgKnMpOwogdm9pZCBwY19u
aWNfaW5pdChQQ01hY2hpbmVDbGFzcyAqcGNtYywgSVNBQnVzICppc2FfYnVzLCBQQ0lCdXMgKnBj
aV9idXMpOwotdm9pZCBwY19wY2lfZGV2aWNlX2luaXQoUENJQnVzICpwY2lfYnVzKTsKIAogdHlw
ZWRlZiB2b2lkICgqY3B1X3NldF9zbW1fdCkoaW50IHNtbSwgdm9pZCAqYXJnKTsKIAotLSAKMi4y
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
