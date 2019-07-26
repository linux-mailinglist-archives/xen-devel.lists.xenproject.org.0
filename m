Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48589773E5
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2019 00:16:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr8TK-0006TQ-JN; Fri, 26 Jul 2019 22:13:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hr8TI-0006TL-U0
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 22:13:52 +0000
X-Inumbo-ID: a5763ddc-aff2-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5763ddc-aff2-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 22:13:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF350AE34;
 Fri, 26 Jul 2019 22:13:49 +0000 (UTC)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 27 Jul 2019 00:13:49 +0200
Message-ID: <156417922934.29470.16776755402986910394.stgit@Palanthas>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools: ipxe: update for fixing build with GCC9
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
Cc: Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QnVpbGRpbmcgd2l0aCBHQ0M5IChvbiBvcGVuU1VTRSBUdWJtbGV3ZWVkKSBnZW5lcmF0ZXMgYSBs
b3Qgb2YgZXJyb3JzIG9mCnRoZSAidGFraW5nIGFkZHJlc3Mgb2YgcGFja2VkIG1lbWJlciBvZiAu
Li4gbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQKcG9pbnRlciB2YWx1ZSIga2luZC4KClVwZGF0
aW5nIHRvIHVwc3RyZWFtIGNvbW1pdCAxZGQ1NmRiZDExMDgyICgiW2J1aWxkXSBXb3JrYXJvdW5k
IGNvbXBpbGF0aW9uCmVycm9yIHdpdGggZ2NjIDkuMSIpIHNlZW1zIHRvIGZpeCB0aGUgcHJvYmxl
bS4KCkZvciBtb3JlIGluZm8sIHNlZToKCmh0dHBzOi8vZ2l0LmlweGUub3JnL2lweGUuZ2l0L2Nv
bW1pdC8xZGQ1NmRiZDExMDgyZmI2MjJjMmVkMjFjZmFjZWQ0ZjQ3ZDc5OGE2CgpTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgotLS0KQ2M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Ci0tLQpIZXksIFdlaSwKCkkgaGF2ZSBuZXZlciBwbGF5ZWQgbXVjaCB3aXRo
IGlweGUsIHNvIEkgY2FuJ3QgYmUgMTAwJSBzdXJlIHRoYXQgdGhpcyBpcwp0aGUgYmVzdCBpZGVh
LCBhbmQgd2hhdCBjb3VsZCBiZSB0aGUgcHJvYmxlbXMuCgpJIGp1c3QgdGhvdWdodCBJJ2xsIG1l
bnRpb24gdGhlIGlzc3VlIHRvIHlvdSwgaW4gdGhlIGZvcm0gb2YgYSBwYXRjaCwgaW4KYW4gYXR0
ZW1wdCB0byBoZWxwIGFzIG11Y2ggYXMgcG9zc2libGUuCgpSZWdhcmRzCi0tLQogdG9vbHMvZmly
bXdhcmUvZXRoZXJib290L01ha2VmaWxlIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvZXRo
ZXJib290L01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUvZXRoZXJib290L01ha2VmaWxlCmluZGV4
IGZkOGRmZGY1YTcuLjBkZTMwNTk5YmYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL2V0aGVy
Ym9vdC9NYWtlZmlsZQorKysgYi90b29scy9maXJtd2FyZS9ldGhlcmJvb3QvTWFrZWZpbGUKQEAg
LTEwLDcgKzEwLDcgQEAgZWxzZQogSVBYRV9HSVRfVVJMID89IGdpdDovL2dpdC5pcHhlLm9yZy9p
cHhlLmdpdAogZW5kaWYKIAotSVBYRV9HSVRfVEFHIDo9IGQyMDYzYjc2OTNlMGUzNWRiOTdiMjI2
NGFhOTg3ZWI2MzQxYWU3NzkKK0lQWEVfR0lUX1RBRyA6PSAxZGQ1NmRiZDExMDgyZmI2MjJjMmVk
MjFjZmFjZWQ0ZjQ3ZDc5OGE2CiAKIElQWEVfVEFSQkFMTF9VUkwgPz0gJChYRU5fRVhURklMRVNf
VVJMKS9pcHhlLWdpdC0kKElQWEVfR0lUX1RBRykudGFyLmd6CiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
