Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6FB7663B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:50:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzcv-0001mE-HF; Fri, 26 Jul 2019 12:47:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hqzct-0001m9-MR
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:47:11 +0000
X-Inumbo-ID: 7c2801c9-afa3-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c2801c9-afa3-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:47:11 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z3so104563861iog.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cOKhnV4KkuOKZUTheHXbk9viarTpz4GhBfcKDwxAmZE=;
 b=BBjojPK8ujTOSWNhmwsd1HnlOpwahUrzU3sx1jZgbIBh90shJoG/wybBxDr/Nb+Ng6
 l8nLBksjjl2LUQvwQCvuEdPXmKGKPowoBD/wL/wVFo2n0nZ+/r2hkCKzQEboKa9r3JSZ
 q5b8/C+qvmHtMnyJlSmcacn8ux3lwtipeiccHPZun+xjT/L1Wlw5X6FY9oqmf4PNpW+M
 VGpnhdK7fNvUlk0/OAr7IDbYbmhlM2KELO8e6JZNATFW/fch9vtMJoEyMxcIsKxUMv2R
 aoDBa4nUC7VFjGP8EW830g07+rMdv25ZJBA2zhUT/219mgwptzs7lAiWDyPg27CrqOd9
 WeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOKhnV4KkuOKZUTheHXbk9viarTpz4GhBfcKDwxAmZE=;
 b=HVyeNpShIUypS4YKZmXKVZUG1KpNd8JWSTZupuJMMvWenjZkQWHe5gcSnSoGJw+RlP
 4Jxx+IrATxlg37is4A95Z8xsKcgUCpiD09F8L78beRi99fgYaS+C3uXMSFzHy/4bNjSB
 AI6QMrUM0ViwqBKYJy3p8dzsoy3yZRdEod3sSaUILstIKuefN0UQZ2OO8kL06H6o7z56
 kjZvQKSzwMyb14xZAnsxRgjQWhLPafokKI6FcuFWVBieugSrjJfLAht+Ew3P4q46ObBk
 dLorKXxMmE5ced+j6043R/B+ZT9kML1KhFHaOcAD2G3ZU/zFLsfWI/tvicGzzG4YXfmv
 gXAg==
X-Gm-Message-State: APjAAAXvSyuPo+8tBdrbl1O2ThVLv3+IBBL8z8eu7JMyJFpuy0Pxq/qQ
 xN+poKXu33mwYVAtlENPFo8uPD9WAJzFefsi8sE=
X-Google-Smtp-Source: APXvYqxDPvdcPVR2QS4STbDGZgFeZxg42IGijQxQemIhD+2GIeKpiWNRRV/IY/MFqIG59EStBHLxR6Q9o3xcttvw6U4=
X-Received: by 2002:a6b:8b8b:: with SMTP id
 n133mr13134304iod.183.1564145230531; 
 Fri, 26 Jul 2019 05:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190726090124.26444-1-viktor.mitin.19@gmail.com>
 <87sgqthuud.fsf@epam.com>
In-Reply-To: <87sgqthuud.fsf@epam.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 15:46:59 +0300
Message-ID: <CAOcoXZbc8tUf8DKjAD7Rj3JjOqrFA=3hVsw0fe21TNyoG8Q8CA@mail.gmail.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: extend fdt_property_interrupts
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMjo1NyBQTSBWb2xvZHlteXIg
QmFiY2h1awo8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdyb3RlOgo+Cj4KPiBIZWxsbyBW
aWtvciwKPgo+IFZpa3RvciBNaXRpbiB3cml0ZXM6Cj4KPiA+IHhlbi9hcm06IGV4dGVuZCBmZHRf
cHJvcGVydHlfaW50ZXJydXB0cyB0byBkZWFsIHdpdGggb3RoZXIKPiA+IGRvbWFpbiB0aGFuIHRo
ZSBod2RvbQo+Cj4gSXQgaXMgdW5jbGVhciB3aGF0IHByb2JsZW0geW91IGFyZSBmYWNpbmcuIENv
dWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlCj4gY29tbWl0IG1lc3NhZ2U/CgpPcmlnaW5hbCBnb2Fs
IGlzIHRvIG1lcmdlIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25vZGUgZnVu
Y3Rpb25zLgpGb3IgYmFja2dyb3VuZCBkaXNjdXNzaW9uIHBsZWFzZSBzZWUgZGlzY3Vzc2lvbiBp
biBtYWlsIChhbHNvCm1lbnRpb25lZCBpbiB0aGUgcGF0Y2gpOgpbUEFUQ0hdIHhlbi9hcm06IG1l
cmdlIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25vZGUKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAwOTE0
Lmh0bWwKCj4gQWxzbywgbG9va3MgbGlrZSB5b3VyIGNvbW1pdCBtZXNzYWdlIGlzIGZvcm1hdHRl
ZCBpbmNvcnJlY3RseS4KPgpQbGVhc2Ugc2VlIGJlbG93LgoKPiA+IFRlc3RlZCB3aXRoIGFhcmNo
NjQgcWVtdSBkb20wIGFuZCBkb20wbGVzcyBib290Lgo+ID4KPiA+IFN1Z2dlc3RlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpa3Rv
ciBNaXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29tPgo+ID4KPiA+IC0tLQo+ID4gU2VlIGRpc2N1
c3Npb24gaW4gbWFpbDoKPiA+IFtQQVRDSF0geGVuL2FybTogbWVyZ2UgbWFrZV90aW1lcl9ub2Rl
IGFuZCBtYWtlX3RpbWVyX2RvbVVfbm9kZQo+ID4KPiA+Cj4gPiAgeGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIHwgMjIgKysrKysrKysrKysrKy0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
PiA+IGluZGV4IDRjODQwNDE1NWEuLjVmNjg2MDMzOTIgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Ywo+ID4gQEAgLTYyMSwxNyArNjIxLDE5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXRfaW50ZXJy
dXB0KGdpY19pbnRlcnJ1cHRfdCBpbnRlcnJ1cHQsCj4gPiAgICogICJpbnRlcnJ1cHRzIjogY29u
dGFpbnMgdGhlIGxpc3Qgb2YgaW50ZXJydXB0cwo+ID4gICAqICAiaW50ZXJydXB0LXBhcmVudCI6
IGxpbmsgdG8gdGhlIEdJQwo+ID4gICAqLwo+ID4gLXN0YXRpYyBpbnQgX19pbml0IGZkdF9wcm9w
ZXJ0eV9pbnRlcnJ1cHRzKHZvaWQgKmZkdCwgZ2ljX2ludGVycnVwdF90ICppbnRyLAo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIG51bV9pcnEp
Cj4gPiArc3RhdGljIGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoY29uc3Qgc3Ry
dWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2ljX2ludGVycnVwdF90ICppbnRyLCB1bnNpZ25lZCBudW1faXJxKQo+IFdyb25nIGluZGVudGF0
aW9uIHRoZXJlLgoKU3VjaCBjYXNlcyBhcmUgbm90IGRlZmluZWQgaW4gdGhlIENvZGluZyBTdHls
ZSBkb2N1bWVudCBleHBsaWNpdGx5LgpTZWUgbXkgY2xhbmctZm9ybWF0IGNvZGluZyBzdHlsZSBt
YWlsLgoKPiA+ICB7Cj4gPiAgICAgIGludCByZXM7Cj4gPiArICAgIHVpbnQzMl90IHBoYW5kbGUg
PSBpc19oYXJkd2FyZV9kb21haW4oa2luZm8tPmQpID8KPiBUaGVyZSBpcyBleHRyYSBzcGFjZSBh
dCBFT0wuCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGR0X2ludGVycnVwdF9jb250cm9s
bGVyLT5waGFuZGxlIDogR1VFU1RfUEhBTkRMRV9HSUM7Cj4gPgo+ID4gLSAgICByZXMgPSBmZHRf
cHJvcGVydHkoZmR0LCAiaW50ZXJydXB0cyIsIGludHIsIHNpemVvZiAoaW50clswXSkgKiBudW1f
aXJxKTsKPiA+ICsgICAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsICJpbnRlcnJ1cHRz
IiwKPiBUaGVyZSBpcyBleHRyYSBzcGFjZSBhdCBFT0wuCgpXaWxsIGZpeCB0aGF0LgoKClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
