Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E878A9AE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 12:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591424.923823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaZDl-0002de-I2; Mon, 28 Aug 2023 10:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591424.923823; Mon, 28 Aug 2023 10:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaZDl-0002av-FD; Mon, 28 Aug 2023 10:11:45 +0000
Received: by outflank-mailman (input) for mailman id 591424;
 Mon, 28 Aug 2023 10:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qaZDk-0002ap-PG
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 10:11:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 486d1662-458b-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 12:11:41 +0200 (CEST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by support.bugseng.com (Postfix) with ESMTPSA id 05D034EE074E
 for <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 12:11:41 +0200 (CEST)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-48d10c504a8so1182100e0c.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 03:11:40 -0700 (PDT)
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
X-Inumbo-ID: 486d1662-458b-11ee-8783-cb3800f73035
X-Gm-Message-State: AOJu0Yz/+I6s4pKRenFzRHP7L7SB0/XoyVyr8WPdtpMyN1WJcAU7bN8n
	AZiWMjJA/Z3Tu0umlxc4Ofw3A21+J7LQR6BSyws=
X-Google-Smtp-Source: AGHT+IFS/kfS0Yg8QBXnPirkUnUUBjFVDnp2YymJcKzMbffbiuQ7RxjGY+obi1/scnt8wYZE9VH2NoBNqpC/Xugt3tE=
X-Received: by 2002:a05:6102:291f:b0:44e:d6c3:51d4 with SMTP id
 cz31-20020a056102291f00b0044ed6c351d4mr502593vsb.18.1693217499727; Mon, 28
 Aug 2023 03:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690368810.git.simone.ballarin@bugseng.com> <6c2473a29d60460bf69382fd1e983752634b6992.1690368810.git.simone.ballarin@bugseng.com>
In-Reply-To: <6c2473a29d60460bf69382fd1e983752634b6992.1690368810.git.simone.ballarin@bugseng.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Mon, 28 Aug 2023 12:11:28 +0200
X-Gmail-Original-Message-ID: <CAFHJcJugNy_dp8tiUz52Z4Vus+saYX-=sqgG+-dLvrg=7PngHw@mail.gmail.com>
Message-ID: <CAFHJcJugNy_dp8tiUz52Z4Vus+saYX-=sqgG+-dLvrg=7PngHw@mail.gmail.com>
Subject: Re: [XEN PATCH v4 1/4] x86/vmx: address violations of MISRA C:2012
 Rule 7.2
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000994e5e0603f8eb9e"

--000000000000994e5e0603f8eb9e
Content-Type: text/plain; charset="UTF-8"

On 27 Jul 2023, Jan Beulich wrote:

On 26.07.2023 13:03, Simone Ballarin wrote:
> >* @@ -70,15 +70,15 @@ static const uint8_t sr_mask[8] = {*
> >*  };*
> >
> >*  static const uint8_t gr_mask[9] = {*
> >* -    (uint8_t)~0xf0, /* 0x00 */*
> >* -    (uint8_t)~0xf0, /* 0x01 */*
> >* -    (uint8_t)~0xf0, /* 0x02 */*
> >* -    (uint8_t)~0xe0, /* 0x03 */*
> >* -    (uint8_t)~0xfc, /* 0x04 */*
> >* -    (uint8_t)~0x84, /* 0x05 */*
> >* -    (uint8_t)~0xf0, /* 0x06 */*
> >* -    (uint8_t)~0xf0, /* 0x07 */*
> >* -    (uint8_t)~0x00, /* 0x08 */*
> >* +    (uint8_t)~0xf0,*
> >* +    (uint8_t)~0xf0,*
> >* +    (uint8_t)~0xf0,*
> >* +    (uint8_t)~0xe0,*
> >* +    (uint8_t)~0xfc,*
> >* +    (uint8_t)~0x84,*
> >* +    (uint8_t)~0xf0,*
> >* +    (uint8_t)~0xf0,*
> >* +    (uint8_t)~0x00,*
> >*  };*
>
> Hmm, this stray change is _still_ there.
>
> Ok. Sorry for that.

> >* --- a/xen/arch/x86/include/asm/hvm/trace.h*
> >* +++ b/xen/arch/x86/include/asm/hvm/trace.h*
> >* @@ -58,7 +58,7 @@*
> >*  #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC*
> >
> >
> >* -#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)*
> >* +#define TRC_PAR_LONG(par) ((uint32_t)par), ((par) >> 32)*
>
> You've lost parentheses around "par".
>
> >* @@ -93,7 +93,7 @@*
> >*      HVMTRACE_ND(evt, 0, 0)*
> >
> >*  #define HVMTRACE_LONG_1D(evt, d1)                  \*
> >* -                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)*
> >* +                   HVMTRACE_2D(evt ## 64, (uint32_t)d1, (d1) >> 32)*
>
> Same for "d1" here.
>
> Both of these are, btw., indications that you should have dropped Stefano's
> R-b.
>
> Ok.

> >* --- a/xen/arch/x86/include/asm/msr-index.h*
> >* +++ b/xen/arch/x86/include/asm/msr-index.h*
> >* @@ -30,7 +30,7 @@*
> >
> >*  #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035*
> >*  #define  MSR_CTC_THREAD_MASK                0x0000ffff*
> >* -#define  MSR_CTC_CORE_MASK                  0xffff0000*
> >* +#define  MSR_CTC_CORE_MASK                  0xffff0000U*
> >
> >*  #define MSR_SPEC_CTRL                       0x00000048*
> >*  #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) <<  0)*
> >* @@ -168,7 +168,7 @@*
> >*  #define MSR_UARCH_MISC_CTRL                 0x00001b01*
> >*  #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)*
> >
> >* -#define MSR_EFER                            0xc0000080 /* Extended Feature *
> >* Enable Register */*
> >* +#define MSR_EFER                            _AC(0xc0000080, U)  /* Extended *
> >* Feature Enable Register */*
>
> I understand you use _AC() here because the constant is used in assembly
> code. But I don't understand why you use it only here, and not throughout
> at least the "modern" portion of the file. I wonder what other x86
> maintainers think about this.
>
> I've used _AC only when strictly required to avoid errors.
In v5 I will use _AC on all constants in the "modern" part of the file.

> As a minor aspect, I also don't really see why you insert a 2nd blank
> ahead of the comment.
>
> To align the comment with the others below.
I see that comment aligning is not done in this file, so I will drop the
change in v5.

> >*  #define  EFER_SCE                           (_AC(1, ULL) <<  0) /* SYSCALL *
> >* Enable */*
> >*  #define  EFER_LME                           (_AC(1, ULL) <<  8) /* Long Mode *
> >* Enable */*
> >*  #define  EFER_LMA                           (_AC(1, ULL) << 10) /* Long Mode *
> >* Active */*
> >* @@ -181,35 +181,35 @@*
> >*      (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE | \*
> >*       EFER_AIBRSE)*
> >
> >* -#define MSR_STAR                            0xc0000081 /* legacy mode *
> >* SYSCALL target */*
> >* -#define MSR_LSTAR                           0xc0000082 /* long mode SYSCALL *
> >* target */*
> >* -#define MSR_CSTAR                           0xc0000083 /* compat mode *
> >* SYSCALL target */*
> >* -#define MSR_SYSCALL_MASK                    0xc0000084 /* EFLAGS mask for *
> >* syscall */*
> >* -#define MSR_FS_BASE                         0xc0000100 /* 64bit FS base */*
> >* -#define MSR_GS_BASE                         0xc0000101 /* 64bit GS base */*
> >* -#define MSR_SHADOW_GS_BASE                  0xc0000102 /* SwapGS GS shadow */*
> >* -#define MSR_TSC_AUX                         0xc0000103 /* Auxiliary TSC */*
> >* +#define MSR_STAR                            0xc0000081U /* legacy mode *
> >* SYSCALL target */*
> >* +#define MSR_LSTAR                           0xc0000082U /* long mode SYSCALL *
> >* target */*
> >* +#define MSR_CSTAR                           0xc0000083U /* compat mode *
> >* SYSCALL target */*
> >* +#define MSR_SYSCALL_MASK                    0xc0000084U /* EFLAGS mask for *
> >* syscall */*
> >* +#define MSR_FS_BASE                         0xc0000100U /* 64bit FS base */*
> >* +#define MSR_GS_BASE                         0xc0000101U /* 64bit GS base */*
> >* +#define MSR_SHADOW_GS_BASE                  0xc0000102U /* SwapGS GS shadow *
> >* */*
> >* +#define MSR_TSC_AUX                         0xc0000103U /* Auxiliary TSC */*
> >
> >* -#define MSR_K8_SYSCFG                       0xc0010010*
> >* +#define MSR_K8_SYSCFG                       0xc0010010U*
> >*  #define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)*
> >*  #define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)*
> >*  #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)*
> >*  #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)*
> >*  #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)*
> >
> >* -#define MSR_K8_IORR_BASE0                   0xc0010016*
> >* -#define MSR_K8_IORR_MASK0                   0xc0010017*
> >* -#define MSR_K8_IORR_BASE1                   0xc0010018*
> >* -#define MSR_K8_IORR_MASK1                   0xc0010019*
> >* +#define MSR_K8_IORR_BASE0                   0xc0010016U*
> >* +#define MSR_K8_IORR_MASK0                   0xc0010017U*
> >* +#define MSR_K8_IORR_BASE1                   0xc0010018U*
> >* +#define MSR_K8_IORR_MASK1                   0xc0010019U*
> >
> >* -#define MSR_K8_TSEG_BASE                    0xc0010112 /* AMD doc: SMMAddr */*
> >* -#define MSR_K8_TSEG_MASK                    0xc0010113 /* AMD doc: SMMMask */*
> >* +#define MSR_K8_TSEG_BASE                    0xc0010112U /* AMD doc: SMMAddr *
> >* */*
> >* +#define MSR_K8_TSEG_MASK                    0xc0010113U /* AMD doc: SMMMask *
> >* */*
> >
> >* -#define MSR_K8_VM_CR                        0xc0010114*
> >* +#define MSR_K8_VM_CR                        0xc0010114U*
> >*  #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)*
> >*  #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)*
> >
> >* -#define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches *
> >* MSR_SPEC_CTRL */*
> >* +#define MSR_VIRT_SPEC_CTRL                  0xc001011fU /* Layout matches *
> >* MSR_SPEC_CTRL */*
> >
> >*  /**
> >*   * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.*
>
> (As to above remark: This is the separator between "modern" [above]
> and "historic" [below].)
>
> Jan
>
>

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000994e5e0603f8eb9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr"><pre>On 27 Jul 2023, Jan Beulich wrote:</pre>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr" cl=
ass=3D"gmail_attr"><pre>On 26.07.2023 13:03, Simone Ballarin wrote:
&gt;<i> @@ -70,15 +70,15 @@ static const uint8_t sr_mask[8] =3D {</i>
&gt;<i>  };</i>
&gt;<i>  </i>
&gt;<i>  static const uint8_t gr_mask[9] =3D {</i>
&gt;<i> -    (uint8_t)~0xf0, /* 0x00 */</i>
&gt;<i> -    (uint8_t)~0xf0, /* 0x01 */</i>
&gt;<i> -    (uint8_t)~0xf0, /* 0x02 */</i>
&gt;<i> -    (uint8_t)~0xe0, /* 0x03 */</i>
&gt;<i> -    (uint8_t)~0xfc, /* 0x04 */</i>
&gt;<i> -    (uint8_t)~0x84, /* 0x05 */</i>
&gt;<i> -    (uint8_t)~0xf0, /* 0x06 */</i>
&gt;<i> -    (uint8_t)~0xf0, /* 0x07 */</i>
&gt;<i> -    (uint8_t)~0x00, /* 0x08 */</i>
&gt;<i> +    (uint8_t)~0xf0,</i>
&gt;<i> +    (uint8_t)~0xf0,</i>
&gt;<i> +    (uint8_t)~0xf0,</i>
&gt;<i> +    (uint8_t)~0xe0,</i>
&gt;<i> +    (uint8_t)~0xfc,</i>
&gt;<i> +    (uint8_t)~0x84,</i>
&gt;<i> +    (uint8_t)~0xf0,</i>
&gt;<i> +    (uint8_t)~0xf0,</i>
&gt;<i> +    (uint8_t)~0x00,</i>
&gt;<i>  };</i>

Hmm, this stray change is _still_ there.</pre></div></blockquote><div>Ok. S=
orry for that. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr" class=3D"gmail_attr"><pre>&gt;<i> --- a/xen/arch/x86/inclu=
de/asm/hvm/trace.h</i>
&gt;<i> +++ b/xen/arch/x86/include/asm/hvm/trace.h</i>
&gt;<i> @@ -58,7 +58,7 @@</i>
&gt;<i>  #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC</i>
&gt;<i>  </i>
&gt;<i>  </i>
&gt;<i> -#define TRC_PAR_LONG(par) ((par)&amp;0xFFFFFFFF),((par)&gt;&gt;32)=
</i>
&gt;<i> +#define TRC_PAR_LONG(par) ((uint32_t)par), ((par) &gt;&gt; 32)</i>

You&#39;ve lost parentheses around &quot;par&quot;.

&gt;<i> @@ -93,7 +93,7 @@</i>
&gt;<i>      HVMTRACE_ND(evt, 0, 0)</i>
&gt;<i>  </i>
&gt;<i>  #define HVMTRACE_LONG_1D(evt, d1)                  \</i>
&gt;<i> -                   HVMTRACE_2D(evt ## 64, (d1) &amp; 0xFFFFFFFF, (=
d1) &gt;&gt; 32)</i>
&gt;<i> +                   HVMTRACE_2D(evt ## 64, (uint32_t)d1, (d1) &gt;&=
gt; 32)</i>

Same for &quot;d1&quot; here.

Both of these are, btw., indications that you should have dropped Stefano&#=
39;s
R-b.</pre></div></blockquote><div>Ok. <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr" class=3D"gmail_attr"><pre>&gt;<i> -=
-- a/xen/arch/x86/include/asm/msr-index.h</i>
&gt;<i> +++ b/xen/arch/x86/include/asm/msr-index.h</i>
&gt;<i> @@ -30,7 +30,7 @@</i>
&gt;<i>  </i>
&gt;<i>  #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035</i>
&gt;<i>  #define  MSR_CTC_THREAD_MASK                0x0000ffff</i>
&gt;<i> -#define  MSR_CTC_CORE_MASK                  0xffff0000</i>
&gt;<i> +#define  MSR_CTC_CORE_MASK                  0xffff0000U</i>
&gt;<i>  </i>
&gt;<i>  #define MSR_SPEC_CTRL                       0x00000048</i>
&gt;<i>  #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) &lt;&lt; =
 0)</i>
&gt;<i> @@ -168,7 +168,7 @@</i>
&gt;<i>  #define MSR_UARCH_MISC_CTRL                 0x00001b01</i>
&gt;<i>  #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) &lt;&lt; =
 0)</i>
&gt;<i>  </i>
&gt;<i> -#define MSR_EFER                            0xc0000080 /* Extended=
 Feature </i>
&gt;<i> Enable Register */</i>
&gt;<i> +#define MSR_EFER                            _AC(0xc0000080, U)  /*=
 Extended </i>
&gt;<i> Feature Enable Register */</i>

I understand you use _AC() here because the constant is used in assembly
code. But I don&#39;t understand why you use it only here, and not througho=
ut
at least the &quot;modern&quot; portion of the file. I wonder what other x8=
6
maintainers think about this.</pre></div></blockquote><div>I&#39;ve used _A=
C only when strictly required to avoid errors.<br></div><div>In v5 I will u=
se _AC on all constants in the &quot;modern&quot; part of the file.<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr" class=
=3D"gmail_attr"><pre>As a minor aspect, I also don&#39;t really see why you=
 insert a 2nd blank
ahead of the comment.</pre></div></blockquote><div>To align the comment wit=
h the others below.</div><div>I see that comment aligning is not done in th=
is file, so I will drop the change in v5.<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr" class=3D"gmail_attr"><pre>&gt;<i=
>  #define  EFER_SCE                           (_AC(1, ULL) &lt;&lt;  0) /*=
 SYSCALL </i>
&gt;<i> Enable */</i>
&gt;<i>  #define  EFER_LME                           (_AC(1, ULL) &lt;&lt; =
 8) /* Long Mode </i>
&gt;<i> Enable */</i>
&gt;<i>  #define  EFER_LMA                           (_AC(1, ULL) &lt;&lt; =
10) /* Long Mode </i>
&gt;<i> Active */</i>
&gt;<i> @@ -181,35 +181,35 @@</i>
&gt;<i>      (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_=
FFXSE | \</i>
&gt;<i>       EFER_AIBRSE)</i>
&gt;<i>  </i>
&gt;<i> -#define MSR_STAR                            0xc0000081 /* legacy m=
ode </i>
&gt;<i> SYSCALL target */</i>
&gt;<i> -#define MSR_LSTAR                           0xc0000082 /* long mod=
e SYSCALL </i>
&gt;<i> target */</i>
&gt;<i> -#define MSR_CSTAR                           0xc0000083 /* compat m=
ode </i>
&gt;<i> SYSCALL target */</i>
&gt;<i> -#define MSR_SYSCALL_MASK                    0xc0000084 /* EFLAGS m=
ask for </i>
&gt;<i> syscall */</i>
&gt;<i> -#define MSR_FS_BASE                         0xc0000100 /* 64bit FS=
 base */</i>
&gt;<i> -#define MSR_GS_BASE                         0xc0000101 /* 64bit GS=
 base */</i>
&gt;<i> -#define MSR_SHADOW_GS_BASE                  0xc0000102 /* SwapGS G=
S shadow */</i>
&gt;<i> -#define MSR_TSC_AUX                         0xc0000103 /* Auxiliar=
y TSC */</i>
&gt;<i> +#define MSR_STAR                            0xc0000081U /* legacy =
mode </i>
&gt;<i> SYSCALL target */</i>
&gt;<i> +#define MSR_LSTAR                           0xc0000082U /* long mo=
de SYSCALL </i>
&gt;<i> target */</i>
&gt;<i> +#define MSR_CSTAR                           0xc0000083U /* compat =
mode </i>
&gt;<i> SYSCALL target */</i>
&gt;<i> +#define MSR_SYSCALL_MASK                    0xc0000084U /* EFLAGS =
mask for </i>
&gt;<i> syscall */</i>
&gt;<i> +#define MSR_FS_BASE                         0xc0000100U /* 64bit F=
S base */</i>
&gt;<i> +#define MSR_GS_BASE                         0xc0000101U /* 64bit G=
S base */</i>
&gt;<i> +#define MSR_SHADOW_GS_BASE                  0xc0000102U /* SwapGS =
GS shadow </i>
&gt;<i> */</i>
&gt;<i> +#define MSR_TSC_AUX                         0xc0000103U /* Auxilia=
ry TSC */</i>
&gt;<i>  </i>
&gt;<i> -#define MSR_K8_SYSCFG                       0xc0010010</i>
&gt;<i> +#define MSR_K8_SYSCFG                       0xc0010010U</i>
&gt;<i>  #define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) &lt;&lt; =
18)</i>
&gt;<i>  #define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) &lt;&lt; =
19)</i>
&gt;<i>  #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) &lt;&lt; =
20)</i>
&gt;<i>  #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) &lt;&lt; =
21)</i>
&gt;<i>  #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) &lt;&lt; =
22)</i>
&gt;<i>  </i>
&gt;<i> -#define MSR_K8_IORR_BASE0                   0xc0010016</i>
&gt;<i> -#define MSR_K8_IORR_MASK0                   0xc0010017</i>
&gt;<i> -#define MSR_K8_IORR_BASE1                   0xc0010018</i>
&gt;<i> -#define MSR_K8_IORR_MASK1                   0xc0010019</i>
&gt;<i> +#define MSR_K8_IORR_BASE0                   0xc0010016U</i>
&gt;<i> +#define MSR_K8_IORR_MASK0                   0xc0010017U</i>
&gt;<i> +#define MSR_K8_IORR_BASE1                   0xc0010018U</i>
&gt;<i> +#define MSR_K8_IORR_MASK1                   0xc0010019U</i>
&gt;<i>  </i>
&gt;<i> -#define MSR_K8_TSEG_BASE                    0xc0010112 /* AMD doc:=
 SMMAddr */</i>
&gt;<i> -#define MSR_K8_TSEG_MASK                    0xc0010113 /* AMD doc:=
 SMMMask */</i>
&gt;<i> +#define MSR_K8_TSEG_BASE                    0xc0010112U /* AMD doc=
: SMMAddr </i>
&gt;<i> */</i>
&gt;<i> +#define MSR_K8_TSEG_MASK                    0xc0010113U /* AMD doc=
: SMMMask </i>
&gt;<i> */</i>
&gt;<i>  </i>
&gt;<i> -#define MSR_K8_VM_CR                        0xc0010114</i>
&gt;<i> +#define MSR_K8_VM_CR                        0xc0010114U</i>
&gt;<i>  #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) &lt;&lt; =
 1)</i>
&gt;<i>  #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) &lt;&lt; =
 4)</i>
&gt;<i>  </i>
&gt;<i> -#define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout m=
atches </i>
&gt;<i> MSR_SPEC_CTRL */</i>
&gt;<i> +#define MSR_VIRT_SPEC_CTRL                  0xc001011fU /* Layout =
matches </i>
&gt;<i> MSR_SPEC_CTRL */</i>
&gt;<i>  </i>
&gt;<i>  /*</i>
&gt;<i>   * Legacy MSR constants in need of cleanup.  No new MSRs below thi=
s comment.</i>

(As to above remark: This is the separator between &quot;modern&quot; [abov=
e]
and &quot;historic&quot; [below].)

Jan</pre></div></blockquote></div><br clear=3D"all"><br><span class=3D"gmai=
l_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr">Simone Ballarin, M.Sc.<br><br><div>Field Application Eng=
ineer, BUGSENG (<a href=3D"http://bugseng.com" target=3D"_blank">https://bu=
gseng.com</a>)</div></div></div></div>

--000000000000994e5e0603f8eb9e--

