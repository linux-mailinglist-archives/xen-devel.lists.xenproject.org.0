Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE99AB76B6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 11:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAt3T-0004Wv-9W; Thu, 19 Sep 2019 09:48:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAt3R-0004Wf-Kj
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 09:48:49 +0000
X-Inumbo-ID: ad69e8a4-dac2-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ad69e8a4-dac2-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 09:48:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4387337;
 Thu, 19 Sep 2019 02:48:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F02243F575;
 Thu, 19 Sep 2019 02:48:46 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-4-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <37f72004-d193-8da4-cb7e-b0e26eb64226@arm.com>
Date: Thu, 19 Sep 2019 10:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568388917-7287-4-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 3/8] iommu/arm: Order the headers
 alphabetically in iommu.c
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTMvMDkvMjAxOSAxNjozNSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IENsZWFuIHVwIHRoZSBjb2RlIGEgYml0IGJ5IHB1dHRpbmcgdGhlIGhl
YWRlcnMgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5k
ciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KCkFja2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQW5kIGNvbW1pdHRlZC4KCkNoZWVy
cywKCj4gLS0tCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyB8IDUgKysr
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPiBpbmRleCA1NTVhY2ZjLi41YTNkMWQ1
IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMKPiBAQCAtMTUsOSArMTUsMTAg
QEAKPiAgICAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4g
ICAgKi8KPiAgIAo+IC0jaW5jbHVkZSA8eGVuL2xpYi5oPgo+IC0jaW5jbHVkZSA8eGVuL2lvbW11
Lmg+Cj4gICAjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vaW9t
bXUuaD4KPiArI2luY2x1ZGUgPHhlbi9saWIuaD4KPiArCj4gICAjaW5jbHVkZSA8YXNtL2Rldmlj
ZS5oPgo+ICAgCj4gICAvKgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
