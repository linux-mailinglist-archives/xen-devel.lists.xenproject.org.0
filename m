Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDEF8AED7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 07:34:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxPPN-00022z-Ox; Tue, 13 Aug 2019 05:31:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FNwZ=WJ=i2se.com=stefan.wahren@srs-us1.protection.inumbo.net>)
 id 1hxPHx-0001GD-OO
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 05:24:05 +0000
X-Inumbo-ID: 901a41b4-bd8a-11e9-8980-bc764e045a96
Received: from mout.kundenserver.de (unknown [217.72.192.73])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 901a41b4-bd8a-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 05:24:04 +0000 (UTC)
Received: from [192.168.178.60] ([109.104.47.130]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPGiR-1hevT50O45-00PbYR; Tue, 13 Aug 2019 07:23:46 +0200
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
 <20190804224915.28669-16-jhubbard@nvidia.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <f92a9b35-072c-a452-3248-ded047a9ee7e@i2se.com>
Date: Tue, 13 Aug 2019 07:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190804224915.28669-16-jhubbard@nvidia.com>
Content-Language: en-US
X-Provags-ID: V03:K1:WLtnGHSdIdsSOgSCw9gLWN/He07a3vhG8P/jw9q/ZsKCLbsJUeS
 5llVNlt7KE/tvHn+5EOmDYYv4pX1cHVWKOXHtrw4HQWAHuCkTohFsgxlEY0fExapDm8vR8t
 zVIsUr/Bms6Kvxj5sCY8IbKiNL01LBum+j6x95pPZHXG9iG9KDUI7QIiVK2/58tc3NB1jnX
 y7VHJG/KIA+fGCfAbINIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e2tiG/LoUCE=:MfCllk8c06iYHLUWJWcKAL
 cdQ1fi1ypP4tC6pu8XAt4M+fU5mGlkjM5ziFPw9nAP5+ICbjFLhxsiDLATVpll3xwUgna69cS
 Ev9bpFgmBYRqbHsiOVM335kNgAU19xY/LXN/GzEuigzotpDhc5IdC4FGsNTdqmIYi0Bx4dgCw
 bLM/SrMXG40Mg1UArtxdqWQvHnINj7yK6JacwPswBAo33CV5S5U4U1PS67DpEMKA7dX0oduGb
 5fQtkN1kvCZEg2/ekJnnb+PAR6KRS8Eu0zqK7cwQwWxs+nxHFNvcdfFolT7waPuKj24rhpnjW
 ZntPcErm15w8EJ72vFuARtCUk4Lh4jU+zYNtoDE6B8RJqr/+yxycmwEDucEbNXrujkaPH72RU
 fWCHjlXjsJS29DRMlBs91cqiKMaK/ktbzSpegz+iLEJq/HkDuPh/jiz/b8w2crkMXTYEXfcIb
 WqkuI5hHrAdEh99xa/X99FupD8F6iZ52Pv/g2glNHL9WlKL41btCn/KodqBqy/glIqHZeYzq2
 SXjRol/t4oy36qgSCQmUGiCt1lssYLkBWOzcxjui5lZUL2V9O7wn91tHl7G+DbqjQzgMyVtBP
 60iHHkwkWe3su3M3o+o4m8sWd9OG5XIToU/4cSDhBQohrRIKKqoUbXAyCJH96bxaYdq/zseIf
 oMsHaN/31pBaLs6MtsAa2tu5PRj9qlBX5kso+Y5up4mj5gl7CfIWyGwpM4gPWtVKv1En5k3ZR
 HR/0MJ6spaP8P86u5+VALfxj2aM5bbcj+ZVczoVE2BIVl4lPQEesVoHHwFc=
X-Mailman-Approved-At: Tue, 13 Aug 2019 05:31:44 +0000
Subject: Re: [Xen-devel] [PATCH v2 15/34] staging/vc04_services: convert
 put_page() to put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Suniel Mahesh <sunil.m@techveda.org>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Mihaela Muraru <mihaela.muraru21@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Kishore KP <kishore.p@techveda.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMTkgMDA6NDgsIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+Cj4gRm9yIHBhZ2VzIHRoYXQgd2Vy
ZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMKPiB2
aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRpbmVzLCBpbnN0ZWFkIG9mIHZpYSBwdXRf
cGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+Cj4gVGhpcyBpcyBwYXJ0IGEgdHJlZS13aWRl
IGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMxZDhlN2NjYTJkCj4gKCJtbTog
aW50cm9kdWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCj4KPiBB
Y2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4K
Pgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBTdGVmYW4gV2FocmVu
IDxzdGVmYW4ud2FocmVuQGkyc2UuY29tPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBNaWhhZWxhIE11cmFydSA8bWloYWVsYS5tdXJh
cnUyMUBnbWFpbC5jb20+Cj4gQ2M6IFN1bmllbCBNYWhlc2ggPHN1bmlsLm1AdGVjaHZlZGEub3Jn
Pgo+IENjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KPiBDYzogU2lkb25nIFlh
bmcgPHJlYWx3YWtrYUBnbWFpbC5jb20+Cj4gQ2M6IEtpc2hvcmUgS1AgPGtpc2hvcmUucEB0ZWNo
dmVkYS5vcmc+Cj4gQ2M6IGxpbnV4LXJwaS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogZGV2ZWxAZHJpdmVy
ZGV2Lm9zdW9zbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+CkFja2VkLWJ5OiBTdGVmYW4gV2FocmVuIDxzdGVmYW4ud2FocmVuQGkyc2UuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
