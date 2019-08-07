Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CFF846E3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:10:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvGyd-00073T-Lm; Wed, 07 Aug 2019 08:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abi/=WD=xs4all.nl=hverkuil-cisco@srs-us1.protection.inumbo.net>)
 id 1hvGyc-00073O-Q8
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:07:18 +0000
X-Inumbo-ID: 5e654a40-b8ea-11e9-95ed-9393aa4303b1
Received: from lb3-smtp-cloud9.xs4all.net (unknown [194.109.24.30])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e654a40-b8ea-11e9-95ed-9393aa4303b1;
 Wed, 07 Aug 2019 08:07:16 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:8cc6:9015:1548:23f3]
 ([IPv6:2001:983:e9a7:1:8cc6:9015:1548:23f3])
 by smtp-cloud9.xs4all.net with ESMTPA
 id vGyNhjeHgAffAvGyOh7CoE; Wed, 07 Aug 2019 10:07:15 +0200
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <20190807013340.9706-12-jhubbard@nvidia.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8a02b10a-507b-2eb3-19aa-1cb498c1a4af@xs4all.nl>
Date: Wed, 7 Aug 2019 10:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807013340.9706-12-jhubbard@nvidia.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfLtFI4ThDBFuoSwFqT380PxkcC6q3XCYC9HO7bxya62SPesHUoWCzd0ksBMTGkppOn75d+WBKCLiUJL1JCKKzueS8vA20zMfsb357SuvaUy4TtJTFapt
 x/bWCTcScAJNoSAViYa6NSlEx2FKBMG1ub01wuczTnbJurUSOB+vxv+m9yWKJM94dHdvARuWMkXZdmUldHpi22HuFtGEBhfQsDY52cLv9SRNbWMy30DrEJ0t
 IZpNWziFzZ3evJ7mzLCVhbiK2kiOOXAk37J1rrkYGH2YtOIVmpGPTJw+iPQnS41ERf+BCjbaTp9dtSr4qdKvpCtCTPfnpCYMb9QEG7YIv4Bkl6jCBTx7G7/4
 E+/Gcs1gOswCkbsVZkXHiYav454A3NZryrYeXwugbZcaQXzdLwQKX8vixuVBgbqFmyjLnuKfL1+c17HvE7YGvrxNLgEJHTveu7qGFUgiDp8Kxm2qaSU6Ln+T
 ElUIz8bygLmP/ZaLM0W02XHdcvoF3n3t59CNY87n3tR3oXUf8LBXliPMUlUaTsd4sTe3FnbfHAUNwVeklfrjO7mwx/ZtuvdypniGohclf+1bp5fAUTyCCCrQ
 2HyNedUvC2lDdYTRuhJr04fafwrpC9JLhSLKJeMRBVwa4n0gqjUnzFBrEoDnP692PfkgpqcUzLJ3ou9bn9SXymgnoZ/su+Qto3UpDDWJiMsSJM83gtLeDDPU
 2LAMy4jSsugrfD7VC1dmYwzG8OWIPHuvJ7Tu8XU7oActSpAZS3c9skTdMjLehhV+5MHeC8g3tQLGrW2WL0nM2XSwHbo4mwTDcXTASOqE5niPTgs0jd+PPxdD
 6xGBJo3u/QbyQ3ajYSHTR7/iYO7MKvqve0YwbtTNR57pWM38fmVObjBWJ2Qb5+GQ3v2MdIxvVfz42j69SfAzoN+qm5pqDcKBwXhfBdG1NM3xlepenmsR9xg5
 62RVbClfekDh1mdFfuyj4KBmVBX0v1np3JjJ4vNebVx2IyoyHonzCgI/VeK3Xg6+xvyxhVW0lz7O9WmdlxWKcql5t0Yb5f0zsKtS1NvNqjdoMQPPDLlgqBkJ
 zSwzmxMfYBhUca00uKQBlssFsG5QNKIC7fFgqtDFBmNtn6ipJvZKRC79Cw4QS6qRNMXKSaUQOSPYCvM4KmrZVW9w5s8hot0TfDYbj+oHiuzjCO1jmdtzXAbt
 gWocxcFwf55hNfAhTODtYnIcQTTBxC/fmKLTijSmU3lfUSSSsnl8ef0xn1zUtoXXnyzz6mcZVljhvITEJx0jnOlTUGnl6EnAeCVrfPoD4WCRmPS4tIKMb0Sn
 DjxDBO/HszoKfvVJZYTfTvPxU+6WAyaIoLGRNQX6ew6/T19LTZ7M+CVC1zczygV1hOTQJzIdJnWdrI7AWTB8dFsFHEUTylMp921VegrittBprwtssRQSETDt
 w+WAy7sK++9/GONtwbizNl49IwU+D0GMpL0NbybeY6J7lGNNM2UtsFttBraN5pO3M9SU3xDoE5SqJiulL8VfDzJKyah60WIfPdhLbN00mLGEveLuRT0YQNVO
 Ve41rvqKpgWWp9HPZO7QwGGi4muzZFJs6F8sgGua1ktJvh99nm3LVZHEV++X5Bous3oUMbzF6ihXBdgtubshPp+ElhOLvWLff7DQNQVzst9h3eqqPREvSJlB
 0+CfDkY+tvaCm6YXmIbg/FxzMGySzi98TfrQYNsvylv4MWX8pxKCyY/xfBN6o8zPRNMJNc0PX0kAdkxIJbJSRls4hOcOInlZ
Subject: Re: [Xen-devel] [PATCH v3 11/41] media/v4l2-core/mm: convert
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Hans Verkuil <hans.verkuil@cisco.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDM6MzMgQU0sIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IAo+IEZvciBwYWdlcyB0aGF0IHdl
cmUgcmV0YWluZWQgdmlhIGdldF91c2VyX3BhZ2VzKigpLCByZWxlYXNlIHRob3NlIHBhZ2VzCj4g
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgo+IHJlbGVhc2VfcGFnZXMoKS4KPiAKPiBUaGlzIGlzIHBhcnQgYSB0cmVlLXdp
ZGUgY29udmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKPiAoIm1t
OiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KPiAK
PiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+Cj4gQ2M6IEtl
ZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+IENjOiBIYW5zIFZlcmt1aWwgPGhhbnMu
dmVya3VpbEBjaXNjby5jb20+Cj4gQ2M6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4
LmludGVsLmNvbT4KPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBDYzogUm9iaW4gTXVy
cGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiBDYzogU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CgpBY2tlZC1ieTogSGFucyBWZXJrdWls
IDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Cgo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL3Y0bDIt
Y29yZS92aWRlb2J1Zi1kbWEtc2cuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRl
b2J1Zi1kbWEtc2cuYwo+IGluZGV4IDY2YTZjNmMyMzZhNy4uZDZlZWI0MzdlYzE5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCj4gKysrIGIv
ZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKPiBAQCAtMzQ5LDggKzM0
OSw3IEBAIGludCB2aWRlb2J1Zl9kbWFfZnJlZShzdHJ1Y3QgdmlkZW9idWZfZG1hYnVmICpkbWEp
Cj4gIAlCVUdfT04oZG1hLT5zZ2xlbik7Cj4gIAo+ICAJaWYgKGRtYS0+cGFnZXMpIHsKPiAtCQlm
b3IgKGkgPSAwOyBpIDwgZG1hLT5ucl9wYWdlczsgaSsrKQo+IC0JCQlwdXRfcGFnZShkbWEtPnBh
Z2VzW2ldKTsKPiArCQlwdXRfdXNlcl9wYWdlcyhkbWEtPnBhZ2VzLCBkbWEtPm5yX3BhZ2VzKTsK
PiAgCQlrZnJlZShkbWEtPnBhZ2VzKTsKPiAgCQlkbWEtPnBhZ2VzID0gTlVMTDsKPiAgCX0KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
