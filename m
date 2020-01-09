Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EAB135E8A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 17:44:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iparv-0004B2-T2; Thu, 09 Jan 2020 16:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wgv1=26=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iparu-0004Aw-HU
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 16:41:10 +0000
X-Inumbo-ID: d5eb2ead-32fe-11ea-ba09-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5eb2ead-32fe-11ea-ba09-12813bfff9fa;
 Thu, 09 Jan 2020 16:41:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m24so3660639wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 08:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=msy2hbv9kFY5NsELlmaVnJEZvuT9SlThoUuQke66sWw=;
 b=YWt3zyE3gNm+VZty1pp5haTpsUEoJ3V0q7xxL/XutSE9rqNL9cFcob6tP+myMMhK2w
 2rlwB/ymhMlwYNemhiG1eX/Tu7zY5+pg43dZBKFiRg/JcV7D52xjPPg/TqV1Non0tzAH
 njewIHOM8j75CyLAoONIEslrlSToPw146DnJDadYus+XwHEsLQy3zZeBSKI4r4uqluho
 DqtW/2WZmLLKucIwLOYcpi5Tcw0lS+AxDfpnxjPhP3YiX0O5+zJuu62+HVOP8ElfW3XG
 jcuE2CN0Yk4yMBp1HyDVtw0dVUoHUdesFZvhmzyZbdE/eb+KiJPCXx1U1KaGonXxP6Wl
 2AzA==
X-Gm-Message-State: APjAAAUIreOopehzRI2q1y0RKRRe85LfbIUvSpRNUIeb9n4935Yi0Lp1
 gqgu3F5Br8u1UznZa34grog=
X-Google-Smtp-Source: APXvYqyrXTw0Q/n+KQyE+6TRTkdqDtVjuRjfBJ14fdw5bfFfG2vO0yMH/19Ql61MaaaRdHfeQy5EDQ==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr5572978wmm.145.1578588068893; 
 Thu, 09 Jan 2020 08:41:08 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id i8sm9341747wro.47.2020.01.09.08.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 08:41:08 -0800 (PST)
Date: Thu, 9 Jan 2020 16:41:06 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200109164106.attj6j44qcczixru@debian>
References: <20200109111505.12328-1-pdurrant@amazon.com>
 <20200109135217.wdvaxvp2i7jemqsv@debian>
 <a8596f255bfd46d3adefd4ca7f088056@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8596f255bfd46d3adefd4ca7f088056@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/Rules.mk: fix distclean
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDI6MDI6NTVQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+ID4gU2VudDogMDkgSmFudWFyeSAyMDIwIDEzOjUyCj4gPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgSWFuIEphY2tzb24KPiA+IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUEVSQVJECj4gPiA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRvb2xzL1J1bGVzLm1rOiBm
aXggZGlzdGNsZWFuCj4gPiAKPiA+IE9uIFRodSwgSmFuIDA5LCAyMDIwIGF0IDExOjE1OjA1QU0g
KzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gUnVubmluZyAnbWFrZSBkaXN0Y2xlYW4n
IHVuZGVyIHRvb2xzIHdpbGwgY3VycmVudGx5IHJlc3VsdCBpbjoKPiA+ID4KPiA+ID4gdG9vbHMv
UnVsZXMubWs6MjQ1OiAqKiogWW91IGhhdmUgdG8gcnVuIC4vY29uZmlndXJlIGJlZm9yZSBidWls
ZGluZyBvcgo+ID4gaW5zdGFsbGluZyB0aGUgdG9vbHMuICBTdG9wLgo+ID4gPgo+ID4gPiBUaGlz
IHBhdGNoIGFkZHMgJ2Rpc3RjbGVhbicsICdzdWJkaXItZGlzdGNsZWFuJScgYW5kICdzdWJkaXIt
Y2xlYW4lJyB0bwo+ID4gPiBuby1jb25maWd1cmUtdGFyZ2V0cywgd2hpY2ggYWxsb3dzICdtYWtl
IGRpc3RjbGVhbicgdG8gcnVuIHRvCj4gPiBjb21wbGV0aW9uLgo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gPiAKPiA+IEZpeGVz
OiAwMDY5MWM2YzkwYgo+ID4gCj4gPiBTb3JyeSBmb3Igbm90IG5vdGljaW5nIHRoZSBicmVha2Fn
ZSB3aGlsZSByZXZpZXdpbmcgdGhhdCBwYXRjaC4KPiA+IAo+IAo+IE9rLiBJJ20gc3VyZSB0aGF0
IGNvdWxkIGJlIGFkZGVkIGF0IGNvbW1pdCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgY2hhbmdlcyBu
ZWVkZWQuCgpZZXMuIFN1cmUuCgo+IAo+ID4gSXMgdGhlcmUgYSB3YXkgdG8gcGF0dGVybiBtYXRj
aCBhbGwgdGFyZ2V0cyBjb250YWluaW5nICJjbGVhbiI/Cj4gPiAKPiA+IChXb3VsZCBoYXZlIGxv
b2tlZCBpbnRvIGl0IG15c2VsZiBidXQgLUVUSU1FIHRvZGF5KQo+IAo+IEkgY291bGRuJ3QgcGVy
c3VhZGUgZmlsdGVyIHRvIG1hdGNoIGFnYWluc3QgcGF0dGVybnMgd2l0aCBtdWx0aXBsZSAlCj4g
c28gdGhpcyB3YXMgdGhlIGJlc3QgSSBjb3VsZCBjb21lIHVwIHdpdGguCj4gCgpPSy4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
