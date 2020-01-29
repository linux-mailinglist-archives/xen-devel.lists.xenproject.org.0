Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE9514CBE9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:56:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwnnN-0001Ol-Q4; Wed, 29 Jan 2020 13:54:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WAbB=3S=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwnnN-0001Of-7T
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:54:17 +0000
X-Inumbo-ID: d6b1b2ca-429e-11ea-ad98-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6b1b2ca-429e-11ea-ad98-bc764e2007e4;
 Wed, 29 Jan 2020 13:54:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c9so20279368wrw.8
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 05:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FWp4jI/3Per9K5MSMZwyQOVxodhwrK1MUvEuu3oO1Q=;
 b=ow/+HCuNZ5fNX64F9vZss9F75TpzMRHGIi/DKfQu9uKZc2GMcosT3v7W1+9CQo+GjD
 Vd7lWHT/c7iEmcoOdiFlZE9MzzrO2WKOln0CS1TVmLphYmzS1pOdxvkSZecpmJnDD+bW
 AMR///8F6NU/Ec4+SeQh0NDk8HIjm/ouHG6IBrncz10CoPiEmHuwoLCkrnuQxHk2iQdl
 YcaF8Ypjf2aSnmex/XdGHnOja0nzcMmzOcR8l8s3L1kTBajpd9Z5Z3nA3MHJZejiSMTi
 UpIgK0Co+1R3jvlFAYVrK6unQK43CQHm92gl9l9XNWHlCkWxFvuEU+BZLcnoTbbS8lCO
 6k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FWp4jI/3Per9K5MSMZwyQOVxodhwrK1MUvEuu3oO1Q=;
 b=oWZhOa+VobiiNqu1Eof8iLGzGzBfC5SJ4CRCmgjr3tdEpDrNx5l5brhgn/j0ZWiF84
 bWXID6nPryok9Fkai+Oz2zChV9PqCtJAkzYup83IsUmixgBJZsTgYaFLsVCkn3tBWWIt
 7HdAym4/Bl3G26YgYCWbIdol8HB1bwIXzP2xPCsOn3wNdub80k9xlr7oFtYRTTYyDrCO
 YauaFQSx+ZBdFQ31E+c19/jgv1kw+F8GMD2WktfJO+bRXNuchP+hIQ1CgpkDSq2nyf8M
 LWXPnqTBmsHn4WgOiV4Yn1hrk/wHEIHvtninSXZv/okAbCabbjRum+s9bQhPP5prjS4X
 ON9Q==
X-Gm-Message-State: APjAAAW1OZk2nBtLhYrRDkiTv+1PuI1OJjxC/SXIww+5JgnRVcDAqdNf
 AYQJ/taeCHabMc3yB9H1wUewmXPxPFjMs/EGTc8=
X-Google-Smtp-Source: APXvYqxNUW2V/x3bOMnZ05VKNVgzxnJ2NU+FvPulnz1Jo+GJsNantfML25omgIshNRnJ55oQWa19z1N1zrk2FqiLlk4=
X-Received: by 2002:a5d:5381:: with SMTP id d1mr34947834wrv.259.1580306055813; 
 Wed, 29 Jan 2020 05:54:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <fcf622c778b440f4ef2a0cbe707e018216a3aaab.1580148227.git.tamas.lengyel@intel.com>
 <a74262f0-0417-7a74-de07-b1c36a7d76ab@suse.com>
In-Reply-To: <a74262f0-0417-7a74-de07-b1c36a7d76ab@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 29 Jan 2020 06:53:39 -0700
Message-ID: <CABfawhmiyEj8-YhphMDyErGN2RXSb=zhFN8WG-pREeHT1mPzDg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 7/9] xen/mem_access: Use
 __get_gfn_type_access in set_mem_access
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNjoxMCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gVXNlIF9fZ2V0X2dmbl90eXBlX2FjY2VzcyBpbnN0ZWFkIG9mIHAybS0+Z2V0X2Vu
dHJ5IHRvIHRyaWdnZXIgcGFnZS1mb3JraW5nCj4gPiB3aGVuIHRoZSBtZW1fYWNjZXNzIHBlcm1p
c3Npb24gaXMgYmVpbmcgc2V0IG9uIGEgcGFnZSB0aGF0IGhhcyBub3QgeWV0IGJlZW4KPiA+IGNv
cGllZCBvdmVyIGZyb20gdGhlIHBhcmVudC4KPgo+IFlvdSB0YWxraW5nIG9mIHBhZ2UtZm9ya2lu
ZyBoZXJlLCBkb24ndCB5b3UgbWVhbiAuLi4KPgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL21l
bV9hY2Nlc3MuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ID4gQEAg
LTMwMywxMSArMzAzLDEwIEBAIHN0YXRpYyBpbnQgc2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFp
biAqZCwgc3RydWN0IHAybV9kb21haW4gKnAybSwKPiA+ICAgICAgQVNTRVJUKCFhcDJtKTsKPiA+
ICAjZW5kaWYKPiA+ICAgICAgewo+ID4gLSAgICAgICAgbWZuX3QgbWZuOwo+ID4gICAgICAgICAg
cDJtX2FjY2Vzc190IF9hOwo+ID4gICAgICAgICAgcDJtX3R5cGVfdCB0Owo+ID4gLQo+ID4gLSAg
ICAgICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJtLCBnZm4sICZ0LCAmX2EsIDAsIE5VTEwsIE5V
TEwpOwo+ID4gKyAgICAgICAgbWZuX3QgbWZuID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwg
Z2ZuX3goZ2ZuKSwgJnQsICZfYSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQMk1fQUxMT0MsIE5VTEwsIGZhbHNlKTsKPgo+IC4uLiBQMk1fVU5TSEFSRSBo
ZXJlPwoKTm8sIFAyTV9VTlNIQVJFIGlzIG9ubHkgcmVxdWlyZWQgaWYgeW91IGFyZSBkb2luZyBh
IG1lbW9yeSB3cml0ZS4KU2V0dGluZyBtZW1vcnkgYWNjZXNzIHBlcm1pc3Npb25zIGlzIG5vdCBh
IG1lbW9yeSB3cml0ZSwgc28gaXQncwpzdWZmaWNpZW50IHRvIGp1c3QgYWxsb2NhdGUgdGhlIHAy
bSBlbnRyeS4gUDJNX0FMTE9DQVRFIGFsc28KZW5jb21wYXNzZXMgZm9ya2luZyB0aGUgZW50cnkg
aWYgdGhlcmUgaXMgYSBwYXJlbnQgVk0uCgo+Cj4gQWxzbyBzaG91bGRuJ3QgeW91IGhhdmUgQ2Mt
ZWQgUGV0cmUgYW5kIEFsZXhhbmRydSBvbiB0aGlzIHBhdGNoCj4gKGZvciB0aGVpciBSOiBlbnRy
aWVzKSBhbmQgYXQgbGVhc3QgR2VvcmdlIChwZXJoYXBzIGFsc28gQW5kcmV3Cj4gYW5kIG1lKSB0
byBnZXQgYW4gYWNrLCBzZWVpbmcgdGhhdCB5b3UncmUgdGhlIG9ubHkgbWFpbnRhaW5lcgo+IG9m
IHRoZSBmaWxlPwoKSSd2ZSByYW4gLi9hZGRfbWFpbnRhaW5lcnMucGwgb24gdGhlIHBhdGNoZXMs
IG5vdCBzdXJlIHdoeSBub29uZSBlbHNlIGdvdCBDQy1kLgoKVGFtYXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
