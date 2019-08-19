Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D092278
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 13:35:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzfsd-0001NA-Fo; Mon, 19 Aug 2019 11:31:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzfsb-0001N5-KW
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 11:31:17 +0000
X-Inumbo-ID: da374af4-c274-11e9-8bec-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id da374af4-c274-11e9-8bec-12813bfff9fa;
 Mon, 19 Aug 2019 11:31:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AEE328;
 Mon, 19 Aug 2019 04:31:14 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA7983F246;
 Mon, 19 Aug 2019 04:31:12 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-3-hch@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0998bb38-6afd-d281-5c37-925adf2403d1@arm.com>
Date: Mon, 19 Aug 2019 12:31:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-3-hch@lst.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/11] xen/arm: use dev_is_dma_coherent
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQ2hyaXN0b3BoLAoKT24gOC8xNi8xOSAyOjAwIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBVc2UgdGhlIGRtYS1ub25jb2hlcmVudCBkZXZfaXNfZG1hX2NvaGVyZW50IGhlbHBlciBp
bnN0ZWFkIG9mIHRoZSBob21lCj4gZ3Jvd24gdmFyaWFudC4KCkl0IHRvb2sgbWUgYSBiaXQgb2Yg
dGltZSB0byB1bmRlcnN0YW5kIHRoYXQgZGV2LT5hcmNoZGF0YS5kbWFfY29oZXJlbnQgCmFuZCBk
ZXYtPmRtYV9jb2hlcmVudCB3aWxsIGFsd2F5cyBjb250YWluIHRoZSBzYW1lIHZhbHVlLgoKV291
bGQgeW91IG1pbmQgaXQgbWVudGlvbiBpdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2U/CgpPdGhlciB0
aGFuIHRoYXQ6CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
