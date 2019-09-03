Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F141A62D2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 09:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i53Ml-0003wo-IR; Tue, 03 Sep 2019 07:36:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i53Mj-0003wj-Gk
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 07:36:37 +0000
X-Inumbo-ID: 8e866b08-ce1d-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e866b08-ce1d-11e9-8980-bc764e2007e4;
 Tue, 03 Sep 2019 07:36:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8C96AF27;
 Tue,  3 Sep 2019 07:36:34 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190903051519.27617-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c46e04e-76f1-933d-a251-daf7a42b8dcb@suse.com>
Date: Tue, 3 Sep 2019 09:36:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903051519.27617-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: add macro for defining variable
 length array in public headers
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAwNzoxNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBTZXZlcmFsIHB1Ymxp
YyBoZWFkZXJzIG9mIHRoZSBoeXBlcnZpc29yIGNvbnRhaW4gc3RydWN0dXJlcyB3aXRoCj4gdmFy
aWFibGUgbGVuZ3RoIGFycmF5cy4gSW4gb3JkZXIgdG8gYmUgdXNhYmxlIHdpdGggZGlmZmVyZW50
IGNvbXBpbGVycwo+IHRob3NlIGRlZmluaXRpb25zIGFyZSBkZXBlbmRpbmcgb24gdGhlIGNvbXBp
bGVyIHR5cGUgYW5kIHRoZSBzdGFuZGFyZAo+IHN1cHBvcnRlZCBieSB0aGUgY29tcGlsZXIuCj4g
Cj4gSW4gb3JkZXIgdG8gYXZvaWQgb3BlbiBjb2RpbmcgdGhlIGRpZmZlcmVudCB2YXJpYW50cyBp
biBlYWNoIGhlYWRlcgo+IGFkZCBhIGNvbW1vbiBtYWNybyBmb3IgdGhhdCBwdXJwb3NlIGluIHhl
bi5oLgo+IAo+IFRoaXMgYXQgb25jZSBjb3JyZWN0cyBtb3N0IG9mIHRoZSBkZWZpbml0aW9ucyB3
aGljaCBtaXNzIG9uZSBjYXNlCj4gbGVhZGluZyB0byBub3QgZGVmaW5pbmcgdGhlIGFycmF5IGF0
IGFsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
