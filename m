Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3099BBC7EE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 14:36:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCk1F-0005ZS-Uz; Tue, 24 Sep 2019 12:34:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCk1D-0005ZL-Q5
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 12:34:11 +0000
X-Inumbo-ID: 9b92e460-dec7-11e9-961a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 9b92e460-dec7-11e9-961a-12813bfff9fa;
 Tue, 24 Sep 2019 12:34:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C9E2AABF4;
 Tue, 24 Sep 2019 12:34:09 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-14-jgross@suse.com>
 <fe0d39d5-fb21-33e2-59de-38da683d62f9@suse.com>
 <b2ac925d-64c0-039b-40cb-c1254fe73127@suse.com>
 <8b536899-0de9-cfce-7792-f61d433715e1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5b2cd0f1-c3c1-5e6c-fe4a-2e73e6f86883@suse.com>
Date: Tue, 24 Sep 2019 14:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8b536899-0de9-cfce-7792-f61d433715e1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 13/47] xen/sched: add is_running
 indicator to struct sched_unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTQ6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMTM6
NDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDE5LjA5LjE5IDE3OjUzLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQEAgLTE2NzMsOCArMTY3NiwxMCBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lkKQo+Pj4+
ICAgICAgICAgKiBzd2l0Y2gsIGVsc2UgbG9zdF9yZWNvcmRzIHJlc3VtZSB3aWxsIG5vdCB3b3Jr
IHByb3Blcmx5Lgo+Pj4+ICAgICAgICAgKi8KPj4+PiAgICAKPj4+PiAtICAgIEFTU0VSVCghbmV4
dC0+aXNfcnVubmluZyk7Cj4+Pj4gKyAgICBBU1NFUlQoIW5leHQtPnNjaGVkX3VuaXQtPmlzX3J1
bm5pbmcpOwo+Pj4+ICAgICAgICBuZXh0LT5pc19ydW5uaW5nID0gMTsKPj4+PiArICAgIG5leHQt
PnNjaGVkX3VuaXQtPmlzX3J1bm5pbmcgPSAxOwo+Pj4KPj4+IE5pdDogVGhlIG5ldyBmaWVsZCBp
cyBvZiB0eXBlIGJvb2wsIGFuZCBoZW5jZSB5b3Ugc2hvdWxkIHdyaXRlIHRydWUKPj4+IGFuZCBm
YWxzZSBpbnRvIGl0LiBUaGlzIG1heSBsb29rIG9kZCBuZXh0IHRvIHRoZSAxIGFib3ZlLCBidXQg
YnkKPj4+IHRoZSBlbmQgb2YgdGhlIHNlcmllcyB0aGUgdHdvIHdvbid0IHNpdCBuZXh0IHRvIGVh
Y2ggb3RoZXIgYW55bW9yZS4KPj4KPj4gSW5kZWVkLiBBbmQgbWFraW5nIHZjcHUtPmlzX3J1bm5p
bmcgYSBib29sIGlzIGFub3RoZXIgaXRlbSBvbiBteSBsaXN0Cj4+IGZvciB0aGUgY2xlYW51cC4K
PiAKPiBJcyBpdD8gSXQncyBhbHJlYWR5IGJvb2wgYWZhaWNzLiBJdCdzIGp1c3QgdGhlIHZhbHVl
cyB3cml0dGVuIHRvIGl0Cj4gd2hpY2ggYXJlbid0IHByb3Blcmx5IHRydWUgLyBmYWxzZS4KClNh
dyB0aGF0IGFmdGVyIHNlbmRpbmcgbXkgbWFpbC4gU28gMC8xIC0+IGZhbHNlL3RydWUgaXMgdGhl
IGl0ZW0gdG8gZG8uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
