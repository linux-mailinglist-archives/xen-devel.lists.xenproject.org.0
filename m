Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43FD108F97
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:08:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZF0J-0007ko-9l; Mon, 25 Nov 2019 14:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RAVF=ZR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZF0H-0007kK-Qb
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:06:13 +0000
X-Inumbo-ID: bae7bf16-0f8c-11ea-b3bd-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bae7bf16-0f8c-11ea-b3bd-bc764e2007e4;
 Mon, 25 Nov 2019 14:06:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so18198994wrr.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 06:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UVcr7oHlgRQ2/Iut9KkLqHYf0ZFUiEs7j7iqV0/fXT0=;
 b=F/8WO2XkMkm2Re2kMD5WBd3DrD9WqXtDryUbxlCFyUnusC5w62GWV3AVGNGHk4diOX
 KgWosedqbz4LlkmuVlk/DDewGsu8uB7RqV7zszDEuncd6Vhww0/SGTvCav9145xAO8cr
 RAK/DohKCB9eSl5g5/iujN3F5LuV5IW18OMXbnnEzAi8ov1xRKiBYjcfCgMkBEe5wR/G
 ZpO8DQdDh1ECWa2nkMsvYA0nYNxJJkSl8Q0sjl4C8KcMaZrL/tTIxrh37QDlYUxAFe4w
 +yh7zzYNU0c32zRu/d02kg4UwJLHqihT500/wxQq0AVGTjwtEA4diq3C1tedsdK2nS8P
 ZXrQ==
X-Gm-Message-State: APjAAAUuCUQk1jFgmoCzX394m0fQHRH5SuV0PixpYA7Y4lieh7+FIFdt
 1TI3CSNpqAtaNOchmR+aEoc=
X-Google-Smtp-Source: APXvYqzk0lWMpe1Br2iVITpq+V7kBD2wR+ZXBrLD4/rss7zDr4l6Xh6IdlSnsul24prLiU5nxfOdbg==
X-Received: by 2002:adf:f987:: with SMTP id f7mr31867584wrr.284.1574690769008; 
 Mon, 25 Nov 2019 06:06:09 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id q15sm9267008wrv.61.2019.11.25.06.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 06:06:08 -0800 (PST)
Date: Mon, 25 Nov 2019 14:06:06 +0000
From: Wei Liu <wl@xen.org>
To: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <20191125140606.6jmltrc624zugnqv@debian>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2MgUm9nZXIgLS0geW91J3JlIG91ciByZXNpZGVudCBDbGFuZyBleHBlcnQuIDotKQoKT24gTW9u
LCBOb3YgMjUsIDIwMTkgYXQgMDg6MDI6MTdBTSAtMDYwMCwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6
Cj4gT24gMTEvMjEvMTkgMTI6MDUgQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gCj4gPiBXaGVy
ZSBkbyB3ZSBzdGFuZCB3aXRoIFhlbiA0LjEzIHJlZ2FyZGluZyBibG9ja2VycyBhbmQgcmVsYXRl
ZCBwYXRjaGVzPwo+ID4gCj4gMS4gQ3VycmVudGx5IHRoZSBkZWZhdWx0ICJtYWtlIGluc3RhbGwi
IGZhaWxzIHdpdGggZXJyb3JzIGluCj4gdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yIGlmIHlvdSBk
b24ndCBoYXZlIGEgbmV3IGVub3VnaCBHQ0MuIENhdXNpbmcKPiBmYWlsdXJlcyBvbiBkaXN0cm9z
IHRoYXQgYXJlIGNvbnNpZGVyZWQgc3RpbGwgc3VwcG9ydGVkIGJhc2VkIG9uIFJFQURNRS4KPiAK
PiAyLiBUaGUgaHlwZXJ2aXNvciBjdXJyZW50bHkgZmFpbHMgdG8gYnVpbGQgd2l0aCBjbGFuZyB1
c2luZyB2ZXJzaW9ucyB0aGF0Cj4gUkVBRE0gc2F5cyBhcmUgc3VwcG9ydGVkIG5vIG1hdHRlciB0
aGUgY29uZmlndXJhdGlvbi4KPiAKCkRvIHlvdSBoYXZlIGEgbGluayB0byB0aGUgbG9nPyBJIGd1
ZXNzIHRoZSBhbnN3ZXIgaXMgdG8gZ28gdG8gZ2l0bGFiPwoKV2VpLgoKPiAtLQo+IAo+IERvdWcK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
