Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A3D5A59
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 06:25:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJrqr-0000E6-Lp; Mon, 14 Oct 2019 04:20:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pF02=YG=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1iJgbs-0000jB-R4
 for xen-devel@lists.xenproject.org; Sun, 13 Oct 2019 16:20:44 +0000
X-Inumbo-ID: 672b7b34-edd5-11e9-bbab-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 672b7b34-edd5-11e9-bbab-bc764e2007e4;
 Sun, 13 Oct 2019 16:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 07B1C173B;
 Sun, 13 Oct 2019 18:20:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NO-b8nDA93vI; Sun, 13 Oct 2019 18:20:40 +0200 (CEST)
Received: from function (lfbn-bor-1-306-163.w109-215.abo.wanadoo.fr
 [109.215.28.163])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 8DD1C16E2;
 Sun, 13 Oct 2019 18:20:40 +0200 (CEST)
Received: from samy by function with local (Exim 4.92.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iJgbn-0002wU-Bz; Sun, 13 Oct 2019 18:20:39 +0200
Date: Sun, 13 Oct 2019 18:20:39 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20191013162039.hsylxvashc4rbo67@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
References: <20191002170543.26571-1-olaf@aepfle.de>
 <20191002170543.26571-2-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002170543.26571-2-olaf@aepfle.de>
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

T2xhZiBIZXJpbmcsIGxlIG1lci4gMDIgb2N0LiAyMDE5IDE5OjA1OjM2ICswMjAwLCBhIGVjcml0
Ogo+IFRoZSBmdW5jdGlvbiByZWFkX3Z0cG1ibGsgdXNlcyBwcmludGYoMyksIGJ1dCBzdGRpby5o
IGlzIG5vdCBpbmNsdWRlZAo+IGluIHRoaXMgZmlsZS4gVGhpcyByZXN1bHRzIGluIGEgd2Fybmlu
ZyBmcm9tIGdjYy03Ogo+IAo+IHZ0cG1ibGsuYzogSW4gZnVuY3Rpb24gJ3JlYWRfdnRwbWJsayc6
Cj4gdnRwbWJsay5jOjMyMjo3OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiAncHJpbnRmJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgICAgICAg
cHJpbnRmKCJFeHBlY3RlZDogIik7Cj4gdnRwbWJsay5jOjMyMjo3OiB3YXJuaW5nOiBpbmNvbXBh
dGlibGUgaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgYnVpbHQtaW4gZnVuY3Rpb24gJ3ByaW50ZicK
PiB2dHBtYmxrLmM6MzIyOjc6IG5vdGU6IGluY2x1ZGUgJzxzdGRpby5oPicgb3IgcHJvdmlkZSBh
IGRlY2xhcmF0aW9uIG9mICdwcmludGYnCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcg
PG9sYWZAYWVwZmxlLmRlPgo+IGNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNo
by5uc2EuZ292PgoKUmV2aWV3ZWQtYnk6IFNhbXVlbCBUaGliYXVsdCA8c2FtdWVsLnRoaWJhdWx0
QGVucy1seW9uLm9yZz4KCj4gLS0tCj4gIHN0dWJkb20vdnRwbS92dHBtYmxrLmMgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3N0dWJkb20v
dnRwbS92dHBtYmxrLmMgYi9zdHViZG9tL3Z0cG0vdnRwbWJsay5jCj4gaW5kZXggZmU1MjlhYjVh
Yy4uNjgxZjBjMDFiNiAxMDA2NDQKPiAtLS0gYS9zdHViZG9tL3Z0cG0vdnRwbWJsay5jCj4gKysr
IGIvc3R1YmRvbS92dHBtL3Z0cG1ibGsuYwo+IEBAIC0yMCw2ICsyMCw3IEBACj4gICNpbmNsdWRl
IDx1bmlzdGQuaD4KPiAgI2luY2x1ZGUgPGVycm5vLmg+Cj4gICNpbmNsdWRlIDxmY250bC5oPgo+
ICsjaW5jbHVkZSA8c3RkaW8uaD4KPiAgCj4gIC8qRW5jcnlwdGlvbiBrZXkgYW5kIGJsb2NrIHNp
emVzICovCj4gICNkZWZpbmUgQkxLU1ogMTYKPiAKCi0tIApTYW11ZWwKPFA+IG1vbwo8Tj4gbW9v
ID8KPEQ+IFA6IGtlc2tpIHQnYXJyaXZlPyA6KSkKPFA+IG1vb29vCjxOPiBtb29vb29vID8KPFA+
IHJpZW4gbGUgbmV0IG1hcmNoZSBqZSBzdWlzIGNvbnRlbnQgOikKIC0rLSAjZW5zLW1pbSAtIGFj
Y3JvIGR1IG5ldCAtKy0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
