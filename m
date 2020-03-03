Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1F177C30
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 17:44:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9AbS-0003sJ-Rn; Tue, 03 Mar 2020 16:41:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9AbR-0003s9-Jd
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:41:05 +0000
X-Inumbo-ID: c35a83ac-5d6d-11ea-94a0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c35a83ac-5d6d-11ea-94a0-bc764e2007e4;
 Tue, 03 Mar 2020 16:41:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED8C1B17A;
 Tue,  3 Mar 2020 16:40:58 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <996335c7-e652-3729-02ce-1ce07eaf5c62@suse.com>
Date: Tue, 3 Mar 2020 17:40:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226124705.29212-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/12] xen: allow only sizeof(bool)
 variables for boolean_param()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzo0NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBTdXBwb3J0IG9mIG90
aGVyIHZhcmlhYmxlIHNpemVzIHRoYW4gdGhhdCBvZiBub3JtYWwgYm9vbCBvbmVzIGZvcgo+IGJv
b2xlYW5fcGFyYW1ldGVyKCkgZG9uJ3QgbWFrZSBzZW5zZSwgc28gY2F0Y2ggYW55IG90aGVyIHNp
emVkCj4gdmFyaWFibGVzIGF0IGJ1aWxkIHRpbWUuCgpOaXQ6IGJvb2xlYW5fcGFyYW0oKQoKPiBA
QCAtNDYsNyArNDgsOCBAQCBleHRlcm4gY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSBfX3BhcmFt
X3N0YXJ0W10sIF9fcGFyYW1fZW5kW107Cj4gICAgICBfX2twYXJhbSBfX3NldHVwXyMjX3ZhciA9
IFwKPiAgICAgICAgICB7IC5uYW1lID0gX19zZXR1cF9zdHJfIyNfdmFyLCBcCj4gICAgICAgICAg
ICAudHlwZSA9IE9QVF9CT09MLCBcCj4gLSAgICAgICAgICAubGVuID0gc2l6ZW9mKF92YXIpLCBc
Cj4gKyAgICAgICAgICAubGVuID0gc2l6ZW9mKF92YXIpICsgXAo+ICsgICAgICAgICAgICAgICAg
IEJVSUxEX0JVR19PTl9aRVJPKHNpemVvZihfdmFyKSAhPSBzaXplb2YoYm9vbCkpLCBcCgpJIHdh
cyBmaXJzdCBnb2luZyB0byBzdWdnZXN0IHRvIHNlZSBhYm91dCB0aWdodGVuaW5nIHRoaXMgdG8K
ZG8gYW4gYWN0dWFsIHR5cGUgY2hlY2ssIGJ1dCBJIHRoaW5rIHdlIGhhdmUgYSBudW1iZXIgb2YK
Y2FzZXMgd2hlcmUgYm9vbGVhbl9wYXJhbSgpIGFjdHVhbGx5IGludm9sdmVzIGludDhfdCB2YXJp
YWJsZXMsCnRvIGFsbG93IHVzIHRvIGRldGVjdCB3aGV0aGVyIGEgY29tbWFuZCBsaW5lIG9wdGlv
biB3YXMgdXNlZC4KSGVuY2UKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
