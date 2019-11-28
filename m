Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7610CE79
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 19:23:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaONy-000308-05; Thu, 28 Nov 2019 18:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iaONw-0002zs-JO
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 18:19:24 +0000
X-Inumbo-ID: 8ebf5300-120b-11ea-9db0-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ebf5300-120b-11ea-9db0-bc764e2007e4;
 Thu, 28 Nov 2019 18:19:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0D5421739;
 Thu, 28 Nov 2019 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574965143;
 bh=4eadUOFodiAewEVAyGu3RvP0bCStPoR/dp2TOA79cHE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YmVc3BNYjyOQzSLZDSPZ3ftg/nRksKS/BBpgHEUB+skgw1I9qytTR8G0+0MhjvO8Q
 A+0iufBsqlM8n/SNv2ipJLdjyj38RvRrYHQnRDU21PF1wJ3v6Gt5iDWvbFt9eq8dgr
 ggleaV/4PzV7+gjV36m9XQJ72Kk7gCSytv1N2ff8=
Date: Thu, 28 Nov 2019 10:19:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
Message-ID: <alpine.DEB.2.21.1911281015120.15579@sstabellini-ThinkPad-T480s>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <97e3adf75cf71ba39e702d4cab23236ada8d5a6c.1569525222.git.lars.kurth@citrix.com>
 <alpine.DEB.2.21.1911271608510.27669@sstabellini-ThinkPad-T480s>
 <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyOCBOb3YgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMTEuMjAxOSAw
MTo1NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gVGh1LCAyNiBTZXAgMjAxOSwg
TGFycyBLdXJ0aCB3cm90ZToKPiA+PiBGcm9tOiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+Cj4gPj4KPiA+PiBUaGlzIGRvY3VtZW50IGhpZ2hsaWdodHMgd2hhdCByZXZpZXdlcnMg
c3VjaCBhcyBtYWludGFpbmVycyBhbmQgY29tbWl0dGVycyBsb29rCj4gPj4gZm9yIHdoZW4gcmV2
aWV3aW5nIGNvZGUuIEl0IHNldHMgZXhwZWN0YXRpb25zIGZvciBjb2RlIGF1dGhvcnMgYW5kIHBy
b3ZpZGVzCj4gPj4gYSBmcmFtZXdvcmsgZm9yIGNvZGUgcmV2aWV3ZXJzLgo+ID4gCj4gPiBJIHRo
aW5rIHRoZSBkb2N1bWVudCBpcyBtaXNzaW5nIGEgY291cGxlIG9mIHRoaW5nczoKPiA+IAo+ID4g
LSBhIHNpbXBsZSBvbmUgbGluZSBzdGF0ZW1lbnQgdGhhdCBwb3NzaWJseSB0aGUgbW9zdCBpbXBv
cnRhbnQgdGhpbmcgaW4KPiA+ICAgYSBjb2RlIHJldmlldyBpcyB0byBpbmRlbnRpZnkgYW55IGJ1
Z3MgaW4gdGhlIGNvZGUKPiA+IAo+ID4gLSBhbiBleHBsYW5hdGlvbiB0aGF0IHJlcXVlc3RzIGZv
ciBtYWpvciBjaGFuZ2VzIHRvIHRoZSBzZXJpZXMgc2hvdWxkIGJlCj4gPiAgIG1hZGUgZWFybHkg
b24gKGkuZS4gbGV0J3Mgbm90IGNoYW5nZSB0aGUgYXJjaGl0ZWN0dXJlIG9mIGEgZmVhdHVyZSBh
dAo+ID4gICB2OSBpZiBwb3NzaWJsZSkgSSBhbHNvIG1hZGUgdGhpcyBjb21tZW50IGluIHJlcGx5
IHRvIHBhdGNoICM1LiBJJ2xsCj4gPiAgIGxldCB5b3UgZGVjaWRlIHdoZXJlIGlzIHRoZSBiZXN0
IHBsYWNlIGZvciBpdC4KPiAKPiBUaGlzIG5lZWRzIGJhbGFuY2luZy4gUGVvcGxlIGNydWNpYWwg
dG8gdGhlIGV2YWx1YXRpb24gb2YgYSBuZXcKPiBmZWF0dXJlIGFuZCBpdHMgaW1wbGVtZW50YXRp
b24gc2ltcGx5IG1heSBub3QgaGF2ZSB0aGUgdGltZSB0bwo+IHJlcGx5IHByaW9yIHRvIHY5LiBX
ZSd2ZSBoYWQgc2l0dWF0aW9ucyB3aGVyZSBwZW9wbGUgcG9zdGVkIG5ldwo+IHJldmlzaW9ucyBl
dmVyeSBvdGhlciBkYXksIHNvbWV0aW1lcyBldmVuIG1vcmUgdGhhbiBvbmUgcGVyIGRheS4KClll
cywgeW91IGFyZSByaWdodCwgaXQgbmVlZHMgYmFsYW5jaW5nLiBUaGlzIGlzIG5vdCBtZWFudCB0
byBlbmNvdXJhZ2UKY29udHJpYnV0b3JzIHRvIHNlbmQgOSB2ZXJzaW9ucyBvZiBhIHNlcmllcyB3
aXRoaW4gYSB3ZWVrIG9yIHR3byA6LSkKCldlIGNvdWxkIHNheSB0aGF0ICJjb250cmlidXRvcnMg
c2hvdWxkIG1ha2Ugc3VyZSB0byBnaXZlIGVub3VnaCB0aW1lIHRvCmFsbCB0aGUga2V5IHN0YWtl
aG9sZGVycyB0byByZXZpZXcgdGhlIHNlcmllcyIuCgoKCj4gQXMgaW5kaWNhdGVkIGluIHNldmVy
YWwgb3RoZXIgY29udGV4dHMgYmVmb3JlIC0gaW1vIHBlb3BsZSBub3QKPiBoZWxwaW5nIHRvIHNo
b3VsZGVyIHRoZSByZXZpZXcgbG9hZCBzaG91bGQgYWxzbyBub3QgaGF2ZSB0aGUKPiBleHBlY3Rh
dGlvbiB0aGF0IHRoZWlyIChsYXJnZSkgY29udHJpYnV0aW9ucyB3aWxsIGJlIGxvb2tlZCBhdAo+
IGluIGR1ZSBjb3Vyc2UuIAoKSSB0aGluayB5b3UgYXJlIHJpZ2h0IG9uIHRoaXMgcG9pbnQsIGFu
ZCBtYXliZSB3ZSBjb3VsZCBhZGQgc29tZXRoaW5nIHRvCnRoYXQgZWZmZWN0CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
