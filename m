Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C040B122F49
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEAQ-00058m-KV; Tue, 17 Dec 2019 14:49:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7KW0=2H=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihEAP-00058f-SU
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 14:49:41 +0000
X-Inumbo-ID: 6fc4dd14-20dc-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fc4dd14-20dc-11ea-a1e1-bc764e2007e4;
 Tue, 17 Dec 2019 14:49:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p9so3210861wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 06:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ipjjyyVzvM8IU3VtbaBbZ2iD2L01cTMa6ZiBiwm7+Ow=;
 b=TldDBRain6j2huWLlE5XS2rAcQx2b7ZpTHXDTdh4jR2CAF/Nk1sp910lj2TGxlaYFm
 GUqUkEufApguue/LZ2fI8JTUaIlrM2sU9Ma3kJfeuRCa3FELyCjOryxkGo20U0fyI6dY
 oQZ8DJLp/KsAPHVmvijoIivwYu81Wr4NsCsQv7xyMuUUjSoEBhVLoaSOgFERImuQgYl9
 pneng9exBNv/qWf72vEttfDebfGdA6PNL35yf3ur7Pa5kAfun092P09YaZJBN2sGWA2q
 4uO4ybosGTrb+g9e3WHKLNNCL+tJ/f783Pq04cxqeznNn7aSKN3BRBcj+fnz7LeN5y2G
 7MEg==
X-Gm-Message-State: APjAAAUUatSasZHfuUV8BvYqSssRDXCnirpZkBPdb3fJMm3FNBLY69KG
 10eE5XZdtWAlc4IeJnn8GWhwO9C+
X-Google-Smtp-Source: APXvYqzREg2KTAv7uxpnn4EyXJlM3HzBEssRXrhLcIY8PYhqoqJ5nKjr89l2KM4OjnMkqTrqz8fI1A==
X-Received: by 2002:a05:600c:507:: with SMTP id
 i7mr6205924wmc.135.1576594172134; 
 Tue, 17 Dec 2019 06:49:32 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y7sm3487278wmd.1.2019.12.17.06.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:49:31 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 14:49:28 +0000
Message-Id: <20191217144928.3738-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools: bump library version numbers
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
Cc: pdurrant@amazon.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tClBhdWw6IHRoaXMgaXMgYmFz
ZWQgb24gdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgbmV4dCB2ZXJzaW9uIGlzIGdvaW5nIHRvCmJl
IDQuMTQuIExldCBtZSBrbm93IGlmIHlvdSBkZWNpZGUgb3RoZXJ3aXNlLi4uCi0tLQogdG9vbHMv
bGliZnNpbWFnZS9jb21tb24vTWFrZWZpbGUgIHwgMiArLQogdG9vbHMvbGlidmNoYW4vTWFrZWZp
bGUgICAgICAgICAgIHwgMiArLQogdG9vbHMvbGlieGMvTWFrZWZpbGUgICAgICAgICAgICAgIHwg
MiArLQogdG9vbHMvbGlieGwvTWFrZWZpbGUgICAgICAgICAgICAgIHwgNCArKy0tCiB0b29scy94
ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJmc2ltYWdl
L2NvbW1vbi9NYWtlZmlsZSBiL3Rvb2xzL2xpYmZzaW1hZ2UvY29tbW9uL01ha2VmaWxlCmluZGV4
IDc3NTJiNTViY2IuLjhjOGJhMDlmMTIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYmZzaW1hZ2UvY29t
bW9uL01ha2VmaWxlCisrKyBiL3Rvb2xzL2xpYmZzaW1hZ2UvY29tbW9uL01ha2VmaWxlCkBAIC0x
LDcgKzEsNyBAQAogWEVOX1JPT1QgPSAkKENVUkRJUikvLi4vLi4vLi4KIGluY2x1ZGUgJChYRU5f
Uk9PVCkvdG9vbHMvbGliZnNpbWFnZS9SdWxlcy5tawogCi1NQUpPUiA9IDQuMTMKK01BSk9SID0g
NC4xNAogTUlOT1IgPSAwCiAKIExERkxBR1MtJChDT05GSUdfU3VuT1MpID0gLVdsLC1NIC1XbCxt
YXBmaWxlLVN1bk9TCmRpZmYgLS1naXQgYS90b29scy9saWJ2Y2hhbi9NYWtlZmlsZSBiL3Rvb2xz
L2xpYnZjaGFuL01ha2VmaWxlCmluZGV4IGY1ZjM1YmJhOTUuLjc4OTI3NTBjM2UgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnZjaGFuL01ha2VmaWxlCisrKyBiL3Rvb2xzL2xpYnZjaGFuL01ha2VmaWxl
CkBAIC0xNCw3ICsxNCw3IEBAIExJQlZDSEFOX0xJQlMgPSAkKExETElCU19saWJ4ZW5zdG9yZSkg
JChMRExJQlNfbGlieGVuZ250dGFiKSAkKExETElCU19saWJ4ZW5ldnRjCiAkKExJQlZDSEFOX09C
SlMpICQoTElCVkNIQU5fUElDX09CSlMpOiBDRkxBR1MgKz0gJChDRkxBR1NfbGlieGVuc3RvcmUp
ICQoQ0ZMQUdTX2xpYnhlbmdudHRhYikgJChDRkxBR1NfbGlieGVuZXZ0Y2huKQogJChOT0RFX09C
SlMpICQoTk9ERTJfT0JKUyk6IENGTEFHUyArPSAkKENGTEFHU19saWJ4ZW5nbnR0YWIpICQoQ0ZM
QUdTX2xpYnhlbmV2dGNobikKIAotTUFKT1IgPSA0LjEzCitNQUpPUiA9IDQuMTQKIE1JTk9SID0g
MAogCiBDRkxBR1MgKz0gLUkuLi9pbmNsdWRlIC1JLgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMv
TWFrZWZpbGUgYi90b29scy9saWJ4Yy9NYWtlZmlsZQppbmRleCBjYmMzMDAwMWY2Li5lMzUzODkz
NzRkIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy9NYWtlZmlsZQorKysgYi90b29scy9saWJ4Yy9N
YWtlZmlsZQpAQCAtMSw3ICsxLDcgQEAKIFhFTl9ST09UID0gJChDVVJESVIpLy4uLy4uCiBpbmNs
dWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1bGVzLm1rCiAKLU1BSk9SICAgID0gNC4xMworTUFKT1Ig
ICAgPSA0LjE0CiBNSU5PUiAgICA9IDAKIAogaWZlcSAoJChDT05GSUdfTElCWENfTUlOSU9TKSx5
KQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvTWFrZWZpbGUgYi90b29scy9saWJ4bC9NYWtlZmls
ZQppbmRleCA0NTg3YTZmYzljLi5lZDQxZTRlZTNlIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9N
YWtlZmlsZQorKysgYi90b29scy9saWJ4bC9NYWtlZmlsZQpAQCAtNSwxMCArNSwxMCBAQAogWEVO
X1JPT1QgPSAkKENVUkRJUikvLi4vLi4KIGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvUnVsZXMu
bWsKIAotTUFKT1IgPSA0LjEzCitNQUpPUiA9IDQuMTQKIE1JTk9SID0gMAogCi1YTFVNQUpPUiA9
IDQuMTMKK1hMVU1BSk9SID0gNC4xNAogWExVTUlOT1IgPSAwCiAKIENGTEFHUyArPSAtV2Vycm9y
IC1Xbm8tZm9ybWF0LXplcm8tbGVuZ3RoIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgXApkaWZmIC0t
Z2l0IGEvdG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlIGIvdG9vbHMveGVuc3RhdC9s
aWJ4ZW5zdGF0L01ha2VmaWxlCmluZGV4IGVhMTE1YWUwZTYuLjAzY2IyMTJlM2IgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZQorKysgYi90b29scy94ZW5zdGF0
L2xpYnhlbnN0YXQvTWFrZWZpbGUKQEAgLTE4LDcgKzE4LDcgQEAgaW5jbHVkZSAkKFhFTl9ST09U
KS90b29scy9SdWxlcy5tawogTERDT05GSUc9bGRjb25maWcKIE1BS0VfTElOSz1sbiAtc2YKIAot
TUFKT1I9NC4xMworTUFKT1I9NC4xNAogTUlOT1I9MAogCiBMSUI9c3JjL2xpYnhlbnN0YXQuYQot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
