Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBCD129988
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 18:46:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijRko-00037j-Tg; Mon, 23 Dec 2019 17:44:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I8bJ=2N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ijRkm-00037C-Qj
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 17:44:24 +0000
X-Inumbo-ID: d6d8ed3c-25ab-11ea-b6f1-bc764e2007e4
Received: from mail-qk1-f196.google.com (unknown [209.85.222.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6d8ed3c-25ab-11ea-b6f1-bc764e2007e4;
 Mon, 23 Dec 2019 17:44:16 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z76so14485623qka.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 09:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+u8M2VZzDQKQtTA1mBAdb6gWubckYkskbfm60fmsp2c=;
 b=DxxEkUYpP44iLI5YVImWt+ES6W3prHC971H20LxTsxw3+U240tsmZgshnXm+1H9euQ
 Ggd/7C3MgWp8btrpTbmb9TXH2dedkS50wZRF/S/G0O1fpaC/jhwryaFREsKfHtd/duS1
 zukMlWaSX4GpmlKCxgBiZp8rfVFi5Cv7GA8wPtvZ5TOikFYJ4fywc6yPKocPq2ugy3YI
 tAqxMtlmvAfnBjJQawRjYa01L530tA8QLYmRB6Dmu/M+MH6WBJlbmfD/jeC4c/21EMlT
 A5qfOAntWb3ewegB97xYkwDuqyvj1S+n2Fjl4R2f7PZaXZy1q05TWg2zej6uIjHfRy3o
 cpvw==
X-Gm-Message-State: APjAAAVDBoQS45hx6TBEdpZot60ZzO+4bhWfUaP+S6Rw3acYWUnu65Uf
 V7+sNikql1JhjpKhLwO2lsI=
X-Google-Smtp-Source: APXvYqzQRoBFkdrjl+cEjqdhjv3ie869dGviYxvJIrN/Y/B1LhU7A27K5hIQ97XRcb10rTUxKtUh7A==
X-Received: by 2002:a37:98c6:: with SMTP id
 a189mr27489954qke.500.1577123056028; 
 Mon, 23 Dec 2019 09:44:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id d8sm6275853qtr.53.2019.12.23.09.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 09:44:15 -0800 (PST)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191217105901.68158-1-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6e003ed5-a19d-f759-81e5-0dee252b2b1e@xen.org>
Date: Mon, 23 Dec 2019 18:44:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191217105901.68158-1-anthony.perard@citrix.com>
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
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNy8xMi8yMDE5IDExOjU4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBQYXRjaCBz
ZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoKPiBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmJ1aWxkLXN5
c3RlbS14ZW4ta2NvbmZpZy12Mgo+IAo+IHYyOgo+ICAgICAgbml0IGNoYW5nZXMgaW4gcGF0Y2gg
MSBhbmQgMi4KPiAKPiBIaSwKPiAKPiBUaGlzIGlzIGEgdXBkYXRlIG9mIEtjb25maWcgYXMgdXNl
ZCB0byBidWlsZCB0aGUgaHlwZXJ2aXNvci4gVGhpcyBpcyBhbHNvIGluCj4gcHJlcGFyYXRpb24g
b2YgdXNpbmcgS2J1aWxkLiBUaGUgZmlyc3QgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLCB3aXRoIGEg
UE9DIG9mCj4gdXNpbmcgS2J1aWxkIHRvIGJ1aWxkIHhlbiBjYW4gYmUgZm91bmQgaGVyZToKPiBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTkt
MTAvbXNnMDE2MDkuaHRtbAo+IAo+IE5ldyBmZWF0dXJlcyBvZiBLY29uZmlnOgo+ICAgICAgLSBD
YW4gcnVuIHNoZWxsIGNvbW1hbmRzIQo+ICAgICAgLSBVcGRhdGUgdG8gdGhlIGdyYXBoaWNhbCBt
ZW51Y29uZmlnLCB4Y29uZmlnLiBJdCdzIG5vdyBidWlsdCB3aXRoIFF0NC9RdDUuCgpTaGFsbCB3
ZSB1cGRhdGUgdGhlIGRlcGVuZGVuY2llcyBpbiBSRUFETUU/CgoKPiAKPiBUaGlzIHdob2xlIHNl
cmllcyBzaG91bGQgYmUgIm5vIGZ1bmN0aW9uYWxpdHkgY2hhbmdlcyIsIEkgdGhpbmsuCgpUaGUg
QXJtIGNoYW5nZXMgbG9va3MgZ29vZCB0byBtZS4gRGlkIHlvdSBidWlsZCB0ZXN0IG9uIEFybSAo
ZWl0aGVyIAozMi1iaXQgb3IgNjQtYml0KT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
