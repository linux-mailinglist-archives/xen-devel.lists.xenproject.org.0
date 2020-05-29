Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351C1E7C3C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:48:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedUq-0005ia-7l; Fri, 29 May 2020 11:48:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz0h=7L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jedUo-0005iV-DO
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:48:18 +0000
X-Inumbo-ID: 491610ec-a1a2-11ea-9dbe-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 491610ec-a1a2-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:48:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r15so3081098wmh.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2020 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=1sm3Jxhiv2igCNdvdTHQazyw8QwNeenyNt7cresh5E8=;
 b=nBialjnqQwye9qAXLp62DpsWOL/ADOnfx3mNdgTlEWD4Fk4Dj6meIGkvVnVSqmOtmp
 EzgRaQs7s6nCzWIDk6XjGz/6TzOJNXXzYzGEXvp6mgr1Mbcau0VFdlxh74aKpnpMam8R
 EPYTRWMkMYmsdhILbtDntCp9uO6twOKZZq5vHNRauJULFHZOzuokwXpVVcDFa6LzD+/I
 KnnJiIAE5IIEUWKd1y+H17fQV8A0RvyRf2TdTQFt8g6h18qE799Gl5CXC4SkYYH7mDiC
 Mp5Z8RtkzyxIEYSCxr8vmi7qy0V0EBkvyWBuefQw6vl60j0TL8Br5T1CLyRekWENNpzw
 grKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=1sm3Jxhiv2igCNdvdTHQazyw8QwNeenyNt7cresh5E8=;
 b=B+u7UI9FkBV1n2P51tW0844Lpn99mxfGLIECtkiHlxtCB4saSa0idz2IBR5nOcGBAw
 W5ExPo5sAmENctQce2m0wfChRevWkYUZXIVMuuAYeSSYsD0istmpdhUZ9Ddz/9L5Qjn5
 uMyOrjh49pBxx8gR6EA2Mgh6hdinC5HI3EunoZK+M68vdIQrUC3onwlvKc0av/taFoIO
 LpsDiExJ3wJuH1hJ9Tj5kjTChEwTKzTsTBafayMhHweeayjrS8LHWhrHwysJ0pfwQGFC
 lhr3ZuauX38Te1jwR3KEKKzIIOyhAU+AerwZYOn/69XUpM2Npr0qOuvkvgLmlGKHpl4T
 OYag==
X-Gm-Message-State: AOAM533PNSf98XUAScer/9pfu8dDw4S4RloXquusEzR6CbFjGpm6864L
 awGn8NFc29O7zeGvKeT5r4E=
X-Google-Smtp-Source: ABdhPJzasT8DrPILN066I7RUAYYGG3H3DA4jPj+4r2Z8RnaFXU3OalGtQ8JUn2TJzzSNazRlPAzvgg==
X-Received: by 2002:a1c:bc0a:: with SMTP id m10mr7993488wmf.173.1590752896647; 
 Fri, 29 May 2020 04:48:16 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id z12sm10460730wrg.9.2020.05.29.04.48.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 04:48:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200529113709.17489-1-jgross@suse.com>
In-Reply-To: <20200529113709.17489-1-jgross@suse.com>
Subject: RE: [PATCH v3] docs: update xenstore-migration.md
Date: Fri, 29 May 2020 12:48:14 +0100
Message-ID: <005d01d635af$0a3e6ae0$1ebb40a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH0JalnYx5eU26y8WXqv8eSeBzaDKiDEdGw
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
> Sent: 29 May 2020 12:37
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>
> Subject: [PATCH v3] docs: update xenstore-migration.md
> 
> Update connection record details:
> 
> - make flags common for sockets and domains (makes it easier to have a
>   C union for conn-spec)
> - add pending incoming data (needed for handling partially read
>   requests when doing live update)
> - add partial response length (needed for proper split to individual
>   responses after live update)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

LGTM

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> V2:
> - added out-resp-len to connection record
> 
> V3:
> - better commit message (Julien Grall)
> - same sequence for fields and detailed descriptions (Julien Grall)
> - some wording corrected (Paul Durrant)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/designs/xenstore-migration.md | 72 +++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 34a2afd17e..2ce2c836f5 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -147,43 +147,60 @@ the domain being migrated.
>  ```
>      0       1       2       3       4       5       6       7    octet
>  +-------+-------+-------+-------+-------+-------+-------+-------+
> -| conn-id                       | conn-type     | conn-spec
> +| conn-id                       | conn-type     | flags         |
> ++-------------------------------+---------------+---------------+
> +| conn-spec
>  ...
> -+-------------------------------+-------------------------------+
> -| data-len                      | data
> -+-------------------------------+
> ++---------------+---------------+-------------------------------+
> +| in-data-len   | out-resp-len  | out-data-len                  |
> ++---------------+---------------+-------------------------------+
> +| data
>  ...
>  ```
> 
> 
> -| Field       | Description                                     |
> -|-------------|-------------------------------------------------|
> -| `conn-id`   | A non-zero number used to identify this         |
> -|             | connection in subsequent connection-specific    |
> -|             | records                                         |
> -|             |                                                 |
> -| `conn-type` | 0x0000: shared ring                             |
> -|             | 0x0001: socket                                  |
> -|             | 0x0002 - 0xFFFF: reserved for future use        |
> -|             |                                                 |
> -| `conn-spec` | See below                                       |
> -|             |                                                 |
> -| `data-len`  | The length (in octets) of any pending data not  |
> -|             | yet written to the connection                   |
> -|             |                                                 |
> -| `data`      | Pending data (may be empty)                     |
> +| Field          | Description                                  |
> +|----------------|----------------------------------------------|
> +| `conn-id`      | A non-zero number used to identify this      |
> +|                | connection in subsequent connection-specific |
> +|                | records                                      |
> +|                |                                              |
> +| `conn-type`    | 0x0000: shared ring                          |
> +|                | 0x0001: socket                               |
> +|                | 0x0002 - 0xFFFF: reserved for future use     |
> +|                |                                              |
> +| `flags`        | A bit-wise OR of:                            |
> +|                | 0001: read-only                              |
> +|                |                                              |
> +| `conn-spec`    | See below                                    |
> +|                |                                              |
> +| `in-data-len`  | The length (in octets) of any data read      |
> +|                | from the connection not yet processed        |
> +|                |                                              |
> +| `out-resp-len` | The length (in octets) of a partial response |
> +|                | not yet written to the connection            |
> +|                |                                              |
> +| `out-data-len` | The length (in octets) of any pending data   |
> +|                | not yet written to the connection, including |
> +|                | a partial response (see `out-resp-len`)      |
> +|                |                                              |
> +| `data`         | Pending data: first in-data-len octets of    |
> +|                | read data, then out-data-len octets of       |
> +|                | written data (any of both may be empty)      |
> 
> -The format of `conn-spec` is dependent upon `conn-type`.
> +In case of live update the connection record for the connection via which
> +the live update command was issued will contain the response for the live
> +update command in the pending not yet written data.
> 
>  \pagebreak
> 
> +The format of `conn-spec` is dependent upon `conn-type`.
> +
>  For `shared ring` connections it is as follows:
> 
> 
>  ```
>      0       1       2       3       4       5       6       7    octet
> -                                                +-------+-------+
> -                                                | flags         |
>  +---------------+---------------+---------------+---------------+
>  | domid         | tdomid        | evtchn                        |
>  +-------------------------------+-------------------------------+
> @@ -198,8 +215,6 @@ For `shared ring` connections it is as follows:
>  |           | it has been subject to an SET_TARGET              |
>  |           | operation [2] or DOMID_INVALID [3] otherwise      |
>  |           |                                                   |
> -| `flags`   | Must be zero                                      |
> -|           |                                                   |
>  | `evtchn`  | The port number of the interdomain channel used   |
>  |           | by `domid` to communicate with xenstored          |
>  |           |                                                   |
> @@ -211,8 +226,6 @@ For `socket` connections it is as follows:
> 
> 
>  ```
> -                                                +-------+-------+
> -                                                | flags         |
>  +---------------+---------------+---------------+---------------+
>  | socket-fd                     | pad                           |
>  +-------------------------------+-------------------------------+
> @@ -221,9 +234,6 @@ For `socket` connections it is as follows:
> 
>  | Field       | Description                                     |
>  |-------------|-------------------------------------------------|
> -| `flags`     | A bit-wise OR of:                               |
> -|             | 0001: read-only                                 |
> -|             |                                                 |
>  | `socket-fd` | The file descriptor of the connected socket     |
> 
>  This type of connection is only relevant for live update, where the xenstored
> @@ -398,4 +408,4 @@ explanation of node permissions.
> 
>  [3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/xen.h;hb=HEAD#l612
> 
> -[4] https://wiki.xen.org/wiki/XenBus
> \ No newline at end of file
> +[4] https://wiki.xen.org/wiki/XenBus
> --
> 2.26.2
> 



