Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682AB11851B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:29:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecj4-0008NC-KH; Tue, 10 Dec 2019 10:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iecj2-0008N4-NA
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:26:40 +0000
X-Inumbo-ID: 8a5c93b0-1b37-11ea-8917-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a5c93b0-1b37-11ea-8917-12813bfff9fa;
 Tue, 10 Dec 2019 10:26:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0849DB13D;
 Tue, 10 Dec 2019 10:26:33 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
 <1042aef4-c873-6cf9-c7b4-cca1214d61af@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <df136147-76f4-841c-9f3e-2700fb856405@suse.com>
Date: Tue, 10 Dec 2019 11:26:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1042aef4-c873-6cf9-c7b4-cca1214d61af@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/AMD: unbreak CPU hotplug on AMD
 systems without RstrFpErrPtrs
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMTkgMTE6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjEyLjIwMTkgMDA6
NTYsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+PiBJZiB0aGUgZmVhdHVyZSBpcyBub3QgcHJlc2Vu
dCBYZW4gd2lsbCB0cnkgdG8gZm9yY2UgWDg2X0JVR19GUFVfUFRSUwo+PiBmZWF0dXJlIGF0IENQ
VSBpZGVudGlmaWNhdGlvbiB0aW1lLiBUaGlzIGlzIGVzcGVjaWFsbHkgbm90aWNlYWJsZSBpbgo+
PiBQVi1zaGltIHRoYXQgdXN1YWxseSBob3RwbHVncyBpdHMgdkNQVXMuIFdlIGVpdGhlciBuZWVk
IHRvIHJlc3RyaWN0IHRoaXMKPj4gYWN0aW9uIGZvciBib290IENQVSBvbmx5IG9yIGFsbG93IHNl
Y29uZGFyeSBDUFVzIHRvIG1vZGlmeQo+PiBmb3JjZWQgQ1BVIGNhcGFiaWxpdGllcyBhdCBydW50
aW1lLiBDaG9vc2UgdGhlIGZvcm1lciBzaW5jZSBtb2RpZnlpbmcKPj4gZm9yY2VkIGNhcGFiaWxp
dGllcyBvdXQgb2YgYm9vdCBwYXRoIGxlYXZlcyB0aGUgc3lzdGVtIGluIHBvdGVudGlhbGx5Cj4+
IGluY29uc2lzdGVudCBzdGF0ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4g
PGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gCj4gSSd2ZSBjb21taXR0ZWQgdGhpcyB0byB1
bnN0YWJsZSwgYXMgcGVyIHRoZSBvdXRjb21lIG9mIHRoZQo+IGNvbW11bml0eSBjYWxsLiBXaGF0
IGFib3V0IHRoaXMgZm9yIDQuMTM/IElpcmMgdGhlIGJyZWFrYWdlIHdhcwo+IGludHJvZHVjZWQg
ZHVyaW5nIHRoaXMgZGV2ZWxvcG1lbnQgY3ljbGUuCgpJbiB0aGlzIGNhc2U6CgpSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
