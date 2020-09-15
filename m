Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888E26B022
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 00:02:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIJ0P-0006xD-Fy; Tue, 15 Sep 2020 22:00:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UWTi=CY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kIJ0N-0006x8-Kg
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 22:00:51 +0000
X-Inumbo-ID: 862b59e2-7534-4613-ad35-9ade6bf0e0b7
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 862b59e2-7534-4613-ad35-9ade6bf0e0b7;
 Tue, 15 Sep 2020 22:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600207248;
 h=subject:to:references:cc:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zWYtUqRLjHKuz/iIviVeBJjM/TOVeokxHyDziJnKxvg=;
 b=QT9ZhEGoECIzDQT1jxbrrF0bETtMPwRqJnjhWbJSTgTfbLueOdHx7Ozz
 jAQ1906wThKAWZtiL44pvnD0glAxFK9LkPkSKueGu8LffXs9ZKnA6px9X
 YyWAmjUmTOGp5GpDjnJOJ8Zv6fJapcH37bCXk/S/HgPduvqkz+rUy+V20 I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GKjmj5nxsYZgi7jE51hVXfEqhP2GpdlfF8g8mGPKsNndDJsnjDq7mMOsNKVBf7/kgW8gHzotcT
 TTSk77f2s6yJi+jBTDTMPLDOO/nkaxkO3xEfeyKb2d/9zeVNRstAW/QHpDhGPUaYox0vLJDpPg
 zeIh2twCjrcSjlTUs++1RrKS/cA6i4wHgDjEnjiPUZ6y+kWIEZe23EoguLMyJG24jxwTyeHr6L
 QoVksJQ4HJLlmFXhAyeWySOzJuMQ/KTBTaS7WkxN6yYbNHqq/KVacVsEOsXnuU5V/U11YjLWXN
 ljM=
X-SBRS: 2.7
X-MesageID: 27068641
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,430,1592884800"; d="scan'208";a="27068641"
Subject: Re: Compiling Xen from source
To: David I <dav.sec.lists@gmail.com>, <xen-devel@lists.xenproject.org>
References: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Hans van Kranenburg
 <hans@knorrie.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <58e3421c-6939-831f-8f0e-0c83fa9f1366@citrix.com>
Date: Tue, 15 Sep 2020 23:00:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+js8Lk2f99BqeNgSyAh1jh5gH1iC2BZyz+AY7mGTqPTX_Qf=w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 15/09/2020 21:16, David I wrote:
> Hello,
>
> I am unable to mcompile xen-tools from source.
>
> here is the "stacktrace":
>
> ln -f xenstore xenstore-watch
> gcc xenstore_control.o    
>  -Wl,-rpath-link=/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore
> /home/david/xen/xen/tools/xenstore/../../tools/xenstore/libxenstore.so
> -ldl
>  /home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/libxentoolcore.so
>  -o xenstore-control
> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
> -Wstrict-prototypes -Wdeclaration-after-statement
> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
> -fomit-frame-pointer
> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
> .xs_tdb_dump.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror
> -I. -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
> -I./include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -D__XEN_TOOLS__
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -DXEN_LIB_STORED="\"/var/lib/xenstored\""
> -DXEN_RUN_STORED="\"/var/run/xenstored\""   -c -o xs_tdb_dump.o
> xs_tdb_dump.c
> gcc  -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
> -Wstrict-prototypes -Wdeclaration-after-statement
> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
> -fomit-frame-pointer
> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF
> .utils.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -I.
> -include /home/david/xen/xen/tools/xenstore/../../tools/config.h
> -I./include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/evtchn/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libxc/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toollog/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/foreignmemory/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/devicemodel/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -D__XEN_TOOLS__
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/toolcore/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include
> -DXEN_LIB_STORED="\"/var/lib/xenstored\""
> -DXEN_RUN_STORED="\"/var/run/xenstored\""  
> -I/home/david/xen/xen/tools/xenstore/../../tools/libs/gnttab/include
> -I/home/david/xen/xen/tools/xenstore/../../tools/include  -c -o
> utils.o utils.c
> gcc xs_tdb_dump.o utils.o tdb.o talloc.o     -o xs_tdb_dump
> /usr/bin/ld : utils.o:(.data.rel.local+0x0) : définitions multiples de
> « xprintf »; xs_tdb_dump.o:(.bss+0x0) : défini pour la première fois ici
> collect2: error: ld returned 1 exit status
> make[4]: *** [Makefile:97 : xs_tdb_dump] Erreur 1
> make[4] : on quitte le répertoire « /home/david/xen/xen/tools/xenstore »
> make[3]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:249 :
> subdir-install-xenstore] Erreur 2
> make[3] : on quitte le répertoire « /home/david/xen/xen/tools »
> make[2]: *** [/home/david/xen/xen/tools/../tools/Rules.mk:244 :
> subdirs-install] Erreur 2
> make[2] : on quitte le répertoire « /home/david/xen/xen/tools »
> make[1]: *** [Makefile:74 : install] Erreur 2
> make[1] : on quitte le répertoire « /home/david/xen/xen/tools »
> make: *** [Makefile:127 : install-tools] Erreur 2
> david@debian:~/xen/xen$ uname -a
> Linux debian 5.7.0-2-amd64 #1 SMP Debian 5.7.10-1 (2020-07-26) x86_64
> GNU/Linux
> david@debian:~/xen/xen$ gcc --version
> gcc (Debian 10.2.0-5) 10.2.0
> Copyright (C) 2020 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
> PURPOSE.
>
> david@debian:~/xen/xen$ /usr/bin/ld --version
> GNU ld (GNU Binutils for Debian) 2.35
> Copyright (C) 2020 Free Software Foundation, Inc.
> Ce logiciel est libre; si vous le redistribuez, vous devez le faire
> selon les termes
> de la licence GNU General Public License version 3 ou postérieure
> selon votre besoin.
> Ce logiciel n'est couvert par aucune GARANTIE.
> david@debian:~/xen/xen$ git branch
>   master
> * stable-4.11
>   staging
> david@debian:~/xen/xen$
>
> I was able to compile dist-xen correctly though. But dist-tools fails
> with this error, I have seen a similar request here:
> https://stackoverflow.com/questions/63525163/usr-bin-ld-utils-o-data-rel-local0x0-multiple-definition-of-xprintf-xs
>
> I have tried to compile xen from source also on this same configuration,
> in stable-4.12, stable-4.13, stable-4.14, each time I was able to 
> compile xen but failed to compile xen-tools.
> the debian package works fine and is in version 4.11.
>
> So my question would be, is there a patch for this issue ? and how the
> debian team could compile originally the debian source package ? I
> suppose I am not the first user to encounter this.
>
> Thank you for your answers ;-)

Its a change in the toolchain from -fcommon to -fno-common by default.

Already fixed upstream by: 
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dacdbf7088d6a3705a9831e73991c2b14c519a65

Looks like that change wants backporting.

~Andrew

