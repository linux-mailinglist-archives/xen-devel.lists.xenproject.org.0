Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB5E113C5E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 08:32:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iclWs-0005mq-UN; Thu, 05 Dec 2019 07:26:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iclWr-0005ml-TT
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 07:26:25 +0000
X-Inumbo-ID: 8a01330e-1730-11ea-8214-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a01330e-1730-11ea-8214-12813bfff9fa;
 Thu, 05 Dec 2019 07:26:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81ABCB239;
 Thu,  5 Dec 2019 07:26:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Date: Thu, 5 Dec 2019 08:26:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/3] lz4: misc fixes / adjustments
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTogcmVmaW5lIGNvbW1pdCA5MTQzYTZjNTVlZjcgZm9yIHRoZSA2NC1iaXQgY2FzZQoyOiBwdWxs
IG91dCBjb25zdGFudCB0YWJsZXMKMzogZml4IHN5c3RlbSBoYWx0IGF0IGJvb3Qga2VybmVsIG9u
IHg4Nl82NAoKT25seSBwYXRjaCAxIGlzIHN0cmljdGx5IG1lYW50IHRvIGJlIGNvbnNpZGVyZWQg
Zm9yIDQuMTMsIGFsYmVpdApwYXRjaCAzIGZpeGVzIGEgc2ltaWxhciBwcm9ibGVtIChidXQgbm9u
ZSB3aGljaCB3b3VsZCBoYXZlIGJlZW4KcmVwb3J0ZWQgc28gZmFyKS4gUGF0Y2hlcyAyIGFuZCAz
IGFyZSBwb3J0cyBvZiAoYSBjb3VwbGUgb2YKeWVhcnMgb2xkKSBMaW51eCBjb21taXRzLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
