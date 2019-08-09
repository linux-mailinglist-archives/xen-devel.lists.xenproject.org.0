Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F21877E5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:54:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2Tb-0003ba-KR; Fri, 09 Aug 2019 10:50:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw2Ta-0003bV-Lg
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:50:26 +0000
X-Inumbo-ID: 7c83c2cc-ba93-11e9-80be-0b3aaaa58791
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c83c2cc-ba93-11e9-80be-0b3aaaa58791;
 Fri, 09 Aug 2019 10:50:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCF0EB04F;
 Fri,  9 Aug 2019 10:50:21 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
 <20190809020137.27334-2-marmarek@invisiblethingslab.com>
 <23885.19951.531473.98515@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ded65ae3-a819-4d8b-248d-59d69f9fc731@suse.com>
Date: Fri, 9 Aug 2019 12:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23885.19951.531473.98515@mariner.uk.xensource.com>
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

T24gMDkuMDguMjAxOSAxMjo0MSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltQQVRDSCAyLzJdIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3k6
IGRpc2FibGUgLVdmb3JtYXQtb3ZlcmZsb3ciKToKPj4gR0NDOSBjb21wbGFpbnMgYWJvdXQgIiUu
MTJzIiBmb3JtYXQgd2l0aCBhbiBhcmd1bWVudCBoYXZpbmcgZXhhY3RseSAxMgo+PiBieXRlcyBh
bmQgbm8gdGVybWluYXRpbmcgbnVsbCBjaGFyYWN0ZXIuIFRoaXMgaXMgaW50ZW50aW9uYWwKPj4g
Y29uc3RydWN0LCBzbyBkaXNhYmxlIHRoZSB3YXJuaW5nLgo+IAo+IElzIHRoZXJlIHNvbWUgZ29v
ZCByZWFzb24gdG8gaGF2ZSB0aGluZ3MgZG9uZSB0aGlzIHdheSA/Cj4gSVNUTSB0aGF0IGEgbmlj
ZXIgZml4IHdvdWxkIGJlIHRvIGNoYW5nZSAxMiB0byAxMywgZWFybGllci4KPiBUaGF0IHdheSB3
ZSB3b3VsZG4ndCBsb3NlIGp1c3RpZmllZCAtV2Zvcm1hdC1vdmVyZmxvdyBvdXRwdXQuCgpXb3Vs
ZCB5b3UgbWluZCBjbGFyaWZ5aW5nIHdoaWNoIDEyIHlvdSBtZWFuIHRvIGNoYW5nZSB0byAxMz8K
VGhlIG9uZSBpbiAiJS4xMnMiIHdvdWxkLCBpZiBjaGFuZ2VkIGFuZCBhZmFpY3QsIHRoZW4KbGVn
aXRpbWF0ZWx5IHRyaWdnZXIgdGhlIHdhcm5pbmcuIEFuZCB3ZSd2ZSBhbHJlYWR5IG9iamVjdGVk
CnRvIHRoZSBhcnJheSB0byBnZXQgZ3Jvd24uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
