Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6CC1FEA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtkP-00028M-Uu; Mon, 30 Sep 2019 11:21:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEtkO-00028E-SZ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:21:44 +0000
X-Inumbo-ID: 7b49ad0e-e374-11e9-96ce-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7b49ad0e-e374-11e9-96ce-12813bfff9fa;
 Mon, 30 Sep 2019 11:21:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B54EAC7B;
 Mon, 30 Sep 2019 11:21:43 +0000 (UTC)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-3-wipawel@amazon.de>
 <96f675c6-a841-be3a-5388-ed13835d996c@suse.com>
 <BE8CB0AD-C5F0-489A-9234-D0C07C13D0EF@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8cae79e-21d2-5fa2-d31a-57453f648126@suse.com>
Date: Mon, 30 Sep 2019 13:21:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BE8CB0AD-C5F0-489A-9234-D0C07C13D0EF@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 02/12] livepatch: Allow to override
 inter-modules buildid dependency
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
 AndrewCooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Martin Pohlack <mpohlack@amazon.de>, RossLagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMzoxNCwgIFdpZWN6b3JraWV3aWN6LCBQYXdlbCAgd3JvdGU6Cj4gCj4g
Cj4+IE9uIDMwLiBTZXAgMjAxOSwgYXQgMTM6MDUsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDI4LjA5LjIwMTkgMTc6MTIsIFBhd2VsIFdpZWN6b3JraWV3
aWN6IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4+PiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPj4+IEBAIC0zNSw3ICszNSw3IEBACj4+PiAj
aW5jbHVkZSAiZG9tY3RsLmgiCj4+PiAjaW5jbHVkZSAicGh5c2Rldi5oIgo+Pj4KPj4+IC0jZGVm
aW5lIFhFTl9TWVNDVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxMgo+Pj4gKyNkZWZpbmUg
WEVOX1NZU0NUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDEzCj4+Cj4+IE9oLCBJIHNlZS4K
Pj4KPj4+IEBAIC05NTYsNiArOTU2LDE1IEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9h
Y3Rpb24gewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiBoeXBlcnZpc29yIGRlZmF1bHQuICovCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIE9yIHVwcGVyIGJvdW5kIG9mIHRpbWUgKG5zKSAqLwo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBmb3Igb3BlcmF0aW9u
IHRvIHRha2UuICovCj4+PiArCj4+PiArLyoKPj4+ICsgKiBPdmVyd3JpdGUgZGVmYXVsdCBpbnRl
ci1tb2R1bGUgYnVpbGRpZCBkZXBlbmRlbmN5IGNoYWluIGVuZm9yY2VtZW50Lgo+Pj4gKyAqIENo
ZWNrIG9ubHkgaWYgbW9kdWxlIGlzIGJ1aWx0IGZvciBnaXZlbiBoeXBlcnZpc29yIGJ5IGNvbXBh
cmluZyBidWlsZGlkLgo+Pj4gKyAqLwo+Pj4gKyNkZWZpbmUgTElWRVBBVENIX0FDVElPTl9BUFBM
WV9OT0RFUFMgKDEgPDwgMCkKPj4+ICsgICAgdWludDY0X3QgZmxhZ3M7ICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qIElOOiBhY3Rpb24gZmxhZ3MuICovCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBQcm92aWRlIGFkZGl0aW9uYWwgcGFyYW1ldGVy
cyAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
Zm9yIGFuIGFjdGlvbi4gKi8KPj4KPj4gNjQgYml0cyBzZWVtcyBxdWl0ZSBhIGxvdCAoYW5kIHVu
dXN1YWwpIGZvciBhIGZsYWdzIGZpZWxkLiBBbHNvLAo+IAo+IFdoZW4gSSB1c2UgdWludDMyX3Qg
Zm9yIHRoZSBmbGFncywgSSB3b3VsZCBoYXZlIHRvIGFsc28gYWRkIGFub3RoZXIKPiBvbmUgZm9y
IHBhZGRpbmcgSSBzdXBwb3NlLgo+IFdoeSBub3QganVzdCB1c2UgdGhhdCBzcGFjZSBmb3IgZnV0
dXJlIGZsYWdzPyBTbywgSSBjaG9zZSB1aW50NjRfdC4KCnVpbnQ2NF90IGlzIChvbiB4ODYgYW5k
IDMyLWJpdCBhcmNoaXRlY3R1cmVzIGF0IGxlYXN0KSBsZXNzIGVmZmljaWVudAp0byBkZWFsIHdp
dGguCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
