Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA64018A71
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 15:17:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOisC-0003ET-F6; Thu, 09 May 2019 13:14:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bMSx=TJ=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hOisB-0003EO-4h
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:14:07 +0000
X-Inumbo-ID: 5280531b-725c-11e9-8980-bc764e045a96
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5280531b-725c-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 13:14:05 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id s5so1811213ywd.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rWZMMuXU+4P31ylPO4DAlmzlBla0LOYhtsBInwovkOk=;
 b=UPOGUkzA7p896TIyOY3iHzofM29foI77le3zyUBb89lwi7d+uVFOHZWvjTVVwlD5l9
 WwF+k+7IvIlFxSBij7qI1e0PyLC0J8Jhf/u3S3R3gvZqD9dOR27NAljD/d12iowEv6k/
 q1psRTCk16JrBggauRRq6mFVnr+djMbSXiWOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=rWZMMuXU+4P31ylPO4DAlmzlBla0LOYhtsBInwovkOk=;
 b=eWua1n6rd7098QENejqIXHx92UJxNYBCu/3lOzjOr0p8auPftZMMJQnSbuL8aD6tzV
 jnjOdE7DStkUQKswKBQre/Fj/wkQpuCbAXj2fntdGhe0/zslpgoN3oXw7x7oBDihcTzU
 DO++kTUZPlcUPJJWcSHIk5u1eIGMSMDmQnVwA2ICEqUmmtL0DlrA7yrl2skToQNfBRi5
 N36bi5NzATx4buzcIhmOpLXZMF0IWnCrrtwXDhXWhRugINEWXXc0A9Dg+qRz8gZQMmez
 8MX8TIvKBd85tjDm2FJ3I+lH+9Q3bjZ+tbPCUzfD0pqsl8JpPHLgOZinHM8RaQk1GIr2
 1mUA==
X-Gm-Message-State: APjAAAXNi8N7CKFadrEZ2wrRVigil3M23JlG6N7w96gNcQFo3deVsgIw
 EJk0UUqGiSMb8VKbsBAqlbqXIzFoCEs=
X-Google-Smtp-Source: APXvYqzu2siA+YPhTFZId8xrDh2jrSEPJkO6KIzSbJOItGXj/dd7CCCKqPYKwLLWIld8k9n3w2Xw7Q==
X-Received: by 2002:a81:92d4:: with SMTP id j203mr2098685ywg.348.1557407645518; 
 Thu, 09 May 2019 06:14:05 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:d485:beca:90d3:3dc5])
 by smtp.gmail.com with ESMTPSA id g187sm518370ywa.4.2019.05.09.06.14.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 06:14:04 -0700 (PDT)
Date: Thu, 9 May 2019 08:14:04 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190509131404.mukvuulxfhzdlgnb@doug-macbook.localdomain>
Mail-Followup-To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
References: <20190507161101.10232-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507161101.10232-1-wei.liu2@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] gitlab-ci: avoid deleting
 build-each-commit-gcc.log
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDU6MTE6MDFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiAwNzJhOTZjNDkwMSB1c2VkIGBnaXQgY2xlYW4gLWZmZHhgIHdoaWNoIGNhdXNlZCB0aGUgbG9n
IHRvIGJlIGRlbGV0ZWQuCj4gCj4gR2VuZXJhdGUgdGhlIGxvZyBpbiB0aGUgcGFyZW50IGRpcmVj
dG9yeSB0aGVuIG1vdmUgaXQgYmFjay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9l
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
