Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C332C2B79
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 03:03:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF6Xu-0008Fz-Oq; Tue, 01 Oct 2019 01:01:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF6Xs-0007nS-VG
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 01:01:40 +0000
X-Inumbo-ID: 06c66350-e3e7-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 06c66350-e3e7-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 01:01:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B39DF2075C;
 Tue,  1 Oct 2019 01:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569891700;
 bh=dI1x8jfdHguBkjkSJYZOnbSvv7OubUQ+qdtgRtYeGAY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=SN0g265wyNt2REzgavwLw4ea4Rk2+XfCwkx1XftljZFff00zTFFgDecpsLqVud3EN
 KUUKcAVwSppaDaFygg+majn6XNcsvKqu0g2F0quFF4fg6Ub37ZZ+trCgCIROPCyUaf
 EJnWfgNPthngtOG/FXeQVUgJ1/5Cx4GK9h3boOaA=
Date: Mon, 30 Sep 2019 18:01:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190929163510.15688-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1909301801310.2594@sstabellini-ThinkPad-T480s>
References: <20190929163510.15688-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: p2m: Fix typo in the
 comment on top of P2M_ROOT_LEVEL
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCAyOSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIHhlbi9hcmNoL2Fy
bS9wMm0uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2Fy
bS9wMm0uYwo+IGluZGV4IDVmZjZjZTE1ZjYuLjRhNDI5ZGMxYmUgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gvYXJtL3AybS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3AybS5jCj4gQEAgLTI1LDcgKzI1
LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG1heF92bWlkID0gTUFYX1ZN
SURfOF9CSVQ7Cj4gIC8qIFZNSUQgaXMgYnkgZGVmYXVsdCA4IGJpdCB3aWR0aCBvbiBBQXJjaDY0
ICovCj4gICNkZWZpbmUgTUFYX1ZNSUQgICAgICAgbWF4X3ZtaWQKPiAgI2Vsc2UKPiAtLyogRmly
c3QgbGV2ZWwgUDJNIGlzIGFsd2F5IDIgY29uc2VjdXRpdmUgcGFnZXMgKi8KPiArLyogRmlyc3Qg
bGV2ZWwgUDJNIGlzIGFsd2F5cyAyIGNvbnNlY3V0aXZlIHBhZ2VzICovCj4gICNkZWZpbmUgUDJN
X1JPT1RfTEVWRUwgMQo+ICAjZGVmaW5lIFAyTV9ST09UX09SREVSICAgIDEKPiAgLyogVk1JRCBp
cyBhbHdheXMgOCBiaXQgd2lkdGggb24gQUFyY2gzMiAqLwo+IC0tIAo+IDIuMTEuMAo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
