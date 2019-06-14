Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4044F4682D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 21:35:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbrwD-0002DH-Rg; Fri, 14 Jun 2019 19:32:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PuWx=UN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbrwC-0002DC-Bc
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 19:32:36 +0000
X-Inumbo-ID: 28ece974-8edb-11e9-ac35-6b03efb64e52
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28ece974-8edb-11e9-ac35-6b03efb64e52;
 Fri, 14 Jun 2019 19:32:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2335820866;
 Fri, 14 Jun 2019 19:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560540754;
 bh=uqNCMTKHWIFPTZXqBOt1hvjyneWLyek2g5gJB0Eo+3k=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Tqh9fvRAZyZWvMGMoeTIR3f0XkWDetPE500yeweA831fDsrpqfF0jOXnCeb7jkU4M
 Ct7EH7CZYABzd9LmzXCG5Ww2Mqf9SPCOXHINF7ksu4TaBvmxO9qKP8bgbs5fsuT2/Y
 ohM2Deu62YMQOQbxSgatLYMk9ivsaifxMcELNNuA=
Date: Fri, 14 Jun 2019 12:32:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <79361ad3-2f0a-aafb-9503-e2774535494a@arm.com>
Message-ID: <alpine.DEB.2.21.1906141232210.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1905011628310.23881@sstabellini-ThinkPad-X260>
 <e6a6ed7e-8085-4b29-a102-6d4ddf1f578f@arm.com>
 <79361ad3-2f0a-aafb-9503-e2774535494a@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: improve dom0less documentation
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEyLzA2LzIwMTkg
MTk6NTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IEhpIFN0ZWZhbm8sCj4gPiAKPiA+IE9uIDUv
Mi8xOSAxMjozMCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiBJbXByb3ZlIERv
bTAtbGVzcyBkb2N1bWVudGF0aW9uOiBpbmNsdWRlIGEgY29tcGxldGUgY29uZmlndXJhdGlvbgo+
ID4gPiBleGFtcGxlLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RvY3Mv
ZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MK
PiA+ID4gaW5kZXggNGUzNDJiNy4uZTA3NmUzNyAxMDA2NDQKPiA+ID4gLS0tIGEvZG9jcy9mZWF0
dXJlcy9kb20wbGVzcy5wYW5kb2MKPiA+ID4gKysrIGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5w
YW5kb2MKPiA+IAo+ID4gVGhlIGNvbnRlbnQgaXMgcHJvYmFibHkgb2sgZmVhdHVyZXMsIGFsdGhv
dWdoIEkgYW0gd29ycnkgb2YgZHVwbGljYXRpb24gd2l0aAo+ID4gZG9jcy9taXNjL2FybS9kZXZp
Y2UtdHJlZS9ib290aW5nLnR4dC4KPiA+IAo+ID4gSG93ZXZlciwgd2hlbiBsb29raW5nIGhvdyBv
dGhlciBmZWF0dXJlcyBkZWFsIHdpdGggc2ltaWxhciBkZXNjcmlwdGlvbiwKPiA+IEkgbm90aWNl
ZCB0aGF0IHdlIGRvbid0IGZvbGxvdyB0aGUgdGVtcGxhdGUgKHNlZSB0ZW1wbGF0ZXMucGFuZG9j
KS4KPiA+IAo+ID4gSSBhbSBhd2FyZSB0aGlzIGlzIGEgc3VnZ2VzdGlvbiwgYnV0IGl0IHdvdWxk
IGJlIGdvb2QgdG8gZm9sbG93IGl0IGFzIGEgdXNlcgo+ID4gd291bGQgYmUgYWJsZSB0byBmaW5k
IGhpcyB3YXkgdGhyb3VnaCBpdCBtb3JlIGVhc2lseSBhbmQgd291bGQgaGVscCB0byBrbm93Cj4g
PiB0aGlzIGlzIEFybSBvbmx5ICh0aGlzIGlzIG5vdCBjbGVhcmx5IHNwZWxsIG91dCkuCj4gPiAK
PiA+IENvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCBpdD8KPiA+IAo+ID4gVGhpcyBjb3VsZCBiZSBh
IGZvbGxvdy11cCBzbzoKPiA+IAo+ID4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gCj4gTm93IGNvbW1pdHRlZC4KPiAKPiBUaGFuayB5b3UhCgpUaGFua3Mh
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
