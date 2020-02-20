Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89411659E4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 10:09:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hnk-0000Kc-3b; Thu, 20 Feb 2020 09:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4hnj-0000KX-6K
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:07:19 +0000
X-Inumbo-ID: 64f9075e-53c0-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64f9075e-53c0-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 09:07:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7DBD8B133;
 Thu, 20 Feb 2020 09:07:17 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-4-jgross@suse.com>
 <1e04b723-58d2-cb2b-6571-3e041eecf6cd@suse.com>
 <17d40116-cb35-74d3-f98e-fa323dddfa89@suse.com>
 <c47fc2c4-6b72-13eb-1cd3-c247c739d21f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7b6cf661-f3bb-bf3c-b322-d7b23d70fad2@suse.com>
Date: Thu, 20 Feb 2020 10:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c47fc2c4-6b72-13eb-1cd3-c247c739d21f@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAgMDk6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIwLjAyLjIwMjAgMDg6
MjcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDE5LjAyLjIwIDE2OjQ5LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE5LjAyLjIwMjAgMDk6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBoeXBmc19zdHJpbmdfc2V0KHN0cnVjdCBoeXBmc19lbnRy
eV9sZWFmICpsZWFmLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpzdHIpCj4+Pj4gK3sKPj4+PiArICAgIGxlYWYtPmNvbnRlbnQgPSBzdHI7Cj4+
Pj4gKyAgICBsZWFmLT5lLnNpemUgPSBzdHJsZW4oc3RyKSArIDE7Cj4+Pj4gK30KPj4+Cj4+PiBU
aGlzIGxvb2tzIGF0IGxlYXN0IHJpc2t5IHRvIG1lLCBhcyB0aGUgZnVuY3Rpb24gbmFtZSBkb2Vz
IGluCj4+PiBubyB3YXkgaW5kaWNhdGUgdGhhdCBubyBjb3B5IG9mIHRoZSBzdHJpbmcgd2lsbCBi
ZSBtYWRlLiBIZW5jZQo+Pj4gaXRzIHVzZSB3aXRoIGUuZy4gLmluaXQucm9kYXRhIGNvbnRlbnRz
IG9yIGEgc3RhY2sgdmFyaWFibGUKPj4+IHdpbGwgbm90IHByb2R1Y2UgdGhlIGludGVuZGVkIHJl
c3VsdC4KPj4KPj4gT2theSwgd2hhdCBhYm91dCBuYW1pbmcgaXQgaHlwZnNfc3RyaW5nX3NldF9y
ZWZlcmVuY2UoKSA/Cj4gCj4gSG1tLCBhIGxpdHRsZSBiZXR0ZXIgYmVjYXVzZSBvZiBkcmF3aW5n
IG1vcmUgYXR0ZW50aW9uIHRvIGl0Cj4gZHVlIHRvIHRoZSBsb25naXNoIG5hbWUuIEknZCBiZSBj
dXJpb3VzIHdoYXQgb3RoZXJzIHRoaW5rIGhlcmUsCj4gaW4gcGFydGljdWxhciB0b3dhcmRzIHRo
ZSBhbHRlcm5hdGl2ZSBvZiBhY3R1YWxseSBhbGxvY2F0aW5nCj4gc3BhY2UgYW5kIGNvcHlpbmcg
dGhlIHN0cmluZy4gSWYgaXQgaXMgdG8gcmVtYWluIGFzIGl0IGlzLAo+IHdoaWxlIHRoZSBmdW5j
dGlvbiBib2R5IGlzIHNtYWxsIEkgc3RpbGwgdGhpbmsgeW91IGFsc28gd2FudCB0bwo+IGF0dGFj
aCBhIGNvbW1lbnQgdG8gY2FsbCBvdXQgdGhpcyBiZWhhdmlvci4KCk9rYXkuCgoKSnVlcmdlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
