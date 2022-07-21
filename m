Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335857D6DD
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 00:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372950.605048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEecG-0004v7-9p; Thu, 21 Jul 2022 22:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372950.605048; Thu, 21 Jul 2022 22:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEecG-0004sE-6P; Thu, 21 Jul 2022 22:25:56 +0000
Received: by outflank-mailman (input) for mailman id 372950;
 Thu, 21 Jul 2022 22:25:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEecE-0004s2-CZ; Thu, 21 Jul 2022 22:25:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEecE-0004jx-7l; Thu, 21 Jul 2022 22:25:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oEecD-0005eN-Ts; Thu, 21 Jul 2022 22:25:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oEecD-0001NE-TO; Thu, 21 Jul 2022 22:25:53 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=mhAL+VOCgqnKNkroIaN4W/tqGWglPBdASyu4mPaOUZ4=; b=q+FyTwXTdtvfxEGT0Aj4YioW0N
	HHSdrlSPLA9BKT/qt0lVCM+zvUk6sp3LTk2TZLcgRdCxO8suUaO5FSRc6vDXFVIb2JV6kW9LPm7VN
	O0MNW/Hwt+xY6KLHL7r/ezPkV+4apFiPqRWeP93ihnpGuYh8vNT3/iZu+JbW+X8AOVvw=;
To: xen-devel@lists.xenproject.org
Subject: [libvirt bisection] complete build-amd64-libvirt
Message-Id: <E1oEecD-0001NE-TO@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 Jul 2022 22:25:53 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  ccfdc6b02932efda5d76e2cd40857db651fca684
  Bug not present: 2c846fa6bcc11929c9fb857a22430fb9945654ad
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171750/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build --summary-out=tmp/171750.bisection-summary --basis-template=151777 --blessings=real,real-bisect,real-retry libvirt build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 171713 fail [host=himrod0] / 151777 [host=albana0] 151754 [host=albana0] 151729 [host=albana0] 151698 [host=godello1] 151665 [host=godello1] 151638 [host=fiano0] 151608 [host=godello0] 151564 [host=godello0] 151527 [host=godello0] 151496 [host=godello1] 151469 [host=godello1] 151417 [host=godello1] 151396 [host=godello0] 151370 [host=godello0] 151352 [host=godello0] 151330 [host=godello1] 151308 [host=godello1] 151251 [host=godello1] 151229 [host=godello1] 151197 [host=godello1] 151165 [host=go\
 dello1] 151091 [host=albana1] 151062 [host=chardonnay1] 151040 [host=fiano1] 150997 [host=godello1] 150932 [host=godello0] 146182 [host=rimava1] 146156 [host=huxelrebe1] 146103 [host=fiano0] 146061 [host=chardonnay1] 145969 [host=godello1] 145906 [host=godello1] 145842 [host=godello1] 145779 [host=godello0] 145511 [host=huxelrebe1] 145212 [host=godello0] 145173 [host=godello0] 145133 [host=godello1] 145054 [host=godello0] 144995 [host=godello1] 144958 [host=albana0] 144920 [host=godello0] 144885\
  [host=albana1] 144853 [host=godello1] 144828 [host=godello1] 144802 [host=godello0] 144517 [host=godello0] 144501 [host=godello1] 144408 [host=godello0] 144368 [host=godello1] 144345 [host=godello0] 144318 [host=godello1] 144304 [host=godello1] 144290 [host=godello1] 144279 [host=godello0] 144260 [host=godello1] 144244 [host=godello0] 144233 [host=chardonnay0] 144215 [host=chardonnay0] 144204 [host=godello0] 144192 [host=godello1] 144181 [host=godello1] 144165 [host=godello1] 144144 [host=godel\
 lo0] 144097 [host=godello1] 143904 [host=albana0] 143789 [host=godello1] 143589 [host=chardonnay1] 143484 [host=godello1] 143391 [host=huxelrebe1] 143316 [host=chardonnay1] 143263 [host=godello1] 143218 [host=huxelrebe1] 143189 [host=italia0] 143140 [host=italia1] 143051 [host=huxelrebe1] 143023 [host=debina0] 142949 [host=huxelrebe1] 142904 [host=italia0] 142862 [host=huxelrebe1] 142840 [host=godello0] 142798 [host=albana0] 142761 [host=italia0] 142644 [host=baroque0] 142584 [host=huxelrebe1] 1\
 42535 [host=huxelrebe1] 142476 [host=godello0] 142427 [host=godello0] 142384 [host=albana0] 142345 [host=huxelrebe1] 142252 [host=huxelrebe0] 142080 [host=chardonnay0] 141931 [host=godello1] 141893 [host=godello0] 141859 [host=huxelrebe1] 141806 [host=godello0] 141747 [host=huxelrebe1] 141683 [host=huxelrebe0] 141622 [host=godello1] 141569 [host=godello0] 141493 [host=huxelrebe0] 141456 [host=huxelrebe0] 141415 [host=godello1] 141384 [host=godello1] 141356 [host=godello0] 141296 [host=godello0] \
 141264 [host=huxelrebe0] 141241 [host=godello1] 141226 [host=albana1] 141205 [host=albana1] 141081 [host=albana0] 141033 [host=godello0] 140964 [host=godello1] 140904 [host=huxelrebe0] 140860 [host=godello1] 140822 [host=elbling1] 140784 [host=baroque0] 140738 [host=godello1] 140692 [host=godello0] 140598 [host=godello1] 140557 [host=godello0] 140510 [host=godello0] 140454 [host=godello0] 140398 [host=godello1] 140340 [host=godello0] 140277 [host=godello0] 140226 [host=godello1] 139853 [host=deb\
 ina0] 139829 [host=godello1] 139790 [host=huxelrebe1] 139756 [host=italia0] 139688 [host=albana1] 139663 [host=italia0] 139627 [host=godello1] 139585 [host=godello1] 139551 [host=godello0] 139516 [host=debina0] 139476 [host=godello0] 139423 [host=godello0] 139393 [host=godello0] 139358 [host=godello0] 139328 [host=albana1] 139303 [host=albana0] 139193 [host=albana1] 139147 [host=godello1] 139076 [host=godello1] 139037 [host=albana0] 138970 [host=albana1] 138940 [host=godello1] 138912 [host=itali\
 a0] 138895 [host=godello0] 138876 [host=godello0] 138850 [host=godello1] 138815 [host=albana0] 138804 [host=godello0] 138765 [host=godello0] 138718 [host=godello0] 138695 [host=italia0] 138618 [host=albana0] 138596 [host=albana0] 138569 [host=godello1] 138461 [host=godello0] 138327 [host=godello1] 138190 [host=albana0] 138048 [host=godello0] 137929 [host=godello1] 137736 [host=godello1] 137696 [host=albana1] 137604 [host=godello1] 137460 [host=elbling1] 137375 [host=albana1] 137271 [host=albana1\
 ] 137120 [host=rimava1] 137099 [host=godello0] 137063 [host=elbling1] 137022 [host=elbling1] 136910 [host=chardonnay1] 136828 [host=pinot1] 136609 [host=godello1] 136480 [host=albana0] 136321 [host=godello1] 136197 [host=albana0] 136021 [host=baroque1] 135927 [host=rimava1] 135818 [host=albana0] 135687 [host=godello0] 135486 [host=godello1] 135437 [host=rimava1] 135413 [host=rimava1] 135160 [host=pinot1] 135017 [host=pinot1] 134942 [host=albana1] 134793 [host=rimava1] 134685 [host=godello1] 1340\
 04 [host=albana1] 133987 [host=godello0] 133967 [host=albana0] 133930 [host=albana1] 133876 [host=albana0] 133846 [host=godello0] 133798 [host=albana0] 133757 [host=albana0] 133728 [host=albana0] 133672 [host=albana0] 133646 [host=godello0] 133612 [host=godello0] 133582 [host=albana0] 133512 [host=albana0] 133488 [host=albana0] 133460 [host=baroque0] 133368 [host=godello1] 133320 [host=albana0] 133272 [host=godello1] 132941 [host=godello0] 132846 [host=albana0] 132776 [host=godello0] 132745 [hos\
 t=godello0] 132664 [host=godello0] 132605 [host=godello1] 132541 [host=godello1] 132511 [host=godello1] 132490 [host=godello1] 132469 [host=godello1] 132453 [host=albana0] 132411 [host=italia0] 132318 [host=godello0] 132083 [host=rimava1] 132027 [host=godello1] 131978 [host=rimava1] 131964 [host=godello0] 131857 [host=godello0] 131792 [host=godello1] 131766 [host=godello1] 131747 [host=godello1] 131730 [host=baroque0] 131710 [host=godello0] 131679 [host=godello1] 131516 [host=godello1] 131484 [h\
 ost=godello0] 131453 [host=godello1] 131433 [host=godello1] 131392 [host=debina0] 131364 [host=godello1] 131338 [host=godello1] 131311 [host=debina0] 131287 [host=albana0] 131219 [host=godello0] 131183 [host=fiano0] 131147 [host=godello0] 131116 [host=albana0] 131070 [host=godello0] 130995 [host=albana0] 130894 [host=fiano0] 130856 [host=rimava1] 130824 [host=albana0] 130113 [host=baroque0] 129914 [host=baroque1] 129752 [host=godello0] 129594 [host=chardonnay0] 129491 [host=godello0] 129434 [hos\
 t=debina0] 129353 [host=albana0] 129292 [host=baroque1] 129249 [host=baroque1] 129168 [host=baroque1] 128963 [host=albana0] 128942 [host=albana1] 128918 [host=baroque1] 128880 [host=godello0] 128859 [host=albana0] 128833 [host=godello1] 128724 [host=godello0] 128665 [host=albana0] 128603 [host=fiano1] 128521 [host=albana0] 128441 [host=godello0] 128402 [host=godello1] 128367 [host=huxelrebe1] 128331 [host=godello1] 128304 [host=huxelrebe1] 128249 [host=godello0] 123814 [host=godello1] 123575 [ho\
 st=huxelrebe0] 123456 [host=godello1] 123391 [host=godello0] 123334 [host=baroque0] 123285 [host=godello1] 123212 [host=huxelrebe0] 123189 [host=chardonnay1] 123120 [host=godello1] 123010 [host=chardonnay1] 122962 [host=godello1] 122887 [host=baroque0] 122801 [host=chardonnay0] 122669 [host=godello0] 122561 [host=elbling1] 122554 [host=godello0] 122527 [host=godello1] 122494 [host=godello1] 122455 [host=godello0] 122404 [host=godello0] 122344 [host=godello0] 122300 [host=godello1] 122224 [host=i\
 talia0] 122182 [host=chardonnay0] 122167 [host=huxelrebe0] 122154 [host=godello0] 122005 [host=huxelrebe0] 121946 [host=godello0] 121771 [host=godello0] 121735 [host=godello0] 121707 [host=godello1] 121380 [host=huxelrebe0] 121339 [host=huxelrebe1] 121310 [host=huxelrebe1] 121283 [host=baroque1] 121101 [host=godello1] 121051 [host=godello0] 120982 [host=godello0] 120921 [host=chardonnay1] 120863 [host=fiano0] 120785 [host=godello0] 120666 [host=italia0] 120496 [host=huxelrebe1] 120378 [host=baro\
 que1] 120326 [host=godello0] 120277 [host=godello0] 120188 [host=godello1] 120122 [host=godello1] 120084 [host=huxelrebe0] 120053 [host=baroque0] 120004 [host=italia0] 119991 [host=godello1] 119943 [host=italia0] 119874 [host=italia0] 119792 [host=fiano0] 119702 [host=huxelrebe0] 119539 [host=fiano0] 119464 [host=chardonnay1] 119370 [host=pinot0] 119237 [host=godello0] 119049 [host=godello0] 118829 [host=godello0] 118735 [host=godello0] 118667 [host=godello0] 118632 [host=fiano0] 118605 [host=it\
 alia0] 118557 [host=chardonnay1] 118545 [host=godello0] 118505 [host=godello1] 118468 [host=godello1] 118447 [host=godello1] 118394 [host=baroque0] 118357 [host=godello0] 118319 [host=elbling1] 118278 [host=fiano0] 118237 [host=godello0] 118200 [host=huxelrebe0] 118137 [host=godello0] 118088 [host=godello1] 117772 [host=godello0] 117737 [host=godello0] 117662 [host=huxelrebe0] 117589 [host=pinot1] 117382 [host=godello0] 117316 [host=godello1] 117233 [host=baroque0] 117182 [host=godello1] 117133 \
 [host=godello0] 116965 [host=baroque1] 116935 [host=godello0] 116902 [host=baroque0] 116849 [host=godello1] 116770 [host=godello1] 116732 [host=godello0] 116698 [host=godello1] 116651 [host=godello1] 116607 [host=chardonnay0] 116520 [host=baroque0] 116492 [host=nobling0] 116465 [host=huxelrebe1] 116430 [host=chardonnay0] 116362 [host=godello0] 116328 [host=italia0] 116304 [host=baroque0] 116248 [host=merlot1] 116216 [host=huxelrebe1] 116185 [host=godello0] 116153 [host=godello0] 116130 [host=god\
 ello0] 115717 [host=godello1] 115660 [host=rimava1] 115636 [host=nobling0] 115605 [host=godello1] 115583 [host=fiano0] 115549 [host=rimava0] 115509 [host=nobling1] 115476 [host=merlot0] 115415 [host=merlot0] 115312 [host=godello1] 115282 [host=godello0] 115247 [host=godello0] 115202 [host=godello0] 114825 [host=nobling0] 114793 [host=godello1] 114713 [host=godello0] 114669 [host=huxelrebe0] 114531 [host=nobling0] 114503 [host=nobling0] 114452 [host=rimava1] 114395 [host=baroque1] 114088 [host=go\
 dello1] 114057 [host=huxelrebe1] 114030 [host=baroque1] 113990 [host=huxelrebe1] 113960 [host=nobling1] 113898 [host=godello1] 113873 [host=fiano0] 113851 [host=godello1] 113821 [host=godello0] 113763 [host=huxelrebe1] 113708 [host=godello0] 113652 [host=nobling1] 113616 [host=godello0] 113592 [host=nobling1] 113495 [host=godello1] 113465 [host=godello1] 113434 [host=huxelrebe1] 113394 [host=chardonnay0] 113350 [host=nobling1] 113159 [host=huxelrebe1] 113141 [host=huxelrebe0] 112276 [host=huxelr\
 ebe1] 112201 [host=huxelrebe0] 112119 [host=huxelrebe1] 112081 [host=godello1] 112036 [host=rimava0] 112002 [host=huxelrebe1] 111966 [host=huxelrebe0] 111915 [host=huxelrebe0] 111869 [host=huxelrebe1] 111792 [host=godello0] 111755 [host=godello1] 111718 [host=rimava0] 111662 [host=godello0] 111604 [host=italia1] 111552 [host=rimava0] 111458 [host=huxelrebe1] 111385 [host=rimava1] 111317 [host=rimava0] 111258 [host=godello1] 111209 [host=godello0] 111171 [host=godello1] 111133 [host=godello0] 111\
 061 [host=nocera1] 110999 [host=rimava0] 110962 [host=godello1] 110918 [host=godello0] 110512 [host=baroque0] 110480 [host=huxelrebe1] 110460 [host=godello0] 110425 [host=godello1] 110397 [host=elbling0] 110231 [host=godello1] 110162 [host=baroque0] 110107 [host=godello1] 110065 [host=elbling0] 110026 [host=godello1] 109962 [host=godello0] 109939 [host=chardonnay1] 109882 [host=huxelrebe0] 109846 [host=huxelrebe0] 109793 [host=huxelrebe1] 109759 [host=chardonnay0] 109736 [host=chardonnay1] 10970\
 9 [host=huxelrebe1] 109692 [host=godello0] 109637 [host=elbling1] 109603 [host=chardonnay0] 109561 [host=huxelrebe1] 109516 [host=elbling1] 109466 [host=godello0] 109375 [host=godello0] 109340 [host=godello1] 109301 [host=chardonnay1] 109246 [host=chardonnay1] 109203 [host=godello1] 109062 [host=godello1] 108177 [host=godello0] 107640 [host=godello1] 107613 [host=godello1] 107594 [host=elbling1] 107577 [host=huxelrebe1] 107556 [host=godello1] 107536 [host=godello1] 107442 [host=godello0] 107417 \
 [host=godello0] 107384 [host=godello1] 107362 [host=godello0] 107353 [host=huxelrebe1] 107325 [host=godello0] 107298 [host=huxelrebe1] 107262 [host=fiano1] 107207 [host=baroque0] 107172 [host=baroque0] 107143 [host=huxelrebe1] 107101 [host=italia0] 107056 [host=baroque0] 107016 [host=huxelrebe1] 106989 [host=huxelrebe1] 106952 [host=baroque0] 106931 [host=godello0] 106924 [host=baroque0] 106906 [host=godello1] 106883 [host=godello0] 106855 [host=chardonnay1] 106829 [host=godello0] 106800 [host=r\
 imava0] 106755 [host=huxelrebe0] 106707 [host=chardonnay1] 106678 [host=godello1] 106650 [host=godello0] 106628 [host=godello0] 106608 [host=godello1] 106594 [host=huxelrebe0] 106583 [host=baroque0] 106562 [host=godello1] 106543 [host=chardonnay1] 106510 [host=godello0] 106483 [host=huxelrebe0] 106473 [host=godello1] 106434 [host=godello0] 106394 [host=baroque0] 106352 [host=huxelrebe0] 106226 [host=huxelrebe0] 106101 [host=godello0] 105973 [host=godello1] 105938 [host=godello0] 105921 [host=hux\
 elrebe0] 105902 [host=nocera0] 105895 [host=godello0] 105870 [host=godello1] 105805 [host=italia1] 105785 [host=godello0] 105759 [host=huxelrebe0] 105720 [host=italia1] 105684 [host=godello0] 105657 [host=huxelrebe0] 105624 [host=huxelrebe0] 105434 [host=godello0] 105325 [host=huxelrebe0] 105262 [host=italia1] 105188 [host=huxelrebe0] 105075 [host=nobling0] 104989 [host=godello1] 104886 [host=godello1] 104742 [host=godello1] 104685 [host=italia1] 104636 [host=nobling0] 104617 [host=nobling1] 104\
 579 [host=godello0] 104401 [host=merlot0] 104327 [host=nobling1] 104283 [host=godello0] 104238 [host=nobling1] 104199 [host=huxelrebe1] 104179 [host=nobling1] 104158 [host=huxelrebe1] 104134 [host=nobling0] 104110 [host=nobling0] 104093 [host=elbling1] 104076 [host=elbling1] 104072 [host=nobling1] 104053 [host=nobling1] 104036 [host=nobling1] 104021 [host=huxelrebe1] 104005 [host=huxelrebe1] 103915 [host=nobling1] 103827 [host=nobling0] 103798 [host=nobling1] 103479 [host=godello0] 103403 [host=\
 godello0] 103329 [host=baroque0] 103263 [host=godello0] 103190 [host=godello1] 103065 [host=huxelrebe0] 102983 [host=godello1] 102921 [host=chardonnay0] 102830 [host=godello1] 102776 [host=godello1] 102750 [host=nobling0] 102726 [host=baroque0] 102706 [host=godello0] 102660 [host=godello0] 102640 [host=chardonnay1] 102603 [host=nobling0] 102550 [host=godello1] 102503 [host=nobling0] 102469 [host=godello1] 102443 [host=baroque0] 102375 [host=baroque0] 102332 [host=chardonnay1] 102283 [host=godell\
 o0] 102251 [host=godello0] 102178 [host=fiano1] 102144 [host=baroque0] 102108 [host=godello0] 102082 [host=nobling0] 102058 [host=godello1] 102026 [host=chardonnay1] 101948 [host=godello0] 101915 [host=godello1] 101854 [host=baroque0] 101839 [host=baroque0] 101773 [host=chardonnay1] 101738 [host=godello0] 101711 [host=godello0] 101677 [host=godello1] 101656 [host=godello1] 101640 [host=nobling0] 101629 [host=elbling1] 101602 [host=elbling1] 101573 [host=godello0] 101557 [host=chardonnay1] 101538\
  [host=godello0] 101502 [host=godello1] 101477 [host=godello0] 101461 [host=italia0] 101436 [host=italia0] 101412 [host=godello0] 101386 [host=godello1] 101368 [host=chardonnay0] 101349 [host=chardonnay0] 101333 [host=godello1] 101321 [host=godello0] 101301 [host=godello0] 101270 [host=huxelrebe1] 101232 [host=huxelrebe1] 101218 [host=huxelrebe1] 101200 [host=godello1] 101176 [host=huxelrebe1] 101161 [host=godello1] 101142 [host=baroque1] 101120 [host=huxelrebe1] 101094 [host=pinot0] 101072 [hos\
 t=huxelrebe1] 101029 [host=godello1] 100999 [host=godello1] 100995 [host=godello1] 100962 [host=godello1] 100945 [host=huxelrebe1] 100912 [host=baroque1] 100866 [host=godello0] 100837 [host=baroque1] 100802 [host=huxelrebe1] 100782 [host=godello0] 100744 [host=godello1] 100715 [host=baroque1] 100671 [host=godello0] 100658 [host=huxelrebe1] 100643 [host=huxelrebe1] 100628 [host=godello0] 100615 [host=baroque1] 100603 [host=italia0] 100593 [host=italia0] 100575 [host=godello0] 100571 [host=baroque\
 1] 100553 [host=baroque1] 100538 [host=huxelrebe1] 100525 [host=huxelrebe1] 100509 [host=italia0] 100482 [host=fiano0] 100472 [host=godello0] 100426 [host=fiano0] 100404 [host=fiano0] 100381 [host=godello0] 99955 [host=chardonnay1] 99936 [host=baroque1] 99913 [host=italia0] 99895 [host=godello0] 99788 [host=godello0] 99738 [host=chardonnay1] 99696 [host=godello0] 97742 [host=godello0] 97688 [host=godello0] 97638 [host=godello0] 97416 [host=huxelrebe0] 97340 [host=godello1] 97286 [host=godello0] \
 97003 [host=godello0] 96904 [host=godello1] 96831 [host=baroque1] 96778 [host=godello0] 96664 [host=godello1] 96518 [host=baroque1] 96491 [host=baroque0] 96450 [host=huxelrebe0] 96364 [host=huxelrebe0] 96333 [host=pinot1] 96299 [host=fiano1] 96270 [host=baroque1] 96237 [host=godello0] 96204 [host=godello1] 96157 [host=godello0] 96095 [host=godello0] 96038 [host=godello1] 95913 [host=baroque0] 95873 [host=godello1] 95846 [host=pinot1] 95814 [host=baroque1] 95460 [host=godello0] 95419 [host=baroqu\
 e1] 95358 [host=baroque1] 95282 [host=baroque1] 95255 [host=baroque0] 95220 [host=baroque0] 95095 [host=huxelrebe0] 94970 [host=fiano1] 94874 [host=rimava0] 94785 [host=huxelrebe0] 94751 [host=huxelrebe0] 94734 [host=baroque0] 94591 [host=pinot1] 94572 [host=fiano1] 94539 [host=pinot1] 94502 [host=chardonnay1] 94465 [host=pinot1] 94338 [host=rimava0] 94142 [host=rimava0] 94073 [host=baroque0] 94052 [host=rimava0] 94018 [host=italia0] 93954 [host=rimava1] 93880 [host=pinot1] 93821 [host=italia0] \
 93731 [host=rimava1] 93589 [host=baroque0] 93516 [host=rimava0] 93388 [host=elbling1] 93343 [host=baroque1] 93284 [host=baroque0] 93223 [host=baroque1] 93129 [host=italia0] 92799 [host=baroque1] 92667 [host=godello0] 92533 [host=godello0] 92421 [host=godello1] 92320 [host=godello1] 91479 [host=godello0] 91380 [host=elbling1] 91230 [host=elbling1] 91073 [host=elbling1] 90907 [host=italia1] 88483 [host=godello0] 88359 [host=godello1] 88247 [host=elbling1] 88091 [host=elbling1] 87976 [host=godello1\
 ] 87831 [host=godello1] 87702 [host=godello0] 87404 [host=godello0] 87264 [host=godello1] 87134 [host=godello0] 86994 [host=godello0] 86883 [host=italia1] 86783 [host=baroque0] 86710 [host=elbling0] 86625 [host=italia1] 86536 [host=elbling0] 86448 [host=italia1] 86369 [host=godello0] 86026 [host=baroque1] 85976 [host=godello0] 85871 [host=godello1] 85689 [host=baroque1] 85412 [host=godello1] 85296 [host=godello0] 85151 [host=godello0] 85019 [host=godello0] 84468 [host=godello1] 84215 [host=fiano\
 1] 84072 [host=italia1] 83847 [host=godello0] 83714 [host=italia1] 83396 [host=pinot0] 83119 [host=huxelrebe0] 82949 [host=godello1] 82783 [host=godello1] 82637 [host=italia1] 82511 [host=godello1] 81975 [host=godello1] 81645 [host=godello1] 81366 [host=italia1] 81092 [host=godello1] 80855 [host=italia1] 80615 [host=godello1] 80382 [host=godello1] 80121 [host=pinot1] 79451 [host=pinot1] 79390 [host=godello1] 79209 [host=italia1] 79146 [host=godello0] 79069 [host=godello0] 78978 [host=italia1] 78\
 787 [host=godello0] 78659 [host=chardonnay0] 78582 [host=godello0] 78488 [host=italia0] 78311 [host=pinot0] 78228 [host=godello1] 78148 [host=godello1] 78066 [host=chardonnay1] 77993 [host=chardonnay1] 77934 [host=italia0] 77871 [host=baroque0] 77788 [host=godello0] 77684 [host=godello1] 77517 [host=godello1] 77324 [host=pinot0] 77211 [host=godello1] 77096 [host=godello1] 66919 [host=italia0] 66579 [host=huxelrebe1] 66498 [host=godello0] 66450 [host=godello1] 66413 [host=godello1] 65654 [host=ri\
 mava1] 65460 [host=godello0] 65419 [host=baroque0] 65394 [host=godello0] 65353 [host=godello0] 65324 [host=baroque0] 65296 [host=godello0] 65281 [host=nocera0] 65260 [host=nocera0] 65243 [host=italia0] 65177 [host=godello1] 65151 [host=baroque1] 65124 [host=godello0] 65096 [host=godello0] 65068 [host=godello1] 65035 [host=godello0] 65004 [host=pinot1] 64980 [host=godello1] 64932 [host=godello0] 64762 [host=pinot0] 64520 [host=godello0] 64408 [host=godello1] 64291 [host=godello1] 64179 [host=gode\
 llo1] 64130 [host=nocera0] 64021 [host=nocera1] 63903 [host=godello1] 63733 [host=godello0] 63702 [host=nocera1] 63578 [host=italia0] 63528 [host=godello1] 63469 [host=godello0] 63397 [host=godello0] 63373 [host=nocera0] 63352 [host=nocera1] 63340 [host=nocera0] 63231 [host=nocera1] 63207 [host=baroque0] 63022 [host=nocera0] 62995 [host=nocera0] 62973 [host=nocera0] 62955 [host=nocera0] 62942 [host=nocera0] 62807 [host=nocera1] 62727 [host=nocera1] 62701 [host=nocera0] 62666 [host=nocera0] 62618\
  [host=nocera1] 62551 [host=nocera1] 62435 [host=nocera1] 62281 [host=nocera0] 62175 [host=nocera0] 62098 [host=nocera1] 62029 [host=nocera0] 61890 [host=nocera0] 61770 [host=nocera0] 61675 [host=nocera0] 61593 [host=nocera1] 61304 [host=nocera0] 61259 [host=nocera1] 61008 [host=nocera0] 60961 [host=nocera1] 60880 [host=nocera1] 60848 [host=nocera0] 60814 [host=nocera0] 60779 [host=nocera1] 60715 [host=nocera0] 60681 [host=nocera1] 60663 [host=nocera0] 60650 [host=nocera0] 60629 [host=nocera1] 6\
 0612 [host=nocera1] 60568 [host=nocera1] 60183 [host=nocera1] 60102 [host=nocera1] 60058 [host=nocera0] 60006 [host=nocera0] 59948 [host=nocera0] 59907 [host=pinot1] 59834 [host=nocera1] 59787 [host=nocera0] 59768 [host=godello0] 59730 [host=godello0] 59650 [host=godello1] 59560 [host=godello0] 59533 [host=godello1] 59488 [host=nocera1] 59464 [host=nocera0] 59428 [host=nocera0] 59350 [host=nocera1] 59256 [host=nocera0] 59185 [host=nocera0] 59132 [host=nocera0] 59088 [host=nocera0] 59038 [host=no\
 cera0] 59020 [host=nocera1] 59004 [host=nocera0] 58984 [host=nocera0] 58967 [host=godello1] 58945 [host=nocera0] 58932 [host=nocera1] 58899 [host=nocera1] 58870 [host=nocera0] 58842 [host=nocera1] 58823 [host=godello1] 58767 [host=nocera0] 58738 [host=nocera0] 58713 [host=pinot0] 58643 [host=pinot0] 58510 [host=italia0] 58426 [host=nocera1] 58401 [host=nocera0] 58334 [host=godello1] 58230 [host=godello1] 58161 [host=nocera0] 58119 [host=nocera0] 58015 [host=nocera1] 57914 [host=nocera1] 57859 [h\
 ost=nocera0] 57792 [host=nocera1] 57652 [host=nocera1] 57517 [host=nocera1] 57444 [host=nocera1] 57291 [host=italia0] 57206 [host=godello1] 57124 [host=godello1] 57032 [host=nocera0] 56966 [host=nocera1] 56876 [host=nocera0] 56793 [host=nocera0] 56719 [host=nocera0] 56661 [host=nocera0] 56590 [host=nocera0] 56509 [host=nocera0] 56415 [host=godello0] 55443 [host=nocera0] 55349 [host=nocera1] 55257 [host=godello1] 53854 [host=italia0] 53749 [host=baroque1] 53657 [host=baroque1] 53293 [host=pinot1]\
  53021 [host=godello1] 52703 [host=pinot1] 50417 [host=godello0] 50401 [host=baroque1] 50385 [host=pinot1] 50368 [host=nocera0] 50325 [host=baroque0] 50308 [host=nocera0] 50277 [host=baroque0] 36774 [host=gall-mite] 36729 [host=rice-weevil] 36702 [host=bush-cricket] 36630 [host=bush-cricket] 36571 [host=moss-bug] 36520 [host=rice-weevil] 36071 [host=grain-weevil] 35968 [host=rice-weevil] 35907 [host=lace-bug] 35863 [host=grain-weevil] 35800 [host=bush-cricket] 35683 [host=itch-mite] 35524 [host=\
 grain-weevil] 35360 [host=rice-weevil] 35260 [host=itch-mite] 34801 [host=grain-weevil] 34668 [host=bush-cricket] 34580 [host=scape-moth] 34542 [host=grain-weevil] 34500 [host=scape-moth] 34464 [host=grain-weevil] 34420 [host=bush-cricket] 34292 [host=field-cricket] 34214 [host=grain-weevil] 34168 [host=scape-moth] 34128 [host=lace-bug] 33874 [host=bush-cricket] 33834 [host=grain-weevil] 33811 [host=scape-moth] 33772 [host=bush-cricket] 33698 [host=grain-weevil] 33657 [host=scape-moth] 33422 [ho\
 st=grain-weevil] 33404 [host=grain-weevil] 33382 [host=grain-weevil] 33354 [host=grain-weevil] 33316 [host=rice-weevil] 32648 [host=field-cricket] 32617 [host=field-cricket] 32596 [host=scape-moth] 32576 [host=bush-cricket] 32555 [host=field-cricket] 32534 [host=scape-moth] 32508 [host=scape-moth] 32471 [host=scape-moth] 32433 [host=scape-moth] 32414 [host=bush-cricket] 32351 [host=field-cricket] 32330 [host=field-cricket] 32308 [host=moss-bug] 32272 [host=grain-weevil] 32217 [host=worm-moth] 32\
 137 [host=field-cricket] 32005 [host=bush-cricket] 31928 [host=bush-cricket] 31860 [host=scape-moth] 31852 [host=field-cricket] 31839 [host=rice-weevil] 31827 [host=grain-weevil] 31787 [host=scape-moth] 31761 [host=field-cricket] 31680 [host=bush-cricket] 31660 [host=scape-moth] 31595 [host=rice-weevil] 31566 [host=field-cricket] 31532 [host=field-cricket] 31508 [host=field-cricket] 31485 [host=lace-bug] 31465 [host=bush-cricket] 31392 [host=rice-weevil] 31372 [host=bush-cricket] 31327 [host=wor\
 m-moth] 31284 [host=scape-moth] 31267 [host=scape-moth] 31242 [host=rice-weevil] 30985 [host=rice-weevil] 30919 [host=bush-cricket] 30869 [host=bush-cricket] 30857 [host=itch-mite] 30845 [host=bush-cricket] 30794 [host=rice-weevil] 30765 [host=scape-moth] 30748 [host=rice-weevil] 30731 [host=rice-weevil] 30718 [host=scape-moth] 30695 [host=rice-weevil] 30682 [host=field-cricket] 30668 [host=bush-cricket] 30658 [host=bush-cricket] 30599 [host=bush-cricket] 30589 [host=scape-moth] 30565 [host=scap\
 e-moth] 30544 [host=worm-moth] 30529 [host=worm-moth] 30517 [host=rice-weevil] 30408 [host=scape-moth] 30376 [host=scape-moth] 30357 [host=rice-weevil] 30337 [host=bush-cricket] 30324 [host=grain-weevil] 30313 [host=grain-weevil] 30297 [host=worm-moth] 30286 [host=worm-moth] 30275 [host=worm-moth] 30269 [host=rice-weevil] 30260 [host=bush-cricket] 30238 [host=scape-moth] 30226 [host=scape-moth] 30200 [host=scape-moth] 30179 [host=worm-moth] 30154 [host=grain-weevil] 30147 [host=rice-weevil] 3013\
 3 [host=scape-moth] 30105 [host=worm-moth] 30099 [host=grain-weevil] 30085 [host=bush-cricket] 30051 [host=worm-moth] 30033 [host=bush-cricket] 30020 [host=bush-cricket] 29997 [host=bush-cricket] 29972 [host=bush-cricket] 29956 [host=grain-weevil] 29943 [host=scape-moth] 29909 [host=bush-cricket] 29875 [host=scape-moth] 29845 [host=itch-mite] 29817 [host=itch-mite] 29789 [host=grain-weevil] 29757 [host=bush-cricket] 29729 [host=itch-mite] 29712 [host=gall-mite] 29693 [host=rice-weevil] 29681 [ho\
 st=gall-mite] 29676 [host=bush-cricket] 29670 [host=rice-weevil] 29664 [host=itch-mite] 29653 [host=rice-weevil] 29641 [host=rice-weevil] 29625 [host=bush-cricket] 29610 [host=rice-weevil] 29597 [host=bush-cricket] 29585 [host=grain-weevil] 29575 [host=bush-cricket] 29539 [host=bush-cricket] 29520 [host=grain-weevil] 29483 [host=bush-cricket] 29469 [host=moss-bug] 29457 [host=moss-bug] 29444 [host=moss-bug] 29434 [host=itch-mite] 29400 [host=bush-cricket] 29386 [host=itch-mite] 29377 [host=bush-\
 cricket] 29360 [host=grain-weevil] 29331 [host=bush-cricket] 29303 [host=field-cricket] 29190 [host=gall-mite] 29087 [host=itch-mite] 28938 [host=gall-mite] 28916 [host=itch-mite] 28875 [host=woodlouse] 27864 [host=grain-weevil] 27845 [host=field-cricket] 27782 [host=gall-mite] 27525 [host=bush-cricket] 27479 [host=bush-cricket] 27452 [host=itch-mite] 27428 [host=bush-cricket] 27413 [host=bush-cricket] 27393 [host=gall-mite] 27248 [host=lace-bug] 27159 [host=bush-cricket] 27069 [host=bush-cricke\
 t] 27058 [host=itch-mite] 27035 [host=itch-mite] 27021 [host=rice-weevil] 27005 [host=rice-weevil] 26994 [host=rice-weevil] 26970 [host=gall-mite] 26932 [host=rice-weevil] 26885 [host=moss-bug] 26664 [host=grain-weevil] 26551 [host=gall-mite] 26506 [host=gall-mite] 26483 [host=potato-beetle] 26372 [host=gall-mite] 26358 [host=itch-mite] 26314 [host=rice-weevil] 26292 [host=rice-weevil] 26262 [host=field-cricket] 26232 [host=rice-weevil] 26227 [host=gall-mite] 26205 [host=gall-mite] 26197 [host=i\
 tch-mite] 26175 [host=gall-mite] 26159 [host=moss-bug] 26144 [host=moss-bug] 26128 [host=moss-bug] 25911 [host=gall-mite] 25910 [host=gall-mite] 25903 [host=gall-mite] 25902 [host=leaf-beetle] template as basis? using template as basis.
Failure / basis pass flights: 171713 / 151777
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ccfdc6b02932efda5d76e2cd40857db651fca684 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 3b8cee1781c4149c7a762b8a1c8115b635cf4cad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-ccfdc6b02932efda5d76e2cd40857db651fca684 https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-57ba70da5312170883a3d622cd2aa3fd0e2ec7ae git://xenbits.xen.org/osstest/ovmf.git#bdafda8c457eb90c65f37026589b54258300f05c-3b8cee1781c4149c7a762b8a1c8115b635cf4cad git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db9934a34f816d\
 78b-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/osstest/seabios.git#88ab0c15525ced2eefe39220742efe4769089ad8-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#3fdc211b01b29f252166937238efe02d15cb5780-6fe2e39a0243bddba60f83b77b972a5922d25eb8
adhoc-revtuple-generator: tree discontiguous: libvirt
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 12668 nodes in revision graph
Searching for test results:
 151729 [host=albana0]
 151754 [host=albana0]
 151777 [host=albana0]
 151822 [host=albana1]
 151818 [host=albana1]
 151842 [host=albana1]
 151858 [host=albana1]
 151883 [host=albana0]
 151910 [host=albana0]
 151935 [host=albana0]
 151956 [host=albana0]
 151984 [host=albana1]
 152006 [host=albana1]
 152034 [host=albana0]
 152064 [host=albana0]
 152094 [host=albana1]
 152135 [host=albana0]
 152167 [host=albana0]
 152226 [host=albana1]
 152209 [host=albana1]
 152278 [host=albana1]
 152193 [host=albana0]
 152247 [host=albana1]
 152317 [host=albana1]
 152296 [host=albana1]
 152339 [host=albana0]
 152377 [host=albana0]
 152408 [host=albana1]
 152454 [host=albana0]
 152482 [host=albana0]
 152502 [host=albana0]
 152512 [host=albana0]
 152569 [host=albana0]
 152558 [host=albana1]
 152535 [host=albana0]
 152595 [host=albana1]
 152539 [host=albana0]
 152549 [host=albana0]
 152585 [host=albana1]
 152628 [host=albana1]
 152651 [host=albana1]
 152666 [host=albana0]
 152686 [host=albana0]
 152720 [host=albana1]
 162794 [host=himrod1]
 152784 [host=albana1]
 152845 [host=albana0]
 167361 [host=himrod2]
 152881 [host=albana0]
 162829 [host=himrod1]
 152955 []
 165325 [host=himrod2]
 153032 []
 162852 [host=himrod2]
 162870 [host=himrod1]
 162888 [host=himrod2]
 153144 []
 165373 [host=himrod2]
 165395 [host=himrod2]
 153338 []
 153440 []
 166965 [host=himrod2]
 153608 []
 165412 [host=himrod2]
 165424 [host=himrod2]
 165441 [host=himrod2]
 162985 [host=himrod1]
 153534 []
 153678 []
 163011 [host=himrod2]
 163026 [host=himrod2]
 153853 []
 153783 []
 165451 [host=himrod1]
 165461 [host=himrod1]
 153999 []
 166997 [host=himrod1]
 165473 [host=himrod2]
 167224 [host=himrod2]
 167226 [host=himrod1]
 153928 []
 163139 [host=himrod2]
 154043 [host=albana1]
 167238 [host=himrod1]
 163111 [host=himrod1]
 154097 [host=albana0]
 165489 [host=himrod1]
 154154 [host=himrod1]
 163164 [host=himrod1]
 165504 [host=himrod1]
 163178 [host=himrod1]
 154238 [host=himrod1]
 154313 [host=himrod1]
 154415 [host=himrod1]
 163191 [host=himrod1]
 163208 [host=himrod1]
 154353 [host=himrod1]
 154454 [host=himrod1]
 163223 [host=himrod2]
 154374 [host=himrod1]
 154561 [host=himrod2]
 163236 [host=himrod1]
 154605 [host=himrod2]
 154489 [host=himrod1]
 154632 [host=himrod2]
 163295 [host=himrod2]
 165516 [host=himrod2]
 154675 [host=himrod2]
 165533 [host=himrod1]
 163308 [host=himrod1]
 163322 [host=himrod1]
 154520 [host=himrod1]
 155067 [host=himrod1]
 165595 [host=himrod1]
 155123 [host=himrod1]
 167499 [host=himrod2]
 163382 [host=himrod1]
 155193 [host=himrod1]
 155429 [host=himrod2]
 163431 [host=himrod1]
 155301 [host=himrod1]
 155475 [host=himrod1]
 155500 [host=himrod1]
 155397 [host=himrod1]
 155511 [host=himrod1]
 155543 [host=himrod1]
 165633 [host=himrod2]
 155588 [host=himrod1]
 155721 [host=himrod1]
 165658 [host=himrod1]
 163466 [host=himrod2]
 155762 [host=himrod1]
 155793 [host=himrod1]
 155634 [host=himrod2]
 163510 [host=himrod2]
 155831 [host=himrod2]
 155678 [host=himrod2]
 155948 [host=himrod1]
 163555 [host=himrod1]
 155974 [host=himrod2]
 156012 [host=himrod2]
 155885 [host=himrod1]
 165683 [host=himrod1]
 155920 [host=himrod2]
 165702 [host=himrod1]
 156163 [host=himrod1]
 156059 [host=himrod2]
 156201 [host=himrod2]
 156082 [host=himrod1]
 156233 [host=himrod2]
 163588 [host=himrod2]
 156114 [host=himrod2]
 156253 [host=himrod2]
 156290 [host=himrod2]
 163630 [host=himrod2]
 156314 [host=himrod2]
 156273 [host=himrod2]
 156376 [host=himrod1]
 156328 [host=himrod2]
 165735 [host=himrod1]
 156391 [host=himrod1]
 156340 [host=himrod2]
 163669 [host=himrod1]
 156357 [host=himrod1]
 156509 [host=himrod2]
 156537 [host=himrod1]
 163704 [host=himrod2]
 156405 []
 156549 [host=himrod1]
 156579 [host=himrod2]
 156611 [host=himrod2]
 156639 [host=himrod2]
 167066 [host=himrod2]
 156800 [host=himrod2]
 163728 [host=himrod1]
 156808 [host=himrod2]
 156817 [host=himrod2]
 156671 [host=himrod2]
 163760 [host=himrod2]
 156828 [host=himrod2]
 163773 [host=himrod1]
 156702 [host=himrod2]
 156870 [host=himrod1]
 156847 [host=himrod1]
 163796 [host=himrod2]
 156731 [host=himrod1]
 156977 [host=himrod2]
 163829 [host=himrod2]
 156892 [host=himrod1]
 157000 [host=himrod2]
 157022 [host=himrod1]
 156915 [host=himrod1]
 157045 [host=himrod1]
 157067 [host=himrod1]
 165803 [host=himrod1]
 157084 [host=himrod2]
 157106 [host=himrod2]
 156938 [host=himrod1]
 157125 [host=himrod2]
 163862 [host=himrod1]
 156958 [host=himrod2]
 157150 [host=himrod1]
 157171 [host=himrod2]
 157251 [host=himrod2]
 165829 [host=himrod1]
 163893 [host=himrod2]
 157274 [host=himrod1]
 157195 [host=himrod1]
 167382 [host=himrod2]
 157339 [host=himrod1]
 157216 [host=himrod1]
 167390 [host=himrod2]
 167405 [host=himrod1]
 165852 [host=himrod1]
 157369 [host=himrod1]
 163933 [host=himrod2]
 157235 [host=himrod1]
 157404 []
 157453 [host=himrod2]
 157481 []
 157543 []
 163973 [host=himrod1]
 165871 [host=himrod1]
 163982 [host=himrod2]
 163994 [host=himrod1]
 157516 [host=himrod2]
 164004 [host=himrod2]
 157593 [host=himrod2]
 165890 [host=himrod1]
 164017 [host=himrod2]
 157715 [host=himrod2]
 157624 [host=himrod2]
 164032 [host=himrod1]
 157735 [host=himrod1]
 157661 [host=himrod2]
 157750 [host=himrod1]
 164050 [host=himrod2]
 157867 [host=himrod1]
 165922 [host=himrod1]
 157844 [host=himrod2]
 164063 [host=himrod2]
 165931 [host=himrod1]
 164070 [host=himrod2]
 164080 [host=himrod1]
 165944 [host=himrod1]
 157885 [host=himrod1]
 164088 [host=himrod1]
 157781 [host=himrod1]
 157904 [host=himrod1]
 157933 [host=himrod1]
 165955 [host=himrod2]
 157953 [host=himrod1]
 157970 [host=himrod2]
 158065 [host=himrod2]
 164099 [host=himrod1]
 165968 [host=himrod2]
 158083 [host=himrod1]
 164108 [host=himrod2]
 158099 [host=himrod2]
 165985 [host=himrod2]
 164118 [host=himrod1]
 158118 [host=himrod2]
 164130 [host=himrod2]
 164124 [host=himrod1]
 164140 [host=himrod2]
 164147 [host=himrod2]
 158023 [host=himrod2]
 158147 [host=himrod2]
 164156 [host=himrod1]
 164165 [host=himrod1]
 158274 [host=himrod2]
 158188 [host=himrod2]
 164175 [host=himrod1]
 164184 [host=himrod1]
 166764 [host=himrod2]
 158294 [host=himrod1]
 164190 [host=himrod1]
 158238 [host=himrod2]
 164201 [host=himrod1]
 158310 [host=himrod1]
 158344 [host=himrod1]
 158350 [host=himrod1]
 158431 [host=himrod1]
 158374 [host=himrod1]
 164223 [host=himrod2]
 164236 [host=himrod2]
 158460 [host=himrod1]
 166024 [host=himrod2]
 158469 [host=himrod1]
 164249 [host=himrod2]
 158397 [host=himrod2]
 158485 [host=himrod1]
 158415 [host=himrod2]
 158569 [host=himrod2]
 158587 [host=himrod2]
 158509 [host=himrod2]
 158597 [host=himrod1]
 158610 [host=himrod1]
 158535 [host=himrod2]
 164268 [host=himrod2]
 158623 [host=himrod2]
 166040 [host=himrod1]
 158551 [host=himrod1]
 166050 [host=himrod1]
 166067 [host=himrod2]
 158700 [host=himrod1]
 158717 [host=himrod1]
 164311 [host=himrod2]
 158805 [host=himrod2]
 158761 [host=himrod1]
 158842 [host=himrod2]
 158935 [host=himrod1]
 158878 [host=himrod1]
 159031 [host=himrod1]
 166076 [host=himrod2]
 164374 [host=himrod1]
 166082 [host=himrod2]
 166091 [host=himrod2]
 158973 [host=himrod1]
 167130 [host=himrod2]
 166103 [host=himrod1]
 166112 [host=himrod1]
 166121 [host=himrod2]
 159152 [host=himrod1]
 166137 [host=himrod1]
 164423 [host=himrod2]
 159239 [host=himrod1]
 159284 [host=himrod1]
 166143 [host=himrod1]
 159318 [host=himrod2]
 166148 [host=himrod2]
 159338 [host=himrod1]
 159401 [host=himrod1]
 159366 [host=himrod1]
 166153 [host=himrod2]
 159437 [host=himrod2]
 159537 [host=himrod2]
 159454 [host=himrod1]
 166161 [host=himrod1]
 166182 [host=himrod2]
 159471 [host=himrod2]
 166191 [host=himrod1]
 159486 [host=himrod1]
 159570 [host=himrod1]
 164498 [host=himrod1]
 164470 [host=himrod1]
 159613 [host=himrod1]
 159507 [host=himrod2]
 164514 [host=himrod2]
 159656 [host=himrod2]
 167423 [host=himrod1]
 159782 [host=himrod2]
 167473 [host=himrod1]
 164539 [host=himrod1]
 159693 [host=himrod1]
 159790 [host=himrod1]
 167481 [host=himrod1]
 159799 [host=himrod1]
 167488 [host=himrod1]
 159812 [host=himrod2]
 159723 [host=himrod1]
 159885 [host=himrod2]
 159903 [host=himrod2]
 159824 [host=himrod1]
 159928 [host=himrod1]
 159832 [host=himrod1]
 164603 [host=himrod1]
 166203 [host=himrod1]
 167178 [host=himrod1]
 159845 [host=himrod2]
 159969 [host=himrod2]
 159854 [host=himrod2]
 160053 [host=himrod2]
 159865 [host=himrod2]
 160071 [host=himrod2]
 160122 [host=himrod2]
 166236 [host=himrod1]
 160085 [host=himrod2]
 160135 [host=himrod2]
 166264 [host=himrod2]
 160093 [host=himrod1]
 160151 [host=himrod1]
 160107 [host=himrod2]
 160164 [host=himrod1]
 164641 [host=himrod2]
 160406 [host=himrod1]
 160262 [host=himrod1]
 164677 [host=himrod2]
 166305 [host=himrod2]
 160350 [host=himrod2]
 164688 [host=himrod1]
 160434 [host=himrod1]
 160379 [host=himrod2]
 160546 [host=himrod1]
 160464 [host=himrod1]
 160576 [host=himrod1]
 160490 [host=himrod1]
 160634 [host=himrod2]
 160519 [host=himrod2]
 160740 [host=himrod2]
 164745 [host=himrod2]
 166340 [host=himrod2]
 160661 [host=himrod2]
 160761 [host=himrod2]
 160783 [host=himrod1]
 160690 [host=himrod1]
 167325 [host=himrod1]
 160890 [host=himrod2]
 164852 [host=himrod1]
 164789 [host=himrod2]
 164803 [host=himrod1]
 164870 [host=himrod2]
 160937 [host=himrod1]
 160813 [host=himrod1]
 161037 [host=himrod1]
 164822 [host=himrod2]
 166374 [host=himrod1]
 160845 [host=himrod2]
 161078 [host=himrod2]
 161157 [host=himrod2]
 164880 [host=himrod1]
 161192 [host=himrod1]
 161119 [host=himrod1]
 161223 [host=himrod1]
 164895 [host=himrod1]
 161311 [host=himrod2]
 161345 [host=himrod1]
 161251 [host=himrod2]
 161369 [host=himrod2]
 164935 [host=himrod2]
 164947 [host=himrod1]
 164964 [host=himrod2]
 164953 [host=himrod2]
 161398 [host=himrod1]
 161282 [host=himrod2]
 164978 [host=himrod2]
 164990 [host=himrod2]
 161459 [host=himrod2]
 161423 [host=himrod2]
 161475 [host=himrod1]
 161443 [host=himrod2]
 161516 [host=himrod1]
 161496 [host=himrod2]
 165005 [host=himrod2]
 161596 [host=himrod1]
 161542 [host=himrod2]
 161615 [host=himrod1]
 165028 [host=himrod1]
 161570 [host=himrod1]
 161698 [host=himrod1]
 161827 [host=himrod2]
 161783 [host=himrod2]
 161804 [host=himrod1]
 161848 [host=himrod1]
 161871 [host=himrod1]
 161889 [host=himrod1]
 161956 [host=himrod1]
 161913 [host=himrod2]
 161927 [host=himrod1]
 161944 [host=himrod1]
 161966 [host=himrod1]
 165104 [host=himrod2]
 161975 [host=himrod2]
 162076 [host=himrod2]
 161988 [host=himrod1]
 162100 [host=himrod1]
 165126 [host=himrod1]
 162110 [host=himrod2]
 165137 [host=himrod2]
 162120 [host=himrod2]
 165148 [host=himrod1]
 162128 [host=himrod2]
 162191 [host=himrod1]
 162138 [host=himrod2]
 162243 [host=himrod1]
 167444 [host=himrod2]
 162254 [host=himrod1]
 162263 [host=himrod2]
 162147 [host=himrod1]
 167457 [host=himrod1]
 162272 [host=himrod1]
 162295 [host=himrod1]
 162159 [host=himrod1]
 162390 [host=himrod1]
 162332 [host=himrod1]
 165162 [host=himrod1]
 162427 [host=himrod1]
 166956 [host=himrod1]
 162345 [host=himrod2]
 165201 [host=himrod2]
 162360 [host=himrod2]
 165177 [host=himrod2]
 165189 [host=himrod1]
 162481 [host=himrod1]
 165228 [host=himrod1]
 165214 [host=himrod2]
 162563 [host=himrod2]
 162535 [host=himrod2]
 162598 [host=himrod1]
 162760 [host=himrod1]
 162632 [host=himrod2]
 167511 [host=himrod2]
 162681 [host=himrod1]
 167525 [host=himrod1]
 167582 [host=himrod1]
 167533 [host=himrod1]
 167607 [host=himrod1]
 167538 [host=himrod1]
 167589 [host=himrod2]
 167542 [host=himrod1]
 167594 [host=himrod1]
 167546 [host=himrod2]
 167600 [host=himrod2]
 167551 [host=himrod2]
 167617 [host=himrod1]
 167556 [host=himrod1]
 167568 [host=himrod2]
 167625 [host=himrod1]
 167574 [host=himrod1]
 167657 [host=himrod1]
 167637 [host=himrod1]
 167669 [host=himrod2]
 167682 [host=himrod2]
 167645 [host=himrod2]
 167694 [host=himrod1]
 167703 [host=himrod1]
 167710 [host=himrod2]
 167650 [host=himrod1]
 167721 [host=himrod1]
 167804 [host=himrod1]
 167809 [host=himrod1]
 167732 [host=himrod1]
 167846 [host=himrod1]
 167744 [host=himrod2]
 167911 [host=himrod2]
 167930 [host=himrod1]
 167756 [host=himrod1]
 167942 [host=himrod1]
 167952 [host=himrod1]
 167779 [host=himrod2]
 167962 [host=himrod2]
 167971 [host=himrod2]
 167982 [host=himrod1]
 167791 [host=himrod2]
 167992 [host=himrod2]
 168006 [host=himrod2]
 167797 [host=himrod1]
 168117 [host=himrod1]
 168125 [host=himrod1]
 168021 [host=himrod2]
 168146 [host=himrod1]
 168159 [host=himrod2]
 168031 [host=himrod1]
 168171 [host=himrod1]
 168040 [host=himrod1]
 168176 fail irrelevant
 168184 [host=himrod2]
 168053 [host=himrod1]
 168191 [host=himrod1]
 168202 [host=himrod1]
 168212 [host=himrod2]
 168067 [host=himrod2]
 168225 [host=himrod1]
 168237 [host=himrod2]
 168076 [host=himrod1]
 168242 [host=himrod2]
 168082 [host=himrod2]
 168251 [host=himrod1]
 168264 [host=himrod1]
 168321 [host=himrod2]
 168354 [host=himrod1]
 168473 [host=himrod2]
 168492 [host=himrod1]
 168393 [host=himrod1]
 168500 [host=himrod2]
 168413 [host=himrod1]
 168511 [host=himrod2]
 168432 [host=himrod1]
 168522 [host=himrod2]
 168549 [host=himrod1]
 168452 [host=himrod1]
 168577 [host=himrod1]
 168699 [host=himrod2]
 168608 [host=himrod1]
 168719 [host=himrod1]
 168740 [host=himrod2]
 168630 [host=himrod2]
 168769 [host=himrod1]
 168796 [host=himrod2]
 168649 [host=himrod1]
 168818 [host=himrod1]
 168836 [host=himrod2]
 168671 [host=himrod1]
 168969 fail irrelevant
 169009 [host=himrod1]
 169126 [host=himrod2]
 169139 [host=himrod2]
 169058 [host=himrod1]
 169154 [host=himrod2]
 169171 [host=himrod1]
 169098 [host=himrod1]
 169270 [host=himrod1]
 169296 [host=himrod2]
 169192 [host=himrod2]
 169322 fail irrelevant
 169351 [host=himrod1]
 169207 [host=himrod2]
 169386 fail irrelevant
 169224 [host=himrod1]
 169415 [host=himrod1]
 169447 [host=himrod1]
 169254 [host=himrod1]
 169477 [host=himrod1]
 169502 [host=himrod1]
 169555 [host=himrod2]
 169531 [host=himrod1]
 169581 [host=himrod1]
 169640 [host=himrod1]
 169611 [host=himrod1]
 169669 [host=himrod2]
 169768 [host=himrod1]
 169805 [host=himrod1]
 169850 [host=himrod2]
 169699 [host=himrod2]
 169897 fail irrelevant
 169727 [host=himrod1]
 170020 [host=himrod1]
 169932 [host=himrod1]
 170078 [host=himrod1]
 169980 [host=himrod1]
 170138 [host=himrod2]
 170231 fail irrelevant
 170168 fail irrelevant
 170261 [host=himrod1]
 170201 [host=himrod1]
 170379 [host=himrod1]
 170408 [host=himrod2]
 170437 [host=himrod2]
 170287 [host=himrod1]
 170470 [host=himrod2]
 170317 [host=himrod2]
 170500 fail irrelevant
 170346 [host=himrod1]
 170589 [host=himrod1]
 170624 [host=himrod1]
 170660 fail irrelevant
 170527 [host=himrod2]
 170690 fail irrelevant
 170715 [host=himrod2]
 170560 [host=himrod1]
 170722 [host=himrod2]
 170803 [host=himrod2]
 170744 [host=himrod2]
 170814 [host=himrod1]
 170825 [host=himrod2]
 170835 [host=himrod2]
 170752 [host=himrod1]
 170842 [host=himrod1]
 170857 fail irrelevant
 170760 fail irrelevant
 170881 [host=himrod1]
 170768 [host=himrod2]
 170892 [host=himrod1]
 170911 [host=himrod2]
 170774 [host=himrod1]
 170990 [host=himrod1]
 171143 [host=himrod1]
 170784 [host=himrod1]
 171153 [host=himrod2]
 170793 [host=himrod1]
 171159 [host=himrod1]
 171175 [host=himrod2]
 171189 []
 171297 [host=himrod1]
 171230 [host=himrod1]
 171306 [host=himrod1]
 171266 [host=himrod2]
 171323 [host=himrod1]
 171338 [host=himrod2]
 171279 [host=himrod2]
 171351 [host=himrod1]
 171358 [host=himrod1]
 171285 [host=himrod1]
 171436 [host=himrod2]
 171451 fail irrelevant
 171366 [host=himrod1]
 171467 [host=himrod2]
 171379 [host=himrod2]
 171479 [host=himrod1]
 171497 [host=himrod1]
 171520 [host=himrod2]
 171396 [host=himrod2]
 171541 [host=himrod1]
 171419 [host=himrod1]
 171555 [host=himrod1]
 171589 [host=himrod1]
 171565 [host=himrod2]
 171611 [host=himrod2]
 171573 [host=himrod2]
 171579 [host=himrod1]
 171625 fail irrelevant
 171658 [host=himrod1]
 171638 [host=himrod2]
 171667 fail irrelevant
 171680 [host=himrod1]
 171649 [host=himrod2]
 171700 [host=himrod1]
 171713 fail ccfdc6b02932efda5d76e2cd40857db651fca684 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 3b8cee1781c4149c7a762b8a1c8115b635cf4cad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171720 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 171730 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae fec018624c7e3059cd3e23d5f1bc6006d99fb673 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e270af94280e6a9610705ebc1fdd1d7a9b1f8a98
 171721 fail ccfdc6b02932efda5d76e2cd40857db651fca684 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 3b8cee1781c4149c7a762b8a1c8115b635cf4cad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171732 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae a21a3438f795deecb24e1843c1636f95c485017c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 dc88f9b72df52b22c35b127b80c487e0b6fca4af b22db3fcba1a5b4f9e563b58d402f1d5c434209f
 171722 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 171723 fail ccfdc6b02932efda5d76e2cd40857db651fca684 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 3b8cee1781c4149c7a762b8a1c8115b635cf4cad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171733 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae f304308e1cb21846a79fc8e4aa9ffa2cb1db3e4c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 dc88f9b72df52b22c35b127b80c487e0b6fca4af 65f684b728f779e170335e9e0cbbf82f7e1c7e5b
 171724 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae dab96cf02e3be378310dd1bce119b0fac6fac958 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 0faf37e7434ea08ed99d804aad98fcddf74852e7
 171725 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad da30b01ffaf702db082cd01ba594dd4fb4143e58 5801910013757bd626f67ed77eea6c16a176eebf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 d05c67efd94f301b48bc486246161b05acaa8df2
 171726 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad d21009b1c9f94b740ea66be8e48a1d8ad8124023 46b4606ba23498d3d0e66b53e498eb3d5d592586 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 64f37cc530f144e53c190c9e8209a51b58fd5c43 1c3ed9c908732d19660fbe83580674d585464d4c
 171727 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 6119e6e19a050df847418de7babe5166779955e4 3f90ac3ec03512e2374cd2968c047a7e856a8965 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 119c98972c4e737508df827bbbc8453cc93292c7
 171728 blocked 2c846fa6bcc11929c9fb857a22430fb9945654ad 320f92c36a80bfafc5d57834592a7be5fd79f104 ddb3fdbef30de5a2946f9bd51060e8d5b1987aef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7292e4a0a8f58333ccbd2d0d47242f9865083c9c d21121685fac829c988e432407fb0e4ef9b19331
 171729 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad da30b01ffaf702db082cd01ba594dd4fb4143e58 ee1f8262b83dd88b30091e6e81221ff299796099 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bba24ef84b8d38bdc30a8d088874f933091605e1 8e3edefb880caeeaaf80123d5599139e8c2c9ecf
 171735 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 12dd064a1804536518eb12229836fa572c232502 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 980bfb1ac9247e95790e283dbc03e231e02cced9
 171736 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 039bdb4d3e96f9c9264abf135b8a0eef2e2b4860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 ab2977b027acbbd33a7eecda854d1911a7702f8b
 171737 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 586b4a104bfeae277ce16687f852c4f26c4a3b73 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 0e60f1d9d1970cae49ee9d03f5759f44afc1fdee
 171738 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae f0064ac3afa28e1aa3b6b9c22c6cf422a4bb8771 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 c16a9eda77b2089206d5bc39ab6488c3793e11bf
 171739 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 140446cd595cad870a0e8cef7a367bae8f09effa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 c16a9eda77b2089206d5bc39ab6488c3793e11bf
 171740 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 d620c66bdbe5510c3bae89be8cc7ca9a2a6cbaba
 171741 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171744 fail ccfdc6b02932efda5d76e2cd40857db651fca684 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171745 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171746 fail ccfdc6b02932efda5d76e2cd40857db651fca684 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171748 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
 171750 fail ccfdc6b02932efda5d76e2cd40857db651fca684 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
Searching for interesting versions
 Result found: flight 171720 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8, results HASH(0x5620f8a19de8) HASH(0x5620f8a23330) HASH(0x5620f8a29c70) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5\
 312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 d620c66bdbe5510c3bae89be8cc7ca9a2a6cbaba, results HASH(0x5620f8a15db0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 140446cd595cad870a0e8cef7a367bae8f09effa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458\
 386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 c16a9eda77b2089206d5bc39ab6488c3793e11bf, results HASH(0x5620f8a11da0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae f0064ac3afa28e1aa3b6b9c22c6cf422a4bb8771 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 c16a9eda77b2089206d5bc39ab6488c3793e11bf, results HASH(0x5620f8a0eb70) For basis\
  failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 586b4a104bfeae277ce16687f852c4f26c4a3b73 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 0e60f1d9d1970cae49ee9d03f5759f44afc1fdee, results HASH(0x5620f8a07f30) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 039bdb4d3e96f9c9264a\
 bf135b8a0eef2e2b4860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 ab2977b027acbbd33a7eecda854d1911a7702f8b, results HASH(0x5620f89fc4d8) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 12dd064a1804536518eb12229836fa572c232502 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c\
 8eb04 980bfb1ac9247e95790e283dbc03e231e02cced9, results HASH(0x5620f89fa1d0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae f304308e1cb21846a79fc8e4aa9ffa2cb1db3e4c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 dc88f9b72df52b22c35b127b80c487e0b6fca4af 65f684b728f779e170335e9e0cbbf82f7e1c7e5b, results HASH(0x5620f89ec260) For basis failure, parent search stopping at 2c846fa6bcc11929\
 c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae a21a3438f795deecb24e1843c1636f95c485017c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 dc88f9b72df52b22c35b127b80c487e0b6fca4af b22db3fcba1a5b4f9e563b58d402f1d5c434209f, results HASH(0x5620f8a001e8) Result found: flight 171721 (fail), for basis failure (at ancestor ~571)
 Repro found: flight 171722 (pass), for basis pass
 Repro found: flight 171723 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 6fe2e39a0243bddba60f83b77b972a5922d25eb8
No revisions left to test, checking graph state.
 Result found: flight 171741 (pass), for last pass
 Result found: flight 171744 (fail), for first failure
 Repro found: flight 171745 (pass), for last pass
 Repro found: flight 171746 (fail), for first failure
 Repro found: flight 171748 (pass), for last pass
 Repro found: flight 171750 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  ccfdc6b02932efda5d76e2cd40857db651fca684
  Bug not present: 2c846fa6bcc11929c9fb857a22430fb9945654ad
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171750/


  (Revision log too long, omitted.)

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.106783 to fit
pnmtopng: 10 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
171750: tolerable ALL FAIL

flight 171750 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/171750/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


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


