Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC9218179A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 13:18:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC0G8-0004op-K9; Wed, 11 Mar 2020 12:14:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jC0G6-0004ok-QE
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 12:14:46 +0000
X-Inumbo-ID: e4cba71c-6391-11ea-af72-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4cba71c-6391-11ea-af72-12813bfff9fa;
 Wed, 11 Mar 2020 12:14:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC51BB153;
 Wed, 11 Mar 2020 12:14:43 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e14ea646-7edc-70e8-ec3f-4752635dc639@suse.com>
Date: Wed, 11 Mar 2020 13:14:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310072853.27567-7-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/6] xen/rcu: add per-lock counter in
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

T24gMTAuMDMuMjAyMCAwODoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgYSBsb2NrIHNw
ZWNpZmljIGNvdW50ZXIgdG8gcmN1IHJlYWQgbG9ja3MgaW4gZGVidWcgYnVpbGRzLiBUaGlzCj4g
YWxsb3dzIHRvIHRlc3QgZm9yIG1hdGNoaW5nIGxvY2svdW5sb2NrIGNhbGxzLgoKU2ltaWxhciBj
aGVja2luZyBkb2Vzbid0IGV4aXN0IGZvciBlLmcuIHNwaW4gbG9ja3MgaWlyYywgYW5kIGhlbmNl
CkkgdGhpbmsgeW91IHdhbnQgdG8gc3BlbmQgdGhlIHdvcmQgb24gdGhlICJ3aHkiIGhlcmUuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
