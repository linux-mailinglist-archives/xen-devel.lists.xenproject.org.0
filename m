Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210651303F6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 20:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inolI-0001ep-DV; Sat, 04 Jan 2020 19:07:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1inolG-0001ek-W2
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 19:06:59 +0000
X-Inumbo-ID: 611d9fba-2f25-11ea-88e7-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 611d9fba-2f25-11ea-88e7-bc764e2007e4;
 Sat, 04 Jan 2020 19:06:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l2so46968504lja.6
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 11:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oRIuz/rjkMEhE9zEOa5N0pvfPIxa8DRJEN8OsT0fl4U=;
 b=bHhT1Bky4l+AdbmemYWBpPlJc8acKi0t1Ydtqke1Fo5dyQuZls8ZKw38faz6CiV+DW
 QbramGmwYvyZ9BbplPHiI133T/RlSVsmqvVMNnlqTj3OeIQrWIdvAmGrOtKRfi6kW2eJ
 L0O1h5Mp/FFLJD7DNWBRoHxRYWzatIbTHCYk3Ue95DLsGaH4Xw8LMHDYQ8Kg6h0AwvMh
 WqPJwRuq2TwvXy2GaK44qQp86N3uP8Lv0Nzy9TRDa9LLEkKD4hl7Kr9PfPO9zmtfrQgR
 vegsZ7b8Ifm0TwVJBNMul60xUvymISZ/fR/E13pPihgmJCqfNsxKMxEO/i+hEBdLMLD4
 ysJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oRIuz/rjkMEhE9zEOa5N0pvfPIxa8DRJEN8OsT0fl4U=;
 b=ORqLOB/Macar3flBBU1ByVUyl4c+JUsEyHjpBb1xby4vB2kT4CffDyaj0prIiBa8g6
 BLM2MFhqnPdOMdg7zw0LT2R6qvPRmhiXJChqJDiPc3IJCK2rvQyl/aaFE71gexAkxuds
 o7BZTdS5xZZ1J8oa3TIhG9rrhr0cDc3m7CIAacUs/FR478a77UChy2U4Lux9GFD9HZgs
 qxZV931hPsEVbWGwwM6KbSL19gnJtTxDs1JUK7xT/x/Fl/vbEit5mF1TV3wpRlJNUFqe
 0hyOLaj2P8NzaJN53/PzghX46bfVlysU3lG+NAhLovecgz0m0AR0J4NceQqehJggdXTn
 1KbA==
X-Gm-Message-State: APjAAAU04NT0rFVsJOgS7p4vSZyuUhrSQ/opzAN836oDP2F9Nh5RIiVd
 OjFPzF515qNCRC6p7Cg5Q2doeRGG1dsIwDthpNg=
X-Google-Smtp-Source: APXvYqz7+iI89ZRbllu7qXoDlv2nyGd8tCFLzzminAR12pv6Mi20wpdtSgkmZFfMuRzEd8L4D1FdEYk/d9DKzBf78Ck=
X-Received: by 2002:a2e:8942:: with SMTP id b2mr50599794ljk.162.1578164817319; 
 Sat, 04 Jan 2020 11:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
 <20191227163224.4113837-5-george.dunlap@citrix.com>
In-Reply-To: <20191227163224.4113837-5-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 4 Jan 2020 14:06:46 -0500
Message-ID: <CAEBZRSeM=shiVm4V+kCO4gyhVcg1-TNJi=i1S5=RBFB0ZoLUwA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 5/9] go/xenlight: More informative error
 messages
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
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IElmIGFuIGVycm9yIGlzIGVuY291bnRlcmVkIGRl
ZXAgaW4gYSBjb21wbGljYXRlZCBkYXRhIHN0cnVjdHVyZSwgaXQncwo+IG9mdGVuIGRpZmZpY3Vs
dCB0byB0ZWxsIHdoZXJlIHRoZSBlcnJvciBhY3R1YWxseSBpcy4gIE1ha2UgdGhlIGVycm9yCj4g
bWVzc2FnZSBmcm9tIHRoZSBnZW5lcmF0ZWQgdG9DKCkgYW5kIGZyb21DKCkgc3RydWN0dXJlcyBt
b3JlCj4gaW5mb3JtYXRpdmUgYnkgdGFnZ2luZyB3aGljaCBmaWVsZCBiZWluZyBjb252ZXJ0ZWQg
ZW5jb3VudGVyZWQgdGhlCj4gZXJyb3IuICBUaGlzIHdpbGwgaGF2ZSB0aGUgZWZmZWN0IG9mIGdp
dmluZyBhICJzdGFjayB0cmFjZSIgb2YgdGhlCj4gZmFpbHVyZSBpbnNpZGUgYSBuZXN0ZWQgZGF0
YSBzdHJ1Y3R1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+CgpMb29rcyBnb29kLCBqdXN0IG9uZSBuaXQtcGlja3kgY29tbWVudDoK
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5IGIvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKPiBpbmRleCBlNGVkNGQ1MGY1Li40OGUz
ZDg2ZjcwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5
Cj4gKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKPiBAQCAtMzE0LDcg
KzMxNCw3IEBAIGRlZiB4ZW5saWdodF9nb2xhbmdfY29udmVydF9mcm9tX0ModHkgPSBOb25lLCBv
dXRlcl9uYW1lID0gTm9uZSwgY3Zhcm5hbWUgPSBOb25lCj4gICAgICAgICAgIyBJZiB0aGUgdHlw
ZSBpcyBub3QgY2FzdGFibGUsIHdlIG5lZWQgdG8gY2FsbCBpdHMgZnJvbUMKPiAgICAgICAgICAj
IGZ1bmN0aW9uLgo+ICAgICAgICAgIHMgKz0gJ2lmIGVyciA6PSB4Lnt9LmZyb21DKCZ7fS57fSk7
Jy5mb3JtYXQoZ29uYW1lLGN2YXJuYW1lLGNuYW1lKQo+IC0gICAgICAgIHMgKz0gJ2VyciAhPSBu
aWwge1xuIHJldHVybiBlcnIgXG59XG4nCj4gKyAgICAgICAgcyArPSAnZXJyICE9IG5pbCB7e1xu
cmV0dXJuIGZtdC5FcnJvcmYoIkNvbnZlcnRpbmcgZmllbGQge306ICV2IiwgZXJyKSBcbn19XG4n
LmZvcm1hdChnb25hbWUpCgpJdCdzIHByZWZlcnJlZCBzdHlsZSB0byBrZWVwIGVycm9yIG1lc3Nh
Z2VzIGxvd2VyY2FzZSwgdW5sZXNzIGEgcHJvcGVyCm5vdW4gb3IgYWNyb255bSBpcyB1c2VkICh0
aGUgZmllbGQgbmFtZXMgd291bGQgYmUgY29uc2lkZXJlZCBwcm9wZXIKbm91bnMpLgoKLU5SCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
