Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC37135B32
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 15:16:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipYZ7-0006Zx-Rr; Thu, 09 Jan 2020 14:13:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipYZ6-0006Zo-6I
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 14:13:36 +0000
X-Inumbo-ID: 391cb8fc-32ea-11ea-b9db-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 391cb8fc-32ea-11ea-b9db-12813bfff9fa;
 Thu, 09 Jan 2020 14:13:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 262F6B2F5B;
 Thu,  9 Jan 2020 14:13:28 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200109134825.31482-1-jgross@suse.com>
 <20200109134825.31482-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cea22ed-0c95-9d63-b67c-e08b4e925eec@suse.com>
Date: Thu, 9 Jan 2020 15:13:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109134825.31482-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: make CONFIG_DEBUG_LOCKS usable
 without CONFIG_DEBUG
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxNDo0OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBleHBlcnQgbW9k
ZSBpdCBpcyBwb3NzaWJsZSB0byBlbmFibGUgQ09ORklHX0RFQlVHX0xPQ0tTIHdpdGhvdXQKPiBo
YXZpbmcgZW5hYmxlZCBDT05GSUdfREVCVUcuIFRoZSBjb2RpbmcgaXMgZGVwZW5kaW5nIG9uIENP
TkZJR19ERUJVRwo+IGFzIGl0IGlzIHVzaW5nIEFTU0VSVCgpLCBob3dldmVyLgo+IAo+IEZpeCB0
aGF0IGJ5IHVzaW5nIEJVR19PTigpIGluc3RlYWQgb2YgQVNTRVJUKCkgaW4gcmVsX2xvY2soKS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
