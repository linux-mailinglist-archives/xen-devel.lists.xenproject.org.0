Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC07C488B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 09:31:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZ3z-00024p-6E; Wed, 02 Oct 2019 07:28:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFZ3x-00023T-Na
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:28:41 +0000
X-Inumbo-ID: 25c0dbd3-e4e6-11e9-9710-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 25c0dbd3-e4e6-11e9-9710-12813bfff9fa;
 Wed, 02 Oct 2019 07:27:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7184B0B7;
 Wed,  2 Oct 2019 07:27:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 09:27:45 +0200
Message-Id: <20191002072745.24919-21-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002072745.24919-1-jgross@suse.com>
References: <20191002072745.24919-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v6 20/20] docs: add "sched-gran" boot parameter
 documentation
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBuZXcgInNjaGVkLWdyYW4iIGh5cGVydmlzb3IgYm9v
dCBwYXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Ci0tLQpWNjoKLSBhZGQgYSBub3RlIHJlZ2FyZGluZyBkaWZmZXJlbnQgQU1EL0ludGVsIHRl
cm1pbm9sb2d5IChKYW4gQmV1bGljaCkKLS0tCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5w
YW5kb2MgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5l
LnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwppbmRleCBmYzY0NDI5
MDY0Li43NGFjZWFjNWRiIDEwMDY0NAotLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5w
YW5kb2MKKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCkBAIC0xNzgyLDYg
KzE3ODIsMzQgQEAgU2V0IHRoZSB0aW1lc2xpY2Ugb2YgdGhlIGNyZWRpdDEgc2NoZWR1bGVyLCBp
biBtaWxsaXNlY29uZHMuICBUaGUKIGRlZmF1bHQgaXMgMzBtcy4gIFJlYXNvbmFibGUgdmFsdWVz
IG1heSBpbmNsdWRlIDEwLCA1LCBvciBldmVuIDEgZm9yCiB2ZXJ5IGxhdGVuY3ktc2Vuc2l0aXZl
IHdvcmtsb2Fkcy4KIAorIyMjIHNjaGVkLWdyYW4gKHg4NikKKz4gYD0gY3B1IHwgY29yZSB8IHNv
Y2tldGAKKworPiBEZWZhdWx0OiBgc2NoZWQtZ3Jhbj1jcHVgCisKK1NldCB0aGUgc2NoZWR1bGlu
ZyBncmFudWxhcml0eS4gSW4gY2FzZSB0aGUgZ3JhbnVsYXJpdHkgaXMgbGFyZ2VyIHRoYW4gMSAo
ZS5nLgorYGNvcmVgb24gYSBTTVQtZW5hYmxlZCBzeXN0ZW0sIG9yIGBzb2NrZXRgKSBtdWx0aXBs
ZSB2Y3B1cyBhcmUgYXNzaWduZWQKK3N0YXRpY2FsbHkgdG8gYSAic2NoZWR1bGluZyB1bml0IiB3
aGljaCB3aWxsIHRoZW4gYmUgc3ViamVjdCB0byBzY2hlZHVsaW5nLgorVGhpcyBhc3NpZ25tZW50
IG9mIHZjcHVzIHRvIHNjaGVkdWxpbmcgdW5pdHMgaXMgZml4ZWQuCisKK2BjcHVgOiBWY3B1cyB3
aWxsIGJlIHNjaGVkdWxlZCBpbmRpdmlkdWFsbHkgb24gc2luZ2xlIGNwdXMgKGUuZy4gYQoraHlw
ZXJ0aHJlYWQgdXNpbmcgeDg2L0ludGVsIHRlcm1pbm9sb2d5KQorCitgY29yZWA6IEFzIG1hbnkg
dmNwdXMgYXMgdGhlcmUgYXJlIGNwdXMgb24gYSBwaHlzaWNhbCBjb3JlIGFyZSBzY2hlZHVsZWQK
K3RvZ2V0aGVyIG9uIGEgcGh5c2ljYWwgY29yZS4KKworYHNvY2tldGA6IEFzIG1hbnkgdmNwdXMg
YXMgdGhlcmUgYXJlIGNwdXMgb24gYSBwaHlzaWNhbCBzb2NrZXRzIGFyZSBzY2hlZHVsZWQKK3Rv
Z2V0aGVyIG9uIGEgcGh5c2ljYWwgc29ja2V0LgorCitOb3RlOiBhIHZhbHVlIG90aGVyIHRoYW4g
YGNwdWAgd2lsbCByZXN1bHQgaW4gcmVqZWN0aW5nIGEgcnVudGltZSBtb2RpZmljYXRpb24KK2F0
dGVtcHQgb2YgdGhlICJzbXQiIHNldHRpbmcuCisKK05vdGU6IGZvciBBTUQgeDg2IHByb2Nlc3Nv
cnMgYmVmb3JlIEZhbTE3IHRoZSB0ZXJtaW5vbG9neSBpbiB0aGUgb2ZmaWNpYWwgZGF0YQorc2hl
ZXRzIGlzIGRpZmZlcmVudDogYSBjcHUgaXMgbmFtZWQgImNvcmUiIGFuZCBtdWx0aXBsZSAiY29y
ZXMiIGFyZSBydW5uaW5nCitpbiB0aGUgc2FtZSAiY29tcHV0ZSB1bml0Ii4gQXMgZnJvbSBGYW0x
NyBvbiBBTUQgaXMgdXNpbmcgdGhlIHNhbWUgbmFtZXMgYXMKK0ludGVsICgidGhyZWFkIiBhbmQg
ImNvcmUiKSB0aGUgdG9wb2xvZ3kgbGV2ZWxzIGFyZSBuYW1lZCAiY3B1IiwgImNvcmUiIGFuZAor
InNvY2tldCIgZXZlbiBvbiBvbGRlciBBTUQgcHJvY2Vzc29ycy4KKwogIyMjIHNjaGVkX3JhdGVs
aW1pdF91cwogPiBgPSA8aW50ZWdlcj5gCiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
