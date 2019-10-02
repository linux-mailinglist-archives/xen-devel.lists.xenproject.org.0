Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F0C4B92
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbyL-0005Qz-I5; Wed, 02 Oct 2019 10:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uMoo=X3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFbyK-0005Qu-2M
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:35:04 +0000
X-Inumbo-ID: 1b0474aa-e500-11e9-b588-bc764e2007e4
Received: from mail-wm1-f49.google.com (unknown [209.85.128.49])
 by localhost (Halon) with ESMTPS
 id 1b0474aa-e500-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 10:33:43 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id y135so4606100wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 03:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3N34ICJw/459MbCpfDqcXDV0ZLolHFa5nB7RORfzPB0=;
 b=W7bzL8YgYiTHN6nYT0XqIK4RlW4lDbuzAzlCX1U7lL2TrOxqYk5uRuyk7Um+R3FxVh
 B4uwPAa15MuT9kf1QpcWZrd/s3TR0ZH1FQiGLx0Rc4aG1KA47HiwGBM8Q9Q5pgrPgsbr
 4qimQtdE8osaFyN/386aDeH8WUdejV6AY8YI4NIGEo3W6TBKQqhptZ2RnWxgNuitZLf9
 BfNLs7W8NsKXlq8mQZRDqgQ9CQuIHiGBmtn1pAWrcDB3+SaQhq7MuR9Rmh1XOeVySeTE
 hvFSWetYN3OIQwRQM3V/bRp8a2ytGNHL1OPavUIiZxOlvcdgumBfhaXegheTn7Wip9sV
 k5yA==
X-Gm-Message-State: APjAAAWREVIrq+9L7mcB25HL29BnB0saLhJgoqX5KuQzbqIvKnCVnfwx
 XEpdJ/KTCzUHh45yjuvrKvw=
X-Google-Smtp-Source: APXvYqzm2tEaeOyQAM/uqn9W3vSjzYNvXGebX8ulJtrbeVphs5xwie7s+ACSh36ixLceJPRLiWgupw==
X-Received: by 2002:a1c:c14a:: with SMTP id r71mr2378043wmf.46.1570012422407; 
 Wed, 02 Oct 2019 03:33:42 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id z9sm29500826wrp.26.2019.10.02.03.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 03:33:41 -0700 (PDT)
Date: Wed, 2 Oct 2019 11:33:40 +0100
From: Wei Liu <wl@xen.org>
To: Kateryna Razumova <katereenart@gmail.com>
Message-ID: <20191002103340.vxqzkwcptpw7lhol@debian>
References: <CAFjkr2qCb7ZoOAx2A_oFE1znjpia=2Auk+XePybfWbk8jB-9Nw@mail.gmail.com>
 <CAFjkr2qskyxgtoZzToNXWAZPnN=5fbEiWpZO3P+Lq=1PiiEZPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFjkr2qskyxgtoZzToNXWAZPnN=5fbEiWpZO3P+Lq=1PiiEZPg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] I want to participate in Outreachy with CONFIG_PDX
 related project
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgS2F0ZXJ5bmEKClRoYW5rcyBmb3IgeW91ciBpbnRlcmVzdCBpbiB0aGlzIHByb2plY3QuCgpP
biBXZWQsIE9jdCAwMiwgMjAxOSBhdCAxMjozNzozMEFNICswMjAwLCBLYXRlcnluYSBSYXp1bW92
YSB3cm90ZToKPiBIZWxsbywKPiBJIHdhbnQgdG8gbWFrZSB0aGUgZmlyc3QgY29udHJpYnV0aW9u
IGZvciB4ZW4uIEkgd2FudCB0byBwYXJ0aWNpcGF0ZSB3aXRoOgo+IEludHJvZHVjZSBDT05GSUdf
UERYIGFuZCB1c2UgaXQgaW4gWGVuIGh5cGVydmlzb3IKPiAKPiBXaGVyZSBjYW4gSSBzdGFydD8K
ClBsZWFzZSByZWFkIGFsbCByZWZlcmVuY2UgbWF0ZXJpYWxzIGZvciB0aGF0IHByb2plY3QuCgpZ
b3Ugd2lsbCBuZWVkIHRvIG1ha2Ugc3VyZSB5b3UgaGF2ZSB0aGUgaGFyZHdhcmUgdGhhdCdzIGNh
cGFibGUgb2YKcnVubmluZyBYZW4uIElmIHlvdSBoYXZlIHJlYWQgdGhlIHByb2plY3QgZGVzY3Jp
cHRpb24gYW5kIGhhdmUgbW9yZQpzcGVjaWZpYyBxdWVzdGlvbnMsIHBsZWFzZSBhc2suCgo+IEkg
aGF2ZSBmZXcgeWVhcnMgb2YgQyBwcm9ncmFtbWluZyBleHBlcmllbmNlIGJ1dCBuZXZlciBoYWQg
Y29udHJpYnV0ZWQgdG8KPiBvcGVuLXNvdXJjZSBwcm9qZWN0cyBiZWZvcmUuCj4gCj4gT24gV2Vk
LCAyNSBTZXAgMjAxOSBhdCAxMToyNywgS2F0ZXJ5bmEgUmF6dW1vdmEgPGthdGVyZWVuYXJ0QGdt
YWlsLmNvbT4KPiB3cm90ZToKPiA+Cj4gPiBIZWxsbyB4ZW4sCj4gPiBJIHdvdWxkIGxpa2UgdG8g
cGFydGljaXBhdGUgaW4gT3V0cmVhY2h5LiBJIHdhcyByZWdpc3RlcmVkIG9uIHRoZSBzaXRlCj4g
ZmV3IGRheXMgYWdvLCBmaWxsZWQgc29tZSBxdWl0ZSBhIGJpZyBmb3JtIGJ1dCBzdGlsbCBjYW4n
dCBzZWUgdGFza3MnCj4gZGVzY3JpcHRpb25zLgo+ID4gU2luY2UsIEkgbGlrZSBDIHByb2dyYW1t
aW5nIEkgd291bGQgbGlrZSB0byBrbm93IG1vcmUgYWJvdXQgIkludHJvZHVjZQo+IENPTkZJR19Q
RFggYW5kIHVzZSBpdCBpbiBYZW4gaHlwZXJ2aXNvciIuIFdoYXQgaGFyZHdhcmUgZG8gSSBuZWVk
PyBJIHRoaW5rCj4gSSBjYW4gZmluZCBhbiBvbGQgbGFwdG9wIHdpdGggdmlydHVhbGl6YXRpb24g
c3VwcG9ydC4gQWxzbywgaG93IGNhbiBJIHN0YXJ0CgpZZXMuIEZpbmQgYSBsYXB0b3Agd2l0aCB2
aXJ0dWFsaXNhdGlvbiBzdXBwb3J0LiBJbnN0YWxsIHlvdXIgY2hvaWNlIG9mCnZpcnR1YWxpc2F0
aW9uIHNvZnR3YXJlLCBhbmQgdGhlbiBpbnN0YWxsIGEgWGVuIHN5c3RlbSBmcm9tIHNvdXJjZSBp
biBpdC4KCkZvciBjb250cmlidXRpbmcsIEkgc3VnZ2VzdCB5b3UgY2xvbmUgeGVuLmdpdCBmcm9t
CgogICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0CgphbmQgaGF2ZSBh
IGxvb2sgYXQgeGVuLyBkaXJlY3RvcnksIHdoaWNoIGNvbnRhaW5zIHRoZSBoeXBlcnZpc29yIHNv
dXJjZQpjb2RlIHlvdSB3aWxsIHdvcmsgb24uIFN1Ym1pdCBhIHBhdGNoIG9yIHBhdGNoZXMuIFRo
ZXkgY2FuIGJlIGFzIGVhc3kgYXMKZml4aW5nIHR5cG9zIG9yIGFzIGNvbXBsZXggYXMgZml4aW5n
IGEgcmVhbCBidWcgdGhhdCB5b3UgZmluZC4KCldlaS4KCj4gY29udHJpYnV0aW5nPwo+ID4gSSBo
YXZlIGZldyB5ZWFycyBvZiBDIHByb2dyYW1taW5nIGV4cGVyaWVuY2UgYnV0IG5ldmVyIGhhZCBj
b250cmlidXRlZCB0bwo+IG9wZW4tc291cmNlIHByb2plY3RzIGJlZm9yZS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
