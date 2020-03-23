Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76A18F072
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 08:53:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGHqI-0001jt-6h; Mon, 23 Mar 2020 07:49:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGHqG-0001jo-ET
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 07:49:48 +0000
X-Inumbo-ID: dda5ff12-6cda-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dda5ff12-6cda-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 07:49:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB401AC11;
 Mon, 23 Mar 2020 07:49:45 +0000 (UTC)
To: Yan Yankovskyi <yyankovskyi@gmail.com>
References: <20200323053503.GA1406@kbp1-lhp-F74019>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b5c165b-aee3-7dde-f9f1-3a3de2e357a7@suse.com>
Date: Mon, 23 Mar 2020 08:49:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323053503.GA1406@kbp1-lhp-F74019>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] evtchn: Change evtchn port type to
 evtchn_port_t
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDMuMjAyMCAwNjozNSwgWWFuIFlhbmtvdnNreWkgd3JvdGU6Cj4gc3RydWN0IGV2dGNo
bl9zZXRfcHJpb3JpdHkgdXNlcyB1aW50MzJfdCB0eXBlIGZvciBldmVudCBjaGFubmVsIHBvcnQu
Cj4gUmVwbGFjZSB0aGUgdHlwZSB3aXRoIGV2dGNobl9wb3J0X3QuIFN1Y2ggY2hhbmdlIGlzIGFs
c28gZG9uZSBpbiBMaW51eC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW4gWWFua292c2t5aSA8eXlh
bmtvdnNreWlAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkFzIGEgZ2VuZXJhbCByZW1hcmssIHRoZSBvcmRlciBvZiBjaGFuZ2VzIHdvdWxk
IGJldHRlciBiZSB0aGUgb3RoZXIgd2F5CmFyb3VuZDogVGhlIGNhbm9uaWNhbCBoZWFkZXIgaW4g
dGhlIFhlbiByZXBvIGJlIGFkanVzdGVkIGZpcnN0LCBhbmQgdGhlCmNoYW5nZSB0aGVuIHByb3Bh
Z2F0ZWQgdG8gcmVwb3MgY2FycnlpbmcgY2xvbmVzLgoKVGhhbmtzLCBKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
