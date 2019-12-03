Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304CD10FC79
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 12:27:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic6Iv-0000e9-R3; Tue, 03 Dec 2019 11:25:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ic6It-0000e3-IW
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 11:25:15 +0000
X-Inumbo-ID: 934ef2d8-15bf-11ea-81d9-12813bfff9fa
Received: from mail-lf1-f68.google.com (unknown [209.85.167.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 934ef2d8-15bf-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 11:25:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id n25so2669472lfl.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 03:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KiHk/6nWNAFO+eOLO24CgB3XNqTPXi0iCmSguM7lvYE=;
 b=d8zqwuZR1iIJbOCN2A+6miE6C5LdE8bM9pnpcMar7jjs0HD9PSSRmD1c0F56xbTlea
 djWHLMq/qW0na6ChzUvL/IuDOrSZ9vC3mM2TflwQPP8VNhpKp0y6ydC4puy3zeppEIFd
 iw4n6CElAWJBXx45dSsLznlViKyOMSNhAro3bwPpaQkguZXVA+RTM8Fpp/yHM/N/727F
 jOkxzTXJWdVHfwH4KJTx0pnRhhOg1oEdRQ6fbfRKNf9Iv7cQtYLJbbL7wUCSp6j2MmEM
 6ZPJfmoXp1DKm00BkF4zlIAd3//KPlq37sd25r6JMBkaeVFxOFKHT8oSoEL1V1uZ5tBU
 TW3A==
X-Gm-Message-State: APjAAAUuJ6x/4UGc7n/Vd92JmtT9LaUV/XQ+9qEKIprcO0yAniFaIwxe
 I/bwFj1/vG11VlWp/HzjItGYXIcPGTs=
X-Google-Smtp-Source: APXvYqwdS1LJjC5D5mEdTdA35yV0cvRYHQLuNqQIcLEi6CQYKrvPfRXgTyQURsN+wDEQVT9wTsIV7w==
X-Received: by 2002:a19:5f45:: with SMTP id a5mr2478829lfj.10.1575372313831;
 Tue, 03 Dec 2019 03:25:13 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id n3sm1141839lfk.61.2019.12.03.03.25.13
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 03:25:13 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id d20so3295904ljc.12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 03:25:13 -0800 (PST)
X-Received: by 2002:a2e:585e:: with SMTP id x30mr2349419ljd.141.1575372312498; 
 Tue, 03 Dec 2019 03:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20191203103352.29728-1-roger.pau@citrix.com>
 <20191203103352.29728-2-roger.pau@citrix.com>
In-Reply-To: <20191203103352.29728-2-roger.pau@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Tue, 3 Dec 2019 11:24:54 +0000
X-Gmail-Original-Message-ID: <CAK9nU=oibgda_FQeAdntto_vvyDJ4aPK6SiXFvW-4Fm_UmbsRQ@mail.gmail.com>
Message-ID: <CAK9nU=oibgda_FQeAdntto_vvyDJ4aPK6SiXFvW-4Fm_UmbsRQ@mail.gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/2] automation: add timestamps to Xen tests
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAzIERlYyAyMDE5IGF0IDEwOjM1LCBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPgo+IEVuYWJsZSBYZW4gdGltZXN0YW1wcyBpbiB0aGUgYXV0b21h
dGVkIFhlbiB0ZXN0cywgdGhpcyBpcyBoZWxwZnVsIGluCj4gb3JkZXIgdG8gZmlndXJlIG91dCBp
ZiBYZW4gaXMgc3R1Y2sgb3IganVzdCBzbG93IGluIHRoZSBhdXRvbWF0ZWQKPiB0ZXN0cy4KPgo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
QWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
