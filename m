Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2D13CB39
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 18:44:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irmfI-0004dK-7u; Wed, 15 Jan 2020 17:41:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5IT=3E=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1irmfG-0004dF-Qm
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 17:41:10 +0000
X-Inumbo-ID: 33c0cdc0-37be-11ea-85d1-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33c0cdc0-37be-11ea-85d1-12813bfff9fa;
 Wed, 15 Jan 2020 17:41:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so16623238wrh.5
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 09:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/3QiPe/1GTUh4wvN6iqGkoCNxlqFn5o7CgcBx+S+Yxk=;
 b=PXHFD2eeRWUbDzGHzcGX2LIoCLia+BF9f3Cc6FnAf3a/e51jBrK7zFrWO2zUMIX/HB
 F3EdWxV0oRGQyY/NcuzXRxS5k+d5UQyaaoaKYDKAxyp0csfGwVJpX8F8KPIqgUelGqWU
 FEUA+x2mj79JQM/rbBCRWjuyR+Tfr34mKOOzNqKc5PoO47dY4GxBvzvfJCYX3I7KU+Gc
 ECKHSztfy9Gwz3EUQMwMf/AczE6fzUvEUNdkSiwLknZpLmRRWM4URCGOkLzvi+/8pcY4
 XriMPKTj8EGS+35erbSxVo3WO52fJCPhF/sKRKSWMKGykTbKEOowyP2Z1hG51BOJETHY
 pvbQ==
X-Gm-Message-State: APjAAAUfl98bt6xIMIcNjaA8+tVSm++s+69US8LeQ/Ve2DquOWR5MoWh
 GCiut8MHsSRkb8zLpl1qAKA=
X-Google-Smtp-Source: APXvYqxTYlzZo5YP/kkwcJuy6q+2a5/NGOs+rhKjCJpOF46IvaQDw/+OQGyFX5tcR/JRocaQUcyDDQ==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr32438058wro.202.1579110063663; 
 Wed, 15 Jan 2020 09:41:03 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id i10sm25964672wru.16.2020.01.15.09.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 09:41:03 -0800 (PST)
Date: Wed, 15 Jan 2020 17:41:01 +0000
From: Wei Liu <wei.liu@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200115174101.vqtsil6akmmyv3o4@debian>
References: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] net: xen-netback: hash.c: Use built-in RCU
 list checking
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
Cc: wei.liu@kernel.org, paulmck@kernel.org, paul@xen.org,
 netdev@vger.kernel.org, frextrite@gmail.com, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDk6MjU6NTNQTSArMDUzMCwgbWFkaHVwYXJuYWJob3dt
aWswNEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBh
cm5hYmhvd21pazA0QGdtYWlsLmNvbT4KPiAKPiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdSBoYXMg
YnVpbHQtaW4gUkNVIGFuZCBsb2NrIGNoZWNraW5nLgo+IFBhc3MgY29uZCBhcmd1bWVudCB0byBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3JjdS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWRodXBhcm5hIEJo
b3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUg
PHdlaS5saXVAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
