Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB12180277
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:52:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBh90-0003I1-Fj; Tue, 10 Mar 2020 15:50:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBh8y-0003Hi-Lt
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:50:08 +0000
X-Inumbo-ID: d04901dc-62e6-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d04901dc-62e6-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 15:50:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A94BAC42;
 Tue, 10 Mar 2020 15:50:06 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Message-ID: <98084047-8079-1129-8c49-19d8405d9948@suse.com>
Date: Tue, 10 Mar 2020 16:50:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 5/9] x86/HVM: reduce vioapic.h include
 dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCBhbiAjaW5jbHVkZSBub3QgbmVlZGVkIGJ5IHRoZSBoZWFkZXIgaXRzZWxmLiBXaGlsZSB2
ZXJpZnlpbmcgdGhlCmhlYWRlciAobm93KSBidWlsZHMgc3RhbmRhbG9uZSwgSSBub3RpY2VkIGFu
IG9taXNzaW9uIGluIGEgcHVibGljIGhlYWRlcgp3aGljaCBnZXRzIHRha2VuIGNhcmUgb2YgaGVy
ZSBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlvYXBpYy5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3Zpb2FwaWMuaApAQCAtMjUsNyArMjUsNiBAQAogI2RlZmluZSBfX0FT
TV9YODZfSFZNX1ZJT0FQSUNfSF9fCiAKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KLSNpbmNsdWRl
IDx4ZW4vc21wLmg+CiAjaW5jbHVkZSA8cHVibGljL2h2bS9zYXZlLmg+CiAKICNkZWZpbmUgVklP
QVBJQ19WRVJTSU9OX0lEIDB4MTEgLyogSU9BUElDIHZlcnNpb24gKi8KLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2FyY2gteDg2L2h2bS9zYXZlLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2Fy
Y2gteDg2L2h2bS9zYXZlLmgKQEAgLTI2LDYgKzI2LDggQEAKICNpZm5kZWYgX19YRU5fUFVCTElD
X0hWTV9TQVZFX1g4Nl9IX18KICNkZWZpbmUgX19YRU5fUFVCTElDX0hWTV9TQVZFX1g4Nl9IX18K
IAorI2luY2x1ZGUgIi4uLy4uL3hlbi5oIgorCiAvKgogICogU2F2ZS9yZXN0b3JlIGhlYWRlcjog
Z2VuZXJhbCBpbmZvIGFib3V0IHRoZSBzYXZlIGZpbGUuCiAgKi8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
