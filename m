Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078D3945B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 20:30:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZJb0-0007fm-Un; Fri, 07 Jun 2019 18:28:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7jHK=UG=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hZJaz-0007fh-Iz
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 18:28:09 +0000
X-Inumbo-ID: fe7a616e-8951-11e9-9d76-7ff3fb8bc93f
Received: from mail-lf1-f68.google.com (unknown [209.85.167.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe7a616e-8951-11e9-9d76-7ff3fb8bc93f;
 Fri, 07 Jun 2019 18:28:07 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id a25so2346019lfg.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2019 11:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AIgE8S8fC+66G4tDEhSahWgJ4Gskhsuawrmzt9lFLpk=;
 b=N20lQH/plHEaU+0xbJqNjQbVCV9uu6mmncKfEX/7Wbz7ZnwAqKcsJhIdpIGNMTpQgG
 AfJ36JlYXB9EXKys1IJlPA6U84otDbOxx+X9DpKjDkN39nBV4seyx8tmY6MR3kB0Xbb9
 BXHMqaoZesuSBHAul1zzNxR50iS7CJ3JFBj0NXF0jeRdUMlS/ruUCcKuDroji+9X6veL
 4hYnxnNdxjvddS6/IC9iEOAKqVC8BjW1J6/tRY4XbrsKU9qza8M58ZdtvuzChRJtNv0F
 F+wdxg1E3I1Xq/WmhUHV1wmIv0MiGHWgr/WWJdNJgnP79MyW/YBGp+dTeNva6B3RDg3P
 ox/Q==
X-Gm-Message-State: APjAAAX130hYTKNDyy2zW5I8KBmoAtXcywbfTVy3mIwrFWPbgwPJSg+5
 9XhPZjUN7fMfPn+MuFFZ+C6zrpfPBg4=
X-Google-Smtp-Source: APXvYqxoaeBgrPXNfA9+R8E7oy+GhJmadVbzEQD49pUbrj8XrKKw6jxUeupxj1qXm9KQBFkW2LV2Tg==
X-Received: by 2002:ac2:5231:: with SMTP id i17mr27977296lfl.39.1559932086062; 
 Fri, 07 Jun 2019 11:28:06 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id i195sm527699lfi.87.2019.06.07.11.28.05
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 11:28:05 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id l26so2310081lfh.13
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2019 11:28:05 -0700 (PDT)
X-Received: by 2002:a19:a20a:: with SMTP id l10mr22774695lfe.81.1559932085636; 
 Fri, 07 Jun 2019 11:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190531081713.55596-1-roger.pau@citrix.com>
 <20190607111751.olg5246rxfzqwtb3@Air-de-Roger>
In-Reply-To: <20190607111751.olg5246rxfzqwtb3@Air-de-Roger>
From: Wei Liu <wl@xen.org>
Date: Fri, 7 Jun 2019 19:27:00 +0100
X-Gmail-Original-Message-ID: <CAK9nU=qYUf_HS3XC9CZvYGZz=LaC=i0g0KFkkA0rhPNg5BifUQ@mail.gmail.com>
Message-ID: <CAK9nU=qYUf_HS3XC9CZvYGZz=LaC=i0g0KFkkA0rhPNg5BifUQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] automation: add clang and lld 8 tests to
 gitlab
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
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA3IEp1biAyMDE5IGF0IDEyOjE4LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBHZW50bGUgcGluZy4KPgo+IE9uIEZyaSwgTWF5IDMxLCAy
MDE5IGF0IDEwOjE3OjEzQU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+IFVzaW5n
IGNsYW5nIGFuZCBsbGQgOCByZXF1aXJlcyBpbnN0YWxsaW5nIHRoZSBwYWNrYWdlcyBmcm9tIHRo
ZQo+ID4gb2ZmaWNpYWwgbGx2bSBhcHQgcmVwb3NpdG9yaWVzLCBzbyBtb2RpZnkgdGhlIERlYmlh
biBEb2NrZXIgZmlsZXMgZm9yCj4gPiBzdHJldGNoIGFuZCB1bnN0YWJsZSB0byBhZGQgdGhlIGxs
dm0gcmVwbyBhbmQgaW5zdGFsbCBjbGFuZyBhbmQgbGxkCj4gPiBmcm9tIGl0Lgo+ID4KPiA+IEFs
c28gYWRkIHNvbWUgam9icyB0byB0ZXN0IGJ1aWxkaW5nIFhlbiB3aXRoIGNsYW5nIDggYW5kIGxs
ZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKSGF2ZSB5b3UgcHVzaGVk
IHRoZSBuZXcgY29udGFpbmVycyB0byBHaXRsYWIgQ0k/CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
