Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0F7351B6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550957.860202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBtg-0003Ob-AQ; Mon, 19 Jun 2023 10:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550957.860202; Mon, 19 Jun 2023 10:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBtg-0003Lo-7Z; Mon, 19 Jun 2023 10:14:08 +0000
Received: by outflank-mailman (input) for mailman id 550957;
 Mon, 19 Jun 2023 10:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jc0u=CH=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qBBtf-0003Li-8V
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:14:07 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 048e8d42-0e8a-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 12:14:04 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5JADuG4a
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 19 Jun 2023 12:13:56 +0200 (CEST)
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
X-Inumbo-ID: 048e8d42-0e8a-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1687169636; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=P02EYdu7j6DvSaHjFMcd6+7gUasutufVpAUCzW0G9n78PmEv1RVR/pQ4cyQXhN8H3b
    YkGo0ZQF8H/p5RAkb+eiGDRyC69hcxAheguy5r3OVDlQQWzlmvx7WZhOPCxgLQhZW+Vd
    xwyCvmTgok9TPCHYruyz0L+6KlIrIZe0W/p95P+uSLcUNysxiU5tF0Bb7DLMB2+ZVu2N
    ikyTgePKzJQ00f+iQwY+FcufjsOpNX+60X4RhORt2DWCkO/OeN9xyLaN704rcmRi1ff0
    ofgCZpFcEacYDM++6D56YKSR8Jmc5s2gItj/FTXQK0kg9tQQFmrPFkrZb0f6tVmxKGkR
    oGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1687169636;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VNcHvctWuhvVLIU2ZeYNxzVLo/+gbcCAb0hM5X+2FWQ=;
    b=iPjenJDJFnOB+azVdyiF4epJdge7sqQ1YOJBAOv7vD+gbeFH/Kq/pGI+YtoxPmawRX
    ehrbpfZRR4WcjbYF0LCqSBZA0pgy9pSJmVS6+xHsOH1YzmOeQOhxhLaBFHbd4ED9AMMk
    diAv0QaSL4QymtBFm5Edol7rLBUpkdiXkmELk/hDhHfMuRZ0H1U8ISgMUumnV/HkEjY8
    SnBvxmgQtlxrE+Ynj6e3PiJMFn3k7Mp3E/C/vB2yAaFcGiVamFdOJKiPxpElOKt7xyxJ
    Yui8D1KrCdCcvhFKyXdoGD0l0pJee36kF23lUEL90SA0lnacFBqurxiioGTyHz4L89t+
    xVig==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1687169636;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VNcHvctWuhvVLIU2ZeYNxzVLo/+gbcCAb0hM5X+2FWQ=;
    b=coVLWIF+H9QzgZ3Je5yAce9jCGSG5j34A2frMr7xAEJ+1/zyWunpVBqbmaT9kanEK2
    N6cpfa5/pej72iD0BOUhhbMBtD7kkbywfEYymqKrdsHmBkj87siYSqbY7erzZZEArWjr
    wcw4I56xsuz67bpQ9vXQddhzuTDR7zJRyp9WghHr4wS0uM6pDdqSst7DsArVcTg3n9MU
    GVXDdc18WOsPi3lP3kSzaDD9txyOV1rLxuwyleNMjN1232OTGBmCFjUaYRbq2P1n2qpx
    VcYSOHKwAeWEolyeEjpQLChGduNnFyjmBrB4cxCleRCmSLLBZZ0ShmknV6onViVVwZFr
    AjGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1687169636;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VNcHvctWuhvVLIU2ZeYNxzVLo/+gbcCAb0hM5X+2FWQ=;
    b=hioHoJ/lg9LgZt+bWtHm6mbGN/cJvWAq35MgcL10k8FvBckwujWEGYk1jSX2ybEHsK
    5T5d6/P7EFi8vDGntfAw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Mon, 19 Jun 2023 12:13:49 +0200
From: Olaf Hering <olaf@aepfle.de>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Juergen
 Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: xentrace buffer size, maxcpus and online cpus
Message-ID: <20230619121349.2327bcff.olaf@aepfle.de>
In-Reply-To: <CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
	<578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
	<20230530220613.4c4da5cc.olaf@aepfle.de>
	<1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
	<20230616134708.6b3c6964.olaf@aepfle.de>
	<b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
	<CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OBMPjOKCTrdJ8z8p0pJWsR3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/OBMPjOKCTrdJ8z8p0pJWsR3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 16 Jun 2023 15:22:24 +0100 George Dunlap <george.dunlap@cloud.com>:

> I agree; the clear implication is that with smt=3D0, you might have
> num_online_cpus() return 4, but cpuids that look like {1, 3, 5, 7}; so you
> need the trace buffer array to be of size 8.

I have tested the patch below with this cmdline:
conring_size=3D32M loglvl=3Dall guest_loglvl=3Dall crashkernel=3D264M,below=
=3D4G
console=3Dcom1 com1=3D115200 dom0_mem=3D16G dom0_max_vcpus=3D8 dom0_vcpus_p=
in
maxcpus=3D10 console_timestamps=3Ddatems tbuf_size=3D-1 smt=3D0

It appears to work as expected. One downside is that xenalyze reports
each cpu it finds based on index, instead of the real smp_processor_id.
That is apparently a limitation of the interface. In the end this detail
may not matter.

I think this change should go on top of a revert of
commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39.

Regarding coding style: can this_cpu and per_cpu be used as array index,
or is a temporary variable required? This would affect the number of
lines changed in next_record.


Olaf

--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -53,6 +53,7 @@ integer_param("tevt_mask", opt_tevt_mask);
 static struct t_info *t_info;
 static unsigned int t_info_pages;
=20
+static DEFINE_PER_CPU_READ_MOSTLY(uint16_t, t_info_mfn_offset);
 static DEFINE_PER_CPU_READ_MOSTLY(struct t_buf *, t_bufs);
 static DEFINE_PER_CPU_READ_MOSTLY(spinlock_t, t_lock);
 static u32 data_size __read_mostly;
@@ -110,7 +111,8 @@ static int calculate_tbuf_size(unsigned int pages, uint=
16_t t_info_first_offset)
     struct t_info dummy_pages;
     typeof(dummy_pages.tbuf_size) max_pages;
     typeof(dummy_pages.mfn_offset[0]) max_mfn_offset;
-    unsigned int max_cpus =3D nr_cpu_ids;
+    unsigned int nr_cpus =3D num_online_cpus();
+    unsigned int max_cpus =3D nr_cpus;
     unsigned int t_info_words;
=20
     /* force maximum value for an unsigned type */
@@ -148,11 +150,11 @@ static int calculate_tbuf_size(unsigned int pages, ui=
nt16_t t_info_first_offset)
      * NB this calculation is correct, because t_info_first_offset is
      * in words, not bytes
      */
-    t_info_words =3D nr_cpu_ids * pages + t_info_first_offset;
+    t_info_words =3D nr_cpus * pages + t_info_first_offset;
     t_info_pages =3D PFN_UP(t_info_words * sizeof(uint32_t));
     printk(XENLOG_INFO "xentrace: requesting %u t_info pages "
            "for %u trace pages on %u cpus\n",
-           t_info_pages, pages, nr_cpu_ids);
+           t_info_pages, pages, nr_cpus);
     return pages;
 }
=20
@@ -173,6 +175,7 @@ static int alloc_trace_bufs(unsigned int pages)
     uint32_t *t_info_mfn_list;
     uint16_t t_info_first_offset;
     uint16_t offset;
+    uint16_t index =3D 0;
=20
     if ( t_info )
         return -EBUSY;
@@ -201,8 +204,9 @@ static int alloc_trace_bufs(unsigned int pages)
      */
     for_each_online_cpu(cpu)
     {
-        offset =3D t_info_first_offset + (cpu * pages);
-        t_info->mfn_offset[cpu] =3D offset;
+        per_cpu(t_info_mfn_offset, cpu) =3D index;
+        offset =3D t_info_first_offset + (index * pages);
+        t_info->mfn_offset[index] =3D offset;
=20
         for ( i =3D 0; i < pages; i++ )
         {
@@ -216,6 +220,7 @@ static int alloc_trace_bufs(unsigned int pages)
             }
             t_info_mfn_list[offset + i] =3D virt_to_mfn(p);
         }
+        index++;
     }
=20
     /*
@@ -227,7 +232,8 @@ static int alloc_trace_bufs(unsigned int pages)
=20
         spin_lock_init(&per_cpu(t_lock, cpu));
=20
-        offset =3D t_info->mfn_offset[cpu];
+        index =3D per_cpu(t_info_mfn_offset, cpu);
+        offset =3D t_info->mfn_offset[index];
=20
         /* Initialize the buffer metadata */
         per_cpu(t_bufs, cpu) =3D buf =3D mfn_to_virt(t_info_mfn_list[offse=
t]);
@@ -260,7 +266,8 @@ static int alloc_trace_bufs(unsigned int pages)
 out_dealloc:
     for_each_online_cpu(cpu)
     {
-        offset =3D t_info->mfn_offset[cpu];
+        index =3D per_cpu(t_info_mfn_offset, cpu);
+        offset =3D t_info->mfn_offset[index];
         if ( !offset )
             continue;
         for ( i =3D 0; i < pages; i++ )
@@ -509,6 +516,7 @@ static unsigned char *next_record(const struct t_buf *b=
uf, uint32_t *next,
     uint32_t per_cpu_mfn_nr;
     uint32_t *mfn_list;
     uint32_t mfn;
+    uint16_t index;
     unsigned char *this_page;
=20
     barrier(); /* must read buf->prod and buf->cons only once */
@@ -527,7 +535,8 @@ static unsigned char *next_record(const struct t_buf *b=
uf, uint32_t *next,
=20
     /* offset into array of mfns */
     per_cpu_mfn_nr =3D x >> PAGE_SHIFT;
-    per_cpu_mfn_offset =3D t_info->mfn_offset[smp_processor_id()];
+    index =3D this_cpu(t_info_mfn_offset);
+    per_cpu_mfn_offset =3D t_info->mfn_offset[index];
     mfn_list =3D (uint32_t *)t_info;
     mfn =3D mfn_list[per_cpu_mfn_offset + per_cpu_mfn_nr];
     this_page =3D mfn_to_virt(mfn);

--Sig_/OBMPjOKCTrdJ8z8p0pJWsR3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSQKl0ACgkQ86SN7mm1
DoCHUw//avv+34mjKw6ltkeitL9cgZNCsdf8a3ct5TSweSVZ4/+7jl8ueBu4RMIB
Yqw7XrLImBYE4QdlAvz6gATQ9nHxLylq+nP+4Ckq2NuG1NvkMsAEOA6MtxTzdlSX
/8wnQsrXWEUkrZInwrsBGi1PU9zyVpjy/jzkfsQ470SvSKLx6SP+t6eI0FlhLdge
jB9VDh/fDDFNgnofP4tzhwJ2mTi83a/bSmTuJB3Y/7jJ4fbngY1D2ICsdnlgNaY3
DE++H7zFus9xWFnlBb8gyOdaW2pgZcfl80e2o1A92HNfFV6KFmmmvJPlwIg+WTIQ
JrpTtB3VnlZUx72P5FsKYEWP+ZlSDssYgoN9uDpfyDJXQX1NVcagiz90juLNmKIT
4x4a+FNYGUrifATUxSnPYfBffwH9HSAEmhKt1wNo7r/6xnzXQqy+WUXxLvhunoQH
qxCCtF2TUlxO1+JxGOQ2FgLCKWAY3EjwhNxUafhx9fEPo+EoE76Se1Ka0gZZPpaw
IHMz2h+M7UeFFZNoRuQPn7XH0/WH4o11N5iFoncB+gpcn+ghLQHba7N2tjJN5v3U
L0G4qMXGxUxahFedvxaLQKu7oaE6BrOSl4H0+Hmt7RZPSU0i3uEC8uhji8OqTz8b
hfYZfGHok2GKLyTg1Dtntmn/38vchY5YZQ0/zCwrBbvizSGCXbM=
=nP4D
-----END PGP SIGNATURE-----

--Sig_/OBMPjOKCTrdJ8z8p0pJWsR3--

