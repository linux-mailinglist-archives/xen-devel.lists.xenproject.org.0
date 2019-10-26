Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B70E5E66
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQOK-00056x-39; Sat, 26 Oct 2019 18:02:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQOI-00056s-QV
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:02:18 +0000
X-Inumbo-ID: bdf65750-f81a-11e9-beca-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bdf65750-f81a-11e9-beca-bc764e2007e4;
 Sat, 26 Oct 2019 18:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572112934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dp/nKQVZFywaOMixL/+A3VBgd7NuzQl0q2mvB/663P0=;
 b=E9BV1O20O3NPRNR+cuCWvbbzxK0fJf+p8cTr9FJvT2i8gx8n2hPEfiQL/65UTPAqInrn+Y
 b+naFwMJmh90/IzWa6Wl7idW1vgUbH1Ej6uRO1fMpYKLCgLBe1hidKE9SOCHlxOeJ14ngK
 tnc4KsPuF58+yFO+I8Yu5xP6eeG7UMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-y_q8K36rNAuymAgbbQa5iw-1; Sat, 26 Oct 2019 14:02:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 399F5801E72;
 Sat, 26 Oct 2019 18:02:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA43A60C57;
 Sat, 26 Oct 2019 18:01:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:24 +0200
Message-Id: <20191026180143.7369-2-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: y_q8K36rNAuymAgbbQa5iw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 01/20] MAINTAINERS: Keep PIIX4 South Bridge
 separate from PC Chipsets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org,
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBQSUlY
NCBTb3V0aGJyaWRnZSBpcyBub3QgdXNlZCBieSB0aGUgUEMgbWFjaGluZSwKYnV0IGJ5IHRoZSBN
YWx0YSBib2FyZCAoTUlQUykuIEFkZCBhIG5ldyBzZWN0aW9uIHRvCmtlZXAgaXQgY292ZXJlZC4K
ClN1Z2dlc3RlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClJldmll
d2VkLWJ5OiBMaSBRaWFuZyA8bGlxM2VhQDE2My5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCA3ICsr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDQyZTcwMmYzNDYuLjFm
MDQ1MDJmYWMgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0x
MjMwLDcgKzEyMzAsNiBAQCBGOiBody9wY2ktaG9zdC9xMzUuYwogRjogaHcvcGNpLWhvc3QvcGFt
LmMKIEY6IGluY2x1ZGUvaHcvcGNpLWhvc3QvcTM1LmgKIEY6IGluY2x1ZGUvaHcvcGNpLWhvc3Qv
cGFtLmgKLUY6IGh3L2lzYS9waWl4NC5jCiBGOiBody9pc2EvbHBjX2ljaDkuYwogRjogaHcvaTJj
L3NtYnVzX2ljaDkuYwogRjogaHcvYWNwaS9waWl4NC5jCkBAIC0xNzMwLDYgKzE3MjksMTIgQEAg
RjogaHcvZGlzcGxheS9lZGlkKgogRjogaW5jbHVkZS9ody9kaXNwbGF5L2VkaWQuaAogRjogcWVt
dS1lZGlkLmMKIAorUElJWDQgU291dGggQnJpZGdlIChpODIzNzFBQikKK006IEhlcnbDqSBQb3Vz
c2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KK006IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxmNGJ1Z0BhbXNhdC5vcmc+CitTOiBNYWludGFpbmVkCitGOiBody9pc2EvcGlpeDQuYworCiBG
aXJtd2FyZSBjb25maWd1cmF0aW9uIChmd19jZmcpCiBNOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+CiBSOiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29t
PgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
