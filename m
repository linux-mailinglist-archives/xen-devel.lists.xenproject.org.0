Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49EEF73CF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 13:25:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU8ji-0007kg-FS; Mon, 11 Nov 2019 12:24:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bh9Y=ZD=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iU8jg-0007ka-LX
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 12:24:00 +0000
X-Inumbo-ID: 236dea84-047e-11ea-9631-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 236dea84-047e-11ea-9631-bc764e2007e4;
 Mon, 11 Nov 2019 12:24:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q70so13110922wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2019 04:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iAUZCBzPop5FWM4K3eXxs8LJYVHpMJqxsoDev+iV+Rc=;
 b=qhELkSSAXNT4b6r0K21jO5sfPnRl0tPWG/U8UP6Kh/6ekv44iyb3+I1yIJhHQYrO0F
 pPIhHM3Li8ijdQ8LGF96MGahkZaLOmiiHwFLRbeqQXo1W4Bs45KEeNyMXNjdsEKUHvBr
 gm77COb212Pz0YnpBJJ0JUYga3fnYbhuXmGCD82ehLbyiUxugq/z7m0S1r48JOFks7zw
 PvyQO4QDWhk3LzJNFR1P+Wt98V4eIWQSBHbGnOLO9RNHcNO7RbQslBcp6EOne1NYUhJk
 z0F6Juhu5GhKpS9UWQvDbNeIZxxBnqJMdi3SYsEn+Cmu+od8EUCVHtxHYXQKAWk5GvLA
 Ut9g==
X-Gm-Message-State: APjAAAX6xvxmlLQd7q2ZwxKXtlknDEh/QkC62dh+UUB+EgzNxPH/LVOt
 W7tEY7gIBJo1ceQHdJXEse0=
X-Google-Smtp-Source: APXvYqwEHqQFg3rXf4HddZAyyeiUuI9Mub2Dd4d7n7ApVbS34cjaJBBiqKrX+t0dUucx4CMoiDNEQw==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr18239707wmj.61.1573475039178; 
 Mon, 11 Nov 2019 04:23:59 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id x9sm15081001wru.32.2019.11.11.04.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 04:23:58 -0800 (PST)
Date: Mon, 11 Nov 2019 12:23:56 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191111122356.uroh4t4j65q52n4n@debian>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] build: provide option to disambiguate
 symbol names
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTI6MTg6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIC5maWxlIGFzc2VtYmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBieSB0aGUgY29t
cGlsZXIgZG8gbm90IGluY2x1ZGUKPiBhbnkgcGF0aCBjb21wb25lbnRzIChnY2MpIG9yIGp1c3Qg
dGhlIG9uZXMgc3BlY2lmaWVkIG9uIHRoZSBjb21tYW5kIGxpbmUKPiAoY2xhbmcsIGF0IGxlYXN0
IHZlcnNpb24gNSksIGFuZCBoZW5jZSBtdWx0aXBsZSBpZGVudGljYWxseSBuYW1lZCBzb3VyY2UK
PiBmaWxlcyAoaW4gZGlmZmVyZW50IGRpcmVjdG9yaWVzKSBtYXkgcHJvZHVjZSBpZGVudGljYWxs
eSBuYW1lZCBzdGF0aWMKPiBzeW1ib2xzIChpbiB0aGVpciBrYWxsc3ltcyByZXByZXNlbnRhdGlv
bikuIFRoZSBiaW5hcnkgZGlmZmluZyBhbGdvcml0aG0KPiB1c2VkIGJ5IHhlbi1saXZlcGF0Y2gs
IGhvd2V2ZXIsIGRlcGVuZHMgb24gaGF2aW5nIHVuaXF1ZSBzeW1ib2xzLgo+IAo+IE1ha2UgdGhl
IEVORk9SQ0VfVU5JUVVFX1NZTUJPTFMgS2NvbmZpZyBvcHRpb24gY29udHJvbCB0aGUgKGJ1aWxk
KQo+IGJlaGF2aW9yLCBhbmQgaWYgZW5hYmxlZCB1c2Ugb2JqY29weSB0byBwcmVwZW5kIHRoZSAo
cmVsYXRpdmUgdG8gdGhlCj4geGVuLyBzdWJkaXJlY3RvcnkpIHBhdGggdG8gdGhlIGNvbXBpbGVy
IGludm9rZWQgU1RUX0ZJTEUgc3ltYm9scy4gTm90ZQo+IHRoYXQgdGhpcyBidWlsZCBvcHRpb24g
aXMgbWFkZSBubyBsb25nZXIgZGVwZW5kIG9uIExJVkVQQVRDSCwgYnV0IG1lcmVseQo+IGRlZmF1
bHRzIHRvIGl0cyBzZXR0aW5nIG5vdy4KPiAKPiBDb25kaXRpb25hbGl6ZSBleHBsaWNpdCAuZmls
ZSBkaXJlY3RpdmUgaW5zZXJ0aW9uIGluIEMgZmlsZXMgd2hlcmUgaXQKPiBleGlzdHMganVzdCB0
byBkaXNhbWJpZ3VhdGUgbmFtZXMgaW4gYSBsZXNzIGdlbmVyaWMgbWFubmVyOyBub3RlIHRoYXQK
PiBhdCB0aGUgc2FtZSB0aW1lIHRoZSByZWR1bmRhbnQgZW1pc3Npb24gb2YgU1RUX0ZJTEUgc3lt
Ym9scyBnZXRzCj4gc3VwcHJlc3NlZCBmb3IgY2xhbmcuIEFzc2VtYmxlciBmaWxlcyBhcyB3ZWxs
IGFzIG11bHRpcGx5IGNvbXBpbGVkIEMKPiBvbmVzIHVzaW5nIF9fT0JKRUNUX0ZJTEVfXyBhcmUg
bGVmdCBhbG9uZSBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gCj4gU2luY2Ugd2Ugbm93IGV4cGVjdCB0
aGVyZSBub3QgdG8gYmUgYW55IGR1cGxpY2F0ZXMgYW55bW9yZSwgYWxzbyBkb24ndAo+IGZvcmNl
IHRoZSBzZWxlY3Rpb24gb2YgdGhlIG9wdGlvbiB0byAnbicgYW55bW9yZSBpbiBhbGxyYW5kb20u
Y29uZmlnLgo+IFNpbWlsYXJseSBDT1ZFUkFHRSBubyBsb25nZXIgc3VwcHJlc3NlcyBkdXBsaWNh
dGUgc3ltYm9sIHdhcm5pbmdzIGlmCj4gZW5mb3JjZW1lbnQgaXMgaW4gZWZmZWN0LCB3aGljaCBp
biB0dXJuIGFsbG93cwo+IFNVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1MgdG8gc2lt
cGx5IGRlcGVuZCBvbgo+ICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
