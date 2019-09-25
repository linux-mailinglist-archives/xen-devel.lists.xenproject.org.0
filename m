Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63D2BD678
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 04:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCxFQ-0000tu-00; Wed, 25 Sep 2019 02:41:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CquU=XU=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iCxFO-0000tB-EZ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 02:41:42 +0000
X-Inumbo-ID: fdc76676-df3d-11e9-9627-12813bfff9fa
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by localhost (Halon) with ESMTPS
 id fdc76676-df3d-11e9-9627-12813bfff9fa;
 Wed, 25 Sep 2019 02:41:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 54A9C1848;
 Tue, 24 Sep 2019 22:41:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 24 Sep 2019 22:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8c3cgX
 np9pEkM87qDlFw8DJo0tRH1/A/RmuWMYML0uo=; b=1MsZ+uTB9FYbbeo/jpzcFO
 8bWTNzVFpKAYeev+Z8sRM/mIHtKZgr3OluoN0PIQZ3wActarS2QHLzU9EqUYPUXz
 NLUCYQzZPISlyukGEPlEUhAC5uowvfkgb9uDsttkD9gyqMNsgSpkv1nhU31G+B4B
 C3djt4hh/1DYRkBvA7eKIiJSYjbpg+kTxayOMEIONUpue5mUY3TYpxt69a5kdfBh
 WIu3kPS5dkXaqH3dxqVGCHHiENJJffPSUqSVLcQeBiLMnME3idKoSivbwNiZN6pw
 ykYaQhOX2xNDoTgpL/iO4SbqN5bT+hxNwPyxpnlVRC3C9NbC0UtnJE3qMHImKZyA
 ==
X-ME-Sender: <xms:3dOKXR85Kyhl5EBdNq4GO89kGgFncsdGgWc5vFStp18rnouP_IliCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddqiedmnecujfgurhephffvufffkffogggtgfesthekredtredtjeen
 ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffho
 mhgrihhnpehmshhirdhtohholhhsnecukfhppeeluddrieehrdefgedrfeefnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
 shhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:3dOKXa5zzap6KUI-AtF3zGvhodnkuaXCLj_fJu3zxWweXaTtJzOK-A>
 <xmx:3dOKXSYdO_ev5wzyO7FU5tT4W9rjR0EEyFJgl6G5F5zHRtx66Mbfxg>
 <xmx:3dOKXU_MgdHTVX7epvhjMFTxq4u3x6o4jtFXP4-dZDb_3ms1tJ2EuA>
 <xmx:39OKXaB01XAwSOV6wJoywGfRHsc0SozNapfqdWqKyDNiHmx3u-boDw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93DC2D6005A;
 Tue, 24 Sep 2019 22:41:31 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 04:41:22 +0200
Message-Id: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 0/4] Fix PCI passthrough for HVM with
 stubdomain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdGhpcyB2ZXJzaW9uLCBJIGRyb3AgUEhZU0RFVk9QX2ludGVycnVwdF9jb250cm9sIHBhdGNo
LCBzaW5jZSBKYW4gcHJlZmVyIG5vdAp0byBtaXggcGNpaWYgYW5kIGh5cGVyY2FsbHMgZm9yIHNl
cnZpbmcgZGV2aWNlIG1vZGVsLiBFbmFibGluZyBNU0kgYnkgdGhlCnN0dWJkb21haW4gcmVtYWlu
cyB1bnNvbHZlZCBoZXJlLCBidXQgb3RoZXIgcGF0Y2hlcyBhcmUgaW1wcm92ZW1lbnQgYW55d2F5
LgoKQ2hhbmdlcyBpbiB2MjoKIC0gbmV3ICJ4ZW4veDg2OiBBbGxvdyBzdHViZG9tIGFjY2VzcyB0
byBpcnEgY3JlYXRlZCBmb3IgbXNpIiBwYXRjaAogLSBhcHBsaWVkIHJldmlldyBjb21tZW50cyBm
cm9tIHYxCkNoYW5nZXMgaXMgdjM6CiAtIGFwcGx5IHN1Z2dlc3Rpb25zIGJ5IFJvZ2VyCiAtIGFk
ZCBQSFlTREVWT1BfbXNpX21zaXhfc2V0X2VuYWJsZQpDaGFuZ2VzIGluIHY0OgogLSBpbXBsZW1l
bnQgc3VnZ2VzdGlvbnMgYnkgV2VpLCBSb2dlciwgSmFuCiAtIHBsdWcgbmV3IHBoeXNkZXZvcCBp
bnRvIFhTTQpDaGFuZ2VzIGluIHY1OgogLSByZWJhc2Ugb24gbWFzdGVyCiAtIHJlbmFtZSB0byBQ
SFlTREVWT1BfbXNpX2NvbnRyb2wKIC0gbW92ZSBncmFudGluZyBhY2Nlc3MgdG8gSVJRIGludG8g
Y3JlYXRlX2lycQpDaGFuZ2VzIGluIHY2OgogLSBzaW1wbGlmeSBncmFudGluZyBJUlEgYWNjZXNz
LCByZWNvcmQgZG0gZG9taWQgZm9yIGNsZWFudXAKIC0gcmVuYW1lIHRvIFBIWVNERVZPUF9pbnRl
cnJ1cHRfY29udHJvbAogLSBpbmNsdWRlIElOVHggY29udHJvbCBpbiB0aGUgaHlwZXJjYWxsCkNo
YW5nZXMgaW4gdjc6CiAtIHVwZGF0ZSAieGVuL3g4NjogQWxsb3cgc3R1YmRvbSBhY2Nlc3MgdG8g
aXJxIGNyZWF0ZWQgZm9yIG1zaSIKIC0gZHJvcCAieGVuL3g4NjogYWRkIFBIWVNERVZPUF9pbnRl
cnJ1cHRfY29udHJvbCIKIC0gZHJvcCAidG9vbHMvbGlieGM6IGFkZCB3cmFwcGVyIGZvciBQSFlT
REVWT1BfaW50ZXJydXB0X2NvbnRyb2wiCgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNj
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6ICJSb2dlciBQ
YXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBTdXJhdmVlIFN1dGhpa3VscGFu
aXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpDYzogQnJpYW4gV29vZHMgPGJyaWFu
Lndvb2RzQGFtZC5jb20+CkNjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ2M6
IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgoKTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpICg0KToKICBsaWJ4bDogZG8gbm90IGF0dGFjaCB4ZW4tcGNpYmFjayB0byBI
Vk0gZG9tYWluLCBpZiBzdHViZG9tYWluIGlzIGluIHVzZQogIGxpYnhsOiBhdHRhY2ggUENJIGRl
dmljZSB0byBxZW11IG9ubHkgYWZ0ZXIgc2V0dGluZyBwY2liYWNrL3BjaWZyb250CiAgbGlieGw6
IGRvbid0IHRyeSB0byBtYW5pcHVsYXRlIGpzb24gY29uZmlnIGZvciBzdHViZG9tYWluCiAgeGVu
L3g4NjogQWxsb3cgc3R1YmRvbSBhY2Nlc3MgdG8gaXJxIGNyZWF0ZWQgZm9yIG1zaS4KCiB0b29s
cy9saWJ4bC9saWJ4bF9wY2kuYyAgICAgICAgICAgICAgICAgIHwgNjMgKysrKysrKysrKysrKysr
KystLS0tLS0tLQogeGVuL2FyY2gveDg2L2hwZXQuYyAgICAgICAgICAgICAgICAgICAgICB8ICAz
ICstCiB4ZW4vYXJjaC94ODYvaXJxLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNDIgKysrKysr
KysrKystLS0tLS0KIHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jICAgICAgICAgICAgICAgfCAg
MiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyB8ICAyICstCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgICAgIHwgIDMgKy0KIHhlbi9pbmNs
dWRlL2FzbS14ODYvaXJxLmggICAgICAgICAgICAgICAgfCAgNyArKy0KIDcgZmlsZXMgY2hhbmdl
ZCwgODQgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogNmM5NjM5
YTcyZjBjYTNhOTQzMGVmNzVmMzc1ODc3MTgyMjgxZmRlZgotLSAKZ2l0LXNlcmllcyAwLjkuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
