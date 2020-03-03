Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF017714C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 09:33:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j92wX-0008Ac-29; Tue, 03 Mar 2020 08:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j92wV-0008AX-S2
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 08:30:19 +0000
X-Inumbo-ID: 36f1798c-5d29-11ea-902a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36f1798c-5d29-11ea-902a-bc764e2007e4;
 Tue, 03 Mar 2020 08:30:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ADABEB1FB;
 Tue,  3 Mar 2020 08:30:17 +0000 (UTC)
To: Yan Yankovskyi <yyankovskyi@gmail.com>
References: <20200229223035.GA28145@kbp1-lhp-F74019>
 <fba833c4-3173-0094-b4ec-53e9f42bfb3e@suse.com>
 <20200302221826.GA18206@kbp1-lhp-F74019>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38739aa0-200e-fd46-ea38-c30a6aa69561@suse.com>
Date: Tue, 3 Mar 2020 09:30:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302221826.GA18206@kbp1-lhp-F74019>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: Use 'unsigned int' instead of
 'unsigned'
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAyMCAyMzoxOCwgWWFuIFlhbmtvdnNreWkgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MiwgMjAyMCBhdCAxMDoxMSBKYW4gQmV1bGljaCB3cm90ZToKPj4gLi4uIGV2dGNobl9wb3J0X3Qg
aGVyZSBhbmQgZWxzZXdoZXJlLgo+IAo+IFRoZXJlIGFyZSBzb21lIGludGVyZmFjZXMgd2l0aCBz
aWduZWQgaW50IGFzIGEgdHlwZSBmb3IgcG9ydCwgZS5nLiBpbgo+IGluY2x1ZGUveGVuL2V2ZW50
cy5oLgo+IFNob3VsZCBJIGNyZWF0ZSBhZGRpdGlvbmFsIHBhdGNoIHRvIHJlc29sdmUgaW5jb25z
aXN0ZW5jeSB3aXRoIGV2dGNobgo+IGludGVyZmFjZT8KPiBPciB5b3Ugc3VnZ2VzdCBjb21iaW5p
bmcgdGhlc2UgY2hhbmdlcyBpbnRvIHRoZSBleGlzdGluZyBwYXRjaD8KClNpZ25lZCA8LT4gdW5z
aWduZWQgY29udmVyc2lvbnMgd291bGQgcGVyaGFwcyBiZXR0ZXIgZ28gaW50byBhCnNlcGFyYXRl
IHBhdGNoLiBCdXQgbm90ZSBJJ20gbm90IHRoZSBtYWludGFpbmVyIG9mIHRoaXMgY29kZS4KCj4g
QWxzbyBhcyBJIHVuZGVyc3RhbmQgJ2V2dGNobicgYW5kICdwb3J0JyBhcmUgZXNzZW50aWFsbHkg
dGhlIHNhbWUKPiBlbnRpdGllcyBmcm9tIHBlcnNwZWN0aXZlIG9mIGxvY2FsIGRvbWFpbiwgcmVs
YXRlZCB0byBlYWNoIG90aGVyIHJvdWdobHkKPiBsaWtlIGNvbm5lY3Rpb24gYW5kIGZpbGUgZGVz
Y3JpcHRvciBwYWlyLiBXaGF0IGRvIHlvdSB0aGluayBhYm91dAo+IHJlbmFtaW5nIGFsbCAnZXZ0
Y2huJyBhcmd1bWVudHMgYW5kIHZhcmlhYmxlcyB0byAncG9ydCc/Cj4gSXQgd2lsbCBlbGltaW5h
dGUgaW5jb25zaXN0ZW5jaWVzIGluIHRoZSBjb2RlLCBmb3IgZXhhbXBsZQo+IGluIGluY2x1ZGUv
eGVuL2ludGVyZmFjZS9ldmVudF9jaGFubmVsLmggYW5kIGluY2x1ZGUveGVuL2V2ZW50cy5oLgoK
SSdkIHdlbGNvbWUgdGhpcywgYnV0IHRoZSBtYWludGFpbmVycyB3aWxsIGhhdmUgdGhlIGZpbmFs
IHNheS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
