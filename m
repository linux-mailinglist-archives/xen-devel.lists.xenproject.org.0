Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148309EFF0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 18:17:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2e7A-0002xE-Jq; Tue, 27 Aug 2019 16:14:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/jiW=WX=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1i2e79-0002x8-1d
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 16:14:35 +0000
X-Inumbo-ID: c231671a-c8e5-11e9-8980-bc764e2007e4
Received: from mail-ot1-x332.google.com (unknown [2607:f8b0:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c231671a-c8e5-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 16:14:34 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id m24so19192623otp.12
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2019 09:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mCxnHygmuC9NVcJouefNbLAPjb5svalC9+ZawDjazks=;
 b=XW2ODjDYJaeHP1ZvWsjc2EjDKMXdzugOHgNN36Pb2UVioYhtnbRtHNufqlVy3lGaCd
 QAye9WsgDwC8uVrMCCLM6tYPlXeosaSDlBDi1IylXVoIeamomdxvyo6Ir7Z7J4oTHLzD
 EjEUnbXpW2nu6aau9FFTmOgTeWJyHI3hJQqrF+s4J30d4tyume9Sm2maSqphk4uiUrll
 E0npns+hIaja5app8FoK7DAdj1IR++sdfzQq8THoU9eYT6JXWKgfeRv7J9sSFnuQwsiA
 5BxDwNB7u71qhbVe5RrhF2KTsCm4AxjcHVmzeQ+KjFyXUeYgbgFeJ4dYovitSAVvbW4u
 TD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCxnHygmuC9NVcJouefNbLAPjb5svalC9+ZawDjazks=;
 b=LcroYEy7wC08T2HKwK4vcyD8ApwOD1OPOou5RUpqnOhnFJdYKyGnoP0jqbIlgw2iGb
 4pFnHvfwasRXCcW0mYcbGaSr/6UPF7MahZHK8vAFNnYFZ0w9C9z33kpYtlT4DGUxemfF
 zdaYZBKgQztgt4vIYzubiNh4j/lhkXxqWXhfyxKoGPOCTq0sGIwaAVqS44/J4MuWIbk0
 g1s14h1TVbE1X0px4qDSP4YZt0TE1WUtv0hJ55FdXjAROMDFBNW9J2PRxePpCPWH3jiE
 SYT4u2mNXhMQtctHRvyrPlTz3RYebvic5Ie2Oktui6CitlNaR0iEljyFommCUIDh2Mim
 3kvQ==
X-Gm-Message-State: APjAAAU2ZuFCF9vlPOgxNHQ9sdwWoXECL28n00y/BFHNXkwebKYqsVKZ
 /FECyopQ/j3cSaAv+3af/yaqRC4Wz4YeA5WeYUGCDo7/wv0=
X-Google-Smtp-Source: APXvYqx5lPeVYhPVDbZsGzuuQdfLK0tKp2pcPVnQ6CLNTyxH8cqdhZONBgYfY0x4YdJPXlxdAosZK7HKaJrbP1iH2Yc=
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr284595otp.232.1566922473942; 
 Tue, 27 Aug 2019 09:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190827133259.32084-1-anthony.perard@citrix.com>
In-Reply-To: <20190827133259.32084-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 17:14:22 +0100
Message-ID: <CAFEAcA86rs-61W=NPi1373HaiBweRtyv2xc8ovXAfwR2wtydUw@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PULL 0/4] xen queue 2019-08-27
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyNyBBdWcgMjAxOSBhdCAxNDozMywgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCBkYWMwM2FmNWQ1NDgyZWM3ZWU5YzIzZGI0NjdiYjcyMzBiMzNjMGQ5Ogo+Cj4gICBNZXJn
ZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1vdGVzL3J0aC90YWdzL3B1bGwtYXhwLTIwMTkw
ODI1JyBpbnRvIHN0YWdpbmcgKDIwMTktMDgtMjcgMTA6MDA6NTEgKzAxMDApCj4KPiBhcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQvcWVtdS1kbS5naXQgdGFncy9wdWxsLXhlbi0y
MDE5MDgyNwo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDcwNWJlNTcwOTQxYjM4
Y2QxY2JlYmM2OGY3ZjY3MWNlNzUzMmVjYjA6Cj4KPiAgIHhlbi1idXM6IEF2b2lkIHJld3JpdGlu
ZyBpZGVudGljYWwgdmFsdWVzIHRvIHhlbnN0b3JlICgyMDE5LTA4LTI3IDE0OjE4OjI4ICswMTAw
KQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IFhlbiBxdWV1ZQo+Cj4gKiBGaXhlcyBmb3IgeGVuLWJ1cyBhbmQgZXhp
dCBjbGVhbnVwLgo+ICogQnVpbGQgZml4Lgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKCkFwcGxpZWQsIHRoYW5rcy4K
ClBsZWFzZSB1cGRhdGUgdGhlIGNoYW5nZWxvZyBhdCBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hh
bmdlTG9nLzQuMgpmb3IgYW55IHVzZXItdmlzaWJsZSBjaGFuZ2VzLgoKLS0gUE1NCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
