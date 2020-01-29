Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46D114D2B1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 22:46:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwv7H-0006Tb-GP; Wed, 29 Jan 2020 21:43:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tCRk=3S=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iwv7F-0006TW-JK
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 21:43:17 +0000
X-Inumbo-ID: 5b707d34-42e0-11ea-8396-bc764e2007e4
Received: from mail-wr1-f42.google.com (unknown [209.85.221.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b707d34-42e0-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 21:43:16 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d16so1296100wre.10
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 13:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/uqSMoOWHrvK6Z6MQWRBouxJF63urGk+KI3RAoeCp8=;
 b=dpSBB0ozuTPtTiJmXVW4Grolj8MEvimgQM9KdX8JV0H+pu8T27Rnck1lo0kGYsaNEV
 RXw/GJF9UqviZ99M2UOWLTkRbVDKQ1FHUzbLq5brOxCebV5pUHFgT2kXHTmiwO/liqwh
 f/J3Z/nzoJ0nWcyPqwSZvQWNGrFlvOwCMnDd9nUFejlIIep75sCDa3JfqnNWOa0G5I0x
 GD5kp0HKZ305PKsng/RNytc02bo2FRvxQi/BKzG31Z/ZTPUPnVsIhPS+vzDN4kAwag0E
 eMJ6ZPWWsXq96zSNMMA2r8+DigFlDXBWgSUAQfl0OCmYZY5Ft+Knc+/LViMOnSPLcEQY
 dvsQ==
X-Gm-Message-State: APjAAAWMh21Q0Y6V2LtcoPUwfmKuhO0z4YwetrWTFYNvdpUU1ouDYDZZ
 KFlAs01KHaJtrajasKjY+UA=
X-Google-Smtp-Source: APXvYqxJDYqKuK83aHYe0pn/54XsagAS7WtaHJ6254n0tbtdK7LZAW+zqB4Pj7b7XIEhCNEoD8upzg==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr968917wro.202.1580334195938; 
 Wed, 29 Jan 2020 13:43:15 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id z133sm3975038wmb.7.2020.01.29.13.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 13:43:15 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, Wei Liu <Wei.Liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth@citrix.com>
References: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4188e077-2f77-f65c-2a09-4faa83cf0998@xen.org>
Date: Wed, 29 Jan 2020 21:43:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [Vote] Approve hypervisor project check-in policy
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKKzEuCgpDaGVlcnMsCgpPbiAyNy8wMS8yMDIwIDE0OjEyLCBHZW9yZ2UgRHVubGFw
IHdyb3RlOgo+IEkgaGF2ZSBkcmFmdGVkIGFuIGV4cGxpY2l0IHBvbGljeSBvbiB3aGF0IGlzIChn
ZW5lcmFsbHkpIHJlcXVpcmVkIHRvCj4gY2hlY2sgYSBwYXRjaCBpbi4gIEl0J3MgYmVlbiB0aHJv
dWdoIHNldmVyYWwgcm91bmRzLCBhbmQgdjQgaGFzIGJlZW4KPiBhY2tlZCBbMV0uCj4gCj4gSSd2
ZSBoYWQgaW5mb3JtYWwgYXNzZW50IGZyb20gYWxsIGNvbW1pdHRlcnMsIGJ1dCBqdXN0IHRvIGRv
dCBhbGwgb3VyCj4gaSdzIGFuZCBjcm9zcyBhbGwgb3VyIHQncywgaXQncyBwcm9iYWJseSB3b3J0
aCBoYXZpbmcgYSB2b3RlIG9mIHRoZQo+IGNvbW1pdHRlcnMsIGluIGxpbmUgd2l0aCB0aGUgWGVu
UHJvamVjdCBnb3Zlcm5hbmNlIHBvbGljeSBbMV0uCj4gCj4gUGxlYXNlIHJlc3BvbmQgYnkgMTAg
RmVicnVhcnkgd2l0aCB5b3VyIHZvdGU6Cj4gKzE6IGZvciBwcm9wb3NhbAo+IC0xOiBhZ2FpbnN0
IHByb3Bvc2FsCj4gaW4gcHVibGljIG9yIHByaXZhdGUuCj4gCj4gVGhhbmtzLAo+ICAgLUdlb3Jn
ZQo+IAo+IFsxXSBodHRwczovL21hcmMuaW5mby8/aT08MjAyMDAxMTMxNTA0NTUuNDAwNzMzLTEt
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IFsyXSBodHRwczovL3hlbnByb2plY3Qub3JnL2Rl
dmVsb3BlcnMvZ292ZXJuYW5jZS8KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVsCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
