Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518CB3810
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:27:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9oAh-0000uc-KR; Mon, 16 Sep 2019 10:23:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9oAf-0000uX-Ic
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:23:49 +0000
X-Inumbo-ID: 116c9f13-d86c-11e9-95da-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 116c9f13-d86c-11e9-95da-12813bfff9fa;
 Mon, 16 Sep 2019 10:23:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r195so9609412wme.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hh/kr0yAsWsHoOpsfVqdIIzSg7ReaGrrBRbK1lLkKmY=;
 b=R0/pnRyCCWsGtp+pADH3GgvrKEA/Q7OEwtdYd26vSg5uzQzry1Muce8mi64eEHjGx5
 wDFqDOiK/fqrekaLvS/ID9YNHef4EVvq21ppqZwAGJf4z4zlh3F9YWCr6hUoj9q6trlM
 pKL73lsHPorhW/qs/7WBMx+nI9jY3Pjwwsp826Qw+25ZDJvHq1p7Zb/xz4Wmwi14T9qE
 1Wd7W5YalLOV9XQ5PVJuUDqcm8XovP5FiQ13WR10V/GgYJ6CKlBBf9pJ2nYynboybANk
 DiRCl1rhQGFyNeyWxIwGhuZ6p+nGbo49HgW7g1Qo/a+qcwBcxOg+4LPCPRcQ6sURii9p
 2/wg==
X-Gm-Message-State: APjAAAXbhu1BzMZOkV6WFSXf6+Fdsa0p8CQbkCKtl/FR4yT5YZiLR0c3
 FcjDJJ1V9REnyYFVk3aWCNc=
X-Google-Smtp-Source: APXvYqw9dew5QIqZWSgWLD9nFmWHbGAhuyfisMKXVRCsgQ/nPyBGFBaeUhTwTMzGExI2eHT8vOhCQw==
X-Received: by 2002:a1c:80d0:: with SMTP id
 b199mr13332848wmd.102.1568629427384; 
 Mon, 16 Sep 2019 03:23:47 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id o12sm14527128wrm.23.2019.09.16.03.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 03:23:46 -0700 (PDT)
Date: Mon, 16 Sep 2019 10:23:45 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190916102345.y5sfpzc6s46ox6qx@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190913103953.8182-1-julien.grall@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913103953.8182-1-julien.grall@arm.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Add Skeleton for using
 configuring early printk using Kconfig
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6Mzk6NTNBTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEF0IHRoZSBtb21lbnQsIGVhcmx5IHByaW50ayBjYW4gb25seSBiZSBjb25maWd1cmVk
IG9uIHRoZSBtYWtlIGNvbW1hbmQKPiBsaW5lLiBJdCBpcyBub3QgdmVyeSBoYW5keSBiZWNhdXNl
IGEgdXNlciBoYXMgdG8gcmVtb3ZlIHRoZSBvcHRpb24KPiBldmVyeXRpbWUgaXQgaXMgdXNpbmcg
YW5vdGhlciBjb21tYW5kIG90aGVyIHRoYW4gY29tcGlsaW5nIHRoZQo+IGh5cGVydmlzb3IuCj4g
Cj4gRnVydGhlcm1vcmUsIGVhcmx5IHByaW50ayBpcyBvbmUgb2YgdGhlIGZldyBvZGRzIG9uZSB0
aGF0IGFyZSBub3QgdXNpbmcKPiBLY29uZmlnLgo+IAo+IFNvIHRoaXMgaXMgYWJvdXQgdGltZSB0
byBtb3ZlIGl0IHRvIEtjb25maWcuIEZvciBub3csIGEgc2tlbGV0b24gaXMKPiBhZGRlZCB3aXRo
IG9uZSBleGFtcGxlIGJhc2VkIG9uIENhZGVuY2UgVUFSVC4gRm9sbG93LXVwIHdpbGwgY29udGlu
dWUgdG8KPiBjb252ZXJ0IGFsbCB0aGUgb3B0aW9ucyB0byBLY29uZmlnLgo+IAo+IEJlY2F1c2Ug
S2NvbmZpZyB3aWxsIHByZWZpeCBhbGwgdGhlIGNvbmZpZyBieSBDT05GSUdfLCBpdCBpcyBuZWNl
c3NhcnkKPiB0byBhZGFwdCB0aGUgZGVmaW5lIHdpdGhpbiB0aGUgY29kZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IC0tLQo+IAo+
IEkgaGF2ZSBzZW50IGl0IGFzIFJGQyBiZWNhdXNlIHRoaXMgaXMgbm90IGNvbXBsZXRlLiBJIHdp
bGwgY29udmVydCB0aGUKPiByZXN0IG9uY2Ugd2UgYWdyZWUgdGhlIGFwcHJvYWNoIGlzIGNvcnJl
Y3QuCgpIYXZpbmcgYSB0b3AtbGV2ZWwgS2NvbmZpZy5kZWJ1ZyBhbmQgaW5jbHVkZXMgYXJjaCBz
cGVjaWZpYyBydWxlcyBpcyBob3cKTGludXggZG9lcyBpdCAoYWxiZWl0IHdpdGggZGlmZmVyZW50
IGRpcmVjdG9yeSBzdHJ1Y3R1cmUpLCBzbyBJIHRoaW5rCndlJ3JlIGp1c3QgZm9sbG93aW5nIHRo
ZSBub3JtIGhlcmUuIE5vIG9iamVjdGlvbiBmcm9tIG1lLgoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
