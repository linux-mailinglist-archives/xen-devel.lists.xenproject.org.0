Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E915914CE8E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:40:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwqLS-0002Xp-OI; Wed, 29 Jan 2020 16:37:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JZHc=3S=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwqLQ-0002Xc-Rm
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:37:36 +0000
X-Inumbo-ID: a8045880-42b5-11ea-ad98-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8045880-42b5-11ea-ad98-bc764e2007e4;
 Wed, 29 Jan 2020 16:37:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwqLO-00033N-Nx; Wed, 29 Jan 2020 16:37:34 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwqLO-0002Zj-EL; Wed, 29 Jan 2020 16:37:34 +0000
Date: Wed, 29 Jan 2020 16:37:31 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200129163731.ddvwzyhcjhollbv3@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-2-liuwe@microsoft.com>
 <da7d04bd-b2cf-996b-df83-49d928040ae1@suse.com>
 <20200128151520.al3xp7yxntdpq5el@debian>
 <345b5392-2f89-0a37-bac8-e88b0714028c@suse.com>
 <20200129144248.w7dk6h5dxl75hpg4@debian>
 <b32dbbf3-f685-29c5-86c3-9f52f2db6a63@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b32dbbf3-f685-29c5-86c3-9f52f2db6a63@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 1/7] x86: provide executable fixmap
 facility
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDM6NTk6MzJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6ClsuLi5dCj4gPj4gSSBzZWVtIHRvIHJlY2FsbCByZWNvbW1lbmRpbmcgdG8gZXhwb3J0IGFi
c29sdXRlIHN5bWJvbHMgZnJvbQo+ID4+IGFzc2VtYmx5IGNvZGUuIFRoZSBxdWVzdGlvbiBpcyBo
b3cgZWFzaWx5IHVzYWJsZSB0aGV5IHdvdWxkCj4gPj4gYmUgZnJvbSBDLCBvciBob3cgY2x1bXN5
IHRoZSByZXN1bHRpbmcgY29kZSB3b3VsZCBsb29rLgo+ID4gCj4gPiBFdmVuIGlmIEkgdXNlIGFi
c29sdXRlIHN5bWJvbCBJIHdvdWxkIHN0aWxsIG5lZWQgdG8gZGVmaW5lIGEgbWFjcm8gZm9yCj4g
PiBpdC4gVGhlcmUgaXMgbm8gd2F5IGFyb3VuZCBpdCwgYmVjYXVzZSBlbnVtIGNhbid0IGJlIHVz
ZWQgaW4gYXNtIG9yCj4gPiBsaW5rZXIgc2NyaXB0Lgo+IAo+IEknbSBhZnJhaWQgSSBkb24ndCB1
bmRlcnN0YW5kLiBXaHkgYSBtYWNybz8gVGhlIGFic29sdXRlIHN5bWJvbCB3b3VsZAo+IGJlIHRo
ZXJlIHRvIGNvbW11bmljYXRlIHRoZSByZWxldmFudCAoZW51bS1kZXJpdmVkKSB2YWx1ZSB0byB0
aGUKPiBsaW5rZXIgc2NyaXB0LiBJLmUuIHdpdGgKPiAKPiBlbnVtIHsgZTAsIGUxLCBlMiB9Owo+
IAo+IGluIHNvbWUgQyBmaWxlCj4gCj4gYXNtICggIi5lcXUgR0JMX2UyLCAlYzA7IC5nbG9iYWwg
R0JMX2UyIiA6OiAiaSIgKGUyKSApOwo+IAo+IHdoaWNoIEkgdGhlbiBob3BlIHdvdWxkIGFsbG93
IHlvdSB0byB1c2UgR0JMX2UyIGluIHRoZSBsaW5rZXIKPiBzY3JpcHQgQVNTRVJUKCkuCj4gCgpP
Sy4gTGV0IG1lIHNlZSBpZiB0aGlzIGlzIHBvc3NpYmxlLgoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
