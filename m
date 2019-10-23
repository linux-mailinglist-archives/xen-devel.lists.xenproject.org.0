Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00DE1508
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 11:01:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNCSU-0004yD-Gs; Wed, 23 Oct 2019 08:57:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VtJ9=YQ=gmail.com=k.kahurani@srs-us1.protection.inumbo.net>)
 id 1iNCKS-0003l1-Dn
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 08:49:16 +0000
X-Inumbo-ID: fe16062e-f571-11e9-a531-bc764e2007e4
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe16062e-f571-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 08:49:15 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id y24so5803727plr.12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=E0f+iIqW/Lp/j5gtsswd7voCLl28QFfP2lF7t35CJY0=;
 b=gb0wUqkC1qt9KctrQZ8h1FjlSFcJCtkhWIbnpm1oUPf0M4sNbt2DGlmremBJssUAtA
 uNXC3J5qrnxMlEVRyGcUKAr3Ii7d+vDnFK6GI7hCj5z1R9K9ULNKcbVNvEpRzdGNbEz1
 rW2X1H6l1B/x5FPdNm1WUVR/ONgCajBNWF19vHq0LP825X910jDEYK3ExVA5uTOWH12I
 jmnNDrrmvS63thFyYKboTycxKwzPsMZfI7XW0RgweSdk2kQtBkoSQBPP5q7vXGtEycj0
 WADapPBsWbBslAc/ivlFJpcAz5LeJ79eUxFY2LBIhllBvP083g6mOrx3DoW6AqR+SJ0T
 rW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=E0f+iIqW/Lp/j5gtsswd7voCLl28QFfP2lF7t35CJY0=;
 b=uFoqmhSaeUpz+1nqiI2/vibGnJQjMX6aPXIcDyXTN4Fs4WYdyOqy27/56j5EgCv3kZ
 yATQcOekC6vA/oZUZlUdt9WA7MYoVYJQ3MGrsTFz33nFbXrFRallJnVRofa5YGyNfDcf
 OgYRLspFE5WnHgLEch1nzVBIwiaG/Q+gRPZpYutPx64InsALDFrqshQh3aE0UP/uaovv
 DA1XHu8fY9mxizRjSb8P4RDCqykt7Cb/t2TWz3LIxEjkdvx0iVOj9bLAIndwfXwIKsGQ
 Q6ifqo0hHCCwWjQUAyA8SAljBpRGjV2cY1MiaMHkezahdJ+KapCg1V4kFVRKlI4gbVOV
 aU2A==
X-Gm-Message-State: APjAAAWzctOZqn5EQ828hhKvMEmw3fvASHjwk8yELbA4jhVpjyXB5DA8
 2a3tE7gsvMmCVqg22wA/GWkQnyF64YKBtw==
X-Google-Smtp-Source: APXvYqyrAvJ5KQad+UmyRtp+wtb/xWS5teXFkjXON9U2RfswC2xE0335UGICJ/whb2verfIOwKMwyA==
X-Received: by 2002:a17:902:be13:: with SMTP id
 r19mr8301433pls.306.1571820554857; 
 Wed, 23 Oct 2019 01:49:14 -0700 (PDT)
Received: from localhost.localdomain ([197.156.190.218])
 by smtp.gmail.com with ESMTPSA id f14sm27651008pfq.187.2019.10.23.01.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 01:49:14 -0700 (PDT)
From: "K. Kahurani" <k.kahurani@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 23 Oct 2019 11:48:40 +0300
Message-Id: <20191023084841.30903-1-k.kahurani@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:57:33 +0000
Subject: [Xen-devel] [PATCH 0/1] tools/configure
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
Cc: "K. Kahurani" <k.kahurani@gmail.com>, admin@rapidseedbox.com,
 jbeulic@suse.com, ian.jackson@eu.citrix.com, jfehlig@suse.com,
 eblake@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBmaXhlcyBvciB0cmllcyB0byBmaXggYW4gaXNzdWUgaW4gdGhlIGNvbmZpZ3Vy
ZSBzY3JpcHRzIHdoZXJlYnkgdGhlIHNjcmlwdCB3aWxsIGNob2tlIG9uIHN5c3RlbXMgdGhhdCBk
byBub3QgaGF2ZSBhIGRlZmF1bHQgcHl0aG9uIGV4ZWN1dGFibGUgYW5kIHN1YnNlcXVlbnRseSBn
aXZlIGEgZ2FyYmFnZSBlcnJvciBtZXNzYWdlLgoKTm93IHRoYXQgUHl0aG9uIDIgaXMgYmVpbmcg
cGhhc2VkIG91dCwgaXQgc2hvdWxkIGJlIGV4cGVjdGVkIHRoYXQgc29tZSBzeXN0ZW1zLCBhdCB0
aGUgdmVyeSBsZWFzdCBkbyBoYXZlIGEgZGVmYXVsdCBQeXRob24gZXhlY3V0YWJsZS4KCksuIEth
aHVyYW5pICgxKToKICB0b29scy9jb25maWd1cmU6IHJlbW92ZSByZWR1bmRhbmN5CgogdG9vbHMv
Y29uZmlndXJlIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVs
ZXRpb25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
