Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694ACAA7B89
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 23:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975133.1362804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAyHF-0006GD-Ly; Fri, 02 May 2025 21:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975133.1362804; Fri, 02 May 2025 21:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAyHF-0006ER-I9; Fri, 02 May 2025 21:50:37 +0000
Received: by outflank-mailman (input) for mailman id 975133;
 Fri, 02 May 2025 21:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4xJ8=XS=atlas.cz=arkamar@srs-se1.protection.inumbo.net>)
 id 1uAyHE-0005xo-0C
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 21:50:36 +0000
Received: from gmmr-2.centrum.cz (gmmr-2.centrum.cz [46.255.227.203])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a2914dc-279f-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 23:50:35 +0200 (CEST)
Received: from gmmr-2.centrum.cz (localhost [127.0.0.1])
 by gmmr-2.centrum.cz (Postfix) with ESMTP id 027C82025F8E
 for <xen-devel@lists.xenproject.org>; Fri,  2 May 2025 23:50:35 +0200 (CEST)
Received: from antispam36.centrum.cz (antispam36.cent [10.30.208.36])
 by gmmr-2.centrum.cz (Postfix) with ESMTP id 00D8520258BE
 for <xen-devel@lists.xenproject.org>; Fri,  2 May 2025 23:50:35 +0200 (CEST)
Received: from unknown (HELO gm-smtp11.centrum.cz) ([46.255.227.75])
 by antispam36.centrum.cz with ESMTP; 02 May 2025 23:50:34 +0200
Received: from localhost.localdomain (ip-213-220-240-96.bb.vodafone.cz
 [213.220.240.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by gm-smtp11.centrum.cz (Postfix) with ESMTPSA id 13CC1100AE2B1;
 Fri,  2 May 2025 23:50:34 +0200 (CEST)
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
X-Inumbo-ID: 7a2914dc-279f-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1746222635; bh=ozFHTCk4j8th6UsxDGZ1WDBrNh7xmpTX2eWy7wAljlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4FEM3JGIrnZUMEfaDNN4lLtq3jG8CBtt9p2l3PNZSJhiv8qfCVMpHfR0bbsIh/JV
	 Id4I8Iug9fwqPWBYNZoi7HS9gPAQQ6SANhY+20NvRJzaRmMg5sccXIQfab35WiXC1l
	 uXVI7Xgk2j4V/tCgnd88IUEXzI5j/x6NyAK2fE3Q=
X-CSE-ConnectionGUID: 5OJCA9afS+OGGX4cGo5iwQ==
X-CSE-MsgGUID: qonAHIxLSja2i0+mAlbagQ==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EzAAB0PRVo/0vj/y5aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFACYFKgzSBcoRVkXGLeYYzi3+Bag8BAQEBAQEBAQEJU?=
 =?us-ascii?q?QQBAT+ESAKLOSc4EwECBAEBAQEDAgMBAQEBAQEBAQENAQEGAQEBAQEBBgYBA?=
 =?us-ascii?q?oEdhTVTgmIBhAAGIwQLAUYQGA0CJgICVgcSgwKCMAEDMbMpfzMaAmXccAJJB?=
 =?us-ascii?q?VVkgSmBGy4BiE8BhHxwhHdCgg2EB3aEGw6DdYJpBIMvFIQthDOBQ4NegmeCI?=
 =?us-ascii?q?IsjSIEFHANZLAFVEw0KCwcFgWkDKgsMCxIcFW4zHYIPhR+CD4IEiQ6ETS1Ph?=
 =?us-ascii?q?TGBKkdAAwsYDUgRLDcUGwY9AW4HlVKDZQcBYypDCXhmk2qQB6BjgQeBPoQlh?=
 =?us-ascii?q?E6cfRoeFZdTHgOSZS6HZZBtIqNzN4RpgX6BfzMiMIMiUhnRaXY8AgcBCgEBA?=
 =?us-ascii?q?wmCO41PM4FLAQE?=
IronPort-PHdr: A9a23:Y0vQYBcFz/vqoLQ3dKYCiZoUlGM+k9jLVj580XLHo4xHfqnrxZn+J
 kuXvawr0ASTG92DoKgb0LeI+4nbGkU+or+5+EgYd5JNUxJXwe43pCcHROOjNwjQAcWuURYHG
 t9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oI
 xi7oxvdutMKjYd+Jao91BnEr3VIdulX2GhlOU+dkxHg68i/+5Ju7z5esO87+c5aVqX6caU4T
 bhGAzkjLms4+s7luwTdQAWW/ncSXX0YnRVRDwXb4x/0Q4/9vSTmuOVz3imaJtD2QqsvWTu+9
 adrSQTnhzkBOjUk7WzYkM1wjKZcoBK8uxxyxpPfbY+JOPZieK7WYMgXTnRdUMlPSyNBA5u8b
 4oRAOoHIeZYtJT2q18XoRejGQWgGObjxzlVjXH0wKI6yfwsHwHY0gE+AtwAvnfaotL3O6ccX
 u+60KbGwC7fb/5Vwzrx9JLFfgwjrPyKQLl+cdDRyU4qFw7dlFuft5DlPymI3esCqWeb6fRlV
 eGygGMgsQ5xuDuvyd0piobTnIIY0UrL9Tl9wIkvPt20UlJ0YN+9HZZWqiqVOJd4TNk4TGF0p
 CY11KcGuZijcSQX1JgqyB7RZ+GDfoaI/x/uSOafLzh3iX9meb+yiBm//0ijx+DiWce501RHo
 yREn9TMuX0Byh/e58qGR/dg/Uqs3yuE2QPL6uxcLk05lLDXJ4Ahz7MwjJYfr1rPEy3slEj0j
 KKablso9vWm5uj9fLnquIOQO5VqhgzxLqgigMiyDOU+PwMTRWaU4/6826fm/UDhRbVKieA5n
 bfBvZDBIMQbura5AwhI0oY/8xq/Dymp0NAfnXQfI1JFfQuLj5PsO1HSOPD0EOqzj06wnzh1w
 fDGIqfhAojILnTZjLjgfK5x609ayAUt0dBS/51ZB7AbLP7tWkL8tMbUAgEnPwG22erqCtVw2
 psbWW2VA6+ZNK3SsUWP5uIqO+SDfpUVuDXnJPgg/fHul2Q0lkUBfamtx5QXc2q0EehnIkmBe
 3rjns8BEXsWvgo5VOHqkl2DXiRVZ3qoRaI84So0B5y8DYffXYCgm6aO3D2+HpFMem9GDVWMH
 W/yd4qYQ/cMdD6SIsh5nzMeT7ihSJUu1RS0uw/g0LdoNPbU+ikCupL4ztR6++zSmQko9TNoF
 8Sdz32NT2Zsk2IHRDI73btyoU9jxVeZ16h3nfhYGcZU5/NTXQc2LYTcwPBiC9DuRgLBec+ES
 FKnQtWgHDEwQcs9w9oLY0tmGNWikArM0DapA7MPkLyLHpM0/rrG33ftP8Z912rG1K45glY8Q
 ctPLWimi7V79wjSAY7JjkqYm7+kdaQbwS7N8nqMwnCSvEFZVw5wV7/JXXcFZkvZtdj5/F/NT
 6eyCbQ7NQtM0cGDJbVMatHwkFpJWunjN8raY2+qn2ewBA2Ixq+XbIbwdGQSwiPdCFAekwAU/
 3aJKxQxBju7r2LZFjxuGkrjY1nw/ulmtHO7Ukg0whmXYEJ7ybq1+wMaiOeGS/wNw70EuD0uq
 yluEFmh2NLWDsKMpxB9c6VEfdM9/FBH2Hrdtwx8OJygMq9jikcdcwtppUPu0Qt4CoFbnMg0o
 3Ml0hByJbib0FxfbTOY247/OrnNJmn15hCvZP2e5laL1NeQ57dK7fEQqEvqtwLvEVAttz1j0
 t9Iwz6f64/MAQ46T538SAA0+gJ8qrWcZTMytK3O0ng5CaSoqHf80tSKB6NxwwyjdtJWKouNC
 Av7CIsRFZ79e6QRh1G1Y0dcb6hp/6kuMpbjLqPesJM=
IronPort-Data: A9a23:EEiIx6qbBnVAyP7+dphWhKp2FPpeBmLuZBIvgKrLsJaIsI4StFCzt
 garIBmPaayDazOjc49+bonk/BsA7ZLTzdNlHQdopXpnHy5D+ePIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7wdOWn9D8kiPzgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Ji5OZYQLNNwJcaDpOtvre8Ek35pwehRtB1rAATaEW1LPhvyZNZH4vDfnZB2f1RIBSAtm7S
 47rpJml/nnU9gsaEdislLD2aCUiGtY+6iDT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWaqYEl51Y/KWyIzxZDEDe812FfUuFLYquhFTu+TLp6HNWyOEL/mDkCjalGDXkwp6KTgmy
 BAWFNwCRk2kpcmfkbu1capLqesTcMLEO94epUg1mFk1Dd5+KXzCa6rPoMRdwC9p34ZFEPDCf
 dccLzF9BPjCS0ERfA1KVdRkxrju2SSXnz5w8Tp5oYI++WvayQVr+LHxNNPOPNeYLSlQth/B9
 jiXpD6jU3n2MvSGzjys0lO8otTNlHn6AMEXPbmy//FT1Qj7Kms7TUd+uUGAieOog0j4QdVVJ
 lYI4QInt610/0uuJvH0RR6xpXeelhcAX9NLVeYogCmdmvT84AuDAGUACDlbZ7QOsM4wWCxv0
 1qhnM3gDj8pt6eaIVqU9a+RhTezPzUFaGEFeCkIRBcE5N+lp5s85jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vqz6luJnFZhQ46gXeQiSu6QYRTIqkYZG4rFvW9/BNKK6HQVSb+
 nsJgc6T6KYJF57lvDeRSe8JEZm36Pufdj7Rm1hiG98m7TvFxpK4VdwOpmsjeQEzaJlCJmKBj
 FLvhD69LaR7ZBOCBZKbqaroYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:jGD9paHeST9gu3fKpLqE5ceALOsnbusQ8zAXPo5KJSC9Ffbo8P
 xG/c5rsSMc5wx+ZJhNo7q90ey7MBDhHP1OkOws1NWZPTUO0VHAROpfBMnZsl/d8kbFmdK1u5
 0MT0EHMr3NMWQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AX0yZnmvMULluB+31Nv6Q1w6K6It4VV/25SbZLXT?=
 =?us-ascii?q?7LklGeOGeZljN+bxdxp8=3D?=
X-Talos-MUID: 9a23:b/dQSATKcsKi3LnZRXT1gzdLFOZ4x5+sARoMydYDks2OPCNJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.15,257,1739833200"; 
   d="scan'208";a="118293229"
From: =?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
Subject: [PATCH v2 1/1] mm: fix folio_pte_batch() on XEN PV
Date: Fri,  2 May 2025 23:50:19 +0200
Message-ID: <20250502215019.822-2-arkamar@atlas.cz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250502215019.822-1-arkamar@atlas.cz>
References: <20250502215019.822-1-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On XEN PV, folio_pte_batch() can incorrectly batch beyond the end of a
folio due to a corner case in pte_advance_pfn(). Specifically, when the
PFN following the folio maps to an invalidated MFN,

	expected_pte = pte_advance_pfn(expected_pte, nr);

produces a pte_none(). If the actual next PTE in memory is also
pte_none(), the pte_same() succeeds,

	if (!pte_same(pte, expected_pte))
		break;

the loop is not broken, and batching continues into unrelated memory.

For example, with a 4-page folio, the PTE layout might look like this:

[   53.465673] [ T2552] folio_pte_batch: printing PTE values at addr=0x7f1ac9dc5000
[   53.465674] [ T2552]   PTE[453] = 000000010085c125
[   53.465679] [ T2552]   PTE[454] = 000000010085d125
[   53.465682] [ T2552]   PTE[455] = 000000010085e125
[   53.465684] [ T2552]   PTE[456] = 000000010085f125
[   53.465686] [ T2552]   PTE[457] = 0000000000000000 <-- not present
[   53.465689] [ T2552]   PTE[458] = 0000000101da7125

pte_advance_pfn(PTE[456]) returns a pte_none() due to invalid PFN->MFN
mapping. The next actual PTE (PTE[457]) is also pte_none(), so the loop
continues and includes PTE[457] in the batch, resulting in 5 batched
entries for a 4-page folio. This triggers the following warning:

[   53.465751] [ T2552] page: refcount:85 mapcount:20 mapping:ffff88813ff4f6a8 index:0x110 pfn:0x10085c
[   53.465754] [ T2552] head: order:2 mapcount:80 entire_mapcount:0 nr_pages_mapped:4 pincount:0
[   53.465756] [ T2552] memcg:ffff888003573000
[   53.465758] [ T2552] aops:0xffffffff8226fd20 ino:82467c dentry name(?):"libc.so.6"
[   53.465761] [ T2552] flags: 0x2000000000416c(referenced|uptodate|lru|active|private|head|node=0|zone=2)
[   53.465764] [ T2552] raw: 002000000000416c ffffea0004021f08 ffffea0004021908 ffff88813ff4f6a8
[   53.465767] [ T2552] raw: 0000000000000110 ffff888133d8bd40 0000005500000013 ffff888003573000
[   53.465768] [ T2552] head: 002000000000416c ffffea0004021f08 ffffea0004021908 ffff88813ff4f6a8
[   53.465770] [ T2552] head: 0000000000000110 ffff888133d8bd40 0000005500000013 ffff888003573000
[   53.465772] [ T2552] head: 0020000000000202 ffffea0004021701 000000040000004f 00000000ffffffff
[   53.465774] [ T2552] head: 0000000300000003 8000000300000002 0000000000000013 0000000000000004
[   53.465775] [ T2552] page dumped because: VM_WARN_ON_FOLIO((_Generic((page + nr_pages - 1), const struct page *: (const struct folio *)_compound_head(page + nr_pages - 1), struct page *: (struct folio *)_compound_head(page + nr_pages - 1))) != folio)

Original code works as expected everywhere, except on XEN PV, where
pte_advance_pfn() can yield a pte_none() after balloon inflation due to
MFNs invalidation. In XEN, pte_advance_pfn() ends up calling
__pte()->xen_make_pte()->pte_pfn_to_mfn(), which returns pte_none() when
mfn == INVALID_P2M_ENTRY.

The pte_pfn_to_mfn() documents that nastiness:

	If there's no mfn for the pfn, then just create an
	empty non-present pte.  Unfortunately this loses
	information about the original pfn, so
	pte_mfn_to_pfn is asymmetric.

While such hacks should certainly be removed, we can do better in
folio_pte_batch() and simply check ahead of time how many PTEs we can
possibly batch in our folio.

This way, we can not only fix the issue but cleanup the code: removing the
pte_pfn() check inside the loop body and avoiding end_ptr comparison +
arithmetic.

Fixes: f8d937761d65 ("mm/memory: optimize fork() with PTE-mapped THP")
Cc: stable@vger.kernel.org
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
---
 mm/internal.h | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index e9695baa5922..25a29872c634 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -248,11 +248,9 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
 		bool *any_writable, bool *any_young, bool *any_dirty)
 {
-	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
-	const pte_t *end_ptep = start_ptep + max_nr;
 	pte_t expected_pte, *ptep;
 	bool writable, young, dirty;
-	int nr;
+	int nr, cur_nr;
 
 	if (any_writable)
 		*any_writable = false;
@@ -265,11 +263,15 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
 	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
 
+	/* Limit max_nr to the actual remaining PFNs in the folio we could batch. */
+	max_nr = min_t(unsigned long, max_nr,
+		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
+
 	nr = pte_batch_hint(start_ptep, pte);
 	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
 	ptep = start_ptep + nr;
 
-	while (ptep < end_ptep) {
+	while (nr < max_nr) {
 		pte = ptep_get(ptep);
 		if (any_writable)
 			writable = !!pte_write(pte);
@@ -282,14 +284,6 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 		if (!pte_same(pte, expected_pte))
 			break;
 
-		/*
-		 * Stop immediately once we reached the end of the folio. In
-		 * corner cases the next PFN might fall into a different
-		 * folio.
-		 */
-		if (pte_pfn(pte) >= folio_end_pfn)
-			break;
-
 		if (any_writable)
 			*any_writable |= writable;
 		if (any_young)
@@ -297,12 +291,13 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 		if (any_dirty)
 			*any_dirty |= dirty;
 
-		nr = pte_batch_hint(ptep, pte);
-		expected_pte = pte_advance_pfn(expected_pte, nr);
-		ptep += nr;
+		cur_nr = pte_batch_hint(ptep, pte);
+		expected_pte = pte_advance_pfn(expected_pte, cur_nr);
+		ptep += cur_nr;
+		nr += cur_nr;
 	}
 
-	return min(ptep - start_ptep, max_nr);
+	return min(nr, max_nr);
 }
 
 /**
-- 
2.48.1


