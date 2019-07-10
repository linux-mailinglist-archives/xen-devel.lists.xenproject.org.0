Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3CC64490
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 11:44:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl97C-00063G-TU; Wed, 10 Jul 2019 09:42:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iApL=VH=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hl97B-00063B-M4
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 09:42:17 +0000
X-Inumbo-ID: 01031246-a2f7-11e9-9420-eb71330dab67
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01031246-a2f7-11e9-9420-eb71330dab67;
 Wed, 10 Jul 2019 09:42:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A722830C1CD6;
 Wed, 10 Jul 2019 09:42:16 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-153.ams2.redhat.com
 [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 236F22B593;
 Wed, 10 Jul 2019 09:42:14 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-15-anthony.perard@citrix.com>
 <d883648e-b134-dfe2-926b-28c79ad52963@redhat.com>
Message-ID: <8fc58d46-3621-8ac7-e7e1-74cdc290f0f6@redhat.com>
Date: Wed, 10 Jul 2019 11:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d883648e-b134-dfe2-926b-28c79ad52963@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 10 Jul 2019 09:42:16 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 14/35] OvmfPkg/AcpiPlatformDxe: Use
 XenPlatformLib
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMTkgMTY6MzgsIExhc3psbyBFcnNlayB3cm90ZToKPiBPbiAwNy8wNC8xOSAxNjo0
MiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggcmVwbGFjZSB0aGUgWGVuRGV0
ZWN0ZWQoKSBmdW5jdGlvbiBieSB0aGUgb25lIGluCj4+IFhlblBsYXRmb3JtTGliLgo+Pgo+PiBS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQo+
PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KPj4gLS0tCj4+Cj4+IE5vdGVzOgo+PiAgICAgdjM6Cj4+ICAgICAtIG5ldyBwYXRjaCwgc3Bs
aXRlZCBmcm9tIHRoZSBuZXh0IHBhdGNoCj4+ICAgICAgICh3aGljaCB3YXMgT3ZtZlBrZy9BY3Bp
UGxhdGZvcm1EeGU6IFVzZSBQVkggUlNEUCBpZiBleGlzdCkKPiAKPiBSZXZpZXdlZC1ieTogTGFz
emxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAKClNvcnJ5LCBJIG1pc3NlZCBhIGNsZWFu
dXAgb3B0aW9uOiBwbGVhc2UgcmVtb3ZlICJnRWZpWGVuSW5mb0d1aWQiIGZyb20KW0d1aWRzXSBp
biAiQWNwaVBsYXRmb3JtRHhlLmluZiIuCgooWW91IGNhbiBwaWNrIHVwIHRoZSBSLWIgd2l0aCB0
aGF0LikKClRoYW5rcwpMYXN6bG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
