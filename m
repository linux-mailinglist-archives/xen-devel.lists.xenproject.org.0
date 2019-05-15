Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC741FA25
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 20:42:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQynp-0003zb-HF; Wed, 15 May 2019 18:38:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ruaT=TP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hQynn-0003zU-AC
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 18:38:55 +0000
X-Inumbo-ID: b054a8be-7740-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b054a8be-7740-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 18:38:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 794F3AD72;
 Wed, 15 May 2019 18:38:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Wed, 15 May 2019 20:38:50 +0200
Message-Id: <20190515183850.26413-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fixes and features for 5.2-rc1
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjJiLXJjMS10YWcKCnhlbjogZml4ZXMgYW5kIGZlYXR1cmVzIGZvciA1LjItcmMxCgpJdCBjb250
YWluczoKLSBzb21lIG1pbm9yIGNsZWFudXBzCi0gMiBzbWFsbCBjb3JyZWN0aW9ucyBmb3IgWGVu
IG9uIEFSTQotIDIgZml4ZXMgZm9yIFhlbiBQVkggZ3Vlc3Qgc3VwcG9ydAotIGEgcGF0Y2ggZm9y
IGEgbmV3IGNvbW1hbmQgbGluZSBvcHRpb24gdG8gdHVuZSB2aXJ0dWFsIHRpbWVyIGhhbmRsaW5n
CgpUaGFua3MuCgpKdWVyZ2VuCgogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFy
YW1ldGVycy50eHQgfCAgNyArKysrKysrCiBhcmNoL2FybS94ZW4vcDJtLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA0ICsrKy0KIGFyY2gveDg2L3BsYXRmb3JtL3B2aC9lbmxpZ2h0
ZW4uYyAgICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KIGFyY2gveDg2L3hlbi9lZmkuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiBhcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2LmMgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2aC5jICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKy0KIGFyY2gveDg2
L3hlbi90aW1lLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysr
KysrKystLS0KIGFyY2gveDg2L3hlbi94ZW4tb3BzLmggICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDQgKystLQogZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMgICAgICAgICAgICAg
ICAgfCAgMiArLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19kZXZfZnJvbnRlbmQuYyAgICAg
ICAgfCAgMiAtLQogMTAgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pCgpHdXN0YXZvIEEuIFIuIFNpbHZhICgxKToKICAgICAgeGVuLW5ldGZyb250OiBtYXJr
IGV4cGVjdGVkIHN3aXRjaCBmYWxsLXRocm91Z2gKCkhhcmlwcmFzYWQgS2VsYW0gKDEpOgogICAg
ICB4ZW46IHhlbi1wY2liYWNrOiBmaXggd2FybmluZyBVc2luZyBwbGFpbiBpbnRlZ2VyIGFzIE5V
TEwgcG9pbnRlcgoKSGlsbGYgRGFudG9uICgyKToKICAgICAgeGVuL2FybTogRnJlZSBwMm0gZW50
cnkgaWYgZmFpbCB0byBhZGQgaXQgdG8gUkIgdHJlZQogICAgICB4ZW4vYXJtOiBVc2UgcDJtIGVu
dHJ5IHdpdGggbG9jayBwcm90ZWN0aW9uCgpNYW8gV2VuYW4gKDEpOgogICAgICB4ZW5idXM6IGRy
b3AgdXNlbGVzcyBMSVNUX0hFQUQgaW4geGVuYnVzX3dyaXRlX3dhdGNoKCkgYW5kIHhlbmJ1c19m
aWxlX3dyaXRlKCkKClJvZ2VyIFBhdSBNb25uZSAoMik6CiAgICAgIHhlbi9wdmg6IHNldCB4ZW5f
ZG9tYWluX3R5cGUgdG8gSFZNIGluIHhlbl9wdmhfaW5pdAogICAgICB4ZW4vcHZoOiBjb3JyZWN0
bHkgc2V0dXAgdGhlIFBWIEVGSSBpbnRlcmZhY2UgZm9yIGRvbTAKClJ5YW4gVGhpYm9kZWF1eCAo
MSk6CiAgICAgIHg4Ni94ZW46IEFkZCAieGVuX3RpbWVyX3Nsb3AiIGNvbW1hbmQgbGluZSBvcHRp
b24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
