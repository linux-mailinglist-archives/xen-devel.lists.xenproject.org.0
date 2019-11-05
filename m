Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15848F0473
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 18:53:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS2yV-0004Cf-20; Tue, 05 Nov 2019 17:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS2yT-0004CF-5O
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 17:50:37 +0000
X-Inumbo-ID: c44dbe37-fff4-11e9-a19f-12813bfff9fa
Received: from mout.kundenserver.de (unknown [217.72.192.73])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c44dbe37-fff4-11e9-a19f-12813bfff9fa;
 Tue, 05 Nov 2019 17:50:35 +0000 (UTC)
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MdeOl-1hsREj3xdx-00Zj7B; Tue, 05 Nov 2019 18:50:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue,  5 Nov 2019 18:50:07 +0100
Message-Id: <20191105175010.2591-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:bVlXh+qfacMYAJz0JYhOyV/CyLXAoaePIt05Vn/XxD8LtGnM1tr
 GXXn06EiHaloQjwhDdOWzFLEfaOUmFNry8lZMGSIvXXQY/AvH/MOpXkIPZTpoD8ZWKbZoPT
 AlrpUTkZ2yTxn/w8RnJof5KISGUZwN8ctqeco5tBWFnYqxWmaut/OixibWFpfqCzugpOgUN
 AYjerAX25MByQ9tiRIp9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FDAFY9f0SXI=:JhUvsvMKENvKfD/dRw9zBJ
 ttvXeWgWtQ0G3bGac4B0To/qcFALz5sKpcxEWnHS29A6okPGDzapmAd/IShQY40J0eMEICMdY
 Hhzf9Hv/Ar5WdBr4nPDRIaV4oXFzDj11D1kGeinxlLF8ATqRqqqj74PKDOkRlbxpWtHB/ZkT9
 h0l6BM+7TbeMhlPykRA9n7cBN85XmNhUbItIeBUQ1dBxKHb3PXojjC/5Nd52kLo3cuiDG+qwW
 i0yUuL0LyLSmCVL1Phv2oJWmDkJmYpOd30QrCrLfBegwku/pYcPkGVmvOlQoDqtCBTPuH2Vdc
 avbzYzExQuGDPlqelThcukrRhp1Lf7nRAJ5I397SctfYy90gJ/+JtN/O6rICOOJFxv4Mw0t/w
 /IYZBfO+J9luFhU349T/KwemXsHRilcrTAi4HuXIZSPY9DRifvYs5MC3XQ3HPhYW+mBNYHSz7
 b12PjhLdPJNuVEX1fvuYCi4H4YTsGEJGrMEfqrcuceKOfKtcORLa2YXltU2buGnPX1TSj2ucy
 JByAjDcbOJWiOpjuMwC4M7q6e6pOvehyJnKnkwno1Kg7d4layedaxjcKRBM7WnF12bGxHRVmW
 1dCHl+goyPjFvWKp85s5wItlIJgeQkPL54xcsKV8kS8cH9i2eZoaoFqzXiy5xgYvi7/4Mir35
 Cd0FJuQPGz6Q0Ec0lmnPkQPoR1+oJr+MMbGx9QNhuDXOzk1W1sXb8XaZrGceyWRfIktYY0mTx
 IKPhbskzE9rR0Rh/mSIF+t6LfpMcmBLSxazfbvNWxQk7F65vUHflTE5Za7e5hoaUV+g2YTSwD
 nyT5Pf5CoiVM0EwhDU/DfgpcBn2lUtSjaRXZyY/LGv71R2E2jhgL/AnOkDtII8BQd5A6X1oS2
 Nm4tEFD373kW4k8ERvB9jzTREmeslEmIZmwsqqXr0=
Subject: [Xen-devel] [PULL v2 0/3] Trivial branch patches
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, Claudio Fontana <claudio.fontana@huawei.com>,
 Cleber Rosa <crosa@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNjYwOWI0ZmEzNmYwYWM5MzQ4NzQz
NzE4NzQ0MTZmNzUzM2E1NDA4OgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL3BhbG1lci90YWdzL3BhbG1lci1mb3ItbWFzdGVyLTQuMi1zZjEnIGludG8gc3RhZ2luZyAo
MjAxOS0xMS0wMiAxNzo1OTowMyArMDAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0OgoKICBnaXQ6Ly9naXRodWIuY29tL3Zpdmllci9xZW11LmdpdCB0YWdzL3RyaXZp
YWwtYnJhbmNoLXB1bGwtcmVxdWVzdAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGUx
ODdlNTVlYzY1MDM5ZWQ2YmQ5ODJkZWJlZTYzMjQ1MGFjZTNiYWU6CgogIGdsb2JhbDogU3F1YXNo
ICd0aGUgdGhlJyAoMjAxOS0xMS0wNSAxODozOToxNCArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVHJpdmlhbCBm
aXhlcyAoMjAxOTExMDUtdjIpCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpEci4gRGF2aWQgQWxhbiBHaWxiZXJ0ICgxKToK
ICBnbG9iYWw6IFNxdWFzaCAndGhlIHRoZScKClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpICgyKToK
ICBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBBdm9pZCBjcmFzaCB3aGVuIHdyaXRpbmcgdG8g
UG5QIHJlZ2lzdGVycwogIGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEZpeCA4LWJpdCBhY2Nl
c3NlcwoKIGRpc2FzL2xpYnZpeGwvdml4bC9pbnZhbHNldC5oICAgICAgIHwgIDIgKy0KIGRvY3Mv
aW50ZXJvcC9wci1oZWxwZXIucnN0ICAgICAgICAgIHwgIDIgKy0KIGRvY3Mvc3BlY3MvcHBjLXNw
YXByLWhvdHBsdWcudHh0ICAgIHwgIDIgKy0KIGRvY3Mvc3BlY3MvcHBjLXhpdmUucnN0ICAgICAg
ICAgICAgIHwgIDIgKy0KIGRvY3Mvc3BlY3MvdHBtLnR4dCAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYyAgICAgICAgIHwgMTIgKysrKysrKysrKysr
CiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vYmxraWYuaCB8ICAyICstCiBzY3JpcHRzL2R1
bXAtZ3Vlc3QtbWVtb3J5LnB5ICAgICAgICB8ICAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKdjI6IHJlbW92ZSBwYXRjaCBmcm9tIEdy
ZWcgdGhhdCBoYXMgbGluZXMgd2l0aCBtb3JlIHRoYW4gODAgY29sdW1ucwoyLjIxLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
