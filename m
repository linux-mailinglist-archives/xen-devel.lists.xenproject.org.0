Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A3316ABA3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:33:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Gcf-0004as-NU; Mon, 24 Feb 2020 16:30:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6Gce-0004an-CY
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:30:20 +0000
X-Inumbo-ID: f18d6290-5722-11ea-9219-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f18d6290-5722-11ea-9219-12813bfff9fa;
 Mon, 24 Feb 2020 16:30:18 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p14so12550004edy.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 08:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+fBh9rpM2E2SMW1Rfe8tYH+3ntqyZ+PjAyhsgyiAhYY=;
 b=AWuuGJM8xW06KWFkOPTQSCrStkG5PxnfbBNhiD7X3Z3NG1ySuOKbshsQA1PFPvh5ar
 j0QiMbftvyV3eY8z7LQo6nuBsU8BFxmzjoPd4GHYDNGiSp4XrIj+Yn9MH6NUITaM/Z+e
 /5Lhzxt3RdvSLlNwHSh2wzAfFY8PYfxWIYuxN9rONOcxQ7wktDroSfcFMU8XsZQtklNt
 JZiYqdt15egScvIOsk81ju19uF7pNAeWb5GTZ30khNxlUqO7x+FhWg9Df5PS4dLeRfEe
 IEuM8cH3EN12h4+4YdMT+uypk6ALdAewwsnEZtw3whQx5wMWRpmmsmiQrMheLAnqyTM3
 uCMw==
X-Gm-Message-State: APjAAAU5khNSMZaRuW1FJ1NnJS7vQMbypMXaSHlSDzxi033T5JDz/hD0
 ypG5n3T8T011/zmi5iRL4Rw=
X-Google-Smtp-Source: APXvYqxVnTwv6lnq+kIfl/QOvyrJB2yXBGOSwrKnZLCf48AGGXukKwSAzWz6qLl17Qyejd7pzl49tg==
X-Received: by 2002:aa7:da53:: with SMTP id w19mr46767001eds.363.1582561817763; 
 Mon, 24 Feb 2020 08:30:17 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id j15sm809001ejy.55.2020.02.24.08.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 08:30:17 -0800 (PST)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <532a499f00b42299d8035b4ca9c6d7bfcbdc6e1f.1582310142.git.tamas.lengyel@intel.com>
 <b58479ab-94d0-7cc2-72ff-7fbcb1374a40@xen.org>
 <CABfawhk=+bTmjT-T1kehFs=+E01zs_6sou=CjO986aYNvugO0w@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a26f41ca-d85a-9a93-144d-026c82cf53af@xen.org>
Date: Mon, 24 Feb 2020 16:30:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CABfawhk=+bTmjT-T1kehFs=+E01zs_6sou=CjO986aYNvugO0w@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v9 5/5] xen/tools: VM forking toolstack side
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNC8wMi8yMDIwIDE2OjE5LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gTW9u
LCBGZWIgMjQsIDIwMjAgYXQgOToxMyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3
cm90ZToKPj4KPj4gSGkgVGFtYXMsCj4+Cj4+IE9uIDIxLzAyLzIwMjAgMTg6NDksIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPj4+ICtpbnQgbGlieGxfZG9tYWluX2Zvcmtfdm0obGlieGxfY3R4ICpj
dHgsIHVpbnQzMl90IHBkb21pZCwgdWludDMyX3QgKmRvbWlkKQo+Pj4gK3sKPj4+ICsgICAgaW50
IHJjOwo+Pj4gKyAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gY3JlYXRlID0gezB9
Owo+Pj4gKyAgICBjcmVhdGUuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaHZtOwo+Pj4gKyAgICBj
cmVhdGUuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaGFwOwo+Pj4gKyAgICBjcmVhdGUuZmxhZ3Mg
fD0gWEVOX0RPTUNUTF9DREZfb29zX29mZjsKPj4+ICsgICAgY3JlYXRlLmFyY2guZW11bGF0aW9u
X2ZsYWdzID0gKFhFTl9YODZfRU1VX0FMTCAmIH5YRU5fWDg2X0VNVV9WUENJKTsKPj4KPj4gVGhp
cyBpcyB4ODYgc3BlY2lmaWMgYnV0IHNlZW1zIHRvIGJlIHdyaXR0ZW4gaW4gY29tbW9uIGNvZGUu
IERpZCB5b3UKPj4gYnVpbGQgaXQgb24gQXJtPwo+IAo+IEkgaGF2ZSBub3QsIGRvbid0IGhhdmUg
YSBzZXR1cCBmb3IgQVJNIGF0IHRoZSBtb21lbnQuIEkgZ3Vlc3MgSSdsbAo+IGp1c3QgbW92ZSB0
aGlzIGZ1bmN0aW9uIHRvIGxpYnhsX3g4Ni5jIHRvIHJlc29sdmUgdGhlIGlzc3VlLgoKSXQgaXMg
ZmFpcmx5IGVhc3kgdG8gc2V0dXAgYSBidWlsZCBlbnZpcm9ubWVudCBmb3IgQXJtLiBZb3UgY2Fu
IHVzZSBRRU1VIAp1c2VyIGVtdWxhdGlvbiBhbmQgYSBBcm0gcm9vdGZzLgoKPiAKPj4KPj4+ICsK
Pj4+ICsgICAgY3JlYXRlLnNzaWRyZWYgPSBTRUNJTklUU0lEX0RPTVU7Cj4+PiArICAgIGNyZWF0
ZS5wYXJlbnRfZG9taWQgPSBwZG9taWQ7Cj4+PiArICAgIGNyZWF0ZS5tYXhfZXZ0Y2huX3BvcnQg
PSAxMDIzOwo+Pj4gKyAgICBjcmVhdGUubWF4X2dyYW50X2ZyYW1lcyA9IExJQlhMX01BWF9HUkFO
VF9GUkFNRVNfREVGQVVMVDsKPj4+ICsgICAgY3JlYXRlLm1heF9tYXB0cmFja19mcmFtZXMgPSBM
SUJYTF9NQVhfTUFQVFJBQ0tfRlJBTUVTX0RFRkFVTFQ7Cj4+Cj4+IFRoZSBkb21haW4geW91IGZv
cmsgbWF5IGhhdmUgZGlmZmVyZW50IHZhbHVlcyBoZXJlLiBGcm9tIG15Cj4+IHVuZGVyc3RhbmRp
bmcsIHRoZSBmb3JrIHJlcXVpcmVzIHRvIGhhdmUgdGhlIHNhbWUgcGFyYW1ldGVycyBhcyB0aGUK
Pj4gcGFyZW50LiBTbyBob3cgZG8geW91IGVuc3VyZSB0aGV5IGFyZSB0aGUgc2FtZT8KPiAKPiBU
aGUgcGFyZW50IGRvbWFpbiBpcyBjcmVhdGVkIGJ5IHhsLiBJZiB5b3UgY3JlYXRlIGEgZG9tYWlu
IHdpdGggeGwgaXQKPiB3aWxsIGhhdmUgdGhlc2UgcGFyYW1ldGVycyBzZXQgYnkgZGVmYXVsdC4K
CkkgaG9wZSB5b3UgYXJlIGF3YXJlIHRoYXQgeW91IGNhbiBvdmVycmlkZSBtb3N0IG9mIHRob3Nl
IHBhcmFtZXRlcnMgaW4gCnRoZSBndWVzdCBjb25maWd1cmF0aW9uIGZpbGUuIEl0IHdvdWxkIGJl
IGdvb2QgdG8gYXQgbGVhc3Qgd3JpdGUgZG93biAKdGhlIGxpbWl0YXRpb25zIHNvIHBlb3BsZSBk
b2Vzbid0IHNwZW5kIGFnZXMgZmlndXJpbmcgb3V0IHdoeSBpdCBkb2VzIApub3Qgd29yay4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
