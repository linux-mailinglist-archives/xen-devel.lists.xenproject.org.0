Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3BB2BF3
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 17:42:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9A7L-0001Fb-12; Sat, 14 Sep 2019 15:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mwje=XJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1i9A7K-0001FW-2z
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 15:37:42 +0000
X-Inumbo-ID: 96435586-d705-11e9-978d-bc764e2007e4
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96435586-d705-11e9-978d-bc764e2007e4;
 Sat, 14 Sep 2019 15:37:40 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7DE6922CB;
 Sat, 14 Sep 2019 11:37:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 14 Sep 2019 11:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=c2o5lK
 vdmnmAMmY0vU0WTM9pkb2OfizLctsWtk+XLHY=; b=Ju7RwnY8vnbepuNMki9cKp
 kbNn6i8NEA40IhZpVm9VyUuPlcIjzTVxxWAZn3TIoROSGu4t/QOXb++F/apQVI2W
 q9YKIfcffiyAqaHw2cCIjy4j4wv7iUF2y3P3z+kdtehP0y5gJvHOrydscGxza0hL
 H0LAdUdUZFY+0GbU9FBvjMTqqwPzk1bxfKkz5R3BI8kcMfW+wZY0uKByNjmig314
 yAusaA5s9duXY3yjsOt1o7EVJjcw7kLk57dcILgvQTZ5rIQt1KK6Shj7ove2gICf
 HBnwWVFLZ+CU55AUJNpK64fPWqtHJ22jHiAjxdreXl4k/RmpqprdGnilvbMaBAcw
 ==
X-ME-Sender: <xms:Qgl9XZdt7BJKKHdKO3QvcvBdQDRBsXS1bJTbR6w4fLHdExi4d6qdmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdelgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddqiedmnecujfgurhephffvufffkffogggtgfesthekredtredtjeen
 ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffho
 mhgrihhnpehquhgsvghsqdhoshdrohhrghenucfkphepledurdeihedrfeegrdeffeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhh
 ihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Qgl9XQKtUHYILoDE5n2oLzNml0N8TW_T7DQSglXxSVE-8MvgtIpyQw>
 <xmx:Qgl9XeG92ms-vHkOMmruEfUtRDH-LT-egpjBFbANfl8mxfGelvOv7g>
 <xmx:Qgl9XTBAmJOjoppHfWVp2WcVK7cJkpudnfvFmGS3ZrYn5UXu3PczoA>
 <xmx:RAl9XQMIbgO4UmIUQp-SXHzQpDtRCOPbwr1LLCQi5z4PFtmfUfVB2g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id E274ED60057;
 Sat, 14 Sep 2019 11:37:36 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 17:37:15 +0200
Message-Id: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 0/6] Fix PCI passthrough for HVM with
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

SW4gdGhpcyB2ZXJzaW9uLCBJIGFkZCBQSFlTREVWT1BfaW50ZXJydXB0X2NvbnRyb2wgdG8gYWxs
b3cgc3R1YmRvbWFpbgplbmFibGluZyBNU0kgYWZ0ZXIgbWFwcGluZyBpdCwgYW5kIGFsc28gZGlz
YWJsaW5nIElOVHggYmVmb3JlaGFuZC4gQWN0dWFsCmh5cGVyY2FsbCByZWZ1c2UgdG8gZW5hYmxl
IGJvdGggb2YgdGhlbS4KClJlbGF0ZWQgYXJ0aWNsZToKaHR0cHM6Ly93d3cucXViZXMtb3Mub3Jn
L25ld3MvMjAxNy8xMC8xOC9tc2ktc3VwcG9ydC8KCkNoYW5nZXMgaW4gdjI6CiAtIG5ldyAieGVu
L3g4NjogQWxsb3cgc3R1YmRvbSBhY2Nlc3MgdG8gaXJxIGNyZWF0ZWQgZm9yIG1zaSIgcGF0Y2gK
IC0gYXBwbGllZCByZXZpZXcgY29tbWVudHMgZnJvbSB2MQpDaGFuZ2VzIGlzIHYzOgogLSBhcHBs
eSBzdWdnZXN0aW9ucyBieSBSb2dlcgogLSBhZGQgUEhZU0RFVk9QX21zaV9tc2l4X3NldF9lbmFi
bGUKQ2hhbmdlcyBpbiB2NDoKIC0gaW1wbGVtZW50IHN1Z2dlc3Rpb25zIGJ5IFdlaSwgUm9nZXIs
IEphbgogLSBwbHVnIG5ldyBwaHlzZGV2b3AgaW50byBYU00KQ2hhbmdlcyBpbiB2NToKIC0gcmVi
YXNlIG9uIG1hc3RlcgogLSByZW5hbWUgdG8gUEhZU0RFVk9QX21zaV9jb250cm9sCiAtIG1vdmUg
Z3JhbnRpbmcgYWNjZXNzIHRvIElSUSBpbnRvIGNyZWF0ZV9pcnEKQ2hhbmdlcyBpbiB2NjoKIC0g
c2ltcGxpZnkgZ3JhbnRpbmcgSVJRIGFjY2VzcywgcmVjb3JkIGRtIGRvbWlkIGZvciBjbGVhbnVw
CiAtIHJlbmFtZSB0byBQSFlTREVWT1BfaW50ZXJydXB0X2NvbnRyb2wKIC0gaW5jbHVkZSBJTlR4
IGNvbnRyb2wgaW4gdGhlIGh5cGVyY2FsbAoKLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVz
enV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpD
YzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiAiUm9nZXIg
UGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3VyYXZlZSBTdXRoaWt1bHBh
bml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KQ2M6IEJyaWFuIFdvb2RzIDxicmlh
bi53b29kc0BhbWQuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CkNj
OiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KCk1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSAoNik6CiAgbGlieGw6IGRvIG5vdCBhdHRhY2ggeGVuLXBjaWJhY2sgdG8g
SFZNIGRvbWFpbiwgaWYgc3R1YmRvbWFpbiBpcyBpbiB1c2UKICBsaWJ4bDogYXR0YWNoIFBDSSBk
ZXZpY2UgdG8gcWVtdSBvbmx5IGFmdGVyIHNldHRpbmcgcGNpYmFjay9wY2lmcm9udAogIGxpYnhs
OiBkb24ndCB0cnkgdG8gbWFuaXB1bGF0ZSBqc29uIGNvbmZpZyBmb3Igc3R1YmRvbWFpbgogIHhl
bi94ODY6IEFsbG93IHN0dWJkb20gYWNjZXNzIHRvIGlycSBjcmVhdGVkIGZvciBtc2kuCiAgeGVu
L3g4NjogYWRkIFBIWVNERVZPUF9pbnRlcnJ1cHRfY29udHJvbAogIHRvb2xzL2xpYnhjOiBhZGQg
d3JhcHBlciBmb3IgUEhZU0RFVk9QX2ludGVycnVwdF9jb250cm9sCgogdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5jdHJsLmggICAgICAgICAgICB8ICA2ICsrLQogdG9vbHMvbGlieGMveGNfcGh5c2Rl
di5jICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3BjaS5j
ICAgICAgICAgICAgICAgICAgfCA2MyArKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB4ZW4vYXJj
aC94ODYvaHBldC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0KIHhlbi9hcmNoL3g4Ni9p
cnEuYyAgICAgICAgICAgICAgICAgICAgICAgfCA1MSArKysrKysrKysrKysrKy0tLS0tLQogeGVu
L2FyY2gveDg2L21zaS5jICAgICAgICAgICAgICAgICAgICAgICB8IDQ1ICsrKysrKysrKysrKysr
KysrKy0KIHhlbi9hcmNoL3g4Ni9waHlzZGV2LmMgICAgICAgICAgICAgICAgICAgfCA1MyArKysr
KysrKysrKysrKysrKysrKystCiB4ZW4vYXJjaC94ODYveDg2XzY0L3BoeXNkZXYuYyAgICAgICAg
ICAgIHwgIDQgKystCiB4ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyAgICAgICAgICAgICAgIHwg
IDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgfCAgMiArLQog
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICAgICB8ICAzICstCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2lycS5oICAgICAgICAgICAgICAgIHwgIDcgKystCiB4ZW4vaW5jbHVkZS9h
c20teDg2L21zaS5oICAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9w
aHlzZGV2LmggICAgICAgICAgICAgfCAyMyArKysrKysrKystCiB4ZW4vaW5jbHVkZS94bGF0Lmxz
dCAgICAgICAgICAgICAgICAgICAgIHwgIDEgKy0KIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oICAg
ICAgICAgICAgICAgICAgfCAgNyArKystCiB4ZW4vaW5jbHVkZS94c20veHNtLmggICAgICAgICAg
ICAgICAgICAgIHwgIDYgKystCiB4ZW4veHNtL2R1bW15LmMgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKy0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgICAgICAgfCAy
NCArKysrKysrKysrLQogeGVuL3hzbS9mbGFzay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgICAgICB8
ICAxICstCiAyMCBmaWxlcyBjaGFuZ2VkLCAyODEgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25z
KC0pCgpiYXNlLWNvbW1pdDogNmM5NjM5YTcyZjBjYTNhOTQzMGVmNzVmMzc1ODc3MTgyMjgxZmRl
ZgotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
