Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A667AA28
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:51:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSUn-00063j-Gy; Tue, 30 Jul 2019 13:48:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMGE=V3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hsSUl-00063e-VS
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:48:52 +0000
X-Inumbo-ID: c2deaab8-b2d0-11e9-8980-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2deaab8-b2d0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 13:48:51 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x15so57259095wmj.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 06:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TlJ5j4Uo/v9eOIUPwNo95XdrQwtlg0sJbav/K5PdayA=;
 b=H779/JxFLJ6tnN1GEZ4R30UGSLClVAG6v0JaNu2s/75/UKQr77gx7yt03QogkpZwb6
 NWi/ImSqP6EqNl0ctISDTLj8JQDbzc5nxfLE/JH1CePc4R+Hu2ovMaBbZs1ovledLwmD
 8ThUT+BKA1O8BLBe06+d9i/hR0YSlKuO0n7/iSWAMAvGOiqUqXwuzJwZ20bMmK0ZpXt2
 00fmIswWK9AU7HCj2pDQDqoF8iDzyr9+DmardLDr3S9ZiFT2zoEgHW4VZQ+lCNpKhGly
 XZgyt13TkgN3V+ue/yVeuZuhLtUHWv8RPe9UFvkff3yyE2zIVmEsbt6B8Y7xvDjPo+ud
 bXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TlJ5j4Uo/v9eOIUPwNo95XdrQwtlg0sJbav/K5PdayA=;
 b=XU4jKd7RZwc2rYV7YO0CtJQ1CNbD2YG9gvS5qNDKaelY3pnnKmSEIuY/r41npUMJpl
 StDn+CiTwJzUd6FB7BsG5ylozWIHsbqzc1zD65sKRe2yNYRqHMag5IiY+dKFQK4Bp1mT
 SuYEWzfcQAlJFoVwku+JSWrTyGPDPLZxw7muPEg1coOZQsjT1DgbdHhFODxFtYO7MqZx
 WNFc/089XmG0QJFlU/tH1EO+V9zwHa5ijhG09IGg9adlBPVCCIOBh74NHFTP2c6B4AQf
 66XuKiL0CdFDlh/00ENTO53T+BYLkYLQLa6azrOt4Sg/rMaY21dx0o4g/Z4zBikrfg0Q
 Jv0Q==
X-Gm-Message-State: APjAAAXqSHHzD91UI4NR6DEAYcrFUOduTib1orvdCWRL6KInldGvnEDM
 IvglzXLiPDH1rodsCk3kooXuycvLF/tXDi04aU0=
X-Google-Smtp-Source: APXvYqwKG154DRxeYD7dVo4bEyESbeIHiXvI2fXyLxsqLBioTwcUiWQIhnV6wirxDgr5QckNkhIJAM+u/oZwEoKVF1I=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr101672484wmh.129.1564494529853; 
 Tue, 30 Jul 2019 06:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
In-Reply-To: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 30 Jul 2019 07:48:13 -0600
Message-ID: <CABfawhmhPy-BWwRfZ-+pB1Zr98ony9jeXoOEOx+HZBm_z+Ez=g@mail.gmail.com>
To: Nicholas Rosbrook <rosbrookn@ainfosec.com>
Subject: Re: [Xen-devel] [RFC] Generating Go bindings for libxl
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
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>, "wl@xen.org" <wl@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgNzozMiBBTSBOaWNob2xhcyBSb3Nicm9vawo8cm9zYnJv
b2tuQGFpbmZvc2VjLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IEFzIGEgZm9sbG93IHVwIHRv
IHRoZSBwcmVzZW50YXRpb24gdGhhdCBCcmVuZGFuIEtlcnJpZ2FuIGFuZCBJIGdhdmUgYXQgWGVu
Cj4gc3VtbWl0IGVhcmxpZXIgdGhpcyBtb250aCwgIkNsaWVudCBWaXJ0dWFsaXphdGlvbiBUb29s
c3RhY2sgaW4gR28iLCBJIHdvdWxkIGxpa2UgdG8gb3Blbgo+IGEgZGlzY3Vzc2lvbiBhcm91bmQg
dGhlIGRldmVsb3BtZW50IG9mIEdvIGJpbmRpbmdzIGZvciBsaWJ4bC4gR2VvcmdlIER1bmxhcCwK
PiBOaWNvbGFzIEJlbG91aW4gYW5kIEkgaGF2ZSBoYWQgc29tZSBkaXNjdXNzaW9uIG9mZi1saW5l
IGFscmVhZHkuCj4KPiBTbyBmYXIsIHRoZXNlIGFyZSB0aGUgdG9waWNzIG9mIGRpc2N1c3Npb246
CgpIaSBOaWNob2xhcywKdG8gYWRkIHRvIHRoZSBsaXN0IG9mIHRvcGljcyBJIGp1c3Qgd2FudCB0
byBtZW50aW9uIHRoYXQgcGVyaGFwcyBpdAptYXkgYmUgYmVuZWZpY2lhbCB0byBjb25zaWRlciBw
YXJ0cyBvZiB0aGUgZ28gYmluZGluZ3Mgbm90IGdvIHRvIGxpYnhsCmF0IGFsbC4gSSBoYXZlIGJl
ZW4gZGlnZ2luZyB0aHJvdWdoIGxpYnhsIGZvciB0aGUgcGFzdCBjb3VwbGUgbW9udGhzCmFuZCBp
dCdzIGFzeW5jaHJvbm91cyBjYWxsYmFjayBzeXN0ZW0gaXMgZGFtbiBuZWFyIGltcG9zc2libGUg
dG8KZm9sbG93IGFuZCBJIGp1c3QgY2FuJ3Qgc2hha2UgdGhlIGZlZWxpbmcgdGhhdCBpdCB3b3Vs
ZCBiZSBhIGxvdAplYXNpZXIgdG8gZm9sbG93IGlmIGl0IHdhcyBpbiBnby4gTm90IHRvIG1lbnRp
b24gdGhlIHBlcmZvcm1hbmNlCmlzc3VlcyB3aXRoIHRoZSBidWlsdC1pbiBnYXJiYWdlIGNvbGxl
Y3RvciBhbmQgZm9yay9leGVjIHBhcnRzLiBJJ20KYWxzbyBpbnRlcmVzdGVkIG9ubHkgaW4gYSB2
ZXJ5IHNtYWxsIHN1YnNldCBvZiB3aGF0IGxpYnhsIGRvZXMgdG9kYXkKYnV0IEkgd2FudCB0byBi
ZSBhYmxlIHRvIHRoYXQgYXMgZmFzdCBhcyBwb3NzaWJsZSAtIGRvbWFpbiBjcmVhdGlvbiAtCndo
aWNoIGhhcyBtYW55IHN0ZXBzIHRoYXQgY291bGQgYmUgZG9uZSBpbiBwYXJhbGxlbCB0byBzcGVl
ZCBpdCB1cC4uCmFuZCB0aGF0IHdvdWxkIGp1c3QgYmUgYSBuYXR1cmFsIHRoaW5nIHRvIGRvIGlu
IGdvLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
