Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553A1505F4
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:16:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyabu-0007bA-E6; Mon, 03 Feb 2020 12:13:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyabr-0007b0-Vn
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:13:48 +0000
X-Inumbo-ID: a0f9d0ca-467e-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0f9d0ca-467e-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 12:13:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFACAB0BD;
 Mon,  3 Feb 2020 12:13:44 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <728de9be-7bef-8d3c-dbdf-9f39930ce9ae@suse.com>
Date: Mon, 3 Feb 2020 13:13:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200121084330.18309-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/9] xen: split parameter related
 definitions in own header file
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAwOTo0MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBNb3ZlIHRoZSBwYXJh
bWV0ZXIgcmVsYXRlZCBkZWZpbml0aW9ucyBmcm9tIGluaXQuaCBpbnRvIGEgbmV3IGhlYWRlcgo+
IGZpbGUgcGFyYW0uaC4gVGhpcyB3aWxsIGF2b2lkIGluY2x1ZGUgaGVsbCB3aGVuIG5ldyBkZXBl
bmRlbmNpZXMgYXJlCj4gYWRkZWQgdG8gcGFyYW1ldGVyIGRlZmluaXRpb25zLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClRoZXJlIHdhcyBzb21l
IHJlLWJhc2luZyBuZWNlc3NhcnkgaGVyZSwgd2hpY2ggSSBob3BlIEkgZGlkbid0IHNjcmV3CnVw
LiBJIGFsc28gZGVjaWRlZCB0byBjb21taXQgdGhpcyBkZXNwaXRlLCBmcm9tIGEgc3RyaWN0bHkg
Zm9ybWFsCnBlcnNwZWN0aXZlLCB0aGVyZSBzdGlsbCBiZWluZyBtaXNzaW5nIGFja3MgaGVyZSwg
YmFzZWQgb24gdGhpcwpiZWluZyBhbiBlbnRpcmVseSBtZWNoYW5pY2FsIGNoYW5nZSB0byB0aG9z
ZSBmaWxlcywgYW5kIG9uIHRoZQpncm91bmRzIHRoYXQgZnVydGhlciByZS1iYXNpbmcgd291bGQg
bGlrZWx5IHR1cm4gb3V0IHRvIGJlIG5lZWRlZAp3aXRoIGZ1cnRoZXIgZGVsYXlzIGhlcmUuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
