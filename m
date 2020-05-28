Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D461E5B3D
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 10:54:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeEIL-0000im-Jo; Thu, 28 May 2020 08:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=blJD=7K=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jeEIK-0000ih-2p
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 08:53:44 +0000
X-Inumbo-ID: bb766e80-a0c0-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb766e80-a0c0-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 08:53:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id y17so18618321wrn.11
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 01:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=OsmbqVD2Ng7iKf9+jo7l+b8noucPBniDdZVmRwZ2OHk=;
 b=SuXgitoB2Tx2l/10ympckof0gahR0b1hDRKDFHfF1WhjIwtBthSANU2W7Ybpbayk3p
 H1QooXdIEmAOOVqbM0+7ZhWs/85YhvJDV9wbn059RXDPH1uH3pI/67GsZbvS9tAX0bXI
 J4875LqdvaZ15zOIDDtb0wQi+ohnU2OwmJ2p8Hx1iR9E3mYHvYVeVt15itrRUlTxgyKV
 gpzAfiG3YvvPnLWZKbZDBwGb2MEYO0YdwSsIgGa1bqnZfBI2HmFaunLqMGl0Av+AOjKI
 zLGlEpxRycjayXuiY0/qEOR3GKlGtbu4icDqRJI0nVhjgmngg30MNXOavPd0PYbpSCxk
 BybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=OsmbqVD2Ng7iKf9+jo7l+b8noucPBniDdZVmRwZ2OHk=;
 b=oOwhh9K4qF/9AGiyGq5egWOalOfQFr/Q+QQQ1yZPk4P2HxvXsqIvTsiRUsP6VtvTTJ
 z3U/hlucm2OznnUiN4oRoKy7CMrFgRltE+V9Engd8EYCrwkSiWWVU9GEVQMPBzymx6Nu
 HtqIDR/KCgRdG2Askp7G6UoILrqXoC/pPhGIDn+tgeULI++/hhkWNxcDST1syDT9Iy77
 S38XAfQFnEJwPOEIM1Fd/ebfcdSMOBCCtMO5put4EHLtnfwOVUHCi9xiUMLAtb7zuE0V
 Pr1KliqHVI2RYo3sw0QSsy/s+Y/3prE5LOdEHwsj420gGsStZo1j5OdWQ4zxrl2QtAvO
 WGGg==
X-Gm-Message-State: AOAM531Vs5P5qsNmiMCBFce2yz2qIkA3QchdcpHWYz0sOMlhAMMaE6iV
 3drAdXIZf2U3+P80LG/ye/w=
X-Google-Smtp-Source: ABdhPJxPQJPrGm4dKWgaLCge5ybHHqVXd1GSzGgAIPr9ECDzgTT8ub3oBJKVe/JTYAueu4frei8FPw==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr2432274wrw.169.1590656022346; 
 Thu, 28 May 2020 01:53:42 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id t14sm5390200wrb.94.2020.05.28.01.53.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 01:53:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200528082217.26057-1-jgross@suse.com>
In-Reply-To: <20200528082217.26057-1-jgross@suse.com>
Subject: RE: [PATCH v2] docs: update xenstore-migration.md
Date: Thu, 28 May 2020 09:53:40 +0100
Message-ID: <00a001d634cd$7c9afb40$75d0f1c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFP4uuOoU5NbpLVMW9x/VcR2g3Na6nJ05cw
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
> Sent: 28 May 2020 09:22
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>
> Subject: [PATCH v2] docs: update xenstore-migration.md
> 
> Update connection record details: make flags common for sockets and
> domains, and add pending incoming data.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - added out-resp-len to connection record
> ---
>  docs/designs/xenstore-migration.md | 71 +++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 31 deletions(-)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 34a2afd17e..5736bbad94 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -147,43 +147,59 @@ the domain being migrated.
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
> +| `flags`        | A bit-wise OR of:                            |
> +|                | 0001: read-only                              |
> +|                |                                              |
> +| `conn-type`    | 0x0000: shared ring                          |
> +|                | 0x0001: socket                               |
> +|                | 0x0002 - 0xFFFF: reserved for future use     |
> +|                |                                              |

Agreed with Julien... the above two would be better swapped to match the order of the fields in the record.

> +| `conn-spec`    | See below                                    |
> +|                |                                              |
> +| `in-data-len`  | The length (in octets) of any data read      |
> +|                | from the connection not yet processed        |
> +|                |                                              |
> +| `out-resp-len` | The length (in octets) of a partial response |
> +|                | not yet written to the connection (included  |
> +|                | in the following `out-data-len`)             |
> +|                |                                              |
> +| `out-data-len` | The length (in octets) of any pending data   |
> +|                | not yet written to the connection            |

So, IIUC out-data-len is inclusive of out-resp-len?

> +|                |                                              |
> +| `data`         | Pending data, first read data, then written  |
> +|                | data (any of both may be empty)              |

Perhaps be more explicit here:

"Pending data: first in-data-len octets of read data, then out-data-len octets of written data"

> 
> -The format of `conn-spec` is dependent upon `conn-type`.
> +In case of live update the connection record for the connection via which
> +the live update command was issued will contain the response for the live
> +update command in the pending write data.

s/write/written for consistency I think.

  Paul

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
> @@ -198,8 +214,6 @@ For `shared ring` connections it is as follows:
>  |           | it has been subject to an SET_TARGET              |
>  |           | operation [2] or DOMID_INVALID [3] otherwise      |
>  |           |                                                   |
> -| `flags`   | Must be zero                                      |
> -|           |                                                   |
>  | `evtchn`  | The port number of the interdomain channel used   |
>  |           | by `domid` to communicate with xenstored          |
>  |           |                                                   |
> @@ -211,8 +225,6 @@ For `socket` connections it is as follows:
> 
> 
>  ```
> -                                                +-------+-------+
> -                                                | flags         |
>  +---------------+---------------+---------------+---------------+
>  | socket-fd                     | pad                           |
>  +-------------------------------+-------------------------------+
> @@ -221,9 +233,6 @@ For `socket` connections it is as follows:
> 
>  | Field       | Description                                     |
>  |-------------|-------------------------------------------------|
> -| `flags`     | A bit-wise OR of:                               |
> -|             | 0001: read-only                                 |
> -|             |                                                 |
>  | `socket-fd` | The file descriptor of the connected socket     |
> 
>  This type of connection is only relevant for live update, where the xenstored
> @@ -398,4 +407,4 @@ explanation of node permissions.
> 
>  [3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/xen.h;hb=HEAD#l612
> 
> -[4] https://wiki.xen.org/wiki/XenBus
> \ No newline at end of file
> +[4] https://wiki.xen.org/wiki/XenBus
> --
> 2.26.2
> 



