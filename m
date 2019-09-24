Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C6BC686
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:19:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCip7-0005YI-6y; Tue, 24 Sep 2019 11:17:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCip5-0005YB-N2
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:17:35 +0000
X-Inumbo-ID: e81c0146-debc-11e9-8a4f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e81c0146-debc-11e9-8a4f-bc764e2007e4;
 Tue, 24 Sep 2019 11:17:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CCB2B0DA;
 Tue, 24 Sep 2019 11:17:33 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
References: <20190914085251.18816-1-jgross@suse.com>
 <12d5ec32-8f7f-1cba-183c-d61dd8c4c10a@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <86c46251-6e36-412c-33df-9a8a3e7bd5f5@suse.com>
Date: Tue, 24 Sep 2019 13:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12d5ec32-8f7f-1cba-183c-d61dd8c4c10a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 00/47] xen: add core scheduling support
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
Cc: IgorDruzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTM6MTUsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGkgSnVlcmdlbiwKPiAK
PiBBZnRlciBhbiBleHRlbnNpdmUgdGVzdGluZyBvZiB5b3VyIGpncm9zczEvc2NoZWQtdjMgYnJh
bmNoIGluIFhlblJULAo+IEknbSBoYXBweSB0byBzYXkgdGhhdCB3ZSd2ZSBmb3VuZCBubyBmdW5j
dGlvbmFsIHJlZ3Jlc3Npb25zIHNvIGZhcgo+IHdoZW4gcnVubmluZyBpbiB0aGUgZGVmYXVsdCAo
dGhyZWFkL2NwdSkgbW9kZS4KPiAKPiBIb3BlZnVsbHkgdGhpcyBnaXZlcyBzb21lIGxldmVsIG9m
IGNvbmZpZGVuY2UgdG8gdGhpcyBzZXJpZXMgYW5kIHRoZQo+IHBsYW4gYWJvdXQgaW5jbHVkaW5n
IGl0IGludG8gNC4xMyBbMV0KPiAKPiBbMV0gUkZDOiBDcml0ZXJpYSBmb3IgY2hlY2tpbmcgaW4g
Y29yZSBzY2hlZHVsaW5nIHNlcmllcwo+ICAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVu
LWRldmVsLzk3ZTFiZmU0LTMzODMtZmYxZC1iZjYxLTQ4YjhhYTYzYmIyY0BjaXRyaXguY29tLwoK
VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBlZmZvcnRzIGFuZCB0aGUgY29uZmlybWF0aW9u
IQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
