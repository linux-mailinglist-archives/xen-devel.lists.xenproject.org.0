Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A428EE1
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 03:40:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTz8q-0008Oy-Tn; Fri, 24 May 2019 01:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZTx3=TY=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hTz8o-0008Ot-SU
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 01:37:02 +0000
X-Inumbo-ID: 6ad2d894-7dc4-11e9-8e95-0b30b468877f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ad2d894-7dc4-11e9-8e95-0b30b468877f;
 Fri, 24 May 2019 01:36:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hTz8c-0006S7-DV; Fri, 24 May 2019 01:36:50 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1hTz8c-0006pF-4y; Fri, 24 May 2019 01:36:50 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 23 May 2019 19:36:24 -0600
Message-Id: <04e56f911ff972acb4a0135da043f65b714a44ee.1558661458.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH v2] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, committers@xenproject.org,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9sbG93aW5nIHRoZSByZWNlbnQgZGlzY3Vzc2lvbiwgd2UgaGFkIG9uIElSQyBhbmQgdGhlIGFj
dGlvbiBJIGhhZCBpbiAKdGhlIE1hcmNoIGNvbW11bml0eSBjYWxsLCB0aGlzIGZpbGUgcHJvdmlk
ZXMgYSBmaWxlIGZvcm1hdCB0aGF0IAplbmFibGVzIHdyaXRpbmcgYW4gYXV0b21hdGVkIHRlc3Qg
dG8gY2hlY2sgd2hldGhlciBmaWxlcyBhcmUgb3V0IG9mIHN5bmMuIAoKT25jZSB0aGUgZmlsZSBm
b3JtYXQgaXMgYWdyZWUsIEkgd2lsbCB3cml0ZSBhIHRlc3Qgb3Igc2NyaXB0LgoKSSBhbHNvIG5l
ZWQgc29tZSBtb3JlIGNvcnJlY3QgdGVzdCBkYXRhLCBha2EgZW50cmllcyBpbiB0aGUgZmlsZSBm
cm9tCmNvbW1pdHRlcnMgbG9va2luZyBhZnRlciB0aGUgZm9sbG93aW5nIGZpbGVzCltKYW5dCnhl
bi9hcmNoL3g4Ni9jcHUvbXdhaXQtaWRsZS5jIApbU3RlZmFubywgSnVsaWVuIC0gdGhpcyBoYXMg
dG8gYmUgZmluYWxpemVkXQp4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCnhlbi9h
cmNoL2FybS92Z2ljLyoKeGVuL2luY2x1ZGUvYXNtLWFybS9kaXY2NC5oCnhlbi9kcml2ZXJzL2No
YXIvbWVzb24tdWFydC5jCnhlbi9hcmNoL2FybS9hcm0zMi9saWIvKgp4ZW4vYXJjaC9hcm0vYXJt
NjQvbGliLyoKeGVuL2FyY2gvYXJtL2FybTY0L2NhY2hlLlMKeGVuL2FyY2gvYXJtL2FybTY0L2Jw
aS5TCnhlbi9pbmNsdWRlL2FzbS1hcm0vc3lzdGVtLmgKeGVuL2FyY2gvYXJtL2FybTY0L2luc24u
YwpbT3RoZXJzP10KeGVuL2NvbW1vbi9yYnRyZWUuYwoKTm90ZSB0aGF0IGluIHNvbWUgY2FzZXMg
TGludXggaGFzIGRpdmVyZ2VkIGFuZCBzb21lIExpbnV4IGZpbGVzIGhhdmUgZGlzYXBwZWFyZWQu
IApKdWxpZW4gYWxzbyByYWlzZWQgdGhlIHBvaW50LCB0aGF0IGluIHNvbWUgY2FzZXMgb25seSBh
IHN1YnNldCBvZiBjb2RlIGZyb20gTGludXggWGVuIGZpbGVzIHdhcyBhcHBsaWVkIG9yIHRoYXQg
b25seSBzb21lIGZ1bmN0aW9ucyBnZXQgbW92ZWQgYWNyb3NzIHRvIFhlbi4KCkkgYmVsaWV2ZSB0
aGF0IGlzIGVudGlyZWx5IE9LLiBUaGUgd29ya2Zsb3cgd291bGQgYmUgaW4gbW9zdCBjYXNlcyB0
aGF0OgotIFdlIHVzZSBhIExpbnV4IChzb3VyY2UpIGNvbW1pdCBhcyBhIGJlbmNobWFyayBhbmQg
cmVjb3JkIHRoZSBjb21taXQgSUQKLSBJZiB0aGVyZSBpcyBhIGNoYW5nZSBpbiBMaW51eCB0aGUg
dGVzdCB3aWxsIGZhaWwKLSBUaGUgY29tbWl0dGVyIGxvb2tzIGF0IHRoZSBkaWZmIGFuZCBlaXRo
ZXIKICAtIERlY2lkZXMgdG8gaWdub3JlIGl0IGFuZCBidW1wcyB0aGUgY29tbWl0IElEIGluIHRo
aXMgZmlsZQogIC0gRGVjaWRlcyB0aGUgY2hhbmdlIGlzIG5lZWRlZCwgaW50ZWdyYXRlcyBpdCBp
bnRvIFhlbiBhbmQgdGhlbiAKICAgIGJ1bXBzIHRoZSBjb21taXQgSUQgaW4gdGhpcyBmaWxlCgpD
aGFuZ2VzIHNpbmNlIHYxCiogUmVxdWlyZSBhIGNvbG9uIGFmdGVyIHJlcG86LCBmaWxlOiwgLi4u
IGtleXdvcmRzCiogUmVwbGFjZSBtYW51YWw6fGF1dG86IHdpdGggZmlsZTogYXMgdGhlcmUgYXV0
bzogdXNlLWNhc2Ugd2FzIGludmFsaWQKKiBBZGRlZCBtb3JlIHZlcmJvc2UgZGVzY3JpcHRpb24g
b2YgZm9ybWF0CgpTaWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5j
b20+CkNDOiBjb21taXR0ZXJzQHhlbnByb2plY3Qub3JnCgotLS0KIFRSQUNLSU5HLkZJTEVTIHwg
NTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgVFJBQ0tJ
TkcuRklMRVMKCmRpZmYgLS1naXQgYS9UUkFDS0lORy5GSUxFUyBiL1RSQUNLSU5HLkZJTEVTCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjNhZmI0NjhlZDcKLS0tIC9kZXYv
bnVsbAorKysgYi9UUkFDS0lORy5GSUxFUwpAQCAtMCwwICsxLDUwIEBACisjIFRoaXMgZmlsZSBj
b250YWlucyBpbmZvcm1hdGlvbiBhYm91dCBzb3VyY2UgZmlsZXMgdGhhdCBoYXZlIGJlZW4KKyMg
Y29waWVkIGZyb20gb3RoZXIgc291cmNlcyBhbmQgbmVlZCB0byBiZSB0cmFja2VkCisjCisjIFRo
ZSBmaWxlIG1heSBjb250YWluIGxpbmVzIHN0YXJ0aW5nIHdpdGggLi4uCisjIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIHZlcnNpb246IG9mIGZpbGUgZm9y
bWF0CisjIHJlcG86IHJlcG9zaXRvcnkgZGVmaW5pdGlvbgorIyBmaWxlOiBhIG1hcHBpbmcgdG8g
dHJhY2sgZmlsZXMKKyMKKyMgTm90ZSB0aGF0IHJlcG86IGVudHJpZXMgbXVzdCBjb21lICpiZWZv
cmUqIGZpbGU6IGVudHJpZXMKKyMKKyMgUmVwb3NpdG9yeSBEZWZpbml0aW9ucyBhcmUgb2YgdGhl
IGZvbGxvd2luZyBmb3JtYXQKKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgcmVwbzogbmFtZS1vZi1zb3VyY2UtcmVwbyBnaXR8c3ZuIGh0dHBz
LXVybC1vZi1zb3VyY2UtcmVwbworIworIyBuYW1lLW9mLXNvdXJjZS1yZXBvOgorIyAgIE5hbWUg
b2Ygc291cmNlIHJlcG9zaXRvcnkuIFRoZSBuYW1lIHdpbGwgYmUgdXNlZCBhcyByZWZlcmVuY2Ug
aW4gZmlsZToKKyMgICBzdGF0ZW1lbnRzCisjCisjIGdpdHxzdm46CisjICAgVHlwZSBvZnNvdXJj
ZSByZXBvc2l0b3J5CisjCisjIGh0dHBzLXVybC1vZi1zb3VyY2UtcmVwbzoKKyMgICBVUkwgb2Yg
c291cmNlIHJlcG9zaXRvcnkKKyMKKyMgRm9yIGV4YW1wbGU6CisjICAgcmVwbzogbGludXgtdG9y
dmFsZHMgZ2l0IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdAorIworIyBNYXBwaW5ncyB0byB0cmFjayBmaWxlcyBhcmUgb2Yg
dGhlIGZvbGxvd2luZyBmb3JtYXQKKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjIGZpbGU6IHhlbi1maWxlIG5hbWUtb2Ytb3JpZ2luYWwtcmVw
byBvcmlnaW5hbC1maWxlIGNvbW1pdC1pZAorIworIyB4ZW4tZmlsZToKKyMgICBYZW4gZmlsZSB0
aGF0IG5lZWRzIHRvIGJlIHRyYWNrZWQKKyMKKyMgbmFtZS1vZi1vcmlnaW5hbC1yZXBvOgorIyAg
IEEgcmVmZXJlbmNlIHRvIGEgc291cmNlIHJlcG9zaXRvcnkgZGVmaW5lZCBieSAqcmVwbyoga2V5
d29yZAorIworIyBvcmlnaW5hbC1maWxlOgorIyAgIEZpbGUgaW4gb3JpZ2luYWwtcmVwbyBmcm9t
IHdoaWNoIHdlIHJlZ3VsYXJseSB3YW50IHRvIG1lcmdlIGNoYW5nZXMKKyMgICBpbnRvIHhlbi1m
aWxlCisjCisjIGNvbW1pdCBpZDoKKyMgICBMYXN0IGNvbW1pdCBpZCBvZiBvcmlnaW5hbC1maWxl
IHRoYXQgd2FzIGRlZW1lZCB0byBiZSBvaworIyAgIGFuZCBlaXRoZXIgaW1wb3J0ZWQgaW50byB0
aGUgdHJlZSBvciByZWplY3RlZAorIworIyBGb3IgZXhhbXBsZToKKyMgICBmaWxlOiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGxpbnV4LXRvcnZhbGRzIGxpbnV4L2RyaXZlcnMv
aW9tbXUvYXJtLXNtbXUuYyBiNzdjZjExZjA5NDEzNgorCit2ZXJzaW9uOiAxCi0tIAoyLjEzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
