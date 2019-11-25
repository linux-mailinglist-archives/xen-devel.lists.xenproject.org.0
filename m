Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EDB1092A3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:09:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZHpO-0000gS-2X; Mon, 25 Nov 2019 17:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RAVF=ZR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZHpL-0000gC-Sl
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:07:07 +0000
X-Inumbo-ID: 0286d172-0fa6-11ea-9455-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0286d172-0fa6-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 17:07:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j18so353786wmk.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 09:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Bwao719NxAmgll2NrW7HBe4Pdt0rPTD9Cn5uAchB1AI=;
 b=C4x40m6loetYaSjAxgy6cBC8LvcfqH7PP2Jb5fSWv3L7eSFz6DBnIe8R33+hREpp4I
 6E/B3g+zhzBuYsHmtPA/FcWA1LukY/8Gwb6y8R4VRu1FZFVQR99Mpn/AUDbmBgNEGaXs
 uU07BA730FKOVa/Gm/tXP5bgpLiskrZyGMriOckKUyGljRzngJN0va86Hf4u575QsAf5
 bILje0dALfuzkdJYhGxsg2jUQsri17yZs9Za8WHHh/MTmbpWYiBTNhM5Ex4YH12XZEra
 sIadClpVnCXaF5aTXiN/BLieZX/Q6g6zLfJY5VGR/O3iHRM7vVsU3qutLKrQM8fmqirW
 t8ug==
X-Gm-Message-State: APjAAAWv/se1glwahdrJyiIaizDnJnWODZGWNvI7dKDMJ8BAvkFlx71L
 pDxS+7TV1gIVwIN/FdAltuE=
X-Google-Smtp-Source: APXvYqz5+ve27DUqZjJAukDRDs1PSmL2IvvDdFRyvOYmjt6Chxee57ce63W+3uCvlYBLX3cTLDgaUw==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr28810662wml.47.1574701626671; 
 Mon, 25 Nov 2019 09:07:06 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id s82sm9194795wms.28.2019.11.25.09.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 09:07:05 -0800 (PST)
Date: Mon, 25 Nov 2019 17:07:04 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191125170704.etgloq6y2e7j6ewg@debian>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
 <20191125140606.6jmltrc624zugnqv@debian>
 <20191125155931.GA980@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125155931.GA980@Air-de-Roger>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDQ6NTk6MzFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKWy4uLl0KPiAKPiBXaGljaCBJIHRoaW5rIGl0J3MgZXhwZWN0ZWQsIHdlIGFscmVh
ZHkga25ldyBjbGFuZyBoYWQgYSBsb3Qgb2YKPiBkdXBsaWNhdGUgc3ltYm9scy4gVGhlIG9ubHkg
d2F5IEkga25vdyB0byB3b3JrYXJvdW5kIHRoaXMgQVRNIGlzIHRvCj4gdXNlIGBnbWFrZSB4ZW4g
Y2xhbmc9eSBDT05GSUdfRU5GT1JDRV9VTklRVUVfU1lNQk9MUz1uYC4gSXQncyBvbiBteQo+IHBp
bGUgb2Ygc3R1ZmYgdG8gbG9vayBpbnRvLCBidXQgSSdtIG5vdCBzdXJlIHdoZW4gSSB3aWxsIGdl
dCB0byBpdC4KCkluIHRoYXQgY2FzZSB3ZSBzaG91bGQgbWFrZSBHaXRsYWIgQ0kgdXNlIHRoZSBu
ZXcgY29uZmlndXJhdGlvbiBvcHRpb24uCgpXZWkuCgo+IAo+IFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
