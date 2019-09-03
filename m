Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08908A6B59
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i59hY-0008Oc-62; Tue, 03 Sep 2019 14:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i59hW-0008OX-Sm
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:22:30 +0000
X-Inumbo-ID: 42e3e28c-ce56-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42e3e28c-ce56-11e9-a337-bc764e2007e4;
 Tue, 03 Sep 2019 14:22:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2407AB666;
 Tue,  3 Sep 2019 14:22:29 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d62618fe-176b-740c-bf18-e042dada4ef7@suse.com>
Date: Tue, 3 Sep 2019 16:22:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829101846.21369-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/5] xen: print lock profile info in
 panic()
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMjoxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBWMjoKPiAtIHJlbmFt
ZSBDT05GSUdfTE9DS19QUk9GSUxFIHRvIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUgKEphbiBC
ZXVsaWNoKQo+IC0gbW92ZSAubG9ja3Byb2ZpbGUuZGF0YSBzZWN0aW9uIHRvIGluaXQgYXJlYSBp
biBsaW5rZXIgc2NyaXB0cwoKSG93IGNhbiB0aGlzIGJlIGNvcnJlY3QsIHdoZW4geW91IGRvbid0
IGNoYW5nZSBsb2NrX3Byb2ZfaW5pdCgpIGF0CmFsbD8gVGhlIGZ1bmN0aW9uIGJ1aWxkcyBhIGxp
bmtlZCBsaXN0IGZyb20gdGhlIGVudHJpZXMgaW4gdGhlCnNlY3Rpb24sIGFuZCB0aGVuIGhhbmRz
IHRoZSBoZWFkIG9mIHRoaXMgbGlzdCB0bwpfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgp
LiBJIGd1ZXNzIEkgbXVzdCBiZSBtaXNzaW5nCnNvbWV0aGluZy4gQW55d2F5LCBldmVyeXRoaW5n
IGVsc2UgaGVyZSBsb29rcyBnb29kIHRvIG1lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
