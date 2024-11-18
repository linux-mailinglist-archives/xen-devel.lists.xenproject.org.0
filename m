Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44D09D1BBE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 00:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839573.1255360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDAwR-0000Xs-0W; Mon, 18 Nov 2024 23:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839573.1255360; Mon, 18 Nov 2024 23:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDAwQ-0000W5-T0; Mon, 18 Nov 2024 23:13:58 +0000
Received: by outflank-mailman (input) for mailman id 839573;
 Mon, 18 Nov 2024 23:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xYpB=SN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tDAwP-0000Vz-7C
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 23:13:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c69519cf-a602-11ef-a0c9-8be0dac302b0;
 Tue, 19 Nov 2024 00:13:52 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 404F84EE0738;
 Tue, 19 Nov 2024 00:13:51 +0100 (CET)
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
X-Inumbo-ID: c69519cf-a602-11ef-a0c9-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImM2OTUxOWNmLWE2MDItMTFlZi1hMGM5LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTcxNjMyLjc5NzYzOCwic2VuZGVyIjoibmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731971631; bh=+F7s87v33H2LR0i1+YHtvZK0uOM16Q3m0PPF3Ql1UKI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qGvJsvTdTer7wCDAeiNpt08qGssM7VNLFXVitmw9YwnlLD4HXwYY/uTkTl1S+0bVA
	 OAdrUjFX4RZC6Kmjy9bZ9wlbdYgd48U9xE6gEL6N9HpeHBU+C4cdhGzQtogQniDvj3
	 Zlg4GwFwnQIJre7e11wPdWckSEVPBUckxvl+8XBOKddYNy5K1OU9mK9R3WLySRQ4iU
	 TO9jWisQr6SeTIgvPARQqXJqagnSfsVLKZPD2aUMFxZMz+3xyp8XAeUGHbQQpc5sSS
	 gCxvAP9wpWKe23X2UQuYGssH74tDOprjkVE0G+eU84yJMk+hvK/uuTC4koXiCWfnGw
	 oej08DbozxMGw==
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 00:13:51 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 consulting@bugseng.com
Subject: Re: x86: Declarations for compat_set_{cx,px}_pminfo()
In-Reply-To: <4de83f5b-5fde-44a9-8943-b1bb3f41d2e3@citrix.com>
References: <4de83f5b-5fde-44a9-8943-b1bb3f41d2e3@citrix.com>
Message-ID: <7bb9fda3ea29f68cf8008cc32ec23874@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: multipart/mixed;
 boundary="=_2403ab8a83886ccb0c48a9f1bbf93eca"

--=_2403ab8a83886ccb0c48a9f1bbf93eca
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

On 2024-11-18 22:41, Andrew Cooper wrote:
> Hello,
> 
> Eclair reports Rule 8.4 violations for these two.  They're real
> violations, but fixing them is proving challenging.
> 
> Because of how x86_64/platform_hypercall.c sets up some defines and
> includes ../platform_hypercall.c, the declarations of
> compat_set_{cx,px}_pminfo() of pmstat.h become compat ones.
> 
> Therefore the real hypercall handler does see a correct declaration.
> 
> However, the implementation in cpufreq.c does not get the compat-ified
> version of pmstat.h, so misses the declaration and thus the violation.
> 
> Worse however is the fact that cpufreq.c depends on not having the:
> 
> #define xen_processor_performance compat_processor_performance
> 
> in scope while it's transforming between the two formats, meaning we
> can't simply reuse pmstat.h with suitable defines.
> 
> Any clever ideas for how to untangle this mess, before I go for the
> brute force approach of an #if COMPAT section in the main hypercall 
> handler?
> 

Yeah, that is why these were among the last ones. I'm afraid I didn't 
come up with a reasonable to deal with this either.

You can find attached a tentative patch I made (not build tested, and 
also based on an older tree). A last resort may be to special-case those 
declarations, but that's undesirable.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)
--=_2403ab8a83886ccb0c48a9f1bbf93eca
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=R8.4.patch
Content-Disposition: attachment;
 filename=R8.4.patch;
 size=1449

Y29tbWl0IGNhZmZhODlhMDYyNzViNmI1MGFjZTk5MTcwYjk5YjUwMGI3YjMyZjcKQXV0aG9yOiBO
aWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+CkRhdGU6ICAgV2VkIE5v
diAyOSAxMjoyMzoyNSAyMDIzICswMTAwCgogICAgeDg2XzY0L3BsYXRmb3JtX2h5cGVyY2FsbDog
cHJvdmlkZSBwcm9wZXIgZGVjbGFyYXRpb25zIGZvciBjb21wYXRfKgogICAgCiAgICBTaWduZWQt
b2ZmLWJ5OiBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+CgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwuYyBiL3hlbi9h
cmNoL3g4Ni94ODZfNjQvcGxhdGZvcm1faHlwZXJjYWxsLmMKaW5kZXggMzQ3ZjVkNjUzMzBlLi4z
YWQxNTc0MmQ5ZWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvcGxhdGZvcm1faHlw
ZXJjYWxsLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwuYwpA
QCAtNSw2ICs1LDcgQEAKIEVNSVRfRklMRTsKIAogI2luY2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNs
dWRlIDx4ZW4vcG1zdGF0Lmg+CiAjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgogCiAjZGVmaW5l
IHhlbl9wbGF0Zm9ybV9vcCAgICAgY29tcGF0X3BsYXRmb3JtX29wCkBAIC0xNCwxMSArMTUsMTMg
QEAgRU1JVF9GSUxFOwogI2RlZmluZSBlZmlfZ2V0X2luZm8gICAgICAgIGVmaV9jb21wYXRfZ2V0
X2luZm8KICNkZWZpbmUgZWZpX3J1bnRpbWVfY2FsbCh4KSBlZmlfY29tcGF0X3J1bnRpbWVfY2Fs
bCh4KQogCi0jZGVmaW5lIHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2UgY29tcGF0X3Byb2Nlc3Nv
cl9wZXJmb3JtYW5jZQotI2RlZmluZSBzZXRfcHhfcG1pbmZvICAgICAgIGNvbXBhdF9zZXRfcHhf
cG1pbmZvCisjZGVmaW5lIHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2UgY29tcGF0X3hlbl9wcm9j
ZXNzb3JfcGVyZm9ybWFuY2UKK2ludCBjb21wYXRfc2V0X3B4X3BtaW5mbyh1aW50MzJfdCBhY3Bp
X2lkLCAKKyAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY29tcGF0X3hlbl9wcm9jZXNz
b3JfcGVyZm9ybWFuY2UgKnBlcmYpOwogCi0jZGVmaW5lIHhlbl9wcm9jZXNzb3JfcG93ZXIgY29t
cGF0X3Byb2Nlc3Nvcl9wb3dlcgotI2RlZmluZSBzZXRfY3hfcG1pbmZvICAgICAgIGNvbXBhdF9z
ZXRfY3hfcG1pbmZvCisjZGVmaW5lIHhlbl9wcm9jZXNzb3JfcG93ZXIgICAgICAgY29tcGF0X3hl
bl9wcm9jZXNzb3JfcG93ZXIKK2xvbmcgY29tcGF0X3NldF9jeF9wbWluZm8odWludDMyX3QgYWNw
aV9pZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNvbXBhdF94ZW5fcHJvY2Vz
c29yX3Bvd2VyICpwb3dlcik7CiAKICNkZWZpbmUgeGVuX3BmX3BjcHVpbmZvIHhlbnBmX3BjcHVp
bmZvCiBDSEVDS19wZl9wY3B1aW5mbzsK
--=_2403ab8a83886ccb0c48a9f1bbf93eca--

