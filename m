Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E112FC54
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 19:21:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inRWC-0001R8-0n; Fri, 03 Jan 2020 18:17:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90h4=2Y=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1inRW9-0001R3-O0
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 18:17:49 +0000
X-Inumbo-ID: 592837a0-2e55-11ea-88e7-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 592837a0-2e55-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 18:17:49 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id dc14so16540746qvb.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 10:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N05zburkuU1vwAbHmhfRQmpNWfg3nDNRxmax19/sZOk=;
 b=jJM1WXql2QU8cYsd0MB3fboKlesCFmr30ZkssTsgT4jxjvui4gBQKtBrZhgEubflCC
 5+2Z+BHbqEXDmf5bFz3Dyy9GmT61J3zNuz/LAmQLOiWaUl03LVHIguECLKJdrSuBF0s3
 G2znMIrld1o3cDE0fZXIw07SxXdufm4APCDSShlzbgUcgsNGOeh5VIPU7zZsWjF2t/FY
 JrXydZjLjd3ODUx/FZ9aHhhMr58J6XfjnF3NjQgQ8rd61PHPFAulpryv7PCgzy+tbqBb
 OGfwDoMqhCtoG1I66njy0jnuHDnNxiOsVFRtx83/Kt0TfLk0clo8uxHxO6X1BuMT5BRg
 Ntwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N05zburkuU1vwAbHmhfRQmpNWfg3nDNRxmax19/sZOk=;
 b=d8LbD6lehZJ9Zp7WVSHtVRzCXZq7tDKS3i6c44kTHr75Xrd2+E3pDnmlwPJgT+EqtL
 Byixr1YwG49SSmgRHROg1/dQkkROwCnedOS6PaYnWkXWnFR+3ZMU6tsaEJsuURbvoT3g
 IcZJImICI/XLy6tk1jeAgWAMeNXCtqYQClxk2CkvsSvspaROjgMmdYWviFTFDDttiOap
 LEccMGtpiXVJvkHESfCmvKrGIEgSI59Ep0CoYV6lWIpf/uzUc2vLHXnxR0cmziQDVdar
 0vQuCYHaZgrxV5aZZAqheooEZuGYTRKhAm54hZeoOkNJlP0kI80po+RWHTBGGfCeC31V
 UzzQ==
X-Gm-Message-State: APjAAAWzkoH0DwcyCMPgJeyYV4NjpzXL2wo9uBJxgj0zecnccB2migZz
 zbEZMGw/Acs2/Y+7Dw6biUaapU1ffmbzd4vYLRdBtw==
X-Google-Smtp-Source: APXvYqwJlBlVjFo43g2Eoqh4wcYReIgvxTSN1UjbjyZ4KfQ5TCQvOQ7KLZaimI+rshOLUBLI7e2zr/q69ZSaGhZKX7k=
X-Received: by 2002:ad4:5487:: with SMTP id q7mr70424342qvy.19.1578075468756; 
 Fri, 03 Jan 2020 10:17:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy9x9mjae1tGBS4-BiUTnB5S=2=cHoXFiPku3Gffv7a=6g@mail.gmail.com>
 <5841995c-dda3-09fb-4d73-bb23fa63113e@suse.com>
In-Reply-To: <5841995c-dda3-09fb-4d73-bb23fa63113e@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 3 Jan 2020 10:17:37 -0800
Message-ID: <CAMmSBy9Hd3brtRO1XP3OxNRZf8Sh9uoqba2eQcVB=0BpneFDzA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Where's Xen VGA console kbd driver?
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

T24gRnJpLCBKYW4gMywgMjAyMCBhdCAzOjEwIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAzMS4xMi4yMDE5IDIzOjE3LCBSb21hbiBTaGFwb3NobmlrIHdy
b3RlOgo+ID4gaGVyZSdzIGEgc2lsbHkgcXVlc3Rpb246IHdoZW5ldmVyIFhlbiBpcyBwcm92aWRl
ZCB3aXRoIGEgVkdBIGNvbnNvbGUsCj4gPiB3aGVyZSdzIHRoZSBrZXlib2FyZCBkcml2ZXIgY29t
aW5nIGZyb20/IFF1aWNrIHRvIG15IHN1cnByaXNlLCBteQo+ID4gY2FzdWFsIGluc3BlY3Rpb24g
b2YgdGhlIGRyaXZlcnMvIGZvbGRlciBkaWRuJ3QgcmV2ZWFsIG11Y2guCj4KPiBIb3cgZG8gIlZH
QSBjb25zb2xlIiBhbmQgImtleWJvYXJkIGRyaXZlciIgbWF0Y2ggdXA/IFRoZSBmb3JtZXIKPiBp
cyBhbiBvdXRwdXQgZGV2aWNlOyBpbiBYZW4gdGhlcmUgc2ltcGx5IGlzIG5vIGlucHV0IGNvdW50
ZXJwYXJ0Lgo+IElmIHlvdSBuZWVkIG9uZSB3aXRoIGJvdGggaW5wdXQgYW5kIG91dHB1dCwgeW91
J2xsIG5lZWQgdG8gbWFrZQo+IHVzZSBvZiBhIHNlcmlhbCBjb25zb2xlLCBub3QgdGhlIFZHQSBv
bmUuCgpUaGlzIGFuc3dlcnMgaXQgcGVyZmVjdGx5ISBUaGFuayB5b3UgSmFuLgoKVGhhbmtzLApS
b21hbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
