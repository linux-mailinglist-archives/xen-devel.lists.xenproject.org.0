Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C226113D723
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:43:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1dQ-00085b-Un; Thu, 16 Jan 2020 09:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is1dP-00085L-9B
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:40:15 +0000
X-Inumbo-ID: 2fcb570e-3844-11ea-86da-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fcb570e-3844-11ea-86da-12813bfff9fa;
 Thu, 16 Jan 2020 09:40:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97CF5B1A3;
 Thu, 16 Jan 2020 09:40:09 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8104de4-1323-fa8f-5f8a-de73a9ce63e0@suse.com>
Date: Thu, 16 Jan 2020 10:40:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200116093602.4203-5-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
 Andrew Cooper <andrew.cooper3@citrix.com>, jandryuk@gmail.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxMDozNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy94ZW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+IEBAIC02
MTQsNiArNjE0LDkgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUobW11ZXh0X29wX3QpOwo+ICAv
KiBJZGxlIGRvbWFpbi4gKi8KPiAgI2RlZmluZSBET01JRF9JRExFICAgICAgICAgICB4ZW5fbWtf
dWludCgweDdGRkYpCj4gIAo+ICsvKiBNYXNrIGZvciB2YWxpZCBkb21haW4gaWQgdmFsdWVzICov
Cj4gKyNkZWZpbmUgRE9NSURfTUFTSyAgICAgICAgICAgMHg3RkZGCgpTZWVpbmcgaXQgdXNlZCBp
biBjb250ZXh0LCBhbnkgcmVhc29uIG5vdCB0byB1c2UgeGVuX21rX3VpbnQoKQpoZXJlIGFzIHdl
bGw/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
