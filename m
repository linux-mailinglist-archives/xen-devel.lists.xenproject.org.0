Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D89E156340
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2020 08:01:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0K4X-0003wF-EU; Sat, 08 Feb 2020 06:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n7iK=34=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1j0K4V-0003wA-Jc
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2020 06:58:31 +0000
X-Inumbo-ID: 69dfb986-4a40-11ea-b2cb-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69dfb986-4a40-11ea-b2cb-bc764e2007e4;
 Sat, 08 Feb 2020 06:58:30 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1j0K4G-000FB7-8o; Sat, 08 Feb 2020 06:58:16 +0000
Date: Sat, 8 Feb 2020 06:58:16 +0000
From: Tim Deegan <tim@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200208065816.GA58313@deinos.phlegethon.org>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <fe250b28cc42442c86fdb108e1702c45@EX13D32EUC003.ant.amazon.com>
 <97420ba1-ecc1-8545-d36b-8d67d6ac226a@suse.com>
 <91137906fece4250abbdf7ccad975cdf@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91137906fece4250abbdf7ccad975cdf@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
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
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMDk6MTcgKzAwMDAgb24gMDYgRmViICgxNTgwOTgwNjY0KSwgRHVycmFudCwgUGF1bCB3cm90
ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gPiBPbiAwNi4wMi4yMDIwIDA5OjI4LCBEdXJyYW50LCBQYXVs
IHdyb3RlOgo+ID4gPj4gIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgfCAgMiArLQoK
PiBHZW9yZ2UsIEp1bGllbiwgVGltLAo+IAo+ICAgQ2FuIEkgaGF2ZSBhY2tzIG9yIG90aGVyd2lz
ZSwgcGxlYXNlPwoKQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgoKQ2hlZXJzLAoK
VGltLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
