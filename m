Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29E316AB20
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:16:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6GLd-0002jv-6A; Mon, 24 Feb 2020 16:12:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6GLc-0002jp-33
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:12:44 +0000
X-Inumbo-ID: 7c87a3cc-5720-11ea-9217-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c87a3cc-5720-11ea-9217-12813bfff9fa;
 Mon, 24 Feb 2020 16:12:43 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p3so12515359edx.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 08:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7P9zHevIcNB8EnxWfBrhe/+/kO4ndlB/8Dkj5JLA5G4=;
 b=rLh0dHnxDIC9lJYmMVoAlKVuujlgImH+8Q7Etz4vPIZQi5qmrLSIJ60v1G8SKlg2TR
 GbUPL/yJnKgnGE6Ok9i90yAQbx2A7GB4oIKdUYO4GOoBcIkntz/Cu/1AAKsUTwUhBFia
 W1U9e/rjHKoWbTavb9wk3U90hASukVdCOXEcFDH+53i0Bs8kSr7TKGHSsWEj69+EKIvZ
 VbaqIy26noB8SbFT02Tln5q9wVoZRVyJY9wkSMpAjSIsrHk5HnIDgKtRWUPp8VWeThkj
 0wyOHkoDeefEqqYhm+Rop1hvAbe58c2nVNzbAB2OUwHUE3k+mZ9lQcZwQ+bkhjrCw3tN
 pCVA==
X-Gm-Message-State: APjAAAXaPL8S54jcq0YzPG8Kje0ayUmerYu/71YY2ah9rLB8Th54KDfM
 m9JCzhVhNxMMStZGWVaqvhE=
X-Google-Smtp-Source: APXvYqzxPcyypULViOjITJ/KXdhquAlhTiSkScAJeiYBrvMVG7BPXCNLmp5uj8K2J/cnG0ofepuUlQ==
X-Received: by 2002:a50:ee16:: with SMTP id g22mr47813892eds.335.1582560762454; 
 Mon, 24 Feb 2020 08:12:42 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id va15sm824016ejb.18.2020.02.24.08.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 08:12:41 -0800 (PST)
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <532a499f00b42299d8035b4ca9c6d7bfcbdc6e1f.1582310142.git.tamas.lengyel@intel.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b58479ab-94d0-7cc2-72ff-7fbcb1374a40@xen.org>
Date: Mon, 24 Feb 2020 16:12:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <532a499f00b42299d8035b4ca9c6d7bfcbdc6e1f.1582310142.git.tamas.lengyel@intel.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v9 5/5] xen/tools: VM forking toolstack side
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAyMS8wMi8yMDIwIDE4OjQ5LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
K2ludCBsaWJ4bF9kb21haW5fZm9ya192bShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgcGRvbWlk
LCB1aW50MzJfdCAqZG9taWQpCj4gK3sKPiArICAgIGludCByYzsKPiArICAgIHN0cnVjdCB4ZW5f
ZG9tY3RsX2NyZWF0ZWRvbWFpbiBjcmVhdGUgPSB7MH07Cj4gKyAgICBjcmVhdGUuZmxhZ3MgfD0g
WEVOX0RPTUNUTF9DREZfaHZtOwo+ICsgICAgY3JlYXRlLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RG
X2hhcDsKPiArICAgIGNyZWF0ZS5mbGFncyB8PSBYRU5fRE9NQ1RMX0NERl9vb3Nfb2ZmOwo+ICsg
ICAgY3JlYXRlLmFyY2guZW11bGF0aW9uX2ZsYWdzID0gKFhFTl9YODZfRU1VX0FMTCAmIH5YRU5f
WDg2X0VNVV9WUENJKTsKClRoaXMgaXMgeDg2IHNwZWNpZmljIGJ1dCBzZWVtcyB0byBiZSB3cml0
dGVuIGluIGNvbW1vbiBjb2RlLiBEaWQgeW91IApidWlsZCBpdCBvbiBBcm0/Cgo+ICsKPiArICAg
IGNyZWF0ZS5zc2lkcmVmID0gU0VDSU5JVFNJRF9ET01VOwo+ICsgICAgY3JlYXRlLnBhcmVudF9k
b21pZCA9IHBkb21pZDsKPiArICAgIGNyZWF0ZS5tYXhfZXZ0Y2huX3BvcnQgPSAxMDIzOwo+ICsg
ICAgY3JlYXRlLm1heF9ncmFudF9mcmFtZXMgPSBMSUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFV
TFQ7Cj4gKyAgICBjcmVhdGUubWF4X21hcHRyYWNrX2ZyYW1lcyA9IExJQlhMX01BWF9NQVBUUkFD
S19GUkFNRVNfREVGQVVMVDsKClRoZSBkb21haW4geW91IGZvcmsgbWF5IGhhdmUgZGlmZmVyZW50
IHZhbHVlcyBoZXJlLiBGcm9tIG15IAp1bmRlcnN0YW5kaW5nLCB0aGUgZm9yayByZXF1aXJlcyB0
byBoYXZlIHRoZSBzYW1lIHBhcmFtZXRlcnMgYXMgdGhlIApwYXJlbnQuIFNvIGhvdyBkbyB5b3Ug
ZW5zdXJlIHRoZXkgYXJlIHRoZSBzYW1lPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
