Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260259B4CB
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 18:45:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1CeY-0000o2-4x; Fri, 23 Aug 2019 16:43:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RUCl=WT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i1CeX-0000nu-5Y
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 16:43:05 +0000
X-Inumbo-ID: 11cc23e2-c5c5-11e9-951b-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 11cc23e2-c5c5-11e9-951b-bc764e2007e4;
 Fri, 23 Aug 2019 16:43:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A297228;
 Fri, 23 Aug 2019 09:43:00 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 162EC3F246;
 Fri, 23 Aug 2019 09:42:58 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-21-jgross@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2bf28234-0102-8b3e-4efd-ebc802b5d3b4@arm.com>
Date: Fri, 23 Aug 2019 17:42:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-21-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 20/48] xen: let vcpu_create() select
 processor
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
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDA5LzA4LzIwMTkgMTU6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
VG9kYXkgdGhlcmUgYXJlIHR3byBkaXN0aW5jdCBzY2VuYXJpb3MgZm9yIHZjcHVfY3JlYXRlKCk6
IGVpdGhlciBmb3IKPiBjcmVhdGlvbiBvZiBpZGxlLWRvbWFpbiB2Y3B1cyAodmNwdWlkID09IHBy
b2Nlc3Nvcikgb3IgZm9yIGNyZWF0aW9uIG9mCj4gIm5vcm1hbCIgZG9tYWluIHZjcHVzIChpbmNs
dWRpbmcgZG9tMCksIHdoZXJlIHRoZSBjYWxsZXIgc2VsZWN0cyB0aGUKPiBpbml0aWFsIHByb2Nl
c3NvciBvbiBhIHJvdW5kLXJvYmluIHNjaGVtZSBvZiB0aGUgYWxsb3dlZCBwcm9jZXNzb3JzCj4g
KGFsbG93ZWQgYmVpbmcgYmFzZWQgb24gY3B1cG9vbCBhbmQgYWZmaW5pdGllcykuCj4gCj4gSW5z
dGVhZCBvZiBwYXNzaW5nIHRoZSBpbml0aWFsIHByb2Nlc3NvciB0byB2Y3B1X2NyZWF0ZSgpIGFu
ZCBwYXNzaW5nCj4gb24gdG8gc2NoZWRfaW5pdF92Y3B1KCkgbGV0IHNjaGVkX2luaXRfdmNwdSgp
IGRvIHRoZSBwcm9jZXNzb3IKPiBzZWxlY3Rpb24uIEZvciBzdXBwb3J0aW5nIGRvbTAgdmNwdSBj
cmVhdGlvbiB1c2UgdGhlIG5vZGVfYWZmaW5pdHkgb2YKPiB0aGUgZG9tYWluIGFzIGEgYmFzZSBm
b3Igc2VsZWN0aW5nIHRoZSBwcm9jZXNzb3JzLiBVc2VyIGRvbWFpbnMgd2lsbAo+IGhhdmUgaW5p
dGlhbGx5IGFsbCBub2RlcyBzZXQsIHNvIHRoaXMgaXMgbm8gZGlmZmVyZW50IGJlaGF2aW9yIGNv
bXBhcmVkCj4gdG8gdG9kYXkuIEluIHRoZW9yeSB0aGlzIGlzIG5vdCBndWFyYW50ZWVkIGFzIHZj
cHVzIGFyZSBjcmVhdGVkIG9ubHkKPiB3aXRoIFhFTl9ET01DVExfbWF4X3ZjcHVzIGJlaW5nIGNh
bGxlZCwgYnV0IHRoaXMgY2FsbCBpcyBnb2luZyB0byBiZQo+IHJlbW92ZWQgaW4gZnV0dXJlIGFu
ZCB0aGUgdG9vbHN0YWNrIGRvZXNuJ3QgY2FsbAo+IFhFTl9ET01DVExfc2V0bm9kZWFmZmluaXR5
IGJlZm9yZSBjYWxsaW5nIFhFTl9ET01DVExfbWF4X3ZjcHVzLgo+IAo+IFRvIGJlIGFibGUgdG8g
dXNlIGNvbnN0IHN0cnVjdCBkb21haW4gKiBtYWtlIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soKQo+
IHRha2UgYSBjb25zdCBkb21haW4gcG9pbnRlciwgdG9vLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkZvciB0aGUgQXJtIGJpdHM6CgpBY2tlZC1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
