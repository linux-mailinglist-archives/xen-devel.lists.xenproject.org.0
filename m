Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95E3D3F11
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 13:55:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iItS8-0000Ms-Aw; Fri, 11 Oct 2019 11:51:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=inTA=YE=suse.cz=jslaby@srs-us1.protection.inumbo.net>)
 id 1iItS6-0000Mg-Ln
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 11:51:22 +0000
X-Inumbo-ID: 70f3a29d-ec1d-11e9-9336-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70f3a29d-ec1d-11e9-9336-12813bfff9fa;
 Fri, 11 Oct 2019 11:51:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD177B487;
 Fri, 11 Oct 2019 11:51:20 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: bp@alien8.de
Date: Fri, 11 Oct 2019 13:50:54 +0200
Message-Id: <20191011115108.12392-15-jslaby@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011115108.12392-1-jslaby@suse.cz>
References: <20191011115108.12392-1-jslaby@suse.cz>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v9 14/28] xen/pvh: Annotate data appropriately
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
Cc: linux-arch@vger.kernel.org, Juergen Gross <jgross@suse.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com,
 xen-devel@lists.xenproject.org, tglx@linutronix.de,
 Jiri Slaby <jslaby@suse.cz>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIHRoZSBuZXcgU1lNX0RBVEFfU1RBUlRfTE9DQUwsIGFuZCBTWU1fREFUQV9FTkQqIG1hY3Jv
cyB0byBoYXZlOgogIDAwMDAgICAgIDggT0JKRUNUICBMT0NBTCAgREVGQVVMVCAgICA2IGdkdAog
IDAwMDggICAgMzIgT0JKRUNUICBMT0NBTCAgREVGQVVMVCAgICA2IGdkdF9zdGFydAogIDAwMjgg
ICAgIDAgT0JKRUNUICBMT0NBTCAgREVGQVVMVCAgICA2IGdkdF9lbmQKICAwMDI4ICAgMjU2IE9C
SkVDVCAgTE9DQUwgIERFRkFVTFQgICAgNiBlYXJseV9zdGFjawogIDAxMjggICAgIDAgT0JKRUNU
ICBMT0NBTCAgREVGQVVMVCAgICA2IGVhcmx5X3N0YWNrCgpTaWduZWQtb2ZmLWJ5OiBKaXJpIFNs
YWJ5IDxqc2xhYnlAc3VzZS5jej4KUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNr
eUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogQm9y
aXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogIkguIFBl
dGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4KQ2M6IHg4NkBrZXJuZWwub3JnCkNjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0tCiBhcmNoL3g4Ni9wbGF0Zm9ybS9wdmgvaGVhZC5T
IHwgMTQgKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvcGxhdGZvcm0vcHZoL2hlYWQuUyBi
L2FyY2gveDg2L3BsYXRmb3JtL3B2aC9oZWFkLlMKaW5kZXggMWY4ODI1YmJhZmZiLi40ZTYzNDgw
YmIyMjMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3BsYXRmb3JtL3B2aC9oZWFkLlMKKysrIGIvYXJj
aC94ODYvcGxhdGZvcm0vcHZoL2hlYWQuUwpAQCAtMTUwLDExICsxNTAsMTIgQEAgRU5EKHB2aF9z
dGFydF94ZW4pCiAKIAkuc2VjdGlvbiAiLmluaXQuZGF0YSIsImF3IgogCS5iYWxpZ24gOAotZ2R0
OgorU1lNX0RBVEFfU1RBUlRfTE9DQUwoZ2R0KQogCS53b3JkIGdkdF9lbmQgLSBnZHRfc3RhcnQK
IAkubG9uZyBfcGEoZ2R0X3N0YXJ0KQogCS53b3JkIDAKLWdkdF9zdGFydDoKK1NZTV9EQVRBX0VO
RChnZHQpCitTWU1fREFUQV9TVEFSVF9MT0NBTChnZHRfc3RhcnQpCiAJLnF1YWQgMHgwMDAwMDAw
MDAwMDAwMDAwICAgICAgICAgICAgLyogTlVMTCBkZXNjcmlwdG9yICovCiAjaWZkZWYgQ09ORklH
X1g4Nl82NAogCS5xdWFkIEdEVF9FTlRSWSgweGEwOWEsIDAsIDB4ZmZmZmYpIC8qIFBWSF9DU19T
RUwgKi8KQEAgLTE2MywxNSArMTY0LDE0IEBAIGdkdF9zdGFydDoKICNlbmRpZgogCS5xdWFkIEdE
VF9FTlRSWSgweGMwOTIsIDAsIDB4ZmZmZmYpIC8qIFBWSF9EU19TRUwgKi8KIAkucXVhZCBHRFRf
RU5UUlkoMHg0MDkwLCAwLCAweDE4KSAgICAvKiBQVkhfQ0FOQVJZX1NFTCAqLwotZ2R0X2VuZDoK
K1NZTV9EQVRBX0VORF9MQUJFTChnZHRfc3RhcnQsIFNZTV9MX0xPQ0FMLCBnZHRfZW5kKQogCiAJ
LmJhbGlnbiAxNgotY2FuYXJ5OgotCS5maWxsIDQ4LCAxLCAwCitTWU1fREFUQV9MT0NBTChjYW5h
cnksIC5maWxsIDQ4LCAxLCAwKQogCi1lYXJseV9zdGFjazoKK1NZTV9EQVRBX1NUQVJUX0xPQ0FM
KGVhcmx5X3N0YWNrKQogCS5maWxsIEJPT1RfU1RBQ0tfU0laRSwgMSwgMAotZWFybHlfc3RhY2tf
ZW5kOgorU1lNX0RBVEFfRU5EX0xBQkVMKGVhcmx5X3N0YWNrLCBTWU1fTF9MT0NBTCwgZWFybHlf
c3RhY2tfZW5kKQogCiAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX1BIWVMzMl9FTlRSWSwKIAkg
ICAgICAgICAgICAgX0FTTV9QVFIgKHB2aF9zdGFydF94ZW4gLSBfX1NUQVJUX0tFUk5FTF9tYXAp
KQotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
