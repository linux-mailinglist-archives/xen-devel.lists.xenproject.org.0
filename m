Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF366121EDC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 00:25:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igzhf-0003HE-LN; Mon, 16 Dec 2019 23:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v9dV=2G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1igzhe-0003H7-As
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 23:23:02 +0000
X-Inumbo-ID: fb9ca7ea-205a-11ea-a914-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb9ca7ea-205a-11ea-a914-bc764e2007e4;
 Mon, 16 Dec 2019 23:22:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so5101140wrj.12
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 15:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c9P83JBkbVVajUvOWO1aqkFhIUGYjcy4oLmHMIUMFb0=;
 b=cvQGP5JGq0XHFlyXWITGRthEOG9n1v601gnfVjyoyP7Z7HlapY/TP2iwczE4/CkxNS
 +djxqO7MYYiZGyplZgSNFS83CG/B2NY0QMFA996aWV3ntYd2KWeCighYpFmLUvKANyO+
 EDysrChhljrXSdd/H8GDGZ1FNTjxnFH+FnO7OIgXS1ZIfnUheSUjL/QeToiVhtoNXChf
 tcVYgvphBxf4EdD96QcFaXIQ8vhSw6antpqdWD2iW5pVOl13zbFGp+ViqRmdzWvclUot
 EOvYcG634aGP9JOV8vQ9CDkSydWScHJIaI1szz1W5Vi12XiuPcBwcjjwT57plgT14Mre
 Nldg==
X-Gm-Message-State: APjAAAW5bxhQaBdqNwNxAkh2zQz3mRQcSASysTbnseajMmPpajlZT/lO
 PTwRdHithMfIxV+RbkKv32MIUtEX
X-Google-Smtp-Source: APXvYqywFItxWgVLK+tDPLLJ+fB8tiXAh85Jwzzfj2qVn7LTxLF3NZhjmR/uyQb86OAsjfAuH8vJVg==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr34660322wrv.308.1576538572118; 
 Mon, 16 Dec 2019 15:22:52 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id z3sm23257701wrs.94.2019.12.16.15.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 15:22:50 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <AM6PR04MB42465A5C5405FE85DA1F6FB0F9510@AM6PR04MB4246.eurprd04.prod.outlook.com>
 <766fc278-d729-ae7c-1abb-053f938eb8aa@xen.org>
 <alpine.DEB.2.21.1912161450550.13474@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <10975eca-f391-959c-9933-fc07df9ef603@xen.org>
Date: Mon, 16 Dec 2019 23:22:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1912161450550.13474@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] Xen ARM Dom0less passthrough without IOMMU
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNi8xMi8yMDE5IDIzOjA1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gTW9u
LCAxNiBEZWMgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxNi8xMi8yMDE5IDE4OjAy
LCBBbmRyZWkgQ2hlcmVjaGVzdSB3cm90ZToKPj4gQnV0IGV2ZW4gd2l0aCB0aGlzIHBhdGNoLCBS
QU0gaW4gRG9tVSBpcyBub3QgZGlyZWN0IG1hcHBlZCAoaS5lIEd1ZXN0IFBoeXNpY2FsCj4+IEFk
ZHJlc3MgPT0gSG9zdCBQaHlzaWNhbCBBZGRyZXNzKS4gVGhpcyBtZWFucyB0aGF0IERNQS1jYXBh
YmxlIGRldmljZSB3b3VsZAo+PiBub3Qgd29yayBwcm9wZXJseSBpbiBEb21VLgo+Pgo+PiBXZSBj
b3VsZCB0aGVvcml0aWNhbGx5IG1hcCBEb21VIGRpcmVjdCBtYXBwZWQsIGJ1dCB0aGlzIHdvdWxk
IGJyZWFrIHRoZQo+PiBpc29sYXRpb24gcHJvdmlkZWQgYnkgdGhlIGh5cGVydmlzb3IuCj4gCj4g
WWVzLCBiZWluZyBhYmxlIHRvIG1hcCB0aGUgRG9tVSBtZW1vcnkgMToxIGNhbiBiZSBwcmV0dHkg
dXNlZnVsIGZvciBzb21lCj4gdmVyeSBlbWJlZGRlZCBkb20wbGVzcyBjb25maWd1cmF0aW9ucywg
aW4gZmFjdCBJIHdhcyBzdXJwcmlzZWQgdGhhdCBhCj4gY291cGxlIG9mIFhpbGlueCB1c2VycyBh
c2tlZCBtZSBmb3IgdGhhdCByZWNlbnRseS4gVHlwaWNhbGx5LCB0aGUgdXNlcnMKPiBhcmUgYXdh
cmUgb2YgdGhlIGNvbnNlcXVlbmNlcyBidXQgdGhleSBzdGlsbCBmaW5kIHRoZW0gYmV0dGVyIHRo
YW4gdGhlCj4gYWx0ZXJuYXRpdmUgKGkuZS4gdGhlIGxhY2sgb2YgaXNvbGF0aW9uIGlzIGJhZCBi
dXQgaXMgdG9sZXJhYmxlIGluIHRoZWlyCj4gY29uZmlndXJhdGlvbi4pClRoaXMgZG9lcyBub3Qg
bWFrZSBtdWNoIHNlbnNlLi4uIFRoZSB3aG9sZSBwb2ludCBvZiBhIGh5cGVydmlzb3IgaXMgdG8g
Cmlzb2xhdGUgZ3Vlc3QgYmV0d2VlbiBlYWNoIG90aGVyLi4uIFNvIGlmIHlvdSBhcmUgaGFwcHkg
d2l0aCB0aGUgbGFjayBvZiAKaXNvbGF0aW9uLCB0aGVuIHdoeSBhcmUgeW91IHVzaW5nIGFuIGh5
cGVydmlzb3IgYXQgdGhlIGZpcnN0IHBsYWNlPwoKPiAKPiAgRnJvbSBhbiBpbXBsZW1lbnRhdGlv
biBwZXJzcGVjdGl2ZSwgaXQgc2hvdWxkIGJlIGEgbWF0dGVyIG9mIGNhbGxpbmcKPiBhbGxvY2F0
ZV9tZW1vcnlfMTEgaW5zdGVhZCBvZiBhbGxvY2F0ZV9tZW1vcnkgZnJvbSBjb25zdHJ1Y3RfZG9t
VS4gSQo+IHdhbnRlZCB0byBleHBlcmltZW50IHdpdGggaXQgbXlzZWxmIGJ1dCBJIGhhdmVuJ3Qg
aGFkIHRoZSB0aW1lLiBJZgo+IG5vdGhpbmcgZWxzZSwgaXQgd291bGQgYmUgdXNlZnVsIHRvIGhh
dmUgYSBwYXRjaCBhcm91bmQgdG8gZG8gaXQgaWYKPiBuZWVkZWQuClRoaXMgaXMgbm90IHRoYXQg
c2ltcGxlLiBZb3UgYXQgbGVhc3QgYWxzbyBuZWVkIHRvOgogICAgIC0gVXBkYXRlIHRoZSBjb2Rl
IHRvIGdlbmVyYXRlIHRoZSBEVCBiYXNlZCBvbiB0aGUgbmV3IDE6MSBhZGRyZXNzCiAgICAgLSBN
b2RpZnkgdGhlIHZhcmlvdXMgZW11bGF0aW9uIGluIFhlbiBiZWNhdXNlIHRoZXkgcmVseSBvbiBY
ZW4gCmd1ZXN0IG1lbW9yeSBsYXlvdXQKICAgICAtIE1vZGlmeSBpc19kb21haW5fZGlyZWN0X21h
cHBlZCgpIHRvIGRlYWwgd2l0aCBndWVzdAoKSSBwcm9iYWJseSBtaXNzZWQgb3RoZXIgYml0cy4g
QW55d2F5LCB0aGlzIGlzIG5vdCBzb21ldGhpbmcgSSBhbSB3aWxsaW5nIAp0byBhY2NlcHQgdXBz
dHJlYW0gYXMgdGhpcyBicmVhayB0aGUgY29yZSBpZGVhIG9mIGFuIGh5cGVydmlzb3IuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
