Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6571075F4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 17:47:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYC30-000620-On; Fri, 22 Nov 2019 16:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nz3w=ZO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iYC2z-00061T-IN
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 16:44:41 +0000
X-Inumbo-ID: 605aa5e6-0d47-11ea-984a-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 605aa5e6-0d47-11ea-984a-bc764e2007e4;
 Fri, 22 Nov 2019 16:44:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l1so8134192wme.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2019 08:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FhHEfGBiDXLRbHA9PfTYZOCuvGg6JYrHqtfEI5mDET8=;
 b=CMq1+ys5HcuL8HgTzM9zfbxpv4VaVYnU7mQ7Egq/NB+iwcxIWwiWe/Vn8hXdVZNcxW
 BAmSWkE087lXznRiPoDQ0ZrUHUEYBrfaoJ1h0agTo0qIV3AzzVaXJUgFxqrTrLoQE+4a
 MvGArVjW7uSTuPCYMiwSFJwxJjoUO2UCT+hHiLshgma+tYLflUpTHEE4OAlEYKKa4qOd
 kb4XnL2D54HwotO0h4C4jKjknc8A+5rP2BWYzxX4Z9wyHsoKOOpQAjFTZH8VVzHodMZO
 MG5lN8vRbtZxqB+JbmFFTNElCL9J8SJaqy/Qktr024n54ymnQHBwapETIWztFLb787wm
 RnPQ==
X-Gm-Message-State: APjAAAWIO+XPuHoNjVxgDPJ9XdDk5wU1TMqvF1qASPFnlHfn4ZhD5wcB
 GZKLJXHPWBquFUBIg01/O2E=
X-Google-Smtp-Source: APXvYqzJ+NdXTIs5suq3aIjS3xJiBJLOyOmTn9ZdtxFIc4e6+MVnjp8+yrA9qAqDUJU0BMj0ez663w==
X-Received: by 2002:a1c:560b:: with SMTP id k11mr18480814wmb.153.1574441079515; 
 Fri, 22 Nov 2019 08:44:39 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id z4sm4260072wmf.36.2019.11.22.08.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 08:44:38 -0800 (PST)
Date: Fri, 22 Nov 2019 16:44:36 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20191122164436.3yiivi5apbbwyt3a@debian>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-2-al1img@gmail.com>
 <20191122151846.GG1425@perard.uk.xensource.com>
 <673d7677-57c6-8d08-8b7d-d8728b90035e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <673d7677-57c6-8d08-8b7d-d8728b90035e@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 1/3] libxl: introduce new backend type
 VINPUT
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
Cc: wl@xen.org, ian.jackson@eu.citrix.com, Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDQ6NDM6MDNQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyMi4xMS4xOSAxNjoxOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBPbiBU
aHUsIE5vdiAyMSwgMjAxOSBhdCAwODoxMjo1OFBNICswMjAwLCBPbGVrc2FuZHIgR3J5dHNvdiB3
cm90ZToKPiA+ID4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVw
YW0uY29tPgo+ID4gPiAKPiA+ID4gVGhlcmUgYXJlIHR3byBraW5kIG9mIFZLQkQgZGV2aWNlczog
d2l0aCBRRU1VIGJhY2tlbmQgYW5kIHVzZXIgc3BhY2UgUFYKPiA+ID4gYmFja2VuZC4gSW4gY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiB0aGV5IGNhbid0IGJlIGRpc3Rpbmd1aXNoZWQgYXMgYm90aCB1
c2UKPiA+ID4gVktCRCBiYWNrZW5kIHR5cGUuIEFzIHJlc3VsdCwgdXNlciBzcGFjZSBQViBLQkQg
YmFja2VuZCBpcyBzdGFydGVkIGFuZAo+ID4gPiBzdG9wcGVkIGFzIFFFTVUgYmFja2VuZC4gVGhp
cyBjb21taXQgYWRkcyBuZXcgZGV2aWNlIGtpbmQgVklOUFVUIHRvIGJlCj4gPiA+IHVzZWQgYXMg
YmFja2VuZCB0eXBlIGZvciB1c2VyIHNwYWNlIFBWIEtCRCBiYWNrZW5kLgo+ID4gPiAKPiA+ID4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0u
Y29tPgo+ID4gPiBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4gPiAKPiA+IFRoYXQgcGF0Y2ggcmVtb3ZlcyB0aGUgImJhY2tlbmQtdHlwZSIgbm9kZSBm
cm9tIHhlbnN0b3JlIGJ1dCBpdCB3YXNuJ3QKPiA+IHBhcnQgb2YgdGhlIGFwaSAoa2JkaWYuaCkg
YW5kIHFlbXUgZG9lc24ndCByZWFkLCBpdCBzbyBJIGd1ZXNzIHRoYXQncwo+ID4gZmluZToKPiA+
IAo+ID4gQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
Pgo+IAo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CkkgdGFrZSBpdCB0aGlzIGFwcGxpZXMgdG8gYm90aCBwYXRjaCAxIGFuZCAzPwoKV2VpLgoKPiAK
PiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
