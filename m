Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D671184595
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:07:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCi7h-0004r1-Ez; Fri, 13 Mar 2020 11:05:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCi7g-0004qw-RR
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:05:00 +0000
X-Inumbo-ID: 7b2c86ac-651a-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b2c86ac-651a-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 11:05:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4D91DABD1;
 Fri, 13 Mar 2020 11:04:59 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aca85437-b9aa-c389-ad88-283b637f6547@suse.com>
Date: Fri, 13 Mar 2020 12:05:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] kconfig: expose all{yes,no}config targets
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aG91dCBoYXZpbmcgdGhlbSBhdCBsZWFzdCBhdCB0aGUgeGVuL01ha2VmaWxlIGxldmVsIHRo
ZXkncmUgKGNsb3NlCnRvPykgaW5hY2Nlc3NpYmxlLiBBcyBJJ20gdW5jZXJ0YWluIGFib3V0IHRo
ZWlyIHV0aWxpdHkgYXQgdGhlIHRvcApsZXZlbCwgSSdtIGxlYXZpbmcgaXQgYXQgdGhhdCBmb3Ig
bm93LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL01ha2VmaWxlCisrKyBiL3hlbi9NYWtlZmlsZQpAQCAtMjc3LDcgKzI3Nyw3IEBAICQo
Zm9yZWFjaCBiYXNlLGFyY2gveDg2L21tL2d1ZXN0X3dhbGtfJQogICAgICAgICAgICAgICAgYXJj
aC94ODYvbW0vc2hhZG93L2d1ZXN0XyUsIFwKICAgICAkKGZvcmVhY2ggZXh0LG8gaSBzLCQoY2Fs
bCBidWlsZC1pbnRlcm1lZGlhdGUsJChiYXNlKS4kKGV4dCkpKSkKIAota2NvbmZpZyA6PSBvbGRj
b25maWcgY29uZmlnIG1lbnVjb25maWcgZGVmY29uZmlnIFwKK2tjb25maWcgOj0gb2xkY29uZmln
IGNvbmZpZyBtZW51Y29uZmlnIGRlZmNvbmZpZyBhbGx5ZXNjb25maWcgYWxsbm9jb25maWcgXAog
CW5jb25maWcgeGNvbmZpZyBnY29uZmlnIHNhdmVkZWZjb25maWcgbGlzdG5ld2NvbmZpZyBvbGRk
ZWZjb25maWcgXAogCXJhbmRjb25maWcgJChub3RkaXIgJCh3aWxkY2FyZCBhcmNoLyQoU1JDQVJD
SCkvY29uZmlncy8qX2RlZmNvbmZpZykpCiAuUEhPTlk6ICQoa2NvbmZpZykKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
