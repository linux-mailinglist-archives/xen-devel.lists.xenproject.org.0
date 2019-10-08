Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BEACFA9D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 14:56:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHozL-00086r-R7; Tue, 08 Oct 2019 12:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N428=YB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHozK-00086m-7a
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 12:53:14 +0000
X-Inumbo-ID: 94bc2d78-e9ca-11e9-96dc-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 94bc2d78-e9ca-11e9-96dc-bc764e2007e4;
 Tue, 08 Oct 2019 12:53:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6E1B15BE;
 Tue,  8 Oct 2019 05:53:09 -0700 (PDT)
Received: from [10.37.12.88] (unknown [10.37.12.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBB513F703;
 Tue,  8 Oct 2019 05:53:08 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
 <20191008011501.21038-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <07a11bac-87c0-33af-7051-bac4b96a765d@arm.com>
Date: Tue, 8 Oct 2019 13:53:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008011501.21038-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] xen/arm: make_memory_node return
 error on nr_banks == 0
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
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC84LzE5IDI6MTUgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBDYWxsIG1h
a2VfbWVtb3J5X25vZGUgZm9yIHJlc2VydmVkX21lbW9yeSBvbmx5IGlmIHdlIGFjdHVhbGx5IGhh
dmUgYW55Cj4gcmVzZXJ2ZWRfbWVtb3J5IHJlZ2lvbnMgdG8gaGFuZGxlLgo+IAo+IEFkZCBhIGNo
ZWNrIGluIG1ha2VfbWVtb3J5X25vZGUgdG8gcmV0dXJuIGFuIGVycm9yIGlmIGl0IGhhcyBiZWVu
IGNhbGxlZAo+IHdpdGggbm8gbWVtb3J5IGJhbmtzIGFzIGFyZ3VtZW50Lgo+IAo+IEZpeGVzOiAy
NDhmYWE2MzdkMiAoeGVuL2FybTogYWRkIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIHRvIHRoZSBk
b20wIG1lbW9yeSBub2RlKQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
