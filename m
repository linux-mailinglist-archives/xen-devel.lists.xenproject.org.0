Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BCCD87A7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 06:56:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKbJy-0006rW-BT; Wed, 16 Oct 2019 04:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QYkk=YJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iKbJw-0006rO-Sw
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 04:54:00 +0000
X-Inumbo-ID: f6c076ee-efd0-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6c076ee-efd0-11e9-beca-bc764e2007e4;
 Wed, 16 Oct 2019 04:53:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE669AF19;
 Wed, 16 Oct 2019 04:53:57 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190815172944.14163-1-julien.grall@arm.com>
 <062d7e11-1933-37ab-5f04-555c9c36d04f@arm.com>
 <f6d2664a-3869-fd1e-5557-f1e0522f0596@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bd38023b-37b6-c81e-bfad-7c7fdd5a8ae9@suse.com>
Date: Wed, 16 Oct 2019 06:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f6d2664a-3869-fd1e-5557-f1e0522f0596@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: domain_build: Print the correct
 domain in dtb_load()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTAuMTkgMTg6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IEdlbnRsZSBwaW5nLgo+IAo+IENoZWVycywKPiAKPiBPbiAxMC8xMC8xOSAzOjQzIFBNLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBIbW0sIGl0IGxvb2tzIGxpa2UgSSBmb3Jnb3Qg
dGhpcyBwYXRjaCBiZWZvcmUgdGhlIGZyZWV6ZS4gSnVlcmdlbiwgYXJlIAo+PiB5b3UgaGFwcHkg
d2l0aCB0aGlzIHRvIGdvIGluIFhlbiA0LjEzPwo+Pgo+PiBDaGVlcnMsCj4+Cj4+IE9uIDE1LzA4
LzIwMTkgMTg6MjksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IGR0Yl9sb2FkKCkgY2FuIGJlIGNh
bGxlZCBieSBvdGhlciBkb21haW4gdGhhbiBkb20wLiBUbyBhdm9pZCBjb25mdXNpb24KPj4+IGlu
IHRoZSBsb2csIHByaW50IHRoZSBjb3JyZWN0IGRvbWFpbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
