Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC01C098C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 23:39:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUGtz-00009y-Ai; Thu, 30 Apr 2020 21:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBcg=6O=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jUGtw-000093-W7
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 21:39:25 +0000
X-Inumbo-ID: 09c8fe46-8b2b-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09c8fe46-8b2b-11ea-b07b-bc764e2007e4;
 Thu, 30 Apr 2020 21:39:15 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id h26so6414019qtu.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 14:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=AncuIrtqWr0M0ryAYuV0xz3NF3lZ3Hxa1ZpzdFuZ2U4=;
 b=dZOtPdCaJ61/VEcq2spuUoOjceHhvF/sSC1VKBxuVBV/Mgv7CDP91fA5ukBtk4EFSU
 dD4fa3iC0qqjYzRPPiLZXxFwlPqEMHxk5e9yHB370Lt7gLUpTcpeX6y18A8e+06LUA6h
 yWiHKv+M05qj8/3ujRSE85cDzDWkObMoEEFNmlqjoS0kMiCVPETH92kuFyt2kVFkbPoH
 1MlMcumqQ4ncUfmz/pJLeT8NsQS4IS0KyHZadSIjxSI4Kl61hZPP1Biw+VKcFST1V7ec
 ufMJeZy7t5pdifOL60Uf5VwVfoEWVsIOAb0iGMXxZmykaUnOoBZumtju8F52kOIhSF4w
 WWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=AncuIrtqWr0M0ryAYuV0xz3NF3lZ3Hxa1ZpzdFuZ2U4=;
 b=fx+qUu9l3fwHMcAxxvl5lvzMUuP5HKoRVzdY4nsy3mOqToa30/f2Inu4JPYvAyXGEy
 EjsiUctu4Me0eZ9vo1StroVIp2424QKt0x36iGdVDTDuL6FPJAa7HrsHa5HQ3+WY1/Lv
 G3HtyUGJn2a3pJxsEd+8O5WvcnlOHAhsL663Ptu7OW+82gTzKhGDnNKwNhgw63F1I9VK
 lBa5oiZwBcUluF9+HpVNHnEuYueTmwwAuevwqeuW0mMcYhVydl47n2+aY4CVMZg4AaC4
 WH6CRs876AbXDpZksrQMrOyijDaFe9cy0Yp2P5n4V2TYByQyAW0mbd3rM9C/lAe8uCa4
 /h8w==
X-Gm-Message-State: AGi0PuYssvkh6p47b0Ikva/3ToqHPPyzn6fVZb5WjcuSHjuWdN02GSrr
 qZHZ6tbGoUMSRW/SEjy4LLlwoUopkB8=
X-Google-Smtp-Source: APiQypK8FRqyUqtl+x0hDekMskLrXFlcPjGA/R2OXUs6k7+5nDqtncXsNCaCEle9EhlMYFOVmnyH4g==
X-Received: by 2002:ac8:32a4:: with SMTP id z33mr586119qta.363.1588282753569; 
 Thu, 30 Apr 2020 14:39:13 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id b42sm922476qta.29.2020.04.30.14.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:39:12 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] golang/xenlight: add necessary module/package
 documentation
Date: Thu, 30 Apr 2020 17:39:01 -0400
Message-Id: <9f5000ceea14e6818e491df38eba161c800b4cf8.1588282027.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588282027.git.rosbrookn@ainfosec.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1588282027.git.rosbrookn@ainfosec.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a README and package comment giving a brief overview of the package.
These also help pkg.go.dev generate better documentation.

Also, add a copy of Xen's license to tools/golang/xenlight. This is
required for the package to be shown on pkg.go.dev and added to the
default module proxy, proxy.golang.org.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/LICENSE     | 416 ++++++++++++++++++++++++++++++
 tools/golang/xenlight/README.md   |  17 ++
 tools/golang/xenlight/xenlight.go |   2 +
 3 files changed, 435 insertions(+)
 create mode 100644 tools/golang/xenlight/LICENSE
 create mode 100644 tools/golang/xenlight/README.md

diff --git a/tools/golang/xenlight/LICENSE b/tools/golang/xenlight/LICENSE
new file mode 100644
index 0000000000..a4bc2b2dd4
--- /dev/null
+++ b/tools/golang/xenlight/LICENSE
@@ -0,0 +1,416 @@
+
+GNU General Public License
+--------------------------
+
+Most files in this repository are licensed under the terms of the GNU
+General Public License (GPL), a copy of which is attached at the end
+of this notice. Note that the only valid version of the GPL as far as
+the files in this repository are concerned is _this_ particular
+version of the license (i.e., *only* v2, not v2.2 or v3.x or
+whatever), unless explicitly otherwise stated.
+
+Some code fragments in the hypervisor and associated subsystems
+include other license stanzas: the most common ones are listed in
+the *License Exceptions* section of this file.
+
+When these code sections are compiled as part of a
+GPLv2-licensed program, such as Xen, the result is licensed under
+GPLv2. See the FSF's definition of GPL compatibility:
+ http://www.gnu.org/licenses/gpl-faq.html#WhatDoesCompatMean
+And how this applies to a range of open source licenses:
+ http://www.gnu.org/licenses/license-list.html
+
+A number of files will also specify GPL exceptions, such as
+ - Autoconf exception
+ - Bison exception
+ - GCC exception
+
+In addition the xen directory also contains a XEN NOTICE clarifying
+what constitutes a derived work, which applies to the xen directory
+and its subdirectories (see xen/COPYING).
+
+Licensing Exceptions
+--------------------
+
+For the convenience of users and those who are porting OSes to run as
+Xen guests, certain files in this repository are not subject to the
+GPL when distributed separately or included in software packages
+outside this repository.
+
+Instead we specify more relaxed licenses, depending on need, such as
+  - BSD style license (BSD Original, BSD Modified, Intel BSD)
+  - MIT license
+  - LGPL 2.1
+
+Affected files include the Xen interface headers (xen/include/public),
+various drivers, support functions and header files within Xen-aware
+Linux source trees. In all such cases, license terms are stated at the
+top of the file or in a COPYING file in the same directory.
+
+Sphinx documentation is licensed under CC-BY 4.0.  See
+docs/README.source for more specific information.
+
+In some cases, compatible 3rd party code has been imported into the
+Xen tree, retaining the original license, such as
+  - AES-128 3.0
+  - FSF Unlimited License
+  - Laurikari License
+  - Public Domain
+  - ZLIB License
+
+Significant code imports are highlighted in a README.source file
+in the directory into which the file or code snippet was imported.
+
+Note that *any* file that is modified and then distributed within a
+Linux kernel is still subject to the GNU GPL.
+
+Contributions
+-------------
+
+Contributions are governed by the license that applies to the relevant
+specific file or by the license specified in the COPYING file, that
+governs the license of its containing directory and its subdirectories.
+
+For more information, see the CONTRIBUTING file.
+
+=====================================================================
+
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+			    Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Library General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+	    How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; If not, see <http://www.gnu.org/licenses/>.
+
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/tools/golang/xenlight/README.md b/tools/golang/xenlight/README.md
new file mode 100644
index 0000000000..42240e2132
--- /dev/null
+++ b/tools/golang/xenlight/README.md
@@ -0,0 +1,17 @@
+# xenlight
+
+## About
+
+The xenlight package provides Go bindings to Xen's libxl C library via cgo. The package is currently in an unstable "preview" state. This means the package is ready for initial use and evaluation, but is not yet fully functional. Namely, only a subset of libxl's API is implemented, and breaking changes may occur in future package versions.
+
+Much of the package is generated using the libxl IDL. Changes to the generated code can be made by modifying `tools/golang/xenlight/gengotypes.py` in the xen.git tree.
+
+## Getting Started
+
+```go
+import (
+        "xenbits.xen.org/git-http/xen.git/tools/golang/xenlight"
+)
+```
+
+The module is not yet tagged independently of xen.git, so expect to see `v0.0.0-<date>-<git hash>` as the package version. If you want to point to a Xen release, such as 4.14.0, you can run `go get xenbits.xen.org/git-http/xen.git/tools/golang/xenlight@RELEASE-4.14.0`.
diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 6b4f492550..3eaa5a3d63 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -14,6 +14,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
+
+// Package xenlight provides bindings to Xen's libxl C library.
 package xenlight
 
 /*
-- 
2.17.1


