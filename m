Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D44144206
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 17:21:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwEB-0004Gp-FJ; Tue, 21 Jan 2020 16:18:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t1F8=3K=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1itwE9-0004Gi-CS
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 16:18:05 +0000
X-Inumbo-ID: 957de660-3c69-11ea-9fd7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 957de660-3c69-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579623476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a3Ux0PVxC8InXew79I80ST6+H9hTQVTilwJku2Xro48=;
 b=cd2OuRaY9BOn3+TRPPk5s3EZ5uR2of69vYgKhxF2zVI8nHB7nbWcOmSsnpBiaR7qxUYZu6
 6XuFetf9X68jqmF/xHulDyL95RvZCvOgB0vHKtp6B9jPO9lxEs5w8KLyS1+4r+dDMuu0Bz
 pLR4ruayLYArALQ5TfASmWCGQxYLAhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-oGkG9ygMPtaS4BNVSu56XQ-1; Tue, 21 Jan 2020 11:17:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FFCA10883A0;
 Tue, 21 Jan 2020 16:17:52 +0000 (UTC)
Received: from thuth.com (unknown [10.36.118.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ADEC60FC4;
 Tue, 21 Jan 2020 16:17:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Date: Tue, 21 Jan 2020 17:17:47 +0100
Message-Id: <20200121161747.10569-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: oGkG9ygMPtaS4BNVSu56XQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [Qemu-devel] [PATCH] trivial: Remove xenfb_enabled from
 sysemu.h
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
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRlZmluZSBpcyBvbmx5IHVzZWQgaW4gb25lIG90aGVyIHBsYWNlLiBNb3ZlIHRoZSBjb2Rl
IHRoZXJlCmluc3RlYWQgb2Yga2VlcGluZyB0aGlzIHhlbi1zcGVjaWZpYyBkZWZpbmUgaW4gc3lz
ZW11LmguCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KLS0t
CiBody94ZW5wdi94ZW5fbWFjaGluZV9wdi5jIHwgMiArLQogaW5jbHVkZS9zeXNlbXUvc3lzZW11
LmggICB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9ody94ZW5wdi94ZW5fbWFjaGluZV9wdi5jIGIvaHcveGVucHYveGVu
X21hY2hpbmVfcHYuYwppbmRleCAzYThhZjFhMWUwLi44ZGY1NzVhNDU3IDEwMDY0NAotLS0gYS9o
dy94ZW5wdi94ZW5fbWFjaGluZV9wdi5jCisrKyBiL2h3L3hlbnB2L3hlbl9tYWNoaW5lX3B2LmMK
QEAgLTYwLDcgKzYwLDcgQEAgc3RhdGljIHZvaWQgeGVuX2luaXRfcHYoTWFjaGluZVN0YXRlICpt
YWNoaW5lKQogICAgIHhlbl9iZV9yZWdpc3RlcigicW5pYyIsICZ4ZW5fbmV0ZGV2X29wcyk7CiAK
ICAgICAvKiBjb25maWd1cmUgZnJhbWVidWZmZXIgKi8KLSAgICBpZiAoeGVuZmJfZW5hYmxlZCkg
eworICAgIGlmICh2Z2FfaW50ZXJmYWNlX3R5cGUgPT0gVkdBX1hFTkZCKSB7CiAgICAgICAgIHhl
bl9jb25maWdfZGV2X3ZmYigwLCAidm5jIik7CiAgICAgICAgIHhlbl9jb25maWdfZGV2X3ZrYmQo
MCk7CiAgICAgfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zeXNlbXUvc3lzZW11LmggYi9pbmNsdWRl
L3N5c2VtdS9zeXNlbXUuaAppbmRleCA4MGM1N2ZkYzRlLi4yY2NmMjE2MTU4IDEwMDY0NAotLS0g
YS9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaAorKysgYi9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaApA
QCAtMzIsNyArMzIsNiBAQCB0eXBlZGVmIGVudW0gewogfSBWR0FJbnRlcmZhY2VUeXBlOwogCiBl
eHRlcm4gaW50IHZnYV9pbnRlcmZhY2VfdHlwZTsKLSNkZWZpbmUgeGVuZmJfZW5hYmxlZCAodmdh
X2ludGVyZmFjZV90eXBlID09IFZHQV9YRU5GQikKIAogZXh0ZXJuIGludCBncmFwaGljX3dpZHRo
OwogZXh0ZXJuIGludCBncmFwaGljX2hlaWdodDsKLS0gCjIuMTguMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
