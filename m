Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB11B82D
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:21:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBmC-0008T4-Bp; Mon, 13 May 2019 14:18:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBmA-0008SY-3M
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:17:58 +0000
X-Inumbo-ID: e7ae05e6-7589-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e7ae05e6-7589-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:17:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85389739"
Date: Mon, 13 May 2019 15:17:54 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20190513141754.GM2798@zion.uk.xensource.com>
References: <20190416072139.490-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190416072139.490-1-wei.liu2@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] gitlab-ci: allow specifying base and tip in
 build test
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG91ZywgcGluZz8KCk9uIFR1ZSwgQXByIDE2LCAyMDE5IGF0IDA4OjIxOjM5QU0gKzAxMDAsIFdl
aSBMaXUgd3JvdGU6Cj4gV2Ugd2lsbCBzb29uIHByb3ZpZGUgdGhpcyBuZXcgY2FwYWJpbGl0eSB0
byBodW1hbnMgYW5kIGF1dG9tYXRlZAo+IHN5c3RlbXMuCj4gCj4gVGhlIGRlZmF1bHQgYmVoYXZp
b3VyIGlzIHJldGFpbmVkOiB0aXAgYW5kIGJhc2UgYXJlIHBhc3NlZCBieSBHaXRsYWIKPiBDSS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+
ICBhdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaCB8IDEwICsrKysrLS0t
LS0KPiAgYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sICAgICAgICAgICAgfCAgMiArLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2ggYi9h
dXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaAo+IGluZGV4IDg3OTAyOGI1
YTcuLjE5ZTMzN2I0NjggMTAwNzU1Cj4gLS0tIGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQt
ZWFjaC1jb21taXQuc2gKPiArKysgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNv
bW1pdC5zaAo+IEBAIC0xLDE4ICsxLDE4IEBACj4gICMhL2Jpbi9iYXNoCj4gIAo+ICAjIEZvciBh
IG5ld2x5IHB1c2hlZCBicmFuY2ggdGhlIEJFRk9SRV9TSEEgd2lsbCBiZSBhbGwgMHMKPiAtaWYg
W1sgJHtDSV9DT01NSVRfQkVGT1JFX1NIQX0gPT0gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMCBdXTsgdGhlbgo+ICtpZiBbWyAke0JBU0V9ID09IDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAgXV07IHRoZW4KPiAgICAgIGVjaG8gIk5ld2x5IHB1
c2hlZCBicmFuY2gsIHNraXBwZWQiCj4gICAgICBleGl0IDAKPiAgZmkKPiAgCj4gLWdpdCBtZXJn
ZS1iYXNlIC0taXMtYW5jZXN0b3IgJHtDSV9DT01NSVRfQkVGT1JFX1NIQX0gJHtDSV9DT01NSVRf
U0hBfQo+ICtnaXQgbWVyZ2UtYmFzZSAtLWlzLWFuY2VzdG9yICR7QkFTRX0gJHtUSVB9Cj4gIGlm
IFtbICQ/IC1uZSAwIF1dOyB0aGVuCj4gLSAgICBlY2hvICIke0NJX0NPTU1JVF9TSEF9IGlzIG5v
dCBhIGRlc2NlbmRlbnQgb2YgJHtDSV9DT01NSVRfQkVGT1JFX1NIQX0sIHNraXBwZWQiCj4gKyAg
ICBlY2hvICIke1RJUH0gaXMgbm90IGEgZGVzY2VuZGVudCBvZiAke0JBU0V9LCBza2lwcGVkIgo+
ICAgICAgZXhpdCAwCj4gIGZpCj4gIAo+IC1lY2hvICJCdWlsZGluZyAke0NJX0NPTU1JVF9CRUZP
UkVfU0hBfS4uJHtDSV9DT01NSVRfU0hBfSIKPiArZWNobyAiQnVpbGRpbmcgJHtCQVNFfS4uJHtU
SVB9Igo+ICAKPiAtTk9OX1NZTUJPTElDX1JFRj0xIC4vYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxk
LXRlc3Quc2ggJHtDSV9DT01NSVRfQkVGT1JFX1NIQX0gJHtDSV9DT01NSVRfU0hBfSBcCj4gK05P
Tl9TWU1CT0xJQ19SRUY9MSAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZC10ZXN0LnNoICR7QkFT
RX0gJHtUSVB9IFwKPiAgICAgIGJhc2ggLWMgImdpdCBjbGVhbiAtZmZkeCAmJiAuL2F1dG9tYXRp
b24vc2NyaXB0cy9idWlsZCIKPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRsYWItY2kvdGVz
dC55YW1sIGIvYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sCj4gaW5kZXggZDQ1NTZhZmUx
MS4uYTc5NTg2NjY3MyAxMDA2NDQKPiAtLS0gYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS90ZXN0Lnlh
bWwKPiArKysgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS90ZXN0LnlhbWwKPiBAQCAtNyw3ICs3LDcg
QEAgYnVpbGQtZWFjaC1jb21taXQtZ2NjOgo+ICAgICAgWEVOX1RBUkdFVF9BUkNIOiB4ODZfNjQK
PiAgICAgIENDOiBnY2MKPiAgICBzY3JpcHQ6Cj4gLSAgICAtIC4vYXV0b21hdGlvbi9naXRsYWIt
Y2kvYnVpbGQtZWFjaC1jb21taXQuc2ggMj4mMSB8IHRlZSBidWlsZC1lYWNoLWNvbW1pdC1nY2Mu
bG9nCj4gKyAgICAtIEJBU0U9JHtCQVNFX1NIQTotJHtDSV9DT01NSVRfQkVGT1JFX1NIQX19IFRJ
UD0ke1RJUF9TSEE6LSR7Q0lfQ09NTUlUX1NIQX19IC4vYXV0b21hdGlvbi9naXRsYWItY2kvYnVp
bGQtZWFjaC1jb21taXQuc2ggMj4mMSB8IHRlZSBidWlsZC1lYWNoLWNvbW1pdC1nY2MubG9nCj4g
ICAgYXJ0aWZhY3RzOgo+ICAgICAgcGF0aHM6Cj4gICAgICAgIC0gJyoubG9nJwo+IC0tIAo+IDIu
MjAuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
