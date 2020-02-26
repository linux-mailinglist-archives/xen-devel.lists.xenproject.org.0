Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D116FE56
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:55:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vFt-0005Fu-2M; Wed, 26 Feb 2020 11:53:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TepR=4O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j6vFq-0005Fg-Nw
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:53:30 +0000
X-Inumbo-ID: 9b62e760-588e-11ea-aba8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b62e760-588e-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 11:53:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6vFq-00076X-2T; Wed, 26 Feb 2020 11:53:30 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6vFp-00052v-OE; Wed, 26 Feb 2020 11:53:29 +0000
Date: Wed, 26 Feb 2020 11:53:26 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200226115326.mybj4juv4orzlyn7@debian>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-4-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226113355.2532224-4-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH v3 03/23] xen/build: Remove confusing
 comment on the %.s:%.S rule
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MzM6MzVBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhhdCBjb21tZW50IHdhcyBpbnRyb2R1Y2UgYnkgMzk0M2RiNzc2MzcxICgiW1hF
Tl0gQ2FuIGJlIGJ1aWx0Cj4gLXN0ZD1nbnU5OSAoZXhjZXB0IGZvciAuUyBmaWxlcykuIikgdG8g
ZXhwbGFpbiB3aHkgQ0ZMQUdTIHdhcyByZW1vdmVkCj4gZnJvbSB0aGUgY29tbWFuZCBsaW5lLiBU
aGUgY29tbWVudCBpcyBhbHJlYWR5IHdyaXR0ZW4gd2hlcmUgdGhlCj4gLXN0ZD1nbnUgZmxhZ3Mg
Z2V0cyByZW1vdmUgZnJvbSBBRkxBR1MsIG5vIG5lZWQgdG8gcmVwZWF0IGl0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
