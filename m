Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6C177DA2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:40:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9BUj-0000lD-7k; Tue, 03 Mar 2020 17:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=se4C=4U=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1j9BUh-0000l7-ST
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 17:38:11 +0000
X-Inumbo-ID: c0bfe88c-5d75-11ea-8efe-bc764e2007e4
Received: from mail-yw1-xc44.google.com (unknown [2607:f8b0:4864:20::c44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0bfe88c-5d75-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 17:38:11 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id h6so4119747ywc.8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2020 09:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=PTKzi2HzS0ilh46exsvRgf2nVcDqxlldI2M4GCocKow=;
 b=UtUR4csgy8LeYNxc5R33n9jiGc9sFqffs90rUMUF9k/zlMPF8LhQsr0qaeofOxaOkZ
 C+53R/aAZI3TefPHCE2EFb+o2mND9z0bF0yuXVJ8iO2vFrZfXmsl5RSDW1Akl8WfConc
 ULh56RFFfwymOTEtjQ3UbFxH6OYZmubPVNYYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=PTKzi2HzS0ilh46exsvRgf2nVcDqxlldI2M4GCocKow=;
 b=Y3y75VB7MN2A1MQL+6vvGEdTHC1q+uxKOZ4pKlrv5OJ8ZTaIiU0Y2UrE5Kwvv8PPJG
 CnOsXfzvTU6Czy5Ojcy/3DO2cEf+h5p9CgiCIIuSuTv2DB1BQEq57vms7NLUi2/JTd+J
 8NyNze48WYWy66lt2ClbA/k+OhcSAejAznGEkloGI4SLSwtqFd28yZFnkANtgr1iMmEM
 22BVdzKYnrNFMbyJ1Wex19RXlrppHDpVqkaY3gvVk0KkIbJVsC0dVimcePrukD+7AD4w
 qwu2FqbHY5Xt+d+O7lABM1sSa4I8JytmYY1a3ZYTFqY0duEHdCKvU7d++dIxcVCIUA5K
 3r2w==
X-Gm-Message-State: ANhLgQ1PsLusyJq+v3FNl5cpvK9x8A4AlJu5ceng8/bp1tDvFmnO0cfi
 ij2vQzlspyOvDl+02S0os2Fo0YkiRHU=
X-Google-Smtp-Source: ADFU+vvxKNj2PGFkgDPNZm1dBBbWcMQUCL94jtfmbXvqNwsd41neUTawEcdTqEU9wbJqrcB3MPoY8A==
X-Received: by 2002:a81:49c1:: with SMTP id w184mr5701052ywa.63.1583257090767; 
 Tue, 03 Mar 2020 09:38:10 -0800 (PST)
Received: from doug-macbook.localdomain
 (104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
 by smtp.gmail.com with ESMTPSA id i66sm9720820ywa.74.2020.03.03.09.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 09:38:09 -0800 (PST)
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
References: <20200225121048.5889-1-wl@xen.org>
From: Doug Goldstein <cardoe@cardoe.com>
X-Pep-Version: 2.0
Message-ID: <ccce9550-8dd4-0f0c-e20a-300137e53a29@cardoe.com>
Date: Tue, 3 Mar 2020 11:38:06 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225121048.5889-1-wl@xen.org>
Content-Type: multipart/mixed; boundary="------------92813DD08FE5EA94B3C8CFCF"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] automation: document vsyscall=emulate for
 old glibc
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------92813DD08FE5EA94B3C8CFCF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2/25/20 6:10 AM, Wei Liu wrote:
> Signed-off-by: Wei Liu <wl@xen.org>

Acked-by: Doug Goldstein <cardoe@cardoe.com>


Do I need to make this tweak on the current runners?

--------------92813DD08FE5EA94B3C8CFCF
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBF5LGPMBCADEZFhxQYVAKLdisE/vC0BBf8/RFLPJaxI9oKpHhuCCM0R4cjfi
7yR255hGqpBmQ3zbtRHnIrts8yQhW7hY/Gd/QVujE2AyBr8GqmMEoiHqIIAAykmM
YThi0guDehgP3BGCsIOg1zQao4UuLCXU+uUweFxMR8+ATXZAxh9j6dEJcKvyLiS3
ZpD3d3Ev4VF1WTHwzj87eUyDXp2hN+w3qIPyTlkBv3pzZHuowhm3xUj+gSgBdfFF
zRNTj1go6NT4YqcTqu/6geeP9wEuf+0hreM2zddweVnEqUgs7rYTu+gFckGOp6vq
unsIL4t7mxUlUdR9W/26ogWtsPidcCSpQUH3ABEBAAG0IkRvdWcgR29sZHN0ZWlu
IDxjYXJkb2VAY2FyZG9lLmNvbT6JAVQEEwEIAD4WIQQ8YcHMwTxmFAQZsmnhXudh
SZqTXgUCXksY9wIbAwUJAeEzgAULCQgHAwUVCgkICwUWAwIBAAIeAQIXgAAKCRDh
XudhSZqTXnIxB/9mJfMYswa6T0A/SqsIRj3P38h3a3imS4rdLv/jPjgNvdozuhWH
i37cyw1V81x8zu90cWNyENGzw/v8q6R7FR7kJ7GS6mz4IN4X6V4OxnKc0veKgYfe
ivWAcrVSOFwTU/gG4zdXH4iKur4rfo3aa09+8tw+zsCXuNuAaNLjmtIrWdsHM47e
V1s+mrZgplvVh7iAG8CRdK42/QTsUai7t1iAYiRu4AdXKXfa9wej/FBzXkK1HBmJ
wrVcgf5E6Qa2s98vQCjaRJ3dLwWb5EAwjAO82e7W3dIClp2D0LP0916tohn0OF+W
urzJpkSFsxive21aZEOPy1Oy5m0Bt5otuRXNuQENBF5LGPUBCAC8yXDcoRhy44Sn
2m+BhN+smvyWFFFu7uS3vjpfZonslkypWtHIy2M/Z1vNl0LEH6yTz0EX0aSjKSU/
6DdyfyJtacbbWw2LjfMuc8yIjDK1VgyRb7GPuklWxRcQnwGURJ65yQQ2BV9w9aPR
ltTIU5Ez8ybEOJd/DL49rJ5Rd+DPe1/7ga4fTtawNoj4zeZMDkPBGlNWffiMB1A4
mlacGTtUkc6S4YNERdo9erBbtca9pxcZwdk00eW2KM5LOjvymslcWvKtmMAQI+6O
LPOSO7N0YKDvaYF8yYsC/J3OMf2EIhPTOoVlgWdUbuNAeV9Z97pGCc8TYyUQjWOc
1/0SUQv3ABEBAAGJATwEGAEIACYWIQQ8YcHMwTxmFAQZsmnhXudhSZqTXgUCXksY
9QIbDAUJAeEzgAAKCRDhXudhSZqTXsGyB/9QqUqL/B8ljwJOP751A2ysXlMS0/ct
A0B2BltlU6i6TyhpD4CeBb+/01SE1JN0Lx7e7S6ZjG5n0NldHOTemDq+IGP+Wfn5
rQnE5+Cbs+XKeMoUqnP+prT6hyK+xXZsCTUk0zhgQVn5RjJY6tZE0qCD1bwZ/w5A
IXRbeOeqcKWMxrKCjJZ9b/laGZ3XpLb6YywoVWaWLr8q9Vpl02JMSTtemuvvkOwh
R1tEyfZ8dOWOv3YQRNBPy/d0YckTcUCnF5rrNnjN1m+F/Td3k1myX5qpwfGB9UaJ
Tq30Io9EVkA65Ti1yf3KVaBpmKGDRC0syxKfiteY+QVyV+NW+EbAN9YA
=3Dhwn4
-----END PGP PUBLIC KEY BLOCK-----

--------------92813DD08FE5EA94B3C8CFCF
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------92813DD08FE5EA94B3C8CFCF--

