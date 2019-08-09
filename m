Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FE878BF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 13:36:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw39t-0006ve-EQ; Fri, 09 Aug 2019 11:34:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw39r-0006vZ-LV
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 11:34:07 +0000
X-Inumbo-ID: 97c4cf9e-ba99-11e9-a7a7-93293fcce331
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97c4cf9e-ba99-11e9-a7a7-93293fcce331;
 Fri, 09 Aug 2019 11:34:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9AD62AF3B;
 Fri,  9 Aug 2019 11:34:04 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
 <20190809020137.27334-2-marmarek@invisiblethingslab.com>
 <23885.19951.531473.98515@mariner.uk.xensource.com>
 <ded65ae3-a819-4d8b-248d-59d69f9fc731@suse.com>
 <23885.21353.328881.739407@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77bec705-d23e-5bcf-56e3-45b33829a087@suse.com>
Date: Fri, 9 Aug 2019 13:34:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23885.21353.328881.739407@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] tools/tests/cpu-policy: disable
 -Wformat-overflow
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxMzowNSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmFuIEJldWxpY2ggd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzJdIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3k6
IGRpc2FibGUgLVdmb3JtYXQtb3ZlcmZsb3ciKToKPj4gV291bGQgeW91IG1pbmQgY2xhcmlmeWlu
ZyB3aGljaCAxMiB5b3UgbWVhbiB0byBjaGFuZ2UgdG8gMTM/Cj4+IFRoZSBvbmUgaW4gIiUuMTJz
IiB3b3VsZCwgaWYgY2hhbmdlZCBhbmQgYWZhaWN0LCB0aGVuCj4+IGxlZ2l0aW1hdGVseSB0cmln
Z2VyIHRoZSB3YXJuaW5nLiBBbmQgd2UndmUgYWxyZWFkeSBvYmplY3RlZAo+PiB0byB0aGUgYXJy
YXkgdG8gZ2V0IGdyb3duLgo+IAo+IEkgbWVhbnQgdGhlIGFycmF5LiAgSSBtaXNzZWQgdGhhdCBv
YmplY3Rpb24uICBJIGp1c3Qgd2VudCBhbmQgcmVhZCB0aGUKPiB0aHJlYWQKPiAgICB0ZXN0cy9j
cHUtcG9saWN5OiBmaXggZm9ybWF0LW92ZXJmbG93IHdhcm5pbmcgYnkgbnVsbCB0ZXJtaW5hdGlu
ZyBzdHJpbmdzCj4gYW5kIGl0IGRpZCBjb25jbHVkZSB0aGF0IHRoZSBjb21waWxlciB3YXMgd3Jv
bmcgdG8gY29tcGxhaW4uCj4gCj4gQnV0IGZvciBtZSBpdCBkb2Vzbid0IGZvbGxvdyB0aGF0IHRo
ZSBvcmlnaW5hbCBjb2RlIGlzIG5lY2Vzc2FyaWx5IHRoZQo+IGJlc3Qgd2F5IG9mIGRvaW5nIHRo
aW5ncywgYW5kIEkgZGlkbid0IHNlZSBhbnlvbmUgZ2l2aW5nIGFuIGFyZ3VtZW50Cj4gd2h5IHNp
bXBseSBpbmNyZWFzaW5nIHRoZSBhcnJheSB3YXMgYSBiYWQgaWRlYS4KPiAKPiBDICJwcmVmZXJz
IiBudWxsLXRlcm1pbmF0ZWQgc3RyaW5ncyBpbiB0aGF0IHRoZXkgd29yayBzb21ld2hhdCBiZXR0
ZXIKPiB3aXRoIGEgdmFyaWV0eSBvZiBwcmltaXRpdmVzLgoKUmlnaHQsIGJ1dCB0aGUgJS48bnVt
PnMgc3BlY2lmaWNhdGlvbiBleGl0cyBwcmVjaXNlbHkgdG8gYWxsb3cKdG8gZGVhbCB3aXRoIHBv
dGVudGlhbGx5IG5vdCBudWwtdGVybWluYXRlZCBzdHJpbmdzLiBBQ1BJIGNvZGUKaW4gdGhlIGh5
cGVydmlzb3IgbWFrZXMgcXVpdGUgYSBiaXQgb2YgdXNlIG9mIHRoaXMsIGZvciBleGFtcGxlLAp3
aXRob3V0IHRyaWdnZXJpbmcgYW55IGNvbXBpbGVyIHdhcm5pbmdzIHdpdGggOS4xLjAuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
