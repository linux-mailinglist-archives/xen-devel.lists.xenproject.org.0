Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D99344B107
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 17:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224061.387121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkTou-0005DY-AQ; Tue, 09 Nov 2021 16:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224061.387121; Tue, 09 Nov 2021 16:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkTou-0005B5-6C; Tue, 09 Nov 2021 16:18:00 +0000
Received: by outflank-mailman (input) for mailman id 224061;
 Tue, 09 Nov 2021 16:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQwn=P4=yandex.ru=isaikin-dmitry@srs-se1.protection.inumbo.net>)
 id 1mkTos-0005Az-Id
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 16:17:58 +0000
Received: from forward501j.mail.yandex.net (forward501j.mail.yandex.net
 [5.45.198.251]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9911df42-4178-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 17:17:56 +0100 (CET)
Received: from sas1-97174d5fd2ec.qloud-c.yandex.net
 (sas1-97174d5fd2ec.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:5da4:0:640:9717:4d5f])
 by forward501j.mail.yandex.net (Yandex) with ESMTP id B17236234F9;
 Tue,  9 Nov 2021 19:17:54 +0300 (MSK)
Received: from 2a02:6b8:c08:78a8:0:640:8780:f191
 (2a02:6b8:c08:78a8:0:640:8780:f191 [2a02:6b8:c08:78a8:0:640:8780:f191])
 by sas1-97174d5fd2ec.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 qHXg442Da8c1-HrDWb5b7; Tue, 09 Nov 2021 19:17:53 +0300
Received: by sas1-8780f191e495.qloud-c.yandex.net with HTTP;
 Tue, 09 Nov 2021 19:17:53 +0300
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9911df42-4178-11ec-9787-a32c541c8605
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1636474673;
	bh=ix0EkztLDg7YPp+yxzGmV1yg09IwLI+EzQQk+LsGrdg=;
	h=Message-Id:References:Date:Cc:Subject:To:From;
	b=qbuo/rqtugKDN/WL0u4ZqKTg6CCBdIkVzyzbi+1n3/E3tJahkwSDZr3xnEF6gHGV/
	 h/kDLWC4TPzBru5KvX0Kj6jr8px4lCGmfE8AC9Nb/I/G07ChTy61B3uDusvvOk8GkL
	 5lZIlKwtfsad4unSu+VPx1N9ROcLkg60Mo3bmKW0=
Authentication-Results: sas1-97174d5fd2ec.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
References: <54c1bcb40afa8a6f36ab4bec8c91523a535c911b.1633090722.git.isaikin-dmitry@yandex.ru>
Subject: Re: [PATCH v5] tools/xl: fix autoballoon regex
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 09 Nov 2021 19:17:53 +0300
Message-Id: <844291636472349@iva2-5f9649d2845f.qloud-c.yandex.net>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdj5VcDxiciAvPjxiciAvPjE1OjI0LCAxINC+0LrRgtGP0LHRgNGPIDIwMjEg0LMuLCBEbWl0
cnkgSXNheWtpbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmlzYWlraW4tZG1pdHJ5QHlhbmRleC5ydSIg
cmVsPSJub29wZW5lciBub3JlZmVycmVyIj5pc2Fpa2luLWRtaXRyeUB5YW5kZXgucnU8L2E+Jmd0
Ozo8YmxvY2txdW90ZT48cD5UaGlzIHJlZ2V4IGlzIHVzZWQgZm9yIGF1dG8tYmFsbG9vbiBtb2Rl
IGRldGVjdGlvbiBiYXNlZCBvbiBYZW4gY29tbWFuZCBsaW5lLjxiciAvPjxiciAvPlRoZSBjYXNl
IG9mIHNwZWNpZnlpbmcgYSBuZWdhdGl2ZSBzaXplIHdhcyBoYW5kbGVkIGluY29ycmVjdGx5Ljxi
ciAvPkZyb20gbWlzYy94ZW4tY29tbWFuZC1saW5lIGRvY3VtZW50YXRpb246PGJyIC8+PGJyIC8+
wqDCoMKgwqBkb20wX21lbSAoeDg2KTxiciAvPsKgwqDCoMKgPSBMaXN0IG9mICggbWluOiZsdDtz
eiZndDsgfCBtYXg6Jmx0O3N6Jmd0OyB8ICZsdDtzeiZndDsgKTxiciAvPjxiciAvPsKgwqDCoMKg
SWYgYSBzaXplIGlzIHBvc2l0aXZlLCBpdCByZXByZXNlbnRzIGFuIGFic29sdXRlIHZhbHVlLjxi
ciAvPsKgwqDCoMKgSWYgYSBzaXplIGlzIG5lZ2F0aXZlLCBpdCBpcyBzdWJ0cmFjdGVkIGZyb20g
dGhlIHRvdGFsIGF2YWlsYWJsZSBtZW1vcnkuPGJyIC8+PGJyIC8+QWxzbyBhZGQgc3VwcG9ydCBm
b3IgW3RUXSBncmFudWxhcml0eSBzdWZmaXguPGJyIC8+QWxzbyBhZGQgc3VwcG9ydCBmb3IgbWVt
b3J5IGZyYWN0aW9ucyAoaS5lLiAnNTAlJyBvciAnMUcrMjUlJykuPGJyIC8+PGJyIC8+U2lnbmVk
LW9mZi1ieTogRG1pdHJ5IElzYXlraW4gJmx0OzxhIGhyZWY9Im1haWx0bzppc2Fpa2luLWRtaXRy
eUB5YW5kZXgucnUiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+aXNhaWtpbi1kbWl0cnlAeWFu
ZGV4LnJ1PC9hPiZndDs8YnIgLz5SZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgJmx0OzxhIGhy
ZWY9Im1haWx0bzphbnRob255LnBlcmFyZEBjaXRyaXguY29tIiByZWw9Im5vb3BlbmVyIG5vcmVm
ZXJyZXIiPmFudGhvbnkucGVyYXJkQGNpdHJpeC5jb208L2E+Jmd0OzxiciAvPi0tLTxiciAvPkNo
YW5nZXMgaW4gdjU6PGJyIC8+LSBhZGQgQW50aG9ueSdzIHJldmlld2VkLWJ5PGJyIC8+PGJyIC8+
Q2hhbmdlcyBpbiB2NDo8YnIgLz4tIGltcHJvdmUgcmVnZXggYWZ0ZXIgY29kZSByZXZpZXc8YnIg
Lz48YnIgLz5DaGFuZ2VzIGluIHYzOjxiciAvPi0gYWRkIHN1cHBvcnQgZm9yIFt0VF0gZ3JhbnVs
YXJpdHkgc3VmZml4PGJyIC8+LSBhZGQgc3VwcG9ydCBmb3IgbWVtb3J5IGZyYWN0aW9uczxiciAv
PjxiciAvPkNoYW5nZXMgaW4gdjI6PGJyIC8+LSBhZGQgbWlzc2luZyBTaWduZWQtb2ZmLWJ5IHRh
ZzxiciAvPjxiciAvPk5CISBOZXcgYXV0b2JhbGxvbiByZWdleCBwYXR0ZXJuIGlzIGdvb2QgZW5v
dWdoLCBidXQgbm90IGZ1bGx5IGNvcnJlY3QuPGJyIC8+U2VlIHRlc3QgYmVsb3cuPGJyIC8+PGJy
IC8+YGBgPGJyIC8+aW1wb3J0IHB5dGVzdDxiciAvPmltcG9ydCByZTxiciAvPjxiciAvPnNpemVf
cGF0dGVybiA9IHIiLT9bMC05XStbYkJrS21NZ0d0VF0/IjxiciAvPnBhdHRlcm4gPSByIihefCAp
ZG9tMF9tZW09KCh8bWluOnxtYXg6KSh7c2l6ZX18KHtzaXplfVwrKT9bMC05XXs8IS0tIC0tPnsx
LDJ9fSUpLD8pKygkfCApIi5mb3JtYXQoc2l6ZT1zaXplX3BhdHRlcm4pPGJyIC8+PGJyIC8+QHB5
dGVzdC5tYXJrLnBhcmFtZXRyaXplKCdjbWRsaW5lJywgWzxiciAvPsKgwqDCoMKgJ2RvbTBfbWVt
PTEnLDxiciAvPsKgwqDCoMKgJyBkb20wX21lbT0xJyw8YnIgLz7CoMKgwqDCoCdkb20wX21lbT0x
RycsPGJyIC8+wqDCoMKgwqAnZG9tMF9tZW09MjUlJyw8YnIgLz7CoMKgwqDCoCdkb20wX21lbT0x
ZysyNSUgJyw8YnIgLz7CoMKgwqDCoCcgZG9tMF9tZW09MUcrMTAlLG1heDoxMDBUKzUwJScsPGJy
IC8+wqDCoMKgwqAnZG9tMF9tZW09LTFCJyw8YnIgLz7CoMKgwqDCoCdkb20wX21lbT0tMTAyNDBN
KzUlLG1pbjo1MTJNICcsPGJyIC8+wqDCoMKgwqAnIGRvbTBfbWVtPW1pbjotMjA0OG0sbWF4Oi0y
MDQ4TSAnLDxiciAvPl0pPGJyIC8+ZGVmIHRlc3RfYXV0b2JhbGxvb25fcmVnZXhfbWF0Y2goY21k
bGluZSk6PGJyIC8+wqDCoMKgwqBhc3NlcnQgcmUubWF0Y2gocGF0dGVybiwgY21kbGluZSk8YnIg
Lz48YnIgLz5AcHl0ZXN0Lm1hcmsucGFyYW1ldHJpemUoJ2NtZGxpbmUnLCBbPGJyIC8+wqDCoMKg
wqAnZG9tMF9tZW0gPSAxJyw8YnIgLz7CoMKgwqDCoCdkb20wX21lbT0gJyw8YnIgLz7CoMKgwqDC
oCdkb20wX21lbScsPGJyIC8+wqDCoMKgwqAnRE9NMF9tZW09MTBHJyw8YnIgLz7CoMKgwqDCoCdk
b20wX21lbT0tMTAlJywgIyBkb2VzIG5vdCBwYXNzPGJyIC8+wqDCoMKgwqAnIGRvbTBfbWVtPS0x
MCUrMTBHICcsPGJyIC8+wqDCoMKgwqAnZG9tMF9tZW09MUcsJywgIyBkb2VzIG5vdCBwYXNzPGJy
IC8+wqDCoMKgwqAnZG9tMF9tZW09MUcsbWF4OjI1JSwnLCAjZG9lcyBub3QgcGFzczxiciAvPl0p
PGJyIC8+ZGVmIHRlc3RfYXV0b2JhbGxvb25fcmVnZXhfZG9udF9tYXRjaChjbWRsaW5lKTo8YnIg
Lz7CoMKgwqDCoGFzc2VydCBub3QgcmUubWF0Y2gocGF0dGVybiwgY21kbGluZSk8YnIgLz5gYGA8
YnIgLz4tLS08YnIgLz7CoHRvb2xzL3hsL3hsLmMgfCA4ICsrKysrKystPGJyIC8+wqAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pPGJyIC8+PGJyIC8+ZGlmZiAt
LWdpdCBhL3Rvb2xzL3hsL3hsLmMgYi90b29scy94bC94bC5jPGJyIC8+aW5kZXggNDEwN2QxMGZk
NC4uZjQyMmY5ZmVkNSAxMDA2NDQ8YnIgLz4tLS0gYS90b29scy94bC94bC5jPGJyIC8+KysrIGIv
dG9vbHMveGwveGwuYzxiciAvPkBAIC04MCwxNCArODAsMjAgQEAgc3RhdGljIGludCBhdXRvX2F1
dG9iYWxsb29uKHZvaWQpPGJyIC8+wqDCoMKgwqDCoGlmICghaW5mbyk8YnIgLz7CoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gMTsgLyogZGVmYXVsdCB0byBvbiAqLzxiciAvPsKgPGJyIC8+KyNkZWZp
bmUgU0laRV9QQVRURVJOICItP1swLTldK1tiQmtLbU1nR3RUXT8iPGJyIC8+KzxiciAvPsKgwqDC
oMKgwqByZXQgPSByZWdjb21wKCZhbXA7cmVnZXgsPGJyIC8+LSAiKF58IClkb20wX21lbT0oKHxt
aW46fG1heDopWzAtOV0rW2JCa0ttTWdHXT8sPykrKCR8ICkiLDxiciAvPisgIihefCApZG9tMF9t
ZW09KCh8bWluOnxtYXg6KSgiIFNJWkVfUEFUVEVSTiAifCgiIFNJWkVfUEFUVEVSTiAiXFwrKT9b
MC05XXsxLDJ9JSksPykrKCR8ICkiLDxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgUkVHX05PU1VCIHwgUkVHX0VYVEVOREVEKTs8YnIgLz4rPGJyIC8+KyN1bmRlZiBT
SVpFX1BBVFRFUk48YnIgLz4rPGJyIC8+wqDCoMKgwqDCoGlmIChyZXQpPGJyIC8+wqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIDE7PGJyIC8+wqA8YnIgLz7CoMKgwqDCoMKgcmV0ID0gcmVnZXhlYygm
YW1wO3JlZ2V4LCBpbmZvLSZndDtjb21tYW5kbGluZSwgMCwgTlVMTCwgMCk7PGJyIC8+wqDCoMKg
wqDCoHJlZ2ZyZWUoJmFtcDtyZWdleCk7PGJyIC8+KzxiciAvPsKgwqDCoMKgwqByZXR1cm4gcmV0
ID09IFJFR19OT01BVENIOzxiciAvPsKgfTxiciAvPsKgPC9wPi0tPGJyIC8+Mi4zMy4wPGJyIC8+
wqA8L2Jsb2NrcXVvdGU+PGJyIC8+PGJyIC8+LS08YnIgLz7QntGC0L/RgNCw0LLQu9C10L3QviDQ
uNC3INC80L7QsdC40LvRjNC90L7Qs9C+INC/0YDQuNC70L7QttC10L3QuNGPINCv0L3QtNC10LrR
gS7Qn9C+0YfRgtGLPC9kaXY+

