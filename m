Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B4C04CF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:06:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoyj-0003gt-4P; Fri, 27 Sep 2019 12:04:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDoyh-0003gm-KJ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:04:03 +0000
X-Inumbo-ID: e517a004-e11e-11e9-9677-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e517a004-e11e-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:04:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C05CCAC37;
 Fri, 27 Sep 2019 12:04:01 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
References: <20190927114554.11513-1-paul.durrant@citrix.com>
 <14ed3dcd-3e20-0de0-c875-7a596441ee72@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3d907b91-4c78-4892-8605-03366a9792a6@suse.com>
Date: Fri, 27 Sep 2019 14:04:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <14ed3dcd-3e20-0de0-c875-7a596441ee72@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu: fix PVH dom0 settings
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
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTQ6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjA5LjIwMTkgMTM6
NDUsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gUFZIIGRvbTAgbXVzdCBvcGVyYXRlIHdpdGggdGhl
IGlvbW11IHNldHRpbmdzIGluICdzdHJpY3QnIG1vZGUgaS5lLiBvbmx5IHRoZQo+PiBkb21haW4n
cyBvd24gcGFnZXMgd2lsbCBiZSBtYXBwZWQgaW4gdGhlIElPTU1VLiBUaGUgY2hlY2tfaHdkb21f
cmVxcygpIGlzCj4+IHN1cHBvc2VkIHRvIGVuc3VyZSB0aGlzLiBVbmZvcnR1bmF0ZWx5IHRoZSB0
ZXN0IGZvciBhIFBWSCBkb20wIGlzIG1hZGUKPj4gdXNpbmcgcGFnaW5nX21vZGVfdHJhbnNsYXRl
KCkgYW5kLCB3aGVuIGNvbW1pdCBmODlmNTU1OCAicmVtb3ZlIGxhdGUKPj4gKG9uLWRlbWFuZCkg
Y29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzIiBtb3ZlZCB0aGUgY2FsbCBvZgo+PiBj
aGVja19od2RvbV9yZXFzKCkgZnJvbSBpb21tdV9od2RvbV9pbml0KCkgdG8gaW9tbXVfZG9tYWlu
X2luaXQoKSwgdGhhdAo+PiB0ZXN0IGJlY2FtZSBpbmVmZmVjdGl2ZSAoYmVjYXVzZSBpb21tdV9k
b21haW5faW5pdCgpIGlzIGNhbGxlZCBiZWZvcmUKPj4gcGFnaW5nX2VuYWJsZSgpKS4KPj4KPj4g
VGhpcyBwYXRjaCByZXBsYWNlcyB0aGUgdGVzdCBvZiBwYWdpbmdfbW9kZV90cmFuc2xhdGUoKSB3
aXRoIGEgdGVzdCBvZgo+PiBoYXBfZW5hYmxlZCgpLCBhbmQgYWxzbyB2ZXJpZmllcyAnc3RyaWN0
JyBtb2RlIGlzIHR1cm5lZCBvbiBpbgo+PiBhcmNoX2lvbW11X2NoZWNrX2F1dG90cmFuc2xhdGVk
X2h3ZG9tKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+IAo+IE9oLCBhbmQgSSBndWVzcyB5b3UndmUgYWxzbyBtZWFudCB0byBDYyBK
w7xyZ2VuIGZvciBhIHJlbGVhc2UgYWNrCj4gKG5vdyBkb25lKT8KClRoYW5rcyBmb3IgdGhlIENj
IQoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
