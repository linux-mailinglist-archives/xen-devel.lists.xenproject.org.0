Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PJDEqOEwmkAegQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:33:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75143084F7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260632.1553889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50wn-0004sQ-6H; Tue, 24 Mar 2026 12:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260632.1553889; Tue, 24 Mar 2026 12:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50wn-0004qs-2O; Tue, 24 Mar 2026 12:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1260632;
 Tue, 24 Mar 2026 12:33:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w50wl-0004qk-HE
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:33:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50wj-008teY-BT
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:33:22 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c2848f-5cb7-0a2a0a5109dd-0a2a4506d148-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:22 +0100
Received: from [209.85.216.66] (helo=mail-pj1-f66.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c28491-3034-0a2a45060019-d155d842b1b0-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:22 +0100
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-35a02f3b8feso2254202a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:33:22 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c031ed04esm2215792a91.12.2026.03.24.05.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:33:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774355600; x=1774960400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XT2HwcRtBu6LO8z2uPy2k8tXLApHhf6ycVvVP5IPkyQ=;
        b=Koef/nIhtVbEXWKJGRdWL2Emq6q0xk3o18ln8USReumvEvQsTWDT9u5GTFLnR8nCEm
         kVxZcV5KzeH7OinYGxSdYlUyHumUDMPwFdrKzFhoAKiJ43V9OYsmX6QhA7QgWf6d2Jm8
         F8PEIrzPToYpU22liAo+89TNsKbAFwziroo+Z8BcvMb8K+OURiaYqeivLeQiOcZTix3L
         x1ziuaIJkrrdp+dcoLS/1SfgO4zTDDXOa5TOZl+obTzqTgmP6SAEGHchbQ0bbSC7Ob9A
         wG9evbpnb4Ap0U0ELzCxajVYrF6ZEmgs/m7QcrWynAK6wgvDdzJzqoF7KXsgmq9OGH3S
         RKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355600; x=1774960400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT2HwcRtBu6LO8z2uPy2k8tXLApHhf6ycVvVP5IPkyQ=;
        b=nf1dUWibAyEmckHMwLXRZc+u0APiaK43WsdJlTFohueSvndecHtBlK82D2japcxujI
         gQnG9g+hIjjrxL/padJPFPTA3gDBltdvO+vNtlUBFJyXX5RNQcXM4M/psbf5HRQqRNEz
         RRV1oGVCYtlHU681qE66JpL5YThglqxxhTA7mTesEBgwTDTtCOs8atejQVQV0h5wIqCE
         J/LyAobNnsUxiWAZk5JTJcnOngZML6/apO+U2dFftgrMctAG3QBICL+YVcBEsMKkWN7E
         HbUs+hk/F1+t9//WkXbyawVsDkZ4bbZfRV3bWzUOFtErzmTKMxKwhJQdIJza1RKPP7Bf
         UQZg==
X-Forwarded-Encrypted: i=1; AJvYcCVcMtzZ9evaaS/zffWpucl24ZOy8y4nIPFnpCbzJ19ysGWdmwWNaXCkDGdsBjUa2+DIyplbB5VT5NA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg4faIRt84OkF+6ooQHy85dkpIK//PWWe6/vnkvFBgALcgeKNt
	T5jeTIz3++CqJm5RveATypIqM261/u6GdAEx221G4dfbrpYZyvFrPBNunTdvn09i
X-Gm-Gg: ATEYQzwXtflnvNmykDzTrswCzUleVv45GyiZsKzDHLtuVfhdjirgcGyKRiJfUqaohjr
	hdg20SuQKQq5h8bSZH7Il+DHI/p/tIViDjMK0PopPo/TK5kQ6xEYP7fVa90gq3UokiSMHbhppYF
	z+6UbDlFwixIFVWwiJf2nVvPGMknw5LW7dj0cVp8P46A7G5L+HPi/my1yPg52f7ZaoZ80MpmpqV
	Gmg10zwRvhrewf1M+29431bUmjmKohaoUpE3Hd+djCohWptf0tN3o1efZaYbAbFXxWwcq3+vGAJ
	7GitgsDTA5cdFa6CH3BRLptyU31O4qPtyWxBntP7FdcMCFDJJlJfEEVGEhlMz1aCkDkJ5u3AK0S
	GwkN1Af9pMansGNuOD5jqZOl+LzuYnl9REiMdHZRt8IU/hzLsFDL7wmawhddh1yucEx0K2qje1W
	5qc6Lj8U49yF2h7enP1cURrqHvHH5kn71JgJLzZtbA65duekZejbEETF1T1KLmiqU5Ly/3hn9po
	Z8zpV/k5AaYVvPmze8psQcb0GDaAyxRceqOOqtsxIo/OmfHm40sCo98ZJ4UW40A4hKh+ln0sA==
X-Received: by 2002:a17:90b:3c48:b0:359:855f:ff96 with SMTP id 98e67ed59e1d1-35bd2cb73f1mr12348850a91.17.1774355600219;
        Tue, 24 Mar 2026 05:33:20 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: sarkarsoumyajyoti23@gmail.com,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v5 0/3] Fixing ACPI BGRT (Boot Graphics Resource Table) corruption
Date: Tue, 24 Mar 2026 18:03:09 +0530
Message-ID: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774355602-801831C2-C879944F/0/0
X-purgate-type: clean
X-purgate-size: 4177
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
	FORGED_RECIPIENTS(0.00)[m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: A75143084F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series plans to address ACPI BGRT (Boot Graphics Resource Table) corruption,
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

Changes since v4:
Fixed the merge conflicts raised due to removal of efi_halt_system()
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


