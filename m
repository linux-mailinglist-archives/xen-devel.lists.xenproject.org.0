Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F58164385
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 12:37:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4NdR-000341-Ea; Wed, 19 Feb 2020 11:35:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4NdQ-00033w-BM
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 11:35:20 +0000
X-Inumbo-ID: e7e916a0-530b-11ea-8335-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7e916a0-530b-11ea-8335-12813bfff9fa;
 Wed, 19 Feb 2020 11:35:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n10so148112wrm.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 03:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/pPy6cK6RZk+74sfoL5emXAi5u/94Zv2kIyOHfdEl4=;
 b=qN1M2Ux0Amx2nm2p7EoAuNrkc5jVmo9M4IB9abULPtnaMuhmBizm0H7pJZoeXSxtmW
 T+g06LzZ7VPIRgI3x4GMJWEVn6H3lOdg7arN2zkxMCKt8x0P4M3cHMUyXEnAHMmvSqtE
 zJHT9U8jS1Gcuo/Whk/5IryUgfKoX14SH2VeT+yBIdBXLFXa91haBZLT6VH9KKV24q2c
 wgiFA9L3W2Ah7F4N7NocgsKH6T+k+caWI7QGxWArV5Si4fHHwxJT4XKbJlUy/sqgoSUt
 RU+xI+PifXqzuJZvenf0GNHXKkBPSVLxrebJ1eirnm1tizbv/573CUCWTBpDD4qrjBd1
 Ef+A==
X-Gm-Message-State: APjAAAU+cnxXgdyw5GF5PixRsxYAyATClymtYj2+8qPfM+38v2vJHoDP
 viNc7pnkpeoQqvl7LsZSQ1w=
X-Google-Smtp-Source: APXvYqxEkqiMmrp9F4661GPvna7pujz0iR3y1+cq7U9enwkl5YFFEcgCQuzaVVzWIaZZwqz2uHtOKg==
X-Received: by 2002:a5d:5263:: with SMTP id l3mr34914651wrc.405.1582112118316; 
 Wed, 19 Feb 2020 03:35:18 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id d9sm2553348wrx.94.2020.02.19.03.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 03:35:17 -0800 (PST)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200219102256.81594-1-roger.pau@citrix.com>
 <20200219102256.81594-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c0a6422b-c664-2967-94c9-a4b2698e28c0@xen.org>
Date: Wed, 19 Feb 2020 11:35:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219102256.81594-2-roger.pau@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v6 1/3] arm: rename BIT_{WORD/MASK/PER_WORD)
 to BITOP_*
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpPbiAxOS8wMi8yMDIwIDEwOjIyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4g
U28gQklUX1dPUkQgY2FuIGJlIGltcG9ydGVkIGZyb20gTGludXguIFRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4gY3VycmVudAo+IExpbnV4IGltcGxlbWVudGF0aW9uIG9mIEJJVF9XT1JEIGlzIHRoYXQg
dGhlIHNpemUgb2YgdGhlIHdvcmQgdW5pdCBpcwo+IGEgbG9uZyBpbnRlZ2VyLCB3aGlsZSB0aGUg
WGVuIG9uZSBpcyBoYXJkY29kZWQgdG8gMzIgYml0cy4KPiAKPiBDdXJyZW50IHVzZXJzIG9mIEJJ
VE9QX1dPUkQgb24gQXJtICh3aGljaCBjb25zaWRlcnMgYSB3b3JkIGEgbG9uZwo+IGludGVnZXIp
IGFyZSBzd2l0Y2hlZCB0byB1c2UgdGhlIGdlbmVyaWMgQklUX1dPUkQgd2hpY2ggYWxzbyBvcGVy
YXRlcwo+IG9uIGxvbmcgaW50ZWdlcnMuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5k
ZWQuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+IFN1
Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpEaWQgeW91IGJ1aWxkIHRlc3QgaXQgb24gQXJt
PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
