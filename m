Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33209572274
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 20:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365985.596517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBKVJ-0005NW-B0; Tue, 12 Jul 2022 18:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365985.596517; Tue, 12 Jul 2022 18:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBKVJ-0005KS-6u; Tue, 12 Jul 2022 18:21:01 +0000
Received: by outflank-mailman (input) for mailman id 365985;
 Tue, 12 Jul 2022 18:20:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DJCY=XR=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1oBKVH-0005KM-Ng
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 18:20:59 +0000
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f206cee-020f-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 20:20:57 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Tue, 12 Jul 2022 18:20:55 +0000
Received: by hermes--production-bf1-58957fb66f-p6kcj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b90d8ba9e0f4f18b61bda02035f72ec5; 
 Tue, 12 Jul 2022 18:20:53 +0000 (UTC)
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
X-Inumbo-ID: 5f206cee-020f-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1657650055; bh=CKwnEohSEzLCt0euoMPaexML+KON7/bDHVVi6FBe4pI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=j1UCI128UC/XdFVIk8BLV40tyhM2thxOLZH7jtvTEo/A8IUpSPaP461IU1bcGCYaneClzexEZECahX9lGBNFlFtATxmGtC1JimPj8U11JSg7iCl7fJma81s4m5R6SViYqBTJVxCJo7iTBRgRCcUSZRBrPTAu8HUNQCFyYu5uvJGh8M5fb9wtvCpchF1Hn2G1IbM6wUJNdMDEr162EbzVnwNTtWl9tKcPjyV06px5uY4jCL4yI5GAlMpnVnJkvBcy1SOibG8/IWQ/+aZgthwfC2VYWy1XT690LtufKYDuoCza4551OKny8fyIgNnFYsgETQtj5u4j+XzZ1lIJmePNfQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1657650055; bh=dwvF5IXFxheLGtHJwEBV8hj410W9zZhbiJkuKyvC/7E=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=JpDTgTFsAq45depS6oNm5+uGftDdlQ1MAnIOPRJfPCpTOaL70KC6u3qrb6vAOgnyF2g6HQLieKKj2mkRh4eXrecDBi5vhH4xsst2m+nGBPCZjVvgtFuLgr58krI5AaDKGpbmMbmNvaSzt93NusCylNGdLe0JU1V4x7U+6Hnmg22NJcsMIge6F2GYYz9ndIVcmXFg1HhuGMWs2O0C5efYu26JVpIQ9f02gZJarqnm7wgSLXtCPXeduftahmTxc6YwSh9br954TO/HSjm5CsNW8zrexLYBkt2HJFgxT6sKrTi7tc6lvTJNSFMcUA6TLJZwRXxa3V6f9FQ0JyGb728c/A==
X-YMail-OSG: 4PXjc.QVM1mipgaiULtM_pFdsG.GKyXFDyGWQ6WZpiXOqchOGYZe3LVFRAJJ5Au
 M7WSoPI0ftFeNZOaO.qOL2WZrudPyJTWhvrJ8FQNAaMkRh6IDe.htE1abegSF2MneaqOLulPvP7K
 xK7A_y1KDO0Yz3UeMcQAp_E3t1hCH7EnbsUB3viEsvTvg9eKSBBy_f1YUOfazpf6R_207MtRa281
 8rYxHw0mpKtlndifhSTjrlFARXstuXiGDqvSdXa6QFPlESG7RyyRchng4hZZnOrevyyUlyt5JxMl
 T3eU7MW4SvEfJMZTStdgOP3OPYqFM4AXj0KBh5iUBpBEzeHwfCtgRY3dk8hJ06QhCe28qIfaiIp1
 aP53Zpfk_1VR20YVdVWJqH.WyUEXO3JXkXgBaj27V5lkH2MbLMdvkJGfHIa18IY35zMFhcmMxwEV
 YW52Ma9mwWCv112wLrmB9N0jGYrFSGphgqNiG30Imbl013S6hHd.UZ1_XcTt67TxWrohn2EkNkgD
 4AoISVkssX.LykGlAnzGJQlejtCbbwrA.4HI8gPhZd4lmosE5UD9royQm7zT8HYXEemgITYQz9.V
 0ha8klw.HogjJQf5E_3z9_3UEx3X6blIYTIUzzo9A091sSo9.u1nIpH_qOY8qxbN0enVXuzEyeYC
 .ca_tqXT0fak4cL79g6MRfo3hHfvLbjqmxiKfGvsi6aWs0fE2j.g3ruFWWihvNC9.4epgdWt3GDm
 p9qz75nJqE9LlZm0LRmGFxFFmoOy2xLeiHKFDLztYLtQAxDvrFUUb8Qo4ls1yooKzQyAdAGdJ7aT
 H6ObQd2u7RdtGkZxdip7CrwQCwC9u98WdA23I9jQdQUwwzMPDhkv1C1aC7.CV8xoKJFW2BwhkczL
 8iJr1p1t.mE4kOPhYX8OhqjMAiDcVSIwQRoDkdDKGcdT6LCigwKLwzChaq1.UGcfwAH.LTT7LbQp
 K5lsOCAn8xQt2dD7V093vL7FSnwY8OeyyiNbdBcc24x.f2E35QEMzyQZ0YGo77vPn5AzKJxA1XuN
 aW84bCs.0FCNKJiDK8umMt5pLndJ5kW4UMxg1S.uF8yn_qBh393ZXcwoeG5izlcxxFiMkqqZksYc
 d.vk6SmEkSZJs_Jv9mYHrSC4WaXmWeM0gjO00RKp16URn8fzU.JME7xaQkX3jEmQwyJP3y8zR3XD
 AvEqTso7ZY.0VSHvsaWO8plmO_aggfG73jPGUarylDnD5VsOmjEQW5A3in8VA33d1pwDv6daDVth
 7PIgiAYyaD4A_ETwvByhGp2FiUHMvTe4sX.L975Yvs4MuGHFDIQ8CO6bn8OnkVSOEHE6aeE42mlp
 FGDQIcmsENOMWIucS4Frt29Li.0E2WbEAIF3AddWAQX2xUYsBOg59vHsO4FG5lxXQ3iiug6s0jSC
 u2uXIdZd5v9d2mEw7RC134lk0hSfhoNRl3KgHcOLQG2XPoNqluGVz3VScNg0I7sqZAFd49OhIG29
 3QBIlJLNt0wk.hvJDjO2OenTHdWzQZCgVlHdKRvTCUbzF.t6sVr3SWBzsdHpzrloeRbUsD9Dni4l
 rJRmL1GSYxgKjzpqNpJALMAU1Pl_.iVjRB6e5zJlW7x9zY3TOdvNuZ6D3JHAnq6uNLHh8ay4zODl
 .WwFq5AEVOj6lJnFjtd6DU1MjGGfc6GLH.S2RVdde7I9B0sI.Waj42QasW_qfQsba2UgX5YP8uaW
 gFWATVUB6DM1v7GYv4tS8vc9M9lMLQSSKm1QP3bNRqD0N_7vUaXMNHhjHr0ztUcBxenm3vL9XAM9
 J0_NVBt3uYWKZv.5e1TxFxFZBTiqSWRcIgSOxvDmPTZHSxdm41PcTJLsb2QUCqQRksy2WyXl0xI1
 mDP0rlgb2z2BkJ225w9RSf0fOyVT9JmLGQ9JMPzJrn6G02z7Vx2MdGmNVSzFPKKp2XVtQYWHnyWF
 vkBg.etAfGynfqY8gFj_cGJ5vBw9aV1WeIzL_v2XE4zLnKMY94vRMr2awllqmFtjcgqxeOP9odek
 hA4.2yScXvibWlywqxulO7XgjKuaACLwX2b8f5iwYiyZjHhPF68kSSbdMs_ZYEu81CEjH9SX_zYK
 _ly11ilPlwOp.p4MHov174fjcKRbU4bFe4n_HKEL07RO6g3SHKSMPulBl6M0bJLRUvYssct26gJG
 Metr3ZueWBmwPTof1NejlDcpLXA7kZFhzKHXP55up2u2RnDTh.7tkyO0hR4gh
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Jane Chu <jane.chu@oracle.com>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH] x86/PAT: Report PAT on CPUs that support PAT without MTRR
Date: Tue, 12 Jul 2022 14:20:37 -0400
Message-Id: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz.ref@aol.com>

The commit 99c13b8c8896d7bcb92753bf
("x86/mm/pat: Don't report PAT on CPUs that don't support it")
incorrectly failed to account for the case in init_cache_modes() when
CPUs do support PAT and falsely reported PAT to be disabled when in
fact PAT is enabled. In some environments, notably in Xen PV domains,
MTRR is disabled but PAT is still enabled, and that is the case
that the aforementioned commit failed to account for.

As an unfortunate consequnce, the pat_enabled() function currently does
not correctly report that PAT is enabled in such environments. The fix
is implemented in init_cache_modes() by setting pat_bp_enabled to true
in init_cache_modes() for the case that commit 99c13b8c8896d7bcb92753bf
("x86/mm/pat: Don't report PAT on CPUs that don't support it") failed
to account for.

This patch fixes a regression that some users are experiencing with
Linux as a Xen Dom0 driving particular Intel graphics devices by
correctly reporting to the Intel i915 driver that PAT is enabled where
previously it was falsely reporting that PAT is disabled.

Fixes: 99c13b8c8896d7bcb92753bf ("x86/mm/pat: Don't report PAT on CPUs that don't support it")
Cc: stable@vger.kernel.org
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Reminder: This patch is a regression fix that is needed on stable
versions 5.17 and later.

 arch/x86/mm/pat/memtype.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index d5ef64ddd35e..0f2417bd1b40 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -315,6 +315,18 @@ void init_cache_modes(void)
 		      PAT(4, WB) | PAT(5, WT) | PAT(6, UC_MINUS) | PAT(7, UC);
 	}
 
+	else if (!pat_bp_enabled) {
+	/*
+	 * In some environments, specifically Xen PV, PAT
+	 * initialization is skipped because MTRRs are disabled even
+	 * though PAT is available. In such environments, set PAT to
+	 * enabled to correctly indicate to callers of pat_enabled()
+	 * that CPU support for PAT is available.
+	 */
+	pat_bp_enabled = true;
+	pr_info("x86/PAT: PAT enabled by init_cache_modes\n");
+	}
+
 	__init_cache_modes(pat);
 }
 
-- 
2.36.1


