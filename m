Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31EE2D48D5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48626.86004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn481-0002JM-8V; Wed, 09 Dec 2020 18:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48626.86004; Wed, 09 Dec 2020 18:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn481-0002Ix-4e; Wed, 09 Dec 2020 18:23:53 +0000
Received: by outflank-mailman (input) for mailman id 48626;
 Wed, 09 Dec 2020 18:23:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kn480-0002Ip-2I; Wed, 09 Dec 2020 18:23:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kn47z-00073M-Pi; Wed, 09 Dec 2020 18:23:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kn47z-0005w7-H4; Wed, 09 Dec 2020 18:23:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kn47z-00064a-Gb; Wed, 09 Dec 2020 18:23:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=r0XOfH+LXwKOAVZpzBBZg2PbQfyc4/tUF1177JCJ6bg=; b=4y5r8WceHgDy6m8sbdQuuYIp+L
	mYbCFnhceFn9+f1Jl8hnR5kEfz4YCm2NWPBaP1vDWS01wHa3uTMZ8cdhogCOp8a1IsXStK9yeKPS1
	paZIn6cneOLXq/2FusFKW36Rv94Sv5nigptz2X0CWDTNestLzmSnDpNIJjDTspbFCnLw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157348-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157348: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=272a1db63a09087ce3da4cf44ec7b758611ff1ed
X-Osstest-Versions-That:
    ovmf=f95e80d832e923046c92cd6f0b8208cec147138e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Dec 2020 18:23:51 +0000

flight 157348 ovmf real [real]
flight 157350 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/157348/
http://logs.test-lab.xenproject.org/osstest/logs/157350/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 157345

version targeted for testing:
 ovmf                 272a1db63a09087ce3da4cf44ec7b758611ff1ed
baseline version:
 ovmf                 f95e80d832e923046c92cd6f0b8208cec147138e

Last test of basis   157345  2020-12-09 12:40:46 Z    0 days
Testing same since   157348  2020-12-09 15:39:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Not pushing.

------------------------------------------------------------
commit 272a1db63a09087ce3da4cf44ec7b758611ff1ed
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Nov 13 11:31:01 2020 +0000

    ArmPlatformPkg: Fix cspell reported spelling/wording
    
    The edk2 CI runs the "cspell" spell checker tool. Some words
    are not recognized by the tool, triggering errors.
    This patch modifies some spelling/wording detected by cspell.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 061cbbc1115eb7360f2c7627d53d13e35d63cbe3
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Nov 20 10:01:13 2020 +0000

    ArmPlatformPkg: Fix Ecc error 8001 in PrePi
    
    This patch fixes the following Ecc reported error:
    Only capital letters are allowed to be used for #define
    declarations
    
    The "SerialPrint" macro is definied for the PrePi module
    residing in the ArmPlatformPkg. It is never used in the module.
    The macro is thus removed.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 2dfd81aaf50ca2bd1e2d33ed5687620de90810ce
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Nov 6 09:47:47 2020 +0000

    ArmPlatformPkg: Fix Ecc error 10006 in ArmPlatformPkg.dsc
    
    This patch fixes the following Ecc reported error:
    There should be no unnecessary inclusion of library
    classes in the INF file
    
    This comes with the additional information:
    "The Library Class [TimeBaseLib] is not used
    in any platform"
    "The Library Class [PL011UartClockLib] is not used
    in any platform"
    "The Library Class [PL011UartLib] is not used
    in any platform"
    
    Indeed, the PL011SerialPortLib module requires the
    PL011UartClockLib and PL011UartLib libraries.
    The PL031RealTimeClockLib module requires the TimeBaseLib
    library.
    ArmPlatformPkg/ArmPlatformPkg.dsc builds the two modules,
    but doesn't build the required libraries. This patch adds
    the missing libraries to the [LibraryClasses.common] section.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 42bec8c8104c9db4891dfd1b208032c9c413d861
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 15:33:12 2020 +0100

    ArmPlatformPkg: Fix Ecc error 10014 in SP805WatchdogDxe
    
    This patch fixes the following Ecc reported error:
    No used module files found
    
    The source file
    [ArmPlatformPkg/Drivers/SP805WatchdogDxe/SP805Watchdog.h]
    is existing in module directory but it is not described
    in INF file.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 2e0cbfcbed96505953ef09fcfb72d4ea83cc8df2
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 15:32:42 2020 +0100

    ArmPlatformPkg: Fix Ecc error 10014 in PL061GpioDxe
    
    This patch fixes the following Ecc reported error:
    No used module files found
    
    The source file
    [ArmPlatformPkg/Drivers/PL061GpioDxe/PL061Gpio.h]
    is existing in module directory but it is not described
    in INF file.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit a36a0f1d81a2502a922617cf99be0bb81de2f57a
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 15:32:26 2020 +0100

    ArmPlatformPkg: Fix Ecc error 10014 in LcdGraphicsOutputDxe
    
    This patch fixes the following Ecc reported error:
    No used module files found
    
    The source file
    [ArmPlatformPkg/Drivers/LcdGraphicsOutputDxe/LcdGraphicsOutputDxe.h]
    is existing in module directory but it is not described
    in INF file.
    
    Files in [Sources.common] are also alphabetically re-ordered.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit c5d970a01e76c1a20f6bb009b32e479ad2444548
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 15:18:04 2020 +0100

    ArmPlatformPkg: Fix Ecc error 10016 in LcdPlatformNullLib
    
    This patch fixes the following Ecc reported error:
    Module file has FILE_GUID collision with other
    module file
    
    The two .inf files with clashing GUID are:
    edk2\ArmPlatformPkg\PrePeiCore\PrePeiCoreMPCore.inf
    edk2\ArmPlatformPkg\Library\LcdPlatformNullLib\LcdPlatformNullLib.inf
    
    The PrePeiCoreMPCore module has been imported in 2011 and the
    LcdPlatformNullLib module has been created in 2017. The
    PrePeiCoreMPCore has the precedence.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 746dda63b2d612a2ad9e0b4c05722920586d2e60
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 14:37:14 2020 +0100

    ArmPlatformPkg: Fix Ecc error 10016 in PrePi
    
    This patch fixes the following Ecc reported error:
    Module file has FILE_GUID collision with other
    module file
    
    The two .inf files with clashing GUID are:
    edk2\ArmPlatformPkg\PrePi\PeiUniCore.inf
    edk2\ArmPlatformPkg\PrePi\PeiMPCore.inf
    
    Both files seem to have been imported from the previous
    svn repository as the same time.
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 28978df0bdafce1d26ff337fd67ee6c3a5b3876e
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 14:36:19 2020 +0100

    ArmPlatformPkg: Fix Ecc error 5007 in PL031RealTimeClockLib
    
    This patch fixes the following Ecc reported error:
    There should be no initialization of a variable as
    part of its declaration
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 1485e8bbc86e9a7e1954cfe5697fbd45d8e3b04e
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 14:36:01 2020 +0100

    ArmPlatformPkg: Fix Ecc error 5007 in PL061GpioDxe
    
    This patch fixes the following Ecc reported error:
    There should be no initialization of a variable as
    part of its declaration
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 4c7e107810cacd1dbd4c6f7d6d4d22e3de2f8db1
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 14:35:36 2020 +0100

    ArmPlatformPkg: Fix Ecc error 5007 in NorFlashDxe
    
    This patch fixes the following Ecc reported error:
    There should be no initialization of a variable as
    part of its declaration
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit eb97f13839fd64ce3e4ff9dd39ea9950db48207d
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 14:35:07 2020 +0100

    ArmPlatformPkg: Fix Ecc error 5007 in LcdGraphicsOutputDxe
    
    This patch fixes the following Ecc reported error:
    There should be no initialization of a variable as
    part of its declaration
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit d315bd2286cde306f1ef5256026038e610505cca
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 14:32:40 2020 +0100

    ArmPlatformPkg: Fix Ecc error 3002 in PL061GpioDxe
    
    This patch fixes the following Ecc reported error:
    Non-Boolean comparisons should use a compare operator
    (==, !=, >, < >=, <=)
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit ee78edceca89057ab9854f7e5070391a8229ece4
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 14:31:50 2020 +0100

    ArmPlatformPkg: Fix Ecc error 3002 in PL011UartLib
    
    This patch fixes the following Ecc reported error:
    Non-Boolean comparisons should use a compare operator
    (==, !=, >, < >=, <=)
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit dd917bae85396055ff5d6ea760bff3702d154101
Author: Pierre Gondois <Pierre.Gondois@arm.com>
Date:   Fri Oct 23 13:31:40 2020 +0100

    ArmPlatformPkg: Fix Ecc error 3001 in NorFlashDxe
    
    This patch fixes the following Ecc reported error:
    Boolean values and variable type BOOLEAN should not use
    explicit comparisons to TRUE or FALSE
    
    Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

