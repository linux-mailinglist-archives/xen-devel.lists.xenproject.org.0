Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90016AF8F7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 11:33:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7yxY-0002jC-W7; Wed, 11 Sep 2019 09:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7yxX-0002j3-QF
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 09:30:43 +0000
X-Inumbo-ID: d35b1d14-d476-11e9-ac26-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d35b1d14-d476-11e9-ac26-12813bfff9fa;
 Wed, 11 Sep 2019 09:30:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A3AFB746;
 Wed, 11 Sep 2019 09:30:42 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97a771af-32a3-596d-30e2-7042374d14e3@suse.com>
Date: Wed, 11 Sep 2019 11:30:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911062001.25931-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 4/5] tools: add xenfs tool
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAwODoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS90b29scy9t
aXNjL01ha2VmaWxlCj4gKysrIGIvdG9vbHMvbWlzYy9NYWtlZmlsZQo+IEBAIC0yNCw2ICsyNCw3
IEBAIElOU1RBTExfU0JJTi0kKENPTkZJR19YODYpICAgICArPSB4ZW4tbG93bWVtZAo+ICBJTlNU
QUxMX1NCSU4tJChDT05GSUdfWDg2KSAgICAgKz0geGVuLW1mbmR1bXAKPiAgSU5TVEFMTF9TQklO
LSQoQ09ORklHX1g4NikgICAgICs9IHhlbi11Y29kZQo+ICBJTlNUQUxMX1NCSU4gICAgICAgICAg
ICAgICAgICAgKz0geGVuY292Cj4gK0lOU1RBTExfU0JJTiAgICAgICAgICAgICAgICAgICArPSB4
ZW5mcwoKV2h5IFNCSU4/IElzIHRoZXJlIGFueXRoaW5nIHdyb25nIHdpdGggYWxsb3dpbmcgdW5w
cml2aWxlZ2VkCnVzZXJzIHIvbyBhY2Nlc3M/IE9yIGlzIHRoaXMgYmVjYXVzZSBpbiBvcmRlciB0
byBhY2Nlc3MgdGhlCmh5cGVyY2FsbCBpbnRlcmZhY2Ugb25lIG5lZWRzIHRvIGJlIHJvb3Q/IElm
IHNvLCB3ZSBtYXkgd2FudAp0byBjb25zaWRlciByZWxheGluZy9hdm9pZGluZy9ieXBhc3Npbmcg
dGhpcyBpbiBzb21lIHNlbnNpYmxlCndheS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
