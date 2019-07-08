Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712DC6212C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 17:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkVF5-0005vj-32; Mon, 08 Jul 2019 15:07:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qgCs=VF=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hkVF3-0005vd-PK
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 15:07:45 +0000
X-Inumbo-ID: 23576f56-a192-11e9-b845-57bb58c0af58
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23576f56-a192-11e9-b845-57bb58c0af58;
 Mon, 08 Jul 2019 15:07:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F0A3430833C0;
 Mon,  8 Jul 2019 15:07:32 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-3.ams2.redhat.com
 [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4BD55D9E5;
 Mon,  8 Jul 2019 15:07:30 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-18-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d265af64-8bcb-a6e3-bdd9-7e74dbde63ff@redhat.com>
Date: Mon, 8 Jul 2019 17:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-18-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 08 Jul 2019 15:07:37 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 17/35] OvmfPkg/XenPlatformPei: Reinit
 XenHypercallLib
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

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoZSBYZW5QbGF0Zm9y
bVBlaSBuZWVkcyB0byBtYWtlIGh5cGVyY2FsbHMsIGJ1dCB0aGUgWGVuSHlwZXJjYWxsTGliIHdh
cwo+IGluaXRpYWxpc2VkIGJlZm9yZSB0aGUgSHlwZXJQYWdlIHdhcyByZWFkeS4gTm93IHRoYXQg
WGVuUGxhdGZvcm1QZWkgaGFzCj4gaW5pdGlhbGlzZWQgdGhlIEh5cGVyUGFnZSwgcmVpbml0aWFs
aXNlIHRoZSBYZW5IeXBlcmNhbGxMaWIuCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5v
Y29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAg
djM6Cj4gICAgIC0gbmV3IHBhdGNoIHNwbGl0IGZyb20gWGVuSHlwZXJjYWxsTGliOiBFbmFibGUg
aXQgaW4gUEVJTS4KPiAgICAgLSBjaGVjayBmb3IgTGliIGluaXRpYWxpc2F0aW9uIGZhaWx1cmUu
Cj4gCj4gIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5mIHwgMSArCj4g
IE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgICAgICAgICAgICAgIHwgOSArKysrKysrKysK
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5mIGIvT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9YZW5QbGF0Zm9ybVBlaS5pbmYKPiBpbmRleCA0ZDAwMjA2ZDA5Li4wZWY3N2RiOTJj
IDEwMDY0NAo+IC0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5m
Cj4gKysrIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW5QbGF0Zm9ybVBlaS5pbmYKPiBAQCAt
NTksNiArNTksNyBAQCBbTGlicmFyeUNsYXNzZXNdCj4gICAgTXRyckxpYgo+ICAgIE1lbUVuY3J5
cHRTZXZMaWIKPiAgICBQY2RMaWIKPiArICBYZW5IeXBlcmNhbGxMaWIKPiAgCj4gIFtQY2RdCj4g
ICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkT3ZtZlBlaU1lbUZ2QmFzZQo+IGRpZmYg
LS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYwo+IGluZGV4IGM1MjkzNDk4YzQuLjg3N2Q3NzZkZTggMTAwNjQ0Cj4gLS0tIGEv
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvWGVuLmMKPiBAQCAtMjYsNiArMjYsNyBAQAo+ICAjaW5jbHVkZSA8TGlicmFyeS9SZXNvdXJj
ZVB1YmxpY2F0aW9uTGliLmg+Cj4gICNpbmNsdWRlIDxMaWJyYXJ5L010cnJMaWIuaD4KPiAgI2lu
Y2x1ZGUgPEluZHVzdHJ5U3RhbmRhcmQvWGVuL2FyY2gteDg2L2h2bS9zdGFydF9pbmZvLmg+Cj4g
KyNpbmNsdWRlIDxMaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi5oPgo+ICAKPiAgI2luY2x1ZGUgIlBs
YXRmb3JtLmgiCj4gICNpbmNsdWRlICJYZW4uaCIKPiBAQCAtODgsNiArODksNyBAQCBYZW5Db25u
ZWN0ICgKPiAgICBFRklfWEVOX09WTUZfSU5GTyAqSW5mbzsKPiAgICBDSEFSOCBTaWdbc2l6ZW9m
IChJbmZvLT5TaWduYXR1cmUpICsgMV07Cj4gICAgVUlOVDMyICpQVkhSZXNldFZlY3RvckRhdGE7
Cj4gKyAgUkVUVVJOX1NUQVRVUyBTdGF0dXM7Cj4gIAo+ICAgIEFzbUNwdWlkIChYZW5MZWFmICsg
MiwgJlRyYW5zZmVyUGFnZXMsICZUcmFuc2ZlclJlZywgTlVMTCwgTlVMTCk7Cj4gICAgbVhlbklu
Zm8uSHlwZXJQYWdlcyA9IEFsbG9jYXRlUGFnZXMgKFRyYW5zZmVyUGFnZXMpOwo+IEBAIC0xNTIs
NiArMTU0LDEzIEBAIFhlbkNvbm5lY3QgKAo+ICAgICAgc2l6ZW9mKG1YZW5JbmZvKQo+ICAgICAg
KTsKPiAgCj4gKyAgLy8KPiArICAvLyBJbml0aWFsaXplIHRoZSBYZW5IeXBlcmNhbGwgbGlicmFy
eSwgbm93IHRoYXQgdGhlIFhlbkluZm8gSE9CIGlzCj4gKyAgLy8gYXZhaWxhYmxlCj4gKyAgLy8K
PiArICBTdGF0dXMgPSBYZW5IeXBlcmNhbGxMaWJJbml0ICgpOwo+ICsgIEFTU0VSVF9SRVRVUk5f
RVJST1IgKFN0YXR1cyk7Cj4gKwo+ICAgIHJldHVybiBFRklfU1VDQ0VTUzsKPiAgfQo+ICAKPiAK
ClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
