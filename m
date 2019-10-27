Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE95E6109
	for <lists+xen-devel@lfdr.de>; Sun, 27 Oct 2019 06:48:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iObLY-0003lv-4V; Sun, 27 Oct 2019 05:44:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NQK8=YU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iObLW-0003lq-Sq
 for xen-devel@lists.xenproject.org; Sun, 27 Oct 2019 05:44:10 +0000
X-Inumbo-ID: c9319744-f87c-11e9-94e0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9319744-f87c-11e9-94e0-12813bfff9fa;
 Sun, 27 Oct 2019 05:44:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 31E77AC1C;
 Sun, 27 Oct 2019 05:44:04 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
References: <osstest-143172-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <170f4e07-33fe-35a2-fc58-c6bc073dd3ca@suse.com>
Date: Sun, 27 Oct 2019 06:44:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <osstest-143172-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 143172: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTAuMTkgMDA6MjYsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBmbGlnaHQg
MTQzMTcyIHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhl
bnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDMxNzIvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4g
Cj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVk
aW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gICB0ZXN0LXh0Zi1hbWQ2NC1hbWQ2
NC00ICAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDI3
NTAKCldoYXQgd2FzIHdyb25nIGhlcmU/Cgo+ICAgdGVzdC1hcm02NC1hcm02NC1leGFtaW5lICAg
IDExIGV4YW1pbmUtc2VyaWFsL2Jvb3Rsb2FkZXIgZmFpbCBSRUdSLiB2cy4gMTQyNzUwCgpBbmQg
aGVyZT8KCj4gICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LXN0dWJkb20tZGViaWFuaHZtLWFt
ZDY0LXhzbSAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTQyNzUwCj4gICB0
ZXN0LWFtZDY0LWkzODYteGwtcWVtdXQtc3R1YmRvbS1kZWJpYW5odm0tYW1kNjQteHNtIDEwIGRl
Ymlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxNDI3NTAKCklhbiwgZGlkIHlvdSBtaXNz
IHN0dWJkb20gaW4geW91ciBwYXRjaGVzPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
