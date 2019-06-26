Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24D56B4A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 15:52:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8IP-0006VL-AA; Wed, 26 Jun 2019 13:49:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2nJO=UZ=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1hg8IO-0006VG-BL
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:49:08 +0000
X-Inumbo-ID: 29e8f10d-9819-11e9-8980-bc764e045a96
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29e8f10d-9819-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 13:49:06 +0000 (UTC)
Received: from p5b06daab.dip0.t-ipconnect.de ([91.6.218.171] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hg8Hl-0002Ha-SM; Wed, 26 Jun 2019 15:48:30 +0200
Date: Wed, 26 Jun 2019 15:48:28 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <c77e5df3-77ac-bce2-ccd3-7848f1915b43@suse.com>
Message-ID: <alpine.DEB.2.21.1906261546460.32342@nanos.tec.linutronix.de>
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561377779-28036-5-git-send-email-zhenzhong.duan@oracle.com>
 <c77e5df3-77ac-bce2-ccd3-7848f1915b43@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: Re: [Xen-devel] [PATCH v2 4/7] Revert "xen: Introduce 'xen_nopv' to
 disable PV extensions for HVM guests."
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
Cc: sstabellini@kernel.org, peterz@infradead.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, mingo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNC4wNi4xOSAx
NDowMiwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDhkNjkz
YjkxMWJiOWM1NzAwOWMyNGNiMTc3MmQyMDViODRjNzk4NWMuCj4gPiAKPiA+IEluc3RlYWQgd2Ug
dXNlIGFuIHVuaWZpZWQgcGFyYW1ldGVyICdub3B2JyBmb3IgYWxsIHRoZSBoeXBlcnZpc29yCj4g
PiBwbGF0Zm9ybXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVu
emhvbmcuZHVhbkBvcmFjbGUuY29tPgo+ID4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+Cj4gPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+
IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiA+IENjOiBJbmdvIE1v
bG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPiA+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVu
OC5kZT4KPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiAKPiBSZXZpZXdl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKWW91J3JlIHJlYWxseSBzdXJl
IHRoYXQgeW91IHdhbnQgdG8gYnJlYWsgZXhpc3Rpbmcgc2V0dXBzIHdoaWNoIG1pZ2h0IHVzZQp0
aGF0IGFscmVhZHk/CgpDb21tYW5kIGxpbmUgcGFyYW1ldGVycyBhcmUgQUJJLiBZb3UgY2FuIG1h
cCB4ZW5fbm9wdiB0byB0aGUgbmV3IHNoaW55IG5vcHYKaW1wbGVtZW50YXRpb24gYnV0IHJlbW92
aW5nIGl0PwoKWW91ciBkZWNpc2lvbiwgYnV0IHlvdSd2ZSBiZWVuIHRvbGQgOikKClRoYW5rcywK
Cgl0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
