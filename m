Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A476C829
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 05:52:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnxPR-0007g6-3I; Thu, 18 Jul 2019 03:48:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kuv=VP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnxPP-0007g1-Hy
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 03:48:43 +0000
X-Inumbo-ID: ec5d18a0-a90e-11e9-b3f5-0700a59707a6
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec5d18a0-a90e-11e9-b3f5-0700a59707a6;
 Thu, 18 Jul 2019 03:48:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 996B6AFED;
 Thu, 18 Jul 2019 03:48:36 +0000 (UTC)
To: Joe Perches <joe@perches.com>, Zhenzhong Duan
 <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
 <9791d12717bba784f24f35c29ddfaab9ccb78965.camel@perches.com>
 <d4be507a-aa31-9ba3-9bf0-c8b60ec3f93a@suse.com>
 <18469f4c80f3dbf04eda5415f4bcf1c8fa655370.camel@perches.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3d74b1f6-37ae-dcb0-fa8a-6f02e183bbd7@suse.com>
Date: Thu, 18 Jul 2019 05:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <18469f4c80f3dbf04eda5415f4bcf1c8fa655370.camel@perches.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v8 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: sstabellini@kernel.org, x86@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMTkgMTk6MjIsIEpvZSBQZXJjaGVzIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0wNy0x
NyBhdCAwODo0OSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTcuMDcuMTkgMDg6
NDYsIEpvZSBQZXJjaGVzIHdyb3RlOgo+Pj4gT24gVHVlLCAyMDE5LTA3LTE2IGF0IDEyOjI2ICsw
ODAwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToKPj4+PiAuLiBhcyAibm9wdiIgc3VwcG9ydCBuZWVk
cyBpdCB0byBiZSBjaGFuZ2VhYmxlIGF0IGJvb3QgdXAgc3RhZ2UuCj4+Pj4KPj4+PiBDaGVja3Bh
dGNoIHJlcG9ydHMgd2FybmluZywgc28gbW92ZSB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgZnJvbQo+
Pj4+IGh5cGVydmlzb3IuYyB0byBoeXBlcnZpc29yLmgKPj4+IFtdCj4+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2
bS5jCj4+PiBbXQo+Pj4+IEBAIC0yNTksNyArMjU5LDcgQEAgc3RhdGljIF9faW5pdCB2b2lkIHhl
bl9odm1fZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCj4+Pj4gICAgI2VuZGlmCj4+Pj4gICAgfQo+Pj4+
ICAgIAo+Pj4+IC1jb25zdCBfX2luaXRjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5
cGVyX3hlbl9odm0gPSB7Cj4+Pj4gK3N0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVu
X2h2bSBfX2luaXRkYXRhID0gewo+Pj4KPj4+IHN0YXRpYz8KPj4KPj4gSXQgaXMgYmVpbmcgcmVm
ZXJlbmNlZCBmcm9tIGFyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCj4gCj4gQnV0IHdh
c24ndCBpdCBhbHNvIHJlbW92ZWQgZnJvbSB0aGUgbGlzdCBvZiBleHRlcm5zPwo+IAo+IFJlcmVh
ZGluZyB0aGUgLmggZmlsZSwgbm8gaXQgd2Fzbid0LiAgSSBtaXNzZWQgdGhhdC4KPiAKPiBQZXJo
YXBzIHRoZSBleHRlcm4gbGlzdCBjb3VsZCBiZSByZW9yZGVyZWQgdG8gbW92ZSB0aGlzCj4geDg2
X2h5cGVyX3hlbl9odm0gdG8gYmUgbmV4dCB0byB4ODZfaHlwZXJfdHlwZS4KPiAKPiBJIGFsc28g
c3VnZ2VzdCB0aGF0ICJleHRlcm4gYm9vbCBub3B2IiBtaWdodCBiZSBhIGJpdAo+IG5vbi1zcGVj
aWZpYyBhbmQgY291bGQgdXNlIGEgbG9uZ2VyIGlkZW50aWZpZXIuCgpZb3UgYXJlIGEgbGl0dGxl
IGJpdCBsYXRlLiBJdCBoYXMgYmVlbiB0aGlzIHdheSBzaW5jZSBWNSBvZiB0aGUgc2VyaWVzCnBv
c3RlZCBvbiBKdWx5IDNyZC4KCkkgaGF2ZSBwdXNoZWQgdGhlIHNlcmllcyB0byBteSB0cmVlIGFs
cmVhZHkgYW5kIEknbSBhYm91dCB0byBzZW5kIHRoZQpwdWxsIHJlcXVlc3QuCgpGb2xsb3d1cCBw
YXRjaGVzIHdlbGNvbWUuIDotKQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
