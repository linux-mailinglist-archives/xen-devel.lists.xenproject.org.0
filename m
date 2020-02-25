Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD2816C233
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:24:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aAK-0007zm-7c; Tue, 25 Feb 2020 13:22:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1EaD=4N=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j6aAI-0007zg-Hg
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:22:22 +0000
X-Inumbo-ID: da8c3620-57d1-11ea-a490-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da8c3620-57d1-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 13:22:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m16so14677071wrx.11
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 05:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7R46UcUyW4DsIJdmNad4e28nuizHuhs4ISptcO0+45A=;
 b=jamCADBGIdJfyFSSOrsj7tkF0BiiGsGveV3BS4NaHQR5Kisxo6hUBgWddHS0z9k7lk
 48Dw7WESPZWsAxAgX04b2fIDkQa/N+BZ0YmZ3ody3qzcFINNRrZ8M9Q5o6LNdvXfhCku
 4hrYfd8AFQzCvLLJOCvbXEQRNZ1/4CgqTRAcX3vjCC0CF6SdIuXOpIncpxB+h3fesFCC
 CexAlie8+pKiSYGjHmz18W5mibb3L4u5Wxi5p3TcDACN5pSiStUzpGAJwFWROhzWBm9C
 cewFfYGQ1zNk0BH6SSLHbtmpOe5t7lI7U5l6f7vz5YAOw3rvYi3tD1ow+soCufIcTSVf
 JpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7R46UcUyW4DsIJdmNad4e28nuizHuhs4ISptcO0+45A=;
 b=rMWkFBXfgpwSyCo8OWpNwmwiIBvd6vKOPDbsBXBaiS9x0ZVqp+3Ccm8vN8GZmYDvm9
 IAhCX3UDWPML50JCiruxXn7nAiJ/69CQBLSNAY7JCcGNMrMEaD3YLupMs+R86m2QdgFI
 Jf0PDjF9KT+o2w+JdxlsKYV0vJOlCBIaDUvnjSDMXpn3vk9/XbM1geE54nuI87D0l5a4
 TKokYo3qFh9KDOi0vojaYdpT+TcqVZTeSilhVkX83knigtxeMT/Lc9qckhiGcEMnIyYD
 h4e1hqh+D6p7YPB85LjvHg0f52CfSoVYbB/MKlHKbkbKCLbnFZVLKj3YnHL5iuS6y9j7
 AV8g==
X-Gm-Message-State: APjAAAWixsAIZdyChrsKa+MYQMhm5/5SvoDslOoOpXSd4rPeMH57sLwR
 gPJTJ11zeCp4Yiyy7Ae/P00TgAEf4xIYGE8fD1o=
X-Google-Smtp-Source: APXvYqwWtpxAAqDLIfVMb5kzZVPBIpdkpUDIU8MI8e0UdayqZOSJqp8WQORqpo00TJdweckO8/MiljwkAeDRv7EXm/A=
X-Received: by 2002:adf:f986:: with SMTP id f6mr75847294wrr.182.1582636941060; 
 Tue, 25 Feb 2020 05:22:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <8ccfd49088b2c811415f0c09886133a936e460d2.1582310142.git.tamas.lengyel@intel.com>
 <20200224152051.GS4679@Air-de-Roger>
 <019af1f3-5fd8-5842-ae48-69c490f143da@suse.com>
In-Reply-To: <019af1f3-5fd8-5842-ae48-69c490f143da@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 25 Feb 2020 06:21:45 -0700
Message-ID: <CABfawh=jCfJeagD7_TM3wFf9iJOm2pBBjw0z2b7v3=2mKt5DfA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v9 1/5] xen/x86: Make hap_get_allocation
 accessible
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgNjoxNyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjQuMDIuMjAyMCAxNjoyMCwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPiA+IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDEwOjQ5OjE5QU0gLTA4MDAsIFRhbWFz
IEsgTGVuZ3llbCB3cm90ZToKPiA+PiBEdXJpbmcgVk0gZm9ya2luZyB3ZSdsbCBjb3B5IHRoZSBw
YXJlbnQgZG9tYWluJ3MgcGFyYW1ldGVycyB0byB0aGUgY2xpZW50LAo+ID4+IGluY2x1ZGluZyB0
aGUgSEFQIHNoYWRvdyBtZW1vcnkgc2V0dGluZyB0aGF0IGlzIHVzZWQgZm9yIHN0b3JpbmcgdGhl
IGRvbWFpbidzCj4gPj4gRVBULiBXZSdsbCBjb3B5IHRoaXMgaW4gdGhlIGh5cGVydmlzb3IgaW5z
dGVhZCBkb2luZyBpdCBkdXJpbmcgdG9vbHN0YWNrIGxhdW5jaAo+ID4+IHRvIGFsbG93IHRoZSBk
b21haW4gdG8gc3RhcnQgZXhlY3V0aW5nIGFuZCB1bnNoYXJpbmcgbWVtb3J5IGJlZm9yZSAob3IK
PiA+PiBldmVuIGNvbXBsZXRlbHkgd2l0aG91dCkgdGhlIHRvb2xzdGFjay4KPiA+Pgo+ID4+IFNp
Z25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Cj4g
Pgo+ID4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+Cj4gQW5kIHdpdGggbWFpbnRhaW5lcnNoaXAgbm93IGhhdmluZyBjaGFuZ2VkCj4KPiBBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gPiBJIHdvdWxkIGFsc28g
YmUgZmluZSB3aXRoIHRoaXMgbWVyZ2VkIGludG8gdGhlIHJlc3BlY3RpdmUgcGF0Y2ggd2hlcmUK
PiA+IGhhcF9nZXRfYWxsb2NhdGlvbiBnZXRzIGNhbGxlZC4KPgo+IEluZGVlZCB0aGF0J3MgdGhl
IHJlYXNvbiB3aHkgdGhpcyBoYXNuJ3QgZ29uZSBpbiB5ZXQsIEkgdGhpbmsuCj4gVGhlcmUncyBu
byB1c2UgZnJvbSBwdXR0aW5nIGl0IGluIHdpdGhvdXQgYWxzbyBwdXR0aW5nIGluIHRoZQo+IHBh
dGNoIHdoZXJlIHRoaXMgaXMgYWN0dWFsbHkgbmVlZGVkLiBJbiBmYWN0IGl0IGludHJvZHVjZXMg
YQo+ICJzdHJheSBsYWNrIG9mIHN0YXRpYyIgaW5zdGFuY2UgdW50aWwgdGhlbiwgd2hpY2ggdHlw
aWNhbGx5IHdlCj4gdHJ5IHRvIGNsZWFuIHVwLgoKSSBjYW4gY2VydGFpbmx5IGZvbGQgaXQgaW4g
dG8gdGhlIGxhcmdlciBwYXRjaCBpZiB0aGF0J3MgcHJlZmVycmVkLgoKVGFtYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
