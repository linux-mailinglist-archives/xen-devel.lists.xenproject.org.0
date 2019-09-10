Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C943AEBE1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:47:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gRZ-0001sk-G8; Tue, 10 Sep 2019 13:44:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7gRX-0001sc-KO
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:44:27 +0000
X-Inumbo-ID: 1a38cba7-d3d1-11e9-ac1f-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1a38cba7-d3d1-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 13:44:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0F1728;
 Tue, 10 Sep 2019 06:44:25 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0535C3F59C;
 Tue, 10 Sep 2019 06:44:22 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
 <20190910120207.10358-5-ian.jackson@eu.citrix.com>
 <8ecf23b2-3fe9-069f-de17-2caa91e05d9b@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1f94c285-05a3-2a09-1091-d8283e669722@arm.com>
Date: Tue, 10 Sep 2019 14:44:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8ecf23b2-3fe9-069f-de17-2caa91e05d9b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 04/12] xen/domctl: Drop guest suffix from
 XEN_DOMCTL_CDF_hvm
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzEwLzE5IDE6MjAgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTAvMDkv
MjAxOSAxMzowMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IEZyb206IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gSSBzaG91bGQgcHJvYmFibHkgaGF2
ZSBmaW5pc2hlZCB3cml0aW5nIG15IGNvbW1pdCBtZXNzYWdlIGJlZm9yZSBoYW5kaW5nCj4gdGhl
IGJyYW5jaCBvZmYuCj4gCj4gIlRoZSBzdWZmaXggaXMgcmVkdW5kYW50LCBhbmQgZHJvcHBpbmcg
aXQgaGVscHMgdG8gc2ltcGxpZnkgdGhlIE9jYW1sL0MKPiBBQkkgY2hlY2tpbmcuIgo+IAo+IG9y
IHNvbWV0aGluZyBzdWl0YWJsZS4KCldpdGggdGhlIGNvbW1pdCBtZXNzYWdlIHVwZGF0ZWQ6CgpB
Y2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
