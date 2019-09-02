Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF0A545E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 12:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4jrM-0007s9-Sk; Mon, 02 Sep 2019 10:46:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4jrL-0007ry-2A
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 10:46:55 +0000
X-Inumbo-ID: f9ca8cfa-cd6e-11e9-aea1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9ca8cfa-cd6e-11e9-aea1-12813bfff9fa;
 Mon, 02 Sep 2019 10:46:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C7AC4B6D7;
 Mon,  2 Sep 2019 10:46:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <7855161d-914a-b732-4039-f058046646e4@suse.com>
 <858c0c6f-1244-36ba-eae3-76ee446bb903@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7fea980d-79be-4cba-2b45-d3b41434d71e@suse.com>
Date: Mon, 2 Sep 2019 12:46:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <858c0c6f-1244-36ba-eae3-76ee446bb903@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RESEND/PING] core-parking: interact with
 runtime SMT-disabling
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxMjozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wOC8yMDE5
IDE0OjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2hlbiBkaXNhYmxpbmcgU01UIGF0IHJ1bnRp
bWUsIHNlY29uZGFyeSB0aHJlYWRzIHNob3VsZCBubyBsb25nZXIgYmUKPj4gY2FuZGlkYXRlcyBm
b3IgYnJpbmdpbmcgYmFjayB1cCBpbiByZXNwb25zZSB0byBfUFVEIEFDUEkgZXZlbnRzLiBQdXJn
ZQo+PiB0aGVtIGZyb20gdGhlIHRyYWNraW5nIGFycmF5Lgo+IAo+IEkgdGhpbmsgSSBhZ3JlZSBp
biBwcmluY2lwbGUsIGJ1dCB3aGF0IGFyZSBfUFVEIGV2ZW50cz/CoCBJIGNhbid0IGZpbmQKPiBh
bnkgcmVmZXJlbmNlIHRvIHRoZW0gYXQgYWxsIGluIHRoZSBBQ1BJIHNwZWMuCgpPb3BzIC0gdHlw
bzogX1BVUiBpcyB0aGUgY29ycmVjdCBuYW1lLiBJJ20gc29ycnkuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
