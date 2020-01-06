Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E41313D5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:38:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioTUq-0004Ab-UT; Mon, 06 Jan 2020 14:36:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XhR8=23=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ioTUo-0004AQ-RI
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:36:42 +0000
X-Inumbo-ID: efbf0f3e-3091-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efbf0f3e-3091-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 14:36:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so49838951wre.10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2020 06:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/UjbhP5DxPd0m/7hfMSsCOtBNPvXmKG8RxJx7Jna2Lo=;
 b=gICPQkQSaxcUAvL7fE2fwUW17N4rHjFDbaMhIuokgb/Ybu2YmZT11MC+YCBe+p2MrA
 JLhV3x3ijXC3RJIcJ5XrkOFIcDQmi7cuPH2WAVzm5auDryQDey4RhTgmJ/fTex4vPRpG
 JXpTEKFLox+YhH8UmQHovoiGaMJvBm445xx3AKcp/k9uk7m3yPSEs+MPPAx60+9FZgZq
 vuKFUQS5Vy2rKzNc3uammiQwOmobGsuK1L+PUB1vZsTlmP5BJ5bIq8nCZunpjpLQyYwA
 dDTPXNGbszNo4ogMrZmljssKuRUXacdvyyx9HPf+9Xo3v5mDS1EQ6mBWI7HhJlmMBbw0
 LbRQ==
X-Gm-Message-State: APjAAAUb2a+AB63qu56TEmxuD6jCr17wxIyPKmxxFxtmK0CWVwVRpyRJ
 3G+JMJpeBd05uFOBHaQfHiY=
X-Google-Smtp-Source: APXvYqyBNrARjJkx7tBYqE9XVMWzVICjxVAJQKXDOYA++UwEIWH7Y0cCGZy4huWZ0uwqJJhPGw/hrQ==
X-Received: by 2002:adf:f501:: with SMTP id q1mr75411923wro.263.1578321393562; 
 Mon, 06 Jan 2020 06:36:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id a14sm77384149wrx.81.2020.01.06.06.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 06:36:32 -0800 (PST)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
 <6e003ed5-a19d-f759-81e5-0dee252b2b1e@xen.org>
 <20200106105043.GH1267@perard.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <52c3cb72-928e-cf91-f182-34bcfc52d50f@xen.org>
Date: Mon, 6 Jan 2020 14:36:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200106105043.GH1267@perard.uk.xensource.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v2 0/6] xen: Kconfig update with few
 extra
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNi8wMS8yMDIwIDEwOjUwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBPbiBNb24s
IERlYyAyMywgMjAxOSBhdCAwNjo0NDoxMVBNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+
IEhpLAo+Pgo+PiBPbiAxNy8xMi8yMDE5IDExOjU4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4+
IFBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOgo+Pj4gaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQveGVuLXVuc3RhYmxlLmdpdCBi
ci5idWlsZC1zeXN0ZW0teGVuLWtjb25maWctdjIKPj4+Cj4+PiB2MjoKPj4+ICAgICAgIG5pdCBj
aGFuZ2VzIGluIHBhdGNoIDEgYW5kIDIuCj4+Pgo+Pj4gSGksCj4+Pgo+Pj4gVGhpcyBpcyBhIHVw
ZGF0ZSBvZiBLY29uZmlnIGFzIHVzZWQgdG8gYnVpbGQgdGhlIGh5cGVydmlzb3IuIFRoaXMgaXMg
YWxzbyBpbgo+Pj4gcHJlcGFyYXRpb24gb2YgdXNpbmcgS2J1aWxkLiBUaGUgZmlyc3QgdmVyc2lv
biBvZiB0aGUgc2VyaWVzLCB3aXRoIGEgUE9DIG9mCj4+PiB1c2luZyBLYnVpbGQgdG8gYnVpbGQg
eGVuIGNhbiBiZSBmb3VuZCBoZXJlOgo+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTEwL21zZzAxNjA5Lmh0bWwKPj4+Cj4+PiBOZXcg
ZmVhdHVyZXMgb2YgS2NvbmZpZzoKPj4+ICAgICAgIC0gQ2FuIHJ1biBzaGVsbCBjb21tYW5kcyEK
Pj4+ICAgICAgIC0gVXBkYXRlIHRvIHRoZSBncmFwaGljYWwgbWVudWNvbmZpZywgeGNvbmZpZy4g
SXQncyBub3cgYnVpbHQgd2l0aCBRdDQvUXQ1Lgo+Pgo+PiBTaGFsbCB3ZSB1cGRhdGUgdGhlIGRl
cGVuZGVuY2llcyBpbiBSRUFETUU/Cj4gCj4gTm8gbmVlZCwgYmVjYXVzZSBRdCAoZm9yIHhjb25m
aWcpIG9yIEdUSyAoZm9yIGdjb25maWcpIGFyZSBvcHRpb25hbCwgb25lCj4gY2FuIHVzZSBkZWZj
b25maWcgb3IgbWVudWNvbmZpZyBvciBvbmUgb2YgdGhlIG90aGVyICpjb25maWcgdG8gZ2VuZXJh
dGUKPiBYZW4ncyAuY29uZmlnLgo+IAo+Pj4KPj4+IFRoaXMgd2hvbGUgc2VyaWVzIHNob3VsZCBi
ZSAibm8gZnVuY3Rpb25hbGl0eSBjaGFuZ2VzIiwgSSB0aGluay4KPj4KPj4gVGhlIEFybSBjaGFu
Z2VzIGxvb2tzIGdvb2QgdG8gbWUuIERpZCB5b3UgYnVpbGQgdGVzdCBvbiBBcm0gKGVpdGhlciAz
Mi1iaXQKPj4gb3IgNjQtYml0KT8KPiAKPiBJJ3ZlIHJ1biB0aGUgcGF0Y2ggc2VyaWVzIG9uIG91
ciBHaXRMYWIgQ0kgYW5kIGl0IHN1Y2Nlc3NmdWxseSBjb21wbGV0ZWQsCj4gSSBob3BlIHRoYXQg
ZG9lcyB0aGUga2luZCBvZiBBcm0gYnVpbGQgeW91IGFyZSBsb29raW5nIGZvciA6LSkuCgpZZXMg
OikuIFRoYW5rIHlvdSBmb3IgYnVpbGQgdGVzdGluZyBvbiBBcm0hCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
