Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ADCBB58B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:38:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOUi-0001IB-AU; Mon, 23 Sep 2019 13:35:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCOUg-0001I2-O7
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:35:10 +0000
X-Inumbo-ID: f66be0e2-de06-11e9-b299-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f66be0e2-de06-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 13:35:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i18so13931294wru.11
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 06:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NdWzJ9IDdYeTcupE9NtCKEWrcWqioR2BAZyZtKHmXGY=;
 b=UHwMZo170AgrqvEIH40FlPsojoV7c1mJnI9SjBBFYJKfyojwXafO7MRWtgRNbxKh+u
 AgasFsw67npwKSWREb+UfMtER0x0LzxHbb7M9TK6z/0XhQU86P6ZwQVYAnEVcAhEK8TG
 Br9YqIiG89/fHW9Y4z4RlALEtd83dwyDc7b3s+87N1bBR+sRYAkFl5BGHmpWbCB/tpo3
 JYkqH8RwGUa8GoXyj4UY6VGvYjNuhZFkriyOrf/AUF4evdJ11L5Z1ntPkUPso29BeU9p
 D1mniW3mIMvU7Dbhy9EBgHGLaPmiok70vr74JoErpmk9A8T1Sj2M3yFYCpw6YH4KoEjD
 x37Q==
X-Gm-Message-State: APjAAAXORbaRViIuuoO9jSOMLTQsp8BR/Ud1Ldvt3d+3H1DftG542adw
 EUBIczD3ZdkzGFBhosfBqFc=
X-Google-Smtp-Source: APXvYqxhH8n0gKT6z4LdNzzPjk+MgXAmBbZQqTaQURe8fQ3qiUcsAtlSGHiXpiPZLpNj1EoaxTxO0A==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr22926579wrj.269.1569245709450; 
 Mon, 23 Sep 2019 06:35:09 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id z6sm9766099wro.16.2019.09.23.06.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:35:09 -0700 (PDT)
Date: Mon, 23 Sep 2019 14:35:07 +0100
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190923133507.lmf5l3hnefvwn7lb@debian>
References: <20190923132652.205526-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923132652.205526-1-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxl: Fix build when LIBXL_API_VERSION is
 set
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDI6MjY6NTJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhlIGNvbXBhdGliaWxpdHkgZnVuY3Rpb24gbWlzdGFrZW5seSBjYWxsZWQgaXRz
ZWxmLgo+IAo+IEZpeGVzOiA5NTYyN2I4N2MzMTU5OTI4NDU4ZWU1ODZlOGM1YzU5M2JkZDI0OGQ4
Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
