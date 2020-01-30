Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFE14DC27
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:42:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixA2r-0004M1-B8; Thu, 30 Jan 2020 13:39:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixA2p-0004Lw-SH
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:39:43 +0000
X-Inumbo-ID: f89bda4c-4365-11ea-8a68-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f89bda4c-4365-11ea-8a68-12813bfff9fa;
 Thu, 30 Jan 2020 13:39:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F170CAD79;
 Thu, 30 Jan 2020 13:39:41 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-12-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abe8cad9-0a64-d813-74c5-e6e13f0eace8@suse.com>
Date: Thu, 30 Jan 2020 14:39:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-12-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 11/12] xen/build: introduce ccflags-y
 and CFLAGS_$@
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gV2UgYXJlIGdvaW5n
IHRvIHdhbnQgJChDRkxBR1MpIHRvIGJlIHN0YXRpYyBhbmQgbmV2ZXIgY2hhbmdlIGR1cmluZwo+
IHRoZSBidWlsZCwgc28gaW50cm9kdWNlIG5ldyB2YXJpYWJsZXMgdGhhdCBjYW4gYmUgdXNlIHRv
IGNoYW5nZSB0aGUKPiBmbGFncyBvZiBhIHNpbmdsZSB0YXJnZXQgb3Igb2YgYSB3aG9sZSBkaXJl
Y3RvcnkuCgpJJ20gYWdhaW4gc3RydWdnbGluZyB3aXRoIHRoZSAid2h5IjogV2hhdCBwcm9ibGVt
IGlzIHRoZXJlIHdpdGggZS5nLgoKQ0ZMQUdTICs9IC1mc2hvcnQtd2NoYXIKCmluIGEgcGFydGlj
dWxhciBNYWtlZmlsZT8gVGhpcyBkb2Vzbid0IGFsdGVyIHRoZSB3aGVuLXRvLWV4cGFuZAphc3Bl
Y3Qgb2YgJChDRkxBR1MpIGF0IGFsbC4KCkkgaGF2ZSB0byBhZG1pdCB0aGF0IEknbSBhbHNvIGEg
bGl0dGxlIHB1enpsZWQgYnkgdGhlIG5hbWluZywgbm8KbWF0dGVyIHRoYXQgaXQncyB0YWtlbiBm
cm9tIExpbnV4LiBJdCBkb2Vzbid0IHJlYWxseSBzZWVtIHRvIGZpdApDRkxBR1MvQUZMQUdTIGFu
ZCBjX2ZsYWdzL2FfZmxhZ3MuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
