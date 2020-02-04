Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29CA15161D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 07:47:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyrwx-00038P-OR; Tue, 04 Feb 2020 06:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4ZTP=3Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iyrww-00038J-FG
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 06:44:42 +0000
X-Inumbo-ID: d1f8866c-4719-11ea-8eda-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1f8866c-4719-11ea-8eda-12813bfff9fa;
 Tue, 04 Feb 2020 06:44:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B542EAD00;
 Tue,  4 Feb 2020 06:44:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-8-jgross@suse.com>
 <4e4bbfae-d65e-eb0a-0497-998657391760@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <700a5840-131b-4d4e-1c6a-87b5c60196ee@suse.com>
Date: Tue, 4 Feb 2020 07:44:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <4e4bbfae-d65e-eb0a-0497-998657391760@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/9] xen: provide version information in
 hypfs
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAgMTg6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAxLjIwMjAgMDk6
NDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFByb3ZpZGUgdmVyc2lvbiBhbmQgY29tcGlsZSBp
bmZvcm1hdGlvbiBpbiAvYnVpbGRpbmZvLyBub2RlIG9mIHRoZQo+PiBYZW4gaHlwZXJ2aXNvciBm
aWxlIHN5c3RlbS4gQXMgdGhpcyBpbmZvcm1hdGlvbiBpcyBhY2Nlc3NpYmxlIGJ5IGRvbTAKPj4g
b25seSBubyBhZGRpdGlvbmFsIHNlY3VyaXR5IHByb2JsZW0gYXJpc2VzLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIG9uIHN1Z2dlc3Rpb246Cj4g
Cj4+IEBAIC0zNzMsNiArMzc0LDUwIEBAIHZvaWQgX19pbml0IGRvX2luaXRjYWxscyh2b2lkKQo+
PiAgICAgICAgICAgKCpjYWxsKSgpOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB1bnNpZ25lZCBp
bnQgbWFqb3JfdmVyc2lvbjsKPj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgbWlub3JfdmVyc2lvbjsK
Pj4gKwo+PiArc3RhdGljIEhZUEZTX0RJUl9JTklUKGJ1aWxkaW5mbywgImJ1aWxkaW5mbyIpOwo+
PiArc3RhdGljIEhZUEZTX0RJUl9JTklUKGNvbXBpbGVpbmZvLCAiY29tcGlsZWluZm8iKTsKPj4g
K3N0YXRpYyBIWVBGU19ESVJfSU5JVCh2ZXJzaW9uLCAidmVyc2lvbiIpOwo+PiArc3RhdGljIEhZ
UEZTX1VJTlRfSU5JVChtYWpvciwgIm1ham9yIiwgbWFqb3JfdmVyc2lvbik7Cj4+ICtzdGF0aWMg
SFlQRlNfVUlOVF9JTklUKG1pbm9yLCAibWlub3IiLCBtaW5vcl92ZXJzaW9uKTsKPj4gK3N0YXRp
YyBIWVBGU19TVFJJTkdfSU5JVChjaGFuZ2VzZXQsICJjaGFuZ2VzZXQiKTsKPj4gK3N0YXRpYyBI
WVBGU19TVFJJTkdfSU5JVChjb21waWxlciwgImNvbXBpbGVyIik7Cj4+ICtzdGF0aWMgSFlQRlNf
U1RSSU5HX0lOSVQoY29tcGlsZV9ieSwgImNvbXBpbGVfYnkiKTsKPj4gK3N0YXRpYyBIWVBGU19T
VFJJTkdfSU5JVChjb21waWxlX2RhdGUsICJjb21waWxlX2RhdGUiKTsKPj4gK3N0YXRpYyBIWVBG
U19TVFJJTkdfSU5JVChjb21waWxlX2RvbWFpbiwgImNvbXBpbGVfZG9tYWluIik7Cj4+ICtzdGF0
aWMgSFlQRlNfU1RSSU5HX0lOSVQoZXh0cmEsICJleHRyYSIpOwo+IAo+IFBsZWFzZSBjb25zaWRl
ciBtYWtpbmcgYWxsIG9mIHRoZSBhYm92ZSBfX3JlYWRfbW9zdGx5LgoKT2theS4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
