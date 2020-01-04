Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE0130404
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 20:31:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inp5T-0003O6-5R; Sat, 04 Jan 2020 19:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1inp5R-0003O1-Cj
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 19:27:49 +0000
X-Inumbo-ID: 4a52412a-2f28-11ea-b6f1-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a52412a-2f28-11ea-b6f1-bc764e2007e4;
 Sat, 04 Jan 2020 19:27:48 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h23so47020848ljc.8
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 11:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2vf85dcgEl6otfdVSfSPU5+HVZXivn9PycPcR29tWU=;
 b=j8CzHm/mTbSiVlrpKYOyyrLKo/4CmX0nIa0Br5MEknA+OI1ASbVkQzTZOc9gnNjDyZ
 HHjZTsaexLl8I/LqSoCXq1UDmmunwOwhvhSfrK0Xmv36mfFCSO2xlH3Ptp/1gYMDEDhj
 cZ+P7YsjegRlPUmp3E1NUnfv0LgmDtasZd3rtE/RdYWjGxgjdjH0ea0iY78gzLcB1B6f
 Z6pRgPdGNI1jshhZurPp9Sx8Or1BbbwpB7mrXOYIM/TQ/QRg2nOjlW5KAnFQxU695OWP
 psADN6p1Z7MW6DdTUxnPKGI93ZjOT9PxYIo/yy9+AkW/BIGx6TIkOI6VUKifYOkbaKJ6
 MN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2vf85dcgEl6otfdVSfSPU5+HVZXivn9PycPcR29tWU=;
 b=UwmrZ5lx5A0cTgU/F3JwXy1RkaXsbvVPCc/CaCWNqHgB9QDL1zTR4pw3/Y+A4d4Mum
 aUCAZi7bkTUn4uLXPF3YSVS5EANhy5Rrz3X9YWmvz/VG/eusObTjKMouUS6XEkosH73m
 gvYh65coMK8P+VwUcrfjfjFci625JBsfq9ODfmRAYh83ACp2LulASbPj/r4GA2ODRb5A
 GR3Yort7PEMeTtnReM1qHW6vY3BqYGBAMakJAJXCyR2vHn05KN6f1dFiigKrGDly7LNO
 L9blyHrMWpJie7/TbmjdGNZoWMjNfQv+oXWURSmoTHydeK6eZAeaftlagldBVsQybkk6
 XH4g==
X-Gm-Message-State: APjAAAUNIKY04RbOokMN5VFOR74m+ylco0kHq3vKrvkOxWNxOWKO/Nv+
 sz2+7OlC/p60PkpC+6IvmsAUu8a7kgE2yTfgMpQ=
X-Google-Smtp-Source: APXvYqxL5m6BOrjFyjz1bL61UOGwQ+yFGph7aaLjRKSmhpty2l1Uag5ag/Fj085NGwqLrEA5OGjaL1jC2V9deJtal60=
X-Received: by 2002:a2e:8090:: with SMTP id i16mr57014742ljg.88.1578166067670; 
 Sat, 04 Jan 2020 11:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
 <20191227163224.4113837-6-george.dunlap@citrix.com>
In-Reply-To: <20191227163224.4113837-6-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 4 Jan 2020 14:27:36 -0500
Message-ID: <CAEBZRSd0ByCj7GeJbeLY7oYpSNS1A=0K_fY0tHJcnkE_6c40rw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 6/9] golang/xenlight: Errors are negative
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
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMTE6MzMgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IENvbW1pdCA4NzFlNTFkMmQ0IGNoYW5nZWQgdGhl
IHNpZ24gb24gdGhlIHhlbmxpZ2h0IGVycm9yIHR5cGVzIChtYWtpbmcKPiB0aGUgdmFsdWVzIG5l
Z2F0aXZlLCBzYW1lIGFzIHRoZSBDLWdlbmVyYXRlZCBjb25zdGFudHMpLCBidXQgZmFpbGVkIHRv
Cj4gZmxpcCB0aGUgc2lnbiBpbiB0aGUgRXJyb3IoKSBzdHJpbmcgZnVuY3Rpb24uICBUaGUgcmVz
dWx0IGlzIHRoYXQKPiBFcnJvck5vbnNwZWNpZmljLlN0cmluZygpIHByaW50cyAibGlieGwgZXJy
b3I6IDEiIHJhdGhlciB0aGFuIHRoZQo+IGh1bWFuLXJlYWRhYmxlIGVycm9yIG1lc3NhZ2UuCgpT
aW5jZSB3ZSdyZSBoZXJlLCB3aGF0IHdvdWxkIHlvdSB0aGluayBhYm91dCByZS1kZWZpbmluZyBs
aWJ4bEVycm9ycwphcyBhIG1hcFtFcnJvcl1zdHJpbmc/IFRoYXQgd2F5LCBFcnJvcigpIGNhbiBq
dXN0IGJlOgoKZnVuYyAoZSBFcnJvcikgRXJyb3IoKSBzdHJpbmcgewogICAgICAgIGlmIHMsIG9r
IDo9IGxpYnhsRXJyb3JzW2VdOyBvayB7CiAgICAgICAgICAgICAgICByZXR1cm4gcwogICAgICAg
IH0KCiAgICAgICAgcmV0dXJuIGZtdC5TcHJpbnRmKCJsaWJ4bCBlcnJvcjogJWQiLCBlKQp9CgpJ
IHRoaW5rIGl0J3MgbGVzcyBlcnJvci1wcm9uZSBhbmQgZWFzaWVyIHRvIHJlYWQuIFRob3VnaHRz
PwoKLU5SCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
