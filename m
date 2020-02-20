Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F416B1659A5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:54:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hZG-0007N1-P5; Thu, 20 Feb 2020 08:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4hZF-0007Mw-ID
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:52:21 +0000
X-Inumbo-ID: 4e224cd6-53be-11ea-84e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e224cd6-53be-11ea-84e8-12813bfff9fa;
 Thu, 20 Feb 2020 08:52:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68487B090;
 Thu, 20 Feb 2020 08:52:20 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-4-jgross@suse.com>
 <1e04b723-58d2-cb2b-6571-3e041eecf6cd@suse.com>
 <17d40116-cb35-74d3-f98e-fa323dddfa89@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c47fc2c4-6b72-13eb-1cd3-c247c739d21f@suse.com>
Date: Thu, 20 Feb 2020 09:43:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <17d40116-cb35-74d3-f98e-fa323dddfa89@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/8] xen: add basic hypervisor filesystem
 support
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

T24gMjAuMDIuMjAyMCAwODoyNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxOS4wMi4yMCAx
Njo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjAgMDk6MTEsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArc3RhdGljIGlubGluZSB2b2lkIGh5cGZzX3N0cmluZ19zZXQoc3Ry
dWN0IGh5cGZzX2VudHJ5X2xlYWYgKmxlYWYsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqc3RyKQo+Pj4gK3sKPj4+ICsgICAgbGVhZi0+Y29udGVu
dCA9IHN0cjsKPj4+ICsgICAgbGVhZi0+ZS5zaXplID0gc3RybGVuKHN0cikgKyAxOwo+Pj4gK30K
Pj4KPj4gVGhpcyBsb29rcyBhdCBsZWFzdCByaXNreSB0byBtZSwgYXMgdGhlIGZ1bmN0aW9uIG5h
bWUgZG9lcyBpbgo+PiBubyB3YXkgaW5kaWNhdGUgdGhhdCBubyBjb3B5IG9mIHRoZSBzdHJpbmcg
d2lsbCBiZSBtYWRlLiBIZW5jZQo+PiBpdHMgdXNlIHdpdGggZS5nLiAuaW5pdC5yb2RhdGEgY29u
dGVudHMgb3IgYSBzdGFjayB2YXJpYWJsZQo+PiB3aWxsIG5vdCBwcm9kdWNlIHRoZSBpbnRlbmRl
ZCByZXN1bHQuCj4gCj4gT2theSwgd2hhdCBhYm91dCBuYW1pbmcgaXQgaHlwZnNfc3RyaW5nX3Nl
dF9yZWZlcmVuY2UoKSA/CgpIbW0sIGEgbGl0dGxlIGJldHRlciBiZWNhdXNlIG9mIGRyYXdpbmcg
bW9yZSBhdHRlbnRpb24gdG8gaXQKZHVlIHRvIHRoZSBsb25naXNoIG5hbWUuIEknZCBiZSBjdXJp
b3VzIHdoYXQgb3RoZXJzIHRoaW5rIGhlcmUsCmluIHBhcnRpY3VsYXIgdG93YXJkcyB0aGUgYWx0
ZXJuYXRpdmUgb2YgYWN0dWFsbHkgYWxsb2NhdGluZwpzcGFjZSBhbmQgY29weWluZyB0aGUgc3Ry
aW5nLiBJZiBpdCBpcyB0byByZW1haW4gYXMgaXQgaXMsCndoaWxlIHRoZSBmdW5jdGlvbiBib2R5
IGlzIHNtYWxsIEkgc3RpbGwgdGhpbmsgeW91IGFsc28gd2FudCB0bwphdHRhY2ggYSBjb21tZW50
IHRvIGNhbGwgb3V0IHRoaXMgYmVoYXZpb3IuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
