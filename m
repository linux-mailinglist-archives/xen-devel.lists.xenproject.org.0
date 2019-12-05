Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2CB11454E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 18:03:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icuUn-0008Kv-U9; Thu, 05 Dec 2019 17:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RYm=Z3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1icuUl-0008Kq-J1
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 17:00:51 +0000
X-Inumbo-ID: c99a680b-1780-11ea-8232-12813bfff9fa
Received: from mail-lj1-f169.google.com (unknown [209.85.208.169])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c99a680b-1780-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 17:00:50 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id j6so4439996lja.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brbDCOwHAd6FFQ5jwiZIl9B7j/GFfKIjVscKo911JGg=;
 b=qf3J3oiLMF6dH0qv6rO8rpjo/D3AFq6tviBY26elLCatlCAMWZmDb9TrnifRhBC7kr
 Z0V0C1u1QkbrtlruzL3Jr9RHUBx4lLMtJ51cC0bfAEGK/sr33Gt+kkIY4tuoZW3WYZAa
 MER/JI6/d4HyiYqCl/k0Og+I/2luSqjJRjC/sivUqxz96wAHKuka9LMunHv0W/aq1V53
 6G+fJw/TZMTyaZU5EiN9ip+weKXxHpPpY0giS6NO4ZWNCS+cZRohKdFSfBsAmn/b207F
 anWSIeKar7yPi9PoOktzl02hsZWxW+pUlBfRrIplM6WTdVGahRmd/mgYCINyPHHrQeTl
 wHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brbDCOwHAd6FFQ5jwiZIl9B7j/GFfKIjVscKo911JGg=;
 b=XoskR4FUpSMxflk+G5Sdxr7Unc5a0+HuLa0Ub7HBUv9hUs1eZqu8zFyiPtRy345BhY
 sIr0UPkYbvwzuUyrHUr97Oq/mKcSBzIijxREVyWbc1bqABHhJylHVdEcaNEUdfMWnXHX
 acIzeDbP+wh2ZrEPVfk9w2BfTavaRsbvzdWRCEbjfwp11DDogjVjRx0ZYFOV9TQ+UQxc
 a1P24U+3GWHHUjKSGz6kWmMlQGNpmBrp7oyawY/EY+eLEB8pTHFo57T2As7LVMRVl29o
 aLxjXmf44oo5Ign58Pa+2SJpXDpdmxKoMzFwRLucMSDy8G9eZzfLnk/baZ0e02+YlE+O
 T46g==
X-Gm-Message-State: APjAAAUp4yNsAg/jSWp5FWo3QNWa2kTC8wKulDibvegMRORWKA9M1hWT
 u6SOkhGSh70jwroWrO+Tjn/UqdziuwDgM1X6BLc=
X-Google-Smtp-Source: APXvYqwI8AgzCOHZ+75WnU5RCsBjSqKfHMKR5EvorUgFZTq9bVncaWzt3T7b44g0N6a45a0wcrokBT+ZrVAb5xPf5sI=
X-Received: by 2002:a2e:8916:: with SMTP id d22mr6243748lji.19.1575565249255; 
 Thu, 05 Dec 2019 09:00:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <6beae3799201ad3ad5292e08fa32861f2a1a320c.1573840474.git.rosbrookn@ainfosec.com>
 <6e0e3454-98bf-4762-2fe2-f69f7103d6e1@citrix.com>
In-Reply-To: <6e0e3454-98bf-4762-2fe2-f69f7103d6e1@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Dec 2019 12:00:38 -0500
Message-ID: <CAEBZRSdM18adVPzEB0ijJFbkaJsJ=x0NUVoY-HYx_3gpzUE_YQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 01/22] golang/xenlight: generate enum
 types from IDL
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

PiBTb3JyeSB0byBjb21lIGJhY2sgdG8gdGhpcy4uLiBJIHRoaW5rIHRoaXMgd291bGQgYmUgYmV0
dGVyIGV4cGxpY2l0bHkKPiBsaXN0aW5nIG91dCB0aGUgZmlsZXMgdGhhdCBhcmUgbmVlZGVkLiAg
QXMgSSBzYWlkLCB0aGUgY3VycmVudCB3YXkgb2YKPiBkb2luZyB0aGluZ3MgbWVhbnMgZ2VuZ290
eXBlcy5weSB3aWxsICphbHdheXMqIGJlIHJlLXJ1bjsgYW5kIHRoZQo+IHJlc3VsdCwgd2hlbiBl
eHBlcmltZW50aW5nIHdpdGggdGhlIGB0eXBlb2ZgIGJlZm9yZSwgd2FzIHRoYXQgbXkgbG9jYWwK
PiBjaGFuZ2VzIHRvIGhlbHBlcy5nZW4ucHkgd2VyZSBiZWluZyBvdmVyd3JpdHRlbi4KPgo+IEhh
dmluZyB0aGlzIGJlIGB4ZW5saWdodC5nbyB0eXBlcy5nZW4uZ28gaGVscGVycy5nZW4uZ29gIGlu
c3RlYWQgbWVhbnMKPgo+IDEpIGdlbmdvdHlwZXMgaXMgb25seSBydW4gd2hlbiBvbmUgb2YgaXRz
IGlucHV0cyBjaGFuZ2VzCj4gMikgeW91IGNhbiBtYWtlIGxvY2FsIGNoYW5nZXMgdG8gdGhlIGdl
bmVyYXRlZCBmaWxlcyBhbmQgaGF2ZSB0aGVtCj4gY29waWVkIG92ZXIKPiAzKSBUaGUgY29weWlu
ZyBvbmx5IGhhcHBlbnMgd2hlbiBvbmUgb2YgdGhlIGFib3ZlIHR3byB0aGluZ3MgaGFwcGVucwo+
IDQpIFRoZSBmaW5hbCBjb21waWxlIGlzIHNsaWdodGx5IGZhc3RlciBiZWNhdXNlIHRoZSBnbyBj
b21waWxlciBrbm93cwo+IHRoYXQgdGhlIGZpbGVzIGhhc24ndCBjaGFuZ2VkLgo+Cj4gSSBjYW4g
Y2hhbmdlIHRoaXMgb24gY2hlY2staW4gaWYgeW91J3JlIE9LIHdpdGggaXQsIGFuZCBJIGVuZCB1
cAo+IGNoZWNraW5nIHBhcnQgb2YgdGhlIHNlcmllcyBpbiBiZWZvcmUgeW91IHNlbmQgdjMuCgpU
aGF0IGFsbCBtYWtlcyBzZW5zZSB0byBtZS4gSSBoYXZlIG5vIHByb2JsZW0gd2l0aCB5b3UgbWFr
aW5nIHRoZQpjaGFuZ2Ugb24gY2hlY2staW4gaWYgeW91IGdvIHRoYXQgcm91dGUuCgpUaGFua3Ms
Ci1OUgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
