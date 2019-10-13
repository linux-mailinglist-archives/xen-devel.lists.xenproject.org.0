Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B0DD5A5A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 06:25:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJrqs-0000EI-9p; Mon, 14 Oct 2019 04:20:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pF02=YG=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1iJh9S-00037h-H3
 for xen-devel@lists.xenproject.org; Sun, 13 Oct 2019 16:55:26 +0000
X-Inumbo-ID: 40097312-edda-11e9-bbab-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40097312-edda-11e9-bbab-bc764e2007e4;
 Sun, 13 Oct 2019 16:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E3AF616CF;
 Sun, 13 Oct 2019 18:55:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTG0tUttYsqd; Sun, 13 Oct 2019 18:55:22 +0200 (CEST)
Received: from function (lfbn-bor-1-306-163.w109-215.abo.wanadoo.fr
 [109.215.28.163])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 59F9516A8;
 Sun, 13 Oct 2019 18:55:22 +0200 (CEST)
Received: from samy by function with local (Exim 4.92.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iJh9N-0005QT-7S; Sun, 13 Oct 2019 18:55:21 +0200
Date: Sun, 13 Oct 2019 18:55:21 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20191013165521.ktfmn3rcipexwaiw@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
References: <20191002170543.26571-1-olaf@aepfle.de>
 <20191002170543.26571-2-olaf@aepfle.de>
 <20191013162039.hsylxvashc4rbo67@function>
 <20191013162127.2pdc6ho4oer5pnpr@function>
 <20191013185032.49807077.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191013185032.49807077.olaf@aepfle.de>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Mailman-Approved-At: Mon, 14 Oct 2019 04:20:56 +0000
Subject: Re: [Xen-devel] [PATCH v2 1/8] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xhZiBIZXJpbmcsIGxlIGRpbS4gMTMgb2N0LiAyMDE5IDE4OjUwOjMyICswMjAwLCBhIGVjcml0
Ogo+IEFtIFN1biwgMTMgT2N0IDIwMTkgMTg6MjE6MjcgKzAyMDAKPiBzY2hyaWViIFNhbXVlbCBU
aGliYXVsdCA8c2FtdWVsLnRoaWJhdWx0QGVucy1seW9uLm9yZz46Cj4gCj4gPiA+ID4gY2tlZC1i
eTogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+ICAKPiA+IAo+ID4gTm90
ZSB0aGF0IHlvdSBtaXNzIGFuICdBJyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBsaW5lIHRoZXJl
Lgo+IAo+IFRoYW5rcyBmb3Igc3BvdHRpbmcuCj4gCj4gU2hvdWxkIEkgcmVzZW5kIHRoaXMgcGF0
Y2g/CgpXaXRoIHRoZSBmaXhlZCBBY2tlZC1ieSBhbmQgbXkgUmV2aWV3ZWQtYnksIHllcy4KClNh
bXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
