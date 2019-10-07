Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B578ACE06A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 13:28:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHR8h-000419-8D; Mon, 07 Oct 2019 11:25:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hoFu=YA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iHR8g-000414-9J
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 11:25:18 +0000
X-Inumbo-ID: 233dfe23-e8f5-11e9-97ab-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 233dfe23-e8f5-11e9-97ab-12813bfff9fa;
 Mon, 07 Oct 2019 11:25:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n14so14777906wrw.9
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 04:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6j+Rfgpih8ioJOk1Ej2SJtZahiQJ0OyQWYW6gcu6/1U=;
 b=Cosh3MN9nDDRrgG3lZW/CEX/Kag3K+QkAq/MXsdHA+9HFulvbf0YrO0XceYcJml68C
 y1rsByQ1AT15NIaJGUk96uChtzTot5Lx4Fxb8ZQCdlNr+0WBiIIqdpei1Nb5MNRQwntF
 d8duwf/l1/zOczUMZTktiIM3zpajduxrluhm5o0B6t4nIXZUNzBma/8d8aLlQnTGKMGA
 025LqIZBvWcKPWlksHN8GKgFxgnzHfuHG2pVbioCZ8gfebtP1gTFGj3Qnfc79LsxR7Ne
 xI7+4qrPFNhcSIYobIb1wYF8vaSPXM0/Tq8iEYUcRRqHnlqARnFTMvhHeTUO6L8Akngh
 mTmA==
X-Gm-Message-State: APjAAAWV0KNgFSpIYZmBSQN57q+raSUb1wgPf5HAFlE0RYK8VURPR+Y2
 8GQTtICdB4WGEkmyv2/+SDU=
X-Google-Smtp-Source: APXvYqy5dwiFguGHNGMVfC9U9Mr0eGrwEgMGdnQTkJuQnVhdzfc3Lwk+UjqoLbXJ8JaPlUQ8efZb0w==
X-Received: by 2002:a5d:6347:: with SMTP id b7mr16362058wrw.131.1570447516724; 
 Mon, 07 Oct 2019 04:25:16 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id r2sm31021138wma.1.2019.10.07.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 04:25:16 -0700 (PDT)
Date: Mon, 7 Oct 2019 12:25:14 +0100
From: Wei Liu <wl@xen.org>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20191007112514.szc7myjhcb2hkp3h@debian>
References: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
 <20191004085728.ba4tpw6gfvhcaowz@debian>
 <1B611AEA-677A-47CF-8F6D-BA811F0D5330@citrix.com>
 <CAK9nU=pUpSfOJrh7cOjVZmCsgfr79C2txdqYUyfvrQCxQweCnA@mail.gmail.com>
 <89DCD1DE-6232-46DA-86D6-C0E671885671@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89DCD1DE-6232-46DA-86D6-C0E671885671@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMTE6MDc6MDNBTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiAKPiAKPiDvu79PbiAwNy8xMC8yMDE5LCAxMDowMSwgIldlaSBMaXUiIDx3bEB4ZW4ub3Jn
PiB3cm90ZToKPiAKPiAgICAgT24gTW9uLCA3IE9jdCAyMDE5IGF0IDA5OjEzLCBMYXJzIEt1cnRo
IDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+IHdyb3RlOgo+ICAgICA+Cj4gICAgID4KPiAgICAgPgo+
ICAgICA+IE9uIDA0LzEwLzIwMTksIDA5OjU3LCAiV2VpIExpdSIgPHdsQHhlbi5vcmc+IHdyb3Rl
Ogo+ICAgICA+Cj4gICAgID4gICAgIE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA0OjEyOjMwUE0g
KzAwMDAsIExhcnMgS3VydGggd3JvdGU6Cj4gICAgID4gICAgID4gU3BlY2lmaWNhbGx5Cj4gICAg
ID4gICAgID4gKiB4ZW4ub3JnIHRvIHhlbnByb2plY3Qub3JnCj4gICAgID4gICAgID4gKiBodHRw
IHRvIGh0dHBzCj4gICAgID4gICAgID4gKiBSZXBsYWNlZCBwYWdlcyB3aGVyZSBwYWdlIGhhcyBt
b3ZlZAo+ICAgICA+ICAgICA+ICAgKGluY2x1ZGluZyBvbiB4ZW4gcGFnZXMgYXMgd2VsbCBhcyBl
eHRlcm5hbCBwYWdlcykKPiAgICAgPiAgICAgPiAqIFJlbW92ZWQgc29tZSBVUkxzIChlLmcuIGRv
d25sb2FkcyBmb3IgTGludXggUFYgZHJpdmVycykKPiAgICAgPiAgICAgPgo+ICAgICA+ICAgICA+
IFRlc3RlZC1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+ICAgICA+ICAg
ICA+IFNpZ25lZC1vZmYtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KPiAg
ICAgPgo+ICAgICA+ICAgICBEbyB5b3UgaGF2ZSBhIGJyYW5jaCBmb3IgdGhpcyBwYXRjaD8KPiAg
ICAgPgo+ICAgICA+IFVuZm9ydHVuYXRlbHksIG5vdDogSSBuZXZlciBjcmVhdGVkIGEgcGVyc29u
YWwgY29weSBvZiB4ZW4uZ2l0IG9uIHhlbmJpdHMKPiAgICAgPiBSZWFsbHkgc2hvdWxkIGRvIHRo
aXMKPiAgICAgCj4gICAgIFBsZWFzZSBkby4gSSBjb3VsZG4ndCByZXBseSB0aGlzIHBhdGNoIGNs
ZWFubHkuIE5vdCBzdXJlIHdoeSBnaXQKPiAgICAgd2Fzbid0IGhhcHB5IGFib3V0IGl0Lgo+ICAg
ICAKPiAgICAgV2VpLgo+ICAgICAKPiBIaSBXZWksCj4gCj4gSSBmaXhlZCB0aGUgbWlzc2luZyBo
dHRwIGxpbmsgYW5kIHJlYmFzZWQgdG8gc3RhZ2luZwo+IFNlZSBodHRwOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD1wZW9wbGUvbGFyc2sveGVuLmdpdDthPWNvbW1pdDtoPTA4OGMyNzgxNzk1
YzU5MjRjZDFmYzdmMTFmM2QzMTE1NGQ4NjY3OTkgJiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1wZW9wbGUvbGFyc2sveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9kb2Nz
LWNoYW5nZXMtNC4xMy12MiAKClRoYW5rcy4gSSBoYXZlIHB1c2hlZCB5b3VyIHBhdGNoLgoKPiAK
PiBXaGVuIHJlYmFzaW5nIHRoZXJlIHdhcyBubyBjb25mbGljdCwgc28gbm90IHN1cmUgd2h5IGl0
IGRpZG4ndCBhcHBseSBmb3IgeW91Cj4gCgpJIGZvdW5kIHRoYXQgZ2l0IHNvbWV0aW1lcyBkb2Vz
bid0IGhhbmRsZSBvdXIgZG9jIGNoYW5nZXMgd2VsbC4gTm90IHN1cmUKd2h5LiBOZXZlciBnb3Qg
dG8gdGhlIGJvdHRvbSBvZiBpdC4KCldlaS4KCj4gUmVnYXJkcwo+IExhcnMKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
