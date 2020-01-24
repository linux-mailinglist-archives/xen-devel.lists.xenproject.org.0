Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837614868E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 15:08:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuzaN-0007lc-Ua; Fri, 24 Jan 2020 14:05:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GXWj=3N=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuzaM-0007lX-Sx
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 14:05:22 +0000
X-Inumbo-ID: 8f2e8e90-3eb2-11ea-b833-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f2e8e90-3eb2-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 14:05:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j1so2641728lja.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1dZZ6Ws5WgaJNJiq4Aay1OPKxetD7SiN/vQFfJHOG1Y=;
 b=XxZsPuRlhlw+5Di0m6XFofLOKWsHgIVFQBLftHlI9xL1loy+kFEnOV+YtVjfl+0IaH
 gqAtK4MqXFTUHeQl5XiDNCyKTdv/HbrI4JiS22/426jMYc+yRELUst32wa/SLrHyj7Iy
 JregPNEn/IBwi/IjDK4tr5HyRPkybRQsZXAy9o6DONuoDBpMCyHgsndr+6vwa36Ui9FV
 IBHkusc61fXadcKwES5u1bhECMwN4HiJ86Ky+iZaNcTz9AEnUPcQh4RGngs388b3PkJn
 eUyzE4HCNIyvDAPhBs8FpgtRXQhYW7Guseyra34Yo2Deb3yJhO2jUqq2aPdSmrGoDWKy
 0olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1dZZ6Ws5WgaJNJiq4Aay1OPKxetD7SiN/vQFfJHOG1Y=;
 b=g9QAGE0AxmgOFAAr1Bnupld27uromci0ZGuRqLrZpRvkW5ZNFXF1cFgLYX5Cf+JlZv
 h2mq112+i7yXmSVxwprlgP0tLuUatkHI5gj8KGCChwS/wyyXyNge4D95ZALgIQr0HfPr
 PG5LrvtRnzLUQl1uXtJ+2n+o2v7RwP0pBjDs0hzWFLBwTAWy3AQGvhdcRHYRNMON5jpQ
 cKinB6eQGACL8EuBCaoH6wfpMX+/41xsx2uYEeUc/OYMOrBt/6NfMdQtTjZYv2ll7dmv
 ZJPdPE75Ngsmh/Tese3IJpH841+D2sO2rtXjqOZVLJVWpRA/qeTvcKWAI+BwE7b43/L/
 TgyQ==
X-Gm-Message-State: APjAAAUHVxFEgB0Hp2Q2HEdE+a7ZVH6tUE7rvCXh39EXOqbUVi0Wx0Rp
 JRzwMpfWnFxuFxaqOu8qp+HT6wCe3AzDxt5B/Hc=
X-Google-Smtp-Source: APXvYqx25zyzKmbNXGMNMkwwt9LyhrU/rFfbRx8BI/TUde8SGhqgVFT3H4HSwe0p1YVVJ/qfjoaPDwsGpEoqSyqDHIU=
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr2397098ljc.246.1579874720906; 
 Fri, 24 Jan 2020 06:05:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <8d8515cabfdc666bd1afb40f6b7e44ccbe362dbf.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpsuravUxpu2mgyWc4AWYkvUHc9rQvV=bSSCXQ0z+29VgQ@mail.gmail.com>
 <20200121234611.GV1314@mail-itl>
In-Reply-To: <20200121234611.GV1314@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 24 Jan 2020 09:05:09 -0500
Message-ID: <CAKf6xpvzz39_OH6sEEq4QpumnyO12V23KHTGhBp7sx3GFoLJmQ@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 12/16] libxl: use vchan for QMP access
 with Linux stubdomain
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgNjo0NiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgoKPHNuaXA+Cgo+ID4g
PiArc3RhdGljIHZvaWQgc3Bhd25fcW1wX3Byb3h5KGxpYnhsX19lZ2MgKmVnYywKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fc3R1Yl9kbV9zcGF3bl9zdGF0ZSAqc2Rz
cykKPiA+ID4gK3sKPiA+ID4gKyAgICBTVEFURV9BT19HQyhzZHNzLT5xbXBfcHJveHlfc3Bhd24u
YW8pOwo+ID4gPiArICAgIGNvbnN0IHVpbnQzMl90IGd1ZXN0X2RvbWlkID0gc2Rzcy0+ZG0uZ3Vl
c3RfZG9taWQ7Cj4gPiA+ICsgICAgY29uc3QgdWludDMyX3QgZG1fZG9taWQgPSBzZHNzLT5wdnFl
bXUuZ3Vlc3RfZG9taWQ7Cj4gPiA+ICsgICAgY29uc3QgY2hhciAqZG9tX3BhdGggPSBsaWJ4bF9f
eHNfZ2V0X2RvbXBhdGgoZ2MsIGRtX2RvbWlkKTsKPiA+ID4gKyAgICBjaGFyICoqYXJnczsKPiA+
ID4gKyAgICBpbnQgbnIgPSAwOwo+ID4gPiArICAgIGludCByYywgbG9nZmlsZV93LCBudWxsOwo+
ID4gPiArCj4gPiA+ICsgICAgaWYgKGFjY2VzcyhTVFVCRE9NX1FNUF9QUk9YWV9QQVRILCBYX09L
KSA8IDApIHsKPiA+ID4gKyAgICAgICAgTE9HRUQoRVJST1IsIGd1ZXN0X2RvbWlkLCAicW1wIHBy
b3h5ICVzIGlzIG5vdCBleGVjdXRhYmxlIiwgU1RVQkRPTV9RTVBfUFJPWFlfUEFUSCk7Cj4gPiA+
ICsgICAgICAgIHJjID0gRVJST1JfRkFJTDsKPiA+ID4gKyAgICAgICAgZ290byBvdXQ7Cj4gPiA+
ICsgICAgfQo+ID4gPiArCj4gPiA+ICsgICAgc2Rzcy0+cW1wX3Byb3h5X3NwYXduLndoYXQgPSBH
Q1NQUklOVEYoImRvbWFpbiAlZCBkZXZpY2UgbW9kZWwgcW1wIHByb3h5IiwgZ3Vlc3RfZG9taWQp
Owo+ID4gPiArICAgIHNkc3MtPnFtcF9wcm94eV9zcGF3bi5waWRwYXRoID0gR0NTUFJJTlRGKCIl
cy9pbWFnZS9xbXAtcHJveHktcGlkIiwgZG9tX3BhdGgpOwo+ID4gPiArICAgIHNkc3MtPnFtcF9w
cm94eV9zcGF3bi54c3BhdGggPSBHQ1NQUklOVEYoIiVzL2ltYWdlL3FtcC1wcm94eS1zdGF0ZSIs
IGRvbV9wYXRoKTsKPiA+Cj4gPiBTaW5jZSB0aGlzIGlzIHRoZSB2Y2hhbi1zb2NrZXQtcHJveHkg
aW4gZG9tMCwgc2hvdWxkIGl0IHdyaXRlIHRvCj4gPiAiZGV2aWNlLW1vZGVsLyV1L3FtcC1wcm94
eS1zdGF0ZSIgdW5kZXJuZWF0aCBkb20wPwo+Cj4gWWVzLCB0aGF0IHdvdWxkIGJlIG1vcmUgY29u
c2lzdGVudC4gQnV0IHBpZCBzaG91bGQgc3RheSB3aGVyZSBpdCBpcwo+IChpdCdzIGFsc28gd2hl
cmUgZG9tMCBxZW11IHBpZCBpcyBiZWluZyB3cml0dGVuKS4KCkhtbSwgdGhhdCBzcGxpdCBiZXR3
ZWVuIHBpZHMgYW5kIGRldmljZS1tb2RlbCBpbmZvIGlzIGEgbGl0dGxlIHdlaXJkLgpCdXQgaXQg
aXMgc3BlY2lmaWVkIGluIGRvY3MgbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MKCj4gPiA+ICsK
PiA+ID4gKyAgICBzZHNzLT5xbXBfcHJveHlfc3Bhd24udGltZW91dF9tcyA9IExJQlhMX0RFVklD
RV9NT0RFTF9TVEFSVF9USU1FT1VUICogMTAwMDsKPiA+ID4gKyAgICBzZHNzLT5xbXBfcHJveHlf
c3Bhd24ubWlkcHJvY19jYiA9IGxpYnhsX19zcGF3bl9yZWNvcmRfcGlkOwo+ID4gPiArICAgIHNk
c3MtPnFtcF9wcm94eV9zcGF3bi5jb25maXJtX2NiID0gcW1wX3Byb3h5X2NvbmZpcm07Cj4gPiA+
ICsgICAgc2Rzcy0+cW1wX3Byb3h5X3NwYXduLmZhaWx1cmVfY2IgPSBxbXBfcHJveHlfc3RhcnR1
cF9mYWlsZWQ7Cj4gPiA+ICsgICAgc2Rzcy0+cW1wX3Byb3h5X3NwYXduLmRldGFjaGVkX2NiID0g
cW1wX3Byb3h5X2RldGFjaGVkOwo+ID4gPiArCj4gPiA+ICsgICAgY29uc3QgaW50IGFycmF5c2l6
ZSA9IDY7Cj4gPiA+ICsgICAgR0NORVdfQVJSQVkoYXJncywgYXJyYXlzaXplKTsKPiA+ID4gKyAg
ICBhcmdzW25yKytdID0gU1RVQkRPTV9RTVBfUFJPWFlfUEFUSDsKPiA+ID4gKyAgICBhcmdzW25y
KytdID0gR0NTUFJJTlRGKCItLXN0YXRlLXBhdGg9JXMiLCBzZHNzLT5xbXBfcHJveHlfc3Bhd24u
eHNwYXRoKTsKPiA+ID4gKyAgICBhcmdzW25yKytdID0gR0NTUFJJTlRGKCIldSIsIGRtX2RvbWlk
KTsKPiA+ID4gKyAgICBhcmdzW25yKytdID0gR0NTUFJJTlRGKCIlcy9kZXZpY2UtbW9kZWwvJXUv
cW1wLXZjaGFuIiwgZG9tX3BhdGgsIGd1ZXN0X2RvbWlkKTsKPiA+Cj4gPiBUaGlua2luZyBvZiBP
cGVuWFQicyBxbXAtaGVscGVyLCB0aGlzIHBhdGggaXNuJ3QgdXNlZnVsLiAgQnV0IGl0IGlzCj4g
PiBmb3IgdmNoYW4tc29ja2V0LXByb3h5LCBzbyBxbXAtaGVscGVyIGNvdWxkIGp1c3QgY2hhbmdl
IHRvIGlnbm9yZSBpdC4KPgo+IEZvciB2Y2hhbiB3ZSBjb3VsZCB1c2UgYWxzbyBhIHBvcnQgbnVt
YmVyIChhbmQgdGhlbiBpdCB3aWxsIGVuY29kZSBpdAo+IGludG8gYSB4ZW5zdG9yZSBwYXRoKS4g
VGhpcyBpcyBpbiBmYWN0IGhvdyB3ZSB1c2UgbGlidmNoYW4gaW4gUXViZXMuIEkKPiBvcHRlZCBm
b3IgZXhwbGljaXQgcGF0aCBvbmx5IGJlY2F1c2Ugb2YgbGFjayBvZiBpZGVhIGZvciBzb21lIG1l
YW5pbmdmdWwKPiBwb3J0IG51bWJlciA7KSBCdXQgSSdtIG9wZW4gZm9yIHN1Z2dlc3Rpb25zLgo+
IEkgZ3Vlc3MgdGhhdCB3b3VsZCBiZSB1c2VmdWwgZm9yIEFyZ28gdmVyc2lvbiB0aGVuLgoKVGhl
IGFyZ28gdmVyc2lvbiBoYXJkIGNvZGVzIHRoZSBwb3J0IG51bWJlciwgc28gaXQncyBub3QgYSBj
b21tYW5kCmxpbmUgYXJndW1lbnQuICBUaGUgcG9ydCBudW1iZXIgd291bGQgbmVlZCB0byBnZXQg
cGFzc2VkIHRvIHRoZQpzdHViZG9tIG9yIGl0IHdvdWxkIG5lZWQgdG8gYmUgc3RhbmRhcmRpemVk
LgoKSSB0aGluayB0aGUgYXJndW1lbnRzIGZvciB2Y2hhbi1zb2NrZXQtcHJveHkgbWFrZSBzZW5z
ZS4gIFNpbmNlIGl0J3MKdGhlIG9uZSB0aGF0J3Mgc3VibWl0dGVkIHVwc3RyZWFtLCBpdCBtYWtl
cyBzZW5zZSB0byB1c2UgdGhlbS4KClB1dCBhbm90aGVyIHdheSwgZG8gd2Ugd2FudCB0aGlzIHRv
IHN1cHBvcnQgYWx0ZXJuYXRlIGltcGxlbWVudGF0aW9ucwpmb3IgYSBxbXAgcHJveHk/ICBTaG91
bGQgdGhlIGFyZ3VtZW50cyBiZSBnZW5lcmljIGZvciB0aGF0IGNhc2U/ClNpbmNlIHRoZSBleGlz
dGluZyBhcmd1bWVudHMgaGF2ZSBlbm91Z2ggaW5mb3JtYXRpb24gZm9yIGVpdGhlciBwcm94eSwK
SSB0aGluayBpdCdzIGZpbmUgdG8gbGVhdmUgaXQgYXMgaXMuICBXaGlsZSB5b3UgY291bGQgaGF2
ZSBhIHdyYXBwZXIKZ2VuZXJhdGUgYWxsIHRoZSBhYm92ZSBmcm9tIGp1c3QgdGhlIGRvbWlkICYg
c3R1Yl9kb21pZCwgdGhhdCdzIGtpbmRhCmhhY2t5LgoKVGhhbmtzLApKYXNvbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
