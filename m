Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE286031
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:41:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfp8-0002Bc-Gf; Thu, 08 Aug 2019 10:39:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tgVu=WE=suse.cz=jslaby@srs-us1.protection.inumbo.net>)
 id 1hvfp7-0002BH-EU
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:39:09 +0000
X-Inumbo-ID: bf35fb38-b9c8-11e9-9193-03792ae17bb7
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf35fb38-b9c8-11e9-9193-03792ae17bb7;
 Thu, 08 Aug 2019 10:39:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27BB1B05E;
 Thu,  8 Aug 2019 10:39:06 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: bp@alien8.de
Date: Thu,  8 Aug 2019 12:38:40 +0200
Message-Id: <20190808103854.6192-15-jslaby@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808103854.6192-1-jslaby@suse.cz>
References: <20190808103854.6192-1-jslaby@suse.cz>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 14/28] xen/pvh: annotate data appropriatelly
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
eUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29A
cmVkaGF0LmNvbT4KQ2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiB4ODZA
a2VybmVsLm9yZwpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCi0tLQogYXJjaC94
ODYvcGxhdGZvcm0vcHZoL2hlYWQuUyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L3BsYXRmb3JtL3B2aC9oZWFkLlMgYi9hcmNoL3g4Ni9wbGF0Zm9ybS9wdmgvaGVhZC5TCmluZGV4
IDFmODgyNWJiYWZmYi4uNGU2MzQ4MGJiMjIzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9wbGF0Zm9y
bS9wdmgvaGVhZC5TCisrKyBiL2FyY2gveDg2L3BsYXRmb3JtL3B2aC9oZWFkLlMKQEAgLTE1MCwx
MSArMTUwLDEyIEBAIEVORChwdmhfc3RhcnRfeGVuKQogCiAJLnNlY3Rpb24gIi5pbml0LmRhdGEi
LCJhdyIKIAkuYmFsaWduIDgKLWdkdDoKK1NZTV9EQVRBX1NUQVJUX0xPQ0FMKGdkdCkKIAkud29y
ZCBnZHRfZW5kIC0gZ2R0X3N0YXJ0CiAJLmxvbmcgX3BhKGdkdF9zdGFydCkKIAkud29yZCAwCi1n
ZHRfc3RhcnQ6CitTWU1fREFUQV9FTkQoZ2R0KQorU1lNX0RBVEFfU1RBUlRfTE9DQUwoZ2R0X3N0
YXJ0KQogCS5xdWFkIDB4MDAwMDAwMDAwMDAwMDAwMCAgICAgICAgICAgIC8qIE5VTEwgZGVzY3Jp
cHRvciAqLwogI2lmZGVmIENPTkZJR19YODZfNjQKIAkucXVhZCBHRFRfRU5UUlkoMHhhMDlhLCAw
LCAweGZmZmZmKSAvKiBQVkhfQ1NfU0VMICovCkBAIC0xNjMsMTUgKzE2NCwxNCBAQCBnZHRfc3Rh
cnQ6CiAjZW5kaWYKIAkucXVhZCBHRFRfRU5UUlkoMHhjMDkyLCAwLCAweGZmZmZmKSAvKiBQVkhf
RFNfU0VMICovCiAJLnF1YWQgR0RUX0VOVFJZKDB4NDA5MCwgMCwgMHgxOCkgICAgLyogUFZIX0NB
TkFSWV9TRUwgKi8KLWdkdF9lbmQ6CitTWU1fREFUQV9FTkRfTEFCRUwoZ2R0X3N0YXJ0LCBTWU1f
TF9MT0NBTCwgZ2R0X2VuZCkKIAogCS5iYWxpZ24gMTYKLWNhbmFyeToKLQkuZmlsbCA0OCwgMSwg
MAorU1lNX0RBVEFfTE9DQUwoY2FuYXJ5LCAuZmlsbCA0OCwgMSwgMCkKIAotZWFybHlfc3RhY2s6
CitTWU1fREFUQV9TVEFSVF9MT0NBTChlYXJseV9zdGFjaykKIAkuZmlsbCBCT09UX1NUQUNLX1NJ
WkUsIDEsIDAKLWVhcmx5X3N0YWNrX2VuZDoKK1NZTV9EQVRBX0VORF9MQUJFTChlYXJseV9zdGFj
aywgU1lNX0xfTE9DQUwsIGVhcmx5X3N0YWNrX2VuZCkKIAogCUVMRk5PVEUoWGVuLCBYRU5fRUxG
Tk9URV9QSFlTMzJfRU5UUlksCiAJICAgICAgICAgICAgIF9BU01fUFRSIChwdmhfc3RhcnRfeGVu
IC0gX19TVEFSVF9LRVJORUxfbWFwKSkKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
