Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F416B390
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 23:07:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6LpJ-0000Ac-Hc; Mon, 24 Feb 2020 22:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6LpH-0000AX-MN
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 22:03:43 +0000
X-Inumbo-ID: 84ceaa04-5751-11ea-9251-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84ceaa04-5751-11ea-9251-12813bfff9fa;
 Mon, 24 Feb 2020 22:03:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z15so3938332wrl.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 14:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UzZODFYNiIog1ES3vwCfAbkgnnhjBgwDjEwkwQQSzrQ=;
 b=PWfD+YF2VGyfLiBb6lgBzC7FnMLBOog+7W9jEScCfhmYNqw3smbzcPVK7pPlRCpUU+
 hrmIU1K/3Q/oYXHv6P9wqcCVZWHyRat3x/OZCoqvcOxGNXjzrQHPOv/cksRqs6TdxOS6
 2Z4byOYVN8I4FMnwtzEKeTu8kMoh1zocbIM2W0Z+LeNIzHlhCmJBHlIWMpC9F/Q09LHl
 lO4fm9GcPzdQZuCjnXBDzfRwPBTZW4FBASvIJkervhggq391RG2wYlNgyeVvMBX26lLu
 pNEjfEv8Ksbu3pJlx64XP5BwHglkhe5VsGzXX1rBzgV3TmOa8JnoNqVLeHtpxD0bV5O4
 8weg==
X-Gm-Message-State: APjAAAWNi4+lcUVGPgMql8Dp2X5jByQJRLksGFZXpEbLarVeXLGRt6oQ
 w2sCkHRg4i3vIYx8HsweV9M=
X-Google-Smtp-Source: APXvYqzb14q2YdA1USmbBveRXcK+iH9lHkp2L1nax6tVd0PTWBxVxpziiK3Tq/2sxWONLpq7hMtt1Q==
X-Received: by 2002:a5d:61cf:: with SMTP id q15mr66911231wrv.74.1582581821686; 
 Mon, 24 Feb 2020 14:03:41 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id l4sm3211999wrv.22.2020.02.24.14.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 14:03:40 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5E53B3E3.6070304@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8bb7d100-0ca4-c0f9-b294-f2e7a173e1c9@xen.org>
Date: Mon, 24 Feb 2020 22:03:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5E53B3E3.6070304@hisilicon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] ns16550: Re-order the serial port address
 checking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgV2VpLAoKVGhhbmsgeW91IGZvciBzZW5kaW5nIGEgZm9sbG93LXVwLgoKT24gMjQvMDIvMjAy
MCAxMTozMCwgV2VpIFh1IHdyb3RlOgo+IENoZWNrIHRoZSBzZXJpYWwgcG9ydCBhZGRyZXNzIHNw
YWNlIGJlZm9yZSBjaGVja2luZyB0aGUgYWRkcmVzcy4KCkNvdWxkIHlvdSBleHBsYWluIGluIGEg
c2VudGVuY2Ugd2h5IHlvdSB3YW50IHRvIHJlLW9yZGVyPwoKQ2hlZXJzLAoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBXZWkgWHUgPHh1d2VpNUBoaXNpbGljb24uY29tPgo+IC0tLQo+ICAgeGVuL2RyaXZl
cnMvY2hhci9uczE2NTUwLmMgfCAxMiArKysrKystLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL2NoYXIvbnMxNjU1MC5jIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBpbmRleCBk
YzhhYzRjLi40MjVlMDQ0IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5j
Cj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBAQCAtMTY0NCw2ICsxNjQ0LDEy
IEBAIHN0YXRpYyBpbnQgX19pbml0IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQoY29uc3Qgdm9pZCAq
ZGF0YSkKPiAKPiAgICAgICBzcGNyID0gY29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3QgYWNwaV90
YWJsZV9zcGNyLCBoZWFkZXIpOwo+IAo+ICsgICAgaWYgKCB1bmxpa2VseShzcGNyLT5zZXJpYWxf
cG9ydC5zcGFjZV9pZCAhPSBBQ1BJX0FEUl9TUEFDRV9TWVNURU1fTUVNT1JZKSApCj4gKyAgICB7
Cj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBBZGRyZXNzIHNwYWNlIHR5cGUgaXMgbm90IG1t
aW9cbiIpOwo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgfQo+ICsKPiAgICAgICAv
Kgo+ICAgICAgICAqIFRoZSBzZXJpYWwgcG9ydCBhZGRyZXNzIG1heSBiZSAwIGZvciBleGFtcGxl
Cj4gICAgICAgICogaWYgdGhlIGNvbnNvbGUgcmVkaXJlY3Rpb24gaXMgZGlzYWJsZWQuCj4gQEAg
LTE2NTQsMTIgKzE2NjAsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlfdWFydF9p
bml0KGNvbnN0IHZvaWQgKmRhdGEpCj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAg
IH0KPiAKPiAtICAgIGlmICggdW5saWtlbHkoc3Bjci0+c2VyaWFsX3BvcnQuc3BhY2VfaWQgIT0g
QUNQSV9BRFJfU1BBQ0VfU1lTVEVNX01FTU9SWSkgKQo+IC0gICAgewo+IC0gICAgICAgIHByaW50
aygibnMxNjU1MDogQWRkcmVzcyBzcGFjZSB0eXBlIGlzIG5vdCBtbWlvXG4iKTsKPiAtICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiAtICAgIH0KPiAtCj4gICAgICAgbnMxNjU1MF9pbml0X2NvbW1v
bih1YXJ0KTsKPiAKPiAgICAgICAvKgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
