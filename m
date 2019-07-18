Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A06D016
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7cy-0007kO-6g; Thu, 18 Jul 2019 14:43:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EMYL=VP=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ho7cw-0007kJ-OU
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:43:22 +0000
X-Inumbo-ID: 63de6223-a96a-11e9-8980-bc764e045a96
Received: from mail-io1-f68.google.com (unknown [209.85.166.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 63de6223-a96a-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 14:43:22 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so51861988ioo.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 07:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4h6hORWfsY6uu4me1CjMW8Zu+wBYhPWvFpHkD7dVcv8=;
 b=lHtnroL3L7r14QhUnYUgvCGwLgZGSxpnKBJseClRnp0kJtNp5zP9HO2Fovjqy55ztd
 97rp1MVyKZBPnY2x+glux2ScyrXPqvWzn0Y090PSOXVQC4nFzCWHIobxvdQTzO9DvSfZ
 1DgQEjSWy7DUnAFzT7GhmBvO+I6c8+eC2+dMknw1MW1BscR07T7qHLBCJgB5UO2Y5GJF
 SPkP8Kl4dTGWmddguxGDrYSlqe18YMRFYG2QYWHKovbXLCBZcnRGQqZSFoOg701x/+Hj
 mvFZoiofFhMECu7Wabp/7/BoY/CwKEJaLgzWyauU4RZBY/stpVFRHc3EqXlUqG6hdfdN
 AE9A==
X-Gm-Message-State: APjAAAVIZrloL8zRVpJ+XDY44sbszDpayHuAVimJB5o5eXUZ8yTsXwih
 c31EhtmkjTHbEuiQkTvfkPXHnEOy
X-Google-Smtp-Source: APXvYqyHU4lY78koz1iZ8w/9BtHUhm8HmrjcaCIdXn7UZfapfTSaqdJGwsMDm3zPcYYVAgfps+VUpw==
X-Received: by 2002:a6b:1ca:: with SMTP id 193mr45224979iob.264.1563461001288; 
 Thu, 18 Jul 2019 07:43:21 -0700 (PDT)
Received: from l1.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id t5sm23119176iol.55.2019.07.18.07.43.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 07:43:20 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 18 Jul 2019 08:43:17 -0600
Message-Id: <20190718144317.23307-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [RFC] xen: Add .astylerc for automated style-formatting
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgYXN0eWxlIChodHRwOi8vYXN0eWxlLnNvdXJjZWZvcmdlLm5ldCkgY2FuIGdyZWF0bHkg
cmVkdWNlIHRoZSBvdmVyaGVhZCBvZgptYW51YWxseSBjaGVja2luZyBhbmQgYXBwbHlpbmcgc3R5
bGUtZml4ZXMgdG8gc291cmNlLWNvZGUuIFRoZSBpbmNsdWRlZAouYXN0eWxlcmMgaXMgdGhlIGNs
b3Nlc3QgYXBwcm94aW1hdGlvbiBvZiB0aGUgZXN0YWJsaXNoZWQgWGVuIHN0eWxlIChpbmNsdWRp
bmcKc3R5bGVzIG5vdCBmb3JtYWxseSBzcGVsbGVkIG91dCBieSBDT0RJTkdfU1RZTEUgYnV0IGNv
bW1vbmx5IHJlcXVlc3RlZCkuCgpDaGVja2luZyB0aGUgY29tbWVudCBzdHlsZXMgYXJlIG5vdCBp
bmNsdWRlZCBpbiB0aGUgYXV0b21hdGlvbi4KCkluY29ycG9yYXRpbmcgWGVuJ3MgZXhjZXB0aW9u
IHRvIHRoZSBkby13aGlsZSBzdHlsZSBpcyBvbmx5IHBhcnRpYWxseSBwb3NzaWJsZSwKdGh1cyBh
IGNoYW5nZSBpcyBwcm9wb3NlZCB0byB0aGUgQ09ESU5HX1NUWUxFIG9mIG1vdmluZyB0aGUgYnJh
Y2UgZnJvbSAiZG8geyIKdG8gdGhlIG5leHQgbGluZS4KCk1vc3Qgb2YgWGVuJ3MgY29kZS1iYXNl
IGlzIG5vbi1jb25mb3JtaW5nIGF0IHRoZSBtb21lbnQ6IDI4OSBmaWxlcyBwYXNzCnVuY2hhbmdl
ZCwgODc2IGhhdmUgc29tZSBzdHlsZSBpc3N1ZXMuCgpJZGVhbGx5IHdlIGNhbiBzbG93bHkgbWln
cmF0ZSB0aGUgZW50aXJlIGNvZGUtYmFzZSB0byBiZSBjb25mb3JtaW5nLCB0aHVzCmVsaW1pbmF0
aW5nIHRoZSBuZWVkIG9mIGRpc2N1c3NpbmcgYW5kIGVuZm9yY2luZyBzdHlsZSBpc3N1ZXMgbWFu
dWFsbHkgb24gdGhlCm1haWxpbmdsaXN0LgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVs
IDx0YW1hc0B0a2xlbmd5ZWwuY29tPgotLS0KIC5hc3R5bGVyYyAgICB8IDE0ICsrKysrKysrKysr
KysrCiBDT0RJTkdfU1RZTEUgfCAxOCArKysrKysrKysrKysrKystLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCAu
YXN0eWxlcmMKCmRpZmYgLS1naXQgYS8uYXN0eWxlcmMgYi8uYXN0eWxlcmMKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYmJkMWQ1NWRkZAotLS0gL2Rldi9udWxsCisrKyBi
Ly5hc3R5bGVyYwpAQCAtMCwwICsxLDE0IEBACitzdHlsZT1ic2QKK3N1ZmZpeD1ub25lCithbGln
bi1wb2ludGVyPW5hbWUKK2FsaWduLXJlZmVyZW5jZT1uYW1lCitpbmRlbnQ9c3BhY2VzPTQKK21h
eC1jb2RlLWxlbmd0aD04MAorbWluLWNvbmRpdGlvbmFsLWluZGVudD0wCithdHRhY2gtY2xvc2lu
Zy13aGlsZQorcmVtb3ZlLWJyYWNlcworaW5kZW50LXN3aXRjaGVzCiticmVhay1vbmUtbGluZS1o
ZWFkZXJzCitrZWVwLW9uZS1saW5lLWJsb2NrcworcGFkLWNvbW1hCitwYWQtaGVhZGVyCmRpZmYg
LS1naXQgYS9DT0RJTkdfU1RZTEUgYi9DT0RJTkdfU1RZTEUKaW5kZXggNmNjNWI3NzRjZi4uMGIz
N2Y3YWU0ZCAxMDA2NDQKLS0tIGEvQ09ESU5HX1NUWUxFCisrKyBiL0NPRElOR19TVFlMRQpAQCAt
NjAsOCArNjAsOCBAQCBCcmFjaW5nCiAtLS0tLS0tCiAKIEJyYWNlcyAoJ3snIGFuZCAnfScpIGFy
ZSB1c3VhbGx5IHBsYWNlZCBvbiBhIGxpbmUgb2YgdGhlaXIgb3duLCBleGNlcHQKLWZvciB0aGUg
ZG8vd2hpbGUgbG9vcC4gIFRoaXMgaXMgdW5saWtlIHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUgYW5k
Ci11bmxpa2UgSyZSLiAgZG8vd2hpbGUgbG9vcHMgYXJlIGFuIGV4Y2VwdGlvbi4gZS5nLjoKK2Zv
ciB0aGUgd2hpbGUtcGFydCBvZiBkby93aGlsZSBsb29wcy4gIFRoaXMgaXMgdW5saWtlIHRoZSBM
aW51eCBjb2Rpbmcgc3R5bGUKK2FuZCB1bmxpa2UgSyZSLiAgZG8vd2hpbGUgbG9vcHMgYXJlIGFu
IGV4Y2VwdGlvbi4gZS5nLjoKIAogaWYgKCBjb25kaXRpb24gKQogewpAQCAtNzcsNyArNzcsOCBA
QCB3aGlsZSAoIGNvbmRpdGlvbiApCiAgICAgLyogRG8gc3R1ZmYuICovCiB9CiAKLWRvIHsKK2Rv
Cit7CiAgICAgLyogRG8gc3R1ZmYuICovCiB9IHdoaWxlICggY29uZGl0aW9uICk7CiAKQEAgLTEy
MCwzICsxMjEsMTQgQEAgdGhlIGVuZCBvZiBmaWxlcy4gIEl0IHNob3VsZCBiZToKICAqIGluZGVu
dC10YWJzLW1vZGU6IG5pbAogICogRW5kOgogICovCisKK0F1dG9tYXRlZCBzdHlsZSBmb3JtYXR0
aW5nIHVzaW5nIGFzdHlsZQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisKK1RoZSAuYXN0eWxlcmMgaW5jbHVkZWQgaW4gdGhlIFhlbiB0cmVlIGluY29ycG9yYXRlcyBt
b3N0IG9mIFhlbidzCitzdHlsZSByZXF1aXJlbWVudHMsIGV4Y2VwdCB0aGUgZm9ybWF0dGluZyBv
ZiBjb21tZW50cy4KKworVGhlIHN0ZXBzIHRvIGF1dG9tYXRpY2FsbHkgZm9ybWF0IGEgZmlsZSBh
cmU6CisKK2V4cG9ydCBBUlRJU1RJQ19TVFlMRV9PUFRJT05TPSIuYXN0eWxlcmMiCithc3R5bGUg
PHNvdXJjZSBvciBoZWFkZXIgZmlsZT4KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
