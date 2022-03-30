Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99774ECC9B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 20:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296492.504716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZdK1-0007ar-7M; Wed, 30 Mar 2022 18:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296492.504716; Wed, 30 Mar 2022 18:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZdK1-0007YK-41; Wed, 30 Mar 2022 18:45:33 +0000
Received: by outflank-mailman (input) for mailman id 296492;
 Wed, 30 Mar 2022 18:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZdK0-0007YE-5F
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 18:45:32 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 933ddef9-b059-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 20:45:31 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id q5so28919008ljb.11
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 11:45:31 -0700 (PDT)
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
X-Inumbo-ID: 933ddef9-b059-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ayMCnREX9HtNuXi9WeXSZ0So08wG6vqv2BNtNMXIV4M=;
        b=BNgZaWmkON6IJ7dHPrLGKhylSrde+i6aUrHlm0BfbsGMhPEfnTHOygYR6GqTypP8g6
         2eWYm4KSzdIkZhN7AbImoX6U89sgowW6vafyh6D+YGDgYtL1MXdDd/PYdqb3DNRU6pYL
         dW+wyJ+Wc0uDI34M2JTYhv77uC/lgUz1RSjORvyOn9umoo0JMGqLLiCwrM+ISicFKePP
         x7nxw4q01LGXICcWPzV28n1AEMuctqRYnSCMcmbV+Ek2EhcCyAJU2YKBPOPqtRzwhX/9
         Ab1crKURFjr8TlqClj0FMnp87yyYTPrlcBS1f9rZn1TqxbUKbXadI90/eHjzYW6McK1X
         RPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ayMCnREX9HtNuXi9WeXSZ0So08wG6vqv2BNtNMXIV4M=;
        b=C/qEPmzZgEaQkkr+ouhjyhuY6QqLyZel9m+aC5KnjvL348aRgNQepWk9b/ELgITl4p
         ZOSgJwlq0InwRoSa7/Fjk1ybS8hxIQjKa8TD4a0aew+r4XTb+xa3fv+WKmzYf0FrQwwm
         1fEALJhm02Q/haVU9ELVZJv6qGE+6aeQE/G93KzfygWGg9iUy+PP7CL9KOesu9xJ6JWZ
         hSIUsaJ6EqoT5cFFZtSTOt8W/JyahiD9qloSUC9WzNBZdxOZw3Cvmcqi0QIywESfbRx0
         +xegDrBnPaU0uVjo2x5/qjyTSXcFRt/B5sZSLLy1zJHUgRIQhupYNE+YdHDvr2ERPTY8
         d5Ig==
X-Gm-Message-State: AOAM5300i7QdKX0c7Uq2O51pn13LFPfuXwNDJR59Z/Sm7Ibi+QYQHP/z
	FcdFLo6FQ8BOw5wd7nw+ueMmzEzDYY2mLEKN+Sk=
X-Google-Smtp-Source: ABdhPJyiLHNAljZPTPC5pPRsg3EOVzF4VThtRZ3PeSQdV+MzqcPokACeZb4MzBy5ihimA05E2TAFRBHHQtEprD8+kCY=
X-Received: by 2002:a2e:a372:0:b0:249:7108:6778 with SMTP id
 i18-20020a2ea372000000b0024971086778mr7939723ljn.403.1648665930559; Wed, 30
 Mar 2022 11:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
In-Reply-To: <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 30 Mar 2022 14:45:18 -0400
Message-ID: <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
To: Jan Beulich <jbeulich@suse.com>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="000000000000250d0905db73f394"

--000000000000250d0905db73f394
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 4:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
> > When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
> > opregion to the guest but libxl does not grant the guest permission to
> > access the mapped memory region. This results in a crash of the i915.ko
> > kernel module in a Linux HVM guest when it needs to access the IGD
> > opregion:
> >
> > Oct 23 11:36:33 domU kernel: Call Trace:
> > Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
> > Oct 23 11:36:33 domU kernel:  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> > Oct 23 11:36:33 domU kernel:  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
> > Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
> > Oct 23 11:36:33 domU kernel:  intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
> > Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> > Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
> > Oct 23 11:36:33 domU kernel:  intel_modeset_init_nogem+0x867/0x1d30 [i915]
> > Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
> > Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670 [i915]
> > Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
> > Oct 23 11:36:33 domU kernel:  ? vga_switcheroo_client_probe_defer+0x1f/0x40
> > Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
> > Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
> > Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> > Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
> > Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
> > Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
> > Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
> > Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
> > Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> > Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> > Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
> > Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
> > Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
> > Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
> > Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
> > Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
> > Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
> > Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
> > Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
> > Oct 23 11:36:33 domU kernel:  __do_sys_finit_module+0xb1/0x110
> > Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
> > Oct 23 11:36:33 domU kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> The call trace alone leaves open where exactly the crash occurred.
> Looking at 5.17 I notice that the first thing the driver does
> after mapping the range it to check the signature (both in
> intel_opregion_setup()). As the signature can't possibly match
> with no access granted to the underlying mappings, there shouldn't
> be any further attempts to use the region in the driver; if there
> are, I'd view this as a driver bug.

Yes.  i915_driver_hw_probe does not check the return value of
intel_opregion_setup(dev_priv) and just continues on.

Chuck, the attached patch may help if you want to test it.

Regards,
Jason

--000000000000250d0905db73f394
Content-Type: application/x-patch; 
	name="0001-i915-Fail-probe-when-opregion-setup-fails.patch"
Content-Disposition: attachment; 
	filename="0001-i915-Fail-probe-when-opregion-setup-fails.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l1dwihsv0>
X-Attachment-Id: f_l1dwihsv0

RnJvbSBmYTVhYTdiNjc1YTRhMWQzMTkwMmIzNDI2Y2M1ZDA4N2VlNmU1YThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+CkRh
dGU6IEZyaSwgMTggTWFyIDIwMjIgMTE6MDU6MjEgLTA0MDAKU3ViamVjdDogW1BBVENIXSBpOTE1
OiBGYWlsIHByb2JlIHdoZW4gb3ByZWdpb24gc2V0dXAgZmFpbHMKCmludGVsX29wcmVnaW9uX3Nl
dHVwIGNhbiBmYWlsLCBidXQgaTkxNV9kcml2ZXJfaHdfcHJvYmUgZG9lc24ndCBjaGVjawp0aGUg
cmV0dXJuIHZhbHVlLiAgUHJvYmUgd2lsbCBldmVudHVhbGx5IGNyYXNoIHdoZW4gYWNjZXNzaW5n
IHVubWFwcGVkCm1lbW9yeToKCmRvbVUga2VybmVsOiAgZHJtX2dldF9sYXN0X3ZibHRpbWVzdGFt
cCsweGFhLzB4YzAgW2RybV0KZG9tVSBrZXJuZWw6ICBkcm1fcmVzZXRfdmJsYW5rX3RpbWVzdGFt
cCsweDViLzB4ZDAgW2RybV0KZG9tVSBrZXJuZWw6ICBkcm1fY3J0Y192Ymxhbmtfb24rMHg3Yi8w
eDEzMCBbZHJtXQpkb21VIGtlcm5lbDogIGludGVsX21vZGVzZXRfc2V0dXBfaHdfc3RhdGUrMHhi
ZDQvMHgxOTAwIFtpOTE1XQpkb21VIGtlcm5lbDogID8gX2NvbmRfcmVzY2hlZCsweDE2LzB4NDAK
ZG9tVSBrZXJuZWw6ICA/IHd3X211dGV4X2xvY2srMHgxNS8weDgwCmRvbVUga2VybmVsOiAgaW50
ZWxfbW9kZXNldF9pbml0X25vZ2VtKzB4ODY3LzB4MWQzMCBbaTkxNV0KZG9tVSBrZXJuZWw6ICA/
IGdlbjZfd3JpdGUzMisweDRiLzB4MWMwIFtpOTE1XQpkb21VIGtlcm5lbDogID8gaW50ZWxfaXJx
X3Bvc3RpbnN0YWxsKzB4YjkvMHg2NzAgW2k5MTVdCmRvbVUga2VybmVsOiAgaTkxNV9kcml2ZXJf
cHJvYmUrMHg1YzIvMHhjOTAgW2k5MTVdCgpUaGlzIGNhbiBiZSBzZWVuIGluIGEgWGVuIERvbVUg
d2hlbiBhbiBJR0QgZG9lc24ndCBoYXZlIHRoZSBvcHJlZ2lvbgptZW1vcnkgbWFwcGVkIGR1cmlu
ZyBQQ0kgcGFzc3Rocm91Z2guCgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGFuZCBmYWlsIHByb2Jl
IHdoZW4gaW50ZWxfb3ByZWdpb25fc2V0dXAgZmFpbHMuCgpSZXBvcnRlZC1ieTogQ2h1Y2sgWm11
ZHppbnNraSA8YnJjaHVja3pAbmV0c2NhcGUubmV0PgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRy
eXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9k
cml2ZXIuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jCmluZGV4IDk1MTc0OTM4YjE2MC4u
MzI2MWRjZWJiNDhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZl
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMKQEAgLTYyOSw3ICs2
MjksOSBAQCBzdGF0aWMgaW50IGk5MTVfZHJpdmVyX2h3X3Byb2JlKHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICpkZXZfcHJpdikKIAlpZiAocmV0KQogCQlnb3RvIGVycl9tc2k7CiAKLQlpbnRlbF9v
cHJlZ2lvbl9zZXR1cChkZXZfcHJpdik7CisJcmV0ID0gaW50ZWxfb3ByZWdpb25fc2V0dXAoZGV2
X3ByaXYpOworCWlmIChyZXQpCisJCWdvdG8gZXJyX21zaTsKIAogCXJldCA9IGludGVsX3Bjb2Rl
X2luaXQoZGV2X3ByaXYpOwogCWlmIChyZXQpCi0tIAoyLjM1LjEKCg==
--000000000000250d0905db73f394--

