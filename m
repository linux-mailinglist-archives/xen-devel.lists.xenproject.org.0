Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C61736D8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:11:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eS4-0006bv-P2; Fri, 28 Feb 2020 12:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7eS3-0006bj-KA
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:09:07 +0000
X-Inumbo-ID: 1dec4a38-5a23-11ea-b7e8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dec4a38-5a23-11ea-b7e8-bc764e2007e4;
 Fri, 28 Feb 2020 12:09:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AAD2DAD39;
 Fri, 28 Feb 2020 12:09:05 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
Date: Fri, 28 Feb 2020 13:09:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: improve x2APIC handling when
 XT is unavailable
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIEFNRCB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuIElPTU1VIGFuZCB4MkFQSUMgaXMgbGVzcyBz
dHJvbmcsCmhlbmNlIGV2ZW4gaWYgdW5saWtlbHkgdG8gb2NjdXIgd2Ugd291bGQgYmV0dGVyIGRl
YWwgY29ycmVjdGx5CndpdGggWFQgYmVpbmcgdW5hdmFpbGFibGUgKGZvciB3aGF0ZXZlciByZWFz
b25zKSBpbiBwYXJ0aWN1bGFyCndoZW4geDJBUElDIGlzIGFscmVhZHkgZW5hYmxlZCBvbiBhIHN5
c3RlbS4KCjE6IGNvcnJlY3QgaGFuZGxpbmcgd2hlbiBYVCdzIHByZXJlcSBmZWF0dXJlcyBhcmUg
dW5hdmFpbGFibGUKMjogd2l0aG91dCBYVCwgeDJBUElDIG5lZWRzIHRvIGJlIGZvcmNlZCBpbnRv
IHBoeXNpY2FsIG1vZGUKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
