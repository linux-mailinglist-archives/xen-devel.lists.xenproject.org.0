Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D48A1135A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 22:46:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872094.1283053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXojS-0002Ks-Nn; Tue, 14 Jan 2025 21:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872094.1283053; Tue, 14 Jan 2025 21:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXojS-0002IG-Jk; Tue, 14 Jan 2025 21:45:54 +0000
Received: by outflank-mailman (input) for mailman id 872094;
 Tue, 14 Jan 2025 21:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/+J=UG=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1tXojQ-0002Gw-N5
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 21:45:53 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaacbd48-d2c0-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 22:45:50 +0100 (CET)
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 13:45:47 -0800
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.124.223.199])
 ([10.124.223.199])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 13:45:42 -0800
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
X-Inumbo-ID: eaacbd48-d2c0-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736891151; x=1768427151;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=FiKf+CBG14D8HJTJEsGFPQ/VuBsXxEyfgK3jkw1jBxs=;
  b=DPZFgt3KBClQEz3NrDsQRToHSeBuGhGyPwPUc0VipYKX1U2lSZrNhvpG
   /QvWEFRxD3ioKErBDgDNzUHNomjyDby+1LOgJPzcgFloyizbpZUdgm5Mp
   lCuEA7UD0TihfNfZ0P85FZRI/T8uScJL9EGrTPwrscaZe4WZqBuLgozrK
   nZQcdDE2OZNra/i/0RBv45gnAzGS+wBYyFcmb8PAK+zH28EtXNAhaS+po
   9ts0mV6VzXuCMwDZ1LXFohFpKm/UMpHJdaTmaLNsPUZYra7g1PyzZMURt
   WAseHSTw1vwqf40yeKKhA438uZ8gxWhuh/KZTqYTIFyyMh2qvZaxGNQB3
   g==;
X-CSE-ConnectionGUID: L86KXOKtRfK+Va0vMQ+jDg==
X-CSE-MsgGUID: Ci0A0mUVRBuOLZX9X56WKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47874059"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="47874059"
X-CSE-ConnectionGUID: wClD8OzMQai+UBG5Nw361Q==
X-CSE-MsgGUID: vzPbyt3kQ96Xavq3f7i4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105422933"
Content-Type: multipart/mixed; boundary="------------n0n6ZXEhGiQA3ZVqsLB2u14D"
Message-ID: <52311c3d-83cf-4dc4-bbcb-5fbca8eb249c@intel.com>
Date: Tue, 14 Jan 2025 13:45:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/30] x86,tlb: Make __flush_tlb_global()
 noinstr-compliant
To: Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>,
 Yair Podemsky <ypodemsk@redhat.com>, Tomas Glozar <tglozar@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Yosry Ahmed <yosryahmed@google.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Jinghao Jia <jinghao7@illinois.edu>, Luis Chamberlain <mcgrof@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-27-vschneid@redhat.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250114175143.81438-27-vschneid@redhat.com>

This is a multi-part message in MIME format.
--------------n0n6ZXEhGiQA3ZVqsLB2u14D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/14/25 09:51, Valentin Schneider wrote:
> +	cr4 = this_cpu_read(cpu_tlbstate.cr4);
> +	asm volatile("mov %0,%%cr4": : "r" (cr4 ^ X86_CR4_PGE) : "memory");
> +	asm volatile("mov %0,%%cr4": : "r" (cr4) : "memory");
> +	/*
> +	 * In lieu of not having the pinning crap, hard fail if CR4 doesn't
> +	 * match the expected value. This ensures that anybody doing dodgy gets
> +	 * the fallthrough check.
> +	 */
> +	BUG_ON(cr4 != this_cpu_read(cpu_tlbstate.cr4));

Let's say someone managed to write to cpu_tlbstate.cr4 where they
cleared one of the pinned bits.

Before this patch, CR4 pinning would WARN_ONCE() about it pretty quickly
and also reset the cleared bits.

After this patch, the first native_flush_tlb_global() can clear pinned
bits, at least until native_write_cr4() gets called the next time. That
seems like it'll undermine CR4 pinning at least somewhat.

What keeps native_write_cr4() from being noinstr-compliant now? Is it
just the WARN_ONCE()?

If so, I'd kinda rather have a native_write_cr4_nowarn() that's
noinstr-compliant but retains all the other CR4 pinning behavior. Would
something like the attached patch be _worse_?
--------------n0n6ZXEhGiQA3ZVqsLB2u14D
Content-Type: text/x-patch; charset=UTF-8; name="cr4.patch"
Content-Disposition: attachment; filename="cr4.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvY29tbW9uLmMgYi9hcmNoL3g4Ni9r
ZXJuZWwvY3B1L2NvbW1vbi5jCmluZGV4IDNlOTAzNzY5MDgxNC4uMjA0NGQ1MTZmMDZmIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jCisrKyBiL2FyY2gveDg2
L2tlcm5lbC9jcHUvY29tbW9uLmMKQEAgLTQyMywyNCArNDIzLDQwIEBAIHZvaWQgbmF0aXZl
X3dyaXRlX2NyMCh1bnNpZ25lZCBsb25nIHZhbCkKIH0KIEVYUE9SVF9TWU1CT0wobmF0aXZl
X3dyaXRlX2NyMCk7CiAKLXZvaWQgX19ub19wcm9maWxlIG5hdGl2ZV93cml0ZV9jcjQodW5z
aWduZWQgbG9uZyB2YWwpCit2b2lkIF9fbm9fcHJvZmlsZSBfX25hdGl2ZV93cml0ZV9jcjQo
dW5zaWduZWQgbG9uZyB2YWwsIHVuc2lnbmVkIGxvbmcgKmJpdHNfY2hhbmdlZCkKIHsKLQl1
bnNpZ25lZCBsb25nIGJpdHNfY2hhbmdlZCA9IDA7Ci0KIHNldF9yZWdpc3RlcjoKIAlhc20g
dm9sYXRpbGUoIm1vdiAlMCwlJWNyNCI6ICIrciIgKHZhbCkgOiA6ICJtZW1vcnkiKTsKIAog
CWlmIChzdGF0aWNfYnJhbmNoX2xpa2VseSgmY3JfcGlubmluZykpIHsKIAkJaWYgKHVubGlr
ZWx5KCh2YWwgJiBjcjRfcGlubmVkX21hc2spICE9IGNyNF9waW5uZWRfYml0cykpIHsKLQkJ
CWJpdHNfY2hhbmdlZCA9ICh2YWwgJiBjcjRfcGlubmVkX21hc2spIF4gY3I0X3Bpbm5lZF9i
aXRzOworCQkJKmJpdHNfY2hhbmdlZCA9ICh2YWwgJiBjcjRfcGlubmVkX21hc2spIF4gY3I0
X3Bpbm5lZF9iaXRzOwogCQkJdmFsID0gKHZhbCAmIH5jcjRfcGlubmVkX21hc2spIHwgY3I0
X3Bpbm5lZF9iaXRzOwogCQkJZ290byBzZXRfcmVnaXN0ZXI7CiAJCX0KLQkJLyogV2FybiBh
ZnRlciB3ZSd2ZSBjb3JyZWN0ZWQgdGhlIGNoYW5nZWQgYml0cy4gKi8KLQkJV0FSTl9PTkNF
KGJpdHNfY2hhbmdlZCwgInBpbm5lZCBDUjQgYml0cyBjaGFuZ2VkOiAweCVseCE/XG4iLAot
CQkJICBiaXRzX2NoYW5nZWQpOwogCX0KIH0KKwordm9pZCBfX25vX3Byb2ZpbGUgbmF0aXZl
X3dyaXRlX2NyNCh1bnNpZ25lZCBsb25nIHZhbCkKK3sKKwl1bnNpZ25lZCBsb25nIGJpdHNf
Y2hhbmdlZCA9IDA7CisKKwlfX25hdGl2ZV93cml0ZV9jcjQodmFsLCAmYml0c19jaGFuZ2Vk
KTsKKworCWlmICghYml0c19jaGFuZ2VkKQorCQlyZXR1cm4KKworCVdBUk5fT05DRShiaXRz
X2NoYW5nZWQsICJwaW5uZWQgQ1I0IGJpdHMgY2hhbmdlZDogMHglbHghP1xuIiwKKwkJICBi
aXRzX2NoYW5nZWQpOworfQorCit2b2lkIF9fbm9fcHJvZmlsZSBuYXRpdmVfd3JpdGVfY3I0
X25vd2Fybih1bnNpZ25lZCBsb25nIHZhbCkKK3sKKwl1bnNpZ25lZCBsb25nIGJpdHNfY2hh
bmdlZCA9IDA7CisKKwlfX25hdGl2ZV93cml0ZV9jcjQodmFsLCAmYml0c19jaGFuZ2VkKTsK
K30KKwogI2lmIElTX01PRFVMRShDT05GSUdfTEtEVE0pCiBFWFBPUlRfU1lNQk9MX0dQTChu
YXRpdmVfd3JpdGVfY3I0KTsKICNlbmRpZgo=

--------------n0n6ZXEhGiQA3ZVqsLB2u14D--

