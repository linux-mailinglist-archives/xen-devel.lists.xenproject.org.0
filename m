Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5263A1144FD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 17:41:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icu9J-0005lw-1b; Thu, 05 Dec 2019 16:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RYm=Z3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1icu9H-0005lr-4F
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 16:38:39 +0000
X-Inumbo-ID: afa92bd2-177d-11ea-8231-12813bfff9fa
Received: from mail-lj1-f193.google.com (unknown [209.85.208.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afa92bd2-177d-11ea-8231-12813bfff9fa;
 Thu, 05 Dec 2019 16:38:38 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j6so4356601lja.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 08:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4S0GVNG6nLirTsCp55e5aPQsi/vA6GiGa6w9gp1o39E=;
 b=qtap6DPbrXhIMCvM9JVm1SMn2t/vn2iHdPmBJYqPegwDRwobiFKyH6TI/t1Fxz4Szx
 klGSq8I2hcxoOFWY42e2kL0+EwDpw/Q8NHrXv1teelr6i+UDjf9IdgloSGlHEo2lkLZG
 wviTbGIfqx4M+GcwnOHrrW9NkTlp00g9gl0RgUZxC6p/KyoKlOpcoCtqcopFIOLLWZbs
 m6Pijj5chv6LMEq4HrDHbzKaDKNFOqowegpncodJq+Or90cX2xeOLSpRk/FMPwNQSGnC
 Tg26PU9wAfSpqQXiXrdy6iVv+IDovPIZlRgnFrh/3BzJpmbHH7GPfkHnPsLklwz9RkOI
 3YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4S0GVNG6nLirTsCp55e5aPQsi/vA6GiGa6w9gp1o39E=;
 b=kfFXlNBuSRYHwndr0w4MteHBZ44oCCxF8nQlWDhSV/+6SICbJfbu6g3ceGpxQFWlnu
 8kKWdXiRgMlsjJ/xf24mLwMBm07hgWQylMIqvOqQiwa8FQJwWly8yMnKpUyOkB+/Nn0s
 jj4+TbrCB3GO2hHyQafvsB4lOoxt6uWhDI73tVKyCudzni+xpWYjksjO49W2+GSq9t6Y
 diRtt7ZM1jQ7bZr65/Wl5ck7FkCfCrfgkMcp7DFLuPesCWbAQJy6o9c3Et6O6u8/+eZd
 H0QyM4Nz3+O+mLNk4+OzSTZdRgLy3x+2492GclbxApnHgfrUSNfKuuigXNFZeUjxme7L
 S9AA==
X-Gm-Message-State: APjAAAU1f8DPUkT8LGKl7Vof5+tX/UjEThTdPmsxGus4Jo50ZeYqcf3P
 4qzKxU2uCChvdIq0rIBZD0AVhYBi76qSvriFKRo=
X-Google-Smtp-Source: APXvYqyUcfowqmQ1iPHBnrQf6qA9uPpY/oXFggFeHN0k3Km6aJDys9kdxzpy/xnuqKUCs5igjVr4tB03dF1MhG4XA9c=
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr6076592ljn.40.1575563916777; 
 Thu, 05 Dec 2019 08:38:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <472334f58bc435e505ad6bc392426960630fb060.1573840474.git.rosbrookn@ainfosec.com>
 <0ab13f6e-2dcf-ebbb-4d14-ee87c816701d@citrix.com>
In-Reply-To: <0ab13f6e-2dcf-ebbb-4d14-ee87c816701d@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Dec 2019 11:38:25 -0500
Message-ID: <CAEBZRSe=8vW7qj5fbU7dTpPYTtuR5j1PTbiV0=tYnGvkcahG8w@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 15/22] golang/xenlight: begin C to Go
 type marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBZb3Ugc2hvdWxkIHByb2JhYmx5IHNheSBoZXJlIGV4cGxpY2l0bHkgd2hhdCBraW5kcyBvZiBl
bGVtZW50cyB5b3UncmUKPiBzdXBwb3J0aW5nIGFuZCBub3Qgc3VwcG9ydGluZyBpbiB0aGlzIHBh
dGNoOyBzcGVjaWZpY2FsbHk6Cj4KPiAtIFlvdSdyZSBjb252ZXJ0aW5nIGJ1aWx0LWlucyAob3Ig
aXMgdGhpcyBhbnkgc3RydWN0LWxpa2UgdHlwZT8pCgpBbnkgc3RydWN0LWxpa2UgdHlwZSwgc2lu
Y2UgdGhlIGZyb21DIGZ1bmN0aW9ucyBhcmUgYWxsIGRlZmluZWQgaW4KdGhpcyBwYXRjaCAoZXhj
bHVkaW5nIGFycmF5IGZpZWxkcyBhbmQga2V5ZWQgdW5pb25zIGFzIHlvdSBzYWlkCmJlbG93KS4K
Cj4gLSBZb3UgaGFuZGxlIG5lc3RlZCBhbm9ueW1vdXMgc3RydWN0cwo+IC0gQnV0IHlvdSdyZSBu
b3QgaGFuZGxpbmcga2V5ZWQgdW5pb25zIG9yIGFycmF5cyAoYW55dGhpbmcgZWxzZSk/CgpJIHRo
aW5rIHRoaXMgY292ZXJzIGl0LCB0aGFua3MuCgo+ID4gK2Z1bmMgKHggKlZuY0luZm8pIGZyb21D
KHhjICpDLmxpYnhsX3ZuY19pbmZvKSBlcnJvciB7Cj4gPiArICAgICB2YXIgZGVmYm9vbEVuYWJs
ZSBEZWZib29sCj4gPiArICAgICBpZiBlcnIgOj0gZGVmYm9vbEVuYWJsZS5mcm9tQygmeGMuZW5h
YmxlKTsgZXJyICE9IG5pbCB7Cj4gPiArICAgICAgICAgICAgIHJldHVybiBlcnIKPiA+ICsgICAg
IH0KPgo+IElzIHRoZXJlIGEgcmVhc29uIGluIHRoZXNlIGNhc2VzIHRoYXQgd2UgZG9uJ3Qgc2lt
cGx5IGNhbGwgLmZyb21DIG9uIHRoZQo+IGVsZW1ldCBpdHNlbGY/CgpUaGlzIGVuc3VyZXMgdGhh
dCB3aGVuIHdlIGNhbGwgZnJvbUMsIHdlIGhhdmUgYW4gaW5pdGlhbGl6ZWQgdmFyaWFibGUuClRo
aXMgbWlnaHQgYmUgb3ZlcmtpbGwgaGVyZSwgYXMgdGhpcyB3b3VsZCBtYXR0ZXIgbW9yZSBpZiB3
ZSBoYWQKc3RydWN0cyB3aXRoIGEgbmVzdGVkIHN0cnVjdCBwb2ludGVyLiBFLmcuLCBbMV0gd2ls
bCBwYW5pYyBzaW5jZSBvbmx5CnRoZSBvdXRlciBzdHJ1Y3QgaXMgaW5pdGlhbGl6ZWQuCgotTlIK
ClsxXSAgaHR0cHM6Ly9wbGF5LmdvbGFuZy5vcmcvcC8xZ0RWamJYZ1dkLQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
