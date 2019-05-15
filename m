Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C23D1EBDA
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 12:11:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqpm-00043P-QE; Wed, 15 May 2019 10:08:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P7lW=TP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hQqpl-00043K-4P
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:08:25 +0000
X-Inumbo-ID: 5ce2b802-76f9-11e9-8662-e3ffa09cfe5f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ce2b802-76f9-11e9-8662-e3ffa09cfe5f;
 Wed, 15 May 2019 10:08:19 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: g6MtfcwpLP36bqU9BOQx+6ogk5SRCAQ+6xfx6W/moal0Lvl1L2j55QnBw329cK2+r6z5jFbNCU
 s/8P5/CL3TvpGh1+SIm10yohT2UdUpK0fK2ARefilQLISLcvTehcz0t2myU0MznNHE5dnG8Mtg
 Fpvp8eMb+fk7/NOWXKsP3qIUZiWVtkEsVa9VQVKDStvoNYG4L3IuPd1WIwCf1zLqZRfWydk8ah
 7AGvgpdC9OnH3NKJ9fo16KKrqTbPLCBF8sQ8xSqAFrAcSRj32ZX51db+cS1iRe6JD7fXjwdCHU
 yh8=
X-SBRS: 2.7
X-MesageID: 456675
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="456675"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 15 May 2019 11:07:23 +0100
Message-ID: <20190515100723.8269-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] cr-daily-branch: seabios: "usually" use
 xen-tested-master
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBicmFuY2ggaXMgc3VwcG9zZWQgdG8gYmUgc3VpdGFibGUgZm9yIGFsbCB2ZXJzaW9ucyBv
ZiBYZW4uCkNvbnZlcnNlbHksIG9sZGVyIHZlcnNpb25zIG9mIHNlYWJpb3MgZG8gbm90IGJ1aWxk
IG9uIG5ld2VyCmNvbXBpbGVycyAoYXMgcHJvdmlkZWQsIGVnLCBpbiBzdHJldGNoKS4KClNvLCBm
b3IgImJyYW5jaGVzIiBvdGhlciB0aGFuIHhlbi11bnN0YWJsZSBhbmQgeGVuLXVuc3RhYmxlLXNt
b2tlLCB1c2UKdGhlIHVzdWFsICJkZXRlcm1pbmVfdmVyc2lvbiIgbWFjaGluZXJ5LCB3aGljaCB3
aWxsIHNlbGVjdAp4ZW4tdGVzdGVkLW1hc3RlciBmb3IgYnJhbmNoZXMgb3RoZXIgdGhhbiB0aGUg
b3ZtZiBicmFuY2ggaXRzZWxmLgoKTm8gY2hhbmdlIGZvciB0aGUgc2VhYmlvcyAiYnJhbmNoIiwg
bm9yIGZvciB4ZW4tdW5zdGFibGUqLiAgVGhlIGVmZmVjdAppcyB0byBzd2l0Y2ggeGVuLSotdGVz
dGluZywgcWVtdS0qLCBsaW51eC0qLCBldGMuLCB0byBhbGwgdXNlIG92bWYKeGVuLXRlc3RlZC1t
YXN0ZXIuCgpUaGlzIGNvbW1pdCBpcyBpZGVudGljYWwgdG8gdGhlIGNvcnJlc3BvbmRpbmcgb25l
IHJlbGF0aW5nIHRvIG92bWYsCiAgYzlkMWU1ODk2ZmUyMjQ2ZDE3ZDQzNmYwNWE5OTYwYTY2ZWE1
NTQyNgogIGNyLWRhaWx5LWJyYW5jaDogb3ZtZjogInVzdWFsbHkiIHVzZSB4ZW4tdGVzdGVkLW1h
c3RlcgptdXRhbmRpcyBtdXRhbmRpLiAgVmVyaWZpZWQgd2l0aAogIGRpZmYgLXUgPChnaXQtc2hv
dyBjOWQxZTU4OTZmZTIyNDZkMTdkNDM2ZjA1YTk5NjBhNjZlYTU1NDI2KSA8KGdpdC1kaWZmIHwg
c2VkICdzL1NFQUJJT1MvT1ZNRi9nOyBzL3NlYWJpb3Mvb3ZtZi9nJykgfGxlc3MKCkEgY3Vyc29y
eSBleGFtaW5hdGlvbiBvZiB0aGUgc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52
YXJzCm91dHB1dCByZXZlYWxlZCB3aGF0IHNlZW1lZCB0byBiZSB0aGUgZXhwZWN0ZWQgY2hhbmdl
cyBhbmQgbm90aGluZwp1bnRvd2FyZC4KCkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgpDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIGNyLWRh
aWx5LWJyYW5jaCB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NyLWRhaWx5LWJyYW5jaCBiL2NyLWRh
aWx5LWJyYW5jaAppbmRleCAwMGI3MTNiMy4uODJlMjBjNzkgMTAwNzU1Ci0tLSBhL2NyLWRhaWx5
LWJyYW5jaAorKysgYi9jci1kYWlseS1icmFuY2gKQEAgLTE5NCwxNCArMTk0LDE3IEBAIGlmIFsg
IngkUkVWSVNJT05fTElOVVhfQVJNIiA9IHggXTsgdGhlbgogICAgIGZpCiBmaQogaWYgWyAieCRS
RVZJU0lPTl9TRUFCSU9TIiA9IHggXTsgdGhlbgotICAgIGlmIFsgIngkdHJlZSIgPSAieHNlYWJp
b3MiIF07IHRoZW4KKyAgICBjYXNlICIkYnJhbmNoIiBpbgorICAgIHhlbi11bnN0YWJsZSopCisJ
OiBSRVZJU0lPTl9TRUFCSU9TIGZyb20gQ29uZmlnLm1rCisJOzsKKyAgICAqKQogCVRSRUVfU0VB
QklPUz0kVFJFRV9TRUFCSU9TX1VQU1RSRUFNCiAJZXhwb3J0IFRSRUVfU0VBQklPUwogCWRldGVy
bWluZV92ZXJzaW9uIFJFVklTSU9OX1NFQUJJT1Mgc2VhYmlvcyBTRUFCSU9TCiAJZXhwb3J0IFJF
VklTSU9OX1NFQUJJT1MKLSAgICBlbHNlCi0JOiBSRVZJU0lPTl9TRUFCSU9TIGZyb20gQ29uZmln
Lm1rCi0gICAgZmkKKwk7OworICAgIGVzYWMKIGZpCiBpZiBbICJ4JFJFVklTSU9OX09WTUYiID0g
eCBdOyB0aGVuCiAgICAgY2FzZSAiJGJyYW5jaCIgaW4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
