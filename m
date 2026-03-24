Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA5nBehkwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:18:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72597306565
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260274.1553632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ypO-00057V-5o; Tue, 24 Mar 2026 10:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260274.1553632; Tue, 24 Mar 2026 10:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ypO-00055W-2T; Tue, 24 Mar 2026 10:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1260274;
 Tue, 24 Mar 2026 10:17:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w4ypN-00055Q-GZ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:17:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4ypM-0063e7-Lu
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:17:36 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c264be-2eae-0a2a0a5409dd-0a2a4509c866-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:17:36 +0100
Received: from [209.85.216.65] (helo=mail-pj1-f65.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c264be-e484-0a2a45090019-d155d841a4f5-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:17:36 +0100
Received: by mail-pj1-f65.google.com with SMTP id
 98e67ed59e1d1-35a1d4a095bso3099203a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:17:35 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c031412f2sm1939382a91.7.2026.03.24.03.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 03:17:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774347454; x=1774952254; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWUtC4hANvnQ6N9ebjiGBupLHcW6imwcMcuArR/Qe50=;
        b=Hd5ENYGMeR+ZsTGAr5vQHZxlvRnKB5aXNeUO67O8At7VAQ5adVjiR0leHiBadWf4nt
         PiVbQ2ib565KdoWfpNl1QtcpmqkHoHPtkyIyiJV5j7lFqw8auCaPxLmYtU47kKD/l6UP
         7AEULy8bvZPOwAFiU1+1EYNF/Cjcnx0nLbDRB03RMmb1zTzSqtrqPHtz4Pki4/z7XPUn
         v4Yr64WEdt5MFuYyjyoEjCs6wFwpIwy6L0a2yShcrBa12lD30RcQhsSlwh+qw6EX1c6u
         rsM8gabeAGlHOh4CzkMhkF45s9Ts7CuuyrOx2q9mZphJreVkAshhZzZmX5DaayOrbVSZ
         y9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347454; x=1774952254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWUtC4hANvnQ6N9ebjiGBupLHcW6imwcMcuArR/Qe50=;
        b=DbAk3diApAzGUaI7BmzkQ3PlLxkxoD2gwm//P9KamLNQSzc3ce853FsBxRY4YqTdao
         8RgJJnIBh8bsWvYloLJbIQsiiigti3UvY4eIGpmDY5md3KFEi4zkoCFS5b4GV3bamHdx
         cdgrnvIre/4xR0bvTWvNlLc+yb9ucgSH8sVk1LZiPWFrU/gxLMvXPogtDRZHGp8pBdqC
         kE3HQQFGDnysaX1CIY9X8hf30phlI4rZ6gEOXECuLqdqLWG8zhddP/e8q9rFrWzm10RW
         oE8wx8GUhG/6sANCxhBYF5XYfidiKKeLtX/+wPRnxVBPAuzO14YV0x0/MFe1UM8HLRqu
         bERg==
X-Gm-Message-State: AOJu0Yx0leXPhvR2Lx6Zq21Tz2oaKubtQpwMB9KBlgOPSGatIIH4PyMH
	Vck93AHIkjI3C1JCUYSdLcjuuBXdP9yrwYq29JLtQTg2mcPAqTqXAsz2ak6BqF8w
X-Gm-Gg: ATEYQzzMG1FXK0igBX4DieVtmaBXHgZAMsr/H7loaREhcNV0H6A0A0TOh9ARv192bCb
	PazbnbvIac2I9PTG3Stwaz5FijLNdRdijmj6RE/x+2TDAGDJY3qULqeaNQJ3gg8FQJZb4gq6gEg
	2cjs2afc7fgwbAJr7ldkacBAtn5Kp1gOK+4ecrNFFSCgp7rynM7bWK4IZ5ukiqQANe/Og4jRkB5
	kNVXcPg2HyxUa4HGDd8J45uMo/e42uMAfoC/CWhqNMJ+hCyc331xPuK8kHPG1cVKBoCiR7xyX3p
	Q+20u7SaP21cfukS2VfVBMDrG3LNxXQ68YaOVdXbnZIde3U3WZlqc3i5rj768Hb+6PnJP3nXwPo
	TV/cM6+v01ef39sDEM3Qfn6pK8UE83e/fiqTTQif4Yqug/0RMIHNJRNxk+CWnBXpz4mq2iBFdt1
	H0sY8w0afg3B6WwJuEnnRhx3HWYS53ENT6gMMxtRZfqYYnmsuanHHW//cKFGYE4DN1UVXUAU7hn
	xIzQb2jBCqipgqL1zRUttKyGig0L1RpPm5/wV83ZZAgpFZRF8bvOzjPWbwqCfSXwTljmId0oA==
X-Received: by 2002:a17:90a:ac17:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-35c00800a4dmr1575461a91.4.1774347453828;
        Tue, 24 Mar 2026 03:17:33 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v4 0/3] Fixing ACPI BGRT (Boot Graphics Resource Table) corruption
Date: Tue, 24 Mar 2026 15:47:23 +0530
Message-ID: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774347456-6AB41A73-13F3CF16/0/0
X-purgate-type: clean
X-purgate-size: 4009
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,apertussolutions.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,patchew.org:url];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 72597306565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series plans to addres ACPI BGRT (Boot Graphics Resource Table) corruption,
that occured when Xen reuses the memory containing the boot logo
image before dom0 is able to parse ACPI tables.

The BGRT table contains a pointer to a BMP image stored in
BootServicesData memory. When Xen reclaims this memory early in boot,
the pointer becomes invalid, causing Linux dom0 to report:
Xen: `(XEN) ACPI: BGRT: invalidating v1 image at 0x47cc2018`
Linux (dom0): `ACPI BIOS Warning (bug): Incorrect checksum
in table [BGRT] - 0xF9, should be 0xB4 (20250807/utcksum-58)`

This series:
1. Adds BGRT image preservation infrastructure during EFI boot
(validates BMP format, allocates EfiACPIReclaimMemory, stores pointers)

2. Integrates preservation with ACPI subsystem
(clarifies acpi_invalidate_bgrt() safety net behavior,
adds status reporting via efi_bgrt_status_info())

3. Provides opt-out mechanism
(-nobgrt for xen.efi direct boot, efi=no-bgrt
for multiboot2, both via early EFI-phase parsing)

The preservation is enabled by default to fix the corruption for all
users, with minimal overhead (~1MB). Also, servers that don't need boot
graphics can disable it using the "efi=no-bgrt" option.

Thank you everyone for the constructive feedback! It is really helpful,
I hope this RFC series is upto standards, I would greatly appriciate further feedback.

Changes since v1:
- The BGRT invalidation behaviour should still presist
  and server as a safety net when "efi=no-bgrt" or the
  preservation fails for some reason thus: Add Clarify comment
  for BGRT invalidation behavior with preservation.
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Changes since v2:
- Use existing ACPI headers (actbl.h, actbl3.h) instead of custom structs
- Modify the function names and code in function to conform with Coding Style.
- Reuse efi.acpi20 from efi_tables() instead of manual RSDP search
- Use appropriate types: EFI types for firmware code, unsigned int for
  loop counters (matching ESRT pattern)
- Used of sizeof(<expression>) over sizeof(<type>)
- Remove fixed-type widths & limited typecasting
- Add Blank line ahead of the main return statement of a function.
- Better wording error message for image cap size
- Remove parse_boolean(no-bgrt) since it could be bit misleading
- Add const qualifiers throughout for safety
- Use %p format for pointers (32-bit compatibility)
- Initialize failure_reason with string literal for proper relocation
- Use memcmp() with ACPI_SIG_* constants for signature checks
- Add direct Xen.efi calling.
- Add opt-out mechanism with proper early parsing during EFI phase.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reported-by: Jan Beulich <jbeulich@suse.com>

Changes since v3:
- Fix casting away const issue.
- Add Stub function
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Please refer to QubesOS Issue for more context:
https://github.com/QubesOS/qubes-issues/issues/10764

This is a companion series to Linux Kernel side at
https://patchew.org/linux/cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com/

Testing:
- Verified on Intel UEFI system with Fedora 43 dom0
- Before: ACPI checksum errors in dom0
- After: Clean boot, no ACPI warnings
- Memory overhead: ~972 KB (preserved image size)

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>

Soumyajyotii Ssarkar (3):
  x86/efi: Add BGRT image preservation infrastructure
  x86/acpi: Integrate BGRT preservation with status reporting
  x86/efi: Add opt-out mechanism for BGRT preservation

 xen/arch/x86/acpi/boot.c     |   8 ++
 xen/arch/x86/efi/efi-boot.h  |   5 ++
 xen/common/efi/boot.c        | 158 +++++++++++++++++++++++++++++++++++
 xen/common/efi/common-stub.c |   1 +
 xen/include/xen/efi.h        |   1 +
 5 files changed, 173 insertions(+)

--
2.53.0


