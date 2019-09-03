Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E1CA6BB3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:41:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i59x1-0000z9-6w; Tue, 03 Sep 2019 14:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i59x0-0000yS-5R
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:38:30 +0000
X-Inumbo-ID: 7e4b8563-ce58-11e9-ab95-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e4b8563-ce58-11e9-ab95-12813bfff9fa;
 Tue, 03 Sep 2019 14:38:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFD7AAF1D;
 Tue,  3 Sep 2019 14:38:27 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-4-jgross@suse.com>
 <d62618fe-176b-740c-bf18-e042dada4ef7@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7ccbe6f2-fc60-5b23-c60e-aa0a11e3d4e1@suse.com>
Date: Tue, 3 Sep 2019 16:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d62618fe-176b-740c-bf18-e042dada4ef7@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 3/5] xen: print lock profile info in
 panic()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTY6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjA4LjIwMTkgMTI6
MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFYyOgo+PiAtIHJlbmFtZSBDT05GSUdfTE9DS19Q
Uk9GSUxFIHRvIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUgKEphbiBCZXVsaWNoKQo+PiAtIG1v
dmUgLmxvY2twcm9maWxlLmRhdGEgc2VjdGlvbiB0byBpbml0IGFyZWEgaW4gbGlua2VyIHNjcmlw
dHMKPiAKPiBIb3cgY2FuIHRoaXMgYmUgY29ycmVjdCwgd2hlbiB5b3UgZG9uJ3QgY2hhbmdlIGxv
Y2tfcHJvZl9pbml0KCkgYXQKPiBhbGw/IFRoZSBmdW5jdGlvbiBidWlsZHMgYSBsaW5rZWQgbGlz
dCBmcm9tIHRoZSBlbnRyaWVzIGluIHRoZQo+IHNlY3Rpb24sIGFuZCB0aGVuIGhhbmRzIHRoZSBo
ZWFkIG9mIHRoaXMgbGlzdCB0bwo+IF9sb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KCkuIEkg
Z3Vlc3MgSSBtdXN0IGJlIG1pc3NpbmcKPiBzb21ldGhpbmcuIEFueXdheSwgZXZlcnl0aGluZyBl
bHNlIGhlcmUgbG9va3MgZ29vZCB0byBtZS4KClRoZSAubG9ja3Byb2ZpbGUuZGF0YSBzZWN0aW9u
IGNvbnRhaW5zIG9ubHkgdGhlIHBvaW50ZXJzIHRvIHRoZQplbGVtZW50cyBwdXQgaW50byB0aGUg
bGlua2VkIGxpc3QuIEFuZCB0aG9zZSBwb2ludGVycyBhcmUgbm8gbG9uZ2VyCm5lZWRlZCBhZnRl
cndhcmRzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
