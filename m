Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C03216C3C9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 15:24:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6b6b-0005gs-Ch; Tue, 25 Feb 2020 14:22:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpqO=4N=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j6b6a-0005gn-BD
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 14:22:36 +0000
X-Inumbo-ID: 44a704ce-57da-11ea-9315-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44a704ce-57da-11ea-9315-12813bfff9fa;
 Tue, 25 Feb 2020 14:22:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j7so2421067wrp.13
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 06:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rwpPrueaG9xhat7nnA500KE9RXM1QCOpqwzG7aHF/Zc=;
 b=e0wFUhZp+6eeg2LDCb5AqYmbEZrgsREY+Zop64Tsnai/YnPu4L2NObBccNUAQ+H0dN
 uhvC3p4fg/WN2f9LektD9spwktuvR8hjbFPi2Zfvz8/MRuznyiyhsYEF943frdcAHXfW
 d/OScIbY46AxIslY0HII48jO7GDnhoGdTIqlib8Tko2l1V64fi150qlt7MJb4vTStPGx
 hkb5fFN0aAuUTo5BZ7I3lHJXzRr/8VStJues3OdPjgVDOvYiH8bgOH3SOJogRikd5mPO
 sd4hRWpw2vERc0GPA+l9elSxLcWQL+vaW3NI3Hzj6kNSiExvoVx69P7n4hNBQYLsgo1g
 qvWA==
X-Gm-Message-State: APjAAAUPwb4KoMbz3PPAP+MksHZE3BMyzRqyHrbJzjGb7XLXcl37p2kS
 5x7jeKAmyTbKNKZ9Pt6eE1rzTjhz
X-Google-Smtp-Source: APXvYqweI7Q8MxVptBcM4I+ttFotW9GmePicZQ18Blt8YIkIb5aK4e/M3thiaI4alx5IZiQxPf+UtA==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr72452980wru.353.1582640554877; 
 Tue, 25 Feb 2020 06:22:34 -0800 (PST)
Received: from localhost.localdomain ([62.60.63.48])
 by smtp.gmail.com with ESMTPSA id z16sm6914110wrp.33.2020.02.25.06.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 06:22:34 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue, 25 Feb 2020 14:22:32 +0000
Message-Id: <20200225142232.7935-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/pvh: drop v2 suffix from pvh.pandoc
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm93IG9ubHkgb25lIHZlcnNpb24gb2YgUFZIIGltcGxlbWVudGF0aW9uIGluIFhl
bi4gRHJvcCAidjIiIHRvCmF2b2lkIGNvbmZ1c2lvbi4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Ci0tLQogZG9jcy9taXNjL3B2aC5wYW5kb2MgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9j
cy9taXNjL3B2aC5wYW5kb2MgYi9kb2NzL21pc2MvcHZoLnBhbmRvYwppbmRleCBjY2YxYzhmZTY5
Li4zZTE4Nzg5ZDM2IDEwMDY0NAotLS0gYS9kb2NzL21pc2MvcHZoLnBhbmRvYworKysgYi9kb2Nz
L21pc2MvcHZoLnBhbmRvYwpAQCAtNjQsNyArNjQsNyBAQCBUaGUgZm9sbG93aW5nIFZDUFUgaHlw
ZXJjYWxscyBjYW4gYmUgdXNlZCBpbiBvcmRlciB0byBicmluZyB1cCBzZWNvbmRhcnkgdkNQVXM6
CiAKICMjIEhhcmR3YXJlIGRlc2NyaXB0aW9uICMjCiAKLVBWSHYyIGd1ZXN0cyB0aGF0IGhhdmUg
YWNjZXNzIHRvIGhhcmR3YXJlIChlaXRoZXIgZW11bGF0ZWQgb3IgcmVhbCkgd2lsbCBhbHNvCitQ
VkggZ3Vlc3RzIHRoYXQgaGF2ZSBhY2Nlc3MgdG8gaGFyZHdhcmUgKGVpdGhlciBlbXVsYXRlZCBv
ciByZWFsKSB3aWxsIGFsc28KIGhhdmUgQUNQSSB0YWJsZXMgd2l0aCB0aGUgZGVzY3JpcHRpb24g
b2YgdGhlIGhhcmR3YXJlIHRoYXQncyBhdmFpbGFibGUgdG8gdGhlCiBndWVzdC4gVGhpcyBhcHBs
aWVzIHRvIGJvdGggcHJpdmlsZWdlZCBhbmQgdW5wcml2aWxlZ2VkIGd1ZXN0cy4gQSBwb2ludGVy
IHRvCiB0aGUgcG9zaXRpb24gb2YgdGhlIFJTRFAgaW4gbWVtb3J5IChpZiBwcmVzZW50KSBjYW4g
YmUgZmV0Y2hlZCBmcm9tIHRoZSBzdGFydApAQCAtNzksNyArNzksNyBAQCBkb25lIGZvciBIVk0g
Z3Vlc3RzLgogCiBJbnRlcnJ1cHRzIGZyb20gcGh5c2ljYWwgZGV2aWNlcyBhcmUgZGVsaXZlcmVk
IHVzaW5nIG5hdGl2ZSBtZXRob2RzLCB0aGlzIGlzCiBkb25lIGluIG9yZGVyIHRvIHRha2UgYWR2
YW50YWdlIG9mIG5ldyBoYXJkd2FyZSBhc3Npc3RlZCB2aXJ0dWFsaXphdGlvbgotZnVuY3Rpb25z
LCBsaWtlIHBvc3RlZCBpbnRlcnJ1cHRzLiBUaGlzIGltcGxpZXMgdGhhdCBQVkh2MiBndWVzdHMg
d2l0aCBwaHlzaWNhbAorZnVuY3Rpb25zLCBsaWtlIHBvc3RlZCBpbnRlcnJ1cHRzLiBUaGlzIGlt
cGxpZXMgdGhhdCBQVkggZ3Vlc3RzIHdpdGggcGh5c2ljYWwKIGRldmljZXMgd2lsbCBhbHNvIGhh
dmUgdGhlIG5lY2Vzc2FyeSBpbnRlcnJ1cHQgY29udHJvbGxlcnMgaW4gb3JkZXIgdG8gbWFuYWdl
CiB0aGUgZGVsaXZlcnkgb2YgaW50ZXJydXB0cyBmcm9tIHRob3NlIGRldmljZXMsIHVzaW5nIHRo
ZSBzYW1lIGludGVyZmFjZXMgdGhhdAogYXJlIGF2YWlsYWJsZSBvbiBuYXRpdmUgaGFyZHdhcmUu
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
