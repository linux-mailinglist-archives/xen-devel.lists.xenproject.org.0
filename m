Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C4A38066A
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 11:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127290.239219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUKt-0000oB-Nq; Fri, 14 May 2021 09:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127290.239219; Fri, 14 May 2021 09:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUKt-0000ka-Jh; Fri, 14 May 2021 09:42:23 +0000
Received: by outflank-mailman (input) for mailman id 127290;
 Fri, 14 May 2021 09:42:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDpF=KJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lhUKs-0000jv-6P
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 09:42:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ce2e103-085a-4205-bafe-4c208ab0b78e;
 Fri, 14 May 2021 09:42:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED311B15A;
 Fri, 14 May 2021 09:42:18 +0000 (UTC)
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
X-Inumbo-ID: 1ce2e103-085a-4205-bafe-4c208ab0b78e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620985339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q172meoakAbkZf2higsfk3dmMCEQ9Vow2IpeO8dgoSk=;
	b=eq1sZFDLP2o6ied94pExxPmSlt6HpYPtJafkH5URZXyZvFsDGJryzcb6nAgaeGu/VsbmlH
	SIxxwQM2bdO/NsxKjXxI8/E7frVhmtBTQg/Vz5puTgATqkfeP/Yq+m9qVKkQB9ZL4Mh/Dr
	7DQJVzl1bIEA5oW2u++M3hNb92j1NHo=
Subject: Re: [PATCH] tools/xenstore: simplify xenstored main loop
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210514083905.18212-1-jgross@suse.com>
 <304944cf-ac92-be14-e088-1975ef073255@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3be1937f-3cd9-3eb8-48fd-bc9c9a85c051@suse.com>
Date: Fri, 14 May 2021 11:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <304944cf-ac92-be14-e088-1975ef073255@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CYGYGRGGH1Jj5YX63YFP1i7kmLiSTbNs5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CYGYGRGGH1Jj5YX63YFP1i7kmLiSTbNs5
Content-Type: multipart/mixed; boundary="wAO9iePUs26Q35umTs4dTT6P6H9ilRvbx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <3be1937f-3cd9-3eb8-48fd-bc9c9a85c051@suse.com>
Subject: Re: [PATCH] tools/xenstore: simplify xenstored main loop
References: <20210514083905.18212-1-jgross@suse.com>
 <304944cf-ac92-be14-e088-1975ef073255@xen.org>
In-Reply-To: <304944cf-ac92-be14-e088-1975ef073255@xen.org>

--wAO9iePUs26Q35umTs4dTT6P6H9ilRvbx
Content-Type: multipart/mixed;
 boundary="------------C8E25EB28BB00EF812C59CC6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C8E25EB28BB00EF812C59CC6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.05.21 11:35, Julien Grall wrote:
> Hi,
>=20
> On 14/05/2021 09:39, Juergen Gross wrote:
>> The main loop of xenstored is rather complicated due to different
>> handling of socket and ring-page interfaces. Unify that handling by
>> introducing interface type specific functions can_read() and
>> can_write().
>>
>> Put the interface type specific functions in an own structure and let
>> struct connection contain only a pointer to that new function vector.
> I would split the renaming in a separate patch. This would be easier to=
=20
> review and remove some churn from this patch.

Okay, I'll split the patch.

>=20
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> =C2=A0 tools/xenstore/xenstored_core.c=C2=A0=C2=A0 | 117 +++++++++++++=
+----------------
>> =C2=A0 tools/xenstore/xenstored_core.h=C2=A0=C2=A0 |=C2=A0 19 ++---
>> =C2=A0 tools/xenstore/xenstored_domain.c |=C2=A0 11 ++-
>> =C2=A0 3 files changed, 73 insertions(+), 74 deletions(-)
>>
>> diff --git a/tools/xenstore/xenstored_core.c=20
>> b/tools/xenstore/xenstored_core.c
>> index 4b7b71cfb3..b66d119a98 100644
>> --- a/tools/xenstore/xenstored_core.c
>> +++ b/tools/xenstore/xenstored_core.c
>> @@ -226,8 +226,8 @@ static bool write_messages(struct connection *conn=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sockmsg_string(out->hdr.msg.type),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out->hdr.msg.len,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out->buffer, conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D conn->write(conn, =
out->hdr.raw + out->used,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(out->hdr) - out->used);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D conn->funcs->write=
(conn, out->hdr.raw + out->used,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(out->hdr) - ou=
t->used);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return false;
>> @@ -243,8 +243,8 @@ static bool write_messages(struct connection *conn=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 ret =3D conn->write(conn, out->buffer + out->used,=

>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 out->hdr.msg.len - out->used);
>> +=C2=A0=C2=A0=C2=A0 ret =3D conn->funcs->write(conn, out->buffer + out=
->used,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 out->hdr.msg.len - out->used);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> @@ -1531,8 +1531,8 @@ static void handle_input(struct connection *conn=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Not finished header yet? */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (in->inhdr) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (in->used !=3D=
 sizeof(in->hdr)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by=
tes =3D conn->read(conn, in->hdr.raw + in->used,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(in=
->hdr) - in->used);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by=
tes =3D conn->funcs->read(conn, in->hdr.raw + in->used,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sizeof(in->hdr) - in->used);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (bytes < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto bad_client;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 in->used +=3D bytes;
>> @@ -1557,8 +1557,8 @@ static void handle_input(struct connection *conn=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in->inhdr =3D f=
alse;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 bytes =3D conn->read(conn, in->buffer + in->used,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 in->hdr.msg.len - in->used);
>> +=C2=A0=C2=A0=C2=A0 bytes =3D conn->funcs->read(conn, in->buffer + in-=
>used,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in->hdr.msg.len - in->used);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bytes < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto bad_client=
;
>> @@ -1581,7 +1581,7 @@ static void handle_output(struct connection *con=
n)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ignore_connecti=
on(conn);
>> =C2=A0 }
>> -struct connection *new_connection(connwritefn_t *write, connreadfn_t =

>> *read)
>> +struct connection *new_connection(struct interface_funcs *funcs)
>=20
> I don't think the interface is meant to be changed after the connection=
=20
> is created. So this should be const.

Yes.

>=20
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct connection *new;
>> @@ -1591,8 +1591,7 @@ struct connection *new_connection(connwritefn_t =

>> *write, connreadfn_t *read)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new->fd =3D -1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new->pollfd_idx =3D -1;
>> -=C2=A0=C2=A0=C2=A0 new->write =3D write;
>> -=C2=A0=C2=A0=C2=A0 new->read =3D read;
>> +=C2=A0=C2=A0=C2=A0 new->funcs =3D funcs;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new->is_ignored =3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new->transaction_started =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&new->out_list);
>> @@ -1622,17 +1621,7 @@ static void accept_connection(int sock)
>> =C2=A0 {
>> =C2=A0 }
>> -int writefd(struct connection *conn, const void *data, unsigned int l=
en)
>> -{
>> -=C2=A0=C2=A0=C2=A0 errno =3D EBADF;
>> -=C2=A0=C2=A0=C2=A0 return -1;
>> -}
>> -
>> -int readfd(struct connection *conn, void *data, unsigned int len)
>> -{
>> -=C2=A0=C2=A0=C2=A0 errno =3D EBADF;
>> -=C2=A0=C2=A0=C2=A0 return -1;
>> -}
>> +struct interface_funcs socket_funcs;
>=20
> AFAICT, this is defined for mini-os because read_state_connection() may=
=20
> use it. The assumption here is XS_STATE_CONN_TYPE_SOCKET will never sho=
w=20
> up in the stream.
>=20
> If there is any mistake in the stream, this could lead to dereference=20
> NULL and crash after. AFAICT, before, we would just ignore the connecti=
on.
>=20
> I think it would be best if sockets_funcs() is not defined at all or we=
=20
> continue to ignore the connection. This can be probably done by=20
> implementing dummy callback for can_write/can_read.

Hmm, yes. I can put the referencing part inside #ifdef NO_SOCKETS.

>=20
>> =C2=A0 #else
>> =C2=A0 int writefd(struct connection *conn, const void *data, unsigned=
 int=20
>> len)
>> =C2=A0 {
>> @@ -1672,6 +1661,29 @@ int readfd(struct connection *conn, void *data,=
=20
>> unsigned int len)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>> =C2=A0 }
>> +static bool socket_can_process(struct connection *conn, int mask)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (conn->pollfd_idx =3D=3D -1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (fds[conn->pollfd_idx].revents & ~(POLLIN | POL=
LOUT)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 talloc_free(conn);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return (fds[conn->pollfd_idx].revents & mask) && !=
conn->is_ignored;
>> +}
>> +
>> +static bool socket_can_write(struct connection *conn)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return socket_can_process(conn, POLLOUT);
>> +}
>> +
>> +static bool socket_can_read(struct connection *conn)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return socket_can_process(conn, POLLIN);
>> +}
>> +
>> =C2=A0 static void accept_connection(int sock)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int fd;
>> @@ -1681,12 +1693,19 @@ static void accept_connection(int sock)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fd < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> -=C2=A0=C2=A0=C2=A0 conn =3D new_connection(writefd, readfd);
>> +=C2=A0=C2=A0=C2=A0 conn =3D new_connection(&socket_funcs);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (conn)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conn->fd =3D fd=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 close(fd);
>> =C2=A0 }
>> +
>> +struct interface_funcs socket_funcs =3D {
>=20
> This should be const.

Yes.

>=20
>> +=C2=A0=C2=A0=C2=A0 .write =3D writefd,
>> +=C2=A0=C2=A0=C2=A0 .read =3D readfd,
>> +=C2=A0=C2=A0=C2=A0 .can_write =3D socket_can_write,
>> +=C2=A0=C2=A0=C2=A0 .can_read =3D socket_can_read,
>> +};
>> =C2=A0 #endif
>> =C2=A0 static int tdb_flags;
>> @@ -2304,47 +2323,19 @@ int main(int argc, char *argv[])
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (&next->list !=3D &connections)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 talloc_increase_ref_count(next);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (conn->domain) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (domain_can_read(conn))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle_input(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (talloc_free(conn) =3D=3D 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 talloc_increase_ref_count(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (domain_can_write(conn) &&
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !list_empty(&conn->out_list=
))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle_output(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (talloc_free(conn) =3D=3D 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } =
else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (conn->pollfd_idx !=3D -1) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fds[conn->pollfd_idx].r=
events
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 & ~=
(POLLIN|POLLOUT))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tal=
loc_free(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ((fds[conn->pollfd_=
idx].revents
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 & POLLIN) &&
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 !conn->is_ignored)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 han=
dle_input(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (talloc_free(conn) =3D=3D 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 talloc_increase_ref_count(conn);
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (conn->pollfd_idx !=3D -1) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fds[conn->pollfd_idx].r=
events
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 & ~=
(POLLIN|POLLOUT))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tal=
loc_free(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ((fds[conn->pollfd_=
idx].revents
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 & POLLOUT) &&
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 !conn->is_ignored)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 han=
dle_output(conn);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (talloc_free(conn) =3D=3D 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (conn->funcs->can_read(conn))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 handle_input(conn);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (talloc_free(conn) =3D=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 conn->pollfd_idx =3D -1;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ta=
lloc_increase_ref_count(conn);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (conn->funcs->can_write(conn))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 handle_output(conn);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (talloc_free(conn) =3D=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
nn->pollfd_idx =3D -1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (delayed_req=
uests) {
>> diff --git a/tools/xenstore/xenstored_core.h=20
>> b/tools/xenstore/xenstored_core.h
>> index 6a6d0448e8..1467270476 100644
>> --- a/tools/xenstore/xenstored_core.h
>> +++ b/tools/xenstore/xenstored_core.h
>> @@ -86,8 +86,13 @@ struct delayed_request {
>> =C2=A0 };
>> =C2=A0 struct connection;
>> -typedef int connwritefn_t(struct connection *, const void *, unsigned=
=20
>> int);
>> -typedef int connreadfn_t(struct connection *, void *, unsigned int);
>> +
>> +struct interface_funcs {
>> +=C2=A0=C2=A0=C2=A0 int (*write)(struct connection *, const void *, un=
signed int);
>> +=C2=A0=C2=A0=C2=A0 int (*read)(struct connection *, void *, unsigned =
int);
>> +=C2=A0=C2=A0=C2=A0 bool (*can_write)(struct connection *);
>> +=C2=A0=C2=A0=C2=A0 bool (*can_read)(struct connection *);
>> +};
>> =C2=A0 struct connection
>> =C2=A0 {
>> @@ -131,9 +136,8 @@ struct connection
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* My watches. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head watches;
>> -=C2=A0=C2=A0=C2=A0 /* Methods for communicating over this connection:=
 write can be=20
>> NULL */
>> -=C2=A0=C2=A0=C2=A0 connwritefn_t *write;
>> -=C2=A0=C2=A0=C2=A0 connreadfn_t *read;
>> +=C2=A0=C2=A0=C2=A0 /* Methods for communicating over this connection.=
 */
>> +=C2=A0=C2=A0=C2=A0 struct interface_funcs *funcs;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Support for live update: connection =
id. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int conn_id;
>> @@ -196,7 +200,7 @@ int write_node_raw(struct connection *conn,=20
>> TDB_DATA *key, struct node *node,
>> =C2=A0 struct node *read_node(struct connection *conn, const void *ctx=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const char *name);
>> -struct connection *new_connection(connwritefn_t *write, connreadfn_t =

>> *read);
>> +struct connection *new_connection(struct interface_funcs *funcs);
>> =C2=A0 struct connection *get_connection_by_id(unsigned int conn_id);
>> =C2=A0 void check_store(void);
>> =C2=A0 void corrupt(struct connection *conn, const char *fmt, ...);
>> @@ -254,9 +258,6 @@ void finish_daemonize(void);
>> =C2=A0 /* Open a pipe for signal handling */
>> =C2=A0 void init_pipe(int reopen_log_pipe[2]);
>> -int writefd(struct connection *conn, const void *data, unsigned int=20
>> len);
>> -int readfd(struct connection *conn, void *data, unsigned int len);
>> -
>> =C2=A0 extern struct interface_funcs socket_funcs;
>=20
> Hmmm... I guess this change splipped in the staging before hand?

No, I just forgot to make the functions static.


Juergen

--------------C8E25EB28BB00EF812C59CC6
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------C8E25EB28BB00EF812C59CC6--

--wAO9iePUs26Q35umTs4dTT6P6H9ilRvbx--

--CYGYGRGGH1Jj5YX63YFP1i7kmLiSTbNs5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCeRfoFAwAAAAAACgkQsN6d1ii/Ey/X
uwf/TgzRZlpWX3ksv1rT24759SrwgfqpNQL4VOpJt+qVwaYU/u4sP79KniHHw0WWvtSdL9Yf4ioL
3e/z9N82TP/1FSzSxxs0fm+wEuKsJ2TpZLDm3ybDdEM3lwsPFv7S2aFh6szF+qKQlONR1+FLERGg
vfMRod0q0+WIjWDBMYw9twf/WNOu2STXV6MLfjaJ04Wybata4vbNmk9qB/kxPxH/DwHYqeIrp5AA
KlB+3exx9e4uI1iQpY7qE3P+xIAdF9PkB39cEiWuEF5uVfKz+qvkoJHbAu3wusq5t35+LZlGQyLG
Qn0IXZmepfOVzcCf1oMXlf1Jh+BmYPJdZQKU8Lfbbg==
=ZmN7
-----END PGP SIGNATURE-----

--CYGYGRGGH1Jj5YX63YFP1i7kmLiSTbNs5--

