Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2FB18687F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 11:03:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDmXX-0001dz-6R; Mon, 16 Mar 2020 10:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jDmXV-0001S3-JA
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 10:00:05 +0000
X-Inumbo-ID: e87011d0-676c-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e87011d0-676c-11ea-92cf-bc764e2007e4;
 Mon, 16 Mar 2020 10:00:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 996BAAE71;
 Mon, 16 Mar 2020 10:00:03 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200313143755.31870-1-jgross@suse.com>
 <20200313143755.31870-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a965ce97-2b40-d64f-17cc-fc531184f49f@suse.com>
Date: Mon, 16 Mar 2020 11:00:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313143755.31870-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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

T24gMTMuMDMuMjAyMCAxNTozNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBTaW1pbGFyIHRvIHNw
aW5sb2NrcyBwcmVlbXB0aW9uIHNob3VsZCBiZSBkaXNhYmxlZCB3aGlsZSBob2xkaW5nIGEKPiBy
d2xvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
