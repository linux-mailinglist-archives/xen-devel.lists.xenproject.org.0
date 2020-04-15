Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA811A95AF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:09:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOd6k-0005Cb-Fr; Wed, 15 Apr 2020 08:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbih=57=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jOd6i-0005CW-U4
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:09:16 +0000
X-Inumbo-ID: 65cf88e6-7ef0-11ea-83d8-bc764e2007e4
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65cf88e6-7ef0-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 08:09:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h26so6561563wrb.7
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2020 01:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=fruIXAGEQTGd94ccisu4R0cvxtI5K2GJVStu/u0gz3E=;
 b=TDlPv+AcUFIE2hi7yPchoyD3f+fZ7jRUePlTK7qWBaHcdI0Sk1GtaaVGO9u7ObRdQ0
 516didBfMwKcasiG3zl4Jk39hjeshIEioCozdwCAoX/Z3xYdmrulI4WjJFMj3SDi6ZPx
 c4M5rTWRZSIVl8nJCIzr+UzyhywREJ8EDUmeAkO8lwkZ1eBuoEffNTPN977KLJnQ+MhB
 kGgMKKaevS0nnl8LffvzjHVbs07uldIbDD1WZA0Kkv/cEi9CZSPig2xQwG8lTh10VfUY
 YmgmhOx6Cj8RQJILWw76uhVSnxqN/ghRKXm3Jgz1Ny4fjHqsf6IWRX3lXFsUcuTry+mX
 3yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=fruIXAGEQTGd94ccisu4R0cvxtI5K2GJVStu/u0gz3E=;
 b=tT0mXk8Blli07MemU+rKUacu0D/nYnBCdbEh01g/uOXNXvl3+qs+WOBiC54pKsMevL
 /jkgOaUcVk62B/PrP2slTCGGbn9q0J5XcQu14h2NKLCc20ZyNHzUwLM496x6UmR6PjxC
 p+biwSoXWX1n/ErTYIE64tb0hXw7VFUA5ZQmddxoXlQZDyCWZVkaym0Ag2Wc6S1KAguE
 SBZiHcHpGAr+r5mW5cDuOA32OPr9mnabnYQGSyvDMqGjO951K7RzZUUZZo7nESt+LhXV
 SW7cHYmJaK9vq3O/GehSZDWait9HuqZc8aRd9Yt3cZzoNCn2SEkvx4POx6WL+CHjCUUz
 Am6w==
X-Gm-Message-State: AGi0PuaejWOCq2Z4erWca6lB6bFCq6zFmuqQiERoIRbLQwxb8NAq96Jh
 xYNSaJduL/+IYEP7kB8zCG4=
X-Google-Smtp-Source: APiQypIR6IITNMggG/0rE4iTa20Cgo468VRjdfdsU+xo+ASWHi7PIHHcBx1BOuFM5MFFTt9mR477kg==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr1058459wrl.48.1586938154948; 
 Wed, 15 Apr 2020 01:09:14 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id x18sm21985707wrs.11.2020.04.15.01.09.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 01:09:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200414155942.3347-1-jgross@suse.com>
In-Reply-To: <20200414155942.3347-1-jgross@suse.com>
Subject: RE: [PATCH] docs: update xenstore migration design document
Date: Wed, 15 Apr 2020 09:09:12 +0100
Message-ID: <002701d612fd$26f1b950$74d52bf0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFbcicelFd+KtVwoWRd2uUiJ/nPAqlvCwVg
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
> Sent: 14 April 2020 17:00
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
> <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>
> Subject: [PATCH] docs: update xenstore migration design document
> 
> In the past there have been several attempts to make Xenstore
> restartable. This requires to transfer the internal Xenstore state to
> the new instance. With the Xenstore migration protocol added recently
> to Xen's documentation a first base has been defined to represent the
> state of Xenstore. This can be expanded a little bit in order to have
> a full state representation which is needed as a first step for live
> updating Xenstore.
> 
> Add some definitions to designs/xenstore-migration.md which are needed
> for live update of xenstored.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/designs/xenstore-migration.md | 90 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 87 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 6ab351e8fe..09bb4700b4 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -9,6 +9,10 @@ records must include details of registered xenstore watches as well as
>  content; information that cannot currently be recovered from `xenstored`,
>  and hence some extension to the xenstore protocol[2] will also be required.
> 
> +As a similar set of data is needed for transferring xenstore data from
> +one instance to another when live updating xenstored the same definitions
> +are being used.
> +

That makes sense, but using an external entity to extract the state makes less sense in the context of live update so, going
forward, I suggest dropping the section on extra commands.
Also, we should define a separate 'xenstore domain image format' which can be included as an opaque entity in the migration stream,
in the same way as the qemu save image.

>  The *libxenlight Domain Image Format* specification[3] already defines a
>  record type `EMULATOR_XENSTORE_DATA` but this is not suitable for
>  transferring xenstore data pertaining to the domain directly as it is
> @@ -48,7 +52,10 @@ where type is one of the following values
>  |        | 0x00000001: NODE_DATA                            |
>  |        | 0x00000002: WATCH_DATA                           |
>  |        | 0x00000003: TRANSACTION_DATA                     |
> -|        | 0x00000004 - 0xFFFFFFFF: reserved for future use |
> +|        | 0x00000004: TRANSACTION_NODE_DATA                |
> +|        | 0x00000005: GUEST_RING_DATA                      |
> +|        | 0x00000006: DOMAIN_START (live update only)      |
> +|        | 0x00000007 - 0xFFFFFFFF: reserved for future use |
> 
> 
>  and data is one of the record data formats described in the following
> @@ -79,7 +86,7 @@ as follows:
>  +-------------------------------+
>  | perm count (N)                |
>  +-------------------------------+
> -| perm0                         |
> +| perm1                         |
>  +-------------------------------+
>  ...
>  +-------------------------------+
> @@ -93,7 +100,7 @@ as follows:
>  +-------------------------------+
>  ```
> 
> -where perm0..N are formatted as follows:
> +where perm1..N are formatted as follows:
> 
> 
>  ```
> @@ -164,6 +171,83 @@ as follows:
>  where tx_id is the non-zero identifier values of an open transaction.
> 
> 
> +**TRANSACTION_NODE_DATA**
> +
> +
> +Each TRANSACTION_NODE_DATA record specifies a transaction local xenstore
> +node. Its is similar to the NODE_DATA record with the addition of a
> +transaction id:
> +
> +```
> +    0       1       2       3     octet
> ++-------+-------+-------+-------+
> +| TRANSACTION_NODE_DATA         |
> ++-------------------------------+
> +| tx_id                         |
> ++-------------------------------+
> +| path length                   |
> ++-------------------------------+
> +| path data                     |
> +...
> +| pad (0 to 3 octets)           |
> ++-------------------------------+
> +| perm count (N)                |
> ++-------------------------------+
> +| perm1                         |
> ++-------------------------------+
> +...
> ++-------------------------------+
> +| permN                         |
> ++-------------------------------+
> +| value length                  |
> ++-------------------------------+
> +| value data                    |
> +...
> +| pad (0 to 3 octets)           |
> ++-------------------------------+
> +```
> +
> +where perm1..N are formatted as specified in the NODE_DATA record. A perm
> +count of 0 denotes a node having been deleted in the transaction.
> +

Transferring this state means we can presumably drop the TRANSACTION_DATA, since we can infer open transactions from the presence of
these records?

> +
> +**GUEST_RING_DATA**
> +
> +
> +The GUEST_RING_DATA record is used to transfer data which is pending to be
> +written to the guest's xenstore ring buffer. It si formatted as follows:
> +
> +
> +```
> ++-------+-------+-------+-------+
> +| GUEST_RING_DATA               |
> ++-------------------------------+
> +| value length                  |
> ++-------------------------------+
> +| value data                    |
> +...
> +| pad (0 to 3 octets)           |
> ++-------------------------------+
> +```
> +
> +**DOMAIN_START**
> +
> +
> +For live updating xenstored data of multiple domains needs to be transferred.
> +For this purpose the DOMAIN_START record is being used. All records of types
> +other than NODE_DATA always relate to the last DOMAIN_START record in the
> +stream. A DOMAIN_START record just contains a domain-id:

If we define a separate stream format as I suggest above, I'd expect the domain-id to be part of the header.

> +
> +
> +```
> ++-------+-------+-------+-------+
> +| DOMAIN_START                  |
> ++-------------------------------+
> +| domid         | pad           |
> ++-------------------------------+
> +```
> +
> +
>  ### Protocol Extension

As mentioned above, this section ought to be dropped for the moment. We should define the ways in which xenstored should dump state
in various scenarios: e.g. for LU it will likely be serialize to memory (possibly dev/shmem?), for migration/save-restore it will
probably be serialize to fd (socket/file). We should also define how dumping state will be triggered.

  Paul


