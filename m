Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEE16D96EE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 14:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518884.805861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkOZ2-0002zy-Ue; Thu, 06 Apr 2023 12:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518884.805861; Thu, 06 Apr 2023 12:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkOZ2-0002wu-RM; Thu, 06 Apr 2023 12:18:04 +0000
Received: by outflank-mailman (input) for mailman id 518884;
 Thu, 06 Apr 2023 12:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkOZ0-0002wo-L0
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 12:18:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d84c89-d475-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 14:17:59 +0200 (CEST)
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
X-Inumbo-ID: 10d84c89-d475-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680783479;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kLcrD6Qx/8oKyhJYXTcLhHRibh3zjUkt2HxDgLq/hoo=;
  b=fpbF+zfMqGb3S/LWSVfuA3cx2OxWT0k40ByJnRa52Jfk8vT8ZY3ENxKv
   oB3fetyL1J2hfz/2gOY/fm7KgJ8mtqI50BiQgUsIvv9GyisokmDFvwPM/
   KMJsCZCr2WEBVQ2esH+VJ3TpGPJzqXhK9NdT1DjRGcsvAY1hEQF+mvkPq
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103918414
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:C4g1DqrxXY7lp2l4gRTEabTcq4ReBmJnZRIvgKrLsJaIsI4StFCzt
 garIBnTbPaCZmD2ft52bYWz90MGvZ6DyNVgTwQ4r3o9RChH8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzydNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC0Obh2Govm2+rucDdZ1md4ncti0GJxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 juepDWgUk1DaLRzzxLc8VWjpvTLtBn9VaMQEab71+x3v2yMkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMY4NnupaQojijGaZFcCbGvioPkRhXvl
 mXiQDcFu1kDsSIa//zlrQiY2W/2+8Ohoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTYu8B66FMYcXPvCdkTNrGwk3PCatM53FyhBwwcnTx
 7/AGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+ieD2TCfMGd843K6mMrhRAFWs/F+Er
 L6y9qKil31ibQEJSnOLqdFJcw5bcyBT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:/Smpl66jdeKQhteUdAPXwPbXdLJyesId70hD6qkRc31om6mj/K
 qTdZsgpHzJYVoqNU3I4OrwXpVoIkmzyXcW2+Us1N6ZNWHbUAHBFvAa0WKI+VLd8kPFltK02c
 9bAspD4NCZNykcsS7xiDPIdurJz7G8gcSVuds=
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="103918414"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/emul: Use existing X86_EXC_* constants
Date: Thu, 6 Apr 2023 13:17:53 +0100
Message-ID: <20230406121753.2205968-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... rather than having separate definitions locally.  EXC_HAS_EC in particular
is missing #CP, #VC and #SX vs X86_EXC_HAVE_EC.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 608 ++++++++++++-------------
 1 file changed, 294 insertions(+), 314 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index c69f7c65f526..8aa23b929c07 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -135,28 +135,6 @@ static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
 /* MXCSR bit definitions. */
 #define MXCSR_MM  (1U << 17)
 
-/* Exception definitions. */
-#define EXC_DE  0
-#define EXC_DB  1
-#define EXC_BP  3
-#define EXC_OF  4
-#define EXC_BR  5
-#define EXC_UD  6
-#define EXC_NM  7
-#define EXC_DF  8
-#define EXC_TS 10
-#define EXC_NP 11
-#define EXC_SS 12
-#define EXC_GP 13
-#define EXC_PF 14
-#define EXC_MF 16
-#define EXC_AC 17
-#define EXC_XM 19
-
-#define EXC_HAS_EC                                                      \
-    ((1u << EXC_DF) | (1u << EXC_TS) | (1u << EXC_NP) |                 \
-     (1u << EXC_SS) | (1u << EXC_GP) | (1u << EXC_PF) | (1u << EXC_AC))
-
 /* Segment selector error code bits. */
 #define ECODE_EXT (1 << 0)
 #define ECODE_IDT (1 << 1)
@@ -360,11 +338,11 @@ do {                                                                    \
 #define validate_far_branch(cs, ip) ({                                  \
     if ( sizeof(ip) <= 4 ) {                                            \
         ASSERT(!ctxt->lma);                                             \
-        generate_exception_if((ip) > (cs)->limit, EXC_GP, 0);           \
+        generate_exception_if((ip) > (cs)->limit, X86_EXC_GP, 0);       \
     } else                                                              \
         generate_exception_if(ctxt->lma && (cs)->l                      \
                               ? !is_canonical_address(ip)               \
-                              : (ip) > (cs)->limit, EXC_GP, 0);         \
+                              : (ip) > (cs)->limit, X86_EXC_GP, 0);     \
 })
 
 #define commit_far_branch(cs, newip) ({                                 \
@@ -431,7 +409,7 @@ int x86emul_get_fpu(
                 return rc;
             generate_exception_if(!(cr4 & ((type == X86EMUL_FPU_xmm)
                                            ? X86_CR4_OSFXSR : X86_CR4_OSXSAVE)),
-                                  EXC_UD);
+                                  X86_EXC_UD);
         }
 
         rc = ops->read_cr(0, &cr0, ctxt);
@@ -444,13 +422,13 @@ int x86emul_get_fpu(
         }
         if ( cr0 & X86_CR0_EM )
         {
-            generate_exception_if(type == X86EMUL_FPU_fpu, EXC_NM);
-            generate_exception_if(type == X86EMUL_FPU_mmx, EXC_UD);
-            generate_exception_if(type == X86EMUL_FPU_xmm, EXC_UD);
+            generate_exception_if(type == X86EMUL_FPU_fpu, X86_EXC_NM);
+            generate_exception_if(type == X86EMUL_FPU_mmx, X86_EXC_UD);
+            generate_exception_if(type == X86EMUL_FPU_xmm, X86_EXC_UD);
         }
         generate_exception_if((cr0 & X86_CR0_TS) &&
                               (type != X86EMUL_FPU_wait || (cr0 & X86_CR0_MP)),
-                              EXC_NM);
+                              X86_EXC_NM);
     }
 
  done:
@@ -776,7 +754,7 @@ static int ioport_access_check(
         return rc == X86EMUL_DONE ? X86EMUL_OKAY : rc;
 
     /* Ensure the TSS has an io-bitmap-offset field. */
-    generate_exception_if(tr.type != 0xb, EXC_GP, 0);
+    generate_exception_if(tr.type != 0xb, X86_EXC_GP, 0);
 
     switch ( rc = read_ulong(x86_seg_tr, 0x66, &iobmp, 2, ctxt, ops) )
     {
@@ -784,7 +762,7 @@ static int ioport_access_check(
         break;
 
     case X86EMUL_EXCEPTION:
-        generate_exception_if(!ctxt->event_pending, EXC_GP, 0);
+        generate_exception_if(!ctxt->event_pending, X86_EXC_GP, 0);
         /* fallthrough */
 
     default:
@@ -799,7 +777,7 @@ static int ioport_access_check(
         break;
 
     case X86EMUL_EXCEPTION:
-        generate_exception_if(!ctxt->event_pending, EXC_GP, 0);
+        generate_exception_if(!ctxt->event_pending, X86_EXC_GP, 0);
         /* fallthrough */
 
     default:
@@ -807,7 +785,7 @@ static int ioport_access_check(
     }
 
     generate_exception_if(iobmp & (((1 << bytes) - 1) << (first_port & 7)),
-                          EXC_GP, 0);
+                          X86_EXC_GP, 0);
 
  done:
     return rc;
@@ -854,7 +832,7 @@ protmode_load_seg(
     uint8_t dpl, rpl;
     int cpl = x86emul_get_cpl(ctxt, ops);
     uint32_t a_flag = 0x100;
-    int rc, fault_type = EXC_GP;
+    int rc, fault_type = X86_EXC_GP;
 
     if ( cpl < 0 )
         return X86EMUL_UNHANDLEABLE;
@@ -982,7 +960,7 @@ protmode_load_seg(
     /* Segment present in memory? */
     if ( !(desc.b & (1 << 15)) && seg != x86_seg_none )
     {
-        fault_type = seg != x86_seg_ss ? EXC_NP : EXC_SS;
+        fault_type = seg != x86_seg_ss ? X86_EXC_NP : X86_EXC_SS;
         goto raise_exn;
     }
 
@@ -1163,7 +1141,7 @@ static unsigned long *decode_vex_gpr(
     switch ( evex.lr ) \
     { \
     default: \
-        generate_exception(EXC_UD); \
+        generate_exception(X86_EXC_UD); \
     case 2: \
         break; \
     case 0: case 1: \
@@ -1273,7 +1251,7 @@ x86_emulate(
     generate_exception_if((mode_vif() &&
                            (_regs.eflags & X86_EFLAGS_VIF) &&
                            (_regs.eflags & X86_EFLAGS_VIP)),
-                          EXC_GP, 0);
+                          X86_EXC_GP, 0);
 
     rc = x86emul_decode(&state, ctxt, ops);
     if ( rc != X86EMUL_OKAY )
@@ -1302,7 +1280,7 @@ x86_emulate(
 #define state (&state)
     elem_bytes = 4 << evex.w;
 
-    generate_exception_if(state->not_64bit && mode_64bit(), EXC_UD);
+    generate_exception_if(state->not_64bit && mode_64bit(), X86_EXC_UD);
 
     if ( ea.type == OP_REG )
         ea.reg = _decode_gpr(&_regs, modrm_rm, (d & ByteOp) && !rex_prefix && !vex.opcx);
@@ -1420,12 +1398,12 @@ x86_emulate(
         generate_exception_if(lock_prefix &&
                               (vex.opcx || ext != ext_0f || b != 0xc7 ||
                                (modrm_reg & 7) != 1 || ea.type != OP_MEM),
-                              EXC_UD);
+                              X86_EXC_UD);
         dst.type = OP_NONE;
         break;
 
     case DstReg:
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
         dst.type = OP_REG;
         if ( d & ByteOp )
         {
@@ -1477,17 +1455,17 @@ x86_emulate(
         d = (d & ~DstMask) | DstMem;
         /* Becomes a normal DstMem operation from here on. */
     case DstMem:
-        generate_exception_if(ea.type == OP_MEM && evex.z, EXC_UD);
+        generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
         if ( state->simd_size )
         {
-            generate_exception_if(lock_prefix, EXC_UD);
+            generate_exception_if(lock_prefix, X86_EXC_UD);
             break;
         }
         ea.bytes = (d & ByteOp) ? 1 : op_bytes;
         dst = ea;
         if ( dst.type == OP_REG )
         {
-            generate_exception_if(lock_prefix, EXC_UD);
+            generate_exception_if(lock_prefix, X86_EXC_UD);
             switch ( dst.bytes )
             {
             case 1: dst.val = *(uint8_t  *)dst.reg; break;
@@ -1499,7 +1477,7 @@ x86_emulate(
         else if ( d & Mov ) /* optimisation - avoid slow emulated read */
         {
             /* Lock prefix is allowed only on RMW instructions. */
-            generate_exception_if(lock_prefix, EXC_UD);
+            generate_exception_if(lock_prefix, X86_EXC_UD);
             fail_if(!ops->write);
         }
         else if ( !ops->rmw )
@@ -1730,14 +1708,14 @@ x86_emulate(
     case 0x62: /* bound */ {
         int lb, ub, idx;
 
-        generate_exception_if(src.type != OP_MEM, EXC_UD);
+        generate_exception_if(src.type != OP_MEM, X86_EXC_UD);
         if ( (rc = read_ulong(src.mem.seg, truncate_ea(src.mem.off + op_bytes),
                               &ea.val, op_bytes, ctxt, ops)) )
             goto done;
         ub  = (op_bytes == 2) ? (int16_t)ea.val   : (int32_t)ea.val;
         lb  = (op_bytes == 2) ? (int16_t)src.val  : (int32_t)src.val;
         idx = (op_bytes == 2) ? (int16_t)dst.val  : (int32_t)dst.val;
-        generate_exception_if((idx < lb) || (idx > ub), EXC_BR);
+        generate_exception_if((idx < lb) || (idx > ub), X86_EXC_BR);
         dst.type = OP_NONE;
         break;
     }
@@ -1760,7 +1738,7 @@ x86_emulate(
             /* arpl */
             unsigned int src_rpl = dst.val & 3;
 
-            generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+            generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
 
             dst = ea;
             dst.bytes = 2;
@@ -1957,7 +1935,7 @@ x86_emulate(
             dst.type = OP_NONE;
             break;
         }
-        generate_exception_if((modrm_reg & 7) != 0, EXC_UD);
+        generate_exception_if((modrm_reg & 7) != 0, X86_EXC_UD);
     case 0x88 ... 0x8b: /* mov */
     case 0xa0 ... 0xa1: /* mov mem.offs,{%al,%ax,%eax,%rax} */
     case 0xa2 ... 0xa3: /* mov {%al,%ax,%eax,%rax},mem.offs */
@@ -1966,7 +1944,7 @@ x86_emulate(
 
     case 0x8c: /* mov Sreg,r/m */
         seg = modrm_reg & 7; /* REX.R is ignored. */
-        generate_exception_if(!is_x86_user_segment(seg), EXC_UD);
+        generate_exception_if(!is_x86_user_segment(seg), X86_EXC_UD);
     store_selector:
         fail_if(ops->read_segment == NULL);
         if ( (rc = ops->read_segment(seg, &sreg, ctxt)) != 0 )
@@ -1977,14 +1955,14 @@ x86_emulate(
         break;
 
     case 0x8d: /* lea */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         dst.val = ea.mem.off;
         break;
 
     case 0x8e: /* mov r/m,Sreg */
         seg = modrm_reg & 7; /* REX.R is ignored. */
         generate_exception_if(!is_x86_user_segment(seg) ||
-                              seg == x86_seg_cs, EXC_UD);
+                              seg == x86_seg_cs, X86_EXC_UD);
         if ( (rc = load_seg(seg, src.val, 0, NULL, ctxt, ops)) != 0 )
             goto done;
         if ( seg == x86_seg_ss )
@@ -1993,7 +1971,7 @@ x86_emulate(
         break;
 
     case 0x8f: /* pop (sole member of Grp1a) */
-        generate_exception_if((modrm_reg & 7) != 0, EXC_UD);
+        generate_exception_if((modrm_reg & 7) != 0, X86_EXC_UD);
         /* 64-bit mode: POP defaults to a 64-bit operand. */
         if ( mode_64bit() && (dst.bytes == 4) )
             dst.bytes = 8;
@@ -2074,7 +2052,7 @@ x86_emulate(
                 if ( rc != X86EMUL_OKAY )
                     goto done;
             }
-            generate_exception_if(!(cr4 & X86_CR4_VME), EXC_GP, 0);
+            generate_exception_if(!(cr4 & X86_CR4_VME), X86_EXC_GP, 0);
             src.val = (_regs.flags & ~X86_EFLAGS_IF) | X86_EFLAGS_IOPL;
             if ( _regs.eflags & X86_EFLAGS_VIF )
                 src.val |= X86_EFLAGS_IF;
@@ -2104,7 +2082,7 @@ x86_emulate(
                 /* All IOPL != 3 POPFs fail, except in vm86 mode. */
                 generate_exception_if(!(cr4 & X86_CR4_VME) &&
                                       MASK_EXTR(_regs.eflags, X86_EFLAGS_IOPL) != 3,
-                                      EXC_GP, 0);
+                                      X86_EXC_GP, 0);
             }
             /*
              * IOPL cannot be modified outside of CPL 0.  IF cannot be
@@ -2128,11 +2106,11 @@ x86_emulate(
             if ( (cr4 & X86_CR4_VME) &&
                  MASK_EXTR(_regs.eflags, X86_EFLAGS_IOPL) != 3 )
             {
-                generate_exception_if(dst.val & X86_EFLAGS_TF, EXC_GP, 0);
+                generate_exception_if(dst.val & X86_EFLAGS_TF, X86_EXC_GP, 0);
                 if ( dst.val & X86_EFLAGS_IF )
                 {
                     generate_exception_if(_regs.eflags & X86_EFLAGS_VIP,
-                                          EXC_GP, 0);
+                                          X86_EXC_GP, 0);
                     dst.val |= X86_EFLAGS_VIF;
                 }
                 else
@@ -2267,7 +2245,7 @@ x86_emulate(
         break;
 
     case 0xc0 ... 0xc1: grp2: /* Grp2 */
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
 
         switch ( modrm_reg & 7 )
         {
@@ -2307,7 +2285,7 @@ x86_emulate(
     case 0xc5: /* lds */
         seg = (b & 1) * 3; /* es = 0, ds = 3 */
     les:
-        generate_exception_if(src.type != OP_MEM, EXC_UD);
+        generate_exception_if(src.type != OP_MEM, X86_EXC_UD);
         if ( (rc = read_ulong(src.mem.seg, truncate_ea(src.mem.off + src.bytes),
                               &dst.val, 2, ctxt, ops)) != X86EMUL_OKAY )
             goto done;
@@ -2386,7 +2364,7 @@ x86_emulate(
         switch ( ctxt->opcode )
         {
         case 0xcc: /* int3 */
-            ctxt->event.vector = EXC_BP;
+            ctxt->event.vector = X86_EXC_BP;
             ctxt->event.type = X86_EVENTTYPE_SW_EXCEPTION;
             break;
         case 0xcd: /* int imm8 */
@@ -2394,11 +2372,11 @@ x86_emulate(
             ctxt->event.type = X86_EVENTTYPE_SW_INTERRUPT;
             break;
         case 0xce: /* into */
-            ctxt->event.vector = EXC_OF;
+            ctxt->event.vector = X86_EXC_OF;
             ctxt->event.type = X86_EVENTTYPE_SW_EXCEPTION;
             break;
         case 0xf1: /* icebp */
-            ctxt->event.vector = EXC_DB;
+            ctxt->event.vector = X86_EXC_DB;
             ctxt->event.type = X86_EVENTTYPE_PRI_SW_EXCEPTION;
             break;
         }
@@ -2447,7 +2425,7 @@ x86_emulate(
             _regs.ax = (uint8_t)(_regs.al + (_regs.ah * n));
         else
         {
-            generate_exception_if(!n, EXC_DE);
+            generate_exception_if(!n, X86_EXC_DE);
             _regs.al = _regs.al % n;
             _regs.ah = _regs.al / n;
         }
@@ -2551,7 +2529,7 @@ x86_emulate(
         break;
 
     case 0xf4: /* hlt */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         ctxt->retire.hlt = true;
         break;
 
@@ -2670,7 +2648,7 @@ x86_emulate(
                 v    = (uint8_t)src.val;
                 generate_exception_if(
                     div_dbl(u, v) || ((uint8_t)u[0] != (uint16_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (uint8_t)u[0];
                 _regs.ah = u[1];
                 break;
@@ -2680,7 +2658,7 @@ x86_emulate(
                 v    = (uint16_t)src.val;
                 generate_exception_if(
                     div_dbl(u, v) || ((uint16_t)u[0] != (uint32_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (uint16_t)u[0];
                 _regs.dx = u[1];
                 break;
@@ -2691,7 +2669,7 @@ x86_emulate(
                 v    = (uint32_t)src.val;
                 generate_exception_if(
                     div_dbl(u, v) || ((uint32_t)u[0] != u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val   = (uint32_t)u[0];
                 _regs.rdx = (uint32_t)u[1];
                 break;
@@ -2700,7 +2678,7 @@ x86_emulate(
                 u[0] = _regs.r(ax);
                 u[1] = _regs.r(dx);
                 v    = src.val;
-                generate_exception_if(div_dbl(u, v), EXC_DE);
+                generate_exception_if(div_dbl(u, v), X86_EXC_DE);
                 dst.val     = u[0];
                 _regs.r(dx) = u[1];
                 break;
@@ -2715,7 +2693,7 @@ x86_emulate(
                 v    = (int8_t)src.val;
                 generate_exception_if(
                     idiv_dbl(u, v) || ((int8_t)u[0] != (int16_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (int8_t)u[0];
                 _regs.ah = u[1];
                 break;
@@ -2725,7 +2703,7 @@ x86_emulate(
                 v    = (int16_t)src.val;
                 generate_exception_if(
                     idiv_dbl(u, v) || ((int16_t)u[0] != (int32_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (int16_t)u[0];
                 _regs.dx = u[1];
                 break;
@@ -2736,7 +2714,7 @@ x86_emulate(
                 v    = (int32_t)src.val;
                 generate_exception_if(
                     idiv_dbl(u, v) || ((int32_t)u[0] != u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val   = (int32_t)u[0];
                 _regs.rdx = (uint32_t)u[1];
                 break;
@@ -2745,7 +2723,7 @@ x86_emulate(
                 u[0] = _regs.r(ax);
                 u[1] = _regs.r(dx);
                 v    = src.val;
-                generate_exception_if(idiv_dbl(u, v), EXC_DE);
+                generate_exception_if(idiv_dbl(u, v), X86_EXC_DE);
                 dst.val     = u[0];
                 _regs.r(dx) = u[1];
                 break;
@@ -2767,7 +2745,7 @@ x86_emulate(
             _regs.eflags &= ~X86_EFLAGS_IF;
         else
         {
-            generate_exception_if(!mode_vif(), EXC_GP, 0);
+            generate_exception_if(!mode_vif(), X86_EXC_GP, 0);
             _regs.eflags &= ~X86_EFLAGS_VIF;
         }
         break;
@@ -2783,7 +2761,7 @@ x86_emulate(
         {
             generate_exception_if((_regs.eflags & X86_EFLAGS_VIP) ||
 				  !mode_vif(),
-                                  EXC_GP, 0);
+                                  X86_EXC_GP, 0);
             if ( !(_regs.eflags & X86_EFLAGS_VIF) )
                 ctxt->retire.sti = true;
             _regs.eflags |= X86_EFLAGS_VIF;
@@ -2799,7 +2777,7 @@ x86_emulate(
         break;
 
     case 0xfe: /* Grp4 */
-        generate_exception_if((modrm_reg & 7) >= 2, EXC_UD);
+        generate_exception_if((modrm_reg & 7) >= 2, X86_EXC_UD);
         /* Fallthrough. */
     case 0xff: /* Grp5 */
         switch ( modrm_reg & 7 )
@@ -2833,7 +2811,7 @@ x86_emulate(
             break;
         case 3: /* call (far, absolute indirect) */
         case 5: /* jmp (far, absolute indirect) */
-            generate_exception_if(src.type != OP_MEM, EXC_UD);
+            generate_exception_if(src.type != OP_MEM, X86_EXC_UD);
 
             if ( (rc = read_ulong(src.mem.seg,
                                   truncate_ea(src.mem.off + op_bytes),
@@ -2846,20 +2824,20 @@ x86_emulate(
         case 6: /* push */
             goto push;
         case 7:
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
         break;
 
     case X86EMUL_OPC(0x0f, 0x00): /* Grp6 */
         seg = (modrm_reg & 1) ? x86_seg_tr : x86_seg_ldtr;
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         switch ( modrm_reg & 6 )
         {
         case 0: /* sldt / str */
-            generate_exception_if(umip_active(ctxt, ops), EXC_GP, 0);
+            generate_exception_if(umip_active(ctxt, ops), X86_EXC_GP, 0);
             goto store_selector;
         case 2: /* lldt / ltr */
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             if ( (rc = load_seg(seg, src.val, 0, NULL, ctxt, ops)) != 0 )
                 goto done;
             break;
@@ -2877,7 +2855,7 @@ x86_emulate(
             case X86EMUL_EXCEPTION:
                 if ( ctxt->event_pending )
                 {
-                    ASSERT(ctxt->event.vector == EXC_PF);
+                    ASSERT(ctxt->event.vector == X86_EXC_PF);
             default:
                     goto done;
                 }
@@ -2887,7 +2865,7 @@ x86_emulate(
             }
             break;
         default:
-            generate_exception_if(true, EXC_UD);
+            generate_exception_if(true, X86_EXC_UD);
             break;
         }
         break;
@@ -2897,7 +2875,7 @@ x86_emulate(
         goto dispatch_from_helper;
 
     case X86EMUL_OPC(0x0f, 0x02): /* lar */
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         _regs.eflags &= ~X86_EFLAGS_ZF;
         switch ( rc = protmode_load_seg(x86_seg_none, src.val, false, &sreg,
                                         ctxt, ops) )
@@ -2928,7 +2906,7 @@ x86_emulate(
         case X86EMUL_EXCEPTION:
             if ( ctxt->event_pending )
             {
-                ASSERT(ctxt->event.vector == EXC_PF);
+                ASSERT(ctxt->event.vector == X86_EXC_PF);
         default:
                 goto done;
             }
@@ -2945,7 +2923,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x03): /* lsl */
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         _regs.eflags &= ~X86_EFLAGS_ZF;
         switch ( rc = protmode_load_seg(x86_seg_none, src.val, false, &sreg,
                                         ctxt, ops) )
@@ -2973,7 +2951,7 @@ x86_emulate(
         case X86EMUL_EXCEPTION:
             if ( ctxt->event_pending )
             {
-                ASSERT(ctxt->event.vector == EXC_PF);
+                ASSERT(ctxt->event.vector == X86_EXC_PF);
         default:
                 goto done;
             }
@@ -2996,8 +2974,8 @@ x86_emulate(
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
-        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
-        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
+        generate_exception_if((msr_val & EFER_SCE) == 0, X86_EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), X86_EXC_UD);
 
         if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
@@ -3065,7 +3043,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x06): /* clts */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if((ops->read_cr == NULL) || (ops->write_cr == NULL));
         if ( (rc = ops->read_cr(0, &dst.val, ctxt)) != X86EMUL_OKAY ||
              (rc = ops->write_cr(0, dst.val & ~X86_CR0_TS, ctxt)) != X86EMUL_OKAY )
@@ -3081,10 +3059,10 @@ x86_emulate(
         fail_if(!ops->read_msr);
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
-        generate_exception_if(!(msr_val & EFER_SCE), EXC_UD);
-        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
+        generate_exception_if(!(msr_val & EFER_SCE), X86_EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 #ifdef __x86_64__
         /*
          * Doing this for just Intel (rather than e.g. !amd_like()) as this is
@@ -3093,7 +3071,7 @@ x86_emulate(
          */
         generate_exception_if(ctxt->cpuid->x86_vendor == X86_VENDOR_INTEL &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
 #endif
 
         if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
@@ -3152,7 +3130,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x08): /* invd */
     case X86EMUL_OPC(0x0f, 0x09): /* wbinvd / wbnoinvd */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if(!ops->cache_op);
         if ( (rc = ops->cache_op(b == 0x09 ? !repe_prefix() ||
                                              !vcpu_has_wbnoinvd()
@@ -3167,7 +3145,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x0b): /* ud2 */
     case X86EMUL_OPC(0x0f, 0xb9): /* ud1 */
     case X86EMUL_OPC(0x0f, 0xff): /* ud0 */
-        generate_exception(EXC_UD);
+        generate_exception(X86_EXC_UD);
 
     case X86EMUL_OPC(0x0f, 0x0d): /* GrpP (prefetch) */
     case X86EMUL_OPC(0x0f, 0x18): /* Grp16 (prefetch/nop) */
@@ -3187,7 +3165,7 @@ x86_emulate(
         else if ( _3dnow_ext_table[(imm1 >> 4) & 0xf] & (1 << (imm1 & 0xf)) )
             host_and_vcpu_must_have(3dnow_ext);
         else
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
 
         get_fpu(X86EMUL_FPU_mmx);
 
@@ -3266,7 +3244,7 @@ x86_emulate(
         /* fall through */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x2b):   /* movntp{s,d} xmm,m128 */
                                            /* vmovntp{s,d} {x,y}mm,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         sfence = true;
         /* fall through */
     CASE_SIMD_ALL_FP_VEX(0x0f, 0x10):      /* mov{up,s}{s,d} xmm/mem,xmm */
@@ -3352,7 +3330,7 @@ x86_emulate(
         break;
 
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2b): /* vmovntp{s,d} [xyz]mm,mem */
-        generate_exception_if(ea.type != OP_MEM || evex.opmsk, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || evex.opmsk, X86_EXC_UD);
         sfence = true;
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x10): /* vmovup{s,d} [xyz]mm/mem,[xyz]mm{k} */
@@ -3366,7 +3344,7 @@ x86_emulate(
         /* vmovs{s,d} to/from memory have only two operands. */
         if ( (b & ~1) == 0x10 && ea.type == OP_MEM )
             d |= TwoOp;
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_ALL_FP(_EVEX, 0x0f, 0x51):    /* vsqrtp{s,d} [xyz]mm/mem,[xyz]mm{k} */
                                             /* vsqrts{s,d} xmm/m32,xmm,xmm{k} */
@@ -3380,7 +3358,7 @@ x86_emulate(
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK))),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
@@ -3408,7 +3386,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x16):   /* vmovhpd m64,xmm,xmm */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x17):   /* movhp{s,d} xmm,m64 */
                                            /* vmovhp{s,d} xmm,m64 */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC(0x0f, 0x12):          /* movlps m64,xmm */
                                            /* movhlps xmm,xmm */
@@ -3418,7 +3396,7 @@ x86_emulate(
                                            /* movlhps xmm,xmm */
     case X86EMUL_OPC_VEX(0x0f, 0x16):      /* vmovhps m64,xmm,xmm */
                                            /* vmovlhps xmm,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
         op_bytes = 8;
@@ -3428,7 +3406,7 @@ x86_emulate(
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x13): /* vmovlp{s,d} xmm,m64 */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x16):   /* vmovhpd m64,xmm,xmm */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x17): /* vmovhp{s,d} xmm,m64 */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f, 0x12):      /* vmovlps m64,xmm,xmm */
                                             /* vmovhlps xmm,xmm,xmm */
@@ -3436,7 +3414,7 @@ x86_emulate(
                                             /* vmovlhps xmm,xmm,xmm */
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
@@ -3463,7 +3441,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x16):   /* vmovshdup [xyz]mm/mem,[xyz]mm{k} */
         generate_exception_if((evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         avx512_vlen_check(false);
         d |= TwoOp;
@@ -3475,7 +3453,7 @@ x86_emulate(
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x14): /* vunpcklp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x15): /* vunpckhp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK),
-                              EXC_UD);
+                              X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x76): /* vpermi2{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x77): /* vpermi2p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -3502,7 +3480,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x65): /* vblendmp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_no_sae:
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(ea.type != OP_MEM && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_zmm;
 
@@ -3512,7 +3490,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x21): /* mov dr,reg */
     case X86EMUL_OPC(0x0f, 0x22): /* mov reg,cr */
     case X86EMUL_OPC(0x0f, 0x23): /* mov reg,dr */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         if ( b & 2 )
         {
             /* Write to CR/DR. */
@@ -3580,7 +3558,7 @@ x86_emulate(
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
         generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -3632,7 +3610,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
 
@@ -3691,7 +3669,7 @@ x86_emulate(
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x79): /* vcvts{s,d}2usi xmm/mem,reg */
         generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -3711,7 +3689,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -3761,7 +3739,7 @@ x86_emulate(
         generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
                                (ea.type != OP_REG && evex.brs) ||
                                evex.w != evex.pfx),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -3772,7 +3750,7 @@ x86_emulate(
         goto vcomi;
 
     case X86EMUL_OPC(0x0f, 0x30): /* wrmsr */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if(ops->write_msr == NULL);
         if ( (rc = ops->write_msr(_regs.ecx,
                                   ((uint64_t)_regs.r(dx) << 32) | _regs.eax,
@@ -3786,7 +3764,7 @@ x86_emulate(
             fail_if(ops->read_cr == NULL);
             if ( (rc = ops->read_cr(4, &cr4, ctxt)) )
                 goto done;
-            generate_exception_if(cr4 & X86_CR4_TSD, EXC_GP, 0);
+            generate_exception_if(cr4 & X86_CR4_TSD, X86_EXC_GP, 0);
         }
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_IA32_TSC,
@@ -3797,7 +3775,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x32): /* rdmsr */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(_regs.ecx, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
@@ -3807,15 +3785,15 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
         vcpu_must_have(sep);
-        generate_exception_if(amd_like(ctxt) && ctxt->lma, EXC_UD);
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
+        generate_exception_if(amd_like(ctxt) && ctxt->lma, X86_EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_IA32_SYSENTER_CS,
                                  &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
 
-        generate_exception_if(!(msr_val & 0xfffc), EXC_GP, 0);
+        generate_exception_if(!(msr_val & 0xfffc), X86_EXC_GP, 0);
 
         _regs.eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF | X86_EFLAGS_RF);
 
@@ -3856,20 +3834,20 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
         vcpu_must_have(sep);
-        generate_exception_if(amd_like(ctxt) && ctxt->lma, EXC_UD);
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
+        generate_exception_if(amd_like(ctxt) && ctxt->lma, X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_IA32_SYSENTER_CS,
                                  &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
 
-        generate_exception_if(!(msr_val & 0xfffc), EXC_GP, 0);
+        generate_exception_if(!(msr_val & 0xfffc), X86_EXC_GP, 0);
         generate_exception_if(op_bytes == 8 &&
                               (!is_canonical_address(_regs.r(dx)) ||
                                !is_canonical_address(_regs.r(cx))),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
 
         cs.sel = (msr_val | 3) + /* SELECTOR_RPL_MASK */
                  (op_bytes == 8 ? 32 : 16);
@@ -3917,7 +3895,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x47):    /* kxor{w,q} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x47): /* kxor{b,d} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x4a): /* kadd{b,d} k,k,k */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
     opmask_basic:
         if ( vex.w )
             host_and_vcpu_must_have(avx512bw);
@@ -3926,7 +3904,7 @@ x86_emulate(
     opmask_common:
         host_and_vcpu_must_have(avx512f);
         generate_exception_if(!vex.r || (mode_64bit() && !(vex.reg & 8)) ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
 
         vex.reg |= 8;
         d &= ~TwoOp;
@@ -3944,16 +3922,16 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x44):    /* knot{w,q} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x44): /* knot{b,d} k,k */
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         goto opmask_basic;
 
     case X86EMUL_OPC_VEX(0x0f, 0x4b):    /* kunpck{w,d}{d,q} k,k,k */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         host_and_vcpu_must_have(avx512bw);
         goto opmask_common;
 
     case X86EMUL_OPC_VEX_66(0x0f, 0x4b): /* kunpckbw k,k,k */
-        generate_exception_if(!vex.l || vex.w, EXC_UD);
+        generate_exception_if(!vex.l || vex.w, X86_EXC_UD);
         goto opmask_common;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -3974,7 +3952,7 @@ x86_emulate(
     simd_0f_to_gpr:
         opc[insn_bytes - PFX_BYTES] = 0xc3;
 
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
 
         if ( vex.opcx == vex_none )
         {
@@ -3997,7 +3975,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             if ( b == 0x50 || !vex.l )
                 host_and_vcpu_must_have(avx);
             else
@@ -4020,7 +3998,7 @@ x86_emulate(
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x57): /* vxorp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_MEM && evex.brs)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512dq);
         avx512_vlen_check(false);
         goto simd_zmm;
@@ -4053,7 +4031,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0x5b): /* vcvtps2dq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x5b): /* vcvttps2dq [xyz]mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f, 0x5b):    /* vcvtdq2ps [xyz]mm/mem,[xyz]mm{k} */
                                           /* vcvtqq2ps [xyz]mm/mem,{x,y}mm{k} */
@@ -4245,7 +4223,7 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf6): /* vpsadbw [xyz]mm/mem,[xyz]mm,[xyz]mm */
-        generate_exception_if(evex.opmsk, EXC_UD);
+        generate_exception_if(evex.opmsk, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x60): /* vpunpcklbw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x61): /* vpunpcklwd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -4283,13 +4261,13 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1c): /* vpabsb [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1d): /* vpabsw [xyz]mm/mem,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (b & 1);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0x62): /* vpunpckldq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6a): /* vpunpckhdq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         fault_suppression = false;
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -4308,21 +4286,21 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x27): /* vptestm{d,q} [xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x29): /* vpcmpeqq [xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x37): /* vpcmpgtq [xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(!evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( b & (ext == ext_0f38 ? 1 : 2) )
         {
-            generate_exception_if(b != 0x27 && evex.w != (b & 1), EXC_UD);
+            generate_exception_if(b != 0x27 && evex.w != (b & 1), X86_EXC_UD);
             goto avx512f_no_sae;
         }
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (ext == ext_0f ? b & 1 : evex.w);
         avx512_vlen_check(false);
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6b): /* vpackssdw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x2b): /* vpackusdw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
@@ -4333,7 +4311,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd4): /* vpaddq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf4): /* vpmuludq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x28): /* vpmuldq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -4344,7 +4322,7 @@ x86_emulate(
                                           /* vmov{d,q} xmm,r/m */
         if ( vex.opcx != vex_none )
         {
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -4385,7 +4363,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7e): /* vmov{d,q} xmm,r/m */
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
@@ -4409,7 +4387,7 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f, 0xe7):     /* movntdq xmm,m128 */
     case X86EMUL_OPC_VEX_66(0x0f, 0xe7): /* vmovntdq {x,y}mm,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         sfence = true;
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0x6f):     /* movdqa xmm/m128,xmm */
@@ -4429,7 +4407,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe7): /* vmovntdq [xyz]mm,mem */
         generate_exception_if(ea.type != OP_MEM || evex.opmsk || evex.w,
-                              EXC_UD);
+                              X86_EXC_UD);
         sfence = true;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6f): /* vmovdqa{32,64} [xyz]mm/mem,[xyz]mm{k} */
@@ -4437,7 +4415,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7f): /* vmovdqa{32,64} [xyz]mm,[xyz]mm/mem{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x7f): /* vmovdqu{32,64} [xyz]mm,[xyz]mm/mem{k} */
     vmovdqa:
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -4449,7 +4427,7 @@ x86_emulate(
         goto vmovdqa;
 
     case X86EMUL_OPC_VEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0xd6):     /* movq xmm,xmm/m64 */
@@ -4534,11 +4512,11 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x70): /* vpshufhw $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x70): /* vpshuflw $imm8,[xyz]mm/mem,[xyz]mm{k} */
         if ( evex.pfx == vex_66 )
-            generate_exception_if(evex.w, EXC_UD);
+            generate_exception_if(evex.w, X86_EXC_UD);
         else
         {
             host_and_vcpu_must_have(avx512bw);
-            generate_exception_if(evex.brs, EXC_UD);
+            generate_exception_if(evex.brs, X86_EXC_UD);
         }
         d = (d & ~SrcMask) | SrcMem | TwoOp;
         op_bytes = 16 << evex.lr;
@@ -4562,7 +4540,7 @@ x86_emulate(
             goto unrecognized_insn;
         }
     simd_0f_shift_imm:
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
 
         if ( vex.opcx != vex_none )
         {
@@ -4622,7 +4600,7 @@ x86_emulate(
         {
         case 2: /* vpsrld $imm8,[xyz]mm/mem,[xyz]mm{k} */
         case 6: /* vpslld $imm8,[xyz]mm/mem,[xyz]mm{k} */
-            generate_exception_if(evex.w, EXC_UD);
+            generate_exception_if(evex.w, X86_EXC_UD);
             /* fall through */
         case 0: /* vpror{d,q} $imm8,[xyz]mm/mem,[xyz]mm{k} */
         case 1: /* vprol{d,q} $imm8,[xyz]mm/mem,[xyz]mm{k} */
@@ -4670,11 +4648,11 @@ x86_emulate(
         {
         case 2: /* vpsrlq $imm8,[xyz]mm/mem,[xyz]mm{k} */
         case 6: /* vpsllq $imm8,[xyz]mm/mem,[xyz]mm{k} */
-            generate_exception_if(!evex.w, EXC_UD);
+            generate_exception_if(!evex.w, X86_EXC_UD);
             goto avx512f_shift_imm;
         case 3: /* vpsrldq $imm8,[xyz]mm/mem,[xyz]mm */
         case 7: /* vpslldq $imm8,[xyz]mm/mem,[xyz]mm */
-            generate_exception_if(evex.opmsk, EXC_UD);
+            generate_exception_if(evex.opmsk, X86_EXC_UD);
             goto avx512bw_shift_imm;
         }
         goto unrecognized_insn;
@@ -4688,7 +4666,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x77):    /* vzero{all,upper} */
         if ( vex.opcx != vex_none )
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
 
@@ -4756,7 +4734,7 @@ x86_emulate(
         }
         /* fall through */
     case X86EMUL_OPC_F2(0x0f, 0x78):     /* insertq $imm8,$imm8,xmm,xmm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
 
         host_and_vcpu_must_have(sse4a);
         get_fpu(X86EMUL_FPU_xmm);
@@ -4771,14 +4749,14 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f, 0x79):     /* extrq xmm,xmm */
     case X86EMUL_OPC_F2(0x0f, 0x79):     /* insertq xmm,xmm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         host_and_vcpu_must_have(sse4a);
         op_bytes = 8;
         goto simd_0f_xmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe6):   /* vcvttpd2dq [xyz]mm/mem,{x,y}mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0xe6):   /* vcvtpd2dq [xyz]mm/mem,{x,y}mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x7a):   /* vcvtudq2pd {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtuqq2pd [xyz]mm/mem,[xyz]mm{k} */
@@ -4801,7 +4779,7 @@ x86_emulate(
         else
         {
             host_and_vcpu_must_have(avx512f);
-            generate_exception_if(ea.type != OP_MEM && evex.brs, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         }
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -4811,7 +4789,7 @@ x86_emulate(
 
     case X86EMUL_OPC_F2(0x0f, 0xf0):     /* lddqu m128,xmm */
     case X86EMUL_OPC_VEX_F2(0x0f, 0xf0): /* vlddqu mem,{x,y}mm */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0x7c):     /* haddpd xmm/m128,xmm */
     case X86EMUL_OPC_F2(0x0f, 0x7c):     /* haddps xmm/m128,xmm */
@@ -4830,14 +4808,14 @@ x86_emulate(
 
     case X86EMUL_OPC_F3(0x0f, 0x7e):     /* movq xmm/m64,xmm */
     case X86EMUL_OPC_VEX_F3(0x0f, 0x7e): /* vmovq xmm/m64,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         op_bytes = 8;
         goto simd_0f_int;
 
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmovq xmm/m64,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
         generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         d |= TwoOp;
         op_bytes = 8;
@@ -4859,11 +4837,11 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x91):    /* kmov{w,q} k,mem */
     case X86EMUL_OPC_VEX_66(0x0f, 0x91): /* kmov{b,d} k,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x90):    /* kmov{w,q} k/mem,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x90): /* kmov{b,d} k/mem,k */
-        generate_exception_if(vex.l || !vex.r, EXC_UD);
+        generate_exception_if(vex.l || !vex.r, X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( vex.w )
         {
@@ -4896,14 +4874,14 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x92): /* kmovb r32,k */
     case X86EMUL_OPC_VEX_F2(0x0f, 0x92): /* kmov{d,q} reg,k */
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
 
         host_and_vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
             host_and_vcpu_must_have(avx512bw);
         else
         {
-            generate_exception_if(vex.w, EXC_UD);
+            generate_exception_if(vex.w, X86_EXC_UD);
             if ( vex.pfx )
                 host_and_vcpu_must_have(avx512dq);
         }
@@ -4933,7 +4911,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x93): /* kmovb k,r32 */
     case X86EMUL_OPC_VEX_F2(0x0f, 0x93): /* kmov{d,q} k,reg */
         generate_exception_if(vex.l || vex.reg != 0xf || ea.type != OP_REG,
-                              EXC_UD);
+                              X86_EXC_UD);
         dst = ea;
         dst.reg = decode_gpr(&_regs, modrm_reg);
 
@@ -4945,7 +4923,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.w, EXC_UD);
+            generate_exception_if(vex.w, X86_EXC_UD);
             dst.bytes = 4;
             if ( vex.pfx )
                 host_and_vcpu_must_have(avx512dq);
@@ -4978,7 +4956,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x98): /* kortest{b,d} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x99): /* ktest{b,d} k,k */
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( vex.w )
             host_and_vcpu_must_have(avx512bw);
@@ -5025,7 +5003,7 @@ x86_emulate(
             goto done;
 
         generate_exception_if((msr_val & MSR_MISC_FEATURES_CPUID_FAULTING),
-                              EXC_GP, 0); /* Faulting active? (Inc. CPL test) */
+                              X86_EXC_GP, 0); /* Faulting active? (Inc. CPL test) */
 
         rc = ops->cpuid(_regs.eax, _regs.ecx, &cpuid_leaf, ctxt);
         if ( rc != X86EMUL_OKAY )
@@ -5037,7 +5015,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0xa3): bt: /* bt */
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
 
         if ( ops->rmw && dst.type == OP_MEM &&
              (rc = read_ulong(dst.mem.seg, dst.mem.off, &dst.val,
@@ -5054,7 +5032,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0xad): /* shrd %%cl,r,r/m */ {
         uint8_t shift, width = dst.bytes << 3;
 
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
 
         if ( b & 1 )
             shift = _regs.cl;
@@ -5202,7 +5180,7 @@ x86_emulate(
         case 5: goto bts;
         case 6: goto btr;
         case 7: goto btc;
-        default: generate_exception(EXC_UD);
+        default: generate_exception(X86_EXC_UD);
         }
         break;
 
@@ -5320,7 +5298,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
                                !evex.r || !evex.R || evex.z),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
@@ -5352,7 +5330,7 @@ x86_emulate(
 
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xc4):  /* pinsrw $imm8,r32/m16,{,x}mm */
                                            /* vpinsrw $imm8,r32/m16,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         memcpy(mmvalp, &src.val, 2);
         ea.type = OP_MEM;
         state->simd_size = simd_other;
@@ -5363,7 +5341,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc4):   /* vpinsrw $imm8,r32/m16,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x20): /* vpinsrb $imm8,r32/m8,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
-        generate_exception_if(evex.lr || evex.opmsk || evex.brs, EXC_UD);
+        generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
         if ( b & 2 )
             host_and_vcpu_must_have(avx512dq);
         else
@@ -5380,7 +5358,7 @@ x86_emulate(
 
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xc5):  /* pextrw $imm8,{,x}mm,reg */
                                            /* vpextrw $imm8,xmm,reg */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         opc = init_prefixes(stub);
         opc[0] = b;
         /* Convert GPR destination to %rAX. */
@@ -5397,7 +5375,7 @@ x86_emulate(
 
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0xc6): /* vshufp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK),
-                              EXC_UD);
+                              X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x03): /* valign{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         fault_suppression = false;
@@ -5405,7 +5383,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x25): /* vpternlog{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_imm8_no_sae:
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(ea.type != OP_MEM && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
@@ -5442,7 +5420,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe2): /* vpsra{d,q} xmm/m128,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf2): /* vpslld xmm/m128,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf3): /* vpsllq xmm/m128,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0c): /* vpermilps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0d): /* vpermilpd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -5455,7 +5433,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xfe): /* vpaddd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1e): /* vpabsd [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1f): /* vpabsq [xyz]mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w != (b & 1), EXC_UD);
+        generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         goto avx512f_no_sae;
 
 #endif /* !X86EMUL_NO_SIMD */
@@ -5472,7 +5450,7 @@ x86_emulate(
 
     case X86EMUL_OPC_F3(0x0f, 0xd6):     /* movq2dq mm,xmm */
     case X86EMUL_OPC_F2(0x0f, 0xd6):     /* movdq2q xmm,mm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         op_bytes = 8;
         host_and_vcpu_must_have(mmx);
         goto simd_0f_int;
@@ -5481,7 +5459,7 @@ x86_emulate(
 #ifndef X86EMUL_NO_MMX
 
     case X86EMUL_OPC(0x0f, 0xe7):        /* movntq mm,m64 */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         sfence = true;
         /* fall through */
     case X86EMUL_OPC(0x0f, 0xda):        /* pminub mm/m64,mm */
@@ -5504,7 +5482,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xea): /* vpminsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xee): /* vpmaxsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 0x10 ? 1 : 2;
         goto avx512f_no_sae;
 
@@ -5521,10 +5499,10 @@ x86_emulate(
 #endif /* !X86EMUL_NO_SIMD */
 
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xf7): /* {,v}maskmov{q,dqu} {,x}mm,{,x}mm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         if ( vex.opcx != vex_none )
         {
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             d |= TwoOp;
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
@@ -5627,23 +5605,23 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x19): /* vbroadcastsd xmm/m64,ymm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x1a): /* vbroadcastf128 m128,ymm */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x18): /* vbroadcastss xmm/m32,{x,y}mm */
         if ( ea.type != OP_MEM )
         {
-            generate_exception_if(b & 2, EXC_UD);
+            generate_exception_if(b & 2, X86_EXC_UD);
             host_and_vcpu_must_have(avx2);
         }
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0c): /* vpermilps {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0d): /* vpermilpd {x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0e): /* vtestps {x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0f): /* vtestpd {x,y}mm/mem,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_66(0x0f38, 0x17):     /* ptest xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x17): /* vptest {x,y}mm/mem,{x,y}mm */
@@ -5654,7 +5632,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -5729,7 +5707,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x11): /* vpsravw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x12): /* vpsllvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(!evex.w || evex.brs, EXC_UD);
+        generate_exception_if(!evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 2;
         goto avx512f_no_sae;
 
@@ -5751,7 +5729,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x33): /* vpmovzxwd {x,y}mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x34): /* vpmovzxwq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x35): /* vpmovzxdq {x,y}mm/mem,[xyz]mm{k} */
-            generate_exception_if(evex.w && (b & 7) == 5, EXC_UD);
+            generate_exception_if(evex.w && (b & 7) == 5, X86_EXC_UD);
         }
         else
         {
@@ -5770,22 +5748,22 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x33): /* vpmovdw [xyz]mm,{x,y}mm/mem{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x34): /* vpmovqw [xyz]mm,xmm/mem{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* vpmovqd [xyz]mm,{x,y}mm/mem{k} */
-            generate_exception_if(evex.w || (ea.type != OP_REG && evex.z), EXC_UD);
+            generate_exception_if(evex.w || (ea.type != OP_REG && evex.z), X86_EXC_UD);
             d = DstMem | SrcReg | TwoOp;
         }
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         op_bytes = 32 >> (pmov_convert_delta[b & 7] + 1 - evex.lr);
         elem_bytes = (b & 7) < 3 ? 1 : (b & 7) != 5 ? 2 : 4;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x13): /* vcvtph2ps xmm/mem,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         host_and_vcpu_must_have(f16c);
         op_bytes = 8 << vex.l;
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x13): /* vcvtph2ps {x,y}mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), EXC_UD);
+        generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(false);
@@ -5795,19 +5773,19 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x16): /* vpermps ymm/m256,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x36): /* vpermd ymm/m256,ymm,ymm */
-        generate_exception_if(!vex.l || vex.w, EXC_UD);
+        generate_exception_if(!vex.l || vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x16): /* vpermp{s,d} {y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x36): /* vperm{d,q} {y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
-        generate_exception_if(!evex.lr, EXC_UD);
+        generate_exception_if(!evex.lr, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x18): /* vbroadcastss xmm/m32,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x58): /* vpbroadcastd xmm/m32,[xyz]mm{k} */
         op_bytes = elem_bytes;
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
     avx512_broadcast:
         /*
          * For the respective code below the main switch() to work we need to
@@ -5828,17 +5806,17 @@ x86_emulate(
                                             /* vbroadcastf64x4 m256,zmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x5b): /* vbroadcasti32x8 m256,zmm{k} */
                                             /* vbroadcasti64x4 m256,zmm{k} */
-        generate_exception_if(ea.type != OP_MEM || evex.lr != 2, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || evex.lr != 2, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x19): /* vbroadcastsd xmm/m64,{y,z}mm{k} */
                                             /* vbroadcastf32x2 xmm/m64,{y,z}mm{k} */
-        generate_exception_if(!evex.lr, EXC_UD);
+        generate_exception_if(!evex.lr, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x59): /* vpbroadcastq xmm/m64,[xyz]mm{k} */
                                             /* vbroadcasti32x2 xmm/m64,[xyz]mm{k} */
         if ( b == 0x59 )
             op_bytes = 8;
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         if ( !evex.w )
             host_and_vcpu_must_have(avx512dq);
         goto avx512_broadcast;
@@ -5848,7 +5826,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x5a): /* vbroadcasti32x4 m128,{y,z}mm{k} */
                                             /* vbroadcasti64x2 m128,{y,z}mm{k} */
         generate_exception_if(ea.type != OP_MEM || !evex.lr || evex.brs,
-                              EXC_UD);
+                              X86_EXC_UD);
         if ( evex.w )
             host_and_vcpu_must_have(avx512dq);
         goto avx512_broadcast;
@@ -5870,7 +5848,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x29): /* vpmov{b,w}2m [xyz]mm,k */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x39): /* vpmov{d,q}2m [xyz]mm,k */
-        generate_exception_if(!evex.r || !evex.R, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x28): /* vpmovm2{b,w} k,[xyz]mm */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x38): /* vpmovm2{d,q} k,[xyz]mm */
@@ -5878,14 +5856,14 @@ x86_emulate(
             host_and_vcpu_must_have(avx512dq);
         else
             host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.opmsk || ea.type != OP_REG, EXC_UD);
+        generate_exception_if(evex.opmsk || ea.type != OP_REG, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_66(0x0f38, 0x2a):     /* movntdqa m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x2a): /* vmovntdqa mem,{x,y}mm */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* Ignore the non-temporal hint for now, using movdqa instead. */
         asm volatile ( "mfence" ::: "memory" );
         b = 0x6f;
@@ -5901,7 +5879,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x2a): /* vmovntdqa mem,[xyz]mm */
         generate_exception_if(ea.type != OP_MEM || evex.opmsk || evex.w,
-                              EXC_UD);
+                              X86_EXC_UD);
         /* Ignore the non-temporal hint for now, using vmovdqa32 instead. */
         asm volatile ( "mfence" ::: "memory" );
         b = 0x6f;
@@ -5912,7 +5890,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x3a): /* vpbroadcastmw2d k,[xyz]mm */
         generate_exception_if((ea.type != OP_REG || evex.opmsk ||
                                evex.w == ((b >> 4) & 1)),
-                              EXC_UD);
+                              X86_EXC_UD);
         d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xc4): /* vpconflict{d,q} [xyz]mm/mem,[xyz]mm{k} */
@@ -5929,7 +5907,7 @@ x86_emulate(
     {
         typeof(vex) *pvex;
 
-        generate_exception_if(ea.type != OP_MEM || vex.w, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || vex.w, X86_EXC_UD);
         host_and_vcpu_must_have(avx);
         elem_bytes = 4 << (b & 1);
     vmaskmov:
@@ -6016,7 +5994,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512f);
     simd_zmm_scalar_sae:
-        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
         goto simd_zmm;
@@ -6030,7 +6008,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3c): /* vpmaxsb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3e): /* vpmaxuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 2 ?: 1;
         goto avx512f_no_sae;
 
@@ -6050,7 +6028,7 @@ x86_emulate(
             goto simd_0f38_common;
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x41): /* vphminposuw xmm/m128,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
@@ -6058,7 +6036,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x53): /* vpdpwssds [xy]mm/mem,[xy]mm,[xy]mm */
         host_and_vcpu_must_have(avx_vnni);
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x50): /* vpdpbusd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -6066,7 +6044,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x52): /* vpdpwssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x53): /* vpdpwssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_vnni);
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x72): /* vcvtne2ps2bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -6078,7 +6056,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x52): /* vdpbf16ps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_bf16);
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
@@ -6089,13 +6067,13 @@ x86_emulate(
         op_bytes = 1 << ((!(b & 0x20) * 2) + (b & 1));
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x46): /* vpsravd {x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4d): /* vrcp14s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4f): /* vrsqrt14s{s,d} xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
 
@@ -6104,19 +6082,19 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_4vnniw);
         generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
                                evex.lr != 2),
-                              EXC_UD);
+                              X86_EXC_UD);
         op_mask = op_mask & 0xffff ? 0xf : 0;
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8f): /* vpshufbitqmb [xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x54): /* vpopcnt{b,w} [xyz]mm/mem,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_bitalg);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x66): /* vpblendm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         goto avx512f_no_sae;
 
@@ -6125,7 +6103,7 @@ x86_emulate(
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x5a): /* vbroadcasti128 m128,ymm */
-        generate_exception_if(ea.type != OP_MEM || !vex.l || vex.w, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || !vex.l || vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
@@ -6138,7 +6116,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8a): /* vcompressp{s,d} [xyz]mm,[xyz]mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8b): /* vpcompress{d,q} [xyz]mm,[xyz]mm/mem{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         /*
          * For the respective code below the main switch() to work we need to
@@ -6160,13 +6138,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
         host_and_vcpu_must_have(avx512_vp2intersect);
-        generate_exception_if(evex.opmsk || !evex.r || !evex.R, EXC_UD);
+        generate_exception_if(evex.opmsk || !evex.r || !evex.R, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x70): /* vpshldvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x72): /* vpshrdvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         elem_bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x71): /* vpshldv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -6181,14 +6159,14 @@ x86_emulate(
             host_and_vcpu_must_have(avx512_vbmi);
         else
             host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x78): /* vpbroadcastb xmm/m8,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x79): /* vpbroadcastw xmm/m16,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         op_bytes = elem_bytes = 1 << (b & 1);
         /* See the comment at the avx512_broadcast label. */
         op_mask |= !(b & 1 ? !(uint32_t)op_mask : !op_mask);
@@ -6197,12 +6175,12 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7a): /* vpbroadcastb r32,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7b): /* vpbroadcastw r32,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7c): /* vpbroadcast{d,q} reg,[xyz]mm{k} */
         generate_exception_if((ea.type != OP_REG || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         avx512_vlen_check(false);
         get_fpu(X86EMUL_FPU_zmm);
@@ -6228,21 +6206,21 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f38, 0x82): /* invpcid reg,m128 */
         vcpu_must_have(invpcid);
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
 
         if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 16,
                              ctxt)) != X86EMUL_OKAY )
             goto done;
 
-        generate_exception_if(mmvalp->xmm[0] & ~0xfff, EXC_GP, 0);
+        generate_exception_if(mmvalp->xmm[0] & ~0xfff, X86_EXC_GP, 0);
         dst.val = mode_64bit() ? *dst.reg : (uint32_t)*dst.reg;
 
         switch ( dst.val )
         {
         case X86_INVPCID_INDIV_ADDR:
              generate_exception_if(!is_canonical_address(mmvalp->xmm[1]),
-                                   EXC_GP, 0);
+                                   X86_EXC_GP, 0);
              /* fall through */
         case X86_INVPCID_SINGLE_CTXT:
              if ( !mode_64bit() || !ops->read_cr )
@@ -6250,13 +6228,13 @@ x86_emulate(
              else if ( (rc = ops->read_cr(4, &cr4, ctxt)) != X86EMUL_OKAY )
                  goto done;
              generate_exception_if(!(cr4 & X86_CR4_PCIDE) && mmvalp->xmm[0],
-                                   EXC_GP, 0);
+                                   X86_EXC_GP, 0);
              break;
         case X86_INVPCID_ALL_INCL_GLOBAL:
         case X86_INVPCID_ALL_NON_GLOBAL:
              break;
         default:
-             generate_exception(EXC_GP, 0);
+             generate_exception(X86_EXC_GP, 0);
         }
 
         fail_if(!ops->tlb_op);
@@ -6271,14 +6249,14 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x83): /* vpmultishiftqb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         host_and_vcpu_must_have(avx512_vbmi);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8c): /* vpmaskmov{d,q} mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8e): /* vpmaskmov{d,q} {x,y}mm,{x,y}mm,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         host_and_vcpu_must_have(avx2);
         elem_bytes = 4 << vex.w;
         goto vmaskmov;
@@ -6299,8 +6277,8 @@ x86_emulate(
         ASSERT(ea.type == OP_MEM);
         generate_exception_if(modrm_reg == state->sib_index ||
                               modrm_reg == mask_reg ||
-                              state->sib_index == mask_reg, EXC_UD);
-        generate_exception_if(!cpu_has_avx, EXC_UD);
+                              state->sib_index == mask_reg, X86_EXC_UD);
+        generate_exception_if(!cpu_has_avx, X86_EXC_UD);
         vcpu_must_have(avx2);
         get_fpu(X86EMUL_FPU_ymm);
 
@@ -6419,7 +6397,7 @@ x86_emulate(
         generate_exception_if((!evex.opmsk || evex.brs || evex.z ||
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
-                              EXC_UD);
+                              X86_EXC_UD);
         avx512_vlen_check(false);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
@@ -6569,7 +6547,7 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_4fmaps);
         generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
                                evex.lr != 2),
-                              EXC_UD);
+                              X86_EXC_UD);
         op_mask = op_mask & 0xffff ? 0xf : 0;
         goto simd_zmm;
 
@@ -6578,7 +6556,7 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_4fmaps);
         generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
                                evex.lr == 3),
-                              EXC_UD);
+                              X86_EXC_UD);
         op_mask = op_mask & 1 ? 0xf : 0;
         goto simd_zmm;
 
@@ -6599,7 +6577,7 @@ x86_emulate(
         generate_exception_if((!evex.opmsk || evex.brs || evex.z ||
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
-                              EXC_UD);
+                              X86_EXC_UD);
         avx512_vlen_check(false);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
@@ -6706,7 +6684,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb4): /* vpmadd52luq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb5): /* vpmadd52huq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_ifma);
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xc6):
@@ -6723,7 +6701,7 @@ x86_emulate(
         ASSERT(ea.type == OP_MEM);
         generate_exception_if((!cpu_has_avx512f || !evex.opmsk || evex.brs ||
                                evex.z || evex.reg != 0xf || evex.lr != 2),
-                              EXC_UD);
+                              X86_EXC_UD);
 
         switch ( modrm_reg & 7 )
         {
@@ -6734,7 +6712,7 @@ x86_emulate(
             vcpu_must_have(avx512pf);
             break;
         default:
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
 
         get_fpu(X86EMUL_FPU_zmm);
@@ -6815,7 +6793,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xcc): /* vrsqrt28p{s,d} zmm/mem,zmm{k} */
         host_and_vcpu_must_have(avx512er);
         generate_exception_if((ea.type != OP_REG || !evex.brs) && evex.lr != 2,
-                              EXC_UD);
+                              X86_EXC_UD);
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xcb): /* vrcp28s{s,d} xmm/mem,xmm,xmm{k} */
@@ -6829,12 +6807,12 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0xcf):  /* vgf2p8mulb {x,y}mm/mem,{x,y}mm,{x,y}mm */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xcf): /* vgf2p8mulb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 1;
         goto avx512f_no_sae;
 
@@ -6853,7 +6831,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xde): /* vaesdec [xyz]mm/mem,[xyz]mm,[xyz]mm */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xdf): /* vaesdeclast [xyz]mm/mem,[xyz]mm,[xyz]mm */
         host_and_vcpu_must_have(vaes);
-        generate_exception_if(evex.brs || evex.opmsk, EXC_UD);
+        generate_exception_if(evex.brs || evex.opmsk, X86_EXC_UD);
         goto avx512f_no_sae;
 
 #endif /* !X86EMUL_NO_SIMD */
@@ -6926,7 +6904,7 @@ x86_emulate(
             host_and_vcpu_must_have(bmi2);
         else
             host_and_vcpu_must_have(bmi1);
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
 
         buf[0] = 0xc4;
         *pvex = vex;
@@ -6960,7 +6938,7 @@ x86_emulate(
             goto unrecognized_insn;
         }
 
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
 
         buf[0] = 0xc4;
         *pvex = vex;
@@ -7013,7 +6991,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xf6): /* mulx r/m,r,r */
         vcpu_must_have(bmi2);
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         ea.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
         if ( mode_64bit() && vex.w )
             asm ( "mulq %3" : "=a" (*ea.reg), "=d" (dst.val)
@@ -7025,10 +7003,10 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f38, 0xf8): /* movdir64b r,m512 */
         host_and_vcpu_must_have(movdir64b);
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         src.val = truncate_ea(*dst.reg);
         generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
         fail_if(!ops->blk);
         state->blk = blk_movdir;
         BUILD_BUG_ON(sizeof(*mmvalp) < 64);
@@ -7043,11 +7021,11 @@ x86_emulate(
     case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
     case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
         host_and_vcpu_must_have(enqcmd);
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
-        generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), EXC_GP, 0);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
+        generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), X86_EXC_GP, 0);
         src.val = truncate_ea(*dst.reg);
         generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
         fail_if(!ops->blk);
         BUILD_BUG_ON(sizeof(*mmvalp) < 64);
         if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 64,
@@ -7055,16 +7033,16 @@ x86_emulate(
             goto done;
         if ( vex.pfx == vex_f2 ) /* enqcmd */
         {
-            generate_exception_if(mmvalp->data32[0], EXC_GP, 0);
+            generate_exception_if(mmvalp->data32[0], X86_EXC_GP, 0);
             fail_if(!ops->read_msr);
             if ( (rc = ops->read_msr(MSR_PASID, &msr_val,
                                      ctxt)) != X86EMUL_OKAY )
                 goto done;
-            generate_exception_if(!(msr_val & PASID_VALID), EXC_GP, 0);
+            generate_exception_if(!(msr_val & PASID_VALID), X86_EXC_GP, 0);
             mmvalp->data32[0] = MASK_EXTR(msr_val, PASID_PASID_MASK);
         }
         else
-            generate_exception_if(mmvalp->data32[0] & 0x7ff00000, EXC_GP, 0);
+            generate_exception_if(mmvalp->data32[0] & 0x7ff00000, X86_EXC_GP, 0);
         state->blk = blk_enqcmd;
         if ( (rc = ops->blk(x86_seg_es, src.val, mmvalp, 64, &_regs.eflags,
                             state, ctxt)) != X86EMUL_OKAY )
@@ -7074,7 +7052,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
         host_and_vcpu_must_have(movdiri);
-        generate_exception_if(dst.type != OP_MEM, EXC_UD);
+        generate_exception_if(dst.type != OP_MEM, X86_EXC_UD);
         fail_if(!ops->blk);
         state->blk = blk_movdir;
         if ( (rc = ops->blk(dst.mem.seg, dst.mem.off, &src.val, op_bytes,
@@ -7087,37 +7065,37 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x00): /* vpermq $imm8,ymm/m256,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x01): /* vpermpd $imm8,ymm/m256,ymm */
-        generate_exception_if(!vex.l || !vex.w, EXC_UD);
+        generate_exception_if(!vex.l || !vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x00): /* vpermq $imm8,{y,z}mm/mem,{y,z}mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x01): /* vpermpd $imm8,{y,z}mm/mem,{y,z}mm{k} */
-        generate_exception_if(!evex.lr || !evex.w, EXC_UD);
+        generate_exception_if(!evex.lr || !evex.w, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x38): /* vinserti128 $imm8,xmm/m128,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x39): /* vextracti128 $imm8,ymm,xmm/m128 */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x46): /* vperm2i128 $imm8,ymm/m256,ymm,ymm */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x02): /* vpblendd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx2;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x06): /* vperm2f128 $imm8,ymm/m256,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x18): /* vinsertf128 $imm8,xmm/m128,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x19): /* vextractf128 $imm8,ymm,xmm/m128 */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x04): /* vpermilps $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x05): /* vpermilpd $imm8,{x,y}mm/mem,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x04): /* vpermilps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x05): /* vpermilpd $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w != (b & 1), EXC_UD);
+        generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -7136,12 +7114,12 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0a): /* vrndscaless $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0b): /* vrndscalesd $imm8,xmm/mem,xmm,xmm{k} */
-        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x09): /* vrndscalepd $imm8,[xyz]mm/mem,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(evex.w != (b & 1), EXC_UD);
+        generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
@@ -7177,7 +7155,7 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x42): /* vdbpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0f): /* vpalignr $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         fault_suppression = false;
@@ -7225,7 +7203,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x15): /* vpextrw $imm8,xmm,r/m */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x16): /* vpextr{d,q} $imm8,xmm,r/m */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x17): /* vextractps $imm8,xmm,r/m */
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         host_and_vcpu_must_have(avx);
         get_fpu(X86EMUL_FPU_ymm);
 
@@ -7237,7 +7215,7 @@ x86_emulate(
         goto pextr;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc5):   /* vpextrw $imm8,xmm,reg */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         /* Convert to alternative encoding: We want to use a memory operand. */
         evex.opcx = ext_0f3a;
         b = 0x15;
@@ -7251,7 +7229,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x17): /* vextractps $imm8,xmm,r/m */
         generate_exception_if((evex.lr || evex.reg != 0xf || !evex.RX ||
                                evex.opmsk || evex.brs),
-                              EXC_UD);
+                              X86_EXC_UD);
         if ( !(b & 2) )
             host_and_vcpu_must_have(avx512bw);
         else if ( !(b & 1) )
@@ -7272,13 +7250,13 @@ x86_emulate(
                                             /* vextracti64x2 $imm8,{y,z}mm,xmm/m128{k} */
         if ( evex.w )
             host_and_vcpu_must_have(avx512dq);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x23): /* vshuff32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
                                             /* vshuff64x2 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x43): /* vshufi32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
                                             /* vshufi64x2 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
-        generate_exception_if(!evex.lr, EXC_UD);
+        generate_exception_if(!evex.lr, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -7292,7 +7270,7 @@ x86_emulate(
                                             /* vextracti64x4 $imm8,zmm,ymm/m256{k} */
         if ( !evex.w )
             host_and_vcpu_must_have(avx512dq);
-        generate_exception_if(evex.lr != 2 || evex.brs, EXC_UD);
+        generate_exception_if(evex.lr != 2 || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -7306,14 +7284,14 @@ x86_emulate(
         {
             generate_exception_if((evex.w || evex.reg != 0xf || !evex.RX ||
                                    (ea.type != OP_REG && (evex.z || evex.brs))),
-                                  EXC_UD);
+                                  X86_EXC_UD);
             host_and_vcpu_must_have(avx512f);
             avx512_vlen_check(false);
             opc = init_evex(stub);
         }
         else
         {
-            generate_exception_if(vex.w || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.w || vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(f16c);
             opc = init_prefixes(stub);
         }
@@ -7395,12 +7373,12 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x1f): /* vpcmp{d,q} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3e): /* vpcmpu{b,w} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3f): /* vpcmp{b,w} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(!evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 0x20) )
             goto avx512f_imm8_no_sae;
     avx512bw_imm:
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
@@ -7416,7 +7394,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x20): /* vpinsrb $imm8,r32/m8,xmm,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         if ( !mode_64bit() )
             vex.w = 0;
         memcpy(mmvalp, &src.val, src.bytes);
@@ -7434,13 +7412,13 @@ x86_emulate(
         op_bytes = 4;
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x41): /* vdppd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x21): /* vinsertps $imm8,xmm/m32,xmm,xmm */
         host_and_vcpu_must_have(avx512f);
         generate_exception_if(evex.lr || evex.w || evex.opmsk || evex.brs,
-                              EXC_UD);
+                              X86_EXC_UD);
         op_bytes = 4;
         goto simd_imm8_zmm;
 
@@ -7462,7 +7440,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x27): /* vgetmants{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x55): /* vfixupimms{s,d} $imm8,xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
         goto simd_imm8_zmm;
@@ -7473,7 +7451,7 @@ x86_emulate(
             host_and_vcpu_must_have(avx512dq);
     opmask_shift_imm:
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_opmask);
         op_bytes = 1; /* Any non-zero value will do. */
@@ -7495,7 +7473,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x44): /* vpclmulqdq $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm */
         host_and_vcpu_must_have(vpclmulqdq);
-        generate_exception_if(evex.brs || evex.opmsk, EXC_UD);
+        generate_exception_if(evex.brs || evex.opmsk, X86_EXC_UD);
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x48): /* vpermil2ps $imm,{x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
@@ -7507,11 +7485,11 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x4a): /* vblendvps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x4b): /* vblendvpd {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x4c): /* vpblendvb {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_int_imm8;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5c): /* vfmaddsubps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7572,7 +7550,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -7623,16 +7601,16 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,xmm/mem,k{k} */
         host_and_vcpu_must_have(avx512dq);
-        generate_exception_if(!evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x70): /* vpshldw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x72): /* vpshrdw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         elem_bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x71): /* vpshld{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -7653,13 +7631,13 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xce):  /* vgf2p8affineqb $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xcf):  /* vgf2p8affineinvqb $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(!vex.w, EXC_UD);
+        generate_exception_if(!vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0xce): /* vgf2p8affineqb $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0xcf): /* vgf2p8affineinvqb $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -7668,14 +7646,14 @@ x86_emulate(
         host_and_vcpu_must_have(aesni);
         if ( vex.opcx == vex_none )
             goto simd_0f3a_common;
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
 #endif /* X86EMUL_NO_SIMD */
 
     case X86EMUL_OPC_VEX_F2(0x0f3a, 0xf0): /* rorx imm,r/m,r */
         vcpu_must_have(bmi2);
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         if ( ea.type == OP_REG )
             src.val = *ea.reg;
         else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off, &src.val, op_bytes,
@@ -7713,11 +7691,11 @@ x86_emulate(
     case X86EMUL_OPC_XOP(08, 0xed): /* vpcomuw $imm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0xee): /* vpcomud $imm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0xef): /* vpcomuq $imm,xmm/m128,xmm,xmm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(08, 0xa3): /* vpperm xmm/m128,xmm,xmm,xmm */
                                     /* vpperm xmm,xmm/m128,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(08, 0xa2): /* vpcmov {x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
                                     /* vpcmov {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7747,7 +7725,7 @@ x86_emulate(
         uint8_t *buf = get_stub(stub);
         typeof(vex) *pxop = container_of(buf + 1, typeof(vex), raw[0]);
 
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
 
         buf[0] = 0x8f;
         *pxop = vex;
@@ -7781,7 +7759,7 @@ x86_emulate(
         case 0: /* llwpcb r */
         case 1: /* slwpcb r */
             /* LWP is unsupported, so produce #UD unconditionally. */
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
         goto unrecognized_insn;
 
@@ -7789,12 +7767,12 @@ x86_emulate(
 
     case X86EMUL_OPC_XOP(09, 0x82): /* vfrczss xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0x83): /* vfrczsd xmm/m128,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(09, 0x80): /* vfrczps {x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_XOP(09, 0x81): /* vfrczpd {x,y}mm/mem,{x,y}mm */
         host_and_vcpu_must_have(xop);
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_XOP(09, 0xc1): /* vphaddbw xmm/m128,xmm */
@@ -7812,7 +7790,7 @@ x86_emulate(
     case X86EMUL_OPC_XOP(09, 0xe2): /* vphsubwd xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0xe3): /* vphsubdq xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0xe1): /* vphsubbw xmm/m128,xmm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(09, 0x90): /* vprotb xmm/m128,xmm,xmm */
                                     /* vprotb xmm,xmm/m128,xmm */
@@ -7838,7 +7816,7 @@ x86_emulate(
                                     /* vpshad xmm,xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0x9b): /* vpshaq xmm/m128,xmm,xmm */
                                     /* vpshaq xmm,xmm/m128,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         host_and_vcpu_must_have(xop);
         goto simd_0f_ymm;
 
@@ -7850,7 +7828,7 @@ x86_emulate(
         typeof(vex) *pxop = container_of(buf + 1, typeof(vex), raw[0]);
 
         host_and_vcpu_must_have(tbm);
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
 
         if ( ea.type == OP_REG )
             src.val = *ea.reg;
@@ -7879,7 +7857,7 @@ x86_emulate(
         case 0: /* lwpins $imm32,r/m,r */
         case 1: /* lwpval $imm32,r/m,r */
             /* LWP is unsupported, so produce #UD unconditionally. */
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
         goto unrecognized_insn;
 
@@ -7946,10 +7924,10 @@ x86_emulate(
     }
     else if ( state->simd_size )
     {
-        generate_exception_if(!op_bytes, EXC_UD);
+        generate_exception_if(!op_bytes, X86_EXC_UD);
         generate_exception_if((vex.opcx && (d & TwoOp) &&
                                (vex.reg != 0xf || (evex_encoded() && !evex.RX))),
-                              EXC_UD);
+                              X86_EXC_UD);
 
         if ( !opc )
             BUG();
@@ -7988,7 +7966,7 @@ x86_emulate(
             generate_exception_if(!(mxcsr & MXCSR_MM) &&
                                   !is_aligned(ea.mem.seg, ea.mem.off, op_bytes,
                                               ctxt, ops),
-                                  EXC_GP, 0);
+                                  X86_EXC_GP, 0);
 
             EXPECT(elem_bytes > 0);
             if ( evex.brs )
@@ -8159,14 +8137,15 @@ x86_emulate(
 
 #ifdef __XEN__
  emulation_stub_failure:
-    generate_exception_if(stub_exn.info.fields.trapnr == EXC_MF, EXC_MF);
-    if ( stub_exn.info.fields.trapnr == EXC_XM )
+    if ( stub_exn.info.fields.trapnr == X86_EXC_MF )
+        generate_exception(X86_EXC_MF);
+    if ( stub_exn.info.fields.trapnr == X86_EXC_XM )
     {
         unsigned long cr4;
 
         if ( !ops->read_cr || ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
             cr4 = X86_CR4_OSXMMEXCPT;
-        generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? EXC_XM : EXC_UD);
+        generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? X86_EXC_XM : X86_EXC_UD);
     }
     gprintk(XENLOG_WARNING,
             "exception %u (ec=%04x) in emulation stub (line %u)\n",
@@ -8174,7 +8153,8 @@ x86_emulate(
             stub_exn.line);
     gprintk(XENLOG_INFO, "  stub: %"__stringify(MAX_INST_LEN)"ph\n",
             stub.func);
-    generate_exception_if(stub_exn.info.fields.trapnr == EXC_UD, EXC_UD);
+    if ( stub_exn.info.fields.trapnr == X86_EXC_UD )
+        generate_exception(X86_EXC_UD);
     domain_crash(current->domain);
 #endif
 
-- 
2.30.2


