Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E810AD6B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 11:18:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZuN0-0004aZ-Vl; Wed, 27 Nov 2019 10:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SQp6=ZT=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZuMz-0004aU-Uq
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 10:16:25 +0000
X-Inumbo-ID: f79a70b6-10fe-11ea-a55d-bc764e2007e4
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f79a70b6-10fe-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 10:16:25 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id b1so10563715pgq.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Z1061BZa6w223FmLq64FqSRkJhy5rWij/THaRh/kp4=;
 b=XiGAwd48kMFaNFmfj3I+o+cNRL51+330TkrZjnaMmE8adl6l+DyjK5/eOT/+IGSVm0
 AjMA/J0OwmDX55LUlW4HhslgUU/xQpHcJB08qMzS7U5ewOH1Hib8XH18nObopLwO9BPX
 m+OGMUMVq0585eO28HqNF1uZY7MnNbZdpa8R0uLP4TKml+iz2Tzw6HWM+aN6QZXHB8xG
 45nHeGFFL0PyyVIUphZPXS1P2DK7QdljoNHi0+Pcj0yTOBhe1nfPhsGagsxPN/nBrLJs
 h5E92A9W7fkC94ygOmjUE2CqB6Ab+4jxLipWsbZrBp0di6OCHgfTFPg82ig+txMMA0TT
 WQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Z1061BZa6w223FmLq64FqSRkJhy5rWij/THaRh/kp4=;
 b=BOSvINGvOlBGYZ0g6ebvxFhzxaz0d/ZaY/xkggO/5wxmpgKEIj7s0QMD9pbuKnRLb5
 lHAACxcoQxlitaJ7u96TiVxpeVukClbSZcPX80cJA0HbB8Y7/gClV5OYkl5GF8LpumQE
 2WxfJUYw7mhsdc77FaWvNSgOLh+UI7+68vr7SJoejoR/5pts2BD8+1KezqUA8LYnopdQ
 zmEMu8SXmzGBuNdN6YlnXu87heggaotgFqMBdXj6L56nlYFU88M9uTRtO37ma5cFuI1d
 gb5VZb/pNCTXiA36FdOSmAEmiFZCXuxNXoUa3QPbLziOSsWDuyZdgy3nYBKcBJ3WVb+U
 QqzQ==
X-Gm-Message-State: APjAAAUl8m8YaRf8MXOgGgflRWGXoNCTgi1tq+Cy09WLenkiZoVmEWuk
 cF6xavJDUPkYZ6/S5frhvs2R5nJBQGGLmbbGtDU=
X-Google-Smtp-Source: APXvYqzCC7kvuxPXA/gmw+JN2wFjBQL6yuK7U5VmxZJi31IF8MzssvQcTfHBWI3bflwb+/49U4TRHIGeefxfUL1oVzY=
X-Received: by 2002:a63:5804:: with SMTP id m4mr4038995pgb.50.1574849784290;
 Wed, 27 Nov 2019 02:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20191126154920.2950420-1-george.dunlap@citrix.com>
 <20191127101443.ret3tazvqaubm54d@debian>
In-Reply-To: <20191127101443.ret3tazvqaubm54d@debian>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 27 Nov 2019 10:16:13 +0000
Message-ID: <CACCGGhAK4QswE=rfdrt05h3a4gOeOp7HeRmhQuDWGvtdkNYoZA@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] docs/xl: Document
 pci-assignable state
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNyBOb3YgMjAxOSBhdCAxMDoxNCwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBPbiBUdWUsIE5vdiAyNiwgMjAxOSBhdCAwMzo0OToyMFBNICswMDAwLCBHZW9yZ2UgRHVu
bGFwIHdyb3RlOgo+ID4gQ2hhbmdlc2V0cyAzMTlmOWEwYmE5ICgicGFzc3Rocm91Z2g6IHF1YXJh
bnRpbmUgUENJIGRldmljZXMiKSBhbmQKPiA+IGJhMmFiMDBiYmIgKCJJT01NVTogZGVmYXVsdCB0
byBhbHdheXMgcXVhcmFudGluaW5nIFBDSSBkZXZpY2VzIikKPiA+IGludHJvZHVjZWQgUENJIGRl
dmljZSAicXVhcmFudGluZSIgYmVoYXZpb3IsIGJ1dCBkaWQgbm90IGRvY3VtZW50IGhvdwo+ID4g
dGhlIHBjaS1hc3NpZ25hYmxlLWFkZCBhbmQgLXJlbW92ZSBmdW5jdGlvbnMgYWN0IGluIHJlZ2Fy
ZCB0byB0aGlzLgo+ID4gUmVjdGlmeSB0aGlzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiA+IFJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPgo+IE9uY2UgYWdhaW46Cj4KPiBBY2tl
ZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPgo+IEkgd2lsbCB3YWl0IGEgYml0IGJlZm9yZSBw
dXNoaW5nIHNvIHRoYXQgUGF1bCBoYXMgYSBjaGFuY2UgdG8gY29tbWVudC4KPgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KCj4gV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
