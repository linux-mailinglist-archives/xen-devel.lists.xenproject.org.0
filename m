Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A736188952
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 16:42:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEEJP-0004Gv-Sg; Tue, 17 Mar 2020 15:39:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEEJO-0004Gq-It
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 15:39:22 +0000
X-Inumbo-ID: 78ce5c98-6865-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78ce5c98-6865-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 15:39:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1883FAC79;
 Tue, 17 Mar 2020 15:39:21 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
 <20200313130614.27265-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1854bdd-0ca3-dda1-6f2f-001c70082e12@suse.com>
Date: Tue, 17 Mar 2020 16:39:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313130614.27265-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 4/4] xen/rcu: add per-lock counter in
 debug builds
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxNDowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgYSBsb2NrIHNw
ZWNpZmljIGNvdW50ZXIgdG8gcmN1IHJlYWQgbG9ja3MgaW4gZGVidWcgYnVpbGRzLiBUaGlzCj4g
YWxsb3dzIHRvIHRlc3QgZm9yIG1hdGNoaW5nIGxvY2svdW5sb2NrIGNhbGxzLgo+IAo+IFRoaXMg
d2lsbCBoZWxwIHRvIGF2b2lkIGNhc2VzIGxpa2UgdGhlIG9uZSBmaXhlZCBieSBjb21taXQKPiA5
OGVkMWY0M2NjMmM4OSB3aGVyZSBkaWZmZXJlbnQgcmN1IHJlYWQgbG9ja3Mgd2VyZSByZWZlcmVu
Y2VkIGluIHRoZQo+IGxvY2sgYW5kIHVubG9jayBjYWxscy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgphbGJlaXQgdG8gYmUgaG9uZXN0IEknbSBub3QgZnVsbHkgY29u
dmluY2VkIHdlIG5lZWQgdG8gZ28gdGhpcyBmYXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
