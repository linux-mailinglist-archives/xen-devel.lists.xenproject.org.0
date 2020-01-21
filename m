Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C943143E0D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 14:32:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ittag-0005dd-UH; Tue, 21 Jan 2020 13:29:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ittae-0005d6-PC
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 13:29:08 +0000
X-Inumbo-ID: fb49116c-3c51-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb49116c-3c51-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 13:28:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E8438B26F;
 Tue, 21 Jan 2020 13:28:57 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-3-jgross@suse.com>
 <f16e7cc7-4fca-8b24-ce12-041a19ca19ae@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5964014f-3777-ef1e-0929-2b660d2d7502@suse.com>
Date: Tue, 21 Jan 2020 14:28:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <f16e7cc7-4fca-8b24-ce12-041a19ca19ae@xen.org>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAgMTQ6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDIxLzAxLzIwMjAgMDg6NDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE1vdmUgdGhlIHBh
cmFtZXRlciByZWxhdGVkIGRlZmluaXRpb25zIGZyb20gaW5pdC5oIGludG8gYSBuZXcgaGVhZGVy
Cj4+IGZpbGUgcGFyYW0uaC4gVGhpcyB3aWxsIGF2b2lkIGluY2x1ZGUgaGVsbCB3aGVuIG5ldyBk
ZXBlbmRlbmNpZXMgYXJlCj4+IGFkZGVkIHRvIHBhcmFtZXRlciBkZWZpbml0aW9ucy4KPiAKPiBI
b3cgZGlkIHlvdSBmaW5kIG91dCB0aGUgbGlzdCBvZiBwbGFjZXMgd2hlcmUgdGhlIG5ldyBmaWxl
cyBuZWVkIHRvIGJlIAo+IGluY2x1ZGVkPwoKSSBkaWQgYSBncmVwIGZvciBhbGwgcGFyYW1ldGVy
IGRlZmluaXRpb25zLgoKPiAKPiBBbHNvLCB3YXMgaXQgYnVpbGQgdGVzdCBpdCBvbiBBcm0/CgpZ
ZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
