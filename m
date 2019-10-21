Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071CDEB50
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 13:47:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMW6M-0002zF-St; Mon, 21 Oct 2019 11:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMW6K-0002zA-GW
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 11:43:52 +0000
X-Inumbo-ID: 0d5f256e-f3f8-11e9-beca-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d5f256e-f3f8-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 11:43:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b24so12427569wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 04:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wznqlMgsUeOVCq0fPJ7RmHeAnqoMZGEfS/4vYOFrjCY=;
 b=e1YnSDJptJetDAHDGc97LVPXAz10umsbMKDO3uHKMRY+2GzrZyaTjrntP0Q4Zeu2Qc
 f8Qx3PCTNTNAHjtN/tfUBmBQzzsC8akXQ3exDEHMn8S2zx16I+2xyg+AAytDzeauxOi2
 ofO/n6GYjMfouowNXyL1W8eafU/00MftAmXcy0wTqKbHQ2n1Ja0Z/7R5U53T+kfJyVqi
 sZvgg9dQpRmyhZpvbdQk6DzDcKyqiGD9+vC6ca4ZYS7y6PKS530azD4Dcw26xoEggGlI
 aaUY1ZEpz7edKM0GMiTqCDdDvw93drzIWoO361UON1lBz6aBpJv5OeY0Qk88XE/wUUha
 qGKw==
X-Gm-Message-State: APjAAAXYI4WcZX1XWCY9fyY+lMhmdX36qSKmC9Rr//+iWTqzUE4JR4kD
 kGxL6uqess3DzO8rMxAmhPU=
X-Google-Smtp-Source: APXvYqz+TexPWXrOhb+h85tZW0lfSvkMGFa894W3zie4iVlyLQ7TPyw3YNeSHawZu888l9FJdJFTrA==
X-Received: by 2002:a1c:a444:: with SMTP id n65mr19798424wme.111.1571658230972; 
 Mon, 21 Oct 2019 04:43:50 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id d11sm16796778wrf.80.2019.10.21.04.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 04:43:50 -0700 (PDT)
Date: Mon, 21 Oct 2019 12:43:48 +0100
From: Wei Liu <wl@xen.org>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20191021114348.kynwzrkbl4xbnfky@debian>
References: <20190823140855.4222-1-jeff.kubascik@dornerworks.com>
 <20190830092837.nmsnmelmwryzxyta@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <5bf66876-8b09-bb34-bc4f-046d6e1e4205@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bf66876-8b09-bb34-bc4f-046d6e1e4205@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add DornerWorks maintainers
 email
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
Cc: DornerWorks Xen-Devel <xen-devel@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6Mjk6NDVQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA4LzMwLzE5IDEwOjI4IEFNLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gRnJpLCBB
dWcgMjMsIDIwMTkgYXQgMTA6MDg6NTVBTSAtMDQwMCwgSmVmZiBLdWJhc2NpayB3cm90ZToKPiA+
PiBXZSB3b3VsZCBsaWtlIHRvIGhhdmUgYSBjb21tb24gbWFpbnRhaW5lcnMgZW1haWwgYWRkcmVz
cyBmb3IgRG9ybmVyV29ya3MKPiA+PiBtYWludGFpbmVkIGNvZGUsIHdoaWNoIGN1cnJlbnRseSBp
cyB0aGUgQVJJTkM2NTMgc2NoZWR1bGVyLiBUaGlzIHdpbGwKPiA+PiBlbmFibGUgdXMgdG8gYmV0
dGVyIG1vbml0b3IgYW5kIHJlc3BvbmQgdG8gdGhlIFhlbiBjb21tdW5pdHkuIFRoaXMgcGF0Y2gK
PiA+PiBhZGRzIGEgbWFpbnRhaW5lciBsaW5lIHdpdGggdGhlIERvcm5lcldvcmtzIG1haW50YWlu
ZXJzIGVtYWlsIGFkZHJlc3MuCj4gPj4gLS0tCj4gPj4gIE1BSU5UQUlORVJTIHwgMSArCj4gPj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+PiBpbmRleCA3NzQxM2UwZDllLi4zY2NlMjUzOTMx
IDEwMDY0NAo+ID4+IC0tLSBhL01BSU5UQUlORVJTCj4gPj4gKysrIGIvTUFJTlRBSU5FUlMKPiA+
PiBAQCAtMTY4LDYgKzE2OCw3IEBAIEY6CXhlbi9jb21tb24vYXJnby5jCj4gPj4gIEFSSU5DNjUz
IFNDSEVEVUxFUgo+ID4+ICBNOglKb3NoIFdoaXRlaGVhZCA8am9zaC53aGl0ZWhlYWRAZG9ybmVy
d29ya3MuY29tPgo+ID4+ICBNOglSb2JlcnQgVmFuVm9zc2VuIDxyb2JlcnQudmFudm9zc2VuQGRv
cm5lcndvcmtzLmNvbT4KPiA+PiArTToJRG9ybmVyV29ya3MgWGVuLURldmVsIDx4ZW4tZGV2ZWxA
ZG9ybmVyd29ya3MuY29tPgo+ID4gCj4gPiBUaGUgY29ycmVjdCBzeW1ib2wgaGVyZSBpcyBMLiAK
PiA+IAo+ID4gICAgIEw6IE1haWxpbmcgbGlzdCB0aGF0IGlzIHJlbGV2YW50IHRvIHRoaXMgYXJl
YQo+IAo+IEJ1dCB0aGlzIGlzbid0IGV4YWN0bHkgYSBtYWlsaW5nIGxpc3QsIGlzIGl0PyAgVGhl
ICdMOicgdGFnIGlzIG5vcm1hbGx5Cj4gZm9yIHRoaW5ncyBsaWtlIHRoZSBMaW51eCBBcm0gbWFp
bGluZyBsaXN0LCB0aGUgTGludXggTmV0IG1haWxpbmcgbGlzdCwKPiBhbmQgc28gb24gLS0gKnB1
YmxpYyogbGlzdHMgd2hlcmUgZGlzY3Vzc2lvbnMgYWJvdXQgdGhhdCBzdWJzeXN0ZW0gaGFwcGVu
Lgo+IAo+IFRoaXMgaXNuJ3QgYSBwdWJsaWMgbGlzdCB3aGVyZSBkaXNjdXNzaW9uIGhhcHBlbnMu
ICBBdCB0aGUgbW9tZW50LCBpbgo+IGZhY3QsIGl0IGxvb2tzIGxpa2UgaXQgbWlnaHQgYmUgYSAq
c2luZ2xlIGVtYWlsIGFjY291bnQqLCB0byB3aGljaAo+IHNldmVyYWwgcGVvcGxlIGhhdmUgYWNj
ZXNzOyBhdCBiZXN0IGl0IHdvdWxkIGJlIGFuIGFsaWFzIHRoYXQgd291bGQgZ28KPiB0byBhIG51
bWJlciBvZiBpbnRlcmVzdGVkIHBhcnRpZXMuICBUaGF0IHNlZW1zIGNsb3NlciB0byAnUjonLgo+
IAo+IEkgYWRtaXQgdGhpcyBpcyBnZXR0aW5nIGludG8gdGhlIG1pbnV0aWEgb2YgdGVjaG5pY2Fs
aXRpZXMgaGVyZS4gOi0pCj4gCgpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGxpc3QgYmVp
bmcgcHVibGljIGlzIGEgbm90IGEgcmVxdWlyZW1lbnQuCkZvciBleGFtcGxlLCBMaW51eCBoYXMg
dGhpczoKCiAgTDogICAgICBzcGFybWFpbnRhaW5lckB1bmlzeXMuY29tIChVbmlzeXMgaW50ZXJu
YWwpCgpBbiBhbGlhcyBmb3Igc2V2ZXJhbCBwZW9wbGUgc3RpbGwgcXVhbGlmaWVzIGFzIGEgbGlz
dCB0byBtZS4KCkFueXdheSwgZWl0aGVyIFIgb3IgTCB3b3Jrcy4gSSBkb24ndCB3YW50IHRvIGJp
a2VzaGVkIGZ1cnRoZXIuLi4KCldlaS4KCj4gIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
