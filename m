Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7ED10734
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:50:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnG-0005YE-GY; Wed, 01 May 2019 10:48:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnE-0005WT-GA
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:52 +0000
X-Inumbo-ID: b2ea397e-6bfe-11e9-bf70-4f86bc047861
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2ea397e-6bfe-11e9-bf70-4f86bc047861;
 Wed, 01 May 2019 10:48:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837302"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:31 +0100
Message-ID: <20190501104839.21621-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 07/15] arch replumbing: Replace many
 $r{arch} with $[g]ho->{Arch}
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2Ugd2l0aCBleGlzdGluZyBmbGlnaHRzLiAgQnV0IHRoZSBlZmZl
Y3QgaXMgdGhhdApub3csIGdlbmVyYWxseSwgdHMtKiBzY3JpcHRzIGFuZCB0aGUgc3VwcG9ydCBj
b2RlIHdpbGwgaG9ub3VyCmhvc3RfYXJjaCwgaWYgaXQgaXMgc2V0LCBpbiBwcmVmZXJlbmNlIHRv
IGFyY2guCgpUaGlzIHBhdGNoIGNvbnRhaW5zIG9ubHkgcmVwbGFjZW1lbnRzIG9mICRye2FyY2h9
IHdpdGggJGhvLT57QXJjaH0gb3IKJGdoby0+e0FyY2h9LiAgSW4gZmFjdCwgcGVyaGFwcyBzdXJw
cmlzaW5nbHksIHRoZXJlIHdlcmUgbm8gbG9jYXRpb25zCndoZXJlICRnaG8gd2FzIHdhbnRlZCBy
YXRoZXIgdGhhbiAkaG8gKEkgaGF2ZSBkb3VibGUgY2hlY2tlZCB0aGlzKS4KCkV4Y2VwdGlvbnMs
IHdoZXJlIHdlIGxlZnQgJHJ7YXJjaH0gYWxvbmUsIGFyZToKCiAqIG1ha2UtZmxpZ2h0OiBhIGNv
bW1lbnQsIHdoaWNoIHdlIGFyZSBhYm91dCB0byBkZWFsIHdpdGg7CgogKiB0cy1rZXJuZWwtYnVp
bGQ6IHdlIGFyZSBnb2luZyB0byBzdXBwb3J0IGNyb3NzIGJ1aWxkaW5nIGFuZAogICAgJHJ7YXJj
aH0gaXMgZ29pbmcgdG8gYmUgdGhlIGFyY2hpdGVjdHVyZSBvZiB0aGUga2VybmVsIHdlIHdhbnQK
ICAgIHJhdGhlciB0aGFuIG9mIHRoZSBidWlsZCBob3N0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0g
ICAgICB8IDE0ICsrKysrKystLS0tLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgIDQgKyst
LQogdHMtZnJlZWJzZC1idWlsZCAgICAgICB8ICAyICstCiB0cy1ob3N0LWluc3RhbGwgICAgICAg
IHwgIDYgKysrLS0tCiB0cy1tZW1kaXNrLXRyeS1hcHBlbmQgIHwgIDIgKy0KIHRzLXhlbi1idWls
ZC1wcmVwICAgICAgfCAgNCArKy0tCiB0cy14ZW4taW5zdGFsbCAgICAgICAgIHwgIDggKysrKy0t
LS0KIDcgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRleCA4
YWJkNmFlZC4uOTExZDg5MDUgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvRGViaWFuLnBtCisrKyBiL09z
c3Rlc3QvRGViaWFuLnBtCkBAIC00NDQsNyArNDQ0LDcgQEAgc3ViIHNldHVwYm9vdF9ncnViMiAo
JCQkJCkgewogICAgICMgR3J1YjIgb24gamVzc2llL3N0cmV0Y2ggQVJNKiBkb2Vzbid0IGRvIG11
bHRpYm9vdCwgc28gd2UgbXVzdCBjaGFpbmxvYWQuCiAgICAgbXkgJG5lZWRfdWVmaV9jaGFpbmxv
YWQgPQogICAgICAgICBnZXRfaG9zdF9wcm9wZXJ0eSgkaG8sICJmaXJtd2FyZSIsICIiKSBlcSAi
dWVmaSIgJiYKLSAgICAgICAgJGhvLT57U3VpdGV9ID1+IG0vamVzc2llfHN0cmV0Y2gvICYmICRy
e2FyY2h9ID1+IG0vXmFybS87CisgICAgICAgICRoby0+e1N1aXRlfSA9fiBtL2plc3NpZXxzdHJl
dGNoLyAmJiAkaG8tPntBcmNofSA9fiBtL15hcm0vOwogCiAgICAgbXkgJHBhcnNlbWVudT0gc3Vi
IHsKICAgICAgICAgbXkgJGY9IGJsX2dldG1lbnVfb3BlbigkaG8sICRybWVudSwgIiRzdGFzaC8k
aG8tPntOYW1lfS0tZ3J1Yi5jZmcuMSIpOwpAQCAtNzQ5LDcgKzc0OSw3IEBAIEVORAogc3ViIHBy
ZXNlZWRfbWljcm9jb2RlKCQkKQogewogICAgIG15ICgkaG8sJHNmeCkgPSBAXzsKLSAgICBteSAk
cHJvcCA9ICJNaWNyb2NvZGVVcGRhdGUiLnVjZmlyc3QoJHJ7YXJjaH0pOworICAgIG15ICRwcm9w
ID0gIk1pY3JvY29kZVVwZGF0ZSIudWNmaXJzdCgkaG8tPntBcmNofSk7CiAgICAgcmV0dXJuIHVu
bGVzcyAkY3skcHJvcH07CiAgICAgbG9nbSgidWNvZGU9JHByb3AgJGN7JHByb3B9Iik7CiAgICAg
bXkgJHVjb2RlID0gZ2V0X2ZpbGVjb250ZW50cygiJGN7SW1hZ2VzfS8kY3skcHJvcH0iKTsKQEAg
LTExMzQsNyArMTEzNCw3IEBAIHN1YiBkaV9pbnN0YWxsZXJfcGF0aCAoJCkgewogICAgICMgdXNl
YWJsZSBmb3IgY29uc3RydWN0aW5nIGhvc3QgcGF0aHMgYXMgd2VsbCBhcyBndWVzdCBwYXRocwog
ICAgIG15ICgkaG8pID0gQF87CiAKLSAgICByZXR1cm4gJGhvLT57VGZ0cH17RGlCYXNlfS4nLycu
JHJ7YXJjaH0uJy8nLgorICAgIHJldHVybiAkaG8tPntUZnRwfXtEaUJhc2V9LicvJy4kaG8tPntB
cmNofS4nLycuCiAJKCRoby0+e0RpVmVyc2lvbn0gLy8gY2ZnX3RmdHBfZGlfdmVyc2lvbigkaG8t
PntTdWl0ZX0pKQogCS4nLScuJGhvLT57U3VpdGV9OwogfQpAQCAtMTM0MCw4ICsxMzQwLDggQEAg
RU5ECiAgICAgIyAgICBVc2VybGFuZF9zZXRhcmNoICBwZXJzb25hbGl0eSB0byByZXN0b3JlIHVz
aW5nIHNldGFyY2gKICAgICBteSAka2Vybl9hcmNoID0gJGtlcm5fYXJjaF9pbmZvLT57S2VybmVs
X0RlYmlhbn07CiAgICAgaWYgKCRrZXJuX2FyY2ggJiYKLQkkaG8tPntGbGFnc317ImFyY2gtJHJ7
YXJjaH0ifSAmJiAhJGhvLT57RmxhZ3N9eyJhcmNoLSRrZXJuX2FyY2gifSkgewotCSMgV2UgY2hl
Y2sgdGhlIGZsYWcgZm9yICRye2FyY2h9IGJlY2F1c2UgZm9yIHZhcmlvdXMgcmVhc29ucworCSRo
by0+e0ZsYWdzfXsiYXJjaC0kaG8tPntBcmNofSJ9ICYmICEkaG8tPntGbGFnc317ImFyY2gtJGtl
cm5fYXJjaCJ9KSB7CisJIyBXZSBjaGVjayB0aGUgZmxhZyBmb3IgJGhvLT57QXJjaH0gYmVjYXVz
ZSBmb3IgdmFyaW91cyByZWFzb25zCiAJIyBpdCBtYXkgbm90IGJlIHNldC4gIEZvciBleGFtcGxl
LCBpbiBzdGFuZGFsb25lIG1vZGUgaXQgaXMKIAkjIGN1cnJlbnRseSBub3Qgbm9ybWFsbHkgbmVj
ZXNzYXJ5IHRvIHNldCBhbnkgYXJjaCBob3N0ZmxhZ3MuCiAJIyBJbiB0aGF0IHNpdHVhdGlvbiB3
ZSBiZXQgdGhhdCB0aGUga2VybiBhcmNoIGNhbiBiZSB1c2VkOwpAQCAtMTM1Niw3ICsxMzU2LDcg
QEAgRU5ECiAgICAgfQogICAgIGlmICgka2Vybl9hcmNoKSB7CiAJbXkgJHNldGFyY2ggPSAic2V0
YXJjaCAka2Vybl9hcmNoX2luZm8tPntVc2VybGFuZF9zZXRhcmNofSI7Ci0JbG9nbSgiVXNpbmcg
JGtlcm5fYXJjaCBrZXJuZWwgZm9yICRye2FyY2h9IHVzZXJsYW5kICgkc2V0YXJjaCkiKTsKKwls
b2dtKCJVc2luZyAka2Vybl9hcmNoIGtlcm5lbCBmb3IgJGhvLT57QXJjaH0gdXNlcmxhbmQgKCRz
ZXRhcmNoKSIpOwogCXByZXNlZWRfaG9va19jb21tYW5kKCRobywgJ2xhdGVfY29tbWFuZCcsICRz
ZngsIDw8RU5EKTsKICMhL2Jpbi9zaAogc2V0IC1leApAQCAtMTM2Niw3ICsxMzY2LDcgQEAgZXhl
YyAkc2V0YXJjaCAvdXNyL3NiaW4vc3NoZC5kaXN0cmliICJcJEAiCiBFTkRXCiBjaG1vZCBhK3gg
L3RhcmdldC91c3Ivc2Jpbi9zc2hkLm9zc3Rlc3Qtd3JhcAogaW4tdGFyZ2V0IHNoIC14ZWMgJwot
ICAgICMgdGhlICRye2FyY2h9IGtlcm5lbHMgZW5kIHVwIGJlaW5nIHRoZSBkZWZhdWx0IHNvIHNo
dWZmbGUgdGhlbQorICAgICMgdGhlICRoby0+e0FyY2h9IGtlcm5lbHMgZW5kIHVwIGJlaW5nIHRo
ZSBkZWZhdWx0IHNvIHNodWZmbGUgdGhlbQogICAgICMgd2hlcmUgdXBkYXRlLWdydWIgd2lsbCBu
b3QgZmluZCB0aGVtCiAgICAgZm9yIGYgaW4gL2Jvb3Qvdm1saW51KjsgZG8KICAgICAgICAgZHBr
Zy1kaXZlcnQgLS1yZW5hbWUgLS1kaXZlcnQgIi9ib290L35kaXNhYmxlflwke2YjIyovfSIgIlwk
ZiIKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBw
b3J0LnBtCmluZGV4IDE4NTY2ZDMyLi5kODdiNmM4OSAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0
U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0yOTE4LDggKzI5MTgs
OCBAQCBzdWIgc2V0dXBfbmV0Ym9vdF9sb2NhbF91ZWZpICgkKSB7CiAgICAgIyBpMzg2IGlzIFg2
NCBiZWNhdXNlIHdoZW4gd2UgYXJlIHRyeWluZyB0byBpbnN0YWxsIGkzODYKICAgICAjIG9uIGEg
VUVGSSBib3gsIGl0J3MgYWN0dWFsbHkgYW4gYW1kNjQtY2FwYWJsZSBVRUZJIGJveAogICAgICMg
d2hpY2ggZXhwZWN0cyBhIDY0LWJpdCBFRkkgbG9hZGVyCi0gICAgZGllICJFRkkgYXJjaCIgdW5s
ZXNzICRlZmlfYXJjaHN7ICRye2FyY2h9IH07Ci0gICAgbXkgJGVmaSA9ICRlZmlfYXJjaHN7ICRy
e2FyY2h9IH07CisgICAgZGllICJFRkkgYXJjaCIgdW5sZXNzICRlZmlfYXJjaHN7ICRoby0+e0Fy
Y2h9IH07CisgICAgbXkgJGVmaSA9ICRlZmlfYXJjaHN7ICRoby0+e0FyY2h9IH07CiAgICAgc2V0
dXBfbmV0Ym9vdF9ib290Y2ZnKCRobywgPDxFTkQpOwogc2V0IGRlZmF1bHQ9MAogc2V0IHRpbWVv
dXQ9NQpkaWZmIC0tZ2l0IGEvdHMtZnJlZWJzZC1idWlsZCBiL3RzLWZyZWVic2QtYnVpbGQKaW5k
ZXggYmRmNjY2ZWIuLjNjZGYxNWNiIDEwMDc1NQotLS0gYS90cy1mcmVlYnNkLWJ1aWxkCisrKyBi
L3RzLWZyZWVic2QtYnVpbGQKQEAgLTgzLDcgKzgzLDcgQEAgc3ViIGJ1aWxkICgpIHsKICAgICBt
eSAkdGFyZ2V0ID0gImJvb3Rvbmx5IjsKICAgICBteSAkcHJlZml4ID0gPDxFTkQ7CiBleHBvcnQg
TUFLRU9CSkRJUlBSRUZJWD0kYnVpbGRkaXIvb2JqCi1leHBvcnQgVEFSR0VUPSRye2FyY2h9Citl
eHBvcnQgVEFSR0VUPSRoby0+e0FyY2h9CiBFTkQKIAogICAgICMgQnVpbGQgcHJvY2VzcyBhcyBk
b2N1bWVudGVkIGluIHRoZSBoYW5kYm9vazoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBi
L3RzLWhvc3QtaW5zdGFsbAppbmRleCAzYzE0ZjE3MS4uNGJmYTJmNWUgMTAwNzU1Ci0tLSBhL3Rz
LWhvc3QtaW5zdGFsbAorKysgYi90cy1ob3N0LWluc3RhbGwKQEAgLTYxLDcgKzYxLDcgQEAgb3Vy
ICV0aW1lb3V0PSBxdyhSZWFkUHJlc2VlZCAgMzUwCiBvdXIgJGtlcm5fYXJjaF9pbmZvOwogCiBp
ZiAoJGJ1aWxkKSB7Ci0gICAgaWYgKCRye2FyY2h9IGVxICdpMzg2JykgeworICAgIGlmICgkaG8t
PntBcmNofSBlcSAnaTM4NicpIHsKIAkka2Vybl9hcmNoX2luZm8gPSB7CiAJICAgIEtlcm5lbF9E
ZWJpYW4gPT4gJ2FtZDY0JywKIAkgICAgVXNlcmxhbmRfc2V0YXJjaCA9PiAnaTM4NicsCkBAIC0y
NjIsNyArMjYyLDcgQEAgRU5ECiAgICAgcHVzaCBAZGljbWRsaW5lLCAiZG9tYWluPSRje1Rlc3RI
b3N0RG9tYWlufSI7CiAgICAgcHVzaCBAZGljbWRsaW5lLAogICAgICAgICBnZXRfaG9zdF9wcm9w
ZXJ0eSgkaG8sICJpbnN0YWxsLWFwcGVuZCAkaG8tPntTdWl0ZX0iLCAnJyksCi0gICAgICAgIGdl
dF9ob3N0X3Byb3BlcnR5KCRobywgImluc3RhbGwtYXBwZW5kICRoby0+e1N1aXRlfSAkcnthcmNo
fSIsICcnKTsKKyAgICAgICAgZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAiaW5zdGFsbC1hcHBlbmQg
JGhvLT57U3VpdGV9ICRoby0+e0FyY2h9IiwgJycpOwogCiAgICAgbXkgJGNvbnNvbGUgPSBnZXRf
aG9zdF9uYXRpdmVfbGludXhfY29uc29sZSgkaG8pOwogCkBAIC0yODAsNyArMjgwLDcgQEAgRU5E
CiAKICAgICBwdXNoIEBob2NtZGxpbmUsCiAgICAgICAgIGdldF9ob3N0X3Byb3BlcnR5KCRobywg
ImxpbnV4LWJvb3QtYXBwZW5kICRoby0+e1N1aXRlfSIsICcnKSwKLSAgICAgICAgZ2V0X2hvc3Rf
cHJvcGVydHkoJGhvLCAibGludXgtYm9vdC1hcHBlbmQgJGhvLT57U3VpdGV9ICRye2FyY2h9Iiwg
JycpOworICAgICAgICBnZXRfaG9zdF9wcm9wZXJ0eSgkaG8sICJsaW51eC1ib290LWFwcGVuZCAk
aG8tPntTdWl0ZX0gJGhvLT57QXJjaH0iLCAnJyk7CiAKICAgICAkeG9wdHN7aXBhcHBlbmR9ID0g
JGlwYXBwZW5kOwogICAgIHNldHVwX25ldGJvb3RfZGkoJGhvLCAka2VybmVsLCAiLyRpbml0cmQi
LCBcQGRpY21kbGluZSwgXEBob2NtZGxpbmUsCmRpZmYgLS1naXQgYS90cy1tZW1kaXNrLXRyeS1h
cHBlbmQgYi90cy1tZW1kaXNrLXRyeS1hcHBlbmQKaW5kZXggZjZlYzJmZDUuLmNlMzlkNWE3IDEw
MDc1NQotLS0gYS90cy1tZW1kaXNrLXRyeS1hcHBlbmQKKysrIGIvdHMtbWVtZGlzay10cnktYXBw
ZW5kCkBAIC0yMyw3ICsyMyw3IEBAIGFyY2g9YHBlcmwgLWUgJwogICAgICAgICAgICAgICAgIHVz
ZSBPc3N0ZXN0OjpUZXN0U3VwcG9ydDsKIAogICAgICAgICAgICAgICAgIHRzcmVhZGNvbmZpZygp
OwotICAgICAgICAgICAgICAgIHByaW50ICRye2FyY2h9IG9yIGRpZSAkITsKKyAgICAgICAgICAg
ICAgICBwcmludCAkaG8tPntBcmNofSBvciBkaWUgJCE7CiAgICAgICAgICAgICAgICdgCiAKIGNh
c2UgIiRhcmNoIiBpbgpkaWZmIC0tZ2l0IGEvdHMteGVuLWJ1aWxkLXByZXAgYi90cy14ZW4tYnVp
bGQtcHJlcAppbmRleCBjMzhhYjM2ZC4uMGYwNzY0OGUgMTAwNzU1Ci0tLSBhL3RzLXhlbi1idWls
ZC1wcmVwCisrKyBiL3RzLXhlbi1idWlsZC1wcmVwCkBAIC0yNDYsNyArMjQ2LDcgQEAgRU5ECiAg
ICAgaWYgKCRoby0+e1N1aXRlfSAhfiBtL2xlbm55fHNxdWVlemUvKSB7CiAgICAgICAgIHRhcmdl
dF9pbnN0YWxsX3BhY2thZ2VzKCRobywgJ2xpYmZkdC1kZXYnKTsKICAgICB9Ci0gICAgaWYgKCRy
e2FyY2h9IGVxICdhbWQ2NCcgJiYgJGhvLT57U3VpdGV9ICF+IG0vc3F1ZWV6ZXxsZW5ueS8pIHsK
KyAgICBpZiAoJGhvLT57QXJjaH0gZXEgJ2FtZDY0JyAmJiAkaG8tPntTdWl0ZX0gIX4gbS9zcXVl
ZXplfGxlbm55LykgewogICAgICAgICB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygkaG8sICdsaWJj
Ni1kZXYtaTM4NicpOwogICAgIH0KIH0KQEAgLTI2OSw0ICsyNjksNCBAQCBpZiAoISRoby0+e0Zs
YWdzfXsnbm8tcmVpbnN0YWxsJ30pIHsKICAgICBnaXRjYWNoZV9zZXR1cCgkaG8pOwogfQogCi1o
b3N0X3NoYXJlZF9tYXJrX3JlYWR5KCRobywgImJ1aWxkLSIuJGhvLT57U3VpdGV9LiItIi4kcnth
cmNofSk7Citob3N0X3NoYXJlZF9tYXJrX3JlYWR5KCRobywgImJ1aWxkLSIuJGhvLT57U3VpdGV9
LiItIi4kaG8tPntBcmNofSk7CmRpZmYgLS1naXQgYS90cy14ZW4taW5zdGFsbCBiL3RzLXhlbi1p
bnN0YWxsCmluZGV4IDlmNzhhNzVmLi4yZDNjNjQ0ZCAxMDA3NTUKLS0tIGEvdHMteGVuLWluc3Rh
bGwKKysrIGIvdHMteGVuLWluc3RhbGwKQEAgLTY0LDcgKzY0LDcgQEAgc3ViIHBhY2thZ2VzICgp
IHsKICAgICBpZiAoJGhvLT57U3VpdGV9ICF+IG0vbGVubnl8c3F1ZWV6ZS8pIHsKICAgICAgICAg
dGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBxdyhsaWJmZHQxKSk7CiAgICAgfQotICAgIGlm
ICgkcnthcmNofSBlcSAnaTM4NicpIHsKKyAgICBpZiAoJGhvLT57QXJjaH0gZXEgJ2kzODYnKSB7
CiAJdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBxdyhsaWJjNi14ZW4pKTsKICAgICB9CiAg
ICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBAe3Rvb2xzdGFjaygkaG8pLT57RXh0cmFQ
YWNrYWdlc319KQpAQCAtOTIsNyArOTIsNyBAQCBzdWIgc29tZV9leHRyYWRlYnMgKCQpIHsKIAkg
ICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBxdyhyc3luYykpIHVubGVzcyAkcnN5bmNf
aW5zdGFsbGVkKys7CiAJICAgIHRhcmdldF9wdXRmaWxlX3Jvb3QoJGhvLDMwMCwgIiRwYXRoLy4i
LCAkb250YXJnZXQsICctcicpOwogCX0gZWxzaWYgKCRwYXRoID1+IG17XC5kZWIkfSkgewotCSAg
ICAkcGF0aCA9fiBze19cLmRlYn17ICJfJHJ7YXJjaH0uZGViIiB9ZTsKKwkgICAgJHBhdGggPX4g
c3tfXC5kZWJ9eyAiXyRoby0+e0FyY2h9LmRlYiIgfWU7CiAJICAgIGxvZ20oIiRjZmd2YXI6IGlu
c3RhbGxpbmcgJHBhdGgiKTsKIAkgICAgJG9udGFyZ2V0ID0gYmFzZW5hbWUoJHBhdGgpOwogCSAg
ICAkZHBrZ29wdHMgPSAnLWlCJzsKQEAgLTExNSw3ICsxMTUsNyBAQCBzdWIgZXh0cmFkZWJzICgp
IHsKIAogICAgICMgJGN7IERlYmlhbkV4dHJhUGFja2FnZXNfPGZpcm13YXJlPl88YXJjaD5fPHN1
aXRlPiB9CiAgICAgbXkgJGZpcm13YXJlID0gZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAiZmlybXdh
cmUiLCAiYmlvcyIpOwotICAgIHNvbWVfZXh0cmFkZWJzKFsgJ0RlYmlhbkV4dHJhUGFja2FnZXMn
LCAkZmlybXdhcmUsICRye2FyY2h9LCAkc3VpdGUgXSk7CisgICAgc29tZV9leHRyYWRlYnMoWyAn
RGViaWFuRXh0cmFQYWNrYWdlcycsICRmaXJtd2FyZSwgJGhvLT57QXJjaH0sICRzdWl0ZSBdKTsK
IH0KIAogc3ViIGV4dHJhY3QgKCkgewpAQCAtMTkzLDcgKzE5Myw3IEBAIHN1YiBzZXR1cGJvb3Qg
KCkgewogICAgIG15ICR4ZW5ob3B0PSAiY29uc3dpdGNoPXggd2F0Y2hkb2cgbm9yZWJvb3QgYXN5
bmMtc2hvdy1hbGwiOwogCiAgICAgbXkgJGNvbnM9IGdldF9ob3N0X3Byb3BlcnR5KCRobywgJ1hl
blNlcmlhbENvbnNvbGUnLAotCQkJCSRye2FyY2h9ID1+IG0vXmFybS8gPyAnZHR1YXJ0JworCQkJ
CSRoby0+e0FyY2h9ID1+IG0vXmFybS8gPyAnZHR1YXJ0JwogCQkJCTogJ2NvbTEnKTsKIAogICAg
IGlmICggJGNvbnMgZXEgImNvbTEiICkgewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
