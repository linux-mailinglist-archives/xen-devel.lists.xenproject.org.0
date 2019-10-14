Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B46D654E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1MB-0000nP-DT; Mon, 14 Oct 2019 14:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flUq=YH=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iK1MA-0000nD-Pu
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:29:54 +0000
X-Inumbo-ID: 1686baf8-ee8f-11e9-bbab-bc764e2007e4
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1686baf8-ee8f-11e9-bbab-bc764e2007e4;
 Mon, 14 Oct 2019 14:29:54 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 205so10526927pfw.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pVgNsLZmusn/0VPc8jRmCgjq0/uu3i1yih1wwqVCCws=;
 b=AVScJlp6hVP2I3fwaZhc4jyhmHHHVdeVScozqrfXAvuwx5AM+B51wzkN359hcnsPP5
 aRkRwDTo1BX78uFAHS02JixP00kLLombIRsldeqfZH7uh5WKDuUsRe6hCTJHRsROvx0a
 BbWHyN+/wDCdlRvdjzN/uEHlgZoGphrQV4o64Vg/wvCQxUnA/7Qb0thHB34/X8iodmsR
 hgdDD2TOAL9kDqcZcxycJh+1OikNANeDERaz2zgcov7WR68TjWrzY9wTU5LCCB1wMRsf
 2AUHjJvfK8EJqno6i6tFTS/WfPweWyFDhDE1z2IyOvd65FoVYeFE+t0aXDw/pPVB13j1
 XBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pVgNsLZmusn/0VPc8jRmCgjq0/uu3i1yih1wwqVCCws=;
 b=dx2TAfKQ8yzv3HuB2OtFa/UdxKT84BDxYCKtHUglRsCqV2WgikwO7BpRL4c3SwTC7G
 YASwlitLEjsGz+RObUaAnwiNVdSTTtodR5h3s8Y8nhQJui7xkGvF77dZUVU5NJewsXj8
 8Z3xaBB9SwyxQY98BD3xpcPAzMrKPwkZ8rNpZedtGSAql7W8abPyJMuH2J03FW9/QV7d
 jt2MZKpejyjOFOGL9tTCGMLmQID/vjY/o19QAyKPHzv9EaQ11mgBH9vN5gjjSNYPVM6U
 xbJU6Ni9fFjd2e5HriSOefAaGICWLrOSEZYd0SpE+VwQ+/XdcbqHVUe++HwJ3nOoFBKj
 QCBg==
X-Gm-Message-State: APjAAAVXZgOzFJ3FGwURHCNvqr2NHbdDi0rFUUFXuV+SdlHeMOj2aQzc
 e5CttKNbVJixXcuzV194IA4yjpjBWkymJMp5/dQ=
X-Google-Smtp-Source: APXvYqzlAsd8AavS54vG3LLcvFWdOJorkwhqLYrGGsuHW/7m/fDdfLR1oVhgW/XRyxvB0xa2GW8OX02i0CVqNWN9JaI=
X-Received: by 2002:a63:82:: with SMTP id 124mr34900738pga.112.1571063393200; 
 Mon, 14 Oct 2019 07:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191014142246.4538-1-philmd@redhat.com>
 <20191014142246.4538-9-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-9-philmd@redhat.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 14 Oct 2019 15:29:42 +0100
Message-ID: <CACCGGhCaC5-K+q+fJpTt5aZQ=-XurNAWwNDvKunBLaFHvu7yow@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 08/20] hw/xen/xen_pt_load_rom: Remove unused
 includes
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNCBPY3QgMjAxOSBhdCAxNToyNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPiB3cm90ZToKPgo+IHhlbl9wdF9sb2FkX3JvbS5jIGRvZXMgbm90IHVz
ZSBhbnkgb2YgdGhlc2UgaW5jbHVkZXMsIHJlbW92ZSB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKPiAtLS0KPiAgaHcveGVuL3hlbl9wdF9sb2Fk
X3JvbS5jIHwgNCAtLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2h3L3hlbi94ZW5fcHRfbG9hZF9yb20uYyBiL2h3L3hlbi94ZW5fcHRfbG9hZF9y
b20uYwo+IGluZGV4IDMwN2E1YzkzZTIuLmE1MGE4MDgzN2UgMTAwNjQ0Cj4gLS0tIGEvaHcveGVu
L3hlbl9wdF9sb2FkX3JvbS5jCj4gKysrIGIvaHcveGVuL3hlbl9wdF9sb2FkX3JvbS5jCj4gQEAg
LTMsMTIgKzMsOCBAQAo+ICAgKi8KPiAgI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKPiAgI2luY2x1
ZGUgInFhcGkvZXJyb3IuaCIKPiAtI2luY2x1ZGUgImh3L2kzODYvcGMuaCIKPiAgI2luY2x1ZGUg
InFlbXUvZXJyb3ItcmVwb3J0LmgiCj4gLSNpbmNsdWRlICJ1aS9jb25zb2xlLmgiCj4gICNpbmNs
dWRlICJody9sb2FkZXIuaCIKPiAtI2luY2x1ZGUgIm1vbml0b3IvbW9uaXRvci5oIgo+IC0jaW5j
bHVkZSAicWVtdS9yYW5nZS5oIgo+ICAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgo+ICAjaW5jbHVk
ZSAieGVuX3B0LmgiCj4KPiAtLQo+IDIuMjEuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
