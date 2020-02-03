Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A94150452
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 11:33:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyYzK-00052t-OI; Mon, 03 Feb 2020 10:29:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIUd=3X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyYzJ-00052o-0y
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 10:29:53 +0000
X-Inumbo-ID: 1b9f0228-4670-11ea-8e44-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b9f0228-4670-11ea-8e44-12813bfff9fa;
 Mon, 03 Feb 2020 10:29:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so17258063wrt.6
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2020 02:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oKKUMUsSLjqkHphqPkxUTrs2gaZMsk3U69dgelwzL2Q=;
 b=HVggZgTKlzy0VFQzQ/9HsCNbH/9pol37L261F/UIczO/ByJgJ7uQpr4WJvMQbD6I9w
 2s1u4XkznuToi6MIOIQG6vbAAP5jUtmGTRbztGuwFJukBsED9SZ4Uh9/PROY/935zOHF
 GpQ0DYaywH1kZ8HgZebUsC/jVfQFOIulrUV9P4I4etdZRRu33uDpzYicvp/4x2JWONjY
 kwF0Ccm4vkB2BjnOauDj+yboHO2tM9NzHyCcEjNSYRvsyAisZvN3EeMrI3XL5Cvnf+En
 GKgS5XlVjzHKqZQahBkO+4TOxmDhjMuT25kVm3QqrrLQIRdYZgq4G+MkVzlNq21DybCs
 G3aw==
X-Gm-Message-State: APjAAAXV9UwsOkcOFFHbqb3WihmFneHZFbjDBHTc7EW6iXKUdvBi6X9m
 x3icaboIyQcGj+AWGdvfUR0=
X-Google-Smtp-Source: APXvYqyoOqKI4QiCknNlMTpaun34+uGglOviQ4DQ5qi3kZfKAUsHmRkvNaIE6rZcUDB4PQyu9sJj9A==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr15404181wru.40.1580725789788; 
 Mon, 03 Feb 2020 02:29:49 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id y1sm12353355wrq.16.2020.02.03.02.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 02:29:49 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-4-jgross@suse.com>
 <c4fd4a18-14a0-c209-f065-30f705f21071@xen.org>
 <c2efa258-183f-1706-f497-88999a97fb9d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e9c2d189-9cd3-01f4-0ab1-e5fd992c790b@xen.org>
Date: Mon, 3 Feb 2020 10:29:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <c2efa258-183f-1706-f497-88999a97fb9d@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 3/9] docs: add feature document for Xen
 hypervisor sysfs-like support
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMS8yMDIwIDE0OjE3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDIxLjAxLjIw
IDE0OjE0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhvd2V2ZXIsIEkgYW0gbm90IHN1cmUgd2hh
dCBhcmUgYWN0dWFsbHkgdGhlIHRhZ3M/IERvIHlvdSBoYXZlIGEgCj4+IGNvbmNyZXRlIGV4YW1w
bGUgaG93IHRoZXkgY2FuIGJlIHVzZWQ/Cj4gCj4gSSdsbCBhZGQgdGhpcyBvbmU6Cj4gCj4gL2Nw
dS1idWdzL2FjdGl2ZS1wdi94cHRpICgwfDEpIFt3LFg4NixQVl0KPiAKPj4KPj4+ICsKPj4+ICsq
IHcgLS0gUGF0aCBpcyB3cml0YWJsZSBieSB0aGUgdXNlci4gVGhpcyBjYXBhYmlsaXR5IGlzIHVz
dWFsbHkKPj4+ICvCoCBsaW1pdGVkIHRvIHRoZSBjb250cm9sIGRvbWFpbiAoZS5nLiBkb20wKS4K
Pj4+ICsqIEFSTSB8IEFSTTMyIHwgWDg2OiB0aGUgcGF0aCBpcyBhdmFpbGFibGUgZm9yIHRoZSBy
ZXNwZWN0aXZlIAo+Pj4gYXJjaGl0ZWN0dXJlCj4+PiArwqAgb25seS4KPj4KPj4gSG93IGFib3V0
IEFybTY0PyBBbHNvLCBpZiBpdCBpcyBzdXBwb3J0IGJ5IGJvdGggYXJtNjQgYW5kIGFybTMyLCAK
Pj4gc2hvdWxkIHdlIHVzZSBBUk0gb3IgQVJNMzIsQVJNNjQ/Cj4gCj4gQVJNNjQgc2hvdWxkIGJl
IGFkZGVkIGFuZCBJJ2Qgc3VnZ2VzdCB0byB1c2UgIkFSTSIgaW5zdGVhZCBvZgo+ICJBUk0zMixB
Uk02NCIuCgpJIGFtIGhhcHB5IHdpdGggdGhhdC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
