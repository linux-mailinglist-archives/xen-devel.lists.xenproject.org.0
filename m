Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B341DAD66E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:09:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7GZu-0001TN-Ca; Mon, 09 Sep 2019 10:07:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7GZt-0001TG-2R
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:07:21 +0000
X-Inumbo-ID: 9bb15470-d2e9-11e9-ac09-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9bb15470-d2e9-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 10:07:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050A91000;
 Mon,  9 Sep 2019 03:07:19 -0700 (PDT)
Received: from [10.37.9.253] (unknown [10.37.9.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05C363F71F;
 Mon,  9 Sep 2019 03:07:15 -0700 (PDT)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20190906143021.28261-1-roger.pau@citrix.com>
 <20190906143021.28261-2-roger.pau@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a44c9bd0-0428-b47c-ef6f-302b9a51d3e4@arm.com>
Date: Mon, 9 Sep 2019 11:07:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906143021.28261-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] sysctl: report existing physcaps on
 ARM
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
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaXRsZSBOSVQ6IHMvQVJNL0FybS8KCk9uIDkvNi8xOSAzOjMwIFBNLCBSb2dlciBQYXUg
TW9ubmUgd3JvdGU6Cj4gQ3VycmVudCBwaHlzY2FwcyBpbiBYRU5fU1lTQ1RMX3BoeXNpbmZvIGFy
ZSBvbmx5IHVzZWQgYnkgeDg2LCBhbGJlaXQKPiB0aGUgY2FwYWJpbGl0aWVzIHRoZW1zZWx2ZXMg
YXJlIG5vdCB4ODYgc3BlY2lmaWMuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGFs
c28gcmVwb3J0aW5nIHRoZSBjdXJyZW50IGNhcGFiaWxpdGllcyBvbgo+IEFSTSBoYXJkd2FyZS4g
Tm90ZSB0aGF0IG9uIEFSTSBQSFlTQ0FQX2h2bSBpcyBhbHdheXMgcmVwb3J0ZWQsIGFuZAoKRGl0
dG8uCgo+IHNldHRpbmcgUEhZU0NBUF9kaXJlY3RpbyBoYXMgYmVlbiBtb3ZlZCB0byBjb21tb24g
Y29kZSBzaW5jZSB0aGUgc2FtZQo+IGxvZ2ljIHRvIHNldCBpdCBpcyB1c2VkIGJ5IHg4NiBhbmQg
QVJNLgoKRGl0dG8uCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
