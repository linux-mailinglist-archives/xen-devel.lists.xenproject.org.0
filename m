Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9426B1AF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 00:34:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIJWb-00019W-5s; Tue, 15 Sep 2020 22:34:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/M2l=CY=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1kIJWY-00019R-Vk
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 22:34:07 +0000
X-Inumbo-ID: 3d3ebdc1-0f1e-4f1b-988e-54018ff6b843
Received: from syrinx.knorrie.org (unknown [82.94.188.77])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d3ebdc1-0f1e-4f1b-988e-54018ff6b843;
 Tue, 15 Sep 2020 22:34:05 +0000 (UTC)
Received: from [IPv6:2a02:a213:2b80:f000::12] (unknown
 [IPv6:2a02:a213:2b80:f000::12])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id 09E1C60A687DC;
 Wed, 16 Sep 2020 00:34:03 +0200 (CEST)
Subject: Re: Compiling Xen from source
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 David I <dav.sec.lists@gmail.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
 <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
From: Hans van Kranenburg <hans@knorrie.org>
Autocrypt: addr=hans@knorrie.org; keydata=
 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
Message-ID: <7217a50c-d1f7-8160-2405-c04a84abf61f@knorrie.org>
Date: Wed, 16 Sep 2020 00:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 9/16/20 12:00 AM, Andrew Cooper wrote:
> On 15/09/2020 21:16, David I wrote:
>> Hello,
>>
>> I am unable to mcompile xen-tools from source.
>>
>> here is the "stacktrace":
>>
>> ln -f xenstore xenstore-watch
>> gcc xenstore_control.o    
>>  -Wl,-rpath-link=/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore
>> /home/david/xen/xen/tools/xenstore/../../tools/xenstore/libxenstore.so
>> -ldl
>>  /home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/libxentoolcore.so
>>  -o xenstore-control
>> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
>> -Wstrict-prototypes -Wdeclaration-after-statement
>> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
>> -fomit-frame-pointer
>> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
>> .xs_tdb_dump.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror
>> -I. -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
>> -I./include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -D__XEN_TOOLS__
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -DXEN_LIB_STORED="\"/var/lib/xenstored\""
>> -DXEN_RUN_STORED="\"/var/run/xenstored\""   -c -o xs_tdb_dump.o
>> xs_tdb_dump.c
>> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
>> -Wstrict-prototypes -Wdeclaration-after-statement
>> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
>> -fomit-frame-pointer
>> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
>> .utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -I.
>> -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
>> -I./include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -D__XEN_TOOLS__
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include
>> -DXEN_LIB_STORED="\"/var/lib/xenstored\""
>> -DXEN_RUN_STORED="\"/var/run/xenstored\""  
>> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/gnttab/include
>> -I/home/david/xen/xen/tools/xenstore/../../tools/include  -c -o
>> utils.o utils.c
>> gcc xs_tdb_dump.o utils.o tdb.o talloc.o     -o xs_tdb_dump
>> /usr/bin/ld : utils.o:(.data.rel.local+0x0) : définitions multiples de
>> « xprintf »; xs_tdb_dump.o:(.bss+0x0) : défini pour la première fois ici
>> collect2: error: ld returned 1 exit status
>> make[4]: *** [Makefile:97 : xs_tdb_dump] Erreur 1
>> make[4] : on quitte le répertoire « /home/david/xen/xen/tools/xenstore »
>> make[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 :
>> subdir-install-xenstore] Erreur 2
>> make[3] : on quitte le répertoire « /home/david/xen/xen/tools »
>> make[2]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:244 :
>> subdirs-install] Erreur 2
>> make[2] : on quitte le répertoire « /home/david/xen/xen/tools »
>> make[1]: *** [Makefile:74 : install] Erreur 2
>> make[1] : on quitte le répertoire « /home/david/xen/xen/tools »
>> make: *** [Makefile:127 : install-tools] Erreur 2
>> david@debian:~/xen/xen$ uname -a
>> Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64
>> GNU/Linux
>> david@debian:~/xen/xen$ gcc --version
>> gcc (Debian 10.2.0-5) 10.2.0
>> Copyright (C) 2020 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.  There is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>> PURPOSE.
>>
>> david@debian:~/xen/xen$ /usr/bin/ld --version
>> GNU ld (GNU Binutils for Debian) 2.35
>> Copyright (C) 2020 Free Software Foundation, Inc.
>> Ce logiciel est libre; si vous le redistribuez, vous devez le faire
>> selon les termes
>> de la licence GNU General Public License version 3 ou postérieure
>> selon votre besoin.
>> Ce logiciel n'est couvert par aucune GARANTIE.
>> david@debian:~/xen/xen$ git branch
>>   master
>> * stable-4.11
>>   staging
>> david@debian:~/xen/xen$
>>
>> I was able to compile dist-xen correctly though. But dist-tools fails
>> with this error, I have seen a similar request here:
>> https://stackoverflow.com/questions/63525163/usr-bin-ld-utils-o-data-rel-local0x0-multiple-definition-of-xprintf-xs
>>
>> I have tried to compile xen from source also on this same configuration,
>> in stable-4.12, stable-4.13, stable-4.14, each time I was able to 
>> compile xen but failed to compile xen-tools.
>> the debian package works fine and is in version 4.11.
>>
>> So my question would be, is there a patch for this issue ? and how the
>> debian team could compile originally the debian source package ? I
>> suppose I am not the first user to encounter this.
>>
>> Thank you for your answers ;-)
> 
> Its a change in the toolchain from -fcommon to -fno-common by default.
> 
> Already fixed upstream by: 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dacdbf7088d6a3705a9831e73991c2b14c519a65
> 
> Looks like that change wants backporting.

Currently, I'm working together with Ian to get Xen 4.14 into Debian
unstable. dacdbf708 is in 4.14 already, but we also had to pick

d25cc3ec93eb ("libxl: workaround gcc 10.2 maybe-uninitialized warning")

and

fff1b7f50e75 ("libxl: fix -Werror=stringop-truncation in
libxl__prepare_sockaddr_un")

into 4.14 to fix further gcc 10 FTBFS (yay, backport candidates). Maybe
this info helps a bit if you also run into these issues after fixing the
first one.

Hans

